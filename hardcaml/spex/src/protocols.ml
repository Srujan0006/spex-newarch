(** Example SPEX specs: the "firmware" for UART, SPI and I2C.

    Timing is in engine cycles. Every edge that ends a timed interval resets clock 0,
    so [at (n - 1)] means "n cycles after the previous edge". Location entry takes 5
    cycles, so any interval that crosses into a new location must be >= 6 cycles. *)

open! Base
open Layout
open Spec

(** UART transmitter, 8N1, LSB first. Bytes come from the TX FIFO. [n] = cycles per
    bit. With [jitter] > 0 each bit edge may move inside [n - jitter, n + jitter]:
    Drive role takes the earliest point, Stress role picks the point by [stress]. *)
let uart_tx ?(jitter = 0) ?(stress = Stress.asap) ~pin ~n () =
  let bit_end g = g |> window (n - 1 - jitter) (n - 1 + jitter) in
  { name = "uart_tx"
  ; locs =
      [ loc
          "idle"
          ~entry:(nop |> set pin true)
          [ edge
              ~goto:"data"
              (always |> not_flag Flag.tx_empty)
              (nop |> set pin false |> tx Tx_op.load |> cnt Cnt_op.load8 |> reset 0)
          ]
      ; loc
          "data"
          [ edge
              ~stress
              ~goto:"stop"
              (always |> bit_end |> flag Flag.cnt_zero)
              (nop |> set pin true |> reset 0)
          ; edge
              ~stress
              ~goto:"data"
              (always |> bit_end)
              (nop |> send_bit pin |> tx Tx_op.shift |> cnt Cnt_op.dec |> reset 0)
          ]
      ; loc
          "stop"
          ~accepting:true
          [ edge
              ~stress
              ~goto:"data"
              (always |> bit_end |> not_flag Flag.tx_empty)
              (nop |> set pin false |> tx Tx_op.load |> cnt Cnt_op.load8 |> reset 0)
          ; edge ~stress ~goto:"idle" (always |> bit_end) nop
          ]
      ]
  }
;;

(** UART receiver, 8N1. The same spec is a receiver in Drive role and a line monitor
    in Check role: a glitch inside the start bit is UNEXPECTED, a low stop bit
    (framing error) is a TIMEOUT. Set the recover location to "idle" (index 0). *)
let uart_rx ~pin ~n =
  let half = (n / 2) - 1 in
  { name = "uart_rx"
  ; locs =
      [ loc "idle" ~policy:Policy.recover [ edge ~goto:"start" (always |> falls pin) (nop |> reset 0) ]
      ; loc
          "start"
          ~inv:(0, half)
          ~watch:(bit pin)
          ~policy:Policy.recover
          [ edge
              ~goto:"data"
              (always |> pin_lo pin |> at half)
              (nop |> reset 0 |> cnt Cnt_op.load8)
          ]
      ; loc
          "data"
          ~inv:(0, n - 1)
          ~policy:Policy.recover
          [ edge
              ~goto:"idle"
              (always |> at (n - 1) |> flag Flag.cnt_zero |> pin_hi pin)
              (nop |> rx Rx_op.push)
          ; edge
              ~goto:"data"
              (always |> at (n - 1) |> not_flag Flag.cnt_zero)
              (nop |> rx ~pin Rx_op.shift_lsb |> cnt Cnt_op.dec |> reset 0)
          ]
      ]
  }
;;

(** SPI controller, mode 0 (CPOL 0, CPHA 0), MSB first. Each TX FIFO byte is one
    transfer; the byte read on MISO goes to the RX FIFO. CS stays low while the TX
    FIFO has more bytes. [hp] = cycles per SCK half period. *)
