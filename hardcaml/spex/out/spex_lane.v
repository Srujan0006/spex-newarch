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
    cfg_code,
    cfg_div_frac,
    clear,
    clock,
    cfg_div_int,
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
    input [1:0] cfg_code;
    input [7:0] cfg_div_frac;
    input clear;
    input clock;
    input [15:0] cfg_div_int;
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

    wire [2:0] _175;
    wire [2:0] _205;
    wire [2:0] _206;
    wire [2:0] _178;
    wire [2:0] _177;
    wire [2:0] _179;
    wire [2:0] _180;
    wire [2:0] _207;
    wire [2:0] _209;
    wire [2:0] _211;
    wire [2:0] _1;
    reg [2:0] _176;
    wire _213;
    wire _217;
    wire _218;
    wire _216;
    wire _219;
    wire _221;
    wire _223;
    wire _3;
    reg _214;
    wire [15:0] _240;
    wire [15:0] _6;
    wire [15:0] _8;
    wire [15:0] _230;
    wire [15:0] _231;
    wire [15:0] _232;
    wire [15:0] _234;
    wire [15:0] _9;
    reg [15:0] _226;
    wire [14:0] _228;
    wire [15:0] _229;
    wire [15:0] _238;
    wire [15:0] _239;
    wire _241;
    wire _243;
    wire _244;
    wire _245;
    wire _246;
    wire _248;
    wire _250;
    wire _10;
    reg _237;
    wire _273;
    wire _274;
    wire _276;
    wire _277;
    wire _278;
    wire _279;
    wire _281;
    wire _12;
    reg _253;
    wire _275;
    wire _287;
    wire [5:0] _285;
    wire _286;
    wire _288;
    wire _289;
    wire _290;
    wire _291;
    wire _292;
    wire _294;
    wire _296;
    wire _13;
    reg _284;
    wire [7:0] _315;
    wire [7:0] _316;
    wire _338;
    wire [2:0] _332;
    wire _327;
    wire _326;
    wire _328;
    wire _329;
    wire _330;
    wire [2:0] _333;
    wire _335;
    wire _336;
    wire _317;
    wire _337;
    wire _339;
    wire [2:0] _304;
    wire _305;
    wire _306;
    wire _340;
    wire _347;
    wire _346;
    wire _348;
    wire _376;
    wire _377;
    wire _19;
    reg _351;
    wire _610;
    wire _608;
    wire _609;
    reg _611;
    wire _612;
    wire _613;
    wire _605;
    wire [1:0] _601;
    wire _602;
    wire _599;
    wire _600;
    wire _603;
    wire _604;
    wire _606;
    wire _614;
    wire _171;
    wire _172;
    wire _165;
    wire _166;
    wire _162;
    wire _21;
    wire _159;
    wire [1:0] _89;
    wire [1:0] _594;
    wire _591;
    wire _592;
    wire [1:0] _595;
    wire _584;
    wire _585;
    wire _586;
    wire _587;
    wire [1:0] _589;
    wire [1:0] _576;
    wire [5:0] _573;
    wire [5:0] _571;
    wire [5:0] _572;
    wire _574;
    wire [15:0] _565;
    wire [15:0] _566;
    wire [15:0] _567;
    wire _568;
    wire _564;
    wire _569;
    wire _575;
    wire [1:0] _577;
    wire [1:0] _578;
    wire [1:0] _580;
    wire [2:0] _23;
    wire [2:0] _506;
    wire [2:0] _507;
    wire [2:0] _502;
    wire _498;
    wire _496;
    wire _497;
    wire _499;
    wire [2:0] _503;
    wire _494;
    wire [2:0] _508;
    wire [2:0] _509;
    wire [2:0] _488;
    wire [2:0] _489;
    wire [2:0] _484;
    wire _372;
    wire _371;
    wire _370;
    wire _369;
    wire _368;
    wire _367;
    wire _366;
    wire _362;
    wire _361;
    wire _360;
    wire _359;
    wire _358;
    wire _357;
    wire _356;
    wire [7:0] _352;
    wire [7:0] _25;
    wire _27;
    wire [7:0] _353;
    wire [7:0] _308;
    wire [6:0] _312;
    wire [7:0] _313;
    wire [6:0] _310;
    wire [7:0] _311;
    wire [7:0] _314;
    wire [7:0] _382;
    wire [7:0] _383;
    wire [7:0] _384;
    wire [7:0] _378;
    wire [7:0] _379;
    wire [7:0] _380;
    wire [7:0] _381;
    wire [7:0] _385;
    wire [7:0] _28;
    reg [7:0] _309;
    wire _344;
    wire _341;
    wire _342;
    wire _345;
    wire [7:0] _354;
    wire _355;
    wire [7:0] _363;
    wire _30;
    wire [7:0] _364;
    wire _365;
    wire [2:0] _393;
    wire [2:0] _394;
    wire [2:0] _395;
    wire [2:0] _396;
    wire [2:0] _387;
    wire [2:0] _388;
    wire [2:0] _389;
    wire [2:0] _390;
    wire [2:0] _391;
    wire [2:0] _397;
    wire [2:0] _399;
    wire [2:0] _31;
    reg [2:0] _303;
    reg _373;
    wire _33;
    wire [31:0] _269;
    wire [31:0] _35;
    wire [30:0] _439;
    wire [31:0] _441;
    wire _433;
    wire _434;
    wire [31:0] _436;
    wire [30:0] _430;
    wire [31:0] _432;
    wire [31:0] _437;
    wire [31:0] _438;
    wire [5:0] _37;
    wire [5:0] _407;
    wire [5:0] _408;
    wire [5:0] _409;
    wire [5:0] _410;
    wire [5:0] _401;
    wire [5:0] _402;
    wire [5:0] _403;
    wire [5:0] _404;
    wire [5:0] _405;
    wire [5:0] _411;
    wire [5:0] _412;
    wire [5:0] _414;
    wire [5:0] _38;
    reg [5:0] _263;
    wire _265;
    wire _266;
    wire _259;
    wire _254;
    wire _260;
    wire _267;
    wire [31:0] _442;
    wire [31:0] _443;
    wire [31:0] _444;
    wire [31:0] _40;
    wire _421;
    wire _422;
    wire [31:0] _424;
    wire [30:0] _418;
    wire [31:0] _420;
    wire [31:0] _425;
    wire [30:0] _415;
    wire [31:0] _417;
    wire [31:0] _426;
    wire [31:0] _427;
    wire [31:0] _428;
    wire [31:0] _429;
    wire [31:0] _445;
    wire [31:0] _446;
    wire [31:0] _448;
    wire [31:0] _41;
    reg [31:0] _270;
    wire _271;
    wire _272;
    wire [15:0] _43;
    wire [15:0] _468;
    wire _299;
    wire _300;
    wire [15:0] _469;
    wire _227;
    wire [15:0] _470;
    wire _451;
    wire _449;
    wire _450;
    wire _452;
    wire _454;
    wire _44;
    reg _199;
    wire _200;
    wire _196;
    wire _201;
    wire _456;
    wire _457;
    wire _458;
    wire _460;
    wire _45;
    reg _192;
    wire _193;
    wire _190;
    wire _194;
    wire _202;
    wire _203;
    wire _204;
    wire [15:0] _471;
    wire [15:0] _462;
    wire [15:0] _463;
    wire [15:0] _464;
    wire [15:0] _465;
    wire [15:0] _466;
    wire [15:0] _472;
    wire [15:0] _474;
    wire [15:0] _46;
    reg [15:0] _257;
    wire _258;
    wire _374;
    wire _375;
    wire _480;
    wire _478;
    wire _479;
    wire _481;
    wire [2:0] _485;
    wire _476;
    wire [2:0] _490;
    wire [2:0] _491;
    wire [2:0] _492;
    wire [2:0] _510;
    wire [2:0] _512;
    wire [2:0] _47;
    reg [2:0] _186;
    wire _187;
    wire [1:0] _49;
    wire _182;
    wire _183;
    wire _188;
    wire _324;
    wire _325;
    wire [1:0] _560;
    wire _556;
    wire [1:0] _558;
    wire _321;
    wire _322;
    wire _318;
    wire _319;
    wire _323;
    wire [1:0] _561;
    wire [1:0] _563;
    wire _154;
    wire _155;
    wire _150;
    wire _149;
    wire _148;
    wire _147;
    wire _146;
    wire _145;
    wire _144;
    wire _143;
    reg _151;
    wire _152;
    wire _141;
    wire _140;
    wire _139;
    wire _138;
    wire _137;
    wire _136;
    wire _135;
    wire _134;
    wire [2:0] _51;
    reg _142;
    wire _153;
    wire _53;
    wire _156;
    wire [13:0] _129;
    wire [15:0] _130;
    wire [15:0] _131;
    wire [14:0] _126;
    wire [15:0] _127;
    wire [1:0] _55;
    wire _123;
    wire _124;
    wire [15:0] _132;
    wire [15:0] _550;
    wire [16:0] _532;
    wire [7:0] _57;
    wire [8:0] _537;
    wire vdd;
    wire _59;
    wire _61;
    wire [7:0] _539;
    wire [7:0] _540;
    wire [7:0] _541;
    wire [7:0] _543;
    wire [7:0] _62;
    reg [7:0] _522;
    wire [8:0] _536;
    wire [8:0] _538;
    wire _544;
    wire _545;
    wire _546;
    wire _548;
    wire _63;
    reg _529;
    wire [16:0] _530;
    wire [15:0] _65;
    wire [16:0] _525;
    wire [16:0] _531;
    wire [16:0] _533;
    wire gnd;
    wire [16:0] _524;
    wire _534;
    wire _523;
    wire _535;
    wire [15:0] _552;
    wire _518;
    wire _515;
    wire _516;
    wire _298;
    wire _513;
    wire _517;
    wire _519;
    wire [15:0] _553;
    wire [15:0] _555;
    wire [15:0] _66;
    reg [15:0] _119;
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
    wire [15:0] _121;
    wire _133;
    wire _74;
    wire _157;
    wire _76;
    wire _94;
    wire _158;
    wire [1:0] _581;
    wire [1:0] _583;
    wire _78;
    wire [1:0] _590;
    wire [1:0] _596;
    wire [1:0] _598;
    wire [1:0] _79;
    reg [1:0] _91;
    wire _93;
    wire _160;
    wire _161;
    wire _163;
    wire _167;
    wire _168;
    wire _173;
    wire _616;
    wire _81;
    wire _618;
    wire _83;
    wire _620;
    wire _85;
    wire _622;
    wire _86;
    reg _170;
    assign _175 = 3'b000;
    assign _205 = 3'b001;
    assign _206 = _204 ? _205 : _180;
    assign _178 = 3'b100;
    assign _177 = 3'b010;
    assign _179 = _170 ? _178 : _177;
    assign _180 = _173 ? _179 : _176;
    assign _207 = _158 ? _206 : _180;
    assign _209 = _83 ? _175 : _207;
    assign _211 = _85 ? _175 : _209;
    assign _1 = _211;
    always @(posedge _61) begin
        if (_59)
            _176 <= _175;
        else
            _176 <= _1;
    end
    assign _213 = 1'b0;
    assign _217 = 1'b1;
    assign _218 = _204 ? _217 : _216;
    assign _216 = _173 ? _217 : _214;
    assign _219 = _158 ? _218 : _216;
    assign _221 = _83 ? _213 : _219;
    assign _223 = _85 ? _213 : _221;
    assign _3 = _223;
    always @(posedge _61) begin
        if (_59)
            _214 <= _213;
        else
            _214 <= _3;
    end
    assign _240 = 16'b0000000000000000;
    assign _6 = cfg_sync_mask;
    assign _8 = cfg_sync;
    assign _230 = _227 ? _229 : _226;
    assign _231 = _204 ? _226 : _230;
    assign _232 = _158 ? _231 : _226;
    assign _234 = _83 ? _240 : _232;
    assign _9 = _234;
    always @(posedge _61) begin
        if (_59)
            _226 <= _240;
        else
            _226 <= _9;
    end
    assign _228 = _226[14:0];
    assign _229 = { _228,
                    _194 };
    assign _238 = _229 ^ _8;
    assign _239 = _238 & _6;
    assign _241 = _239 == _240;
    assign _243 = _241 ? _217 : _237;
    assign _244 = _227 ? _243 : _237;
    assign _245 = _204 ? _237 : _244;
    assign _246 = _158 ? _245 : _237;
    assign _248 = _83 ? _213 : _246;
    assign _250 = _85 ? _213 : _248;
    assign _10 = _250;
    always @(posedge _61) begin
        if (_59)
            _237 <= _213;
        else
            _237 <= _10;
    end
    assign _273 = _194 == _272;
    assign _274 = ~ _273;
    assign _276 = _267 ? _275 : _253;
    assign _277 = _227 ? _276 : _253;
    assign _278 = _204 ? _253 : _277;
    assign _279 = _158 ? _278 : _253;
    assign _281 = _83 ? _213 : _279;
    assign _12 = _281;
    always @(posedge _61) begin
        if (_59)
            _253 <= _213;
        else
            _253 <= _12;
    end
    assign _275 = _253 | _274;
    assign _287 = ~ _275;
    assign _285 = 6'b000001;
    assign _286 = _263 == _285;
    assign _288 = _286 ? _287 : _284;
    assign _289 = _267 ? _288 : _284;
    assign _290 = _227 ? _289 : _284;
    assign _291 = _204 ? _284 : _290;
    assign _292 = _158 ? _291 : _284;
    assign _294 = _83 ? _213 : _292;
    assign _296 = _85 ? _213 : _294;
    assign _13 = _296;
    always @(posedge _61) begin
        if (_59)
            _284 <= _213;
        else
            _284 <= _13;
    end
    assign _315 = _300 ? _314 : _309;
    assign _316 = _306 ? _314 : _315;
    assign _338 = ~ _306;
    assign _332 = _303 + _205;
    assign _327 = ~ _188;
    assign _326 = _323 & _325;
    assign _328 = _326 & _327;
    assign _329 = _328 & _258;
    assign _330 = _300 | _329;
    assign _333 = _330 ? _332 : _303;
    assign _335 = _333 == _175;
    assign _336 = ~ _335;
    assign _317 = _81 & _76;
    assign _337 = _317 & _336;
    assign _339 = _337 & _338;
    assign _304 = 3'b111;
    assign _305 = _303 == _304;
    assign _306 = _300 & _305;
    assign _340 = _306 | _339;
    assign _347 = ~ _27;
    assign _346 = _323 & _345;
    assign _348 = _346 & _347;
    assign _376 = _325 ? _375 : _351;
    assign _377 = _323 ? _376 : _351;
    assign _19 = _377;
    always @(posedge _61) begin
        if (_59)
            _351 <= _213;
        else
            _351 <= _19;
    end
    assign _610 = ~ _375;
    assign _608 = ~ _170;
    assign _609 = _375 ? _170 : _608;
    always @* begin
        case (_55)
        0:
            _611 <= _375;
        1:
            _611 <= _609;
        2:
            _611 <= _610;
        default:
            _611 <= _375;
        endcase
    end
    assign _612 = _325 ? _611 : _217;
    assign _613 = _323 ? _612 : _170;
    assign _605 = ~ _322;
    assign _601 = 2'b10;
    assign _602 = _55 == _601;
    assign _599 = ~ _76;
    assign _600 = _93 & _599;
    assign _603 = _600 & _602;
    assign _604 = _603 & _157;
    assign _606 = _604 & _605;
    assign _614 = _606 ? _351 : _613;
    assign _171 = _103 == _170;
    assign _172 = ~ _171;
    assign _165 = _55 == _601;
    assign _166 = ~ _165;
    assign _162 = ~ _74;
    assign _21 = cfg_readback;
    assign _159 = ~ _76;
    assign _89 = 2'b00;
    assign _594 = 2'b01;
    assign _591 = ~ _74;
    assign _592 = _76 & _591;
    assign _595 = _592 ? _594 : _601;
    assign _584 = ~ _325;
    assign _585 = _323 & _584;
    assign _586 = _298 | _585;
    assign _587 = _586 | _575;
    assign _589 = _587 ? _601 : _583;
    assign _576 = 2'b11;
    assign _573 = 6'b000000;
    assign _571 = _263 - _285;
    assign _572 = _267 ? _571 : _263;
    assign _574 = _572 == _573;
    assign _565 = 16'b0000000000000001;
    assign _566 = _257 + _565;
    assign _567 = _300 ? _566 : _257;
    assign _568 = _567 == _43;
    assign _564 = _158 & _227;
    assign _569 = _564 & _568;
    assign _575 = _569 & _574;
    assign _577 = _575 ? _576 : _563;
    assign _578 = _227 ? _577 : _563;
    assign _580 = _204 ? _89 : _578;
    assign _23 = cfg_stuff_len;
    assign _506 = _186 + _205;
    assign _507 = _194 ? _506 : _175;
    assign _502 = _186 + _205;
    assign _498 = _194 == _199;
    assign _496 = _186 == _175;
    assign _497 = ~ _496;
    assign _499 = _497 & _498;
    assign _503 = _499 ? _502 : _205;
    assign _494 = _49 == _601;
    assign _508 = _494 ? _507 : _503;
    assign _509 = _204 ? _492 : _508;
    assign _488 = _186 + _205;
    assign _489 = _375 ? _488 : _175;
    assign _484 = _186 + _205;
    assign _372 = _364[7:7];
    assign _371 = _364[6:6];
    assign _370 = _364[5:5];
    assign _369 = _364[4:4];
    assign _368 = _364[3:3];
    assign _367 = _364[2:2];
    assign _366 = _364[1:1];
    assign _362 = _354[7:7];
    assign _361 = _354[6:6];
    assign _360 = _354[5:5];
    assign _359 = _354[4:4];
    assign _358 = _354[3:3];
    assign _357 = _354[2:2];
    assign _356 = _354[1:1];
    assign _352 = 8'b11111111;
    assign _25 = tx_head;
    assign _27 = tx_empty;
    assign _353 = _27 ? _352 : _25;
    assign _308 = 8'b00000000;
    assign _312 = _309[7:1];
    assign _313 = { _194,
                    _312 };
    assign _310 = _309[6:0];
    assign _311 = { _310,
                    _194 };
    assign _314 = _30 ? _313 : _311;
    assign _382 = _300 ? _314 : _381;
    assign _383 = _227 ? _382 : _381;
    assign _384 = _204 ? _381 : _383;
    assign _378 = _258 ? _354 : _309;
    assign _379 = _188 ? _309 : _378;
    assign _380 = _325 ? _379 : _309;
    assign _381 = _323 ? _380 : _309;
    assign _385 = _158 ? _384 : _381;
    assign _28 = _385;
    always @(posedge _61) begin
        if (_59)
            _309 <= _308;
        else
            _309 <= _28;
    end
    assign _344 = _303 == _175;
    assign _341 = ~ _188;
    assign _342 = _341 & _258;
    assign _345 = _342 & _344;
    assign _354 = _345 ? _353 : _309;
    assign _355 = _354[0:0];
    assign _363 = { _355,
                    _356,
                    _357,
                    _358,
                    _359,
                    _360,
                    _361,
                    _362 };
    assign _30 = cfg_lsb_first;
    assign _364 = _30 ? _354 : _363;
    assign _365 = _364[0:0];
    assign _393 = _303 + _205;
    assign _394 = _300 ? _393 : _391;
    assign _395 = _227 ? _394 : _391;
    assign _396 = _204 ? _391 : _395;
    assign _387 = _303 + _205;
    assign _388 = _258 ? _387 : _303;
    assign _389 = _188 ? _303 : _388;
    assign _390 = _325 ? _389 : _303;
    assign _391 = _323 ? _390 : _303;
    assign _397 = _158 ? _396 : _391;
    assign _399 = _83 ? _175 : _397;
    assign _31 = _399;
    always @(posedge _61) begin
        if (_59)
            _303 <= _175;
        else
            _303 <= _31;
    end
    always @* begin
        case (_303)
        0:
            _373 <= _365;
        1:
            _373 <= _366;
        2:
            _373 <= _367;
        3:
            _373 <= _368;
        4:
            _373 <= _369;
        5:
            _373 <= _370;
        6:
            _373 <= _371;
        default:
            _373 <= _372;
        endcase
    end
    assign _33 = cfg_crc_inv;
    assign _269 = 32'b00000000000000000000000000000000;
    assign _35 = cfg_init;
    assign _439 = _270[30:0];
    assign _441 = { _439,
                    _213 };
    assign _433 = _270[31:31];
    assign _434 = _194 ^ _433;
    assign _436 = _434 ? _40 : _269;
    assign _430 = _270[30:0];
    assign _432 = { _430,
                    _213 };
    assign _437 = _432 ^ _436;
    assign _438 = _300 ? _437 : _429;
    assign _37 = cfg_crc_width;
    assign _407 = _263 - _285;
    assign _408 = _267 ? _407 : _405;
    assign _409 = _227 ? _408 : _405;
    assign _410 = _204 ? _405 : _409;
    assign _401 = _263 - _285;
    assign _402 = _258 ? _263 : _401;
    assign _403 = _188 ? _263 : _402;
    assign _404 = _325 ? _403 : _263;
    assign _405 = _323 ? _404 : _263;
    assign _411 = _158 ? _410 : _405;
    assign _412 = _78 ? _37 : _411;
    assign _414 = _83 ? _573 : _412;
    assign _38 = _414;
    always @(posedge _61) begin
        if (_59)
            _263 <= _573;
        else
            _263 <= _38;
    end
    assign _265 = _263 == _573;
    assign _266 = ~ _265;
    assign _259 = ~ _258;
    assign _254 = _158 & _227;
    assign _260 = _254 & _259;
    assign _267 = _260 & _266;
    assign _442 = _267 ? _441 : _438;
    assign _443 = _227 ? _442 : _429;
    assign _444 = _204 ? _429 : _443;
    assign _40 = cfg_poly;
    assign _421 = _270[31:31];
    assign _422 = _375 ^ _421;
    assign _424 = _422 ? _40 : _269;
    assign _418 = _270[30:0];
    assign _420 = { _418,
                    _213 };
    assign _425 = _420 ^ _424;
    assign _415 = _270[30:0];
    assign _417 = { _415,
                    _213 };
    assign _426 = _258 ? _425 : _417;
    assign _427 = _188 ? _270 : _426;
    assign _428 = _325 ? _427 : _270;
    assign _429 = _323 ? _428 : _270;
    assign _445 = _158 ? _444 : _429;
    assign _446 = _83 ? _35 : _445;
    assign _448 = _85 ? _269 : _446;
    assign _41 = _448;
    always @(posedge _61) begin
        if (_59)
            _270 <= _269;
        else
            _270 <= _41;
    end
    assign _271 = _270[31:31];
    assign _272 = _271 ^ _33;
    assign _43 = cfg_frame_bits;
    assign _468 = _257 + _565;
    assign _299 = _158 & _227;
    assign _300 = _299 & _258;
    assign _469 = _300 ? _468 : _466;
    assign _227 = ~ _188;
    assign _470 = _227 ? _469 : _466;
    assign _451 = _204 ? _450 : _194;
    assign _449 = _325 ? _375 : _199;
    assign _450 = _323 ? _449 : _199;
    assign _452 = _158 ? _451 : _450;
    assign _454 = _83 ? _217 : _452;
    assign _44 = _454;
    always @(posedge _61) begin
        if (_59)
            _199 <= vdd;
        else
            _199 <= _44;
    end
    assign _200 = ~ _199;
    assign _196 = _49 == _594;
    assign _201 = _196 ? _200 : gnd;
    assign _456 = _55 == _594;
    assign _457 = _456 ? _103 : _192;
    assign _458 = _158 ? _457 : _192;
    assign _460 = _83 ? _217 : _458;
    assign _45 = _460;
    always @(posedge _61) begin
        if (_59)
            _192 <= vdd;
        else
            _192 <= _45;
    end
    assign _193 = _103 == _192;
    assign _190 = _55 == _594;
    assign _194 = _190 ? _193 : _103;
    assign _202 = _194 == _201;
    assign _203 = ~ _202;
    assign _204 = _188 & _203;
    assign _471 = _204 ? _466 : _470;
    assign _462 = _257 + _565;
    assign _463 = _258 ? _462 : _257;
    assign _464 = _188 ? _257 : _463;
    assign _465 = _325 ? _464 : _257;
    assign _466 = _323 ? _465 : _257;
    assign _472 = _158 ? _471 : _466;
    assign _474 = _83 ? _240 : _472;
    assign _46 = _474;
    always @(posedge _61) begin
        if (_59)
            _257 <= _240;
        else
            _257 <= _46;
    end
    assign _258 = _257 < _43;
    assign _374 = _258 ? _373 : _272;
    assign _375 = _188 ? _201 : _374;
    assign _480 = _375 == _199;
    assign _478 = _186 == _175;
    assign _479 = ~ _478;
    assign _481 = _479 & _480;
    assign _485 = _481 ? _484 : _205;
    assign _476 = _49 == _601;
    assign _490 = _476 ? _489 : _485;
    assign _491 = _325 ? _490 : _186;
    assign _492 = _323 ? _491 : _186;
    assign _510 = _158 ? _509 : _492;
    assign _512 = _83 ? _175 : _510;
    assign _47 = _512;
    always @(posedge _61) begin
        if (_59)
            _186 <= _175;
        else
            _186 <= _47;
    end
    assign _187 = _186 == _23;
    assign _49 = cfg_stuff;
    assign _182 = _49 == _89;
    assign _183 = ~ _182;
    assign _188 = _183 & _187;
    assign _324 = _188 | _258;
    assign _325 = _324 | _266;
    assign _560 = _325 ? _558 : _576;
    assign _556 = _515 & _116;
    assign _558 = _556 ? _601 : _91;
    assign _321 = _121 == _240;
    assign _322 = _74 ? _156 : _321;
    assign _318 = ~ _76;
    assign _319 = _93 & _318;
    assign _323 = _319 & _322;
    assign _561 = _323 ? _560 : _558;
    assign _563 = _173 ? _89 : _561;
    assign _154 = ~ _142;
    assign _155 = _151 & _154;
    assign _150 = _68[7:7];
    assign _149 = _68[6:6];
    assign _148 = _68[5:5];
    assign _147 = _68[4:4];
    assign _146 = _68[3:3];
    assign _145 = _68[2:2];
    assign _144 = _68[1:1];
    assign _143 = _68[0:0];
    always @* begin
        case (_51)
        0:
            _151 <= _143;
        1:
            _151 <= _144;
        2:
            _151 <= _145;
        3:
            _151 <= _146;
        4:
            _151 <= _147;
        5:
            _151 <= _148;
        6:
            _151 <= _149;
        default:
            _151 <= _150;
        endcase
    end
    assign _152 = ~ _151;
    assign _141 = _70[7:7];
    assign _140 = _70[6:6];
    assign _139 = _70[5:5];
    assign _138 = _70[4:4];
    assign _137 = _70[3:3];
    assign _136 = _70[2:2];
    assign _135 = _70[1:1];
    assign _134 = _70[0:0];
    assign _51 = cfg_clk_pin;
    always @* begin
        case (_51)
        0:
            _142 <= _134;
        1:
            _142 <= _135;
        2:
            _142 <= _136;
        3:
            _142 <= _137;
        4:
            _142 <= _138;
        5:
            _142 <= _139;
        6:
            _142 <= _140;
        default:
            _142 <= _141;
        endcase
    end
    assign _153 = _142 & _152;
    assign _53 = cfg_clk_edge;
    assign _156 = _53 ? _155 : _153;
    assign _129 = _65[15:2];
    assign _130 = { _89,
                    _129 };
    assign _131 = _127 + _130;
    assign _126 = _65[15:1];
    assign _127 = { _213,
                    _126 };
    assign _55 = cfg_code;
    assign _123 = _55 == _601;
    assign _124 = _76 & _123;
    assign _132 = _124 ? _131 : _127;
    assign _550 = _121 + _565;
    assign _532 = 17'b00000000000000001;
    assign _57 = cfg_div_frac;
    assign _537 = { gnd,
                    _57 };
    assign vdd = 1'b1;
    assign _59 = clear;
    assign _61 = clock;
    assign _539 = _538[7:0];
    assign _540 = _535 ? _539 : _522;
    assign _541 = _519 ? _540 : _522;
    assign _543 = _83 ? _308 : _541;
    assign _62 = _543;
    always @(posedge _61) begin
        if (_59)
            _522 <= _308;
        else
            _522 <= _62;
    end
    assign _536 = { gnd,
                    _522 };
    assign _538 = _536 + _537;
    assign _544 = _538[8:8];
    assign _545 = _535 ? _544 : _529;
    assign _546 = _519 ? _545 : _529;
    assign _548 = _83 ? _213 : _546;
    assign _63 = _548;
    always @(posedge _61) begin
        if (_59)
            _529 <= _213;
        else
            _529 <= _63;
    end
    assign _530 = { _240,
                    _529 };
    assign _65 = cfg_div_int;
    assign _525 = { gnd,
                    _65 };
    assign _531 = _525 + _530;
    assign _533 = _531 - _532;
    assign gnd = 1'b0;
    assign _524 = { gnd,
                    _121 };
    assign _534 = _524 == _533;
    assign _523 = ~ _74;
    assign _535 = _523 & _534;
    assign _552 = _535 ? _240 : _550;
    assign _518 = ~ _74;
    assign _515 = _91 == _594;
    assign _516 = _515 & _116;
    assign _298 = _91 == _576;
    assign _513 = _93 | _298;
    assign _517 = _513 | _516;
    assign _519 = _517 & _518;
    assign _553 = _519 ? _552 : _119;
    assign _555 = _83 ? _240 : _553;
    assign _66 = _555;
    always @(posedge _61) begin
        if (_59)
            _119 <= _240;
        else
            _119 <= _66;
    end
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
    assign _121 = _116 ? _240 : _119;
    assign _133 = _121 == _132;
    assign _74 = cfg_clk_pin_en;
    assign _157 = _74 ? _156 : _133;
    assign _76 = cfg_dir;
    assign _94 = _93 & _76;
    assign _158 = _94 & _157;
    assign _581 = _158 ? _580 : _563;
    assign _583 = _81 ? _89 : _581;
    assign _78 = crc_cmd;
    assign _590 = _78 ? _589 : _583;
    assign _596 = _83 ? _595 : _590;
    assign _598 = _85 ? _89 : _596;
    assign _79 = _598;
    always @(posedge _61) begin
        if (_59)
            _91 <= _89;
        else
            _91 <= _79;
    end
    assign _93 = _91 == _601;
    assign _160 = _93 & _159;
    assign _161 = _160 & _21;
    assign _163 = _161 & _162;
    assign _167 = _163 & _166;
    assign _168 = _167 & _157;
    assign _173 = _168 & _172;
    assign _616 = _173 ? _217 : _614;
    assign _81 = end_;
    assign _618 = _81 ? _217 : _616;
    assign _83 = go;
    assign _620 = _83 ? _217 : _618;
    assign _85 = reset;
    assign _622 = _85 ? _217 : _620;
    assign _86 = _622;
    always @(posedge _61) begin
        if (_59)
            _170 <= vdd;
        else
            _170 <= _86;
    end
    assign out = _170;
    assign pop = _348;
    assign push = _340;
    assign push_data = _316;
    assign done_ = _298;
    assign crc_ok = _284;
    assign sync_hit = _237;
    assign error = _214;
    assign err_kind = _176;

endmodule
