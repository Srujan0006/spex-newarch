(** Bit lane (ENGINE.md, Bit lanes): serialises or deserialises one bit stream with its
    own bit timing (fractional divider with edge resync, or a clock pin), line code
    (NRZ, NRZI, Manchester), bit stuffing and CRC. Configuration comes from host CSRs
    ([Layout.Lane_cfg]); the engine sends commands and reads four flags. *)

open! Base
open! Hardcaml
open Signal
open Layout

module I = struct
  type 'a t =
    { clock : 'a
    ; clear : 'a
    ; cfg : 'a Lane_cfg.t [@rtlprefix "cfg_"]
    ; go : 'a
    ; end_ : 'a
    ; crc_cmd : 'a
    ; reset : 'a
    ; pins_s : 'a [@bits 8]
    ; pins_q : 'a [@bits 8]
    ; tx_head : 'a [@bits 8]
    ; tx_empty : 'a
    }
  [@@deriving hardcaml]
end

module O = struct
  type 'a t =
    { out : 'a
    ; pop : 'a
    ; push : 'a
    ; push_data : 'a [@bits 8]
    ; done_ : 'a
    ; crc_ok : 'a
    ; sync_hit : 'a
    ; error : 'a
    ; err_kind : 'a [@bits 3] (** {lost arbitration, bit error, stuff error} *)
    ; active : 'a (** Armed or Run: the host may not write this lane's CSRs *)
    ; lost : 'a (** reset (or stop) dropped a partial RX byte this cycle *)
    }
  [@@deriving hardcaml]
end

let m_idle = 0
let m_armed = 1
let m_run = 2
let m_done = 3