let spi_controller ~cs ~sck ~mosi ~miso ~hp =
  { name = "spi_ctrl_mode0"
  ; locs =
      [ loc
          "idle"
          ~entry:(nop |> set cs true |> set sck false |> set mosi false)
          [ edge
              ~goto:"setup"
              (always |> not_flag Flag.tx_empty)
              (nop |> set cs false |> tx Tx_op.load_rev |> cnt Cnt_op.load8 |> reset 0)
          ]
      ; loc
          "setup"
          [ edge
              ~goto:"lo"
              (always |> at (hp - 1))
              (nop |> send_bit mosi |> tx Tx_op.shift |> reset 0)
          ]
      ; loc
          "lo"
          [ edge
              ~goto:"hi"
              (always |> at (hp - 1))
              (nop |> set sck true |> rx ~pin:miso Rx_op.shift_msb |> cnt Cnt_op.dec |> reset 0)
          ]
      ; loc
          "hi"
          [ edge
              ~goto:"done"
              (always |> at (hp - 1) |> flag Flag.cnt_zero)
              (nop |> set sck false |> rx Rx_op.push |> reset 0)
          ; edge
              ~goto:"lo"
              (always |> at (hp - 1))
              (nop |> set sck false |> send_bit mosi |> tx Tx_op.shift |> reset 0)
          ]
      ; loc
          "done"
          ~accepting:true
          [ edge
              ~goto:"setup"
              (always |> at (hp - 1) |> not_flag Flag.tx_empty)
              (nop |> tx Tx_op.load_rev |> cnt Cnt_op.load8 |> reset 0)
          ; edge ~goto:"idle" (always |> at (hp - 1)) nop
          ]
      ]
  }
;;

(** I2C controller, write transactions. SCL and SDA must be open-drain. The first TX
    FIFO byte is the address byte (addr << 1 | 0), the rest are data; the bus is
    released with STOP when the FIFO is empty. Supports clock stretching. A NACK is
    a TIMEOUT in "ack_hi"; set the recover location to "nack", which sends STOP.
    [q] = cycles per quarter SCL period. *)
let i2c_controller_write ~scl ~sda ~q =
  let half = (2 * q) - 1 in
  { name = "i2c_ctrl_write"
  ; locs =
      [ loc
          "idle"
          ~entry:(nop |> set scl true |> set sda true)
          [ edge
              ~goto:"start"
              (always |> not_flag Flag.tx_empty |> pin_hi scl |> pin_hi sda)
              (nop |> set sda false |> tx Tx_op.load_rev |> cnt Cnt_op.load8 |> reset 0)
          ]
      ; loc "start" [ edge ~goto:"b_lo" (always |> at half) (nop |> set scl false |> reset 0) ]
      ; loc
          "b_lo"
          [ edge
              ~goto:"b_lo2"
              (always |> at (q - 1))
              (nop |> send_bit sda |> tx Tx_op.shift |> cnt Cnt_op.dec |> reset 0)
          ]
      ; loc "b_lo2" [ edge ~goto:"b_hi" (always |> at (q - 1)) (nop |> set scl true |> reset 0) ]
      ; loc
          "b_hi"
          ~watch:(bit sda)
          [ edge
              ~goto:"ack_lo"
              (always |> after half |> pin_hi scl |> flag Flag.cnt_zero)
              (nop |> set scl false |> reset 0)
          ; edge
              ~goto:"b_lo"
              (always |> after half |> pin_hi scl)
              (nop |> set scl false |> reset 0)
          ]
      ; loc "ack_lo" [ edge ~goto:"ack_lo2" (always |> at (q - 1)) (nop |> set sda true |> reset 0) ]
      ; loc "ack_lo2" [ edge ~goto:"ack_hi" (always |> at (q - 1)) (nop |> set scl true |> reset 0) ]
      ; loc
          "ack_hi"
          ~inv:(0, half + 16)
          ~policy:Policy.recover
          [ edge
              ~goto:"b_lo"
              (always |> after half |> pin_hi scl |> pin_lo sda |> not_flag Flag.tx_empty)
              (nop |> set scl false |> tx Tx_op.load_rev |> cnt Cnt_op.load8 |> reset 0)
          ; edge
              ~goto:"stop_lo"
              (always |> after half |> pin_hi scl |> pin_lo sda)
              (nop |> set scl false |> reset 0)
          ]
      ; loc "stop_lo" [ edge ~goto:"stop_lo2" (always |> at (q - 1)) (nop |> set sda false |> reset 0) ]
      ; loc "stop_lo2" [ edge ~goto:"stop_hi" (always |> at (q - 1)) (nop |> set scl true |> reset 0) ]
      ; loc
          "stop_hi"
          [ edge
              ~goto:"stop_done"
              (always |> after half |> pin_hi scl)
              (nop |> set sda true |> reset 0)
          ]
      ; loc "stop_done" ~accepting:true [ edge ~goto:"idle" (always |> at half) nop ]
      ; loc
          "nack"
          ~entry:(nop |> set scl false |> reset 0)
          [ edge ~goto:"stop_lo" (always |> at (q - 1)) (nop |> reset 0) ]
      ]
  }
