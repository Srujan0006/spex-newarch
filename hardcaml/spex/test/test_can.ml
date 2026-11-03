(* CAN 2.0A through the bit lanes, against the independent software node (can_node.ml)
   on a wired-AND bus. The engine runs in lockstep with the reference model throughout
   (harness), so these are also RTL-versus-model tests of the lanes in the engine. *)

open! Base
open! Stdio
open Spex
open Layout
module H = Harness
module C = Can_node

let n = 20 (* cycles per bit: 2 Mbit/s at a 40 MHz clock *)

(** Host side: SOF..data bits (CAN 2.0A), packed into bytes MSB first. *)
let frame_bits (f : C.frame) = C.header_and_data f

let pack bits =
  List.chunks_of bits ~length:8
  |> List.map ~f:(fun c -> List.foldi c ~init:0 ~f:(fun k acc b -> acc lor (b lsl (7 - k))))
;;

let can_cfg ~dir ~frame_bits : int Lane_cfg.t =
  { dir
  ; div_int = n
  ; div_frac = 0
  ; clk_pin_en = 0
  ; clk_pin = 0
  ; clk_edge = 0
  ; code = Code.nrz
  ; stuff = 1
  ; stuff_len = 5
  ; poly = 0x4599 lsl 17
  ; init = 0
  ; crc_width = 15
  ; crc_inv = 0
  ; sync = 0
  ; sync_mask = 0
  ; data_pin = 0
  ; lsb_first = 0
  ; readback = 1 - dir
  ; frame_bits
  ; skip = 0
  ; len_en = 0
  ; len_pos = 0
  ; len_max = 0
  }
;;

let set_lane t l cfg = Lane_cfg.iter2 (if l = 0 then t.H.i.host.lane0 else t.i.host.lane1) cfg ~f:H.set

