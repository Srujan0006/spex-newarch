module spex_core (
    host_cov_wdata,
    host_cov_we,
    host_cov_addr,
    host_rec_wdata,
    host_rec_we,
    host_rec_waddr,
    host_cover_en,
    host_irq_ack,
    ram_cov_rdata,
    host_vlog_pop,
    host_open_drain,
    ram_rec_rdata,
    host_start_loc,
    host_recover_loc,
    host_role,
    host_match_addr,
    host_rx_pop,
    host_tx_data,
    host_tx_push,
    clear,
    clock,
    pins_in,
    host_stop,
    host_start,
    pins_out,
    pins_oe,
    st_running,
    st_in_entry,
    st_cur_loc,
    st_accepting,
    st_taken,
    st_taken_edge,
    st_viol,
    st_viol_kind,
    st_timestamp,
    st_tx_full,
    st_tx_empty,
    st_rx_data,
    st_rx_empty,
    st_vlog_data,
    st_vlog_empty,
    st_cov_rdata,
    st_irq,
    st_halted_viol,
    st_rx_overflow,
    st_vlog_overflow,
    st_cov_overrun,
    ram_rec_addr,
    ram_rec_re,
    ram_rec_we,
    ram_rec_wdata,
    ram_cov_addr,
    ram_cov_re,
    ram_cov_we,
    ram_cov_wdata
);

    input [31:0] host_cov_wdata;
    input host_cov_we;
    input [7:0] host_cov_addr;
    input [127:0] host_rec_wdata;
    input host_rec_we;
    input [7:0] host_rec_waddr;
    input host_cover_en;
    input host_irq_ack;
    input [31:0] ram_cov_rdata;
    input host_vlog_pop;
    input [7:0] host_open_drain;
    input [127:0] ram_rec_rdata;
    input [5:0] host_start_loc;
    input [5:0] host_recover_loc;
    input [1:0] host_role;
    input [7:0] host_match_addr;
    input host_rx_pop;
    input [7:0] host_tx_data;
    input host_tx_push;
    input clear;
    input clock;
    input [7:0] pins_in;
    input host_stop;
    input host_start;
    output [7:0] pins_out;
    output [7:0] pins_oe;
    output st_running;
    output st_in_entry;
    output [5:0] st_cur_loc;
    output st_accepting;
    output st_taken;
    output [1:0] st_taken_edge;
    output st_viol;
    output [1:0] st_viol_kind;
    output [31:0] st_timestamp;
    output st_tx_full;
    output st_tx_empty;
    output [7:0] st_rx_data;
    output st_rx_empty;
    output [47:0] st_vlog_data;
    output st_vlog_empty;
    output [31:0] st_cov_rdata;
    output st_irq;
    output st_halted_viol;
    output st_rx_overflow;
    output st_vlog_overflow;
    output st_cov_overrun;
    output [7:0] ram_rec_addr;
    output ram_rec_re;
    output ram_rec_we;
    output [127:0] ram_rec_wdata;
    output [7:0] ram_cov_addr;
    output ram_cov_re;
    output ram_cov_we;
    output [31:0] ram_cov_wdata;

    wire [11:0] _461;
    wire _458;
    wire _459;
    wire [11:0] _460;
    wire _462;
    wire [11:0] _463;
    wire [11:0] _464;
    wire [11:0] _450;
    wire [11:0] _1;
    reg [11:0] _363;
    wire [11:0] _2;
    reg [11:0] _451;
    wire [11:0] _359;
    wire [11:0] _358;
    reg [1:0] _355;
    reg [15:0] _356;
    wire [15:0] _135;
    wire _357;
    wire [11:0] _360;
    wire [11:0] _3;
    reg [11:0] _448;
    wire _452;
    wire _453;
    wire [11:0] _454;
    wire [11:0] _445;
    wire _455;
    wire [11:0] _456;
    wire [7:0] _443;
    wire _444;
    wire [11:0] _457;
    wire [7:0] _441;
    wire [7:0] _440;
    wire [1:0] _435;
    wire [1:0] _434;
    wire _432;
    wire _423;
    wire _415;
    wire _424;
    wire _4;
    reg _433;
    wire [1:0] _436;
    wire [6:0] _430;
    wire [8:0] _437;
    wire [7:0] _428;
    wire [8:0] _429;
    wire [8:0] _438;
    wire _439;
    wire [7:0] _442;
    wire [31:0] _465;
    wire [31:0] _6;
    wire [31:0] _466;
    wire _474;
    wire _472;
    wire _470;
    wire _10;
    wire _469;
    wire _471;
    wire _473;
    wire _476;
    wire _475;
    wire _477;
    wire [7:0] _12;
    reg [7:0] _481;
    wire [7:0] _14;
    wire [7:0] _478;
    wire _15;
    reg _427;
    wire [7:0] _482;
    wire [127:0] _18;
    wire _21;
    wire _483;
    wire [1:0] _492;
    wire [7:0] _493;
    wire [7:0] _25;
    wire [2:0] _489;
    wire _490;
    wire _491;
    wire [7:0] _494;
    wire _504;
    wire [7:0] _27;
    reg [7:0] _422;
    wire [7:0] _419;
    wire _498;
    wire _499;
    wire _495;
    wire _496;
    wire _28;
    reg _414;
    wire _30;
    wire _411;
    wire _497;
    wire _500;
    wire _505;
    wire _507;
    wire _31;
    reg _503;
    wire _510;
    wire _515;
    wire _517;
    wire _33;
    reg _513;
    wire _518;
    wire _523;
    wire _525;
    wire _35;
    reg _521;
    wire _533;
    wire _534;
    wire _539;
    wire _39;
    wire _541;
    wire _543;
    wire _40;
    reg _537;
    wire _573;
    wire _575;
    wire _571;
    wire _577;
    wire _578;
    wire _579;
    wire _545;
    wire _580;
    wire _582;
    wire _41;
    reg _528;
    wire _588;
    wire _585;
    wire _589;
    wire _590;
    wire _591;
    wire [31:0] _44;
    wire [2:0] _915;
    wire _916;
    wire _917;
    wire [47:0] _914;
    reg [47:0] _918;
    wire [2:0] _909;
    wire _910;
    wire _911;
    reg [47:0] _912;
    wire [2:0] _903;
    wire _904;
    wire _905;
    reg [47:0] _906;
    wire _898;
    wire _899;
    reg [47:0] _900;
    wire [2:0] _891;
    wire _892;
    wire _893;
    reg [47:0] _894;
    wire [2:0] _885;
    wire _886;
    wire _887;
    reg [47:0] _888;
    wire [2:0] _879;
    wire _880;
    wire _881;
    reg [47:0] _882;
    wire [2:0] _873;
    wire [2:0] _598;
    wire [2:0] _599;
    wire [2:0] _47;
    reg [2:0] _596;
    wire _874;
    wire _875;
    wire [2:0] _849;
    wire [28:0] _607;
    wire [28:0] _606;
    wire [28:0] _609;
    wire [28:0] _610;
    wire [2:0] _603;
    wire _605;
    wire [28:0] _611;
    wire [28:0] _48;
    reg [28:0] _608;
    wire [28:0] _847;
    wire [2:0] _630;
    wire _626;
    wire _627;
    wire _624;
    wire _628;
    wire [2:0] _631;
    wire _621;
    wire _622;
    wire _620;
    wire _623;
    wire [2:0] _633;
    wire _614;
    wire [2:0] _619;
    wire _613;
    wire [2:0] _634;
    wire [2:0] _49;
    reg [2:0] _617;
    wire _835;
    wire _834;
    wire _836;
    wire [2:0] _838;
    wire [2:0] _652;
    wire _648;
    wire _649;
    wire _646;
    wire _650;
    wire [2:0] _653;
    wire _643;
    wire _644;
    wire _642;
    wire _645;
    wire [2:0] _655;
    wire _636;
    wire [2:0] _641;
    wire _635;
    wire [2:0] _656;
    wire [2:0] _50;
    reg [2:0] _639;
    wire _830;
    wire _829;
    wire _831;
    wire [2:0] _833;
    wire _839;
    wire [2:0] _840;
    wire [2:0] _674;
    wire _670;
    wire _671;
    wire _668;
    wire _672;
    wire [2:0] _675;
    wire _665;
    wire _666;
    wire _664;
    wire _667;
    wire [2:0] _677;
    wire _658;
    wire [2:0] _663;
    wire _657;
    wire [2:0] _678;
    wire [2:0] _51;
    reg [2:0] _661;
    wire _823;
    wire _822;
    wire _824;
    wire [2:0] _826;
    wire [2:0] _696;
    wire _692;
    wire _693;
    wire _690;
    wire _694;
    wire [2:0] _697;
    wire _687;
    wire _688;
    wire _686;
    wire _689;
    wire [2:0] _699;
    wire _680;
    wire [2:0] _685;
    wire _679;
    wire [2:0] _700;
    wire [2:0] _52;
    reg [2:0] _683;
    wire _818;
    wire _817;
    wire _819;
    wire [2:0] _821;
    wire _827;
    wire [2:0] _828;
    wire _841;
    wire [2:0] _842;
    wire [2:0] _718;
    wire _714;
    wire _715;
    wire _712;
    wire _716;
    wire [2:0] _719;
    wire _709;
    wire _710;
    wire _708;
    wire _711;
    wire [2:0] _721;
    wire _702;
    wire [2:0] _707;
    wire _701;
    wire [2:0] _722;
    wire [2:0] _53;
    reg [2:0] _705;
    wire _809;
    wire _808;
    wire _810;
    wire [2:0] _812;
    wire [2:0] _740;
    wire _736;
    wire _737;
    wire _734;
    wire _738;
    wire [2:0] _741;
    wire _731;
    wire _732;
    wire _730;
    wire _733;
    wire [2:0] _743;
    wire _724;
    wire [2:0] _729;
    wire _723;
    wire [2:0] _744;
    wire [2:0] _54;
    reg [2:0] _727;
    wire _804;
    wire _803;
    wire _805;
    wire [2:0] _807;
    wire _813;
    wire [2:0] _814;
    wire [2:0] _762;
    wire _758;
    wire _759;
    wire _756;
    wire _760;
    wire [2:0] _763;
    wire _753;
    wire _754;
    wire _752;
    wire _755;
    wire [2:0] _765;
    wire _746;
    wire [2:0] _751;
    wire _745;
    wire [2:0] _766;
    wire [2:0] _55;
    reg [2:0] _749;
    wire _797;
    wire _796;
    wire _798;
    wire [2:0] _800;
    wire [2:0] _784;
    wire _780;
    wire _781;
    wire _778;
    wire _782;
    wire [2:0] _785;
    wire _775;
    wire _776;
    wire _774;
    wire _777;
    wire [2:0] _787;
    wire _768;
    wire [2:0] _773;
    wire _767;
    wire [2:0] _788;
    wire [2:0] _56;
    reg [2:0] _771;
    wire _792;
    wire _791;
    wire _793;
    wire [2:0] _795;
    wire _801;
    wire [2:0] _802;
    wire _815;
    wire [2:0] _816;
    wire _843;
    wire [2:0] _844;
    wire [2:0] _845;
    wire [2:0] _789;
    wire _846;
    wire [28:0] _848;
    wire [31:0] _850;
    wire [47:0] _852;
    wire [47:0] _57;
    reg [47:0] _876;
    wire [2:0] _869;
    wire [3:0] _586;
    wire [3:0] _858;
    wire [3:0] _859;
    wire [3:0] _857;
    wire [3:0] _860;
    wire [3:0] _508;
    wire _509;
    wire _592;
    wire _58;
    wire _593;
    wire _855;
    wire [3:0] _861;
    reg [3:0] _864;
    wire [3:0] _59;
    wire _587;
    wire _853;
    wire _61;
    wire _854;
    wire [2:0] _870;
    wire [2:0] _62;
    reg [2:0] _867;
    reg [47:0] _919;
    wire _981;
    wire _982;
    reg [7:0] _983;
    wire _975;
    wire _976;
    reg [7:0] _977;
    wire _969;
    wire _970;
    reg [7:0] _971;
    wire _963;
    wire _964;
    reg [7:0] _965;
    wire _957;
    wire _958;
    reg [7:0] _959;
    wire _951;
    wire _952;
    reg [7:0] _953;
    wire _945;
    wire _946;
    reg [7:0] _947;
    wire [2:0] _926;
    wire [2:0] _927;
    wire [2:0] _65;
    reg [2:0] _924;
    wire _939;
    wire _940;
    reg [7:0] _941;
    wire [2:0] _934;
    wire [2:0] _935;
    wire [2:0] _66;
    reg [2:0] _932;
    reg [7:0] _984;
    wire [31:0] _601;
    wire [31:0] _987;
    wire [31:0] _988;
    wire [31:0] _70;
    reg [31:0] _602;
    wire [1:0] _990;
    wire [1:0] _851;
    reg [1:0] _991;
    reg _994;
    reg [1:0] _997;
    reg _1000;
    wire _1001;
    wire _1002;
    wire _468;
    wire _1003;
    wire [7:0] _1072;
    wire [7:0] _1073;
    wire [7:0] _1026;
    wire [7:0] _1024;
    wire [7:0] _1023;
    wire [7:0] _1022;
    wire [7:0] _1021;
    reg [7:0] _1025;
    wire [7:0] _1027;
    wire [7:0] _1028;
    wire [7:0] _1019;
    wire [7:0] _1020;
    wire [7:0] _1029;
    wire [7:0] _1063;
    wire [7:0] _1064;
    wire [7:0] _1066;
    wire [7:0] _1068;
    wire [7:0] _80;
    reg [7:0] _1011;
    wire [7:0] _1074;
    wire [7:0] _83;
    wire [7:0] _1400;
    wire [2:0] _1392;
    wire _1389;
    wire [1:0] _1390;
    wire [3:0] _1391;
    wire [6:0] _1393;
    wire [7:0] _1394;
    wire [7:0] _1395;
    wire _1060;
    wire _1059;
    wire _1058;
    wire _1056;
    wire _1057;
    wire _1054;
    wire _1055;
    wire _1051;
    wire _1052;
    wire _1053;
    wire _1048;
    wire _1049;
    wire _1050;
    wire _1045;
    wire _1044;
    wire _1046;
    wire [2:0] _1041;
    wire [2:0] _1040;
    wire [2:0] _1039;
    wire [2:0] _1038;
    reg [2:0] _1042;
    wire _1043;
    wire _1047;
    wire [7:0] _1061;
    wire _1034;
    wire _1033;
    wire _1032;
    wire _1031;
    reg _1035;
    wire _1030;
    wire _1036;
    wire [7:0] _1062;
    wire [7:0] _1387;
    wire [7:0] _1383;
    wire [7:0] _1381;
    wire [7:0] _1380;
    wire [7:0] _1379;
    wire [7:0] _1378;
    reg [7:0] _1382;
    wire [7:0] _1384;
    wire [7:0] _1385;
    wire [7:0] _1017;
    wire [7:0] _1015;
    wire [7:0] _1014;
    wire [7:0] _1013;
    wire [7:0] _1012;
    reg [7:0] _1016;
    wire [7:0] _1018;
    wire [7:0] _1376;
    wire [7:0] _1377;
    wire [7:0] _1386;
    wire [7:0] _1388;
    wire [7:0] _1396;
    wire _1006;
    wire _1007;
    wire _530;
    wire [1:0] _1370;
    wire [1:0] _1366;
    wire [1:0] _572;
    wire _1357;
    wire [1:0] _1359;
    wire _1356;
    wire [1:0] _1361;
    wire _1355;
    wire [1:0] _1363;
    wire [1:0] _1364;
    wire _404;
    wire [3:0] _401;
    wire _403;
    wire _405;
    wire _400;
    wire _399;
    wire [1:0] _398;
    reg _406;
    wire _397;
    wire _407;
    wire _394;
    wire [3:0] _392;
    reg _393;
    wire _395;
    wire [15:0] _387;
    wire _388;
    wire _389;
    wire [15:0] _384;
    wire [1:0] _354;
    reg [15:0] _383;
    wire _385;
    wire _386;
    wire _390;
    wire [7:0] _377;
    wire _379;
    wire _380;
    wire [7:0] _374;
    wire _376;
    wire _381;
    wire [7:0] _369;
    wire [7:0] _367;
    wire [7:0] _368;
    wire [7:0] _370;
    wire _372;
    wire _366;
    wire _373;
    wire _382;
    wire _391;
    wire _396;
    wire _408;
    wire _409;
    wire _248;
    wire [3:0] _245;
    wire _247;
    wire _249;
    wire _244;
    wire _243;
    wire [1:0] _242;
    reg _250;
    wire _241;
    wire _251;
    wire _233;
    wire [3:0] _206;
    reg _232;
    wire _234;
    wire [15:0] _201;
    wire _202;
    wire _203;
    wire [15:0] _198;
    wire [1:0] _187;
    reg [15:0] _197;
    wire _199;
    wire _200;
    wire _204;
    wire [7:0] _181;
    wire _183;
    wire _184;
    wire [7:0] _170;
    wire _172;
    wire _185;
    wire [7:0] _165;
    wire [7:0] _163;
    wire [7:0] _164;
    wire [7:0] _166;
    wire _168;
    wire [127:0] _152;
    wire _1077;
    wire [127:0] _1078;
    wire _1075;
    wire [127:0] _1079;
    wire [127:0] _84;
    reg [127:0] _153;
    wire _1082;
    wire [127:0] _1083;
    wire _1080;
    wire [127:0] _1084;
    wire [127:0] _85;
    reg [127:0] _150;
    wire _1087;
    wire [127:0] _1088;
    wire _1085;
    wire [127:0] _1089;
    wire [127:0] _86;
    reg [127:0] _147;
    wire [127:0] _88;
    wire [2:0] _1340;
    wire [5:0] _417;
    wire [5:0] _90;
    wire [5:0] _1102;
    wire [5:0] _92;
    wire _1092;
    wire [5:0] _1093;
    wire [5:0] _1094;
    wire [5:0] _1103;
    wire _1090;
    wire [5:0] _1104;
    wire [5:0] _1105;
    wire [5:0] _93;
    reg [5:0] _418;
    wire [5:0] _1098;
    wire [5:0] _1097;
    wire [5:0] _1096;
    wire [5:0] _1095;
    reg [5:0] _1099;
    wire _1100;
    wire _1101;
    wire [2:0] _1336;
    wire [1:0] _569;
    wire _1331;
    wire [2:0] _1333;
    wire [7:0] _562;
    wire [7:0] _563;
    wire _565;
    wire _566;
    wire _560;
    wire _561;
    wire _567;
    wire _1110;
    wire _1111;
    wire _1108;
    wire _1106;
    wire _1112;
    wire _94;
    reg _557;
    wire _558;
    wire [15:0] _189;
    wire [15:0] _1322;
    wire [15:0] _1323;
    wire [15:0] _1319;
    wire _1320;
    wire _1321;
    wire [15:0] _1324;
    wire [2:0] _1284;
    wire [2:0] _1282;
    wire [2:0] _1281;
    wire [2:0] _1280;
    wire [2:0] _1279;
    wire _340;
    wire [3:0] _337;
    wire _339;
    wire _341;
    wire _336;
    wire _335;
    wire [1:0] _334;
    reg _342;
    wire _333;
    wire _343;
    wire _330;
    wire [3:0] _328;
    reg _329;
    wire _331;
    wire [15:0] _323;
    wire _324;
    wire _325;
    wire [15:0] _320;
    wire [1:0] _318;
    reg [15:0] _319;
    wire _321;
    wire _322;
    wire _326;
    wire [7:0] _312;
    wire _314;
    wire _315;
    wire [7:0] _309;
    wire _311;
    wire _316;
    wire [7:0] _304;
    wire [7:0] _302;
    wire [7:0] _303;
    wire [7:0] _305;
    wire _307;
    wire _301;
    wire _308;
    wire _317;
    wire _327;
    wire _332;
    wire _344;
    wire _345;
    wire [1:0] _348;
    wire _294;
    wire [3:0] _291;
    wire _293;
    wire _295;
    wire _290;
    wire _289;
    wire [1:0] _288;
    reg _296;
    wire [1:0] _96;
    wire [1:0] _1113;
    wire [1:0] _97;
    reg [1:0] _238;
    wire _240;
    wire _287;
    wire _297;
    wire _284;
    wire gnd;
    wire [7:0] _99;
    wire [6:0] _229;
    wire [6:0] _228;
    wire _230;
    wire [15:0] _225;
    wire _1118;
    wire _1117;
    wire _1119;
    wire _1116;
    wire _1120;
    wire _1115;
    wire _1121;
    wire [14:0] _1114;
    wire [15:0] _1122;
    wire [15:0] _100;
    reg [15:0] _226;
    wire _227;
    wire [3:0] _1137;
    wire [3:0] _1135;
    wire [3:0] _1138;
    wire _584;
    wire _928;
    wire _102;
    wire _929;
    wire _920;
    wire _1131;
    wire _1132;
    wire _103;
    wire _921;
    wire _1133;
    wire [3:0] _1139;
    reg [3:0] _1142;
    wire [3:0] _104;
    wire _223;
    wire [6:0] _1159;
    wire [7:0] _1160;
    wire [6:0] _1157;
    wire _1155;
    wire _1154;
    wire _1153;
    wire _1152;
    wire _1151;
    wire _1150;
    wire _1149;
    wire _1148;
    wire [2:0] _1146;
    wire [2:0] _1145;
    wire [2:0] _1144;
    wire [2:0] _1143;
    reg [2:0] _1147;
    reg _1156;
    wire [7:0] _1158;
    wire [1:0] _1126;
    wire [1:0] _1125;
    wire [1:0] _1124;
    wire [1:0] _1123;
    reg [1:0] _1127;
    wire [1:0] _1129;
    reg [7:0] _1161;
    wire [7:0] _1162;
    wire [7:0] _105;
    reg [7:0] _218;
    wire _219;
    wire [6:0] _1262;
    wire [7:0] _1263;
    wire _1260;
    wire _1259;
    wire _1258;
    wire _1257;
    wire _1256;
    wire _1255;
    wire _1254;
    wire _1253;
    wire [7:0] _1261;
    wire _1247;
    wire _1248;
    reg [7:0] _1249;
    wire _1241;
    wire _1242;
    reg [7:0] _1243;
    wire _1235;
    wire _1236;
    reg [7:0] _1237;
    wire _1229;
    wire _1230;
    reg [7:0] _1231;
    wire _1223;
    wire _1224;
    reg [7:0] _1225;
    wire _1217;
    wire _1218;
    reg [7:0] _1219;
    wire _1211;
    wire _1212;
    reg [7:0] _1213;
    wire [2:0] _1169;
    wire [2:0] _1170;
    wire [2:0] _106;
    reg [2:0] _1167;
    wire _1205;
    wire _1206;
    wire [7:0] _108;
    reg [7:0] _1207;
    wire [2:0] _1177;
    wire [2:0] _1178;
    wire [2:0] _109;
    reg [2:0] _1175;
    reg [7:0] _1250;
    wire [3:0] _1196;
    wire [3:0] _1194;
    wire [3:0] _1197;
    wire _1171;
    wire _1189;
    wire _1187;
    wire _1190;
    wire _1191;
    wire _110;
    wire _1172;
    wire _986;
    wire _1163;
    wire _112;
    wire _1164;
    wire _1192;
    wire [3:0] _1198;
    reg [3:0] _1201;
    wire [3:0] _113;
    wire _221;
    wire [7:0] _1252;
    wire [1:0] _1184;
    wire [1:0] _1182;
    wire [1:0] _1181;
    wire [1:0] _1180;
    wire [1:0] _1179;
    reg [1:0] _1183;
    wire [1:0] _1185;
    reg [7:0] _1264;
    wire [7:0] _1265;
    wire [7:0] _114;
    reg [7:0] _214;
    wire _215;
    wire [7:0] _1276;
    wire [7:0] _1275;
    wire [7:0] _1273;
    wire [7:0] _1274;
    wire [1:0] _1271;
    wire [111:0] _353;
    wire [1:0] _1269;
    wire [111:0] _300;
    wire [1:0] _1268;
    wire [1:0] _1267;
    wire [1:0] _1266;
    reg [1:0] _1270;
    wire [1:0] _1272;
    reg [7:0] _1277;
    wire [7:0] _1278;
    wire [7:0] _115;
    reg [7:0] _209;
    wire _211;
    wire [3:0] _282;
    reg _283;
    wire _285;
    wire [15:0] _277;
    wire _278;
    wire _279;
    wire [15:0] _274;
    wire [15:0] _1292;
    wire _1289;
    wire _1290;
    wire [15:0] _1293;
    wire _1286;
    wire _1287;
    wire [15:0] _1295;
    wire [15:0] _1297;
    wire [15:0] _116;
    reg [15:0] _196;
    wire [15:0] _1304;
    wire _1301;
    wire _1302;
    wire [15:0] _1305;
    wire _1298;
    wire _1299;
    wire [15:0] _1307;
    wire [15:0] _1309;
    wire [15:0] _117;
    reg [15:0] _193;
    wire [1:0] _272;
    reg [15:0] _273;
    wire _275;
    wire _276;
    wire _280;
    reg [7:0] _178;
    wire [7:0] _179;
    wire _1311;
    wire [7:0] _1313;
    wire _1310;
    wire [7:0] _1314;
    wire [7:0] _1316;
    wire [7:0] _118;
    reg [7:0] _175;
    wire [7:0] _180;
    wire [7:0] _266;
    wire _268;
    wire _269;
    wire [7:0] _263;
    wire _265;
    wire _270;
    wire [7:0] _258;
    wire [7:0] _256;
    wire vdd;
    wire _120;
    wire _122;
    wire [7:0] _124;
    reg [7:0] _159;
    reg [7:0] _162;
    wire [7:0] _257;
    wire [7:0] _259;
    wire _261;
    wire [111:0] _254;
    wire _255;
    wire _262;
    wire _271;
    wire _281;
    wire _286;
    wire _298;
    wire _299;
    wire [1:0] _350;
    wire [1:0] _352;
    reg [2:0] _1283;
    wire [2:0] _1285;
    wire _1317;
    wire _1318;
    wire [15:0] _1326;
    wire [15:0] _1328;
    wire [15:0] _125;
    reg [15:0] _190;
    wire [1:0] _551;
    reg [15:0] _552;
    wire [15:0] _550;
    wire _553;
    wire [63:0] _532;
    wire _548;
    wire _546;
    wire _547;
    wire _549;
    wire _554;
    wire _559;
    wire _568;
    wire [2:0] _1334;
    wire [2:0] _1337;
    wire _1330;
    wire [2:0] _1338;
    wire _1329;
    wire [2:0] _1341;
    wire [2:0] _1343;
    wire [2:0] _126;
    reg [2:0] _488;
    wire _1346;
    wire [127:0] _1347;
    wire _1344;
    wire [127:0] _1348;
    wire [127:0] _127;
    reg [127:0] _144;
    wire [511:0] _154;
    wire [111:0] _155;
    wire _156;
    wire _169;
    wire _186;
    wire _205;
    wire _235;
    wire _252;
    wire _141;
    wire _253;
    wire _364;
    wire _365;
    wire _410;
    wire [1:0] _1367;
    wire _1352;
    wire [1:0] _1354;
    wire _1350;
    wire [1:0] _1368;
    wire _1349;
    wire [1:0] _1371;
    wire _129;
    wire [1:0] _1373;
    wire [1:0] _1375;
    wire [1:0] _130;
    reg [1:0] _139;
    wire _485;
    wire _531;
    wire _1004;
    wire _1008;
    wire [7:0] _1397;
    wire _132;
    wire [7:0] _1399;
    wire [7:0] _133;
    reg [7:0] _1071;
    wire [7:0] _1401;
    assign _461 = _44[11:0];
    assign _458 = _451 < _448;
    assign _459 = _433 & _458;
    assign _460 = _459 ? _448 : _451;
    assign _462 = _460 < _461;
    assign _463 = _462 ? _461 : _460;
    assign _464 = _444 ? _460 : _463;
    assign _450 = 12'b000000000000;
    assign _1 = _360;
    always @(posedge _122) begin
        if (_120)
            _363 <= _450;
        else
            _363 <= _1;
    end
    assign _2 = _363;
    always @(posedge _122) begin
        if (_120)
            _451 <= _450;
        else
            _451 <= _2;
    end
    assign _359 = 12'b111111111111;
    assign _358 = _356[11:0];
    always @* begin
        case (_352)
        0:
            _355 <= _187;
        1:
            _355 <= _272;
        2:
            _355 <= _318;
        default:
            _355 <= _354;
        endcase
    end
    always @* begin
        case (_355)
        0:
            _356 <= _190;
        1:
            _356 <= _193;
        2:
            _356 <= _196;
        default:
            _356 <= _196;
        endcase
    end
    assign _135 = 16'b0000111111111111;
    assign _357 = _135 < _356;
    assign _360 = _357 ? _359 : _358;
    assign _3 = _360;
    always @(posedge _122) begin
        if (_120)
            _448 <= _450;
        else
            _448 <= _3;
    end
    assign _452 = _448 < _451;
    assign _453 = _433 & _452;
    assign _454 = _453 ? _448 : _451;
    assign _445 = _44[23:12];
    assign _455 = _445 < _454;
    assign _456 = _455 ? _445 : _454;
    assign _443 = 8'b00000000;
    assign _444 = _428 == _443;
    assign _457 = _444 ? _454 : _456;
    assign _441 = 8'b11111111;
    assign _440 = _438[7:0];
    assign _435 = 2'b10;
    assign _434 = 2'b01;
    assign _432 = 1'b0;
    assign _423 = _419 == _422;
    assign _415 = _411 & _414;
    assign _424 = _415 & _423;
    assign _4 = _424;
    always @(posedge _122) begin
        if (_120)
            _433 <= _432;
        else
            _433 <= _4;
    end
    assign _436 = _433 ? _435 : _434;
    assign _430 = 7'b0000000;
    assign _437 = { _430,
                    _436 };
    assign _428 = _44[31:24];
    assign _429 = { gnd,
                    _428 };
    assign _438 = _429 + _437;
    assign _439 = _438[8:8];
    assign _442 = _439 ? _441 : _440;
    assign _465 = { _442,
                    _457,
                    _464 };
    assign _6 = host_cov_wdata;
    assign _466 = _427 ? _465 : _6;
    assign _474 = _427 | _473;
    assign _472 = ~ _414;
    assign _470 = ~ _427;
    assign _10 = host_cov_we;
    assign _469 = _10 & _468;
    assign _471 = _469 & _470;
    assign _473 = _471 & _472;
    assign _476 = ~ _473;
    assign _475 = ~ _427;
    assign _477 = _475 & _476;
    assign _12 = _422;
    always @(posedge _122) begin
        if (_120)
            _481 <= _443;
        else
            _481 <= _12;
    end
    assign _14 = host_cov_addr;
    assign _478 = _414 ? _422 : _14;
    assign _15 = _414;
    always @(posedge _122) begin
        if (_120)
            _427 <= _432;
        else
            _427 <= _15;
    end
    assign _482 = _427 ? _481 : _478;
    assign _18 = host_rec_wdata;
    assign _21 = host_rec_we;
    assign _483 = _21 & _468;
    assign _492 = _488[1:0];
    assign _493 = { _418,
                    _492 };
    assign _25 = host_rec_waddr;
    assign _489 = 3'b100;
    assign _490 = _488 < _489;
    assign _491 = _485 & _490;
    assign _494 = _491 ? _493 : _25;
    assign _504 = 1'b1;
    assign _27 = _419;
    always @(posedge _122) begin
        if (_120)
            _422 <= _443;
        else
            _422 <= _27;
    end
    assign _419 = { _418,
                    _352 };
    assign _498 = _419 == _422;
    assign _499 = ~ _498;
    assign _495 = ~ _414;
    assign _496 = _411 & _495;
    assign _28 = _496;
    always @(posedge _122) begin
        if (_120)
            _414 <= _432;
        else
            _414 <= _28;
    end
    assign _30 = host_cover_en;
    assign _411 = _410 & _30;
    assign _497 = _411 & _414;
    assign _500 = _497 & _499;
    assign _505 = _500 ? _504 : _503;
    assign _507 = _132 ? _432 : _505;
    assign _31 = _507;
    always @(posedge _122) begin
        if (_120)
            _503 <= _432;
        else
            _503 <= _31;
    end
    assign _510 = _58 & _509;
    assign _515 = _510 ? _504 : _513;
    assign _517 = _132 ? _432 : _515;
    assign _33 = _517;
    always @(posedge _122) begin
        if (_120)
            _513 <= _432;
        else
            _513 <= _33;
    end
    assign _518 = _103 & _223;
    assign _523 = _518 ? _504 : _521;
    assign _525 = _132 ? _432 : _523;
    assign _35 = _525;
    always @(posedge _122) begin
        if (_120)
            _521 <= _432;
        else
            _521 <= _35;
    end
    assign _533 = _532[61:61];
    assign _534 = _531 & _533;
    assign _539 = _534 ? _504 : _537;
    assign _39 = host_irq_ack;
    assign _541 = _39 ? _432 : _539;
    assign _543 = _132 ? _432 : _541;
    assign _40 = _543;
    always @(posedge _122) begin
        if (_120)
            _537 <= _432;
        else
            _537 <= _40;
    end
    assign _573 = _569 == _572;
    assign _575 = _573 ? _504 : _528;
    assign _571 = _569 == _990;
    assign _577 = _571 ? _504 : _575;
    assign _578 = _568 ? _577 : _528;
    assign _579 = _410 ? _528 : _578;
    assign _545 = _139 == _435;
    assign _580 = _545 ? _579 : _528;
    assign _582 = _132 ? _432 : _580;
    assign _41 = _582;
    always @(posedge _122) begin
        if (_120)
            _528 <= _432;
        else
            _528 <= _41;
    end
    assign _588 = ~ _587;
    assign _585 = ~ _584;
    assign _589 = _585 | _588;
    assign _590 = _589 | _528;
    assign _591 = _590 | _537;
    assign _44 = ram_cov_rdata;
    assign _915 = 3'b111;
    assign _916 = _596 == _915;
    assign _917 = _593 & _916;
    assign _914 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _122) begin
        if (_120)
            _918 <= _914;
        else
            if (_917)
                _918 <= _57;
    end
    assign _909 = 3'b110;
    assign _910 = _596 == _909;
    assign _911 = _593 & _910;
    always @(posedge _122) begin
        if (_120)
            _912 <= _914;
        else
            if (_911)
                _912 <= _57;
    end
    assign _903 = 3'b101;
    assign _904 = _596 == _903;
    assign _905 = _593 & _904;
    always @(posedge _122) begin
        if (_120)
            _906 <= _914;
        else
            if (_905)
                _906 <= _57;
    end
    assign _898 = _596 == _489;
    assign _899 = _593 & _898;
    always @(posedge _122) begin
        if (_120)
            _900 <= _914;
        else
            if (_899)
                _900 <= _57;
    end
    assign _891 = 3'b011;
    assign _892 = _596 == _891;
    assign _893 = _593 & _892;
    always @(posedge _122) begin
        if (_120)
            _894 <= _914;
        else
            if (_893)
                _894 <= _57;
    end
    assign _885 = 3'b010;
    assign _886 = _596 == _885;
    assign _887 = _593 & _886;
    always @(posedge _122) begin
        if (_120)
            _888 <= _914;
        else
            if (_887)
                _888 <= _57;
    end
    assign _879 = 3'b001;
    assign _880 = _596 == _879;
    assign _881 = _593 & _880;
    always @(posedge _122) begin
        if (_120)
            _882 <= _914;
        else
            if (_881)
                _882 <= _57;
    end
    assign _873 = 3'b000;
    assign _598 = _596 + _879;
    assign _599 = _593 ? _598 : _596;
    assign _47 = _599;
    always @(posedge _122) begin
        if (_120)
            _596 <= _873;
        else
            _596 <= _47;
    end
    assign _874 = _596 == _873;
    assign _875 = _593 & _874;
    assign _849 = _789 - _845;
    assign _607 = 29'b11111111111111111111111111111;
    assign _606 = 29'b00000000000000000000000000000;
    assign _609 = 29'b00000000000000000000000000001;
    assign _610 = _608 + _609;
    assign _603 = _602[2:0];
    assign _605 = _603 == _915;
    assign _611 = _605 ? _610 : _608;
    assign _48 = _611;
    always @(posedge _122) begin
        if (_120)
            _608 <= _607;
        else
            _608 <= _48;
    end
    assign _847 = _602[31:3];
    assign _630 = _617 + _879;
    assign _626 = _617 == _915;
    assign _627 = ~ _626;
    assign _624 = _175[0:0];
    assign _628 = _624 & _627;
    assign _631 = _628 ? _630 : _617;
    assign _621 = _175[0:0];
    assign _622 = ~ _621;
    assign _620 = _179[0:0];
    assign _623 = _620 & _622;
    assign _633 = _623 ? _879 : _631;
    assign _614 = _139 == _435;
    assign _619 = _614 ? _873 : _617;
    assign _613 = _139 == _434;
    assign _634 = _613 ? _633 : _619;
    assign _49 = _634;
    always @(posedge _122) begin
        if (_120)
            _617 <= _873;
        else
            _617 <= _49;
    end
    assign _835 = _562[0:0];
    assign _834 = _175[0:0];
    assign _836 = _834 & _835;
    assign _838 = _836 ? _617 : _873;
    assign _652 = _639 + _879;
    assign _648 = _639 == _915;
    assign _649 = ~ _648;
    assign _646 = _175[1:1];
    assign _650 = _646 & _649;
    assign _653 = _650 ? _652 : _639;
    assign _643 = _175[1:1];
    assign _644 = ~ _643;
    assign _642 = _179[1:1];
    assign _645 = _642 & _644;
    assign _655 = _645 ? _879 : _653;
    assign _636 = _139 == _435;
    assign _641 = _636 ? _873 : _639;
    assign _635 = _139 == _434;
    assign _656 = _635 ? _655 : _641;
    assign _50 = _656;
    always @(posedge _122) begin
        if (_120)
            _639 <= _873;
        else
            _639 <= _50;
    end
    assign _830 = _562[1:1];
    assign _829 = _175[1:1];
    assign _831 = _829 & _830;
    assign _833 = _831 ? _639 : _873;
    assign _839 = _833 < _838;
    assign _840 = _839 ? _838 : _833;
    assign _674 = _661 + _879;
    assign _670 = _661 == _915;
    assign _671 = ~ _670;
    assign _668 = _175[2:2];
    assign _672 = _668 & _671;
    assign _675 = _672 ? _674 : _661;
    assign _665 = _175[2:2];
    assign _666 = ~ _665;
    assign _664 = _179[2:2];
    assign _667 = _664 & _666;
    assign _677 = _667 ? _879 : _675;
    assign _658 = _139 == _435;
    assign _663 = _658 ? _873 : _661;
    assign _657 = _139 == _434;
    assign _678 = _657 ? _677 : _663;
    assign _51 = _678;
    always @(posedge _122) begin
        if (_120)
            _661 <= _873;
        else
            _661 <= _51;
    end
    assign _823 = _562[2:2];
    assign _822 = _175[2:2];
    assign _824 = _822 & _823;
    assign _826 = _824 ? _661 : _873;
    assign _696 = _683 + _879;
    assign _692 = _683 == _915;
    assign _693 = ~ _692;
    assign _690 = _175[3:3];
    assign _694 = _690 & _693;
    assign _697 = _694 ? _696 : _683;
    assign _687 = _175[3:3];
    assign _688 = ~ _687;
    assign _686 = _179[3:3];
    assign _689 = _686 & _688;
    assign _699 = _689 ? _879 : _697;
    assign _680 = _139 == _435;
    assign _685 = _680 ? _873 : _683;
    assign _679 = _139 == _434;
    assign _700 = _679 ? _699 : _685;
    assign _52 = _700;
    always @(posedge _122) begin
        if (_120)
            _683 <= _873;
        else
            _683 <= _52;
    end
    assign _818 = _562[3:3];
    assign _817 = _175[3:3];
    assign _819 = _817 & _818;
    assign _821 = _819 ? _683 : _873;
    assign _827 = _821 < _826;
    assign _828 = _827 ? _826 : _821;
    assign _841 = _828 < _840;
    assign _842 = _841 ? _840 : _828;
    assign _718 = _705 + _879;
    assign _714 = _705 == _915;
    assign _715 = ~ _714;
    assign _712 = _175[4:4];
    assign _716 = _712 & _715;
    assign _719 = _716 ? _718 : _705;
    assign _709 = _175[4:4];
    assign _710 = ~ _709;
    assign _708 = _179[4:4];
    assign _711 = _708 & _710;
    assign _721 = _711 ? _879 : _719;
    assign _702 = _139 == _435;
    assign _707 = _702 ? _873 : _705;
    assign _701 = _139 == _434;
    assign _722 = _701 ? _721 : _707;
    assign _53 = _722;
    always @(posedge _122) begin
        if (_120)
            _705 <= _873;
        else
            _705 <= _53;
    end
    assign _809 = _562[4:4];
    assign _808 = _175[4:4];
    assign _810 = _808 & _809;
    assign _812 = _810 ? _705 : _873;
    assign _740 = _727 + _879;
    assign _736 = _727 == _915;
    assign _737 = ~ _736;
    assign _734 = _175[5:5];
    assign _738 = _734 & _737;
    assign _741 = _738 ? _740 : _727;
    assign _731 = _175[5:5];
    assign _732 = ~ _731;
    assign _730 = _179[5:5];
    assign _733 = _730 & _732;
    assign _743 = _733 ? _879 : _741;
    assign _724 = _139 == _435;
    assign _729 = _724 ? _873 : _727;
    assign _723 = _139 == _434;
    assign _744 = _723 ? _743 : _729;
    assign _54 = _744;
    always @(posedge _122) begin
        if (_120)
            _727 <= _873;
        else
            _727 <= _54;
    end
    assign _804 = _562[5:5];
    assign _803 = _175[5:5];
    assign _805 = _803 & _804;
    assign _807 = _805 ? _727 : _873;
    assign _813 = _807 < _812;
    assign _814 = _813 ? _812 : _807;
    assign _762 = _749 + _879;
    assign _758 = _749 == _915;
    assign _759 = ~ _758;
    assign _756 = _175[6:6];
    assign _760 = _756 & _759;
    assign _763 = _760 ? _762 : _749;
    assign _753 = _175[6:6];
    assign _754 = ~ _753;
    assign _752 = _179[6:6];
    assign _755 = _752 & _754;
    assign _765 = _755 ? _879 : _763;
    assign _746 = _139 == _435;
    assign _751 = _746 ? _873 : _749;
    assign _745 = _139 == _434;
    assign _766 = _745 ? _765 : _751;
    assign _55 = _766;
    always @(posedge _122) begin
        if (_120)
            _749 <= _873;
        else
            _749 <= _55;
    end
    assign _797 = _562[6:6];
    assign _796 = _175[6:6];
    assign _798 = _796 & _797;
    assign _800 = _798 ? _749 : _873;
    assign _784 = _771 + _879;
    assign _780 = _771 == _915;
    assign _781 = ~ _780;
    assign _778 = _175[7:7];
    assign _782 = _778 & _781;
    assign _785 = _782 ? _784 : _771;
    assign _775 = _175[7:7];
    assign _776 = ~ _775;
    assign _774 = _179[7:7];
    assign _777 = _774 & _776;
    assign _787 = _777 ? _879 : _785;
    assign _768 = _139 == _435;
    assign _773 = _768 ? _873 : _771;
    assign _767 = _139 == _434;
    assign _788 = _767 ? _787 : _773;
    assign _56 = _788;
    always @(posedge _122) begin
        if (_120)
            _771 <= _873;
        else
            _771 <= _56;
    end
    assign _792 = _562[7:7];
    assign _791 = _175[7:7];
    assign _793 = _791 & _792;
    assign _795 = _793 ? _771 : _873;
    assign _801 = _795 < _800;
    assign _802 = _801 ? _800 : _795;
    assign _815 = _802 < _814;
    assign _816 = _815 ? _814 : _802;
    assign _843 = _816 < _842;
    assign _844 = _843 ? _842 : _816;
    assign _845 = _567 ? _844 : _873;
    assign _789 = _602[2:0];
    assign _846 = _789 < _845;
    assign _848 = _846 ? _608 : _847;
    assign _850 = { _848,
                    _849 };
    assign _852 = { _850,
                    _418,
                    _851,
                    _162 };
    assign _57 = _852;
    always @(posedge _122) begin
        if (_120)
            _876 <= _914;
        else
            if (_875)
                _876 <= _57;
    end
    assign _869 = _867 + _879;
    assign _586 = 4'b0000;
    assign _858 = 4'b0001;
    assign _859 = _59 + _858;
    assign _857 = _59 - _858;
    assign _860 = _593 ? _859 : _857;
    assign _508 = 4'b1000;
    assign _509 = _59 == _508;
    assign _592 = ~ _509;
    assign _58 = _568;
    assign _593 = _58 & _592;
    assign _855 = _593 ^ _854;
    assign _861 = _855 ? _860 : _59;
    always @(posedge _122) begin
        if (_120)
            _864 <= _586;
        else
            _864 <= _861;
    end
    assign _59 = _864;
    assign _587 = _59 == _586;
    assign _853 = ~ _587;
    assign _61 = host_vlog_pop;
    assign _854 = _61 & _853;
    assign _870 = _854 ? _869 : _867;
    assign _62 = _870;
    always @(posedge _122) begin
        if (_120)
            _867 <= _873;
        else
            _867 <= _62;
    end
    always @* begin
        case (_867)
        0:
            _919 <= _876;
        1:
            _919 <= _882;
        2:
            _919 <= _888;
        3:
            _919 <= _894;
        4:
            _919 <= _900;
        5:
            _919 <= _906;
        6:
            _919 <= _912;
        default:
            _919 <= _918;
        endcase
    end
    assign _981 = _924 == _915;
    assign _982 = _921 & _981;
    always @(posedge _122) begin
        if (_120)
            _983 <= _443;
        else
            if (_982)
                _983 <= _218;
    end
    assign _975 = _924 == _909;
    assign _976 = _921 & _975;
    always @(posedge _122) begin
        if (_120)
            _977 <= _443;
        else
            if (_976)
                _977 <= _218;
    end
    assign _969 = _924 == _903;
    assign _970 = _921 & _969;
    always @(posedge _122) begin
        if (_120)
            _971 <= _443;
        else
            if (_970)
                _971 <= _218;
    end
    assign _963 = _924 == _489;
    assign _964 = _921 & _963;
    always @(posedge _122) begin
        if (_120)
            _965 <= _443;
        else
            if (_964)
                _965 <= _218;
    end
    assign _957 = _924 == _891;
    assign _958 = _921 & _957;
    always @(posedge _122) begin
        if (_120)
            _959 <= _443;
        else
            if (_958)
                _959 <= _218;
    end
    assign _951 = _924 == _885;
    assign _952 = _921 & _951;
    always @(posedge _122) begin
        if (_120)
            _953 <= _443;
        else
            if (_952)
                _953 <= _218;
    end
    assign _945 = _924 == _879;
    assign _946 = _921 & _945;
    always @(posedge _122) begin
        if (_120)
            _947 <= _443;
        else
            if (_946)
                _947 <= _218;
    end
    assign _926 = _924 + _879;
    assign _927 = _921 ? _926 : _924;
    assign _65 = _927;
    always @(posedge _122) begin
        if (_120)
            _924 <= _873;
        else
            _924 <= _65;
    end
    assign _939 = _924 == _873;
    assign _940 = _921 & _939;
    always @(posedge _122) begin
        if (_120)
            _941 <= _443;
        else
            if (_940)
                _941 <= _218;
    end
    assign _934 = _932 + _879;
    assign _935 = _929 ? _934 : _932;
    assign _66 = _935;
    always @(posedge _122) begin
        if (_120)
            _932 <= _873;
        else
            _932 <= _66;
    end
    always @* begin
        case (_932)
        0:
            _984 <= _941;
        1:
            _984 <= _947;
        2:
            _984 <= _953;
        3:
            _984 <= _959;
        4:
            _984 <= _965;
        5:
            _984 <= _971;
        6:
            _984 <= _977;
        default:
            _984 <= _983;
        endcase
    end
    assign _601 = 32'b00000000000000000000000000000000;
    assign _987 = 32'b00000000000000000000000000000001;
    assign _988 = _602 + _987;
    assign _70 = _988;
    always @(posedge _122) begin
        if (_120)
            _602 <= _601;
        else
            _602 <= _70;
    end
    assign _990 = 2'b00;
    assign _851 = { _559,
                    _567 };
    always @(posedge _122) begin
        if (_120)
            _991 <= _990;
        else
            _991 <= _851;
    end
    always @(posedge _122) begin
        if (_120)
            _994 <= _432;
        else
            _994 <= _568;
    end
    always @(posedge _122) begin
        if (_120)
            _997 <= _990;
        else
            _997 <= _352;
    end
    always @(posedge _122) begin
        if (_120)
            _1000 <= _432;
        else
            _1000 <= _410;
    end
    assign _1001 = _532[60:60];
    assign _1002 = _141 & _1001;
    assign _468 = _139 == _990;
    assign _1003 = ~ _468;
    assign _1072 = _83 & _1071;
    assign _1073 = ~ _1072;
    assign _1026 = _532[23:16];
    assign _1024 = _353[86:79];
    assign _1023 = _300[86:79];
    assign _1022 = _254[86:79];
    assign _1021 = _155[86:79];
    always @* begin
        case (_352)
        0:
            _1025 <= _1021;
        1:
            _1025 <= _1022;
        2:
            _1025 <= _1023;
        default:
            _1025 <= _1024;
        endcase
    end
    assign _1027 = _531 ? _1026 : _1025;
    assign _1028 = _1027 & _1018;
    assign _1019 = ~ _1018;
    assign _1020 = _1011 & _1019;
    assign _1029 = _1020 | _1028;
    assign _1063 = _1029 | _1062;
    assign _1064 = _1008 ? _1063 : _1011;
    assign _1066 = _129 ? _443 : _1064;
    assign _1068 = _132 ? _443 : _1066;
    assign _80 = _1068;
    always @(posedge _122) begin
        if (_120)
            _1011 <= _443;
        else
            _1011 <= _80;
    end
    assign _1074 = _1011 & _1073;
    assign _83 = host_open_drain;
    assign _1400 = ~ _83;
    assign _1392 = { _1390,
                     _1389 };
    assign _1389 = _214[0:0];
    assign _1390 = { _1389,
                     _1389 };
    assign _1391 = { _1390,
                     _1390 };
    assign _1393 = { _1391,
                     _1392 };
    assign _1394 = { _1393,
                     _1389 };
    assign _1395 = _1394 & _1062;
    assign _1060 = _1056 & _1054;
    assign _1059 = _1056 & _1052;
    assign _1058 = _1056 & _1049;
    assign _1056 = ~ _1043;
    assign _1057 = _1056 & _1046;
    assign _1054 = _1051 & _1048;
    assign _1055 = _1043 & _1054;
    assign _1051 = ~ _1044;
    assign _1052 = _1051 & _1045;
    assign _1053 = _1043 & _1052;
    assign _1048 = ~ _1045;
    assign _1049 = _1044 & _1048;
    assign _1050 = _1043 & _1049;
    assign _1045 = _1042[0:0];
    assign _1044 = _1042[1:1];
    assign _1046 = _1044 & _1045;
    assign _1041 = _353[90:88];
    assign _1040 = _300[90:88];
    assign _1039 = _254[90:88];
    assign _1038 = _155[90:88];
    always @* begin
        case (_352)
        0:
            _1042 <= _1038;
        1:
            _1042 <= _1039;
        2:
            _1042 <= _1040;
        default:
            _1042 <= _1041;
        endcase
    end
    assign _1043 = _1042[2:2];
    assign _1047 = _1043 & _1046;
    assign _1061 = { _1047,
                     _1050,
                     _1053,
                     _1055,
                     _1057,
                     _1058,
                     _1059,
                     _1060 };
    assign _1034 = _353[87:87];
    assign _1033 = _300[87:87];
    assign _1032 = _254[87:87];
    assign _1031 = _155[87:87];
    always @* begin
        case (_352)
        0:
            _1035 <= _1031;
        1:
            _1035 <= _1032;
        2:
            _1035 <= _1033;
        default:
            _1035 <= _1034;
        endcase
    end
    assign _1030 = ~ _531;
    assign _1036 = _1030 & _1035;
    assign _1062 = _1036 ? _1061 : _443;
    assign _1387 = ~ _1062;
    assign _1383 = _532[15:8];
    assign _1381 = _353[78:71];
    assign _1380 = _300[78:71];
    assign _1379 = _254[78:71];
    assign _1378 = _155[78:71];
    always @* begin
        case (_352)
        0:
            _1382 <= _1378;
        1:
            _1382 <= _1379;
        2:
            _1382 <= _1380;
        default:
            _1382 <= _1381;
        endcase
    end
    assign _1384 = _531 ? _1383 : _1382;
    assign _1385 = _1384 & _1018;
    assign _1017 = _532[7:0];
    assign _1015 = _353[70:63];
    assign _1014 = _300[70:63];
    assign _1013 = _254[70:63];
    assign _1012 = _155[70:63];
    always @* begin
        case (_352)
        0:
            _1016 <= _1012;
        1:
            _1016 <= _1013;
        2:
            _1016 <= _1014;
        default:
            _1016 <= _1015;
        endcase
    end
    assign _1018 = _531 ? _1017 : _1016;
    assign _1376 = ~ _1018;
    assign _1377 = _1071 & _1376;
    assign _1386 = _1377 | _1385;
    assign _1388 = _1386 & _1387;
    assign _1396 = _1388 | _1395;
    assign _1006 = _238 == _990;
    assign _1007 = _1006 | _240;
    assign _530 = _488 == _489;
    assign _1370 = _531 ? _435 : _139;
    assign _1366 = _1101 ? _434 : _139;
    assign _572 = 2'b11;
    assign _1357 = _569 == _572;
    assign _1359 = _1357 ? _990 : _139;
    assign _1356 = _569 == _435;
    assign _1361 = _1356 ? _434 : _1359;
    assign _1355 = _569 == _990;
    assign _1363 = _1355 ? _990 : _1361;
    assign _1364 = _568 ? _1363 : _139;
    assign _404 = _383 == _387;
    assign _401 = _226[3:0];
    assign _403 = _401 == _586;
    assign _405 = _403 | _404;
    assign _400 = _383 == _387;
    assign _399 = _383 == _384;
    assign _398 = _353[104:103];
    always @* begin
        case (_398)
        0:
            _406 <= vdd;
        1:
            _406 <= _399;
        2:
            _406 <= _400;
        default:
            _406 <= _405;
        endcase
    end
    assign _397 = ~ _240;
    assign _407 = _397 | _406;
    assign _394 = _353[62:62];
    assign _392 = _353[61:58];
    always @* begin
        case (_392)
        0:
            _393 <= vdd;
        1:
            _393 <= _211;
        2:
            _393 <= _215;
        3:
            _393 <= _219;
        4:
            _393 <= _221;
        5:
            _393 <= _223;
        6:
            _393 <= _227;
        7:
            _393 <= _230;
        8:
            _393 <= gnd;
        9:
            _393 <= gnd;
        10:
            _393 <= gnd;
        11:
            _393 <= gnd;
        12:
            _393 <= gnd;
        13:
            _393 <= gnd;
        14:
            _393 <= gnd;
        default:
            _393 <= gnd;
        endcase
    end
    assign _395 = _393 ^ _394;
    assign _387 = _353[57:42];
    assign _388 = _387 < _383;
    assign _389 = ~ _388;
    assign _384 = _353[41:26];
    assign _354 = _353[25:24];
    always @* begin
        case (_354)
        0:
            _383 <= _190;
        1:
            _383 <= _193;
        2:
            _383 <= _196;
        default:
            _383 <= _196;
        endcase
    end
    assign _385 = _383 < _384;
    assign _386 = ~ _385;
    assign _390 = _386 & _389;
    assign _377 = _180 & _374;
    assign _379 = _377 == _443;
    assign _380 = ~ _379;
    assign _374 = _353[23:16];
    assign _376 = _374 == _443;
    assign _381 = _376 | _380;
    assign _369 = _353[7:0];
    assign _367 = _353[15:8];
    assign _368 = _162 ^ _367;
    assign _370 = _368 & _369;
    assign _372 = _370 == _443;
    assign _366 = _353[111:111];
    assign _373 = _366 & _372;
    assign _382 = _373 & _381;
    assign _391 = _382 & _390;
    assign _396 = _391 & _395;
    assign _408 = _396 & _407;
    assign _409 = _141 & _408;
    assign _248 = _197 == _201;
    assign _245 = _226[3:0];
    assign _247 = _245 == _586;
    assign _249 = _247 | _248;
    assign _244 = _197 == _201;
    assign _243 = _197 == _198;
    assign _242 = _155[104:103];
    always @* begin
        case (_242)
        0:
            _250 <= vdd;
        1:
            _250 <= _243;
        2:
            _250 <= _244;
        default:
            _250 <= _249;
        endcase
    end
    assign _241 = ~ _240;
    assign _251 = _241 | _250;
    assign _233 = _155[62:62];
    assign _206 = _155[61:58];
    always @* begin
        case (_206)
        0:
            _232 <= vdd;
        1:
            _232 <= _211;
        2:
            _232 <= _215;
        3:
            _232 <= _219;
        4:
            _232 <= _221;
        5:
            _232 <= _223;
        6:
            _232 <= _227;
        7:
            _232 <= _230;
        8:
            _232 <= gnd;
        9:
            _232 <= gnd;
        10:
            _232 <= gnd;
        11:
            _232 <= gnd;
        12:
            _232 <= gnd;
        13:
            _232 <= gnd;
        14:
            _232 <= gnd;
        default:
            _232 <= gnd;
        endcase
    end
    assign _234 = _232 ^ _233;
    assign _201 = _155[57:42];
    assign _202 = _201 < _197;
    assign _203 = ~ _202;
    assign _198 = _155[41:26];
    assign _187 = _155[25:24];
    always @* begin
        case (_187)
        0:
            _197 <= _190;
        1:
            _197 <= _193;
        2:
            _197 <= _196;
        default:
            _197 <= _196;
        endcase
    end
    assign _199 = _197 < _198;
    assign _200 = ~ _199;
    assign _204 = _200 & _203;
    assign _181 = _180 & _170;
    assign _183 = _181 == _443;
    assign _184 = ~ _183;
    assign _170 = _155[23:16];
    assign _172 = _170 == _443;
    assign _185 = _172 | _184;
    assign _165 = _155[7:0];
    assign _163 = _155[15:8];
    assign _164 = _162 ^ _163;
    assign _166 = _164 & _165;
    assign _168 = _166 == _443;
    assign _152 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _1077 = _488 == _879;
    assign _1078 = _1077 ? _88 : _153;
    assign _1075 = _139 == _434;
    assign _1079 = _1075 ? _1078 : _153;
    assign _84 = _1079;
    always @(posedge _122) begin
        if (_120)
            _153 <= _152;
        else
            _153 <= _84;
    end
    assign _1082 = _488 == _885;
    assign _1083 = _1082 ? _88 : _150;
    assign _1080 = _139 == _434;
    assign _1084 = _1080 ? _1083 : _150;
    assign _85 = _1084;
    always @(posedge _122) begin
        if (_120)
            _150 <= _152;
        else
            _150 <= _85;
    end
    assign _1087 = _488 == _891;
    assign _1088 = _1087 ? _88 : _147;
    assign _1085 = _139 == _434;
    assign _1089 = _1085 ? _1088 : _147;
    assign _86 = _1089;
    always @(posedge _122) begin
        if (_120)
            _147 <= _152;
        else
            _147 <= _86;
    end
    assign _88 = ram_rec_rdata;
    assign _1340 = _488 + _879;
    assign _417 = 6'b000000;
    assign _90 = host_start_loc;
    assign _1102 = _1101 ? _1099 : _418;
    assign _92 = host_recover_loc;
    assign _1092 = _569 == _435;
    assign _1093 = _1092 ? _92 : _418;
    assign _1094 = _568 ? _1093 : _418;
    assign _1103 = _410 ? _1102 : _1094;
    assign _1090 = _139 == _435;
    assign _1104 = _1090 ? _1103 : _418;
    assign _1105 = _132 ? _90 : _1104;
    assign _93 = _1105;
    always @(posedge _122) begin
        if (_120)
            _418 <= _417;
        else
            _418 <= _93;
    end
    assign _1098 = _353[110:105];
    assign _1097 = _300[110:105];
    assign _1096 = _254[110:105];
    assign _1095 = _155[110:105];
    always @* begin
        case (_352)
        0:
            _1099 <= _1095;
        1:
            _1099 <= _1096;
        2:
            _1099 <= _1097;
        default:
            _1099 <= _1098;
        endcase
    end
    assign _1100 = _1099 == _418;
    assign _1101 = ~ _1100;
    assign _1336 = _1101 ? _873 : _488;
    assign _569 = _532[59:58];
    assign _1331 = _569 == _435;
    assign _1333 = _1331 ? _873 : _488;
    assign _562 = _532[57:50];
    assign _563 = _180 & _562;
    assign _565 = _563 == _443;
    assign _566 = ~ _565;
    assign _560 = ~ _410;
    assign _561 = _141 & _560;
    assign _567 = _561 & _566;
    assign _1110 = _559 ? _504 : _1108;
    assign _1111 = _410 ? _1108 : _1110;
    assign _1108 = _1004 ? _432 : _557;
    assign _1106 = _139 == _435;
    assign _1112 = _1106 ? _1111 : _1108;
    assign _94 = _1112;
    always @(posedge _122) begin
        if (_120)
            _557 <= _432;
        else
            _557 <= _94;
    end
    assign _558 = ~ _557;
    assign _189 = 16'b0000000000000000;
    assign _1322 = 16'b0000000000000001;
    assign _1323 = _190 + _1322;
    assign _1319 = 16'b1111111111111111;
    assign _1320 = _190 == _1319;
    assign _1321 = ~ _1320;
    assign _1324 = _1321 ? _1323 : _190;
    assign _1284 = _532[26:24];
    assign _1282 = _353[93:91];
    assign _1281 = _300[93:91];
    assign _1280 = _254[93:91];
    assign _1279 = _155[93:91];
    assign _340 = _319 == _323;
    assign _337 = _226[3:0];
    assign _339 = _337 == _586;
    assign _341 = _339 | _340;
    assign _336 = _319 == _323;
    assign _335 = _319 == _320;
    assign _334 = _300[104:103];
    always @* begin
        case (_334)
        0:
            _342 <= vdd;
        1:
            _342 <= _335;
        2:
            _342 <= _336;
        default:
            _342 <= _341;
        endcase
    end
    assign _333 = ~ _240;
    assign _343 = _333 | _342;
    assign _330 = _300[62:62];
    assign _328 = _300[61:58];
    always @* begin
        case (_328)
        0:
            _329 <= vdd;
        1:
            _329 <= _211;
        2:
            _329 <= _215;
        3:
            _329 <= _219;
        4:
            _329 <= _221;
        5:
            _329 <= _223;
        6:
            _329 <= _227;
        7:
            _329 <= _230;
        8:
            _329 <= gnd;
        9:
            _329 <= gnd;
        10:
            _329 <= gnd;
        11:
            _329 <= gnd;
        12:
            _329 <= gnd;
        13:
            _329 <= gnd;
        14:
            _329 <= gnd;
        default:
            _329 <= gnd;
        endcase
    end
    assign _331 = _329 ^ _330;
    assign _323 = _300[57:42];
    assign _324 = _323 < _319;
    assign _325 = ~ _324;
    assign _320 = _300[41:26];
    assign _318 = _300[25:24];
    always @* begin
        case (_318)
        0:
            _319 <= _190;
        1:
            _319 <= _193;
        2:
            _319 <= _196;
        default:
            _319 <= _196;
        endcase
    end
    assign _321 = _319 < _320;
    assign _322 = ~ _321;
    assign _326 = _322 & _325;
    assign _312 = _180 & _309;
    assign _314 = _312 == _443;
    assign _315 = ~ _314;
    assign _309 = _300[23:16];
    assign _311 = _309 == _443;
    assign _316 = _311 | _315;
    assign _304 = _300[7:0];
    assign _302 = _300[15:8];
    assign _303 = _162 ^ _302;
    assign _305 = _303 & _304;
    assign _307 = _305 == _443;
    assign _301 = _300[111:111];
    assign _308 = _301 & _307;
    assign _317 = _308 & _316;
    assign _327 = _317 & _326;
    assign _332 = _327 & _331;
    assign _344 = _332 & _343;
    assign _345 = _141 & _344;
    assign _348 = _345 ? _435 : _572;
    assign _294 = _273 == _277;
    assign _291 = _226[3:0];
    assign _293 = _291 == _586;
    assign _295 = _293 | _294;
    assign _290 = _273 == _277;
    assign _289 = _273 == _274;
    assign _288 = _254[104:103];
    always @* begin
        case (_288)
        0:
            _296 <= vdd;
        1:
            _296 <= _289;
        2:
            _296 <= _290;
        default:
            _296 <= _295;
        endcase
    end
    assign _96 = host_role;
    assign _1113 = _132 ? _96 : _238;
    assign _97 = _1113;
    always @(posedge _122) begin
        if (_120)
            _238 <= _990;
        else
            _238 <= _97;
    end
    assign _240 = _238 == _435;
    assign _287 = ~ _240;
    assign _297 = _287 | _296;
    assign _284 = _254[62:62];
    assign gnd = 1'b0;
    assign _99 = host_match_addr;
    assign _229 = _99[6:0];
    assign _228 = _218[7:1];
    assign _230 = _228 == _229;
    assign _225 = 16'b1010110011100001;
    assign _1118 = _226[10:10];
    assign _1117 = _226[12:12];
    assign _1119 = _1117 ^ _1118;
    assign _1116 = _226[13:13];
    assign _1120 = _1116 ^ _1119;
    assign _1115 = _226[15:15];
    assign _1121 = _1115 ^ _1120;
    assign _1114 = _226[14:0];
    assign _1122 = { _1114,
                     _1121 };
    assign _100 = _1122;
    always @(posedge _122) begin
        if (_120)
            _226 <= _225;
        else
            _226 <= _100;
    end
    assign _227 = _226[0:0];
    assign _1137 = _104 + _858;
    assign _1135 = _104 - _858;
    assign _1138 = _921 ? _1137 : _1135;
    assign _584 = _104 == _586;
    assign _928 = ~ _584;
    assign _102 = host_rx_pop;
    assign _929 = _102 & _928;
    assign _920 = ~ _223;
    assign _1131 = _1129 == _572;
    assign _1132 = _1004 & _1131;
    assign _103 = _1132;
    assign _921 = _103 & _920;
    assign _1133 = _921 ^ _929;
    assign _1139 = _1133 ? _1138 : _104;
    always @(posedge _122) begin
        if (_120)
            _1142 <= _586;
        else
            _1142 <= _1139;
    end
    assign _104 = _1142;
    assign _223 = _104 == _508;
    assign _1159 = _218[6:0];
    assign _1160 = { _1159,
                     _1156 };
    assign _1157 = _218[7:1];
    assign _1155 = _162[7:7];
    assign _1154 = _162[6:6];
    assign _1153 = _162[5:5];
    assign _1152 = _162[4:4];
    assign _1151 = _162[3:3];
    assign _1150 = _162[2:2];
    assign _1149 = _162[1:1];
    assign _1148 = _162[0:0];
    assign _1146 = _353[102:100];
    assign _1145 = _300[102:100];
    assign _1144 = _254[102:100];
    assign _1143 = _155[102:100];
    always @* begin
        case (_352)
        0:
            _1147 <= _1143;
        1:
            _1147 <= _1144;
        2:
            _1147 <= _1145;
        default:
            _1147 <= _1146;
        endcase
    end
    always @* begin
        case (_1147)
        0:
            _1156 <= _1148;
        1:
            _1156 <= _1149;
        2:
            _1156 <= _1150;
        3:
            _1156 <= _1151;
        4:
            _1156 <= _1152;
        5:
            _1156 <= _1153;
        6:
            _1156 <= _1154;
        default:
            _1156 <= _1155;
        endcase
    end
    assign _1158 = { _1156,
                     _1157 };
    assign _1126 = _353[97:96];
    assign _1125 = _300[97:96];
    assign _1124 = _254[97:96];
    assign _1123 = _155[97:96];
    always @* begin
        case (_352)
        0:
            _1127 <= _1123;
        1:
            _1127 <= _1124;
        2:
            _1127 <= _1125;
        default:
            _1127 <= _1126;
        endcase
    end
    assign _1129 = _531 ? _990 : _1127;
    always @* begin
        case (_1129)
        0:
            _1161 <= _218;
        1:
            _1161 <= _1158;
        2:
            _1161 <= _1160;
        default:
            _1161 <= _218;
        endcase
    end
    assign _1162 = _1004 ? _1161 : _218;
    assign _105 = _1162;
    always @(posedge _122) begin
        if (_120)
            _218 <= _443;
        else
            _218 <= _105;
    end
    assign _219 = _218[0:0];
    assign _1262 = _214[7:1];
    assign _1263 = { vdd,
                     _1262 };
    assign _1260 = _1252[7:7];
    assign _1259 = _1252[6:6];
    assign _1258 = _1252[5:5];
    assign _1257 = _1252[4:4];
    assign _1256 = _1252[3:3];
    assign _1255 = _1252[2:2];
    assign _1254 = _1252[1:1];
    assign _1253 = _1252[0:0];
    assign _1261 = { _1253,
                     _1254,
                     _1255,
                     _1256,
                     _1257,
                     _1258,
                     _1259,
                     _1260 };
    assign _1247 = _1167 == _915;
    assign _1248 = _1164 & _1247;
    always @(posedge _122) begin
        if (_120)
            _1249 <= _443;
        else
            if (_1248)
                _1249 <= _108;
    end
    assign _1241 = _1167 == _909;
    assign _1242 = _1164 & _1241;
    always @(posedge _122) begin
        if (_120)
            _1243 <= _443;
        else
            if (_1242)
                _1243 <= _108;
    end
    assign _1235 = _1167 == _903;
    assign _1236 = _1164 & _1235;
    always @(posedge _122) begin
        if (_120)
            _1237 <= _443;
        else
            if (_1236)
                _1237 <= _108;
    end
    assign _1229 = _1167 == _489;
    assign _1230 = _1164 & _1229;
    always @(posedge _122) begin
        if (_120)
            _1231 <= _443;
        else
            if (_1230)
                _1231 <= _108;
    end
    assign _1223 = _1167 == _891;
    assign _1224 = _1164 & _1223;
    always @(posedge _122) begin
        if (_120)
            _1225 <= _443;
        else
            if (_1224)
                _1225 <= _108;
    end
    assign _1217 = _1167 == _885;
    assign _1218 = _1164 & _1217;
    always @(posedge _122) begin
        if (_120)
            _1219 <= _443;
        else
            if (_1218)
                _1219 <= _108;
    end
    assign _1211 = _1167 == _879;
    assign _1212 = _1164 & _1211;
    always @(posedge _122) begin
        if (_120)
            _1213 <= _443;
        else
            if (_1212)
                _1213 <= _108;
    end
    assign _1169 = _1167 + _879;
    assign _1170 = _1164 ? _1169 : _1167;
    assign _106 = _1170;
    always @(posedge _122) begin
        if (_120)
            _1167 <= _873;
        else
            _1167 <= _106;
    end
    assign _1205 = _1167 == _873;
    assign _1206 = _1164 & _1205;
    assign _108 = host_tx_data;
    always @(posedge _122) begin
        if (_120)
            _1207 <= _443;
        else
            if (_1206)
                _1207 <= _108;
    end
    assign _1177 = _1175 + _879;
    assign _1178 = _1172 ? _1177 : _1175;
    assign _109 = _1178;
    always @(posedge _122) begin
        if (_120)
            _1175 <= _873;
        else
            _1175 <= _109;
    end
    always @* begin
        case (_1175)
        0:
            _1250 <= _1207;
        1:
            _1250 <= _1213;
        2:
            _1250 <= _1219;
        3:
            _1250 <= _1225;
        4:
            _1250 <= _1231;
        5:
            _1250 <= _1237;
        6:
            _1250 <= _1243;
        default:
            _1250 <= _1249;
        endcase
    end
    assign _1196 = _113 + _858;
    assign _1194 = _113 - _858;
    assign _1197 = _1164 ? _1196 : _1194;
    assign _1171 = ~ _221;
    assign _1189 = _1185 == _435;
    assign _1187 = _1185 == _434;
    assign _1190 = _1187 | _1189;
    assign _1191 = _1004 & _1190;
    assign _110 = _1191;
    assign _1172 = _110 & _1171;
    assign _986 = _113 == _508;
    assign _1163 = ~ _986;
    assign _112 = host_tx_push;
    assign _1164 = _112 & _1163;
    assign _1192 = _1164 ^ _1172;
    assign _1198 = _1192 ? _1197 : _113;
    always @(posedge _122) begin
        if (_120)
            _1201 <= _586;
        else
            _1201 <= _1198;
    end
    assign _113 = _1201;
    assign _221 = _113 == _586;
    assign _1252 = _221 ? _441 : _1250;
    assign _1184 = _532[28:27];
    assign _1182 = _353[95:94];
    assign _1181 = _300[95:94];
    assign _1180 = _254[95:94];
    assign _1179 = _155[95:94];
    always @* begin
        case (_352)
        0:
            _1183 <= _1179;
        1:
            _1183 <= _1180;
        2:
            _1183 <= _1181;
        default:
            _1183 <= _1182;
        endcase
    end
    assign _1185 = _531 ? _1184 : _1183;
    always @* begin
        case (_1185)
        0:
            _1264 <= _214;
        1:
            _1264 <= _1252;
        2:
            _1264 <= _1261;
        default:
            _1264 <= _1263;
        endcase
    end
    assign _1265 = _1004 ? _1264 : _214;
    assign _114 = _1265;
    always @(posedge _122) begin
        if (_120)
            _214 <= _443;
        else
            _214 <= _114;
    end
    assign _215 = _214[0:0];
    assign _1276 = 8'b00001000;
    assign _1275 = 8'b00000111;
    assign _1273 = 8'b00000001;
    assign _1274 = _209 - _1273;
    assign _1271 = _532[30:29];
    assign _353 = _154[511:400];
    assign _1269 = _353[99:98];
    assign _300 = _154[399:288];
    assign _1268 = _300[99:98];
    assign _1267 = _254[99:98];
    assign _1266 = _155[99:98];
    always @* begin
        case (_352)
        0:
            _1270 <= _1266;
        1:
            _1270 <= _1267;
        2:
            _1270 <= _1268;
        default:
            _1270 <= _1269;
        endcase
    end
    assign _1272 = _531 ? _1271 : _1270;
    always @* begin
        case (_1272)
        0:
            _1277 <= _209;
        1:
            _1277 <= _1274;
        2:
            _1277 <= _1275;
        default:
            _1277 <= _1276;
        endcase
    end
    assign _1278 = _1004 ? _1277 : _209;
    assign _115 = _1278;
    always @(posedge _122) begin
        if (_120)
            _209 <= _443;
        else
            _209 <= _115;
    end
    assign _211 = _209 == _443;
    assign _282 = _254[61:58];
    always @* begin
        case (_282)
        0:
            _283 <= vdd;
        1:
            _283 <= _211;
        2:
            _283 <= _215;
        3:
            _283 <= _219;
        4:
            _283 <= _221;
        5:
            _283 <= _223;
        6:
            _283 <= _227;
        7:
            _283 <= _230;
        8:
            _283 <= gnd;
        9:
            _283 <= gnd;
        10:
            _283 <= gnd;
        11:
            _283 <= gnd;
        12:
            _283 <= gnd;
        13:
            _283 <= gnd;
        14:
            _283 <= gnd;
        default:
            _283 <= gnd;
        endcase
    end
    assign _285 = _283 ^ _284;
    assign _277 = _254[57:42];
    assign _278 = _277 < _273;
    assign _279 = ~ _278;
    assign _274 = _254[41:26];
    assign _1292 = _196 + _1322;
    assign _1289 = _196 == _1319;
    assign _1290 = ~ _1289;
    assign _1293 = _1290 ? _1292 : _196;
    assign _1286 = _1285[2:2];
    assign _1287 = _1004 & _1286;
    assign _1295 = _1287 ? _189 : _1293;
    assign _1297 = _132 ? _189 : _1295;
    assign _116 = _1297;
    always @(posedge _122) begin
        if (_120)
            _196 <= _189;
        else
            _196 <= _116;
    end
    assign _1304 = _193 + _1322;
    assign _1301 = _193 == _1319;
    assign _1302 = ~ _1301;
    assign _1305 = _1302 ? _1304 : _193;
    assign _1298 = _1285[1:1];
    assign _1299 = _1004 & _1298;
    assign _1307 = _1299 ? _189 : _1305;
    assign _1309 = _132 ? _189 : _1307;
    assign _117 = _1309;
    always @(posedge _122) begin
        if (_120)
            _193 <= _189;
        else
            _193 <= _117;
    end
    assign _272 = _254[25:24];
    always @* begin
        case (_272)
        0:
            _273 <= _190;
        1:
            _273 <= _193;
        2:
            _273 <= _196;
        default:
            _273 <= _196;
        endcase
    end
    assign _275 = _273 < _274;
    assign _276 = ~ _275;
    assign _280 = _276 & _279;
    always @(posedge _122) begin
        if (_120)
            _178 <= _443;
        else
            _178 <= _162;
    end
    assign _179 = _162 ^ _178;
    assign _1311 = _139 == _435;
    assign _1313 = _1311 ? _443 : _175;
    assign _1310 = _139 == _434;
    assign _1314 = _1310 ? _180 : _1313;
    assign _1316 = _132 ? _443 : _1314;
    assign _118 = _1316;
    always @(posedge _122) begin
        if (_120)
            _175 <= _443;
        else
            _175 <= _118;
    end
    assign _180 = _175 | _179;
    assign _266 = _180 & _263;
    assign _268 = _266 == _443;
    assign _269 = ~ _268;
    assign _263 = _254[23:16];
    assign _265 = _263 == _443;
    assign _270 = _265 | _269;
    assign _258 = _254[7:0];
    assign _256 = _254[15:8];
    assign vdd = 1'b1;
    assign _120 = clear;
    assign _122 = clock;
    assign _124 = pins_in;
    always @(posedge _122) begin
        if (_120)
            _159 <= _443;
        else
            _159 <= _124;
    end
    always @(posedge _122) begin
        if (_120)
            _162 <= _443;
        else
            _162 <= _159;
    end
    assign _257 = _162 ^ _256;
    assign _259 = _257 & _258;
    assign _261 = _259 == _443;
    assign _254 = _154[287:176];
    assign _255 = _254[111:111];
    assign _262 = _255 & _261;
    assign _271 = _262 & _270;
    assign _281 = _271 & _280;
    assign _286 = _281 & _285;
    assign _298 = _286 & _297;
    assign _299 = _141 & _298;
    assign _350 = _299 ? _434 : _348;
    assign _352 = _253 ? _990 : _350;
    always @* begin
        case (_352)
        0:
            _1283 <= _1279;
        1:
            _1283 <= _1280;
        2:
            _1283 <= _1281;
        default:
            _1283 <= _1282;
        endcase
    end
    assign _1285 = _531 ? _1284 : _1283;
    assign _1317 = _1285[0:0];
    assign _1318 = _1004 & _1317;
    assign _1326 = _1318 ? _189 : _1324;
    assign _1328 = _132 ? _189 : _1326;
    assign _125 = _1328;
    always @(posedge _122) begin
        if (_120)
            _190 <= _189;
        else
            _190 <= _125;
    end
    assign _551 = _532[33:32];
    always @* begin
        case (_551)
        0:
            _552 <= _190;
        1:
            _552 <= _193;
        2:
            _552 <= _196;
        default:
            _552 <= _196;
        endcase
    end
    assign _550 = _532[49:34];
    assign _553 = _550 < _552;
    assign _532 = _154[63:0];
    assign _548 = _532[31:31];
    assign _546 = ~ _410;
    assign _547 = _141 & _546;
    assign _549 = _547 & _548;
    assign _554 = _549 & _553;
    assign _559 = _554 & _558;
    assign _568 = _559 | _567;
    assign _1334 = _568 ? _1333 : _488;
    assign _1337 = _410 ? _1336 : _1334;
    assign _1330 = _139 == _435;
    assign _1338 = _1330 ? _1337 : _488;
    assign _1329 = _139 == _434;
    assign _1341 = _1329 ? _1340 : _1338;
    assign _1343 = _132 ? _873 : _1341;
    assign _126 = _1343;
    always @(posedge _122) begin
        if (_120)
            _488 <= _873;
        else
            _488 <= _126;
    end
    assign _1346 = _488 == _489;
    assign _1347 = _1346 ? _88 : _144;
    assign _1344 = _139 == _434;
    assign _1348 = _1344 ? _1347 : _144;
    assign _127 = _1348;
    always @(posedge _122) begin
        if (_120)
            _144 <= _152;
        else
            _144 <= _127;
    end
    assign _154 = { _144,
                    _147,
                    _150,
                    _153 };
    assign _155 = _154[175:64];
    assign _156 = _155[111:111];
    assign _169 = _156 & _168;
    assign _186 = _169 & _185;
    assign _205 = _186 & _204;
    assign _235 = _205 & _234;
    assign _252 = _235 & _251;
    assign _141 = _139 == _435;
    assign _253 = _141 & _252;
    assign _364 = _253 | _299;
    assign _365 = _364 | _345;
    assign _410 = _365 | _409;
    assign _1367 = _410 ? _1366 : _1364;
    assign _1352 = _139 == _572;
    assign _1354 = _1352 ? _990 : _139;
    assign _1350 = _139 == _435;
    assign _1368 = _1350 ? _1367 : _1354;
    assign _1349 = _139 == _434;
    assign _1371 = _1349 ? _1370 : _1368;
    assign _129 = host_stop;
    assign _1373 = _129 ? _990 : _1371;
    assign _1375 = _132 ? _434 : _1373;
    assign _130 = _1375;
    always @(posedge _122) begin
        if (_120)
            _139 <= _990;
        else
            _139 <= _130;
    end
    assign _485 = _139 == _434;
    assign _531 = _485 & _530;
    assign _1004 = _531 | _410;
    assign _1008 = _1004 & _1007;
    assign _1397 = _1008 ? _1396 : _1071;
    assign _132 = host_start;
    assign _1399 = _132 ? _443 : _1397;
    assign _133 = _1399;
    always @(posedge _122) begin
        if (_120)
            _1071 <= _443;
        else
            _1071 <= _133;
    end
    assign _1401 = _1071 & _1400;
    assign pins_out = _1401;
    assign pins_oe = _1074;
    assign st_running = _1003;
    assign st_in_entry = _485;
    assign st_cur_loc = _418;
    assign st_accepting = _1002;
    assign st_taken = _1000;
    assign st_taken_edge = _997;
    assign st_viol = _994;
    assign st_viol_kind = _991;
    assign st_timestamp = _602;
    assign st_tx_full = _986;
    assign st_tx_empty = _221;
    assign st_rx_data = _984;
    assign st_rx_empty = _584;
    assign st_vlog_data = _919;
    assign st_vlog_empty = _587;
    assign st_cov_rdata = _44;
    assign st_irq = _591;
    assign st_halted_viol = _528;
    assign st_rx_overflow = _521;
    assign st_vlog_overflow = _513;
    assign st_cov_overrun = _503;
    assign ram_rec_addr = _494;
    assign ram_rec_re = _491;
    assign ram_rec_we = _483;
    assign ram_rec_wdata = _18;
    assign ram_cov_addr = _482;
    assign ram_cov_re = _477;
    assign ram_cov_we = _474;
    assign ram_cov_wdata = _466;

endmodule