;;

(** CAN 2.0A transmitter on bit lane 0. The lane sends SOF..data from the TX FIFO
    ([frame_bits] = 19 + 8 DLC, packed MSB first by the host), stuffs, appends CRC-15
    and checks every bit it sends (readback: lost arbitration or bit error stop it). The
    engine waits for an idle bus, then handles CRC delimiter, ACK slot and end of frame.
    Host setup: lane 0 TX, NRZ, [div] = [n], stuffing 1/5, CRC-15 (0x4599 << 17,
    width 15), readback, [data_pin] = [pin]; pin [pin] open-drain with source "lane 0
    AND engine", so the engine can pull the bus low too.

    Locations: [idle] (bus idle 11 bits and a frame in the TX FIFO), [arm] (CRC armed
    during the frame), [frame], [ack] (ACK slot sampled in its middle), [eof] (ACK
    delimiter, 7 EOF bits, 3 intermission), [noack], [lost] (arbitration lost or bit
    error; the host reads the lane status). *)
let can_tx ~pin ~n =
  { name = "can_tx"
  ; locs =
      [ loc
          "idle"
          ~entry:(nop |> set pin true)
          ~accepting:true
          [ edge ~goto:"idle" (always |> falls pin) (nop |> reset 0)
          ; edge
              ~goto:"arm"
              (always |> after ((11 * n) - 1) |> not_flag Flag.tx_empty)
              (nop |> lane (Lane_cmd.go 0))
          ]
      ; loc "arm" [ edge ~goto:"frame" always (nop |> lane (Lane_cmd.crc 0)) ]
      ; loc
          "frame"
          [ edge ~goto:"lost" (always |> flag (Flag.lane_error 0)) nop
          ; edge ~goto:"ack" (always |> flag (Flag.lane_done 0)) (nop |> reset 0)
          ]
      ; (* the lane is done at the start of the CRC delimiter; the ACK slot is the bit
           after it, sampled in its middle *)
        loc
          "ack"
          [ edge ~goto:"eof" (always |> pin_lo pin |> at (n + (n / 2))) (nop |> reset 0)
          ; edge ~goto:"noack" (always |> at (n + (n / 2))) (nop |> reset 0)
          ]
      ; loc "eof" [ edge ~goto:"idle" (always |> at ((n / 2) + (11 * n) - 1)) (nop |> reset 0) ]
      ; loc "noack" []
      ; loc "lost" []
      ]
  }
;;

(** CAN 2.0A receiver on bit lane 1, which ACKs good frames. The lane is armed on an idle
    bus, hard-syncs on SOF, destuffs, collects SOF..data into the RX FIFO (MSB first;
    [frame_bits] = 19 + 8 DLC, written by the host, which knows the DLC) and checks
    CRC-15. After a good CRC the engine drives the ACK slot dominant (pin source
    "engine", open-drain). Host setup as [can_tx] with lane 1, RX, no readback. *)
