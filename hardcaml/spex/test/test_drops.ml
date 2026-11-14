(* Loss accounting and watermarks (ENGINE.md, Limits and loss accounting): saturating
   8-bit drop counters per source, cleared only by the host (CTRL bit 5); RX and TX
   watermark IRQs. In lockstep with the model (harness).
   Mutants (mutation/mutate.py): a drop counter wraps instead of saturating; a partial
   RX byte lost at stop is not counted; the RX watermark is compared with > instead of
   >=. *)

open! Base
open! Stdio
open Spex
open Layout
module H = Harness

let drops t =
  let d = H.get t.H.o.status.drops in
  Printf.sprintf
    "rx lane0 %d, rx lane1 %d, rx engine %d, log %d, coverage %d"
    (d land 0xFF)
    ((d lsr 8) land 0xFF)
    ((d lsr 16) land 0xFF)
    ((d lsr 24) land 0xFF)
    ((d lsr 32) land 0xFF)
;;

(* the engine pushes rx_sr into the RX FIFO every 3 cycles *)
let pusher =
  let open Spec in
  { name = "pusher"
  ; locs = [ loc "p" [ edge ~goto:"p" (always |> after 2) (nop |> rx Rx_op.push |> reset 0) ] ]
  }
;;

let%expect_test "engine RX drops: counted per push, saturate at 255, cleared by the host" =
  let t = H.create () in
  H.load t pusher;
  H.start t ();
  (* the RX FIFO is 32 deep: full after about 96 cycles *)
  H.cycles t 120;
  printf "after 120 cycles:  %s (rx_overflow %d)\n" (drops t) (H.get t.o.status.rx_overflow);
  H.cycles t 1000;
  printf "after 1120 cycles: %s\n" (drops t);
  (* a restart clears rx_overflow but not the counters *)
  H.start t ();
  printf "after a restart:   %s (rx_overflow %d)\n" (drops t) (H.get t.o.status.rx_overflow);
  H.pulse t t.i.host.drop_clear 1;
  printf "after drop_clear:  %s\n" (drops t);
  [%expect {|
    after 120 cycles:  rx lane0 0, rx lane1 0, rx engine 7, log 0, coverage 0 (rx_overflow 1)
    after 1120 cycles: rx lane0 0, rx lane1 0, rx engine 255, log 0, coverage 0
    after a restart:   rx lane0 0, rx lane1 0, rx engine 255, log 0, coverage 0 (rx_overflow 0)
    after drop_clear:  rx lane0 0, rx lane1 0, rx engine 0, log 0, coverage 0
    |}]
;;

let%expect_test "stop drops a partial RX byte; it is counted for its lane" =
  let open Spec in
  let spec =
    { name = "two_rx"
    ; locs =
        [ loc "go0" [ edge ~goto:"go1" always (nop |> lane (Lane_cmd.go 0)) ]
        ; loc "go1" [ edge ~goto:"wait" always (nop |> lane (Lane_cmd.go 1)) ]
        ; loc "wait" ~accepting:true []
        ]
    }
  in
  let t = H.create () in
  H.load t spec;
  let rx l : int Lane_cfg.t =
    { (Test_can.can_cfg ~dir:1 ~frame_bits:64) with
      clk_pin_en = 1
    ; clk_pin = 1
    ; data_pin = 0
    ; stuff = 0
    ; crc_width = 0
    ; readback = 0
    ; div_int = 8 + l
    }
  in
  Test_can.set_lane t 0 (rx 0);
  Test_can.set_lane t 1 (rx 1);
  (* a clock on pin 1, one edge every 4 cycles *)
  let n = ref 0 in
  t.device <- (fun ~out:_ ~oe:_ -> Int.incr n; if !n / 4 % 2 = 0 then 0xFD else 0xFF);
  H.start t ();
  H.cycles t 30;
  printf "lanes active %d; %s\n" (H.get t.o.status.lane_active) (drops t);
  H.pulse t t.i.host.stop 1;
  printf "after stop: lanes active %d; %s\n" (H.get t.o.status.lane_active) (drops t);
  [%expect {|
    lanes active 3; rx lane0 0, rx lane1 0, rx engine 0, log 0, coverage 0
    after stop: lanes active 0; rx lane0 1, rx lane1 1, rx engine 0, log 0, coverage 0
    |}]
