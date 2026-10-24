(* The other two roles from the same specs: Stress (move edges inside their timing
   windows on purpose) and Cover (count every edge and record its timing margins). *)

open! Base
open! Stdio
open Spex
open Layout
module H = Harness

let bit_widths ~role ~stress =
  let n = 32
  and jitter = 4 in
  let t = H.create () in
  H.load t (Protocols.uart_tx ~jitter ~stress ~pin:0 ~n ());
  let levels = ref [] in
  t.trace <- Some (fun pins -> levels := (pins land 1) :: !levels);
  H.start t ~role ();
  H.push_tx t [ 0x55; 0x55; 0x55; 0x55 ];
  H.run_until t (fun () -> H.getb t.o.status.tx_empty && H.get t.o.status.cur_loc = 0 && t.cycle > 200);
  H.cycles t 50;
  (* 0x55 toggles every bit, so every interval between edges is one bit *)
  let lv = Array.of_list (List.rev !levels) in
  let edges = List.filter (List.init (Array.length lv - 1) ~f:(fun k -> k + 1)) ~f:(fun k -> lv.(k) <> lv.(k - 1)) in
  let widths =
    List.zip_exn (List.drop_last_exn edges) (List.tl_exn edges) |> List.map ~f:(fun (a, b) -> b - a)
  in
  (* stop bit + next start bit are 1 then 0, so the widths include those too *)
  let widths = List.filter widths ~f:(fun w -> w < 2 * (n - jitter)) in
  let groups = List.sort widths ~compare |> List.group ~break:( <> ) in
  String.concat
    ~sep:" "
    (List.map groups ~f:(fun g -> Printf.sprintf "%dx%d" (List.hd_exn g) (List.length g)))
;;

let%expect_test "Stress: one UART spec, bit window 32 +/- 4 cycles" =
  printf "Drive          : %s\n" (bit_widths ~role:Role.drive ~stress:Stress.asap);
  printf "Stress at_lo   : %s\n" (bit_widths ~role:Role.stress ~stress:Stress.at_lo);
  printf "Stress at_hi   : %s\n" (bit_widths ~role:Role.stress ~stress:Stress.at_hi);
  printf "Stress random  : %s\n" (bit_widths ~role:Role.stress ~stress:Stress.random);
  [%expect {|
    Drive          : 28x39
    Stress at_lo   : 28x39
    Stress at_hi   : 36x39
    Stress random  : 28x4 29x2 31x3 32x2 33x1 34x2 35x1 36x24
    |}]
;;

let%expect_test "Cover: count and timing margins of every edge" =
  (* Check role on a UART line with bit times 31..33 cycles (nominal 32) and
     different idle gaps. Coverage records, per edge, how often it fired and the
     range of clock values it fired at. For "idle -> start" the clock counts from the
     last data sample, so its min/max is the range of inter-frame gaps the device
     produced. *)
  let n = 32 in
  let t = H.create () in
  let spec = Protocols.uart_rx ~pin:0 ~n in
  H.load t spec;
  H.clear_coverage t;
  H.set t.i.host.cover_en 1;
  H.start t ~role:Role.check ();
  H.cycles t 10;
  let frames =
    List.concat_map [ 0x00, 31, 25; 0xFF, 32, 60; 0x5A, 33, 10 ] ~f:(fun (b, w, gap) ->
      [ 1, gap ] @ [ 0, w ] @ List.init 8 ~f:(fun j -> (b lsr j) land 1, w) @ [ 1, w ])
  in
  Test_uart.drive_line t frames;
  H.cycles t 1500;
  printf "decoded: %s\n" (String.concat ~sep:" " (List.map (H.drain_rx t) ~f:(Printf.sprintf "%02x")));
  H.pulse t t.i.host.stop 1;
  H.cycles t 3;
  List.iteri spec.locs ~f:(fun k l ->
    List.iteri l.edges ~f:(fun e _ ->
      let count, mn, mx = H.coverage t ~loc:k ~e in
      printf "%-6s edge %d -> %-6s count %3d  clock at fire min %3d max %3d\n" l.name e
        (List.nth_exn l.edges e).goto count mn mx));
  printf "coverage overrun: %b\n" (H.getb t.o.status.cov_overrun);
  [%expect {|
    decoded: 00 ff 5a
    idle   edge 0 -> start  count   3  clock at fire min  37 max  97
    start  edge 0 -> data   count   3  clock at fire min  15 max  15
    data   edge 0 -> idle   count   3  clock at fire min  31 max  31
    data   edge 1 -> data   count  24  clock at fire min  31 max  31
    coverage overrun: false
    |}]
;;

let%expect_test "clocks saturate at 0xFFFF instead of wrapping" =
  (* Added after mutation testing: a mutant whose clocks wrap survived every other
     test. Two locations bounce on "clock 0 = 0xFFFF" and never reset the clock: once
     saturated, the edge holds every time, so the engine bounces every 6 cycles. A
     wrapping clock would bounce once per 65536 cycles. *)
  let open Spec in
  let spec =
    { name = "sat"
    ; locs =
        [ loc "a" [ edge ~goto:"b" (always |> at 0xFFFF) nop ]
        ; loc "b" [ edge ~goto:"a" (always |> at 0xFFFF) nop ]
        ]
    }
  in
  let t = H.create () in
  H.load t spec;
  H.start t ();
  let taken = ref 0 in
  for _ = 1 to 70_000 do
    H.cycle t;
    if H.getb t.o.status.taken then Int.incr taken
  done;
  printf "edges taken in 70000 cycles: %d\n" !taken;
  [%expect {| edges taken in 70000 cycles: 745 |}]
;;
