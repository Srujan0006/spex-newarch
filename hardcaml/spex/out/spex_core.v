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
    host_start_loc,
    host_recover_loc,
    host_role,
    host_match_addr,
    host_rx_pop,
    host_tx_data,
    host_tx_push,
    ram_rec_rdata,
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
    input [5:0] host_start_loc;
    input [5:0] host_recover_loc;
    input [1:0] host_role;
    input [7:0] host_match_addr;
    input host_rx_pop;
    input [7:0] host_tx_data;
    input host_tx_push;
    input [127:0] ram_rec_rdata;
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

    wire [11:0] _1018;
    wire _1015;
    wire _1016;
    wire [11:0] _1017;
    wire _1019;
    wire [11:0] _1020;
    wire [11:0] _1021;
    wire [11:0] _1007;
    wire [11:0] _867;
    wire [11:0] _864;
    wire [12:0] _861;
    wire [9:0] _858;
    wire [12:0] _859;
    wire [12:0] _860;
    wire [2:0] _854;
    reg [2:0] _833;
    wire [2:0] _1;
    reg [2:0] _855;
    wire [12:0] _856;
    wire [12:0] _841;
    wire [12:0] _840;
    wire [15:0] _834;
    wire _839;
    wire [12:0] _842;
    wire [12:0] _2;
    reg [12:0] _851;
    wire _857;
    wire [12:0] _862;
    wire [12:0] _848;
    wire _863;
    wire [11:0] _866;
    wire _846;
    wire [15:0] _843;
    wire _844;
    wire _3;
    reg _847;
    wire [11:0] _868;
    wire [11:0] _4;
    reg [11:0] _1008;
    wire [11:0] _871;
    reg [1:0] _837;
    reg [15:0] _838;
    wire [15:0] _869;
    wire _870;
    wire [11:0] _873;
    wire [11:0] _5;
    reg [11:0] _1005;
    wire _1009;
    wire _1010;
    wire [11:0] _1011;
    wire [11:0] _1002;
    wire _1012;
    wire [11:0] _1013;
    wire [7:0] _1000;
    wire _1001;
    wire [11:0] _1014;
    wire [7:0] _998;
    wire [7:0] _997;
    wire [1:0] _992;
    wire [1:0] _991;
    wire _980;
    wire _972;
    wire _981;
    wire _6;
    reg _990;
    wire [1:0] _993;
    wire [6:0] _987;
    wire [8:0] _994;
    wire [7:0] _985;
    wire [8:0] _986;
    wire [8:0] _995;
    wire _996;
    wire [7:0] _999;
    wire [31:0] _1022;
    wire [31:0] _8;
    wire [31:0] _1023;
    wire _1031;
    wire _1029;
    wire _1027;
    wire _12;
    wire _1026;
    wire _1028;
    wire _1030;
    wire _1033;
    wire _1032;
    wire _1034;
    wire [7:0] _14;
    reg [7:0] _1038;
    wire [7:0] _16;
    wire [7:0] _1035;
    wire _17;
    reg _984;
    wire [7:0] _1039;
    wire [127:0] _20;
    wire _23;
    wire _1040;
    wire [1:0] _1044;
    wire [7:0] _1045;
    wire [7:0] _27;
    wire [2:0] _1041;
    wire _1042;
    wire _1043;
    wire [7:0] _1046;
    wire _1056;
    wire [7:0] _29;
    reg [7:0] _979;
    wire [7:0] _976;
    wire _1050;
    wire _1051;
    wire _1047;
    wire _1048;
    wire _30;
    reg _971;
    wire _32;
    wire _968;
    wire _1049;
    wire _1052;
    wire _1057;
    wire _1059;
    wire _33;
    reg _1055;
    wire _1062;
    wire _1067;
    wire _1069;
    wire _35;
    reg _1065;
    wire _1070;
    wire _1075;
    wire _1077;
    wire _37;
    reg _1073;
    wire _1085;
    wire _1086;
    wire _1091;
    wire _41;
    wire _1093;
    wire _1095;
    wire _42;
    reg _1089;
    wire _1125;
    wire _1127;
    wire _1123;
    wire _1129;
    wire _1130;
    wire _1131;
    wire _1097;
    wire _1132;
    wire _1134;
    wire _43;
    reg _1080;
    wire _1140;
    wire _1137;
    wire _1141;
    wire _1142;
    wire _1143;
    wire [31:0] _46;
    wire [2:0] _1290;
    wire _1291;
    wire _1292;
    wire [47:0] _1289;
    reg [47:0] _1293;
    wire [2:0] _1284;
    wire _1285;
    wire _1286;
    reg [47:0] _1287;
    wire [2:0] _1278;
    wire _1279;
    wire _1280;
    reg [47:0] _1281;
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
    wire [2:0] _1150;
    wire [2:0] _1151;
    wire [2:0] _49;
    reg [2:0] _1148;
    wire _1249;
    wire _1250;
    wire [2:0] _1224;
    wire [28:0] _1159;
    wire [28:0] _1158;
    wire [28:0] _1161;
    wire [28:0] _1162;
    wire [2:0] _1155;
    wire _1157;
    wire [28:0] _1163;
    wire [28:0] _50;
    reg [28:0] _1160;
    wire [28:0] _1222;
    wire _1210;
    wire _1209;
    wire _1211;
    wire [2:0] _1213;
    wire _1205;
    wire _1204;
    wire _1206;
    wire [2:0] _1208;
    wire _1214;
    wire [2:0] _1215;
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
    wire _1216;
    wire [2:0] _1217;
    wire _1184;
    wire _1183;
    wire _1185;
    wire [2:0] _1187;
    wire _1179;
    wire _1178;
    wire _1180;
    wire [2:0] _1182;
    wire _1188;
    wire [2:0] _1189;
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
    wire _1190;
    wire [2:0] _1191;
    wire _1218;
    wire [2:0] _1219;
    wire [2:0] _1220;
    wire [2:0] _1164;
    wire _1221;
    wire [28:0] _1223;
    wire [31:0] _1225;
    wire [47:0] _1227;
    wire [47:0] _51;
    reg [47:0] _1251;
    wire [2:0] _1244;
    wire [3:0] _1138;
    wire [3:0] _1233;
    wire [3:0] _1234;
    wire [3:0] _1232;
    wire [3:0] _1235;
    wire [3:0] _1060;
    wire _1061;
    wire _1144;
    wire _52;
    wire _1145;
    wire _1230;
    wire [3:0] _1236;
    reg [3:0] _1239;
    wire [3:0] _53;
    wire _1139;
    wire _1228;
    wire _55;
    wire _1229;
    wire [2:0] _1245;
    wire [2:0] _56;
    reg [2:0] _1242;
    reg [47:0] _1294;
    wire _1356;
    wire _1357;
    reg [7:0] _1358;
    wire _1350;
    wire _1351;
    reg [7:0] _1352;
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
    wire [2:0] _1301;
    wire [2:0] _1302;
    wire [2:0] _59;
    reg [2:0] _1299;
    wire _1314;
    wire _1315;
    reg [7:0] _1316;
    wire [2:0] _1309;
    wire [2:0] _1310;
    wire [2:0] _60;
    reg [2:0] _1307;
    reg [7:0] _1359;
    wire [31:0] _1153;
    wire [31:0] _1362;
    wire [31:0] _1363;
    wire [31:0] _64;
    reg [31:0] _1154;
    wire [1:0] _1365;
    wire [1:0] _1226;
    reg [1:0] _1366;
    reg _1369;
    reg [1:0] _1372;
    reg _1375;
    wire _1376;
    wire _1377;
    wire _1025;
    wire _1378;
    wire [7:0] _1447;
    wire [7:0] _1448;
    wire [7:0] _1401;
    wire [7:0] _1399;
    wire [7:0] _1398;
    wire [7:0] _1397;
    wire [7:0] _1396;
    reg [7:0] _1400;
    wire [7:0] _1402;
    wire [7:0] _1403;
    wire [7:0] _1394;
    wire [7:0] _1395;
    wire [7:0] _1404;
    wire [7:0] _1438;
    wire [7:0] _1439;
    wire [7:0] _1441;
    wire [7:0] _1443;
    wire [7:0] _74;
    reg [7:0] _1386;
    wire [7:0] _1449;
    wire [7:0] _77;
    wire [7:0] _1928;
    wire [2:0] _1920;
    wire _1917;
    wire [1:0] _1918;
    wire [3:0] _1919;
    wire [6:0] _1921;
    wire [7:0] _1922;
    wire [7:0] _1923;
    wire _1435;
    wire _1434;
    wire _1433;
    wire _1431;
    wire _1432;
    wire _1429;
    wire _1430;
    wire _1426;
    wire _1427;
    wire _1428;
    wire _1423;
    wire _1424;
    wire _1425;
    wire _1420;
    wire _1419;
    wire _1421;
    wire [2:0] _1416;
    wire [2:0] _1415;
    wire [2:0] _1414;
    wire [2:0] _1413;
    reg [2:0] _1417;
    wire _1418;
    wire _1422;
    wire [7:0] _1436;
    wire _1409;
    wire _1408;
    wire _1407;
    wire _1406;
    reg _1410;
    wire _1405;
    wire _1411;
    wire [7:0] _1437;
    wire [7:0] _1915;
    wire [7:0] _1911;
    wire [7:0] _1909;
    wire [7:0] _1908;
    wire [7:0] _1907;
    wire [7:0] _1906;
    reg [7:0] _1910;
    wire [7:0] _1912;
    wire [7:0] _1913;
    wire [7:0] _1392;
    wire [7:0] _1390;
    wire [7:0] _1389;
    wire [7:0] _1388;
    wire [7:0] _1387;
    reg [7:0] _1391;
    wire [7:0] _1393;
    wire [7:0] _1904;
    wire [7:0] _1905;
    wire [7:0] _1914;
    wire [7:0] _1916;
    wire [7:0] _1924;
    wire _1381;
    wire _1382;
    wire _1082;
    wire [1:0] _1898;
    wire [1:0] _1894;
    wire [1:0] _1124;
    wire _1885;
    wire [1:0] _1887;
    wire _1884;
    wire [1:0] _1889;
    wire _1883;
    wire [1:0] _1891;
    wire [1:0] _1892;
    wire _960;
    wire [15:0] _955;
    wire _956;
    wire _957;
    wire _954;
    wire _958;
    wire _961;
    wire [3:0] _951;
    wire _953;
    wire _962;
    wire _949;
    wire _945;
    wire _946;
    wire _943;
    wire _947;
    wire _950;
    wire _941;
    reg [2:0] _832;
    wire [15:0] _936;
    wire _937;
    wire _934;
    wire _938;
    wire _932;
    wire _939;
    wire _942;
    wire [1:0] _931;
    reg _963;
    wire _930;
    wire _964;
    wire _927;
    wire [3:0] _925;
    reg _926;
    wire _928;
    wire [15:0] _920;
    wire _922;
    wire [16:0] _915;
    wire [15:0] _911;
    wire [16:0] _912;
    wire [16:0] _913;
    reg [16:0] _916;
    wire _917;
    wire _918;
    wire [15:0] _907;
    wire _909;
    wire _821;
    wire [2:0] _823;
    wire _818;
    wire [2:0] _820;
    wire _824;
    wire [2:0] _825;
    wire _813;
    wire [2:0] _815;
    wire _810;
    wire [2:0] _812;
    wire _816;
    wire [2:0] _817;
    wire _826;
    wire [2:0] _827;
    wire _803;
    wire [2:0] _805;
    wire _800;
    wire [2:0] _802;
    wire _806;
    wire [2:0] _807;
    wire _795;
    wire [2:0] _797;
    wire [7:0] _791;
    wire _792;
    wire [2:0] _794;
    wire _798;
    wire [2:0] _799;
    wire _808;
    wire [2:0] _809;
    wire _828;
    wire [2:0] _829;
    wire [13:0] _899;
    wire [16:0] _900;
    wire [111:0] _790;
    wire [15:0] _897;
    wire [16:0] _898;
    wire [16:0] _901;
    reg [16:0] _904;
    wire [16:0] _896;
    wire _905;
    wire _906;
    wire _910;
    wire _919;
    wire [1:0] _836;
    reg [15:0] _893;
    wire _895;
    wire _923;
    wire [7:0] _887;
    wire _889;
    wire _890;
    wire [7:0] _884;
    wire _886;
    wire _891;
    wire [7:0] _879;
    wire [7:0] _877;
    wire [7:0] _878;
    wire [7:0] _880;
    wire _882;
    wire _876;
    wire _883;
    wire _892;
    wire _924;
    wire _929;
    wire _965;
    wire _966;
    wire _504;
    wire _500;
    wire _501;
    wire _498;
    wire _502;
    wire _505;
    wire [3:0] _495;
    wire _497;
    wire _506;
    wire _493;
    wire _489;
    wire _490;
    wire _487;
    wire _491;
    wire _494;
    wire _485;
    reg [2:0] _479;
    wire [15:0] _480;
    wire _481;
    wire _475;
    wire _482;
    wire _473;
    wire _483;
    wire _486;
    wire [1:0] _472;
    reg _507;
    wire _471;
    wire _508;
    wire _463;
    wire [3:0] _437;
    reg _462;
    wire _464;
    wire [15:0] _432;
    wire _434;
    wire [15:0] _423;
    wire [16:0] _424;
    wire [16:0] _425;
    reg [16:0] _428;
    wire _429;
    wire _430;
    wire [15:0] _419;
    wire _421;
    wire _385;
    wire [2:0] _405;
    wire _364;
    wire [2:0] _384;
    wire _406;
    wire [2:0] _407;
    wire _341;
    wire [2:0] _361;
    wire _320;
    wire [2:0] _340;
    wire _362;
    wire [2:0] _363;
    wire _408;
    wire [2:0] _409;
    wire _295;
    wire [2:0] _315;
    wire _274;
    wire [2:0] _294;
    wire _316;
    wire [2:0] _317;
    wire _251;
    wire [2:0] _271;
    wire [7:0] _229;
    wire _230;
    wire [2:0] _250;
    wire _272;
    wire [2:0] _273;
    wire _318;
    wire [2:0] _319;
    wire _410;
    wire [2:0] _411;
    wire [16:0] _412;
    wire [111:0] _225;
    wire [15:0] _226;
    wire [16:0] _227;
    wire [16:0] _413;
    reg [16:0] _416;
    wire [16:0] _202;
    wire _417;
    wire _418;
    wire _422;
    wire _431;
    wire [1:0] _188;
    reg [15:0] _198;
    wire _200;
    wire _435;
    wire [7:0] _182;
    wire _184;
    wire _185;
    wire [7:0] _171;
    wire _173;
    wire _186;
    wire [7:0] _166;
    wire [7:0] _164;
    wire [7:0] _165;
    wire [7:0] _167;
    wire _169;
    wire [127:0] _144;
    wire [2:0] _1868;
    wire [5:0] _974;
    wire [5:0] _79;
    wire [5:0] _1462;
    wire [5:0] _81;
    wire _1452;
    wire [5:0] _1453;
    wire [5:0] _1454;
    wire [5:0] _1463;
    wire _1450;
    wire [5:0] _1464;
    wire [5:0] _1465;
    wire [5:0] _82;
    reg [5:0] _975;
    wire [5:0] _1458;
    wire [5:0] _1457;
    wire [5:0] _1456;
    wire [5:0] _1455;
    reg [5:0] _1459;
    wire _1460;
    wire _1461;
    wire [2:0] _1864;
    wire [1:0] _1121;
    wire _1859;
    wire [2:0] _1861;
    wire [7:0] _1114;
    wire [7:0] _1115;
    wire _1117;
    wire _1118;
    wire _1112;
    wire _1113;
    wire _1119;
    wire _1470;
    wire _1471;
    wire _1468;
    wire _1466;
    wire _1472;
    wire _83;
    reg _1109;
    wire _1110;
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
    wire _776;
    wire _772;
    wire _773;
    wire _770;
    wire _774;
    wire _777;
    wire [3:0] _767;
    wire _769;
    wire _778;
    wire _765;
    wire _761;
    wire _762;
    wire _759;
    wire _763;
    wire _766;
    wire _757;
    reg [2:0] _751;
    wire [15:0] _752;
    wire _753;
    wire _747;
    wire _754;
    wire _745;
    wire _755;
    wire _758;
    wire [1:0] _744;
    reg _779;
    wire _743;
    wire _780;
    wire _740;
    wire [3:0] _738;
    reg _739;
    wire _741;
    wire [15:0] _733;
    wire _735;
    wire [15:0] _724;
    wire [16:0] _725;
    wire [16:0] _726;
    reg [16:0] _729;
    wire _730;
    wire _731;
    wire [15:0] _720;
    wire _722;
    wire _704;
    wire [2:0] _706;
    wire _701;
    wire [2:0] _703;
    wire _707;
    wire [2:0] _708;
    wire _696;
    wire [2:0] _698;
    wire _693;
    wire [2:0] _695;
    wire _699;
    wire [2:0] _700;
    wire _709;
    wire [2:0] _710;
    wire _686;
    wire [2:0] _688;
    wire _683;
    wire [2:0] _685;
    wire _689;
    wire [2:0] _690;
    wire _678;
    wire [2:0] _680;
    wire [7:0] _674;
    wire _675;
    wire [2:0] _677;
    wire _681;
    wire [2:0] _682;
    wire _691;
    wire [2:0] _692;
    wire _711;
    wire [2:0] _712;
    wire [16:0] _713;
    wire [111:0] _670;
    wire [15:0] _671;
    wire [16:0] _672;
    wire [16:0] _714;
    reg [16:0] _717;
    wire [16:0] _669;
    wire _718;
    wire _719;
    wire _723;
    wire _732;
    wire [1:0] _665;
    reg [15:0] _666;
    wire _668;
    wire _736;
    wire [7:0] _659;
    wire _661;
    wire _662;
    wire [7:0] _656;
    wire _658;
    wire _663;
    wire [7:0] _651;
    wire [7:0] _649;
    wire [7:0] _650;
    wire [7:0] _652;
    wire _654;
    wire _648;
    wire _655;
    wire _664;
    wire _737;
    wire _742;
    wire _781;
    wire _782;
    wire [1:0] _785;
    wire _640;
    wire _636;
    wire _637;
    wire _634;
    wire _638;
    wire _641;
    wire [3:0] _631;
    wire _633;
    wire _642;
    wire _629;
    wire _625;
    wire _626;
    wire _623;
    wire _627;
    wire _630;
    wire _621;
    reg [2:0] _615;
    wire [15:0] _616;
    wire _617;
    wire _611;
    wire _618;
    wire _609;
    wire _619;
    wire _622;
    wire [1:0] _608;
    reg _643;
    wire [1:0] _85;
    wire [1:0] _1473;
    wire [1:0] _86;
    reg [1:0] _468;
    wire _470;
    wire _607;
    wire _644;
    wire _604;
    wire [7:0] _88;
    wire [6:0] _460;
    wire [6:0] _459;
    wire _461;
    wire [15:0] _456;
    wire _1478;
    wire _1477;
    wire _1479;
    wire _1476;
    wire _1480;
    wire _1475;
    wire _1481;
    wire [14:0] _1474;
    wire [15:0] _1482;
    wire [15:0] _89;
    reg [15:0] _457;
    wire _458;
    wire [3:0] _1497;
    wire [3:0] _1495;
    wire [3:0] _1498;
    wire _1136;
    wire _1303;
    wire _91;
    wire _1304;
    wire _1295;
    wire _1491;
    wire _1492;
    wire _92;
    wire _1296;
    wire _1493;
    wire [3:0] _1499;
    reg [3:0] _1502;
    wire [3:0] _93;
    wire _454;
    wire [6:0] _1519;
    wire [7:0] _1520;
    wire [6:0] _1517;
    wire _1515;
    wire _1514;
    wire _1513;
    wire _1512;
    wire _1511;
    wire _1510;
    wire _1509;
    wire _1508;
    wire [2:0] _1506;
    wire [2:0] _1505;
    wire [2:0] _1504;
    wire [2:0] _1503;
    reg [2:0] _1507;
    reg _1516;
    wire [7:0] _1518;
    wire [1:0] _1486;
    wire [1:0] _1485;
    wire [1:0] _1484;
    wire [1:0] _1483;
    reg [1:0] _1487;
    wire [1:0] _1489;
    reg [7:0] _1521;
    wire [7:0] _1522;
    wire [7:0] _94;
    reg [7:0] _449;
    wire _450;
    wire [6:0] _1622;
    wire [7:0] _1623;
    wire _1620;
    wire _1619;
    wire _1618;
    wire _1617;
    wire _1616;
    wire _1615;
    wire _1614;
    wire _1613;
    wire [7:0] _1621;
    wire _1607;
    wire _1608;
    reg [7:0] _1609;
    wire _1601;
    wire _1602;
    reg [7:0] _1603;
    wire _1595;
    wire _1596;
    reg [7:0] _1597;
    wire _1589;
    wire _1590;
    reg [7:0] _1591;
    wire _1583;
    wire _1584;
    reg [7:0] _1585;
    wire _1577;
    wire _1578;
    reg [7:0] _1579;
    wire _1571;
    wire _1572;
    reg [7:0] _1573;
    wire [2:0] _1529;
    wire [2:0] _1530;
    wire [2:0] _95;
    reg [2:0] _1527;
    wire _1565;
    wire _1566;
    wire [7:0] _97;
    reg [7:0] _1567;
    wire [2:0] _1537;
    wire [2:0] _1538;
    wire [2:0] _98;
    reg [2:0] _1535;
    reg [7:0] _1610;
    wire [3:0] _1556;
    wire [3:0] _1554;
    wire [3:0] _1557;
    wire _1531;
    wire _1549;
    wire _1547;
    wire _1550;
    wire _1551;
    wire _99;
    wire _1532;
    wire _1361;
    wire _1523;
    wire _101;
    wire _1524;
    wire _1552;
    wire [3:0] _1558;
    reg [3:0] _1561;
    wire [3:0] _102;
    wire _452;
    wire [7:0] _1612;
    wire [1:0] _1544;
    wire [1:0] _1542;
    wire [1:0] _1541;
    wire [1:0] _1540;
    wire [1:0] _1539;
    reg [1:0] _1543;
    wire [1:0] _1545;
    reg [7:0] _1624;
    wire [7:0] _1625;
    wire [7:0] _103;
    reg [7:0] _445;
    wire _446;
    wire [7:0] _1636;
    wire [7:0] _1635;
    wire [7:0] _1633;
    wire [7:0] _1634;
    wire [1:0] _1631;
    wire [111:0] _835;
    wire [1:0] _1629;
    wire [111:0] _647;
    wire [1:0] _1628;
    wire [1:0] _1627;
    wire [1:0] _1626;
    reg [1:0] _1630;
    wire [1:0] _1632;
    reg [7:0] _1637;
    wire [7:0] _1638;
    wire [7:0] _104;
    reg [7:0] _440;
    wire _442;
    wire [3:0] _602;
    reg _603;
    wire _605;
    wire [15:0] _597;
    wire _599;
    wire [15:0] _588;
    wire [16:0] _589;
    wire [16:0] _590;
    reg [16:0] _593;
    wire _594;
    wire _595;
    wire [15:0] _584;
    wire _586;
    wire [2:0] _400;
    wire [2:0] _1654;
    wire _1650;
    wire _1651;
    wire _1648;
    wire _1652;
    wire [2:0] _1655;
    wire _1645;
    wire _1646;
    wire _1644;
    wire _1647;
    wire [2:0] _1657;
    wire _1641;
    wire [2:0] _1643;
    wire _1640;
    wire [2:0] _1658;
    wire [2:0] _105;
    reg [2:0] _396;
    wire _398;
    wire [2:0] _401;
    wire _391;
    wire _392;
    wire _390;
    wire _393;
    wire [2:0] _403;
    wire _387;
    wire _388;
    wire [2:0] _404;
    wire _568;
    wire [2:0] _570;
    wire [2:0] _379;
    wire [2:0] _1673;
    wire _1669;
    wire _1670;
    wire _1667;
    wire _1671;
    wire [2:0] _1674;
    wire _1664;
    wire _1665;
    wire _1663;
    wire _1666;
    wire [2:0] _1676;
    wire _1660;
    wire [2:0] _1662;
    wire _1659;
    wire [2:0] _1677;
    wire [2:0] _106;
    reg [2:0] _375;
    wire _377;
    wire [2:0] _380;
    wire _370;
    wire _371;
    wire _369;
    wire _372;
    wire [2:0] _382;
    wire _366;
    wire _367;
    wire [2:0] _383;
    wire _565;
    wire [2:0] _567;
    wire _571;
    wire [2:0] _572;
    wire [2:0] _356;
    wire [2:0] _1692;
    wire _1688;
    wire _1689;
    wire _1686;
    wire _1690;
    wire [2:0] _1693;
    wire _1683;
    wire _1684;
    wire _1682;
    wire _1685;
    wire [2:0] _1695;
    wire _1679;
    wire [2:0] _1681;
    wire _1678;
    wire [2:0] _1696;
    wire [2:0] _107;
    reg [2:0] _352;
    wire _354;
    wire [2:0] _357;
    wire _347;
    wire _348;
    wire _346;
    wire _349;
    wire [2:0] _359;
    wire _343;
    wire _344;
    wire [2:0] _360;
    wire _560;
    wire [2:0] _562;
    wire [2:0] _335;
    wire [2:0] _1711;
    wire _1707;
    wire _1708;
    wire _1705;
    wire _1709;
    wire [2:0] _1712;
    wire _1702;
    wire _1703;
    wire _1701;
    wire _1704;
    wire [2:0] _1714;
    wire _1698;
    wire [2:0] _1700;
    wire _1697;
    wire [2:0] _1715;
    wire [2:0] _108;
    reg [2:0] _331;
    wire _333;
    wire [2:0] _336;
    wire _326;
    wire _327;
    wire _325;
    wire _328;
    wire [2:0] _338;
    wire _322;
    wire _323;
    wire [2:0] _339;
    wire _557;
    wire [2:0] _559;
    wire _563;
    wire [2:0] _564;
    wire _573;
    wire [2:0] _574;
    wire [2:0] _310;
    wire [2:0] _1730;
    wire _1726;
    wire _1727;
    wire _1724;
    wire _1728;
    wire [2:0] _1731;
    wire _1721;
    wire _1722;
    wire _1720;
    wire _1723;
    wire [2:0] _1733;
    wire _1717;
    wire [2:0] _1719;
    wire _1716;
    wire [2:0] _1734;
    wire [2:0] _109;
    reg [2:0] _306;
    wire _308;
    wire [2:0] _311;
    wire _301;
    wire _302;
    wire _300;
    wire _303;
    wire [2:0] _313;
    wire _297;
    wire _298;
    wire [2:0] _314;
    wire _550;
    wire [2:0] _552;
    wire [2:0] _289;
    wire [2:0] _1749;
    wire _1745;
    wire _1746;
    wire _1743;
    wire _1747;
    wire [2:0] _1750;
    wire _1740;
    wire _1741;
    wire _1739;
    wire _1742;
    wire [2:0] _1752;
    wire _1736;
    wire [2:0] _1738;
    wire _1735;
    wire [2:0] _1753;
    wire [2:0] _110;
    reg [2:0] _285;
    wire _287;
    wire [2:0] _290;
    wire _280;
    wire _281;
    wire _279;
    wire _282;
    wire [2:0] _292;
    wire _276;
    wire _277;
    wire [2:0] _293;
    wire _547;
    wire [2:0] _549;
    wire _553;
    wire [2:0] _554;
    wire [2:0] _266;
    wire [2:0] _1768;
    wire _1764;
    wire _1765;
    wire _1762;
    wire _1766;
    wire [2:0] _1769;
    wire _1759;
    wire _1760;
    wire _1758;
    wire _1761;
    wire [2:0] _1771;
    wire _1755;
    wire [2:0] _1757;
    wire _1754;
    wire [2:0] _1772;
    wire [2:0] _111;
    reg [2:0] _262;
    wire _264;
    wire [2:0] _267;
    wire _257;
    wire _258;
    wire _256;
    wire _259;
    wire [2:0] _269;
    wire _253;
    wire _254;
    wire [2:0] _270;
    wire _542;
    wire [2:0] _544;
    wire [2:0] _245;
    wire [2:0] _1787;
    wire _1783;
    wire _1784;
    wire _1781;
    wire _1785;
    wire [2:0] _1788;
    wire _1778;
    wire _1779;
    wire _1777;
    wire _1780;
    wire [2:0] _1790;
    wire _1774;
    wire [2:0] _1776;
    wire _1773;
    wire [2:0] _1791;
    wire [2:0] _112;
    reg [2:0] _241;
    wire _243;
    wire [2:0] _246;
    wire _236;
    wire _237;
    wire _235;
    wire _238;
    wire [2:0] _248;
    wire _232;
    wire _233;
    wire [2:0] _249;
    wire [7:0] _538;
    wire _539;
    wire [2:0] _541;
    wire _545;
    wire [2:0] _546;
    wire _555;
    wire [2:0] _556;
    wire _575;
    wire [2:0] _576;
    wire [16:0] _577;
    wire _1794;
    wire [127:0] _1795;
    wire _1792;
    wire [127:0] _1796;
    wire [127:0] _113;
    reg [127:0] _154;
    wire _221;
    wire _222;
    wire [127:0] _223;
    wire _1799;
    wire [127:0] _1800;
    wire _1797;
    wire [127:0] _1801;
    wire [127:0] _114;
    reg [127:0] _151;
    wire _217;
    wire _218;
    wire [127:0] _219;
    wire _1804;
    wire [127:0] _1805;
    wire _1802;
    wire [127:0] _1806;
    wire [127:0] _115;
    reg [127:0] _148;
    wire _213;
    wire _214;
    wire [127:0] _215;
    wire [127:0] _117;
    wire _209;
    wire _210;
    wire [127:0] _211;
    wire [511:0] _224;
    wire [111:0] _534;
    wire [15:0] _535;
    wire [16:0] _536;
    wire [16:0] _578;
    reg [16:0] _581;
    wire gnd;
    wire [16:0] _533;
    wire _582;
    wire _583;
    wire _587;
    wire _596;
    wire [15:0] _1820;
    wire _1817;
    wire _1818;
    wire [15:0] _1821;
    wire _1814;
    wire _1815;
    wire [15:0] _1823;
    wire [15:0] _1825;
    wire [15:0] _118;
    reg [15:0] _197;
    wire [15:0] _1832;
    wire _1829;
    wire _1830;
    wire [15:0] _1833;
    wire _1826;
    wire _1827;
    wire [15:0] _1835;
    wire [15:0] _1837;
    wire [15:0] _119;
    reg [15:0] _194;
    wire [1:0] _529;
    reg [15:0] _530;
    wire _532;
    wire _600;
    reg [7:0] _179;
    wire [7:0] _180;
    wire _1839;
    wire [7:0] _1841;
    wire _1838;
    wire [7:0] _1842;
    wire [7:0] _1844;
    wire [7:0] _120;
    reg [7:0] _176;
    wire [7:0] _181;
    wire [7:0] _523;
    wire _525;
    wire _526;
    wire [7:0] _520;
    wire _522;
    wire _527;
    wire [7:0] _515;
    wire [7:0] _513;
    wire vdd;
    wire _122;
    wire _124;
    wire [7:0] _126;
    reg [7:0] _160;
    reg [7:0] _163;
    wire [7:0] _514;
    wire [7:0] _516;
    wire _518;
    wire [111:0] _511;
    wire _512;
    wire _519;
    wire _528;
    wire _601;
    wire _606;
    wire _645;
    wire _646;
    wire [1:0] _787;
    wire [1:0] _789;
    reg [2:0] _1811;
    wire [2:0] _1813;
    wire _1845;
    wire _1846;
    wire [15:0] _1854;
    wire [15:0] _1856;
    wire [15:0] _127;
    reg [15:0] _191;
    wire [1:0] _1103;
    reg [15:0] _1104;
    wire [15:0] _1102;
    wire _1105;
    wire [63:0] _1084;
    wire _1100;
    wire _1098;
    wire _1099;
    wire _1101;
    wire _1106;
    wire _1111;
    wire _1120;
    wire [2:0] _1862;
    wire [2:0] _1865;
    wire _1858;
    wire [2:0] _1866;
    wire _1857;
    wire [2:0] _1869;
    wire [2:0] _1871;
    wire [2:0] _128;
    reg [2:0] _207;
    wire _1874;
    wire [127:0] _1875;
    wire _1872;
    wire [127:0] _1876;
    wire [127:0] _129;
    reg [127:0] _145;
    wire [511:0] _155;
    wire [111:0] _156;
    wire _157;
    wire _170;
    wire _187;
    wire _436;
    wire _465;
    wire _509;
    wire _142;
    wire _510;
    wire _874;
    wire _875;
    wire _967;
    wire [1:0] _1895;
    wire _1880;
    wire [1:0] _1882;
    wire _1878;
    wire [1:0] _1896;
    wire _1877;
    wire [1:0] _1899;
    wire _131;
    wire [1:0] _1901;
    wire [1:0] _1903;
    wire [1:0] _132;
    reg [1:0] _140;
    wire _204;
    wire _1083;
    wire _1379;
    wire _1383;
    wire [7:0] _1925;
    wire _134;
    wire [7:0] _1927;
    wire [7:0] _135;
    reg [7:0] _1446;
    wire [7:0] _1929;
    assign _1018 = _46[11:0];
    assign _1015 = _1008 < _1005;
    assign _1016 = _990 & _1015;
    assign _1017 = _1016 ? _1005 : _1008;
    assign _1019 = _1017 < _1018;
    assign _1020 = _1019 ? _1018 : _1017;
    assign _1021 = _1001 ? _1017 : _1020;
    assign _1007 = 12'b000000000000;
    assign _867 = 12'b111111111111;
    assign _864 = _862[11:0];
    assign _861 = 13'b0000000000000;
    assign _858 = 10'b0000000000;
    assign _859 = { _858,
                    _855 };
    assign _860 = _851 - _859;
    assign _854 = 3'b000;
    always @* begin
        case (_789)
        0:
            _833 <= _479;
        1:
            _833 <= _615;
        2:
            _833 <= _751;
        default:
            _833 <= _832;
        endcase
    end
    assign _1 = _833;
    always @(posedge _124) begin
        if (_122)
            _855 <= _854;
        else
            _855 <= _1;
    end
    assign _856 = { _858,
                    _855 };
    assign _841 = 13'b1111111111111;
    assign _840 = _838[12:0];
    assign _834 = 16'b0001111111111111;
    assign _839 = _834 < _838;
    assign _842 = _839 ? _841 : _840;
    assign _2 = _842;
    always @(posedge _124) begin
        if (_122)
            _851 <= _861;
        else
            _851 <= _2;
    end
    assign _857 = _851 < _856;
    assign _862 = _857 ? _861 : _860;
    assign _848 = 13'b0111111111111;
    assign _863 = _848 < _862;
    assign _866 = _863 ? _867 : _864;
    assign _846 = 1'b0;
    assign _843 = 16'b1111111111111111;
    assign _844 = _838 == _843;
    assign _3 = _844;
    always @(posedge _124) begin
        if (_122)
            _847 <= _846;
        else
            _847 <= _3;
    end
    assign _868 = _847 ? _867 : _866;
    assign _4 = _868;
    always @(posedge _124) begin
        if (_122)
            _1008 <= _1007;
        else
            _1008 <= _4;
    end
    assign _871 = _838[11:0];
    always @* begin
        case (_789)
        0:
            _837 <= _188;
        1:
            _837 <= _529;
        2:
            _837 <= _665;
        default:
            _837 <= _836;
        endcase
    end
    always @* begin
        case (_837)
        0:
            _838 <= _191;
        1:
            _838 <= _194;
        2:
            _838 <= _197;
        default:
            _838 <= _197;
        endcase
    end
    assign _869 = 16'b0000111111111111;
    assign _870 = _869 < _838;
    assign _873 = _870 ? _867 : _871;
    assign _5 = _873;
    always @(posedge _124) begin
        if (_122)
            _1005 <= _1007;
        else
            _1005 <= _5;
    end
    assign _1009 = _1005 < _1008;
    assign _1010 = _990 & _1009;
    assign _1011 = _1010 ? _1005 : _1008;
    assign _1002 = _46[23:12];
    assign _1012 = _1002 < _1011;
    assign _1013 = _1012 ? _1002 : _1011;
    assign _1000 = 8'b00000000;
    assign _1001 = _985 == _1000;
    assign _1014 = _1001 ? _1011 : _1013;
    assign _998 = 8'b11111111;
    assign _997 = _995[7:0];
    assign _992 = 2'b10;
    assign _991 = 2'b01;
    assign _980 = _976 == _979;
    assign _972 = _968 & _971;
    assign _981 = _972 & _980;
    assign _6 = _981;
    always @(posedge _124) begin
        if (_122)
            _990 <= _846;
        else
            _990 <= _6;
    end
    assign _993 = _990 ? _992 : _991;
    assign _987 = 7'b0000000;
    assign _994 = { _987,
                    _993 };
    assign _985 = _46[31:24];
    assign _986 = { gnd,
                    _985 };
    assign _995 = _986 + _994;
    assign _996 = _995[8:8];
    assign _999 = _996 ? _998 : _997;
    assign _1022 = { _999,
                     _1014,
                     _1021 };
    assign _8 = host_cov_wdata;
    assign _1023 = _984 ? _1022 : _8;
    assign _1031 = _984 | _1030;
    assign _1029 = ~ _971;
    assign _1027 = ~ _984;
    assign _12 = host_cov_we;
    assign _1026 = _12 & _1025;
    assign _1028 = _1026 & _1027;
    assign _1030 = _1028 & _1029;
    assign _1033 = ~ _1030;
    assign _1032 = ~ _984;
    assign _1034 = _1032 & _1033;
    assign _14 = _979;
    always @(posedge _124) begin
        if (_122)
            _1038 <= _1000;
        else
            _1038 <= _14;
    end
    assign _16 = host_cov_addr;
    assign _1035 = _971 ? _979 : _16;
    assign _17 = _971;
    always @(posedge _124) begin
        if (_122)
            _984 <= _846;
        else
            _984 <= _17;
    end
    assign _1039 = _984 ? _1038 : _1035;
    assign _20 = host_rec_wdata;
    assign _23 = host_rec_we;
    assign _1040 = _23 & _1025;
    assign _1044 = _207[1:0];
    assign _1045 = { _975,
                     _1044 };
    assign _27 = host_rec_waddr;
    assign _1041 = 3'b100;
    assign _1042 = _207 < _1041;
    assign _1043 = _204 & _1042;
    assign _1046 = _1043 ? _1045 : _27;
    assign _1056 = 1'b1;
    assign _29 = _976;
    always @(posedge _124) begin
        if (_122)
            _979 <= _1000;
        else
            _979 <= _29;
    end
    assign _976 = { _975,
                    _789 };
    assign _1050 = _976 == _979;
    assign _1051 = ~ _1050;
    assign _1047 = ~ _971;
    assign _1048 = _968 & _1047;
    assign _30 = _1048;
    always @(posedge _124) begin
        if (_122)
            _971 <= _846;
        else
            _971 <= _30;
    end
    assign _32 = host_cover_en;
    assign _968 = _967 & _32;
    assign _1049 = _968 & _971;
    assign _1052 = _1049 & _1051;
    assign _1057 = _1052 ? _1056 : _1055;
    assign _1059 = _134 ? _846 : _1057;
    assign _33 = _1059;
    always @(posedge _124) begin
        if (_122)
            _1055 <= _846;
        else
            _1055 <= _33;
    end
    assign _1062 = _52 & _1061;
    assign _1067 = _1062 ? _1056 : _1065;
    assign _1069 = _134 ? _846 : _1067;
    assign _35 = _1069;
    always @(posedge _124) begin
        if (_122)
            _1065 <= _846;
        else
            _1065 <= _35;
    end
    assign _1070 = _92 & _454;
    assign _1075 = _1070 ? _1056 : _1073;
    assign _1077 = _134 ? _846 : _1075;
    assign _37 = _1077;
    always @(posedge _124) begin
        if (_122)
            _1073 <= _846;
        else
            _1073 <= _37;
    end
    assign _1085 = _1084[61:61];
    assign _1086 = _1083 & _1085;
    assign _1091 = _1086 ? _1056 : _1089;
    assign _41 = host_irq_ack;
    assign _1093 = _41 ? _846 : _1091;
    assign _1095 = _134 ? _846 : _1093;
    assign _42 = _1095;
    always @(posedge _124) begin
        if (_122)
            _1089 <= _846;
        else
            _1089 <= _42;
    end
    assign _1125 = _1121 == _1124;
    assign _1127 = _1125 ? _1056 : _1080;
    assign _1123 = _1121 == _1365;
    assign _1129 = _1123 ? _1056 : _1127;
    assign _1130 = _1120 ? _1129 : _1080;
    assign _1131 = _967 ? _1080 : _1130;
    assign _1097 = _140 == _992;
    assign _1132 = _1097 ? _1131 : _1080;
    assign _1134 = _134 ? _846 : _1132;
    assign _43 = _1134;
    always @(posedge _124) begin
        if (_122)
            _1080 <= _846;
        else
            _1080 <= _43;
    end
    assign _1140 = ~ _1139;
    assign _1137 = ~ _1136;
    assign _1141 = _1137 | _1140;
    assign _1142 = _1141 | _1080;
    assign _1143 = _1142 | _1089;
    assign _46 = ram_cov_rdata;
    assign _1290 = 3'b111;
    assign _1291 = _1148 == _1290;
    assign _1292 = _1145 & _1291;
    assign _1289 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _124) begin
        if (_122)
            _1293 <= _1289;
        else
            if (_1292)
                _1293 <= _51;
    end
    assign _1284 = 3'b110;
    assign _1285 = _1148 == _1284;
    assign _1286 = _1145 & _1285;
    always @(posedge _124) begin
        if (_122)
            _1287 <= _1289;
        else
            if (_1286)
                _1287 <= _51;
    end
    assign _1278 = 3'b101;
    assign _1279 = _1148 == _1278;
    assign _1280 = _1145 & _1279;
    always @(posedge _124) begin
        if (_122)
            _1281 <= _1289;
        else
            if (_1280)
                _1281 <= _51;
    end
    assign _1273 = _1148 == _1041;
    assign _1274 = _1145 & _1273;
    always @(posedge _124) begin
        if (_122)
            _1275 <= _1289;
        else
            if (_1274)
                _1275 <= _51;
    end
    assign _1266 = 3'b011;
    assign _1267 = _1148 == _1266;
    assign _1268 = _1145 & _1267;
    always @(posedge _124) begin
        if (_122)
            _1269 <= _1289;
        else
            if (_1268)
                _1269 <= _51;
    end
    assign _1260 = 3'b010;
    assign _1261 = _1148 == _1260;
    assign _1262 = _1145 & _1261;
    always @(posedge _124) begin
        if (_122)
            _1263 <= _1289;
        else
            if (_1262)
                _1263 <= _51;
    end
    assign _1254 = 3'b001;
    assign _1255 = _1148 == _1254;
    assign _1256 = _1145 & _1255;
    always @(posedge _124) begin
        if (_122)
            _1257 <= _1289;
        else
            if (_1256)
                _1257 <= _51;
    end
    assign _1150 = _1148 + _1254;
    assign _1151 = _1145 ? _1150 : _1148;
    assign _49 = _1151;
    always @(posedge _124) begin
        if (_122)
            _1148 <= _854;
        else
            _1148 <= _49;
    end
    assign _1249 = _1148 == _854;
    assign _1250 = _1145 & _1249;
    assign _1224 = _1164 - _1220;
    assign _1159 = 29'b11111111111111111111111111111;
    assign _1158 = 29'b00000000000000000000000000000;
    assign _1161 = 29'b00000000000000000000000000001;
    assign _1162 = _1160 + _1161;
    assign _1155 = _1154[2:0];
    assign _1157 = _1155 == _1290;
    assign _1163 = _1157 ? _1162 : _1160;
    assign _50 = _1163;
    always @(posedge _124) begin
        if (_122)
            _1160 <= _1159;
        else
            _1160 <= _50;
    end
    assign _1222 = _1154[31:3];
    assign _1210 = _1114[0:0];
    assign _1209 = _176[0:0];
    assign _1211 = _1209 & _1210;
    assign _1213 = _1211 ? _396 : _854;
    assign _1205 = _1114[1:1];
    assign _1204 = _176[1:1];
    assign _1206 = _1204 & _1205;
    assign _1208 = _1206 ? _375 : _854;
    assign _1214 = _1208 < _1213;
    assign _1215 = _1214 ? _1213 : _1208;
    assign _1198 = _1114[2:2];
    assign _1197 = _176[2:2];
    assign _1199 = _1197 & _1198;
    assign _1201 = _1199 ? _352 : _854;
    assign _1193 = _1114[3:3];
    assign _1192 = _176[3:3];
    assign _1194 = _1192 & _1193;
    assign _1196 = _1194 ? _331 : _854;
    assign _1202 = _1196 < _1201;
    assign _1203 = _1202 ? _1201 : _1196;
    assign _1216 = _1203 < _1215;
    assign _1217 = _1216 ? _1215 : _1203;
    assign _1184 = _1114[4:4];
    assign _1183 = _176[4:4];
    assign _1185 = _1183 & _1184;
    assign _1187 = _1185 ? _306 : _854;
    assign _1179 = _1114[5:5];
    assign _1178 = _176[5:5];
    assign _1180 = _1178 & _1179;
    assign _1182 = _1180 ? _285 : _854;
    assign _1188 = _1182 < _1187;
    assign _1189 = _1188 ? _1187 : _1182;
    assign _1172 = _1114[6:6];
    assign _1171 = _176[6:6];
    assign _1173 = _1171 & _1172;
    assign _1175 = _1173 ? _262 : _854;
    assign _1167 = _1114[7:7];
    assign _1166 = _176[7:7];
    assign _1168 = _1166 & _1167;
    assign _1170 = _1168 ? _241 : _854;
    assign _1176 = _1170 < _1175;
    assign _1177 = _1176 ? _1175 : _1170;
    assign _1190 = _1177 < _1189;
    assign _1191 = _1190 ? _1189 : _1177;
    assign _1218 = _1191 < _1217;
    assign _1219 = _1218 ? _1217 : _1191;
    assign _1220 = _1119 ? _1219 : _854;
    assign _1164 = _1154[2:0];
    assign _1221 = _1164 < _1220;
    assign _1223 = _1221 ? _1160 : _1222;
    assign _1225 = { _1223,
                     _1224 };
    assign _1227 = { _1225,
                     _975,
                     _1226,
                     _163 };
    assign _51 = _1227;
    always @(posedge _124) begin
        if (_122)
            _1251 <= _1289;
        else
            if (_1250)
                _1251 <= _51;
    end
    assign _1244 = _1242 + _1254;
    assign _1138 = 4'b0000;
    assign _1233 = 4'b0001;
    assign _1234 = _53 + _1233;
    assign _1232 = _53 - _1233;
    assign _1235 = _1145 ? _1234 : _1232;
    assign _1060 = 4'b1000;
    assign _1061 = _53 == _1060;
    assign _1144 = ~ _1061;
    assign _52 = _1120;
    assign _1145 = _52 & _1144;
    assign _1230 = _1145 ^ _1229;
    assign _1236 = _1230 ? _1235 : _53;
    always @(posedge _124) begin
        if (_122)
            _1239 <= _1138;
        else
            _1239 <= _1236;
    end
    assign _53 = _1239;
    assign _1139 = _53 == _1138;
    assign _1228 = ~ _1139;
    assign _55 = host_vlog_pop;
    assign _1229 = _55 & _1228;
    assign _1245 = _1229 ? _1244 : _1242;
    assign _56 = _1245;
    always @(posedge _124) begin
        if (_122)
            _1242 <= _854;
        else
            _1242 <= _56;
    end
    always @* begin
        case (_1242)
        0:
            _1294 <= _1251;
        1:
            _1294 <= _1257;
        2:
            _1294 <= _1263;
        3:
            _1294 <= _1269;
        4:
            _1294 <= _1275;
        5:
            _1294 <= _1281;
        6:
            _1294 <= _1287;
        default:
            _1294 <= _1293;
        endcase
    end
    assign _1356 = _1299 == _1290;
    assign _1357 = _1296 & _1356;
    always @(posedge _124) begin
        if (_122)
            _1358 <= _1000;
        else
            if (_1357)
                _1358 <= _449;
    end
    assign _1350 = _1299 == _1284;
    assign _1351 = _1296 & _1350;
    always @(posedge _124) begin
        if (_122)
            _1352 <= _1000;
        else
            if (_1351)
                _1352 <= _449;
    end
    assign _1344 = _1299 == _1278;
    assign _1345 = _1296 & _1344;
    always @(posedge _124) begin
        if (_122)
            _1346 <= _1000;
        else
            if (_1345)
                _1346 <= _449;
    end
    assign _1338 = _1299 == _1041;
    assign _1339 = _1296 & _1338;
    always @(posedge _124) begin
        if (_122)
            _1340 <= _1000;
        else
            if (_1339)
                _1340 <= _449;
    end
    assign _1332 = _1299 == _1266;
    assign _1333 = _1296 & _1332;
    always @(posedge _124) begin
        if (_122)
            _1334 <= _1000;
        else
            if (_1333)
                _1334 <= _449;
    end
    assign _1326 = _1299 == _1260;
    assign _1327 = _1296 & _1326;
    always @(posedge _124) begin
        if (_122)
            _1328 <= _1000;
        else
            if (_1327)
                _1328 <= _449;
    end
    assign _1320 = _1299 == _1254;
    assign _1321 = _1296 & _1320;
    always @(posedge _124) begin
        if (_122)
            _1322 <= _1000;
        else
            if (_1321)
                _1322 <= _449;
    end
    assign _1301 = _1299 + _1254;
    assign _1302 = _1296 ? _1301 : _1299;
    assign _59 = _1302;
    always @(posedge _124) begin
        if (_122)
            _1299 <= _854;
        else
            _1299 <= _59;
    end
    assign _1314 = _1299 == _854;
    assign _1315 = _1296 & _1314;
    always @(posedge _124) begin
        if (_122)
            _1316 <= _1000;
        else
            if (_1315)
                _1316 <= _449;
    end
    assign _1309 = _1307 + _1254;
    assign _1310 = _1304 ? _1309 : _1307;
    assign _60 = _1310;
    always @(posedge _124) begin
        if (_122)
            _1307 <= _854;
        else
            _1307 <= _60;
    end
    always @* begin
        case (_1307)
        0:
            _1359 <= _1316;
        1:
            _1359 <= _1322;
        2:
            _1359 <= _1328;
        3:
            _1359 <= _1334;
        4:
            _1359 <= _1340;
        5:
            _1359 <= _1346;
        6:
            _1359 <= _1352;
        default:
            _1359 <= _1358;
        endcase
    end
    assign _1153 = 32'b00000000000000000000000000000000;
    assign _1362 = 32'b00000000000000000000000000000001;
    assign _1363 = _1154 + _1362;
    assign _64 = _1363;
    always @(posedge _124) begin
        if (_122)
            _1154 <= _1153;
        else
            _1154 <= _64;
    end
    assign _1365 = 2'b00;
    assign _1226 = { _1111,
                     _1119 };
    always @(posedge _124) begin
        if (_122)
            _1366 <= _1365;
        else
            _1366 <= _1226;
    end
    always @(posedge _124) begin
        if (_122)
            _1369 <= _846;
        else
            _1369 <= _1120;
    end
    always @(posedge _124) begin
        if (_122)
            _1372 <= _1365;
        else
            _1372 <= _789;
    end
    always @(posedge _124) begin
        if (_122)
            _1375 <= _846;
        else
            _1375 <= _967;
    end
    assign _1376 = _1084[60:60];
    assign _1377 = _142 & _1376;
    assign _1025 = _140 == _1365;
    assign _1378 = ~ _1025;
    assign _1447 = _77 & _1446;
    assign _1448 = ~ _1447;
    assign _1401 = _1084[23:16];
    assign _1399 = _835[86:79];
    assign _1398 = _647[86:79];
    assign _1397 = _511[86:79];
    assign _1396 = _156[86:79];
    always @* begin
        case (_789)
        0:
            _1400 <= _1396;
        1:
            _1400 <= _1397;
        2:
            _1400 <= _1398;
        default:
            _1400 <= _1399;
        endcase
    end
    assign _1402 = _1083 ? _1401 : _1400;
    assign _1403 = _1402 & _1393;
    assign _1394 = ~ _1393;
    assign _1395 = _1386 & _1394;
    assign _1404 = _1395 | _1403;
    assign _1438 = _1404 | _1437;
    assign _1439 = _1383 ? _1438 : _1386;
    assign _1441 = _131 ? _1000 : _1439;
    assign _1443 = _134 ? _1000 : _1441;
    assign _74 = _1443;
    always @(posedge _124) begin
        if (_122)
            _1386 <= _1000;
        else
            _1386 <= _74;
    end
    assign _1449 = _1386 & _1448;
    assign _77 = host_open_drain;
    assign _1928 = ~ _77;
    assign _1920 = { _1918,
                     _1917 };
    assign _1917 = _445[0:0];
    assign _1918 = { _1917,
                     _1917 };
    assign _1919 = { _1918,
                     _1918 };
    assign _1921 = { _1919,
                     _1920 };
    assign _1922 = { _1921,
                     _1917 };
    assign _1923 = _1922 & _1437;
    assign _1435 = _1431 & _1429;
    assign _1434 = _1431 & _1427;
    assign _1433 = _1431 & _1424;
    assign _1431 = ~ _1418;
    assign _1432 = _1431 & _1421;
    assign _1429 = _1426 & _1423;
    assign _1430 = _1418 & _1429;
    assign _1426 = ~ _1419;
    assign _1427 = _1426 & _1420;
    assign _1428 = _1418 & _1427;
    assign _1423 = ~ _1420;
    assign _1424 = _1419 & _1423;
    assign _1425 = _1418 & _1424;
    assign _1420 = _1417[0:0];
    assign _1419 = _1417[1:1];
    assign _1421 = _1419 & _1420;
    assign _1416 = _835[90:88];
    assign _1415 = _647[90:88];
    assign _1414 = _511[90:88];
    assign _1413 = _156[90:88];
    always @* begin
        case (_789)
        0:
            _1417 <= _1413;
        1:
            _1417 <= _1414;
        2:
            _1417 <= _1415;
        default:
            _1417 <= _1416;
        endcase
    end
    assign _1418 = _1417[2:2];
    assign _1422 = _1418 & _1421;
    assign _1436 = { _1422,
                     _1425,
                     _1428,
                     _1430,
                     _1432,
                     _1433,
                     _1434,
                     _1435 };
    assign _1409 = _835[87:87];
    assign _1408 = _647[87:87];
    assign _1407 = _511[87:87];
    assign _1406 = _156[87:87];
    always @* begin
        case (_789)
        0:
            _1410 <= _1406;
        1:
            _1410 <= _1407;
        2:
            _1410 <= _1408;
        default:
            _1410 <= _1409;
        endcase
    end
    assign _1405 = ~ _1083;
    assign _1411 = _1405 & _1410;
    assign _1437 = _1411 ? _1436 : _1000;
    assign _1915 = ~ _1437;
    assign _1911 = _1084[15:8];
    assign _1909 = _835[78:71];
    assign _1908 = _647[78:71];
    assign _1907 = _511[78:71];
    assign _1906 = _156[78:71];
    always @* begin
        case (_789)
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
    assign _1912 = _1083 ? _1911 : _1910;
    assign _1913 = _1912 & _1393;
    assign _1392 = _1084[7:0];
    assign _1390 = _835[70:63];
    assign _1389 = _647[70:63];
    assign _1388 = _511[70:63];
    assign _1387 = _156[70:63];
    always @* begin
        case (_789)
        0:
            _1391 <= _1387;
        1:
            _1391 <= _1388;
        2:
            _1391 <= _1389;
        default:
            _1391 <= _1390;
        endcase
    end
    assign _1393 = _1083 ? _1392 : _1391;
    assign _1904 = ~ _1393;
    assign _1905 = _1446 & _1904;
    assign _1914 = _1905 | _1913;
    assign _1916 = _1914 & _1915;
    assign _1924 = _1916 | _1923;
    assign _1381 = _468 == _1365;
    assign _1382 = _1381 | _470;
    assign _1082 = _207 == _1041;
    assign _1898 = _1083 ? _992 : _140;
    assign _1894 = _1461 ? _991 : _140;
    assign _1124 = 2'b11;
    assign _1885 = _1121 == _1124;
    assign _1887 = _1885 ? _1365 : _140;
    assign _1884 = _1121 == _992;
    assign _1889 = _1884 ? _991 : _1887;
    assign _1883 = _1121 == _1365;
    assign _1891 = _1883 ? _1365 : _1889;
    assign _1892 = _1120 ? _1891 : _140;
    assign _960 = _920 == _843;
    assign _955 = 16'b0000000000000000;
    assign _956 = _920 == _955;
    assign _957 = _956 & _937;
    assign _954 = _896 == _916;
    assign _958 = _954 | _957;
    assign _961 = _895 ? _960 : _958;
    assign _951 = _457[3:0];
    assign _953 = _951 == _1138;
    assign _962 = _953 | _961;
    assign _949 = _920 == _843;
    assign _945 = _920 == _955;
    assign _946 = _945 & _937;
    assign _943 = _896 == _916;
    assign _947 = _943 | _946;
    assign _950 = _895 ? _949 : _947;
    assign _941 = _907 == _843;
    always @(posedge _124) begin
        if (_122)
            _832 <= _854;
        else
            _832 <= _829;
    end
    assign _936 = { _861,
                    _832 };
    assign _937 = _893 < _936;
    assign _934 = _907 == _955;
    assign _938 = _934 & _937;
    assign _932 = _896 == _904;
    assign _939 = _932 | _938;
    assign _942 = _895 ? _941 : _939;
    assign _931 = _835[104:103];
    always @* begin
        case (_931)
        0:
            _963 <= vdd;
        1:
            _963 <= _942;
        2:
            _963 <= _950;
        default:
            _963 <= _962;
        endcase
    end
    assign _930 = ~ _470;
    assign _964 = _930 | _963;
    assign _927 = _835[62:62];
    assign _925 = _835[61:58];
    always @* begin
        case (_925)
        0:
            _926 <= vdd;
        1:
            _926 <= _442;
        2:
            _926 <= _446;
        3:
            _926 <= _450;
        4:
            _926 <= _452;
        5:
            _926 <= _454;
        6:
            _926 <= _458;
        7:
            _926 <= _461;
        8:
            _926 <= gnd;
        9:
            _926 <= gnd;
        10:
            _926 <= gnd;
        11:
            _926 <= gnd;
        12:
            _926 <= gnd;
        13:
            _926 <= gnd;
        14:
            _926 <= gnd;
        default:
            _926 <= gnd;
        endcase
    end
    assign _928 = _926 ^ _927;
    assign _920 = _835[57:42];
    assign _922 = _920 == _843;
    assign _915 = 17'b00000000000000000;
    assign _911 = _790[57:42];
    assign _912 = { gnd,
                    _911 };
    assign _913 = _912 + _900;
    always @(posedge _124) begin
        if (_122)
            _916 <= _915;
        else
            _916 <= _913;
    end
    assign _917 = _916 < _896;
    assign _918 = ~ _917;
    assign _907 = _835[41:26];
    assign _909 = _907 == _955;
    assign _821 = _791[0:0];
    assign _823 = _821 ? _404 : _854;
    assign _818 = _791[1:1];
    assign _820 = _818 ? _383 : _854;
    assign _824 = _820 < _823;
    assign _825 = _824 ? _823 : _820;
    assign _813 = _791[2:2];
    assign _815 = _813 ? _360 : _854;
    assign _810 = _791[3:3];
    assign _812 = _810 ? _339 : _854;
    assign _816 = _812 < _815;
    assign _817 = _816 ? _815 : _812;
    assign _826 = _817 < _825;
    assign _827 = _826 ? _825 : _817;
    assign _803 = _791[4:4];
    assign _805 = _803 ? _314 : _854;
    assign _800 = _791[5:5];
    assign _802 = _800 ? _293 : _854;
    assign _806 = _802 < _805;
    assign _807 = _806 ? _805 : _802;
    assign _795 = _791[6:6];
    assign _797 = _795 ? _270 : _854;
    assign _791 = _790[23:16];
    assign _792 = _791[7:7];
    assign _794 = _792 ? _249 : _854;
    assign _798 = _794 < _797;
    assign _799 = _798 ? _797 : _794;
    assign _808 = _799 < _807;
    assign _809 = _808 ? _807 : _799;
    assign _828 = _809 < _827;
    assign _829 = _828 ? _827 : _809;
    assign _899 = 14'b00000000000000;
    assign _900 = { _899,
                    _829 };
    assign _790 = _224[511:400];
    assign _897 = _790[41:26];
    assign _898 = { gnd,
                    _897 };
    assign _901 = _898 + _900;
    always @(posedge _124) begin
        if (_122)
            _904 <= _915;
        else
            _904 <= _901;
    end
    assign _896 = { gnd,
                    _893 };
    assign _905 = _896 < _904;
    assign _906 = ~ _905;
    assign _910 = _906 | _909;
    assign _919 = _910 & _918;
    assign _836 = _835[25:24];
    always @* begin
        case (_836)
        0:
            _893 <= _191;
        1:
            _893 <= _194;
        2:
            _893 <= _197;
        default:
            _893 <= _197;
        endcase
    end
    assign _895 = _893 == _843;
    assign _923 = _895 ? _922 : _919;
    assign _887 = _181 & _884;
    assign _889 = _887 == _1000;
    assign _890 = ~ _889;
    assign _884 = _835[23:16];
    assign _886 = _884 == _1000;
    assign _891 = _886 | _890;
    assign _879 = _835[7:0];
    assign _877 = _835[15:8];
    assign _878 = _163 ^ _877;
    assign _880 = _878 & _879;
    assign _882 = _880 == _1000;
    assign _876 = _835[111:111];
    assign _883 = _876 & _882;
    assign _892 = _883 & _891;
    assign _924 = _892 & _923;
    assign _929 = _924 & _928;
    assign _965 = _929 & _964;
    assign _966 = _142 & _965;
    assign _504 = _432 == _843;
    assign _500 = _432 == _955;
    assign _501 = _500 & _481;
    assign _498 = _202 == _428;
    assign _502 = _498 | _501;
    assign _505 = _200 ? _504 : _502;
    assign _495 = _457[3:0];
    assign _497 = _495 == _1138;
    assign _506 = _497 | _505;
    assign _493 = _432 == _843;
    assign _489 = _432 == _955;
    assign _490 = _489 & _481;
    assign _487 = _202 == _428;
    assign _491 = _487 | _490;
    assign _494 = _200 ? _493 : _491;
    assign _485 = _419 == _843;
    always @(posedge _124) begin
        if (_122)
            _479 <= _854;
        else
            _479 <= _411;
    end
    assign _480 = { _861,
                    _479 };
    assign _481 = _198 < _480;
    assign _475 = _419 == _955;
    assign _482 = _475 & _481;
    assign _473 = _202 == _416;
    assign _483 = _473 | _482;
    assign _486 = _200 ? _485 : _483;
    assign _472 = _156[104:103];
    always @* begin
        case (_472)
        0:
            _507 <= vdd;
        1:
            _507 <= _486;
        2:
            _507 <= _494;
        default:
            _507 <= _506;
        endcase
    end
    assign _471 = ~ _470;
    assign _508 = _471 | _507;
    assign _463 = _156[62:62];
    assign _437 = _156[61:58];
    always @* begin
        case (_437)
        0:
            _462 <= vdd;
        1:
            _462 <= _442;
        2:
            _462 <= _446;
        3:
            _462 <= _450;
        4:
            _462 <= _452;
        5:
            _462 <= _454;
        6:
            _462 <= _458;
        7:
            _462 <= _461;
        8:
            _462 <= gnd;
        9:
            _462 <= gnd;
        10:
            _462 <= gnd;
        11:
            _462 <= gnd;
        12:
            _462 <= gnd;
        13:
            _462 <= gnd;
        14:
            _462 <= gnd;
        default:
            _462 <= gnd;
        endcase
    end
    assign _464 = _462 ^ _463;
    assign _432 = _156[57:42];
    assign _434 = _432 == _843;
    assign _423 = _225[57:42];
    assign _424 = { gnd,
                    _423 };
    assign _425 = _424 + _412;
    always @(posedge _124) begin
        if (_122)
            _428 <= _915;
        else
            _428 <= _425;
    end
    assign _429 = _428 < _202;
    assign _430 = ~ _429;
    assign _419 = _156[41:26];
    assign _421 = _419 == _955;
    assign _385 = _229[0:0];
    assign _405 = _385 ? _404 : _854;
    assign _364 = _229[1:1];
    assign _384 = _364 ? _383 : _854;
    assign _406 = _384 < _405;
    assign _407 = _406 ? _405 : _384;
    assign _341 = _229[2:2];
    assign _361 = _341 ? _360 : _854;
    assign _320 = _229[3:3];
    assign _340 = _320 ? _339 : _854;
    assign _362 = _340 < _361;
    assign _363 = _362 ? _361 : _340;
    assign _408 = _363 < _407;
    assign _409 = _408 ? _407 : _363;
    assign _295 = _229[4:4];
    assign _315 = _295 ? _314 : _854;
    assign _274 = _229[5:5];
    assign _294 = _274 ? _293 : _854;
    assign _316 = _294 < _315;
    assign _317 = _316 ? _315 : _294;
    assign _251 = _229[6:6];
    assign _271 = _251 ? _270 : _854;
    assign _229 = _225[23:16];
    assign _230 = _229[7:7];
    assign _250 = _230 ? _249 : _854;
    assign _272 = _250 < _271;
    assign _273 = _272 ? _271 : _250;
    assign _318 = _273 < _317;
    assign _319 = _318 ? _317 : _273;
    assign _410 = _319 < _409;
    assign _411 = _410 ? _409 : _319;
    assign _412 = { _899,
                    _411 };
    assign _225 = _224[175:64];
    assign _226 = _225[41:26];
    assign _227 = { gnd,
                    _226 };
    assign _413 = _227 + _412;
    always @(posedge _124) begin
        if (_122)
            _416 <= _915;
        else
            _416 <= _413;
    end
    assign _202 = { gnd,
                    _198 };
    assign _417 = _202 < _416;
    assign _418 = ~ _417;
    assign _422 = _418 | _421;
    assign _431 = _422 & _430;
    assign _188 = _156[25:24];
    always @* begin
        case (_188)
        0:
            _198 <= _191;
        1:
            _198 <= _194;
        2:
            _198 <= _197;
        default:
            _198 <= _197;
        endcase
    end
    assign _200 = _198 == _843;
    assign _435 = _200 ? _434 : _431;
    assign _182 = _181 & _171;
    assign _184 = _182 == _1000;
    assign _185 = ~ _184;
    assign _171 = _156[23:16];
    assign _173 = _171 == _1000;
    assign _186 = _173 | _185;
    assign _166 = _156[7:0];
    assign _164 = _156[15:8];
    assign _165 = _163 ^ _164;
    assign _167 = _165 & _166;
    assign _169 = _167 == _1000;
    assign _144 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _1868 = _207 + _1254;
    assign _974 = 6'b000000;
    assign _79 = host_start_loc;
    assign _1462 = _1461 ? _1459 : _975;
    assign _81 = host_recover_loc;
    assign _1452 = _1121 == _992;
    assign _1453 = _1452 ? _81 : _975;
    assign _1454 = _1120 ? _1453 : _975;
    assign _1463 = _967 ? _1462 : _1454;
    assign _1450 = _140 == _992;
    assign _1464 = _1450 ? _1463 : _975;
    assign _1465 = _134 ? _79 : _1464;
    assign _82 = _1465;
    always @(posedge _124) begin
        if (_122)
            _975 <= _974;
        else
            _975 <= _82;
    end
    assign _1458 = _835[110:105];
    assign _1457 = _647[110:105];
    assign _1456 = _511[110:105];
    assign _1455 = _156[110:105];
    always @* begin
        case (_789)
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
    assign _1460 = _1459 == _975;
    assign _1461 = ~ _1460;
    assign _1864 = _1461 ? _854 : _207;
    assign _1121 = _1084[59:58];
    assign _1859 = _1121 == _992;
    assign _1861 = _1859 ? _854 : _207;
    assign _1114 = _1084[57:50];
    assign _1115 = _181 & _1114;
    assign _1117 = _1115 == _1000;
    assign _1118 = ~ _1117;
    assign _1112 = ~ _967;
    assign _1113 = _142 & _1112;
    assign _1119 = _1113 & _1118;
    assign _1470 = _1111 ? _1056 : _1468;
    assign _1471 = _967 ? _1468 : _1470;
    assign _1468 = _1379 ? _846 : _1109;
    assign _1466 = _140 == _992;
    assign _1472 = _1466 ? _1471 : _1468;
    assign _83 = _1472;
    always @(posedge _124) begin
        if (_122)
            _1109 <= _846;
        else
            _1109 <= _83;
    end
    assign _1110 = ~ _1109;
    assign _1850 = 16'b0000000000000001;
    assign _1851 = _191 + _1850;
    assign _1848 = _191 == _843;
    assign _1849 = ~ _1848;
    assign _1852 = _1849 ? _1851 : _191;
    assign _1812 = _1084[26:24];
    assign _1810 = _835[93:91];
    assign _1809 = _647[93:91];
    assign _1808 = _511[93:91];
    assign _1807 = _156[93:91];
    assign _776 = _733 == _843;
    assign _772 = _733 == _955;
    assign _773 = _772 & _753;
    assign _770 = _669 == _729;
    assign _774 = _770 | _773;
    assign _777 = _668 ? _776 : _774;
    assign _767 = _457[3:0];
    assign _769 = _767 == _1138;
    assign _778 = _769 | _777;
    assign _765 = _733 == _843;
    assign _761 = _733 == _955;
    assign _762 = _761 & _753;
    assign _759 = _669 == _729;
    assign _763 = _759 | _762;
    assign _766 = _668 ? _765 : _763;
    assign _757 = _720 == _843;
    always @(posedge _124) begin
        if (_122)
            _751 <= _854;
        else
            _751 <= _712;
    end
    assign _752 = { _861,
                    _751 };
    assign _753 = _666 < _752;
    assign _747 = _720 == _955;
    assign _754 = _747 & _753;
    assign _745 = _669 == _717;
    assign _755 = _745 | _754;
    assign _758 = _668 ? _757 : _755;
    assign _744 = _647[104:103];
    always @* begin
        case (_744)
        0:
            _779 <= vdd;
        1:
            _779 <= _758;
        2:
            _779 <= _766;
        default:
            _779 <= _778;
        endcase
    end
    assign _743 = ~ _470;
    assign _780 = _743 | _779;
    assign _740 = _647[62:62];
    assign _738 = _647[61:58];
    always @* begin
        case (_738)
        0:
            _739 <= vdd;
        1:
            _739 <= _442;
        2:
            _739 <= _446;
        3:
            _739 <= _450;
        4:
            _739 <= _452;
        5:
            _739 <= _454;
        6:
            _739 <= _458;
        7:
            _739 <= _461;
        8:
            _739 <= gnd;
        9:
            _739 <= gnd;
        10:
            _739 <= gnd;
        11:
            _739 <= gnd;
        12:
            _739 <= gnd;
        13:
            _739 <= gnd;
        14:
            _739 <= gnd;
        default:
            _739 <= gnd;
        endcase
    end
    assign _741 = _739 ^ _740;
    assign _733 = _647[57:42];
    assign _735 = _733 == _843;
    assign _724 = _670[57:42];
    assign _725 = { gnd,
                    _724 };
    assign _726 = _725 + _713;
    always @(posedge _124) begin
        if (_122)
            _729 <= _915;
        else
            _729 <= _726;
    end
    assign _730 = _729 < _669;
    assign _731 = ~ _730;
    assign _720 = _647[41:26];
    assign _722 = _720 == _955;
    assign _704 = _674[0:0];
    assign _706 = _704 ? _404 : _854;
    assign _701 = _674[1:1];
    assign _703 = _701 ? _383 : _854;
    assign _707 = _703 < _706;
    assign _708 = _707 ? _706 : _703;
    assign _696 = _674[2:2];
    assign _698 = _696 ? _360 : _854;
    assign _693 = _674[3:3];
    assign _695 = _693 ? _339 : _854;
    assign _699 = _695 < _698;
    assign _700 = _699 ? _698 : _695;
    assign _709 = _700 < _708;
    assign _710 = _709 ? _708 : _700;
    assign _686 = _674[4:4];
    assign _688 = _686 ? _314 : _854;
    assign _683 = _674[5:5];
    assign _685 = _683 ? _293 : _854;
    assign _689 = _685 < _688;
    assign _690 = _689 ? _688 : _685;
    assign _678 = _674[6:6];
    assign _680 = _678 ? _270 : _854;
    assign _674 = _670[23:16];
    assign _675 = _674[7:7];
    assign _677 = _675 ? _249 : _854;
    assign _681 = _677 < _680;
    assign _682 = _681 ? _680 : _677;
    assign _691 = _682 < _690;
    assign _692 = _691 ? _690 : _682;
    assign _711 = _692 < _710;
    assign _712 = _711 ? _710 : _692;
    assign _713 = { _899,
                    _712 };
    assign _670 = _224[399:288];
    assign _671 = _670[41:26];
    assign _672 = { gnd,
                    _671 };
    assign _714 = _672 + _713;
    always @(posedge _124) begin
        if (_122)
            _717 <= _915;
        else
            _717 <= _714;
    end
    assign _669 = { gnd,
                    _666 };
    assign _718 = _669 < _717;
    assign _719 = ~ _718;
    assign _723 = _719 | _722;
    assign _732 = _723 & _731;
    assign _665 = _647[25:24];
    always @* begin
        case (_665)
        0:
            _666 <= _191;
        1:
            _666 <= _194;
        2:
            _666 <= _197;
        default:
            _666 <= _197;
        endcase
    end
    assign _668 = _666 == _843;
    assign _736 = _668 ? _735 : _732;
    assign _659 = _181 & _656;
    assign _661 = _659 == _1000;
    assign _662 = ~ _661;
    assign _656 = _647[23:16];
    assign _658 = _656 == _1000;
    assign _663 = _658 | _662;
    assign _651 = _647[7:0];
    assign _649 = _647[15:8];
    assign _650 = _163 ^ _649;
    assign _652 = _650 & _651;
    assign _654 = _652 == _1000;
    assign _648 = _647[111:111];
    assign _655 = _648 & _654;
    assign _664 = _655 & _663;
    assign _737 = _664 & _736;
    assign _742 = _737 & _741;
    assign _781 = _742 & _780;
    assign _782 = _142 & _781;
    assign _785 = _782 ? _992 : _1124;
    assign _640 = _597 == _843;
    assign _636 = _597 == _955;
    assign _637 = _636 & _617;
    assign _634 = _533 == _593;
    assign _638 = _634 | _637;
    assign _641 = _532 ? _640 : _638;
    assign _631 = _457[3:0];
    assign _633 = _631 == _1138;
    assign _642 = _633 | _641;
    assign _629 = _597 == _843;
    assign _625 = _597 == _955;
    assign _626 = _625 & _617;
    assign _623 = _533 == _593;
    assign _627 = _623 | _626;
    assign _630 = _532 ? _629 : _627;
    assign _621 = _584 == _843;
    always @(posedge _124) begin
        if (_122)
            _615 <= _854;
        else
            _615 <= _576;
    end
    assign _616 = { _861,
                    _615 };
    assign _617 = _530 < _616;
    assign _611 = _584 == _955;
    assign _618 = _611 & _617;
    assign _609 = _533 == _581;
    assign _619 = _609 | _618;
    assign _622 = _532 ? _621 : _619;
    assign _608 = _511[104:103];
    always @* begin
        case (_608)
        0:
            _643 <= vdd;
        1:
            _643 <= _622;
        2:
            _643 <= _630;
        default:
            _643 <= _642;
        endcase
    end
    assign _85 = host_role;
    assign _1473 = _134 ? _85 : _468;
    assign _86 = _1473;
    always @(posedge _124) begin
        if (_122)
            _468 <= _1365;
        else
            _468 <= _86;
    end
    assign _470 = _468 == _992;
    assign _607 = ~ _470;
    assign _644 = _607 | _643;
    assign _604 = _511[62:62];
    assign _88 = host_match_addr;
    assign _460 = _88[6:0];
    assign _459 = _449[7:1];
    assign _461 = _459 == _460;
    assign _456 = 16'b1010110011100001;
    assign _1478 = _457[10:10];
    assign _1477 = _457[12:12];
    assign _1479 = _1477 ^ _1478;
    assign _1476 = _457[13:13];
    assign _1480 = _1476 ^ _1479;
    assign _1475 = _457[15:15];
    assign _1481 = _1475 ^ _1480;
    assign _1474 = _457[14:0];
    assign _1482 = { _1474,
                     _1481 };
    assign _89 = _1482;
    always @(posedge _124) begin
        if (_122)
            _457 <= _456;
        else
            _457 <= _89;
    end
    assign _458 = _457[0:0];
    assign _1497 = _93 + _1233;
    assign _1495 = _93 - _1233;
    assign _1498 = _1296 ? _1497 : _1495;
    assign _1136 = _93 == _1138;
    assign _1303 = ~ _1136;
    assign _91 = host_rx_pop;
    assign _1304 = _91 & _1303;
    assign _1295 = ~ _454;
    assign _1491 = _1489 == _1124;
    assign _1492 = _1379 & _1491;
    assign _92 = _1492;
    assign _1296 = _92 & _1295;
    assign _1493 = _1296 ^ _1304;
    assign _1499 = _1493 ? _1498 : _93;
    always @(posedge _124) begin
        if (_122)
            _1502 <= _1138;
        else
            _1502 <= _1499;
    end
    assign _93 = _1502;
    assign _454 = _93 == _1060;
    assign _1519 = _449[6:0];
    assign _1520 = { _1519,
                     _1516 };
    assign _1517 = _449[7:1];
    assign _1515 = _163[7:7];
    assign _1514 = _163[6:6];
    assign _1513 = _163[5:5];
    assign _1512 = _163[4:4];
    assign _1511 = _163[3:3];
    assign _1510 = _163[2:2];
    assign _1509 = _163[1:1];
    assign _1508 = _163[0:0];
    assign _1506 = _835[102:100];
    assign _1505 = _647[102:100];
    assign _1504 = _511[102:100];
    assign _1503 = _156[102:100];
    always @* begin
        case (_789)
        0:
            _1507 <= _1503;
        1:
            _1507 <= _1504;
        2:
            _1507 <= _1505;
        default:
            _1507 <= _1506;
        endcase
    end
    always @* begin
        case (_1507)
        0:
            _1516 <= _1508;
        1:
            _1516 <= _1509;
        2:
            _1516 <= _1510;
        3:
            _1516 <= _1511;
        4:
            _1516 <= _1512;
        5:
            _1516 <= _1513;
        6:
            _1516 <= _1514;
        default:
            _1516 <= _1515;
        endcase
    end
    assign _1518 = { _1516,
                     _1517 };
    assign _1486 = _835[97:96];
    assign _1485 = _647[97:96];
    assign _1484 = _511[97:96];
    assign _1483 = _156[97:96];
    always @* begin
        case (_789)
        0:
            _1487 <= _1483;
        1:
            _1487 <= _1484;
        2:
            _1487 <= _1485;
        default:
            _1487 <= _1486;
        endcase
    end
    assign _1489 = _1083 ? _1365 : _1487;
    always @* begin
        case (_1489)
        0:
            _1521 <= _449;
        1:
            _1521 <= _1518;
        2:
            _1521 <= _1520;
        default:
            _1521 <= _449;
        endcase
    end
    assign _1522 = _1379 ? _1521 : _449;
    assign _94 = _1522;
    always @(posedge _124) begin
        if (_122)
            _449 <= _1000;
        else
            _449 <= _94;
    end
    assign _450 = _449[0:0];
    assign _1622 = _445[7:1];
    assign _1623 = { vdd,
                     _1622 };
    assign _1620 = _1612[7:7];
    assign _1619 = _1612[6:6];
    assign _1618 = _1612[5:5];
    assign _1617 = _1612[4:4];
    assign _1616 = _1612[3:3];
    assign _1615 = _1612[2:2];
    assign _1614 = _1612[1:1];
    assign _1613 = _1612[0:0];
    assign _1621 = { _1613,
                     _1614,
                     _1615,
                     _1616,
                     _1617,
                     _1618,
                     _1619,
                     _1620 };
    assign _1607 = _1527 == _1290;
    assign _1608 = _1524 & _1607;
    always @(posedge _124) begin
        if (_122)
            _1609 <= _1000;
        else
            if (_1608)
                _1609 <= _97;
    end
    assign _1601 = _1527 == _1284;
    assign _1602 = _1524 & _1601;
    always @(posedge _124) begin
        if (_122)
            _1603 <= _1000;
        else
            if (_1602)
                _1603 <= _97;
    end
    assign _1595 = _1527 == _1278;
    assign _1596 = _1524 & _1595;
    always @(posedge _124) begin
        if (_122)
            _1597 <= _1000;
        else
            if (_1596)
                _1597 <= _97;
    end
    assign _1589 = _1527 == _1041;
    assign _1590 = _1524 & _1589;
    always @(posedge _124) begin
        if (_122)
            _1591 <= _1000;
        else
            if (_1590)
                _1591 <= _97;
    end
    assign _1583 = _1527 == _1266;
    assign _1584 = _1524 & _1583;
    always @(posedge _124) begin
        if (_122)
            _1585 <= _1000;
        else
            if (_1584)
                _1585 <= _97;
    end
    assign _1577 = _1527 == _1260;
    assign _1578 = _1524 & _1577;
    always @(posedge _124) begin
        if (_122)
            _1579 <= _1000;
        else
            if (_1578)
                _1579 <= _97;
    end
    assign _1571 = _1527 == _1254;
    assign _1572 = _1524 & _1571;
    always @(posedge _124) begin
        if (_122)
            _1573 <= _1000;
        else
            if (_1572)
                _1573 <= _97;
    end
    assign _1529 = _1527 + _1254;
    assign _1530 = _1524 ? _1529 : _1527;
    assign _95 = _1530;
    always @(posedge _124) begin
        if (_122)
            _1527 <= _854;
        else
            _1527 <= _95;
    end
    assign _1565 = _1527 == _854;
    assign _1566 = _1524 & _1565;
    assign _97 = host_tx_data;
    always @(posedge _124) begin
        if (_122)
            _1567 <= _1000;
        else
            if (_1566)
                _1567 <= _97;
    end
    assign _1537 = _1535 + _1254;
    assign _1538 = _1532 ? _1537 : _1535;
    assign _98 = _1538;
    always @(posedge _124) begin
        if (_122)
            _1535 <= _854;
        else
            _1535 <= _98;
    end
    always @* begin
        case (_1535)
        0:
            _1610 <= _1567;
        1:
            _1610 <= _1573;
        2:
            _1610 <= _1579;
        3:
            _1610 <= _1585;
        4:
            _1610 <= _1591;
        5:
            _1610 <= _1597;
        6:
            _1610 <= _1603;
        default:
            _1610 <= _1609;
        endcase
    end
    assign _1556 = _102 + _1233;
    assign _1554 = _102 - _1233;
    assign _1557 = _1524 ? _1556 : _1554;
    assign _1531 = ~ _452;
    assign _1549 = _1545 == _992;
    assign _1547 = _1545 == _991;
    assign _1550 = _1547 | _1549;
    assign _1551 = _1379 & _1550;
    assign _99 = _1551;
    assign _1532 = _99 & _1531;
    assign _1361 = _102 == _1060;
    assign _1523 = ~ _1361;
    assign _101 = host_tx_push;
    assign _1524 = _101 & _1523;
    assign _1552 = _1524 ^ _1532;
    assign _1558 = _1552 ? _1557 : _102;
    always @(posedge _124) begin
        if (_122)
            _1561 <= _1138;
        else
            _1561 <= _1558;
    end
    assign _102 = _1561;
    assign _452 = _102 == _1138;
    assign _1612 = _452 ? _998 : _1610;
    assign _1544 = _1084[28:27];
    assign _1542 = _835[95:94];
    assign _1541 = _647[95:94];
    assign _1540 = _511[95:94];
    assign _1539 = _156[95:94];
    always @* begin
        case (_789)
        0:
            _1543 <= _1539;
        1:
            _1543 <= _1540;
        2:
            _1543 <= _1541;
        default:
            _1543 <= _1542;
        endcase
    end
    assign _1545 = _1083 ? _1544 : _1543;
    always @* begin
        case (_1545)
        0:
            _1624 <= _445;
        1:
            _1624 <= _1612;
        2:
            _1624 <= _1621;
        default:
            _1624 <= _1623;
        endcase
    end
    assign _1625 = _1379 ? _1624 : _445;
    assign _103 = _1625;
    always @(posedge _124) begin
        if (_122)
            _445 <= _1000;
        else
            _445 <= _103;
    end
    assign _446 = _445[0:0];
    assign _1636 = 8'b00001000;
    assign _1635 = 8'b00000111;
    assign _1633 = 8'b00000001;
    assign _1634 = _440 - _1633;
    assign _1631 = _1084[30:29];
    assign _835 = _155[511:400];
    assign _1629 = _835[99:98];
    assign _647 = _155[399:288];
    assign _1628 = _647[99:98];
    assign _1627 = _511[99:98];
    assign _1626 = _156[99:98];
    always @* begin
        case (_789)
        0:
            _1630 <= _1626;
        1:
            _1630 <= _1627;
        2:
            _1630 <= _1628;
        default:
            _1630 <= _1629;
        endcase
    end
    assign _1632 = _1083 ? _1631 : _1630;
    always @* begin
        case (_1632)
        0:
            _1637 <= _440;
        1:
            _1637 <= _1634;
        2:
            _1637 <= _1635;
        default:
            _1637 <= _1636;
        endcase
    end
    assign _1638 = _1379 ? _1637 : _440;
    assign _104 = _1638;
    always @(posedge _124) begin
        if (_122)
            _440 <= _1000;
        else
            _440 <= _104;
    end
    assign _442 = _440 == _1000;
    assign _602 = _511[61:58];
    always @* begin
        case (_602)
        0:
            _603 <= vdd;
        1:
            _603 <= _442;
        2:
            _603 <= _446;
        3:
            _603 <= _450;
        4:
            _603 <= _452;
        5:
            _603 <= _454;
        6:
            _603 <= _458;
        7:
            _603 <= _461;
        8:
            _603 <= gnd;
        9:
            _603 <= gnd;
        10:
            _603 <= gnd;
        11:
            _603 <= gnd;
        12:
            _603 <= gnd;
        13:
            _603 <= gnd;
        14:
            _603 <= gnd;
        default:
            _603 <= gnd;
        endcase
    end
    assign _605 = _603 ^ _604;
    assign _597 = _511[57:42];
    assign _599 = _597 == _843;
    assign _588 = _534[57:42];
    assign _589 = { gnd,
                    _588 };
    assign _590 = _589 + _577;
    always @(posedge _124) begin
        if (_122)
            _593 <= _915;
        else
            _593 <= _590;
    end
    assign _594 = _593 < _533;
    assign _595 = ~ _594;
    assign _584 = _511[41:26];
    assign _586 = _584 == _955;
    assign _400 = _396 + _1254;
    assign _1654 = _396 + _1254;
    assign _1650 = _396 == _1290;
    assign _1651 = ~ _1650;
    assign _1648 = _176[0:0];
    assign _1652 = _1648 & _1651;
    assign _1655 = _1652 ? _1654 : _396;
    assign _1645 = _176[0:0];
    assign _1646 = ~ _1645;
    assign _1644 = _180[0:0];
    assign _1647 = _1644 & _1646;
    assign _1657 = _1647 ? _1254 : _1655;
    assign _1641 = _140 == _992;
    assign _1643 = _1641 ? _854 : _396;
    assign _1640 = _140 == _991;
    assign _1658 = _1640 ? _1657 : _1643;
    assign _105 = _1658;
    always @(posedge _124) begin
        if (_122)
            _396 <= _854;
        else
            _396 <= _105;
    end
    assign _398 = _396 == _1290;
    assign _401 = _398 ? _396 : _400;
    assign _391 = _176[0:0];
    assign _392 = ~ _391;
    assign _390 = _180[0:0];
    assign _393 = _390 & _392;
    assign _403 = _393 ? _1254 : _401;
    assign _387 = _181[0:0];
    assign _388 = _204 & _387;
    assign _404 = _388 ? _403 : _854;
    assign _568 = _538[0:0];
    assign _570 = _568 ? _404 : _854;
    assign _379 = _375 + _1254;
    assign _1673 = _375 + _1254;
    assign _1669 = _375 == _1290;
    assign _1670 = ~ _1669;
    assign _1667 = _176[1:1];
    assign _1671 = _1667 & _1670;
    assign _1674 = _1671 ? _1673 : _375;
    assign _1664 = _176[1:1];
    assign _1665 = ~ _1664;
    assign _1663 = _180[1:1];
    assign _1666 = _1663 & _1665;
    assign _1676 = _1666 ? _1254 : _1674;
    assign _1660 = _140 == _992;
    assign _1662 = _1660 ? _854 : _375;
    assign _1659 = _140 == _991;
    assign _1677 = _1659 ? _1676 : _1662;
    assign _106 = _1677;
    always @(posedge _124) begin
        if (_122)
            _375 <= _854;
        else
            _375 <= _106;
    end
    assign _377 = _375 == _1290;
    assign _380 = _377 ? _375 : _379;
    assign _370 = _176[1:1];
    assign _371 = ~ _370;
    assign _369 = _180[1:1];
    assign _372 = _369 & _371;
    assign _382 = _372 ? _1254 : _380;
    assign _366 = _181[1:1];
    assign _367 = _204 & _366;
    assign _383 = _367 ? _382 : _854;
    assign _565 = _538[1:1];
    assign _567 = _565 ? _383 : _854;
    assign _571 = _567 < _570;
    assign _572 = _571 ? _570 : _567;
    assign _356 = _352 + _1254;
    assign _1692 = _352 + _1254;
    assign _1688 = _352 == _1290;
    assign _1689 = ~ _1688;
    assign _1686 = _176[2:2];
    assign _1690 = _1686 & _1689;
    assign _1693 = _1690 ? _1692 : _352;
    assign _1683 = _176[2:2];
    assign _1684 = ~ _1683;
    assign _1682 = _180[2:2];
    assign _1685 = _1682 & _1684;
    assign _1695 = _1685 ? _1254 : _1693;
    assign _1679 = _140 == _992;
    assign _1681 = _1679 ? _854 : _352;
    assign _1678 = _140 == _991;
    assign _1696 = _1678 ? _1695 : _1681;
    assign _107 = _1696;
    always @(posedge _124) begin
        if (_122)
            _352 <= _854;
        else
            _352 <= _107;
    end
    assign _354 = _352 == _1290;
    assign _357 = _354 ? _352 : _356;
    assign _347 = _176[2:2];
    assign _348 = ~ _347;
    assign _346 = _180[2:2];
    assign _349 = _346 & _348;
    assign _359 = _349 ? _1254 : _357;
    assign _343 = _181[2:2];
    assign _344 = _204 & _343;
    assign _360 = _344 ? _359 : _854;
    assign _560 = _538[2:2];
    assign _562 = _560 ? _360 : _854;
    assign _335 = _331 + _1254;
    assign _1711 = _331 + _1254;
    assign _1707 = _331 == _1290;
    assign _1708 = ~ _1707;
    assign _1705 = _176[3:3];
    assign _1709 = _1705 & _1708;
    assign _1712 = _1709 ? _1711 : _331;
    assign _1702 = _176[3:3];
    assign _1703 = ~ _1702;
    assign _1701 = _180[3:3];
    assign _1704 = _1701 & _1703;
    assign _1714 = _1704 ? _1254 : _1712;
    assign _1698 = _140 == _992;
    assign _1700 = _1698 ? _854 : _331;
    assign _1697 = _140 == _991;
    assign _1715 = _1697 ? _1714 : _1700;
    assign _108 = _1715;
    always @(posedge _124) begin
        if (_122)
            _331 <= _854;
        else
            _331 <= _108;
    end
    assign _333 = _331 == _1290;
    assign _336 = _333 ? _331 : _335;
    assign _326 = _176[3:3];
    assign _327 = ~ _326;
    assign _325 = _180[3:3];
    assign _328 = _325 & _327;
    assign _338 = _328 ? _1254 : _336;
    assign _322 = _181[3:3];
    assign _323 = _204 & _322;
    assign _339 = _323 ? _338 : _854;
    assign _557 = _538[3:3];
    assign _559 = _557 ? _339 : _854;
    assign _563 = _559 < _562;
    assign _564 = _563 ? _562 : _559;
    assign _573 = _564 < _572;
    assign _574 = _573 ? _572 : _564;
    assign _310 = _306 + _1254;
    assign _1730 = _306 + _1254;
    assign _1726 = _306 == _1290;
    assign _1727 = ~ _1726;
    assign _1724 = _176[4:4];
    assign _1728 = _1724 & _1727;
    assign _1731 = _1728 ? _1730 : _306;
    assign _1721 = _176[4:4];
    assign _1722 = ~ _1721;
    assign _1720 = _180[4:4];
    assign _1723 = _1720 & _1722;
    assign _1733 = _1723 ? _1254 : _1731;
    assign _1717 = _140 == _992;
    assign _1719 = _1717 ? _854 : _306;
    assign _1716 = _140 == _991;
    assign _1734 = _1716 ? _1733 : _1719;
    assign _109 = _1734;
    always @(posedge _124) begin
        if (_122)
            _306 <= _854;
        else
            _306 <= _109;
    end
    assign _308 = _306 == _1290;
    assign _311 = _308 ? _306 : _310;
    assign _301 = _176[4:4];
    assign _302 = ~ _301;
    assign _300 = _180[4:4];
    assign _303 = _300 & _302;
    assign _313 = _303 ? _1254 : _311;
    assign _297 = _181[4:4];
    assign _298 = _204 & _297;
    assign _314 = _298 ? _313 : _854;
    assign _550 = _538[4:4];
    assign _552 = _550 ? _314 : _854;
    assign _289 = _285 + _1254;
    assign _1749 = _285 + _1254;
    assign _1745 = _285 == _1290;
    assign _1746 = ~ _1745;
    assign _1743 = _176[5:5];
    assign _1747 = _1743 & _1746;
    assign _1750 = _1747 ? _1749 : _285;
    assign _1740 = _176[5:5];
    assign _1741 = ~ _1740;
    assign _1739 = _180[5:5];
    assign _1742 = _1739 & _1741;
    assign _1752 = _1742 ? _1254 : _1750;
    assign _1736 = _140 == _992;
    assign _1738 = _1736 ? _854 : _285;
    assign _1735 = _140 == _991;
    assign _1753 = _1735 ? _1752 : _1738;
    assign _110 = _1753;
    always @(posedge _124) begin
        if (_122)
            _285 <= _854;
        else
            _285 <= _110;
    end
    assign _287 = _285 == _1290;
    assign _290 = _287 ? _285 : _289;
    assign _280 = _176[5:5];
    assign _281 = ~ _280;
    assign _279 = _180[5:5];
    assign _282 = _279 & _281;
    assign _292 = _282 ? _1254 : _290;
    assign _276 = _181[5:5];
    assign _277 = _204 & _276;
    assign _293 = _277 ? _292 : _854;
    assign _547 = _538[5:5];
    assign _549 = _547 ? _293 : _854;
    assign _553 = _549 < _552;
    assign _554 = _553 ? _552 : _549;
    assign _266 = _262 + _1254;
    assign _1768 = _262 + _1254;
    assign _1764 = _262 == _1290;
    assign _1765 = ~ _1764;
    assign _1762 = _176[6:6];
    assign _1766 = _1762 & _1765;
    assign _1769 = _1766 ? _1768 : _262;
    assign _1759 = _176[6:6];
    assign _1760 = ~ _1759;
    assign _1758 = _180[6:6];
    assign _1761 = _1758 & _1760;
    assign _1771 = _1761 ? _1254 : _1769;
    assign _1755 = _140 == _992;
    assign _1757 = _1755 ? _854 : _262;
    assign _1754 = _140 == _991;
    assign _1772 = _1754 ? _1771 : _1757;
    assign _111 = _1772;
    always @(posedge _124) begin
        if (_122)
            _262 <= _854;
        else
            _262 <= _111;
    end
    assign _264 = _262 == _1290;
    assign _267 = _264 ? _262 : _266;
    assign _257 = _176[6:6];
    assign _258 = ~ _257;
    assign _256 = _180[6:6];
    assign _259 = _256 & _258;
    assign _269 = _259 ? _1254 : _267;
    assign _253 = _181[6:6];
    assign _254 = _204 & _253;
    assign _270 = _254 ? _269 : _854;
    assign _542 = _538[6:6];
    assign _544 = _542 ? _270 : _854;
    assign _245 = _241 + _1254;
    assign _1787 = _241 + _1254;
    assign _1783 = _241 == _1290;
    assign _1784 = ~ _1783;
    assign _1781 = _176[7:7];
    assign _1785 = _1781 & _1784;
    assign _1788 = _1785 ? _1787 : _241;
    assign _1778 = _176[7:7];
    assign _1779 = ~ _1778;
    assign _1777 = _180[7:7];
    assign _1780 = _1777 & _1779;
    assign _1790 = _1780 ? _1254 : _1788;
    assign _1774 = _140 == _992;
    assign _1776 = _1774 ? _854 : _241;
    assign _1773 = _140 == _991;
    assign _1791 = _1773 ? _1790 : _1776;
    assign _112 = _1791;
    always @(posedge _124) begin
        if (_122)
            _241 <= _854;
        else
            _241 <= _112;
    end
    assign _243 = _241 == _1290;
    assign _246 = _243 ? _241 : _245;
    assign _236 = _176[7:7];
    assign _237 = ~ _236;
    assign _235 = _180[7:7];
    assign _238 = _235 & _237;
    assign _248 = _238 ? _1254 : _246;
    assign _232 = _181[7:7];
    assign _233 = _204 & _232;
    assign _249 = _233 ? _248 : _854;
    assign _538 = _534[23:16];
    assign _539 = _538[7:7];
    assign _541 = _539 ? _249 : _854;
    assign _545 = _541 < _544;
    assign _546 = _545 ? _544 : _541;
    assign _555 = _546 < _554;
    assign _556 = _555 ? _554 : _546;
    assign _575 = _556 < _574;
    assign _576 = _575 ? _574 : _556;
    assign _577 = { _899,
                    _576 };
    assign _1794 = _207 == _1254;
    assign _1795 = _1794 ? _117 : _154;
    assign _1792 = _140 == _991;
    assign _1796 = _1792 ? _1795 : _154;
    assign _113 = _1796;
    always @(posedge _124) begin
        if (_122)
            _154 <= _144;
        else
            _154 <= _113;
    end
    assign _221 = _207 == _1254;
    assign _222 = _204 & _221;
    assign _223 = _222 ? _117 : _154;
    assign _1799 = _207 == _1260;
    assign _1800 = _1799 ? _117 : _151;
    assign _1797 = _140 == _991;
    assign _1801 = _1797 ? _1800 : _151;
    assign _114 = _1801;
    always @(posedge _124) begin
        if (_122)
            _151 <= _144;
        else
            _151 <= _114;
    end
    assign _217 = _207 == _1260;
    assign _218 = _204 & _217;
    assign _219 = _218 ? _117 : _151;
    assign _1804 = _207 == _1266;
    assign _1805 = _1804 ? _117 : _148;
    assign _1802 = _140 == _991;
    assign _1806 = _1802 ? _1805 : _148;
    assign _115 = _1806;
    always @(posedge _124) begin
        if (_122)
            _148 <= _144;
        else
            _148 <= _115;
    end
    assign _213 = _207 == _1266;
    assign _214 = _204 & _213;
    assign _215 = _214 ? _117 : _148;
    assign _117 = ram_rec_rdata;
    assign _209 = _207 == _1041;
    assign _210 = _204 & _209;
    assign _211 = _210 ? _117 : _145;
    assign _224 = { _211,
                    _215,
                    _219,
                    _223 };
    assign _534 = _224[287:176];
    assign _535 = _534[41:26];
    assign _536 = { gnd,
                    _535 };
    assign _578 = _536 + _577;
    always @(posedge _124) begin
        if (_122)
            _581 <= _915;
        else
            _581 <= _578;
    end
    assign gnd = 1'b0;
    assign _533 = { gnd,
                    _530 };
    assign _582 = _533 < _581;
    assign _583 = ~ _582;
    assign _587 = _583 | _586;
    assign _596 = _587 & _595;
    assign _1820 = _197 + _1850;
    assign _1817 = _197 == _843;
    assign _1818 = ~ _1817;
    assign _1821 = _1818 ? _1820 : _197;
    assign _1814 = _1813[2:2];
    assign _1815 = _1379 & _1814;
    assign _1823 = _1815 ? _955 : _1821;
    assign _1825 = _134 ? _955 : _1823;
    assign _118 = _1825;
    always @(posedge _124) begin
        if (_122)
            _197 <= _955;
        else
            _197 <= _118;
    end
    assign _1832 = _194 + _1850;
    assign _1829 = _194 == _843;
    assign _1830 = ~ _1829;
    assign _1833 = _1830 ? _1832 : _194;
    assign _1826 = _1813[1:1];
    assign _1827 = _1379 & _1826;
    assign _1835 = _1827 ? _955 : _1833;
    assign _1837 = _134 ? _955 : _1835;
    assign _119 = _1837;
    always @(posedge _124) begin
        if (_122)
            _194 <= _955;
        else
            _194 <= _119;
    end
    assign _529 = _511[25:24];
    always @* begin
        case (_529)
        0:
            _530 <= _191;
        1:
            _530 <= _194;
        2:
            _530 <= _197;
        default:
            _530 <= _197;
        endcase
    end
    assign _532 = _530 == _843;
    assign _600 = _532 ? _599 : _596;
    always @(posedge _124) begin
        if (_122)
            _179 <= _1000;
        else
            _179 <= _163;
    end
    assign _180 = _163 ^ _179;
    assign _1839 = _140 == _992;
    assign _1841 = _1839 ? _1000 : _176;
    assign _1838 = _140 == _991;
    assign _1842 = _1838 ? _181 : _1841;
    assign _1844 = _134 ? _1000 : _1842;
    assign _120 = _1844;
    always @(posedge _124) begin
        if (_122)
            _176 <= _1000;
        else
            _176 <= _120;
    end
    assign _181 = _176 | _180;
    assign _523 = _181 & _520;
    assign _525 = _523 == _1000;
    assign _526 = ~ _525;
    assign _520 = _511[23:16];
    assign _522 = _520 == _1000;
    assign _527 = _522 | _526;
    assign _515 = _511[7:0];
    assign _513 = _511[15:8];
    assign vdd = 1'b1;
    assign _122 = clear;
    assign _124 = clock;
    assign _126 = pins_in;
    always @(posedge _124) begin
        if (_122)
            _160 <= _1000;
        else
            _160 <= _126;
    end
    always @(posedge _124) begin
        if (_122)
            _163 <= _1000;
        else
            _163 <= _160;
    end
    assign _514 = _163 ^ _513;
    assign _516 = _514 & _515;
    assign _518 = _516 == _1000;
    assign _511 = _155[287:176];
    assign _512 = _511[111:111];
    assign _519 = _512 & _518;
    assign _528 = _519 & _527;
    assign _601 = _528 & _600;
    assign _606 = _601 & _605;
    assign _645 = _606 & _644;
    assign _646 = _142 & _645;
    assign _787 = _646 ? _991 : _785;
    assign _789 = _510 ? _1365 : _787;
    always @* begin
        case (_789)
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
    assign _1813 = _1083 ? _1812 : _1811;
    assign _1845 = _1813[0:0];
    assign _1846 = _1379 & _1845;
    assign _1854 = _1846 ? _955 : _1852;
    assign _1856 = _134 ? _955 : _1854;
    assign _127 = _1856;
    always @(posedge _124) begin
        if (_122)
            _191 <= _955;
        else
            _191 <= _127;
    end
    assign _1103 = _1084[33:32];
    always @* begin
        case (_1103)
        0:
            _1104 <= _191;
        1:
            _1104 <= _194;
        2:
            _1104 <= _197;
        default:
            _1104 <= _197;
        endcase
    end
    assign _1102 = _1084[49:34];
    assign _1105 = _1102 < _1104;
    assign _1084 = _155[63:0];
    assign _1100 = _1084[31:31];
    assign _1098 = ~ _967;
    assign _1099 = _142 & _1098;
    assign _1101 = _1099 & _1100;
    assign _1106 = _1101 & _1105;
    assign _1111 = _1106 & _1110;
    assign _1120 = _1111 | _1119;
    assign _1862 = _1120 ? _1861 : _207;
    assign _1865 = _967 ? _1864 : _1862;
    assign _1858 = _140 == _992;
    assign _1866 = _1858 ? _1865 : _207;
    assign _1857 = _140 == _991;
    assign _1869 = _1857 ? _1868 : _1866;
    assign _1871 = _134 ? _854 : _1869;
    assign _128 = _1871;
    always @(posedge _124) begin
        if (_122)
            _207 <= _854;
        else
            _207 <= _128;
    end
    assign _1874 = _207 == _1041;
    assign _1875 = _1874 ? _117 : _145;
    assign _1872 = _140 == _991;
    assign _1876 = _1872 ? _1875 : _145;
    assign _129 = _1876;
    always @(posedge _124) begin
        if (_122)
            _145 <= _144;
        else
            _145 <= _129;
    end
    assign _155 = { _145,
                    _148,
                    _151,
                    _154 };
    assign _156 = _155[175:64];
    assign _157 = _156[111:111];
    assign _170 = _157 & _169;
    assign _187 = _170 & _186;
    assign _436 = _187 & _435;
    assign _465 = _436 & _464;
    assign _509 = _465 & _508;
    assign _142 = _140 == _992;
    assign _510 = _142 & _509;
    assign _874 = _510 | _646;
    assign _875 = _874 | _782;
    assign _967 = _875 | _966;
    assign _1895 = _967 ? _1894 : _1892;
    assign _1880 = _140 == _1124;
    assign _1882 = _1880 ? _1365 : _140;
    assign _1878 = _140 == _992;
    assign _1896 = _1878 ? _1895 : _1882;
    assign _1877 = _140 == _991;
    assign _1899 = _1877 ? _1898 : _1896;
    assign _131 = host_stop;
    assign _1901 = _131 ? _1365 : _1899;
    assign _1903 = _134 ? _991 : _1901;
    assign _132 = _1903;
    always @(posedge _124) begin
        if (_122)
            _140 <= _1365;
        else
            _140 <= _132;
    end
    assign _204 = _140 == _991;
    assign _1083 = _204 & _1082;
    assign _1379 = _1083 | _967;
    assign _1383 = _1379 & _1382;
    assign _1925 = _1383 ? _1924 : _1446;
    assign _134 = host_start;
    assign _1927 = _134 ? _1000 : _1925;
    assign _135 = _1927;
    always @(posedge _124) begin
        if (_122)
            _1446 <= _1000;
        else
            _1446 <= _135;
    end
    assign _1929 = _1446 & _1928;
    assign pins_out = _1929;
    assign pins_oe = _1449;
    assign st_running = _1378;
    assign st_in_entry = _204;
    assign st_cur_loc = _975;
    assign st_accepting = _1377;
    assign st_taken = _1375;
    assign st_taken_edge = _1372;
    assign st_viol = _1369;
    assign st_viol_kind = _1366;
    assign st_timestamp = _1154;
    assign st_tx_full = _1361;
    assign st_tx_empty = _452;
    assign st_rx_data = _1359;
    assign st_rx_empty = _1136;
    assign st_vlog_data = _1294;
    assign st_vlog_empty = _1139;
    assign st_cov_rdata = _46;
    assign st_irq = _1143;
    assign st_halted_viol = _1080;
    assign st_rx_overflow = _1073;
    assign st_vlog_overflow = _1065;
    assign st_cov_overrun = _1055;
    assign ram_rec_addr = _1046;
    assign ram_rec_re = _1043;
    assign ram_rec_we = _1040;
    assign ram_rec_wdata = _20;
    assign ram_cov_addr = _1039;
    assign ram_cov_re = _1034;
    assign ram_cov_we = _1031;
    assign ram_cov_wdata = _1023;

endmodule
