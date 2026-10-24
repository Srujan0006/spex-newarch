module spex_sim_top (
    host_irq_ack,
    host_cov_we,
    host_cov_wdata,
    host_cov_addr,
    host_cover_en,
    host_vlog_pop,
    host_open_drain,
    host_rec_we,
    host_rec_wdata,
    host_rec_waddr,
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
    st_cov_overrun
);

    input host_irq_ack;
    input host_cov_we;
    input [31:0] host_cov_wdata;
    input [7:0] host_cov_addr;
    input host_cover_en;
    input host_vlog_pop;
    input [7:0] host_open_drain;
    input host_rec_we;
    input [127:0] host_rec_wdata;
    input [7:0] host_rec_waddr;
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

    wire _407;
    wire _409;
    wire _403;
    wire _404;
    wire _388;
    wire _405;
    wire _410;
    wire _412;
    wire _1;
    reg _408;
    wire _415;
    wire _420;
    wire _422;
    wire _3;
    reg _418;
    wire _423;
    wire _428;
    wire _430;
    wire _5;
    reg _426;
    wire _443;
    wire _444;
    wire _449;
    wire _9;
    wire _451;
    wire _453;
    wire _10;
    reg _447;
    wire _483;
    wire _485;
    wire _481;
    wire _487;
    wire _488;
    wire _489;
    wire _455;
    wire _490;
    wire _492;
    wire _11;
    reg _433;
    wire _498;
    wire _495;
    wire _499;
    wire _500;
    wire _501;
    wire _577;
    wire _576;
    wire _578;
    wire [31:0] _575;
    wire _569;
    wire _567;
    wire _14;
    wire _566;
    wire _568;
    wire _570;
    wire _571;
    wire [11:0] _558;
    wire _555;
    wire _556;
    wire [11:0] _557;
    wire _559;
    wire [11:0] _560;
    wire [11:0] _561;
    wire [11:0] _547;
    wire [11:0] _15;
    reg [11:0] _511;
    wire [11:0] _16;
    reg [11:0] _548;
    wire [11:0] _507;
    wire [11:0] _506;
    reg [1:0] _503;
    reg [15:0] _504;
    wire [15:0] _502;
    wire _505;
    wire [11:0] _508;
    wire [11:0] _17;
    reg [11:0] _545;
    wire _549;
    wire _550;
    wire [11:0] _551;
    wire [11:0] _542;
    wire _552;
    wire [11:0] _553;
    wire [7:0] _540;
    wire _541;
    wire [11:0] _554;
    wire [7:0] _538;
    wire [7:0] _537;
    wire [1:0] _532;
    wire [1:0] _531;
    wire _513;
    wire _512;
    wire _514;
    wire _18;
    reg _530;
    wire [1:0] _533;
    wire [6:0] _527;
    wire [8:0] _534;
    wire [7:0] _525;
    wire [8:0] _526;
    wire [8:0] _535;
    wire _536;
    wire [7:0] _539;
    wire [31:0] _562;
    wire [31:0] _20;
    wire [31:0] _563;
    reg [31:0] _572[0:255];
    wire [7:0] _21;
    reg [7:0] _523;
    wire [7:0] _399;
    wire [7:0] _22;
    reg [7:0] _402;
    wire [7:0] _24;
    wire [7:0] _520;
    wire _515;
    wire _26;
    wire _384;
    wire _516;
    wire _27;
    reg _387;
    wire _28;
    reg _519;
    wire [7:0] _524;
    wire [31:0] _573;
    reg [31:0] _579;
    wire [31:0] _29;
    wire [2:0] _903;
    wire _904;
    wire _905;
    wire [47:0] _902;
    reg [47:0] _906;
    wire [2:0] _897;
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
    wire _874;
    wire _875;
    reg [47:0] _876;
    wire [2:0] _867;
    wire _868;
    wire _869;
    reg [47:0] _870;
    wire [2:0] _861;
    wire [2:0] _586;
    wire [2:0] _587;
    wire [2:0] _32;
    reg [2:0] _584;
    wire _862;
    wire _863;
    wire [2:0] _837;
    wire [28:0] _595;
    wire [28:0] _594;
    wire [28:0] _597;
    wire [28:0] _598;
    wire [2:0] _591;
    wire _593;
    wire [28:0] _599;
    wire [28:0] _33;
    reg [28:0] _596;
    wire [28:0] _835;
    wire [2:0] _618;
    wire _614;
    wire _615;
    wire _612;
    wire _616;
    wire [2:0] _619;
    wire _609;
    wire _610;
    wire _608;
    wire _611;
    wire [2:0] _621;
    wire _602;
    wire [2:0] _607;
    wire _601;
    wire [2:0] _622;
    wire [2:0] _34;
    reg [2:0] _605;
    wire _823;
    wire _822;
    wire _824;
    wire [2:0] _826;
    wire [2:0] _640;
    wire _636;
    wire _637;
    wire _634;
    wire _638;
    wire [2:0] _641;
    wire _631;
    wire _632;
    wire _630;
    wire _633;
    wire [2:0] _643;
    wire _624;
    wire [2:0] _629;
    wire _623;
    wire [2:0] _644;
    wire [2:0] _35;
    reg [2:0] _627;
    wire _818;
    wire _817;
    wire _819;
    wire [2:0] _821;
    wire _827;
    wire [2:0] _828;
    wire [2:0] _662;
    wire _658;
    wire _659;
    wire _656;
    wire _660;
    wire [2:0] _663;
    wire _653;
    wire _654;
    wire _652;
    wire _655;
    wire [2:0] _665;
    wire _646;
    wire [2:0] _651;
    wire _645;
    wire [2:0] _666;
    wire [2:0] _36;
    reg [2:0] _649;
    wire _811;
    wire _810;
    wire _812;
    wire [2:0] _814;
    wire [2:0] _684;
    wire _680;
    wire _681;
    wire _678;
    wire _682;
    wire [2:0] _685;
    wire _675;
    wire _676;
    wire _674;
    wire _677;
    wire [2:0] _687;
    wire _668;
    wire [2:0] _673;
    wire _667;
    wire [2:0] _688;
    wire [2:0] _37;
    reg [2:0] _671;
    wire _806;
    wire _805;
    wire _807;
    wire [2:0] _809;
    wire _815;
    wire [2:0] _816;
    wire _829;
    wire [2:0] _830;
    wire [2:0] _706;
    wire _702;
    wire _703;
    wire _700;
    wire _704;
    wire [2:0] _707;
    wire _697;
    wire _698;
    wire _696;
    wire _699;
    wire [2:0] _709;
    wire _690;
    wire [2:0] _695;
    wire _689;
    wire [2:0] _710;
    wire [2:0] _38;
    reg [2:0] _693;
    wire _797;
    wire _796;
    wire _798;
    wire [2:0] _800;
    wire [2:0] _728;
    wire _724;
    wire _725;
    wire _722;
    wire _726;
    wire [2:0] _729;
    wire _719;
    wire _720;
    wire _718;
    wire _721;
    wire [2:0] _731;
    wire _712;
    wire [2:0] _717;
    wire _711;
    wire [2:0] _732;
    wire [2:0] _39;
    reg [2:0] _715;
    wire _792;
    wire _791;
    wire _793;
    wire [2:0] _795;
    wire _801;
    wire [2:0] _802;
    wire [2:0] _750;
    wire _746;
    wire _747;
    wire _744;
    wire _748;
    wire [2:0] _751;
    wire _741;
    wire _742;
    wire _740;
    wire _743;
    wire [2:0] _753;
    wire _734;
    wire [2:0] _739;
    wire _733;
    wire [2:0] _754;
    wire [2:0] _40;
    reg [2:0] _737;
    wire _785;
    wire _784;
    wire _786;
    wire [2:0] _788;
    wire [2:0] _772;
    wire _768;
    wire _769;
    wire _766;
    wire _770;
    wire [2:0] _773;
    wire _763;
    wire _764;
    wire _762;
    wire _765;
    wire [2:0] _775;
    wire _756;
    wire [2:0] _761;
    wire _755;
    wire [2:0] _776;
    wire [2:0] _41;
    reg [2:0] _759;
    wire _780;
    wire _779;
    wire _781;
    wire [2:0] _783;
    wire _789;
    wire [2:0] _790;
    wire _803;
    wire [2:0] _804;
    wire _831;
    wire [2:0] _832;
    wire [2:0] _833;
    wire [2:0] _777;
    wire _834;
    wire [28:0] _836;
    wire [31:0] _838;
    wire [47:0] _840;
    wire [47:0] _42;
    reg [47:0] _864;
    wire [2:0] _857;
    wire [3:0] _496;
    wire [3:0] _846;
    wire [3:0] _847;
    wire [3:0] _845;
    wire [3:0] _848;
    wire [3:0] _413;
    wire _414;
    wire _580;
    wire _43;
    wire _581;
    wire _843;
    wire [3:0] _849;
    reg [3:0] _852;
    wire [3:0] _44;
    wire _497;
    wire _841;
    wire _46;
    wire _842;
    wire [2:0] _858;
    wire [2:0] _47;
    reg [2:0] _855;
    reg [47:0] _907;
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
    wire _939;
    wire _940;
    reg [7:0] _941;
    wire _933;
    wire _934;
    reg [7:0] _935;
    wire [2:0] _914;
    wire [2:0] _915;
    wire [2:0] _50;
    reg [2:0] _912;
    wire _927;
    wire _928;
    reg [7:0] _929;
    wire [2:0] _922;
    wire [2:0] _923;
    wire [2:0] _51;
    reg [2:0] _920;
    reg [7:0] _972;
    wire [31:0] _975;
    wire [31:0] _976;
    wire [31:0] _55;
    reg [31:0] _590;
    wire [1:0] _978;
    wire [1:0] _839;
    reg [1:0] _979;
    reg _982;
    reg [1:0] _985;
    reg _988;
    wire _989;
    wire _990;
    wire _991;
    wire [7:0] _1060;
    wire [7:0] _1061;
    wire [7:0] _1014;
    wire [7:0] _1012;
    wire [7:0] _1011;
    wire [7:0] _1010;
    wire [7:0] _1009;
    reg [7:0] _1013;
    wire [7:0] _1015;
    wire [7:0] _1016;
    wire [7:0] _1007;
    wire [7:0] _1008;
    wire [7:0] _1017;
    wire [7:0] _1051;
    wire [7:0] _1052;
    wire [7:0] _1054;
    wire [7:0] _1056;
    wire [7:0] _65;
    reg [7:0] _999;
    wire [7:0] _1062;
    wire [7:0] _68;
    wire [7:0] _1400;
    wire [2:0] _1392;
    wire _1389;
    wire [1:0] _1390;
    wire [3:0] _1391;
    wire [6:0] _1393;
    wire [7:0] _1394;
    wire [7:0] _1395;
    wire _1048;
    wire _1047;
    wire _1046;
    wire _1044;
    wire _1045;
    wire _1042;
    wire _1043;
    wire _1039;
    wire _1040;
    wire _1041;
    wire _1036;
    wire _1037;
    wire _1038;
    wire _1033;
    wire _1032;
    wire _1034;
    wire [2:0] _1029;
    wire [2:0] _1028;
    wire [2:0] _1027;
    wire [2:0] _1026;
    reg [2:0] _1030;
    wire _1031;
    wire _1035;
    wire [7:0] _1049;
    wire _1022;
    wire _1021;
    wire _1020;
    wire _1019;
    reg _1023;
    wire _1018;
    wire _1024;
    wire [7:0] _1050;
    wire [7:0] _1387;
    wire [7:0] _1383;
    wire [7:0] _1381;
    wire [7:0] _1380;
    wire [7:0] _1379;
    wire [7:0] _1378;
    reg [7:0] _1382;
    wire [7:0] _1384;
    wire [7:0] _1385;
    wire [7:0] _1005;
    wire [7:0] _1003;
    wire [7:0] _1002;
    wire [7:0] _1001;
    wire [7:0] _1000;
    reg [7:0] _1004;
    wire [7:0] _1006;
    wire [7:0] _1376;
    wire [7:0] _1377;
    wire [7:0] _1386;
    wire [7:0] _1388;
    wire [7:0] _1396;
    wire _994;
    wire _995;
    wire _440;
    wire [1:0] _1370;
    wire [1:0] _1366;
    wire [1:0] _482;
    wire _1357;
    wire [1:0] _1359;
    wire _1356;
    wire [1:0] _1361;
    wire _1355;
    wire [1:0] _1363;
    wire [1:0] _1364;
    wire _377;
    wire [3:0] _374;
    wire _376;
    wire _378;
    wire _373;
    wire _372;
    wire [1:0] _371;
    reg _379;
    wire _370;
    wire _380;
    wire _367;
    wire [3:0] _365;
    reg _366;
    wire _368;
    wire [15:0] _360;
    wire _361;
    wire _362;
    wire [15:0] _357;
    wire [1:0] _355;
    reg [15:0] _356;
    wire _358;
    wire _359;
    wire _363;
    wire [7:0] _349;
    wire _351;
    wire _352;
    wire [7:0] _346;
    wire _348;
    wire _353;
    wire [7:0] _341;
    wire [7:0] _339;
    wire [7:0] _340;
    wire [7:0] _342;
    wire _344;
    wire _338;
    wire _345;
    wire _354;
    wire _364;
    wire _369;
    wire _381;
    wire _382;
    wire _237;
    wire [3:0] _234;
    wire _236;
    wire _238;
    wire _233;
    wire _232;
    wire [1:0] _231;
    reg _239;
    wire _230;
    wire _240;
    wire _222;
    wire [3:0] _195;
    reg _221;
    wire _223;
    wire [15:0] _190;
    wire _191;
    wire _192;
    wire [15:0] _187;
    wire [1:0] _176;
    reg [15:0] _186;
    wire _188;
    wire _189;
    wire _193;
    wire [7:0] _170;
    wire _172;
    wire _173;
    wire [7:0] _159;
    wire _161;
    wire _174;
    wire [7:0] _154;
    wire [7:0] _152;
    wire [7:0] _153;
    wire [7:0] _155;
    wire _157;
    wire [127:0] _141;
    wire _1065;
    wire [127:0] _1066;
    wire _1063;
    wire [127:0] _1067;
    wire [127:0] _69;
    reg [127:0] _142;
    wire _1070;
    wire [127:0] _1071;
    wire _1068;
    wire [127:0] _1072;
    wire [127:0] _70;
    reg [127:0] _139;
    wire _1075;
    wire [127:0] _1076;
    wire _1073;
    wire [127:0] _1077;
    wire [127:0] _71;
    reg [127:0] _136;
    wire _565;
    wire _73;
    wire _1084;
    wire [127:0] _75;
    reg [127:0] _1085[0:255];
    wire [1:0] _1081;
    wire [7:0] _1082;
    wire [7:0] _77;
    wire _1079;
    wire _1080;
    wire [7:0] _1083;
    wire [127:0] _1086;
    reg [127:0] _1089;
    wire [127:0] _78;
    wire [2:0] _1340;
    wire [5:0] _390;
    wire [5:0] _80;
    wire [5:0] _1102;
    wire [5:0] _82;
    wire _1092;
    wire [5:0] _1093;
    wire [5:0] _1094;
    wire [5:0] _1103;
    wire _1090;
    wire [5:0] _1104;
    wire [5:0] _1105;
    wire [5:0] _83;
    reg [5:0] _391;
    wire [5:0] _1098;
    wire [5:0] _1097;
    wire [5:0] _1096;
    wire [5:0] _1095;
    reg [5:0] _1099;
    wire _1100;
    wire _1101;
    wire [2:0] _1336;
    wire [1:0] _479;
    wire _1331;
    wire [2:0] _1333;
    wire [7:0] _472;
    wire [7:0] _473;
    wire _475;
    wire _476;
    wire _470;
    wire _471;
    wire _477;
    wire _1110;
    wire _1111;
    wire _1108;
    wire _1106;
    wire _1112;
    wire _84;
    reg _467;
    wire _468;
    wire [15:0] _178;
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
    wire _330;
    wire [3:0] _327;
    wire _329;
    wire _331;
    wire _326;
    wire _325;
    wire [1:0] _324;
    reg _332;
    wire _323;
    wire _333;
    wire _320;
    wire [3:0] _318;
    reg _319;
    wire _321;
    wire [15:0] _313;
    wire _314;
    wire _315;
    wire [15:0] _310;
    wire [1:0] _308;
    reg [15:0] _309;
    wire _311;
    wire _312;
    wire _316;
    wire [7:0] _302;
    wire _304;
    wire _305;
    wire [7:0] _299;
    wire _301;
    wire _306;
    wire [7:0] _294;
    wire [7:0] _292;
    wire [7:0] _293;
    wire [7:0] _295;
    wire _297;
    wire _291;
    wire _298;
    wire _307;
    wire _317;
    wire _322;
    wire _334;
    wire _335;
    wire [1:0] _394;
    wire _283;
    wire [3:0] _280;
    wire _282;
    wire _284;
    wire _279;
    wire _278;
    wire [1:0] _277;
    reg _285;
    wire [1:0] _86;
    wire [1:0] _1113;
    wire [1:0] _87;
    reg [1:0] _227;
    wire _229;
    wire _276;
    wire _286;
    wire _273;
    wire gnd;
    wire [7:0] _89;
    wire [6:0] _218;
    wire [6:0] _217;
    wire _219;
    wire [15:0] _214;
    wire _1118;
    wire _1117;
    wire _1119;
    wire _1116;
    wire _1120;
    wire _1115;
    wire _1121;
    wire [14:0] _1114;
    wire [15:0] _1122;
    wire [15:0] _90;
    reg [15:0] _215;
    wire _216;
    wire [3:0] _1137;
    wire [3:0] _1135;
    wire [3:0] _1138;
    wire _494;
    wire _916;
    wire _92;
    wire _917;
    wire _908;
    wire _1131;
    wire _1132;
    wire _93;
    wire _909;
    wire _1133;
    wire [3:0] _1139;
    reg [3:0] _1142;
    wire [3:0] _94;
    wire _212;
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
    wire [7:0] _95;
    reg [7:0] _207;
    wire _208;
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
    wire [2:0] _96;
    reg [2:0] _1167;
    wire _1205;
    wire _1206;
    wire [7:0] _98;
    reg [7:0] _1207;
    wire [2:0] _1177;
    wire [2:0] _1178;
    wire [2:0] _99;
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
    wire _100;
    wire _1172;
    wire _974;
    wire _1163;
    wire _102;
    wire _1164;
    wire _1192;
    wire [3:0] _1198;
    reg [3:0] _1201;
    wire [3:0] _103;
    wire _210;
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
    wire [7:0] _104;
    reg [7:0] _203;
    wire _204;
    wire [7:0] _1276;
    wire [7:0] _1275;
    wire [7:0] _1273;
    wire [7:0] _1274;
    wire [1:0] _1271;
    wire [111:0] _337;
    wire [1:0] _1269;
    wire [111:0] _290;
    wire [1:0] _1268;
    wire [1:0] _1267;
    wire [1:0] _1266;
    reg [1:0] _1270;
    wire [1:0] _1272;
    reg [7:0] _1277;
    wire [7:0] _1278;
    wire [7:0] _105;
    reg [7:0] _198;
    wire _200;
    wire [3:0] _271;
    reg _272;
    wire _274;
    wire [15:0] _266;
    wire _267;
    wire _268;
    wire [15:0] _263;
    wire [15:0] _1292;
    wire _1289;
    wire _1290;
    wire [15:0] _1293;
    wire _1286;
    wire _1287;
    wire [15:0] _1295;
    wire [15:0] _1297;
    wire [15:0] _106;
    reg [15:0] _185;
    wire [15:0] _1304;
    wire _1301;
    wire _1302;
    wire [15:0] _1305;
    wire _1298;
    wire _1299;
    wire [15:0] _1307;
    wire [15:0] _1309;
    wire [15:0] _107;
    reg [15:0] _182;
    wire [1:0] _261;
    reg [15:0] _262;
    wire _264;
    wire _265;
    wire _269;
    reg [7:0] _167;
    wire [7:0] _168;
    wire _1311;
    wire [7:0] _1313;
    wire _1310;
    wire [7:0] _1314;
    wire [7:0] _1316;
    wire [7:0] _108;
    reg [7:0] _164;
    wire [7:0] _169;
    wire [7:0] _255;
    wire _257;
    wire _258;
    wire [7:0] _252;
    wire _254;
    wire _259;
    wire [7:0] _247;
    wire [7:0] _245;
    wire vdd;
    wire _110;
    wire _112;
    wire [7:0] _114;
    reg [7:0] _148;
    reg [7:0] _151;
    wire [7:0] _246;
    wire [7:0] _248;
    wire _250;
    wire [111:0] _243;
    wire _244;
    wire _251;
    wire _260;
    wire _270;
    wire _275;
    wire _287;
    wire _288;
    wire [1:0] _396;
    wire [1:0] _398;
    reg [2:0] _1283;
    wire [2:0] _1285;
    wire _1317;
    wire _1318;
    wire [15:0] _1326;
    wire [15:0] _1328;
    wire [15:0] _115;
    reg [15:0] _179;
    wire [1:0] _461;
    reg [15:0] _462;
    wire [15:0] _460;
    wire _463;
    wire [63:0] _442;
    wire _458;
    wire _456;
    wire _457;
    wire _459;
    wire _464;
    wire _469;
    wire _478;
    wire [2:0] _1334;
    wire [2:0] _1337;
    wire _1330;
    wire [2:0] _1338;
    wire _1329;
    wire [2:0] _1341;
    wire [2:0] _1343;
    wire [2:0] _116;
    reg [2:0] _438;
    wire _1346;
    wire [127:0] _1347;
    wire _1344;
    wire [127:0] _1348;
    wire [127:0] _117;
    reg [127:0] _133;
    wire [511:0] _143;
    wire [111:0] _144;
    wire _145;
    wire _158;
    wire _175;
    wire _194;
    wire _224;
    wire _241;
    wire _130;
    wire _242;
    wire _289;
    wire _336;
    wire _383;
    wire [1:0] _1367;
    wire _1352;
    wire [1:0] _1354;
    wire _1350;
    wire [1:0] _1368;
    wire _1349;
    wire [1:0] _1371;
    wire _119;
    wire [1:0] _1373;
    wire [1:0] _1375;
    wire [1:0] _120;
    reg [1:0] _128;
    wire _435;
    wire _441;
    wire _992;
    wire _996;
    wire [7:0] _1397;
    wire _122;
    wire [7:0] _1399;
    wire [7:0] _123;
    reg [7:0] _1059;
    wire [7:0] _1401;
    assign _407 = 1'b0;
    assign _409 = 1'b1;
    assign _403 = _399 == _402;
    assign _404 = ~ _403;
    assign _388 = _384 & _387;
    assign _405 = _388 & _404;
    assign _410 = _405 ? _409 : _408;
    assign _412 = _122 ? _407 : _410;
    assign _1 = _412;
    always @(posedge _112) begin
        if (_110)
            _408 <= _407;
        else
            _408 <= _1;
    end
    assign _415 = _43 & _414;
    assign _420 = _415 ? _409 : _418;
    assign _422 = _122 ? _407 : _420;
    assign _3 = _422;
    always @(posedge _112) begin
        if (_110)
            _418 <= _407;
        else
            _418 <= _3;
    end
    assign _423 = _93 & _212;
    assign _428 = _423 ? _409 : _426;
    assign _430 = _122 ? _407 : _428;
    assign _5 = _430;
    always @(posedge _112) begin
        if (_110)
            _426 <= _407;
        else
            _426 <= _5;
    end
    assign _443 = _442[61:61];
    assign _444 = _441 & _443;
    assign _449 = _444 ? _409 : _447;
    assign _9 = host_irq_ack;
    assign _451 = _9 ? _407 : _449;
    assign _453 = _122 ? _407 : _451;
    assign _10 = _453;
    always @(posedge _112) begin
        if (_110)
            _447 <= _407;
        else
            _447 <= _10;
    end
    assign _483 = _479 == _482;
    assign _485 = _483 ? _409 : _433;
    assign _481 = _479 == _978;
    assign _487 = _481 ? _409 : _485;
    assign _488 = _478 ? _487 : _433;
    assign _489 = _383 ? _433 : _488;
    assign _455 = _128 == _532;
    assign _490 = _455 ? _489 : _433;
    assign _492 = _122 ? _407 : _490;
    assign _11 = _492;
    always @(posedge _112) begin
        if (_110)
            _433 <= _407;
        else
            _433 <= _11;
    end
    assign _498 = ~ _497;
    assign _495 = ~ _494;
    assign _499 = _495 | _498;
    assign _500 = _499 | _433;
    assign _501 = _500 | _447;
    assign _577 = ~ _570;
    assign _576 = ~ _519;
    assign _578 = _576 & _577;
    assign _575 = 32'b00000000000000000000000000000000;
    assign _569 = ~ _387;
    assign _567 = ~ _519;
    assign _14 = host_cov_we;
    assign _566 = _14 & _565;
    assign _568 = _566 & _567;
    assign _570 = _568 & _569;
    assign _571 = _519 | _570;
    assign _558 = _29[11:0];
    assign _555 = _548 < _545;
    assign _556 = _530 & _555;
    assign _557 = _556 ? _545 : _548;
    assign _559 = _557 < _558;
    assign _560 = _559 ? _558 : _557;
    assign _561 = _541 ? _557 : _560;
    assign _547 = 12'b000000000000;
    assign _15 = _508;
    always @(posedge _112) begin
        if (_110)
            _511 <= _547;
        else
            _511 <= _15;
    end
    assign _16 = _511;
    always @(posedge _112) begin
        if (_110)
            _548 <= _547;
        else
            _548 <= _16;
    end
    assign _507 = 12'b111111111111;
    assign _506 = _504[11:0];
    always @* begin
        case (_398)
        0:
            _503 <= _176;
        1:
            _503 <= _261;
        2:
            _503 <= _308;
        default:
            _503 <= _355;
        endcase
    end
    always @* begin
        case (_503)
        0:
            _504 <= _179;
        1:
            _504 <= _182;
        2:
            _504 <= _185;
        default:
            _504 <= _185;
        endcase
    end
    assign _502 = 16'b0000111111111111;
    assign _505 = _502 < _504;
    assign _508 = _505 ? _507 : _506;
    assign _17 = _508;
    always @(posedge _112) begin
        if (_110)
            _545 <= _547;
        else
            _545 <= _17;
    end
    assign _549 = _545 < _548;
    assign _550 = _530 & _549;
    assign _551 = _550 ? _545 : _548;
    assign _542 = _29[23:12];
    assign _552 = _542 < _551;
    assign _553 = _552 ? _542 : _551;
    assign _540 = 8'b00000000;
    assign _541 = _525 == _540;
    assign _554 = _541 ? _551 : _553;
    assign _538 = 8'b11111111;
    assign _537 = _535[7:0];
    assign _532 = 2'b10;
    assign _531 = 2'b01;
    assign _513 = _399 == _402;
    assign _512 = _384 & _387;
    assign _514 = _512 & _513;
    assign _18 = _514;
    always @(posedge _112) begin
        if (_110)
            _530 <= _407;
        else
            _530 <= _18;
    end
    assign _533 = _530 ? _532 : _531;
    assign _527 = 7'b0000000;
    assign _534 = { _527,
                    _533 };
    assign _525 = _29[31:24];
    assign _526 = { gnd,
                    _525 };
    assign _535 = _526 + _534;
    assign _536 = _535[8:8];
    assign _539 = _536 ? _538 : _537;
    assign _562 = { _539,
                    _554,
                    _561 };
    assign _20 = host_cov_wdata;
    assign _563 = _519 ? _562 : _20;
    always @(posedge _112) begin
        if (_571)
            _572[_524] <= _563;
    end
    assign _21 = _402;
    always @(posedge _112) begin
        if (_110)
            _523 <= _540;
        else
            _523 <= _21;
    end
    assign _399 = { _391,
                    _398 };
    assign _22 = _399;
    always @(posedge _112) begin
        if (_110)
            _402 <= _540;
        else
            _402 <= _22;
    end
    assign _24 = host_cov_addr;
    assign _520 = _387 ? _402 : _24;
    assign _515 = ~ _387;
    assign _26 = host_cover_en;
    assign _384 = _383 & _26;
    assign _516 = _384 & _515;
    assign _27 = _516;
    always @(posedge _112) begin
        if (_110)
            _387 <= _407;
        else
            _387 <= _27;
    end
    assign _28 = _387;
    always @(posedge _112) begin
        if (_110)
            _519 <= _407;
        else
            _519 <= _28;
    end
    assign _524 = _519 ? _523 : _520;
    assign _573 = _572[_524];
    always @(posedge _112) begin
        if (_578)
            _579 <= _573;
    end
    assign _29 = _579;
    assign _903 = 3'b111;
    assign _904 = _584 == _903;
    assign _905 = _581 & _904;
    assign _902 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _112) begin
        if (_110)
            _906 <= _902;
        else
            if (_905)
                _906 <= _42;
    end
    assign _897 = 3'b110;
    assign _898 = _584 == _897;
    assign _899 = _581 & _898;
    always @(posedge _112) begin
        if (_110)
            _900 <= _902;
        else
            if (_899)
                _900 <= _42;
    end
    assign _891 = 3'b101;
    assign _892 = _584 == _891;
    assign _893 = _581 & _892;
    always @(posedge _112) begin
        if (_110)
            _894 <= _902;
        else
            if (_893)
                _894 <= _42;
    end
    assign _885 = 3'b100;
    assign _886 = _584 == _885;
    assign _887 = _581 & _886;
    always @(posedge _112) begin
        if (_110)
            _888 <= _902;
        else
            if (_887)
                _888 <= _42;
    end
    assign _879 = 3'b011;
    assign _880 = _584 == _879;
    assign _881 = _581 & _880;
    always @(posedge _112) begin
        if (_110)
            _882 <= _902;
        else
            if (_881)
                _882 <= _42;
    end
    assign _873 = 3'b010;
    assign _874 = _584 == _873;
    assign _875 = _581 & _874;
    always @(posedge _112) begin
        if (_110)
            _876 <= _902;
        else
            if (_875)
                _876 <= _42;
    end
    assign _867 = 3'b001;
    assign _868 = _584 == _867;
    assign _869 = _581 & _868;
    always @(posedge _112) begin
        if (_110)
            _870 <= _902;
        else
            if (_869)
                _870 <= _42;
    end
    assign _861 = 3'b000;
    assign _586 = _584 + _867;
    assign _587 = _581 ? _586 : _584;
    assign _32 = _587;
    always @(posedge _112) begin
        if (_110)
            _584 <= _861;
        else
            _584 <= _32;
    end
    assign _862 = _584 == _861;
    assign _863 = _581 & _862;
    assign _837 = _777 - _833;
    assign _595 = 29'b11111111111111111111111111111;
    assign _594 = 29'b00000000000000000000000000000;
    assign _597 = 29'b00000000000000000000000000001;
    assign _598 = _596 + _597;
    assign _591 = _590[2:0];
    assign _593 = _591 == _903;
    assign _599 = _593 ? _598 : _596;
    assign _33 = _599;
    always @(posedge _112) begin
        if (_110)
            _596 <= _595;
        else
            _596 <= _33;
    end
    assign _835 = _590[31:3];
    assign _618 = _605 + _867;
    assign _614 = _605 == _903;
    assign _615 = ~ _614;
    assign _612 = _164[0:0];
    assign _616 = _612 & _615;
    assign _619 = _616 ? _618 : _605;
    assign _609 = _164[0:0];
    assign _610 = ~ _609;
    assign _608 = _168[0:0];
    assign _611 = _608 & _610;
    assign _621 = _611 ? _867 : _619;
    assign _602 = _128 == _532;
    assign _607 = _602 ? _861 : _605;
    assign _601 = _128 == _531;
    assign _622 = _601 ? _621 : _607;
    assign _34 = _622;
    always @(posedge _112) begin
        if (_110)
            _605 <= _861;
        else
            _605 <= _34;
    end
    assign _823 = _472[0:0];
    assign _822 = _164[0:0];
    assign _824 = _822 & _823;
    assign _826 = _824 ? _605 : _861;
    assign _640 = _627 + _867;
    assign _636 = _627 == _903;
    assign _637 = ~ _636;
    assign _634 = _164[1:1];
    assign _638 = _634 & _637;
    assign _641 = _638 ? _640 : _627;
    assign _631 = _164[1:1];
    assign _632 = ~ _631;
    assign _630 = _168[1:1];
    assign _633 = _630 & _632;
    assign _643 = _633 ? _867 : _641;
    assign _624 = _128 == _532;
    assign _629 = _624 ? _861 : _627;
    assign _623 = _128 == _531;
    assign _644 = _623 ? _643 : _629;
    assign _35 = _644;
    always @(posedge _112) begin
        if (_110)
            _627 <= _861;
        else
            _627 <= _35;
    end
    assign _818 = _472[1:1];
    assign _817 = _164[1:1];
    assign _819 = _817 & _818;
    assign _821 = _819 ? _627 : _861;
    assign _827 = _821 < _826;
    assign _828 = _827 ? _826 : _821;
    assign _662 = _649 + _867;
    assign _658 = _649 == _903;
    assign _659 = ~ _658;
    assign _656 = _164[2:2];
    assign _660 = _656 & _659;
    assign _663 = _660 ? _662 : _649;
    assign _653 = _164[2:2];
    assign _654 = ~ _653;
    assign _652 = _168[2:2];
    assign _655 = _652 & _654;
    assign _665 = _655 ? _867 : _663;
    assign _646 = _128 == _532;
    assign _651 = _646 ? _861 : _649;
    assign _645 = _128 == _531;
    assign _666 = _645 ? _665 : _651;
    assign _36 = _666;
    always @(posedge _112) begin
        if (_110)
            _649 <= _861;
        else
            _649 <= _36;
    end
    assign _811 = _472[2:2];
    assign _810 = _164[2:2];
    assign _812 = _810 & _811;
    assign _814 = _812 ? _649 : _861;
    assign _684 = _671 + _867;
    assign _680 = _671 == _903;
    assign _681 = ~ _680;
    assign _678 = _164[3:3];
    assign _682 = _678 & _681;
    assign _685 = _682 ? _684 : _671;
    assign _675 = _164[3:3];
    assign _676 = ~ _675;
    assign _674 = _168[3:3];
    assign _677 = _674 & _676;
    assign _687 = _677 ? _867 : _685;
    assign _668 = _128 == _532;
    assign _673 = _668 ? _861 : _671;
    assign _667 = _128 == _531;
    assign _688 = _667 ? _687 : _673;
    assign _37 = _688;
    always @(posedge _112) begin
        if (_110)
            _671 <= _861;
        else
            _671 <= _37;
    end
    assign _806 = _472[3:3];
    assign _805 = _164[3:3];
    assign _807 = _805 & _806;
    assign _809 = _807 ? _671 : _861;
    assign _815 = _809 < _814;
    assign _816 = _815 ? _814 : _809;
    assign _829 = _816 < _828;
    assign _830 = _829 ? _828 : _816;
    assign _706 = _693 + _867;
    assign _702 = _693 == _903;
    assign _703 = ~ _702;
    assign _700 = _164[4:4];
    assign _704 = _700 & _703;
    assign _707 = _704 ? _706 : _693;
    assign _697 = _164[4:4];
    assign _698 = ~ _697;
    assign _696 = _168[4:4];
    assign _699 = _696 & _698;
    assign _709 = _699 ? _867 : _707;
    assign _690 = _128 == _532;
    assign _695 = _690 ? _861 : _693;
    assign _689 = _128 == _531;
    assign _710 = _689 ? _709 : _695;
    assign _38 = _710;
    always @(posedge _112) begin
        if (_110)
            _693 <= _861;
        else
            _693 <= _38;
    end
    assign _797 = _472[4:4];
    assign _796 = _164[4:4];
    assign _798 = _796 & _797;
    assign _800 = _798 ? _693 : _861;
    assign _728 = _715 + _867;
    assign _724 = _715 == _903;
    assign _725 = ~ _724;
    assign _722 = _164[5:5];
    assign _726 = _722 & _725;
    assign _729 = _726 ? _728 : _715;
    assign _719 = _164[5:5];
    assign _720 = ~ _719;
    assign _718 = _168[5:5];
    assign _721 = _718 & _720;
    assign _731 = _721 ? _867 : _729;
    assign _712 = _128 == _532;
    assign _717 = _712 ? _861 : _715;
    assign _711 = _128 == _531;
    assign _732 = _711 ? _731 : _717;
    assign _39 = _732;
    always @(posedge _112) begin
        if (_110)
            _715 <= _861;
        else
            _715 <= _39;
    end
    assign _792 = _472[5:5];
    assign _791 = _164[5:5];
    assign _793 = _791 & _792;
    assign _795 = _793 ? _715 : _861;
    assign _801 = _795 < _800;
    assign _802 = _801 ? _800 : _795;
    assign _750 = _737 + _867;
    assign _746 = _737 == _903;
    assign _747 = ~ _746;
    assign _744 = _164[6:6];
    assign _748 = _744 & _747;
    assign _751 = _748 ? _750 : _737;
    assign _741 = _164[6:6];
    assign _742 = ~ _741;
    assign _740 = _168[6:6];
    assign _743 = _740 & _742;
    assign _753 = _743 ? _867 : _751;
    assign _734 = _128 == _532;
    assign _739 = _734 ? _861 : _737;
    assign _733 = _128 == _531;
    assign _754 = _733 ? _753 : _739;
    assign _40 = _754;
    always @(posedge _112) begin
        if (_110)
            _737 <= _861;
        else
            _737 <= _40;
    end
    assign _785 = _472[6:6];
    assign _784 = _164[6:6];
    assign _786 = _784 & _785;
    assign _788 = _786 ? _737 : _861;
    assign _772 = _759 + _867;
    assign _768 = _759 == _903;
    assign _769 = ~ _768;
    assign _766 = _164[7:7];
    assign _770 = _766 & _769;
    assign _773 = _770 ? _772 : _759;
    assign _763 = _164[7:7];
    assign _764 = ~ _763;
    assign _762 = _168[7:7];
    assign _765 = _762 & _764;
    assign _775 = _765 ? _867 : _773;
    assign _756 = _128 == _532;
    assign _761 = _756 ? _861 : _759;
    assign _755 = _128 == _531;
    assign _776 = _755 ? _775 : _761;
    assign _41 = _776;
    always @(posedge _112) begin
        if (_110)
            _759 <= _861;
        else
            _759 <= _41;
    end
    assign _780 = _472[7:7];
    assign _779 = _164[7:7];
    assign _781 = _779 & _780;
    assign _783 = _781 ? _759 : _861;
    assign _789 = _783 < _788;
    assign _790 = _789 ? _788 : _783;
    assign _803 = _790 < _802;
    assign _804 = _803 ? _802 : _790;
    assign _831 = _804 < _830;
    assign _832 = _831 ? _830 : _804;
    assign _833 = _477 ? _832 : _861;
    assign _777 = _590[2:0];
    assign _834 = _777 < _833;
    assign _836 = _834 ? _596 : _835;
    assign _838 = { _836,
                    _837 };
    assign _840 = { _838,
                    _391,
                    _839,
                    _151 };
    assign _42 = _840;
    always @(posedge _112) begin
        if (_110)
            _864 <= _902;
        else
            if (_863)
                _864 <= _42;
    end
    assign _857 = _855 + _867;
    assign _496 = 4'b0000;
    assign _846 = 4'b0001;
    assign _847 = _44 + _846;
    assign _845 = _44 - _846;
    assign _848 = _581 ? _847 : _845;
    assign _413 = 4'b1000;
    assign _414 = _44 == _413;
    assign _580 = ~ _414;
    assign _43 = _478;
    assign _581 = _43 & _580;
    assign _843 = _581 ^ _842;
    assign _849 = _843 ? _848 : _44;
    always @(posedge _112) begin
        if (_110)
            _852 <= _496;
        else
            _852 <= _849;
    end
    assign _44 = _852;
    assign _497 = _44 == _496;
    assign _841 = ~ _497;
    assign _46 = host_vlog_pop;
    assign _842 = _46 & _841;
    assign _858 = _842 ? _857 : _855;
    assign _47 = _858;
    always @(posedge _112) begin
        if (_110)
            _855 <= _861;
        else
            _855 <= _47;
    end
    always @* begin
        case (_855)
        0:
            _907 <= _864;
        1:
            _907 <= _870;
        2:
            _907 <= _876;
        3:
            _907 <= _882;
        4:
            _907 <= _888;
        5:
            _907 <= _894;
        6:
            _907 <= _900;
        default:
            _907 <= _906;
        endcase
    end
    assign _969 = _912 == _903;
    assign _970 = _909 & _969;
    always @(posedge _112) begin
        if (_110)
            _971 <= _540;
        else
            if (_970)
                _971 <= _207;
    end
    assign _963 = _912 == _897;
    assign _964 = _909 & _963;
    always @(posedge _112) begin
        if (_110)
            _965 <= _540;
        else
            if (_964)
                _965 <= _207;
    end
    assign _957 = _912 == _891;
    assign _958 = _909 & _957;
    always @(posedge _112) begin
        if (_110)
            _959 <= _540;
        else
            if (_958)
                _959 <= _207;
    end
    assign _951 = _912 == _885;
    assign _952 = _909 & _951;
    always @(posedge _112) begin
        if (_110)
            _953 <= _540;
        else
            if (_952)
                _953 <= _207;
    end
    assign _945 = _912 == _879;
    assign _946 = _909 & _945;
    always @(posedge _112) begin
        if (_110)
            _947 <= _540;
        else
            if (_946)
                _947 <= _207;
    end
    assign _939 = _912 == _873;
    assign _940 = _909 & _939;
    always @(posedge _112) begin
        if (_110)
            _941 <= _540;
        else
            if (_940)
                _941 <= _207;
    end
    assign _933 = _912 == _867;
    assign _934 = _909 & _933;
    always @(posedge _112) begin
        if (_110)
            _935 <= _540;
        else
            if (_934)
                _935 <= _207;
    end
    assign _914 = _912 + _867;
    assign _915 = _909 ? _914 : _912;
    assign _50 = _915;
    always @(posedge _112) begin
        if (_110)
            _912 <= _861;
        else
            _912 <= _50;
    end
    assign _927 = _912 == _861;
    assign _928 = _909 & _927;
    always @(posedge _112) begin
        if (_110)
            _929 <= _540;
        else
            if (_928)
                _929 <= _207;
    end
    assign _922 = _920 + _867;
    assign _923 = _917 ? _922 : _920;
    assign _51 = _923;
    always @(posedge _112) begin
        if (_110)
            _920 <= _861;
        else
            _920 <= _51;
    end
    always @* begin
        case (_920)
        0:
            _972 <= _929;
        1:
            _972 <= _935;
        2:
            _972 <= _941;
        3:
            _972 <= _947;
        4:
            _972 <= _953;
        5:
            _972 <= _959;
        6:
            _972 <= _965;
        default:
            _972 <= _971;
        endcase
    end
    assign _975 = 32'b00000000000000000000000000000001;
    assign _976 = _590 + _975;
    assign _55 = _976;
    always @(posedge _112) begin
        if (_110)
            _590 <= _575;
        else
            _590 <= _55;
    end
    assign _978 = 2'b00;
    assign _839 = { _469,
                    _477 };
    always @(posedge _112) begin
        if (_110)
            _979 <= _978;
        else
            _979 <= _839;
    end
    always @(posedge _112) begin
        if (_110)
            _982 <= _407;
        else
            _982 <= _478;
    end
    always @(posedge _112) begin
        if (_110)
            _985 <= _978;
        else
            _985 <= _398;
    end
    always @(posedge _112) begin
        if (_110)
            _988 <= _407;
        else
            _988 <= _383;
    end
    assign _989 = _442[60:60];
    assign _990 = _130 & _989;
    assign _991 = ~ _565;
    assign _1060 = _68 & _1059;
    assign _1061 = ~ _1060;
    assign _1014 = _442[23:16];
    assign _1012 = _337[86:79];
    assign _1011 = _290[86:79];
    assign _1010 = _243[86:79];
    assign _1009 = _144[86:79];
    always @* begin
        case (_398)
        0:
            _1013 <= _1009;
        1:
            _1013 <= _1010;
        2:
            _1013 <= _1011;
        default:
            _1013 <= _1012;
        endcase
    end
    assign _1015 = _441 ? _1014 : _1013;
    assign _1016 = _1015 & _1006;
    assign _1007 = ~ _1006;
    assign _1008 = _999 & _1007;
    assign _1017 = _1008 | _1016;
    assign _1051 = _1017 | _1050;
    assign _1052 = _996 ? _1051 : _999;
    assign _1054 = _119 ? _540 : _1052;
    assign _1056 = _122 ? _540 : _1054;
    assign _65 = _1056;
    always @(posedge _112) begin
        if (_110)
            _999 <= _540;
        else
            _999 <= _65;
    end
    assign _1062 = _999 & _1061;
    assign _68 = host_open_drain;
    assign _1400 = ~ _68;
    assign _1392 = { _1390,
                     _1389 };
    assign _1389 = _203[0:0];
    assign _1390 = { _1389,
                     _1389 };
    assign _1391 = { _1390,
                     _1390 };
    assign _1393 = { _1391,
                     _1392 };
    assign _1394 = { _1393,
                     _1389 };
    assign _1395 = _1394 & _1050;
    assign _1048 = _1044 & _1042;
    assign _1047 = _1044 & _1040;
    assign _1046 = _1044 & _1037;
    assign _1044 = ~ _1031;
    assign _1045 = _1044 & _1034;
    assign _1042 = _1039 & _1036;
    assign _1043 = _1031 & _1042;
    assign _1039 = ~ _1032;
    assign _1040 = _1039 & _1033;
    assign _1041 = _1031 & _1040;
    assign _1036 = ~ _1033;
    assign _1037 = _1032 & _1036;
    assign _1038 = _1031 & _1037;
    assign _1033 = _1030[0:0];
    assign _1032 = _1030[1:1];
    assign _1034 = _1032 & _1033;
    assign _1029 = _337[90:88];
    assign _1028 = _290[90:88];
    assign _1027 = _243[90:88];
    assign _1026 = _144[90:88];
    always @* begin
        case (_398)
        0:
            _1030 <= _1026;
        1:
            _1030 <= _1027;
        2:
            _1030 <= _1028;
        default:
            _1030 <= _1029;
        endcase
    end
    assign _1031 = _1030[2:2];
    assign _1035 = _1031 & _1034;
    assign _1049 = { _1035,
                     _1038,
                     _1041,
                     _1043,
                     _1045,
                     _1046,
                     _1047,
                     _1048 };
    assign _1022 = _337[87:87];
    assign _1021 = _290[87:87];
    assign _1020 = _243[87:87];
    assign _1019 = _144[87:87];
    always @* begin
        case (_398)
        0:
            _1023 <= _1019;
        1:
            _1023 <= _1020;
        2:
            _1023 <= _1021;
        default:
            _1023 <= _1022;
        endcase
    end
    assign _1018 = ~ _441;
    assign _1024 = _1018 & _1023;
    assign _1050 = _1024 ? _1049 : _540;
    assign _1387 = ~ _1050;
    assign _1383 = _442[15:8];
    assign _1381 = _337[78:71];
    assign _1380 = _290[78:71];
    assign _1379 = _243[78:71];
    assign _1378 = _144[78:71];
    always @* begin
        case (_398)
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
    assign _1384 = _441 ? _1383 : _1382;
    assign _1385 = _1384 & _1006;
    assign _1005 = _442[7:0];
    assign _1003 = _337[70:63];
    assign _1002 = _290[70:63];
    assign _1001 = _243[70:63];
    assign _1000 = _144[70:63];
    always @* begin
        case (_398)
        0:
            _1004 <= _1000;
        1:
            _1004 <= _1001;
        2:
            _1004 <= _1002;
        default:
            _1004 <= _1003;
        endcase
    end
    assign _1006 = _441 ? _1005 : _1004;
    assign _1376 = ~ _1006;
    assign _1377 = _1059 & _1376;
    assign _1386 = _1377 | _1385;
    assign _1388 = _1386 & _1387;
    assign _1396 = _1388 | _1395;
    assign _994 = _227 == _978;
    assign _995 = _994 | _229;
    assign _440 = _438 == _885;
    assign _1370 = _441 ? _532 : _128;
    assign _1366 = _1101 ? _531 : _128;
    assign _482 = 2'b11;
    assign _1357 = _479 == _482;
    assign _1359 = _1357 ? _978 : _128;
    assign _1356 = _479 == _532;
    assign _1361 = _1356 ? _531 : _1359;
    assign _1355 = _479 == _978;
    assign _1363 = _1355 ? _978 : _1361;
    assign _1364 = _478 ? _1363 : _128;
    assign _377 = _356 == _360;
    assign _374 = _215[3:0];
    assign _376 = _374 == _496;
    assign _378 = _376 | _377;
    assign _373 = _356 == _360;
    assign _372 = _356 == _357;
    assign _371 = _337[104:103];
    always @* begin
        case (_371)
        0:
            _379 <= vdd;
        1:
            _379 <= _372;
        2:
            _379 <= _373;
        default:
            _379 <= _378;
        endcase
    end
    assign _370 = ~ _229;
    assign _380 = _370 | _379;
    assign _367 = _337[62:62];
    assign _365 = _337[61:58];
    always @* begin
        case (_365)
        0:
            _366 <= vdd;
        1:
            _366 <= _200;
        2:
            _366 <= _204;
        3:
            _366 <= _208;
        4:
            _366 <= _210;
        5:
            _366 <= _212;
        6:
            _366 <= _216;
        7:
            _366 <= _219;
        8:
            _366 <= gnd;
        9:
            _366 <= gnd;
        10:
            _366 <= gnd;
        11:
            _366 <= gnd;
        12:
            _366 <= gnd;
        13:
            _366 <= gnd;
        14:
            _366 <= gnd;
        default:
            _366 <= gnd;
        endcase
    end
    assign _368 = _366 ^ _367;
    assign _360 = _337[57:42];
    assign _361 = _360 < _356;
    assign _362 = ~ _361;
    assign _357 = _337[41:26];
    assign _355 = _337[25:24];
    always @* begin
        case (_355)
        0:
            _356 <= _179;
        1:
            _356 <= _182;
        2:
            _356 <= _185;
        default:
            _356 <= _185;
        endcase
    end
    assign _358 = _356 < _357;
    assign _359 = ~ _358;
    assign _363 = _359 & _362;
    assign _349 = _169 & _346;
    assign _351 = _349 == _540;
    assign _352 = ~ _351;
    assign _346 = _337[23:16];
    assign _348 = _346 == _540;
    assign _353 = _348 | _352;
    assign _341 = _337[7:0];
    assign _339 = _337[15:8];
    assign _340 = _151 ^ _339;
    assign _342 = _340 & _341;
    assign _344 = _342 == _540;
    assign _338 = _337[111:111];
    assign _345 = _338 & _344;
    assign _354 = _345 & _353;
    assign _364 = _354 & _363;
    assign _369 = _364 & _368;
    assign _381 = _369 & _380;
    assign _382 = _130 & _381;
    assign _237 = _186 == _190;
    assign _234 = _215[3:0];
    assign _236 = _234 == _496;
    assign _238 = _236 | _237;
    assign _233 = _186 == _190;
    assign _232 = _186 == _187;
    assign _231 = _144[104:103];
    always @* begin
        case (_231)
        0:
            _239 <= vdd;
        1:
            _239 <= _232;
        2:
            _239 <= _233;
        default:
            _239 <= _238;
        endcase
    end
    assign _230 = ~ _229;
    assign _240 = _230 | _239;
    assign _222 = _144[62:62];
    assign _195 = _144[61:58];
    always @* begin
        case (_195)
        0:
            _221 <= vdd;
        1:
            _221 <= _200;
        2:
            _221 <= _204;
        3:
            _221 <= _208;
        4:
            _221 <= _210;
        5:
            _221 <= _212;
        6:
            _221 <= _216;
        7:
            _221 <= _219;
        8:
            _221 <= gnd;
        9:
            _221 <= gnd;
        10:
            _221 <= gnd;
        11:
            _221 <= gnd;
        12:
            _221 <= gnd;
        13:
            _221 <= gnd;
        14:
            _221 <= gnd;
        default:
            _221 <= gnd;
        endcase
    end
    assign _223 = _221 ^ _222;
    assign _190 = _144[57:42];
    assign _191 = _190 < _186;
    assign _192 = ~ _191;
    assign _187 = _144[41:26];
    assign _176 = _144[25:24];
    always @* begin
        case (_176)
        0:
            _186 <= _179;
        1:
            _186 <= _182;
        2:
            _186 <= _185;
        default:
            _186 <= _185;
        endcase
    end
    assign _188 = _186 < _187;
    assign _189 = ~ _188;
    assign _193 = _189 & _192;
    assign _170 = _169 & _159;
    assign _172 = _170 == _540;
    assign _173 = ~ _172;
    assign _159 = _144[23:16];
    assign _161 = _159 == _540;
    assign _174 = _161 | _173;
    assign _154 = _144[7:0];
    assign _152 = _144[15:8];
    assign _153 = _151 ^ _152;
    assign _155 = _153 & _154;
    assign _157 = _155 == _540;
    assign _141 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _1065 = _438 == _867;
    assign _1066 = _1065 ? _78 : _142;
    assign _1063 = _128 == _531;
    assign _1067 = _1063 ? _1066 : _142;
    assign _69 = _1067;
    always @(posedge _112) begin
        if (_110)
            _142 <= _141;
        else
            _142 <= _69;
    end
    assign _1070 = _438 == _873;
    assign _1071 = _1070 ? _78 : _139;
    assign _1068 = _128 == _531;
    assign _1072 = _1068 ? _1071 : _139;
    assign _70 = _1072;
    always @(posedge _112) begin
        if (_110)
            _139 <= _141;
        else
            _139 <= _70;
    end
    assign _1075 = _438 == _879;
    assign _1076 = _1075 ? _78 : _136;
    assign _1073 = _128 == _531;
    assign _1077 = _1073 ? _1076 : _136;
    assign _71 = _1077;
    always @(posedge _112) begin
        if (_110)
            _136 <= _141;
        else
            _136 <= _71;
    end
    assign _565 = _128 == _978;
    assign _73 = host_rec_we;
    assign _1084 = _73 & _565;
    assign _75 = host_rec_wdata;
    always @(posedge _112) begin
        if (_1084)
            _1085[_1083] <= _75;
    end
    assign _1081 = _438[1:0];
    assign _1082 = { _391,
                     _1081 };
    assign _77 = host_rec_waddr;
    assign _1079 = _438 < _885;
    assign _1080 = _435 & _1079;
    assign _1083 = _1080 ? _1082 : _77;
    assign _1086 = _1085[_1083];
    always @(posedge _112) begin
        if (_1080)
            _1089 <= _1086;
    end
    assign _78 = _1089;
    assign _1340 = _438 + _867;
    assign _390 = 6'b000000;
    assign _80 = host_start_loc;
    assign _1102 = _1101 ? _1099 : _391;
    assign _82 = host_recover_loc;
    assign _1092 = _479 == _532;
    assign _1093 = _1092 ? _82 : _391;
    assign _1094 = _478 ? _1093 : _391;
    assign _1103 = _383 ? _1102 : _1094;
    assign _1090 = _128 == _532;
    assign _1104 = _1090 ? _1103 : _391;
    assign _1105 = _122 ? _80 : _1104;
    assign _83 = _1105;
    always @(posedge _112) begin
        if (_110)
            _391 <= _390;
        else
            _391 <= _83;
    end
    assign _1098 = _337[110:105];
    assign _1097 = _290[110:105];
    assign _1096 = _243[110:105];
    assign _1095 = _144[110:105];
    always @* begin
        case (_398)
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
    assign _1100 = _1099 == _391;
    assign _1101 = ~ _1100;
    assign _1336 = _1101 ? _861 : _438;
    assign _479 = _442[59:58];
    assign _1331 = _479 == _532;
    assign _1333 = _1331 ? _861 : _438;
    assign _472 = _442[57:50];
    assign _473 = _169 & _472;
    assign _475 = _473 == _540;
    assign _476 = ~ _475;
    assign _470 = ~ _383;
    assign _471 = _130 & _470;
    assign _477 = _471 & _476;
    assign _1110 = _469 ? _409 : _1108;
    assign _1111 = _383 ? _1108 : _1110;
    assign _1108 = _992 ? _407 : _467;
    assign _1106 = _128 == _532;
    assign _1112 = _1106 ? _1111 : _1108;
    assign _84 = _1112;
    always @(posedge _112) begin
        if (_110)
            _467 <= _407;
        else
            _467 <= _84;
    end
    assign _468 = ~ _467;
    assign _178 = 16'b0000000000000000;
    assign _1322 = 16'b0000000000000001;
    assign _1323 = _179 + _1322;
    assign _1319 = 16'b1111111111111111;
    assign _1320 = _179 == _1319;
    assign _1321 = ~ _1320;
    assign _1324 = _1321 ? _1323 : _179;
    assign _1284 = _442[26:24];
    assign _1282 = _337[93:91];
    assign _1281 = _290[93:91];
    assign _1280 = _243[93:91];
    assign _1279 = _144[93:91];
    assign _330 = _309 == _313;
    assign _327 = _215[3:0];
    assign _329 = _327 == _496;
    assign _331 = _329 | _330;
    assign _326 = _309 == _313;
    assign _325 = _309 == _310;
    assign _324 = _290[104:103];
    always @* begin
        case (_324)
        0:
            _332 <= vdd;
        1:
            _332 <= _325;
        2:
            _332 <= _326;
        default:
            _332 <= _331;
        endcase
    end
    assign _323 = ~ _229;
    assign _333 = _323 | _332;
    assign _320 = _290[62:62];
    assign _318 = _290[61:58];
    always @* begin
        case (_318)
        0:
            _319 <= vdd;
        1:
            _319 <= _200;
        2:
            _319 <= _204;
        3:
            _319 <= _208;
        4:
            _319 <= _210;
        5:
            _319 <= _212;
        6:
            _319 <= _216;
        7:
            _319 <= _219;
        8:
            _319 <= gnd;
        9:
            _319 <= gnd;
        10:
            _319 <= gnd;
        11:
            _319 <= gnd;
        12:
            _319 <= gnd;
        13:
            _319 <= gnd;
        14:
            _319 <= gnd;
        default:
            _319 <= gnd;
        endcase
    end
    assign _321 = _319 ^ _320;
    assign _313 = _290[57:42];
    assign _314 = _313 < _309;
    assign _315 = ~ _314;
    assign _310 = _290[41:26];
    assign _308 = _290[25:24];
    always @* begin
        case (_308)
        0:
            _309 <= _179;
        1:
            _309 <= _182;
        2:
            _309 <= _185;
        default:
            _309 <= _185;
        endcase
    end
    assign _311 = _309 < _310;
    assign _312 = ~ _311;
    assign _316 = _312 & _315;
    assign _302 = _169 & _299;
    assign _304 = _302 == _540;
    assign _305 = ~ _304;
    assign _299 = _290[23:16];
    assign _301 = _299 == _540;
    assign _306 = _301 | _305;
    assign _294 = _290[7:0];
    assign _292 = _290[15:8];
    assign _293 = _151 ^ _292;
    assign _295 = _293 & _294;
    assign _297 = _295 == _540;
    assign _291 = _290[111:111];
    assign _298 = _291 & _297;
    assign _307 = _298 & _306;
    assign _317 = _307 & _316;
    assign _322 = _317 & _321;
    assign _334 = _322 & _333;
    assign _335 = _130 & _334;
    assign _394 = _335 ? _532 : _482;
    assign _283 = _262 == _266;
    assign _280 = _215[3:0];
    assign _282 = _280 == _496;
    assign _284 = _282 | _283;
    assign _279 = _262 == _266;
    assign _278 = _262 == _263;
    assign _277 = _243[104:103];
    always @* begin
        case (_277)
        0:
            _285 <= vdd;
        1:
            _285 <= _278;
        2:
            _285 <= _279;
        default:
            _285 <= _284;
        endcase
    end
    assign _86 = host_role;
    assign _1113 = _122 ? _86 : _227;
    assign _87 = _1113;
    always @(posedge _112) begin
        if (_110)
            _227 <= _978;
        else
            _227 <= _87;
    end
    assign _229 = _227 == _532;
    assign _276 = ~ _229;
    assign _286 = _276 | _285;
    assign _273 = _243[62:62];
    assign gnd = 1'b0;
    assign _89 = host_match_addr;
    assign _218 = _89[6:0];
    assign _217 = _207[7:1];
    assign _219 = _217 == _218;
    assign _214 = 16'b1010110011100001;
    assign _1118 = _215[10:10];
    assign _1117 = _215[12:12];
    assign _1119 = _1117 ^ _1118;
    assign _1116 = _215[13:13];
    assign _1120 = _1116 ^ _1119;
    assign _1115 = _215[15:15];
    assign _1121 = _1115 ^ _1120;
    assign _1114 = _215[14:0];
    assign _1122 = { _1114,
                     _1121 };
    assign _90 = _1122;
    always @(posedge _112) begin
        if (_110)
            _215 <= _214;
        else
            _215 <= _90;
    end
    assign _216 = _215[0:0];
    assign _1137 = _94 + _846;
    assign _1135 = _94 - _846;
    assign _1138 = _909 ? _1137 : _1135;
    assign _494 = _94 == _496;
    assign _916 = ~ _494;
    assign _92 = host_rx_pop;
    assign _917 = _92 & _916;
    assign _908 = ~ _212;
    assign _1131 = _1129 == _482;
    assign _1132 = _992 & _1131;
    assign _93 = _1132;
    assign _909 = _93 & _908;
    assign _1133 = _909 ^ _917;
    assign _1139 = _1133 ? _1138 : _94;
    always @(posedge _112) begin
        if (_110)
            _1142 <= _496;
        else
            _1142 <= _1139;
    end
    assign _94 = _1142;
    assign _212 = _94 == _413;
    assign _1159 = _207[6:0];
    assign _1160 = { _1159,
                     _1156 };
    assign _1157 = _207[7:1];
    assign _1155 = _151[7:7];
    assign _1154 = _151[6:6];
    assign _1153 = _151[5:5];
    assign _1152 = _151[4:4];
    assign _1151 = _151[3:3];
    assign _1150 = _151[2:2];
    assign _1149 = _151[1:1];
    assign _1148 = _151[0:0];
    assign _1146 = _337[102:100];
    assign _1145 = _290[102:100];
    assign _1144 = _243[102:100];
    assign _1143 = _144[102:100];
    always @* begin
        case (_398)
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
    assign _1126 = _337[97:96];
    assign _1125 = _290[97:96];
    assign _1124 = _243[97:96];
    assign _1123 = _144[97:96];
    always @* begin
        case (_398)
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
    assign _1129 = _441 ? _978 : _1127;
    always @* begin
        case (_1129)
        0:
            _1161 <= _207;
        1:
            _1161 <= _1158;
        2:
            _1161 <= _1160;
        default:
            _1161 <= _207;
        endcase
    end
    assign _1162 = _992 ? _1161 : _207;
    assign _95 = _1162;
    always @(posedge _112) begin
        if (_110)
            _207 <= _540;
        else
            _207 <= _95;
    end
    assign _208 = _207[0:0];
    assign _1262 = _203[7:1];
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
    assign _1247 = _1167 == _903;
    assign _1248 = _1164 & _1247;
    always @(posedge _112) begin
        if (_110)
            _1249 <= _540;
        else
            if (_1248)
                _1249 <= _98;
    end
    assign _1241 = _1167 == _897;
    assign _1242 = _1164 & _1241;
    always @(posedge _112) begin
        if (_110)
            _1243 <= _540;
        else
            if (_1242)
                _1243 <= _98;
    end
    assign _1235 = _1167 == _891;
    assign _1236 = _1164 & _1235;
    always @(posedge _112) begin
        if (_110)
            _1237 <= _540;
        else
            if (_1236)
                _1237 <= _98;
    end
    assign _1229 = _1167 == _885;
    assign _1230 = _1164 & _1229;
    always @(posedge _112) begin
        if (_110)
            _1231 <= _540;
        else
            if (_1230)
                _1231 <= _98;
    end
    assign _1223 = _1167 == _879;
    assign _1224 = _1164 & _1223;
    always @(posedge _112) begin
        if (_110)
            _1225 <= _540;
        else
            if (_1224)
                _1225 <= _98;
    end
    assign _1217 = _1167 == _873;
    assign _1218 = _1164 & _1217;
    always @(posedge _112) begin
        if (_110)
            _1219 <= _540;
        else
            if (_1218)
                _1219 <= _98;
    end
    assign _1211 = _1167 == _867;
    assign _1212 = _1164 & _1211;
    always @(posedge _112) begin
        if (_110)
            _1213 <= _540;
        else
            if (_1212)
                _1213 <= _98;
    end
    assign _1169 = _1167 + _867;
    assign _1170 = _1164 ? _1169 : _1167;
    assign _96 = _1170;
    always @(posedge _112) begin
        if (_110)
            _1167 <= _861;
        else
            _1167 <= _96;
    end
    assign _1205 = _1167 == _861;
    assign _1206 = _1164 & _1205;
    assign _98 = host_tx_data;
    always @(posedge _112) begin
        if (_110)
            _1207 <= _540;
        else
            if (_1206)
                _1207 <= _98;
    end
    assign _1177 = _1175 + _867;
    assign _1178 = _1172 ? _1177 : _1175;
    assign _99 = _1178;
    always @(posedge _112) begin
        if (_110)
            _1175 <= _861;
        else
            _1175 <= _99;
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
    assign _1196 = _103 + _846;
    assign _1194 = _103 - _846;
    assign _1197 = _1164 ? _1196 : _1194;
    assign _1171 = ~ _210;
    assign _1189 = _1185 == _532;
    assign _1187 = _1185 == _531;
    assign _1190 = _1187 | _1189;
    assign _1191 = _992 & _1190;
    assign _100 = _1191;
    assign _1172 = _100 & _1171;
    assign _974 = _103 == _413;
    assign _1163 = ~ _974;
    assign _102 = host_tx_push;
    assign _1164 = _102 & _1163;
    assign _1192 = _1164 ^ _1172;
    assign _1198 = _1192 ? _1197 : _103;
    always @(posedge _112) begin
        if (_110)
            _1201 <= _496;
        else
            _1201 <= _1198;
    end
    assign _103 = _1201;
    assign _210 = _103 == _496;
    assign _1252 = _210 ? _538 : _1250;
    assign _1184 = _442[28:27];
    assign _1182 = _337[95:94];
    assign _1181 = _290[95:94];
    assign _1180 = _243[95:94];
    assign _1179 = _144[95:94];
    always @* begin
        case (_398)
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
    assign _1185 = _441 ? _1184 : _1183;
    always @* begin
        case (_1185)
        0:
            _1264 <= _203;
        1:
            _1264 <= _1252;
        2:
            _1264 <= _1261;
        default:
            _1264 <= _1263;
        endcase
    end
    assign _1265 = _992 ? _1264 : _203;
    assign _104 = _1265;
    always @(posedge _112) begin
        if (_110)
            _203 <= _540;
        else
            _203 <= _104;
    end
    assign _204 = _203[0:0];
    assign _1276 = 8'b00001000;
    assign _1275 = 8'b00000111;
    assign _1273 = 8'b00000001;
    assign _1274 = _198 - _1273;
    assign _1271 = _442[30:29];
    assign _337 = _143[511:400];
    assign _1269 = _337[99:98];
    assign _290 = _143[399:288];
    assign _1268 = _290[99:98];
    assign _1267 = _243[99:98];
    assign _1266 = _144[99:98];
    always @* begin
        case (_398)
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
    assign _1272 = _441 ? _1271 : _1270;
    always @* begin
        case (_1272)
        0:
            _1277 <= _198;
        1:
            _1277 <= _1274;
        2:
            _1277 <= _1275;
        default:
            _1277 <= _1276;
        endcase
    end
    assign _1278 = _992 ? _1277 : _198;
    assign _105 = _1278;
    always @(posedge _112) begin
        if (_110)
            _198 <= _540;
        else
            _198 <= _105;
    end
    assign _200 = _198 == _540;
    assign _271 = _243[61:58];
    always @* begin
        case (_271)
        0:
            _272 <= vdd;
        1:
            _272 <= _200;
        2:
            _272 <= _204;
        3:
            _272 <= _208;
        4:
            _272 <= _210;
        5:
            _272 <= _212;
        6:
            _272 <= _216;
        7:
            _272 <= _219;
        8:
            _272 <= gnd;
        9:
            _272 <= gnd;
        10:
            _272 <= gnd;
        11:
            _272 <= gnd;
        12:
            _272 <= gnd;
        13:
            _272 <= gnd;
        14:
            _272 <= gnd;
        default:
            _272 <= gnd;
        endcase
    end
    assign _274 = _272 ^ _273;
    assign _266 = _243[57:42];
    assign _267 = _266 < _262;
    assign _268 = ~ _267;
    assign _263 = _243[41:26];
    assign _1292 = _185 + _1322;
    assign _1289 = _185 == _1319;
    assign _1290 = ~ _1289;
    assign _1293 = _1290 ? _1292 : _185;
    assign _1286 = _1285[2:2];
    assign _1287 = _992 & _1286;
    assign _1295 = _1287 ? _178 : _1293;
    assign _1297 = _122 ? _178 : _1295;
    assign _106 = _1297;
    always @(posedge _112) begin
        if (_110)
            _185 <= _178;
        else
            _185 <= _106;
    end
    assign _1304 = _182 + _1322;
    assign _1301 = _182 == _1319;
    assign _1302 = ~ _1301;
    assign _1305 = _1302 ? _1304 : _182;
    assign _1298 = _1285[1:1];
    assign _1299 = _992 & _1298;
    assign _1307 = _1299 ? _178 : _1305;
    assign _1309 = _122 ? _178 : _1307;
    assign _107 = _1309;
    always @(posedge _112) begin
        if (_110)
            _182 <= _178;
        else
            _182 <= _107;
    end
    assign _261 = _243[25:24];
    always @* begin
        case (_261)
        0:
            _262 <= _179;
        1:
            _262 <= _182;
        2:
            _262 <= _185;
        default:
            _262 <= _185;
        endcase
    end
    assign _264 = _262 < _263;
    assign _265 = ~ _264;
    assign _269 = _265 & _268;
    always @(posedge _112) begin
        if (_110)
            _167 <= _540;
        else
            _167 <= _151;
    end
    assign _168 = _151 ^ _167;
    assign _1311 = _128 == _532;
    assign _1313 = _1311 ? _540 : _164;
    assign _1310 = _128 == _531;
    assign _1314 = _1310 ? _169 : _1313;
    assign _1316 = _122 ? _540 : _1314;
    assign _108 = _1316;
    always @(posedge _112) begin
        if (_110)
            _164 <= _540;
        else
            _164 <= _108;
    end
    assign _169 = _164 | _168;
    assign _255 = _169 & _252;
    assign _257 = _255 == _540;
    assign _258 = ~ _257;
    assign _252 = _243[23:16];
    assign _254 = _252 == _540;
    assign _259 = _254 | _258;
    assign _247 = _243[7:0];
    assign _245 = _243[15:8];
    assign vdd = 1'b1;
    assign _110 = clear;
    assign _112 = clock;
    assign _114 = pins_in;
    always @(posedge _112) begin
        if (_110)
            _148 <= _540;
        else
            _148 <= _114;
    end
    always @(posedge _112) begin
        if (_110)
            _151 <= _540;
        else
            _151 <= _148;
    end
    assign _246 = _151 ^ _245;
    assign _248 = _246 & _247;
    assign _250 = _248 == _540;
    assign _243 = _143[287:176];
    assign _244 = _243[111:111];
    assign _251 = _244 & _250;
    assign _260 = _251 & _259;
    assign _270 = _260 & _269;
    assign _275 = _270 & _274;
    assign _287 = _275 & _286;
    assign _288 = _130 & _287;
    assign _396 = _288 ? _531 : _394;
    assign _398 = _242 ? _978 : _396;
    always @* begin
        case (_398)
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
    assign _1285 = _441 ? _1284 : _1283;
    assign _1317 = _1285[0:0];
    assign _1318 = _992 & _1317;
    assign _1326 = _1318 ? _178 : _1324;
    assign _1328 = _122 ? _178 : _1326;
    assign _115 = _1328;
    always @(posedge _112) begin
        if (_110)
            _179 <= _178;
        else
            _179 <= _115;
    end
    assign _461 = _442[33:32];
    always @* begin
        case (_461)
        0:
            _462 <= _179;
        1:
            _462 <= _182;
        2:
            _462 <= _185;
        default:
            _462 <= _185;
        endcase
    end
    assign _460 = _442[49:34];
    assign _463 = _460 < _462;
    assign _442 = _143[63:0];
    assign _458 = _442[31:31];
    assign _456 = ~ _383;
    assign _457 = _130 & _456;
    assign _459 = _457 & _458;
    assign _464 = _459 & _463;
    assign _469 = _464 & _468;
    assign _478 = _469 | _477;
    assign _1334 = _478 ? _1333 : _438;
    assign _1337 = _383 ? _1336 : _1334;
    assign _1330 = _128 == _532;
    assign _1338 = _1330 ? _1337 : _438;
    assign _1329 = _128 == _531;
    assign _1341 = _1329 ? _1340 : _1338;
    assign _1343 = _122 ? _861 : _1341;
    assign _116 = _1343;
    always @(posedge _112) begin
        if (_110)
            _438 <= _861;
        else
            _438 <= _116;
    end
    assign _1346 = _438 == _885;
    assign _1347 = _1346 ? _78 : _133;
    assign _1344 = _128 == _531;
    assign _1348 = _1344 ? _1347 : _133;
    assign _117 = _1348;
    always @(posedge _112) begin
        if (_110)
            _133 <= _141;
        else
            _133 <= _117;
    end
    assign _143 = { _133,
                    _136,
                    _139,
                    _142 };
    assign _144 = _143[175:64];
    assign _145 = _144[111:111];
    assign _158 = _145 & _157;
    assign _175 = _158 & _174;
    assign _194 = _175 & _193;
    assign _224 = _194 & _223;
    assign _241 = _224 & _240;
    assign _130 = _128 == _532;
    assign _242 = _130 & _241;
    assign _289 = _242 | _288;
    assign _336 = _289 | _335;
    assign _383 = _336 | _382;
    assign _1367 = _383 ? _1366 : _1364;
    assign _1352 = _128 == _482;
    assign _1354 = _1352 ? _978 : _128;
    assign _1350 = _128 == _532;
    assign _1368 = _1350 ? _1367 : _1354;
    assign _1349 = _128 == _531;
    assign _1371 = _1349 ? _1370 : _1368;
    assign _119 = host_stop;
    assign _1373 = _119 ? _978 : _1371;
    assign _1375 = _122 ? _531 : _1373;
    assign _120 = _1375;
    always @(posedge _112) begin
        if (_110)
            _128 <= _978;
        else
            _128 <= _120;
    end
    assign _435 = _128 == _531;
    assign _441 = _435 & _440;
    assign _992 = _441 | _383;
    assign _996 = _992 & _995;
    assign _1397 = _996 ? _1396 : _1059;
    assign _122 = host_start;
    assign _1399 = _122 ? _540 : _1397;
    assign _123 = _1399;
    always @(posedge _112) begin
        if (_110)
            _1059 <= _540;
        else
            _1059 <= _123;
    end
    assign _1401 = _1059 & _1400;
    assign pins_out = _1401;
    assign pins_oe = _1062;
    assign st_running = _991;
    assign st_in_entry = _435;
    assign st_cur_loc = _391;
    assign st_accepting = _990;
    assign st_taken = _988;
    assign st_taken_edge = _985;
    assign st_viol = _982;
    assign st_viol_kind = _979;
    assign st_timestamp = _590;
    assign st_tx_full = _974;
    assign st_tx_empty = _210;
    assign st_rx_data = _972;
    assign st_rx_empty = _494;
    assign st_vlog_data = _907;
    assign st_vlog_empty = _497;
    assign st_cov_rdata = _29;
    assign st_irq = _501;
    assign st_halted_viol = _433;
    assign st_rx_overflow = _426;
    assign st_vlog_overflow = _418;
    assign st_cov_overrun = _408;

endmodule
