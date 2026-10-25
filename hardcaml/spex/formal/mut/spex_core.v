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
    host_lane1_sync_mask,
    host_lane1_sync,
    host_lane0_sync_mask,
    host_lane0_sync,
    host_match_addr,
    host_rx_pop,
    host_lane1_stuff_len,
    host_lane1_lsb_first,
    host_lane1_crc_inv,
    host_lane1_init,
    host_lane1_crc_width,
    host_lane1_poly,
    host_lane1_frame_bits,
    host_lane1_stuff,
    host_lane1_readback,
    host_lane1_clk_pin,
    host_lane1_clk_edge,
    host_lane1_div_int,
    host_lane1_div_frac,
    host_lane1_code,
    host_lane1_data_pin,
    host_lane1_clk_pin_en,
    host_lane1_dir,
    host_lane0_stuff_len,
    host_tx_data,
    host_lane0_lsb_first,
    host_lane0_crc_inv,
    host_lane0_init,
    host_lane0_crc_width,
    host_lane0_poly,
    host_lane0_frame_bits,
    host_lane0_stuff,
    host_lane0_readback,
    host_lane0_clk_pin,
    host_lane0_clk_edge,
    host_lane0_div_int,
    host_lane0_div_frac,
    host_lane0_code,
    host_lane0_data_pin,
    host_lane0_clk_pin_en,
    host_lane0_dir,
    host_tx_push,
    ram_rec_rdata,
    clear,
    clock,
    pins_in,
    host_stop,
    host_start,
    host_pin_src,
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
    st_lane_status,
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
    input [15:0] host_lane1_sync_mask;
    input [15:0] host_lane1_sync;
    input [15:0] host_lane0_sync_mask;
    input [15:0] host_lane0_sync;
    input [7:0] host_match_addr;
    input host_rx_pop;
    input [2:0] host_lane1_stuff_len;
    input host_lane1_lsb_first;
    input host_lane1_crc_inv;
    input [31:0] host_lane1_init;
    input [5:0] host_lane1_crc_width;
    input [31:0] host_lane1_poly;
    input [15:0] host_lane1_frame_bits;
    input [1:0] host_lane1_stuff;
    input host_lane1_readback;
    input [2:0] host_lane1_clk_pin;
    input host_lane1_clk_edge;
    input [15:0] host_lane1_div_int;
    input [7:0] host_lane1_div_frac;
    input [1:0] host_lane1_code;
    input [2:0] host_lane1_data_pin;
    input host_lane1_clk_pin_en;
    input host_lane1_dir;
    input [2:0] host_lane0_stuff_len;
    input [7:0] host_tx_data;
    input host_lane0_lsb_first;
    input host_lane0_crc_inv;
    input [31:0] host_lane0_init;
    input [5:0] host_lane0_crc_width;
    input [31:0] host_lane0_poly;
    input [15:0] host_lane0_frame_bits;
    input [1:0] host_lane0_stuff;
    input host_lane0_readback;
    input [2:0] host_lane0_clk_pin;
    input host_lane0_clk_edge;
    input [15:0] host_lane0_div_int;
    input [7:0] host_lane0_div_frac;
    input [1:0] host_lane0_code;
    input [2:0] host_lane0_data_pin;
    input host_lane0_clk_pin_en;
    input host_lane0_dir;
    input host_tx_push;
    input [127:0] ram_rec_rdata;
    input clear;
    input clock;
    input [7:0] pins_in;
    input host_stop;
    input host_start;
    input [23:0] host_pin_src;
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
    output [15:0] st_lane_status;
    output [7:0] ram_rec_addr;
    output ram_rec_re;
    output ram_rec_we;
    output [127:0] ram_rec_wdata;
    output [7:0] ram_cov_addr;
    output ram_cov_re;
    output ram_cov_we;
    output [31:0] ram_cov_wdata;

    wire [11:0] _1172;
    wire _1169;
    wire _1170;
    wire [11:0] _1171;
    wire _1173;
    wire [11:0] _1174;
    wire [11:0] _1175;
    wire [11:0] _1161;
    wire [11:0] _1021;
    wire [11:0] _1018;
    wire [12:0] _1015;
    wire [9:0] _1012;
    wire [12:0] _1013;
    wire [12:0] _1014;
    wire [2:0] _1008;
    reg [2:0] _987;
    wire [2:0] _1;
    reg [2:0] _1009;
    wire [12:0] _1010;
    wire [12:0] _995;
    wire [12:0] _994;
    wire [15:0] _988;
    wire _993;
    wire [12:0] _996;
    wire [12:0] _2;
    reg [12:0] _1005;
    wire _1011;
    wire [12:0] _1016;
    wire [12:0] _1002;
    wire _1017;
    wire [11:0] _1020;
    wire _1000;
    wire [15:0] _997;
    wire _998;
    wire _3;
    reg _1001;
    wire [11:0] _1022;
    wire [11:0] _4;
    reg [11:0] _1162;
    wire [11:0] _1025;
    reg [1:0] _991;
    reg [15:0] _992;
    wire [15:0] _1023;
    wire _1024;
    wire [11:0] _1027;
    wire [11:0] _5;
    reg [11:0] _1159;
    wire _1163;
    wire _1164;
    wire [11:0] _1165;
    wire [11:0] _1156;
    wire _1166;
    wire [11:0] _1167;
    wire [7:0] _1154;
    wire _1155;
    wire [11:0] _1168;
    wire [7:0] _1152;
    wire [7:0] _1151;
    wire [1:0] _1146;
    wire [1:0] _1145;
    wire _1134;
    wire _1126;
    wire _1135;
    wire _6;
    reg _1144;
    wire [1:0] _1147;
    wire [6:0] _1141;
    wire [8:0] _1148;
    wire [7:0] _1139;
    wire [8:0] _1140;
    wire [8:0] _1149;
    wire _1150;
    wire [7:0] _1153;
    wire [31:0] _1176;
    wire [31:0] _8;
    wire [31:0] _1177;
    wire _1185;
    wire _1183;
    wire _1181;
    wire _12;
    wire _1180;
    wire _1182;
    wire _1184;
    wire _1187;
    wire _1186;
    wire _1188;
    wire [7:0] _14;
    reg [7:0] _1192;
    wire [7:0] _16;
    wire [7:0] _1189;
    wire _17;
    reg _1138;
    wire [7:0] _1193;
    wire [127:0] _20;
    wire _23;
    wire _1194;
    wire [1:0] _1198;
    wire [7:0] _1199;
    wire [7:0] _27;
    wire [2:0] _1195;
    wire _1196;
    wire _1197;
    wire [7:0] _1200;
    wire [2:0] _1351;
    wire [2:0] _1352;
    wire [2:0] _1324;
    wire [2:0] _1326;
    wire [2:0] _1327;
    wire [2:0] _1353;
    wire [2:0] _1355;
    wire [2:0] _1357;
    wire [2:0] _29;
    reg [2:0] _1323;
    wire [7:0] _1516;
    wire [2:0] _1509;
    wire [2:0] _1483;
    wire [2:0] _1484;
    wire [2:0] _1510;
    wire [2:0] _1512;
    wire [2:0] _1514;
    wire [2:0] _30;
    reg [2:0] _1480;
    wire [7:0] _1515;
    wire [15:0] _1517;
    wire _1527;
    wire [7:0] _32;
    reg [7:0] _1133;
    wire [7:0] _1130;
    wire _1521;
    wire _1522;
    wire _1518;
    wire _1519;
    wire _33;
    reg _1125;
    wire _35;
    wire _1122;
    wire _1520;
    wire _1523;
    wire _1528;
    wire _1530;
    wire _36;
    reg _1526;
    wire _1533;
    wire _1538;
    wire _1540;
    wire _38;
    reg _1536;
    wire _1672;
    wire _1665;
    wire _1673;
    wire _1646;
    wire _1593;
    wire _1647;
    wire _1674;
    wire _40;
    wire _1675;
    wire _1676;
    wire _1681;
    wire _1683;
    wire _41;
    reg _1679;
    wire _1688;
    wire _1689;
    wire _1694;
    wire _45;
    wire _1696;
    wire _1698;
    wire _46;
    reg _1692;
    wire _1723;
    wire _1725;
    wire _1721;
    wire _1727;
    wire _1728;
    wire _1729;
    wire _1700;
    wire _1730;
    wire _1732;
    wire _47;
    reg _1686;
    wire _1738;
    wire _1735;
    wire _1739;
    wire _1740;
    wire _1741;
    wire [31:0] _50;
    wire [2:0] _1888;
    wire _1889;
    wire _1890;
    wire [47:0] _1887;
    reg [47:0] _1891;
    wire [2:0] _1882;
    wire _1883;
    wire _1884;
    reg [47:0] _1885;
    wire [2:0] _1876;
    wire _1877;
    wire _1878;
    reg [47:0] _1879;
    wire _1871;
    wire _1872;
    reg [47:0] _1873;
    wire [2:0] _1864;
    wire _1865;
    wire _1866;
    reg [47:0] _1867;
    wire _1859;
    wire _1860;
    reg [47:0] _1861;
    wire _1853;
    wire _1854;
    reg [47:0] _1855;
    wire [2:0] _1748;
    wire [2:0] _1749;
    wire [2:0] _53;
    reg [2:0] _1746;
    wire _1847;
    wire _1848;
    wire [2:0] _1822;
    wire [28:0] _1757;
    wire [28:0] _1756;
    wire [28:0] _1759;
    wire [28:0] _1760;
    wire [2:0] _1753;
    wire _1755;
    wire [28:0] _1761;
    wire [28:0] _54;
    reg [28:0] ts_hi_m1;
    wire [28:0] _1820;
    wire _1808;
    wire _1807;
    wire _1809;
    wire [2:0] _1811;
    wire _1803;
    wire _1802;
    wire _1804;
    wire [2:0] _1806;
    wire _1812;
    wire [2:0] _1813;
    wire _1796;
    wire _1795;
    wire _1797;
    wire [2:0] _1799;
    wire _1791;
    wire _1790;
    wire _1792;
    wire [2:0] _1794;
    wire _1800;
    wire [2:0] _1801;
    wire _1814;
    wire [2:0] _1815;
    wire _1782;
    wire _1781;
    wire _1783;
    wire [2:0] _1785;
    wire _1777;
    wire _1776;
    wire _1778;
    wire [2:0] _1780;
    wire _1786;
    wire [2:0] _1787;
    wire _1770;
    wire _1769;
    wire _1771;
    wire [2:0] _1773;
    wire _1765;
    wire _1764;
    wire _1766;
    wire [2:0] _1768;
    wire _1774;
    wire [2:0] _1775;
    wire _1788;
    wire [2:0] _1789;
    wire _1816;
    wire [2:0] _1817;
    wire [2:0] _1818;
    wire [2:0] _1762;
    wire _1819;
    wire [28:0] _1821;
    wire [31:0] _1823;
    wire [47:0] _1825;
    wire [47:0] _55;
    reg [47:0] _1849;
    wire [2:0] _1842;
    wire [3:0] _1736;
    wire [3:0] _1831;
    wire [3:0] _1832;
    wire [3:0] _1830;
    wire [3:0] _1833;
    wire [3:0] _1531;
    wire _1532;
    wire _1742;
    wire _56;
    wire _1743;
    wire _1828;
    wire [3:0] _1834;
    reg [3:0] _1837;
    wire [3:0] _57;
    wire _1737;
    wire _1826;
    wire _59;
    wire _1827;
    wire [2:0] _1843;
    wire [2:0] _60;
    reg [2:0] _1840;
    reg [47:0] _1892;
    wire _1996;
    wire _1997;
    reg [7:0] _1998;
    wire _1990;
    wire _1991;
    reg [7:0] _1992;
    wire _1984;
    wire _1985;
    reg [7:0] _1986;
    wire _1978;
    wire _1979;
    reg [7:0] _1980;
    wire _1972;
    wire _1973;
    reg [7:0] _1974;
    wire _1966;
    wire _1967;
    reg [7:0] _1968;
    wire _1960;
    wire _1961;
    reg [7:0] _1962;
    wire [2:0] _1899;
    wire [2:0] _1900;
    wire [2:0] _63;
    reg [2:0] _1897;
    wire _1954;
    wire _1955;
    wire [7:0] _1940;
    wire [7:0] _1941;
    wire [7:0] _1918;
    wire [7:0] _1916;
    wire [7:0] _1919;
    wire [7:0] _64;
    reg [7:0] _1905;
    wire [7:0] _1914;
    wire [7:0] _1915;
    wire [7:0] _1930;
    wire [7:0] _1927;
    wire [7:0] _1925;
    wire [7:0] _1928;
    wire [7:0] _65;
    reg [7:0] _1924;
    wire [7:0] _1929;
    wire [7:0] _1931;
    wire [7:0] _1942;
    wire [7:0] _66;
    reg [7:0] _1956;
    wire [2:0] _1949;
    wire [2:0] _1950;
    wire [2:0] _67;
    reg [2:0] _1947;
    reg [7:0] _1999;
    wire [31:0] _1751;
    wire [31:0] _2002;
    wire [31:0] _2003;
    wire [31:0] _71;
    reg [31:0] ts_reg;
    wire [1:0] _2005;
    wire [1:0] _1824;
    reg [1:0] _2006;
    reg _2009;
    reg [1:0] _2012;
    reg _2015;
    wire _2016;
    wire _2017;
    wire _1179;
    wire _2018;
    wire [7:0] _2159;
    wire [7:0] _2160;
    wire [7:0] _2040;
    wire [7:0] _2038;
    wire [7:0] _2037;
    wire [7:0] _2036;
    wire [7:0] _2035;
    reg [7:0] _2039;
    wire [7:0] _2041;
    wire [7:0] _2042;
    wire [7:0] _2033;
    wire [7:0] _2034;
    wire [7:0] _2043;
    wire [7:0] _2077;
    wire [7:0] _2078;
    wire [7:0] _2080;
    wire [7:0] _2082;
    wire [7:0] _81;
    reg [7:0] _2025;
    wire [7:0] _2161;
    wire [7:0] _84;
    wire [7:0] _3457;
    wire _2156;
    wire _2155;
    wire _2153;
    wire _2154;
    wire _2152;
    wire _2151;
    wire _2150;
    wire [2:0] _2149;
    reg _2157;
    wire _2147;
    wire _2146;
    wire _2144;
    wire _2145;
    wire _2143;
    wire _2142;
    wire _2141;
    wire [2:0] _2140;
    reg _2148;
    wire _2138;
    wire _2137;
    wire _2135;
    wire _2136;
    wire _2134;
    wire _2133;
    wire _2132;
    wire [2:0] _2131;
    reg _2139;
    wire _2129;
    wire _2128;
    wire _2126;
    wire _2127;
    wire _2125;
    wire _2124;
    wire _2123;
    wire [2:0] _2122;
    reg _2130;
    wire _2120;
    wire _2119;
    wire _2117;
    wire _2118;
    wire _2116;
    wire _2115;
    wire _2114;
    wire [2:0] _2113;
    reg _2121;
    wire _2111;
    wire _2110;
    wire _2108;
    wire _2109;
    wire _2107;
    wire _2106;
    wire _2105;
    wire [2:0] _2104;
    reg _2112;
    wire _2102;
    wire _2101;
    wire _2099;
    wire _2100;
    wire _2098;
    wire _2097;
    wire _2096;
    wire [2:0] _2095;
    reg _2103;
    wire _2093;
    wire _2092;
    wire _2090;
    wire _2091;
    wire _2089;
    wire _2088;
    wire [2:0] _3449;
    wire _3446;
    wire [1:0] _3447;
    wire [3:0] _3448;
    wire [6:0] _3450;
    wire [7:0] _3451;
    wire [7:0] _3452;
    wire _2074;
    wire _2073;
    wire _2072;
    wire _2070;
    wire _2071;
    wire _2068;
    wire _2069;
    wire _2065;
    wire _2066;
    wire _2067;
    wire _2062;
    wire _2063;
    wire _2064;
    wire _2059;
    wire _2058;
    wire _2060;
    wire _2057;
    wire _2061;
    wire [7:0] _2075;
    wire _2044;
    wire _2050;
    wire [7:0] _2076;
    wire [7:0] _3444;
    wire [7:0] _3440;
    wire [7:0] _3438;
    wire [7:0] _3437;
    wire [7:0] _3436;
    wire [7:0] _3435;
    reg [7:0] _3439;
    wire [7:0] _3441;
    wire [7:0] _3442;
    wire [7:0] _2031;
    wire [7:0] _2029;
    wire [7:0] _2028;
    wire [7:0] _2027;
    wire [7:0] _2026;
    reg [7:0] _2030;
    wire [7:0] _2032;
    wire [7:0] _3433;
    wire [7:0] _3434;
    wire [7:0] _3443;
    wire [7:0] _3445;
    wire [7:0] _3453;
    wire _2020;
    wire _2021;
    wire _1652;
    wire [1:0] _3427;
    wire [1:0] _3423;
    wire [1:0] _1722;
    wire _3414;
    wire [1:0] _3416;
    wire _3413;
    wire [1:0] _3418;
    wire _3412;
    wire [1:0] _3420;
    wire [1:0] _3421;
    wire _1114;
    wire [15:0] _1109;
    wire _1110;
    wire _1111;
    wire _1108;
    wire _1112;
    wire _1115;
    wire [3:0] _1105;
    wire _1107;
    wire _1116;
    wire _1103;
    wire _1099;
    wire _1100;
    wire _1097;
    wire _1101;
    wire _1104;
    wire _1095;
    reg [2:0] _986;
    wire [15:0] _1090;
    wire _1091;
    wire _1088;
    wire _1092;
    wire _1086;
    wire _1093;
    wire _1096;
    wire [1:0] _1085;
    reg _1117;
    wire _1084;
    wire _1118;
    wire _1081;
    wire [3:0] _1079;
    reg _1080;
    wire _1082;
    wire [15:0] _1074;
    wire _1076;
    wire [16:0] _1069;
    wire [15:0] _1065;
    wire [16:0] _1066;
    wire [16:0] _1067;
    reg [16:0] _1070;
    wire _1071;
    wire _1072;
    wire [15:0] _1061;
    wire _1063;
    wire _975;
    wire [2:0] _977;
    wire _972;
    wire [2:0] _974;
    wire _978;
    wire [2:0] _979;
    wire _967;
    wire [2:0] _969;
    wire _964;
    wire [2:0] _966;
    wire _970;
    wire [2:0] _971;
    wire _980;
    wire [2:0] _981;
    wire _957;
    wire [2:0] _959;
    wire _954;
    wire [2:0] _956;
    wire _960;
    wire [2:0] _961;
    wire _949;
    wire [2:0] _951;
    wire [7:0] _945;
    wire _946;
    wire [2:0] _948;
    wire _952;
    wire [2:0] _953;
    wire _962;
    wire [2:0] _963;
    wire _982;
    wire [2:0] _983;
    wire [13:0] _1053;
    wire [16:0] _1054;
    wire [111:0] _944;
    wire [15:0] _1051;
    wire [16:0] _1052;
    wire [16:0] _1055;
    reg [16:0] _1058;
    wire [16:0] _1050;
    wire _1059;
    wire _1060;
    wire _1064;
    wire _1073;
    wire [1:0] _990;
    reg [15:0] _1047;
    wire _1049;
    wire _1077;
    wire [7:0] _1041;
    wire _1043;
    wire _1044;
    wire [7:0] _1038;
    wire _1040;
    wire _1045;
    wire [7:0] _1033;
    wire [7:0] _1031;
    wire [7:0] _1032;
    wire [7:0] _1034;
    wire _1036;
    wire _1030;
    wire _1037;
    wire _1046;
    wire _1078;
    wire _1083;
    wire _1119;
    wire f_fire3;
    wire _658;
    wire _654;
    wire _655;
    wire _652;
    wire _656;
    wire _659;
    wire [3:0] _649;
    wire _651;
    wire _660;
    wire _647;
    wire _643;
    wire _644;
    wire _641;
    wire _645;
    wire _648;
    wire _639;
    reg [2:0] _633;
    wire [15:0] _634;
    wire _635;
    wire _629;
    wire _636;
    wire _627;
    wire _637;
    wire _640;
    wire [1:0] _626;
    reg _661;
    wire _625;
    wire _662;
    wire _617;
    wire [3:0] _563;
    reg _616;
    wire _618;
    wire [15:0] _558;
    wire _560;
    wire [15:0] _549;
    wire [16:0] _550;
    wire [16:0] _551;
    reg [16:0] _554;
    wire _555;
    wire _556;
    wire [15:0] _545;
    wire _547;
    wire _511;
    wire [2:0] _531;
    wire _490;
    wire [2:0] _510;
    wire _532;
    wire [2:0] _533;
    wire _467;
    wire [2:0] _487;
    wire _446;
    wire [2:0] _466;
    wire _488;
    wire [2:0] _489;
    wire _534;
    wire [2:0] _535;
    wire _421;
    wire [2:0] _441;
    wire _400;
    wire [2:0] _420;
    wire _442;
    wire [2:0] _443;
    wire _377;
    wire [2:0] _397;
    wire [7:0] _355;
    wire _356;
    wire [2:0] _376;
    wire _398;
    wire [2:0] _399;
    wire _444;
    wire [2:0] _445;
    wire _536;
    wire [2:0] _537;
    wire [16:0] _538;
    wire [111:0] _351;
    wire [15:0] _352;
    wire [16:0] _353;
    wire [16:0] _539;
    reg [16:0] _542;
    wire [16:0] _328;
    wire _543;
    wire _544;
    wire _548;
    wire _557;
    wire [1:0] _314;
    reg [15:0] _324;
    wire _326;
    wire _561;
    wire [7:0] _308;
    wire _310;
    wire _311;
    wire [7:0] _297;
    wire _299;
    wire _312;
    wire [7:0] _292;
    wire [7:0] _290;
    wire [7:0] _291;
    wire [7:0] _293;
    wire _295;
    wire [127:0] _270;
    wire [2:0] _3397;
    wire [5:0] _1128;
    wire [5:0] _86;
    wire [5:0] _2174;
    wire [5:0] _88;
    wire _2164;
    wire [5:0] _2165;
    wire [5:0] _2166;
    wire [5:0] _2175;
    wire _2162;
    wire [5:0] _2176;
    wire [5:0] _2177;
    wire [5:0] _89;
    reg [5:0] _1129;
    wire [5:0] _2170;
    wire [5:0] _2169;
    wire [5:0] _2168;
    wire [5:0] _2167;
    reg [5:0] _2171;
    wire _2172;
    wire _2173;
    wire [2:0] _3393;
    wire [1:0] _1719;
    wire _3388;
    wire [2:0] _3390;
    wire [7:0] f_watch;
    wire [7:0] _1713;
    wire _1715;
    wire _1716;
    wire _1710;
    wire _1711;
    wire f_unexp_now;
    wire [15:0] _3379;
    wire [15:0] _3380;
    wire _3376;
    wire _3377;
    wire _3378;
    wire [15:0] _3381;
    wire [2:0] _3321;
    wire [2:0] _3319;
    wire [2:0] _3318;
    wire [2:0] _3317;
    wire [2:0] _3316;
    wire _930;
    wire _926;
    wire _927;
    wire _924;
    wire _928;
    wire _931;
    wire [3:0] _921;
    wire _923;
    wire _932;
    wire _919;
    wire _915;
    wire _916;
    wire _913;
    wire _917;
    wire _920;
    wire _911;
    reg [2:0] _905;
    wire [15:0] _906;
    wire _907;
    wire _901;
    wire _908;
    wire _899;
    wire _909;
    wire _912;
    wire [1:0] _898;
    reg _933;
    wire _897;
    wire _934;
    wire _894;
    wire [3:0] _892;
    reg _893;
    wire _895;
    wire [15:0] _887;
    wire _889;
    wire [15:0] _878;
    wire [16:0] _879;
    wire [16:0] _880;
    reg [16:0] _883;
    wire _884;
    wire _885;
    wire [15:0] _874;
    wire _876;
    wire _858;
    wire [2:0] _860;
    wire _855;
    wire [2:0] _857;
    wire _861;
    wire [2:0] _862;
    wire _850;
    wire [2:0] _852;
    wire _847;
    wire [2:0] _849;
    wire _853;
    wire [2:0] _854;
    wire _863;
    wire [2:0] _864;
    wire _840;
    wire [2:0] _842;
    wire _837;
    wire [2:0] _839;
    wire _843;
    wire [2:0] _844;
    wire _832;
    wire [2:0] _834;
    wire [7:0] _828;
    wire _829;
    wire [2:0] _831;
    wire _835;
    wire [2:0] _836;
    wire _845;
    wire [2:0] _846;
    wire _865;
    wire [2:0] _866;
    wire [16:0] _867;
    wire [111:0] _824;
    wire [15:0] _825;
    wire [16:0] _826;
    wire [16:0] _868;
    reg [16:0] _871;
    wire [16:0] _823;
    wire _872;
    wire _873;
    wire _877;
    wire _886;
    wire [1:0] _819;
    reg [15:0] _820;
    wire _822;
    wire _890;
    wire [7:0] _813;
    wire _815;
    wire _816;
    wire [7:0] _810;
    wire _812;
    wire _817;
    wire [7:0] _805;
    wire [7:0] _803;
    wire [7:0] _804;
    wire [7:0] _806;
    wire _808;
    wire _802;
    wire _809;
    wire _818;
    wire _891;
    wire _896;
    wire _935;
    wire f_fire2;
    wire [1:0] _939;
    wire _794;
    wire _790;
    wire _791;
    wire _788;
    wire _792;
    wire _795;
    wire [3:0] _785;
    wire _787;
    wire _796;
    wire _783;
    wire _779;
    wire _780;
    wire _777;
    wire _781;
    wire _784;
    wire _775;
    reg [2:0] _769;
    wire [15:0] _770;
    wire _771;
    wire _765;
    wire _772;
    wire _763;
    wire _773;
    wire _776;
    wire [1:0] _762;
    reg _797;
    wire [1:0] _91;
    wire [1:0] _2178;
    wire [1:0] _92;
    reg [1:0] _622;
    wire _624;
    wire _761;
    wire _798;
    wire _758;
    wire _2182;
    wire _2180;
    wire _2183;
    wire _2185;
    wire _2187;
    wire _93;
    reg _615;
    wire [15:0] _95;
    wire [15:0] _97;
    wire [15:0] _2193;
    wire [15:0] _2194;
    wire [15:0] _2195;
    wire [15:0] _2197;
    wire [15:0] _98;
    reg [15:0] _2190;
    wire [14:0] _2191;
    wire [15:0] _2192;
    wire [15:0] _2198;
    wire [15:0] _2199;
    wire _2201;
    wire _2203;
    wire _2204;
    wire _2205;
    wire _2206;
    wire _2208;
    wire _2210;
    wire _99;
    reg _612;
    wire _2223;
    wire _2224;
    wire _2226;
    wire _2227;
    wire _2228;
    wire _2229;
    wire _2231;
    wire _100;
    reg _2213;
    wire _2225;
    wire _2234;
    wire [5:0] _2232;
    wire _2233;
    wire _2235;
    wire _2236;
    wire _2237;
    wire _2238;
    wire _2239;
    wire _2241;
    wire _2243;
    wire _101;
    reg _609;
    wire _2247;
    wire _2245;
    wire _2248;
    wire _2250;
    wire _2252;
    wire _102;
    reg _601;
    wire [15:0] _104;
    wire [15:0] _106;
    wire [15:0] _2258;
    wire [15:0] _2259;
    wire [15:0] _2260;
    wire [15:0] _2262;
    wire [15:0] _107;
    reg [15:0] _2255;
    wire [14:0] _2256;
    wire [15:0] _2257;
    wire [15:0] _2263;
    wire [15:0] _2264;
    wire _2266;
    wire _2268;
    wire _2269;
    wire _2270;
    wire _2271;
    wire _2273;
    wire _2275;
    wire _108;
    reg _598;
    wire _2288;
    wire _2289;
    wire _2291;
    wire _2292;
    wire _2293;
    wire _2294;
    wire _2296;
    wire _109;
    reg _2278;
    wire _2290;
    wire _2299;
    wire _2298;
    wire _2300;
    wire _2301;
    wire _2302;
    wire _2303;
    wire _2304;
    wire _2306;
    wire _2308;
    wire _110;
    reg _595;
    wire [7:0] _112;
    wire [6:0] _586;
    wire [6:0] _585;
    wire _587;
    wire [15:0] _582;
    wire _2313;
    wire _2312;
    wire _2314;
    wire _2311;
    wire _2315;
    wire _2310;
    wire _2316;
    wire [14:0] _2309;
    wire [15:0] _2317;
    wire [15:0] _113;
    reg [15:0] _583;
    wire _584;
    wire [3:0] _2336;
    wire [3:0] _2334;
    wire [3:0] _2337;
    wire _1734;
    wire _1943;
    wire _115;
    wire _1944;
    wire _1893;
    wire _1926;
    wire _2321;
    wire _1920;
    wire _1921;
    wire _2319;
    wire _1663;
    wire _1664;
    wire _1670;
    wire _1667;
    wire _1668;
    wire _1666;
    wire _1669;
    wire _1671;
    wire _2322;
    wire _116;
    reg _1650;
    wire _2330;
    wire _1917;
    wire _2326;
    wire _1901;
    wire _1902;
    wire _2324;
    wire _1590;
    wire [2:0] _1584;
    wire _1579;
    wire _1578;
    wire _1580;
    wire _1581;
    wire _1582;
    wire [2:0] _1585;
    wire _1587;
    wire _1588;
    wire _1559;
    wire _1589;
    wire _1591;
    wire _1555;
    wire _1556;
    wire _1592;
    wire _1644;
    wire _1643;
    wire _1645;
    wire _2327;
    wire _117;
    reg _1543;
    wire _2328;
    wire _1640;
    wire [2:0] _1634;
    wire _1629;
    wire _1628;
    wire _1630;
    wire _1631;
    wire _1632;
    wire [2:0] _1635;
    wire _1637;
    wire _1638;
    wire _1609;
    wire _1639;
    wire _1641;
    wire _1605;
    wire _1606;
    wire _1642;
    wire _2329;
    wire _2331;
    wire _118;
    wire _1894;
    wire _2332;
    wire [3:0] _2338;
    reg [3:0] _2341;
    wire [3:0] _119;
    wire _580;
    wire [6:0] _2358;
    wire [7:0] _2359;
    wire [6:0] _2356;
    wire _2354;
    wire _2353;
    wire _2352;
    wire _2351;
    wire _2350;
    wire _2349;
    wire _2348;
    wire _2347;
    wire [2:0] _2345;
    wire [2:0] _2344;
    wire [2:0] _2343;
    wire [2:0] _2342;
    reg [2:0] _2346;
    reg _2355;
    wire [7:0] _2357;
    wire [1:0] _1658;
    wire [1:0] _1657;
    wire [1:0] _1656;
    wire [1:0] _1655;
    reg [1:0] _1659;
    wire [1:0] _1661;
    reg [7:0] _2360;
    wire [7:0] _2361;
    wire [7:0] _120;
    reg [7:0] _575;
    wire _576;
    wire [6:0] _3131;
    wire [7:0] _3132;
    wire _3129;
    wire _3128;
    wire _3127;
    wire _3126;
    wire _3125;
    wire _3124;
    wire _3123;
    wire _3122;
    wire [7:0] _3130;
    wire [3:0] _3114;
    wire [3:0] _3112;
    wire [3:0] _3115;
    wire _2785;
    wire _3106;
    wire _1560;
    wire _2740;
    wire _2741;
    wire [1:0] _2744;
    wire _2733;
    wire _2734;
    wire _2735;
    wire _2736;
    wire [1:0] _2738;
    wire [2:0] _2719;
    wire [2:0] _2716;
    wire _2712;
    wire _2710;
    wire _2711;
    wire _2713;
    wire [2:0] _2717;
    wire _2708;
    wire [2:0] _2720;
    wire _2721;
    wire [2:0] _2702;
    wire _2698;
    wire _2696;
    wire _2697;
    wire _2699;
    wire [2:0] _2703;
    wire _2694;
    wire [2:0] _2705;
    wire _2706;
    wire _2722;
    wire _2723;
    wire _2724;
    wire _2690;
    wire _2688;
    wire _2691;
    wire [15:0] _2683;
    wire _2684;
    wire _2681;
    wire _2685;
    wire _2679;
    wire _2680;
    wire _2686;
    wire _2692;
    wire _2725;
    wire [1:0] _2727;
    wire [1:0] _2729;
    wire [1:0] _2675;
    wire _2671;
    wire [1:0] _2673;
    wire [1:0] _2676;
    wire _2451;
    wire _2452;
    wire _121;
    reg _2364;
    wire _2601;
    wire _2599;
    wire _2600;
    reg _2602;
    wire [2:0] _123;
    wire [2:0] _2583;
    wire [2:0] _2584;
    wire [2:0] _2579;
    wire _2575;
    wire _2573;
    wire _2574;
    wire _2576;
    wire [2:0] _2580;
    wire _2571;
    wire [2:0] _2585;
    wire [2:0] _2586;
    wire [2:0] _2565;
    wire [2:0] _2566;
    wire [2:0] _2561;
    wire _2447;
    wire _2446;
    wire _2445;
    wire _2444;
    wire _2443;
    wire _2442;
    wire _2441;
    wire _2437;
    wire _2436;
    wire _2435;
    wire _2434;
    wire _2433;
    wire _2432;
    wire _2431;
    wire [7:0] _2428;
    wire [6:0] _1911;
    wire [7:0] _1912;
    wire [6:0] _1909;
    wire [7:0] _1910;
    wire [7:0] _1913;
    wire [7:0] _2457;
    wire [7:0] _2458;
    wire [7:0] _2459;
    wire [7:0] _2453;
    wire [7:0] _2454;
    wire [7:0] _2455;
    wire [7:0] _2456;
    wire [7:0] _2460;
    wire [7:0] _124;
    reg [7:0] _1908;
    wire _2368;
    wire _2365;
    wire _2366;
    wire _2369;
    wire [7:0] _2429;
    wire _2430;
    wire [7:0] _2438;
    wire _126;
    wire [7:0] _2439;
    wire _2440;
    wire [2:0] _2468;
    wire [2:0] _2469;
    wire [2:0] _2470;
    wire [2:0] _2471;
    wire [2:0] _2462;
    wire [2:0] _2463;
    wire [2:0] _2464;
    wire [2:0] _2465;
    wire [2:0] _2466;
    wire [2:0] _2472;
    wire [2:0] _2474;
    wire [2:0] _127;
    reg [2:0] _1553;
    reg _2448;
    wire _129;
    wire [31:0] _131;
    wire [30:0] _2516;
    wire [31:0] _2518;
    wire _2510;
    wire _2511;
    wire [31:0] _2513;
    wire [30:0] _2507;
    wire [31:0] _2509;
    wire [31:0] _2514;
    wire [31:0] _2515;
    wire [5:0] _133;
    wire [5:0] _2484;
    wire [5:0] _2485;
    wire [5:0] _2486;
    wire [5:0] _2487;
    wire [5:0] _2478;
    wire [5:0] _2479;
    wire [5:0] _2480;
    wire [5:0] _2481;
    wire [5:0] _2482;
    wire [5:0] _2488;
    wire [5:0] _2489;
    wire [5:0] _2491;
    wire [5:0] _134;
    reg [5:0] _1573;
    wire _1575;
    wire _1576;
    wire _2215;
    wire _2214;
    wire _2216;
    wire _2217;
    wire [31:0] _2519;
    wire [31:0] _2520;
    wire [31:0] _2521;
    wire [31:0] _136;
    wire _2498;
    wire _2499;
    wire [31:0] _2501;
    wire [30:0] _2495;
    wire [31:0] _2497;
    wire [31:0] _2502;
    wire [30:0] _2492;
    wire [31:0] _2494;
    wire [31:0] _2503;
    wire [31:0] _2504;
    wire [31:0] _2505;
    wire [31:0] _2506;
    wire [31:0] _2522;
    wire [31:0] _2523;
    wire [31:0] _2525;
    wire [31:0] _137;
    reg [31:0] _2220;
    wire _2221;
    wire _2222;
    wire [15:0] _139;
    wire [15:0] _2545;
    wire _1545;
    wire _1550;
    wire [15:0] _2546;
    wire _1544;
    wire [15:0] _2547;
    wire _2528;
    wire _2526;
    wire _2527;
    wire _2529;
    wire _2531;
    wire _140;
    reg _1502;
    wire _1503;
    wire _1500;
    wire _1504;
    wire _2533;
    wire _2534;
    wire _2535;
    wire _2537;
    wire _141;
    reg _1496;
    wire _1497;
    wire _1494;
    wire _1498;
    wire _1505;
    wire _1506;
    wire _1507;
    wire [15:0] _2548;
    wire [15:0] _2539;
    wire [15:0] _2540;
    wire [15:0] _2541;
    wire [15:0] _2542;
    wire [15:0] _2543;
    wire [15:0] _2549;
    wire [15:0] _2551;
    wire [15:0] _142;
    reg [15:0] _1548;
    wire _1549;
    wire _2449;
    wire _2450;
    wire _2557;
    wire _2555;
    wire _2556;
    wire _2558;
    wire [2:0] _2562;
    wire _2553;
    wire [2:0] _2567;
    wire [2:0] _2568;
    wire [2:0] _2569;
    wire [2:0] _2587;
    wire [2:0] _2589;
    wire [2:0] _143;
    reg [2:0] _1490;
    wire _1491;
    wire [1:0] _145;
    wire _1486;
    wire _1487;
    wire _1492;
    wire _1570;
    wire _1577;
    wire _2603;
    wire _2604;
    wire _1565;
    wire _1563;
    wire _1566;
    wire _1567;
    wire _1568;
    wire _2596;
    wire _2593;
    wire _2590;
    wire _2591;
    wire _2594;
    wire _2595;
    wire _2597;
    wire _2605;
    wire _2607;
    wire _2609;
    wire _2611;
    wire _2613;
    wire _146;
    reg _1474;
    wire _1475;
    wire _1476;
    wire _1469;
    wire _1470;
    wire _1466;
    wire _148;
    wire _1463;
    wire _1464;
    wire _1465;
    wire _1467;
    wire _1471;
    wire _1472;
    wire _1477;
    wire [1:0] _2678;
    wire _1458;
    wire _1459;
    wire _1454;
    wire _1453;
    wire _1452;
    wire _1451;
    wire _1450;
    wire _1449;
    wire _1448;
    wire _1447;
    reg _1455;
    wire _1456;
    wire _1445;
    wire _1444;
    wire _1443;
    wire _1442;
    wire _1441;
    wire _1440;
    wire _1439;
    wire _1438;
    wire [2:0] _150;
    reg _1446;
    wire _1457;
    wire _152;
    wire _1460;
    wire _1436;
    wire _1433;
    wire _1426;
    wire _1424;
    wire [13:0] _1415;
    wire [15:0] _1416;
    wire [14:0] _1412;
    wire [15:0] _1413;
    wire [15:0] _1417;
    wire [14:0] _1409;
    wire [15:0] _1410;
    wire _1407;
    wire [15:0] _1418;
    reg [15:0] _1421;
    wire _1422;
    wire [13:0] _1399;
    wire [15:0] _1400;
    reg [15:0] _1403;
    wire _2659;
    wire _2660;
    wire [15:0] _2661;
    wire [15:0] _2663;
    wire [15:0] _2665;
    wire _2643;
    wire [14:0] _1428;
    wire [15:0] _1429;
    reg [15:0] _1432;
    wire [16:0] _2639;
    wire _2640;
    wire [16:0] _2633;
    reg [16:0] _2636;
    wire [16:0] _2628;
    wire [15:0] _154;
    wire [16:0] _2627;
    wire [16:0] _2629;
    reg [16:0] _2632;
    wire [7:0] _156;
    wire [8:0] _2647;
    wire [7:0] _2649;
    wire [7:0] _2650;
    wire [7:0] _2651;
    wire [7:0] _2653;
    wire [7:0] _157;
    reg [7:0] _2621;
    wire [8:0] _2646;
    wire [8:0] _2648;
    wire _2654;
    wire _2655;
    wire _2656;
    wire _2658;
    wire _158;
    reg _2626;
    wire [16:0] _2637;
    wire [16:0] _2623;
    wire _2638;
    wire _2641;
    wire _2644;
    wire _2622;
    wire _2645;
    wire [15:0] _2667;
    wire _2617;
    wire _2615;
    wire _606;
    wire _2614;
    wire _2616;
    wire _2618;
    wire [15:0] _2668;
    wire [15:0] _2670;
    wire [15:0] _159;
    reg [15:0] _1397;
    wire _1404;
    wire _1405;
    wire _1394;
    wire _1406;
    wire _1423;
    wire _1425;
    wire _1434;
    wire [1:0] _161;
    wire _1390;
    wire _1391;
    wire _1388;
    wire _1392;
    wire _1385;
    wire _1381;
    wire _1380;
    wire _1379;
    wire _1378;
    wire _1377;
    wire _1376;
    wire _1375;
    wire _1374;
    reg _1382;
    wire _1372;
    wire _1371;
    wire _1370;
    wire _1369;
    wire _1368;
    wire _1367;
    wire _1366;
    wire _1365;
    wire [2:0] _163;
    reg _1373;
    wire _1383;
    wire _1384;
    wire _1386;
    wire _1393;
    wire _1437;
    wire _165;
    wire _1461;
    wire _167;
    wire _1364;
    wire _1462;
    wire [1:0] _2730;
    wire _1558;
    wire [1:0] _2732;
    wire _2476;
    wire [1:0] _2739;
    wire _1361;
    wire [1:0] _2745;
    wire _1359;
    wire [1:0] _2747;
    wire [1:0] _168;
    reg [1:0] _604;
    wire _1363;
    wire _1561;
    wire _1569;
    wire _3105;
    wire _3107;
    wire _3103;
    wire _1610;
    wire _3081;
    wire _3082;
    wire [1:0] _3085;
    wire _3074;
    wire _3075;
    wire _3076;
    wire _3077;
    wire [1:0] _3079;
    wire [2:0] _3060;
    wire [2:0] _3057;
    wire _3053;
    wire _3051;
    wire _3052;
    wire _3054;
    wire [2:0] _3058;
    wire _3049;
    wire [2:0] _3061;
    wire _3062;
    wire [2:0] _3043;
    wire _3039;
    wire _3037;
    wire _3038;
    wire _3040;
    wire [2:0] _3044;
    wire _3035;
    wire [2:0] _3046;
    wire _3047;
    wire _3063;
    wire _3064;
    wire _3065;
    wire _3031;
    wire _3029;
    wire _3032;
    wire [15:0] _3024;
    wire _3025;
    wire _3022;
    wire _3026;
    wire _3020;
    wire _3021;
    wire _3027;
    wire _3033;
    wire _3066;
    wire [1:0] _3068;
    wire [1:0] _3070;
    wire [1:0] _3016;
    wire _3012;
    wire [1:0] _3014;
    wire [1:0] _3017;
    wire _2780;
    wire _2781;
    wire _169;
    reg _2750;
    wire _2938;
    wire _2936;
    wire _2937;
    reg _2939;
    wire [2:0] _171;
    wire [2:0] _2920;
    wire [2:0] _2921;
    wire [2:0] _2916;
    wire _2912;
    wire _2910;
    wire _2911;
    wire _2913;
    wire [2:0] _2917;
    wire _2908;
    wire [2:0] _2922;
    wire [2:0] _2923;
    wire [2:0] _2902;
    wire [2:0] _2903;
    wire [2:0] _2898;
    wire _2776;
    wire _2775;
    wire _2774;
    wire _2773;
    wire _2772;
    wire _2771;
    wire _2770;
    wire _2766;
    wire _2765;
    wire _2764;
    wire _2763;
    wire _2762;
    wire _2761;
    wire _2760;
    wire _2423;
    wire _2424;
    reg [7:0] _2425;
    wire _2417;
    wire _2418;
    reg [7:0] _2419;
    wire _2411;
    wire _2412;
    reg [7:0] _2413;
    wire _2405;
    wire _2406;
    reg [7:0] _2407;
    wire _2399;
    wire _2400;
    reg [7:0] _2401;
    wire _2393;
    wire _2394;
    reg [7:0] _2395;
    wire _2387;
    wire _2388;
    reg [7:0] _2389;
    wire [2:0] _2783;
    wire [2:0] _2784;
    wire [2:0] _172;
    reg [2:0] _2379;
    wire _2381;
    wire _2382;
    wire [7:0] _174;
    reg [7:0] _2383;
    wire [2:0] _2788;
    wire [2:0] _2789;
    wire [2:0] _175;
    reg [2:0] _2372;
    reg [7:0] _2426;
    wire [7:0] _2757;
    wire [6:0] _1937;
    wire [7:0] _1938;
    wire [6:0] _1935;
    wire [7:0] _1936;
    wire [7:0] _1939;
    wire [7:0] _2794;
    wire [7:0] _2795;
    wire [7:0] _2796;
    wire [7:0] _2790;
    wire [7:0] _2791;
    wire [7:0] _2792;
    wire [7:0] _2793;
    wire [7:0] _2797;
    wire [7:0] _176;
    reg [7:0] _1934;
    wire _2754;
    wire _2751;
    wire _2752;
    wire _2755;
    wire [7:0] _2758;
    wire _2759;
    wire [7:0] _2767;
    wire _178;
    wire [7:0] _2768;
    wire _2769;
    wire [2:0] _2805;
    wire [2:0] _2806;
    wire [2:0] _2807;
    wire [2:0] _2808;
    wire [2:0] _2799;
    wire [2:0] _2800;
    wire [2:0] _2801;
    wire [2:0] _2802;
    wire [2:0] _2803;
    wire [2:0] _2809;
    wire [2:0] _2811;
    wire [2:0] _179;
    reg [2:0] _1603;
    reg _2777;
    wire _181;
    wire [31:0] _183;
    wire [30:0] _2853;
    wire [31:0] _2855;
    wire _2847;
    wire _2848;
    wire [31:0] _2850;
    wire [30:0] _2844;
    wire [31:0] _2846;
    wire [31:0] _2851;
    wire [31:0] _2852;
    wire [5:0] _185;
    wire [5:0] _2821;
    wire [5:0] _2822;
    wire [5:0] _2823;
    wire [5:0] _2824;
    wire [5:0] _2815;
    wire [5:0] _2816;
    wire [5:0] _2817;
    wire [5:0] _2818;
    wire [5:0] _2819;
    wire [5:0] _2825;
    wire [5:0] _2826;
    wire [5:0] _2828;
    wire [5:0] _186;
    reg [5:0] _1623;
    wire _1625;
    wire _1626;
    wire _2280;
    wire _2279;
    wire _2281;
    wire _2282;
    wire [31:0] _2856;
    wire [31:0] _2857;
    wire [31:0] _2858;
    wire [31:0] _188;
    wire _2835;
    wire _2836;
    wire [31:0] _2838;
    wire [30:0] _2832;
    wire [31:0] _2834;
    wire [31:0] _2839;
    wire [30:0] _2829;
    wire [31:0] _2831;
    wire [31:0] _2840;
    wire [31:0] _2841;
    wire [31:0] _2842;
    wire [31:0] _2843;
    wire [31:0] _2859;
    wire [31:0] _2860;
    wire [31:0] _2862;
    wire [31:0] _189;
    reg [31:0] _2285;
    wire _2286;
    wire _2287;
    wire [15:0] _191;
    wire [15:0] _2882;
    wire _1595;
    wire _1600;
    wire [15:0] _2883;
    wire _1594;
    wire [15:0] _2884;
    wire _2865;
    wire _2863;
    wire _2864;
    wire _2866;
    wire _2868;
    wire _192;
    reg _1345;
    wire _1346;
    wire _1343;
    wire _1347;
    wire _2870;
    wire _2871;
    wire _2872;
    wire _2874;
    wire _193;
    reg _1339;
    wire _1340;
    wire _1337;
    wire _1341;
    wire _1348;
    wire _1349;
    wire _1350;
    wire [15:0] _2885;
    wire [15:0] _2876;
    wire [15:0] _2877;
    wire [15:0] _2878;
    wire [15:0] _2879;
    wire [15:0] _2880;
    wire [15:0] _2886;
    wire [15:0] _2888;
    wire [15:0] _194;
    reg [15:0] _1598;
    wire _1599;
    wire _2778;
    wire _2779;
    wire _2894;
    wire _2892;
    wire _2893;
    wire _2895;
    wire [2:0] _2899;
    wire _2890;
    wire [2:0] _2904;
    wire [2:0] _2905;
    wire [2:0] _2906;
    wire [2:0] _2924;
    wire [2:0] _2926;
    wire [2:0] _195;
    reg [2:0] _1333;
    wire _1334;
    wire [1:0] _197;
    wire _1329;
    wire _1330;
    wire _1335;
    wire _1620;
    wire _1627;
    wire _2940;
    wire _2941;
    wire _1615;
    wire _1613;
    wire _1616;
    wire _1617;
    wire _1618;
    wire _2933;
    wire _2930;
    wire _2927;
    wire _2928;
    wire _2931;
    wire _2932;
    wire _2934;
    wire _2942;
    wire _2944;
    wire _2946;
    wire _2948;
    wire _2950;
    wire _198;
    reg _1317;
    wire _1318;
    wire _1319;
    wire _1312;
    wire _1313;
    wire _1309;
    wire _200;
    wire _1306;
    wire _1307;
    wire _1308;
    wire _1310;
    wire _1314;
    wire _1315;
    wire _1320;
    wire [1:0] _3019;
    wire _1301;
    wire _1302;
    wire _1297;
    wire _1296;
    wire _1295;
    wire _1294;
    wire _1293;
    wire _1292;
    wire _1291;
    wire _1290;
    reg _1298;
    wire _1299;
    wire _1288;
    wire _1287;
    wire _1286;
    wire _1285;
    wire _1284;
    wire _1283;
    wire _1282;
    wire _1281;
    wire [2:0] _202;
    reg _1289;
    wire _1300;
    wire _204;
    wire _1303;
    wire _1279;
    wire _1276;
    wire _1269;
    wire _1267;
    wire [13:0] _1258;
    wire [15:0] _1259;
    wire [14:0] _1255;
    wire [15:0] _1256;
    wire [15:0] _1260;
    wire [14:0] _1252;
    wire [15:0] _1253;
    wire _1250;
    wire [15:0] _1261;
    reg [15:0] _1264;
    wire _1265;
    wire [13:0] _1242;
    wire [15:0] _1243;
    reg [15:0] _1246;
    wire _2996;
    wire _2997;
    wire [15:0] _2998;
    wire [15:0] _3000;
    wire [15:0] _3002;
    wire _2980;
    wire [14:0] _1271;
    wire [15:0] _1272;
    reg [15:0] _1275;
    wire [16:0] _2976;
    wire _2977;
    wire [16:0] _2970;
    reg [16:0] _2973;
    wire [15:0] _206;
    wire [16:0] _2964;
    wire [16:0] _2966;
    reg [16:0] _2969;
    wire [7:0] _208;
    wire [8:0] _2984;
    wire [7:0] _2986;
    wire [7:0] _2987;
    wire [7:0] _2988;
    wire [7:0] _2990;
    wire [7:0] _209;
    reg [7:0] _2958;
    wire [8:0] _2983;
    wire [8:0] _2985;
    wire _2991;
    wire _2992;
    wire _2993;
    wire _2995;
    wire _210;
    reg _2963;
    wire [16:0] _2974;
    wire [16:0] _2960;
    wire _2975;
    wire _2978;
    wire _2981;
    wire _2959;
    wire _2982;
    wire [15:0] _3004;
    wire _2954;
    wire _2952;
    wire _592;
    wire _2951;
    wire _2953;
    wire _2955;
    wire [15:0] _3005;
    wire [15:0] _3007;
    wire [15:0] _211;
    reg [15:0] _1240;
    wire _1247;
    wire _1248;
    wire _1237;
    wire _1249;
    wire _1266;
    wire _1268;
    wire _1277;
    wire [1:0] _213;
    wire _1233;
    wire _1234;
    wire _1231;
    wire _1235;
    wire _1228;
    wire _1224;
    wire _1223;
    wire _1222;
    wire _1221;
    wire _1220;
    wire _1219;
    wire _1218;
    wire _1217;
    reg _1225;
    wire _1215;
    wire _1214;
    wire _1213;
    wire _1212;
    wire _1211;
    wire _1210;
    wire _1209;
    wire _1208;
    wire [2:0] _215;
    reg _1216;
    wire _1226;
    wire _1227;
    wire _1229;
    wire _1236;
    wire _1280;
    wire _217;
    wire _1304;
    wire _219;
    wire _1207;
    wire _1305;
    wire [1:0] _3071;
    wire _1608;
    wire [1:0] _3073;
    wire _2813;
    wire [1:0] _3080;
    wire _1204;
    wire [1:0] _3086;
    wire [2:0] _2055;
    wire [2:0] _2054;
    wire [2:0] _2053;
    wire [2:0] _2052;
    reg [2:0] _2056;
    wire _2048;
    wire _2047;
    wire _2046;
    wire _2045;
    reg _2049;
    wire _3008;
    wire _3009;
    wire [2:0] _3011;
    wire [2:0] _220;
    wire _1202;
    wire [1:0] _3088;
    wire [1:0] _221;
    reg [1:0] _590;
    wire _1206;
    wire _1611;
    wire _1619;
    wire _3102;
    wire _3104;
    wire _3108;
    wire _3099;
    wire _3097;
    wire _3100;
    wire _3101;
    wire _3109;
    wire _222;
    wire _2786;
    wire _2001;
    wire _2375;
    wire _224;
    wire _2376;
    wire _3110;
    wire [3:0] _3116;
    reg [3:0] _3119;
    wire [3:0] _225;
    wire _578;
    wire [7:0] _3121;
    wire [1:0] _3094;
    wire [1:0] _3092;
    wire [1:0] _3091;
    wire [1:0] _3090;
    wire [1:0] _3089;
    reg [1:0] _3093;
    wire [1:0] _3095;
    reg [7:0] _3133;
    wire [7:0] _3134;
    wire [7:0] _226;
    reg [7:0] _571;
    wire _572;
    wire [7:0] _3145;
    wire [7:0] _3144;
    wire [7:0] _3142;
    wire [7:0] _3143;
    wire [1:0] _3140;
    wire [111:0] _989;
    wire [1:0] _3138;
    wire [111:0] _801;
    wire [1:0] _3137;
    wire [1:0] _3136;
    wire [1:0] _3135;
    reg [1:0] _3139;
    wire [1:0] _3141;
    reg [7:0] _3146;
    wire [7:0] _3147;
    wire [7:0] _227;
    reg [7:0] _566;
    wire _568;
    wire [3:0] _756;
    reg _757;
    wire _759;
    wire [15:0] _751;
    wire _753;
    wire [15:0] _742;
    wire [16:0] _743;
    wire [16:0] _744;
    reg [16:0] _747;
    wire _748;
    wire _749;
    wire [15:0] _738;
    wire _740;
    wire [2:0] _526;
    wire [2:0] _3163;
    wire _3159;
    wire _3160;
    wire _3157;
    wire _3161;
    wire [2:0] _3164;
    wire _3154;
    wire _3155;
    wire _3153;
    wire _3156;
    wire [2:0] _3166;
    wire _3150;
    wire [2:0] _3152;
    wire _3149;
    wire [2:0] _3167;
    wire [2:0] _228;
    reg [2:0] _522;
    wire _524;
    wire [2:0] _527;
    wire _517;
    wire _518;
    wire _516;
    wire _519;
    wire [2:0] _529;
    wire _513;
    wire _514;
    wire [2:0] _530;
    wire _722;
    wire [2:0] _724;
    wire [2:0] _505;
    wire [2:0] _3182;
    wire _3178;
    wire _3179;
    wire _3176;
    wire _3180;
    wire [2:0] _3183;
    wire _3173;
    wire _3174;
    wire _3172;
    wire _3175;
    wire [2:0] _3185;
    wire _3169;
    wire [2:0] _3171;
    wire _3168;
    wire [2:0] _3186;
    wire [2:0] _229;
    reg [2:0] _501;
    wire _503;
    wire [2:0] _506;
    wire _496;
    wire _497;
    wire _495;
    wire _498;
    wire [2:0] _508;
    wire _492;
    wire _493;
    wire [2:0] _509;
    wire _719;
    wire [2:0] _721;
    wire _725;
    wire [2:0] _726;
    wire [2:0] _482;
    wire [2:0] _3201;
    wire _3197;
    wire _3198;
    wire _3195;
    wire _3199;
    wire [2:0] _3202;
    wire _3192;
    wire _3193;
    wire _3191;
    wire _3194;
    wire [2:0] _3204;
    wire _3188;
    wire [2:0] _3190;
    wire _3187;
    wire [2:0] _3205;
    wire [2:0] _230;
    reg [2:0] _478;
    wire _480;
    wire [2:0] _483;
    wire _473;
    wire _474;
    wire _472;
    wire _475;
    wire [2:0] _485;
    wire _469;
    wire _470;
    wire [2:0] _486;
    wire _714;
    wire [2:0] _716;
    wire [2:0] _461;
    wire [2:0] _3220;
    wire _3216;
    wire _3217;
    wire _3214;
    wire _3218;
    wire [2:0] _3221;
    wire _3211;
    wire _3212;
    wire _3210;
    wire _3213;
    wire [2:0] _3223;
    wire _3207;
    wire [2:0] _3209;
    wire _3206;
    wire [2:0] _3224;
    wire [2:0] _231;
    reg [2:0] _457;
    wire _459;
    wire [2:0] _462;
    wire _452;
    wire _453;
    wire _451;
    wire _454;
    wire [2:0] _464;
    wire _448;
    wire _449;
    wire [2:0] _465;
    wire _711;
    wire [2:0] _713;
    wire _717;
    wire [2:0] _718;
    wire _727;
    wire [2:0] _728;
    wire [2:0] _436;
    wire [2:0] _3239;
    wire _3235;
    wire _3236;
    wire _3233;
    wire _3237;
    wire [2:0] _3240;
    wire _3230;
    wire _3231;
    wire _3229;
    wire _3232;
    wire [2:0] _3242;
    wire _3226;
    wire [2:0] _3228;
    wire _3225;
    wire [2:0] _3243;
    wire [2:0] _232;
    reg [2:0] _432;
    wire _434;
    wire [2:0] _437;
    wire _427;
    wire _428;
    wire _426;
    wire _429;
    wire [2:0] _439;
    wire _423;
    wire _424;
    wire [2:0] _440;
    wire _704;
    wire [2:0] _706;
    wire [2:0] _415;
    wire [2:0] _3258;
    wire _3254;
    wire _3255;
    wire _3252;
    wire _3256;
    wire [2:0] _3259;
    wire _3249;
    wire _3250;
    wire _3248;
    wire _3251;
    wire [2:0] _3261;
    wire _3245;
    wire [2:0] _3247;
    wire _3244;
    wire [2:0] _3262;
    wire [2:0] _233;
    reg [2:0] _411;
    wire _413;
    wire [2:0] _416;
    wire _406;
    wire _407;
    wire _405;
    wire _408;
    wire [2:0] _418;
    wire _402;
    wire _403;
    wire [2:0] _419;
    wire _701;
    wire [2:0] _703;
    wire _707;
    wire [2:0] _708;
    wire [2:0] _392;
    wire [2:0] _3277;
    wire _3273;
    wire _3274;
    wire _3271;
    wire _3275;
    wire [2:0] _3278;
    wire _3268;
    wire _3269;
    wire _3267;
    wire _3270;
    wire [2:0] _3280;
    wire _3264;
    wire [2:0] _3266;
    wire _3263;
    wire [2:0] _3281;
    wire [2:0] _234;
    reg [2:0] _388;
    wire _390;
    wire [2:0] _393;
    wire _383;
    wire _384;
    wire _382;
    wire _385;
    wire [2:0] _395;
    wire _379;
    wire _380;
    wire [2:0] _396;
    wire _696;
    wire [2:0] _698;
    wire [2:0] _371;
    wire [2:0] _3296;
    wire _3292;
    wire _3293;
    wire _3290;
    wire _3294;
    wire [2:0] _3297;
    wire _3287;
    wire _3288;
    wire _3286;
    wire _3289;
    wire [2:0] _3299;
    wire _3283;
    wire [2:0] _3285;
    wire _3282;
    wire [2:0] _3300;
    wire [2:0] _235;
    reg [2:0] _367;
    wire _369;
    wire [2:0] _372;
    wire _362;
    wire _363;
    wire _361;
    wire _364;
    wire [2:0] _374;
    wire _358;
    wire _359;
    wire [2:0] _375;
    wire [7:0] _692;
    wire _693;
    wire [2:0] _695;
    wire _699;
    wire [2:0] _700;
    wire _709;
    wire [2:0] _710;
    wire _729;
    wire [2:0] _730;
    wire [16:0] _731;
    wire _3303;
    wire [127:0] _3304;
    wire _3301;
    wire [127:0] _3305;
    wire [127:0] _236;
    reg [127:0] _280;
    wire _347;
    wire _348;
    wire [127:0] _349;
    wire _3308;
    wire [127:0] _3309;
    wire _3306;
    wire [127:0] _3310;
    wire [127:0] _237;
    reg [127:0] _277;
    wire _343;
    wire _344;
    wire [127:0] _345;
    wire _3313;
    wire [127:0] _3314;
    wire _3311;
    wire [127:0] _3315;
    wire [127:0] _238;
    reg [127:0] _274;
    wire _339;
    wire _340;
    wire [127:0] _341;
    wire [127:0] _240;
    wire _335;
    wire _336;
    wire [127:0] _337;
    wire [511:0] _350;
    wire [111:0] _688;
    wire [15:0] _689;
    wire [16:0] _690;
    wire [16:0] _732;
    reg [16:0] _735;
    wire gnd;
    wire [16:0] _687;
    wire _736;
    wire _737;
    wire _741;
    wire _750;
    wire [15:0] _3343;
    wire _3339;
    wire _3340;
    wire _3341;
    wire [15:0] _3344;
    wire _3323;
    wire _3324;
    wire [15:0] _3346;
    wire [15:0] _3348;
    wire [15:0] _241;
    reg [15:0] _323;
    wire [15:0] _3360;
    wire _3356;
    wire _3357;
    wire [8:0] _3335;
    wire _3336;
    wire [5:0] _3333;
    wire [5:0] _3332;
    wire _3334;
    wire [8:0] _3327;
    wire [8:0] _3349;
    wire [8:0] _3350;
    wire [8:0] _3352;
    wire [8:0] _242;
    reg [8:0] _3328;
    wire [2:0] _3329;
    wire _3331;
    wire [1:0] _3325;
    reg _3337;
    wire _3358;
    wire [15:0] _3361;
    wire _3353;
    wire _3354;
    wire [15:0] _3363;
    wire [15:0] _3365;
    wire [15:0] _243;
    reg [15:0] _320;
    wire [1:0] _683;
    reg [15:0] _684;
    wire _686;
    wire _754;
    reg [7:0] _305;
    wire [7:0] f_chg_now;
    wire _3367;
    wire [7:0] _3369;
    wire _3366;
    wire [7:0] _3370;
    wire [7:0] _3372;
    wire [7:0] _244;
    reg [7:0] _302;
    wire [7:0] f_changed_all;
    wire [7:0] _677;
    wire _679;
    wire _680;
    wire [7:0] _674;
    wire _676;
    wire _681;
    wire [7:0] _669;
    wire [7:0] _667;
    wire vdd;
    wire _246;
    wire _248;
    wire [7:0] _250;
    reg [7:0] _286;
    reg [7:0] _289;
    wire [7:0] _668;
    wire [7:0] _670;
    wire _672;
    wire [111:0] _665;
    wire _666;
    wire _673;
    wire _682;
    wire _755;
    wire _760;
    wire _799;
    wire f_fire1;
    wire [1:0] _941;
    wire [1:0] f_winner;
    reg [2:0] _3320;
    wire [2:0] _3322;
    wire _3373;
    wire _3374;
    wire [15:0] _3383;
    wire [15:0] _3385;
    wire [15:0] _251;
    reg [15:0] _317;
    wire [1:0] _1706;
    reg [15:0] _1707;
    wire [15:0] _1705;
    wire _1708;
    wire [63:0] _1687;
    wire _1703;
    wire _1701;
    wire _1702;
    wire _1704;
    wire _1709;
    wire _1718;
    wire [2:0] _3391;
    wire [2:0] _3394;
    wire _3387;
    wire [2:0] _3395;
    wire _3386;
    wire [2:0] _3398;
    wire [2:0] _3400;
    wire [2:0] _252;
    reg [2:0] _333;
    wire _3403;
    wire [127:0] _3404;
    wire _3401;
    wire [127:0] _3405;
    wire [127:0] _253;
    reg [127:0] _271;
    wire [511:0] _281;
    wire [111:0] _282;
    wire _283;
    wire _296;
    wire _313;
    wire _562;
    wire _619;
    wire _663;
    wire f_in_eval;
    wire f_fire0;
    wire _1028;
    wire _1029;
    wire _1121;
    wire [1:0] _3424;
    wire _3409;
    wire [1:0] _3411;
    wire _3407;
    wire [1:0] _3425;
    wire _3406;
    wire [1:0] _3428;
    wire _255;
    wire [1:0] _3430;
    wire [1:0] _3432;
    wire [1:0] _256;
    reg [1:0] _266;
    wire f_in_fetch;
    wire _1653;
    wire _1654;
    wire _2022;
    wire [7:0] _3454;
    wire _258;
    wire [7:0] _3456;
    wire [7:0] _259;
    reg [7:0] _2086;
    wire _2087;
    wire [23:0] _261;
    wire [2:0] _2083;
    reg _2094;
    wire [7:0] _2158;
    wire [7:0] _3458;
    assign _1172 = _50[11:0];
    assign _1169 = _1162 < _1159;
    assign _1170 = _1144 & _1169;
    assign _1171 = _1170 ? _1159 : _1162;
    assign _1173 = _1171 < _1172;
    assign _1174 = _1173 ? _1172 : _1171;
    assign _1175 = _1155 ? _1171 : _1174;
    assign _1161 = 12'b000000000000;
    assign _1021 = 12'b111111111111;
    assign _1018 = _1016[11:0];
    assign _1015 = 13'b0000000000000;
    assign _1012 = 10'b0000000000;
    assign _1013 = { _1012,
                     _1009 };
    assign _1014 = _1005 - _1013;
    assign _1008 = 3'b000;
    always @* begin
        case (f_winner)
        0:
            _987 <= _633;
        1:
            _987 <= _769;
        2:
            _987 <= _905;
        default:
            _987 <= _986;
        endcase
    end
    assign _1 = _987;
    always @(posedge _248) begin
        if (_246)
            _1009 <= _1008;
        else
            _1009 <= _1;
    end
    assign _1010 = { _1012,
                     _1009 };
    assign _995 = 13'b1111111111111;
    assign _994 = _992[12:0];
    assign _988 = 16'b0001111111111111;
    assign _993 = _988 < _992;
    assign _996 = _993 ? _995 : _994;
    assign _2 = _996;
    always @(posedge _248) begin
        if (_246)
            _1005 <= _1015;
        else
            _1005 <= _2;
    end
    assign _1011 = _1005 < _1010;
    assign _1016 = _1011 ? _1015 : _1014;
    assign _1002 = 13'b0111111111111;
    assign _1017 = _1002 < _1016;
    assign _1020 = _1017 ? _1021 : _1018;
    assign _1000 = 1'b0;
    assign _997 = 16'b1111111111111111;
    assign _998 = _992 == _997;
    assign _3 = _998;
    always @(posedge _248) begin
        if (_246)
            _1001 <= _1000;
        else
            _1001 <= _3;
    end
    assign _1022 = _1001 ? _1021 : _1020;
    assign _4 = _1022;
    always @(posedge _248) begin
        if (_246)
            _1162 <= _1161;
        else
            _1162 <= _4;
    end
    assign _1025 = _992[11:0];
    always @* begin
        case (f_winner)
        0:
            _991 <= _314;
        1:
            _991 <= _683;
        2:
            _991 <= _819;
        default:
            _991 <= _990;
        endcase
    end
    always @* begin
        case (_991)
        0:
            _992 <= _317;
        1:
            _992 <= _320;
        2:
            _992 <= _323;
        default:
            _992 <= _323;
        endcase
    end
    assign _1023 = 16'b0000111111111111;
    assign _1024 = _1023 < _992;
    assign _1027 = _1024 ? _1021 : _1025;
    assign _5 = _1027;
    always @(posedge _248) begin
        if (_246)
            _1159 <= _1161;
        else
            _1159 <= _5;
    end
    assign _1163 = _1159 < _1162;
    assign _1164 = _1144 & _1163;
    assign _1165 = _1164 ? _1159 : _1162;
    assign _1156 = _50[23:12];
    assign _1166 = _1156 < _1165;
    assign _1167 = _1166 ? _1156 : _1165;
    assign _1154 = 8'b00000000;
    assign _1155 = _1139 == _1154;
    assign _1168 = _1155 ? _1165 : _1167;
    assign _1152 = 8'b11111111;
    assign _1151 = _1149[7:0];
    assign _1146 = 2'b10;
    assign _1145 = 2'b01;
    assign _1134 = _1130 == _1133;
    assign _1126 = _1122 & _1125;
    assign _1135 = _1126 & _1134;
    assign _6 = _1135;
    always @(posedge _248) begin
        if (_246)
            _1144 <= _1000;
        else
            _1144 <= _6;
    end
    assign _1147 = _1144 ? _1146 : _1145;
    assign _1141 = 7'b0000000;
    assign _1148 = { _1141,
                     _1147 };
    assign _1139 = _50[31:24];
    assign _1140 = { gnd,
                     _1139 };
    assign _1149 = _1140 + _1148;
    assign _1150 = _1149[8:8];
    assign _1153 = _1150 ? _1152 : _1151;
    assign _1176 = { _1153,
                     _1168,
                     _1175 };
    assign _8 = host_cov_wdata;
    assign _1177 = _1138 ? _1176 : _8;
    assign _1185 = _1138 | _1184;
    assign _1183 = ~ _1125;
    assign _1181 = ~ _1138;
    assign _12 = host_cov_we;
    assign _1180 = _12 & _1179;
    assign _1182 = _1180 & _1181;
    assign _1184 = _1182 & _1183;
    assign _1187 = ~ _1184;
    assign _1186 = ~ _1138;
    assign _1188 = _1186 & _1187;
    assign _14 = _1133;
    always @(posedge _248) begin
        if (_246)
            _1192 <= _1154;
        else
            _1192 <= _14;
    end
    assign _16 = host_cov_addr;
    assign _1189 = _1125 ? _1133 : _16;
    assign _17 = _1125;
    always @(posedge _248) begin
        if (_246)
            _1138 <= _1000;
        else
            _1138 <= _17;
    end
    assign _1193 = _1138 ? _1192 : _1189;
    assign _20 = host_rec_wdata;
    assign _23 = host_rec_we;
    assign _1194 = _23 & _1179;
    assign _1198 = _333[1:0];
    assign _1199 = { _1129,
                     _1198 };
    assign _27 = host_rec_waddr;
    assign _1195 = 3'b100;
    assign _1196 = _333 < _1195;
    assign _1197 = f_in_fetch & _1196;
    assign _1200 = _1197 ? _1199 : _27;
    assign _1351 = 3'b001;
    assign _1352 = _1350 ? _1351 : _1327;
    assign _1324 = 3'b010;
    assign _1326 = _1317 ? _1195 : _1324;
    assign _1327 = _1320 ? _1326 : _1323;
    assign _1353 = _1305 ? _1352 : _1327;
    assign _1355 = _1204 ? _1008 : _1353;
    assign _1357 = _1202 ? _1008 : _1355;
    assign _29 = _1357;
    always @(posedge _248) begin
        if (_246)
            _1323 <= _1008;
        else
            _1323 <= _29;
    end
    assign _1516 = { _592,
                     _595,
                     _598,
                     _601,
                     gnd,
                     _1323 };
    assign _1509 = _1507 ? _1351 : _1484;
    assign _1483 = _1474 ? _1195 : _1324;
    assign _1484 = _1477 ? _1483 : _1480;
    assign _1510 = _1462 ? _1509 : _1484;
    assign _1512 = _1361 ? _1008 : _1510;
    assign _1514 = _1359 ? _1008 : _1512;
    assign _30 = _1514;
    always @(posedge _248) begin
        if (_246)
            _1480 <= _1008;
        else
            _1480 <= _30;
    end
    assign _1515 = { _606,
                     _609,
                     _612,
                     _615,
                     gnd,
                     _1480 };
    assign _1517 = { _1515,
                     _1516 };
    assign _1527 = 1'b1;
    assign _32 = _1130;
    always @(posedge _248) begin
        if (_246)
            _1133 <= _1154;
        else
            _1133 <= _32;
    end
    assign _1130 = { _1129,
                     f_winner };
    assign _1521 = _1130 == _1133;
    assign _1522 = ~ _1521;
    assign _1518 = ~ _1125;
    assign _1519 = _1122 & _1518;
    assign _33 = _1519;
    always @(posedge _248) begin
        if (_246)
            _1125 <= _1000;
        else
            _1125 <= _33;
    end
    assign _35 = host_cover_en;
    assign _1122 = _1121 & _35;
    assign _1520 = _1122 & _1125;
    assign _1523 = _1520 & _1522;
    assign _1528 = _1523 ? _1527 : _1526;
    assign _1530 = _258 ? _1000 : _1528;
    assign _36 = _1530;
    always @(posedge _248) begin
        if (_246)
            _1526 <= _1000;
        else
            _1526 <= _36;
    end
    assign _1533 = _56 & _1532;
    assign _1538 = _1533 ? _1527 : _1536;
    assign _1540 = _258 ? _1000 : _1538;
    assign _38 = _1540;
    always @(posedge _248) begin
        if (_246)
            _1536 <= _1000;
        else
            _1536 <= _38;
    end
    assign _1672 = ~ _1671;
    assign _1665 = _1650 & _1664;
    assign _1673 = _1665 & _1672;
    assign _1646 = ~ _1645;
    assign _1593 = _1543 & _1592;
    assign _1647 = _1593 & _1646;
    assign _1674 = _1647 | _1673;
    assign _40 = _1674;
    assign _1675 = _118 & _580;
    assign _1676 = _1675 | _40;
    assign _1681 = _1676 ? _1527 : _1679;
    assign _1683 = _258 ? _1000 : _1681;
    assign _41 = _1683;
    always @(posedge _248) begin
        if (_246)
            _1679 <= _1000;
        else
            _1679 <= _41;
    end
    assign _1688 = _1687[61:61];
    assign _1689 = _1653 & _1688;
    assign _1694 = _1689 ? _1527 : _1692;
    assign _45 = host_irq_ack;
    assign _1696 = _45 ? _1000 : _1694;
    assign _1698 = _258 ? _1000 : _1696;
    assign _46 = _1698;
    always @(posedge _248) begin
        if (_246)
            _1692 <= _1000;
        else
            _1692 <= _46;
    end
    assign _1723 = _1719 == _1722;
    assign _1725 = _1723 ? _1527 : _1686;
    assign _1721 = _1719 == _2005;
    assign _1727 = _1721 ? _1527 : _1725;
    assign _1728 = _1718 ? _1727 : _1686;
    assign _1729 = _1121 ? _1686 : _1728;
    assign _1700 = _266 == _1146;
    assign _1730 = _1700 ? _1729 : _1686;
    assign _1732 = _258 ? _1000 : _1730;
    assign _47 = _1732;
    always @(posedge _248) begin
        if (_246)
            _1686 <= _1000;
        else
            _1686 <= _47;
    end
    assign _1738 = ~ _1737;
    assign _1735 = ~ _1734;
    assign _1739 = _1735 | _1738;
    assign _1740 = _1739 | _1686;
    assign _1741 = _1740 | _1692;
    assign _50 = ram_cov_rdata;
    assign _1888 = 3'b111;
    assign _1889 = _1746 == _1888;
    assign _1890 = _1743 & _1889;
    assign _1887 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _248) begin
        if (_246)
            _1891 <= _1887;
        else
            if (_1890)
                _1891 <= _55;
    end
    assign _1882 = 3'b110;
    assign _1883 = _1746 == _1882;
    assign _1884 = _1743 & _1883;
    always @(posedge _248) begin
        if (_246)
            _1885 <= _1887;
        else
            if (_1884)
                _1885 <= _55;
    end
    assign _1876 = 3'b101;
    assign _1877 = _1746 == _1876;
    assign _1878 = _1743 & _1877;
    always @(posedge _248) begin
        if (_246)
            _1879 <= _1887;
        else
            if (_1878)
                _1879 <= _55;
    end
    assign _1871 = _1746 == _1195;
    assign _1872 = _1743 & _1871;
    always @(posedge _248) begin
        if (_246)
            _1873 <= _1887;
        else
            if (_1872)
                _1873 <= _55;
    end
    assign _1864 = 3'b011;
    assign _1865 = _1746 == _1864;
    assign _1866 = _1743 & _1865;
    always @(posedge _248) begin
        if (_246)
            _1867 <= _1887;
        else
            if (_1866)
                _1867 <= _55;
    end
    assign _1859 = _1746 == _1324;
    assign _1860 = _1743 & _1859;
    always @(posedge _248) begin
        if (_246)
            _1861 <= _1887;
        else
            if (_1860)
                _1861 <= _55;
    end
    assign _1853 = _1746 == _1351;
    assign _1854 = _1743 & _1853;
    always @(posedge _248) begin
        if (_246)
            _1855 <= _1887;
        else
            if (_1854)
                _1855 <= _55;
    end
    assign _1748 = _1746 + _1351;
    assign _1749 = _1743 ? _1748 : _1746;
    assign _53 = _1749;
    always @(posedge _248) begin
        if (_246)
            _1746 <= _1008;
        else
            _1746 <= _53;
    end
    assign _1847 = _1746 == _1008;
    assign _1848 = _1743 & _1847;
    assign _1822 = _1762 - _1818;
    assign _1757 = 29'b11111111111111111111111111111;
    assign _1756 = 29'b00000000000000000000000000000;
    assign _1759 = 29'b00000000000000000000000000001;
    assign _1760 = ts_hi_m1 + _1759;
    assign _1753 = ts_reg[2:0];
    assign _1755 = _1753 == _1888;
    assign _1761 = _1755 ? _1760 : ts_hi_m1;
    assign _54 = _1761;
    always @(posedge _248) begin
        if (_246)
            ts_hi_m1 <= _1757;
        else
            ts_hi_m1 <= _54;
    end
    assign _1820 = ts_reg[31:3];
    assign _1808 = f_watch[0:0];
    assign _1807 = _302[0:0];
    assign _1809 = _1807 & _1808;
    assign _1811 = _1809 ? _522 : _1008;
    assign _1803 = f_watch[1:1];
    assign _1802 = _302[1:1];
    assign _1804 = _1802 & _1803;
    assign _1806 = _1804 ? _501 : _1008;
    assign _1812 = _1806 < _1811;
    assign _1813 = _1812 ? _1811 : _1806;
    assign _1796 = f_watch[2:2];
    assign _1795 = _302[2:2];
    assign _1797 = _1795 & _1796;
    assign _1799 = _1797 ? _478 : _1008;
    assign _1791 = f_watch[3:3];
    assign _1790 = _302[3:3];
    assign _1792 = _1790 & _1791;
    assign _1794 = _1792 ? _457 : _1008;
    assign _1800 = _1794 < _1799;
    assign _1801 = _1800 ? _1799 : _1794;
    assign _1814 = _1801 < _1813;
    assign _1815 = _1814 ? _1813 : _1801;
    assign _1782 = f_watch[4:4];
    assign _1781 = _302[4:4];
    assign _1783 = _1781 & _1782;
    assign _1785 = _1783 ? _432 : _1008;
    assign _1777 = f_watch[5:5];
    assign _1776 = _302[5:5];
    assign _1778 = _1776 & _1777;
    assign _1780 = _1778 ? _411 : _1008;
    assign _1786 = _1780 < _1785;
    assign _1787 = _1786 ? _1785 : _1780;
    assign _1770 = f_watch[6:6];
    assign _1769 = _302[6:6];
    assign _1771 = _1769 & _1770;
    assign _1773 = _1771 ? _388 : _1008;
    assign _1765 = f_watch[7:7];
    assign _1764 = _302[7:7];
    assign _1766 = _1764 & _1765;
    assign _1768 = _1766 ? _367 : _1008;
    assign _1774 = _1768 < _1773;
    assign _1775 = _1774 ? _1773 : _1768;
    assign _1788 = _1775 < _1787;
    assign _1789 = _1788 ? _1787 : _1775;
    assign _1816 = _1789 < _1815;
    assign _1817 = _1816 ? _1815 : _1789;
    assign _1818 = f_unexp_now ? _1817 : _1008;
    assign _1762 = ts_reg[2:0];
    assign _1819 = _1762 < _1818;
    assign _1821 = _1819 ? ts_hi_m1 : _1820;
    assign _1823 = { _1821,
                     _1822 };
    assign _1825 = { _1823,
                     _1129,
                     _1824,
                     _289 };
    assign _55 = _1825;
    always @(posedge _248) begin
        if (_246)
            _1849 <= _1887;
        else
            if (_1848)
                _1849 <= _55;
    end
    assign _1842 = _1840 + _1351;
    assign _1736 = 4'b0000;
    assign _1831 = 4'b0001;
    assign _1832 = _57 + _1831;
    assign _1830 = _57 - _1831;
    assign _1833 = _1743 ? _1832 : _1830;
    assign _1531 = 4'b1000;
    assign _1532 = _57 == _1531;
    assign _1742 = ~ _1532;
    assign _56 = _1718;
    assign _1743 = _56 & _1742;
    assign _1828 = _1743 ^ _1827;
    assign _1834 = _1828 ? _1833 : _57;
    always @(posedge _248) begin
        if (_246)
            _1837 <= _1736;
        else
            _1837 <= _1834;
    end
    assign _57 = _1837;
    assign _1737 = _57 == _1736;
    assign _1826 = ~ _1737;
    assign _59 = host_vlog_pop;
    assign _1827 = _59 & _1826;
    assign _1843 = _1827 ? _1842 : _1840;
    assign _60 = _1843;
    always @(posedge _248) begin
        if (_246)
            _1840 <= _1008;
        else
            _1840 <= _60;
    end
    always @* begin
        case (_1840)
        0:
            _1892 <= _1849;
        1:
            _1892 <= _1855;
        2:
            _1892 <= _1861;
        3:
            _1892 <= _1867;
        4:
            _1892 <= _1873;
        5:
            _1892 <= _1879;
        6:
            _1892 <= _1885;
        default:
            _1892 <= _1891;
        endcase
    end
    assign _1996 = _1897 == _1888;
    assign _1997 = _1894 & _1996;
    always @(posedge _248) begin
        if (_246)
            _1998 <= _1154;
        else
            if (_1997)
                _1998 <= _66;
    end
    assign _1990 = _1897 == _1882;
    assign _1991 = _1894 & _1990;
    always @(posedge _248) begin
        if (_246)
            _1992 <= _1154;
        else
            if (_1991)
                _1992 <= _66;
    end
    assign _1984 = _1897 == _1876;
    assign _1985 = _1894 & _1984;
    always @(posedge _248) begin
        if (_246)
            _1986 <= _1154;
        else
            if (_1985)
                _1986 <= _66;
    end
    assign _1978 = _1897 == _1195;
    assign _1979 = _1894 & _1978;
    always @(posedge _248) begin
        if (_246)
            _1980 <= _1154;
        else
            if (_1979)
                _1980 <= _66;
    end
    assign _1972 = _1897 == _1864;
    assign _1973 = _1894 & _1972;
    always @(posedge _248) begin
        if (_246)
            _1974 <= _1154;
        else
            if (_1973)
                _1974 <= _66;
    end
    assign _1966 = _1897 == _1324;
    assign _1967 = _1894 & _1966;
    always @(posedge _248) begin
        if (_246)
            _1968 <= _1154;
        else
            if (_1967)
                _1968 <= _66;
    end
    assign _1960 = _1897 == _1351;
    assign _1961 = _1894 & _1960;
    always @(posedge _248) begin
        if (_246)
            _1962 <= _1154;
        else
            if (_1961)
                _1962 <= _66;
    end
    assign _1899 = _1897 + _1351;
    assign _1900 = _1894 ? _1899 : _1897;
    assign _63 = _1900;
    always @(posedge _248) begin
        if (_246)
            _1897 <= _1008;
        else
            _1897 <= _63;
    end
    assign _1954 = _1897 == _1008;
    assign _1955 = _1894 & _1954;
    assign _1940 = _1600 ? _1939 : _1934;
    assign _1941 = _1606 ? _1939 : _1940;
    assign _1918 = _1917 ? _1915 : _1905;
    assign _1916 = _1902 ? _1915 : _1905;
    assign _1919 = _1645 ? _1918 : _1916;
    assign _64 = _1919;
    always @(posedge _248) begin
        if (_246)
            _1905 <= _1154;
        else
            _1905 <= _64;
    end
    assign _1914 = _1550 ? _1913 : _1908;
    assign _1915 = _1556 ? _1913 : _1914;
    assign _1930 = _1543 ? _1905 : _1915;
    assign _1927 = _1926 ? _575 : _1924;
    assign _1925 = _1921 ? _575 : _1924;
    assign _1928 = _1671 ? _1927 : _1925;
    assign _65 = _1928;
    always @(posedge _248) begin
        if (_246)
            _1924 <= _1154;
        else
            _1924 <= _65;
    end
    assign _1929 = _1650 ? _1924 : _575;
    assign _1931 = _1645 ? _1930 : _1929;
    assign _1942 = _1642 ? _1941 : _1931;
    assign _66 = _1942;
    always @(posedge _248) begin
        if (_246)
            _1956 <= _1154;
        else
            if (_1955)
                _1956 <= _66;
    end
    assign _1949 = _1947 + _1351;
    assign _1950 = _1944 ? _1949 : _1947;
    assign _67 = _1950;
    always @(posedge _248) begin
        if (_246)
            _1947 <= _1008;
        else
            _1947 <= _67;
    end
    always @* begin
        case (_1947)
        0:
            _1999 <= _1956;
        1:
            _1999 <= _1962;
        2:
            _1999 <= _1968;
        3:
            _1999 <= _1974;
        4:
            _1999 <= _1980;
        5:
            _1999 <= _1986;
        6:
            _1999 <= _1992;
        default:
            _1999 <= _1998;
        endcase
    end
    assign _1751 = 32'b00000000000000000000000000000000;
    assign _2002 = 32'b00000000000000000000000000000001;
    assign _2003 = ts_reg + _2002;
    assign _71 = _2003;
    always @(posedge _248) begin
        if (_246)
            ts_reg <= _1751;
        else
            ts_reg <= _71;
    end
    assign _2005 = 2'b00;
    assign _1824 = { _1709,
                     f_unexp_now };
    always @(posedge _248) begin
        if (_246)
            _2006 <= _2005;
        else
            _2006 <= _1824;
    end
    always @(posedge _248) begin
        if (_246)
            _2009 <= _1000;
        else
            _2009 <= _1718;
    end
    always @(posedge _248) begin
        if (_246)
            _2012 <= _2005;
        else
            _2012 <= f_winner;
    end
    always @(posedge _248) begin
        if (_246)
            _2015 <= _1000;
        else
            _2015 <= _1121;
    end
    assign _2016 = _1687[60:60];
    assign _2017 = f_in_eval & _2016;
    assign _1179 = _266 == _2005;
    assign _2018 = ~ _1179;
    assign _2159 = _84 & _2158;
    assign _2160 = ~ _2159;
    assign _2040 = _1687[23:16];
    assign _2038 = _989[86:79];
    assign _2037 = _801[86:79];
    assign _2036 = _665[86:79];
    assign _2035 = _282[86:79];
    always @* begin
        case (f_winner)
        0:
            _2039 <= _2035;
        1:
            _2039 <= _2036;
        2:
            _2039 <= _2037;
        default:
            _2039 <= _2038;
        endcase
    end
    assign _2041 = _1653 ? _2040 : _2039;
    assign _2042 = _2041 & _2032;
    assign _2033 = ~ _2032;
    assign _2034 = _2025 & _2033;
    assign _2043 = _2034 | _2042;
    assign _2077 = _2043 | _2076;
    assign _2078 = _2022 ? _2077 : _2025;
    assign _2080 = _255 ? _1154 : _2078;
    assign _2082 = _258 ? _1154 : _2080;
    assign _81 = _2082;
    always @(posedge _248) begin
        if (_246)
            _2025 <= _1154;
        else
            _2025 <= _81;
    end
    assign _2161 = _2025 & _2160;
    assign _84 = host_open_drain;
    assign _3457 = ~ _84;
    assign _2156 = _1474 & _2150;
    assign _2155 = ~ _1474;
    assign _2153 = ~ _1317;
    assign _2154 = _2153 & _2150;
    assign _2152 = _1317 & _2150;
    assign _2151 = ~ _1317;
    assign _2150 = _2086[0:0];
    assign _2149 = _261[2:0];
    always @* begin
        case (_2149)
        0:
            _2157 <= _2150;
        1:
            _2157 <= _1317;
        2:
            _2157 <= _2151;
        3:
            _2157 <= _2152;
        4:
            _2157 <= _2154;
        5:
            _2157 <= _1474;
        6:
            _2157 <= _2155;
        default:
            _2157 <= _2156;
        endcase
    end
    assign _2147 = _1474 & _2141;
    assign _2146 = ~ _1474;
    assign _2144 = ~ _1317;
    assign _2145 = _2144 & _2141;
    assign _2143 = _1317 & _2141;
    assign _2142 = ~ _1317;
    assign _2141 = _2086[1:1];
    assign _2140 = _261[5:3];
    always @* begin
        case (_2140)
        0:
            _2148 <= _2141;
        1:
            _2148 <= _1317;
        2:
            _2148 <= _2142;
        3:
            _2148 <= _2143;
        4:
            _2148 <= _2145;
        5:
            _2148 <= _1474;
        6:
            _2148 <= _2146;
        default:
            _2148 <= _2147;
        endcase
    end
    assign _2138 = _1474 & _2132;
    assign _2137 = ~ _1474;
    assign _2135 = ~ _1317;
    assign _2136 = _2135 & _2132;
    assign _2134 = _1317 & _2132;
    assign _2133 = ~ _1317;
    assign _2132 = _2086[2:2];
    assign _2131 = _261[8:6];
    always @* begin
        case (_2131)
        0:
            _2139 <= _2132;
        1:
            _2139 <= _1317;
        2:
            _2139 <= _2133;
        3:
            _2139 <= _2134;
        4:
            _2139 <= _2136;
        5:
            _2139 <= _1474;
        6:
            _2139 <= _2137;
        default:
            _2139 <= _2138;
        endcase
    end
    assign _2129 = _1474 & _2123;
    assign _2128 = ~ _1474;
    assign _2126 = ~ _1317;
    assign _2127 = _2126 & _2123;
    assign _2125 = _1317 & _2123;
    assign _2124 = ~ _1317;
    assign _2123 = _2086[3:3];
    assign _2122 = _261[11:9];
    always @* begin
        case (_2122)
        0:
            _2130 <= _2123;
        1:
            _2130 <= _1317;
        2:
            _2130 <= _2124;
        3:
            _2130 <= _2125;
        4:
            _2130 <= _2127;
        5:
            _2130 <= _1474;
        6:
            _2130 <= _2128;
        default:
            _2130 <= _2129;
        endcase
    end
    assign _2120 = _1474 & _2114;
    assign _2119 = ~ _1474;
    assign _2117 = ~ _1317;
    assign _2118 = _2117 & _2114;
    assign _2116 = _1317 & _2114;
    assign _2115 = ~ _1317;
    assign _2114 = _2086[4:4];
    assign _2113 = _261[14:12];
    always @* begin
        case (_2113)
        0:
            _2121 <= _2114;
        1:
            _2121 <= _1317;
        2:
            _2121 <= _2115;
        3:
            _2121 <= _2116;
        4:
            _2121 <= _2118;
        5:
            _2121 <= _1474;
        6:
            _2121 <= _2119;
        default:
            _2121 <= _2120;
        endcase
    end
    assign _2111 = _1474 & _2105;
    assign _2110 = ~ _1474;
    assign _2108 = ~ _1317;
    assign _2109 = _2108 & _2105;
    assign _2107 = _1317 & _2105;
    assign _2106 = ~ _1317;
    assign _2105 = _2086[5:5];
    assign _2104 = _261[17:15];
    always @* begin
        case (_2104)
        0:
            _2112 <= _2105;
        1:
            _2112 <= _1317;
        2:
            _2112 <= _2106;
        3:
            _2112 <= _2107;
        4:
            _2112 <= _2109;
        5:
            _2112 <= _1474;
        6:
            _2112 <= _2110;
        default:
            _2112 <= _2111;
        endcase
    end
    assign _2102 = _1474 & _2096;
    assign _2101 = ~ _1474;
    assign _2099 = ~ _1317;
    assign _2100 = _2099 & _2096;
    assign _2098 = _1317 & _2096;
    assign _2097 = ~ _1317;
    assign _2096 = _2086[6:6];
    assign _2095 = _261[20:18];
    always @* begin
        case (_2095)
        0:
            _2103 <= _2096;
        1:
            _2103 <= _1317;
        2:
            _2103 <= _2097;
        3:
            _2103 <= _2098;
        4:
            _2103 <= _2100;
        5:
            _2103 <= _1474;
        6:
            _2103 <= _2101;
        default:
            _2103 <= _2102;
        endcase
    end
    assign _2093 = _1474 & _2087;
    assign _2092 = ~ _1474;
    assign _2090 = ~ _1317;
    assign _2091 = _2090 & _2087;
    assign _2089 = _1317 & _2087;
    assign _2088 = ~ _1317;
    assign _3449 = { _3447,
                     _3446 };
    assign _3446 = _571[0:0];
    assign _3447 = { _3446,
                     _3446 };
    assign _3448 = { _3447,
                     _3447 };
    assign _3450 = { _3448,
                     _3449 };
    assign _3451 = { _3450,
                     _3446 };
    assign _3452 = _3451 & _2076;
    assign _2074 = _2070 & _2068;
    assign _2073 = _2070 & _2066;
    assign _2072 = _2070 & _2063;
    assign _2070 = ~ _2057;
    assign _2071 = _2070 & _2060;
    assign _2068 = _2065 & _2062;
    assign _2069 = _2057 & _2068;
    assign _2065 = ~ _2058;
    assign _2066 = _2065 & _2059;
    assign _2067 = _2057 & _2066;
    assign _2062 = ~ _2059;
    assign _2063 = _2058 & _2062;
    assign _2064 = _2057 & _2063;
    assign _2059 = _2056[0:0];
    assign _2058 = _2056[1:1];
    assign _2060 = _2058 & _2059;
    assign _2057 = _2056[2:2];
    assign _2061 = _2057 & _2060;
    assign _2075 = { _2061,
                     _2064,
                     _2067,
                     _2069,
                     _2071,
                     _2072,
                     _2073,
                     _2074 };
    assign _2044 = ~ _1653;
    assign _2050 = _2044 & _2049;
    assign _2076 = _2050 ? _2075 : _1154;
    assign _3444 = ~ _2076;
    assign _3440 = _1687[15:8];
    assign _3438 = _989[78:71];
    assign _3437 = _801[78:71];
    assign _3436 = _665[78:71];
    assign _3435 = _282[78:71];
    always @* begin
        case (f_winner)
        0:
            _3439 <= _3435;
        1:
            _3439 <= _3436;
        2:
            _3439 <= _3437;
        default:
            _3439 <= _3438;
        endcase
    end
    assign _3441 = _1653 ? _3440 : _3439;
    assign _3442 = _3441 & _2032;
    assign _2031 = _1687[7:0];
    assign _2029 = _989[70:63];
    assign _2028 = _801[70:63];
    assign _2027 = _665[70:63];
    assign _2026 = _282[70:63];
    always @* begin
        case (f_winner)
        0:
            _2030 <= _2026;
        1:
            _2030 <= _2027;
        2:
            _2030 <= _2028;
        default:
            _2030 <= _2029;
        endcase
    end
    assign _2032 = _1653 ? _2031 : _2030;
    assign _3433 = ~ _2032;
    assign _3434 = _2086 & _3433;
    assign _3443 = _3434 | _3442;
    assign _3445 = _3443 & _3444;
    assign _3453 = _3445 | _3452;
    assign _2020 = _622 == _2005;
    assign _2021 = _2020 | _624;
    assign _1652 = _333 == _1195;
    assign _3427 = _1653 ? _1146 : _266;
    assign _3423 = _2173 ? _1145 : _266;
    assign _1722 = 2'b11;
    assign _3414 = _1719 == _1722;
    assign _3416 = _3414 ? _2005 : _266;
    assign _3413 = _1719 == _1146;
    assign _3418 = _3413 ? _1145 : _3416;
    assign _3412 = _1719 == _2005;
    assign _3420 = _3412 ? _2005 : _3418;
    assign _3421 = _1718 ? _3420 : _266;
    assign _1114 = _1074 == _997;
    assign _1109 = 16'b0000000000000000;
    assign _1110 = _1074 == _1109;
    assign _1111 = _1110 & _1091;
    assign _1108 = _1050 == _1070;
    assign _1112 = _1108 | _1111;
    assign _1115 = _1049 ? _1114 : _1112;
    assign _1105 = _583[3:0];
    assign _1107 = _1105 == _1736;
    assign _1116 = _1107 | _1115;
    assign _1103 = _1074 == _997;
    assign _1099 = _1074 == _1109;
    assign _1100 = _1099 & _1091;
    assign _1097 = _1050 == _1070;
    assign _1101 = _1097 | _1100;
    assign _1104 = _1049 ? _1103 : _1101;
    assign _1095 = _1061 == _997;
    always @(posedge _248) begin
        if (_246)
            _986 <= _1008;
        else
            _986 <= _983;
    end
    assign _1090 = { _1015,
                     _986 };
    assign _1091 = _1047 < _1090;
    assign _1088 = _1061 == _1109;
    assign _1092 = _1088 & _1091;
    assign _1086 = _1050 == _1058;
    assign _1093 = _1086 | _1092;
    assign _1096 = _1049 ? _1095 : _1093;
    assign _1085 = _989[104:103];
    always @* begin
        case (_1085)
        0:
            _1117 <= vdd;
        1:
            _1117 <= _1096;
        2:
            _1117 <= _1104;
        default:
            _1117 <= _1116;
        endcase
    end
    assign _1084 = ~ _624;
    assign _1118 = _1084 | _1117;
    assign _1081 = _989[62:62];
    assign _1079 = _989[61:58];
    always @* begin
        case (_1079)
        0:
            _1080 <= vdd;
        1:
            _1080 <= _568;
        2:
            _1080 <= _572;
        3:
            _1080 <= _576;
        4:
            _1080 <= _578;
        5:
            _1080 <= _580;
        6:
            _1080 <= _584;
        7:
            _1080 <= _587;
        8:
            _1080 <= _592;
        9:
            _1080 <= _595;
        10:
            _1080 <= _598;
        11:
            _1080 <= _601;
        12:
            _1080 <= _606;
        13:
            _1080 <= _609;
        14:
            _1080 <= _612;
        default:
            _1080 <= _615;
        endcase
    end
    assign _1082 = _1080 ^ _1081;
    assign _1074 = _989[57:42];
    assign _1076 = _1074 == _997;
    assign _1069 = 17'b00000000000000000;
    assign _1065 = _944[57:42];
    assign _1066 = { gnd,
                     _1065 };
    assign _1067 = _1066 + _1054;
    always @(posedge _248) begin
        if (_246)
            _1070 <= _1069;
        else
            _1070 <= _1067;
    end
    assign _1071 = _1070 < _1050;
    assign _1072 = ~ _1071;
    assign _1061 = _989[41:26];
    assign _1063 = _1061 == _1109;
    assign _975 = _945[0:0];
    assign _977 = _975 ? _530 : _1008;
    assign _972 = _945[1:1];
    assign _974 = _972 ? _509 : _1008;
    assign _978 = _974 < _977;
    assign _979 = _978 ? _977 : _974;
    assign _967 = _945[2:2];
    assign _969 = _967 ? _486 : _1008;
    assign _964 = _945[3:3];
    assign _966 = _964 ? _465 : _1008;
    assign _970 = _966 < _969;
    assign _971 = _970 ? _969 : _966;
    assign _980 = _971 < _979;
    assign _981 = _980 ? _979 : _971;
    assign _957 = _945[4:4];
    assign _959 = _957 ? _440 : _1008;
    assign _954 = _945[5:5];
    assign _956 = _954 ? _419 : _1008;
    assign _960 = _956 < _959;
    assign _961 = _960 ? _959 : _956;
    assign _949 = _945[6:6];
    assign _951 = _949 ? _396 : _1008;
    assign _945 = _944[23:16];
    assign _946 = _945[7:7];
    assign _948 = _946 ? _375 : _1008;
    assign _952 = _948 < _951;
    assign _953 = _952 ? _951 : _948;
    assign _962 = _953 < _961;
    assign _963 = _962 ? _961 : _953;
    assign _982 = _963 < _981;
    assign _983 = _982 ? _981 : _963;
    assign _1053 = 14'b00000000000000;
    assign _1054 = { _1053,
                     _983 };
    assign _944 = _350[511:400];
    assign _1051 = _944[41:26];
    assign _1052 = { gnd,
                     _1051 };
    assign _1055 = _1052 + _1054;
    always @(posedge _248) begin
        if (_246)
            _1058 <= _1069;
        else
            _1058 <= _1055;
    end
    assign _1050 = { gnd,
                     _1047 };
    assign _1059 = _1050 < _1058;
    assign _1060 = ~ _1059;
    assign _1064 = _1060 | _1063;
    assign _1073 = _1064 & _1072;
    assign _990 = _989[25:24];
    always @* begin
        case (_990)
        0:
            _1047 <= _317;
        1:
            _1047 <= _320;
        2:
            _1047 <= _323;
        default:
            _1047 <= _323;
        endcase
    end
    assign _1049 = _1047 == _997;
    assign _1077 = _1049 ? _1076 : _1073;
    assign _1041 = f_changed_all & _1038;
    assign _1043 = _1041 == _1154;
    assign _1044 = ~ _1043;
    assign _1038 = _989[23:16];
    assign _1040 = _1038 == _1154;
    assign _1045 = _1040 | _1044;
    assign _1033 = _989[7:0];
    assign _1031 = _989[15:8];
    assign _1032 = _289 ^ _1031;
    assign _1034 = _1032 & _1033;
    assign _1036 = _1034 == _1154;
    assign _1030 = _989[111:111];
    assign _1037 = _1030 & _1036;
    assign _1046 = _1037 & _1045;
    assign _1078 = _1046 & _1077;
    assign _1083 = _1078 & _1082;
    assign _1119 = _1083 & _1118;
    assign f_fire3 = f_in_eval & _1119;
    assign _658 = _558 == _997;
    assign _654 = _558 == _1109;
    assign _655 = _654 & _635;
    assign _652 = _328 == _554;
    assign _656 = _652 | _655;
    assign _659 = _326 ? _658 : _656;
    assign _649 = _583[3:0];
    assign _651 = _649 == _1736;
    assign _660 = _651 | _659;
    assign _647 = _558 == _997;
    assign _643 = _558 == _1109;
    assign _644 = _643 & _635;
    assign _641 = _328 == _554;
    assign _645 = _641 | _644;
    assign _648 = _326 ? _647 : _645;
    assign _639 = _545 == _997;
    always @(posedge _248) begin
        if (_246)
            _633 <= _1008;
        else
            _633 <= _537;
    end
    assign _634 = { _1015,
                    _633 };
    assign _635 = _324 < _634;
    assign _629 = _545 == _1109;
    assign _636 = _629 & _635;
    assign _627 = _328 == _542;
    assign _637 = _627 | _636;
    assign _640 = _326 ? _639 : _637;
    assign _626 = _282[104:103];
    always @* begin
        case (_626)
        0:
            _661 <= vdd;
        1:
            _661 <= _640;
        2:
            _661 <= _648;
        default:
            _661 <= _660;
        endcase
    end
    assign _625 = ~ _624;
    assign _662 = _625 | _661;
    assign _617 = _282[62:62];
    assign _563 = _282[61:58];
    always @* begin
        case (_563)
        0:
            _616 <= vdd;
        1:
            _616 <= _568;
        2:
            _616 <= _572;
        3:
            _616 <= _576;
        4:
            _616 <= _578;
        5:
            _616 <= _580;
        6:
            _616 <= _584;
        7:
            _616 <= _587;
        8:
            _616 <= _592;
        9:
            _616 <= _595;
        10:
            _616 <= _598;
        11:
            _616 <= _601;
        12:
            _616 <= _606;
        13:
            _616 <= _609;
        14:
            _616 <= _612;
        default:
            _616 <= _615;
        endcase
    end
    assign _618 = _616 ^ _617;
    assign _558 = _282[57:42];
    assign _560 = _558 == _997;
    assign _549 = _351[57:42];
    assign _550 = { gnd,
                    _549 };
    assign _551 = _550 + _538;
    always @(posedge _248) begin
        if (_246)
            _554 <= _1069;
        else
            _554 <= _551;
    end
    assign _555 = _554 < _328;
    assign _556 = ~ _555;
    assign _545 = _282[41:26];
    assign _547 = _545 == _1109;
    assign _511 = _355[0:0];
    assign _531 = _511 ? _530 : _1008;
    assign _490 = _355[1:1];
    assign _510 = _490 ? _509 : _1008;
    assign _532 = _510 < _531;
    assign _533 = _532 ? _531 : _510;
    assign _467 = _355[2:2];
    assign _487 = _467 ? _486 : _1008;
    assign _446 = _355[3:3];
    assign _466 = _446 ? _465 : _1008;
    assign _488 = _466 < _487;
    assign _489 = _488 ? _487 : _466;
    assign _534 = _489 < _533;
    assign _535 = _534 ? _533 : _489;
    assign _421 = _355[4:4];
    assign _441 = _421 ? _440 : _1008;
    assign _400 = _355[5:5];
    assign _420 = _400 ? _419 : _1008;
    assign _442 = _420 < _441;
    assign _443 = _442 ? _441 : _420;
    assign _377 = _355[6:6];
    assign _397 = _377 ? _396 : _1008;
    assign _355 = _351[23:16];
    assign _356 = _355[7:7];
    assign _376 = _356 ? _375 : _1008;
    assign _398 = _376 < _397;
    assign _399 = _398 ? _397 : _376;
    assign _444 = _399 < _443;
    assign _445 = _444 ? _443 : _399;
    assign _536 = _445 < _535;
    assign _537 = _536 ? _535 : _445;
    assign _538 = { _1053,
                    _537 };
    assign _351 = _350[175:64];
    assign _352 = _351[41:26];
    assign _353 = { gnd,
                    _352 };
    assign _539 = _353 + _538;
    always @(posedge _248) begin
        if (_246)
            _542 <= _1069;
        else
            _542 <= _539;
    end
    assign _328 = { gnd,
                    _324 };
    assign _543 = _328 < _542;
    assign _544 = ~ _543;
    assign _548 = _544 | _547;
    assign _557 = _548 & _556;
    assign _314 = _282[25:24];
    always @* begin
        case (_314)
        0:
            _324 <= _317;
        1:
            _324 <= _320;
        2:
            _324 <= _323;
        default:
            _324 <= _323;
        endcase
    end
    assign _326 = _324 == _997;
    assign _561 = _326 ? _560 : _557;
    assign _308 = f_changed_all & _297;
    assign _310 = _308 == _1154;
    assign _311 = ~ _310;
    assign _297 = _282[23:16];
    assign _299 = _297 == _1154;
    assign _312 = _299 | _311;
    assign _292 = _282[7:0];
    assign _290 = _282[15:8];
    assign _291 = _289 ^ _290;
    assign _293 = _291 & _292;
    assign _295 = _293 == _1154;
    assign _270 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _3397 = _333 + _1351;
    assign _1128 = 6'b000000;
    assign _86 = host_start_loc;
    assign _2174 = _2173 ? _2171 : _1129;
    assign _88 = host_recover_loc;
    assign _2164 = _1719 == _1146;
    assign _2165 = _2164 ? _88 : _1129;
    assign _2166 = _1718 ? _2165 : _1129;
    assign _2175 = _1121 ? _2174 : _2166;
    assign _2162 = _266 == _1146;
    assign _2176 = _2162 ? _2175 : _1129;
    assign _2177 = _258 ? _86 : _2176;
    assign _89 = _2177;
    always @(posedge _248) begin
        if (_246)
            _1129 <= _1128;
        else
            _1129 <= _89;
    end
    assign _2170 = _989[110:105];
    assign _2169 = _801[110:105];
    assign _2168 = _665[110:105];
    assign _2167 = _282[110:105];
    always @* begin
        case (f_winner)
        0:
            _2171 <= _2167;
        1:
            _2171 <= _2168;
        2:
            _2171 <= _2169;
        default:
            _2171 <= _2170;
        endcase
    end
    assign _2172 = _2171 == _1129;
    assign _2173 = ~ _2172;
    assign _3393 = _2173 ? _1008 : _333;
    assign _1719 = _1687[59:58];
    assign _3388 = _1719 == _1146;
    assign _3390 = _3388 ? _1008 : _333;
    assign f_watch = _1687[57:50];
    assign _1713 = f_changed_all & f_watch;
    assign _1715 = _1713 == _1154;
    assign _1716 = ~ _1715;
    assign _1710 = ~ _1121;
    assign _1711 = f_in_eval & _1710;
    assign f_unexp_now = _1711 & _1716;
    assign _3379 = 16'b0000000000000001;
    assign _3380 = _317 + _3379;
    assign _3376 = _317 == _997;
    assign _3377 = ~ _3376;
    assign _3378 = _3337 & _3377;
    assign _3381 = _3378 ? _3380 : _317;
    assign _3321 = _1687[26:24];
    assign _3319 = _989[93:91];
    assign _3318 = _801[93:91];
    assign _3317 = _665[93:91];
    assign _3316 = _282[93:91];
    assign _930 = _887 == _997;
    assign _926 = _887 == _1109;
    assign _927 = _926 & _907;
    assign _924 = _823 == _883;
    assign _928 = _924 | _927;
    assign _931 = _822 ? _930 : _928;
    assign _921 = _583[3:0];
    assign _923 = _921 == _1736;
    assign _932 = _923 | _931;
    assign _919 = _887 == _997;
    assign _915 = _887 == _1109;
    assign _916 = _915 & _907;
    assign _913 = _823 == _883;
    assign _917 = _913 | _916;
    assign _920 = _822 ? _919 : _917;
    assign _911 = _874 == _997;
    always @(posedge _248) begin
        if (_246)
            _905 <= _1008;
        else
            _905 <= _866;
    end
    assign _906 = { _1015,
                    _905 };
    assign _907 = _820 < _906;
    assign _901 = _874 == _1109;
    assign _908 = _901 & _907;
    assign _899 = _823 == _871;
    assign _909 = _899 | _908;
    assign _912 = _822 ? _911 : _909;
    assign _898 = _801[104:103];
    always @* begin
        case (_898)
        0:
            _933 <= vdd;
        1:
            _933 <= _912;
        2:
            _933 <= _920;
        default:
            _933 <= _932;
        endcase
    end
    assign _897 = ~ _624;
    assign _934 = _897 | _933;
    assign _894 = _801[62:62];
    assign _892 = _801[61:58];
    always @* begin
        case (_892)
        0:
            _893 <= vdd;
        1:
            _893 <= _568;
        2:
            _893 <= _572;
        3:
            _893 <= _576;
        4:
            _893 <= _578;
        5:
            _893 <= _580;
        6:
            _893 <= _584;
        7:
            _893 <= _587;
        8:
            _893 <= _592;
        9:
            _893 <= _595;
        10:
            _893 <= _598;
        11:
            _893 <= _601;
        12:
            _893 <= _606;
        13:
            _893 <= _609;
        14:
            _893 <= _612;
        default:
            _893 <= _615;
        endcase
    end
    assign _895 = _893 ^ _894;
    assign _887 = _801[57:42];
    assign _889 = _887 == _997;
    assign _878 = _824[57:42];
    assign _879 = { gnd,
                    _878 };
    assign _880 = _879 + _867;
    always @(posedge _248) begin
        if (_246)
            _883 <= _1069;
        else
            _883 <= _880;
    end
    assign _884 = _883 < _823;
    assign _885 = ~ _884;
    assign _874 = _801[41:26];
    assign _876 = _874 == _1109;
    assign _858 = _828[0:0];
    assign _860 = _858 ? _530 : _1008;
    assign _855 = _828[1:1];
    assign _857 = _855 ? _509 : _1008;
    assign _861 = _857 < _860;
    assign _862 = _861 ? _860 : _857;
    assign _850 = _828[2:2];
    assign _852 = _850 ? _486 : _1008;
    assign _847 = _828[3:3];
    assign _849 = _847 ? _465 : _1008;
    assign _853 = _849 < _852;
    assign _854 = _853 ? _852 : _849;
    assign _863 = _854 < _862;
    assign _864 = _863 ? _862 : _854;
    assign _840 = _828[4:4];
    assign _842 = _840 ? _440 : _1008;
    assign _837 = _828[5:5];
    assign _839 = _837 ? _419 : _1008;
    assign _843 = _839 < _842;
    assign _844 = _843 ? _842 : _839;
    assign _832 = _828[6:6];
    assign _834 = _832 ? _396 : _1008;
    assign _828 = _824[23:16];
    assign _829 = _828[7:7];
    assign _831 = _829 ? _375 : _1008;
    assign _835 = _831 < _834;
    assign _836 = _835 ? _834 : _831;
    assign _845 = _836 < _844;
    assign _846 = _845 ? _844 : _836;
    assign _865 = _846 < _864;
    assign _866 = _865 ? _864 : _846;
    assign _867 = { _1053,
                    _866 };
    assign _824 = _350[399:288];
    assign _825 = _824[41:26];
    assign _826 = { gnd,
                    _825 };
    assign _868 = _826 + _867;
    always @(posedge _248) begin
        if (_246)
            _871 <= _1069;
        else
            _871 <= _868;
    end
    assign _823 = { gnd,
                    _820 };
    assign _872 = _823 < _871;
    assign _873 = ~ _872;
    assign _877 = _873 | _876;
    assign _886 = _877 & _885;
    assign _819 = _801[25:24];
    always @* begin
        case (_819)
        0:
            _820 <= _317;
        1:
            _820 <= _320;
        2:
            _820 <= _323;
        default:
            _820 <= _323;
        endcase
    end
    assign _822 = _820 == _997;
    assign _890 = _822 ? _889 : _886;
    assign _813 = f_changed_all & _810;
    assign _815 = _813 == _1154;
    assign _816 = ~ _815;
    assign _810 = _801[23:16];
    assign _812 = _810 == _1154;
    assign _817 = _812 | _816;
    assign _805 = _801[7:0];
    assign _803 = _801[15:8];
    assign _804 = _289 ^ _803;
    assign _806 = _804 & _805;
    assign _808 = _806 == _1154;
    assign _802 = _801[111:111];
    assign _809 = _802 & _808;
    assign _818 = _809 & _817;
    assign _891 = _818 & _890;
    assign _896 = _891 & _895;
    assign _935 = _896 & _934;
    assign f_fire2 = f_in_eval & _935;
    assign _939 = f_fire2 ? _1146 : _1722;
    assign _794 = _751 == _997;
    assign _790 = _751 == _1109;
    assign _791 = _790 & _771;
    assign _788 = _687 == _747;
    assign _792 = _788 | _791;
    assign _795 = _686 ? _794 : _792;
    assign _785 = _583[3:0];
    assign _787 = _785 == _1736;
    assign _796 = _787 | _795;
    assign _783 = _751 == _997;
    assign _779 = _751 == _1109;
    assign _780 = _779 & _771;
    assign _777 = _687 == _747;
    assign _781 = _777 | _780;
    assign _784 = _686 ? _783 : _781;
    assign _775 = _738 == _997;
    always @(posedge _248) begin
        if (_246)
            _769 <= _1008;
        else
            _769 <= _730;
    end
    assign _770 = { _1015,
                    _769 };
    assign _771 = _684 < _770;
    assign _765 = _738 == _1109;
    assign _772 = _765 & _771;
    assign _763 = _687 == _735;
    assign _773 = _763 | _772;
    assign _776 = _686 ? _775 : _773;
    assign _762 = _665[104:103];
    always @* begin
        case (_762)
        0:
            _797 <= vdd;
        1:
            _797 <= _776;
        2:
            _797 <= _784;
        default:
            _797 <= _796;
        endcase
    end
    assign _91 = host_role;
    assign _2178 = _258 ? _91 : _622;
    assign _92 = _2178;
    always @(posedge _248) begin
        if (_246)
            _622 <= _2005;
        else
            _622 <= _92;
    end
    assign _624 = _622 == _1146;
    assign _761 = ~ _624;
    assign _798 = _761 | _797;
    assign _758 = _665[62:62];
    assign _2182 = _1507 ? _1527 : _2180;
    assign _2180 = _1477 ? _1527 : _615;
    assign _2183 = _1462 ? _2182 : _2180;
    assign _2185 = _1361 ? _1000 : _2183;
    assign _2187 = _1359 ? _1000 : _2185;
    assign _93 = _2187;
    always @(posedge _248) begin
        if (_246)
            _615 <= _1000;
        else
            _615 <= _93;
    end
    assign _95 = host_lane1_sync_mask;
    assign _97 = host_lane1_sync;
    assign _2193 = _1544 ? _2192 : _2190;
    assign _2194 = _1507 ? _2190 : _2193;
    assign _2195 = _1462 ? _2194 : _2190;
    assign _2197 = _1361 ? _1109 : _2195;
    assign _98 = _2197;
    always @(posedge _248) begin
        if (_246)
            _2190 <= _1109;
        else
            _2190 <= _98;
    end
    assign _2191 = _2190[14:0];
    assign _2192 = { _2191,
                     _1498 };
    assign _2198 = _2192 ^ _97;
    assign _2199 = _2198 & _95;
    assign _2201 = _2199 == _1109;
    assign _2203 = _2201 ? _1527 : _612;
    assign _2204 = _1544 ? _2203 : _612;
    assign _2205 = _1507 ? _612 : _2204;
    assign _2206 = _1462 ? _2205 : _612;
    assign _2208 = _1361 ? _1000 : _2206;
    assign _2210 = _1359 ? _1000 : _2208;
    assign _99 = _2210;
    always @(posedge _248) begin
        if (_246)
            _612 <= _1000;
        else
            _612 <= _99;
    end
    assign _2223 = _1498 == _2222;
    assign _2224 = ~ _2223;
    assign _2226 = _2217 ? _2225 : _2213;
    assign _2227 = _1544 ? _2226 : _2213;
    assign _2228 = _1507 ? _2213 : _2227;
    assign _2229 = _1462 ? _2228 : _2213;
    assign _2231 = _1361 ? _1000 : _2229;
    assign _100 = _2231;
    always @(posedge _248) begin
        if (_246)
            _2213 <= _1000;
        else
            _2213 <= _100;
    end
    assign _2225 = _2213 | _2224;
    assign _2234 = ~ _2225;
    assign _2232 = 6'b000001;
    assign _2233 = _1573 == _2232;
    assign _2235 = _2233 ? _2234 : _609;
    assign _2236 = _2217 ? _2235 : _609;
    assign _2237 = _1544 ? _2236 : _609;
    assign _2238 = _1507 ? _609 : _2237;
    assign _2239 = _1462 ? _2238 : _609;
    assign _2241 = _1361 ? _1000 : _2239;
    assign _2243 = _1359 ? _1000 : _2241;
    assign _101 = _2243;
    always @(posedge _248) begin
        if (_246)
            _609 <= _1000;
        else
            _609 <= _101;
    end
    assign _2247 = _1350 ? _1527 : _2245;
    assign _2245 = _1320 ? _1527 : _601;
    assign _2248 = _1305 ? _2247 : _2245;
    assign _2250 = _1204 ? _1000 : _2248;
    assign _2252 = _1202 ? _1000 : _2250;
    assign _102 = _2252;
    always @(posedge _248) begin
        if (_246)
            _601 <= _1000;
        else
            _601 <= _102;
    end
    assign _104 = host_lane0_sync_mask;
    assign _106 = host_lane0_sync;
    assign _2258 = _1594 ? _2257 : _2255;
    assign _2259 = _1350 ? _2255 : _2258;
    assign _2260 = _1305 ? _2259 : _2255;
    assign _2262 = _1204 ? _1109 : _2260;
    assign _107 = _2262;
    always @(posedge _248) begin
        if (_246)
            _2255 <= _1109;
        else
            _2255 <= _107;
    end
    assign _2256 = _2255[14:0];
    assign _2257 = { _2256,
                     _1341 };
    assign _2263 = _2257 ^ _106;
    assign _2264 = _2263 & _104;
    assign _2266 = _2264 == _1109;
    assign _2268 = _2266 ? _1527 : _598;
    assign _2269 = _1594 ? _2268 : _598;
    assign _2270 = _1350 ? _598 : _2269;
    assign _2271 = _1305 ? _2270 : _598;
    assign _2273 = _1204 ? _1000 : _2271;
    assign _2275 = _1202 ? _1000 : _2273;
    assign _108 = _2275;
    always @(posedge _248) begin
        if (_246)
            _598 <= _1000;
        else
            _598 <= _108;
    end
    assign _2288 = _1341 == _2287;
    assign _2289 = ~ _2288;
    assign _2291 = _2282 ? _2290 : _2278;
    assign _2292 = _1594 ? _2291 : _2278;
    assign _2293 = _1350 ? _2278 : _2292;
    assign _2294 = _1305 ? _2293 : _2278;
    assign _2296 = _1204 ? _1000 : _2294;
    assign _109 = _2296;
    always @(posedge _248) begin
        if (_246)
            _2278 <= _1000;
        else
            _2278 <= _109;
    end
    assign _2290 = _2278 | _2289;
    assign _2299 = ~ _2290;
    assign _2298 = _1623 == _2232;
    assign _2300 = _2298 ? _2299 : _595;
    assign _2301 = _2282 ? _2300 : _595;
    assign _2302 = _1594 ? _2301 : _595;
    assign _2303 = _1350 ? _595 : _2302;
    assign _2304 = _1305 ? _2303 : _595;
    assign _2306 = _1204 ? _1000 : _2304;
    assign _2308 = _1202 ? _1000 : _2306;
    assign _110 = _2308;
    always @(posedge _248) begin
        if (_246)
            _595 <= _1000;
        else
            _595 <= _110;
    end
    assign _112 = host_match_addr;
    assign _586 = _112[6:0];
    assign _585 = _575[7:1];
    assign _587 = _585 == _586;
    assign _582 = 16'b1010110011100001;
    assign _2313 = _583[10:10];
    assign _2312 = _583[12:12];
    assign _2314 = _2312 ^ _2313;
    assign _2311 = _583[13:13];
    assign _2315 = _2311 ^ _2314;
    assign _2310 = _583[15:15];
    assign _2316 = _2310 ^ _2315;
    assign _2309 = _583[14:0];
    assign _2317 = { _2309,
                     _2316 };
    assign _113 = _2317;
    always @(posedge _248) begin
        if (_246)
            _583 <= _582;
        else
            _583 <= _113;
    end
    assign _584 = _583[0:0];
    assign _2336 = _119 + _1831;
    assign _2334 = _119 - _1831;
    assign _2337 = _1894 ? _2336 : _2334;
    assign _1734 = _119 == _1736;
    assign _1943 = ~ _1734;
    assign _115 = host_rx_pop;
    assign _1944 = _115 & _1943;
    assign _1893 = ~ _580;
    assign _1926 = _1650 & _1664;
    assign _2321 = _1926 ? _1650 : _1000;
    assign _1920 = ~ _1650;
    assign _1921 = _1920 & _1664;
    assign _2319 = _1921 ? _1527 : _1650;
    assign _1663 = _1661 == _1722;
    assign _1664 = _1654 & _1663;
    assign _1670 = _1650 | _1664;
    assign _1667 = _1543 | _1592;
    assign _1668 = ~ _1667;
    assign _1666 = ~ _1642;
    assign _1669 = _1666 & _1668;
    assign _1671 = _1669 & _1670;
    assign _2322 = _1671 ? _2321 : _2319;
    assign _116 = _2322;
    always @(posedge _248) begin
        if (_246)
            _1650 <= _1000;
        else
            _1650 <= _116;
    end
    assign _2330 = _1650 | _1664;
    assign _1917 = _1543 & _1592;
    assign _2326 = _1917 ? _1543 : _1000;
    assign _1901 = ~ _1543;
    assign _1902 = _1901 & _1592;
    assign _2324 = _1902 ? _1527 : _1543;
    assign _1590 = ~ _1556;
    assign _1584 = _1553 + _1351;
    assign _1579 = ~ _1492;
    assign _1578 = _1569 & _1577;
    assign _1580 = _1578 & _1579;
    assign _1581 = _1580 & _1549;
    assign _1582 = _1550 | _1581;
    assign _1585 = _1582 ? _1584 : _1553;
    assign _1587 = _1585 == _1008;
    assign _1588 = ~ _1587;
    assign _1559 = _1558 & _167;
    assign _1589 = _1559 & _1588;
    assign _1591 = _1589 & _1590;
    assign _1555 = _1553 == _1888;
    assign _1556 = _1550 & _1555;
    assign _1592 = _1556 | _1591;
    assign _1644 = _1543 | _1592;
    assign _1643 = ~ _1642;
    assign _1645 = _1643 & _1644;
    assign _2327 = _1645 ? _2326 : _2324;
    assign _117 = _2327;
    always @(posedge _248) begin
        if (_246)
            _1543 <= _1000;
        else
            _1543 <= _117;
    end
    assign _2328 = _1543 | _1592;
    assign _1640 = ~ _1606;
    assign _1634 = _1603 + _1351;
    assign _1629 = ~ _1335;
    assign _1628 = _1619 & _1627;
    assign _1630 = _1628 & _1629;
    assign _1631 = _1630 & _1599;
    assign _1632 = _1600 | _1631;
    assign _1635 = _1632 ? _1634 : _1603;
    assign _1637 = _1635 == _1008;
    assign _1638 = ~ _1637;
    assign _1609 = _1608 & _219;
    assign _1639 = _1609 & _1638;
    assign _1641 = _1639 & _1640;
    assign _1605 = _1603 == _1888;
    assign _1606 = _1600 & _1605;
    assign _1642 = _1606 | _1641;
    assign _2329 = _1642 | _2328;
    assign _2331 = _2329 | _2330;
    assign _118 = _2331;
    assign _1894 = _118 & _1893;
    assign _2332 = _1894 ^ _1944;
    assign _2338 = _2332 ? _2337 : _119;
    always @(posedge _248) begin
        if (_246)
            _2341 <= _1736;
        else
            _2341 <= _2338;
    end
    assign _119 = _2341;
    assign _580 = _119 == _1531;
    assign _2358 = _575[6:0];
    assign _2359 = { _2358,
                     _2355 };
    assign _2356 = _575[7:1];
    assign _2354 = _289[7:7];
    assign _2353 = _289[6:6];
    assign _2352 = _289[5:5];
    assign _2351 = _289[4:4];
    assign _2350 = _289[3:3];
    assign _2349 = _289[2:2];
    assign _2348 = _289[1:1];
    assign _2347 = _289[0:0];
    assign _2345 = _989[102:100];
    assign _2344 = _801[102:100];
    assign _2343 = _665[102:100];
    assign _2342 = _282[102:100];
    always @* begin
        case (f_winner)
        0:
            _2346 <= _2342;
        1:
            _2346 <= _2343;
        2:
            _2346 <= _2344;
        default:
            _2346 <= _2345;
        endcase
    end
    always @* begin
        case (_2346)
        0:
            _2355 <= _2347;
        1:
            _2355 <= _2348;
        2:
            _2355 <= _2349;
        3:
            _2355 <= _2350;
        4:
            _2355 <= _2351;
        5:
            _2355 <= _2352;
        6:
            _2355 <= _2353;
        default:
            _2355 <= _2354;
        endcase
    end
    assign _2357 = { _2355,
                     _2356 };
    assign _1658 = _989[97:96];
    assign _1657 = _801[97:96];
    assign _1656 = _665[97:96];
    assign _1655 = _282[97:96];
    always @* begin
        case (f_winner)
        0:
            _1659 <= _1655;
        1:
            _1659 <= _1656;
        2:
            _1659 <= _1657;
        default:
            _1659 <= _1658;
        endcase
    end
    assign _1661 = _1653 ? _2005 : _1659;
    always @* begin
        case (_1661)
        0:
            _2360 <= _575;
        1:
            _2360 <= _2357;
        2:
            _2360 <= _2359;
        default:
            _2360 <= _575;
        endcase
    end
    assign _2361 = _1654 ? _2360 : _575;
    assign _120 = _2361;
    always @(posedge _248) begin
        if (_246)
            _575 <= _1154;
        else
            _575 <= _120;
    end
    assign _576 = _575[0:0];
    assign _3131 = _571[7:1];
    assign _3132 = { vdd,
                     _3131 };
    assign _3129 = _3121[7:7];
    assign _3128 = _3121[6:6];
    assign _3127 = _3121[5:5];
    assign _3126 = _3121[4:4];
    assign _3125 = _3121[3:3];
    assign _3124 = _3121[2:2];
    assign _3123 = _3121[1:1];
    assign _3122 = _3121[0:0];
    assign _3130 = { _3122,
                     _3123,
                     _3124,
                     _3125,
                     _3126,
                     _3127,
                     _3128,
                     _3129 };
    assign _3114 = _225 + _1831;
    assign _3112 = _225 - _1831;
    assign _3115 = _2376 ? _3114 : _3112;
    assign _2785 = ~ _578;
    assign _3106 = ~ _578;
    assign _1560 = ~ _167;
    assign _2740 = ~ _165;
    assign _2741 = _167 & _2740;
    assign _2744 = _2741 ? _1145 : _1146;
    assign _2733 = ~ _1577;
    assign _2734 = _1569 & _2733;
    assign _2735 = _606 | _2734;
    assign _2736 = _2735 | _2725;
    assign _2738 = _2736 ? _1146 : _2732;
    assign _2719 = _1490 + _1351;
    assign _2716 = _1490 + _1351;
    assign _2712 = vdd == _1502;
    assign _2710 = _1490 == _1008;
    assign _2711 = ~ _2710;
    assign _2713 = _2711 & _2712;
    assign _2717 = _2713 ? _2716 : _1351;
    assign _2708 = _145 == _1146;
    assign _2720 = _2708 ? _2719 : _2717;
    assign _2721 = _2720 == _123;
    assign _2702 = _1490 + _1351;
    assign _2698 = gnd == _1502;
    assign _2696 = _1490 == _1008;
    assign _2697 = ~ _2696;
    assign _2699 = _2697 & _2698;
    assign _2703 = _2699 ? _2702 : _1351;
    assign _2694 = _145 == _1146;
    assign _2705 = _2694 ? _1008 : _2703;
    assign _2706 = _2705 == _123;
    assign _2722 = _1498 ? _2721 : _2706;
    assign _2723 = _1487 & _2722;
    assign _2724 = ~ _2723;
    assign _2690 = _1573 == _2232;
    assign _2688 = _1573 == _1128;
    assign _2691 = _2217 ? _2690 : _2688;
    assign _2683 = _1548 + _3379;
    assign _2684 = _2683 == _139;
    assign _2681 = _1548 == _139;
    assign _2685 = _1550 ? _2684 : _2681;
    assign _2679 = ~ _1507;
    assign _2680 = _1462 & _2679;
    assign _2686 = _2680 & _2685;
    assign _2692 = _2686 & _2691;
    assign _2725 = _2692 & _2724;
    assign _2727 = _2725 ? _1722 : _2678;
    assign _2729 = _1507 ? _2005 : _2727;
    assign _2675 = _1577 ? _2673 : _1722;
    assign _2671 = _1388 & _1386;
    assign _2673 = _2671 ? _1146 : _604;
    assign _2676 = _1569 ? _2675 : _2673;
    assign _2451 = _1577 ? _2450 : _2364;
    assign _2452 = _1569 ? _2451 : _2364;
    assign _121 = _2452;
    always @(posedge _248) begin
        if (_246)
            _2364 <= _1000;
        else
            _2364 <= _121;
    end
    assign _2601 = ~ _2450;
    assign _2599 = ~ _1474;
    assign _2600 = _2450 ? _1474 : _2599;
    always @* begin
        case (_161)
        0:
            _2602 <= _2450;
        1:
            _2602 <= _2600;
        2:
            _2602 <= _2601;
        default:
            _2602 <= _2450;
        endcase
    end
    assign _123 = host_lane1_stuff_len;
    assign _2583 = _1490 + _1351;
    assign _2584 = _1498 ? _2583 : _1008;
    assign _2579 = _1490 + _1351;
    assign _2575 = _1498 == _1502;
    assign _2573 = _1490 == _1008;
    assign _2574 = ~ _2573;
    assign _2576 = _2574 & _2575;
    assign _2580 = _2576 ? _2579 : _1351;
    assign _2571 = _145 == _1146;
    assign _2585 = _2571 ? _2584 : _2580;
    assign _2586 = _1507 ? _2569 : _2585;
    assign _2565 = _1490 + _1351;
    assign _2566 = _2450 ? _2565 : _1008;
    assign _2561 = _1490 + _1351;
    assign _2447 = _2439[7:7];
    assign _2446 = _2439[6:6];
    assign _2445 = _2439[5:5];
    assign _2444 = _2439[4:4];
    assign _2443 = _2439[3:3];
    assign _2442 = _2439[2:2];
    assign _2441 = _2439[1:1];
    assign _2437 = _2429[7:7];
    assign _2436 = _2429[6:6];
    assign _2435 = _2429[5:5];
    assign _2434 = _2429[4:4];
    assign _2433 = _2429[3:3];
    assign _2432 = _2429[2:2];
    assign _2431 = _2429[1:1];
    assign _2428 = _578 ? _1152 : _2426;
    assign _1911 = _1908[7:1];
    assign _1912 = { _1498,
                     _1911 };
    assign _1909 = _1908[6:0];
    assign _1910 = { _1909,
                     _1498 };
    assign _1913 = _126 ? _1912 : _1910;
    assign _2457 = _1550 ? _1913 : _2456;
    assign _2458 = _1544 ? _2457 : _2456;
    assign _2459 = _1507 ? _2456 : _2458;
    assign _2453 = _1549 ? _2429 : _1908;
    assign _2454 = _1492 ? _1908 : _2453;
    assign _2455 = _1577 ? _2454 : _1908;
    assign _2456 = _1569 ? _2455 : _1908;
    assign _2460 = _1462 ? _2459 : _2456;
    assign _124 = _2460;
    always @(posedge _248) begin
        if (_246)
            _1908 <= _1154;
        else
            _1908 <= _124;
    end
    assign _2368 = _1553 == _1008;
    assign _2365 = ~ _1492;
    assign _2366 = _2365 & _1549;
    assign _2369 = _2366 & _2368;
    assign _2429 = _2369 ? _2428 : _1908;
    assign _2430 = _2429[0:0];
    assign _2438 = { _2430,
                     _2431,
                     _2432,
                     _2433,
                     _2434,
                     _2435,
                     _2436,
                     _2437 };
    assign _126 = host_lane1_lsb_first;
    assign _2439 = _126 ? _2429 : _2438;
    assign _2440 = _2439[0:0];
    assign _2468 = _1553 + _1351;
    assign _2469 = _1550 ? _2468 : _2466;
    assign _2470 = _1544 ? _2469 : _2466;
    assign _2471 = _1507 ? _2466 : _2470;
    assign _2462 = _1553 + _1351;
    assign _2463 = _1549 ? _2462 : _1553;
    assign _2464 = _1492 ? _1553 : _2463;
    assign _2465 = _1577 ? _2464 : _1553;
    assign _2466 = _1569 ? _2465 : _1553;
    assign _2472 = _1462 ? _2471 : _2466;
    assign _2474 = _1361 ? _1008 : _2472;
    assign _127 = _2474;
    always @(posedge _248) begin
        if (_246)
            _1553 <= _1008;
        else
            _1553 <= _127;
    end
    always @* begin
        case (_1553)
        0:
            _2448 <= _2440;
        1:
            _2448 <= _2441;
        2:
            _2448 <= _2442;
        3:
            _2448 <= _2443;
        4:
            _2448 <= _2444;
        5:
            _2448 <= _2445;
        6:
            _2448 <= _2446;
        default:
            _2448 <= _2447;
        endcase
    end
    assign _129 = host_lane1_crc_inv;
    assign _131 = host_lane1_init;
    assign _2516 = _2220[30:0];
    assign _2518 = { _2516,
                     _1000 };
    assign _2510 = _2220[31:31];
    assign _2511 = _1498 ^ _2510;
    assign _2513 = _2511 ? _136 : _1751;
    assign _2507 = _2220[30:0];
    assign _2509 = { _2507,
                     _1000 };
    assign _2514 = _2509 ^ _2513;
    assign _2515 = _1550 ? _2514 : _2506;
    assign _133 = host_lane1_crc_width;
    assign _2484 = _1573 - _2232;
    assign _2485 = _2217 ? _2484 : _2482;
    assign _2486 = _1544 ? _2485 : _2482;
    assign _2487 = _1507 ? _2482 : _2486;
    assign _2478 = _1573 - _2232;
    assign _2479 = _1549 ? _1573 : _2478;
    assign _2480 = _1492 ? _1573 : _2479;
    assign _2481 = _1577 ? _2480 : _1573;
    assign _2482 = _1569 ? _2481 : _1573;
    assign _2488 = _1462 ? _2487 : _2482;
    assign _2489 = _2476 ? _133 : _2488;
    assign _2491 = _1361 ? _1128 : _2489;
    assign _134 = _2491;
    always @(posedge _248) begin
        if (_246)
            _1573 <= _1128;
        else
            _1573 <= _134;
    end
    assign _1575 = _1573 == _1128;
    assign _1576 = ~ _1575;
    assign _2215 = ~ _1549;
    assign _2214 = _1462 & _1544;
    assign _2216 = _2214 & _2215;
    assign _2217 = _2216 & _1576;
    assign _2519 = _2217 ? _2518 : _2515;
    assign _2520 = _1544 ? _2519 : _2506;
    assign _2521 = _1507 ? _2506 : _2520;
    assign _136 = host_lane1_poly;
    assign _2498 = _2220[31:31];
    assign _2499 = _2450 ^ _2498;
    assign _2501 = _2499 ? _136 : _1751;
    assign _2495 = _2220[30:0];
    assign _2497 = { _2495,
                     _1000 };
    assign _2502 = _2497 ^ _2501;
    assign _2492 = _2220[30:0];
    assign _2494 = { _2492,
                     _1000 };
    assign _2503 = _1549 ? _2502 : _2494;
    assign _2504 = _1492 ? _2220 : _2503;
    assign _2505 = _1577 ? _2504 : _2220;
    assign _2506 = _1569 ? _2505 : _2220;
    assign _2522 = _1462 ? _2521 : _2506;
    assign _2523 = _1361 ? _131 : _2522;
    assign _2525 = _1359 ? _1751 : _2523;
    assign _137 = _2525;
    always @(posedge _248) begin
        if (_246)
            _2220 <= _1751;
        else
            _2220 <= _137;
    end
    assign _2221 = _2220[31:31];
    assign _2222 = _2221 ^ _129;
    assign _139 = host_lane1_frame_bits;
    assign _2545 = _1548 + _3379;
    assign _1545 = _1462 & _1544;
    assign _1550 = _1545 & _1549;
    assign _2546 = _1550 ? _2545 : _2543;
    assign _1544 = ~ _1492;
    assign _2547 = _1544 ? _2546 : _2543;
    assign _2528 = _1507 ? _2527 : _1498;
    assign _2526 = _1577 ? _2450 : _1502;
    assign _2527 = _1569 ? _2526 : _1502;
    assign _2529 = _1462 ? _2528 : _2527;
    assign _2531 = _1361 ? _1527 : _2529;
    assign _140 = _2531;
    always @(posedge _248) begin
        if (_246)
            _1502 <= vdd;
        else
            _1502 <= _140;
    end
    assign _1503 = ~ _1502;
    assign _1500 = _145 == _1145;
    assign _1504 = _1500 ? _1503 : gnd;
    assign _2533 = _161 == _1145;
    assign _2534 = _2533 ? _1373 : _1496;
    assign _2535 = _1462 ? _2534 : _1496;
    assign _2537 = _1361 ? _1527 : _2535;
    assign _141 = _2537;
    always @(posedge _248) begin
        if (_246)
            _1496 <= vdd;
        else
            _1496 <= _141;
    end
    assign _1497 = _1373 == _1496;
    assign _1494 = _161 == _1145;
    assign _1498 = _1494 ? _1497 : _1373;
    assign _1505 = _1498 == _1504;
    assign _1506 = ~ _1505;
    assign _1507 = _1492 & _1506;
    assign _2548 = _1507 ? _2543 : _2547;
    assign _2539 = _1548 + _3379;
    assign _2540 = _1549 ? _2539 : _1548;
    assign _2541 = _1492 ? _1548 : _2540;
    assign _2542 = _1577 ? _2541 : _1548;
    assign _2543 = _1569 ? _2542 : _1548;
    assign _2549 = _1462 ? _2548 : _2543;
    assign _2551 = _1361 ? _1109 : _2549;
    assign _142 = _2551;
    always @(posedge _248) begin
        if (_246)
            _1548 <= _1109;
        else
            _1548 <= _142;
    end
    assign _1549 = _1548 < _139;
    assign _2449 = _1549 ? _2448 : _2222;
    assign _2450 = _1492 ? _1504 : _2449;
    assign _2557 = _2450 == _1502;
    assign _2555 = _1490 == _1008;
    assign _2556 = ~ _2555;
    assign _2558 = _2556 & _2557;
    assign _2562 = _2558 ? _2561 : _1351;
    assign _2553 = _145 == _1146;
    assign _2567 = _2553 ? _2566 : _2562;
    assign _2568 = _1577 ? _2567 : _1490;
    assign _2569 = _1569 ? _2568 : _1490;
    assign _2587 = _1462 ? _2586 : _2569;
    assign _2589 = _1361 ? _1008 : _2587;
    assign _143 = _2589;
    always @(posedge _248) begin
        if (_246)
            _1490 <= _1008;
        else
            _1490 <= _143;
    end
    assign _1491 = _1490 == _123;
    assign _145 = host_lane1_stuff;
    assign _1486 = _145 == _2005;
    assign _1487 = ~ _1486;
    assign _1492 = _1487 & _1491;
    assign _1570 = _1492 | _1549;
    assign _1577 = _1570 | _1576;
    assign _2603 = _1577 ? _2602 : _1527;
    assign _2604 = _1569 ? _2603 : _1474;
    assign _1565 = _1432 == _1109;
    assign _1563 = _1397 == _1109;
    assign _1566 = _1425 ? _1565 : _1563;
    assign _1567 = _1393 ? vdd : _1566;
    assign _1568 = _165 ? _1460 : _1567;
    assign _2596 = ~ _1568;
    assign _2593 = _161 == _1146;
    assign _2590 = ~ _167;
    assign _2591 = _1363 & _2590;
    assign _2594 = _2591 & _2593;
    assign _2595 = _2594 & _1461;
    assign _2597 = _2595 & _2596;
    assign _2605 = _2597 ? _2364 : _2604;
    assign _2607 = _1477 ? _1527 : _2605;
    assign _2609 = _1558 ? _1527 : _2607;
    assign _2611 = _1361 ? _1527 : _2609;
    assign _2613 = _1359 ? _1527 : _2611;
    assign _146 = _2613;
    always @(posedge _248) begin
        if (_246)
            _1474 <= vdd;
        else
            _1474 <= _146;
    end
    assign _1475 = _1373 == _1474;
    assign _1476 = ~ _1475;
    assign _1469 = _161 == _1146;
    assign _1470 = ~ _1469;
    assign _1466 = ~ _165;
    assign _148 = host_lane1_readback;
    assign _1463 = ~ _167;
    assign _1464 = _1363 & _1463;
    assign _1465 = _1464 & _148;
    assign _1467 = _1465 & _1466;
    assign _1471 = _1467 & _1470;
    assign _1472 = _1471 & _1461;
    assign _1477 = _1472 & _1476;
    assign _2678 = _1477 ? _2005 : _2676;
    assign _1458 = ~ _1446;
    assign _1459 = _1455 & _1458;
    assign _1454 = _305[7:7];
    assign _1453 = _305[6:6];
    assign _1452 = _305[5:5];
    assign _1451 = _305[4:4];
    assign _1450 = _305[3:3];
    assign _1449 = _305[2:2];
    assign _1448 = _305[1:1];
    assign _1447 = _305[0:0];
    always @* begin
        case (_150)
        0:
            _1455 <= _1447;
        1:
            _1455 <= _1448;
        2:
            _1455 <= _1449;
        3:
            _1455 <= _1450;
        4:
            _1455 <= _1451;
        5:
            _1455 <= _1452;
        6:
            _1455 <= _1453;
        default:
            _1455 <= _1454;
        endcase
    end
    assign _1456 = ~ _1455;
    assign _1445 = _289[7:7];
    assign _1444 = _289[6:6];
    assign _1443 = _289[5:5];
    assign _1442 = _289[4:4];
    assign _1441 = _289[3:3];
    assign _1440 = _289[2:2];
    assign _1439 = _289[1:1];
    assign _1438 = _289[0:0];
    assign _150 = host_lane1_clk_pin;
    always @* begin
        case (_150)
        0:
            _1446 <= _1438;
        1:
            _1446 <= _1439;
        2:
            _1446 <= _1440;
        3:
            _1446 <= _1441;
        4:
            _1446 <= _1442;
        5:
            _1446 <= _1443;
        6:
            _1446 <= _1444;
        default:
            _1446 <= _1445;
        endcase
    end
    assign _1457 = _1446 & _1456;
    assign _152 = host_lane1_clk_edge;
    assign _1460 = _152 ? _1459 : _1457;
    assign _1436 = _1421 == _1109;
    assign _1433 = _1432 == _1421;
    assign _1426 = _1397 == _1421;
    assign _1424 = ~ _1388;
    assign _1415 = _154[15:2];
    assign _1416 = { _2005,
                     _1415 };
    assign _1412 = _154[15:1];
    assign _1413 = { _1000,
                     _1412 };
    assign _1417 = _1413 + _1416;
    assign _1409 = _154[15:1];
    assign _1410 = { _1000,
                     _1409 };
    assign _1407 = _167 & _1390;
    assign _1418 = _1407 ? _1417 : _1410;
    always @(posedge _248) begin
        if (_246)
            _1421 <= _1109;
        else
            _1421 <= _1418;
    end
    assign _1422 = _1397 < _1421;
    assign _1399 = _154[15:2];
    assign _1400 = { _2005,
                     _1399 };
    always @(posedge _248) begin
        if (_246)
            _1403 <= _1109;
        else
            _1403 <= _1400;
    end
    assign _2659 = ~ _1388;
    assign _2660 = _1423 & _2659;
    assign _2661 = _2660 ? _1432 : _1397;
    assign _2663 = _1393 ? _1109 : _2661;
    assign _2665 = _2663 + _3379;
    assign _2643 = _2637 == _1069;
    assign _1428 = _154[15:1];
    assign _1429 = { _1000,
                     _1428 };
    always @(posedge _248) begin
        if (_246)
            _1432 <= _1109;
        else
            _1432 <= _1429;
    end
    assign _2639 = { gnd,
                     _1432 };
    assign _2640 = _2639 == _2637;
    assign _2633 = { gnd,
                     _154 };
    always @(posedge _248) begin
        if (_246)
            _2636 <= _1069;
        else
            _2636 <= _2633;
    end
    assign _2628 = 17'b00000000000000001;
    assign _154 = host_lane1_div_int;
    assign _2627 = { gnd,
                     _154 };
    assign _2629 = _2627 - _2628;
    always @(posedge _248) begin
        if (_246)
            _2632 <= _1069;
        else
            _2632 <= _2629;
    end
    assign _156 = host_lane1_div_frac;
    assign _2647 = { gnd,
                     _156 };
    assign _2649 = _2648[7:0];
    assign _2650 = _2645 ? _2649 : _2621;
    assign _2651 = _2618 ? _2650 : _2621;
    assign _2653 = _1361 ? _1154 : _2651;
    assign _157 = _2653;
    always @(posedge _248) begin
        if (_246)
            _2621 <= _1154;
        else
            _2621 <= _157;
    end
    assign _2646 = { gnd,
                     _2621 };
    assign _2648 = _2646 + _2647;
    assign _2654 = _2648[8:8];
    assign _2655 = _2645 ? _2654 : _2626;
    assign _2656 = _2618 ? _2655 : _2626;
    assign _2658 = _1361 ? _1000 : _2656;
    assign _158 = _2658;
    always @(posedge _248) begin
        if (_246)
            _2626 <= _1000;
        else
            _2626 <= _158;
    end
    assign _2637 = _2626 ? _2636 : _2632;
    assign _2623 = { gnd,
                     _1397 };
    assign _2638 = _2623 == _2637;
    assign _2641 = _1425 ? _2640 : _2638;
    assign _2644 = _1393 ? _2643 : _2641;
    assign _2622 = ~ _165;
    assign _2645 = _2622 & _2644;
    assign _2667 = _2645 ? _1109 : _2665;
    assign _2617 = ~ _165;
    assign _2615 = _1388 & _1386;
    assign _606 = _604 == _1722;
    assign _2614 = _1363 | _606;
    assign _2616 = _2614 | _2615;
    assign _2618 = _2616 & _2617;
    assign _2668 = _2618 ? _2667 : _1397;
    assign _2670 = _1361 ? _1109 : _2668;
    assign _159 = _2670;
    always @(posedge _248) begin
        if (_246)
            _1397 <= _1109;
        else
            _1397 <= _159;
    end
    assign _1404 = _1397 < _1403;
    assign _1405 = ~ _1404;
    assign _1394 = _1386 & _1390;
    assign _1406 = _1394 & _1405;
    assign _1423 = _1406 & _1422;
    assign _1425 = _1423 & _1424;
    assign _1434 = _1425 ? _1433 : _1426;
    assign _161 = host_lane1_code;
    assign _1390 = _161 == _1146;
    assign _1391 = ~ _1390;
    assign _1388 = _604 == _1145;
    assign _1392 = _1388 | _1391;
    assign _1385 = ~ _165;
    assign _1381 = _305[7:7];
    assign _1380 = _305[6:6];
    assign _1379 = _305[5:5];
    assign _1378 = _305[4:4];
    assign _1377 = _305[3:3];
    assign _1376 = _305[2:2];
    assign _1375 = _305[1:1];
    assign _1374 = _305[0:0];
    always @* begin
        case (_163)
        0:
            _1382 <= _1374;
        1:
            _1382 <= _1375;
        2:
            _1382 <= _1376;
        3:
            _1382 <= _1377;
        4:
            _1382 <= _1378;
        5:
            _1382 <= _1379;
        6:
            _1382 <= _1380;
        default:
            _1382 <= _1381;
        endcase
    end
    assign _1372 = _289[7:7];
    assign _1371 = _289[6:6];
    assign _1370 = _289[5:5];
    assign _1369 = _289[4:4];
    assign _1368 = _289[3:3];
    assign _1367 = _289[2:2];
    assign _1366 = _289[1:1];
    assign _1365 = _289[0:0];
    assign _163 = host_lane1_data_pin;
    always @* begin
        case (_163)
        0:
            _1373 <= _1365;
        1:
            _1373 <= _1366;
        2:
            _1373 <= _1367;
        3:
            _1373 <= _1368;
        4:
            _1373 <= _1369;
        5:
            _1373 <= _1370;
        6:
            _1373 <= _1371;
        default:
            _1373 <= _1372;
        endcase
    end
    assign _1383 = _1373 ^ _1382;
    assign _1384 = _167 & _1383;
    assign _1386 = _1384 & _1385;
    assign _1393 = _1386 & _1392;
    assign _1437 = _1393 ? _1436 : _1434;
    assign _165 = host_lane1_clk_pin_en;
    assign _1461 = _165 ? _1460 : _1437;
    assign _167 = host_lane1_dir;
    assign _1364 = _1363 & _167;
    assign _1462 = _1364 & _1461;
    assign _2730 = _1462 ? _2729 : _2678;
    assign _1558 = _220 == _1882;
    assign _2732 = _1558 ? _2005 : _2730;
    assign _2476 = _220 == _1888;
    assign _2739 = _2476 ? _2738 : _2732;
    assign _1361 = _220 == _1876;
    assign _2745 = _1361 ? _2744 : _2739;
    assign _1359 = _220 == _1195;
    assign _2747 = _1359 ? _2005 : _2745;
    assign _168 = _2747;
    always @(posedge _248) begin
        if (_246)
            _604 <= _2005;
        else
            _604 <= _168;
    end
    assign _1363 = _604 == _1146;
    assign _1561 = _1363 & _1560;
    assign _1569 = _1561 & _1568;
    assign _3105 = _1569 & _2369;
    assign _3107 = _3105 & _3106;
    assign _3103 = ~ _578;
    assign _1610 = ~ _219;
    assign _3081 = ~ _217;
    assign _3082 = _219 & _3081;
    assign _3085 = _3082 ? _1145 : _1146;
    assign _3074 = ~ _1627;
    assign _3075 = _1619 & _3074;
    assign _3076 = _592 | _3075;
    assign _3077 = _3076 | _3066;
    assign _3079 = _3077 ? _1146 : _3073;
    assign _3060 = _1333 + _1351;
    assign _3057 = _1333 + _1351;
    assign _3053 = vdd == _1345;
    assign _3051 = _1333 == _1008;
    assign _3052 = ~ _3051;
    assign _3054 = _3052 & _3053;
    assign _3058 = _3054 ? _3057 : _1351;
    assign _3049 = _197 == _1146;
    assign _3061 = _3049 ? _3060 : _3058;
    assign _3062 = _3061 == _171;
    assign _3043 = _1333 + _1351;
    assign _3039 = gnd == _1345;
    assign _3037 = _1333 == _1008;
    assign _3038 = ~ _3037;
    assign _3040 = _3038 & _3039;
    assign _3044 = _3040 ? _3043 : _1351;
    assign _3035 = _197 == _1146;
    assign _3046 = _3035 ? _1008 : _3044;
    assign _3047 = _3046 == _171;
    assign _3063 = _1341 ? _3062 : _3047;
    assign _3064 = _1330 & _3063;
    assign _3065 = ~ _3064;
    assign _3031 = _1623 == _2232;
    assign _3029 = _1623 == _1128;
    assign _3032 = _2282 ? _3031 : _3029;
    assign _3024 = _1598 + _3379;
    assign _3025 = _3024 == _191;
    assign _3022 = _1598 == _191;
    assign _3026 = _1600 ? _3025 : _3022;
    assign _3020 = ~ _1350;
    assign _3021 = _1305 & _3020;
    assign _3027 = _3021 & _3026;
    assign _3033 = _3027 & _3032;
    assign _3066 = _3033 & _3065;
    assign _3068 = _3066 ? _1722 : _3019;
    assign _3070 = _1350 ? _2005 : _3068;
    assign _3016 = _1627 ? _3014 : _1722;
    assign _3012 = _1231 & _1229;
    assign _3014 = _3012 ? _1146 : _590;
    assign _3017 = _1619 ? _3016 : _3014;
    assign _2780 = _1627 ? _2779 : _2750;
    assign _2781 = _1619 ? _2780 : _2750;
    assign _169 = _2781;
    always @(posedge _248) begin
        if (_246)
            _2750 <= _1000;
        else
            _2750 <= _169;
    end
    assign _2938 = ~ _2779;
    assign _2936 = ~ _1317;
    assign _2937 = _2779 ? _1317 : _2936;
    always @* begin
        case (_213)
        0:
            _2939 <= _2779;
        1:
            _2939 <= _2937;
        2:
            _2939 <= _2938;
        default:
            _2939 <= _2779;
        endcase
    end
    assign _171 = host_lane0_stuff_len;
    assign _2920 = _1333 + _1351;
    assign _2921 = _1341 ? _2920 : _1008;
    assign _2916 = _1333 + _1351;
    assign _2912 = _1341 == _1345;
    assign _2910 = _1333 == _1008;
    assign _2911 = ~ _2910;
    assign _2913 = _2911 & _2912;
    assign _2917 = _2913 ? _2916 : _1351;
    assign _2908 = _197 == _1146;
    assign _2922 = _2908 ? _2921 : _2917;
    assign _2923 = _1350 ? _2906 : _2922;
    assign _2902 = _1333 + _1351;
    assign _2903 = _2779 ? _2902 : _1008;
    assign _2898 = _1333 + _1351;
    assign _2776 = _2768[7:7];
    assign _2775 = _2768[6:6];
    assign _2774 = _2768[5:5];
    assign _2773 = _2768[4:4];
    assign _2772 = _2768[3:3];
    assign _2771 = _2768[2:2];
    assign _2770 = _2768[1:1];
    assign _2766 = _2758[7:7];
    assign _2765 = _2758[6:6];
    assign _2764 = _2758[5:5];
    assign _2763 = _2758[4:4];
    assign _2762 = _2758[3:3];
    assign _2761 = _2758[2:2];
    assign _2760 = _2758[1:1];
    assign _2423 = _2379 == _1888;
    assign _2424 = _2376 & _2423;
    always @(posedge _248) begin
        if (_246)
            _2425 <= _1154;
        else
            if (_2424)
                _2425 <= _174;
    end
    assign _2417 = _2379 == _1882;
    assign _2418 = _2376 & _2417;
    always @(posedge _248) begin
        if (_246)
            _2419 <= _1154;
        else
            if (_2418)
                _2419 <= _174;
    end
    assign _2411 = _2379 == _1876;
    assign _2412 = _2376 & _2411;
    always @(posedge _248) begin
        if (_246)
            _2413 <= _1154;
        else
            if (_2412)
                _2413 <= _174;
    end
    assign _2405 = _2379 == _1195;
    assign _2406 = _2376 & _2405;
    always @(posedge _248) begin
        if (_246)
            _2407 <= _1154;
        else
            if (_2406)
                _2407 <= _174;
    end
    assign _2399 = _2379 == _1864;
    assign _2400 = _2376 & _2399;
    always @(posedge _248) begin
        if (_246)
            _2401 <= _1154;
        else
            if (_2400)
                _2401 <= _174;
    end
    assign _2393 = _2379 == _1324;
    assign _2394 = _2376 & _2393;
    always @(posedge _248) begin
        if (_246)
            _2395 <= _1154;
        else
            if (_2394)
                _2395 <= _174;
    end
    assign _2387 = _2379 == _1351;
    assign _2388 = _2376 & _2387;
    always @(posedge _248) begin
        if (_246)
            _2389 <= _1154;
        else
            if (_2388)
                _2389 <= _174;
    end
    assign _2783 = _2379 + _1351;
    assign _2784 = _2376 ? _2783 : _2379;
    assign _172 = _2784;
    always @(posedge _248) begin
        if (_246)
            _2379 <= _1008;
        else
            _2379 <= _172;
    end
    assign _2381 = _2379 == _1008;
    assign _2382 = _2376 & _2381;
    assign _174 = host_tx_data;
    always @(posedge _248) begin
        if (_246)
            _2383 <= _1154;
        else
            if (_2382)
                _2383 <= _174;
    end
    assign _2788 = _2372 + _1351;
    assign _2789 = _2786 ? _2788 : _2372;
    assign _175 = _2789;
    always @(posedge _248) begin
        if (_246)
            _2372 <= _1008;
        else
            _2372 <= _175;
    end
    always @* begin
        case (_2372)
        0:
            _2426 <= _2383;
        1:
            _2426 <= _2389;
        2:
            _2426 <= _2395;
        3:
            _2426 <= _2401;
        4:
            _2426 <= _2407;
        5:
            _2426 <= _2413;
        6:
            _2426 <= _2419;
        default:
            _2426 <= _2425;
        endcase
    end
    assign _2757 = _578 ? _1152 : _2426;
    assign _1937 = _1934[7:1];
    assign _1938 = { _1341,
                     _1937 };
    assign _1935 = _1934[6:0];
    assign _1936 = { _1935,
                     _1341 };
    assign _1939 = _178 ? _1938 : _1936;
    assign _2794 = _1600 ? _1939 : _2793;
    assign _2795 = _1594 ? _2794 : _2793;
    assign _2796 = _1350 ? _2793 : _2795;
    assign _2790 = _1599 ? _2758 : _1934;
    assign _2791 = _1335 ? _1934 : _2790;
    assign _2792 = _1627 ? _2791 : _1934;
    assign _2793 = _1619 ? _2792 : _1934;
    assign _2797 = _1305 ? _2796 : _2793;
    assign _176 = _2797;
    always @(posedge _248) begin
        if (_246)
            _1934 <= _1154;
        else
            _1934 <= _176;
    end
    assign _2754 = _1603 == _1008;
    assign _2751 = ~ _1335;
    assign _2752 = _2751 & _1599;
    assign _2755 = _2752 & _2754;
    assign _2758 = _2755 ? _2757 : _1934;
    assign _2759 = _2758[0:0];
    assign _2767 = { _2759,
                     _2760,
                     _2761,
                     _2762,
                     _2763,
                     _2764,
                     _2765,
                     _2766 };
    assign _178 = host_lane0_lsb_first;
    assign _2768 = _178 ? _2758 : _2767;
    assign _2769 = _2768[0:0];
    assign _2805 = _1603 + _1351;
    assign _2806 = _1600 ? _2805 : _2803;
    assign _2807 = _1594 ? _2806 : _2803;
    assign _2808 = _1350 ? _2803 : _2807;
    assign _2799 = _1603 + _1351;
    assign _2800 = _1599 ? _2799 : _1603;
    assign _2801 = _1335 ? _1603 : _2800;
    assign _2802 = _1627 ? _2801 : _1603;
    assign _2803 = _1619 ? _2802 : _1603;
    assign _2809 = _1305 ? _2808 : _2803;
    assign _2811 = _1204 ? _1008 : _2809;
    assign _179 = _2811;
    always @(posedge _248) begin
        if (_246)
            _1603 <= _1008;
        else
            _1603 <= _179;
    end
    always @* begin
        case (_1603)
        0:
            _2777 <= _2769;
        1:
            _2777 <= _2770;
        2:
            _2777 <= _2771;
        3:
            _2777 <= _2772;
        4:
            _2777 <= _2773;
        5:
            _2777 <= _2774;
        6:
            _2777 <= _2775;
        default:
            _2777 <= _2776;
        endcase
    end
    assign _181 = host_lane0_crc_inv;
    assign _183 = host_lane0_init;
    assign _2853 = _2285[30:0];
    assign _2855 = { _2853,
                     _1000 };
    assign _2847 = _2285[31:31];
    assign _2848 = _1341 ^ _2847;
    assign _2850 = _2848 ? _188 : _1751;
    assign _2844 = _2285[30:0];
    assign _2846 = { _2844,
                     _1000 };
    assign _2851 = _2846 ^ _2850;
    assign _2852 = _1600 ? _2851 : _2843;
    assign _185 = host_lane0_crc_width;
    assign _2821 = _1623 - _2232;
    assign _2822 = _2282 ? _2821 : _2819;
    assign _2823 = _1594 ? _2822 : _2819;
    assign _2824 = _1350 ? _2819 : _2823;
    assign _2815 = _1623 - _2232;
    assign _2816 = _1599 ? _1623 : _2815;
    assign _2817 = _1335 ? _1623 : _2816;
    assign _2818 = _1627 ? _2817 : _1623;
    assign _2819 = _1619 ? _2818 : _1623;
    assign _2825 = _1305 ? _2824 : _2819;
    assign _2826 = _2813 ? _185 : _2825;
    assign _2828 = _1204 ? _1128 : _2826;
    assign _186 = _2828;
    always @(posedge _248) begin
        if (_246)
            _1623 <= _1128;
        else
            _1623 <= _186;
    end
    assign _1625 = _1623 == _1128;
    assign _1626 = ~ _1625;
    assign _2280 = ~ _1599;
    assign _2279 = _1305 & _1594;
    assign _2281 = _2279 & _2280;
    assign _2282 = _2281 & _1626;
    assign _2856 = _2282 ? _2855 : _2852;
    assign _2857 = _1594 ? _2856 : _2843;
    assign _2858 = _1350 ? _2843 : _2857;
    assign _188 = host_lane0_poly;
    assign _2835 = _2285[31:31];
    assign _2836 = _2779 ^ _2835;
    assign _2838 = _2836 ? _188 : _1751;
    assign _2832 = _2285[30:0];
    assign _2834 = { _2832,
                     _1000 };
    assign _2839 = _2834 ^ _2838;
    assign _2829 = _2285[30:0];
    assign _2831 = { _2829,
                     _1000 };
    assign _2840 = _1599 ? _2839 : _2831;
    assign _2841 = _1335 ? _2285 : _2840;
    assign _2842 = _1627 ? _2841 : _2285;
    assign _2843 = _1619 ? _2842 : _2285;
    assign _2859 = _1305 ? _2858 : _2843;
    assign _2860 = _1204 ? _183 : _2859;
    assign _2862 = _1202 ? _1751 : _2860;
    assign _189 = _2862;
    always @(posedge _248) begin
        if (_246)
            _2285 <= _1751;
        else
            _2285 <= _189;
    end
    assign _2286 = _2285[31:31];
    assign _2287 = _2286 ^ _181;
    assign _191 = host_lane0_frame_bits;
    assign _2882 = _1598 + _3379;
    assign _1595 = _1305 & _1594;
    assign _1600 = _1595 & _1599;
    assign _2883 = _1600 ? _2882 : _2880;
    assign _1594 = ~ _1335;
    assign _2884 = _1594 ? _2883 : _2880;
    assign _2865 = _1350 ? _2864 : _1341;
    assign _2863 = _1627 ? _2779 : _1345;
    assign _2864 = _1619 ? _2863 : _1345;
    assign _2866 = _1305 ? _2865 : _2864;
    assign _2868 = _1204 ? _1527 : _2866;
    assign _192 = _2868;
    always @(posedge _248) begin
        if (_246)
            _1345 <= vdd;
        else
            _1345 <= _192;
    end
    assign _1346 = ~ _1345;
    assign _1343 = _197 == _1145;
    assign _1347 = _1343 ? _1346 : gnd;
    assign _2870 = _213 == _1145;
    assign _2871 = _2870 ? _1216 : _1339;
    assign _2872 = _1305 ? _2871 : _1339;
    assign _2874 = _1204 ? _1527 : _2872;
    assign _193 = _2874;
    always @(posedge _248) begin
        if (_246)
            _1339 <= vdd;
        else
            _1339 <= _193;
    end
    assign _1340 = _1216 == _1339;
    assign _1337 = _213 == _1145;
    assign _1341 = _1337 ? _1340 : _1216;
    assign _1348 = _1341 == _1347;
    assign _1349 = ~ _1348;
    assign _1350 = _1335 & _1349;
    assign _2885 = _1350 ? _2880 : _2884;
    assign _2876 = _1598 + _3379;
    assign _2877 = _1599 ? _2876 : _1598;
    assign _2878 = _1335 ? _1598 : _2877;
    assign _2879 = _1627 ? _2878 : _1598;
    assign _2880 = _1619 ? _2879 : _1598;
    assign _2886 = _1305 ? _2885 : _2880;
    assign _2888 = _1204 ? _1109 : _2886;
    assign _194 = _2888;
    always @(posedge _248) begin
        if (_246)
            _1598 <= _1109;
        else
            _1598 <= _194;
    end
    assign _1599 = _1598 < _191;
    assign _2778 = _1599 ? _2777 : _2287;
    assign _2779 = _1335 ? _1347 : _2778;
    assign _2894 = _2779 == _1345;
    assign _2892 = _1333 == _1008;
    assign _2893 = ~ _2892;
    assign _2895 = _2893 & _2894;
    assign _2899 = _2895 ? _2898 : _1351;
    assign _2890 = _197 == _1146;
    assign _2904 = _2890 ? _2903 : _2899;
    assign _2905 = _1627 ? _2904 : _1333;
    assign _2906 = _1619 ? _2905 : _1333;
    assign _2924 = _1305 ? _2923 : _2906;
    assign _2926 = _1204 ? _1008 : _2924;
    assign _195 = _2926;
    always @(posedge _248) begin
        if (_246)
            _1333 <= _1008;
        else
            _1333 <= _195;
    end
    assign _1334 = _1333 == _171;
    assign _197 = host_lane0_stuff;
    assign _1329 = _197 == _2005;
    assign _1330 = ~ _1329;
    assign _1335 = _1330 & _1334;
    assign _1620 = _1335 | _1599;
    assign _1627 = _1620 | _1626;
    assign _2940 = _1627 ? _2939 : _1527;
    assign _2941 = _1619 ? _2940 : _1317;
    assign _1615 = _1275 == _1109;
    assign _1613 = _1240 == _1109;
    assign _1616 = _1268 ? _1615 : _1613;
    assign _1617 = _1236 ? vdd : _1616;
    assign _1618 = _217 ? _1303 : _1617;
    assign _2933 = ~ _1618;
    assign _2930 = _213 == _1146;
    assign _2927 = ~ _219;
    assign _2928 = _1206 & _2927;
    assign _2931 = _2928 & _2930;
    assign _2932 = _2931 & _1304;
    assign _2934 = _2932 & _2933;
    assign _2942 = _2934 ? _2750 : _2941;
    assign _2944 = _1320 ? _1527 : _2942;
    assign _2946 = _1608 ? _1527 : _2944;
    assign _2948 = _1204 ? _1527 : _2946;
    assign _2950 = _1202 ? _1527 : _2948;
    assign _198 = _2950;
    always @(posedge _248) begin
        if (_246)
            _1317 <= vdd;
        else
            _1317 <= _198;
    end
    assign _1318 = _1216 == _1317;
    assign _1319 = ~ _1318;
    assign _1312 = _213 == _1146;
    assign _1313 = ~ _1312;
    assign _1309 = ~ _217;
    assign _200 = host_lane0_readback;
    assign _1306 = ~ _219;
    assign _1307 = _1206 & _1306;
    assign _1308 = _1307 & _200;
    assign _1310 = _1308 & _1309;
    assign _1314 = _1310 & _1313;
    assign _1315 = _1314 & _1304;
    assign _1320 = _1315 & _1319;
    assign _3019 = _1320 ? _2005 : _3017;
    assign _1301 = ~ _1289;
    assign _1302 = _1298 & _1301;
    assign _1297 = _305[7:7];
    assign _1296 = _305[6:6];
    assign _1295 = _305[5:5];
    assign _1294 = _305[4:4];
    assign _1293 = _305[3:3];
    assign _1292 = _305[2:2];
    assign _1291 = _305[1:1];
    assign _1290 = _305[0:0];
    always @* begin
        case (_202)
        0:
            _1298 <= _1290;
        1:
            _1298 <= _1291;
        2:
            _1298 <= _1292;
        3:
            _1298 <= _1293;
        4:
            _1298 <= _1294;
        5:
            _1298 <= _1295;
        6:
            _1298 <= _1296;
        default:
            _1298 <= _1297;
        endcase
    end
    assign _1299 = ~ _1298;
    assign _1288 = _289[7:7];
    assign _1287 = _289[6:6];
    assign _1286 = _289[5:5];
    assign _1285 = _289[4:4];
    assign _1284 = _289[3:3];
    assign _1283 = _289[2:2];
    assign _1282 = _289[1:1];
    assign _1281 = _289[0:0];
    assign _202 = host_lane0_clk_pin;
    always @* begin
        case (_202)
        0:
            _1289 <= _1281;
        1:
            _1289 <= _1282;
        2:
            _1289 <= _1283;
        3:
            _1289 <= _1284;
        4:
            _1289 <= _1285;
        5:
            _1289 <= _1286;
        6:
            _1289 <= _1287;
        default:
            _1289 <= _1288;
        endcase
    end
    assign _1300 = _1289 & _1299;
    assign _204 = host_lane0_clk_edge;
    assign _1303 = _204 ? _1302 : _1300;
    assign _1279 = _1264 == _1109;
    assign _1276 = _1275 == _1264;
    assign _1269 = _1240 == _1264;
    assign _1267 = ~ _1231;
    assign _1258 = _206[15:2];
    assign _1259 = { _2005,
                     _1258 };
    assign _1255 = _206[15:1];
    assign _1256 = { _1000,
                     _1255 };
    assign _1260 = _1256 + _1259;
    assign _1252 = _206[15:1];
    assign _1253 = { _1000,
                     _1252 };
    assign _1250 = _219 & _1233;
    assign _1261 = _1250 ? _1260 : _1253;
    always @(posedge _248) begin
        if (_246)
            _1264 <= _1109;
        else
            _1264 <= _1261;
    end
    assign _1265 = _1240 < _1264;
    assign _1242 = _206[15:2];
    assign _1243 = { _2005,
                     _1242 };
    always @(posedge _248) begin
        if (_246)
            _1246 <= _1109;
        else
            _1246 <= _1243;
    end
    assign _2996 = ~ _1231;
    assign _2997 = _1266 & _2996;
    assign _2998 = _2997 ? _1275 : _1240;
    assign _3000 = _1236 ? _1109 : _2998;
    assign _3002 = _3000 + _3379;
    assign _2980 = _2974 == _1069;
    assign _1271 = _206[15:1];
    assign _1272 = { _1000,
                     _1271 };
    always @(posedge _248) begin
        if (_246)
            _1275 <= _1109;
        else
            _1275 <= _1272;
    end
    assign _2976 = { gnd,
                     _1275 };
    assign _2977 = _2976 == _2974;
    assign _2970 = { gnd,
                     _206 };
    always @(posedge _248) begin
        if (_246)
            _2973 <= _1069;
        else
            _2973 <= _2970;
    end
    assign _206 = host_lane0_div_int;
    assign _2964 = { gnd,
                     _206 };
    assign _2966 = _2964 - _2628;
    always @(posedge _248) begin
        if (_246)
            _2969 <= _1069;
        else
            _2969 <= _2966;
    end
    assign _208 = host_lane0_div_frac;
    assign _2984 = { gnd,
                     _208 };
    assign _2986 = _2985[7:0];
    assign _2987 = _2982 ? _2986 : _2958;
    assign _2988 = _2955 ? _2987 : _2958;
    assign _2990 = _1204 ? _1154 : _2988;
    assign _209 = _2990;
    always @(posedge _248) begin
        if (_246)
            _2958 <= _1154;
        else
            _2958 <= _209;
    end
    assign _2983 = { gnd,
                     _2958 };
    assign _2985 = _2983 + _2984;
    assign _2991 = _2985[8:8];
    assign _2992 = _2982 ? _2991 : _2963;
    assign _2993 = _2955 ? _2992 : _2963;
    assign _2995 = _1204 ? _1000 : _2993;
    assign _210 = _2995;
    always @(posedge _248) begin
        if (_246)
            _2963 <= _1000;
        else
            _2963 <= _210;
    end
    assign _2974 = _2963 ? _2973 : _2969;
    assign _2960 = { gnd,
                     _1240 };
    assign _2975 = _2960 == _2974;
    assign _2978 = _1268 ? _2977 : _2975;
    assign _2981 = _1236 ? _2980 : _2978;
    assign _2959 = ~ _217;
    assign _2982 = _2959 & _2981;
    assign _3004 = _2982 ? _1109 : _3002;
    assign _2954 = ~ _217;
    assign _2952 = _1231 & _1229;
    assign _592 = _590 == _1722;
    assign _2951 = _1206 | _592;
    assign _2953 = _2951 | _2952;
    assign _2955 = _2953 & _2954;
    assign _3005 = _2955 ? _3004 : _1240;
    assign _3007 = _1204 ? _1109 : _3005;
    assign _211 = _3007;
    always @(posedge _248) begin
        if (_246)
            _1240 <= _1109;
        else
            _1240 <= _211;
    end
    assign _1247 = _1240 < _1246;
    assign _1248 = ~ _1247;
    assign _1237 = _1229 & _1233;
    assign _1249 = _1237 & _1248;
    assign _1266 = _1249 & _1265;
    assign _1268 = _1266 & _1267;
    assign _1277 = _1268 ? _1276 : _1269;
    assign _213 = host_lane0_code;
    assign _1233 = _213 == _1146;
    assign _1234 = ~ _1233;
    assign _1231 = _590 == _1145;
    assign _1235 = _1231 | _1234;
    assign _1228 = ~ _217;
    assign _1224 = _305[7:7];
    assign _1223 = _305[6:6];
    assign _1222 = _305[5:5];
    assign _1221 = _305[4:4];
    assign _1220 = _305[3:3];
    assign _1219 = _305[2:2];
    assign _1218 = _305[1:1];
    assign _1217 = _305[0:0];
    always @* begin
        case (_215)
        0:
            _1225 <= _1217;
        1:
            _1225 <= _1218;
        2:
            _1225 <= _1219;
        3:
            _1225 <= _1220;
        4:
            _1225 <= _1221;
        5:
            _1225 <= _1222;
        6:
            _1225 <= _1223;
        default:
            _1225 <= _1224;
        endcase
    end
    assign _1215 = _289[7:7];
    assign _1214 = _289[6:6];
    assign _1213 = _289[5:5];
    assign _1212 = _289[4:4];
    assign _1211 = _289[3:3];
    assign _1210 = _289[2:2];
    assign _1209 = _289[1:1];
    assign _1208 = _289[0:0];
    assign _215 = host_lane0_data_pin;
    always @* begin
        case (_215)
        0:
            _1216 <= _1208;
        1:
            _1216 <= _1209;
        2:
            _1216 <= _1210;
        3:
            _1216 <= _1211;
        4:
            _1216 <= _1212;
        5:
            _1216 <= _1213;
        6:
            _1216 <= _1214;
        default:
            _1216 <= _1215;
        endcase
    end
    assign _1226 = _1216 ^ _1225;
    assign _1227 = _219 & _1226;
    assign _1229 = _1227 & _1228;
    assign _1236 = _1229 & _1235;
    assign _1280 = _1236 ? _1279 : _1277;
    assign _217 = host_lane0_clk_pin_en;
    assign _1304 = _217 ? _1303 : _1280;
    assign _219 = host_lane0_dir;
    assign _1207 = _1206 & _219;
    assign _1305 = _1207 & _1304;
    assign _3071 = _1305 ? _3070 : _3019;
    assign _1608 = _220 == _1324;
    assign _3073 = _1608 ? _2005 : _3071;
    assign _2813 = _220 == _1864;
    assign _3080 = _2813 ? _3079 : _3073;
    assign _1204 = _220 == _1351;
    assign _3086 = _1204 ? _3085 : _3080;
    assign _2055 = _989[90:88];
    assign _2054 = _801[90:88];
    assign _2053 = _665[90:88];
    assign _2052 = _282[90:88];
    always @* begin
        case (f_winner)
        0:
            _2056 <= _2052;
        1:
            _2056 <= _2053;
        2:
            _2056 <= _2054;
        default:
            _2056 <= _2055;
        endcase
    end
    assign _2048 = _989[87:87];
    assign _2047 = _801[87:87];
    assign _2046 = _665[87:87];
    assign _2045 = _282[87:87];
    always @* begin
        case (f_winner)
        0:
            _2049 <= _2045;
        1:
            _2049 <= _2046;
        2:
            _2049 <= _2047;
        default:
            _2049 <= _2048;
        endcase
    end
    assign _3008 = ~ _2049;
    assign _3009 = _1121 & _3008;
    assign _3011 = _3009 ? _2056 : _1008;
    assign _220 = _3011;
    assign _1202 = _220 == _1195;
    assign _3088 = _1202 ? _2005 : _3086;
    assign _221 = _3088;
    always @(posedge _248) begin
        if (_246)
            _590 <= _2005;
        else
            _590 <= _221;
    end
    assign _1206 = _590 == _1146;
    assign _1611 = _1206 & _1610;
    assign _1619 = _1611 & _1618;
    assign _3102 = _1619 & _2755;
    assign _3104 = _3102 & _3103;
    assign _3108 = _3104 | _3107;
    assign _3099 = _3095 == _1146;
    assign _3097 = _3095 == _1145;
    assign _3100 = _3097 | _3099;
    assign _3101 = _1654 & _3100;
    assign _3109 = _3101 | _3108;
    assign _222 = _3109;
    assign _2786 = _222 & _2785;
    assign _2001 = _225 == _1531;
    assign _2375 = ~ _2001;
    assign _224 = host_tx_push;
    assign _2376 = _224 & _2375;
    assign _3110 = _2376 ^ _2786;
    assign _3116 = _3110 ? _3115 : _225;
    always @(posedge _248) begin
        if (_246)
            _3119 <= _1736;
        else
            _3119 <= _3116;
    end
    assign _225 = _3119;
    assign _578 = _225 == _1736;
    assign _3121 = _578 ? _1152 : _2426;
    assign _3094 = _1687[28:27];
    assign _3092 = _989[95:94];
    assign _3091 = _801[95:94];
    assign _3090 = _665[95:94];
    assign _3089 = _282[95:94];
    always @* begin
        case (f_winner)
        0:
            _3093 <= _3089;
        1:
            _3093 <= _3090;
        2:
            _3093 <= _3091;
        default:
            _3093 <= _3092;
        endcase
    end
    assign _3095 = _1653 ? _3094 : _3093;
    always @* begin
        case (_3095)
        0:
            _3133 <= _571;
        1:
            _3133 <= _3121;
        2:
            _3133 <= _3130;
        default:
            _3133 <= _3132;
        endcase
    end
    assign _3134 = _1654 ? _3133 : _571;
    assign _226 = _3134;
    always @(posedge _248) begin
        if (_246)
            _571 <= _1154;
        else
            _571 <= _226;
    end
    assign _572 = _571[0:0];
    assign _3145 = 8'b00001000;
    assign _3144 = 8'b00000111;
    assign _3142 = 8'b00000001;
    assign _3143 = _566 - _3142;
    assign _3140 = _1687[30:29];
    assign _989 = _281[511:400];
    assign _3138 = _989[99:98];
    assign _801 = _281[399:288];
    assign _3137 = _801[99:98];
    assign _3136 = _665[99:98];
    assign _3135 = _282[99:98];
    always @* begin
        case (f_winner)
        0:
            _3139 <= _3135;
        1:
            _3139 <= _3136;
        2:
            _3139 <= _3137;
        default:
            _3139 <= _3138;
        endcase
    end
    assign _3141 = _1653 ? _3140 : _3139;
    always @* begin
        case (_3141)
        0:
            _3146 <= _566;
        1:
            _3146 <= _3143;
        2:
            _3146 <= _3144;
        default:
            _3146 <= _3145;
        endcase
    end
    assign _3147 = _1654 ? _3146 : _566;
    assign _227 = _3147;
    always @(posedge _248) begin
        if (_246)
            _566 <= _1154;
        else
            _566 <= _227;
    end
    assign _568 = _566 == _1154;
    assign _756 = _665[61:58];
    always @* begin
        case (_756)
        0:
            _757 <= vdd;
        1:
            _757 <= _568;
        2:
            _757 <= _572;
        3:
            _757 <= _576;
        4:
            _757 <= _578;
        5:
            _757 <= _580;
        6:
            _757 <= _584;
        7:
            _757 <= _587;
        8:
            _757 <= _592;
        9:
            _757 <= _595;
        10:
            _757 <= _598;
        11:
            _757 <= _601;
        12:
            _757 <= _606;
        13:
            _757 <= _609;
        14:
            _757 <= _612;
        default:
            _757 <= _615;
        endcase
    end
    assign _759 = _757 ^ _758;
    assign _751 = _665[57:42];
    assign _753 = _751 == _997;
    assign _742 = _688[57:42];
    assign _743 = { gnd,
                    _742 };
    assign _744 = _743 + _731;
    always @(posedge _248) begin
        if (_246)
            _747 <= _1069;
        else
            _747 <= _744;
    end
    assign _748 = _747 < _687;
    assign _749 = ~ _748;
    assign _738 = _665[41:26];
    assign _740 = _738 == _1109;
    assign _526 = _522 + _1351;
    assign _3163 = _522 + _1351;
    assign _3159 = _522 == _1888;
    assign _3160 = ~ _3159;
    assign _3157 = _302[0:0];
    assign _3161 = _3157 & _3160;
    assign _3164 = _3161 ? _3163 : _522;
    assign _3154 = _302[0:0];
    assign _3155 = ~ _3154;
    assign _3153 = f_chg_now[0:0];
    assign _3156 = _3153 & _3155;
    assign _3166 = _3156 ? _1351 : _3164;
    assign _3150 = _266 == _1146;
    assign _3152 = _3150 ? _1008 : _522;
    assign _3149 = _266 == _1145;
    assign _3167 = _3149 ? _3166 : _3152;
    assign _228 = _3167;
    always @(posedge _248) begin
        if (_246)
            _522 <= _1008;
        else
            _522 <= _228;
    end
    assign _524 = _522 == _1888;
    assign _527 = _524 ? _522 : _526;
    assign _517 = _302[0:0];
    assign _518 = ~ _517;
    assign _516 = f_chg_now[0:0];
    assign _519 = _516 & _518;
    assign _529 = _519 ? _1351 : _527;
    assign _513 = f_changed_all[0:0];
    assign _514 = f_in_fetch & _513;
    assign _530 = _514 ? _529 : _1008;
    assign _722 = _692[0:0];
    assign _724 = _722 ? _530 : _1008;
    assign _505 = _501 + _1351;
    assign _3182 = _501 + _1351;
    assign _3178 = _501 == _1888;
    assign _3179 = ~ _3178;
    assign _3176 = _302[1:1];
    assign _3180 = _3176 & _3179;
    assign _3183 = _3180 ? _3182 : _501;
    assign _3173 = _302[1:1];
    assign _3174 = ~ _3173;
    assign _3172 = f_chg_now[1:1];
    assign _3175 = _3172 & _3174;
    assign _3185 = _3175 ? _1351 : _3183;
    assign _3169 = _266 == _1146;
    assign _3171 = _3169 ? _1008 : _501;
    assign _3168 = _266 == _1145;
    assign _3186 = _3168 ? _3185 : _3171;
    assign _229 = _3186;
    always @(posedge _248) begin
        if (_246)
            _501 <= _1008;
        else
            _501 <= _229;
    end
    assign _503 = _501 == _1888;
    assign _506 = _503 ? _501 : _505;
    assign _496 = _302[1:1];
    assign _497 = ~ _496;
    assign _495 = f_chg_now[1:1];
    assign _498 = _495 & _497;
    assign _508 = _498 ? _1351 : _506;
    assign _492 = f_changed_all[1:1];
    assign _493 = f_in_fetch & _492;
    assign _509 = _493 ? _508 : _1008;
    assign _719 = _692[1:1];
    assign _721 = _719 ? _509 : _1008;
    assign _725 = _721 < _724;
    assign _726 = _725 ? _724 : _721;
    assign _482 = _478 + _1351;
    assign _3201 = _478 + _1351;
    assign _3197 = _478 == _1888;
    assign _3198 = ~ _3197;
    assign _3195 = _302[2:2];
    assign _3199 = _3195 & _3198;
    assign _3202 = _3199 ? _3201 : _478;
    assign _3192 = _302[2:2];
    assign _3193 = ~ _3192;
    assign _3191 = f_chg_now[2:2];
    assign _3194 = _3191 & _3193;
    assign _3204 = _3194 ? _1351 : _3202;
    assign _3188 = _266 == _1146;
    assign _3190 = _3188 ? _1008 : _478;
    assign _3187 = _266 == _1145;
    assign _3205 = _3187 ? _3204 : _3190;
    assign _230 = _3205;
    always @(posedge _248) begin
        if (_246)
            _478 <= _1008;
        else
            _478 <= _230;
    end
    assign _480 = _478 == _1888;
    assign _483 = _480 ? _478 : _482;
    assign _473 = _302[2:2];
    assign _474 = ~ _473;
    assign _472 = f_chg_now[2:2];
    assign _475 = _472 & _474;
    assign _485 = _475 ? _1351 : _483;
    assign _469 = f_changed_all[2:2];
    assign _470 = f_in_fetch & _469;
    assign _486 = _470 ? _485 : _1008;
    assign _714 = _692[2:2];
    assign _716 = _714 ? _486 : _1008;
    assign _461 = _457 + _1351;
    assign _3220 = _457 + _1351;
    assign _3216 = _457 == _1888;
    assign _3217 = ~ _3216;
    assign _3214 = _302[3:3];
    assign _3218 = _3214 & _3217;
    assign _3221 = _3218 ? _3220 : _457;
    assign _3211 = _302[3:3];
    assign _3212 = ~ _3211;
    assign _3210 = f_chg_now[3:3];
    assign _3213 = _3210 & _3212;
    assign _3223 = _3213 ? _1351 : _3221;
    assign _3207 = _266 == _1146;
    assign _3209 = _3207 ? _1008 : _457;
    assign _3206 = _266 == _1145;
    assign _3224 = _3206 ? _3223 : _3209;
    assign _231 = _3224;
    always @(posedge _248) begin
        if (_246)
            _457 <= _1008;
        else
            _457 <= _231;
    end
    assign _459 = _457 == _1888;
    assign _462 = _459 ? _457 : _461;
    assign _452 = _302[3:3];
    assign _453 = ~ _452;
    assign _451 = f_chg_now[3:3];
    assign _454 = _451 & _453;
    assign _464 = _454 ? _1351 : _462;
    assign _448 = f_changed_all[3:3];
    assign _449 = f_in_fetch & _448;
    assign _465 = _449 ? _464 : _1008;
    assign _711 = _692[3:3];
    assign _713 = _711 ? _465 : _1008;
    assign _717 = _713 < _716;
    assign _718 = _717 ? _716 : _713;
    assign _727 = _718 < _726;
    assign _728 = _727 ? _726 : _718;
    assign _436 = _432 + _1351;
    assign _3239 = _432 + _1351;
    assign _3235 = _432 == _1888;
    assign _3236 = ~ _3235;
    assign _3233 = _302[4:4];
    assign _3237 = _3233 & _3236;
    assign _3240 = _3237 ? _3239 : _432;
    assign _3230 = _302[4:4];
    assign _3231 = ~ _3230;
    assign _3229 = f_chg_now[4:4];
    assign _3232 = _3229 & _3231;
    assign _3242 = _3232 ? _1351 : _3240;
    assign _3226 = _266 == _1146;
    assign _3228 = _3226 ? _1008 : _432;
    assign _3225 = _266 == _1145;
    assign _3243 = _3225 ? _3242 : _3228;
    assign _232 = _3243;
    always @(posedge _248) begin
        if (_246)
            _432 <= _1008;
        else
            _432 <= _232;
    end
    assign _434 = _432 == _1888;
    assign _437 = _434 ? _432 : _436;
    assign _427 = _302[4:4];
    assign _428 = ~ _427;
    assign _426 = f_chg_now[4:4];
    assign _429 = _426 & _428;
    assign _439 = _429 ? _1351 : _437;
    assign _423 = f_changed_all[4:4];
    assign _424 = f_in_fetch & _423;
    assign _440 = _424 ? _439 : _1008;
    assign _704 = _692[4:4];
    assign _706 = _704 ? _440 : _1008;
    assign _415 = _411 + _1351;
    assign _3258 = _411 + _1351;
    assign _3254 = _411 == _1888;
    assign _3255 = ~ _3254;
    assign _3252 = _302[5:5];
    assign _3256 = _3252 & _3255;
    assign _3259 = _3256 ? _3258 : _411;
    assign _3249 = _302[5:5];
    assign _3250 = ~ _3249;
    assign _3248 = f_chg_now[5:5];
    assign _3251 = _3248 & _3250;
    assign _3261 = _3251 ? _1351 : _3259;
    assign _3245 = _266 == _1146;
    assign _3247 = _3245 ? _1008 : _411;
    assign _3244 = _266 == _1145;
    assign _3262 = _3244 ? _3261 : _3247;
    assign _233 = _3262;
    always @(posedge _248) begin
        if (_246)
            _411 <= _1008;
        else
            _411 <= _233;
    end
    assign _413 = _411 == _1888;
    assign _416 = _413 ? _411 : _415;
    assign _406 = _302[5:5];
    assign _407 = ~ _406;
    assign _405 = f_chg_now[5:5];
    assign _408 = _405 & _407;
    assign _418 = _408 ? _1351 : _416;
    assign _402 = f_changed_all[5:5];
    assign _403 = f_in_fetch & _402;
    assign _419 = _403 ? _418 : _1008;
    assign _701 = _692[5:5];
    assign _703 = _701 ? _419 : _1008;
    assign _707 = _703 < _706;
    assign _708 = _707 ? _706 : _703;
    assign _392 = _388 + _1351;
    assign _3277 = _388 + _1351;
    assign _3273 = _388 == _1888;
    assign _3274 = ~ _3273;
    assign _3271 = _302[6:6];
    assign _3275 = _3271 & _3274;
    assign _3278 = _3275 ? _3277 : _388;
    assign _3268 = _302[6:6];
    assign _3269 = ~ _3268;
    assign _3267 = f_chg_now[6:6];
    assign _3270 = _3267 & _3269;
    assign _3280 = _3270 ? _1351 : _3278;
    assign _3264 = _266 == _1146;
    assign _3266 = _3264 ? _1008 : _388;
    assign _3263 = _266 == _1145;
    assign _3281 = _3263 ? _3280 : _3266;
    assign _234 = _3281;
    always @(posedge _248) begin
        if (_246)
            _388 <= _1008;
        else
            _388 <= _234;
    end
    assign _390 = _388 == _1888;
    assign _393 = _390 ? _388 : _392;
    assign _383 = _302[6:6];
    assign _384 = ~ _383;
    assign _382 = f_chg_now[6:6];
    assign _385 = _382 & _384;
    assign _395 = _385 ? _1351 : _393;
    assign _379 = f_changed_all[6:6];
    assign _380 = f_in_fetch & _379;
    assign _396 = _380 ? _395 : _1008;
    assign _696 = _692[6:6];
    assign _698 = _696 ? _396 : _1008;
    assign _371 = _367 + _1351;
    assign _3296 = _367 + _1351;
    assign _3292 = _367 == _1888;
    assign _3293 = ~ _3292;
    assign _3290 = _302[7:7];
    assign _3294 = _3290 & _3293;
    assign _3297 = _3294 ? _3296 : _367;
    assign _3287 = _302[7:7];
    assign _3288 = ~ _3287;
    assign _3286 = f_chg_now[7:7];
    assign _3289 = _3286 & _3288;
    assign _3299 = _3289 ? _1351 : _3297;
    assign _3283 = _266 == _1146;
    assign _3285 = _3283 ? _1008 : _367;
    assign _3282 = _266 == _1145;
    assign _3300 = _3282 ? _3299 : _3285;
    assign _235 = _3300;
    always @(posedge _248) begin
        if (_246)
            _367 <= _1008;
        else
            _367 <= _235;
    end
    assign _369 = _367 == _1888;
    assign _372 = _369 ? _367 : _371;
    assign _362 = _302[7:7];
    assign _363 = ~ _362;
    assign _361 = f_chg_now[7:7];
    assign _364 = _361 & _363;
    assign _374 = _364 ? _1351 : _372;
    assign _358 = f_changed_all[7:7];
    assign _359 = f_in_fetch & _358;
    assign _375 = _359 ? _374 : _1008;
    assign _692 = _688[23:16];
    assign _693 = _692[7:7];
    assign _695 = _693 ? _375 : _1008;
    assign _699 = _695 < _698;
    assign _700 = _699 ? _698 : _695;
    assign _709 = _700 < _708;
    assign _710 = _709 ? _708 : _700;
    assign _729 = _710 < _728;
    assign _730 = _729 ? _728 : _710;
    assign _731 = { _1053,
                    _730 };
    assign _3303 = _333 == _1351;
    assign _3304 = _3303 ? _240 : _280;
    assign _3301 = _266 == _1145;
    assign _3305 = _3301 ? _3304 : _280;
    assign _236 = _3305;
    always @(posedge _248) begin
        if (_246)
            _280 <= _270;
        else
            _280 <= _236;
    end
    assign _347 = _333 == _1351;
    assign _348 = f_in_fetch & _347;
    assign _349 = _348 ? _240 : _280;
    assign _3308 = _333 == _1324;
    assign _3309 = _3308 ? _240 : _277;
    assign _3306 = _266 == _1145;
    assign _3310 = _3306 ? _3309 : _277;
    assign _237 = _3310;
    always @(posedge _248) begin
        if (_246)
            _277 <= _270;
        else
            _277 <= _237;
    end
    assign _343 = _333 == _1324;
    assign _344 = f_in_fetch & _343;
    assign _345 = _344 ? _240 : _277;
    assign _3313 = _333 == _1864;
    assign _3314 = _3313 ? _240 : _274;
    assign _3311 = _266 == _1145;
    assign _3315 = _3311 ? _3314 : _274;
    assign _238 = _3315;
    always @(posedge _248) begin
        if (_246)
            _274 <= _270;
        else
            _274 <= _238;
    end
    assign _339 = _333 == _1864;
    assign _340 = f_in_fetch & _339;
    assign _341 = _340 ? _240 : _274;
    assign _240 = ram_rec_rdata;
    assign _335 = _333 == _1195;
    assign _336 = f_in_fetch & _335;
    assign _337 = _336 ? _240 : _271;
    assign _350 = { _337,
                    _341,
                    _345,
                    _349 };
    assign _688 = _350[287:176];
    assign _689 = _688[41:26];
    assign _690 = { gnd,
                    _689 };
    assign _732 = _690 + _731;
    always @(posedge _248) begin
        if (_246)
            _735 <= _1069;
        else
            _735 <= _732;
    end
    assign gnd = 1'b0;
    assign _687 = { gnd,
                    _684 };
    assign _736 = _687 < _735;
    assign _737 = ~ _736;
    assign _741 = _737 | _740;
    assign _750 = _741 & _749;
    assign _3343 = _323 + _3379;
    assign _3339 = _323 == _997;
    assign _3340 = ~ _3339;
    assign _3341 = _3337 & _3340;
    assign _3344 = _3341 ? _3343 : _323;
    assign _3323 = _3322[2:2];
    assign _3324 = _1654 & _3323;
    assign _3346 = _3324 ? _1109 : _3344;
    assign _3348 = _258 ? _1109 : _3346;
    assign _241 = _3348;
    always @(posedge _248) begin
        if (_246)
            _323 <= _1109;
        else
            _323 <= _241;
    end
    assign _3360 = _320 + _3379;
    assign _3356 = _320 == _997;
    assign _3357 = ~ _3356;
    assign _3335 = 9'b111111111;
    assign _3336 = _3328 == _3335;
    assign _3333 = 6'b111111;
    assign _3332 = _3328[5:0];
    assign _3334 = _3332 == _3333;
    assign _3327 = 9'b000000000;
    assign _3349 = 9'b000000001;
    assign _3350 = _3328 + _3349;
    assign _3352 = _258 ? _3327 : _3350;
    assign _242 = _3352;
    always @(posedge _248) begin
        if (_246)
            _3328 <= _3327;
        else
            _3328 <= _242;
    end
    assign _3329 = _3328[2:0];
    assign _3331 = _3329 == _1888;
    assign _3325 = _1687[63:62];
    always @* begin
        case (_3325)
        0:
            _3337 <= vdd;
        1:
            _3337 <= _3331;
        2:
            _3337 <= _3334;
        default:
            _3337 <= _3336;
        endcase
    end
    assign _3358 = _3337 & _3357;
    assign _3361 = _3358 ? _3360 : _320;
    assign _3353 = _3322[1:1];
    assign _3354 = _1654 & _3353;
    assign _3363 = _3354 ? _1109 : _3361;
    assign _3365 = _258 ? _1109 : _3363;
    assign _243 = _3365;
    always @(posedge _248) begin
        if (_246)
            _320 <= _1109;
        else
            _320 <= _243;
    end
    assign _683 = _665[25:24];
    always @* begin
        case (_683)
        0:
            _684 <= _317;
        1:
            _684 <= _320;
        2:
            _684 <= _323;
        default:
            _684 <= _323;
        endcase
    end
    assign _686 = _684 == _997;
    assign _754 = _686 ? _753 : _750;
    always @(posedge _248) begin
        if (_246)
            _305 <= _1154;
        else
            _305 <= _289;
    end
    assign f_chg_now = _289 ^ _305;
    assign _3367 = _266 == _1146;
    assign _3369 = _3367 ? _1154 : _302;
    assign _3366 = _266 == _1145;
    assign _3370 = _3366 ? f_changed_all : _3369;
    assign _3372 = _258 ? _1154 : _3370;
    assign _244 = _3372;
    always @(posedge _248) begin
        if (_246)
            _302 <= _1154;
        else
            _302 <= _244;
    end
    assign f_changed_all = _302 | f_chg_now;
    assign _677 = f_changed_all & _674;
    assign _679 = _677 == _1154;
    assign _680 = ~ _679;
    assign _674 = _665[23:16];
    assign _676 = _674 == _1154;
    assign _681 = _676 | _680;
    assign _669 = _665[7:0];
    assign _667 = _665[15:8];
    assign vdd = 1'b1;
    assign _246 = clear;
    assign _248 = clock;
    assign _250 = pins_in;
    always @(posedge _248) begin
        if (_246)
            _286 <= _1154;
        else
            _286 <= _250;
    end
    always @(posedge _248) begin
        if (_246)
            _289 <= _1154;
        else
            _289 <= _286;
    end
    assign _668 = _289 ^ _667;
    assign _670 = _668 & _669;
    assign _672 = _670 == _1154;
    assign _665 = _281[287:176];
    assign _666 = _665[111:111];
    assign _673 = _666 & _672;
    assign _682 = _673 & _681;
    assign _755 = _682 & _754;
    assign _760 = _755 & _759;
    assign _799 = _760 & _798;
    assign f_fire1 = f_in_eval & _799;
    assign _941 = f_fire1 ? _1145 : _939;
    assign f_winner = f_fire0 ? _2005 : _941;
    always @* begin
        case (f_winner)
        0:
            _3320 <= _3316;
        1:
            _3320 <= _3317;
        2:
            _3320 <= _3318;
        default:
            _3320 <= _3319;
        endcase
    end
    assign _3322 = _1653 ? _3321 : _3320;
    assign _3373 = _3322[0:0];
    assign _3374 = _1654 & _3373;
    assign _3383 = _3374 ? _1109 : _3381;
    assign _3385 = _258 ? _1109 : _3383;
    assign _251 = _3385;
    always @(posedge _248) begin
        if (_246)
            _317 <= _1109;
        else
            _317 <= _251;
    end
    assign _1706 = _1687[33:32];
    always @* begin
        case (_1706)
        0:
            _1707 <= _317;
        1:
            _1707 <= _320;
        2:
            _1707 <= _323;
        default:
            _1707 <= _323;
        endcase
    end
    assign _1705 = _1687[49:34];
    assign _1708 = _1705 < _1707;
    assign _1687 = _281[63:0];
    assign _1703 = _1687[31:31];
    assign _1701 = ~ _1121;
    assign _1702 = f_in_eval & _1701;
    assign _1704 = _1702 & _1703;
    assign _1709 = _1704 & _1708;
    assign _1718 = _1709 | f_unexp_now;
    assign _3391 = _1718 ? _3390 : _333;
    assign _3394 = _1121 ? _3393 : _3391;
    assign _3387 = _266 == _1146;
    assign _3395 = _3387 ? _3394 : _333;
    assign _3386 = _266 == _1145;
    assign _3398 = _3386 ? _3397 : _3395;
    assign _3400 = _258 ? _1008 : _3398;
    assign _252 = _3400;
    always @(posedge _248) begin
        if (_246)
            _333 <= _1008;
        else
            _333 <= _252;
    end
    assign _3403 = _333 == _1195;
    assign _3404 = _3403 ? _240 : _271;
    assign _3401 = _266 == _1145;
    assign _3405 = _3401 ? _3404 : _271;
    assign _253 = _3405;
    always @(posedge _248) begin
        if (_246)
            _271 <= _270;
        else
            _271 <= _253;
    end
    assign _281 = { _271,
                    _274,
                    _277,
                    _280 };
    assign _282 = _281[175:64];
    assign _283 = _282[111:111];
    assign _296 = _283 & _295;
    assign _313 = _296 & _312;
    assign _562 = _313 & _561;
    assign _619 = _562 & _618;
    assign _663 = _619 & _662;
    assign f_in_eval = _266 == _1146;
    assign f_fire0 = f_in_eval & _663;
    assign _1028 = f_fire0 | f_fire1;
    assign _1029 = _1028 | f_fire2;
    assign _1121 = _1029 | f_fire3;
    assign _3424 = _1121 ? _3423 : _3421;
    assign _3409 = _266 == _1722;
    assign _3411 = _3409 ? _2005 : _266;
    assign _3407 = _266 == _1146;
    assign _3425 = _3407 ? _3424 : _3411;
    assign _3406 = _266 == _1145;
    assign _3428 = _3406 ? _3427 : _3425;
    assign _255 = host_stop;
    assign _3430 = _255 ? _2005 : _3428;
    assign _3432 = _258 ? _1145 : _3430;
    assign _256 = _3432;
    always @(posedge _248) begin
        if (_246)
            _266 <= _2005;
        else
            _266 <= _256;
    end
    assign f_in_fetch = _266 == _1145;
    assign _1653 = f_in_fetch & _1652;
    assign _1654 = _1653 | _1121;
    assign _2022 = _1654 & _2021;
    assign _3454 = _2022 ? _3453 : _2086;
    assign _258 = host_start;
    assign _3456 = _258 ? _1154 : _3454;
    assign _259 = _3456;
    always @(posedge _248) begin
        if (_246)
            _2086 <= _1154;
        else
            _2086 <= _259;
    end
    assign _2087 = _2086[7:7];
    assign _261 = host_pin_src;
    assign _2083 = _261[23:21];
    always @* begin
        case (_2083)
        0:
            _2094 <= _2087;
        1:
            _2094 <= _1317;
        2:
            _2094 <= _2088;
        3:
            _2094 <= _2089;
        4:
            _2094 <= _2091;
        5:
            _2094 <= _1474;
        6:
            _2094 <= _2092;
        default:
            _2094 <= _2093;
        endcase
    end
    assign _2158 = { _2094,
                     _2103,
                     _2112,
                     _2121,
                     _2130,
                     _2139,
                     _2148,
                     _2157 };
    assign _3458 = _2158 & _3457;
    assign pins_out = _3458;
    assign pins_oe = _2161;
    assign st_running = _2018;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1129;
    assign st_accepting = _2017;
    assign st_taken = _2015;
    assign st_taken_edge = _2012;
    assign st_viol = _2009;
    assign st_viol_kind = _2006;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _2001;
    assign st_tx_empty = _578;
    assign st_rx_data = _1999;
    assign st_rx_empty = _1734;
    assign st_vlog_data = _1892;
    assign st_vlog_empty = _1737;
    assign st_cov_rdata = _50;
    assign st_irq = _1741;
    assign st_halted_viol = _1686;
    assign st_rx_overflow = _1679;
    assign st_vlog_overflow = _1536;
    assign st_cov_overrun = _1526;
    assign st_lane_status = _1517;
    assign ram_rec_addr = _1200;
    assign ram_rec_re = _1197;
    assign ram_rec_we = _1194;
    assign ram_rec_wdata = _20;
    assign ram_cov_addr = _1193;
    assign ram_cov_re = _1188;
    assign ram_cov_we = _1185;
    assign ram_cov_wdata = _1177;

endmodule
