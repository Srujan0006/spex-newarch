# SPEX: a self-checking protocol emulator (submission draft)

*Draft for the Jane Street protocol-emulator ASIC competition, IHP SG13CMOS5L, Tiny Tapeout
8x4. Numbers are from the runs logged in `PROGRESS.md` (updated 2026-11-14, harden run 8);
each names the command or run that produced it.*

## 1. The idea in one paragraph

Most protocol emulators run a program on a small CPU, or hard-wire a list of protocols.
SPEX runs a **spec**: a protocol written as a timed automaton (locations, clocks, guarded
edges). The same spec is used in four roles. In **Drive** it is the protocol: it drives
the bus as a controller or a target. In **Check** it watches another device on the bus and
logs every violation with an exact cycle timestamp. In **Stress** it drives at the edges
of the spec's own timing windows (earliest point, latest point, or a random point drawn
with probability 1/16 per eligible cycle and forced at the latest, so earlier points are
more likely) to find the margins of the device under test. **Cover** (edge counts plus min
and max timing per edge) can be switched on in any role. A new protocol is a new spec
loaded over SPI, not new silicon: a protocol nobody named before tape-out is a spec
written after it.

## 2. Architecture

| Block | What it does |
|---|---|
| Location store | 64 locations x 512 bits in two 1P_256x64 SRAM macros (4 beats of 128 bits) |
| Engine | FETCH (5 cycles: 4 SRAM reads, data one cycle behind) then EVAL: 4 edge guards in parallel, lowest true edge wins, its action runs; self-loops cost 0 cycles |
| Guards | pin levels, pin change, a clock window `lo <= c <= hi` on one of 3 16-bit saturating clocks, a data flag (counter zero, TX bit, RX bit, FIFO state, LFSR, I2C address match, 4 flags per bit lane) |
| Actions | set/release pins, `send_bit` (TX shift register bit to a pin), clock resets, TX load/shift, RX shift (LSB or MSB first)/push, counter ops, lane commands |
| Checking | per-location watch mask (UNEXPECTED), per-location invariant (TIMEOUT, once per visit), 8-entry violation log `{timestamp 32, loc 6, kind 2, pins 8}`, exact timestamps even for changes seen during FETCH (per-pin 3-bit ages) |
| Coverage | `{count 8, min 12, max 12}` per `{location, edge}` in a 1P_256x32 macro, two-stage read-merge-write pipeline |
| Host port | SPI target (mode 0, SCK up to clk/6): CSRs, location store, coverage, violation log, TX and RX FIFOs (32 bytes each), bit-lane configuration; RX and TX watermark interrupts |
| Bit lanes | 2 lanes, each with a fractional divider (or a clock pin) with edge resync, NRZ / NRZI / Manchester, bit stuffing (CAN or USB style), CRC up to 32 bits (or a CRC residual check, as USB's), a 16-bit sync matcher, a header skip and a length field (CAN DLC), and TX readback (bit error, lost arbitration). Protocol-fixed settings are host CSRs; the record carries only lane commands (in the edge's `tx_pin` field) and 4 flags per lane. Pin source select per pin (engine, lane, NOT lane, lane AND engine), a lane-to-TX bridge (CAN to UART), a per-location clock prescaler (/1, /8, /64, /512) |

Exact cycle-by-cycle semantics are in `ENGINE.md`; the record layout is in `src/layout.ml`
(header 64 bits, 4 edges x 112 bits).

## 3. The spec language and the specs

Specs are written in a small OCaml DSL (`src/spec.ml`): `loc`, `edge`, guards such as
`rises`, `falls`, `pin_hi`, `window`, `at`, `after`, `flag`, and actions such as `set`,
`release`, `send_bit`, `tx`, `rx`, `cnt`, `reset`. The compiler packs each location into a
512-bit record and adds a safety invariant to any location whose edges all have closed
windows on one clock, so a missed window is a TIMEOUT instead of a silent hang.

Specs in this entry (`src/protocols.ml`), each tested against a software device written
from the protocol's standard, not from the spec:

- UART TX and RX 8N1 (with jitter for Stress); SPI controller mode 0.
- **SPI target, modes 0 to 3**: up to 5.00 MHz SCK in modes 0 and 2 and 4.00 MHz in modes
  1 and 3 from a 40 MHz engine [Measured: test_spi_target.ml]. Overspeed is a violation
  (UNEXPECTED or AMBIGUOUS) at every faster half period, never silently wrong data. The
  rule the spec checks: the controller's sampling edge must come at least 3 engine cycles
  after MISO changes; with an uneven SCK duty cycle the phase from the MISO-changing edge
  to the sampling edge must be at least 4 cycles, and every shorter phase is a violation in
  every mode [Measured: test_spi_target.ml, uneven duty sweep].
- **I2C target** (write, read, NACK, STOP in the middle of a byte) at 100 and 400 kHz,
  with **clock stretching**: it holds SCL low while its RX FIFO is full or its TX FIFO is
  empty, and releases with at least 13 cycles of data setup [Measured: test_i2c_target.ml].
  I2C controller write (clock stretching, NACK recovery) and read.
