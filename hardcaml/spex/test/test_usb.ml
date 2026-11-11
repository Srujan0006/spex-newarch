(* USB low speed: Protocols.usb_ls_tx (lane for SYNC, PID, data and CRC-16; engine for the
   end of packet) against a decoder written from USB 2.0 (chapter 7 signalling, chapter 8
   packets), not from the lane: line states from D+ / D-, bit cells timed in cycles, NRZI
   (a 0 is a change of state), stuffing (a 0 after six ones), and the CRC-16 with the
   catalogue's CRC-16/USB (reflected poly 0xA001, init and final XOR 0xFFFF). The engine
   clock is 48 MHz (info.yaml), so a bit is 32 cycles = 666.7 ns.

   Low-speed limits used [Memory: USB 2.0 tables 7-7 / 7-8]: data rate 1.5 Mb/s +- 1.5 %;
   source SE0 of an EOP 1.25 to 1.50 us; J for at least one bit after the SE0.
   Measured (2026-11-11): every cell is a whole 32-cycle bit (1.500 Mb/s, 0 % error);
   SE0 64 cycles = 1333 ns; J after it. The SE0 starts 1 cycle (21 ns) after the last
   bit's end: the lane drives J when it goes Done and the engine's self-loop on the done
   flag drives SE0 the next cycle. After a K bit that cycle is a 21 ns J pulse; after a J
   bit, the bit is 21 ns long. Within the low-speed "differential to EOP transition skew"
   of -40 to +100 ns [Memory: USB 2.0 table 7-8]; a slew-limited low-speed driver
   (75..300 ns edges) would not show the 21 ns pulse at the cable.
   Mutants (by hand): EOP held 1 bit instead of 2 (all 5 packets: SE0 OUT); CRC init
   computed forward through SYNC + PID instead of backward (all 5: CRC BAD). *)

open! Base
open! Stdio
open Spex
module H = Harness

let dm, dp = 0, 1
let bit = 32
let ns c = Float.of_int c *. 1000.0 /. 48.0

let lane_cfg ~pid ~n : int Layout.Lane_cfg.t =
  { dir = 0
  ; div_int = bit
  ; div_frac = 0
  ; clk_pin_en = 0
  ; clk_pin = 0
  ; clk_edge = 0
  ; code = Layout.Code.nrzi
  ; stuff = 2
  ; stuff_len = 6
  ; poly = Protocols.usb_crc16_poly
  ; init = Protocols.usb_crc16_init ~pid
  ; crc_width = 16
  ; crc_inv = 1
  ; sync = 0
  ; sync_mask = 0
  ; data_pin = dm
  ; lsb_first = 1
  ; readback = 0
  ; frame_bits = 8 * (2 + n)
  ; skip = 0
  ; len_en = 0
  ; len_pos = 0
  ; len_max = 0
  }
;;

(* catalogue CRC-16/USB over bits in wire order *)
let crc16_usb bits =
  List.fold bits ~init:0xFFFF ~f:(fun r b ->
    let fb = (r lxor b) land 1 in
    let r = r lsr 1 in
    if fb = 1 then r lxor 0xA001 else r)
  lxor 0xFFFF
;;

type st =
  | J
  | K
  | SE0
  | SE1
[@@deriving equal, sexp_of]

let state (m, p) =
  match m, p with
  | 1, 0 -> J
  | 0, 1 -> K
  | 0, 0 -> SE0
  | _ -> SE1
;;

