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
    cfg_crc_resid,
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
    input cfg_crc_resid;
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

    wire _277;
    wire [2:0] _270;
    wire _271;
    wire _272;
    wire _113;
    wire _102;
    wire _103;
    wire _104;
    wire _114;
    wire _273;
    wire _278;
    wire _279;
    wire [2:0] _318;
    wire [2:0] _319;
    wire [2:0] _299;
    wire [2:0] _298;
    wire [2:0] _300;
    wire [2:0] _301;
    wire [2:0] _320;
    wire [2:0] _322;
    wire [2:0] _324;
    wire [2:0] _3;
    reg [2:0] _297;
    wire _326;
    wire _330;
    wire _331;
    wire _329;
    wire _332;
    wire _334;
    wire _336;
    wire _5;
    reg _327;
    wire [15:0] _348;
    wire [15:0] _346;
    wire [15:0] _347;
    wire _349;
    wire _340;
    wire _350;
    wire _352;
    wire _353;
    wire _354;
    wire _355;
    wire _357;
    wire _359;
    wire _7;
    reg _339;
    wire [15:0] _10;
    wire [15:0] _12;
    wire [15:0] _400;
    wire [15:0] _401;
    wire [15:0] _402;
    wire _404;
    wire _372;
    wire _373;
    wire _375;
    wire _376;
    wire _377;
    wire _378;
    wire _380;
    wire _13;
    reg g_crc_bad;
    wire _374;
    wire _394;
    wire [5:0] _392;
    wire _393;
    wire _395;
    wire _396;
    wire _397;
    wire _398;
    wire _399;
    wire _384;
    wire _382;
    wire _381;
    wire _383;
    wire _385;
    wire _14;
    reg g_resid_chk;
    wire _405;
    wire _407;
    wire _409;
    wire _15;
    reg _391;
    wire [7:0] _418;
    wire [7:0] _419;
    wire _425;
    wire [2:0] _268;
    wire _260;
    wire g_tx_bit;
    wire _261;
    wire _262;
    wire _263;
    wire [2:0] _269;
    wire _422;
    wire _423;
    wire _420;
    wire _424;
    wire _426;
    wire [2:0] _274;
    wire _275;
    wire _276;
    wire _427;
    wire _434;
    wire _433;
    wire _435;
    wire _463;
    wire _464;
    wire _21;
    reg _438;
    wire _804;
    wire _802;
    wire _803;
    reg _805;
    wire _806;
    wire _807;
    wire _799;
    wire [1:0] _795;
    wire _796;
    wire _793;
    wire _794;
    wire _797;
    wire _798;
    wire _800;
    wire _808;
    wire _292;
    wire _293;
    wire _286;
    wire _287;
    wire _283;
    wire _23;
    wire _280;
    wire [1:0] _106;
    wire [1:0] _788;
    wire _785;
    wire _786;
    wire [1:0] _789;
    wire _778;
    wire _779;
    wire _780;
    wire _781;
    wire [1:0] _783;
    wire [1:0] _771;
    wire [2:0] _764;
    wire [2:0] _761;
    wire _757;
    wire _755;
    wire _756;
    wire _758;
    wire [2:0] _762;
    wire _753;
    wire [2:0] _765;
    wire _766;
    wire [2:0] _747;
    wire _743;
    wire _741;
    wire _742;
    wire _744;
    wire [2:0] _748;
    wire _739;
    wire [2:0] _750;
    wire _751;
    wire _767;
    wire _768;
    wire _769;
    wire _735;
    wire [5:0] _732;
    wire _733;
    wire _736;
    wire [15:0] _727;
    wire [15:0] _728;
    wire _729;
    wire _726;
    wire _730;
    wire _724;
    wire _725;
    wire _731;
    wire _737;
    wire _770;
    wire [1:0] _772;
    wire [1:0] _774;
    wire [2:0] _25;
    wire [2:0] _652;
    wire [2:0] _653;
    wire [2:0] _648;
    wire _644;
    wire _642;
    wire _643;
    wire _645;
    wire [2:0] _649;
    wire _640;
    wire [2:0] _654;
    wire [2:0] _655;
    wire [2:0] _634;
    wire [2:0] _635;
    wire [2:0] _630;
    wire _459;
    wire _458;
    wire _457;
    wire _456;
    wire _455;
    wire _454;
    wire _453;
    wire _449;
    wire _448;
    wire _447;
    wire _446;
    wire _445;
    wire _444;
    wire _443;
    wire [7:0] _439;
    wire [7:0] _27;
    wire _29;
    wire [7:0] _440;
    wire [7:0] _411;
    wire [6:0] _415;
    wire [7:0] _416;
    wire [6:0] _413;
    wire [7:0] _414;
    wire [7:0] _417;
    wire [7:0] _469;
    wire [7:0] _470;
    wire [7:0] _471;
    wire [7:0] _472;
    wire [7:0] _465;
    wire [7:0] _466;
    wire [7:0] _467;
    wire [7:0] _468;
    wire [7:0] _473;
    wire [7:0] _30;
    reg [7:0] g_byte;
    wire _431;
    wire _428;
    wire _429;
    wire _432;
    wire [7:0] _441;
    wire _442;
    wire [7:0] _450;
    wire _32;
    wire [7:0] _451;
    wire _452;
    wire [2:0] _481;
    wire [5:0] _236;
    wire _237;
    wire _238;
    wire [9:0] _233;
    wire [9:0] _232;
    wire _234;
    wire _235;
    wire _239;
    wire _240;
    wire [2:0] _482;
    wire [2:0] _483;
    wire [2:0] _484;
    wire [2:0] _485;
    wire [2:0] _475;
    wire [2:0] _476;
    wire [2:0] _477;
    wire [2:0] _478;
    wire [2:0] _479;
    wire [2:0] _486;
    wire [2:0] _488;
    wire [2:0] _33;
    reg [2:0] g_bitpos;
    reg _460;
    wire _35;
    wire [31:0] _368;
    wire [31:0] _37;
    wire [30:0] _539;
    wire [31:0] _541;
    wire _532;
    wire _533;
    wire [31:0] _535;
    wire [30:0] _529;
    wire [31:0] _531;
    wire [31:0] _536;
    wire [5:0] _525;
    wire _526;
    wire _527;
    wire [9:0] _520;
    wire _522;
    wire _523;
    wire _519;
    wire _524;
    wire _528;
    wire [31:0] _537;
    wire [31:0] _538;
    wire [5:0] _39;
    wire [5:0] _496;
    wire [5:0] _497;
    wire [5:0] _498;
    wire [5:0] _499;
    wire [5:0] _490;
    wire [5:0] _491;
    wire [5:0] _492;
    wire [5:0] _493;
    wire [5:0] _494;
    wire [5:0] _500;
    wire [5:0] _501;
    wire [5:0] _503;
    wire [5:0] _40;
    reg [5:0] g_left;
    wire _256;
    wire _257;
    wire _364;
    wire _363;
    wire _365;
    wire _366;
    wire [31:0] _542;
    wire [31:0] _543;
    wire [31:0] _544;
    wire [31:0] _42;
    wire _510;
    wire _511;
    wire [31:0] _513;
    wire [30:0] _507;
    wire [31:0] _509;
    wire [31:0] _514;
    wire [30:0] _504;
    wire [31:0] _506;
    wire [31:0] _515;
    wire [31:0] _516;
    wire [31:0] _517;
    wire [31:0] _518;
    wire [31:0] _545;
    wire [31:0] _546;
    wire [31:0] _548;
    wire [31:0] _43;
    reg [31:0] g_crc;
    wire _370;
    wire _371;
    wire [7:0] _564;
    wire [7:0] _565;
    wire [7:0] _44;
    reg [7:0] g_lim;
    wire [15:0] _228;
    wire [15:0] _46;
    wire [14:0] _344;
    wire [15:0] _345;
    wire [15:0] _566;
    wire [15:0] _567;
    wire [15:0] _568;
    wire [15:0] _570;
    wire [15:0] _47;
    reg [15:0] g_sr;
    wire [3:0] _556;
    wire [3:0] _49;
    wire _557;
    wire [3:0] _558;
    wire [7:0] _560;
    wire [5:0] _51;
    wire [7:0] _554;
    wire [7:0] _561;
    wire [15:0] _562;
    wire _563;
    wire _591;
    wire [5:0] _53;
    wire [5:0] _577;
    wire _578;
    wire [9:0] _573;
    wire _575;
    wire _55;
    wire _571;
    wire _57;
    wire _572;
    wire _576;
    wire _579;
    wire _581;
    wire _582;
    wire _583;
    wire _584;
    wire _585;
    wire _587;
    wire _589;
    wire _58;
    reg g_len_cap;
    wire _592;
    wire _594;
    wire _59;
    reg g_len_known;
    wire [15:0] _229;
    wire [15:0] _614;
    wire _217;
    wire _231;
    wire [15:0] _615;
    wire _216;
    wire [15:0] _616;
    wire _597;
    wire _595;
    wire _596;
    wire _598;
    wire _600;
    wire _60;
    reg g_last;
    wire _313;
    wire _309;
    wire _314;
    wire _602;
    wire _603;
    wire _604;
    wire _606;
    wire _61;
    reg g_prev;
    wire _306;
    wire _303;
    wire _307;
    wire _315;
    wire _316;
    wire _317;
    wire [15:0] _617;
    wire [15:0] _608;
    wire [15:0] _609;
    wire [15:0] _610;
    wire [15:0] _611;
    wire [15:0] _612;
    wire [15:0] _618;
    wire [15:0] _620;
    wire [15:0] _62;
    reg [15:0] g_cnt;
    wire g_data_left;
    wire _461;
    wire _462;
    wire _626;
    wire _624;
    wire _625;
    wire _627;
    wire [2:0] _631;
    wire _622;
    wire [2:0] _636;
    wire [2:0] _637;
    wire [2:0] _638;
    wire [2:0] _656;
    wire [2:0] _658;
    wire [2:0] _63;
    reg [2:0] g_run;
    wire _214;
    wire [1:0] _65;
    wire _209;
    wire _210;
    wire _215;
    wire _251;
    wire _258;
    wire [1:0] _720;
    wire _716;
    wire [1:0] _718;
    wire _246;
    wire _244;
    wire _247;
    wire _248;
    wire _249;
    wire _241;
    wire _242;
    wire _250;
    wire [1:0] _721;
    wire [1:0] _723;
    wire _203;
    wire _204;
    reg _200;
    wire _201;
    wire _193;
    wire _192;
    wire _191;
    wire _190;
    wire _189;
    wire _188;
    wire _187;
    wire _186;
    wire [2:0] _67;
    reg _194;
    reg _197;
    wire _202;
    wire _69;
    wire _205;
    wire _184;
    wire _181;
    wire _174;
    wire _172;
    wire [13:0] _163;
    wire [15:0] _164;
    wire [14:0] _160;
    wire [15:0] _161;
    wire [15:0] _165;
    wire [14:0] _157;
    wire [15:0] _158;
    wire _155;
    wire [15:0] _166;
    reg [15:0] _169;
    wire _170;
    wire [13:0] _147;
    wire [15:0] _148;
    reg [15:0] _151;
    wire _704;
    wire _705;
    wire [15:0] _706;
    wire [15:0] _708;
    wire [15:0] _710;
    wire [16:0] _687;
    wire _688;
    wire [14:0] _176;
    wire [15:0] _177;
    reg [15:0] _180;
    wire [16:0] _684;
    wire _685;
    wire [16:0] _678;
    reg [16:0] _681;
    wire [16:0] _673;
    wire [15:0] _71;
    wire [16:0] _672;
    wire [16:0] _674;
    reg [16:0] _677;
    wire [7:0] _73;
    wire [8:0] _692;
    wire [7:0] _694;
    wire [7:0] _695;
    wire [7:0] _696;
    wire [7:0] _698;
    wire [7:0] _74;
    reg [7:0] _666;
    wire [8:0] _691;
    wire [8:0] _693;
    wire _699;
    wire _700;
    wire _701;
    wire _703;
    wire _75;
    reg _671;
    wire [16:0] _682;
    wire gnd;
    wire [16:0] _668;
    wire _683;
    wire _686;
    wire _689;
    wire _667;
    wire _690;
    wire [15:0] _712;
    wire _662;
    wire _660;
    wire _112;
    wire _659;
    wire _661;
    wire _663;
    wire [15:0] _713;
    wire [15:0] _715;
    wire [15:0] _76;
    reg [15:0] _145;
    wire _152;
    wire _153;
    wire _142;
    wire _154;
    wire _171;
    wire _173;
    wire _182;
    wire [1:0] _78;
    wire _138;
    wire _139;
    wire _136;
    wire _140;
    wire _133;
    reg _130;
    wire vdd;
    wire _80;
    wire _82;
    wire _123;
    wire _122;
    wire _121;
    wire _120;
    wire _119;
    wire _118;
    wire _117;
    wire [7:0] _84;
    wire _116;
    wire [2:0] _86;
    reg _124;
    reg _127;
    wire _131;
    wire _132;
    wire _134;
    wire _141;
    wire _185;
    wire _88;
    wire _206;
    wire _90;
    wire _115;
    wire _207;
    wire [1:0] _775;
    wire [1:0] _777;
    wire _92;
    wire [1:0] _784;
    wire [1:0] _790;
    wire [1:0] _792;
    wire [1:0] _93;
    reg [1:0] g_mode;
    wire _110;
    wire _281;
    wire _282;
    wire _284;
    wire _288;
    wire _289;
    wire _294;
    wire _810;
    wire _95;
    wire _812;
    wire _97;
    wire _814;
    wire _99;
    wire _816;
    wire _100;
    reg _291;
    assign _277 = ~ _276;
    assign _270 = 3'b000;
    assign _271 = _269 == _270;
    assign _272 = ~ _271;
    assign _113 = _110 | _112;
    assign _102 = ~ _95;
    assign _103 = _99 & _102;
    assign _104 = _103 & _90;
    assign _114 = _104 & _113;
    assign _273 = _114 & _272;
    assign _278 = _273 & _277;
    assign _279 = _136 | _110;
    assign _318 = 3'b001;
    assign _319 = _317 ? _318 : _301;
    assign _299 = 3'b100;
    assign _298 = 3'b010;
    assign _300 = _291 ? _299 : _298;
    assign _301 = _294 ? _300 : _297;
    assign _320 = _207 ? _319 : _301;
    assign _322 = _97 ? _270 : _320;
    assign _324 = _99 ? _270 : _322;
    assign _3 = _324;
    always @(posedge _82) begin
        if (_80)
            _297 <= _270;
        else
            _297 <= _3;
    end
    assign _326 = 1'b0;
    assign _330 = 1'b1;
    assign _331 = _317 ? _330 : _329;
    assign _329 = _294 ? _330 : _327;
    assign _332 = _207 ? _331 : _329;
    assign _334 = _97 ? _326 : _332;
    assign _336 = _99 ? _326 : _334;
    assign _5 = _336;
    always @(posedge _82) begin
        if (_80)
            _327 <= _326;
        else
            _327 <= _5;
    end
    assign _348 = 16'b0000000000000000;
    assign _346 = _345 ^ _12;
    assign _347 = _346 & _10;
    assign _349 = _347 == _348;
    assign _340 = ~ _55;
    assign _350 = _340 & _349;
    assign _352 = _350 ? _330 : _339;
    assign _353 = _216 ? _352 : _339;
    assign _354 = _317 ? _339 : _353;
    assign _355 = _207 ? _354 : _339;
    assign _357 = _97 ? _326 : _355;
    assign _359 = _99 ? _326 : _357;
    assign _7 = _359;
    always @(posedge _82) begin
        if (_80)
            _339 <= _326;
        else
            _339 <= _7;
    end
    assign _10 = cfg_sync_mask;
    assign _12 = cfg_sync;
    assign _400 = g_crc[31:16];
    assign _401 = _400 ^ _12;
    assign _402 = _401 & _10;
    assign _404 = _402 == _348;
    assign _372 = _307 == _371;
    assign _373 = ~ _372;
    assign _375 = _366 ? _374 : g_crc_bad;
    assign _376 = _216 ? _375 : g_crc_bad;
    assign _377 = _317 ? g_crc_bad : _376;
    assign _378 = _207 ? _377 : g_crc_bad;
    assign _380 = _97 ? _326 : _378;
    assign _13 = _380;
    always @(posedge _82) begin
        if (_80)
            g_crc_bad <= _326;
        else
            g_crc_bad <= _13;
    end
    assign _374 = g_crc_bad | _373;
    assign _394 = ~ _374;
    assign _392 = 6'b000001;
    assign _393 = g_left == _392;
    assign _395 = _393 ? _394 : _391;
    assign _396 = _366 ? _395 : _391;
    assign _397 = _216 ? _396 : _391;
    assign _398 = _317 ? _391 : _397;
    assign _399 = _207 ? _398 : _391;
    assign _384 = ~ _99;
    assign _382 = ~ _97;
    assign _381 = _276 & _55;
    assign _383 = _381 & _382;
    assign _385 = _383 & _384;
    assign _14 = _385;
    always @(posedge _82) begin
        if (_80)
            g_resid_chk <= _326;
        else
            g_resid_chk <= _14;
    end
    assign _405 = g_resid_chk ? _404 : _399;
    assign _407 = _97 ? _326 : _405;
    assign _409 = _99 ? _326 : _407;
    assign _15 = _409;
    always @(posedge _82) begin
        if (_80)
            _391 <= _326;
        else
            _391 <= _15;
    end
    assign _418 = _240 ? _417 : g_byte;
    assign _419 = _276 ? _417 : _418;
    assign _425 = ~ _276;
    assign _268 = g_bitpos + _318;
    assign _260 = ~ _215;
    assign g_tx_bit = _250 & _258;
    assign _261 = g_tx_bit & _260;
    assign _262 = _261 & g_data_left;
    assign _263 = _240 | _262;
    assign _269 = _263 ? _268 : g_bitpos;
    assign _422 = _269 == _270;
    assign _423 = ~ _422;
    assign _420 = _95 & _90;
    assign _424 = _420 & _423;
    assign _426 = _424 & _425;
    assign _274 = 3'b111;
    assign _275 = g_bitpos == _274;
    assign _276 = _240 & _275;
    assign _427 = _276 | _426;
    assign _434 = ~ _29;
    assign _433 = _250 & _432;
    assign _435 = _433 & _434;
    assign _463 = _258 ? _462 : _438;
    assign _464 = _250 ? _463 : _438;
    assign _21 = _464;
    always @(posedge _82) begin
        if (_80)
            _438 <= _326;
        else
            _438 <= _21;
    end
    assign _804 = ~ _462;
    assign _802 = ~ _291;
    assign _803 = _462 ? _291 : _802;
    always @* begin
        case (_78)
        0:
            _805 <= _462;
        1:
            _805 <= _803;
        2:
            _805 <= _804;
        default:
            _805 <= _462;
        endcase
    end
    assign _806 = _258 ? _805 : _330;
    assign _807 = _250 ? _806 : _291;
    assign _799 = ~ _249;
    assign _795 = 2'b10;
    assign _796 = _78 == _795;
    assign _793 = ~ _90;
    assign _794 = _110 & _793;
    assign _797 = _794 & _796;
    assign _798 = _797 & _206;
    assign _800 = _798 & _799;
    assign _808 = _800 ? _438 : _807;
    assign _292 = _127 == _291;
    assign _293 = ~ _292;
    assign _286 = _78 == _795;
    assign _287 = ~ _286;
    assign _283 = ~ _88;
    assign _23 = cfg_readback;
    assign _280 = ~ _90;
    assign _106 = 2'b00;
    assign _788 = 2'b01;
    assign _785 = ~ _88;
    assign _786 = _90 & _785;
    assign _789 = _786 ? _788 : _795;
    assign _778 = ~ _258;
    assign _779 = _250 & _778;
    assign _780 = _112 | _779;
    assign _781 = _780 | _770;
    assign _783 = _781 ? _795 : _777;
    assign _771 = 2'b11;
    assign _764 = g_run + _318;
    assign _761 = g_run + _318;
    assign _757 = vdd == g_last;
    assign _755 = g_run == _270;
    assign _756 = ~ _755;
    assign _758 = _756 & _757;
    assign _762 = _758 ? _761 : _318;
    assign _753 = _65 == _795;
    assign _765 = _753 ? _764 : _762;
    assign _766 = _765 == _25;
    assign _747 = g_run + _318;
    assign _743 = gnd == g_last;
    assign _741 = g_run == _270;
    assign _742 = ~ _741;
    assign _744 = _742 & _743;
    assign _748 = _744 ? _747 : _318;
    assign _739 = _65 == _795;
    assign _750 = _739 ? _270 : _748;
    assign _751 = _750 == _25;
    assign _767 = _307 ? _766 : _751;
    assign _768 = _210 & _767;
    assign _769 = ~ _768;
    assign _735 = g_left == _392;
    assign _732 = 6'b000000;
    assign _733 = g_left == _732;
    assign _736 = _366 ? _735 : _733;
    assign _727 = 16'b0000000000000001;
    assign _728 = g_cnt + _727;
    assign _729 = _728 == _229;
    assign _726 = g_cnt == _229;
    assign _730 = _231 ? _729 : _726;
    assign _724 = ~ _317;
    assign _725 = _207 & _724;
    assign _731 = _725 & _730;
    assign _737 = _731 & _736;
    assign _770 = _737 & _769;
    assign _772 = _770 ? _771 : _723;
    assign _774 = _317 ? _106 : _772;
    assign _25 = cfg_stuff_len;
    assign _652 = g_run + _318;
    assign _653 = _307 ? _652 : _270;
    assign _648 = g_run + _318;
    assign _644 = _307 == g_last;
    assign _642 = g_run == _270;
    assign _643 = ~ _642;
    assign _645 = _643 & _644;
    assign _649 = _645 ? _648 : _318;
    assign _640 = _65 == _795;
    assign _654 = _640 ? _653 : _649;
    assign _655 = _317 ? _638 : _654;
    assign _634 = g_run + _318;
    assign _635 = _462 ? _634 : _270;
    assign _630 = g_run + _318;
    assign _459 = _451[7:7];
    assign _458 = _451[6:6];
    assign _457 = _451[5:5];
    assign _456 = _451[4:4];
    assign _455 = _451[3:3];
    assign _454 = _451[2:2];
    assign _453 = _451[1:1];
    assign _449 = _441[7:7];
    assign _448 = _441[6:6];
    assign _447 = _441[5:5];
    assign _446 = _441[4:4];
    assign _445 = _441[3:3];
    assign _444 = _441[2:2];
    assign _443 = _441[1:1];
    assign _439 = 8'b11111111;
    assign _27 = tx_head;
    assign _29 = tx_empty;
    assign _440 = _29 ? _439 : _27;
    assign _411 = 8'b00000000;
    assign _415 = g_byte[7:1];
    assign _416 = { _307,
                    _415 };
    assign _413 = g_byte[6:0];
    assign _414 = { _413,
                    _307 };
    assign _417 = _32 ? _416 : _414;
    assign _469 = _240 ? _417 : _468;
    assign _470 = _231 ? _469 : _468;
    assign _471 = _216 ? _470 : _468;
    assign _472 = _317 ? _468 : _471;
    assign _465 = g_data_left ? _441 : g_byte;
    assign _466 = _215 ? g_byte : _465;
    assign _467 = _258 ? _466 : g_byte;
    assign _468 = _250 ? _467 : g_byte;
    assign _473 = _207 ? _472 : _468;
    assign _30 = _473;
    always @(posedge _82) begin
        if (_80)
            g_byte <= _411;
        else
            g_byte <= _30;
    end
    assign _431 = g_bitpos == _270;
    assign _428 = ~ _215;
    assign _429 = _428 & g_data_left;
    assign _432 = _429 & _431;
    assign _441 = _432 ? _440 : g_byte;
    assign _442 = _441[0:0];
    assign _450 = { _442,
                    _443,
                    _444,
                    _445,
                    _446,
                    _447,
                    _448,
                    _449 };
    assign _32 = cfg_lsb_first;
    assign _451 = _32 ? _441 : _450;
    assign _452 = _451[0:0];
    assign _481 = g_bitpos + _318;
    assign _236 = g_cnt[5:0];
    assign _237 = _236 < _51;
    assign _238 = ~ _237;
    assign _233 = 10'b0000000000;
    assign _232 = g_cnt[15:6];
    assign _234 = _232 == _233;
    assign _235 = ~ _234;
    assign _239 = _235 | _238;
    assign _240 = _231 & _239;
    assign _482 = _240 ? _481 : _479;
    assign _483 = _231 ? _482 : _479;
    assign _484 = _216 ? _483 : _479;
    assign _485 = _317 ? _479 : _484;
    assign _475 = g_bitpos + _318;
    assign _476 = g_data_left ? _475 : g_bitpos;
    assign _477 = _215 ? g_bitpos : _476;
    assign _478 = _258 ? _477 : g_bitpos;
    assign _479 = _250 ? _478 : g_bitpos;
    assign _486 = _207 ? _485 : _479;
    assign _488 = _97 ? _270 : _486;
    assign _33 = _488;
    always @(posedge _82) begin
        if (_80)
            g_bitpos <= _270;
        else
            g_bitpos <= _33;
    end
    always @* begin
        case (g_bitpos)
        0:
            _460 <= _452;
        1:
            _460 <= _453;
        2:
            _460 <= _454;
        3:
            _460 <= _455;
        4:
            _460 <= _456;
        5:
            _460 <= _457;
        6:
            _460 <= _458;
        default:
            _460 <= _459;
        endcase
    end
    assign _35 = cfg_crc_inv;
    assign _368 = 32'b00000000000000000000000000000000;
    assign _37 = cfg_init;
    assign _539 = g_crc[30:0];
    assign _541 = { _539,
                    _326 };
    assign _532 = g_crc[31:31];
    assign _533 = _307 ^ _532;
    assign _535 = _533 ? _42 : _368;
    assign _529 = g_crc[30:0];
    assign _531 = { _529,
                    _326 };
    assign _536 = _531 ^ _535;
    assign _525 = g_cnt[5:0];
    assign _526 = _525 < _53;
    assign _527 = ~ _526;
    assign _520 = g_cnt[15:6];
    assign _522 = _520 == _233;
    assign _523 = ~ _522;
    assign _519 = ~ _55;
    assign _524 = _519 | _523;
    assign _528 = _524 | _527;
    assign _537 = _528 ? _536 : _518;
    assign _538 = _231 ? _537 : _518;
    assign _39 = cfg_crc_width;
    assign _496 = g_left - _392;
    assign _497 = _366 ? _496 : _494;
    assign _498 = _216 ? _497 : _494;
    assign _499 = _317 ? _494 : _498;
    assign _490 = g_left - _392;
    assign _491 = g_data_left ? g_left : _490;
    assign _492 = _215 ? g_left : _491;
    assign _493 = _258 ? _492 : g_left;
    assign _494 = _250 ? _493 : g_left;
    assign _500 = _207 ? _499 : _494;
    assign _501 = _92 ? _39 : _500;
    assign _503 = _97 ? _732 : _501;
    assign _40 = _503;
    always @(posedge _82) begin
        if (_80)
            g_left <= _732;
        else
            g_left <= _40;
    end
    assign _256 = g_left == _732;
    assign _257 = ~ _256;
    assign _364 = ~ g_data_left;
    assign _363 = _207 & _216;
    assign _365 = _363 & _364;
    assign _366 = _365 & _257;
    assign _542 = _366 ? _541 : _538;
    assign _543 = _216 ? _542 : _518;
    assign _544 = _317 ? _518 : _543;
    assign _42 = cfg_poly;
    assign _510 = g_crc[31:31];
    assign _511 = _462 ^ _510;
    assign _513 = _511 ? _42 : _368;
    assign _507 = g_crc[30:0];
    assign _509 = { _507,
                    _326 };
    assign _514 = _509 ^ _513;
    assign _504 = g_crc[30:0];
    assign _506 = { _504,
                    _326 };
    assign _515 = g_data_left ? _514 : _506;
    assign _516 = _215 ? g_crc : _515;
    assign _517 = _258 ? _516 : g_crc;
    assign _518 = _250 ? _517 : g_crc;
    assign _545 = _207 ? _544 : _518;
    assign _546 = _97 ? _37 : _545;
    assign _548 = _99 ? _368 : _546;
    assign _43 = _548;
    always @(posedge _82) begin
        if (_80)
            g_crc <= _368;
        else
            g_crc <= _43;
    end
    assign _370 = g_crc[31:31];
    assign _371 = _370 ^ _35;
    assign _564 = _563 ? _561 : g_lim;
    assign _565 = g_len_cap ? _564 : g_lim;
    assign _44 = _565;
    always @(posedge _82) begin
        if (_80)
            g_lim <= _411;
        else
            g_lim <= _44;
    end
    assign _228 = { _411,
                    g_lim };
    assign _46 = cfg_frame_bits;
    assign _344 = g_sr[14:0];
    assign _345 = { _344,
                    _307 };
    assign _566 = _216 ? _345 : g_sr;
    assign _567 = _317 ? g_sr : _566;
    assign _568 = _207 ? _567 : g_sr;
    assign _570 = _97 ? _348 : _568;
    assign _47 = _570;
    always @(posedge _82) begin
        if (_80)
            g_sr <= _348;
        else
            g_sr <= _47;
    end
    assign _556 = g_sr[3:0];
    assign _49 = cfg_len_max;
    assign _557 = _49 < _556;
    assign _558 = _557 ? _49 : _556;
    assign _560 = { _326,
                    _558,
                    _270 };
    assign _51 = cfg_skip;
    assign _554 = { _106,
                    _51 };
    assign _561 = _554 + _560;
    assign _562 = { _411,
                    _561 };
    assign _563 = _562 < _46;
    assign _591 = _563 ? _330 : g_len_known;
    assign _53 = cfg_len_pos;
    assign _577 = g_cnt[5:0];
    assign _578 = _577 == _53;
    assign _573 = g_cnt[15:6];
    assign _575 = _573 == _233;
    assign _55 = cfg_crc_resid;
    assign _571 = ~ _55;
    assign _57 = cfg_len_en;
    assign _572 = _57 & _571;
    assign _576 = _572 & _575;
    assign _579 = _576 & _578;
    assign _581 = _579 ? _330 : g_len_cap;
    assign _582 = _231 ? _581 : g_len_cap;
    assign _583 = _216 ? _582 : g_len_cap;
    assign _584 = _317 ? g_len_cap : _583;
    assign _585 = _207 ? _584 : g_len_cap;
    assign _587 = g_len_cap ? _326 : _585;
    assign _589 = _97 ? _326 : _587;
    assign _58 = _589;
    always @(posedge _82) begin
        if (_80)
            g_len_cap <= _326;
        else
            g_len_cap <= _58;
    end
    assign _592 = g_len_cap ? _591 : g_len_known;
    assign _594 = _97 ? _326 : _592;
    assign _59 = _594;
    always @(posedge _82) begin
        if (_80)
            g_len_known <= _326;
        else
            g_len_known <= _59;
    end
    assign _229 = g_len_known ? _228 : _46;
    assign _614 = g_cnt + _727;
    assign _217 = _207 & _216;
    assign _231 = _217 & g_data_left;
    assign _615 = _231 ? _614 : _612;
    assign _216 = ~ _215;
    assign _616 = _216 ? _615 : _612;
    assign _597 = _317 ? _596 : _307;
    assign _595 = _258 ? _462 : g_last;
    assign _596 = _250 ? _595 : g_last;
    assign _598 = _207 ? _597 : _596;
    assign _600 = _97 ? _330 : _598;
    assign _60 = _600;
    always @(posedge _82) begin
        if (_80)
            g_last <= vdd;
        else
            g_last <= _60;
    end
    assign _313 = ~ g_last;
    assign _309 = _65 == _788;
    assign _314 = _309 ? _313 : gnd;
    assign _602 = _78 == _788;
    assign _603 = _602 ? _127 : g_prev;
    assign _604 = _207 ? _603 : g_prev;
    assign _606 = _97 ? _330 : _604;
    assign _61 = _606;
    always @(posedge _82) begin
        if (_80)
            g_prev <= vdd;
        else
            g_prev <= _61;
    end
    assign _306 = _127 == g_prev;
    assign _303 = _78 == _788;
    assign _307 = _303 ? _306 : _127;
    assign _315 = _307 == _314;
    assign _316 = ~ _315;
    assign _317 = _215 & _316;
    assign _617 = _317 ? _612 : _616;
    assign _608 = g_cnt + _727;
    assign _609 = g_data_left ? _608 : g_cnt;
    assign _610 = _215 ? g_cnt : _609;
    assign _611 = _258 ? _610 : g_cnt;
    assign _612 = _250 ? _611 : g_cnt;
    assign _618 = _207 ? _617 : _612;
    assign _620 = _97 ? _348 : _618;
    assign _62 = _620;
    always @(posedge _82) begin
        if (_80)
            g_cnt <= _348;
        else
            g_cnt <= _62;
    end
    assign g_data_left = g_cnt < _229;
    assign _461 = g_data_left ? _460 : _371;
    assign _462 = _215 ? _314 : _461;
    assign _626 = _462 == g_last;
    assign _624 = g_run == _270;
    assign _625 = ~ _624;
    assign _627 = _625 & _626;
    assign _631 = _627 ? _630 : _318;
    assign _622 = _65 == _795;
    assign _636 = _622 ? _635 : _631;
    assign _637 = _258 ? _636 : g_run;
    assign _638 = _250 ? _637 : g_run;
    assign _656 = _207 ? _655 : _638;
    assign _658 = _97 ? _270 : _656;
    assign _63 = _658;
    always @(posedge _82) begin
        if (_80)
            g_run <= _270;
        else
            g_run <= _63;
    end
    assign _214 = g_run == _25;
    assign _65 = cfg_stuff;
    assign _209 = _65 == _106;
    assign _210 = ~ _209;
    assign _215 = _210 & _214;
    assign _251 = _215 | g_data_left;
    assign _258 = _251 | _257;
    assign _720 = _258 ? _718 : _771;
    assign _716 = _136 & _134;
    assign _718 = _716 ? _795 : g_mode;
    assign _246 = _180 == _348;
    assign _244 = _145 == _348;
    assign _247 = _173 ? _246 : _244;
    assign _248 = _141 ? vdd : _247;
    assign _249 = _88 ? _205 : _248;
    assign _241 = ~ _90;
    assign _242 = _110 & _241;
    assign _250 = _242 & _249;
    assign _721 = _250 ? _720 : _718;
    assign _723 = _294 ? _106 : _721;
    assign _203 = ~ _197;
    assign _204 = _200 & _203;
    always @(posedge _82) begin
        if (_80)
            _200 <= _326;
        else
            _200 <= _197;
    end
    assign _201 = ~ _200;
    assign _193 = _84[7:7];
    assign _192 = _84[6:6];
    assign _191 = _84[5:5];
    assign _190 = _84[4:4];
    assign _189 = _84[3:3];
    assign _188 = _84[2:2];
    assign _187 = _84[1:1];
    assign _186 = _84[0:0];
    assign _67 = cfg_clk_pin;
    always @* begin
        case (_67)
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
    always @(posedge _82) begin
        if (_80)
            _197 <= _326;
        else
            _197 <= _194;
    end
    assign _202 = _197 & _201;
    assign _69 = cfg_clk_edge;
    assign _205 = _69 ? _204 : _202;
    assign _184 = _169 == _348;
    assign _181 = _180 == _169;
    assign _174 = _145 == _169;
    assign _172 = ~ _136;
    assign _163 = _71[15:2];
    assign _164 = { _106,
                    _163 };
    assign _160 = _71[15:1];
    assign _161 = { _326,
                    _160 };
    assign _165 = _161 + _164;
    assign _157 = _71[15:1];
    assign _158 = { _326,
                    _157 };
    assign _155 = _90 & _138;
    assign _166 = _155 ? _165 : _158;
    always @(posedge _82) begin
        if (_80)
            _169 <= _348;
        else
            _169 <= _166;
    end
    assign _170 = _145 < _169;
    assign _147 = _71[15:2];
    assign _148 = { _106,
                    _147 };
    always @(posedge _82) begin
        if (_80)
            _151 <= _348;
        else
            _151 <= _148;
    end
    assign _704 = ~ _136;
    assign _705 = _171 & _704;
    assign _706 = _705 ? _180 : _145;
    assign _708 = _141 ? _348 : _706;
    assign _710 = _708 + _727;
    assign _687 = 17'b00000000000000000;
    assign _688 = _682 == _687;
    assign _176 = _71[15:1];
    assign _177 = { _326,
                    _176 };
    always @(posedge _82) begin
        if (_80)
            _180 <= _348;
        else
            _180 <= _177;
    end
    assign _684 = { gnd,
                    _180 };
    assign _685 = _684 == _682;
    assign _678 = { gnd,
                    _71 };
    always @(posedge _82) begin
        if (_80)
            _681 <= _687;
        else
            _681 <= _678;
    end
    assign _673 = 17'b00000000000000001;
    assign _71 = cfg_div_int;
    assign _672 = { gnd,
                    _71 };
    assign _674 = _672 - _673;
    always @(posedge _82) begin
        if (_80)
            _677 <= _687;
        else
            _677 <= _674;
    end
    assign _73 = cfg_div_frac;
    assign _692 = { gnd,
                    _73 };
    assign _694 = _693[7:0];
    assign _695 = _690 ? _694 : _666;
    assign _696 = _663 ? _695 : _666;
    assign _698 = _97 ? _411 : _696;
    assign _74 = _698;
    always @(posedge _82) begin
        if (_80)
            _666 <= _411;
        else
            _666 <= _74;
    end
    assign _691 = { gnd,
                    _666 };
    assign _693 = _691 + _692;
    assign _699 = _693[8:8];
    assign _700 = _690 ? _699 : _671;
    assign _701 = _663 ? _700 : _671;
    assign _703 = _97 ? _326 : _701;
    assign _75 = _703;
    always @(posedge _82) begin
        if (_80)
            _671 <= _326;
        else
            _671 <= _75;
    end
    assign _682 = _671 ? _681 : _677;
    assign gnd = 1'b0;
    assign _668 = { gnd,
                    _145 };
    assign _683 = _668 == _682;
    assign _686 = _173 ? _685 : _683;
    assign _689 = _141 ? _688 : _686;
    assign _667 = ~ _88;
    assign _690 = _667 & _689;
    assign _712 = _690 ? _348 : _710;
    assign _662 = ~ _88;
    assign _660 = _136 & _134;
    assign _112 = g_mode == _771;
    assign _659 = _110 | _112;
    assign _661 = _659 | _660;
    assign _663 = _661 & _662;
    assign _713 = _663 ? _712 : _145;
    assign _715 = _97 ? _348 : _713;
    assign _76 = _715;
    always @(posedge _82) begin
        if (_80)
            _145 <= _348;
        else
            _145 <= _76;
    end
    assign _152 = _145 < _151;
    assign _153 = ~ _152;
    assign _142 = _134 & _138;
    assign _154 = _142 & _153;
    assign _171 = _154 & _170;
    assign _173 = _171 & _172;
    assign _182 = _173 ? _181 : _174;
    assign _78 = cfg_code;
    assign _138 = _78 == _795;
    assign _139 = ~ _138;
    assign _136 = g_mode == _788;
    assign _140 = _136 | _139;
    assign _133 = ~ _88;
    always @(posedge _82) begin
        if (_80)
            _130 <= _326;
        else
            _130 <= _127;
    end
    assign vdd = 1'b1;
    assign _80 = clear;
    assign _82 = clock;
    assign _123 = _84[7:7];
    assign _122 = _84[6:6];
    assign _121 = _84[5:5];
    assign _120 = _84[4:4];
    assign _119 = _84[3:3];
    assign _118 = _84[2:2];
    assign _117 = _84[1:1];
    assign _84 = sync1;
    assign _116 = _84[0:0];
    assign _86 = cfg_data_pin;
    always @* begin
        case (_86)
        0:
            _124 <= _116;
        1:
            _124 <= _117;
        2:
            _124 <= _118;
        3:
            _124 <= _119;
        4:
            _124 <= _120;
        5:
            _124 <= _121;
        6:
            _124 <= _122;
        default:
            _124 <= _123;
        endcase
    end
    always @(posedge _82) begin
        if (_80)
            _127 <= _326;
        else
            _127 <= _124;
    end
    assign _131 = _127 ^ _130;
    assign _132 = _90 & _131;
    assign _134 = _132 & _133;
    assign _141 = _134 & _140;
    assign _185 = _141 ? _184 : _182;
    assign _88 = cfg_clk_pin_en;
    assign _206 = _88 ? _205 : _185;
    assign _90 = cfg_dir;
    assign _115 = _110 & _90;
    assign _207 = _115 & _206;
    assign _775 = _207 ? _774 : _723;
    assign _777 = _95 ? _106 : _775;
    assign _92 = crc_cmd;
    assign _784 = _92 ? _783 : _777;
    assign _790 = _97 ? _789 : _784;
    assign _792 = _99 ? _106 : _790;
    assign _93 = _792;
    always @(posedge _82) begin
        if (_80)
            g_mode <= _106;
        else
            g_mode <= _93;
    end
    assign _110 = g_mode == _795;
    assign _281 = _110 & _280;
    assign _282 = _281 & _23;
    assign _284 = _282 & _283;
    assign _288 = _284 & _287;
    assign _289 = _288 & _206;
    assign _294 = _289 & _293;
    assign _810 = _294 ? _330 : _808;
    assign _95 = end_;
    assign _812 = _95 ? _330 : _810;
    assign _97 = go;
    assign _814 = _97 ? _330 : _812;
    assign _99 = reset;
    assign _816 = _99 ? _330 : _814;
    assign _100 = _816;
    always @(posedge _82) begin
        if (_80)
            _291 <= vdd;
        else
            _291 <= _100;
    end
    assign out = _291;
    assign pop = _435;
    assign push = _427;
    assign push_data = _419;
    assign done_ = _112;
    assign crc_ok = _391;
    assign sync_hit = _339;
    assign error = _327;
    assign err_kind = _297;
    assign active = _279;
    assign lost = _278;

endmodule
