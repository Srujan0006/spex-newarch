open! Base
open! Stdio
open Spex
module H = Harness

(* A software UART decoder that only looks at the pin levels: find the falling edge
   of each start bit, sample the middle of each bit. Also returns every interval
   between pin transitions so the bit timing can be checked exactly. *)
let decode_uart levels ~n =
  let levels = Array.of_list levels in
  let len = Array.length levels in
  let bytes = ref [] in
  let k = ref 1 in
  while !k < len do
    if levels.(!k - 1) = 1 && levels.(!k) = 0 && !k + (10 * n) <= len
    then (
      let mid j = levels.(!k + (n / 2) + (j * n)) in
      let b = ref 0 in
      for j = 1 to 8 do
        b := !b lor (mid j lsl (j - 1))
      done;
      let framing_ok = mid 9 = 1 in
      bytes := (!b, framing_ok) :: !bytes;
      k := !k + (9 * n) + (n / 2))
    else Int.incr k
  done;
  let edges = ref [] in
  for j = 1 to len - 1 do
    if levels.(j) <> levels.(j - 1) then edges := j :: !edges
  done;
  let edges = List.rev !edges in
  let intervals =
    List.zip_exn (List.drop_last_exn edges) (List.tl_exn edges)
    |> List.map ~f:(fun (a, b) -> b - a)
  in
  List.rev !bytes, intervals
;;

let run_tx ~n bytes =
  let t = H.create () in
  H.load t (Protocols.uart_tx ~pin:0 ~n ());
  let levels = ref [] in
  t.trace <- Some (fun pins -> levels := (pins land 1) :: !levels);
  H.start t ();
  H.push_tx t bytes;
  H.run_until t (fun () ->
    H.getb t.o.status.tx_empty && H.get t.o.status.cur_loc = 0 && H.getb t.o.status.taken |> not
    && List.length !levels > 20 * n);
  H.cycles t (2 * n);
  decode_uart (List.rev !levels) ~n, t.cycle
;;

let%expect_test "UART TX, 16 cycles per bit" =
  let (bytes, intervals), cycles = run_tx ~n:16 [ Char.to_int 'H'; Char.to_int 'i'; 0x00; 0xFF; 0x55 ] in
  List.iter bytes ~f:(fun (b, ok) -> printf "byte 0x%02x framing %s\n" b (if ok then "ok" else "BAD"));
  printf "every pin interval is a whole number of bits: %b\n"
    (List.for_all intervals ~f:(fun d -> d % 16 = 0));
  printf "shortest interval %d cycles\n" (List.min_elt intervals ~compare |> Option.value_exn);
  printf "lockstep RTL = model for %d cycles\n" cycles;
  [%expect {|
    byte 0x48 framing ok
    byte 0x69 framing ok
    byte 0x00 framing ok
    byte 0xff framing ok
    byte 0x55 framing ok
    every pin interval is a whole number of bits: true
    shortest interval 16 cycles
    lockstep RTL = model for 852 cycles
    |}]
;;

let%expect_test "UART TX at 115200 baud from a 40 MHz clock" =
  let n = 347 (* 40e6 / 115200 = 347.2, 0.06% fast *) in
  let (bytes, intervals), cycles = run_tx ~n (List.map ~f:Char.to_int (String.to_list "SPEX")) in
  printf "%s\n" (String.of_char_list (List.map bytes ~f:(fun (b, _) -> Char.of_int_exn b)));
  printf "all intervals multiple of %d: %b\n" n (List.for_all intervals ~f:(fun d -> d % n = 0));
  printf "lockstep RTL = model for %d cycles\n" cycles;
  [%expect {|
    SPEX
    all intervals multiple of 347: true
    lockstep RTL = model for 14594 cycles
    |}]
;;

(* A UART line driver for the testbench: frames as a list of (level, cycles). *)
let frame ?(stop = 1) ~n b =
  [ 0, n ] @ List.init 8 ~f:(fun j -> (b lsr j) land 1, n) @ [ stop, n ]
;;

let drive_line t segments =
  let segs = ref segments in
  let left = ref 0 in
  let level = ref 1 in
  t.H.device
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

let%expect_test "UART RX in Drive role" =
  let n = 16 in
  let t = H.create () in
  H.load t (Protocols.uart_rx ~pin:0 ~n);
  H.start t ();
  H.cycles t 10;
  let bytes = [ 0x4F; 0x4B; 0x00; 0xFF; 0xA5 ] in
  drive_line t ([ 1, 5 ] @ List.concat_map bytes ~f:(frame ~n));
  H.cycles t (12 * n * List.length bytes);
  let got = H.drain_rx t in
  printf "received: %s\n" (String.concat ~sep:" " (List.map got ~f:(Printf.sprintf "%02x")));
  printf "violations: %d\n" (List.length (H.drain_vlog t));
  [%expect {|
    received: 4f 4b 00 ff a5
    violations: 0
    |}]
;;

let%expect_test "UART Check role: exact violation timestamps" =
  (* The engine watches a line it does not drive. The testbench sends a good byte,
     a byte with a low stop bit (framing error), a 3-cycle glitch inside a start
     bit, then a good byte. The checker must log the two bad ones at the exact
     cycle, recover, and keep decoding. *)
  let n = 32 in
  let t = H.create () in
  H.load t (Protocols.uart_rx ~pin:0 ~n);
  H.set t.i.host.recover_loc 0;
  H.start t ~role:Layout.Role.check ();
  H.cycles t 10;
  let t0 = t.cycle in
  let glitch = [ 0, 4; 1, 3 ] in
  let segments =
    [ 1, 20 ]
    @ frame ~n 0x31
    @ [ 1, 40 ]
    @ frame ~n ~stop:0 0x32
    @ [ 1, 3 * n ]
    @ glitch
    @ [ 1, 3 * n ]
    @ frame ~n 0x33
  in
  drive_line t segments;
  let bad_start = t0 + 20 + (10 * n) + 40 in
  let stop_centre = bad_start + (9 * n) + (n / 2) in
  let glitch_rise = bad_start + (10 * n) + (3 * n) + 4 in
  H.cycles t (40 * n);
  let got = H.drain_rx t in
  printf "decoded: %s\n" (String.concat ~sep:" " (List.map got ~f:(Printf.sprintf "%02x")));
  List.iter (H.drain_vlog t) ~f:(fun v ->
    printf "%-10s at cycle %d in location %d\n" (H.kind_name v.kind) v.ts v.loc);
  (* pins reach the engine after the 2-flop synchroniser; a TIMEOUT is the first
     cycle the clock is past the window (stop sampled at its centre, hi + 1) *)
  printf "expected: TIMEOUT at %d (stop-bit centre %d + 2 sync + 1)\n" (stop_centre + 3) stop_centre;
  printf "expected: UNEXPECTED at %d (glitch edge %d + 2 sync)\n" (glitch_rise + 2) glitch_rise;
  printf "engine never drove the pins: oe = %d\n" (H.get t.o.pins_oe);
  [%expect {|
    decoded: 31 33
    TIMEOUT    at cycle 710 in location 2
    UNEXPECTED at cycle 825 in location 1
    expected: TIMEOUT at 710 (stop-bit centre 707 + 2 sync + 1)
    expected: UNEXPECTED at 825 (glitch edge 823 + 2 sync)
    engine never drove the pins: oe = 0
    |}]
;;
