open! Base
open! Stdio
open Spex
module H = Harness

(* ---------------- SPI ---------------- *)

let cs, sck, mosi, miso = 0, 1, 2, 3
let bitv v p = (v lsr p) land 1

(* An SPI mode-0 target: samples MOSI on SCK rise, shifts MISO on SCK fall,
   replies with [replies] one byte per transfer. Also records SCK half periods. *)
let spi_target replies =
  let replies = ref replies in
  let cur = ref 0 in
  let rx = ref 0 in
  let nbits = ref 0 in
  let got = ref [] in
  let prev_cs = ref 1 in
  let prev_sck = ref 0 in
  let miso_v = ref 0 in
  let last_sck_edge = ref (-1) in
  let half_periods = ref [] in
  let now = ref 0 in
  let load () =
    (match !replies with
     | r :: rest ->
       cur := r;
       replies := rest
     | [] -> cur := 0);
    nbits := 0;
    rx := 0;
    miso_v := bitv !cur 7
  in
  let device ~out ~oe =
    Int.incr now;
    let lv p = H.pin_level ~out ~oe p in
    let c = lv cs
    and k = lv sck in
    if !prev_cs = 1 && c = 0 then load ();
    if c = 0 && k <> !prev_sck
    then (
      if !last_sck_edge >= 0 then half_periods := (!now - !last_sck_edge) :: !half_periods;
      last_sck_edge := !now);
    if c = 0 && !prev_sck = 0 && k = 1
    then (
      rx := ((!rx lsl 1) lor lv mosi) land 0xFF;
      Int.incr nbits;
      if !nbits = 8
      then (
        got := !rx :: !got;
        nbits := 0))
    else if c = 0 && !prev_sck = 1 && k = 0
    then (
      if !nbits = 0 then load () else miso_v := bitv !cur (7 - !nbits));
    if c = 1 then last_sck_edge := -1;
    prev_cs := c;
    prev_sck := k;
    let lines = H.pullups ~out ~oe in
    lines land lnot (1 lsl miso) lor (!miso_v lsl miso)
  in
  device, (fun () -> List.rev !got), fun () -> !half_periods
;;

let%expect_test "SPI controller mode 0, 2.5 MHz SCK from 40 MHz" =
  let t = H.create () in
  let hp = 8 in
  H.load t (Protocols.spi_controller ~cs ~sck ~mosi ~miso ~hp);
  let device, got, halves = spi_target [ 0xC3; 0x5A; 0x01; 0x80 ] in
  t.device <- device;
  H.start t ();
  H.push_tx t [ 0x9F; 0x00; 0xA5; 0x7E ];
  H.run_until t (fun () -> H.getb t.o.status.tx_empty && H.get t.o.status.cur_loc = 0 && t.cycle > 500);
  H.cycles t 20;
  let pr l = String.concat ~sep:" " (List.map l ~f:(Printf.sprintf "%02x")) in
  printf "target received (MOSI): %s\n" (pr (got ()));
  printf "controller received (MISO): %s\n" (pr (H.drain_rx t));
  let groups = List.sort (halves ()) ~compare |> List.group ~break:( <> ) in
  printf "SCK half periods (cycles x count): %s\n"
    (List.map groups ~f:(fun g -> Printf.sprintf "%d x %d" (List.hd_exn g) (List.length g))
     |> String.concat ~sep:", ");
  printf "CS high at end: %d\n" (H.pin_level ~out:(H.get t.o.pins_out) ~oe:(H.get t.o.pins_oe) cs);
  [%expect {|
    target received (MOSI): 9f 00 a5 7e
    controller received (MISO): c3 5a 01 80
    SCK half periods (cycles x count): 8 x 60, 24 x 3
    CS high at end: 1
    |}]
;;

(* ---------------- I2C ---------------- *)

let scl, sda = 0, 1

(* An I2C target with address [addr]: ACKs its address and every data byte, stores
   them, and optionally stretches SCL for [stretch] cycles after each ACK. Lines are
   open-drain with pull-ups. Also watches the bus for illegal SDA changes. *)
