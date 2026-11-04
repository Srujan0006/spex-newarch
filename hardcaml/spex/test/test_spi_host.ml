(* The chip through its host SPI port only (GUIDE step 10): every test below talks to
   the engine through CS_n / SCK / MOSI / MISO, the way a board microcontroller would.
   Mutants for the port: mutation/mutate.py (host_spi.ml). *)

open! Base
open! Stdio
open Spex
module S = Spi_host

let hex l = String.concat ~sep:" " (List.map l ~f:(Printf.sprintf "%02x"))

let line t segments =
  let segs = ref segments in
  let left = ref 0 in
  let level = ref 1 in
  t.S.device
  <- (fun ~out:_ ~oe:_ ->
       (match !segs with
        | (l, d) :: rest when !left = 0 ->
          level := l;
          left := d;
          segs := rest
        | _ -> ());
       if !left > 0 then Int.decr left else level := 1;
       0xFE lor !level)
;;

let uart_tx_over_spi ~half ~n bytes =
  let t = S.create ~half () in
  let levels = ref [] in
  t.trace <- Some (fun pins -> levels := (pins land 1) :: !levels);
  S.load t (Protocols.uart_tx ~pin:0 ~n ());
  S.start t ();
  S.push_tx t bytes;
  (* wait for the TX FIFO to drain and the last stop bit *)
  let rec wait k =
    if k > 0 && (S.status t land 0x01 = 1 || S.read t ~space:S.Space.csr ~addr:6 1 |> List.hd_exn |> fun f -> f land 0x10 = 0)
    then wait (k - 1)
  in
  wait 1000;
  S.ticks t (12 * n);
  let decoded, _ = Test_uart.decode_uart (List.rev !levels) ~n in
  printf
    "SCK half period %d clocks: uio[0] decodes to %s (framing %s), %d cycles\n"
    half
    (hex (List.map decoded ~f:fst))
    (if List.for_all decoded ~f:snd then "ok" else "BAD")
    t.cycle
;;

let%expect_test "UART spec loaded, started and fed through SPI only; bytes decoded on uio[0]" =
  let bytes = [ Char.to_int 'S'; Char.to_int 'P'; Char.to_int 'E'; Char.to_int 'X'; 0x00; 0xFF; 0x55 ] in
  uart_tx_over_spi ~half:3 ~n:16 bytes;
  uart_tx_over_spi ~half:8 ~n:16 bytes;
  [%expect {|
    SCK half period 3 clocks: uio[0] decodes to 53 50 45 58 00 ff 55 (framing ok), 16458 cycles
    SCK half period 8 clocks: uio[0] decodes to 53 50 45 58 00 ff 55 (framing ok), 35128 cycles
    |}]
;;

let%expect_test "CSRs, STATUS during the command byte, timestamp" =
  let t = S.create () in
  printf "STATUS after reset: %02x\n" (S.status t);
  S.write t ~space:S.Space.csr ~addr:1 [ 0x31; 0x2A; 0x15; 0xC3; 0x5A ];
  printf "CONFIG..MATCH read back: %s\n" (hex (S.read t ~space:S.Space.csr ~addr:1 5));
  let ts () =
    S.read t ~space:S.Space.csr ~addr:S.csr_timestamp 4
    |> List.foldi ~init:0 ~f:(fun k acc b -> acc lor (b lsl (8 * k)))
  in
  let t0 = ts () in
  let t1 = ts () in
  printf "timestamp advances by one frame: %b\n" (t1 > t0 && t1 - t0 < 1000);
  [%expect {|
    STATUS after reset: 00
    CONFIG..MATCH read back: 31 2a 15 c3 5a
    timestamp advances by one frame: true
    |}]
;;