let can_rx ~pin ~n =
  { name = "can_rx"
  ; locs =
      [ loc
          "idle"
          ~entry:(nop |> set pin true)
          ~accepting:true
          [ edge ~goto:"arm" always (nop |> lane (Lane_cmd.go 1)) ]
      ; loc "arm" [ edge ~goto:"frame" always (nop |> lane (Lane_cmd.crc 1)) ]
      ; loc
          "frame"
          [ edge ~goto:"idle" (always |> flag (Flag.lane_error 1)) nop
          ; edge ~goto:"check" (always |> flag (Flag.lane_done 1)) (nop |> reset 0)
          ]
      ; loc
          "check"
          [ edge ~goto:"wait_ack" (always |> flag (Flag.lane_crc_ok 1)) nop
          ; edge ~goto:"crc_error" always nop
          ]
      ; (* the lane is done when it samples the last CRC (or stuff) bit, 2 cycles after
           its middle on the pad (synchroniser); clock 0 is 2 cycles later. The ACK slot
           starts n / 2 + n after that middle (after the CRC delimiter): drive it from
           clock n + n / 2 - 5 (needs n >= 16 to leave room for two FETCHes). *)
        loc
          "wait_ack"
          [ edge ~goto:"acking" (always |> at (n + (n / 2) - 5)) (nop |> set pin false |> reset 0) ]
      ; loc "acking" [ edge ~goto:"eof" (always |> at (n - 1)) (nop |> set pin true |> reset 0) ]
      ; loc
          "eof"
          [ edge ~goto:"idle" (always |> at ((8 * n) - 1)) (nop |> lane (Lane_cmd.end_ 1)) ]
      ; loc "crc_error" []
      ]
  }
;;

(** SPI target, any mode ([cpol], [cpha] in 0/1), MSB first. Follows the controller's
    SCK edges: each byte received on MOSI goes to the RX FIFO, and each byte sent on
    MISO comes from the TX FIFO (0xFF when it is empty). MISO is released while CS is
    high. Inside a byte every SCK edge is a self-loop (no entry cost); between bytes
    the spec passes through one or two other locations (about 6 to 11 cycles), which
    sets the top SCK speed. Those locations watch SCK, so an SCK edge that arrives
    too early is UNEXPECTED (and the engine halts) instead of a silently lost bit.
    A partial byte when CS rises is dropped. *)
let spi_target ~cpol ~cpha ~cs ~sck ~mosi ~miso =
  let lead g = if cpol = 0 then rises sck g else falls sck g in
  let trail g = if cpol = 0 then falls sck g else rises sck g in
  let sck_idle g = if cpol = 0 then pin_lo sck g else pin_hi sck g in
  let deselect = edge ~goto:"idle" (always |> rises cs) (nop |> release miso) in
  let sample g = g |> rx ~pin:mosi Rx_op.shift_msb in
  let shift_out g = g |> send_bit miso |> tx Tx_op.shift in
  let name = Printf.sprintf "spi_target_mode%d" ((2 * cpol) + cpha) in
  if cpha = 0
  then
    (* CPHA 0: data out before the first leading edge, sample on leading edges,
       change on trailing edges *)
    { name
    ; locs =
        [ loc
            "idle"
            ~entry:(nop |> release miso)
            [ edge ~goto:"first" (always |> falls cs) (nop |> tx Tx_op.load_rev |> cnt Cnt_op.load8) ]
        ; loc
            "first"
            ~watch:(bit sck)
            [ deselect; edge ~goto:"xfer" (always |> sck_idle) (nop |> shift_out) ]
        ; loc
            "xfer"
            [ deselect
            ; edge ~goto:"xfer" (always |> lead) (nop |> sample |> cnt Cnt_op.dec)
            ; edge
                ~goto:"next"
                (always |> trail |> flag Flag.cnt_zero)
                (nop |> tx Tx_op.load_rev |> cnt Cnt_op.load8)
            ; edge ~goto:"xfer" (always |> trail) (nop |> shift_out)
            ]
        ; loc
            "next"
            ~watch:(bit sck)
            [ edge ~goto:"xfer" (always |> sck_idle) (nop |> shift_out |> rx Rx_op.push) ]
        ]
    }
  else
    (* CPHA 1: change on leading edges, sample on trailing edges. The counter starts
       at 7 so that the eighth sample is the one that sees cnt = 0. *)
    { name
    ; locs =
        [ loc
            "idle"
            ~entry:(nop |> release miso)
            [ edge ~goto:"xfer" (always |> falls cs) (nop |> tx Tx_op.load_rev |> cnt Cnt_op.load7) ]
        ; loc
            "xfer"
            [ deselect
            ; edge ~goto:"xfer" (always |> lead) (nop |> shift_out)
            ; edge
                ~goto:"next"
                (always |> trail |> flag Flag.cnt_zero)
                (nop |> sample |> tx Tx_op.load_rev |> cnt Cnt_op.load7)
            ; edge ~goto:"xfer" (always |> trail) (nop |> sample |> cnt Cnt_op.dec)
            ]
        ; loc
            "next"
            ~watch:(bit sck)
            [ edge ~goto:"xfer" (always |> sck_idle) (nop |> rx Rx_op.push) ]
        ]
    }
