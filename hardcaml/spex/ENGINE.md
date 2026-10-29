# SPEX engine semantics (v0.1)

This is the behaviour both the RTL (`src/engine.ml`) and the reference model
(`src/model.ml`) implement. If the two disagree on any output on any cycle, the
test harness stops with the cycle number and both output sets.

## State

| State | Width | Notes |
|---|---|---|
| `sync1`, `pins_s`, `pins_q` | 8 each | 2-flop synchroniser, then the previous value for change detection |
| phase | IDLE, FETCH(beat 0..4), EVAL | |
| `cur_loc` | 6 | current location |
| role | 2 | latched at start: 0 Drive, 1 Check, 2 Stress |
| active record | 512 | 4 beat registers of 128 bits |
| `changed` | 8 | pin changes latched during FETCH |
| change ages | 8 x 3 | how long ago each latched change was seen |
| clocks c0, c1, c2 | 3 x 16 | saturate at 0xFFFF |
| timestamp | 32 | free running from reset |
| `pout`, `poe` | 8 each | pin output value and enable registers |
| `tx_sr`, `rx_sr`, `cnt` | 8 each | data path |
| LFSR | 16 | reset value 0xACE1, taps 16, 14, 13, 11 |
| TX FIFO, RX FIFO | 8 x 8 | |
| violation log | 8 x 48 | `{timestamp 32, loc 6, kind 2, pins 8}`; kind 0 AMBIGUOUS, 1 UNEXPECTED, 2 TIMEOUT, 3 both |
| coverage | 256 x 32 SRAM | `{count 8, min 12, max 12}` per `{loc, edge}` |

## Each cycle

Let `chg_now = pins_s xor pins_q` and `changed_all = changed | chg_now`. Each latched
change keeps its age: 1 in the cycle after it was seen, +1 per cycle (saturating at 7);
in the first EVAL cycle the age is the number of cycles since it was seen.

**FETCH beat b** (b = 0..4). For b < 4 the location store is read at
`{cur_loc, b}`. The word read in beat b arrives in beat b + 1 and is stored as record
beat b. `changed` accumulates `changed_all`. On beat 4 the **entry action** runs (from
the header, which arrived in beat 1) and the phase becomes EVAL. Entry therefore
takes 5 cycles in which no edge can fire.

**EVAL.** For each edge k = 0..3:

```
fire_k = valid
       & ((pins_s xor pin_val) & pin_mask) == 0          pin levels
       & (chg_mask == 0 | (changed_all & chg_mask) != 0)  pin change
       & lo <= v_k <= hi                                   timing window
       & flag[flag_sel] xor flag_inv                       data flag
       & stress_ok                                         Stress role only
```

**A pin change is judged against the clocks as they were when it was seen.** A change
seen during FETCH waits up to 5 cycles for the first EVAL cycle; its edge must not be
judged against the clock of that later cycle. So `v_k`, the clock value edge k is judged
with, is:

- `clock[clk]` if the edge has `chg_mask == 0`, or if the clock is saturated (0xFFFF);
- otherwise `max(clock[clk] − a, 0)`, where `a` is the largest age among the latched
  changes on the edge's `chg_mask` pins (the earliest change, the one that would have
  fired the edge first), and 0 if only `chg_now` pins match. The floor at 0 covers a clock
  the entry action reset after the change was seen: the change counts as seen at the
  reset.

The same `v_k` is used by the Stress tests (`v_k == lo`, `v_k == hi`) and is the value
coverage records for a taken edge. The age is at most 5 in practice (3 bits, saturating
at 7), so this is a 3-bit subtract per edge.

The lowest k with `fire_k` wins. If an edge wins, its action runs. If its target is
the current location it is an internal transition: no fetch, no entry action, and
evaluation continues next cycle. Otherwise the phase becomes FETCH(0) at the target.

If a relevant pin is ambiguous (see Pins: it changed more than once before EVAL):

- **AMBIGUOUS** (kind 0), whether or not an edge fires; edges whose `chg_mask` includes
  such a pin cannot fire, and unless the policy is continue no edge fires this cycle.

