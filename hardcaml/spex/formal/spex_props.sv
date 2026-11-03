// Formal properties for spex_core (GUIDE step 12). The SRAM read data, the pins and
// every host input are free, so the proofs hold for every spec the location store
// could hold, every bus behaviour and every host access sequence.
module spex_props (
    input clock,
    input [31:0] host_cov_wdata, input host_cov_we, input [7:0] host_cov_addr,
    input [127:0] host_rec_wdata, input host_rec_we, input [7:0] host_rec_waddr,
    input host_cover_en, input host_irq_ack, input [31:0] ram_cov_rdata,
    input host_vlog_pop, input [7:0] host_open_drain, input [127:0] ram_rec_rdata,
    input [5:0] host_start_loc, input [5:0] host_recover_loc, input [1:0] host_role,
    input [7:0] host_match_addr, input host_rx_pop, input [7:0] host_tx_data,
    input host_tx_push, input [7:0] pins_in, input host_stop, input host_start,
    input host_cov_re, input [1:0] host_lane_we, input host_err_clear,
    input host_verify, input [31:0] host_crc_expect, input host_crc_expect_we,
    input [2:0] host_rx_wm, input [2:0] host_tx_wm, input host_tx_wm_en, input host_drop_clear,
    input host_rx_to_tx,
    input [5:0] host_lane0_skip, input host_lane0_len_en, input [5:0] host_lane0_len_pos, input [3:0] host_lane0_len_max,
    input [5:0] host_lane1_skip, input host_lane1_len_en, input [5:0] host_lane1_len_pos, input [3:0] host_lane1_len_max,
    // bit lanes (new-arch): lane configurations and pin source select, all free
    input host_lane0_clk_edge, input [2:0] host_lane0_clk_pin, input host_lane0_clk_pin_en, input [1:0] host_lane0_code, input host_lane0_crc_inv, input [5:0] host_lane0_crc_width, input [2:0] host_lane0_data_pin, input host_lane0_dir, input [7:0] host_lane0_div_frac, input [15:0] host_lane0_div_int, input [15:0] host_lane0_frame_bits, input [31:0] host_lane0_init, input host_lane0_lsb_first, input [31:0] host_lane0_poly, input host_lane0_readback, input [1:0] host_lane0_stuff, input [2:0] host_lane0_stuff_len, input [15:0] host_lane0_sync, input [15:0] host_lane0_sync_mask, input host_lane1_clk_edge, input [2:0] host_lane1_clk_pin, input host_lane1_clk_pin_en, input [1:0] host_lane1_code, input host_lane1_crc_inv, input [5:0] host_lane1_crc_width, input [2:0] host_lane1_data_pin, input host_lane1_dir, input [7:0] host_lane1_div_frac, input [15:0] host_lane1_div_int, input [15:0] host_lane1_frame_bits, input [31:0] host_lane1_init, input host_lane1_lsb_first, input [31:0] host_lane1_poly, input host_lane1_readback, input [1:0] host_lane1_stuff, input [2:0] host_lane1_stuff_len, input [15:0] host_lane1_sync, input [15:0] host_lane1_sync_mask, input [23:0] host_pin_src
);
    reg init = 1'b1;
    always @(posedge clock) init <= 1'b0;
    wire clear = init;

    wire [7:0] pins_out, pins_oe;
    wire st_running, st_in_entry, st_accepting, st_taken, st_viol, st_tx_full, st_tx_empty;
    wire st_rx_empty, st_vlog_empty, st_irq, st_halted_viol, st_rx_overflow, st_vlog_overflow, st_cov_overrun;
    wire [5:0] st_cur_loc; wire [1:0] st_taken_edge, st_viol_kind; wire [31:0] st_timestamp;
    wire [7:0] st_rx_data; wire [47:0] st_vlog_data; wire [31:0] st_cov_rdata;
    wire [7:0] ram_rec_addr, ram_cov_addr; wire ram_rec_re, ram_rec_we, ram_cov_re, ram_cov_we;
    wire [127:0] ram_rec_wdata; wire [31:0] ram_cov_wdata;
    wire [15:0] st_lane_status;
    wire st_tx_collision; wire [39:0] st_drops;
    wire st_host_err; wire [2:0] st_host_err_cause; wire [1:0] st_lane_active;
    wire f_viol_now, f_host_cov_we; wire [1:0] f_policy;
    wire st_image_valid, st_verify_busy, f_image_valid, f_sweeping, f_sw_last, f_sw_match, f_store_we;
    wire [12:0] f_sw_cnt, \f_sw_cnt.i ;  // the cut, free sweep counter outside P10/P11 (prove.sh)
    wire f_lane0_out, f_lane1_out;  // lane outputs at the pin stage: free inputs in L4 (prove.sh)
    wire [7:0] f_pout, f_poe;
    wire f_rx_push, f_eng_push;  // RX FIFO push; engine rx_op push (P12)
    wire f_recover_jump = f_in_eval && fires == 4'd0 && f_viol_now && f_policy == 2'd2;

    // internal signals, made ports of spex_core by `expose` in prove.sh
    wire f_fire0, f_fire1, f_fire2, f_fire3, f_in_eval, f_in_fetch, f_unexp_now;
    wire [1:0] f_winner;
    wire [7:0] f_changed_all, f_chg_now, f_watch;
    wire f_amb_now, f_valid0, f_valid1, f_valid2, f_valid3;
    wire [7:0] f_multi_eff, f_relevant, f_chgmask0, f_chgmask1, f_chgmask2, f_chgmask3;

    spex_core dut (.*);

    // P1: the winning edge is the lowest-index edge whose guard is true.
    wire [3:0] fires = {f_fire3, f_fire2, f_fire1, f_fire0};
    wire [1:0] lowest = f_fire0 ? 2'd0 : f_fire1 ? 2'd1 : f_fire2 ? 2'd2 : 2'd3;
