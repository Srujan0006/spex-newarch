# SPEX: a self-checking protocol emulator (submission draft)

*Draft for the Jane Street protocol-emulator ASIC competition, IHP 130 nm, Tiny Tapeout 6x4.
Numbers are from the runs logged in `PROGRESS.md`; items marked TODO are still open.*

## 1. The idea in one paragraph

Most protocol emulators run a program on a small CPU, or hard-wire a list of protocols.
SPEX runs a **spec**: a protocol written as a timed automaton (locations, clocks, guarded
edges). The same spec can be used in three roles. In **Drive** it is the protocol: it
drives the bus as a controller or a target. In **Check** it watches another device on the
bus and logs every violation with an exact cycle timestamp. In **Stress** it drives at
the edges of the spec's own timing windows (earliest, latest or random point) to find
the margins of the device under test. **Cover** (edge counts plus min and max timing per
edge) can be switched on in any role. A new protocol is a new spec loaded over SPI, not
new silicon, which is the flexibility the judges ask for: a protocol nobody named before
tape-out is a spec written after it.

## 2. Architecture

| Block | What it does |
|---|---|
| Location store | 64 locations x 512 bits in two 1P_256x64 SRAM macros (4 beats of 128 bits) |
| Engine | FETCH (5 cycles: 4 SRAM reads, data one cycle behind) then EVAL: 4 edge guards in parallel, lowest true edge wins, its action runs; self-loops cost 0 cycles |
| Guards | pin levels, pin change, a clock window `lo <= c <= hi` on one of 3 16-bit saturating clocks, a data flag (counter zero, TX bit, RX bit, FIFO state, LFSR, I2C address match) |
| Actions | set/release pins, `send_bit` (TX shift register bit to a pin), clock resets, TX load/shift, RX shift (LSB or MSB first)/push, counter ops |
| Checking | per-location watch mask (UNEXPECTED), per-location invariant (TIMEOUT, once per visit), 8-entry violation log `{timestamp 32, loc 6, kind 2, pins 8}`, exact timestamps even for changes seen during FETCH (per-pin 3-bit ages) |
| Coverage | `{count 8, min 12, max 12}` per `{location, edge}` in a 1P_256x32 macro, two-stage read-merge-write pipeline |
| Host port | SPI target (mode 0, SCK up to clk/6): CSRs, location store, coverage, violation log, TX and RX FIFOs, bit-lane configuration |
| Bit lanes | 2 lanes, each with a fractional divider (or a clock pin) with edge resync, NRZ / NRZI / Manchester, bit stuffing (CAN or USB style), CRC up to 32 bits, a 16-bit sync matcher and TX readback (bit error, lost arbitration). Protocol-fixed settings are host CSRs; the record carries only lane commands (in the edge's `tx_pin` field) and 4 flags per lane (data flags 8 to 15). Pin source select per pin (engine, lane, NOT lane, lane AND engine), a per-location clock prescaler (/1, /8, /64, /512) |

Exact cycle-by-cycle semantics are in `ENGINE.md`; the record layout is in `src/layout.ml`
(header 64 bits, 4 edges x 112 bits).

## 3. The spec language and compiler

Specs are written in a small OCaml DSL (`src/spec.ml`): `loc`, `edge`, guards such as
`rises`, `falls`, `pin_hi`, `window`, `at`, `after`, `flag`, and actions such as `set`,
`release`, `send_bit`, `tx`, `rx`, `cnt`, `reset`. The compiler packs each location into a
512-bit record and adds a safety invariant to any location whose edges all have closed
windows on one clock, so a missed window is a TIMEOUT instead of a silent hang.

Example specs in this entry (`src/protocols.ml`): UART TX and RX 8N1 (with jitter for
Stress), SPI controller mode 0, **SPI target modes 0 to 3** (up to 2.22 MHz SCK in
modes 0 and 2, 2.50 MHz in modes 1 and 3, from a 40 MHz engine), I2C controller write with
clock stretching and NACK recovery, and an **I2C target** (write, read, NACK, STOP in the
middle of a byte) at 100 and 400 kHz. An **I2C controller read** spec (ACK all but the last byte, NACK, STOP) passes at 100 and 400 kHz. A **1-Wire controller** (no clock line; every bit is a timing window) was added as an example of a protocol the architecture wasn't designed around. **CAN 2.0A** on the bit lanes: a transmitter (stuffing, CRC-15, arbitration by readback, ACK slot, EOF) and a receiver that ACKs good frames, tested against an independent software CAN node: frames decode both ways, arbitration is lost and won at the right bit, a wrong CRC is not ACKed. TODO: flag SPI target
overspeed as a violation (today it corrupts MISO silently above the limit).

## 4. Results

| Gate | Result |
|---|---|
| Engine area (IHP typ liberty) | 119,951 µm², 1,340 flops (engine only) |
| Chip area (IHP typ liberty: SPI port, engine, 2 bit lanes) | 237,566 µm², 2,418 flops; the lanes add 34.7k µm² each with their CSRs |
| 6x4 harden, latest run (two lanes) | LVS clean, 0 DRC, Tiny Tapeout precheck passes, 59.6 MHz at the slow corner (Gate 2 needs 40 MHz), stdcell 347,539 µm² (65% utilisation). Without the lanes: 69.5 MHz, 53% |
| Magic overlap warnings | all inside the SRAM macro outlines, harmless |

## 5. How it was verified, and what each layer would miss

| Layer | What it shows | What it would miss |
|---|---|---|
| Independent reference model (`src/model.ml`, never calls the RTL) in lockstep on every cycle of every test | RTL = written semantics on every output, every cycle | a bug shared by the model and the semantics doc |
| Protocol tests against software devices (UART, SPI controller and SPI target in all 4 modes, I2C controller and I2C target) | the specs really talk the protocol | protocols or timings not tested |
| 300 random specs x 3,000 cycles in lockstep | corner cases no hand test reaches | long-run effects; timestamps past 2^24 and the 2^32 wrap are covered by a preload test |
| Generated Verilog replayed in Icarus (120,900 cycles, now including the SPI target, I2C target, I2C read and 1-Wire) | the generated netlist matches the Hardcaml simulation | synthesis or layout bugs |
| Mutation testing of the RTL (engine, bit lane, SPI port) | the tests notice real bugs: **56/56 mutants killed**, including two timestamp-width mutants and one that needs a timestamp past 2^24 (reached with the preload) | bugs unlike any mutant |
| Formal proofs (Yosys + ABC PDR, unbounded; SRAM contents, pins and host inputs free, so every possible spec and bus) | the lowest true edge always wins, no pin change is lost (it fires an edge or is UNEXPECTED), Check role never drives, TX FIFO flags consistent, at most one TIMEOUT per visit, timestamp counts; proved on the core with both bit lanes and every lane setting free; 5 of the 6 fail on a matching mutant | properties nobody wrote down; anything outside the core (SRAM macros, host port, pads); no lane-specific properties yet |
| Gate-level replay on the routed netlist | TODO | |

## 6. How AI was used

The architecture, the Hardcaml RTL, the reference model, the spec compiler, the
tests, the mutation and formal harnesses were written with Claude, working from a
written semantics document. The person checked every result on their own machine
(reproduced the tests, the Verilog replay, synthesis and mutation testing) and ran the
hardening in GitHub Actions. Claude was told to keep the reference model independent of
the RTL so that the lockstep tests were not the AI checking its own work against itself.
