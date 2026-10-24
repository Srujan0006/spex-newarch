"""Where are Magic's "illegal overlap" warnings? Run after the harden, from the repo root (CI step in
.github/workflows/newarch_harden.yaml):

    python3 hardcaml/spex/harden/magic_overlaps.py runs/wokwi

Prints the files under the run that mention the overlaps with a few sample lines, then classifies every box
found in Magic feedback files ("box llx lly urx ury", internal units scaled by the "scale" line) against the
three macro outlines from gen_config.py: inside a macro (Magic extracts the SRAMs as abstract views, so their
internals can overlap the routing blockage without a real error) or in plain logic (worth a look in KLayout).
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from gen_config import SIZE, TILES  # noqa: E402

run = sys.argv[1] if len(sys.argv) > 1 else "runs/wokwi"
macros = []
for inst, m, x, y, _o in TILES:
    w, h = SIZE[m]
    macros.append((inst, x, y, x + w, y + h))

hits = []
for f in sorted(glob.glob(os.path.join(run, "**", "*"), recursive=True)):
    if not os.path.isfile(f) or os.path.getsize(f) > 200_000_000:
        continue
    try:
        text = open(f, errors="replace").read()
    except OSError:
        continue
    if re.search(r"illegal overlap", text, re.I):
        hits.append((f, text))

print(f"files mentioning illegal overlaps: {len(hits)}")
for f, text in hits:
    lines = [l for l in text.splitlines() if re.search(r"overlap", l, re.I)]
    print(f"== {f}: {len(lines)} lines")
    for l in lines[:5]:
        print("   ", l[:200])

boxes = []
for f, text in hits:
    if f.endswith("feedback.txt"):
        print("\nfeedback.txt header:", *text.splitlines()[:4], sep="\n    ")
    scale = None
    m = re.search(r"^scale\s+(\d+)\s+(\d+)(?:\s+([\d.]+))?", text, re.M)
    if m:   # magic feedback: "scale <n> <d> [<nm per lambda>]"; a box unit is n/d lambda
        nm = float(m.group(3)) if m.group(3) else 10.0
        scale = int(m.group(1)) / int(m.group(2)) * nm / 1000.0
    if scale is None:
        continue
    print(f"{os.path.basename(f)}: 1 box unit = {scale} um")
    for b in re.finditer(r"^box\s+(-?\d+)\s+(-?\d+)\s+(-?\d+)\s+(-?\d+)", text, re.M):
        llx, lly, urx, ury = (int(v) * scale for v in b.groups())
        boxes.append((f, (llx + urx) / 2, (lly + ury) / 2))

print(f"\nfeedback boxes: {len(boxes)} (centres in um)")
inside = {name: 0 for name, *_ in macros}
outside = []
for f, cx, cy in boxes:
    where = [n for n, x0, y0, x1, y1 in macros if x0 <= cx <= x1 and y0 <= cy <= y1]
    if where:
        inside[where[0]] += 1
    else:
        outside.append((f, cx, cy))
for n, c in inside.items():
    print(f"inside {n}: {c}")
print(f"outside every macro: {len(outside)}")
for f, cx, cy in outside[:20]:
    print(f"   ({cx:.2f}, {cy:.2f}) from {os.path.basename(f)}")