`ifdef P1
    always @* if (!init && f_in_eval && fires != 4'd0) begin
        assert (f_winner == lowest);  // A1
        assert (fires[f_winner]);     // A2
    end
    // ... and it is the edge the status port reports the next cycle.
    always @(posedge clock) if (!init && !$past(init) && $past(f_in_eval && fires != 4'd0)) begin
        assert (st_taken);            // A3
        assert (st_taken_edge == $past(lowest));  // A4
    end

`endif
    // P3: the first change and its time are kept. A change seen while fetching is
    // still in changed_all on the first EVAL cycle, and in EVAL a change on a watched
    // pin either fires an edge or is logged as a violation.
    reg [7:0] pend = 8'd0;
    always @(posedge clock) begin
        // a host start or stop restarts the engine and drops pending changes
        if (init || !(f_in_fetch || f_in_eval) || host_start || host_stop) pend <= 8'd0;
        else if (f_in_eval) pend <= 8'd0;
        else pend <= pend | f_chg_now;
    end
`ifdef P3
    always @* if (!init && f_in_eval) begin
        assert (((pend | f_chg_now) & ~f_changed_all) == 8'd0);  // A5
        if ((f_changed_all & f_watch) != 8'd0) assert (fires != 4'd0 || f_unexp_now);  // A6
    end

`endif
    // P7: an ambiguous input history cannot silently select a change-triggered edge.
    // The relevant mask is computed here from the edges, not taken from the design.
    wire [7:0] rel = f_watch | (f_valid0 ? f_chgmask0 : 8'd0) | (f_valid1 ? f_chgmask1 : 8'd0)
                   | (f_valid2 ? f_chgmask2 : 8'd0) | (f_valid3 ? f_chgmask3 : 8'd0);
    wire [7:0] amb = f_multi_eff & rel;
    wire amb_eval = f_in_eval && amb != 8'd0;
`ifdef P7
    always @* if (!init && amb_eval) begin
        assert (!(f_fire0 && (f_chgmask0 & amb) != 8'd0));  // A7a: no edge waiting on it fires
        assert (!(f_fire1 && (f_chgmask1 & amb) != 8'd0));
        assert (!(f_fire2 && (f_chgmask2 & amb) != 8'd0));
        assert (!(f_fire3 && (f_chgmask3 & amb) != 8'd0));
    end
    always @(posedge clock) if (!init && !$past(init) && $past(amb_eval)) begin
        assert (st_viol && st_viol_kind == 2'd0);  // A7b: an AMBIGUOUS entry is pushed
    end
`endif
    reg amb_seen = 1'b0;  // an AMBIGUOUS since the last FETCH
    always @(posedge clock) begin
        if (init || f_in_fetch || !(f_in_eval)) amb_seen <= 1'b0;
        else if (amb_eval) amb_seen <= 1'b1;
    end
`ifdef P7
    always @* if (!init && amb_eval) assert (!amb_seen);  // A7c: at most one per fetch
`endif

    // P8: while running, the host port never reaches the store's or the coverage
    // SRAM's write enable, and a coverage read returns 0.
`ifdef P8
    always @* if (!init && st_running) begin
        assert (!ram_rec_we);                       // A8a: the store is only written by the host
        assert (!f_host_cov_we);                    // A8b
        if (host_cov_re) assert (st_cov_rdata == 32'd0);  // A8c
    end

`endif
    // P9: a recover jump goes to the recover_loc latched at the last start.
    reg [5:0] rec_lat = 6'd0;
    // only an accepted start latches: a start is refused while the image is invalid
    always @(posedge clock) if (host_start && f_image_valid) rec_lat <= host_recover_loc;
`ifdef P9
    always @(posedge clock) if (!init && !$past(init) && $past(f_recover_jump) && !$past(host_start) && !$past(host_stop))
        assert (st_cur_loc == $past(rec_lat));     // A9

`endif
    // P10: the engine never leaves IDLE while image_valid = 0.