let%expect_test "RX FIFO read over SPI: UART receiver in Drive role" =
  let n = 16 in
  let t = S.create () in
  S.load t (Protocols.uart_rx ~pin:0 ~n);
  S.start t ();
  let bytes = [ 0x4F; 0x4B; 0x00; 0xFF; 0xA5 ] in
  line t ([ 1, 5 ] @ List.concat_map bytes ~f:(Test_uart.frame ~n));
  S.ticks t (12 * n * List.length bytes);
  printf "STATUS: %02x\n" (S.status t);
  (* a FIFO entry is popped only once its byte has been sent: no byte is lost
     between two frames *)
  printf "RX FIFO, 2 bytes read: %s\n" (hex (S.read t ~space:S.Space.rx ~addr:0 2));
  printf "then 5 more: %s\n" (hex (S.read t ~space:S.Space.rx ~addr:0 5));
  printf "STATUS: %02x\n" (S.status t);
  [%expect {|
    STATUS: a8
    RX FIFO, 2 bytes read: 4f 4b
    then 5 more: 00 ff a5 00 00
    STATUS: 80
    |}]
;;

let%expect_test "violation log over SPI: UART Check role, low stop bit" =
  let n = 32 in
  (* the timestamp crosses 2^24 between the two violations, so byte 5 of the two log
     entries differs (it catches a log popped after byte 4) *)
  let t = S.create ~internal:true () in
  S.preload_timestamp t ((1 lsl 24) - 15_658);
  S.load t (Protocols.uart_rx ~pin:0 ~n);
  S.start t ~role:Layout.Role.check ~recover:0 ();
  let bad = Test_uart.frame ~n 0x41 |> List.mapi ~f:(fun k (l, d) -> if k = 9 then 0, d else l, d) in
  let bad2 = Test_uart.frame ~n 0x43 |> List.mapi ~f:(fun k (l, d) -> if k = 9 then 0, d else l, d) in
  line t ([ 1, 5 ] @ bad @ [ 1, 2 * n ] @ Test_uart.frame ~n 0x42 @ [ 1, 2 * n ] @ bad2 @ [ 1, 2 * n ]);
  S.ticks t (40 * n);
  printf "STATUS: %02x\n" (S.status t);
  (* both entries in one frame: the address wraps from byte 5 to byte 0 of the next *)
  let e = S.read t ~space:S.Space.vlog ~addr:0 12 in
  List.iter [ List.take e 6; List.drop e 6 ] ~f:(fun e ->
    let w = List.foldi e ~init:0 ~f:(fun k acc b -> acc lor (b lsl (8 * k))) in
    printf
      "log entry: ts %d loc %d %s pins %02x\n"
      (w lsr 16)
      ((w lsr 10) land 0x3F)
      (Harness.kind_name ((w lsr 8) land 3))
      (w land 0xFF));
  printf "STATUS after reading them: %02x\n" (S.status t);
  printf "RX FIFO: %s\n" (hex (S.read t ~space:S.Space.rx ~addr:0 2));
  [%expect {|
    STATUS: ac
    log entry: ts 16776831 loc 2 TIMEOUT pins fe
    log entry: ts 16777599 loc 2 TIMEOUT pins fe
    STATUS after reading them: a8
    RX FIFO: 42 00
    |}]
;;

let%expect_test "coverage words written and read over SPI" =
  let t = S.create () in
  S.write t ~space:S.Space.coverage ~addr:(5 lsl 2) [ 0x11; 0x22; 0x33; 0x44; 0x55; 0x66; 0x77; 0x88 ];
  printf "{loc 1, edge 1..2}: %s\n" (hex (S.read t ~space:S.Space.coverage ~addr:(5 lsl 2) 8));
  printf "from byte 2: %s\n" (hex (S.read t ~space:S.Space.coverage ~addr:((5 lsl 2) + 2) 3));
  [%expect {|
    {loc 1, edge 1..2}: 11 22 33 44 55 66 77 88
    from byte 2: 33 44 55
    |}]
;;

