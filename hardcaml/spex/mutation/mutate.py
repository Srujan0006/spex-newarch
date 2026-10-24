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

MUTANTS = [
    ("edge priority: edge 1 beats edge 0",
     "mux2 f0 (of_int ~width:2 0) (mux2 f1 (of_int ~width:2 1)",
     "mux2 f1 (of_int ~width:2 1) (mux2 f0 (of_int ~width:2 0)"),
    ("window lower bound exclusive", "c >=: e.lo &: (c <=: e.hi)", "c >: e.lo &: (c <=: e.hi)"),
    ("window upper bound exclusive", "c >=: e.lo &: (c <=: e.hi)", "c >=: e.lo &: (c <: e.hi)"),
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
    ("open-drain pin drives high", "pins_oe = poe.value &: ~:(h.open_drain &: pout.value)", "pins_oe = poe.value"),
    ("Stress at_hi fires at lo", "[ vdd; c ==: e.lo; c ==: e.hi;", "[ vdd; c ==: e.lo; c ==: e.lo;"),
    ("clocks wrap instead of saturating", "when_ (c.value <>:. 0xFFFF) [ c <-- c.value +:. 1 ]", "c <-- c.value +:. 1"),
    ("one-flop synchroniser", "let pins_s = reg spec sync1 in", "let pins_s = sync1 in"),
    ("change age starts at 0", "[ a <--. 1 ]", "[ a <--. 0 ]"),
    ("FIFO full one entry early", "let full = used ==:. depth in", "let full = used ==:. depth - 1 in"),
    ("recover jumps to the start location", "cur_loc <-- h.recover_loc", "cur_loc <-- h.start_loc"),
    ("irq_ack ignored", "when_ h.irq_ack [ irq_flag <--. 0 ]", "when_ gnd [ irq_flag <--. 0 ]"),
    ("UNEXPECTED ignores the watch mask", "(changed_all &: hdr.watch <>:. 0)", "(changed_all <>:. 0)"),
    ("data flag inversion ignored", "let dat_ok = mux e.flag flags ^: e.flag_inv in", "let dat_ok = mux e.flag flags in"),
    ("ignore age in windows (entry-time changes judged at the EVAL clock)",
     "(mux2 (c <: age) (zero clock_bits) (c -: age))", "(mux2 (c <: age) c c)"),
    ("send_bit drives the inverted bit", "(sresize tx_sr.value.:(0) 8 &: tmask)", "(sresize ~:(tx_sr.value.:(0)) 8 &: tmask)"),
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
    # equivalent while timestamps are below 2^24: byte 5 is timestamp[31:24], 0 in both entries, so the early
    # pop is invisible; a test would need 16.8 M simulated cycles
    ("violation log popped after byte 4 (equivalent below 2^24 cycles)", "(select a 2 0 ==:. 5)) [ vlog_pop_p", "(select a 2 0 ==:. 4)) [ vlog_pop_p"),
    ("coverage write goes to the incremented address", "cov_addr = mux2 cov_we_p.value cov_waddr.value (select a 9 2)",
     "cov_addr = select a 9 2"),
    ("CS_n high does not reset the bit counter", "[ bitn <--. 0; byte_idx <--. 0;", "[ byte_idx <--. 0;"),
    ("CTRL start and stop bits swapped", "[ start_p <-- byte.:(0); stop_p <-- byte.:(1);",
     "[ start_p <-- byte.:(1); stop_p <-- byte.:(0);"),
    ("vlog byte 5 does not wrap the address", "(concat_msb [ select a 15 3; zero 3 ])", "(a +:. 1)"),
    ("TX FIFO byte pushed without its data", "[ tx_push_p <--. 1; tx_data <-- byte ]", "[ tx_push_p <--. 1 ]"),
]


def run(cmd):
    return subprocess.run(cmd, shell=True, capture_output=True, text=True)


def main():
    originals = {SRC: SRC.read_text(), SPI: SPI.read_text()}
    killed = 0
    rows = []
    try:
        for src, (name, old, new) in [(SRC, m) for m in MUTANTS] + [(SPI, m) for m in SPI_MUTANTS]:
            for f, text in originals.items():
                f.write_text(text)
            original = originals[src]
            if original.count(old) != 1:
                rows.append((name, "SKIPPED (pattern not found once)"))
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
