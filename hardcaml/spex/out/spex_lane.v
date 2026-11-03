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
    input [3:0] cfg_len_max;
    input [5:0] cfg_skip;
    input [5:0] cfg_len_pos;
    input cfg_len_en;
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

    wire _282;
    wire [2:0] _275;
    wire _276;
    wire _277;
    wire _112;
    wire _101;
    wire _102;
    wire _103;
    wire _113;
    wire _278;
    wire _283;
    wire _284;
    wire [2:0] _323;
    wire [2:0] _324;
    wire [2:0] _304;
    wire [2:0] _303;
    wire [2:0] _305;
    wire [2:0] _306;
    wire [2:0] _325;
    wire [2:0] _327;
    wire [2:0] _329;
    wire [2:0] _3;
    reg [2:0] _302;
    wire _331;
    wire _335;
    wire _336;
    wire _334;
    wire _337;
    wire _339;
    wire _341;
    wire _5;
    reg _332;
    wire [15:0] _352;
    wire [15:0] _8;
    wire [15:0] _10;
    wire [15:0] _350;
    wire [15:0] _351;
    wire _353;
    wire _355;
    wire _356;
    wire _357;
    wire _358;
    wire _360;
    wire _362;
    wire _11;
    reg _344;
    wire _375;
    wire _376;
    wire _378;
    wire _379;
    wire _380;
    wire _381;
    wire _383;
    wire _13;
    reg g_crc_bad;
    wire _377;
    wire _389;
    wire [5:0] _387;
    wire _388;
    wire _390;
    wire _391;
    wire _392;
    wire _393;
    wire _394;
    wire _396;
    wire _398;
    wire _14;
    reg _386;
    wire [7:0] _407;
    wire [7:0] _408;
    wire _414;
    wire [2:0] _273;
    wire _265;
    wire g_tx_bit;
    wire _266;
    wire _267;
    wire _268;
    wire [2:0] _274;
    wire _411;
    wire _412;
    wire _409;
    wire _413;
    wire _415;
    wire [2:0] _279;
    wire _280;
    wire _281;
    wire _416;
    wire _423;
    wire _422;
    wire _424;
    wire _452;
    wire _453;
    wire _20;
    reg _427;
    wire _780;
    wire _778;
    wire _779;
    reg _781;
    wire _782;
    wire _783;
    wire _775;
    wire [1:0] _771;
    wire _772;
    wire _769;
    wire _770;
    wire _773;
    wire _774;
    wire _776;
    wire _784;
    wire _297;
    wire _298;
    wire _291;
    wire _292;
    wire _288;
    wire _22;
    wire _285;
    wire [1:0] _105;
    wire [1:0] _764;
    wire _761;
    wire _762;
    wire [1:0] _765;
    wire _754;
    wire _755;
    wire _756;
    wire _757;
    wire [1:0] _759;
    wire [1:0] _747;
    wire [2:0] _740;
    wire [2:0] _737;
    wire _733;
    wire _731;
    wire _732;
    wire _734;
    wire [2:0] _738;
    wire _729;
    wire [2:0] _741;
    wire _742;
    wire [2:0] _723;
    wire _719;
    wire _717;
    wire _718;
    wire _720;
    wire [2:0] _724;
    wire _715;
    wire [2:0] _726;
    wire _727;
    wire _743;
    wire _744;
    wire _745;
    wire _711;
    wire [5:0] _708;
    wire _709;
    wire _712;
    wire [15:0] _703;
    wire [15:0] _704;
    wire _705;
    wire _702;
    wire _706;
    wire _700;
    wire _701;
    wire _707;
    wire _713;
    wire _746;
    wire [1:0] _748;
    wire [1:0] _750;
    wire [2:0] _24;
    wire [2:0] _628;
    wire [2:0] _629;
    wire [2:0] _624;
    wire _620;
    wire _618;
    wire _619;
    wire _621;
    wire [2:0] _625;
    wire _616;
    wire [2:0] _630;
    wire [2:0] _631;
    wire [2:0] _610;
    wire [2:0] _611;
    wire [2:0] _606;
    wire _448;
    wire _447;
    wire _446;
    wire _445;
    wire _444;
    wire _443;
    wire _442;
    wire _438;
    wire _437;
    wire _436;
    wire _435;
    wire _434;
    wire _433;
    wire _432;
    wire [7:0] _428;
    wire [7:0] _26;
    wire _28;
    wire [7:0] _429;
    wire [7:0] _400;
    wire [6:0] _404;
    wire [7:0] _405;
    wire [6:0] _402;
    wire [7:0] _403;
    wire [7:0] _406;
    wire [7:0] _458;
    wire [7:0] _459;
    wire [7:0] _460;
    wire [7:0] _461;
    wire [7:0] _454;
    wire [7:0] _455;
    wire [7:0] _456;
    wire [7:0] _457;
    wire [7:0] _462;
    wire [7:0] _29;
    reg [7:0] g_byte;
    wire _420;
    wire _417;
    wire _418;
    wire _421;
    wire [7:0] _430;
    wire _431;
    wire [7:0] _439;
    wire _31;
    wire [7:0] _440;
    wire _441;
    wire [2:0] _470;
    wire [5:0] _241;
    wire _242;
    wire _243;
    wire [9:0] _238;
    wire [9:0] _237;
    wire _239;
    wire _240;
    wire _244;
    wire _245;
    wire [2:0] _471;
    wire [2:0] _472;
    wire [2:0] _473;
    wire [2:0] _474;
    wire [2:0] _464;
    wire [2:0] _465;
    wire [2:0] _466;
    wire [2:0] _467;
    wire [2:0] _468;
    wire [2:0] _475;
    wire [2:0] _477;
    wire [2:0] _32;
    reg [2:0] g_bitpos;
    reg _449;
    wire _34;
    wire [31:0] _371;
    wire [31:0] _36;
    wire [30:0] _517;
    wire [31:0] _519;
    wire _511;
    wire _512;
    wire [31:0] _514;
    wire [30:0] _508;
    wire [31:0] _510;
    wire [31:0] _515;
    wire [31:0] _516;
    wire [5:0] _38;
    wire [5:0] _485;
    wire [5:0] _486;
    wire [5:0] _487;
    wire [5:0] _488;
    wire [5:0] _479;
    wire [5:0] _480;
    wire [5:0] _481;
    wire [5:0] _482;
    wire [5:0] _483;
    wire [5:0] _489;
    wire [5:0] _490;
    wire [5:0] _492;
    wire [5:0] _39;
    reg [5:0] g_left;
    wire _261;
    wire _262;
    wire _367;
    wire _366;
    wire _368;
    wire _369;
    wire [31:0] _520;
    wire [31:0] _521;
    wire [31:0] _522;
    wire [31:0] _41;
    wire _499;
    wire _500;
    wire [31:0] _502;
    wire [30:0] _496;
    wire [31:0] _498;
    wire [31:0] _503;
    wire [30:0] _493;
    wire [31:0] _495;
    wire [31:0] _504;
    wire [31:0] _505;
    wire [31:0] _506;
    wire [31:0] _507;
    wire [31:0] _523;
    wire [31:0] _524;
    wire [31:0] _526;
    wire [31:0] _42;
    reg [31:0] g_crc;
    wire _373;
    wire _374;
    wire [7:0] _542;
    wire [7:0] _543;
    wire [7:0] _43;
    reg [7:0] _232;
    wire [15:0] _233;
    wire [15:0] _45;
    wire [14:0] _348;
    wire [15:0] _349;
    wire [15:0] _544;
    wire [15:0] _545;
    wire [15:0] _546;
    wire [15:0] _548;
    wire [15:0] _46;
    reg [15:0] _347;
    wire [3:0] _534;
    wire [3:0] _48;
    wire _535;
    wire [3:0] _536;
    wire [7:0] _538;
    wire [5:0] _50;
    wire [7:0] _532;
    wire [7:0] _539;
    wire [15:0] _540;
    wire _541;
    wire _567;
    wire [5:0] _52;
    wire [5:0] _553;
    wire _554;
    wire [9:0] _549;
    wire _551;
    wire _54;
    wire _552;
    wire _555;
    wire _557;
    wire _558;
    wire _559;
    wire _560;
    wire _561;
    wire _563;
    wire _565;
    wire _55;
    reg g_len_cap;
    wire _568;
    wire _570;
    wire _56;
    reg g_len_known;
    wire [15:0] _234;
    wire [15:0] _590;
    wire _222;
    wire _236;
    wire [15:0] _591;
    wire _221;
    wire [15:0] _592;
    wire _573;
    wire _571;
    wire _572;
    wire _574;
    wire _576;
    wire _57;
    reg g_last;
    wire _318;
    wire _314;
    wire _319;
    wire _578;
    wire _579;
    wire _580;
    wire _582;
    wire _58;
    reg g_prev;
    wire _311;
    wire _308;
    wire _312;
    wire _320;
    wire _321;
    wire _322;
    wire [15:0] _593;
    wire [15:0] _584;
    wire [15:0] _585;
    wire [15:0] _586;
    wire [15:0] _587;
    wire [15:0] _588;
    wire [15:0] _594;
    wire [15:0] _596;
    wire [15:0] _59;
    reg [15:0] g_cnt;
    wire g_data_left;
    wire _450;
    wire _451;
    wire _602;
    wire _600;
    wire _601;
    wire _603;
    wire [2:0] _607;
    wire _598;
    wire [2:0] _612;
    wire [2:0] _613;
    wire [2:0] _614;
    wire [2:0] _632;
    wire [2:0] _634;
    wire [2:0] _60;
    reg [2:0] g_run;
    wire _219;
    wire [1:0] _62;
    wire _214;
    wire _215;
    wire _220;
    wire _256;
    wire _263;
    wire [1:0] _696;
    wire _692;
    wire [1:0] _694;
    wire _251;
    wire _249;
    wire _252;
    wire _253;
    wire _254;
    wire _246;
    wire _247;
    wire _255;
    wire [1:0] _697;
    wire [1:0] _699;
    wire _208;
    wire _209;
    wire _204;
    wire _203;
    wire _202;
    wire _201;
    wire _200;
    wire _199;
    wire _198;
    wire _197;
    reg _205;
    wire _206;
    wire _195;
    wire _194;
    wire _193;
    wire _192;
    wire _191;
    wire _190;
    wire _189;
    wire _188;
    wire [2:0] _64;
    reg _196;
    wire _207;
    wire _66;
    wire _210;
    wire _186;
    wire _183;
    wire _176;
    wire _174;
    wire [13:0] _165;
    wire [15:0] _166;
    wire [14:0] _162;
    wire [15:0] _163;
    wire [15:0] _167;
    wire [14:0] _159;
    wire [15:0] _160;
    wire _157;
    wire [15:0] _168;
    reg [15:0] _171;
    wire _172;
    wire [13:0] _149;
    wire [15:0] _150;
    reg [15:0] _153;
    wire _680;
    wire _681;
    wire [15:0] _682;
    wire [15:0] _684;
    wire [15:0] _686;
    wire [16:0] _663;
    wire _664;
    wire [14:0] _178;
    wire [15:0] _179;
    reg [15:0] _182;
    wire [16:0] _660;
    wire _661;
    wire [16:0] _654;
    reg [16:0] _657;
    wire [16:0] _649;
    wire [15:0] _68;
    wire [16:0] _648;
    wire [16:0] _650;
    reg [16:0] _653;
    wire [7:0] _70;
    wire [8:0] _668;
    wire vdd;
    wire _72;
    wire _74;
    wire [7:0] _670;
    wire [7:0] _671;
    wire [7:0] _672;
    wire [7:0] _674;
    wire [7:0] _75;
    reg [7:0] _642;
    wire [8:0] _667;
    wire [8:0] _669;
    wire _675;
    wire _676;
    wire _677;
    wire _679;
    wire _76;
    reg _647;
    wire [16:0] _658;
    wire gnd;
    wire [16:0] _644;
    wire _659;
    wire _662;
    wire _665;
    wire _643;
    wire _666;
    wire [15:0] _688;
    wire _638;
    wire _636;
    wire _111;
    wire _635;
    wire _637;
    wire _639;
    wire [15:0] _689;
    wire [15:0] _691;
    wire [15:0] _77;
    reg [15:0] _147;
    wire _154;
    wire _155;
    wire _144;
    wire _156;
    wire _173;
    wire _175;
    wire _184;
    wire [1:0] _79;
    wire _140;
    wire _141;
    wire _138;
    wire _142;
    wire _135;
    wire _131;
    wire _130;
    wire _129;
    wire _128;
    wire _127;
    wire _126;
    wire _125;
    wire [7:0] _81;
    wire _124;
    reg _132;
    wire _122;
    wire _121;
    wire _120;
    wire _119;
    wire _118;
    wire _117;
    wire _116;
    wire [7:0] _83;
    wire _115;
    wire [2:0] _85;
    reg _123;
    wire _133;
    wire _134;
    wire _136;
    wire _143;
    wire _187;
    wire _87;
    wire _211;
    wire _89;
    wire _114;
    wire _212;
    wire [1:0] _751;
    wire [1:0] _753;
    wire _91;
    wire [1:0] _760;
    wire [1:0] _766;
    wire [1:0] _768;
    wire [1:0] _92;
    reg [1:0] g_mode;
    wire _109;
    wire _286;
    wire _287;
    wire _289;
    wire _293;
    wire _294;
    wire _299;
    wire _786;
    wire _94;
    wire _788;
    wire _96;
    wire _790;
    wire _98;
    wire _792;
    wire _99;
    reg _296;
    assign _282 = ~ _281;
    assign _275 = 3'b000;
    assign _276 = _274 == _275;
    assign _277 = ~ _276;
    assign _112 = _109 | _111;
    assign _101 = ~ _94;
    assign _102 = _98 & _101;
    assign _103 = _102 & _89;
    assign _113 = _103 & _112;
    assign _278 = _113 & _277;
    assign _283 = _278 & _282;
    assign _284 = _138 | _109;
    assign _323 = 3'b001;
    assign _324 = _322 ? _323 : _306;
    assign _304 = 3'b100;
    assign _303 = 3'b010;
    assign _305 = _296 ? _304 : _303;
    assign _306 = _299 ? _305 : _302;
    assign _325 = _212 ? _324 : _306;
    assign _327 = _96 ? _275 : _325;
    assign _329 = _98 ? _275 : _327;
    assign _3 = _329;
    always @(posedge _74) begin
        if (_72)
            _302 <= _275;
        else
            _302 <= _3;
    end
    assign _331 = 1'b0;
    assign _335 = 1'b1;
    assign _336 = _322 ? _335 : _334;
    assign _334 = _299 ? _335 : _332;
    assign _337 = _212 ? _336 : _334;
    assign _339 = _96 ? _331 : _337;
    assign _341 = _98 ? _331 : _339;
    assign _5 = _341;
    always @(posedge _74) begin
        if (_72)
            _332 <= _331;
        else
            _332 <= _5;
    end
    assign _352 = 16'b0000000000000000;
    assign _8 = cfg_sync_mask;
    assign _10 = cfg_sync;
    assign _350 = _349 ^ _10;
    assign _351 = _350 & _8;
    assign _353 = _351 == _352;
    assign _355 = _353 ? _335 : _344;
    assign _356 = _221 ? _355 : _344;
    assign _357 = _322 ? _344 : _356;
    assign _358 = _212 ? _357 : _344;
    assign _360 = _96 ? _331 : _358;
    assign _362 = _98 ? _331 : _360;
    assign _11 = _362;
    always @(posedge _74) begin
        if (_72)
            _344 <= _331;
        else
            _344 <= _11;
    end
    assign _375 = _312 == _374;
    assign _376 = ~ _375;
    assign _378 = _369 ? _377 : g_crc_bad;
    assign _379 = _221 ? _378 : g_crc_bad;
    assign _380 = _322 ? g_crc_bad : _379;
    assign _381 = _212 ? _380 : g_crc_bad;
    assign _383 = _96 ? _331 : _381;
    assign _13 = _383;
    always @(posedge _74) begin
        if (_72)
            g_crc_bad <= _331;
        else
            g_crc_bad <= _13;
    end
    assign _377 = g_crc_bad | _376;
    assign _389 = ~ _377;
    assign _387 = 6'b000001;
    assign _388 = g_left == _387;
    assign _390 = _388 ? _389 : _386;
    assign _391 = _369 ? _390 : _386;
    assign _392 = _221 ? _391 : _386;
    assign _393 = _322 ? _386 : _392;
    assign _394 = _212 ? _393 : _386;
    assign _396 = _96 ? _331 : _394;
    assign _398 = _98 ? _331 : _396;
    assign _14 = _398;
    always @(posedge _74) begin
        if (_72)
            _386 <= _331;
        else
            _386 <= _14;
    end
    assign _407 = _245 ? _406 : g_byte;
    assign _408 = _281 ? _406 : _407;
    assign _414 = ~ _281;
    assign _273 = g_bitpos + _323;
    assign _265 = ~ _220;
    assign g_tx_bit = _255 & _263;
    assign _266 = g_tx_bit & _265;
    assign _267 = _266 & g_data_left;
    assign _268 = _245 | _267;
    assign _274 = _268 ? _273 : g_bitpos;
    assign _411 = _274 == _275;
    assign _412 = ~ _411;
    assign _409 = _94 & _89;
    assign _413 = _409 & _412;
    assign _415 = _413 & _414;
    assign _279 = 3'b111;
    assign _280 = g_bitpos == _279;
    assign _281 = _245 & _280;
    assign _416 = _281 | _415;
    assign _423 = ~ _28;
    assign _422 = _255 & _421;
    assign _424 = _422 & _423;
    assign _452 = _263 ? _451 : _427;
    assign _453 = _255 ? _452 : _427;
    assign _20 = _453;
    always @(posedge _74) begin
        if (_72)
            _427 <= _331;
        else
            _427 <= _20;
    end
    assign _780 = ~ _451;
    assign _778 = ~ _296;
    assign _779 = _451 ? _296 : _778;
    always @* begin
        case (_79)
        0:
            _781 <= _451;
        1:
            _781 <= _779;
        2:
            _781 <= _780;
        default:
            _781 <= _451;
        endcase
    end
    assign _782 = _263 ? _781 : _335;
    assign _783 = _255 ? _782 : _296;
    assign _775 = ~ _254;
    assign _771 = 2'b10;
    assign _772 = _79 == _771;
    assign _769 = ~ _89;
    assign _770 = _109 & _769;
    assign _773 = _770 & _772;
    assign _774 = _773 & _211;
    assign _776 = _774 & _775;
    assign _784 = _776 ? _427 : _783;
    assign _297 = _123 == _296;
    assign _298 = ~ _297;
    assign _291 = _79 == _771;
    assign _292 = ~ _291;
    assign _288 = ~ _87;
    assign _22 = cfg_readback;
    assign _285 = ~ _89;
    assign _105 = 2'b00;
    assign _764 = 2'b01;
    assign _761 = ~ _87;
    assign _762 = _89 & _761;
    assign _765 = _762 ? _764 : _771;
    assign _754 = ~ _263;
    assign _755 = _255 & _754;
    assign _756 = _111 | _755;
    assign _757 = _756 | _746;
    assign _759 = _757 ? _771 : _753;
    assign _747 = 2'b11;
    assign _740 = g_run + _323;
    assign _737 = g_run + _323;
    assign _733 = vdd == g_last;
    assign _731 = g_run == _275;
    assign _732 = ~ _731;
    assign _734 = _732 & _733;
    assign _738 = _734 ? _737 : _323;
    assign _729 = _62 == _771;
    assign _741 = _729 ? _740 : _738;
    assign _742 = _741 == _24;
    assign _723 = g_run + _323;
    assign _719 = gnd == g_last;
    assign _717 = g_run == _275;
    assign _718 = ~ _717;
    assign _720 = _718 & _719;
    assign _724 = _720 ? _723 : _323;
    assign _715 = _62 == _771;
    assign _726 = _715 ? _275 : _724;
    assign _727 = _726 == _24;
    assign _743 = _312 ? _742 : _727;
    assign _744 = _215 & _743;
    assign _745 = ~ _744;
    assign _711 = g_left == _387;
    assign _708 = 6'b000000;
    assign _709 = g_left == _708;
    assign _712 = _369 ? _711 : _709;
    assign _703 = 16'b0000000000000001;
    assign _704 = g_cnt + _703;
    assign _705 = _704 == _234;
    assign _702 = g_cnt == _234;
    assign _706 = _236 ? _705 : _702;
    assign _700 = ~ _322;
    assign _701 = _212 & _700;
    assign _707 = _701 & _706;
    assign _713 = _707 & _712;
    assign _746 = _713 & _745;
    assign _748 = _746 ? _747 : _699;
    assign _750 = _322 ? _105 : _748;
    assign _24 = cfg_stuff_len;
    assign _628 = g_run + _323;
    assign _629 = _312 ? _628 : _275;
    assign _624 = g_run + _323;
    assign _620 = _312 == g_last;
    assign _618 = g_run == _275;
    assign _619 = ~ _618;
    assign _621 = _619 & _620;
    assign _625 = _621 ? _624 : _323;
    assign _616 = _62 == _771;
    assign _630 = _616 ? _629 : _625;
    assign _631 = _322 ? _614 : _630;
    assign _610 = g_run + _323;
    assign _611 = _451 ? _610 : _275;
    assign _606 = g_run + _323;
    assign _448 = _440[7:7];
    assign _447 = _440[6:6];
    assign _446 = _440[5:5];
    assign _445 = _440[4:4];
    assign _444 = _440[3:3];
    assign _443 = _440[2:2];
    assign _442 = _440[1:1];
    assign _438 = _430[7:7];
    assign _437 = _430[6:6];
    assign _436 = _430[5:5];
    assign _435 = _430[4:4];
    assign _434 = _430[3:3];
    assign _433 = _430[2:2];
    assign _432 = _430[1:1];
    assign _428 = 8'b11111111;
    assign _26 = tx_head;
    assign _28 = tx_empty;
    assign _429 = _28 ? _428 : _26;
    assign _400 = 8'b00000000;
    assign _404 = g_byte[7:1];
    assign _405 = { _312,
                    _404 };
    assign _402 = g_byte[6:0];
    assign _403 = { _402,
                    _312 };
    assign _406 = _31 ? _405 : _403;
    assign _458 = _245 ? _406 : _457;
    assign _459 = _236 ? _458 : _457;
    assign _460 = _221 ? _459 : _457;
    assign _461 = _322 ? _457 : _460;
    assign _454 = g_data_left ? _430 : g_byte;
    assign _455 = _220 ? g_byte : _454;
    assign _456 = _263 ? _455 : g_byte;
    assign _457 = _255 ? _456 : g_byte;
    assign _462 = _212 ? _461 : _457;
    assign _29 = _462;
    always @(posedge _74) begin
        if (_72)
            g_byte <= _400;
        else
            g_byte <= _29;
    end
    assign _420 = g_bitpos == _275;
    assign _417 = ~ _220;
    assign _418 = _417 & g_data_left;
    assign _421 = _418 & _420;
    assign _430 = _421 ? _429 : g_byte;
    assign _431 = _430[0:0];
    assign _439 = { _431,
                    _432,
                    _433,
                    _434,
                    _435,
                    _436,
                    _437,
                    _438 };
    assign _31 = cfg_lsb_first;
    assign _440 = _31 ? _430 : _439;
    assign _441 = _440[0:0];
    assign _470 = g_bitpos + _323;
    assign _241 = g_cnt[5:0];
    assign _242 = _241 < _50;
    assign _243 = ~ _242;
    assign _238 = 10'b0000000000;
    assign _237 = g_cnt[15:6];
    assign _239 = _237 == _238;
    assign _240 = ~ _239;
    assign _244 = _240 | _243;
    assign _245 = _236 & _244;
    assign _471 = _245 ? _470 : _468;
    assign _472 = _236 ? _471 : _468;
    assign _473 = _221 ? _472 : _468;
    assign _474 = _322 ? _468 : _473;
    assign _464 = g_bitpos + _323;
    assign _465 = g_data_left ? _464 : g_bitpos;
    assign _466 = _220 ? g_bitpos : _465;
    assign _467 = _263 ? _466 : g_bitpos;
    assign _468 = _255 ? _467 : g_bitpos;
    assign _475 = _212 ? _474 : _468;
    assign _477 = _96 ? _275 : _475;
    assign _32 = _477;
    always @(posedge _74) begin
        if (_72)
            g_bitpos <= _275;
        else
            g_bitpos <= _32;
    end
    always @* begin
        case (g_bitpos)
        0:
            _449 <= _441;
        1:
            _449 <= _442;
        2:
            _449 <= _443;
        3:
            _449 <= _444;
        4:
            _449 <= _445;
        5:
            _449 <= _446;
        6:
            _449 <= _447;
        default:
            _449 <= _448;
        endcase
    end
    assign _34 = cfg_crc_inv;
    assign _371 = 32'b00000000000000000000000000000000;
    assign _36 = cfg_init;
    assign _517 = g_crc[30:0];
    assign _519 = { _517,
                    _331 };
    assign _511 = g_crc[31:31];
    assign _512 = _312 ^ _511;
    assign _514 = _512 ? _41 : _371;
    assign _508 = g_crc[30:0];
    assign _510 = { _508,
                    _331 };
    assign _515 = _510 ^ _514;
    assign _516 = _236 ? _515 : _507;
    assign _38 = cfg_crc_width;
    assign _485 = g_left - _387;
    assign _486 = _369 ? _485 : _483;
    assign _487 = _221 ? _486 : _483;
    assign _488 = _322 ? _483 : _487;
    assign _479 = g_left - _387;
    assign _480 = g_data_left ? g_left : _479;
    assign _481 = _220 ? g_left : _480;
    assign _482 = _263 ? _481 : g_left;
    assign _483 = _255 ? _482 : g_left;
    assign _489 = _212 ? _488 : _483;
    assign _490 = _91 ? _38 : _489;
    assign _492 = _96 ? _708 : _490;
    assign _39 = _492;
    always @(posedge _74) begin
        if (_72)
            g_left <= _708;
        else
            g_left <= _39;
    end
    assign _261 = g_left == _708;
    assign _262 = ~ _261;
    assign _367 = ~ g_data_left;
    assign _366 = _212 & _221;
    assign _368 = _366 & _367;
    assign _369 = _368 & _262;
    assign _520 = _369 ? _519 : _516;
    assign _521 = _221 ? _520 : _507;
    assign _522 = _322 ? _507 : _521;
    assign _41 = cfg_poly;
    assign _499 = g_crc[31:31];
    assign _500 = _451 ^ _499;
    assign _502 = _500 ? _41 : _371;
    assign _496 = g_crc[30:0];
    assign _498 = { _496,
                    _331 };
    assign _503 = _498 ^ _502;
    assign _493 = g_crc[30:0];
    assign _495 = { _493,
                    _331 };
    assign _504 = g_data_left ? _503 : _495;
    assign _505 = _220 ? g_crc : _504;
    assign _506 = _263 ? _505 : g_crc;
    assign _507 = _255 ? _506 : g_crc;
    assign _523 = _212 ? _522 : _507;
    assign _524 = _96 ? _36 : _523;
    assign _526 = _98 ? _371 : _524;
    assign _42 = _526;
    always @(posedge _74) begin
        if (_72)
            g_crc <= _371;
        else
            g_crc <= _42;
    end
    assign _373 = g_crc[31:31];
    assign _374 = _373 ^ _34;
    assign _542 = _541 ? _539 : _232;
    assign _543 = g_len_cap ? _542 : _232;
    assign _43 = _543;
    always @(posedge _74) begin
        if (_72)
            _232 <= _400;
        else
            _232 <= _43;
    end
    assign _233 = { _400,
                    _232 };
    assign _45 = cfg_frame_bits;
    assign _348 = _347[14:0];
    assign _349 = { _348,
                    _312 };
    assign _544 = _221 ? _349 : _347;
    assign _545 = _322 ? _347 : _544;
    assign _546 = _212 ? _545 : _347;
    assign _548 = _96 ? _352 : _546;
    assign _46 = _548;
    always @(posedge _74) begin
        if (_72)
            _347 <= _352;
        else
            _347 <= _46;
    end
    assign _534 = _347[3:0];
    assign _48 = cfg_len_max;
    assign _535 = _48 < _534;
    assign _536 = _535 ? _48 : _534;
    assign _538 = { _331,
                    _536,
                    _275 };
    assign _50 = cfg_skip;
    assign _532 = { _105,
                    _50 };
    assign _539 = _532 + _538;
    assign _540 = { _400,
                    _539 };
    assign _541 = _540 < _45;
    assign _567 = _541 ? _335 : g_len_known;
    assign _52 = cfg_len_pos;
    assign _553 = g_cnt[5:0];
    assign _554 = _553 == _52;
    assign _549 = g_cnt[15:6];
    assign _551 = _549 == _238;
    assign _54 = cfg_len_en;
    assign _552 = _54 & _551;
    assign _555 = _552 & _554;
    assign _557 = _555 ? _335 : g_len_cap;
    assign _558 = _236 ? _557 : g_len_cap;
    assign _559 = _221 ? _558 : g_len_cap;
    assign _560 = _322 ? g_len_cap : _559;
    assign _561 = _212 ? _560 : g_len_cap;
    assign _563 = g_len_cap ? _331 : _561;
    assign _565 = _96 ? _331 : _563;
    assign _55 = _565;
    always @(posedge _74) begin
        if (_72)
            g_len_cap <= _331;
        else
            g_len_cap <= _55;
    end
    assign _568 = g_len_cap ? _567 : g_len_known;
    assign _570 = _96 ? _331 : _568;
    assign _56 = _570;
    always @(posedge _74) begin
        if (_72)
            g_len_known <= _331;
        else
            g_len_known <= _56;
    end
    assign _234 = g_len_known ? _233 : _45;
    assign _590 = g_cnt + _703;
    assign _222 = _212 & _221;
    assign _236 = _222 & g_data_left;
    assign _591 = _236 ? _590 : _588;
    assign _221 = ~ _220;
    assign _592 = _221 ? _591 : _588;
    assign _573 = _322 ? _572 : _312;
    assign _571 = _263 ? _451 : g_last;
    assign _572 = _255 ? _571 : g_last;
    assign _574 = _212 ? _573 : _572;
    assign _576 = _96 ? _335 : _574;
    assign _57 = _576;
    always @(posedge _74) begin
        if (_72)
            g_last <= vdd;
        else
            g_last <= _57;
    end
    assign _318 = ~ g_last;
    assign _314 = _62 == _764;
    assign _319 = _314 ? _318 : gnd;
    assign _578 = _79 == _764;
    assign _579 = _578 ? _123 : g_prev;
    assign _580 = _212 ? _579 : g_prev;
    assign _582 = _96 ? _335 : _580;
    assign _58 = _582;
    always @(posedge _74) begin
        if (_72)
            g_prev <= vdd;
        else
            g_prev <= _58;
    end
    assign _311 = _123 == g_prev;
    assign _308 = _79 == _764;
    assign _312 = _308 ? _311 : _123;
    assign _320 = _312 == _319;
    assign _321 = ~ _320;
    assign _322 = _220 & _321;
    assign _593 = _322 ? _588 : _592;
    assign _584 = g_cnt + _703;
    assign _585 = g_data_left ? _584 : g_cnt;
    assign _586 = _220 ? g_cnt : _585;
    assign _587 = _263 ? _586 : g_cnt;
    assign _588 = _255 ? _587 : g_cnt;
    assign _594 = _212 ? _593 : _588;
    assign _596 = _96 ? _352 : _594;
    assign _59 = _596;
    always @(posedge _74) begin
        if (_72)
            g_cnt <= _352;
        else
            g_cnt <= _59;
    end
    assign g_data_left = g_cnt < _234;
    assign _450 = g_data_left ? _449 : _374;
    assign _451 = _220 ? _319 : _450;
    assign _602 = _451 == g_last;
    assign _600 = g_run == _275;
    assign _601 = ~ _600;
    assign _603 = _601 & _602;
    assign _607 = _603 ? _606 : _323;
    assign _598 = _62 == _771;
    assign _612 = _598 ? _611 : _607;
    assign _613 = _263 ? _612 : g_run;
    assign _614 = _255 ? _613 : g_run;
    assign _632 = _212 ? _631 : _614;
    assign _634 = _96 ? _275 : _632;
    assign _60 = _634;
    always @(posedge _74) begin
        if (_72)
            g_run <= _275;
        else
            g_run <= _60;
    end
    assign _219 = g_run == _24;
    assign _62 = cfg_stuff;
    assign _214 = _62 == _105;
    assign _215 = ~ _214;
    assign _220 = _215 & _219;
    assign _256 = _220 | g_data_left;
    assign _263 = _256 | _262;
    assign _696 = _263 ? _694 : _747;
    assign _692 = _138 & _136;
    assign _694 = _692 ? _771 : g_mode;
    assign _251 = _182 == _352;
    assign _249 = _147 == _352;
    assign _252 = _175 ? _251 : _249;
    assign _253 = _143 ? vdd : _252;
    assign _254 = _87 ? _210 : _253;
    assign _246 = ~ _89;
    assign _247 = _109 & _246;
    assign _255 = _247 & _254;
    assign _697 = _255 ? _696 : _694;
    assign _699 = _299 ? _105 : _697;
    assign _208 = ~ _196;
    assign _209 = _205 & _208;
    assign _204 = _81[7:7];
    assign _203 = _81[6:6];
    assign _202 = _81[5:5];
    assign _201 = _81[4:4];
    assign _200 = _81[3:3];
    assign _199 = _81[2:2];
    assign _198 = _81[1:1];
    assign _197 = _81[0:0];
    always @* begin
        case (_64)
        0:
            _205 <= _197;
        1:
            _205 <= _198;
        2:
            _205 <= _199;
        3:
            _205 <= _200;
        4:
            _205 <= _201;
        5:
            _205 <= _202;
        6:
            _205 <= _203;
        default:
            _205 <= _204;
        endcase
    end
    assign _206 = ~ _205;
    assign _195 = _83[7:7];
    assign _194 = _83[6:6];
    assign _193 = _83[5:5];
    assign _192 = _83[4:4];
    assign _191 = _83[3:3];
    assign _190 = _83[2:2];
    assign _189 = _83[1:1];
    assign _188 = _83[0:0];
    assign _64 = cfg_clk_pin;
    always @* begin
        case (_64)
        0:
            _196 <= _188;
        1:
            _196 <= _189;
        2:
            _196 <= _190;
        3:
            _196 <= _191;
        4:
            _196 <= _192;
        5:
            _196 <= _193;
        6:
            _196 <= _194;
        default:
            _196 <= _195;
        endcase
    end
    assign _207 = _196 & _206;
    assign _66 = cfg_clk_edge;
    assign _210 = _66 ? _209 : _207;
    assign _186 = _171 == _352;
    assign _183 = _182 == _171;
    assign _176 = _147 == _171;
    assign _174 = ~ _138;
    assign _165 = _68[15:2];
    assign _166 = { _105,
                    _165 };
    assign _162 = _68[15:1];
    assign _163 = { _331,
                    _162 };
    assign _167 = _163 + _166;
    assign _159 = _68[15:1];
    assign _160 = { _331,
                    _159 };
    assign _157 = _89 & _140;
    assign _168 = _157 ? _167 : _160;
    always @(posedge _74) begin
        if (_72)
            _171 <= _352;
        else
            _171 <= _168;
    end
    assign _172 = _147 < _171;
    assign _149 = _68[15:2];
    assign _150 = { _105,
                    _149 };
    always @(posedge _74) begin
        if (_72)
            _153 <= _352;
        else
            _153 <= _150;
    end
    assign _680 = ~ _138;
    assign _681 = _173 & _680;
    assign _682 = _681 ? _182 : _147;
    assign _684 = _143 ? _352 : _682;
    assign _686 = _684 + _703;
    assign _663 = 17'b00000000000000000;
    assign _664 = _658 == _663;
    assign _178 = _68[15:1];
    assign _179 = { _331,
                    _178 };
    always @(posedge _74) begin
        if (_72)
            _182 <= _352;
        else
            _182 <= _179;
    end
    assign _660 = { gnd,
                    _182 };
    assign _661 = _660 == _658;
    assign _654 = { gnd,
                    _68 };
    always @(posedge _74) begin
        if (_72)
            _657 <= _663;
        else
            _657 <= _654;
    end
    assign _649 = 17'b00000000000000001;
    assign _68 = cfg_div_int;
    assign _648 = { gnd,
                    _68 };
    assign _650 = _648 - _649;
    always @(posedge _74) begin
        if (_72)
            _653 <= _663;
        else
            _653 <= _650;
    end
    assign _70 = cfg_div_frac;
    assign _668 = { gnd,
                    _70 };
    assign vdd = 1'b1;
    assign _72 = clear;
    assign _74 = clock;
    assign _670 = _669[7:0];
    assign _671 = _666 ? _670 : _642;
    assign _672 = _639 ? _671 : _642;
    assign _674 = _96 ? _400 : _672;
    assign _75 = _674;
    always @(posedge _74) begin
        if (_72)
            _642 <= _400;
        else
            _642 <= _75;
    end
    assign _667 = { gnd,
                    _642 };
    assign _669 = _667 + _668;
    assign _675 = _669[8:8];
    assign _676 = _666 ? _675 : _647;
    assign _677 = _639 ? _676 : _647;
    assign _679 = _96 ? _331 : _677;
    assign _76 = _679;
    always @(posedge _74) begin
        if (_72)
            _647 <= _331;
        else
            _647 <= _76;
    end
    assign _658 = _647 ? _657 : _653;
    assign gnd = 1'b0;
    assign _644 = { gnd,
                    _147 };
    assign _659 = _644 == _658;
    assign _662 = _175 ? _661 : _659;
    assign _665 = _143 ? _664 : _662;
    assign _643 = ~ _87;
    assign _666 = _643 & _665;
    assign _688 = _666 ? _352 : _686;
    assign _638 = ~ _87;
    assign _636 = _138 & _136;
    assign _111 = g_mode == _747;
    assign _635 = _109 | _111;
    assign _637 = _635 | _636;
    assign _639 = _637 & _638;
    assign _689 = _639 ? _688 : _147;
    assign _691 = _96 ? _352 : _689;
    assign _77 = _691;
    always @(posedge _74) begin
        if (_72)
            _147 <= _352;
        else
            _147 <= _77;
    end
    assign _154 = _147 < _153;
    assign _155 = ~ _154;
    assign _144 = _136 & _140;
    assign _156 = _144 & _155;
    assign _173 = _156 & _172;
    assign _175 = _173 & _174;
    assign _184 = _175 ? _183 : _176;
    assign _79 = cfg_code;
    assign _140 = _79 == _771;
    assign _141 = ~ _140;
    assign _138 = g_mode == _764;
    assign _142 = _138 | _141;
    assign _135 = ~ _87;
    assign _131 = _81[7:7];
    assign _130 = _81[6:6];
    assign _129 = _81[5:5];
    assign _128 = _81[4:4];
    assign _127 = _81[3:3];
    assign _126 = _81[2:2];
    assign _125 = _81[1:1];
    assign _81 = pins_q;
    assign _124 = _81[0:0];
    always @* begin
        case (_85)
        0:
            _132 <= _124;
        1:
            _132 <= _125;
        2:
            _132 <= _126;
        3:
            _132 <= _127;
        4:
            _132 <= _128;
        5:
            _132 <= _129;
        6:
            _132 <= _130;
        default:
            _132 <= _131;
        endcase
    end
    assign _122 = _83[7:7];
    assign _121 = _83[6:6];
    assign _120 = _83[5:5];
    assign _119 = _83[4:4];
    assign _118 = _83[3:3];
    assign _117 = _83[2:2];
    assign _116 = _83[1:1];
    assign _83 = pins_s;
    assign _115 = _83[0:0];
    assign _85 = cfg_data_pin;
    always @* begin
        case (_85)
        0:
            _123 <= _115;
        1:
            _123 <= _116;
        2:
            _123 <= _117;
        3:
            _123 <= _118;
        4:
            _123 <= _119;
        5:
            _123 <= _120;
        6:
            _123 <= _121;
        default:
            _123 <= _122;
        endcase
    end
    assign _133 = _123 ^ _132;
    assign _134 = _89 & _133;
    assign _136 = _134 & _135;
    assign _143 = _136 & _142;
    assign _187 = _143 ? _186 : _184;
    assign _87 = cfg_clk_pin_en;
    assign _211 = _87 ? _210 : _187;
    assign _89 = cfg_dir;
    assign _114 = _109 & _89;
    assign _212 = _114 & _211;
    assign _751 = _212 ? _750 : _699;
    assign _753 = _94 ? _105 : _751;
    assign _91 = crc_cmd;
    assign _760 = _91 ? _759 : _753;
    assign _766 = _96 ? _765 : _760;
    assign _768 = _98 ? _105 : _766;
    assign _92 = _768;
    always @(posedge _74) begin
        if (_72)
            g_mode <= _105;
        else
            g_mode <= _92;
    end
    assign _109 = g_mode == _771;
    assign _286 = _109 & _285;
    assign _287 = _286 & _22;
    assign _289 = _287 & _288;
    assign _293 = _289 & _292;
    assign _294 = _293 & _211;
    assign _299 = _294 & _298;
    assign _786 = _299 ? _335 : _784;
    assign _94 = end_;
    assign _788 = _94 ? _335 : _786;
    assign _96 = go;
    assign _790 = _96 ? _335 : _788;
    assign _98 = reset;
    assign _792 = _98 ? _335 : _790;
    assign _99 = _792;
    always @(posedge _74) begin
        if (_72)
            _296 <= vdd;
        else
            _296 <= _99;
    end
    assign out = _296;
    assign pop = _424;
    assign push = _416;
    assign push_data = _408;
    assign done_ = _111;
    assign crc_ok = _386;
    assign sync_hit = _344;
    assign error = _332;
    assign err_kind = _302;
    assign active = _284;
    assign lost = _283;

endmodule
