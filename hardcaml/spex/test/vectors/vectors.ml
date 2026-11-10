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
  Test_i2c_read.run ~q:25 ~n:2 [ 0xC3; 0x5A ];
  Test_onewire.run ~present:true;
  Test_i2c_target.run ~q:25 ~addr:0x50 (Test_i2c_target.write 0x50 [ 0xDE; 0xAD ]);
  for mode = 0 to 3 do
    ignore (Test_spi_target.run ~mode ~hp:20 ())
  done;
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
  printf "wrote %d vectors, %d memories found\n" !n (List.length mems);
  (* chip level: the Tiny Tapeout top through its pins (SPI host port, uio), for the
     post-layout netlist (gate-level replay, GUIDE step 13). One line per cycle: a new-run
     flag, cs_n sck mosi pins_in, then the expected miso irq viol entry dbg pins_out
     pins_oe. *)
  let cbuf = Buffer.create (1 lsl 22) in
  let cn = ref 0 in
  let fresh = ref false in
  let module S = Spi_host in
  S.on_create := (fun _ -> fresh := true);
  S.on_tick
  := (fun t ->
       Int.incr cn;
       let g r = S.get r in
       Printf.bprintf
         cbuf
         "%d %x %x %x %02x %x %x %x %x %x %02x %02x\n"
         (if !fresh then 1 else 0)
         (g t.i.cs_n) (g t.i.sck) (g t.i.mosi) (g t.i.pins_in)
         (g t.o.miso) (g t.o.irq) (g t.o.viol) (g t.o.entry) (g t.o.dbg) (g t.o.pins_out)
         (g t.o.pins_oe);
       fresh := false);
  Test_spi_host.uart_tx_over_spi ~half:3 ~n:16 [ 0x53; 0x50; 0x45; 0x58; 0x00; 0xFF; 0x55 ];
  Test_spi_host.can_tx_over_spi ();
  Test_spi_host.bridge_over_spi ();
  Out_channel.write_all (dir ^ "/vectors_chip.txt") ~data:(Buffer.contents cbuf);
  let tb = Buffer.create 10000 in
  let p fmt = Printf.bprintf tb fmt in
  p "%s" {|`timescale 1ns/1ps
// Generated by test/vectors/vectors.ml: replays vectors_chip.txt (recorded from the
// Hardcaml simulation through the chip's pins) on tt_um_srujan0006_newarch, either the
// RTL (project.v + spex_chip.v) or the post-layout netlist, with the IHP SRAM models.
// Define USE_POWER_PINS for a powered netlist.
module tb_chip;
  reg clk = 0, rst_n = 1;
  reg cs_n, sck, mosi;
  reg [7:0] uio_in;
  wire [7:0] uo_out, uio_out, uio_oe;
  reg flag, e_miso, e_irq, e_viol, e_entry;
  reg [3:0] e_dbg;
  reg [7:0] e_out, e_oe;
  integer fd, r, cyc, errors, k;
`ifdef USE_POWER_PINS
  wire VPWR = 1'b1, VGND = 1'b0;
`endif
  tt_um_srujan0006_newarch dut (
`ifdef USE_POWER_PINS
    .VPWR(VPWR), .VGND(VGND),
`endif
    .ui_in({5'b0, mosi, sck, cs_n}), .uo_out(uo_out), .uio_in(uio_in), .uio_out(uio_out),
    .uio_oe(uio_oe), .ena(1'b1), .clk(clk), .rst_n(rst_n));
  task tick; begin #5 clk = 1; #5 clk = 0; end endtask
  initial begin
    errors = 0; cyc = 0;
|};
  p "    fd = $fopen(\"%s/vectors_chip.txt\", \"r\");\n" dir;
  p "%s" {|    while (!$feof(fd)) begin
      r = $fscanf(fd, "%h %h %h %h %h %h %h %h %h %h %h %h", flag, cs_n, sck, mosi, uio_in,
                  e_miso, e_irq, e_viol, e_entry, e_dbg, e_out, e_oe);
      if (r == 12) begin
        if (flag) begin
          // a new run: the Hardcaml RAMs start at zero, so do the SRAM models
          for (k = 0; k < 256; k = k + 1) begin
            dut.u_rec0.i_SRAM_1P_behavioral_bm_bist.memory[k] = 0;
            dut.u_rec1.i_SRAM_1P_behavioral_bm_bist.memory[k] = 0;
            dut.u_cov.i_SRAM_1P_behavioral_bm_bist.memory[k] = 0;
          end
          dut.u_rec0.i_SRAM_1P_behavioral_bm_bist.dr_r = 0;
          dut.u_rec1.i_SRAM_1P_behavioral_bm_bist.dr_r = 0;
          dut.u_cov.i_SRAM_1P_behavioral_bm_bist.dr_r = 0;
          begin : rst
            reg c0, s0, m0; reg [7:0] u0;
            c0 = cs_n; s0 = sck; m0 = mosi; u0 = uio_in;
            cs_n = 1; sck = 0; mosi = 0; uio_in = 0; rst_n = 0; tick; rst_n = 1;
            cs_n = c0; sck = s0; mosi = m0; uio_in = u0;
          end
        end
        tick; cyc = cyc + 1;
        if (uo_out !== {e_dbg, e_entry, e_viol, e_irq, e_miso} || uio_out !== e_out || uio_oe !== e_oe) begin
          errors = errors + 1;
          if (errors < 10) $display("cycle %0d: uo_out %h uio_out %h uio_oe %h, expected %h %h %h", cyc,
            uo_out, uio_out, uio_oe, {e_dbg, e_entry, e_viol, e_irq, e_miso}, e_out, e_oe);
        end
      end
    end
    if (errors == 0) $display("PASS: chip matches Hardcaml on %0d cycles", cyc);
    else $display("FAIL: %0d mismatches in %0d cycles", errors, cyc);
    $finish;
  end
endmodule
|};
  Out_channel.write_all (dir ^ "/tb_chip.v") ~data:(Buffer.contents tb);
  printf "wrote %d chip vectors\n" !cn
;;
