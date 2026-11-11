(** Host loader (ENGINE.md, Image validation): a spec becomes an image file (header, the
    whole location store zero-filled to [Layout.num_locs] locations, CRC-32), the image is
    checked against the chip's read-only CSRs and against its own CRC before anything is
    written, then it goes to the chip as SPI frames (stop, one frame per location,
    [crc_expect], [verify]); the load succeeds only when the chip reports [image_valid]
    after the sweep, and [start] follows it.

    Image file (all little-endian):
    - bytes 0..3 "SPEX"; 4 format version; 5 locations; 6 caps required {lanes 7:4,
      edges per location 3:0}; 7 record bits / 16; 8..11 CRC-32 of the store; 12..15 zero;
    - bytes 16.. the store: [num_locs * beats] words of 16 bytes, in address order, byte 0
      = bits 7:0 (the order the chip's sweep feeds its CRC).

    The chip side goes through [transport], which sends one CS_n-low frame and returns
    the MISO bytes, so the same code drives the simulated host (test/spi_host.ml) and,
    later, a cocotb harness or a board. *)

open! Base

let magic = [ 0x53; 0x50; 0x45; 0x58 ] (* "SPEX" *)
let header_len = 16
let store_len = Layout.num_locs * Layout.beats * 16

type image =
  { header : int list (** [header_len] bytes *)
  ; store : int list (** [store_len] bytes *)
  }

(* CRC-32 as zlib's crc32: reflected, poly 0xEDB88320, init and final XOR all ones *)
let crc32 bytes =
  List.fold bytes ~init:0xFFFF_FFFF ~f:(fun c b ->
    let c = ref (c lxor b) in
    for _ = 1 to 8 do
      c := if !c land 1 = 1 then (!c lsr 1) lxor 0xEDB8_8320 else !c lsr 1
    done;
    !c)
  lxor 0xFFFF_FFFF
;;

let le32 v = List.init 4 ~f:(fun k -> (v lsr (8 * k)) land 0xFF)
let of_le l = List.foldi l ~init:0 ~f:(fun k a b -> a lor (b lsl (8 * k)))

(** Lanes the spec commands or reads: 1 + the highest lane index in a lane command or
    a lane flag, 0 if none. *)
let lanes_needed (t : Spec.t) =
  let of_cmd c = if c = Layout.Lane_cmd.none || c = Layout.Lane_cmd.reset then -1 else (c - 1) / 4 in
  let of_flag f = if f >= 8 then (f - 8) / 4 else -1 in
  let of_action (a : Spec.action) = of_cmd a.lane_cmd in
  List.fold t.locs ~init:(-1) ~f:(fun m (l : Spec.loc) ->
    List.fold l.edges ~init:(max m (of_action l.entry)) ~f:(fun m (e : Spec.edge) ->
      max m (max (of_action e.action) (of_flag e.guard.flag))))
  + 1
;;

let of_spec ?rx_lanes (t : Spec.t) =
  let words = Spec.store_image ?rx_lanes t in
  let store =
    Array.to_list words
    |> List.concat_map ~f:(fun w ->
      List.init 16 ~f:(fun k -> Hardcaml.Bits.to_int (Hardcaml.Bits.select w ((8 * k) + 7) (8 * k))))
  in
  let header =
    magic
    @ [ Host_spi.format_version
      ; Layout.num_locs
      ; (lanes_needed t lsl 4) lor Layout.num_edges
      ; Layout.record_bits / 16
      ]
    @ le32 (crc32 store)
    @ [ 0; 0; 0; 0 ]
  in
  { header; store }
;;

let to_bytes i = i.header @ i.store

let of_bytes b =
  if List.length b <> header_len + store_len
  then Error (Printf.sprintf "image is %d bytes, expected %d" (List.length b) (header_len + store_len))
  else Ok { header = List.take b header_len; store = List.drop b header_len }
;;

(** What the chip reports in its read-only CSRs 0x14..0x17. *)
type chip =
  { format_version : int
  ; lanes : int
  ; edges : int
  ; record16 : int
  ; locations : int
  }

let read_csr transport addr n = List.drop (transport ([ 0x80 lor Host_spi.Space.csr; 0; addr ] @ List.init n ~f:(fun _ -> 0))) 3

let read_chip transport =
  match read_csr transport 0x14 4 with
  | [ v; caps; r; l ] -> { format_version = v; lanes = caps lsr 4; edges = caps land 0xF; record16 = r; locations = l }
  | _ -> assert false
;;

(** Every check that needs no write: the file's own CRC, the magic, and the header
    against the chip. *)
let check (i : image) (c : chip) =
  let h = Array.of_list i.header in
  let crc = of_le (List.sub i.header ~pos:8 ~len:4) in
  let need_lanes = h.(6) lsr 4
  and edges = h.(6) land 0xF in
  if List.length i.header <> header_len || List.length i.store <> store_len
  then Error "image has the wrong size"
  else if not (List.equal Int.equal (List.take i.header 4) magic)
  then Error "not a SPEX image (magic)"
  else if crc32 i.store <> crc
  then Error (Printf.sprintf "image CRC %08x does not match its header %08x" (crc32 i.store) crc)
  else if h.(4) <> c.format_version
  then Error (Printf.sprintf "format version %d, chip has %d" h.(4) c.format_version)
  else if h.(5) <> c.locations
  then Error (Printf.sprintf "%d locations, chip has %d" h.(5) c.locations)
  else if edges <> c.edges || h.(7) <> c.record16
  then Error "record layout differs from the chip's"
  else if need_lanes > c.lanes
  then Error (Printf.sprintf "needs %d lanes, chip has %d" need_lanes c.lanes)
  else Ok ()
;;

(** The write frames, in order: stop, the store (one frame per location: header
    {space 1, address loc << 6} and 64 bytes), [crc_expect], [verify]. *)
let frames (i : image) =
  let rec chunks l = if List.is_empty l then [] else List.take l 64 :: chunks (List.drop l 64) in
  ([ [ Host_spi.Space.csr; 0; 0; 0x02 ] ]
   @ List.mapi (chunks i.store) ~f:(fun loc bytes ->
     [ Host_spi.Space.records; (loc lsl 6) lsr 8; (loc lsl 6) land 0xFF ] @ bytes))
  @ [ [ Host_spi.Space.csr; 0; 0x18 ] @ List.take (List.drop i.header 8) 4
    ; [ Host_spi.Space.csr; 0; 0; 0x10 ]
    ]
;;

(** Check, write, verify. [Ok ()] only when the chip reports [image_valid] after the
    sweep; [polls] bounds the wait for [verify_busy] to clear. *)
let load ?(polls = 1000) transport (i : image) =
  match check i (read_chip transport) with
  | Error _ as e -> e
  | Ok () ->
    List.iter (frames i) ~f:(fun f -> ignore (transport f : int list));
    let rec wait k =
      let s = List.hd_exn (read_csr transport 0x13 1) in
      if s land 0x40 = 0 then Some s else if k = 0 then None else wait (k - 1)
    in
    (match wait polls with
     | None -> Error "verify did not finish"
     | Some s when s land 0x80 = 0 -> Error "image_valid is 0 after verify: the store does not match the image"
     | Some _ -> Ok ())
;;

(** CONFIG {role, cover_en, rx_to_tx}, START_LOC, RECOVER_LOC, then the start pulse. *)
let start ?(loc = 0) ?(recover = 0) ?(role = Layout.Role.drive) ?(cover = false) ?(bridge = false) transport =
  ignore
    (transport
       [ Host_spi.Space.csr; 0; 1; role lor (if cover then 4 else 0) lor (if bridge then 8 else 0); loc; recover ]
     : int list);
  ignore (transport [ Host_spi.Space.csr; 0; 0; 0x01 ] : int list)
;;
