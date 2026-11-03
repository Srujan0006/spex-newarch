#!/usr/bin/env python3
"""Mutation test for the SPEX RTL.

Each mutant changes one line of the RTL (src/engine.ml, or src/host_spi.ml for the host
port; the reference model is left alone), rebuilds and runs the whole test suite. A mutant is KILLED when any test
fails (a lockstep mismatch or a changed expect output). A SURVIVED mutant is a hole
in the tests, or a change with no visible effect (an equivalent mutant).

usage: python3 mutation/mutate.py        (from the repo root, with opam env loaded)
"""
import subprocess, sys, pathlib

SRC = pathlib.Path("src/engine.ml")
SPI = pathlib.Path("src/host_spi.ml")
LANE = pathlib.Path("src/lane.ml")
SPEC = pathlib.Path("src/spec.ml")

MUTANTS = [
    ("edge priority: edge 1 beats edge 0",
     "mux2 f0 (of_int ~width:2 0) (mux2 f1 (of_int ~width:2 1)",
     "mux2 f1 (of_int ~width:2 1) (mux2 f0 (of_int ~width:2 0)"),
    ("window lower bound exclusive", "(c17 >=: lo_adj |:", "(c17 >: lo_adj |:"),
    ("window upper bound exclusive", "(c17 <=: hi_adj)", "(c17 <: hi_adj)"),
    ("pin changes during entry are lost", "; changed <-- changed_all", "; changed <-- chg_now"),
    ("Check role drives the pins", "(act_en &: drive)\n        [ pout", "(act_en &: (drive |: vdd))\n        [ pout"),
    ("TIMEOUT logged every cycle, not once per visit",
     "&: (ic >: hdr.inv_hi) &: ~:(to_logged.value)", "&: (ic >: hdr.inv_hi)"),
    ("self-loop refetches the record", "~:self_loop\n", "~:(self_loop &: gnd)\n"),
    ("TX shift fills with 0", "concat_msb [ vdd; select tx_sr.value 7 1 ]",
     "concat_msb [ gnd; select tx_sr.value 7 1 ]"),
    ("RX MSB-first shift takes the wrong end", "concat_msb [ select rx_sr.value 6 0; rx_bit ]",
     "concat_msb [ rx_bit; select rx_sr.value 6 0 ]"),
    ("counter load8 loads 7", "of_int ~width:8 7; of_int ~width:8 8 ]", "of_int ~width:8 7; of_int ~width:8 7 ]"),
    ("coverage count wraps instead of saturating", "mux2 sum.:(8) (ones 8) (select sum 7 0)", "select sum 7 0"),
    ("open-drain pin drives high", "pins_oe = poe.value &: ~:(h.open_drain &: pin_val)", "pins_oe = poe.value"),
    ("Stress at_hi fires at lo", "; v_eq e.hi hi_adj\n", "; v_eq e.lo lo_adj\n"),
    ("clocks wrap instead of saturating", "when_ (tick &: (c.value <>:. 0xFFFF)) [ c <-- c.value +:. 1 ]",
     "when_ tick [ c <-- c.value +:. 1 ]"),
    ("one-flop synchroniser", "let pins_s = reg spec sync1 in", "let pins_s = sync1 in"),
    ("change age starts at 0", "(chg_now.:(p) &: ~:(changed.value.:(p)))\n                     [ a <--. 1 ]",
     "(chg_now.:(p) &: ~:(changed.value.:(p)))\n                     [ a <--. 0 ]"),
    ("second-change age starts at 0", "&: ~:(multi.value.:(p)))\n                     [ a <--. 1 ]",
     "&: ~:(multi.value.:(p)))\n                     [ a <--. 0 ]"),
    ("FIFO full one entry early", "let full = used ==:. depth in", "let full = used ==:. depth - 1 in"),
    ("recover jumps to the start location", "cur_loc <-- recover_lat.value", "cur_loc <-- h.start_loc"),
    ("irq_ack ignored", "when_ h.irq_ack [ irq_flag <--. 0 ]", "when_ gnd [ irq_flag <--. 0 ]"),
    ("UNEXPECTED ignores the watch mask", "(changed_all &: hdr.watch <>:. 0)", "(changed_all <>:. 0)"),
    ("data flag inversion ignored", "let dat_ok = mux e.flag flags ^: e.flag_inv in", "let dat_ok = mux e.flag flags in"),
    ("ignore age in windows (entry-time changes judged at the EVAL clock)",
     "let a17 = uresize age_next (clock_bits + 1) in", "let a17 = zero (clock_bits + 1) in"),
    ("no floor at 0 for a clock reset after the change", "|: (e.lo ==:. 0)) &: (c17 <=: hi_adj)",
     "|: gnd) &: (c17 <=: hi_adj)"),
    # AMBIGUOUS (test_ambiguous.ml, formal P7)
    ("AMBIGUOUS: suppression dropped", "fire_of e a &: (e.chg_mask &: multi_eff ==:. 0) &: may_fire)",
     "fire_of e a &: may_fire)"),
    ("AMBIGUOUS only when no edge fires", "  let viol_now = timeout_now |: unexp_now |: amb_now in",
     "  let viol_now = timeout_now |: unexp_now |: (amb_now &: ~:any_fire) in"),
    ("AMBIGUOUS: chg_mask left out of the relevant mask",
     "reduce ~f:( |: ) (hdr.watch :: List.map edges ~f:(fun e -> mux2 e.valid e.chg_mask (zero 8)))",
     "reduce ~f:( |: ) (hdr.watch :: List.map edges ~f:(fun e -> mux2 e.valid (zero 8) (zero 8)))"),
    # host access rules (test_host_access.ml, formal P8 / P9)
    ("store write while running reaches the SRAM", "let store_we = h.rec_we &: in_idle &: ~:(sweeping.value) in",
     "let store_we = h.rec_we &: ~:(sweeping.value) in"),
    ("recover jumps to the live recover_loc", "cur_loc <-- recover_lat.value", "cur_loc <-- h.recover_loc"),
    ("coverage read while running returns SRAM data",
     "; cov_rdata = mux2 (in_idle &: ~:(sweeping.value)) i.ram.cov_rdata (zero 32)",
     "; cov_rdata = mux2 ~:(sweeping.value) i.ram.cov_rdata (zero 32)"),
    ("host_err cause: last cause wins", "[ when_ (err_now &: ~:(host_err.value)) [ host_err <--. 1; host_err_cause <-- err_cause ] ]",
     "[ when_ err_now [ host_err <--. 1; host_err_cause <-- err_cause ] ]"),
    ("stop leaves the lanes running", "; reset = cmd_is Lane_cmd.reset |: h.stop", "; reset = cmd_is Lane_cmd.reset"),
    # image validation (test_image.ml, formal P10 / P11)
    ("image_valid set by a crc_expect write", "when_ (store_we |: h.crc_expect_we) [ image_valid <--. 0 ]",
     "when_ store_we [ image_valid <--. 0 ]; when_ h.crc_expect_we [ image_valid <--. 1 ]"),
    ("the image check sweep skips the last word", "let sw_last = sw_cnt.value ==:. 4096 in", "let sw_last = sw_cnt.value ==:. 4080 in"),
    ("start allowed while the image is invalid", "let start_ok = h.start &: image_valid.value in", "let start_ok = h.start in"),
    ("send_bit drives the inverted bit", "(sresize tx_sr.value.:(0) 8 &: tmask)", "(sresize ~:(tx_sr.value.:(0)) 8 &: tmask)"),
    ("timestamp counter is only 24 bits", 'reg_fb spec ~width:32 ~f:(fun t -> t +:. 1) -- "ts_reg"',
     'reg_fb spec ~width:32 ~f:(fun t -> uresize (select t 23 0 +:. 1) 32) -- "ts_reg"'),
    ("logged timestamp borrow register is only 21 bits", '(x +:. 1) x)\n    -- "ts_hi_m1"',
     '(uresize (select x 20 0 +:. 1) 29) x)\n    -- "ts_hi_m1"'),
]

