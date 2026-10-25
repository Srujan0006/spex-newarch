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
    err_kind
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

    wire [2:0] _209;
    wire [2:0] _239;
    wire [2:0] _240;
    wire [2:0] _212;
    wire [2:0] _211;
    wire [2:0] _213;
    wire [2:0] _214;
    wire [2:0] _241;
    wire [2:0] _243;
    wire [2:0] _245;
    wire [2:0] _1;
    reg [2:0] _210;
    wire _247;
    wire _251;
    wire _252;
    wire _250;
    wire _253;
    wire _255;
    wire _257;
    wire _3;
    reg _248;
    wire [15:0] _274;
    wire [15:0] _6;
    wire [15:0] _8;
    wire [15:0] _264;
    wire [15:0] _265;
    wire [15:0] _266;
    wire [15:0] _268;
    wire [15:0] _9;
    reg [15:0] _260;
    wire [14:0] _262;
    wire [15:0] _263;
    wire [15:0] _272;
    wire [15:0] _273;
    wire _275;
    wire _277;
    wire _278;
    wire _279;
    wire _280;
    wire _282;
    wire _284;
    wire _10;
    reg _271;
    wire _307;
    wire _308;
    wire _310;
    wire _311;
    wire _312;
    wire _313;
    wire _315;
    wire _12;
    reg _287;
    wire _309;
    wire _321;
    wire [5:0] _319;
    wire _320;
    wire _322;
    wire _323;
    wire _324;
    wire _325;
    wire _326;
    wire _328;
    wire _330;
    wire _13;
    reg _318;
    wire [7:0] _349;
    wire [7:0] _350;
    wire _376;
    wire [2:0] _370;
    wire _365;
    wire _364;
    wire _366;
    wire _367;
    wire _368;
    wire [2:0] _371;
    wire _373;
    wire _374;
    wire _351;
    wire _375;
    wire _377;
    wire [2:0] _338;
    wire _339;
    wire _340;
    wire _378;
    wire _385;
    wire _384;
    wire _386;
    wire _414;
    wire _415;
    wire _19;
    reg _389;
    wire _696;
    wire _694;
    wire _695;
    reg _697;
    wire _698;
    wire _699;
    wire _691;
    wire [1:0] _687;
    wire _688;
    wire _685;
    wire _686;
    wire _689;
    wire _690;
    wire _692;
    wire _700;
    wire _205;
    wire _206;
    wire _199;
    wire _200;
    wire _196;
    wire _21;
    wire _193;
    wire [1:0] _89;
    wire [1:0] _680;
    wire _677;
    wire _678;
    wire [1:0] _681;
    wire _670;
    wire _671;
    wire _672;
    wire _673;
    wire [1:0] _675;
    wire [1:0] _663;
    wire [2:0] _656;
    wire [2:0] _653;
    wire _649;
    wire _647;
    wire _648;
    wire _650;
    wire [2:0] _654;
    wire _645;
    wire [2:0] _657;
    wire _658;
    wire [2:0] _639;
    wire _635;
    wire _633;
    wire _634;
    wire _636;
    wire [2:0] _640;
    wire _631;
    wire [2:0] _642;
    wire _643;
    wire _659;
    wire _660;
    wire _661;
    wire _627;
    wire [5:0] _624;
    wire _625;
    wire _628;
    wire [15:0] _619;
    wire [15:0] _620;
    wire _621;
    wire _618;
    wire _622;
    wire _616;
    wire _617;
    wire _623;
    wire _629;
    wire _662;
    wire [1:0] _664;
    wire [1:0] _666;
    wire [2:0] _23;
    wire [2:0] _544;
    wire [2:0] _545;
    wire [2:0] _540;
    wire _536;
    wire _534;
    wire _535;
    wire _537;
    wire [2:0] _541;
    wire _532;
    wire [2:0] _546;
    wire [2:0] _547;
    wire [2:0] _526;
    wire [2:0] _527;
    wire [2:0] _522;
    wire _410;
    wire _409;
    wire _408;
    wire _407;
    wire _406;
    wire _405;
    wire _404;
    wire _400;
    wire _399;
    wire _398;
    wire _397;
    wire _396;
    wire _395;
    wire _394;
    wire [7:0] _390;
    wire [7:0] _25;
    wire _27;
    wire [7:0] _391;
    wire [7:0] _342;
    wire [6:0] _346;
    wire [7:0] _347;
    wire [6:0] _344;
    wire [7:0] _345;
    wire [7:0] _348;
    wire [7:0] _420;
    wire [7:0] _421;
    wire [7:0] _422;
    wire [7:0] _416;
    wire [7:0] _417;
    wire [7:0] _418;
    wire [7:0] _419;
    wire [7:0] _423;
    wire [7:0] _28;
    reg [7:0] _343;
    wire _382;
    wire _379;
    wire _380;
    wire _383;
    wire [7:0] _392;
    wire _393;
    wire [7:0] _401;
    wire _30;
    wire [7:0] _402;
    wire _403;
    wire [2:0] _431;
    wire [2:0] _432;
    wire [2:0] _433;
    wire [2:0] _434;
    wire [2:0] _425;
    wire [2:0] _426;
    wire [2:0] _427;
    wire [2:0] _428;
    wire [2:0] _429;
    wire [2:0] _435;
    wire [2:0] _437;
    wire [2:0] _31;
    reg [2:0] _337;
    reg _411;
    wire _33;
    wire [31:0] _303;
    wire [31:0] _35;
    wire [30:0] _477;
    wire [31:0] _479;
    wire _471;
    wire _472;
    wire [31:0] _474;
    wire [30:0] _468;
    wire [31:0] _470;
    wire [31:0] _475;
    wire [31:0] _476;
    wire [5:0] _37;
    wire [5:0] _445;
    wire [5:0] _446;
    wire [5:0] _447;
    wire [5:0] _448;
    wire [5:0] _439;
    wire [5:0] _440;
    wire [5:0] _441;
    wire [5:0] _442;
    wire [5:0] _443;
    wire [5:0] _449;
    wire [5:0] _450;
    wire [5:0] _452;
    wire [5:0] _38;
    reg [5:0] _297;
    wire _299;
    wire _300;
    wire _293;
    wire _288;
    wire _294;
    wire _301;
    wire [31:0] _480;
    wire [31:0] _481;
    wire [31:0] _482;
    wire [31:0] _40;
    wire _459;
    wire _460;
    wire [31:0] _462;
    wire [30:0] _456;
    wire [31:0] _458;
    wire [31:0] _463;
    wire [30:0] _453;
    wire [31:0] _455;
    wire [31:0] _464;
    wire [31:0] _465;
    wire [31:0] _466;
    wire [31:0] _467;
    wire [31:0] _483;
    wire [31:0] _484;
    wire [31:0] _486;
    wire [31:0] _41;
    reg [31:0] _304;
    wire _305;
    wire _306;
    wire [15:0] _43;
    wire [15:0] _506;
    wire _333;
    wire _334;
    wire [15:0] _507;
    wire _261;
    wire [15:0] _508;
    wire _489;
    wire _487;
    wire _488;
    wire _490;
    wire _492;
    wire _44;
    reg _233;
    wire _234;
    wire _230;
    wire _235;
    wire _494;
    wire _495;
    wire _496;
    wire _498;
    wire _45;
    reg _226;
    wire _227;
    wire _224;
    wire _228;
    wire _236;
    wire _237;
    wire _238;
    wire [15:0] _509;
    wire [15:0] _500;
    wire [15:0] _501;
    wire [15:0] _502;
    wire [15:0] _503;
    wire [15:0] _504;
    wire [15:0] _510;
    wire [15:0] _512;
    wire [15:0] _46;
    reg [15:0] _291;
    wire _292;
    wire _412;
    wire _413;
    wire _518;
    wire _516;
    wire _517;
    wire _519;
    wire [2:0] _523;
    wire _514;
    wire [2:0] _528;
    wire [2:0] _529;
    wire [2:0] _530;
    wire [2:0] _548;
    wire [2:0] _550;
    wire [2:0] _47;
    reg [2:0] _220;
    wire _221;
    wire [1:0] _49;
    wire _216;
    wire _217;
    wire _222;
    wire _362;
    wire _363;
    wire [1:0] _612;
    wire _608;
    wire [1:0] _610;
    wire _357;
    wire _355;
    wire _358;
    wire _359;
    wire _360;
    wire _352;
    wire _353;
    wire _361;
    wire [1:0] _613;
    wire [1:0] _615;
    wire _188;
    wire _189;
    wire _184;
    wire _183;
    wire _182;
    wire _181;
    wire _180;
    wire _179;
    wire _178;
    wire _177;
    reg _185;
    wire _186;
    wire _175;
    wire _174;
    wire _173;
    wire _172;
    wire _171;
    wire _170;
    wire _169;
    wire _168;
    wire [2:0] _51;
    reg _176;
    wire _187;
    wire _53;
    wire _190;
    wire _166;
    wire _163;
    wire _156;
    wire _154;
    wire [13:0] _145;
    wire [15:0] _146;
    wire [14:0] _142;
    wire [15:0] _143;
    wire [15:0] _147;
    wire [14:0] _139;
    wire [15:0] _140;
    wire _137;
    wire [15:0] _148;
    reg [15:0] _151;
    wire _152;
    wire [13:0] _129;
    wire [15:0] _130;
    reg [15:0] _133;
    wire _596;
    wire _597;
    wire [15:0] _598;
    wire [15:0] _600;
    wire [15:0] _602;
    wire [16:0] _579;
    wire _580;
    wire [14:0] _158;
    wire [15:0] _159;
    reg [15:0] _162;
    wire [16:0] _576;
    wire _577;
    wire [16:0] _570;
    reg [16:0] _573;
    wire [16:0] _565;
    wire [15:0] _55;
    wire [16:0] _564;
    wire [16:0] _566;
    reg [16:0] _569;
    wire [7:0] _57;
    wire [8:0] _584;
    wire vdd;
    wire _59;
    wire _61;
    wire [7:0] _586;
    wire [7:0] _587;
    wire [7:0] _588;
    wire [7:0] _590;
    wire [7:0] _62;
    reg [7:0] _558;
    wire [8:0] _583;
    wire [8:0] _585;
    wire _591;
    wire _592;
    wire _593;
    wire _595;
    wire _63;
    reg _563;
    wire [16:0] _574;
    wire gnd;
    wire [16:0] _560;
    wire _575;
    wire _578;
    wire _581;
    wire _559;
    wire _582;
    wire [15:0] _604;
    wire _554;
    wire _552;
    wire _332;
    wire _551;
    wire _553;
    wire _555;
    wire [15:0] _605;
    wire [15:0] _607;
    wire [15:0] _64;
    reg [15:0] _127;
    wire _134;
    wire _135;
    wire _124;
    wire _136;
    wire _153;
    wire _155;
    wire _164;
    wire [1:0] _66;
    wire _120;
    wire _121;
    wire _118;
    wire _122;
    wire _115;
    wire _111;
    wire _110;
    wire _109;
    wire _108;
    wire _107;
    wire _106;
    wire _105;
    wire [7:0] _68;
    wire _104;
    reg _112;
    wire _102;
    wire _101;
    wire _100;
    wire _99;
    wire _98;
    wire _97;
    wire _96;
    wire [7:0] _70;
    wire _95;
    wire [2:0] _72;
    reg _103;
    wire _113;
    wire _114;
    wire _116;
    wire _123;
    wire _167;
    wire _74;
    wire _191;
    wire _76;
    wire _94;
    wire _192;
    wire [1:0] _667;
    wire [1:0] _669;
    wire _78;
    wire [1:0] _676;
    wire [1:0] _682;
    wire [1:0] _684;
    wire [1:0] _79;
    reg [1:0] _91;
    wire _93;
    wire _194;
    wire _195;
    wire _197;
    wire _201;
    wire _202;
    wire _207;
    wire _702;
    wire _81;
    wire _704;
    wire _83;
    wire _706;
    wire _85;
    wire _708;
    wire _86;
    reg _204;
    assign _209 = 3'b000;
    assign _239 = 3'b001;
    assign _240 = _238 ? _239 : _214;
    assign _212 = 3'b100;
    assign _211 = 3'b010;
    assign _213 = _204 ? _212 : _211;
    assign _214 = _207 ? _213 : _210;
    assign _241 = _192 ? _240 : _214;
    assign _243 = _83 ? _209 : _241;
    assign _245 = _85 ? _209 : _243;
    assign _1 = _245;
    always @(posedge _61) begin
        if (_59)
            _210 <= _209;
        else
            _210 <= _1;
    end
    assign _247 = 1'b0;
    assign _251 = 1'b1;
    assign _252 = _238 ? _251 : _250;
    assign _250 = _207 ? _251 : _248;
    assign _253 = _192 ? _252 : _250;
    assign _255 = _83 ? _247 : _253;
    assign _257 = _85 ? _247 : _255;
    assign _3 = _257;
    always @(posedge _61) begin
        if (_59)
            _248 <= _247;
        else
            _248 <= _3;
    end
    assign _274 = 16'b0000000000000000;
    assign _6 = cfg_sync_mask;
    assign _8 = cfg_sync;
    assign _264 = _261 ? _263 : _260;
    assign _265 = _238 ? _260 : _264;
    assign _266 = _192 ? _265 : _260;
    assign _268 = _83 ? _274 : _266;
    assign _9 = _268;
    always @(posedge _61) begin
        if (_59)
            _260 <= _274;
        else
            _260 <= _9;
    end
    assign _262 = _260[14:0];
    assign _263 = { _262,
                    _228 };
    assign _272 = _263 ^ _8;
    assign _273 = _272 & _6;
    assign _275 = _273 == _274;
    assign _277 = _275 ? _251 : _271;
    assign _278 = _261 ? _277 : _271;
    assign _279 = _238 ? _271 : _278;
    assign _280 = _192 ? _279 : _271;
    assign _282 = _83 ? _247 : _280;
    assign _284 = _85 ? _247 : _282;
    assign _10 = _284;
    always @(posedge _61) begin
        if (_59)
            _271 <= _247;
        else
            _271 <= _10;
    end
    assign _307 = _228 == _306;
    assign _308 = ~ _307;
    assign _310 = _301 ? _309 : _287;
    assign _311 = _261 ? _310 : _287;
    assign _312 = _238 ? _287 : _311;
    assign _313 = _192 ? _312 : _287;
    assign _315 = _83 ? _247 : _313;
    assign _12 = _315;
    always @(posedge _61) begin
        if (_59)
            _287 <= _247;
        else
            _287 <= _12;
    end
    assign _309 = _287 | _308;
    assign _321 = ~ _309;
    assign _319 = 6'b000001;
    assign _320 = _297 == _319;
    assign _322 = _320 ? _321 : _318;
    assign _323 = _301 ? _322 : _318;
    assign _324 = _261 ? _323 : _318;
    assign _325 = _238 ? _318 : _324;
    assign _326 = _192 ? _325 : _318;
    assign _328 = _83 ? _247 : _326;
    assign _330 = _85 ? _247 : _328;
    assign _13 = _330;
    always @(posedge _61) begin
        if (_59)
            _318 <= _247;
        else
            _318 <= _13;
    end
    assign _349 = _334 ? _348 : _343;
    assign _350 = _340 ? _348 : _349;
    assign _376 = ~ _340;
    assign _370 = _337 + _239;
    assign _365 = ~ _222;
    assign _364 = _361 & _363;
    assign _366 = _364 & _365;
    assign _367 = _366 & _292;
    assign _368 = _334 | _367;
    assign _371 = _368 ? _370 : _337;
    assign _373 = _371 == _209;
    assign _374 = ~ _373;
    assign _351 = _81 & _76;
    assign _375 = _351 & _374;
    assign _377 = _375 & _376;
    assign _338 = 3'b111;
    assign _339 = _337 == _338;
    assign _340 = _334 & _339;
    assign _378 = _340 | _377;
    assign _385 = ~ _27;
    assign _384 = _361 & _383;
    assign _386 = _384 & _385;
    assign _414 = _363 ? _413 : _389;
    assign _415 = _361 ? _414 : _389;
    assign _19 = _415;
    always @(posedge _61) begin
        if (_59)
            _389 <= _247;
        else
            _389 <= _19;
    end
    assign _696 = ~ _413;
    assign _694 = ~ _204;
    assign _695 = _413 ? _204 : _694;
    always @* begin
        case (_66)
        0:
            _697 <= _413;
        1:
            _697 <= _695;
        2:
            _697 <= _696;
        default:
            _697 <= _413;
        endcase
    end
    assign _698 = _363 ? _697 : _251;
    assign _699 = _361 ? _698 : _204;
    assign _691 = ~ _360;
    assign _687 = 2'b10;
    assign _688 = _66 == _687;
    assign _685 = ~ _76;
    assign _686 = _93 & _685;
    assign _689 = _686 & _688;
    assign _690 = _689 & _191;
    assign _692 = _690 & _691;
    assign _700 = _692 ? _389 : _699;
    assign _205 = _103 == _204;
    assign _206 = ~ _205;
    assign _199 = _66 == _687;
    assign _200 = ~ _199;
    assign _196 = ~ _74;
    assign _21 = cfg_readback;
    assign _193 = ~ _76;
    assign _89 = 2'b00;
    assign _680 = 2'b01;
    assign _677 = ~ _74;
    assign _678 = _76 & _677;
    assign _681 = _678 ? _680 : _687;
    assign _670 = ~ _363;
    assign _671 = _361 & _670;
    assign _672 = _332 | _671;
    assign _673 = _672 | _662;
    assign _675 = _673 ? _687 : _669;
    assign _663 = 2'b11;
    assign _656 = _220 + _239;
    assign _653 = _220 + _239;
    assign _649 = vdd == _233;
    assign _647 = _220 == _209;
    assign _648 = ~ _647;
    assign _650 = _648 & _649;
    assign _654 = _650 ? _653 : _239;
    assign _645 = _49 == _687;
    assign _657 = _645 ? _656 : _654;
    assign _658 = _657 == _23;
    assign _639 = _220 + _239;
    assign _635 = gnd == _233;
    assign _633 = _220 == _209;
    assign _634 = ~ _633;
    assign _636 = _634 & _635;
    assign _640 = _636 ? _639 : _239;
    assign _631 = _49 == _687;
    assign _642 = _631 ? _209 : _640;
    assign _643 = _642 == _23;
    assign _659 = _228 ? _658 : _643;
    assign _660 = _217 & _659;
    assign _661 = ~ _660;
    assign _627 = _297 == _319;
    assign _624 = 6'b000000;
    assign _625 = _297 == _624;
    assign _628 = _301 ? _627 : _625;
    assign _619 = 16'b0000000000000001;
    assign _620 = _291 + _619;
    assign _621 = _620 == _43;
    assign _618 = _291 == _43;
    assign _622 = _334 ? _621 : _618;
    assign _616 = ~ _238;
    assign _617 = _192 & _616;
    assign _623 = _617 & _622;
    assign _629 = _623 & _628;
    assign _662 = _629 & _661;
    assign _664 = _662 ? _663 : _615;
    assign _666 = _238 ? _89 : _664;
    assign _23 = cfg_stuff_len;
    assign _544 = _220 + _239;
    assign _545 = _228 ? _544 : _209;
    assign _540 = _220 + _239;
    assign _536 = _228 == _233;
    assign _534 = _220 == _209;
    assign _535 = ~ _534;
    assign _537 = _535 & _536;
    assign _541 = _537 ? _540 : _239;
    assign _532 = _49 == _687;
    assign _546 = _532 ? _545 : _541;
    assign _547 = _238 ? _530 : _546;
    assign _526 = _220 + _239;
    assign _527 = _413 ? _526 : _209;
    assign _522 = _220 + _239;
    assign _410 = _402[7:7];
    assign _409 = _402[6:6];
    assign _408 = _402[5:5];
    assign _407 = _402[4:4];
    assign _406 = _402[3:3];
    assign _405 = _402[2:2];
    assign _404 = _402[1:1];
    assign _400 = _392[7:7];
    assign _399 = _392[6:6];
    assign _398 = _392[5:5];
    assign _397 = _392[4:4];
    assign _396 = _392[3:3];
    assign _395 = _392[2:2];
    assign _394 = _392[1:1];
    assign _390 = 8'b11111111;
    assign _25 = tx_head;
    assign _27 = tx_empty;
    assign _391 = _27 ? _390 : _25;
    assign _342 = 8'b00000000;
    assign _346 = _343[7:1];
    assign _347 = { _228,
                    _346 };
    assign _344 = _343[6:0];
    assign _345 = { _344,
                    _228 };
    assign _348 = _30 ? _347 : _345;
    assign _420 = _334 ? _348 : _419;
    assign _421 = _261 ? _420 : _419;
    assign _422 = _238 ? _419 : _421;
    assign _416 = _292 ? _392 : _343;
    assign _417 = _222 ? _343 : _416;
    assign _418 = _363 ? _417 : _343;
    assign _419 = _361 ? _418 : _343;
    assign _423 = _192 ? _422 : _419;
    assign _28 = _423;
    always @(posedge _61) begin
        if (_59)
            _343 <= _342;
        else
            _343 <= _28;
    end
    assign _382 = _337 == _209;
    assign _379 = ~ _222;
    assign _380 = _379 & _292;
    assign _383 = _380 & _382;
    assign _392 = _383 ? _391 : _343;
    assign _393 = _392[0:0];
    assign _401 = { _393,
                    _394,
                    _395,
                    _396,
                    _397,
                    _398,
                    _399,
                    _400 };
    assign _30 = cfg_lsb_first;
    assign _402 = _30 ? _392 : _401;
    assign _403 = _402[0:0];
    assign _431 = _337 + _239;
    assign _432 = _334 ? _431 : _429;
    assign _433 = _261 ? _432 : _429;
    assign _434 = _238 ? _429 : _433;
    assign _425 = _337 + _239;
    assign _426 = _292 ? _425 : _337;
    assign _427 = _222 ? _337 : _426;
    assign _428 = _363 ? _427 : _337;
    assign _429 = _361 ? _428 : _337;
    assign _435 = _192 ? _434 : _429;
    assign _437 = _83 ? _209 : _435;
    assign _31 = _437;
    always @(posedge _61) begin
        if (_59)
            _337 <= _209;
        else
            _337 <= _31;
    end
    always @* begin
        case (_337)
        0:
            _411 <= _403;
        1:
            _411 <= _404;
        2:
            _411 <= _405;
        3:
            _411 <= _406;
        4:
            _411 <= _407;
        5:
            _411 <= _408;
        6:
            _411 <= _409;
        default:
            _411 <= _410;
        endcase
    end
    assign _33 = cfg_crc_inv;
    assign _303 = 32'b00000000000000000000000000000000;
    assign _35 = cfg_init;
    assign _477 = _304[30:0];
    assign _479 = { _477,
                    _247 };
    assign _471 = _304[31:31];
    assign _472 = _228 ^ _471;
    assign _474 = _472 ? _40 : _303;
    assign _468 = _304[30:0];
    assign _470 = { _468,
                    _247 };
    assign _475 = _470 ^ _474;
    assign _476 = _334 ? _475 : _467;
    assign _37 = cfg_crc_width;
    assign _445 = _297 - _319;
    assign _446 = _301 ? _445 : _443;
    assign _447 = _261 ? _446 : _443;
    assign _448 = _238 ? _443 : _447;
    assign _439 = _297 - _319;
    assign _440 = _292 ? _297 : _439;
    assign _441 = _222 ? _297 : _440;
    assign _442 = _363 ? _441 : _297;
    assign _443 = _361 ? _442 : _297;
    assign _449 = _192 ? _448 : _443;
    assign _450 = _78 ? _37 : _449;
    assign _452 = _83 ? _624 : _450;
    assign _38 = _452;
    always @(posedge _61) begin
        if (_59)
            _297 <= _624;
        else
            _297 <= _38;
    end
    assign _299 = _297 == _624;
    assign _300 = ~ _299;
    assign _293 = ~ _292;
    assign _288 = _192 & _261;
    assign _294 = _288 & _293;
    assign _301 = _294 & _300;
    assign _480 = _301 ? _479 : _476;
    assign _481 = _261 ? _480 : _467;
    assign _482 = _238 ? _467 : _481;
    assign _40 = cfg_poly;
    assign _459 = _304[31:31];
    assign _460 = _413 ^ _459;
    assign _462 = _460 ? _40 : _303;
    assign _456 = _304[30:0];
    assign _458 = { _456,
                    _247 };
    assign _463 = _458 ^ _462;
    assign _453 = _304[30:0];
    assign _455 = { _453,
                    _247 };
    assign _464 = _292 ? _463 : _455;
    assign _465 = _222 ? _304 : _464;
    assign _466 = _363 ? _465 : _304;
    assign _467 = _361 ? _466 : _304;
    assign _483 = _192 ? _482 : _467;
    assign _484 = _83 ? _35 : _483;
    assign _486 = _85 ? _303 : _484;
    assign _41 = _486;
    always @(posedge _61) begin
        if (_59)
            _304 <= _303;
        else
            _304 <= _41;
    end
    assign _305 = _304[31:31];
    assign _306 = _305 ^ _33;
    assign _43 = cfg_frame_bits;
    assign _506 = _291 + _619;
    assign _333 = _192 & _261;
    assign _334 = _333 & _292;
    assign _507 = _334 ? _506 : _504;
    assign _261 = ~ _222;
    assign _508 = _261 ? _507 : _504;
    assign _489 = _238 ? _488 : _228;
    assign _487 = _363 ? _413 : _233;
    assign _488 = _361 ? _487 : _233;
    assign _490 = _192 ? _489 : _488;
    assign _492 = _83 ? _251 : _490;
    assign _44 = _492;
    always @(posedge _61) begin
        if (_59)
            _233 <= vdd;
        else
            _233 <= _44;
    end
    assign _234 = ~ _233;
    assign _230 = _49 == _680;
    assign _235 = _230 ? _234 : gnd;
    assign _494 = _66 == _680;
    assign _495 = _494 ? _103 : _226;
    assign _496 = _192 ? _495 : _226;
    assign _498 = _83 ? _251 : _496;
    assign _45 = _498;
    always @(posedge _61) begin
        if (_59)
            _226 <= vdd;
        else
            _226 <= _45;
    end
    assign _227 = _103 == _226;
    assign _224 = _66 == _680;
    assign _228 = _224 ? _227 : _103;
    assign _236 = _228 == _235;
    assign _237 = ~ _236;
    assign _238 = _222 & _237;
    assign _509 = _238 ? _504 : _508;
    assign _500 = _291 + _619;
    assign _501 = _292 ? _500 : _291;
    assign _502 = _222 ? _291 : _501;
    assign _503 = _363 ? _502 : _291;
    assign _504 = _361 ? _503 : _291;
    assign _510 = _192 ? _509 : _504;
    assign _512 = _83 ? _274 : _510;
    assign _46 = _512;
    always @(posedge _61) begin
        if (_59)
            _291 <= _274;
        else
            _291 <= _46;
    end
    assign _292 = _291 < _43;
    assign _412 = _292 ? _411 : _306;
    assign _413 = _222 ? _235 : _412;
    assign _518 = _413 == _233;
    assign _516 = _220 == _209;
    assign _517 = ~ _516;
    assign _519 = _517 & _518;
    assign _523 = _519 ? _522 : _239;
    assign _514 = _49 == _687;
    assign _528 = _514 ? _527 : _523;
    assign _529 = _363 ? _528 : _220;
    assign _530 = _361 ? _529 : _220;
    assign _548 = _192 ? _547 : _530;
    assign _550 = _83 ? _209 : _548;
    assign _47 = _550;
    always @(posedge _61) begin
        if (_59)
            _220 <= _209;
        else
            _220 <= _47;
    end
    assign _221 = _220 == _23;
    assign _49 = cfg_stuff;
    assign _216 = _49 == _89;
    assign _217 = ~ _216;
    assign _222 = _217 & _221;
    assign _362 = _222 | _292;
    assign _363 = _362 | _300;
    assign _612 = _363 ? _610 : _663;
    assign _608 = _118 & _116;
    assign _610 = _608 ? _687 : _91;
    assign _357 = _162 == _274;
    assign _355 = _127 == _274;
    assign _358 = _155 ? _357 : _355;
    assign _359 = _123 ? vdd : _358;
    assign _360 = _74 ? _190 : _359;
    assign _352 = ~ _76;
    assign _353 = _93 & _352;
    assign _361 = _353 & _360;
    assign _613 = _361 ? _612 : _610;
    assign _615 = _207 ? _89 : _613;
    assign _188 = ~ _176;
    assign _189 = _185 & _188;
    assign _184 = _68[7:7];
    assign _183 = _68[6:6];
    assign _182 = _68[5:5];
    assign _181 = _68[4:4];
    assign _180 = _68[3:3];
    assign _179 = _68[2:2];
    assign _178 = _68[1:1];
    assign _177 = _68[0:0];
    always @* begin
        case (_51)
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
    assign _186 = ~ _185;
    assign _175 = _70[7:7];
    assign _174 = _70[6:6];
    assign _173 = _70[5:5];
    assign _172 = _70[4:4];
    assign _171 = _70[3:3];
    assign _170 = _70[2:2];
    assign _169 = _70[1:1];
    assign _168 = _70[0:0];
    assign _51 = cfg_clk_pin;
    always @* begin
        case (_51)
        0:
            _176 <= _168;
        1:
            _176 <= _169;
        2:
            _176 <= _170;
        3:
            _176 <= _171;
        4:
            _176 <= _172;
        5:
            _176 <= _173;
        6:
            _176 <= _174;
        default:
            _176 <= _175;
        endcase
    end
    assign _187 = _176 & _186;
    assign _53 = cfg_clk_edge;
    assign _190 = _53 ? _189 : _187;
    assign _166 = _151 == _274;
    assign _163 = _162 == _151;
    assign _156 = _127 == _151;
    assign _154 = ~ _118;
    assign _145 = _55[15:2];
    assign _146 = { _89,
                    _145 };
    assign _142 = _55[15:1];
    assign _143 = { _247,
                    _142 };
    assign _147 = _143 + _146;
    assign _139 = _55[15:1];
    assign _140 = { _247,
                    _139 };
    assign _137 = _76 & _120;
    assign _148 = _137 ? _147 : _140;
    always @(posedge _61) begin
        if (_59)
            _151 <= _274;
        else
            _151 <= _148;
    end
    assign _152 = _127 < _151;
    assign _129 = _55[15:2];
    assign _130 = { _89,
                    _129 };
    always @(posedge _61) begin
        if (_59)
            _133 <= _274;
        else
            _133 <= _130;
    end
    assign _596 = ~ _118;
    assign _597 = _153 & _596;
    assign _598 = _597 ? _162 : _127;
    assign _600 = _123 ? _274 : _598;
    assign _602 = _600 + _619;
    assign _579 = 17'b00000000000000000;
    assign _580 = _574 == _579;
    assign _158 = _55[15:1];
    assign _159 = { _247,
                    _158 };
    always @(posedge _61) begin
        if (_59)
            _162 <= _274;
        else
            _162 <= _159;
    end
    assign _576 = { gnd,
                    _162 };
    assign _577 = _576 == _574;
    assign _570 = { gnd,
                    _55 };
    always @(posedge _61) begin
        if (_59)
            _573 <= _579;
        else
            _573 <= _570;
    end
    assign _565 = 17'b00000000000000001;
    assign _55 = cfg_div_int;
    assign _564 = { gnd,
                    _55 };
    assign _566 = _564 - _565;
    always @(posedge _61) begin
        if (_59)
            _569 <= _579;
        else
            _569 <= _566;
    end
    assign _57 = cfg_div_frac;
    assign _584 = { gnd,
                    _57 };
    assign vdd = 1'b1;
    assign _59 = clear;
    assign _61 = clock;
    assign _586 = _585[7:0];
    assign _587 = _582 ? _586 : _558;
    assign _588 = _555 ? _587 : _558;
    assign _590 = _83 ? _342 : _588;
    assign _62 = _590;
    always @(posedge _61) begin
        if (_59)
            _558 <= _342;
        else
            _558 <= _62;
    end
    assign _583 = { gnd,
                    _558 };
    assign _585 = _583 + _584;
    assign _591 = _585[8:8];
    assign _592 = _582 ? _591 : _563;
    assign _593 = _555 ? _592 : _563;
    assign _595 = _83 ? _247 : _593;
    assign _63 = _595;
    always @(posedge _61) begin
        if (_59)
            _563 <= _247;
        else
            _563 <= _63;
    end
    assign _574 = _563 ? _573 : _569;
    assign gnd = 1'b0;
    assign _560 = { gnd,
                    _127 };
    assign _575 = _560 == _574;
    assign _578 = _155 ? _577 : _575;
    assign _581 = _123 ? _580 : _578;
    assign _559 = ~ _74;
    assign _582 = _559 & _581;
    assign _604 = _582 ? _274 : _602;
    assign _554 = ~ _74;
    assign _552 = _118 & _116;
    assign _332 = _91 == _663;
    assign _551 = _93 | _332;
    assign _553 = _551 | _552;
    assign _555 = _553 & _554;
    assign _605 = _555 ? _604 : _127;
    assign _607 = _83 ? _274 : _605;
    assign _64 = _607;
    always @(posedge _61) begin
        if (_59)
            _127 <= _274;
        else
            _127 <= _64;
    end
    assign _134 = _127 < _133;
    assign _135 = ~ _134;
    assign _124 = _116 & _120;
    assign _136 = _124 & _135;
    assign _153 = _136 & _152;
    assign _155 = _153 & _154;
    assign _164 = _155 ? _163 : _156;
    assign _66 = cfg_code;
    assign _120 = _66 == _687;
    assign _121 = ~ _120;
    assign _118 = _91 == _680;
    assign _122 = _118 | _121;
    assign _115 = ~ _74;
    assign _111 = _68[7:7];
    assign _110 = _68[6:6];
    assign _109 = _68[5:5];
    assign _108 = _68[4:4];
    assign _107 = _68[3:3];
    assign _106 = _68[2:2];
    assign _105 = _68[1:1];
    assign _68 = pins_q;
    assign _104 = _68[0:0];
    always @* begin
        case (_72)
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
    assign _102 = _70[7:7];
    assign _101 = _70[6:6];
    assign _100 = _70[5:5];
    assign _99 = _70[4:4];
    assign _98 = _70[3:3];
    assign _97 = _70[2:2];
    assign _96 = _70[1:1];
    assign _70 = pins_s;
    assign _95 = _70[0:0];
    assign _72 = cfg_data_pin;
    always @* begin
        case (_72)
        0:
            _103 <= _95;
        1:
            _103 <= _96;
        2:
            _103 <= _97;
        3:
            _103 <= _98;
        4:
            _103 <= _99;
        5:
            _103 <= _100;
        6:
            _103 <= _101;
        default:
            _103 <= _102;
        endcase
    end
    assign _113 = _103 ^ _112;
    assign _114 = _76 & _113;
    assign _116 = _114 & _115;
    assign _123 = _116 & _122;
    assign _167 = _123 ? _166 : _164;
    assign _74 = cfg_clk_pin_en;
    assign _191 = _74 ? _190 : _167;
    assign _76 = cfg_dir;
    assign _94 = _93 & _76;
    assign _192 = _94 & _191;
    assign _667 = _192 ? _666 : _615;
    assign _669 = _81 ? _89 : _667;
    assign _78 = crc_cmd;
    assign _676 = _78 ? _675 : _669;
    assign _682 = _83 ? _681 : _676;
    assign _684 = _85 ? _89 : _682;
    assign _79 = _684;
    always @(posedge _61) begin
        if (_59)
            _91 <= _89;
        else
            _91 <= _79;
    end
    assign _93 = _91 == _687;
    assign _194 = _93 & _193;
    assign _195 = _194 & _21;
    assign _197 = _195 & _196;
    assign _201 = _197 & _200;
    assign _202 = _201 & _191;
    assign _207 = _202 & _206;
    assign _702 = _207 ? _251 : _700;
    assign _81 = end_;
    assign _704 = _81 ? _251 : _702;
    assign _83 = go;
    assign _706 = _83 ? _251 : _704;
    assign _85 = reset;
    assign _708 = _85 ? _251 : _706;
    assign _86 = _708;
    always @(posedge _61) begin
        if (_59)
            _204 <= vdd;
        else
            _204 <= _86;
    end
    assign out = _204;
    assign pop = _386;
    assign push = _378;
    assign push_data = _350;
    assign done_ = _332;
    assign crc_ok = _318;
    assign sync_hit = _271;
    assign error = _248;
    assign err_kind = _210;

endmodule
