open! Base
open! Stdio
open Spex
module H = Harness

let pin = 0

(* A software 1-Wire device. Answers a reset with a presence pulse (low from 20 to
   120 µs after the line rises), decodes write slots by sampling 30 µs after the
   falling edge, and after [cmd_bits] written bits answers read slots with [reply]
   (holds the line low to 30 µs for a 0). *)
let device ~u ~present ~reply =
  let now = ref 0 in
  let prev = ref 1 in
  let fell = ref 0 in
  let hold_until = ref (-1)
  and hold_from = ref (-1) in
  let written = ref []
  and nbits = ref 0 in
  let reading = ref false
  and rbit = ref 0 in
  let resets = ref 0 in
  let pending_sample = ref (-1) in
  let dev ~out ~oe =
    let t = !now in
    Int.incr now;
    let eng_low = oe land 1 = 1 && out land 1 = 0 in
    let me_low = t >= !hold_from && t < !hold_until in
    let line = if eng_low || me_low then 0 else 1 in
    if !prev = 1 && line = 0 && not me_low
    then (
      fell := t;
      if !reading
      then (
        if (reply lsr !rbit) land 1 = 0
        then (
          hold_from := t;
          hold_until := t + (30 * u));
        Int.incr rbit)
      else pending_sample := t + (30 * u));
    if !prev = 0 && line = 1 && t - !fell >= 400 * u
    then (
      Int.incr resets;
      fell := Int.max_value / 2;
      written := [];
      nbits := 0;
      reading := false;
      rbit := 0;
      pending_sample := -1;
      if present
      then (
        hold_from := t + (20 * u);
        hold_until := t + (120 * u)));
    if t = !pending_sample
    then (
      written := line :: !written;
      Int.incr nbits;
      if !nbits = 8 then reading := true);
    prev := line;
    0xFE lor line
  in
  dev, (fun () ->
    List.foldi (List.rev !written) ~init:0 ~f:(fun i acc b -> acc lor (b lsl i))), fun () -> !resets
;;

let run ~present =
  let u = 10 in
  let t = H.create () in
  let spec = Protocols.onewire_controller ~pin ~u in
  H.load t spec;
  H.set t.i.host.open_drain 1;
  H.set t.i.host.recover_loc 0;
  let dev, got, resets = device ~u ~present ~reply:0x28 in
  t.device <- dev;
  H.start t ();
  H.push_tx t [ 0x33 ];
  H.cycles t (u * 2000);
  printf "  device present %b: resets seen %d, device got %02x, RX FIFO [%s], violations: %s\n" present
    (resets ()) (got ())
    (String.concat ~sep:" " (List.map (H.drain_rx t) ~f:(Printf.sprintf "%02x")))
    (String.concat ~sep:", "
       (List.map (H.drain_vlog t) ~f:(fun v ->
          Printf.sprintf "%s in %s" (H.kind_name v.kind) (List.nth_exn spec.locs v.loc).name)))
;;

let%expect_test "1-Wire controller: reset, presence, write 0x33, read one byte" =
  run ~present:true;
  run ~present:false;
  [%expect {|
    device present true: resets seen 1, device got 33, RX FIFO [28], violations:
    device present false: resets seen 3, device got 00, RX FIFO [], violations: TIMEOUT in rst_wait, TIMEOUT in rst_wait, TIMEOUT in rst_wait
    |}]
;;
