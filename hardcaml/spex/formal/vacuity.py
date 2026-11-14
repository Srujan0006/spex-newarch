#!/usr/bin/env python3
"""Non-vacuity check for the formal properties: each property must FAIL on at least
one RTL mutant. Applies a mutant from mutation/mutate.py to src/engine.ml or src/lane.ml,
generates Verilog into formal/mut/, and runs formal/prove.sh (core) or
formal/prove_lanes.sh (bit lane, L1-L3) on it.

usage: python3 formal/vacuity.py      (from the repo root, with opam env loaded)
"""
import subprocess, pathlib, sys, re, os
sys.path.insert(0, "mutation")
from mutate import MUTANTS, LANE_MUTANTS

SRC = pathlib.Path("src/engine.ml")
LANE = pathlib.Path("src/lane.ml")
# mutant name -> property it should break
TARGETS = {
    "edge priority: edge 1 beats edge 0": "P1 (lowest true edge wins)",
    "pin changes during entry are lost": "P3 (first change and its time are kept)",
    "Check role drives the pins": "P2 (Check role never drives)",
    "TIMEOUT logged every cycle, not once per visit": "P4 (one TIMEOUT per visit)",
    "AMBIGUOUS: suppression dropped": "P7 (ambiguous input never selects an edge)",
    "store write while running reaches the SRAM": "P8 (no host SRAM write while running)",
    "coverage read while running returns SRAM data": "P8 (no host SRAM write while running)",
    "recover jumps to the live recover_loc": "P9 (recover uses the latched recover_loc)",
    "image_valid set by a crc_expect write": "P11 (image_valid only from a matching sweep)",
    "the image check sweep skips the last word": "P11 (image_valid only from a matching sweep)",
    "start allowed while the image is invalid": "P10 (never leaves IDLE while the image is invalid)",
    "AMBIGUOUS only when no edge fires": "P7 (ambiguous input never selects an edge)",
    "AMBIGUOUS: chg_mask left out of the relevant mask": "P7 (ambiguous input never selects an edge)",
    "pin source select read from the next pin's field": "L4 (a lane drives only the pins selected for it)",
    "pin source 'lane 1 AND engine' reads lane 0": "L4 (a lane drives only the pins selected for it)",
    "rx_to_tx ignored: lane bytes stay in the RX FIFO": "P12 (with rx_to_tx, lane bytes never reach the RX FIFO)",
    "FIFO empty from used's low bits (full reads as empty)": "P5 (TX FIFO never full and empty at once)",
}
# bit-lane mutants (src/lane.ml) -> property
LANE_TARGETS = {
    "stuff bit not complemented": "L1 (no stuff_len + 1 equal bits on the line)",
    "RX MSB-first shift takes the wrong end": "L2 (TX -> RX loopback returns the bytes)",
    "NRZI decode inverted": "L2 (TX -> RX loopback returns the bytes)",
    "CRC inversion ignored": "L3 (the CRC field is the CRC of the data sent)",
    "CRC feedback ignores the bit": "L3 (the CRC field is the CRC of the data sent)",
    "skip one bit short (18 for CAN)": "L5 (RX skip and length field match the reference)",
    "skip one bit long (20 for CAN)": "L5 (RX skip and length field match the reference)",
    "length field read one bit late": "L5 (RX skip and length field match the reference)",
    "len_max ignored": "L5 (RX skip and length field match the reference)",
    "data pin register one cycle late (fed from pins_s)": "L5 (RX skip and length field match the reference)",
    "cq fed from cs's input (no clock edge ever seen)": "L5 (RX skip and length field match the reference)",
    "residual mode: CRC start (len_pos) ignored": "L6 (CRC residual: crc_ok after each byte)",
    "residual compared in the push cycle (byte's last bit not in)": "L6 (CRC residual: crc_ok after each byte)",
    "residual crc_ok sticky (only ever set)": "L6 (CRC residual: crc_ok after each byte)",
    "residual compares the CRC's low half": "L6 (CRC residual: crc_ok after each byte)",
    "sync_hit not suppressed in residual mode": "L6 (CRC residual: crc_ok after each byte)",
    "residual mode: len_en not ignored": "L5 (RX skip and length field match the reference)",
}

def main():
    original = SRC.read_text()
    lane_original = LANE.read_text()
    out = pathlib.Path("formal/mut"); out.mkdir(exist_ok=True)
    rows = []
    try:
        only = os.environ.get("ONLY")
        for name, old, new in MUTANTS:
            if name not in TARGETS or (only and only not in name): continue
            SRC.write_text(original.replace(old, new))
            g = subprocess.run(f"dune exec bin/gen.exe -- {out}", shell=True, capture_output=True, text=True)
            if g.returncode != 0:
                rows.append((name, TARGETS[name], "BUILD FAILED")); continue
            group = re.match(r"([PL]\d+)", TARGETS[name]).group(1)
            group = "CHECK_ROLE" if group == "P2" else group
            p = subprocess.run(f"PROPS={group} formal/prove.sh {out.resolve()}/spex_core.v", shell=True, capture_output=True, text=True)
            res = p.stdout.strip().replace("\n", "; ")
            rows.append((name, TARGETS[name], res))
        SRC.write_text(original)
        lane_original = LANE.read_text()
        for name, old, new in LANE_MUTANTS:
            if name not in LANE_TARGETS or (only and only not in name): continue
            LANE.write_text(lane_original.replace(old, new))
            g = subprocess.run(f"dune exec bin/gen.exe -- {out}", shell=True, capture_output=True, text=True)
            LANE.write_text(lane_original)
            if g.returncode != 0:
                rows.append((name, LANE_TARGETS[name], "BUILD FAILED")); continue
            group = re.match(r"(L\d+)", LANE_TARGETS[name]).group(1)
            # L2, L3: a BMC counterexample to the property itself (lemmas left out)
            bmc = "" if group == "L1" else "BMC=40 "
            p = subprocess.run(f"PROPS={group} {bmc}formal/prove_lanes.sh {out.resolve()}/spex_lane.v", shell=True, capture_output=True, text=True)
            rows.append((name, LANE_TARGETS[name], p.stdout.strip().replace("\n", "; ")))
    finally:
        SRC.write_text(original)
        LANE.write_text(lane_original)
    # Verilog-level mutant for P6: the timestamp skips a count when it is odd
    # (the net name of the increment changes with the RTL, so find it: the non-clear
    # branch of ts_reg's always block)
    v = pathlib.Path("out/spex_core.v").read_text()
    m = re.search(r"else\n\s+ts_reg <= (_\d+);", v)
    if m:
        n = m.group(1)
        (out / "ts_skip.v").write_text(v[:m.start()] + f"else\n            ts_reg <= {n} + {{31'b0, {n}[0]}};" + v[m.end():])
        p = subprocess.run(f"PROPS=P6 formal/prove.sh {out.resolve()}/ts_skip.v", shell=True, capture_output=True, text=True)
        rows.append(("Verilog: timestamp skips odd values", "P6 (timestamp counts)", p.stdout.strip().replace("\n", "; ")))
    print("| Mutant | Expected to break | prove.sh result |\n|---|---|---|")
    for r in rows: print("| %s | %s | %s |" % r)

if __name__ == "__main__":
    main()
