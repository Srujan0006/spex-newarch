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
    ; viol_kind : 'a [@bits 2]
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
  mux rp mem, empty, full, push &: full
;;

let phase_idle = 0
let phase_fetch = 1
let phase_eval = 2
let c2 n = Signal.of_int ~width:2 n

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
  let timestamp = reg_fb spec ~width:32 ~f:(fun t -> t +:. 1) in
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
  let tx_q, tx_empty, tx_full, _ =
    small_fifo spec ~depth:8 ~push:h.tx_push ~pop:tx_pop ~d:h.tx_data
  in
  let rx_push = wire 1 in
  let rx_q, rx_empty, rx_full, rx_drop =
    small_fifo spec ~depth:8 ~push:rx_push ~pop:h.rx_pop ~d:rx_sr.value
  in
  let vlog_push = wire 1 in
  let vlog_d = wire 48 in
  let vlog_q, vlog_empty, _, vlog_drop =
    small_fifo spec ~depth:8 ~push:vlog_push ~pop:h.vlog_pop ~d:vlog_d
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
    @ List.init 8 ~f:(fun _ -> gnd)
  in
  let changed_all = changed.value |: chg_now in
  let is_stress = role.value ==:. Role.stress in
  let fire_of (e : Signal.t Edge.t) =
    let c = clk_of e.clk in
    let pin_ok = (pins_s ^: e.pin_val) &: e.pin_mask ==:. 0 in
    let chg_ok = e.chg_mask ==:. 0 |: (changed_all &: e.chg_mask <>:. 0) in
    let win_ok = c >=: e.lo &: (c <=: e.hi) in
    let dat_ok = mux e.flag flags ^: e.flag_inv in
    let str_ok =
      ~:is_stress
      |: mux
           e.stress
           [ vdd; c ==: e.lo; c ==: e.hi; select lfsr.value 3 0 ==:. 0 |: (c ==: e.hi) ]
    in
    e.valid &: pin_ok &: chg_ok &: win_ok &: dat_ok &: str_ok
  in
  let fires = List.map edges ~f:(fun e -> in_eval &: fire_of e) in
  let any_fire = reduce ~f:( |: ) fires in
  let winner =
    match fires with
    | [ f0; f1; f2; _ ] ->
      mux2 f0 (of_int ~width:2 0) (mux2 f1 (of_int ~width:2 1) (mux2 f2 (of_int ~width:2 2) (of_int ~width:2 3)))
    | _ -> assert false
  in
  let we = Edge.Of_signal.mux winner edges in
  let self_loop = we.target ==: cur_loc.value in
  (* ---- violations ---- *)
  let ic = clk_of hdr.inv_clk in
  let timeout_now =
    in_eval &: ~:any_fire &: hdr.inv_en &: (ic >: hdr.inv_hi) &: ~:(to_logged.value)
  in
  let unexp_now = in_eval &: ~:any_fire &: (changed_all &: hdr.watch <>:. 0) in
  let viol_now = timeout_now |: unexp_now in
  let viol_kind_now = concat_msb [ timeout_now; unexp_now ] in
  vlog_push <== viol_now;
  (* A change latched during entry is logged with the cycle it was seen, not the
     cycle EVAL got to it: each pin keeps the age of its latched change. *)
  let ages = List.init 8 ~f:(fun _ -> rv 3) in
  let watched_age =
    List.mapi ages ~f:(fun p a ->
      mux2 (changed.value.:(p) &: hdr.watch.:(p)) a.value (zero 3))
    |> tree ~arity:2 ~f:(function
      | [ a ] -> a
      | [ a; b ] -> mux2 (a >: b) a b
      | _ -> assert false)
  in
  (* timestamp - age without a 32-bit subtract: a 3-bit subtract on the low bits,
     and a register that always holds timestamp[31:3] - 1 for the borrow case *)
  let ts_hi_m1 =
    reg_fb
      (Reg_spec.override spec ~clear_to:(ones 29))
      ~width:29
      ~f:(fun x -> mux2 (select timestamp 2 0 ==:. 7) (x +:. 1) x)
  in
  let age = mux2 unexp_now watched_age (zero 3) in
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
  tx_pop <== (act_en &: is_load);
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
  rx_push <== (act_en &: (a_rx_op ==:. Rx_op.push));
  let cnt_next =
    mux a_cnt_op [ cnt.value; cnt.value -:. 1; of_int ~width:8 7; of_int ~width:8 8 ]
  in
  (* ---- coverage: read in S1, merge and write in S2; 1 SRAM access per cycle ---- *)
  let cov_fire = any_fire &: h.cover_en in
  let cov_addr_now = concat_msb [ cur_loc.value; winner ] in
  let c_w = clk_of we.clk in
  let off_now = mux2 (c_w >:. 4095) (ones 12) (select c_w 11 0) in
  let s1_v = rv 1 in
  let s1_addr = rv 8 in
  let s1_off = rv 12 in
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
  let host_cov_we = h.cov_we &: in_idle &: ~:(s2_v.value) &: ~:(s1_v.value) in
  (* ---- sequential logic ---- *)
  let incr_clocks =
    List.mapi clocks ~f:(fun k c ->
      if_
        (act_en &: a_rst.:(k))
        [ c <--. 0 ]
        [ when_ (c.value <>:. 0xFFFF) [ c <-- c.value +:. 1 ] ])
  in
  compile
    [ lfsr
      <-- concat_msb
            [ select lfsr.value 14 0
            ; lfsr.value.:(15) ^: lfsr.value.:(13) ^: lfsr.value.:(12) ^: lfsr.value.:(10)
            ]
    ; proc incr_clocks
    ; when_ act_en [ to_logged <--. 0 ]
    ; when_
        (act_en &: drive)
        [ pout <-- p2; poe <-- o2 ]
    ; when_ act_en [ tx_sr <-- tx_next; rx_sr <-- rx_next; cnt <-- cnt_next ]
    ; when_ (entry_now &: hdr.irq_on_entry) [ irq_flag <--. 1 ]
    ; when_ h.irq_ack [ irq_flag <--. 0 ]
    ; when_ rx_drop [ rx_ovf <--. 1 ]
    ; when_ vlog_drop [ vlog_ovf <--. 1 ]
    ; when_ drop_now [ cov_ovr <--. 1 ]
    ; (* coverage pipeline *)
      s1_v <-- (cov_fire &: ~:(s1_v.value))
    ; s1_addr <-- cov_addr_now
    ; s1_off <-- off_now
    ; s2_v <-- s1_v.value
    ; s2_addr <-- s1_addr.value
    ; s2_two <-- merge_now
    ; s2_off1 <-- s1_off.value
    ; s2_off2 <-- off_now
    ; (* engine phases *)
      switch
        phase.value
        [ c2 phase_idle, []
        ; ( c2 phase_fetch
          , [ beat <-- beat.value +:. 1
            ; changed <-- changed_all
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
            ; proc (List.map ages ~f:(fun a -> a <--. 0))
            ; if_
                any_fire
                [ when_
                    ~:self_loop
                    [ cur_loc <-- we.target; phase <--. phase_fetch; beat <--. 0 ]
                ]
                [ when_ timeout_now [ to_logged <--. 1 ]
                ; when_
                    viol_now
                    [ switch
                        hdr.policy
                        [ c2 Policy.halt, [ phase <--. phase_idle; halted_viol <--. 1 ]
                        ; c2 Policy.continue, []
                        ; ( c2 Policy.recover
                          , [ cur_loc <-- h.recover_loc
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
    ; when_
        h.start
        [ phase <--. phase_fetch
        ; beat <--. 0
        ; cur_loc <-- h.start_loc
        ; role <-- h.role
        ; pout <--. 0
        ; poe <--. 0
        ; changed <--. 0
        ; halted_viol <--. 0
        ; irq_flag <--. 0
        ; rx_ovf <--. 0
        ; vlog_ovf <--. 0
        ; cov_ovr <--. 0
        ; proc (List.map clocks ~f:(fun c -> c <--. 0))
        ]
    ];
  (* ---- SRAM ports ---- *)
  let fetch_rd = in_fetch &: (beat.value <:. beats) in
  let ram : _ Ram_out.t =
    { rec_addr = mux2 fetch_rd (concat_msb [ cur_loc.value; select beat.value 1 0 ]) h.rec_waddr
    ; rec_re = fetch_rd
    ; rec_we = h.rec_we &: in_idle
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
    ; cov_rdata = i.ram.cov_rdata
    ; irq = ~:rx_empty |: ~:vlog_empty |: halted_viol.value |: irq_flag.value
    ; halted_viol = halted_viol.value
    ; rx_overflow = rx_ovf.value
    ; vlog_overflow = vlog_ovf.value
    ; cov_overrun = cov_ovr.value
    }
  in
  (* open-drain pins drive only 0; a 1 releases the pin *)
  { pins_out = pout.value &: ~:(h.open_drain)
  ; pins_oe = poe.value &: ~:(h.open_drain &: pout.value)
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
