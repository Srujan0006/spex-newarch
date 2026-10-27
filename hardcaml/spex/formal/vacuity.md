# Non-vacuity of the formal properties

`python3 formal/vacuity.py` on `new-arch` (engine with the entry-time rule, two bit lanes, pin source select,
prescaler; every lane configuration input free), 2026-10-25. Each property must fail on a mutant that breaks it.
P5 (TX FIFO flags) has no mutant yet. 2026-10-27: P7 (an ambiguous input history never selects a change-triggered edge; one AMBIGUOUS per fetch) fails on all three AMBIGUOUS mutants (suppression dropped, logged only when no edge fires, chg_mask left out of the relevant mask). P2 is asserted for `pins_oe` always and for `pins_out` while every pin's
source is the engine (a lane may drive a pin's value in Check role; it is never enabled).

| Mutant | Expected to break | prove.sh result |
|---|---|---|
| edge priority: edge 1 beats edge 0 | P1 (lowest true edge wins) | general        Output 0 of miter "model" was asserted in frame 15.  Time =     2.81 sec; -DCHECK_ROLE   Output 0 of miter "model" was asserted in frame 13.  Time =     3.47 sec |
| pin changes during entry are lost | P3 (no pin change lost) | general        Output 4 of miter "model" was asserted in frame 7.  Time =     0.17 sec; -DCHECK_ROLE   Output 4 of miter "model" was asserted in frame 7.  Time =     2.09 sec |
| Check role drives the pins | P2 (Check role never drives) | general        Property proved.  Time =     2.81 sec; -DCHECK_ROLE   Output 6 of miter "model" was asserted in frame 8.  Time =     2.18 sec |
| TIMEOUT logged every cycle, not once per visit | P4 (one TIMEOUT per visit) | general        Output 7 of miter "model" was asserted in frame 19.  Time =     2.89 sec; -DCHECK_ROLE   Output 9 of miter "model" was asserted in frame 10.  Time =     4.31 sec |
| Verilog: timestamp skips odd values | P6 (timestamp counts) | general        Output 8 of miter "model" was asserted in frame 3.  Time =     0.20 sec; -DCHECK_ROLE   Output 10 of miter "model" was asserted in frame 3.  Time =     0.32 sec |
