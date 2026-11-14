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

L5 (2026-11-04, `lane_len_props`): one RX lane clocked by a pin, NRZ, no stuffing, with
`skip`, `len_en`, `len_pos`, `len_max` and `frame_bits` free (host rule `skip > len_pos`
assumed): a reference written from ENGINE.md counts the data bits, takes the 4-bit field
ending at `len_pos`, forms `limit = skip + 8 min(field, len_max)` when below `frame_bits`,
and assembles bytes from bit `skip` on; the lane pushes exactly when the reference does,
the same byte, and is Done only after `limit` data bits. k-induction, k = 12; its lemmas
read the lane's `g_lim` (length) and `g_sr` (shift register), named for this. Line coding
and destuffing are left to L2. "Skipped bits left out of the CRC" is not an L5 mutant
(L5 says nothing about the CRC; `test_bridge.ml` kills it).

P12 (bridge, 2026-11-03): with `rx_to_tx` held, the RX FIFO takes at most one push more than
the engine made since the bit was set (one engine byte may already wait in its buffer), so no
lane byte reaches it.

All 13 core groups prove unbounded on the unmutated core (`formal/prove.sh`, slowest P6 4.5 s);
L1 (PDR, 31 s), L2, L3 and L5 (k-induction, seconds) prove with `formal/prove_lanes.sh`
(2026-11-04: with `skip` and the length field free on every TX lane).

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
| skip one bit short (18 for CAN) | L5 (RX skip and length field match the reference) | L5          counterexample: Checking assertions in step 17.. Assert failed in lane_len_props: lane_props.sv:378.32-379.34 ($assert$lane_props.sv:378$712) Status: FAILED (run alone, 2026-11-04) |
| skip one bit long (20 for CAN) | L5 (RX skip and length field match the reference) | L5          counterexample: Checking assertions in step 17.. Assert failed in lane_len_props: lane_props.sv:379.32-380.34 ($assert$lane_props.sv:379$710) Status: FAILED (run alone, 2026-11-04) |
| length field read one bit late | L5 (RX skip and length field match the reference) | L5          counterexample: Checking assertions in step 14.. Assert failed in lane_len_props: lane_props.sv:382.19-382.39 ($assert$lane_props.sv:382$714) Status: FAILED (run alone, 2026-11-04) |
| len_max ignored | L5 (RX skip and length field match the reference) | L5          counterexample: Checking assertions in step 19.. Assert failed in lane_len_props: lane_props.sv:379.32-380.34 ($assert$lane_props.sv:379$709) Status: FAILED (run alone, 2026-11-04) |
| RX MSB-first shift takes the wrong end | L2 (TX -> RX loopback returns the bytes) | L2          no counterexample to depth 40 in 900 s; rerun with a 3000 s limit: assertion B (`r_push`: same byte, in order) fails in step 17 (20.6 min). After T1 (lane pin registers, 2026-11-12; L2 assumes sck holds each level >= 2 cycles, so a bit takes >= 4 cycles): no counterexample to depth 40 (995 s); the first RX push needs 8 bits, which no longer fit in 40 steps. Depth-48 rerun (T = 5400 s): hit the time limit at 90 min with no counterexample found (the depth reached is not reported: prove_lanes.sh prints 'no counterexample' on a timeout too), so inconclusive. Killed in simulation (mutation 91/91) |
| NRZI decode inverted | L2 (TX -> RX loopback returns the bytes) | L2          counterexample: Checking assertions in step 5.. Assert failed in lane_loop_props: lane_props.sv:265.59-266.24 ($assert$lane_props.sv:265$597) Status: FAILED |
| Verilog: timestamp skips odd values | P6 (timestamp counts) | P6          Output 0 of miter "model" was asserted in frame 3.  Time =     0.02 sec |
| rx_to_tx ignored: lane bytes stay in the RX FIFO | P12 (with rx_to_tx, lane bytes never reach the RX FIFO) | P12         Output 0 of miter "model" was asserted in frame 13.  Time =     9.56 sec (run alone, 2026-11-03) |
| data pin register one cycle late (fed from pins_s) | L5 (RX skip and length field match the reference) | L5          counterexample: Checking assertions in step 6.. Assert failed in lane_len_props: lane_props.sv:388.19-388.39 Status: FAILED (2026-11-12) |
| cq fed from cs's input (no clock edge ever seen) | L5 (RX skip and length field match the reference) | L5          counterexample: Checking assertions in step 17.. Assert failed in lane_len_props: lane_props.sv:385.32-386.34 Status: FAILED (2026-11-12) |
| dq fed from d's input (no data edge ever seen) | none: data edges matter only with the divider, which no lane proof covers | killed in simulation (test_lane.ml lockstep), mutation 91/91 |
| residual mode: CRC start (len_pos) ignored | L6 (CRC residual: crc_ok after each byte) | L6          counterexample: Checking assertions in step 19.. Assert failed (A, the compare) Status: FAILED (2026-11-14) |
| residual compared in the push cycle (byte's last bit not in) | L6 (CRC residual: crc_ok after each byte) | L6          counterexample: Checking assertions in step 18.. Assert failed (B, crc_ok changes only after a byte) Status: FAILED (2026-11-14; the first run had no result: the mutant leaves `resid_chk` unread, the netlist drops `g_resid_chk`, and the harness connected it; it is now connected only with the lemmas) |
| residual crc_ok sticky (only ever set) | L6 (CRC residual: crc_ok after each byte) | L6          no counterexample to depth 40 (two whole bytes, a match then a mismatch, need more steps); depth-56 rerun: PENDING. Killed in simulation (test_lane.ml lockstep) |
| residual compares the CRC's low half | L6 (CRC residual: crc_ok after each byte) | L6          counterexample: Checking assertions in step 19.. Assert failed (A) Status: FAILED (2026-11-14) |
| sync_hit not suppressed in residual mode | L6 (CRC residual: crc_ok after each byte) | L6          counterexample: Checking assertions in step 4.. Assert failed (C, sync_hit stays 0) Status: FAILED (2026-11-14) |
| residual mode: len_en not ignored | L5 (RX skip and length field match the reference) | L5          counterexample: Checking assertions in step 6.. Assert failed (A, pushes) Status: FAILED (2026-11-14); in simulation first SURVIVED (random lane configs rarely reach a field length), killed after test_usb.ml gained a residual-mode packet with len_en set |