let%expect_test "a frame aborted mid-byte does not shift the next one" =
  let t = S.create () in
  S.write t ~space:S.Space.csr ~addr:4 [ 0x81 ];
  (* CS_n goes high after 3 bits of a command byte *)
  S.set t.i.cs_n 0;
  S.ticks t (2 * t.half);
  for _ = 1 to 3 do
    S.set t.i.mosi 1;
    S.ticks t t.half;
    S.set t.i.sck 1;
    S.ticks t t.half;
    S.set t.i.sck 0
  done;
  S.set t.i.cs_n 1;
  S.ticks t (4 * t.half);
  printf "OPEN_DRAIN after an aborted frame: %s\n" (hex (S.read t ~space:S.Space.csr ~addr:4 1));
  S.write t ~space:S.Space.csr ~addr:4 [ 0x3C ];
  printf "and after a new write: %s\n" (hex (S.read t ~space:S.Space.csr ~addr:4 1));
  [%expect {|
    OPEN_DRAIN after an aborted frame: 81
    and after a new write: 3c
    |}]
;;

let can_tx_over_spi () =
  let n = Test_can.n in
  let t = S.create () in
  let node = Can_node.create ~n () in
  t.device
  <- (fun ~out ~oe ->
       let chip = if oe land 1 = 1 then out land 1 else 1 in
       let bus = chip land node.drive in
       Can_node.step node ~bus;
       0xFE lor bus);
  let f : Can_node.frame = { id = 0x5A5; data = [ 0xCA; 0xFE ] } in
  let bits = Test_can.frame_bits f in
  S.set_lane t 0 (Test_can.can_cfg ~dir:0 ~frame_bits:(List.length bits));
  S.set_pin_src t Layout.Pin_src.lane0_and_engine;
  S.write t ~space:S.Space.csr ~addr:S.csr_open_drain [ 1 ];
  S.load t (Protocols.can_tx ~pin:0 ~n ());
  S.push_tx t (Test_can.pack bits);
  S.start t ();
  S.ticks t (120 * n);
  printf "node received %s, stuff errors %d; lane 0 status %02x; STATUS %02x\n"
    (Sexp.to_string [%sexp (List.rev node.received : Can_node.frame list)])
    node.stuff_errors (S.lane_status t 0) (S.status t)
;;

let%expect_test "CAN TX configured and fed through SPI only" =
  can_tx_over_spi ();
  [%expect {| node received (((id 1445)(data(202 254)))), stuff errors 0; lane 0 status 80; STATUS 90 |}]
;;

let flags t = List.hd_exn (S.read t ~space:S.Space.csr ~addr:6 1)

let%expect_test "lane CSR writes: refused while the lane is Armed or Run, land in Idle or Done" =
  let t = S.create () in
  let open Spec in
  (* lane 1 RX is armed and stays armed (no traffic); lane 0 stays Idle *)
  let spec =
    { name = "arm"
    ; locs =
        [ loc "s" [ edge ~goto:"w" always (nop |> lane (Layout.Lane_cmd.go 1)) ]
        ; loc "w" ~accepting:true []
        ]
    }
  in
  let cfg = Test_can.can_cfg ~dir:1 ~frame_bits:27 in
  S.set_lane t 1 cfg;
  S.load t spec;
  S.start t ();
  S.ticks t 40;
  printf "lane 1 armed: FLAGS %02x\n" (flags t);
  S.set_lane t 1 { cfg with frame_bits = 35 };
  printf "write to lane 1 while armed: FLAGS %02x (host_err, cause 3)\n" (flags t);
  S.write t ~space:S.Space.csr ~addr:S.csr_ctrl [ 8 ];
  S.set_lane t 0 cfg;
  printf "write to lane 0, idle: FLAGS %02x\n" (flags t);
  [%expect {|
    lane 1 armed: FLAGS 10
    write to lane 1 while armed: FLAGS 1b (host_err, cause 3)
    write to lane 0, idle: FLAGS 10
    |}]
;;

