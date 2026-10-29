(* TX FIFO collisions (ENGINE.md, Bit lanes). The compiler rejects an engine TX load
   that may happen while a TX lane is active; the RTL flags one that happens anyway
   (tx_collision, sticky until err_clear). In lockstep with the model (harness).
   Mutants (mutation/mutate.py): tx_collision never set; the compiler ignores END. *)

open! Base
open! Stdio
open Spex
open Layout
module H = Harness

(* lane 0 sends while the engine loads TX every few cycles *)
let colliding =
  let open Spec in
  { name = "collide"
  ; locs =
      [ loc "go" [ edge ~goto:"load" always (nop |> lane (Lane_cmd.go 0)) ]
      ; loc "load" [ edge ~goto:"load" (always |> after 2) (nop |> tx Tx_op.load |> reset 0) ]
      ]
  }
;;

let check spec =
  match Spec.lane_conflicts spec with
  | [] -> printf "%s: accepted\n" spec.Spec.name
  | errs -> List.iter errs ~f:(printf "%s\n")
;;

let%expect_test "compiler: engine TX loads while a TX lane may be active are rejected" =
  check colliding;
  let open Spec in
  (* END before the load: accepted *)
  check
    { name = "end_first"
    ; locs =
        [ loc "go" [ edge ~goto:"wait" always (nop |> lane (Lane_cmd.go 0)) ]
        ; loc "wait" [ edge ~goto:"load" (always |> after 100) (nop |> lane (Lane_cmd.end_ 0)) ]
        ; loc "load" ~entry:(nop |> tx Tx_op.load) [ edge ~goto:"go" (always |> after 4) nop ]
        ]
    };
  (* the load on the END edge itself: the lane is still running that cycle *)
  check
    { name = "end_same_edge"
    ; locs =
        [ loc "go" [ edge ~goto:"wait" always (nop |> lane (Lane_cmd.go 0)) ]
        ; loc "wait" [ edge ~goto:"go" (always |> after 100) (nop |> lane (Lane_cmd.end_ 0) |> tx Tx_op.load) ]
        ]
    };
  (* waiting for the lane's done flag: a Done lane no longer pops *)
  check
    { name = "after_done"
    ; locs =
        [ loc "go" [ edge ~goto:"wait" always (nop |> lane (Lane_cmd.go 1)) ]
        ; loc "wait" [ edge ~goto:"go" (always |> flag (Flag.lane_done 1)) (nop |> tx Tx_op.load_rev) ]
        ]
    };
  (* a recover location may jump anywhere (recover_loc is a host CSR) *)
  check
    { name = "recover"
    ; locs =
        [ loc "go" [ edge ~goto:"run" always (nop |> lane (Lane_cmd.go 0)) ]
        ; loc "run" ~policy:Policy.recover ~inv:(0, 50) [ edge ~goto:"run" (always |> pin_hi 1) nop ]
        ; loc "uart" ~entry:(nop |> tx Tx_op.load) []
        ]
    };
  (* the same spec with lane 0 configured as RX: accepted *)
  (match
     Spec.lane_conflicts
       ~rx_lanes:[ 0 ]
       { name = "recover_rx"
       ; locs =
           [ loc "go" [ edge ~goto:"run" always (nop |> lane (Lane_cmd.go 0)) ]
           ; loc "run" ~policy:Policy.recover ~inv:(0, 50) [ edge ~goto:"run" (always |> pin_hi 1) nop ]
           ; loc "uart" ~entry:(nop |> tx Tx_op.load) []
           ]
       }
   with
   | [] -> printf "recover_rx (lane 0 RX): accepted\n"
   | errs -> List.iter errs ~f:(printf "%s\n"));
  (* the protocol library compiles *)
  let open Protocols in
  List.iter
    [ uart_tx ~pin:0 ~n:8 ()
    ; uart_rx ~pin:0 ~n:8
    ; spi_controller ~cs:0 ~sck:1 ~mosi:2 ~miso:3 ~hp:4
    ; i2c_controller_write ~scl:0 ~sda:1 ~q:8
    ; can_tx ~pin:0 ~n:8
    ; can_rx ~pin:0 ~n:8
    ; spi_target ~cpol:0 ~cpha:0 ~cs:0 ~sck:1 ~mosi:2 ~miso:3
    ; i2c_target ~scl:0 ~sda:1
    ; i2c_controller_read ~scl:0 ~sda:1 ~q:8
    ; onewire_controller ~pin:0 ~u:8
    ]
    ~f:check;
  [%expect {|
    collide: location load loads TX (edge 0) while TX lane 0 may be active: lane 0 started by location go edge 0, path go -> load
    end_first: accepted
    end_same_edge: location wait loads TX (edge 0) while TX lane 0 may be active: lane 0 started by location go edge 0, path go -> wait
    after_done: accepted
    recover: location uart loads TX (entry action) while TX lane 0 may be active: lane 0 started by location go edge 0, path go -> run -> uart
    recover_rx (lane 0 RX): accepted
    uart_tx: accepted
    uart_rx: accepted
    spi_ctrl_mode0: accepted
    i2c_ctrl_write: accepted
    can_tx: accepted
    can_rx: accepted
    spi_target_mode0: accepted
    i2c_target: accepted
    i2c_ctrl_read: accepted
    onewire_ctrl: accepted
    |}]
;;

let%expect_test "RTL backstop: an engine load and a lane pop in one cycle set tx_collision" =
  let t = H.create () in
  H.load ~lane_check:false t colliding;
  let h = t.i.host in
  Lane_cfg.iter2 h.lane0 { (Test_can.can_cfg ~dir:0 ~frame_bits:4000) with stuff = 0; readback = 0; div_int = 7 } ~f:H.set;
  H.start t ();
  let n = ref 0 in
  while (not (H.getb t.o.status.tx_collision)) && !n < 20000 do
    if not (H.getb t.o.status.tx_full)
    then (
      H.set h.tx_data !n;
      H.set h.tx_push 1)
    else H.set h.tx_push 0;
    H.cycle t;
    Int.incr n
  done;
  H.set h.tx_push 0;
  printf "tx_collision %d (lane 0 active %d)\n" (H.get t.o.status.tx_collision) (H.get t.o.status.lane_active);
  H.cycles t 50;
  printf "still set 50 cycles later: %d\n" (H.get t.o.status.tx_collision);
  H.pulse t h.err_clear 1;
  printf "after err_clear: %d\n" (H.get t.o.status.tx_collision);
  [%expect {|
    tx_collision 1 (lane 0 active 1)
    still set 50 cycles later: 1
    after err_clear: 0
    |}]
;;
