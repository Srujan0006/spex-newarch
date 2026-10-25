(** Test harness: the Hardcaml simulation of [Engine.Top], with the reference model
    stepped in lockstep on every cycle. Any difference on any output raises, so every
    protocol test is also an RTL-versus-model equivalence test. *)

open! Base
open! Hardcaml
open Spex
module Sim = Cyclesim.With_interface (Engine.Top.I) (Engine.Top.O)

type t =
  { sim : Sim.t
  ; i : Bits.t ref Engine.Top.I.t
  ; o : Bits.t ref Engine.Top.O.t
  ; model : Model.t
  ; mutable cycle : int
  ; mutable device : out:int -> oe:int -> int
      (** what the outside world puts on the 8 protocol pins this cycle *)
  ; mutable trace : (int -> unit) option (** called with the pin levels each cycle *)
  ; waves : Hardcaml_waveterm.Waveform.t option
  ; mutable on_cycle : (inputs:Bits.t list -> outputs:Bits.t list -> unit) option
      (** called after each cycle with the inputs applied and the outputs seen *)
  }

(** Called on every new harness; used to record test vectors for the Verilog run. *)
let on_create : (t -> unit) ref = ref ignore

let set r v = r := Bits.of_int ~width:(Bits.width !r) v
let get r = Bits.to_int !r
let getb r = Bits.to_bool !r

(** Pins pulled up, nothing else driving. *)
let pullups ~out ~oe = out land oe lor (lnot oe land 0xFF)

let rec create ?(waves = false) ?(internal = false) () =
  let t = create_raw ~waves ~internal in
  !on_create t;
  t

and create_raw ~waves ~internal =
  let config = if internal then Cyclesim.Config.trace_all else Cyclesim.Config.default in
  let sim = Sim.create ~config (Engine.Top.create (Scope.create ~flatten_design:true ())) in
  let waves, sim =
    if waves
    then (
      let w, sim = Hardcaml_waveterm.Waveform.create sim in
      Some w, sim)
    else None, sim
  in
  let i = Cyclesim.inputs sim in
  let o = Cyclesim.outputs sim in
  i.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.clear := Bits.gnd;
  { sim; i; o; model = Model.create (); cycle = 0; device = pullups; trace = None; waves; on_cycle = None }
;;

let model_inputs (t : t) : Model.inputs =
  let h = t.i.host in
  { pins_in = get t.i.pins_in
  ; start = getb h.start
  ; stop = getb h.stop
  ; role = get h.role
  ; start_loc = get h.start_loc
  ; recover_loc = get h.recover_loc
  ; cover_en = getb h.cover_en
  ; open_drain = get h.open_drain
  ; match_addr = get h.match_addr
  ; irq_ack = getb h.irq_ack
  ; rec_we = getb h.rec_we
  ; rec_waddr = get h.rec_waddr
  ; rec_wdata = !(h.rec_wdata)
  ; tx_push = getb h.tx_push
  ; tx_data = get h.tx_data
  ; rx_pop = getb h.rx_pop
  ; vlog_pop = getb h.vlog_pop
  ; cov_addr = get h.cov_addr
  ; cov_we = getb h.cov_we
  ; cov_wdata = get h.cov_wdata
  ; lane0 = Layout.Lane_cfg.map h.lane0 ~f:get
  ; lane1 = Layout.Lane_cfg.map h.lane1 ~f:get
  ; pin_src = get h.pin_src
  }
;;

let rtl_outputs (t : t) : Model.outputs =
  let s = t.o.status in
  { pins_out = get t.o.pins_out
  ; pins_oe = get t.o.pins_oe
  ; running = getb s.running
  ; in_entry = getb s.in_entry
  ; cur_loc = get s.cur_loc
  ; accepting = getb s.accepting
  ; taken = getb s.taken
  ; taken_edge = get s.taken_edge
  ; viol = getb s.viol
  ; viol_kind = get s.viol_kind
  ; timestamp = get s.timestamp
  ; tx_full = getb s.tx_full
  ; tx_empty = getb s.tx_empty
  ; rx_data = get s.rx_data
  ; rx_empty = getb s.rx_empty
  ; vlog_data = get s.vlog_data
  ; vlog_empty = getb s.vlog_empty
  ; cov_rdata = get s.cov_rdata
  ; irq = getb s.irq
  ; halted_viol = getb s.halted_viol
  ; rx_overflow = getb s.rx_overflow
  ; vlog_overflow = getb s.vlog_overflow
  ; cov_overrun = getb s.cov_overrun
  ; lane_status = get s.lane_status
  }
;;

