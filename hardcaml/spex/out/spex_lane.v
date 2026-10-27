module spex_lane (
    cfg_sync_mask,
    cfg_sync,
    cfg_readback,
    cfg_stuff_len,
    tx_head,
    tx_empty,
    cfg_lsb_first,
    cfg_crc_inv,
    cfg_init,
    cfg_crc_width,
    cfg_poly,
    cfg_frame_bits,
    cfg_stuff,
    cfg_clk_pin,
    cfg_clk_edge,
    cfg_div_int,
    cfg_div_frac,
    clear,
    clock,
    cfg_code,
    pins_q,
    pins_s,
    cfg_data_pin,
    cfg_clk_pin_en,
    cfg_dir,
    crc_cmd,
    end_,
    go,
    reset,
    out,
    pop,
    push,
    push_data,
    done_,
    crc_ok,
    sync_hit,
    error,
    err_kind,
    active
);

    input [15:0] cfg_sync_mask;
    input [15:0] cfg_sync;
    input cfg_readback;
    input [2:0] cfg_stuff_len;
    input [7:0] tx_head;
    input tx_empty;
    input cfg_lsb_first;
    input cfg_crc_inv;
    input [31:0] cfg_init;
    input [5:0] cfg_crc_width;
    input [31:0] cfg_poly;
    input [15:0] cfg_frame_bits;
    input [1:0] cfg_stuff;
    input [2:0] cfg_clk_pin;
    input cfg_clk_edge;
    input [15:0] cfg_div_int;
    input [7:0] cfg_div_frac;
    input clear;
    input clock;
    input [1:0] cfg_code;
    input [7:0] pins_q;
    input [7:0] pins_s;
    input [2:0] cfg_data_pin;
    input cfg_clk_pin_en;
    input cfg_dir;
    input crc_cmd;
    input end_;
    input go;
    input reset;
    output out;
    output pop;
    output push;
    output [7:0] push_data;
    output done_;
    output crc_ok;
    output sync_hit;
    output error;
    output [2:0] err_kind;
    output active;

    wire _97;
    wire [2:0] _211;
    wire [2:0] _241;
    wire [2:0] _242;
    wire [2:0] _214;
    wire [2:0] _213;
    wire [2:0] _215;
    wire [2:0] _216;
    wire [2:0] _243;
    wire [2:0] _245;
    wire [2:0] _247;
    wire [2:0] _2;
    reg [2:0] _212;
    wire _249;
    wire _253;
    wire _254;
    wire _252;
    wire _255;
    wire _257;
    wire _259;
    wire _4;
    reg _250;
    wire [15:0] _276;
    wire [15:0] _7;
    wire [15:0] _9;
    wire [15:0] _266;
    wire [15:0] _267;
    wire [15:0] _268;
    wire [15:0] _270;
    wire [15:0] _10;
    reg [15:0] _262;
    wire [14:0] _264;
    wire [15:0] _265;
    wire [15:0] _274;
    wire [15:0] _275;
    wire _277;
    wire _279;
    wire _280;
    wire _281;
    wire _282;
    wire _284;
    wire _286;
    wire _11;
    reg _273;
    wire _309;
    wire _310;
    wire _312;
    wire _313;
    wire _314;
    wire _315;
    wire _317;
    wire _13;
    reg _289;
    wire _311;
    wire _323;
    wire [5:0] _321;
    wire _322;
    wire _324;
    wire _325;
    wire _326;
    wire _327;
    wire _328;
    wire _330;
    wire _332;
    wire _14;
    reg _320;
    wire [7:0] _351;
    wire [7:0] _352;
    wire _378;
    wire [2:0] _372;
    wire _367;
    wire _366;
    wire _368;
    wire _369;
    wire _370;
    wire [2:0] _373;
    wire _375;
    wire _376;
    wire _353;
    wire _377;
    wire _379;
    wire [2:0] _340;
    wire _341;
    wire _342;
    wire _380;
    wire _387;
    wire _386;
    wire _388;
    wire _416;
    wire _417;
    wire _20;
    reg _391;
    wire _698;
    wire _696;
    wire _697;
    reg _699;
    wire _700;
    wire _701;
    wire _693;
    wire [1:0] _689;
    wire _690;
    wire _687;
    wire _688;
    wire _691;
    wire _692;
    wire _694;
    wire _702;
    wire _207;
    wire _208;
    wire _201;
    wire _202;
    wire _198;
    wire _22;
    wire _195;
    wire [1:0] _90;
    wire [1:0] _682;
    wire _679;
    wire _680;
    wire [1:0] _683;
    wire _672;
    wire _673;
    wire _674;
    wire _675;
    wire [1:0] _677;
    wire [1:0] _665;
    wire [2:0] _658;
    wire [2:0] _655;
    wire _651;
    wire _649;
    wire _650;
    wire _652;
    wire [2:0] _656;
    wire _647;
    wire [2:0] _659;
    wire _660;
    wire [2:0] _641;
    wire _637;
    wire _635;
    wire _636;
    wire _638;
    wire [2:0] _642;
    wire _633;
    wire [2:0] _644;
    wire _645;
    wire _661;
    wire _662;
    wire _663;
    wire _629;
    wire [5:0] _626;
    wire _627;
    wire _630;
    wire [15:0] _621;
    wire [15:0] _622;
    wire _623;
    wire _620;
    wire _624;
    wire _618;
    wire _619;
    wire _625;
    wire _631;
    wire _664;
    wire [1:0] _666;
    wire [1:0] _668;
    wire [2:0] _24;
    wire [2:0] _546;
    wire [2:0] _547;
    wire [2:0] _542;
    wire _538;
    wire _536;
    wire _537;
    wire _539;
    wire [2:0] _543;
    wire _534;
    wire [2:0] _548;
    wire [2:0] _549;
    wire [2:0] _528;
    wire [2:0] _529;
    wire [2:0] _524;
    wire _412;
    wire _411;
    wire _410;
    wire _409;
    wire _408;
    wire _407;
    wire _406;
    wire _402;
    wire _401;
    wire _400;
    wire _399;
    wire _398;
    wire _397;
    wire _396;
    wire [7:0] _392;
    wire [7:0] _26;
    wire _28;
    wire [7:0] _393;
    wire [7:0] _344;
    wire [6:0] _348;
    wire [7:0] _349;
    wire [6:0] _346;
    wire [7:0] _347;
    wire [7:0] _350;
    wire [7:0] _422;
    wire [7:0] _423;
    wire [7:0] _424;
    wire [7:0] _418;
    wire [7:0] _419;
    wire [7:0] _420;
    wire [7:0] _421;
    wire [7:0] _425;
    wire [7:0] _29;
    reg [7:0] _345;
    wire _384;
    wire _381;
    wire _382;
    wire _385;
    wire [7:0] _394;
    wire _395;
    wire [7:0] _403;
    wire _31;
    wire [7:0] _404;
    wire _405;
    wire [2:0] _433;
    wire [2:0] _434;
    wire [2:0] _435;
    wire [2:0] _436;
    wire [2:0] _427;
    wire [2:0] _428;
    wire [2:0] _429;
    wire [2:0] _430;
    wire [2:0] _431;
    wire [2:0] _437;
    wire [2:0] _439;
    wire [2:0] _32;
    reg [2:0] _339;
    reg _413;
    wire _34;
    wire [31:0] _305;
    wire [31:0] _36;
    wire [30:0] _479;
    wire [31:0] _481;
    wire _473;
    wire _474;
    wire [31:0] _476;
    wire [30:0] _470;
    wire [31:0] _472;
    wire [31:0] _477;
    wire [31:0] _478;
    wire [5:0] _38;
    wire [5:0] _447;
    wire [5:0] _448;
    wire [5:0] _449;
    wire [5:0] _450;
    wire [5:0] _441;
    wire [5:0] _442;
    wire [5:0] _443;
    wire [5:0] _444;
    wire [5:0] _445;
    wire [5:0] _451;
    wire [5:0] _452;
    wire [5:0] _454;
    wire [5:0] _39;
    reg [5:0] _299;
    wire _301;
    wire _302;
    wire _295;
    wire _290;
    wire _296;
    wire _303;
    wire [31:0] _482;
    wire [31:0] _483;
    wire [31:0] _484;
    wire [31:0] _41;
    wire _461;
    wire _462;
    wire [31:0] _464;
    wire [30:0] _458;
    wire [31:0] _460;
    wire [31:0] _465;
    wire [30:0] _455;
    wire [31:0] _457;
    wire [31:0] _466;
    wire [31:0] _467;
    wire [31:0] _468;
    wire [31:0] _469;
    wire [31:0] _485;
    wire [31:0] _486;
    wire [31:0] _488;
    wire [31:0] _42;
    reg [31:0] _306;
    wire _307;
    wire _308;
    wire [15:0] _44;
    wire [15:0] _508;
    wire _335;
    wire _336;
    wire [15:0] _509;
    wire _263;
    wire [15:0] _510;
    wire _491;
    wire _489;
    wire _490;
    wire _492;
    wire _494;
    wire _45;
    reg _235;
    wire _236;
    wire _232;
    wire _237;
    wire _496;
    wire _497;
    wire _498;
    wire _500;
    wire _46;
    reg _228;
    wire _229;
    wire _226;
    wire _230;
    wire _238;
    wire _239;
    wire _240;
    wire [15:0] _511;
    wire [15:0] _502;
    wire [15:0] _503;
    wire [15:0] _504;
    wire [15:0] _505;
    wire [15:0] _506;
    wire [15:0] _512;
    wire [15:0] _514;
    wire [15:0] _47;
    reg [15:0] _293;
    wire _294;
    wire _414;
    wire _415;
    wire _520;
    wire _518;
    wire _519;
    wire _521;
    wire [2:0] _525;
    wire _516;
    wire [2:0] _530;
    wire [2:0] _531;
    wire [2:0] _532;
    wire [2:0] _550;
    wire [2:0] _552;
    wire [2:0] _48;
    reg [2:0] _222;
    wire _223;
    wire [1:0] _50;
    wire _218;
    wire _219;
    wire _224;
    wire _364;
    wire _365;
    wire [1:0] _614;
    wire _610;
    wire [1:0] _612;
    wire _359;
    wire _357;
    wire _360;
    wire _361;
    wire _362;
    wire _354;
    wire _355;
    wire _363;
    wire [1:0] _615;
    wire [1:0] _617;
    wire _190;
    wire _191;
    wire _186;
    wire _185;
    wire _184;
    wire _183;
    wire _182;
    wire _181;
    wire _180;
    wire _179;
    reg _187;
    wire _188;
    wire _177;
    wire _176;
    wire _175;
    wire _174;
    wire _173;
    wire _172;
    wire _171;
    wire _170;
    wire [2:0] _52;
    reg _178;
    wire _189;
    wire _54;
    wire _192;
    wire _168;
    wire _165;
    wire _158;
    wire _156;
    wire [13:0] _147;
    wire [15:0] _148;
    wire [14:0] _144;
    wire [15:0] _145;
    wire [15:0] _149;
    wire [14:0] _141;
    wire [15:0] _142;
    wire _139;
    wire [15:0] _150;
    reg [15:0] _153;
    wire _154;
    wire [13:0] _131;
    wire [15:0] _132;
    reg [15:0] _135;
    wire _598;
    wire _599;
    wire [15:0] _600;
    wire [15:0] _602;
    wire [15:0] _604;
    wire [16:0] _581;
    wire _582;
    wire [14:0] _160;
    wire [15:0] _161;
    reg [15:0] _164;
    wire [16:0] _578;
    wire _579;
    wire [16:0] _572;
    reg [16:0] _575;
    wire [16:0] _567;
    wire [15:0] _56;
    wire [16:0] _566;
    wire [16:0] _568;
    reg [16:0] _571;
    wire [7:0] _58;
    wire [8:0] _586;
    wire vdd;
    wire _60;
    wire _62;
    wire [7:0] _588;
    wire [7:0] _589;
    wire [7:0] _590;
    wire [7:0] _592;
    wire [7:0] _63;
    reg [7:0] _560;
    wire [8:0] _585;
    wire [8:0] _587;
    wire _593;
    wire _594;
    wire _595;
    wire _597;
    wire _64;
    reg _565;
    wire [16:0] _576;
    wire gnd;
    wire [16:0] _562;
    wire _577;
    wire _580;
    wire _583;
    wire _561;
    wire _584;
    wire [15:0] _606;
    wire _556;
    wire _554;
    wire _334;
    wire _553;
    wire _555;
    wire _557;
    wire [15:0] _607;
    wire [15:0] _609;
    wire [15:0] _65;
    reg [15:0] _129;
    wire _136;
    wire _137;
    wire _126;
    wire _138;
    wire _155;
    wire _157;
    wire _166;
    wire [1:0] _67;
    wire _122;
    wire _123;
    wire _94;
    wire _124;
    wire _119;
    wire _115;
    wire _114;
    wire _113;
    wire _112;
    wire _111;
    wire _110;
    wire _109;
    wire [7:0] _69;
    wire _108;
    reg _116;
    wire _106;
    wire _105;
    wire _104;
    wire _103;
    wire _102;
    wire _101;
    wire _100;
    wire [7:0] _71;
    wire _99;
    wire [2:0] _73;
    reg _107;
    wire _117;
    wire _118;
    wire _120;
    wire _125;
    wire _169;
    wire _75;
    wire _193;
    wire _77;
    wire _98;
    wire _194;
    wire [1:0] _669;
    wire [1:0] _671;
    wire _79;
    wire [1:0] _678;
    wire [1:0] _684;
    wire [1:0] _686;
    wire [1:0] _80;
    reg [1:0] _92;
    wire _96;
    wire _196;
    wire _197;
    wire _199;
    wire _203;
    wire _204;
    wire _209;
    wire _704;
    wire _82;
    wire _706;
    wire _84;
    wire _708;
    wire _86;
    wire _710;
    wire _87;
    reg _206;
    assign _97 = _94 | _96;
    assign _211 = 3'b000;
    assign _241 = 3'b001;
    assign _242 = _240 ? _241 : _216;
    assign _214 = 3'b100;
    assign _213 = 3'b010;
    assign _215 = _206 ? _214 : _213;
    assign _216 = _209 ? _215 : _212;
    assign _243 = _194 ? _242 : _216;
    assign _245 = _84 ? _211 : _243;
    assign _247 = _86 ? _211 : _245;
    assign _2 = _247;
    always @(posedge _62) begin
        if (_60)
            _212 <= _211;
        else
            _212 <= _2;
    end
    assign _249 = 1'b0;
    assign _253 = 1'b1;
    assign _254 = _240 ? _253 : _252;
    assign _252 = _209 ? _253 : _250;
    assign _255 = _194 ? _254 : _252;
    assign _257 = _84 ? _249 : _255;
    assign _259 = _86 ? _249 : _257;
    assign _4 = _259;
    always @(posedge _62) begin
        if (_60)
            _250 <= _249;
        else
            _250 <= _4;
    end
    assign _276 = 16'b0000000000000000;
    assign _7 = cfg_sync_mask;
    assign _9 = cfg_sync;
    assign _266 = _263 ? _265 : _262;
    assign _267 = _240 ? _262 : _266;
    assign _268 = _194 ? _267 : _262;
    assign _270 = _84 ? _276 : _268;
    assign _10 = _270;
    always @(posedge _62) begin
        if (_60)
            _262 <= _276;
        else
            _262 <= _10;
    end
    assign _264 = _262[14:0];
    assign _265 = { _264,
                    _230 };
    assign _274 = _265 ^ _9;
    assign _275 = _274 & _7;
    assign _277 = _275 == _276;
    assign _279 = _277 ? _253 : _273;
    assign _280 = _263 ? _279 : _273;
    assign _281 = _240 ? _273 : _280;
    assign _282 = _194 ? _281 : _273;
    assign _284 = _84 ? _249 : _282;
    assign _286 = _86 ? _249 : _284;
    assign _11 = _286;
    always @(posedge _62) begin
        if (_60)
            _273 <= _249;
        else
            _273 <= _11;
    end
    assign _309 = _230 == _308;
    assign _310 = ~ _309;
    assign _312 = _303 ? _311 : _289;
    assign _313 = _263 ? _312 : _289;
    assign _314 = _240 ? _289 : _313;
    assign _315 = _194 ? _314 : _289;
    assign _317 = _84 ? _249 : _315;
    assign _13 = _317;
    always @(posedge _62) begin
        if (_60)
            _289 <= _249;
        else
            _289 <= _13;
    end
    assign _311 = _289 | _310;
    assign _323 = ~ _311;
    assign _321 = 6'b000001;
    assign _322 = _299 == _321;
    assign _324 = _322 ? _323 : _320;
    assign _325 = _303 ? _324 : _320;
    assign _326 = _263 ? _325 : _320;
    assign _327 = _240 ? _320 : _326;
    assign _328 = _194 ? _327 : _320;
    assign _330 = _84 ? _249 : _328;
    assign _332 = _86 ? _249 : _330;
    assign _14 = _332;
    always @(posedge _62) begin
        if (_60)
            _320 <= _249;
        else
            _320 <= _14;
    end
    assign _351 = _336 ? _350 : _345;
    assign _352 = _342 ? _350 : _351;
    assign _378 = ~ _342;
    assign _372 = _339 + _241;
    assign _367 = ~ _224;
    assign _366 = _363 & _365;
    assign _368 = _366 & _367;
    assign _369 = _368 & _294;
    assign _370 = _336 | _369;
    assign _373 = _370 ? _372 : _339;
    assign _375 = _373 == _211;
    assign _376 = ~ _375;
    assign _353 = _82 & _77;
    assign _377 = _353 & _376;
    assign _379 = _377 & _378;
    assign _340 = 3'b111;
    assign _341 = _339 == _340;
    assign _342 = _336 & _341;
    assign _380 = _342 | _379;
    assign _387 = ~ _28;
    assign _386 = _363 & _385;
    assign _388 = _386 & _387;
    assign _416 = _365 ? _415 : _391;
    assign _417 = _363 ? _416 : _391;
    assign _20 = _417;
    always @(posedge _62) begin
        if (_60)
            _391 <= _249;
        else
            _391 <= _20;
    end
    assign _698 = ~ _415;
    assign _696 = ~ _206;
    assign _697 = _415 ? _206 : _696;
    always @* begin
        case (_67)
        0:
            _699 <= _415;
        1:
            _699 <= _697;
        2:
            _699 <= _698;
        default:
            _699 <= _415;
        endcase
    end
    assign _700 = _365 ? _699 : _253;
    assign _701 = _363 ? _700 : _206;
    assign _693 = ~ _362;
    assign _689 = 2'b10;
    assign _690 = _67 == _689;
    assign _687 = ~ _77;
    assign _688 = _96 & _687;
    assign _691 = _688 & _690;
    assign _692 = _691 & _193;
    assign _694 = _692 & _693;
    assign _702 = _694 ? _391 : _701;
    assign _207 = _107 == _206;
    assign _208 = ~ _207;
    assign _201 = _67 == _689;
    assign _202 = ~ _201;
    assign _198 = ~ _75;
    assign _22 = cfg_readback;
    assign _195 = ~ _77;
    assign _90 = 2'b00;
    assign _682 = 2'b01;
    assign _679 = ~ _75;
    assign _680 = _77 & _679;
    assign _683 = _680 ? _682 : _689;
    assign _672 = ~ _365;
    assign _673 = _363 & _672;
    assign _674 = _334 | _673;
    assign _675 = _674 | _664;
    assign _677 = _675 ? _689 : _671;
    assign _665 = 2'b11;
    assign _658 = _222 + _241;
    assign _655 = _222 + _241;
    assign _651 = vdd == _235;
    assign _649 = _222 == _211;
    assign _650 = ~ _649;
    assign _652 = _650 & _651;
    assign _656 = _652 ? _655 : _241;
    assign _647 = _50 == _689;
    assign _659 = _647 ? _658 : _656;
    assign _660 = _659 == _24;
    assign _641 = _222 + _241;
    assign _637 = gnd == _235;
    assign _635 = _222 == _211;
    assign _636 = ~ _635;
    assign _638 = _636 & _637;
    assign _642 = _638 ? _641 : _241;
    assign _633 = _50 == _689;
    assign _644 = _633 ? _211 : _642;
    assign _645 = _644 == _24;
    assign _661 = _230 ? _660 : _645;
    assign _662 = _219 & _661;
    assign _663 = ~ _662;
    assign _629 = _299 == _321;
    assign _626 = 6'b000000;
    assign _627 = _299 == _626;
    assign _630 = _303 ? _629 : _627;
    assign _621 = 16'b0000000000000001;
    assign _622 = _293 + _621;
    assign _623 = _622 == _44;
    assign _620 = _293 == _44;
    assign _624 = _336 ? _623 : _620;
    assign _618 = ~ _240;
    assign _619 = _194 & _618;
    assign _625 = _619 & _624;
    assign _631 = _625 & _630;
    assign _664 = _631 & _663;
    assign _666 = _664 ? _665 : _617;
    assign _668 = _240 ? _90 : _666;
    assign _24 = cfg_stuff_len;
    assign _546 = _222 + _241;
    assign _547 = _230 ? _546 : _211;
    assign _542 = _222 + _241;
    assign _538 = _230 == _235;
    assign _536 = _222 == _211;
    assign _537 = ~ _536;
    assign _539 = _537 & _538;
    assign _543 = _539 ? _542 : _241;
    assign _534 = _50 == _689;
    assign _548 = _534 ? _547 : _543;
    assign _549 = _240 ? _532 : _548;
    assign _528 = _222 + _241;
    assign _529 = _415 ? _528 : _211;
    assign _524 = _222 + _241;
    assign _412 = _404[7:7];
    assign _411 = _404[6:6];
    assign _410 = _404[5:5];
    assign _409 = _404[4:4];
    assign _408 = _404[3:3];
    assign _407 = _404[2:2];
    assign _406 = _404[1:1];
    assign _402 = _394[7:7];
    assign _401 = _394[6:6];
    assign _400 = _394[5:5];
    assign _399 = _394[4:4];
    assign _398 = _394[3:3];
    assign _397 = _394[2:2];
    assign _396 = _394[1:1];
    assign _392 = 8'b11111111;
    assign _26 = tx_head;
    assign _28 = tx_empty;
    assign _393 = _28 ? _392 : _26;
    assign _344 = 8'b00000000;
    assign _348 = _345[7:1];
    assign _349 = { _230,
                    _348 };
    assign _346 = _345[6:0];
    assign _347 = { _346,
                    _230 };
    assign _350 = _31 ? _349 : _347;
    assign _422 = _336 ? _350 : _421;
    assign _423 = _263 ? _422 : _421;
    assign _424 = _240 ? _421 : _423;
    assign _418 = _294 ? _394 : _345;
    assign _419 = _224 ? _345 : _418;
    assign _420 = _365 ? _419 : _345;
    assign _421 = _363 ? _420 : _345;
    assign _425 = _194 ? _424 : _421;
    assign _29 = _425;
    always @(posedge _62) begin
        if (_60)
            _345 <= _344;
        else
            _345 <= _29;
    end
    assign _384 = _339 == _211;
    assign _381 = ~ _224;
    assign _382 = _381 & _294;
    assign _385 = _382 & _384;
    assign _394 = _385 ? _393 : _345;
    assign _395 = _394[0:0];
    assign _403 = { _395,
                    _396,
                    _397,
                    _398,
                    _399,
                    _400,
                    _401,
                    _402 };
    assign _31 = cfg_lsb_first;
    assign _404 = _31 ? _394 : _403;
    assign _405 = _404[0:0];
    assign _433 = _339 + _241;
    assign _434 = _336 ? _433 : _431;
    assign _435 = _263 ? _434 : _431;
    assign _436 = _240 ? _431 : _435;
    assign _427 = _339 + _241;
    assign _428 = _294 ? _427 : _339;
    assign _429 = _224 ? _339 : _428;
    assign _430 = _365 ? _429 : _339;
    assign _431 = _363 ? _430 : _339;
    assign _437 = _194 ? _436 : _431;
    assign _439 = _84 ? _211 : _437;
    assign _32 = _439;
    always @(posedge _62) begin
        if (_60)
            _339 <= _211;
        else
            _339 <= _32;
    end
    always @* begin
        case (_339)
        0:
            _413 <= _405;
        1:
            _413 <= _406;
        2:
            _413 <= _407;
        3:
            _413 <= _408;
        4:
            _413 <= _409;
        5:
            _413 <= _410;
        6:
            _413 <= _411;
        default:
            _413 <= _412;
        endcase
    end
    assign _34 = cfg_crc_inv;
    assign _305 = 32'b00000000000000000000000000000000;
    assign _36 = cfg_init;
    assign _479 = _306[30:0];
    assign _481 = { _479,
                    _249 };
    assign _473 = _306[31:31];
    assign _474 = _230 ^ _473;
    assign _476 = _474 ? _41 : _305;
    assign _470 = _306[30:0];
    assign _472 = { _470,
                    _249 };
    assign _477 = _472 ^ _476;
    assign _478 = _336 ? _477 : _469;
    assign _38 = cfg_crc_width;
    assign _447 = _299 - _321;
    assign _448 = _303 ? _447 : _445;
    assign _449 = _263 ? _448 : _445;
    assign _450 = _240 ? _445 : _449;
    assign _441 = _299 - _321;
    assign _442 = _294 ? _299 : _441;
    assign _443 = _224 ? _299 : _442;
    assign _444 = _365 ? _443 : _299;
    assign _445 = _363 ? _444 : _299;
    assign _451 = _194 ? _450 : _445;
    assign _452 = _79 ? _38 : _451;
    assign _454 = _84 ? _626 : _452;
    assign _39 = _454;
    always @(posedge _62) begin
        if (_60)
            _299 <= _626;
        else
            _299 <= _39;
    end
    assign _301 = _299 == _626;
    assign _302 = ~ _301;
    assign _295 = ~ _294;
    assign _290 = _194 & _263;
    assign _296 = _290 & _295;
    assign _303 = _296 & _302;
    assign _482 = _303 ? _481 : _478;
    assign _483 = _263 ? _482 : _469;
    assign _484 = _240 ? _469 : _483;
    assign _41 = cfg_poly;
    assign _461 = _306[31:31];
    assign _462 = _415 ^ _461;
    assign _464 = _462 ? _41 : _305;
    assign _458 = _306[30:0];
    assign _460 = { _458,
                    _249 };
    assign _465 = _460 ^ _464;
    assign _455 = _306[30:0];
    assign _457 = { _455,
                    _249 };
    assign _466 = _294 ? _465 : _457;
    assign _467 = _224 ? _306 : _466;
    assign _468 = _365 ? _467 : _306;
    assign _469 = _363 ? _468 : _306;
    assign _485 = _194 ? _484 : _469;
    assign _486 = _84 ? _36 : _485;
    assign _488 = _86 ? _305 : _486;
    assign _42 = _488;
    always @(posedge _62) begin
        if (_60)
            _306 <= _305;
        else
            _306 <= _42;
    end
    assign _307 = _306[31:31];
    assign _308 = _307 ^ _34;
    assign _44 = cfg_frame_bits;
    assign _508 = _293 + _621;
    assign _335 = _194 & _263;
    assign _336 = _335 & _294;
    assign _509 = _336 ? _508 : _506;
    assign _263 = ~ _224;
    assign _510 = _263 ? _509 : _506;
    assign _491 = _240 ? _490 : _230;
    assign _489 = _365 ? _415 : _235;
    assign _490 = _363 ? _489 : _235;
    assign _492 = _194 ? _491 : _490;
    assign _494 = _84 ? _253 : _492;
    assign _45 = _494;
    always @(posedge _62) begin
        if (_60)
            _235 <= vdd;
        else
            _235 <= _45;
    end
    assign _236 = ~ _235;
    assign _232 = _50 == _682;
    assign _237 = _232 ? _236 : gnd;
    assign _496 = _67 == _682;
    assign _497 = _496 ? _107 : _228;
    assign _498 = _194 ? _497 : _228;
    assign _500 = _84 ? _253 : _498;
    assign _46 = _500;
    always @(posedge _62) begin
        if (_60)
            _228 <= vdd;
        else
            _228 <= _46;
    end
    assign _229 = _107 == _228;
    assign _226 = _67 == _682;
    assign _230 = _226 ? _229 : _107;
    assign _238 = _230 == _237;
    assign _239 = ~ _238;
    assign _240 = _224 & _239;
    assign _511 = _240 ? _506 : _510;
    assign _502 = _293 + _621;
    assign _503 = _294 ? _502 : _293;
    assign _504 = _224 ? _293 : _503;
    assign _505 = _365 ? _504 : _293;
    assign _506 = _363 ? _505 : _293;
    assign _512 = _194 ? _511 : _506;
    assign _514 = _84 ? _276 : _512;
    assign _47 = _514;
    always @(posedge _62) begin
        if (_60)
            _293 <= _276;
        else
            _293 <= _47;
    end
    assign _294 = _293 < _44;
    assign _414 = _294 ? _413 : _308;
    assign _415 = _224 ? _237 : _414;
    assign _520 = _415 == _235;
    assign _518 = _222 == _211;
    assign _519 = ~ _518;
    assign _521 = _519 & _520;
    assign _525 = _521 ? _524 : _241;
    assign _516 = _50 == _689;
    assign _530 = _516 ? _529 : _525;
    assign _531 = _365 ? _530 : _222;
    assign _532 = _363 ? _531 : _222;
    assign _550 = _194 ? _549 : _532;
    assign _552 = _84 ? _211 : _550;
    assign _48 = _552;
    always @(posedge _62) begin
        if (_60)
            _222 <= _211;
        else
            _222 <= _48;
    end
    assign _223 = _222 == _24;
    assign _50 = cfg_stuff;
    assign _218 = _50 == _90;
    assign _219 = ~ _218;
    assign _224 = _219 & _223;
    assign _364 = _224 | _294;
    assign _365 = _364 | _302;
    assign _614 = _365 ? _612 : _665;
    assign _610 = _94 & _120;
    assign _612 = _610 ? _689 : _92;
    assign _359 = _164 == _276;
    assign _357 = _129 == _276;
    assign _360 = _157 ? _359 : _357;
    assign _361 = _125 ? vdd : _360;
    assign _362 = _75 ? _192 : _361;
    assign _354 = ~ _77;
    assign _355 = _96 & _354;
    assign _363 = _355 & _362;
    assign _615 = _363 ? _614 : _612;
    assign _617 = _209 ? _90 : _615;
    assign _190 = ~ _178;
    assign _191 = _187 & _190;
    assign _186 = _69[7:7];
    assign _185 = _69[6:6];
    assign _184 = _69[5:5];
    assign _183 = _69[4:4];
    assign _182 = _69[3:3];
    assign _181 = _69[2:2];
    assign _180 = _69[1:1];
    assign _179 = _69[0:0];
    always @* begin
        case (_52)
        0:
            _187 <= _179;
        1:
            _187 <= _180;
        2:
            _187 <= _181;
        3:
            _187 <= _182;
        4:
            _187 <= _183;
        5:
            _187 <= _184;
        6:
            _187 <= _185;
        default:
            _187 <= _186;
        endcase
    end
    assign _188 = ~ _187;
    assign _177 = _71[7:7];
    assign _176 = _71[6:6];
    assign _175 = _71[5:5];
    assign _174 = _71[4:4];
    assign _173 = _71[3:3];
    assign _172 = _71[2:2];
    assign _171 = _71[1:1];
    assign _170 = _71[0:0];
    assign _52 = cfg_clk_pin;
    always @* begin
        case (_52)
        0:
            _178 <= _170;
        1:
            _178 <= _171;
        2:
            _178 <= _172;
        3:
            _178 <= _173;
        4:
            _178 <= _174;
        5:
            _178 <= _175;
        6:
            _178 <= _176;
        default:
            _178 <= _177;
        endcase
    end
    assign _189 = _178 & _188;
    assign _54 = cfg_clk_edge;
    assign _192 = _54 ? _191 : _189;
    assign _168 = _153 == _276;
    assign _165 = _164 == _153;
    assign _158 = _129 == _153;
    assign _156 = ~ _94;
    assign _147 = _56[15:2];
    assign _148 = { _90,
                    _147 };
    assign _144 = _56[15:1];
    assign _145 = { _249,
                    _144 };
    assign _149 = _145 + _148;
    assign _141 = _56[15:1];
    assign _142 = { _249,
                    _141 };
    assign _139 = _77 & _122;
    assign _150 = _139 ? _149 : _142;
    always @(posedge _62) begin
        if (_60)
            _153 <= _276;
        else
            _153 <= _150;
    end
    assign _154 = _129 < _153;
    assign _131 = _56[15:2];
    assign _132 = { _90,
                    _131 };
    always @(posedge _62) begin
        if (_60)
            _135 <= _276;
        else
            _135 <= _132;
    end
    assign _598 = ~ _94;
    assign _599 = _155 & _598;
    assign _600 = _599 ? _164 : _129;
    assign _602 = _125 ? _276 : _600;
    assign _604 = _602 + _621;
    assign _581 = 17'b00000000000000000;
    assign _582 = _576 == _581;
    assign _160 = _56[15:1];
    assign _161 = { _249,
                    _160 };
    always @(posedge _62) begin
        if (_60)
            _164 <= _276;
        else
            _164 <= _161;
    end
    assign _578 = { gnd,
                    _164 };
    assign _579 = _578 == _576;
    assign _572 = { gnd,
                    _56 };
    always @(posedge _62) begin
        if (_60)
            _575 <= _581;
        else
            _575 <= _572;
    end
    assign _567 = 17'b00000000000000001;
    assign _56 = cfg_div_int;
    assign _566 = { gnd,
                    _56 };
    assign _568 = _566 - _567;
    always @(posedge _62) begin
        if (_60)
            _571 <= _581;
        else
            _571 <= _568;
    end
    assign _58 = cfg_div_frac;
    assign _586 = { gnd,
                    _58 };
    assign vdd = 1'b1;
    assign _60 = clear;
    assign _62 = clock;
    assign _588 = _587[7:0];
    assign _589 = _584 ? _588 : _560;
    assign _590 = _557 ? _589 : _560;
    assign _592 = _84 ? _344 : _590;
    assign _63 = _592;
    always @(posedge _62) begin
        if (_60)
            _560 <= _344;
        else
            _560 <= _63;
    end
    assign _585 = { gnd,
                    _560 };
    assign _587 = _585 + _586;
    assign _593 = _587[8:8];
    assign _594 = _584 ? _593 : _565;
    assign _595 = _557 ? _594 : _565;
    assign _597 = _84 ? _249 : _595;
    assign _64 = _597;
    always @(posedge _62) begin
        if (_60)
            _565 <= _249;
        else
            _565 <= _64;
    end
    assign _576 = _565 ? _575 : _571;
    assign gnd = 1'b0;
    assign _562 = { gnd,
                    _129 };
    assign _577 = _562 == _576;
    assign _580 = _157 ? _579 : _577;
    assign _583 = _125 ? _582 : _580;
    assign _561 = ~ _75;
    assign _584 = _561 & _583;
    assign _606 = _584 ? _276 : _604;
    assign _556 = ~ _75;
    assign _554 = _94 & _120;
    assign _334 = _92 == _665;
    assign _553 = _96 | _334;
    assign _555 = _553 | _554;
    assign _557 = _555 & _556;
    assign _607 = _557 ? _606 : _129;
    assign _609 = _84 ? _276 : _607;
    assign _65 = _609;
    always @(posedge _62) begin
        if (_60)
            _129 <= _276;
        else
            _129 <= _65;
    end
    assign _136 = _129 < _135;
    assign _137 = ~ _136;
    assign _126 = _120 & _122;
    assign _138 = _126 & _137;
    assign _155 = _138 & _154;
    assign _157 = _155 & _156;
    assign _166 = _157 ? _165 : _158;
    assign _67 = cfg_code;
    assign _122 = _67 == _689;
    assign _123 = ~ _122;
    assign _94 = _92 == _682;
    assign _124 = _94 | _123;
    assign _119 = ~ _75;
    assign _115 = _69[7:7];
    assign _114 = _69[6:6];
    assign _113 = _69[5:5];
    assign _112 = _69[4:4];
    assign _111 = _69[3:3];
    assign _110 = _69[2:2];
    assign _109 = _69[1:1];
    assign _69 = pins_q;
    assign _108 = _69[0:0];
    always @* begin
        case (_73)
        0:
            _116 <= _108;
        1:
            _116 <= _109;
        2:
            _116 <= _110;
        3:
            _116 <= _111;
        4:
            _116 <= _112;
        5:
            _116 <= _113;
        6:
            _116 <= _114;
        default:
            _116 <= _115;
        endcase
    end
    assign _106 = _71[7:7];
    assign _105 = _71[6:6];
    assign _104 = _71[5:5];
    assign _103 = _71[4:4];
    assign _102 = _71[3:3];
    assign _101 = _71[2:2];
    assign _100 = _71[1:1];
    assign _71 = pins_s;
    assign _99 = _71[0:0];
    assign _73 = cfg_data_pin;
    always @* begin
        case (_73)
        0:
            _107 <= _99;
        1:
            _107 <= _100;
        2:
            _107 <= _101;
        3:
            _107 <= _102;
        4:
            _107 <= _103;
        5:
            _107 <= _104;
        6:
            _107 <= _105;
        default:
            _107 <= _106;
        endcase
    end
    assign _117 = _107 ^ _116;
    assign _118 = _77 & _117;
    assign _120 = _118 & _119;
    assign _125 = _120 & _124;
    assign _169 = _125 ? _168 : _166;
    assign _75 = cfg_clk_pin_en;
    assign _193 = _75 ? _192 : _169;
    assign _77 = cfg_dir;
    assign _98 = _96 & _77;
    assign _194 = _98 & _193;
    assign _669 = _194 ? _668 : _617;
    assign _671 = _82 ? _90 : _669;
    assign _79 = crc_cmd;
    assign _678 = _79 ? _677 : _671;
    assign _684 = _84 ? _683 : _678;
    assign _686 = _86 ? _90 : _684;
    assign _80 = _686;
    always @(posedge _62) begin
        if (_60)
            _92 <= _90;
        else
            _92 <= _80;
    end
    assign _96 = _92 == _689;
    assign _196 = _96 & _195;
    assign _197 = _196 & _22;
    assign _199 = _197 & _198;
    assign _203 = _199 & _202;
    assign _204 = _203 & _193;
    assign _209 = _204 & _208;
    assign _704 = _209 ? _253 : _702;
    assign _82 = end_;
    assign _706 = _82 ? _253 : _704;
    assign _84 = go;
    assign _708 = _84 ? _253 : _706;
    assign _86 = reset;
    assign _710 = _86 ? _253 : _708;
    assign _87 = _710;
    always @(posedge _62) begin
        if (_60)
            _206 <= vdd;
        else
            _206 <= _87;
    end
    assign out = _206;
    assign pop = _388;
    assign push = _380;
    assign push_data = _352;
    assign done_ = _334;
    assign crc_ok = _320;
    assign sync_hit = _273;
    assign error = _250;
    assign err_kind = _212;
    assign active = _97;

endmodule