If no edge fires:

- **UNEXPECTED** (kind 1) if `changed_all & watch != 0`;
- **TIMEOUT** (kind 2) if the invariant is enabled, `clock[inv_clk] > inv_hi`, and no
  TIMEOUT has been logged in this visit. Any taken edge re-arms it. Both: kind 3.

One entry is logged per cycle. AMBIGUOUS wins over UNEXPECTED and TIMEOUT in that cycle;
a TIMEOUT that loses is **deferred, not dropped** (`to_logged` stays clear, so under
continue it is logged on the next EVAL cycle if no edge fires; under halt or recover the
visit ends anyway). Kind 0 is free because an empty cycle never logs; hosts read entries
only while `vlog_empty = 0`. A violation is pushed into the log and pulses `viol` the
next cycle. Then the
policy: 0 halt (IDLE, `halted_viol` set), 1 continue, 2 jump to the host's
`recover_loc` (with a fetch), 3 halt. `changed` and the ages are cleared in every
EVAL cycle.

The timestamp logged for UNEXPECTED is the cycle the synchronised change was first
seen (`pins_s` changed), even when it was seen during FETCH. For TIMEOUT it is the
cycle it is logged: the first EVAL cycle with the clock past `inv_hi` (later than the
clock's first cycle past `inv_hi` if that was during FETCH; one more cycle if it was
deferred by AMBIGUOUS). For AMBIGUOUS it is the cycle of the second change.

## Actions

An action (entry action or edge action) does, in this order of reading:

- **Clocks**: each clock in `clk_reset` reads 0 on the next cycle; others count up.
- **Pins** (Drive and Stress roles only): for pins in `drive_mask`, `pout = out_val`,
  `poe = out_oe`. If `tx_pin_en`, pin `tx_pin` is set to the old `tx_sr[0]` and
  enabled. In Check role the pin registers never change.
- **tx_op**: 1 load from TX FIFO, 2 load bit-reversed, 3 shift right filling with 1.
  A load from an empty FIFO gives 0xFF.
- **rx_op** (edges only): 1 shift in `pins_s[rx_pin]` at the MSB (LSB-first data),
  2 shift in at the LSB (MSB-first data), 3 push `rx_sr` into the RX FIFO.
- **cnt_op**: 1 decrement, 2 load 7, 3 load 8.

- **lane command** (edges only, when `tx_pin_en = 0`): the 3-bit `tx_pin` field is the
  command for the bit lanes (see Bit lanes): 0 none, 1 / 5 GO lane 0 / 1, 2 / 6 END,
  3 / 7 CRC, 4 reset both lanes. An edge cannot `send_bit` and command a lane together.

Entry actions cannot send a bit, touch `rx_sr` or command a lane (no room in the header).

Data flags: 0 true, 1 `cnt == 0`, 2 `tx_sr[0]`, 3 `rx_sr[0]`, 4 TX FIFO empty,
5 RX FIFO full, 6 `lfsr[0]`, 7 `rx_sr[7:1] == match_addr[6:0]`; 8..11 lane 0 `done`,
`crc_ok`, `sync_hit`, `error`; 12..15 the same for lane 1 (read 0 if the chip has one lane).

**Prescaler.** The header's 2 spare bits are the prescaler of the record in the record
registers: ÷1, ÷8, ÷64, ÷512. A free-running 9-bit counter `pre` (0 at start) counts
every cycle; with ÷N the clocks count only in cycles where the low log2(N) bits of
`pre` are all 1 (÷1: every cycle). Resets are unaffected. During FETCH the header
is the new record's from beat 1 on, like every other header field.

Stress role, per edge: 0 fire as soon as the guard holds, 1 only when the clock
equals `lo`, 2 only when it equals `hi`, 3 random (below). Clock select 3 reads clock 2.

Stress mode 3: once the guard holds inside the window, the edge fires on each eligible
cycle with probability 1/16 (`lfsr[3:0] == 0`), and is forced at `hi`. The firing point
is therefore a **truncated geometric distribution**: earlier eligible cycles are more
likely, and all remaining probability is concentrated at `hi`.