;;

(** I2C target at the 7-bit address in the host's [match_addr] CSR. SCL and SDA
    must be open-drain. Write transactions: ACKs its address and every byte, and
    pushes each data byte into the RX FIFO. Read transactions: sends TX FIFO bytes
    (0xFF when empty) until the controller NACKs. Another address is ignored until
    the next START. A STOP or START in the middle of a byte is a clean recovery: the
    partial byte is dropped and the spec goes back to idle (STOP) or to the address
    byte (repeated START). No clock stretching. *)
let i2c_target ~scl ~sda =
  let start = always |> falls sda |> pin_hi scl in
  let stop = always |> rises sda |> pin_hi scl in
  let on_stop = edge ~goto:"idle" stop (nop |> release sda) in
  let on_start = edge ~goto:"addr" start (nop |> release sda |> cnt Cnt_op.load8) in
  let sample = nop |> rx ~pin:sda Rx_op.shift_msb |> cnt Cnt_op.dec in
  { name = "i2c_target"
  ; locs =
      [ loc "idle" ~entry:(nop |> release sda) [ on_start ]
      ; loc
          "addr"
          [ on_stop
          ; on_start
          ; edge ~goto:"addr" (always |> rises scl) sample
          ; edge ~goto:"a_ack" (always |> falls scl |> flag Flag.cnt_zero) nop
          ]
      ; loc
          "a_ack"
          [ edge ~goto:"idle" (always |> not_flag Flag.addr_match) nop
          ; edge ~goto:"a_ack2" always (nop |> set sda false |> tx Tx_op.load_rev)
          ]
      ; loc
          "a_ack2"
          [ on_stop
          ; edge
              ~goto:"rd"
              (always |> falls scl |> flag Flag.rx_bit0)
              (nop |> send_bit sda |> tx Tx_op.shift |> cnt Cnt_op.load7)
          ; edge ~goto:"data" (always |> falls scl) (nop |> release sda |> cnt Cnt_op.load8)
          ]
      ; loc
          "data"
          [ on_stop
          ; on_start
          ; edge ~goto:"data" (always |> rises scl) sample
          ; edge ~goto:"d_ack" (always |> falls scl |> flag Flag.cnt_zero) nop
          ]
      ; loc "d_ack" [ edge ~goto:"d_ack2" always (nop |> set sda false |> rx Rx_op.push) ]
      ; loc
          "d_ack2"
          [ edge ~goto:"data" (always |> falls scl) (nop |> release sda |> cnt Cnt_op.load8) ]
      ; loc
          "rd"
          [ on_stop
          ; edge ~goto:"rd_ack" (always |> falls scl |> flag Flag.cnt_zero) (nop |> release sda)
          ; edge
              ~goto:"rd"
              (always |> falls scl)
              (nop |> send_bit sda |> tx Tx_op.shift |> cnt Cnt_op.dec)
          ]
      ; loc
          "rd_ack"
          [ on_stop
          ; edge ~goto:"rd_end" (always |> rises scl |> pin_hi sda) nop
          ; edge ~goto:"rd_more" (always |> rises scl |> pin_lo sda) nop
          ]
      ; loc
          "rd_more"
          ~entry:(nop |> tx Tx_op.load_rev)
          [ edge
              ~goto:"rd"
              (always |> falls scl)
              (nop |> send_bit sda |> tx Tx_op.shift |> cnt Cnt_op.load7)
          ]
      ; loc "rd_end" [ on_stop; on_start ]
      ]
  }
