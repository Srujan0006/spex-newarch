(* Write the generated Verilog.
   <dir>/spex_core.v     engine core, SRAM ports external (synthesis, chip top)
   <dir>/spex_sim_top.v  core + behavioural single-port RAMs (Verilog simulation) *)

open! Base
open! Hardcaml
open Spex
module Core_circuit = Circuit.With_interface (Engine.I) (Engine.O)
module Top_circuit = Circuit.With_interface (Engine.Top.I) (Engine.Top.O)

let () =
  let argv = Sys.get_argv () in
  let dir = if Array.length argv > 1 then argv.(1) else "out" in
  ignore (Stdlib.Sys.command ("mkdir -p " ^ dir) : int);
  let scope () = Scope.create ~flatten_design:true () in
  Rtl.output
    ~output_mode:(To_file (dir ^ "/spex_core.v"))
    Verilog
    (Core_circuit.create_exn ~name:"spex_core" (Engine.create (scope ())));
  Rtl.output
    ~output_mode:(To_file (dir ^ "/spex_sim_top.v"))
    Verilog
    (Top_circuit.create_exn ~name:"spex_sim_top" (Engine.Top.create (scope ())));
  Stdio.printf "wrote %s/spex_core.v and %s/spex_sim_top.v\n" dir dir
;;
