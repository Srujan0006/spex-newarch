(* A waveform for reading the engine: UART TX of 0xA5 at 8 cycles per bit.
   Watch cur_loc step idle(0) -> data(1) -> stop(2), in_entry high for the 5 fetch
   cycles after every change of location, and no fetch on the data -> data
   self-loop. pins_out bit 0 is the TX line. *)

open! Base
open! Stdio
open Spex
module H = Harness
module W = Hardcaml_waveterm

let%expect_test "waveform: UART TX, 8 cycles per bit" =
  let t = H.create ~waves:true () in
  H.load t (Protocols.uart_tx ~pin:0 ~n:8 ());
  (* the display starts where the load (writes and image check) ends *)
  let loaded = t.cycle in
  H.start t ();
  H.push_tx t [ 0xA5 ];
  H.cycles t 95;
  let waves = Option.value_exn t.waves in
  W.Waveform.print
    ~start_cycle:loaded
    ~display_width:130
    ~display_height:16
    ~wave_width:(-1)
    ~display_rules:
      [ W.Display_rule.port_name_is "pins_out" ~wave_format:Unsigned_int
      ; W.Display_rule.port_name_is "st_cur_loc" ~wave_format:Unsigned_int
      ; W.Display_rule.port_name_is "st_in_entry"
      ; W.Display_rule.port_name_is "st_taken"
      ]
    waves;
  [%expect {|
    ┌Signals───────────┐┌Waves───────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                  ││───────┬┬───────┬───────┬───────┬───────┬───────────────┬───────┬───────┬─────────────────────────          │
    │pins_out          ││ 0     ││0      │1      │0      │1      │0              │1      │0      │1                                  │
    │                  ││───────┴┴───────┴───────┴───────┴───────┴───────────────┴───────┴───────┴─────────────────────────          │
    │                  ││────────┬───────────────────────────────────────────────────────────────────────┬───────┬─────────          │
    │st_cur_loc        ││ 0      │1                                                                      │2      │0                  │
    │                  ││────────┴───────────────────────────────────────────────────────────────────────┴───────┴─────────          │
    │                  ││──┬────┬┬────┬──────────────────────────────────────────────────────────────────┬────┬──┬────┬────          │
    │st_in_entry       ││ 0│1   ││1   │0                                                                 │1   │0 │1   │0             │
    │                  ││──┴────┴┴────┴──────────────────────────────────────────────────────────────────┴────┴──┴────┴────          │
    │                  ││────────┬┬──────┬┬──────┬┬──────┬┬──────┬┬──────┬┬──────┬┬──────┬┬──────┬┬──────┬┬──────┬┬────────          │
    │st_taken          ││ 0      ││0     ││0     ││0     ││0     ││0     ││0     ││0     ││0     ││0     ││0     ││0                 │
    │                  ││────────┴┴──────┴┴──────┴┴──────┴┴──────┴┴──────┴┴──────┴┴──────┴┴──────┴┴──────┴┴──────┴┴────────          │
    │                  ││                                                                                                            │
    │                  ││                                                                                                            │
    └──────────────────┘└────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}]
;;
