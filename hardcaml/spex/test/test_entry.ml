(* ENGINE.md: a pin change is judged against the clocks as they were when it was seen.
   A change seen during the 5-cycle entry waits for the first EVAL cycle; judging it
   against that cycle's clock would pass or fail a tight window wrongly.

   Mutant (mutation/mutate.py): "ignore age in windows" (the RTL compares the raw
   clock). The lockstep and this test's expect output both kill it. *)

open! Base
open! Stdio
open Spex
module H = Harness

(* Start resets the clocks, so clock 0 reads b in FETCH beat b and 5 in the first EVAL
   cycle. Location "w" waits for pin 1 to rise with clock 0 in [0, 3]. *)
let spec =
  let open Spec in
  { name = "entry"
  ; locs =
      [ loc "w" [ edge ~goto:"ok" (always |> rises 1 |> window 0 3) nop ]
      ; loc "ok" ~accepting:true []
      ]
  }
;;

(* Raise pin 1 at the pad while the engine is in FETCH beat [raise_at]; the 2-flop
   synchroniser shows it 2 cycles later, in beat [raise_at + 2]. *)
let run ~raise_at =
  let t = H.create () in
  H.load t spec;
  let raised = ref false in
  t.device
  <- (fun ~out:_ ~oe:_ ->
       (match t.model.phase with
        | Model.Fetch b when b = raise_at && t.model.cur_loc = 0 -> raised := true
        | _ -> ());
       if !raised then 0xFF else 0xFF land lnot 2);
  H.cycles t 5;
  H.start t ();
  H.cycles t 20;
  let v = H.drain_vlog t in
  printf
    "pin 1 seen in FETCH beat %d (clock 0 = %d): %s\n"
    (raise_at + 2)
    (raise_at + 2)
    (match v with
     | [] -> Printf.sprintf "edge taken, now at loc %d" (H.get t.o.status.cur_loc)
     | v :: _ -> Printf.sprintf "%s at loc %d" (H.kind_name v.kind) v.loc)
;;

let%expect_test "a change during entry is judged at the clock it was seen" =
  (* beat 2: inside the window (clock 2 <= 3), although EVAL starts at clock 5 *)
  run ~raise_at:0;
  (* beat 3: the window's last cycle *)
  run ~raise_at:1;
  (* beat 4: one cycle after the window closed *)
  run ~raise_at:2;
  [%expect
    {|
    pin 1 seen in FETCH beat 2 (clock 0 = 2): edge taken, now at loc 1
    pin 1 seen in FETCH beat 3 (clock 0 = 3): edge taken, now at loc 1
    pin 1 seen in FETCH beat 4 (clock 0 = 4): TIMEOUT at loc 0
    |}]
;;

let%expect_test "compiler warns about narrow change windows in entered locations" =
  let show (s : Spec.t) =
    match Spec.warnings s with
    | [] -> printf "%s: no warnings\n" s.name
    | w -> List.iter w ~f:print_endline
  in
  show spec;
  show (Protocols.uart_tx ~pin:0 ~n:32 ());
  show (Protocols.uart_rx ~pin:0 ~n:32);
  show (Protocols.spi_controller ~cs:0 ~sck:1 ~mosi:2 ~miso:3 ~hp:4);
  show (Protocols.i2c_controller_write ~scl:0 ~sda:1 ~q:8);
  [%expect {|
    entry: location w edge 0 waits on a pin change with a 4-cycle window [0, 3] on clock 0; a change during the 5-cycle entry fires up to 5 cycles late
    uart_tx: no warnings
    uart_rx: no warnings
    spi_ctrl_mode0: no warnings
    i2c_ctrl_write: no warnings
    |}]
;;
