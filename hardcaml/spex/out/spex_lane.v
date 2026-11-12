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
    cfg_len_max,
    cfg_skip,
    cfg_len_pos,
    cfg_len_en,
    cfg_stuff,
    cfg_clk_pin,
    cfg_clk_edge,
    cfg_div_int,
    cfg_div_frac,
    cfg_code,
    clear,
    clock,
    sync1,
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
    input [3:0] cfg_len_max;
    input [5:0] cfg_skip;
    input [5:0] cfg_len_pos;
    input cfg_len_en;
    input [1:0] cfg_stuff;
    input [2:0] cfg_clk_pin;
    input cfg_clk_edge;
    input [15:0] cfg_div_int;
    input [7:0] cfg_div_frac;
    input [1:0] cfg_code;
    input clear;
    input clock;
    input [7:0] sync1;
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

    wire _274;
    wire [2:0] _267;
    wire _268;
    wire _269;
    wire _110;
    wire _99;
    wire _100;
    wire _101;
    wire _111;
    wire _270;
    wire _275;
    wire _276;
    wire [2:0] _315;
    wire [2:0] _316;
    wire [2:0] _296;
    wire [2:0] _295;
    wire [2:0] _297;
    wire [2:0] _298;
    wire [2:0] _317;
    wire [2:0] _319;
    wire [2:0] _321;
    wire [2:0] _3;
    reg [2:0] _294;
    wire _323;
    wire _327;
    wire _328;
    wire _326;
    wire _329;
    wire _331;
    wire _333;
    wire _5;
    reg _324;
    wire [15:0] _344;
    wire [15:0] _8;
    wire [15:0] _10;
    wire [15:0] _342;
    wire [15:0] _343;
    wire _345;
    wire _347;
    wire _348;
    wire _349;
    wire _350;
    wire _352;
    wire _354;
    wire _11;
    reg _336;
    wire _367;
    wire _368;
    wire _370;
    wire _371;
    wire _372;
    wire _373;
    wire _375;
    wire _13;
    reg g_crc_bad;
    wire _369;
    wire _381;
    wire [5:0] _379;
    wire _380;
    wire _382;
    wire _383;
    wire _384;
    wire _385;
    wire _386;
    wire _388;
    wire _390;
    wire _14;
    reg _378;
    wire [7:0] _399;
    wire [7:0] _400;
    wire _406;
    wire [2:0] _265;
    wire _257;
    wire g_tx_bit;
    wire _258;
    wire _259;
    wire _260;
    wire [2:0] _266;
    wire _403;
    wire _404;
    wire _401;
    wire _405;
    wire _407;
    wire [2:0] _271;
    wire _272;
    wire _273;
    wire _408;
    wire _415;
    wire _414;
    wire _416;
    wire _444;
    wire _445;
    wire _20;
    reg _419;
    wire _772;
    wire _770;
    wire _771;
    reg _773;
    wire _774;
    wire _775;
    wire _767;
    wire [1:0] _763;
    wire _764;
    wire _761;
    wire _762;
    wire _765;
    wire _766;
    wire _768;
    wire _776;
    wire _289;
    wire _290;
    wire _283;
    wire _284;
    wire _280;
    wire _22;
    wire _277;
    wire [1:0] _103;
    wire [1:0] _756;
    wire _753;
    wire _754;
    wire [1:0] _757;
    wire _746;
    wire _747;
    wire _748;
    wire _749;
    wire [1:0] _751;
    wire [1:0] _739;
    wire [2:0] _732;
    wire [2:0] _729;
    wire _725;
    wire _723;
    wire _724;
    wire _726;
    wire [2:0] _730;
    wire _721;
    wire [2:0] _733;
    wire _734;
    wire [2:0] _715;
    wire _711;
    wire _709;
    wire _710;
    wire _712;
    wire [2:0] _716;
    wire _707;
    wire [2:0] _718;
    wire _719;
    wire _735;
    wire _736;
    wire _737;
    wire _703;
    wire [5:0] _700;
    wire _701;
    wire _704;
    wire [15:0] _695;
    wire [15:0] _696;
    wire _697;
    wire _694;
    wire _698;
    wire _692;
    wire _693;
    wire _699;
    wire _705;
    wire _738;
    wire [1:0] _740;
    wire [1:0] _742;
    wire [2:0] _24;
    wire [2:0] _620;
    wire [2:0] _621;
    wire [2:0] _616;
    wire _612;
    wire _610;
    wire _611;
    wire _613;
    wire [2:0] _617;
    wire _608;
    wire [2:0] _622;
    wire [2:0] _623;
    wire [2:0] _602;
    wire [2:0] _603;
    wire [2:0] _598;
    wire _440;
    wire _439;
    wire _438;
    wire _437;
    wire _436;
    wire _435;
    wire _434;
    wire _430;
    wire _429;
    wire _428;
    wire _427;
    wire _426;
    wire _425;
    wire _424;
    wire [7:0] _420;
    wire [7:0] _26;
    wire _28;
    wire [7:0] _421;
    wire [7:0] _392;
    wire [6:0] _396;
    wire [7:0] _397;
    wire [6:0] _394;
    wire [7:0] _395;
    wire [7:0] _398;
    wire [7:0] _450;
    wire [7:0] _451;
    wire [7:0] _452;
    wire [7:0] _453;
    wire [7:0] _446;
    wire [7:0] _447;
    wire [7:0] _448;
    wire [7:0] _449;
    wire [7:0] _454;
    wire [7:0] _29;
    reg [7:0] g_byte;
    wire _412;
    wire _409;
    wire _410;
    wire _413;
    wire [7:0] _422;
    wire _423;
    wire [7:0] _431;
    wire _31;
    wire [7:0] _432;
    wire _433;
    wire [2:0] _462;
    wire [5:0] _233;
    wire _234;
    wire _235;
    wire [9:0] _230;
    wire [9:0] _229;
    wire _231;
    wire _232;
    wire _236;
    wire _237;
    wire [2:0] _463;
    wire [2:0] _464;
    wire [2:0] _465;
    wire [2:0] _466;
    wire [2:0] _456;
    wire [2:0] _457;
    wire [2:0] _458;
    wire [2:0] _459;
    wire [2:0] _460;
    wire [2:0] _467;
    wire [2:0] _469;
    wire [2:0] _32;
    reg [2:0] g_bitpos;
    reg _441;
    wire _34;
    wire [31:0] _363;
    wire [31:0] _36;
    wire [30:0] _509;
    wire [31:0] _511;
    wire _503;
    wire _504;
    wire [31:0] _506;
    wire [30:0] _500;
    wire [31:0] _502;
    wire [31:0] _507;
    wire [31:0] _508;
    wire [5:0] _38;
    wire [5:0] _477;
    wire [5:0] _478;
    wire [5:0] _479;
    wire [5:0] _480;
    wire [5:0] _471;
    wire [5:0] _472;
    wire [5:0] _473;
    wire [5:0] _474;
    wire [5:0] _475;
    wire [5:0] _481;
    wire [5:0] _482;
    wire [5:0] _484;
    wire [5:0] _39;
    reg [5:0] g_left;
    wire _253;
    wire _254;
    wire _359;
    wire _358;
    wire _360;
    wire _361;
    wire [31:0] _512;
    wire [31:0] _513;
    wire [31:0] _514;
    wire [31:0] _41;
    wire _491;
    wire _492;
    wire [31:0] _494;
    wire [30:0] _488;
    wire [31:0] _490;
    wire [31:0] _495;
    wire [30:0] _485;
    wire [31:0] _487;
    wire [31:0] _496;
    wire [31:0] _497;
    wire [31:0] _498;
    wire [31:0] _499;
    wire [31:0] _515;
    wire [31:0] _516;
    wire [31:0] _518;
    wire [31:0] _42;
    reg [31:0] g_crc;
    wire _365;
    wire _366;
    wire [7:0] _534;
    wire [7:0] _535;
    wire [7:0] _43;
    reg [7:0] g_lim;
    wire [15:0] _225;
    wire [15:0] _45;
    wire [14:0] _340;
    wire [15:0] _341;
    wire [15:0] _536;
    wire [15:0] _537;
    wire [15:0] _538;
    wire [15:0] _540;
    wire [15:0] _46;
    reg [15:0] g_sr;
    wire [3:0] _526;
    wire [3:0] _48;
    wire _527;
    wire [3:0] _528;
    wire [7:0] _530;
    wire [5:0] _50;
    wire [7:0] _524;
    wire [7:0] _531;
    wire [15:0] _532;
    wire _533;
    wire _559;
    wire [5:0] _52;
    wire [5:0] _545;
    wire _546;
    wire [9:0] _541;
    wire _543;
    wire _54;
    wire _544;
    wire _547;
    wire _549;
    wire _550;
    wire _551;
    wire _552;
    wire _553;
    wire _555;
    wire _557;
    wire _55;
    reg g_len_cap;
    wire _560;
    wire _562;
    wire _56;
    reg g_len_known;
    wire [15:0] _226;
    wire [15:0] _582;
    wire _214;
    wire _228;
    wire [15:0] _583;
    wire _213;
    wire [15:0] _584;
    wire _565;
    wire _563;
    wire _564;
    wire _566;
    wire _568;
    wire _57;
    reg g_last;
    wire _310;
    wire _306;
    wire _311;
    wire _570;
    wire _571;
    wire _572;
    wire _574;
    wire _58;
    reg g_prev;
    wire _303;
    wire _300;
    wire _304;
    wire _312;
    wire _313;
    wire _314;
    wire [15:0] _585;
    wire [15:0] _576;
    wire [15:0] _577;
    wire [15:0] _578;
    wire [15:0] _579;
    wire [15:0] _580;
    wire [15:0] _586;
    wire [15:0] _588;
    wire [15:0] _59;
    reg [15:0] g_cnt;
    wire g_data_left;
    wire _442;
    wire _443;
    wire _594;
    wire _592;
    wire _593;
    wire _595;
    wire [2:0] _599;
    wire _590;
    wire [2:0] _604;
    wire [2:0] _605;
    wire [2:0] _606;
    wire [2:0] _624;
    wire [2:0] _626;
    wire [2:0] _60;
    reg [2:0] g_run;
    wire _211;
    wire [1:0] _62;
    wire _206;
    wire _207;
    wire _212;
    wire _248;
    wire _255;
    wire [1:0] _688;
    wire _684;
    wire [1:0] _686;
    wire _243;
    wire _241;
    wire _244;
    wire _245;
    wire _246;
    wire _238;
    wire _239;
    wire _247;
    wire [1:0] _689;
    wire [1:0] _691;
    wire _200;
    wire _201;
    reg _197;
    wire _198;
    wire _190;
    wire _189;
    wire _188;
    wire _187;
    wire _186;
    wire _185;
    wire _184;
    wire _183;
    wire [2:0] _64;
    reg _191;
    reg _194;
    wire _199;
    wire _66;
    wire _202;
    wire _181;
    wire _178;
    wire _171;
    wire _169;
    wire [13:0] _160;
    wire [15:0] _161;
    wire [14:0] _157;
    wire [15:0] _158;
    wire [15:0] _162;
    wire [14:0] _154;
    wire [15:0] _155;
    wire _152;
    wire [15:0] _163;
    reg [15:0] _166;
    wire _167;
    wire [13:0] _144;
    wire [15:0] _145;
    reg [15:0] _148;
    wire _672;
    wire _673;
    wire [15:0] _674;
    wire [15:0] _676;
    wire [15:0] _678;
    wire [16:0] _655;
    wire _656;
    wire [14:0] _173;
    wire [15:0] _174;
    reg [15:0] _177;
    wire [16:0] _652;
    wire _653;
    wire [16:0] _646;
    reg [16:0] _649;
    wire [16:0] _641;
    wire [15:0] _68;
    wire [16:0] _640;
    wire [16:0] _642;
    reg [16:0] _645;
    wire [7:0] _70;
    wire [8:0] _660;
    wire [7:0] _662;
    wire [7:0] _663;
    wire [7:0] _664;
    wire [7:0] _666;
    wire [7:0] _71;
    reg [7:0] _634;
    wire [8:0] _659;
    wire [8:0] _661;
    wire _667;
    wire _668;
    wire _669;
    wire _671;
    wire _72;
    reg _639;
    wire [16:0] _650;
    wire gnd;
    wire [16:0] _636;
    wire _651;
    wire _654;
    wire _657;
    wire _635;
    wire _658;
    wire [15:0] _680;
    wire _630;
    wire _628;
    wire _109;
    wire _627;
    wire _629;
    wire _631;
    wire [15:0] _681;
    wire [15:0] _683;
    wire [15:0] _73;
    reg [15:0] _142;
    wire _149;
    wire _150;
    wire _139;
    wire _151;
    wire _168;
    wire _170;
    wire _179;
    wire [1:0] _75;
    wire _135;
    wire _136;
    wire _133;
    wire _137;
    wire _130;
    reg _127;
    wire vdd;
    wire _77;
    wire _79;
    wire _120;
    wire _119;
    wire _118;
    wire _117;
    wire _116;
    wire _115;
    wire _114;
    wire [7:0] _81;
    wire _113;
    wire [2:0] _83;
    reg _121;
    reg _124;
    wire _128;
    wire _129;
    wire _131;
    wire _138;
    wire _182;
    wire _85;
    wire _203;
    wire _87;
    wire _112;
    wire _204;
    wire [1:0] _743;
    wire [1:0] _745;
    wire _89;
    wire [1:0] _752;
    wire [1:0] _758;
    wire [1:0] _760;
    wire [1:0] _90;
    reg [1:0] g_mode;
    wire _107;
    wire _278;
    wire _279;
    wire _281;
    wire _285;
    wire _286;
    wire _291;
    wire _778;
    wire _92;
    wire _780;
    wire _94;
    wire _782;
    wire _96;
    wire _784;
    wire _97;
    reg _288;
    assign _274 = ~ _273;
    assign _267 = 3'b000;
    assign _268 = _266 == _267;
    assign _269 = ~ _268;
    assign _110 = _107 | _109;
    assign _99 = ~ _92;
    assign _100 = _96 & _99;
    assign _101 = _100 & _87;
    assign _111 = _101 & _110;
    assign _270 = _111 & _269;
    assign _275 = _270 & _274;
    assign _276 = _133 | _107;
    assign _315 = 3'b001;
    assign _316 = _314 ? _315 : _298;
    assign _296 = 3'b100;
    assign _295 = 3'b010;
    assign _297 = _288 ? _296 : _295;
    assign _298 = _291 ? _297 : _294;
    assign _317 = _204 ? _316 : _298;
    assign _319 = _94 ? _267 : _317;
    assign _321 = _96 ? _267 : _319;
    assign _3 = _321;
    always @(posedge _79) begin
        if (_77)
            _294 <= _267;
        else
            _294 <= _3;
    end
    assign _323 = 1'b0;
    assign _327 = 1'b1;
    assign _328 = _314 ? _327 : _326;
    assign _326 = _291 ? _327 : _324;
    assign _329 = _204 ? _328 : _326;
    assign _331 = _94 ? _323 : _329;
    assign _333 = _96 ? _323 : _331;
    assign _5 = _333;
    always @(posedge _79) begin
        if (_77)
            _324 <= _323;
        else
            _324 <= _5;
    end
    assign _344 = 16'b0000000000000000;
    assign _8 = cfg_sync_mask;
    assign _10 = cfg_sync;
    assign _342 = _341 ^ _10;
    assign _343 = _342 & _8;
    assign _345 = _343 == _344;
    assign _347 = _345 ? _327 : _336;
    assign _348 = _213 ? _347 : _336;
    assign _349 = _314 ? _336 : _348;
    assign _350 = _204 ? _349 : _336;
    assign _352 = _94 ? _323 : _350;
    assign _354 = _96 ? _323 : _352;
    assign _11 = _354;
    always @(posedge _79) begin
        if (_77)
            _336 <= _323;
        else
            _336 <= _11;
    end
    assign _367 = _304 == _366;
    assign _368 = ~ _367;
    assign _370 = _361 ? _369 : g_crc_bad;
    assign _371 = _213 ? _370 : g_crc_bad;
    assign _372 = _314 ? g_crc_bad : _371;
    assign _373 = _204 ? _372 : g_crc_bad;
    assign _375 = _94 ? _323 : _373;
    assign _13 = _375;
    always @(posedge _79) begin
        if (_77)
            g_crc_bad <= _323;
        else
            g_crc_bad <= _13;
    end
    assign _369 = g_crc_bad | _368;
    assign _381 = ~ _369;
    assign _379 = 6'b000001;
    assign _380 = g_left == _379;
    assign _382 = _380 ? _381 : _378;
    assign _383 = _361 ? _382 : _378;
    assign _384 = _213 ? _383 : _378;
    assign _385 = _314 ? _378 : _384;
    assign _386 = _204 ? _385 : _378;
    assign _388 = _94 ? _323 : _386;
    assign _390 = _96 ? _323 : _388;
    assign _14 = _390;
    always @(posedge _79) begin
        if (_77)
            _378 <= _323;
        else
            _378 <= _14;
    end
    assign _399 = _237 ? _398 : g_byte;
    assign _400 = _273 ? _398 : _399;
    assign _406 = ~ _273;
    assign _265 = g_bitpos + _315;
    assign _257 = ~ _212;
    assign g_tx_bit = _247 & _255;
    assign _258 = g_tx_bit & _257;
    assign _259 = _258 & g_data_left;
    assign _260 = _237 | _259;
    assign _266 = _260 ? _265 : g_bitpos;
    assign _403 = _266 == _267;
    assign _404 = ~ _403;
    assign _401 = _92 & _87;
    assign _405 = _401 & _404;
    assign _407 = _405 & _406;
    assign _271 = 3'b111;
    assign _272 = g_bitpos == _271;
    assign _273 = _237 & _272;
    assign _408 = _273 | _407;
    assign _415 = ~ _28;
    assign _414 = _247 & _413;
    assign _416 = _414 & _415;
    assign _444 = _255 ? _443 : _419;
    assign _445 = _247 ? _444 : _419;
    assign _20 = _445;
    always @(posedge _79) begin
        if (_77)
            _419 <= _323;
        else
            _419 <= _20;
    end
    assign _772 = ~ _443;
    assign _770 = ~ _288;
    assign _771 = _443 ? _288 : _770;
    always @* begin
        case (_75)
        0:
            _773 <= _443;
        1:
            _773 <= _771;
        2:
            _773 <= _772;
        default:
            _773 <= _443;
        endcase
    end
    assign _774 = _255 ? _773 : _327;
    assign _775 = _247 ? _774 : _288;
    assign _767 = ~ _246;
    assign _763 = 2'b10;
    assign _764 = _75 == _763;
    assign _761 = ~ _87;
    assign _762 = _107 & _761;
    assign _765 = _762 & _764;
    assign _766 = _765 & _203;
    assign _768 = _766 & _767;
    assign _776 = _768 ? _419 : _775;
    assign _289 = _124 == _288;
    assign _290 = ~ _289;
    assign _283 = _75 == _763;
    assign _284 = ~ _283;
    assign _280 = ~ _85;
    assign _22 = cfg_readback;
    assign _277 = ~ _87;
    assign _103 = 2'b00;
    assign _756 = 2'b01;
    assign _753 = ~ _85;
    assign _754 = _87 & _753;
    assign _757 = _754 ? _756 : _763;
    assign _746 = ~ _255;
    assign _747 = _247 & _746;
    assign _748 = _109 | _747;
    assign _749 = _748 | _738;
    assign _751 = _749 ? _763 : _745;
    assign _739 = 2'b11;
    assign _732 = g_run + _315;
    assign _729 = g_run + _315;
    assign _725 = vdd == g_last;
    assign _723 = g_run == _267;
    assign _724 = ~ _723;
    assign _726 = _724 & _725;
    assign _730 = _726 ? _729 : _315;
    assign _721 = _62 == _763;
    assign _733 = _721 ? _732 : _730;
    assign _734 = _733 == _24;
    assign _715 = g_run + _315;
    assign _711 = gnd == g_last;
    assign _709 = g_run == _267;
    assign _710 = ~ _709;
    assign _712 = _710 & _711;
    assign _716 = _712 ? _715 : _315;
    assign _707 = _62 == _763;
    assign _718 = _707 ? _267 : _716;
    assign _719 = _718 == _24;
    assign _735 = _304 ? _734 : _719;
    assign _736 = _207 & _735;
    assign _737 = ~ _736;
    assign _703 = g_left == _379;
    assign _700 = 6'b000000;
    assign _701 = g_left == _700;
    assign _704 = _361 ? _703 : _701;
    assign _695 = 16'b0000000000000001;
    assign _696 = g_cnt + _695;
    assign _697 = _696 == _226;
    assign _694 = g_cnt == _226;
    assign _698 = _228 ? _697 : _694;
    assign _692 = ~ _314;
    assign _693 = _204 & _692;
    assign _699 = _693 & _698;
    assign _705 = _699 & _704;
    assign _738 = _705 & _737;
    assign _740 = _738 ? _739 : _691;
    assign _742 = _314 ? _103 : _740;
    assign _24 = cfg_stuff_len;
    assign _620 = g_run + _315;
    assign _621 = _304 ? _620 : _267;
    assign _616 = g_run + _315;
    assign _612 = _304 == g_last;
    assign _610 = g_run == _267;
    assign _611 = ~ _610;
    assign _613 = _611 & _612;
    assign _617 = _613 ? _616 : _315;
    assign _608 = _62 == _763;
    assign _622 = _608 ? _621 : _617;
    assign _623 = _314 ? _606 : _622;
    assign _602 = g_run + _315;
    assign _603 = _443 ? _602 : _267;
    assign _598 = g_run + _315;
    assign _440 = _432[7:7];
    assign _439 = _432[6:6];
    assign _438 = _432[5:5];
    assign _437 = _432[4:4];
    assign _436 = _432[3:3];
    assign _435 = _432[2:2];
    assign _434 = _432[1:1];
    assign _430 = _422[7:7];
    assign _429 = _422[6:6];
    assign _428 = _422[5:5];
    assign _427 = _422[4:4];
    assign _426 = _422[3:3];
    assign _425 = _422[2:2];
    assign _424 = _422[1:1];
    assign _420 = 8'b11111111;
    assign _26 = tx_head;
    assign _28 = tx_empty;
    assign _421 = _28 ? _420 : _26;
    assign _392 = 8'b00000000;
    assign _396 = g_byte[7:1];
    assign _397 = { _304,
                    _396 };
    assign _394 = g_byte[6:0];
    assign _395 = { _394,
                    _304 };
    assign _398 = _31 ? _397 : _395;
    assign _450 = _237 ? _398 : _449;
    assign _451 = _228 ? _450 : _449;
    assign _452 = _213 ? _451 : _449;
    assign _453 = _314 ? _449 : _452;
    assign _446 = g_data_left ? _422 : g_byte;
    assign _447 = _212 ? g_byte : _446;
    assign _448 = _255 ? _447 : g_byte;
    assign _449 = _247 ? _448 : g_byte;
    assign _454 = _204 ? _453 : _449;
    assign _29 = _454;
    always @(posedge _79) begin
        if (_77)
            g_byte <= _392;
        else
            g_byte <= _29;
    end
    assign _412 = g_bitpos == _267;
    assign _409 = ~ _212;
    assign _410 = _409 & g_data_left;
    assign _413 = _410 & _412;
    assign _422 = _413 ? _421 : g_byte;
    assign _423 = _422[0:0];
    assign _431 = { _423,
                    _424,
                    _425,
                    _426,
                    _427,
                    _428,
                    _429,
                    _430 };
    assign _31 = cfg_lsb_first;
    assign _432 = _31 ? _422 : _431;
    assign _433 = _432[0:0];
    assign _462 = g_bitpos + _315;
    assign _233 = g_cnt[5:0];
    assign _234 = _233 < _50;
    assign _235 = ~ _234;
    assign _230 = 10'b0000000000;
    assign _229 = g_cnt[15:6];
    assign _231 = _229 == _230;
    assign _232 = ~ _231;
    assign _236 = _232 | _235;
    assign _237 = _228 & _236;
    assign _463 = _237 ? _462 : _460;
    assign _464 = _228 ? _463 : _460;
    assign _465 = _213 ? _464 : _460;
    assign _466 = _314 ? _460 : _465;
    assign _456 = g_bitpos + _315;
    assign _457 = g_data_left ? _456 : g_bitpos;
    assign _458 = _212 ? g_bitpos : _457;
    assign _459 = _255 ? _458 : g_bitpos;
    assign _460 = _247 ? _459 : g_bitpos;
    assign _467 = _204 ? _466 : _460;
    assign _469 = _94 ? _267 : _467;
    assign _32 = _469;
    always @(posedge _79) begin
        if (_77)
            g_bitpos <= _267;
        else
            g_bitpos <= _32;
    end
    always @* begin
        case (g_bitpos)
        0:
            _441 <= _433;
        1:
            _441 <= _434;
        2:
            _441 <= _435;
        3:
            _441 <= _436;
        4:
            _441 <= _437;
        5:
            _441 <= _438;
        6:
            _441 <= _439;
        default:
            _441 <= _440;
        endcase
    end
    assign _34 = cfg_crc_inv;
    assign _363 = 32'b00000000000000000000000000000000;
    assign _36 = cfg_init;
    assign _509 = g_crc[30:0];
    assign _511 = { _509,
                    _323 };
    assign _503 = g_crc[31:31];
    assign _504 = _304 ^ _503;
    assign _506 = _504 ? _41 : _363;
    assign _500 = g_crc[30:0];
    assign _502 = { _500,
                    _323 };
    assign _507 = _502 ^ _506;
    assign _508 = _228 ? _507 : _499;
    assign _38 = cfg_crc_width;
    assign _477 = g_left - _379;
    assign _478 = _361 ? _477 : _475;
    assign _479 = _213 ? _478 : _475;
    assign _480 = _314 ? _475 : _479;
    assign _471 = g_left - _379;
    assign _472 = g_data_left ? g_left : _471;
    assign _473 = _212 ? g_left : _472;
    assign _474 = _255 ? _473 : g_left;
    assign _475 = _247 ? _474 : g_left;
    assign _481 = _204 ? _480 : _475;
    assign _482 = _89 ? _38 : _481;
    assign _484 = _94 ? _700 : _482;
    assign _39 = _484;
    always @(posedge _79) begin
        if (_77)
            g_left <= _700;
        else
            g_left <= _39;
    end
    assign _253 = g_left == _700;
    assign _254 = ~ _253;
    assign _359 = ~ g_data_left;
    assign _358 = _204 & _213;
    assign _360 = _358 & _359;
    assign _361 = _360 & _254;
    assign _512 = _361 ? _511 : _508;
    assign _513 = _213 ? _512 : _499;
    assign _514 = _314 ? _499 : _513;
    assign _41 = cfg_poly;
    assign _491 = g_crc[31:31];
    assign _492 = _443 ^ _491;
    assign _494 = _492 ? _41 : _363;
    assign _488 = g_crc[30:0];
    assign _490 = { _488,
                    _323 };
    assign _495 = _490 ^ _494;
    assign _485 = g_crc[30:0];
    assign _487 = { _485,
                    _323 };
    assign _496 = g_data_left ? _495 : _487;
    assign _497 = _212 ? g_crc : _496;
    assign _498 = _255 ? _497 : g_crc;
    assign _499 = _247 ? _498 : g_crc;
    assign _515 = _204 ? _514 : _499;
    assign _516 = _94 ? _36 : _515;
    assign _518 = _96 ? _363 : _516;
    assign _42 = _518;
    always @(posedge _79) begin
        if (_77)
            g_crc <= _363;
        else
            g_crc <= _42;
    end
    assign _365 = g_crc[31:31];
    assign _366 = _365 ^ _34;
    assign _534 = _533 ? _531 : g_lim;
    assign _535 = g_len_cap ? _534 : g_lim;
    assign _43 = _535;
    always @(posedge _79) begin
        if (_77)
            g_lim <= _392;
        else
            g_lim <= _43;
    end
    assign _225 = { _392,
                    g_lim };
    assign _45 = cfg_frame_bits;
    assign _340 = g_sr[14:0];
    assign _341 = { _340,
                    _304 };
    assign _536 = _213 ? _341 : g_sr;
    assign _537 = _314 ? g_sr : _536;
    assign _538 = _204 ? _537 : g_sr;
    assign _540 = _94 ? _344 : _538;
    assign _46 = _540;
    always @(posedge _79) begin
        if (_77)
            g_sr <= _344;
        else
            g_sr <= _46;
    end
    assign _526 = g_sr[3:0];
    assign _48 = cfg_len_max;
    assign _527 = _48 < _526;
    assign _528 = _527 ? _48 : _526;
    assign _530 = { _323,
                    _528,
                    _267 };
    assign _50 = cfg_skip;
    assign _524 = { _103,
                    _50 };
    assign _531 = _524 + _530;
    assign _532 = { _392,
                    _531 };
    assign _533 = _532 < _45;
    assign _559 = _533 ? _327 : g_len_known;
    assign _52 = cfg_len_pos;
    assign _545 = g_cnt[5:0];
    assign _546 = _545 == _52;
    assign _541 = g_cnt[15:6];
    assign _543 = _541 == _230;
    assign _54 = cfg_len_en;
    assign _544 = _54 & _543;
    assign _547 = _544 & _546;
    assign _549 = _547 ? _327 : g_len_cap;
    assign _550 = _228 ? _549 : g_len_cap;
    assign _551 = _213 ? _550 : g_len_cap;
    assign _552 = _314 ? g_len_cap : _551;
    assign _553 = _204 ? _552 : g_len_cap;
    assign _555 = g_len_cap ? _323 : _553;
    assign _557 = _94 ? _323 : _555;
    assign _55 = _557;
    always @(posedge _79) begin
        if (_77)
            g_len_cap <= _323;
        else
            g_len_cap <= _55;
    end
    assign _560 = g_len_cap ? _559 : g_len_known;
    assign _562 = _94 ? _323 : _560;
    assign _56 = _562;
    always @(posedge _79) begin
        if (_77)
            g_len_known <= _323;
        else
            g_len_known <= _56;
    end
    assign _226 = g_len_known ? _225 : _45;
    assign _582 = g_cnt + _695;
    assign _214 = _204 & _213;
    assign _228 = _214 & g_data_left;
    assign _583 = _228 ? _582 : _580;
    assign _213 = ~ _212;
    assign _584 = _213 ? _583 : _580;
    assign _565 = _314 ? _564 : _304;
    assign _563 = _255 ? _443 : g_last;
    assign _564 = _247 ? _563 : g_last;
    assign _566 = _204 ? _565 : _564;
    assign _568 = _94 ? _327 : _566;
    assign _57 = _568;
    always @(posedge _79) begin
        if (_77)
            g_last <= vdd;
        else
            g_last <= _57;
    end
    assign _310 = ~ g_last;
    assign _306 = _62 == _756;
    assign _311 = _306 ? _310 : gnd;
    assign _570 = _75 == _756;
    assign _571 = _570 ? _124 : g_prev;
    assign _572 = _204 ? _571 : g_prev;
    assign _574 = _94 ? _327 : _572;
    assign _58 = _574;
    always @(posedge _79) begin
        if (_77)
            g_prev <= vdd;
        else
            g_prev <= _58;
    end
    assign _303 = _124 == g_prev;
    assign _300 = _75 == _756;
    assign _304 = _300 ? _303 : _124;
    assign _312 = _304 == _311;
    assign _313 = ~ _312;
    assign _314 = _212 & _313;
    assign _585 = _314 ? _580 : _584;
    assign _576 = g_cnt + _695;
    assign _577 = g_data_left ? _576 : g_cnt;
    assign _578 = _212 ? g_cnt : _577;
    assign _579 = _255 ? _578 : g_cnt;
    assign _580 = _247 ? _579 : g_cnt;
    assign _586 = _204 ? _585 : _580;
    assign _588 = _94 ? _344 : _586;
    assign _59 = _588;
    always @(posedge _79) begin
        if (_77)
            g_cnt <= _344;
        else
            g_cnt <= _59;
    end
    assign g_data_left = g_cnt < _226;
    assign _442 = g_data_left ? _441 : _366;
    assign _443 = _212 ? _311 : _442;
    assign _594 = _443 == g_last;
    assign _592 = g_run == _267;
    assign _593 = ~ _592;
    assign _595 = _593 & _594;
    assign _599 = _595 ? _598 : _315;
    assign _590 = _62 == _763;
    assign _604 = _590 ? _603 : _599;
    assign _605 = _255 ? _604 : g_run;
    assign _606 = _247 ? _605 : g_run;
    assign _624 = _204 ? _623 : _606;
    assign _626 = _94 ? _267 : _624;
    assign _60 = _626;
    always @(posedge _79) begin
        if (_77)
            g_run <= _267;
        else
            g_run <= _60;
    end
    assign _211 = g_run == _24;
    assign _62 = cfg_stuff;
    assign _206 = _62 == _103;
    assign _207 = ~ _206;
    assign _212 = _207 & _211;
    assign _248 = _212 | g_data_left;
    assign _255 = _248 | _254;
    assign _688 = _255 ? _686 : _739;
    assign _684 = _133 & _131;
    assign _686 = _684 ? _763 : g_mode;
    assign _243 = _177 == _344;
    assign _241 = _142 == _344;
    assign _244 = _170 ? _243 : _241;
    assign _245 = _138 ? vdd : _244;
    assign _246 = _85 ? _202 : _245;
    assign _238 = ~ _87;
    assign _239 = _107 & _238;
    assign _247 = _239 & _246;
    assign _689 = _247 ? _688 : _686;
    assign _691 = _291 ? _103 : _689;
    assign _200 = ~ _194;
    assign _201 = _197 & _200;
    always @(posedge _79) begin
        if (_77)
            _197 <= _323;
        else
            _197 <= _194;
    end
    assign _198 = ~ _197;
    assign _190 = _81[7:7];
    assign _189 = _81[6:6];
    assign _188 = _81[5:5];
    assign _187 = _81[4:4];
    assign _186 = _81[3:3];
    assign _185 = _81[2:2];
    assign _184 = _81[1:1];
    assign _183 = _81[0:0];
    assign _64 = cfg_clk_pin;
    always @* begin
        case (_64)
        0:
            _191 <= _183;
        1:
            _191 <= _184;
        2:
            _191 <= _185;
        3:
            _191 <= _186;
        4:
            _191 <= _187;
        5:
            _191 <= _188;
        6:
            _191 <= _189;
        default:
            _191 <= _190;
        endcase
    end
    always @(posedge _79) begin
        if (_77)
            _194 <= _323;
        else
            _194 <= _191;
    end
    assign _199 = _194 & _198;
    assign _66 = cfg_clk_edge;
    assign _202 = _66 ? _201 : _199;
    assign _181 = _166 == _344;
    assign _178 = _177 == _166;
    assign _171 = _142 == _166;
    assign _169 = ~ _133;
    assign _160 = _68[15:2];
    assign _161 = { _103,
                    _160 };
    assign _157 = _68[15:1];
    assign _158 = { _323,
                    _157 };
    assign _162 = _158 + _161;
    assign _154 = _68[15:1];
    assign _155 = { _323,
                    _154 };
    assign _152 = _87 & _135;
    assign _163 = _152 ? _162 : _155;
    always @(posedge _79) begin
        if (_77)
            _166 <= _344;
        else
            _166 <= _163;
    end
    assign _167 = _142 < _166;
    assign _144 = _68[15:2];
    assign _145 = { _103,
                    _144 };
    always @(posedge _79) begin
        if (_77)
            _148 <= _344;
        else
            _148 <= _145;
    end
    assign _672 = ~ _133;
    assign _673 = _168 & _672;
    assign _674 = _673 ? _177 : _142;
    assign _676 = _138 ? _344 : _674;
    assign _678 = _676 + _695;
    assign _655 = 17'b00000000000000000;
    assign _656 = _650 == _655;
    assign _173 = _68[15:1];
    assign _174 = { _323,
                    _173 };
    always @(posedge _79) begin
        if (_77)
            _177 <= _344;
        else
            _177 <= _174;
    end
    assign _652 = { gnd,
                    _177 };
    assign _653 = _652 == _650;
    assign _646 = { gnd,
                    _68 };
    always @(posedge _79) begin
        if (_77)
            _649 <= _655;
        else
            _649 <= _646;
    end
    assign _641 = 17'b00000000000000001;
    assign _68 = cfg_div_int;
    assign _640 = { gnd,
                    _68 };
    assign _642 = _640 - _641;
    always @(posedge _79) begin
        if (_77)
            _645 <= _655;
        else
            _645 <= _642;
    end
    assign _70 = cfg_div_frac;
    assign _660 = { gnd,
                    _70 };
    assign _662 = _661[7:0];
    assign _663 = _658 ? _662 : _634;
    assign _664 = _631 ? _663 : _634;
    assign _666 = _94 ? _392 : _664;
    assign _71 = _666;
    always @(posedge _79) begin
        if (_77)
            _634 <= _392;
        else
            _634 <= _71;
    end
    assign _659 = { gnd,
                    _634 };
    assign _661 = _659 + _660;
    assign _667 = _661[8:8];
    assign _668 = _658 ? _667 : _639;
    assign _669 = _631 ? _668 : _639;
    assign _671 = _94 ? _323 : _669;
    assign _72 = _671;
    always @(posedge _79) begin
        if (_77)
            _639 <= _323;
        else
            _639 <= _72;
    end
    assign _650 = _639 ? _649 : _645;
    assign gnd = 1'b0;
    assign _636 = { gnd,
                    _142 };
    assign _651 = _636 == _650;
    assign _654 = _170 ? _653 : _651;
    assign _657 = _138 ? _656 : _654;
    assign _635 = ~ _85;
    assign _658 = _635 & _657;
    assign _680 = _658 ? _344 : _678;
    assign _630 = ~ _85;
    assign _628 = _133 & _131;
    assign _109 = g_mode == _739;
    assign _627 = _107 | _109;
    assign _629 = _627 | _628;
    assign _631 = _629 & _630;
    assign _681 = _631 ? _680 : _142;
    assign _683 = _94 ? _344 : _681;
    assign _73 = _683;
    always @(posedge _79) begin
        if (_77)
            _142 <= _344;
        else
            _142 <= _73;
    end
    assign _149 = _142 < _148;
    assign _150 = ~ _149;
    assign _139 = _131 & _135;
    assign _151 = _139 & _150;
    assign _168 = _151 & _167;
    assign _170 = _168 & _169;
    assign _179 = _170 ? _178 : _171;
    assign _75 = cfg_code;
    assign _135 = _75 == _763;
    assign _136 = ~ _135;
    assign _133 = g_mode == _756;
    assign _137 = _133 | _136;
    assign _130 = ~ _85;
    always @(posedge _79) begin
        if (_77)
            _127 <= _323;
        else
            _127 <= _124;
    end
    assign vdd = 1'b1;
    assign _77 = clear;
    assign _79 = clock;
    assign _120 = _81[7:7];
    assign _119 = _81[6:6];
    assign _118 = _81[5:5];
    assign _117 = _81[4:4];
    assign _116 = _81[3:3];
    assign _115 = _81[2:2];
    assign _114 = _81[1:1];
    assign _81 = sync1;
    assign _113 = _81[0:0];
    assign _83 = cfg_data_pin;
    always @* begin
        case (_83)
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
    always @(posedge _79) begin
        if (_77)
            _124 <= _323;
        else
            _124 <= _121;
    end
    assign _128 = _124 ^ _127;
    assign _129 = _87 & _128;
    assign _131 = _129 & _130;
    assign _138 = _131 & _137;
    assign _182 = _138 ? _181 : _179;
    assign _85 = cfg_clk_pin_en;
    assign _203 = _85 ? _202 : _182;
    assign _87 = cfg_dir;
    assign _112 = _107 & _87;
    assign _204 = _112 & _203;
    assign _743 = _204 ? _742 : _691;
    assign _745 = _92 ? _103 : _743;
    assign _89 = crc_cmd;
    assign _752 = _89 ? _751 : _745;
    assign _758 = _94 ? _757 : _752;
    assign _760 = _96 ? _103 : _758;
    assign _90 = _760;
    always @(posedge _79) begin
        if (_77)
            g_mode <= _103;
        else
            g_mode <= _90;
    end
    assign _107 = g_mode == _763;
    assign _278 = _107 & _277;
    assign _279 = _278 & _22;
    assign _281 = _279 & _280;
    assign _285 = _281 & _284;
    assign _286 = _285 & _203;
    assign _291 = _286 & _290;
    assign _778 = _291 ? _327 : _776;
    assign _92 = end_;
    assign _780 = _92 ? _327 : _778;
    assign _94 = go;
    assign _782 = _94 ? _327 : _780;
    assign _96 = reset;
    assign _784 = _96 ? _327 : _782;
    assign _97 = _784;
    always @(posedge _79) begin
        if (_77)
            _288 <= vdd;
        else
            _288 <= _97;
    end
    assign out = _288;
    assign pop = _416;
    assign push = _408;
    assign push_data = _400;
    assign done_ = _109;
    assign crc_ok = _378;
    assign sync_hit = _336;
    assign error = _324;
    assign err_kind = _294;
    assign active = _276;
    assign lost = _275;

endmodule
