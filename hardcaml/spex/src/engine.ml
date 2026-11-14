(** SPEX engine core (v3 location-record engine).

    One timed-automaton engine. Each cycle in EVAL it evaluates the 4 edges of the
    active location record against the synchronised pins, 3 clocks and data flags,
    takes the lowest-index true edge, and applies its actions. The record lives in
    flops; the SRAM is read only on location entry (FETCH, 5 cycles).

    The SRAMs are outside this module (ports [ram_in] / [ram_out]) so the generated
    Verilog synthesises without memories and the chip top can instantiate IHP macros.
    [Top] below wraps the core with behavioural RAMs for simulation. *)

open! Base
open! Hardcaml
open Signal
open Layout

module Host_in = struct
  type 'a t =
    { start : 'a (** pulse: begin at [start_loc] in [role] *)
    ; stop : 'a
    ; role : 'a [@bits 2]
    ; start_loc : 'a [@bits 6]
    ; recover_loc : 'a [@bits 6]
    ; cover_en : 'a
    ; open_drain : 'a [@bits 8]
    ; match_addr : 'a [@bits 8]
    ; irq_ack : 'a
    ; rec_we : 'a (** location store write, ignored while running *)
    ; rec_waddr : 'a [@bits 8] (** {loc, beat} *)
    ; rec_wdata : 'a [@bits 128]
    ; tx_push : 'a
    ; tx_data : 'a [@bits 8]
    ; rx_pop : 'a
    ; vlog_pop : 'a
    ; cov_addr : 'a [@bits 8] (** {loc, edge}; read data appears next cycle *)
    ; cov_we : 'a (** ignored while running *)
    ; cov_wdata : 'a [@bits 32]
    ; lane0 : 'a Lane_cfg.t [@rtlprefix "lane0_"] (** bit lane CSRs (ENGINE.md, Bit lanes) *)
    ; lane1 : 'a Lane_cfg.t [@rtlprefix "lane1_"]
    ; pin_src : 'a [@bits 24] (** 3 bits per pin, [Pin_src] *)
    ; cov_re : 'a (** the host reads coverage this cycle (refused while running) *)
    ; lane_we : 'a [@bits 2] (** the host writes lane l's CSRs this cycle *)
    ; err_clear : 'a (** clears host_err *)
    ; verify : 'a (** start the image check sweep (idle only) *)
    ; crc_expect : 'a [@bits 32] (** CRC-32 the host expects over the whole store *)
    ; crc_expect_we : 'a (** crc_expect was written: clears image_valid *)
    ; rx_wm : 'a [@bits 5] (** IRQ while the RX FIFO holds >= rx_wm bytes (0 acts as 1) *)
    ; tx_wm : 'a [@bits 5]
    ; tx_wm_en : 'a (** IRQ while the TX FIFO holds <= tx_wm bytes *)
    ; drop_clear : 'a (** clears the drop counters *)
    ; rx_to_tx : 'a
        (** bridge: lane RX bytes go into the TX FIFO instead of the RX FIFO; host TX
            pushes are refused (host_err cause 6) *)
    }
  [@@deriving hardcaml]
end

module Status = struct
  type 'a t =
    { running : 'a
    ; in_entry : 'a
    ; cur_loc : 'a [@bits 6]
    ; accepting : 'a
    ; taken : 'a (** pulse, one cycle after the edge fired *)
    ; taken_edge : 'a [@bits 2]
    ; viol : 'a (** pulse, one cycle after the violation was seen (uo[2]) *)
    ; viol_kind : 'a [@bits 2] (** 0 AMBIGUOUS, 1 UNEXPECTED, 2 TIMEOUT, 3 both *)
    ; timestamp : 'a [@bits 32]
    ; tx_full : 'a
    ; tx_empty : 'a
    ; rx_data : 'a [@bits 8]
    ; rx_empty : 'a
    ; vlog_data : 'a [@bits 48] (** {timestamp 32, loc 6, kind 2, pins 8} *)
    ; vlog_empty : 'a
    ; cov_rdata : 'a [@bits 32] (** {count 8, min 12, max 12} *)
    ; irq : 'a
    ; halted_viol : 'a
    ; rx_overflow : 'a
    ; vlog_overflow : 'a
    ; cov_overrun : 'a
    ; host_err : 'a (** sticky: a host access was refused (ENGINE.md, Host access rules) *)
    ; host_err_cause : 'a [@bits 3]
        (** first cause: 1 store write, 2 coverage, 3 lane CSR, 4 start while the image is
            invalid, 5 access during the image check, 6 TX push while bridging *)
    ; lane_active : 'a [@bits 2] (** lane l is Armed or Run *)
    ; image_valid : 'a (** the store passed the last image check; start needs it *)
    ; verify_busy : 'a (** the image check sweep is running *)
    ; tx_collision : 'a (** sticky: the engine and a lane popped TX in one cycle *)
    ; drops : 'a [@bits 40]
        (** saturating drop counters, 8 bits each from bit 0: RX lane 0, RX lane 1, RX
            engine, violation log, coverage *)
    ; lane_status : 'a [@bits 16]
        (** per lane, lane 1 in the high byte: {done, crc_ok, sync_hit, error, 0, kind 3} *)
    }
  [@@deriving hardcaml]
end

(** Single-port SRAM side: one access per cycle, like the IHP 1P macros. *)
module Ram_out = struct
  type 'a t =
    { rec_addr : 'a [@bits 8]
    ; rec_re : 'a
    ; rec_we : 'a
    ; rec_wdata : 'a [@bits 128]
    ; cov_addr : 'a [@bits 8]
    ; cov_re : 'a
    ; cov_we : 'a
    ; cov_wdata : 'a [@bits 32]
    }
  [@@deriving hardcaml]
end

module Ram_in = struct
  type 'a t =
    { rec_rdata : 'a [@bits 128]
    ; cov_rdata : 'a [@bits 32]
    }
  [@@deriving hardcaml]
