(* Host access rules (ENGINE.md): what each host access does while the engine runs, at
   every phase. In lockstep with the model (harness). Formal P8 / P9 cover the same
   rules for every input sequence. *)

open! Base
open! Stdio
open Spex
open Layout
module H = Harness

(* a two-location loop: "a" waits 3 cycles and goes to "b", "b" goes back; every visit
   refetches, so all FETCH beats and EVAL recur *)
let spec =
  let open Spec in
  { name = "loop"
  ; locs =
      [ loc "a" [ edge ~goto:"b" (always |> after 8) (nop |> reset 0) ]
      ; loc "b" ~policy:Policy.recover ~inv:(0, 20) [ edge ~goto:"a" (always |> pin_lo 3) (nop |> reset 0) ]
      ; loc "r1" ~accepting:true []
      ; loc "r2" ~accepting:true []
      ]
  }
;;

let phase_name (t : H.t) =
  match t.model.phase with
  | Model.Idle -> "idle"
  | Fetch b -> Printf.sprintf "fetch %d" b
  | Eval -> "eval"
;;

(** Apply [access] for one cycle when the engine is in [want] (a phase name). *)
let at_phase t want access =
  H.run_until ~limit:200 t (fun () -> String.equal (phase_name t) want);
  access t;
  H.cycle t;
  H.set t.i.host.rec_we 0;
  H.set t.i.host.cov_we 0;
  H.set t.i.host.cov_re 0;
  H.set t.i.host.lane_we 0
;;

let err t = Printf.sprintf "host_err %d cause %d" (H.get t.H.o.status.host_err) (H.get t.o.status.host_err_cause)

let clear t = H.pulse t t.i.host.err_clear 1

let%expect_test "refused host accesses while running, at every phase" =
  let t = H.create () in
  H.load t spec;
  H.set t.i.host.cov_addr 5;
  H.start t ();
  let accesses =
    [ "store write", (fun t -> H.set t.H.i.host.rec_we 1)
    ; "coverage write", (fun t -> H.set t.H.i.host.cov_we 1)
    ; "coverage read", (fun t -> H.set t.H.i.host.cov_re 1)
    ]
  in
  List.iter accesses ~f:(fun (name, access) ->
    let results =
      List.map [ "fetch 0"; "fetch 1"; "fetch 2"; "fetch 3"; "fetch 4"; "eval" ] ~f:(fun ph ->
        at_phase t ph access;
        let r = err t in
        clear t;
        r)
    in
    printf "%-15s %s\n" name
      (match List.dedup_and_sort results ~compare:String.compare with [ r ] -> r ^ " at every phase" | l -> String.concat ~sep:" / " l));
  printf "coverage read data while running: %d\n" (H.get t.o.status.cov_rdata);
  (* stop while an edge's coverage update is in S1 / S2: a coverage write in the next
     cycles is refused too *)
  H.set t.i.host.cover_en 1;
  clear t;
  (* taken shows the cycle after a fire, when S1 holds the update; stop now, write in
     the first idle cycle, while S2 still holds it *)
  H.run_until ~limit:400 t (fun () -> H.getb t.o.status.taken);
  H.pulse t t.i.host.stop 1;
  H.set t.i.host.cov_we 1;
  H.cycle t;
  H.set t.i.host.cov_we 0;
  printf "coverage write while the pipeline drains after stop: %s\n" (err t);
  clear t;
  H.cycles t 3;
  H.set t.i.host.cov_we 1;
  H.cycle t;
  H.set t.i.host.cov_we 0;
  printf "coverage write once it has drained: %s\n" (err t);
  H.start t ();
  (* first cause wins: a store write, then a coverage write *)
  at_phase t "eval" (fun t -> H.set t.H.i.host.rec_we 1);
  at_phase t "eval" (fun t -> H.set t.H.i.host.cov_we 1);
  printf "store write then coverage write: %s\n" (err t);
  clear t;
  printf "after err_clear: %s\n" (err t);
  [%expect {|
    store write     host_err 1 cause 1 at every phase
    coverage write  host_err 1 cause 2 at every phase
    coverage read   host_err 1 cause 2 at every phase
    coverage read data while running: 0
    coverage write while the pipeline drains after stop: host_err 1 cause 2
    coverage write once it has drained: host_err 0 cause 0
    store write then coverage write: host_err 1 cause 1
    after err_clear: host_err 0 cause 0
    |}]
;;

let%expect_test "recover_loc takes effect at the next start; stop releases pins and lanes" =
  let t = H.create () in
  H.load t spec;
  (* pin 3 high: "b" never leaves, its invariant (clock <= 20) fails, and recover jumps *)
  t.device <- (fun ~out:_ ~oe:_ -> 0xFF);
  H.set t.i.host.recover_loc 2;
  H.start t ();
  H.set t.i.host.recover_loc 3;
  H.cycles t 60;
  printf "recover_loc 2 at start, 3 written while running: recovered to %d\n" (H.get t.o.status.cur_loc);
  H.start t ();
  H.cycles t 60;
  printf "after the next start: recovered to %d\n" (H.get t.o.status.cur_loc);
  [%expect {|
    recover_loc 2 at start, 3 written while running: recovered to 2
    after the next start: recovered to 3
    |}]
;;
