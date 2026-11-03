(* A software CAN 2.0A node, written from the Bosch CAN 2.0 specification (part A),
   independently of the lane RTL and model. It runs on the testbench's bus one engine
   cycle at a time: [n] cycles per bit, wired-AND bus (0 dominant).

   Frame (standard format): SOF 0, identifier 11 bits MSB first, RTR, IDE 0, r0 0,
   DLC 4 bits, data 0..8 bytes MSB first (DLC 9..15 also mean 8 bytes); extended format
   (CAN 2.0B): SOF, base identifier 11, SRR 1, IDE 1, identifier extension 18, RTR, r1 0,
   r0 0, DLC; a remote frame (RTR 1) has a DLC and no data; CRC 15 bits (x^15+x^14+x^10+x^8+x^7+x^4+x^3+1,
   initial 0, over SOF..data); bit stuffing from SOF to the end of the CRC sequence: after
   5 equal bits the complement is inserted; then CRC delimiter 1, ACK slot (transmitter
   1, receivers drive 0), ACK delimiter 1, end of frame 7 x 1, intermission 3 x 1.
   Arbitration: a transmitter that sends recessive (1) in the arbitration field (SOF,
   identifier, RTR) and reads dominant (0) loses and continues as a receiver. *)

open! Base

type frame =
  { id : int
  ; data : int list
  }
[@@deriving sexp_of, equal]

let bits_msb v n = List.init n ~f:(fun k -> (v lsr (n - 1 - k)) land 1)

let crc15 bits =
  List.fold bits ~init:0 ~f:(fun crc b ->
    let fb = b lxor ((crc lsr 14) land 1) in
    let crc = (crc lsl 1) land 0x7FFF in
    if fb = 1 then crc lxor 0x4599 else crc)
;;

(** How a transmitter sends a frame: the DLC field (default: the data length), remote
    (RTR 1, no data), extended format (29-bit identifier). *)
type tx_opts =
  { dlc : int option
  ; rtr : bool
  ; ext : bool
  }

let std = { dlc = None; rtr = false; ext = false }

(** SOF .. data, unstuffed. *)
let header_and_data ?(o = std) f =
  let dlc = Option.value o.dlc ~default:(List.length f.data) in
  let rtr = Bool.to_int o.rtr in
  let data = if o.rtr then [] else List.concat_map f.data ~f:(fun b -> bits_msb b 8) in
  if o.ext
  then
    [ 0 ] @ bits_msb (f.id lsr 18) 11 @ [ 1; 1 ] @ bits_msb f.id 18 @ [ rtr; 0; 0 ]
    @ bits_msb dlc 4 @ data
  else [ 0 ] @ bits_msb f.id 11 @ [ rtr; 0; 0 ] @ bits_msb dlc 4 @ data
;;

let stuff bits =
  let out = ref [] in
  let run = ref 0
  and last = ref (-1) in
  List.iter bits ~f:(fun b ->
    out := b :: !out;
    if b = !last then Int.incr run else run := 1;
    last := b;
    if !run = 5
    then (
      out := (1 - b) :: !out;
      run := 1;
      last := 1 - b));
  List.rev !out
;;

(** What a transmitter puts on the bus, stuffed, up to the ACK slot (exclusive). *)
let tx_bits ?(corrupt = false) ?o f =
  let u = header_and_data ?o f in
  let crc = crc15 u lxor if corrupt then 1 else 0 in
  stuff (u @ bits_msb crc 15) @ [ 1 ]
;;

type role =
  | Idle
  | Tx of int array * int (* stuffed bits up to and incl. the CRC delimiter, index *)
  | Rx

type t =
  { n : int
  ; mutable pending : frame option
  ; mutable role : role
  ; mutable ph : int (* cycle within the bit *)
  ; mutable idle_bits : int
  ; mutable bus_prev : int
  ; mutable drive : int
  ; (* receiver *)
    mutable unstuffed : int list (* reversed *)
  ; mutable run : int
  ; mutable last : int
  ; mutable expect_len : int option
  ; mutable after_crc : int (* bits seen after the CRC sequence: delimiter, ACK slot ... *)
  ; mutable crc_ok : bool option
  ; mutable received : frame list
  ; mutable lost_at : int option (* unstuffed bit index where arbitration was lost *)
  ; mutable acked : bool option (* as transmitter: ACK seen *)
  ; mutable sent : frame list
  ; mutable stuff_errors : int
  ; mutable ack_drive : bool
  ; idle_needed : int (* recessive bits before our own SOF (11 per the standard) *)
  ; mutable corrupt : bool (* send a wrong CRC (test of the receiver) *)
  ; mutable opts : tx_opts (* how our frames are sent *)
  }

let create ?(idle_needed = 11) ~n () =
  { n
  ; pending = None
  ; role = Idle
  ; ph = 0
  ; idle_bits = 0 (* power-up: 11 recessive bits before the first own SOF *)
  ; bus_prev = 1
  ; drive = 1
  ; unstuffed = []
  ; run = 0
  ; last = -1
  ; expect_len = None
  ; after_crc = 0
  ; crc_ok = None
  ; received = []
  ; lost_at = None
  ; acked = None
  ; sent = []
  ; stuff_errors = 0
  ; ack_drive = false
  ; idle_needed
  ; corrupt = false
  ; opts = std
  }
;;

let send t f = t.pending <- Some f

let start_frame t =
  t.ph <- 0;
  t.unstuffed <- [];
  t.run <- 0;
  t.last <- -1;
  t.expect_len <- None;
  t.after_crc <- 0;
  t.crc_ok <- None;
  match t.pending with
  | Some f ->
    t.role <- Tx (Array.of_list (tx_bits ~corrupt:t.corrupt ~o:t.opts f), 0);
    t.acked <- None
  | None -> t.role <- Rx
