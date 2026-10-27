(* AMBIGUOUS (ENGINE.md, Pins): a relevant pin that changes twice before EVAL must not
   select a change-triggered edge silently. Pin 1 toggles twice, its synchronised
   changes landing on every FETCH beat pair (0-1, 1-2, 2-3, 3-4) and on 4-EVAL. In
   lockstep with the model (harness).
   Mutants (mutation/mutate.py): suppression dropped, AMBIGUOUS only when no edge
   fires, chg_mask left out of the relevant mask. *)

open! Base
open! Stdio
open Spex
open Layout
module H = Harness

(* location "w" (index 0) with pin 1 watched, in an edge's change mask, or neither;
   every variant has a timer edge to "late" so it never hangs *)
let spec ~relevant ~policy =
  let open Spec in
  let e_chg = edge ~goto:"ok" (always |> changes 1) nop in
  let e_timer = edge ~goto:"late" (always |> after 60) nop in
  let w =
    match relevant with
    | `Watch -> loc "w" ~watch:(bit 1) ~policy [ e_timer ]
    | `Watch_fire ->
      (* an edge that holds at once: under continue it fires with the AMBIGUOUS entry *)
      loc "w" ~watch:(bit 1) ~policy [ edge ~goto:"ok" always nop ]
    | `Chg -> loc "w" ~policy [ e_chg; e_timer ]
    | `Neither -> loc "w" ~policy [ e_timer ]
  in
  { name = "amb"
  ; locs = [ w; loc "ok" ~accepting:true []; loc "late" ~accepting:true []; loc "rec" ~accepting:true [] ]
  }
;;

let names = [| "w"; "ok"; "late"; "rec" |]