## Pins

Inputs pass a 2-flop synchroniser. A pad level is guaranteed to be seen only if it is
held for at least **2 core-clock cycles**; a change is seen 2 or 3 cycles after the pad
(sampling phase), so logged timestamps are exact to the synchronised change and within
+0/+1 cycle of the pad. Shorter pulses may be seen or missed.

During FETCH each pin keeps one `changed` bit, the age of its first change, and a
`multi` bit set when the pin changes again before EVAL (including a change in the first
EVAL cycle on a pin whose `changed` bit is already set). In EVAL every cycle is judged on
its own, so `multi` can only arise from FETCH.

A pin is **relevant** if it is in the location's `watch` mask or in the `chg_mask` of
any valid edge. On the first EVAL cycle, if `multi & relevant != 0`:
- every edge whose `chg_mask` includes such a pin is **suppressed** (cannot fire);
- an **AMBIGUOUS** violation is logged, whether or not another edge fires, with the
  timestamp of the **second** change on the lowest such pin (each pin keeps a 3-bit
  second-change age, like the first-change age);
- then the location's policy applies: halt or recover as usual; under continue, the
  lowest non-suppressed true edge (if any) fires in the same cycle.

`multi` is set only during FETCH, judged only on the first EVAL cycle after it, then
cleared; self-loops do not refetch, so AMBIGUOUS is logged at most once per fetch, even
under continue. `multi` on a pin that is not relevant is ignored. Level-only guards (`pin_mask`) are
unaffected, since they read the current level. A spec that must react to a pulse
shorter than the 5-cycle FETCH on a relevant pin will see AMBIGUOUS, never a silent
wrong edge: specs should allow at most one change per relevant pin per FETCH.

Pin source select (host CSR, 3 bits per pin): the value of pin p is `src(p)` of
0 `pout[p]`, 1 lane 0 `out`, 2 NOT lane 0, 3 lane 0 AND `pout[p]`, 4 NOT lane 0 AND
`pout[p]`, 5 lane 1, 6 NOT lane 1, 7 lane 1 AND `pout[p]`. The enable is always
`poe[p]`. Then the output stage: for open-drain pins (host mask) the pad is driven low
when the value is 0 and `poe = 1`, and released otherwise.

Reaction time: a pin change at the pad is seen 2 cycles later (`pins_s`); an edge that
fires on it changes `pout` the cycle after. Pad to pad: 3 cycles plus the output pad.

## Coverage

With `cover_en`, every taken edge updates `{cur_loc, edge}` in a 1-port SRAM:
count + 1 (saturating at 255), and min/max of the edge's `v_k` (saturated to
12 bits). The update is a read in stage S1 and a merged write in S2. If an edge fires
while S1 is busy: the same address is merged, a different address is dropped and
`cov_overrun` is set.

Coverage collected while `cov_overrun` is set (or the coverage drop count is non-zero)
is incomplete: counts and min/max are lower bounds.

## Host access rules

| Access | Idle | Running |
|---|---|---|
| `start` | starts; latches role, `start_loc`, `recover_loc` | restarts at `start_loc`; latched changes dropped |
| `stop` | no effect | stops at the end of the cycle; both lanes reset (as the lane reset command); FIFOs kept |
| `recover_loc` write | takes effect at the next `start` | takes effect at the next `start` |
| Location-store write | done | **ignored, sets `host_err`** (cause 1) |
| Coverage write | done (ignored with `host_err` cause 2 while the coverage pipeline drains after `stop`) | ignored, sets `host_err` (cause 2) |
| Coverage read (`cov_re`) | done | ignored (read data 0), sets `host_err` (cause 2) |
| Lane configuration CSR write (`lane_we`) | done while the lane is Idle or Done | refused while that lane is Armed or Run, sets `host_err` (cause 3) |
| TX push / RX pop / log pop | done | done (the FIFOs are dual-access) |
| Any access during `clear` | ignored | ignored |

