(* Host loader (src/loader.ml) through the chip's SPI pins only: image header and size,
   the whole store written (zero-filled), verify and image_valid before start; refusals
   before any write; a corrupted transfer caught by the chip's CRC sweep.
   Mutants (by hand, 2026-11-11): the loader writes only the first 8 locations (no zero
   fill): the full-load test fails (image_valid 0, leftovers of the earlier spec); [load]
   ignores image_valid: the bus-error test reports Ok. *)

open! Base
open! Stdio
open Spex
module S = Spi_host

let hex l = String.concat ~sep:" " (List.map l ~f:(Printf.sprintf "%02x"))

(* a transport over the simulated SPI pins that counts write frames and can corrupt one *)
let transport ?(corrupt_frame = -1) t writes =
  let n = ref 0 in
  fun bytes ->
    let bytes =
      if List.hd_exn bytes land 0x80 = 0
      then (
        Int.incr writes;
        let k = !n in
        Int.incr n;
        if k = corrupt_frame then List.mapi bytes ~f:(fun i b -> if i = 10 then b lxor 0x01 else b) else bytes)
      else bytes
    in
    S.frame t bytes
;;

let show r = match r with Ok () -> "Ok" | Error e -> "Error: " ^ e

let flags t = List.hd_exn (S.read t ~space:S.Space.csr ~addr:6 1)

let%expect_test "image: header, size, zero-filled store" =
  let i = Loader.of_spec (Protocols.uart_tx ~pin:0 ~n:16 ()) in
  let b = Loader.to_bytes i in
  printf "%d bytes; header %s\n" (List.length b) (hex i.header);
  printf "nonzero store bytes after location 2: %d\n" (List.count (List.drop i.store (3 * 64)) ~f:(fun x -> x <> 0));
  printf "CRC-32 matches the model's: %b\n"
    (Loader.crc32 i.store = Model.store_crc32 (Spec.store_image (Protocols.uart_tx ~pin:0 ~n:16 ())));
  let c = Loader.of_spec ~rx_lanes:[ 1 ] (Protocols.can_uart_bridge ~can_pin:0 ~uart_pin:1 ~n:Test_can.n ~baud:16) in
  printf "CAN bridge needs lanes: %d\n" (List.nth_exn c.header 6 lsr 4);
  [%expect {|
    4112 bytes; header 53 50 45 58 01 40 04 20 54 ef 50 44 00 00 00 00
    nonzero store bytes after location 2: 0
    CRC-32 matches the model's: true
    CAN bridge needs lanes: 2
    |}]
;;

let%expect_test "full load over SPI over a larger spec, verify, image_valid, start, run" =
  let t = S.create () in
  let w = ref 0 in
  let tr = transport t w in
  (* leave another spec's records in the store first *)
  printf "first spec: %s\n" (show (Loader.load tr (Loader.of_spec (Protocols.i2c_target ~scl:0 ~sda:1))));
  (* and junk in the last location, which only the zero fill clears *)
  ignore (tr ([ S.Space.records; (63 lsl 6) lsr 8; (63 lsl 6) land 0xFF ] @ List.init 64 ~f:(fun k -> k + 1)) : int list);
  w := 0;
  let n = 16 in
  let levels = ref [] in
  t.trace <- Some (fun pins -> levels := (pins land 1) :: !levels);
  let r = Loader.load tr (Loader.of_spec (Protocols.uart_tx ~pin:0 ~n ())) in
  printf "UART spec: %s, %d write frames\n" (show r) !w;
  Loader.start tr;
  S.push_tx t [ 0x53; 0x50; 0x45; 0x58 ];
  S.ticks t (4 * 12 * n);
  let decoded, _ = Test_uart.decode_uart (List.rev !levels) ~n in
  printf "uio[0] decodes to %s; flags %02x\n" (hex (List.map decoded ~f:fst)) (flags t);
  [%expect {|
    first spec: Ok
    UART spec: Ok, 67 write frames
    uio[0] decodes to 53 50 45 58; flags 10
    |}]
;;

let%expect_test "refused before any write: version, lanes, corrupted file" =
  let t = S.create () in
  let w = ref 0 in
  let tr = transport t w in
  let i = Loader.of_spec (Protocols.uart_tx ~pin:0 ~n:16 ()) in
  let with_byte k v = { i with header = List.mapi i.header ~f:(fun j b -> if j = k then v else b) } in
  List.iter
    [ "format version 2", with_byte 4 2
    ; "needs 3 lanes", with_byte 6 ((3 lsl 4) lor Layout.num_edges)
    ; "a store byte flipped", { i with store = List.mapi i.store ~f:(fun j b -> if j = 100 then b lxor 0x80 else b) }
    ]
    ~f:(fun (name, img) ->
      w := 0;
      printf "%s: %s; write frames %d\n" name (show (Loader.load tr img)) !w);
  [%expect {|
    format version 2: Error: format version 2, chip has 1; write frames 0
    needs 3 lanes: Error: needs 3 lanes, chip has 2; write frames 0
    a store byte flipped: Error: image CRC 0c23d82f does not match its header 4450ef54; write frames 0
    |}]
;;

let%expect_test "a corrupted transfer: image_valid 0, load fails, start refused" =
  let t = S.create () in
  let w = ref 0 in
  (* frame 0 is stop, frame k + 1 is location k: corrupt location 4 on the wire *)
  let tr = transport ~corrupt_frame:5 t w in
  printf "load: %s\n" (show (Loader.load tr (Loader.of_spec (Protocols.uart_tx ~pin:0 ~n:16 ()))));
  Loader.start tr;
  S.ticks t 20;
  let f = flags t in
  printf "running %b, host_err %d cause %d\n" (S.status t land 0x80 <> 0) ((f lsr 3) land 1) (f land 7);
  [%expect {|
    load: Error: image_valid is 0 after verify: the store does not match the image
    running false, host_err 1 cause 4
    |}]
;;