;;

(* the frame length once DLC is known: SOF..data (header 19 bits, extended 39; a remote
   frame has no data) *)
let data_end ?(hdr = 19) ?(rtr = false) dlc = if rtr then hdr else hdr + (8 * min dlc 8)

(** One bit sampled at the sample point (receivers and transmitters). Returns false
    when the frame is over (back to Idle). *)
let on_sample t b =
  let crc_done =
    match t.expect_len with
    | Some len -> List.length t.unstuffed >= len + 15
    | None -> false
  in
  if t.run = 5 && t.after_crc = 0
  then (
    (* a stuff bit, including one right after the last CRC bit *)
    if b = t.last then t.stuff_errors <- t.stuff_errors + 1;
    t.run <- 1;
    t.last <- b;
    true)
  else if crc_done
  then (
    (* after the CRC sequence: delimiter, ACK slot, ACK delimiter, EOF *)
    t.after_crc <- t.after_crc + 1;
    (match t.role with
     | Tx _ when t.after_crc = 2 -> t.acked <- Some (b = 0)
     | _ -> ());
    t.after_crc < 2 + 1 + 7)
  else (
    (
      t.unstuffed <- b :: t.unstuffed;
      (* a run continues across data bits only; [t.last] is the previous slot *)
      if b = t.last then t.run <- t.run + 1 else t.run <- 1;
      t.last <- b;
      let u = List.rev t.unstuffed in
      let k = List.length u in
      let field pos len = List.foldi (List.sub u ~pos ~len) ~init:0 ~f:(fun j acc x -> acc lor (x lsl (len - 1 - j))) in
      (* IDE (bit 13) tells the format; DLC ends the control field *)
      if k = 19 && field 13 1 = 0
      then t.expect_len <- Some (data_end ~rtr:(field 12 1 = 1) (field 15 4));
      if k = 39 && field 13 1 = 1
      then t.expect_len <- Some (data_end ~hdr:39 ~rtr:(field 32 1 = 1) (field 35 4));
      match t.expect_len with
      | Some len when k = len + 15 ->
        let body = List.sub u ~pos:0 ~len in
        let crc = List.foldi (List.sub u ~pos:len ~len:15) ~init:0 ~f:(fun j acc x -> acc lor (x lsl (14 - j))) in
        let ok = crc = crc15 body in
        t.crc_ok <- Some ok;
        let ext = field 13 1 = 1 in
        let hdr = if ext then 39 else 19 in
        let id = if ext then (field 1 11 lsl 18) lor field 14 18 else field 1 11 in
        let nbytes = (len - hdr) / 8 in
        let data = List.init nbytes ~f:(fun j -> field (hdr + (8 * j)) 8) in
        (match t.role with
         | Tx _ -> if ok then t.sent <- { id; data } :: t.sent
         | _ -> if ok then t.received <- { id; data } :: t.received)
      | _ -> ());
    true)
;;

(** One engine cycle: [bus] is the wired-AND bus level this cycle. Sets [t.drive] for
    the next cycle. *)
let step t ~bus =
  let edge_fall = t.bus_prev = 1 && bus = 0 in
  (match t.role with
   | Idle ->
     if edge_fall
     then (
       (* hard synchronisation on SOF; a pending frame joins it (both send SOF) *)
       start_frame t;
       t.ph <- 1)
     else (
       if t.ph = t.n - 1 then (
         t.ph <- 0;
         t.idle_bits <- (if bus = 1 then t.idle_bits + 1 else 0))
       else t.ph <- t.ph + 1;
       if Option.is_some t.pending && t.idle_bits >= t.idle_needed && t.ph = 0 then (
         start_frame t;
         (* our own SOF starts now *)
         ()))
   | Tx _ | Rx ->
     (* resynchronise on recessive -> dominant edges (receivers only) *)
     (match t.role with
      | Rx when edge_fall && t.ph > 0 -> t.ph <- 0
      | _ -> ());
     if t.ph = t.n / 2
     then (
       let b = bus in
       (match t.role with
        | Tx (bits, k) when k < Array.length bits ->
          let k_unstuffed = List.length t.unstuffed in
          if bits.(k) = 1 && b = 0
          then
            if k_unstuffed <= 12 && t.run < 5
            then (
              (* lost arbitration: continue as a receiver *)
              t.lost_at <- Some k_unstuffed;
              t.role <- Rx)
            else ()
        | _ -> ());
       let continue = on_sample t b in
       if not continue
       then (
         (match t.role with Tx _ -> t.pending <- None | _ -> ());
         t.role <- Idle;
         t.idle_bits <- 0));
     t.ph <- (if t.ph = t.n - 1 then 0 else t.ph + 1);
     (match t.role with
      | Tx (bits, k) when t.ph = 0 -> t.role <- Tx (bits, k + 1)
      | _ -> ());
     (* a receiver with a good CRC drives the whole ACK slot dominant: the bit after
        the CRC delimiter *)
     if t.ph = 0
     then (
       match t.role, t.crc_ok with
       | Rx, Some true when t.after_crc = 1 -> t.ack_drive <- true
       | _ -> t.ack_drive <- false));
  t.bus_prev <- bus;
  (* what we drive during the coming cycle *)
  t.drive
  <- (match t.role with
      | Tx (bits, k) -> if k < Array.length bits then bits.(k) else 1
      | Rx -> if t.ack_drive then 0 else 1
      | Idle -> 1)
;;