`ifdef P10
    always @(posedge clock) if (!init && !$past(init) && !$past(st_running) && st_running)
        assert ($past(st_image_valid));            // A10
`endif
    // P11: image_valid rises only on the cycle a complete sweep ends with a CRC match,
    // and falls on any accepted store write.
`ifdef P11
    // sweep length counted here, not taken from the design's sw_last: a complete sweep
    // reads all 4096 bytes, so it ends on its 4097th cycle
    reg [12:0] sc = 13'd0;
    always @(posedge clock) sc <= (init || !f_sweeping) ? 13'd0 : sc + 13'd1;
    always @(posedge clock) if (!init && !$past(init)) begin
        if (st_image_valid && !$past(st_image_valid))
            assert ($past(f_sweeping && sc == 13'd4096 && f_sw_match));  // A11a
        if (f_sweeping) assert (sc == f_sw_cnt);  // A11c, a lemma that makes A11a inductive
        if ($past(f_store_we)) assert (!st_image_valid);              // A11b
    end

`endif
`ifdef CHECK_ROLE
    // P2: in Check role the engine never drives a pin. Every start is a Check start.
    // pins_oe never changes. pins_out is the pin value: with a bit lane as a pin's
    // source (new-arch) it follows the lane, which runs in Check role too (CAN RX), so
    // it is stable only while every pin's source is the engine; it is never enabled.
    always @* assume (host_role == 2'd1);
    always @(posedge clock) if (!init && !$past(init)) begin
        assume (host_open_drain == $past(host_open_drain));
        assert (pins_oe == $past(pins_oe));
        if (host_pin_src == 24'd0 && $past(host_pin_src) == 24'd0) assert (pins_out == $past(pins_out));
    end
`endif

    // P5: FIFO flags are consistent.
`ifdef P5
    always @* if (!init) begin
        assert (!(st_tx_full && st_tx_empty));
    end

`endif
    // P4: at most one TIMEOUT per location visit. A visit ends with a taken edge or
    // a new fetch (entry); a TIMEOUT before the next one is a second TIMEOUT.
    reg armed = 1'b1;
    always @(posedge clock) begin
        if (init) armed <= 1'b1;
        else if (st_taken || st_in_entry || !st_running) armed <= 1'b1;
        else if (st_viol && st_viol_kind[1]) armed <= 1'b0;
    end
`ifdef P4
    always @(posedge clock) if (!init) begin
        if (st_viol && st_viol_kind[1] && st_running && !st_taken && !st_in_entry) assert (armed);
    end

`endif
    // P6: the timestamp counts every cycle.
`ifdef P6
    always @(posedge clock) if (!init && !$past(init)) assert (st_timestamp == $past(st_timestamp) + 32'd1);
`endif
`ifdef SANITY
    always @* if (!init) assert (st_timestamp != 32'd5);  // must FAIL: shows the flow sees the asserts
`endif
    // L4: a lane drives only the pins whose source select names it. prove.sh frees both lane
    // outputs, so they take any value; each pin must then equal the ENGINE.md Pins table
    // entry, which reads only the selected lane (or none), whatever the other lane does.
`ifdef L4
    genvar p;
    for (p = 0; p < 8; p = p + 1) begin : l4
        wire [2:0] src = host_pin_src[3*p +: 3];
        wire e = f_pout[p];
        wire v = src == 3'd0 ? e
               : src == 3'd1 ? f_lane0_out : src == 3'd2 ? !f_lane0_out
               : src == 3'd3 ? (f_lane0_out & e) : src == 3'd4 ? (!f_lane0_out & e)
               : src == 3'd5 ? f_lane1_out : src == 3'd6 ? !f_lane1_out : (f_lane1_out & e);
        always @* if (!init) begin
            assert (pins_out[p] == (v & !host_open_drain[p]));
            assert (pins_oe[p] == (f_poe[p] & !(host_open_drain[p] & v)));
        end
    end
`endif
    // P12: with rx_to_tx (bridge) set, lane RX bytes never reach the RX FIFO: from the
    // cycle the bit is set, the RX FIFO takes at most one push more than the engine made
    // (an engine byte already waiting in its buffer).
`ifdef P12
    reg [2:0] p12_d = 3'd0;  // RX FIFO pushes minus engine pushes, saturating
    always @(posedge clock)
        if (init || !host_rx_to_tx) p12_d <= 3'd0;
        else if (f_rx_push && !f_eng_push && p12_d != 3'd7) p12_d <= p12_d + 3'd1;
        else if (!f_rx_push && f_eng_push && p12_d != 3'd0) p12_d <= p12_d - 3'd1;
    always @(posedge clock) if (!init && $past(host_rx_to_tx) && host_rx_to_tx) assert (p12_d <= 3'd1);
`endif
endmodule
