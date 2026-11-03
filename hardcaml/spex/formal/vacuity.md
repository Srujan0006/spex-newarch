# Non-vacuity of the formal properties

`python3 formal/vacuity.py` on `new-arch`, 2026-11-03: each property group must fail on a mutant
that breaks it. Every core group except P10/P11 runs with the image-check sweep counter cut to a
free input (`prove.sh`): the sweep may end on any cycle, an over-approximation, so proofs still
hold for the design while counterexamples no longer need the 4097-cycle sweep first (P1 and P7
had been UNDECIDED at 900 s without it). P11 counts the sweep length itself instead of using the
design's `sw_last` (it had missed "the sweep skips the last word"), with a lemma tying its
counter to the design's. P5 (TX FIFO flags) has no mutant yet. P2 is asserted for `pins_oe`
always and for `pins_out` while every pin's source is the engine.

Bit lanes (`formal/lane_props.sv`, stated against ENGINE.md on the line a lane drives):
L1 stuffing never leaves more than `stuff_len` equal bits (ones, USB mode); L2 TX -> RX loopback
(one pin clock, any data, stuffing, CRC) returns every byte in order, without a stuff error,
with `crc_ok`; L3 the CRC field a TX lane sends is the CRC of the data bits it sent, computed in
the harness from the line; L4 (core, `prove.sh`) each pin follows the ENGINE.md Pins table with
both lane outputs free, so a pin reads only the lane its source select names. L2 and L3 are
proved by k-induction with helper lemmas (k = 6 and 12); their mutants are checked by BMC on the
properties alone (`-DNO_LEMMAS`, `BMC=40 formal/prove_lanes.sh`), so a mutant must break the
property, not just a lemma.

All 12 core groups prove unbounded on the unmutated core (`formal/prove.sh`, slowest P6 3 s);
L1 (PDR, 13 s), L2 and L3 (k-induction, seconds) prove with `formal/prove_lanes.sh`.

| Mutant | Expected to break | prove.sh result |
|---|---|---|
| edge priority: edge 1 beats edge 0 | P1 (lowest true edge wins) | P1          Output 0 of miter "model" was asserted in frame 9.  Time =     2.19 sec |
| pin changes during entry are lost | P3 (first change and its time are kept) | P3          Output 0 of miter "model" was asserted in frame 9.  Time =     0.19 sec |
| Check role drives the pins | P2 (Check role never drives) | CHECK_ROLE  Output 0 of miter "model" was asserted in frame 10.  Time =     0.33 sec |
| TIMEOUT logged every cycle, not once per visit | P4 (one TIMEOUT per visit) | P4          Output 0 of miter "model" was asserted in frame 17.  Time =     1.65 sec |
| AMBIGUOUS: suppression dropped | P7 (ambiguous input never selects an edge) | P7          Output 1 of miter "model" was asserted in frame 9.  Time =     2.52 sec |
| AMBIGUOUS only when no edge fires | P7 (ambiguous input never selects an edge) | P7          Output 5 of miter "model" was asserted in frame 11.  Time =     5.55 sec |
| AMBIGUOUS: chg_mask left out of the relevant mask | P7 (ambiguous input never selects an edge) | P7          Output 5 of miter "model" was asserted in frame 11.  Time =     1.14 sec |
| store write while running reaches the SRAM | P8 (no host SRAM write while running) | P8          Output 0 of miter "model" was asserted in frame 4.  Time =     0.11 sec |
| recover jumps to the live recover_loc | P9 (recover uses the latched recover_loc) | P9          Output 0 of miter "model" was asserted in frame 11.  Time =     0.14 sec |
| coverage read while running returns SRAM data | P8 (no host SRAM write while running) | P8          Output 2 of miter "model" was asserted in frame 4.  Time =     0.10 sec |
| image_valid set by a crc_expect write | P11 (image_valid only from a matching sweep) | P11         Output 0 of miter "model" was asserted in frame 3.  Time =     0.04 sec |
| the image check sweep skips the last word | P11 (image_valid only from a matching sweep) | P11         Output 0 of miter "model" was asserted in frame 4084.  Time =    18.44 sec |
| start allowed while the image is invalid | P10 (never leaves IDLE while the image is invalid) | P10         Output 0 of miter "model" was asserted in frame 3.  Time =     0.04 sec |
| pin source select read from the next pin's field | L4 (a lane drives only the pins selected for it) | L4          Output 0 of miter "model" was asserted in frame 1.  Time =     0.04 sec |
| pin source 'lane 1 AND engine' reads lane 0 | L4 (a lane drives only the pins selected for it) | L4          Output 0 of miter "model" was asserted in frame 20.  Time =     2.45 sec |
| stuff bit not complemented | L1 (no stuff_len + 1 equal bits on the line) | L1          Output 0 of miter "model_L1" was asserted in frame 6.  Time =     0.92 sec |
| CRC feedback ignores the bit | L3 (the CRC field is the CRC of the data sent) | L3          counterexample: Checking assertions in step 6.. Assert failed in lane_tx_props: lane_props.sv:97.54-97.95 ($assert$lane_props.sv:97$505) Status: FAILED |
| CRC inversion ignored | L3 (the CRC field is the CRC of the data sent) | L3          counterexample: Checking assertions in step 5.. Assert failed in lane_tx_props: lane_props.sv:97.54-97.95 ($assert$lane_props.sv:97$504) Status: FAILED |
| RX MSB-first shift takes the wrong end | L2 (TX -> RX loopback returns the bytes) | L2          no counterexample to depth 40 in 900 s; rerun with a 3000 s limit: assertion B (`r_push`: same byte, in order) fails in step 17 (20.6 min) |
| NRZI decode inverted | L2 (TX -> RX loopback returns the bytes) | L2          counterexample: Checking assertions in step 5.. Assert failed in lane_loop_props: lane_props.sv:265.59-266.24 ($assert$lane_props.sv:265$597) Status: FAILED |
| Verilog: timestamp skips odd values | P6 (timestamp counts) | P6          Output 0 of miter "model" was asserted in frame 3.  Time =     0.02 sec |