# bit lanes in the engine (test_lockstep.ml lane push collisions, test_can.ml)
MUTANTS += [
    ("RX FIFO: lane 0 data replaced when the engine waits",
     "rx_push_d <== mux2 l0_push l0_data (mux2 acc1 (dat b1) (dat b2));",
     "rx_push_d <== mux2 (l0_push &: ~:(req b2)) l0_data (mux2 acc1 (dat b1) (dat b2));"),
    ("wait buffer forgets a push that lost", "[ when_ (~:(bv.value) &: n) [ bv <--. 1; bd <-- nd ] ]", "[ ]"),
    ("pin source 'lane 0 AND engine' ignores the engine", "[ e; l0; ~:l0; l0 &: e;", "[ e; l0; ~:l0; l0;"),
    ("prescaler /8 counts every cycle", "; select pre.value 2 0 ==:. 7", "; vdd"),
    ("send_bit edges also command the lanes",
     "lane_cmd <== mux2 (any_fire &: ~:(we.tx_pin_en)) we.tx_pin (zero 3);",
     "lane_cmd <== mux2 any_fire we.tx_pin (zero 3);"),
    ("lane flags read as 0", "    @ lane_flags", "    @ List.map lane_flags ~f:(fun _ -> gnd)"),
    # section 3 and 4 of review-fixes.md (test_tx_collision.ml, test_drops.ml)
    ("tx_collision never set", "[ when_ tx_collision_now [ tx_collision <--. 1 ] ]",
     "[ when_ (tx_collision_now &: gnd) [ tx_collision <--. 1 ] ]"),
    ("drop counter wraps instead of saturating", "when_ (ev &: (c.value <>:. 255))", "when_ ev"),
    ("engine push into a full RX FIFO not counted", "; buf_drop_of 1 |: (acc2 &: rx_full)", "; buf_drop_of 1"),
    ("RX watermark compared with >", "rx_used >=: uresize", "rx_used >: uresize"),
    ("TX watermark ignores its enable", "(h.tx_wm_en &: (tx_used", "(vdd &: (tx_used"),
    # lane formal property L4 (formal/spex_props.sv)
    ("pin source select read from the next pin's field", "(select h.pin_src ((3 * p) + 2) (3 * p))",
     "(select h.pin_src ((3 * ((p + 1) % 8)) + 2) (3 * ((p + 1) % 8)))"),
    ("pin source 'lane 1 AND engine' reads lane 0", "~:l1; l1 &: e ]", "~:l1; l0 &: e ]"),
]