- **1-Wire controller** (no clock line; every bit is a timing window).
- **CAN 2.0A** on the bit lanes: a transmitter (stuffing, CRC-15, arbitration by readback,
  ACK slot, EOF) and a receiver that ACKs good frames and takes the frame length from the
  DLC, against an independent software CAN node; a **CAN to UART bridge**.
- **USB low-speed**: a transmitter, against a decoder written from USB 2.0 (NRZI,
  stuffing, CRC-16/USB), and a receiver monitor (SYNC, NRZI, bit stuffing, the CRC-16
  residual check, EOP) against a USB LS transmitter written from the standard: DATA0/DATA1
  with 0 to 8 bytes at +-1.5 % rate pass; a flipped data or CRC bit is a CRC error
  [Measured: test_usb.ml].

## 4. Results

| Gate | Result |
|---|---|
| Core area (IHP typ liberty: SPI port, engine, 2 bit lanes) | 250,396 µm² [Measured: synth/ihp/ihp_typ.ys, 2026-11-14] |
| 8x4 harden, run 8 (43588146778) | LVS clean, 0 routing DRC, Tiny Tapeout precheck 9/9, no setup / hold / slew / cap violations; **56.0 / 88.4 / 134.1 MHz** at the slow / typ / fast corner (worst hold +0.550 / +0.283 / +0.096 ns); utilisation 0.463; 30,723 standard cells (431,025 µm²), 3,157 flops, 3 SRAM macros (235,850 µm²) |
| Magic overlap warnings | 228, all inside the SRAM macro outlines, harmless (LVS passes) |

## 5. How it was verified, and what each layer would miss

| Layer | What it shows | What it would miss |
|---|---|---|
| Independent reference model (`src/model.ml`, never calls the RTL) in lockstep on every cycle of every test | RTL = written semantics on every output, every cycle | a bug shared by the model and the semantics doc |
| Protocol tests against software devices written from the standards (UART, SPI both sides in all 4 modes, I2C both sides with stretching, CAN, USB LS) | the specs really talk the protocol | protocols or timings not tested |
| Random specs in lockstep (300 specs x 3,000 cycles) | corner cases no hand test reaches | long-run effects; timestamps past 2^24 and the 2^32 wrap are covered by a preload test |
| Generated Verilog replayed in Icarus: 349,251 cycles on the core, 101,252 through the chip's pins with the IHP SRAM models | the generated netlist matches the Hardcaml simulation | synthesis or layout bugs |
| Mutation testing of the RTL (engine, bit lanes, SPI port, compiler) | the tests notice real bugs: **99/99 mutants killed** [Measured: mutation/mutate.py, 2026-11-14] | bugs unlike any mutant |
| Formal proofs on the RTL (Yosys; ABC PDR on the core, k-induction on the lanes; SRAM contents, pins and host inputs free, so every possible spec and bus). Core: lowest true edge wins, no pin change lost, Check role never drives, FIFO flags consistent, one TIMEOUT per visit, timestamp counts, ambiguous input never selects an edge, no host SRAM write while running, recover uses the latched location, image valid only after a matching CRC sweep, no start with an invalid image, the CAN-to-UART bridge, a lane drives only its pins. Lanes: stuffing never shows stuff_len + 1 equal bits, TX to RX loopback returns the bytes, the CRC field is the CRC of the data, RX skip and length field (NRZ and NRZI, both stuffing modes), CRC residual check | the properties hold for every input | properties nobody wrote down; the SRAM macros, pads and clock tree |
| Non-vacuity: every property fails on at least one planted RTL mutant (`formal/vacuity.py`) | the proofs are not vacuous | |
| Gate-level replay of the routed netlist (101,252 cycles through the pins, zero delay) | the routed netlist matches the Hardcaml simulation; a corrupted vector gives FAIL | timing |
| Delay-annotated replay of the routed netlist (cell, SRAM and wire delays from OpenSTA on the routed SPEF, one delay per cell output; `synth/sdf_replay.sh`) | PASS at the slow corner at 55 and 59.6 MHz and at the fast corner with minimum delays (clock skew, the hold side); at 100 MHz it fails (the planted bug) | the setup limit: the vectors pass down to an 11 ns period while STA's worst slow path is about 17.5 ns, so they do not exercise it; STA signs off setup |

Not done: the new_arch specs have not been model-checked with TChecker (the v1 Python
specs were, 28/28).

## 6. How AI was used

The architecture, the Hardcaml RTL, the reference model, the spec compiler, the
tests, the mutation and formal harnesses were written with Claude, working from a
written semantics document. The person checked every result on their own machine
(reproduced the tests, the Verilog replay, synthesis and mutation testing) and ran the
hardening in GitHub Actions. Claude was told to keep the reference model independent of
the RTL so that the lockstep tests were not the AI checking its own work against itself.
