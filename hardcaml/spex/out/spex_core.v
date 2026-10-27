module spex_core (
    host_cov_wdata,
    host_cov_addr,
    host_rec_wdata,
    host_rec_waddr,
    host_lane_we,
    host_cov_re,
    host_cov_we,
    host_err_clear,
    host_cover_en,
    host_irq_ack,
    ram_cov_rdata,
    host_vlog_pop,
    host_open_drain,
    host_crc_expect,
    host_crc_expect_we,
    host_rec_we,
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
    host_verify,
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
    st_image_valid,
    st_verify_busy,
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
    input host_err_clear;
    input host_cover_en;
    input host_irq_ack;
    input [31:0] ram_cov_rdata;
    input host_vlog_pop;
    input [7:0] host_open_drain;
    input [31:0] host_crc_expect;
    input host_crc_expect_we;
    input host_rec_we;
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
    input host_verify;
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
    output st_image_valid;
    output st_verify_busy;
    output [15:0] st_lane_status;
    output [7:0] ram_rec_addr;
    output ram_rec_re;
    output ram_rec_we;
    output [127:0] ram_rec_wdata;
    output [7:0] ram_cov_addr;
    output ram_cov_re;
    output ram_cov_we;
    output [31:0] ram_cov_wdata;

    wire [11:0] _1255;
    wire _1252;
    wire _1253;
    wire [11:0] _1254;
    wire _1256;
    wire [11:0] _1257;
    wire [11:0] _1258;
    wire [11:0] _1244;
    wire [11:0] _1101;
    wire [11:0] _1098;
    wire [12:0] _1095;
    wire [9:0] _1092;
    wire [12:0] _1093;
    wire [12:0] _1094;
    wire [2:0] _1088;
    reg [2:0] _1068;
    wire [2:0] _1;
    reg [2:0] _1089;
    wire [12:0] _1090;
    wire [12:0] _1075;
    wire [12:0] _1074;
    wire [15:0] _1069;
    wire _1073;
    wire [12:0] _1076;
    wire [12:0] _2;
    reg [12:0] _1085;
    wire _1091;
    wire [12:0] _1096;
    wire [12:0] _1082;
    wire _1097;
    wire [11:0] _1100;
    wire _1080;
    wire [15:0] _1077;
    wire _1078;
    wire _3;
    reg _1081;
    wire [11:0] _1102;
    wire [11:0] _4;
    reg [11:0] _1245;
    wire [11:0] _1105;
    reg [1:0] _1071;
    reg [15:0] _1072;
    wire [15:0] _1103;
    wire _1104;
    wire [11:0] _1107;
    wire [11:0] _5;
    reg [11:0] _1242;
    wire _1246;
    wire _1247;
    wire [11:0] _1248;
    wire [11:0] _1239;
    wire _1249;
    wire [11:0] _1250;
    wire [7:0] _1237;
    wire _1238;
    wire [11:0] _1251;
    wire [7:0] _1235;
    wire [7:0] _1234;
    wire [1:0] _1229;
    wire [1:0] _1228;
    wire _1217;
    wire _1209;
    wire _1218;
    wire _6;
    reg _1227;
    wire [1:0] _1230;
    wire [6:0] _1224;
    wire [8:0] _1231;
    wire [7:0] _1222;
    wire [8:0] _1223;
    wire [8:0] _1232;
    wire _1233;
    wire [7:0] _1236;
    wire [31:0] _1259;
    wire [31:0] _8;
    wire [31:0] _1260;
    wire _1273;
    wire _1271;
    wire _1266;
    wire _1264;
    wire _1263;
    wire _1265;
    wire _1267;
    wire f_host_cov_we;
    wire _1275;
    wire _1274;
    wire _1276;
    wire [7:0] _12;
    reg [7:0] _1280;
    wire [7:0] _14;
    wire [7:0] _1277;
    wire [7:0] _1281;
    wire [127:0] _17;
    wire _1288;
    wire [1:0] _1294;
    wire [7:0] _1295;
    wire [7:0] _1292;
    wire [7:0] _22;
    wire [7:0] _1293;
    wire [2:0] _1285;
    wire _1286;
    wire _1287;
    wire [7:0] _1296;
    wire [2:0] _1448;
    wire [2:0] _1449;
    wire [2:0] _1421;
    wire [2:0] _1423;
    wire [2:0] _1424;
    wire [2:0] _1450;
    wire [2:0] _1452;
    wire [2:0] _1454;
    wire [2:0] _24;
    reg [2:0] _1420;
    wire [7:0] _1614;
    wire [2:0] _1607;
    wire [2:0] _1581;
    wire [2:0] _1582;
    wire [2:0] _1608;
    wire [2:0] _1610;
    wire [2:0] _1612;
    wire [2:0] _25;
    reg [2:0] _1578;
    wire [7:0] _1613;
    wire [15:0] _1615;
    wire [1:0] _1621;
    wire [2:0] _1667;
    wire [2:0] _1669;
    wire [2:0] _30;
    reg [2:0] _1666;
    wire _1670;
    wire _1662;
    wire [2:0] _1652;
    wire [2:0] _1648;
    wire [2:0] _1649;
    wire [2:0] _1653;
    wire [2:0] _1646;
    wire [2:0] _1654;
    wire _1641;
    wire _1642;
    wire _1643;
    wire _1637;
    wire _1638;
    wire _1619;
    wire _1634;
    wire _1635;
    wire _1620;
    wire [1:0] _33;
    wire _1632;
    wire _1633;
    wire _1636;
    wire _1639;
    wire _34;
    reg _1221;
    wire _1628;
    wire _1627;
    wire _1629;
    wire _1625;
    wire _36;
    wire _38;
    wire _1624;
    wire _1626;
    wire _1630;
    wire _1622;
    wire _1623;
    wire _1631;
    wire _1640;
    wire _1644;
    wire [2:0] _1655;
    wire _1657;
    wire _1658;
    wire _1663;
    wire _1671;
    wire _40;
    wire _1673;
    wire _41;
    reg _1661;
    wire [7:0] _43;
    reg [7:0] _1216;
    wire [7:0] _1213;
    wire _1678;
    wire _1679;
    wire _1674;
    wire _1675;
    wire _44;
    reg _1208;
    wire _46;
    wire _1205;
    wire _1677;
    wire _1680;
    wire _1685;
    wire _1687;
    wire _47;
    reg _1683;
    wire _1690;
    wire _1695;
    wire _1697;
    wire _49;
    reg _1693;
    wire _1829;
    wire _1822;
    wire _1830;
    wire _1803;
    wire _1750;
    wire _1804;
    wire _1831;
    wire _51;
    wire _1832;
    wire _1833;
    wire _1838;
    wire _1840;
    wire _52;
    reg _1836;
    wire _1844;
    wire _1845;
    wire _1850;
    wire _56;
    wire _1852;
    wire _1854;
    wire _57;
    reg _1848;
    wire _1883;
    wire _1885;
    wire _1881;
    wire _1887;
    wire _1888;
    wire _1889;
    wire _1856;
    wire _1890;
    wire _1892;
    wire _58;
    reg _1843;
    wire _1898;
    wire _1895;
    wire _1899;
    wire _1900;
    wire _1901;
    wire [31:0] _61;
    wire [31:0] _1904;
    wire _1902;
    wire _1903;
    wire [31:0] _1905;
    wire [2:0] _2272;
    wire _2273;
    wire _2274;
    wire [47:0] _2271;
    reg [47:0] _2275;
    wire [2:0] _2266;
    wire _2267;
    wire _2268;
    reg [47:0] _2269;
    wire _2261;
    wire _2262;
    reg [47:0] _2263;
    wire _2255;
    wire _2256;
    reg [47:0] _2257;
    wire _2249;
    wire _2250;
    reg [47:0] _2251;
    wire _2243;
    wire _2244;
    reg [47:0] _2245;
    wire _2237;
    wire _2238;
    reg [47:0] _2239;
    wire [2:0] _1912;
    wire [2:0] _1913;
    wire [2:0] _64;
    reg [2:0] _1910;
    wire _2231;
    wire _2232;
    wire [2:0] _2204;
    wire [28:0] _1921;
    wire [28:0] _1920;
    wire [28:0] _1923;
    wire [28:0] _1924;
    wire [2:0] _1917;
    wire _1919;
    wire [28:0] _1925;
    wire [28:0] _65;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2202;
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
    wire [2:0] _66;
    reg [2:0] _1930;
    wire _2193;
    wire [2:0] _2195;
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
    wire [2:0] _67;
    reg [2:0] _1951;
    wire _2190;
    wire [2:0] _2192;
    wire [2:0] _2196;
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
    wire [2:0] _68;
    reg [2:0] _1972;
    wire _2186;
    wire [2:0] _2188;
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
    wire [2:0] _69;
    reg [2:0] _1993;
    wire _2183;
    wire [2:0] _2185;
    wire [2:0] _2189;
    wire [2:0] _2197;
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
    wire [2:0] _70;
    reg [2:0] _2014;
    wire _2178;
    wire [2:0] _2180;
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
    wire [2:0] _71;
    reg [2:0] _2035;
    wire _2175;
    wire [2:0] _2177;
    wire [2:0] _2181;
    wire [2:0] _2069;
    wire _2065;
    wire _2066;
    wire _2063;
    wire _2067;
    wire [2:0] _2070;
    wire _2060;
    wire _2061;
    wire _2058;
    wire _2057;
    wire _2059;
    wire _2062;
    wire [2:0] _2072;
    wire _2053;
    wire [2:0] _2073;
    wire [2:0] _72;
    reg [2:0] _2056;
    wire _2171;
    wire [2:0] _2173;
    wire [2:0] _2090;
    wire _2086;
    wire _2087;
    wire _2084;
    wire _2088;
    wire [2:0] _2091;
    wire _2081;
    wire _2082;
    wire _2079;
    wire _2078;
    wire _2080;
    wire _2083;
    wire [2:0] _2093;
    wire _2074;
    wire [2:0] _2094;
    wire [2:0] _73;
    reg [2:0] _2077;
    wire _2168;
    wire [2:0] _2170;
    wire [2:0] _2174;
    wire [2:0] _2182;
    wire [2:0] _2198;
    wire _2163;
    wire _2162;
    wire _2164;
    wire _2160;
    wire _2159;
    wire _2161;
    wire _2165;
    wire _2156;
    wire _2155;
    wire _2157;
    wire _2153;
    wire _2152;
    wire _2154;
    wire _2158;
    wire _2166;
    wire [2:0] _2199;
    wire _2141;
    wire _2140;
    wire _2142;
    wire [2:0] _2144;
    wire _2136;
    wire _2135;
    wire _2137;
    wire [2:0] _2139;
    wire _2145;
    wire [2:0] _2146;
    wire _2129;
    wire _2128;
    wire _2130;
    wire [2:0] _2132;
    wire _2124;
    wire _2123;
    wire _2125;
    wire [2:0] _2127;
    wire _2133;
    wire [2:0] _2134;
    wire _2147;
    wire [2:0] _2148;
    wire _2115;
    wire _2114;
    wire _2116;
    wire [2:0] _2118;
    wire _2110;
    wire _2109;
    wire _2111;
    wire [2:0] _2113;
    wire _2119;
    wire [2:0] _2120;
    wire _2103;
    wire _2102;
    wire _2104;
    wire [2:0] _2106;
    wire _2098;
    wire _2097;
    wire _2099;
    wire [2:0] _2101;
    wire _2107;
    wire [2:0] _2108;
    wire _2121;
    wire [2:0] _2122;
    wire _2149;
    wire [2:0] _2150;
    wire [2:0] _2151;
    wire [2:0] _2200;
    wire [2:0] _2095;
    wire _2201;
    wire [28:0] _2203;
    wire [31:0] _2205;
    wire [47:0] _2209;
    wire [47:0] _74;
    reg [47:0] _2233;
    wire [2:0] _2226;
    wire [3:0] _1896;
    wire [3:0] _2215;
    wire [3:0] _2216;
    wire [3:0] _2214;
    wire [3:0] _2217;
    wire [3:0] _1688;
    wire _1689;
    wire _1906;
    wire _75;
    wire _1907;
    wire _2212;
    wire [3:0] _2218;
    reg [3:0] _2221;
    wire [3:0] _76;
    wire _1897;
    wire _2210;
    wire _78;
    wire _2211;
    wire [2:0] _2227;
    wire [2:0] _79;
    reg [2:0] _2224;
    reg [47:0] _2276;
    wire _2380;
    wire _2381;
    reg [7:0] _2382;
    wire _2374;
    wire _2375;
    reg [7:0] _2376;
    wire _2368;
    wire _2369;
    reg [7:0] _2370;
    wire _2362;
    wire _2363;
    reg [7:0] _2364;
    wire _2356;
    wire _2357;
    reg [7:0] _2358;
    wire _2350;
    wire _2351;
    reg [7:0] _2352;
    wire _2344;
    wire _2345;
    reg [7:0] _2346;
    wire [2:0] _2283;
    wire [2:0] _2284;
    wire [2:0] _82;
    reg [2:0] _2281;
    wire _2338;
    wire _2339;
    wire [7:0] _2324;
    wire [7:0] _2325;
    wire [7:0] _2302;
    wire [7:0] _2300;
    wire [7:0] _2303;
    wire [7:0] _83;
    reg [7:0] _2289;
    wire [7:0] _2298;
    wire [7:0] _2299;
    wire [7:0] _2314;
    wire [7:0] _2311;
    wire [7:0] _2309;
    wire [7:0] _2312;
    wire [7:0] _84;
    reg [7:0] _2308;
    wire [7:0] _2313;
    wire [7:0] _2315;
    wire [7:0] _2326;
    wire [7:0] _85;
    reg [7:0] _2340;
    wire [2:0] _2333;
    wire [2:0] _2334;
    wire [2:0] _86;
    reg [2:0] _2331;
    reg [7:0] _2383;
    wire [31:0] _2386;
    wire [31:0] _2387;
    wire [31:0] _90;
    reg [31:0] ts_reg;
    wire [1:0] _2389;
    wire [1:0] _2206;
    wire [1:0] _2208;
    reg [1:0] _2390;
    reg _2393;
    reg [1:0] _2396;
    reg _2399;
    wire _2400;
    wire _2401;
    wire _2402;
    wire [7:0] _2543;
    wire [7:0] _2544;
    wire [7:0] _2424;
    wire [7:0] _2422;
    wire [7:0] _2421;
    wire [7:0] _2420;
    wire [7:0] _2419;
    reg [7:0] _2423;
    wire [7:0] _2425;
    wire [7:0] _2426;
    wire [7:0] _2417;
    wire [7:0] _2418;
    wire [7:0] _2427;
    wire [7:0] _2461;
    wire [7:0] _2462;
    wire [7:0] _2464;
    wire [7:0] _2466;
    wire [7:0] _100;
    reg [7:0] _2409;
    wire [7:0] _2545;
    wire [7:0] _103;
    wire [7:0] _4007;
    wire _2540;
    wire _2539;
    wire _2537;
    wire _2538;
    wire _2536;
    wire _2535;
    wire _2534;
    wire [2:0] _2533;
    reg _2541;
    wire _2531;
    wire _2530;
    wire _2528;
    wire _2529;
    wire _2527;
    wire _2526;
    wire _2525;
    wire [2:0] _2524;
    reg _2532;
    wire _2522;
    wire _2521;
    wire _2519;
    wire _2520;
    wire _2518;
    wire _2517;
    wire _2516;
    wire [2:0] _2515;
    reg _2523;
    wire _2513;
    wire _2512;
    wire _2510;
    wire _2511;
    wire _2509;
    wire _2508;
    wire _2507;
    wire [2:0] _2506;
    reg _2514;
    wire _2504;
    wire _2503;
    wire _2501;
    wire _2502;
    wire _2500;
    wire _2499;
    wire _2498;
    wire [2:0] _2497;
    reg _2505;
    wire _2495;
    wire _2494;
    wire _2492;
    wire _2493;
    wire _2491;
    wire _2490;
    wire _2489;
    wire [2:0] _2488;
    reg _2496;
    wire _2486;
    wire _2485;
    wire _2483;
    wire _2484;
    wire _2482;
    wire _2481;
    wire _2480;
    wire [2:0] _2479;
    reg _2487;
    wire _2477;
    wire _2476;
    wire _2474;
    wire _2475;
    wire _2473;
    wire _2472;
    wire [2:0] _3999;
    wire _3996;
    wire [1:0] _3997;
    wire [3:0] _3998;
    wire [6:0] _4000;
    wire [7:0] _4001;
    wire [7:0] _4002;
    wire _2458;
    wire _2457;
    wire _2456;
    wire _2454;
    wire _2455;
    wire _2452;
    wire _2453;
    wire _2449;
    wire _2450;
    wire _2451;
    wire _2446;
    wire _2447;
    wire _2448;
    wire _2443;
    wire _2442;
    wire _2444;
    wire _2441;
    wire _2445;
    wire [7:0] _2459;
    wire _2428;
    wire _2434;
    wire [7:0] _2460;
    wire [7:0] _3994;
    wire [7:0] _3990;
    wire [7:0] _3988;
    wire [7:0] _3987;
    wire [7:0] _3986;
    wire [7:0] _3985;
    reg [7:0] _3989;
    wire [7:0] _3991;
    wire [7:0] _3992;
    wire [7:0] _2415;
    wire [7:0] _2413;
    wire [7:0] _2412;
    wire [7:0] _2411;
    wire [7:0] _2410;
    reg [7:0] _2414;
    wire [7:0] _2416;
    wire [7:0] _3983;
    wire [7:0] _3984;
    wire [7:0] _3993;
    wire [7:0] _3995;
    wire [7:0] _4003;
    wire _2404;
    wire _2405;
    wire _2406;
    wire [7:0] _4004;
    wire [31:0] _105;
    wire [31:0] _3976;
    wire [31:0] _2657;
    wire [30:0] _2655;
    wire [31:0] _2656;
    wire [31:0] _2658;
    wire [30:0] _2652;
    wire [31:0] _2653;
    wire [30:0] _2645;
    wire [31:0] _2646;
    wire [31:0] _2648;
    wire [30:0] _2642;
    wire [31:0] _2643;
    wire [30:0] _2635;
    wire [31:0] _2636;
    wire [31:0] _2638;
    wire [30:0] _2632;
    wire [31:0] _2633;
    wire [30:0] _2625;
    wire [31:0] _2626;
    wire [31:0] _2628;
    wire [30:0] _2622;
    wire [31:0] _2623;
    wire [30:0] _2615;
    wire [31:0] _2616;
    wire [31:0] _2618;
    wire [30:0] _2612;
    wire [31:0] _2613;
    wire [30:0] _2605;
    wire [31:0] _2606;
    wire [31:0] _2608;
    wire [30:0] _2602;
    wire [31:0] _2603;
    wire [30:0] _2595;
    wire [31:0] _2596;
    wire [31:0] _2598;
    wire [30:0] _2592;
    wire [31:0] _2593;
    wire [30:0] _2585;
    wire [31:0] _2586;
    wire [31:0] _2588;
    wire [30:0] _2582;
    wire [31:0] _2583;
    wire [7:0] _2576;
    wire [7:0] _2575;
    wire [7:0] _2574;
    wire [7:0] _2573;
    wire [7:0] _2572;
    wire [7:0] _2571;
    wire [7:0] _2570;
    wire [7:0] _2569;
    wire [7:0] _2568;
    wire [7:0] _2567;
    wire [7:0] _2566;
    wire [7:0] _2565;
    wire [7:0] _2564;
    wire [7:0] _2563;
    wire [7:0] _2562;
    wire [7:0] _2561;
    wire [12:0] _2558;
    wire [12:0] _2559;
    wire [3:0] _2560;
    reg [7:0] _2577;
    wire [23:0] _2557;
    wire [31:0] _2578;
    wire _2555;
    wire _2556;
    wire [31:0] _2660;
    wire [31:0] _2553;
    wire [31:0] _2661;
    wire [31:0] _106;
    reg [31:0] _2551;
    wire [31:0] _2579;
    wire _2580;
    wire [31:0] _2589;
    wire _2590;
    wire [31:0] _2599;
    wire _2600;
    wire [31:0] _2609;
    wire _2610;
    wire [31:0] _2619;
    wire _2620;
    wire [31:0] _2629;
    wire _2630;
    wire [31:0] _2639;
    wire _2640;
    wire [31:0] _2649;
    wire _2650;
    wire [31:0] _2659;
    wire [31:0] _3977;
    wire f_sw_match;
    wire _3979;
    wire _3981;
    wire _1283;
    wire _1282;
    wire f_store_we;
    wire _3971;
    wire _3973;
    wire _3975;
    wire [12:0] _3964;
    wire [12:0] _2665;
    wire [12:0] _2663;
    wire [12:0] _2666;
    wire [12:0] _107;
    reg [12:0] _1291;
    wire f_sw_last;
    wire _3967;
    wire _109;
    wire _111;
    wire _3961;
    wire _3962;
    wire _3963;
    wire _3969;
    wire _2547;
    wire [1:0] _3953;
    wire [1:0] _3949;
    wire [1:0] _1882;
    wire _3940;
    wire [1:0] _3942;
    wire _3939;
    wire [1:0] _3944;
    wire _3938;
    wire [1:0] _3946;
    wire [1:0] _3947;
    wire [7:0] _1199;
    wire _1201;
    wire _1192;
    wire [15:0] _1187;
    wire _1188;
    wire _1189;
    wire _1186;
    wire _1190;
    wire _1193;
    wire [3:0] _1183;
    wire _1185;
    wire _1194;
    wire _1181;
    wire _1177;
    wire _1178;
    wire _1175;
    wire _1179;
    wire _1182;
    wire _1173;
    reg [2:0] _1067;
    wire [15:0] _1168;
    wire _1169;
    wire _1166;
    wire _1170;
    wire _1164;
    wire _1171;
    wire _1174;
    wire [1:0] _1163;
    reg _1195;
    wire _1162;
    wire _1196;
    wire _1159;
    wire [3:0] _1157;
    reg _1158;
    wire _1160;
    wire [15:0] _1152;
    wire _1154;
    wire [16:0] _1147;
    wire [15:0] _1143;
    wire [16:0] _1144;
    wire [16:0] _1145;
    reg [16:0] _1148;
    wire _1149;
    wire _1150;
    wire [15:0] _1139;
    wire _1141;
    wire _1056;
    wire [2:0] _1058;
    wire _1053;
    wire [2:0] _1055;
    wire _1059;
    wire [2:0] _1060;
    wire _1048;
    wire [2:0] _1050;
    wire _1045;
    wire [2:0] _1047;
    wire _1051;
    wire [2:0] _1052;
    wire _1061;
    wire [2:0] _1062;
    wire _1038;
    wire [2:0] _1040;
    wire _1035;
    wire [2:0] _1037;
    wire _1041;
    wire [2:0] _1042;
    wire _1030;
    wire [2:0] _1032;
    wire [7:0] _1026;
    wire _1027;
    wire [2:0] _1029;
    wire _1033;
    wire [2:0] _1034;
    wire _1043;
    wire [2:0] _1044;
    wire _1063;
    wire [2:0] _1064;
    wire [13:0] _1131;
    wire [16:0] _1132;
    wire [111:0] _1025;
    wire [15:0] _1129;
    wire [16:0] _1130;
    wire [16:0] _1133;
    reg [16:0] _1136;
    wire [16:0] _1128;
    wire _1137;
    wire _1138;
    wire _1142;
    wire _1151;
    wire [1:0] _1070;
    reg [15:0] _1125;
    wire _1127;
    wire _1155;
    wire [7:0] _1119;
    wire _1121;
    wire _1122;
    wire _1118;
    wire _1123;
    wire [7:0] _1112;
    wire [7:0] _1110;
    wire [7:0] _1111;
    wire [7:0] _1113;
    wire _1115;
    wire _1116;
    wire _1124;
    wire _1156;
    wire _1161;
    wire _1197;
    wire _1198;
    wire _1202;
    wire f_fire3;
    wire [7:0] _704;
    wire _706;
    wire _692;
    wire _688;
    wire _689;
    wire _686;
    wire _690;
    wire _693;
    wire [3:0] _683;
    wire _685;
    wire _694;
    wire _681;
    wire _677;
    wire _678;
    wire _675;
    wire _679;
    wire _682;
    wire _673;
    reg [2:0] _667;
    wire [15:0] _668;
    wire _669;
    wire _663;
    wire _670;
    wire _661;
    wire _671;
    wire _674;
    wire [1:0] _660;
    reg _695;
    wire _659;
    wire _696;
    wire _651;
    wire [3:0] _597;
    reg _650;
    wire _652;
    wire [15:0] _592;
    wire _594;
    wire [15:0] _583;
    wire [16:0] _584;
    wire [16:0] _585;
    reg [16:0] _588;
    wire _589;
    wire _590;
    wire [15:0] _579;
    wire _581;
    wire _545;
    wire [2:0] _565;
    wire _524;
    wire [2:0] _544;
    wire _566;
    wire [2:0] _567;
    wire _501;
    wire [2:0] _521;
    wire _480;
    wire [2:0] _500;
    wire _522;
    wire [2:0] _523;
    wire _568;
    wire [2:0] _569;
    wire _455;
    wire [2:0] _475;
    wire _434;
    wire [2:0] _454;
    wire _476;
    wire [2:0] _477;
    wire _411;
    wire [2:0] _431;
    wire [7:0] _389;
    wire _390;
    wire [2:0] _410;
    wire _432;
    wire [2:0] _433;
    wire _478;
    wire [2:0] _479;
    wire _570;
    wire [2:0] _571;
    wire [16:0] _572;
    wire [111:0] _385;
    wire [15:0] _386;
    wire [16:0] _387;
    wire [16:0] _573;
    reg [16:0] _576;
    wire [16:0] _362;
    wire _577;
    wire _578;
    wire _582;
    wire _591;
    wire [1:0] _348;
    reg [15:0] _358;
    wire _360;
    wire _595;
    wire [7:0] _342;
    wire _344;
    wire _345;
    wire _333;
    wire _346;
    wire [7:0] _326;
    wire [7:0] _324;
    wire [7:0] _325;
    wire [7:0] _327;
    wire _329;
    wire [127:0] _304;
    wire [2:0] _3923;
    wire [5:0] _1211;
    wire [5:0] _113;
    wire [5:0] _2683;
    wire [5:0] _115;
    wire [5:0] _2670;
    wire [5:0] _116;
    reg [5:0] _2669;
    wire _2673;
    wire [5:0] _2674;
    wire [5:0] _2675;
    wire [5:0] _2684;
    wire _2671;
    wire [5:0] _2685;
    wire [5:0] _2686;
    wire [5:0] _117;
    reg [5:0] _1212;
    wire [5:0] _2679;
    wire [5:0] _2678;
    wire [5:0] _2677;
    wire [5:0] _2676;
    reg [5:0] _2680;
    wire _2681;
    wire _2682;
    wire [2:0] _3919;
    wire _3914;
    wire [2:0] _3916;
    wire [7:0] _1873;
    wire _1875;
    wire _1876;
    wire _1871;
    wire _1872;
    wire f_unexp_now;
    wire _2690;
    wire _2691;
    wire _2693;
    wire _2694;
    wire _2689;
    wire _2687;
    wire _2695;
    wire _118;
    reg _1868;
    wire _1869;
    wire [15:0] _3905;
    wire [15:0] _3906;
    wire _3902;
    wire _3903;
    wire _3904;
    wire [15:0] _3907;
    wire [2:0] _3847;
    wire [2:0] _3845;
    wire [2:0] _3844;
    wire [2:0] _3843;
    wire [2:0] _3842;
    wire [7:0] _1013;
    wire _1015;
    wire _1006;
    wire _1002;
    wire _1003;
    wire _1000;
    wire _1004;
    wire _1007;
    wire [3:0] _997;
    wire _999;
    wire _1008;
    wire _995;
    wire _991;
    wire _992;
    wire _989;
    wire _993;
    wire _996;
    wire _987;
    reg [2:0] _981;
    wire [15:0] _982;
    wire _983;
    wire _977;
    wire _984;
    wire _975;
    wire _985;
    wire _988;
    wire [1:0] _974;
    reg _1009;
    wire _973;
    wire _1010;
    wire _970;
    wire [3:0] _968;
    reg _969;
    wire _971;
    wire [15:0] _963;
    wire _965;
    wire [15:0] _954;
    wire [16:0] _955;
    wire [16:0] _956;
    reg [16:0] _959;
    wire _960;
    wire _961;
    wire [15:0] _950;
    wire _952;
    wire _934;
    wire [2:0] _936;
    wire _931;
    wire [2:0] _933;
    wire _937;
    wire [2:0] _938;
    wire _926;
    wire [2:0] _928;
    wire _923;
    wire [2:0] _925;
    wire _929;
    wire [2:0] _930;
    wire _939;
    wire [2:0] _940;
    wire _916;
    wire [2:0] _918;
    wire _913;
    wire [2:0] _915;
    wire _919;
    wire [2:0] _920;
    wire _908;
    wire [2:0] _910;
    wire [7:0] _904;
    wire _905;
    wire [2:0] _907;
    wire _911;
    wire [2:0] _912;
    wire _921;
    wire [2:0] _922;
    wire _941;
    wire [2:0] _942;
    wire [16:0] _943;
    wire [111:0] _900;
    wire [15:0] _901;
    wire [16:0] _902;
    wire [16:0] _944;
    reg [16:0] _947;
    wire [16:0] _899;
    wire _948;
    wire _949;
    wire _953;
    wire _962;
    wire [1:0] _895;
    reg [15:0] _896;
    wire _898;
    wire _966;
    wire [7:0] _889;
    wire _891;
    wire _892;
    wire _888;
    wire _893;
    wire [7:0] _882;
    wire [7:0] _880;
    wire [7:0] _881;
    wire [7:0] _883;
    wire _885;
    wire _886;
    wire _894;
    wire _967;
    wire _972;
    wire _1011;
    wire _1012;
    wire _1016;
    wire f_fire2;
    wire [1:0] _1020;
    wire [1:0] f_policy;
    wire _739;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _729;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _723;
    wire [7:0] _717;
    wire [7:0] f_chgmask0;
    wire [7:0] _711;
    wire [7:0] f_watch;
    wire [7:0] _712;
    wire [7:0] _718;
    wire [7:0] _724;
    wire [7:0] f_relevant;
    wire [7:0] _731;
    wire _733;
    wire _734;
    wire f_amb_now;
    wire _736;
    wire _740;
    wire [7:0] _702;
    wire [7:0] _2700;
    wire [7:0] _2701;
    wire _2697;
    wire [7:0] _2699;
    wire _2696;
    wire [7:0] _2702;
    wire [7:0] _2704;
    wire [7:0] _119;
    reg [7:0] _701;
    wire [7:0] f_multi_eff;
    wire [7:0] _875;
    wire _877;
    wire _868;
    wire _864;
    wire _865;
    wire _862;
    wire _866;
    wire _869;
    wire [3:0] _859;
    wire _861;
    wire _870;
    wire _857;
    wire _853;
    wire _854;
    wire _851;
    wire _855;
    wire _858;
    wire _849;
    reg [2:0] _843;
    wire [15:0] _844;
    wire _845;
    wire _839;
    wire _846;
    wire _837;
    wire _847;
    wire _850;
    wire [1:0] _836;
    reg _871;
    wire [1:0] _121;
    wire [1:0] _2705;
    wire [1:0] _122;
    reg [1:0] _656;
    wire _658;
    wire _835;
    wire _872;
    wire _832;
    wire _2709;
    wire _2707;
    wire _2710;
    wire _2712;
    wire _2714;
    wire _123;
    reg _649;
    wire [15:0] _125;
    wire [15:0] _127;
    wire [15:0] _2720;
    wire [15:0] _2721;
    wire [15:0] _2722;
    wire [15:0] _2724;
    wire [15:0] _128;
    reg [15:0] _2717;
    wire [14:0] _2718;
    wire [15:0] _2719;
    wire [15:0] _2725;
    wire [15:0] _2726;
    wire _2728;
    wire _2730;
    wire _2731;
    wire _2732;
    wire _2733;
    wire _2735;
    wire _2737;
    wire _129;
    reg _646;
    wire _2750;
    wire _2751;
    wire _2753;
    wire _2754;
    wire _2755;
    wire _2756;
    wire _2758;
    wire _130;
    reg _2740;
    wire _2752;
    wire _2761;
    wire [5:0] _2759;
    wire _2760;
    wire _2762;
    wire _2763;
    wire _2764;
    wire _2765;
    wire _2766;
    wire _2768;
    wire _2770;
    wire _131;
    reg _643;
    wire _2774;
    wire _2772;
    wire _2775;
    wire _2777;
    wire _2779;
    wire _132;
    reg _635;
    wire [15:0] _134;
    wire [15:0] _136;
    wire [15:0] _2785;
    wire [15:0] _2786;
    wire [15:0] _2787;
    wire [15:0] _2789;
    wire [15:0] _137;
    reg [15:0] _2782;
    wire [14:0] _2783;
    wire [15:0] _2784;
    wire [15:0] _2790;
    wire [15:0] _2791;
    wire _2793;
    wire _2795;
    wire _2796;
    wire _2797;
    wire _2798;
    wire _2800;
    wire _2802;
    wire _138;
    reg _632;
    wire _2815;
    wire _2816;
    wire _2818;
    wire _2819;
    wire _2820;
    wire _2821;
    wire _2823;
    wire _139;
    reg _2805;
    wire _2817;
    wire _2826;
    wire _2825;
    wire _2827;
    wire _2828;
    wire _2829;
    wire _2830;
    wire _2831;
    wire _2833;
    wire _2835;
    wire _140;
    reg _629;
    wire [7:0] _142;
    wire [6:0] _620;
    wire [6:0] _619;
    wire _621;
    wire [15:0] _616;
    wire _2840;
    wire _2839;
    wire _2841;
    wire _2838;
    wire _2842;
    wire _2837;
    wire _2843;
    wire [14:0] _2836;
    wire [15:0] _2844;
    wire [15:0] _143;
    reg [15:0] _617;
    wire _618;
    wire [3:0] _2863;
    wire [3:0] _2861;
    wire [3:0] _2864;
    wire _1894;
    wire _2327;
    wire _145;
    wire _2328;
    wire _2277;
    wire _2310;
    wire _2848;
    wire _2304;
    wire _2305;
    wire _2846;
    wire _1820;
    wire _1821;
    wire _1827;
    wire _1824;
    wire _1825;
    wire _1823;
    wire _1826;
    wire _1828;
    wire _2849;
    wire _146;
    reg _1807;
    wire _2857;
    wire _2301;
    wire _2853;
    wire _2285;
    wire _2286;
    wire _2851;
    wire _1747;
    wire [2:0] _1741;
    wire _1736;
    wire _1735;
    wire _1737;
    wire _1738;
    wire _1739;
    wire [2:0] _1742;
    wire _1744;
    wire _1745;
    wire _1716;
    wire _1746;
    wire _1748;
    wire _1712;
    wire _1713;
    wire _1749;
    wire _1801;
    wire _1800;
    wire _1802;
    wire _2854;
    wire _147;
    reg _1700;
    wire _2855;
    wire _1797;
    wire [2:0] _1791;
    wire _1786;
    wire _1785;
    wire _1787;
    wire _1788;
    wire _1789;
    wire [2:0] _1792;
    wire _1794;
    wire _1795;
    wire _1766;
    wire _1796;
    wire _1798;
    wire _1762;
    wire _1763;
    wire _1799;
    wire _2856;
    wire _2858;
    wire _148;
    wire _2278;
    wire _2859;
    wire [3:0] _2865;
    reg [3:0] _2868;
    wire [3:0] _149;
    wire _614;
    wire [6:0] _2885;
    wire [7:0] _2886;
    wire [6:0] _2883;
    wire _2881;
    wire _2880;
    wire _2879;
    wire _2878;
    wire _2877;
    wire _2876;
    wire _2875;
    wire _2874;
    wire [2:0] _2872;
    wire [2:0] _2871;
    wire [2:0] _2870;
    wire [2:0] _2869;
    reg [2:0] _2873;
    reg _2882;
    wire [7:0] _2884;
    wire [1:0] _1815;
    wire [1:0] _1814;
    wire [1:0] _1813;
    wire [1:0] _1812;
    reg [1:0] _1816;
    wire [1:0] _1818;
    reg [7:0] _2887;
    wire [7:0] _2888;
    wire [7:0] _150;
    reg [7:0] _609;
    wire _610;
    wire [6:0] _3658;
    wire [7:0] _3659;
    wire _3656;
    wire _3655;
    wire _3654;
    wire _3653;
    wire _3652;
    wire _3651;
    wire _3650;
    wire _3649;
    wire [7:0] _3657;
    wire [3:0] _3641;
    wire [3:0] _3639;
    wire [3:0] _3642;
    wire _3312;
    wire _3633;
    wire _1717;
    wire _3267;
    wire _3268;
    wire [1:0] _3271;
    wire _3260;
    wire _3261;
    wire _3262;
    wire _3263;
    wire [1:0] _3265;
    wire [2:0] _3246;
    wire [2:0] _3243;
    wire _3239;
    wire _3237;
    wire _3238;
    wire _3240;
    wire [2:0] _3244;
    wire _3235;
    wire [2:0] _3247;
    wire _3248;
    wire [2:0] _3229;
    wire _3225;
    wire _3223;
    wire _3224;
    wire _3226;
    wire [2:0] _3230;
    wire _3221;
    wire [2:0] _3232;
    wire _3233;
    wire _3249;
    wire _3250;
    wire _3251;
    wire _3217;
    wire _3215;
    wire _3218;
    wire [15:0] _3210;
    wire _3211;
    wire _3208;
    wire _3212;
    wire _3206;
    wire _3207;
    wire _3213;
    wire _3219;
    wire _3252;
    wire [1:0] _3254;
    wire [1:0] _3256;
    wire [1:0] _3202;
    wire _3198;
    wire [1:0] _3200;
    wire [1:0] _3203;
    wire _2978;
    wire _2979;
    wire _151;
    reg _2891;
    wire _3128;
    wire _3126;
    wire _3127;
    reg _3129;
    wire [2:0] _153;
    wire [2:0] _3110;
    wire [2:0] _3111;
    wire [2:0] _3106;
    wire _3102;
    wire _3100;
    wire _3101;
    wire _3103;
    wire [2:0] _3107;
    wire _3098;
    wire [2:0] _3112;
    wire [2:0] _3113;
    wire [2:0] _3092;
    wire [2:0] _3093;
    wire [2:0] _3088;
    wire _2974;
    wire _2973;
    wire _2972;
    wire _2971;
    wire _2970;
    wire _2969;
    wire _2968;
    wire _2964;
    wire _2963;
    wire _2962;
    wire _2961;
    wire _2960;
    wire _2959;
    wire _2958;
    wire [7:0] _2955;
    wire [6:0] _2295;
    wire [7:0] _2296;
    wire [6:0] _2293;
    wire [7:0] _2294;
    wire [7:0] _2297;
    wire [7:0] _2984;
    wire [7:0] _2985;
    wire [7:0] _2986;
    wire [7:0] _2980;
    wire [7:0] _2981;
    wire [7:0] _2982;
    wire [7:0] _2983;
    wire [7:0] _2987;
    wire [7:0] _154;
    reg [7:0] _2292;
    wire _2895;
    wire _2892;
    wire _2893;
    wire _2896;
    wire [7:0] _2956;
    wire _2957;
    wire [7:0] _2965;
    wire _156;
    wire [7:0] _2966;
    wire _2967;
    wire [2:0] _2995;
    wire [2:0] _2996;
    wire [2:0] _2997;
    wire [2:0] _2998;
    wire [2:0] _2989;
    wire [2:0] _2990;
    wire [2:0] _2991;
    wire [2:0] _2992;
    wire [2:0] _2993;
    wire [2:0] _2999;
    wire [2:0] _3001;
    wire [2:0] _157;
    reg [2:0] _1710;
    reg _2975;
    wire _159;
    wire [31:0] _161;
    wire [30:0] _3043;
    wire [31:0] _3045;
    wire _3037;
    wire _3038;
    wire [31:0] _3040;
    wire [30:0] _3034;
    wire [31:0] _3036;
    wire [31:0] _3041;
    wire [31:0] _3042;
    wire [5:0] _163;
    wire [5:0] _3011;
    wire [5:0] _3012;
    wire [5:0] _3013;
    wire [5:0] _3014;
    wire [5:0] _3005;
    wire [5:0] _3006;
    wire [5:0] _3007;
    wire [5:0] _3008;
    wire [5:0] _3009;
    wire [5:0] _3015;
    wire [5:0] _3016;
    wire [5:0] _3018;
    wire [5:0] _164;
    reg [5:0] _1730;
    wire _1732;
    wire _1733;
    wire _2742;
    wire _2741;
    wire _2743;
    wire _2744;
    wire [31:0] _3046;
    wire [31:0] _3047;
    wire [31:0] _3048;
    wire [31:0] _166;
    wire _3025;
    wire _3026;
    wire [31:0] _3028;
    wire [30:0] _3022;
    wire [31:0] _3024;
    wire [31:0] _3029;
    wire [30:0] _3019;
    wire [31:0] _3021;
    wire [31:0] _3030;
    wire [31:0] _3031;
    wire [31:0] _3032;
    wire [31:0] _3033;
    wire [31:0] _3049;
    wire [31:0] _3050;
    wire [31:0] _3052;
    wire [31:0] _167;
    reg [31:0] _2747;
    wire _2748;
    wire _2749;
    wire [15:0] _169;
    wire [15:0] _3072;
    wire _1702;
    wire _1707;
    wire [15:0] _3073;
    wire _1701;
    wire [15:0] _3074;
    wire _3055;
    wire _3053;
    wire _3054;
    wire _3056;
    wire _3058;
    wire _170;
    reg _1600;
    wire _1601;
    wire _1598;
    wire _1602;
    wire _3060;
    wire _3061;
    wire _3062;
    wire _3064;
    wire _171;
    reg _1594;
    wire _1595;
    wire _1592;
    wire _1596;
    wire _1603;
    wire _1604;
    wire _1605;
    wire [15:0] _3075;
    wire [15:0] _3066;
    wire [15:0] _3067;
    wire [15:0] _3068;
    wire [15:0] _3069;
    wire [15:0] _3070;
    wire [15:0] _3076;
    wire [15:0] _3078;
    wire [15:0] _172;
    reg [15:0] _1705;
    wire _1706;
    wire _2976;
    wire _2977;
    wire _3084;
    wire _3082;
    wire _3083;
    wire _3085;
    wire [2:0] _3089;
    wire _3080;
    wire [2:0] _3094;
    wire [2:0] _3095;
    wire [2:0] _3096;
    wire [2:0] _3114;
    wire [2:0] _3116;
    wire [2:0] _173;
    reg [2:0] _1588;
    wire _1589;
    wire [1:0] _175;
    wire _1584;
    wire _1585;
    wire _1590;
    wire _1727;
    wire _1734;
    wire _3130;
    wire _3131;
    wire _1722;
    wire _1720;
    wire _1723;
    wire _1724;
    wire _1725;
    wire _3123;
    wire _3120;
    wire _3117;
    wire _3118;
    wire _3121;
    wire _3122;
    wire _3124;
    wire _3132;
    wire _3134;
    wire _3136;
    wire _3138;
    wire _3140;
    wire _176;
    reg _1572;
    wire _1573;
    wire _1574;
    wire _1567;
    wire _1568;
    wire _1564;
    wire _178;
    wire _1561;
    wire _1562;
    wire _1563;
    wire _1565;
    wire _1569;
    wire _1570;
    wire _1575;
    wire [1:0] _3205;
    wire _1556;
    wire _1557;
    wire _1552;
    wire _1551;
    wire _1550;
    wire _1549;
    wire _1548;
    wire _1547;
    wire _1546;
    wire _1545;
    reg _1553;
    wire _1554;
    wire _1543;
    wire _1542;
    wire _1541;
    wire _1540;
    wire _1539;
    wire _1538;
    wire _1537;
    wire _1536;
    wire [2:0] _180;
    reg _1544;
    wire _1555;
    wire _182;
    wire _1558;
    wire _1534;
    wire _1531;
    wire _1524;
    wire _1522;
    wire [13:0] _1513;
    wire [15:0] _1514;
    wire [14:0] _1510;
    wire [15:0] _1511;
    wire [15:0] _1515;
    wire [14:0] _1507;
    wire [15:0] _1508;
    wire _1505;
    wire [15:0] _1516;
    reg [15:0] _1519;
    wire _1520;
    wire [13:0] _1497;
    wire [15:0] _1498;
    reg [15:0] _1501;
    wire _3186;
    wire _3187;
    wire [15:0] _3188;
    wire [15:0] _3190;
    wire [15:0] _3192;
    wire _3170;
    wire [14:0] _1526;
    wire [15:0] _1527;
    reg [15:0] _1530;
    wire [16:0] _3166;
    wire _3167;
    wire [16:0] _3160;
    reg [16:0] _3163;
    wire [16:0] _3155;
    wire [15:0] _184;
    wire [16:0] _3154;
    wire [16:0] _3156;
    reg [16:0] _3159;
    wire [7:0] _186;
    wire [8:0] _3174;
    wire [7:0] _3176;
    wire [7:0] _3177;
    wire [7:0] _3178;
    wire [7:0] _3180;
    wire [7:0] _187;
    reg [7:0] _3148;
    wire [8:0] _3173;
    wire [8:0] _3175;
    wire _3181;
    wire _3182;
    wire _3183;
    wire _3185;
    wire _188;
    reg _3153;
    wire [16:0] _3164;
    wire [16:0] _3150;
    wire _3165;
    wire _3168;
    wire _3171;
    wire _3149;
    wire _3172;
    wire [15:0] _3194;
    wire _3144;
    wire _3142;
    wire _640;
    wire _3141;
    wire _3143;
    wire _3145;
    wire [15:0] _3195;
    wire [15:0] _3197;
    wire [15:0] _189;
    reg [15:0] _1495;
    wire _1502;
    wire _1503;
    wire _1492;
    wire _1504;
    wire _1521;
    wire _1523;
    wire _1532;
    wire [1:0] _191;
    wire _1488;
    wire _1489;
    wire _1486;
    wire _1490;
    wire _1483;
    wire _1479;
    wire _1478;
    wire _1477;
    wire _1476;
    wire _1475;
    wire _1474;
    wire _1473;
    wire _1472;
    reg _1480;
    wire _1470;
    wire _1469;
    wire _1468;
    wire _1467;
    wire _1466;
    wire _1465;
    wire _1464;
    wire _1463;
    wire [2:0] _193;
    reg _1471;
    wire _1481;
    wire _1482;
    wire _1484;
    wire _1491;
    wire _1535;
    wire _195;
    wire _1559;
    wire _197;
    wire _1462;
    wire _1560;
    wire [1:0] _3257;
    wire _1715;
    wire [1:0] _3259;
    wire _3003;
    wire [1:0] _3266;
    wire _1459;
    wire [1:0] _3272;
    wire _1456;
    wire _1457;
    wire [1:0] _3274;
    wire [1:0] _198;
    reg [1:0] _638;
    wire _1461;
    wire _1718;
    wire _1726;
    wire _3632;
    wire _3634;
    wire _3630;
    wire _1767;
    wire _3608;
    wire _3609;
    wire [1:0] _3612;
    wire _3601;
    wire _3602;
    wire _3603;
    wire _3604;
    wire [1:0] _3606;
    wire [2:0] _3587;
    wire [2:0] _3584;
    wire _3580;
    wire _3578;
    wire _3579;
    wire _3581;
    wire [2:0] _3585;
    wire _3576;
    wire [2:0] _3588;
    wire _3589;
    wire [2:0] _3570;
    wire _3566;
    wire _3564;
    wire _3565;
    wire _3567;
    wire [2:0] _3571;
    wire _3562;
    wire [2:0] _3573;
    wire _3574;
    wire _3590;
    wire _3591;
    wire _3592;
    wire _3558;
    wire _3556;
    wire _3559;
    wire [15:0] _3551;
    wire _3552;
    wire _3549;
    wire _3553;
    wire _3547;
    wire _3548;
    wire _3554;
    wire _3560;
    wire _3593;
    wire [1:0] _3595;
    wire [1:0] _3597;
    wire [1:0] _3543;
    wire _3539;
    wire [1:0] _3541;
    wire [1:0] _3544;
    wire _3307;
    wire _3308;
    wire _199;
    reg _3277;
    wire _3465;
    wire _3463;
    wire _3464;
    reg _3466;
    wire [2:0] _201;
    wire [2:0] _3447;
    wire [2:0] _3448;
    wire [2:0] _3443;
    wire _3439;
    wire _3437;
    wire _3438;
    wire _3440;
    wire [2:0] _3444;
    wire _3435;
    wire [2:0] _3449;
    wire [2:0] _3450;
    wire [2:0] _3429;
    wire [2:0] _3430;
    wire [2:0] _3425;
    wire _3303;
    wire _3302;
    wire _3301;
    wire _3300;
    wire _3299;
    wire _3298;
    wire _3297;
    wire _3293;
    wire _3292;
    wire _3291;
    wire _3290;
    wire _3289;
    wire _3288;
    wire _3287;
    wire _2950;
    wire _2951;
    reg [7:0] _2952;
    wire _2944;
    wire _2945;
    reg [7:0] _2946;
    wire _2938;
    wire _2939;
    reg [7:0] _2940;
    wire _2932;
    wire _2933;
    reg [7:0] _2934;
    wire _2926;
    wire _2927;
    reg [7:0] _2928;
    wire _2920;
    wire _2921;
    reg [7:0] _2922;
    wire _2914;
    wire _2915;
    reg [7:0] _2916;
    wire [2:0] _3310;
    wire [2:0] _3311;
    wire [2:0] _202;
    reg [2:0] _2906;
    wire _2908;
    wire _2909;
    wire [7:0] _204;
    reg [7:0] _2910;
    wire [2:0] _3315;
    wire [2:0] _3316;
    wire [2:0] _205;
    reg [2:0] _2899;
    reg [7:0] _2953;
    wire [7:0] _3284;
    wire [6:0] _2321;
    wire [7:0] _2322;
    wire [6:0] _2319;
    wire [7:0] _2320;
    wire [7:0] _2323;
    wire [7:0] _3321;
    wire [7:0] _3322;
    wire [7:0] _3323;
    wire [7:0] _3317;
    wire [7:0] _3318;
    wire [7:0] _3319;
    wire [7:0] _3320;
    wire [7:0] _3324;
    wire [7:0] _206;
    reg [7:0] _2318;
    wire _3281;
    wire _3278;
    wire _3279;
    wire _3282;
    wire [7:0] _3285;
    wire _3286;
    wire [7:0] _3294;
    wire _208;
    wire [7:0] _3295;
    wire _3296;
    wire [2:0] _3332;
    wire [2:0] _3333;
    wire [2:0] _3334;
    wire [2:0] _3335;
    wire [2:0] _3326;
    wire [2:0] _3327;
    wire [2:0] _3328;
    wire [2:0] _3329;
    wire [2:0] _3330;
    wire [2:0] _3336;
    wire [2:0] _3338;
    wire [2:0] _209;
    reg [2:0] _1760;
    reg _3304;
    wire _211;
    wire [31:0] _213;
    wire [30:0] _3380;
    wire [31:0] _3382;
    wire _3374;
    wire _3375;
    wire [31:0] _3377;
    wire [30:0] _3371;
    wire [31:0] _3373;
    wire [31:0] _3378;
    wire [31:0] _3379;
    wire [5:0] _215;
    wire [5:0] _3348;
    wire [5:0] _3349;
    wire [5:0] _3350;
    wire [5:0] _3351;
    wire [5:0] _3342;
    wire [5:0] _3343;
    wire [5:0] _3344;
    wire [5:0] _3345;
    wire [5:0] _3346;
    wire [5:0] _3352;
    wire [5:0] _3353;
    wire [5:0] _3355;
    wire [5:0] _216;
    reg [5:0] _1780;
    wire _1782;
    wire _1783;
    wire _2807;
    wire _2806;
    wire _2808;
    wire _2809;
    wire [31:0] _3383;
    wire [31:0] _3384;
    wire [31:0] _3385;
    wire [31:0] _218;
    wire _3362;
    wire _3363;
    wire [31:0] _3365;
    wire [30:0] _3359;
    wire [31:0] _3361;
    wire [31:0] _3366;
    wire [30:0] _3356;
    wire [31:0] _3358;
    wire [31:0] _3367;
    wire [31:0] _3368;
    wire [31:0] _3369;
    wire [31:0] _3370;
    wire [31:0] _3386;
    wire [31:0] _3387;
    wire [31:0] _3389;
    wire [31:0] _219;
    reg [31:0] _2812;
    wire _2813;
    wire _2814;
    wire [15:0] _221;
    wire [15:0] _3409;
    wire _1752;
    wire _1757;
    wire [15:0] _3410;
    wire _1751;
    wire [15:0] _3411;
    wire _3392;
    wire _3390;
    wire _3391;
    wire _3393;
    wire _3395;
    wire _222;
    reg _1442;
    wire _1443;
    wire _1440;
    wire _1444;
    wire _3397;
    wire _3398;
    wire _3399;
    wire _3401;
    wire _223;
    reg _1436;
    wire _1437;
    wire _1434;
    wire _1438;
    wire _1445;
    wire _1446;
    wire _1447;
    wire [15:0] _3412;
    wire [15:0] _3403;
    wire [15:0] _3404;
    wire [15:0] _3405;
    wire [15:0] _3406;
    wire [15:0] _3407;
    wire [15:0] _3413;
    wire [15:0] _3415;
    wire [15:0] _224;
    reg [15:0] _1755;
    wire _1756;
    wire _3305;
    wire _3306;
    wire _3421;
    wire _3419;
    wire _3420;
    wire _3422;
    wire [2:0] _3426;
    wire _3417;
    wire [2:0] _3431;
    wire [2:0] _3432;
    wire [2:0] _3433;
    wire [2:0] _3451;
    wire [2:0] _3453;
    wire [2:0] _225;
    reg [2:0] _1430;
    wire _1431;
    wire [1:0] _227;
    wire _1426;
    wire _1427;
    wire _1432;
    wire _1777;
    wire _1784;
    wire _3467;
    wire _3468;
    wire _1772;
    wire _1770;
    wire _1773;
    wire _1774;
    wire _1775;
    wire _3460;
    wire _3457;
    wire _3454;
    wire _3455;
    wire _3458;
    wire _3459;
    wire _3461;
    wire _3469;
    wire _3471;
    wire _3473;
    wire _3475;
    wire _3477;
    wire _228;
    reg _1414;
    wire _1415;
    wire _1416;
    wire _1409;
    wire _1410;
    wire _1406;
    wire _230;
    wire _1403;
    wire _1404;
    wire _1405;
    wire _1407;
    wire _1411;
    wire _1412;
    wire _1417;
    wire [1:0] _3546;
    wire _1398;
    wire _1399;
    wire _1394;
    wire _1393;
    wire _1392;
    wire _1391;
    wire _1390;
    wire _1389;
    wire _1388;
    wire _1387;
    reg _1395;
    wire _1396;
    wire _1385;
    wire _1384;
    wire _1383;
    wire _1382;
    wire _1381;
    wire _1380;
    wire _1379;
    wire _1378;
    wire [2:0] _232;
    reg _1386;
    wire _1397;
    wire _234;
    wire _1400;
    wire _1376;
    wire _1373;
    wire _1366;
    wire _1364;
    wire [13:0] _1355;
    wire [15:0] _1356;
    wire [14:0] _1352;
    wire [15:0] _1353;
    wire [15:0] _1357;
    wire [14:0] _1349;
    wire [15:0] _1350;
    wire _1347;
    wire [15:0] _1358;
    reg [15:0] _1361;
    wire _1362;
    wire [13:0] _1339;
    wire [15:0] _1340;
    reg [15:0] _1343;
    wire _3523;
    wire _3524;
    wire [15:0] _3525;
    wire [15:0] _3527;
    wire [15:0] _3529;
    wire _3507;
    wire [14:0] _1368;
    wire [15:0] _1369;
    reg [15:0] _1372;
    wire [16:0] _3503;
    wire _3504;
    wire [16:0] _3497;
    reg [16:0] _3500;
    wire [15:0] _236;
    wire [16:0] _3491;
    wire [16:0] _3493;
    reg [16:0] _3496;
    wire [7:0] _238;
    wire [8:0] _3511;
    wire [7:0] _3513;
    wire [7:0] _3514;
    wire [7:0] _3515;
    wire [7:0] _3517;
    wire [7:0] _239;
    reg [7:0] _3485;
    wire [8:0] _3510;
    wire [8:0] _3512;
    wire _3518;
    wire _3519;
    wire _3520;
    wire _3522;
    wire _240;
    reg _3490;
    wire [16:0] _3501;
    wire [16:0] _3487;
    wire _3502;
    wire _3505;
    wire _3508;
    wire _3486;
    wire _3509;
    wire [15:0] _3531;
    wire _3481;
    wire _3479;
    wire _626;
    wire _3478;
    wire _3480;
    wire _3482;
    wire [15:0] _3532;
    wire [15:0] _3534;
    wire [15:0] _241;
    reg [15:0] _1337;
    wire _1344;
    wire _1345;
    wire _1334;
    wire _1346;
    wire _1363;
    wire _1365;
    wire _1374;
    wire [1:0] _243;
    wire _1330;
    wire _1331;
    wire _1328;
    wire _1332;
    wire _1325;
    wire _1321;
    wire _1320;
    wire _1319;
    wire _1318;
    wire _1317;
    wire _1316;
    wire _1315;
    wire _1314;
    reg _1322;
    wire _1312;
    wire _1311;
    wire _1310;
    wire _1309;
    wire _1308;
    wire _1307;
    wire _1306;
    wire _1305;
    wire [2:0] _245;
    reg _1313;
    wire _1323;
    wire _1324;
    wire _1326;
    wire _1333;
    wire _1377;
    wire _247;
    wire _1401;
    wire _249;
    wire _1304;
    wire _1402;
    wire [1:0] _3598;
    wire _1765;
    wire [1:0] _3600;
    wire _3340;
    wire [1:0] _3607;
    wire _1301;
    wire [1:0] _3613;
    wire [2:0] _2439;
    wire [2:0] _2438;
    wire [2:0] _2437;
    wire [2:0] _2436;
    reg [2:0] _2440;
    wire _2432;
    wire _2431;
    wire _2430;
    wire _2429;
    reg _2433;
    wire _3535;
    wire _3536;
    wire [2:0] _3538;
    wire [2:0] _250;
    wire _1298;
    wire _1299;
    wire [1:0] _3615;
    wire [1:0] _251;
    reg [1:0] _624;
    wire _1303;
    wire _1768;
    wire _1776;
    wire _3629;
    wire _3631;
    wire _3635;
    wire _3626;
    wire _3624;
    wire _3627;
    wire _3628;
    wire _3636;
    wire _252;
    wire _3313;
    wire _2385;
    wire _2902;
    wire _254;
    wire _2903;
    wire _3637;
    wire [3:0] _3643;
    reg [3:0] _3646;
    wire [3:0] _255;
    wire _612;
    wire [7:0] _3648;
    wire [1:0] _3621;
    wire [1:0] _3619;
    wire [1:0] _3618;
    wire [1:0] _3617;
    wire [1:0] _3616;
    reg [1:0] _3620;
    wire [1:0] _3622;
    reg [7:0] _3660;
    wire [7:0] _3661;
    wire [7:0] _256;
    reg [7:0] _605;
    wire _606;
    wire [7:0] _3672;
    wire [7:0] _3671;
    wire [7:0] _3669;
    wire [7:0] _3670;
    wire [1:0] _3667;
    wire [111:0] _725;
    wire [1:0] _3665;
    wire [111:0] _719;
    wire [1:0] _3664;
    wire [1:0] _3663;
    wire [1:0] _3662;
    reg [1:0] _3666;
    wire [1:0] _3668;
    reg [7:0] _3673;
    wire [7:0] _3674;
    wire [7:0] _257;
    reg [7:0] _600;
    wire _602;
    wire [3:0] _830;
    reg _831;
    wire _833;
    wire [15:0] _825;
    wire _827;
    wire [15:0] _816;
    wire [16:0] _817;
    wire [16:0] _818;
    reg [16:0] _821;
    wire _822;
    wire _823;
    wire [15:0] _812;
    wire _814;
    wire [2:0] _560;
    wire [2:0] _3689;
    wire _3685;
    wire _3686;
    wire _3683;
    wire _3687;
    wire [2:0] _3690;
    wire _3680;
    wire _3681;
    wire _3679;
    wire _3682;
    wire [2:0] _3692;
    wire _3676;
    wire [2:0] _3678;
    wire _3675;
    wire [2:0] _3693;
    wire [2:0] _258;
    reg [2:0] _556;
    wire _558;
    wire [2:0] _561;
    wire _551;
    wire _552;
    wire _550;
    wire _553;
    wire [2:0] _563;
    wire _547;
    wire _548;
    wire [2:0] _564;
    wire _796;
    wire [2:0] _798;
    wire [2:0] _539;
    wire [2:0] _3708;
    wire _3704;
    wire _3705;
    wire _3702;
    wire _3706;
    wire [2:0] _3709;
    wire _3699;
    wire _3700;
    wire _3698;
    wire _3701;
    wire [2:0] _3711;
    wire _3695;
    wire [2:0] _3697;
    wire _3694;
    wire [2:0] _3712;
    wire [2:0] _259;
    reg [2:0] _535;
    wire _537;
    wire [2:0] _540;
    wire _530;
    wire _531;
    wire _529;
    wire _532;
    wire [2:0] _542;
    wire _526;
    wire _527;
    wire [2:0] _543;
    wire _793;
    wire [2:0] _795;
    wire _799;
    wire [2:0] _800;
    wire [2:0] _516;
    wire [2:0] _3727;
    wire _3723;
    wire _3724;
    wire _3721;
    wire _3725;
    wire [2:0] _3728;
    wire _3718;
    wire _3719;
    wire _3717;
    wire _3720;
    wire [2:0] _3730;
    wire _3714;
    wire [2:0] _3716;
    wire _3713;
    wire [2:0] _3731;
    wire [2:0] _260;
    reg [2:0] _512;
    wire _514;
    wire [2:0] _517;
    wire _507;
    wire _508;
    wire _506;
    wire _509;
    wire [2:0] _519;
    wire _503;
    wire _504;
    wire [2:0] _520;
    wire _788;
    wire [2:0] _790;
    wire [2:0] _495;
    wire [2:0] _3746;
    wire _3742;
    wire _3743;
    wire _3740;
    wire _3744;
    wire [2:0] _3747;
    wire _3737;
    wire _3738;
    wire _3736;
    wire _3739;
    wire [2:0] _3749;
    wire _3733;
    wire [2:0] _3735;
    wire _3732;
    wire [2:0] _3750;
    wire [2:0] _261;
    reg [2:0] _491;
    wire _493;
    wire [2:0] _496;
    wire _486;
    wire _487;
    wire _485;
    wire _488;
    wire [2:0] _498;
    wire _482;
    wire _483;
    wire [2:0] _499;
    wire _785;
    wire [2:0] _787;
    wire _791;
    wire [2:0] _792;
    wire _801;
    wire [2:0] _802;
    wire [2:0] _470;
    wire [2:0] _3765;
    wire _3761;
    wire _3762;
    wire _3759;
    wire _3763;
    wire [2:0] _3766;
    wire _3756;
    wire _3757;
    wire _3755;
    wire _3758;
    wire [2:0] _3768;
    wire _3752;
    wire [2:0] _3754;
    wire _3751;
    wire [2:0] _3769;
    wire [2:0] _262;
    reg [2:0] _466;
    wire _468;
    wire [2:0] _471;
    wire _461;
    wire _462;
    wire _460;
    wire _463;
    wire [2:0] _473;
    wire _457;
    wire _458;
    wire [2:0] _474;
    wire _778;
    wire [2:0] _780;
    wire [2:0] _449;
    wire [2:0] _3784;
    wire _3780;
    wire _3781;
    wire _3778;
    wire _3782;
    wire [2:0] _3785;
    wire _3775;
    wire _3776;
    wire _3774;
    wire _3777;
    wire [2:0] _3787;
    wire _3771;
    wire [2:0] _3773;
    wire _3770;
    wire [2:0] _3788;
    wire [2:0] _263;
    reg [2:0] _445;
    wire _447;
    wire [2:0] _450;
    wire _440;
    wire _441;
    wire _439;
    wire _442;
    wire [2:0] _452;
    wire _436;
    wire _437;
    wire [2:0] _453;
    wire _775;
    wire [2:0] _777;
    wire _781;
    wire [2:0] _782;
    wire [2:0] _426;
    wire [2:0] _3803;
    wire _3799;
    wire _3800;
    wire _3797;
    wire _3801;
    wire [2:0] _3804;
    wire _3794;
    wire _3795;
    wire _3793;
    wire _3796;
    wire [2:0] _3806;
    wire _3790;
    wire [2:0] _3792;
    wire _3789;
    wire [2:0] _3807;
    wire [2:0] _264;
    reg [2:0] _422;
    wire _424;
    wire [2:0] _427;
    wire _417;
    wire _418;
    wire _416;
    wire _419;
    wire [2:0] _429;
    wire _413;
    wire _414;
    wire [2:0] _430;
    wire _770;
    wire [2:0] _772;
    wire [2:0] _405;
    wire [2:0] _3822;
    wire _3818;
    wire _3819;
    wire _3816;
    wire _3820;
    wire [2:0] _3823;
    wire _3813;
    wire _3814;
    wire _3812;
    wire _3815;
    wire [2:0] _3825;
    wire _3809;
    wire [2:0] _3811;
    wire _3808;
    wire [2:0] _3826;
    wire [2:0] _265;
    reg [2:0] _401;
    wire _403;
    wire [2:0] _406;
    wire _396;
    wire _397;
    wire _395;
    wire _398;
    wire [2:0] _408;
    wire _392;
    wire _393;
    wire [2:0] _409;
    wire [7:0] _766;
    wire _767;
    wire [2:0] _769;
    wire _773;
    wire [2:0] _774;
    wire _783;
    wire [2:0] _784;
    wire _803;
    wire [2:0] _804;
    wire [16:0] _805;
    wire _3829;
    wire [127:0] _3830;
    wire _3827;
    wire [127:0] _3831;
    wire [127:0] _266;
    reg [127:0] _314;
    wire _381;
    wire _382;
    wire [127:0] _383;
    wire _3834;
    wire [127:0] _3835;
    wire _3832;
    wire [127:0] _3836;
    wire [127:0] _267;
    reg [127:0] _311;
    wire _377;
    wire _378;
    wire [127:0] _379;
    wire _3839;
    wire [127:0] _3840;
    wire _3837;
    wire [127:0] _3841;
    wire [127:0] _268;
    reg [127:0] _308;
    wire _373;
    wire _374;
    wire [127:0] _375;
    wire [127:0] _270;
    wire _369;
    wire _370;
    wire [127:0] _371;
    wire [511:0] _384;
    wire [111:0] _762;
    wire [15:0] _763;
    wire [16:0] _764;
    wire [16:0] _806;
    reg [16:0] _809;
    wire gnd;
    wire [16:0] _761;
    wire _810;
    wire _811;
    wire _815;
    wire _824;
    wire [15:0] _3869;
    wire _3865;
    wire _3866;
    wire _3867;
    wire [15:0] _3870;
    wire _3849;
    wire _3850;
    wire [15:0] _3872;
    wire [15:0] _3874;
    wire [15:0] _271;
    reg [15:0] _357;
    wire [15:0] _3886;
    wire _3882;
    wire _3883;
    wire [8:0] _3861;
    wire _3862;
    wire [5:0] _3859;
    wire [5:0] _3858;
    wire _3860;
    wire [8:0] _3853;
    wire [8:0] _3875;
    wire [8:0] _3876;
    wire [8:0] _3878;
    wire [8:0] _272;
    reg [8:0] _3854;
    wire [2:0] _3855;
    wire _3857;
    wire [1:0] _3851;
    reg _3863;
    wire _3884;
    wire [15:0] _3887;
    wire _3879;
    wire _3880;
    wire [15:0] _3889;
    wire [15:0] _3891;
    wire [15:0] _273;
    reg [15:0] _354;
    wire [1:0] _757;
    reg [15:0] _758;
    wire _760;
    wire _828;
    reg [7:0] _339;
    wire [7:0] f_chg_now;
    wire _3893;
    wire [7:0] _3895;
    wire _3892;
    wire [7:0] _3896;
    wire [7:0] _3898;
    wire [7:0] _274;
    reg [7:0] _336;
    wire [7:0] f_changed_all;
    wire [7:0] _751;
    wire _753;
    wire _754;
    wire [7:0] f_chgmask1;
    wire _750;
    wire _755;
    wire [7:0] _744;
    wire [7:0] _742;
    wire vdd;
    wire _276;
    wire _278;
    wire [7:0] _280;
    reg [7:0] _320;
    reg [7:0] _323;
    wire [7:0] _743;
    wire [7:0] _745;
    wire _747;
    wire [111:0] _713;
    wire f_valid1;
    wire _748;
    wire _756;
    wire _829;
    wire _834;
    wire _873;
    wire _874;
    wire _878;
    wire f_fire1;
    wire [1:0] _1022;
    wire [1:0] f_winner;
    reg [2:0] _3846;
    wire [2:0] _3848;
    wire _3899;
    wire _1809;
    wire f_in_fetch;
    wire _1810;
    wire _1811;
    wire _3900;
    wire [15:0] _3909;
    wire [15:0] _3911;
    wire [15:0] _281;
    reg [15:0] _351;
    wire [1:0] _1862;
    reg [15:0] _1863;
    wire [15:0] _1861;
    wire _1864;
    wire [63:0] _708;
    wire _1859;
    wire _1857;
    wire _1858;
    wire _1860;
    wire _1865;
    wire _1870;
    wire _1878;
    wire f_viol_now;
    wire [2:0] _3917;
    wire [2:0] _3920;
    wire _3913;
    wire [2:0] _3921;
    wire _3912;
    wire [2:0] _3924;
    wire [2:0] _3926;
    wire [2:0] _282;
    reg [2:0] _367;
    wire _3929;
    wire [127:0] _3930;
    wire _3927;
    wire [127:0] _3931;
    wire [127:0] _283;
    reg [127:0] _305;
    wire [511:0] _315;
    wire [111:0] _316;
    wire f_valid0;
    wire _330;
    wire _347;
    wire _596;
    wire _653;
    wire _697;
    wire f_in_eval;
    wire _698;
    wire _707;
    wire f_fire0;
    wire _1108;
    wire _1109;
    wire _1204;
    wire [1:0] _3950;
    wire _3935;
    wire [1:0] _3937;
    wire _3933;
    wire [1:0] _3951;
    wire _3932;
    wire [1:0] _3954;
    wire _285;
    wire [1:0] _3956;
    wire [1:0] _3958;
    wire [1:0] _286;
    reg [1:0] _300;
    wire _1262;
    wire _288;
    wire _2546;
    wire _2548;
    wire _3960;
    wire _3970;
    wire _289;
    reg f_sweeping;
    wire _3982;
    wire _290;
    reg f_image_valid;
    wire _292;
    wire _1676;
    wire [7:0] _4006;
    wire [7:0] _293;
    reg [7:0] _2470;
    wire _2471;
    wire [23:0] _295;
    wire [2:0] _2467;
    reg _2478;
    wire [7:0] _2542;
    wire [7:0] _4008;
    assign _1255 = _61[11:0];
    assign _1252 = _1245 < _1242;
    assign _1253 = _1227 & _1252;
    assign _1254 = _1253 ? _1242 : _1245;
    assign _1256 = _1254 < _1255;
    assign _1257 = _1256 ? _1255 : _1254;
    assign _1258 = _1238 ? _1254 : _1257;
    assign _1244 = 12'b000000000000;
    assign _1101 = 12'b111111111111;
    assign _1098 = _1096[11:0];
    assign _1095 = 13'b0000000000000;
    assign _1092 = 10'b0000000000;
    assign _1093 = { _1092,
                     _1089 };
    assign _1094 = _1085 - _1093;
    assign _1088 = 3'b000;
    always @* begin
        case (f_winner)
        0:
            _1068 <= _667;
        1:
            _1068 <= _843;
        2:
            _1068 <= _981;
        default:
            _1068 <= _1067;
        endcase
    end
    assign _1 = _1068;
    always @(posedge _278) begin
        if (_276)
            _1089 <= _1088;
        else
            _1089 <= _1;
    end
    assign _1090 = { _1092,
                     _1089 };
    assign _1075 = 13'b1111111111111;
    assign _1074 = _1072[12:0];
    assign _1069 = 16'b0001111111111111;
    assign _1073 = _1069 < _1072;
    assign _1076 = _1073 ? _1075 : _1074;
    assign _2 = _1076;
    always @(posedge _278) begin
        if (_276)
            _1085 <= _1095;
        else
            _1085 <= _2;
    end
    assign _1091 = _1085 < _1090;
    assign _1096 = _1091 ? _1095 : _1094;
    assign _1082 = 13'b0111111111111;
    assign _1097 = _1082 < _1096;
    assign _1100 = _1097 ? _1101 : _1098;
    assign _1080 = 1'b0;
    assign _1077 = 16'b1111111111111111;
    assign _1078 = _1072 == _1077;
    assign _3 = _1078;
    always @(posedge _278) begin
        if (_276)
            _1081 <= _1080;
        else
            _1081 <= _3;
    end
    assign _1102 = _1081 ? _1101 : _1100;
    assign _4 = _1102;
    always @(posedge _278) begin
        if (_276)
            _1245 <= _1244;
        else
            _1245 <= _4;
    end
    assign _1105 = _1072[11:0];
    always @* begin
        case (f_winner)
        0:
            _1071 <= _348;
        1:
            _1071 <= _757;
        2:
            _1071 <= _895;
        default:
            _1071 <= _1070;
        endcase
    end
    always @* begin
        case (_1071)
        0:
            _1072 <= _351;
        1:
            _1072 <= _354;
        2:
            _1072 <= _357;
        default:
            _1072 <= _357;
        endcase
    end
    assign _1103 = 16'b0000111111111111;
    assign _1104 = _1103 < _1072;
    assign _1107 = _1104 ? _1101 : _1105;
    assign _5 = _1107;
    always @(posedge _278) begin
        if (_276)
            _1242 <= _1244;
        else
            _1242 <= _5;
    end
    assign _1246 = _1242 < _1245;
    assign _1247 = _1227 & _1246;
    assign _1248 = _1247 ? _1242 : _1245;
    assign _1239 = _61[23:12];
    assign _1249 = _1239 < _1248;
    assign _1250 = _1249 ? _1239 : _1248;
    assign _1237 = 8'b00000000;
    assign _1238 = _1222 == _1237;
    assign _1251 = _1238 ? _1248 : _1250;
    assign _1235 = 8'b11111111;
    assign _1234 = _1232[7:0];
    assign _1229 = 2'b10;
    assign _1228 = 2'b01;
    assign _1217 = _1213 == _1216;
    assign _1209 = _1205 & _1208;
    assign _1218 = _1209 & _1217;
    assign _6 = _1218;
    always @(posedge _278) begin
        if (_276)
            _1227 <= _1080;
        else
            _1227 <= _6;
    end
    assign _1230 = _1227 ? _1229 : _1228;
    assign _1224 = 7'b0000000;
    assign _1231 = { _1224,
                     _1230 };
    assign _1222 = _61[31:24];
    assign _1223 = { gnd,
                     _1222 };
    assign _1232 = _1223 + _1231;
    assign _1233 = _1232[8:8];
    assign _1236 = _1233 ? _1235 : _1234;
    assign _1259 = { _1236,
                     _1251,
                     _1258 };
    assign _8 = host_cov_wdata;
    assign _1260 = _1221 ? _1259 : _8;
    assign _1273 = _1221 | f_host_cov_we;
    assign _1271 = ~ f_sweeping;
    assign _1266 = ~ _1208;
    assign _1264 = ~ _1221;
    assign _1263 = _38 & _1262;
    assign _1265 = _1263 & _1264;
    assign _1267 = _1265 & _1266;
    assign f_host_cov_we = _1267 & _1271;
    assign _1275 = ~ f_host_cov_we;
    assign _1274 = ~ _1221;
    assign _1276 = _1274 & _1275;
    assign _12 = _1216;
    always @(posedge _278) begin
        if (_276)
            _1280 <= _1237;
        else
            _1280 <= _12;
    end
    assign _14 = host_cov_addr;
    assign _1277 = _1208 ? _1216 : _14;
    assign _1281 = _1221 ? _1280 : _1277;
    assign _17 = host_rec_wdata;
    assign _1288 = _1287 | f_sweeping;
    assign _1294 = _367[1:0];
    assign _1295 = { _1212,
                     _1294 };
    assign _1292 = _1291[11:4];
    assign _22 = host_rec_waddr;
    assign _1293 = f_sweeping ? _1292 : _22;
    assign _1285 = 3'b100;
    assign _1286 = _367 < _1285;
    assign _1287 = f_in_fetch & _1286;
    assign _1296 = _1287 ? _1295 : _1293;
    assign _1448 = 3'b001;
    assign _1449 = _1447 ? _1448 : _1424;
    assign _1421 = 3'b010;
    assign _1423 = _1414 ? _1285 : _1421;
    assign _1424 = _1417 ? _1423 : _1420;
    assign _1450 = _1402 ? _1449 : _1424;
    assign _1452 = _1301 ? _1088 : _1450;
    assign _1454 = _1299 ? _1088 : _1452;
    assign _24 = _1454;
    always @(posedge _278) begin
        if (_276)
            _1420 <= _1088;
        else
            _1420 <= _24;
    end
    assign _1614 = { _626,
                     _629,
                     _632,
                     _635,
                     gnd,
                     _1420 };
    assign _1607 = _1605 ? _1448 : _1582;
    assign _1581 = _1572 ? _1285 : _1421;
    assign _1582 = _1575 ? _1581 : _1578;
    assign _1608 = _1560 ? _1607 : _1582;
    assign _1610 = _1459 ? _1088 : _1608;
    assign _1612 = _1457 ? _1088 : _1610;
    assign _25 = _1612;
    always @(posedge _278) begin
        if (_276)
            _1578 <= _1088;
        else
            _1578 <= _25;
    end
    assign _1613 = { _640,
                     _643,
                     _646,
                     _649,
                     gnd,
                     _1578 };
    assign _1615 = { _1613,
                     _1614 };
    assign _1621 = { _1619,
                     _1620 };
    assign _1667 = _1663 ? _1655 : _1666;
    assign _1669 = _40 ? _1088 : _1667;
    assign _30 = _1669;
    always @(posedge _278) begin
        if (_276)
            _1666 <= _1088;
        else
            _1666 <= _30;
    end
    assign _1670 = 1'b1;
    assign _1662 = ~ _1661;
    assign _1652 = _1623 ? _1448 : _1421;
    assign _1648 = 3'b011;
    assign _1649 = _1636 ? _1648 : _1285;
    assign _1653 = _1631 ? _1652 : _1649;
    assign _1646 = 3'b101;
    assign _1654 = _1640 ? _1653 : _1646;
    assign _1641 = _111 | _38;
    assign _1642 = _1641 | _36;
    assign _1643 = f_sweeping & _1642;
    assign _1637 = ~ f_image_valid;
    assign _1638 = _292 & _1637;
    assign _1619 = _1486 | _1461;
    assign _1634 = _33[1:1];
    assign _1635 = _1634 & _1619;
    assign _1620 = _1328 | _1303;
    assign _33 = host_lane_we;
    assign _1632 = _33[0:0];
    assign _1633 = _1632 & _1620;
    assign _1636 = _1633 | _1635;
    assign _1639 = _1636 | _1638;
    assign _34 = _1208;
    always @(posedge _278) begin
        if (_276)
            _1221 <= _1080;
        else
            _1221 <= _34;
    end
    assign _1628 = _1208 | _1221;
    assign _1627 = _38 & _1262;
    assign _1629 = _1627 & _1628;
    assign _1625 = ~ _1262;
    assign _36 = host_cov_re;
    assign _38 = host_cov_we;
    assign _1624 = _38 | _36;
    assign _1626 = _1624 & _1625;
    assign _1630 = _1626 | _1629;
    assign _1622 = ~ _1262;
    assign _1623 = _111 & _1622;
    assign _1631 = _1623 | _1630;
    assign _1640 = _1631 | _1639;
    assign _1644 = _1640 | _1643;
    assign _1655 = _1644 ? _1654 : _1088;
    assign _1657 = _1655 == _1088;
    assign _1658 = ~ _1657;
    assign _1663 = _1658 & _1662;
    assign _1671 = _1663 ? _1670 : _1661;
    assign _40 = host_err_clear;
    assign _1673 = _40 ? _1080 : _1671;
    assign _41 = _1673;
    always @(posedge _278) begin
        if (_276)
            _1661 <= _1080;
        else
            _1661 <= _41;
    end
    assign _43 = _1213;
    always @(posedge _278) begin
        if (_276)
            _1216 <= _1237;
        else
            _1216 <= _43;
    end
    assign _1213 = { _1212,
                     f_winner };
    assign _1678 = _1213 == _1216;
    assign _1679 = ~ _1678;
    assign _1674 = ~ _1208;
    assign _1675 = _1205 & _1674;
    assign _44 = _1675;
    always @(posedge _278) begin
        if (_276)
            _1208 <= _1080;
        else
            _1208 <= _44;
    end
    assign _46 = host_cover_en;
    assign _1205 = _1204 & _46;
    assign _1677 = _1205 & _1208;
    assign _1680 = _1677 & _1679;
    assign _1685 = _1680 ? _1670 : _1683;
    assign _1687 = _1676 ? _1080 : _1685;
    assign _47 = _1687;
    always @(posedge _278) begin
        if (_276)
            _1683 <= _1080;
        else
            _1683 <= _47;
    end
    assign _1690 = _75 & _1689;
    assign _1695 = _1690 ? _1670 : _1693;
    assign _1697 = _1676 ? _1080 : _1695;
    assign _49 = _1697;
    always @(posedge _278) begin
        if (_276)
            _1693 <= _1080;
        else
            _1693 <= _49;
    end
    assign _1829 = ~ _1828;
    assign _1822 = _1807 & _1821;
    assign _1830 = _1822 & _1829;
    assign _1803 = ~ _1802;
    assign _1750 = _1700 & _1749;
    assign _1804 = _1750 & _1803;
    assign _1831 = _1804 | _1830;
    assign _51 = _1831;
    assign _1832 = _148 & _614;
    assign _1833 = _1832 | _51;
    assign _1838 = _1833 ? _1670 : _1836;
    assign _1840 = _1676 ? _1080 : _1838;
    assign _52 = _1840;
    always @(posedge _278) begin
        if (_276)
            _1836 <= _1080;
        else
            _1836 <= _52;
    end
    assign _1844 = _708[61:61];
    assign _1845 = _1810 & _1844;
    assign _1850 = _1845 ? _1670 : _1848;
    assign _56 = host_irq_ack;
    assign _1852 = _56 ? _1080 : _1850;
    assign _1854 = _1676 ? _1080 : _1852;
    assign _57 = _1854;
    always @(posedge _278) begin
        if (_276)
            _1848 <= _1080;
        else
            _1848 <= _57;
    end
    assign _1883 = f_policy == _1882;
    assign _1885 = _1883 ? _1670 : _1843;
    assign _1881 = f_policy == _2389;
    assign _1887 = _1881 ? _1670 : _1885;
    assign _1888 = f_viol_now ? _1887 : _1843;
    assign _1889 = _1204 ? _1843 : _1888;
    assign _1856 = _300 == _1229;
    assign _1890 = _1856 ? _1889 : _1843;
    assign _1892 = _1676 ? _1080 : _1890;
    assign _58 = _1892;
    always @(posedge _278) begin
        if (_276)
            _1843 <= _1080;
        else
            _1843 <= _58;
    end
    assign _1898 = ~ _1897;
    assign _1895 = ~ _1894;
    assign _1899 = _1895 | _1898;
    assign _1900 = _1899 | _1843;
    assign _1901 = _1900 | _1848;
    assign _61 = ram_cov_rdata;
    assign _1904 = 32'b00000000000000000000000000000000;
    assign _1902 = ~ f_sweeping;
    assign _1903 = _1262 & _1902;
    assign _1905 = _1903 ? _61 : _1904;
    assign _2272 = 3'b111;
    assign _2273 = _1910 == _2272;
    assign _2274 = _1907 & _2273;
    assign _2271 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _278) begin
        if (_276)
            _2275 <= _2271;
        else
            if (_2274)
                _2275 <= _74;
    end
    assign _2266 = 3'b110;
    assign _2267 = _1910 == _2266;
    assign _2268 = _1907 & _2267;
    always @(posedge _278) begin
        if (_276)
            _2269 <= _2271;
        else
            if (_2268)
                _2269 <= _74;
    end
    assign _2261 = _1910 == _1646;
    assign _2262 = _1907 & _2261;
    always @(posedge _278) begin
        if (_276)
            _2263 <= _2271;
        else
            if (_2262)
                _2263 <= _74;
    end
    assign _2255 = _1910 == _1285;
    assign _2256 = _1907 & _2255;
    always @(posedge _278) begin
        if (_276)
            _2257 <= _2271;
        else
            if (_2256)
                _2257 <= _74;
    end
    assign _2249 = _1910 == _1648;
    assign _2250 = _1907 & _2249;
    always @(posedge _278) begin
        if (_276)
            _2251 <= _2271;
        else
            if (_2250)
                _2251 <= _74;
    end
    assign _2243 = _1910 == _1421;
    assign _2244 = _1907 & _2243;
    always @(posedge _278) begin
        if (_276)
            _2245 <= _2271;
        else
            if (_2244)
                _2245 <= _74;
    end
    assign _2237 = _1910 == _1448;
    assign _2238 = _1907 & _2237;
    always @(posedge _278) begin
        if (_276)
            _2239 <= _2271;
        else
            if (_2238)
                _2239 <= _74;
    end
    assign _1912 = _1910 + _1448;
    assign _1913 = _1907 ? _1912 : _1910;
    assign _64 = _1913;
    always @(posedge _278) begin
        if (_276)
            _1910 <= _1088;
        else
            _1910 <= _64;
    end
    assign _2231 = _1910 == _1088;
    assign _2232 = _1907 & _2231;
    assign _2204 = _2095 - _2200;
    assign _1921 = 29'b11111111111111111111111111111;
    assign _1920 = 29'b00000000000000000000000000000;
    assign _1923 = 29'b00000000000000000000000000001;
    assign _1924 = ts_hi_m1 + _1923;
    assign _1917 = ts_reg[2:0];
    assign _1919 = _1917 == _2272;
    assign _1925 = _1919 ? _1924 : ts_hi_m1;
    assign _65 = _1925;
    always @(posedge _278) begin
        if (_276)
            ts_hi_m1 <= _1921;
        else
            ts_hi_m1 <= _65;
    end
    assign _2202 = ts_reg[31:3];
    assign _1943 = _1930 + _1448;
    assign _1939 = _1930 == _2272;
    assign _1940 = ~ _1939;
    assign _1937 = _701[0:0];
    assign _1941 = _1937 & _1940;
    assign _1944 = _1941 ? _1943 : _1930;
    assign _1934 = _701[0:0];
    assign _1935 = ~ _1934;
    assign _1932 = _336[0:0];
    assign _1931 = f_chg_now[0:0];
    assign _1933 = _1931 & _1932;
    assign _1936 = _1933 & _1935;
    assign _1946 = _1936 ? _1448 : _1944;
    assign _1927 = _300 == _1228;
    assign _1947 = _1927 ? _1946 : _1930;
    assign _66 = _1947;
    always @(posedge _278) begin
        if (_276)
            _1930 <= _1088;
        else
            _1930 <= _66;
    end
    assign _2193 = _701[0:0];
    assign _2195 = _2193 ? _1930 : _1088;
    assign _1964 = _1951 + _1448;
    assign _1960 = _1951 == _2272;
    assign _1961 = ~ _1960;
    assign _1958 = _701[1:1];
    assign _1962 = _1958 & _1961;
    assign _1965 = _1962 ? _1964 : _1951;
    assign _1955 = _701[1:1];
    assign _1956 = ~ _1955;
    assign _1953 = _336[1:1];
    assign _1952 = f_chg_now[1:1];
    assign _1954 = _1952 & _1953;
    assign _1957 = _1954 & _1956;
    assign _1967 = _1957 ? _1448 : _1965;
    assign _1948 = _300 == _1228;
    assign _1968 = _1948 ? _1967 : _1951;
    assign _67 = _1968;
    always @(posedge _278) begin
        if (_276)
            _1951 <= _1088;
        else
            _1951 <= _67;
    end
    assign _2190 = _701[1:1];
    assign _2192 = _2190 ? _1951 : _1088;
    assign _2196 = _2152 ? _2195 : _2192;
    assign _1985 = _1972 + _1448;
    assign _1981 = _1972 == _2272;
    assign _1982 = ~ _1981;
    assign _1979 = _701[2:2];
    assign _1983 = _1979 & _1982;
    assign _1986 = _1983 ? _1985 : _1972;
    assign _1976 = _701[2:2];
    assign _1977 = ~ _1976;
    assign _1974 = _336[2:2];
    assign _1973 = f_chg_now[2:2];
    assign _1975 = _1973 & _1974;
    assign _1978 = _1975 & _1977;
    assign _1988 = _1978 ? _1448 : _1986;
    assign _1969 = _300 == _1228;
    assign _1989 = _1969 ? _1988 : _1972;
    assign _68 = _1989;
    always @(posedge _278) begin
        if (_276)
            _1972 <= _1088;
        else
            _1972 <= _68;
    end
    assign _2186 = _701[2:2];
    assign _2188 = _2186 ? _1972 : _1088;
    assign _2006 = _1993 + _1448;
    assign _2002 = _1993 == _2272;
    assign _2003 = ~ _2002;
    assign _2000 = _701[3:3];
    assign _2004 = _2000 & _2003;
    assign _2007 = _2004 ? _2006 : _1993;
    assign _1997 = _701[3:3];
    assign _1998 = ~ _1997;
    assign _1995 = _336[3:3];
    assign _1994 = f_chg_now[3:3];
    assign _1996 = _1994 & _1995;
    assign _1999 = _1996 & _1998;
    assign _2009 = _1999 ? _1448 : _2007;
    assign _1990 = _300 == _1228;
    assign _2010 = _1990 ? _2009 : _1993;
    assign _69 = _2010;
    always @(posedge _278) begin
        if (_276)
            _1993 <= _1088;
        else
            _1993 <= _69;
    end
    assign _2183 = _701[3:3];
    assign _2185 = _2183 ? _1993 : _1088;
    assign _2189 = _2155 ? _2188 : _2185;
    assign _2197 = _2154 ? _2196 : _2189;
    assign _2027 = _2014 + _1448;
    assign _2023 = _2014 == _2272;
    assign _2024 = ~ _2023;
    assign _2021 = _701[4:4];
    assign _2025 = _2021 & _2024;
    assign _2028 = _2025 ? _2027 : _2014;
    assign _2018 = _701[4:4];
    assign _2019 = ~ _2018;
    assign _2016 = _336[4:4];
    assign _2015 = f_chg_now[4:4];
    assign _2017 = _2015 & _2016;
    assign _2020 = _2017 & _2019;
    assign _2030 = _2020 ? _1448 : _2028;
    assign _2011 = _300 == _1228;
    assign _2031 = _2011 ? _2030 : _2014;
    assign _70 = _2031;
    always @(posedge _278) begin
        if (_276)
            _2014 <= _1088;
        else
            _2014 <= _70;
    end
    assign _2178 = _701[4:4];
    assign _2180 = _2178 ? _2014 : _1088;
    assign _2048 = _2035 + _1448;
    assign _2044 = _2035 == _2272;
    assign _2045 = ~ _2044;
    assign _2042 = _701[5:5];
    assign _2046 = _2042 & _2045;
    assign _2049 = _2046 ? _2048 : _2035;
    assign _2039 = _701[5:5];
    assign _2040 = ~ _2039;
    assign _2037 = _336[5:5];
    assign _2036 = f_chg_now[5:5];
    assign _2038 = _2036 & _2037;
    assign _2041 = _2038 & _2040;
    assign _2051 = _2041 ? _1448 : _2049;
    assign _2032 = _300 == _1228;
    assign _2052 = _2032 ? _2051 : _2035;
    assign _71 = _2052;
    always @(posedge _278) begin
        if (_276)
            _2035 <= _1088;
        else
            _2035 <= _71;
    end
    assign _2175 = _701[5:5];
    assign _2177 = _2175 ? _2035 : _1088;
    assign _2181 = _2159 ? _2180 : _2177;
    assign _2069 = _2056 + _1448;
    assign _2065 = _2056 == _2272;
    assign _2066 = ~ _2065;
    assign _2063 = _701[6:6];
    assign _2067 = _2063 & _2066;
    assign _2070 = _2067 ? _2069 : _2056;
    assign _2060 = _701[6:6];
    assign _2061 = ~ _2060;
    assign _2058 = _336[6:6];
    assign _2057 = f_chg_now[6:6];
    assign _2059 = _2057 & _2058;
    assign _2062 = _2059 & _2061;
    assign _2072 = _2062 ? _1448 : _2070;
    assign _2053 = _300 == _1228;
    assign _2073 = _2053 ? _2072 : _2056;
    assign _72 = _2073;
    always @(posedge _278) begin
        if (_276)
            _2056 <= _1088;
        else
            _2056 <= _72;
    end
    assign _2171 = _701[6:6];
    assign _2173 = _2171 ? _2056 : _1088;
    assign _2090 = _2077 + _1448;
    assign _2086 = _2077 == _2272;
    assign _2087 = ~ _2086;
    assign _2084 = _701[7:7];
    assign _2088 = _2084 & _2087;
    assign _2091 = _2088 ? _2090 : _2077;
    assign _2081 = _701[7:7];
    assign _2082 = ~ _2081;
    assign _2079 = _336[7:7];
    assign _2078 = f_chg_now[7:7];
    assign _2080 = _2078 & _2079;
    assign _2083 = _2080 & _2082;
    assign _2093 = _2083 ? _1448 : _2091;
    assign _2074 = _300 == _1228;
    assign _2094 = _2074 ? _2093 : _2077;
    assign _73 = _2094;
    always @(posedge _278) begin
        if (_276)
            _2077 <= _1088;
        else
            _2077 <= _73;
    end
    assign _2168 = _701[7:7];
    assign _2170 = _2168 ? _2077 : _1088;
    assign _2174 = _2162 ? _2173 : _2170;
    assign _2182 = _2161 ? _2181 : _2174;
    assign _2198 = _2158 ? _2197 : _2182;
    assign _2163 = _731[7:7];
    assign _2162 = _731[6:6];
    assign _2164 = _2162 | _2163;
    assign _2160 = _731[5:5];
    assign _2159 = _731[4:4];
    assign _2161 = _2159 | _2160;
    assign _2165 = _2161 | _2164;
    assign _2156 = _731[3:3];
    assign _2155 = _731[2:2];
    assign _2157 = _2155 | _2156;
    assign _2153 = _731[1:1];
    assign _2152 = _731[0:0];
    assign _2154 = _2152 | _2153;
    assign _2158 = _2154 | _2157;
    assign _2166 = _2158 | _2165;
    assign _2199 = _2166 ? _2198 : _1088;
    assign _2141 = f_watch[0:0];
    assign _2140 = _336[0:0];
    assign _2142 = _2140 & _2141;
    assign _2144 = _2142 ? _556 : _1088;
    assign _2136 = f_watch[1:1];
    assign _2135 = _336[1:1];
    assign _2137 = _2135 & _2136;
    assign _2139 = _2137 ? _535 : _1088;
    assign _2145 = _2139 < _2144;
    assign _2146 = _2145 ? _2144 : _2139;
    assign _2129 = f_watch[2:2];
    assign _2128 = _336[2:2];
    assign _2130 = _2128 & _2129;
    assign _2132 = _2130 ? _512 : _1088;
    assign _2124 = f_watch[3:3];
    assign _2123 = _336[3:3];
    assign _2125 = _2123 & _2124;
    assign _2127 = _2125 ? _491 : _1088;
    assign _2133 = _2127 < _2132;
    assign _2134 = _2133 ? _2132 : _2127;
    assign _2147 = _2134 < _2146;
    assign _2148 = _2147 ? _2146 : _2134;
    assign _2115 = f_watch[4:4];
    assign _2114 = _336[4:4];
    assign _2116 = _2114 & _2115;
    assign _2118 = _2116 ? _466 : _1088;
    assign _2110 = f_watch[5:5];
    assign _2109 = _336[5:5];
    assign _2111 = _2109 & _2110;
    assign _2113 = _2111 ? _445 : _1088;
    assign _2119 = _2113 < _2118;
    assign _2120 = _2119 ? _2118 : _2113;
    assign _2103 = f_watch[6:6];
    assign _2102 = _336[6:6];
    assign _2104 = _2102 & _2103;
    assign _2106 = _2104 ? _422 : _1088;
    assign _2098 = f_watch[7:7];
    assign _2097 = _336[7:7];
    assign _2099 = _2097 & _2098;
    assign _2101 = _2099 ? _401 : _1088;
    assign _2107 = _2101 < _2106;
    assign _2108 = _2107 ? _2106 : _2101;
    assign _2121 = _2108 < _2120;
    assign _2122 = _2121 ? _2120 : _2108;
    assign _2149 = _2122 < _2148;
    assign _2150 = _2149 ? _2148 : _2122;
    assign _2151 = f_unexp_now ? _2150 : _1088;
    assign _2200 = f_amb_now ? _2199 : _2151;
    assign _2095 = ts_reg[2:0];
    assign _2201 = _2095 < _2200;
    assign _2203 = _2201 ? ts_hi_m1 : _2202;
    assign _2205 = { _2203,
                     _2204 };
    assign _2209 = { _2205,
                     _1212,
                     _2208,
                     _323 };
    assign _74 = _2209;
    always @(posedge _278) begin
        if (_276)
            _2233 <= _2271;
        else
            if (_2232)
                _2233 <= _74;
    end
    assign _2226 = _2224 + _1448;
    assign _1896 = 4'b0000;
    assign _2215 = 4'b0001;
    assign _2216 = _76 + _2215;
    assign _2214 = _76 - _2215;
    assign _2217 = _1907 ? _2216 : _2214;
    assign _1688 = 4'b1000;
    assign _1689 = _76 == _1688;
    assign _1906 = ~ _1689;
    assign _75 = f_viol_now;
    assign _1907 = _75 & _1906;
    assign _2212 = _1907 ^ _2211;
    assign _2218 = _2212 ? _2217 : _76;
    always @(posedge _278) begin
        if (_276)
            _2221 <= _1896;
        else
            _2221 <= _2218;
    end
    assign _76 = _2221;
    assign _1897 = _76 == _1896;
    assign _2210 = ~ _1897;
    assign _78 = host_vlog_pop;
    assign _2211 = _78 & _2210;
    assign _2227 = _2211 ? _2226 : _2224;
    assign _79 = _2227;
    always @(posedge _278) begin
        if (_276)
            _2224 <= _1088;
        else
            _2224 <= _79;
    end
    always @* begin
        case (_2224)
        0:
            _2276 <= _2233;
        1:
            _2276 <= _2239;
        2:
            _2276 <= _2245;
        3:
            _2276 <= _2251;
        4:
            _2276 <= _2257;
        5:
            _2276 <= _2263;
        6:
            _2276 <= _2269;
        default:
            _2276 <= _2275;
        endcase
    end
    assign _2380 = _2281 == _2272;
    assign _2381 = _2278 & _2380;
    always @(posedge _278) begin
        if (_276)
            _2382 <= _1237;
        else
            if (_2381)
                _2382 <= _85;
    end
    assign _2374 = _2281 == _2266;
    assign _2375 = _2278 & _2374;
    always @(posedge _278) begin
        if (_276)
            _2376 <= _1237;
        else
            if (_2375)
                _2376 <= _85;
    end
    assign _2368 = _2281 == _1646;
    assign _2369 = _2278 & _2368;
    always @(posedge _278) begin
        if (_276)
            _2370 <= _1237;
        else
            if (_2369)
                _2370 <= _85;
    end
    assign _2362 = _2281 == _1285;
    assign _2363 = _2278 & _2362;
    always @(posedge _278) begin
        if (_276)
            _2364 <= _1237;
        else
            if (_2363)
                _2364 <= _85;
    end
    assign _2356 = _2281 == _1648;
    assign _2357 = _2278 & _2356;
    always @(posedge _278) begin
        if (_276)
            _2358 <= _1237;
        else
            if (_2357)
                _2358 <= _85;
    end
    assign _2350 = _2281 == _1421;
    assign _2351 = _2278 & _2350;
    always @(posedge _278) begin
        if (_276)
            _2352 <= _1237;
        else
            if (_2351)
                _2352 <= _85;
    end
    assign _2344 = _2281 == _1448;
    assign _2345 = _2278 & _2344;
    always @(posedge _278) begin
        if (_276)
            _2346 <= _1237;
        else
            if (_2345)
                _2346 <= _85;
    end
    assign _2283 = _2281 + _1448;
    assign _2284 = _2278 ? _2283 : _2281;
    assign _82 = _2284;
    always @(posedge _278) begin
        if (_276)
            _2281 <= _1088;
        else
            _2281 <= _82;
    end
    assign _2338 = _2281 == _1088;
    assign _2339 = _2278 & _2338;
    assign _2324 = _1757 ? _2323 : _2318;
    assign _2325 = _1763 ? _2323 : _2324;
    assign _2302 = _2301 ? _2299 : _2289;
    assign _2300 = _2286 ? _2299 : _2289;
    assign _2303 = _1802 ? _2302 : _2300;
    assign _83 = _2303;
    always @(posedge _278) begin
        if (_276)
            _2289 <= _1237;
        else
            _2289 <= _83;
    end
    assign _2298 = _1707 ? _2297 : _2292;
    assign _2299 = _1713 ? _2297 : _2298;
    assign _2314 = _1700 ? _2289 : _2299;
    assign _2311 = _2310 ? _609 : _2308;
    assign _2309 = _2305 ? _609 : _2308;
    assign _2312 = _1828 ? _2311 : _2309;
    assign _84 = _2312;
    always @(posedge _278) begin
        if (_276)
            _2308 <= _1237;
        else
            _2308 <= _84;
    end
    assign _2313 = _1807 ? _2308 : _609;
    assign _2315 = _1802 ? _2314 : _2313;
    assign _2326 = _1799 ? _2325 : _2315;
    assign _85 = _2326;
    always @(posedge _278) begin
        if (_276)
            _2340 <= _1237;
        else
            if (_2339)
                _2340 <= _85;
    end
    assign _2333 = _2331 + _1448;
    assign _2334 = _2328 ? _2333 : _2331;
    assign _86 = _2334;
    always @(posedge _278) begin
        if (_276)
            _2331 <= _1088;
        else
            _2331 <= _86;
    end
    always @* begin
        case (_2331)
        0:
            _2383 <= _2340;
        1:
            _2383 <= _2346;
        2:
            _2383 <= _2352;
        3:
            _2383 <= _2358;
        4:
            _2383 <= _2364;
        5:
            _2383 <= _2370;
        6:
            _2383 <= _2376;
        default:
            _2383 <= _2382;
        endcase
    end
    assign _2386 = 32'b00000000000000000000000000000001;
    assign _2387 = ts_reg + _2386;
    assign _90 = _2387;
    always @(posedge _278) begin
        if (_276)
            ts_reg <= _1904;
        else
            ts_reg <= _90;
    end
    assign _2389 = 2'b00;
    assign _2206 = { _1870,
                     f_unexp_now };
    assign _2208 = f_amb_now ? _2389 : _2206;
    always @(posedge _278) begin
        if (_276)
            _2390 <= _2389;
        else
            _2390 <= _2208;
    end
    always @(posedge _278) begin
        if (_276)
            _2393 <= _1080;
        else
            _2393 <= f_viol_now;
    end
    always @(posedge _278) begin
        if (_276)
            _2396 <= _2389;
        else
            _2396 <= f_winner;
    end
    always @(posedge _278) begin
        if (_276)
            _2399 <= _1080;
        else
            _2399 <= _1204;
    end
    assign _2400 = _708[60:60];
    assign _2401 = f_in_eval & _2400;
    assign _2402 = ~ _1262;
    assign _2543 = _103 & _2542;
    assign _2544 = ~ _2543;
    assign _2424 = _708[23:16];
    assign _2422 = _725[86:79];
    assign _2421 = _719[86:79];
    assign _2420 = _713[86:79];
    assign _2419 = _316[86:79];
    always @* begin
        case (f_winner)
        0:
            _2423 <= _2419;
        1:
            _2423 <= _2420;
        2:
            _2423 <= _2421;
        default:
            _2423 <= _2422;
        endcase
    end
    assign _2425 = _1810 ? _2424 : _2423;
    assign _2426 = _2425 & _2416;
    assign _2417 = ~ _2416;
    assign _2418 = _2409 & _2417;
    assign _2427 = _2418 | _2426;
    assign _2461 = _2427 | _2460;
    assign _2462 = _2406 ? _2461 : _2409;
    assign _2464 = _285 ? _1237 : _2462;
    assign _2466 = _1676 ? _1237 : _2464;
    assign _100 = _2466;
    always @(posedge _278) begin
        if (_276)
            _2409 <= _1237;
        else
            _2409 <= _100;
    end
    assign _2545 = _2409 & _2544;
    assign _103 = host_open_drain;
    assign _4007 = ~ _103;
    assign _2540 = _1572 & _2534;
    assign _2539 = ~ _1572;
    assign _2537 = ~ _1414;
    assign _2538 = _2537 & _2534;
    assign _2536 = _1414 & _2534;
    assign _2535 = ~ _1414;
    assign _2534 = _2470[0:0];
    assign _2533 = _295[2:0];
    always @* begin
        case (_2533)
        0:
            _2541 <= _2534;
        1:
            _2541 <= _1414;
        2:
            _2541 <= _2535;
        3:
            _2541 <= _2536;
        4:
            _2541 <= _2538;
        5:
            _2541 <= _1572;
        6:
            _2541 <= _2539;
        default:
            _2541 <= _2540;
        endcase
    end
    assign _2531 = _1572 & _2525;
    assign _2530 = ~ _1572;
    assign _2528 = ~ _1414;
    assign _2529 = _2528 & _2525;
    assign _2527 = _1414 & _2525;
    assign _2526 = ~ _1414;
    assign _2525 = _2470[1:1];
    assign _2524 = _295[5:3];
    always @* begin
        case (_2524)
        0:
            _2532 <= _2525;
        1:
            _2532 <= _1414;
        2:
            _2532 <= _2526;
        3:
            _2532 <= _2527;
        4:
            _2532 <= _2529;
        5:
            _2532 <= _1572;
        6:
            _2532 <= _2530;
        default:
            _2532 <= _2531;
        endcase
    end
    assign _2522 = _1572 & _2516;
    assign _2521 = ~ _1572;
    assign _2519 = ~ _1414;
    assign _2520 = _2519 & _2516;
    assign _2518 = _1414 & _2516;
    assign _2517 = ~ _1414;
    assign _2516 = _2470[2:2];
    assign _2515 = _295[8:6];
    always @* begin
        case (_2515)
        0:
            _2523 <= _2516;
        1:
            _2523 <= _1414;
        2:
            _2523 <= _2517;
        3:
            _2523 <= _2518;
        4:
            _2523 <= _2520;
        5:
            _2523 <= _1572;
        6:
            _2523 <= _2521;
        default:
            _2523 <= _2522;
        endcase
    end
    assign _2513 = _1572 & _2507;
    assign _2512 = ~ _1572;
    assign _2510 = ~ _1414;
    assign _2511 = _2510 & _2507;
    assign _2509 = _1414 & _2507;
    assign _2508 = ~ _1414;
    assign _2507 = _2470[3:3];
    assign _2506 = _295[11:9];
    always @* begin
        case (_2506)
        0:
            _2514 <= _2507;
        1:
            _2514 <= _1414;
        2:
            _2514 <= _2508;
        3:
            _2514 <= _2509;
        4:
            _2514 <= _2511;
        5:
            _2514 <= _1572;
        6:
            _2514 <= _2512;
        default:
            _2514 <= _2513;
        endcase
    end
    assign _2504 = _1572 & _2498;
    assign _2503 = ~ _1572;
    assign _2501 = ~ _1414;
    assign _2502 = _2501 & _2498;
    assign _2500 = _1414 & _2498;
    assign _2499 = ~ _1414;
    assign _2498 = _2470[4:4];
    assign _2497 = _295[14:12];
    always @* begin
        case (_2497)
        0:
            _2505 <= _2498;
        1:
            _2505 <= _1414;
        2:
            _2505 <= _2499;
        3:
            _2505 <= _2500;
        4:
            _2505 <= _2502;
        5:
            _2505 <= _1572;
        6:
            _2505 <= _2503;
        default:
            _2505 <= _2504;
        endcase
    end
    assign _2495 = _1572 & _2489;
    assign _2494 = ~ _1572;
    assign _2492 = ~ _1414;
    assign _2493 = _2492 & _2489;
    assign _2491 = _1414 & _2489;
    assign _2490 = ~ _1414;
    assign _2489 = _2470[5:5];
    assign _2488 = _295[17:15];
    always @* begin
        case (_2488)
        0:
            _2496 <= _2489;
        1:
            _2496 <= _1414;
        2:
            _2496 <= _2490;
        3:
            _2496 <= _2491;
        4:
            _2496 <= _2493;
        5:
            _2496 <= _1572;
        6:
            _2496 <= _2494;
        default:
            _2496 <= _2495;
        endcase
    end
    assign _2486 = _1572 & _2480;
    assign _2485 = ~ _1572;
    assign _2483 = ~ _1414;
    assign _2484 = _2483 & _2480;
    assign _2482 = _1414 & _2480;
    assign _2481 = ~ _1414;
    assign _2480 = _2470[6:6];
    assign _2479 = _295[20:18];
    always @* begin
        case (_2479)
        0:
            _2487 <= _2480;
        1:
            _2487 <= _1414;
        2:
            _2487 <= _2481;
        3:
            _2487 <= _2482;
        4:
            _2487 <= _2484;
        5:
            _2487 <= _1572;
        6:
            _2487 <= _2485;
        default:
            _2487 <= _2486;
        endcase
    end
    assign _2477 = _1572 & _2471;
    assign _2476 = ~ _1572;
    assign _2474 = ~ _1414;
    assign _2475 = _2474 & _2471;
    assign _2473 = _1414 & _2471;
    assign _2472 = ~ _1414;
    assign _3999 = { _3997,
                     _3996 };
    assign _3996 = _605[0:0];
    assign _3997 = { _3996,
                     _3996 };
    assign _3998 = { _3997,
                     _3997 };
    assign _4000 = { _3998,
                     _3999 };
    assign _4001 = { _4000,
                     _3996 };
    assign _4002 = _4001 & _2460;
    assign _2458 = _2454 & _2452;
    assign _2457 = _2454 & _2450;
    assign _2456 = _2454 & _2447;
    assign _2454 = ~ _2441;
    assign _2455 = _2454 & _2444;
    assign _2452 = _2449 & _2446;
    assign _2453 = _2441 & _2452;
    assign _2449 = ~ _2442;
    assign _2450 = _2449 & _2443;
    assign _2451 = _2441 & _2450;
    assign _2446 = ~ _2443;
    assign _2447 = _2442 & _2446;
    assign _2448 = _2441 & _2447;
    assign _2443 = _2440[0:0];
    assign _2442 = _2440[1:1];
    assign _2444 = _2442 & _2443;
    assign _2441 = _2440[2:2];
    assign _2445 = _2441 & _2444;
    assign _2459 = { _2445,
                     _2448,
                     _2451,
                     _2453,
                     _2455,
                     _2456,
                     _2457,
                     _2458 };
    assign _2428 = ~ _1810;
    assign _2434 = _2428 & _2433;
    assign _2460 = _2434 ? _2459 : _1237;
    assign _3994 = ~ _2460;
    assign _3990 = _708[15:8];
    assign _3988 = _725[78:71];
    assign _3987 = _719[78:71];
    assign _3986 = _713[78:71];
    assign _3985 = _316[78:71];
    always @* begin
        case (f_winner)
        0:
            _3989 <= _3985;
        1:
            _3989 <= _3986;
        2:
            _3989 <= _3987;
        default:
            _3989 <= _3988;
        endcase
    end
    assign _3991 = _1810 ? _3990 : _3989;
    assign _3992 = _3991 & _2416;
    assign _2415 = _708[7:0];
    assign _2413 = _725[70:63];
    assign _2412 = _719[70:63];
    assign _2411 = _713[70:63];
    assign _2410 = _316[70:63];
    always @* begin
        case (f_winner)
        0:
            _2414 <= _2410;
        1:
            _2414 <= _2411;
        2:
            _2414 <= _2412;
        default:
            _2414 <= _2413;
        endcase
    end
    assign _2416 = _1810 ? _2415 : _2414;
    assign _3983 = ~ _2416;
    assign _3984 = _2470 & _3983;
    assign _3993 = _3984 | _3992;
    assign _3995 = _3993 & _3994;
    assign _4003 = _3995 | _4002;
    assign _2404 = _656 == _2389;
    assign _2405 = _2404 | _658;
    assign _2406 = _1811 & _2405;
    assign _4004 = _2406 ? _4003 : _2470;
    assign _105 = host_crc_expect;
    assign _3976 = 32'b11111111111111111111111111111111;
    assign _2657 = 32'b11101101101110001000001100100000;
    assign _2655 = _2649[31:1];
    assign _2656 = { _1080,
                     _2655 };
    assign _2658 = _2656 ^ _2657;
    assign _2652 = _2649[31:1];
    assign _2653 = { _1080,
                     _2652 };
    assign _2645 = _2639[31:1];
    assign _2646 = { _1080,
                     _2645 };
    assign _2648 = _2646 ^ _2657;
    assign _2642 = _2639[31:1];
    assign _2643 = { _1080,
                     _2642 };
    assign _2635 = _2629[31:1];
    assign _2636 = { _1080,
                     _2635 };
    assign _2638 = _2636 ^ _2657;
    assign _2632 = _2629[31:1];
    assign _2633 = { _1080,
                     _2632 };
    assign _2625 = _2619[31:1];
    assign _2626 = { _1080,
                     _2625 };
    assign _2628 = _2626 ^ _2657;
    assign _2622 = _2619[31:1];
    assign _2623 = { _1080,
                     _2622 };
    assign _2615 = _2609[31:1];
    assign _2616 = { _1080,
                     _2615 };
    assign _2618 = _2616 ^ _2657;
    assign _2612 = _2609[31:1];
    assign _2613 = { _1080,
                     _2612 };
    assign _2605 = _2599[31:1];
    assign _2606 = { _1080,
                     _2605 };
    assign _2608 = _2606 ^ _2657;
    assign _2602 = _2599[31:1];
    assign _2603 = { _1080,
                     _2602 };
    assign _2595 = _2589[31:1];
    assign _2596 = { _1080,
                     _2595 };
    assign _2598 = _2596 ^ _2657;
    assign _2592 = _2589[31:1];
    assign _2593 = { _1080,
                     _2592 };
    assign _2585 = _2579[31:1];
    assign _2586 = { _1080,
                     _2585 };
    assign _2588 = _2586 ^ _2657;
    assign _2582 = _2579[31:1];
    assign _2583 = { _1080,
                     _2582 };
    assign _2576 = _270[127:120];
    assign _2575 = _270[119:112];
    assign _2574 = _270[111:104];
    assign _2573 = _270[103:96];
    assign _2572 = _270[95:88];
    assign _2571 = _270[87:80];
    assign _2570 = _270[79:72];
    assign _2569 = _270[71:64];
    assign _2568 = _270[63:56];
    assign _2567 = _270[55:48];
    assign _2566 = _270[47:40];
    assign _2565 = _270[39:32];
    assign _2564 = _270[31:24];
    assign _2563 = _270[23:16];
    assign _2562 = _270[15:8];
    assign _2561 = _270[7:0];
    assign _2558 = 13'b0000000000001;
    assign _2559 = _1291 - _2558;
    assign _2560 = _2559[3:0];
    always @* begin
        case (_2560)
        0:
            _2577 <= _2561;
        1:
            _2577 <= _2562;
        2:
            _2577 <= _2563;
        3:
            _2577 <= _2564;
        4:
            _2577 <= _2565;
        5:
            _2577 <= _2566;
        6:
            _2577 <= _2567;
        7:
            _2577 <= _2568;
        8:
            _2577 <= _2569;
        9:
            _2577 <= _2570;
        10:
            _2577 <= _2571;
        11:
            _2577 <= _2572;
        12:
            _2577 <= _2573;
        13:
            _2577 <= _2574;
        14:
            _2577 <= _2575;
        default:
            _2577 <= _2576;
        endcase
    end
    assign _2557 = 24'b000000000000000000000000;
    assign _2578 = { _2557,
                     _2577 };
    assign _2555 = _1291 == _1095;
    assign _2556 = ~ _2555;
    assign _2660 = _2556 ? _2659 : _2553;
    assign _2553 = _2548 ? _3976 : _2551;
    assign _2661 = f_sweeping ? _2660 : _2553;
    assign _106 = _2661;
    always @(posedge _278) begin
        if (_276)
            _2551 <= _3976;
        else
            _2551 <= _106;
    end
    assign _2579 = _2551 ^ _2578;
    assign _2580 = _2579[0:0];
    assign _2589 = _2580 ? _2588 : _2583;
    assign _2590 = _2589[0:0];
    assign _2599 = _2590 ? _2598 : _2593;
    assign _2600 = _2599[0:0];
    assign _2609 = _2600 ? _2608 : _2603;
    assign _2610 = _2609[0:0];
    assign _2619 = _2610 ? _2618 : _2613;
    assign _2620 = _2619[0:0];
    assign _2629 = _2620 ? _2628 : _2623;
    assign _2630 = _2629[0:0];
    assign _2639 = _2630 ? _2638 : _2633;
    assign _2640 = _2639[0:0];
    assign _2649 = _2640 ? _2648 : _2643;
    assign _2650 = _2649[0:0];
    assign _2659 = _2650 ? _2658 : _2653;
    assign _3977 = _2659 ^ _3976;
    assign f_sw_match = _3977 == _105;
    assign _3979 = f_sw_last ? f_sw_match : _3975;
    assign _3981 = _3963 ? _1080 : _3979;
    assign _1283 = ~ f_sweeping;
    assign _1282 = _111 & _1262;
    assign f_store_we = _1282 & _1283;
    assign _3971 = f_store_we | _109;
    assign _3973 = _3971 ? _1080 : f_image_valid;
    assign _3975 = _2548 ? _1080 : _3973;
    assign _3964 = 13'b1000000000000;
    assign _2665 = _1291 + _2558;
    assign _2663 = _2548 ? _1095 : _1291;
    assign _2666 = f_sweeping ? _2665 : _2663;
    assign _107 = _2666;
    always @(posedge _278) begin
        if (_276)
            _1291 <= _1095;
        else
            _1291 <= _107;
    end
    assign f_sw_last = _1291 == _3964;
    assign _3967 = f_sw_last ? _1080 : _3960;
    assign _109 = host_crc_expect_we;
    assign _111 = host_rec_we;
    assign _3961 = _292 | _111;
    assign _3962 = _3961 | _109;
    assign _3963 = f_sweeping & _3962;
    assign _3969 = _3963 ? _1080 : _3967;
    assign _2547 = ~ f_sweeping;
    assign _3953 = _1810 ? _1229 : _300;
    assign _3949 = _2682 ? _1228 : _300;
    assign _1882 = 2'b11;
    assign _3940 = f_policy == _1882;
    assign _3942 = _3940 ? _2389 : _300;
    assign _3939 = f_policy == _1229;
    assign _3944 = _3939 ? _1228 : _3942;
    assign _3938 = f_policy == _2389;
    assign _3946 = _3938 ? _2389 : _3944;
    assign _3947 = f_viol_now ? _3946 : _300;
    assign _1199 = f_chgmask3 & f_multi_eff;
    assign _1201 = _1199 == _1237;
    assign _1192 = _1152 == _1077;
    assign _1187 = 16'b0000000000000000;
    assign _1188 = _1152 == _1187;
    assign _1189 = _1188 & _1169;
    assign _1186 = _1128 == _1148;
    assign _1190 = _1186 | _1189;
    assign _1193 = _1127 ? _1192 : _1190;
    assign _1183 = _617[3:0];
    assign _1185 = _1183 == _1896;
    assign _1194 = _1185 | _1193;
    assign _1181 = _1152 == _1077;
    assign _1177 = _1152 == _1187;
    assign _1178 = _1177 & _1169;
    assign _1175 = _1128 == _1148;
    assign _1179 = _1175 | _1178;
    assign _1182 = _1127 ? _1181 : _1179;
    assign _1173 = _1139 == _1077;
    always @(posedge _278) begin
        if (_276)
            _1067 <= _1088;
        else
            _1067 <= _1064;
    end
    assign _1168 = { _1095,
                     _1067 };
    assign _1169 = _1125 < _1168;
    assign _1166 = _1139 == _1187;
    assign _1170 = _1166 & _1169;
    assign _1164 = _1128 == _1136;
    assign _1171 = _1164 | _1170;
    assign _1174 = _1127 ? _1173 : _1171;
    assign _1163 = _725[104:103];
    always @* begin
        case (_1163)
        0:
            _1195 <= vdd;
        1:
            _1195 <= _1174;
        2:
            _1195 <= _1182;
        default:
            _1195 <= _1194;
        endcase
    end
    assign _1162 = ~ _658;
    assign _1196 = _1162 | _1195;
    assign _1159 = _725[62:62];
    assign _1157 = _725[61:58];
    always @* begin
        case (_1157)
        0:
            _1158 <= vdd;
        1:
            _1158 <= _602;
        2:
            _1158 <= _606;
        3:
            _1158 <= _610;
        4:
            _1158 <= _612;
        5:
            _1158 <= _614;
        6:
            _1158 <= _618;
        7:
            _1158 <= _621;
        8:
            _1158 <= _626;
        9:
            _1158 <= _629;
        10:
            _1158 <= _632;
        11:
            _1158 <= _635;
        12:
            _1158 <= _640;
        13:
            _1158 <= _643;
        14:
            _1158 <= _646;
        default:
            _1158 <= _649;
        endcase
    end
    assign _1160 = _1158 ^ _1159;
    assign _1152 = _725[57:42];
    assign _1154 = _1152 == _1077;
    assign _1147 = 17'b00000000000000000;
    assign _1143 = _1025[57:42];
    assign _1144 = { gnd,
                     _1143 };
    assign _1145 = _1144 + _1132;
    always @(posedge _278) begin
        if (_276)
            _1148 <= _1147;
        else
            _1148 <= _1145;
    end
    assign _1149 = _1148 < _1128;
    assign _1150 = ~ _1149;
    assign _1139 = _725[41:26];
    assign _1141 = _1139 == _1187;
    assign _1056 = _1026[0:0];
    assign _1058 = _1056 ? _564 : _1088;
    assign _1053 = _1026[1:1];
    assign _1055 = _1053 ? _543 : _1088;
    assign _1059 = _1055 < _1058;
    assign _1060 = _1059 ? _1058 : _1055;
    assign _1048 = _1026[2:2];
    assign _1050 = _1048 ? _520 : _1088;
    assign _1045 = _1026[3:3];
    assign _1047 = _1045 ? _499 : _1088;
    assign _1051 = _1047 < _1050;
    assign _1052 = _1051 ? _1050 : _1047;
    assign _1061 = _1052 < _1060;
    assign _1062 = _1061 ? _1060 : _1052;
    assign _1038 = _1026[4:4];
    assign _1040 = _1038 ? _474 : _1088;
    assign _1035 = _1026[5:5];
    assign _1037 = _1035 ? _453 : _1088;
    assign _1041 = _1037 < _1040;
    assign _1042 = _1041 ? _1040 : _1037;
    assign _1030 = _1026[6:6];
    assign _1032 = _1030 ? _430 : _1088;
    assign _1026 = _1025[23:16];
    assign _1027 = _1026[7:7];
    assign _1029 = _1027 ? _409 : _1088;
    assign _1033 = _1029 < _1032;
    assign _1034 = _1033 ? _1032 : _1029;
    assign _1043 = _1034 < _1042;
    assign _1044 = _1043 ? _1042 : _1034;
    assign _1063 = _1044 < _1062;
    assign _1064 = _1063 ? _1062 : _1044;
    assign _1131 = 14'b00000000000000;
    assign _1132 = { _1131,
                     _1064 };
    assign _1025 = _384[511:400];
    assign _1129 = _1025[41:26];
    assign _1130 = { gnd,
                     _1129 };
    assign _1133 = _1130 + _1132;
    always @(posedge _278) begin
        if (_276)
            _1136 <= _1147;
        else
            _1136 <= _1133;
    end
    assign _1128 = { gnd,
                     _1125 };
    assign _1137 = _1128 < _1136;
    assign _1138 = ~ _1137;
    assign _1142 = _1138 | _1141;
    assign _1151 = _1142 & _1150;
    assign _1070 = _725[25:24];
    always @* begin
        case (_1070)
        0:
            _1125 <= _351;
        1:
            _1125 <= _354;
        2:
            _1125 <= _357;
        default:
            _1125 <= _357;
        endcase
    end
    assign _1127 = _1125 == _1077;
    assign _1155 = _1127 ? _1154 : _1151;
    assign _1119 = f_changed_all & f_chgmask3;
    assign _1121 = _1119 == _1237;
    assign _1122 = ~ _1121;
    assign _1118 = f_chgmask3 == _1237;
    assign _1123 = _1118 | _1122;
    assign _1112 = _725[7:0];
    assign _1110 = _725[15:8];
    assign _1111 = _323 ^ _1110;
    assign _1113 = _1111 & _1112;
    assign _1115 = _1113 == _1237;
    assign _1116 = f_valid3 & _1115;
    assign _1124 = _1116 & _1123;
    assign _1156 = _1124 & _1155;
    assign _1161 = _1156 & _1160;
    assign _1197 = _1161 & _1196;
    assign _1198 = f_in_eval & _1197;
    assign _1202 = _1198 & _1201;
    assign f_fire3 = _1202 & _740;
    assign _704 = f_chgmask0 & f_multi_eff;
    assign _706 = _704 == _1237;
    assign _692 = _592 == _1077;
    assign _688 = _592 == _1187;
    assign _689 = _688 & _669;
    assign _686 = _362 == _588;
    assign _690 = _686 | _689;
    assign _693 = _360 ? _692 : _690;
    assign _683 = _617[3:0];
    assign _685 = _683 == _1896;
    assign _694 = _685 | _693;
    assign _681 = _592 == _1077;
    assign _677 = _592 == _1187;
    assign _678 = _677 & _669;
    assign _675 = _362 == _588;
    assign _679 = _675 | _678;
    assign _682 = _360 ? _681 : _679;
    assign _673 = _579 == _1077;
    always @(posedge _278) begin
        if (_276)
            _667 <= _1088;
        else
            _667 <= _571;
    end
    assign _668 = { _1095,
                    _667 };
    assign _669 = _358 < _668;
    assign _663 = _579 == _1187;
    assign _670 = _663 & _669;
    assign _661 = _362 == _576;
    assign _671 = _661 | _670;
    assign _674 = _360 ? _673 : _671;
    assign _660 = _316[104:103];
    always @* begin
        case (_660)
        0:
            _695 <= vdd;
        1:
            _695 <= _674;
        2:
            _695 <= _682;
        default:
            _695 <= _694;
        endcase
    end
    assign _659 = ~ _658;
    assign _696 = _659 | _695;
    assign _651 = _316[62:62];
    assign _597 = _316[61:58];
    always @* begin
        case (_597)
        0:
            _650 <= vdd;
        1:
            _650 <= _602;
        2:
            _650 <= _606;
        3:
            _650 <= _610;
        4:
            _650 <= _612;
        5:
            _650 <= _614;
        6:
            _650 <= _618;
        7:
            _650 <= _621;
        8:
            _650 <= _626;
        9:
            _650 <= _629;
        10:
            _650 <= _632;
        11:
            _650 <= _635;
        12:
            _650 <= _640;
        13:
            _650 <= _643;
        14:
            _650 <= _646;
        default:
            _650 <= _649;
        endcase
    end
    assign _652 = _650 ^ _651;
    assign _592 = _316[57:42];
    assign _594 = _592 == _1077;
    assign _583 = _385[57:42];
    assign _584 = { gnd,
                    _583 };
    assign _585 = _584 + _572;
    always @(posedge _278) begin
        if (_276)
            _588 <= _1147;
        else
            _588 <= _585;
    end
    assign _589 = _588 < _362;
    assign _590 = ~ _589;
    assign _579 = _316[41:26];
    assign _581 = _579 == _1187;
    assign _545 = _389[0:0];
    assign _565 = _545 ? _564 : _1088;
    assign _524 = _389[1:1];
    assign _544 = _524 ? _543 : _1088;
    assign _566 = _544 < _565;
    assign _567 = _566 ? _565 : _544;
    assign _501 = _389[2:2];
    assign _521 = _501 ? _520 : _1088;
    assign _480 = _389[3:3];
    assign _500 = _480 ? _499 : _1088;
    assign _522 = _500 < _521;
    assign _523 = _522 ? _521 : _500;
    assign _568 = _523 < _567;
    assign _569 = _568 ? _567 : _523;
    assign _455 = _389[4:4];
    assign _475 = _455 ? _474 : _1088;
    assign _434 = _389[5:5];
    assign _454 = _434 ? _453 : _1088;
    assign _476 = _454 < _475;
    assign _477 = _476 ? _475 : _454;
    assign _411 = _389[6:6];
    assign _431 = _411 ? _430 : _1088;
    assign _389 = _385[23:16];
    assign _390 = _389[7:7];
    assign _410 = _390 ? _409 : _1088;
    assign _432 = _410 < _431;
    assign _433 = _432 ? _431 : _410;
    assign _478 = _433 < _477;
    assign _479 = _478 ? _477 : _433;
    assign _570 = _479 < _569;
    assign _571 = _570 ? _569 : _479;
    assign _572 = { _1131,
                    _571 };
    assign _385 = _384[175:64];
    assign _386 = _385[41:26];
    assign _387 = { gnd,
                    _386 };
    assign _573 = _387 + _572;
    always @(posedge _278) begin
        if (_276)
            _576 <= _1147;
        else
            _576 <= _573;
    end
    assign _362 = { gnd,
                    _358 };
    assign _577 = _362 < _576;
    assign _578 = ~ _577;
    assign _582 = _578 | _581;
    assign _591 = _582 & _590;
    assign _348 = _316[25:24];
    always @* begin
        case (_348)
        0:
            _358 <= _351;
        1:
            _358 <= _354;
        2:
            _358 <= _357;
        default:
            _358 <= _357;
        endcase
    end
    assign _360 = _358 == _1077;
    assign _595 = _360 ? _594 : _591;
    assign _342 = f_changed_all & f_chgmask0;
    assign _344 = _342 == _1237;
    assign _345 = ~ _344;
    assign _333 = f_chgmask0 == _1237;
    assign _346 = _333 | _345;
    assign _326 = _316[7:0];
    assign _324 = _316[15:8];
    assign _325 = _323 ^ _324;
    assign _327 = _325 & _326;
    assign _329 = _327 == _1237;
    assign _304 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _3923 = _367 + _1448;
    assign _1211 = 6'b000000;
    assign _113 = host_start_loc;
    assign _2683 = _2682 ? _2680 : _1212;
    assign _115 = host_recover_loc;
    assign _2670 = _1676 ? _115 : _2669;
    assign _116 = _2670;
    always @(posedge _278) begin
        if (_276)
            _2669 <= _1211;
        else
            _2669 <= _116;
    end
    assign _2673 = f_policy == _1229;
    assign _2674 = _2673 ? _2669 : _1212;
    assign _2675 = f_viol_now ? _2674 : _1212;
    assign _2684 = _1204 ? _2683 : _2675;
    assign _2671 = _300 == _1229;
    assign _2685 = _2671 ? _2684 : _1212;
    assign _2686 = _1676 ? _113 : _2685;
    assign _117 = _2686;
    always @(posedge _278) begin
        if (_276)
            _1212 <= _1211;
        else
            _1212 <= _117;
    end
    assign _2679 = _725[110:105];
    assign _2678 = _719[110:105];
    assign _2677 = _713[110:105];
    assign _2676 = _316[110:105];
    always @* begin
        case (f_winner)
        0:
            _2680 <= _2676;
        1:
            _2680 <= _2677;
        2:
            _2680 <= _2678;
        default:
            _2680 <= _2679;
        endcase
    end
    assign _2681 = _2680 == _1212;
    assign _2682 = ~ _2681;
    assign _3919 = _2682 ? _1088 : _367;
    assign _3914 = f_policy == _1229;
    assign _3916 = _3914 ? _1088 : _367;
    assign _1873 = f_changed_all & f_watch;
    assign _1875 = _1873 == _1237;
    assign _1876 = ~ _1875;
    assign _1871 = ~ _1204;
    assign _1872 = f_in_eval & _1871;
    assign f_unexp_now = _1872 & _1876;
    assign _2690 = ~ f_amb_now;
    assign _2691 = _1870 & _2690;
    assign _2693 = _2691 ? _1670 : _2689;
    assign _2694 = _1204 ? _2689 : _2693;
    assign _2689 = _1811 ? _1080 : _1868;
    assign _2687 = _300 == _1229;
    assign _2695 = _2687 ? _2694 : _2689;
    assign _118 = _2695;
    always @(posedge _278) begin
        if (_276)
            _1868 <= _1080;
        else
            _1868 <= _118;
    end
    assign _1869 = ~ _1868;
    assign _3905 = 16'b0000000000000001;
    assign _3906 = _351 + _3905;
    assign _3902 = _351 == _1077;
    assign _3903 = ~ _3902;
    assign _3904 = _3863 & _3903;
    assign _3907 = _3904 ? _3906 : _351;
    assign _3847 = _708[26:24];
    assign _3845 = _725[93:91];
    assign _3844 = _719[93:91];
    assign _3843 = _713[93:91];
    assign _3842 = _316[93:91];
    assign _1013 = f_chgmask2 & f_multi_eff;
    assign _1015 = _1013 == _1237;
    assign _1006 = _963 == _1077;
    assign _1002 = _963 == _1187;
    assign _1003 = _1002 & _983;
    assign _1000 = _899 == _959;
    assign _1004 = _1000 | _1003;
    assign _1007 = _898 ? _1006 : _1004;
    assign _997 = _617[3:0];
    assign _999 = _997 == _1896;
    assign _1008 = _999 | _1007;
    assign _995 = _963 == _1077;
    assign _991 = _963 == _1187;
    assign _992 = _991 & _983;
    assign _989 = _899 == _959;
    assign _993 = _989 | _992;
    assign _996 = _898 ? _995 : _993;
    assign _987 = _950 == _1077;
    always @(posedge _278) begin
        if (_276)
            _981 <= _1088;
        else
            _981 <= _942;
    end
    assign _982 = { _1095,
                    _981 };
    assign _983 = _896 < _982;
    assign _977 = _950 == _1187;
    assign _984 = _977 & _983;
    assign _975 = _899 == _947;
    assign _985 = _975 | _984;
    assign _988 = _898 ? _987 : _985;
    assign _974 = _719[104:103];
    always @* begin
        case (_974)
        0:
            _1009 <= vdd;
        1:
            _1009 <= _988;
        2:
            _1009 <= _996;
        default:
            _1009 <= _1008;
        endcase
    end
    assign _973 = ~ _658;
    assign _1010 = _973 | _1009;
    assign _970 = _719[62:62];
    assign _968 = _719[61:58];
    always @* begin
        case (_968)
        0:
            _969 <= vdd;
        1:
            _969 <= _602;
        2:
            _969 <= _606;
        3:
            _969 <= _610;
        4:
            _969 <= _612;
        5:
            _969 <= _614;
        6:
            _969 <= _618;
        7:
            _969 <= _621;
        8:
            _969 <= _626;
        9:
            _969 <= _629;
        10:
            _969 <= _632;
        11:
            _969 <= _635;
        12:
            _969 <= _640;
        13:
            _969 <= _643;
        14:
            _969 <= _646;
        default:
            _969 <= _649;
        endcase
    end
    assign _971 = _969 ^ _970;
    assign _963 = _719[57:42];
    assign _965 = _963 == _1077;
    assign _954 = _900[57:42];
    assign _955 = { gnd,
                    _954 };
    assign _956 = _955 + _943;
    always @(posedge _278) begin
        if (_276)
            _959 <= _1147;
        else
            _959 <= _956;
    end
    assign _960 = _959 < _899;
    assign _961 = ~ _960;
    assign _950 = _719[41:26];
    assign _952 = _950 == _1187;
    assign _934 = _904[0:0];
    assign _936 = _934 ? _564 : _1088;
    assign _931 = _904[1:1];
    assign _933 = _931 ? _543 : _1088;
    assign _937 = _933 < _936;
    assign _938 = _937 ? _936 : _933;
    assign _926 = _904[2:2];
    assign _928 = _926 ? _520 : _1088;
    assign _923 = _904[3:3];
    assign _925 = _923 ? _499 : _1088;
    assign _929 = _925 < _928;
    assign _930 = _929 ? _928 : _925;
    assign _939 = _930 < _938;
    assign _940 = _939 ? _938 : _930;
    assign _916 = _904[4:4];
    assign _918 = _916 ? _474 : _1088;
    assign _913 = _904[5:5];
    assign _915 = _913 ? _453 : _1088;
    assign _919 = _915 < _918;
    assign _920 = _919 ? _918 : _915;
    assign _908 = _904[6:6];
    assign _910 = _908 ? _430 : _1088;
    assign _904 = _900[23:16];
    assign _905 = _904[7:7];
    assign _907 = _905 ? _409 : _1088;
    assign _911 = _907 < _910;
    assign _912 = _911 ? _910 : _907;
    assign _921 = _912 < _920;
    assign _922 = _921 ? _920 : _912;
    assign _941 = _922 < _940;
    assign _942 = _941 ? _940 : _922;
    assign _943 = { _1131,
                    _942 };
    assign _900 = _384[399:288];
    assign _901 = _900[41:26];
    assign _902 = { gnd,
                    _901 };
    assign _944 = _902 + _943;
    always @(posedge _278) begin
        if (_276)
            _947 <= _1147;
        else
            _947 <= _944;
    end
    assign _899 = { gnd,
                    _896 };
    assign _948 = _899 < _947;
    assign _949 = ~ _948;
    assign _953 = _949 | _952;
    assign _962 = _953 & _961;
    assign _895 = _719[25:24];
    always @* begin
        case (_895)
        0:
            _896 <= _351;
        1:
            _896 <= _354;
        2:
            _896 <= _357;
        default:
            _896 <= _357;
        endcase
    end
    assign _898 = _896 == _1077;
    assign _966 = _898 ? _965 : _962;
    assign _889 = f_changed_all & f_chgmask2;
    assign _891 = _889 == _1237;
    assign _892 = ~ _891;
    assign _888 = f_chgmask2 == _1237;
    assign _893 = _888 | _892;
    assign _882 = _719[7:0];
    assign _880 = _719[15:8];
    assign _881 = _323 ^ _880;
    assign _883 = _881 & _882;
    assign _885 = _883 == _1237;
    assign _886 = f_valid2 & _885;
    assign _894 = _886 & _893;
    assign _967 = _894 & _966;
    assign _972 = _967 & _971;
    assign _1011 = _972 & _1010;
    assign _1012 = f_in_eval & _1011;
    assign _1016 = _1012 & _1015;
    assign f_fire2 = _1016 & _740;
    assign _1020 = f_fire2 ? _1229 : _1882;
    assign f_policy = _708[59:58];
    assign _739 = f_policy == _1228;
    assign f_chgmask3 = _725[23:16];
    assign f_valid3 = _725[111:111];
    assign _729 = f_valid3 ? f_chgmask3 : _1237;
    assign f_chgmask2 = _719[23:16];
    assign f_valid2 = _719[111:111];
    assign _723 = f_valid2 ? f_chgmask2 : _1237;
    assign _717 = f_valid1 ? f_chgmask1 : _1237;
    assign f_chgmask0 = _316[23:16];
    assign _711 = f_valid0 ? f_chgmask0 : _1237;
    assign f_watch = _708[57:50];
    assign _712 = f_watch | _711;
    assign _718 = _712 | _717;
    assign _724 = _718 | _723;
    assign f_relevant = _724 | _729;
    assign _731 = f_multi_eff & f_relevant;
    assign _733 = _731 == _1237;
    assign _734 = ~ _733;
    assign f_amb_now = f_in_eval & _734;
    assign _736 = ~ f_amb_now;
    assign _740 = _736 | _739;
    assign _702 = _336 & f_chg_now;
    assign _2700 = _336 & f_chg_now;
    assign _2701 = _701 | _2700;
    assign _2697 = _300 == _1229;
    assign _2699 = _2697 ? _1237 : _701;
    assign _2696 = _300 == _1228;
    assign _2702 = _2696 ? _2701 : _2699;
    assign _2704 = _1676 ? _1237 : _2702;
    assign _119 = _2704;
    always @(posedge _278) begin
        if (_276)
            _701 <= _1237;
        else
            _701 <= _119;
    end
    assign f_multi_eff = _701 | _702;
    assign _875 = f_chgmask1 & f_multi_eff;
    assign _877 = _875 == _1237;
    assign _868 = _825 == _1077;
    assign _864 = _825 == _1187;
    assign _865 = _864 & _845;
    assign _862 = _761 == _821;
    assign _866 = _862 | _865;
    assign _869 = _760 ? _868 : _866;
    assign _859 = _617[3:0];
    assign _861 = _859 == _1896;
    assign _870 = _861 | _869;
    assign _857 = _825 == _1077;
    assign _853 = _825 == _1187;
    assign _854 = _853 & _845;
    assign _851 = _761 == _821;
    assign _855 = _851 | _854;
    assign _858 = _760 ? _857 : _855;
    assign _849 = _812 == _1077;
    always @(posedge _278) begin
        if (_276)
            _843 <= _1088;
        else
            _843 <= _804;
    end
    assign _844 = { _1095,
                    _843 };
    assign _845 = _758 < _844;
    assign _839 = _812 == _1187;
    assign _846 = _839 & _845;
    assign _837 = _761 == _809;
    assign _847 = _837 | _846;
    assign _850 = _760 ? _849 : _847;
    assign _836 = _713[104:103];
    always @* begin
        case (_836)
        0:
            _871 <= vdd;
        1:
            _871 <= _850;
        2:
            _871 <= _858;
        default:
            _871 <= _870;
        endcase
    end
    assign _121 = host_role;
    assign _2705 = _1676 ? _121 : _656;
    assign _122 = _2705;
    always @(posedge _278) begin
        if (_276)
            _656 <= _2389;
        else
            _656 <= _122;
    end
    assign _658 = _656 == _1229;
    assign _835 = ~ _658;
    assign _872 = _835 | _871;
    assign _832 = _713[62:62];
    assign _2709 = _1605 ? _1670 : _2707;
    assign _2707 = _1575 ? _1670 : _649;
    assign _2710 = _1560 ? _2709 : _2707;
    assign _2712 = _1459 ? _1080 : _2710;
    assign _2714 = _1457 ? _1080 : _2712;
    assign _123 = _2714;
    always @(posedge _278) begin
        if (_276)
            _649 <= _1080;
        else
            _649 <= _123;
    end
    assign _125 = host_lane1_sync_mask;
    assign _127 = host_lane1_sync;
    assign _2720 = _1701 ? _2719 : _2717;
    assign _2721 = _1605 ? _2717 : _2720;
    assign _2722 = _1560 ? _2721 : _2717;
    assign _2724 = _1459 ? _1187 : _2722;
    assign _128 = _2724;
    always @(posedge _278) begin
        if (_276)
            _2717 <= _1187;
        else
            _2717 <= _128;
    end
    assign _2718 = _2717[14:0];
    assign _2719 = { _2718,
                     _1596 };
    assign _2725 = _2719 ^ _127;
    assign _2726 = _2725 & _125;
    assign _2728 = _2726 == _1187;
    assign _2730 = _2728 ? _1670 : _646;
    assign _2731 = _1701 ? _2730 : _646;
    assign _2732 = _1605 ? _646 : _2731;
    assign _2733 = _1560 ? _2732 : _646;
    assign _2735 = _1459 ? _1080 : _2733;
    assign _2737 = _1457 ? _1080 : _2735;
    assign _129 = _2737;
    always @(posedge _278) begin
        if (_276)
            _646 <= _1080;
        else
            _646 <= _129;
    end
    assign _2750 = _1596 == _2749;
    assign _2751 = ~ _2750;
    assign _2753 = _2744 ? _2752 : _2740;
    assign _2754 = _1701 ? _2753 : _2740;
    assign _2755 = _1605 ? _2740 : _2754;
    assign _2756 = _1560 ? _2755 : _2740;
    assign _2758 = _1459 ? _1080 : _2756;
    assign _130 = _2758;
    always @(posedge _278) begin
        if (_276)
            _2740 <= _1080;
        else
            _2740 <= _130;
    end
    assign _2752 = _2740 | _2751;
    assign _2761 = ~ _2752;
    assign _2759 = 6'b000001;
    assign _2760 = _1730 == _2759;
    assign _2762 = _2760 ? _2761 : _643;
    assign _2763 = _2744 ? _2762 : _643;
    assign _2764 = _1701 ? _2763 : _643;
    assign _2765 = _1605 ? _643 : _2764;
    assign _2766 = _1560 ? _2765 : _643;
    assign _2768 = _1459 ? _1080 : _2766;
    assign _2770 = _1457 ? _1080 : _2768;
    assign _131 = _2770;
    always @(posedge _278) begin
        if (_276)
            _643 <= _1080;
        else
            _643 <= _131;
    end
    assign _2774 = _1447 ? _1670 : _2772;
    assign _2772 = _1417 ? _1670 : _635;
    assign _2775 = _1402 ? _2774 : _2772;
    assign _2777 = _1301 ? _1080 : _2775;
    assign _2779 = _1299 ? _1080 : _2777;
    assign _132 = _2779;
    always @(posedge _278) begin
        if (_276)
            _635 <= _1080;
        else
            _635 <= _132;
    end
    assign _134 = host_lane0_sync_mask;
    assign _136 = host_lane0_sync;
    assign _2785 = _1751 ? _2784 : _2782;
    assign _2786 = _1447 ? _2782 : _2785;
    assign _2787 = _1402 ? _2786 : _2782;
    assign _2789 = _1301 ? _1187 : _2787;
    assign _137 = _2789;
    always @(posedge _278) begin
        if (_276)
            _2782 <= _1187;
        else
            _2782 <= _137;
    end
    assign _2783 = _2782[14:0];
    assign _2784 = { _2783,
                     _1438 };
    assign _2790 = _2784 ^ _136;
    assign _2791 = _2790 & _134;
    assign _2793 = _2791 == _1187;
    assign _2795 = _2793 ? _1670 : _632;
    assign _2796 = _1751 ? _2795 : _632;
    assign _2797 = _1447 ? _632 : _2796;
    assign _2798 = _1402 ? _2797 : _632;
    assign _2800 = _1301 ? _1080 : _2798;
    assign _2802 = _1299 ? _1080 : _2800;
    assign _138 = _2802;
    always @(posedge _278) begin
        if (_276)
            _632 <= _1080;
        else
            _632 <= _138;
    end
    assign _2815 = _1438 == _2814;
    assign _2816 = ~ _2815;
    assign _2818 = _2809 ? _2817 : _2805;
    assign _2819 = _1751 ? _2818 : _2805;
    assign _2820 = _1447 ? _2805 : _2819;
    assign _2821 = _1402 ? _2820 : _2805;
    assign _2823 = _1301 ? _1080 : _2821;
    assign _139 = _2823;
    always @(posedge _278) begin
        if (_276)
            _2805 <= _1080;
        else
            _2805 <= _139;
    end
    assign _2817 = _2805 | _2816;
    assign _2826 = ~ _2817;
    assign _2825 = _1780 == _2759;
    assign _2827 = _2825 ? _2826 : _629;
    assign _2828 = _2809 ? _2827 : _629;
    assign _2829 = _1751 ? _2828 : _629;
    assign _2830 = _1447 ? _629 : _2829;
    assign _2831 = _1402 ? _2830 : _629;
    assign _2833 = _1301 ? _1080 : _2831;
    assign _2835 = _1299 ? _1080 : _2833;
    assign _140 = _2835;
    always @(posedge _278) begin
        if (_276)
            _629 <= _1080;
        else
            _629 <= _140;
    end
    assign _142 = host_match_addr;
    assign _620 = _142[6:0];
    assign _619 = _609[7:1];
    assign _621 = _619 == _620;
    assign _616 = 16'b1010110011100001;
    assign _2840 = _617[10:10];
    assign _2839 = _617[12:12];
    assign _2841 = _2839 ^ _2840;
    assign _2838 = _617[13:13];
    assign _2842 = _2838 ^ _2841;
    assign _2837 = _617[15:15];
    assign _2843 = _2837 ^ _2842;
    assign _2836 = _617[14:0];
    assign _2844 = { _2836,
                     _2843 };
    assign _143 = _2844;
    always @(posedge _278) begin
        if (_276)
            _617 <= _616;
        else
            _617 <= _143;
    end
    assign _618 = _617[0:0];
    assign _2863 = _149 + _2215;
    assign _2861 = _149 - _2215;
    assign _2864 = _2278 ? _2863 : _2861;
    assign _1894 = _149 == _1896;
    assign _2327 = ~ _1894;
    assign _145 = host_rx_pop;
    assign _2328 = _145 & _2327;
    assign _2277 = ~ _614;
    assign _2310 = _1807 & _1821;
    assign _2848 = _2310 ? _1807 : _1080;
    assign _2304 = ~ _1807;
    assign _2305 = _2304 & _1821;
    assign _2846 = _2305 ? _1670 : _1807;
    assign _1820 = _1818 == _1882;
    assign _1821 = _1811 & _1820;
    assign _1827 = _1807 | _1821;
    assign _1824 = _1700 | _1749;
    assign _1825 = ~ _1824;
    assign _1823 = ~ _1799;
    assign _1826 = _1823 & _1825;
    assign _1828 = _1826 & _1827;
    assign _2849 = _1828 ? _2848 : _2846;
    assign _146 = _2849;
    always @(posedge _278) begin
        if (_276)
            _1807 <= _1080;
        else
            _1807 <= _146;
    end
    assign _2857 = _1807 | _1821;
    assign _2301 = _1700 & _1749;
    assign _2853 = _2301 ? _1700 : _1080;
    assign _2285 = ~ _1700;
    assign _2286 = _2285 & _1749;
    assign _2851 = _2286 ? _1670 : _1700;
    assign _1747 = ~ _1713;
    assign _1741 = _1710 + _1448;
    assign _1736 = ~ _1590;
    assign _1735 = _1726 & _1734;
    assign _1737 = _1735 & _1736;
    assign _1738 = _1737 & _1706;
    assign _1739 = _1707 | _1738;
    assign _1742 = _1739 ? _1741 : _1710;
    assign _1744 = _1742 == _1088;
    assign _1745 = ~ _1744;
    assign _1716 = _1715 & _197;
    assign _1746 = _1716 & _1745;
    assign _1748 = _1746 & _1747;
    assign _1712 = _1710 == _2272;
    assign _1713 = _1707 & _1712;
    assign _1749 = _1713 | _1748;
    assign _1801 = _1700 | _1749;
    assign _1800 = ~ _1799;
    assign _1802 = _1800 & _1801;
    assign _2854 = _1802 ? _2853 : _2851;
    assign _147 = _2854;
    always @(posedge _278) begin
        if (_276)
            _1700 <= _1080;
        else
            _1700 <= _147;
    end
    assign _2855 = _1700 | _1749;
    assign _1797 = ~ _1763;
    assign _1791 = _1760 + _1448;
    assign _1786 = ~ _1432;
    assign _1785 = _1776 & _1784;
    assign _1787 = _1785 & _1786;
    assign _1788 = _1787 & _1756;
    assign _1789 = _1757 | _1788;
    assign _1792 = _1789 ? _1791 : _1760;
    assign _1794 = _1792 == _1088;
    assign _1795 = ~ _1794;
    assign _1766 = _1765 & _249;
    assign _1796 = _1766 & _1795;
    assign _1798 = _1796 & _1797;
    assign _1762 = _1760 == _2272;
    assign _1763 = _1757 & _1762;
    assign _1799 = _1763 | _1798;
    assign _2856 = _1799 | _2855;
    assign _2858 = _2856 | _2857;
    assign _148 = _2858;
    assign _2278 = _148 & _2277;
    assign _2859 = _2278 ^ _2328;
    assign _2865 = _2859 ? _2864 : _149;
    always @(posedge _278) begin
        if (_276)
            _2868 <= _1896;
        else
            _2868 <= _2865;
    end
    assign _149 = _2868;
    assign _614 = _149 == _1688;
    assign _2885 = _609[6:0];
    assign _2886 = { _2885,
                     _2882 };
    assign _2883 = _609[7:1];
    assign _2881 = _323[7:7];
    assign _2880 = _323[6:6];
    assign _2879 = _323[5:5];
    assign _2878 = _323[4:4];
    assign _2877 = _323[3:3];
    assign _2876 = _323[2:2];
    assign _2875 = _323[1:1];
    assign _2874 = _323[0:0];
    assign _2872 = _725[102:100];
    assign _2871 = _719[102:100];
    assign _2870 = _713[102:100];
    assign _2869 = _316[102:100];
    always @* begin
        case (f_winner)
        0:
            _2873 <= _2869;
        1:
            _2873 <= _2870;
        2:
            _2873 <= _2871;
        default:
            _2873 <= _2872;
        endcase
    end
    always @* begin
        case (_2873)
        0:
            _2882 <= _2874;
        1:
            _2882 <= _2875;
        2:
            _2882 <= _2876;
        3:
            _2882 <= _2877;
        4:
            _2882 <= _2878;
        5:
            _2882 <= _2879;
        6:
            _2882 <= _2880;
        default:
            _2882 <= _2881;
        endcase
    end
    assign _2884 = { _2882,
                     _2883 };
    assign _1815 = _725[97:96];
    assign _1814 = _719[97:96];
    assign _1813 = _713[97:96];
    assign _1812 = _316[97:96];
    always @* begin
        case (f_winner)
        0:
            _1816 <= _1812;
        1:
            _1816 <= _1813;
        2:
            _1816 <= _1814;
        default:
            _1816 <= _1815;
        endcase
    end
    assign _1818 = _1810 ? _2389 : _1816;
    always @* begin
        case (_1818)
        0:
            _2887 <= _609;
        1:
            _2887 <= _2884;
        2:
            _2887 <= _2886;
        default:
            _2887 <= _609;
        endcase
    end
    assign _2888 = _1811 ? _2887 : _609;
    assign _150 = _2888;
    always @(posedge _278) begin
        if (_276)
            _609 <= _1237;
        else
            _609 <= _150;
    end
    assign _610 = _609[0:0];
    assign _3658 = _605[7:1];
    assign _3659 = { vdd,
                     _3658 };
    assign _3656 = _3648[7:7];
    assign _3655 = _3648[6:6];
    assign _3654 = _3648[5:5];
    assign _3653 = _3648[4:4];
    assign _3652 = _3648[3:3];
    assign _3651 = _3648[2:2];
    assign _3650 = _3648[1:1];
    assign _3649 = _3648[0:0];
    assign _3657 = { _3649,
                     _3650,
                     _3651,
                     _3652,
                     _3653,
                     _3654,
                     _3655,
                     _3656 };
    assign _3641 = _255 + _2215;
    assign _3639 = _255 - _2215;
    assign _3642 = _2903 ? _3641 : _3639;
    assign _3312 = ~ _612;
    assign _3633 = ~ _612;
    assign _1717 = ~ _197;
    assign _3267 = ~ _195;
    assign _3268 = _197 & _3267;
    assign _3271 = _3268 ? _1228 : _1229;
    assign _3260 = ~ _1734;
    assign _3261 = _1726 & _3260;
    assign _3262 = _640 | _3261;
    assign _3263 = _3262 | _3252;
    assign _3265 = _3263 ? _1229 : _3259;
    assign _3246 = _1588 + _1448;
    assign _3243 = _1588 + _1448;
    assign _3239 = vdd == _1600;
    assign _3237 = _1588 == _1088;
    assign _3238 = ~ _3237;
    assign _3240 = _3238 & _3239;
    assign _3244 = _3240 ? _3243 : _1448;
    assign _3235 = _175 == _1229;
    assign _3247 = _3235 ? _3246 : _3244;
    assign _3248 = _3247 == _153;
    assign _3229 = _1588 + _1448;
    assign _3225 = gnd == _1600;
    assign _3223 = _1588 == _1088;
    assign _3224 = ~ _3223;
    assign _3226 = _3224 & _3225;
    assign _3230 = _3226 ? _3229 : _1448;
    assign _3221 = _175 == _1229;
    assign _3232 = _3221 ? _1088 : _3230;
    assign _3233 = _3232 == _153;
    assign _3249 = _1596 ? _3248 : _3233;
    assign _3250 = _1585 & _3249;
    assign _3251 = ~ _3250;
    assign _3217 = _1730 == _2759;
    assign _3215 = _1730 == _1211;
    assign _3218 = _2744 ? _3217 : _3215;
    assign _3210 = _1705 + _3905;
    assign _3211 = _3210 == _169;
    assign _3208 = _1705 == _169;
    assign _3212 = _1707 ? _3211 : _3208;
    assign _3206 = ~ _1605;
    assign _3207 = _1560 & _3206;
    assign _3213 = _3207 & _3212;
    assign _3219 = _3213 & _3218;
    assign _3252 = _3219 & _3251;
    assign _3254 = _3252 ? _1882 : _3205;
    assign _3256 = _1605 ? _2389 : _3254;
    assign _3202 = _1734 ? _3200 : _1882;
    assign _3198 = _1486 & _1484;
    assign _3200 = _3198 ? _1229 : _638;
    assign _3203 = _1726 ? _3202 : _3200;
    assign _2978 = _1734 ? _2977 : _2891;
    assign _2979 = _1726 ? _2978 : _2891;
    assign _151 = _2979;
    always @(posedge _278) begin
        if (_276)
            _2891 <= _1080;
        else
            _2891 <= _151;
    end
    assign _3128 = ~ _2977;
    assign _3126 = ~ _1572;
    assign _3127 = _2977 ? _1572 : _3126;
    always @* begin
        case (_191)
        0:
            _3129 <= _2977;
        1:
            _3129 <= _3127;
        2:
            _3129 <= _3128;
        default:
            _3129 <= _2977;
        endcase
    end
    assign _153 = host_lane1_stuff_len;
    assign _3110 = _1588 + _1448;
    assign _3111 = _1596 ? _3110 : _1088;
    assign _3106 = _1588 + _1448;
    assign _3102 = _1596 == _1600;
    assign _3100 = _1588 == _1088;
    assign _3101 = ~ _3100;
    assign _3103 = _3101 & _3102;
    assign _3107 = _3103 ? _3106 : _1448;
    assign _3098 = _175 == _1229;
    assign _3112 = _3098 ? _3111 : _3107;
    assign _3113 = _1605 ? _3096 : _3112;
    assign _3092 = _1588 + _1448;
    assign _3093 = _2977 ? _3092 : _1088;
    assign _3088 = _1588 + _1448;
    assign _2974 = _2966[7:7];
    assign _2973 = _2966[6:6];
    assign _2972 = _2966[5:5];
    assign _2971 = _2966[4:4];
    assign _2970 = _2966[3:3];
    assign _2969 = _2966[2:2];
    assign _2968 = _2966[1:1];
    assign _2964 = _2956[7:7];
    assign _2963 = _2956[6:6];
    assign _2962 = _2956[5:5];
    assign _2961 = _2956[4:4];
    assign _2960 = _2956[3:3];
    assign _2959 = _2956[2:2];
    assign _2958 = _2956[1:1];
    assign _2955 = _612 ? _1235 : _2953;
    assign _2295 = _2292[7:1];
    assign _2296 = { _1596,
                     _2295 };
    assign _2293 = _2292[6:0];
    assign _2294 = { _2293,
                     _1596 };
    assign _2297 = _156 ? _2296 : _2294;
    assign _2984 = _1707 ? _2297 : _2983;
    assign _2985 = _1701 ? _2984 : _2983;
    assign _2986 = _1605 ? _2983 : _2985;
    assign _2980 = _1706 ? _2956 : _2292;
    assign _2981 = _1590 ? _2292 : _2980;
    assign _2982 = _1734 ? _2981 : _2292;
    assign _2983 = _1726 ? _2982 : _2292;
    assign _2987 = _1560 ? _2986 : _2983;
    assign _154 = _2987;
    always @(posedge _278) begin
        if (_276)
            _2292 <= _1237;
        else
            _2292 <= _154;
    end
    assign _2895 = _1710 == _1088;
    assign _2892 = ~ _1590;
    assign _2893 = _2892 & _1706;
    assign _2896 = _2893 & _2895;
    assign _2956 = _2896 ? _2955 : _2292;
    assign _2957 = _2956[0:0];
    assign _2965 = { _2957,
                     _2958,
                     _2959,
                     _2960,
                     _2961,
                     _2962,
                     _2963,
                     _2964 };
    assign _156 = host_lane1_lsb_first;
    assign _2966 = _156 ? _2956 : _2965;
    assign _2967 = _2966[0:0];
    assign _2995 = _1710 + _1448;
    assign _2996 = _1707 ? _2995 : _2993;
    assign _2997 = _1701 ? _2996 : _2993;
    assign _2998 = _1605 ? _2993 : _2997;
    assign _2989 = _1710 + _1448;
    assign _2990 = _1706 ? _2989 : _1710;
    assign _2991 = _1590 ? _1710 : _2990;
    assign _2992 = _1734 ? _2991 : _1710;
    assign _2993 = _1726 ? _2992 : _1710;
    assign _2999 = _1560 ? _2998 : _2993;
    assign _3001 = _1459 ? _1088 : _2999;
    assign _157 = _3001;
    always @(posedge _278) begin
        if (_276)
            _1710 <= _1088;
        else
            _1710 <= _157;
    end
    always @* begin
        case (_1710)
        0:
            _2975 <= _2967;
        1:
            _2975 <= _2968;
        2:
            _2975 <= _2969;
        3:
            _2975 <= _2970;
        4:
            _2975 <= _2971;
        5:
            _2975 <= _2972;
        6:
            _2975 <= _2973;
        default:
            _2975 <= _2974;
        endcase
    end
    assign _159 = host_lane1_crc_inv;
    assign _161 = host_lane1_init;
    assign _3043 = _2747[30:0];
    assign _3045 = { _3043,
                     _1080 };
    assign _3037 = _2747[31:31];
    assign _3038 = _1596 ^ _3037;
    assign _3040 = _3038 ? _166 : _1904;
    assign _3034 = _2747[30:0];
    assign _3036 = { _3034,
                     _1080 };
    assign _3041 = _3036 ^ _3040;
    assign _3042 = _1707 ? _3041 : _3033;
    assign _163 = host_lane1_crc_width;
    assign _3011 = _1730 - _2759;
    assign _3012 = _2744 ? _3011 : _3009;
    assign _3013 = _1701 ? _3012 : _3009;
    assign _3014 = _1605 ? _3009 : _3013;
    assign _3005 = _1730 - _2759;
    assign _3006 = _1706 ? _1730 : _3005;
    assign _3007 = _1590 ? _1730 : _3006;
    assign _3008 = _1734 ? _3007 : _1730;
    assign _3009 = _1726 ? _3008 : _1730;
    assign _3015 = _1560 ? _3014 : _3009;
    assign _3016 = _3003 ? _163 : _3015;
    assign _3018 = _1459 ? _1211 : _3016;
    assign _164 = _3018;
    always @(posedge _278) begin
        if (_276)
            _1730 <= _1211;
        else
            _1730 <= _164;
    end
    assign _1732 = _1730 == _1211;
    assign _1733 = ~ _1732;
    assign _2742 = ~ _1706;
    assign _2741 = _1560 & _1701;
    assign _2743 = _2741 & _2742;
    assign _2744 = _2743 & _1733;
    assign _3046 = _2744 ? _3045 : _3042;
    assign _3047 = _1701 ? _3046 : _3033;
    assign _3048 = _1605 ? _3033 : _3047;
    assign _166 = host_lane1_poly;
    assign _3025 = _2747[31:31];
    assign _3026 = _2977 ^ _3025;
    assign _3028 = _3026 ? _166 : _1904;
    assign _3022 = _2747[30:0];
    assign _3024 = { _3022,
                     _1080 };
    assign _3029 = _3024 ^ _3028;
    assign _3019 = _2747[30:0];
    assign _3021 = { _3019,
                     _1080 };
    assign _3030 = _1706 ? _3029 : _3021;
    assign _3031 = _1590 ? _2747 : _3030;
    assign _3032 = _1734 ? _3031 : _2747;
    assign _3033 = _1726 ? _3032 : _2747;
    assign _3049 = _1560 ? _3048 : _3033;
    assign _3050 = _1459 ? _161 : _3049;
    assign _3052 = _1457 ? _1904 : _3050;
    assign _167 = _3052;
    always @(posedge _278) begin
        if (_276)
            _2747 <= _1904;
        else
            _2747 <= _167;
    end
    assign _2748 = _2747[31:31];
    assign _2749 = _2748 ^ _159;
    assign _169 = host_lane1_frame_bits;
    assign _3072 = _1705 + _3905;
    assign _1702 = _1560 & _1701;
    assign _1707 = _1702 & _1706;
    assign _3073 = _1707 ? _3072 : _3070;
    assign _1701 = ~ _1590;
    assign _3074 = _1701 ? _3073 : _3070;
    assign _3055 = _1605 ? _3054 : _1596;
    assign _3053 = _1734 ? _2977 : _1600;
    assign _3054 = _1726 ? _3053 : _1600;
    assign _3056 = _1560 ? _3055 : _3054;
    assign _3058 = _1459 ? _1670 : _3056;
    assign _170 = _3058;
    always @(posedge _278) begin
        if (_276)
            _1600 <= vdd;
        else
            _1600 <= _170;
    end
    assign _1601 = ~ _1600;
    assign _1598 = _175 == _1228;
    assign _1602 = _1598 ? _1601 : gnd;
    assign _3060 = _191 == _1228;
    assign _3061 = _3060 ? _1471 : _1594;
    assign _3062 = _1560 ? _3061 : _1594;
    assign _3064 = _1459 ? _1670 : _3062;
    assign _171 = _3064;
    always @(posedge _278) begin
        if (_276)
            _1594 <= vdd;
        else
            _1594 <= _171;
    end
    assign _1595 = _1471 == _1594;
    assign _1592 = _191 == _1228;
    assign _1596 = _1592 ? _1595 : _1471;
    assign _1603 = _1596 == _1602;
    assign _1604 = ~ _1603;
    assign _1605 = _1590 & _1604;
    assign _3075 = _1605 ? _3070 : _3074;
    assign _3066 = _1705 + _3905;
    assign _3067 = _1706 ? _3066 : _1705;
    assign _3068 = _1590 ? _1705 : _3067;
    assign _3069 = _1734 ? _3068 : _1705;
    assign _3070 = _1726 ? _3069 : _1705;
    assign _3076 = _1560 ? _3075 : _3070;
    assign _3078 = _1459 ? _1187 : _3076;
    assign _172 = _3078;
    always @(posedge _278) begin
        if (_276)
            _1705 <= _1187;
        else
            _1705 <= _172;
    end
    assign _1706 = _1705 < _169;
    assign _2976 = _1706 ? _2975 : _2749;
    assign _2977 = _1590 ? _1602 : _2976;
    assign _3084 = _2977 == _1600;
    assign _3082 = _1588 == _1088;
    assign _3083 = ~ _3082;
    assign _3085 = _3083 & _3084;
    assign _3089 = _3085 ? _3088 : _1448;
    assign _3080 = _175 == _1229;
    assign _3094 = _3080 ? _3093 : _3089;
    assign _3095 = _1734 ? _3094 : _1588;
    assign _3096 = _1726 ? _3095 : _1588;
    assign _3114 = _1560 ? _3113 : _3096;
    assign _3116 = _1459 ? _1088 : _3114;
    assign _173 = _3116;
    always @(posedge _278) begin
        if (_276)
            _1588 <= _1088;
        else
            _1588 <= _173;
    end
    assign _1589 = _1588 == _153;
    assign _175 = host_lane1_stuff;
    assign _1584 = _175 == _2389;
    assign _1585 = ~ _1584;
    assign _1590 = _1585 & _1589;
    assign _1727 = _1590 | _1706;
    assign _1734 = _1727 | _1733;
    assign _3130 = _1734 ? _3129 : _1670;
    assign _3131 = _1726 ? _3130 : _1572;
    assign _1722 = _1530 == _1187;
    assign _1720 = _1495 == _1187;
    assign _1723 = _1523 ? _1722 : _1720;
    assign _1724 = _1491 ? vdd : _1723;
    assign _1725 = _195 ? _1558 : _1724;
    assign _3123 = ~ _1725;
    assign _3120 = _191 == _1229;
    assign _3117 = ~ _197;
    assign _3118 = _1461 & _3117;
    assign _3121 = _3118 & _3120;
    assign _3122 = _3121 & _1559;
    assign _3124 = _3122 & _3123;
    assign _3132 = _3124 ? _2891 : _3131;
    assign _3134 = _1575 ? _1670 : _3132;
    assign _3136 = _1715 ? _1670 : _3134;
    assign _3138 = _1459 ? _1670 : _3136;
    assign _3140 = _1457 ? _1670 : _3138;
    assign _176 = _3140;
    always @(posedge _278) begin
        if (_276)
            _1572 <= vdd;
        else
            _1572 <= _176;
    end
    assign _1573 = _1471 == _1572;
    assign _1574 = ~ _1573;
    assign _1567 = _191 == _1229;
    assign _1568 = ~ _1567;
    assign _1564 = ~ _195;
    assign _178 = host_lane1_readback;
    assign _1561 = ~ _197;
    assign _1562 = _1461 & _1561;
    assign _1563 = _1562 & _178;
    assign _1565 = _1563 & _1564;
    assign _1569 = _1565 & _1568;
    assign _1570 = _1569 & _1559;
    assign _1575 = _1570 & _1574;
    assign _3205 = _1575 ? _2389 : _3203;
    assign _1556 = ~ _1544;
    assign _1557 = _1553 & _1556;
    assign _1552 = _339[7:7];
    assign _1551 = _339[6:6];
    assign _1550 = _339[5:5];
    assign _1549 = _339[4:4];
    assign _1548 = _339[3:3];
    assign _1547 = _339[2:2];
    assign _1546 = _339[1:1];
    assign _1545 = _339[0:0];
    always @* begin
        case (_180)
        0:
            _1553 <= _1545;
        1:
            _1553 <= _1546;
        2:
            _1553 <= _1547;
        3:
            _1553 <= _1548;
        4:
            _1553 <= _1549;
        5:
            _1553 <= _1550;
        6:
            _1553 <= _1551;
        default:
            _1553 <= _1552;
        endcase
    end
    assign _1554 = ~ _1553;
    assign _1543 = _323[7:7];
    assign _1542 = _323[6:6];
    assign _1541 = _323[5:5];
    assign _1540 = _323[4:4];
    assign _1539 = _323[3:3];
    assign _1538 = _323[2:2];
    assign _1537 = _323[1:1];
    assign _1536 = _323[0:0];
    assign _180 = host_lane1_clk_pin;
    always @* begin
        case (_180)
        0:
            _1544 <= _1536;
        1:
            _1544 <= _1537;
        2:
            _1544 <= _1538;
        3:
            _1544 <= _1539;
        4:
            _1544 <= _1540;
        5:
            _1544 <= _1541;
        6:
            _1544 <= _1542;
        default:
            _1544 <= _1543;
        endcase
    end
    assign _1555 = _1544 & _1554;
    assign _182 = host_lane1_clk_edge;
    assign _1558 = _182 ? _1557 : _1555;
    assign _1534 = _1519 == _1187;
    assign _1531 = _1530 == _1519;
    assign _1524 = _1495 == _1519;
    assign _1522 = ~ _1486;
    assign _1513 = _184[15:2];
    assign _1514 = { _2389,
                     _1513 };
    assign _1510 = _184[15:1];
    assign _1511 = { _1080,
                     _1510 };
    assign _1515 = _1511 + _1514;
    assign _1507 = _184[15:1];
    assign _1508 = { _1080,
                     _1507 };
    assign _1505 = _197 & _1488;
    assign _1516 = _1505 ? _1515 : _1508;
    always @(posedge _278) begin
        if (_276)
            _1519 <= _1187;
        else
            _1519 <= _1516;
    end
    assign _1520 = _1495 < _1519;
    assign _1497 = _184[15:2];
    assign _1498 = { _2389,
                     _1497 };
    always @(posedge _278) begin
        if (_276)
            _1501 <= _1187;
        else
            _1501 <= _1498;
    end
    assign _3186 = ~ _1486;
    assign _3187 = _1521 & _3186;
    assign _3188 = _3187 ? _1530 : _1495;
    assign _3190 = _1491 ? _1187 : _3188;
    assign _3192 = _3190 + _3905;
    assign _3170 = _3164 == _1147;
    assign _1526 = _184[15:1];
    assign _1527 = { _1080,
                     _1526 };
    always @(posedge _278) begin
        if (_276)
            _1530 <= _1187;
        else
            _1530 <= _1527;
    end
    assign _3166 = { gnd,
                     _1530 };
    assign _3167 = _3166 == _3164;
    assign _3160 = { gnd,
                     _184 };
    always @(posedge _278) begin
        if (_276)
            _3163 <= _1147;
        else
            _3163 <= _3160;
    end
    assign _3155 = 17'b00000000000000001;
    assign _184 = host_lane1_div_int;
    assign _3154 = { gnd,
                     _184 };
    assign _3156 = _3154 - _3155;
    always @(posedge _278) begin
        if (_276)
            _3159 <= _1147;
        else
            _3159 <= _3156;
    end
    assign _186 = host_lane1_div_frac;
    assign _3174 = { gnd,
                     _186 };
    assign _3176 = _3175[7:0];
    assign _3177 = _3172 ? _3176 : _3148;
    assign _3178 = _3145 ? _3177 : _3148;
    assign _3180 = _1459 ? _1237 : _3178;
    assign _187 = _3180;
    always @(posedge _278) begin
        if (_276)
            _3148 <= _1237;
        else
            _3148 <= _187;
    end
    assign _3173 = { gnd,
                     _3148 };
    assign _3175 = _3173 + _3174;
    assign _3181 = _3175[8:8];
    assign _3182 = _3172 ? _3181 : _3153;
    assign _3183 = _3145 ? _3182 : _3153;
    assign _3185 = _1459 ? _1080 : _3183;
    assign _188 = _3185;
    always @(posedge _278) begin
        if (_276)
            _3153 <= _1080;
        else
            _3153 <= _188;
    end
    assign _3164 = _3153 ? _3163 : _3159;
    assign _3150 = { gnd,
                     _1495 };
    assign _3165 = _3150 == _3164;
    assign _3168 = _1523 ? _3167 : _3165;
    assign _3171 = _1491 ? _3170 : _3168;
    assign _3149 = ~ _195;
    assign _3172 = _3149 & _3171;
    assign _3194 = _3172 ? _1187 : _3192;
    assign _3144 = ~ _195;
    assign _3142 = _1486 & _1484;
    assign _640 = _638 == _1882;
    assign _3141 = _1461 | _640;
    assign _3143 = _3141 | _3142;
    assign _3145 = _3143 & _3144;
    assign _3195 = _3145 ? _3194 : _1495;
    assign _3197 = _1459 ? _1187 : _3195;
    assign _189 = _3197;
    always @(posedge _278) begin
        if (_276)
            _1495 <= _1187;
        else
            _1495 <= _189;
    end
    assign _1502 = _1495 < _1501;
    assign _1503 = ~ _1502;
    assign _1492 = _1484 & _1488;
    assign _1504 = _1492 & _1503;
    assign _1521 = _1504 & _1520;
    assign _1523 = _1521 & _1522;
    assign _1532 = _1523 ? _1531 : _1524;
    assign _191 = host_lane1_code;
    assign _1488 = _191 == _1229;
    assign _1489 = ~ _1488;
    assign _1486 = _638 == _1228;
    assign _1490 = _1486 | _1489;
    assign _1483 = ~ _195;
    assign _1479 = _339[7:7];
    assign _1478 = _339[6:6];
    assign _1477 = _339[5:5];
    assign _1476 = _339[4:4];
    assign _1475 = _339[3:3];
    assign _1474 = _339[2:2];
    assign _1473 = _339[1:1];
    assign _1472 = _339[0:0];
    always @* begin
        case (_193)
        0:
            _1480 <= _1472;
        1:
            _1480 <= _1473;
        2:
            _1480 <= _1474;
        3:
            _1480 <= _1475;
        4:
            _1480 <= _1476;
        5:
            _1480 <= _1477;
        6:
            _1480 <= _1478;
        default:
            _1480 <= _1479;
        endcase
    end
    assign _1470 = _323[7:7];
    assign _1469 = _323[6:6];
    assign _1468 = _323[5:5];
    assign _1467 = _323[4:4];
    assign _1466 = _323[3:3];
    assign _1465 = _323[2:2];
    assign _1464 = _323[1:1];
    assign _1463 = _323[0:0];
    assign _193 = host_lane1_data_pin;
    always @* begin
        case (_193)
        0:
            _1471 <= _1463;
        1:
            _1471 <= _1464;
        2:
            _1471 <= _1465;
        3:
            _1471 <= _1466;
        4:
            _1471 <= _1467;
        5:
            _1471 <= _1468;
        6:
            _1471 <= _1469;
        default:
            _1471 <= _1470;
        endcase
    end
    assign _1481 = _1471 ^ _1480;
    assign _1482 = _197 & _1481;
    assign _1484 = _1482 & _1483;
    assign _1491 = _1484 & _1490;
    assign _1535 = _1491 ? _1534 : _1532;
    assign _195 = host_lane1_clk_pin_en;
    assign _1559 = _195 ? _1558 : _1535;
    assign _197 = host_lane1_dir;
    assign _1462 = _1461 & _197;
    assign _1560 = _1462 & _1559;
    assign _3257 = _1560 ? _3256 : _3205;
    assign _1715 = _250 == _2266;
    assign _3259 = _1715 ? _2389 : _3257;
    assign _3003 = _250 == _2272;
    assign _3266 = _3003 ? _3265 : _3259;
    assign _1459 = _250 == _1646;
    assign _3272 = _1459 ? _3271 : _3266;
    assign _1456 = _250 == _1285;
    assign _1457 = _1456 | _285;
    assign _3274 = _1457 ? _2389 : _3272;
    assign _198 = _3274;
    always @(posedge _278) begin
        if (_276)
            _638 <= _2389;
        else
            _638 <= _198;
    end
    assign _1461 = _638 == _1229;
    assign _1718 = _1461 & _1717;
    assign _1726 = _1718 & _1725;
    assign _3632 = _1726 & _2896;
    assign _3634 = _3632 & _3633;
    assign _3630 = ~ _612;
    assign _1767 = ~ _249;
    assign _3608 = ~ _247;
    assign _3609 = _249 & _3608;
    assign _3612 = _3609 ? _1228 : _1229;
    assign _3601 = ~ _1784;
    assign _3602 = _1776 & _3601;
    assign _3603 = _626 | _3602;
    assign _3604 = _3603 | _3593;
    assign _3606 = _3604 ? _1229 : _3600;
    assign _3587 = _1430 + _1448;
    assign _3584 = _1430 + _1448;
    assign _3580 = vdd == _1442;
    assign _3578 = _1430 == _1088;
    assign _3579 = ~ _3578;
    assign _3581 = _3579 & _3580;
    assign _3585 = _3581 ? _3584 : _1448;
    assign _3576 = _227 == _1229;
    assign _3588 = _3576 ? _3587 : _3585;
    assign _3589 = _3588 == _201;
    assign _3570 = _1430 + _1448;
    assign _3566 = gnd == _1442;
    assign _3564 = _1430 == _1088;
    assign _3565 = ~ _3564;
    assign _3567 = _3565 & _3566;
    assign _3571 = _3567 ? _3570 : _1448;
    assign _3562 = _227 == _1229;
    assign _3573 = _3562 ? _1088 : _3571;
    assign _3574 = _3573 == _201;
    assign _3590 = _1438 ? _3589 : _3574;
    assign _3591 = _1427 & _3590;
    assign _3592 = ~ _3591;
    assign _3558 = _1780 == _2759;
    assign _3556 = _1780 == _1211;
    assign _3559 = _2809 ? _3558 : _3556;
    assign _3551 = _1755 + _3905;
    assign _3552 = _3551 == _221;
    assign _3549 = _1755 == _221;
    assign _3553 = _1757 ? _3552 : _3549;
    assign _3547 = ~ _1447;
    assign _3548 = _1402 & _3547;
    assign _3554 = _3548 & _3553;
    assign _3560 = _3554 & _3559;
    assign _3593 = _3560 & _3592;
    assign _3595 = _3593 ? _1882 : _3546;
    assign _3597 = _1447 ? _2389 : _3595;
    assign _3543 = _1784 ? _3541 : _1882;
    assign _3539 = _1328 & _1326;
    assign _3541 = _3539 ? _1229 : _624;
    assign _3544 = _1776 ? _3543 : _3541;
    assign _3307 = _1784 ? _3306 : _3277;
    assign _3308 = _1776 ? _3307 : _3277;
    assign _199 = _3308;
    always @(posedge _278) begin
        if (_276)
            _3277 <= _1080;
        else
            _3277 <= _199;
    end
    assign _3465 = ~ _3306;
    assign _3463 = ~ _1414;
    assign _3464 = _3306 ? _1414 : _3463;
    always @* begin
        case (_243)
        0:
            _3466 <= _3306;
        1:
            _3466 <= _3464;
        2:
            _3466 <= _3465;
        default:
            _3466 <= _3306;
        endcase
    end
    assign _201 = host_lane0_stuff_len;
    assign _3447 = _1430 + _1448;
    assign _3448 = _1438 ? _3447 : _1088;
    assign _3443 = _1430 + _1448;
    assign _3439 = _1438 == _1442;
    assign _3437 = _1430 == _1088;
    assign _3438 = ~ _3437;
    assign _3440 = _3438 & _3439;
    assign _3444 = _3440 ? _3443 : _1448;
    assign _3435 = _227 == _1229;
    assign _3449 = _3435 ? _3448 : _3444;
    assign _3450 = _1447 ? _3433 : _3449;
    assign _3429 = _1430 + _1448;
    assign _3430 = _3306 ? _3429 : _1088;
    assign _3425 = _1430 + _1448;
    assign _3303 = _3295[7:7];
    assign _3302 = _3295[6:6];
    assign _3301 = _3295[5:5];
    assign _3300 = _3295[4:4];
    assign _3299 = _3295[3:3];
    assign _3298 = _3295[2:2];
    assign _3297 = _3295[1:1];
    assign _3293 = _3285[7:7];
    assign _3292 = _3285[6:6];
    assign _3291 = _3285[5:5];
    assign _3290 = _3285[4:4];
    assign _3289 = _3285[3:3];
    assign _3288 = _3285[2:2];
    assign _3287 = _3285[1:1];
    assign _2950 = _2906 == _2272;
    assign _2951 = _2903 & _2950;
    always @(posedge _278) begin
        if (_276)
            _2952 <= _1237;
        else
            if (_2951)
                _2952 <= _204;
    end
    assign _2944 = _2906 == _2266;
    assign _2945 = _2903 & _2944;
    always @(posedge _278) begin
        if (_276)
            _2946 <= _1237;
        else
            if (_2945)
                _2946 <= _204;
    end
    assign _2938 = _2906 == _1646;
    assign _2939 = _2903 & _2938;
    always @(posedge _278) begin
        if (_276)
            _2940 <= _1237;
        else
            if (_2939)
                _2940 <= _204;
    end
    assign _2932 = _2906 == _1285;
    assign _2933 = _2903 & _2932;
    always @(posedge _278) begin
        if (_276)
            _2934 <= _1237;
        else
            if (_2933)
                _2934 <= _204;
    end
    assign _2926 = _2906 == _1648;
    assign _2927 = _2903 & _2926;
    always @(posedge _278) begin
        if (_276)
            _2928 <= _1237;
        else
            if (_2927)
                _2928 <= _204;
    end
    assign _2920 = _2906 == _1421;
    assign _2921 = _2903 & _2920;
    always @(posedge _278) begin
        if (_276)
            _2922 <= _1237;
        else
            if (_2921)
                _2922 <= _204;
    end
    assign _2914 = _2906 == _1448;
    assign _2915 = _2903 & _2914;
    always @(posedge _278) begin
        if (_276)
            _2916 <= _1237;
        else
            if (_2915)
                _2916 <= _204;
    end
    assign _3310 = _2906 + _1448;
    assign _3311 = _2903 ? _3310 : _2906;
    assign _202 = _3311;
    always @(posedge _278) begin
        if (_276)
            _2906 <= _1088;
        else
            _2906 <= _202;
    end
    assign _2908 = _2906 == _1088;
    assign _2909 = _2903 & _2908;
    assign _204 = host_tx_data;
    always @(posedge _278) begin
        if (_276)
            _2910 <= _1237;
        else
            if (_2909)
                _2910 <= _204;
    end
    assign _3315 = _2899 + _1448;
    assign _3316 = _3313 ? _3315 : _2899;
    assign _205 = _3316;
    always @(posedge _278) begin
        if (_276)
            _2899 <= _1088;
        else
            _2899 <= _205;
    end
    always @* begin
        case (_2899)
        0:
            _2953 <= _2910;
        1:
            _2953 <= _2916;
        2:
            _2953 <= _2922;
        3:
            _2953 <= _2928;
        4:
            _2953 <= _2934;
        5:
            _2953 <= _2940;
        6:
            _2953 <= _2946;
        default:
            _2953 <= _2952;
        endcase
    end
    assign _3284 = _612 ? _1235 : _2953;
    assign _2321 = _2318[7:1];
    assign _2322 = { _1438,
                     _2321 };
    assign _2319 = _2318[6:0];
    assign _2320 = { _2319,
                     _1438 };
    assign _2323 = _208 ? _2322 : _2320;
    assign _3321 = _1757 ? _2323 : _3320;
    assign _3322 = _1751 ? _3321 : _3320;
    assign _3323 = _1447 ? _3320 : _3322;
    assign _3317 = _1756 ? _3285 : _2318;
    assign _3318 = _1432 ? _2318 : _3317;
    assign _3319 = _1784 ? _3318 : _2318;
    assign _3320 = _1776 ? _3319 : _2318;
    assign _3324 = _1402 ? _3323 : _3320;
    assign _206 = _3324;
    always @(posedge _278) begin
        if (_276)
            _2318 <= _1237;
        else
            _2318 <= _206;
    end
    assign _3281 = _1760 == _1088;
    assign _3278 = ~ _1432;
    assign _3279 = _3278 & _1756;
    assign _3282 = _3279 & _3281;
    assign _3285 = _3282 ? _3284 : _2318;
    assign _3286 = _3285[0:0];
    assign _3294 = { _3286,
                     _3287,
                     _3288,
                     _3289,
                     _3290,
                     _3291,
                     _3292,
                     _3293 };
    assign _208 = host_lane0_lsb_first;
    assign _3295 = _208 ? _3285 : _3294;
    assign _3296 = _3295[0:0];
    assign _3332 = _1760 + _1448;
    assign _3333 = _1757 ? _3332 : _3330;
    assign _3334 = _1751 ? _3333 : _3330;
    assign _3335 = _1447 ? _3330 : _3334;
    assign _3326 = _1760 + _1448;
    assign _3327 = _1756 ? _3326 : _1760;
    assign _3328 = _1432 ? _1760 : _3327;
    assign _3329 = _1784 ? _3328 : _1760;
    assign _3330 = _1776 ? _3329 : _1760;
    assign _3336 = _1402 ? _3335 : _3330;
    assign _3338 = _1301 ? _1088 : _3336;
    assign _209 = _3338;
    always @(posedge _278) begin
        if (_276)
            _1760 <= _1088;
        else
            _1760 <= _209;
    end
    always @* begin
        case (_1760)
        0:
            _3304 <= _3296;
        1:
            _3304 <= _3297;
        2:
            _3304 <= _3298;
        3:
            _3304 <= _3299;
        4:
            _3304 <= _3300;
        5:
            _3304 <= _3301;
        6:
            _3304 <= _3302;
        default:
            _3304 <= _3303;
        endcase
    end
    assign _211 = host_lane0_crc_inv;
    assign _213 = host_lane0_init;
    assign _3380 = _2812[30:0];
    assign _3382 = { _3380,
                     _1080 };
    assign _3374 = _2812[31:31];
    assign _3375 = _1438 ^ _3374;
    assign _3377 = _3375 ? _218 : _1904;
    assign _3371 = _2812[30:0];
    assign _3373 = { _3371,
                     _1080 };
    assign _3378 = _3373 ^ _3377;
    assign _3379 = _1757 ? _3378 : _3370;
    assign _215 = host_lane0_crc_width;
    assign _3348 = _1780 - _2759;
    assign _3349 = _2809 ? _3348 : _3346;
    assign _3350 = _1751 ? _3349 : _3346;
    assign _3351 = _1447 ? _3346 : _3350;
    assign _3342 = _1780 - _2759;
    assign _3343 = _1756 ? _1780 : _3342;
    assign _3344 = _1432 ? _1780 : _3343;
    assign _3345 = _1784 ? _3344 : _1780;
    assign _3346 = _1776 ? _3345 : _1780;
    assign _3352 = _1402 ? _3351 : _3346;
    assign _3353 = _3340 ? _215 : _3352;
    assign _3355 = _1301 ? _1211 : _3353;
    assign _216 = _3355;
    always @(posedge _278) begin
        if (_276)
            _1780 <= _1211;
        else
            _1780 <= _216;
    end
    assign _1782 = _1780 == _1211;
    assign _1783 = ~ _1782;
    assign _2807 = ~ _1756;
    assign _2806 = _1402 & _1751;
    assign _2808 = _2806 & _2807;
    assign _2809 = _2808 & _1783;
    assign _3383 = _2809 ? _3382 : _3379;
    assign _3384 = _1751 ? _3383 : _3370;
    assign _3385 = _1447 ? _3370 : _3384;
    assign _218 = host_lane0_poly;
    assign _3362 = _2812[31:31];
    assign _3363 = _3306 ^ _3362;
    assign _3365 = _3363 ? _218 : _1904;
    assign _3359 = _2812[30:0];
    assign _3361 = { _3359,
                     _1080 };
    assign _3366 = _3361 ^ _3365;
    assign _3356 = _2812[30:0];
    assign _3358 = { _3356,
                     _1080 };
    assign _3367 = _1756 ? _3366 : _3358;
    assign _3368 = _1432 ? _2812 : _3367;
    assign _3369 = _1784 ? _3368 : _2812;
    assign _3370 = _1776 ? _3369 : _2812;
    assign _3386 = _1402 ? _3385 : _3370;
    assign _3387 = _1301 ? _213 : _3386;
    assign _3389 = _1299 ? _1904 : _3387;
    assign _219 = _3389;
    always @(posedge _278) begin
        if (_276)
            _2812 <= _1904;
        else
            _2812 <= _219;
    end
    assign _2813 = _2812[31:31];
    assign _2814 = _2813 ^ _211;
    assign _221 = host_lane0_frame_bits;
    assign _3409 = _1755 + _3905;
    assign _1752 = _1402 & _1751;
    assign _1757 = _1752 & _1756;
    assign _3410 = _1757 ? _3409 : _3407;
    assign _1751 = ~ _1432;
    assign _3411 = _1751 ? _3410 : _3407;
    assign _3392 = _1447 ? _3391 : _1438;
    assign _3390 = _1784 ? _3306 : _1442;
    assign _3391 = _1776 ? _3390 : _1442;
    assign _3393 = _1402 ? _3392 : _3391;
    assign _3395 = _1301 ? _1670 : _3393;
    assign _222 = _3395;
    always @(posedge _278) begin
        if (_276)
            _1442 <= vdd;
        else
            _1442 <= _222;
    end
    assign _1443 = ~ _1442;
    assign _1440 = _227 == _1228;
    assign _1444 = _1440 ? _1443 : gnd;
    assign _3397 = _243 == _1228;
    assign _3398 = _3397 ? _1313 : _1436;
    assign _3399 = _1402 ? _3398 : _1436;
    assign _3401 = _1301 ? _1670 : _3399;
    assign _223 = _3401;
    always @(posedge _278) begin
        if (_276)
            _1436 <= vdd;
        else
            _1436 <= _223;
    end
    assign _1437 = _1313 == _1436;
    assign _1434 = _243 == _1228;
    assign _1438 = _1434 ? _1437 : _1313;
    assign _1445 = _1438 == _1444;
    assign _1446 = ~ _1445;
    assign _1447 = _1432 & _1446;
    assign _3412 = _1447 ? _3407 : _3411;
    assign _3403 = _1755 + _3905;
    assign _3404 = _1756 ? _3403 : _1755;
    assign _3405 = _1432 ? _1755 : _3404;
    assign _3406 = _1784 ? _3405 : _1755;
    assign _3407 = _1776 ? _3406 : _1755;
    assign _3413 = _1402 ? _3412 : _3407;
    assign _3415 = _1301 ? _1187 : _3413;
    assign _224 = _3415;
    always @(posedge _278) begin
        if (_276)
            _1755 <= _1187;
        else
            _1755 <= _224;
    end
    assign _1756 = _1755 < _221;
    assign _3305 = _1756 ? _3304 : _2814;
    assign _3306 = _1432 ? _1444 : _3305;
    assign _3421 = _3306 == _1442;
    assign _3419 = _1430 == _1088;
    assign _3420 = ~ _3419;
    assign _3422 = _3420 & _3421;
    assign _3426 = _3422 ? _3425 : _1448;
    assign _3417 = _227 == _1229;
    assign _3431 = _3417 ? _3430 : _3426;
    assign _3432 = _1784 ? _3431 : _1430;
    assign _3433 = _1776 ? _3432 : _1430;
    assign _3451 = _1402 ? _3450 : _3433;
    assign _3453 = _1301 ? _1088 : _3451;
    assign _225 = _3453;
    always @(posedge _278) begin
        if (_276)
            _1430 <= _1088;
        else
            _1430 <= _225;
    end
    assign _1431 = _1430 == _201;
    assign _227 = host_lane0_stuff;
    assign _1426 = _227 == _2389;
    assign _1427 = ~ _1426;
    assign _1432 = _1427 & _1431;
    assign _1777 = _1432 | _1756;
    assign _1784 = _1777 | _1783;
    assign _3467 = _1784 ? _3466 : _1670;
    assign _3468 = _1776 ? _3467 : _1414;
    assign _1772 = _1372 == _1187;
    assign _1770 = _1337 == _1187;
    assign _1773 = _1365 ? _1772 : _1770;
    assign _1774 = _1333 ? vdd : _1773;
    assign _1775 = _247 ? _1400 : _1774;
    assign _3460 = ~ _1775;
    assign _3457 = _243 == _1229;
    assign _3454 = ~ _249;
    assign _3455 = _1303 & _3454;
    assign _3458 = _3455 & _3457;
    assign _3459 = _3458 & _1401;
    assign _3461 = _3459 & _3460;
    assign _3469 = _3461 ? _3277 : _3468;
    assign _3471 = _1417 ? _1670 : _3469;
    assign _3473 = _1765 ? _1670 : _3471;
    assign _3475 = _1301 ? _1670 : _3473;
    assign _3477 = _1299 ? _1670 : _3475;
    assign _228 = _3477;
    always @(posedge _278) begin
        if (_276)
            _1414 <= vdd;
        else
            _1414 <= _228;
    end
    assign _1415 = _1313 == _1414;
    assign _1416 = ~ _1415;
    assign _1409 = _243 == _1229;
    assign _1410 = ~ _1409;
    assign _1406 = ~ _247;
    assign _230 = host_lane0_readback;
    assign _1403 = ~ _249;
    assign _1404 = _1303 & _1403;
    assign _1405 = _1404 & _230;
    assign _1407 = _1405 & _1406;
    assign _1411 = _1407 & _1410;
    assign _1412 = _1411 & _1401;
    assign _1417 = _1412 & _1416;
    assign _3546 = _1417 ? _2389 : _3544;
    assign _1398 = ~ _1386;
    assign _1399 = _1395 & _1398;
    assign _1394 = _339[7:7];
    assign _1393 = _339[6:6];
    assign _1392 = _339[5:5];
    assign _1391 = _339[4:4];
    assign _1390 = _339[3:3];
    assign _1389 = _339[2:2];
    assign _1388 = _339[1:1];
    assign _1387 = _339[0:0];
    always @* begin
        case (_232)
        0:
            _1395 <= _1387;
        1:
            _1395 <= _1388;
        2:
            _1395 <= _1389;
        3:
            _1395 <= _1390;
        4:
            _1395 <= _1391;
        5:
            _1395 <= _1392;
        6:
            _1395 <= _1393;
        default:
            _1395 <= _1394;
        endcase
    end
    assign _1396 = ~ _1395;
    assign _1385 = _323[7:7];
    assign _1384 = _323[6:6];
    assign _1383 = _323[5:5];
    assign _1382 = _323[4:4];
    assign _1381 = _323[3:3];
    assign _1380 = _323[2:2];
    assign _1379 = _323[1:1];
    assign _1378 = _323[0:0];
    assign _232 = host_lane0_clk_pin;
    always @* begin
        case (_232)
        0:
            _1386 <= _1378;
        1:
            _1386 <= _1379;
        2:
            _1386 <= _1380;
        3:
            _1386 <= _1381;
        4:
            _1386 <= _1382;
        5:
            _1386 <= _1383;
        6:
            _1386 <= _1384;
        default:
            _1386 <= _1385;
        endcase
    end
    assign _1397 = _1386 & _1396;
    assign _234 = host_lane0_clk_edge;
    assign _1400 = _234 ? _1399 : _1397;
    assign _1376 = _1361 == _1187;
    assign _1373 = _1372 == _1361;
    assign _1366 = _1337 == _1361;
    assign _1364 = ~ _1328;
    assign _1355 = _236[15:2];
    assign _1356 = { _2389,
                     _1355 };
    assign _1352 = _236[15:1];
    assign _1353 = { _1080,
                     _1352 };
    assign _1357 = _1353 + _1356;
    assign _1349 = _236[15:1];
    assign _1350 = { _1080,
                     _1349 };
    assign _1347 = _249 & _1330;
    assign _1358 = _1347 ? _1357 : _1350;
    always @(posedge _278) begin
        if (_276)
            _1361 <= _1187;
        else
            _1361 <= _1358;
    end
    assign _1362 = _1337 < _1361;
    assign _1339 = _236[15:2];
    assign _1340 = { _2389,
                     _1339 };
    always @(posedge _278) begin
        if (_276)
            _1343 <= _1187;
        else
            _1343 <= _1340;
    end
    assign _3523 = ~ _1328;
    assign _3524 = _1363 & _3523;
    assign _3525 = _3524 ? _1372 : _1337;
    assign _3527 = _1333 ? _1187 : _3525;
    assign _3529 = _3527 + _3905;
    assign _3507 = _3501 == _1147;
    assign _1368 = _236[15:1];
    assign _1369 = { _1080,
                     _1368 };
    always @(posedge _278) begin
        if (_276)
            _1372 <= _1187;
        else
            _1372 <= _1369;
    end
    assign _3503 = { gnd,
                     _1372 };
    assign _3504 = _3503 == _3501;
    assign _3497 = { gnd,
                     _236 };
    always @(posedge _278) begin
        if (_276)
            _3500 <= _1147;
        else
            _3500 <= _3497;
    end
    assign _236 = host_lane0_div_int;
    assign _3491 = { gnd,
                     _236 };
    assign _3493 = _3491 - _3155;
    always @(posedge _278) begin
        if (_276)
            _3496 <= _1147;
        else
            _3496 <= _3493;
    end
    assign _238 = host_lane0_div_frac;
    assign _3511 = { gnd,
                     _238 };
    assign _3513 = _3512[7:0];
    assign _3514 = _3509 ? _3513 : _3485;
    assign _3515 = _3482 ? _3514 : _3485;
    assign _3517 = _1301 ? _1237 : _3515;
    assign _239 = _3517;
    always @(posedge _278) begin
        if (_276)
            _3485 <= _1237;
        else
            _3485 <= _239;
    end
    assign _3510 = { gnd,
                     _3485 };
    assign _3512 = _3510 + _3511;
    assign _3518 = _3512[8:8];
    assign _3519 = _3509 ? _3518 : _3490;
    assign _3520 = _3482 ? _3519 : _3490;
    assign _3522 = _1301 ? _1080 : _3520;
    assign _240 = _3522;
    always @(posedge _278) begin
        if (_276)
            _3490 <= _1080;
        else
            _3490 <= _240;
    end
    assign _3501 = _3490 ? _3500 : _3496;
    assign _3487 = { gnd,
                     _1337 };
    assign _3502 = _3487 == _3501;
    assign _3505 = _1365 ? _3504 : _3502;
    assign _3508 = _1333 ? _3507 : _3505;
    assign _3486 = ~ _247;
    assign _3509 = _3486 & _3508;
    assign _3531 = _3509 ? _1187 : _3529;
    assign _3481 = ~ _247;
    assign _3479 = _1328 & _1326;
    assign _626 = _624 == _1882;
    assign _3478 = _1303 | _626;
    assign _3480 = _3478 | _3479;
    assign _3482 = _3480 & _3481;
    assign _3532 = _3482 ? _3531 : _1337;
    assign _3534 = _1301 ? _1187 : _3532;
    assign _241 = _3534;
    always @(posedge _278) begin
        if (_276)
            _1337 <= _1187;
        else
            _1337 <= _241;
    end
    assign _1344 = _1337 < _1343;
    assign _1345 = ~ _1344;
    assign _1334 = _1326 & _1330;
    assign _1346 = _1334 & _1345;
    assign _1363 = _1346 & _1362;
    assign _1365 = _1363 & _1364;
    assign _1374 = _1365 ? _1373 : _1366;
    assign _243 = host_lane0_code;
    assign _1330 = _243 == _1229;
    assign _1331 = ~ _1330;
    assign _1328 = _624 == _1228;
    assign _1332 = _1328 | _1331;
    assign _1325 = ~ _247;
    assign _1321 = _339[7:7];
    assign _1320 = _339[6:6];
    assign _1319 = _339[5:5];
    assign _1318 = _339[4:4];
    assign _1317 = _339[3:3];
    assign _1316 = _339[2:2];
    assign _1315 = _339[1:1];
    assign _1314 = _339[0:0];
    always @* begin
        case (_245)
        0:
            _1322 <= _1314;
        1:
            _1322 <= _1315;
        2:
            _1322 <= _1316;
        3:
            _1322 <= _1317;
        4:
            _1322 <= _1318;
        5:
            _1322 <= _1319;
        6:
            _1322 <= _1320;
        default:
            _1322 <= _1321;
        endcase
    end
    assign _1312 = _323[7:7];
    assign _1311 = _323[6:6];
    assign _1310 = _323[5:5];
    assign _1309 = _323[4:4];
    assign _1308 = _323[3:3];
    assign _1307 = _323[2:2];
    assign _1306 = _323[1:1];
    assign _1305 = _323[0:0];
    assign _245 = host_lane0_data_pin;
    always @* begin
        case (_245)
        0:
            _1313 <= _1305;
        1:
            _1313 <= _1306;
        2:
            _1313 <= _1307;
        3:
            _1313 <= _1308;
        4:
            _1313 <= _1309;
        5:
            _1313 <= _1310;
        6:
            _1313 <= _1311;
        default:
            _1313 <= _1312;
        endcase
    end
    assign _1323 = _1313 ^ _1322;
    assign _1324 = _249 & _1323;
    assign _1326 = _1324 & _1325;
    assign _1333 = _1326 & _1332;
    assign _1377 = _1333 ? _1376 : _1374;
    assign _247 = host_lane0_clk_pin_en;
    assign _1401 = _247 ? _1400 : _1377;
    assign _249 = host_lane0_dir;
    assign _1304 = _1303 & _249;
    assign _1402 = _1304 & _1401;
    assign _3598 = _1402 ? _3597 : _3546;
    assign _1765 = _250 == _1421;
    assign _3600 = _1765 ? _2389 : _3598;
    assign _3340 = _250 == _1648;
    assign _3607 = _3340 ? _3606 : _3600;
    assign _1301 = _250 == _1448;
    assign _3613 = _1301 ? _3612 : _3607;
    assign _2439 = _725[90:88];
    assign _2438 = _719[90:88];
    assign _2437 = _713[90:88];
    assign _2436 = _316[90:88];
    always @* begin
        case (f_winner)
        0:
            _2440 <= _2436;
        1:
            _2440 <= _2437;
        2:
            _2440 <= _2438;
        default:
            _2440 <= _2439;
        endcase
    end
    assign _2432 = _725[87:87];
    assign _2431 = _719[87:87];
    assign _2430 = _713[87:87];
    assign _2429 = _316[87:87];
    always @* begin
        case (f_winner)
        0:
            _2433 <= _2429;
        1:
            _2433 <= _2430;
        2:
            _2433 <= _2431;
        default:
            _2433 <= _2432;
        endcase
    end
    assign _3535 = ~ _2433;
    assign _3536 = _1204 & _3535;
    assign _3538 = _3536 ? _2440 : _1088;
    assign _250 = _3538;
    assign _1298 = _250 == _1285;
    assign _1299 = _1298 | _285;
    assign _3615 = _1299 ? _2389 : _3613;
    assign _251 = _3615;
    always @(posedge _278) begin
        if (_276)
            _624 <= _2389;
        else
            _624 <= _251;
    end
    assign _1303 = _624 == _1229;
    assign _1768 = _1303 & _1767;
    assign _1776 = _1768 & _1775;
    assign _3629 = _1776 & _3282;
    assign _3631 = _3629 & _3630;
    assign _3635 = _3631 | _3634;
    assign _3626 = _3622 == _1229;
    assign _3624 = _3622 == _1228;
    assign _3627 = _3624 | _3626;
    assign _3628 = _1811 & _3627;
    assign _3636 = _3628 | _3635;
    assign _252 = _3636;
    assign _3313 = _252 & _3312;
    assign _2385 = _255 == _1688;
    assign _2902 = ~ _2385;
    assign _254 = host_tx_push;
    assign _2903 = _254 & _2902;
    assign _3637 = _2903 ^ _3313;
    assign _3643 = _3637 ? _3642 : _255;
    always @(posedge _278) begin
        if (_276)
            _3646 <= _1896;
        else
            _3646 <= _3643;
    end
    assign _255 = _3646;
    assign _612 = _255 == _1896;
    assign _3648 = _612 ? _1235 : _2953;
    assign _3621 = _708[28:27];
    assign _3619 = _725[95:94];
    assign _3618 = _719[95:94];
    assign _3617 = _713[95:94];
    assign _3616 = _316[95:94];
    always @* begin
        case (f_winner)
        0:
            _3620 <= _3616;
        1:
            _3620 <= _3617;
        2:
            _3620 <= _3618;
        default:
            _3620 <= _3619;
        endcase
    end
    assign _3622 = _1810 ? _3621 : _3620;
    always @* begin
        case (_3622)
        0:
            _3660 <= _605;
        1:
            _3660 <= _3648;
        2:
            _3660 <= _3657;
        default:
            _3660 <= _3659;
        endcase
    end
    assign _3661 = _1811 ? _3660 : _605;
    assign _256 = _3661;
    always @(posedge _278) begin
        if (_276)
            _605 <= _1237;
        else
            _605 <= _256;
    end
    assign _606 = _605[0:0];
    assign _3672 = 8'b00001000;
    assign _3671 = 8'b00000111;
    assign _3669 = 8'b00000001;
    assign _3670 = _600 - _3669;
    assign _3667 = _708[30:29];
    assign _725 = _315[511:400];
    assign _3665 = _725[99:98];
    assign _719 = _315[399:288];
    assign _3664 = _719[99:98];
    assign _3663 = _713[99:98];
    assign _3662 = _316[99:98];
    always @* begin
        case (f_winner)
        0:
            _3666 <= _3662;
        1:
            _3666 <= _3663;
        2:
            _3666 <= _3664;
        default:
            _3666 <= _3665;
        endcase
    end
    assign _3668 = _1810 ? _3667 : _3666;
    always @* begin
        case (_3668)
        0:
            _3673 <= _600;
        1:
            _3673 <= _3670;
        2:
            _3673 <= _3671;
        default:
            _3673 <= _3672;
        endcase
    end
    assign _3674 = _1811 ? _3673 : _600;
    assign _257 = _3674;
    always @(posedge _278) begin
        if (_276)
            _600 <= _1237;
        else
            _600 <= _257;
    end
    assign _602 = _600 == _1237;
    assign _830 = _713[61:58];
    always @* begin
        case (_830)
        0:
            _831 <= vdd;
        1:
            _831 <= _602;
        2:
            _831 <= _606;
        3:
            _831 <= _610;
        4:
            _831 <= _612;
        5:
            _831 <= _614;
        6:
            _831 <= _618;
        7:
            _831 <= _621;
        8:
            _831 <= _626;
        9:
            _831 <= _629;
        10:
            _831 <= _632;
        11:
            _831 <= _635;
        12:
            _831 <= _640;
        13:
            _831 <= _643;
        14:
            _831 <= _646;
        default:
            _831 <= _649;
        endcase
    end
    assign _833 = _831 ^ _832;
    assign _825 = _713[57:42];
    assign _827 = _825 == _1077;
    assign _816 = _762[57:42];
    assign _817 = { gnd,
                    _816 };
    assign _818 = _817 + _805;
    always @(posedge _278) begin
        if (_276)
            _821 <= _1147;
        else
            _821 <= _818;
    end
    assign _822 = _821 < _761;
    assign _823 = ~ _822;
    assign _812 = _713[41:26];
    assign _814 = _812 == _1187;
    assign _560 = _556 + _1448;
    assign _3689 = _556 + _1448;
    assign _3685 = _556 == _2272;
    assign _3686 = ~ _3685;
    assign _3683 = _336[0:0];
    assign _3687 = _3683 & _3686;
    assign _3690 = _3687 ? _3689 : _556;
    assign _3680 = _336[0:0];
    assign _3681 = ~ _3680;
    assign _3679 = f_chg_now[0:0];
    assign _3682 = _3679 & _3681;
    assign _3692 = _3682 ? _1448 : _3690;
    assign _3676 = _300 == _1229;
    assign _3678 = _3676 ? _1088 : _556;
    assign _3675 = _300 == _1228;
    assign _3693 = _3675 ? _3692 : _3678;
    assign _258 = _3693;
    always @(posedge _278) begin
        if (_276)
            _556 <= _1088;
        else
            _556 <= _258;
    end
    assign _558 = _556 == _2272;
    assign _561 = _558 ? _556 : _560;
    assign _551 = _336[0:0];
    assign _552 = ~ _551;
    assign _550 = f_chg_now[0:0];
    assign _553 = _550 & _552;
    assign _563 = _553 ? _1448 : _561;
    assign _547 = f_changed_all[0:0];
    assign _548 = f_in_fetch & _547;
    assign _564 = _548 ? _563 : _1088;
    assign _796 = _766[0:0];
    assign _798 = _796 ? _564 : _1088;
    assign _539 = _535 + _1448;
    assign _3708 = _535 + _1448;
    assign _3704 = _535 == _2272;
    assign _3705 = ~ _3704;
    assign _3702 = _336[1:1];
    assign _3706 = _3702 & _3705;
    assign _3709 = _3706 ? _3708 : _535;
    assign _3699 = _336[1:1];
    assign _3700 = ~ _3699;
    assign _3698 = f_chg_now[1:1];
    assign _3701 = _3698 & _3700;
    assign _3711 = _3701 ? _1448 : _3709;
    assign _3695 = _300 == _1229;
    assign _3697 = _3695 ? _1088 : _535;
    assign _3694 = _300 == _1228;
    assign _3712 = _3694 ? _3711 : _3697;
    assign _259 = _3712;
    always @(posedge _278) begin
        if (_276)
            _535 <= _1088;
        else
            _535 <= _259;
    end
    assign _537 = _535 == _2272;
    assign _540 = _537 ? _535 : _539;
    assign _530 = _336[1:1];
    assign _531 = ~ _530;
    assign _529 = f_chg_now[1:1];
    assign _532 = _529 & _531;
    assign _542 = _532 ? _1448 : _540;
    assign _526 = f_changed_all[1:1];
    assign _527 = f_in_fetch & _526;
    assign _543 = _527 ? _542 : _1088;
    assign _793 = _766[1:1];
    assign _795 = _793 ? _543 : _1088;
    assign _799 = _795 < _798;
    assign _800 = _799 ? _798 : _795;
    assign _516 = _512 + _1448;
    assign _3727 = _512 + _1448;
    assign _3723 = _512 == _2272;
    assign _3724 = ~ _3723;
    assign _3721 = _336[2:2];
    assign _3725 = _3721 & _3724;
    assign _3728 = _3725 ? _3727 : _512;
    assign _3718 = _336[2:2];
    assign _3719 = ~ _3718;
    assign _3717 = f_chg_now[2:2];
    assign _3720 = _3717 & _3719;
    assign _3730 = _3720 ? _1448 : _3728;
    assign _3714 = _300 == _1229;
    assign _3716 = _3714 ? _1088 : _512;
    assign _3713 = _300 == _1228;
    assign _3731 = _3713 ? _3730 : _3716;
    assign _260 = _3731;
    always @(posedge _278) begin
        if (_276)
            _512 <= _1088;
        else
            _512 <= _260;
    end
    assign _514 = _512 == _2272;
    assign _517 = _514 ? _512 : _516;
    assign _507 = _336[2:2];
    assign _508 = ~ _507;
    assign _506 = f_chg_now[2:2];
    assign _509 = _506 & _508;
    assign _519 = _509 ? _1448 : _517;
    assign _503 = f_changed_all[2:2];
    assign _504 = f_in_fetch & _503;
    assign _520 = _504 ? _519 : _1088;
    assign _788 = _766[2:2];
    assign _790 = _788 ? _520 : _1088;
    assign _495 = _491 + _1448;
    assign _3746 = _491 + _1448;
    assign _3742 = _491 == _2272;
    assign _3743 = ~ _3742;
    assign _3740 = _336[3:3];
    assign _3744 = _3740 & _3743;
    assign _3747 = _3744 ? _3746 : _491;
    assign _3737 = _336[3:3];
    assign _3738 = ~ _3737;
    assign _3736 = f_chg_now[3:3];
    assign _3739 = _3736 & _3738;
    assign _3749 = _3739 ? _1448 : _3747;
    assign _3733 = _300 == _1229;
    assign _3735 = _3733 ? _1088 : _491;
    assign _3732 = _300 == _1228;
    assign _3750 = _3732 ? _3749 : _3735;
    assign _261 = _3750;
    always @(posedge _278) begin
        if (_276)
            _491 <= _1088;
        else
            _491 <= _261;
    end
    assign _493 = _491 == _2272;
    assign _496 = _493 ? _491 : _495;
    assign _486 = _336[3:3];
    assign _487 = ~ _486;
    assign _485 = f_chg_now[3:3];
    assign _488 = _485 & _487;
    assign _498 = _488 ? _1448 : _496;
    assign _482 = f_changed_all[3:3];
    assign _483 = f_in_fetch & _482;
    assign _499 = _483 ? _498 : _1088;
    assign _785 = _766[3:3];
    assign _787 = _785 ? _499 : _1088;
    assign _791 = _787 < _790;
    assign _792 = _791 ? _790 : _787;
    assign _801 = _792 < _800;
    assign _802 = _801 ? _800 : _792;
    assign _470 = _466 + _1448;
    assign _3765 = _466 + _1448;
    assign _3761 = _466 == _2272;
    assign _3762 = ~ _3761;
    assign _3759 = _336[4:4];
    assign _3763 = _3759 & _3762;
    assign _3766 = _3763 ? _3765 : _466;
    assign _3756 = _336[4:4];
    assign _3757 = ~ _3756;
    assign _3755 = f_chg_now[4:4];
    assign _3758 = _3755 & _3757;
    assign _3768 = _3758 ? _1448 : _3766;
    assign _3752 = _300 == _1229;
    assign _3754 = _3752 ? _1088 : _466;
    assign _3751 = _300 == _1228;
    assign _3769 = _3751 ? _3768 : _3754;
    assign _262 = _3769;
    always @(posedge _278) begin
        if (_276)
            _466 <= _1088;
        else
            _466 <= _262;
    end
    assign _468 = _466 == _2272;
    assign _471 = _468 ? _466 : _470;
    assign _461 = _336[4:4];
    assign _462 = ~ _461;
    assign _460 = f_chg_now[4:4];
    assign _463 = _460 & _462;
    assign _473 = _463 ? _1448 : _471;
    assign _457 = f_changed_all[4:4];
    assign _458 = f_in_fetch & _457;
    assign _474 = _458 ? _473 : _1088;
    assign _778 = _766[4:4];
    assign _780 = _778 ? _474 : _1088;
    assign _449 = _445 + _1448;
    assign _3784 = _445 + _1448;
    assign _3780 = _445 == _2272;
    assign _3781 = ~ _3780;
    assign _3778 = _336[5:5];
    assign _3782 = _3778 & _3781;
    assign _3785 = _3782 ? _3784 : _445;
    assign _3775 = _336[5:5];
    assign _3776 = ~ _3775;
    assign _3774 = f_chg_now[5:5];
    assign _3777 = _3774 & _3776;
    assign _3787 = _3777 ? _1448 : _3785;
    assign _3771 = _300 == _1229;
    assign _3773 = _3771 ? _1088 : _445;
    assign _3770 = _300 == _1228;
    assign _3788 = _3770 ? _3787 : _3773;
    assign _263 = _3788;
    always @(posedge _278) begin
        if (_276)
            _445 <= _1088;
        else
            _445 <= _263;
    end
    assign _447 = _445 == _2272;
    assign _450 = _447 ? _445 : _449;
    assign _440 = _336[5:5];
    assign _441 = ~ _440;
    assign _439 = f_chg_now[5:5];
    assign _442 = _439 & _441;
    assign _452 = _442 ? _1448 : _450;
    assign _436 = f_changed_all[5:5];
    assign _437 = f_in_fetch & _436;
    assign _453 = _437 ? _452 : _1088;
    assign _775 = _766[5:5];
    assign _777 = _775 ? _453 : _1088;
    assign _781 = _777 < _780;
    assign _782 = _781 ? _780 : _777;
    assign _426 = _422 + _1448;
    assign _3803 = _422 + _1448;
    assign _3799 = _422 == _2272;
    assign _3800 = ~ _3799;
    assign _3797 = _336[6:6];
    assign _3801 = _3797 & _3800;
    assign _3804 = _3801 ? _3803 : _422;
    assign _3794 = _336[6:6];
    assign _3795 = ~ _3794;
    assign _3793 = f_chg_now[6:6];
    assign _3796 = _3793 & _3795;
    assign _3806 = _3796 ? _1448 : _3804;
    assign _3790 = _300 == _1229;
    assign _3792 = _3790 ? _1088 : _422;
    assign _3789 = _300 == _1228;
    assign _3807 = _3789 ? _3806 : _3792;
    assign _264 = _3807;
    always @(posedge _278) begin
        if (_276)
            _422 <= _1088;
        else
            _422 <= _264;
    end
    assign _424 = _422 == _2272;
    assign _427 = _424 ? _422 : _426;
    assign _417 = _336[6:6];
    assign _418 = ~ _417;
    assign _416 = f_chg_now[6:6];
    assign _419 = _416 & _418;
    assign _429 = _419 ? _1448 : _427;
    assign _413 = f_changed_all[6:6];
    assign _414 = f_in_fetch & _413;
    assign _430 = _414 ? _429 : _1088;
    assign _770 = _766[6:6];
    assign _772 = _770 ? _430 : _1088;
    assign _405 = _401 + _1448;
    assign _3822 = _401 + _1448;
    assign _3818 = _401 == _2272;
    assign _3819 = ~ _3818;
    assign _3816 = _336[7:7];
    assign _3820 = _3816 & _3819;
    assign _3823 = _3820 ? _3822 : _401;
    assign _3813 = _336[7:7];
    assign _3814 = ~ _3813;
    assign _3812 = f_chg_now[7:7];
    assign _3815 = _3812 & _3814;
    assign _3825 = _3815 ? _1448 : _3823;
    assign _3809 = _300 == _1229;
    assign _3811 = _3809 ? _1088 : _401;
    assign _3808 = _300 == _1228;
    assign _3826 = _3808 ? _3825 : _3811;
    assign _265 = _3826;
    always @(posedge _278) begin
        if (_276)
            _401 <= _1088;
        else
            _401 <= _265;
    end
    assign _403 = _401 == _2272;
    assign _406 = _403 ? _401 : _405;
    assign _396 = _336[7:7];
    assign _397 = ~ _396;
    assign _395 = f_chg_now[7:7];
    assign _398 = _395 & _397;
    assign _408 = _398 ? _1448 : _406;
    assign _392 = f_changed_all[7:7];
    assign _393 = f_in_fetch & _392;
    assign _409 = _393 ? _408 : _1088;
    assign _766 = _762[23:16];
    assign _767 = _766[7:7];
    assign _769 = _767 ? _409 : _1088;
    assign _773 = _769 < _772;
    assign _774 = _773 ? _772 : _769;
    assign _783 = _774 < _782;
    assign _784 = _783 ? _782 : _774;
    assign _803 = _784 < _802;
    assign _804 = _803 ? _802 : _784;
    assign _805 = { _1131,
                    _804 };
    assign _3829 = _367 == _1448;
    assign _3830 = _3829 ? _270 : _314;
    assign _3827 = _300 == _1228;
    assign _3831 = _3827 ? _3830 : _314;
    assign _266 = _3831;
    always @(posedge _278) begin
        if (_276)
            _314 <= _304;
        else
            _314 <= _266;
    end
    assign _381 = _367 == _1448;
    assign _382 = f_in_fetch & _381;
    assign _383 = _382 ? _270 : _314;
    assign _3834 = _367 == _1421;
    assign _3835 = _3834 ? _270 : _311;
    assign _3832 = _300 == _1228;
    assign _3836 = _3832 ? _3835 : _311;
    assign _267 = _3836;
    always @(posedge _278) begin
        if (_276)
            _311 <= _304;
        else
            _311 <= _267;
    end
    assign _377 = _367 == _1421;
    assign _378 = f_in_fetch & _377;
    assign _379 = _378 ? _270 : _311;
    assign _3839 = _367 == _1648;
    assign _3840 = _3839 ? _270 : _308;
    assign _3837 = _300 == _1228;
    assign _3841 = _3837 ? _3840 : _308;
    assign _268 = _3841;
    always @(posedge _278) begin
        if (_276)
            _308 <= _304;
        else
            _308 <= _268;
    end
    assign _373 = _367 == _1648;
    assign _374 = f_in_fetch & _373;
    assign _375 = _374 ? _270 : _308;
    assign _270 = ram_rec_rdata;
    assign _369 = _367 == _1285;
    assign _370 = f_in_fetch & _369;
    assign _371 = _370 ? _270 : _305;
    assign _384 = { _371,
                    _375,
                    _379,
                    _383 };
    assign _762 = _384[287:176];
    assign _763 = _762[41:26];
    assign _764 = { gnd,
                    _763 };
    assign _806 = _764 + _805;
    always @(posedge _278) begin
        if (_276)
            _809 <= _1147;
        else
            _809 <= _806;
    end
    assign gnd = 1'b0;
    assign _761 = { gnd,
                    _758 };
    assign _810 = _761 < _809;
    assign _811 = ~ _810;
    assign _815 = _811 | _814;
    assign _824 = _815 & _823;
    assign _3869 = _357 + _3905;
    assign _3865 = _357 == _1077;
    assign _3866 = ~ _3865;
    assign _3867 = _3863 & _3866;
    assign _3870 = _3867 ? _3869 : _357;
    assign _3849 = _3848[2:2];
    assign _3850 = _1811 & _3849;
    assign _3872 = _3850 ? _1187 : _3870;
    assign _3874 = _1676 ? _1187 : _3872;
    assign _271 = _3874;
    always @(posedge _278) begin
        if (_276)
            _357 <= _1187;
        else
            _357 <= _271;
    end
    assign _3886 = _354 + _3905;
    assign _3882 = _354 == _1077;
    assign _3883 = ~ _3882;
    assign _3861 = 9'b111111111;
    assign _3862 = _3854 == _3861;
    assign _3859 = 6'b111111;
    assign _3858 = _3854[5:0];
    assign _3860 = _3858 == _3859;
    assign _3853 = 9'b000000000;
    assign _3875 = 9'b000000001;
    assign _3876 = _3854 + _3875;
    assign _3878 = _1676 ? _3853 : _3876;
    assign _272 = _3878;
    always @(posedge _278) begin
        if (_276)
            _3854 <= _3853;
        else
            _3854 <= _272;
    end
    assign _3855 = _3854[2:0];
    assign _3857 = _3855 == _2272;
    assign _3851 = _708[63:62];
    always @* begin
        case (_3851)
        0:
            _3863 <= vdd;
        1:
            _3863 <= _3857;
        2:
            _3863 <= _3860;
        default:
            _3863 <= _3862;
        endcase
    end
    assign _3884 = _3863 & _3883;
    assign _3887 = _3884 ? _3886 : _354;
    assign _3879 = _3848[1:1];
    assign _3880 = _1811 & _3879;
    assign _3889 = _3880 ? _1187 : _3887;
    assign _3891 = _1676 ? _1187 : _3889;
    assign _273 = _3891;
    always @(posedge _278) begin
        if (_276)
            _354 <= _1187;
        else
            _354 <= _273;
    end
    assign _757 = _713[25:24];
    always @* begin
        case (_757)
        0:
            _758 <= _351;
        1:
            _758 <= _354;
        2:
            _758 <= _357;
        default:
            _758 <= _357;
        endcase
    end
    assign _760 = _758 == _1077;
    assign _828 = _760 ? _827 : _824;
    always @(posedge _278) begin
        if (_276)
            _339 <= _1237;
        else
            _339 <= _323;
    end
    assign f_chg_now = _323 ^ _339;
    assign _3893 = _300 == _1229;
    assign _3895 = _3893 ? _1237 : _336;
    assign _3892 = _300 == _1228;
    assign _3896 = _3892 ? f_changed_all : _3895;
    assign _3898 = _1676 ? _1237 : _3896;
    assign _274 = _3898;
    always @(posedge _278) begin
        if (_276)
            _336 <= _1237;
        else
            _336 <= _274;
    end
    assign f_changed_all = _336 | f_chg_now;
    assign _751 = f_changed_all & f_chgmask1;
    assign _753 = _751 == _1237;
    assign _754 = ~ _753;
    assign f_chgmask1 = _713[23:16];
    assign _750 = f_chgmask1 == _1237;
    assign _755 = _750 | _754;
    assign _744 = _713[7:0];
    assign _742 = _713[15:8];
    assign vdd = 1'b1;
    assign _276 = clear;
    assign _278 = clock;
    assign _280 = pins_in;
    always @(posedge _278) begin
        if (_276)
            _320 <= _1237;
        else
            _320 <= _280;
    end
    always @(posedge _278) begin
        if (_276)
            _323 <= _1237;
        else
            _323 <= _320;
    end
    assign _743 = _323 ^ _742;
    assign _745 = _743 & _744;
    assign _747 = _745 == _1237;
    assign _713 = _315[287:176];
    assign f_valid1 = _713[111:111];
    assign _748 = f_valid1 & _747;
    assign _756 = _748 & _755;
    assign _829 = _756 & _828;
    assign _834 = _829 & _833;
    assign _873 = _834 & _872;
    assign _874 = f_in_eval & _873;
    assign _878 = _874 & _877;
    assign f_fire1 = _878 & _740;
    assign _1022 = f_fire1 ? _1228 : _1020;
    assign f_winner = f_fire0 ? _2389 : _1022;
    always @* begin
        case (f_winner)
        0:
            _3846 <= _3842;
        1:
            _3846 <= _3843;
        2:
            _3846 <= _3844;
        default:
            _3846 <= _3845;
        endcase
    end
    assign _3848 = _1810 ? _3847 : _3846;
    assign _3899 = _3848[0:0];
    assign _1809 = _367 == _1285;
    assign f_in_fetch = _300 == _1228;
    assign _1810 = f_in_fetch & _1809;
    assign _1811 = _1810 | _1204;
    assign _3900 = _1811 & _3899;
    assign _3909 = _3900 ? _1187 : _3907;
    assign _3911 = _1676 ? _1187 : _3909;
    assign _281 = _3911;
    always @(posedge _278) begin
        if (_276)
            _351 <= _1187;
        else
            _351 <= _281;
    end
    assign _1862 = _708[33:32];
    always @* begin
        case (_1862)
        0:
            _1863 <= _351;
        1:
            _1863 <= _354;
        2:
            _1863 <= _357;
        default:
            _1863 <= _357;
        endcase
    end
    assign _1861 = _708[49:34];
    assign _1864 = _1861 < _1863;
    assign _708 = _315[63:0];
    assign _1859 = _708[31:31];
    assign _1857 = ~ _1204;
    assign _1858 = f_in_eval & _1857;
    assign _1860 = _1858 & _1859;
    assign _1865 = _1860 & _1864;
    assign _1870 = _1865 & _1869;
    assign _1878 = _1870 | f_unexp_now;
    assign f_viol_now = _1878 | f_amb_now;
    assign _3917 = f_viol_now ? _3916 : _367;
    assign _3920 = _1204 ? _3919 : _3917;
    assign _3913 = _300 == _1229;
    assign _3921 = _3913 ? _3920 : _367;
    assign _3912 = _300 == _1228;
    assign _3924 = _3912 ? _3923 : _3921;
    assign _3926 = _1676 ? _1088 : _3924;
    assign _282 = _3926;
    always @(posedge _278) begin
        if (_276)
            _367 <= _1088;
        else
            _367 <= _282;
    end
    assign _3929 = _367 == _1285;
    assign _3930 = _3929 ? _270 : _305;
    assign _3927 = _300 == _1228;
    assign _3931 = _3927 ? _3930 : _305;
    assign _283 = _3931;
    always @(posedge _278) begin
        if (_276)
            _305 <= _304;
        else
            _305 <= _283;
    end
    assign _315 = { _305,
                    _308,
                    _311,
                    _314 };
    assign _316 = _315[175:64];
    assign f_valid0 = _316[111:111];
    assign _330 = f_valid0 & _329;
    assign _347 = _330 & _346;
    assign _596 = _347 & _595;
    assign _653 = _596 & _652;
    assign _697 = _653 & _696;
    assign f_in_eval = _300 == _1229;
    assign _698 = f_in_eval & _697;
    assign _707 = _698 & _706;
    assign f_fire0 = _707 & _740;
    assign _1108 = f_fire0 | f_fire1;
    assign _1109 = _1108 | f_fire2;
    assign _1204 = _1109 | f_fire3;
    assign _3950 = _1204 ? _3949 : _3947;
    assign _3935 = _300 == _1882;
    assign _3937 = _3935 ? _2389 : _300;
    assign _3933 = _300 == _1229;
    assign _3951 = _3933 ? _3950 : _3937;
    assign _3932 = _300 == _1228;
    assign _3954 = _3932 ? _3953 : _3951;
    assign _285 = host_stop;
    assign _3956 = _285 ? _2389 : _3954;
    assign _3958 = _1676 ? _1228 : _3956;
    assign _286 = _3958;
    always @(posedge _278) begin
        if (_276)
            _300 <= _2389;
        else
            _300 <= _286;
    end
    assign _1262 = _300 == _2389;
    assign _288 = host_verify;
    assign _2546 = _288 & _1262;
    assign _2548 = _2546 & _2547;
    assign _3960 = _2548 ? _1670 : f_sweeping;
    assign _3970 = f_sweeping ? _3969 : _3960;
    assign _289 = _3970;
    always @(posedge _278) begin
        if (_276)
            f_sweeping <= _1080;
        else
            f_sweeping <= _289;
    end
    assign _3982 = f_sweeping ? _3981 : _3975;
    assign _290 = _3982;
    always @(posedge _278) begin
        if (_276)
            f_image_valid <= _1080;
        else
            f_image_valid <= _290;
    end
    assign _292 = host_start;
    assign _1676 = _292 & f_image_valid;
    assign _4006 = _1676 ? _1237 : _4004;
    assign _293 = _4006;
    always @(posedge _278) begin
        if (_276)
            _2470 <= _1237;
        else
            _2470 <= _293;
    end
    assign _2471 = _2470[7:7];
    assign _295 = host_pin_src;
    assign _2467 = _295[23:21];
    always @* begin
        case (_2467)
        0:
            _2478 <= _2471;
        1:
            _2478 <= _1414;
        2:
            _2478 <= _2472;
        3:
            _2478 <= _2473;
        4:
            _2478 <= _2475;
        5:
            _2478 <= _1572;
        6:
            _2478 <= _2476;
        default:
            _2478 <= _2477;
        endcase
    end
    assign _2542 = { _2478,
                     _2487,
                     _2496,
                     _2505,
                     _2514,
                     _2523,
                     _2532,
                     _2541 };
    assign _4008 = _2542 & _4007;
    assign pins_out = _4008;
    assign pins_oe = _2545;
    assign st_running = _2402;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1212;
    assign st_accepting = _2401;
    assign st_taken = _2399;
    assign st_taken_edge = _2396;
    assign st_viol = _2393;
    assign st_viol_kind = _2390;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _2385;
    assign st_tx_empty = _612;
    assign st_rx_data = _2383;
    assign st_rx_empty = _1894;
    assign st_vlog_data = _2276;
    assign st_vlog_empty = _1897;
    assign st_cov_rdata = _1905;
    assign st_irq = _1901;
    assign st_halted_viol = _1843;
    assign st_rx_overflow = _1836;
    assign st_vlog_overflow = _1693;
    assign st_cov_overrun = _1683;
    assign st_host_err = _1661;
    assign st_host_err_cause = _1666;
    assign st_lane_active = _1621;
    assign st_image_valid = f_image_valid;
    assign st_verify_busy = f_sweeping;
    assign st_lane_status = _1615;
    assign ram_rec_addr = _1296;
    assign ram_rec_re = _1288;
    assign ram_rec_we = f_store_we;
    assign ram_rec_wdata = _17;
    assign ram_cov_addr = _1281;
    assign ram_cov_re = _1276;
    assign ram_cov_we = _1273;
    assign ram_cov_wdata = _1260;

endmodule
