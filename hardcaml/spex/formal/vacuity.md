# Non-vacuity of the formal properties

`python3 formal/vacuity.py` on `new-arch`, 2026-10-29: each property group must fail on a mutant
that breaks it. Every group except P10/P11 runs with the image-check sweep counter cut to a
free input (`prove.sh`): the sweep may end on any cycle, an over-approximation, so proofs still
hold for the design while counterexamples no longer need the 4097-cycle sweep first (P1 and P7
had been UNDECIDED at 900 s without it). P11 counts the sweep length itself instead of using the
design's `sw_last` (it had missed "the sweep skips the last word"), with a lemma tying its
counter to the design's. P5 (TX FIFO flags) has no mutant yet. P2 is asserted for `pins_oe`
always and for `pins_out` while every pin's source is the engine.

All 11 groups prove unbounded on the unmutated core (`formal/prove.sh`, slowest P6 3 s).

| Mutant | Expected to break | prove.sh result |
|---|---|---|
| edge priority: edge 1 beats edge 0 | P1 (lowest true edge wins) | P1          Output 0 of miter "model" was asserted in frame 17.  Time =     1.13 sec |
| pin changes during entry are lost | P3 (first change and its time are kept) | P3          Output 0 of miter "model" was asserted in frame 9.  Time =     0.13 sec |
| Check role drives the pins | P2 (Check role never drives) | CHECK_ROLE  Output 0 of miter "model" was asserted in frame 10.  Time =     0.26 sec |
| TIMEOUT logged every cycle, not once per visit | P4 (one TIMEOUT per visit) | P4          Output 0 of miter "model" was asserted in frame 17.  Time =     2.79 sec |
| AMBIGUOUS: suppression dropped | P7 (ambiguous input never selects an edge) | P7          Output 1 of miter "model" was asserted in frame 14.  Time =     1.37 sec |
| AMBIGUOUS only when no edge fires | P7 (ambiguous input never selects an edge) | P7          Output 5 of miter "model" was asserted in frame 16.  Time =     3.72 sec |
| AMBIGUOUS: chg_mask left out of the relevant mask | P7 (ambiguous input never selects an edge) | P7          Output 5 of miter "model" was asserted in frame 11.  Time =     1.59 sec |
| store write while running reaches the SRAM | P8 (no host SRAM write while running) | P8          Output 0 of miter "model" was asserted in frame 4.  Time =     0.11 sec |
| recover jumps to the live recover_loc | P9 (recover uses the latched recover_loc) | P9          Output 0 of miter "model" was asserted in frame 11.  Time =     0.14 sec |
| coverage read while running returns SRAM data | P8 (no host SRAM write while running) | P8          Output 2 of miter "model" was asserted in frame 4.  Time =     0.12 sec |
| image_valid set by a crc_expect write | P11 (image_valid only from a matching sweep) | P11         Output 0 of miter "model" was asserted in frame 3.  Time =     0.04 sec |
| the image check sweep skips the last word | P11 (image_valid only from a matching sweep) | P11         Output 0 of miter "model" was asserted in frame 4084.  Time =     8.03 sec |
| start allowed while the image is invalid | P10 (never leaves IDLE while the image is invalid) | P10         Output 0 of miter "model" was asserted in frame 3.  Time =     0.04 sec |
| Verilog: timestamp skips odd values | P6 (timestamp counts) | P6          Output 0 of miter "model" was asserted in frame 3.  Time =     0.01 sec |