;;

(** I2C controller, read transactions. SCL and SDA must be open-drain. The first TX
    FIFO byte is the address byte (addr << 1 | 1); each further TX FIFO byte asks for
    one more byte to be read (its value is ignored). Each byte read goes to the RX
    FIFO; the controller ACKs every byte but the last, NACKs the last and sends STOP.
    A NACK of the address is a TIMEOUT in "ack_hi"; set the recover location to
    "nack". Supports clock stretching. [q] = cycles per quarter SCL period. *)
let i2c_controller_read ~scl ~sda ~q =
  let half = (2 * q) - 1 in
  let w = i2c_controller_write ~scl ~sda ~q in
  let keep = [ "idle"; "start"; "b_lo"; "b_lo2"; "b_hi"; "ack_lo"; "ack_lo2" ] in
  let from_write =
    List.filter w.locs ~f:(fun l -> List.mem keep l.name ~equal:String.equal)
  in
  let stop_locs =
    List.filter w.locs ~f:(fun l ->
      List.mem [ "stop_lo"; "stop_lo2"; "stop_hi"; "stop_done"; "nack" ] l.name ~equal:String.equal)
  in
  { name = "i2c_ctrl_read"
  ; locs =
      from_write
      @ [ loc
            "ack_hi"
            ~inv:(0, half + 16)
            ~policy:Policy.recover
            [ edge
                ~goto:"r_rel"
                (always |> after half |> pin_hi scl |> pin_lo sda |> not_flag Flag.tx_empty)
                (nop |> set scl false |> tx Tx_op.load |> cnt Cnt_op.load7 |> reset 0)
            ; edge
                ~goto:"stop_lo"
                (always |> after half |> pin_hi scl |> pin_lo sda)
                (nop |> set scl false |> reset 0)
            ]
          (* release SDA a quarter period after SCL falls, then finish the low half *)
        ; loc "r_rel" [ edge ~goto:"r_lo" (always |> at (q - 1)) (nop |> set sda true |> reset 0) ]
        ; loc "r_lo" [ edge ~goto:"r_hi" (always |> at (q - 1)) (nop |> set scl true |> reset 0) ]
        ; loc
            "r_hi"
            [ edge
                ~goto:"m_ack"
                (always |> after half |> pin_hi scl |> flag Flag.cnt_zero)
                (nop |> rx ~pin:sda Rx_op.shift_msb |> set scl false |> reset 0)
            ; edge
                ~goto:"r_lo2"
                (always |> after half |> pin_hi scl)
                (nop |> rx ~pin:sda Rx_op.shift_msb |> set scl false |> cnt Cnt_op.dec |> reset 0)
            ]
        ; loc "r_lo2" [ edge ~goto:"r_lo" (always |> at (q - 1)) (nop |> reset 0) ]
          (* ACK (more to read) or NACK (last byte), driven a quarter period after SCL falls *)
        ; loc
            "m_ack"
            [ edge
                ~goto:"m_lo"
                (always |> at (q - 1) |> not_flag Flag.tx_empty)
                (nop |> set sda false |> rx Rx_op.push |> tx Tx_op.load |> cnt Cnt_op.load7 |> reset 0)
            ; edge ~goto:"n_lo" (always |> at (q - 1)) (nop |> set sda true |> rx Rx_op.push |> reset 0)
            ]
        ; loc "m_lo" [ edge ~goto:"m_hi" (always |> at (q - 1)) (nop |> set scl true |> reset 0) ]
        ; loc
            "m_hi"
            [ edge ~goto:"r_rel" (always |> after half |> pin_hi scl) (nop |> set scl false |> reset 0) ]
        ; loc "n_lo" [ edge ~goto:"n_hi" (always |> at (q - 1)) (nop |> set scl true |> reset 0) ]
        ; loc
            "n_hi"
            [ edge ~goto:"stop_lo" (always |> after half |> pin_hi scl) (nop |> set scl false |> reset 0) ]
        ]
      @ stop_locs
  }