let%expect_test "frame_bits written while lane 0 is Done is used by the next frame" =
  let n = Test_can.n in
  let t = S.create () in
  let node = Can_node.create ~n () in
  t.device
  <- (fun ~out ~oe ->
       let chip = if oe land 1 = 1 then out land 1 else 1 in
       let bus = chip land node.drive in
       Can_node.step node ~bus;
       0xFE lor bus);
  S.set_pin_src t Layout.Pin_src.lane0_and_engine;
  S.write t ~space:S.Space.csr ~addr:S.csr_open_drain [ 1 ];
  S.load t (Protocols.can_tx ~pin:0 ~n ());
  let send (f : Can_node.frame) =
    let bits = Test_can.frame_bits f in
    S.set_lane t 0 (Test_can.can_cfg ~dir:0 ~frame_bits:(List.length bits));
    S.push_tx t (Test_can.pack bits)
  in
  send { id = 0x111; data = [ 0xAA ] };
  S.start t ();
  S.ticks t (110 * n);
  printf "lane 0 status %02x (done)\n" (S.lane_status t 0);
  send { id = 0x222; data = [ 0x01; 0x02; 0x03; 0x04 ] };
  S.ticks t (140 * n);
  printf "node received %s; FLAGS %02x\n"
    (Sexp.to_string [%sexp (List.rev node.received : Can_node.frame list)])
    (flags t);
  [%expect {|
    lane 0 status 80 (done)
    node received (((id 273)(data(170)))((id 546)(data(1 2 3 4)))); FLAGS 10
    |}]
;;

let%expect_test "drop counters, WATERMARK and tx_collision over SPI" =
  let t = S.create () in
  S.load t Test_drops.pusher;
  let csr addr n = S.read t ~space:S.Space.csr ~addr n in
  let hex l = String.concat ~sep:" " (List.map l ~f:(Printf.sprintf "%02x")) in
  S.write t ~space:S.Space.csr ~addr:0x1C [ 0xA3 ];
  printf "WATERMARK reads back %s\n" (hex (csr 0x1C 1));
  S.start t ();
  S.ticks t 600;
  printf "drop counters 0x20..0x24: %s; 0x13 %s\n" (hex (csr 0x20 5)) (hex (csr 0x13 1));
  (* CTRL bit 5 clears the counters; the engine keeps pushing into the full FIFO *)
  S.stop t;
  S.write t ~space:S.Space.csr ~addr:S.csr_ctrl [ 0x20 ];
  printf "after CTRL bit 5: %s\n" (hex (csr 0x20 5));
  [%expect {|
    WATERMARK reads back a3
    drop counters 0x20..0x24: 00 00 ff 00 00; 0x13 80
    after CTRL bit 5: 00 00 00 00 00
    |}]
;;

let bridge_over_spi () =
  let t = S.create () in
  let node = Can_node.create ~n:Test_can.n () in
  let uart = ref [] in
  t.device
  <- (fun ~out ~oe ->
       let chip = if oe land 1 = 1 then out land 1 else 1 in
       let bus = chip land node.drive in
       Can_node.step node ~bus;
       let u = Harness.pin_level ~out ~oe 1 in
       uart := u :: !uart;
       0xFC lor bus lor (u lsl 1));
  S.set_lane t 1 Test_bridge.std_cfg;
  S.write t ~space:S.Space.csr ~addr:S.csr_open_drain [ 1 ];
  S.load ~rx_lanes:[ 1 ] t Test_bridge.spec;
  S.start t ~bridge:true ();
  (* the bridge arms its lane after 11 recessive bits; a frame before that is missed *)
  S.ticks t (12 * Test_can.n);
  Can_node.send node { id = 0x3C5; data = [ 0x53; 0x50; 0x45; 0x58 ] };
  S.ticks t ((200 * Test_can.n) + (100 * Test_bridge.baud));
  let bytes, _ = Test_uart.decode_uart (List.rev !uart) ~n:Test_bridge.baud in
  printf "UART %s; node acked %s; FLAGS %02x\n"
    (hex (List.map bytes ~f:fst))
    (Sexp.to_string [%sexp (node.acked : bool option)])
    (flags t);
  S.push_tx t [ 0x99 ];
  printf "host TX push while bridging: FLAGS %02x (host_err, cause 6)\n" (flags t)
;;

let%expect_test "CAN -> UART bridge set up and run through SPI only" =
  bridge_over_spi ();
  [%expect {|
    UART 53 50 45 58; node acked (true); FLAGS 10
    host TX push while bridging: FLAGS 1e (host_err, cause 6)
    |}]
;;
