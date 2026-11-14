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
    let tx_pin = if int 3 = 0 then Some (int 8) else None in
    { drive_mask = int 256
    ; out_val = int 256
    ; out_oe = int 256
    ; tx_pin
    ; lane_cmd = (if Option.is_none tx_pin && int 3 = 0 then 1 + int 7 else 0)
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
    ; entry = { (action ()) with tx_pin = None; rx_op = 0; lane_cmd = 0 }
    ; inv = (if int 3 = 0 then Some (int 4, int 60) else None)
    ; watch = (if int 3 = 0 then int 256 else 0)
    ; policy = int 4
    ; accepting = int 2 = 0
    ; irq = int 4 = 0
    ; prescale = (if int 4 = 0 then 1 + int 3 else 0)
    ; edges = List.init (int 5) ~f:(fun _ -> edge ())
    }
  in
  { Spec.name = "random"; locs = List.init nlocs ~f:loc }
;;

let lane_active = ref 0
let wait_used = ref 0
let sweeps_matched = ref 0
let runs_start_refused = ref 0
let runs_with_drops = ref 0
let runs_with_collision = ref 0

let run_one ~seed ~cycles =
  let rs = Random.State.make [| seed |] in
  let int n = Random.State.int rs n in
  let t = H.create () in
  let spec = random_spec rs in
  (* random specs may load TX while a lane runs: the RTL flags it (tx_collision) *)
  H.load ~lane_check:false t spec;
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
  (* bit lanes: random configurations; lane outputs on random pins *)
  Layout.Lane_cfg.iter2 h.lane0 (Test_lane.random_cfg rs) ~f:H.set;
  Layout.Lane_cfg.iter2 h.lane1 (Test_lane.random_cfg rs) ~f:H.set;
  H.set h.pin_src (if int 2 = 0 then int 0x1000000 else 0);
  H.start t ~loc:(int nlocs) ~role:(int 3) ();
  let active = ref false in
  for _ = 1 to cycles do
    H.set h.tx_push (Bool.to_int (int 8 = 0));
    H.set h.tx_data (int 256);
    H.set h.rx_pop (Bool.to_int (int 6 = 0));
    H.set h.vlog_pop (Bool.to_int (int 6 = 0));
    H.set h.irq_ack (Bool.to_int (int 50 = 0));
    H.set h.cov_addr (int 256);
    H.set h.cov_we (Bool.to_int (int 40 = 0));
    H.set h.cov_wdata (int 0x3FFFFFFF);
    H.set h.cov_re (Bool.to_int (int 30 = 0));
    H.set h.lane_we (if int 40 = 0 then 1 + int 3 else 0);
    H.set h.err_clear (Bool.to_int (int 200 = 0));
    (* watermarks and the drop counters *)
    if int 500 = 0
    then (
      H.set h.rx_wm (int 8);
      H.set h.tx_wm (int 8);
      H.set h.tx_wm_en (int 2));
    H.set h.drop_clear (Bool.to_int (int 2000 = 0));
    (* bridge: lane RX bytes into the TX FIFO, host TX pushes refused *)
    if int 400 = 0 then H.set h.rx_to_tx (int 2);
    if int 300 = 0 then H.set h.recover_loc (int nlocs);
    (* image check: re-verify now and then (mostly with the right CRC) so restarts after
       a store write are possible again; a crc_expect write now and then *)
    (* verify mostly when the image is invalid (a sweep clears image_valid while it runs) *)
    let verify = if t.model.image_valid then int 5000 = 0 else int 20 = 0 in
    H.set h.verify (Bool.to_int verify);
    if verify
    then
      H.set h.crc_expect (if int 8 = 0 then int 0x3FFFFFFF else Model.store_crc32 t.model.rec_mem);
    H.set h.crc_expect_we (Bool.to_int (int 3000 = 0));
    (* store writes: mostly while running (refused, host_err); rarely while idle, where
       they land and invalidate the image (restarts are then refused until a verify) *)
    let running = not (Model.in_idle t.model) in
    H.set h.rec_we (Bool.to_int (if running then int 100 = 0 else int 2000 = 0));
    H.set h.rec_waddr (int 256);
    H.set h.stop (Bool.to_int (int 1500 = 0));
    if int 700 = 0
    then (
      H.set h.start 1;
      H.set h.start_loc (int nlocs);
      H.set h.role (int 3);
      H.set h.cover_en (int 2))
    else H.set h.start 0;
    let was_valid = t.model.image_valid in
    H.cycle t;
    if t.model.image_valid && not was_valid then Int.incr sweeps_matched;
    if Array.exists t.model.lanes ~f:(fun l -> not (Lane_model.equal_mode l.mode Idle)) then active := true;
    if Array.exists t.model.rx_wait ~f:Option.is_some then Int.incr wait_used
  done;
  if !active then Int.incr lane_active;
  if t.model.host_err_cause = 4 then Int.incr runs_start_refused;
  if Array.exists t.model.drops ~f:(fun c -> c > 0) then Int.incr runs_with_drops;
  if t.model.tx_collision then Int.incr runs_with_collision;
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
    if s.vlog_ovf then stats.(4) <- stats.(4) + 1;
    if Array.exists s.lanes ~f:(fun l -> l.error) then stats.(5) <- stats.(5) + 1
  done;
  printf "runs where a lane left Idle %d, cycles with a push waiting %d, runs ending with a lane error %d\n"
    !lane_active !wait_used stats.(5);
  printf "image checks passed during the runs %d, runs whose first host error is a refused start %d\n"
    !sweeps_matched !runs_start_refused;
  printf "runs ending with a non-zero drop counter %d, with tx_collision set %d\n"
    !runs_with_drops !runs_with_collision;
  printf "%d specs x %d cycles = %d cycles in lockstep, no mismatch\n" specs cycles (specs * cycles);
  printf "runs ending with: coverage overrun %d, halted on violation %d, rx overflow %d, log overflow %d\n"
    stats.(1) stats.(2) stats.(3) stats.(4);
  [%expect {|
    runs where a lane left Idle 14, cycles with a push waiting 0, runs ending with a lane error 2
    image checks passed during the runs 0, runs whose first host error is a refused start 3
    runs ending with a non-zero drop counter 14, with tx_collision set 0
    300 specs x 3000 cycles = 900000 cycles in lockstep, no mismatch
    runs ending with: coverage overrun 1, halted on violation 129, rx overflow 2, log overflow 10
    |}]
