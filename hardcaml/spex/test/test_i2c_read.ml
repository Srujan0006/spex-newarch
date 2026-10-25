open! Base
open! Stdio
open Spex
module H = Harness

let scl, sda = 0, 1

(* A software I2C target at [addr] that answers reads with [data] (then 0xFF).
   Logs START, the address byte with its ACK, each byte sent with the controller's
   ACK (+) or NACK (-), and STOP. *)
let read_target ~addr data =
  let data = ref data in
  let prev_scl = ref 1
  and prev_sda = ref 1 in
  let sda_low = ref false in
  let log = ref [] in
  let mode = ref `Idle in
  let bits = ref 0
  and sh = ref 0 in
  let cur = ref 0xFF in
  let next () =
    match !data with
    | b :: rest ->
      data := rest;
      b
    | [] -> 0xFF
  in
  let device ~out ~oe =
    let eng_low p = (oe lsr p) land 1 = 1 && (out lsr p) land 1 = 0 in
    let c = if eng_low scl then 0 else 1 in
    let d = if eng_low sda || !sda_low then 0 else 1 in
    if c = 1 && !prev_scl = 1 && d <> !prev_sda
    then
      if d = 0
      then (
        log := "START" :: !log;
        mode := `Addr;
        bits := 0;
        sh := 0)
      else (
        log := "STOP" :: !log;
        mode := `Idle;
        sda_low := false);
    let rose = !prev_scl = 0 && c = 1
    and fell = !prev_scl = 1 && c = 0 in
    (match !mode with
     | `Addr when rose ->
       sh := ((!sh lsl 1) lor d) land 0xFF;
       Int.incr bits
     | `Addr when fell && !bits = 8 ->
       let ok = !sh = (addr lsl 1) lor 1 in
       log := Printf.sprintf "A:%02x%s" !sh (if ok then "+" else "-") :: !log;
       if ok
       then (
         sda_low := true;
         mode := `Addr_ack)
       else mode := `Idle
     | `Addr_ack when fell ->
       cur := next ();
       bits := 0;
       sda_low := (!cur lsr 7) land 1 = 0;
       mode := `Send
     | `Send when fell ->
       Int.incr bits;
       if !bits = 8
       then (
         sda_low := false;
         mode := `M_ack)
       else sda_low := (!cur lsr (7 - !bits)) land 1 = 0
     | `M_ack when rose ->
       log := Printf.sprintf "%02x%s" !cur (if d = 0 then "+" else "-") :: !log;
       mode := if d = 0 then `M_ack_fall else `Idle
     | `M_ack_fall when fell ->
       cur := next ();
       bits := 0;
       sda_low := (!cur lsr 7) land 1 = 0;
       mode := `Send
     | _ -> ());
    prev_scl := c;
    prev_sda := d;
    0xFC lor (d lsl sda) lor (c lsl scl)
  in
  device, fun () -> List.rev !log
;;

let run ~q ~n data =
  let t = H.create () in
  let spec = Protocols.i2c_controller_read ~scl ~sda ~q in
  H.load t spec;
  H.set t.i.host.open_drain 0b11;
  H.set t.i.host.recover_loc (Spec.index_of spec "nack");
  let device, log = read_target ~addr:0x50 data in
  t.device <- device;
  H.start t ();
  H.push_tx t (((0x50 lsl 1) lor 1) :: List.init n ~f:(fun _ -> 0));
  H.run_until t (fun () -> H.getb t.o.status.tx_empty && H.get t.o.status.cur_loc = 0 && t.cycle > 2000);
  H.cycles t 50;
  printf "  bus: %s\n  RX FIFO: %s, violations %d\n"
    (String.concat ~sep:" " (log ()))
    (String.concat ~sep:" " (List.map (H.drain_rx t) ~f:(Printf.sprintf "%02x")))
    (List.length (H.drain_vlog t))
;;

let%expect_test "I2C controller read" =
  List.iter [ "100 kHz", 100; "400 kHz", 25 ] ~f:(fun (name, q) ->
    printf "%s, read 3 bytes:\n" name;
    run ~q ~n:3 [ 0xC3; 0x5A; 0x81 ];
    printf "%s, read 1 byte:\n" name;
    run ~q ~n:1 [ 0x7E ]);
  [%expect {|
    100 kHz, read 3 bytes:
      bus: START A:a1+ c3+ 5a+ 81- STOP
      RX FIFO: c3 5a 81, violations 0
    100 kHz, read 1 byte:
      bus: START A:a1+ 7e- STOP
      RX FIFO: 7e, violations 0
    400 kHz, read 3 bytes:
      bus: START A:a1+ c3+ 5a+ 81- STOP
      RX FIFO: c3 5a 81, violations 0
    400 kHz, read 1 byte:
      bus: START A:a1+ 7e- STOP
      RX FIFO: 7e, violations 0
    |}]
;;
