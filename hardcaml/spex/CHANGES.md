# Architecture changes found while building SPEX in Hardcaml

Building the engine for real, with a reference model and protocol tests, turned up
problems in the SPEX v3 draft (`architecture/spex-architecture.html`) and the area
probe (`architecture/area-probe/spex_core.v`). Each change below says what was wrong,
what changed, and how it was found.

## Changes to the engine

| # | Problem in the draft | Change | Found by |
|---|---|---|---|
| 1 | **Entry is 5 cycles, not 4.** The probe sets the SRAM address in a register and reads data the next cycle, so beat 0 got the old address's data. | FETCH has 5 cycles: 4 reads, data one cycle behind. E = 4 is only possible if the next address comes straight from the guard logic, which puts SRAM setup in the critical loop. | Writing the RAM model with the real 1-cycle latency |
| 2 | **No way to put a data bit on a pin.** Edge actions only set constant pin values, so UART TX, SPI MOSI and I2C SDA could not send data without the bit lanes. | New edge action `send_bit pin`: the pin takes `tx_sr[0]`. Uses the 4 spare edge bits. | Writing the UART TX spec |
| 3 | **UNEXPECTED was unusable.** The probe disabled it in Drive role (the engine sees its own pin changes 2 cycles later), checked only `chg_now` (lost changes during entry), and flagged every pin. | Per-location `watch` mask (8 header bits): only changes on watched pins that no edge takes are UNEXPECTED. Changes latched during entry count. Works in every role. Example: I2C watches SDA only while SCL is high. | UART Check test, I2C spec |
| 4 | **Violation timestamps were not exact** when the change arrived during entry: the log showed the cycle EVAL started, up to 5 cycles late. | Each pin keeps a 3-bit age of its latched change; the log subtracts it. The UNEXPECTED timestamp is now the cycle the synchronised change was seen. 24 flops. | UART Check test (was 827, now 825 = glitch edge + 2) |
| 5 | **TIMEOUT flooded the log** under "log and continue": it fired every cycle after the bound. | TIMEOUT is logged once per location visit; any taken edge re-arms it. | Writing the semantics |
| 6 | **Cover was a fourth exclusive role**, so you could not drive a bus and measure it at the same time. | Roles are Drive, Check and Stress. Coverage is a separate `cover_en` switch that works in all of them. | Cover test |
| 7 | **Coverage read-modify-write does not fit a single-port SRAM** at one update per cycle (read and write can't share a cycle). | Two-stage pipeline (read in S1, merge and write in S2). A second fire in the next cycle merges if it is the same edge; a different edge is dropped and sets the sticky `cov_overrun` flag. Never happened in the protocol tests; 2 of 300 random specs. | Mapping coverage onto the 1P_256x32 macro |
| 8 | **A missed timing window hangs the engine silently** (a location whose only edges are "at n" sits forever once the clock passes n). | The compiler adds an invariant (the largest `hi`) to any location whose edges all have closed windows on one clock, so a miss is a TIMEOUT. | A real hang in my first I2C NACK recovery spec |
| 9 | **The recovery location did not fit** in the header. | `recover_loc` is a host CSR. The recovery location must put the bus in a safe state (the I2C spec's `nack` drops SCL before STOP). | I2C NACK test |
| 10 | **Critical path was 78 gate levels** in the first Hardcaml version (probe: 36). Causes: a 32-bit subtract for the timestamp correction, min/max in the coverage stage, FIFO add-subtract counters, all after the guard logic. | Borrow register instead of the 32-bit subtract; coverage min/max moved to S2 (from flops); FIFO counters select precomputed +1/−1. Now 37 levels, same as the probe. | Yosys `ltp` plus a path tracer (`synth/lp.py`) |

## Encoding, frozen as v0.1

`src/layout.ml` is the single source of truth: the RTL, the compiler and the model all
pack and unpack records through it.

- **Header (64 bits):** entry pins (24), clock resets (3), tx/cnt ops (4), invariant
  enable, clock and bound (19), watch mask (8), policy (2), accepting, IRQ on entry,
  2 spare.
- **Edge (112 bits, all used):** guard 63 (pin mask/value/change 24, clock 2, lo/hi 32,
  flag 4 + invert 1), pin action 28 (mask/value/OE 24, send_bit 4), clock resets 3,
  data ops 9, stress mode 2, target 6, valid 1.

The edge has **no spare bits**. The bit-lane controls and the per-location prescaler
from the 24 Oct additions don't fit yet. Options: use the header's 2 spare bits for a
prescaler (÷1, ÷8, ÷64, ÷512); give lane commands their own data-op codes; or widen
the record to 576 bits (still 4.5 beats, so a 5th beat).

## Measurements (this run)

| Item | Value | Basis |
|---|---|---|
| Engine core cells / flops | 8,651 / 1,340 | Yosys 0.33, `synth/mini.lib` (approximate IHP areas) |
| Engine core area | **0.126 mm²** | Same. Includes record flops, 3 FIFOs, 8-entry violation log, coverage pipeline. The probe's 0.059 mm² had none of the log, FIFOs, watch/ages or coverage. |
| Gate 1 (engine ≤ 0.15 mm²) | **passes**, 16% margin | |
| Logic depth | 37 levels (generic 2-input gates) | Probe in the same flow: 36 |
| Whole-chip estimate | ~0.48 mm² (52% of 6x4) still holds | The core now includes the log and FIFOs, which were in the 0.074 host bucket |

## Not done yet

- The host SPI port, CSR file and Tiny Tapeout top (`tt_um_…`).
- The bit lanes (CAN, USB LS, 10BASE-T) and pin source select.
- I2C read transactions, I2C/SPI target specs.
- Formal proofs (SymbiYosys) and TChecker model checks of the specs.
- The real CMOS5L harden (Gate 2: 6x4 routes at ≥ 40 MHz slow corner).

## Credit sprint, 2026-10-24 (cloud, from the shared-folder copy)

This work started from the copy in the project's shared folder, which is older than
commit 50b0353 on `new-arch` (no entry-time fix, no real SPI host port). Merge it onto
`new-arch` by hand; the files are listed in `PROGRESS.md`.

- **SPI target, modes 0 to 3** (`Protocols.spi_target`, `test/test_spi_target.ml`).
  All four modes pass at 1 MHz SCK from a 40 MHz engine, with continuous SCK between
  bytes. **Measured top speed: half period 9 cycles = 2.22 MHz for modes 0 and 2
  (CPHA 0), 8 cycles = 2.50 MHz for modes 1 and 3 (CPHA 1).** The draft guessed 2 to
  3 MHz. The limit is the byte boundary: the spec passes through a second location
  (5-cycle entry) to load the next TX byte and push the received one.
  **Above the limit the failure is not flagged:** at one cycle faster the target still
  receives every MOSI byte correctly, but the first MISO bit of the next byte comes out
  late and the controller reads `da` for `5a`. The "next" location watches SCK, but the
  early edge lands during the following FETCH, where it is latched and taken late
  instead of being UNEXPECTED. Fix options: a per-location "edge seen during FETCH is a
  violation" bit (header has 2 spare bits), or a TX prefetch so no second location is
  needed. GUIDE step 9's "violation, not silent corruption" acceptance is **not met yet**.
  **Met on 2026-11-10, spec only (frozen RTL):** each MISO change resets clock 1, the sampling
  edge needs `after ~clk:1 2` (judged at the edge's arrival, the entry-time fix) and "xfer"
  watches SCK, so one cycle above top speed is UNEXPECTED in all four modes; top speed is
  unchanged (`test/test_spi_target.ml`).
- **I2C target** (`Protocols.i2c_target`, `test/test_i2c_target.ml`): write, read
  (until NACK), address mismatch (NACK, ignored), STOP in the middle of a data byte
  (clean recovery: the partial byte is dropped, the next transaction works). Passes at
  100 kHz and 400 kHz. No clock stretching by the target.
- **I2C controller read** (`Protocols.i2c_controller_read`, `test/test_i2c_read.ml`): the
  first TX FIFO byte is the address byte with R = 1, each further TX FIFO byte asks for
  one more byte; ACKs all but the last, NACKs the last, STOP. Reuses the write spec's
  START, address and ACK locations. Passes at 100 and 400 kHz.
- **Timestamps past 2^24**: `Harness.preload_timestamp` sets the timestamp register and
  the borrow register (`ts_reg`, `ts_hi_m1`, now named in the RTL) and the model
  together; `test/test_timestamp.ml` logs 8 glitches at every phase of the low 3 bits
  across 2^24 and across the 2^32 wrap. Two new mutants (24-bit timestamp counter,
  21-bit borrow register) are added to `mutation/mutate.py`.
- **Formal** (`formal/`): properties on the generated `spex_core.v` with the SRAM read
  data, pins and every host input free (so every possible spec and bus). Proved
  **unbounded** with ABC PDR through Yosys (`formal/prove.sh`): Check role never changes
  `pins_out`/`pins_oe`; TX FIFO never full and empty at once; at most one TIMEOUT per
  location visit; the timestamp counts every cycle. `formal/vacuity.py` checks that each
  property fails on a mutant.
- **Formal, round 2:** GUIDE properties 1 and 3 added, using internal signals named
  `f_*` in `engine.ml` (no logic change) and made ports with Yosys `expose`.
  P1: whenever a guard is true in EVAL, the winner is the lowest-index true edge, and
  `taken`/`taken_edge` report it the next cycle. P3: a pin change seen during FETCH is
  still in `changed_all` on the first EVAL cycle, and in EVAL a change on a watched pin
  either fires an edge or is UNEXPECTED. **All six properties are proved unbounded.**
  Non-vacuity (`formal/vacuity.md`): P1 fails on the edge-priority mutant, P3 on the
  lost-changes mutant, P2, P4 and P6 on theirs; P5 (TX FIFO flags) has no mutant yet (added 2026-11-14: "FIFO empty from used's low bits", see PROGRESS).
  Found while writing P3: **a `start` pulse while the engine is running restarts it
  and drops the changes latched so far.** That is reasonable, but ENGINE.md doesn't say
  it; now noted in ENGINE.md.
- **SPI target overspeed, why it can't be flagged on this copy:** an early SCK edge
  that lands during FETCH is latched and fires late, and a clock window is judged
  at the fire time, so no guard can tell it came early. On `new-arch`, with the
  entry-time fix (windows judged at the change's age), the fix is a clock-1 reset in
  the "next"/"first" actions plus `window ~clk:1 2 max` on the leading-edge guard in
  "xfer" and `~watch:(bit sck)` on "xfer": an early edge then fails its window, no
  edge takes it, and it is UNEXPECTED.
- **1-Wire controller** (`Protocols.onewire_controller`, `test/test_onewire.ml`): a
  protocol with no clock line, where every bit is a timing window. Reset pulse,
  presence check (no device = TIMEOUT, then the spec retries), write slots LSB first,
  one read byte. Against a software device: writes 0x33 (Read ROM) and reads 0x28 (the
  DS18B20 family code). Written in about 10 minutes as an example of a protocol the
  architecture was not designed around.
