open! Base
open! Stdio
open Spex
module H = Harness

let scl, sda = 0, 1

(* A software I2C controller, built from quarter-period steps of [q] cycles. Each
   step gives the levels the controller releases SCL and SDA to (1 = released) and
   whether it samples SDA in that step. The lines are wired-AND with the engine. *)
type step =
  { c : int
  ; d : int
  ; sample : bool
  }

let st ?(sample = false) c d = { c; d; sample }
let start = [ st 1 1; st 1 0; st 0 0 ]
let stop = [ st 0 0; st 1 0; st 1 1; st 1 1 ]
let send b = [ st 0 b; st 1 b; st 1 b; st 0 b ]
let recv = [ st 0 1; st 1 1; st ~sample:true 1 1; st 0 1 ]
let byte v = List.concat_map (List.range 0 8) ~f:(fun i -> send ((v lsr (7 - i)) land 1))
let recv_byte = List.concat (List.init 8 ~f:(fun _ -> recv))

let write addr data = start @ byte (addr lsl 1) @ recv @ List.concat_map data ~f:(fun b -> byte b @ recv) @ stop

let read addr n =
  start
  @ byte ((addr lsl 1) lor 1)
  @ recv
  @ List.concat
      (List.init n ~f:(fun k -> recv_byte @ send (if k = n - 1 then 1 else 0)))
  @ stop
;;

let controller ~q steps =
  let steps = Array.of_list ([ st 1 1; st 1 1 ] @ steps @ [ st 1 1; st 1 1 ]) in
  let now = ref 0 in
  let samples = ref [] in
  let device ~out ~oe =
    let k = min (!now / q) (Array.length steps - 1) in
    let s = steps.(k) in
    let eng_low p = (oe lsr p) land 1 = 1 && (out lsr p) land 1 = 0 in
    let c = if eng_low scl then 0 else s.c in
    let d = if eng_low sda then 0 else s.d in
    if s.sample && !now % q = q / 2 then samples := d :: !samples;
    Int.incr now;
    0xFC lor (d lsl sda) lor (c lsl scl)
  in
  device, Array.length steps * q, fun () -> List.rev !samples
;;

(* group the controller's samples into ACK bits and read bytes, by transaction shape *)
let bits_to_string l = String.concat (List.map l ~f:Int.to_string)

let run ~q ?(tx = []) ~addr steps =
  let t = H.create () in
  H.load t (Protocols.i2c_target ~scl ~sda);
  H.set t.i.host.open_drain 0b11;
  H.set t.i.host.match_addr addr;
  H.push_tx t tx;
  H.start t ();
  let device, len, samples = controller ~q steps in
  let base = t.cycle in
  t.device <- device;
  H.run_until t (fun () -> t.cycle - base > len + 20);
  let rx = H.drain_rx t in
  let v = H.drain_vlog t in
  printf "  RX FIFO: [%s], controller sampled SDA: %s, violations %d, location %d\n"
    (String.concat ~sep:" " (List.map rx ~f:(Printf.sprintf "%02x")))
    (bits_to_string (samples ()))
    (List.length v)
    (H.get t.o.status.cur_loc)
;;

let%expect_test "I2C target at 100 kHz and 400 kHz (40 MHz engine)" =
  List.iter [ "100 kHz", 100; "400 kHz", 25 ] ~f:(fun (name, q) ->
    printf "%s write to 0x50 (ACK bits expected 0000):\n" name;
    run ~q ~addr:0x50 (write 0x50 [ 0xDE; 0xAD; 0x5A ]);
    printf "%s write to 0x51, nobody there (expected 1, nothing received):\n" name;
    run ~q ~addr:0x50 (write 0x51 [ 0xDE ]);
    printf "%s read 2 bytes from 0x50 (expected ACK 0, then c3 = 11000011, 81 = 10000001):\n" name;
    run ~q ~addr:0x50 ~tx:[ 0xC3; 0x81 ] (read 0x50 2);
    printf "%s STOP after 3 bits of a data byte, then a new write (expected 0, 0, RX [77]):\n" name;
    let partial = start @ byte 0xA0 @ recv @ List.concat_map [ 1; 0; 1 ] ~f:send @ stop in
    run ~q ~addr:0x50 (partial @ write 0x50 [ 0x77 ]));
  [%expect {|
    100 kHz write to 0x50 (ACK bits expected 0000):
      RX FIFO: [de ad 5a], controller sampled SDA: 0000, violations 0, location 0
    100 kHz write to 0x51, nobody there (expected 1, nothing received):
      RX FIFO: [], controller sampled SDA: 11, violations 0, location 0
    100 kHz read 2 bytes from 0x50 (expected ACK 0, then c3 = 11000011, 81 = 10000001):
      RX FIFO: [], controller sampled SDA: 01100001110000001, violations 0, location 0
    100 kHz STOP after 3 bits of a data byte, then a new write (expected 0, 0, RX [77]):
      RX FIFO: [77], controller sampled SDA: 000, violations 0, location 0
    400 kHz write to 0x50 (ACK bits expected 0000):
      RX FIFO: [de ad 5a], controller sampled SDA: 0000, violations 0, location 0
    400 kHz write to 0x51, nobody there (expected 1, nothing received):
      RX FIFO: [], controller sampled SDA: 11, violations 0, location 0
    400 kHz read 2 bytes from 0x50 (expected ACK 0, then c3 = 11000011, 81 = 10000001):
      RX FIFO: [], controller sampled SDA: 01100001110000001, violations 0, location 0
    400 kHz STOP after 3 bits of a data byte, then a new write (expected 0, 0, RX [77]):
      RX FIFO: [77], controller sampled SDA: 000, violations 0, location 0
    |}]
;;
