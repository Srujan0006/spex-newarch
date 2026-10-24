// new_arch harden top: the generated spex_chip (Hardcaml SPEX v0.1: host SPI port + engine core, GUIDE step 10)
// with its real IHP SRAM macros, at 6x4. The host talks to the chip only through SPI (hardcaml/spex/src/host_spi.ml).
//   ui_in:  [0] CS_n, [1] SCK, [2] MOSI (mode 0, SCK <= clk / 6); [7:3] unused
//   uo_out: [0] MISO, [1] IRQ, [2] VIOL pulse, [3] ENTRY, [7:4] debug nibble (CONFIG.dbg_sel)
//   uio:    the 8 protocol pins (pins_in / pins_out / pins_oe)
// SPDX-License-Identifier: Apache-2.0
`default_nettype none

module tt_um_srujan0006_newarch (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);
    wire         miso, irq, viol, entry;
    wire [3:0]   dbg;
    wire [7:0]   ram_rec_addr, ram_cov_addr;
    wire         ram_rec_re, ram_rec_we, ram_cov_re, ram_cov_we;
    wire [127:0] ram_rec_wdata, ram_rec_rdata;
    wire [31:0]  ram_cov_wdata, ram_cov_rdata;

    // CS_n, SCK and MOSI go straight into the chip's 2-flop synchronisers
    spex_chip u_chip (
        .clock(clk), .clear(~rst_n), .cs_n(ui_in[0]), .sck(ui_in[1]), .mosi(ui_in[2]), .pins_in(uio_in),
        .ram_rec_rdata(ram_rec_rdata), .ram_cov_rdata(ram_cov_rdata),
        .miso(miso), .irq(irq), .viol(viol), .entry(entry), .dbg(dbg), .pins_out(uio_out), .pins_oe(uio_oe),
        .ram_rec_addr(ram_rec_addr), .ram_rec_re(ram_rec_re), .ram_rec_we(ram_rec_we), .ram_rec_wdata(ram_rec_wdata),
        .ram_cov_addr(ram_cov_addr), .ram_cov_re(ram_cov_re), .ram_cov_we(ram_cov_we), .ram_cov_wdata(ram_cov_wdata));

    // the location store: 256 x 128 bits in two 1P_256x64 (one beat per address, ENGINE.md FETCH)
    RM_IHPSG13_1P_256x64_c2_bm_bist u_rec0 (
        .A_CLK(clk), .A_MEN(ram_rec_re | ram_rec_we), .A_WEN(ram_rec_we), .A_REN(ram_rec_re), .A_ADDR(ram_rec_addr),
        .A_DIN(ram_rec_wdata[63:0]), .A_DLY(1'b1), .A_DOUT(ram_rec_rdata[63:0]), .A_BM({64{1'b1}}),
        .A_BIST_CLK(1'b0), .A_BIST_EN(1'b0), .A_BIST_MEN(1'b0), .A_BIST_WEN(1'b0), .A_BIST_REN(1'b0),
        .A_BIST_ADDR(8'd0), .A_BIST_DIN(64'd0), .A_BIST_BM(64'd0));
    RM_IHPSG13_1P_256x64_c2_bm_bist u_rec1 (
        .A_CLK(clk), .A_MEN(ram_rec_re | ram_rec_we), .A_WEN(ram_rec_we), .A_REN(ram_rec_re), .A_ADDR(ram_rec_addr),
        .A_DIN(ram_rec_wdata[127:64]), .A_DLY(1'b1), .A_DOUT(ram_rec_rdata[127:64]), .A_BM({64{1'b1}}),
        .A_BIST_CLK(1'b0), .A_BIST_EN(1'b0), .A_BIST_MEN(1'b0), .A_BIST_WEN(1'b0), .A_BIST_REN(1'b0),
        .A_BIST_ADDR(8'd0), .A_BIST_DIN(64'd0), .A_BIST_BM(64'd0));
    // coverage: 256 x 32 (ENGINE.md Coverage)
    RM_IHPSG13_1P_256x32_c2_bm_bist u_cov (
        .A_CLK(clk), .A_MEN(ram_cov_re | ram_cov_we), .A_WEN(ram_cov_we), .A_REN(ram_cov_re), .A_ADDR(ram_cov_addr),
        .A_DIN(ram_cov_wdata), .A_DLY(1'b1), .A_DOUT(ram_cov_rdata), .A_BM({32{1'b1}}),
        .A_BIST_CLK(1'b0), .A_BIST_EN(1'b0), .A_BIST_MEN(1'b0), .A_BIST_WEN(1'b0), .A_BIST_REN(1'b0),
        .A_BIST_ADDR(8'd0), .A_BIST_DIN(32'd0), .A_BIST_BM(32'd0));

    assign uo_out = {dbg, entry, viol, irq, miso};
    wire _unused = &{ena, ui_in[7:3], 1'b0};
endmodule
