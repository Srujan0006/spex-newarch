(** Cycle-accurate reference model of the SPEX engine, in plain OCaml.

    Written separately from [Engine] from the same semantics document (ENGINE.md),
    so that a lockstep test between the two catches RTL bugs. It shares only the
    record layout ([Layout]) with the RTL. *)

open! Base
open Layout

type inputs =
  { pins_in : int
  ; start : bool
  ; stop : bool
  ; role : int
  ; start_loc : int
  ; recover_loc : int
  ; cover_en : bool
  ; open_drain : int
  ; match_addr : int
  ; irq_ack : bool
  ; rec_we : bool
  ; rec_waddr : int
  ; rec_wdata : Hardcaml.Bits.t
  ; tx_push : bool
  ; tx_data : int
  ; rx_pop : bool
  ; vlog_pop : bool
  ; cov_addr : int
  ; cov_we : bool
  ; cov_wdata : int
  ; lane0 : int Lane_cfg.t
  ; lane1 : int Lane_cfg.t
  ; pin_src : int
  }

let zero_lane_cfg = Lane_cfg.map Lane_cfg.port_widths ~f:(fun _ -> 0)

let idle_inputs =
  { pins_in = 0
  ; start = false
  ; stop = false
  ; role = 0
  ; start_loc = 0
  ; recover_loc = 0
  ; cover_en = false
  ; open_drain = 0
  ; match_addr = 0
  ; irq_ack = false
  ; rec_we = false
  ; rec_waddr = 0
  ; rec_wdata = Hardcaml.Bits.zero beat_bits
  ; tx_push = false
  ; tx_data = 0
  ; rx_pop = false
  ; vlog_pop = false
  ; cov_addr = 0
  ; cov_we = false
  ; cov_wdata = 0
  ; lane0 = zero_lane_cfg
  ; lane1 = zero_lane_cfg
  ; pin_src = 0
  }
;;

(** What the RTL shows on its outputs (pins and [Engine.Status]). *)
type outputs =
  { pins_out : int
  ; pins_oe : int
  ; running : bool
  ; in_entry : bool
  ; cur_loc : int
  ; accepting : bool
  ; taken : bool
  ; taken_edge : int
  ; viol : bool
  ; viol_kind : int
  ; timestamp : int
  ; tx_full : bool
  ; tx_empty : bool
  ; rx_data : int
  ; rx_empty : bool
  ; vlog_data : int
  ; vlog_empty : bool
  ; cov_rdata : int
  ; irq : bool
  ; halted_viol : bool
  ; rx_overflow : bool
  ; vlog_overflow : bool
  ; cov_overrun : bool
  ; lane_status : int
  }
[@@deriving sexp_of, equal]

type phase =
  | Idle
  | Fetch of int
  | Eval

