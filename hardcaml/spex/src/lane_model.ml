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
  let pop = ref false in
  let push = ref None in
  let became_done = ref false in
  let pushed = ref false in
  (* TX: pick the slot at a bit start *)
  if in_run && (not rx) && start
  then (
    let data_avail = t.cnt < c.frame_bits in
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
      if t.cnt = c.frame_bits
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
      if (t.sr lxor c.sync) land c.sync_mask = 0 then t.sync_hit <- true;
      if t.cnt < c.frame_bits
      then (
        crc_update b;
        t.byte <- (if c.lsb_first = 1 then (b lsl 7) lor (t.byte lsr 1) else ((t.byte lsl 1) lor b) land 0xFF);
        t.cnt <- t.cnt + 1;
        if t.bitpos = 7
        then (
          push := Some t.byte;
          pushed := true);
        t.bitpos <- (t.bitpos + 1) land 7)
      else if t.crc_left > 0
      then (
        t.crc_bad <- t.crc_bad || b <> crc_bit ();
        t.crc <- (t.crc lsl 1) land 0xFFFF_FFFF;
        t.crc_left <- t.crc_left - 1;
        if t.crc_left = 0 then t.crc_ok <- not t.crc_bad);
      finish ()));
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