end

module I = struct
  type 'a t =
    { clock : 'a
    ; clear : 'a
    ; pins_in : 'a [@bits 8]
    ; host : 'a Host_in.t [@rtlprefix "host_"]
    ; ram : 'a Ram_in.t [@rtlprefix "ram_"]
    }
  [@@deriving hardcaml]
end

module O = struct
  type 'a t =
    { pins_out : 'a [@bits 8]
    ; pins_oe : 'a [@bits 8]
    ; status : 'a Status.t [@rtlprefix "st_"]
    ; ram : 'a Ram_out.t [@rtlprefix "ram_"]
    }
  [@@deriving hardcaml]
end

(** Register FIFO: push when full is dropped, pop when empty is ignored, [q] shows
    the head combinationally. *)
(** FIFO depths (ENGINE.md, Limits): TX and RX 32 bytes since review F2 (2026-11-14; 8
    before), the violation log 8 entries (48 bits each, the costly one to deepen). *)
let data_fifo_depth = 32
let vlog_depth = 8

let small_fifo spec ~depth ~push ~pop ~d =
  let ab = Int.ceil_log2 depth in
  let used = wire (ab + 1) in
  let full = used ==:. depth in
  let empty = used ==:. 0 in
  let do_push = push &: ~:full in
  let do_pop = pop &: ~:empty in
  let wp = reg_fb spec ~width:ab ~f:(fun x -> mux2 do_push (x +:. 1) x) in
  let rp = reg_fb spec ~width:ab ~f:(fun x -> mux2 do_pop (x +:. 1) x) in
  (* +1 / -1 are computed from flops; push and pop only select *)
  used
  <== reg
        spec
        (mux2 (do_push ^: do_pop) (mux2 do_push (used +:. 1) (used -:. 1)) used);
  let mem = List.init depth ~f:(fun k -> reg spec ~enable:(do_push &: (wp ==:. k)) d) in
  mux rp mem, empty, full, push &: full, used
;;

let phase_idle = 0
let phase_fetch = 1
let phase_eval = 2
let c2 n = Signal.of_int ~width:2 n

(** Bit lanes in the chip (1 or 2; ENGINE.md). *)
let num_lanes = 2

