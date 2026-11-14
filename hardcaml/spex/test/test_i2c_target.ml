open! Base
open! Stdio
open Spex
module H = Harness

let scl, sda = 0, 1

(* A software I2C controller, built from quarter-period steps of [q] cycles. Each
   step gives the levels the controller releases SCL and SDA to (1 = released) and
   whether it samples SDA in that step. The lines are wired-AND with the engine.
   Clock synchronisation (UM10204 3.1.7 / 3.1.9 [Memory]): while the controller
   releases SCL and the line stays low (the target stretching), its step time stops;
   [stretched] counts those cycles. *)
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
  let stretched = ref 0 in
  let samples = ref [] in
  let device ~out ~oe =
    let k = min (!now / q) (Array.length steps - 1) in
    let s = steps.(k) in
    let eng_low p = (oe lsr p) land 1 = 1 && (out lsr p) land 1 = 0 in
    let c = if eng_low scl then 0 else s.c in
    let d = if eng_low sda then 0 else s.d in
    if s.sample && !now % q = q / 2 then samples := d :: !samples;
    if s.c = 1 && c = 0 then Int.incr stretched else Int.incr now;
    0xFC lor (d lsl sda) lor (c lsl scl)
  in
  device, Array.length steps * q, (fun () -> List.rev !samples), fun () -> !stretched
;;

(* group the controller's samples into ACK bits and read bytes, by transaction shape *)
let bits_to_string l = String.concat (List.map l ~f:Int.to_string)

let run ~q ?(tx = []) ~addr steps =
  let t = H.create () in
  H.load t (Protocols.i2c_target ~scl ~sda ());
  H.set t.i.host.open_drain 0b11;
  H.set t.i.host.match_addr addr;
  H.push_tx t tx;
  H.start t ();
  let device, len, samples, _ = controller ~q steps in
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

(* Clock stretching with a slow host: the host reads the RX FIFO (write) or fills the TX
   FIFO (read) only every [every] cycles, one byte at a time. The target must hold SCL
   low while it has no room or no data, and the controller (which waits on SCL) must see
   every byte, in order, with ACKs. *)
let slow_host ~q ~every ?(pre = []) ?(tx = []) ~addr steps =
  let t = H.create () in
  H.load t (Protocols.i2c_target ~scl ~sda ());
  H.set t.i.host.open_drain 0b11;
  H.set t.i.host.match_addr addr;
  H.push_tx t pre;
  H.start t ();
  let device, len, samples, stretched = controller ~q steps in
  let base = t.cycle in
  t.device <- device;
  let rx = ref [] in
  let tx = ref tx in
  let longest = ref 0 and low = ref 0 in
  let scl_low () = H.get t.o.pins_oe land 1 = 1 && H.get t.o.pins_out land 1 = 0 in
  (* data setup at a release: cycles from the target's last SDA change to its SCL release *)
  let sda_drv () = H.get t.o.pins_oe land 2 = 2 && H.get t.o.pins_out land 2 = 0 in
  let last_sda = ref 0 and prev_sda = ref false and min_su = ref Int.max_value in
  (* run until the controller's steps are done (its time stops while stretched) *)
  while t.cycle - base < len + stretched () + 40 && t.cycle - base < 400_000 do
    let was_low = scl_low () in
    H.cycle t;
    let d = sda_drv () in
    if not (Bool.equal d !prev_sda) then last_sda := t.cycle;
    prev_sda := d;
    if was_low && not (scl_low ()) then min_su := min !min_su (t.cycle - !last_sda);
    if scl_low () then (Int.incr low; longest := max !longest !low) else low := 0;
    if (t.cycle - base) % every = 0
    then (
      if not (H.getb t.o.status.rx_empty)
      then (
        rx := H.get t.o.status.rx_data :: !rx;
        H.pulse t t.i.host.rx_pop 1);
      match !tx with
      | b :: rest ->
        H.push_tx t [ b ];
        tx := rest
      | [] -> ())
  done;
  let rx = List.rev !rx @ H.drain_rx t in
  printf "  RX: [%s], controller sampled SDA: %s, SCL stretched %d cycles (longest hold %d, data setup at release >= %s cycles), violations %d, location %d\n"
    (String.concat ~sep:" " (List.map rx ~f:(Printf.sprintf "%02x")))
    (bits_to_string (samples ()))
    (stretched ())
    !longest
    (if !min_su = Int.max_value then "-" else Int.to_string !min_su)
    (List.length (H.drain_vlog t))
    (H.get t.o.status.cur_loc)
;;

let%expect_test "I2C target clock stretching: slow host at 100 kHz and 400 kHz" =
  let data = List.init 12 ~f:(fun i -> 0x10 + i) in
  List.iter [ "100 kHz", 100; "400 kHz", 25 ] ~f:(fun (name, q) ->
    printf "%s write of 12 bytes, host reads one byte every 20000 cycles (RX FIFO 8 deep):\n" name;
    slow_host ~q ~every:20000 ~addr:0x50 (write 0x50 data);
    printf "%s read of 3 bytes, TX FIFO empty, host pushes one byte every 8000 cycles (expected ACK 0, a5 5a 3c):\n" name;
    slow_host ~q ~every:8000 ~tx:[ 0xA5; 0x5A; 0x3C ] ~addr:0x50 (read 0x50 3);
    printf "%s read of 2 bytes with both in the TX FIFO (no stretch expected):\n" name;
    slow_host ~q ~every:1_000_000 ~pre:[ 0xC3; 0x81 ] ~addr:0x50 (read 0x50 2));
  [%expect {|
    100 kHz write of 12 bytes, host reads one byte every 20000 cycles (RX FIFO 8 deep):
      RX: [10 11 12 13 14 15 16 17 18 19 1a 1b], controller sampled SDA: 0000000000000, SCL stretched 33015 cycles (longest hold 16590, data setup at release >= 13 cycles), violations 0, location 0
    100 kHz read of 3 bytes, TX FIFO empty, host pushes one byte every 8000 cycles (expected ACK 0, a5 5a 3c):
      RX: [], controller sampled SDA: 0101001010101101000111100, SCL stretched 12621 cycles (longest hold 4596, data setup at release >= 13 cycles), violations 0, location 0
    100 kHz read of 2 bytes with both in the TX FIFO (no stretch expected):
      RX: [], controller sampled SDA: 01100001110000001, SCL stretched 0 cycles (longest hold 0, data setup at release >= - cycles), violations 0, location 0
    400 kHz write of 12 bytes, host reads one byte every 20000 cycles (RX FIFO 8 deep):
      RX: [10 11 12 13 14 15 16 17 18 19 1a 1b], controller sampled SDA: 0000000000000, SCL stretched 68265 cycles (longest hold 19140, data setup at release >= 13 cycles), violations 0, location 0
    400 kHz read of 3 bytes, TX FIFO empty, host pushes one byte every 8000 cycles (expected ACK 0, a5 5a 3c):
      RX: [], controller sampled SDA: 0101001010101101000111100, SCL stretched 21171 cycles (longest hold 7146, data setup at release >= 13 cycles), violations 0, location 0
    400 kHz read of 2 bytes with both in the TX FIFO (no stretch expected):
      RX: [], controller sampled SDA: 01100001110000001, SCL stretched 0 cycles (longest hold 0, data setup at release >= - cycles), violations 0, location 0
    |}]
;;