;;

let%expect_test "lanes and the engine push into the RX FIFO together: RTL and model agree" =
  (* lane 0 sends on pin 0 (pin source lane 0), lane 1 receives pin 0, and the engine
     pushes rx_sr every cycle: lane pushes and engine pushes collide, exercising the
     RX FIFO priority and the wait buffers (ENGINE.md, Bit lanes). *)
  let open Spec in
  let open Layout in
  (* lane [rx] receives what lane [tx] sends; odd seeds swap them, so each lane pushes *)
  let spec ~rxl ~txl =
    { name = "lane_push"
    ; locs =
        [ loc "s0" ~entry:(nop |> set 0 true) [ edge ~goto:"s1" always (nop |> lane (Lane_cmd.go rxl)) ]
        ; loc "s1" [ edge ~goto:"b" always (nop |> lane (Lane_cmd.go txl)) ]
        ; loc
            "b"
            [ edge ~goto:"s0" (always |> flag (Flag.lane_done txl)) (nop |> lane (Lane_cmd.end_ rxl))
            ; edge ~goto:"b" (always |> after 3) (nop |> rx Rx_op.push |> reset 0)
            ]
        ]
    }
  in
  let waits = ref 0
  and pushed = ref 0
  and runs_with_wait = ref 0 in
  for seed = 1 to 40 do
    let rs = Random.State.make [| seed |] in
    let t = H.create () in
    let rxl, txl = if seed % 2 = 0 then 1, 0 else 0, 1 in
    H.load t (spec ~rxl ~txl);
    let h = t.i.host in
    let base = Test_lane.random_cfg rs in
    let c =
      { base with
        div_int = 8 + Random.State.int rs 16
      ; frame_bits = 16 + Random.State.int rs 40
      ; clk_pin_en = 0
      ; data_pin = 0
      ; readback = 0
      ; skip = 0
      ; len_en = 0
      }
    in
    Layout.Lane_cfg.iter2 h.lane0 { c with dir = (if rxl = 0 then 1 else 0) } ~f:H.set;
    Layout.Lane_cfg.iter2 h.lane1 { c with dir = (if rxl = 1 then 1 else 0) } ~f:H.set;
    H.set h.pin_src (if txl = 0 then Layout.Pin_src.lane0 else Layout.Pin_src.lane1);
    t.device <- (fun ~out ~oe -> out land oe lor lnot oe land 0xFF);
    H.start t ();
    H.push_tx t (List.init 8 ~f:(fun _ -> Random.State.int rs 256));
    let w = ref 0 in
    for _ = 1 to 4000 do
      H.set h.rx_pop 1;
      H.cycle t;
      if not (H.getb t.o.status.rx_empty) then Int.incr pushed;
      if Array.exists t.model.rx_wait ~f:Option.is_some then Int.incr w
    done;
    waits := !waits + !w;
    if !w > 0 then Int.incr runs_with_wait
  done;
  printf "40 runs x 4000 cycles in lockstep; runs where a push waited %d, cycles with a push waiting %d\n"
    !runs_with_wait !waits;
  ignore !pushed;
  [%expect {| 40 runs x 4000 cycles in lockstep; runs where a push waited 28, cycles with a push waiting 167 |}]
;;