let create (_ : Scope.t) (i : _ I.t) : _ O.t =
  let c = i.cfg in
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.clear () in
  let spec1 = Reg_spec.override spec ~clear_to:vdd in
  let open Always in
  let rv w = Variable.reg spec ~width:w in
  let mode = rv 2 in
  let ph = rv 16 in
  let acc = rv 8 in
  let extra = rv 1 in
  let cnt = rv 16 in
  let bitpos = rv 3 in
  let byte = rv 8 in
  let crc = rv 32 in
  let crc_left = rv 6 in
  let crc_bad = rv 1 in
  let run = rv 3 in
  let last = Variable.reg spec1 ~width:1 in
  let sr = rv 16 in
  let out = Variable.reg spec1 ~width:1 in
  let cur = rv 1 in
  let prev = Variable.reg spec1 ~width:1 in
  let crc_ok = rv 1 in
  let sync_hit = rv 1 in
  let error = rv 1 in
  let kind = rv 3 in
  let is_rx = c.dir in
  let in_run = mode.value ==:. m_run in
  let in_armed = mode.value ==:. m_armed in
  let in_done = mode.value ==:. m_done in
  let pin sel v = mux sel (bits_lsb v) in
  let d = pin c.data_pin i.pins_s in
  let dq = pin c.data_pin i.pins_q in
  let dedge = d ^: dq in
  let cs = pin c.clk_pin i.pins_s in
  let cq = pin c.clk_pin i.pins_q in
  let cedge = mux2 c.clk_edge (cq &: ~:cs) (cs &: ~:cq) in
  (* ---- bit timing ---- *)
  let edge_rx = is_rx &: dedge &: ~:(c.clk_pin_en) in
  let manch = c.code ==:. Code.manchester in
  (* values derived from the configuration, registered: the host changes the CSRs only
     while the lane is Idle (ENGINE.md), so the adders stay off the bit-timing path *)
  let mid = reg spec (srl c.div_int 1) in
  let quarter = reg spec (srl c.div_int 2) in
  let samp_pt = reg spec (mux2 (is_rx &: manch) (srl c.div_int 1 +: srl c.div_int 2) (srl c.div_int 1)) in
  let last0 = reg spec (uresize c.div_int 17 -:. 1) in
  let last1 = reg spec (uresize c.div_int 17) in
  (* NRZ/NRZI: an edge is a bit start; Manchester: an edge in the middle half of the
     bit is the mid-bit transition; Armed: the first edge is a bit start *)
  let mid_edge = edge_rx &: manch &: (ph.value >=: quarter) &: (ph.value <: samp_pt) in
  let resync = edge_rx &: (in_armed |: ~:manch) in
  let timing_on = in_run |: in_done |: (in_armed &: edge_rx) in
  let e = mux2 resync (zero 16) (mux2 (mid_edge &: ~:in_armed) mid ph.value) in
  (* e is 0 (resync), mid (Manchester mid-bit edge) or ph: compare all three with each
     target in parallel and select, instead of comparing the selected e *)
  let at_mid = mid_edge &: ~:in_armed in
  let e_is x0 xmid xph = mux2 resync x0 (mux2 at_mid xmid xph) in
  let lm = mux2 extra.value last1 last0 in
  let last_cycle =
    ~:(c.clk_pin_en)
    &: e_is (lm ==:. 0) (uresize mid 17 ==: lm) (uresize ph.value 17 ==: lm)
  in
  let start = mux2 c.clk_pin_en cedge (e_is vdd (mid ==:. 0) (ph.value ==:. 0)) in
  let sample =
    mux2 c.clk_pin_en cedge (e_is (samp_pt ==:. 0) (mid ==: samp_pt) (ph.value ==: samp_pt))
  in
  (* ---- stuffing and CRC helpers ---- *)
  let stuff_on = c.stuff <>:. 0 in
  let stuff_due = stuff_on &: (run.value ==: c.stuff_len) in
  let stuff_bit = mux2 (c.stuff ==:. 1) ~:(last.value) gnd in
  let run_next slot =
    mux2
      (c.stuff ==:. 2)
      (mux2 slot (run.value +:. 1) (zero 3))
      (mux2 (run.value <>:. 0 &: (slot ==: last.value)) (run.value +:. 1) (of_int ~width:3 1))
  in
  let crc_next b =
    let fb = b ^: crc.value.:(31) in
    sll crc.value 1 ^: mux2 fb c.poly (zero 32)
  in
  let crc_bit = crc.value.:(31) ^: c.crc_inv in
  let data_avail = cnt.value <: c.frame_bits in
  let crc_avail = crc_left.value <>:. 0 in
  (* ---- TX: the slot at a bit start ---- *)
  let tx_step = in_run &: ~:is_rx &: start in
  let need_load = ~:stuff_due &: data_avail &: (bitpos.value ==:. 0) in
  let loaded = mux2 i.tx_empty (ones 8) i.tx_head in
  let byte_cur = mux2 need_load loaded byte.value in
  let dbit = mux bitpos.value (bits_lsb (mux2 c.lsb_first byte_cur (reverse byte_cur))) in
  let has_slot = stuff_due |: data_avail |: crc_avail in
  let slot = mux2 stuff_due stuff_bit (mux2 data_avail dbit crc_bit) in
  let line_first =
    mux
      c.code
      [ slot; mux2 slot out.value ~:(out.value); ~:slot; slot ]
  in
  let pop = tx_step &: need_load &: ~:(i.tx_empty) in
  (* ---- TX readback ---- *)
  let rb_check =
    in_run &: ~:is_rx &: c.readback &: ~:(c.clk_pin_en) &: (c.code <>:. Code.manchester)
    &: sample &: (d <>: out.value)
  in
  (* ---- RX: the bit at a sample point ---- *)
  let rx_step = in_run &: is_rx &: sample in
  let rbit = mux2 (c.code ==:. Code.nrzi) (d ==: prev.value) d in
  let rx_stuff_bad = stuff_due &: (rbit <>: stuff_bit) in
  let rx_data = ~:stuff_due in
  let sr_next = concat_msb [ select sr.value 14 0; rbit ] in
  let byte_rx = mux2 c.lsb_first (concat_msb [ rbit; select byte.value 7 1 ]) (concat_msb [ select byte.value 6 0; rbit ]) in
  let rx_take = rx_step &: rx_data &: data_avail in
  let push = rx_take &: (bitpos.value ==:. 7) in
  let rx_crc = rx_step &: rx_data &: ~:data_avail &: crc_avail in
  let crc_bad_next = crc_bad.value |: (rbit <>: crc_bit) in
  (* the same comparisons, formed from the registers for each outcome and then selected *)
  let cnt_done = mux2 rx_take (cnt.value +:. 1 ==: c.frame_bits) (cnt.value ==: c.frame_bits) in
  let left_done = mux2 rx_crc (crc_left.value ==:. 1) (crc_left.value ==:. 0) in
  let stuff_after = stuff_on &: mux2 rbit (run_next vdd ==: c.stuff_len) (run_next gnd ==: c.stuff_len) in
  let rx_finish = rx_step &: ~:rx_stuff_bad &: cnt_done &: left_done &: ~:stuff_after in
  (* END pushes the partial byte (bitpos after this cycle's step) *)
  let bitpos_after =
    mux2 (rx_take |: (tx_step &: has_slot &: ~:stuff_due &: data_avail)) (bitpos.value +:. 1) bitpos.value
  in
  let byte_after = mux2 rx_take byte_rx byte.value in
  let end_push = i.end_ &: is_rx &: (bitpos_after <>:. 0) &: ~:push in
  let lost =
    i.reset &: ~:(i.end_) &: is_rx &: (in_run |: in_done) &: (bitpos_after <>:. 0) &: ~:push
  in
  compile
    [ (* bit timing *)
      when_
        (timing_on &: ~:(c.clk_pin_en))
        [ if_
            last_cycle
            [ ph <--. 0
            ; (let s = uresize acc.value 9 +: uresize c.div_frac 9 in
               proc [ acc <-- select s 7 0; extra <-- s.:(8) ])
            ]
            [ ph <-- e +:. 1 ]
        ]
    ; when_ (in_armed &: edge_rx) [ mode <--. m_run ]
    ; (* TX *)
      when_
        tx_step
        [ if_
            has_slot
            [ run <-- run_next slot
            ; last <-- slot
            ; cur <-- slot
            ; out <-- line_first
            ; if_
                stuff_due
                []
                [ if_
                    data_avail
                    [ crc <-- crc_next slot
                    ; cnt <-- cnt.value +:. 1
                    ; bitpos <-- bitpos.value +:. 1
                    ; byte <-- byte_cur
                    ]
                    [ crc <-- sll crc.value 1; crc_left <-- crc_left.value -:. 1 ]
                ]
            ]
            [ mode <--. m_done; out <--. 1 ]
        ]
    ; when_
        (in_run &: ~:is_rx &: (c.code ==:. Code.manchester) &: sample &: ~:start)
        [ out <-- cur.value ]
    ; when_
        rb_check
        [ error <--. 1
        ; kind <-- mux2 out.value (of_int ~width:3 4) (of_int ~width:3 2)
        ; mode <--. m_idle
        ; out <--. 1
        ]
    ; (* RX *)
      when_
        rx_step
        [ when_ (c.code ==:. Code.nrzi) [ prev <-- d ]
        ; if_
            rx_stuff_bad
            [ error <--. 1; kind <-- of_int ~width:3 1; mode <--. m_idle ]
            [ run <-- run_next rbit
            ; last <-- rbit
            ; when_
                rx_data
                [ sr <-- sr_next
                ; when_
                    ((sr_next ^: c.sync) &: c.sync_mask ==:. 0)
                    [ sync_hit <--. 1 ]
                ; when_
                    rx_take
                    [ crc <-- crc_next rbit
                    ; byte <-- byte_rx
                    ; cnt <-- cnt.value +:. 1
                    ; bitpos <-- bitpos.value +:. 1
                    ]
                ; when_
                    rx_crc
                    [ crc_bad <-- crc_bad_next
                    ; crc <-- sll crc.value 1
                    ; crc_left <-- crc_left.value -:. 1
                    ; when_ (crc_left.value ==:. 1) [ crc_ok <-- ~:crc_bad_next ]
                    ]
                ]
            ; when_ rx_finish [ mode <--. m_done ]
            ]
        ]
    ; (* commands, after this cycle's step *)
      when_ i.end_ [ mode <--. m_idle; out <--. 1 ]
    ; when_
        i.crc_cmd
        [ crc_left <-- c.crc_width
        ; when_
            (in_done |: (tx_step &: ~:has_slot) |: rx_finish)
            [ mode <--. m_run ]
        ]
    ; when_
        i.go
        [ mode
          <-- mux2 (is_rx &: ~:(c.clk_pin_en)) (of_int ~width:2 m_armed) (of_int ~width:2 m_run)
        ; ph <--. 0
        ; acc <--. 0
        ; extra <--. 0
        ; cnt <--. 0
        ; bitpos <--. 0
        ; crc <-- c.init
        ; crc_left <--. 0
        ; crc_bad <--. 0
        ; run <--. 0
        ; last <--. 1
        ; prev <--. 1
        ; sr <--. 0
        ; out <--. 1
        ; crc_ok <--. 0
        ; sync_hit <--. 0
        ; error <--. 0
        ; kind <--. 0
        ]
    ; when_
        i.reset
        [ mode <--. m_idle
        ; out <--. 1
        ; crc <--. 0
        ; crc_ok <--. 0
        ; sync_hit <--. 0
        ; error <--. 0
        ; kind <--. 0
        ]
    ];
  { out = out.value
  ; pop
  ; lost
  ; push = push |: end_push
  ; push_data = mux2 push byte_rx byte_after
  ; done_ = in_done
  ; crc_ok = crc_ok.value
  ; sync_hit = sync_hit.value
  ; error = error.value
  ; err_kind = kind.value
  ; active = in_armed |: in_run
  }
;;
