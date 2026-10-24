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
| change age starts at 0 | KILLED |
| FIFO full one entry early | KILLED |
| recover jumps to the start location | KILLED |
| irq_ack ignored | KILLED |
| UNEXPECTED ignores the watch mask | KILLED |
| data flag inversion ignored | KILLED |
| ignore age in windows (entry-time changes judged at the EVAL clock) | KILLED |
| no floor at 0 for a clock reset after the change | KILLED |
| send_bit drives the inverted bit | KILLED |
| SPI samples MOSI on the falling edge | KILLED |
| SPI address does not auto-increment | KILLED |
| location store bytes assembled big-endian | KILLED |
| location store beat written on byte 14 | KILLED |
| STATUS not sent during the command byte | KILLED |
| RX FIFO popped when its byte is loaded, not when sent | KILLED |
| violation log popped after byte 4 (equivalent below 2^24 cycles) | SURVIVED |
| coverage write goes to the incremented address | KILLED |
| CS_n high does not reset the bit counter | KILLED |
| CTRL start and stop bits swapped | KILLED |
| vlog byte 5 does not wrap the address | KILLED |
| TX FIFO byte pushed without its data | KILLED |

35/36 killed