;;

let%expect_test "violation log drops: a TIMEOUT every visit, nobody pops the log" =
  let open Spec in
  let spec = { name = "timeouts"; locs = [ loc "a" ~policy:Policy.recover ~inv:(0, 3) [] ] } in
  let t = H.create () in
  H.load t spec;
  H.set t.i.host.recover_loc 0;
  H.start t ();
  H.cycles t 200;
  printf "%s (log overflow %d)\n" (drops t) (H.get t.o.status.vlog_overflow);
  [%expect {| rx lane0 0, rx lane1 0, rx engine 0, log 25, coverage 0 (log overflow 1) |}]
;;

let%expect_test "watermarks: IRQ while RX holds >= rx_wm bytes, or TX holds <= tx_wm" =
  let t = H.create () in
  H.load t pusher;
  let h = t.i.host in
  (* RX: the engine fills the FIFO one byte every 3 cycles *)
  List.iter [ 0; 4; 20 ] ~f:(fun wm ->
    H.set h.rx_wm wm;
    (* empty the FIFO left by the last run, with the engine stopped *)
    H.pulse t h.stop 1;
    ignore (H.drain_rx t : int list);
    H.start t ();
    let seen = ref [] in
    for _ = 1 to 75 do
      H.cycle t;
      let e = Queue.length t.model.rx_fifo, H.get t.o.status.irq in
      if not (List.mem !seen e ~equal:Poly.equal) then seen := e :: !seen
    done;
    printf
      "rx_wm %d: (bytes, irq) %s\n"
      wm
      (String.concat ~sep:" " (List.rev_map !seen ~f:(fun (b, i) -> Printf.sprintf "(%d,%d)" b i))));
  H.pulse t h.stop 1;
  H.set h.rx_wm 7;
  H.set h.rx_pop 1;
  H.cycles t 30;
  H.set h.rx_pop 0;
  (* TX: the host fills it; nothing pops while stopped *)
  H.set h.tx_wm 2;
  H.set h.tx_wm_en 1;
  for k = 0 to 4 do
    H.cycle t;
    printf "tx_wm 2: %d bytes, irq %d\n" (Queue.length t.model.tx_fifo) (H.get t.o.status.irq);
    H.push_tx t [ k ]
  done;
  H.set h.tx_wm_en 0;
  H.set h.tx_wm 7;
  H.cycle t;
  printf "tx_wm_en 0, tx_wm 7, %d bytes: irq %d\n" (Queue.length t.model.tx_fifo) (H.get t.o.status.irq);
  [%expect {|
    rx_wm 0: (bytes, irq) (0,0) (1,1) (2,1) (3,1) (4,1) (5,1) (6,1) (7,1) (8,1) (9,1) (10,1) (11,1) (12,1) (13,1) (14,1) (15,1) (16,1) (17,1) (18,1) (19,1) (20,1) (21,1) (22,1) (23,1) (24,1)
    rx_wm 4: (bytes, irq) (0,0) (1,0) (2,0) (3,0) (4,1) (5,1) (6,1) (7,1) (8,1) (9,1) (10,1) (11,1) (12,1) (13,1) (14,1) (15,1) (16,1) (17,1) (18,1) (19,1) (20,1) (21,1) (22,1) (23,1) (24,1)
    rx_wm 20: (bytes, irq) (0,0) (1,0) (2,0) (3,0) (4,0) (5,0) (6,0) (7,0) (8,0) (9,0) (10,0) (11,0) (12,0) (13,0) (14,0) (15,0) (16,0) (17,0) (18,0) (19,0) (20,1) (21,1) (22,1) (23,1) (24,1)
    tx_wm 2: 0 bytes, irq 1
    tx_wm 2: 1 bytes, irq 1
    tx_wm 2: 2 bytes, irq 1
    tx_wm 2: 3 bytes, irq 0
    tx_wm 2: 4 bytes, irq 0
    tx_wm_en 0, tx_wm 7, 5 bytes: irq 0
    |}]
;;