(* runs of equal line state: (state, length in cycles) *)
let runs levels =
  List.fold levels ~init:[] ~f:(fun acc s ->
    match acc with
    | (s', n) :: rest when equal_st s s' -> (s, n + 1) :: rest
    | _ -> (s, 1) :: acc)
  |> List.rev
;;

(** The chip sends one packet (SYNC, [pid], [data]); decode the line and print what a
    USB receiver would see and the timing. Returns the line levels. *)
let send ?(label = "") ~pid data =
  let t = H.create () in
  H.load t (Protocols.usb_ls_tx ~dm ~dp ~bit ());
  Layout.Lane_cfg.iter2 t.i.host.lane0 (lane_cfg ~pid ~n:(List.length data)) ~f:H.set;
  H.set t.i.host.pin_src
    (Layout.Pin_src.lane0_and_engine lor (Layout.Pin_src.not_lane0_and_engine lsl 3));
  let levels = ref [] in
  t.device
  <- (fun ~out ~oe ->
       levels := state (H.pin_level ~out ~oe dm, H.pin_level ~out ~oe dp) :: !levels;
       H.pullups ~out ~oe);
  H.start t ();
  (* the TX FIFO holds 8 bytes: the host tops it up while the packet goes out *)
  let bytes = [ Protocols.usb_sync; pid ] @ data in
  H.push_tx t (List.take bytes 8);
  H.cycles t (3 * 8 * bit);
  H.push_tx t (List.drop bytes 8);
  H.cycles t (((24 + (10 * List.length data)) * bit) + 400);
  let rs = runs (List.rev !levels) in
  (* the packet: from the first K after J to the first SE0 after it *)
  let rec to_sync = function
    | (J, _) :: ((K, _) :: _ as rest) -> rest
    | _ :: rest -> to_sync rest
    | [] -> []
  in
  let pkt = to_sync rs in
  let body, tail = List.split_while pkt ~f:(fun (s, _) -> not (equal_st s SE0)) in
  (* bit cells: every run but the last must be whole bits; the last may carry extra cycles
     between the last bit and the SE0 (the engine reacting to the lane's done flag) *)
  let n_body = List.length body in
  let bad_runs = List.count (List.take body (n_body - 1)) ~f:(fun (_, n) -> n % bit <> 0) in
  let last_state, last_len = List.last_exn body in
  let extra = last_len % bit in
  (* a last run shorter than a bit is a pulse after the last bit, not a bit *)
  let ending =
    if last_len < bit
    then (
      let prev, _ = List.nth_exn body (n_body - 2) in
      Printf.sprintf "last bit %s, then %s for %d cycles (%.0f ns)"
        (Sexp.to_string [%sexp (prev : st)]) (Sexp.to_string [%sexp (last_state : st)]) extra (ns extra))
    else
      Printf.sprintf "last bit %s, %d cycles (%.0f ns) longer" (Sexp.to_string [%sexp (last_state : st)]) extra (ns extra)
  in
  let cells = List.concat_map body ~f:(fun (s, n) -> List.init (n / bit) ~f:(fun _ -> s)) in
  (* NRZI from idle J, then destuff *)
  let raw, _ =
    List.fold cells ~init:([], J) ~f:(fun (acc, prev) s ->
      (if equal_st s prev then 1 else 0) :: acc, s)
  in
  let raw = List.rev raw in
  let bits, _, stuff_err =
    List.fold raw ~init:([], 0, false) ~f:(fun (acc, ones, err) b ->
      if ones = 6
      then acc, 0, err || b <> 0
      else b :: acc, (if b = 1 then ones + 1 else 0), err)
  in
  let bits = List.rev bits in
  let byte_at k = List.foldi (List.sub bits ~pos:k ~len:8) ~init:0 ~f:(fun i a b -> a lor (b lsl i)) in
  let nb = List.length bits in
  let ok_len = nb = (8 * (2 + List.length data)) + 16 in
  let got_data = if ok_len then List.init (List.length data) ~f:(fun i -> byte_at (16 + (8 * i))) else [] in
  let data_bits = if ok_len then List.sub bits ~pos:16 ~len:(8 * List.length data) else [] in
  let crc_field =
    if ok_len then List.foldi (List.drop bits (nb - 16)) ~init:0 ~f:(fun i a b -> a lor (b lsl i)) else -1
  in
  let se0 = match tail with (SE0, n) :: _ -> n | _ -> 0 in
  let j_after = match tail with _ :: (J, n) :: _ -> n | _ -> 0 in
  printf
    "%sPID %02x data [%s]: %s; SYNC %s PID %02x data %s CRC %s, stuff %s; cells %s (%.3f Mb/s); \
     %s, then SE0; SE0 %d cycles = %.0f ns (1250..1500: %s); J after %s\n"
    label
    pid
    (String.concat ~sep:" " (List.map data ~f:(Printf.sprintf "%02x")))
    (if ok_len then Printf.sprintf "%d bits" nb else Printf.sprintf "BAD LENGTH %d bits" nb)
    (if ok_len && byte_at 0 = 0x80 then "ok" else "BAD")
    (if ok_len then byte_at 8 else -1)
    (if List.equal Int.equal got_data data then "ok" else "BAD")
    (if ok_len && crc_field = crc16_usb data_bits then "ok" else "BAD")
    (if stuff_err then "ERROR" else "ok")
    (if bad_runs = 0 then "whole bits" else Printf.sprintf "%d runs not whole bits" bad_runs)
    (48.0 /. Float.of_int bit)
    ending
    se0
    (ns se0)
    (if Float.(ns se0 >= 1250.0 && ns se0 <= 1500.0) then "ok" else "OUT")
    (if j_after >= bit then Printf.sprintf ">= 1 bit (%d cycles)" j_after else Printf.sprintf "SHORT (%d)" j_after);
  ()
;;

let data0, data1 = 0xC3, 0x4B

let%expect_test "USB LS: packets decoded by an independent receiver; EOP timing" =
  send ~pid:data0 [];
  send ~pid:data0 [ 0x01 ];
  send ~pid:data1 [ 0x01; 0x02; 0x03; 0x04 ];
  (* long runs of ones: stuffing in the data and possibly the CRC *)
  send ~pid:data0 [ 0xFF; 0xFF; 0xFF ];
  send ~pid:data1 [ 0x80; 0x06; 0x00; 0x01; 0x00; 0x00; 0x40; 0x00 ];
  [%expect {|
    PID c3 data []: 32 bits; SYNC ok PID c3 data ok CRC ok, stuff ok; cells whole bits (1.500 Mb/s); last bit K, then J for 1 cycles (21 ns), then SE0; SE0 64 cycles = 1333 ns (1250..1500: ok); J after >= 1 bit (842 cycles)
    PID c3 data [01]: 40 bits; SYNC ok PID c3 data ok CRC ok, stuff ok; cells whole bits (1.500 Mb/s); last bit J, 1 cycles (21 ns) longer, then SE0; SE0 64 cycles = 1333 ns (1250..1500: ok); J after >= 1 bit (875 cycles)
    PID 4b data [01 02 03 04]: 64 bits; SYNC ok PID 4b data ok CRC ok, stuff ok; cells whole bits (1.500 Mb/s); last bit K, then J for 1 cycles (21 ns), then SE0; SE0 64 cycles = 1333 ns (1250..1500: ok); J after >= 1 bit (1102 cycles)
    PID c3 data [ff ff ff]: 56 bits; SYNC ok PID c3 data ok CRC ok, stuff ok; cells whole bits (1.500 Mb/s); last bit K, then J for 1 cycles (21 ns), then SE0; SE0 64 cycles = 1333 ns (1250..1500: ok); J after >= 1 bit (845 cycles)
    PID 4b data [80 06 00 01 00 00 40 00]: 96 bits; SYNC ok PID 4b data ok CRC ok, stuff ok; cells whole bits (1.500 Mb/s); last bit K, then J for 1 cycles (21 ns), then SE0; SE0 64 cycles = 1333 ns (1250..1500: ok); J after >= 1 bit (1362 cycles)
    |}]
;;
