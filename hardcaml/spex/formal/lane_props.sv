// Formal properties of one bit lane (out/spex_lane.v), stated on the line it drives
// against ENGINE.md (Bit lanes), not against lane.ml. Every configuration, command
// sequence, TX FIFO byte and pin input is free, except as assumed below. The header skip
// and length field (skip, len_en, len_pos, len_max) are free on every TX lane (ENGINE.md:
// TX lanes ignore them), off on the RX lane of L2, and free on the RX lane of L5. One group per
// run (prove_lanes.sh), each guarded by `ifdef L<n>`.
//   L1  stuffing: the line never shows more than stuff_len equal bits (mode 1, CAN) or
//       stuff_len ones (mode 2, USB) in a row
//   L3  the CRC field the lane sends is the CRC of the data bits it sent, computed here
//   L2  (lane_loop_props) TX -> RX loopback returns every byte, in order, with crc_ok
//   L5  (lane_len_props) RX header skip and length field: the pushes and Done match a
//       reference of ENGINE.md

// The configuration a test drives into one lane.
`define LANE_CFG_PORTS \
    input clk_edge, input [2:0] clk_pin, input clk_pin_en, input [1:0] code, input crc_inv, \
    input [5:0] crc_width, input [2:0] data_pin, input [7:0] div_frac, input [15:0] div_int, \
    input [15:0] frame_bits, input [31:0] init, input lsb_first, input [31:0] poly, \
    input readback, input [1:0] stuff, input [2:0] stuff_len, input [15:0] sync, \
    input [15:0] sync_mask, input [5:0] skip, input len_en, input [5:0] len_pos, \
    input [3:0] len_max

// rxf_v = 1: the skip and length-field inputs reach the lane; 0: tied off
`define LANE_CFG_CONNECT(dir_v, edge_v, rb_v, rxf_v) \
    .cfg_dir(dir_v), .cfg_div_int(div_int), .cfg_div_frac(div_frac), .cfg_clk_pin_en(clk_pin_en), \
    .cfg_clk_pin(clk_pin), .cfg_clk_edge(edge_v), .cfg_code(code), .cfg_stuff(stuff), \
    .cfg_stuff_len(stuff_len), .cfg_poly(poly), .cfg_init(init), .cfg_crc_width(crc_width), \
    .cfg_crc_inv(crc_inv), .cfg_sync(sync), .cfg_sync_mask(sync_mask), .cfg_data_pin(data_pin), \
    .cfg_lsb_first(lsb_first), .cfg_readback(rb_v), .cfg_frame_bits(frame_bits), \
    .cfg_skip(rxf_v ? skip : 6'd0), .cfg_len_en(rxf_v ? len_en : 1'b0), \
    .cfg_len_pos(rxf_v ? len_pos : 6'd0), .cfg_len_max(rxf_v ? len_max : 4'd0)