`host_err` is sticky until the host writes `err_clear` (CTRL bit 3); `host_err_cause`
keeps the first cause (1 store write while running, 2 coverage access while running or
draining, 3 lane CSR write while the lane is active, 4 start while the image is not
valid, 5 store or coverage access during the image check sweep). The rule covers the lanes'
configuration CSRs only; status, write-1-to-clear and IRQ-enable bits stay writable.

`stop`: the engine's pins are released (`poe = 0`) and so are lane-sourced pins (their
enable is `poe`), so a stopped chip drives nothing. Both lanes go Idle: a partial RX byte
is dropped (and counted in that lane's RX drop counter), a partial TX frame is cut off
and its line released. The FIFOs keep their bytes.

A lane CSR write in the same cycle as the engine's GO for that lane lands (the lane was
not active yet), and the frame uses it: the lane reads `frame_bits` directly at its first
bit start (the cycle after GO at the earliest), and the registered values derived from
the bit timing CSRs are first used at the sample point, 2 or more cycles into the bit
(`div_int >= 4`). A write is therefore either refused (Armed or Run) or fully in place
before the frame starts.

## Image validation

The host validates format and compatibility; the chip permits execution only of bytes
whose read-back CRC matches the approved digest.

- Read-only CSRs: `format_version` (1) and `caps` (lanes, edges per location, record
  bits / 16, locations). The host loader checks the image header (magic, format version,
  location count, caps required, CRC-32) against them and the CRC over the file **before
  writing anything**, and writes unused locations as zero records, so the image always
  covers the whole store.
- CRC: CRC-32 as zlib's `crc32` (IEEE 802.3, reflected, initial and final XOR all ones)
  over the **whole store**, the 256 words in address order, each as 16 bytes
  little-endian (byte 0 = bits 7:0).
- `image_valid` is owned by the hardware; the host cannot set it. Any accepted store
  write clears it, and so does a `crc_expect` write.
- `verify` (idle only) starts a sweep: the chip reads the store one word at a time and
  feeds one byte per cycle into the CRC, 4097 cycles in all (about 0.1 ms at 40 MHz),
  with `image_valid` 0 meanwhile. At the end `image_valid` = (CRC == `crc_expect`).
- During the sweep the store belongs to it: host store writes and coverage accesses are
  refused (`host_err` cause 5, BUSY). A store write, a `start`, a `crc_expect` write or
  `clear` aborts the sweep and leaves `image_valid` 0; a refused coverage access does
  not abort it.
- `start` while `image_valid = 0` is refused and sets `host_err` cause 4. A refused start
  latches nothing (`role`, `start_loc`, `recover_loc` stay as they were).

## Host side (core ports)

`start` (role, `start_loc`, `recover_loc`), `stop` (see Host access rules; a `start` while running restarts the engine at `start_loc` and drops the pin changes latched so far; found by formal property P3); location-store and coverage writes are ignored
while running; TX push, RX pop, log pop. `irq` = RX holds at least `rx_wm` bytes (`rx_wm`
= 0 acts as 1, so any byte), or TX holds at most `tx_wm` bytes while `tx_wm_en`, or log
not empty, or halted on violation, or an entry with `irq_on_entry` since the last
`irq_ack`. FIFO heads are only defined when the FIFO is not empty.

## Limits and loss accounting

The TX, RX and violation-log FIFOs are 8 entries deep. The host SPI clock is at most
clk/6 (6.7 MHz at 40 MHz). The host must drain RX at the protocol's byte rate; bytes it
does not take in time are dropped and counted.

Five saturating 8-bit drop counters count lost data, one event per source per cycle:
RX lane 0, RX lane 1, RX engine (a push into a full FIFO, a push into a full wait
buffer, and for a lane a partial RX byte dropped by `stop` or the reset command), the
violation log (an entry into a full log), and coverage (an update dropped while S1 is
busy). They are not cleared by `start` (the overflow bits are); only `drop_clear` clears
them. `tx_collision` (sticky, cleared by `err_clear`) is set when the engine and a lane
pop the TX FIFO in the same cycle.

## Bit lanes