(** One clock cycle. The pins seen this cycle come from [t.device]. *)
let cycle t =
  let pins = t.device ~out:(get t.o.pins_out) ~oe:(get t.o.pins_oe) land 0xFF in
  set t.i.pins_in pins;
  Option.iter t.trace ~f:(fun f -> f pins);
  let mi = model_inputs t in
  let applied = Engine.Top.I.to_list t.i |> List.map ~f:( ! ) in
  Model.step t.model mi;
  Cyclesim.cycle t.sim;
  Option.iter t.on_cycle ~f:(fun f ->
    f ~inputs:applied ~outputs:(Engine.Top.O.to_list t.o |> List.map ~f:( ! )));
  t.cycle <- t.cycle + 1;
  (* FIFO heads are only defined when the FIFO is not empty *)
  let norm (o : Model.outputs) =
    { o with
      rx_data = (if o.rx_empty then 0 else o.rx_data)
    ; vlog_data = (if o.vlog_empty then 0 else o.vlog_data)
    }
  in
  let rtl = norm (rtl_outputs t) in
  let mdl = norm (Model.outputs t.model mi) in
  if not (Model.equal_outputs rtl mdl)
  then
    raise_s
      [%message
        "RTL and model disagree" ~cycle:(t.cycle : int) (rtl : Model.outputs) (mdl : Model.outputs)]
;;

let cycles t n =
  for _ = 1 to n do
    cycle t
  done
;;

(** Hold [r] at [v] for one cycle, then put it back to 0. *)
let pulse t r v =
  set r v;
  cycle t;
  set r 0
;;

let load t (spec : Spec.t) =
  let records = Spec.compile ~warn:ignore spec in
  let h = t.i.host in
  Array.iteri records ~f:(fun loc record ->
    List.iteri (Spec.beats_of record) ~f:(fun b word ->
      set h.rec_waddr ((loc lsl 2) lor b);
      h.rec_wdata := word;
      pulse t h.rec_we 1));
  h.rec_wdata := Bits.zero 128
;;

let start t ?(loc = 0) ?(role = Layout.Role.drive) () =
  set t.i.host.start_loc loc;
  set t.i.host.role role;
  pulse t t.i.host.start 1
;;

let push_tx t bytes =
  List.iter bytes ~f:(fun b ->
    set t.i.host.tx_data b;
    pulse t t.i.host.tx_push 1)
;;

(** Run until [f ()] holds, or fail after [limit] cycles. *)
let run_until ?(limit = 1_000_000) t f =
  let n = ref 0 in
  while not (f ()) do
    cycle t;
    Int.incr n;
    if !n > limit then failwith "run_until: limit reached"
  done
;;

let drain_rx t =
  let out = ref [] in
  while not (getb t.o.status.rx_empty) do
    out := get t.o.status.rx_data :: !out;
    pulse t t.i.host.rx_pop 1
  done;
  List.rev !out
;;

type violation =
  { ts : int
  ; loc : int
  ; kind : int
  ; pins : int
  }

let drain_vlog t =
  let out = ref [] in
  while not (getb t.o.status.vlog_empty) do
    let w = get t.o.status.vlog_data in
    out
    := { ts = w lsr 16; loc = (w lsr 10) land 0x3F; kind = (w lsr 8) land 3; pins = w land 0xFF }
       :: !out;
    pulse t t.i.host.vlog_pop 1
  done;
  List.rev !out
;;

let kind_name k =
  match k with
  | 1 -> "UNEXPECTED"
  | 2 -> "TIMEOUT"
  | 3 -> "UNEXPECTED+TIMEOUT"
  | _ -> "?"
;;

(** Coverage word {count, min, max} for edge [e] of location [loc]. Engine must be idle. *)
let coverage t ~loc ~e =
  set t.i.host.cov_addr ((loc lsl 2) lor e);
  cycle t;
  cycle t;
  let w = get t.o.status.cov_rdata in
  (w lsr 24) land 0xFF, (w lsr 12) land 0xFFF, w land 0xFFF
;;

let clear_coverage t =
  for a = 0 to 255 do
    set t.i.host.cov_addr a;
    set t.i.host.cov_wdata 0;
    pulse t t.i.host.cov_we 1
  done
;;

let pin_level ~out ~oe p = (pullups ~out ~oe lsr p) land 1

(** Set the free-running timestamp (RTL and model together), so tests can reach
    timestamps that would take hours of simulation. Needs [create ~internal:true]. *)
let preload_timestamp t ts =
  let reg name =
    match Cyclesim.lookup_reg_by_name t.sim name with
    | Some r -> r
    | None -> failwith ("no register " ^ name)
  in
  Cyclesim.Reg.of_int (reg "ts_reg") ts;
  Cyclesim.Reg.of_int (reg "ts_hi_m1") (((ts lsr 3) - 1) land 0x1FFF_FFFF);
  t.model.timestamp <- ts
;;