;;

(** 1-Wire controller (Dallas/Maxim), standard speed, [u] = engine cycles per µs.
    Pin must be open-drain. When the TX FIFO has bytes: reset pulse (480 µs low),
    presence check at 70 µs (no presence = TIMEOUT in "rst_wait"; set the recover
    location to "idle"), then every TX FIFO byte is written LSB first (write-1 slot:
    6 µs low, write-0 slot: 60 µs low), then one byte is read (1 µs low, sample at
    14 µs) into the RX FIFO. A protocol with no clock line at all: every bit is a
    timing window, which is what the engine's clocks are for. *)
let onewire_controller ~pin ~u =
  let us n = (n * u) - 1 in
  { name = "onewire_ctrl"
  ; locs =
      [ loc
          "idle"
          ~entry:(nop |> release pin)
          [ edge ~goto:"rst_lo" (always |> not_flag Flag.tx_empty) (nop |> set pin false |> reset 0) ]
      ; loc "rst_lo" [ edge ~goto:"rst_wait" (always |> at (us 480)) (nop |> release pin |> reset 0) ]
      ; loc
          "rst_wait"
          ~policy:Policy.recover
          [ edge ~goto:"rst_rest" (always |> at (us 70) |> pin_lo pin) (nop |> reset 0) ]
      ; loc
          "rst_rest"
          [ edge
              ~goto:"w_slot"
              (always |> at (us 410))
              (nop |> tx Tx_op.load |> cnt Cnt_op.load8 |> reset 0)
          ]
      ; loc
          "w_slot"
          [ edge
              ~goto:"w_slot"
              (always |> flag Flag.cnt_zero |> not_flag Flag.tx_empty)
              (nop |> tx Tx_op.load |> cnt Cnt_op.load8)
          ; edge
              ~goto:"r_lo"
              (always |> flag Flag.cnt_zero)
              (nop |> set pin false |> cnt Cnt_op.load8 |> reset 0)
          ; edge ~goto:"w_bit" (always |> after (us 2)) (nop |> set pin false |> reset 0)
          ]
      ; loc
          "w_bit"
          [ edge
              ~goto:"w_hold"
              (always |> at (us 6))
              (nop |> send_bit pin |> tx Tx_op.shift |> cnt Cnt_op.dec |> reset 0)
          ]
      ; loc "w_hold" [ edge ~goto:"w_slot" (always |> at (us 54)) (nop |> release pin |> reset 0) ]
      ; loc "r_lo" [ edge ~goto:"r_samp" (always |> at (us 1)) (nop |> release pin |> reset 0) ]
      ; loc
          "r_samp"
          [ edge
              ~goto:"r_rec"
              (always |> at (us 13))
              (nop |> rx ~pin Rx_op.shift_lsb |> cnt Cnt_op.dec |> reset 0)
          ]
      ; loc
          "r_rec"
          [ edge ~goto:"idle" (always |> at (us 47) |> flag Flag.cnt_zero) (nop |> rx Rx_op.push)
          ; edge ~goto:"r_lo" (always |> at (us 47)) (nop |> set pin false |> reset 0)
          ]
      ]
  }
;;
