(* Record test vectors from the Hardcaml simulation and write a Verilog testbench
   that replays them on the generated Verilog (out/spex_sim_top.v).

   usage: vectors.exe <dir>    (reads <dir>/spex_sim_top.v, writes <dir>/tb.v and
                                <dir>/vectors.txt)

   This checks that the Verilog the chip flow will consume behaves exactly like the
   Hardcaml simulation that the tests ran on, cycle by cycle, on every output. *)

open! Base
open! Stdio
open Hardcaml
open Spex
open Spex_test
module H = Harness
module TI = Engine.Top.I
module TO = Engine.Top.O

let () =
  let dir = (Sys.get_argv ()).(1) in
  let buf = Buffer.create (1 lsl 24) in
  let n = ref 0 in
  let hex b = Bits.to_constant b |> Constant.to_hex_string ~signedness:Unsigned in
  H.on_create
  := (fun t ->
       let fresh = ref true in
       t.on_cycle
       <- Some
            (fun ~inputs ~outputs ->
              Int.incr n;
              (* drop clock and clear *)
              let inputs = List.drop inputs 2 in
              Buffer.add_string buf (if !fresh then "1" else "0");
              fresh := false;
              List.iter (inputs @ outputs) ~f:(fun b ->
                Buffer.add_char buf ' ';
                Buffer.add_string buf (hex b));
              Buffer.add_char buf '\n'));
  (* scenarios: the protocol tests and some random specs *)
  ignore (Test_uart.run_tx ~n:16 [ 0x48; 0x69; 0x00; 0xFF ]);
  Test_spi_i2c.run_i2c ~addr_on_bus:0x50 ~stretch:40 [ 0x12; 0x34 ];
  Test_spi_i2c.run_i2c ~addr_on_bus:0x51 ~stretch:0 [];
  ignore (Test_roles.bit_widths ~role:Layout.Role.stress ~stress:Layout.Stress.random : string);
  for seed = 1 to 40 do
    ignore (Test_lockstep.run_one ~seed ~cycles:2000 : H.t)
  done;
  Out_channel.write_all (dir ^ "/vectors.txt") ~data:(Buffer.contents buf);
  (* memories in the generated Verilog, to zero them on each new run *)
  let mems =
    In_channel.read_lines (dir ^ "/spex_sim_top.v")
    |> List.filter_map ~f:(fun l ->
      match String.split (String.strip l) ~on:' ' with
      | [ "reg"; _; name ] when String.is_suffix name ~suffix:"[0:255];" ->
        Some (String.chop_suffix_exn name ~suffix:"[0:255];")
      | _ -> None)
  in
  let ins = List.drop (List.zip_exn TI.Names_and_widths.port_names TI.Names_and_widths.port_widths) 2 in
  let outs = List.zip_exn TO.Names_and_widths.port_names TO.Names_and_widths.port_widths in
  let decl kind (nm, w) = Printf.sprintf "  %s [%d:0] %s;\n" kind (w - 1) nm in
  let tb = Buffer.create 10000 in
  let p fmt = Printf.bprintf tb fmt in
  p "`timescale 1ns/1ps\nmodule tb;\n  reg clock = 0, clear = 0;\n";
  List.iter ins ~f:(fun x -> p "%s" (decl "reg" x));
  List.iter outs ~f:(fun x -> p "%s" (decl "wire" x));
  List.iter outs ~f:(fun (nm, w) -> p "  reg [%d:0] exp_%s;\n" (w - 1) nm);
  p "  integer fd, r, flag, cyc, errors, k;\n";
  p "  spex_sim_top dut (.clock(clock), .clear(clear)";
  List.iter (ins @ outs) ~f:(fun (nm, _) -> p ", .%s(%s)" nm nm);
  p ");\n";
  p "  task tick; begin #5 clock = 1; #5 clock = 0; end endtask\n";
  p "  initial begin\n    errors = 0; cyc = 0;\n";
  p "    fd = $fopen(\"%s/vectors.txt\", \"r\");\n" dir;
  p "    while (!$feof(fd)) begin\n      r = $fscanf(fd, \"%%h\", flag);\n      if (r == 1) begin\n";
  p "        if (flag == 1) begin\n";
  List.iter mems ~f:(fun m -> p "          for (k = 0; k < 256; k = k + 1) dut.%s[k] = 0;\n" m);
  p "          clear = 1; tick; clear = 0;\n        end\n";
  List.iter ins ~f:(fun (nm, _) -> p "        r = $fscanf(fd, \"%%h\", %s);\n" nm);
  List.iter outs ~f:(fun (nm, _) -> p "        r = $fscanf(fd, \"%%h\", exp_%s);\n" nm);
  p "        tick; cyc = cyc + 1;\n";
  List.iter outs ~f:(fun (nm, _) ->
    p
      "        if (%s !== exp_%s) begin errors = errors + 1; if (errors < 10) $display(\"cycle %%0d: %s = %%h, expected %%h\", cyc, %s, exp_%s); end\n"
      nm nm nm nm nm);
  p "      end\n    end\n";
  p "    if (errors == 0) $display(\"PASS: generated Verilog matches Hardcaml on %%0d cycles\", cyc);\n";
  p "    else $display(\"FAIL: %%0d mismatches\", errors);\n    $finish;\n  end\nendmodule\n";
  Out_channel.write_all (dir ^ "/tb.v") ~data:(Buffer.contents tb);
  printf "wrote %d vectors, %d memories found\n" !n (List.length mems)
;;
