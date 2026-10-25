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

    wire [11:0] _1173;
    wire _1170;
    wire _1171;
    wire [11:0] _1172;
    wire _1174;
    wire [11:0] _1175;
    wire [11:0] _1176;
    wire [11:0] _1162;
    wire [11:0] _1022;
    wire [11:0] _1019;
    wire [12:0] _1016;
    wire [9:0] _1013;
    wire [12:0] _1014;
    wire [12:0] _1015;
    wire [2:0] _1009;
    reg [2:0] _988;
    wire [2:0] _1;
    reg [2:0] _1010;
    wire [12:0] _1011;
    wire [12:0] _996;
    wire [12:0] _995;
    wire [15:0] _989;
    wire _994;
    wire [12:0] _997;
    wire [12:0] _2;
    reg [12:0] _1006;
    wire _1012;
    wire [12:0] _1017;
    wire [12:0] _1003;
    wire _1018;
    wire [11:0] _1021;
    wire _1001;
    wire [15:0] _998;
    wire _999;
    wire _3;
    reg _1002;
    wire [11:0] _1023;
    wire [11:0] _4;
    reg [11:0] _1163;
    wire [11:0] _1026;
    reg [1:0] _992;
    reg [15:0] _993;
    wire [15:0] _1024;
    wire _1025;
    wire [11:0] _1028;
    wire [11:0] _5;
    reg [11:0] _1160;
    wire _1164;
    wire _1165;
    wire [11:0] _1166;
    wire [11:0] _1157;
    wire _1167;
    wire [11:0] _1168;
    wire [7:0] _1155;
    wire _1156;
    wire [11:0] _1169;
    wire [7:0] _1153;
    wire [7:0] _1152;
    wire [1:0] _1147;
    wire [1:0] _1146;
    wire _1135;
    wire _1127;
    wire _1136;
    wire _6;
    reg _1145;
    wire [1:0] _1148;
    wire [6:0] _1142;
    wire [8:0] _1149;
    wire [7:0] _1140;
    wire [8:0] _1141;
    wire [8:0] _1150;
    wire _1151;
    wire [7:0] _1154;
    wire [31:0] _1177;
    wire [31:0] _8;
    wire [31:0] _1178;
    wire _1186;
    wire _1184;
    wire _1182;
    wire _12;
    wire _1181;
    wire _1183;
    wire _1185;
    wire _1188;
    wire _1187;
    wire _1189;
    wire [7:0] _14;
    reg [7:0] _1193;
    wire [7:0] _16;
    wire [7:0] _1190;
    wire _17;
    reg _1139;
    wire [7:0] _1194;
    wire [127:0] _20;
    wire _23;
    wire _1195;
    wire [1:0] _1199;
    wire [7:0] _1200;
    wire [7:0] _27;
    wire [2:0] _1196;
    wire _1197;
    wire _1198;
    wire [7:0] _1201;
    wire [2:0] _1352;
    wire [2:0] _1353;
    wire [2:0] _1325;
    wire [2:0] _1327;
    wire [2:0] _1328;
    wire [2:0] _1354;
    wire [2:0] _1356;
    wire [2:0] _1358;
    wire [2:0] _29;
    reg [2:0] _1324;
    wire [7:0] _1517;
    wire [2:0] _1510;
    wire [2:0] _1484;
    wire [2:0] _1485;
    wire [2:0] _1511;
    wire [2:0] _1513;
    wire [2:0] _1515;
    wire [2:0] _30;
    reg [2:0] _1481;
    wire [7:0] _1516;
    wire [15:0] _1518;
    wire _1528;
    wire [7:0] _32;
    reg [7:0] _1134;
    wire [7:0] _1131;
    wire _1522;
    wire _1523;
    wire _1519;
    wire _1520;
    wire _33;
    reg _1126;
    wire _35;
    wire _1123;
    wire _1521;
    wire _1524;
    wire _1529;
    wire _1531;
    wire _36;
    reg _1527;
    wire _1534;
    wire _1539;
    wire _1541;
    wire _38;
    reg _1537;
    wire _1673;
    wire _1666;
    wire _1674;
    wire _1647;
    wire _1594;
    wire _1648;
    wire _1675;
    wire _40;
    wire _1676;
    wire _1677;
    wire _1682;
    wire _1684;
    wire _41;
    reg _1680;
    wire _1689;
    wire _1690;
    wire _1695;
    wire _45;
    wire _1697;
    wire _1699;
    wire _46;
    reg _1693;
    wire _1729;
    wire _1731;
    wire _1727;
    wire _1733;
    wire _1734;
    wire _1735;
    wire _1701;
    wire _1736;
    wire _1738;
    wire _47;
    reg _1687;
    wire _1744;
    wire _1741;
    wire _1745;
    wire _1746;
    wire _1747;
    wire [31:0] _50;
    wire [2:0] _1894;
    wire _1895;
    wire _1896;
    wire [47:0] _1893;
    reg [47:0] _1897;
    wire [2:0] _1888;
    wire _1889;
    wire _1890;
    reg [47:0] _1891;
    wire [2:0] _1882;
    wire _1883;
    wire _1884;
    reg [47:0] _1885;
    wire _1877;
    wire _1878;
    reg [47:0] _1879;
    wire [2:0] _1870;
    wire _1871;
    wire _1872;
    reg [47:0] _1873;
    wire _1865;
    wire _1866;
    reg [47:0] _1867;
    wire _1859;
    wire _1860;
    reg [47:0] _1861;
    wire [2:0] _1754;
    wire [2:0] _1755;
    wire [2:0] _53;
    reg [2:0] _1752;
    wire _1853;
    wire _1854;
    wire [2:0] _1828;
    wire [28:0] _1763;
    wire [28:0] _1762;
    wire [28:0] _1765;
    wire [28:0] _1766;
    wire [2:0] _1759;
    wire _1761;
    wire [28:0] _1767;
    wire [28:0] _54;
    reg [28:0] ts_hi_m1;
    wire [28:0] _1826;
    wire _1814;
    wire _1813;
    wire _1815;
    wire [2:0] _1817;
    wire _1809;
    wire _1808;
    wire _1810;
    wire [2:0] _1812;
    wire _1818;
    wire [2:0] _1819;
    wire _1802;
    wire _1801;
    wire _1803;
    wire [2:0] _1805;
    wire _1797;
    wire _1796;
    wire _1798;
    wire [2:0] _1800;
    wire _1806;
    wire [2:0] _1807;
    wire _1820;
    wire [2:0] _1821;
    wire _1788;
    wire _1787;
    wire _1789;
    wire [2:0] _1791;
    wire _1783;
    wire _1782;
    wire _1784;
    wire [2:0] _1786;
    wire _1792;
    wire [2:0] _1793;
    wire _1776;
    wire _1775;
    wire _1777;
    wire [2:0] _1779;
    wire _1771;
    wire _1770;
    wire _1772;
    wire [2:0] _1774;
    wire _1780;
    wire [2:0] _1781;
    wire _1794;
    wire [2:0] _1795;
    wire _1822;
    wire [2:0] _1823;
    wire [2:0] _1824;
    wire [2:0] _1768;
    wire _1825;
    wire [28:0] _1827;
    wire [31:0] _1829;
    wire [47:0] _1831;
    wire [47:0] _55;
    reg [47:0] _1855;
    wire [2:0] _1848;
    wire [3:0] _1742;
    wire [3:0] _1837;
    wire [3:0] _1838;
    wire [3:0] _1836;
    wire [3:0] _1839;
    wire [3:0] _1532;
    wire _1533;
    wire _1748;
    wire _56;
    wire _1749;
    wire _1834;
    wire [3:0] _1840;
    reg [3:0] _1843;
    wire [3:0] _57;
    wire _1743;
    wire _1832;
    wire _59;
    wire _1833;
    wire [2:0] _1849;
    wire [2:0] _60;
    reg [2:0] _1846;
    reg [47:0] _1898;
    wire _2002;
    wire _2003;
    reg [7:0] _2004;
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
    wire [2:0] _1905;
    wire [2:0] _1906;
    wire [2:0] _63;
    reg [2:0] _1903;
    wire _1960;
    wire _1961;
    wire [7:0] _1946;
    wire [7:0] _1947;
    wire [7:0] _1924;
    wire [7:0] _1922;
    wire [7:0] _1925;
    wire [7:0] _64;
    reg [7:0] _1911;
    wire [7:0] _1920;
    wire [7:0] _1921;
    wire [7:0] _1936;
    wire [7:0] _1933;
    wire [7:0] _1931;
    wire [7:0] _1934;
    wire [7:0] _65;
    reg [7:0] _1930;
    wire [7:0] _1935;
    wire [7:0] _1937;
    wire [7:0] _1948;
    wire [7:0] _66;
    reg [7:0] _1962;
    wire [2:0] _1955;
    wire [2:0] _1956;
    wire [2:0] _67;
    reg [2:0] _1953;
    reg [7:0] _2005;
    wire [31:0] _1757;
    wire [31:0] _2008;
    wire [31:0] _2009;
    wire [31:0] _71;
    reg [31:0] ts_reg;
    wire [1:0] _2011;
    wire [1:0] _1830;
    reg [1:0] _2012;
    reg _2015;
    reg [1:0] _2018;
    reg _2021;
    wire _2022;
    wire _2023;
    wire _1180;
    wire _2024;
    wire [7:0] _2165;
    wire [7:0] _2166;
    wire [7:0] _2046;
    wire [7:0] _2044;
    wire [7:0] _2043;
    wire [7:0] _2042;
    wire [7:0] _2041;
    reg [7:0] _2045;
    wire [7:0] _2047;
    wire [7:0] _2048;
    wire [7:0] _2039;
    wire [7:0] _2040;
    wire [7:0] _2049;
    wire [7:0] _2083;
    wire [7:0] _2084;
    wire [7:0] _2086;
    wire [7:0] _2088;
    wire [7:0] _81;
    reg [7:0] _2031;
    wire [7:0] _2167;
    wire [7:0] _84;
    wire [7:0] _3470;
    wire _2162;
    wire _2161;
    wire _2159;
    wire _2160;
    wire _2158;
    wire _2157;
    wire _2156;
    wire [2:0] _2155;
    reg _2163;
    wire _2153;
    wire _2152;
    wire _2150;
    wire _2151;
    wire _2149;
    wire _2148;
    wire _2147;
    wire [2:0] _2146;
    reg _2154;
    wire _2144;
    wire _2143;
    wire _2141;
    wire _2142;
    wire _2140;
    wire _2139;
    wire _2138;
    wire [2:0] _2137;
    reg _2145;
    wire _2135;
    wire _2134;
    wire _2132;
    wire _2133;
    wire _2131;
    wire _2130;
    wire _2129;
    wire [2:0] _2128;
    reg _2136;
    wire _2126;
    wire _2125;
    wire _2123;
    wire _2124;
    wire _2122;
    wire _2121;
    wire _2120;
    wire [2:0] _2119;
    reg _2127;
    wire _2117;
    wire _2116;
    wire _2114;
    wire _2115;
    wire _2113;
    wire _2112;
    wire _2111;
    wire [2:0] _2110;
    reg _2118;
    wire _2108;
    wire _2107;
    wire _2105;
    wire _2106;
    wire _2104;
    wire _2103;
    wire _2102;
    wire [2:0] _2101;
    reg _2109;
    wire _2099;
    wire _2098;
    wire _2096;
    wire _2097;
    wire _2095;
    wire _2094;
    wire [2:0] _3462;
    wire _3459;
    wire [1:0] _3460;
    wire [3:0] _3461;
    wire [6:0] _3463;
    wire [7:0] _3464;
    wire [7:0] _3465;
    wire _2080;
    wire _2079;
    wire _2078;
    wire _2076;
    wire _2077;
    wire _2074;
    wire _2075;
    wire _2071;
    wire _2072;
    wire _2073;
    wire _2068;
    wire _2069;
    wire _2070;
    wire _2065;
    wire _2064;
    wire _2066;
    wire _2063;
    wire _2067;
    wire [7:0] _2081;
    wire _2050;
    wire _2056;
    wire [7:0] _2082;
    wire [7:0] _3457;
    wire [7:0] _3453;
    wire [7:0] _3451;
    wire [7:0] _3450;
    wire [7:0] _3449;
    wire [7:0] _3448;
    reg [7:0] _3452;
    wire [7:0] _3454;
    wire [7:0] _3455;
    wire [7:0] _2037;
    wire [7:0] _2035;
    wire [7:0] _2034;
    wire [7:0] _2033;
    wire [7:0] _2032;
    reg [7:0] _2036;
    wire [7:0] _2038;
    wire [7:0] _3446;
    wire [7:0] _3447;
    wire [7:0] _3456;
    wire [7:0] _3458;
    wire [7:0] _3466;
    wire _2026;
    wire _2027;
    wire _1653;
    wire [1:0] _3440;
    wire [1:0] _3436;
    wire [1:0] _1728;
    wire _3427;
    wire [1:0] _3429;
    wire _3426;
    wire [1:0] _3431;
    wire _3425;
    wire [1:0] _3433;
    wire [1:0] _3434;
    wire _1115;
    wire [15:0] _1110;
    wire _1111;
    wire _1112;
    wire _1109;
    wire _1113;
    wire _1116;
    wire [3:0] _1106;
    wire _1108;
    wire _1117;
    wire _1104;
    wire _1100;
    wire _1101;
    wire _1098;
    wire _1102;
    wire _1105;
    wire _1096;
    reg [2:0] _987;
    wire [15:0] _1091;
    wire _1092;
    wire _1089;
    wire _1093;
    wire _1087;
    wire _1094;
    wire _1097;
    wire [1:0] _1086;
    reg _1118;
    wire _1085;
    wire _1119;
    wire _1082;
    wire [3:0] _1080;
    reg _1081;
    wire _1083;
    wire [15:0] _1075;
    wire _1077;
    wire [16:0] _1070;
    wire [15:0] _1066;
    wire [16:0] _1067;
    wire [16:0] _1068;
    reg [16:0] _1071;
    wire _1072;
    wire _1073;
    wire [15:0] _1062;
    wire _1064;
    wire _976;
    wire [2:0] _978;
    wire _973;
    wire [2:0] _975;
    wire _979;
    wire [2:0] _980;
    wire _968;
    wire [2:0] _970;
    wire _965;
    wire [2:0] _967;
    wire _971;
    wire [2:0] _972;
    wire _981;
    wire [2:0] _982;
    wire _958;
    wire [2:0] _960;
    wire _955;
    wire [2:0] _957;
    wire _961;
    wire [2:0] _962;
    wire _950;
    wire [2:0] _952;
    wire [7:0] _946;
    wire _947;
    wire [2:0] _949;
    wire _953;
    wire [2:0] _954;
    wire _963;
    wire [2:0] _964;
    wire _983;
    wire [2:0] _984;
    wire [13:0] _1054;
    wire [16:0] _1055;
    wire [111:0] _945;
    wire [15:0] _1052;
    wire [16:0] _1053;
    wire [16:0] _1056;
    reg [16:0] _1059;
    wire [16:0] _1051;
    wire _1060;
    wire _1061;
    wire _1065;
    wire _1074;
    wire [1:0] _991;
    reg [15:0] _1048;
    wire _1050;
    wire _1078;
    wire [7:0] _1042;
    wire _1044;
    wire _1045;
    wire [7:0] _1039;
    wire _1041;
    wire _1046;
    wire [7:0] _1034;
    wire [7:0] _1032;
    wire [7:0] _1033;
    wire [7:0] _1035;
    wire _1037;
    wire _1031;
    wire _1038;
    wire _1047;
    wire _1079;
    wire _1084;
    wire _1120;
    wire f_fire3;
    wire _659;
    wire _655;
    wire _656;
    wire _653;
    wire _657;
    wire _660;
    wire [3:0] _650;
    wire _652;
    wire _661;
    wire _648;
    wire _644;
    wire _645;
    wire _642;
    wire _646;
    wire _649;
    wire _640;
    reg [2:0] _634;
    wire [15:0] _635;
    wire _636;
    wire _630;
    wire _637;
    wire _628;
    wire _638;
    wire _641;
    wire [1:0] _627;
    reg _662;
    wire _626;
    wire _663;
    wire _618;
    wire [3:0] _564;
    reg _617;
    wire _619;
    wire [15:0] _559;
    wire _561;
    wire [15:0] _550;
    wire [16:0] _551;
    wire [16:0] _552;
    reg [16:0] _555;
    wire _556;
    wire _557;
    wire [15:0] _546;
    wire _548;
    wire _512;
    wire [2:0] _532;
    wire _491;
    wire [2:0] _511;
    wire _533;
    wire [2:0] _534;
    wire _468;
    wire [2:0] _488;
    wire _447;
    wire [2:0] _467;
    wire _489;
    wire [2:0] _490;
    wire _535;
    wire [2:0] _536;
    wire _422;
    wire [2:0] _442;
    wire _401;
    wire [2:0] _421;
    wire _443;
    wire [2:0] _444;
    wire _378;
    wire [2:0] _398;
    wire [7:0] _356;
    wire _357;
    wire [2:0] _377;
    wire _399;
    wire [2:0] _400;
    wire _445;
    wire [2:0] _446;
    wire _537;
    wire [2:0] _538;
    wire [16:0] _539;
    wire [111:0] _352;
    wire [15:0] _353;
    wire [16:0] _354;
    wire [16:0] _540;
    reg [16:0] _543;
    wire [16:0] _329;
    wire _544;
    wire _545;
    wire _549;
    wire _558;
    wire [1:0] _315;
    reg [15:0] _325;
    wire _327;
    wire _562;
    wire [7:0] _309;
    wire _311;
    wire _312;
    wire [7:0] _298;
    wire _300;
    wire _313;
    wire [7:0] _293;
    wire [7:0] _291;
    wire [7:0] _292;
    wire [7:0] _294;
    wire _296;
    wire [127:0] _271;
    wire [2:0] _3410;
    wire [5:0] _1129;
    wire [5:0] _86;
    wire [5:0] _2180;
    wire [5:0] _88;
    wire _2170;
    wire [5:0] _2171;
    wire [5:0] _2172;
    wire [5:0] _2181;
    wire _2168;
    wire [5:0] _2182;
    wire [5:0] _2183;
    wire [5:0] _89;
    reg [5:0] _1130;
    wire [5:0] _2176;
    wire [5:0] _2175;
    wire [5:0] _2174;
    wire [5:0] _2173;
    reg [5:0] _2177;
    wire _2178;
    wire _2179;
    wire [2:0] _3406;
    wire [1:0] _1725;
    wire _3401;
    wire [2:0] _3403;
    wire [7:0] f_watch;
    wire [7:0] _1719;
    wire _1721;
    wire _1722;
    wire _1716;
    wire _1717;
    wire f_unexp_now;
    wire _2188;
    wire _2189;
    wire _2186;
    wire _2184;
    wire _2190;
    wire _90;
    reg _1713;
    wire _1714;
    wire [15:0] _3392;
    wire [15:0] _3393;
    wire _3389;
    wire _3390;
    wire _3391;
    wire [15:0] _3394;
    wire [2:0] _3334;
    wire [2:0] _3332;
    wire [2:0] _3331;
    wire [2:0] _3330;
    wire [2:0] _3329;
    wire _931;
    wire _927;
    wire _928;
    wire _925;
    wire _929;
    wire _932;
    wire [3:0] _922;
    wire _924;
    wire _933;
    wire _920;
    wire _916;
    wire _917;
    wire _914;
    wire _918;
    wire _921;
    wire _912;
    reg [2:0] _906;
    wire [15:0] _907;
    wire _908;
    wire _902;
    wire _909;
    wire _900;
    wire _910;
    wire _913;
    wire [1:0] _899;
    reg _934;
    wire _898;
    wire _935;
    wire _895;
    wire [3:0] _893;
    reg _894;
    wire _896;
    wire [15:0] _888;
    wire _890;
    wire [15:0] _879;
    wire [16:0] _880;
    wire [16:0] _881;
    reg [16:0] _884;
    wire _885;
    wire _886;
    wire [15:0] _875;
    wire _877;
    wire _859;
    wire [2:0] _861;
    wire _856;
    wire [2:0] _858;
    wire _862;
    wire [2:0] _863;
    wire _851;
    wire [2:0] _853;
    wire _848;
    wire [2:0] _850;
    wire _854;
    wire [2:0] _855;
    wire _864;
    wire [2:0] _865;
    wire _841;
    wire [2:0] _843;
    wire _838;
    wire [2:0] _840;
    wire _844;
    wire [2:0] _845;
    wire _833;
    wire [2:0] _835;
    wire [7:0] _829;
    wire _830;
    wire [2:0] _832;
    wire _836;
    wire [2:0] _837;
    wire _846;
    wire [2:0] _847;
    wire _866;
    wire [2:0] _867;
    wire [16:0] _868;
    wire [111:0] _825;
    wire [15:0] _826;
    wire [16:0] _827;
    wire [16:0] _869;
    reg [16:0] _872;
    wire [16:0] _824;
    wire _873;
    wire _874;
    wire _878;
    wire _887;
    wire [1:0] _820;
    reg [15:0] _821;
    wire _823;
    wire _891;
    wire [7:0] _814;
    wire _816;
    wire _817;
    wire [7:0] _811;
    wire _813;
    wire _818;
    wire [7:0] _806;
    wire [7:0] _804;
    wire [7:0] _805;
    wire [7:0] _807;
    wire _809;
    wire _803;
    wire _810;
    wire _819;
    wire _892;
    wire _897;
    wire _936;
    wire f_fire2;
    wire [1:0] _940;
    wire _795;
    wire _791;
    wire _792;
    wire _789;
    wire _793;
    wire _796;
    wire [3:0] _786;
    wire _788;
    wire _797;
    wire _784;
    wire _780;
    wire _781;
    wire _778;
    wire _782;
    wire _785;
    wire _776;
    reg [2:0] _770;
    wire [15:0] _771;
    wire _772;
    wire _766;
    wire _773;
    wire _764;
    wire _774;
    wire _777;
    wire [1:0] _763;
    reg _798;
    wire [1:0] _92;
    wire [1:0] _2191;
    wire [1:0] _93;
    reg [1:0] _623;
    wire _625;
    wire _762;
    wire _799;
    wire _759;
    wire _2195;
    wire _2193;
    wire _2196;
    wire _2198;
    wire _2200;
    wire _94;
    reg _616;
    wire [15:0] _96;
    wire [15:0] _98;
    wire [15:0] _2206;
    wire [15:0] _2207;
    wire [15:0] _2208;
    wire [15:0] _2210;
    wire [15:0] _99;
    reg [15:0] _2203;
    wire [14:0] _2204;
    wire [15:0] _2205;
    wire [15:0] _2211;
    wire [15:0] _2212;
    wire _2214;
    wire _2216;
    wire _2217;
    wire _2218;
    wire _2219;
    wire _2221;
    wire _2223;
    wire _100;
    reg _613;
    wire _2236;
    wire _2237;
    wire _2239;
    wire _2240;
    wire _2241;
    wire _2242;
    wire _2244;
    wire _101;
    reg _2226;
    wire _2238;
    wire _2247;
    wire [5:0] _2245;
    wire _2246;
    wire _2248;
    wire _2249;
    wire _2250;
    wire _2251;
    wire _2252;
    wire _2254;
    wire _2256;
    wire _102;
    reg _610;
    wire _2260;
    wire _2258;
    wire _2261;
    wire _2263;
    wire _2265;
    wire _103;
    reg _602;
    wire [15:0] _105;
    wire [15:0] _107;
    wire [15:0] _2271;
    wire [15:0] _2272;
    wire [15:0] _2273;
    wire [15:0] _2275;
    wire [15:0] _108;
    reg [15:0] _2268;
    wire [14:0] _2269;
    wire [15:0] _2270;
    wire [15:0] _2276;
    wire [15:0] _2277;
    wire _2279;
    wire _2281;
    wire _2282;
    wire _2283;
    wire _2284;
    wire _2286;
    wire _2288;
    wire _109;
    reg _599;
    wire _2301;
    wire _2302;
    wire _2304;
    wire _2305;
    wire _2306;
    wire _2307;
    wire _2309;
    wire _110;
    reg _2291;
    wire _2303;
    wire _2312;
    wire _2311;
    wire _2313;
    wire _2314;
    wire _2315;
    wire _2316;
    wire _2317;
    wire _2319;
    wire _2321;
    wire _111;
    reg _596;
    wire [7:0] _113;
    wire [6:0] _587;
    wire [6:0] _586;
    wire _588;
    wire [15:0] _583;
    wire _2326;
    wire _2325;
    wire _2327;
    wire _2324;
    wire _2328;
    wire _2323;
    wire _2329;
    wire [14:0] _2322;
    wire [15:0] _2330;
    wire [15:0] _114;
    reg [15:0] _584;
    wire _585;
    wire [3:0] _2349;
    wire [3:0] _2347;
    wire [3:0] _2350;
    wire _1740;
    wire _1949;
    wire _116;
    wire _1950;
    wire _1899;
    wire _1932;
    wire _2334;
    wire _1926;
    wire _1927;
    wire _2332;
    wire _1664;
    wire _1665;
    wire _1671;
    wire _1668;
    wire _1669;
    wire _1667;
    wire _1670;
    wire _1672;
    wire _2335;
    wire _117;
    reg _1651;
    wire _2343;
    wire _1923;
    wire _2339;
    wire _1907;
    wire _1908;
    wire _2337;
    wire _1591;
    wire [2:0] _1585;
    wire _1580;
    wire _1579;
    wire _1581;
    wire _1582;
    wire _1583;
    wire [2:0] _1586;
    wire _1588;
    wire _1589;
    wire _1560;
    wire _1590;
    wire _1592;
    wire _1556;
    wire _1557;
    wire _1593;
    wire _1645;
    wire _1644;
    wire _1646;
    wire _2340;
    wire _118;
    reg _1544;
    wire _2341;
    wire _1641;
    wire [2:0] _1635;
    wire _1630;
    wire _1629;
    wire _1631;
    wire _1632;
    wire _1633;
    wire [2:0] _1636;
    wire _1638;
    wire _1639;
    wire _1610;
    wire _1640;
    wire _1642;
    wire _1606;
    wire _1607;
    wire _1643;
    wire _2342;
    wire _2344;
    wire _119;
    wire _1900;
    wire _2345;
    wire [3:0] _2351;
    reg [3:0] _2354;
    wire [3:0] _120;
    wire _581;
    wire [6:0] _2371;
    wire [7:0] _2372;
    wire [6:0] _2369;
    wire _2367;
    wire _2366;
    wire _2365;
    wire _2364;
    wire _2363;
    wire _2362;
    wire _2361;
    wire _2360;
    wire [2:0] _2358;
    wire [2:0] _2357;
    wire [2:0] _2356;
    wire [2:0] _2355;
    reg [2:0] _2359;
    reg _2368;
    wire [7:0] _2370;
    wire [1:0] _1659;
    wire [1:0] _1658;
    wire [1:0] _1657;
    wire [1:0] _1656;
    reg [1:0] _1660;
    wire [1:0] _1662;
    reg [7:0] _2373;
    wire [7:0] _2374;
    wire [7:0] _121;
    reg [7:0] _576;
    wire _577;
    wire [6:0] _3144;
    wire [7:0] _3145;
    wire _3142;
    wire _3141;
    wire _3140;
    wire _3139;
    wire _3138;
    wire _3137;
    wire _3136;
    wire _3135;
    wire [7:0] _3143;
    wire [3:0] _3127;
    wire [3:0] _3125;
    wire [3:0] _3128;
    wire _2798;
    wire _3119;
    wire _1561;
    wire _2753;
    wire _2754;
    wire [1:0] _2757;
    wire _2746;
    wire _2747;
    wire _2748;
    wire _2749;
    wire [1:0] _2751;
    wire [2:0] _2732;
    wire [2:0] _2729;
    wire _2725;
    wire _2723;
    wire _2724;
    wire _2726;
    wire [2:0] _2730;
    wire _2721;
    wire [2:0] _2733;
    wire _2734;
    wire [2:0] _2715;
    wire _2711;
    wire _2709;
    wire _2710;
    wire _2712;
    wire [2:0] _2716;
    wire _2707;
    wire [2:0] _2718;
    wire _2719;
    wire _2735;
    wire _2736;
    wire _2737;
    wire _2703;
    wire _2701;
    wire _2704;
    wire [15:0] _2696;
    wire _2697;
    wire _2694;
    wire _2698;
    wire _2692;
    wire _2693;
    wire _2699;
    wire _2705;
    wire _2738;
    wire [1:0] _2740;
    wire [1:0] _2742;
    wire [1:0] _2688;
    wire _2684;
    wire [1:0] _2686;
    wire [1:0] _2689;
    wire _2464;
    wire _2465;
    wire _122;
    reg _2377;
    wire _2614;
    wire _2612;
    wire _2613;
    reg _2615;
    wire [2:0] _124;
    wire [2:0] _2596;
    wire [2:0] _2597;
    wire [2:0] _2592;
    wire _2588;
    wire _2586;
    wire _2587;
    wire _2589;
    wire [2:0] _2593;
    wire _2584;
    wire [2:0] _2598;
    wire [2:0] _2599;
    wire [2:0] _2578;
    wire [2:0] _2579;
    wire [2:0] _2574;
    wire _2460;
    wire _2459;
    wire _2458;
    wire _2457;
    wire _2456;
    wire _2455;
    wire _2454;
    wire _2450;
    wire _2449;
    wire _2448;
    wire _2447;
    wire _2446;
    wire _2445;
    wire _2444;
    wire [7:0] _2441;
    wire [6:0] _1917;
    wire [7:0] _1918;
    wire [6:0] _1915;
    wire [7:0] _1916;
    wire [7:0] _1919;
    wire [7:0] _2470;
    wire [7:0] _2471;
    wire [7:0] _2472;
    wire [7:0] _2466;
    wire [7:0] _2467;
    wire [7:0] _2468;
    wire [7:0] _2469;
    wire [7:0] _2473;
    wire [7:0] _125;
    reg [7:0] _1914;
    wire _2381;
    wire _2378;
    wire _2379;
    wire _2382;
    wire [7:0] _2442;
    wire _2443;
    wire [7:0] _2451;
    wire _127;
    wire [7:0] _2452;
    wire _2453;
    wire [2:0] _2481;
    wire [2:0] _2482;
    wire [2:0] _2483;
    wire [2:0] _2484;
    wire [2:0] _2475;
    wire [2:0] _2476;
    wire [2:0] _2477;
    wire [2:0] _2478;
    wire [2:0] _2479;
    wire [2:0] _2485;
    wire [2:0] _2487;
    wire [2:0] _128;
    reg [2:0] _1554;
    reg _2461;
    wire _130;
    wire [31:0] _132;
    wire [30:0] _2529;
    wire [31:0] _2531;
    wire _2523;
    wire _2524;
    wire [31:0] _2526;
    wire [30:0] _2520;
    wire [31:0] _2522;
    wire [31:0] _2527;
    wire [31:0] _2528;
    wire [5:0] _134;
    wire [5:0] _2497;
    wire [5:0] _2498;
    wire [5:0] _2499;
    wire [5:0] _2500;
    wire [5:0] _2491;
    wire [5:0] _2492;
    wire [5:0] _2493;
    wire [5:0] _2494;
    wire [5:0] _2495;
    wire [5:0] _2501;
    wire [5:0] _2502;
    wire [5:0] _2504;
    wire [5:0] _135;
    reg [5:0] _1574;
    wire _1576;
    wire _1577;
    wire _2228;
    wire _2227;
    wire _2229;
    wire _2230;
    wire [31:0] _2532;
    wire [31:0] _2533;
    wire [31:0] _2534;
    wire [31:0] _137;
    wire _2511;
    wire _2512;
    wire [31:0] _2514;
    wire [30:0] _2508;
    wire [31:0] _2510;
    wire [31:0] _2515;
    wire [30:0] _2505;
    wire [31:0] _2507;
    wire [31:0] _2516;
    wire [31:0] _2517;
    wire [31:0] _2518;
    wire [31:0] _2519;
    wire [31:0] _2535;
    wire [31:0] _2536;
    wire [31:0] _2538;
    wire [31:0] _138;
    reg [31:0] _2233;
    wire _2234;
    wire _2235;
    wire [15:0] _140;
    wire [15:0] _2558;
    wire _1546;
    wire _1551;
    wire [15:0] _2559;
    wire _1545;
    wire [15:0] _2560;
    wire _2541;
    wire _2539;
    wire _2540;
    wire _2542;
    wire _2544;
    wire _141;
    reg _1503;
    wire _1504;
    wire _1501;
    wire _1505;
    wire _2546;
    wire _2547;
    wire _2548;
    wire _2550;
    wire _142;
    reg _1497;
    wire _1498;
    wire _1495;
    wire _1499;
    wire _1506;
    wire _1507;
    wire _1508;
    wire [15:0] _2561;
    wire [15:0] _2552;
    wire [15:0] _2553;
    wire [15:0] _2554;
    wire [15:0] _2555;
    wire [15:0] _2556;
    wire [15:0] _2562;
    wire [15:0] _2564;
    wire [15:0] _143;
    reg [15:0] _1549;
    wire _1550;
    wire _2462;
    wire _2463;
    wire _2570;
    wire _2568;
    wire _2569;
    wire _2571;
    wire [2:0] _2575;
    wire _2566;
    wire [2:0] _2580;
    wire [2:0] _2581;
    wire [2:0] _2582;
    wire [2:0] _2600;
    wire [2:0] _2602;
    wire [2:0] _144;
    reg [2:0] _1491;
    wire _1492;
    wire [1:0] _146;
    wire _1487;
    wire _1488;
    wire _1493;
    wire _1571;
    wire _1578;
    wire _2616;
    wire _2617;
    wire _1566;
    wire _1564;
    wire _1567;
    wire _1568;
    wire _1569;
    wire _2609;
    wire _2606;
    wire _2603;
    wire _2604;
    wire _2607;
    wire _2608;
    wire _2610;
    wire _2618;
    wire _2620;
    wire _2622;
    wire _2624;
    wire _2626;
    wire _147;
    reg _1475;
    wire _1476;
    wire _1477;
    wire _1470;
    wire _1471;
    wire _1467;
    wire _149;
    wire _1464;
    wire _1465;
    wire _1466;
    wire _1468;
    wire _1472;
    wire _1473;
    wire _1478;
    wire [1:0] _2691;
    wire _1459;
    wire _1460;
    wire _1455;
    wire _1454;
    wire _1453;
    wire _1452;
    wire _1451;
    wire _1450;
    wire _1449;
    wire _1448;
    reg _1456;
    wire _1457;
    wire _1446;
    wire _1445;
    wire _1444;
    wire _1443;
    wire _1442;
    wire _1441;
    wire _1440;
    wire _1439;
    wire [2:0] _151;
    reg _1447;
    wire _1458;
    wire _153;
    wire _1461;
    wire _1437;
    wire _1434;
    wire _1427;
    wire _1425;
    wire [13:0] _1416;
    wire [15:0] _1417;
    wire [14:0] _1413;
    wire [15:0] _1414;
    wire [15:0] _1418;
    wire [14:0] _1410;
    wire [15:0] _1411;
    wire _1408;
    wire [15:0] _1419;
    reg [15:0] _1422;
    wire _1423;
    wire [13:0] _1400;
    wire [15:0] _1401;
    reg [15:0] _1404;
    wire _2672;
    wire _2673;
    wire [15:0] _2674;
    wire [15:0] _2676;
    wire [15:0] _2678;
    wire _2656;
    wire [14:0] _1429;
    wire [15:0] _1430;
    reg [15:0] _1433;
    wire [16:0] _2652;
    wire _2653;
    wire [16:0] _2646;
    reg [16:0] _2649;
    wire [16:0] _2641;
    wire [15:0] _155;
    wire [16:0] _2640;
    wire [16:0] _2642;
    reg [16:0] _2645;
    wire [7:0] _157;
    wire [8:0] _2660;
    wire [7:0] _2662;
    wire [7:0] _2663;
    wire [7:0] _2664;
    wire [7:0] _2666;
    wire [7:0] _158;
    reg [7:0] _2634;
    wire [8:0] _2659;
    wire [8:0] _2661;
    wire _2667;
    wire _2668;
    wire _2669;
    wire _2671;
    wire _159;
    reg _2639;
    wire [16:0] _2650;
    wire [16:0] _2636;
    wire _2651;
    wire _2654;
    wire _2657;
    wire _2635;
    wire _2658;
    wire [15:0] _2680;
    wire _2630;
    wire _2628;
    wire _607;
    wire _2627;
    wire _2629;
    wire _2631;
    wire [15:0] _2681;
    wire [15:0] _2683;
    wire [15:0] _160;
    reg [15:0] _1398;
    wire _1405;
    wire _1406;
    wire _1395;
    wire _1407;
    wire _1424;
    wire _1426;
    wire _1435;
    wire [1:0] _162;
    wire _1391;
    wire _1392;
    wire _1389;
    wire _1393;
    wire _1386;
    wire _1382;
    wire _1381;
    wire _1380;
    wire _1379;
    wire _1378;
    wire _1377;
    wire _1376;
    wire _1375;
    reg _1383;
    wire _1373;
    wire _1372;
    wire _1371;
    wire _1370;
    wire _1369;
    wire _1368;
    wire _1367;
    wire _1366;
    wire [2:0] _164;
    reg _1374;
    wire _1384;
    wire _1385;
    wire _1387;
    wire _1394;
    wire _1438;
    wire _166;
    wire _1462;
    wire _168;
    wire _1365;
    wire _1463;
    wire [1:0] _2743;
    wire _1559;
    wire [1:0] _2745;
    wire _2489;
    wire [1:0] _2752;
    wire _1362;
    wire [1:0] _2758;
    wire _1360;
    wire [1:0] _2760;
    wire [1:0] _169;
    reg [1:0] _605;
    wire _1364;
    wire _1562;
    wire _1570;
    wire _3118;
    wire _3120;
    wire _3116;
    wire _1611;
    wire _3094;
    wire _3095;
    wire [1:0] _3098;
    wire _3087;
    wire _3088;
    wire _3089;
    wire _3090;
    wire [1:0] _3092;
    wire [2:0] _3073;
    wire [2:0] _3070;
    wire _3066;
    wire _3064;
    wire _3065;
    wire _3067;
    wire [2:0] _3071;
    wire _3062;
    wire [2:0] _3074;
    wire _3075;
    wire [2:0] _3056;
    wire _3052;
    wire _3050;
    wire _3051;
    wire _3053;
    wire [2:0] _3057;
    wire _3048;
    wire [2:0] _3059;
    wire _3060;
    wire _3076;
    wire _3077;
    wire _3078;
    wire _3044;
    wire _3042;
    wire _3045;
    wire [15:0] _3037;
    wire _3038;
    wire _3035;
    wire _3039;
    wire _3033;
    wire _3034;
    wire _3040;
    wire _3046;
    wire _3079;
    wire [1:0] _3081;
    wire [1:0] _3083;
    wire [1:0] _3029;
    wire _3025;
    wire [1:0] _3027;
    wire [1:0] _3030;
    wire _2793;
    wire _2794;
    wire _170;
    reg _2763;
    wire _2951;
    wire _2949;
    wire _2950;
    reg _2952;
    wire [2:0] _172;
    wire [2:0] _2933;
    wire [2:0] _2934;
    wire [2:0] _2929;
    wire _2925;
    wire _2923;
    wire _2924;
    wire _2926;
    wire [2:0] _2930;
    wire _2921;
    wire [2:0] _2935;
    wire [2:0] _2936;
    wire [2:0] _2915;
    wire [2:0] _2916;
    wire [2:0] _2911;
    wire _2789;
    wire _2788;
    wire _2787;
    wire _2786;
    wire _2785;
    wire _2784;
    wire _2783;
    wire _2779;
    wire _2778;
    wire _2777;
    wire _2776;
    wire _2775;
    wire _2774;
    wire _2773;
    wire _2436;
    wire _2437;
    reg [7:0] _2438;
    wire _2430;
    wire _2431;
    reg [7:0] _2432;
    wire _2424;
    wire _2425;
    reg [7:0] _2426;
    wire _2418;
    wire _2419;
    reg [7:0] _2420;
    wire _2412;
    wire _2413;
    reg [7:0] _2414;
    wire _2406;
    wire _2407;
    reg [7:0] _2408;
    wire _2400;
    wire _2401;
    reg [7:0] _2402;
    wire [2:0] _2796;
    wire [2:0] _2797;
    wire [2:0] _173;
    reg [2:0] _2392;
    wire _2394;
    wire _2395;
    wire [7:0] _175;
    reg [7:0] _2396;
    wire [2:0] _2801;
    wire [2:0] _2802;
    wire [2:0] _176;
    reg [2:0] _2385;
    reg [7:0] _2439;
    wire [7:0] _2770;
    wire [6:0] _1943;
    wire [7:0] _1944;
    wire [6:0] _1941;
    wire [7:0] _1942;
    wire [7:0] _1945;
    wire [7:0] _2807;
    wire [7:0] _2808;
    wire [7:0] _2809;
    wire [7:0] _2803;
    wire [7:0] _2804;
    wire [7:0] _2805;
    wire [7:0] _2806;
    wire [7:0] _2810;
    wire [7:0] _177;
    reg [7:0] _1940;
    wire _2767;
    wire _2764;
    wire _2765;
    wire _2768;
    wire [7:0] _2771;
    wire _2772;
    wire [7:0] _2780;
    wire _179;
    wire [7:0] _2781;
    wire _2782;
    wire [2:0] _2818;
    wire [2:0] _2819;
    wire [2:0] _2820;
    wire [2:0] _2821;
    wire [2:0] _2812;
    wire [2:0] _2813;
    wire [2:0] _2814;
    wire [2:0] _2815;
    wire [2:0] _2816;
    wire [2:0] _2822;
    wire [2:0] _2824;
    wire [2:0] _180;
    reg [2:0] _1604;
    reg _2790;
    wire _182;
    wire [31:0] _184;
    wire [30:0] _2866;
    wire [31:0] _2868;
    wire _2860;
    wire _2861;
    wire [31:0] _2863;
    wire [30:0] _2857;
    wire [31:0] _2859;
    wire [31:0] _2864;
    wire [31:0] _2865;
    wire [5:0] _186;
    wire [5:0] _2834;
    wire [5:0] _2835;
    wire [5:0] _2836;
    wire [5:0] _2837;
    wire [5:0] _2828;
    wire [5:0] _2829;
    wire [5:0] _2830;
    wire [5:0] _2831;
    wire [5:0] _2832;
    wire [5:0] _2838;
    wire [5:0] _2839;
    wire [5:0] _2841;
    wire [5:0] _187;
    reg [5:0] _1624;
    wire _1626;
    wire _1627;
    wire _2293;
    wire _2292;
    wire _2294;
    wire _2295;
    wire [31:0] _2869;
    wire [31:0] _2870;
    wire [31:0] _2871;
    wire [31:0] _189;
    wire _2848;
    wire _2849;
    wire [31:0] _2851;
    wire [30:0] _2845;
    wire [31:0] _2847;
    wire [31:0] _2852;
    wire [30:0] _2842;
    wire [31:0] _2844;
    wire [31:0] _2853;
    wire [31:0] _2854;
    wire [31:0] _2855;
    wire [31:0] _2856;
    wire [31:0] _2872;
    wire [31:0] _2873;
    wire [31:0] _2875;
    wire [31:0] _190;
    reg [31:0] _2298;
    wire _2299;
    wire _2300;
    wire [15:0] _192;
    wire [15:0] _2895;
    wire _1596;
    wire _1601;
    wire [15:0] _2896;
    wire _1595;
    wire [15:0] _2897;
    wire _2878;
    wire _2876;
    wire _2877;
    wire _2879;
    wire _2881;
    wire _193;
    reg _1346;
    wire _1347;
    wire _1344;
    wire _1348;
    wire _2883;
    wire _2884;
    wire _2885;
    wire _2887;
    wire _194;
    reg _1340;
    wire _1341;
    wire _1338;
    wire _1342;
    wire _1349;
    wire _1350;
    wire _1351;
    wire [15:0] _2898;
    wire [15:0] _2889;
    wire [15:0] _2890;
    wire [15:0] _2891;
    wire [15:0] _2892;
    wire [15:0] _2893;
    wire [15:0] _2899;
    wire [15:0] _2901;
    wire [15:0] _195;
    reg [15:0] _1599;
    wire _1600;
    wire _2791;
    wire _2792;
    wire _2907;
    wire _2905;
    wire _2906;
    wire _2908;
    wire [2:0] _2912;
    wire _2903;
    wire [2:0] _2917;
    wire [2:0] _2918;
    wire [2:0] _2919;
    wire [2:0] _2937;
    wire [2:0] _2939;
    wire [2:0] _196;
    reg [2:0] _1334;
    wire _1335;
    wire [1:0] _198;
    wire _1330;
    wire _1331;
    wire _1336;
    wire _1621;
    wire _1628;
    wire _2953;
    wire _2954;
    wire _1616;
    wire _1614;
    wire _1617;
    wire _1618;
    wire _1619;
    wire _2946;
    wire _2943;
    wire _2940;
    wire _2941;
    wire _2944;
    wire _2945;
    wire _2947;
    wire _2955;
    wire _2957;
    wire _2959;
    wire _2961;
    wire _2963;
    wire _199;
    reg _1318;
    wire _1319;
    wire _1320;
    wire _1313;
    wire _1314;
    wire _1310;
    wire _201;
    wire _1307;
    wire _1308;
    wire _1309;
    wire _1311;
    wire _1315;
    wire _1316;
    wire _1321;
    wire [1:0] _3032;
    wire _1302;
    wire _1303;
    wire _1298;
    wire _1297;
    wire _1296;
    wire _1295;
    wire _1294;
    wire _1293;
    wire _1292;
    wire _1291;
    reg _1299;
    wire _1300;
    wire _1289;
    wire _1288;
    wire _1287;
    wire _1286;
    wire _1285;
    wire _1284;
    wire _1283;
    wire _1282;
    wire [2:0] _203;
    reg _1290;
    wire _1301;
    wire _205;
    wire _1304;
    wire _1280;
    wire _1277;
    wire _1270;
    wire _1268;
    wire [13:0] _1259;
    wire [15:0] _1260;
    wire [14:0] _1256;
    wire [15:0] _1257;
    wire [15:0] _1261;
    wire [14:0] _1253;
    wire [15:0] _1254;
    wire _1251;
    wire [15:0] _1262;
    reg [15:0] _1265;
    wire _1266;
    wire [13:0] _1243;
    wire [15:0] _1244;
    reg [15:0] _1247;
    wire _3009;
    wire _3010;
    wire [15:0] _3011;
    wire [15:0] _3013;
    wire [15:0] _3015;
    wire _2993;
    wire [14:0] _1272;
    wire [15:0] _1273;
    reg [15:0] _1276;
    wire [16:0] _2989;
    wire _2990;
    wire [16:0] _2983;
    reg [16:0] _2986;
    wire [15:0] _207;
    wire [16:0] _2977;
    wire [16:0] _2979;
    reg [16:0] _2982;
    wire [7:0] _209;
    wire [8:0] _2997;
    wire [7:0] _2999;
    wire [7:0] _3000;
    wire [7:0] _3001;
    wire [7:0] _3003;
    wire [7:0] _210;
    reg [7:0] _2971;
    wire [8:0] _2996;
    wire [8:0] _2998;
    wire _3004;
    wire _3005;
    wire _3006;
    wire _3008;
    wire _211;
    reg _2976;
    wire [16:0] _2987;
    wire [16:0] _2973;
    wire _2988;
    wire _2991;
    wire _2994;
    wire _2972;
    wire _2995;
    wire [15:0] _3017;
    wire _2967;
    wire _2965;
    wire _593;
    wire _2964;
    wire _2966;
    wire _2968;
    wire [15:0] _3018;
    wire [15:0] _3020;
    wire [15:0] _212;
    reg [15:0] _1241;
    wire _1248;
    wire _1249;
    wire _1238;
    wire _1250;
    wire _1267;
    wire _1269;
    wire _1278;
    wire [1:0] _214;
    wire _1234;
    wire _1235;
    wire _1232;
    wire _1236;
    wire _1229;
    wire _1225;
    wire _1224;
    wire _1223;
    wire _1222;
    wire _1221;
    wire _1220;
    wire _1219;
    wire _1218;
    reg _1226;
    wire _1216;
    wire _1215;
    wire _1214;
    wire _1213;
    wire _1212;
    wire _1211;
    wire _1210;
    wire _1209;
    wire [2:0] _216;
    reg _1217;
    wire _1227;
    wire _1228;
    wire _1230;
    wire _1237;
    wire _1281;
    wire _218;
    wire _1305;
    wire _220;
    wire _1208;
    wire _1306;
    wire [1:0] _3084;
    wire _1609;
    wire [1:0] _3086;
    wire _2826;
    wire [1:0] _3093;
    wire _1205;
    wire [1:0] _3099;
    wire [2:0] _2061;
    wire [2:0] _2060;
    wire [2:0] _2059;
    wire [2:0] _2058;
    reg [2:0] _2062;
    wire _2054;
    wire _2053;
    wire _2052;
    wire _2051;
    reg _2055;
    wire _3021;
    wire _3022;
    wire [2:0] _3024;
    wire [2:0] _221;
    wire _1203;
    wire [1:0] _3101;
    wire [1:0] _222;
    reg [1:0] _591;
    wire _1207;
    wire _1612;
    wire _1620;
    wire _3115;
    wire _3117;
    wire _3121;
    wire _3112;
    wire _3110;
    wire _3113;
    wire _3114;
    wire _3122;
    wire _223;
    wire _2799;
    wire _2007;
    wire _2388;
    wire _225;
    wire _2389;
    wire _3123;
    wire [3:0] _3129;
    reg [3:0] _3132;
    wire [3:0] _226;
    wire _579;
    wire [7:0] _3134;
    wire [1:0] _3107;
    wire [1:0] _3105;
    wire [1:0] _3104;
    wire [1:0] _3103;
    wire [1:0] _3102;
    reg [1:0] _3106;
    wire [1:0] _3108;
    reg [7:0] _3146;
    wire [7:0] _3147;
    wire [7:0] _227;
    reg [7:0] _572;
    wire _573;
    wire [7:0] _3158;
    wire [7:0] _3157;
    wire [7:0] _3155;
    wire [7:0] _3156;
    wire [1:0] _3153;
    wire [111:0] _990;
    wire [1:0] _3151;
    wire [111:0] _802;
    wire [1:0] _3150;
    wire [1:0] _3149;
    wire [1:0] _3148;
    reg [1:0] _3152;
    wire [1:0] _3154;
    reg [7:0] _3159;
    wire [7:0] _3160;
    wire [7:0] _228;
    reg [7:0] _567;
    wire _569;
    wire [3:0] _757;
    reg _758;
    wire _760;
    wire [15:0] _752;
    wire _754;
    wire [15:0] _743;
    wire [16:0] _744;
    wire [16:0] _745;
    reg [16:0] _748;
    wire _749;
    wire _750;
    wire [15:0] _739;
    wire _741;
    wire [2:0] _527;
    wire [2:0] _3176;
    wire _3172;
    wire _3173;
    wire _3170;
    wire _3174;
    wire [2:0] _3177;
    wire _3167;
    wire _3168;
    wire _3166;
    wire _3169;
    wire [2:0] _3179;
    wire _3163;
    wire [2:0] _3165;
    wire _3162;
    wire [2:0] _3180;
    wire [2:0] _229;
    reg [2:0] _523;
    wire _525;
    wire [2:0] _528;
    wire _518;
    wire _519;
    wire _517;
    wire _520;
    wire [2:0] _530;
    wire _514;
    wire _515;
    wire [2:0] _531;
    wire _723;
    wire [2:0] _725;
    wire [2:0] _506;
    wire [2:0] _3195;
    wire _3191;
    wire _3192;
    wire _3189;
    wire _3193;
    wire [2:0] _3196;
    wire _3186;
    wire _3187;
    wire _3185;
    wire _3188;
    wire [2:0] _3198;
    wire _3182;
    wire [2:0] _3184;
    wire _3181;
    wire [2:0] _3199;
    wire [2:0] _230;
    reg [2:0] _502;
    wire _504;
    wire [2:0] _507;
    wire _497;
    wire _498;
    wire _496;
    wire _499;
    wire [2:0] _509;
    wire _493;
    wire _494;
    wire [2:0] _510;
    wire _720;
    wire [2:0] _722;
    wire _726;
    wire [2:0] _727;
    wire [2:0] _483;
    wire [2:0] _3214;
    wire _3210;
    wire _3211;
    wire _3208;
    wire _3212;
    wire [2:0] _3215;
    wire _3205;
    wire _3206;
    wire _3204;
    wire _3207;
    wire [2:0] _3217;
    wire _3201;
    wire [2:0] _3203;
    wire _3200;
    wire [2:0] _3218;
    wire [2:0] _231;
    reg [2:0] _479;
    wire _481;
    wire [2:0] _484;
    wire _474;
    wire _475;
    wire _473;
    wire _476;
    wire [2:0] _486;
    wire _470;
    wire _471;
    wire [2:0] _487;
    wire _715;
    wire [2:0] _717;
    wire [2:0] _462;
    wire [2:0] _3233;
    wire _3229;
    wire _3230;
    wire _3227;
    wire _3231;
    wire [2:0] _3234;
    wire _3224;
    wire _3225;
    wire _3223;
    wire _3226;
    wire [2:0] _3236;
    wire _3220;
    wire [2:0] _3222;
    wire _3219;
    wire [2:0] _3237;
    wire [2:0] _232;
    reg [2:0] _458;
    wire _460;
    wire [2:0] _463;
    wire _453;
    wire _454;
    wire _452;
    wire _455;
    wire [2:0] _465;
    wire _449;
    wire _450;
    wire [2:0] _466;
    wire _712;
    wire [2:0] _714;
    wire _718;
    wire [2:0] _719;
    wire _728;
    wire [2:0] _729;
    wire [2:0] _437;
    wire [2:0] _3252;
    wire _3248;
    wire _3249;
    wire _3246;
    wire _3250;
    wire [2:0] _3253;
    wire _3243;
    wire _3244;
    wire _3242;
    wire _3245;
    wire [2:0] _3255;
    wire _3239;
    wire [2:0] _3241;
    wire _3238;
    wire [2:0] _3256;
    wire [2:0] _233;
    reg [2:0] _433;
    wire _435;
    wire [2:0] _438;
    wire _428;
    wire _429;
    wire _427;
    wire _430;
    wire [2:0] _440;
    wire _424;
    wire _425;
    wire [2:0] _441;
    wire _705;
    wire [2:0] _707;
    wire [2:0] _416;
    wire [2:0] _3271;
    wire _3267;
    wire _3268;
    wire _3265;
    wire _3269;
    wire [2:0] _3272;
    wire _3262;
    wire _3263;
    wire _3261;
    wire _3264;
    wire [2:0] _3274;
    wire _3258;
    wire [2:0] _3260;
    wire _3257;
    wire [2:0] _3275;
    wire [2:0] _234;
    reg [2:0] _412;
    wire _414;
    wire [2:0] _417;
    wire _407;
    wire _408;
    wire _406;
    wire _409;
    wire [2:0] _419;
    wire _403;
    wire _404;
    wire [2:0] _420;
    wire _702;
    wire [2:0] _704;
    wire _708;
    wire [2:0] _709;
    wire [2:0] _393;
    wire [2:0] _3290;
    wire _3286;
    wire _3287;
    wire _3284;
    wire _3288;
    wire [2:0] _3291;
    wire _3281;
    wire _3282;
    wire _3280;
    wire _3283;
    wire [2:0] _3293;
    wire _3277;
    wire [2:0] _3279;
    wire _3276;
    wire [2:0] _3294;
    wire [2:0] _235;
    reg [2:0] _389;
    wire _391;
    wire [2:0] _394;
    wire _384;
    wire _385;
    wire _383;
    wire _386;
    wire [2:0] _396;
    wire _380;
    wire _381;
    wire [2:0] _397;
    wire _697;
    wire [2:0] _699;
    wire [2:0] _372;
    wire [2:0] _3309;
    wire _3305;
    wire _3306;
    wire _3303;
    wire _3307;
    wire [2:0] _3310;
    wire _3300;
    wire _3301;
    wire _3299;
    wire _3302;
    wire [2:0] _3312;
    wire _3296;
    wire [2:0] _3298;
    wire _3295;
    wire [2:0] _3313;
    wire [2:0] _236;
    reg [2:0] _368;
    wire _370;
    wire [2:0] _373;
    wire _363;
    wire _364;
    wire _362;
    wire _365;
    wire [2:0] _375;
    wire _359;
    wire _360;
    wire [2:0] _376;
    wire [7:0] _693;
    wire _694;
    wire [2:0] _696;
    wire _700;
    wire [2:0] _701;
    wire _710;
    wire [2:0] _711;
    wire _730;
    wire [2:0] _731;
    wire [16:0] _732;
    wire _3316;
    wire [127:0] _3317;
    wire _3314;
    wire [127:0] _3318;
    wire [127:0] _237;
    reg [127:0] _281;
    wire _348;
    wire _349;
    wire [127:0] _350;
    wire _3321;
    wire [127:0] _3322;
    wire _3319;
    wire [127:0] _3323;
    wire [127:0] _238;
    reg [127:0] _278;
    wire _344;
    wire _345;
    wire [127:0] _346;
    wire _3326;
    wire [127:0] _3327;
    wire _3324;
    wire [127:0] _3328;
    wire [127:0] _239;
    reg [127:0] _275;
    wire _340;
    wire _341;
    wire [127:0] _342;
    wire [127:0] _241;
    wire _336;
    wire _337;
    wire [127:0] _338;
    wire [511:0] _351;
    wire [111:0] _689;
    wire [15:0] _690;
    wire [16:0] _691;
    wire [16:0] _733;
    reg [16:0] _736;
    wire gnd;
    wire [16:0] _688;
    wire _737;
    wire _738;
    wire _742;
    wire _751;
    wire [15:0] _3356;
    wire _3352;
    wire _3353;
    wire _3354;
    wire [15:0] _3357;
    wire _3336;
    wire _3337;
    wire [15:0] _3359;
    wire [15:0] _3361;
    wire [15:0] _242;
    reg [15:0] _324;
    wire [15:0] _3373;
    wire _3369;
    wire _3370;
    wire [8:0] _3348;
    wire _3349;
    wire [5:0] _3346;
    wire [5:0] _3345;
    wire _3347;
    wire [8:0] _3340;
    wire [8:0] _3362;
    wire [8:0] _3363;
    wire [8:0] _3365;
    wire [8:0] _243;
    reg [8:0] _3341;
    wire [2:0] _3342;
    wire _3344;
    wire [1:0] _3338;
    reg _3350;
    wire _3371;
    wire [15:0] _3374;
    wire _3366;
    wire _3367;
    wire [15:0] _3376;
    wire [15:0] _3378;
    wire [15:0] _244;
    reg [15:0] _321;
    wire [1:0] _684;
    reg [15:0] _685;
    wire _687;
    wire _755;
    reg [7:0] _306;
    wire [7:0] f_chg_now;
    wire _3380;
    wire [7:0] _3382;
    wire _3379;
    wire [7:0] _3383;
    wire [7:0] _3385;
    wire [7:0] _245;
    reg [7:0] _303;
    wire [7:0] f_changed_all;
    wire [7:0] _678;
    wire _680;
    wire _681;
    wire [7:0] _675;
    wire _677;
    wire _682;
    wire [7:0] _670;
    wire [7:0] _668;
    wire vdd;
    wire _247;
    wire _249;
    wire [7:0] _251;
    reg [7:0] _287;
    reg [7:0] _290;
    wire [7:0] _669;
    wire [7:0] _671;
    wire _673;
    wire [111:0] _666;
    wire _667;
    wire _674;
    wire _683;
    wire _756;
    wire _761;
    wire _800;
    wire f_fire1;
    wire [1:0] _942;
    wire [1:0] f_winner;
    reg [2:0] _3333;
    wire [2:0] _3335;
    wire _3386;
    wire _3387;
    wire [15:0] _3396;
    wire [15:0] _3398;
    wire [15:0] _252;
    reg [15:0] _318;
    wire [1:0] _1707;
    reg [15:0] _1708;
    wire [15:0] _1706;
    wire _1709;
    wire [63:0] _1688;
    wire _1704;
    wire _1702;
    wire _1703;
    wire _1705;
    wire _1710;
    wire _1715;
    wire _1724;
    wire [2:0] _3404;
    wire [2:0] _3407;
    wire _3400;
    wire [2:0] _3408;
    wire _3399;
    wire [2:0] _3411;
    wire [2:0] _3413;
    wire [2:0] _253;
    reg [2:0] _334;
    wire _3416;
    wire [127:0] _3417;
    wire _3414;
    wire [127:0] _3418;
    wire [127:0] _254;
    reg [127:0] _272;
    wire [511:0] _282;
    wire [111:0] _283;
    wire _284;
    wire _297;
    wire _314;
    wire _563;
    wire _620;
    wire _664;
    wire f_in_eval;
    wire f_fire0;
    wire _1029;
    wire _1030;
    wire _1122;
    wire [1:0] _3437;
    wire _3422;
    wire [1:0] _3424;
    wire _3420;
    wire [1:0] _3438;
    wire _3419;
    wire [1:0] _3441;
    wire _256;
    wire [1:0] _3443;
    wire [1:0] _3445;
    wire [1:0] _257;
    reg [1:0] _267;
    wire f_in_fetch;
    wire _1654;
    wire _1655;
    wire _2028;
    wire [7:0] _3467;
    wire _259;
    wire [7:0] _3469;
    wire [7:0] _260;
    reg [7:0] _2092;
    wire _2093;
    wire [23:0] _262;
    wire [2:0] _2089;
    reg _2100;
    wire [7:0] _2164;
    wire [7:0] _3471;
    assign _1173 = _50[11:0];
    assign _1170 = _1163 < _1160;
    assign _1171 = _1145 & _1170;
    assign _1172 = _1171 ? _1160 : _1163;
    assign _1174 = _1172 < _1173;
    assign _1175 = _1174 ? _1173 : _1172;
    assign _1176 = _1156 ? _1172 : _1175;
    assign _1162 = 12'b000000000000;
    assign _1022 = 12'b111111111111;
    assign _1019 = _1017[11:0];
    assign _1016 = 13'b0000000000000;
    assign _1013 = 10'b0000000000;
    assign _1014 = { _1013,
                     _1010 };
    assign _1015 = _1006 - _1014;
    assign _1009 = 3'b000;
    always @* begin
        case (f_winner)
        0:
            _988 <= _634;
        1:
            _988 <= _770;
        2:
            _988 <= _906;
        default:
            _988 <= _987;
        endcase
    end
    assign _1 = _988;
    always @(posedge _249) begin
        if (_247)
            _1010 <= _1009;
        else
            _1010 <= _1;
    end
    assign _1011 = { _1013,
                     _1010 };
    assign _996 = 13'b1111111111111;
    assign _995 = _993[12:0];
    assign _989 = 16'b0001111111111111;
    assign _994 = _989 < _993;
    assign _997 = _994 ? _996 : _995;
    assign _2 = _997;
    always @(posedge _249) begin
        if (_247)
            _1006 <= _1016;
        else
            _1006 <= _2;
    end
    assign _1012 = _1006 < _1011;
    assign _1017 = _1012 ? _1016 : _1015;
    assign _1003 = 13'b0111111111111;
    assign _1018 = _1003 < _1017;
    assign _1021 = _1018 ? _1022 : _1019;
    assign _1001 = 1'b0;
    assign _998 = 16'b1111111111111111;
    assign _999 = _993 == _998;
    assign _3 = _999;
    always @(posedge _249) begin
        if (_247)
            _1002 <= _1001;
        else
            _1002 <= _3;
    end
    assign _1023 = _1002 ? _1022 : _1021;
    assign _4 = _1023;
    always @(posedge _249) begin
        if (_247)
            _1163 <= _1162;
        else
            _1163 <= _4;
    end
    assign _1026 = _993[11:0];
    always @* begin
        case (f_winner)
        0:
            _992 <= _315;
        1:
            _992 <= _684;
        2:
            _992 <= _820;
        default:
            _992 <= _991;
        endcase
    end
    always @* begin
        case (_992)
        0:
            _993 <= _318;
        1:
            _993 <= _321;
        2:
            _993 <= _324;
        default:
            _993 <= _324;
        endcase
    end
    assign _1024 = 16'b0000111111111111;
    assign _1025 = _1024 < _993;
    assign _1028 = _1025 ? _1022 : _1026;
    assign _5 = _1028;
    always @(posedge _249) begin
        if (_247)
            _1160 <= _1162;
        else
            _1160 <= _5;
    end
    assign _1164 = _1160 < _1163;
    assign _1165 = _1145 & _1164;
    assign _1166 = _1165 ? _1160 : _1163;
    assign _1157 = _50[23:12];
    assign _1167 = _1157 < _1166;
    assign _1168 = _1167 ? _1157 : _1166;
    assign _1155 = 8'b00000000;
    assign _1156 = _1140 == _1155;
    assign _1169 = _1156 ? _1166 : _1168;
    assign _1153 = 8'b11111111;
    assign _1152 = _1150[7:0];
    assign _1147 = 2'b10;
    assign _1146 = 2'b01;
    assign _1135 = _1131 == _1134;
    assign _1127 = _1123 & _1126;
    assign _1136 = _1127 & _1135;
    assign _6 = _1136;
    always @(posedge _249) begin
        if (_247)
            _1145 <= _1001;
        else
            _1145 <= _6;
    end
    assign _1148 = _1145 ? _1147 : _1146;
    assign _1142 = 7'b0000000;
    assign _1149 = { _1142,
                     _1148 };
    assign _1140 = _50[31:24];
    assign _1141 = { gnd,
                     _1140 };
    assign _1150 = _1141 + _1149;
    assign _1151 = _1150[8:8];
    assign _1154 = _1151 ? _1153 : _1152;
    assign _1177 = { _1154,
                     _1169,
                     _1176 };
    assign _8 = host_cov_wdata;
    assign _1178 = _1139 ? _1177 : _8;
    assign _1186 = _1139 | _1185;
    assign _1184 = ~ _1126;
    assign _1182 = ~ _1139;
    assign _12 = host_cov_we;
    assign _1181 = _12 & _1180;
    assign _1183 = _1181 & _1182;
    assign _1185 = _1183 & _1184;
    assign _1188 = ~ _1185;
    assign _1187 = ~ _1139;
    assign _1189 = _1187 & _1188;
    assign _14 = _1134;
    always @(posedge _249) begin
        if (_247)
            _1193 <= _1155;
        else
            _1193 <= _14;
    end
    assign _16 = host_cov_addr;
    assign _1190 = _1126 ? _1134 : _16;
    assign _17 = _1126;
    always @(posedge _249) begin
        if (_247)
            _1139 <= _1001;
        else
            _1139 <= _17;
    end
    assign _1194 = _1139 ? _1193 : _1190;
    assign _20 = host_rec_wdata;
    assign _23 = host_rec_we;
    assign _1195 = _23 & _1180;
    assign _1199 = _334[1:0];
    assign _1200 = { _1130,
                     _1199 };
    assign _27 = host_rec_waddr;
    assign _1196 = 3'b100;
    assign _1197 = _334 < _1196;
    assign _1198 = f_in_fetch & _1197;
    assign _1201 = _1198 ? _1200 : _27;
    assign _1352 = 3'b001;
    assign _1353 = _1351 ? _1352 : _1328;
    assign _1325 = 3'b010;
    assign _1327 = _1318 ? _1196 : _1325;
    assign _1328 = _1321 ? _1327 : _1324;
    assign _1354 = _1306 ? _1353 : _1328;
    assign _1356 = _1205 ? _1009 : _1354;
    assign _1358 = _1203 ? _1009 : _1356;
    assign _29 = _1358;
    always @(posedge _249) begin
        if (_247)
            _1324 <= _1009;
        else
            _1324 <= _29;
    end
    assign _1517 = { _593,
                     _596,
                     _599,
                     _602,
                     gnd,
                     _1324 };
    assign _1510 = _1508 ? _1352 : _1485;
    assign _1484 = _1475 ? _1196 : _1325;
    assign _1485 = _1478 ? _1484 : _1481;
    assign _1511 = _1463 ? _1510 : _1485;
    assign _1513 = _1362 ? _1009 : _1511;
    assign _1515 = _1360 ? _1009 : _1513;
    assign _30 = _1515;
    always @(posedge _249) begin
        if (_247)
            _1481 <= _1009;
        else
            _1481 <= _30;
    end
    assign _1516 = { _607,
                     _610,
                     _613,
                     _616,
                     gnd,
                     _1481 };
    assign _1518 = { _1516,
                     _1517 };
    assign _1528 = 1'b1;
    assign _32 = _1131;
    always @(posedge _249) begin
        if (_247)
            _1134 <= _1155;
        else
            _1134 <= _32;
    end
    assign _1131 = { _1130,
                     f_winner };
    assign _1522 = _1131 == _1134;
    assign _1523 = ~ _1522;
    assign _1519 = ~ _1126;
    assign _1520 = _1123 & _1519;
    assign _33 = _1520;
    always @(posedge _249) begin
        if (_247)
            _1126 <= _1001;
        else
            _1126 <= _33;
    end
    assign _35 = host_cover_en;
    assign _1123 = _1122 & _35;
    assign _1521 = _1123 & _1126;
    assign _1524 = _1521 & _1523;
    assign _1529 = _1524 ? _1528 : _1527;
    assign _1531 = _259 ? _1001 : _1529;
    assign _36 = _1531;
    always @(posedge _249) begin
        if (_247)
            _1527 <= _1001;
        else
            _1527 <= _36;
    end
    assign _1534 = _56 & _1533;
    assign _1539 = _1534 ? _1528 : _1537;
    assign _1541 = _259 ? _1001 : _1539;
    assign _38 = _1541;
    always @(posedge _249) begin
        if (_247)
            _1537 <= _1001;
        else
            _1537 <= _38;
    end
    assign _1673 = ~ _1672;
    assign _1666 = _1651 & _1665;
    assign _1674 = _1666 & _1673;
    assign _1647 = ~ _1646;
    assign _1594 = _1544 & _1593;
    assign _1648 = _1594 & _1647;
    assign _1675 = _1648 | _1674;
    assign _40 = _1675;
    assign _1676 = _119 & _581;
    assign _1677 = _1676 | _40;
    assign _1682 = _1677 ? _1528 : _1680;
    assign _1684 = _259 ? _1001 : _1682;
    assign _41 = _1684;
    always @(posedge _249) begin
        if (_247)
            _1680 <= _1001;
        else
            _1680 <= _41;
    end
    assign _1689 = _1688[61:61];
    assign _1690 = _1654 & _1689;
    assign _1695 = _1690 ? _1528 : _1693;
    assign _45 = host_irq_ack;
    assign _1697 = _45 ? _1001 : _1695;
    assign _1699 = _259 ? _1001 : _1697;
    assign _46 = _1699;
    always @(posedge _249) begin
        if (_247)
            _1693 <= _1001;
        else
            _1693 <= _46;
    end
    assign _1729 = _1725 == _1728;
    assign _1731 = _1729 ? _1528 : _1687;
    assign _1727 = _1725 == _2011;
    assign _1733 = _1727 ? _1528 : _1731;
    assign _1734 = _1724 ? _1733 : _1687;
    assign _1735 = _1122 ? _1687 : _1734;
    assign _1701 = _267 == _1147;
    assign _1736 = _1701 ? _1735 : _1687;
    assign _1738 = _259 ? _1001 : _1736;
    assign _47 = _1738;
    always @(posedge _249) begin
        if (_247)
            _1687 <= _1001;
        else
            _1687 <= _47;
    end
    assign _1744 = ~ _1743;
    assign _1741 = ~ _1740;
    assign _1745 = _1741 | _1744;
    assign _1746 = _1745 | _1687;
    assign _1747 = _1746 | _1693;
    assign _50 = ram_cov_rdata;
    assign _1894 = 3'b111;
    assign _1895 = _1752 == _1894;
    assign _1896 = _1749 & _1895;
    assign _1893 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _249) begin
        if (_247)
            _1897 <= _1893;
        else
            if (_1896)
                _1897 <= _55;
    end
    assign _1888 = 3'b110;
    assign _1889 = _1752 == _1888;
    assign _1890 = _1749 & _1889;
    always @(posedge _249) begin
        if (_247)
            _1891 <= _1893;
        else
            if (_1890)
                _1891 <= _55;
    end
    assign _1882 = 3'b101;
    assign _1883 = _1752 == _1882;
    assign _1884 = _1749 & _1883;
    always @(posedge _249) begin
        if (_247)
            _1885 <= _1893;
        else
            if (_1884)
                _1885 <= _55;
    end
    assign _1877 = _1752 == _1196;
    assign _1878 = _1749 & _1877;
    always @(posedge _249) begin
        if (_247)
            _1879 <= _1893;
        else
            if (_1878)
                _1879 <= _55;
    end
    assign _1870 = 3'b011;
    assign _1871 = _1752 == _1870;
    assign _1872 = _1749 & _1871;
    always @(posedge _249) begin
        if (_247)
            _1873 <= _1893;
        else
            if (_1872)
                _1873 <= _55;
    end
    assign _1865 = _1752 == _1325;
    assign _1866 = _1749 & _1865;
    always @(posedge _249) begin
        if (_247)
            _1867 <= _1893;
        else
            if (_1866)
                _1867 <= _55;
    end
    assign _1859 = _1752 == _1352;
    assign _1860 = _1749 & _1859;
    always @(posedge _249) begin
        if (_247)
            _1861 <= _1893;
        else
            if (_1860)
                _1861 <= _55;
    end
    assign _1754 = _1752 + _1352;
    assign _1755 = _1749 ? _1754 : _1752;
    assign _53 = _1755;
    always @(posedge _249) begin
        if (_247)
            _1752 <= _1009;
        else
            _1752 <= _53;
    end
    assign _1853 = _1752 == _1009;
    assign _1854 = _1749 & _1853;
    assign _1828 = _1768 - _1824;
    assign _1763 = 29'b11111111111111111111111111111;
    assign _1762 = 29'b00000000000000000000000000000;
    assign _1765 = 29'b00000000000000000000000000001;
    assign _1766 = ts_hi_m1 + _1765;
    assign _1759 = ts_reg[2:0];
    assign _1761 = _1759 == _1894;
    assign _1767 = _1761 ? _1766 : ts_hi_m1;
    assign _54 = _1767;
    always @(posedge _249) begin
        if (_247)
            ts_hi_m1 <= _1763;
        else
            ts_hi_m1 <= _54;
    end
    assign _1826 = ts_reg[31:3];
    assign _1814 = f_watch[0:0];
    assign _1813 = _303[0:0];
    assign _1815 = _1813 & _1814;
    assign _1817 = _1815 ? _523 : _1009;
    assign _1809 = f_watch[1:1];
    assign _1808 = _303[1:1];
    assign _1810 = _1808 & _1809;
    assign _1812 = _1810 ? _502 : _1009;
    assign _1818 = _1812 < _1817;
    assign _1819 = _1818 ? _1817 : _1812;
    assign _1802 = f_watch[2:2];
    assign _1801 = _303[2:2];
    assign _1803 = _1801 & _1802;
    assign _1805 = _1803 ? _479 : _1009;
    assign _1797 = f_watch[3:3];
    assign _1796 = _303[3:3];
    assign _1798 = _1796 & _1797;
    assign _1800 = _1798 ? _458 : _1009;
    assign _1806 = _1800 < _1805;
    assign _1807 = _1806 ? _1805 : _1800;
    assign _1820 = _1807 < _1819;
    assign _1821 = _1820 ? _1819 : _1807;
    assign _1788 = f_watch[4:4];
    assign _1787 = _303[4:4];
    assign _1789 = _1787 & _1788;
    assign _1791 = _1789 ? _433 : _1009;
    assign _1783 = f_watch[5:5];
    assign _1782 = _303[5:5];
    assign _1784 = _1782 & _1783;
    assign _1786 = _1784 ? _412 : _1009;
    assign _1792 = _1786 < _1791;
    assign _1793 = _1792 ? _1791 : _1786;
    assign _1776 = f_watch[6:6];
    assign _1775 = _303[6:6];
    assign _1777 = _1775 & _1776;
    assign _1779 = _1777 ? _389 : _1009;
    assign _1771 = f_watch[7:7];
    assign _1770 = _303[7:7];
    assign _1772 = _1770 & _1771;
    assign _1774 = _1772 ? _368 : _1009;
    assign _1780 = _1774 < _1779;
    assign _1781 = _1780 ? _1779 : _1774;
    assign _1794 = _1781 < _1793;
    assign _1795 = _1794 ? _1793 : _1781;
    assign _1822 = _1795 < _1821;
    assign _1823 = _1822 ? _1821 : _1795;
    assign _1824 = f_unexp_now ? _1823 : _1009;
    assign _1768 = ts_reg[2:0];
    assign _1825 = _1768 < _1824;
    assign _1827 = _1825 ? ts_hi_m1 : _1826;
    assign _1829 = { _1827,
                     _1828 };
    assign _1831 = { _1829,
                     _1130,
                     _1830,
                     _290 };
    assign _55 = _1831;
    always @(posedge _249) begin
        if (_247)
            _1855 <= _1893;
        else
            if (_1854)
                _1855 <= _55;
    end
    assign _1848 = _1846 + _1352;
    assign _1742 = 4'b0000;
    assign _1837 = 4'b0001;
    assign _1838 = _57 + _1837;
    assign _1836 = _57 - _1837;
    assign _1839 = _1749 ? _1838 : _1836;
    assign _1532 = 4'b1000;
    assign _1533 = _57 == _1532;
    assign _1748 = ~ _1533;
    assign _56 = _1724;
    assign _1749 = _56 & _1748;
    assign _1834 = _1749 ^ _1833;
    assign _1840 = _1834 ? _1839 : _57;
    always @(posedge _249) begin
        if (_247)
            _1843 <= _1742;
        else
            _1843 <= _1840;
    end
    assign _57 = _1843;
    assign _1743 = _57 == _1742;
    assign _1832 = ~ _1743;
    assign _59 = host_vlog_pop;
    assign _1833 = _59 & _1832;
    assign _1849 = _1833 ? _1848 : _1846;
    assign _60 = _1849;
    always @(posedge _249) begin
        if (_247)
            _1846 <= _1009;
        else
            _1846 <= _60;
    end
    always @* begin
        case (_1846)
        0:
            _1898 <= _1855;
        1:
            _1898 <= _1861;
        2:
            _1898 <= _1867;
        3:
            _1898 <= _1873;
        4:
            _1898 <= _1879;
        5:
            _1898 <= _1885;
        6:
            _1898 <= _1891;
        default:
            _1898 <= _1897;
        endcase
    end
    assign _2002 = _1903 == _1894;
    assign _2003 = _1900 & _2002;
    always @(posedge _249) begin
        if (_247)
            _2004 <= _1155;
        else
            if (_2003)
                _2004 <= _66;
    end
    assign _1996 = _1903 == _1888;
    assign _1997 = _1900 & _1996;
    always @(posedge _249) begin
        if (_247)
            _1998 <= _1155;
        else
            if (_1997)
                _1998 <= _66;
    end
    assign _1990 = _1903 == _1882;
    assign _1991 = _1900 & _1990;
    always @(posedge _249) begin
        if (_247)
            _1992 <= _1155;
        else
            if (_1991)
                _1992 <= _66;
    end
    assign _1984 = _1903 == _1196;
    assign _1985 = _1900 & _1984;
    always @(posedge _249) begin
        if (_247)
            _1986 <= _1155;
        else
            if (_1985)
                _1986 <= _66;
    end
    assign _1978 = _1903 == _1870;
    assign _1979 = _1900 & _1978;
    always @(posedge _249) begin
        if (_247)
            _1980 <= _1155;
        else
            if (_1979)
                _1980 <= _66;
    end
    assign _1972 = _1903 == _1325;
    assign _1973 = _1900 & _1972;
    always @(posedge _249) begin
        if (_247)
            _1974 <= _1155;
        else
            if (_1973)
                _1974 <= _66;
    end
    assign _1966 = _1903 == _1352;
    assign _1967 = _1900 & _1966;
    always @(posedge _249) begin
        if (_247)
            _1968 <= _1155;
        else
            if (_1967)
                _1968 <= _66;
    end
    assign _1905 = _1903 + _1352;
    assign _1906 = _1900 ? _1905 : _1903;
    assign _63 = _1906;
    always @(posedge _249) begin
        if (_247)
            _1903 <= _1009;
        else
            _1903 <= _63;
    end
    assign _1960 = _1903 == _1009;
    assign _1961 = _1900 & _1960;
    assign _1946 = _1601 ? _1945 : _1940;
    assign _1947 = _1607 ? _1945 : _1946;
    assign _1924 = _1923 ? _1921 : _1911;
    assign _1922 = _1908 ? _1921 : _1911;
    assign _1925 = _1646 ? _1924 : _1922;
    assign _64 = _1925;
    always @(posedge _249) begin
        if (_247)
            _1911 <= _1155;
        else
            _1911 <= _64;
    end
    assign _1920 = _1551 ? _1919 : _1914;
    assign _1921 = _1557 ? _1919 : _1920;
    assign _1936 = _1544 ? _1911 : _1921;
    assign _1933 = _1932 ? _576 : _1930;
    assign _1931 = _1927 ? _576 : _1930;
    assign _1934 = _1672 ? _1933 : _1931;
    assign _65 = _1934;
    always @(posedge _249) begin
        if (_247)
            _1930 <= _1155;
        else
            _1930 <= _65;
    end
    assign _1935 = _1651 ? _1930 : _576;
    assign _1937 = _1646 ? _1936 : _1935;
    assign _1948 = _1643 ? _1947 : _1937;
    assign _66 = _1948;
    always @(posedge _249) begin
        if (_247)
            _1962 <= _1155;
        else
            if (_1961)
                _1962 <= _66;
    end
    assign _1955 = _1953 + _1352;
    assign _1956 = _1950 ? _1955 : _1953;
    assign _67 = _1956;
    always @(posedge _249) begin
        if (_247)
            _1953 <= _1009;
        else
            _1953 <= _67;
    end
    always @* begin
        case (_1953)
        0:
            _2005 <= _1962;
        1:
            _2005 <= _1968;
        2:
            _2005 <= _1974;
        3:
            _2005 <= _1980;
        4:
            _2005 <= _1986;
        5:
            _2005 <= _1992;
        6:
            _2005 <= _1998;
        default:
            _2005 <= _2004;
        endcase
    end
    assign _1757 = 32'b00000000000000000000000000000000;
    assign _2008 = 32'b00000000000000000000000000000001;
    assign _2009 = ts_reg + _2008;
    assign _71 = _2009;
    always @(posedge _249) begin
        if (_247)
            ts_reg <= _1757;
        else
            ts_reg <= _71;
    end
    assign _2011 = 2'b00;
    assign _1830 = { _1715,
                     f_unexp_now };
    always @(posedge _249) begin
        if (_247)
            _2012 <= _2011;
        else
            _2012 <= _1830;
    end
    always @(posedge _249) begin
        if (_247)
            _2015 <= _1001;
        else
            _2015 <= _1724;
    end
    always @(posedge _249) begin
        if (_247)
            _2018 <= _2011;
        else
            _2018 <= f_winner;
    end
    always @(posedge _249) begin
        if (_247)
            _2021 <= _1001;
        else
            _2021 <= _1122;
    end
    assign _2022 = _1688[60:60];
    assign _2023 = f_in_eval & _2022;
    assign _1180 = _267 == _2011;
    assign _2024 = ~ _1180;
    assign _2165 = _84 & _2164;
    assign _2166 = ~ _2165;
    assign _2046 = _1688[23:16];
    assign _2044 = _990[86:79];
    assign _2043 = _802[86:79];
    assign _2042 = _666[86:79];
    assign _2041 = _283[86:79];
    always @* begin
        case (f_winner)
        0:
            _2045 <= _2041;
        1:
            _2045 <= _2042;
        2:
            _2045 <= _2043;
        default:
            _2045 <= _2044;
        endcase
    end
    assign _2047 = _1654 ? _2046 : _2045;
    assign _2048 = _2047 & _2038;
    assign _2039 = ~ _2038;
    assign _2040 = _2031 & _2039;
    assign _2049 = _2040 | _2048;
    assign _2083 = _2049 | _2082;
    assign _2084 = _2028 ? _2083 : _2031;
    assign _2086 = _256 ? _1155 : _2084;
    assign _2088 = _259 ? _1155 : _2086;
    assign _81 = _2088;
    always @(posedge _249) begin
        if (_247)
            _2031 <= _1155;
        else
            _2031 <= _81;
    end
    assign _2167 = _2031 & _2166;
    assign _84 = host_open_drain;
    assign _3470 = ~ _84;
    assign _2162 = _1475 & _2156;
    assign _2161 = ~ _1475;
    assign _2159 = ~ _1318;
    assign _2160 = _2159 & _2156;
    assign _2158 = _1318 & _2156;
    assign _2157 = ~ _1318;
    assign _2156 = _2092[0:0];
    assign _2155 = _262[2:0];
    always @* begin
        case (_2155)
        0:
            _2163 <= _2156;
        1:
            _2163 <= _1318;
        2:
            _2163 <= _2157;
        3:
            _2163 <= _2158;
        4:
            _2163 <= _2160;
        5:
            _2163 <= _1475;
        6:
            _2163 <= _2161;
        default:
            _2163 <= _2162;
        endcase
    end
    assign _2153 = _1475 & _2147;
    assign _2152 = ~ _1475;
    assign _2150 = ~ _1318;
    assign _2151 = _2150 & _2147;
    assign _2149 = _1318 & _2147;
    assign _2148 = ~ _1318;
    assign _2147 = _2092[1:1];
    assign _2146 = _262[5:3];
    always @* begin
        case (_2146)
        0:
            _2154 <= _2147;
        1:
            _2154 <= _1318;
        2:
            _2154 <= _2148;
        3:
            _2154 <= _2149;
        4:
            _2154 <= _2151;
        5:
            _2154 <= _1475;
        6:
            _2154 <= _2152;
        default:
            _2154 <= _2153;
        endcase
    end
    assign _2144 = _1475 & _2138;
    assign _2143 = ~ _1475;
    assign _2141 = ~ _1318;
    assign _2142 = _2141 & _2138;
    assign _2140 = _1318 & _2138;
    assign _2139 = ~ _1318;
    assign _2138 = _2092[2:2];
    assign _2137 = _262[8:6];
    always @* begin
        case (_2137)
        0:
            _2145 <= _2138;
        1:
            _2145 <= _1318;
        2:
            _2145 <= _2139;
        3:
            _2145 <= _2140;
        4:
            _2145 <= _2142;
        5:
            _2145 <= _1475;
        6:
            _2145 <= _2143;
        default:
            _2145 <= _2144;
        endcase
    end
    assign _2135 = _1475 & _2129;
    assign _2134 = ~ _1475;
    assign _2132 = ~ _1318;
    assign _2133 = _2132 & _2129;
    assign _2131 = _1318 & _2129;
    assign _2130 = ~ _1318;
    assign _2129 = _2092[3:3];
    assign _2128 = _262[11:9];
    always @* begin
        case (_2128)
        0:
            _2136 <= _2129;
        1:
            _2136 <= _1318;
        2:
            _2136 <= _2130;
        3:
            _2136 <= _2131;
        4:
            _2136 <= _2133;
        5:
            _2136 <= _1475;
        6:
            _2136 <= _2134;
        default:
            _2136 <= _2135;
        endcase
    end
    assign _2126 = _1475 & _2120;
    assign _2125 = ~ _1475;
    assign _2123 = ~ _1318;
    assign _2124 = _2123 & _2120;
    assign _2122 = _1318 & _2120;
    assign _2121 = ~ _1318;
    assign _2120 = _2092[4:4];
    assign _2119 = _262[14:12];
    always @* begin
        case (_2119)
        0:
            _2127 <= _2120;
        1:
            _2127 <= _1318;
        2:
            _2127 <= _2121;
        3:
            _2127 <= _2122;
        4:
            _2127 <= _2124;
        5:
            _2127 <= _1475;
        6:
            _2127 <= _2125;
        default:
            _2127 <= _2126;
        endcase
    end
    assign _2117 = _1475 & _2111;
    assign _2116 = ~ _1475;
    assign _2114 = ~ _1318;
    assign _2115 = _2114 & _2111;
    assign _2113 = _1318 & _2111;
    assign _2112 = ~ _1318;
    assign _2111 = _2092[5:5];
    assign _2110 = _262[17:15];
    always @* begin
        case (_2110)
        0:
            _2118 <= _2111;
        1:
            _2118 <= _1318;
        2:
            _2118 <= _2112;
        3:
            _2118 <= _2113;
        4:
            _2118 <= _2115;
        5:
            _2118 <= _1475;
        6:
            _2118 <= _2116;
        default:
            _2118 <= _2117;
        endcase
    end
    assign _2108 = _1475 & _2102;
    assign _2107 = ~ _1475;
    assign _2105 = ~ _1318;
    assign _2106 = _2105 & _2102;
    assign _2104 = _1318 & _2102;
    assign _2103 = ~ _1318;
    assign _2102 = _2092[6:6];
    assign _2101 = _262[20:18];
    always @* begin
        case (_2101)
        0:
            _2109 <= _2102;
        1:
            _2109 <= _1318;
        2:
            _2109 <= _2103;
        3:
            _2109 <= _2104;
        4:
            _2109 <= _2106;
        5:
            _2109 <= _1475;
        6:
            _2109 <= _2107;
        default:
            _2109 <= _2108;
        endcase
    end
    assign _2099 = _1475 & _2093;
    assign _2098 = ~ _1475;
    assign _2096 = ~ _1318;
    assign _2097 = _2096 & _2093;
    assign _2095 = _1318 & _2093;
    assign _2094 = ~ _1318;
    assign _3462 = { _3460,
                     _3459 };
    assign _3459 = _572[0:0];
    assign _3460 = { _3459,
                     _3459 };
    assign _3461 = { _3460,
                     _3460 };
    assign _3463 = { _3461,
                     _3462 };
    assign _3464 = { _3463,
                     _3459 };
    assign _3465 = _3464 & _2082;
    assign _2080 = _2076 & _2074;
    assign _2079 = _2076 & _2072;
    assign _2078 = _2076 & _2069;
    assign _2076 = ~ _2063;
    assign _2077 = _2076 & _2066;
    assign _2074 = _2071 & _2068;
    assign _2075 = _2063 & _2074;
    assign _2071 = ~ _2064;
    assign _2072 = _2071 & _2065;
    assign _2073 = _2063 & _2072;
    assign _2068 = ~ _2065;
    assign _2069 = _2064 & _2068;
    assign _2070 = _2063 & _2069;
    assign _2065 = _2062[0:0];
    assign _2064 = _2062[1:1];
    assign _2066 = _2064 & _2065;
    assign _2063 = _2062[2:2];
    assign _2067 = _2063 & _2066;
    assign _2081 = { _2067,
                     _2070,
                     _2073,
                     _2075,
                     _2077,
                     _2078,
                     _2079,
                     _2080 };
    assign _2050 = ~ _1654;
    assign _2056 = _2050 & _2055;
    assign _2082 = _2056 ? _2081 : _1155;
    assign _3457 = ~ _2082;
    assign _3453 = _1688[15:8];
    assign _3451 = _990[78:71];
    assign _3450 = _802[78:71];
    assign _3449 = _666[78:71];
    assign _3448 = _283[78:71];
    always @* begin
        case (f_winner)
        0:
            _3452 <= _3448;
        1:
            _3452 <= _3449;
        2:
            _3452 <= _3450;
        default:
            _3452 <= _3451;
        endcase
    end
    assign _3454 = _1654 ? _3453 : _3452;
    assign _3455 = _3454 & _2038;
    assign _2037 = _1688[7:0];
    assign _2035 = _990[70:63];
    assign _2034 = _802[70:63];
    assign _2033 = _666[70:63];
    assign _2032 = _283[70:63];
    always @* begin
        case (f_winner)
        0:
            _2036 <= _2032;
        1:
            _2036 <= _2033;
        2:
            _2036 <= _2034;
        default:
            _2036 <= _2035;
        endcase
    end
    assign _2038 = _1654 ? _2037 : _2036;
    assign _3446 = ~ _2038;
    assign _3447 = _2092 & _3446;
    assign _3456 = _3447 | _3455;
    assign _3458 = _3456 & _3457;
    assign _3466 = _3458 | _3465;
    assign _2026 = _623 == _2011;
    assign _2027 = _2026 | _625;
    assign _1653 = _334 == _1196;
    assign _3440 = _1654 ? _1147 : _267;
    assign _3436 = _2179 ? _1146 : _267;
    assign _1728 = 2'b11;
    assign _3427 = _1725 == _1728;
    assign _3429 = _3427 ? _2011 : _267;
    assign _3426 = _1725 == _1147;
    assign _3431 = _3426 ? _1146 : _3429;
    assign _3425 = _1725 == _2011;
    assign _3433 = _3425 ? _2011 : _3431;
    assign _3434 = _1724 ? _3433 : _267;
    assign _1115 = _1075 == _998;
    assign _1110 = 16'b0000000000000000;
    assign _1111 = _1075 == _1110;
    assign _1112 = _1111 & _1092;
    assign _1109 = _1051 == _1071;
    assign _1113 = _1109 | _1112;
    assign _1116 = _1050 ? _1115 : _1113;
    assign _1106 = _584[3:0];
    assign _1108 = _1106 == _1742;
    assign _1117 = _1108 | _1116;
    assign _1104 = _1075 == _998;
    assign _1100 = _1075 == _1110;
    assign _1101 = _1100 & _1092;
    assign _1098 = _1051 == _1071;
    assign _1102 = _1098 | _1101;
    assign _1105 = _1050 ? _1104 : _1102;
    assign _1096 = _1062 == _998;
    always @(posedge _249) begin
        if (_247)
            _987 <= _1009;
        else
            _987 <= _984;
    end
    assign _1091 = { _1016,
                     _987 };
    assign _1092 = _1048 < _1091;
    assign _1089 = _1062 == _1110;
    assign _1093 = _1089 & _1092;
    assign _1087 = _1051 == _1059;
    assign _1094 = _1087 | _1093;
    assign _1097 = _1050 ? _1096 : _1094;
    assign _1086 = _990[104:103];
    always @* begin
        case (_1086)
        0:
            _1118 <= vdd;
        1:
            _1118 <= _1097;
        2:
            _1118 <= _1105;
        default:
            _1118 <= _1117;
        endcase
    end
    assign _1085 = ~ _625;
    assign _1119 = _1085 | _1118;
    assign _1082 = _990[62:62];
    assign _1080 = _990[61:58];
    always @* begin
        case (_1080)
        0:
            _1081 <= vdd;
        1:
            _1081 <= _569;
        2:
            _1081 <= _573;
        3:
            _1081 <= _577;
        4:
            _1081 <= _579;
        5:
            _1081 <= _581;
        6:
            _1081 <= _585;
        7:
            _1081 <= _588;
        8:
            _1081 <= _593;
        9:
            _1081 <= _596;
        10:
            _1081 <= _599;
        11:
            _1081 <= _602;
        12:
            _1081 <= _607;
        13:
            _1081 <= _610;
        14:
            _1081 <= _613;
        default:
            _1081 <= _616;
        endcase
    end
    assign _1083 = _1081 ^ _1082;
    assign _1075 = _990[57:42];
    assign _1077 = _1075 == _998;
    assign _1070 = 17'b00000000000000000;
    assign _1066 = _945[57:42];
    assign _1067 = { gnd,
                     _1066 };
    assign _1068 = _1067 + _1055;
    always @(posedge _249) begin
        if (_247)
            _1071 <= _1070;
        else
            _1071 <= _1068;
    end
    assign _1072 = _1071 < _1051;
    assign _1073 = ~ _1072;
    assign _1062 = _990[41:26];
    assign _1064 = _1062 == _1110;
    assign _976 = _946[0:0];
    assign _978 = _976 ? _531 : _1009;
    assign _973 = _946[1:1];
    assign _975 = _973 ? _510 : _1009;
    assign _979 = _975 < _978;
    assign _980 = _979 ? _978 : _975;
    assign _968 = _946[2:2];
    assign _970 = _968 ? _487 : _1009;
    assign _965 = _946[3:3];
    assign _967 = _965 ? _466 : _1009;
    assign _971 = _967 < _970;
    assign _972 = _971 ? _970 : _967;
    assign _981 = _972 < _980;
    assign _982 = _981 ? _980 : _972;
    assign _958 = _946[4:4];
    assign _960 = _958 ? _441 : _1009;
    assign _955 = _946[5:5];
    assign _957 = _955 ? _420 : _1009;
    assign _961 = _957 < _960;
    assign _962 = _961 ? _960 : _957;
    assign _950 = _946[6:6];
    assign _952 = _950 ? _397 : _1009;
    assign _946 = _945[23:16];
    assign _947 = _946[7:7];
    assign _949 = _947 ? _376 : _1009;
    assign _953 = _949 < _952;
    assign _954 = _953 ? _952 : _949;
    assign _963 = _954 < _962;
    assign _964 = _963 ? _962 : _954;
    assign _983 = _964 < _982;
    assign _984 = _983 ? _982 : _964;
    assign _1054 = 14'b00000000000000;
    assign _1055 = { _1054,
                     _984 };
    assign _945 = _351[511:400];
    assign _1052 = _945[41:26];
    assign _1053 = { gnd,
                     _1052 };
    assign _1056 = _1053 + _1055;
    always @(posedge _249) begin
        if (_247)
            _1059 <= _1070;
        else
            _1059 <= _1056;
    end
    assign _1051 = { gnd,
                     _1048 };
    assign _1060 = _1051 < _1059;
    assign _1061 = ~ _1060;
    assign _1065 = _1061 | _1064;
    assign _1074 = _1065 & _1073;
    assign _991 = _990[25:24];
    always @* begin
        case (_991)
        0:
            _1048 <= _318;
        1:
            _1048 <= _321;
        2:
            _1048 <= _324;
        default:
            _1048 <= _324;
        endcase
    end
    assign _1050 = _1048 == _998;
    assign _1078 = _1050 ? _1077 : _1074;
    assign _1042 = f_changed_all & _1039;
    assign _1044 = _1042 == _1155;
    assign _1045 = ~ _1044;
    assign _1039 = _990[23:16];
    assign _1041 = _1039 == _1155;
    assign _1046 = _1041 | _1045;
    assign _1034 = _990[7:0];
    assign _1032 = _990[15:8];
    assign _1033 = _290 ^ _1032;
    assign _1035 = _1033 & _1034;
    assign _1037 = _1035 == _1155;
    assign _1031 = _990[111:111];
    assign _1038 = _1031 & _1037;
    assign _1047 = _1038 & _1046;
    assign _1079 = _1047 & _1078;
    assign _1084 = _1079 & _1083;
    assign _1120 = _1084 & _1119;
    assign f_fire3 = f_in_eval & _1120;
    assign _659 = _559 == _998;
    assign _655 = _559 == _1110;
    assign _656 = _655 & _636;
    assign _653 = _329 == _555;
    assign _657 = _653 | _656;
    assign _660 = _327 ? _659 : _657;
    assign _650 = _584[3:0];
    assign _652 = _650 == _1742;
    assign _661 = _652 | _660;
    assign _648 = _559 == _998;
    assign _644 = _559 == _1110;
    assign _645 = _644 & _636;
    assign _642 = _329 == _555;
    assign _646 = _642 | _645;
    assign _649 = _327 ? _648 : _646;
    assign _640 = _546 == _998;
    always @(posedge _249) begin
        if (_247)
            _634 <= _1009;
        else
            _634 <= _538;
    end
    assign _635 = { _1016,
                    _634 };
    assign _636 = _325 < _635;
    assign _630 = _546 == _1110;
    assign _637 = _630 & _636;
    assign _628 = _329 == _543;
    assign _638 = _628 | _637;
    assign _641 = _327 ? _640 : _638;
    assign _627 = _283[104:103];
    always @* begin
        case (_627)
        0:
            _662 <= vdd;
        1:
            _662 <= _641;
        2:
            _662 <= _649;
        default:
            _662 <= _661;
        endcase
    end
    assign _626 = ~ _625;
    assign _663 = _626 | _662;
    assign _618 = _283[62:62];
    assign _564 = _283[61:58];
    always @* begin
        case (_564)
        0:
            _617 <= vdd;
        1:
            _617 <= _569;
        2:
            _617 <= _573;
        3:
            _617 <= _577;
        4:
            _617 <= _579;
        5:
            _617 <= _581;
        6:
            _617 <= _585;
        7:
            _617 <= _588;
        8:
            _617 <= _593;
        9:
            _617 <= _596;
        10:
            _617 <= _599;
        11:
            _617 <= _602;
        12:
            _617 <= _607;
        13:
            _617 <= _610;
        14:
            _617 <= _613;
        default:
            _617 <= _616;
        endcase
    end
    assign _619 = _617 ^ _618;
    assign _559 = _283[57:42];
    assign _561 = _559 == _998;
    assign _550 = _352[57:42];
    assign _551 = { gnd,
                    _550 };
    assign _552 = _551 + _539;
    always @(posedge _249) begin
        if (_247)
            _555 <= _1070;
        else
            _555 <= _552;
    end
    assign _556 = _555 < _329;
    assign _557 = ~ _556;
    assign _546 = _283[41:26];
    assign _548 = _546 == _1110;
    assign _512 = _356[0:0];
    assign _532 = _512 ? _531 : _1009;
    assign _491 = _356[1:1];
    assign _511 = _491 ? _510 : _1009;
    assign _533 = _511 < _532;
    assign _534 = _533 ? _532 : _511;
    assign _468 = _356[2:2];
    assign _488 = _468 ? _487 : _1009;
    assign _447 = _356[3:3];
    assign _467 = _447 ? _466 : _1009;
    assign _489 = _467 < _488;
    assign _490 = _489 ? _488 : _467;
    assign _535 = _490 < _534;
    assign _536 = _535 ? _534 : _490;
    assign _422 = _356[4:4];
    assign _442 = _422 ? _441 : _1009;
    assign _401 = _356[5:5];
    assign _421 = _401 ? _420 : _1009;
    assign _443 = _421 < _442;
    assign _444 = _443 ? _442 : _421;
    assign _378 = _356[6:6];
    assign _398 = _378 ? _397 : _1009;
    assign _356 = _352[23:16];
    assign _357 = _356[7:7];
    assign _377 = _357 ? _376 : _1009;
    assign _399 = _377 < _398;
    assign _400 = _399 ? _398 : _377;
    assign _445 = _400 < _444;
    assign _446 = _445 ? _444 : _400;
    assign _537 = _446 < _536;
    assign _538 = _537 ? _536 : _446;
    assign _539 = { _1054,
                    _538 };
    assign _352 = _351[175:64];
    assign _353 = _352[41:26];
    assign _354 = { gnd,
                    _353 };
    assign _540 = _354 + _539;
    always @(posedge _249) begin
        if (_247)
            _543 <= _1070;
        else
            _543 <= _540;
    end
    assign _329 = { gnd,
                    _325 };
    assign _544 = _329 < _543;
    assign _545 = ~ _544;
    assign _549 = _545 | _548;
    assign _558 = _549 & _557;
    assign _315 = _283[25:24];
    always @* begin
        case (_315)
        0:
            _325 <= _318;
        1:
            _325 <= _321;
        2:
            _325 <= _324;
        default:
            _325 <= _324;
        endcase
    end
    assign _327 = _325 == _998;
    assign _562 = _327 ? _561 : _558;
    assign _309 = f_changed_all & _298;
    assign _311 = _309 == _1155;
    assign _312 = ~ _311;
    assign _298 = _283[23:16];
    assign _300 = _298 == _1155;
    assign _313 = _300 | _312;
    assign _293 = _283[7:0];
    assign _291 = _283[15:8];
    assign _292 = _290 ^ _291;
    assign _294 = _292 & _293;
    assign _296 = _294 == _1155;
    assign _271 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _3410 = _334 + _1352;
    assign _1129 = 6'b000000;
    assign _86 = host_start_loc;
    assign _2180 = _2179 ? _2177 : _1130;
    assign _88 = host_recover_loc;
    assign _2170 = _1725 == _1147;
    assign _2171 = _2170 ? _88 : _1130;
    assign _2172 = _1724 ? _2171 : _1130;
    assign _2181 = _1122 ? _2180 : _2172;
    assign _2168 = _267 == _1147;
    assign _2182 = _2168 ? _2181 : _1130;
    assign _2183 = _259 ? _86 : _2182;
    assign _89 = _2183;
    always @(posedge _249) begin
        if (_247)
            _1130 <= _1129;
        else
            _1130 <= _89;
    end
    assign _2176 = _990[110:105];
    assign _2175 = _802[110:105];
    assign _2174 = _666[110:105];
    assign _2173 = _283[110:105];
    always @* begin
        case (f_winner)
        0:
            _2177 <= _2173;
        1:
            _2177 <= _2174;
        2:
            _2177 <= _2175;
        default:
            _2177 <= _2176;
        endcase
    end
    assign _2178 = _2177 == _1130;
    assign _2179 = ~ _2178;
    assign _3406 = _2179 ? _1009 : _334;
    assign _1725 = _1688[59:58];
    assign _3401 = _1725 == _1147;
    assign _3403 = _3401 ? _1009 : _334;
    assign f_watch = _1688[57:50];
    assign _1719 = f_changed_all & f_watch;
    assign _1721 = _1719 == _1155;
    assign _1722 = ~ _1721;
    assign _1716 = ~ _1122;
    assign _1717 = f_in_eval & _1716;
    assign f_unexp_now = _1717 & _1722;
    assign _2188 = _1715 ? _1528 : _2186;
    assign _2189 = _1122 ? _2186 : _2188;
    assign _2186 = _1655 ? _1001 : _1713;
    assign _2184 = _267 == _1147;
    assign _2190 = _2184 ? _2189 : _2186;
    assign _90 = _2190;
    always @(posedge _249) begin
        if (_247)
            _1713 <= _1001;
        else
            _1713 <= _90;
    end
    assign _1714 = ~ _1713;
    assign _3392 = 16'b0000000000000001;
    assign _3393 = _318 + _3392;
    assign _3389 = _318 == _998;
    assign _3390 = ~ _3389;
    assign _3391 = _3350 & _3390;
    assign _3394 = _3391 ? _3393 : _318;
    assign _3334 = _1688[26:24];
    assign _3332 = _990[93:91];
    assign _3331 = _802[93:91];
    assign _3330 = _666[93:91];
    assign _3329 = _283[93:91];
    assign _931 = _888 == _998;
    assign _927 = _888 == _1110;
    assign _928 = _927 & _908;
    assign _925 = _824 == _884;
    assign _929 = _925 | _928;
    assign _932 = _823 ? _931 : _929;
    assign _922 = _584[3:0];
    assign _924 = _922 == _1742;
    assign _933 = _924 | _932;
    assign _920 = _888 == _998;
    assign _916 = _888 == _1110;
    assign _917 = _916 & _908;
    assign _914 = _824 == _884;
    assign _918 = _914 | _917;
    assign _921 = _823 ? _920 : _918;
    assign _912 = _875 == _998;
    always @(posedge _249) begin
        if (_247)
            _906 <= _1009;
        else
            _906 <= _867;
    end
    assign _907 = { _1016,
                    _906 };
    assign _908 = _821 < _907;
    assign _902 = _875 == _1110;
    assign _909 = _902 & _908;
    assign _900 = _824 == _872;
    assign _910 = _900 | _909;
    assign _913 = _823 ? _912 : _910;
    assign _899 = _802[104:103];
    always @* begin
        case (_899)
        0:
            _934 <= vdd;
        1:
            _934 <= _913;
        2:
            _934 <= _921;
        default:
            _934 <= _933;
        endcase
    end
    assign _898 = ~ _625;
    assign _935 = _898 | _934;
    assign _895 = _802[62:62];
    assign _893 = _802[61:58];
    always @* begin
        case (_893)
        0:
            _894 <= vdd;
        1:
            _894 <= _569;
        2:
            _894 <= _573;
        3:
            _894 <= _577;
        4:
            _894 <= _579;
        5:
            _894 <= _581;
        6:
            _894 <= _585;
        7:
            _894 <= _588;
        8:
            _894 <= _593;
        9:
            _894 <= _596;
        10:
            _894 <= _599;
        11:
            _894 <= _602;
        12:
            _894 <= _607;
        13:
            _894 <= _610;
        14:
            _894 <= _613;
        default:
            _894 <= _616;
        endcase
    end
    assign _896 = _894 ^ _895;
    assign _888 = _802[57:42];
    assign _890 = _888 == _998;
    assign _879 = _825[57:42];
    assign _880 = { gnd,
                    _879 };
    assign _881 = _880 + _868;
    always @(posedge _249) begin
        if (_247)
            _884 <= _1070;
        else
            _884 <= _881;
    end
    assign _885 = _884 < _824;
    assign _886 = ~ _885;
    assign _875 = _802[41:26];
    assign _877 = _875 == _1110;
    assign _859 = _829[0:0];
    assign _861 = _859 ? _531 : _1009;
    assign _856 = _829[1:1];
    assign _858 = _856 ? _510 : _1009;
    assign _862 = _858 < _861;
    assign _863 = _862 ? _861 : _858;
    assign _851 = _829[2:2];
    assign _853 = _851 ? _487 : _1009;
    assign _848 = _829[3:3];
    assign _850 = _848 ? _466 : _1009;
    assign _854 = _850 < _853;
    assign _855 = _854 ? _853 : _850;
    assign _864 = _855 < _863;
    assign _865 = _864 ? _863 : _855;
    assign _841 = _829[4:4];
    assign _843 = _841 ? _441 : _1009;
    assign _838 = _829[5:5];
    assign _840 = _838 ? _420 : _1009;
    assign _844 = _840 < _843;
    assign _845 = _844 ? _843 : _840;
    assign _833 = _829[6:6];
    assign _835 = _833 ? _397 : _1009;
    assign _829 = _825[23:16];
    assign _830 = _829[7:7];
    assign _832 = _830 ? _376 : _1009;
    assign _836 = _832 < _835;
    assign _837 = _836 ? _835 : _832;
    assign _846 = _837 < _845;
    assign _847 = _846 ? _845 : _837;
    assign _866 = _847 < _865;
    assign _867 = _866 ? _865 : _847;
    assign _868 = { _1054,
                    _867 };
    assign _825 = _351[399:288];
    assign _826 = _825[41:26];
    assign _827 = { gnd,
                    _826 };
    assign _869 = _827 + _868;
    always @(posedge _249) begin
        if (_247)
            _872 <= _1070;
        else
            _872 <= _869;
    end
    assign _824 = { gnd,
                    _821 };
    assign _873 = _824 < _872;
    assign _874 = ~ _873;
    assign _878 = _874 | _877;
    assign _887 = _878 & _886;
    assign _820 = _802[25:24];
    always @* begin
        case (_820)
        0:
            _821 <= _318;
        1:
            _821 <= _321;
        2:
            _821 <= _324;
        default:
            _821 <= _324;
        endcase
    end
    assign _823 = _821 == _998;
    assign _891 = _823 ? _890 : _887;
    assign _814 = f_changed_all & _811;
    assign _816 = _814 == _1155;
    assign _817 = ~ _816;
    assign _811 = _802[23:16];
    assign _813 = _811 == _1155;
    assign _818 = _813 | _817;
    assign _806 = _802[7:0];
    assign _804 = _802[15:8];
    assign _805 = _290 ^ _804;
    assign _807 = _805 & _806;
    assign _809 = _807 == _1155;
    assign _803 = _802[111:111];
    assign _810 = _803 & _809;
    assign _819 = _810 & _818;
    assign _892 = _819 & _891;
    assign _897 = _892 & _896;
    assign _936 = _897 & _935;
    assign f_fire2 = f_in_eval & _936;
    assign _940 = f_fire2 ? _1147 : _1728;
    assign _795 = _752 == _998;
    assign _791 = _752 == _1110;
    assign _792 = _791 & _772;
    assign _789 = _688 == _748;
    assign _793 = _789 | _792;
    assign _796 = _687 ? _795 : _793;
    assign _786 = _584[3:0];
    assign _788 = _786 == _1742;
    assign _797 = _788 | _796;
    assign _784 = _752 == _998;
    assign _780 = _752 == _1110;
    assign _781 = _780 & _772;
    assign _778 = _688 == _748;
    assign _782 = _778 | _781;
    assign _785 = _687 ? _784 : _782;
    assign _776 = _739 == _998;
    always @(posedge _249) begin
        if (_247)
            _770 <= _1009;
        else
            _770 <= _731;
    end
    assign _771 = { _1016,
                    _770 };
    assign _772 = _685 < _771;
    assign _766 = _739 == _1110;
    assign _773 = _766 & _772;
    assign _764 = _688 == _736;
    assign _774 = _764 | _773;
    assign _777 = _687 ? _776 : _774;
    assign _763 = _666[104:103];
    always @* begin
        case (_763)
        0:
            _798 <= vdd;
        1:
            _798 <= _777;
        2:
            _798 <= _785;
        default:
            _798 <= _797;
        endcase
    end
    assign _92 = host_role;
    assign _2191 = _259 ? _92 : _623;
    assign _93 = _2191;
    always @(posedge _249) begin
        if (_247)
            _623 <= _2011;
        else
            _623 <= _93;
    end
    assign _625 = _623 == _1147;
    assign _762 = ~ _625;
    assign _799 = _762 | _798;
    assign _759 = _666[62:62];
    assign _2195 = _1508 ? _1528 : _2193;
    assign _2193 = _1478 ? _1528 : _616;
    assign _2196 = _1463 ? _2195 : _2193;
    assign _2198 = _1362 ? _1001 : _2196;
    assign _2200 = _1360 ? _1001 : _2198;
    assign _94 = _2200;
    always @(posedge _249) begin
        if (_247)
            _616 <= _1001;
        else
            _616 <= _94;
    end
    assign _96 = host_lane1_sync_mask;
    assign _98 = host_lane1_sync;
    assign _2206 = _1545 ? _2205 : _2203;
    assign _2207 = _1508 ? _2203 : _2206;
    assign _2208 = _1463 ? _2207 : _2203;
    assign _2210 = _1362 ? _1110 : _2208;
    assign _99 = _2210;
    always @(posedge _249) begin
        if (_247)
            _2203 <= _1110;
        else
            _2203 <= _99;
    end
    assign _2204 = _2203[14:0];
    assign _2205 = { _2204,
                     _1499 };
    assign _2211 = _2205 ^ _98;
    assign _2212 = _2211 & _96;
    assign _2214 = _2212 == _1110;
    assign _2216 = _2214 ? _1528 : _613;
    assign _2217 = _1545 ? _2216 : _613;
    assign _2218 = _1508 ? _613 : _2217;
    assign _2219 = _1463 ? _2218 : _613;
    assign _2221 = _1362 ? _1001 : _2219;
    assign _2223 = _1360 ? _1001 : _2221;
    assign _100 = _2223;
    always @(posedge _249) begin
        if (_247)
            _613 <= _1001;
        else
            _613 <= _100;
    end
    assign _2236 = _1499 == _2235;
    assign _2237 = ~ _2236;
    assign _2239 = _2230 ? _2238 : _2226;
    assign _2240 = _1545 ? _2239 : _2226;
    assign _2241 = _1508 ? _2226 : _2240;
    assign _2242 = _1463 ? _2241 : _2226;
    assign _2244 = _1362 ? _1001 : _2242;
    assign _101 = _2244;
    always @(posedge _249) begin
        if (_247)
            _2226 <= _1001;
        else
            _2226 <= _101;
    end
    assign _2238 = _2226 | _2237;
    assign _2247 = ~ _2238;
    assign _2245 = 6'b000001;
    assign _2246 = _1574 == _2245;
    assign _2248 = _2246 ? _2247 : _610;
    assign _2249 = _2230 ? _2248 : _610;
    assign _2250 = _1545 ? _2249 : _610;
    assign _2251 = _1508 ? _610 : _2250;
    assign _2252 = _1463 ? _2251 : _610;
    assign _2254 = _1362 ? _1001 : _2252;
    assign _2256 = _1360 ? _1001 : _2254;
    assign _102 = _2256;
    always @(posedge _249) begin
        if (_247)
            _610 <= _1001;
        else
            _610 <= _102;
    end
    assign _2260 = _1351 ? _1528 : _2258;
    assign _2258 = _1321 ? _1528 : _602;
    assign _2261 = _1306 ? _2260 : _2258;
    assign _2263 = _1205 ? _1001 : _2261;
    assign _2265 = _1203 ? _1001 : _2263;
    assign _103 = _2265;
    always @(posedge _249) begin
        if (_247)
            _602 <= _1001;
        else
            _602 <= _103;
    end
    assign _105 = host_lane0_sync_mask;
    assign _107 = host_lane0_sync;
    assign _2271 = _1595 ? _2270 : _2268;
    assign _2272 = _1351 ? _2268 : _2271;
    assign _2273 = _1306 ? _2272 : _2268;
    assign _2275 = _1205 ? _1110 : _2273;
    assign _108 = _2275;
    always @(posedge _249) begin
        if (_247)
            _2268 <= _1110;
        else
            _2268 <= _108;
    end
    assign _2269 = _2268[14:0];
    assign _2270 = { _2269,
                     _1342 };
    assign _2276 = _2270 ^ _107;
    assign _2277 = _2276 & _105;
    assign _2279 = _2277 == _1110;
    assign _2281 = _2279 ? _1528 : _599;
    assign _2282 = _1595 ? _2281 : _599;
    assign _2283 = _1351 ? _599 : _2282;
    assign _2284 = _1306 ? _2283 : _599;
    assign _2286 = _1205 ? _1001 : _2284;
    assign _2288 = _1203 ? _1001 : _2286;
    assign _109 = _2288;
    always @(posedge _249) begin
        if (_247)
            _599 <= _1001;
        else
            _599 <= _109;
    end
    assign _2301 = _1342 == _2300;
    assign _2302 = ~ _2301;
    assign _2304 = _2295 ? _2303 : _2291;
    assign _2305 = _1595 ? _2304 : _2291;
    assign _2306 = _1351 ? _2291 : _2305;
    assign _2307 = _1306 ? _2306 : _2291;
    assign _2309 = _1205 ? _1001 : _2307;
    assign _110 = _2309;
    always @(posedge _249) begin
        if (_247)
            _2291 <= _1001;
        else
            _2291 <= _110;
    end
    assign _2303 = _2291 | _2302;
    assign _2312 = ~ _2303;
    assign _2311 = _1624 == _2245;
    assign _2313 = _2311 ? _2312 : _596;
    assign _2314 = _2295 ? _2313 : _596;
    assign _2315 = _1595 ? _2314 : _596;
    assign _2316 = _1351 ? _596 : _2315;
    assign _2317 = _1306 ? _2316 : _596;
    assign _2319 = _1205 ? _1001 : _2317;
    assign _2321 = _1203 ? _1001 : _2319;
    assign _111 = _2321;
    always @(posedge _249) begin
        if (_247)
            _596 <= _1001;
        else
            _596 <= _111;
    end
    assign _113 = host_match_addr;
    assign _587 = _113[6:0];
    assign _586 = _576[7:1];
    assign _588 = _586 == _587;
    assign _583 = 16'b1010110011100001;
    assign _2326 = _584[10:10];
    assign _2325 = _584[12:12];
    assign _2327 = _2325 ^ _2326;
    assign _2324 = _584[13:13];
    assign _2328 = _2324 ^ _2327;
    assign _2323 = _584[15:15];
    assign _2329 = _2323 ^ _2328;
    assign _2322 = _584[14:0];
    assign _2330 = { _2322,
                     _2329 };
    assign _114 = _2330;
    always @(posedge _249) begin
        if (_247)
            _584 <= _583;
        else
            _584 <= _114;
    end
    assign _585 = _584[0:0];
    assign _2349 = _120 + _1837;
    assign _2347 = _120 - _1837;
    assign _2350 = _1900 ? _2349 : _2347;
    assign _1740 = _120 == _1742;
    assign _1949 = ~ _1740;
    assign _116 = host_rx_pop;
    assign _1950 = _116 & _1949;
    assign _1899 = ~ _581;
    assign _1932 = _1651 & _1665;
    assign _2334 = _1932 ? _1651 : _1001;
    assign _1926 = ~ _1651;
    assign _1927 = _1926 & _1665;
    assign _2332 = _1927 ? _1528 : _1651;
    assign _1664 = _1662 == _1728;
    assign _1665 = _1655 & _1664;
    assign _1671 = _1651 | _1665;
    assign _1668 = _1544 | _1593;
    assign _1669 = ~ _1668;
    assign _1667 = ~ _1643;
    assign _1670 = _1667 & _1669;
    assign _1672 = _1670 & _1671;
    assign _2335 = _1672 ? _2334 : _2332;
    assign _117 = _2335;
    always @(posedge _249) begin
        if (_247)
            _1651 <= _1001;
        else
            _1651 <= _117;
    end
    assign _2343 = _1651 | _1665;
    assign _1923 = _1544 & _1593;
    assign _2339 = _1923 ? _1544 : _1001;
    assign _1907 = ~ _1544;
    assign _1908 = _1907 & _1593;
    assign _2337 = _1908 ? _1528 : _1544;
    assign _1591 = ~ _1557;
    assign _1585 = _1554 + _1352;
    assign _1580 = ~ _1493;
    assign _1579 = _1570 & _1578;
    assign _1581 = _1579 & _1580;
    assign _1582 = _1581 & _1550;
    assign _1583 = _1551 | _1582;
    assign _1586 = _1583 ? _1585 : _1554;
    assign _1588 = _1586 == _1009;
    assign _1589 = ~ _1588;
    assign _1560 = _1559 & _168;
    assign _1590 = _1560 & _1589;
    assign _1592 = _1590 & _1591;
    assign _1556 = _1554 == _1894;
    assign _1557 = _1551 & _1556;
    assign _1593 = _1557 | _1592;
    assign _1645 = _1544 | _1593;
    assign _1644 = ~ _1643;
    assign _1646 = _1644 & _1645;
    assign _2340 = _1646 ? _2339 : _2337;
    assign _118 = _2340;
    always @(posedge _249) begin
        if (_247)
            _1544 <= _1001;
        else
            _1544 <= _118;
    end
    assign _2341 = _1544 | _1593;
    assign _1641 = ~ _1607;
    assign _1635 = _1604 + _1352;
    assign _1630 = ~ _1336;
    assign _1629 = _1620 & _1628;
    assign _1631 = _1629 & _1630;
    assign _1632 = _1631 & _1600;
    assign _1633 = _1601 | _1632;
    assign _1636 = _1633 ? _1635 : _1604;
    assign _1638 = _1636 == _1009;
    assign _1639 = ~ _1638;
    assign _1610 = _1609 & _220;
    assign _1640 = _1610 & _1639;
    assign _1642 = _1640 & _1641;
    assign _1606 = _1604 == _1894;
    assign _1607 = _1601 & _1606;
    assign _1643 = _1607 | _1642;
    assign _2342 = _1643 | _2341;
    assign _2344 = _2342 | _2343;
    assign _119 = _2344;
    assign _1900 = _119 & _1899;
    assign _2345 = _1900 ^ _1950;
    assign _2351 = _2345 ? _2350 : _120;
    always @(posedge _249) begin
        if (_247)
            _2354 <= _1742;
        else
            _2354 <= _2351;
    end
    assign _120 = _2354;
    assign _581 = _120 == _1532;
    assign _2371 = _576[6:0];
    assign _2372 = { _2371,
                     _2368 };
    assign _2369 = _576[7:1];
    assign _2367 = _290[7:7];
    assign _2366 = _290[6:6];
    assign _2365 = _290[5:5];
    assign _2364 = _290[4:4];
    assign _2363 = _290[3:3];
    assign _2362 = _290[2:2];
    assign _2361 = _290[1:1];
    assign _2360 = _290[0:0];
    assign _2358 = _990[102:100];
    assign _2357 = _802[102:100];
    assign _2356 = _666[102:100];
    assign _2355 = _283[102:100];
    always @* begin
        case (f_winner)
        0:
            _2359 <= _2355;
        1:
            _2359 <= _2356;
        2:
            _2359 <= _2357;
        default:
            _2359 <= _2358;
        endcase
    end
    always @* begin
        case (_2359)
        0:
            _2368 <= _2360;
        1:
            _2368 <= _2361;
        2:
            _2368 <= _2362;
        3:
            _2368 <= _2363;
        4:
            _2368 <= _2364;
        5:
            _2368 <= _2365;
        6:
            _2368 <= _2366;
        default:
            _2368 <= _2367;
        endcase
    end
    assign _2370 = { _2368,
                     _2369 };
    assign _1659 = _990[97:96];
    assign _1658 = _802[97:96];
    assign _1657 = _666[97:96];
    assign _1656 = _283[97:96];
    always @* begin
        case (f_winner)
        0:
            _1660 <= _1656;
        1:
            _1660 <= _1657;
        2:
            _1660 <= _1658;
        default:
            _1660 <= _1659;
        endcase
    end
    assign _1662 = _1654 ? _2011 : _1660;
    always @* begin
        case (_1662)
        0:
            _2373 <= _576;
        1:
            _2373 <= _2370;
        2:
            _2373 <= _2372;
        default:
            _2373 <= _576;
        endcase
    end
    assign _2374 = _1655 ? _2373 : _576;
    assign _121 = _2374;
    always @(posedge _249) begin
        if (_247)
            _576 <= _1155;
        else
            _576 <= _121;
    end
    assign _577 = _576[0:0];
    assign _3144 = _572[7:1];
    assign _3145 = { vdd,
                     _3144 };
    assign _3142 = _3134[7:7];
    assign _3141 = _3134[6:6];
    assign _3140 = _3134[5:5];
    assign _3139 = _3134[4:4];
    assign _3138 = _3134[3:3];
    assign _3137 = _3134[2:2];
    assign _3136 = _3134[1:1];
    assign _3135 = _3134[0:0];
    assign _3143 = { _3135,
                     _3136,
                     _3137,
                     _3138,
                     _3139,
                     _3140,
                     _3141,
                     _3142 };
    assign _3127 = _226 + _1837;
    assign _3125 = _226 - _1837;
    assign _3128 = _2389 ? _3127 : _3125;
    assign _2798 = ~ _579;
    assign _3119 = ~ _579;
    assign _1561 = ~ _168;
    assign _2753 = ~ _166;
    assign _2754 = _168 & _2753;
    assign _2757 = _2754 ? _1146 : _1147;
    assign _2746 = ~ _1578;
    assign _2747 = _1570 & _2746;
    assign _2748 = _607 | _2747;
    assign _2749 = _2748 | _2738;
    assign _2751 = _2749 ? _1147 : _2745;
    assign _2732 = _1491 + _1352;
    assign _2729 = _1491 + _1352;
    assign _2725 = vdd == _1503;
    assign _2723 = _1491 == _1009;
    assign _2724 = ~ _2723;
    assign _2726 = _2724 & _2725;
    assign _2730 = _2726 ? _2729 : _1352;
    assign _2721 = _146 == _1147;
    assign _2733 = _2721 ? _2732 : _2730;
    assign _2734 = _2733 == _124;
    assign _2715 = _1491 + _1352;
    assign _2711 = gnd == _1503;
    assign _2709 = _1491 == _1009;
    assign _2710 = ~ _2709;
    assign _2712 = _2710 & _2711;
    assign _2716 = _2712 ? _2715 : _1352;
    assign _2707 = _146 == _1147;
    assign _2718 = _2707 ? _1009 : _2716;
    assign _2719 = _2718 == _124;
    assign _2735 = _1499 ? _2734 : _2719;
    assign _2736 = _1488 & _2735;
    assign _2737 = ~ _2736;
    assign _2703 = _1574 == _2245;
    assign _2701 = _1574 == _1129;
    assign _2704 = _2230 ? _2703 : _2701;
    assign _2696 = _1549 + _3392;
    assign _2697 = _2696 == _140;
    assign _2694 = _1549 == _140;
    assign _2698 = _1551 ? _2697 : _2694;
    assign _2692 = ~ _1508;
    assign _2693 = _1463 & _2692;
    assign _2699 = _2693 & _2698;
    assign _2705 = _2699 & _2704;
    assign _2738 = _2705 & _2737;
    assign _2740 = _2738 ? _1728 : _2691;
    assign _2742 = _1508 ? _2011 : _2740;
    assign _2688 = _1578 ? _2686 : _1728;
    assign _2684 = _1389 & _1387;
    assign _2686 = _2684 ? _1147 : _605;
    assign _2689 = _1570 ? _2688 : _2686;
    assign _2464 = _1578 ? _2463 : _2377;
    assign _2465 = _1570 ? _2464 : _2377;
    assign _122 = _2465;
    always @(posedge _249) begin
        if (_247)
            _2377 <= _1001;
        else
            _2377 <= _122;
    end
    assign _2614 = ~ _2463;
    assign _2612 = ~ _1475;
    assign _2613 = _2463 ? _1475 : _2612;
    always @* begin
        case (_162)
        0:
            _2615 <= _2463;
        1:
            _2615 <= _2613;
        2:
            _2615 <= _2614;
        default:
            _2615 <= _2463;
        endcase
    end
    assign _124 = host_lane1_stuff_len;
    assign _2596 = _1491 + _1352;
    assign _2597 = _1499 ? _2596 : _1009;
    assign _2592 = _1491 + _1352;
    assign _2588 = _1499 == _1503;
    assign _2586 = _1491 == _1009;
    assign _2587 = ~ _2586;
    assign _2589 = _2587 & _2588;
    assign _2593 = _2589 ? _2592 : _1352;
    assign _2584 = _146 == _1147;
    assign _2598 = _2584 ? _2597 : _2593;
    assign _2599 = _1508 ? _2582 : _2598;
    assign _2578 = _1491 + _1352;
    assign _2579 = _2463 ? _2578 : _1009;
    assign _2574 = _1491 + _1352;
    assign _2460 = _2452[7:7];
    assign _2459 = _2452[6:6];
    assign _2458 = _2452[5:5];
    assign _2457 = _2452[4:4];
    assign _2456 = _2452[3:3];
    assign _2455 = _2452[2:2];
    assign _2454 = _2452[1:1];
    assign _2450 = _2442[7:7];
    assign _2449 = _2442[6:6];
    assign _2448 = _2442[5:5];
    assign _2447 = _2442[4:4];
    assign _2446 = _2442[3:3];
    assign _2445 = _2442[2:2];
    assign _2444 = _2442[1:1];
    assign _2441 = _579 ? _1153 : _2439;
    assign _1917 = _1914[7:1];
    assign _1918 = { _1499,
                     _1917 };
    assign _1915 = _1914[6:0];
    assign _1916 = { _1915,
                     _1499 };
    assign _1919 = _127 ? _1918 : _1916;
    assign _2470 = _1551 ? _1919 : _2469;
    assign _2471 = _1545 ? _2470 : _2469;
    assign _2472 = _1508 ? _2469 : _2471;
    assign _2466 = _1550 ? _2442 : _1914;
    assign _2467 = _1493 ? _1914 : _2466;
    assign _2468 = _1578 ? _2467 : _1914;
    assign _2469 = _1570 ? _2468 : _1914;
    assign _2473 = _1463 ? _2472 : _2469;
    assign _125 = _2473;
    always @(posedge _249) begin
        if (_247)
            _1914 <= _1155;
        else
            _1914 <= _125;
    end
    assign _2381 = _1554 == _1009;
    assign _2378 = ~ _1493;
    assign _2379 = _2378 & _1550;
    assign _2382 = _2379 & _2381;
    assign _2442 = _2382 ? _2441 : _1914;
    assign _2443 = _2442[0:0];
    assign _2451 = { _2443,
                     _2444,
                     _2445,
                     _2446,
                     _2447,
                     _2448,
                     _2449,
                     _2450 };
    assign _127 = host_lane1_lsb_first;
    assign _2452 = _127 ? _2442 : _2451;
    assign _2453 = _2452[0:0];
    assign _2481 = _1554 + _1352;
    assign _2482 = _1551 ? _2481 : _2479;
    assign _2483 = _1545 ? _2482 : _2479;
    assign _2484 = _1508 ? _2479 : _2483;
    assign _2475 = _1554 + _1352;
    assign _2476 = _1550 ? _2475 : _1554;
    assign _2477 = _1493 ? _1554 : _2476;
    assign _2478 = _1578 ? _2477 : _1554;
    assign _2479 = _1570 ? _2478 : _1554;
    assign _2485 = _1463 ? _2484 : _2479;
    assign _2487 = _1362 ? _1009 : _2485;
    assign _128 = _2487;
    always @(posedge _249) begin
        if (_247)
            _1554 <= _1009;
        else
            _1554 <= _128;
    end
    always @* begin
        case (_1554)
        0:
            _2461 <= _2453;
        1:
            _2461 <= _2454;
        2:
            _2461 <= _2455;
        3:
            _2461 <= _2456;
        4:
            _2461 <= _2457;
        5:
            _2461 <= _2458;
        6:
            _2461 <= _2459;
        default:
            _2461 <= _2460;
        endcase
    end
    assign _130 = host_lane1_crc_inv;
    assign _132 = host_lane1_init;
    assign _2529 = _2233[30:0];
    assign _2531 = { _2529,
                     _1001 };
    assign _2523 = _2233[31:31];
    assign _2524 = _1499 ^ _2523;
    assign _2526 = _2524 ? _137 : _1757;
    assign _2520 = _2233[30:0];
    assign _2522 = { _2520,
                     _1001 };
    assign _2527 = _2522 ^ _2526;
    assign _2528 = _1551 ? _2527 : _2519;
    assign _134 = host_lane1_crc_width;
    assign _2497 = _1574 - _2245;
    assign _2498 = _2230 ? _2497 : _2495;
    assign _2499 = _1545 ? _2498 : _2495;
    assign _2500 = _1508 ? _2495 : _2499;
    assign _2491 = _1574 - _2245;
    assign _2492 = _1550 ? _1574 : _2491;
    assign _2493 = _1493 ? _1574 : _2492;
    assign _2494 = _1578 ? _2493 : _1574;
    assign _2495 = _1570 ? _2494 : _1574;
    assign _2501 = _1463 ? _2500 : _2495;
    assign _2502 = _2489 ? _134 : _2501;
    assign _2504 = _1362 ? _1129 : _2502;
    assign _135 = _2504;
    always @(posedge _249) begin
        if (_247)
            _1574 <= _1129;
        else
            _1574 <= _135;
    end
    assign _1576 = _1574 == _1129;
    assign _1577 = ~ _1576;
    assign _2228 = ~ _1550;
    assign _2227 = _1463 & _1545;
    assign _2229 = _2227 & _2228;
    assign _2230 = _2229 & _1577;
    assign _2532 = _2230 ? _2531 : _2528;
    assign _2533 = _1545 ? _2532 : _2519;
    assign _2534 = _1508 ? _2519 : _2533;
    assign _137 = host_lane1_poly;
    assign _2511 = _2233[31:31];
    assign _2512 = _2463 ^ _2511;
    assign _2514 = _2512 ? _137 : _1757;
    assign _2508 = _2233[30:0];
    assign _2510 = { _2508,
                     _1001 };
    assign _2515 = _2510 ^ _2514;
    assign _2505 = _2233[30:0];
    assign _2507 = { _2505,
                     _1001 };
    assign _2516 = _1550 ? _2515 : _2507;
    assign _2517 = _1493 ? _2233 : _2516;
    assign _2518 = _1578 ? _2517 : _2233;
    assign _2519 = _1570 ? _2518 : _2233;
    assign _2535 = _1463 ? _2534 : _2519;
    assign _2536 = _1362 ? _132 : _2535;
    assign _2538 = _1360 ? _1757 : _2536;
    assign _138 = _2538;
    always @(posedge _249) begin
        if (_247)
            _2233 <= _1757;
        else
            _2233 <= _138;
    end
    assign _2234 = _2233[31:31];
    assign _2235 = _2234 ^ _130;
    assign _140 = host_lane1_frame_bits;
    assign _2558 = _1549 + _3392;
    assign _1546 = _1463 & _1545;
    assign _1551 = _1546 & _1550;
    assign _2559 = _1551 ? _2558 : _2556;
    assign _1545 = ~ _1493;
    assign _2560 = _1545 ? _2559 : _2556;
    assign _2541 = _1508 ? _2540 : _1499;
    assign _2539 = _1578 ? _2463 : _1503;
    assign _2540 = _1570 ? _2539 : _1503;
    assign _2542 = _1463 ? _2541 : _2540;
    assign _2544 = _1362 ? _1528 : _2542;
    assign _141 = _2544;
    always @(posedge _249) begin
        if (_247)
            _1503 <= vdd;
        else
            _1503 <= _141;
    end
    assign _1504 = ~ _1503;
    assign _1501 = _146 == _1146;
    assign _1505 = _1501 ? _1504 : gnd;
    assign _2546 = _162 == _1146;
    assign _2547 = _2546 ? _1374 : _1497;
    assign _2548 = _1463 ? _2547 : _1497;
    assign _2550 = _1362 ? _1528 : _2548;
    assign _142 = _2550;
    always @(posedge _249) begin
        if (_247)
            _1497 <= vdd;
        else
            _1497 <= _142;
    end
    assign _1498 = _1374 == _1497;
    assign _1495 = _162 == _1146;
    assign _1499 = _1495 ? _1498 : _1374;
    assign _1506 = _1499 == _1505;
    assign _1507 = ~ _1506;
    assign _1508 = _1493 & _1507;
    assign _2561 = _1508 ? _2556 : _2560;
    assign _2552 = _1549 + _3392;
    assign _2553 = _1550 ? _2552 : _1549;
    assign _2554 = _1493 ? _1549 : _2553;
    assign _2555 = _1578 ? _2554 : _1549;
    assign _2556 = _1570 ? _2555 : _1549;
    assign _2562 = _1463 ? _2561 : _2556;
    assign _2564 = _1362 ? _1110 : _2562;
    assign _143 = _2564;
    always @(posedge _249) begin
        if (_247)
            _1549 <= _1110;
        else
            _1549 <= _143;
    end
    assign _1550 = _1549 < _140;
    assign _2462 = _1550 ? _2461 : _2235;
    assign _2463 = _1493 ? _1505 : _2462;
    assign _2570 = _2463 == _1503;
    assign _2568 = _1491 == _1009;
    assign _2569 = ~ _2568;
    assign _2571 = _2569 & _2570;
    assign _2575 = _2571 ? _2574 : _1352;
    assign _2566 = _146 == _1147;
    assign _2580 = _2566 ? _2579 : _2575;
    assign _2581 = _1578 ? _2580 : _1491;
    assign _2582 = _1570 ? _2581 : _1491;
    assign _2600 = _1463 ? _2599 : _2582;
    assign _2602 = _1362 ? _1009 : _2600;
    assign _144 = _2602;
    always @(posedge _249) begin
        if (_247)
            _1491 <= _1009;
        else
            _1491 <= _144;
    end
    assign _1492 = _1491 == _124;
    assign _146 = host_lane1_stuff;
    assign _1487 = _146 == _2011;
    assign _1488 = ~ _1487;
    assign _1493 = _1488 & _1492;
    assign _1571 = _1493 | _1550;
    assign _1578 = _1571 | _1577;
    assign _2616 = _1578 ? _2615 : _1528;
    assign _2617 = _1570 ? _2616 : _1475;
    assign _1566 = _1433 == _1110;
    assign _1564 = _1398 == _1110;
    assign _1567 = _1426 ? _1566 : _1564;
    assign _1568 = _1394 ? vdd : _1567;
    assign _1569 = _166 ? _1461 : _1568;
    assign _2609 = ~ _1569;
    assign _2606 = _162 == _1147;
    assign _2603 = ~ _168;
    assign _2604 = _1364 & _2603;
    assign _2607 = _2604 & _2606;
    assign _2608 = _2607 & _1462;
    assign _2610 = _2608 & _2609;
    assign _2618 = _2610 ? _2377 : _2617;
    assign _2620 = _1478 ? _1528 : _2618;
    assign _2622 = _1559 ? _1528 : _2620;
    assign _2624 = _1362 ? _1528 : _2622;
    assign _2626 = _1360 ? _1528 : _2624;
    assign _147 = _2626;
    always @(posedge _249) begin
        if (_247)
            _1475 <= vdd;
        else
            _1475 <= _147;
    end
    assign _1476 = _1374 == _1475;
    assign _1477 = ~ _1476;
    assign _1470 = _162 == _1147;
    assign _1471 = ~ _1470;
    assign _1467 = ~ _166;
    assign _149 = host_lane1_readback;
    assign _1464 = ~ _168;
    assign _1465 = _1364 & _1464;
    assign _1466 = _1465 & _149;
    assign _1468 = _1466 & _1467;
    assign _1472 = _1468 & _1471;
    assign _1473 = _1472 & _1462;
    assign _1478 = _1473 & _1477;
    assign _2691 = _1478 ? _2011 : _2689;
    assign _1459 = ~ _1447;
    assign _1460 = _1456 & _1459;
    assign _1455 = _306[7:7];
    assign _1454 = _306[6:6];
    assign _1453 = _306[5:5];
    assign _1452 = _306[4:4];
    assign _1451 = _306[3:3];
    assign _1450 = _306[2:2];
    assign _1449 = _306[1:1];
    assign _1448 = _306[0:0];
    always @* begin
        case (_151)
        0:
            _1456 <= _1448;
        1:
            _1456 <= _1449;
        2:
            _1456 <= _1450;
        3:
            _1456 <= _1451;
        4:
            _1456 <= _1452;
        5:
            _1456 <= _1453;
        6:
            _1456 <= _1454;
        default:
            _1456 <= _1455;
        endcase
    end
    assign _1457 = ~ _1456;
    assign _1446 = _290[7:7];
    assign _1445 = _290[6:6];
    assign _1444 = _290[5:5];
    assign _1443 = _290[4:4];
    assign _1442 = _290[3:3];
    assign _1441 = _290[2:2];
    assign _1440 = _290[1:1];
    assign _1439 = _290[0:0];
    assign _151 = host_lane1_clk_pin;
    always @* begin
        case (_151)
        0:
            _1447 <= _1439;
        1:
            _1447 <= _1440;
        2:
            _1447 <= _1441;
        3:
            _1447 <= _1442;
        4:
            _1447 <= _1443;
        5:
            _1447 <= _1444;
        6:
            _1447 <= _1445;
        default:
            _1447 <= _1446;
        endcase
    end
    assign _1458 = _1447 & _1457;
    assign _153 = host_lane1_clk_edge;
    assign _1461 = _153 ? _1460 : _1458;
    assign _1437 = _1422 == _1110;
    assign _1434 = _1433 == _1422;
    assign _1427 = _1398 == _1422;
    assign _1425 = ~ _1389;
    assign _1416 = _155[15:2];
    assign _1417 = { _2011,
                     _1416 };
    assign _1413 = _155[15:1];
    assign _1414 = { _1001,
                     _1413 };
    assign _1418 = _1414 + _1417;
    assign _1410 = _155[15:1];
    assign _1411 = { _1001,
                     _1410 };
    assign _1408 = _168 & _1391;
    assign _1419 = _1408 ? _1418 : _1411;
    always @(posedge _249) begin
        if (_247)
            _1422 <= _1110;
        else
            _1422 <= _1419;
    end
    assign _1423 = _1398 < _1422;
    assign _1400 = _155[15:2];
    assign _1401 = { _2011,
                     _1400 };
    always @(posedge _249) begin
        if (_247)
            _1404 <= _1110;
        else
            _1404 <= _1401;
    end
    assign _2672 = ~ _1389;
    assign _2673 = _1424 & _2672;
    assign _2674 = _2673 ? _1433 : _1398;
    assign _2676 = _1394 ? _1110 : _2674;
    assign _2678 = _2676 + _3392;
    assign _2656 = _2650 == _1070;
    assign _1429 = _155[15:1];
    assign _1430 = { _1001,
                     _1429 };
    always @(posedge _249) begin
        if (_247)
            _1433 <= _1110;
        else
            _1433 <= _1430;
    end
    assign _2652 = { gnd,
                     _1433 };
    assign _2653 = _2652 == _2650;
    assign _2646 = { gnd,
                     _155 };
    always @(posedge _249) begin
        if (_247)
            _2649 <= _1070;
        else
            _2649 <= _2646;
    end
    assign _2641 = 17'b00000000000000001;
    assign _155 = host_lane1_div_int;
    assign _2640 = { gnd,
                     _155 };
    assign _2642 = _2640 - _2641;
    always @(posedge _249) begin
        if (_247)
            _2645 <= _1070;
        else
            _2645 <= _2642;
    end
    assign _157 = host_lane1_div_frac;
    assign _2660 = { gnd,
                     _157 };
    assign _2662 = _2661[7:0];
    assign _2663 = _2658 ? _2662 : _2634;
    assign _2664 = _2631 ? _2663 : _2634;
    assign _2666 = _1362 ? _1155 : _2664;
    assign _158 = _2666;
    always @(posedge _249) begin
        if (_247)
            _2634 <= _1155;
        else
            _2634 <= _158;
    end
    assign _2659 = { gnd,
                     _2634 };
    assign _2661 = _2659 + _2660;
    assign _2667 = _2661[8:8];
    assign _2668 = _2658 ? _2667 : _2639;
    assign _2669 = _2631 ? _2668 : _2639;
    assign _2671 = _1362 ? _1001 : _2669;
    assign _159 = _2671;
    always @(posedge _249) begin
        if (_247)
            _2639 <= _1001;
        else
            _2639 <= _159;
    end
    assign _2650 = _2639 ? _2649 : _2645;
    assign _2636 = { gnd,
                     _1398 };
    assign _2651 = _2636 == _2650;
    assign _2654 = _1426 ? _2653 : _2651;
    assign _2657 = _1394 ? _2656 : _2654;
    assign _2635 = ~ _166;
    assign _2658 = _2635 & _2657;
    assign _2680 = _2658 ? _1110 : _2678;
    assign _2630 = ~ _166;
    assign _2628 = _1389 & _1387;
    assign _607 = _605 == _1728;
    assign _2627 = _1364 | _607;
    assign _2629 = _2627 | _2628;
    assign _2631 = _2629 & _2630;
    assign _2681 = _2631 ? _2680 : _1398;
    assign _2683 = _1362 ? _1110 : _2681;
    assign _160 = _2683;
    always @(posedge _249) begin
        if (_247)
            _1398 <= _1110;
        else
            _1398 <= _160;
    end
    assign _1405 = _1398 < _1404;
    assign _1406 = ~ _1405;
    assign _1395 = _1387 & _1391;
    assign _1407 = _1395 & _1406;
    assign _1424 = _1407 & _1423;
    assign _1426 = _1424 & _1425;
    assign _1435 = _1426 ? _1434 : _1427;
    assign _162 = host_lane1_code;
    assign _1391 = _162 == _1147;
    assign _1392 = ~ _1391;
    assign _1389 = _605 == _1146;
    assign _1393 = _1389 | _1392;
    assign _1386 = ~ _166;
    assign _1382 = _306[7:7];
    assign _1381 = _306[6:6];
    assign _1380 = _306[5:5];
    assign _1379 = _306[4:4];
    assign _1378 = _306[3:3];
    assign _1377 = _306[2:2];
    assign _1376 = _306[1:1];
    assign _1375 = _306[0:0];
    always @* begin
        case (_164)
        0:
            _1383 <= _1375;
        1:
            _1383 <= _1376;
        2:
            _1383 <= _1377;
        3:
            _1383 <= _1378;
        4:
            _1383 <= _1379;
        5:
            _1383 <= _1380;
        6:
            _1383 <= _1381;
        default:
            _1383 <= _1382;
        endcase
    end
    assign _1373 = _290[7:7];
    assign _1372 = _290[6:6];
    assign _1371 = _290[5:5];
    assign _1370 = _290[4:4];
    assign _1369 = _290[3:3];
    assign _1368 = _290[2:2];
    assign _1367 = _290[1:1];
    assign _1366 = _290[0:0];
    assign _164 = host_lane1_data_pin;
    always @* begin
        case (_164)
        0:
            _1374 <= _1366;
        1:
            _1374 <= _1367;
        2:
            _1374 <= _1368;
        3:
            _1374 <= _1369;
        4:
            _1374 <= _1370;
        5:
            _1374 <= _1371;
        6:
            _1374 <= _1372;
        default:
            _1374 <= _1373;
        endcase
    end
    assign _1384 = _1374 ^ _1383;
    assign _1385 = _168 & _1384;
    assign _1387 = _1385 & _1386;
    assign _1394 = _1387 & _1393;
    assign _1438 = _1394 ? _1437 : _1435;
    assign _166 = host_lane1_clk_pin_en;
    assign _1462 = _166 ? _1461 : _1438;
    assign _168 = host_lane1_dir;
    assign _1365 = _1364 & _168;
    assign _1463 = _1365 & _1462;
    assign _2743 = _1463 ? _2742 : _2691;
    assign _1559 = _221 == _1888;
    assign _2745 = _1559 ? _2011 : _2743;
    assign _2489 = _221 == _1894;
    assign _2752 = _2489 ? _2751 : _2745;
    assign _1362 = _221 == _1882;
    assign _2758 = _1362 ? _2757 : _2752;
    assign _1360 = _221 == _1196;
    assign _2760 = _1360 ? _2011 : _2758;
    assign _169 = _2760;
    always @(posedge _249) begin
        if (_247)
            _605 <= _2011;
        else
            _605 <= _169;
    end
    assign _1364 = _605 == _1147;
    assign _1562 = _1364 & _1561;
    assign _1570 = _1562 & _1569;
    assign _3118 = _1570 & _2382;
    assign _3120 = _3118 & _3119;
    assign _3116 = ~ _579;
    assign _1611 = ~ _220;
    assign _3094 = ~ _218;
    assign _3095 = _220 & _3094;
    assign _3098 = _3095 ? _1146 : _1147;
    assign _3087 = ~ _1628;
    assign _3088 = _1620 & _3087;
    assign _3089 = _593 | _3088;
    assign _3090 = _3089 | _3079;
    assign _3092 = _3090 ? _1147 : _3086;
    assign _3073 = _1334 + _1352;
    assign _3070 = _1334 + _1352;
    assign _3066 = vdd == _1346;
    assign _3064 = _1334 == _1009;
    assign _3065 = ~ _3064;
    assign _3067 = _3065 & _3066;
    assign _3071 = _3067 ? _3070 : _1352;
    assign _3062 = _198 == _1147;
    assign _3074 = _3062 ? _3073 : _3071;
    assign _3075 = _3074 == _172;
    assign _3056 = _1334 + _1352;
    assign _3052 = gnd == _1346;
    assign _3050 = _1334 == _1009;
    assign _3051 = ~ _3050;
    assign _3053 = _3051 & _3052;
    assign _3057 = _3053 ? _3056 : _1352;
    assign _3048 = _198 == _1147;
    assign _3059 = _3048 ? _1009 : _3057;
    assign _3060 = _3059 == _172;
    assign _3076 = _1342 ? _3075 : _3060;
    assign _3077 = _1331 & _3076;
    assign _3078 = ~ _3077;
    assign _3044 = _1624 == _2245;
    assign _3042 = _1624 == _1129;
    assign _3045 = _2295 ? _3044 : _3042;
    assign _3037 = _1599 + _3392;
    assign _3038 = _3037 == _192;
    assign _3035 = _1599 == _192;
    assign _3039 = _1601 ? _3038 : _3035;
    assign _3033 = ~ _1351;
    assign _3034 = _1306 & _3033;
    assign _3040 = _3034 & _3039;
    assign _3046 = _3040 & _3045;
    assign _3079 = _3046 & _3078;
    assign _3081 = _3079 ? _1728 : _3032;
    assign _3083 = _1351 ? _2011 : _3081;
    assign _3029 = _1628 ? _3027 : _1728;
    assign _3025 = _1232 & _1230;
    assign _3027 = _3025 ? _1147 : _591;
    assign _3030 = _1620 ? _3029 : _3027;
    assign _2793 = _1628 ? _2792 : _2763;
    assign _2794 = _1620 ? _2793 : _2763;
    assign _170 = _2794;
    always @(posedge _249) begin
        if (_247)
            _2763 <= _1001;
        else
            _2763 <= _170;
    end
    assign _2951 = ~ _2792;
    assign _2949 = ~ _1318;
    assign _2950 = _2792 ? _1318 : _2949;
    always @* begin
        case (_214)
        0:
            _2952 <= _2792;
        1:
            _2952 <= _2950;
        2:
            _2952 <= _2951;
        default:
            _2952 <= _2792;
        endcase
    end
    assign _172 = host_lane0_stuff_len;
    assign _2933 = _1334 + _1352;
    assign _2934 = _1342 ? _2933 : _1009;
    assign _2929 = _1334 + _1352;
    assign _2925 = _1342 == _1346;
    assign _2923 = _1334 == _1009;
    assign _2924 = ~ _2923;
    assign _2926 = _2924 & _2925;
    assign _2930 = _2926 ? _2929 : _1352;
    assign _2921 = _198 == _1147;
    assign _2935 = _2921 ? _2934 : _2930;
    assign _2936 = _1351 ? _2919 : _2935;
    assign _2915 = _1334 + _1352;
    assign _2916 = _2792 ? _2915 : _1009;
    assign _2911 = _1334 + _1352;
    assign _2789 = _2781[7:7];
    assign _2788 = _2781[6:6];
    assign _2787 = _2781[5:5];
    assign _2786 = _2781[4:4];
    assign _2785 = _2781[3:3];
    assign _2784 = _2781[2:2];
    assign _2783 = _2781[1:1];
    assign _2779 = _2771[7:7];
    assign _2778 = _2771[6:6];
    assign _2777 = _2771[5:5];
    assign _2776 = _2771[4:4];
    assign _2775 = _2771[3:3];
    assign _2774 = _2771[2:2];
    assign _2773 = _2771[1:1];
    assign _2436 = _2392 == _1894;
    assign _2437 = _2389 & _2436;
    always @(posedge _249) begin
        if (_247)
            _2438 <= _1155;
        else
            if (_2437)
                _2438 <= _175;
    end
    assign _2430 = _2392 == _1888;
    assign _2431 = _2389 & _2430;
    always @(posedge _249) begin
        if (_247)
            _2432 <= _1155;
        else
            if (_2431)
                _2432 <= _175;
    end
    assign _2424 = _2392 == _1882;
    assign _2425 = _2389 & _2424;
    always @(posedge _249) begin
        if (_247)
            _2426 <= _1155;
        else
            if (_2425)
                _2426 <= _175;
    end
    assign _2418 = _2392 == _1196;
    assign _2419 = _2389 & _2418;
    always @(posedge _249) begin
        if (_247)
            _2420 <= _1155;
        else
            if (_2419)
                _2420 <= _175;
    end
    assign _2412 = _2392 == _1870;
    assign _2413 = _2389 & _2412;
    always @(posedge _249) begin
        if (_247)
            _2414 <= _1155;
        else
            if (_2413)
                _2414 <= _175;
    end
    assign _2406 = _2392 == _1325;
    assign _2407 = _2389 & _2406;
    always @(posedge _249) begin
        if (_247)
            _2408 <= _1155;
        else
            if (_2407)
                _2408 <= _175;
    end
    assign _2400 = _2392 == _1352;
    assign _2401 = _2389 & _2400;
    always @(posedge _249) begin
        if (_247)
            _2402 <= _1155;
        else
            if (_2401)
                _2402 <= _175;
    end
    assign _2796 = _2392 + _1352;
    assign _2797 = _2389 ? _2796 : _2392;
    assign _173 = _2797;
    always @(posedge _249) begin
        if (_247)
            _2392 <= _1009;
        else
            _2392 <= _173;
    end
    assign _2394 = _2392 == _1009;
    assign _2395 = _2389 & _2394;
    assign _175 = host_tx_data;
    always @(posedge _249) begin
        if (_247)
            _2396 <= _1155;
        else
            if (_2395)
                _2396 <= _175;
    end
    assign _2801 = _2385 + _1352;
    assign _2802 = _2799 ? _2801 : _2385;
    assign _176 = _2802;
    always @(posedge _249) begin
        if (_247)
            _2385 <= _1009;
        else
            _2385 <= _176;
    end
    always @* begin
        case (_2385)
        0:
            _2439 <= _2396;
        1:
            _2439 <= _2402;
        2:
            _2439 <= _2408;
        3:
            _2439 <= _2414;
        4:
            _2439 <= _2420;
        5:
            _2439 <= _2426;
        6:
            _2439 <= _2432;
        default:
            _2439 <= _2438;
        endcase
    end
    assign _2770 = _579 ? _1153 : _2439;
    assign _1943 = _1940[7:1];
    assign _1944 = { _1342,
                     _1943 };
    assign _1941 = _1940[6:0];
    assign _1942 = { _1941,
                     _1342 };
    assign _1945 = _179 ? _1944 : _1942;
    assign _2807 = _1601 ? _1945 : _2806;
    assign _2808 = _1595 ? _2807 : _2806;
    assign _2809 = _1351 ? _2806 : _2808;
    assign _2803 = _1600 ? _2771 : _1940;
    assign _2804 = _1336 ? _1940 : _2803;
    assign _2805 = _1628 ? _2804 : _1940;
    assign _2806 = _1620 ? _2805 : _1940;
    assign _2810 = _1306 ? _2809 : _2806;
    assign _177 = _2810;
    always @(posedge _249) begin
        if (_247)
            _1940 <= _1155;
        else
            _1940 <= _177;
    end
    assign _2767 = _1604 == _1009;
    assign _2764 = ~ _1336;
    assign _2765 = _2764 & _1600;
    assign _2768 = _2765 & _2767;
    assign _2771 = _2768 ? _2770 : _1940;
    assign _2772 = _2771[0:0];
    assign _2780 = { _2772,
                     _2773,
                     _2774,
                     _2775,
                     _2776,
                     _2777,
                     _2778,
                     _2779 };
    assign _179 = host_lane0_lsb_first;
    assign _2781 = _179 ? _2771 : _2780;
    assign _2782 = _2781[0:0];
    assign _2818 = _1604 + _1352;
    assign _2819 = _1601 ? _2818 : _2816;
    assign _2820 = _1595 ? _2819 : _2816;
    assign _2821 = _1351 ? _2816 : _2820;
    assign _2812 = _1604 + _1352;
    assign _2813 = _1600 ? _2812 : _1604;
    assign _2814 = _1336 ? _1604 : _2813;
    assign _2815 = _1628 ? _2814 : _1604;
    assign _2816 = _1620 ? _2815 : _1604;
    assign _2822 = _1306 ? _2821 : _2816;
    assign _2824 = _1205 ? _1009 : _2822;
    assign _180 = _2824;
    always @(posedge _249) begin
        if (_247)
            _1604 <= _1009;
        else
            _1604 <= _180;
    end
    always @* begin
        case (_1604)
        0:
            _2790 <= _2782;
        1:
            _2790 <= _2783;
        2:
            _2790 <= _2784;
        3:
            _2790 <= _2785;
        4:
            _2790 <= _2786;
        5:
            _2790 <= _2787;
        6:
            _2790 <= _2788;
        default:
            _2790 <= _2789;
        endcase
    end
    assign _182 = host_lane0_crc_inv;
    assign _184 = host_lane0_init;
    assign _2866 = _2298[30:0];
    assign _2868 = { _2866,
                     _1001 };
    assign _2860 = _2298[31:31];
    assign _2861 = _1342 ^ _2860;
    assign _2863 = _2861 ? _189 : _1757;
    assign _2857 = _2298[30:0];
    assign _2859 = { _2857,
                     _1001 };
    assign _2864 = _2859 ^ _2863;
    assign _2865 = _1601 ? _2864 : _2856;
    assign _186 = host_lane0_crc_width;
    assign _2834 = _1624 - _2245;
    assign _2835 = _2295 ? _2834 : _2832;
    assign _2836 = _1595 ? _2835 : _2832;
    assign _2837 = _1351 ? _2832 : _2836;
    assign _2828 = _1624 - _2245;
    assign _2829 = _1600 ? _1624 : _2828;
    assign _2830 = _1336 ? _1624 : _2829;
    assign _2831 = _1628 ? _2830 : _1624;
    assign _2832 = _1620 ? _2831 : _1624;
    assign _2838 = _1306 ? _2837 : _2832;
    assign _2839 = _2826 ? _186 : _2838;
    assign _2841 = _1205 ? _1129 : _2839;
    assign _187 = _2841;
    always @(posedge _249) begin
        if (_247)
            _1624 <= _1129;
        else
            _1624 <= _187;
    end
    assign _1626 = _1624 == _1129;
    assign _1627 = ~ _1626;
    assign _2293 = ~ _1600;
    assign _2292 = _1306 & _1595;
    assign _2294 = _2292 & _2293;
    assign _2295 = _2294 & _1627;
    assign _2869 = _2295 ? _2868 : _2865;
    assign _2870 = _1595 ? _2869 : _2856;
    assign _2871 = _1351 ? _2856 : _2870;
    assign _189 = host_lane0_poly;
    assign _2848 = _2298[31:31];
    assign _2849 = _2792 ^ _2848;
    assign _2851 = _2849 ? _189 : _1757;
    assign _2845 = _2298[30:0];
    assign _2847 = { _2845,
                     _1001 };
    assign _2852 = _2847 ^ _2851;
    assign _2842 = _2298[30:0];
    assign _2844 = { _2842,
                     _1001 };
    assign _2853 = _1600 ? _2852 : _2844;
    assign _2854 = _1336 ? _2298 : _2853;
    assign _2855 = _1628 ? _2854 : _2298;
    assign _2856 = _1620 ? _2855 : _2298;
    assign _2872 = _1306 ? _2871 : _2856;
    assign _2873 = _1205 ? _184 : _2872;
    assign _2875 = _1203 ? _1757 : _2873;
    assign _190 = _2875;
    always @(posedge _249) begin
        if (_247)
            _2298 <= _1757;
        else
            _2298 <= _190;
    end
    assign _2299 = _2298[31:31];
    assign _2300 = _2299 ^ _182;
    assign _192 = host_lane0_frame_bits;
    assign _2895 = _1599 + _3392;
    assign _1596 = _1306 & _1595;
    assign _1601 = _1596 & _1600;
    assign _2896 = _1601 ? _2895 : _2893;
    assign _1595 = ~ _1336;
    assign _2897 = _1595 ? _2896 : _2893;
    assign _2878 = _1351 ? _2877 : _1342;
    assign _2876 = _1628 ? _2792 : _1346;
    assign _2877 = _1620 ? _2876 : _1346;
    assign _2879 = _1306 ? _2878 : _2877;
    assign _2881 = _1205 ? _1528 : _2879;
    assign _193 = _2881;
    always @(posedge _249) begin
        if (_247)
            _1346 <= vdd;
        else
            _1346 <= _193;
    end
    assign _1347 = ~ _1346;
    assign _1344 = _198 == _1146;
    assign _1348 = _1344 ? _1347 : gnd;
    assign _2883 = _214 == _1146;
    assign _2884 = _2883 ? _1217 : _1340;
    assign _2885 = _1306 ? _2884 : _1340;
    assign _2887 = _1205 ? _1528 : _2885;
    assign _194 = _2887;
    always @(posedge _249) begin
        if (_247)
            _1340 <= vdd;
        else
            _1340 <= _194;
    end
    assign _1341 = _1217 == _1340;
    assign _1338 = _214 == _1146;
    assign _1342 = _1338 ? _1341 : _1217;
    assign _1349 = _1342 == _1348;
    assign _1350 = ~ _1349;
    assign _1351 = _1336 & _1350;
    assign _2898 = _1351 ? _2893 : _2897;
    assign _2889 = _1599 + _3392;
    assign _2890 = _1600 ? _2889 : _1599;
    assign _2891 = _1336 ? _1599 : _2890;
    assign _2892 = _1628 ? _2891 : _1599;
    assign _2893 = _1620 ? _2892 : _1599;
    assign _2899 = _1306 ? _2898 : _2893;
    assign _2901 = _1205 ? _1110 : _2899;
    assign _195 = _2901;
    always @(posedge _249) begin
        if (_247)
            _1599 <= _1110;
        else
            _1599 <= _195;
    end
    assign _1600 = _1599 < _192;
    assign _2791 = _1600 ? _2790 : _2300;
    assign _2792 = _1336 ? _1348 : _2791;
    assign _2907 = _2792 == _1346;
    assign _2905 = _1334 == _1009;
    assign _2906 = ~ _2905;
    assign _2908 = _2906 & _2907;
    assign _2912 = _2908 ? _2911 : _1352;
    assign _2903 = _198 == _1147;
    assign _2917 = _2903 ? _2916 : _2912;
    assign _2918 = _1628 ? _2917 : _1334;
    assign _2919 = _1620 ? _2918 : _1334;
    assign _2937 = _1306 ? _2936 : _2919;
    assign _2939 = _1205 ? _1009 : _2937;
    assign _196 = _2939;
    always @(posedge _249) begin
        if (_247)
            _1334 <= _1009;
        else
            _1334 <= _196;
    end
    assign _1335 = _1334 == _172;
    assign _198 = host_lane0_stuff;
    assign _1330 = _198 == _2011;
    assign _1331 = ~ _1330;
    assign _1336 = _1331 & _1335;
    assign _1621 = _1336 | _1600;
    assign _1628 = _1621 | _1627;
    assign _2953 = _1628 ? _2952 : _1528;
    assign _2954 = _1620 ? _2953 : _1318;
    assign _1616 = _1276 == _1110;
    assign _1614 = _1241 == _1110;
    assign _1617 = _1269 ? _1616 : _1614;
    assign _1618 = _1237 ? vdd : _1617;
    assign _1619 = _218 ? _1304 : _1618;
    assign _2946 = ~ _1619;
    assign _2943 = _214 == _1147;
    assign _2940 = ~ _220;
    assign _2941 = _1207 & _2940;
    assign _2944 = _2941 & _2943;
    assign _2945 = _2944 & _1305;
    assign _2947 = _2945 & _2946;
    assign _2955 = _2947 ? _2763 : _2954;
    assign _2957 = _1321 ? _1528 : _2955;
    assign _2959 = _1609 ? _1528 : _2957;
    assign _2961 = _1205 ? _1528 : _2959;
    assign _2963 = _1203 ? _1528 : _2961;
    assign _199 = _2963;
    always @(posedge _249) begin
        if (_247)
            _1318 <= vdd;
        else
            _1318 <= _199;
    end
    assign _1319 = _1217 == _1318;
    assign _1320 = ~ _1319;
    assign _1313 = _214 == _1147;
    assign _1314 = ~ _1313;
    assign _1310 = ~ _218;
    assign _201 = host_lane0_readback;
    assign _1307 = ~ _220;
    assign _1308 = _1207 & _1307;
    assign _1309 = _1308 & _201;
    assign _1311 = _1309 & _1310;
    assign _1315 = _1311 & _1314;
    assign _1316 = _1315 & _1305;
    assign _1321 = _1316 & _1320;
    assign _3032 = _1321 ? _2011 : _3030;
    assign _1302 = ~ _1290;
    assign _1303 = _1299 & _1302;
    assign _1298 = _306[7:7];
    assign _1297 = _306[6:6];
    assign _1296 = _306[5:5];
    assign _1295 = _306[4:4];
    assign _1294 = _306[3:3];
    assign _1293 = _306[2:2];
    assign _1292 = _306[1:1];
    assign _1291 = _306[0:0];
    always @* begin
        case (_203)
        0:
            _1299 <= _1291;
        1:
            _1299 <= _1292;
        2:
            _1299 <= _1293;
        3:
            _1299 <= _1294;
        4:
            _1299 <= _1295;
        5:
            _1299 <= _1296;
        6:
            _1299 <= _1297;
        default:
            _1299 <= _1298;
        endcase
    end
    assign _1300 = ~ _1299;
    assign _1289 = _290[7:7];
    assign _1288 = _290[6:6];
    assign _1287 = _290[5:5];
    assign _1286 = _290[4:4];
    assign _1285 = _290[3:3];
    assign _1284 = _290[2:2];
    assign _1283 = _290[1:1];
    assign _1282 = _290[0:0];
    assign _203 = host_lane0_clk_pin;
    always @* begin
        case (_203)
        0:
            _1290 <= _1282;
        1:
            _1290 <= _1283;
        2:
            _1290 <= _1284;
        3:
            _1290 <= _1285;
        4:
            _1290 <= _1286;
        5:
            _1290 <= _1287;
        6:
            _1290 <= _1288;
        default:
            _1290 <= _1289;
        endcase
    end
    assign _1301 = _1290 & _1300;
    assign _205 = host_lane0_clk_edge;
    assign _1304 = _205 ? _1303 : _1301;
    assign _1280 = _1265 == _1110;
    assign _1277 = _1276 == _1265;
    assign _1270 = _1241 == _1265;
    assign _1268 = ~ _1232;
    assign _1259 = _207[15:2];
    assign _1260 = { _2011,
                     _1259 };
    assign _1256 = _207[15:1];
    assign _1257 = { _1001,
                     _1256 };
    assign _1261 = _1257 + _1260;
    assign _1253 = _207[15:1];
    assign _1254 = { _1001,
                     _1253 };
    assign _1251 = _220 & _1234;
    assign _1262 = _1251 ? _1261 : _1254;
    always @(posedge _249) begin
        if (_247)
            _1265 <= _1110;
        else
            _1265 <= _1262;
    end
    assign _1266 = _1241 < _1265;
    assign _1243 = _207[15:2];
    assign _1244 = { _2011,
                     _1243 };
    always @(posedge _249) begin
        if (_247)
            _1247 <= _1110;
        else
            _1247 <= _1244;
    end
    assign _3009 = ~ _1232;
    assign _3010 = _1267 & _3009;
    assign _3011 = _3010 ? _1276 : _1241;
    assign _3013 = _1237 ? _1110 : _3011;
    assign _3015 = _3013 + _3392;
    assign _2993 = _2987 == _1070;
    assign _1272 = _207[15:1];
    assign _1273 = { _1001,
                     _1272 };
    always @(posedge _249) begin
        if (_247)
            _1276 <= _1110;
        else
            _1276 <= _1273;
    end
    assign _2989 = { gnd,
                     _1276 };
    assign _2990 = _2989 == _2987;
    assign _2983 = { gnd,
                     _207 };
    always @(posedge _249) begin
        if (_247)
            _2986 <= _1070;
        else
            _2986 <= _2983;
    end
    assign _207 = host_lane0_div_int;
    assign _2977 = { gnd,
                     _207 };
    assign _2979 = _2977 - _2641;
    always @(posedge _249) begin
        if (_247)
            _2982 <= _1070;
        else
            _2982 <= _2979;
    end
    assign _209 = host_lane0_div_frac;
    assign _2997 = { gnd,
                     _209 };
    assign _2999 = _2998[7:0];
    assign _3000 = _2995 ? _2999 : _2971;
    assign _3001 = _2968 ? _3000 : _2971;
    assign _3003 = _1205 ? _1155 : _3001;
    assign _210 = _3003;
    always @(posedge _249) begin
        if (_247)
            _2971 <= _1155;
        else
            _2971 <= _210;
    end
    assign _2996 = { gnd,
                     _2971 };
    assign _2998 = _2996 + _2997;
    assign _3004 = _2998[8:8];
    assign _3005 = _2995 ? _3004 : _2976;
    assign _3006 = _2968 ? _3005 : _2976;
    assign _3008 = _1205 ? _1001 : _3006;
    assign _211 = _3008;
    always @(posedge _249) begin
        if (_247)
            _2976 <= _1001;
        else
            _2976 <= _211;
    end
    assign _2987 = _2976 ? _2986 : _2982;
    assign _2973 = { gnd,
                     _1241 };
    assign _2988 = _2973 == _2987;
    assign _2991 = _1269 ? _2990 : _2988;
    assign _2994 = _1237 ? _2993 : _2991;
    assign _2972 = ~ _218;
    assign _2995 = _2972 & _2994;
    assign _3017 = _2995 ? _1110 : _3015;
    assign _2967 = ~ _218;
    assign _2965 = _1232 & _1230;
    assign _593 = _591 == _1728;
    assign _2964 = _1207 | _593;
    assign _2966 = _2964 | _2965;
    assign _2968 = _2966 & _2967;
    assign _3018 = _2968 ? _3017 : _1241;
    assign _3020 = _1205 ? _1110 : _3018;
    assign _212 = _3020;
    always @(posedge _249) begin
        if (_247)
            _1241 <= _1110;
        else
            _1241 <= _212;
    end
    assign _1248 = _1241 < _1247;
    assign _1249 = ~ _1248;
    assign _1238 = _1230 & _1234;
    assign _1250 = _1238 & _1249;
    assign _1267 = _1250 & _1266;
    assign _1269 = _1267 & _1268;
    assign _1278 = _1269 ? _1277 : _1270;
    assign _214 = host_lane0_code;
    assign _1234 = _214 == _1147;
    assign _1235 = ~ _1234;
    assign _1232 = _591 == _1146;
    assign _1236 = _1232 | _1235;
    assign _1229 = ~ _218;
    assign _1225 = _306[7:7];
    assign _1224 = _306[6:6];
    assign _1223 = _306[5:5];
    assign _1222 = _306[4:4];
    assign _1221 = _306[3:3];
    assign _1220 = _306[2:2];
    assign _1219 = _306[1:1];
    assign _1218 = _306[0:0];
    always @* begin
        case (_216)
        0:
            _1226 <= _1218;
        1:
            _1226 <= _1219;
        2:
            _1226 <= _1220;
        3:
            _1226 <= _1221;
        4:
            _1226 <= _1222;
        5:
            _1226 <= _1223;
        6:
            _1226 <= _1224;
        default:
            _1226 <= _1225;
        endcase
    end
    assign _1216 = _290[7:7];
    assign _1215 = _290[6:6];
    assign _1214 = _290[5:5];
    assign _1213 = _290[4:4];
    assign _1212 = _290[3:3];
    assign _1211 = _290[2:2];
    assign _1210 = _290[1:1];
    assign _1209 = _290[0:0];
    assign _216 = host_lane0_data_pin;
    always @* begin
        case (_216)
        0:
            _1217 <= _1209;
        1:
            _1217 <= _1210;
        2:
            _1217 <= _1211;
        3:
            _1217 <= _1212;
        4:
            _1217 <= _1213;
        5:
            _1217 <= _1214;
        6:
            _1217 <= _1215;
        default:
            _1217 <= _1216;
        endcase
    end
    assign _1227 = _1217 ^ _1226;
    assign _1228 = _220 & _1227;
    assign _1230 = _1228 & _1229;
    assign _1237 = _1230 & _1236;
    assign _1281 = _1237 ? _1280 : _1278;
    assign _218 = host_lane0_clk_pin_en;
    assign _1305 = _218 ? _1304 : _1281;
    assign _220 = host_lane0_dir;
    assign _1208 = _1207 & _220;
    assign _1306 = _1208 & _1305;
    assign _3084 = _1306 ? _3083 : _3032;
    assign _1609 = _221 == _1325;
    assign _3086 = _1609 ? _2011 : _3084;
    assign _2826 = _221 == _1870;
    assign _3093 = _2826 ? _3092 : _3086;
    assign _1205 = _221 == _1352;
    assign _3099 = _1205 ? _3098 : _3093;
    assign _2061 = _990[90:88];
    assign _2060 = _802[90:88];
    assign _2059 = _666[90:88];
    assign _2058 = _283[90:88];
    always @* begin
        case (f_winner)
        0:
            _2062 <= _2058;
        1:
            _2062 <= _2059;
        2:
            _2062 <= _2060;
        default:
            _2062 <= _2061;
        endcase
    end
    assign _2054 = _990[87:87];
    assign _2053 = _802[87:87];
    assign _2052 = _666[87:87];
    assign _2051 = _283[87:87];
    always @* begin
        case (f_winner)
        0:
            _2055 <= _2051;
        1:
            _2055 <= _2052;
        2:
            _2055 <= _2053;
        default:
            _2055 <= _2054;
        endcase
    end
    assign _3021 = ~ _2055;
    assign _3022 = _1122 & _3021;
    assign _3024 = _3022 ? _2062 : _1009;
    assign _221 = _3024;
    assign _1203 = _221 == _1196;
    assign _3101 = _1203 ? _2011 : _3099;
    assign _222 = _3101;
    always @(posedge _249) begin
        if (_247)
            _591 <= _2011;
        else
            _591 <= _222;
    end
    assign _1207 = _591 == _1147;
    assign _1612 = _1207 & _1611;
    assign _1620 = _1612 & _1619;
    assign _3115 = _1620 & _2768;
    assign _3117 = _3115 & _3116;
    assign _3121 = _3117 | _3120;
    assign _3112 = _3108 == _1147;
    assign _3110 = _3108 == _1146;
    assign _3113 = _3110 | _3112;
    assign _3114 = _1655 & _3113;
    assign _3122 = _3114 | _3121;
    assign _223 = _3122;
    assign _2799 = _223 & _2798;
    assign _2007 = _226 == _1532;
    assign _2388 = ~ _2007;
    assign _225 = host_tx_push;
    assign _2389 = _225 & _2388;
    assign _3123 = _2389 ^ _2799;
    assign _3129 = _3123 ? _3128 : _226;
    always @(posedge _249) begin
        if (_247)
            _3132 <= _1742;
        else
            _3132 <= _3129;
    end
    assign _226 = _3132;
    assign _579 = _226 == _1742;
    assign _3134 = _579 ? _1153 : _2439;
    assign _3107 = _1688[28:27];
    assign _3105 = _990[95:94];
    assign _3104 = _802[95:94];
    assign _3103 = _666[95:94];
    assign _3102 = _283[95:94];
    always @* begin
        case (f_winner)
        0:
            _3106 <= _3102;
        1:
            _3106 <= _3103;
        2:
            _3106 <= _3104;
        default:
            _3106 <= _3105;
        endcase
    end
    assign _3108 = _1654 ? _3107 : _3106;
    always @* begin
        case (_3108)
        0:
            _3146 <= _572;
        1:
            _3146 <= _3134;
        2:
            _3146 <= _3143;
        default:
            _3146 <= _3145;
        endcase
    end
    assign _3147 = _1655 ? _3146 : _572;
    assign _227 = _3147;
    always @(posedge _249) begin
        if (_247)
            _572 <= _1155;
        else
            _572 <= _227;
    end
    assign _573 = _572[0:0];
    assign _3158 = 8'b00001000;
    assign _3157 = 8'b00000111;
    assign _3155 = 8'b00000001;
    assign _3156 = _567 - _3155;
    assign _3153 = _1688[30:29];
    assign _990 = _282[511:400];
    assign _3151 = _990[99:98];
    assign _802 = _282[399:288];
    assign _3150 = _802[99:98];
    assign _3149 = _666[99:98];
    assign _3148 = _283[99:98];
    always @* begin
        case (f_winner)
        0:
            _3152 <= _3148;
        1:
            _3152 <= _3149;
        2:
            _3152 <= _3150;
        default:
            _3152 <= _3151;
        endcase
    end
    assign _3154 = _1654 ? _3153 : _3152;
    always @* begin
        case (_3154)
        0:
            _3159 <= _567;
        1:
            _3159 <= _3156;
        2:
            _3159 <= _3157;
        default:
            _3159 <= _3158;
        endcase
    end
    assign _3160 = _1655 ? _3159 : _567;
    assign _228 = _3160;
    always @(posedge _249) begin
        if (_247)
            _567 <= _1155;
        else
            _567 <= _228;
    end
    assign _569 = _567 == _1155;
    assign _757 = _666[61:58];
    always @* begin
        case (_757)
        0:
            _758 <= vdd;
        1:
            _758 <= _569;
        2:
            _758 <= _573;
        3:
            _758 <= _577;
        4:
            _758 <= _579;
        5:
            _758 <= _581;
        6:
            _758 <= _585;
        7:
            _758 <= _588;
        8:
            _758 <= _593;
        9:
            _758 <= _596;
        10:
            _758 <= _599;
        11:
            _758 <= _602;
        12:
            _758 <= _607;
        13:
            _758 <= _610;
        14:
            _758 <= _613;
        default:
            _758 <= _616;
        endcase
    end
    assign _760 = _758 ^ _759;
    assign _752 = _666[57:42];
    assign _754 = _752 == _998;
    assign _743 = _689[57:42];
    assign _744 = { gnd,
                    _743 };
    assign _745 = _744 + _732;
    always @(posedge _249) begin
        if (_247)
            _748 <= _1070;
        else
            _748 <= _745;
    end
    assign _749 = _748 < _688;
    assign _750 = ~ _749;
    assign _739 = _666[41:26];
    assign _741 = _739 == _1110;
    assign _527 = _523 + _1352;
    assign _3176 = _523 + _1352;
    assign _3172 = _523 == _1894;
    assign _3173 = ~ _3172;
    assign _3170 = _303[0:0];
    assign _3174 = _3170 & _3173;
    assign _3177 = _3174 ? _3176 : _523;
    assign _3167 = _303[0:0];
    assign _3168 = ~ _3167;
    assign _3166 = f_chg_now[0:0];
    assign _3169 = _3166 & _3168;
    assign _3179 = _3169 ? _1352 : _3177;
    assign _3163 = _267 == _1147;
    assign _3165 = _3163 ? _1009 : _523;
    assign _3162 = _267 == _1146;
    assign _3180 = _3162 ? _3179 : _3165;
    assign _229 = _3180;
    always @(posedge _249) begin
        if (_247)
            _523 <= _1009;
        else
            _523 <= _229;
    end
    assign _525 = _523 == _1894;
    assign _528 = _525 ? _523 : _527;
    assign _518 = _303[0:0];
    assign _519 = ~ _518;
    assign _517 = f_chg_now[0:0];
    assign _520 = _517 & _519;
    assign _530 = _520 ? _1352 : _528;
    assign _514 = f_changed_all[0:0];
    assign _515 = f_in_fetch & _514;
    assign _531 = _515 ? _530 : _1009;
    assign _723 = _693[0:0];
    assign _725 = _723 ? _531 : _1009;
    assign _506 = _502 + _1352;
    assign _3195 = _502 + _1352;
    assign _3191 = _502 == _1894;
    assign _3192 = ~ _3191;
    assign _3189 = _303[1:1];
    assign _3193 = _3189 & _3192;
    assign _3196 = _3193 ? _3195 : _502;
    assign _3186 = _303[1:1];
    assign _3187 = ~ _3186;
    assign _3185 = f_chg_now[1:1];
    assign _3188 = _3185 & _3187;
    assign _3198 = _3188 ? _1352 : _3196;
    assign _3182 = _267 == _1147;
    assign _3184 = _3182 ? _1009 : _502;
    assign _3181 = _267 == _1146;
    assign _3199 = _3181 ? _3198 : _3184;
    assign _230 = _3199;
    always @(posedge _249) begin
        if (_247)
            _502 <= _1009;
        else
            _502 <= _230;
    end
    assign _504 = _502 == _1894;
    assign _507 = _504 ? _502 : _506;
    assign _497 = _303[1:1];
    assign _498 = ~ _497;
    assign _496 = f_chg_now[1:1];
    assign _499 = _496 & _498;
    assign _509 = _499 ? _1352 : _507;
    assign _493 = f_changed_all[1:1];
    assign _494 = f_in_fetch & _493;
    assign _510 = _494 ? _509 : _1009;
    assign _720 = _693[1:1];
    assign _722 = _720 ? _510 : _1009;
    assign _726 = _722 < _725;
    assign _727 = _726 ? _725 : _722;
    assign _483 = _479 + _1352;
    assign _3214 = _479 + _1352;
    assign _3210 = _479 == _1894;
    assign _3211 = ~ _3210;
    assign _3208 = _303[2:2];
    assign _3212 = _3208 & _3211;
    assign _3215 = _3212 ? _3214 : _479;
    assign _3205 = _303[2:2];
    assign _3206 = ~ _3205;
    assign _3204 = f_chg_now[2:2];
    assign _3207 = _3204 & _3206;
    assign _3217 = _3207 ? _1352 : _3215;
    assign _3201 = _267 == _1147;
    assign _3203 = _3201 ? _1009 : _479;
    assign _3200 = _267 == _1146;
    assign _3218 = _3200 ? _3217 : _3203;
    assign _231 = _3218;
    always @(posedge _249) begin
        if (_247)
            _479 <= _1009;
        else
            _479 <= _231;
    end
    assign _481 = _479 == _1894;
    assign _484 = _481 ? _479 : _483;
    assign _474 = _303[2:2];
    assign _475 = ~ _474;
    assign _473 = f_chg_now[2:2];
    assign _476 = _473 & _475;
    assign _486 = _476 ? _1352 : _484;
    assign _470 = f_changed_all[2:2];
    assign _471 = f_in_fetch & _470;
    assign _487 = _471 ? _486 : _1009;
    assign _715 = _693[2:2];
    assign _717 = _715 ? _487 : _1009;
    assign _462 = _458 + _1352;
    assign _3233 = _458 + _1352;
    assign _3229 = _458 == _1894;
    assign _3230 = ~ _3229;
    assign _3227 = _303[3:3];
    assign _3231 = _3227 & _3230;
    assign _3234 = _3231 ? _3233 : _458;
    assign _3224 = _303[3:3];
    assign _3225 = ~ _3224;
    assign _3223 = f_chg_now[3:3];
    assign _3226 = _3223 & _3225;
    assign _3236 = _3226 ? _1352 : _3234;
    assign _3220 = _267 == _1147;
    assign _3222 = _3220 ? _1009 : _458;
    assign _3219 = _267 == _1146;
    assign _3237 = _3219 ? _3236 : _3222;
    assign _232 = _3237;
    always @(posedge _249) begin
        if (_247)
            _458 <= _1009;
        else
            _458 <= _232;
    end
    assign _460 = _458 == _1894;
    assign _463 = _460 ? _458 : _462;
    assign _453 = _303[3:3];
    assign _454 = ~ _453;
    assign _452 = f_chg_now[3:3];
    assign _455 = _452 & _454;
    assign _465 = _455 ? _1352 : _463;
    assign _449 = f_changed_all[3:3];
    assign _450 = f_in_fetch & _449;
    assign _466 = _450 ? _465 : _1009;
    assign _712 = _693[3:3];
    assign _714 = _712 ? _466 : _1009;
    assign _718 = _714 < _717;
    assign _719 = _718 ? _717 : _714;
    assign _728 = _719 < _727;
    assign _729 = _728 ? _727 : _719;
    assign _437 = _433 + _1352;
    assign _3252 = _433 + _1352;
    assign _3248 = _433 == _1894;
    assign _3249 = ~ _3248;
    assign _3246 = _303[4:4];
    assign _3250 = _3246 & _3249;
    assign _3253 = _3250 ? _3252 : _433;
    assign _3243 = _303[4:4];
    assign _3244 = ~ _3243;
    assign _3242 = f_chg_now[4:4];
    assign _3245 = _3242 & _3244;
    assign _3255 = _3245 ? _1352 : _3253;
    assign _3239 = _267 == _1147;
    assign _3241 = _3239 ? _1009 : _433;
    assign _3238 = _267 == _1146;
    assign _3256 = _3238 ? _3255 : _3241;
    assign _233 = _3256;
    always @(posedge _249) begin
        if (_247)
            _433 <= _1009;
        else
            _433 <= _233;
    end
    assign _435 = _433 == _1894;
    assign _438 = _435 ? _433 : _437;
    assign _428 = _303[4:4];
    assign _429 = ~ _428;
    assign _427 = f_chg_now[4:4];
    assign _430 = _427 & _429;
    assign _440 = _430 ? _1352 : _438;
    assign _424 = f_changed_all[4:4];
    assign _425 = f_in_fetch & _424;
    assign _441 = _425 ? _440 : _1009;
    assign _705 = _693[4:4];
    assign _707 = _705 ? _441 : _1009;
    assign _416 = _412 + _1352;
    assign _3271 = _412 + _1352;
    assign _3267 = _412 == _1894;
    assign _3268 = ~ _3267;
    assign _3265 = _303[5:5];
    assign _3269 = _3265 & _3268;
    assign _3272 = _3269 ? _3271 : _412;
    assign _3262 = _303[5:5];
    assign _3263 = ~ _3262;
    assign _3261 = f_chg_now[5:5];
    assign _3264 = _3261 & _3263;
    assign _3274 = _3264 ? _1352 : _3272;
    assign _3258 = _267 == _1147;
    assign _3260 = _3258 ? _1009 : _412;
    assign _3257 = _267 == _1146;
    assign _3275 = _3257 ? _3274 : _3260;
    assign _234 = _3275;
    always @(posedge _249) begin
        if (_247)
            _412 <= _1009;
        else
            _412 <= _234;
    end
    assign _414 = _412 == _1894;
    assign _417 = _414 ? _412 : _416;
    assign _407 = _303[5:5];
    assign _408 = ~ _407;
    assign _406 = f_chg_now[5:5];
    assign _409 = _406 & _408;
    assign _419 = _409 ? _1352 : _417;
    assign _403 = f_changed_all[5:5];
    assign _404 = f_in_fetch & _403;
    assign _420 = _404 ? _419 : _1009;
    assign _702 = _693[5:5];
    assign _704 = _702 ? _420 : _1009;
    assign _708 = _704 < _707;
    assign _709 = _708 ? _707 : _704;
    assign _393 = _389 + _1352;
    assign _3290 = _389 + _1352;
    assign _3286 = _389 == _1894;
    assign _3287 = ~ _3286;
    assign _3284 = _303[6:6];
    assign _3288 = _3284 & _3287;
    assign _3291 = _3288 ? _3290 : _389;
    assign _3281 = _303[6:6];
    assign _3282 = ~ _3281;
    assign _3280 = f_chg_now[6:6];
    assign _3283 = _3280 & _3282;
    assign _3293 = _3283 ? _1352 : _3291;
    assign _3277 = _267 == _1147;
    assign _3279 = _3277 ? _1009 : _389;
    assign _3276 = _267 == _1146;
    assign _3294 = _3276 ? _3293 : _3279;
    assign _235 = _3294;
    always @(posedge _249) begin
        if (_247)
            _389 <= _1009;
        else
            _389 <= _235;
    end
    assign _391 = _389 == _1894;
    assign _394 = _391 ? _389 : _393;
    assign _384 = _303[6:6];
    assign _385 = ~ _384;
    assign _383 = f_chg_now[6:6];
    assign _386 = _383 & _385;
    assign _396 = _386 ? _1352 : _394;
    assign _380 = f_changed_all[6:6];
    assign _381 = f_in_fetch & _380;
    assign _397 = _381 ? _396 : _1009;
    assign _697 = _693[6:6];
    assign _699 = _697 ? _397 : _1009;
    assign _372 = _368 + _1352;
    assign _3309 = _368 + _1352;
    assign _3305 = _368 == _1894;
    assign _3306 = ~ _3305;
    assign _3303 = _303[7:7];
    assign _3307 = _3303 & _3306;
    assign _3310 = _3307 ? _3309 : _368;
    assign _3300 = _303[7:7];
    assign _3301 = ~ _3300;
    assign _3299 = f_chg_now[7:7];
    assign _3302 = _3299 & _3301;
    assign _3312 = _3302 ? _1352 : _3310;
    assign _3296 = _267 == _1147;
    assign _3298 = _3296 ? _1009 : _368;
    assign _3295 = _267 == _1146;
    assign _3313 = _3295 ? _3312 : _3298;
    assign _236 = _3313;
    always @(posedge _249) begin
        if (_247)
            _368 <= _1009;
        else
            _368 <= _236;
    end
    assign _370 = _368 == _1894;
    assign _373 = _370 ? _368 : _372;
    assign _363 = _303[7:7];
    assign _364 = ~ _363;
    assign _362 = f_chg_now[7:7];
    assign _365 = _362 & _364;
    assign _375 = _365 ? _1352 : _373;
    assign _359 = f_changed_all[7:7];
    assign _360 = f_in_fetch & _359;
    assign _376 = _360 ? _375 : _1009;
    assign _693 = _689[23:16];
    assign _694 = _693[7:7];
    assign _696 = _694 ? _376 : _1009;
    assign _700 = _696 < _699;
    assign _701 = _700 ? _699 : _696;
    assign _710 = _701 < _709;
    assign _711 = _710 ? _709 : _701;
    assign _730 = _711 < _729;
    assign _731 = _730 ? _729 : _711;
    assign _732 = { _1054,
                    _731 };
    assign _3316 = _334 == _1352;
    assign _3317 = _3316 ? _241 : _281;
    assign _3314 = _267 == _1146;
    assign _3318 = _3314 ? _3317 : _281;
    assign _237 = _3318;
    always @(posedge _249) begin
        if (_247)
            _281 <= _271;
        else
            _281 <= _237;
    end
    assign _348 = _334 == _1352;
    assign _349 = f_in_fetch & _348;
    assign _350 = _349 ? _241 : _281;
    assign _3321 = _334 == _1325;
    assign _3322 = _3321 ? _241 : _278;
    assign _3319 = _267 == _1146;
    assign _3323 = _3319 ? _3322 : _278;
    assign _238 = _3323;
    always @(posedge _249) begin
        if (_247)
            _278 <= _271;
        else
            _278 <= _238;
    end
    assign _344 = _334 == _1325;
    assign _345 = f_in_fetch & _344;
    assign _346 = _345 ? _241 : _278;
    assign _3326 = _334 == _1870;
    assign _3327 = _3326 ? _241 : _275;
    assign _3324 = _267 == _1146;
    assign _3328 = _3324 ? _3327 : _275;
    assign _239 = _3328;
    always @(posedge _249) begin
        if (_247)
            _275 <= _271;
        else
            _275 <= _239;
    end
    assign _340 = _334 == _1870;
    assign _341 = f_in_fetch & _340;
    assign _342 = _341 ? _241 : _275;
    assign _241 = ram_rec_rdata;
    assign _336 = _334 == _1196;
    assign _337 = f_in_fetch & _336;
    assign _338 = _337 ? _241 : _272;
    assign _351 = { _338,
                    _342,
                    _346,
                    _350 };
    assign _689 = _351[287:176];
    assign _690 = _689[41:26];
    assign _691 = { gnd,
                    _690 };
    assign _733 = _691 + _732;
    always @(posedge _249) begin
        if (_247)
            _736 <= _1070;
        else
            _736 <= _733;
    end
    assign gnd = 1'b0;
    assign _688 = { gnd,
                    _685 };
    assign _737 = _688 < _736;
    assign _738 = ~ _737;
    assign _742 = _738 | _741;
    assign _751 = _742 & _750;
    assign _3356 = _324 + _3392;
    assign _3352 = _324 == _998;
    assign _3353 = ~ _3352;
    assign _3354 = _3350 & _3353;
    assign _3357 = _3354 ? _3356 : _324;
    assign _3336 = _3335[2:2];
    assign _3337 = _1655 & _3336;
    assign _3359 = _3337 ? _1110 : _3357;
    assign _3361 = _259 ? _1110 : _3359;
    assign _242 = _3361;
    always @(posedge _249) begin
        if (_247)
            _324 <= _1110;
        else
            _324 <= _242;
    end
    assign _3373 = _321 + _3392;
    assign _3369 = _321 == _998;
    assign _3370 = ~ _3369;
    assign _3348 = 9'b111111111;
    assign _3349 = _3341 == _3348;
    assign _3346 = 6'b111111;
    assign _3345 = _3341[5:0];
    assign _3347 = _3345 == _3346;
    assign _3340 = 9'b000000000;
    assign _3362 = 9'b000000001;
    assign _3363 = _3341 + _3362;
    assign _3365 = _259 ? _3340 : _3363;
    assign _243 = _3365;
    always @(posedge _249) begin
        if (_247)
            _3341 <= _3340;
        else
            _3341 <= _243;
    end
    assign _3342 = _3341[2:0];
    assign _3344 = _3342 == _1894;
    assign _3338 = _1688[63:62];
    always @* begin
        case (_3338)
        0:
            _3350 <= vdd;
        1:
            _3350 <= _3344;
        2:
            _3350 <= _3347;
        default:
            _3350 <= _3349;
        endcase
    end
    assign _3371 = _3350 & _3370;
    assign _3374 = _3371 ? _3373 : _321;
    assign _3366 = _3335[1:1];
    assign _3367 = _1655 & _3366;
    assign _3376 = _3367 ? _1110 : _3374;
    assign _3378 = _259 ? _1110 : _3376;
    assign _244 = _3378;
    always @(posedge _249) begin
        if (_247)
            _321 <= _1110;
        else
            _321 <= _244;
    end
    assign _684 = _666[25:24];
    always @* begin
        case (_684)
        0:
            _685 <= _318;
        1:
            _685 <= _321;
        2:
            _685 <= _324;
        default:
            _685 <= _324;
        endcase
    end
    assign _687 = _685 == _998;
    assign _755 = _687 ? _754 : _751;
    always @(posedge _249) begin
        if (_247)
            _306 <= _1155;
        else
            _306 <= _290;
    end
    assign f_chg_now = _290 ^ _306;
    assign _3380 = _267 == _1147;
    assign _3382 = _3380 ? _1155 : _303;
    assign _3379 = _267 == _1146;
    assign _3383 = _3379 ? f_changed_all : _3382;
    assign _3385 = _259 ? _1155 : _3383;
    assign _245 = _3385;
    always @(posedge _249) begin
        if (_247)
            _303 <= _1155;
        else
            _303 <= _245;
    end
    assign f_changed_all = _303 | f_chg_now;
    assign _678 = f_changed_all & _675;
    assign _680 = _678 == _1155;
    assign _681 = ~ _680;
    assign _675 = _666[23:16];
    assign _677 = _675 == _1155;
    assign _682 = _677 | _681;
    assign _670 = _666[7:0];
    assign _668 = _666[15:8];
    assign vdd = 1'b1;
    assign _247 = clear;
    assign _249 = clock;
    assign _251 = pins_in;
    always @(posedge _249) begin
        if (_247)
            _287 <= _1155;
        else
            _287 <= _251;
    end
    always @(posedge _249) begin
        if (_247)
            _290 <= _1155;
        else
            _290 <= _287;
    end
    assign _669 = _290 ^ _668;
    assign _671 = _669 & _670;
    assign _673 = _671 == _1155;
    assign _666 = _282[287:176];
    assign _667 = _666[111:111];
    assign _674 = _667 & _673;
    assign _683 = _674 & _682;
    assign _756 = _683 & _755;
    assign _761 = _756 & _760;
    assign _800 = _761 & _799;
    assign f_fire1 = f_in_eval & _800;
    assign _942 = f_fire1 ? _1146 : _940;
    assign f_winner = f_fire0 ? _2011 : _942;
    always @* begin
        case (f_winner)
        0:
            _3333 <= _3329;
        1:
            _3333 <= _3330;
        2:
            _3333 <= _3331;
        default:
            _3333 <= _3332;
        endcase
    end
    assign _3335 = _1654 ? _3334 : _3333;
    assign _3386 = _3335[0:0];
    assign _3387 = _1655 & _3386;
    assign _3396 = _3387 ? _1110 : _3394;
    assign _3398 = _259 ? _1110 : _3396;
    assign _252 = _3398;
    always @(posedge _249) begin
        if (_247)
            _318 <= _1110;
        else
            _318 <= _252;
    end
    assign _1707 = _1688[33:32];
    always @* begin
        case (_1707)
        0:
            _1708 <= _318;
        1:
            _1708 <= _321;
        2:
            _1708 <= _324;
        default:
            _1708 <= _324;
        endcase
    end
    assign _1706 = _1688[49:34];
    assign _1709 = _1706 < _1708;
    assign _1688 = _282[63:0];
    assign _1704 = _1688[31:31];
    assign _1702 = ~ _1122;
    assign _1703 = f_in_eval & _1702;
    assign _1705 = _1703 & _1704;
    assign _1710 = _1705 & _1709;
    assign _1715 = _1710 & _1714;
    assign _1724 = _1715 | f_unexp_now;
    assign _3404 = _1724 ? _3403 : _334;
    assign _3407 = _1122 ? _3406 : _3404;
    assign _3400 = _267 == _1147;
    assign _3408 = _3400 ? _3407 : _334;
    assign _3399 = _267 == _1146;
    assign _3411 = _3399 ? _3410 : _3408;
    assign _3413 = _259 ? _1009 : _3411;
    assign _253 = _3413;
    always @(posedge _249) begin
        if (_247)
            _334 <= _1009;
        else
            _334 <= _253;
    end
    assign _3416 = _334 == _1196;
    assign _3417 = _3416 ? _241 : _272;
    assign _3414 = _267 == _1146;
    assign _3418 = _3414 ? _3417 : _272;
    assign _254 = _3418;
    always @(posedge _249) begin
        if (_247)
            _272 <= _271;
        else
            _272 <= _254;
    end
    assign _282 = { _272,
                    _275,
                    _278,
                    _281 };
    assign _283 = _282[175:64];
    assign _284 = _283[111:111];
    assign _297 = _284 & _296;
    assign _314 = _297 & _313;
    assign _563 = _314 & _562;
    assign _620 = _563 & _619;
    assign _664 = _620 & _663;
    assign f_in_eval = _267 == _1147;
    assign f_fire0 = f_in_eval & _664;
    assign _1029 = f_fire0 | f_fire1;
    assign _1030 = _1029 | f_fire2;
    assign _1122 = _1030 | f_fire3;
    assign _3437 = _1122 ? _3436 : _3434;
    assign _3422 = _267 == _1728;
    assign _3424 = _3422 ? _2011 : _267;
    assign _3420 = _267 == _1147;
    assign _3438 = _3420 ? _3437 : _3424;
    assign _3419 = _267 == _1146;
    assign _3441 = _3419 ? _3440 : _3438;
    assign _256 = host_stop;
    assign _3443 = _256 ? _2011 : _3441;
    assign _3445 = _259 ? _1146 : _3443;
    assign _257 = _3445;
    always @(posedge _249) begin
        if (_247)
            _267 <= _2011;
        else
            _267 <= _257;
    end
    assign f_in_fetch = _267 == _1146;
    assign _1654 = f_in_fetch & _1653;
    assign _1655 = _1654 | _1122;
    assign _2028 = _1655 & _2027;
    assign _3467 = _2028 ? _3466 : _2092;
    assign _259 = host_start;
    assign _3469 = _259 ? _1155 : _3467;
    assign _260 = _3469;
    always @(posedge _249) begin
        if (_247)
            _2092 <= _1155;
        else
            _2092 <= _260;
    end
    assign _2093 = _2092[7:7];
    assign _262 = host_pin_src;
    assign _2089 = _262[23:21];
    always @* begin
        case (_2089)
        0:
            _2100 <= _2093;
        1:
            _2100 <= _1318;
        2:
            _2100 <= _2094;
        3:
            _2100 <= _2095;
        4:
            _2100 <= _2097;
        5:
            _2100 <= _1475;
        6:
            _2100 <= _2098;
        default:
            _2100 <= _2099;
        endcase
    end
    assign _2164 = { _2100,
                     _2109,
                     _2118,
                     _2127,
                     _2136,
                     _2145,
                     _2154,
                     _2163 };
    assign _3471 = _2164 & _3470;
    assign pins_out = _3471;
    assign pins_oe = _2167;
    assign st_running = _2024;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1130;
    assign st_accepting = _2023;
    assign st_taken = _2021;
    assign st_taken_edge = _2018;
    assign st_viol = _2015;
    assign st_viol_kind = _2012;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _2007;
    assign st_tx_empty = _579;
    assign st_rx_data = _2005;
    assign st_rx_empty = _1740;
    assign st_vlog_data = _1898;
    assign st_vlog_empty = _1743;
    assign st_cov_rdata = _50;
    assign st_irq = _1747;
    assign st_halted_viol = _1687;
    assign st_rx_overflow = _1680;
    assign st_vlog_overflow = _1537;
    assign st_cov_overrun = _1527;
    assign st_lane_status = _1518;
    assign ram_rec_addr = _1201;
    assign ram_rec_re = _1198;
    assign ram_rec_we = _1195;
    assign ram_rec_wdata = _20;
    assign ram_cov_addr = _1194;
    assign ram_cov_re = _1189;
    assign ram_cov_we = _1186;
    assign ram_cov_wdata = _1178;

endmodule
