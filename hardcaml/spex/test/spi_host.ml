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

let create ?(half = 3) ?(internal = false) () =
  let config = if internal then Cyclesim.Config.trace_all else Cyclesim.Config.default in
  let sim = Sim.create ~config (Chip.Sim_top.create (Scope.create ~flatten_design:true ())) in
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

(** Lane configuration bytes, as the host writes them to space 6 (Host_spi). *)
let lane_bytes (c : int Layout.Lane_cfg.t) =
  let le v n = List.init n ~f:(fun k -> (v lsr (8 * k)) land 0xFF) in
  le c.div_int 2
  @ [ c.div_frac
    ; c.dir lor (c.clk_pin_en lsl 1) lor (c.clk_edge lsl 2) lor (c.code lsl 3) lor (c.lsb_first lsl 5)
      lor (c.readback lsl 6) lor (c.crc_inv lsl 7)
    ; c.clk_pin lor (c.data_pin lsl 3)
    ; c.stuff lor (c.stuff_len lsl 2)
    ; c.crc_width
    ; 0
    ]
  @ le c.poly 4 @ le c.init 4 @ le c.sync 2 @ le c.sync_mask 2 @ le c.frame_bits 2
;;

let set_lane t l cfg = write t ~space:Space.lanes ~addr:(32 * l) (lane_bytes cfg)

let set_pin_src t v = write t ~space:Space.csr ~addr:0x10 [ v land 0xFF; (v lsr 8) land 0xFF; (v lsr 16) land 0xFF ]

let lane_status t l = List.hd_exn (read t ~space:Space.csr ~addr:(0x0C + l) 1)

(** Set the engine's free-running timestamp (as [Harness.preload_timestamp], without a
    model). Needs [create ~internal:true]. *)
let preload_timestamp t ts =
  let reg name =
    match Cyclesim.lookup_reg_by_name t.sim name with
    | Some r -> r
    | None -> failwith ("no register " ^ name)
  in
  Cyclesim.Reg.of_int (reg "ts_reg") ts;
  Cyclesim.Reg.of_int (reg "ts_hi_m1") (((ts lsr 3) - 1) land 0x1FFF_FFFF)
;;
