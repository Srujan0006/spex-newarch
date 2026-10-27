(* Image validation (ENGINE.md): the engine runs only a store whose CRC-32 sweep matched
   the host's expected value. In lockstep with the model (harness).
   Mutants (mutation/mutate.py): image_valid set by a crc_expect write; the sweep skips
   the last word. Formal P10 / P11. *)

open! Base
open! Stdio
open Spex
module H = Harness

let spec =
  let open Spec in
  { name = "img"; locs = [ loc "a" [ edge ~goto:"a" (always |> after 5) (nop |> reset 0) ] ] }
;;

let status t =
  Printf.sprintf
    "image_valid %d busy %d running %d host_err %d cause %d"
    (H.get t.H.o.status.image_valid)
    (H.get t.o.status.verify_busy)
    (H.get t.o.status.running)
    (H.get t.o.status.host_err)
    (H.get t.o.status.host_err_cause)
;;

let clear t = H.pulse t t.H.i.host.err_clear 1

(** Write the whole store image without verifying. *)
let write_store t (image : Hardcaml.Bits.t array) =
  let h = t.H.i.host in
  Array.iteri image ~f:(fun a w ->
    H.set h.rec_waddr a;
    h.rec_wdata := w;
    H.pulse t h.rec_we 1)
;;

let verify t crc =
  H.set t.H.i.host.crc_expect crc;
  H.pulse t t.i.host.crc_expect_we 1;
  H.pulse t t.i.host.verify 1;
  H.run_until ~limit:5000 t (fun () -> not (H.getb t.o.status.verify_busy))
;;

let%expect_test "image check: start needs a matching sweep over the whole store" =
  let t = H.create () in
  let image = Spec.store_image spec in
  let crc = Model.store_crc32 image in
  write_store t image;
  H.start t ();
  printf "start before any check:        %s\n" (status t);
  clear t;
  verify t (crc lxor 1);
  H.start t ();
  printf "wrong CRC, then start:         %s\n" (status t);
  clear t;
  verify t crc;
  printf "right CRC:                     %s\n" (status t);
  H.start t ();
  H.cycles t 3;
  printf "start:                         %s\n" (status t);
  H.pulse t t.i.host.stop 1;
  (* a store write after the check clears it *)
  H.set t.i.host.rec_waddr 7;
  H.pulse t t.i.host.rec_we 1;
  printf "store write after the check:   %s\n" (status t);
  verify t crc;
  H.pulse t t.i.host.crc_expect_we 1;
  printf "crc_expect written again:      %s\n" (status t);
  (* one corrupted byte in the very last word *)
  let bad = Array.copy image in
  bad.(255) <- Hardcaml.Bits.(bad.(255) ^: of_int ~width:128 0x100);
  write_store t bad;
  verify t crc;
  printf "last word corrupted:           %s\n" (status t);
  write_store t image;
  verify t crc;
  printf "restored:                      %s\n" (status t);
  [%expect {|
    start before any check:        image_valid 0 busy 0 running 0 host_err 1 cause 4
    wrong CRC, then start:         image_valid 0 busy 0 running 0 host_err 1 cause 4
    right CRC:                     image_valid 1 busy 0 running 0 host_err 0 cause 0
    start:                         image_valid 1 busy 0 running 1 host_err 0 cause 0
    store write after the check:   image_valid 0 busy 0 running 0 host_err 0 cause 0
    crc_expect written again:      image_valid 0 busy 0 running 0 host_err 0 cause 0
    last word corrupted:           image_valid 0 busy 0 running 0 host_err 0 cause 0
    restored:                      image_valid 1 busy 0 running 0 host_err 0 cause 0
    |}]
;;

(* a store write and a start abort the sweep; a coverage read is refused (BUSY) and the
   sweep goes on *)
let%expect_test "during the sweep: store and coverage accesses are BUSY, start is refused" =
  let t = H.create () in
  let image = Spec.store_image spec in
  let crc = Model.store_crc32 image in
  write_store t image;
  List.iter
    [ "store write", (fun t -> H.set t.H.i.host.rec_we 1)
    ; "coverage read", (fun t -> H.set t.H.i.host.cov_re 1)
    ; "start", (fun t -> H.set t.H.i.host.start 1)
    ]
    ~f:(fun (name, access) ->
      clear t;
      H.set t.i.host.crc_expect crc;
      H.pulse t t.i.host.verify 1;
      H.cycles t 1000;
      access t;
      H.cycle t;
      H.set t.i.host.rec_we 0;
      H.set t.i.host.cov_re 0;
      H.set t.i.host.start 0;
      printf "%-13s mid-sweep: %s, coverage read data %d\n" name (status t) (H.get t.o.status.cov_rdata);
      H.cycles t 4000);
  printf "after: %s\n" (status t);
  [%expect {|
    store write   mid-sweep: image_valid 0 busy 0 running 0 host_err 1 cause 5, coverage read data 0
    coverage read mid-sweep: image_valid 0 busy 1 running 0 host_err 1 cause 5, coverage read data 0
    start         mid-sweep: image_valid 0 busy 0 running 0 host_err 1 cause 4, coverage read data 0
    after: image_valid 0 busy 0 running 0 host_err 1 cause 4
    |}]
;;
