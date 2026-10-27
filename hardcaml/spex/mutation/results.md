| Mutant | Result |
|---|---|
| edge priority: edge 1 beats edge 0 | KILLED |
| window lower bound exclusive | KILLED |
| window upper bound exclusive | KILLED |
| pin changes during entry are lost | KILLED |
| Check role drives the pins | KILLED |
| TIMEOUT logged every cycle, not once per visit | KILLED |
| self-loop refetches the record | KILLED |
| TX shift fills with 0 | KILLED |
| RX MSB-first shift takes the wrong end | KILLED |
| counter load8 loads 7 | KILLED |
| coverage count wraps instead of saturating | KILLED |
| open-drain pin drives high | KILLED |
| Stress at_hi fires at lo | KILLED |
| clocks wrap instead of saturating | KILLED |
| one-flop synchroniser | KILLED |
| change age starts at 0 | SKIPPED (pattern not found once) |
| FIFO full one entry early | KILLED |
| recover jumps to the start location | KILLED |
| irq_ack ignored | KILLED |
| UNEXPECTED ignores the watch mask | KILLED |
| data flag inversion ignored | KILLED |
| ignore age in windows (entry-time changes judged at the EVAL clock) | KILLED |
| no floor at 0 for a clock reset after the change | KILLED |
| AMBIGUOUS: suppression dropped | KILLED |
| AMBIGUOUS only when no edge fires | KILLED |
| AMBIGUOUS: chg_mask left out of the relevant mask | KILLED |
| send_bit drives the inverted bit | KILLED |
| timestamp counter is only 24 bits | KILLED |
| logged timestamp borrow register is only 21 bits | KILLED |
| RX FIFO: lane 0 data replaced when the engine waits | KILLED |
| wait buffer forgets a push that lost | KILLED |
| pin source 'lane 0 AND engine' ignores the engine | KILLED |
| prescaler /8 counts every cycle | KILLED |
| send_bit edges also command the lanes | KILLED |
| lane flags read as 0 | KILLED |
| stuff bit one bit early | KILLED |
| stuff bit not complemented | KILLED |
| CRC feedback ignores the bit | KILLED |
| CRC inversion ignored | KILLED |
| readback never compares | KILLED |
| lost arbitration and bit error swapped | KILLED |
| RX never resynchronises | KILLED |
| fractional carry dropped | KILLED |
| RX MSB-first shift takes the wrong end | KILLED |
| END drops the partial byte | KILLED |
| NRZI decode inverted | KILLED |
| RX Done before a trailing stuff bit | KILLED |
| SPI samples MOSI on the falling edge | KILLED |
| SPI address does not auto-increment | KILLED |
| location store bytes assembled big-endian | KILLED |
| location store beat written on byte 14 | KILLED |
| STATUS not sent during the command byte | KILLED |
| RX FIFO popped when its byte is loaded, not when sent | KILLED |
| violation log popped after byte 4 | KILLED |
| coverage write goes to the incremented address | KILLED |
| CS_n high does not reset the bit counter | KILLED |
| CTRL start and stop bits swapped | KILLED |
| vlog byte 5 does not wrap the address | KILLED |
| TX FIFO byte pushed without its data | KILLED |

58/58 killed
