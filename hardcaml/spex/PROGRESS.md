# Progress log

| Date | Step | Result |
|---|---|---|
| 2026-10-24 | Build SPEX v0.1 in Hardcaml (cloud session) | Engine, spec compiler, reference model, UART/SPI/I2C specs |
| 2026-10-24 | A2 tests | All expect tests pass; every test in lockstep with the model; 300 random specs x 3,000 cycles, no mismatch |
| 2026-10-24 | A4 Verilog replay | PASS on 89,015 cycles (Icarus 12) |
| 2026-10-24 | A5 synthesis | 0.126 mm², 8,651 cells, 1,340 DFF, depth 37 (Yosys 0.33, mini.lib) |
| 2026-10-24 | A6 mutation | 22/22 killed (first pass 19/20; clock-saturation test added) |
| 2026-10-24 | A1 tools (srujan's WSL) | opam 2.1.5, OCaml 5.2.1 switch `spex`, hardcaml v0.17.0; Icarus Verilog 12.0; Yosys 0.33 |
| 2026-10-24 | A2 tests (srujan's WSL) | `dune build` OK; `dune test` silent, exit 0, 13 s; 13 expect tests; model.ml does not call engine.ml (one mention, in a comment) |
| 2026-10-24 | A3 waveform | cur_loc 0 → 1 → 2 → 0; in_entry 5 cycles per location change; no entry inside the data self-loop; TX shows start, 0xA5 LSB first, stop |
| 2026-10-24 | A4 Verilog replay (srujan's WSL) | PASS on 89,015 cycles; one corrupted vector gives FAIL: 1 mismatches |
| 2026-10-24 | A5 synthesis (srujan's WSL) | 126,252 µm², 1,340 DFF, depth 37 (Yosys 0.33, mini.lib): matches |
| 2026-10-24 | A6 mutation (srujan's WSL) | 22/22 killed, 2 min 14 s |
| 2026-10-24 | IHP liberty synthesis | **119,951 µm², 1,340 DFF** on sg13cmos5l_stdcell_typ_1p20V_25C.lib (yowasp-yosys 0.70, `synth -flatten; dfflibmap; abc; stat`, the SPEX v1 probes' script): `synth/ihp/ihp_typ.ys` |
| 2026-10-24 | 6x4 harden (private repo, run 40077932994) | **Routes: 0 violations, 0 max-cap, 0 max-slew, hold met. Worst setup slack at 20.8 ns: +6.952 slow / +12.013 typ / +14.161 fast ns = 72.2 / 113.8 / 150.6 MHz.** Utilisation 0.436. LVS, Magic and precheck not run |
| 2026-10-24 | 6x4 sign-off (private repo, run 40079086558) | **LVS clean (0 errors), precheck passed (all checks), 0 DRC, 0 antenna, IR drop 0.10 mV**; timing unchanged; stdcell 222,796 µm², utilisation 0.508; Magic warns 222 illegal overlaps (not a failure, cause unchecked) |
| 2026-10-24 | Entry-time pin events | ENGINE.md: a pin change is judged against the clocks as they were when it was seen; RTL and model changed separately; test_entry.ml; compiler warning for change windows under 6 cycles in entered locations |
| 2026-10-24 | Host SPI port (step 10) | host_spi.ml + chip.ml replace the scan chain; OCaml host model loads the UART spec, starts it and pushes bytes through SPI only; bytes decode on uio[0]. Reads need SCK <= clk/6 |
| 2026-10-24 | 6x4 re-harden with SPI (run 40084954695) | Routes, LVS clean, precheck passed, but +1.278 ns slow (51 MHz): the clock - age subtract in the guards (depth 37 -> 61) |
| 2026-10-24 | Registered age adjustment (run 40089963463) | lo + age, hi + age registered the cycle before; depth 43. **Routes, LVS clean, precheck 9/9, +6.402 / +11.635 / +13.582 ns = 69.5 / 109.1 / 138.5 MHz**, stdcell 245,557 um^2 |
| 2026-10-24 | Magic overlaps | 222 obsm4/metal4 overlaps, all wholly inside the macro outlines (88 / 88 / 46): benign |
| 2026-10-24 | Credit sprint (cloud, from the shared-folder copy, not `new-arch`) | Toolchain rebuilt from git sources (OCaml 5.2.1, Hardcaml v0.17.0) |
| 2026-10-24 | Step 9 SPI target | Modes 0 to 3 pass at 1 MHz SCK (40 MHz engine); top speed 2.22 MHz (CPHA 0) / 2.50 MHz (CPHA 1); above the limit MISO is corrupted **without** a violation (acceptance not met, see CHANGES.md) |
| 2026-10-24 | Step 8 I2C target | Write, read until NACK, address mismatch, STOP mid-byte (clean recovery): pass at 100 and 400 kHz |
| 2026-10-24 | Timestamp past 2^24 | Preload test across 2^24 and the 2^32 wrap, 8 glitches at every low-bit phase, lockstep holds |
| 2026-10-24 | A2 tests | `dune test` silent, exit 0, all in lockstep |
| 2026-10-24 | Step 8 I2C controller read | `Protocols.i2c_controller_read`: reads N bytes (one TX FIFO byte per byte to read), ACK all but the last, NACK + STOP; passes at 100 and 400 kHz against a software target |
| 2026-10-24 | A4 Verilog replay | PASS on 100,857 cycles (Icarus 12, now with SPI target modes 0-3, I2C target and I2C controller read) |
| 2026-10-24 | A6 mutation | **24/24 killed** (22 + 2 new: 24-bit timestamp counter, 21-bit borrow register), 2 min 25 s |
| 2026-10-24 | Step 12 formal (part) | Yosys 0.33 + ABC PDR, unbounded, all inputs and SRAM data free: Check role never drives, TX FIFO flags, one TIMEOUT per visit, timestamp counts: **all proved**. Non-vacuity: P2, P4, P6 fail on a matching mutant (`formal/vacuity.md`); P5 not shown. Properties 1 and 3 not written |
| 2026-10-24 | Step 14 write-up | First draft: `docs/submission-draft.md` |
| 2026-10-24 | Step 12 formal (round 2) | Properties 1 (lowest true edge wins) and 3 (no pin change lost) added: **all 6 properties proved unbounded** (ABC PDR). Non-vacuity: P1, P2, P3, P4, P6 each fail on a matching mutant. Found: `start` while running restarts and drops latched changes (document in ENGINE.md) |
| 2026-10-24 | Re-run after naming formal signals | `dune test` silent; Verilog replay PASS on 100,857 cycles; mutation 24/24 killed |
| 2026-10-24 | 1-Wire controller (new protocol) | Reset, presence, write 0x33, read 0x28 against a software device; no device gives TIMEOUT in `rst_wait` and a retry. Verilog replay PASS on 120,900 cycles; mutation 24/24 |
| 2026-10-24 | Bit lanes (step 11) | ENGINE.md lane semantics; `lane.ml` (RTL) and `lane_model.ml` (model) separately; lane lockstep 400 configs x 3000 cycles; TX -> RX loopback for NRZ, CAN stuffing, NRZI + USB stuffing, Manchester with CRC ok. One lane 19,504 µm² + CSRs |
| 2026-10-24 | Lanes in the engine | commands, flags 8..15, pin source select, prescaler, RX FIFO priority with wait buffers; random lockstep draws them; a directed test makes lane and engine pushes collide |
| 2026-10-24 | CAN 2.0A | `can_tx` / `can_rx` against an independent software CAN node: frames decode both ways, arbitration lost (0x122) and won (0x124), wrong CRC not ACKed; CAN TX configured through SPI only |
| 2026-10-24 | 6x4 harden, two lanes (run 40108049347) | Signs off (0 DRC, LVS clean, precheck 9/9, hold met) at +3.299 ns slow = 57.1 MHz, utilisation 0.639: depth 43 -> 65 (lane bit-timing adders on the path) |
| 2026-10-24 | Lane timing fix (run 40117848780) | Derived lane constants registered, parallel compares: depth 45. **0 DRC, LVS clean, precheck 9/9, hold met, +4.016 / +10.171 / +12.757 ns = 59.6 / 94.1 / 124.3 MHz**, stdcell 347,539 µm², utilisation 0.646 |
| 2026-10-25 | Sprint merged onto `new-arch` | sprint.patch applied (CHANGES, PROGRESS, mutate.py by hand); all tests pass in lockstep with the new-arch model; **all 6 formal properties proved unbounded on the core with both lanes** (lane settings free; P2 asserts pins_oe always, pins_out while the pin source is the engine); P1-P4, P6 non-vacuous; the log-pop mutant is now killed (timestamp preload across 2^24 in the SPI test); **mutation 56/56** |
| 2026-10-25 | Owner decision: keep two lanes | 59.6 MHz slow (~50 % above the 40 MHz gate) and 65 % utilisation signed off; two lanes allow two framed streams at once (CAN-UART bridge, both directions of a link, drive one bus while checking another) |
| 2026-10-27 | Review fix 1: AMBIGUOUS | `multi` bit and second-change age per pin; a relevant pin that changed twice before EVAL suppresses the edges waiting on it and logs AMBIGUOUS (kind 0, log stays 48 bits); AMBIGUOUS wins, a losing TIMEOUT is deferred. RTL, model, ENGINE.md; test_ambiguous.ml (every beat pair x watch / chg_mask / neither / watch + firing edge x halt / continue / recover, UART glitch in entry, deferred TIMEOUT); P3 renamed, P7 proved and non-vacuous on 3 mutants; mutation 60/60 |
