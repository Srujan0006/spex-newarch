(** Host SPI port: a mode-0 SPI target that drives the engine's [Host_in] ports.

    SCK, CS_n and MOSI pass through 2-flop synchronisers into the engine clock; SCK
    edges are detected there. MOSI is sampled on the detected rising edge, MISO changes
    on the detected falling edge, so each SCK half period must last at least 3 engine
    clocks (SCK <= clk / 6, 6.6 MHz at 40 MHz).

    Frame (CS_n low): command byte, 16-bit address (MSB first), then data bytes with
    auto-increment. Command: bit 7 = read, bits 2:0 = space. MISO sends STATUS during
    the command byte, 0 during the address, then read data.

    Spaces (byte addresses):
    - 0 CSRs. Write 0x00 CTRL {irq_ack, stop, start} pulses; read 0x00 STATUS.
      0x01 CONFIG {dbg_sel 5:4, cover_en 2, role 1:0}, 0x02 START_LOC, 0x03 RECOVER_LOC,
      0x04 OPEN_DRAIN, 0x05 MATCH_ADDR (read/write). Read only: 0x06 FLAGS, 0x07 CUR_LOC,
      0x08..0x0B TIMESTAMP (reading 0x08 latches bits 31:8 for 0x09..0x0B).
    - 1 location store, write only: address {loc 6, beat 2, byte 4}. Bytes are
      little-endian within a 128-bit beat; byte 15 writes the beat. Ignored while
      running (ENGINE.md), so stop the engine first.
    - 2 coverage: address {loc 6, edge 2, byte 2}, little-endian; writing byte 3 writes
      the word. Engine must be idle.
    - 3 violation log, read only: bytes 0..5 of the head entry, little-endian; reading
      byte 5 pops it and the address wraps to byte 0 of the next entry. 0 when empty.
    - 4 TX FIFO, write only: each data byte is pushed.
    - 5 RX FIFO, read only: each data byte read pops the head (0 when empty).

    STATUS = {running, halted_viol, irq, accepting, rx_avail, vlog_avail, tx_full,
    in_entry}. FLAGS = {rx_overflow, vlog_overflow, cov_overrun, tx_empty, 4'b0}. *)

open! Base
open! Hardcaml
open Signal

module I = struct
  type 'a t =
    { clock : 'a
    ; clear : 'a
    ; cs_n : 'a
    ; sck : 'a
    ; mosi : 'a
    ; st : 'a Engine.Status.t [@rtlprefix "st_"]
    }
  [@@deriving hardcaml]
end

module O = struct
  type 'a t =
    { host : 'a Engine.Host_in.t [@rtlprefix "host_"]
    ; miso : 'a
    ; dbg_sel : 'a [@bits 2]
    }
  [@@deriving hardcaml]
end

module Space = struct
  let csr = 0
  let records = 1
  let coverage = 2
  let vlog = 3
  let tx = 4
  let rx = 5
end

let status_byte (st : Signal.t Engine.Status.t) =
  concat_msb
    [ st.running
    ; st.halted_viol
    ; st.irq
    ; st.accepting
    ; ~:(st.rx_empty)
    ; ~:(st.vlog_empty)
    ; st.tx_full
    ; st.in_entry
    ]
;;

(** Byte [k] (little-endian) of [v], selected by [sel]. *)
let byte_of v sel =
  let n = (width v + 7) / 8 in
  mux sel (List.init n ~f:(fun k -> select (uresize v (8 * n)) ((8 * k) + 7) (8 * k)))
;;

let create (_ : Scope.t) (i : _ I.t) : _ O.t =
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.clear () in
  let spec1 = Reg_spec.override spec ~clear_to:vdd in
  let st = i.st in
  (* ---- synchronisers and edge detect ---- *)
  let cs_n = reg spec1 (reg spec1 i.cs_n) in
  let sck = reg spec (reg spec i.sck) in
  let mosi = reg spec (reg spec i.mosi) in
  let sck_q = reg spec sck in
  let cs_q = reg spec1 cs_n in
  let active = ~:cs_n in
  let rise = active &: sck &: ~:sck_q in
  let fall = active &: ~:sck &: sck_q in
  let cs_fall = cs_q &: ~:cs_n in
  let open Always in
  let rv w = Variable.reg spec ~width:w in
  let bitn = rv 3 in
  let in_sr = rv 7 in
  let byte_idx = rv 2 in
  let cmd = rv 8 in
  let addr = rv 16 in
  let out_sr = rv 8 in
  (* CSRs *)
  let config = rv 6 in
  let start_loc = rv 6 in
  let recover_loc = rv 6 in
  let open_drain = rv 8 in
  let match_addr = rv 8 in
  let ts_snap = rv 24 in
  (* host-side strobes and data, one cycle after the byte that causes them *)
  let start_p = rv 1 in
  let stop_p = rv 1 in
  let ack_p = rv 1 in
  let rec_we_p = rv 1 in
  let rec_waddr = rv 8 in
  let rec_w = rv 128 in
  let cov_we_p = rv 1 in
  let cov_waddr = rv 8 in
  let cov_w = rv 32 in
  let tx_push_p = rv 1 in
  let tx_data = rv 8 in
  let rx_pop_p = rv 1 in
  let vlog_pop_p = rv 1 in
  let byte = concat_msb [ in_sr.value; mosi ] in
  let byte_done = rise &: (bitn.value ==:. 7) in
  let is_read = cmd.value.:(7) in
  let space = select cmd.value 2 0 in
  let in_data = byte_idx.value ==:. 3 in
  let sp k = space ==:. k in
  let a = addr.value in
  let next_addr =
    mux2
      (sp Space.vlog &: (select a 2 0 ==:. 5))
      (concat_msb [ select a 15 3; zero 3 ])
      (a +:. 1)
  in
  (* the byte MISO sends next, loaded on the falling edge after a byte completes *)
  let csr_rd =
    mux
      (select a 3 0)
      [ status_byte st
      ; uresize config.value 8
      ; uresize start_loc.value 8
      ; uresize recover_loc.value 8
      ; open_drain.value
      ; match_addr.value
      ; concat_msb [ st.rx_overflow; st.vlog_overflow; st.cov_overrun; st.tx_empty; zero 4 ]
      ; uresize st.cur_loc 8
      ; select st.timestamp 7 0
      ; select ts_snap.value 7 0
      ; select ts_snap.value 15 8
      ; select ts_snap.value 23 16
      ; zero 8
      ]
  in
  let data_rd =
    mux
      space
      [ csr_rd
      ; zero 8
      ; byte_of st.cov_rdata (select a 1 0)
      ; mux2 st.vlog_empty (zero 8) (byte_of st.vlog_data (select a 2 0))
      ; zero 8
      ; mux2 st.rx_empty (zero 8) st.rx_data
      ; zero 8
      ; zero 8
      ]
  in
  let next_out = mux2 (in_data &: is_read) data_rd (zero 8) in
  let wr_data = byte_done &: in_data &: ~:is_read in
  let rd_data = byte_done &: in_data &: is_read in
  compile
    [ start_p <--. 0
    ; stop_p <--. 0
    ; ack_p <--. 0
    ; rec_we_p <--. 0
    ; cov_we_p <--. 0
    ; tx_push_p <--. 0
    ; rx_pop_p <--. 0
    ; vlog_pop_p <--. 0
    ; (* receive *)
      when_ rise [ bitn <-- bitn.value +:. 1; in_sr <-- select byte 6 0 ]
    ; when_
        byte_done
        [ when_ (byte_idx.value <>:. 3) [ byte_idx <-- byte_idx.value +:. 1 ]
        ; when_ (byte_idx.value ==:. 0) [ cmd <-- byte ]
        ; when_ (byte_idx.value ==:. 1) [ addr <-- concat_msb [ byte; select a 7 0 ] ]
        ; when_ (byte_idx.value ==:. 2) [ addr <-- concat_msb [ select a 15 8; byte ] ]
        ; when_ in_data [ addr <-- next_addr ]
        ]
    ; (* writes *)
      when_
        (wr_data &: sp Space.csr)
        [ switch
            (select a 3 0)
            [ ( of_int ~width:4 0
              , [ start_p <-- byte.:(0); stop_p <-- byte.:(1); ack_p <-- byte.:(2) ] )
            ; of_int ~width:4 1, [ config <-- select byte 5 0 ]
            ; of_int ~width:4 2, [ start_loc <-- select byte 5 0 ]
            ; of_int ~width:4 3, [ recover_loc <-- select byte 5 0 ]
            ; of_int ~width:4 4, [ open_drain <-- byte ]
            ; of_int ~width:4 5, [ match_addr <-- byte ]
            ]
        ]
    ; when_
        (wr_data &: sp Space.records)
        [ rec_w <-- concat_msb [ byte; select rec_w.value 127 8 ]
        ; when_
            (select a 3 0 ==:. 15)
            [ rec_we_p <--. 1; rec_waddr <-- select a 11 4 ]
        ]
    ; when_
        (wr_data &: sp Space.coverage)
        [ cov_w <-- concat_msb [ byte; select cov_w.value 31 8 ]
        ; when_ (select a 1 0 ==:. 3) [ cov_we_p <--. 1; cov_waddr <-- select a 9 2 ]
        ]
    ; when_ (wr_data &: sp Space.tx) [ tx_push_p <--. 1; tx_data <-- byte ]
    ; (* reads: a FIFO entry is popped once the byte that carried it is sent *)
      when_ (rd_data &: sp Space.rx) [ rx_pop_p <--. 1 ]
    ; when_ (rd_data &: sp Space.vlog &: (select a 2 0 ==:. 5)) [ vlog_pop_p <--. 1 ]
    ; (* transmit: STATUS from CS_n low, then a new byte after each completed byte *)
      when_
        fall
        [ if_
            (bitn.value ==:. 0)
            [ out_sr <-- next_out
            ; when_
                (in_data &: is_read &: sp Space.csr &: (select a 3 0 ==:. 8))
                [ ts_snap <-- select st.timestamp 31 8 ]
            ]
            [ out_sr <-- sll out_sr.value 1 ]
        ]
    ; when_
        cs_fall
        [ bitn <--. 0; byte_idx <--. 0; cmd <--. 0; out_sr <-- status_byte st ]
    ]
  ;
  let host : _ Engine.Host_in.t =
    { start = start_p.value
    ; stop = stop_p.value
    ; role = select config.value 1 0
    ; start_loc = start_loc.value
    ; recover_loc = recover_loc.value
    ; cover_en = config.value.:(2)
    ; open_drain = open_drain.value
    ; match_addr = match_addr.value
    ; irq_ack = ack_p.value
    ; rec_we = rec_we_p.value
    ; rec_waddr = rec_waddr.value
    ; rec_wdata = rec_w.value
    ; tx_push = tx_push_p.value
    ; tx_data = tx_data.value
    ; rx_pop = rx_pop_p.value
    ; vlog_pop = vlog_pop_p.value
    ; cov_addr = mux2 cov_we_p.value cov_waddr.value (select a 9 2)
    ; cov_we = cov_we_p.value
    ; cov_wdata = cov_w.value
    }
  in
  { host; miso = active &: out_sr.value.:(7); dbg_sel = select config.value 5 4 }
;;
