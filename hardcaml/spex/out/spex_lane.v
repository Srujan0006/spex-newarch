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
    active,
    lost
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
    output lost;

    wire _253;
    wire [2:0] _246;
    wire _247;
    wire _248;
    wire _101;
    wire _90;
    wire _91;
    wire _92;
    wire _102;
    wire _249;
    wire _254;
    wire _255;
    wire [2:0] _294;
    wire [2:0] _295;
    wire [2:0] _275;
    wire [2:0] _274;
    wire [2:0] _276;
    wire [2:0] _277;
    wire [2:0] _296;
    wire [2:0] _298;
    wire [2:0] _300;
    wire [2:0] _3;
    reg [2:0] _273;
    wire _302;
    wire _306;
    wire _307;
    wire _305;
    wire _308;
    wire _310;
    wire _312;
    wire _5;
    reg _303;
    wire [15:0] _328;
    wire [15:0] _8;
    wire [15:0] _10;
    wire [15:0] _318;
    wire [15:0] _319;
    wire [15:0] _320;
    wire [15:0] _322;
    wire [15:0] _11;
    reg [15:0] _315;
    wire [14:0] _316;
    wire [15:0] _317;
    wire [15:0] _326;
    wire [15:0] _327;
    wire _329;
    wire _331;
    wire _332;
    wire _333;
    wire _334;
    wire _336;
    wire _338;
    wire _12;
    reg _325;
    wire _351;
    wire _352;
    wire _354;
    wire _355;
    wire _356;
    wire _357;
    wire _359;
    wire _14;
    reg _341;
    wire _353;
    wire _365;
    wire [5:0] _363;
    wire _364;
    wire _366;
    wire _367;
    wire _368;
    wire _369;
    wire _370;
    wire _372;
    wire _374;
    wire _15;
    reg _362;
    wire [7:0] _383;
    wire [7:0] _384;
    wire _390;
    wire [2:0] _244;
    wire _236;
    wire _235;
    wire _237;
    wire _238;
    wire _239;
    wire [2:0] _245;
    wire _387;
    wire _388;
    wire _385;
    wire _389;
    wire _391;
    wire [2:0] _250;
    wire _251;
    wire _252;
    wire _392;
    wire _399;
    wire _398;
    wire _400;
    wire _428;
    wire _429;
    wire _21;
    reg _403;
    wire _710;
    wire _708;
    wire _709;
    reg _711;
    wire _712;
    wire _713;
    wire _705;
    wire [1:0] _701;
    wire _702;
    wire _699;
    wire _700;
    wire _703;
    wire _704;
    wire _706;
    wire _714;
    wire _268;
    wire _269;
    wire _262;
    wire _263;
    wire _259;
    wire _23;
    wire _256;
    wire [1:0] _94;
    wire [1:0] _694;
    wire _691;
    wire _692;
    wire [1:0] _695;
    wire _684;
    wire _685;
    wire _686;
    wire _687;
    wire [1:0] _689;
    wire [1:0] _677;
    wire [2:0] _670;
    wire [2:0] _667;
    wire _663;
    wire _661;
    wire _662;
    wire _664;
    wire [2:0] _668;
    wire _659;
    wire [2:0] _671;
    wire _672;
    wire [2:0] _653;
    wire _649;
    wire _647;
    wire _648;
    wire _650;
    wire [2:0] _654;
    wire _645;
    wire [2:0] _656;
    wire _657;
    wire _673;
    wire _674;
    wire _675;
    wire _641;
    wire [5:0] _638;
    wire _639;
    wire _642;
    wire [15:0] _633;
    wire [15:0] _634;
    wire _635;
    wire _632;
    wire _636;
    wire _630;
    wire _631;
    wire _637;
    wire _643;
    wire _676;
    wire [1:0] _678;
    wire [1:0] _680;
    wire [2:0] _25;
    wire [2:0] _558;
    wire [2:0] _559;
    wire [2:0] _554;
    wire _550;
    wire _548;
    wire _549;
    wire _551;
    wire [2:0] _555;
    wire _546;
    wire [2:0] _560;
    wire [2:0] _561;
    wire [2:0] _540;
    wire [2:0] _541;
    wire [2:0] _536;
    wire _424;
    wire _423;
    wire _422;
    wire _421;
    wire _420;
    wire _419;
    wire _418;
    wire _414;
    wire _413;
    wire _412;
    wire _411;
    wire _410;
    wire _409;
    wire _408;
    wire [7:0] _404;
    wire [7:0] _27;
    wire _29;
    wire [7:0] _405;
    wire [7:0] _376;
    wire [6:0] _380;
    wire [7:0] _381;
    wire [6:0] _378;
    wire [7:0] _379;
    wire [7:0] _382;
    wire [7:0] _434;
    wire [7:0] _435;
    wire [7:0] _436;
    wire [7:0] _430;
    wire [7:0] _431;
    wire [7:0] _432;
    wire [7:0] _433;
    wire [7:0] _437;
    wire [7:0] _30;
    reg [7:0] _377;
    wire _396;
    wire _393;
    wire _394;
    wire _397;
    wire [7:0] _406;
    wire _407;
    wire [7:0] _415;
    wire _32;
    wire [7:0] _416;
    wire _417;
    wire [2:0] _445;
    wire [2:0] _446;
    wire [2:0] _447;
    wire [2:0] _448;
    wire [2:0] _439;
    wire [2:0] _440;
    wire [2:0] _441;
    wire [2:0] _442;
    wire [2:0] _443;
    wire [2:0] _449;
    wire [2:0] _451;
    wire [2:0] _33;
    reg [2:0] _242;
    reg _425;
    wire _35;
    wire [31:0] _347;
    wire [31:0] _37;
    wire [30:0] _491;
    wire [31:0] _493;
    wire _485;
    wire _486;
    wire [31:0] _488;
    wire [30:0] _482;
    wire [31:0] _484;
    wire [31:0] _489;
    wire [31:0] _490;
    wire [5:0] _39;
    wire [5:0] _459;
    wire [5:0] _460;
    wire [5:0] _461;
    wire [5:0] _462;
    wire [5:0] _453;
    wire [5:0] _454;
    wire [5:0] _455;
    wire [5:0] _456;
    wire [5:0] _457;
    wire [5:0] _463;
    wire [5:0] _464;
    wire [5:0] _466;
    wire [5:0] _40;
    reg [5:0] _230;
    wire _232;
    wire _233;
    wire _343;
    wire _342;
    wire _344;
    wire _345;
    wire [31:0] _494;
    wire [31:0] _495;
    wire [31:0] _496;
    wire [31:0] _42;
    wire _473;
    wire _474;
    wire [31:0] _476;
    wire [30:0] _470;
    wire [31:0] _472;
    wire [31:0] _477;
    wire [30:0] _467;
    wire [31:0] _469;
    wire [31:0] _478;
    wire [31:0] _479;
    wire [31:0] _480;
    wire [31:0] _481;
    wire [31:0] _497;
    wire [31:0] _498;
    wire [31:0] _500;
    wire [31:0] _43;
    reg [31:0] _348;
    wire _349;
    wire _350;
    wire [15:0] _45;
    wire [15:0] _520;
    wire _211;
    wire _216;
    wire [15:0] _521;
    wire _210;
    wire [15:0] _522;
    wire _503;
    wire _501;
    wire _502;
    wire _504;
    wire _506;
    wire _46;
    reg _288;
    wire _289;
    wire _285;
    wire _290;
    wire _508;
    wire _509;
    wire _510;
    wire _512;
    wire _47;
    reg _281;
    wire _282;
    wire _279;
    wire _283;
    wire _291;
    wire _292;
    wire _293;
    wire [15:0] _523;
    wire [15:0] _514;
    wire [15:0] _515;
    wire [15:0] _516;
    wire [15:0] _517;
    wire [15:0] _518;
    wire [15:0] _524;
    wire [15:0] _526;
    wire [15:0] _48;
    reg [15:0] _214;
    wire _215;
    wire _426;
    wire _427;
    wire _532;
    wire _530;
    wire _531;
    wire _533;
    wire [2:0] _537;
    wire _528;
    wire [2:0] _542;
    wire [2:0] _543;
    wire [2:0] _544;
    wire [2:0] _562;
    wire [2:0] _564;
    wire [2:0] _49;
    reg [2:0] _207;
    wire _208;
    wire [1:0] _51;
    wire _203;
    wire _204;
    wire _209;
    wire _227;
    wire _234;
    wire [1:0] _626;
    wire _622;
    wire [1:0] _624;
    wire _222;
    wire _220;
    wire _223;
    wire _224;
    wire _225;
    wire _217;
    wire _218;
    wire _226;
    wire [1:0] _627;
    wire [1:0] _629;
    wire _197;
    wire _198;
    wire _193;
    wire _192;
    wire _191;
    wire _190;
    wire _189;
    wire _188;
    wire _187;
    wire _186;
    reg _194;
    wire _195;
    wire _184;
    wire _183;
    wire _182;
    wire _181;
    wire _180;
    wire _179;
    wire _178;
    wire _177;
    wire [2:0] _53;
    reg _185;
    wire _196;
    wire _55;
    wire _199;
    wire _175;
    wire _172;
    wire _165;
    wire _163;
    wire [13:0] _154;
    wire [15:0] _155;
    wire [14:0] _151;
    wire [15:0] _152;
    wire [15:0] _156;
    wire [14:0] _148;
    wire [15:0] _149;
    wire _146;
    wire [15:0] _157;
    reg [15:0] _160;
    wire _161;
    wire [13:0] _138;
    wire [15:0] _139;
    reg [15:0] _142;
    wire _610;
    wire _611;
    wire [15:0] _612;
    wire [15:0] _614;
    wire [15:0] _616;
    wire [16:0] _593;
    wire _594;
    wire [14:0] _167;
    wire [15:0] _168;
    reg [15:0] _171;
    wire [16:0] _590;
    wire _591;
    wire [16:0] _584;
    reg [16:0] _587;
    wire [16:0] _579;
    wire [15:0] _57;
    wire [16:0] _578;
    wire [16:0] _580;
    reg [16:0] _583;
    wire [7:0] _59;
    wire [8:0] _598;
    wire vdd;
    wire _61;
    wire _63;
    wire [7:0] _600;
    wire [7:0] _601;
    wire [7:0] _602;
    wire [7:0] _604;
    wire [7:0] _64;
    reg [7:0] _572;
    wire [8:0] _597;
    wire [8:0] _599;
    wire _605;
    wire _606;
    wire _607;
    wire _609;
    wire _65;
    reg _577;
    wire [16:0] _588;
    wire gnd;
    wire [16:0] _574;
    wire _589;
    wire _592;
    wire _595;
    wire _573;
    wire _596;
    wire [15:0] _618;
    wire _568;
    wire _566;
    wire _100;
    wire _565;
    wire _567;
    wire _569;
    wire [15:0] _619;
    wire [15:0] _621;
    wire [15:0] _66;
    reg [15:0] _136;
    wire _143;
    wire _144;
    wire _133;
    wire _145;
    wire _162;
    wire _164;
    wire _173;
    wire [1:0] _68;
    wire _129;
    wire _130;
    wire _127;
    wire _131;
    wire _124;
    wire _120;
    wire _119;
    wire _118;
    wire _117;
    wire _116;
    wire _115;
    wire _114;
    wire [7:0] _70;
    wire _113;
    reg _121;
    wire _111;
    wire _110;
    wire _109;
    wire _108;
    wire _107;
    wire _106;
    wire _105;
    wire [7:0] _72;
    wire _104;
    wire [2:0] _74;
    reg _112;
    wire _122;
    wire _123;
    wire _125;
    wire _132;
    wire _176;
    wire _76;
    wire _200;
    wire _78;
    wire _103;
    wire _201;
    wire [1:0] _681;
    wire [1:0] _683;
    wire _80;
    wire [1:0] _690;
    wire [1:0] _696;
    wire [1:0] _698;
    wire [1:0] _81;
    reg [1:0] _96;
    wire _98;
    wire _257;
    wire _258;
    wire _260;
    wire _264;
    wire _265;
    wire _270;
    wire _716;
    wire _83;
    wire _718;
    wire _85;
    wire _720;
    wire _87;
    wire _722;
    wire _88;
    reg _267;
    assign _253 = ~ _252;
    assign _246 = 3'b000;
    assign _247 = _245 == _246;
    assign _248 = ~ _247;
    assign _101 = _98 | _100;
    assign _90 = ~ _83;
    assign _91 = _87 & _90;
    assign _92 = _91 & _78;
    assign _102 = _92 & _101;
    assign _249 = _102 & _248;
    assign _254 = _249 & _253;
    assign _255 = _127 | _98;
    assign _294 = 3'b001;
    assign _295 = _293 ? _294 : _277;
    assign _275 = 3'b100;
    assign _274 = 3'b010;
    assign _276 = _267 ? _275 : _274;
    assign _277 = _270 ? _276 : _273;
    assign _296 = _201 ? _295 : _277;
    assign _298 = _85 ? _246 : _296;
    assign _300 = _87 ? _246 : _298;
    assign _3 = _300;
    always @(posedge _63) begin
        if (_61)
            _273 <= _246;
        else
            _273 <= _3;
    end
    assign _302 = 1'b0;
    assign _306 = 1'b1;
    assign _307 = _293 ? _306 : _305;
    assign _305 = _270 ? _306 : _303;
    assign _308 = _201 ? _307 : _305;
    assign _310 = _85 ? _302 : _308;
    assign _312 = _87 ? _302 : _310;
    assign _5 = _312;
    always @(posedge _63) begin
        if (_61)
            _303 <= _302;
        else
            _303 <= _5;
    end
    assign _328 = 16'b0000000000000000;
    assign _8 = cfg_sync_mask;
    assign _10 = cfg_sync;
    assign _318 = _210 ? _317 : _315;
    assign _319 = _293 ? _315 : _318;
    assign _320 = _201 ? _319 : _315;
    assign _322 = _85 ? _328 : _320;
    assign _11 = _322;
    always @(posedge _63) begin
        if (_61)
            _315 <= _328;
        else
            _315 <= _11;
    end
    assign _316 = _315[14:0];
    assign _317 = { _316,
                    _283 };
    assign _326 = _317 ^ _10;
    assign _327 = _326 & _8;
    assign _329 = _327 == _328;
    assign _331 = _329 ? _306 : _325;
    assign _332 = _210 ? _331 : _325;
    assign _333 = _293 ? _325 : _332;
    assign _334 = _201 ? _333 : _325;
    assign _336 = _85 ? _302 : _334;
    assign _338 = _87 ? _302 : _336;
    assign _12 = _338;
    always @(posedge _63) begin
        if (_61)
            _325 <= _302;
        else
            _325 <= _12;
    end
    assign _351 = _283 == _350;
    assign _352 = ~ _351;
    assign _354 = _345 ? _353 : _341;
    assign _355 = _210 ? _354 : _341;
    assign _356 = _293 ? _341 : _355;
    assign _357 = _201 ? _356 : _341;
    assign _359 = _85 ? _302 : _357;
    assign _14 = _359;
    always @(posedge _63) begin
        if (_61)
            _341 <= _302;
        else
            _341 <= _14;
    end
    assign _353 = _341 | _352;
    assign _365 = ~ _353;
    assign _363 = 6'b000001;
    assign _364 = _230 == _363;
    assign _366 = _364 ? _365 : _362;
    assign _367 = _345 ? _366 : _362;
    assign _368 = _210 ? _367 : _362;
    assign _369 = _293 ? _362 : _368;
    assign _370 = _201 ? _369 : _362;
    assign _372 = _85 ? _302 : _370;
    assign _374 = _87 ? _302 : _372;
    assign _15 = _374;
    always @(posedge _63) begin
        if (_61)
            _362 <= _302;
        else
            _362 <= _15;
    end
    assign _383 = _216 ? _382 : _377;
    assign _384 = _252 ? _382 : _383;
    assign _390 = ~ _252;
    assign _244 = _242 + _294;
    assign _236 = ~ _209;
    assign _235 = _226 & _234;
    assign _237 = _235 & _236;
    assign _238 = _237 & _215;
    assign _239 = _216 | _238;
    assign _245 = _239 ? _244 : _242;
    assign _387 = _245 == _246;
    assign _388 = ~ _387;
    assign _385 = _83 & _78;
    assign _389 = _385 & _388;
    assign _391 = _389 & _390;
    assign _250 = 3'b111;
    assign _251 = _242 == _250;
    assign _252 = _216 & _251;
    assign _392 = _252 | _391;
    assign _399 = ~ _29;
    assign _398 = _226 & _397;
    assign _400 = _398 & _399;
    assign _428 = _234 ? _427 : _403;
    assign _429 = _226 ? _428 : _403;
    assign _21 = _429;
    always @(posedge _63) begin
        if (_61)
            _403 <= _302;
        else
            _403 <= _21;
    end
    assign _710 = ~ _427;
    assign _708 = ~ _267;
    assign _709 = _427 ? _267 : _708;
    always @* begin
        case (_68)
        0:
            _711 <= _427;
        1:
            _711 <= _709;
        2:
            _711 <= _710;
        default:
            _711 <= _427;
        endcase
    end
    assign _712 = _234 ? _711 : _306;
    assign _713 = _226 ? _712 : _267;
    assign _705 = ~ _225;
    assign _701 = 2'b10;
    assign _702 = _68 == _701;
    assign _699 = ~ _78;
    assign _700 = _98 & _699;
    assign _703 = _700 & _702;
    assign _704 = _703 & _200;
    assign _706 = _704 & _705;
    assign _714 = _706 ? _403 : _713;
    assign _268 = _112 == _267;
    assign _269 = ~ _268;
    assign _262 = _68 == _701;
    assign _263 = ~ _262;
    assign _259 = ~ _76;
    assign _23 = cfg_readback;
    assign _256 = ~ _78;
    assign _94 = 2'b00;
    assign _694 = 2'b01;
    assign _691 = ~ _76;
    assign _692 = _78 & _691;
    assign _695 = _692 ? _694 : _701;
    assign _684 = ~ _234;
    assign _685 = _226 & _684;
    assign _686 = _100 | _685;
    assign _687 = _686 | _676;
    assign _689 = _687 ? _701 : _683;
    assign _677 = 2'b11;
    assign _670 = _207 + _294;
    assign _667 = _207 + _294;
    assign _663 = vdd == _288;
    assign _661 = _207 == _246;
    assign _662 = ~ _661;
    assign _664 = _662 & _663;
    assign _668 = _664 ? _667 : _294;
    assign _659 = _51 == _701;
    assign _671 = _659 ? _670 : _668;
    assign _672 = _671 == _25;
    assign _653 = _207 + _294;
    assign _649 = gnd == _288;
    assign _647 = _207 == _246;
    assign _648 = ~ _647;
    assign _650 = _648 & _649;
    assign _654 = _650 ? _653 : _294;
    assign _645 = _51 == _701;
    assign _656 = _645 ? _246 : _654;
    assign _657 = _656 == _25;
    assign _673 = _283 ? _672 : _657;
    assign _674 = _204 & _673;
    assign _675 = ~ _674;
    assign _641 = _230 == _363;
    assign _638 = 6'b000000;
    assign _639 = _230 == _638;
    assign _642 = _345 ? _641 : _639;
    assign _633 = 16'b0000000000000001;
    assign _634 = _214 + _633;
    assign _635 = _634 == _45;
    assign _632 = _214 == _45;
    assign _636 = _216 ? _635 : _632;
    assign _630 = ~ _293;
    assign _631 = _201 & _630;
    assign _637 = _631 & _636;
    assign _643 = _637 & _642;
    assign _676 = _643 & _675;
    assign _678 = _676 ? _677 : _629;
    assign _680 = _293 ? _94 : _678;
    assign _25 = cfg_stuff_len;
    assign _558 = _207 + _294;
    assign _559 = _283 ? _558 : _246;
    assign _554 = _207 + _294;
    assign _550 = _283 == _288;
    assign _548 = _207 == _246;
    assign _549 = ~ _548;
    assign _551 = _549 & _550;
    assign _555 = _551 ? _554 : _294;
    assign _546 = _51 == _701;
    assign _560 = _546 ? _559 : _555;
    assign _561 = _293 ? _544 : _560;
    assign _540 = _207 + _294;
    assign _541 = _427 ? _540 : _246;
    assign _536 = _207 + _294;
    assign _424 = _416[7:7];
    assign _423 = _416[6:6];
    assign _422 = _416[5:5];
    assign _421 = _416[4:4];
    assign _420 = _416[3:3];
    assign _419 = _416[2:2];
    assign _418 = _416[1:1];
    assign _414 = _406[7:7];
    assign _413 = _406[6:6];
    assign _412 = _406[5:5];
    assign _411 = _406[4:4];
    assign _410 = _406[3:3];
    assign _409 = _406[2:2];
    assign _408 = _406[1:1];
    assign _404 = 8'b11111111;
    assign _27 = tx_head;
    assign _29 = tx_empty;
    assign _405 = _29 ? _404 : _27;
    assign _376 = 8'b00000000;
    assign _380 = _377[7:1];
    assign _381 = { _283,
                    _380 };
    assign _378 = _377[6:0];
    assign _379 = { _378,
                    _283 };
    assign _382 = _32 ? _381 : _379;
    assign _434 = _216 ? _382 : _433;
    assign _435 = _210 ? _434 : _433;
    assign _436 = _293 ? _433 : _435;
    assign _430 = _215 ? _406 : _377;
    assign _431 = _209 ? _377 : _430;
    assign _432 = _234 ? _431 : _377;
    assign _433 = _226 ? _432 : _377;
    assign _437 = _201 ? _436 : _433;
    assign _30 = _437;
    always @(posedge _63) begin
        if (_61)
            _377 <= _376;
        else
            _377 <= _30;
    end
    assign _396 = _242 == _246;
    assign _393 = ~ _209;
    assign _394 = _393 & _215;
    assign _397 = _394 & _396;
    assign _406 = _397 ? _405 : _377;
    assign _407 = _406[0:0];
    assign _415 = { _407,
                    _408,
                    _409,
                    _410,
                    _411,
                    _412,
                    _413,
                    _414 };
    assign _32 = cfg_lsb_first;
    assign _416 = _32 ? _406 : _415;
    assign _417 = _416[0:0];
    assign _445 = _242 + _294;
    assign _446 = _216 ? _445 : _443;
    assign _447 = _210 ? _446 : _443;
    assign _448 = _293 ? _443 : _447;
    assign _439 = _242 + _294;
    assign _440 = _215 ? _439 : _242;
    assign _441 = _209 ? _242 : _440;
    assign _442 = _234 ? _441 : _242;
    assign _443 = _226 ? _442 : _242;
    assign _449 = _201 ? _448 : _443;
    assign _451 = _85 ? _246 : _449;
    assign _33 = _451;
    always @(posedge _63) begin
        if (_61)
            _242 <= _246;
        else
            _242 <= _33;
    end
    always @* begin
        case (_242)
        0:
            _425 <= _417;
        1:
            _425 <= _418;
        2:
            _425 <= _419;
        3:
            _425 <= _420;
        4:
            _425 <= _421;
        5:
            _425 <= _422;
        6:
            _425 <= _423;
        default:
            _425 <= _424;
        endcase
    end
    assign _35 = cfg_crc_inv;
    assign _347 = 32'b00000000000000000000000000000000;
    assign _37 = cfg_init;
    assign _491 = _348[30:0];
    assign _493 = { _491,
                    _302 };
    assign _485 = _348[31:31];
    assign _486 = _283 ^ _485;
    assign _488 = _486 ? _42 : _347;
    assign _482 = _348[30:0];
    assign _484 = { _482,
                    _302 };
    assign _489 = _484 ^ _488;
    assign _490 = _216 ? _489 : _481;
    assign _39 = cfg_crc_width;
    assign _459 = _230 - _363;
    assign _460 = _345 ? _459 : _457;
    assign _461 = _210 ? _460 : _457;
    assign _462 = _293 ? _457 : _461;
    assign _453 = _230 - _363;
    assign _454 = _215 ? _230 : _453;
    assign _455 = _209 ? _230 : _454;
    assign _456 = _234 ? _455 : _230;
    assign _457 = _226 ? _456 : _230;
    assign _463 = _201 ? _462 : _457;
    assign _464 = _80 ? _39 : _463;
    assign _466 = _85 ? _638 : _464;
    assign _40 = _466;
    always @(posedge _63) begin
        if (_61)
            _230 <= _638;
        else
            _230 <= _40;
    end
    assign _232 = _230 == _638;
    assign _233 = ~ _232;
    assign _343 = ~ _215;
    assign _342 = _201 & _210;
    assign _344 = _342 & _343;
    assign _345 = _344 & _233;
    assign _494 = _345 ? _493 : _490;
    assign _495 = _210 ? _494 : _481;
    assign _496 = _293 ? _481 : _495;
    assign _42 = cfg_poly;
    assign _473 = _348[31:31];
    assign _474 = _427 ^ _473;
    assign _476 = _474 ? _42 : _347;
    assign _470 = _348[30:0];
    assign _472 = { _470,
                    _302 };
    assign _477 = _472 ^ _476;
    assign _467 = _348[30:0];
    assign _469 = { _467,
                    _302 };
    assign _478 = _215 ? _477 : _469;
    assign _479 = _209 ? _348 : _478;
    assign _480 = _234 ? _479 : _348;
    assign _481 = _226 ? _480 : _348;
    assign _497 = _201 ? _496 : _481;
    assign _498 = _85 ? _37 : _497;
    assign _500 = _87 ? _347 : _498;
    assign _43 = _500;
    always @(posedge _63) begin
        if (_61)
            _348 <= _347;
        else
            _348 <= _43;
    end
    assign _349 = _348[31:31];
    assign _350 = _349 ^ _35;
    assign _45 = cfg_frame_bits;
    assign _520 = _214 + _633;
    assign _211 = _201 & _210;
    assign _216 = _211 & _215;
    assign _521 = _216 ? _520 : _518;
    assign _210 = ~ _209;
    assign _522 = _210 ? _521 : _518;
    assign _503 = _293 ? _502 : _283;
    assign _501 = _234 ? _427 : _288;
    assign _502 = _226 ? _501 : _288;
    assign _504 = _201 ? _503 : _502;
    assign _506 = _85 ? _306 : _504;
    assign _46 = _506;
    always @(posedge _63) begin
        if (_61)
            _288 <= vdd;
        else
            _288 <= _46;
    end
    assign _289 = ~ _288;
    assign _285 = _51 == _694;
    assign _290 = _285 ? _289 : gnd;
    assign _508 = _68 == _694;
    assign _509 = _508 ? _112 : _281;
    assign _510 = _201 ? _509 : _281;
    assign _512 = _85 ? _306 : _510;
    assign _47 = _512;
    always @(posedge _63) begin
        if (_61)
            _281 <= vdd;
        else
            _281 <= _47;
    end
    assign _282 = _112 == _281;
    assign _279 = _68 == _694;
    assign _283 = _279 ? _282 : _112;
    assign _291 = _283 == _290;
    assign _292 = ~ _291;
    assign _293 = _209 & _292;
    assign _523 = _293 ? _518 : _522;
    assign _514 = _214 + _633;
    assign _515 = _215 ? _514 : _214;
    assign _516 = _209 ? _214 : _515;
    assign _517 = _234 ? _516 : _214;
    assign _518 = _226 ? _517 : _214;
    assign _524 = _201 ? _523 : _518;
    assign _526 = _85 ? _328 : _524;
    assign _48 = _526;
    always @(posedge _63) begin
        if (_61)
            _214 <= _328;
        else
            _214 <= _48;
    end
    assign _215 = _214 < _45;
    assign _426 = _215 ? _425 : _350;
    assign _427 = _209 ? _290 : _426;
    assign _532 = _427 == _288;
    assign _530 = _207 == _246;
    assign _531 = ~ _530;
    assign _533 = _531 & _532;
    assign _537 = _533 ? _536 : _294;
    assign _528 = _51 == _701;
    assign _542 = _528 ? _541 : _537;
    assign _543 = _234 ? _542 : _207;
    assign _544 = _226 ? _543 : _207;
    assign _562 = _201 ? _561 : _544;
    assign _564 = _85 ? _246 : _562;
    assign _49 = _564;
    always @(posedge _63) begin
        if (_61)
            _207 <= _246;
        else
            _207 <= _49;
    end
    assign _208 = _207 == _25;
    assign _51 = cfg_stuff;
    assign _203 = _51 == _94;
    assign _204 = ~ _203;
    assign _209 = _204 & _208;
    assign _227 = _209 | _215;
    assign _234 = _227 | _233;
    assign _626 = _234 ? _624 : _677;
    assign _622 = _127 & _125;
    assign _624 = _622 ? _701 : _96;
    assign _222 = _171 == _328;
    assign _220 = _136 == _328;
    assign _223 = _164 ? _222 : _220;
    assign _224 = _132 ? vdd : _223;
    assign _225 = _76 ? _199 : _224;
    assign _217 = ~ _78;
    assign _218 = _98 & _217;
    assign _226 = _218 & _225;
    assign _627 = _226 ? _626 : _624;
    assign _629 = _270 ? _94 : _627;
    assign _197 = ~ _185;
    assign _198 = _194 & _197;
    assign _193 = _70[7:7];
    assign _192 = _70[6:6];
    assign _191 = _70[5:5];
    assign _190 = _70[4:4];
    assign _189 = _70[3:3];
    assign _188 = _70[2:2];
    assign _187 = _70[1:1];
    assign _186 = _70[0:0];
    always @* begin
        case (_53)
        0:
            _194 <= _186;
        1:
            _194 <= _187;
        2:
            _194 <= _188;
        3:
            _194 <= _189;
        4:
            _194 <= _190;
        5:
            _194 <= _191;
        6:
            _194 <= _192;
        default:
            _194 <= _193;
        endcase
    end
    assign _195 = ~ _194;
    assign _184 = _72[7:7];
    assign _183 = _72[6:6];
    assign _182 = _72[5:5];
    assign _181 = _72[4:4];
    assign _180 = _72[3:3];
    assign _179 = _72[2:2];
    assign _178 = _72[1:1];
    assign _177 = _72[0:0];
    assign _53 = cfg_clk_pin;
    always @* begin
        case (_53)
        0:
            _185 <= _177;
        1:
            _185 <= _178;
        2:
            _185 <= _179;
        3:
            _185 <= _180;
        4:
            _185 <= _181;
        5:
            _185 <= _182;
        6:
            _185 <= _183;
        default:
            _185 <= _184;
        endcase
    end
    assign _196 = _185 & _195;
    assign _55 = cfg_clk_edge;
    assign _199 = _55 ? _198 : _196;
    assign _175 = _160 == _328;
    assign _172 = _171 == _160;
    assign _165 = _136 == _160;
    assign _163 = ~ _127;
    assign _154 = _57[15:2];
    assign _155 = { _94,
                    _154 };
    assign _151 = _57[15:1];
    assign _152 = { _302,
                    _151 };
    assign _156 = _152 + _155;
    assign _148 = _57[15:1];
    assign _149 = { _302,
                    _148 };
    assign _146 = _78 & _129;
    assign _157 = _146 ? _156 : _149;
    always @(posedge _63) begin
        if (_61)
            _160 <= _328;
        else
            _160 <= _157;
    end
    assign _161 = _136 < _160;
    assign _138 = _57[15:2];
    assign _139 = { _94,
                    _138 };
    always @(posedge _63) begin
        if (_61)
            _142 <= _328;
        else
            _142 <= _139;
    end
    assign _610 = ~ _127;
    assign _611 = _162 & _610;
    assign _612 = _611 ? _171 : _136;
    assign _614 = _132 ? _328 : _612;
    assign _616 = _614 + _633;
    assign _593 = 17'b00000000000000000;
    assign _594 = _588 == _593;
    assign _167 = _57[15:1];
    assign _168 = { _302,
                    _167 };
    always @(posedge _63) begin
        if (_61)
            _171 <= _328;
        else
            _171 <= _168;
    end
    assign _590 = { gnd,
                    _171 };
    assign _591 = _590 == _588;
    assign _584 = { gnd,
                    _57 };
    always @(posedge _63) begin
        if (_61)
            _587 <= _593;
        else
            _587 <= _584;
    end
    assign _579 = 17'b00000000000000001;
    assign _57 = cfg_div_int;
    assign _578 = { gnd,
                    _57 };
    assign _580 = _578 - _579;
    always @(posedge _63) begin
        if (_61)
            _583 <= _593;
        else
            _583 <= _580;
    end
    assign _59 = cfg_div_frac;
    assign _598 = { gnd,
                    _59 };
    assign vdd = 1'b1;
    assign _61 = clear;
    assign _63 = clock;
    assign _600 = _599[7:0];
    assign _601 = _596 ? _600 : _572;
    assign _602 = _569 ? _601 : _572;
    assign _604 = _85 ? _376 : _602;
    assign _64 = _604;
    always @(posedge _63) begin
        if (_61)
            _572 <= _376;
        else
            _572 <= _64;
    end
    assign _597 = { gnd,
                    _572 };
    assign _599 = _597 + _598;
    assign _605 = _599[8:8];
    assign _606 = _596 ? _605 : _577;
    assign _607 = _569 ? _606 : _577;
    assign _609 = _85 ? _302 : _607;
    assign _65 = _609;
    always @(posedge _63) begin
        if (_61)
            _577 <= _302;
        else
            _577 <= _65;
    end
    assign _588 = _577 ? _587 : _583;
    assign gnd = 1'b0;
    assign _574 = { gnd,
                    _136 };
    assign _589 = _574 == _588;
    assign _592 = _164 ? _591 : _589;
    assign _595 = _132 ? _594 : _592;
    assign _573 = ~ _76;
    assign _596 = _573 & _595;
    assign _618 = _596 ? _328 : _616;
    assign _568 = ~ _76;
    assign _566 = _127 & _125;
    assign _100 = _96 == _677;
    assign _565 = _98 | _100;
    assign _567 = _565 | _566;
    assign _569 = _567 & _568;
    assign _619 = _569 ? _618 : _136;
    assign _621 = _85 ? _328 : _619;
    assign _66 = _621;
    always @(posedge _63) begin
        if (_61)
            _136 <= _328;
        else
            _136 <= _66;
    end
    assign _143 = _136 < _142;
    assign _144 = ~ _143;
    assign _133 = _125 & _129;
    assign _145 = _133 & _144;
    assign _162 = _145 & _161;
    assign _164 = _162 & _163;
    assign _173 = _164 ? _172 : _165;
    assign _68 = cfg_code;
    assign _129 = _68 == _701;
    assign _130 = ~ _129;
    assign _127 = _96 == _694;
    assign _131 = _127 | _130;
    assign _124 = ~ _76;
    assign _120 = _70[7:7];
    assign _119 = _70[6:6];
    assign _118 = _70[5:5];
    assign _117 = _70[4:4];
    assign _116 = _70[3:3];
    assign _115 = _70[2:2];
    assign _114 = _70[1:1];
    assign _70 = pins_q;
    assign _113 = _70[0:0];
    always @* begin
        case (_74)
        0:
            _121 <= _113;
        1:
            _121 <= _114;
        2:
            _121 <= _115;
        3:
            _121 <= _116;
        4:
            _121 <= _117;
        5:
            _121 <= _118;
        6:
            _121 <= _119;
        default:
            _121 <= _120;
        endcase
    end
    assign _111 = _72[7:7];
    assign _110 = _72[6:6];
    assign _109 = _72[5:5];
    assign _108 = _72[4:4];
    assign _107 = _72[3:3];
    assign _106 = _72[2:2];
    assign _105 = _72[1:1];
    assign _72 = pins_s;
    assign _104 = _72[0:0];
    assign _74 = cfg_data_pin;
    always @* begin
        case (_74)
        0:
            _112 <= _104;
        1:
            _112 <= _105;
        2:
            _112 <= _106;
        3:
            _112 <= _107;
        4:
            _112 <= _108;
        5:
            _112 <= _109;
        6:
            _112 <= _110;
        default:
            _112 <= _111;
        endcase
    end
    assign _122 = _112 ^ _121;
    assign _123 = _78 & _122;
    assign _125 = _123 & _124;
    assign _132 = _125 & _131;
    assign _176 = _132 ? _175 : _173;
    assign _76 = cfg_clk_pin_en;
    assign _200 = _76 ? _199 : _176;
    assign _78 = cfg_dir;
    assign _103 = _98 & _78;
    assign _201 = _103 & _200;
    assign _681 = _201 ? _680 : _629;
    assign _683 = _83 ? _94 : _681;
    assign _80 = crc_cmd;
    assign _690 = _80 ? _689 : _683;
    assign _696 = _85 ? _695 : _690;
    assign _698 = _87 ? _94 : _696;
    assign _81 = _698;
    always @(posedge _63) begin
        if (_61)
            _96 <= _94;
        else
            _96 <= _81;
    end
    assign _98 = _96 == _701;
    assign _257 = _98 & _256;
    assign _258 = _257 & _23;
    assign _260 = _258 & _259;
    assign _264 = _260 & _263;
    assign _265 = _264 & _200;
    assign _270 = _265 & _269;
    assign _716 = _270 ? _306 : _714;
    assign _83 = end_;
    assign _718 = _83 ? _306 : _716;
    assign _85 = go;
    assign _720 = _85 ? _306 : _718;
    assign _87 = reset;
    assign _722 = _87 ? _306 : _720;
    assign _88 = _722;
    always @(posedge _63) begin
        if (_61)
            _267 <= vdd;
        else
            _267 <= _88;
    end
    assign out = _267;
    assign pop = _400;
    assign push = _392;
    assign push_data = _384;
    assign done_ = _100;
    assign crc_ok = _362;
    assign sync_hit = _325;
    assign error = _303;
    assign err_kind = _273;
    assign active = _255;
    assign lost = _254;

endmodule
