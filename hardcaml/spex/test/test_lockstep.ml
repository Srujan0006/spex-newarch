(* Constrained-random lockstep: random specs, random pin activity, random host
   traffic, all roles, coverage on and off. The harness compares every output of
   the RTL with the reference model on every cycle. *)

open! Base
open! Stdio
open Spex
module H = Harness

let random_spec rs =
  let int n = Random.State.int rs n in
  let nlocs = 1 + int 8 in
  let name k = Printf.sprintf "l%d" k in
  let window () =
    match int 4 with
    | 0 -> 0, Spec.max_clock
    | 1 ->
      let lo = int 40 in
      lo, lo
    | 2 ->
      let lo = int 40 in
      lo, lo + int 20
    | _ -> int 10, Spec.max_clock
  in
  let action () : Spec.action =
    { drive_mask = int 256
    ; out_val = int 256
    ; out_oe = int 256
    ; tx_pin = (if int 3 = 0 then Some (int 8) else None)
    ; reset = List.filter [ 0; 1; 2 ] ~f:(fun _ -> int 2 = 0)
    ; tx_op = int 4
    ; rx_op = int 4
    ; rx_pin = int 8
    ; cnt_op = int 4
    }
  in
  let edge () : Spec.edge =
    let lo, hi = window () in
    let mask = if int 2 = 0 then 0 else int 256 in
    { guard =
        { mask
        ; value = int 256 land mask
        ; changed = (if int 3 = 0 then int 256 else 0)
        ; clk = int 4
        ; lo
        ; hi
        ; flag = (if int 2 = 0 then 0 else int 16)
        ; flag_inv = int 2 = 0
        }
    ; action = action ()
    ; stress = int 4
    ; goto = name (int nlocs)
    }
  in
  let loc k : Spec.loc =
    { name = name k
    ; entry = { (action ()) with tx_pin = None; rx_op = 0 }
    ; inv = (if int 3 = 0 then Some (int 4, int 60) else None)
    ; watch = (if int 3 = 0 then int 256 else 0)
    ; policy = int 4
    ; accepting = int 2 = 0
    ; irq = int 4 = 0
    ; edges = List.init (int 5) ~f:(fun _ -> edge ())
    }
  in
  { Spec.name = "random"; locs = List.init nlocs ~f:loc }
;;

let run_one ~seed ~cycles =
  let rs = Random.State.make [| seed |] in
  let int n = Random.State.int rs n in
  let t = H.create () in
  let spec = random_spec rs in
  H.load t spec;
  let h = t.i.host in
  let nlocs = List.length spec.locs in
  let pins = ref (int 256) in
  t.device <- (fun ~out ~oe ->
    if int 4 = 0 then pins := !pins lxor (1 lsl int 8);
    (* pins the engine drives read back its value, like a real pad *)
    out land oe lor (!pins land lnot oe));
  H.set h.open_drain (if int 2 = 0 then int 256 else 0);
  H.set h.cover_en (int 2);
  H.set h.recover_loc (int nlocs);
  H.set h.match_addr (int 256);
  H.start t ~loc:(int nlocs) ~role:(int 3) ();
  for _ = 1 to cycles do
    H.set h.tx_push (Bool.to_int (int 8 = 0));
    H.set h.tx_data (int 256);
    H.set h.rx_pop (Bool.to_int (int 6 = 0));
    H.set h.vlog_pop (Bool.to_int (int 6 = 0));
    H.set h.irq_ack (Bool.to_int (int 50 = 0));
    H.set h.cov_addr (int 256);
    H.set h.cov_we (Bool.to_int (int 40 = 0));
    H.set h.cov_wdata (int 0x3FFFFFFF);
    H.set h.rec_we (Bool.to_int (int 100 = 0));
    H.set h.rec_waddr (int 256);
    H.set h.stop (Bool.to_int (int 1500 = 0));
    if int 700 = 0
    then (
      H.set h.start 1;
      H.set h.start_loc (int nlocs);
      H.set h.role (int 3);
      H.set h.cover_en (int 2))
    else H.set h.start 0;
    H.cycle t
  done;
  t
;;

let%expect_test "random specs: RTL and model agree on every output, every cycle" =
  let specs = 300
  and cycles = 3000 in
  let stats = Array.create ~len:6 0 in
  for seed = 1 to specs do
    let t = run_one ~seed ~cycles in
    let s = t.model in
    stats.(0) <- stats.(0) + 1;
    if s.cov_ovr then stats.(1) <- stats.(1) + 1;
    if s.halted_viol then stats.(2) <- stats.(2) + 1;
    if s.rx_ovf then stats.(3) <- stats.(3) + 1;
    if s.vlog_ovf then stats.(4) <- stats.(4) + 1
  done;
  printf "%d specs x %d cycles = %d cycles in lockstep, no mismatch\n" specs cycles (specs * cycles);
  printf "runs ending with: coverage overrun %d, halted on violation %d, rx overflow %d, log overflow %d\n"
    stats.(1) stats.(2) stats.(3) stats.(4);
  [%expect {|
    300 specs x 3000 cycles = 900000 cycles in lockstep, no mismatch
    runs ending with: coverage overrun 2, halted on violation 94, rx overflow 7, log overflow 11
    |}]
;;