(** The bus: the chip's open-drain pin 0 AND the node. *)
let attach t node =
  t.H.device
  <- (fun ~out ~oe ->
       let chip = if oe land 1 = 1 then out land 1 else 1 in
       let bus = chip land node.C.drive in
       C.step node ~bus;
       0xFE lor bus)
;;

let loc_name (spec : Spec.t) k = (List.nth_exn spec.locs k).name

let show_node name (t : C.t) =
  printf
    "  node %s: received %s, sent %s, acked %s, lost at bit %s, stuff errors %d\n"
    name
    (Sexp.to_string [%sexp (List.rev t.received : C.frame list)])
    (Sexp.to_string [%sexp (List.rev t.sent : C.frame list)])
    (Sexp.to_string [%sexp (t.acked : bool option)])
    (Sexp.to_string [%sexp (t.lost_at : int option)])
    t.stuff_errors
;;

let lane_status t l =
  let s = (H.get t.H.o.status.lane_status lsr (8 * l)) land 0xFF in
  Printf.sprintf
    "done %d crc_ok %d error %d kind %s"
    ((s lsr 7) land 1)
    ((s lsr 6) land 1)
    ((s lsr 4) land 1)
    (match s land 7 with 0 -> "-" | 1 -> "stuff" | 2 -> "bit" | 4 -> "lost arbitration" | k -> Int.to_string k)
;;

(** Run the chip's CAN transmitter with frame [f]; the node may send [other] too. *)
let chip_tx ?other (f : C.frame) =
  let t = H.create () in
  let spec = Protocols.can_tx ~pin:0 ~n in
  H.load t spec;
  let bits = frame_bits f in
  set_lane t 0 (can_cfg ~dir:0 ~frame_bits:(List.length bits));
  H.set t.i.host.open_drain 1;
  H.set t.i.host.pin_src Pin_src.lane0_and_engine;
  let node = C.create ~idle_needed:12 ~n () in
  Option.iter other ~f:(C.send node);
  attach t node;
  H.start t ();
  H.push_tx t (pack bits);
  let path = ref [] in
  for _ = 1 to 250 * n do
    H.cycle t;
    let l = loc_name spec (H.get t.o.status.cur_loc) in
    match !path with
    | x :: _ when String.equal x l -> ()
    | _ -> path := l :: !path
  done;
  printf "chip sends %s:\n" (Sexp.to_string [%sexp (f : C.frame)]);
  printf "  chip path: %s; lane 0: %s\n" (String.concat ~sep:" > " (List.rev !path)) (lane_status t 0);
  show_node "" node
;;

let%expect_test "CAN TX: the lane stuffs, appends CRC-15; the node decodes and ACKs" =
  chip_tx { id = 0x123; data = [ 0xDE; 0xAD; 0xBE ] };
  (* long runs of equal bits: stuffing in the identifier, data and CRC *)
  chip_tx { id = 0x000; data = [ 0x00; 0x00; 0xFF; 0xFF; 0x00 ] };
  chip_tx { id = 0x7FF; data = [] };
  [%expect {|
    chip sends ((id 291)(data(222 173 190))):
      chip path: idle > arm > frame > ack > eof > idle; lane 0: done 1 crc_ok 0 error 0 kind -
      node : received (((id 291)(data(222 173 190)))), sent (), acked (), lost at bit (), stuff errors 0
    chip sends ((id 0)(data(0 0 255 255 0))):
      chip path: idle > arm > frame > ack > eof > idle; lane 0: done 1 crc_ok 0 error 0 kind -
      node : received (((id 0)(data(0 0 255 255 0)))), sent (), acked (), lost at bit (), stuff errors 0
    chip sends ((id 2047)(data())):
      chip path: idle > arm > frame > ack > eof > idle; lane 0: done 1 crc_ok 0 error 0 kind -
      node : received (((id 2047)(data()))), sent (), acked (), lost at bit (), stuff errors 0
    |}]
;;

let%expect_test "CAN arbitration against the software node: readback stops the loser" =
  (* 0x122 beats 0x123 at the last identifier bit (unstuffed bit 11) *)
  chip_tx ~other:{ id = 0x122; data = [ 0x22 ] } { id = 0x123; data = [ 0x11 ] };
  (* 0x123 beats 0x124 at identifier bit 2 (unstuffed bit 9); the node then receives
     the chip's frame and ACKs it *)
  chip_tx ~other:{ id = 0x124; data = [ 0x44 ] } { id = 0x123; data = [ 0x11 ] };
  [%expect {|
    chip sends ((id 291)(data(17))):
      chip path: idle > arm > frame > lost; lane 0: done 0 crc_ok 0 error 1 kind lost arbitration
      node : received (), sent (((id 290)(data(34)))), acked (false), lost at bit (), stuff errors 0
    chip sends ((id 291)(data(17))):
      chip path: idle > arm > frame > ack > eof > idle; lane 0: done 1 crc_ok 0 error 0 kind -
      node : received (((id 291)(data(17)))), sent (((id 292)(data(68)))), acked (false), lost at bit (9), stuff errors 0
    |}]
;;

(** Unpack what the RX lane pushed: [nbits] bits MSB first; the last, partial byte (pushed
    by END) holds its bits in the low end. *)
let unpack bytes ~nbits =
  List.concat_mapi bytes ~f:(fun k b ->
    let have = min 8 (nbits - (8 * k)) in
    List.init (max 0 have) ~f:(fun j -> (b lsr (have - 1 - j)) land 1))
;;

let decode bits : C.frame =
  let v pos len = List.foldi (List.sub bits ~pos ~len) ~init:0 ~f:(fun j acc b -> acc lor (b lsl (len - 1 - j))) in
  let dlc = v 15 4 in
  { id = v 1 11; data = List.init (min dlc 8) ~f:(fun j -> v (19 + (8 * j)) 8) }
;;

let chip_rx ?(corrupt = false) frames =
  let t = H.create () in
  let spec = Protocols.can_rx ~pin:0 ~n in
  H.load t spec;
  let dlc = List.length (List.hd_exn frames).C.data in
  let nbits = 19 + (8 * dlc) in
  set_lane t 1 (can_cfg ~dir:1 ~frame_bits:nbits);
  H.set t.i.host.open_drain 1;
  let node = C.create ~n () in
  node.corrupt <- corrupt;
  attach t node;
  H.start t ();
  let path = ref [] in
  let got = ref [] in
  List.iter frames ~f:(fun f ->
    C.send node f;
    for _ = 1 to 200 * n do
      H.cycle t;
      let l = loc_name spec (H.get t.o.status.cur_loc) in
      (match !path with
       | x :: _ when String.equal x l -> ()
       | _ -> path := l :: !path);
      if not (H.getb t.o.status.rx_empty) then got := !got @ H.drain_rx t
    done;
    let bits = unpack !got ~nbits in
    got := [];
    printf
      "node sends %s: chip RX FIFO %s; node acked %s\n"
      (Sexp.to_string [%sexp (f : C.frame)])
      (if List.length bits < nbits
       then Printf.sprintf "holds %d of %d bits" (List.length bits) nbits
       else "decodes to " ^ Sexp.to_string [%sexp (decode bits : C.frame)])
      (Sexp.to_string [%sexp (node.acked : bool option)]));
  printf "chip path: %s; lane 1: %s\n" (String.concat ~sep:" > " (List.rev !path)) (lane_status t 1)
;;

let%expect_test "CAN RX: the lane destuffs and checks CRC-15; the engine ACKs" =
  chip_rx
    [ { id = 0x123; data = [ 0xDE; 0xAD; 0xBE ] }
    ; { id = 0x000; data = [ 0x00; 0x00; 0x00 ] }
    ; { id = 0x7FF; data = [ 0xFF; 0xFF; 0xFF ] }
    ];
  [%expect {|
    node sends ((id 291)(data(222 173 190))): chip RX FIFO decodes to ((id 291)(data(222 173 190))); node acked (true)
    node sends ((id 0)(data(0 0 0))): chip RX FIFO decodes to ((id 0)(data(0 0 0))); node acked (true)
    node sends ((id 2047)(data(255 255 255))): chip RX FIFO decodes to ((id 2047)(data(255 255 255))); node acked (true)
    chip path: idle > arm > frame > check > wait_ack > acking > eof > idle > arm > frame > check > wait_ack > acking > eof > idle > arm > frame > check > wait_ack > acking > eof > idle > arm > frame; lane 1: done 0 crc_ok 0 error 0 kind -
    |}]
;;

let%expect_test "CAN RX: a frame with a wrong CRC is not ACKed" =
  chip_rx ~corrupt:true [ { id = 0x155; data = [ 0x12; 0x34 ] } ];
  [%expect {|
    node sends ((id 341)(data(18 52))): chip RX FIFO holds 32 of 35 bits; node acked (false)
    chip path: idle > arm > frame > check > crc_error; lane 1: done 1 crc_ok 0 error 0 kind -
    |}]
;;