(** Pin 1's synchronised changes land on FETCH beats [b] and [b + 1] (5 = first EVAL). *)
let run ~relevant ~policy ~b =
  let t = H.create () in
  H.load t (spec ~relevant ~policy);
  H.set t.i.host.recover_loc 3;
  (* the start pulse is cycle c0; FETCH beat k is cycle c0 + 1 + k; a pad change at
     cycle c is synchronised (seen) at c + 2, so beat 0 needs a pad change before the
     start pulse *)
  let c0 = t.cycle + 5 in
  let level = ref 1 in
  t.device
  <- (fun ~out:_ ~oe:_ ->
       let k = t.cycle - (c0 + 1) in
       if k = b - 2 || k = b - 1 then level := 1 - !level;
       0xFD lor (!level lsl 1));
  H.cycles t 5;
  H.start t ();
  H.cycles t 120;
  let v = H.drain_vlog t in
  let viols =
    List.map v ~f:(fun v ->
      Printf.sprintf "%s in %s at beat %+d" (H.kind_name v.kind) names.(v.loc) (v.ts - (c0 + 1)))
  in
  Printf.sprintf
    "%s -> %s%s"
    (if List.is_empty viols then "no violation" else String.concat ~sep:", " viols)
    names.(H.get t.o.status.cur_loc)
    (if H.getb t.o.status.halted_viol then " (halted)" else "")
;;

let%expect_test "two changes on one pin during FETCH are AMBIGUOUS, never a silent edge" =
  List.iter
    [ `Watch, "watch only"; `Chg, "chg_mask only"; `Neither, "neither"; `Watch_fire, "watch + edge" ]
    ~f:(fun (relevant, rname) ->
    List.iter [ Policy.halt, "halt"; Policy.continue, "continue"; Policy.recover, "recover" ] ~f:(fun (policy, pname) ->
      printf "%-13s %-8s\n" rname pname;
      List.iter [ 0; 1; 2; 3; 4 ] ~f:(fun b ->
        printf "  beats %d-%s: %s\n" b (if b = 4 then "EVAL" else Int.to_string (b + 1)) (run ~relevant ~policy ~b))));
  [%expect {|
    watch only    halt
      beats 0-1: AMBIGUOUS in w at beat +1 -> w (halted)
      beats 1-2: AMBIGUOUS in w at beat +2 -> w (halted)
      beats 2-3: AMBIGUOUS in w at beat +3 -> w (halted)
      beats 3-4: AMBIGUOUS in w at beat +4 -> w (halted)
      beats 4-EVAL: AMBIGUOUS in w at beat +5 -> w (halted)
    watch only    continue
      beats 0-1: AMBIGUOUS in w at beat +1 -> late
      beats 1-2: AMBIGUOUS in w at beat +2 -> late
      beats 2-3: AMBIGUOUS in w at beat +3 -> late
      beats 3-4: AMBIGUOUS in w at beat +4 -> late
      beats 4-EVAL: AMBIGUOUS in w at beat +5 -> late
    watch only    recover
      beats 0-1: AMBIGUOUS in w at beat +1 -> rec
      beats 1-2: AMBIGUOUS in w at beat +2 -> rec
      beats 2-3: AMBIGUOUS in w at beat +3 -> rec
      beats 3-4: AMBIGUOUS in w at beat +4 -> rec
      beats 4-EVAL: AMBIGUOUS in w at beat +5 -> rec
    chg_mask only halt
      beats 0-1: AMBIGUOUS in w at beat +1 -> w (halted)
      beats 1-2: AMBIGUOUS in w at beat +2 -> w (halted)
      beats 2-3: AMBIGUOUS in w at beat +3 -> w (halted)
      beats 3-4: AMBIGUOUS in w at beat +4 -> w (halted)
      beats 4-EVAL: AMBIGUOUS in w at beat +5 -> w (halted)
    chg_mask only continue
      beats 0-1: AMBIGUOUS in w at beat +1 -> late
      beats 1-2: AMBIGUOUS in w at beat +2 -> late
      beats 2-3: AMBIGUOUS in w at beat +3 -> late
      beats 3-4: AMBIGUOUS in w at beat +4 -> late
      beats 4-EVAL: AMBIGUOUS in w at beat +5 -> late
    chg_mask only recover
      beats 0-1: AMBIGUOUS in w at beat +1 -> rec
      beats 1-2: AMBIGUOUS in w at beat +2 -> rec
      beats 2-3: AMBIGUOUS in w at beat +3 -> rec
      beats 3-4: AMBIGUOUS in w at beat +4 -> rec
      beats 4-EVAL: AMBIGUOUS in w at beat +5 -> rec
    neither       halt
      beats 0-1: no violation -> late
      beats 1-2: no violation -> late
      beats 2-3: no violation -> late
      beats 3-4: no violation -> late
      beats 4-EVAL: no violation -> late
    neither       continue
      beats 0-1: no violation -> late
      beats 1-2: no violation -> late
      beats 2-3: no violation -> late
      beats 3-4: no violation -> late
      beats 4-EVAL: no violation -> late
    neither       recover
      beats 0-1: no violation -> late
      beats 1-2: no violation -> late
      beats 2-3: no violation -> late
      beats 3-4: no violation -> late
      beats 4-EVAL: no violation -> late
    watch + edge  halt
      beats 0-1: AMBIGUOUS in w at beat +1 -> w (halted)
      beats 1-2: AMBIGUOUS in w at beat +2 -> w (halted)
      beats 2-3: AMBIGUOUS in w at beat +3 -> w (halted)
      beats 3-4: AMBIGUOUS in w at beat +4 -> w (halted)
      beats 4-EVAL: AMBIGUOUS in w at beat +5 -> w (halted)
    watch + edge  continue
      beats 0-1: AMBIGUOUS in w at beat +1 -> ok
      beats 1-2: AMBIGUOUS in w at beat +2 -> ok
      beats 2-3: AMBIGUOUS in w at beat +3 -> ok
      beats 3-4: AMBIGUOUS in w at beat +4 -> ok
      beats 4-EVAL: AMBIGUOUS in w at beat +5 -> ok
    watch + edge  recover
      beats 0-1: AMBIGUOUS in w at beat +1 -> rec
      beats 1-2: AMBIGUOUS in w at beat +2 -> rec
      beats 2-3: AMBIGUOUS in w at beat +3 -> rec
      beats 3-4: AMBIGUOUS in w at beat +4 -> rec
      beats 4-EVAL: AMBIGUOUS in w at beat +5 -> rec
    |}]
;;

let%expect_test "UART Check role: a glitch inside the entry of 'start' is AMBIGUOUS" =
  (* the start bit's falling edge takes "idle" -> "start"; during start's 5-cycle FETCH
     the line goes high for 2 cycles and low again: two changes on the watched pin *)
  let n = 32 in
  let t = H.create () in
  let spec = Protocols.uart_rx ~pin:0 ~n in
  H.load t spec;
  H.start t ~role:Role.check ();
  H.cycles t 20;
  let fall = ref None in
  t.device
  <- (fun ~out:_ ~oe:_ ->
       let c = t.cycle in
       (match !fall with
        | None -> if c >= 40 then fall := Some c
        | Some _ -> ());
       match !fall with
       | None -> 0xFF
       | Some f ->
         (* low from f; high again for 2 cycles from f + 4 (inside start's FETCH) *)
         if c >= f + 4 && c < f + 6 then 0xFF else if c < f + 10 * n then 0xFE else 0xFF);
  H.cycles t (12 * n);
  List.iter (H.drain_vlog t) ~f:(fun v ->
    printf "%s in %s\n" (H.kind_name v.kind) (List.nth_exn spec.locs v.loc).name);
  printf "now in %s\n" (List.nth_exn spec.locs (H.get t.o.status.cur_loc)).name;
  [%expect {|
    AMBIGUOUS in start
    now in idle
    |}]
;;

let%expect_test "a TIMEOUT that loses to AMBIGUOUS is deferred, not dropped" =
  (* "w" has invariant clock 0 <= 2 and watches pin 1: on the first EVAL cycle (clock 5)
     both TIMEOUT and AMBIGUOUS hold; AMBIGUOUS is logged, then under continue the
     TIMEOUT on the next EVAL cycle *)
  let open Spec in
  let spec =
    { name = "defer"
    ; locs =
        [ loc "w" ~inv:(0, 2) ~watch:(bit 1) ~policy:Policy.continue
            [ edge ~goto:"late" (always |> after 60) nop ]
        ; loc "late" ~accepting:true []
        ]
    }
  in
  let t = H.create () in
  H.load t spec;
  let c0 = t.cycle + 5 in
  let level = ref 1 in
  t.device
  <- (fun ~out:_ ~oe:_ ->
       let k = t.cycle - (c0 + 1) in
       if k = 0 || k = 1 then level := 1 - !level;
       0xFD lor (!level lsl 1));
  H.cycles t 5;
  H.start t ();
  H.cycles t 100;
  List.iter (H.drain_vlog t) ~f:(fun v ->
    printf "%s at cycle %+d after FETCH beat 0\n" (H.kind_name v.kind) (v.ts - (c0 + 1)));
  [%expect {|
    AMBIGUOUS at cycle +3 after FETCH beat 0
    TIMEOUT at cycle +6 after FETCH beat 0
    |}]
;;
