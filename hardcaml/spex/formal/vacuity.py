#!/usr/bin/env python3
"""Non-vacuity check for the formal properties: each property must FAIL on at least
one RTL mutant. Applies a mutant from mutation/mutate.py to src/engine.ml, generates
Verilog into formal/mut/, and runs formal/prove.sh on it.

usage: python3 formal/vacuity.py      (from the repo root, with opam env loaded)
"""
import subprocess, pathlib, sys
sys.path.insert(0, "mutation")
from mutate import MUTANTS

SRC = pathlib.Path("src/engine.ml")
# mutant name -> property it should break
TARGETS = {
    "edge priority: edge 1 beats edge 0": "P1 (lowest true edge wins)",
    "pin changes during entry are lost": "P3 (first change and its time are kept)",
    "Check role drives the pins": "P2 (Check role never drives)",
    "TIMEOUT logged every cycle, not once per visit": "P4 (one TIMEOUT per visit)",
    "AMBIGUOUS: suppression dropped": "P7 (ambiguous input never selects an edge)",
    "AMBIGUOUS only when no edge fires": "P7 (ambiguous input never selects an edge)",
    "AMBIGUOUS: chg_mask left out of the relevant mask": "P7 (ambiguous input never selects an edge)",
}

def main():
    original = SRC.read_text()
    out = pathlib.Path("formal/mut"); out.mkdir(exist_ok=True)
    rows = []
    try:
        for name, old, new in MUTANTS:
            if name not in TARGETS: continue
            SRC.write_text(original.replace(old, new))
            g = subprocess.run(f"dune exec bin/gen.exe -- {out}", shell=True, capture_output=True, text=True)
            if g.returncode != 0:
                rows.append((name, TARGETS[name], "BUILD FAILED")); continue
            p = subprocess.run(f"formal/prove.sh {out.resolve()}/spex_core.v", shell=True, capture_output=True, text=True)
            res = p.stdout.strip().replace("\n", "; ")
            rows.append((name, TARGETS[name], res))
    finally:
        SRC.write_text(original)
    # Verilog-level mutant for P6: the timestamp skips a count when it is odd
    # (the net name of the increment changes with the RTL, so find it: the non-clear
    # branch of ts_reg's always block)
    import re
    v = pathlib.Path("out/spex_core.v").read_text()
    m = re.search(r"else\n\s+ts_reg <= (_\d+);", v)
    if m:
        n = m.group(1)
        (out / "ts_skip.v").write_text(v[:m.start()] + f"else\n            ts_reg <= {n} + {{31'b0, {n}[0]}};" + v[m.end():])
        p = subprocess.run(f"formal/prove.sh {out.resolve()}/ts_skip.v", shell=True, capture_output=True, text=True)
        rows.append(("Verilog: timestamp skips odd values", "P6 (timestamp counts)", p.stdout.strip().replace("\n", "; ")))
    print("| Mutant | Expected to break | prove.sh result |\n|---|---|---|")
    for r in rows: print("| %s | %s | %s |" % r)

if __name__ == "__main__":
    main()