type t =
  { rec_mem : Hardcaml.Bits.t array
  ; cov_mem : int array
  ; mutable rec_rdata : Hardcaml.Bits.t
  ; mutable cov_rdata : int
  ; mutable sync1 : int
  ; mutable pins_s : int
  ; mutable pins_q : int
  ; mutable phase : phase
  ; mutable cur_loc : int
  ; mutable role : int
  ; beats : Hardcaml.Bits.t array
  ; mutable hdr : int Header.t
  ; mutable edges : int Edge.t array
  ; mutable changed : int
  ; mutable multi : int (* pins that changed again before EVAL (AMBIGUOUS) *)
  ; ages2 : int array (* age of each pin's second change *)
  ; ages : int array
  ; clocks : int array
  ; mutable pout : int
  ; mutable poe : int
  ; mutable tx_sr : int
  ; mutable rx_sr : int
  ; mutable cnt : int
  ; mutable lfsr : int
  ; mutable to_logged : bool
  ; mutable halted_viol : bool
  ; mutable irq_flag : bool
  ; mutable rx_ovf : bool
  ; mutable vlog_ovf : bool
  ; mutable cov_ovr : bool
  ; mutable timestamp : int
  ; tx_fifo : int Queue.t
  ; rx_fifo : int Queue.t
  ; vlog_fifo : int Queue.t
  ; mutable taken : bool
  ; mutable taken_edge : int
  ; mutable viol : bool
  ; mutable viol_kind : int
  ; lanes : Lane_model.t array
  ; rx_wait : int option array (* lane 1, engine: one-entry wait buffers *)
  ; mutable pre : int
  ; (* coverage pipeline *)
    mutable s1 : (int * int) option (* addr, offset *)
  ; mutable s2 : (int * int * int * int) option (* addr, n, min, max *)
  }

let fifo_depth = 8

(** Bit lanes in the chip; must match [Engine.num_lanes]. *)
let num_lanes = 2

let decode_now t =
  let record = Hardcaml.Bits.concat_lsb (Array.to_list t.beats) in
  let hdr, edges = Spec.decode record in
  t.hdr <- hdr;
  t.edges <- edges
;;

let create () =
  let t =
    { rec_mem = Array.init 256 ~f:(fun _ -> Hardcaml.Bits.zero beat_bits)
    ; cov_mem = Array.create ~len:256 0
    ; rec_rdata = Hardcaml.Bits.zero beat_bits
    ; cov_rdata = 0
    ; sync1 = 0
    ; pins_s = 0
    ; pins_q = 0
    ; phase = Idle
    ; cur_loc = 0
    ; role = 0
    ; beats = Array.init beats ~f:(fun _ -> Hardcaml.Bits.zero beat_bits)
    ; hdr = Header.map Header.port_widths ~f:(fun _ -> 0)
    ; edges = [||]
    ; changed = 0
    ; multi = 0
    ; ages2 = Array.create ~len:8 0
    ; ages = Array.create ~len:8 0
    ; clocks = Array.create ~len:3 0
    ; pout = 0
    ; poe = 0
    ; tx_sr = 0
    ; rx_sr = 0
    ; cnt = 0
    ; lfsr = 0xACE1
    ; to_logged = false
    ; halted_viol = false
    ; irq_flag = false
    ; rx_ovf = false
    ; vlog_ovf = false
    ; cov_ovr = false
    ; timestamp = 0
    ; tx_fifo = Queue.create ()
    ; rx_fifo = Queue.create ()
    ; vlog_fifo = Queue.create ()
    ; taken = false
    ; taken_edge = 0
    ; viol = false
    ; viol_kind = 0
    ; lanes = Array.init num_lanes ~f:(fun _ -> Lane_model.create ())
    ; rx_wait = Array.create ~len:2 None
    ; pre = 0
    ; s1 = None
    ; s2 = None
    }
  in
  decode_now t;
  t
;;

let bit v k = (v lsr k) land 1 = 1
let b2i b = if b then 1 else 0
let in_idle t = match t.phase with Idle -> true | _ -> false

let lane_out t l = if l < num_lanes then t.lanes.(l).Lane_model.out else 1

(** ENGINE.md, Pins: the value of each pin by its source select. *)
let pin_values t (i : inputs) =
  List.init 8 ~f:(fun p ->
    let e = (t.pout lsr p) land 1
    and l0 = lane_out t 0
    and l1 = lane_out t 1 in
    let v =
      match (i.pin_src lsr (3 * p)) land 7 with
      | 0 -> e
      | 1 -> l0
      | 2 -> 1 - l0
      | 3 -> l0 land e
      | 4 -> (1 - l0) land e
      | 5 -> l1
      | 6 -> 1 - l1
      | _ -> l1 land e
    in
    v lsl p)
  |> List.fold ~init:0 ~f:( lor )
;;

let lane_status t =
  List.init 2 ~f:(fun l ->
    if l >= num_lanes
    then 0
    else (
      let s = t.lanes.(l) in
      let b x = if x then 1 else 0 in
      ((b (Lane_model.equal_mode s.mode Done) lsl 7)
       lor (b s.crc_ok lsl 6)
       lor (b s.sync_hit lsl 5)
       lor (b s.error lsl 4)
       lor s.kind)
      lsl (8 * l)))
  |> List.fold ~init:0 ~f:( lor )
;;

let outputs t (i : inputs) =
  let v = pin_values t i in
  { pins_out = v land lnot i.open_drain land 0xFF
  ; pins_oe = t.poe land lnot (i.open_drain land v) land 0xFF
  ; running = not (in_idle t)
  ; in_entry = (match t.phase with Fetch _ -> true | _ -> false)
  ; cur_loc = t.cur_loc
  ; accepting = (match t.phase with Eval -> t.hdr.accepting = 1 | _ -> false)
  ; taken = t.taken
  ; taken_edge = t.taken_edge
  ; viol = t.viol
  ; viol_kind = t.viol_kind
  ; timestamp = t.timestamp
  ; tx_full = Queue.length t.tx_fifo = fifo_depth
  ; tx_empty = Queue.is_empty t.tx_fifo
  ; rx_data = Option.value (Queue.peek t.rx_fifo) ~default:0
  ; rx_empty = Queue.is_empty t.rx_fifo
  ; vlog_data = Option.value (Queue.peek t.vlog_fifo) ~default:0
  ; vlog_empty = Queue.is_empty t.vlog_fifo
  ; cov_rdata = t.cov_rdata
  ; irq =
      (not (Queue.is_empty t.rx_fifo))
      || (not (Queue.is_empty t.vlog_fifo))
      || t.halted_viol
      || t.irq_flag
  ; halted_viol = t.halted_viol
  ; rx_overflow = t.rx_ovf
  ; vlog_overflow = t.vlog_ovf
  ; cov_overrun = t.cov_ovr
  ; lane_status = lane_status t
  }
;;

let reverse8 v =
  let r = ref 0 in
  for k = 0 to 7 do
    if bit v k then r := !r lor (1 lsl (7 - k))
  done;
  !r
;;

let clock_sel t c = t.clocks.(if c = 3 then 2 else c)

(** Advance one clock cycle with inputs [i]. *)
let step t (i : inputs) =
  let chg_now = t.pins_s lxor t.pins_q in
  let changed_all = t.changed lor chg_now in
  let in_eval = match t.phase with Eval -> true | _ -> false in
  let entry_now = match t.phase with Fetch 4 -> true | _ -> false in
  let tx_empty = Queue.is_empty t.tx_fifo in
  let rx_full = Queue.length t.rx_fifo = fifo_depth in
  let flag f =
    match f with
    | 0 -> true
    | 1 -> t.cnt = 0
    | 2 -> bit t.tx_sr 0
    | 3 -> bit t.rx_sr 0
    | 4 -> tx_empty
    | 5 -> rx_full
    | 6 -> bit t.lfsr 0
    | 7 -> (t.rx_sr lsr 1) land 0x7F = i.match_addr land 0x7F
    | f ->
      (* lane (f - 8) / 4: done, crc_ok, sync_hit, error *)
      let l = (f - 8) / 4 in
      l < num_lanes && List.nth_exn (Lane_model.flags t.lanes.(l)) ((f - 8) % 4)
  in
  let stress = t.role = Role.stress in
  (* ENGINE.md: a pin change is judged against the clocks as they were when it was
     seen. The earliest latched change on the edge's change pins sets the age. *)
  let clock_seen (e : int Edge.t) =
    let c = clock_sel t e.clk in
    if c = 0xFFFF
    then c
    else (
      let age =
        List.init 8 ~f:(fun p ->
          if bit t.changed p && bit e.chg_mask p then t.ages.(p) else 0)
        |> List.fold ~init:0 ~f:max
      in
      max 0 (c - age))
  in
  let multi_eff = t.multi lor (t.changed land chg_now) in
  let relevant =
    Array.fold t.edges ~init:t.hdr.watch ~f:(fun acc e -> if e.valid = 1 then acc lor e.chg_mask else acc)
  in
  let amb_pins = multi_eff land relevant in
  let amb_now = in_eval && amb_pins <> 0 in
  let fires (e : int Edge.t) =
    let c = clock_seen e in
    e.valid = 1
    && (t.pins_s lxor e.pin_val) land e.pin_mask = 0
    && (e.chg_mask = 0 || changed_all land e.chg_mask <> 0)
    && c >= e.lo
    && c <= e.hi
    && Bool.( <> ) (flag e.flag) (e.flag_inv = 1)
    && ((not stress)
        ||
        match e.stress with
        | 0 -> true
        | 1 -> c = e.lo
        | 2 -> c = e.hi
        | _ -> t.lfsr land 0xF = 0 || c = e.hi)
  in
  let winner =
    (* ENGINE.md, Pins: a relevant pin that changed more than once before EVAL is
       ambiguous; edges waiting on it cannot fire, and unless the policy is continue
       no edge fires *)
    if in_eval
    then
      Array.findi t.edges ~f:(fun _ e ->
        fires e && e.chg_mask land multi_eff = 0 && ((not amb_now) || t.hdr.policy = Policy.continue))
      |> Option.map ~f:fst
    else None
  in
  let any_fire = Option.is_some winner in
  let w = Option.value winner ~default:3 in
  let we = t.edges.(w) in
  let h = t.hdr in
  let timeout_now =
    in_eval
    && (not any_fire)
    && h.inv_en = 1
    && clock_sel t h.inv_clk > h.inv_hi
    && not t.to_logged
  in
  let unexp_now = in_eval && (not any_fire) && changed_all land h.watch <> 0 in
  (* one entry per cycle: AMBIGUOUS (kind 0) wins over UNEXPECTED and TIMEOUT *)
  let viol_now = timeout_now || unexp_now || amb_now in
  let viol_kind_now = if amb_now then 0 else (b2i timeout_now lsl 1) lor b2i unexp_now in
  (* the action of this cycle *)
  let act_en = entry_now || any_fire in
  let drive = t.role = Role.drive || stress in
  let a_mask, a_val, a_oe, a_rst, a_tx_op, a_cnt_op, a_rx_op, a_tx_pin =
    if entry_now
    then h.drive_mask, h.out_val, h.out_oe, h.clk_reset, h.tx_op, h.cnt_op, 0, None
    else
      ( we.drive_mask
      , we.out_val
      , we.out_oe
      , we.clk_reset
      , we.tx_op
      , we.cnt_op
      , we.rx_op
      , if we.tx_pin_en = 1 then Some we.tx_pin else None )
  in
  (* ---- compute next state ---- *)
  let n_pout, n_poe =
    if act_en && drive
    then (
      let p = t.pout land lnot a_mask lor (a_val land a_mask) in
      let o = t.poe land lnot a_mask lor (a_oe land a_mask) in
      match a_tx_pin with
      | None -> p, o
      | Some k ->
        let m = 1 lsl k in
        (if bit t.tx_sr 0 then p lor m else p land lnot m), o lor m)
    else t.pout, t.poe
  in
  let tx_pop = act_en && (a_tx_op = Tx_op.load || a_tx_op = Tx_op.load_rev) in
  let loaded = Option.value (Queue.peek t.tx_fifo) ~default:0xFF in
  let n_tx_sr =
    if not act_en
    then t.tx_sr
    else (
      match a_tx_op with
      | 0 -> t.tx_sr
      | 1 -> loaded
      | 2 -> reverse8 loaded
      | _ -> 0x80 lor (t.tx_sr lsr 1))
  in
  let rx_bit = b2i (bit t.pins_s we.rx_pin) in
  let n_rx_sr =
    if not act_en
    then t.rx_sr
    else (
      match a_rx_op with
      | 1 -> (rx_bit lsl 7) lor (t.rx_sr lsr 1)
      | 2 -> ((t.rx_sr lsl 1) land 0xFF) lor rx_bit
      | _ -> t.rx_sr)
  in
  let rx_push = act_en && a_rx_op = Rx_op.push in
  let n_cnt =
    if not act_en
    then t.cnt
    else (
      match a_cnt_op with
      | 0 -> t.cnt
      | 1 -> (t.cnt - 1) land 0xFF
      | 2 -> 7
      | _ -> 8)
  in
  (* prescaler of the record in the record registers *)
  let tick =
    match h.prescale with
    | 0 -> true
    | 1 -> t.pre land 7 = 7
    | 2 -> t.pre land 63 = 63
    | _ -> t.pre = 511
  in
  let n_clocks =
    Array.mapi t.clocks ~f:(fun k c ->
      if act_en && bit a_rst k then 0 else if c = 0xFFFF || not tick then c else c + 1)
  in
  (* bit lanes: the winning edge's tx_pin field is the command when tx_pin_en = 0 *)
  let cmd = if any_fire && we.tx_pin_en = 0 then we.tx_pin else 0 in
  let tx_head = Queue.peek t.tx_fifo in
  let lane_steps =
    Array.mapi t.lanes ~f:(fun l lane ->
      let k : Lane_model.cmd =
        { go = cmd = Lane_cmd.go l
        ; end_ = cmd = Lane_cmd.end_ l
        ; crc = cmd = Lane_cmd.crc l
        ; reset = cmd = Lane_cmd.reset
        }
      in
      let cfg = if l = 0 then i.lane0 else i.lane1 in
      Lane_model.step lane cfg k ~pins_s:t.pins_s ~pins_q:t.pins_q ~tx_head)
  in
  let lane_pop = Array.exists lane_steps ~f:(fun s -> s.Lane_model.pop) in
  let lane_push l = if l < num_lanes then lane_steps.(l).Lane_model.push else None in
  (* coverage *)
  let cov_fire = any_fire && i.cover_en in
  let cov_addr_now = (t.cur_loc lsl 2) lor w in
  let off_now = min 4095 (clock_seen we) in
  let merge_now, drop_now =
    match t.s1 with
    | Some (a, _) when cov_fire -> a = cov_addr_now, a <> cov_addr_now
    | _ -> false, false
  in
  let n_s1 = if cov_fire && Option.is_none t.s1 then Some (cov_addr_now, off_now) else None in
  let n_s2 =
    Option.map t.s1 ~f:(fun (a, off) ->
      if merge_now then a, 2, min off off_now, max off off_now else a, 1, off, off)
  in
  (* SRAM accesses this cycle (single port each) *)
  let fetch_rd = match t.phase with Fetch b when b < beats -> Some b | _ -> None in
  let host_cov_we = i.cov_we && in_idle t && Option.is_none t.s2 && Option.is_none t.s1 in
  let n_rec_rdata =
    match fetch_rd with
    | Some b -> t.rec_mem.((t.cur_loc lsl 2) lor b)
    | None -> t.rec_rdata
  in
  if Option.is_none fetch_rd && i.rec_we && in_idle t then t.rec_mem.(i.rec_waddr) <- i.rec_wdata;
  let cov_read_addr =
    match t.s1 with
    | Some (a, _) -> a
    | None -> i.cov_addr
  in
  let n_cov_rdata =
    if Option.is_some t.s2 || host_cov_we then t.cov_rdata else t.cov_mem.(cov_read_addr)
  in
  (match t.s2 with
   | Some (a, n, mn, mx) ->
     let old = t.cov_rdata in
     let oc = (old lsr 24) land 0xFF
     and omin = (old lsr 12) land 0xFFF
     and omax = old land 0xFFF in
     let word =
       if oc = 0
       then (n lsl 24) lor (mn lsl 12) lor mx
       else (min 255 (oc + n) lsl 24) lor (min omin mn lsl 12) lor max omax mx
     in
     t.cov_mem.(a) <- word
   | None -> if host_cov_we then t.cov_mem.(i.cov_addr) <- i.cov_wdata);
  (* ---- FIFOs ---- *)
  let push q v ovf =
    if Queue.length q < fifo_depth
    then (
      Queue.enqueue q v;
      false)
    else ovf
  in
  let tx_pop_now = (tx_pop || lane_pop) && not tx_empty in
  let rx_pop_now = i.rx_pop && not (Queue.is_empty t.rx_fifo) in
  let vlog_pop_now = i.vlog_pop && not (Queue.is_empty t.vlog_fifo) in
  let tx_full_now = Queue.length t.tx_fifo = fifo_depth in
  let rx_full_now = rx_full in
  let vlog_full_now = Queue.length t.vlog_fifo = fifo_depth in
  let watched_age =
    List.init 8 ~f:(fun p -> if bit t.changed p && bit h.watch p then t.ages.(p) else 0)
    |> List.fold ~init:0 ~f:max
  in
  (* AMBIGUOUS is timed at the second change on the lowest ambiguous pin (seen now if
     it is not latched yet) *)
  let amb_age =
    match List.find (List.init 8 ~f:Fn.id) ~f:(fun p -> bit amb_pins p) with
    | Some p -> if bit t.multi p then t.ages2.(p) else 0
    | None -> 0
  in
  let age = if amb_now then amb_age else if unexp_now then watched_age else 0 in
  let log_ts = (t.timestamp - age) land 0xFFFF_FFFF in
  let vlog_word =
    (log_ts lsl 16) lor (t.cur_loc lsl 10) lor (viol_kind_now lsl 8) lor t.pins_s
  in
  if tx_pop_now then ignore (Queue.dequeue_exn t.tx_fifo : int);
  if i.tx_push && not tx_full_now then Queue.enqueue t.tx_fifo i.tx_data;
  if rx_pop_now then ignore (Queue.dequeue_exn t.rx_fifo : int);
  (* RX FIFO: lane 0, then lane 1, then the engine; a push that loses waits in its
     one-entry buffer, a push into a full buffer is dropped *)
  let news = [| lane_push 1; (if rx_push then Some t.rx_sr else None) |] in
  let reqs = Array.mapi news ~f:(fun s n -> if Option.is_some t.rx_wait.(s) then t.rx_wait.(s) else n) in
  let accepted =
    match lane_push 0 with
    | Some b -> Some (b, -1)
    | None ->
      (match reqs.(0), reqs.(1) with
       | Some b, _ -> Some (b, 0)
       | None, Some b -> Some (b, 1)
       | None, None -> None)
  in
  let buf_drop = ref false in
  Array.iteri news ~f:(fun s n ->
    let won = match accepted with Some (_, w) -> w = s | None -> false in
    match t.rx_wait.(s), n, won with
    | Some _, Some nb, true -> t.rx_wait.(s) <- Some nb
    | Some _, None, true -> t.rx_wait.(s) <- None
    | None, Some nb, false -> t.rx_wait.(s) <- Some nb
    | Some _, Some _, false -> buf_drop := true
    | _ -> ());
  let rx_push = Option.is_some accepted in
  Option.iter accepted ~f:(fun (b, _) -> if not rx_full_now then Queue.enqueue t.rx_fifo b);
  if vlog_pop_now then ignore (Queue.dequeue_exn t.vlog_fifo : int);
  if viol_now && not vlog_full_now then Queue.enqueue t.vlog_fifo vlog_word;
  ignore push;
  if (rx_push && rx_full_now) || !buf_drop then t.rx_ovf <- true;
  if viol_now && vlog_full_now then t.vlog_ovf <- true;
  if drop_now then t.cov_ovr <- true;
  (* ---- registers ---- *)
  let fb = (t.lfsr lsr 15) lxor (t.lfsr lsr 13) lxor (t.lfsr lsr 12) lxor (t.lfsr lsr 10) in
  t.lfsr <- ((t.lfsr lsl 1) land 0xFFFF) lor (fb land 1);
  Array.blit ~src:n_clocks ~src_pos:0 ~dst:t.clocks ~dst_pos:0 ~len:3;
  if act_en then t.to_logged <- false;
  t.pout <- n_pout;
  t.poe <- n_poe;
  t.tx_sr <- n_tx_sr;
  t.rx_sr <- n_rx_sr;
  t.cnt <- n_cnt;
  if entry_now && h.irq_on_entry = 1 then t.irq_flag <- true;
  if i.irq_ack then t.irq_flag <- false;
  t.s1 <- n_s1;
  t.s2 <- n_s2;
  (match t.phase with
   | Idle -> ()
   | Fetch b ->
     if b >= 1 then t.beats.(b - 1) <- t.rec_rdata;
     for p = 0 to 7 do
       if bit chg_now p && not (bit t.changed p)
       then t.ages.(p) <- 1
       else if bit t.changed p && t.ages.(p) < 7
       then t.ages.(p) <- t.ages.(p) + 1
     done;
     for p = 0 to 7 do
       if bit chg_now p && bit t.changed p && not (bit t.multi p)
       then t.ages2.(p) <- 1
       else if bit t.multi p && t.ages2.(p) < 7
       then t.ages2.(p) <- t.ages2.(p) + 1
     done;
     t.multi <- t.multi lor (t.changed land chg_now);
     t.changed <- changed_all;
     t.phase <- (if b = beats then Eval else Fetch (b + 1));
     if b >= 1 then decode_now t
   | Eval ->
     t.changed <- 0;
     t.multi <- 0;
     Array.fill t.ages ~pos:0 ~len:8 0;
     if any_fire
     then (
       if we.target <> t.cur_loc
       then (
         t.cur_loc <- we.target;
         t.phase <- Fetch 0))
     else (
       (* a TIMEOUT that lost to AMBIGUOUS is deferred *)
       if timeout_now && not amb_now then t.to_logged <- true;
       if viol_now
       then (
         match h.policy with
         | 1 -> ()
         | 2 ->
           t.cur_loc <- i.recover_loc;
           t.phase <- Fetch 0
         | _ ->
           t.phase <- Idle;
           t.halted_viol <- true)));
  if i.stop
  then (
    t.phase <- Idle;
    t.poe <- 0);
  t.pre <- (t.pre + 1) land 511;
  if i.start
  then (
    t.phase <- Fetch 0;
    t.cur_loc <- i.start_loc;
    t.role <- i.role;
    t.pout <- 0;
    t.poe <- 0;
    t.changed <- 0;
    t.multi <- 0;
    t.halted_viol <- false;
    t.irq_flag <- false;
    t.rx_ovf <- false;
    t.vlog_ovf <- false;
    t.cov_ovr <- false;
    Array.fill t.clocks ~pos:0 ~len:3 0;
    t.pre <- 0);
  t.taken <- any_fire;
  t.taken_edge <- (match winner with Some k -> k | None -> 3);
  t.viol <- viol_now;
  t.viol_kind <- viol_kind_now;
  t.rec_rdata <- n_rec_rdata;
  t.cov_rdata <- n_cov_rdata;
  t.pins_q <- t.pins_s;
  t.pins_s <- t.sync1;
  t.sync1 <- i.pins_in land 0xFF;
  t.timestamp <- (t.timestamp + 1) land 0xFFFF_FFFF
;;
