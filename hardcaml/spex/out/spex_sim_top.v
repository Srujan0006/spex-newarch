module spex_sim_top (
    host_irq_ack,
    host_cov_we,
    host_cov_wdata,
    host_cov_addr,
    host_cover_en,
    host_vlog_pop,
    host_open_drain,
    host_role,
    host_match_addr,
    host_rx_pop,
    host_tx_data,
    host_tx_push,
    host_rec_we,
    host_rec_wdata,
    host_start_loc,
    host_recover_loc,
    host_rec_waddr,
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
    input [1:0] host_role;
    input [7:0] host_match_addr;
    input host_rx_pop;
    input [7:0] host_tx_data;
    input host_tx_push;
    input host_rec_we;
    input [127:0] host_rec_wdata;
    input [5:0] host_start_loc;
    input [5:0] host_recover_loc;
    input [7:0] host_rec_waddr;
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

    wire _935;
    wire _937;
    wire _931;
    wire _932;
    wire _916;
    wire _933;
    wire _938;
    wire _940;
    wire _1;
    reg _936;
    wire _943;
    wire _948;
    wire _950;
    wire _3;
    reg _946;
    wire _951;
    wire _956;
    wire _958;
    wire _5;
    reg _954;
    wire _966;
    wire _967;
    wire _972;
    wire _9;
    wire _974;
    wire _976;
    wire _10;
    reg _970;
    wire _1006;
    wire _1008;
    wire _1004;
    wire _1010;
    wire _1011;
    wire _1012;
    wire _978;
    wire _1013;
    wire _1015;
    wire _11;
    reg _961;
    wire _1021;
    wire _1018;
    wire _1022;
    wire _1023;
    wire _1024;
    wire _1129;
    wire _1128;
    wire _1130;
    wire [31:0] _1127;
    wire _1121;
    wire _1119;
    wire _14;
    wire _1118;
    wire _1120;
    wire _1122;
    wire _1123;
    wire [11:0] _1110;
    wire _1107;
    wire _1108;
    wire [11:0] _1109;
    wire _1111;
    wire [11:0] _1112;
    wire [11:0] _1113;
    wire [11:0] _1099;
    wire [11:0] _1057;
    wire [11:0] _1054;
    wire [12:0] _1051;
    wire [9:0] _1048;
    wire [12:0] _1049;
    wire [12:0] _1050;
    wire [2:0] _1044;
    reg [2:0] _1025;
    wire [2:0] _15;
    reg [2:0] _1045;
    wire [12:0] _1046;
    wire [12:0] _1031;
    wire [12:0] _1030;
    wire [15:0] _1026;
    wire _1029;
    wire [12:0] _1032;
    wire [12:0] _16;
    reg [12:0] _1041;
    wire _1047;
    wire [12:0] _1052;
    wire [12:0] _1038;
    wire _1053;
    wire [11:0] _1056;
    wire [15:0] _1033;
    wire _1034;
    wire _17;
    reg _1037;
    wire [11:0] _1058;
    wire [11:0] _18;
    reg [11:0] _1100;
    wire [11:0] _1061;
    reg [1:0] _1027;
    reg [15:0] _1028;
    wire [15:0] _1059;
    wire _1060;
    wire [11:0] _1063;
    wire [11:0] _19;
    reg [11:0] _1097;
    wire _1101;
    wire _1102;
    wire [11:0] _1103;
    wire [11:0] _1094;
    wire _1104;
    wire [11:0] _1105;
    wire [7:0] _1092;
    wire _1093;
    wire [11:0] _1106;
    wire [7:0] _1090;
    wire [7:0] _1089;
    wire [1:0] _1084;
    wire [1:0] _1083;
    wire _1065;
    wire _1064;
    wire _1066;
    wire _20;
    reg _1082;
    wire [1:0] _1085;
    wire [6:0] _1079;
    wire [8:0] _1086;
    wire [7:0] _1077;
    wire [8:0] _1078;
    wire [8:0] _1087;
    wire _1088;
    wire [7:0] _1091;
    wire [31:0] _1114;
    wire [31:0] _22;
    wire [31:0] _1115;
    reg [31:0] _1124[0:255];
    wire [7:0] _23;
    reg [7:0] _1075;
    wire [7:0] _927;
    wire [7:0] _24;
    reg [7:0] _930;
    wire [7:0] _26;
    wire [7:0] _1072;
    wire _1067;
    wire _28;
    wire _912;
    wire _1068;
    wire _29;
    reg _915;
    wire _30;
    reg _1071;
    wire [7:0] _1076;
    wire [31:0] _1125;
    reg [31:0] _1131;
    wire [31:0] _31;
    wire [2:0] _1278;
    wire _1279;
    wire _1280;
    wire [47:0] _1277;
    reg [47:0] _1281;
    wire [2:0] _1272;
    wire _1273;
    wire _1274;
    reg [47:0] _1275;
    wire [2:0] _1266;
    wire _1267;
    wire _1268;
    reg [47:0] _1269;
    wire [2:0] _1260;
    wire _1261;
    wire _1262;
    reg [47:0] _1263;
    wire [2:0] _1254;
    wire _1255;
    wire _1256;
    reg [47:0] _1257;
    wire [2:0] _1248;
    wire _1249;
    wire _1250;
    reg [47:0] _1251;
    wire [2:0] _1242;
    wire _1243;
    wire _1244;
    reg [47:0] _1245;
    wire [2:0] _1138;
    wire [2:0] _1139;
    wire [2:0] _34;
    reg [2:0] _1136;
    wire _1237;
    wire _1238;
    wire [2:0] _1212;
    wire [28:0] _1147;
    wire [28:0] _1146;
    wire [28:0] _1149;
    wire [28:0] _1150;
    wire [2:0] _1143;
    wire _1145;
    wire [28:0] _1151;
    wire [28:0] _35;
    reg [28:0] _1148;
    wire [28:0] _1210;
    wire _1198;
    wire _1197;
    wire _1199;
    wire [2:0] _1201;
    wire _1193;
    wire _1192;
    wire _1194;
    wire [2:0] _1196;
    wire _1202;
    wire [2:0] _1203;
    wire _1186;
    wire _1185;
    wire _1187;
    wire [2:0] _1189;
    wire _1181;
    wire _1180;
    wire _1182;
    wire [2:0] _1184;
    wire _1190;
    wire [2:0] _1191;
    wire _1204;
    wire [2:0] _1205;
    wire _1172;
    wire _1171;
    wire _1173;
    wire [2:0] _1175;
    wire _1167;
    wire _1166;
    wire _1168;
    wire [2:0] _1170;
    wire _1176;
    wire [2:0] _1177;
    wire _1160;
    wire _1159;
    wire _1161;
    wire [2:0] _1163;
    wire _1155;
    wire _1154;
    wire _1156;
    wire [2:0] _1158;
    wire _1164;
    wire [2:0] _1165;
    wire _1178;
    wire [2:0] _1179;
    wire _1206;
    wire [2:0] _1207;
    wire [2:0] _1208;
    wire [2:0] _1152;
    wire _1209;
    wire [28:0] _1211;
    wire [31:0] _1213;
    wire [47:0] _1215;
    wire [47:0] _36;
    reg [47:0] _1239;
    wire [2:0] _1232;
    wire [3:0] _1019;
    wire [3:0] _1221;
    wire [3:0] _1222;
    wire [3:0] _1220;
    wire [3:0] _1223;
    wire [3:0] _941;
    wire _942;
    wire _1132;
    wire _37;
    wire _1133;
    wire _1218;
    wire [3:0] _1224;
    reg [3:0] _1227;
    wire [3:0] _38;
    wire _1020;
    wire _1216;
    wire _40;
    wire _1217;
    wire [2:0] _1233;
    wire [2:0] _41;
    reg [2:0] _1230;
    reg [47:0] _1282;
    wire _1344;
    wire _1345;
    reg [7:0] _1346;
    wire _1338;
    wire _1339;
    reg [7:0] _1340;
    wire _1332;
    wire _1333;
    reg [7:0] _1334;
    wire _1326;
    wire _1327;
    reg [7:0] _1328;
    wire _1320;
    wire _1321;
    reg [7:0] _1322;
    wire _1314;
    wire _1315;
    reg [7:0] _1316;
    wire _1308;
    wire _1309;
    reg [7:0] _1310;
    wire [2:0] _1289;
    wire [2:0] _1290;
    wire [2:0] _44;
    reg [2:0] _1287;
    wire _1302;
    wire _1303;
    reg [7:0] _1304;
    wire [2:0] _1297;
    wire [2:0] _1298;
    wire [2:0] _45;
    reg [2:0] _1295;
    reg [7:0] _1347;
    wire [31:0] _1350;
    wire [31:0] _1351;
    wire [31:0] _49;
    reg [31:0] _1142;
    wire [1:0] _1353;
    wire [1:0] _1214;
    reg [1:0] _1354;
    reg _1357;
    reg [1:0] _1360;
    reg _1363;
    wire _1364;
    wire _1365;
    wire _1366;
    wire [7:0] _1435;
    wire [7:0] _1436;
    wire [7:0] _1389;
    wire [7:0] _1387;
    wire [7:0] _1386;
    wire [7:0] _1385;
    wire [7:0] _1384;
    reg [7:0] _1388;
    wire [7:0] _1390;
    wire [7:0] _1391;
    wire [7:0] _1382;
    wire [7:0] _1383;
    wire [7:0] _1392;
    wire [7:0] _1426;
    wire [7:0] _1427;
    wire [7:0] _1429;
    wire [7:0] _1431;
    wire [7:0] _59;
    reg [7:0] _1374;
    wire [7:0] _1437;
    wire [7:0] _62;
    wire [7:0] _1928;
    wire [2:0] _1920;
    wire _1917;
    wire [1:0] _1918;
    wire [3:0] _1919;
    wire [6:0] _1921;
    wire [7:0] _1922;
    wire [7:0] _1923;
    wire _1423;
    wire _1422;
    wire _1421;
    wire _1419;
    wire _1420;
    wire _1417;
    wire _1418;
    wire _1414;
    wire _1415;
    wire _1416;
    wire _1411;
    wire _1412;
    wire _1413;
    wire _1408;
    wire _1407;
    wire _1409;
    wire [2:0] _1404;
    wire [2:0] _1403;
    wire [2:0] _1402;
    wire [2:0] _1401;
    reg [2:0] _1405;
    wire _1406;
    wire _1410;
    wire [7:0] _1424;
    wire _1397;
    wire _1396;
    wire _1395;
    wire _1394;
    reg _1398;
    wire _1393;
    wire _1399;
    wire [7:0] _1425;
    wire [7:0] _1915;
    wire [7:0] _1911;
    wire [7:0] _1909;
    wire [7:0] _1908;
    wire [7:0] _1907;
    wire [7:0] _1906;
    reg [7:0] _1910;
    wire [7:0] _1912;
    wire [7:0] _1913;
    wire [7:0] _1380;
    wire [7:0] _1378;
    wire [7:0] _1377;
    wire [7:0] _1376;
    wire [7:0] _1375;
    reg [7:0] _1379;
    wire [7:0] _1381;
    wire [7:0] _1904;
    wire [7:0] _1905;
    wire [7:0] _1914;
    wire [7:0] _1916;
    wire [7:0] _1924;
    wire _1369;
    wire _1370;
    wire _963;
    wire [1:0] _1898;
    wire [1:0] _1894;
    wire [1:0] _1005;
    wire _1885;
    wire [1:0] _1887;
    wire _1884;
    wire [1:0] _1889;
    wire _1883;
    wire [1:0] _1891;
    wire [1:0] _1892;
    wire _904;
    wire [15:0] _899;
    wire _900;
    wire _901;
    wire _898;
    wire _902;
    wire _905;
    wire [3:0] _895;
    wire _897;
    wire _906;
    wire _893;
    wire _889;
    wire _890;
    wire _887;
    wire _891;
    wire _894;
    wire _885;
    reg [2:0] _879;
    wire [15:0] _880;
    wire _881;
    wire _875;
    wire _882;
    wire _873;
    wire _883;
    wire _886;
    wire [1:0] _872;
    reg _907;
    wire _871;
    wire _908;
    wire _868;
    wire [3:0] _866;
    reg _867;
    wire _869;
    wire [15:0] _861;
    wire _863;
    wire [16:0] _856;
    wire [15:0] _852;
    wire [16:0] _853;
    wire [16:0] _854;
    reg [16:0] _857;
    wire _858;
    wire _859;
    wire [15:0] _848;
    wire _850;
    wire _832;
    wire [2:0] _834;
    wire _829;
    wire [2:0] _831;
    wire _835;
    wire [2:0] _836;
    wire _824;
    wire [2:0] _826;
    wire _821;
    wire [2:0] _823;
    wire _827;
    wire [2:0] _828;
    wire _837;
    wire [2:0] _838;
    wire _814;
    wire [2:0] _816;
    wire _811;
    wire [2:0] _813;
    wire _817;
    wire [2:0] _818;
    wire _806;
    wire [2:0] _808;
    wire [7:0] _802;
    wire _803;
    wire [2:0] _805;
    wire _809;
    wire [2:0] _810;
    wire _819;
    wire [2:0] _820;
    wire _839;
    wire [2:0] _840;
    wire [13:0] _801;
    wire [16:0] _841;
    wire [111:0] _798;
    wire [15:0] _799;
    wire [16:0] _800;
    wire [16:0] _842;
    reg [16:0] _845;
    wire [16:0] _797;
    wire _846;
    wire _847;
    wire _851;
    wire _860;
    wire [1:0] _793;
    reg [15:0] _794;
    wire _796;
    wire _864;
    wire [7:0] _787;
    wire _789;
    wire _790;
    wire [7:0] _784;
    wire _786;
    wire _791;
    wire [7:0] _779;
    wire [7:0] _777;
    wire [7:0] _778;
    wire [7:0] _780;
    wire _782;
    wire _776;
    wire _783;
    wire _792;
    wire _865;
    wire _870;
    wire _909;
    wire _910;
    wire _494;
    wire _490;
    wire _491;
    wire _488;
    wire _492;
    wire _495;
    wire [3:0] _485;
    wire _487;
    wire _496;
    wire _483;
    wire _479;
    wire _480;
    wire _477;
    wire _481;
    wire _484;
    wire _475;
    reg [2:0] _469;
    wire [15:0] _470;
    wire _471;
    wire _465;
    wire _472;
    wire _463;
    wire _473;
    wire _476;
    wire [1:0] _462;
    reg _497;
    wire _461;
    wire _498;
    wire _453;
    wire [3:0] _427;
    reg _452;
    wire _454;
    wire [15:0] _422;
    wire _424;
    wire [15:0] _413;
    wire [16:0] _414;
    wire [16:0] _415;
    reg [16:0] _418;
    wire _419;
    wire _420;
    wire [15:0] _409;
    wire _411;
    wire _375;
    wire [2:0] _395;
    wire _354;
    wire [2:0] _374;
    wire _396;
    wire [2:0] _397;
    wire _331;
    wire [2:0] _351;
    wire _310;
    wire [2:0] _330;
    wire _352;
    wire [2:0] _353;
    wire _398;
    wire [2:0] _399;
    wire _285;
    wire [2:0] _305;
    wire _264;
    wire [2:0] _284;
    wire _306;
    wire [2:0] _307;
    wire _241;
    wire [2:0] _261;
    wire [7:0] _219;
    wire _220;
    wire [2:0] _240;
    wire _262;
    wire [2:0] _263;
    wire _308;
    wire [2:0] _309;
    wire _400;
    wire [2:0] _401;
    wire [16:0] _402;
    wire [111:0] _215;
    wire [15:0] _216;
    wire [16:0] _217;
    wire [16:0] _403;
    reg [16:0] _406;
    wire [16:0] _192;
    wire _407;
    wire _408;
    wire _412;
    wire _421;
    wire [1:0] _178;
    reg [15:0] _188;
    wire _190;
    wire _425;
    wire [7:0] _172;
    wire _174;
    wire _175;
    wire [7:0] _161;
    wire _163;
    wire _176;
    wire [7:0] _156;
    wire [7:0] _154;
    wire [7:0] _155;
    wire [7:0] _157;
    wire _159;
    wire [127:0] _134;
    wire [2:0] _1868;
    wire [2:0] _1864;
    wire _1859;
    wire [2:0] _1861;
    wire [7:0] _995;
    wire [7:0] _996;
    wire _998;
    wire _999;
    wire _993;
    wire _994;
    wire _1000;
    wire _1442;
    wire _1443;
    wire _1440;
    wire _1438;
    wire _1444;
    wire _63;
    reg _990;
    wire _991;
    wire [15:0] _1850;
    wire [15:0] _1851;
    wire _1848;
    wire _1849;
    wire [15:0] _1852;
    wire [2:0] _1812;
    wire [2:0] _1810;
    wire [2:0] _1809;
    wire [2:0] _1808;
    wire [2:0] _1807;
    wire _767;
    wire _763;
    wire _764;
    wire _761;
    wire _765;
    wire _768;
    wire [3:0] _758;
    wire _760;
    wire _769;
    wire _756;
    wire _752;
    wire _753;
    wire _750;
    wire _754;
    wire _757;
    wire _748;
    reg [2:0] _742;
    wire [15:0] _743;
    wire _744;
    wire _738;
    wire _745;
    wire _736;
    wire _746;
    wire _749;
    wire [1:0] _735;
    reg _770;
    wire _734;
    wire _771;
    wire _731;
    wire [3:0] _729;
    reg _730;
    wire _732;
    wire [15:0] _724;
    wire _726;
    wire [15:0] _715;
    wire [16:0] _716;
    wire [16:0] _717;
    reg [16:0] _720;
    wire _721;
    wire _722;
    wire [15:0] _711;
    wire _713;
    wire _695;
    wire [2:0] _697;
    wire _692;
    wire [2:0] _694;
    wire _698;
    wire [2:0] _699;
    wire _687;
    wire [2:0] _689;
    wire _684;
    wire [2:0] _686;
    wire _690;
    wire [2:0] _691;
    wire _700;
    wire [2:0] _701;
    wire _677;
    wire [2:0] _679;
    wire _674;
    wire [2:0] _676;
    wire _680;
    wire [2:0] _681;
    wire _669;
    wire [2:0] _671;
    wire [7:0] _665;
    wire _666;
    wire [2:0] _668;
    wire _672;
    wire [2:0] _673;
    wire _682;
    wire [2:0] _683;
    wire _702;
    wire [2:0] _703;
    wire [16:0] _704;
    wire [111:0] _661;
    wire [15:0] _662;
    wire [16:0] _663;
    wire [16:0] _705;
    reg [16:0] _708;
    wire [16:0] _660;
    wire _709;
    wire _710;
    wire _714;
    wire _723;
    wire [1:0] _656;
    reg [15:0] _657;
    wire _659;
    wire _727;
    wire [7:0] _650;
    wire _652;
    wire _653;
    wire [7:0] _647;
    wire _649;
    wire _654;
    wire [7:0] _642;
    wire [7:0] _640;
    wire [7:0] _641;
    wire [7:0] _643;
    wire _645;
    wire _639;
    wire _646;
    wire _655;
    wire _728;
    wire _733;
    wire _772;
    wire _773;
    wire [1:0] _922;
    wire _630;
    wire _626;
    wire _627;
    wire _624;
    wire _628;
    wire _631;
    wire [3:0] _621;
    wire _623;
    wire _632;
    wire _619;
    wire _615;
    wire _616;
    wire _613;
    wire _617;
    wire _620;
    wire _611;
    reg [2:0] _605;
    wire [15:0] _606;
    wire _607;
    wire _601;
    wire _608;
    wire _599;
    wire _609;
    wire _612;
    wire [1:0] _598;
    reg _633;
    wire [1:0] _65;
    wire [1:0] _1445;
    wire [1:0] _66;
    reg [1:0] _458;
    wire _460;
    wire _597;
    wire _634;
    wire _594;
    wire [7:0] _68;
    wire [6:0] _450;
    wire [6:0] _449;
    wire _451;
    wire [15:0] _446;
    wire _1450;
    wire _1449;
    wire _1451;
    wire _1448;
    wire _1452;
    wire _1447;
    wire _1453;
    wire [14:0] _1446;
    wire [15:0] _1454;
    wire [15:0] _69;
    reg [15:0] _447;
    wire _448;
    wire [3:0] _1469;
    wire [3:0] _1467;
    wire [3:0] _1470;
    wire _1017;
    wire _1291;
    wire _71;
    wire _1292;
    wire _1283;
    wire _1463;
    wire _1464;
    wire _72;
    wire _1284;
    wire _1465;
    wire [3:0] _1471;
    reg [3:0] _1474;
    wire [3:0] _73;
    wire _444;
    wire [6:0] _1491;
    wire [7:0] _1492;
    wire [6:0] _1489;
    wire _1487;
    wire _1486;
    wire _1485;
    wire _1484;
    wire _1483;
    wire _1482;
    wire _1481;
    wire _1480;
    wire [2:0] _1478;
    wire [2:0] _1477;
    wire [2:0] _1476;
    wire [2:0] _1475;
    reg [2:0] _1479;
    reg _1488;
    wire [7:0] _1490;
    wire [1:0] _1458;
    wire [1:0] _1457;
    wire [1:0] _1456;
    wire [1:0] _1455;
    reg [1:0] _1459;
    wire [1:0] _1461;
    reg [7:0] _1493;
    wire [7:0] _1494;
    wire [7:0] _74;
    reg [7:0] _439;
    wire _440;
    wire [6:0] _1594;
    wire [7:0] _1595;
    wire _1592;
    wire _1591;
    wire _1590;
    wire _1589;
    wire _1588;
    wire _1587;
    wire _1586;
    wire _1585;
    wire [7:0] _1593;
    wire _1579;
    wire _1580;
    reg [7:0] _1581;
    wire _1573;
    wire _1574;
    reg [7:0] _1575;
    wire _1567;
    wire _1568;
    reg [7:0] _1569;
    wire _1561;
    wire _1562;
    reg [7:0] _1563;
    wire _1555;
    wire _1556;
    reg [7:0] _1557;
    wire _1549;
    wire _1550;
    reg [7:0] _1551;
    wire _1543;
    wire _1544;
    reg [7:0] _1545;
    wire [2:0] _1501;
    wire [2:0] _1502;
    wire [2:0] _75;
    reg [2:0] _1499;
    wire _1537;
    wire _1538;
    wire [7:0] _77;
    reg [7:0] _1539;
    wire [2:0] _1509;
    wire [2:0] _1510;
    wire [2:0] _78;
    reg [2:0] _1507;
    reg [7:0] _1582;
    wire [3:0] _1528;
    wire [3:0] _1526;
    wire [3:0] _1529;
    wire _1503;
    wire _1521;
    wire _1519;
    wire _1522;
    wire _1523;
    wire _79;
    wire _1504;
    wire _1349;
    wire _1495;
    wire _81;
    wire _1496;
    wire _1524;
    wire [3:0] _1530;
    reg [3:0] _1533;
    wire [3:0] _82;
    wire _442;
    wire [7:0] _1584;
    wire [1:0] _1516;
    wire [1:0] _1514;
    wire [1:0] _1513;
    wire [1:0] _1512;
    wire [1:0] _1511;
    reg [1:0] _1515;
    wire [1:0] _1517;
    reg [7:0] _1596;
    wire [7:0] _1597;
    wire [7:0] _83;
    reg [7:0] _435;
    wire _436;
    wire [7:0] _1608;
    wire [7:0] _1607;
    wire [7:0] _1605;
    wire [7:0] _1606;
    wire [1:0] _1603;
    wire [1:0] _1601;
    wire [1:0] _1600;
    wire [1:0] _1599;
    wire [1:0] _1598;
    reg [1:0] _1602;
    wire [1:0] _1604;
    reg [7:0] _1609;
    wire [7:0] _1610;
    wire [7:0] _84;
    reg [7:0] _430;
    wire _432;
    wire [3:0] _592;
    reg _593;
    wire _595;
    wire [15:0] _587;
    wire _589;
    wire [15:0] _578;
    wire [16:0] _579;
    wire [16:0] _580;
    reg [16:0] _583;
    wire _584;
    wire _585;
    wire [15:0] _574;
    wire _576;
    wire [2:0] _390;
    wire [2:0] _1626;
    wire _1622;
    wire _1623;
    wire _1620;
    wire _1624;
    wire [2:0] _1627;
    wire _1617;
    wire _1618;
    wire _1616;
    wire _1619;
    wire [2:0] _1629;
    wire _1613;
    wire [2:0] _1615;
    wire _1612;
    wire [2:0] _1630;
    wire [2:0] _85;
    reg [2:0] _386;
    wire _388;
    wire [2:0] _391;
    wire _381;
    wire _382;
    wire _380;
    wire _383;
    wire [2:0] _393;
    wire _377;
    wire _378;
    wire [2:0] _394;
    wire _558;
    wire [2:0] _560;
    wire [2:0] _369;
    wire [2:0] _1645;
    wire _1641;
    wire _1642;
    wire _1639;
    wire _1643;
    wire [2:0] _1646;
    wire _1636;
    wire _1637;
    wire _1635;
    wire _1638;
    wire [2:0] _1648;
    wire _1632;
    wire [2:0] _1634;
    wire _1631;
    wire [2:0] _1649;
    wire [2:0] _86;
    reg [2:0] _365;
    wire _367;
    wire [2:0] _370;
    wire _360;
    wire _361;
    wire _359;
    wire _362;
    wire [2:0] _372;
    wire _356;
    wire _357;
    wire [2:0] _373;
    wire _555;
    wire [2:0] _557;
    wire _561;
    wire [2:0] _562;
    wire [2:0] _346;
    wire [2:0] _1664;
    wire _1660;
    wire _1661;
    wire _1658;
    wire _1662;
    wire [2:0] _1665;
    wire _1655;
    wire _1656;
    wire _1654;
    wire _1657;
    wire [2:0] _1667;
    wire _1651;
    wire [2:0] _1653;
    wire _1650;
    wire [2:0] _1668;
    wire [2:0] _87;
    reg [2:0] _342;
    wire _344;
    wire [2:0] _347;
    wire _337;
    wire _338;
    wire _336;
    wire _339;
    wire [2:0] _349;
    wire _333;
    wire _334;
    wire [2:0] _350;
    wire _550;
    wire [2:0] _552;
    wire [2:0] _325;
    wire [2:0] _1683;
    wire _1679;
    wire _1680;
    wire _1677;
    wire _1681;
    wire [2:0] _1684;
    wire _1674;
    wire _1675;
    wire _1673;
    wire _1676;
    wire [2:0] _1686;
    wire _1670;
    wire [2:0] _1672;
    wire _1669;
    wire [2:0] _1687;
    wire [2:0] _88;
    reg [2:0] _321;
    wire _323;
    wire [2:0] _326;
    wire _316;
    wire _317;
    wire _315;
    wire _318;
    wire [2:0] _328;
    wire _312;
    wire _313;
    wire [2:0] _329;
    wire _547;
    wire [2:0] _549;
    wire _553;
    wire [2:0] _554;
    wire _563;
    wire [2:0] _564;
    wire [2:0] _300;
    wire [2:0] _1702;
    wire _1698;
    wire _1699;
    wire _1696;
    wire _1700;
    wire [2:0] _1703;
    wire _1693;
    wire _1694;
    wire _1692;
    wire _1695;
    wire [2:0] _1705;
    wire _1689;
    wire [2:0] _1691;
    wire _1688;
    wire [2:0] _1706;
    wire [2:0] _89;
    reg [2:0] _296;
    wire _298;
    wire [2:0] _301;
    wire _291;
    wire _292;
    wire _290;
    wire _293;
    wire [2:0] _303;
    wire _287;
    wire _288;
    wire [2:0] _304;
    wire _540;
    wire [2:0] _542;
    wire [2:0] _279;
    wire [2:0] _1721;
    wire _1717;
    wire _1718;
    wire _1715;
    wire _1719;
    wire [2:0] _1722;
    wire _1712;
    wire _1713;
    wire _1711;
    wire _1714;
    wire [2:0] _1724;
    wire _1708;
    wire [2:0] _1710;
    wire _1707;
    wire [2:0] _1725;
    wire [2:0] _90;
    reg [2:0] _275;
    wire _277;
    wire [2:0] _280;
    wire _270;
    wire _271;
    wire _269;
    wire _272;
    wire [2:0] _282;
    wire _266;
    wire _267;
    wire [2:0] _283;
    wire _537;
    wire [2:0] _539;
    wire _543;
    wire [2:0] _544;
    wire [2:0] _256;
    wire [2:0] _1740;
    wire _1736;
    wire _1737;
    wire _1734;
    wire _1738;
    wire [2:0] _1741;
    wire _1731;
    wire _1732;
    wire _1730;
    wire _1733;
    wire [2:0] _1743;
    wire _1727;
    wire [2:0] _1729;
    wire _1726;
    wire [2:0] _1744;
    wire [2:0] _91;
    reg [2:0] _252;
    wire _254;
    wire [2:0] _257;
    wire _247;
    wire _248;
    wire _246;
    wire _249;
    wire [2:0] _259;
    wire _243;
    wire _244;
    wire [2:0] _260;
    wire _532;
    wire [2:0] _534;
    wire [2:0] _235;
    wire [2:0] _1759;
    wire _1755;
    wire _1756;
    wire _1753;
    wire _1757;
    wire [2:0] _1760;
    wire _1750;
    wire _1751;
    wire _1749;
    wire _1752;
    wire [2:0] _1762;
    wire _1746;
    wire [2:0] _1748;
    wire _1745;
    wire [2:0] _1763;
    wire [2:0] _92;
    reg [2:0] _231;
    wire _233;
    wire [2:0] _236;
    wire _226;
    wire _227;
    wire _225;
    wire _228;
    wire [2:0] _238;
    wire _222;
    wire _223;
    wire [2:0] _239;
    wire [7:0] _528;
    wire _529;
    wire [2:0] _531;
    wire _535;
    wire [2:0] _536;
    wire _545;
    wire [2:0] _546;
    wire _565;
    wire [2:0] _566;
    wire [16:0] _567;
    wire _1766;
    wire [127:0] _1767;
    wire _1764;
    wire [127:0] _1768;
    wire [127:0] _93;
    reg [127:0] _144;
    wire _211;
    wire _212;
    wire [127:0] _213;
    wire _1771;
    wire [127:0] _1772;
    wire _1769;
    wire [127:0] _1773;
    wire [127:0] _94;
    reg [127:0] _141;
    wire _207;
    wire _208;
    wire [127:0] _209;
    wire _1776;
    wire [127:0] _1777;
    wire _1774;
    wire [127:0] _1778;
    wire [127:0] _95;
    reg [127:0] _138;
    wire _203;
    wire _204;
    wire [127:0] _205;
    wire _1117;
    wire _97;
    wire _1801;
    wire [127:0] _99;
    reg [127:0] _1802[0:255];
    wire [1:0] _1798;
    wire [5:0] _918;
    wire [5:0] _101;
    wire [111:0] _775;
    wire [5:0] _1787;
    wire [111:0] _638;
    wire [5:0] _1786;
    wire [5:0] _1785;
    wire [5:0] _1784;
    reg [5:0] _1788;
    wire _1789;
    wire _1790;
    wire [5:0] _1791;
    wire [5:0] _103;
    wire [1:0] _1002;
    wire _1781;
    wire [5:0] _1782;
    wire [5:0] _1783;
    wire [5:0] _1792;
    wire _1779;
    wire [5:0] _1793;
    wire [5:0] _1794;
    wire [5:0] _104;
    reg [5:0] _919;
    wire [7:0] _1799;
    wire [7:0] _106;
    wire _1796;
    wire _1797;
    wire [7:0] _1800;
    wire [127:0] _1803;
    reg [127:0] _1806;
    wire [127:0] _107;
    wire _199;
    wire _200;
    wire [127:0] _201;
    wire [511:0] _214;
    wire [111:0] _524;
    wire [15:0] _525;
    wire [16:0] _526;
    wire [16:0] _568;
    reg [16:0] _571;
    wire gnd;
    wire [16:0] _523;
    wire _572;
    wire _573;
    wire _577;
    wire _586;
    wire [15:0] _1820;
    wire _1817;
    wire _1818;
    wire [15:0] _1821;
    wire _1814;
    wire _1815;
    wire [15:0] _1823;
    wire [15:0] _1825;
    wire [15:0] _108;
    reg [15:0] _187;
    wire [15:0] _1832;
    wire _1829;
    wire _1830;
    wire [15:0] _1833;
    wire _1826;
    wire _1827;
    wire [15:0] _1835;
    wire [15:0] _1837;
    wire [15:0] _109;
    reg [15:0] _184;
    wire [1:0] _519;
    reg [15:0] _520;
    wire _522;
    wire _590;
    reg [7:0] _169;
    wire [7:0] _170;
    wire _1839;
    wire [7:0] _1841;
    wire _1838;
    wire [7:0] _1842;
    wire [7:0] _1844;
    wire [7:0] _110;
    reg [7:0] _166;
    wire [7:0] _171;
    wire [7:0] _513;
    wire _515;
    wire _516;
    wire [7:0] _510;
    wire _512;
    wire _517;
    wire [7:0] _505;
    wire [7:0] _503;
    wire vdd;
    wire _112;
    wire _114;
    wire [7:0] _116;
    reg [7:0] _150;
    reg [7:0] _153;
    wire [7:0] _504;
    wire [7:0] _506;
    wire _508;
    wire [111:0] _501;
    wire _502;
    wire _509;
    wire _518;
    wire _591;
    wire _596;
    wire _635;
    wire _636;
    wire [1:0] _924;
    wire [1:0] _926;
    reg [2:0] _1811;
    wire [2:0] _1813;
    wire _1845;
    wire _1846;
    wire [15:0] _1854;
    wire [15:0] _1856;
    wire [15:0] _117;
    reg [15:0] _181;
    wire [1:0] _984;
    reg [15:0] _985;
    wire [15:0] _983;
    wire _986;
    wire [63:0] _965;
    wire _981;
    wire _979;
    wire _980;
    wire _982;
    wire _987;
    wire _992;
    wire _1001;
    wire [2:0] _1862;
    wire [2:0] _1865;
    wire _1858;
    wire [2:0] _1866;
    wire _1857;
    wire [2:0] _1869;
    wire [2:0] _1871;
    wire [2:0] _118;
    reg [2:0] _197;
    wire _1874;
    wire [127:0] _1875;
    wire _1872;
    wire [127:0] _1876;
    wire [127:0] _119;
    reg [127:0] _135;
    wire [511:0] _145;
    wire [111:0] _146;
    wire _147;
    wire _160;
    wire _177;
    wire _426;
    wire _455;
    wire _499;
    wire _132;
    wire _500;
    wire _637;
    wire _774;
    wire _911;
    wire [1:0] _1895;
    wire _1880;
    wire [1:0] _1882;
    wire _1878;
    wire [1:0] _1896;
    wire _1877;
    wire [1:0] _1899;
    wire _121;
    wire [1:0] _1901;
    wire [1:0] _1903;
    wire [1:0] _122;
    reg [1:0] _130;
    wire _194;
    wire _964;
    wire _1367;
    wire _1371;
    wire [7:0] _1925;
    wire _124;
    wire [7:0] _1927;
    wire [7:0] _125;
    reg [7:0] _1434;
    wire [7:0] _1929;
    assign _935 = 1'b0;
    assign _937 = 1'b1;
    assign _931 = _927 == _930;
    assign _932 = ~ _931;
    assign _916 = _912 & _915;
    assign _933 = _916 & _932;
    assign _938 = _933 ? _937 : _936;
    assign _940 = _124 ? _935 : _938;
    assign _1 = _940;
    always @(posedge _114) begin
        if (_112)
            _936 <= _935;
        else
            _936 <= _1;
    end
    assign _943 = _37 & _942;
    assign _948 = _943 ? _937 : _946;
    assign _950 = _124 ? _935 : _948;
    assign _3 = _950;
    always @(posedge _114) begin
        if (_112)
            _946 <= _935;
        else
            _946 <= _3;
    end
    assign _951 = _72 & _444;
    assign _956 = _951 ? _937 : _954;
    assign _958 = _124 ? _935 : _956;
    assign _5 = _958;
    always @(posedge _114) begin
        if (_112)
            _954 <= _935;
        else
            _954 <= _5;
    end
    assign _966 = _965[61:61];
    assign _967 = _964 & _966;
    assign _972 = _967 ? _937 : _970;
    assign _9 = host_irq_ack;
    assign _974 = _9 ? _935 : _972;
    assign _976 = _124 ? _935 : _974;
    assign _10 = _976;
    always @(posedge _114) begin
        if (_112)
            _970 <= _935;
        else
            _970 <= _10;
    end
    assign _1006 = _1002 == _1005;
    assign _1008 = _1006 ? _937 : _961;
    assign _1004 = _1002 == _1353;
    assign _1010 = _1004 ? _937 : _1008;
    assign _1011 = _1001 ? _1010 : _961;
    assign _1012 = _911 ? _961 : _1011;
    assign _978 = _130 == _1084;
    assign _1013 = _978 ? _1012 : _961;
    assign _1015 = _124 ? _935 : _1013;
    assign _11 = _1015;
    always @(posedge _114) begin
        if (_112)
            _961 <= _935;
        else
            _961 <= _11;
    end
    assign _1021 = ~ _1020;
    assign _1018 = ~ _1017;
    assign _1022 = _1018 | _1021;
    assign _1023 = _1022 | _961;
    assign _1024 = _1023 | _970;
    assign _1129 = ~ _1122;
    assign _1128 = ~ _1071;
    assign _1130 = _1128 & _1129;
    assign _1127 = 32'b00000000000000000000000000000000;
    assign _1121 = ~ _915;
    assign _1119 = ~ _1071;
    assign _14 = host_cov_we;
    assign _1118 = _14 & _1117;
    assign _1120 = _1118 & _1119;
    assign _1122 = _1120 & _1121;
    assign _1123 = _1071 | _1122;
    assign _1110 = _31[11:0];
    assign _1107 = _1100 < _1097;
    assign _1108 = _1082 & _1107;
    assign _1109 = _1108 ? _1097 : _1100;
    assign _1111 = _1109 < _1110;
    assign _1112 = _1111 ? _1110 : _1109;
    assign _1113 = _1093 ? _1109 : _1112;
    assign _1099 = 12'b000000000000;
    assign _1057 = 12'b111111111111;
    assign _1054 = _1052[11:0];
    assign _1051 = 13'b0000000000000;
    assign _1048 = 10'b0000000000;
    assign _1049 = { _1048,
                     _1045 };
    assign _1050 = _1041 - _1049;
    assign _1044 = 3'b000;
    always @* begin
        case (_926)
        0:
            _1025 <= _469;
        1:
            _1025 <= _605;
        2:
            _1025 <= _742;
        default:
            _1025 <= _879;
        endcase
    end
    assign _15 = _1025;
    always @(posedge _114) begin
        if (_112)
            _1045 <= _1044;
        else
            _1045 <= _15;
    end
    assign _1046 = { _1048,
                     _1045 };
    assign _1031 = 13'b1111111111111;
    assign _1030 = _1028[12:0];
    assign _1026 = 16'b0001111111111111;
    assign _1029 = _1026 < _1028;
    assign _1032 = _1029 ? _1031 : _1030;
    assign _16 = _1032;
    always @(posedge _114) begin
        if (_112)
            _1041 <= _1051;
        else
            _1041 <= _16;
    end
    assign _1047 = _1041 < _1046;
    assign _1052 = _1047 ? _1051 : _1050;
    assign _1038 = 13'b0111111111111;
    assign _1053 = _1038 < _1052;
    assign _1056 = _1053 ? _1057 : _1054;
    assign _1033 = 16'b1111111111111111;
    assign _1034 = _1028 == _1033;
    assign _17 = _1034;
    always @(posedge _114) begin
        if (_112)
            _1037 <= _935;
        else
            _1037 <= _17;
    end
    assign _1058 = _1037 ? _1057 : _1056;
    assign _18 = _1058;
    always @(posedge _114) begin
        if (_112)
            _1100 <= _1099;
        else
            _1100 <= _18;
    end
    assign _1061 = _1028[11:0];
    always @* begin
        case (_926)
        0:
            _1027 <= _178;
        1:
            _1027 <= _519;
        2:
            _1027 <= _656;
        default:
            _1027 <= _793;
        endcase
    end
    always @* begin
        case (_1027)
        0:
            _1028 <= _181;
        1:
            _1028 <= _184;
        2:
            _1028 <= _187;
        default:
            _1028 <= _187;
        endcase
    end
    assign _1059 = 16'b0000111111111111;
    assign _1060 = _1059 < _1028;
    assign _1063 = _1060 ? _1057 : _1061;
    assign _19 = _1063;
    always @(posedge _114) begin
        if (_112)
            _1097 <= _1099;
        else
            _1097 <= _19;
    end
    assign _1101 = _1097 < _1100;
    assign _1102 = _1082 & _1101;
    assign _1103 = _1102 ? _1097 : _1100;
    assign _1094 = _31[23:12];
    assign _1104 = _1094 < _1103;
    assign _1105 = _1104 ? _1094 : _1103;
    assign _1092 = 8'b00000000;
    assign _1093 = _1077 == _1092;
    assign _1106 = _1093 ? _1103 : _1105;
    assign _1090 = 8'b11111111;
    assign _1089 = _1087[7:0];
    assign _1084 = 2'b10;
    assign _1083 = 2'b01;
    assign _1065 = _927 == _930;
    assign _1064 = _912 & _915;
    assign _1066 = _1064 & _1065;
    assign _20 = _1066;
    always @(posedge _114) begin
        if (_112)
            _1082 <= _935;
        else
            _1082 <= _20;
    end
    assign _1085 = _1082 ? _1084 : _1083;
    assign _1079 = 7'b0000000;
    assign _1086 = { _1079,
                     _1085 };
    assign _1077 = _31[31:24];
    assign _1078 = { gnd,
                     _1077 };
    assign _1087 = _1078 + _1086;
    assign _1088 = _1087[8:8];
    assign _1091 = _1088 ? _1090 : _1089;
    assign _1114 = { _1091,
                     _1106,
                     _1113 };
    assign _22 = host_cov_wdata;
    assign _1115 = _1071 ? _1114 : _22;
    always @(posedge _114) begin
        if (_1123)
            _1124[_1076] <= _1115;
    end
    assign _23 = _930;
    always @(posedge _114) begin
        if (_112)
            _1075 <= _1092;
        else
            _1075 <= _23;
    end
    assign _927 = { _919,
                    _926 };
    assign _24 = _927;
    always @(posedge _114) begin
        if (_112)
            _930 <= _1092;
        else
            _930 <= _24;
    end
    assign _26 = host_cov_addr;
    assign _1072 = _915 ? _930 : _26;
    assign _1067 = ~ _915;
    assign _28 = host_cover_en;
    assign _912 = _911 & _28;
    assign _1068 = _912 & _1067;
    assign _29 = _1068;
    always @(posedge _114) begin
        if (_112)
            _915 <= _935;
        else
            _915 <= _29;
    end
    assign _30 = _915;
    always @(posedge _114) begin
        if (_112)
            _1071 <= _935;
        else
            _1071 <= _30;
    end
    assign _1076 = _1071 ? _1075 : _1072;
    assign _1125 = _1124[_1076];
    always @(posedge _114) begin
        if (_1130)
            _1131 <= _1125;
    end
    assign _31 = _1131;
    assign _1278 = 3'b111;
    assign _1279 = _1136 == _1278;
    assign _1280 = _1133 & _1279;
    assign _1277 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _114) begin
        if (_112)
            _1281 <= _1277;
        else
            if (_1280)
                _1281 <= _36;
    end
    assign _1272 = 3'b110;
    assign _1273 = _1136 == _1272;
    assign _1274 = _1133 & _1273;
    always @(posedge _114) begin
        if (_112)
            _1275 <= _1277;
        else
            if (_1274)
                _1275 <= _36;
    end
    assign _1266 = 3'b101;
    assign _1267 = _1136 == _1266;
    assign _1268 = _1133 & _1267;
    always @(posedge _114) begin
        if (_112)
            _1269 <= _1277;
        else
            if (_1268)
                _1269 <= _36;
    end
    assign _1260 = 3'b100;
    assign _1261 = _1136 == _1260;
    assign _1262 = _1133 & _1261;
    always @(posedge _114) begin
        if (_112)
            _1263 <= _1277;
        else
            if (_1262)
                _1263 <= _36;
    end
    assign _1254 = 3'b011;
    assign _1255 = _1136 == _1254;
    assign _1256 = _1133 & _1255;
    always @(posedge _114) begin
        if (_112)
            _1257 <= _1277;
        else
            if (_1256)
                _1257 <= _36;
    end
    assign _1248 = 3'b010;
    assign _1249 = _1136 == _1248;
    assign _1250 = _1133 & _1249;
    always @(posedge _114) begin
        if (_112)
            _1251 <= _1277;
        else
            if (_1250)
                _1251 <= _36;
    end
    assign _1242 = 3'b001;
    assign _1243 = _1136 == _1242;
    assign _1244 = _1133 & _1243;
    always @(posedge _114) begin
        if (_112)
            _1245 <= _1277;
        else
            if (_1244)
                _1245 <= _36;
    end
    assign _1138 = _1136 + _1242;
    assign _1139 = _1133 ? _1138 : _1136;
    assign _34 = _1139;
    always @(posedge _114) begin
        if (_112)
            _1136 <= _1044;
        else
            _1136 <= _34;
    end
    assign _1237 = _1136 == _1044;
    assign _1238 = _1133 & _1237;
    assign _1212 = _1152 - _1208;
    assign _1147 = 29'b11111111111111111111111111111;
    assign _1146 = 29'b00000000000000000000000000000;
    assign _1149 = 29'b00000000000000000000000000001;
    assign _1150 = _1148 + _1149;
    assign _1143 = _1142[2:0];
    assign _1145 = _1143 == _1278;
    assign _1151 = _1145 ? _1150 : _1148;
    assign _35 = _1151;
    always @(posedge _114) begin
        if (_112)
            _1148 <= _1147;
        else
            _1148 <= _35;
    end
    assign _1210 = _1142[31:3];
    assign _1198 = _995[0:0];
    assign _1197 = _166[0:0];
    assign _1199 = _1197 & _1198;
    assign _1201 = _1199 ? _386 : _1044;
    assign _1193 = _995[1:1];
    assign _1192 = _166[1:1];
    assign _1194 = _1192 & _1193;
    assign _1196 = _1194 ? _365 : _1044;
    assign _1202 = _1196 < _1201;
    assign _1203 = _1202 ? _1201 : _1196;
    assign _1186 = _995[2:2];
    assign _1185 = _166[2:2];
    assign _1187 = _1185 & _1186;
    assign _1189 = _1187 ? _342 : _1044;
    assign _1181 = _995[3:3];
    assign _1180 = _166[3:3];
    assign _1182 = _1180 & _1181;
    assign _1184 = _1182 ? _321 : _1044;
    assign _1190 = _1184 < _1189;
    assign _1191 = _1190 ? _1189 : _1184;
    assign _1204 = _1191 < _1203;
    assign _1205 = _1204 ? _1203 : _1191;
    assign _1172 = _995[4:4];
    assign _1171 = _166[4:4];
    assign _1173 = _1171 & _1172;
    assign _1175 = _1173 ? _296 : _1044;
    assign _1167 = _995[5:5];
    assign _1166 = _166[5:5];
    assign _1168 = _1166 & _1167;
    assign _1170 = _1168 ? _275 : _1044;
    assign _1176 = _1170 < _1175;
    assign _1177 = _1176 ? _1175 : _1170;
    assign _1160 = _995[6:6];
    assign _1159 = _166[6:6];
    assign _1161 = _1159 & _1160;
    assign _1163 = _1161 ? _252 : _1044;
    assign _1155 = _995[7:7];
    assign _1154 = _166[7:7];
    assign _1156 = _1154 & _1155;
    assign _1158 = _1156 ? _231 : _1044;
    assign _1164 = _1158 < _1163;
    assign _1165 = _1164 ? _1163 : _1158;
    assign _1178 = _1165 < _1177;
    assign _1179 = _1178 ? _1177 : _1165;
    assign _1206 = _1179 < _1205;
    assign _1207 = _1206 ? _1205 : _1179;
    assign _1208 = _1000 ? _1207 : _1044;
    assign _1152 = _1142[2:0];
    assign _1209 = _1152 < _1208;
    assign _1211 = _1209 ? _1148 : _1210;
    assign _1213 = { _1211,
                     _1212 };
    assign _1215 = { _1213,
                     _919,
                     _1214,
                     _153 };
    assign _36 = _1215;
    always @(posedge _114) begin
        if (_112)
            _1239 <= _1277;
        else
            if (_1238)
                _1239 <= _36;
    end
    assign _1232 = _1230 + _1242;
    assign _1019 = 4'b0000;
    assign _1221 = 4'b0001;
    assign _1222 = _38 + _1221;
    assign _1220 = _38 - _1221;
    assign _1223 = _1133 ? _1222 : _1220;
    assign _941 = 4'b1000;
    assign _942 = _38 == _941;
    assign _1132 = ~ _942;
    assign _37 = _1001;
    assign _1133 = _37 & _1132;
    assign _1218 = _1133 ^ _1217;
    assign _1224 = _1218 ? _1223 : _38;
    always @(posedge _114) begin
        if (_112)
            _1227 <= _1019;
        else
            _1227 <= _1224;
    end
    assign _38 = _1227;
    assign _1020 = _38 == _1019;
    assign _1216 = ~ _1020;
    assign _40 = host_vlog_pop;
    assign _1217 = _40 & _1216;
    assign _1233 = _1217 ? _1232 : _1230;
    assign _41 = _1233;
    always @(posedge _114) begin
        if (_112)
            _1230 <= _1044;
        else
            _1230 <= _41;
    end
    always @* begin
        case (_1230)
        0:
            _1282 <= _1239;
        1:
            _1282 <= _1245;
        2:
            _1282 <= _1251;
        3:
            _1282 <= _1257;
        4:
            _1282 <= _1263;
        5:
            _1282 <= _1269;
        6:
            _1282 <= _1275;
        default:
            _1282 <= _1281;
        endcase
    end
    assign _1344 = _1287 == _1278;
    assign _1345 = _1284 & _1344;
    always @(posedge _114) begin
        if (_112)
            _1346 <= _1092;
        else
            if (_1345)
                _1346 <= _439;
    end
    assign _1338 = _1287 == _1272;
    assign _1339 = _1284 & _1338;
    always @(posedge _114) begin
        if (_112)
            _1340 <= _1092;
        else
            if (_1339)
                _1340 <= _439;
    end
    assign _1332 = _1287 == _1266;
    assign _1333 = _1284 & _1332;
    always @(posedge _114) begin
        if (_112)
            _1334 <= _1092;
        else
            if (_1333)
                _1334 <= _439;
    end
    assign _1326 = _1287 == _1260;
    assign _1327 = _1284 & _1326;
    always @(posedge _114) begin
        if (_112)
            _1328 <= _1092;
        else
            if (_1327)
                _1328 <= _439;
    end
    assign _1320 = _1287 == _1254;
    assign _1321 = _1284 & _1320;
    always @(posedge _114) begin
        if (_112)
            _1322 <= _1092;
        else
            if (_1321)
                _1322 <= _439;
    end
    assign _1314 = _1287 == _1248;
    assign _1315 = _1284 & _1314;
    always @(posedge _114) begin
        if (_112)
            _1316 <= _1092;
        else
            if (_1315)
                _1316 <= _439;
    end
    assign _1308 = _1287 == _1242;
    assign _1309 = _1284 & _1308;
    always @(posedge _114) begin
        if (_112)
            _1310 <= _1092;
        else
            if (_1309)
                _1310 <= _439;
    end
    assign _1289 = _1287 + _1242;
    assign _1290 = _1284 ? _1289 : _1287;
    assign _44 = _1290;
    always @(posedge _114) begin
        if (_112)
            _1287 <= _1044;
        else
            _1287 <= _44;
    end
    assign _1302 = _1287 == _1044;
    assign _1303 = _1284 & _1302;
    always @(posedge _114) begin
        if (_112)
            _1304 <= _1092;
        else
            if (_1303)
                _1304 <= _439;
    end
    assign _1297 = _1295 + _1242;
    assign _1298 = _1292 ? _1297 : _1295;
    assign _45 = _1298;
    always @(posedge _114) begin
        if (_112)
            _1295 <= _1044;
        else
            _1295 <= _45;
    end
    always @* begin
        case (_1295)
        0:
            _1347 <= _1304;
        1:
            _1347 <= _1310;
        2:
            _1347 <= _1316;
        3:
            _1347 <= _1322;
        4:
            _1347 <= _1328;
        5:
            _1347 <= _1334;
        6:
            _1347 <= _1340;
        default:
            _1347 <= _1346;
        endcase
    end
    assign _1350 = 32'b00000000000000000000000000000001;
    assign _1351 = _1142 + _1350;
    assign _49 = _1351;
    always @(posedge _114) begin
        if (_112)
            _1142 <= _1127;
        else
            _1142 <= _49;
    end
    assign _1353 = 2'b00;
    assign _1214 = { _992,
                     _1000 };
    always @(posedge _114) begin
        if (_112)
            _1354 <= _1353;
        else
            _1354 <= _1214;
    end
    always @(posedge _114) begin
        if (_112)
            _1357 <= _935;
        else
            _1357 <= _1001;
    end
    always @(posedge _114) begin
        if (_112)
            _1360 <= _1353;
        else
            _1360 <= _926;
    end
    always @(posedge _114) begin
        if (_112)
            _1363 <= _935;
        else
            _1363 <= _911;
    end
    assign _1364 = _965[60:60];
    assign _1365 = _132 & _1364;
    assign _1366 = ~ _1117;
    assign _1435 = _62 & _1434;
    assign _1436 = ~ _1435;
    assign _1389 = _965[23:16];
    assign _1387 = _775[86:79];
    assign _1386 = _638[86:79];
    assign _1385 = _501[86:79];
    assign _1384 = _146[86:79];
    always @* begin
        case (_926)
        0:
            _1388 <= _1384;
        1:
            _1388 <= _1385;
        2:
            _1388 <= _1386;
        default:
            _1388 <= _1387;
        endcase
    end
    assign _1390 = _964 ? _1389 : _1388;
    assign _1391 = _1390 & _1381;
    assign _1382 = ~ _1381;
    assign _1383 = _1374 & _1382;
    assign _1392 = _1383 | _1391;
    assign _1426 = _1392 | _1425;
    assign _1427 = _1371 ? _1426 : _1374;
    assign _1429 = _121 ? _1092 : _1427;
    assign _1431 = _124 ? _1092 : _1429;
    assign _59 = _1431;
    always @(posedge _114) begin
        if (_112)
            _1374 <= _1092;
        else
            _1374 <= _59;
    end
    assign _1437 = _1374 & _1436;
    assign _62 = host_open_drain;
    assign _1928 = ~ _62;
    assign _1920 = { _1918,
                     _1917 };
    assign _1917 = _435[0:0];
    assign _1918 = { _1917,
                     _1917 };
    assign _1919 = { _1918,
                     _1918 };
    assign _1921 = { _1919,
                     _1920 };
    assign _1922 = { _1921,
                     _1917 };
    assign _1923 = _1922 & _1425;
    assign _1423 = _1419 & _1417;
    assign _1422 = _1419 & _1415;
    assign _1421 = _1419 & _1412;
    assign _1419 = ~ _1406;
    assign _1420 = _1419 & _1409;
    assign _1417 = _1414 & _1411;
    assign _1418 = _1406 & _1417;
    assign _1414 = ~ _1407;
    assign _1415 = _1414 & _1408;
    assign _1416 = _1406 & _1415;
    assign _1411 = ~ _1408;
    assign _1412 = _1407 & _1411;
    assign _1413 = _1406 & _1412;
    assign _1408 = _1405[0:0];
    assign _1407 = _1405[1:1];
    assign _1409 = _1407 & _1408;
    assign _1404 = _775[90:88];
    assign _1403 = _638[90:88];
    assign _1402 = _501[90:88];
    assign _1401 = _146[90:88];
    always @* begin
        case (_926)
        0:
            _1405 <= _1401;
        1:
            _1405 <= _1402;
        2:
            _1405 <= _1403;
        default:
            _1405 <= _1404;
        endcase
    end
    assign _1406 = _1405[2:2];
    assign _1410 = _1406 & _1409;
    assign _1424 = { _1410,
                     _1413,
                     _1416,
                     _1418,
                     _1420,
                     _1421,
                     _1422,
                     _1423 };
    assign _1397 = _775[87:87];
    assign _1396 = _638[87:87];
    assign _1395 = _501[87:87];
    assign _1394 = _146[87:87];
    always @* begin
        case (_926)
        0:
            _1398 <= _1394;
        1:
            _1398 <= _1395;
        2:
            _1398 <= _1396;
        default:
            _1398 <= _1397;
        endcase
    end
    assign _1393 = ~ _964;
    assign _1399 = _1393 & _1398;
    assign _1425 = _1399 ? _1424 : _1092;
    assign _1915 = ~ _1425;
    assign _1911 = _965[15:8];
    assign _1909 = _775[78:71];
    assign _1908 = _638[78:71];
    assign _1907 = _501[78:71];
    assign _1906 = _146[78:71];
    always @* begin
        case (_926)
        0:
            _1910 <= _1906;
        1:
            _1910 <= _1907;
        2:
            _1910 <= _1908;
        default:
            _1910 <= _1909;
        endcase
    end
    assign _1912 = _964 ? _1911 : _1910;
    assign _1913 = _1912 & _1381;
    assign _1380 = _965[7:0];
    assign _1378 = _775[70:63];
    assign _1377 = _638[70:63];
    assign _1376 = _501[70:63];
    assign _1375 = _146[70:63];
    always @* begin
        case (_926)
        0:
            _1379 <= _1375;
        1:
            _1379 <= _1376;
        2:
            _1379 <= _1377;
        default:
            _1379 <= _1378;
        endcase
    end
    assign _1381 = _964 ? _1380 : _1379;
    assign _1904 = ~ _1381;
    assign _1905 = _1434 & _1904;
    assign _1914 = _1905 | _1913;
    assign _1916 = _1914 & _1915;
    assign _1924 = _1916 | _1923;
    assign _1369 = _458 == _1353;
    assign _1370 = _1369 | _460;
    assign _963 = _197 == _1260;
    assign _1898 = _964 ? _1084 : _130;
    assign _1894 = _1790 ? _1083 : _130;
    assign _1005 = 2'b11;
    assign _1885 = _1002 == _1005;
    assign _1887 = _1885 ? _1353 : _130;
    assign _1884 = _1002 == _1084;
    assign _1889 = _1884 ? _1083 : _1887;
    assign _1883 = _1002 == _1353;
    assign _1891 = _1883 ? _1353 : _1889;
    assign _1892 = _1001 ? _1891 : _130;
    assign _904 = _861 == _1033;
    assign _899 = 16'b0000000000000000;
    assign _900 = _861 == _899;
    assign _901 = _900 & _881;
    assign _898 = _797 == _857;
    assign _902 = _898 | _901;
    assign _905 = _796 ? _904 : _902;
    assign _895 = _447[3:0];
    assign _897 = _895 == _1019;
    assign _906 = _897 | _905;
    assign _893 = _861 == _1033;
    assign _889 = _861 == _899;
    assign _890 = _889 & _881;
    assign _887 = _797 == _857;
    assign _891 = _887 | _890;
    assign _894 = _796 ? _893 : _891;
    assign _885 = _848 == _1033;
    always @(posedge _114) begin
        if (_112)
            _879 <= _1044;
        else
            _879 <= _840;
    end
    assign _880 = { _1051,
                    _879 };
    assign _881 = _794 < _880;
    assign _875 = _848 == _899;
    assign _882 = _875 & _881;
    assign _873 = _797 == _845;
    assign _883 = _873 | _882;
    assign _886 = _796 ? _885 : _883;
    assign _872 = _775[104:103];
    always @* begin
        case (_872)
        0:
            _907 <= vdd;
        1:
            _907 <= _886;
        2:
            _907 <= _894;
        default:
            _907 <= _906;
        endcase
    end
    assign _871 = ~ _460;
    assign _908 = _871 | _907;
    assign _868 = _775[62:62];
    assign _866 = _775[61:58];
    always @* begin
        case (_866)
        0:
            _867 <= vdd;
        1:
            _867 <= _432;
        2:
            _867 <= _436;
        3:
            _867 <= _440;
        4:
            _867 <= _442;
        5:
            _867 <= _444;
        6:
            _867 <= _448;
        7:
            _867 <= _451;
        8:
            _867 <= gnd;
        9:
            _867 <= gnd;
        10:
            _867 <= gnd;
        11:
            _867 <= gnd;
        12:
            _867 <= gnd;
        13:
            _867 <= gnd;
        14:
            _867 <= gnd;
        default:
            _867 <= gnd;
        endcase
    end
    assign _869 = _867 ^ _868;
    assign _861 = _775[57:42];
    assign _863 = _861 == _1033;
    assign _856 = 17'b00000000000000000;
    assign _852 = _798[57:42];
    assign _853 = { gnd,
                    _852 };
    assign _854 = _853 + _841;
    always @(posedge _114) begin
        if (_112)
            _857 <= _856;
        else
            _857 <= _854;
    end
    assign _858 = _857 < _797;
    assign _859 = ~ _858;
    assign _848 = _775[41:26];
    assign _850 = _848 == _899;
    assign _832 = _802[0:0];
    assign _834 = _832 ? _394 : _1044;
    assign _829 = _802[1:1];
    assign _831 = _829 ? _373 : _1044;
    assign _835 = _831 < _834;
    assign _836 = _835 ? _834 : _831;
    assign _824 = _802[2:2];
    assign _826 = _824 ? _350 : _1044;
    assign _821 = _802[3:3];
    assign _823 = _821 ? _329 : _1044;
    assign _827 = _823 < _826;
    assign _828 = _827 ? _826 : _823;
    assign _837 = _828 < _836;
    assign _838 = _837 ? _836 : _828;
    assign _814 = _802[4:4];
    assign _816 = _814 ? _304 : _1044;
    assign _811 = _802[5:5];
    assign _813 = _811 ? _283 : _1044;
    assign _817 = _813 < _816;
    assign _818 = _817 ? _816 : _813;
    assign _806 = _802[6:6];
    assign _808 = _806 ? _260 : _1044;
    assign _802 = _798[23:16];
    assign _803 = _802[7:7];
    assign _805 = _803 ? _239 : _1044;
    assign _809 = _805 < _808;
    assign _810 = _809 ? _808 : _805;
    assign _819 = _810 < _818;
    assign _820 = _819 ? _818 : _810;
    assign _839 = _820 < _838;
    assign _840 = _839 ? _838 : _820;
    assign _801 = 14'b00000000000000;
    assign _841 = { _801,
                    _840 };
    assign _798 = _214[511:400];
    assign _799 = _798[41:26];
    assign _800 = { gnd,
                    _799 };
    assign _842 = _800 + _841;
    always @(posedge _114) begin
        if (_112)
            _845 <= _856;
        else
            _845 <= _842;
    end
    assign _797 = { gnd,
                    _794 };
    assign _846 = _797 < _845;
    assign _847 = ~ _846;
    assign _851 = _847 | _850;
    assign _860 = _851 & _859;
    assign _793 = _775[25:24];
    always @* begin
        case (_793)
        0:
            _794 <= _181;
        1:
            _794 <= _184;
        2:
            _794 <= _187;
        default:
            _794 <= _187;
        endcase
    end
    assign _796 = _794 == _1033;
    assign _864 = _796 ? _863 : _860;
    assign _787 = _171 & _784;
    assign _789 = _787 == _1092;
    assign _790 = ~ _789;
    assign _784 = _775[23:16];
    assign _786 = _784 == _1092;
    assign _791 = _786 | _790;
    assign _779 = _775[7:0];
    assign _777 = _775[15:8];
    assign _778 = _153 ^ _777;
    assign _780 = _778 & _779;
    assign _782 = _780 == _1092;
    assign _776 = _775[111:111];
    assign _783 = _776 & _782;
    assign _792 = _783 & _791;
    assign _865 = _792 & _864;
    assign _870 = _865 & _869;
    assign _909 = _870 & _908;
    assign _910 = _132 & _909;
    assign _494 = _422 == _1033;
    assign _490 = _422 == _899;
    assign _491 = _490 & _471;
    assign _488 = _192 == _418;
    assign _492 = _488 | _491;
    assign _495 = _190 ? _494 : _492;
    assign _485 = _447[3:0];
    assign _487 = _485 == _1019;
    assign _496 = _487 | _495;
    assign _483 = _422 == _1033;
    assign _479 = _422 == _899;
    assign _480 = _479 & _471;
    assign _477 = _192 == _418;
    assign _481 = _477 | _480;
    assign _484 = _190 ? _483 : _481;
    assign _475 = _409 == _1033;
    always @(posedge _114) begin
        if (_112)
            _469 <= _1044;
        else
            _469 <= _401;
    end
    assign _470 = { _1051,
                    _469 };
    assign _471 = _188 < _470;
    assign _465 = _409 == _899;
    assign _472 = _465 & _471;
    assign _463 = _192 == _406;
    assign _473 = _463 | _472;
    assign _476 = _190 ? _475 : _473;
    assign _462 = _146[104:103];
    always @* begin
        case (_462)
        0:
            _497 <= vdd;
        1:
            _497 <= _476;
        2:
            _497 <= _484;
        default:
            _497 <= _496;
        endcase
    end
    assign _461 = ~ _460;
    assign _498 = _461 | _497;
    assign _453 = _146[62:62];
    assign _427 = _146[61:58];
    always @* begin
        case (_427)
        0:
            _452 <= vdd;
        1:
            _452 <= _432;
        2:
            _452 <= _436;
        3:
            _452 <= _440;
        4:
            _452 <= _442;
        5:
            _452 <= _444;
        6:
            _452 <= _448;
        7:
            _452 <= _451;
        8:
            _452 <= gnd;
        9:
            _452 <= gnd;
        10:
            _452 <= gnd;
        11:
            _452 <= gnd;
        12:
            _452 <= gnd;
        13:
            _452 <= gnd;
        14:
            _452 <= gnd;
        default:
            _452 <= gnd;
        endcase
    end
    assign _454 = _452 ^ _453;
    assign _422 = _146[57:42];
    assign _424 = _422 == _1033;
    assign _413 = _215[57:42];
    assign _414 = { gnd,
                    _413 };
    assign _415 = _414 + _402;
    always @(posedge _114) begin
        if (_112)
            _418 <= _856;
        else
            _418 <= _415;
    end
    assign _419 = _418 < _192;
    assign _420 = ~ _419;
    assign _409 = _146[41:26];
    assign _411 = _409 == _899;
    assign _375 = _219[0:0];
    assign _395 = _375 ? _394 : _1044;
    assign _354 = _219[1:1];
    assign _374 = _354 ? _373 : _1044;
    assign _396 = _374 < _395;
    assign _397 = _396 ? _395 : _374;
    assign _331 = _219[2:2];
    assign _351 = _331 ? _350 : _1044;
    assign _310 = _219[3:3];
    assign _330 = _310 ? _329 : _1044;
    assign _352 = _330 < _351;
    assign _353 = _352 ? _351 : _330;
    assign _398 = _353 < _397;
    assign _399 = _398 ? _397 : _353;
    assign _285 = _219[4:4];
    assign _305 = _285 ? _304 : _1044;
    assign _264 = _219[5:5];
    assign _284 = _264 ? _283 : _1044;
    assign _306 = _284 < _305;
    assign _307 = _306 ? _305 : _284;
    assign _241 = _219[6:6];
    assign _261 = _241 ? _260 : _1044;
    assign _219 = _215[23:16];
    assign _220 = _219[7:7];
    assign _240 = _220 ? _239 : _1044;
    assign _262 = _240 < _261;
    assign _263 = _262 ? _261 : _240;
    assign _308 = _263 < _307;
    assign _309 = _308 ? _307 : _263;
    assign _400 = _309 < _399;
    assign _401 = _400 ? _399 : _309;
    assign _402 = { _801,
                    _401 };
    assign _215 = _214[175:64];
    assign _216 = _215[41:26];
    assign _217 = { gnd,
                    _216 };
    assign _403 = _217 + _402;
    always @(posedge _114) begin
        if (_112)
            _406 <= _856;
        else
            _406 <= _403;
    end
    assign _192 = { gnd,
                    _188 };
    assign _407 = _192 < _406;
    assign _408 = ~ _407;
    assign _412 = _408 | _411;
    assign _421 = _412 & _420;
    assign _178 = _146[25:24];
    always @* begin
        case (_178)
        0:
            _188 <= _181;
        1:
            _188 <= _184;
        2:
            _188 <= _187;
        default:
            _188 <= _187;
        endcase
    end
    assign _190 = _188 == _1033;
    assign _425 = _190 ? _424 : _421;
    assign _172 = _171 & _161;
    assign _174 = _172 == _1092;
    assign _175 = ~ _174;
    assign _161 = _146[23:16];
    assign _163 = _161 == _1092;
    assign _176 = _163 | _175;
    assign _156 = _146[7:0];
    assign _154 = _146[15:8];
    assign _155 = _153 ^ _154;
    assign _157 = _155 & _156;
    assign _159 = _157 == _1092;
    assign _134 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _1868 = _197 + _1242;
    assign _1864 = _1790 ? _1044 : _197;
    assign _1859 = _1002 == _1084;
    assign _1861 = _1859 ? _1044 : _197;
    assign _995 = _965[57:50];
    assign _996 = _171 & _995;
    assign _998 = _996 == _1092;
    assign _999 = ~ _998;
    assign _993 = ~ _911;
    assign _994 = _132 & _993;
    assign _1000 = _994 & _999;
    assign _1442 = _992 ? _937 : _1440;
    assign _1443 = _911 ? _1440 : _1442;
    assign _1440 = _1367 ? _935 : _990;
    assign _1438 = _130 == _1084;
    assign _1444 = _1438 ? _1443 : _1440;
    assign _63 = _1444;
    always @(posedge _114) begin
        if (_112)
            _990 <= _935;
        else
            _990 <= _63;
    end
    assign _991 = ~ _990;
    assign _1850 = 16'b0000000000000001;
    assign _1851 = _181 + _1850;
    assign _1848 = _181 == _1033;
    assign _1849 = ~ _1848;
    assign _1852 = _1849 ? _1851 : _181;
    assign _1812 = _965[26:24];
    assign _1810 = _775[93:91];
    assign _1809 = _638[93:91];
    assign _1808 = _501[93:91];
    assign _1807 = _146[93:91];
    assign _767 = _724 == _1033;
    assign _763 = _724 == _899;
    assign _764 = _763 & _744;
    assign _761 = _660 == _720;
    assign _765 = _761 | _764;
    assign _768 = _659 ? _767 : _765;
    assign _758 = _447[3:0];
    assign _760 = _758 == _1019;
    assign _769 = _760 | _768;
    assign _756 = _724 == _1033;
    assign _752 = _724 == _899;
    assign _753 = _752 & _744;
    assign _750 = _660 == _720;
    assign _754 = _750 | _753;
    assign _757 = _659 ? _756 : _754;
    assign _748 = _711 == _1033;
    always @(posedge _114) begin
        if (_112)
            _742 <= _1044;
        else
            _742 <= _703;
    end
    assign _743 = { _1051,
                    _742 };
    assign _744 = _657 < _743;
    assign _738 = _711 == _899;
    assign _745 = _738 & _744;
    assign _736 = _660 == _708;
    assign _746 = _736 | _745;
    assign _749 = _659 ? _748 : _746;
    assign _735 = _638[104:103];
    always @* begin
        case (_735)
        0:
            _770 <= vdd;
        1:
            _770 <= _749;
        2:
            _770 <= _757;
        default:
            _770 <= _769;
        endcase
    end
    assign _734 = ~ _460;
    assign _771 = _734 | _770;
    assign _731 = _638[62:62];
    assign _729 = _638[61:58];
    always @* begin
        case (_729)
        0:
            _730 <= vdd;
        1:
            _730 <= _432;
        2:
            _730 <= _436;
        3:
            _730 <= _440;
        4:
            _730 <= _442;
        5:
            _730 <= _444;
        6:
            _730 <= _448;
        7:
            _730 <= _451;
        8:
            _730 <= gnd;
        9:
            _730 <= gnd;
        10:
            _730 <= gnd;
        11:
            _730 <= gnd;
        12:
            _730 <= gnd;
        13:
            _730 <= gnd;
        14:
            _730 <= gnd;
        default:
            _730 <= gnd;
        endcase
    end
    assign _732 = _730 ^ _731;
    assign _724 = _638[57:42];
    assign _726 = _724 == _1033;
    assign _715 = _661[57:42];
    assign _716 = { gnd,
                    _715 };
    assign _717 = _716 + _704;
    always @(posedge _114) begin
        if (_112)
            _720 <= _856;
        else
            _720 <= _717;
    end
    assign _721 = _720 < _660;
    assign _722 = ~ _721;
    assign _711 = _638[41:26];
    assign _713 = _711 == _899;
    assign _695 = _665[0:0];
    assign _697 = _695 ? _394 : _1044;
    assign _692 = _665[1:1];
    assign _694 = _692 ? _373 : _1044;
    assign _698 = _694 < _697;
    assign _699 = _698 ? _697 : _694;
    assign _687 = _665[2:2];
    assign _689 = _687 ? _350 : _1044;
    assign _684 = _665[3:3];
    assign _686 = _684 ? _329 : _1044;
    assign _690 = _686 < _689;
    assign _691 = _690 ? _689 : _686;
    assign _700 = _691 < _699;
    assign _701 = _700 ? _699 : _691;
    assign _677 = _665[4:4];
    assign _679 = _677 ? _304 : _1044;
    assign _674 = _665[5:5];
    assign _676 = _674 ? _283 : _1044;
    assign _680 = _676 < _679;
    assign _681 = _680 ? _679 : _676;
    assign _669 = _665[6:6];
    assign _671 = _669 ? _260 : _1044;
    assign _665 = _661[23:16];
    assign _666 = _665[7:7];
    assign _668 = _666 ? _239 : _1044;
    assign _672 = _668 < _671;
    assign _673 = _672 ? _671 : _668;
    assign _682 = _673 < _681;
    assign _683 = _682 ? _681 : _673;
    assign _702 = _683 < _701;
    assign _703 = _702 ? _701 : _683;
    assign _704 = { _801,
                    _703 };
    assign _661 = _214[399:288];
    assign _662 = _661[41:26];
    assign _663 = { gnd,
                    _662 };
    assign _705 = _663 + _704;
    always @(posedge _114) begin
        if (_112)
            _708 <= _856;
        else
            _708 <= _705;
    end
    assign _660 = { gnd,
                    _657 };
    assign _709 = _660 < _708;
    assign _710 = ~ _709;
    assign _714 = _710 | _713;
    assign _723 = _714 & _722;
    assign _656 = _638[25:24];
    always @* begin
        case (_656)
        0:
            _657 <= _181;
        1:
            _657 <= _184;
        2:
            _657 <= _187;
        default:
            _657 <= _187;
        endcase
    end
    assign _659 = _657 == _1033;
    assign _727 = _659 ? _726 : _723;
    assign _650 = _171 & _647;
    assign _652 = _650 == _1092;
    assign _653 = ~ _652;
    assign _647 = _638[23:16];
    assign _649 = _647 == _1092;
    assign _654 = _649 | _653;
    assign _642 = _638[7:0];
    assign _640 = _638[15:8];
    assign _641 = _153 ^ _640;
    assign _643 = _641 & _642;
    assign _645 = _643 == _1092;
    assign _639 = _638[111:111];
    assign _646 = _639 & _645;
    assign _655 = _646 & _654;
    assign _728 = _655 & _727;
    assign _733 = _728 & _732;
    assign _772 = _733 & _771;
    assign _773 = _132 & _772;
    assign _922 = _773 ? _1084 : _1005;
    assign _630 = _587 == _1033;
    assign _626 = _587 == _899;
    assign _627 = _626 & _607;
    assign _624 = _523 == _583;
    assign _628 = _624 | _627;
    assign _631 = _522 ? _630 : _628;
    assign _621 = _447[3:0];
    assign _623 = _621 == _1019;
    assign _632 = _623 | _631;
    assign _619 = _587 == _1033;
    assign _615 = _587 == _899;
    assign _616 = _615 & _607;
    assign _613 = _523 == _583;
    assign _617 = _613 | _616;
    assign _620 = _522 ? _619 : _617;
    assign _611 = _574 == _1033;
    always @(posedge _114) begin
        if (_112)
            _605 <= _1044;
        else
            _605 <= _566;
    end
    assign _606 = { _1051,
                    _605 };
    assign _607 = _520 < _606;
    assign _601 = _574 == _899;
    assign _608 = _601 & _607;
    assign _599 = _523 == _571;
    assign _609 = _599 | _608;
    assign _612 = _522 ? _611 : _609;
    assign _598 = _501[104:103];
    always @* begin
        case (_598)
        0:
            _633 <= vdd;
        1:
            _633 <= _612;
        2:
            _633 <= _620;
        default:
            _633 <= _632;
        endcase
    end
    assign _65 = host_role;
    assign _1445 = _124 ? _65 : _458;
    assign _66 = _1445;
    always @(posedge _114) begin
        if (_112)
            _458 <= _1353;
        else
            _458 <= _66;
    end
    assign _460 = _458 == _1084;
    assign _597 = ~ _460;
    assign _634 = _597 | _633;
    assign _594 = _501[62:62];
    assign _68 = host_match_addr;
    assign _450 = _68[6:0];
    assign _449 = _439[7:1];
    assign _451 = _449 == _450;
    assign _446 = 16'b1010110011100001;
    assign _1450 = _447[10:10];
    assign _1449 = _447[12:12];
    assign _1451 = _1449 ^ _1450;
    assign _1448 = _447[13:13];
    assign _1452 = _1448 ^ _1451;
    assign _1447 = _447[15:15];
    assign _1453 = _1447 ^ _1452;
    assign _1446 = _447[14:0];
    assign _1454 = { _1446,
                     _1453 };
    assign _69 = _1454;
    always @(posedge _114) begin
        if (_112)
            _447 <= _446;
        else
            _447 <= _69;
    end
    assign _448 = _447[0:0];
    assign _1469 = _73 + _1221;
    assign _1467 = _73 - _1221;
    assign _1470 = _1284 ? _1469 : _1467;
    assign _1017 = _73 == _1019;
    assign _1291 = ~ _1017;
    assign _71 = host_rx_pop;
    assign _1292 = _71 & _1291;
    assign _1283 = ~ _444;
    assign _1463 = _1461 == _1005;
    assign _1464 = _1367 & _1463;
    assign _72 = _1464;
    assign _1284 = _72 & _1283;
    assign _1465 = _1284 ^ _1292;
    assign _1471 = _1465 ? _1470 : _73;
    always @(posedge _114) begin
        if (_112)
            _1474 <= _1019;
        else
            _1474 <= _1471;
    end
    assign _73 = _1474;
    assign _444 = _73 == _941;
    assign _1491 = _439[6:0];
    assign _1492 = { _1491,
                     _1488 };
    assign _1489 = _439[7:1];
    assign _1487 = _153[7:7];
    assign _1486 = _153[6:6];
    assign _1485 = _153[5:5];
    assign _1484 = _153[4:4];
    assign _1483 = _153[3:3];
    assign _1482 = _153[2:2];
    assign _1481 = _153[1:1];
    assign _1480 = _153[0:0];
    assign _1478 = _775[102:100];
    assign _1477 = _638[102:100];
    assign _1476 = _501[102:100];
    assign _1475 = _146[102:100];
    always @* begin
        case (_926)
        0:
            _1479 <= _1475;
        1:
            _1479 <= _1476;
        2:
            _1479 <= _1477;
        default:
            _1479 <= _1478;
        endcase
    end
    always @* begin
        case (_1479)
        0:
            _1488 <= _1480;
        1:
            _1488 <= _1481;
        2:
            _1488 <= _1482;
        3:
            _1488 <= _1483;
        4:
            _1488 <= _1484;
        5:
            _1488 <= _1485;
        6:
            _1488 <= _1486;
        default:
            _1488 <= _1487;
        endcase
    end
    assign _1490 = { _1488,
                     _1489 };
    assign _1458 = _775[97:96];
    assign _1457 = _638[97:96];
    assign _1456 = _501[97:96];
    assign _1455 = _146[97:96];
    always @* begin
        case (_926)
        0:
            _1459 <= _1455;
        1:
            _1459 <= _1456;
        2:
            _1459 <= _1457;
        default:
            _1459 <= _1458;
        endcase
    end
    assign _1461 = _964 ? _1353 : _1459;
    always @* begin
        case (_1461)
        0:
            _1493 <= _439;
        1:
            _1493 <= _1490;
        2:
            _1493 <= _1492;
        default:
            _1493 <= _439;
        endcase
    end
    assign _1494 = _1367 ? _1493 : _439;
    assign _74 = _1494;
    always @(posedge _114) begin
        if (_112)
            _439 <= _1092;
        else
            _439 <= _74;
    end
    assign _440 = _439[0:0];
    assign _1594 = _435[7:1];
    assign _1595 = { vdd,
                     _1594 };
    assign _1592 = _1584[7:7];
    assign _1591 = _1584[6:6];
    assign _1590 = _1584[5:5];
    assign _1589 = _1584[4:4];
    assign _1588 = _1584[3:3];
    assign _1587 = _1584[2:2];
    assign _1586 = _1584[1:1];
    assign _1585 = _1584[0:0];
    assign _1593 = { _1585,
                     _1586,
                     _1587,
                     _1588,
                     _1589,
                     _1590,
                     _1591,
                     _1592 };
    assign _1579 = _1499 == _1278;
    assign _1580 = _1496 & _1579;
    always @(posedge _114) begin
        if (_112)
            _1581 <= _1092;
        else
            if (_1580)
                _1581 <= _77;
    end
    assign _1573 = _1499 == _1272;
    assign _1574 = _1496 & _1573;
    always @(posedge _114) begin
        if (_112)
            _1575 <= _1092;
        else
            if (_1574)
                _1575 <= _77;
    end
    assign _1567 = _1499 == _1266;
    assign _1568 = _1496 & _1567;
    always @(posedge _114) begin
        if (_112)
            _1569 <= _1092;
        else
            if (_1568)
                _1569 <= _77;
    end
    assign _1561 = _1499 == _1260;
    assign _1562 = _1496 & _1561;
    always @(posedge _114) begin
        if (_112)
            _1563 <= _1092;
        else
            if (_1562)
                _1563 <= _77;
    end
    assign _1555 = _1499 == _1254;
    assign _1556 = _1496 & _1555;
    always @(posedge _114) begin
        if (_112)
            _1557 <= _1092;
        else
            if (_1556)
                _1557 <= _77;
    end
    assign _1549 = _1499 == _1248;
    assign _1550 = _1496 & _1549;
    always @(posedge _114) begin
        if (_112)
            _1551 <= _1092;
        else
            if (_1550)
                _1551 <= _77;
    end
    assign _1543 = _1499 == _1242;
    assign _1544 = _1496 & _1543;
    always @(posedge _114) begin
        if (_112)
            _1545 <= _1092;
        else
            if (_1544)
                _1545 <= _77;
    end
    assign _1501 = _1499 + _1242;
    assign _1502 = _1496 ? _1501 : _1499;
    assign _75 = _1502;
    always @(posedge _114) begin
        if (_112)
            _1499 <= _1044;
        else
            _1499 <= _75;
    end
    assign _1537 = _1499 == _1044;
    assign _1538 = _1496 & _1537;
    assign _77 = host_tx_data;
    always @(posedge _114) begin
        if (_112)
            _1539 <= _1092;
        else
            if (_1538)
                _1539 <= _77;
    end
    assign _1509 = _1507 + _1242;
    assign _1510 = _1504 ? _1509 : _1507;
    assign _78 = _1510;
    always @(posedge _114) begin
        if (_112)
            _1507 <= _1044;
        else
            _1507 <= _78;
    end
    always @* begin
        case (_1507)
        0:
            _1582 <= _1539;
        1:
            _1582 <= _1545;
        2:
            _1582 <= _1551;
        3:
            _1582 <= _1557;
        4:
            _1582 <= _1563;
        5:
            _1582 <= _1569;
        6:
            _1582 <= _1575;
        default:
            _1582 <= _1581;
        endcase
    end
    assign _1528 = _82 + _1221;
    assign _1526 = _82 - _1221;
    assign _1529 = _1496 ? _1528 : _1526;
    assign _1503 = ~ _442;
    assign _1521 = _1517 == _1084;
    assign _1519 = _1517 == _1083;
    assign _1522 = _1519 | _1521;
    assign _1523 = _1367 & _1522;
    assign _79 = _1523;
    assign _1504 = _79 & _1503;
    assign _1349 = _82 == _941;
    assign _1495 = ~ _1349;
    assign _81 = host_tx_push;
    assign _1496 = _81 & _1495;
    assign _1524 = _1496 ^ _1504;
    assign _1530 = _1524 ? _1529 : _82;
    always @(posedge _114) begin
        if (_112)
            _1533 <= _1019;
        else
            _1533 <= _1530;
    end
    assign _82 = _1533;
    assign _442 = _82 == _1019;
    assign _1584 = _442 ? _1090 : _1582;
    assign _1516 = _965[28:27];
    assign _1514 = _775[95:94];
    assign _1513 = _638[95:94];
    assign _1512 = _501[95:94];
    assign _1511 = _146[95:94];
    always @* begin
        case (_926)
        0:
            _1515 <= _1511;
        1:
            _1515 <= _1512;
        2:
            _1515 <= _1513;
        default:
            _1515 <= _1514;
        endcase
    end
    assign _1517 = _964 ? _1516 : _1515;
    always @* begin
        case (_1517)
        0:
            _1596 <= _435;
        1:
            _1596 <= _1584;
        2:
            _1596 <= _1593;
        default:
            _1596 <= _1595;
        endcase
    end
    assign _1597 = _1367 ? _1596 : _435;
    assign _83 = _1597;
    always @(posedge _114) begin
        if (_112)
            _435 <= _1092;
        else
            _435 <= _83;
    end
    assign _436 = _435[0:0];
    assign _1608 = 8'b00001000;
    assign _1607 = 8'b00000111;
    assign _1605 = 8'b00000001;
    assign _1606 = _430 - _1605;
    assign _1603 = _965[30:29];
    assign _1601 = _775[99:98];
    assign _1600 = _638[99:98];
    assign _1599 = _501[99:98];
    assign _1598 = _146[99:98];
    always @* begin
        case (_926)
        0:
            _1602 <= _1598;
        1:
            _1602 <= _1599;
        2:
            _1602 <= _1600;
        default:
            _1602 <= _1601;
        endcase
    end
    assign _1604 = _964 ? _1603 : _1602;
    always @* begin
        case (_1604)
        0:
            _1609 <= _430;
        1:
            _1609 <= _1606;
        2:
            _1609 <= _1607;
        default:
            _1609 <= _1608;
        endcase
    end
    assign _1610 = _1367 ? _1609 : _430;
    assign _84 = _1610;
    always @(posedge _114) begin
        if (_112)
            _430 <= _1092;
        else
            _430 <= _84;
    end
    assign _432 = _430 == _1092;
    assign _592 = _501[61:58];
    always @* begin
        case (_592)
        0:
            _593 <= vdd;
        1:
            _593 <= _432;
        2:
            _593 <= _436;
        3:
            _593 <= _440;
        4:
            _593 <= _442;
        5:
            _593 <= _444;
        6:
            _593 <= _448;
        7:
            _593 <= _451;
        8:
            _593 <= gnd;
        9:
            _593 <= gnd;
        10:
            _593 <= gnd;
        11:
            _593 <= gnd;
        12:
            _593 <= gnd;
        13:
            _593 <= gnd;
        14:
            _593 <= gnd;
        default:
            _593 <= gnd;
        endcase
    end
    assign _595 = _593 ^ _594;
    assign _587 = _501[57:42];
    assign _589 = _587 == _1033;
    assign _578 = _524[57:42];
    assign _579 = { gnd,
                    _578 };
    assign _580 = _579 + _567;
    always @(posedge _114) begin
        if (_112)
            _583 <= _856;
        else
            _583 <= _580;
    end
    assign _584 = _583 < _523;
    assign _585 = ~ _584;
    assign _574 = _501[41:26];
    assign _576 = _574 == _899;
    assign _390 = _386 + _1242;
    assign _1626 = _386 + _1242;
    assign _1622 = _386 == _1278;
    assign _1623 = ~ _1622;
    assign _1620 = _166[0:0];
    assign _1624 = _1620 & _1623;
    assign _1627 = _1624 ? _1626 : _386;
    assign _1617 = _166[0:0];
    assign _1618 = ~ _1617;
    assign _1616 = _170[0:0];
    assign _1619 = _1616 & _1618;
    assign _1629 = _1619 ? _1242 : _1627;
    assign _1613 = _130 == _1084;
    assign _1615 = _1613 ? _1044 : _386;
    assign _1612 = _130 == _1083;
    assign _1630 = _1612 ? _1629 : _1615;
    assign _85 = _1630;
    always @(posedge _114) begin
        if (_112)
            _386 <= _1044;
        else
            _386 <= _85;
    end
    assign _388 = _386 == _1278;
    assign _391 = _388 ? _386 : _390;
    assign _381 = _166[0:0];
    assign _382 = ~ _381;
    assign _380 = _170[0:0];
    assign _383 = _380 & _382;
    assign _393 = _383 ? _1242 : _391;
    assign _377 = _171[0:0];
    assign _378 = _194 & _377;
    assign _394 = _378 ? _393 : _1044;
    assign _558 = _528[0:0];
    assign _560 = _558 ? _394 : _1044;
    assign _369 = _365 + _1242;
    assign _1645 = _365 + _1242;
    assign _1641 = _365 == _1278;
    assign _1642 = ~ _1641;
    assign _1639 = _166[1:1];
    assign _1643 = _1639 & _1642;
    assign _1646 = _1643 ? _1645 : _365;
    assign _1636 = _166[1:1];
    assign _1637 = ~ _1636;
    assign _1635 = _170[1:1];
    assign _1638 = _1635 & _1637;
    assign _1648 = _1638 ? _1242 : _1646;
    assign _1632 = _130 == _1084;
    assign _1634 = _1632 ? _1044 : _365;
    assign _1631 = _130 == _1083;
    assign _1649 = _1631 ? _1648 : _1634;
    assign _86 = _1649;
    always @(posedge _114) begin
        if (_112)
            _365 <= _1044;
        else
            _365 <= _86;
    end
    assign _367 = _365 == _1278;
    assign _370 = _367 ? _365 : _369;
    assign _360 = _166[1:1];
    assign _361 = ~ _360;
    assign _359 = _170[1:1];
    assign _362 = _359 & _361;
    assign _372 = _362 ? _1242 : _370;
    assign _356 = _171[1:1];
    assign _357 = _194 & _356;
    assign _373 = _357 ? _372 : _1044;
    assign _555 = _528[1:1];
    assign _557 = _555 ? _373 : _1044;
    assign _561 = _557 < _560;
    assign _562 = _561 ? _560 : _557;
    assign _346 = _342 + _1242;
    assign _1664 = _342 + _1242;
    assign _1660 = _342 == _1278;
    assign _1661 = ~ _1660;
    assign _1658 = _166[2:2];
    assign _1662 = _1658 & _1661;
    assign _1665 = _1662 ? _1664 : _342;
    assign _1655 = _166[2:2];
    assign _1656 = ~ _1655;
    assign _1654 = _170[2:2];
    assign _1657 = _1654 & _1656;
    assign _1667 = _1657 ? _1242 : _1665;
    assign _1651 = _130 == _1084;
    assign _1653 = _1651 ? _1044 : _342;
    assign _1650 = _130 == _1083;
    assign _1668 = _1650 ? _1667 : _1653;
    assign _87 = _1668;
    always @(posedge _114) begin
        if (_112)
            _342 <= _1044;
        else
            _342 <= _87;
    end
    assign _344 = _342 == _1278;
    assign _347 = _344 ? _342 : _346;
    assign _337 = _166[2:2];
    assign _338 = ~ _337;
    assign _336 = _170[2:2];
    assign _339 = _336 & _338;
    assign _349 = _339 ? _1242 : _347;
    assign _333 = _171[2:2];
    assign _334 = _194 & _333;
    assign _350 = _334 ? _349 : _1044;
    assign _550 = _528[2:2];
    assign _552 = _550 ? _350 : _1044;
    assign _325 = _321 + _1242;
    assign _1683 = _321 + _1242;
    assign _1679 = _321 == _1278;
    assign _1680 = ~ _1679;
    assign _1677 = _166[3:3];
    assign _1681 = _1677 & _1680;
    assign _1684 = _1681 ? _1683 : _321;
    assign _1674 = _166[3:3];
    assign _1675 = ~ _1674;
    assign _1673 = _170[3:3];
    assign _1676 = _1673 & _1675;
    assign _1686 = _1676 ? _1242 : _1684;
    assign _1670 = _130 == _1084;
    assign _1672 = _1670 ? _1044 : _321;
    assign _1669 = _130 == _1083;
    assign _1687 = _1669 ? _1686 : _1672;
    assign _88 = _1687;
    always @(posedge _114) begin
        if (_112)
            _321 <= _1044;
        else
            _321 <= _88;
    end
    assign _323 = _321 == _1278;
    assign _326 = _323 ? _321 : _325;
    assign _316 = _166[3:3];
    assign _317 = ~ _316;
    assign _315 = _170[3:3];
    assign _318 = _315 & _317;
    assign _328 = _318 ? _1242 : _326;
    assign _312 = _171[3:3];
    assign _313 = _194 & _312;
    assign _329 = _313 ? _328 : _1044;
    assign _547 = _528[3:3];
    assign _549 = _547 ? _329 : _1044;
    assign _553 = _549 < _552;
    assign _554 = _553 ? _552 : _549;
    assign _563 = _554 < _562;
    assign _564 = _563 ? _562 : _554;
    assign _300 = _296 + _1242;
    assign _1702 = _296 + _1242;
    assign _1698 = _296 == _1278;
    assign _1699 = ~ _1698;
    assign _1696 = _166[4:4];
    assign _1700 = _1696 & _1699;
    assign _1703 = _1700 ? _1702 : _296;
    assign _1693 = _166[4:4];
    assign _1694 = ~ _1693;
    assign _1692 = _170[4:4];
    assign _1695 = _1692 & _1694;
    assign _1705 = _1695 ? _1242 : _1703;
    assign _1689 = _130 == _1084;
    assign _1691 = _1689 ? _1044 : _296;
    assign _1688 = _130 == _1083;
    assign _1706 = _1688 ? _1705 : _1691;
    assign _89 = _1706;
    always @(posedge _114) begin
        if (_112)
            _296 <= _1044;
        else
            _296 <= _89;
    end
    assign _298 = _296 == _1278;
    assign _301 = _298 ? _296 : _300;
    assign _291 = _166[4:4];
    assign _292 = ~ _291;
    assign _290 = _170[4:4];
    assign _293 = _290 & _292;
    assign _303 = _293 ? _1242 : _301;
    assign _287 = _171[4:4];
    assign _288 = _194 & _287;
    assign _304 = _288 ? _303 : _1044;
    assign _540 = _528[4:4];
    assign _542 = _540 ? _304 : _1044;
    assign _279 = _275 + _1242;
    assign _1721 = _275 + _1242;
    assign _1717 = _275 == _1278;
    assign _1718 = ~ _1717;
    assign _1715 = _166[5:5];
    assign _1719 = _1715 & _1718;
    assign _1722 = _1719 ? _1721 : _275;
    assign _1712 = _166[5:5];
    assign _1713 = ~ _1712;
    assign _1711 = _170[5:5];
    assign _1714 = _1711 & _1713;
    assign _1724 = _1714 ? _1242 : _1722;
    assign _1708 = _130 == _1084;
    assign _1710 = _1708 ? _1044 : _275;
    assign _1707 = _130 == _1083;
    assign _1725 = _1707 ? _1724 : _1710;
    assign _90 = _1725;
    always @(posedge _114) begin
        if (_112)
            _275 <= _1044;
        else
            _275 <= _90;
    end
    assign _277 = _275 == _1278;
    assign _280 = _277 ? _275 : _279;
    assign _270 = _166[5:5];
    assign _271 = ~ _270;
    assign _269 = _170[5:5];
    assign _272 = _269 & _271;
    assign _282 = _272 ? _1242 : _280;
    assign _266 = _171[5:5];
    assign _267 = _194 & _266;
    assign _283 = _267 ? _282 : _1044;
    assign _537 = _528[5:5];
    assign _539 = _537 ? _283 : _1044;
    assign _543 = _539 < _542;
    assign _544 = _543 ? _542 : _539;
    assign _256 = _252 + _1242;
    assign _1740 = _252 + _1242;
    assign _1736 = _252 == _1278;
    assign _1737 = ~ _1736;
    assign _1734 = _166[6:6];
    assign _1738 = _1734 & _1737;
    assign _1741 = _1738 ? _1740 : _252;
    assign _1731 = _166[6:6];
    assign _1732 = ~ _1731;
    assign _1730 = _170[6:6];
    assign _1733 = _1730 & _1732;
    assign _1743 = _1733 ? _1242 : _1741;
    assign _1727 = _130 == _1084;
    assign _1729 = _1727 ? _1044 : _252;
    assign _1726 = _130 == _1083;
    assign _1744 = _1726 ? _1743 : _1729;
    assign _91 = _1744;
    always @(posedge _114) begin
        if (_112)
            _252 <= _1044;
        else
            _252 <= _91;
    end
    assign _254 = _252 == _1278;
    assign _257 = _254 ? _252 : _256;
    assign _247 = _166[6:6];
    assign _248 = ~ _247;
    assign _246 = _170[6:6];
    assign _249 = _246 & _248;
    assign _259 = _249 ? _1242 : _257;
    assign _243 = _171[6:6];
    assign _244 = _194 & _243;
    assign _260 = _244 ? _259 : _1044;
    assign _532 = _528[6:6];
    assign _534 = _532 ? _260 : _1044;
    assign _235 = _231 + _1242;
    assign _1759 = _231 + _1242;
    assign _1755 = _231 == _1278;
    assign _1756 = ~ _1755;
    assign _1753 = _166[7:7];
    assign _1757 = _1753 & _1756;
    assign _1760 = _1757 ? _1759 : _231;
    assign _1750 = _166[7:7];
    assign _1751 = ~ _1750;
    assign _1749 = _170[7:7];
    assign _1752 = _1749 & _1751;
    assign _1762 = _1752 ? _1242 : _1760;
    assign _1746 = _130 == _1084;
    assign _1748 = _1746 ? _1044 : _231;
    assign _1745 = _130 == _1083;
    assign _1763 = _1745 ? _1762 : _1748;
    assign _92 = _1763;
    always @(posedge _114) begin
        if (_112)
            _231 <= _1044;
        else
            _231 <= _92;
    end
    assign _233 = _231 == _1278;
    assign _236 = _233 ? _231 : _235;
    assign _226 = _166[7:7];
    assign _227 = ~ _226;
    assign _225 = _170[7:7];
    assign _228 = _225 & _227;
    assign _238 = _228 ? _1242 : _236;
    assign _222 = _171[7:7];
    assign _223 = _194 & _222;
    assign _239 = _223 ? _238 : _1044;
    assign _528 = _524[23:16];
    assign _529 = _528[7:7];
    assign _531 = _529 ? _239 : _1044;
    assign _535 = _531 < _534;
    assign _536 = _535 ? _534 : _531;
    assign _545 = _536 < _544;
    assign _546 = _545 ? _544 : _536;
    assign _565 = _546 < _564;
    assign _566 = _565 ? _564 : _546;
    assign _567 = { _801,
                    _566 };
    assign _1766 = _197 == _1242;
    assign _1767 = _1766 ? _107 : _144;
    assign _1764 = _130 == _1083;
    assign _1768 = _1764 ? _1767 : _144;
    assign _93 = _1768;
    always @(posedge _114) begin
        if (_112)
            _144 <= _134;
        else
            _144 <= _93;
    end
    assign _211 = _197 == _1242;
    assign _212 = _194 & _211;
    assign _213 = _212 ? _107 : _144;
    assign _1771 = _197 == _1248;
    assign _1772 = _1771 ? _107 : _141;
    assign _1769 = _130 == _1083;
    assign _1773 = _1769 ? _1772 : _141;
    assign _94 = _1773;
    always @(posedge _114) begin
        if (_112)
            _141 <= _134;
        else
            _141 <= _94;
    end
    assign _207 = _197 == _1248;
    assign _208 = _194 & _207;
    assign _209 = _208 ? _107 : _141;
    assign _1776 = _197 == _1254;
    assign _1777 = _1776 ? _107 : _138;
    assign _1774 = _130 == _1083;
    assign _1778 = _1774 ? _1777 : _138;
    assign _95 = _1778;
    always @(posedge _114) begin
        if (_112)
            _138 <= _134;
        else
            _138 <= _95;
    end
    assign _203 = _197 == _1254;
    assign _204 = _194 & _203;
    assign _205 = _204 ? _107 : _138;
    assign _1117 = _130 == _1353;
    assign _97 = host_rec_we;
    assign _1801 = _97 & _1117;
    assign _99 = host_rec_wdata;
    always @(posedge _114) begin
        if (_1801)
            _1802[_1800] <= _99;
    end
    assign _1798 = _197[1:0];
    assign _918 = 6'b000000;
    assign _101 = host_start_loc;
    assign _775 = _145[511:400];
    assign _1787 = _775[110:105];
    assign _638 = _145[399:288];
    assign _1786 = _638[110:105];
    assign _1785 = _501[110:105];
    assign _1784 = _146[110:105];
    always @* begin
        case (_926)
        0:
            _1788 <= _1784;
        1:
            _1788 <= _1785;
        2:
            _1788 <= _1786;
        default:
            _1788 <= _1787;
        endcase
    end
    assign _1789 = _1788 == _919;
    assign _1790 = ~ _1789;
    assign _1791 = _1790 ? _1788 : _919;
    assign _103 = host_recover_loc;
    assign _1002 = _965[59:58];
    assign _1781 = _1002 == _1084;
    assign _1782 = _1781 ? _103 : _919;
    assign _1783 = _1001 ? _1782 : _919;
    assign _1792 = _911 ? _1791 : _1783;
    assign _1779 = _130 == _1084;
    assign _1793 = _1779 ? _1792 : _919;
    assign _1794 = _124 ? _101 : _1793;
    assign _104 = _1794;
    always @(posedge _114) begin
        if (_112)
            _919 <= _918;
        else
            _919 <= _104;
    end
    assign _1799 = { _919,
                     _1798 };
    assign _106 = host_rec_waddr;
    assign _1796 = _197 < _1260;
    assign _1797 = _194 & _1796;
    assign _1800 = _1797 ? _1799 : _106;
    assign _1803 = _1802[_1800];
    always @(posedge _114) begin
        if (_1797)
            _1806 <= _1803;
    end
    assign _107 = _1806;
    assign _199 = _197 == _1260;
    assign _200 = _194 & _199;
    assign _201 = _200 ? _107 : _135;
    assign _214 = { _201,
                    _205,
                    _209,
                    _213 };
    assign _524 = _214[287:176];
    assign _525 = _524[41:26];
    assign _526 = { gnd,
                    _525 };
    assign _568 = _526 + _567;
    always @(posedge _114) begin
        if (_112)
            _571 <= _856;
        else
            _571 <= _568;
    end
    assign gnd = 1'b0;
    assign _523 = { gnd,
                    _520 };
    assign _572 = _523 < _571;
    assign _573 = ~ _572;
    assign _577 = _573 | _576;
    assign _586 = _577 & _585;
    assign _1820 = _187 + _1850;
    assign _1817 = _187 == _1033;
    assign _1818 = ~ _1817;
    assign _1821 = _1818 ? _1820 : _187;
    assign _1814 = _1813[2:2];
    assign _1815 = _1367 & _1814;
    assign _1823 = _1815 ? _899 : _1821;
    assign _1825 = _124 ? _899 : _1823;
    assign _108 = _1825;
    always @(posedge _114) begin
        if (_112)
            _187 <= _899;
        else
            _187 <= _108;
    end
    assign _1832 = _184 + _1850;
    assign _1829 = _184 == _1033;
    assign _1830 = ~ _1829;
    assign _1833 = _1830 ? _1832 : _184;
    assign _1826 = _1813[1:1];
    assign _1827 = _1367 & _1826;
    assign _1835 = _1827 ? _899 : _1833;
    assign _1837 = _124 ? _899 : _1835;
    assign _109 = _1837;
    always @(posedge _114) begin
        if (_112)
            _184 <= _899;
        else
            _184 <= _109;
    end
    assign _519 = _501[25:24];
    always @* begin
        case (_519)
        0:
            _520 <= _181;
        1:
            _520 <= _184;
        2:
            _520 <= _187;
        default:
            _520 <= _187;
        endcase
    end
    assign _522 = _520 == _1033;
    assign _590 = _522 ? _589 : _586;
    always @(posedge _114) begin
        if (_112)
            _169 <= _1092;
        else
            _169 <= _153;
    end
    assign _170 = _153 ^ _169;
    assign _1839 = _130 == _1084;
    assign _1841 = _1839 ? _1092 : _166;
    assign _1838 = _130 == _1083;
    assign _1842 = _1838 ? _171 : _1841;
    assign _1844 = _124 ? _1092 : _1842;
    assign _110 = _1844;
    always @(posedge _114) begin
        if (_112)
            _166 <= _1092;
        else
            _166 <= _110;
    end
    assign _171 = _166 | _170;
    assign _513 = _171 & _510;
    assign _515 = _513 == _1092;
    assign _516 = ~ _515;
    assign _510 = _501[23:16];
    assign _512 = _510 == _1092;
    assign _517 = _512 | _516;
    assign _505 = _501[7:0];
    assign _503 = _501[15:8];
    assign vdd = 1'b1;
    assign _112 = clear;
    assign _114 = clock;
    assign _116 = pins_in;
    always @(posedge _114) begin
        if (_112)
            _150 <= _1092;
        else
            _150 <= _116;
    end
    always @(posedge _114) begin
        if (_112)
            _153 <= _1092;
        else
            _153 <= _150;
    end
    assign _504 = _153 ^ _503;
    assign _506 = _504 & _505;
    assign _508 = _506 == _1092;
    assign _501 = _145[287:176];
    assign _502 = _501[111:111];
    assign _509 = _502 & _508;
    assign _518 = _509 & _517;
    assign _591 = _518 & _590;
    assign _596 = _591 & _595;
    assign _635 = _596 & _634;
    assign _636 = _132 & _635;
    assign _924 = _636 ? _1083 : _922;
    assign _926 = _500 ? _1353 : _924;
    always @* begin
        case (_926)
        0:
            _1811 <= _1807;
        1:
            _1811 <= _1808;
        2:
            _1811 <= _1809;
        default:
            _1811 <= _1810;
        endcase
    end
    assign _1813 = _964 ? _1812 : _1811;
    assign _1845 = _1813[0:0];
    assign _1846 = _1367 & _1845;
    assign _1854 = _1846 ? _899 : _1852;
    assign _1856 = _124 ? _899 : _1854;
    assign _117 = _1856;
    always @(posedge _114) begin
        if (_112)
            _181 <= _899;
        else
            _181 <= _117;
    end
    assign _984 = _965[33:32];
    always @* begin
        case (_984)
        0:
            _985 <= _181;
        1:
            _985 <= _184;
        2:
            _985 <= _187;
        default:
            _985 <= _187;
        endcase
    end
    assign _983 = _965[49:34];
    assign _986 = _983 < _985;
    assign _965 = _145[63:0];
    assign _981 = _965[31:31];
    assign _979 = ~ _911;
    assign _980 = _132 & _979;
    assign _982 = _980 & _981;
    assign _987 = _982 & _986;
    assign _992 = _987 & _991;
    assign _1001 = _992 | _1000;
    assign _1862 = _1001 ? _1861 : _197;
    assign _1865 = _911 ? _1864 : _1862;
    assign _1858 = _130 == _1084;
    assign _1866 = _1858 ? _1865 : _197;
    assign _1857 = _130 == _1083;
    assign _1869 = _1857 ? _1868 : _1866;
    assign _1871 = _124 ? _1044 : _1869;
    assign _118 = _1871;
    always @(posedge _114) begin
        if (_112)
            _197 <= _1044;
        else
            _197 <= _118;
    end
    assign _1874 = _197 == _1260;
    assign _1875 = _1874 ? _107 : _135;
    assign _1872 = _130 == _1083;
    assign _1876 = _1872 ? _1875 : _135;
    assign _119 = _1876;
    always @(posedge _114) begin
        if (_112)
            _135 <= _134;
        else
            _135 <= _119;
    end
    assign _145 = { _135,
                    _138,
                    _141,
                    _144 };
    assign _146 = _145[175:64];
    assign _147 = _146[111:111];
    assign _160 = _147 & _159;
    assign _177 = _160 & _176;
    assign _426 = _177 & _425;
    assign _455 = _426 & _454;
    assign _499 = _455 & _498;
    assign _132 = _130 == _1084;
    assign _500 = _132 & _499;
    assign _637 = _500 | _636;
    assign _774 = _637 | _773;
    assign _911 = _774 | _910;
    assign _1895 = _911 ? _1894 : _1892;
    assign _1880 = _130 == _1005;
    assign _1882 = _1880 ? _1353 : _130;
    assign _1878 = _130 == _1084;
    assign _1896 = _1878 ? _1895 : _1882;
    assign _1877 = _130 == _1083;
    assign _1899 = _1877 ? _1898 : _1896;
    assign _121 = host_stop;
    assign _1901 = _121 ? _1353 : _1899;
    assign _1903 = _124 ? _1083 : _1901;
    assign _122 = _1903;
    always @(posedge _114) begin
        if (_112)
            _130 <= _1353;
        else
            _130 <= _122;
    end
    assign _194 = _130 == _1083;
    assign _964 = _194 & _963;
    assign _1367 = _964 | _911;
    assign _1371 = _1367 & _1370;
    assign _1925 = _1371 ? _1924 : _1434;
    assign _124 = host_start;
    assign _1927 = _124 ? _1092 : _1925;
    assign _125 = _1927;
    always @(posedge _114) begin
        if (_112)
            _1434 <= _1092;
        else
            _1434 <= _125;
    end
    assign _1929 = _1434 & _1928;
    assign pins_out = _1929;
    assign pins_oe = _1437;
    assign st_running = _1366;
    assign st_in_entry = _194;
    assign st_cur_loc = _919;
    assign st_accepting = _1365;
    assign st_taken = _1363;
    assign st_taken_edge = _1360;
    assign st_viol = _1357;
    assign st_viol_kind = _1354;
    assign st_timestamp = _1142;
    assign st_tx_full = _1349;
    assign st_tx_empty = _442;
    assign st_rx_data = _1347;
    assign st_rx_empty = _1017;
    assign st_vlog_data = _1282;
    assign st_vlog_empty = _1020;
    assign st_cov_rdata = _31;
    assign st_irq = _1024;
    assign st_halted_viol = _961;
    assign st_rx_overflow = _954;
    assign st_vlog_overflow = _946;
    assign st_cov_overrun = _936;

endmodule