# bit lane (test_lane.ml lockstep and loopback, test_can.ml)
LANE_MUTANTS = [
    ("stuff bit one bit early", "let stuff_due = stuff_on &: (run.value ==: c.stuff_len) in",
     "let stuff_due = stuff_on &: (run.value ==: c.stuff_len -:. 1) in"),
    ("stuff bit not complemented", "mux2 (c.stuff ==:. 1) ~:(last.value) gnd", "mux2 (c.stuff ==:. 1) last.value gnd"),
    ("CRC feedback ignores the bit", "let fb = b ^: crc.value.:(31) in", "let fb = (b &: gnd) ^: crc.value.:(31) in"),
    ("CRC inversion ignored", "let crc_bit = crc.value.:(31) ^: c.crc_inv in", "let crc_bit = crc.value.:(31) in"),
    ("readback never compares", "&: sample &: (d <>: out.value)", "&: sample &: gnd &: (d <>: out.value)"),
    ("lost arbitration and bit error swapped", "mux2 out.value (of_int ~width:3 4) (of_int ~width:3 2)",
     "mux2 out.value (of_int ~width:3 2) (of_int ~width:3 4)"),
    ("RX never resynchronises", "let resync = edge_rx &: (in_armed |: ~:manch) in", "let resync = edge_rx &: in_armed in"),
    ("fractional carry dropped", "[ acc <-- select s 7 0; extra <-- s.:(8) ]", "[ acc <-- select s 7 0 ]"),
    ("RX MSB-first shift takes the wrong end", "(concat_msb [ select byte.value 6 0; rbit ])",
     "(concat_msb [ rbit; select byte.value 6 0 ])"),
    ("END drops the partial byte", "&: (bitpos_after <>:. 0) &: ~:push in", "&: (bitpos_after <>:. 0) &: ~:push &: gnd in"),
    ("NRZI decode inverted", "(d ==: prev.value)", "(d <>: prev.value)"),
    ("a partial RX byte lost at stop is not counted", "i.reset &: ~:(i.end_) &: is_rx", "i.reset &: gnd &: is_rx"),
    ("RX Done before a trailing stuff bit", "&: left_done &: ~:stuff_after in", "&: left_done &: ~:(stuff_after &: gnd) in"),
]

