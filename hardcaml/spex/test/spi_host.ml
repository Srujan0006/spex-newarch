(** Host model: drives the chip ([Chip.Sim_top]) through its SPI pins only, as a
    microcontroller on the Tiny Tapeout board would. Mode 0: MOSI changes while SCK is
    low, both sides sample on the rising edge. [half] is the SCK half period in engine
    clocks (Host_spi needs >= 3). *)

open! Base
open! Hardcaml
open Spex
module Sim = Cyclesim.With_interface (Chip.Sim_top.I) (Chip.Sim_top.O)

type t =
  { sim : Sim.t
  ; i : Bits.t ref Chip.Sim_top.I.t
  ; o : Bits.t ref Chip.Sim_top.O.t
  ; half : int
  ; mutable cycle : int
  ; mutable device : out:int -> oe:int -> int
  ; mutable trace : (int -> unit) option
  }

let set r v = r := Bits.of_int ~width:(Bits.width !r) v
let get r = Bits.to_int !r

let create ?(half = 3) () =
  let sim = Sim.create (Chip.Sim_top.create (Scope.create ~flatten_design:true ())) in
  let i = Cyclesim.inputs sim in
  let o = Cyclesim.outputs sim in
  set i.cs_n 1;
  i.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.clear := Bits.gnd;
  { sim; i; o; half; cycle = 0; device = Harness.pullups; trace = None }
;;

let tick t =
  let pins = t.device ~out:(get t.o.pins_out) ~oe:(get t.o.pins_oe) land 0xFF in
  set t.i.pins_in pins;
  Option.iter t.trace ~f:(fun f -> f pins);
  Cyclesim.cycle t.sim;
  t.cycle <- t.cycle + 1
;;

let ticks t n =
  for _ = 1 to n do
    tick t
  done
;;

(** One CS_n-low frame: send [bytes], return what MISO sent during each byte. *)
let frame t bytes =
  set t.i.cs_n 0;
  ticks t (2 * t.half);
  let miso =
    List.map bytes ~f:(fun b ->
      let r = ref 0 in
      for k = 7 downto 0 do
        set t.i.mosi ((b lsr k) land 1);
        ticks t t.half;
        r := (!r lsl 1) lor get t.o.miso;
        set t.i.sck 1;
        ticks t t.half;
        set t.i.sck 0
      done;
      !r)
  in
  ticks t t.half;
  set t.i.cs_n 1;
  ticks t (2 * t.half);
  miso
;;

module Space = Host_spi.Space

let header ~read ~space ~addr =
  [ (if read then 0x80 else 0) lor space; (addr lsr 8) land 0xFF; addr land 0xFF ]
;;

let write t ~space ~addr data = ignore (frame t (header ~read:false ~space ~addr @ data) : int list)

let read t ~space ~addr n =
  List.drop (frame t (header ~read:true ~space ~addr @ List.init n ~f:(fun _ -> 0))) 3
;;

(** STATUS, as MISO sends it during the command byte. *)
let status t = List.hd_exn (frame t [ 0 ])

let csr_ctrl = 0
let csr_config = 1
let csr_start_loc = 2
let csr_recover = 3
let csr_open_drain = 4
let csr_timestamp = 8

(** Load a compiled spec into the location store: one frame per location, 64 bytes
    (4 beats, little-endian) from address {loc, 0, 0}. *)
let load t (spec : Spec.t) =
  Array.iteri (Spec.compile ~warn:ignore spec) ~f:(fun loc record ->
    let bytes = List.init 64 ~f:(fun k -> Bits.to_int (Bits.select record ((8 * k) + 7) (8 * k))) in
    write t ~space:Space.records ~addr:(loc lsl 6) bytes)
;;

let start t ?(loc = 0) ?(recover = 0) ?(role = Layout.Role.drive) ?(cover = false) () =
  write
    t
    ~space:Space.csr
    ~addr:csr_config
    [ role lor (if cover then 4 else 0); loc; recover ];
  write t ~space:Space.csr ~addr:csr_ctrl [ 1 ]
;;

let stop t = write t ~space:Space.csr ~addr:csr_ctrl [ 2 ]
let push_tx t bytes = write t ~space:Space.tx ~addr:0 bytes
