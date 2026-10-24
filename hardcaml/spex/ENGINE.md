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
| violation log | 8 x 48 | `{timestamp 32, loc 6, kind 2, pins 8}` |
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

If no edge fires:

- **UNEXPECTED** if `changed_all & watch != 0`;
- **TIMEOUT** if the invariant is enabled, `clock[inv_clk] > inv_hi`, and no TIMEOUT
  has been logged in this visit. Any taken edge re-arms it.

A violation is pushed into the log and pulses `viol` the next cycle. Then the
policy: 0 halt (IDLE, `halted_viol` set), 1 continue, 2 jump to the host's
`recover_loc` (with a fetch), 3 halt. `changed` and the ages are cleared in every
EVAL cycle.

The timestamp logged for UNEXPECTED is the cycle the synchronised change was first
seen (`pins_s` changed), even when it was seen during FETCH. For TIMEOUT it is the
first cycle the clock is past `inv_hi`.

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
equals `lo`, 2 only when it equals `hi`, 3 each cycle with probability 1/16
(`lfsr[3:0] == 0`) and always at `hi`. Clock select 3 reads clock 2.

## Pins

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

## Host side (core ports)

`start` (role, `start_loc`), `stop`; location-store and coverage writes are ignored
while running; TX push, RX pop, log pop. `irq` = RX not empty, or log not empty, or
halted on violation, or an entry with `irq_on_entry` since the last `irq_ack`. FIFO
heads are only defined when the FIFO is not empty.

## Bit lanes

A lane serialises or deserialises one bit stream with its own bit timing, line code,
bit stuffing and CRC. **Anything fixed for the whole protocol is a host CSR; the record
carries only commands (the `tx_pin` field, see Actions) and flags (codes 8..15).** The
lane treats a frame as one continuous bit stream: the host packs the fields into bytes,
and the lane sends `frame_bits` data bits from the TX FIFO, or receives that many into
the RX FIFO. It does not parse fields (an RX frame's length is `frame_bits`).

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
3. after a data bit, if `cnt == frame_bits` and `crc_left == 0`: `mode = Done`.
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
into a full buffer is dropped and sets `rx_overflow`.

**TX FIFO.** A lane pop and an engine load in the same cycle both read the head; the
FIFO pops once.
