// new_arch harden top (decision option C, 2026-10-24): the generated spex_core (Hardcaml SPEX v0.1) with its real
// IHP SRAM macros, at 6x4. NOT the competition top: the host SPI port is not built yet (new_arch GUIDE step 10), so a
// host stand-in drives the core: a scan chain loads every host input, single-bit strobes come from ui_in, and every
// status output is captured into a read-back chain shifted out on uo_out[0], so synthesis keeps all of the engine.
//   ui_in: [0] scan data in, [1] scan shift (host chain in, status chain out), [2] start, [3] stop,
//          [4] record write, [5] coverage write, [6] TX push, [7] RX / log pop and IRQ ack
//   uo_out: [0] status chain out, [1] irq, [2] violation, [3] in entry, [7:4] current location [3:0]
//   uio: the 8 protocol pins (pins_in / pins_out / pins_oe)
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
    // registered host controls
    reg [7:0] ui;
    always @(posedge clk) ui <= ui_in;
    wire sdi = ui[0], shift = ui[1];

    // host-input scan chain: {rec_wdata 128, rec_waddr 8, cov_wdata 32, cov_addr 8, start_loc 6, recover_loc 6,
    //                         role 2, match_addr 8, open_drain 8, tx_data 8, cover_en 1} = 215 bits
    localparam HW = 215;
    reg [HW-1:0] h;
    always @(posedge clk) if (shift) h <= {h[HW-2:0], sdi};
    wire [127:0] h_rec_wdata = h[214:87];
    wire [7:0]   h_rec_waddr = h[86:79];
    wire [31:0]  h_cov_wdata = h[78:47];
    wire [7:0]   h_cov_addr  = h[46:39];
    wire [5:0]   h_start_loc = h[38:33];
    wire [5:0]   h_recover   = h[32:27];
    wire [1:0]   h_role      = h[26:25];
    wire [7:0]   h_match     = h[24:17];
    wire [7:0]   h_od        = h[16:9];
    wire [7:0]   h_tx        = h[8:1];
    wire         h_cover_en  = h[0];

    // core
    wire [7:0]   pins_out, pins_oe;
    wire         st_running, st_in_entry, st_accepting, st_taken, st_viol, st_tx_full, st_tx_empty, st_rx_empty;
    wire         st_vlog_empty, st_irq, st_halted_viol, st_rx_overflow, st_vlog_overflow, st_cov_overrun;
    wire [5:0]   st_cur_loc;
    wire [1:0]   st_taken_edge, st_viol_kind;
    wire [31:0]  st_timestamp, st_cov_rdata;
    wire [7:0]   st_rx_data;
    wire [47:0]  st_vlog_data;
    wire [7:0]   ram_rec_addr, ram_cov_addr;
    wire         ram_rec_re, ram_rec_we, ram_cov_re, ram_cov_we;
    wire [127:0] ram_rec_wdata, ram_rec_rdata;
    wire [31:0]  ram_cov_wdata, ram_cov_rdata;

    spex_core u_core (
        .clock(clk), .clear(~rst_n), .pins_in(uio_in),
        .host_start(ui[2]), .host_stop(ui[3]), .host_rec_we(ui[4]), .host_cov_we(ui[5]), .host_tx_push(ui[6]),
        .host_rx_pop(ui[7]), .host_vlog_pop(ui[7]), .host_irq_ack(ui[7]),
        .host_rec_wdata(h_rec_wdata), .host_rec_waddr(h_rec_waddr), .host_cov_wdata(h_cov_wdata),
        .host_cov_addr(h_cov_addr), .host_start_loc(h_start_loc), .host_recover_loc(h_recover), .host_role(h_role),
        .host_match_addr(h_match), .host_open_drain(h_od), .host_tx_data(h_tx), .host_cover_en(h_cover_en),
        .ram_rec_rdata(ram_rec_rdata), .ram_cov_rdata(ram_cov_rdata),
        .pins_out(pins_out), .pins_oe(pins_oe),
        .st_running(st_running), .st_in_entry(st_in_entry), .st_cur_loc(st_cur_loc), .st_accepting(st_accepting),
        .st_taken(st_taken), .st_taken_edge(st_taken_edge), .st_viol(st_viol), .st_viol_kind(st_viol_kind),
        .st_timestamp(st_timestamp), .st_tx_full(st_tx_full), .st_tx_empty(st_tx_empty), .st_rx_data(st_rx_data),
        .st_rx_empty(st_rx_empty), .st_vlog_data(st_vlog_data), .st_vlog_empty(st_vlog_empty),
        .st_cov_rdata(st_cov_rdata), .st_irq(st_irq), .st_halted_viol(st_halted_viol),
        .st_rx_overflow(st_rx_overflow), .st_vlog_overflow(st_vlog_overflow), .st_cov_overrun(st_cov_overrun),
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

    // status read-back chain: captured when not shifting, shifted out on uo_out[0]
    localparam SW = 1 + 1 + 6 + 1 + 1 + 2 + 1 + 2 + 32 + 1 + 1 + 8 + 1 + 48 + 1 + 32 + 1 + 1 + 1 + 1 + 1;
    wire [SW-1:0] status = {st_running, st_in_entry, st_cur_loc, st_accepting, st_taken, st_taken_edge, st_viol,
                            st_viol_kind, st_timestamp, st_tx_full, st_tx_empty, st_rx_data, st_rx_empty, st_vlog_data,
                            st_vlog_empty, st_cov_rdata, st_irq, st_halted_viol, st_rx_overflow, st_vlog_overflow,
                            st_cov_overrun};
    reg [SW-1:0] rb;
    always @(posedge clk) rb <= shift ? {rb[SW-2:0], 1'b0} : status;

    assign uo_out  = {st_cur_loc[3:0], st_in_entry, st_viol, st_irq, rb[SW-1]};
    assign uio_out = pins_out;
    assign uio_oe  = pins_oe;
    wire _unused = &{ena, 1'b0};
endmodule