let i2c_target ~addr ~stretch =
  let sda_low = ref false in
  let scl_low_until = ref 0 in
  let now = ref 0 in
  let prev_scl = ref 1
  and prev_sda = ref 1 in
  let bits = ref 0
  and sh = ref 0
  and in_ack = ref false
  and active = ref false
  and first = ref true
  and addressed = ref false in
  let log = ref [] in
  let scl_fell = ref 0
  and longest_low = ref 0 in
  let device ~out ~oe =
    Int.incr now;
    let eng_low p = (oe lsr p) land 1 = 1 && (out lsr p) land 1 = 0 in
    let scl_l = if eng_low scl || !now < !scl_low_until then 0 else 1 in
    let sda_l = if eng_low sda || !sda_low then 0 else 1 in
    if scl_l = 1 && !prev_scl = 1 && sda_l <> !prev_sda
    then (
      if sda_l = 0
      then (
        log := "START" :: !log;
        active := true;
        first := true;
        addressed := false;
        bits := 0;
        sh := 0)
      else (
        log := "STOP" :: !log;
        active := false));
    if !active && !prev_scl = 0 && scl_l = 1 && not !in_ack
    then (
      sh := ((!sh lsl 1) lor sda_l) land 0xFF;
      Int.incr bits);
    if !active && !prev_scl = 1 && scl_l = 0
    then
      if !in_ack
      then (
        in_ack := false;
        sda_low := false;
        if stretch > 0 then scl_low_until := !now + stretch)
      else if !bits = 8
      then (
        bits := 0;
        let ack =
          if !first then (
            addressed := !sh lsr 1 = addr;
            !addressed)
          else !addressed
        in
        log := Printf.sprintf "%s%02x%s" (if !first then "A:" else "") !sh (if ack then "+" else "-") :: !log;
        first := false;
        in_ack := true;
        sda_low := ack);
    if !prev_scl = 1 && scl_l = 0 then scl_fell := !now;
    if !prev_scl = 0 && scl_l = 1 then longest_low := max !longest_low (!now - !scl_fell);
    prev_scl := scl_l;
    prev_sda := sda_l;
    0xFC lor (sda_l lsl sda) lor (scl_l lsl scl)
  in
  device, (fun () -> List.rev !log), fun () -> !longest_low
;;

let run_i2c ~addr_on_bus ~stretch bytes =
  let t = H.create () in
  let q = 25 (* 400 kHz at 40 MHz: 100 cycles per bit *) in
  let spec = Protocols.i2c_controller_write ~scl ~sda ~q in
  H.load t spec;
  H.set t.i.host.open_drain 0b11;
  H.set t.i.host.recover_loc (Spec.index_of spec "nack");
  let device, log, longest_low = i2c_target ~addr:0x50 ~stretch in
  t.device <- device;
  H.start t ();
  H.push_tx t ((addr_on_bus lsl 1) :: bytes);
  H.run_until t (fun () -> H.getb t.o.status.tx_empty && H.get t.o.status.cur_loc = 0 && t.cycle > 3000);
  H.cycles t 50;
  printf "bus: %s\n" (String.concat ~sep:" " (log ()));
  List.iter (H.drain_vlog t) ~f:(fun v ->
    printf "%s in %s at cycle %d\n" (H.kind_name v.kind) (List.nth_exn spec.locs v.loc).name v.ts);
  printf "longest SCL low: %d cycles\n" (longest_low ())
;;

let%expect_test "I2C controller write, 400 kHz" =
  run_i2c ~addr_on_bus:0x50 ~stretch:0 [ 0x00; 0x12; 0x34 ];
  [%expect {|
    bus: START A:a0+ 00+ 12+ 34+ STOP
    longest SCL low: 50 cycles
    |}]
;;

let%expect_test "I2C: target stretches SCL by 300 cycles after each ACK" =
  run_i2c ~addr_on_bus:0x50 ~stretch:300 [ 0xBE; 0xEF ];
  [%expect {|
    bus: START A:a0+ be+ ef+ STOP
    longest SCL low: 300 cycles
    |}]
;;

let%expect_test "I2C: nobody at the address -> NACK is a TIMEOUT, then STOP" =
  run_i2c ~addr_on_bus:0x51 ~stretch:0 [];
  [%expect {|
    bus: START A:a2- STOP
    TIMEOUT in ack_hi at cycle 1025
    longest SCL low: 75 cycles
    |}]
;;
