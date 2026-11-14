(* CAN -> UART bridge on the chip alone (Protocols.can_uart_bridge): lane 1 receives CAN
   frames from the independent software node (can_node.ml) with the header skip and the
   DLC length field; rx_to_tx routes its bytes into the TX FIFO; after a good CRC the
   engine ACKs and sends them as UART 8N1, decoded here by Test_uart.decode_uart. In
   lockstep with the model (harness).
   Mutants (mutation/mutate.py): skip off by one (18, 20), skipped bits left out of the
   CRC, length field read one bit late, len_max ignored, rx_to_tx ignored. *)

open! Base
open! Stdio
open Spex
module H = Harness
module C = Can_node

let n = Test_can.n
let baud = 16

(* standard frames: header 19 bits (SOF..DLC), DLC in data bits 15..18; at most 8 bytes *)
let std_cfg : int Layout.Lane_cfg.t =
  { (Test_can.can_cfg ~dir:1 ~frame_bits:(19 + 64)) with
    skip = 19
  ; len_en = 1
  ; len_pos = 18
  ; len_max = 8
  ; crc_resid = 0
  }
;;

(* extended frames: header 39 bits, DLC in data bits 35..38 *)
let ext_cfg = { std_cfg with skip = 39; len_pos = 38; frame_bits = 39 + 64 }
let spec = Protocols.can_uart_bridge ~can_pin:0 ~uart_pin:1 ~n ~baud

type rig =
  { t : H.t
  ; node : C.t
  ; uart : int list ref (* UART pin levels, newest first *)
  }

let create ?(cfg = std_cfg) () =
  let t = H.create () in
  H.load ~rx_lanes:[ 1 ] t spec;
  Test_can.set_lane t 1 cfg;
  H.set t.i.host.open_drain 1;
  H.set t.i.host.rx_to_tx 1;
  H.set t.i.host.recover_loc 0;
  let node = C.create ~n () in
  let uart = ref [] in
  t.device
  <- (fun ~out ~oe ->
       let chip = if oe land 1 = 1 then out land 1 else 1 in
       let bus = chip land node.C.drive in
       C.step node ~bus;
       let u = H.pin_level ~out ~oe 1 in
       uart := u :: !uart;
       0xFC lor bus lor (u lsl 1));
  H.start t ();
  { t; node; uart }
;;

let hex l = String.concat ~sep:" " (List.map l ~f:(Printf.sprintf "%02x"))

(** The node sends [f] (with [opts], [corrupt]); run until the bridge is back in idle
    and print what came out of the UART, the ACK and any violation. *)
let send ?(opts = C.std) ?(corrupt = false) ?(label = "") r (f : C.frame) =
  r.uart := [];
  r.node.opts <- opts;
  r.node.corrupt <- corrupt;
  r.node.acked <- None;
  C.send r.node f;
  H.cycles r.t ((200 * n) + (100 * baud));
  let levels = List.rev !(r.uart) in
  (* decode_uart needs at least one edge on the line *)
  let bytes =
    if List.for_all levels ~f:(fun l -> l = 1) then [] else fst (Test_uart.decode_uart levels ~n:baud)
  in
  let viols = H.drain_vlog r.t in
  printf
    "%sid %x DLC %d%s%s: UART [%s]%s%s, acked %s%s\n"
    label
    f.id
    (Option.value opts.dlc ~default:(List.length f.data))
    (if opts.rtr then " remote" else "")
    (if corrupt then " bad CRC" else "")
    (hex (List.map bytes ~f:fst))
    (if List.for_all bytes ~f:snd then "" else " FRAMING")
    (* what a bridge must forward: the data of a good data frame, else nothing *)
    (let expect = if corrupt || opts.rtr then [] else f.data in
     if List.equal Int.equal (List.map bytes ~f:fst) expect then "" else " MISMATCH")
    (Sexp.to_string [%sexp (r.node.acked : bool option)])
    (match viols with
     | [] -> ""
     | v ->
       ", log: "
       ^ String.concat
           ~sep:" "
           (List.map v ~f:(fun v -> H.kind_name v.kind ^ " in " ^ (List.nth_exn spec.locs v.loc).name)))
;;

