(* Bit lane on its own: RTL ([Lane]) against the reference model ([Lane_model]) every
   cycle, under random configurations, commands and pin activity; then TX -> RX
   loopback for every line code and stuffing mode. *)

open! Base
open! Stdio
open! Hardcaml
open Spex
open Layout
module Sim = Cyclesim.With_interface (Lane.I) (Lane.O)

type lane =
  { sim : Sim.t
  ; i : Bits.t ref Lane.I.t
  ; o : Bits.t ref Lane.O.t
  ; model : Lane_model.t
  ; fifo : int Queue.t
  ; rx : int Queue.t
  ; mutable cycle : int
  }

let set r v = r := Bits.of_int ~width:(Bits.width !r) v
let get r = Bits.to_int !r

let create (cfg : int Lane_cfg.t) =
  let sim = Sim.create (Lane.create (Scope.create ~flatten_design:true ())) in
  let i = Cyclesim.inputs sim in
  (* outputs as seen before the clock edge: this cycle's strobes and the state *)
  let o = Cyclesim.outputs ~clock_edge:Before sim in
  i.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.clear := Bits.gnd;
  Lane_cfg.iter2 i.cfg cfg ~f:set;
  { sim; i; o; model = Lane_model.create (); fifo = Queue.create (); rx = Queue.create (); cycle = 0 }
;;

let cfg_of l = Lane_cfg.map l.i.cfg ~f:get

(** One cycle with pins [pins_s] (this cycle) and [pins_q] (last cycle) and command [k]. *)
let cycle l ~pins_s ~pins_q (k : Lane_model.cmd) =
  let head = Queue.peek l.fifo in
  set l.i.pins_s pins_s;
  set l.i.pins_q pins_q;
  set l.i.tx_head (Option.value head ~default:0);
  set l.i.tx_empty (Bool.to_int (Option.is_none head));
  set l.i.go (Bool.to_int k.go);
  set l.i.end_ (Bool.to_int k.end_);
  set l.i.crc_cmd (Bool.to_int k.crc);
  set l.i.reset (Bool.to_int k.reset);
  Cyclesim.cycle l.sim;
  let rtl =
    ( get l.o.out
    , get l.o.pop = 1
    , (if get l.o.push = 1 then Some (get l.o.push_data) else None)
    , [ get l.o.done_; get l.o.crc_ok; get l.o.sync_hit; get l.o.error ]
    , get l.o.err_kind )
  in
  let r_lost = get l.o.lost = 1 in
  let out_before = l.model.out in
  let flags_before = List.map (Lane_model.flags l.model) ~f:Bool.to_int in
  let kind_before = l.model.kind in
  let s = Lane_model.step l.model (cfg_of l) k ~pins_s ~pins_q ~tx_head:head in
  let mdl = out_before, s.pop, s.push, flags_before, kind_before in
  let r_out, r_pop, r_push, r_flags, r_kind = rtl in
  if not
       (r_out = out_before
        && Bool.equal r_pop s.pop
        && Option.equal Int.equal r_push s.push
        && List.equal Int.equal r_flags flags_before
        && r_kind = kind_before
        && Bool.equal r_lost s.lost)
  then
    raise_s
      [%message
        "lane RTL and model disagree"
          ~cycle:(l.cycle : int)
          (r_out : int)
          (r_pop : bool)
          (r_push : int option)
          (r_flags : int list)
          (r_kind : int)
          (r_lost : bool)
          ~mdl_lost:(s.lost : bool)
          ~mdl:(mdl : int * bool * int option * int list * int)];
  if s.pop then ignore (Queue.dequeue_exn l.fifo : int);
  Option.iter s.push ~f:(Queue.enqueue l.rx);
  l.cycle <- l.cycle + 1
;;

let random_cfg rs : int Lane_cfg.t =
  let int n = Random.State.int rs n in
  let width = int 33 in
  let left v = if width = 0 then 0 else (v land ((1 lsl width) - 1)) lsl (32 - width) in
  { dir = int 2
  ; div_int = 4 + int 20
  ; div_frac = (if int 2 = 0 then 0 else int 256)
  ; clk_pin_en = Bool.to_int (int 5 = 0)
  ; clk_pin = int 8
  ; clk_edge = int 2
  ; code = int 4
  ; stuff = int 3
  ; stuff_len = 1 + int 7
  ; poly = left (Random.State.bits rs)
  ; init = left (Random.State.bits rs)
  ; crc_width = width
  ; crc_inv = int 2
  ; sync = int 0x10000
  ; sync_mask = (if int 2 = 0 then 0 else int 0x10000)
  ; data_pin = int 8
  ; lsb_first = int 2
  ; readback = int 2
  ; frame_bits = int 40
  }
;;

let%expect_test "lane RTL and model agree: 400 random configurations x 3000 cycles" =
  let pushes = ref 0
  and pops = ref 0
  and errors = ref 0
  and crc_oks = ref 0
  and dones = ref 0 in
  for seed = 1 to 400 do
    let rs = Random.State.make [| seed |] in
    let int n = Random.State.int rs n in
    let l = create (random_cfg rs) in
    for _ = 1 to 20 do
      Queue.enqueue l.fifo (int 256)
    done;
    let pins = ref (int 256)
    and q = ref 0 in
    let seen_done = ref false in
    for _ = 1 to 3000 do
      let prev = !pins in
      (* the data pin follows the lane's own output half the time, like a bus *)
      if int 6 = 0 then pins := !pins lxor (1 lsl int 8);
      if int 2 = 0
      then (
        let p = (cfg_of l).data_pin in
        pins := (!pins land lnot (1 lsl p)) lor (l.model.out lsl p));
      let k : Lane_model.cmd =
        match int 60 with
        | 0 -> { Lane_model.no_cmd with go = true }
        | 1 -> { Lane_model.no_cmd with end_ = true }
        | 2 | 3 -> { Lane_model.no_cmd with crc = true }
        | 4 when int 4 = 0 -> { Lane_model.no_cmd with reset = true }
        | _ -> Lane_model.no_cmd
      in
      cycle l ~pins_s:!pins ~pins_q:!q k;
      q := prev;
      ignore q;
      q := !pins;
      if l.model.error then Int.incr errors;
      if l.model.crc_ok then Int.incr crc_oks;
      if Lane_model.equal_mode l.model.mode Done then seen_done := true
    done;
    if !seen_done then Int.incr dones;
    pushes := !pushes + Queue.length l.rx;
    pops := !pops + (20 - Queue.length l.fifo)
  done;
  printf
    "pushes %d, pops %d, configurations reaching Done %d, cycles with error %d, with crc_ok %d\n"
    !pushes !pops !dones !errors !crc_oks;
  [%expect {| pushes 1733, pops 3697, configurations reaching Done 40, cycles with error 24952, with crc_ok 0 |}]
;;

(* ---- TX -> RX loopback ---- *)

let loopback ~code ~stuff ~stuff_len ~div_int ~div_frac bytes =
  let crc_width = 15 in
  let base : int Lane_cfg.t =
    { dir = 0
    ; div_int
    ; div_frac
    ; clk_pin_en = 0
    ; clk_pin = 0
    ; clk_edge = 0
    ; code
    ; stuff
    ; stuff_len
    ; poly = 0x4599 lsl (32 - crc_width)
    ; init = 0
    ; crc_width
    ; crc_inv = 0
    ; sync = 0
    ; sync_mask = 0
    ; data_pin = 0
    ; lsb_first = 1
    ; readback = 0
    ; frame_bits = 8 * List.length bytes
    }
  in
  let tx = create base in
  let rx = create { base with dir = 1; data_pin = 1 } in
  List.iter bytes ~f:(Queue.enqueue tx.fifo);
  (* the wire: TX out on pin 0, delayed 2 cycles (a synchroniser) onto pin 1 *)
  let d1 = ref 1
  and d2 = ref 1
  and q = ref 0xFF in
  let go = { Lane_model.no_cmd with go = true }
  and crc = { Lane_model.no_cmd with crc = true } in
  let pins () = 0xFC lor !d2 lsl 1 lor tx.model.out in
  let step ktx krx =
    let p = pins () in
    cycle tx ~pins_s:p ~pins_q:!q ktx;
    cycle rx ~pins_s:p ~pins_q:!q krx;
    q := p;
    d2 := !d1;
    d1 := tx.model.out
  in
  step Lane_model.no_cmd go;
  for _ = 1 to 3 do
    step Lane_model.no_cmd Lane_model.no_cmd
  done;
  step go crc;
  step crc Lane_model.no_cmd;
  let n = ref 0 in
  while (not (Lane_model.equal_mode rx.model.mode Done)) && !n < 20_000 && not rx.model.error do
    step Lane_model.no_cmd Lane_model.no_cmd;
    Int.incr n
  done;
  let got = Queue.to_list rx.rx in
  printf
    "code %d stuff %d/%d div %d+%d/256: %s, rx crc_ok %b, error %b, %d cycles\n"
    code
    stuff
    stuff_len
    div_int
    div_frac
    (if List.equal Int.equal got bytes then "bytes match" else "BYTES DIFFER")
    rx.model.crc_ok
    rx.model.error
    !n
;;

let%expect_test "TX -> RX loopback: every line code and stuffing mode" =
  let bytes = [ 0x00; 0xFF; 0xA5; 0x3C; 0x80; 0x01; 0xFE; 0x7F ] in
  loopback ~code:Code.nrz ~stuff:0 ~stuff_len:5 ~div_int:16 ~div_frac:0 bytes;
  loopback ~code:Code.nrz ~stuff:1 ~stuff_len:5 ~div_int:16 ~div_frac:0 bytes;
  loopback ~code:Code.nrz ~stuff:1 ~stuff_len:5 ~div_int:13 ~div_frac:77 bytes;
  loopback ~code:Code.nrzi ~stuff:2 ~stuff_len:6 ~div_int:16 ~div_frac:0 bytes;
  (* Manchester: the frame starts with a 1 bit (802.3 preamble style), see ENGINE.md *)
  loopback ~code:Code.manchester ~stuff:0 ~stuff_len:5 ~div_int:16 ~div_frac:0 (0x55 :: bytes);
  loopback ~code:Code.manchester ~stuff:0 ~stuff_len:5 ~div_int:20 ~div_frac:100 (0x55 :: bytes);
  [%expect {|
    code 0 stuff 0/5 div 16+0/256: bytes match, rx crc_ok true, error false, 1258 cycles
    code 0 stuff 1/5 div 16+0/256: bytes match, rx crc_ok true, error false, 1354 cycles
    code 0 stuff 1/5 div 13+77/256: bytes match, rx crc_ok true, error false, 1124 cycles
    code 1 stuff 2/6 div 16+0/256: bytes match, rx crc_ok true, error false, 1306 cycles
    code 2 stuff 0/5 div 16+0/256: bytes match, rx crc_ok true, error false, 1390 cycles
    code 2 stuff 0/5 div 20+100/256: bytes match, rx crc_ok true, error false, 1770 cycles
    |}]
;;