`define CFG_BUS {clk_edge, clk_pin, clk_pin_en, code, crc_inv, crc_width, data_pin, div_frac, \
    div_int, frame_bits, init, lsb_first, poly, readback, stuff, stuff_len, sync, sync_mask, \
    skip, len_en, len_pos, len_max}

// ---------------------------------------------------------------------------------------
// One TX lane: L1, L3
module lane_tx_props (
    input clock, `LANE_CFG_PORTS,
    input go, input end_, input crc_cmd, input reset,
    input [7:0] pins_s, input [7:0] tx_head, input tx_empty
);
    reg init0 = 1'b1, init1 = 1'b1;
    always @(posedge clock) begin init0 <= 1'b0; init1 <= init0; end
    reg [7:0] pins_q = 8'hFF;
    always @(posedge clock) pins_q <= pins_s;  // the synchroniser's second flop

    wire out, pop, push, done_, crc_ok, sync_hit, error, active, lost, g_tx_bit, g_data_left;
    wire [7:0] push_data; wire [2:0] err_kind;
    wire [15:0] g_cnt; wire [31:0] g_crc; wire [2:0] g_run; wire g_last; wire [1:0] g_len;  // lemma only
    spex_lane dut (.clock(clock), .clear(init0), `LANE_CFG_CONNECT(1'b0, clk_edge, readback, 1'b1),
        .go(go), .end_(end_), .crc_cmd(crc_cmd), .reset(reset), .pins_s(pins_s), .pins_q(pins_q),
        .tx_head(tx_head), .tx_empty(tx_empty), .out(out), .pop(pop), .push(push),
        .push_data(push_data), .done_(done_), .crc_ok(crc_ok), .sync_hit(sync_hit),
        .error(error), .err_kind(err_kind), .active(active), .lost(lost), .g_tx_bit(g_tx_bit),
        .g_data_left(g_data_left), .g_cnt(g_cnt), .g_crc(g_crc), .g_run(g_run), .g_last(g_last), .g_len_cap(g_len[1]), .g_len_known(g_len[0]));

    // The host writes the CSRs only while the lane is Idle (ENGINE.md), never in the cycle
    // of a GO; the divider is >= 4. The engine sends one command code per cycle; the stop
    // input may add a reset to any of them. No command in the first two cycles (clear).
    wire idle = !active && !done_;
    reg [$bits(`CFG_BUS)-1:0] cfg_q;
    always @(posedge clock) cfg_q <= `CFG_BUS;
    always @* if (!init0 && !(idle && !go)) assume (`CFG_BUS == cfg_q);
    always @* begin
        assume (clk_pin_en || div_int >= 16'd4);
        assume (stuff != 2'd3 && code != 2'd3 && (stuff == 2'd0 || stuff_len != 3'd0));
        assume ($onehot0({go, end_, crc_cmd}));
        if (init0 || init1) assume (!go && !end_ && !crc_cmd && !reset);
    end

    // The line: the cycle after g_tx_bit, `out` holds the slot's line level (ENGINE.md:
    // NRZ out = slot; NRZI out toggles on a 0; Manchester out = NOT slot first). A command
    // or a readback abort in that cycle ends the frame; GO restarts it.
    reg sent = 1'b0, out_before = 1'b1, go_q = 1'b0;
    always @(posedge clock) begin sent <= g_tx_bit; out_before <= out; go_q <= go; end
    wire bit_valid = sent && (active || done_) && !go_q && !init0;
    wire slot = code == 2'd0 ? out : code == 2'd1 ? (out == out_before) : !out;

    // stuffing run as ENGINE.md counts it (stuff bits included)
    reg [3:0] run = 4'd0; reg last = 1'b1;
    wire [3:0] run_n = stuff == 2'd2 ? (slot ? run + 4'd1 : 4'd0)
                     : (run != 4'd0 && slot == last) ? run + 4'd1 : 4'd1;
    wire is_stuff = stuff != 2'd0 && run == {1'b0, stuff_len};
    always @(posedge clock)
        if (go) begin run <= 4'd0; last <= 1'b1; end
        else if (bit_valid) begin run <= run_n > 4'd8 ? 4'd8 : run_n; last <= slot; end

`ifdef L1
    always @* if (bit_valid && stuff != 2'd0 && stuff_len != 3'd0) assert (run_n <= {1'b0, stuff_len});
`endif

`ifdef L3
    // reference CRC (ENGINE.md: fb = b xor crc[31], crc = (crc << 1) xor (fb ? poly : 0)),
    // over the destuffed data bits read off the line; the bits after them are the CRC field
    reg [31:0] ref_crc = 32'd0; reg [16:0] ndata = 17'd0;
    wire is_data = !is_stuff && ndata < {1'b0, frame_bits};
    wire fb = slot ^ ref_crc[31];
    always @(posedge clock)
        if (go) begin ref_crc <= init; ndata <= 17'd0; end
        else if (bit_valid && !is_stuff) begin
            if (is_data) begin ref_crc <= (ref_crc << 1) ^ (fb ? poly : 32'd0); ndata <= ndata + 17'd1; end
            else ref_crc <= ref_crc << 1;
        end
    always @* if (bit_valid && !is_stuff && !is_data) assert (slot == (ref_crc[31] ^ crc_inv));
`ifndef NO_LEMMAS
    // Helper lemmas (proved too, they are assertions): with the bit read this cycle, the
    // monitor's state equals the lane's (the lane took the bit a cycle earlier). They
    // only speed up PDR; L3 is the assertion above.
    wire [31:0] ref_nx = !(bit_valid && !is_stuff) ? ref_crc
                       : is_data ? (ref_crc << 1) ^ (fb ? poly : 32'd0) : ref_crc << 1;
    wire [16:0] nd_nx = bit_valid && is_data ? ndata + 17'd1 : ndata;
    always @* if (!init0 && (active || done_)) begin
        assert (ref_nx == g_crc);
        assert (nd_nx == {1'b0, g_cnt});
        assert ((bit_valid ? slot : last) == g_last);
        if (stuff != 2'd0) assert ((bit_valid ? run_n : run) == {1'b0, g_run});
    end
    always @* if (!init0 && (active || done_) && stuff != 2'd0) assert (g_run <= stuff_len);
    always @* if (!init0) assert (g_len == 2'b00);  // a TX lane never takes a length field
`endif  // NO_LEMMAS
`endif
endmodule

// ---------------------------------------------------------------------------------------
// L2: TX -> RX loopback. Two lanes with one configuration, clocked by one pin (clk_pin_en):
// TX sends on one edge, RX samples on the other (as SPI). The wire is ideal (the TX `out`
// is the RX `pins_s`); the 2-flop synchroniser of the chip is the host's SCK <= clk/6 rule,
// and the divider-timed loopback is covered by simulation (test_lane.ml).
module lane_loop_props (
    input clock, `LANE_CFG_PORTS,
    input go, input crc_cmd, input reset, input sck,
    input [7:0] pins_free, input [7:0] tx_head
);
    reg init0 = 1'b1, init1 = 1'b1;
    always @(posedge clock) begin init0 <= 1'b0; init1 <= init0; end

    wire t_out, t_pop, t_push, t_done, t_crc_ok, t_sync, t_err, t_active, t_lost, t_g, t_left;
    wire r_out, r_pop, r_push, r_done, r_crc_ok, r_sync, r_err, r_active, r_lost, r_g, r_left;
    wire [7:0] t_pd, r_pd; wire [2:0] t_kind, r_kind;
    // lane registers, for the helper lemmas only
    wire [15:0] t_cnt, r_cnt; wire [31:0] t_crc, r_crc; wire [2:0] t_run, r_run, t_bitpos, r_bitpos;
    wire [7:0] t_byte, r_byte; wire [5:0] t_cleft, r_cleft; wire [1:0] t_mode, r_mode;
    wire t_last, r_last, t_crc_bad, r_crc_bad, t_prev, r_prev; wire [1:0] t_len, r_len;
    // RX data pin = TX out; clock pin = sck; other pins free
    wire [7:0] pins_s = (pins_free & ~(8'd1 << data_pin) & ~(8'd1 << clk_pin))
                      | ({7'd0, t_out} << data_pin) | ({7'd0, sck} << clk_pin);
    reg [7:0] pins_q = 8'hFF;
    always @(posedge clock) pins_q <= pins_s;

    spex_lane tx (.clock(clock), .clear(init0), `LANE_CFG_CONNECT(1'b0, clk_edge, 1'b0, 1'b1),
        .go(go), .end_(1'b0), .crc_cmd(crc_cmd), .reset(reset), .pins_s(pins_s), .pins_q(pins_q),
        .tx_head(tx_head), .tx_empty(1'b0), .out(t_out), .pop(t_pop), .push(t_push),
        .push_data(t_pd), .done_(t_done), .crc_ok(t_crc_ok), .sync_hit(t_sync), .error(t_err),
        .err_kind(t_kind), .active(t_active), .lost(t_lost), .g_tx_bit(t_g), .g_data_left(t_left),
        .g_cnt(t_cnt), .g_crc(t_crc), .g_run(t_run), .g_last(t_last), .g_bitpos(t_bitpos),
        .g_byte(t_byte), .g_left(t_cleft), .g_crc_bad(t_crc_bad), .g_prev(t_prev), .g_mode(t_mode),
        .g_len_cap(t_len[1]), .g_len_known(t_len[0]));
    spex_lane rx (.clock(clock), .clear(init0), `LANE_CFG_CONNECT(1'b1, !clk_edge, 1'b0, 1'b0),
        .go(go), .end_(1'b0), .crc_cmd(crc_cmd), .reset(reset), .pins_s(pins_s), .pins_q(pins_q),
        .tx_head(8'hFF), .tx_empty(1'b1), .out(r_out), .pop(r_pop), .push(r_push),
        .push_data(r_pd), .done_(r_done), .crc_ok(r_crc_ok), .sync_hit(r_sync), .error(r_err),
        .err_kind(r_kind), .active(r_active), .lost(r_lost), .g_tx_bit(r_g), .g_data_left(r_left),
        .g_cnt(r_cnt), .g_crc(r_crc), .g_run(r_run), .g_last(r_last), .g_bitpos(r_bitpos),
        .g_byte(r_byte), .g_left(r_cleft), .g_crc_bad(r_crc_bad), .g_prev(r_prev), .g_mode(r_mode),
        .g_len_cap(r_len[1]), .g_len_known(r_len[0]));

    // One configuration for the whole run; clocked, not Manchester (whose mid-bit
    // transition needs the divider); clock and data on different pins. Both lanes get
    // the same commands; no END (it would push a partial byte); the TX FIFO never runs
    // dry. At GO the clock is at its idle level, so the first edge is a TX edge. The CRC
    // command comes while TX still has data bits to send ("armed during the frame",
    // ENGINE.md); one that comes later leaves a gap of idle bits before the CRC, which
    // the receiver cannot know about.
    reg [$bits(`CFG_BUS)-1:0] cfg_q;
    always @(posedge clock) cfg_q <= `CFG_BUS;
    always @* if (!init0) assume (`CFG_BUS == cfg_q);
    wire sck_idle = clk_edge;  // TX on the falling edge: idle high
    always @* begin
        assume (clk_pin_en && code != 2'd2 && clk_pin != data_pin);
        assume ($onehot0({go, crc_cmd}));
        if (crc_cmd) assume (t_active && t_left);
        // An RX lane with an empty frame takes one sample after GO and, as ENGINE.md
        // counts it, that bit can make a stuff bit due only when stuff_len = 1; TX sends
        // none. Excluded: an empty frame with a stuff bit after every bit.
        assume (!(frame_bits == 16'd0 && stuff != 2'd0 && stuff_len == 3'd1));
        if (init0 || init1) assume (!go && !crc_cmd && !reset);
        if (go) assume (sck == sck_idle && pins_q[clk_pin] == sck_idle);
    end

    // every byte TX pops comes out of RX, in order, before the next pop
    reg inflight = 1'b0; reg [7:0] expect_b = 8'd0;
    always @(posedge clock)
        if (go || reset || init0) inflight <= 1'b0;
        else begin
            if (t_pop) begin inflight <= 1'b1; expect_b <= tx_head; end
            else if (r_push) inflight <= 1'b0;
        end
    // after a CRC command (and before the next GO or reset), RX Done means the CRC matched
    reg want_ok = 1'b0;
    always @(posedge clock)
        if (go || reset || init0) want_ok <= 1'b0;
        else if (crc_cmd && crc_width != 6'd0) want_ok <= 1'b1;
`ifdef L2
`ifndef NO_LEMMAS
    // Helper lemmas (proved with the rest): RX holds the state TX had before the bit on
    // the wire (`pend`: sent, not yet sampled), or TX's state when no bit is pending.
    wire rx_edge = clk_edge ? (pins_s[clk_pin] && !pins_q[clk_pin]) : (!pins_s[clk_pin] && pins_q[clk_pin]);
    reg pend = 1'b0, in_frame = 1'b0;
    reg [15:0] s_cnt; reg [31:0] s_crc; reg [2:0] s_run, s_bitpos; reg [7:0] s_byte; reg [5:0] s_cleft;
    reg s_last, s_out;
    always @(posedge clock) begin
        if (reset || init0) in_frame <= 1'b0; else if (go) in_frame <= 1'b1;  // reset acts last
        if (go || reset || init0) pend <= 1'b0;
        else if (t_g) pend <= 1'b1;
        else if (rx_edge && r_active) pend <= 1'b0;
        if (t_g) begin
            s_cnt <= t_cnt; s_crc <= t_crc; s_run <= t_run; s_bitpos <= t_bitpos; s_byte <= t_byte;
            s_cleft <= t_cleft; s_last <= t_last; s_out <= t_out;
        end
        if (crc_cmd) s_cleft <= crc_width;  // both lanes take it at once
    end
    wire [15:0] T_cnt = pend ? s_cnt : t_cnt;     wire [31:0] T_crc = pend ? s_crc : t_crc;
    wire [2:0] T_run = pend ? s_run : t_run;      wire [2:0] T_bitpos = pend ? s_bitpos : t_bitpos;
    wire [7:0] T_byte = pend ? s_byte : t_byte;   wire [5:0] T_cleft = pend ? s_cleft : t_cleft;
    wire T_last = pend ? s_last : t_last;         wire T_line = pend ? s_out : t_out;
    // the k = T_bitpos bits of the current byte RX has: lsb_first r_byte[7:8-k] =
    // byte[k-1:0], else r_byte[k-1:0] = byte[7:8-k]
    wire [7:0] kmask = (8'd1 << T_bitpos) - 8'd1;
    wire byte_ok = lsb_first ? (((r_byte >> (4'd8 - T_bitpos)) & kmask) == (T_byte & kmask))
                             : ((r_byte & kmask) == ((T_byte >> (4'd8 - T_bitpos)) & kmask));
    always @* if (!init0 && in_frame) begin
        assert (r_cnt == T_cnt && r_crc == T_crc);
        // (an empty frame's one RX sample moves RX's stuffing count; both are Done then)
        if (!(t_mode == 2'd3 && r_mode == 2'd3)) assert (r_run == T_run && r_last == T_last);
        assert (r_bitpos == T_bitpos && r_cleft == T_cleft && !r_crc_bad);
        if (code == 2'd1 && (t_mode == 2'd2 || pend)) assert (r_prev == T_line);
        if (r_mode == 2'd2 && !pend && r_cnt == frame_bits && r_cleft == 6'd0 && !(stuff != 2'd0 && r_run == stuff_len))
            assert (frame_bits == 16'd0 && r_prev && r_run == 3'd0 && r_last);  // only an empty frame
        if (T_bitpos != 3'd0) assert (byte_ok);
        assert (inflight == (r_bitpos != 3'd0 || t_bitpos != 3'd0));
        assert (t_mode[1] && r_mode[1]);  // Run or Done
        if (!pend && t_mode == 2'd2) assert (pins_q[clk_pin] == sck_idle);  // next edge: TX
        assert (t_cnt <= frame_bits && T_cnt <= frame_bits);
        if (pend) assert (t_cnt == s_cnt || t_cnt == s_cnt + 16'd1);
        if (t_cnt != frame_bits) assert (t_bitpos == t_cnt[2:0]);
        if (t_mode == 2'd3) assert (t_cnt == frame_bits && t_cleft == 6'd0 && !(stuff != 2'd0 && t_run == stuff_len));
        if (r_mode == 2'd3) assert (r_cnt == frame_bits && r_cleft == 6'd0 && !pend && !(stuff != 2'd0 && r_run == stuff_len));
        if (inflight) assert (expect_b == t_byte);
        if (want_ok) assert (crc_width != 6'd0 && (r_cleft != 6'd0 || (r_crc_ok && r_cnt == frame_bits)));
        if (!want_ok) assert (r_cleft == 6'd0 && t_cleft == 6'd0 && !r_crc_ok);
    end
    // the bit on the wire, decoded from the line, and what TX did to send it
    wire w_slot = code == 2'd1 ? (t_out == s_out) : t_out;
    wire w_stuff = stuff != 2'd0 && s_run == stuff_len;
    wire w_data = !w_stuff && s_cnt < frame_bits;
    wire [2:0] w_run = stuff == 2'd2 ? (w_slot ? s_run + 3'd1 : 3'd0)
                     : (s_run != 3'd0 && w_slot == s_last) ? s_run + 3'd1 : 3'd1;
    always @* if (!init0 && in_frame && pend) begin
        assert (pins_q[clk_pin] != sck_idle);  // the last clock edge was a TX edge
        assert (t_last == w_slot && t_run == w_run);
        if (!(w_data && s_bitpos == 3'd0)) assert (t_byte == s_byte);
        if (w_stuff) assert (t_cnt == s_cnt && t_bitpos == s_bitpos && t_crc == s_crc && t_cleft == s_cleft
                             && w_slot == (stuff == 2'd1 ? !s_last : 1'b0));
        else if (w_data) assert (t_cnt == s_cnt + 16'd1 && t_bitpos == s_bitpos + 3'd1 && t_cleft == s_cleft
                                 && w_slot == (lsb_first ? t_byte[s_bitpos] : t_byte[3'd7 - s_bitpos])
                                 && (s_bitpos == 3'd0 || t_byte == s_byte)
                                 && t_crc == ((s_crc << 1) ^ ((w_slot ^ s_crc[31]) ? poly : 32'd0)));
        else assert (t_cnt == s_cnt && t_bitpos == s_bitpos && t_crc == s_crc << 1
                     && t_cleft == s_cleft - 6'd1 && s_cleft != 6'd0 && w_slot == (s_crc[31] ^ crc_inv));
    end
    always @* if (!init0 && !in_frame) assert (t_mode == 2'd0 && r_mode == 2'd0 && !want_ok && !inflight && !r_err);
    always @* if (!init0) assert (t_len == 2'b00 && r_len == 2'b00);  // TX: never takes a field; RX: len_en tied off
`endif  // NO_LEMMAS
    always @* if (!init0) begin
        if (t_pop) assert (!inflight);                         // A: the previous byte arrived
        if (r_push) assert (inflight && r_pd == expect_b);     // B: the same byte, in order
        assert (!r_err);                                       // C: no stuff error on RX
        if (want_ok && r_done) assert (r_crc_ok);              // D: RX accepts the CRC TX sent
    end
`endif
endmodule

// ---------------------------------------------------------------------------------------
// L5: RX header skip and length field (ENGINE.md, Bit lanes: "Length field"). One RX lane
// clocked by a pin (clk_pin_en), NRZ, no stuffing: the skip and the length field act on
// the data bits after line decoding and destuffing, which L2 covers. A reference written
// from ENGINE.md counts the data bits, takes the field (4 bits ending at index len_pos,
// first received is the MSB), forms limit = skip + 8 min(field, len_max) when shorter than
// frame_bits, and assembles bytes from data bit `skip` on. The lane's pushes must be the
// reference's, in the same cycle with the same byte, and Done must come only after all
// `limit` data bits. The host rule skip > len_pos (with len_en) is assumed; no END.
module lane_len_props (
    input clock, `LANE_CFG_PORTS,
    input go, input crc_cmd, input reset,
    input [7:0] pins_s
);
    reg init0 = 1'b1, init1 = 1'b1;
    always @(posedge clock) begin init0 <= 1'b0; init1 <= init0; end
    reg [7:0] pins_q = 8'hFF;
    always @(posedge clock) pins_q <= pins_s;

    wire out, pop, push, done_, crc_ok, sync_hit, error, active, lost, g_tx_bit, g_data_left;
    wire [7:0] push_data; wire [2:0] err_kind;
    wire [15:0] g_cnt; wire [2:0] g_bitpos; wire [7:0] g_byte, g_lim; wire [15:0] g_sr; wire [1:0] g_mode, g_len;
    spex_lane dut (.clock(clock), .clear(init0), `LANE_CFG_CONNECT(1'b1, clk_edge, readback, 1'b1),
        .go(go), .end_(1'b0), .crc_cmd(crc_cmd), .reset(reset), .pins_s(pins_s), .pins_q(pins_q),
        .tx_head(8'hFF), .tx_empty(1'b1), .out(out), .pop(pop), .push(push),
        .push_data(push_data), .done_(done_), .crc_ok(crc_ok), .sync_hit(sync_hit),
        .error(error), .err_kind(err_kind), .active(active), .lost(lost), .g_tx_bit(g_tx_bit),
        .g_data_left(g_data_left), .g_cnt(g_cnt), .g_bitpos(g_bitpos), .g_byte(g_byte),
        .g_mode(g_mode), .g_len_cap(g_len[1]), .g_len_known(g_len[0]), .g_lim(g_lim), .g_sr(g_sr));

    // CSRs written only while the lane is Idle and not in a GO cycle; one command per cycle
    wire idle = !active && !done_;
    reg [$bits(`CFG_BUS)-1:0] cfg_q;
    always @(posedge clock) cfg_q <= `CFG_BUS;
    always @* if (!init0 && !(idle && !go)) assume (`CFG_BUS == cfg_q);
    always @* begin
        assume (clk_pin_en && code == 2'd0 && stuff == 2'd0 && clk_pin != data_pin);
        if (len_en) assume (skip > len_pos);
        assume ($onehot0({go, crc_cmd}));
        if (init0 || init1) assume (!go && !crc_cmd && !reset);
    end

    // the line: a data bit is the data pin at a clock-pin edge (after the synchroniser)
    wire cs = pins_s[clk_pin], cq = pins_q[clk_pin];
    wire cedge = clk_edge ? (cq && !cs) : (cs && !cq);
    wire d = pins_s[data_pin];

    // reference
    reg run_r = 1'b0;               // between GO and reset
    reg [15:0] k = 16'd0;           // data bits received
    reg [3:0] fsr = 4'd0;           // the last 4 data bits, first received in bit 3
    reg [3:0] field = 4'd0; reg known = 1'b0;
    reg [2:0] nb = 3'd0; reg [7:0] rbyte = 8'd0;
    wire [3:0] n = field > len_max ? len_max : field;
    wire [15:0] L = {10'd0, skip} + {9'd0, n, 3'b000};
    wire [15:0] limit = (len_en && known && L < frame_bits) ? L : frame_bits;
    wire take = run_r && cedge && k < limit;
    wire in_bytes = k >= {10'd0, skip};
    wire [7:0] byte_n = lsb_first ? {d, rbyte[7:1]} : {rbyte[6:0], d};
    wire ref_push = take && in_bytes && nb == 3'd7;
    always @(posedge clock)
        if (reset) run_r <= 1'b0;  // reset (stop) after the cycle's command, as ENGINE.md
        else if (go) begin
            run_r <= 1'b1; k <= 16'd0; fsr <= 4'd0; known <= 1'b0; nb <= 3'd0; rbyte <= 8'd0;
        end else if (take) begin
            k <= k + 16'd1;
            fsr <= {fsr[2:0], d};
            if (len_en && k == {10'd0, len_pos}) begin field <= {fsr[2:0], d}; known <= 1'b1; end
            if (in_bytes) begin nb <= nb + 3'd1; rbyte <= byte_n; end
        end

`ifdef L5
`ifndef NO_LEMMAS
    // helper lemmas (assertions too): the lane's counters are the reference's
    always @* if (!init0) begin
        assert (run_r == (active || done_));
        if (active) assert (g_mode == 2'd2);
        if (run_r) assert (k <= limit);
        if (run_r) assert (nb == (in_bytes ? k[2:0] - skip[2:0] : 3'd0));  // bytes start at skip
        if (run_r) assert (known == (len_en && k > {10'd0, len_pos}));     // the field is taken once
    end
    always @* if (!init0 && (active || done_)) begin
        assert (g_cnt == k && g_bitpos == nb);
        if (nb != 3'd0) assert (lsb_first ? (g_byte >> (4'd8 - nb)) == (rbyte >> (4'd8 - nb))
                                          : (g_byte << (4'd8 - nb)) == (rbyte << (4'd8 - nb)));
        // the lane computes the length a cycle after the field (len_cap), the reference at once
        assert (g_len[0] == (len_en && known && L < frame_bits && !g_len[1]));
        if (g_len[1]) assert (len_en && known && k == {10'd0, len_pos} + 16'd1 && !g_len[0]);
        if (g_len[0]) assert (g_lim == L[7:0]);
        // during the data bits the lane's shift register holds the reference's last bits
        if (g_len[1] || k < limit) assert (g_sr[3:0] == fsr);
        assert (!error);
    end
`endif
    always @* if (!init0) begin
        assert (push == ref_push);                        // A: pushes when the reference does
        if (push) assert (push_data == byte_n);           // B: the same byte
        if (done_) assert (k == limit);                   // C: Done only after all data bits
    end
`endif
endmodule
