open! Base
open! Stdio
open Spex
module H = Harness

(* Timestamps past 2^24 cycles. Reaching them by simulation would take hours, so the
   timestamp is preloaded (RTL and model together) to just below 2^24 and the UART
   checker logs glitches on both sides of the boundary, at every phase of the low 3
   bits (the borrow path of the age correction). Lockstep compares every logged
   word with the model, so a timestamp bug in any bit above 24 is caught. *)
let%expect_test "violation timestamps across 2^24 and 2^32" =
  let run base =
    let n = 32 in
    let t = H.create ~internal:true () in
    H.load t (Protocols.uart_rx ~pin:0 ~n);
    H.set t.i.host.recover_loc 0;
    H.preload_timestamp t base;
    H.start t ~role:Layout.Role.check ();
    let segs =
      List.concat_map (List.range 0 8) ~f:(fun k -> [ 1, (3 * n) + k; 0, 4; 1, 3 ])
    in
    let start_ts = H.get t.o.status.timestamp in
    Test_uart.drive_line t segs;
    H.cycles t (List.sum (module Int) segs ~f:snd + (4 * n));
    let v = H.drain_vlog t in
    printf "base %#x: %d violations, first %#x, last %#x, wrapped %b\n" base (List.length v)
      (List.hd_exn v).ts (List.last_exn v).ts
      ((List.last_exn v).ts < start_ts)
  in
  run ((1 lsl 24) - 200);
  run ((1 lsl 32) - 200);
  [%expect {|
    base 0xffff38: 8 violations, first 0xffff9f, last 0x100028c, wrapped false
    base 0xffffff38: 8 violations, first 0xffffff9f, last 0x28c, wrapped true
    |}]
;;
