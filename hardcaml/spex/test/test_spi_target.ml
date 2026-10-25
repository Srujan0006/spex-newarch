open! Base
open! Stdio
open Spex
module H = Harness

let cs, sck, mosi, miso = 0, 1, 2, 3
let bitv v p = (v lsr p) land 1

(* A software SPI controller. [hp] = cycles per SCK half period, SCK runs without
   gaps between bytes, CS falls [lead] cycles before the first edge and rises [lead]
   cycles after the last. Returns the bytes it read on MISO. *)
let spi_controller ~cpol ~cpha ~hp ~lead bytes =
  let n = 8 * List.length bytes in
  let bytes = Array.of_list bytes in
  let t0 = 20 in
  let first = t0 + lead in
  let last = first + ((2 * n) - 1) * hp in
  let t_end = last + lead in
  let now = ref 0 in
  let got = Array.create ~len:(Array.length bytes) 0 in
  let tx_bit k = if k < 0 || k >= n then 0 else bitv bytes.(k / 8) (7 - (k % 8)) in
  let device ~out ~oe =
    let t = !now in
    Int.incr now;
    let c = if t >= t0 && t < t_end then 0 else 1 in
    (* number of SCK edges that have happened by time t *)
    let edges = if t < first then 0 else min (2 * n) (((t - first) / hp) + 1) in
    let k = if cpol = 0 then edges % 2 else 1 - (edges % 2) in
    let bit_index =
      if cpha = 0 then edges / 2 (* changes on trailing edges *) else (edges - 1) / 2
    in
    let m = tx_bit (max bit_index 0) in
    (* sample MISO on the sampling edge *)
    if t >= first && t <= last && (t - first) % hp = 0
    then (
      let j = edges - 1 in
      let sampling = if cpha = 0 then j % 2 = 0 else j % 2 = 1 in
      if sampling
      then (
        let b = j / 2 in
        let v = H.pin_level ~out ~oe miso in
        got.(b / 8) <- (got.(b / 8) lsl 1) lor v));
    let lines = H.pullups ~out ~oe land lnot 0b0111 in
    lines lor c lor (k lsl sck) lor (m lsl mosi)
  in
  device, t_end, fun () -> Array.to_list got |> List.map ~f:(fun v -> v land 0xFF)
;;

let pr l = String.concat ~sep:" " (List.map l ~f:(Printf.sprintf "%02x"))

let run ~mode ~hp =
  let cpol = mode / 2
  and cpha = mode % 2 in
  let t = H.create () in
  let spec = Protocols.spi_target ~cpol ~cpha ~cs ~sck ~mosi ~miso in
  H.load t spec;
  H.push_tx t [ 0xC3; 0x5A; 0x01; 0x80 ];
  H.start t ();
  let sent = [ 0x9F; 0x00; 0xA5; 0x7E ] in
  let device, t_end, got = spi_controller ~cpol ~cpha ~hp ~lead:(2 * hp + 12) sent in
  let base = t.cycle in
  t.device <- device;
  H.run_until t (fun () -> t.cycle - base > t_end + 30);
  let rx = H.drain_rx t in
  let viol = H.drain_vlog t in
  let ok = List.equal ( = ) rx sent && List.equal ( = ) (got ()) [ 0xC3; 0x5A; 0x01; 0x80 ] in
  ok, rx, got (), viol, (List.nth_exn spec.locs 0).name
;;

let%expect_test "SPI target, modes 0 to 3 at 1 MHz SCK (40 MHz engine)" =
  for mode = 0 to 3 do
    let ok, rx, got, viol, _ = run ~mode ~hp:20 in
    printf "mode %d: target got %s, controller got %s, %d violations, %s\n" mode (pr rx) (pr got)
      (List.length viol) (if ok then "OK" else "FAIL")
  done;
  [%expect {|
    mode 0: target got 9f 00 a5 7e, controller got c3 5a 01 80, 0 violations, OK
    mode 1: target got 9f 00 a5 7e, controller got c3 5a 01 80, 0 violations, OK
    mode 2: target got 9f 00 a5 7e, controller got c3 5a 01 80, 0 violations, OK
    mode 3: target got 9f 00 a5 7e, controller got c3 5a 01 80, 0 violations, OK
    |}]
;;

(* Fastest SCK each mode passes at, and what happens one step faster. *)
let%expect_test "SPI target: top speed per mode" =
  for mode = 0 to 3 do
    let rec find hp = if hp > 40 then None else
        let ok, _, _, viol, _ = run ~mode ~hp in
        if ok && List.is_empty viol then Some hp else find (hp + 1)
    in
    (* search from fast to slow; the first passing half period is the limit *)
    let h = Option.value (find 2) ~default:0 in
    let ok, rx, got, viol, _ = run ~mode ~hp:(h - 1) in
    printf "mode %d: passes at hp=%d (%.2f MHz); hp=%d: %s, target got %s, controller got %s, violations: %s\n"
      mode h (40.0 /. Float.of_int (2 * h)) (h - 1)
      (if ok then "OK" else "FAIL")
      (pr rx) (pr got)
      (String.concat ~sep:"," (List.map viol ~f:(fun v -> H.kind_name v.kind)))
  done;
  [%expect {|
    mode 0: passes at hp=9 (2.22 MHz); hp=8: FAIL, target got 9f 00 a5 7e, controller got c3 da 01 80, violations:
    mode 1: passes at hp=8 (2.50 MHz); hp=7: FAIL, target got 9f 00 a5 7e, controller got c3 da 01 80, violations:
    mode 2: passes at hp=9 (2.22 MHz); hp=8: FAIL, target got 9f 00 a5 7e, controller got c3 da 01 80, violations:
    mode 3: passes at hp=8 (2.50 MHz); hp=7: FAIL, target got 9f 00 a5 7e, controller got c3 da 01 80, violations:
    |}]
;;
