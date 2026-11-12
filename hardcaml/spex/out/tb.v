`timescale 1ns/1ps
module tb;
  reg clock = 0, clear = 0;
  reg [7:0] pins_in;
  reg [0:0] host_start;
  reg [0:0] host_stop;
  reg [1:0] host_role;
  reg [5:0] host_start_loc;
  reg [5:0] host_recover_loc;
  reg [0:0] host_cover_en;
  reg [7:0] host_open_drain;
  reg [7:0] host_match_addr;
  reg [0:0] host_irq_ack;
  reg [0:0] host_rec_we;
  reg [7:0] host_rec_waddr;
  reg [127:0] host_rec_wdata;
  reg [0:0] host_tx_push;
  reg [7:0] host_tx_data;
  reg [0:0] host_rx_pop;
  reg [0:0] host_vlog_pop;
  reg [7:0] host_cov_addr;
  reg [0:0] host_cov_we;
  reg [31:0] host_cov_wdata;
  reg [0:0] host_lane0_dir;
  reg [15:0] host_lane0_div_int;
  reg [7:0] host_lane0_div_frac;
  reg [0:0] host_lane0_clk_pin_en;
  reg [2:0] host_lane0_clk_pin;
  reg [0:0] host_lane0_clk_edge;
  reg [1:0] host_lane0_code;
  reg [1:0] host_lane0_stuff;
  reg [2:0] host_lane0_stuff_len;
  reg [31:0] host_lane0_poly;
  reg [31:0] host_lane0_init;
  reg [5:0] host_lane0_crc_width;
  reg [0:0] host_lane0_crc_inv;
  reg [15:0] host_lane0_sync;
  reg [15:0] host_lane0_sync_mask;
  reg [2:0] host_lane0_data_pin;
  reg [0:0] host_lane0_lsb_first;
  reg [0:0] host_lane0_readback;
  reg [15:0] host_lane0_frame_bits;
  reg [5:0] host_lane0_skip;
  reg [0:0] host_lane0_len_en;
  reg [5:0] host_lane0_len_pos;
  reg [3:0] host_lane0_len_max;
  reg [0:0] host_lane1_dir;
  reg [15:0] host_lane1_div_int;
  reg [7:0] host_lane1_div_frac;
  reg [0:0] host_lane1_clk_pin_en;
  reg [2:0] host_lane1_clk_pin;
  reg [0:0] host_lane1_clk_edge;
  reg [1:0] host_lane1_code;
  reg [1:0] host_lane1_stuff;
  reg [2:0] host_lane1_stuff_len;
  reg [31:0] host_lane1_poly;
  reg [31:0] host_lane1_init;
  reg [5:0] host_lane1_crc_width;
  reg [0:0] host_lane1_crc_inv;
  reg [15:0] host_lane1_sync;
  reg [15:0] host_lane1_sync_mask;
  reg [2:0] host_lane1_data_pin;
  reg [0:0] host_lane1_lsb_first;
  reg [0:0] host_lane1_readback;
  reg [15:0] host_lane1_frame_bits;
  reg [5:0] host_lane1_skip;
  reg [0:0] host_lane1_len_en;
  reg [5:0] host_lane1_len_pos;
  reg [3:0] host_lane1_len_max;
  reg [23:0] host_pin_src;
  reg [0:0] host_cov_re;
  reg [1:0] host_lane_we;
  reg [0:0] host_err_clear;
  reg [0:0] host_verify;
  reg [31:0] host_crc_expect;
  reg [0:0] host_crc_expect_we;
  reg [2:0] host_rx_wm;
  reg [2:0] host_tx_wm;
  reg [0:0] host_tx_wm_en;
  reg [0:0] host_drop_clear;
  reg [0:0] host_rx_to_tx;
  wire [7:0] pins_out;
  wire [7:0] pins_oe;
  wire [0:0] st_running;
  wire [0:0] st_in_entry;
  wire [5:0] st_cur_loc;
  wire [0:0] st_accepting;
  wire [0:0] st_taken;
  wire [1:0] st_taken_edge;
  wire [0:0] st_viol;
  wire [1:0] st_viol_kind;
  wire [31:0] st_timestamp;
  wire [0:0] st_tx_full;
  wire [0:0] st_tx_empty;
  wire [7:0] st_rx_data;
  wire [0:0] st_rx_empty;
  wire [47:0] st_vlog_data;
  wire [0:0] st_vlog_empty;
  wire [31:0] st_cov_rdata;
  wire [0:0] st_irq;
  wire [0:0] st_halted_viol;
  wire [0:0] st_rx_overflow;
  wire [0:0] st_vlog_overflow;
  wire [0:0] st_cov_overrun;
  wire [0:0] st_host_err;
  wire [2:0] st_host_err_cause;
  wire [1:0] st_lane_active;
  wire [0:0] st_image_valid;
  wire [0:0] st_verify_busy;
  wire [0:0] st_tx_collision;
  wire [39:0] st_drops;
  wire [15:0] st_lane_status;
  reg [7:0] exp_pins_out;
  reg [7:0] exp_pins_oe;
  reg [0:0] exp_st_running;
  reg [0:0] exp_st_in_entry;
  reg [5:0] exp_st_cur_loc;
  reg [0:0] exp_st_accepting;
  reg [0:0] exp_st_taken;
  reg [1:0] exp_st_taken_edge;
  reg [0:0] exp_st_viol;
  reg [1:0] exp_st_viol_kind;
  reg [31:0] exp_st_timestamp;
  reg [0:0] exp_st_tx_full;
  reg [0:0] exp_st_tx_empty;
  reg [7:0] exp_st_rx_data;
  reg [0:0] exp_st_rx_empty;
  reg [47:0] exp_st_vlog_data;
  reg [0:0] exp_st_vlog_empty;
  reg [31:0] exp_st_cov_rdata;
  reg [0:0] exp_st_irq;
  reg [0:0] exp_st_halted_viol;
  reg [0:0] exp_st_rx_overflow;
  reg [0:0] exp_st_vlog_overflow;
  reg [0:0] exp_st_cov_overrun;
  reg [0:0] exp_st_host_err;
  reg [2:0] exp_st_host_err_cause;
  reg [1:0] exp_st_lane_active;
  reg [0:0] exp_st_image_valid;
  reg [0:0] exp_st_verify_busy;
  reg [0:0] exp_st_tx_collision;
  reg [39:0] exp_st_drops;
  reg [15:0] exp_st_lane_status;
  integer fd, r, flag, cyc, errors, k;
  spex_sim_top dut (.clock(clock), .clear(clear), .pins_in(pins_in), .host_start(host_start), .host_stop(host_stop), .host_role(host_role), .host_start_loc(host_start_loc), .host_recover_loc(host_recover_loc), .host_cover_en(host_cover_en), .host_open_drain(host_open_drain), .host_match_addr(host_match_addr), .host_irq_ack(host_irq_ack), .host_rec_we(host_rec_we), .host_rec_waddr(host_rec_waddr), .host_rec_wdata(host_rec_wdata), .host_tx_push(host_tx_push), .host_tx_data(host_tx_data), .host_rx_pop(host_rx_pop), .host_vlog_pop(host_vlog_pop), .host_cov_addr(host_cov_addr), .host_cov_we(host_cov_we), .host_cov_wdata(host_cov_wdata), .host_lane0_dir(host_lane0_dir), .host_lane0_div_int(host_lane0_div_int), .host_lane0_div_frac(host_lane0_div_frac), .host_lane0_clk_pin_en(host_lane0_clk_pin_en), .host_lane0_clk_pin(host_lane0_clk_pin), .host_lane0_clk_edge(host_lane0_clk_edge), .host_lane0_code(host_lane0_code), .host_lane0_stuff(host_lane0_stuff), .host_lane0_stuff_len(host_lane0_stuff_len), .host_lane0_poly(host_lane0_poly), .host_lane0_init(host_lane0_init), .host_lane0_crc_width(host_lane0_crc_width), .host_lane0_crc_inv(host_lane0_crc_inv), .host_lane0_sync(host_lane0_sync), .host_lane0_sync_mask(host_lane0_sync_mask), .host_lane0_data_pin(host_lane0_data_pin), .host_lane0_lsb_first(host_lane0_lsb_first), .host_lane0_readback(host_lane0_readback), .host_lane0_frame_bits(host_lane0_frame_bits), .host_lane0_skip(host_lane0_skip), .host_lane0_len_en(host_lane0_len_en), .host_lane0_len_pos(host_lane0_len_pos), .host_lane0_len_max(host_lane0_len_max), .host_lane1_dir(host_lane1_dir), .host_lane1_div_int(host_lane1_div_int), .host_lane1_div_frac(host_lane1_div_frac), .host_lane1_clk_pin_en(host_lane1_clk_pin_en), .host_lane1_clk_pin(host_lane1_clk_pin), .host_lane1_clk_edge(host_lane1_clk_edge), .host_lane1_code(host_lane1_code), .host_lane1_stuff(host_lane1_stuff), .host_lane1_stuff_len(host_lane1_stuff_len), .host_lane1_poly(host_lane1_poly), .host_lane1_init(host_lane1_init), .host_lane1_crc_width(host_lane1_crc_width), .host_lane1_crc_inv(host_lane1_crc_inv), .host_lane1_sync(host_lane1_sync), .host_lane1_sync_mask(host_lane1_sync_mask), .host_lane1_data_pin(host_lane1_data_pin), .host_lane1_lsb_first(host_lane1_lsb_first), .host_lane1_readback(host_lane1_readback), .host_lane1_frame_bits(host_lane1_frame_bits), .host_lane1_skip(host_lane1_skip), .host_lane1_len_en(host_lane1_len_en), .host_lane1_len_pos(host_lane1_len_pos), .host_lane1_len_max(host_lane1_len_max), .host_pin_src(host_pin_src), .host_cov_re(host_cov_re), .host_lane_we(host_lane_we), .host_err_clear(host_err_clear), .host_verify(host_verify), .host_crc_expect(host_crc_expect), .host_crc_expect_we(host_crc_expect_we), .host_rx_wm(host_rx_wm), .host_tx_wm(host_tx_wm), .host_tx_wm_en(host_tx_wm_en), .host_drop_clear(host_drop_clear), .host_rx_to_tx(host_rx_to_tx), .pins_out(pins_out), .pins_oe(pins_oe), .st_running(st_running), .st_in_entry(st_in_entry), .st_cur_loc(st_cur_loc), .st_accepting(st_accepting), .st_taken(st_taken), .st_taken_edge(st_taken_edge), .st_viol(st_viol), .st_viol_kind(st_viol_kind), .st_timestamp(st_timestamp), .st_tx_full(st_tx_full), .st_tx_empty(st_tx_empty), .st_rx_data(st_rx_data), .st_rx_empty(st_rx_empty), .st_vlog_data(st_vlog_data), .st_vlog_empty(st_vlog_empty), .st_cov_rdata(st_cov_rdata), .st_irq(st_irq), .st_halted_viol(st_halted_viol), .st_rx_overflow(st_rx_overflow), .st_vlog_overflow(st_vlog_overflow), .st_cov_overrun(st_cov_overrun), .st_host_err(st_host_err), .st_host_err_cause(st_host_err_cause), .st_lane_active(st_lane_active), .st_image_valid(st_image_valid), .st_verify_busy(st_verify_busy), .st_tx_collision(st_tx_collision), .st_drops(st_drops), .st_lane_status(st_lane_status));
  task tick; begin #5 clock = 1; #5 clock = 0; end endtask
  initial begin
    errors = 0; cyc = 0;
    fd = $fopen("/home/lenovo/JaneStreet/SPEX/hardcaml/spex/out/vectors.txt", "r");
    while (!$feof(fd)) begin
      r = $fscanf(fd, "%h", flag);
      if (r == 1) begin
        if (flag == 1) begin
          for (k = 0; k < 256; k = k + 1) dut._2086[k] = 0;
          for (k = 0; k < 256; k = k + 1) dut._4109[k] = 0;
          clear = 1; tick; clear = 0;
        end
        r = $fscanf(fd, "%h", pins_in);
        r = $fscanf(fd, "%h", host_start);
        r = $fscanf(fd, "%h", host_stop);
        r = $fscanf(fd, "%h", host_role);
        r = $fscanf(fd, "%h", host_start_loc);
        r = $fscanf(fd, "%h", host_recover_loc);
        r = $fscanf(fd, "%h", host_cover_en);
        r = $fscanf(fd, "%h", host_open_drain);
        r = $fscanf(fd, "%h", host_match_addr);
        r = $fscanf(fd, "%h", host_irq_ack);
        r = $fscanf(fd, "%h", host_rec_we);
        r = $fscanf(fd, "%h", host_rec_waddr);
        r = $fscanf(fd, "%h", host_rec_wdata);
        r = $fscanf(fd, "%h", host_tx_push);
        r = $fscanf(fd, "%h", host_tx_data);
        r = $fscanf(fd, "%h", host_rx_pop);
        r = $fscanf(fd, "%h", host_vlog_pop);
        r = $fscanf(fd, "%h", host_cov_addr);
        r = $fscanf(fd, "%h", host_cov_we);
        r = $fscanf(fd, "%h", host_cov_wdata);
        r = $fscanf(fd, "%h", host_lane0_dir);
        r = $fscanf(fd, "%h", host_lane0_div_int);
        r = $fscanf(fd, "%h", host_lane0_div_frac);
        r = $fscanf(fd, "%h", host_lane0_clk_pin_en);
        r = $fscanf(fd, "%h", host_lane0_clk_pin);
        r = $fscanf(fd, "%h", host_lane0_clk_edge);
        r = $fscanf(fd, "%h", host_lane0_code);
        r = $fscanf(fd, "%h", host_lane0_stuff);
        r = $fscanf(fd, "%h", host_lane0_stuff_len);
        r = $fscanf(fd, "%h", host_lane0_poly);
        r = $fscanf(fd, "%h", host_lane0_init);
        r = $fscanf(fd, "%h", host_lane0_crc_width);
        r = $fscanf(fd, "%h", host_lane0_crc_inv);
        r = $fscanf(fd, "%h", host_lane0_sync);
        r = $fscanf(fd, "%h", host_lane0_sync_mask);
        r = $fscanf(fd, "%h", host_lane0_data_pin);
        r = $fscanf(fd, "%h", host_lane0_lsb_first);
        r = $fscanf(fd, "%h", host_lane0_readback);
        r = $fscanf(fd, "%h", host_lane0_frame_bits);
        r = $fscanf(fd, "%h", host_lane0_skip);
        r = $fscanf(fd, "%h", host_lane0_len_en);
        r = $fscanf(fd, "%h", host_lane0_len_pos);
        r = $fscanf(fd, "%h", host_lane0_len_max);
        r = $fscanf(fd, "%h", host_lane1_dir);
        r = $fscanf(fd, "%h", host_lane1_div_int);
        r = $fscanf(fd, "%h", host_lane1_div_frac);
        r = $fscanf(fd, "%h", host_lane1_clk_pin_en);
        r = $fscanf(fd, "%h", host_lane1_clk_pin);
        r = $fscanf(fd, "%h", host_lane1_clk_edge);
        r = $fscanf(fd, "%h", host_lane1_code);
        r = $fscanf(fd, "%h", host_lane1_stuff);
        r = $fscanf(fd, "%h", host_lane1_stuff_len);
        r = $fscanf(fd, "%h", host_lane1_poly);
        r = $fscanf(fd, "%h", host_lane1_init);
        r = $fscanf(fd, "%h", host_lane1_crc_width);
        r = $fscanf(fd, "%h", host_lane1_crc_inv);
        r = $fscanf(fd, "%h", host_lane1_sync);
        r = $fscanf(fd, "%h", host_lane1_sync_mask);
        r = $fscanf(fd, "%h", host_lane1_data_pin);
        r = $fscanf(fd, "%h", host_lane1_lsb_first);
        r = $fscanf(fd, "%h", host_lane1_readback);
        r = $fscanf(fd, "%h", host_lane1_frame_bits);
        r = $fscanf(fd, "%h", host_lane1_skip);
        r = $fscanf(fd, "%h", host_lane1_len_en);
        r = $fscanf(fd, "%h", host_lane1_len_pos);
        r = $fscanf(fd, "%h", host_lane1_len_max);
        r = $fscanf(fd, "%h", host_pin_src);
        r = $fscanf(fd, "%h", host_cov_re);
        r = $fscanf(fd, "%h", host_lane_we);
        r = $fscanf(fd, "%h", host_err_clear);
        r = $fscanf(fd, "%h", host_verify);
        r = $fscanf(fd, "%h", host_crc_expect);
        r = $fscanf(fd, "%h", host_crc_expect_we);
        r = $fscanf(fd, "%h", host_rx_wm);
        r = $fscanf(fd, "%h", host_tx_wm);
        r = $fscanf(fd, "%h", host_tx_wm_en);
        r = $fscanf(fd, "%h", host_drop_clear);
        r = $fscanf(fd, "%h", host_rx_to_tx);
        r = $fscanf(fd, "%h", exp_pins_out);
        r = $fscanf(fd, "%h", exp_pins_oe);
        r = $fscanf(fd, "%h", exp_st_running);
        r = $fscanf(fd, "%h", exp_st_in_entry);
        r = $fscanf(fd, "%h", exp_st_cur_loc);
        r = $fscanf(fd, "%h", exp_st_accepting);
        r = $fscanf(fd, "%h", exp_st_taken);
        r = $fscanf(fd, "%h", exp_st_taken_edge);
        r = $fscanf(fd, "%h", exp_st_viol);
        r = $fscanf(fd, "%h", exp_st_viol_kind);
        r = $fscanf(fd, "%h", exp_st_timestamp);
        r = $fscanf(fd, "%h", exp_st_tx_full);
        r = $fscanf(fd, "%h", exp_st_tx_empty);
        r = $fscanf(fd, "%h", exp_st_rx_data);
        r = $fscanf(fd, "%h", exp_st_rx_empty);
        r = $fscanf(fd, "%h", exp_st_vlog_data);
        r = $fscanf(fd, "%h", exp_st_vlog_empty);
        r = $fscanf(fd, "%h", exp_st_cov_rdata);
        r = $fscanf(fd, "%h", exp_st_irq);
        r = $fscanf(fd, "%h", exp_st_halted_viol);
        r = $fscanf(fd, "%h", exp_st_rx_overflow);
        r = $fscanf(fd, "%h", exp_st_vlog_overflow);
        r = $fscanf(fd, "%h", exp_st_cov_overrun);
        r = $fscanf(fd, "%h", exp_st_host_err);
        r = $fscanf(fd, "%h", exp_st_host_err_cause);
        r = $fscanf(fd, "%h", exp_st_lane_active);
        r = $fscanf(fd, "%h", exp_st_image_valid);
        r = $fscanf(fd, "%h", exp_st_verify_busy);
        r = $fscanf(fd, "%h", exp_st_tx_collision);
        r = $fscanf(fd, "%h", exp_st_drops);
        r = $fscanf(fd, "%h", exp_st_lane_status);
        tick; cyc = cyc + 1;
        if (pins_out !== exp_pins_out) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: pins_out = %h, expected %h", cyc, pins_out, exp_pins_out); end
        if (pins_oe !== exp_pins_oe) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: pins_oe = %h, expected %h", cyc, pins_oe, exp_pins_oe); end
        if (st_running !== exp_st_running) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_running = %h, expected %h", cyc, st_running, exp_st_running); end
        if (st_in_entry !== exp_st_in_entry) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_in_entry = %h, expected %h", cyc, st_in_entry, exp_st_in_entry); end
        if (st_cur_loc !== exp_st_cur_loc) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_cur_loc = %h, expected %h", cyc, st_cur_loc, exp_st_cur_loc); end
        if (st_accepting !== exp_st_accepting) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_accepting = %h, expected %h", cyc, st_accepting, exp_st_accepting); end
        if (st_taken !== exp_st_taken) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_taken = %h, expected %h", cyc, st_taken, exp_st_taken); end
        if (st_taken_edge !== exp_st_taken_edge) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_taken_edge = %h, expected %h", cyc, st_taken_edge, exp_st_taken_edge); end
        if (st_viol !== exp_st_viol) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_viol = %h, expected %h", cyc, st_viol, exp_st_viol); end
        if (st_viol_kind !== exp_st_viol_kind) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_viol_kind = %h, expected %h", cyc, st_viol_kind, exp_st_viol_kind); end
        if (st_timestamp !== exp_st_timestamp) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_timestamp = %h, expected %h", cyc, st_timestamp, exp_st_timestamp); end
        if (st_tx_full !== exp_st_tx_full) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_tx_full = %h, expected %h", cyc, st_tx_full, exp_st_tx_full); end
        if (st_tx_empty !== exp_st_tx_empty) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_tx_empty = %h, expected %h", cyc, st_tx_empty, exp_st_tx_empty); end
        if (st_rx_data !== exp_st_rx_data) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_rx_data = %h, expected %h", cyc, st_rx_data, exp_st_rx_data); end
        if (st_rx_empty !== exp_st_rx_empty) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_rx_empty = %h, expected %h", cyc, st_rx_empty, exp_st_rx_empty); end
        if (st_vlog_data !== exp_st_vlog_data) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_vlog_data = %h, expected %h", cyc, st_vlog_data, exp_st_vlog_data); end
        if (st_vlog_empty !== exp_st_vlog_empty) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_vlog_empty = %h, expected %h", cyc, st_vlog_empty, exp_st_vlog_empty); end
        if (st_cov_rdata !== exp_st_cov_rdata) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_cov_rdata = %h, expected %h", cyc, st_cov_rdata, exp_st_cov_rdata); end
        if (st_irq !== exp_st_irq) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_irq = %h, expected %h", cyc, st_irq, exp_st_irq); end
        if (st_halted_viol !== exp_st_halted_viol) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_halted_viol = %h, expected %h", cyc, st_halted_viol, exp_st_halted_viol); end
        if (st_rx_overflow !== exp_st_rx_overflow) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_rx_overflow = %h, expected %h", cyc, st_rx_overflow, exp_st_rx_overflow); end
        if (st_vlog_overflow !== exp_st_vlog_overflow) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_vlog_overflow = %h, expected %h", cyc, st_vlog_overflow, exp_st_vlog_overflow); end
        if (st_cov_overrun !== exp_st_cov_overrun) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_cov_overrun = %h, expected %h", cyc, st_cov_overrun, exp_st_cov_overrun); end
        if (st_host_err !== exp_st_host_err) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_host_err = %h, expected %h", cyc, st_host_err, exp_st_host_err); end
        if (st_host_err_cause !== exp_st_host_err_cause) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_host_err_cause = %h, expected %h", cyc, st_host_err_cause, exp_st_host_err_cause); end
        if (st_lane_active !== exp_st_lane_active) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_lane_active = %h, expected %h", cyc, st_lane_active, exp_st_lane_active); end
        if (st_image_valid !== exp_st_image_valid) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_image_valid = %h, expected %h", cyc, st_image_valid, exp_st_image_valid); end
        if (st_verify_busy !== exp_st_verify_busy) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_verify_busy = %h, expected %h", cyc, st_verify_busy, exp_st_verify_busy); end
        if (st_tx_collision !== exp_st_tx_collision) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_tx_collision = %h, expected %h", cyc, st_tx_collision, exp_st_tx_collision); end
        if (st_drops !== exp_st_drops) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_drops = %h, expected %h", cyc, st_drops, exp_st_drops); end
        if (st_lane_status !== exp_st_lane_status) begin errors = errors + 1; if (errors < 10) $display("cycle %0d: st_lane_status = %h, expected %h", cyc, st_lane_status, exp_st_lane_status); end
      end
    end
    if (errors == 0) $display("PASS: generated Verilog matches Hardcaml on %0d cycles", cyc);
    else $display("FAIL: %0d mismatches", errors);
    $finish;
  end
endmodule