let create (_ : Scope.t) (i : _ I.t) : _ O.t =
  let h = i.host in
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.clear () in
  let open Always in
  let rv w = Variable.reg spec ~width:w in
  (* ---- pin input stage: 2-flop synchroniser and change detect ---- *)
  let sync1 = reg spec i.pins_in in
  let pins_s = reg spec sync1 in
  let pins_q = reg spec pins_s in
  let chg_now = pins_s ^: pins_q in
  (* ---- state ---- *)
  let phase = rv 2 in
  let beat = rv 3 in
  let cur_loc = rv 6 in
  let role = rv 2 in
  let rec_b = List.init beats ~f:(fun _ -> rv beat_bits) in
  let changed = rv 8 in
  let clocks = List.init 3 ~f:(fun _ -> rv clock_bits) in
  let pout = rv 8 in
  let poe = rv 8 in
  let tx_sr = rv 8 in
  let rx_sr = rv 8 in
  let cnt = rv 8 in
  let lfsr =
    Variable.reg (Reg_spec.override spec ~clear_to:(of_int ~width:16 0xACE1)) ~width:16
  in
  let to_logged = rv 1 in
  let halted_viol = rv 1 in
  let irq_flag = rv 1 in
  let rx_ovf = rv 1 in
  let vlog_ovf = rv 1 in
  let cov_ovr = rv 1 in
  let timestamp = reg_fb spec ~width:32 ~f:(fun t -> t +:. 1) -- "ts_reg" in
  let in_idle = phase.value ==:. phase_idle in
  let in_fetch = phase.value ==:. phase_fetch in
  let in_eval = phase.value ==:. phase_eval in
  (* ---- the active record (flops) ---- *)
  let record = concat_lsb (List.map rec_b ~f:(fun v -> v.value)) in
  let hdr = Header.Of_signal.unpack (select record (header_bits - 1) 0) in
  let edges =
    List.init num_edges ~f:(fun k ->
      let lo = header_bits + (edge_bits * k) in
      Edge.Of_signal.unpack (select record (lo + edge_bits - 1) lo))
  in
  let clock_v = List.map clocks ~f:(fun c -> c.value) in
  let clk_of sel = mux sel (clock_v @ [ List.nth_exn clock_v 2 ]) in
  (* ---- FIFOs ---- *)
  let tx_pop = wire 1 in
  (* bridge (rx_to_tx): a lane's RX byte goes into the TX FIFO; the host's TX push is
     refused then *)
  let br_push = wire 1 in
  let br_d = wire 8 in
  let tx_q, tx_empty, tx_full, _, tx_used =
    small_fifo
      spec
      ~depth:data_fifo_depth
      ~push:(br_push |: (h.tx_push &: ~:(h.rx_to_tx)))
      ~pop:tx_pop
      ~d:(mux2 br_push br_d h.tx_data)
  in
  let rx_push = wire 1 in
  let rx_push_d = wire 8 in
  let rx_q, rx_empty, rx_full, rx_drop, rx_used =
    small_fifo spec ~depth:data_fifo_depth ~push:rx_push ~pop:h.rx_pop ~d:rx_push_d
  in
  (* ---- bit lanes ---- *)
  let lane_cmd = wire 3 in
  let cmd_is k = lane_cmd ==:. k in
  let lanes =
    List.init num_lanes ~f:(fun l ->
      Lane.create
        (Scope.create ~flatten_design:true ())
        { Lane.I.clock = i.clock
        ; clear = i.clear
        ; cfg = (if l = 0 then h.lane0 else h.lane1)
        ; go = cmd_is (Lane_cmd.go l)
        ; end_ = cmd_is (Lane_cmd.end_ l)
        ; crc_cmd = cmd_is (Lane_cmd.crc l)
        ; reset = cmd_is Lane_cmd.reset |: h.stop
        ; sync1
        ; tx_head = tx_q
        ; tx_empty
        })
  in
  let lane_flags =
    List.init 2 ~f:(fun l ->
      match List.nth lanes l with
      | Some (o : _ Lane.O.t) -> [ o.done_; o.crc_ok; o.sync_hit; o.error ]
      | None -> [ gnd; gnd; gnd; gnd ])
    |> List.concat
  in
  let lane_out l = match List.nth lanes l with Some (o : _ Lane.O.t) -> o.out | None -> vdd in
  let vlog_push = wire 1 in
  let vlog_d = wire 48 in
  let vlog_q, vlog_empty, _, vlog_drop, _ =
    small_fifo spec ~depth:vlog_depth ~push:vlog_push ~pop:h.vlog_pop ~d:vlog_d
  in
  (* ---- guard evaluation ---- *)
  let flags =
    [ vdd
    ; cnt.value ==:. 0
    ; tx_sr.value.:(0)
    ; rx_sr.value.:(0)
    ; tx_empty
    ; rx_full
    ; lfsr.value.:(0)
    ; select rx_sr.value 7 1 ==: select h.match_addr 6 0
    ]
    @ lane_flags
  in
  let changed_all = changed.value |: chg_now in
  let is_stress = role.value ==:. Role.stress in
  (* each pin keeps the age of its latched change (cycles since it was seen) *)
  let ages = List.init 8 ~f:(fun _ -> rv 3) in
  let max3 l =
    tree l ~arity:2 ~f:(function
      | [ a ] -> a
      | [ a; b ] -> mux2 (a >: b) a b
      | _ -> assert false)
  in
  (* A pin change is judged against the clocks as they were when it was seen: an edge
     waiting on a change is judged with v = max(clock - age, 0), age = the earliest
     matching latched change; a saturated clock stays saturated (ENGINE.md).

     Ages are only nonzero in the first EVAL cycle after FETCH, so the subtract is kept
     out of the EVAL loop: every cycle computes, from the record, ages and change
     latches as they will be next cycle, each edge's age and lo + age, hi + age into
     registers. EVAL then compares the raw clock with them:
       lo <= v <= hi  <=>  (clock >= lo + age | lo = 0) & clock <= hi + age
       v = x          <=>  clock = x + age | (x = 0 & clock < age) *)
  let record_next =
    List.mapi rec_b ~f:(fun k b ->
      mux2 (in_fetch &: (beat.value ==:. k + 1)) i.ram.rec_rdata b.value)
    |> concat_lsb
  in
  let edges_next =
    List.init num_edges ~f:(fun k ->
      let lo = header_bits + (edge_bits * k) in
      Edge.Of_signal.unpack (select record_next (lo + edge_bits - 1) lo))
  in
  (* in FETCH a latched change ages by one and a new one starts at 1; EVAL clears them *)
  let aged_next =
    List.mapi ages ~f:(fun p a ->
      let age_next =
        mux2
          (chg_now.:(p) &: ~:(changed.value.:(p)))
          (of_int ~width:3 1)
          (mux2 (a.value ==:. 7) a.value (a.value +:. 1))
      in
      mux2 (in_fetch &: changed_all.:(p)) age_next (zero 3))
  in
  let adj =
    List.map edges_next ~f:(fun (e : Signal.t Edge.t) ->
      let age_next =
        List.mapi aged_next ~f:(fun p a -> mux2 e.chg_mask.:(p) a (zero 3)) |> max3
      in
      let a17 = uresize age_next (clock_bits + 1) in
      ( reg spec age_next
      , reg spec (uresize e.lo (clock_bits + 1) +: a17)
      , reg spec (uresize e.hi (clock_bits + 1) +: a17) ))
  in
  let fire_of (e : Signal.t Edge.t) (age, lo_adj, hi_adj) =
    let c = clk_of e.clk in
    let c17 = uresize c (clock_bits + 1) in
    let sat = c ==:. 0xFFFF in
    let c_lt_age = c <: uresize age clock_bits in
    let v_eq x x_adj = mux2 sat (x ==:. 0xFFFF) (c17 ==: x_adj |: (x ==:. 0 &: c_lt_age)) in
    let pin_ok = (pins_s ^: e.pin_val) &: e.pin_mask ==:. 0 in
    let chg_ok = e.chg_mask ==:. 0 |: (changed_all &: e.chg_mask <>:. 0) in
    let win_ok =
      mux2 sat (e.hi ==:. 0xFFFF) ((c17 >=: lo_adj |: (e.lo ==:. 0)) &: (c17 <=: hi_adj))
    in
    let dat_ok = mux e.flag flags ^: e.flag_inv in
    let str_ok =
      ~:is_stress
      |: mux
           e.stress
           [ vdd
           ; v_eq e.lo lo_adj
           ; v_eq e.hi hi_adj
           ; select lfsr.value 3 0 ==:. 0 |: v_eq e.hi hi_adj
           ]
    in
    e.valid &: pin_ok &: chg_ok &: win_ok &: dat_ok &: str_ok
  in
  (* AMBIGUOUS (ENGINE.md, Pins): a relevant pin that changed more than once before
     EVAL. multi is set in FETCH; a change in the first EVAL cycle on a pin whose change
     is already latched counts too. Edges waiting on such a pin cannot fire; with any
     ambiguity only the continue policy lets an edge fire. *)
  let multi = rv 8 in
  (* age of each pin's second change (the AMBIGUOUS timestamp) *)
  let ages2 = List.init 8 ~f:(fun _ -> rv 3) in
  let multi_eff = multi.value |: (changed.value &: chg_now) in
  let relevant =
    reduce ~f:( |: ) (hdr.watch :: List.map edges ~f:(fun e -> mux2 e.valid e.chg_mask (zero 8)))
  in
  let amb_pins = multi_eff &: relevant in
  let amb_now = in_eval &: (amb_pins <>:. 0) in
  let may_fire = ~:amb_now |: (hdr.policy ==:. Policy.continue) in
  let fires =
    List.map2_exn edges adj ~f:(fun e a ->
      in_eval &: fire_of e a &: (e.chg_mask &: multi_eff ==:. 0) &: may_fire)
  in
  let any_fire = reduce ~f:( |: ) fires in
  let winner =
    match fires with
    | [ f0; f1; f2; _ ] ->
      mux2 f0 (of_int ~width:2 0) (mux2 f1 (of_int ~width:2 1) (mux2 f2 (of_int ~width:2 2) (of_int ~width:2 3)))
    | _ -> assert false
  in
  (* names for the formal properties (formal/spex_props.sv) *)
  List.iteri fires ~f:(fun k f -> ignore (f -- Printf.sprintf "f_fire%d" k : Signal.t));
  ignore (winner -- "f_winner" : Signal.t);
  ignore (changed_all -- "f_changed_all" : Signal.t);
  ignore (chg_now -- "f_chg_now" : Signal.t);
  ignore (in_eval -- "f_in_eval" : Signal.t);
  ignore (in_fetch -- "f_in_fetch" : Signal.t);
  ignore (hdr.watch -- "f_watch" : Signal.t);
  List.iteri edges ~f:(fun k e ->
    ignore (e.chg_mask -- Printf.sprintf "f_chgmask%d" k : Signal.t);
    ignore (e.valid -- Printf.sprintf "f_valid%d" k : Signal.t));
  let we = Edge.Of_signal.mux winner edges in
  let self_loop = we.target ==: cur_loc.value in
  (* ---- violations ---- *)
  let ic = clk_of hdr.inv_clk in
  let timeout_now =
    in_eval &: ~:any_fire &: hdr.inv_en &: (ic >: hdr.inv_hi) &: ~:(to_logged.value)
  in
  let unexp_now = in_eval &: ~:any_fire &: (changed_all &: hdr.watch <>:. 0) in
  ignore (unexp_now -- "f_unexp_now" : Signal.t);
  ignore (amb_now -- "f_amb_now" : Signal.t);
  ignore (multi_eff -- "f_multi_eff" : Signal.t);
  ignore (relevant -- "f_relevant" : Signal.t);
  (* one entry per cycle: AMBIGUOUS (kind 0) wins; a TIMEOUT that loses is deferred
     (to_logged stays clear), an UNEXPECTED that loses is covered by it *)
  let viol_now = timeout_now |: unexp_now |: amb_now in
  let viol_kind_now = mux2 amb_now (zero 2) (concat_msb [ timeout_now; unexp_now ]) in
  ignore (viol_now -- "f_viol_now" : Signal.t);
  ignore (hdr.policy -- "f_policy" : Signal.t);
  vlog_push <== viol_now;
  (* A change latched during entry is logged with the cycle it was seen, not the
     cycle EVAL got to it. *)
  let watched_age =
    List.mapi ages ~f:(fun p a ->
      mux2 (changed.value.:(p) &: hdr.watch.:(p)) a.value (zero 3))
    |> max3
  in
  (* timestamp - age without a 32-bit subtract: a 3-bit subtract on the low bits,
     and a register that always holds timestamp[31:3] - 1 for the borrow case *)
  let ts_hi_m1 =
    reg_fb
      (Reg_spec.override spec ~clear_to:(ones 29))
      ~width:29
      ~f:(fun x -> mux2 (select timestamp 2 0 ==:. 7) (x +:. 1) x)
    -- "ts_hi_m1"
  in
  (* AMBIGUOUS: the second change on the lowest ambiguous pin (age 0 if it is seen in
     this first EVAL cycle) *)
  let amb_age =
    priority_select_with_default
      (List.mapi ages2 ~f:(fun p a ->
         { With_valid.valid = amb_pins.:(p); value = mux2 multi.value.:(p) a.value (zero 3) }))
      ~default:(zero 3)
  in
  let age = mux2 amb_now amb_age (mux2 unexp_now watched_age (zero 3)) in
  let ts_lo = select timestamp 2 0 in
  let log_ts =
    concat_msb
      [ mux2 (ts_lo <: age) ts_hi_m1 (select timestamp 31 3); ts_lo -: age ]
  in
  vlog_d <== concat_msb [ log_ts; cur_loc.value; viol_kind_now; pins_s ];
  (* ---- the action: entry actions (last fetch beat) or the winning edge ---- *)
  let entry_now = in_fetch &: (beat.value ==:. beats) in
  let act_en = entry_now |: any_fire in
  let pick a b = mux2 entry_now a b in
  let a_mask = pick hdr.drive_mask we.drive_mask in
  let a_val = pick hdr.out_val we.out_val in
  let a_oe = pick hdr.out_oe we.out_oe in
  let a_tx_en = ~:entry_now &: we.tx_pin_en in
  let a_rst = pick hdr.clk_reset we.clk_reset in
  let a_tx_op = pick hdr.tx_op we.tx_op in
  let a_cnt_op = pick hdr.cnt_op we.cnt_op in
  let a_rx_op = mux2 entry_now (zero 2) we.rx_op in
  let drive = role.value ==:. Role.drive |: is_stress in
  let p1 = pout.value &: ~:a_mask |: (a_val &: a_mask) in
  let o1 = poe.value &: ~:a_mask |: (a_oe &: a_mask) in
  let tmask = mux2 a_tx_en (binary_to_onehot we.tx_pin) (zero 8) in
  let p2 = p1 &: ~:tmask |: (sresize tx_sr.value.:(0) 8 &: tmask) in
  let o2 = o1 |: tmask in
  let is_load = a_tx_op ==:. Tx_op.load |: (a_tx_op ==:. Tx_op.load_rev) in
  (* a lane pop and an engine load in the same cycle both read the head; one pop *)
  let lane_pop = reduce ~f:( |: ) (gnd :: List.map lanes ~f:(fun o -> o.Lane.O.pop)) in
  tx_pop <== (act_en &: is_load |: lane_pop);
  let tx_collision_now = act_en &: is_load &: lane_pop in
  (* lane commands: the winning edge's tx_pin field when tx_pin_en = 0 *)
  lane_cmd <== mux2 (any_fire &: ~:(we.tx_pin_en)) we.tx_pin (zero 3);
  let loaded = mux2 tx_empty (ones 8) tx_q in
  let tx_next =
    mux a_tx_op [ tx_sr.value; loaded; reverse loaded; concat_msb [ vdd; select tx_sr.value 7 1 ] ]
  in
  let rx_bit = mux we.rx_pin (bits_lsb pins_s) in
  let rx_next =
    mux
      a_rx_op
      [ rx_sr.value
      ; concat_msb [ rx_bit; select rx_sr.value 7 1 ]
      ; concat_msb [ select rx_sr.value 6 0; rx_bit ]
      ; rx_sr.value
      ]
  in
  (* RX FIFO: lane 0, lane 1, engine; a push that loses waits in a one-entry buffer *)
  let eng_push = act_en &: (a_rx_op ==:. Rx_op.push) -- "f_eng_push" in
  let lane_push l =
    match List.nth lanes l with
    | Some (o : _ Lane.O.t) -> o.push, o.push_data
    | None -> gnd, zero 8
  in
  let l0_push, l0_data = lane_push 0 in
  let bufs =
    List.map [ lane_push 1; eng_push, rx_sr.value ] ~f:(fun (n, nd) ->
      let bv = Always.Variable.reg spec ~width:1 in
      let bd = Always.Variable.reg spec ~width:8 in
      n, nd, bv, bd)
  in
  let req (n, _, (bv : Always.Variable.t), _) = bv.value |: n in
  let dat (_, nd, (bv : Always.Variable.t), (bd : Always.Variable.t)) = mux2 bv.value bd.value nd in
  let b1, b2 = match bufs with [ a; b ] -> a, b | _ -> assert false in
  let acc1 = ~:l0_push &: req b1 in
  let acc2 = ~:l0_push &: ~:(req b1) &: req b2 in
  (* one push a cycle; with rx_to_tx a lane's byte goes to the TX FIFO instead *)
  let any_push = l0_push |: req b1 |: req b2 in
  let to_tx = h.rx_to_tx &: (l0_push |: acc1) in
  rx_push <== (any_push &: ~:to_tx);
  ignore (rx_push -- "f_rx_push" : Signal.t);
  rx_push_d <== mux2 l0_push l0_data (mux2 acc1 (dat b1) (dat b2));
  br_push <== to_tx;
  br_d <== rx_push_d;
  (* a lane byte's FIFO: RX, or TX when bridging *)
  let lane_full = mux2 h.rx_to_tx tx_full rx_full in
  let buf_drop = wire 1 in
  let buf_logic =
    List.map [ b1, acc1; b2, acc2 ] ~f:(fun ((n, nd, bv, bd), accepted) ->
      let open Always in
      ( if_
          accepted
          [ (* the buffered one went in; a new push takes its place *)
            if_ (bv.value &: n) [ bd <-- nd ] [ bv <--. 0 ] ]
          [ when_ (~:(bv.value) &: n) [ bv <--. 1; bd <-- nd ] ]
      , bv.value &: n &: ~:accepted ))
  in
  Always.compile (List.map buf_logic ~f:fst);
  buf_drop <== reduce ~f:( |: ) (List.map buf_logic ~f:snd);
  (* RX drops per source: a full FIFO, a full wait buffer, or a partial byte that a lane
     reset or stop dropped *)
  let lane_lost l = match List.nth lanes l with Some (o : _ Lane.O.t) -> o.lost | None -> gnd in
  let buf_drop_of k = snd (List.nth_exn buf_logic k) in
  let rx_drops =
    [ l0_push &: lane_full |: lane_lost 0
    ; buf_drop_of 0 |: (acc1 &: lane_full) |: lane_lost 1
    ; buf_drop_of 1 |: (acc2 &: rx_full)
    ]
  in
  let cnt_next =
    mux a_cnt_op [ cnt.value; cnt.value -:. 1; of_int ~width:8 7; of_int ~width:8 8 ]
  in
  (* ---- coverage: read in S1, merge and write in S2; 1 SRAM access per cycle ---- *)
  let cov_fire = any_fire &: h.cover_en in
  let cov_addr_now = concat_msb [ cur_loc.value; winner ] in
  (* the fired edge's clock and age; the subtract happens in S1 -> S2, off the EVAL path *)
  let c_w = clk_of we.clk in
  let a_w = mux winner (List.map adj ~f:(fun (a, _, _) -> a)) in
  let clip w v = mux2 (v >:. (1 lsl w) - 1) (ones w) (select v (w - 1) 0) in
  (* a fire in the cycle after another one is never a first EVAL cycle, so its age is
     0 and the raw clock is its offset *)
  let off_now = clip 12 c_w in
  let s1_v = rv 1 in
  let s1_addr = rv 8 in
  let s1_raw = rv 13 in
  let s1_sat = rv 1 in
  let s1_age = rv 3 in
  let s1_off =
    mux2
      s1_sat.value
      (ones 12)
      (clip
         12
         (mux2
            (s1_raw.value <: uresize s1_age.value 13)
            (zero 13)
            (s1_raw.value -: uresize s1_age.value 13)))
  in
  let s2_v = rv 1 in
  let s2_addr = rv 8 in
  let s2_two = rv 1 in
  let s2_off1 = rv 12 in
  let s2_off2 = rv 12 in
  (* min/max of the one or two offsets are formed in S2, from flops *)
  let s2_n = mux2 s2_two.value (of_int ~width:2 2) (of_int ~width:2 1) in
  let s2_min = mux2 (s2_two.value &: (s2_off2.value <: s2_off1.value)) s2_off2.value s2_off1.value in
  let s2_max = mux2 (s2_two.value &: (s2_off2.value >: s2_off1.value)) s2_off2.value s2_off1.value in
  let merge_now = cov_fire &: s1_v.value &: (cov_addr_now ==: s1_addr.value) in
  let drop_now = cov_fire &: s1_v.value &: (cov_addr_now <>: s1_addr.value) in
  let old = i.ram.cov_rdata in
  let old_cnt = select old 31 24 in
  let old_min = select old 23 12 in
  let old_max = select old 11 0 in
  let sum = uresize old_cnt 9 +: uresize s2_n 9 in
  let new_cnt = mux2 sum.:(8) (ones 8) (select sum 7 0) in
  let umin a b = mux2 (a <: b) a b in
  let umax a b = mux2 (a >: b) a b in
  let fresh = old_cnt ==:. 0 in
  let cov_word =
    concat_msb
      [ new_cnt
      ; mux2 fresh s2_min (umin old_min s2_min)
      ; mux2 fresh s2_max (umax old_max s2_max)
      ]
  in
  (* ---- image check (ENGINE.md, Image validation): a sweep over the whole store
     computes CRC-32 (zlib) one byte per cycle; image_valid only from a matching sweep ---- *)
  let image_valid = rv 1 in
  let sweeping = rv 1 in
  let sw_cnt = rv 13 in
  let sw_crc = Variable.reg (Reg_spec.override spec ~clear_to:(ones 32)) ~width:32 in
  let sw_byte =
    mux
      (select (sw_cnt.value -:. 1) 3 0)
      (List.init 16 ~f:(fun k -> select i.ram.rec_rdata ((8 * k) + 7) (8 * k)))
  in
  let crc_byte crc b =
    List.fold (List.init 8 ~f:Fn.id) ~init:(crc ^: uresize b 32) ~f:(fun c _ ->
      mux2 c.:(0) (srl c 1 ^: of_int ~width:32 0xEDB88320) (srl c 1))
  in
  let sw_crc_next = crc_byte sw_crc.value sw_byte in
  let sw_last = sw_cnt.value ==:. 4096 in
  let sw_match = sw_crc_next ^: ones 32 ==: h.crc_expect in
  let verify_go = h.verify &: in_idle &: ~:(sweeping.value) in
  let sweep_abort = sweeping.value &: (h.start |: h.rec_we |: h.crc_expect_we) in
  let store_we = h.rec_we &: in_idle &: ~:(sweeping.value) in
  let start_ok = h.start &: image_valid.value in
  ignore (image_valid.value -- "f_image_valid" : Signal.t);
  ignore (sweeping.value -- "f_sweeping" : Signal.t);
  ignore (sw_last -- "f_sw_last" : Signal.t);
  ignore (sw_cnt.value -- "f_sw_cnt" : Signal.t);
  ignore (sw_match -- "f_sw_match" : Signal.t);
  ignore (store_we -- "f_store_we" : Signal.t);
  let host_cov_we = h.cov_we &: in_idle &: ~:(s2_v.value) &: ~:(s1_v.value) &: ~:(sweeping.value) in
  ignore (host_cov_we -- "f_host_cov_we" : Signal.t);
  (* host access rules: refused accesses set host_err; the first cause is kept *)
  let recover_lat = rv 6 in
  let host_err = rv 1 in
  let host_err_cause = rv 3 in
  let tx_collision = rv 1 in
  let drop_cnt = List.init 5 ~f:(fun _ -> rv 8) in
  let drop_events = rx_drops @ [ vlog_drop; drop_now ] in
  let lane_active l = match List.nth lanes l with Some o -> o.Lane.O.active | None -> gnd in
  let err_cause =
    priority_select_with_default
      [ { With_valid.valid = h.rec_we &: ~:in_idle; value = of_int ~width:3 1 }
      ; { With_valid.valid =
            (h.cov_we |: h.cov_re) &: ~:in_idle
            |: (h.cov_we &: in_idle &: (s1_v.value |: s2_v.value))
        ; value = of_int ~width:3 2
        }
      ; { With_valid.valid =
            h.lane_we.:(0) &: lane_active 0 |: (h.lane_we.:(1) &: lane_active 1)
        ; value = of_int ~width:3 3
        }
      ; { With_valid.valid = h.start &: ~:(image_valid.value); value = of_int ~width:3 4 }
      ; { With_valid.valid = sweeping.value &: (h.rec_we |: h.cov_we |: h.cov_re)
        ; value = of_int ~width:3 5
        }
      ; { With_valid.valid = h.tx_push &: h.rx_to_tx; value = of_int ~width:3 6 }
      ]
      ~default:(zero 3)
  in
  let err_now = err_cause <>:. 0 in
  (* ---- sequential logic ---- *)
  (* prescaler: a free-running 9-bit counter, 0 at start; with /N the clocks count in
     cycles where its low log2 N bits are all 1 *)
  let pre = rv 9 in
  let tick =
    mux
      hdr.prescale
      [ vdd
      ; select pre.value 2 0 ==:. 7
      ; select pre.value 5 0 ==:. 63
      ; pre.value ==:. 511
      ]
  in
  let incr_clocks =
    List.mapi clocks ~f:(fun k c ->
      if_
        (act_en &: a_rst.:(k))
        [ c <--. 0 ]
        [ when_ (tick &: (c.value <>:. 0xFFFF)) [ c <-- c.value +:. 1 ] ])
  in
  compile
    [ lfsr
      <-- concat_msb
            [ select lfsr.value 14 0
            ; lfsr.value.:(15) ^: lfsr.value.:(13) ^: lfsr.value.:(12) ^: lfsr.value.:(10)
            ]
    ; pre <-- pre.value +:. 1
    ; proc incr_clocks
    ; when_ act_en [ to_logged <--. 0 ]
    ; when_
        (act_en &: drive)
        [ pout <-- p2; poe <-- o2 ]
    ; when_ act_en [ tx_sr <-- tx_next; rx_sr <-- rx_next; cnt <-- cnt_next ]
    ; when_ (entry_now &: hdr.irq_on_entry) [ irq_flag <--. 1 ]
    ; when_ h.irq_ack [ irq_flag <--. 0 ]
    ; when_ (rx_drop |: buf_drop |: (br_push &: tx_full)) [ rx_ovf <--. 1 ]
    ; when_ vlog_drop [ vlog_ovf <--. 1 ]
    ; when_ drop_now [ cov_ovr <--. 1 ]
    ; (* coverage pipeline *)
      s1_v <-- (cov_fire &: ~:(s1_v.value))
    ; s1_addr <-- cov_addr_now
    ; s1_raw <-- clip 13 c_w
    ; s1_sat <-- (c_w ==:. 0xFFFF)
    ; s1_age <-- a_w
    ; s2_v <-- s1_v.value
    ; s2_addr <-- s1_addr.value
    ; s2_two <-- merge_now
    ; s2_off1 <-- s1_off
    ; s2_off2 <-- off_now
    ; (* engine phases *)
      switch
        phase.value
        [ c2 phase_idle, []
        ; ( c2 phase_fetch
          , [ beat <-- beat.value +:. 1
            ; changed <-- changed_all
            ; multi <-- (multi.value |: (changed.value &: chg_now))
            ; proc
                (List.mapi ages2 ~f:(fun p a ->
                   if_
                     (chg_now.:(p) &: changed.value.:(p) &: ~:(multi.value.:(p)))
                     [ a <--. 1 ]
                     [ when_ (multi.value.:(p) &: (a.value <>:. 7)) [ a <-- a.value +:. 1 ] ]))
            ; proc
                (List.mapi ages ~f:(fun p a ->
                   if_
                     (chg_now.:(p) &: ~:(changed.value.:(p)))
                     [ a <--. 1 ]
                     [ when_ (changed.value.:(p) &: (a.value <>:. 7)) [ a <-- a.value +:. 1 ] ]))
            ; proc
                (List.mapi rec_b ~f:(fun k b ->
                   when_ (beat.value ==:. k + 1) [ b <-- i.ram.rec_rdata ]))
            ; when_ entry_now [ phase <--. phase_eval ]
            ] )
        ; ( c2 phase_eval
          , [ changed <--. 0
            ; multi <--. 0
            ; proc (List.map ages ~f:(fun a -> a <--. 0))
            ; if_
                any_fire
                [ when_
                    ~:self_loop
                    [ cur_loc <-- we.target; phase <--. phase_fetch; beat <--. 0 ]
                ]
                [ when_ (timeout_now &: ~:amb_now) [ to_logged <--. 1 ]
                ; when_
                    viol_now
                    [ switch
                        hdr.policy
                        [ c2 Policy.halt, [ phase <--. phase_idle; halted_viol <--. 1 ]
                        ; c2 Policy.continue, []
                        ; ( c2 Policy.recover
                          , [ cur_loc <-- recover_lat.value
                            ; phase <--. phase_fetch
                            ; beat <--. 0
                            ] )
                        ; c2 3, [ phase <--. phase_idle; halted_viol <--. 1 ]
                        ]
                    ]
                ]
            ] )
        ; c2 3, [ phase <--. phase_idle ]
        ]
    ; when_ h.stop [ phase <--. phase_idle; poe <--. 0 ]
    ; (* image check *)
      when_ (store_we |: h.crc_expect_we) [ image_valid <--. 0 ]
    ; when_
        verify_go
        [ sweeping <--. 1; sw_cnt <--. 0; sw_crc <-- ones 32; image_valid <--. 0 ]
    ; when_
        sweeping.value
        [ sw_cnt <-- sw_cnt.value +:. 1
        ; when_ (sw_cnt.value <>:. 0) [ sw_crc <-- sw_crc_next ]
        ; when_ sw_last [ sweeping <--. 0; image_valid <-- sw_match ]
        ; when_ sweep_abort [ sweeping <--. 0; image_valid <--. 0 ]
        ]
    ; if_
        h.err_clear
        [ host_err <--. 0; host_err_cause <--. 0 ]
        [ when_ (err_now &: ~:(host_err.value)) [ host_err <--. 1; host_err_cause <-- err_cause ] ]
    ; if_ h.err_clear [ tx_collision <--. 0 ] [ when_ tx_collision_now [ tx_collision <--. 1 ] ]
    ; proc
        (List.map2_exn drop_cnt drop_events ~f:(fun c ev ->
           if_
             h.drop_clear
             [ c <--. 0 ]
             [ when_ (ev &: (c.value <>:. 255)) [ c <-- c.value +:. 1 ] ]))
    ; when_
        start_ok
        [ phase <--. phase_fetch
        ; beat <--. 0
        ; cur_loc <-- h.start_loc
        ; recover_lat <-- h.recover_loc
        ; role <-- h.role
        ; pout <--. 0
        ; poe <--. 0
        ; changed <--. 0
        ; multi <--. 0
        ; halted_viol <--. 0
        ; irq_flag <--. 0
        ; rx_ovf <--. 0
        ; vlog_ovf <--. 0
        ; cov_ovr <--. 0
        ; proc (List.map clocks ~f:(fun c -> c <--. 0))
        ; pre <--. 0
        ]
    ];
  (* ---- SRAM ports ---- *)
  let fetch_rd = in_fetch &: (beat.value <:. beats) in
  let ram : _ Ram_out.t =
    { rec_addr =
        mux2
          fetch_rd
          (concat_msb [ cur_loc.value; select beat.value 1 0 ])
          (mux2 sweeping.value (select sw_cnt.value 11 4) h.rec_waddr)
    ; rec_re = fetch_rd |: sweeping.value
    ; rec_we = store_we
    ; rec_wdata = h.rec_wdata
    ; cov_addr =
        mux2 s2_v.value s2_addr.value (mux2 s1_v.value s1_addr.value h.cov_addr)
    ; cov_re = ~:(s2_v.value) &: ~:host_cov_we
    ; cov_we = s2_v.value |: host_cov_we
    ; cov_wdata = mux2 s2_v.value cov_word h.cov_wdata
    }
  in
  let status : _ Status.t =
    { running = ~:in_idle
    ; in_entry = in_fetch
    ; cur_loc = cur_loc.value
    ; accepting = in_eval &: hdr.accepting
    ; taken = reg spec any_fire
    ; taken_edge = reg spec winner
    ; viol = reg spec viol_now
    ; viol_kind = reg spec viol_kind_now
    ; timestamp
    ; tx_full
    ; tx_empty
    ; rx_data = rx_q
    ; rx_empty
    ; vlog_data = vlog_q
    ; vlog_empty
    ; cov_rdata = mux2 (in_idle &: ~:(sweeping.value)) i.ram.cov_rdata (zero 32)
    ; irq =
        rx_used >=: uresize (mux2 (h.rx_wm ==:. 0) (of_int ~width:5 1) h.rx_wm) (width rx_used)
        |: (h.tx_wm_en &: (tx_used <=: uresize h.tx_wm (width tx_used)))
        |: ~:vlog_empty
        |: halted_viol.value
        |: irq_flag.value
    ; halted_viol = halted_viol.value
    ; rx_overflow = rx_ovf.value
    ; vlog_overflow = vlog_ovf.value
    ; cov_overrun = cov_ovr.value
    ; image_valid = image_valid.value
    ; verify_busy = sweeping.value
    ; tx_collision = tx_collision.value
    ; drops = concat_lsb (List.map drop_cnt ~f:(fun c -> c.value))
    ; host_err = host_err.value
    ; host_err_cause = host_err_cause.value
    ; lane_active = concat_lsb (List.init 2 ~f:(fun l -> match List.nth lanes l with Some o -> o.Lane.O.active | None -> gnd))
    ; lane_status =
        concat_msb
          (List.rev
             (List.init 2 ~f:(fun l ->
                match List.nth lanes l with
                | Some (o : _ Lane.O.t) ->
                  concat_msb [ o.done_; o.crc_ok; o.sync_hit; o.error; gnd; o.err_kind ]
                | None -> zero 8)))
    }
  in
  (* open-drain pins drive only 0; a 1 releases the pin *)
  (* pin source select, then the open-drain output stage *)
  (* named for formal L4 (formal/lane_props.sv): prove.sh cuts the lane outputs there *)
  let l0 = lane_out 0 -- "f_lane0_out"
  and l1 = lane_out 1 -- "f_lane1_out"
  and pout_v = pout.value -- "f_pout" in
  ignore (poe.value -- "f_poe" : Signal.t);
  let pin_val =
    List.init 8 ~f:(fun p ->
      let e = pout_v.:(p) in
      mux
        (select h.pin_src ((3 * p) + 2) (3 * p))
        [ e; l0; ~:l0; l0 &: e; ~:l0 &: e; l1; ~:l1; l1 &: e ])
    |> concat_lsb
  in
  { pins_out = pin_val &: ~:(h.open_drain)
  ; pins_oe = poe.value &: ~:(h.open_drain &: pin_val)
  ; status
  ; ram
  }
;;

let hierarchical scope i =
  let module H = Hierarchy.In_scope (I) (O) in
  H.hierarchical ~scope ~name:"spex_core" create i
;;

module Core_i = I

(** Simulation top: the core plus behavioural single-port RAMs standing in for the
    2 x 1P_256x64 record macros (one 256 x 128 store) and the 1P_256x32 coverage macro. *)
module Top = struct
  module I = struct
    type 'a t =
      { clock : 'a
      ; clear : 'a
      ; pins_in : 'a [@bits 8]
      ; host : 'a Host_in.t [@rtlprefix "host_"]
      }
    [@@deriving hardcaml]
  end

  module O = struct
    type 'a t =
      { pins_out : 'a [@bits 8]
      ; pins_oe : 'a [@bits 8]
      ; status : 'a Status.t [@rtlprefix "st_"]
      }
    [@@deriving hardcaml]
  end

  let sp_ram ~clock ~size ~addr ~re ~we ~wdata =
    (Ram.create
       ~collision_mode:Read_before_write
       ~size
       ~write_ports:
         [| { write_clock = clock; write_address = addr; write_enable = we; write_data = wdata }
         |]
       ~read_ports:[| { read_clock = clock; read_address = addr; read_enable = re } |]
       ()).(0)
  ;;

  let create scope (i : _ I.t) : _ O.t =
    let ram_in = Ram_in.Of_signal.wires () in
    let core =
      hierarchical scope { Core_i.clock = i.clock; clear = i.clear; pins_in = i.pins_in; host = i.host; ram = ram_in }
    in
    let r = core.ram in
    Ram_in.Of_signal.assign
      ram_in
      { rec_rdata =
          sp_ram ~clock:i.clock ~size:256 ~addr:r.rec_addr ~re:r.rec_re ~we:r.rec_we ~wdata:r.rec_wdata
      ; cov_rdata =
          sp_ram ~clock:i.clock ~size:256 ~addr:r.cov_addr ~re:r.cov_re ~we:r.cov_we ~wdata:r.cov_wdata
      };
    { pins_out = core.pins_out; pins_oe = core.pins_oe; status = core.status }
  ;;
end
