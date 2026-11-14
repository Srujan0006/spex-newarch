(** Reference model of one bit lane, in plain OCaml, written from ENGINE.md (Bit lanes)
    separately from the RTL ([Lane]). The lane lockstep test compares the two every
    cycle; the engine model ([Model]) uses this model for its lanes. *)

open! Base
open Layout

type mode =
  | Idle
  | Armed
  | Run
  | Done
[@@deriving sexp_of, equal]

type t =
  { mutable mode : mode
  ; mutable ph : int
  ; mutable acc : int
  ; mutable extra : int
  ; mutable cnt : int
  ; mutable bitpos : int
  ; mutable byte : int
  ; mutable crc : int
  ; mutable crc_left : int
  ; mutable crc_bad : bool
  ; mutable run : int
  ; mutable last : int
  ; mutable sr : int
  ; mutable out : int
  ; mutable cur : int
  ; mutable prev : int
  ; mutable crc_ok : bool
  ; mutable sync_hit : bool
  ; mutable error : bool
  ; mutable kind : int (* {lost arbitration, bit error, stuff error} *)
  ; mutable len_cap : bool (* RX: the length field's last bit came in the previous step *)
  ; mutable len_known : bool
  ; mutable lim : int (* the data length the field gave, once known and below frame_bits *)
  ; mutable resid_chk : bool (* CRC residual: a byte was pushed in the previous step *)
  }

let create () =
  { mode = Idle
  ; ph = 0
  ; acc = 0
  ; extra = 0
  ; cnt = 0
  ; bitpos = 0
  ; byte = 0
  ; crc = 0
  ; crc_left = 0
  ; crc_bad = false
  ; run = 0
  ; last = 1
  ; sr = 0
  ; out = 1
  ; cur = 0
  ; prev = 1
  ; crc_ok = false
  ; sync_hit = false
  ; error = false
  ; kind = 0
  ; len_cap = false
  ; len_known = false
  ; lim = 0
  ; resid_chk = false
  }
;;

type cmd =
  { go : bool
  ; end_ : bool
  ; crc : bool
  ; reset : bool
  }

let no_cmd = { go = false; end_ = false; crc = false; reset = false }

(** What the lane shows this cycle, and what it does to the FIFOs. *)
type step =
  { pop : bool
  ; push : int option
  ; lost : bool (** reset (or stop) dropped a partial RX byte *)
  }

let bit v k = (v lsr k) land 1

(** Armed or Run: the host may not write this lane's CSRs. *)
let active t =
  match t.mode with
  | Armed | Run -> true
  | Idle | Done -> false
;;

let flags t =
  [ Bool.equal (equal_mode t.mode Done) true; t.crc_ok; t.sync_hit; t.error ]
;;

(** One cycle. [tx_head] is the TX FIFO head ([None] when empty). *)
let step t (c : int Lane_cfg.t) (k : cmd) ~pins_s ~pins_q ~tx_head =
  let rx = c.dir = 1 in
  let mode0 = t.mode in
  let resid = c.crc_resid = 1 in
  let crc0 = t.crc in
  let d = bit pins_s c.data_pin in
  let dedge = d <> bit pins_q c.data_pin in
  let cedge =
    let s = bit pins_s c.clk_pin
    and q = bit pins_q c.clk_pin in
    if c.clk_edge = 1 then q = 1 && s = 0 else s = 1 && q = 0
  in
  let clk_mode = c.clk_pin_en = 1 in
  (* bit timing: an RX lane resynchronises to a change on its data pin *)
  let edge = rx && dedge && not clk_mode in
  let manch = c.code = Code.manchester in
  let armed = equal_mode t.mode Armed in
  let timing_on =
    match t.mode with
    | Run | Done -> true
    | Armed -> edge
    | Idle -> false
  in
  let mid = c.div_int lsr 1 in
  let samp_pt = if rx && manch then mid + (c.div_int lsr 2) else mid in
  let e =
    if edge && (armed || not manch)
    then 0 (* a bit start *)
    else if edge && manch && t.ph >= c.div_int lsr 2 && t.ph < samp_pt
    then mid (* the mid-bit transition *)
    else t.ph
  in
  let start, sample, last_cycle =
    if clk_mode
    then cedge, cedge, false
    else e = 0, e = samp_pt, e = c.div_int + t.extra - 1
  in
  if timing_on && not clk_mode
  then
    if last_cycle
    then (
      let s = t.acc + c.div_frac in
      t.ph <- 0;
      t.acc <- s land 0xFF;
      t.extra <- s lsr 8)
    else t.ph <- (e + 1) land 0xFFFF;
  if armed && edge then t.mode <- Run;
  let in_run = equal_mode t.mode Run in
  let stuff_due = c.stuff <> 0 && t.run = c.stuff_len in
  let stuff_bit = if c.stuff = 1 then 1 - t.last else 0 in
  let count slot =
    t.run
    <- (if c.stuff = 2
        then if slot = 1 then (t.run + 1) land 7 else 0
        else if t.run <> 0 && slot = t.last
        then (t.run + 1) land 7
        else 1);
    t.last <- slot
  in
  let crc_update b =
    let fb = b lxor bit t.crc 31 in
    t.crc <- ((t.crc lsl 1) lxor if fb = 1 then c.poly else 0) land 0xFFFF_FFFF
  in
  let crc_bit () = bit t.crc 31 lxor c.crc_inv in
  let limit = if t.len_known then t.lim else c.frame_bits in
  let pop = ref false in
  let push = ref None in
  let became_done = ref false in
  let len_now = ref false in
  let pushed = ref false in
  (* TX: pick the slot at a bit start *)
  if in_run && (not rx) && start
  then (
    let data_avail = t.cnt < limit in
    if stuff_due
    then (
      count stuff_bit;
      t.cur <- stuff_bit;
      t.out <- (match c.code with 1 -> if stuff_bit = 1 then t.out else 1 - t.out | 2 -> 1 - stuff_bit | _ -> stuff_bit))
    else if data_avail
    then (
      if t.bitpos = 0
      then (
        match tx_head with
        | Some b ->
          t.byte <- b;
          pop := true
        | None -> t.byte <- 0xFF);
      let slot = if c.lsb_first = 1 then bit t.byte t.bitpos else bit t.byte (7 - t.bitpos) in
      crc_update slot;
      t.cnt <- t.cnt + 1;
      t.bitpos <- (t.bitpos + 1) land 7;
      count slot;
      t.cur <- slot;
      t.out <- (match c.code with 1 -> if slot = 1 then t.out else 1 - t.out | 2 -> 1 - slot | _ -> slot))
    else if t.crc_left > 0
    then (
      let slot = crc_bit () in
      t.crc <- (t.crc lsl 1) land 0xFFFF_FFFF;
      t.crc_left <- t.crc_left - 1;
      count slot;
      t.cur <- slot;
      t.out <- (match c.code with 1 -> if slot = 1 then t.out else 1 - t.out | 2 -> 1 - slot | _ -> slot))
    else (
      t.mode <- Done;
      t.out <- 1;
      became_done := true));
  (* Manchester TX: second half of the bit *)
  if in_run && (not rx) && c.code = Code.manchester && sample && not start then t.out <- t.cur;
  (* TX readback *)
  if in_run
     && (not rx)
     && c.readback = 1
     && (not clk_mode)
     && c.code <> Code.manchester
     && sample
     && d <> t.out
  then (
    t.error <- true;
    t.kind <- (if t.out = 1 then 4 else 2);
    t.mode <- Idle;
    t.out <- 1);
  (* RX: the bit at a sample point *)
  if in_run && rx && sample
  then (
    let b = if c.code = Code.nrzi then Bool.to_int (d = t.prev) else d in
    if c.code = Code.nrzi then t.prev <- d;
    let finish () =
      (* Done once the frame and its CRC are in and no stuff bit is due *)
      if t.cnt = limit
         && t.crc_left = 0
         && not (c.stuff <> 0 && t.run = c.stuff_len)
      then (
        t.mode <- Done;
        became_done := true)
    in
    if stuff_due
    then
      if b <> stuff_bit
      then (
        t.error <- true;
        t.kind <- 1;
        t.mode <- Idle)
      else (
        count b;
        finish ())
    else (
      count b;
      t.sr <- ((t.sr lsl 1) lor b) land 0xFFFF;
      if (not resid) && (t.sr lxor c.sync) land c.sync_mask = 0 then t.sync_hit <- true;
      if t.cnt < limit
      then (
        (* CRC residual mode: data bits below [len_pos] stay out of the CRC *)
        if (not resid) || t.cnt >= c.len_pos then crc_update b;
        (* bits before [skip]: CRC and sr only; the length field ends at [len_pos] *)
        if t.cnt >= c.skip
        then (
          t.byte <- (if c.lsb_first = 1 then (b lsl 7) lor (t.byte lsr 1) else ((t.byte lsl 1) lor b) land 0xFF);
          if t.bitpos = 7
          then (
            push := Some t.byte;
            pushed := true);
          t.bitpos <- (t.bitpos + 1) land 7);
        if c.len_en = 1 && (not resid) && t.cnt = c.len_pos then len_now := true;
        t.cnt <- t.cnt + 1)
      else if t.crc_left > 0
      then (
        t.crc_bad <- t.crc_bad || b <> crc_bit ();
        t.crc <- (t.crc lsl 1) land 0xFFFF_FFFF;
        t.crc_left <- t.crc_left - 1;
        if t.crc_left = 0 then t.crc_ok <- not t.crc_bad);
      finish ()));
  (* the length, a step after the field's last bit: skip + 8 min(field, len_max),
     used when below frame_bits *)
  if t.len_cap
  then (
    let l = c.skip + (8 * min (t.sr land 0xF) c.len_max) in
    if l < c.frame_bits
    then (
      t.lim <- l;
      t.len_known <- true));
  t.len_cap <- !len_now;
  (* CRC residual: the result for the byte pushed in the previous step, from the CRC as
     this step found it *)
  if t.resid_chk
  then t.crc_ok <- ((crc0 lsr 16) lxor c.sync) land c.sync_mask = 0;
  t.resid_chk <- !pushed && resid && (not k.go) && not k.reset;
  (* commands, after this cycle's step *)
  let lost =
    k.reset
    && (not k.end_)
    && rx
    && (equal_mode mode0 Run || equal_mode mode0 Done)
    && t.bitpos <> 0
    && not !pushed
  in
  if k.end_
  then (
    if rx && t.bitpos <> 0 && not !pushed then push := Some t.byte;
    t.mode <- Idle;
    t.out <- 1);
  if k.crc
  then (
    t.crc_left <- c.crc_width;
    if equal_mode t.mode Done || !became_done then t.mode <- Run);
  if k.go
  then (
    t.mode <- (if rx && not clk_mode then Armed else Run);
    t.ph <- 0;
    t.acc <- 0;
    t.extra <- 0;
    t.cnt <- 0;
    t.bitpos <- 0;
    t.crc <- c.init;
    t.crc_left <- 0;
    t.crc_bad <- false;
    t.run <- 0;
    t.last <- 1;
    t.prev <- 1;
    t.sr <- 0;
    t.out <- 1;
    t.len_cap <- false;
    t.len_known <- false;
    t.crc_ok <- false;
    t.sync_hit <- false;
    t.error <- false;
    t.kind <- 0);
  if k.reset
  then (
    t.mode <- Idle;
    t.out <- 1;
    t.crc <- 0;
    t.crc_ok <- false;
    t.sync_hit <- false;
    t.error <- false;
    t.kind <- 0);
  { pop = !pop; push = !push; lost }
;;