let%expect_test "CAN -> UART: DLC 0 to 8, the data bytes only, after the CRC" =
  let r = create () in
  for dlc = 0 to 8 do
    send r { id = 0x100 + dlc; data = List.init dlc ~f:(fun k -> (0x11 * (k + 1)) lxor (dlc lsl 4)) }
  done;
  send r { id = 0x7FF; data = [ 0xFF; 0x00; 0xFF; 0x00; 0x55; 0xAA; 0xFE; 0x01 ] };
  printf "RX FIFO %s, TX FIFO empty %b\n" (hex (H.drain_rx r.t)) (H.getb r.t.o.status.tx_empty);
  [%expect {|
    id 100 DLC 0: UART [], acked (true)
    id 101 DLC 1: UART [01], acked (true)
    id 102 DLC 2: UART [31 02], acked (true)
    id 103 DLC 3: UART [21 12 03], acked (true)
    id 104 DLC 4: UART [51 62 73 04], acked (true)
    id 105 DLC 5: UART [41 72 63 14 05], acked (true)
    id 106 DLC 6: UART [71 42 53 24 35 06], acked (true)
    id 107 DLC 7: UART [61 52 43 34 25 16 07], acked (true)
    id 108 DLC 8: UART [91 a2 b3 c4 d5 e6 f7 08], acked (true)
    id 7ff DLC 8: UART [ff 00 ff 00 55 aa fe 01], acked (true)
    RX FIFO , TX FIFO empty true
    |}]
;;

let%expect_test "DLC 9 to 15 mean 8 bytes (len_max; no frame_bits cap here)" =
  let r = create ~cfg:{ std_cfg with frame_bits = 0xFFFF } () in
  let data = [ 0xC0; 0xC1; 0xC2; 0xC3; 0xC4; 0xC5; 0xC6; 0xC7 ] in
  List.iter [ 9; 12; 15 ] ~f:(fun dlc -> send r ~opts:{ C.std with dlc = Some dlc } { id = 0x2A0; data });
  [%expect {|
    id 2a0 DLC 9: UART [c0 c1 c2 c3 c4 c5 c6 c7], acked (true)
    id 2a0 DLC 12: UART [c0 c1 c2 c3 c4 c5 c6 c7], acked (true)
    id 2a0 DLC 15: UART [c0 c1 c2 c3 c4 c5 c6 c7], acked (true)
    |}]
;;

let%expect_test "a bad CRC: nothing on the UART, a TIMEOUT in the log, the next frame passes" =
  let r = create () in
  send r ~corrupt:true { id = 0x155; data = [ 0x12; 0x34; 0x56 ] };
  send r { id = 0x156; data = [ 0x78; 0x9A ] };
  [%expect {|
    id 155 DLC 3 bad CRC: UART [], acked (false), log: TIMEOUT in bad
    id 156 DLC 2: UART [78 9a], acked (true)
    |}]
;;

let%expect_test "remote frames: DLC > 0 is a violation (the lane expects data); DLC 0 passes" =
  let r = create () in
  send r ~opts:{ C.std with rtr = true; dlc = Some 2 } { id = 0x321; data = [] };
  send r ~opts:{ C.std with rtr = true; dlc = Some 8 } { id = 0x322; data = [] };
  send r ~opts:{ C.std with rtr = true; dlc = Some 0 } { id = 0x323; data = [] };
  send r { id = 0x324; data = [ 0x42 ] };
  [%expect {|
    id 321 DLC 2 remote: UART [], acked (false), log: TIMEOUT in bad
    id 322 DLC 8 remote: UART [], acked (false), log: TIMEOUT in bad
    id 323 DLC 0 remote: UART [], acked (true)
    id 324 DLC 1: UART [42], acked (true)
    |}]
;;

let%expect_test "extended frames (29-bit identifier): skip 39, len_pos 38" =
  let r = create ~cfg:ext_cfg () in
  send r ~opts:{ C.std with ext = true } { id = 0x1ABCDEF0; data = [ 0xE1; 0xE2; 0xE3 ] };
  send r ~opts:{ C.std with ext = true } { id = 0x0000_0001; data = List.init 8 ~f:(fun k -> k) };
  send r ~opts:{ C.std with ext = true; dlc = Some 15 } { id = 0x1FFF_FFFF; data = List.init 8 ~f:(fun k -> 0xF0 + k) };
  [%expect {|
    id 1abcdef0 DLC 3: UART [e1 e2 e3], acked (true)
    id 1 DLC 8: UART [00 01 02 03 04 05 06 07], acked (true)
    id 1fffffff DLC 15: UART [f0 f1 f2 f3 f4 f5 f6 f7], acked (true)
    |}]
;;

let%expect_test "while bridging the host's TX push is refused (host_err cause 6)" =
  let r = create () in
  H.push_tx r.t [ 0x99 ];
  printf
    "TX FIFO empty %b, host_err %d cause %d\n"
    (H.getb r.t.o.status.tx_empty)
    (H.get r.t.o.status.host_err)
    (H.get r.t.o.status.host_err_cause);
  send r { id = 0x10; data = [ 0x01 ] };
  [%expect {|
    TX FIFO empty true, host_err 1 cause 6
    id 10 DLC 1: UART [01], acked (true)
    |}]
;;