# host SPI port (test/test_spi_host.ml drives it through its pins only)
SPI_MUTANTS = [
    ("SPI samples MOSI on the falling edge", "let rise = active &: sck &: ~:sck_q in",
     "let rise = active &: ~:sck &: sck_q in"),
    ("SPI address does not auto-increment", "; when_ in_data [ addr <-- next_addr ]", "; when_ gnd [ addr <-- next_addr ]"),
    ("location store bytes assembled big-endian", "rec_w <-- concat_msb [ byte; select rec_w.value 127 8 ]",
     "rec_w <-- concat_msb [ select rec_w.value 119 0; byte ]"),
    ("location store beat written on byte 14", "(select a 3 0 ==:. 15)", "(select a 3 0 ==:. 14)"),
    ("STATUS not sent during the command byte", "out_sr <-- status_byte st ]", "out_sr <--. 0 ]"),
    ("RX FIFO popped when its byte is loaded, not when sent",
     "when_ (rd_data &: sp Space.rx) [ rx_pop_p <--. 1 ]",
     "when_ (fall &: (bitn.value ==:. 0) &: in_data &: is_read &: sp Space.rx) [ rx_pop_p <--. 1 ]"),
    # byte 5 is timestamp[31:24]: test_spi_host.ml preloads the timestamp so the two log entries straddle 2^24
    ("violation log popped after byte 4", "(select a 2 0 ==:. 5)) [ vlog_pop_p", "(select a 2 0 ==:. 4)) [ vlog_pop_p"),
    ("coverage write goes to the incremented address", "cov_addr = mux2 cov_we_p.value cov_waddr.value (select a 9 2)",
     "cov_addr = select a 9 2"),
    ("CS_n high does not reset the bit counter", "[ bitn <--. 0; byte_idx <--. 0;", "[ byte_idx <--. 0;"),
    ("CTRL start and stop bits swapped", "[ start_p <-- byte.:(0)\n                ; stop_p <-- byte.:(1)",
     "[ start_p <-- byte.:(1)\n                ; stop_p <-- byte.:(0)"),
    ("vlog byte 5 does not wrap the address", "(concat_msb [ select a 15 3; zero 3 ])", "(a +:. 1)"),
    ("TX FIFO byte pushed without its data", "[ tx_push_p <--. 1; tx_data <-- byte ]", "[ tx_push_p <--. 1 ]"),
    ("drop counters cleared by CTRL bit 4", "drop_clear_p <-- byte.:(5)", "drop_clear_p <-- byte.:(4)"),
    ("drop counter bank aliases the CSRs at 0x00", "      a.:(5)\n      (mux (select a 2 0)", "      gnd\n      (mux (select a 2 0)"),
]

# compiler: TX FIFO collision check (test_tx_collision.ml)
SPEC_MUTANTS = [
    ("compiler ignores END", "        else if c = Lane_cmd.end_ l\n        then a land lnot (bit l)",
     "        else if c = Lane_cmd.end_ l\n        then a"),
    ("compiler ignores the lane done flag", "then a land lnot (bit l) else a)", "then a else a)"),
    ("compiler: recover jumps nowhere", "if l.policy = Policy.recover\n", "if false\n"),
    ("compiler checks an edge's load after its own END", "let a_edge = done_known e.guard a in\n      if a_edge <> 0",
     "let a_edge = done_known e.guard a in\n      if command e a_edge <> 0"),
]


def run(cmd):
    return subprocess.run(cmd, shell=True, capture_output=True, text=True)


def main():
    originals = {f: f.read_text() for f in (SRC, SPI, LANE, SPEC)}
    killed = 0
    rows = []
    try:
        for src, (name, old, new) in (
            [(SRC, m) for m in MUTANTS] + [(LANE, m) for m in LANE_MUTANTS] + [(SPI, m) for m in SPI_MUTANTS]
            + [(SPEC, m) for m in SPEC_MUTANTS]
        ):
            for f, text in originals.items():
                f.write_text(text)
            original = originals[src]
            if original.count(old) != 1:
                rows.append((name, "SKIPPED (pattern not found once)"))
                print(f"SKIPPED   {name}", flush=True)
                continue
            src.write_text(original.replace(old, new))
            if run("dune build 2>&1").returncode != 0:
                rows.append((name, "SKIPPED (does not compile)"))
                continue
            r = run("timeout 900 dune test 2>&1")
            if r.returncode != 0:
                killed += 1
                rows.append((name, "KILLED"))
            else:
                rows.append((name, "SURVIVED"))
            print(f"{rows[-1][1]:9} {name}", flush=True)
    finally:
        for f, text in originals.items():
            f.write_text(text)
        run("dune build 2>&1")
    tried = sum(1 for _, r in rows if r in ("KILLED", "SURVIVED"))
    print(f"\n{killed}/{tried} mutants killed")
    with open("mutation/results.md", "w") as f:
        f.write("| Mutant | Result |\n|---|---|\n")
        for name, r in rows:
            f.write(f"| {name} | {r} |\n")
        f.write(f"\n{killed}/{tried} killed\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