A lane serialises or deserialises one bit stream with its own bit timing, line code,
bit stuffing and CRC. **Anything fixed for the whole protocol is a host CSR; the record
carries only commands (the `tx_pin` field, see Actions) and flags (codes 8..15).** The
lane treats a frame as one continuous bit stream: the host packs the fields into bytes,
and the lane sends `frame_bits` data bits from the TX FIFO, or receives that many into
the RX FIFO. It does not parse fields (an RX frame's length is `frame_bits`).

**The host writes a lane's CSRs only while that lane is Idle** (the RTL keeps registered
copies of values derived from them, such as the sample point, so a write takes effect one
cycle later; with the lane Idle this is invisible).

**Configuration (CSRs, per lane):** `dir` (0 TX, 1 RX); bit timing `div` (16-bit integer
≥ 4, 8-bit fraction) or `clk_pin_en` with `clk_pin` and `clk_edge` (0 rising, 1 falling);
line `code` (0 NRZ, 1 NRZI, 2 Manchester); `stuff` (0 off, 1 after `stuff_len` equal bits
insert the complement (CAN), 2 after `stuff_len` ones insert a 0 (USB)); CRC `poly` and
`init` (32 bits, left-aligned: bit 31 is the CRC's MSB), `crc_width` (0..32), `crc_inv`;
`sync` and `sync_mask` (16 bits); `data_pin`; `lsb_first`; `readback` (TX); `frame_bits`
(16 bits, written by the host per frame).

**State:** `mode` (Idle, Armed, Run, Done); phase `ph`, fraction `acc`, `extra`; data
bits so far `cnt`; `bitpos` (0..7) and `byte`; `crc` (32), `crc_left`, `crc_bad`; stuffing
`run` and `last`; `sr` (16, last data bits); line level `out`; `prev` (NRZI RX); sticky
flags `crc_ok`, `sync_hit`, `error` with the error kind {stuff, bit, lost arbitration}.
Flag `done` is `mode == Done`. `out` is 1 except in Run and Done of a TX lane.

**Bit timing** (divider; Run and Done). The current bit lasts `L = div_int + extra`
cycles. Let `e = ph`, except where an RX lane sees its data pin change (`pins_s` vs
`pins_q`) and resynchronises to that edge: NRZ and NRZI, `e = 0` (the edge is a bit
start); Manchester, only for a change while `div_int >> 2 ≤ ph <` the sample point, which
is the mid-bit transition: `e = div_int >> 1`; other changes are ignored. In Armed the
first change is a bit start for every code (Manchester: idle high and a first bit 1, as
the 802.3 preamble). The cycle is a bit start if
`e = 0`, the sample point if `e = div_int >> 1` (Manchester RX: `(div_int >> 1) +
(div_int >> 2)`), and the bit's last cycle if `e = L − 1`; then `ph = 0` and
`{extra, acc} = acc + frac` (9 bits), else `ph = e + 1`. With `clk_pin_en`, a cycle is
both bit start and sample point when `clk_pin` shows the selected edge (`pins_s` vs
`pins_q`); there is no last cycle.

**TX (Run, at each bit start)** the lane picks the next slot, in this order:
1. a stuff bit, if `stuff` is on and `run == stuff_len`: the complement of `last`
   (mode 1) or 0 (mode 2); not counted, not in the CRC;
2. a data bit, if `cnt < frame_bits`: bit `bitpos` of `byte` (`lsb_first`: bit 0 first,
   else bit 7 first). If `bitpos == 0`, `byte` is first loaded from the TX FIFO (a pop;
   0xFF if empty). The CRC takes the bit; `cnt += 1`; `bitpos += 1` (mod 8);
3. a CRC bit, if `crc_left > 0`: `crc[31] xor crc_inv`; `crc <<= 1`; `crc_left −= 1`;
4. nothing: `mode = Done`, `out = 1`.

Stuffing count, for every slot sent or received (stuff bits included): mode 1
`run = (run ≠ 0 and slot == last) ? run + 1 : 1`, `last = slot`; mode 2
`run = slot ? run + 1 : 0`.
Line level: NRZ `out = slot`; NRZI `out` toggles when the slot is 0; Manchester
`out = NOT slot` for the first half and `out = slot` from the sample point on.

**Readback** (TX with `readback`, NRZ/NRZI, divider timing): at the sample point, if
`pins_s[data_pin] ≠ out`, the lane sets `error` (kind: lost arbitration if `out = 1`,
bit error if `out = 0`) and goes Idle. `out` reaches `pins_s` about 3 cycles after it
changes (output register, pad, synchroniser), so readback needs `div_int ≥ 8`.
Manchester and readback need the divider (with `clk_pin_en` the bit start and the
sample point are the same cycle).

All lane state is registered: what a cycle decides (a slot, `out`, a push, a pop) is
seen from the next cycle, except the push and pop strobes themselves, which act on the
FIFOs in the same cycle. In Done only the bit timing runs (no slots, no sampling).

**RX (Run, at each sample point):** `raw = pins_s[data_pin]`; the bit is `raw` (NRZ,
Manchester) or `raw == prev` (NRZI, then `prev = raw`). Then:
1. if `stuff` is on and `run == stuff_len`, it is a stuff bit: if it is not the expected
   value (as for TX), `error` (kind stuff) and Idle;
2. else it is a data bit: `sr = {sr[14:0], bit}`, `sync_hit` if `(sr ^ sync) & sync_mask
   == 0`; if `cnt < frame_bits`: CRC update, shift into `byte` (`lsb_first`:
   `{bit, byte[7:1]}`, else `{byte[6:0], bit}`), `cnt += 1`, and when `bitpos` wraps the
   byte is pushed to the RX FIFO; else if `crc_left > 0`: `crc_bad |= bit ≠ crc[31] xor
   crc_inv`, `crc <<= 1`, `crc_left −= 1`, and on the last one `crc_ok = NOT crc_bad`;
3. after a data bit or a good stuff bit, if `cnt == frame_bits`, `crc_left == 0` and no
   stuff bit is due (`run ≠ stuff_len` after this bit, or stuffing off): `mode = Done`.
   So a stuff bit that follows the last CRC bit (CAN) is read and checked first, as TX
   sends it before going Done.
Armed: the first change on the data pin starts Run with that cycle as the bit start
(`ph = 1` next). With `clk_pin_en`, GO goes straight to Run.

CRC update with bit b: `fb = b xor crc[31]`, `crc = (crc << 1) xor (fb ? poly : 0)`.

**Commands** (lane l):
- GO: `mode` = Run (TX, or RX with `clk_pin_en`) or Armed (RX); `ph = 0`, `acc = extra
  = 0`, `cnt = bitpos = 0`, `crc = init`, `crc_left = 0`, `crc_bad = 0`, `run = 0`,
  `last = 1`, `prev = 1`, `sr = 0`, `out = 1`, flags and error cleared.
- END: an RX lane with `bitpos ≠ 0` pushes the partial `byte`; `mode` = Idle.
- CRC: `crc_left = crc_width`; if `mode == Done`, back to Run (the bit timing has kept
  running). Armed during the frame, the CRC follows the data with no gap.
- reset (code 4): both lanes Idle, flags and errors cleared, `crc = 0`.
Commands act at the end of the cycle (after this cycle's lane step).

**RX FIFO arbitration.** Lane 0, lane 1 and the engine (`rx_op` push) can push in the
same cycle. Priority: lane 0, lane 1, engine. A push that loses waits in its own
one-entry buffer and goes in the first cycle no higher-priority push happens; a push
into a full buffer is dropped, sets `rx_overflow` and is counted.

**TX FIFO.** If the engine and a lane both pop TX in one cycle, both receive the same
byte and one byte is popped; `tx_collision` is set. Compiled specs never do this: the
compiler rejects an engine `tx load` / `load_rev` that may run while a TX lane may be
active (from a GO or CRC command to an END, the reset command, or an edge guarded on the
lane's done flag), searching the location graph with every location a possible start
and a recover-policy location able to jump to any location.
