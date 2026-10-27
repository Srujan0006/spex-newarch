module spex_core (
    host_cov_wdata,
    host_cov_addr,
    host_rec_wdata,
    host_rec_waddr,
    host_lane_we,
    host_cov_re,
    host_cov_we,
    host_rec_we,
    host_err_clear,
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
    st_host_err,
    st_host_err_cause,
    st_lane_active,
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
    input [7:0] host_cov_addr;
    input [127:0] host_rec_wdata;
    input [7:0] host_rec_waddr;
    input [1:0] host_lane_we;
    input host_cov_re;
    input host_cov_we;
    input host_rec_we;
    input host_err_clear;
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
    output st_host_err;
    output [2:0] st_host_err_cause;
    output [1:0] st_lane_active;
    output [15:0] st_lane_status;
    output [7:0] ram_rec_addr;
    output ram_rec_re;
    output ram_rec_we;
    output [127:0] ram_rec_wdata;
    output [7:0] ram_cov_addr;
    output ram_cov_re;
    output ram_cov_we;
    output [31:0] ram_cov_wdata;

    wire [11:0] _1243;
    wire _1240;
    wire _1241;
    wire [11:0] _1242;
    wire _1244;
    wire [11:0] _1245;
    wire [11:0] _1246;
    wire [11:0] _1232;
    wire [11:0] _1089;
    wire [11:0] _1086;
    wire [12:0] _1083;
    wire [9:0] _1080;
    wire [12:0] _1081;
    wire [12:0] _1082;
    wire [2:0] _1076;
    reg [2:0] _1056;
    wire [2:0] _1;
    reg [2:0] _1077;
    wire [12:0] _1078;
    wire [12:0] _1063;
    wire [12:0] _1062;
    wire [15:0] _1057;
    wire _1061;
    wire [12:0] _1064;
    wire [12:0] _2;
    reg [12:0] _1073;
    wire _1079;
    wire [12:0] _1084;
    wire [12:0] _1070;
    wire _1085;
    wire [11:0] _1088;
    wire _1068;
    wire [15:0] _1065;
    wire _1066;
    wire _3;
    reg _1069;
    wire [11:0] _1090;
    wire [11:0] _4;
    reg [11:0] _1233;
    wire [11:0] _1093;
    reg [1:0] _1059;
    reg [15:0] _1060;
    wire [15:0] _1091;
    wire _1092;
    wire [11:0] _1095;
    wire [11:0] _5;
    reg [11:0] _1230;
    wire _1234;
    wire _1235;
    wire [11:0] _1236;
    wire [11:0] _1227;
    wire _1237;
    wire [11:0] _1238;
    wire [7:0] _1225;
    wire _1226;
    wire [11:0] _1239;
    wire [7:0] _1223;
    wire [7:0] _1222;
    wire [1:0] _1217;
    wire [1:0] _1216;
    wire _1205;
    wire _1197;
    wire _1206;
    wire _6;
    reg _1215;
    wire [1:0] _1218;
    wire [6:0] _1212;
    wire [8:0] _1219;
    wire [7:0] _1210;
    wire [8:0] _1211;
    wire [8:0] _1220;
    wire _1221;
    wire [7:0] _1224;
    wire [31:0] _1247;
    wire [31:0] _8;
    wire [31:0] _1248;
    wire _1256;
    wire _1254;
    wire _1252;
    wire _1251;
    wire _1253;
    wire f_host_cov_we;
    wire _1258;
    wire _1257;
    wire _1259;
    wire [7:0] _12;
    reg [7:0] _1263;
    wire [7:0] _14;
    wire [7:0] _1260;
    wire [7:0] _1264;
    wire [127:0] _17;
    wire _1265;
    wire [1:0] _1269;
    wire [7:0] _1270;
    wire [7:0] _22;
    wire [2:0] _1266;
    wire _1267;
    wire _1268;
    wire [7:0] _1271;
    wire [2:0] _1423;
    wire [2:0] _1424;
    wire [2:0] _1396;
    wire [2:0] _1398;
    wire [2:0] _1399;
    wire [2:0] _1425;
    wire [2:0] _1427;
    wire [2:0] _1429;
    wire [2:0] _24;
    reg [2:0] _1395;
    wire [7:0] _1589;
    wire [2:0] _1582;
    wire [2:0] _1556;
    wire [2:0] _1557;
    wire [2:0] _1583;
    wire [2:0] _1585;
    wire [2:0] _1587;
    wire [2:0] _25;
    reg [2:0] _1553;
    wire [7:0] _1588;
    wire [15:0] _1590;
    wire [1:0] _1593;
    wire [2:0] _1628;
    wire [2:0] _1630;
    wire [2:0] _28;
    reg [2:0] _1627;
    wire _1631;
    wire _1623;
    wire [2:0] _1614;
    wire [2:0] _1611;
    wire [2:0] _1615;
    wire _1591;
    wire _1606;
    wire _1607;
    wire _1592;
    wire [1:0] _31;
    wire _1604;
    wire _1605;
    wire _1608;
    wire _32;
    reg _1209;
    wire _1600;
    wire _1599;
    wire _1601;
    wire _1597;
    wire _34;
    wire _36;
    wire _1596;
    wire _1598;
    wire _1602;
    wire _1594;
    wire _38;
    wire _1595;
    wire _1603;
    wire _1609;
    wire [2:0] _1616;
    wire _1618;
    wire _1619;
    wire _1624;
    wire _1632;
    wire _40;
    wire _1634;
    wire _41;
    reg _1622;
    wire [7:0] _43;
    reg [7:0] _1204;
    wire [7:0] _1201;
    wire _1638;
    wire _1639;
    wire _1635;
    wire _1636;
    wire _44;
    reg _1196;
    wire _46;
    wire _1193;
    wire _1637;
    wire _1640;
    wire _1645;
    wire _1647;
    wire _47;
    reg _1643;
    wire _1650;
    wire _1655;
    wire _1657;
    wire _49;
    reg _1653;
    wire _1789;
    wire _1782;
    wire _1790;
    wire _1763;
    wire _1710;
    wire _1764;
    wire _1791;
    wire _51;
    wire _1792;
    wire _1793;
    wire _1798;
    wire _1800;
    wire _52;
    reg _1796;
    wire _1804;
    wire _1805;
    wire _1810;
    wire _56;
    wire _1812;
    wire _1814;
    wire _57;
    reg _1808;
    wire _1843;
    wire _1845;
    wire _1841;
    wire _1847;
    wire _1848;
    wire _1849;
    wire _1816;
    wire _1850;
    wire _1852;
    wire _58;
    reg _1803;
    wire _1858;
    wire _1855;
    wire _1859;
    wire _1860;
    wire _1861;
    wire [31:0] _61;
    wire [31:0] _1862;
    wire [31:0] _1863;
    wire [2:0] _2230;
    wire _2231;
    wire _2232;
    wire [47:0] _2229;
    reg [47:0] _2233;
    wire [2:0] _2224;
    wire _2225;
    wire _2226;
    reg [47:0] _2227;
    wire [2:0] _2218;
    wire _2219;
    wire _2220;
    reg [47:0] _2221;
    wire _2213;
    wire _2214;
    reg [47:0] _2215;
    wire _2207;
    wire _2208;
    reg [47:0] _2209;
    wire _2201;
    wire _2202;
    reg [47:0] _2203;
    wire _2195;
    wire _2196;
    reg [47:0] _2197;
    wire [2:0] _1870;
    wire [2:0] _1871;
    wire [2:0] _64;
    reg [2:0] _1868;
    wire _2189;
    wire _2190;
    wire [2:0] _2162;
    wire [28:0] _1879;
    wire [28:0] _1878;
    wire [28:0] _1881;
    wire [28:0] _1882;
    wire [2:0] _1875;
    wire _1877;
    wire [28:0] _1883;
    wire [28:0] _65;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2160;
    wire [2:0] _1901;
    wire _1897;
    wire _1898;
    wire _1895;
    wire _1899;
    wire [2:0] _1902;
    wire _1892;
    wire _1893;
    wire _1890;
    wire _1889;
    wire _1891;
    wire _1894;
    wire [2:0] _1904;
    wire _1885;
    wire [2:0] _1905;
    wire [2:0] _66;
    reg [2:0] _1888;
    wire _2151;
    wire [2:0] _2153;
    wire [2:0] _1922;
    wire _1918;
    wire _1919;
    wire _1916;
    wire _1920;
    wire [2:0] _1923;
    wire _1913;
    wire _1914;
    wire _1911;
    wire _1910;
    wire _1912;
    wire _1915;
    wire [2:0] _1925;
    wire _1906;
    wire [2:0] _1926;
    wire [2:0] _67;
    reg [2:0] _1909;
    wire _2148;
    wire [2:0] _2150;
    wire [2:0] _2154;
    wire [2:0] _1943;
    wire _1939;
    wire _1940;
    wire _1937;
    wire _1941;
    wire [2:0] _1944;
    wire _1934;
    wire _1935;
    wire _1932;
    wire _1931;
    wire _1933;
    wire _1936;
    wire [2:0] _1946;
    wire _1927;
    wire [2:0] _1947;
    wire [2:0] _68;
    reg [2:0] _1930;
    wire _2144;
    wire [2:0] _2146;
    wire [2:0] _1964;
    wire _1960;
    wire _1961;
    wire _1958;
    wire _1962;
    wire [2:0] _1965;
    wire _1955;
    wire _1956;
    wire _1953;
    wire _1952;
    wire _1954;
    wire _1957;
    wire [2:0] _1967;
    wire _1948;
    wire [2:0] _1968;
    wire [2:0] _69;
    reg [2:0] _1951;
    wire _2141;
    wire [2:0] _2143;
    wire [2:0] _2147;
    wire [2:0] _2155;
    wire [2:0] _1985;
    wire _1981;
    wire _1982;
    wire _1979;
    wire _1983;
    wire [2:0] _1986;
    wire _1976;
    wire _1977;
    wire _1974;
    wire _1973;
    wire _1975;
    wire _1978;
    wire [2:0] _1988;
    wire _1969;
    wire [2:0] _1989;
    wire [2:0] _70;
    reg [2:0] _1972;
    wire _2136;
    wire [2:0] _2138;
    wire [2:0] _2006;
    wire _2002;
    wire _2003;
    wire _2000;
    wire _2004;
    wire [2:0] _2007;
    wire _1997;
    wire _1998;
    wire _1995;
    wire _1994;
    wire _1996;
    wire _1999;
    wire [2:0] _2009;
    wire _1990;
    wire [2:0] _2010;
    wire [2:0] _71;
    reg [2:0] _1993;
    wire _2133;
    wire [2:0] _2135;
    wire [2:0] _2139;
    wire [2:0] _2027;
    wire _2023;
    wire _2024;
    wire _2021;
    wire _2025;
    wire [2:0] _2028;
    wire _2018;
    wire _2019;
    wire _2016;
    wire _2015;
    wire _2017;
    wire _2020;
    wire [2:0] _2030;
    wire _2011;
    wire [2:0] _2031;
    wire [2:0] _72;
    reg [2:0] _2014;
    wire _2129;
    wire [2:0] _2131;
    wire [2:0] _2048;
    wire _2044;
    wire _2045;
    wire _2042;
    wire _2046;
    wire [2:0] _2049;
    wire _2039;
    wire _2040;
    wire _2037;
    wire _2036;
    wire _2038;
    wire _2041;
    wire [2:0] _2051;
    wire _2032;
    wire [2:0] _2052;
    wire [2:0] _73;
    reg [2:0] _2035;
    wire _2126;
    wire [2:0] _2128;
    wire [2:0] _2132;
    wire [2:0] _2140;
    wire [2:0] _2156;
    wire _2121;
    wire _2120;
    wire _2122;
    wire _2118;
    wire _2117;
    wire _2119;
    wire _2123;
    wire _2114;
    wire _2113;
    wire _2115;
    wire _2111;
    wire _2110;
    wire _2112;
    wire _2116;
    wire _2124;
    wire [2:0] _2157;
    wire _2099;
    wire _2098;
    wire _2100;
    wire [2:0] _2102;
    wire _2094;
    wire _2093;
    wire _2095;
    wire [2:0] _2097;
    wire _2103;
    wire [2:0] _2104;
    wire _2087;
    wire _2086;
    wire _2088;
    wire [2:0] _2090;
    wire _2082;
    wire _2081;
    wire _2083;
    wire [2:0] _2085;
    wire _2091;
    wire [2:0] _2092;
    wire _2105;
    wire [2:0] _2106;
    wire _2073;
    wire _2072;
    wire _2074;
    wire [2:0] _2076;
    wire _2068;
    wire _2067;
    wire _2069;
    wire [2:0] _2071;
    wire _2077;
    wire [2:0] _2078;
    wire _2061;
    wire _2060;
    wire _2062;
    wire [2:0] _2064;
    wire _2056;
    wire _2055;
    wire _2057;
    wire [2:0] _2059;
    wire _2065;
    wire [2:0] _2066;
    wire _2079;
    wire [2:0] _2080;
    wire _2107;
    wire [2:0] _2108;
    wire [2:0] _2109;
    wire [2:0] _2158;
    wire [2:0] _2053;
    wire _2159;
    wire [28:0] _2161;
    wire [31:0] _2163;
    wire [47:0] _2167;
    wire [47:0] _74;
    reg [47:0] _2191;
    wire [2:0] _2184;
    wire [3:0] _1856;
    wire [3:0] _2173;
    wire [3:0] _2174;
    wire [3:0] _2172;
    wire [3:0] _2175;
    wire [3:0] _1648;
    wire _1649;
    wire _1864;
    wire _75;
    wire _1865;
    wire _2170;
    wire [3:0] _2176;
    reg [3:0] _2179;
    wire [3:0] _76;
    wire _1857;
    wire _2168;
    wire _78;
    wire _2169;
    wire [2:0] _2185;
    wire [2:0] _79;
    reg [2:0] _2182;
    reg [47:0] _2234;
    wire _2338;
    wire _2339;
    reg [7:0] _2340;
    wire _2332;
    wire _2333;
    reg [7:0] _2334;
    wire _2326;
    wire _2327;
    reg [7:0] _2328;
    wire _2320;
    wire _2321;
    reg [7:0] _2322;
    wire _2314;
    wire _2315;
    reg [7:0] _2316;
    wire _2308;
    wire _2309;
    reg [7:0] _2310;
    wire _2302;
    wire _2303;
    reg [7:0] _2304;
    wire [2:0] _2241;
    wire [2:0] _2242;
    wire [2:0] _82;
    reg [2:0] _2239;
    wire _2296;
    wire _2297;
    wire [7:0] _2282;
    wire [7:0] _2283;
    wire [7:0] _2260;
    wire [7:0] _2258;
    wire [7:0] _2261;
    wire [7:0] _83;
    reg [7:0] _2247;
    wire [7:0] _2256;
    wire [7:0] _2257;
    wire [7:0] _2272;
    wire [7:0] _2269;
    wire [7:0] _2267;
    wire [7:0] _2270;
    wire [7:0] _84;
    reg [7:0] _2266;
    wire [7:0] _2271;
    wire [7:0] _2273;
    wire [7:0] _2284;
    wire [7:0] _85;
    reg [7:0] _2298;
    wire [2:0] _2291;
    wire [2:0] _2292;
    wire [2:0] _86;
    reg [2:0] _2289;
    reg [7:0] _2341;
    wire [31:0] _2344;
    wire [31:0] _2345;
    wire [31:0] _90;
    reg [31:0] ts_reg;
    wire [1:0] _2347;
    wire [1:0] _2164;
    wire [1:0] _2166;
    reg [1:0] _2348;
    reg _2351;
    reg [1:0] _2354;
    reg _2357;
    wire _2358;
    wire _2359;
    wire _1250;
    wire _2360;
    wire [7:0] _2501;
    wire [7:0] _2502;
    wire [7:0] _2382;
    wire [7:0] _2380;
    wire [7:0] _2379;
    wire [7:0] _2378;
    wire [7:0] _2377;
    reg [7:0] _2381;
    wire [7:0] _2383;
    wire [7:0] _2384;
    wire [7:0] _2375;
    wire [7:0] _2376;
    wire [7:0] _2385;
    wire [7:0] _2419;
    wire [7:0] _2420;
    wire [7:0] _2422;
    wire [7:0] _2424;
    wire [7:0] _100;
    reg [7:0] _2367;
    wire [7:0] _2503;
    wire [7:0] _103;
    wire [7:0] _3820;
    wire _2498;
    wire _2497;
    wire _2495;
    wire _2496;
    wire _2494;
    wire _2493;
    wire _2492;
    wire [2:0] _2491;
    reg _2499;
    wire _2489;
    wire _2488;
    wire _2486;
    wire _2487;
    wire _2485;
    wire _2484;
    wire _2483;
    wire [2:0] _2482;
    reg _2490;
    wire _2480;
    wire _2479;
    wire _2477;
    wire _2478;
    wire _2476;
    wire _2475;
    wire _2474;
    wire [2:0] _2473;
    reg _2481;
    wire _2471;
    wire _2470;
    wire _2468;
    wire _2469;
    wire _2467;
    wire _2466;
    wire _2465;
    wire [2:0] _2464;
    reg _2472;
    wire _2462;
    wire _2461;
    wire _2459;
    wire _2460;
    wire _2458;
    wire _2457;
    wire _2456;
    wire [2:0] _2455;
    reg _2463;
    wire _2453;
    wire _2452;
    wire _2450;
    wire _2451;
    wire _2449;
    wire _2448;
    wire _2447;
    wire [2:0] _2446;
    reg _2454;
    wire _2444;
    wire _2443;
    wire _2441;
    wire _2442;
    wire _2440;
    wire _2439;
    wire _2438;
    wire [2:0] _2437;
    reg _2445;
    wire _2435;
    wire _2434;
    wire _2432;
    wire _2433;
    wire _2431;
    wire _2430;
    wire [2:0] _3812;
    wire _3809;
    wire [1:0] _3810;
    wire [3:0] _3811;
    wire [6:0] _3813;
    wire [7:0] _3814;
    wire [7:0] _3815;
    wire _2416;
    wire _2415;
    wire _2414;
    wire _2412;
    wire _2413;
    wire _2410;
    wire _2411;
    wire _2407;
    wire _2408;
    wire _2409;
    wire _2404;
    wire _2405;
    wire _2406;
    wire _2401;
    wire _2400;
    wire _2402;
    wire _2399;
    wire _2403;
    wire [7:0] _2417;
    wire _2386;
    wire _2392;
    wire [7:0] _2418;
    wire [7:0] _3807;
    wire [7:0] _3803;
    wire [7:0] _3801;
    wire [7:0] _3800;
    wire [7:0] _3799;
    wire [7:0] _3798;
    reg [7:0] _3802;
    wire [7:0] _3804;
    wire [7:0] _3805;
    wire [7:0] _2373;
    wire [7:0] _2371;
    wire [7:0] _2370;
    wire [7:0] _2369;
    wire [7:0] _2368;
    reg [7:0] _2372;
    wire [7:0] _2374;
    wire [7:0] _3796;
    wire [7:0] _3797;
    wire [7:0] _3806;
    wire [7:0] _3808;
    wire [7:0] _3816;
    wire _2362;
    wire _2363;
    wire _1769;
    wire [1:0] _3790;
    wire [1:0] _3786;
    wire [1:0] _1842;
    wire _3777;
    wire [1:0] _3779;
    wire _3776;
    wire [1:0] _3781;
    wire _3775;
    wire [1:0] _3783;
    wire [1:0] _3784;
    wire [7:0] _1187;
    wire _1189;
    wire _1180;
    wire [15:0] _1175;
    wire _1176;
    wire _1177;
    wire _1174;
    wire _1178;
    wire _1181;
    wire [3:0] _1171;
    wire _1173;
    wire _1182;
    wire _1169;
    wire _1165;
    wire _1166;
    wire _1163;
    wire _1167;
    wire _1170;
    wire _1161;
    reg [2:0] _1055;
    wire [15:0] _1156;
    wire _1157;
    wire _1154;
    wire _1158;
    wire _1152;
    wire _1159;
    wire _1162;
    wire [1:0] _1151;
    reg _1183;
    wire _1150;
    wire _1184;
    wire _1147;
    wire [3:0] _1145;
    reg _1146;
    wire _1148;
    wire [15:0] _1140;
    wire _1142;
    wire [16:0] _1135;
    wire [15:0] _1131;
    wire [16:0] _1132;
    wire [16:0] _1133;
    reg [16:0] _1136;
    wire _1137;
    wire _1138;
    wire [15:0] _1127;
    wire _1129;
    wire _1044;
    wire [2:0] _1046;
    wire _1041;
    wire [2:0] _1043;
    wire _1047;
    wire [2:0] _1048;
    wire _1036;
    wire [2:0] _1038;
    wire _1033;
    wire [2:0] _1035;
    wire _1039;
    wire [2:0] _1040;
    wire _1049;
    wire [2:0] _1050;
    wire _1026;
    wire [2:0] _1028;
    wire _1023;
    wire [2:0] _1025;
    wire _1029;
    wire [2:0] _1030;
    wire _1018;
    wire [2:0] _1020;
    wire [7:0] _1014;
    wire _1015;
    wire [2:0] _1017;
    wire _1021;
    wire [2:0] _1022;
    wire _1031;
    wire [2:0] _1032;
    wire _1051;
    wire [2:0] _1052;
    wire [13:0] _1119;
    wire [16:0] _1120;
    wire [111:0] _1013;
    wire [15:0] _1117;
    wire [16:0] _1118;
    wire [16:0] _1121;
    reg [16:0] _1124;
    wire [16:0] _1116;
    wire _1125;
    wire _1126;
    wire _1130;
    wire _1139;
    wire [1:0] _1058;
    reg [15:0] _1113;
    wire _1115;
    wire _1143;
    wire [7:0] _1107;
    wire _1109;
    wire _1110;
    wire _1106;
    wire _1111;
    wire [7:0] _1100;
    wire [7:0] _1098;
    wire [7:0] _1099;
    wire [7:0] _1101;
    wire _1103;
    wire _1104;
    wire _1112;
    wire _1144;
    wire _1149;
    wire _1185;
    wire _1186;
    wire _1190;
    wire f_fire3;
    wire [7:0] _692;
    wire _694;
    wire _680;
    wire _676;
    wire _677;
    wire _674;
    wire _678;
    wire _681;
    wire [3:0] _671;
    wire _673;
    wire _682;
    wire _669;
    wire _665;
    wire _666;
    wire _663;
    wire _667;
    wire _670;
    wire _661;
    reg [2:0] _655;
    wire [15:0] _656;
    wire _657;
    wire _651;
    wire _658;
    wire _649;
    wire _659;
    wire _662;
    wire [1:0] _648;
    reg _683;
    wire _647;
    wire _684;
    wire _639;
    wire [3:0] _585;
    reg _638;
    wire _640;
    wire [15:0] _580;
    wire _582;
    wire [15:0] _571;
    wire [16:0] _572;
    wire [16:0] _573;
    reg [16:0] _576;
    wire _577;
    wire _578;
    wire [15:0] _567;
    wire _569;
    wire _533;
    wire [2:0] _553;
    wire _512;
    wire [2:0] _532;
    wire _554;
    wire [2:0] _555;
    wire _489;
    wire [2:0] _509;
    wire _468;
    wire [2:0] _488;
    wire _510;
    wire [2:0] _511;
    wire _556;
    wire [2:0] _557;
    wire _443;
    wire [2:0] _463;
    wire _422;
    wire [2:0] _442;
    wire _464;
    wire [2:0] _465;
    wire _399;
    wire [2:0] _419;
    wire [7:0] _377;
    wire _378;
    wire [2:0] _398;
    wire _420;
    wire [2:0] _421;
    wire _466;
    wire [2:0] _467;
    wire _558;
    wire [2:0] _559;
    wire [16:0] _560;
    wire [111:0] _373;
    wire [15:0] _374;
    wire [16:0] _375;
    wire [16:0] _561;
    reg [16:0] _564;
    wire [16:0] _350;
    wire _565;
    wire _566;
    wire _570;
    wire _579;
    wire [1:0] _336;
    reg [15:0] _346;
    wire _348;
    wire _583;
    wire [7:0] _330;
    wire _332;
    wire _333;
    wire _321;
    wire _334;
    wire [7:0] _314;
    wire [7:0] _312;
    wire [7:0] _313;
    wire [7:0] _315;
    wire _317;
    wire [127:0] _292;
    wire [2:0] _3760;
    wire [5:0] _1199;
    wire [5:0] _105;
    wire [5:0] _2520;
    wire [5:0] _107;
    wire [5:0] _2507;
    wire [5:0] _108;
    reg [5:0] _2506;
    wire _2510;
    wire [5:0] _2511;
    wire [5:0] _2512;
    wire [5:0] _2521;
    wire _2508;
    wire [5:0] _2522;
    wire [5:0] _2523;
    wire [5:0] _109;
    reg [5:0] _1200;
    wire [5:0] _2516;
    wire [5:0] _2515;
    wire [5:0] _2514;
    wire [5:0] _2513;
    reg [5:0] _2517;
    wire _2518;
    wire _2519;
    wire [2:0] _3756;
    wire _3751;
    wire [2:0] _3753;
    wire [7:0] _1833;
    wire _1835;
    wire _1836;
    wire _1831;
    wire _1832;
    wire f_unexp_now;
    wire _2527;
    wire _2528;
    wire _2530;
    wire _2531;
    wire _2526;
    wire _2524;
    wire _2532;
    wire _110;
    reg _1828;
    wire _1829;
    wire [15:0] _3742;
    wire [15:0] _3743;
    wire _3739;
    wire _3740;
    wire _3741;
    wire [15:0] _3744;
    wire [2:0] _3684;
    wire [2:0] _3682;
    wire [2:0] _3681;
    wire [2:0] _3680;
    wire [2:0] _3679;
    wire [7:0] _1001;
    wire _1003;
    wire _994;
    wire _990;
    wire _991;
    wire _988;
    wire _992;
    wire _995;
    wire [3:0] _985;
    wire _987;
    wire _996;
    wire _983;
    wire _979;
    wire _980;
    wire _977;
    wire _981;
    wire _984;
    wire _975;
    reg [2:0] _969;
    wire [15:0] _970;
    wire _971;
    wire _965;
    wire _972;
    wire _963;
    wire _973;
    wire _976;
    wire [1:0] _962;
    reg _997;
    wire _961;
    wire _998;
    wire _958;
    wire [3:0] _956;
    reg _957;
    wire _959;
    wire [15:0] _951;
    wire _953;
    wire [15:0] _942;
    wire [16:0] _943;
    wire [16:0] _944;
    reg [16:0] _947;
    wire _948;
    wire _949;
    wire [15:0] _938;
    wire _940;
    wire _922;
    wire [2:0] _924;
    wire _919;
    wire [2:0] _921;
    wire _925;
    wire [2:0] _926;
    wire _914;
    wire [2:0] _916;
    wire _911;
    wire [2:0] _913;
    wire _917;
    wire [2:0] _918;
    wire _927;
    wire [2:0] _928;
    wire _904;
    wire [2:0] _906;
    wire _901;
    wire [2:0] _903;
    wire _907;
    wire [2:0] _908;
    wire _896;
    wire [2:0] _898;
    wire [7:0] _892;
    wire _893;
    wire [2:0] _895;
    wire _899;
    wire [2:0] _900;
    wire _909;
    wire [2:0] _910;
    wire _929;
    wire [2:0] _930;
    wire [16:0] _931;
    wire [111:0] _888;
    wire [15:0] _889;
    wire [16:0] _890;
    wire [16:0] _932;
    reg [16:0] _935;
    wire [16:0] _887;
    wire _936;
    wire _937;
    wire _941;
    wire _950;
    wire [1:0] _883;
    reg [15:0] _884;
    wire _886;
    wire _954;
    wire [7:0] _877;
    wire _879;
    wire _880;
    wire _876;
    wire _881;
    wire [7:0] _870;
    wire [7:0] _868;
    wire [7:0] _869;
    wire [7:0] _871;
    wire _873;
    wire _874;
    wire _882;
    wire _955;
    wire _960;
    wire _999;
    wire _1000;
    wire _1004;
    wire f_fire2;
    wire [1:0] _1008;
    wire [1:0] f_policy;
    wire _727;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _717;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _711;
    wire [7:0] _705;
    wire [7:0] f_chgmask0;
    wire [7:0] _699;
    wire [7:0] f_watch;
    wire [7:0] _700;
    wire [7:0] _706;
    wire [7:0] _712;
    wire [7:0] f_relevant;
    wire [7:0] _719;
    wire _721;
    wire _722;
    wire f_amb_now;
    wire _724;
    wire _728;
    wire [7:0] _690;
    wire [7:0] _2537;
    wire [7:0] _2538;
    wire _2534;
    wire [7:0] _2536;
    wire _2533;
    wire [7:0] _2539;
    wire [7:0] _2541;
    wire [7:0] _111;
    reg [7:0] _689;
    wire [7:0] f_multi_eff;
    wire [7:0] _863;
    wire _865;
    wire _856;
    wire _852;
    wire _853;
    wire _850;
    wire _854;
    wire _857;
    wire [3:0] _847;
    wire _849;
    wire _858;
    wire _845;
    wire _841;
    wire _842;
    wire _839;
    wire _843;
    wire _846;
    wire _837;
    reg [2:0] _831;
    wire [15:0] _832;
    wire _833;
    wire _827;
    wire _834;
    wire _825;
    wire _835;
    wire _838;
    wire [1:0] _824;
    reg _859;
    wire [1:0] _113;
    wire [1:0] _2542;
    wire [1:0] _114;
    reg [1:0] _644;
    wire _646;
    wire _823;
    wire _860;
    wire _820;
    wire _2546;
    wire _2544;
    wire _2547;
    wire _2549;
    wire _2551;
    wire _115;
    reg _637;
    wire [15:0] _117;
    wire [15:0] _119;
    wire [15:0] _2557;
    wire [15:0] _2558;
    wire [15:0] _2559;
    wire [15:0] _2561;
    wire [15:0] _120;
    reg [15:0] _2554;
    wire [14:0] _2555;
    wire [15:0] _2556;
    wire [15:0] _2562;
    wire [15:0] _2563;
    wire _2565;
    wire _2567;
    wire _2568;
    wire _2569;
    wire _2570;
    wire _2572;
    wire _2574;
    wire _121;
    reg _634;
    wire _2587;
    wire _2588;
    wire _2590;
    wire _2591;
    wire _2592;
    wire _2593;
    wire _2595;
    wire _122;
    reg _2577;
    wire _2589;
    wire _2598;
    wire [5:0] _2596;
    wire _2597;
    wire _2599;
    wire _2600;
    wire _2601;
    wire _2602;
    wire _2603;
    wire _2605;
    wire _2607;
    wire _123;
    reg _631;
    wire _2611;
    wire _2609;
    wire _2612;
    wire _2614;
    wire _2616;
    wire _124;
    reg _623;
    wire [15:0] _126;
    wire [15:0] _128;
    wire [15:0] _2622;
    wire [15:0] _2623;
    wire [15:0] _2624;
    wire [15:0] _2626;
    wire [15:0] _129;
    reg [15:0] _2619;
    wire [14:0] _2620;
    wire [15:0] _2621;
    wire [15:0] _2627;
    wire [15:0] _2628;
    wire _2630;
    wire _2632;
    wire _2633;
    wire _2634;
    wire _2635;
    wire _2637;
    wire _2639;
    wire _130;
    reg _620;
    wire _2652;
    wire _2653;
    wire _2655;
    wire _2656;
    wire _2657;
    wire _2658;
    wire _2660;
    wire _131;
    reg _2642;
    wire _2654;
    wire _2663;
    wire _2662;
    wire _2664;
    wire _2665;
    wire _2666;
    wire _2667;
    wire _2668;
    wire _2670;
    wire _2672;
    wire _132;
    reg _617;
    wire [7:0] _134;
    wire [6:0] _608;
    wire [6:0] _607;
    wire _609;
    wire [15:0] _604;
    wire _2677;
    wire _2676;
    wire _2678;
    wire _2675;
    wire _2679;
    wire _2674;
    wire _2680;
    wire [14:0] _2673;
    wire [15:0] _2681;
    wire [15:0] _135;
    reg [15:0] _605;
    wire _606;
    wire [3:0] _2700;
    wire [3:0] _2698;
    wire [3:0] _2701;
    wire _1854;
    wire _2285;
    wire _137;
    wire _2286;
    wire _2235;
    wire _2268;
    wire _2685;
    wire _2262;
    wire _2263;
    wire _2683;
    wire _1780;
    wire _1781;
    wire _1787;
    wire _1784;
    wire _1785;
    wire _1783;
    wire _1786;
    wire _1788;
    wire _2686;
    wire _138;
    reg _1767;
    wire _2694;
    wire _2259;
    wire _2690;
    wire _2243;
    wire _2244;
    wire _2688;
    wire _1707;
    wire [2:0] _1701;
    wire _1696;
    wire _1695;
    wire _1697;
    wire _1698;
    wire _1699;
    wire [2:0] _1702;
    wire _1704;
    wire _1705;
    wire _1676;
    wire _1706;
    wire _1708;
    wire _1672;
    wire _1673;
    wire _1709;
    wire _1761;
    wire _1760;
    wire _1762;
    wire _2691;
    wire _139;
    reg _1660;
    wire _2692;
    wire _1757;
    wire [2:0] _1751;
    wire _1746;
    wire _1745;
    wire _1747;
    wire _1748;
    wire _1749;
    wire [2:0] _1752;
    wire _1754;
    wire _1755;
    wire _1726;
    wire _1756;
    wire _1758;
    wire _1722;
    wire _1723;
    wire _1759;
    wire _2693;
    wire _2695;
    wire _140;
    wire _2236;
    wire _2696;
    wire [3:0] _2702;
    reg [3:0] _2705;
    wire [3:0] _141;
    wire _602;
    wire [6:0] _2722;
    wire [7:0] _2723;
    wire [6:0] _2720;
    wire _2718;
    wire _2717;
    wire _2716;
    wire _2715;
    wire _2714;
    wire _2713;
    wire _2712;
    wire _2711;
    wire [2:0] _2709;
    wire [2:0] _2708;
    wire [2:0] _2707;
    wire [2:0] _2706;
    reg [2:0] _2710;
    reg _2719;
    wire [7:0] _2721;
    wire [1:0] _1775;
    wire [1:0] _1774;
    wire [1:0] _1773;
    wire [1:0] _1772;
    reg [1:0] _1776;
    wire [1:0] _1778;
    reg [7:0] _2724;
    wire [7:0] _2725;
    wire [7:0] _142;
    reg [7:0] _597;
    wire _598;
    wire [6:0] _3495;
    wire [7:0] _3496;
    wire _3493;
    wire _3492;
    wire _3491;
    wire _3490;
    wire _3489;
    wire _3488;
    wire _3487;
    wire _3486;
    wire [7:0] _3494;
    wire [3:0] _3478;
    wire [3:0] _3476;
    wire [3:0] _3479;
    wire _3149;
    wire _3470;
    wire _1677;
    wire _3104;
    wire _3105;
    wire [1:0] _3108;
    wire _3097;
    wire _3098;
    wire _3099;
    wire _3100;
    wire [1:0] _3102;
    wire [2:0] _3083;
    wire [2:0] _3080;
    wire _3076;
    wire _3074;
    wire _3075;
    wire _3077;
    wire [2:0] _3081;
    wire _3072;
    wire [2:0] _3084;
    wire _3085;
    wire [2:0] _3066;
    wire _3062;
    wire _3060;
    wire _3061;
    wire _3063;
    wire [2:0] _3067;
    wire _3058;
    wire [2:0] _3069;
    wire _3070;
    wire _3086;
    wire _3087;
    wire _3088;
    wire _3054;
    wire _3052;
    wire _3055;
    wire [15:0] _3047;
    wire _3048;
    wire _3045;
    wire _3049;
    wire _3043;
    wire _3044;
    wire _3050;
    wire _3056;
    wire _3089;
    wire [1:0] _3091;
    wire [1:0] _3093;
    wire [1:0] _3039;
    wire _3035;
    wire [1:0] _3037;
    wire [1:0] _3040;
    wire _2815;
    wire _2816;
    wire _143;
    reg _2728;
    wire _2965;
    wire _2963;
    wire _2964;
    reg _2966;
    wire [2:0] _145;
    wire [2:0] _2947;
    wire [2:0] _2948;
    wire [2:0] _2943;
    wire _2939;
    wire _2937;
    wire _2938;
    wire _2940;
    wire [2:0] _2944;
    wire _2935;
    wire [2:0] _2949;
    wire [2:0] _2950;
    wire [2:0] _2929;
    wire [2:0] _2930;
    wire [2:0] _2925;
    wire _2811;
    wire _2810;
    wire _2809;
    wire _2808;
    wire _2807;
    wire _2806;
    wire _2805;
    wire _2801;
    wire _2800;
    wire _2799;
    wire _2798;
    wire _2797;
    wire _2796;
    wire _2795;
    wire [7:0] _2792;
    wire [6:0] _2253;
    wire [7:0] _2254;
    wire [6:0] _2251;
    wire [7:0] _2252;
    wire [7:0] _2255;
    wire [7:0] _2821;
    wire [7:0] _2822;
    wire [7:0] _2823;
    wire [7:0] _2817;
    wire [7:0] _2818;
    wire [7:0] _2819;
    wire [7:0] _2820;
    wire [7:0] _2824;
    wire [7:0] _146;
    reg [7:0] _2250;
    wire _2732;
    wire _2729;
    wire _2730;
    wire _2733;
    wire [7:0] _2793;
    wire _2794;
    wire [7:0] _2802;
    wire _148;
    wire [7:0] _2803;
    wire _2804;
    wire [2:0] _2832;
    wire [2:0] _2833;
    wire [2:0] _2834;
    wire [2:0] _2835;
    wire [2:0] _2826;
    wire [2:0] _2827;
    wire [2:0] _2828;
    wire [2:0] _2829;
    wire [2:0] _2830;
    wire [2:0] _2836;
    wire [2:0] _2838;
    wire [2:0] _149;
    reg [2:0] _1670;
    reg _2812;
    wire _151;
    wire [31:0] _153;
    wire [30:0] _2880;
    wire [31:0] _2882;
    wire _2874;
    wire _2875;
    wire [31:0] _2877;
    wire [30:0] _2871;
    wire [31:0] _2873;
    wire [31:0] _2878;
    wire [31:0] _2879;
    wire [5:0] _155;
    wire [5:0] _2848;
    wire [5:0] _2849;
    wire [5:0] _2850;
    wire [5:0] _2851;
    wire [5:0] _2842;
    wire [5:0] _2843;
    wire [5:0] _2844;
    wire [5:0] _2845;
    wire [5:0] _2846;
    wire [5:0] _2852;
    wire [5:0] _2853;
    wire [5:0] _2855;
    wire [5:0] _156;
    reg [5:0] _1690;
    wire _1692;
    wire _1693;
    wire _2579;
    wire _2578;
    wire _2580;
    wire _2581;
    wire [31:0] _2883;
    wire [31:0] _2884;
    wire [31:0] _2885;
    wire [31:0] _158;
    wire _2862;
    wire _2863;
    wire [31:0] _2865;
    wire [30:0] _2859;
    wire [31:0] _2861;
    wire [31:0] _2866;
    wire [30:0] _2856;
    wire [31:0] _2858;
    wire [31:0] _2867;
    wire [31:0] _2868;
    wire [31:0] _2869;
    wire [31:0] _2870;
    wire [31:0] _2886;
    wire [31:0] _2887;
    wire [31:0] _2889;
    wire [31:0] _159;
    reg [31:0] _2584;
    wire _2585;
    wire _2586;
    wire [15:0] _161;
    wire [15:0] _2909;
    wire _1662;
    wire _1667;
    wire [15:0] _2910;
    wire _1661;
    wire [15:0] _2911;
    wire _2892;
    wire _2890;
    wire _2891;
    wire _2893;
    wire _2895;
    wire _162;
    reg _1575;
    wire _1576;
    wire _1573;
    wire _1577;
    wire _2897;
    wire _2898;
    wire _2899;
    wire _2901;
    wire _163;
    reg _1569;
    wire _1570;
    wire _1567;
    wire _1571;
    wire _1578;
    wire _1579;
    wire _1580;
    wire [15:0] _2912;
    wire [15:0] _2903;
    wire [15:0] _2904;
    wire [15:0] _2905;
    wire [15:0] _2906;
    wire [15:0] _2907;
    wire [15:0] _2913;
    wire [15:0] _2915;
    wire [15:0] _164;
    reg [15:0] _1665;
    wire _1666;
    wire _2813;
    wire _2814;
    wire _2921;
    wire _2919;
    wire _2920;
    wire _2922;
    wire [2:0] _2926;
    wire _2917;
    wire [2:0] _2931;
    wire [2:0] _2932;
    wire [2:0] _2933;
    wire [2:0] _2951;
    wire [2:0] _2953;
    wire [2:0] _165;
    reg [2:0] _1563;
    wire _1564;
    wire [1:0] _167;
    wire _1559;
    wire _1560;
    wire _1565;
    wire _1687;
    wire _1694;
    wire _2967;
    wire _2968;
    wire _1682;
    wire _1680;
    wire _1683;
    wire _1684;
    wire _1685;
    wire _2960;
    wire _2957;
    wire _2954;
    wire _2955;
    wire _2958;
    wire _2959;
    wire _2961;
    wire _2969;
    wire _2971;
    wire _2973;
    wire _2975;
    wire _2977;
    wire _168;
    reg _1547;
    wire _1548;
    wire _1549;
    wire _1542;
    wire _1543;
    wire _1539;
    wire _170;
    wire _1536;
    wire _1537;
    wire _1538;
    wire _1540;
    wire _1544;
    wire _1545;
    wire _1550;
    wire [1:0] _3042;
    wire _1531;
    wire _1532;
    wire _1527;
    wire _1526;
    wire _1525;
    wire _1524;
    wire _1523;
    wire _1522;
    wire _1521;
    wire _1520;
    reg _1528;
    wire _1529;
    wire _1518;
    wire _1517;
    wire _1516;
    wire _1515;
    wire _1514;
    wire _1513;
    wire _1512;
    wire _1511;
    wire [2:0] _172;
    reg _1519;
    wire _1530;
    wire _174;
    wire _1533;
    wire _1509;
    wire _1506;
    wire _1499;
    wire _1497;
    wire [13:0] _1488;
    wire [15:0] _1489;
    wire [14:0] _1485;
    wire [15:0] _1486;
    wire [15:0] _1490;
    wire [14:0] _1482;
    wire [15:0] _1483;
    wire _1480;
    wire [15:0] _1491;
    reg [15:0] _1494;
    wire _1495;
    wire [13:0] _1472;
    wire [15:0] _1473;
    reg [15:0] _1476;
    wire _3023;
    wire _3024;
    wire [15:0] _3025;
    wire [15:0] _3027;
    wire [15:0] _3029;
    wire _3007;
    wire [14:0] _1501;
    wire [15:0] _1502;
    reg [15:0] _1505;
    wire [16:0] _3003;
    wire _3004;
    wire [16:0] _2997;
    reg [16:0] _3000;
    wire [16:0] _2992;
    wire [15:0] _176;
    wire [16:0] _2991;
    wire [16:0] _2993;
    reg [16:0] _2996;
    wire [7:0] _178;
    wire [8:0] _3011;
    wire [7:0] _3013;
    wire [7:0] _3014;
    wire [7:0] _3015;
    wire [7:0] _3017;
    wire [7:0] _179;
    reg [7:0] _2985;
    wire [8:0] _3010;
    wire [8:0] _3012;
    wire _3018;
    wire _3019;
    wire _3020;
    wire _3022;
    wire _180;
    reg _2990;
    wire [16:0] _3001;
    wire [16:0] _2987;
    wire _3002;
    wire _3005;
    wire _3008;
    wire _2986;
    wire _3009;
    wire [15:0] _3031;
    wire _2981;
    wire _2979;
    wire _628;
    wire _2978;
    wire _2980;
    wire _2982;
    wire [15:0] _3032;
    wire [15:0] _3034;
    wire [15:0] _181;
    reg [15:0] _1470;
    wire _1477;
    wire _1478;
    wire _1467;
    wire _1479;
    wire _1496;
    wire _1498;
    wire _1507;
    wire [1:0] _183;
    wire _1463;
    wire _1464;
    wire _1461;
    wire _1465;
    wire _1458;
    wire _1454;
    wire _1453;
    wire _1452;
    wire _1451;
    wire _1450;
    wire _1449;
    wire _1448;
    wire _1447;
    reg _1455;
    wire _1445;
    wire _1444;
    wire _1443;
    wire _1442;
    wire _1441;
    wire _1440;
    wire _1439;
    wire _1438;
    wire [2:0] _185;
    reg _1446;
    wire _1456;
    wire _1457;
    wire _1459;
    wire _1466;
    wire _1510;
    wire _187;
    wire _1534;
    wire _189;
    wire _1437;
    wire _1535;
    wire [1:0] _3094;
    wire _1675;
    wire [1:0] _3096;
    wire _2840;
    wire [1:0] _3103;
    wire _1434;
    wire [1:0] _3109;
    wire _1431;
    wire _1432;
    wire [1:0] _3111;
    wire [1:0] _190;
    reg [1:0] _626;
    wire _1436;
    wire _1678;
    wire _1686;
    wire _3469;
    wire _3471;
    wire _3467;
    wire _1727;
    wire _3445;
    wire _3446;
    wire [1:0] _3449;
    wire _3438;
    wire _3439;
    wire _3440;
    wire _3441;
    wire [1:0] _3443;
    wire [2:0] _3424;
    wire [2:0] _3421;
    wire _3417;
    wire _3415;
    wire _3416;
    wire _3418;
    wire [2:0] _3422;
    wire _3413;
    wire [2:0] _3425;
    wire _3426;
    wire [2:0] _3407;
    wire _3403;
    wire _3401;
    wire _3402;
    wire _3404;
    wire [2:0] _3408;
    wire _3399;
    wire [2:0] _3410;
    wire _3411;
    wire _3427;
    wire _3428;
    wire _3429;
    wire _3395;
    wire _3393;
    wire _3396;
    wire [15:0] _3388;
    wire _3389;
    wire _3386;
    wire _3390;
    wire _3384;
    wire _3385;
    wire _3391;
    wire _3397;
    wire _3430;
    wire [1:0] _3432;
    wire [1:0] _3434;
    wire [1:0] _3380;
    wire _3376;
    wire [1:0] _3378;
    wire [1:0] _3381;
    wire _3144;
    wire _3145;
    wire _191;
    reg _3114;
    wire _3302;
    wire _3300;
    wire _3301;
    reg _3303;
    wire [2:0] _193;
    wire [2:0] _3284;
    wire [2:0] _3285;
    wire [2:0] _3280;
    wire _3276;
    wire _3274;
    wire _3275;
    wire _3277;
    wire [2:0] _3281;
    wire _3272;
    wire [2:0] _3286;
    wire [2:0] _3287;
    wire [2:0] _3266;
    wire [2:0] _3267;
    wire [2:0] _3262;
    wire _3140;
    wire _3139;
    wire _3138;
    wire _3137;
    wire _3136;
    wire _3135;
    wire _3134;
    wire _3130;
    wire _3129;
    wire _3128;
    wire _3127;
    wire _3126;
    wire _3125;
    wire _3124;
    wire _2787;
    wire _2788;
    reg [7:0] _2789;
    wire _2781;
    wire _2782;
    reg [7:0] _2783;
    wire _2775;
    wire _2776;
    reg [7:0] _2777;
    wire _2769;
    wire _2770;
    reg [7:0] _2771;
    wire _2763;
    wire _2764;
    reg [7:0] _2765;
    wire _2757;
    wire _2758;
    reg [7:0] _2759;
    wire _2751;
    wire _2752;
    reg [7:0] _2753;
    wire [2:0] _3147;
    wire [2:0] _3148;
    wire [2:0] _194;
    reg [2:0] _2743;
    wire _2745;
    wire _2746;
    wire [7:0] _196;
    reg [7:0] _2747;
    wire [2:0] _3152;
    wire [2:0] _3153;
    wire [2:0] _197;
    reg [2:0] _2736;
    reg [7:0] _2790;
    wire [7:0] _3121;
    wire [6:0] _2279;
    wire [7:0] _2280;
    wire [6:0] _2277;
    wire [7:0] _2278;
    wire [7:0] _2281;
    wire [7:0] _3158;
    wire [7:0] _3159;
    wire [7:0] _3160;
    wire [7:0] _3154;
    wire [7:0] _3155;
    wire [7:0] _3156;
    wire [7:0] _3157;
    wire [7:0] _3161;
    wire [7:0] _198;
    reg [7:0] _2276;
    wire _3118;
    wire _3115;
    wire _3116;
    wire _3119;
    wire [7:0] _3122;
    wire _3123;
    wire [7:0] _3131;
    wire _200;
    wire [7:0] _3132;
    wire _3133;
    wire [2:0] _3169;
    wire [2:0] _3170;
    wire [2:0] _3171;
    wire [2:0] _3172;
    wire [2:0] _3163;
    wire [2:0] _3164;
    wire [2:0] _3165;
    wire [2:0] _3166;
    wire [2:0] _3167;
    wire [2:0] _3173;
    wire [2:0] _3175;
    wire [2:0] _201;
    reg [2:0] _1720;
    reg _3141;
    wire _203;
    wire [31:0] _205;
    wire [30:0] _3217;
    wire [31:0] _3219;
    wire _3211;
    wire _3212;
    wire [31:0] _3214;
    wire [30:0] _3208;
    wire [31:0] _3210;
    wire [31:0] _3215;
    wire [31:0] _3216;
    wire [5:0] _207;
    wire [5:0] _3185;
    wire [5:0] _3186;
    wire [5:0] _3187;
    wire [5:0] _3188;
    wire [5:0] _3179;
    wire [5:0] _3180;
    wire [5:0] _3181;
    wire [5:0] _3182;
    wire [5:0] _3183;
    wire [5:0] _3189;
    wire [5:0] _3190;
    wire [5:0] _3192;
    wire [5:0] _208;
    reg [5:0] _1740;
    wire _1742;
    wire _1743;
    wire _2644;
    wire _2643;
    wire _2645;
    wire _2646;
    wire [31:0] _3220;
    wire [31:0] _3221;
    wire [31:0] _3222;
    wire [31:0] _210;
    wire _3199;
    wire _3200;
    wire [31:0] _3202;
    wire [30:0] _3196;
    wire [31:0] _3198;
    wire [31:0] _3203;
    wire [30:0] _3193;
    wire [31:0] _3195;
    wire [31:0] _3204;
    wire [31:0] _3205;
    wire [31:0] _3206;
    wire [31:0] _3207;
    wire [31:0] _3223;
    wire [31:0] _3224;
    wire [31:0] _3226;
    wire [31:0] _211;
    reg [31:0] _2649;
    wire _2650;
    wire _2651;
    wire [15:0] _213;
    wire [15:0] _3246;
    wire _1712;
    wire _1717;
    wire [15:0] _3247;
    wire _1711;
    wire [15:0] _3248;
    wire _3229;
    wire _3227;
    wire _3228;
    wire _3230;
    wire _3232;
    wire _214;
    reg _1417;
    wire _1418;
    wire _1415;
    wire _1419;
    wire _3234;
    wire _3235;
    wire _3236;
    wire _3238;
    wire _215;
    reg _1411;
    wire _1412;
    wire _1409;
    wire _1413;
    wire _1420;
    wire _1421;
    wire _1422;
    wire [15:0] _3249;
    wire [15:0] _3240;
    wire [15:0] _3241;
    wire [15:0] _3242;
    wire [15:0] _3243;
    wire [15:0] _3244;
    wire [15:0] _3250;
    wire [15:0] _3252;
    wire [15:0] _216;
    reg [15:0] _1715;
    wire _1716;
    wire _3142;
    wire _3143;
    wire _3258;
    wire _3256;
    wire _3257;
    wire _3259;
    wire [2:0] _3263;
    wire _3254;
    wire [2:0] _3268;
    wire [2:0] _3269;
    wire [2:0] _3270;
    wire [2:0] _3288;
    wire [2:0] _3290;
    wire [2:0] _217;
    reg [2:0] _1405;
    wire _1406;
    wire [1:0] _219;
    wire _1401;
    wire _1402;
    wire _1407;
    wire _1737;
    wire _1744;
    wire _3304;
    wire _3305;
    wire _1732;
    wire _1730;
    wire _1733;
    wire _1734;
    wire _1735;
    wire _3297;
    wire _3294;
    wire _3291;
    wire _3292;
    wire _3295;
    wire _3296;
    wire _3298;
    wire _3306;
    wire _3308;
    wire _3310;
    wire _3312;
    wire _3314;
    wire _220;
    reg _1389;
    wire _1390;
    wire _1391;
    wire _1384;
    wire _1385;
    wire _1381;
    wire _222;
    wire _1378;
    wire _1379;
    wire _1380;
    wire _1382;
    wire _1386;
    wire _1387;
    wire _1392;
    wire [1:0] _3383;
    wire _1373;
    wire _1374;
    wire _1369;
    wire _1368;
    wire _1367;
    wire _1366;
    wire _1365;
    wire _1364;
    wire _1363;
    wire _1362;
    reg _1370;
    wire _1371;
    wire _1360;
    wire _1359;
    wire _1358;
    wire _1357;
    wire _1356;
    wire _1355;
    wire _1354;
    wire _1353;
    wire [2:0] _224;
    reg _1361;
    wire _1372;
    wire _226;
    wire _1375;
    wire _1351;
    wire _1348;
    wire _1341;
    wire _1339;
    wire [13:0] _1330;
    wire [15:0] _1331;
    wire [14:0] _1327;
    wire [15:0] _1328;
    wire [15:0] _1332;
    wire [14:0] _1324;
    wire [15:0] _1325;
    wire _1322;
    wire [15:0] _1333;
    reg [15:0] _1336;
    wire _1337;
    wire [13:0] _1314;
    wire [15:0] _1315;
    reg [15:0] _1318;
    wire _3360;
    wire _3361;
    wire [15:0] _3362;
    wire [15:0] _3364;
    wire [15:0] _3366;
    wire _3344;
    wire [14:0] _1343;
    wire [15:0] _1344;
    reg [15:0] _1347;
    wire [16:0] _3340;
    wire _3341;
    wire [16:0] _3334;
    reg [16:0] _3337;
    wire [15:0] _228;
    wire [16:0] _3328;
    wire [16:0] _3330;
    reg [16:0] _3333;
    wire [7:0] _230;
    wire [8:0] _3348;
    wire [7:0] _3350;
    wire [7:0] _3351;
    wire [7:0] _3352;
    wire [7:0] _3354;
    wire [7:0] _231;
    reg [7:0] _3322;
    wire [8:0] _3347;
    wire [8:0] _3349;
    wire _3355;
    wire _3356;
    wire _3357;
    wire _3359;
    wire _232;
    reg _3327;
    wire [16:0] _3338;
    wire [16:0] _3324;
    wire _3339;
    wire _3342;
    wire _3345;
    wire _3323;
    wire _3346;
    wire [15:0] _3368;
    wire _3318;
    wire _3316;
    wire _614;
    wire _3315;
    wire _3317;
    wire _3319;
    wire [15:0] _3369;
    wire [15:0] _3371;
    wire [15:0] _233;
    reg [15:0] _1312;
    wire _1319;
    wire _1320;
    wire _1309;
    wire _1321;
    wire _1338;
    wire _1340;
    wire _1349;
    wire [1:0] _235;
    wire _1305;
    wire _1306;
    wire _1303;
    wire _1307;
    wire _1300;
    wire _1296;
    wire _1295;
    wire _1294;
    wire _1293;
    wire _1292;
    wire _1291;
    wire _1290;
    wire _1289;
    reg _1297;
    wire _1287;
    wire _1286;
    wire _1285;
    wire _1284;
    wire _1283;
    wire _1282;
    wire _1281;
    wire _1280;
    wire [2:0] _237;
    reg _1288;
    wire _1298;
    wire _1299;
    wire _1301;
    wire _1308;
    wire _1352;
    wire _239;
    wire _1376;
    wire _241;
    wire _1279;
    wire _1377;
    wire [1:0] _3435;
    wire _1725;
    wire [1:0] _3437;
    wire _3177;
    wire [1:0] _3444;
    wire _1276;
    wire [1:0] _3450;
    wire [2:0] _2397;
    wire [2:0] _2396;
    wire [2:0] _2395;
    wire [2:0] _2394;
    reg [2:0] _2398;
    wire _2390;
    wire _2389;
    wire _2388;
    wire _2387;
    reg _2391;
    wire _3372;
    wire _3373;
    wire [2:0] _3375;
    wire [2:0] _242;
    wire _1273;
    wire _1274;
    wire [1:0] _3452;
    wire [1:0] _243;
    reg [1:0] _612;
    wire _1278;
    wire _1728;
    wire _1736;
    wire _3466;
    wire _3468;
    wire _3472;
    wire _3463;
    wire _3461;
    wire _3464;
    wire _3465;
    wire _3473;
    wire _244;
    wire _3150;
    wire _2343;
    wire _2739;
    wire _246;
    wire _2740;
    wire _3474;
    wire [3:0] _3480;
    reg [3:0] _3483;
    wire [3:0] _247;
    wire _600;
    wire [7:0] _3485;
    wire [1:0] _3458;
    wire [1:0] _3456;
    wire [1:0] _3455;
    wire [1:0] _3454;
    wire [1:0] _3453;
    reg [1:0] _3457;
    wire [1:0] _3459;
    reg [7:0] _3497;
    wire [7:0] _3498;
    wire [7:0] _248;
    reg [7:0] _593;
    wire _594;
    wire [7:0] _3509;
    wire [7:0] _3508;
    wire [7:0] _3506;
    wire [7:0] _3507;
    wire [1:0] _3504;
    wire [111:0] _713;
    wire [1:0] _3502;
    wire [111:0] _707;
    wire [1:0] _3501;
    wire [1:0] _3500;
    wire [1:0] _3499;
    reg [1:0] _3503;
    wire [1:0] _3505;
    reg [7:0] _3510;
    wire [7:0] _3511;
    wire [7:0] _249;
    reg [7:0] _588;
    wire _590;
    wire [3:0] _818;
    reg _819;
    wire _821;
    wire [15:0] _813;
    wire _815;
    wire [15:0] _804;
    wire [16:0] _805;
    wire [16:0] _806;
    reg [16:0] _809;
    wire _810;
    wire _811;
    wire [15:0] _800;
    wire _802;
    wire [2:0] _548;
    wire [2:0] _3526;
    wire _3522;
    wire _3523;
    wire _3520;
    wire _3524;
    wire [2:0] _3527;
    wire _3517;
    wire _3518;
    wire _3516;
    wire _3519;
    wire [2:0] _3529;
    wire _3513;
    wire [2:0] _3515;
    wire _3512;
    wire [2:0] _3530;
    wire [2:0] _250;
    reg [2:0] _544;
    wire _546;
    wire [2:0] _549;
    wire _539;
    wire _540;
    wire _538;
    wire _541;
    wire [2:0] _551;
    wire _535;
    wire _536;
    wire [2:0] _552;
    wire _784;
    wire [2:0] _786;
    wire [2:0] _527;
    wire [2:0] _3545;
    wire _3541;
    wire _3542;
    wire _3539;
    wire _3543;
    wire [2:0] _3546;
    wire _3536;
    wire _3537;
    wire _3535;
    wire _3538;
    wire [2:0] _3548;
    wire _3532;
    wire [2:0] _3534;
    wire _3531;
    wire [2:0] _3549;
    wire [2:0] _251;
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
    wire _781;
    wire [2:0] _783;
    wire _787;
    wire [2:0] _788;
    wire [2:0] _504;
    wire [2:0] _3564;
    wire _3560;
    wire _3561;
    wire _3558;
    wire _3562;
    wire [2:0] _3565;
    wire _3555;
    wire _3556;
    wire _3554;
    wire _3557;
    wire [2:0] _3567;
    wire _3551;
    wire [2:0] _3553;
    wire _3550;
    wire [2:0] _3568;
    wire [2:0] _252;
    reg [2:0] _500;
    wire _502;
    wire [2:0] _505;
    wire _495;
    wire _496;
    wire _494;
    wire _497;
    wire [2:0] _507;
    wire _491;
    wire _492;
    wire [2:0] _508;
    wire _776;
    wire [2:0] _778;
    wire [2:0] _483;
    wire [2:0] _3583;
    wire _3579;
    wire _3580;
    wire _3577;
    wire _3581;
    wire [2:0] _3584;
    wire _3574;
    wire _3575;
    wire _3573;
    wire _3576;
    wire [2:0] _3586;
    wire _3570;
    wire [2:0] _3572;
    wire _3569;
    wire [2:0] _3587;
    wire [2:0] _253;
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
    wire _773;
    wire [2:0] _775;
    wire _779;
    wire [2:0] _780;
    wire _789;
    wire [2:0] _790;
    wire [2:0] _458;
    wire [2:0] _3602;
    wire _3598;
    wire _3599;
    wire _3596;
    wire _3600;
    wire [2:0] _3603;
    wire _3593;
    wire _3594;
    wire _3592;
    wire _3595;
    wire [2:0] _3605;
    wire _3589;
    wire [2:0] _3591;
    wire _3588;
    wire [2:0] _3606;
    wire [2:0] _254;
    reg [2:0] _454;
    wire _456;
    wire [2:0] _459;
    wire _449;
    wire _450;
    wire _448;
    wire _451;
    wire [2:0] _461;
    wire _445;
    wire _446;
    wire [2:0] _462;
    wire _766;
    wire [2:0] _768;
    wire [2:0] _437;
    wire [2:0] _3621;
    wire _3617;
    wire _3618;
    wire _3615;
    wire _3619;
    wire [2:0] _3622;
    wire _3612;
    wire _3613;
    wire _3611;
    wire _3614;
    wire [2:0] _3624;
    wire _3608;
    wire [2:0] _3610;
    wire _3607;
    wire [2:0] _3625;
    wire [2:0] _255;
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
    wire _763;
    wire [2:0] _765;
    wire _769;
    wire [2:0] _770;
    wire [2:0] _414;
    wire [2:0] _3640;
    wire _3636;
    wire _3637;
    wire _3634;
    wire _3638;
    wire [2:0] _3641;
    wire _3631;
    wire _3632;
    wire _3630;
    wire _3633;
    wire [2:0] _3643;
    wire _3627;
    wire [2:0] _3629;
    wire _3626;
    wire [2:0] _3644;
    wire [2:0] _256;
    reg [2:0] _410;
    wire _412;
    wire [2:0] _415;
    wire _405;
    wire _406;
    wire _404;
    wire _407;
    wire [2:0] _417;
    wire _401;
    wire _402;
    wire [2:0] _418;
    wire _758;
    wire [2:0] _760;
    wire [2:0] _393;
    wire [2:0] _3659;
    wire _3655;
    wire _3656;
    wire _3653;
    wire _3657;
    wire [2:0] _3660;
    wire _3650;
    wire _3651;
    wire _3649;
    wire _3652;
    wire [2:0] _3662;
    wire _3646;
    wire [2:0] _3648;
    wire _3645;
    wire [2:0] _3663;
    wire [2:0] _257;
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
    wire [7:0] _754;
    wire _755;
    wire [2:0] _757;
    wire _761;
    wire [2:0] _762;
    wire _771;
    wire [2:0] _772;
    wire _791;
    wire [2:0] _792;
    wire [16:0] _793;
    wire _3666;
    wire [127:0] _3667;
    wire _3664;
    wire [127:0] _3668;
    wire [127:0] _258;
    reg [127:0] _302;
    wire _369;
    wire _370;
    wire [127:0] _371;
    wire _3671;
    wire [127:0] _3672;
    wire _3669;
    wire [127:0] _3673;
    wire [127:0] _259;
    reg [127:0] _299;
    wire _365;
    wire _366;
    wire [127:0] _367;
    wire _3676;
    wire [127:0] _3677;
    wire _3674;
    wire [127:0] _3678;
    wire [127:0] _260;
    reg [127:0] _296;
    wire _361;
    wire _362;
    wire [127:0] _363;
    wire [127:0] _262;
    wire _357;
    wire _358;
    wire [127:0] _359;
    wire [511:0] _372;
    wire [111:0] _750;
    wire [15:0] _751;
    wire [16:0] _752;
    wire [16:0] _794;
    reg [16:0] _797;
    wire gnd;
    wire [16:0] _749;
    wire _798;
    wire _799;
    wire _803;
    wire _812;
    wire [15:0] _3706;
    wire _3702;
    wire _3703;
    wire _3704;
    wire [15:0] _3707;
    wire _3686;
    wire _3687;
    wire [15:0] _3709;
    wire [15:0] _3711;
    wire [15:0] _263;
    reg [15:0] _345;
    wire [15:0] _3723;
    wire _3719;
    wire _3720;
    wire [8:0] _3698;
    wire _3699;
    wire [5:0] _3696;
    wire [5:0] _3695;
    wire _3697;
    wire [8:0] _3690;
    wire [8:0] _3712;
    wire [8:0] _3713;
    wire [8:0] _3715;
    wire [8:0] _264;
    reg [8:0] _3691;
    wire [2:0] _3692;
    wire _3694;
    wire [1:0] _3688;
    reg _3700;
    wire _3721;
    wire [15:0] _3724;
    wire _3716;
    wire _3717;
    wire [15:0] _3726;
    wire [15:0] _3728;
    wire [15:0] _265;
    reg [15:0] _342;
    wire [1:0] _745;
    reg [15:0] _746;
    wire _748;
    wire _816;
    reg [7:0] _327;
    wire [7:0] f_chg_now;
    wire _3730;
    wire [7:0] _3732;
    wire _3729;
    wire [7:0] _3733;
    wire [7:0] _3735;
    wire [7:0] _266;
    reg [7:0] _324;
    wire [7:0] f_changed_all;
    wire [7:0] _739;
    wire _741;
    wire _742;
    wire [7:0] f_chgmask1;
    wire _738;
    wire _743;
    wire [7:0] _732;
    wire [7:0] _730;
    wire vdd;
    wire _268;
    wire _270;
    wire [7:0] _272;
    reg [7:0] _308;
    reg [7:0] _311;
    wire [7:0] _731;
    wire [7:0] _733;
    wire _735;
    wire [111:0] _701;
    wire f_valid1;
    wire _736;
    wire _744;
    wire _817;
    wire _822;
    wire _861;
    wire _862;
    wire _866;
    wire f_fire1;
    wire [1:0] _1010;
    wire [1:0] f_winner;
    reg [2:0] _3683;
    wire [2:0] _3685;
    wire _3736;
    wire _3737;
    wire [15:0] _3746;
    wire [15:0] _3748;
    wire [15:0] _273;
    reg [15:0] _339;
    wire [1:0] _1822;
    reg [15:0] _1823;
    wire [15:0] _1821;
    wire _1824;
    wire [63:0] _696;
    wire _1819;
    wire _1817;
    wire _1818;
    wire _1820;
    wire _1825;
    wire _1830;
    wire _1838;
    wire f_viol_now;
    wire [2:0] _3754;
    wire [2:0] _3757;
    wire _3750;
    wire [2:0] _3758;
    wire _3749;
    wire [2:0] _3761;
    wire [2:0] _3763;
    wire [2:0] _274;
    reg [2:0] _355;
    wire _3766;
    wire [127:0] _3767;
    wire _3764;
    wire [127:0] _3768;
    wire [127:0] _275;
    reg [127:0] _293;
    wire [511:0] _303;
    wire [111:0] _304;
    wire f_valid0;
    wire _318;
    wire _335;
    wire _584;
    wire _641;
    wire _685;
    wire f_in_eval;
    wire _686;
    wire _695;
    wire f_fire0;
    wire _1096;
    wire _1097;
    wire _1192;
    wire [1:0] _3787;
    wire _3772;
    wire [1:0] _3774;
    wire _3770;
    wire [1:0] _3788;
    wire _3769;
    wire [1:0] _3791;
    wire _277;
    wire [1:0] _3793;
    wire [1:0] _3795;
    wire [1:0] _278;
    reg [1:0] _288;
    wire f_in_fetch;
    wire _1770;
    wire _1771;
    wire _2364;
    wire [7:0] _3817;
    wire _280;
    wire [7:0] _3819;
    wire [7:0] _281;
    reg [7:0] _2428;
    wire _2429;
    wire [23:0] _283;
    wire [2:0] _2425;
    reg _2436;
    wire [7:0] _2500;
    wire [7:0] _3821;
    assign _1243 = _61[11:0];
    assign _1240 = _1233 < _1230;
    assign _1241 = _1215 & _1240;
    assign _1242 = _1241 ? _1230 : _1233;
    assign _1244 = _1242 < _1243;
    assign _1245 = _1244 ? _1243 : _1242;
    assign _1246 = _1226 ? _1242 : _1245;
    assign _1232 = 12'b000000000000;
    assign _1089 = 12'b111111111111;
    assign _1086 = _1084[11:0];
    assign _1083 = 13'b0000000000000;
    assign _1080 = 10'b0000000000;
    assign _1081 = { _1080,
                     _1077 };
    assign _1082 = _1073 - _1081;
    assign _1076 = 3'b000;
    always @* begin
        case (f_winner)
        0:
            _1056 <= _655;
        1:
            _1056 <= _831;
        2:
            _1056 <= _969;
        default:
            _1056 <= _1055;
        endcase
    end
    assign _1 = _1056;
    always @(posedge _270) begin
        if (_268)
            _1077 <= _1076;
        else
            _1077 <= _1;
    end
    assign _1078 = { _1080,
                     _1077 };
    assign _1063 = 13'b1111111111111;
    assign _1062 = _1060[12:0];
    assign _1057 = 16'b0001111111111111;
    assign _1061 = _1057 < _1060;
    assign _1064 = _1061 ? _1063 : _1062;
    assign _2 = _1064;
    always @(posedge _270) begin
        if (_268)
            _1073 <= _1083;
        else
            _1073 <= _2;
    end
    assign _1079 = _1073 < _1078;
    assign _1084 = _1079 ? _1083 : _1082;
    assign _1070 = 13'b0111111111111;
    assign _1085 = _1070 < _1084;
    assign _1088 = _1085 ? _1089 : _1086;
    assign _1068 = 1'b0;
    assign _1065 = 16'b1111111111111111;
    assign _1066 = _1060 == _1065;
    assign _3 = _1066;
    always @(posedge _270) begin
        if (_268)
            _1069 <= _1068;
        else
            _1069 <= _3;
    end
    assign _1090 = _1069 ? _1089 : _1088;
    assign _4 = _1090;
    always @(posedge _270) begin
        if (_268)
            _1233 <= _1232;
        else
            _1233 <= _4;
    end
    assign _1093 = _1060[11:0];
    always @* begin
        case (f_winner)
        0:
            _1059 <= _336;
        1:
            _1059 <= _745;
        2:
            _1059 <= _883;
        default:
            _1059 <= _1058;
        endcase
    end
    always @* begin
        case (_1059)
        0:
            _1060 <= _339;
        1:
            _1060 <= _342;
        2:
            _1060 <= _345;
        default:
            _1060 <= _345;
        endcase
    end
    assign _1091 = 16'b0000111111111111;
    assign _1092 = _1091 < _1060;
    assign _1095 = _1092 ? _1089 : _1093;
    assign _5 = _1095;
    always @(posedge _270) begin
        if (_268)
            _1230 <= _1232;
        else
            _1230 <= _5;
    end
    assign _1234 = _1230 < _1233;
    assign _1235 = _1215 & _1234;
    assign _1236 = _1235 ? _1230 : _1233;
    assign _1227 = _61[23:12];
    assign _1237 = _1227 < _1236;
    assign _1238 = _1237 ? _1227 : _1236;
    assign _1225 = 8'b00000000;
    assign _1226 = _1210 == _1225;
    assign _1239 = _1226 ? _1236 : _1238;
    assign _1223 = 8'b11111111;
    assign _1222 = _1220[7:0];
    assign _1217 = 2'b10;
    assign _1216 = 2'b01;
    assign _1205 = _1201 == _1204;
    assign _1197 = _1193 & _1196;
    assign _1206 = _1197 & _1205;
    assign _6 = _1206;
    always @(posedge _270) begin
        if (_268)
            _1215 <= _1068;
        else
            _1215 <= _6;
    end
    assign _1218 = _1215 ? _1217 : _1216;
    assign _1212 = 7'b0000000;
    assign _1219 = { _1212,
                     _1218 };
    assign _1210 = _61[31:24];
    assign _1211 = { gnd,
                     _1210 };
    assign _1220 = _1211 + _1219;
    assign _1221 = _1220[8:8];
    assign _1224 = _1221 ? _1223 : _1222;
    assign _1247 = { _1224,
                     _1239,
                     _1246 };
    assign _8 = host_cov_wdata;
    assign _1248 = _1209 ? _1247 : _8;
    assign _1256 = _1209 | f_host_cov_we;
    assign _1254 = ~ _1196;
    assign _1252 = ~ _1209;
    assign _1251 = _36 & _1250;
    assign _1253 = _1251 & _1252;
    assign f_host_cov_we = _1253 & _1254;
    assign _1258 = ~ f_host_cov_we;
    assign _1257 = ~ _1209;
    assign _1259 = _1257 & _1258;
    assign _12 = _1204;
    always @(posedge _270) begin
        if (_268)
            _1263 <= _1225;
        else
            _1263 <= _12;
    end
    assign _14 = host_cov_addr;
    assign _1260 = _1196 ? _1204 : _14;
    assign _1264 = _1209 ? _1263 : _1260;
    assign _17 = host_rec_wdata;
    assign _1265 = _38 & _1250;
    assign _1269 = _355[1:0];
    assign _1270 = { _1200,
                     _1269 };
    assign _22 = host_rec_waddr;
    assign _1266 = 3'b100;
    assign _1267 = _355 < _1266;
    assign _1268 = f_in_fetch & _1267;
    assign _1271 = _1268 ? _1270 : _22;
    assign _1423 = 3'b001;
    assign _1424 = _1422 ? _1423 : _1399;
    assign _1396 = 3'b010;
    assign _1398 = _1389 ? _1266 : _1396;
    assign _1399 = _1392 ? _1398 : _1395;
    assign _1425 = _1377 ? _1424 : _1399;
    assign _1427 = _1276 ? _1076 : _1425;
    assign _1429 = _1274 ? _1076 : _1427;
    assign _24 = _1429;
    always @(posedge _270) begin
        if (_268)
            _1395 <= _1076;
        else
            _1395 <= _24;
    end
    assign _1589 = { _614,
                     _617,
                     _620,
                     _623,
                     gnd,
                     _1395 };
    assign _1582 = _1580 ? _1423 : _1557;
    assign _1556 = _1547 ? _1266 : _1396;
    assign _1557 = _1550 ? _1556 : _1553;
    assign _1583 = _1535 ? _1582 : _1557;
    assign _1585 = _1434 ? _1076 : _1583;
    assign _1587 = _1432 ? _1076 : _1585;
    assign _25 = _1587;
    always @(posedge _270) begin
        if (_268)
            _1553 <= _1076;
        else
            _1553 <= _25;
    end
    assign _1588 = { _628,
                     _631,
                     _634,
                     _637,
                     gnd,
                     _1553 };
    assign _1590 = { _1588,
                     _1589 };
    assign _1593 = { _1591,
                     _1592 };
    assign _1628 = _1624 ? _1616 : _1627;
    assign _1630 = _40 ? _1076 : _1628;
    assign _28 = _1630;
    always @(posedge _270) begin
        if (_268)
            _1627 <= _1076;
        else
            _1627 <= _28;
    end
    assign _1631 = 1'b1;
    assign _1623 = ~ _1622;
    assign _1614 = _1595 ? _1423 : _1396;
    assign _1611 = 3'b011;
    assign _1615 = _1603 ? _1614 : _1611;
    assign _1591 = _1461 | _1436;
    assign _1606 = _31[1:1];
    assign _1607 = _1606 & _1591;
    assign _1592 = _1303 | _1278;
    assign _31 = host_lane_we;
    assign _1604 = _31[0:0];
    assign _1605 = _1604 & _1592;
    assign _1608 = _1605 | _1607;
    assign _32 = _1196;
    always @(posedge _270) begin
        if (_268)
            _1209 <= _1068;
        else
            _1209 <= _32;
    end
    assign _1600 = _1196 | _1209;
    assign _1599 = _36 & _1250;
    assign _1601 = _1599 & _1600;
    assign _1597 = ~ _1250;
    assign _34 = host_cov_re;
    assign _36 = host_cov_we;
    assign _1596 = _36 | _34;
    assign _1598 = _1596 & _1597;
    assign _1602 = _1598 | _1601;
    assign _1594 = ~ _1250;
    assign _38 = host_rec_we;
    assign _1595 = _38 & _1594;
    assign _1603 = _1595 | _1602;
    assign _1609 = _1603 | _1608;
    assign _1616 = _1609 ? _1615 : _1076;
    assign _1618 = _1616 == _1076;
    assign _1619 = ~ _1618;
    assign _1624 = _1619 & _1623;
    assign _1632 = _1624 ? _1631 : _1622;
    assign _40 = host_err_clear;
    assign _1634 = _40 ? _1068 : _1632;
    assign _41 = _1634;
    always @(posedge _270) begin
        if (_268)
            _1622 <= _1068;
        else
            _1622 <= _41;
    end
    assign _43 = _1201;
    always @(posedge _270) begin
        if (_268)
            _1204 <= _1225;
        else
            _1204 <= _43;
    end
    assign _1201 = { _1200,
                     f_winner };
    assign _1638 = _1201 == _1204;
    assign _1639 = ~ _1638;
    assign _1635 = ~ _1196;
    assign _1636 = _1193 & _1635;
    assign _44 = _1636;
    always @(posedge _270) begin
        if (_268)
            _1196 <= _1068;
        else
            _1196 <= _44;
    end
    assign _46 = host_cover_en;
    assign _1193 = _1192 & _46;
    assign _1637 = _1193 & _1196;
    assign _1640 = _1637 & _1639;
    assign _1645 = _1640 ? _1631 : _1643;
    assign _1647 = _280 ? _1068 : _1645;
    assign _47 = _1647;
    always @(posedge _270) begin
        if (_268)
            _1643 <= _1068;
        else
            _1643 <= _47;
    end
    assign _1650 = _75 & _1649;
    assign _1655 = _1650 ? _1631 : _1653;
    assign _1657 = _280 ? _1068 : _1655;
    assign _49 = _1657;
    always @(posedge _270) begin
        if (_268)
            _1653 <= _1068;
        else
            _1653 <= _49;
    end
    assign _1789 = ~ _1788;
    assign _1782 = _1767 & _1781;
    assign _1790 = _1782 & _1789;
    assign _1763 = ~ _1762;
    assign _1710 = _1660 & _1709;
    assign _1764 = _1710 & _1763;
    assign _1791 = _1764 | _1790;
    assign _51 = _1791;
    assign _1792 = _140 & _602;
    assign _1793 = _1792 | _51;
    assign _1798 = _1793 ? _1631 : _1796;
    assign _1800 = _280 ? _1068 : _1798;
    assign _52 = _1800;
    always @(posedge _270) begin
        if (_268)
            _1796 <= _1068;
        else
            _1796 <= _52;
    end
    assign _1804 = _696[61:61];
    assign _1805 = _1770 & _1804;
    assign _1810 = _1805 ? _1631 : _1808;
    assign _56 = host_irq_ack;
    assign _1812 = _56 ? _1068 : _1810;
    assign _1814 = _280 ? _1068 : _1812;
    assign _57 = _1814;
    always @(posedge _270) begin
        if (_268)
            _1808 <= _1068;
        else
            _1808 <= _57;
    end
    assign _1843 = f_policy == _1842;
    assign _1845 = _1843 ? _1631 : _1803;
    assign _1841 = f_policy == _2347;
    assign _1847 = _1841 ? _1631 : _1845;
    assign _1848 = f_viol_now ? _1847 : _1803;
    assign _1849 = _1192 ? _1803 : _1848;
    assign _1816 = _288 == _1217;
    assign _1850 = _1816 ? _1849 : _1803;
    assign _1852 = _280 ? _1068 : _1850;
    assign _58 = _1852;
    always @(posedge _270) begin
        if (_268)
            _1803 <= _1068;
        else
            _1803 <= _58;
    end
    assign _1858 = ~ _1857;
    assign _1855 = ~ _1854;
    assign _1859 = _1855 | _1858;
    assign _1860 = _1859 | _1803;
    assign _1861 = _1860 | _1808;
    assign _61 = ram_cov_rdata;
    assign _1862 = 32'b00000000000000000000000000000000;
    assign _1863 = _1250 ? _61 : _1862;
    assign _2230 = 3'b111;
    assign _2231 = _1868 == _2230;
    assign _2232 = _1865 & _2231;
    assign _2229 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _270) begin
        if (_268)
            _2233 <= _2229;
        else
            if (_2232)
                _2233 <= _74;
    end
    assign _2224 = 3'b110;
    assign _2225 = _1868 == _2224;
    assign _2226 = _1865 & _2225;
    always @(posedge _270) begin
        if (_268)
            _2227 <= _2229;
        else
            if (_2226)
                _2227 <= _74;
    end
    assign _2218 = 3'b101;
    assign _2219 = _1868 == _2218;
    assign _2220 = _1865 & _2219;
    always @(posedge _270) begin
        if (_268)
            _2221 <= _2229;
        else
            if (_2220)
                _2221 <= _74;
    end
    assign _2213 = _1868 == _1266;
    assign _2214 = _1865 & _2213;
    always @(posedge _270) begin
        if (_268)
            _2215 <= _2229;
        else
            if (_2214)
                _2215 <= _74;
    end
    assign _2207 = _1868 == _1611;
    assign _2208 = _1865 & _2207;
    always @(posedge _270) begin
        if (_268)
            _2209 <= _2229;
        else
            if (_2208)
                _2209 <= _74;
    end
    assign _2201 = _1868 == _1396;
    assign _2202 = _1865 & _2201;
    always @(posedge _270) begin
        if (_268)
            _2203 <= _2229;
        else
            if (_2202)
                _2203 <= _74;
    end
    assign _2195 = _1868 == _1423;
    assign _2196 = _1865 & _2195;
    always @(posedge _270) begin
        if (_268)
            _2197 <= _2229;
        else
            if (_2196)
                _2197 <= _74;
    end
    assign _1870 = _1868 + _1423;
    assign _1871 = _1865 ? _1870 : _1868;
    assign _64 = _1871;
    always @(posedge _270) begin
        if (_268)
            _1868 <= _1076;
        else
            _1868 <= _64;
    end
    assign _2189 = _1868 == _1076;
    assign _2190 = _1865 & _2189;
    assign _2162 = _2053 - _2158;
    assign _1879 = 29'b11111111111111111111111111111;
    assign _1878 = 29'b00000000000000000000000000000;
    assign _1881 = 29'b00000000000000000000000000001;
    assign _1882 = ts_hi_m1 + _1881;
    assign _1875 = ts_reg[2:0];
    assign _1877 = _1875 == _2230;
    assign _1883 = _1877 ? _1882 : ts_hi_m1;
    assign _65 = _1883;
    always @(posedge _270) begin
        if (_268)
            ts_hi_m1 <= _1879;
        else
            ts_hi_m1 <= _65;
    end
    assign _2160 = ts_reg[31:3];
    assign _1901 = _1888 + _1423;
    assign _1897 = _1888 == _2230;
    assign _1898 = ~ _1897;
    assign _1895 = _689[0:0];
    assign _1899 = _1895 & _1898;
    assign _1902 = _1899 ? _1901 : _1888;
    assign _1892 = _689[0:0];
    assign _1893 = ~ _1892;
    assign _1890 = _324[0:0];
    assign _1889 = f_chg_now[0:0];
    assign _1891 = _1889 & _1890;
    assign _1894 = _1891 & _1893;
    assign _1904 = _1894 ? _1423 : _1902;
    assign _1885 = _288 == _1216;
    assign _1905 = _1885 ? _1904 : _1888;
    assign _66 = _1905;
    always @(posedge _270) begin
        if (_268)
            _1888 <= _1076;
        else
            _1888 <= _66;
    end
    assign _2151 = _689[0:0];
    assign _2153 = _2151 ? _1888 : _1076;
    assign _1922 = _1909 + _1423;
    assign _1918 = _1909 == _2230;
    assign _1919 = ~ _1918;
    assign _1916 = _689[1:1];
    assign _1920 = _1916 & _1919;
    assign _1923 = _1920 ? _1922 : _1909;
    assign _1913 = _689[1:1];
    assign _1914 = ~ _1913;
    assign _1911 = _324[1:1];
    assign _1910 = f_chg_now[1:1];
    assign _1912 = _1910 & _1911;
    assign _1915 = _1912 & _1914;
    assign _1925 = _1915 ? _1423 : _1923;
    assign _1906 = _288 == _1216;
    assign _1926 = _1906 ? _1925 : _1909;
    assign _67 = _1926;
    always @(posedge _270) begin
        if (_268)
            _1909 <= _1076;
        else
            _1909 <= _67;
    end
    assign _2148 = _689[1:1];
    assign _2150 = _2148 ? _1909 : _1076;
    assign _2154 = _2110 ? _2153 : _2150;
    assign _1943 = _1930 + _1423;
    assign _1939 = _1930 == _2230;
    assign _1940 = ~ _1939;
    assign _1937 = _689[2:2];
    assign _1941 = _1937 & _1940;
    assign _1944 = _1941 ? _1943 : _1930;
    assign _1934 = _689[2:2];
    assign _1935 = ~ _1934;
    assign _1932 = _324[2:2];
    assign _1931 = f_chg_now[2:2];
    assign _1933 = _1931 & _1932;
    assign _1936 = _1933 & _1935;
    assign _1946 = _1936 ? _1423 : _1944;
    assign _1927 = _288 == _1216;
    assign _1947 = _1927 ? _1946 : _1930;
    assign _68 = _1947;
    always @(posedge _270) begin
        if (_268)
            _1930 <= _1076;
        else
            _1930 <= _68;
    end
    assign _2144 = _689[2:2];
    assign _2146 = _2144 ? _1930 : _1076;
    assign _1964 = _1951 + _1423;
    assign _1960 = _1951 == _2230;
    assign _1961 = ~ _1960;
    assign _1958 = _689[3:3];
    assign _1962 = _1958 & _1961;
    assign _1965 = _1962 ? _1964 : _1951;
    assign _1955 = _689[3:3];
    assign _1956 = ~ _1955;
    assign _1953 = _324[3:3];
    assign _1952 = f_chg_now[3:3];
    assign _1954 = _1952 & _1953;
    assign _1957 = _1954 & _1956;
    assign _1967 = _1957 ? _1423 : _1965;
    assign _1948 = _288 == _1216;
    assign _1968 = _1948 ? _1967 : _1951;
    assign _69 = _1968;
    always @(posedge _270) begin
        if (_268)
            _1951 <= _1076;
        else
            _1951 <= _69;
    end
    assign _2141 = _689[3:3];
    assign _2143 = _2141 ? _1951 : _1076;
    assign _2147 = _2113 ? _2146 : _2143;
    assign _2155 = _2112 ? _2154 : _2147;
    assign _1985 = _1972 + _1423;
    assign _1981 = _1972 == _2230;
    assign _1982 = ~ _1981;
    assign _1979 = _689[4:4];
    assign _1983 = _1979 & _1982;
    assign _1986 = _1983 ? _1985 : _1972;
    assign _1976 = _689[4:4];
    assign _1977 = ~ _1976;
    assign _1974 = _324[4:4];
    assign _1973 = f_chg_now[4:4];
    assign _1975 = _1973 & _1974;
    assign _1978 = _1975 & _1977;
    assign _1988 = _1978 ? _1423 : _1986;
    assign _1969 = _288 == _1216;
    assign _1989 = _1969 ? _1988 : _1972;
    assign _70 = _1989;
    always @(posedge _270) begin
        if (_268)
            _1972 <= _1076;
        else
            _1972 <= _70;
    end
    assign _2136 = _689[4:4];
    assign _2138 = _2136 ? _1972 : _1076;
    assign _2006 = _1993 + _1423;
    assign _2002 = _1993 == _2230;
    assign _2003 = ~ _2002;
    assign _2000 = _689[5:5];
    assign _2004 = _2000 & _2003;
    assign _2007 = _2004 ? _2006 : _1993;
    assign _1997 = _689[5:5];
    assign _1998 = ~ _1997;
    assign _1995 = _324[5:5];
    assign _1994 = f_chg_now[5:5];
    assign _1996 = _1994 & _1995;
    assign _1999 = _1996 & _1998;
    assign _2009 = _1999 ? _1423 : _2007;
    assign _1990 = _288 == _1216;
    assign _2010 = _1990 ? _2009 : _1993;
    assign _71 = _2010;
    always @(posedge _270) begin
        if (_268)
            _1993 <= _1076;
        else
            _1993 <= _71;
    end
    assign _2133 = _689[5:5];
    assign _2135 = _2133 ? _1993 : _1076;
    assign _2139 = _2117 ? _2138 : _2135;
    assign _2027 = _2014 + _1423;
    assign _2023 = _2014 == _2230;
    assign _2024 = ~ _2023;
    assign _2021 = _689[6:6];
    assign _2025 = _2021 & _2024;
    assign _2028 = _2025 ? _2027 : _2014;
    assign _2018 = _689[6:6];
    assign _2019 = ~ _2018;
    assign _2016 = _324[6:6];
    assign _2015 = f_chg_now[6:6];
    assign _2017 = _2015 & _2016;
    assign _2020 = _2017 & _2019;
    assign _2030 = _2020 ? _1423 : _2028;
    assign _2011 = _288 == _1216;
    assign _2031 = _2011 ? _2030 : _2014;
    assign _72 = _2031;
    always @(posedge _270) begin
        if (_268)
            _2014 <= _1076;
        else
            _2014 <= _72;
    end
    assign _2129 = _689[6:6];
    assign _2131 = _2129 ? _2014 : _1076;
    assign _2048 = _2035 + _1423;
    assign _2044 = _2035 == _2230;
    assign _2045 = ~ _2044;
    assign _2042 = _689[7:7];
    assign _2046 = _2042 & _2045;
    assign _2049 = _2046 ? _2048 : _2035;
    assign _2039 = _689[7:7];
    assign _2040 = ~ _2039;
    assign _2037 = _324[7:7];
    assign _2036 = f_chg_now[7:7];
    assign _2038 = _2036 & _2037;
    assign _2041 = _2038 & _2040;
    assign _2051 = _2041 ? _1423 : _2049;
    assign _2032 = _288 == _1216;
    assign _2052 = _2032 ? _2051 : _2035;
    assign _73 = _2052;
    always @(posedge _270) begin
        if (_268)
            _2035 <= _1076;
        else
            _2035 <= _73;
    end
    assign _2126 = _689[7:7];
    assign _2128 = _2126 ? _2035 : _1076;
    assign _2132 = _2120 ? _2131 : _2128;
    assign _2140 = _2119 ? _2139 : _2132;
    assign _2156 = _2116 ? _2155 : _2140;
    assign _2121 = _719[7:7];
    assign _2120 = _719[6:6];
    assign _2122 = _2120 | _2121;
    assign _2118 = _719[5:5];
    assign _2117 = _719[4:4];
    assign _2119 = _2117 | _2118;
    assign _2123 = _2119 | _2122;
    assign _2114 = _719[3:3];
    assign _2113 = _719[2:2];
    assign _2115 = _2113 | _2114;
    assign _2111 = _719[1:1];
    assign _2110 = _719[0:0];
    assign _2112 = _2110 | _2111;
    assign _2116 = _2112 | _2115;
    assign _2124 = _2116 | _2123;
    assign _2157 = _2124 ? _2156 : _1076;
    assign _2099 = f_watch[0:0];
    assign _2098 = _324[0:0];
    assign _2100 = _2098 & _2099;
    assign _2102 = _2100 ? _544 : _1076;
    assign _2094 = f_watch[1:1];
    assign _2093 = _324[1:1];
    assign _2095 = _2093 & _2094;
    assign _2097 = _2095 ? _523 : _1076;
    assign _2103 = _2097 < _2102;
    assign _2104 = _2103 ? _2102 : _2097;
    assign _2087 = f_watch[2:2];
    assign _2086 = _324[2:2];
    assign _2088 = _2086 & _2087;
    assign _2090 = _2088 ? _500 : _1076;
    assign _2082 = f_watch[3:3];
    assign _2081 = _324[3:3];
    assign _2083 = _2081 & _2082;
    assign _2085 = _2083 ? _479 : _1076;
    assign _2091 = _2085 < _2090;
    assign _2092 = _2091 ? _2090 : _2085;
    assign _2105 = _2092 < _2104;
    assign _2106 = _2105 ? _2104 : _2092;
    assign _2073 = f_watch[4:4];
    assign _2072 = _324[4:4];
    assign _2074 = _2072 & _2073;
    assign _2076 = _2074 ? _454 : _1076;
    assign _2068 = f_watch[5:5];
    assign _2067 = _324[5:5];
    assign _2069 = _2067 & _2068;
    assign _2071 = _2069 ? _433 : _1076;
    assign _2077 = _2071 < _2076;
    assign _2078 = _2077 ? _2076 : _2071;
    assign _2061 = f_watch[6:6];
    assign _2060 = _324[6:6];
    assign _2062 = _2060 & _2061;
    assign _2064 = _2062 ? _410 : _1076;
    assign _2056 = f_watch[7:7];
    assign _2055 = _324[7:7];
    assign _2057 = _2055 & _2056;
    assign _2059 = _2057 ? _389 : _1076;
    assign _2065 = _2059 < _2064;
    assign _2066 = _2065 ? _2064 : _2059;
    assign _2079 = _2066 < _2078;
    assign _2080 = _2079 ? _2078 : _2066;
    assign _2107 = _2080 < _2106;
    assign _2108 = _2107 ? _2106 : _2080;
    assign _2109 = f_unexp_now ? _2108 : _1076;
    assign _2158 = f_amb_now ? _2157 : _2109;
    assign _2053 = ts_reg[2:0];
    assign _2159 = _2053 < _2158;
    assign _2161 = _2159 ? ts_hi_m1 : _2160;
    assign _2163 = { _2161,
                     _2162 };
    assign _2167 = { _2163,
                     _1200,
                     _2166,
                     _311 };
    assign _74 = _2167;
    always @(posedge _270) begin
        if (_268)
            _2191 <= _2229;
        else
            if (_2190)
                _2191 <= _74;
    end
    assign _2184 = _2182 + _1423;
    assign _1856 = 4'b0000;
    assign _2173 = 4'b0001;
    assign _2174 = _76 + _2173;
    assign _2172 = _76 - _2173;
    assign _2175 = _1865 ? _2174 : _2172;
    assign _1648 = 4'b1000;
    assign _1649 = _76 == _1648;
    assign _1864 = ~ _1649;
    assign _75 = f_viol_now;
    assign _1865 = _75 & _1864;
    assign _2170 = _1865 ^ _2169;
    assign _2176 = _2170 ? _2175 : _76;
    always @(posedge _270) begin
        if (_268)
            _2179 <= _1856;
        else
            _2179 <= _2176;
    end
    assign _76 = _2179;
    assign _1857 = _76 == _1856;
    assign _2168 = ~ _1857;
    assign _78 = host_vlog_pop;
    assign _2169 = _78 & _2168;
    assign _2185 = _2169 ? _2184 : _2182;
    assign _79 = _2185;
    always @(posedge _270) begin
        if (_268)
            _2182 <= _1076;
        else
            _2182 <= _79;
    end
    always @* begin
        case (_2182)
        0:
            _2234 <= _2191;
        1:
            _2234 <= _2197;
        2:
            _2234 <= _2203;
        3:
            _2234 <= _2209;
        4:
            _2234 <= _2215;
        5:
            _2234 <= _2221;
        6:
            _2234 <= _2227;
        default:
            _2234 <= _2233;
        endcase
    end
    assign _2338 = _2239 == _2230;
    assign _2339 = _2236 & _2338;
    always @(posedge _270) begin
        if (_268)
            _2340 <= _1225;
        else
            if (_2339)
                _2340 <= _85;
    end
    assign _2332 = _2239 == _2224;
    assign _2333 = _2236 & _2332;
    always @(posedge _270) begin
        if (_268)
            _2334 <= _1225;
        else
            if (_2333)
                _2334 <= _85;
    end
    assign _2326 = _2239 == _2218;
    assign _2327 = _2236 & _2326;
    always @(posedge _270) begin
        if (_268)
            _2328 <= _1225;
        else
            if (_2327)
                _2328 <= _85;
    end
    assign _2320 = _2239 == _1266;
    assign _2321 = _2236 & _2320;
    always @(posedge _270) begin
        if (_268)
            _2322 <= _1225;
        else
            if (_2321)
                _2322 <= _85;
    end
    assign _2314 = _2239 == _1611;
    assign _2315 = _2236 & _2314;
    always @(posedge _270) begin
        if (_268)
            _2316 <= _1225;
        else
            if (_2315)
                _2316 <= _85;
    end
    assign _2308 = _2239 == _1396;
    assign _2309 = _2236 & _2308;
    always @(posedge _270) begin
        if (_268)
            _2310 <= _1225;
        else
            if (_2309)
                _2310 <= _85;
    end
    assign _2302 = _2239 == _1423;
    assign _2303 = _2236 & _2302;
    always @(posedge _270) begin
        if (_268)
            _2304 <= _1225;
        else
            if (_2303)
                _2304 <= _85;
    end
    assign _2241 = _2239 + _1423;
    assign _2242 = _2236 ? _2241 : _2239;
    assign _82 = _2242;
    always @(posedge _270) begin
        if (_268)
            _2239 <= _1076;
        else
            _2239 <= _82;
    end
    assign _2296 = _2239 == _1076;
    assign _2297 = _2236 & _2296;
    assign _2282 = _1717 ? _2281 : _2276;
    assign _2283 = _1723 ? _2281 : _2282;
    assign _2260 = _2259 ? _2257 : _2247;
    assign _2258 = _2244 ? _2257 : _2247;
    assign _2261 = _1762 ? _2260 : _2258;
    assign _83 = _2261;
    always @(posedge _270) begin
        if (_268)
            _2247 <= _1225;
        else
            _2247 <= _83;
    end
    assign _2256 = _1667 ? _2255 : _2250;
    assign _2257 = _1673 ? _2255 : _2256;
    assign _2272 = _1660 ? _2247 : _2257;
    assign _2269 = _2268 ? _597 : _2266;
    assign _2267 = _2263 ? _597 : _2266;
    assign _2270 = _1788 ? _2269 : _2267;
    assign _84 = _2270;
    always @(posedge _270) begin
        if (_268)
            _2266 <= _1225;
        else
            _2266 <= _84;
    end
    assign _2271 = _1767 ? _2266 : _597;
    assign _2273 = _1762 ? _2272 : _2271;
    assign _2284 = _1759 ? _2283 : _2273;
    assign _85 = _2284;
    always @(posedge _270) begin
        if (_268)
            _2298 <= _1225;
        else
            if (_2297)
                _2298 <= _85;
    end
    assign _2291 = _2289 + _1423;
    assign _2292 = _2286 ? _2291 : _2289;
    assign _86 = _2292;
    always @(posedge _270) begin
        if (_268)
            _2289 <= _1076;
        else
            _2289 <= _86;
    end
    always @* begin
        case (_2289)
        0:
            _2341 <= _2298;
        1:
            _2341 <= _2304;
        2:
            _2341 <= _2310;
        3:
            _2341 <= _2316;
        4:
            _2341 <= _2322;
        5:
            _2341 <= _2328;
        6:
            _2341 <= _2334;
        default:
            _2341 <= _2340;
        endcase
    end
    assign _2344 = 32'b00000000000000000000000000000001;
    assign _2345 = ts_reg + _2344;
    assign _90 = _2345;
    always @(posedge _270) begin
        if (_268)
            ts_reg <= _1862;
        else
            ts_reg <= _90;
    end
    assign _2347 = 2'b00;
    assign _2164 = { _1830,
                     f_unexp_now };
    assign _2166 = f_amb_now ? _2347 : _2164;
    always @(posedge _270) begin
        if (_268)
            _2348 <= _2347;
        else
            _2348 <= _2166;
    end
    always @(posedge _270) begin
        if (_268)
            _2351 <= _1068;
        else
            _2351 <= f_viol_now;
    end
    always @(posedge _270) begin
        if (_268)
            _2354 <= _2347;
        else
            _2354 <= f_winner;
    end
    always @(posedge _270) begin
        if (_268)
            _2357 <= _1068;
        else
            _2357 <= _1192;
    end
    assign _2358 = _696[60:60];
    assign _2359 = f_in_eval & _2358;
    assign _1250 = _288 == _2347;
    assign _2360 = ~ _1250;
    assign _2501 = _103 & _2500;
    assign _2502 = ~ _2501;
    assign _2382 = _696[23:16];
    assign _2380 = _713[86:79];
    assign _2379 = _707[86:79];
    assign _2378 = _701[86:79];
    assign _2377 = _304[86:79];
    always @* begin
        case (f_winner)
        0:
            _2381 <= _2377;
        1:
            _2381 <= _2378;
        2:
            _2381 <= _2379;
        default:
            _2381 <= _2380;
        endcase
    end
    assign _2383 = _1770 ? _2382 : _2381;
    assign _2384 = _2383 & _2374;
    assign _2375 = ~ _2374;
    assign _2376 = _2367 & _2375;
    assign _2385 = _2376 | _2384;
    assign _2419 = _2385 | _2418;
    assign _2420 = _2364 ? _2419 : _2367;
    assign _2422 = _277 ? _1225 : _2420;
    assign _2424 = _280 ? _1225 : _2422;
    assign _100 = _2424;
    always @(posedge _270) begin
        if (_268)
            _2367 <= _1225;
        else
            _2367 <= _100;
    end
    assign _2503 = _2367 & _2502;
    assign _103 = host_open_drain;
    assign _3820 = ~ _103;
    assign _2498 = _1547 & _2492;
    assign _2497 = ~ _1547;
    assign _2495 = ~ _1389;
    assign _2496 = _2495 & _2492;
    assign _2494 = _1389 & _2492;
    assign _2493 = ~ _1389;
    assign _2492 = _2428[0:0];
    assign _2491 = _283[2:0];
    always @* begin
        case (_2491)
        0:
            _2499 <= _2492;
        1:
            _2499 <= _1389;
        2:
            _2499 <= _2493;
        3:
            _2499 <= _2494;
        4:
            _2499 <= _2496;
        5:
            _2499 <= _1547;
        6:
            _2499 <= _2497;
        default:
            _2499 <= _2498;
        endcase
    end
    assign _2489 = _1547 & _2483;
    assign _2488 = ~ _1547;
    assign _2486 = ~ _1389;
    assign _2487 = _2486 & _2483;
    assign _2485 = _1389 & _2483;
    assign _2484 = ~ _1389;
    assign _2483 = _2428[1:1];
    assign _2482 = _283[5:3];
    always @* begin
        case (_2482)
        0:
            _2490 <= _2483;
        1:
            _2490 <= _1389;
        2:
            _2490 <= _2484;
        3:
            _2490 <= _2485;
        4:
            _2490 <= _2487;
        5:
            _2490 <= _1547;
        6:
            _2490 <= _2488;
        default:
            _2490 <= _2489;
        endcase
    end
    assign _2480 = _1547 & _2474;
    assign _2479 = ~ _1547;
    assign _2477 = ~ _1389;
    assign _2478 = _2477 & _2474;
    assign _2476 = _1389 & _2474;
    assign _2475 = ~ _1389;
    assign _2474 = _2428[2:2];
    assign _2473 = _283[8:6];
    always @* begin
        case (_2473)
        0:
            _2481 <= _2474;
        1:
            _2481 <= _1389;
        2:
            _2481 <= _2475;
        3:
            _2481 <= _2476;
        4:
            _2481 <= _2478;
        5:
            _2481 <= _1547;
        6:
            _2481 <= _2479;
        default:
            _2481 <= _2480;
        endcase
    end
    assign _2471 = _1547 & _2465;
    assign _2470 = ~ _1547;
    assign _2468 = ~ _1389;
    assign _2469 = _2468 & _2465;
    assign _2467 = _1389 & _2465;
    assign _2466 = ~ _1389;
    assign _2465 = _2428[3:3];
    assign _2464 = _283[11:9];
    always @* begin
        case (_2464)
        0:
            _2472 <= _2465;
        1:
            _2472 <= _1389;
        2:
            _2472 <= _2466;
        3:
            _2472 <= _2467;
        4:
            _2472 <= _2469;
        5:
            _2472 <= _1547;
        6:
            _2472 <= _2470;
        default:
            _2472 <= _2471;
        endcase
    end
    assign _2462 = _1547 & _2456;
    assign _2461 = ~ _1547;
    assign _2459 = ~ _1389;
    assign _2460 = _2459 & _2456;
    assign _2458 = _1389 & _2456;
    assign _2457 = ~ _1389;
    assign _2456 = _2428[4:4];
    assign _2455 = _283[14:12];
    always @* begin
        case (_2455)
        0:
            _2463 <= _2456;
        1:
            _2463 <= _1389;
        2:
            _2463 <= _2457;
        3:
            _2463 <= _2458;
        4:
            _2463 <= _2460;
        5:
            _2463 <= _1547;
        6:
            _2463 <= _2461;
        default:
            _2463 <= _2462;
        endcase
    end
    assign _2453 = _1547 & _2447;
    assign _2452 = ~ _1547;
    assign _2450 = ~ _1389;
    assign _2451 = _2450 & _2447;
    assign _2449 = _1389 & _2447;
    assign _2448 = ~ _1389;
    assign _2447 = _2428[5:5];
    assign _2446 = _283[17:15];
    always @* begin
        case (_2446)
        0:
            _2454 <= _2447;
        1:
            _2454 <= _1389;
        2:
            _2454 <= _2448;
        3:
            _2454 <= _2449;
        4:
            _2454 <= _2451;
        5:
            _2454 <= _1547;
        6:
            _2454 <= _2452;
        default:
            _2454 <= _2453;
        endcase
    end
    assign _2444 = _1547 & _2438;
    assign _2443 = ~ _1547;
    assign _2441 = ~ _1389;
    assign _2442 = _2441 & _2438;
    assign _2440 = _1389 & _2438;
    assign _2439 = ~ _1389;
    assign _2438 = _2428[6:6];
    assign _2437 = _283[20:18];
    always @* begin
        case (_2437)
        0:
            _2445 <= _2438;
        1:
            _2445 <= _1389;
        2:
            _2445 <= _2439;
        3:
            _2445 <= _2440;
        4:
            _2445 <= _2442;
        5:
            _2445 <= _1547;
        6:
            _2445 <= _2443;
        default:
            _2445 <= _2444;
        endcase
    end
    assign _2435 = _1547 & _2429;
    assign _2434 = ~ _1547;
    assign _2432 = ~ _1389;
    assign _2433 = _2432 & _2429;
    assign _2431 = _1389 & _2429;
    assign _2430 = ~ _1389;
    assign _3812 = { _3810,
                     _3809 };
    assign _3809 = _593[0:0];
    assign _3810 = { _3809,
                     _3809 };
    assign _3811 = { _3810,
                     _3810 };
    assign _3813 = { _3811,
                     _3812 };
    assign _3814 = { _3813,
                     _3809 };
    assign _3815 = _3814 & _2418;
    assign _2416 = _2412 & _2410;
    assign _2415 = _2412 & _2408;
    assign _2414 = _2412 & _2405;
    assign _2412 = ~ _2399;
    assign _2413 = _2412 & _2402;
    assign _2410 = _2407 & _2404;
    assign _2411 = _2399 & _2410;
    assign _2407 = ~ _2400;
    assign _2408 = _2407 & _2401;
    assign _2409 = _2399 & _2408;
    assign _2404 = ~ _2401;
    assign _2405 = _2400 & _2404;
    assign _2406 = _2399 & _2405;
    assign _2401 = _2398[0:0];
    assign _2400 = _2398[1:1];
    assign _2402 = _2400 & _2401;
    assign _2399 = _2398[2:2];
    assign _2403 = _2399 & _2402;
    assign _2417 = { _2403,
                     _2406,
                     _2409,
                     _2411,
                     _2413,
                     _2414,
                     _2415,
                     _2416 };
    assign _2386 = ~ _1770;
    assign _2392 = _2386 & _2391;
    assign _2418 = _2392 ? _2417 : _1225;
    assign _3807 = ~ _2418;
    assign _3803 = _696[15:8];
    assign _3801 = _713[78:71];
    assign _3800 = _707[78:71];
    assign _3799 = _701[78:71];
    assign _3798 = _304[78:71];
    always @* begin
        case (f_winner)
        0:
            _3802 <= _3798;
        1:
            _3802 <= _3799;
        2:
            _3802 <= _3800;
        default:
            _3802 <= _3801;
        endcase
    end
    assign _3804 = _1770 ? _3803 : _3802;
    assign _3805 = _3804 & _2374;
    assign _2373 = _696[7:0];
    assign _2371 = _713[70:63];
    assign _2370 = _707[70:63];
    assign _2369 = _701[70:63];
    assign _2368 = _304[70:63];
    always @* begin
        case (f_winner)
        0:
            _2372 <= _2368;
        1:
            _2372 <= _2369;
        2:
            _2372 <= _2370;
        default:
            _2372 <= _2371;
        endcase
    end
    assign _2374 = _1770 ? _2373 : _2372;
    assign _3796 = ~ _2374;
    assign _3797 = _2428 & _3796;
    assign _3806 = _3797 | _3805;
    assign _3808 = _3806 & _3807;
    assign _3816 = _3808 | _3815;
    assign _2362 = _644 == _2347;
    assign _2363 = _2362 | _646;
    assign _1769 = _355 == _1266;
    assign _3790 = _1770 ? _1217 : _288;
    assign _3786 = _2519 ? _1216 : _288;
    assign _1842 = 2'b11;
    assign _3777 = f_policy == _1842;
    assign _3779 = _3777 ? _2347 : _288;
    assign _3776 = f_policy == _1217;
    assign _3781 = _3776 ? _1216 : _3779;
    assign _3775 = f_policy == _2347;
    assign _3783 = _3775 ? _2347 : _3781;
    assign _3784 = f_viol_now ? _3783 : _288;
    assign _1187 = f_chgmask3 & f_multi_eff;
    assign _1189 = _1187 == _1225;
    assign _1180 = _1140 == _1065;
    assign _1175 = 16'b0000000000000000;
    assign _1176 = _1140 == _1175;
    assign _1177 = _1176 & _1157;
    assign _1174 = _1116 == _1136;
    assign _1178 = _1174 | _1177;
    assign _1181 = _1115 ? _1180 : _1178;
    assign _1171 = _605[3:0];
    assign _1173 = _1171 == _1856;
    assign _1182 = _1173 | _1181;
    assign _1169 = _1140 == _1065;
    assign _1165 = _1140 == _1175;
    assign _1166 = _1165 & _1157;
    assign _1163 = _1116 == _1136;
    assign _1167 = _1163 | _1166;
    assign _1170 = _1115 ? _1169 : _1167;
    assign _1161 = _1127 == _1065;
    always @(posedge _270) begin
        if (_268)
            _1055 <= _1076;
        else
            _1055 <= _1052;
    end
    assign _1156 = { _1083,
                     _1055 };
    assign _1157 = _1113 < _1156;
    assign _1154 = _1127 == _1175;
    assign _1158 = _1154 & _1157;
    assign _1152 = _1116 == _1124;
    assign _1159 = _1152 | _1158;
    assign _1162 = _1115 ? _1161 : _1159;
    assign _1151 = _713[104:103];
    always @* begin
        case (_1151)
        0:
            _1183 <= vdd;
        1:
            _1183 <= _1162;
        2:
            _1183 <= _1170;
        default:
            _1183 <= _1182;
        endcase
    end
    assign _1150 = ~ _646;
    assign _1184 = _1150 | _1183;
    assign _1147 = _713[62:62];
    assign _1145 = _713[61:58];
    always @* begin
        case (_1145)
        0:
            _1146 <= vdd;
        1:
            _1146 <= _590;
        2:
            _1146 <= _594;
        3:
            _1146 <= _598;
        4:
            _1146 <= _600;
        5:
            _1146 <= _602;
        6:
            _1146 <= _606;
        7:
            _1146 <= _609;
        8:
            _1146 <= _614;
        9:
            _1146 <= _617;
        10:
            _1146 <= _620;
        11:
            _1146 <= _623;
        12:
            _1146 <= _628;
        13:
            _1146 <= _631;
        14:
            _1146 <= _634;
        default:
            _1146 <= _637;
        endcase
    end
    assign _1148 = _1146 ^ _1147;
    assign _1140 = _713[57:42];
    assign _1142 = _1140 == _1065;
    assign _1135 = 17'b00000000000000000;
    assign _1131 = _1013[57:42];
    assign _1132 = { gnd,
                     _1131 };
    assign _1133 = _1132 + _1120;
    always @(posedge _270) begin
        if (_268)
            _1136 <= _1135;
        else
            _1136 <= _1133;
    end
    assign _1137 = _1136 < _1116;
    assign _1138 = ~ _1137;
    assign _1127 = _713[41:26];
    assign _1129 = _1127 == _1175;
    assign _1044 = _1014[0:0];
    assign _1046 = _1044 ? _552 : _1076;
    assign _1041 = _1014[1:1];
    assign _1043 = _1041 ? _531 : _1076;
    assign _1047 = _1043 < _1046;
    assign _1048 = _1047 ? _1046 : _1043;
    assign _1036 = _1014[2:2];
    assign _1038 = _1036 ? _508 : _1076;
    assign _1033 = _1014[3:3];
    assign _1035 = _1033 ? _487 : _1076;
    assign _1039 = _1035 < _1038;
    assign _1040 = _1039 ? _1038 : _1035;
    assign _1049 = _1040 < _1048;
    assign _1050 = _1049 ? _1048 : _1040;
    assign _1026 = _1014[4:4];
    assign _1028 = _1026 ? _462 : _1076;
    assign _1023 = _1014[5:5];
    assign _1025 = _1023 ? _441 : _1076;
    assign _1029 = _1025 < _1028;
    assign _1030 = _1029 ? _1028 : _1025;
    assign _1018 = _1014[6:6];
    assign _1020 = _1018 ? _418 : _1076;
    assign _1014 = _1013[23:16];
    assign _1015 = _1014[7:7];
    assign _1017 = _1015 ? _397 : _1076;
    assign _1021 = _1017 < _1020;
    assign _1022 = _1021 ? _1020 : _1017;
    assign _1031 = _1022 < _1030;
    assign _1032 = _1031 ? _1030 : _1022;
    assign _1051 = _1032 < _1050;
    assign _1052 = _1051 ? _1050 : _1032;
    assign _1119 = 14'b00000000000000;
    assign _1120 = { _1119,
                     _1052 };
    assign _1013 = _372[511:400];
    assign _1117 = _1013[41:26];
    assign _1118 = { gnd,
                     _1117 };
    assign _1121 = _1118 + _1120;
    always @(posedge _270) begin
        if (_268)
            _1124 <= _1135;
        else
            _1124 <= _1121;
    end
    assign _1116 = { gnd,
                     _1113 };
    assign _1125 = _1116 < _1124;
    assign _1126 = ~ _1125;
    assign _1130 = _1126 | _1129;
    assign _1139 = _1130 & _1138;
    assign _1058 = _713[25:24];
    always @* begin
        case (_1058)
        0:
            _1113 <= _339;
        1:
            _1113 <= _342;
        2:
            _1113 <= _345;
        default:
            _1113 <= _345;
        endcase
    end
    assign _1115 = _1113 == _1065;
    assign _1143 = _1115 ? _1142 : _1139;
    assign _1107 = f_changed_all & f_chgmask3;
    assign _1109 = _1107 == _1225;
    assign _1110 = ~ _1109;
    assign _1106 = f_chgmask3 == _1225;
    assign _1111 = _1106 | _1110;
    assign _1100 = _713[7:0];
    assign _1098 = _713[15:8];
    assign _1099 = _311 ^ _1098;
    assign _1101 = _1099 & _1100;
    assign _1103 = _1101 == _1225;
    assign _1104 = f_valid3 & _1103;
    assign _1112 = _1104 & _1111;
    assign _1144 = _1112 & _1143;
    assign _1149 = _1144 & _1148;
    assign _1185 = _1149 & _1184;
    assign _1186 = f_in_eval & _1185;
    assign _1190 = _1186 & _1189;
    assign f_fire3 = _1190 & _728;
    assign _692 = f_chgmask0 & f_multi_eff;
    assign _694 = _692 == _1225;
    assign _680 = _580 == _1065;
    assign _676 = _580 == _1175;
    assign _677 = _676 & _657;
    assign _674 = _350 == _576;
    assign _678 = _674 | _677;
    assign _681 = _348 ? _680 : _678;
    assign _671 = _605[3:0];
    assign _673 = _671 == _1856;
    assign _682 = _673 | _681;
    assign _669 = _580 == _1065;
    assign _665 = _580 == _1175;
    assign _666 = _665 & _657;
    assign _663 = _350 == _576;
    assign _667 = _663 | _666;
    assign _670 = _348 ? _669 : _667;
    assign _661 = _567 == _1065;
    always @(posedge _270) begin
        if (_268)
            _655 <= _1076;
        else
            _655 <= _559;
    end
    assign _656 = { _1083,
                    _655 };
    assign _657 = _346 < _656;
    assign _651 = _567 == _1175;
    assign _658 = _651 & _657;
    assign _649 = _350 == _564;
    assign _659 = _649 | _658;
    assign _662 = _348 ? _661 : _659;
    assign _648 = _304[104:103];
    always @* begin
        case (_648)
        0:
            _683 <= vdd;
        1:
            _683 <= _662;
        2:
            _683 <= _670;
        default:
            _683 <= _682;
        endcase
    end
    assign _647 = ~ _646;
    assign _684 = _647 | _683;
    assign _639 = _304[62:62];
    assign _585 = _304[61:58];
    always @* begin
        case (_585)
        0:
            _638 <= vdd;
        1:
            _638 <= _590;
        2:
            _638 <= _594;
        3:
            _638 <= _598;
        4:
            _638 <= _600;
        5:
            _638 <= _602;
        6:
            _638 <= _606;
        7:
            _638 <= _609;
        8:
            _638 <= _614;
        9:
            _638 <= _617;
        10:
            _638 <= _620;
        11:
            _638 <= _623;
        12:
            _638 <= _628;
        13:
            _638 <= _631;
        14:
            _638 <= _634;
        default:
            _638 <= _637;
        endcase
    end
    assign _640 = _638 ^ _639;
    assign _580 = _304[57:42];
    assign _582 = _580 == _1065;
    assign _571 = _373[57:42];
    assign _572 = { gnd,
                    _571 };
    assign _573 = _572 + _560;
    always @(posedge _270) begin
        if (_268)
            _576 <= _1135;
        else
            _576 <= _573;
    end
    assign _577 = _576 < _350;
    assign _578 = ~ _577;
    assign _567 = _304[41:26];
    assign _569 = _567 == _1175;
    assign _533 = _377[0:0];
    assign _553 = _533 ? _552 : _1076;
    assign _512 = _377[1:1];
    assign _532 = _512 ? _531 : _1076;
    assign _554 = _532 < _553;
    assign _555 = _554 ? _553 : _532;
    assign _489 = _377[2:2];
    assign _509 = _489 ? _508 : _1076;
    assign _468 = _377[3:3];
    assign _488 = _468 ? _487 : _1076;
    assign _510 = _488 < _509;
    assign _511 = _510 ? _509 : _488;
    assign _556 = _511 < _555;
    assign _557 = _556 ? _555 : _511;
    assign _443 = _377[4:4];
    assign _463 = _443 ? _462 : _1076;
    assign _422 = _377[5:5];
    assign _442 = _422 ? _441 : _1076;
    assign _464 = _442 < _463;
    assign _465 = _464 ? _463 : _442;
    assign _399 = _377[6:6];
    assign _419 = _399 ? _418 : _1076;
    assign _377 = _373[23:16];
    assign _378 = _377[7:7];
    assign _398 = _378 ? _397 : _1076;
    assign _420 = _398 < _419;
    assign _421 = _420 ? _419 : _398;
    assign _466 = _421 < _465;
    assign _467 = _466 ? _465 : _421;
    assign _558 = _467 < _557;
    assign _559 = _558 ? _557 : _467;
    assign _560 = { _1119,
                    _559 };
    assign _373 = _372[175:64];
    assign _374 = _373[41:26];
    assign _375 = { gnd,
                    _374 };
    assign _561 = _375 + _560;
    always @(posedge _270) begin
        if (_268)
            _564 <= _1135;
        else
            _564 <= _561;
    end
    assign _350 = { gnd,
                    _346 };
    assign _565 = _350 < _564;
    assign _566 = ~ _565;
    assign _570 = _566 | _569;
    assign _579 = _570 & _578;
    assign _336 = _304[25:24];
    always @* begin
        case (_336)
        0:
            _346 <= _339;
        1:
            _346 <= _342;
        2:
            _346 <= _345;
        default:
            _346 <= _345;
        endcase
    end
    assign _348 = _346 == _1065;
    assign _583 = _348 ? _582 : _579;
    assign _330 = f_changed_all & f_chgmask0;
    assign _332 = _330 == _1225;
    assign _333 = ~ _332;
    assign _321 = f_chgmask0 == _1225;
    assign _334 = _321 | _333;
    assign _314 = _304[7:0];
    assign _312 = _304[15:8];
    assign _313 = _311 ^ _312;
    assign _315 = _313 & _314;
    assign _317 = _315 == _1225;
    assign _292 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _3760 = _355 + _1423;
    assign _1199 = 6'b000000;
    assign _105 = host_start_loc;
    assign _2520 = _2519 ? _2517 : _1200;
    assign _107 = host_recover_loc;
    assign _2507 = _280 ? _107 : _2506;
    assign _108 = _2507;
    always @(posedge _270) begin
        if (_268)
            _2506 <= _1199;
        else
            _2506 <= _108;
    end
    assign _2510 = f_policy == _1217;
    assign _2511 = _2510 ? _2506 : _1200;
    assign _2512 = f_viol_now ? _2511 : _1200;
    assign _2521 = _1192 ? _2520 : _2512;
    assign _2508 = _288 == _1217;
    assign _2522 = _2508 ? _2521 : _1200;
    assign _2523 = _280 ? _105 : _2522;
    assign _109 = _2523;
    always @(posedge _270) begin
        if (_268)
            _1200 <= _1199;
        else
            _1200 <= _109;
    end
    assign _2516 = _713[110:105];
    assign _2515 = _707[110:105];
    assign _2514 = _701[110:105];
    assign _2513 = _304[110:105];
    always @* begin
        case (f_winner)
        0:
            _2517 <= _2513;
        1:
            _2517 <= _2514;
        2:
            _2517 <= _2515;
        default:
            _2517 <= _2516;
        endcase
    end
    assign _2518 = _2517 == _1200;
    assign _2519 = ~ _2518;
    assign _3756 = _2519 ? _1076 : _355;
    assign _3751 = f_policy == _1217;
    assign _3753 = _3751 ? _1076 : _355;
    assign _1833 = f_changed_all & f_watch;
    assign _1835 = _1833 == _1225;
    assign _1836 = ~ _1835;
    assign _1831 = ~ _1192;
    assign _1832 = f_in_eval & _1831;
    assign f_unexp_now = _1832 & _1836;
    assign _2527 = ~ f_amb_now;
    assign _2528 = _1830 & _2527;
    assign _2530 = _2528 ? _1631 : _2526;
    assign _2531 = _1192 ? _2526 : _2530;
    assign _2526 = _1771 ? _1068 : _1828;
    assign _2524 = _288 == _1217;
    assign _2532 = _2524 ? _2531 : _2526;
    assign _110 = _2532;
    always @(posedge _270) begin
        if (_268)
            _1828 <= _1068;
        else
            _1828 <= _110;
    end
    assign _1829 = ~ _1828;
    assign _3742 = 16'b0000000000000001;
    assign _3743 = _339 + _3742;
    assign _3739 = _339 == _1065;
    assign _3740 = ~ _3739;
    assign _3741 = _3700 & _3740;
    assign _3744 = _3741 ? _3743 : _339;
    assign _3684 = _696[26:24];
    assign _3682 = _713[93:91];
    assign _3681 = _707[93:91];
    assign _3680 = _701[93:91];
    assign _3679 = _304[93:91];
    assign _1001 = f_chgmask2 & f_multi_eff;
    assign _1003 = _1001 == _1225;
    assign _994 = _951 == _1065;
    assign _990 = _951 == _1175;
    assign _991 = _990 & _971;
    assign _988 = _887 == _947;
    assign _992 = _988 | _991;
    assign _995 = _886 ? _994 : _992;
    assign _985 = _605[3:0];
    assign _987 = _985 == _1856;
    assign _996 = _987 | _995;
    assign _983 = _951 == _1065;
    assign _979 = _951 == _1175;
    assign _980 = _979 & _971;
    assign _977 = _887 == _947;
    assign _981 = _977 | _980;
    assign _984 = _886 ? _983 : _981;
    assign _975 = _938 == _1065;
    always @(posedge _270) begin
        if (_268)
            _969 <= _1076;
        else
            _969 <= _930;
    end
    assign _970 = { _1083,
                    _969 };
    assign _971 = _884 < _970;
    assign _965 = _938 == _1175;
    assign _972 = _965 & _971;
    assign _963 = _887 == _935;
    assign _973 = _963 | _972;
    assign _976 = _886 ? _975 : _973;
    assign _962 = _707[104:103];
    always @* begin
        case (_962)
        0:
            _997 <= vdd;
        1:
            _997 <= _976;
        2:
            _997 <= _984;
        default:
            _997 <= _996;
        endcase
    end
    assign _961 = ~ _646;
    assign _998 = _961 | _997;
    assign _958 = _707[62:62];
    assign _956 = _707[61:58];
    always @* begin
        case (_956)
        0:
            _957 <= vdd;
        1:
            _957 <= _590;
        2:
            _957 <= _594;
        3:
            _957 <= _598;
        4:
            _957 <= _600;
        5:
            _957 <= _602;
        6:
            _957 <= _606;
        7:
            _957 <= _609;
        8:
            _957 <= _614;
        9:
            _957 <= _617;
        10:
            _957 <= _620;
        11:
            _957 <= _623;
        12:
            _957 <= _628;
        13:
            _957 <= _631;
        14:
            _957 <= _634;
        default:
            _957 <= _637;
        endcase
    end
    assign _959 = _957 ^ _958;
    assign _951 = _707[57:42];
    assign _953 = _951 == _1065;
    assign _942 = _888[57:42];
    assign _943 = { gnd,
                    _942 };
    assign _944 = _943 + _931;
    always @(posedge _270) begin
        if (_268)
            _947 <= _1135;
        else
            _947 <= _944;
    end
    assign _948 = _947 < _887;
    assign _949 = ~ _948;
    assign _938 = _707[41:26];
    assign _940 = _938 == _1175;
    assign _922 = _892[0:0];
    assign _924 = _922 ? _552 : _1076;
    assign _919 = _892[1:1];
    assign _921 = _919 ? _531 : _1076;
    assign _925 = _921 < _924;
    assign _926 = _925 ? _924 : _921;
    assign _914 = _892[2:2];
    assign _916 = _914 ? _508 : _1076;
    assign _911 = _892[3:3];
    assign _913 = _911 ? _487 : _1076;
    assign _917 = _913 < _916;
    assign _918 = _917 ? _916 : _913;
    assign _927 = _918 < _926;
    assign _928 = _927 ? _926 : _918;
    assign _904 = _892[4:4];
    assign _906 = _904 ? _462 : _1076;
    assign _901 = _892[5:5];
    assign _903 = _901 ? _441 : _1076;
    assign _907 = _903 < _906;
    assign _908 = _907 ? _906 : _903;
    assign _896 = _892[6:6];
    assign _898 = _896 ? _418 : _1076;
    assign _892 = _888[23:16];
    assign _893 = _892[7:7];
    assign _895 = _893 ? _397 : _1076;
    assign _899 = _895 < _898;
    assign _900 = _899 ? _898 : _895;
    assign _909 = _900 < _908;
    assign _910 = _909 ? _908 : _900;
    assign _929 = _910 < _928;
    assign _930 = _929 ? _928 : _910;
    assign _931 = { _1119,
                    _930 };
    assign _888 = _372[399:288];
    assign _889 = _888[41:26];
    assign _890 = { gnd,
                    _889 };
    assign _932 = _890 + _931;
    always @(posedge _270) begin
        if (_268)
            _935 <= _1135;
        else
            _935 <= _932;
    end
    assign _887 = { gnd,
                    _884 };
    assign _936 = _887 < _935;
    assign _937 = ~ _936;
    assign _941 = _937 | _940;
    assign _950 = _941 & _949;
    assign _883 = _707[25:24];
    always @* begin
        case (_883)
        0:
            _884 <= _339;
        1:
            _884 <= _342;
        2:
            _884 <= _345;
        default:
            _884 <= _345;
        endcase
    end
    assign _886 = _884 == _1065;
    assign _954 = _886 ? _953 : _950;
    assign _877 = f_changed_all & f_chgmask2;
    assign _879 = _877 == _1225;
    assign _880 = ~ _879;
    assign _876 = f_chgmask2 == _1225;
    assign _881 = _876 | _880;
    assign _870 = _707[7:0];
    assign _868 = _707[15:8];
    assign _869 = _311 ^ _868;
    assign _871 = _869 & _870;
    assign _873 = _871 == _1225;
    assign _874 = f_valid2 & _873;
    assign _882 = _874 & _881;
    assign _955 = _882 & _954;
    assign _960 = _955 & _959;
    assign _999 = _960 & _998;
    assign _1000 = f_in_eval & _999;
    assign _1004 = _1000 & _1003;
    assign f_fire2 = _1004 & _728;
    assign _1008 = f_fire2 ? _1217 : _1842;
    assign f_policy = _696[59:58];
    assign _727 = f_policy == _1216;
    assign f_chgmask3 = _713[23:16];
    assign f_valid3 = _713[111:111];
    assign _717 = f_valid3 ? f_chgmask3 : _1225;
    assign f_chgmask2 = _707[23:16];
    assign f_valid2 = _707[111:111];
    assign _711 = f_valid2 ? f_chgmask2 : _1225;
    assign _705 = f_valid1 ? f_chgmask1 : _1225;
    assign f_chgmask0 = _304[23:16];
    assign _699 = f_valid0 ? f_chgmask0 : _1225;
    assign f_watch = _696[57:50];
    assign _700 = f_watch | _699;
    assign _706 = _700 | _705;
    assign _712 = _706 | _711;
    assign f_relevant = _712 | _717;
    assign _719 = f_multi_eff & f_relevant;
    assign _721 = _719 == _1225;
    assign _722 = ~ _721;
    assign f_amb_now = f_in_eval & _722;
    assign _724 = ~ f_amb_now;
    assign _728 = _724 | _727;
    assign _690 = _324 & f_chg_now;
    assign _2537 = _324 & f_chg_now;
    assign _2538 = _689 | _2537;
    assign _2534 = _288 == _1217;
    assign _2536 = _2534 ? _1225 : _689;
    assign _2533 = _288 == _1216;
    assign _2539 = _2533 ? _2538 : _2536;
    assign _2541 = _280 ? _1225 : _2539;
    assign _111 = _2541;
    always @(posedge _270) begin
        if (_268)
            _689 <= _1225;
        else
            _689 <= _111;
    end
    assign f_multi_eff = _689 | _690;
    assign _863 = f_chgmask1 & f_multi_eff;
    assign _865 = _863 == _1225;
    assign _856 = _813 == _1065;
    assign _852 = _813 == _1175;
    assign _853 = _852 & _833;
    assign _850 = _749 == _809;
    assign _854 = _850 | _853;
    assign _857 = _748 ? _856 : _854;
    assign _847 = _605[3:0];
    assign _849 = _847 == _1856;
    assign _858 = _849 | _857;
    assign _845 = _813 == _1065;
    assign _841 = _813 == _1175;
    assign _842 = _841 & _833;
    assign _839 = _749 == _809;
    assign _843 = _839 | _842;
    assign _846 = _748 ? _845 : _843;
    assign _837 = _800 == _1065;
    always @(posedge _270) begin
        if (_268)
            _831 <= _1076;
        else
            _831 <= _792;
    end
    assign _832 = { _1083,
                    _831 };
    assign _833 = _746 < _832;
    assign _827 = _800 == _1175;
    assign _834 = _827 & _833;
    assign _825 = _749 == _797;
    assign _835 = _825 | _834;
    assign _838 = _748 ? _837 : _835;
    assign _824 = _701[104:103];
    always @* begin
        case (_824)
        0:
            _859 <= vdd;
        1:
            _859 <= _838;
        2:
            _859 <= _846;
        default:
            _859 <= _858;
        endcase
    end
    assign _113 = host_role;
    assign _2542 = _280 ? _113 : _644;
    assign _114 = _2542;
    always @(posedge _270) begin
        if (_268)
            _644 <= _2347;
        else
            _644 <= _114;
    end
    assign _646 = _644 == _1217;
    assign _823 = ~ _646;
    assign _860 = _823 | _859;
    assign _820 = _701[62:62];
    assign _2546 = _1580 ? _1631 : _2544;
    assign _2544 = _1550 ? _1631 : _637;
    assign _2547 = _1535 ? _2546 : _2544;
    assign _2549 = _1434 ? _1068 : _2547;
    assign _2551 = _1432 ? _1068 : _2549;
    assign _115 = _2551;
    always @(posedge _270) begin
        if (_268)
            _637 <= _1068;
        else
            _637 <= _115;
    end
    assign _117 = host_lane1_sync_mask;
    assign _119 = host_lane1_sync;
    assign _2557 = _1661 ? _2556 : _2554;
    assign _2558 = _1580 ? _2554 : _2557;
    assign _2559 = _1535 ? _2558 : _2554;
    assign _2561 = _1434 ? _1175 : _2559;
    assign _120 = _2561;
    always @(posedge _270) begin
        if (_268)
            _2554 <= _1175;
        else
            _2554 <= _120;
    end
    assign _2555 = _2554[14:0];
    assign _2556 = { _2555,
                     _1571 };
    assign _2562 = _2556 ^ _119;
    assign _2563 = _2562 & _117;
    assign _2565 = _2563 == _1175;
    assign _2567 = _2565 ? _1631 : _634;
    assign _2568 = _1661 ? _2567 : _634;
    assign _2569 = _1580 ? _634 : _2568;
    assign _2570 = _1535 ? _2569 : _634;
    assign _2572 = _1434 ? _1068 : _2570;
    assign _2574 = _1432 ? _1068 : _2572;
    assign _121 = _2574;
    always @(posedge _270) begin
        if (_268)
            _634 <= _1068;
        else
            _634 <= _121;
    end
    assign _2587 = _1571 == _2586;
    assign _2588 = ~ _2587;
    assign _2590 = _2581 ? _2589 : _2577;
    assign _2591 = _1661 ? _2590 : _2577;
    assign _2592 = _1580 ? _2577 : _2591;
    assign _2593 = _1535 ? _2592 : _2577;
    assign _2595 = _1434 ? _1068 : _2593;
    assign _122 = _2595;
    always @(posedge _270) begin
        if (_268)
            _2577 <= _1068;
        else
            _2577 <= _122;
    end
    assign _2589 = _2577 | _2588;
    assign _2598 = ~ _2589;
    assign _2596 = 6'b000001;
    assign _2597 = _1690 == _2596;
    assign _2599 = _2597 ? _2598 : _631;
    assign _2600 = _2581 ? _2599 : _631;
    assign _2601 = _1661 ? _2600 : _631;
    assign _2602 = _1580 ? _631 : _2601;
    assign _2603 = _1535 ? _2602 : _631;
    assign _2605 = _1434 ? _1068 : _2603;
    assign _2607 = _1432 ? _1068 : _2605;
    assign _123 = _2607;
    always @(posedge _270) begin
        if (_268)
            _631 <= _1068;
        else
            _631 <= _123;
    end
    assign _2611 = _1422 ? _1631 : _2609;
    assign _2609 = _1392 ? _1631 : _623;
    assign _2612 = _1377 ? _2611 : _2609;
    assign _2614 = _1276 ? _1068 : _2612;
    assign _2616 = _1274 ? _1068 : _2614;
    assign _124 = _2616;
    always @(posedge _270) begin
        if (_268)
            _623 <= _1068;
        else
            _623 <= _124;
    end
    assign _126 = host_lane0_sync_mask;
    assign _128 = host_lane0_sync;
    assign _2622 = _1711 ? _2621 : _2619;
    assign _2623 = _1422 ? _2619 : _2622;
    assign _2624 = _1377 ? _2623 : _2619;
    assign _2626 = _1276 ? _1175 : _2624;
    assign _129 = _2626;
    always @(posedge _270) begin
        if (_268)
            _2619 <= _1175;
        else
            _2619 <= _129;
    end
    assign _2620 = _2619[14:0];
    assign _2621 = { _2620,
                     _1413 };
    assign _2627 = _2621 ^ _128;
    assign _2628 = _2627 & _126;
    assign _2630 = _2628 == _1175;
    assign _2632 = _2630 ? _1631 : _620;
    assign _2633 = _1711 ? _2632 : _620;
    assign _2634 = _1422 ? _620 : _2633;
    assign _2635 = _1377 ? _2634 : _620;
    assign _2637 = _1276 ? _1068 : _2635;
    assign _2639 = _1274 ? _1068 : _2637;
    assign _130 = _2639;
    always @(posedge _270) begin
        if (_268)
            _620 <= _1068;
        else
            _620 <= _130;
    end
    assign _2652 = _1413 == _2651;
    assign _2653 = ~ _2652;
    assign _2655 = _2646 ? _2654 : _2642;
    assign _2656 = _1711 ? _2655 : _2642;
    assign _2657 = _1422 ? _2642 : _2656;
    assign _2658 = _1377 ? _2657 : _2642;
    assign _2660 = _1276 ? _1068 : _2658;
    assign _131 = _2660;
    always @(posedge _270) begin
        if (_268)
            _2642 <= _1068;
        else
            _2642 <= _131;
    end
    assign _2654 = _2642 | _2653;
    assign _2663 = ~ _2654;
    assign _2662 = _1740 == _2596;
    assign _2664 = _2662 ? _2663 : _617;
    assign _2665 = _2646 ? _2664 : _617;
    assign _2666 = _1711 ? _2665 : _617;
    assign _2667 = _1422 ? _617 : _2666;
    assign _2668 = _1377 ? _2667 : _617;
    assign _2670 = _1276 ? _1068 : _2668;
    assign _2672 = _1274 ? _1068 : _2670;
    assign _132 = _2672;
    always @(posedge _270) begin
        if (_268)
            _617 <= _1068;
        else
            _617 <= _132;
    end
    assign _134 = host_match_addr;
    assign _608 = _134[6:0];
    assign _607 = _597[7:1];
    assign _609 = _607 == _608;
    assign _604 = 16'b1010110011100001;
    assign _2677 = _605[10:10];
    assign _2676 = _605[12:12];
    assign _2678 = _2676 ^ _2677;
    assign _2675 = _605[13:13];
    assign _2679 = _2675 ^ _2678;
    assign _2674 = _605[15:15];
    assign _2680 = _2674 ^ _2679;
    assign _2673 = _605[14:0];
    assign _2681 = { _2673,
                     _2680 };
    assign _135 = _2681;
    always @(posedge _270) begin
        if (_268)
            _605 <= _604;
        else
            _605 <= _135;
    end
    assign _606 = _605[0:0];
    assign _2700 = _141 + _2173;
    assign _2698 = _141 - _2173;
    assign _2701 = _2236 ? _2700 : _2698;
    assign _1854 = _141 == _1856;
    assign _2285 = ~ _1854;
    assign _137 = host_rx_pop;
    assign _2286 = _137 & _2285;
    assign _2235 = ~ _602;
    assign _2268 = _1767 & _1781;
    assign _2685 = _2268 ? _1767 : _1068;
    assign _2262 = ~ _1767;
    assign _2263 = _2262 & _1781;
    assign _2683 = _2263 ? _1631 : _1767;
    assign _1780 = _1778 == _1842;
    assign _1781 = _1771 & _1780;
    assign _1787 = _1767 | _1781;
    assign _1784 = _1660 | _1709;
    assign _1785 = ~ _1784;
    assign _1783 = ~ _1759;
    assign _1786 = _1783 & _1785;
    assign _1788 = _1786 & _1787;
    assign _2686 = _1788 ? _2685 : _2683;
    assign _138 = _2686;
    always @(posedge _270) begin
        if (_268)
            _1767 <= _1068;
        else
            _1767 <= _138;
    end
    assign _2694 = _1767 | _1781;
    assign _2259 = _1660 & _1709;
    assign _2690 = _2259 ? _1660 : _1068;
    assign _2243 = ~ _1660;
    assign _2244 = _2243 & _1709;
    assign _2688 = _2244 ? _1631 : _1660;
    assign _1707 = ~ _1673;
    assign _1701 = _1670 + _1423;
    assign _1696 = ~ _1565;
    assign _1695 = _1686 & _1694;
    assign _1697 = _1695 & _1696;
    assign _1698 = _1697 & _1666;
    assign _1699 = _1667 | _1698;
    assign _1702 = _1699 ? _1701 : _1670;
    assign _1704 = _1702 == _1076;
    assign _1705 = ~ _1704;
    assign _1676 = _1675 & _189;
    assign _1706 = _1676 & _1705;
    assign _1708 = _1706 & _1707;
    assign _1672 = _1670 == _2230;
    assign _1673 = _1667 & _1672;
    assign _1709 = _1673 | _1708;
    assign _1761 = _1660 | _1709;
    assign _1760 = ~ _1759;
    assign _1762 = _1760 & _1761;
    assign _2691 = _1762 ? _2690 : _2688;
    assign _139 = _2691;
    always @(posedge _270) begin
        if (_268)
            _1660 <= _1068;
        else
            _1660 <= _139;
    end
    assign _2692 = _1660 | _1709;
    assign _1757 = ~ _1723;
    assign _1751 = _1720 + _1423;
    assign _1746 = ~ _1407;
    assign _1745 = _1736 & _1744;
    assign _1747 = _1745 & _1746;
    assign _1748 = _1747 & _1716;
    assign _1749 = _1717 | _1748;
    assign _1752 = _1749 ? _1751 : _1720;
    assign _1754 = _1752 == _1076;
    assign _1755 = ~ _1754;
    assign _1726 = _1725 & _241;
    assign _1756 = _1726 & _1755;
    assign _1758 = _1756 & _1757;
    assign _1722 = _1720 == _2230;
    assign _1723 = _1717 & _1722;
    assign _1759 = _1723 | _1758;
    assign _2693 = _1759 | _2692;
    assign _2695 = _2693 | _2694;
    assign _140 = _2695;
    assign _2236 = _140 & _2235;
    assign _2696 = _2236 ^ _2286;
    assign _2702 = _2696 ? _2701 : _141;
    always @(posedge _270) begin
        if (_268)
            _2705 <= _1856;
        else
            _2705 <= _2702;
    end
    assign _141 = _2705;
    assign _602 = _141 == _1648;
    assign _2722 = _597[6:0];
    assign _2723 = { _2722,
                     _2719 };
    assign _2720 = _597[7:1];
    assign _2718 = _311[7:7];
    assign _2717 = _311[6:6];
    assign _2716 = _311[5:5];
    assign _2715 = _311[4:4];
    assign _2714 = _311[3:3];
    assign _2713 = _311[2:2];
    assign _2712 = _311[1:1];
    assign _2711 = _311[0:0];
    assign _2709 = _713[102:100];
    assign _2708 = _707[102:100];
    assign _2707 = _701[102:100];
    assign _2706 = _304[102:100];
    always @* begin
        case (f_winner)
        0:
            _2710 <= _2706;
        1:
            _2710 <= _2707;
        2:
            _2710 <= _2708;
        default:
            _2710 <= _2709;
        endcase
    end
    always @* begin
        case (_2710)
        0:
            _2719 <= _2711;
        1:
            _2719 <= _2712;
        2:
            _2719 <= _2713;
        3:
            _2719 <= _2714;
        4:
            _2719 <= _2715;
        5:
            _2719 <= _2716;
        6:
            _2719 <= _2717;
        default:
            _2719 <= _2718;
        endcase
    end
    assign _2721 = { _2719,
                     _2720 };
    assign _1775 = _713[97:96];
    assign _1774 = _707[97:96];
    assign _1773 = _701[97:96];
    assign _1772 = _304[97:96];
    always @* begin
        case (f_winner)
        0:
            _1776 <= _1772;
        1:
            _1776 <= _1773;
        2:
            _1776 <= _1774;
        default:
            _1776 <= _1775;
        endcase
    end
    assign _1778 = _1770 ? _2347 : _1776;
    always @* begin
        case (_1778)
        0:
            _2724 <= _597;
        1:
            _2724 <= _2721;
        2:
            _2724 <= _2723;
        default:
            _2724 <= _597;
        endcase
    end
    assign _2725 = _1771 ? _2724 : _597;
    assign _142 = _2725;
    always @(posedge _270) begin
        if (_268)
            _597 <= _1225;
        else
            _597 <= _142;
    end
    assign _598 = _597[0:0];
    assign _3495 = _593[7:1];
    assign _3496 = { vdd,
                     _3495 };
    assign _3493 = _3485[7:7];
    assign _3492 = _3485[6:6];
    assign _3491 = _3485[5:5];
    assign _3490 = _3485[4:4];
    assign _3489 = _3485[3:3];
    assign _3488 = _3485[2:2];
    assign _3487 = _3485[1:1];
    assign _3486 = _3485[0:0];
    assign _3494 = { _3486,
                     _3487,
                     _3488,
                     _3489,
                     _3490,
                     _3491,
                     _3492,
                     _3493 };
    assign _3478 = _247 + _2173;
    assign _3476 = _247 - _2173;
    assign _3479 = _2740 ? _3478 : _3476;
    assign _3149 = ~ _600;
    assign _3470 = ~ _600;
    assign _1677 = ~ _189;
    assign _3104 = ~ _187;
    assign _3105 = _189 & _3104;
    assign _3108 = _3105 ? _1216 : _1217;
    assign _3097 = ~ _1694;
    assign _3098 = _1686 & _3097;
    assign _3099 = _628 | _3098;
    assign _3100 = _3099 | _3089;
    assign _3102 = _3100 ? _1217 : _3096;
    assign _3083 = _1563 + _1423;
    assign _3080 = _1563 + _1423;
    assign _3076 = vdd == _1575;
    assign _3074 = _1563 == _1076;
    assign _3075 = ~ _3074;
    assign _3077 = _3075 & _3076;
    assign _3081 = _3077 ? _3080 : _1423;
    assign _3072 = _167 == _1217;
    assign _3084 = _3072 ? _3083 : _3081;
    assign _3085 = _3084 == _145;
    assign _3066 = _1563 + _1423;
    assign _3062 = gnd == _1575;
    assign _3060 = _1563 == _1076;
    assign _3061 = ~ _3060;
    assign _3063 = _3061 & _3062;
    assign _3067 = _3063 ? _3066 : _1423;
    assign _3058 = _167 == _1217;
    assign _3069 = _3058 ? _1076 : _3067;
    assign _3070 = _3069 == _145;
    assign _3086 = _1571 ? _3085 : _3070;
    assign _3087 = _1560 & _3086;
    assign _3088 = ~ _3087;
    assign _3054 = _1690 == _2596;
    assign _3052 = _1690 == _1199;
    assign _3055 = _2581 ? _3054 : _3052;
    assign _3047 = _1665 + _3742;
    assign _3048 = _3047 == _161;
    assign _3045 = _1665 == _161;
    assign _3049 = _1667 ? _3048 : _3045;
    assign _3043 = ~ _1580;
    assign _3044 = _1535 & _3043;
    assign _3050 = _3044 & _3049;
    assign _3056 = _3050 & _3055;
    assign _3089 = _3056 & _3088;
    assign _3091 = _3089 ? _1842 : _3042;
    assign _3093 = _1580 ? _2347 : _3091;
    assign _3039 = _1694 ? _3037 : _1842;
    assign _3035 = _1461 & _1459;
    assign _3037 = _3035 ? _1217 : _626;
    assign _3040 = _1686 ? _3039 : _3037;
    assign _2815 = _1694 ? _2814 : _2728;
    assign _2816 = _1686 ? _2815 : _2728;
    assign _143 = _2816;
    always @(posedge _270) begin
        if (_268)
            _2728 <= _1068;
        else
            _2728 <= _143;
    end
    assign _2965 = ~ _2814;
    assign _2963 = ~ _1547;
    assign _2964 = _2814 ? _1547 : _2963;
    always @* begin
        case (_183)
        0:
            _2966 <= _2814;
        1:
            _2966 <= _2964;
        2:
            _2966 <= _2965;
        default:
            _2966 <= _2814;
        endcase
    end
    assign _145 = host_lane1_stuff_len;
    assign _2947 = _1563 + _1423;
    assign _2948 = _1571 ? _2947 : _1076;
    assign _2943 = _1563 + _1423;
    assign _2939 = _1571 == _1575;
    assign _2937 = _1563 == _1076;
    assign _2938 = ~ _2937;
    assign _2940 = _2938 & _2939;
    assign _2944 = _2940 ? _2943 : _1423;
    assign _2935 = _167 == _1217;
    assign _2949 = _2935 ? _2948 : _2944;
    assign _2950 = _1580 ? _2933 : _2949;
    assign _2929 = _1563 + _1423;
    assign _2930 = _2814 ? _2929 : _1076;
    assign _2925 = _1563 + _1423;
    assign _2811 = _2803[7:7];
    assign _2810 = _2803[6:6];
    assign _2809 = _2803[5:5];
    assign _2808 = _2803[4:4];
    assign _2807 = _2803[3:3];
    assign _2806 = _2803[2:2];
    assign _2805 = _2803[1:1];
    assign _2801 = _2793[7:7];
    assign _2800 = _2793[6:6];
    assign _2799 = _2793[5:5];
    assign _2798 = _2793[4:4];
    assign _2797 = _2793[3:3];
    assign _2796 = _2793[2:2];
    assign _2795 = _2793[1:1];
    assign _2792 = _600 ? _1223 : _2790;
    assign _2253 = _2250[7:1];
    assign _2254 = { _1571,
                     _2253 };
    assign _2251 = _2250[6:0];
    assign _2252 = { _2251,
                     _1571 };
    assign _2255 = _148 ? _2254 : _2252;
    assign _2821 = _1667 ? _2255 : _2820;
    assign _2822 = _1661 ? _2821 : _2820;
    assign _2823 = _1580 ? _2820 : _2822;
    assign _2817 = _1666 ? _2793 : _2250;
    assign _2818 = _1565 ? _2250 : _2817;
    assign _2819 = _1694 ? _2818 : _2250;
    assign _2820 = _1686 ? _2819 : _2250;
    assign _2824 = _1535 ? _2823 : _2820;
    assign _146 = _2824;
    always @(posedge _270) begin
        if (_268)
            _2250 <= _1225;
        else
            _2250 <= _146;
    end
    assign _2732 = _1670 == _1076;
    assign _2729 = ~ _1565;
    assign _2730 = _2729 & _1666;
    assign _2733 = _2730 & _2732;
    assign _2793 = _2733 ? _2792 : _2250;
    assign _2794 = _2793[0:0];
    assign _2802 = { _2794,
                     _2795,
                     _2796,
                     _2797,
                     _2798,
                     _2799,
                     _2800,
                     _2801 };
    assign _148 = host_lane1_lsb_first;
    assign _2803 = _148 ? _2793 : _2802;
    assign _2804 = _2803[0:0];
    assign _2832 = _1670 + _1423;
    assign _2833 = _1667 ? _2832 : _2830;
    assign _2834 = _1661 ? _2833 : _2830;
    assign _2835 = _1580 ? _2830 : _2834;
    assign _2826 = _1670 + _1423;
    assign _2827 = _1666 ? _2826 : _1670;
    assign _2828 = _1565 ? _1670 : _2827;
    assign _2829 = _1694 ? _2828 : _1670;
    assign _2830 = _1686 ? _2829 : _1670;
    assign _2836 = _1535 ? _2835 : _2830;
    assign _2838 = _1434 ? _1076 : _2836;
    assign _149 = _2838;
    always @(posedge _270) begin
        if (_268)
            _1670 <= _1076;
        else
            _1670 <= _149;
    end
    always @* begin
        case (_1670)
        0:
            _2812 <= _2804;
        1:
            _2812 <= _2805;
        2:
            _2812 <= _2806;
        3:
            _2812 <= _2807;
        4:
            _2812 <= _2808;
        5:
            _2812 <= _2809;
        6:
            _2812 <= _2810;
        default:
            _2812 <= _2811;
        endcase
    end
    assign _151 = host_lane1_crc_inv;
    assign _153 = host_lane1_init;
    assign _2880 = _2584[30:0];
    assign _2882 = { _2880,
                     _1068 };
    assign _2874 = _2584[31:31];
    assign _2875 = _1571 ^ _2874;
    assign _2877 = _2875 ? _158 : _1862;
    assign _2871 = _2584[30:0];
    assign _2873 = { _2871,
                     _1068 };
    assign _2878 = _2873 ^ _2877;
    assign _2879 = _1667 ? _2878 : _2870;
    assign _155 = host_lane1_crc_width;
    assign _2848 = _1690 - _2596;
    assign _2849 = _2581 ? _2848 : _2846;
    assign _2850 = _1661 ? _2849 : _2846;
    assign _2851 = _1580 ? _2846 : _2850;
    assign _2842 = _1690 - _2596;
    assign _2843 = _1666 ? _1690 : _2842;
    assign _2844 = _1565 ? _1690 : _2843;
    assign _2845 = _1694 ? _2844 : _1690;
    assign _2846 = _1686 ? _2845 : _1690;
    assign _2852 = _1535 ? _2851 : _2846;
    assign _2853 = _2840 ? _155 : _2852;
    assign _2855 = _1434 ? _1199 : _2853;
    assign _156 = _2855;
    always @(posedge _270) begin
        if (_268)
            _1690 <= _1199;
        else
            _1690 <= _156;
    end
    assign _1692 = _1690 == _1199;
    assign _1693 = ~ _1692;
    assign _2579 = ~ _1666;
    assign _2578 = _1535 & _1661;
    assign _2580 = _2578 & _2579;
    assign _2581 = _2580 & _1693;
    assign _2883 = _2581 ? _2882 : _2879;
    assign _2884 = _1661 ? _2883 : _2870;
    assign _2885 = _1580 ? _2870 : _2884;
    assign _158 = host_lane1_poly;
    assign _2862 = _2584[31:31];
    assign _2863 = _2814 ^ _2862;
    assign _2865 = _2863 ? _158 : _1862;
    assign _2859 = _2584[30:0];
    assign _2861 = { _2859,
                     _1068 };
    assign _2866 = _2861 ^ _2865;
    assign _2856 = _2584[30:0];
    assign _2858 = { _2856,
                     _1068 };
    assign _2867 = _1666 ? _2866 : _2858;
    assign _2868 = _1565 ? _2584 : _2867;
    assign _2869 = _1694 ? _2868 : _2584;
    assign _2870 = _1686 ? _2869 : _2584;
    assign _2886 = _1535 ? _2885 : _2870;
    assign _2887 = _1434 ? _153 : _2886;
    assign _2889 = _1432 ? _1862 : _2887;
    assign _159 = _2889;
    always @(posedge _270) begin
        if (_268)
            _2584 <= _1862;
        else
            _2584 <= _159;
    end
    assign _2585 = _2584[31:31];
    assign _2586 = _2585 ^ _151;
    assign _161 = host_lane1_frame_bits;
    assign _2909 = _1665 + _3742;
    assign _1662 = _1535 & _1661;
    assign _1667 = _1662 & _1666;
    assign _2910 = _1667 ? _2909 : _2907;
    assign _1661 = ~ _1565;
    assign _2911 = _1661 ? _2910 : _2907;
    assign _2892 = _1580 ? _2891 : _1571;
    assign _2890 = _1694 ? _2814 : _1575;
    assign _2891 = _1686 ? _2890 : _1575;
    assign _2893 = _1535 ? _2892 : _2891;
    assign _2895 = _1434 ? _1631 : _2893;
    assign _162 = _2895;
    always @(posedge _270) begin
        if (_268)
            _1575 <= vdd;
        else
            _1575 <= _162;
    end
    assign _1576 = ~ _1575;
    assign _1573 = _167 == _1216;
    assign _1577 = _1573 ? _1576 : gnd;
    assign _2897 = _183 == _1216;
    assign _2898 = _2897 ? _1446 : _1569;
    assign _2899 = _1535 ? _2898 : _1569;
    assign _2901 = _1434 ? _1631 : _2899;
    assign _163 = _2901;
    always @(posedge _270) begin
        if (_268)
            _1569 <= vdd;
        else
            _1569 <= _163;
    end
    assign _1570 = _1446 == _1569;
    assign _1567 = _183 == _1216;
    assign _1571 = _1567 ? _1570 : _1446;
    assign _1578 = _1571 == _1577;
    assign _1579 = ~ _1578;
    assign _1580 = _1565 & _1579;
    assign _2912 = _1580 ? _2907 : _2911;
    assign _2903 = _1665 + _3742;
    assign _2904 = _1666 ? _2903 : _1665;
    assign _2905 = _1565 ? _1665 : _2904;
    assign _2906 = _1694 ? _2905 : _1665;
    assign _2907 = _1686 ? _2906 : _1665;
    assign _2913 = _1535 ? _2912 : _2907;
    assign _2915 = _1434 ? _1175 : _2913;
    assign _164 = _2915;
    always @(posedge _270) begin
        if (_268)
            _1665 <= _1175;
        else
            _1665 <= _164;
    end
    assign _1666 = _1665 < _161;
    assign _2813 = _1666 ? _2812 : _2586;
    assign _2814 = _1565 ? _1577 : _2813;
    assign _2921 = _2814 == _1575;
    assign _2919 = _1563 == _1076;
    assign _2920 = ~ _2919;
    assign _2922 = _2920 & _2921;
    assign _2926 = _2922 ? _2925 : _1423;
    assign _2917 = _167 == _1217;
    assign _2931 = _2917 ? _2930 : _2926;
    assign _2932 = _1694 ? _2931 : _1563;
    assign _2933 = _1686 ? _2932 : _1563;
    assign _2951 = _1535 ? _2950 : _2933;
    assign _2953 = _1434 ? _1076 : _2951;
    assign _165 = _2953;
    always @(posedge _270) begin
        if (_268)
            _1563 <= _1076;
        else
            _1563 <= _165;
    end
    assign _1564 = _1563 == _145;
    assign _167 = host_lane1_stuff;
    assign _1559 = _167 == _2347;
    assign _1560 = ~ _1559;
    assign _1565 = _1560 & _1564;
    assign _1687 = _1565 | _1666;
    assign _1694 = _1687 | _1693;
    assign _2967 = _1694 ? _2966 : _1631;
    assign _2968 = _1686 ? _2967 : _1547;
    assign _1682 = _1505 == _1175;
    assign _1680 = _1470 == _1175;
    assign _1683 = _1498 ? _1682 : _1680;
    assign _1684 = _1466 ? vdd : _1683;
    assign _1685 = _187 ? _1533 : _1684;
    assign _2960 = ~ _1685;
    assign _2957 = _183 == _1217;
    assign _2954 = ~ _189;
    assign _2955 = _1436 & _2954;
    assign _2958 = _2955 & _2957;
    assign _2959 = _2958 & _1534;
    assign _2961 = _2959 & _2960;
    assign _2969 = _2961 ? _2728 : _2968;
    assign _2971 = _1550 ? _1631 : _2969;
    assign _2973 = _1675 ? _1631 : _2971;
    assign _2975 = _1434 ? _1631 : _2973;
    assign _2977 = _1432 ? _1631 : _2975;
    assign _168 = _2977;
    always @(posedge _270) begin
        if (_268)
            _1547 <= vdd;
        else
            _1547 <= _168;
    end
    assign _1548 = _1446 == _1547;
    assign _1549 = ~ _1548;
    assign _1542 = _183 == _1217;
    assign _1543 = ~ _1542;
    assign _1539 = ~ _187;
    assign _170 = host_lane1_readback;
    assign _1536 = ~ _189;
    assign _1537 = _1436 & _1536;
    assign _1538 = _1537 & _170;
    assign _1540 = _1538 & _1539;
    assign _1544 = _1540 & _1543;
    assign _1545 = _1544 & _1534;
    assign _1550 = _1545 & _1549;
    assign _3042 = _1550 ? _2347 : _3040;
    assign _1531 = ~ _1519;
    assign _1532 = _1528 & _1531;
    assign _1527 = _327[7:7];
    assign _1526 = _327[6:6];
    assign _1525 = _327[5:5];
    assign _1524 = _327[4:4];
    assign _1523 = _327[3:3];
    assign _1522 = _327[2:2];
    assign _1521 = _327[1:1];
    assign _1520 = _327[0:0];
    always @* begin
        case (_172)
        0:
            _1528 <= _1520;
        1:
            _1528 <= _1521;
        2:
            _1528 <= _1522;
        3:
            _1528 <= _1523;
        4:
            _1528 <= _1524;
        5:
            _1528 <= _1525;
        6:
            _1528 <= _1526;
        default:
            _1528 <= _1527;
        endcase
    end
    assign _1529 = ~ _1528;
    assign _1518 = _311[7:7];
    assign _1517 = _311[6:6];
    assign _1516 = _311[5:5];
    assign _1515 = _311[4:4];
    assign _1514 = _311[3:3];
    assign _1513 = _311[2:2];
    assign _1512 = _311[1:1];
    assign _1511 = _311[0:0];
    assign _172 = host_lane1_clk_pin;
    always @* begin
        case (_172)
        0:
            _1519 <= _1511;
        1:
            _1519 <= _1512;
        2:
            _1519 <= _1513;
        3:
            _1519 <= _1514;
        4:
            _1519 <= _1515;
        5:
            _1519 <= _1516;
        6:
            _1519 <= _1517;
        default:
            _1519 <= _1518;
        endcase
    end
    assign _1530 = _1519 & _1529;
    assign _174 = host_lane1_clk_edge;
    assign _1533 = _174 ? _1532 : _1530;
    assign _1509 = _1494 == _1175;
    assign _1506 = _1505 == _1494;
    assign _1499 = _1470 == _1494;
    assign _1497 = ~ _1461;
    assign _1488 = _176[15:2];
    assign _1489 = { _2347,
                     _1488 };
    assign _1485 = _176[15:1];
    assign _1486 = { _1068,
                     _1485 };
    assign _1490 = _1486 + _1489;
    assign _1482 = _176[15:1];
    assign _1483 = { _1068,
                     _1482 };
    assign _1480 = _189 & _1463;
    assign _1491 = _1480 ? _1490 : _1483;
    always @(posedge _270) begin
        if (_268)
            _1494 <= _1175;
        else
            _1494 <= _1491;
    end
    assign _1495 = _1470 < _1494;
    assign _1472 = _176[15:2];
    assign _1473 = { _2347,
                     _1472 };
    always @(posedge _270) begin
        if (_268)
            _1476 <= _1175;
        else
            _1476 <= _1473;
    end
    assign _3023 = ~ _1461;
    assign _3024 = _1496 & _3023;
    assign _3025 = _3024 ? _1505 : _1470;
    assign _3027 = _1466 ? _1175 : _3025;
    assign _3029 = _3027 + _3742;
    assign _3007 = _3001 == _1135;
    assign _1501 = _176[15:1];
    assign _1502 = { _1068,
                     _1501 };
    always @(posedge _270) begin
        if (_268)
            _1505 <= _1175;
        else
            _1505 <= _1502;
    end
    assign _3003 = { gnd,
                     _1505 };
    assign _3004 = _3003 == _3001;
    assign _2997 = { gnd,
                     _176 };
    always @(posedge _270) begin
        if (_268)
            _3000 <= _1135;
        else
            _3000 <= _2997;
    end
    assign _2992 = 17'b00000000000000001;
    assign _176 = host_lane1_div_int;
    assign _2991 = { gnd,
                     _176 };
    assign _2993 = _2991 - _2992;
    always @(posedge _270) begin
        if (_268)
            _2996 <= _1135;
        else
            _2996 <= _2993;
    end
    assign _178 = host_lane1_div_frac;
    assign _3011 = { gnd,
                     _178 };
    assign _3013 = _3012[7:0];
    assign _3014 = _3009 ? _3013 : _2985;
    assign _3015 = _2982 ? _3014 : _2985;
    assign _3017 = _1434 ? _1225 : _3015;
    assign _179 = _3017;
    always @(posedge _270) begin
        if (_268)
            _2985 <= _1225;
        else
            _2985 <= _179;
    end
    assign _3010 = { gnd,
                     _2985 };
    assign _3012 = _3010 + _3011;
    assign _3018 = _3012[8:8];
    assign _3019 = _3009 ? _3018 : _2990;
    assign _3020 = _2982 ? _3019 : _2990;
    assign _3022 = _1434 ? _1068 : _3020;
    assign _180 = _3022;
    always @(posedge _270) begin
        if (_268)
            _2990 <= _1068;
        else
            _2990 <= _180;
    end
    assign _3001 = _2990 ? _3000 : _2996;
    assign _2987 = { gnd,
                     _1470 };
    assign _3002 = _2987 == _3001;
    assign _3005 = _1498 ? _3004 : _3002;
    assign _3008 = _1466 ? _3007 : _3005;
    assign _2986 = ~ _187;
    assign _3009 = _2986 & _3008;
    assign _3031 = _3009 ? _1175 : _3029;
    assign _2981 = ~ _187;
    assign _2979 = _1461 & _1459;
    assign _628 = _626 == _1842;
    assign _2978 = _1436 | _628;
    assign _2980 = _2978 | _2979;
    assign _2982 = _2980 & _2981;
    assign _3032 = _2982 ? _3031 : _1470;
    assign _3034 = _1434 ? _1175 : _3032;
    assign _181 = _3034;
    always @(posedge _270) begin
        if (_268)
            _1470 <= _1175;
        else
            _1470 <= _181;
    end
    assign _1477 = _1470 < _1476;
    assign _1478 = ~ _1477;
    assign _1467 = _1459 & _1463;
    assign _1479 = _1467 & _1478;
    assign _1496 = _1479 & _1495;
    assign _1498 = _1496 & _1497;
    assign _1507 = _1498 ? _1506 : _1499;
    assign _183 = host_lane1_code;
    assign _1463 = _183 == _1217;
    assign _1464 = ~ _1463;
    assign _1461 = _626 == _1216;
    assign _1465 = _1461 | _1464;
    assign _1458 = ~ _187;
    assign _1454 = _327[7:7];
    assign _1453 = _327[6:6];
    assign _1452 = _327[5:5];
    assign _1451 = _327[4:4];
    assign _1450 = _327[3:3];
    assign _1449 = _327[2:2];
    assign _1448 = _327[1:1];
    assign _1447 = _327[0:0];
    always @* begin
        case (_185)
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
    assign _1445 = _311[7:7];
    assign _1444 = _311[6:6];
    assign _1443 = _311[5:5];
    assign _1442 = _311[4:4];
    assign _1441 = _311[3:3];
    assign _1440 = _311[2:2];
    assign _1439 = _311[1:1];
    assign _1438 = _311[0:0];
    assign _185 = host_lane1_data_pin;
    always @* begin
        case (_185)
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
    assign _1456 = _1446 ^ _1455;
    assign _1457 = _189 & _1456;
    assign _1459 = _1457 & _1458;
    assign _1466 = _1459 & _1465;
    assign _1510 = _1466 ? _1509 : _1507;
    assign _187 = host_lane1_clk_pin_en;
    assign _1534 = _187 ? _1533 : _1510;
    assign _189 = host_lane1_dir;
    assign _1437 = _1436 & _189;
    assign _1535 = _1437 & _1534;
    assign _3094 = _1535 ? _3093 : _3042;
    assign _1675 = _242 == _2224;
    assign _3096 = _1675 ? _2347 : _3094;
    assign _2840 = _242 == _2230;
    assign _3103 = _2840 ? _3102 : _3096;
    assign _1434 = _242 == _2218;
    assign _3109 = _1434 ? _3108 : _3103;
    assign _1431 = _242 == _1266;
    assign _1432 = _1431 | _277;
    assign _3111 = _1432 ? _2347 : _3109;
    assign _190 = _3111;
    always @(posedge _270) begin
        if (_268)
            _626 <= _2347;
        else
            _626 <= _190;
    end
    assign _1436 = _626 == _1217;
    assign _1678 = _1436 & _1677;
    assign _1686 = _1678 & _1685;
    assign _3469 = _1686 & _2733;
    assign _3471 = _3469 & _3470;
    assign _3467 = ~ _600;
    assign _1727 = ~ _241;
    assign _3445 = ~ _239;
    assign _3446 = _241 & _3445;
    assign _3449 = _3446 ? _1216 : _1217;
    assign _3438 = ~ _1744;
    assign _3439 = _1736 & _3438;
    assign _3440 = _614 | _3439;
    assign _3441 = _3440 | _3430;
    assign _3443 = _3441 ? _1217 : _3437;
    assign _3424 = _1405 + _1423;
    assign _3421 = _1405 + _1423;
    assign _3417 = vdd == _1417;
    assign _3415 = _1405 == _1076;
    assign _3416 = ~ _3415;
    assign _3418 = _3416 & _3417;
    assign _3422 = _3418 ? _3421 : _1423;
    assign _3413 = _219 == _1217;
    assign _3425 = _3413 ? _3424 : _3422;
    assign _3426 = _3425 == _193;
    assign _3407 = _1405 + _1423;
    assign _3403 = gnd == _1417;
    assign _3401 = _1405 == _1076;
    assign _3402 = ~ _3401;
    assign _3404 = _3402 & _3403;
    assign _3408 = _3404 ? _3407 : _1423;
    assign _3399 = _219 == _1217;
    assign _3410 = _3399 ? _1076 : _3408;
    assign _3411 = _3410 == _193;
    assign _3427 = _1413 ? _3426 : _3411;
    assign _3428 = _1402 & _3427;
    assign _3429 = ~ _3428;
    assign _3395 = _1740 == _2596;
    assign _3393 = _1740 == _1199;
    assign _3396 = _2646 ? _3395 : _3393;
    assign _3388 = _1715 + _3742;
    assign _3389 = _3388 == _213;
    assign _3386 = _1715 == _213;
    assign _3390 = _1717 ? _3389 : _3386;
    assign _3384 = ~ _1422;
    assign _3385 = _1377 & _3384;
    assign _3391 = _3385 & _3390;
    assign _3397 = _3391 & _3396;
    assign _3430 = _3397 & _3429;
    assign _3432 = _3430 ? _1842 : _3383;
    assign _3434 = _1422 ? _2347 : _3432;
    assign _3380 = _1744 ? _3378 : _1842;
    assign _3376 = _1303 & _1301;
    assign _3378 = _3376 ? _1217 : _612;
    assign _3381 = _1736 ? _3380 : _3378;
    assign _3144 = _1744 ? _3143 : _3114;
    assign _3145 = _1736 ? _3144 : _3114;
    assign _191 = _3145;
    always @(posedge _270) begin
        if (_268)
            _3114 <= _1068;
        else
            _3114 <= _191;
    end
    assign _3302 = ~ _3143;
    assign _3300 = ~ _1389;
    assign _3301 = _3143 ? _1389 : _3300;
    always @* begin
        case (_235)
        0:
            _3303 <= _3143;
        1:
            _3303 <= _3301;
        2:
            _3303 <= _3302;
        default:
            _3303 <= _3143;
        endcase
    end
    assign _193 = host_lane0_stuff_len;
    assign _3284 = _1405 + _1423;
    assign _3285 = _1413 ? _3284 : _1076;
    assign _3280 = _1405 + _1423;
    assign _3276 = _1413 == _1417;
    assign _3274 = _1405 == _1076;
    assign _3275 = ~ _3274;
    assign _3277 = _3275 & _3276;
    assign _3281 = _3277 ? _3280 : _1423;
    assign _3272 = _219 == _1217;
    assign _3286 = _3272 ? _3285 : _3281;
    assign _3287 = _1422 ? _3270 : _3286;
    assign _3266 = _1405 + _1423;
    assign _3267 = _3143 ? _3266 : _1076;
    assign _3262 = _1405 + _1423;
    assign _3140 = _3132[7:7];
    assign _3139 = _3132[6:6];
    assign _3138 = _3132[5:5];
    assign _3137 = _3132[4:4];
    assign _3136 = _3132[3:3];
    assign _3135 = _3132[2:2];
    assign _3134 = _3132[1:1];
    assign _3130 = _3122[7:7];
    assign _3129 = _3122[6:6];
    assign _3128 = _3122[5:5];
    assign _3127 = _3122[4:4];
    assign _3126 = _3122[3:3];
    assign _3125 = _3122[2:2];
    assign _3124 = _3122[1:1];
    assign _2787 = _2743 == _2230;
    assign _2788 = _2740 & _2787;
    always @(posedge _270) begin
        if (_268)
            _2789 <= _1225;
        else
            if (_2788)
                _2789 <= _196;
    end
    assign _2781 = _2743 == _2224;
    assign _2782 = _2740 & _2781;
    always @(posedge _270) begin
        if (_268)
            _2783 <= _1225;
        else
            if (_2782)
                _2783 <= _196;
    end
    assign _2775 = _2743 == _2218;
    assign _2776 = _2740 & _2775;
    always @(posedge _270) begin
        if (_268)
            _2777 <= _1225;
        else
            if (_2776)
                _2777 <= _196;
    end
    assign _2769 = _2743 == _1266;
    assign _2770 = _2740 & _2769;
    always @(posedge _270) begin
        if (_268)
            _2771 <= _1225;
        else
            if (_2770)
                _2771 <= _196;
    end
    assign _2763 = _2743 == _1611;
    assign _2764 = _2740 & _2763;
    always @(posedge _270) begin
        if (_268)
            _2765 <= _1225;
        else
            if (_2764)
                _2765 <= _196;
    end
    assign _2757 = _2743 == _1396;
    assign _2758 = _2740 & _2757;
    always @(posedge _270) begin
        if (_268)
            _2759 <= _1225;
        else
            if (_2758)
                _2759 <= _196;
    end
    assign _2751 = _2743 == _1423;
    assign _2752 = _2740 & _2751;
    always @(posedge _270) begin
        if (_268)
            _2753 <= _1225;
        else
            if (_2752)
                _2753 <= _196;
    end
    assign _3147 = _2743 + _1423;
    assign _3148 = _2740 ? _3147 : _2743;
    assign _194 = _3148;
    always @(posedge _270) begin
        if (_268)
            _2743 <= _1076;
        else
            _2743 <= _194;
    end
    assign _2745 = _2743 == _1076;
    assign _2746 = _2740 & _2745;
    assign _196 = host_tx_data;
    always @(posedge _270) begin
        if (_268)
            _2747 <= _1225;
        else
            if (_2746)
                _2747 <= _196;
    end
    assign _3152 = _2736 + _1423;
    assign _3153 = _3150 ? _3152 : _2736;
    assign _197 = _3153;
    always @(posedge _270) begin
        if (_268)
            _2736 <= _1076;
        else
            _2736 <= _197;
    end
    always @* begin
        case (_2736)
        0:
            _2790 <= _2747;
        1:
            _2790 <= _2753;
        2:
            _2790 <= _2759;
        3:
            _2790 <= _2765;
        4:
            _2790 <= _2771;
        5:
            _2790 <= _2777;
        6:
            _2790 <= _2783;
        default:
            _2790 <= _2789;
        endcase
    end
    assign _3121 = _600 ? _1223 : _2790;
    assign _2279 = _2276[7:1];
    assign _2280 = { _1413,
                     _2279 };
    assign _2277 = _2276[6:0];
    assign _2278 = { _2277,
                     _1413 };
    assign _2281 = _200 ? _2280 : _2278;
    assign _3158 = _1717 ? _2281 : _3157;
    assign _3159 = _1711 ? _3158 : _3157;
    assign _3160 = _1422 ? _3157 : _3159;
    assign _3154 = _1716 ? _3122 : _2276;
    assign _3155 = _1407 ? _2276 : _3154;
    assign _3156 = _1744 ? _3155 : _2276;
    assign _3157 = _1736 ? _3156 : _2276;
    assign _3161 = _1377 ? _3160 : _3157;
    assign _198 = _3161;
    always @(posedge _270) begin
        if (_268)
            _2276 <= _1225;
        else
            _2276 <= _198;
    end
    assign _3118 = _1720 == _1076;
    assign _3115 = ~ _1407;
    assign _3116 = _3115 & _1716;
    assign _3119 = _3116 & _3118;
    assign _3122 = _3119 ? _3121 : _2276;
    assign _3123 = _3122[0:0];
    assign _3131 = { _3123,
                     _3124,
                     _3125,
                     _3126,
                     _3127,
                     _3128,
                     _3129,
                     _3130 };
    assign _200 = host_lane0_lsb_first;
    assign _3132 = _200 ? _3122 : _3131;
    assign _3133 = _3132[0:0];
    assign _3169 = _1720 + _1423;
    assign _3170 = _1717 ? _3169 : _3167;
    assign _3171 = _1711 ? _3170 : _3167;
    assign _3172 = _1422 ? _3167 : _3171;
    assign _3163 = _1720 + _1423;
    assign _3164 = _1716 ? _3163 : _1720;
    assign _3165 = _1407 ? _1720 : _3164;
    assign _3166 = _1744 ? _3165 : _1720;
    assign _3167 = _1736 ? _3166 : _1720;
    assign _3173 = _1377 ? _3172 : _3167;
    assign _3175 = _1276 ? _1076 : _3173;
    assign _201 = _3175;
    always @(posedge _270) begin
        if (_268)
            _1720 <= _1076;
        else
            _1720 <= _201;
    end
    always @* begin
        case (_1720)
        0:
            _3141 <= _3133;
        1:
            _3141 <= _3134;
        2:
            _3141 <= _3135;
        3:
            _3141 <= _3136;
        4:
            _3141 <= _3137;
        5:
            _3141 <= _3138;
        6:
            _3141 <= _3139;
        default:
            _3141 <= _3140;
        endcase
    end
    assign _203 = host_lane0_crc_inv;
    assign _205 = host_lane0_init;
    assign _3217 = _2649[30:0];
    assign _3219 = { _3217,
                     _1068 };
    assign _3211 = _2649[31:31];
    assign _3212 = _1413 ^ _3211;
    assign _3214 = _3212 ? _210 : _1862;
    assign _3208 = _2649[30:0];
    assign _3210 = { _3208,
                     _1068 };
    assign _3215 = _3210 ^ _3214;
    assign _3216 = _1717 ? _3215 : _3207;
    assign _207 = host_lane0_crc_width;
    assign _3185 = _1740 - _2596;
    assign _3186 = _2646 ? _3185 : _3183;
    assign _3187 = _1711 ? _3186 : _3183;
    assign _3188 = _1422 ? _3183 : _3187;
    assign _3179 = _1740 - _2596;
    assign _3180 = _1716 ? _1740 : _3179;
    assign _3181 = _1407 ? _1740 : _3180;
    assign _3182 = _1744 ? _3181 : _1740;
    assign _3183 = _1736 ? _3182 : _1740;
    assign _3189 = _1377 ? _3188 : _3183;
    assign _3190 = _3177 ? _207 : _3189;
    assign _3192 = _1276 ? _1199 : _3190;
    assign _208 = _3192;
    always @(posedge _270) begin
        if (_268)
            _1740 <= _1199;
        else
            _1740 <= _208;
    end
    assign _1742 = _1740 == _1199;
    assign _1743 = ~ _1742;
    assign _2644 = ~ _1716;
    assign _2643 = _1377 & _1711;
    assign _2645 = _2643 & _2644;
    assign _2646 = _2645 & _1743;
    assign _3220 = _2646 ? _3219 : _3216;
    assign _3221 = _1711 ? _3220 : _3207;
    assign _3222 = _1422 ? _3207 : _3221;
    assign _210 = host_lane0_poly;
    assign _3199 = _2649[31:31];
    assign _3200 = _3143 ^ _3199;
    assign _3202 = _3200 ? _210 : _1862;
    assign _3196 = _2649[30:0];
    assign _3198 = { _3196,
                     _1068 };
    assign _3203 = _3198 ^ _3202;
    assign _3193 = _2649[30:0];
    assign _3195 = { _3193,
                     _1068 };
    assign _3204 = _1716 ? _3203 : _3195;
    assign _3205 = _1407 ? _2649 : _3204;
    assign _3206 = _1744 ? _3205 : _2649;
    assign _3207 = _1736 ? _3206 : _2649;
    assign _3223 = _1377 ? _3222 : _3207;
    assign _3224 = _1276 ? _205 : _3223;
    assign _3226 = _1274 ? _1862 : _3224;
    assign _211 = _3226;
    always @(posedge _270) begin
        if (_268)
            _2649 <= _1862;
        else
            _2649 <= _211;
    end
    assign _2650 = _2649[31:31];
    assign _2651 = _2650 ^ _203;
    assign _213 = host_lane0_frame_bits;
    assign _3246 = _1715 + _3742;
    assign _1712 = _1377 & _1711;
    assign _1717 = _1712 & _1716;
    assign _3247 = _1717 ? _3246 : _3244;
    assign _1711 = ~ _1407;
    assign _3248 = _1711 ? _3247 : _3244;
    assign _3229 = _1422 ? _3228 : _1413;
    assign _3227 = _1744 ? _3143 : _1417;
    assign _3228 = _1736 ? _3227 : _1417;
    assign _3230 = _1377 ? _3229 : _3228;
    assign _3232 = _1276 ? _1631 : _3230;
    assign _214 = _3232;
    always @(posedge _270) begin
        if (_268)
            _1417 <= vdd;
        else
            _1417 <= _214;
    end
    assign _1418 = ~ _1417;
    assign _1415 = _219 == _1216;
    assign _1419 = _1415 ? _1418 : gnd;
    assign _3234 = _235 == _1216;
    assign _3235 = _3234 ? _1288 : _1411;
    assign _3236 = _1377 ? _3235 : _1411;
    assign _3238 = _1276 ? _1631 : _3236;
    assign _215 = _3238;
    always @(posedge _270) begin
        if (_268)
            _1411 <= vdd;
        else
            _1411 <= _215;
    end
    assign _1412 = _1288 == _1411;
    assign _1409 = _235 == _1216;
    assign _1413 = _1409 ? _1412 : _1288;
    assign _1420 = _1413 == _1419;
    assign _1421 = ~ _1420;
    assign _1422 = _1407 & _1421;
    assign _3249 = _1422 ? _3244 : _3248;
    assign _3240 = _1715 + _3742;
    assign _3241 = _1716 ? _3240 : _1715;
    assign _3242 = _1407 ? _1715 : _3241;
    assign _3243 = _1744 ? _3242 : _1715;
    assign _3244 = _1736 ? _3243 : _1715;
    assign _3250 = _1377 ? _3249 : _3244;
    assign _3252 = _1276 ? _1175 : _3250;
    assign _216 = _3252;
    always @(posedge _270) begin
        if (_268)
            _1715 <= _1175;
        else
            _1715 <= _216;
    end
    assign _1716 = _1715 < _213;
    assign _3142 = _1716 ? _3141 : _2651;
    assign _3143 = _1407 ? _1419 : _3142;
    assign _3258 = _3143 == _1417;
    assign _3256 = _1405 == _1076;
    assign _3257 = ~ _3256;
    assign _3259 = _3257 & _3258;
    assign _3263 = _3259 ? _3262 : _1423;
    assign _3254 = _219 == _1217;
    assign _3268 = _3254 ? _3267 : _3263;
    assign _3269 = _1744 ? _3268 : _1405;
    assign _3270 = _1736 ? _3269 : _1405;
    assign _3288 = _1377 ? _3287 : _3270;
    assign _3290 = _1276 ? _1076 : _3288;
    assign _217 = _3290;
    always @(posedge _270) begin
        if (_268)
            _1405 <= _1076;
        else
            _1405 <= _217;
    end
    assign _1406 = _1405 == _193;
    assign _219 = host_lane0_stuff;
    assign _1401 = _219 == _2347;
    assign _1402 = ~ _1401;
    assign _1407 = _1402 & _1406;
    assign _1737 = _1407 | _1716;
    assign _1744 = _1737 | _1743;
    assign _3304 = _1744 ? _3303 : _1631;
    assign _3305 = _1736 ? _3304 : _1389;
    assign _1732 = _1347 == _1175;
    assign _1730 = _1312 == _1175;
    assign _1733 = _1340 ? _1732 : _1730;
    assign _1734 = _1308 ? vdd : _1733;
    assign _1735 = _239 ? _1375 : _1734;
    assign _3297 = ~ _1735;
    assign _3294 = _235 == _1217;
    assign _3291 = ~ _241;
    assign _3292 = _1278 & _3291;
    assign _3295 = _3292 & _3294;
    assign _3296 = _3295 & _1376;
    assign _3298 = _3296 & _3297;
    assign _3306 = _3298 ? _3114 : _3305;
    assign _3308 = _1392 ? _1631 : _3306;
    assign _3310 = _1725 ? _1631 : _3308;
    assign _3312 = _1276 ? _1631 : _3310;
    assign _3314 = _1274 ? _1631 : _3312;
    assign _220 = _3314;
    always @(posedge _270) begin
        if (_268)
            _1389 <= vdd;
        else
            _1389 <= _220;
    end
    assign _1390 = _1288 == _1389;
    assign _1391 = ~ _1390;
    assign _1384 = _235 == _1217;
    assign _1385 = ~ _1384;
    assign _1381 = ~ _239;
    assign _222 = host_lane0_readback;
    assign _1378 = ~ _241;
    assign _1379 = _1278 & _1378;
    assign _1380 = _1379 & _222;
    assign _1382 = _1380 & _1381;
    assign _1386 = _1382 & _1385;
    assign _1387 = _1386 & _1376;
    assign _1392 = _1387 & _1391;
    assign _3383 = _1392 ? _2347 : _3381;
    assign _1373 = ~ _1361;
    assign _1374 = _1370 & _1373;
    assign _1369 = _327[7:7];
    assign _1368 = _327[6:6];
    assign _1367 = _327[5:5];
    assign _1366 = _327[4:4];
    assign _1365 = _327[3:3];
    assign _1364 = _327[2:2];
    assign _1363 = _327[1:1];
    assign _1362 = _327[0:0];
    always @* begin
        case (_224)
        0:
            _1370 <= _1362;
        1:
            _1370 <= _1363;
        2:
            _1370 <= _1364;
        3:
            _1370 <= _1365;
        4:
            _1370 <= _1366;
        5:
            _1370 <= _1367;
        6:
            _1370 <= _1368;
        default:
            _1370 <= _1369;
        endcase
    end
    assign _1371 = ~ _1370;
    assign _1360 = _311[7:7];
    assign _1359 = _311[6:6];
    assign _1358 = _311[5:5];
    assign _1357 = _311[4:4];
    assign _1356 = _311[3:3];
    assign _1355 = _311[2:2];
    assign _1354 = _311[1:1];
    assign _1353 = _311[0:0];
    assign _224 = host_lane0_clk_pin;
    always @* begin
        case (_224)
        0:
            _1361 <= _1353;
        1:
            _1361 <= _1354;
        2:
            _1361 <= _1355;
        3:
            _1361 <= _1356;
        4:
            _1361 <= _1357;
        5:
            _1361 <= _1358;
        6:
            _1361 <= _1359;
        default:
            _1361 <= _1360;
        endcase
    end
    assign _1372 = _1361 & _1371;
    assign _226 = host_lane0_clk_edge;
    assign _1375 = _226 ? _1374 : _1372;
    assign _1351 = _1336 == _1175;
    assign _1348 = _1347 == _1336;
    assign _1341 = _1312 == _1336;
    assign _1339 = ~ _1303;
    assign _1330 = _228[15:2];
    assign _1331 = { _2347,
                     _1330 };
    assign _1327 = _228[15:1];
    assign _1328 = { _1068,
                     _1327 };
    assign _1332 = _1328 + _1331;
    assign _1324 = _228[15:1];
    assign _1325 = { _1068,
                     _1324 };
    assign _1322 = _241 & _1305;
    assign _1333 = _1322 ? _1332 : _1325;
    always @(posedge _270) begin
        if (_268)
            _1336 <= _1175;
        else
            _1336 <= _1333;
    end
    assign _1337 = _1312 < _1336;
    assign _1314 = _228[15:2];
    assign _1315 = { _2347,
                     _1314 };
    always @(posedge _270) begin
        if (_268)
            _1318 <= _1175;
        else
            _1318 <= _1315;
    end
    assign _3360 = ~ _1303;
    assign _3361 = _1338 & _3360;
    assign _3362 = _3361 ? _1347 : _1312;
    assign _3364 = _1308 ? _1175 : _3362;
    assign _3366 = _3364 + _3742;
    assign _3344 = _3338 == _1135;
    assign _1343 = _228[15:1];
    assign _1344 = { _1068,
                     _1343 };
    always @(posedge _270) begin
        if (_268)
            _1347 <= _1175;
        else
            _1347 <= _1344;
    end
    assign _3340 = { gnd,
                     _1347 };
    assign _3341 = _3340 == _3338;
    assign _3334 = { gnd,
                     _228 };
    always @(posedge _270) begin
        if (_268)
            _3337 <= _1135;
        else
            _3337 <= _3334;
    end
    assign _228 = host_lane0_div_int;
    assign _3328 = { gnd,
                     _228 };
    assign _3330 = _3328 - _2992;
    always @(posedge _270) begin
        if (_268)
            _3333 <= _1135;
        else
            _3333 <= _3330;
    end
    assign _230 = host_lane0_div_frac;
    assign _3348 = { gnd,
                     _230 };
    assign _3350 = _3349[7:0];
    assign _3351 = _3346 ? _3350 : _3322;
    assign _3352 = _3319 ? _3351 : _3322;
    assign _3354 = _1276 ? _1225 : _3352;
    assign _231 = _3354;
    always @(posedge _270) begin
        if (_268)
            _3322 <= _1225;
        else
            _3322 <= _231;
    end
    assign _3347 = { gnd,
                     _3322 };
    assign _3349 = _3347 + _3348;
    assign _3355 = _3349[8:8];
    assign _3356 = _3346 ? _3355 : _3327;
    assign _3357 = _3319 ? _3356 : _3327;
    assign _3359 = _1276 ? _1068 : _3357;
    assign _232 = _3359;
    always @(posedge _270) begin
        if (_268)
            _3327 <= _1068;
        else
            _3327 <= _232;
    end
    assign _3338 = _3327 ? _3337 : _3333;
    assign _3324 = { gnd,
                     _1312 };
    assign _3339 = _3324 == _3338;
    assign _3342 = _1340 ? _3341 : _3339;
    assign _3345 = _1308 ? _3344 : _3342;
    assign _3323 = ~ _239;
    assign _3346 = _3323 & _3345;
    assign _3368 = _3346 ? _1175 : _3366;
    assign _3318 = ~ _239;
    assign _3316 = _1303 & _1301;
    assign _614 = _612 == _1842;
    assign _3315 = _1278 | _614;
    assign _3317 = _3315 | _3316;
    assign _3319 = _3317 & _3318;
    assign _3369 = _3319 ? _3368 : _1312;
    assign _3371 = _1276 ? _1175 : _3369;
    assign _233 = _3371;
    always @(posedge _270) begin
        if (_268)
            _1312 <= _1175;
        else
            _1312 <= _233;
    end
    assign _1319 = _1312 < _1318;
    assign _1320 = ~ _1319;
    assign _1309 = _1301 & _1305;
    assign _1321 = _1309 & _1320;
    assign _1338 = _1321 & _1337;
    assign _1340 = _1338 & _1339;
    assign _1349 = _1340 ? _1348 : _1341;
    assign _235 = host_lane0_code;
    assign _1305 = _235 == _1217;
    assign _1306 = ~ _1305;
    assign _1303 = _612 == _1216;
    assign _1307 = _1303 | _1306;
    assign _1300 = ~ _239;
    assign _1296 = _327[7:7];
    assign _1295 = _327[6:6];
    assign _1294 = _327[5:5];
    assign _1293 = _327[4:4];
    assign _1292 = _327[3:3];
    assign _1291 = _327[2:2];
    assign _1290 = _327[1:1];
    assign _1289 = _327[0:0];
    always @* begin
        case (_237)
        0:
            _1297 <= _1289;
        1:
            _1297 <= _1290;
        2:
            _1297 <= _1291;
        3:
            _1297 <= _1292;
        4:
            _1297 <= _1293;
        5:
            _1297 <= _1294;
        6:
            _1297 <= _1295;
        default:
            _1297 <= _1296;
        endcase
    end
    assign _1287 = _311[7:7];
    assign _1286 = _311[6:6];
    assign _1285 = _311[5:5];
    assign _1284 = _311[4:4];
    assign _1283 = _311[3:3];
    assign _1282 = _311[2:2];
    assign _1281 = _311[1:1];
    assign _1280 = _311[0:0];
    assign _237 = host_lane0_data_pin;
    always @* begin
        case (_237)
        0:
            _1288 <= _1280;
        1:
            _1288 <= _1281;
        2:
            _1288 <= _1282;
        3:
            _1288 <= _1283;
        4:
            _1288 <= _1284;
        5:
            _1288 <= _1285;
        6:
            _1288 <= _1286;
        default:
            _1288 <= _1287;
        endcase
    end
    assign _1298 = _1288 ^ _1297;
    assign _1299 = _241 & _1298;
    assign _1301 = _1299 & _1300;
    assign _1308 = _1301 & _1307;
    assign _1352 = _1308 ? _1351 : _1349;
    assign _239 = host_lane0_clk_pin_en;
    assign _1376 = _239 ? _1375 : _1352;
    assign _241 = host_lane0_dir;
    assign _1279 = _1278 & _241;
    assign _1377 = _1279 & _1376;
    assign _3435 = _1377 ? _3434 : _3383;
    assign _1725 = _242 == _1396;
    assign _3437 = _1725 ? _2347 : _3435;
    assign _3177 = _242 == _1611;
    assign _3444 = _3177 ? _3443 : _3437;
    assign _1276 = _242 == _1423;
    assign _3450 = _1276 ? _3449 : _3444;
    assign _2397 = _713[90:88];
    assign _2396 = _707[90:88];
    assign _2395 = _701[90:88];
    assign _2394 = _304[90:88];
    always @* begin
        case (f_winner)
        0:
            _2398 <= _2394;
        1:
            _2398 <= _2395;
        2:
            _2398 <= _2396;
        default:
            _2398 <= _2397;
        endcase
    end
    assign _2390 = _713[87:87];
    assign _2389 = _707[87:87];
    assign _2388 = _701[87:87];
    assign _2387 = _304[87:87];
    always @* begin
        case (f_winner)
        0:
            _2391 <= _2387;
        1:
            _2391 <= _2388;
        2:
            _2391 <= _2389;
        default:
            _2391 <= _2390;
        endcase
    end
    assign _3372 = ~ _2391;
    assign _3373 = _1192 & _3372;
    assign _3375 = _3373 ? _2398 : _1076;
    assign _242 = _3375;
    assign _1273 = _242 == _1266;
    assign _1274 = _1273 | _277;
    assign _3452 = _1274 ? _2347 : _3450;
    assign _243 = _3452;
    always @(posedge _270) begin
        if (_268)
            _612 <= _2347;
        else
            _612 <= _243;
    end
    assign _1278 = _612 == _1217;
    assign _1728 = _1278 & _1727;
    assign _1736 = _1728 & _1735;
    assign _3466 = _1736 & _3119;
    assign _3468 = _3466 & _3467;
    assign _3472 = _3468 | _3471;
    assign _3463 = _3459 == _1217;
    assign _3461 = _3459 == _1216;
    assign _3464 = _3461 | _3463;
    assign _3465 = _1771 & _3464;
    assign _3473 = _3465 | _3472;
    assign _244 = _3473;
    assign _3150 = _244 & _3149;
    assign _2343 = _247 == _1648;
    assign _2739 = ~ _2343;
    assign _246 = host_tx_push;
    assign _2740 = _246 & _2739;
    assign _3474 = _2740 ^ _3150;
    assign _3480 = _3474 ? _3479 : _247;
    always @(posedge _270) begin
        if (_268)
            _3483 <= _1856;
        else
            _3483 <= _3480;
    end
    assign _247 = _3483;
    assign _600 = _247 == _1856;
    assign _3485 = _600 ? _1223 : _2790;
    assign _3458 = _696[28:27];
    assign _3456 = _713[95:94];
    assign _3455 = _707[95:94];
    assign _3454 = _701[95:94];
    assign _3453 = _304[95:94];
    always @* begin
        case (f_winner)
        0:
            _3457 <= _3453;
        1:
            _3457 <= _3454;
        2:
            _3457 <= _3455;
        default:
            _3457 <= _3456;
        endcase
    end
    assign _3459 = _1770 ? _3458 : _3457;
    always @* begin
        case (_3459)
        0:
            _3497 <= _593;
        1:
            _3497 <= _3485;
        2:
            _3497 <= _3494;
        default:
            _3497 <= _3496;
        endcase
    end
    assign _3498 = _1771 ? _3497 : _593;
    assign _248 = _3498;
    always @(posedge _270) begin
        if (_268)
            _593 <= _1225;
        else
            _593 <= _248;
    end
    assign _594 = _593[0:0];
    assign _3509 = 8'b00001000;
    assign _3508 = 8'b00000111;
    assign _3506 = 8'b00000001;
    assign _3507 = _588 - _3506;
    assign _3504 = _696[30:29];
    assign _713 = _303[511:400];
    assign _3502 = _713[99:98];
    assign _707 = _303[399:288];
    assign _3501 = _707[99:98];
    assign _3500 = _701[99:98];
    assign _3499 = _304[99:98];
    always @* begin
        case (f_winner)
        0:
            _3503 <= _3499;
        1:
            _3503 <= _3500;
        2:
            _3503 <= _3501;
        default:
            _3503 <= _3502;
        endcase
    end
    assign _3505 = _1770 ? _3504 : _3503;
    always @* begin
        case (_3505)
        0:
            _3510 <= _588;
        1:
            _3510 <= _3507;
        2:
            _3510 <= _3508;
        default:
            _3510 <= _3509;
        endcase
    end
    assign _3511 = _1771 ? _3510 : _588;
    assign _249 = _3511;
    always @(posedge _270) begin
        if (_268)
            _588 <= _1225;
        else
            _588 <= _249;
    end
    assign _590 = _588 == _1225;
    assign _818 = _701[61:58];
    always @* begin
        case (_818)
        0:
            _819 <= vdd;
        1:
            _819 <= _590;
        2:
            _819 <= _594;
        3:
            _819 <= _598;
        4:
            _819 <= _600;
        5:
            _819 <= _602;
        6:
            _819 <= _606;
        7:
            _819 <= _609;
        8:
            _819 <= _614;
        9:
            _819 <= _617;
        10:
            _819 <= _620;
        11:
            _819 <= _623;
        12:
            _819 <= _628;
        13:
            _819 <= _631;
        14:
            _819 <= _634;
        default:
            _819 <= _637;
        endcase
    end
    assign _821 = _819 ^ _820;
    assign _813 = _701[57:42];
    assign _815 = _813 == _1065;
    assign _804 = _750[57:42];
    assign _805 = { gnd,
                    _804 };
    assign _806 = _805 + _793;
    always @(posedge _270) begin
        if (_268)
            _809 <= _1135;
        else
            _809 <= _806;
    end
    assign _810 = _809 < _749;
    assign _811 = ~ _810;
    assign _800 = _701[41:26];
    assign _802 = _800 == _1175;
    assign _548 = _544 + _1423;
    assign _3526 = _544 + _1423;
    assign _3522 = _544 == _2230;
    assign _3523 = ~ _3522;
    assign _3520 = _324[0:0];
    assign _3524 = _3520 & _3523;
    assign _3527 = _3524 ? _3526 : _544;
    assign _3517 = _324[0:0];
    assign _3518 = ~ _3517;
    assign _3516 = f_chg_now[0:0];
    assign _3519 = _3516 & _3518;
    assign _3529 = _3519 ? _1423 : _3527;
    assign _3513 = _288 == _1217;
    assign _3515 = _3513 ? _1076 : _544;
    assign _3512 = _288 == _1216;
    assign _3530 = _3512 ? _3529 : _3515;
    assign _250 = _3530;
    always @(posedge _270) begin
        if (_268)
            _544 <= _1076;
        else
            _544 <= _250;
    end
    assign _546 = _544 == _2230;
    assign _549 = _546 ? _544 : _548;
    assign _539 = _324[0:0];
    assign _540 = ~ _539;
    assign _538 = f_chg_now[0:0];
    assign _541 = _538 & _540;
    assign _551 = _541 ? _1423 : _549;
    assign _535 = f_changed_all[0:0];
    assign _536 = f_in_fetch & _535;
    assign _552 = _536 ? _551 : _1076;
    assign _784 = _754[0:0];
    assign _786 = _784 ? _552 : _1076;
    assign _527 = _523 + _1423;
    assign _3545 = _523 + _1423;
    assign _3541 = _523 == _2230;
    assign _3542 = ~ _3541;
    assign _3539 = _324[1:1];
    assign _3543 = _3539 & _3542;
    assign _3546 = _3543 ? _3545 : _523;
    assign _3536 = _324[1:1];
    assign _3537 = ~ _3536;
    assign _3535 = f_chg_now[1:1];
    assign _3538 = _3535 & _3537;
    assign _3548 = _3538 ? _1423 : _3546;
    assign _3532 = _288 == _1217;
    assign _3534 = _3532 ? _1076 : _523;
    assign _3531 = _288 == _1216;
    assign _3549 = _3531 ? _3548 : _3534;
    assign _251 = _3549;
    always @(posedge _270) begin
        if (_268)
            _523 <= _1076;
        else
            _523 <= _251;
    end
    assign _525 = _523 == _2230;
    assign _528 = _525 ? _523 : _527;
    assign _518 = _324[1:1];
    assign _519 = ~ _518;
    assign _517 = f_chg_now[1:1];
    assign _520 = _517 & _519;
    assign _530 = _520 ? _1423 : _528;
    assign _514 = f_changed_all[1:1];
    assign _515 = f_in_fetch & _514;
    assign _531 = _515 ? _530 : _1076;
    assign _781 = _754[1:1];
    assign _783 = _781 ? _531 : _1076;
    assign _787 = _783 < _786;
    assign _788 = _787 ? _786 : _783;
    assign _504 = _500 + _1423;
    assign _3564 = _500 + _1423;
    assign _3560 = _500 == _2230;
    assign _3561 = ~ _3560;
    assign _3558 = _324[2:2];
    assign _3562 = _3558 & _3561;
    assign _3565 = _3562 ? _3564 : _500;
    assign _3555 = _324[2:2];
    assign _3556 = ~ _3555;
    assign _3554 = f_chg_now[2:2];
    assign _3557 = _3554 & _3556;
    assign _3567 = _3557 ? _1423 : _3565;
    assign _3551 = _288 == _1217;
    assign _3553 = _3551 ? _1076 : _500;
    assign _3550 = _288 == _1216;
    assign _3568 = _3550 ? _3567 : _3553;
    assign _252 = _3568;
    always @(posedge _270) begin
        if (_268)
            _500 <= _1076;
        else
            _500 <= _252;
    end
    assign _502 = _500 == _2230;
    assign _505 = _502 ? _500 : _504;
    assign _495 = _324[2:2];
    assign _496 = ~ _495;
    assign _494 = f_chg_now[2:2];
    assign _497 = _494 & _496;
    assign _507 = _497 ? _1423 : _505;
    assign _491 = f_changed_all[2:2];
    assign _492 = f_in_fetch & _491;
    assign _508 = _492 ? _507 : _1076;
    assign _776 = _754[2:2];
    assign _778 = _776 ? _508 : _1076;
    assign _483 = _479 + _1423;
    assign _3583 = _479 + _1423;
    assign _3579 = _479 == _2230;
    assign _3580 = ~ _3579;
    assign _3577 = _324[3:3];
    assign _3581 = _3577 & _3580;
    assign _3584 = _3581 ? _3583 : _479;
    assign _3574 = _324[3:3];
    assign _3575 = ~ _3574;
    assign _3573 = f_chg_now[3:3];
    assign _3576 = _3573 & _3575;
    assign _3586 = _3576 ? _1423 : _3584;
    assign _3570 = _288 == _1217;
    assign _3572 = _3570 ? _1076 : _479;
    assign _3569 = _288 == _1216;
    assign _3587 = _3569 ? _3586 : _3572;
    assign _253 = _3587;
    always @(posedge _270) begin
        if (_268)
            _479 <= _1076;
        else
            _479 <= _253;
    end
    assign _481 = _479 == _2230;
    assign _484 = _481 ? _479 : _483;
    assign _474 = _324[3:3];
    assign _475 = ~ _474;
    assign _473 = f_chg_now[3:3];
    assign _476 = _473 & _475;
    assign _486 = _476 ? _1423 : _484;
    assign _470 = f_changed_all[3:3];
    assign _471 = f_in_fetch & _470;
    assign _487 = _471 ? _486 : _1076;
    assign _773 = _754[3:3];
    assign _775 = _773 ? _487 : _1076;
    assign _779 = _775 < _778;
    assign _780 = _779 ? _778 : _775;
    assign _789 = _780 < _788;
    assign _790 = _789 ? _788 : _780;
    assign _458 = _454 + _1423;
    assign _3602 = _454 + _1423;
    assign _3598 = _454 == _2230;
    assign _3599 = ~ _3598;
    assign _3596 = _324[4:4];
    assign _3600 = _3596 & _3599;
    assign _3603 = _3600 ? _3602 : _454;
    assign _3593 = _324[4:4];
    assign _3594 = ~ _3593;
    assign _3592 = f_chg_now[4:4];
    assign _3595 = _3592 & _3594;
    assign _3605 = _3595 ? _1423 : _3603;
    assign _3589 = _288 == _1217;
    assign _3591 = _3589 ? _1076 : _454;
    assign _3588 = _288 == _1216;
    assign _3606 = _3588 ? _3605 : _3591;
    assign _254 = _3606;
    always @(posedge _270) begin
        if (_268)
            _454 <= _1076;
        else
            _454 <= _254;
    end
    assign _456 = _454 == _2230;
    assign _459 = _456 ? _454 : _458;
    assign _449 = _324[4:4];
    assign _450 = ~ _449;
    assign _448 = f_chg_now[4:4];
    assign _451 = _448 & _450;
    assign _461 = _451 ? _1423 : _459;
    assign _445 = f_changed_all[4:4];
    assign _446 = f_in_fetch & _445;
    assign _462 = _446 ? _461 : _1076;
    assign _766 = _754[4:4];
    assign _768 = _766 ? _462 : _1076;
    assign _437 = _433 + _1423;
    assign _3621 = _433 + _1423;
    assign _3617 = _433 == _2230;
    assign _3618 = ~ _3617;
    assign _3615 = _324[5:5];
    assign _3619 = _3615 & _3618;
    assign _3622 = _3619 ? _3621 : _433;
    assign _3612 = _324[5:5];
    assign _3613 = ~ _3612;
    assign _3611 = f_chg_now[5:5];
    assign _3614 = _3611 & _3613;
    assign _3624 = _3614 ? _1423 : _3622;
    assign _3608 = _288 == _1217;
    assign _3610 = _3608 ? _1076 : _433;
    assign _3607 = _288 == _1216;
    assign _3625 = _3607 ? _3624 : _3610;
    assign _255 = _3625;
    always @(posedge _270) begin
        if (_268)
            _433 <= _1076;
        else
            _433 <= _255;
    end
    assign _435 = _433 == _2230;
    assign _438 = _435 ? _433 : _437;
    assign _428 = _324[5:5];
    assign _429 = ~ _428;
    assign _427 = f_chg_now[5:5];
    assign _430 = _427 & _429;
    assign _440 = _430 ? _1423 : _438;
    assign _424 = f_changed_all[5:5];
    assign _425 = f_in_fetch & _424;
    assign _441 = _425 ? _440 : _1076;
    assign _763 = _754[5:5];
    assign _765 = _763 ? _441 : _1076;
    assign _769 = _765 < _768;
    assign _770 = _769 ? _768 : _765;
    assign _414 = _410 + _1423;
    assign _3640 = _410 + _1423;
    assign _3636 = _410 == _2230;
    assign _3637 = ~ _3636;
    assign _3634 = _324[6:6];
    assign _3638 = _3634 & _3637;
    assign _3641 = _3638 ? _3640 : _410;
    assign _3631 = _324[6:6];
    assign _3632 = ~ _3631;
    assign _3630 = f_chg_now[6:6];
    assign _3633 = _3630 & _3632;
    assign _3643 = _3633 ? _1423 : _3641;
    assign _3627 = _288 == _1217;
    assign _3629 = _3627 ? _1076 : _410;
    assign _3626 = _288 == _1216;
    assign _3644 = _3626 ? _3643 : _3629;
    assign _256 = _3644;
    always @(posedge _270) begin
        if (_268)
            _410 <= _1076;
        else
            _410 <= _256;
    end
    assign _412 = _410 == _2230;
    assign _415 = _412 ? _410 : _414;
    assign _405 = _324[6:6];
    assign _406 = ~ _405;
    assign _404 = f_chg_now[6:6];
    assign _407 = _404 & _406;
    assign _417 = _407 ? _1423 : _415;
    assign _401 = f_changed_all[6:6];
    assign _402 = f_in_fetch & _401;
    assign _418 = _402 ? _417 : _1076;
    assign _758 = _754[6:6];
    assign _760 = _758 ? _418 : _1076;
    assign _393 = _389 + _1423;
    assign _3659 = _389 + _1423;
    assign _3655 = _389 == _2230;
    assign _3656 = ~ _3655;
    assign _3653 = _324[7:7];
    assign _3657 = _3653 & _3656;
    assign _3660 = _3657 ? _3659 : _389;
    assign _3650 = _324[7:7];
    assign _3651 = ~ _3650;
    assign _3649 = f_chg_now[7:7];
    assign _3652 = _3649 & _3651;
    assign _3662 = _3652 ? _1423 : _3660;
    assign _3646 = _288 == _1217;
    assign _3648 = _3646 ? _1076 : _389;
    assign _3645 = _288 == _1216;
    assign _3663 = _3645 ? _3662 : _3648;
    assign _257 = _3663;
    always @(posedge _270) begin
        if (_268)
            _389 <= _1076;
        else
            _389 <= _257;
    end
    assign _391 = _389 == _2230;
    assign _394 = _391 ? _389 : _393;
    assign _384 = _324[7:7];
    assign _385 = ~ _384;
    assign _383 = f_chg_now[7:7];
    assign _386 = _383 & _385;
    assign _396 = _386 ? _1423 : _394;
    assign _380 = f_changed_all[7:7];
    assign _381 = f_in_fetch & _380;
    assign _397 = _381 ? _396 : _1076;
    assign _754 = _750[23:16];
    assign _755 = _754[7:7];
    assign _757 = _755 ? _397 : _1076;
    assign _761 = _757 < _760;
    assign _762 = _761 ? _760 : _757;
    assign _771 = _762 < _770;
    assign _772 = _771 ? _770 : _762;
    assign _791 = _772 < _790;
    assign _792 = _791 ? _790 : _772;
    assign _793 = { _1119,
                    _792 };
    assign _3666 = _355 == _1423;
    assign _3667 = _3666 ? _262 : _302;
    assign _3664 = _288 == _1216;
    assign _3668 = _3664 ? _3667 : _302;
    assign _258 = _3668;
    always @(posedge _270) begin
        if (_268)
            _302 <= _292;
        else
            _302 <= _258;
    end
    assign _369 = _355 == _1423;
    assign _370 = f_in_fetch & _369;
    assign _371 = _370 ? _262 : _302;
    assign _3671 = _355 == _1396;
    assign _3672 = _3671 ? _262 : _299;
    assign _3669 = _288 == _1216;
    assign _3673 = _3669 ? _3672 : _299;
    assign _259 = _3673;
    always @(posedge _270) begin
        if (_268)
            _299 <= _292;
        else
            _299 <= _259;
    end
    assign _365 = _355 == _1396;
    assign _366 = f_in_fetch & _365;
    assign _367 = _366 ? _262 : _299;
    assign _3676 = _355 == _1611;
    assign _3677 = _3676 ? _262 : _296;
    assign _3674 = _288 == _1216;
    assign _3678 = _3674 ? _3677 : _296;
    assign _260 = _3678;
    always @(posedge _270) begin
        if (_268)
            _296 <= _292;
        else
            _296 <= _260;
    end
    assign _361 = _355 == _1611;
    assign _362 = f_in_fetch & _361;
    assign _363 = _362 ? _262 : _296;
    assign _262 = ram_rec_rdata;
    assign _357 = _355 == _1266;
    assign _358 = f_in_fetch & _357;
    assign _359 = _358 ? _262 : _293;
    assign _372 = { _359,
                    _363,
                    _367,
                    _371 };
    assign _750 = _372[287:176];
    assign _751 = _750[41:26];
    assign _752 = { gnd,
                    _751 };
    assign _794 = _752 + _793;
    always @(posedge _270) begin
        if (_268)
            _797 <= _1135;
        else
            _797 <= _794;
    end
    assign gnd = 1'b0;
    assign _749 = { gnd,
                    _746 };
    assign _798 = _749 < _797;
    assign _799 = ~ _798;
    assign _803 = _799 | _802;
    assign _812 = _803 & _811;
    assign _3706 = _345 + _3742;
    assign _3702 = _345 == _1065;
    assign _3703 = ~ _3702;
    assign _3704 = _3700 & _3703;
    assign _3707 = _3704 ? _3706 : _345;
    assign _3686 = _3685[2:2];
    assign _3687 = _1771 & _3686;
    assign _3709 = _3687 ? _1175 : _3707;
    assign _3711 = _280 ? _1175 : _3709;
    assign _263 = _3711;
    always @(posedge _270) begin
        if (_268)
            _345 <= _1175;
        else
            _345 <= _263;
    end
    assign _3723 = _342 + _3742;
    assign _3719 = _342 == _1065;
    assign _3720 = ~ _3719;
    assign _3698 = 9'b111111111;
    assign _3699 = _3691 == _3698;
    assign _3696 = 6'b111111;
    assign _3695 = _3691[5:0];
    assign _3697 = _3695 == _3696;
    assign _3690 = 9'b000000000;
    assign _3712 = 9'b000000001;
    assign _3713 = _3691 + _3712;
    assign _3715 = _280 ? _3690 : _3713;
    assign _264 = _3715;
    always @(posedge _270) begin
        if (_268)
            _3691 <= _3690;
        else
            _3691 <= _264;
    end
    assign _3692 = _3691[2:0];
    assign _3694 = _3692 == _2230;
    assign _3688 = _696[63:62];
    always @* begin
        case (_3688)
        0:
            _3700 <= vdd;
        1:
            _3700 <= _3694;
        2:
            _3700 <= _3697;
        default:
            _3700 <= _3699;
        endcase
    end
    assign _3721 = _3700 & _3720;
    assign _3724 = _3721 ? _3723 : _342;
    assign _3716 = _3685[1:1];
    assign _3717 = _1771 & _3716;
    assign _3726 = _3717 ? _1175 : _3724;
    assign _3728 = _280 ? _1175 : _3726;
    assign _265 = _3728;
    always @(posedge _270) begin
        if (_268)
            _342 <= _1175;
        else
            _342 <= _265;
    end
    assign _745 = _701[25:24];
    always @* begin
        case (_745)
        0:
            _746 <= _339;
        1:
            _746 <= _342;
        2:
            _746 <= _345;
        default:
            _746 <= _345;
        endcase
    end
    assign _748 = _746 == _1065;
    assign _816 = _748 ? _815 : _812;
    always @(posedge _270) begin
        if (_268)
            _327 <= _1225;
        else
            _327 <= _311;
    end
    assign f_chg_now = _311 ^ _327;
    assign _3730 = _288 == _1217;
    assign _3732 = _3730 ? _1225 : _324;
    assign _3729 = _288 == _1216;
    assign _3733 = _3729 ? f_changed_all : _3732;
    assign _3735 = _280 ? _1225 : _3733;
    assign _266 = _3735;
    always @(posedge _270) begin
        if (_268)
            _324 <= _1225;
        else
            _324 <= _266;
    end
    assign f_changed_all = _324 | f_chg_now;
    assign _739 = f_changed_all & f_chgmask1;
    assign _741 = _739 == _1225;
    assign _742 = ~ _741;
    assign f_chgmask1 = _701[23:16];
    assign _738 = f_chgmask1 == _1225;
    assign _743 = _738 | _742;
    assign _732 = _701[7:0];
    assign _730 = _701[15:8];
    assign vdd = 1'b1;
    assign _268 = clear;
    assign _270 = clock;
    assign _272 = pins_in;
    always @(posedge _270) begin
        if (_268)
            _308 <= _1225;
        else
            _308 <= _272;
    end
    always @(posedge _270) begin
        if (_268)
            _311 <= _1225;
        else
            _311 <= _308;
    end
    assign _731 = _311 ^ _730;
    assign _733 = _731 & _732;
    assign _735 = _733 == _1225;
    assign _701 = _303[287:176];
    assign f_valid1 = _701[111:111];
    assign _736 = f_valid1 & _735;
    assign _744 = _736 & _743;
    assign _817 = _744 & _816;
    assign _822 = _817 & _821;
    assign _861 = _822 & _860;
    assign _862 = f_in_eval & _861;
    assign _866 = _862 & _865;
    assign f_fire1 = _866 & _728;
    assign _1010 = f_fire1 ? _1216 : _1008;
    assign f_winner = f_fire0 ? _2347 : _1010;
    always @* begin
        case (f_winner)
        0:
            _3683 <= _3679;
        1:
            _3683 <= _3680;
        2:
            _3683 <= _3681;
        default:
            _3683 <= _3682;
        endcase
    end
    assign _3685 = _1770 ? _3684 : _3683;
    assign _3736 = _3685[0:0];
    assign _3737 = _1771 & _3736;
    assign _3746 = _3737 ? _1175 : _3744;
    assign _3748 = _280 ? _1175 : _3746;
    assign _273 = _3748;
    always @(posedge _270) begin
        if (_268)
            _339 <= _1175;
        else
            _339 <= _273;
    end
    assign _1822 = _696[33:32];
    always @* begin
        case (_1822)
        0:
            _1823 <= _339;
        1:
            _1823 <= _342;
        2:
            _1823 <= _345;
        default:
            _1823 <= _345;
        endcase
    end
    assign _1821 = _696[49:34];
    assign _1824 = _1821 < _1823;
    assign _696 = _303[63:0];
    assign _1819 = _696[31:31];
    assign _1817 = ~ _1192;
    assign _1818 = f_in_eval & _1817;
    assign _1820 = _1818 & _1819;
    assign _1825 = _1820 & _1824;
    assign _1830 = _1825 & _1829;
    assign _1838 = _1830 | f_unexp_now;
    assign f_viol_now = _1838 | f_amb_now;
    assign _3754 = f_viol_now ? _3753 : _355;
    assign _3757 = _1192 ? _3756 : _3754;
    assign _3750 = _288 == _1217;
    assign _3758 = _3750 ? _3757 : _355;
    assign _3749 = _288 == _1216;
    assign _3761 = _3749 ? _3760 : _3758;
    assign _3763 = _280 ? _1076 : _3761;
    assign _274 = _3763;
    always @(posedge _270) begin
        if (_268)
            _355 <= _1076;
        else
            _355 <= _274;
    end
    assign _3766 = _355 == _1266;
    assign _3767 = _3766 ? _262 : _293;
    assign _3764 = _288 == _1216;
    assign _3768 = _3764 ? _3767 : _293;
    assign _275 = _3768;
    always @(posedge _270) begin
        if (_268)
            _293 <= _292;
        else
            _293 <= _275;
    end
    assign _303 = { _293,
                    _296,
                    _299,
                    _302 };
    assign _304 = _303[175:64];
    assign f_valid0 = _304[111:111];
    assign _318 = f_valid0 & _317;
    assign _335 = _318 & _334;
    assign _584 = _335 & _583;
    assign _641 = _584 & _640;
    assign _685 = _641 & _684;
    assign f_in_eval = _288 == _1217;
    assign _686 = f_in_eval & _685;
    assign _695 = _686 & _694;
    assign f_fire0 = _695 & _728;
    assign _1096 = f_fire0 | f_fire1;
    assign _1097 = _1096 | f_fire2;
    assign _1192 = _1097 | f_fire3;
    assign _3787 = _1192 ? _3786 : _3784;
    assign _3772 = _288 == _1842;
    assign _3774 = _3772 ? _2347 : _288;
    assign _3770 = _288 == _1217;
    assign _3788 = _3770 ? _3787 : _3774;
    assign _3769 = _288 == _1216;
    assign _3791 = _3769 ? _3790 : _3788;
    assign _277 = host_stop;
    assign _3793 = _277 ? _2347 : _3791;
    assign _3795 = _280 ? _1216 : _3793;
    assign _278 = _3795;
    always @(posedge _270) begin
        if (_268)
            _288 <= _2347;
        else
            _288 <= _278;
    end
    assign f_in_fetch = _288 == _1216;
    assign _1770 = f_in_fetch & _1769;
    assign _1771 = _1770 | _1192;
    assign _2364 = _1771 & _2363;
    assign _3817 = _2364 ? _3816 : _2428;
    assign _280 = host_start;
    assign _3819 = _280 ? _1225 : _3817;
    assign _281 = _3819;
    always @(posedge _270) begin
        if (_268)
            _2428 <= _1225;
        else
            _2428 <= _281;
    end
    assign _2429 = _2428[7:7];
    assign _283 = host_pin_src;
    assign _2425 = _283[23:21];
    always @* begin
        case (_2425)
        0:
            _2436 <= _2429;
        1:
            _2436 <= _1389;
        2:
            _2436 <= _2430;
        3:
            _2436 <= _2431;
        4:
            _2436 <= _2433;
        5:
            _2436 <= _1547;
        6:
            _2436 <= _2434;
        default:
            _2436 <= _2435;
        endcase
    end
    assign _2500 = { _2436,
                     _2445,
                     _2454,
                     _2463,
                     _2472,
                     _2481,
                     _2490,
                     _2499 };
    assign _3821 = _2500 & _3820;
    assign pins_out = _3821;
    assign pins_oe = _2503;
    assign st_running = _2360;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1200;
    assign st_accepting = _2359;
    assign st_taken = _2357;
    assign st_taken_edge = _2354;
    assign st_viol = _2351;
    assign st_viol_kind = _2348;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _2343;
    assign st_tx_empty = _600;
    assign st_rx_data = _2341;
    assign st_rx_empty = _1854;
    assign st_vlog_data = _2234;
    assign st_vlog_empty = _1857;
    assign st_cov_rdata = _1863;
    assign st_irq = _1861;
    assign st_halted_viol = _1803;
    assign st_rx_overflow = _1796;
    assign st_vlog_overflow = _1653;
    assign st_cov_overrun = _1643;
    assign st_host_err = _1622;
    assign st_host_err_cause = _1627;
    assign st_lane_active = _1593;
    assign st_lane_status = _1590;
    assign ram_rec_addr = _1271;
    assign ram_rec_re = _1268;
    assign ram_rec_we = _1265;
    assign ram_rec_wdata = _17;
    assign ram_cov_addr = _1264;
    assign ram_cov_re = _1259;
    assign ram_cov_we = _1256;
    assign ram_cov_wdata = _1248;

endmodule
