module spex_core (
    host_cov_wdata,
    host_cov_addr,
    host_rec_wdata,
    host_rec_waddr,
    host_drop_clear,
    host_lane_we,
    host_cov_re,
    host_cov_we,
    host_err_clear,
    host_cover_en,
    host_irq_ack,
    host_tx_wm,
    host_tx_wm_en,
    host_rx_wm,
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
    host_tx_push,
    host_lane0_stuff_len,
    host_tx_data,
    host_lane1_stuff_len,
    host_lane1_lsb_first,
    host_lane1_crc_inv,
    host_lane1_init,
    host_lane1_crc_width,
    host_lane1_poly,
    host_lane1_frame_bits,
    host_lane1_len_max,
    host_lane1_skip,
    host_lane1_len_pos,
    host_lane1_len_en,
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
    host_lane0_lsb_first,
    host_lane0_crc_inv,
    host_lane0_init,
    host_lane0_crc_width,
    host_lane0_poly,
    host_lane0_frame_bits,
    host_lane0_len_max,
    host_lane0_skip,
    host_lane0_len_pos,
    host_lane0_len_en,
    host_lane0_stuff,
    host_lane0_clk_pin,
    host_lane0_clk_edge,
    host_lane0_div_int,
    host_lane0_div_frac,
    host_lane0_data_pin,
    host_lane0_code,
    host_lane0_clk_pin_en,
    host_lane0_readback,
    host_lane0_dir,
    host_rx_to_tx,
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
    st_tx_collision,
    st_drops,
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
    input host_drop_clear;
    input [1:0] host_lane_we;
    input host_cov_re;
    input host_cov_we;
    input host_err_clear;
    input host_cover_en;
    input host_irq_ack;
    input [2:0] host_tx_wm;
    input host_tx_wm_en;
    input [2:0] host_rx_wm;
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
    input host_tx_push;
    input [2:0] host_lane0_stuff_len;
    input [7:0] host_tx_data;
    input [2:0] host_lane1_stuff_len;
    input host_lane1_lsb_first;
    input host_lane1_crc_inv;
    input [31:0] host_lane1_init;
    input [5:0] host_lane1_crc_width;
    input [31:0] host_lane1_poly;
    input [15:0] host_lane1_frame_bits;
    input [3:0] host_lane1_len_max;
    input [5:0] host_lane1_skip;
    input [5:0] host_lane1_len_pos;
    input host_lane1_len_en;
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
    input host_lane0_lsb_first;
    input host_lane0_crc_inv;
    input [31:0] host_lane0_init;
    input [5:0] host_lane0_crc_width;
    input [31:0] host_lane0_poly;
    input [15:0] host_lane0_frame_bits;
    input [3:0] host_lane0_len_max;
    input [5:0] host_lane0_skip;
    input [5:0] host_lane0_len_pos;
    input host_lane0_len_en;
    input [1:0] host_lane0_stuff;
    input [2:0] host_lane0_clk_pin;
    input host_lane0_clk_edge;
    input [15:0] host_lane0_div_int;
    input [7:0] host_lane0_div_frac;
    input [2:0] host_lane0_data_pin;
    input [1:0] host_lane0_code;
    input host_lane0_clk_pin_en;
    input host_lane0_readback;
    input host_lane0_dir;
    input host_rx_to_tx;
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
    output st_tx_collision;
    output [39:0] st_drops;
    output [15:0] st_lane_status;
    output [7:0] ram_rec_addr;
    output ram_rec_re;
    output ram_rec_we;
    output [127:0] ram_rec_wdata;
    output [7:0] ram_cov_addr;
    output ram_cov_re;
    output ram_cov_we;
    output [31:0] ram_cov_wdata;

    wire [11:0] _1297;
    wire _1294;
    wire _1295;
    wire [11:0] _1296;
    wire _1298;
    wire [11:0] _1299;
    wire [11:0] _1300;
    wire [11:0] _1286;
    wire [11:0] _1143;
    wire [11:0] _1140;
    wire [12:0] _1137;
    wire [9:0] _1134;
    wire [12:0] _1135;
    wire [12:0] _1136;
    wire [2:0] _1130;
    reg [2:0] _1110;
    wire [2:0] _1;
    reg [2:0] _1131;
    wire [12:0] _1132;
    wire [12:0] _1117;
    wire [12:0] _1116;
    wire [15:0] _1111;
    wire _1115;
    wire [12:0] _1118;
    wire [12:0] _2;
    reg [12:0] _1127;
    wire _1133;
    wire [12:0] _1138;
    wire [12:0] _1124;
    wire _1139;
    wire [11:0] _1142;
    wire _1122;
    wire [15:0] _1119;
    wire _1120;
    wire _3;
    reg _1123;
    wire [11:0] _1144;
    wire [11:0] _4;
    reg [11:0] _1287;
    wire [11:0] _1147;
    reg [1:0] _1113;
    reg [15:0] _1114;
    wire [15:0] _1145;
    wire _1146;
    wire [11:0] _1149;
    wire [11:0] _5;
    reg [11:0] _1284;
    wire _1288;
    wire _1289;
    wire [11:0] _1290;
    wire [11:0] _1281;
    wire _1291;
    wire [11:0] _1292;
    wire [7:0] _1279;
    wire _1280;
    wire [11:0] _1293;
    wire [7:0] _1277;
    wire [7:0] _1276;
    wire [1:0] _1271;
    wire [1:0] _1270;
    wire _1259;
    wire _1251;
    wire _1260;
    wire _6;
    reg _1269;
    wire [1:0] _1272;
    wire [6:0] _1266;
    wire [8:0] _1273;
    wire [7:0] _1264;
    wire [8:0] _1265;
    wire [8:0] _1274;
    wire _1275;
    wire [7:0] _1278;
    wire [31:0] _1301;
    wire [31:0] _8;
    wire [31:0] _1302;
    wire _1315;
    wire _1313;
    wire _1308;
    wire _1306;
    wire _1305;
    wire _1307;
    wire _1309;
    wire f_host_cov_we;
    wire _1317;
    wire _1316;
    wire _1318;
    wire [7:0] _12;
    reg [7:0] _1322;
    wire [7:0] _14;
    wire [7:0] _1319;
    wire [7:0] _1323;
    wire [127:0] _17;
    wire _1330;
    wire [1:0] _1336;
    wire [7:0] _1337;
    wire [7:0] _1334;
    wire [7:0] _22;
    wire [7:0] _1335;
    wire [2:0] _1327;
    wire _1328;
    wire _1329;
    wire [7:0] _1338;
    wire [2:0] _1490;
    wire [2:0] _1491;
    wire [2:0] _1463;
    wire [2:0] _1465;
    wire [2:0] _1466;
    wire [2:0] _1492;
    wire [2:0] _1494;
    wire [2:0] _1496;
    wire [2:0] _24;
    reg [2:0] _1462;
    wire [7:0] _1656;
    wire [2:0] _1649;
    wire [2:0] _1623;
    wire [2:0] _1624;
    wire [2:0] _1650;
    wire [2:0] _1652;
    wire [2:0] _1654;
    wire [2:0] _25;
    reg [2:0] _1620;
    wire [7:0] _1655;
    wire [15:0] _1657;
    wire [7:0] _1748;
    wire [7:0] _1749;
    wire _1745;
    wire _1746;
    wire _1738;
    wire _1735;
    wire _1736;
    wire _1732;
    wire _1729;
    wire _1730;
    wire _1731;
    wire _1733;
    wire _1737;
    wire _1739;
    wire _1728;
    wire _1740;
    wire _1747;
    wire [7:0] _1750;
    wire [7:0] _1752;
    wire [7:0] _27;
    reg [7:0] _1743;
    wire [7:0] _1851;
    wire _1847;
    wire _1848;
    wire _1840;
    wire _1837;
    wire _1838;
    wire _1834;
    wire _1831;
    wire _1832;
    wire _1833;
    wire _1835;
    wire _1839;
    wire _1841;
    wire _1727;
    wire _1829;
    wire _1830;
    wire _1842;
    wire _1849;
    wire [7:0] _1852;
    wire [7:0] _1854;
    wire [7:0] _28;
    reg [7:0] _1845;
    wire [7:0] _1891;
    wire _1887;
    wire _1888;
    wire _1881;
    wire _1882;
    wire _1889;
    wire [7:0] _1892;
    wire [7:0] _1894;
    wire [7:0] _29;
    reg [7:0] _1885;
    wire [7:0] _1906;
    wire _1902;
    wire _1903;
    wire _1904;
    wire [7:0] _1907;
    wire [7:0] _1909;
    wire [7:0] _30;
    reg [7:0] _1900;
    wire [7:0] _1922;
    wire _1918;
    wire _1919;
    wire _1920;
    wire [7:0] _1923;
    wire _32;
    wire [7:0] _1925;
    wire [7:0] _33;
    reg [7:0] _1916;
    wire [39:0] _1926;
    wire _1961;
    wire _1939;
    wire _1957;
    wire _1962;
    wire _1964;
    wire _35;
    reg _1960;
    wire [1:0] _1970;
    wire [2:0] _2020;
    wire [2:0] _2022;
    wire [2:0] _40;
    reg [2:0] _2019;
    wire _2015;
    wire [2:0] _2005;
    wire [2:0] _2001;
    wire [2:0] _2002;
    wire [2:0] _2006;
    wire [2:0] _1998;
    wire [2:0] _1997;
    wire [2:0] _1999;
    wire [2:0] _2007;
    wire _1993;
    wire _1990;
    wire _1991;
    wire _1992;
    wire _1994;
    wire _1986;
    wire _1987;
    wire _1968;
    wire _1983;
    wire _1984;
    wire _1969;
    wire [1:0] _43;
    wire _1981;
    wire _1982;
    wire _1985;
    wire _1988;
    wire _44;
    reg _1263;
    wire _1977;
    wire _1976;
    wire _1978;
    wire _1974;
    wire _46;
    wire _48;
    wire _1973;
    wire _1975;
    wire _1979;
    wire _1971;
    wire _1972;
    wire _1980;
    wire _1989;
    wire _1995;
    wire [2:0] _2008;
    wire _2010;
    wire _2011;
    wire _2016;
    wire _2024;
    wire _50;
    wire _2026;
    wire _51;
    reg _2014;
    wire [7:0] _53;
    reg [7:0] _1258;
    wire [7:0] _1255;
    wire _1911;
    wire _1912;
    wire _2027;
    wire _2028;
    wire _54;
    reg _1250;
    wire _56;
    wire _1247;
    wire _1910;
    wire _1913;
    wire _2034;
    wire _2036;
    wire _57;
    reg _2032;
    wire _1897;
    wire _2041;
    wire _2043;
    wire _59;
    reg _2039;
    wire _2047;
    wire _1879;
    wire _1872;
    wire _1880;
    wire _1827;
    wire _1823;
    wire _1828;
    wire _2044;
    wire _61;
    wire _2045;
    wire _2046;
    wire _2048;
    wire _2053;
    wire _2055;
    wire _62;
    reg _2051;
    wire _2059;
    wire _2060;
    wire _2065;
    wire _66;
    wire _2067;
    wire _2069;
    wire _67;
    reg _2063;
    wire _2098;
    wire _2100;
    wire _2096;
    wire _2102;
    wire _2103;
    wire _2104;
    wire _2071;
    wire _2105;
    wire _2107;
    wire _68;
    reg _2058;
    wire _2122;
    wire [2:0] _70;
    wire [3:0] _2115;
    wire _2116;
    wire _2117;
    wire _72;
    wire _2118;
    wire [2:0] _74;
    wire _2109;
    wire [2:0] _2111;
    wire [3:0] _2112;
    wire _2113;
    wire _2114;
    wire _2119;
    wire _2123;
    wire _2124;
    wire _2125;
    wire [31:0] _77;
    wire [31:0] _2128;
    wire _2126;
    wire _2127;
    wire [31:0] _2129;
    wire [2:0] _2496;
    wire _2497;
    wire _2498;
    wire [47:0] _2495;
    reg [47:0] _2499;
    wire _2491;
    wire _2492;
    reg [47:0] _2493;
    wire _2485;
    wire _2486;
    reg [47:0] _2487;
    wire _2479;
    wire _2480;
    reg [47:0] _2481;
    wire _2473;
    wire _2474;
    reg [47:0] _2475;
    wire _2467;
    wire _2468;
    reg [47:0] _2469;
    wire _2461;
    wire _2462;
    reg [47:0] _2463;
    wire [2:0] _2136;
    wire [2:0] _2137;
    wire [2:0] _80;
    reg [2:0] _2134;
    wire _2455;
    wire _2456;
    wire [2:0] _2428;
    wire [28:0] _2145;
    wire [28:0] _2144;
    wire [28:0] _2147;
    wire [28:0] _2148;
    wire [2:0] _2141;
    wire _2143;
    wire [28:0] _2149;
    wire [28:0] _81;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2426;
    wire [2:0] _2167;
    wire _2163;
    wire _2164;
    wire _2161;
    wire _2165;
    wire [2:0] _2168;
    wire _2158;
    wire _2159;
    wire _2156;
    wire _2155;
    wire _2157;
    wire _2160;
    wire [2:0] _2170;
    wire _2151;
    wire [2:0] _2171;
    wire [2:0] _82;
    reg [2:0] _2154;
    wire _2417;
    wire [2:0] _2419;
    wire [2:0] _2188;
    wire _2184;
    wire _2185;
    wire _2182;
    wire _2186;
    wire [2:0] _2189;
    wire _2179;
    wire _2180;
    wire _2177;
    wire _2176;
    wire _2178;
    wire _2181;
    wire [2:0] _2191;
    wire _2172;
    wire [2:0] _2192;
    wire [2:0] _83;
    reg [2:0] _2175;
    wire _2414;
    wire [2:0] _2416;
    wire [2:0] _2420;
    wire [2:0] _2209;
    wire _2205;
    wire _2206;
    wire _2203;
    wire _2207;
    wire [2:0] _2210;
    wire _2200;
    wire _2201;
    wire _2198;
    wire _2197;
    wire _2199;
    wire _2202;
    wire [2:0] _2212;
    wire _2193;
    wire [2:0] _2213;
    wire [2:0] _84;
    reg [2:0] _2196;
    wire _2410;
    wire [2:0] _2412;
    wire [2:0] _2230;
    wire _2226;
    wire _2227;
    wire _2224;
    wire _2228;
    wire [2:0] _2231;
    wire _2221;
    wire _2222;
    wire _2219;
    wire _2218;
    wire _2220;
    wire _2223;
    wire [2:0] _2233;
    wire _2214;
    wire [2:0] _2234;
    wire [2:0] _85;
    reg [2:0] _2217;
    wire _2407;
    wire [2:0] _2409;
    wire [2:0] _2413;
    wire [2:0] _2421;
    wire [2:0] _2251;
    wire _2247;
    wire _2248;
    wire _2245;
    wire _2249;
    wire [2:0] _2252;
    wire _2242;
    wire _2243;
    wire _2240;
    wire _2239;
    wire _2241;
    wire _2244;
    wire [2:0] _2254;
    wire _2235;
    wire [2:0] _2255;
    wire [2:0] _86;
    reg [2:0] _2238;
    wire _2402;
    wire [2:0] _2404;
    wire [2:0] _2272;
    wire _2268;
    wire _2269;
    wire _2266;
    wire _2270;
    wire [2:0] _2273;
    wire _2263;
    wire _2264;
    wire _2261;
    wire _2260;
    wire _2262;
    wire _2265;
    wire [2:0] _2275;
    wire _2256;
    wire [2:0] _2276;
    wire [2:0] _87;
    reg [2:0] _2259;
    wire _2399;
    wire [2:0] _2401;
    wire [2:0] _2405;
    wire [2:0] _2293;
    wire _2289;
    wire _2290;
    wire _2287;
    wire _2291;
    wire [2:0] _2294;
    wire _2284;
    wire _2285;
    wire _2282;
    wire _2281;
    wire _2283;
    wire _2286;
    wire [2:0] _2296;
    wire _2277;
    wire [2:0] _2297;
    wire [2:0] _88;
    reg [2:0] _2280;
    wire _2395;
    wire [2:0] _2397;
    wire [2:0] _2314;
    wire _2310;
    wire _2311;
    wire _2308;
    wire _2312;
    wire [2:0] _2315;
    wire _2305;
    wire _2306;
    wire _2303;
    wire _2302;
    wire _2304;
    wire _2307;
    wire [2:0] _2317;
    wire _2298;
    wire [2:0] _2318;
    wire [2:0] _89;
    reg [2:0] _2301;
    wire _2392;
    wire [2:0] _2394;
    wire [2:0] _2398;
    wire [2:0] _2406;
    wire [2:0] _2422;
    wire _2387;
    wire _2386;
    wire _2388;
    wire _2384;
    wire _2383;
    wire _2385;
    wire _2389;
    wire _2380;
    wire _2379;
    wire _2381;
    wire _2377;
    wire _2376;
    wire _2378;
    wire _2382;
    wire _2390;
    wire [2:0] _2423;
    wire _2365;
    wire _2364;
    wire _2366;
    wire [2:0] _2368;
    wire _2360;
    wire _2359;
    wire _2361;
    wire [2:0] _2363;
    wire _2369;
    wire [2:0] _2370;
    wire _2353;
    wire _2352;
    wire _2354;
    wire [2:0] _2356;
    wire _2348;
    wire _2347;
    wire _2349;
    wire [2:0] _2351;
    wire _2357;
    wire [2:0] _2358;
    wire _2371;
    wire [2:0] _2372;
    wire _2339;
    wire _2338;
    wire _2340;
    wire [2:0] _2342;
    wire _2334;
    wire _2333;
    wire _2335;
    wire [2:0] _2337;
    wire _2343;
    wire [2:0] _2344;
    wire _2327;
    wire _2326;
    wire _2328;
    wire [2:0] _2330;
    wire _2322;
    wire _2321;
    wire _2323;
    wire [2:0] _2325;
    wire _2331;
    wire [2:0] _2332;
    wire _2345;
    wire [2:0] _2346;
    wire _2373;
    wire [2:0] _2374;
    wire [2:0] _2375;
    wire [2:0] _2424;
    wire [2:0] _2319;
    wire _2425;
    wire [28:0] _2427;
    wire [31:0] _2429;
    wire [47:0] _2433;
    wire [47:0] _90;
    reg [47:0] _2457;
    wire [2:0] _2450;
    wire [3:0] _2120;
    wire [3:0] _2439;
    wire [3:0] _2440;
    wire [3:0] _2438;
    wire [3:0] _2441;
    wire [3:0] _1895;
    wire _1896;
    wire _2130;
    wire _91;
    wire _2131;
    wire _2436;
    wire [3:0] _2442;
    reg [3:0] _2445;
    wire [3:0] _92;
    wire _2121;
    wire _2434;
    wire _94;
    wire _2435;
    wire [2:0] _2451;
    wire [2:0] _95;
    reg [2:0] _2448;
    reg [47:0] _2500;
    wire _2564;
    wire _2565;
    reg [7:0] _2566;
    wire _2558;
    wire _2559;
    reg [7:0] _2560;
    wire _2552;
    wire _2553;
    reg [7:0] _2554;
    wire _2546;
    wire _2547;
    reg [7:0] _2548;
    wire _2540;
    wire _2541;
    reg [7:0] _2542;
    wire _2534;
    wire _2535;
    reg [7:0] _2536;
    wire _2528;
    wire _2529;
    reg [7:0] _2530;
    wire [2:0] _2509;
    wire [2:0] _2510;
    wire [2:0] _98;
    reg [2:0] _2507;
    wire _2522;
    wire _2523;
    reg [7:0] _2524;
    wire [2:0] _2517;
    wire [2:0] _2518;
    wire [2:0] _99;
    reg [2:0] _2515;
    reg [7:0] _2567;
    wire [31:0] _2568;
    wire [31:0] _2569;
    wire [31:0] _103;
    reg [31:0] ts_reg;
    wire [1:0] _2571;
    wire [1:0] _2430;
    wire [1:0] _2432;
    reg [1:0] _2572;
    reg _2575;
    reg [1:0] _2578;
    reg _2581;
    wire _2582;
    wire _2583;
    wire _2584;
    wire [7:0] _2725;
    wire [7:0] _2726;
    wire [7:0] _2606;
    wire [7:0] _2604;
    wire [7:0] _2603;
    wire [7:0] _2602;
    wire [7:0] _2601;
    reg [7:0] _2605;
    wire [7:0] _2607;
    wire [7:0] _2608;
    wire [7:0] _2599;
    wire [7:0] _2600;
    wire [7:0] _2609;
    wire [7:0] _2643;
    wire [7:0] _2644;
    wire [7:0] _2646;
    wire [7:0] _2648;
    wire [7:0] _113;
    reg [7:0] f_poe;
    wire [7:0] _2727;
    wire [7:0] _116;
    wire [7:0] _4292;
    wire _2722;
    wire _2721;
    wire _2719;
    wire _2720;
    wire _2718;
    wire _2717;
    wire _2716;
    wire [2:0] _2715;
    reg _2723;
    wire _2713;
    wire _2712;
    wire _2710;
    wire _2711;
    wire _2709;
    wire _2708;
    wire _2707;
    wire [2:0] _2706;
    reg _2714;
    wire _2704;
    wire _2703;
    wire _2701;
    wire _2702;
    wire _2700;
    wire _2699;
    wire _2698;
    wire [2:0] _2697;
    reg _2705;
    wire _2695;
    wire _2694;
    wire _2692;
    wire _2693;
    wire _2691;
    wire _2690;
    wire _2689;
    wire [2:0] _2688;
    reg _2696;
    wire _2686;
    wire _2685;
    wire _2683;
    wire _2684;
    wire _2682;
    wire _2681;
    wire _2680;
    wire [2:0] _2679;
    reg _2687;
    wire _2677;
    wire _2676;
    wire _2674;
    wire _2675;
    wire _2673;
    wire _2672;
    wire _2671;
    wire [2:0] _2670;
    reg _2678;
    wire _2668;
    wire _2667;
    wire _2665;
    wire _2666;
    wire _2664;
    wire _2663;
    wire _2662;
    wire [2:0] _2661;
    reg _2669;
    wire _2659;
    wire _2658;
    wire _2656;
    wire _2657;
    wire _2655;
    wire _2654;
    wire [2:0] _4284;
    wire _4281;
    wire [1:0] _4282;
    wire [3:0] _4283;
    wire [6:0] _4285;
    wire [7:0] _4286;
    wire [7:0] _4287;
    wire _2640;
    wire _2639;
    wire _2638;
    wire _2636;
    wire _2637;
    wire _2634;
    wire _2635;
    wire _2631;
    wire _2632;
    wire _2633;
    wire _2628;
    wire _2629;
    wire _2630;
    wire _2625;
    wire _2624;
    wire _2626;
    wire _2623;
    wire _2627;
    wire [7:0] _2641;
    wire _2610;
    wire _2616;
    wire [7:0] _2642;
    wire [7:0] _4279;
    wire [7:0] _4275;
    wire [7:0] _4273;
    wire [7:0] _4272;
    wire [7:0] _4271;
    wire [7:0] _4270;
    reg [7:0] _4274;
    wire [7:0] _4276;
    wire [7:0] _4277;
    wire [7:0] _2597;
    wire [7:0] _2595;
    wire [7:0] _2594;
    wire [7:0] _2593;
    wire [7:0] _2592;
    reg [7:0] _2596;
    wire [7:0] _2598;
    wire [7:0] _4268;
    wire [7:0] _4269;
    wire [7:0] _4278;
    wire [7:0] _4280;
    wire [7:0] _4288;
    wire _2586;
    wire _2587;
    wire _2588;
    wire [7:0] _4289;
    wire [31:0] _118;
    wire [31:0] _4261;
    wire [31:0] _2839;
    wire [30:0] _2837;
    wire [31:0] _2838;
    wire [31:0] _2840;
    wire [30:0] _2834;
    wire [31:0] _2835;
    wire [30:0] _2827;
    wire [31:0] _2828;
    wire [31:0] _2830;
    wire [30:0] _2824;
    wire [31:0] _2825;
    wire [30:0] _2817;
    wire [31:0] _2818;
    wire [31:0] _2820;
    wire [30:0] _2814;
    wire [31:0] _2815;
    wire [30:0] _2807;
    wire [31:0] _2808;
    wire [31:0] _2810;
    wire [30:0] _2804;
    wire [31:0] _2805;
    wire [30:0] _2797;
    wire [31:0] _2798;
    wire [31:0] _2800;
    wire [30:0] _2794;
    wire [31:0] _2795;
    wire [30:0] _2787;
    wire [31:0] _2788;
    wire [31:0] _2790;
    wire [30:0] _2784;
    wire [31:0] _2785;
    wire [30:0] _2777;
    wire [31:0] _2778;
    wire [31:0] _2780;
    wire [30:0] _2774;
    wire [31:0] _2775;
    wire [30:0] _2767;
    wire [31:0] _2768;
    wire [31:0] _2770;
    wire [30:0] _2764;
    wire [31:0] _2765;
    wire [7:0] _2758;
    wire [7:0] _2757;
    wire [7:0] _2756;
    wire [7:0] _2755;
    wire [7:0] _2754;
    wire [7:0] _2753;
    wire [7:0] _2752;
    wire [7:0] _2751;
    wire [7:0] _2750;
    wire [7:0] _2749;
    wire [7:0] _2748;
    wire [7:0] _2747;
    wire [7:0] _2746;
    wire [7:0] _2745;
    wire [7:0] _2744;
    wire [7:0] _2743;
    wire [12:0] _2740;
    wire [12:0] _2741;
    wire [3:0] _2742;
    reg [7:0] _2759;
    wire [23:0] _2739;
    wire [31:0] _2760;
    wire _2737;
    wire _2738;
    wire [31:0] _2842;
    wire [31:0] _2735;
    wire [31:0] _2843;
    wire [31:0] _119;
    reg [31:0] _2733;
    wire [31:0] _2761;
    wire _2762;
    wire [31:0] _2771;
    wire _2772;
    wire [31:0] _2781;
    wire _2782;
    wire [31:0] _2791;
    wire _2792;
    wire [31:0] _2801;
    wire _2802;
    wire [31:0] _2811;
    wire _2812;
    wire [31:0] _2821;
    wire _2822;
    wire [31:0] _2831;
    wire _2832;
    wire [31:0] _2841;
    wire [31:0] _4262;
    wire f_sw_match;
    wire _4264;
    wire _4266;
    wire _1325;
    wire _1324;
    wire f_store_we;
    wire _4256;
    wire _4258;
    wire _4260;
    wire [12:0] _4249;
    wire [12:0] _2847;
    wire [12:0] _2845;
    wire [12:0] _2848;
    wire [12:0] _120;
    reg [12:0] f_sw_cnt;
    wire f_sw_last;
    wire _4252;
    wire _122;
    wire _124;
    wire _4246;
    wire _4247;
    wire _4248;
    wire _4254;
    wire _2729;
    wire [1:0] _4238;
    wire [1:0] _4234;
    wire [1:0] _2097;
    wire _4225;
    wire [1:0] _4227;
    wire _4224;
    wire [1:0] _4229;
    wire _4223;
    wire [1:0] _4231;
    wire [1:0] _4232;
    wire [7:0] _1241;
    wire _1243;
    wire _1234;
    wire [15:0] _1229;
    wire _1230;
    wire _1231;
    wire _1228;
    wire _1232;
    wire _1235;
    wire [3:0] _1225;
    wire _1227;
    wire _1236;
    wire _1223;
    wire _1219;
    wire _1220;
    wire _1217;
    wire _1221;
    wire _1224;
    wire _1215;
    reg [2:0] _1109;
    wire [15:0] _1210;
    wire _1211;
    wire _1208;
    wire _1212;
    wire _1206;
    wire _1213;
    wire _1216;
    wire [1:0] _1205;
    reg _1237;
    wire _1204;
    wire _1238;
    wire _1201;
    wire [3:0] _1199;
    reg _1200;
    wire _1202;
    wire [15:0] _1194;
    wire _1196;
    wire [16:0] _1189;
    wire [15:0] _1185;
    wire [16:0] _1186;
    wire [16:0] _1187;
    reg [16:0] _1190;
    wire _1191;
    wire _1192;
    wire [15:0] _1181;
    wire _1183;
    wire _1098;
    wire [2:0] _1100;
    wire _1095;
    wire [2:0] _1097;
    wire _1101;
    wire [2:0] _1102;
    wire _1090;
    wire [2:0] _1092;
    wire _1087;
    wire [2:0] _1089;
    wire _1093;
    wire [2:0] _1094;
    wire _1103;
    wire [2:0] _1104;
    wire _1080;
    wire [2:0] _1082;
    wire _1077;
    wire [2:0] _1079;
    wire _1083;
    wire [2:0] _1084;
    wire _1072;
    wire [2:0] _1074;
    wire [7:0] _1068;
    wire _1069;
    wire [2:0] _1071;
    wire _1075;
    wire [2:0] _1076;
    wire _1085;
    wire [2:0] _1086;
    wire _1105;
    wire [2:0] _1106;
    wire [13:0] _1173;
    wire [16:0] _1174;
    wire [111:0] _1067;
    wire [15:0] _1171;
    wire [16:0] _1172;
    wire [16:0] _1175;
    reg [16:0] _1178;
    wire [16:0] _1170;
    wire _1179;
    wire _1180;
    wire _1184;
    wire _1193;
    wire [1:0] _1112;
    reg [15:0] _1167;
    wire _1169;
    wire _1197;
    wire [7:0] _1161;
    wire _1163;
    wire _1164;
    wire _1160;
    wire _1165;
    wire [7:0] _1154;
    wire [7:0] _1152;
    wire [7:0] _1153;
    wire [7:0] _1155;
    wire _1157;
    wire _1158;
    wire _1166;
    wire _1198;
    wire _1203;
    wire _1239;
    wire _1240;
    wire _1244;
    wire f_fire3;
    wire [7:0] _746;
    wire _748;
    wire _734;
    wire _730;
    wire _731;
    wire _728;
    wire _732;
    wire _735;
    wire [3:0] _725;
    wire _727;
    wire _736;
    wire _723;
    wire _719;
    wire _720;
    wire _717;
    wire _721;
    wire _724;
    wire _715;
    reg [2:0] _709;
    wire [15:0] _710;
    wire _711;
    wire _705;
    wire _712;
    wire _703;
    wire _713;
    wire _716;
    wire [1:0] _702;
    reg _737;
    wire _701;
    wire _738;
    wire _693;
    wire [3:0] _639;
    reg _692;
    wire _694;
    wire [15:0] _634;
    wire _636;
    wire [15:0] _625;
    wire [16:0] _626;
    wire [16:0] _627;
    reg [16:0] _630;
    wire _631;
    wire _632;
    wire [15:0] _621;
    wire _623;
    wire _587;
    wire [2:0] _607;
    wire _566;
    wire [2:0] _586;
    wire _608;
    wire [2:0] _609;
    wire _543;
    wire [2:0] _563;
    wire _522;
    wire [2:0] _542;
    wire _564;
    wire [2:0] _565;
    wire _610;
    wire [2:0] _611;
    wire _497;
    wire [2:0] _517;
    wire _476;
    wire [2:0] _496;
    wire _518;
    wire [2:0] _519;
    wire _453;
    wire [2:0] _473;
    wire [7:0] _431;
    wire _432;
    wire [2:0] _452;
    wire _474;
    wire [2:0] _475;
    wire _520;
    wire [2:0] _521;
    wire _612;
    wire [2:0] _613;
    wire [16:0] _614;
    wire [111:0] _427;
    wire [15:0] _428;
    wire [16:0] _429;
    wire [16:0] _615;
    reg [16:0] _618;
    wire [16:0] _404;
    wire _619;
    wire _620;
    wire _624;
    wire _633;
    wire [1:0] _390;
    reg [15:0] _400;
    wire _402;
    wire _637;
    wire [7:0] _384;
    wire _386;
    wire _387;
    wire _375;
    wire _388;
    wire [7:0] _368;
    wire [7:0] _366;
    wire [7:0] _367;
    wire [7:0] _369;
    wire _371;
    wire [127:0] _346;
    wire [2:0] _4208;
    wire [5:0] _1253;
    wire [5:0] _126;
    wire [5:0] _2865;
    wire [5:0] _128;
    wire [5:0] _2852;
    wire [5:0] _129;
    reg [5:0] _2851;
    wire _2855;
    wire [5:0] _2856;
    wire [5:0] _2857;
    wire [5:0] _2866;
    wire _2853;
    wire [5:0] _2867;
    wire [5:0] _2868;
    wire [5:0] _130;
    reg [5:0] _1254;
    wire [5:0] _2861;
    wire [5:0] _2860;
    wire [5:0] _2859;
    wire [5:0] _2858;
    reg [5:0] _2862;
    wire _2863;
    wire _2864;
    wire [2:0] _4204;
    wire _4199;
    wire [2:0] _4201;
    wire [7:0] _2088;
    wire _2090;
    wire _2091;
    wire _2086;
    wire _2087;
    wire f_unexp_now;
    wire _2872;
    wire _2873;
    wire _2875;
    wire _2876;
    wire _2871;
    wire _2869;
    wire _2877;
    wire _131;
    reg _2083;
    wire _2084;
    wire [15:0] _4190;
    wire [15:0] _4191;
    wire _4187;
    wire _4188;
    wire _4189;
    wire [15:0] _4192;
    wire [2:0] _4132;
    wire [2:0] _4130;
    wire [2:0] _4129;
    wire [2:0] _4128;
    wire [2:0] _4127;
    wire [7:0] _1055;
    wire _1057;
    wire _1048;
    wire _1044;
    wire _1045;
    wire _1042;
    wire _1046;
    wire _1049;
    wire [3:0] _1039;
    wire _1041;
    wire _1050;
    wire _1037;
    wire _1033;
    wire _1034;
    wire _1031;
    wire _1035;
    wire _1038;
    wire _1029;
    reg [2:0] _1023;
    wire [15:0] _1024;
    wire _1025;
    wire _1019;
    wire _1026;
    wire _1017;
    wire _1027;
    wire _1030;
    wire [1:0] _1016;
    reg _1051;
    wire _1015;
    wire _1052;
    wire _1012;
    wire [3:0] _1010;
    reg _1011;
    wire _1013;
    wire [15:0] _1005;
    wire _1007;
    wire [15:0] _996;
    wire [16:0] _997;
    wire [16:0] _998;
    reg [16:0] _1001;
    wire _1002;
    wire _1003;
    wire [15:0] _992;
    wire _994;
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
    wire [16:0] _985;
    wire [111:0] _942;
    wire [15:0] _943;
    wire [16:0] _944;
    wire [16:0] _986;
    reg [16:0] _989;
    wire [16:0] _941;
    wire _990;
    wire _991;
    wire _995;
    wire _1004;
    wire [1:0] _937;
    reg [15:0] _938;
    wire _940;
    wire _1008;
    wire [7:0] _931;
    wire _933;
    wire _934;
    wire _930;
    wire _935;
    wire [7:0] _924;
    wire [7:0] _922;
    wire [7:0] _923;
    wire [7:0] _925;
    wire _927;
    wire _928;
    wire _936;
    wire _1009;
    wire _1014;
    wire _1053;
    wire _1054;
    wire _1058;
    wire f_fire2;
    wire [1:0] _1062;
    wire [1:0] f_policy;
    wire _781;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _771;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _765;
    wire [7:0] _759;
    wire [7:0] f_chgmask0;
    wire [7:0] _753;
    wire [7:0] f_watch;
    wire [7:0] _754;
    wire [7:0] _760;
    wire [7:0] _766;
    wire [7:0] f_relevant;
    wire [7:0] _773;
    wire _775;
    wire _776;
    wire f_amb_now;
    wire _778;
    wire _782;
    wire [7:0] _744;
    wire [7:0] _2882;
    wire [7:0] _2883;
    wire _2879;
    wire [7:0] _2881;
    wire _2878;
    wire [7:0] _2884;
    wire [7:0] _2886;
    wire [7:0] _132;
    reg [7:0] _743;
    wire [7:0] f_multi_eff;
    wire [7:0] _917;
    wire _919;
    wire _910;
    wire _906;
    wire _907;
    wire _904;
    wire _908;
    wire _911;
    wire [3:0] _901;
    wire _903;
    wire _912;
    wire _899;
    wire _895;
    wire _896;
    wire _893;
    wire _897;
    wire _900;
    wire _891;
    reg [2:0] _885;
    wire [15:0] _886;
    wire _887;
    wire _881;
    wire _888;
    wire _879;
    wire _889;
    wire _892;
    wire [1:0] _878;
    reg _913;
    wire [1:0] _134;
    wire [1:0] _2887;
    wire [1:0] _135;
    reg [1:0] _698;
    wire _700;
    wire _877;
    wire _914;
    wire _874;
    wire _2891;
    wire _2889;
    wire _2892;
    wire _2894;
    wire _2896;
    wire _136;
    reg _691;
    wire [15:0] _138;
    wire [15:0] _140;
    wire [15:0] _2902;
    wire [15:0] _2903;
    wire _2905;
    wire _2907;
    wire _2908;
    wire _2909;
    wire _2910;
    wire _2912;
    wire _2914;
    wire _141;
    reg _688;
    wire _2927;
    wire _2928;
    wire _2930;
    wire _2931;
    wire _2932;
    wire _2933;
    wire _2935;
    wire _142;
    reg g_crc_bad;
    wire _2929;
    wire _2938;
    wire [5:0] _2936;
    wire _2937;
    wire _2939;
    wire _2940;
    wire _2941;
    wire _2942;
    wire _2943;
    wire _2945;
    wire _2947;
    wire _143;
    reg _685;
    wire _2951;
    wire _2949;
    wire _2952;
    wire _2954;
    wire _2956;
    wire _144;
    reg _677;
    wire [15:0] _146;
    wire [15:0] _148;
    wire [15:0] _2962;
    wire [15:0] _2963;
    wire _2965;
    wire _2967;
    wire _2968;
    wire _2969;
    wire _2970;
    wire _2972;
    wire _2974;
    wire _149;
    reg _674;
    wire _2987;
    wire _2988;
    wire _2990;
    wire _2991;
    wire _2992;
    wire _2993;
    wire _2995;
    wire _150;
    reg g_crc_bad_0;
    wire _2989;
    wire _2998;
    wire _2997;
    wire _2999;
    wire _3000;
    wire _3001;
    wire _3002;
    wire _3003;
    wire _3005;
    wire _3007;
    wire _151;
    reg _671;
    wire [7:0] _153;
    wire [6:0] _662;
    wire [6:0] _661;
    wire _663;
    wire [15:0] _658;
    wire _3012;
    wire _3011;
    wire _3013;
    wire _3010;
    wire _3014;
    wire _3009;
    wire _3015;
    wire [14:0] _3008;
    wire [15:0] _3016;
    wire [15:0] _154;
    reg [15:0] _659;
    wire _660;
    wire [3:0] _3029;
    wire [3:0] _3027;
    wire [3:0] _3030;
    wire _2502;
    wire _2511;
    wire _156;
    wire _2512;
    wire _2503;
    wire _3023;
    wire _3019;
    wire _3017;
    wire _3018;
    wire _3020;
    wire _3024;
    wire f_rx_push;
    wire _2504;
    wire _3025;
    wire [3:0] _3031;
    reg [3:0] _3034;
    wire [3:0] _158;
    wire _656;
    wire _652;
    wire [6:0] _3943;
    wire [7:0] _3944;
    wire _3941;
    wire _3940;
    wire _3939;
    wire _3938;
    wire _3937;
    wire _3936;
    wire _3935;
    wire _3934;
    wire [7:0] _3942;
    wire [3:0] _3926;
    wire [3:0] _3924;
    wire [3:0] _3927;
    wire _1726;
    wire _3050;
    wire _3047;
    wire _160;
    wire _3048;
    wire _1722;
    wire [2:0] _1716;
    wire _1711;
    wire g_tx_bit;
    wire _1712;
    wire _1713;
    wire _1714;
    wire [2:0] _1717;
    wire _1719;
    wire _1720;
    wire _1691;
    wire _1721;
    wire _1723;
    wire _1687;
    wire [5:0] _1678;
    wire _1679;
    wire _1680;
    wire [9:0] _1674;
    wire _1676;
    wire _1677;
    wire _1681;
    wire _3914;
    wire _3915;
    wire [1:0] _3918;
    wire _3907;
    wire _3908;
    wire _3909;
    wire _3910;
    wire [1:0] _3912;
    wire [2:0] _3893;
    wire [2:0] _3890;
    wire _3886;
    wire _3884;
    wire _3885;
    wire _3887;
    wire [2:0] _3891;
    wire _3882;
    wire [2:0] _3894;
    wire _3895;
    wire [2:0] _3876;
    wire _3872;
    wire _3870;
    wire _3871;
    wire _3873;
    wire [2:0] _3877;
    wire _3868;
    wire [2:0] _3879;
    wire _3880;
    wire _3896;
    wire _3897;
    wire _3898;
    wire _3864;
    wire _3862;
    wire _3865;
    wire [15:0] _3857;
    wire _3858;
    wire _3855;
    wire _3859;
    wire _3853;
    wire _3854;
    wire _3860;
    wire _3866;
    wire _3899;
    wire [1:0] _3901;
    wire [1:0] _3903;
    wire [1:0] _3849;
    wire _3845;
    wire [1:0] _3847;
    wire [1:0] _3850;
    wire _3126;
    wire _3127;
    wire _161;
    reg _3037;
    wire _3771;
    wire _3769;
    wire _3770;
    reg _3772;
    wire [2:0] _163;
    wire [2:0] _3753;
    wire [2:0] _3754;
    wire [2:0] _3749;
    wire _3745;
    wire _3743;
    wire _3744;
    wire _3746;
    wire [2:0] _3750;
    wire _3741;
    wire [2:0] _3755;
    wire [2:0] _3756;
    wire [2:0] _3735;
    wire [2:0] _3736;
    wire [2:0] _3731;
    wire _3122;
    wire _3121;
    wire _3120;
    wire _3119;
    wire _3118;
    wire _3117;
    wire _3116;
    wire _3112;
    wire _3111;
    wire _3110;
    wire _3109;
    wire _3108;
    wire _3107;
    wire _3106;
    wire _3098;
    wire _3099;
    reg [7:0] _3100;
    wire _3092;
    wire _3093;
    reg [7:0] _3094;
    wire _3086;
    wire _3087;
    reg [7:0] _3088;
    wire _3080;
    wire _3081;
    reg [7:0] _3082;
    wire _3074;
    wire _3075;
    reg [7:0] _3076;
    wire _3068;
    wire _3069;
    reg [7:0] _3070;
    wire _3062;
    wire _3063;
    reg [7:0] _3064;
    wire [2:0] _3129;
    wire [2:0] _3130;
    wire [2:0] _164;
    reg [2:0] _3054;
    wire _3056;
    wire _3057;
    wire [7:0] _3197;
    wire [7:0] _3198;
    wire [7:0] _3148;
    wire [7:0] _3146;
    wire [7:0] _3149;
    wire [7:0] _165;
    reg [7:0] _3135;
    wire [7:0] _3144;
    wire [7:0] _3145;
    wire [7:0] _3190;
    wire [7:0] _3157;
    wire [7:0] _3155;
    wire [7:0] _3158;
    wire [7:0] _166;
    reg [7:0] _3154;
    wire [6:0] _3175;
    wire [7:0] _3176;
    wire [6:0] _3173;
    wire _3171;
    wire _3170;
    wire _3169;
    wire _3168;
    wire _3167;
    wire _3166;
    wire _3165;
    wire _3164;
    wire [2:0] _3162;
    wire [2:0] _3161;
    wire [2:0] _3160;
    wire [2:0] _3159;
    reg [2:0] _3163;
    reg _3172;
    wire [7:0] _3174;
    reg [7:0] _3177;
    wire [7:0] _3178;
    wire [7:0] _167;
    reg [7:0] _651;
    wire _3156;
    wire _3182;
    wire _3150;
    wire _3151;
    wire _3180;
    wire [1:0] _1865;
    wire [1:0] _1864;
    wire [1:0] _1863;
    wire [1:0] _1862;
    reg [1:0] _1866;
    wire [1:0] _1868;
    wire f_eng_push;
    wire _1871;
    wire _1877;
    wire _1874;
    wire _1875;
    wire _1873;
    wire _1876;
    wire _1878;
    wire _3183;
    wire _168;
    reg _1857;
    wire [7:0] _3189;
    wire _3147;
    wire _3187;
    wire _1820;
    wire [2:0] _1814;
    wire _1809;
    wire g_tx_bit_0;
    wire _1810;
    wire _1811;
    wire _1812;
    wire [2:0] _1815;
    wire _1817;
    wire _1818;
    wire _1789;
    wire _1819;
    wire _1821;
    wire _1785;
    wire _1786;
    wire _1822;
    wire _3131;
    wire _3132;
    wire _3185;
    wire _3188;
    wire _169;
    reg _1755;
    wire _1825;
    wire _1824;
    wire _1826;
    wire [7:0] _3191;
    wire [7:0] _3199;
    wire [7:0] _170;
    wire [7:0] _171;
    wire [7:0] _173;
    wire [7:0] _3044;
    reg [7:0] _3058;
    wire [2:0] _3575;
    wire _3572;
    wire _1954;
    wire _1790;
    wire _3562;
    wire _3563;
    wire [1:0] _3566;
    wire _3555;
    wire _3556;
    wire _3557;
    wire _3558;
    wire [1:0] _3560;
    wire [2:0] _3541;
    wire [2:0] _3538;
    wire _3534;
    wire _3532;
    wire _3533;
    wire _3535;
    wire [2:0] _3539;
    wire _3530;
    wire [2:0] _3542;
    wire _3543;
    wire [2:0] _3524;
    wire _3520;
    wire _3518;
    wire _3519;
    wire _3521;
    wire [2:0] _3525;
    wire _3516;
    wire [2:0] _3527;
    wire _3528;
    wire _3544;
    wire _3545;
    wire _3546;
    wire _3512;
    wire _3510;
    wire _3513;
    wire [15:0] _3505;
    wire _3506;
    wire _3503;
    wire _3507;
    wire _3501;
    wire _3502;
    wire _3508;
    wire _3514;
    wire _3547;
    wire [1:0] _3549;
    wire [1:0] _3551;
    wire [1:0] _3497;
    wire _3493;
    wire [1:0] _3495;
    wire [1:0] _3498;
    wire _3227;
    wire _3228;
    wire _174;
    reg _3202;
    wire _3423;
    wire _3421;
    wire _3422;
    reg _3424;
    wire [2:0] _176;
    wire [2:0] _3405;
    wire [2:0] _3406;
    wire [2:0] _3401;
    wire _3397;
    wire _3395;
    wire _3396;
    wire _3398;
    wire [2:0] _3402;
    wire _3393;
    wire [2:0] _3407;
    wire [2:0] _3408;
    wire [2:0] _3387;
    wire [2:0] _3388;
    wire [2:0] _3383;
    wire _3223;
    wire _3222;
    wire _3221;
    wire _3220;
    wire _3219;
    wire _3218;
    wire _3217;
    wire _3213;
    wire _3212;
    wire _3211;
    wire _3210;
    wire _3209;
    wire _3208;
    wire _3207;
    wire [7:0] _3204;
    wire [6:0] _3141;
    wire [7:0] _3142;
    wire [6:0] _3139;
    wire [7:0] _3140;
    wire [7:0] _3143;
    wire [7:0] _3233;
    wire [7:0] _3234;
    wire [7:0] _3235;
    wire [7:0] _3236;
    wire [7:0] _3229;
    wire [7:0] _3230;
    wire [7:0] _3231;
    wire [7:0] _3232;
    wire [7:0] _3237;
    wire [7:0] _177;
    reg [7:0] g_byte;
    wire _1951;
    wire _1948;
    wire _1949;
    wire _1952;
    wire [7:0] _3205;
    wire _3206;
    wire [7:0] _3214;
    wire _179;
    wire [7:0] _3215;
    wire _3216;
    wire [2:0] _3245;
    wire [5:0] _1776;
    wire _1777;
    wire _1778;
    wire [9:0] _1772;
    wire _1774;
    wire _1775;
    wire _1779;
    wire _1780;
    wire [2:0] _3246;
    wire [2:0] _3247;
    wire [2:0] _3248;
    wire [2:0] _3249;
    wire [2:0] _3239;
    wire [2:0] _3240;
    wire [2:0] _3241;
    wire [2:0] _3242;
    wire [2:0] _3243;
    wire [2:0] _3250;
    wire [2:0] _3252;
    wire [2:0] _180;
    reg [2:0] g_bitpos;
    reg _3224;
    wire _182;
    wire [31:0] _184;
    wire [30:0] _3294;
    wire [31:0] _3296;
    wire _3288;
    wire _3289;
    wire [31:0] _3291;
    wire [30:0] _3285;
    wire [31:0] _3287;
    wire [31:0] _3292;
    wire [31:0] _3293;
    wire [5:0] _186;
    wire [5:0] _3262;
    wire [5:0] _3263;
    wire [5:0] _3264;
    wire [5:0] _3265;
    wire [5:0] _3256;
    wire [5:0] _3257;
    wire [5:0] _3258;
    wire [5:0] _3259;
    wire [5:0] _3260;
    wire [5:0] _3266;
    wire [5:0] _3267;
    wire [5:0] _3269;
    wire [5:0] _187;
    reg [5:0] g_left;
    wire _1805;
    wire _1806;
    wire _2919;
    wire _2918;
    wire _2920;
    wire _2921;
    wire [31:0] _3297;
    wire [31:0] _3298;
    wire [31:0] _3299;
    wire [31:0] _189;
    wire _3276;
    wire _3277;
    wire [31:0] _3279;
    wire [30:0] _3273;
    wire [31:0] _3275;
    wire [31:0] _3280;
    wire [30:0] _3270;
    wire [31:0] _3272;
    wire [31:0] _3281;
    wire [31:0] _3282;
    wire [31:0] _3283;
    wire [31:0] _3284;
    wire [31:0] _3300;
    wire [31:0] _3301;
    wire [31:0] _3303;
    wire [31:0] _190;
    reg [31:0] g_crc;
    wire _2925;
    wire _2926;
    wire [7:0] _3319;
    wire [7:0] _3320;
    wire [7:0] _191;
    reg [7:0] g_lim;
    wire [15:0] _1768;
    wire [15:0] _193;
    wire [14:0] _2900;
    wire [15:0] _2901;
    wire [15:0] _3321;
    wire [15:0] _3322;
    wire [15:0] _3323;
    wire [15:0] _3325;
    wire [15:0] _194;
    reg [15:0] g_sr;
    wire [3:0] _3311;
    wire [3:0] _196;
    wire _3312;
    wire [3:0] _3313;
    wire [7:0] _3315;
    wire [5:0] _198;
    wire [7:0] _3309;
    wire [7:0] _3316;
    wire [15:0] _3317;
    wire _3318;
    wire _3344;
    wire [5:0] _200;
    wire [5:0] _3330;
    wire _3331;
    wire [9:0] _3326;
    wire _3328;
    wire _202;
    wire _3329;
    wire _3332;
    wire _3334;
    wire _3335;
    wire _3336;
    wire _3337;
    wire _3338;
    wire _3340;
    wire _3342;
    wire _203;
    reg g_len_cap;
    wire _3345;
    wire _3347;
    wire _204;
    reg g_len_known;
    wire [15:0] _1769;
    wire [15:0] _3367;
    wire _1757;
    wire _1771;
    wire [15:0] _3368;
    wire _1756;
    wire [15:0] _3369;
    wire _3350;
    wire _3348;
    wire _3349;
    wire _3351;
    wire _3353;
    wire _205;
    reg g_last;
    wire _1643;
    wire _1640;
    wire _1644;
    wire _3355;
    wire _3356;
    wire _3357;
    wire _3359;
    wire _206;
    reg g_prev;
    wire _1637;
    wire _1634;
    wire _1638;
    wire _1645;
    wire _1646;
    wire _1647;
    wire [15:0] _3370;
    wire [15:0] _3361;
    wire [15:0] _3362;
    wire [15:0] _3363;
    wire [15:0] _3364;
    wire [15:0] _3365;
    wire [15:0] _3371;
    wire [15:0] _3373;
    wire [15:0] _207;
    reg [15:0] g_cnt;
    wire g_data_left;
    wire _3225;
    wire _3226;
    wire _3379;
    wire _3377;
    wire _3378;
    wire _3380;
    wire [2:0] _3384;
    wire _3375;
    wire [2:0] _3389;
    wire [2:0] _3390;
    wire [2:0] _3391;
    wire [2:0] _3409;
    wire [2:0] _3411;
    wire [2:0] _208;
    reg [2:0] g_run;
    wire _1631;
    wire [1:0] _210;
    wire _1626;
    wire _1627;
    wire _1632;
    wire _1800;
    wire _1807;
    wire _3425;
    wire _3426;
    wire _1795;
    wire _1793;
    wire _1796;
    wire _1797;
    wire _1798;
    wire _3418;
    wire _3415;
    wire _3412;
    wire _3413;
    wire _3416;
    wire _3417;
    wire _3419;
    wire _3427;
    wire _3429;
    wire _3431;
    wire _3433;
    wire _3435;
    wire _211;
    reg f_lane1_out;
    wire _1615;
    wire _1616;
    wire _1609;
    wire _1610;
    wire _1606;
    wire _213;
    wire _1603;
    wire _1604;
    wire _1605;
    wire _1607;
    wire _1611;
    wire _1612;
    wire _1617;
    wire [1:0] _3500;
    wire _1598;
    wire _1599;
    wire _1594;
    wire _1593;
    wire _1592;
    wire _1591;
    wire _1590;
    wire _1589;
    wire _1588;
    wire _1587;
    reg _1595;
    wire _1596;
    wire _1585;
    wire _1584;
    wire _1583;
    wire _1582;
    wire _1581;
    wire _1580;
    wire _1579;
    wire _1578;
    wire [2:0] _215;
    reg _1586;
    wire _1597;
    wire _217;
    wire _1600;
    wire _1576;
    wire _1573;
    wire _1566;
    wire _1564;
    wire [13:0] _1555;
    wire [15:0] _1556;
    wire [14:0] _1552;
    wire [15:0] _1553;
    wire [15:0] _1557;
    wire [14:0] _1549;
    wire [15:0] _1550;
    wire _1547;
    wire [15:0] _1558;
    reg [15:0] _1561;
    wire _1562;
    wire [13:0] _1539;
    wire [15:0] _1540;
    reg [15:0] _1543;
    wire _3481;
    wire _3482;
    wire [15:0] _3483;
    wire [15:0] _3485;
    wire [15:0] _3487;
    wire _3465;
    wire [14:0] _1568;
    wire [15:0] _1569;
    reg [15:0] _1572;
    wire [16:0] _3461;
    wire _3462;
    wire [16:0] _3455;
    reg [16:0] _3458;
    wire [16:0] _3450;
    wire [15:0] _219;
    wire [16:0] _3449;
    wire [16:0] _3451;
    reg [16:0] _3454;
    wire [7:0] _221;
    wire [8:0] _3469;
    wire [7:0] _3471;
    wire [7:0] _3472;
    wire [7:0] _3473;
    wire [7:0] _3475;
    wire [7:0] _222;
    reg [7:0] _3443;
    wire [8:0] _3468;
    wire [8:0] _3470;
    wire _3476;
    wire _3477;
    wire _3478;
    wire _3480;
    wire _223;
    reg _3448;
    wire [16:0] _3459;
    wire [16:0] _3445;
    wire _3460;
    wire _3463;
    wire _3466;
    wire _3444;
    wire _3467;
    wire [15:0] _3489;
    wire _3439;
    wire _3437;
    wire _682;
    wire _3436;
    wire _3438;
    wire _3440;
    wire [15:0] _3490;
    wire [15:0] _3492;
    wire [15:0] _224;
    reg [15:0] _1537;
    wire _1544;
    wire _1545;
    wire _1534;
    wire _1546;
    wire _1563;
    wire _1565;
    wire _1574;
    wire [1:0] _226;
    wire _1530;
    wire _1531;
    wire _1528;
    wire _1532;
    wire _1525;
    wire _1521;
    wire _1520;
    wire _1519;
    wire _1518;
    wire _1517;
    wire _1516;
    wire _1515;
    wire _1514;
    reg _1522;
    wire _1512;
    wire _1511;
    wire _1510;
    wire _1509;
    wire _1508;
    wire _1507;
    wire _1506;
    wire _1505;
    wire [2:0] _228;
    reg _1513;
    wire _1523;
    wire _1524;
    wire _1526;
    wire _1533;
    wire _1577;
    wire _230;
    wire _1601;
    wire _232;
    wire _1504;
    wire _1602;
    wire [1:0] _3552;
    wire _1788;
    wire [1:0] _3554;
    wire _3254;
    wire [1:0] _3561;
    wire _1501;
    wire [1:0] _3567;
    wire _1498;
    wire _1499;
    wire [1:0] _3569;
    wire [1:0] _233;
    reg [1:0] g_mode;
    wire _1503;
    wire _1791;
    wire _1799;
    wire _1953;
    wire _1955;
    wire _1946;
    wire _1945;
    wire _1947;
    wire _1956;
    wire _1937;
    wire _1935;
    wire _1938;
    wire _3570;
    wire _3571;
    wire _234;
    wire _3573;
    wire [2:0] _3576;
    wire [2:0] _235;
    reg [2:0] _3043;
    reg [7:0] _3101;
    wire [7:0] _3103;
    wire [6:0] _3194;
    wire [7:0] _3195;
    wire [6:0] _3192;
    wire [7:0] _3193;
    wire [7:0] _3196;
    wire [7:0] _3581;
    wire [7:0] _3582;
    wire [7:0] _3583;
    wire [7:0] _3584;
    wire [7:0] _3577;
    wire [7:0] _3578;
    wire [7:0] _3579;
    wire [7:0] _3580;
    wire [7:0] _3585;
    wire [7:0] _236;
    reg [7:0] g_byte_0;
    wire _1943;
    wire _1940;
    wire _1941;
    wire _1944;
    wire [7:0] _3104;
    wire _3105;
    wire [7:0] _3113;
    wire _238;
    wire [7:0] _3114;
    wire _3115;
    wire [2:0] _3593;
    wire [2:0] _3594;
    wire [2:0] _3595;
    wire [2:0] _3596;
    wire [2:0] _3597;
    wire [2:0] _3587;
    wire [2:0] _3588;
    wire [2:0] _3589;
    wire [2:0] _3590;
    wire [2:0] _3591;
    wire [2:0] _3598;
    wire [2:0] _3600;
    wire [2:0] _239;
    reg [2:0] g_bitpos_0;
    reg _3123;
    wire _241;
    wire [31:0] _243;
    wire [30:0] _3642;
    wire [31:0] _3644;
    wire _3636;
    wire _3637;
    wire [31:0] _3639;
    wire [30:0] _3633;
    wire [31:0] _3635;
    wire [31:0] _3640;
    wire [31:0] _3641;
    wire [5:0] _245;
    wire [5:0] _3610;
    wire [5:0] _3611;
    wire [5:0] _3612;
    wire [5:0] _3613;
    wire [5:0] _3604;
    wire [5:0] _3605;
    wire [5:0] _3606;
    wire [5:0] _3607;
    wire [5:0] _3608;
    wire [5:0] _3614;
    wire [5:0] _3615;
    wire [5:0] _3617;
    wire [5:0] _246;
    reg [5:0] g_left_0;
    wire _1707;
    wire _1708;
    wire _2979;
    wire _2978;
    wire _2980;
    wire _2981;
    wire [31:0] _3645;
    wire [31:0] _3646;
    wire [31:0] _3647;
    wire [31:0] _248;
    wire _3624;
    wire _3625;
    wire [31:0] _3627;
    wire [30:0] _3621;
    wire [31:0] _3623;
    wire [31:0] _3628;
    wire [30:0] _3618;
    wire [31:0] _3620;
    wire [31:0] _3629;
    wire [31:0] _3630;
    wire [31:0] _3631;
    wire [31:0] _3632;
    wire [31:0] _3648;
    wire [31:0] _3649;
    wire [31:0] _3651;
    wire [31:0] _249;
    reg [31:0] g_crc_0;
    wire _2985;
    wire _2986;
    wire [7:0] _3667;
    wire [7:0] _3668;
    wire [7:0] _250;
    reg [7:0] g_lim_0;
    wire [15:0] _1670;
    wire [15:0] _252;
    wire [14:0] _2960;
    wire [15:0] _2961;
    wire [15:0] _3669;
    wire [15:0] _3670;
    wire [15:0] _3671;
    wire [15:0] _3673;
    wire [15:0] _253;
    reg [15:0] g_sr_0;
    wire [3:0] _3659;
    wire [3:0] _255;
    wire _3660;
    wire [3:0] _3661;
    wire [7:0] _3663;
    wire [5:0] _257;
    wire [7:0] _3657;
    wire [7:0] _3664;
    wire [15:0] _3665;
    wire _3666;
    wire _3692;
    wire [5:0] _259;
    wire [5:0] _3678;
    wire _3679;
    wire [9:0] _3674;
    wire _3676;
    wire _261;
    wire _3677;
    wire _3680;
    wire _3682;
    wire _3683;
    wire _3684;
    wire _3685;
    wire _3686;
    wire _3688;
    wire _3690;
    wire _262;
    reg g_len_cap_0;
    wire _3693;
    wire _3695;
    wire _263;
    reg g_len_known_0;
    wire [15:0] _1671;
    wire [15:0] _3715;
    wire [15:0] _3716;
    wire _1658;
    wire [15:0] _3717;
    wire _3698;
    wire _3696;
    wire _3697;
    wire _3699;
    wire _3701;
    wire _264;
    reg g_last_0;
    wire _1485;
    wire _1482;
    wire _1486;
    wire _3703;
    wire _3704;
    wire _3705;
    wire _3707;
    wire _265;
    reg g_prev_0;
    wire _1479;
    wire _1476;
    wire _1480;
    wire _1487;
    wire _1488;
    wire _1489;
    wire [15:0] _3718;
    wire [15:0] _3709;
    wire [15:0] _3710;
    wire [15:0] _3711;
    wire [15:0] _3712;
    wire [15:0] _3713;
    wire [15:0] _3719;
    wire [15:0] _3721;
    wire [15:0] _266;
    reg [15:0] g_cnt_0;
    wire g_data_left_0;
    wire _3124;
    wire _3125;
    wire _3727;
    wire _3725;
    wire _3726;
    wire _3728;
    wire [2:0] _3732;
    wire _3723;
    wire [2:0] _3737;
    wire [2:0] _3738;
    wire [2:0] _3739;
    wire [2:0] _3757;
    wire [2:0] _3759;
    wire [2:0] _267;
    reg [2:0] g_run_0;
    wire _1473;
    wire [1:0] _269;
    wire _1468;
    wire _1469;
    wire _1474;
    wire _1702;
    wire _1709;
    wire _3773;
    wire _1692;
    wire _1693;
    wire _1701;
    wire _3774;
    wire _1697;
    wire _1695;
    wire _1698;
    wire _1699;
    wire _1700;
    wire _3766;
    wire _3763;
    wire _3760;
    wire _3761;
    wire _3764;
    wire _3765;
    wire _3767;
    wire _3775;
    wire _3777;
    wire _3779;
    wire _3781;
    wire _3783;
    wire _270;
    reg f_lane0_out;
    wire _1457;
    wire _1458;
    wire _1440;
    wire _1441;
    wire _1436;
    wire _1435;
    wire _1434;
    wire _1433;
    wire _1432;
    wire _1431;
    wire _1430;
    wire _1429;
    reg _1437;
    wire _1438;
    wire _1427;
    wire _1426;
    wire _1425;
    wire _1424;
    wire _1423;
    wire _1422;
    wire _1421;
    wire _1420;
    wire [2:0] _272;
    reg _1428;
    wire _1439;
    wire _274;
    wire _1442;
    wire _1418;
    wire _1415;
    wire _1408;
    wire _1406;
    wire [13:0] _1397;
    wire [15:0] _1398;
    wire [14:0] _1394;
    wire [15:0] _1395;
    wire [15:0] _1399;
    wire [14:0] _1391;
    wire [15:0] _1392;
    wire _1389;
    wire [15:0] _1400;
    reg [15:0] _1403;
    wire _1404;
    wire [13:0] _1381;
    wire [15:0] _1382;
    reg [15:0] _1385;
    wire _3829;
    wire _3830;
    wire [15:0] _3831;
    wire [15:0] _3833;
    wire [15:0] _3835;
    wire _3813;
    wire [14:0] _1410;
    wire [15:0] _1411;
    reg [15:0] _1414;
    wire [16:0] _3809;
    wire _3810;
    wire [16:0] _3803;
    reg [16:0] _3806;
    wire [15:0] _276;
    wire [16:0] _3797;
    wire [16:0] _3799;
    reg [16:0] _3802;
    wire [7:0] _278;
    wire [8:0] _3817;
    wire [7:0] _3819;
    wire [7:0] _3820;
    wire [7:0] _3821;
    wire [7:0] _3823;
    wire [7:0] _279;
    reg [7:0] _3791;
    wire [8:0] _3816;
    wire [8:0] _3818;
    wire _3824;
    wire _3825;
    wire _3826;
    wire _3828;
    wire _280;
    reg _3796;
    wire [16:0] _3807;
    wire [16:0] _3793;
    wire _3808;
    wire _3811;
    wire _3814;
    wire _3792;
    wire _3815;
    wire [15:0] _3837;
    wire _3787;
    wire _3785;
    wire _668;
    wire _3784;
    wire _3786;
    wire _3788;
    wire [15:0] _3838;
    wire [15:0] _3840;
    wire [15:0] _281;
    reg [15:0] _1379;
    wire _1386;
    wire _1387;
    wire _1376;
    wire _1388;
    wire _1405;
    wire _1407;
    wire _1416;
    wire _1372;
    wire _1373;
    wire _1370;
    wire _1374;
    wire _1367;
    wire _1363;
    wire _1362;
    wire _1361;
    wire _1360;
    wire _1359;
    wire _1358;
    wire _1357;
    wire _1356;
    reg _1364;
    wire _1354;
    wire _1353;
    wire _1352;
    wire _1351;
    wire _1350;
    wire _1349;
    wire _1348;
    wire _1347;
    wire [2:0] _283;
    reg _1355;
    wire _1365;
    wire _1366;
    wire _1368;
    wire _1375;
    wire _1419;
    wire _1443;
    wire [1:0] _285;
    wire _1451;
    wire _1452;
    wire _287;
    wire _1448;
    wire _289;
    wire _291;
    wire _1445;
    wire _1446;
    wire _1447;
    wire _1449;
    wire _1453;
    wire _1454;
    wire _1459;
    wire [1:0] _3852;
    wire [1:0] _3904;
    wire _1690;
    wire [1:0] _3906;
    wire _3602;
    wire [1:0] _3913;
    wire _1343;
    wire [1:0] _3919;
    wire [2:0] _2621;
    wire [2:0] _2620;
    wire [2:0] _2619;
    wire [2:0] _2618;
    reg [2:0] _2622;
    wire _2614;
    wire _2613;
    wire _2612;
    wire _2611;
    reg _2615;
    wire _3841;
    wire _3842;
    wire [2:0] _3844;
    wire [2:0] _292;
    wire _1340;
    wire _1341;
    wire [1:0] _3921;
    wire [1:0] _293;
    reg [1:0] g_mode_0;
    wire _1345;
    wire _1346;
    wire _1444;
    wire _1659;
    wire _1673;
    wire _1682;
    wire _1688;
    wire _1724;
    wire _3021;
    wire _295;
    wire _3022;
    wire _296;
    wire _3049;
    wire _3051;
    wire _3922;
    wire [3:0] _3928;
    reg [3:0] _3931;
    wire [3:0] _297;
    wire _654;
    wire [7:0] _3933;
    wire [1:0] _1932;
    wire [1:0] _1930;
    wire [1:0] _1929;
    wire [1:0] _1928;
    wire [1:0] _1927;
    reg [1:0] _1931;
    wire [1:0] _1933;
    reg [7:0] _3945;
    wire [7:0] _3946;
    wire [7:0] _298;
    reg [7:0] _647;
    wire _648;
    wire [7:0] _3957;
    wire [7:0] _3956;
    wire [7:0] _3955;
    wire [1:0] _3952;
    wire [111:0] _767;
    wire [1:0] _3950;
    wire [111:0] _761;
    wire [1:0] _3949;
    wire [1:0] _3948;
    wire [1:0] _3947;
    reg [1:0] _3951;
    wire [1:0] _3953;
    reg [7:0] _3958;
    wire [7:0] _3959;
    wire [7:0] _299;
    reg [7:0] _642;
    wire _644;
    wire [3:0] _872;
    reg _873;
    wire _875;
    wire [15:0] _867;
    wire _869;
    wire [15:0] _858;
    wire [16:0] _859;
    wire [16:0] _860;
    reg [16:0] _863;
    wire _864;
    wire _865;
    wire [15:0] _854;
    wire _856;
    wire [2:0] _602;
    wire [2:0] _3974;
    wire _3970;
    wire _3971;
    wire _3968;
    wire _3972;
    wire [2:0] _3975;
    wire _3965;
    wire _3966;
    wire _3964;
    wire _3967;
    wire [2:0] _3977;
    wire _3961;
    wire [2:0] _3963;
    wire _3960;
    wire [2:0] _3978;
    wire [2:0] _300;
    reg [2:0] _598;
    wire _600;
    wire [2:0] _603;
    wire _593;
    wire _594;
    wire _592;
    wire _595;
    wire [2:0] _605;
    wire _589;
    wire _590;
    wire [2:0] _606;
    wire _838;
    wire [2:0] _840;
    wire [2:0] _581;
    wire [2:0] _3993;
    wire _3989;
    wire _3990;
    wire _3987;
    wire _3991;
    wire [2:0] _3994;
    wire _3984;
    wire _3985;
    wire _3983;
    wire _3986;
    wire [2:0] _3996;
    wire _3980;
    wire [2:0] _3982;
    wire _3979;
    wire [2:0] _3997;
    wire [2:0] _301;
    reg [2:0] _577;
    wire _579;
    wire [2:0] _582;
    wire _572;
    wire _573;
    wire _571;
    wire _574;
    wire [2:0] _584;
    wire _568;
    wire _569;
    wire [2:0] _585;
    wire _835;
    wire [2:0] _837;
    wire _841;
    wire [2:0] _842;
    wire [2:0] _558;
    wire [2:0] _4012;
    wire _4008;
    wire _4009;
    wire _4006;
    wire _4010;
    wire [2:0] _4013;
    wire _4003;
    wire _4004;
    wire _4002;
    wire _4005;
    wire [2:0] _4015;
    wire _3999;
    wire [2:0] _4001;
    wire _3998;
    wire [2:0] _4016;
    wire [2:0] _302;
    reg [2:0] _554;
    wire _556;
    wire [2:0] _559;
    wire _549;
    wire _550;
    wire _548;
    wire _551;
    wire [2:0] _561;
    wire _545;
    wire _546;
    wire [2:0] _562;
    wire _830;
    wire [2:0] _832;
    wire [2:0] _537;
    wire [2:0] _4031;
    wire _4027;
    wire _4028;
    wire _4025;
    wire _4029;
    wire [2:0] _4032;
    wire _4022;
    wire _4023;
    wire _4021;
    wire _4024;
    wire [2:0] _4034;
    wire _4018;
    wire [2:0] _4020;
    wire _4017;
    wire [2:0] _4035;
    wire [2:0] _303;
    reg [2:0] _533;
    wire _535;
    wire [2:0] _538;
    wire _528;
    wire _529;
    wire _527;
    wire _530;
    wire [2:0] _540;
    wire _524;
    wire _525;
    wire [2:0] _541;
    wire _827;
    wire [2:0] _829;
    wire _833;
    wire [2:0] _834;
    wire _843;
    wire [2:0] _844;
    wire [2:0] _512;
    wire [2:0] _4050;
    wire _4046;
    wire _4047;
    wire _4044;
    wire _4048;
    wire [2:0] _4051;
    wire _4041;
    wire _4042;
    wire _4040;
    wire _4043;
    wire [2:0] _4053;
    wire _4037;
    wire [2:0] _4039;
    wire _4036;
    wire [2:0] _4054;
    wire [2:0] _304;
    reg [2:0] _508;
    wire _510;
    wire [2:0] _513;
    wire _503;
    wire _504;
    wire _502;
    wire _505;
    wire [2:0] _515;
    wire _499;
    wire _500;
    wire [2:0] _516;
    wire _820;
    wire [2:0] _822;
    wire [2:0] _491;
    wire [2:0] _4069;
    wire _4065;
    wire _4066;
    wire _4063;
    wire _4067;
    wire [2:0] _4070;
    wire _4060;
    wire _4061;
    wire _4059;
    wire _4062;
    wire [2:0] _4072;
    wire _4056;
    wire [2:0] _4058;
    wire _4055;
    wire [2:0] _4073;
    wire [2:0] _305;
    reg [2:0] _487;
    wire _489;
    wire [2:0] _492;
    wire _482;
    wire _483;
    wire _481;
    wire _484;
    wire [2:0] _494;
    wire _478;
    wire _479;
    wire [2:0] _495;
    wire _817;
    wire [2:0] _819;
    wire _823;
    wire [2:0] _824;
    wire [2:0] _468;
    wire [2:0] _4088;
    wire _4084;
    wire _4085;
    wire _4082;
    wire _4086;
    wire [2:0] _4089;
    wire _4079;
    wire _4080;
    wire _4078;
    wire _4081;
    wire [2:0] _4091;
    wire _4075;
    wire [2:0] _4077;
    wire _4074;
    wire [2:0] _4092;
    wire [2:0] _306;
    reg [2:0] _464;
    wire _466;
    wire [2:0] _469;
    wire _459;
    wire _460;
    wire _458;
    wire _461;
    wire [2:0] _471;
    wire _455;
    wire _456;
    wire [2:0] _472;
    wire _812;
    wire [2:0] _814;
    wire [2:0] _447;
    wire [2:0] _4107;
    wire _4103;
    wire _4104;
    wire _4101;
    wire _4105;
    wire [2:0] _4108;
    wire _4098;
    wire _4099;
    wire _4097;
    wire _4100;
    wire [2:0] _4110;
    wire _4094;
    wire [2:0] _4096;
    wire _4093;
    wire [2:0] _4111;
    wire [2:0] _307;
    reg [2:0] _443;
    wire _445;
    wire [2:0] _448;
    wire _438;
    wire _439;
    wire _437;
    wire _440;
    wire [2:0] _450;
    wire _434;
    wire _435;
    wire [2:0] _451;
    wire [7:0] _808;
    wire _809;
    wire [2:0] _811;
    wire _815;
    wire [2:0] _816;
    wire _825;
    wire [2:0] _826;
    wire _845;
    wire [2:0] _846;
    wire [16:0] _847;
    wire _4114;
    wire [127:0] _4115;
    wire _4112;
    wire [127:0] _4116;
    wire [127:0] _308;
    reg [127:0] _356;
    wire _423;
    wire _424;
    wire [127:0] _425;
    wire _4119;
    wire [127:0] _4120;
    wire _4117;
    wire [127:0] _4121;
    wire [127:0] _309;
    reg [127:0] _353;
    wire _419;
    wire _420;
    wire [127:0] _421;
    wire _4124;
    wire [127:0] _4125;
    wire _4122;
    wire [127:0] _4126;
    wire [127:0] _310;
    reg [127:0] _350;
    wire _415;
    wire _416;
    wire [127:0] _417;
    wire [127:0] _312;
    wire _411;
    wire _412;
    wire [127:0] _413;
    wire [511:0] _426;
    wire [111:0] _804;
    wire [15:0] _805;
    wire [16:0] _806;
    wire [16:0] _848;
    reg [16:0] _851;
    wire gnd;
    wire [16:0] _803;
    wire _852;
    wire _853;
    wire _857;
    wire _866;
    wire [15:0] _4154;
    wire _4150;
    wire _4151;
    wire _4152;
    wire [15:0] _4155;
    wire _4134;
    wire _4135;
    wire [15:0] _4157;
    wire [15:0] _4159;
    wire [15:0] _313;
    reg [15:0] _399;
    wire [15:0] _4171;
    wire _4167;
    wire _4168;
    wire [8:0] _4146;
    wire _4147;
    wire [5:0] _4144;
    wire [5:0] _4143;
    wire _4145;
    wire [8:0] _4138;
    wire [8:0] _4160;
    wire [8:0] _4161;
    wire [8:0] _4163;
    wire [8:0] _314;
    reg [8:0] _4139;
    wire [2:0] _4140;
    wire _4142;
    wire [1:0] _4136;
    reg _4148;
    wire _4169;
    wire [15:0] _4172;
    wire _4164;
    wire _4165;
    wire [15:0] _4174;
    wire [15:0] _4176;
    wire [15:0] _315;
    reg [15:0] _396;
    wire [1:0] _799;
    reg [15:0] _800;
    wire _802;
    wire _870;
    reg [7:0] _381;
    wire [7:0] f_chg_now;
    wire _4178;
    wire [7:0] _4180;
    wire _4177;
    wire [7:0] _4181;
    wire [7:0] _4183;
    wire [7:0] _316;
    reg [7:0] _378;
    wire [7:0] f_changed_all;
    wire [7:0] _793;
    wire _795;
    wire _796;
    wire [7:0] f_chgmask1;
    wire _792;
    wire _797;
    wire [7:0] _786;
    wire [7:0] _784;
    wire vdd;
    wire _318;
    wire _320;
    wire [7:0] _322;
    reg [7:0] _362;
    reg [7:0] _365;
    wire [7:0] _785;
    wire [7:0] _787;
    wire _789;
    wire [111:0] _755;
    wire f_valid1;
    wire _790;
    wire _798;
    wire _871;
    wire _876;
    wire _915;
    wire _916;
    wire _920;
    wire f_fire1;
    wire [1:0] _1064;
    wire [1:0] f_winner;
    reg [2:0] _4131;
    wire [2:0] _4133;
    wire _4184;
    wire _1859;
    wire f_in_fetch;
    wire _1860;
    wire _1861;
    wire _4185;
    wire [15:0] _4194;
    wire [15:0] _4196;
    wire [15:0] _323;
    reg [15:0] _393;
    wire [1:0] _2077;
    reg [15:0] _2078;
    wire [15:0] _2076;
    wire _2079;
    wire [63:0] _750;
    wire _2074;
    wire _2072;
    wire _2073;
    wire _2075;
    wire _2080;
    wire _2085;
    wire _2093;
    wire f_viol_now;
    wire [2:0] _4202;
    wire [2:0] _4205;
    wire _4198;
    wire [2:0] _4206;
    wire _4197;
    wire [2:0] _4209;
    wire [2:0] _4211;
    wire [2:0] _324;
    reg [2:0] _409;
    wire _4214;
    wire [127:0] _4215;
    wire _4212;
    wire [127:0] _4216;
    wire [127:0] _325;
    reg [127:0] _347;
    wire [511:0] _357;
    wire [111:0] _358;
    wire f_valid0;
    wire _372;
    wire _389;
    wire _638;
    wire _695;
    wire _739;
    wire f_in_eval;
    wire _740;
    wire _749;
    wire f_fire0;
    wire _1150;
    wire _1151;
    wire _1246;
    wire [1:0] _4235;
    wire _4220;
    wire [1:0] _4222;
    wire _4218;
    wire [1:0] _4236;
    wire _4217;
    wire [1:0] _4239;
    wire _327;
    wire [1:0] _4241;
    wire [1:0] _4243;
    wire [1:0] _328;
    reg [1:0] _342;
    wire _1304;
    wire _330;
    wire _2728;
    wire _2730;
    wire _4245;
    wire _4255;
    wire _331;
    reg f_sweeping;
    wire _4267;
    wire _332;
    reg f_image_valid;
    wire _334;
    wire _2029;
    wire [7:0] _4291;
    wire [7:0] _335;
    reg [7:0] f_pout;
    wire _2653;
    wire [23:0] _337;
    wire [2:0] _2649;
    reg _2660;
    wire [7:0] _2724;
    wire [7:0] _4293;
    assign _1297 = _77[11:0];
    assign _1294 = _1287 < _1284;
    assign _1295 = _1269 & _1294;
    assign _1296 = _1295 ? _1284 : _1287;
    assign _1298 = _1296 < _1297;
    assign _1299 = _1298 ? _1297 : _1296;
    assign _1300 = _1280 ? _1296 : _1299;
    assign _1286 = 12'b000000000000;
    assign _1143 = 12'b111111111111;
    assign _1140 = _1138[11:0];
    assign _1137 = 13'b0000000000000;
    assign _1134 = 10'b0000000000;
    assign _1135 = { _1134,
                     _1131 };
    assign _1136 = _1127 - _1135;
    assign _1130 = 3'b000;
    always @* begin
        case (f_winner)
        0:
            _1110 <= _709;
        1:
            _1110 <= _885;
        2:
            _1110 <= _1023;
        default:
            _1110 <= _1109;
        endcase
    end
    assign _1 = _1110;
    always @(posedge _320) begin
        if (_318)
            _1131 <= _1130;
        else
            _1131 <= _1;
    end
    assign _1132 = { _1134,
                     _1131 };
    assign _1117 = 13'b1111111111111;
    assign _1116 = _1114[12:0];
    assign _1111 = 16'b0001111111111111;
    assign _1115 = _1111 < _1114;
    assign _1118 = _1115 ? _1117 : _1116;
    assign _2 = _1118;
    always @(posedge _320) begin
        if (_318)
            _1127 <= _1137;
        else
            _1127 <= _2;
    end
    assign _1133 = _1127 < _1132;
    assign _1138 = _1133 ? _1137 : _1136;
    assign _1124 = 13'b0111111111111;
    assign _1139 = _1124 < _1138;
    assign _1142 = _1139 ? _1143 : _1140;
    assign _1122 = 1'b0;
    assign _1119 = 16'b1111111111111111;
    assign _1120 = _1114 == _1119;
    assign _3 = _1120;
    always @(posedge _320) begin
        if (_318)
            _1123 <= _1122;
        else
            _1123 <= _3;
    end
    assign _1144 = _1123 ? _1143 : _1142;
    assign _4 = _1144;
    always @(posedge _320) begin
        if (_318)
            _1287 <= _1286;
        else
            _1287 <= _4;
    end
    assign _1147 = _1114[11:0];
    always @* begin
        case (f_winner)
        0:
            _1113 <= _390;
        1:
            _1113 <= _799;
        2:
            _1113 <= _937;
        default:
            _1113 <= _1112;
        endcase
    end
    always @* begin
        case (_1113)
        0:
            _1114 <= _393;
        1:
            _1114 <= _396;
        2:
            _1114 <= _399;
        default:
            _1114 <= _399;
        endcase
    end
    assign _1145 = 16'b0000111111111111;
    assign _1146 = _1145 < _1114;
    assign _1149 = _1146 ? _1143 : _1147;
    assign _5 = _1149;
    always @(posedge _320) begin
        if (_318)
            _1284 <= _1286;
        else
            _1284 <= _5;
    end
    assign _1288 = _1284 < _1287;
    assign _1289 = _1269 & _1288;
    assign _1290 = _1289 ? _1284 : _1287;
    assign _1281 = _77[23:12];
    assign _1291 = _1281 < _1290;
    assign _1292 = _1291 ? _1281 : _1290;
    assign _1279 = 8'b00000000;
    assign _1280 = _1264 == _1279;
    assign _1293 = _1280 ? _1290 : _1292;
    assign _1277 = 8'b11111111;
    assign _1276 = _1274[7:0];
    assign _1271 = 2'b10;
    assign _1270 = 2'b01;
    assign _1259 = _1255 == _1258;
    assign _1251 = _1247 & _1250;
    assign _1260 = _1251 & _1259;
    assign _6 = _1260;
    always @(posedge _320) begin
        if (_318)
            _1269 <= _1122;
        else
            _1269 <= _6;
    end
    assign _1272 = _1269 ? _1271 : _1270;
    assign _1266 = 7'b0000000;
    assign _1273 = { _1266,
                     _1272 };
    assign _1264 = _77[31:24];
    assign _1265 = { gnd,
                     _1264 };
    assign _1274 = _1265 + _1273;
    assign _1275 = _1274[8:8];
    assign _1278 = _1275 ? _1277 : _1276;
    assign _1301 = { _1278,
                     _1293,
                     _1300 };
    assign _8 = host_cov_wdata;
    assign _1302 = _1263 ? _1301 : _8;
    assign _1315 = _1263 | f_host_cov_we;
    assign _1313 = ~ f_sweeping;
    assign _1308 = ~ _1250;
    assign _1306 = ~ _1263;
    assign _1305 = _48 & _1304;
    assign _1307 = _1305 & _1306;
    assign _1309 = _1307 & _1308;
    assign f_host_cov_we = _1309 & _1313;
    assign _1317 = ~ f_host_cov_we;
    assign _1316 = ~ _1263;
    assign _1318 = _1316 & _1317;
    assign _12 = _1258;
    always @(posedge _320) begin
        if (_318)
            _1322 <= _1279;
        else
            _1322 <= _12;
    end
    assign _14 = host_cov_addr;
    assign _1319 = _1250 ? _1258 : _14;
    assign _1323 = _1263 ? _1322 : _1319;
    assign _17 = host_rec_wdata;
    assign _1330 = _1329 | f_sweeping;
    assign _1336 = _409[1:0];
    assign _1337 = { _1254,
                     _1336 };
    assign _1334 = f_sw_cnt[11:4];
    assign _22 = host_rec_waddr;
    assign _1335 = f_sweeping ? _1334 : _22;
    assign _1327 = 3'b100;
    assign _1328 = _409 < _1327;
    assign _1329 = f_in_fetch & _1328;
    assign _1338 = _1329 ? _1337 : _1335;
    assign _1490 = 3'b001;
    assign _1491 = _1489 ? _1490 : _1466;
    assign _1463 = 3'b010;
    assign _1465 = f_lane0_out ? _1327 : _1463;
    assign _1466 = _1459 ? _1465 : _1462;
    assign _1492 = _1444 ? _1491 : _1466;
    assign _1494 = _1343 ? _1130 : _1492;
    assign _1496 = _1341 ? _1130 : _1494;
    assign _24 = _1496;
    always @(posedge _320) begin
        if (_318)
            _1462 <= _1130;
        else
            _1462 <= _24;
    end
    assign _1656 = { _668,
                     _671,
                     _674,
                     _677,
                     gnd,
                     _1462 };
    assign _1649 = _1647 ? _1490 : _1624;
    assign _1623 = f_lane1_out ? _1327 : _1463;
    assign _1624 = _1617 ? _1623 : _1620;
    assign _1650 = _1602 ? _1649 : _1624;
    assign _1652 = _1501 ? _1130 : _1650;
    assign _1654 = _1499 ? _1130 : _1652;
    assign _25 = _1654;
    always @(posedge _320) begin
        if (_318)
            _1620 <= _1130;
        else
            _1620 <= _25;
    end
    assign _1655 = { _682,
                     _685,
                     _688,
                     _691,
                     gnd,
                     _1620 };
    assign _1657 = { _1655,
                     _1656 };
    assign _1748 = 8'b00000001;
    assign _1749 = _1743 + _1748;
    assign _1745 = _1743 == _1277;
    assign _1746 = ~ _1745;
    assign _1738 = ~ _1688;
    assign _1735 = _1717 == _1130;
    assign _1736 = ~ _1735;
    assign _1732 = _1345 | _668;
    assign _1729 = ~ _1690;
    assign _1730 = _1341 & _1729;
    assign _1731 = _1730 & _291;
    assign _1733 = _1731 & _1732;
    assign _1737 = _1733 & _1736;
    assign _1739 = _1737 & _1738;
    assign _1728 = _1724 & _1727;
    assign _1740 = _1728 | _1739;
    assign _1747 = _1740 & _1746;
    assign _1750 = _1747 ? _1749 : _1743;
    assign _1752 = _32 ? _1279 : _1750;
    assign _27 = _1752;
    always @(posedge _320) begin
        if (_318)
            _1743 <= _1279;
        else
            _1743 <= _27;
    end
    assign _1851 = _1845 + _1748;
    assign _1847 = _1845 == _1277;
    assign _1848 = ~ _1847;
    assign _1840 = ~ _1786;
    assign _1837 = _1815 == _1130;
    assign _1838 = ~ _1837;
    assign _1834 = _1503 | _682;
    assign _1831 = ~ _1788;
    assign _1832 = _1499 & _1831;
    assign _1833 = _1832 & _232;
    assign _1835 = _1833 & _1834;
    assign _1839 = _1835 & _1838;
    assign _1841 = _1839 & _1840;
    assign _1727 = _295 ? _1726 : _656;
    assign _1829 = _1826 & _1727;
    assign _1830 = _1828 | _1829;
    assign _1842 = _1830 | _1841;
    assign _1849 = _1842 & _1848;
    assign _1852 = _1849 ? _1851 : _1845;
    assign _1854 = _32 ? _1279 : _1852;
    assign _28 = _1854;
    always @(posedge _320) begin
        if (_318)
            _1845 <= _1279;
        else
            _1845 <= _28;
    end
    assign _1891 = _1885 + _1748;
    assign _1887 = _1885 == _1277;
    assign _1888 = ~ _1887;
    assign _1881 = _1878 & _656;
    assign _1882 = _1880 | _1881;
    assign _1889 = _1882 & _1888;
    assign _1892 = _1889 ? _1891 : _1885;
    assign _1894 = _32 ? _1279 : _1892;
    assign _29 = _1894;
    always @(posedge _320) begin
        if (_318)
            _1885 <= _1279;
        else
            _1885 <= _29;
    end
    assign _1906 = _1900 + _1748;
    assign _1902 = _1900 == _1277;
    assign _1903 = ~ _1902;
    assign _1904 = _1897 & _1903;
    assign _1907 = _1904 ? _1906 : _1900;
    assign _1909 = _32 ? _1279 : _1907;
    assign _30 = _1909;
    always @(posedge _320) begin
        if (_318)
            _1900 <= _1279;
        else
            _1900 <= _30;
    end
    assign _1922 = _1916 + _1748;
    assign _1918 = _1916 == _1277;
    assign _1919 = ~ _1918;
    assign _1920 = _1913 & _1919;
    assign _1923 = _1920 ? _1922 : _1916;
    assign _32 = host_drop_clear;
    assign _1925 = _32 ? _1279 : _1923;
    assign _33 = _1925;
    always @(posedge _320) begin
        if (_318)
            _1916 <= _1279;
        else
            _1916 <= _33;
    end
    assign _1926 = { _1916,
                     _1900,
                     _1885,
                     _1845,
                     _1743 };
    assign _1961 = 1'b1;
    assign _1939 = _1861 & _1938;
    assign _1957 = _1939 & _1956;
    assign _1962 = _1957 ? _1961 : _1960;
    assign _1964 = _50 ? _1122 : _1962;
    assign _35 = _1964;
    always @(posedge _320) begin
        if (_318)
            _1960 <= _1122;
        else
            _1960 <= _35;
    end
    assign _1970 = { _1968,
                     _1969 };
    assign _2020 = _2016 ? _2008 : _2019;
    assign _2022 = _50 ? _1130 : _2020;
    assign _40 = _2022;
    always @(posedge _320) begin
        if (_318)
            _2019 <= _1130;
        else
            _2019 <= _40;
    end
    assign _2015 = ~ _2014;
    assign _2005 = _1972 ? _1490 : _1463;
    assign _2001 = 3'b011;
    assign _2002 = _1985 ? _2001 : _1327;
    assign _2006 = _1980 ? _2005 : _2002;
    assign _1998 = 3'b101;
    assign _1997 = 3'b110;
    assign _1999 = _1992 ? _1998 : _1997;
    assign _2007 = _1989 ? _2006 : _1999;
    assign _1993 = _160 & _295;
    assign _1990 = _124 | _48;
    assign _1991 = _1990 | _46;
    assign _1992 = f_sweeping & _1991;
    assign _1994 = _1992 | _1993;
    assign _1986 = ~ f_image_valid;
    assign _1987 = _334 & _1986;
    assign _1968 = _1528 | _1503;
    assign _1983 = _43[1:1];
    assign _1984 = _1983 & _1968;
    assign _1969 = _1370 | _1345;
    assign _43 = host_lane_we;
    assign _1981 = _43[0:0];
    assign _1982 = _1981 & _1969;
    assign _1985 = _1982 | _1984;
    assign _1988 = _1985 | _1987;
    assign _44 = _1250;
    always @(posedge _320) begin
        if (_318)
            _1263 <= _1122;
        else
            _1263 <= _44;
    end
    assign _1977 = _1250 | _1263;
    assign _1976 = _48 & _1304;
    assign _1978 = _1976 & _1977;
    assign _1974 = ~ _1304;
    assign _46 = host_cov_re;
    assign _48 = host_cov_we;
    assign _1973 = _48 | _46;
    assign _1975 = _1973 & _1974;
    assign _1979 = _1975 | _1978;
    assign _1971 = ~ _1304;
    assign _1972 = _124 & _1971;
    assign _1980 = _1972 | _1979;
    assign _1989 = _1980 | _1988;
    assign _1995 = _1989 | _1994;
    assign _2008 = _1995 ? _2007 : _1130;
    assign _2010 = _2008 == _1130;
    assign _2011 = ~ _2010;
    assign _2016 = _2011 & _2015;
    assign _2024 = _2016 ? _1961 : _2014;
    assign _50 = host_err_clear;
    assign _2026 = _50 ? _1122 : _2024;
    assign _51 = _2026;
    always @(posedge _320) begin
        if (_318)
            _2014 <= _1122;
        else
            _2014 <= _51;
    end
    assign _53 = _1255;
    always @(posedge _320) begin
        if (_318)
            _1258 <= _1279;
        else
            _1258 <= _53;
    end
    assign _1255 = { _1254,
                     f_winner };
    assign _1911 = _1255 == _1258;
    assign _1912 = ~ _1911;
    assign _2027 = ~ _1250;
    assign _2028 = _1247 & _2027;
    assign _54 = _2028;
    always @(posedge _320) begin
        if (_318)
            _1250 <= _1122;
        else
            _1250 <= _54;
    end
    assign _56 = host_cover_en;
    assign _1247 = _1246 & _56;
    assign _1910 = _1247 & _1250;
    assign _1913 = _1910 & _1912;
    assign _2034 = _1913 ? _1961 : _2032;
    assign _2036 = _2029 ? _1122 : _2034;
    assign _57 = _2036;
    always @(posedge _320) begin
        if (_318)
            _2032 <= _1122;
        else
            _2032 <= _57;
    end
    assign _1897 = _91 & _1896;
    assign _2041 = _1897 ? _1961 : _2039;
    assign _2043 = _2029 ? _1122 : _2041;
    assign _59 = _2043;
    always @(posedge _320) begin
        if (_318)
            _2039 <= _1122;
        else
            _2039 <= _59;
    end
    assign _2047 = _296 & _1726;
    assign _1879 = ~ _1878;
    assign _1872 = _1857 & _1871;
    assign _1880 = _1872 & _1879;
    assign _1827 = ~ _1826;
    assign _1823 = _1755 & _1822;
    assign _1828 = _1823 & _1827;
    assign _2044 = _1828 | _1880;
    assign _61 = _2044;
    assign _2045 = f_rx_push & _656;
    assign _2046 = _2045 | _61;
    assign _2048 = _2046 | _2047;
    assign _2053 = _2048 ? _1961 : _2051;
    assign _2055 = _2029 ? _1122 : _2053;
    assign _62 = _2055;
    always @(posedge _320) begin
        if (_318)
            _2051 <= _1122;
        else
            _2051 <= _62;
    end
    assign _2059 = _750[61:61];
    assign _2060 = _1860 & _2059;
    assign _2065 = _2060 ? _1961 : _2063;
    assign _66 = host_irq_ack;
    assign _2067 = _66 ? _1122 : _2065;
    assign _2069 = _2029 ? _1122 : _2067;
    assign _67 = _2069;
    always @(posedge _320) begin
        if (_318)
            _2063 <= _1122;
        else
            _2063 <= _67;
    end
    assign _2098 = f_policy == _2097;
    assign _2100 = _2098 ? _1961 : _2058;
    assign _2096 = f_policy == _2571;
    assign _2102 = _2096 ? _1961 : _2100;
    assign _2103 = f_viol_now ? _2102 : _2058;
    assign _2104 = _1246 ? _2058 : _2103;
    assign _2071 = _342 == _1271;
    assign _2105 = _2071 ? _2104 : _2058;
    assign _2107 = _2029 ? _1122 : _2105;
    assign _68 = _2107;
    always @(posedge _320) begin
        if (_318)
            _2058 <= _1122;
        else
            _2058 <= _68;
    end
    assign _2122 = ~ _2121;
    assign _70 = host_tx_wm;
    assign _2115 = { gnd,
                     _70 };
    assign _2116 = _2115 < _297;
    assign _2117 = ~ _2116;
    assign _72 = host_tx_wm_en;
    assign _2118 = _72 & _2117;
    assign _74 = host_rx_wm;
    assign _2109 = _74 == _1130;
    assign _2111 = _2109 ? _1490 : _74;
    assign _2112 = { gnd,
                     _2111 };
    assign _2113 = _158 < _2112;
    assign _2114 = ~ _2113;
    assign _2119 = _2114 | _2118;
    assign _2123 = _2119 | _2122;
    assign _2124 = _2123 | _2058;
    assign _2125 = _2124 | _2063;
    assign _77 = ram_cov_rdata;
    assign _2128 = 32'b00000000000000000000000000000000;
    assign _2126 = ~ f_sweeping;
    assign _2127 = _1304 & _2126;
    assign _2129 = _2127 ? _77 : _2128;
    assign _2496 = 3'b111;
    assign _2497 = _2134 == _2496;
    assign _2498 = _2131 & _2497;
    assign _2495 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _320) begin
        if (_318)
            _2499 <= _2495;
        else
            if (_2498)
                _2499 <= _90;
    end
    assign _2491 = _2134 == _1997;
    assign _2492 = _2131 & _2491;
    always @(posedge _320) begin
        if (_318)
            _2493 <= _2495;
        else
            if (_2492)
                _2493 <= _90;
    end
    assign _2485 = _2134 == _1998;
    assign _2486 = _2131 & _2485;
    always @(posedge _320) begin
        if (_318)
            _2487 <= _2495;
        else
            if (_2486)
                _2487 <= _90;
    end
    assign _2479 = _2134 == _1327;
    assign _2480 = _2131 & _2479;
    always @(posedge _320) begin
        if (_318)
            _2481 <= _2495;
        else
            if (_2480)
                _2481 <= _90;
    end
    assign _2473 = _2134 == _2001;
    assign _2474 = _2131 & _2473;
    always @(posedge _320) begin
        if (_318)
            _2475 <= _2495;
        else
            if (_2474)
                _2475 <= _90;
    end
    assign _2467 = _2134 == _1463;
    assign _2468 = _2131 & _2467;
    always @(posedge _320) begin
        if (_318)
            _2469 <= _2495;
        else
            if (_2468)
                _2469 <= _90;
    end
    assign _2461 = _2134 == _1490;
    assign _2462 = _2131 & _2461;
    always @(posedge _320) begin
        if (_318)
            _2463 <= _2495;
        else
            if (_2462)
                _2463 <= _90;
    end
    assign _2136 = _2134 + _1490;
    assign _2137 = _2131 ? _2136 : _2134;
    assign _80 = _2137;
    always @(posedge _320) begin
        if (_318)
            _2134 <= _1130;
        else
            _2134 <= _80;
    end
    assign _2455 = _2134 == _1130;
    assign _2456 = _2131 & _2455;
    assign _2428 = _2319 - _2424;
    assign _2145 = 29'b11111111111111111111111111111;
    assign _2144 = 29'b00000000000000000000000000000;
    assign _2147 = 29'b00000000000000000000000000001;
    assign _2148 = ts_hi_m1 + _2147;
    assign _2141 = ts_reg[2:0];
    assign _2143 = _2141 == _2496;
    assign _2149 = _2143 ? _2148 : ts_hi_m1;
    assign _81 = _2149;
    always @(posedge _320) begin
        if (_318)
            ts_hi_m1 <= _2145;
        else
            ts_hi_m1 <= _81;
    end
    assign _2426 = ts_reg[31:3];
    assign _2167 = _2154 + _1490;
    assign _2163 = _2154 == _2496;
    assign _2164 = ~ _2163;
    assign _2161 = _743[0:0];
    assign _2165 = _2161 & _2164;
    assign _2168 = _2165 ? _2167 : _2154;
    assign _2158 = _743[0:0];
    assign _2159 = ~ _2158;
    assign _2156 = _378[0:0];
    assign _2155 = f_chg_now[0:0];
    assign _2157 = _2155 & _2156;
    assign _2160 = _2157 & _2159;
    assign _2170 = _2160 ? _1490 : _2168;
    assign _2151 = _342 == _1270;
    assign _2171 = _2151 ? _2170 : _2154;
    assign _82 = _2171;
    always @(posedge _320) begin
        if (_318)
            _2154 <= _1130;
        else
            _2154 <= _82;
    end
    assign _2417 = _743[0:0];
    assign _2419 = _2417 ? _2154 : _1130;
    assign _2188 = _2175 + _1490;
    assign _2184 = _2175 == _2496;
    assign _2185 = ~ _2184;
    assign _2182 = _743[1:1];
    assign _2186 = _2182 & _2185;
    assign _2189 = _2186 ? _2188 : _2175;
    assign _2179 = _743[1:1];
    assign _2180 = ~ _2179;
    assign _2177 = _378[1:1];
    assign _2176 = f_chg_now[1:1];
    assign _2178 = _2176 & _2177;
    assign _2181 = _2178 & _2180;
    assign _2191 = _2181 ? _1490 : _2189;
    assign _2172 = _342 == _1270;
    assign _2192 = _2172 ? _2191 : _2175;
    assign _83 = _2192;
    always @(posedge _320) begin
        if (_318)
            _2175 <= _1130;
        else
            _2175 <= _83;
    end
    assign _2414 = _743[1:1];
    assign _2416 = _2414 ? _2175 : _1130;
    assign _2420 = _2376 ? _2419 : _2416;
    assign _2209 = _2196 + _1490;
    assign _2205 = _2196 == _2496;
    assign _2206 = ~ _2205;
    assign _2203 = _743[2:2];
    assign _2207 = _2203 & _2206;
    assign _2210 = _2207 ? _2209 : _2196;
    assign _2200 = _743[2:2];
    assign _2201 = ~ _2200;
    assign _2198 = _378[2:2];
    assign _2197 = f_chg_now[2:2];
    assign _2199 = _2197 & _2198;
    assign _2202 = _2199 & _2201;
    assign _2212 = _2202 ? _1490 : _2210;
    assign _2193 = _342 == _1270;
    assign _2213 = _2193 ? _2212 : _2196;
    assign _84 = _2213;
    always @(posedge _320) begin
        if (_318)
            _2196 <= _1130;
        else
            _2196 <= _84;
    end
    assign _2410 = _743[2:2];
    assign _2412 = _2410 ? _2196 : _1130;
    assign _2230 = _2217 + _1490;
    assign _2226 = _2217 == _2496;
    assign _2227 = ~ _2226;
    assign _2224 = _743[3:3];
    assign _2228 = _2224 & _2227;
    assign _2231 = _2228 ? _2230 : _2217;
    assign _2221 = _743[3:3];
    assign _2222 = ~ _2221;
    assign _2219 = _378[3:3];
    assign _2218 = f_chg_now[3:3];
    assign _2220 = _2218 & _2219;
    assign _2223 = _2220 & _2222;
    assign _2233 = _2223 ? _1490 : _2231;
    assign _2214 = _342 == _1270;
    assign _2234 = _2214 ? _2233 : _2217;
    assign _85 = _2234;
    always @(posedge _320) begin
        if (_318)
            _2217 <= _1130;
        else
            _2217 <= _85;
    end
    assign _2407 = _743[3:3];
    assign _2409 = _2407 ? _2217 : _1130;
    assign _2413 = _2379 ? _2412 : _2409;
    assign _2421 = _2378 ? _2420 : _2413;
    assign _2251 = _2238 + _1490;
    assign _2247 = _2238 == _2496;
    assign _2248 = ~ _2247;
    assign _2245 = _743[4:4];
    assign _2249 = _2245 & _2248;
    assign _2252 = _2249 ? _2251 : _2238;
    assign _2242 = _743[4:4];
    assign _2243 = ~ _2242;
    assign _2240 = _378[4:4];
    assign _2239 = f_chg_now[4:4];
    assign _2241 = _2239 & _2240;
    assign _2244 = _2241 & _2243;
    assign _2254 = _2244 ? _1490 : _2252;
    assign _2235 = _342 == _1270;
    assign _2255 = _2235 ? _2254 : _2238;
    assign _86 = _2255;
    always @(posedge _320) begin
        if (_318)
            _2238 <= _1130;
        else
            _2238 <= _86;
    end
    assign _2402 = _743[4:4];
    assign _2404 = _2402 ? _2238 : _1130;
    assign _2272 = _2259 + _1490;
    assign _2268 = _2259 == _2496;
    assign _2269 = ~ _2268;
    assign _2266 = _743[5:5];
    assign _2270 = _2266 & _2269;
    assign _2273 = _2270 ? _2272 : _2259;
    assign _2263 = _743[5:5];
    assign _2264 = ~ _2263;
    assign _2261 = _378[5:5];
    assign _2260 = f_chg_now[5:5];
    assign _2262 = _2260 & _2261;
    assign _2265 = _2262 & _2264;
    assign _2275 = _2265 ? _1490 : _2273;
    assign _2256 = _342 == _1270;
    assign _2276 = _2256 ? _2275 : _2259;
    assign _87 = _2276;
    always @(posedge _320) begin
        if (_318)
            _2259 <= _1130;
        else
            _2259 <= _87;
    end
    assign _2399 = _743[5:5];
    assign _2401 = _2399 ? _2259 : _1130;
    assign _2405 = _2383 ? _2404 : _2401;
    assign _2293 = _2280 + _1490;
    assign _2289 = _2280 == _2496;
    assign _2290 = ~ _2289;
    assign _2287 = _743[6:6];
    assign _2291 = _2287 & _2290;
    assign _2294 = _2291 ? _2293 : _2280;
    assign _2284 = _743[6:6];
    assign _2285 = ~ _2284;
    assign _2282 = _378[6:6];
    assign _2281 = f_chg_now[6:6];
    assign _2283 = _2281 & _2282;
    assign _2286 = _2283 & _2285;
    assign _2296 = _2286 ? _1490 : _2294;
    assign _2277 = _342 == _1270;
    assign _2297 = _2277 ? _2296 : _2280;
    assign _88 = _2297;
    always @(posedge _320) begin
        if (_318)
            _2280 <= _1130;
        else
            _2280 <= _88;
    end
    assign _2395 = _743[6:6];
    assign _2397 = _2395 ? _2280 : _1130;
    assign _2314 = _2301 + _1490;
    assign _2310 = _2301 == _2496;
    assign _2311 = ~ _2310;
    assign _2308 = _743[7:7];
    assign _2312 = _2308 & _2311;
    assign _2315 = _2312 ? _2314 : _2301;
    assign _2305 = _743[7:7];
    assign _2306 = ~ _2305;
    assign _2303 = _378[7:7];
    assign _2302 = f_chg_now[7:7];
    assign _2304 = _2302 & _2303;
    assign _2307 = _2304 & _2306;
    assign _2317 = _2307 ? _1490 : _2315;
    assign _2298 = _342 == _1270;
    assign _2318 = _2298 ? _2317 : _2301;
    assign _89 = _2318;
    always @(posedge _320) begin
        if (_318)
            _2301 <= _1130;
        else
            _2301 <= _89;
    end
    assign _2392 = _743[7:7];
    assign _2394 = _2392 ? _2301 : _1130;
    assign _2398 = _2386 ? _2397 : _2394;
    assign _2406 = _2385 ? _2405 : _2398;
    assign _2422 = _2382 ? _2421 : _2406;
    assign _2387 = _773[7:7];
    assign _2386 = _773[6:6];
    assign _2388 = _2386 | _2387;
    assign _2384 = _773[5:5];
    assign _2383 = _773[4:4];
    assign _2385 = _2383 | _2384;
    assign _2389 = _2385 | _2388;
    assign _2380 = _773[3:3];
    assign _2379 = _773[2:2];
    assign _2381 = _2379 | _2380;
    assign _2377 = _773[1:1];
    assign _2376 = _773[0:0];
    assign _2378 = _2376 | _2377;
    assign _2382 = _2378 | _2381;
    assign _2390 = _2382 | _2389;
    assign _2423 = _2390 ? _2422 : _1130;
    assign _2365 = f_watch[0:0];
    assign _2364 = _378[0:0];
    assign _2366 = _2364 & _2365;
    assign _2368 = _2366 ? _598 : _1130;
    assign _2360 = f_watch[1:1];
    assign _2359 = _378[1:1];
    assign _2361 = _2359 & _2360;
    assign _2363 = _2361 ? _577 : _1130;
    assign _2369 = _2363 < _2368;
    assign _2370 = _2369 ? _2368 : _2363;
    assign _2353 = f_watch[2:2];
    assign _2352 = _378[2:2];
    assign _2354 = _2352 & _2353;
    assign _2356 = _2354 ? _554 : _1130;
    assign _2348 = f_watch[3:3];
    assign _2347 = _378[3:3];
    assign _2349 = _2347 & _2348;
    assign _2351 = _2349 ? _533 : _1130;
    assign _2357 = _2351 < _2356;
    assign _2358 = _2357 ? _2356 : _2351;
    assign _2371 = _2358 < _2370;
    assign _2372 = _2371 ? _2370 : _2358;
    assign _2339 = f_watch[4:4];
    assign _2338 = _378[4:4];
    assign _2340 = _2338 & _2339;
    assign _2342 = _2340 ? _508 : _1130;
    assign _2334 = f_watch[5:5];
    assign _2333 = _378[5:5];
    assign _2335 = _2333 & _2334;
    assign _2337 = _2335 ? _487 : _1130;
    assign _2343 = _2337 < _2342;
    assign _2344 = _2343 ? _2342 : _2337;
    assign _2327 = f_watch[6:6];
    assign _2326 = _378[6:6];
    assign _2328 = _2326 & _2327;
    assign _2330 = _2328 ? _464 : _1130;
    assign _2322 = f_watch[7:7];
    assign _2321 = _378[7:7];
    assign _2323 = _2321 & _2322;
    assign _2325 = _2323 ? _443 : _1130;
    assign _2331 = _2325 < _2330;
    assign _2332 = _2331 ? _2330 : _2325;
    assign _2345 = _2332 < _2344;
    assign _2346 = _2345 ? _2344 : _2332;
    assign _2373 = _2346 < _2372;
    assign _2374 = _2373 ? _2372 : _2346;
    assign _2375 = f_unexp_now ? _2374 : _1130;
    assign _2424 = f_amb_now ? _2423 : _2375;
    assign _2319 = ts_reg[2:0];
    assign _2425 = _2319 < _2424;
    assign _2427 = _2425 ? ts_hi_m1 : _2426;
    assign _2429 = { _2427,
                     _2428 };
    assign _2433 = { _2429,
                     _1254,
                     _2432,
                     _365 };
    assign _90 = _2433;
    always @(posedge _320) begin
        if (_318)
            _2457 <= _2495;
        else
            if (_2456)
                _2457 <= _90;
    end
    assign _2450 = _2448 + _1490;
    assign _2120 = 4'b0000;
    assign _2439 = 4'b0001;
    assign _2440 = _92 + _2439;
    assign _2438 = _92 - _2439;
    assign _2441 = _2131 ? _2440 : _2438;
    assign _1895 = 4'b1000;
    assign _1896 = _92 == _1895;
    assign _2130 = ~ _1896;
    assign _91 = f_viol_now;
    assign _2131 = _91 & _2130;
    assign _2436 = _2131 ^ _2435;
    assign _2442 = _2436 ? _2441 : _92;
    always @(posedge _320) begin
        if (_318)
            _2445 <= _2120;
        else
            _2445 <= _2442;
    end
    assign _92 = _2445;
    assign _2121 = _92 == _2120;
    assign _2434 = ~ _2121;
    assign _94 = host_vlog_pop;
    assign _2435 = _94 & _2434;
    assign _2451 = _2435 ? _2450 : _2448;
    assign _95 = _2451;
    always @(posedge _320) begin
        if (_318)
            _2448 <= _1130;
        else
            _2448 <= _95;
    end
    always @* begin
        case (_2448)
        0:
            _2500 <= _2457;
        1:
            _2500 <= _2463;
        2:
            _2500 <= _2469;
        3:
            _2500 <= _2475;
        4:
            _2500 <= _2481;
        5:
            _2500 <= _2487;
        6:
            _2500 <= _2493;
        default:
            _2500 <= _2499;
        endcase
    end
    assign _2564 = _2507 == _2496;
    assign _2565 = _2504 & _2564;
    always @(posedge _320) begin
        if (_318)
            _2566 <= _1279;
        else
            if (_2565)
                _2566 <= _170;
    end
    assign _2558 = _2507 == _1997;
    assign _2559 = _2504 & _2558;
    always @(posedge _320) begin
        if (_318)
            _2560 <= _1279;
        else
            if (_2559)
                _2560 <= _170;
    end
    assign _2552 = _2507 == _1998;
    assign _2553 = _2504 & _2552;
    always @(posedge _320) begin
        if (_318)
            _2554 <= _1279;
        else
            if (_2553)
                _2554 <= _170;
    end
    assign _2546 = _2507 == _1327;
    assign _2547 = _2504 & _2546;
    always @(posedge _320) begin
        if (_318)
            _2548 <= _1279;
        else
            if (_2547)
                _2548 <= _170;
    end
    assign _2540 = _2507 == _2001;
    assign _2541 = _2504 & _2540;
    always @(posedge _320) begin
        if (_318)
            _2542 <= _1279;
        else
            if (_2541)
                _2542 <= _170;
    end
    assign _2534 = _2507 == _1463;
    assign _2535 = _2504 & _2534;
    always @(posedge _320) begin
        if (_318)
            _2536 <= _1279;
        else
            if (_2535)
                _2536 <= _170;
    end
    assign _2528 = _2507 == _1490;
    assign _2529 = _2504 & _2528;
    always @(posedge _320) begin
        if (_318)
            _2530 <= _1279;
        else
            if (_2529)
                _2530 <= _170;
    end
    assign _2509 = _2507 + _1490;
    assign _2510 = _2504 ? _2509 : _2507;
    assign _98 = _2510;
    always @(posedge _320) begin
        if (_318)
            _2507 <= _1130;
        else
            _2507 <= _98;
    end
    assign _2522 = _2507 == _1130;
    assign _2523 = _2504 & _2522;
    always @(posedge _320) begin
        if (_318)
            _2524 <= _1279;
        else
            if (_2523)
                _2524 <= _170;
    end
    assign _2517 = _2515 + _1490;
    assign _2518 = _2512 ? _2517 : _2515;
    assign _99 = _2518;
    always @(posedge _320) begin
        if (_318)
            _2515 <= _1130;
        else
            _2515 <= _99;
    end
    always @* begin
        case (_2515)
        0:
            _2567 <= _2524;
        1:
            _2567 <= _2530;
        2:
            _2567 <= _2536;
        3:
            _2567 <= _2542;
        4:
            _2567 <= _2548;
        5:
            _2567 <= _2554;
        6:
            _2567 <= _2560;
        default:
            _2567 <= _2566;
        endcase
    end
    assign _2568 = 32'b00000000000000000000000000000001;
    assign _2569 = ts_reg + _2568;
    assign _103 = _2569;
    always @(posedge _320) begin
        if (_318)
            ts_reg <= _2128;
        else
            ts_reg <= _103;
    end
    assign _2571 = 2'b00;
    assign _2430 = { _2085,
                     f_unexp_now };
    assign _2432 = f_amb_now ? _2571 : _2430;
    always @(posedge _320) begin
        if (_318)
            _2572 <= _2571;
        else
            _2572 <= _2432;
    end
    always @(posedge _320) begin
        if (_318)
            _2575 <= _1122;
        else
            _2575 <= f_viol_now;
    end
    always @(posedge _320) begin
        if (_318)
            _2578 <= _2571;
        else
            _2578 <= f_winner;
    end
    always @(posedge _320) begin
        if (_318)
            _2581 <= _1122;
        else
            _2581 <= _1246;
    end
    assign _2582 = _750[60:60];
    assign _2583 = f_in_eval & _2582;
    assign _2584 = ~ _1304;
    assign _2725 = _116 & _2724;
    assign _2726 = ~ _2725;
    assign _2606 = _750[23:16];
    assign _2604 = _767[86:79];
    assign _2603 = _761[86:79];
    assign _2602 = _755[86:79];
    assign _2601 = _358[86:79];
    always @* begin
        case (f_winner)
        0:
            _2605 <= _2601;
        1:
            _2605 <= _2602;
        2:
            _2605 <= _2603;
        default:
            _2605 <= _2604;
        endcase
    end
    assign _2607 = _1860 ? _2606 : _2605;
    assign _2608 = _2607 & _2598;
    assign _2599 = ~ _2598;
    assign _2600 = f_poe & _2599;
    assign _2609 = _2600 | _2608;
    assign _2643 = _2609 | _2642;
    assign _2644 = _2588 ? _2643 : f_poe;
    assign _2646 = _327 ? _1279 : _2644;
    assign _2648 = _2029 ? _1279 : _2646;
    assign _113 = _2648;
    always @(posedge _320) begin
        if (_318)
            f_poe <= _1279;
        else
            f_poe <= _113;
    end
    assign _2727 = f_poe & _2726;
    assign _116 = host_open_drain;
    assign _4292 = ~ _116;
    assign _2722 = f_lane1_out & _2716;
    assign _2721 = ~ f_lane1_out;
    assign _2719 = ~ f_lane0_out;
    assign _2720 = _2719 & _2716;
    assign _2718 = f_lane0_out & _2716;
    assign _2717 = ~ f_lane0_out;
    assign _2716 = f_pout[0:0];
    assign _2715 = _337[2:0];
    always @* begin
        case (_2715)
        0:
            _2723 <= _2716;
        1:
            _2723 <= f_lane0_out;
        2:
            _2723 <= _2717;
        3:
            _2723 <= _2718;
        4:
            _2723 <= _2720;
        5:
            _2723 <= f_lane1_out;
        6:
            _2723 <= _2721;
        default:
            _2723 <= _2722;
        endcase
    end
    assign _2713 = f_lane1_out & _2707;
    assign _2712 = ~ f_lane1_out;
    assign _2710 = ~ f_lane0_out;
    assign _2711 = _2710 & _2707;
    assign _2709 = f_lane0_out & _2707;
    assign _2708 = ~ f_lane0_out;
    assign _2707 = f_pout[1:1];
    assign _2706 = _337[5:3];
    always @* begin
        case (_2706)
        0:
            _2714 <= _2707;
        1:
            _2714 <= f_lane0_out;
        2:
            _2714 <= _2708;
        3:
            _2714 <= _2709;
        4:
            _2714 <= _2711;
        5:
            _2714 <= f_lane1_out;
        6:
            _2714 <= _2712;
        default:
            _2714 <= _2713;
        endcase
    end
    assign _2704 = f_lane1_out & _2698;
    assign _2703 = ~ f_lane1_out;
    assign _2701 = ~ f_lane0_out;
    assign _2702 = _2701 & _2698;
    assign _2700 = f_lane0_out & _2698;
    assign _2699 = ~ f_lane0_out;
    assign _2698 = f_pout[2:2];
    assign _2697 = _337[8:6];
    always @* begin
        case (_2697)
        0:
            _2705 <= _2698;
        1:
            _2705 <= f_lane0_out;
        2:
            _2705 <= _2699;
        3:
            _2705 <= _2700;
        4:
            _2705 <= _2702;
        5:
            _2705 <= f_lane1_out;
        6:
            _2705 <= _2703;
        default:
            _2705 <= _2704;
        endcase
    end
    assign _2695 = f_lane1_out & _2689;
    assign _2694 = ~ f_lane1_out;
    assign _2692 = ~ f_lane0_out;
    assign _2693 = _2692 & _2689;
    assign _2691 = f_lane0_out & _2689;
    assign _2690 = ~ f_lane0_out;
    assign _2689 = f_pout[3:3];
    assign _2688 = _337[11:9];
    always @* begin
        case (_2688)
        0:
            _2696 <= _2689;
        1:
            _2696 <= f_lane0_out;
        2:
            _2696 <= _2690;
        3:
            _2696 <= _2691;
        4:
            _2696 <= _2693;
        5:
            _2696 <= f_lane1_out;
        6:
            _2696 <= _2694;
        default:
            _2696 <= _2695;
        endcase
    end
    assign _2686 = f_lane1_out & _2680;
    assign _2685 = ~ f_lane1_out;
    assign _2683 = ~ f_lane0_out;
    assign _2684 = _2683 & _2680;
    assign _2682 = f_lane0_out & _2680;
    assign _2681 = ~ f_lane0_out;
    assign _2680 = f_pout[4:4];
    assign _2679 = _337[14:12];
    always @* begin
        case (_2679)
        0:
            _2687 <= _2680;
        1:
            _2687 <= f_lane0_out;
        2:
            _2687 <= _2681;
        3:
            _2687 <= _2682;
        4:
            _2687 <= _2684;
        5:
            _2687 <= f_lane1_out;
        6:
            _2687 <= _2685;
        default:
            _2687 <= _2686;
        endcase
    end
    assign _2677 = f_lane1_out & _2671;
    assign _2676 = ~ f_lane1_out;
    assign _2674 = ~ f_lane0_out;
    assign _2675 = _2674 & _2671;
    assign _2673 = f_lane0_out & _2671;
    assign _2672 = ~ f_lane0_out;
    assign _2671 = f_pout[5:5];
    assign _2670 = _337[17:15];
    always @* begin
        case (_2670)
        0:
            _2678 <= _2671;
        1:
            _2678 <= f_lane0_out;
        2:
            _2678 <= _2672;
        3:
            _2678 <= _2673;
        4:
            _2678 <= _2675;
        5:
            _2678 <= f_lane1_out;
        6:
            _2678 <= _2676;
        default:
            _2678 <= _2677;
        endcase
    end
    assign _2668 = f_lane1_out & _2662;
    assign _2667 = ~ f_lane1_out;
    assign _2665 = ~ f_lane0_out;
    assign _2666 = _2665 & _2662;
    assign _2664 = f_lane0_out & _2662;
    assign _2663 = ~ f_lane0_out;
    assign _2662 = f_pout[6:6];
    assign _2661 = _337[20:18];
    always @* begin
        case (_2661)
        0:
            _2669 <= _2662;
        1:
            _2669 <= f_lane0_out;
        2:
            _2669 <= _2663;
        3:
            _2669 <= _2664;
        4:
            _2669 <= _2666;
        5:
            _2669 <= f_lane1_out;
        6:
            _2669 <= _2667;
        default:
            _2669 <= _2668;
        endcase
    end
    assign _2659 = f_lane1_out & _2653;
    assign _2658 = ~ f_lane1_out;
    assign _2656 = ~ f_lane0_out;
    assign _2657 = _2656 & _2653;
    assign _2655 = f_lane0_out & _2653;
    assign _2654 = ~ f_lane0_out;
    assign _4284 = { _4282,
                     _4281 };
    assign _4281 = _647[0:0];
    assign _4282 = { _4281,
                     _4281 };
    assign _4283 = { _4282,
                     _4282 };
    assign _4285 = { _4283,
                     _4284 };
    assign _4286 = { _4285,
                     _4281 };
    assign _4287 = _4286 & _2642;
    assign _2640 = _2636 & _2634;
    assign _2639 = _2636 & _2632;
    assign _2638 = _2636 & _2629;
    assign _2636 = ~ _2623;
    assign _2637 = _2636 & _2626;
    assign _2634 = _2631 & _2628;
    assign _2635 = _2623 & _2634;
    assign _2631 = ~ _2624;
    assign _2632 = _2631 & _2625;
    assign _2633 = _2623 & _2632;
    assign _2628 = ~ _2625;
    assign _2629 = _2624 & _2628;
    assign _2630 = _2623 & _2629;
    assign _2625 = _2622[0:0];
    assign _2624 = _2622[1:1];
    assign _2626 = _2624 & _2625;
    assign _2623 = _2622[2:2];
    assign _2627 = _2623 & _2626;
    assign _2641 = { _2627,
                     _2630,
                     _2633,
                     _2635,
                     _2637,
                     _2638,
                     _2639,
                     _2640 };
    assign _2610 = ~ _1860;
    assign _2616 = _2610 & _2615;
    assign _2642 = _2616 ? _2641 : _1279;
    assign _4279 = ~ _2642;
    assign _4275 = _750[15:8];
    assign _4273 = _767[78:71];
    assign _4272 = _761[78:71];
    assign _4271 = _755[78:71];
    assign _4270 = _358[78:71];
    always @* begin
        case (f_winner)
        0:
            _4274 <= _4270;
        1:
            _4274 <= _4271;
        2:
            _4274 <= _4272;
        default:
            _4274 <= _4273;
        endcase
    end
    assign _4276 = _1860 ? _4275 : _4274;
    assign _4277 = _4276 & _2598;
    assign _2597 = _750[7:0];
    assign _2595 = _767[70:63];
    assign _2594 = _761[70:63];
    assign _2593 = _755[70:63];
    assign _2592 = _358[70:63];
    always @* begin
        case (f_winner)
        0:
            _2596 <= _2592;
        1:
            _2596 <= _2593;
        2:
            _2596 <= _2594;
        default:
            _2596 <= _2595;
        endcase
    end
    assign _2598 = _1860 ? _2597 : _2596;
    assign _4268 = ~ _2598;
    assign _4269 = f_pout & _4268;
    assign _4278 = _4269 | _4277;
    assign _4280 = _4278 & _4279;
    assign _4288 = _4280 | _4287;
    assign _2586 = _698 == _2571;
    assign _2587 = _2586 | _700;
    assign _2588 = _1861 & _2587;
    assign _4289 = _2588 ? _4288 : f_pout;
    assign _118 = host_crc_expect;
    assign _4261 = 32'b11111111111111111111111111111111;
    assign _2839 = 32'b11101101101110001000001100100000;
    assign _2837 = _2831[31:1];
    assign _2838 = { _1122,
                     _2837 };
    assign _2840 = _2838 ^ _2839;
    assign _2834 = _2831[31:1];
    assign _2835 = { _1122,
                     _2834 };
    assign _2827 = _2821[31:1];
    assign _2828 = { _1122,
                     _2827 };
    assign _2830 = _2828 ^ _2839;
    assign _2824 = _2821[31:1];
    assign _2825 = { _1122,
                     _2824 };
    assign _2817 = _2811[31:1];
    assign _2818 = { _1122,
                     _2817 };
    assign _2820 = _2818 ^ _2839;
    assign _2814 = _2811[31:1];
    assign _2815 = { _1122,
                     _2814 };
    assign _2807 = _2801[31:1];
    assign _2808 = { _1122,
                     _2807 };
    assign _2810 = _2808 ^ _2839;
    assign _2804 = _2801[31:1];
    assign _2805 = { _1122,
                     _2804 };
    assign _2797 = _2791[31:1];
    assign _2798 = { _1122,
                     _2797 };
    assign _2800 = _2798 ^ _2839;
    assign _2794 = _2791[31:1];
    assign _2795 = { _1122,
                     _2794 };
    assign _2787 = _2781[31:1];
    assign _2788 = { _1122,
                     _2787 };
    assign _2790 = _2788 ^ _2839;
    assign _2784 = _2781[31:1];
    assign _2785 = { _1122,
                     _2784 };
    assign _2777 = _2771[31:1];
    assign _2778 = { _1122,
                     _2777 };
    assign _2780 = _2778 ^ _2839;
    assign _2774 = _2771[31:1];
    assign _2775 = { _1122,
                     _2774 };
    assign _2767 = _2761[31:1];
    assign _2768 = { _1122,
                     _2767 };
    assign _2770 = _2768 ^ _2839;
    assign _2764 = _2761[31:1];
    assign _2765 = { _1122,
                     _2764 };
    assign _2758 = _312[127:120];
    assign _2757 = _312[119:112];
    assign _2756 = _312[111:104];
    assign _2755 = _312[103:96];
    assign _2754 = _312[95:88];
    assign _2753 = _312[87:80];
    assign _2752 = _312[79:72];
    assign _2751 = _312[71:64];
    assign _2750 = _312[63:56];
    assign _2749 = _312[55:48];
    assign _2748 = _312[47:40];
    assign _2747 = _312[39:32];
    assign _2746 = _312[31:24];
    assign _2745 = _312[23:16];
    assign _2744 = _312[15:8];
    assign _2743 = _312[7:0];
    assign _2740 = 13'b0000000000001;
    assign _2741 = f_sw_cnt - _2740;
    assign _2742 = _2741[3:0];
    always @* begin
        case (_2742)
        0:
            _2759 <= _2743;
        1:
            _2759 <= _2744;
        2:
            _2759 <= _2745;
        3:
            _2759 <= _2746;
        4:
            _2759 <= _2747;
        5:
            _2759 <= _2748;
        6:
            _2759 <= _2749;
        7:
            _2759 <= _2750;
        8:
            _2759 <= _2751;
        9:
            _2759 <= _2752;
        10:
            _2759 <= _2753;
        11:
            _2759 <= _2754;
        12:
            _2759 <= _2755;
        13:
            _2759 <= _2756;
        14:
            _2759 <= _2757;
        default:
            _2759 <= _2758;
        endcase
    end
    assign _2739 = 24'b000000000000000000000000;
    assign _2760 = { _2739,
                     _2759 };
    assign _2737 = f_sw_cnt == _1137;
    assign _2738 = ~ _2737;
    assign _2842 = _2738 ? _2841 : _2735;
    assign _2735 = _2730 ? _4261 : _2733;
    assign _2843 = f_sweeping ? _2842 : _2735;
    assign _119 = _2843;
    always @(posedge _320) begin
        if (_318)
            _2733 <= _4261;
        else
            _2733 <= _119;
    end
    assign _2761 = _2733 ^ _2760;
    assign _2762 = _2761[0:0];
    assign _2771 = _2762 ? _2770 : _2765;
    assign _2772 = _2771[0:0];
    assign _2781 = _2772 ? _2780 : _2775;
    assign _2782 = _2781[0:0];
    assign _2791 = _2782 ? _2790 : _2785;
    assign _2792 = _2791[0:0];
    assign _2801 = _2792 ? _2800 : _2795;
    assign _2802 = _2801[0:0];
    assign _2811 = _2802 ? _2810 : _2805;
    assign _2812 = _2811[0:0];
    assign _2821 = _2812 ? _2820 : _2815;
    assign _2822 = _2821[0:0];
    assign _2831 = _2822 ? _2830 : _2825;
    assign _2832 = _2831[0:0];
    assign _2841 = _2832 ? _2840 : _2835;
    assign _4262 = _2841 ^ _4261;
    assign f_sw_match = _4262 == _118;
    assign _4264 = f_sw_last ? f_sw_match : _4260;
    assign _4266 = _4248 ? _1122 : _4264;
    assign _1325 = ~ f_sweeping;
    assign _1324 = _124 & _1304;
    assign f_store_we = _1324 & _1325;
    assign _4256 = f_store_we | _122;
    assign _4258 = _4256 ? _1122 : f_image_valid;
    assign _4260 = _2730 ? _1122 : _4258;
    assign _4249 = 13'b1000000000000;
    assign _2847 = f_sw_cnt + _2740;
    assign _2845 = _2730 ? _1137 : f_sw_cnt;
    assign _2848 = f_sweeping ? _2847 : _2845;
    assign _120 = _2848;
    always @(posedge _320) begin
        if (_318)
            f_sw_cnt <= _1137;
        else
            f_sw_cnt <= _120;
    end
    assign f_sw_last = f_sw_cnt == _4249;
    assign _4252 = f_sw_last ? _1122 : _4245;
    assign _122 = host_crc_expect_we;
    assign _124 = host_rec_we;
    assign _4246 = _334 | _124;
    assign _4247 = _4246 | _122;
    assign _4248 = f_sweeping & _4247;
    assign _4254 = _4248 ? _1122 : _4252;
    assign _2729 = ~ f_sweeping;
    assign _4238 = _1860 ? _1271 : _342;
    assign _4234 = _2864 ? _1270 : _342;
    assign _2097 = 2'b11;
    assign _4225 = f_policy == _2097;
    assign _4227 = _4225 ? _2571 : _342;
    assign _4224 = f_policy == _1271;
    assign _4229 = _4224 ? _1270 : _4227;
    assign _4223 = f_policy == _2571;
    assign _4231 = _4223 ? _2571 : _4229;
    assign _4232 = f_viol_now ? _4231 : _342;
    assign _1241 = f_chgmask3 & f_multi_eff;
    assign _1243 = _1241 == _1279;
    assign _1234 = _1194 == _1119;
    assign _1229 = 16'b0000000000000000;
    assign _1230 = _1194 == _1229;
    assign _1231 = _1230 & _1211;
    assign _1228 = _1170 == _1190;
    assign _1232 = _1228 | _1231;
    assign _1235 = _1169 ? _1234 : _1232;
    assign _1225 = _659[3:0];
    assign _1227 = _1225 == _2120;
    assign _1236 = _1227 | _1235;
    assign _1223 = _1194 == _1119;
    assign _1219 = _1194 == _1229;
    assign _1220 = _1219 & _1211;
    assign _1217 = _1170 == _1190;
    assign _1221 = _1217 | _1220;
    assign _1224 = _1169 ? _1223 : _1221;
    assign _1215 = _1181 == _1119;
    always @(posedge _320) begin
        if (_318)
            _1109 <= _1130;
        else
            _1109 <= _1106;
    end
    assign _1210 = { _1137,
                     _1109 };
    assign _1211 = _1167 < _1210;
    assign _1208 = _1181 == _1229;
    assign _1212 = _1208 & _1211;
    assign _1206 = _1170 == _1178;
    assign _1213 = _1206 | _1212;
    assign _1216 = _1169 ? _1215 : _1213;
    assign _1205 = _767[104:103];
    always @* begin
        case (_1205)
        0:
            _1237 <= vdd;
        1:
            _1237 <= _1216;
        2:
            _1237 <= _1224;
        default:
            _1237 <= _1236;
        endcase
    end
    assign _1204 = ~ _700;
    assign _1238 = _1204 | _1237;
    assign _1201 = _767[62:62];
    assign _1199 = _767[61:58];
    always @* begin
        case (_1199)
        0:
            _1200 <= vdd;
        1:
            _1200 <= _644;
        2:
            _1200 <= _648;
        3:
            _1200 <= _652;
        4:
            _1200 <= _654;
        5:
            _1200 <= _656;
        6:
            _1200 <= _660;
        7:
            _1200 <= _663;
        8:
            _1200 <= _668;
        9:
            _1200 <= _671;
        10:
            _1200 <= _674;
        11:
            _1200 <= _677;
        12:
            _1200 <= _682;
        13:
            _1200 <= _685;
        14:
            _1200 <= _688;
        default:
            _1200 <= _691;
        endcase
    end
    assign _1202 = _1200 ^ _1201;
    assign _1194 = _767[57:42];
    assign _1196 = _1194 == _1119;
    assign _1189 = 17'b00000000000000000;
    assign _1185 = _1067[57:42];
    assign _1186 = { gnd,
                     _1185 };
    assign _1187 = _1186 + _1174;
    always @(posedge _320) begin
        if (_318)
            _1190 <= _1189;
        else
            _1190 <= _1187;
    end
    assign _1191 = _1190 < _1170;
    assign _1192 = ~ _1191;
    assign _1181 = _767[41:26];
    assign _1183 = _1181 == _1229;
    assign _1098 = _1068[0:0];
    assign _1100 = _1098 ? _606 : _1130;
    assign _1095 = _1068[1:1];
    assign _1097 = _1095 ? _585 : _1130;
    assign _1101 = _1097 < _1100;
    assign _1102 = _1101 ? _1100 : _1097;
    assign _1090 = _1068[2:2];
    assign _1092 = _1090 ? _562 : _1130;
    assign _1087 = _1068[3:3];
    assign _1089 = _1087 ? _541 : _1130;
    assign _1093 = _1089 < _1092;
    assign _1094 = _1093 ? _1092 : _1089;
    assign _1103 = _1094 < _1102;
    assign _1104 = _1103 ? _1102 : _1094;
    assign _1080 = _1068[4:4];
    assign _1082 = _1080 ? _516 : _1130;
    assign _1077 = _1068[5:5];
    assign _1079 = _1077 ? _495 : _1130;
    assign _1083 = _1079 < _1082;
    assign _1084 = _1083 ? _1082 : _1079;
    assign _1072 = _1068[6:6];
    assign _1074 = _1072 ? _472 : _1130;
    assign _1068 = _1067[23:16];
    assign _1069 = _1068[7:7];
    assign _1071 = _1069 ? _451 : _1130;
    assign _1075 = _1071 < _1074;
    assign _1076 = _1075 ? _1074 : _1071;
    assign _1085 = _1076 < _1084;
    assign _1086 = _1085 ? _1084 : _1076;
    assign _1105 = _1086 < _1104;
    assign _1106 = _1105 ? _1104 : _1086;
    assign _1173 = 14'b00000000000000;
    assign _1174 = { _1173,
                     _1106 };
    assign _1067 = _426[511:400];
    assign _1171 = _1067[41:26];
    assign _1172 = { gnd,
                     _1171 };
    assign _1175 = _1172 + _1174;
    always @(posedge _320) begin
        if (_318)
            _1178 <= _1189;
        else
            _1178 <= _1175;
    end
    assign _1170 = { gnd,
                     _1167 };
    assign _1179 = _1170 < _1178;
    assign _1180 = ~ _1179;
    assign _1184 = _1180 | _1183;
    assign _1193 = _1184 & _1192;
    assign _1112 = _767[25:24];
    always @* begin
        case (_1112)
        0:
            _1167 <= _393;
        1:
            _1167 <= _396;
        2:
            _1167 <= _399;
        default:
            _1167 <= _399;
        endcase
    end
    assign _1169 = _1167 == _1119;
    assign _1197 = _1169 ? _1196 : _1193;
    assign _1161 = f_changed_all & f_chgmask3;
    assign _1163 = _1161 == _1279;
    assign _1164 = ~ _1163;
    assign _1160 = f_chgmask3 == _1279;
    assign _1165 = _1160 | _1164;
    assign _1154 = _767[7:0];
    assign _1152 = _767[15:8];
    assign _1153 = _365 ^ _1152;
    assign _1155 = _1153 & _1154;
    assign _1157 = _1155 == _1279;
    assign _1158 = f_valid3 & _1157;
    assign _1166 = _1158 & _1165;
    assign _1198 = _1166 & _1197;
    assign _1203 = _1198 & _1202;
    assign _1239 = _1203 & _1238;
    assign _1240 = f_in_eval & _1239;
    assign _1244 = _1240 & _1243;
    assign f_fire3 = _1244 & _782;
    assign _746 = f_chgmask0 & f_multi_eff;
    assign _748 = _746 == _1279;
    assign _734 = _634 == _1119;
    assign _730 = _634 == _1229;
    assign _731 = _730 & _711;
    assign _728 = _404 == _630;
    assign _732 = _728 | _731;
    assign _735 = _402 ? _734 : _732;
    assign _725 = _659[3:0];
    assign _727 = _725 == _2120;
    assign _736 = _727 | _735;
    assign _723 = _634 == _1119;
    assign _719 = _634 == _1229;
    assign _720 = _719 & _711;
    assign _717 = _404 == _630;
    assign _721 = _717 | _720;
    assign _724 = _402 ? _723 : _721;
    assign _715 = _621 == _1119;
    always @(posedge _320) begin
        if (_318)
            _709 <= _1130;
        else
            _709 <= _613;
    end
    assign _710 = { _1137,
                    _709 };
    assign _711 = _400 < _710;
    assign _705 = _621 == _1229;
    assign _712 = _705 & _711;
    assign _703 = _404 == _618;
    assign _713 = _703 | _712;
    assign _716 = _402 ? _715 : _713;
    assign _702 = _358[104:103];
    always @* begin
        case (_702)
        0:
            _737 <= vdd;
        1:
            _737 <= _716;
        2:
            _737 <= _724;
        default:
            _737 <= _736;
        endcase
    end
    assign _701 = ~ _700;
    assign _738 = _701 | _737;
    assign _693 = _358[62:62];
    assign _639 = _358[61:58];
    always @* begin
        case (_639)
        0:
            _692 <= vdd;
        1:
            _692 <= _644;
        2:
            _692 <= _648;
        3:
            _692 <= _652;
        4:
            _692 <= _654;
        5:
            _692 <= _656;
        6:
            _692 <= _660;
        7:
            _692 <= _663;
        8:
            _692 <= _668;
        9:
            _692 <= _671;
        10:
            _692 <= _674;
        11:
            _692 <= _677;
        12:
            _692 <= _682;
        13:
            _692 <= _685;
        14:
            _692 <= _688;
        default:
            _692 <= _691;
        endcase
    end
    assign _694 = _692 ^ _693;
    assign _634 = _358[57:42];
    assign _636 = _634 == _1119;
    assign _625 = _427[57:42];
    assign _626 = { gnd,
                    _625 };
    assign _627 = _626 + _614;
    always @(posedge _320) begin
        if (_318)
            _630 <= _1189;
        else
            _630 <= _627;
    end
    assign _631 = _630 < _404;
    assign _632 = ~ _631;
    assign _621 = _358[41:26];
    assign _623 = _621 == _1229;
    assign _587 = _431[0:0];
    assign _607 = _587 ? _606 : _1130;
    assign _566 = _431[1:1];
    assign _586 = _566 ? _585 : _1130;
    assign _608 = _586 < _607;
    assign _609 = _608 ? _607 : _586;
    assign _543 = _431[2:2];
    assign _563 = _543 ? _562 : _1130;
    assign _522 = _431[3:3];
    assign _542 = _522 ? _541 : _1130;
    assign _564 = _542 < _563;
    assign _565 = _564 ? _563 : _542;
    assign _610 = _565 < _609;
    assign _611 = _610 ? _609 : _565;
    assign _497 = _431[4:4];
    assign _517 = _497 ? _516 : _1130;
    assign _476 = _431[5:5];
    assign _496 = _476 ? _495 : _1130;
    assign _518 = _496 < _517;
    assign _519 = _518 ? _517 : _496;
    assign _453 = _431[6:6];
    assign _473 = _453 ? _472 : _1130;
    assign _431 = _427[23:16];
    assign _432 = _431[7:7];
    assign _452 = _432 ? _451 : _1130;
    assign _474 = _452 < _473;
    assign _475 = _474 ? _473 : _452;
    assign _520 = _475 < _519;
    assign _521 = _520 ? _519 : _475;
    assign _612 = _521 < _611;
    assign _613 = _612 ? _611 : _521;
    assign _614 = { _1173,
                    _613 };
    assign _427 = _426[175:64];
    assign _428 = _427[41:26];
    assign _429 = { gnd,
                    _428 };
    assign _615 = _429 + _614;
    always @(posedge _320) begin
        if (_318)
            _618 <= _1189;
        else
            _618 <= _615;
    end
    assign _404 = { gnd,
                    _400 };
    assign _619 = _404 < _618;
    assign _620 = ~ _619;
    assign _624 = _620 | _623;
    assign _633 = _624 & _632;
    assign _390 = _358[25:24];
    always @* begin
        case (_390)
        0:
            _400 <= _393;
        1:
            _400 <= _396;
        2:
            _400 <= _399;
        default:
            _400 <= _399;
        endcase
    end
    assign _402 = _400 == _1119;
    assign _637 = _402 ? _636 : _633;
    assign _384 = f_changed_all & f_chgmask0;
    assign _386 = _384 == _1279;
    assign _387 = ~ _386;
    assign _375 = f_chgmask0 == _1279;
    assign _388 = _375 | _387;
    assign _368 = _358[7:0];
    assign _366 = _358[15:8];
    assign _367 = _365 ^ _366;
    assign _369 = _367 & _368;
    assign _371 = _369 == _1279;
    assign _346 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _4208 = _409 + _1490;
    assign _1253 = 6'b000000;
    assign _126 = host_start_loc;
    assign _2865 = _2864 ? _2862 : _1254;
    assign _128 = host_recover_loc;
    assign _2852 = _2029 ? _128 : _2851;
    assign _129 = _2852;
    always @(posedge _320) begin
        if (_318)
            _2851 <= _1253;
        else
            _2851 <= _129;
    end
    assign _2855 = f_policy == _1271;
    assign _2856 = _2855 ? _2851 : _1254;
    assign _2857 = f_viol_now ? _2856 : _1254;
    assign _2866 = _1246 ? _2865 : _2857;
    assign _2853 = _342 == _1271;
    assign _2867 = _2853 ? _2866 : _1254;
    assign _2868 = _2029 ? _126 : _2867;
    assign _130 = _2868;
    always @(posedge _320) begin
        if (_318)
            _1254 <= _1253;
        else
            _1254 <= _130;
    end
    assign _2861 = _767[110:105];
    assign _2860 = _761[110:105];
    assign _2859 = _755[110:105];
    assign _2858 = _358[110:105];
    always @* begin
        case (f_winner)
        0:
            _2862 <= _2858;
        1:
            _2862 <= _2859;
        2:
            _2862 <= _2860;
        default:
            _2862 <= _2861;
        endcase
    end
    assign _2863 = _2862 == _1254;
    assign _2864 = ~ _2863;
    assign _4204 = _2864 ? _1130 : _409;
    assign _4199 = f_policy == _1271;
    assign _4201 = _4199 ? _1130 : _409;
    assign _2088 = f_changed_all & f_watch;
    assign _2090 = _2088 == _1279;
    assign _2091 = ~ _2090;
    assign _2086 = ~ _1246;
    assign _2087 = f_in_eval & _2086;
    assign f_unexp_now = _2087 & _2091;
    assign _2872 = ~ f_amb_now;
    assign _2873 = _2085 & _2872;
    assign _2875 = _2873 ? _1961 : _2871;
    assign _2876 = _1246 ? _2871 : _2875;
    assign _2871 = _1861 ? _1122 : _2083;
    assign _2869 = _342 == _1271;
    assign _2877 = _2869 ? _2876 : _2871;
    assign _131 = _2877;
    always @(posedge _320) begin
        if (_318)
            _2083 <= _1122;
        else
            _2083 <= _131;
    end
    assign _2084 = ~ _2083;
    assign _4190 = 16'b0000000000000001;
    assign _4191 = _393 + _4190;
    assign _4187 = _393 == _1119;
    assign _4188 = ~ _4187;
    assign _4189 = _4148 & _4188;
    assign _4192 = _4189 ? _4191 : _393;
    assign _4132 = _750[26:24];
    assign _4130 = _767[93:91];
    assign _4129 = _761[93:91];
    assign _4128 = _755[93:91];
    assign _4127 = _358[93:91];
    assign _1055 = f_chgmask2 & f_multi_eff;
    assign _1057 = _1055 == _1279;
    assign _1048 = _1005 == _1119;
    assign _1044 = _1005 == _1229;
    assign _1045 = _1044 & _1025;
    assign _1042 = _941 == _1001;
    assign _1046 = _1042 | _1045;
    assign _1049 = _940 ? _1048 : _1046;
    assign _1039 = _659[3:0];
    assign _1041 = _1039 == _2120;
    assign _1050 = _1041 | _1049;
    assign _1037 = _1005 == _1119;
    assign _1033 = _1005 == _1229;
    assign _1034 = _1033 & _1025;
    assign _1031 = _941 == _1001;
    assign _1035 = _1031 | _1034;
    assign _1038 = _940 ? _1037 : _1035;
    assign _1029 = _992 == _1119;
    always @(posedge _320) begin
        if (_318)
            _1023 <= _1130;
        else
            _1023 <= _984;
    end
    assign _1024 = { _1137,
                     _1023 };
    assign _1025 = _938 < _1024;
    assign _1019 = _992 == _1229;
    assign _1026 = _1019 & _1025;
    assign _1017 = _941 == _989;
    assign _1027 = _1017 | _1026;
    assign _1030 = _940 ? _1029 : _1027;
    assign _1016 = _761[104:103];
    always @* begin
        case (_1016)
        0:
            _1051 <= vdd;
        1:
            _1051 <= _1030;
        2:
            _1051 <= _1038;
        default:
            _1051 <= _1050;
        endcase
    end
    assign _1015 = ~ _700;
    assign _1052 = _1015 | _1051;
    assign _1012 = _761[62:62];
    assign _1010 = _761[61:58];
    always @* begin
        case (_1010)
        0:
            _1011 <= vdd;
        1:
            _1011 <= _644;
        2:
            _1011 <= _648;
        3:
            _1011 <= _652;
        4:
            _1011 <= _654;
        5:
            _1011 <= _656;
        6:
            _1011 <= _660;
        7:
            _1011 <= _663;
        8:
            _1011 <= _668;
        9:
            _1011 <= _671;
        10:
            _1011 <= _674;
        11:
            _1011 <= _677;
        12:
            _1011 <= _682;
        13:
            _1011 <= _685;
        14:
            _1011 <= _688;
        default:
            _1011 <= _691;
        endcase
    end
    assign _1013 = _1011 ^ _1012;
    assign _1005 = _761[57:42];
    assign _1007 = _1005 == _1119;
    assign _996 = _942[57:42];
    assign _997 = { gnd,
                    _996 };
    assign _998 = _997 + _985;
    always @(posedge _320) begin
        if (_318)
            _1001 <= _1189;
        else
            _1001 <= _998;
    end
    assign _1002 = _1001 < _941;
    assign _1003 = ~ _1002;
    assign _992 = _761[41:26];
    assign _994 = _992 == _1229;
    assign _976 = _946[0:0];
    assign _978 = _976 ? _606 : _1130;
    assign _973 = _946[1:1];
    assign _975 = _973 ? _585 : _1130;
    assign _979 = _975 < _978;
    assign _980 = _979 ? _978 : _975;
    assign _968 = _946[2:2];
    assign _970 = _968 ? _562 : _1130;
    assign _965 = _946[3:3];
    assign _967 = _965 ? _541 : _1130;
    assign _971 = _967 < _970;
    assign _972 = _971 ? _970 : _967;
    assign _981 = _972 < _980;
    assign _982 = _981 ? _980 : _972;
    assign _958 = _946[4:4];
    assign _960 = _958 ? _516 : _1130;
    assign _955 = _946[5:5];
    assign _957 = _955 ? _495 : _1130;
    assign _961 = _957 < _960;
    assign _962 = _961 ? _960 : _957;
    assign _950 = _946[6:6];
    assign _952 = _950 ? _472 : _1130;
    assign _946 = _942[23:16];
    assign _947 = _946[7:7];
    assign _949 = _947 ? _451 : _1130;
    assign _953 = _949 < _952;
    assign _954 = _953 ? _952 : _949;
    assign _963 = _954 < _962;
    assign _964 = _963 ? _962 : _954;
    assign _983 = _964 < _982;
    assign _984 = _983 ? _982 : _964;
    assign _985 = { _1173,
                    _984 };
    assign _942 = _426[399:288];
    assign _943 = _942[41:26];
    assign _944 = { gnd,
                    _943 };
    assign _986 = _944 + _985;
    always @(posedge _320) begin
        if (_318)
            _989 <= _1189;
        else
            _989 <= _986;
    end
    assign _941 = { gnd,
                    _938 };
    assign _990 = _941 < _989;
    assign _991 = ~ _990;
    assign _995 = _991 | _994;
    assign _1004 = _995 & _1003;
    assign _937 = _761[25:24];
    always @* begin
        case (_937)
        0:
            _938 <= _393;
        1:
            _938 <= _396;
        2:
            _938 <= _399;
        default:
            _938 <= _399;
        endcase
    end
    assign _940 = _938 == _1119;
    assign _1008 = _940 ? _1007 : _1004;
    assign _931 = f_changed_all & f_chgmask2;
    assign _933 = _931 == _1279;
    assign _934 = ~ _933;
    assign _930 = f_chgmask2 == _1279;
    assign _935 = _930 | _934;
    assign _924 = _761[7:0];
    assign _922 = _761[15:8];
    assign _923 = _365 ^ _922;
    assign _925 = _923 & _924;
    assign _927 = _925 == _1279;
    assign _928 = f_valid2 & _927;
    assign _936 = _928 & _935;
    assign _1009 = _936 & _1008;
    assign _1014 = _1009 & _1013;
    assign _1053 = _1014 & _1052;
    assign _1054 = f_in_eval & _1053;
    assign _1058 = _1054 & _1057;
    assign f_fire2 = _1058 & _782;
    assign _1062 = f_fire2 ? _1271 : _2097;
    assign f_policy = _750[59:58];
    assign _781 = f_policy == _1270;
    assign f_chgmask3 = _767[23:16];
    assign f_valid3 = _767[111:111];
    assign _771 = f_valid3 ? f_chgmask3 : _1279;
    assign f_chgmask2 = _761[23:16];
    assign f_valid2 = _761[111:111];
    assign _765 = f_valid2 ? f_chgmask2 : _1279;
    assign _759 = f_valid1 ? f_chgmask1 : _1279;
    assign f_chgmask0 = _358[23:16];
    assign _753 = f_valid0 ? f_chgmask0 : _1279;
    assign f_watch = _750[57:50];
    assign _754 = f_watch | _753;
    assign _760 = _754 | _759;
    assign _766 = _760 | _765;
    assign f_relevant = _766 | _771;
    assign _773 = f_multi_eff & f_relevant;
    assign _775 = _773 == _1279;
    assign _776 = ~ _775;
    assign f_amb_now = f_in_eval & _776;
    assign _778 = ~ f_amb_now;
    assign _782 = _778 | _781;
    assign _744 = _378 & f_chg_now;
    assign _2882 = _378 & f_chg_now;
    assign _2883 = _743 | _2882;
    assign _2879 = _342 == _1271;
    assign _2881 = _2879 ? _1279 : _743;
    assign _2878 = _342 == _1270;
    assign _2884 = _2878 ? _2883 : _2881;
    assign _2886 = _2029 ? _1279 : _2884;
    assign _132 = _2886;
    always @(posedge _320) begin
        if (_318)
            _743 <= _1279;
        else
            _743 <= _132;
    end
    assign f_multi_eff = _743 | _744;
    assign _917 = f_chgmask1 & f_multi_eff;
    assign _919 = _917 == _1279;
    assign _910 = _867 == _1119;
    assign _906 = _867 == _1229;
    assign _907 = _906 & _887;
    assign _904 = _803 == _863;
    assign _908 = _904 | _907;
    assign _911 = _802 ? _910 : _908;
    assign _901 = _659[3:0];
    assign _903 = _901 == _2120;
    assign _912 = _903 | _911;
    assign _899 = _867 == _1119;
    assign _895 = _867 == _1229;
    assign _896 = _895 & _887;
    assign _893 = _803 == _863;
    assign _897 = _893 | _896;
    assign _900 = _802 ? _899 : _897;
    assign _891 = _854 == _1119;
    always @(posedge _320) begin
        if (_318)
            _885 <= _1130;
        else
            _885 <= _846;
    end
    assign _886 = { _1137,
                    _885 };
    assign _887 = _800 < _886;
    assign _881 = _854 == _1229;
    assign _888 = _881 & _887;
    assign _879 = _803 == _851;
    assign _889 = _879 | _888;
    assign _892 = _802 ? _891 : _889;
    assign _878 = _755[104:103];
    always @* begin
        case (_878)
        0:
            _913 <= vdd;
        1:
            _913 <= _892;
        2:
            _913 <= _900;
        default:
            _913 <= _912;
        endcase
    end
    assign _134 = host_role;
    assign _2887 = _2029 ? _134 : _698;
    assign _135 = _2887;
    always @(posedge _320) begin
        if (_318)
            _698 <= _2571;
        else
            _698 <= _135;
    end
    assign _700 = _698 == _1271;
    assign _877 = ~ _700;
    assign _914 = _877 | _913;
    assign _874 = _755[62:62];
    assign _2891 = _1647 ? _1961 : _2889;
    assign _2889 = _1617 ? _1961 : _691;
    assign _2892 = _1602 ? _2891 : _2889;
    assign _2894 = _1501 ? _1122 : _2892;
    assign _2896 = _1499 ? _1122 : _2894;
    assign _136 = _2896;
    always @(posedge _320) begin
        if (_318)
            _691 <= _1122;
        else
            _691 <= _136;
    end
    assign _138 = host_lane1_sync_mask;
    assign _140 = host_lane1_sync;
    assign _2902 = _2901 ^ _140;
    assign _2903 = _2902 & _138;
    assign _2905 = _2903 == _1229;
    assign _2907 = _2905 ? _1961 : _688;
    assign _2908 = _1756 ? _2907 : _688;
    assign _2909 = _1647 ? _688 : _2908;
    assign _2910 = _1602 ? _2909 : _688;
    assign _2912 = _1501 ? _1122 : _2910;
    assign _2914 = _1499 ? _1122 : _2912;
    assign _141 = _2914;
    always @(posedge _320) begin
        if (_318)
            _688 <= _1122;
        else
            _688 <= _141;
    end
    assign _2927 = _1638 == _2926;
    assign _2928 = ~ _2927;
    assign _2930 = _2921 ? _2929 : g_crc_bad;
    assign _2931 = _1756 ? _2930 : g_crc_bad;
    assign _2932 = _1647 ? g_crc_bad : _2931;
    assign _2933 = _1602 ? _2932 : g_crc_bad;
    assign _2935 = _1501 ? _1122 : _2933;
    assign _142 = _2935;
    always @(posedge _320) begin
        if (_318)
            g_crc_bad <= _1122;
        else
            g_crc_bad <= _142;
    end
    assign _2929 = g_crc_bad | _2928;
    assign _2938 = ~ _2929;
    assign _2936 = 6'b000001;
    assign _2937 = g_left == _2936;
    assign _2939 = _2937 ? _2938 : _685;
    assign _2940 = _2921 ? _2939 : _685;
    assign _2941 = _1756 ? _2940 : _685;
    assign _2942 = _1647 ? _685 : _2941;
    assign _2943 = _1602 ? _2942 : _685;
    assign _2945 = _1501 ? _1122 : _2943;
    assign _2947 = _1499 ? _1122 : _2945;
    assign _143 = _2947;
    always @(posedge _320) begin
        if (_318)
            _685 <= _1122;
        else
            _685 <= _143;
    end
    assign _2951 = _1489 ? _1961 : _2949;
    assign _2949 = _1459 ? _1961 : _677;
    assign _2952 = _1444 ? _2951 : _2949;
    assign _2954 = _1343 ? _1122 : _2952;
    assign _2956 = _1341 ? _1122 : _2954;
    assign _144 = _2956;
    always @(posedge _320) begin
        if (_318)
            _677 <= _1122;
        else
            _677 <= _144;
    end
    assign _146 = host_lane0_sync_mask;
    assign _148 = host_lane0_sync;
    assign _2962 = _2961 ^ _148;
    assign _2963 = _2962 & _146;
    assign _2965 = _2963 == _1229;
    assign _2967 = _2965 ? _1961 : _674;
    assign _2968 = _1658 ? _2967 : _674;
    assign _2969 = _1489 ? _674 : _2968;
    assign _2970 = _1444 ? _2969 : _674;
    assign _2972 = _1343 ? _1122 : _2970;
    assign _2974 = _1341 ? _1122 : _2972;
    assign _149 = _2974;
    always @(posedge _320) begin
        if (_318)
            _674 <= _1122;
        else
            _674 <= _149;
    end
    assign _2987 = _1480 == _2986;
    assign _2988 = ~ _2987;
    assign _2990 = _2981 ? _2989 : g_crc_bad_0;
    assign _2991 = _1658 ? _2990 : g_crc_bad_0;
    assign _2992 = _1489 ? g_crc_bad_0 : _2991;
    assign _2993 = _1444 ? _2992 : g_crc_bad_0;
    assign _2995 = _1343 ? _1122 : _2993;
    assign _150 = _2995;
    always @(posedge _320) begin
        if (_318)
            g_crc_bad_0 <= _1122;
        else
            g_crc_bad_0 <= _150;
    end
    assign _2989 = g_crc_bad_0 | _2988;
    assign _2998 = ~ _2989;
    assign _2997 = g_left_0 == _2936;
    assign _2999 = _2997 ? _2998 : _671;
    assign _3000 = _2981 ? _2999 : _671;
    assign _3001 = _1658 ? _3000 : _671;
    assign _3002 = _1489 ? _671 : _3001;
    assign _3003 = _1444 ? _3002 : _671;
    assign _3005 = _1343 ? _1122 : _3003;
    assign _3007 = _1341 ? _1122 : _3005;
    assign _151 = _3007;
    always @(posedge _320) begin
        if (_318)
            _671 <= _1122;
        else
            _671 <= _151;
    end
    assign _153 = host_match_addr;
    assign _662 = _153[6:0];
    assign _661 = _651[7:1];
    assign _663 = _661 == _662;
    assign _658 = 16'b1010110011100001;
    assign _3012 = _659[10:10];
    assign _3011 = _659[12:12];
    assign _3013 = _3011 ^ _3012;
    assign _3010 = _659[13:13];
    assign _3014 = _3010 ^ _3013;
    assign _3009 = _659[15:15];
    assign _3015 = _3009 ^ _3014;
    assign _3008 = _659[14:0];
    assign _3016 = { _3008,
                     _3015 };
    assign _154 = _3016;
    always @(posedge _320) begin
        if (_318)
            _659 <= _658;
        else
            _659 <= _154;
    end
    assign _660 = _659[0:0];
    assign _3029 = _158 + _2439;
    assign _3027 = _158 - _2439;
    assign _3030 = _2504 ? _3029 : _3027;
    assign _2502 = _158 == _2120;
    assign _2511 = ~ _2502;
    assign _156 = host_rx_pop;
    assign _2512 = _156 & _2511;
    assign _2503 = ~ _656;
    assign _3023 = ~ _3022;
    assign _3019 = _1857 | _1871;
    assign _3017 = _1755 | _1822;
    assign _3018 = _1724 | _3017;
    assign _3020 = _3018 | _3019;
    assign _3024 = _3020 & _3023;
    assign f_rx_push = _3024;
    assign _2504 = f_rx_push & _2503;
    assign _3025 = _2504 ^ _2512;
    assign _3031 = _3025 ? _3030 : _158;
    always @(posedge _320) begin
        if (_318)
            _3034 <= _2120;
        else
            _3034 <= _3031;
    end
    assign _158 = _3034;
    assign _656 = _158 == _1895;
    assign _652 = _651[0:0];
    assign _3943 = _647[7:1];
    assign _3944 = { vdd,
                     _3943 };
    assign _3941 = _3933[7:7];
    assign _3940 = _3933[6:6];
    assign _3939 = _3933[5:5];
    assign _3938 = _3933[4:4];
    assign _3937 = _3933[3:3];
    assign _3936 = _3933[2:2];
    assign _3935 = _3933[1:1];
    assign _3934 = _3933[0:0];
    assign _3942 = { _3934,
                     _3935,
                     _3936,
                     _3937,
                     _3938,
                     _3939,
                     _3940,
                     _3941 };
    assign _3926 = _297 + _2439;
    assign _3924 = _297 - _2439;
    assign _3927 = _3051 ? _3926 : _3924;
    assign _1726 = _297 == _1895;
    assign _3050 = ~ _1726;
    assign _3047 = ~ _295;
    assign _160 = host_tx_push;
    assign _3048 = _160 & _3047;
    assign _1722 = ~ _1688;
    assign _1716 = g_bitpos_0 + _1490;
    assign _1711 = ~ _1474;
    assign g_tx_bit = _1701 & _1709;
    assign _1712 = g_tx_bit & _1711;
    assign _1713 = _1712 & g_data_left_0;
    assign _1714 = _1682 | _1713;
    assign _1717 = _1714 ? _1716 : g_bitpos_0;
    assign _1719 = _1717 == _1130;
    assign _1720 = ~ _1719;
    assign _1691 = _1690 & _291;
    assign _1721 = _1691 & _1720;
    assign _1723 = _1721 & _1722;
    assign _1687 = g_bitpos_0 == _2496;
    assign _1678 = g_cnt_0[5:0];
    assign _1679 = _1678 < _257;
    assign _1680 = ~ _1679;
    assign _1674 = g_cnt_0[15:6];
    assign _1676 = _1674 == _1134;
    assign _1677 = ~ _1676;
    assign _1681 = _1677 | _1680;
    assign _3914 = ~ _287;
    assign _3915 = _291 & _3914;
    assign _3918 = _3915 ? _1270 : _1271;
    assign _3907 = ~ _1709;
    assign _3908 = _1701 & _3907;
    assign _3909 = _668 | _3908;
    assign _3910 = _3909 | _3899;
    assign _3912 = _3910 ? _1271 : _3906;
    assign _3893 = g_run_0 + _1490;
    assign _3890 = g_run_0 + _1490;
    assign _3886 = vdd == g_last_0;
    assign _3884 = g_run_0 == _1130;
    assign _3885 = ~ _3884;
    assign _3887 = _3885 & _3886;
    assign _3891 = _3887 ? _3890 : _1490;
    assign _3882 = _269 == _1271;
    assign _3894 = _3882 ? _3893 : _3891;
    assign _3895 = _3894 == _163;
    assign _3876 = g_run_0 + _1490;
    assign _3872 = gnd == g_last_0;
    assign _3870 = g_run_0 == _1130;
    assign _3871 = ~ _3870;
    assign _3873 = _3871 & _3872;
    assign _3877 = _3873 ? _3876 : _1490;
    assign _3868 = _269 == _1271;
    assign _3879 = _3868 ? _1130 : _3877;
    assign _3880 = _3879 == _163;
    assign _3896 = _1480 ? _3895 : _3880;
    assign _3897 = _1469 & _3896;
    assign _3898 = ~ _3897;
    assign _3864 = g_left_0 == _2936;
    assign _3862 = g_left_0 == _1253;
    assign _3865 = _2981 ? _3864 : _3862;
    assign _3857 = g_cnt_0 + _4190;
    assign _3858 = _3857 == _1671;
    assign _3855 = g_cnt_0 == _1671;
    assign _3859 = _1673 ? _3858 : _3855;
    assign _3853 = ~ _1489;
    assign _3854 = _1444 & _3853;
    assign _3860 = _3854 & _3859;
    assign _3866 = _3860 & _3865;
    assign _3899 = _3866 & _3898;
    assign _3901 = _3899 ? _2097 : _3852;
    assign _3903 = _1489 ? _2571 : _3901;
    assign _3849 = _1709 ? _3847 : _2097;
    assign _3845 = _1370 & _1368;
    assign _3847 = _3845 ? _1271 : g_mode_0;
    assign _3850 = _1701 ? _3849 : _3847;
    assign _3126 = _1709 ? _3125 : _3037;
    assign _3127 = _1701 ? _3126 : _3037;
    assign _161 = _3127;
    always @(posedge _320) begin
        if (_318)
            _3037 <= _1122;
        else
            _3037 <= _161;
    end
    assign _3771 = ~ _3125;
    assign _3769 = ~ f_lane0_out;
    assign _3770 = _3125 ? f_lane0_out : _3769;
    always @* begin
        case (_285)
        0:
            _3772 <= _3125;
        1:
            _3772 <= _3770;
        2:
            _3772 <= _3771;
        default:
            _3772 <= _3125;
        endcase
    end
    assign _163 = host_lane0_stuff_len;
    assign _3753 = g_run_0 + _1490;
    assign _3754 = _1480 ? _3753 : _1130;
    assign _3749 = g_run_0 + _1490;
    assign _3745 = _1480 == g_last_0;
    assign _3743 = g_run_0 == _1130;
    assign _3744 = ~ _3743;
    assign _3746 = _3744 & _3745;
    assign _3750 = _3746 ? _3749 : _1490;
    assign _3741 = _269 == _1271;
    assign _3755 = _3741 ? _3754 : _3750;
    assign _3756 = _1489 ? _3739 : _3755;
    assign _3735 = g_run_0 + _1490;
    assign _3736 = _3125 ? _3735 : _1130;
    assign _3731 = g_run_0 + _1490;
    assign _3122 = _3114[7:7];
    assign _3121 = _3114[6:6];
    assign _3120 = _3114[5:5];
    assign _3119 = _3114[4:4];
    assign _3118 = _3114[3:3];
    assign _3117 = _3114[2:2];
    assign _3116 = _3114[1:1];
    assign _3112 = _3104[7:7];
    assign _3111 = _3104[6:6];
    assign _3110 = _3104[5:5];
    assign _3109 = _3104[4:4];
    assign _3108 = _3104[3:3];
    assign _3107 = _3104[2:2];
    assign _3106 = _3104[1:1];
    assign _3098 = _3054 == _2496;
    assign _3099 = _3051 & _3098;
    always @(posedge _320) begin
        if (_318)
            _3100 <= _1279;
        else
            if (_3099)
                _3100 <= _3044;
    end
    assign _3092 = _3054 == _1997;
    assign _3093 = _3051 & _3092;
    always @(posedge _320) begin
        if (_318)
            _3094 <= _1279;
        else
            if (_3093)
                _3094 <= _3044;
    end
    assign _3086 = _3054 == _1998;
    assign _3087 = _3051 & _3086;
    always @(posedge _320) begin
        if (_318)
            _3088 <= _1279;
        else
            if (_3087)
                _3088 <= _3044;
    end
    assign _3080 = _3054 == _1327;
    assign _3081 = _3051 & _3080;
    always @(posedge _320) begin
        if (_318)
            _3082 <= _1279;
        else
            if (_3081)
                _3082 <= _3044;
    end
    assign _3074 = _3054 == _2001;
    assign _3075 = _3051 & _3074;
    always @(posedge _320) begin
        if (_318)
            _3076 <= _1279;
        else
            if (_3075)
                _3076 <= _3044;
    end
    assign _3068 = _3054 == _1463;
    assign _3069 = _3051 & _3068;
    always @(posedge _320) begin
        if (_318)
            _3070 <= _1279;
        else
            if (_3069)
                _3070 <= _3044;
    end
    assign _3062 = _3054 == _1490;
    assign _3063 = _3051 & _3062;
    always @(posedge _320) begin
        if (_318)
            _3064 <= _1279;
        else
            if (_3063)
                _3064 <= _3044;
    end
    assign _3129 = _3054 + _1490;
    assign _3130 = _3051 ? _3129 : _3054;
    assign _164 = _3130;
    always @(posedge _320) begin
        if (_318)
            _3054 <= _1130;
        else
            _3054 <= _164;
    end
    assign _3056 = _3054 == _1130;
    assign _3057 = _3051 & _3056;
    assign _3197 = _1682 ? _3196 : g_byte_0;
    assign _3198 = _1688 ? _3196 : _3197;
    assign _3148 = _3147 ? _3145 : _3135;
    assign _3146 = _3132 ? _3145 : _3135;
    assign _3149 = _1826 ? _3148 : _3146;
    assign _165 = _3149;
    always @(posedge _320) begin
        if (_318)
            _3135 <= _1279;
        else
            _3135 <= _165;
    end
    assign _3144 = _1780 ? _3143 : g_byte;
    assign _3145 = _1786 ? _3143 : _3144;
    assign _3190 = _1755 ? _3135 : _3145;
    assign _3157 = _3156 ? _651 : _3154;
    assign _3155 = _3151 ? _651 : _3154;
    assign _3158 = _1878 ? _3157 : _3155;
    assign _166 = _3158;
    always @(posedge _320) begin
        if (_318)
            _3154 <= _1279;
        else
            _3154 <= _166;
    end
    assign _3175 = _651[6:0];
    assign _3176 = { _3175,
                     _3172 };
    assign _3173 = _651[7:1];
    assign _3171 = _365[7:7];
    assign _3170 = _365[6:6];
    assign _3169 = _365[5:5];
    assign _3168 = _365[4:4];
    assign _3167 = _365[3:3];
    assign _3166 = _365[2:2];
    assign _3165 = _365[1:1];
    assign _3164 = _365[0:0];
    assign _3162 = _767[102:100];
    assign _3161 = _761[102:100];
    assign _3160 = _755[102:100];
    assign _3159 = _358[102:100];
    always @* begin
        case (f_winner)
        0:
            _3163 <= _3159;
        1:
            _3163 <= _3160;
        2:
            _3163 <= _3161;
        default:
            _3163 <= _3162;
        endcase
    end
    always @* begin
        case (_3163)
        0:
            _3172 <= _3164;
        1:
            _3172 <= _3165;
        2:
            _3172 <= _3166;
        3:
            _3172 <= _3167;
        4:
            _3172 <= _3168;
        5:
            _3172 <= _3169;
        6:
            _3172 <= _3170;
        default:
            _3172 <= _3171;
        endcase
    end
    assign _3174 = { _3172,
                     _3173 };
    always @* begin
        case (_1868)
        0:
            _3177 <= _651;
        1:
            _3177 <= _3174;
        2:
            _3177 <= _3176;
        default:
            _3177 <= _651;
        endcase
    end
    assign _3178 = _1861 ? _3177 : _651;
    assign _167 = _3178;
    always @(posedge _320) begin
        if (_318)
            _651 <= _1279;
        else
            _651 <= _167;
    end
    assign _3156 = _1857 & _1871;
    assign _3182 = _3156 ? _1857 : _1122;
    assign _3150 = ~ _1857;
    assign _3151 = _3150 & _1871;
    assign _3180 = _3151 ? _1961 : _1857;
    assign _1865 = _767[97:96];
    assign _1864 = _761[97:96];
    assign _1863 = _755[97:96];
    assign _1862 = _358[97:96];
    always @* begin
        case (f_winner)
        0:
            _1866 <= _1862;
        1:
            _1866 <= _1863;
        2:
            _1866 <= _1864;
        default:
            _1866 <= _1865;
        endcase
    end
    assign _1868 = _1860 ? _2571 : _1866;
    assign f_eng_push = _1868 == _2097;
    assign _1871 = _1861 & f_eng_push;
    assign _1877 = _1857 | _1871;
    assign _1874 = _1755 | _1822;
    assign _1875 = ~ _1874;
    assign _1873 = ~ _1724;
    assign _1876 = _1873 & _1875;
    assign _1878 = _1876 & _1877;
    assign _3183 = _1878 ? _3182 : _3180;
    assign _168 = _3183;
    always @(posedge _320) begin
        if (_318)
            _1857 <= _1122;
        else
            _1857 <= _168;
    end
    assign _3189 = _1857 ? _3154 : _651;
    assign _3147 = _1755 & _1822;
    assign _3187 = _3147 ? _1755 : _1122;
    assign _1820 = ~ _1786;
    assign _1814 = g_bitpos + _1490;
    assign _1809 = ~ _1632;
    assign g_tx_bit_0 = _1799 & _1807;
    assign _1810 = g_tx_bit_0 & _1809;
    assign _1811 = _1810 & g_data_left;
    assign _1812 = _1780 | _1811;
    assign _1815 = _1812 ? _1814 : g_bitpos;
    assign _1817 = _1815 == _1130;
    assign _1818 = ~ _1817;
    assign _1789 = _1788 & _232;
    assign _1819 = _1789 & _1818;
    assign _1821 = _1819 & _1820;
    assign _1785 = g_bitpos == _2496;
    assign _1786 = _1780 & _1785;
    assign _1822 = _1786 | _1821;
    assign _3131 = ~ _1755;
    assign _3132 = _3131 & _1822;
    assign _3185 = _3132 ? _1961 : _1755;
    assign _3188 = _1826 ? _3187 : _3185;
    assign _169 = _3188;
    always @(posedge _320) begin
        if (_318)
            _1755 <= _1122;
        else
            _1755 <= _169;
    end
    assign _1825 = _1755 | _1822;
    assign _1824 = ~ _1724;
    assign _1826 = _1824 & _1825;
    assign _3191 = _1826 ? _3190 : _3189;
    assign _3199 = _1724 ? _3198 : _3191;
    assign _170 = _3199;
    assign _171 = _170;
    assign _173 = host_tx_data;
    assign _3044 = _296 ? _171 : _173;
    always @(posedge _320) begin
        if (_318)
            _3058 <= _1279;
        else
            if (_3057)
                _3058 <= _3044;
    end
    assign _3575 = _3043 + _1490;
    assign _3572 = ~ _654;
    assign _1954 = ~ _654;
    assign _1790 = ~ _232;
    assign _3562 = ~ _230;
    assign _3563 = _232 & _3562;
    assign _3566 = _3563 ? _1270 : _1271;
    assign _3555 = ~ _1807;
    assign _3556 = _1799 & _3555;
    assign _3557 = _682 | _3556;
    assign _3558 = _3557 | _3547;
    assign _3560 = _3558 ? _1271 : _3554;
    assign _3541 = g_run + _1490;
    assign _3538 = g_run + _1490;
    assign _3534 = vdd == g_last;
    assign _3532 = g_run == _1130;
    assign _3533 = ~ _3532;
    assign _3535 = _3533 & _3534;
    assign _3539 = _3535 ? _3538 : _1490;
    assign _3530 = _210 == _1271;
    assign _3542 = _3530 ? _3541 : _3539;
    assign _3543 = _3542 == _176;
    assign _3524 = g_run + _1490;
    assign _3520 = gnd == g_last;
    assign _3518 = g_run == _1130;
    assign _3519 = ~ _3518;
    assign _3521 = _3519 & _3520;
    assign _3525 = _3521 ? _3524 : _1490;
    assign _3516 = _210 == _1271;
    assign _3527 = _3516 ? _1130 : _3525;
    assign _3528 = _3527 == _176;
    assign _3544 = _1638 ? _3543 : _3528;
    assign _3545 = _1627 & _3544;
    assign _3546 = ~ _3545;
    assign _3512 = g_left == _2936;
    assign _3510 = g_left == _1253;
    assign _3513 = _2921 ? _3512 : _3510;
    assign _3505 = g_cnt + _4190;
    assign _3506 = _3505 == _1769;
    assign _3503 = g_cnt == _1769;
    assign _3507 = _1771 ? _3506 : _3503;
    assign _3501 = ~ _1647;
    assign _3502 = _1602 & _3501;
    assign _3508 = _3502 & _3507;
    assign _3514 = _3508 & _3513;
    assign _3547 = _3514 & _3546;
    assign _3549 = _3547 ? _2097 : _3500;
    assign _3551 = _1647 ? _2571 : _3549;
    assign _3497 = _1807 ? _3495 : _2097;
    assign _3493 = _1528 & _1526;
    assign _3495 = _3493 ? _1271 : g_mode;
    assign _3498 = _1799 ? _3497 : _3495;
    assign _3227 = _1807 ? _3226 : _3202;
    assign _3228 = _1799 ? _3227 : _3202;
    assign _174 = _3228;
    always @(posedge _320) begin
        if (_318)
            _3202 <= _1122;
        else
            _3202 <= _174;
    end
    assign _3423 = ~ _3226;
    assign _3421 = ~ f_lane1_out;
    assign _3422 = _3226 ? f_lane1_out : _3421;
    always @* begin
        case (_226)
        0:
            _3424 <= _3226;
        1:
            _3424 <= _3422;
        2:
            _3424 <= _3423;
        default:
            _3424 <= _3226;
        endcase
    end
    assign _176 = host_lane1_stuff_len;
    assign _3405 = g_run + _1490;
    assign _3406 = _1638 ? _3405 : _1130;
    assign _3401 = g_run + _1490;
    assign _3397 = _1638 == g_last;
    assign _3395 = g_run == _1130;
    assign _3396 = ~ _3395;
    assign _3398 = _3396 & _3397;
    assign _3402 = _3398 ? _3401 : _1490;
    assign _3393 = _210 == _1271;
    assign _3407 = _3393 ? _3406 : _3402;
    assign _3408 = _1647 ? _3391 : _3407;
    assign _3387 = g_run + _1490;
    assign _3388 = _3226 ? _3387 : _1130;
    assign _3383 = g_run + _1490;
    assign _3223 = _3215[7:7];
    assign _3222 = _3215[6:6];
    assign _3221 = _3215[5:5];
    assign _3220 = _3215[4:4];
    assign _3219 = _3215[3:3];
    assign _3218 = _3215[2:2];
    assign _3217 = _3215[1:1];
    assign _3213 = _3205[7:7];
    assign _3212 = _3205[6:6];
    assign _3211 = _3205[5:5];
    assign _3210 = _3205[4:4];
    assign _3209 = _3205[3:3];
    assign _3208 = _3205[2:2];
    assign _3207 = _3205[1:1];
    assign _3204 = _654 ? _1277 : _3101;
    assign _3141 = g_byte[7:1];
    assign _3142 = { _1638,
                     _3141 };
    assign _3139 = g_byte[6:0];
    assign _3140 = { _3139,
                     _1638 };
    assign _3143 = _179 ? _3142 : _3140;
    assign _3233 = _1780 ? _3143 : _3232;
    assign _3234 = _1771 ? _3233 : _3232;
    assign _3235 = _1756 ? _3234 : _3232;
    assign _3236 = _1647 ? _3232 : _3235;
    assign _3229 = g_data_left ? _3205 : g_byte;
    assign _3230 = _1632 ? g_byte : _3229;
    assign _3231 = _1807 ? _3230 : g_byte;
    assign _3232 = _1799 ? _3231 : g_byte;
    assign _3237 = _1602 ? _3236 : _3232;
    assign _177 = _3237;
    always @(posedge _320) begin
        if (_318)
            g_byte <= _1279;
        else
            g_byte <= _177;
    end
    assign _1951 = g_bitpos == _1130;
    assign _1948 = ~ _1632;
    assign _1949 = _1948 & g_data_left;
    assign _1952 = _1949 & _1951;
    assign _3205 = _1952 ? _3204 : g_byte;
    assign _3206 = _3205[0:0];
    assign _3214 = { _3206,
                     _3207,
                     _3208,
                     _3209,
                     _3210,
                     _3211,
                     _3212,
                     _3213 };
    assign _179 = host_lane1_lsb_first;
    assign _3215 = _179 ? _3205 : _3214;
    assign _3216 = _3215[0:0];
    assign _3245 = g_bitpos + _1490;
    assign _1776 = g_cnt[5:0];
    assign _1777 = _1776 < _198;
    assign _1778 = ~ _1777;
    assign _1772 = g_cnt[15:6];
    assign _1774 = _1772 == _1134;
    assign _1775 = ~ _1774;
    assign _1779 = _1775 | _1778;
    assign _1780 = _1771 & _1779;
    assign _3246 = _1780 ? _3245 : _3243;
    assign _3247 = _1771 ? _3246 : _3243;
    assign _3248 = _1756 ? _3247 : _3243;
    assign _3249 = _1647 ? _3243 : _3248;
    assign _3239 = g_bitpos + _1490;
    assign _3240 = g_data_left ? _3239 : g_bitpos;
    assign _3241 = _1632 ? g_bitpos : _3240;
    assign _3242 = _1807 ? _3241 : g_bitpos;
    assign _3243 = _1799 ? _3242 : g_bitpos;
    assign _3250 = _1602 ? _3249 : _3243;
    assign _3252 = _1501 ? _1130 : _3250;
    assign _180 = _3252;
    always @(posedge _320) begin
        if (_318)
            g_bitpos <= _1130;
        else
            g_bitpos <= _180;
    end
    always @* begin
        case (g_bitpos)
        0:
            _3224 <= _3216;
        1:
            _3224 <= _3217;
        2:
            _3224 <= _3218;
        3:
            _3224 <= _3219;
        4:
            _3224 <= _3220;
        5:
            _3224 <= _3221;
        6:
            _3224 <= _3222;
        default:
            _3224 <= _3223;
        endcase
    end
    assign _182 = host_lane1_crc_inv;
    assign _184 = host_lane1_init;
    assign _3294 = g_crc[30:0];
    assign _3296 = { _3294,
                     _1122 };
    assign _3288 = g_crc[31:31];
    assign _3289 = _1638 ^ _3288;
    assign _3291 = _3289 ? _189 : _2128;
    assign _3285 = g_crc[30:0];
    assign _3287 = { _3285,
                     _1122 };
    assign _3292 = _3287 ^ _3291;
    assign _3293 = _1771 ? _3292 : _3284;
    assign _186 = host_lane1_crc_width;
    assign _3262 = g_left - _2936;
    assign _3263 = _2921 ? _3262 : _3260;
    assign _3264 = _1756 ? _3263 : _3260;
    assign _3265 = _1647 ? _3260 : _3264;
    assign _3256 = g_left - _2936;
    assign _3257 = g_data_left ? g_left : _3256;
    assign _3258 = _1632 ? g_left : _3257;
    assign _3259 = _1807 ? _3258 : g_left;
    assign _3260 = _1799 ? _3259 : g_left;
    assign _3266 = _1602 ? _3265 : _3260;
    assign _3267 = _3254 ? _186 : _3266;
    assign _3269 = _1501 ? _1253 : _3267;
    assign _187 = _3269;
    always @(posedge _320) begin
        if (_318)
            g_left <= _1253;
        else
            g_left <= _187;
    end
    assign _1805 = g_left == _1253;
    assign _1806 = ~ _1805;
    assign _2919 = ~ g_data_left;
    assign _2918 = _1602 & _1756;
    assign _2920 = _2918 & _2919;
    assign _2921 = _2920 & _1806;
    assign _3297 = _2921 ? _3296 : _3293;
    assign _3298 = _1756 ? _3297 : _3284;
    assign _3299 = _1647 ? _3284 : _3298;
    assign _189 = host_lane1_poly;
    assign _3276 = g_crc[31:31];
    assign _3277 = _3226 ^ _3276;
    assign _3279 = _3277 ? _189 : _2128;
    assign _3273 = g_crc[30:0];
    assign _3275 = { _3273,
                     _1122 };
    assign _3280 = _3275 ^ _3279;
    assign _3270 = g_crc[30:0];
    assign _3272 = { _3270,
                     _1122 };
    assign _3281 = g_data_left ? _3280 : _3272;
    assign _3282 = _1632 ? g_crc : _3281;
    assign _3283 = _1807 ? _3282 : g_crc;
    assign _3284 = _1799 ? _3283 : g_crc;
    assign _3300 = _1602 ? _3299 : _3284;
    assign _3301 = _1501 ? _184 : _3300;
    assign _3303 = _1499 ? _2128 : _3301;
    assign _190 = _3303;
    always @(posedge _320) begin
        if (_318)
            g_crc <= _2128;
        else
            g_crc <= _190;
    end
    assign _2925 = g_crc[31:31];
    assign _2926 = _2925 ^ _182;
    assign _3319 = _3318 ? _3316 : g_lim;
    assign _3320 = g_len_cap ? _3319 : g_lim;
    assign _191 = _3320;
    always @(posedge _320) begin
        if (_318)
            g_lim <= _1279;
        else
            g_lim <= _191;
    end
    assign _1768 = { _1279,
                     g_lim };
    assign _193 = host_lane1_frame_bits;
    assign _2900 = g_sr[14:0];
    assign _2901 = { _2900,
                     _1638 };
    assign _3321 = _1756 ? _2901 : g_sr;
    assign _3322 = _1647 ? g_sr : _3321;
    assign _3323 = _1602 ? _3322 : g_sr;
    assign _3325 = _1501 ? _1229 : _3323;
    assign _194 = _3325;
    always @(posedge _320) begin
        if (_318)
            g_sr <= _1229;
        else
            g_sr <= _194;
    end
    assign _3311 = g_sr[3:0];
    assign _196 = host_lane1_len_max;
    assign _3312 = _196 < _3311;
    assign _3313 = _3312 ? _196 : _3311;
    assign _3315 = { _1122,
                     _3313,
                     _1130 };
    assign _198 = host_lane1_skip;
    assign _3309 = { _2571,
                     _198 };
    assign _3316 = _3309 + _3315;
    assign _3317 = { _1279,
                     _3316 };
    assign _3318 = _3317 < _193;
    assign _3344 = _3318 ? _1961 : g_len_known;
    assign _200 = host_lane1_len_pos;
    assign _3330 = g_cnt[5:0];
    assign _3331 = _3330 == _200;
    assign _3326 = g_cnt[15:6];
    assign _3328 = _3326 == _1134;
    assign _202 = host_lane1_len_en;
    assign _3329 = _202 & _3328;
    assign _3332 = _3329 & _3331;
    assign _3334 = _3332 ? _1961 : g_len_cap;
    assign _3335 = _1771 ? _3334 : g_len_cap;
    assign _3336 = _1756 ? _3335 : g_len_cap;
    assign _3337 = _1647 ? g_len_cap : _3336;
    assign _3338 = _1602 ? _3337 : g_len_cap;
    assign _3340 = g_len_cap ? _1122 : _3338;
    assign _3342 = _1501 ? _1122 : _3340;
    assign _203 = _3342;
    always @(posedge _320) begin
        if (_318)
            g_len_cap <= _1122;
        else
            g_len_cap <= _203;
    end
    assign _3345 = g_len_cap ? _3344 : g_len_known;
    assign _3347 = _1501 ? _1122 : _3345;
    assign _204 = _3347;
    always @(posedge _320) begin
        if (_318)
            g_len_known <= _1122;
        else
            g_len_known <= _204;
    end
    assign _1769 = g_len_known ? _1768 : _193;
    assign _3367 = g_cnt + _4190;
    assign _1757 = _1602 & _1756;
    assign _1771 = _1757 & g_data_left;
    assign _3368 = _1771 ? _3367 : _3365;
    assign _1756 = ~ _1632;
    assign _3369 = _1756 ? _3368 : _3365;
    assign _3350 = _1647 ? _3349 : _1638;
    assign _3348 = _1807 ? _3226 : g_last;
    assign _3349 = _1799 ? _3348 : g_last;
    assign _3351 = _1602 ? _3350 : _3349;
    assign _3353 = _1501 ? _1961 : _3351;
    assign _205 = _3353;
    always @(posedge _320) begin
        if (_318)
            g_last <= vdd;
        else
            g_last <= _205;
    end
    assign _1643 = ~ g_last;
    assign _1640 = _210 == _1270;
    assign _1644 = _1640 ? _1643 : gnd;
    assign _3355 = _226 == _1270;
    assign _3356 = _3355 ? _1513 : g_prev;
    assign _3357 = _1602 ? _3356 : g_prev;
    assign _3359 = _1501 ? _1961 : _3357;
    assign _206 = _3359;
    always @(posedge _320) begin
        if (_318)
            g_prev <= vdd;
        else
            g_prev <= _206;
    end
    assign _1637 = _1513 == g_prev;
    assign _1634 = _226 == _1270;
    assign _1638 = _1634 ? _1637 : _1513;
    assign _1645 = _1638 == _1644;
    assign _1646 = ~ _1645;
    assign _1647 = _1632 & _1646;
    assign _3370 = _1647 ? _3365 : _3369;
    assign _3361 = g_cnt + _4190;
    assign _3362 = g_data_left ? _3361 : g_cnt;
    assign _3363 = _1632 ? g_cnt : _3362;
    assign _3364 = _1807 ? _3363 : g_cnt;
    assign _3365 = _1799 ? _3364 : g_cnt;
    assign _3371 = _1602 ? _3370 : _3365;
    assign _3373 = _1501 ? _1229 : _3371;
    assign _207 = _3373;
    always @(posedge _320) begin
        if (_318)
            g_cnt <= _1229;
        else
            g_cnt <= _207;
    end
    assign g_data_left = g_cnt < _1769;
    assign _3225 = g_data_left ? _3224 : _2926;
    assign _3226 = _1632 ? _1644 : _3225;
    assign _3379 = _3226 == g_last;
    assign _3377 = g_run == _1130;
    assign _3378 = ~ _3377;
    assign _3380 = _3378 & _3379;
    assign _3384 = _3380 ? _3383 : _1490;
    assign _3375 = _210 == _1271;
    assign _3389 = _3375 ? _3388 : _3384;
    assign _3390 = _1807 ? _3389 : g_run;
    assign _3391 = _1799 ? _3390 : g_run;
    assign _3409 = _1602 ? _3408 : _3391;
    assign _3411 = _1501 ? _1130 : _3409;
    assign _208 = _3411;
    always @(posedge _320) begin
        if (_318)
            g_run <= _1130;
        else
            g_run <= _208;
    end
    assign _1631 = g_run == _176;
    assign _210 = host_lane1_stuff;
    assign _1626 = _210 == _2571;
    assign _1627 = ~ _1626;
    assign _1632 = _1627 & _1631;
    assign _1800 = _1632 | g_data_left;
    assign _1807 = _1800 | _1806;
    assign _3425 = _1807 ? _3424 : _1961;
    assign _3426 = _1799 ? _3425 : f_lane1_out;
    assign _1795 = _1572 == _1229;
    assign _1793 = _1537 == _1229;
    assign _1796 = _1565 ? _1795 : _1793;
    assign _1797 = _1533 ? vdd : _1796;
    assign _1798 = _230 ? _1600 : _1797;
    assign _3418 = ~ _1798;
    assign _3415 = _226 == _1271;
    assign _3412 = ~ _232;
    assign _3413 = _1503 & _3412;
    assign _3416 = _3413 & _3415;
    assign _3417 = _3416 & _1601;
    assign _3419 = _3417 & _3418;
    assign _3427 = _3419 ? _3202 : _3426;
    assign _3429 = _1617 ? _1961 : _3427;
    assign _3431 = _1788 ? _1961 : _3429;
    assign _3433 = _1501 ? _1961 : _3431;
    assign _3435 = _1499 ? _1961 : _3433;
    assign _211 = _3435;
    always @(posedge _320) begin
        if (_318)
            f_lane1_out <= vdd;
        else
            f_lane1_out <= _211;
    end
    assign _1615 = _1513 == f_lane1_out;
    assign _1616 = ~ _1615;
    assign _1609 = _226 == _1271;
    assign _1610 = ~ _1609;
    assign _1606 = ~ _230;
    assign _213 = host_lane1_readback;
    assign _1603 = ~ _232;
    assign _1604 = _1503 & _1603;
    assign _1605 = _1604 & _213;
    assign _1607 = _1605 & _1606;
    assign _1611 = _1607 & _1610;
    assign _1612 = _1611 & _1601;
    assign _1617 = _1612 & _1616;
    assign _3500 = _1617 ? _2571 : _3498;
    assign _1598 = ~ _1586;
    assign _1599 = _1595 & _1598;
    assign _1594 = _381[7:7];
    assign _1593 = _381[6:6];
    assign _1592 = _381[5:5];
    assign _1591 = _381[4:4];
    assign _1590 = _381[3:3];
    assign _1589 = _381[2:2];
    assign _1588 = _381[1:1];
    assign _1587 = _381[0:0];
    always @* begin
        case (_215)
        0:
            _1595 <= _1587;
        1:
            _1595 <= _1588;
        2:
            _1595 <= _1589;
        3:
            _1595 <= _1590;
        4:
            _1595 <= _1591;
        5:
            _1595 <= _1592;
        6:
            _1595 <= _1593;
        default:
            _1595 <= _1594;
        endcase
    end
    assign _1596 = ~ _1595;
    assign _1585 = _365[7:7];
    assign _1584 = _365[6:6];
    assign _1583 = _365[5:5];
    assign _1582 = _365[4:4];
    assign _1581 = _365[3:3];
    assign _1580 = _365[2:2];
    assign _1579 = _365[1:1];
    assign _1578 = _365[0:0];
    assign _215 = host_lane1_clk_pin;
    always @* begin
        case (_215)
        0:
            _1586 <= _1578;
        1:
            _1586 <= _1579;
        2:
            _1586 <= _1580;
        3:
            _1586 <= _1581;
        4:
            _1586 <= _1582;
        5:
            _1586 <= _1583;
        6:
            _1586 <= _1584;
        default:
            _1586 <= _1585;
        endcase
    end
    assign _1597 = _1586 & _1596;
    assign _217 = host_lane1_clk_edge;
    assign _1600 = _217 ? _1599 : _1597;
    assign _1576 = _1561 == _1229;
    assign _1573 = _1572 == _1561;
    assign _1566 = _1537 == _1561;
    assign _1564 = ~ _1528;
    assign _1555 = _219[15:2];
    assign _1556 = { _2571,
                     _1555 };
    assign _1552 = _219[15:1];
    assign _1553 = { _1122,
                     _1552 };
    assign _1557 = _1553 + _1556;
    assign _1549 = _219[15:1];
    assign _1550 = { _1122,
                     _1549 };
    assign _1547 = _232 & _1530;
    assign _1558 = _1547 ? _1557 : _1550;
    always @(posedge _320) begin
        if (_318)
            _1561 <= _1229;
        else
            _1561 <= _1558;
    end
    assign _1562 = _1537 < _1561;
    assign _1539 = _219[15:2];
    assign _1540 = { _2571,
                     _1539 };
    always @(posedge _320) begin
        if (_318)
            _1543 <= _1229;
        else
            _1543 <= _1540;
    end
    assign _3481 = ~ _1528;
    assign _3482 = _1563 & _3481;
    assign _3483 = _3482 ? _1572 : _1537;
    assign _3485 = _1533 ? _1229 : _3483;
    assign _3487 = _3485 + _4190;
    assign _3465 = _3459 == _1189;
    assign _1568 = _219[15:1];
    assign _1569 = { _1122,
                     _1568 };
    always @(posedge _320) begin
        if (_318)
            _1572 <= _1229;
        else
            _1572 <= _1569;
    end
    assign _3461 = { gnd,
                     _1572 };
    assign _3462 = _3461 == _3459;
    assign _3455 = { gnd,
                     _219 };
    always @(posedge _320) begin
        if (_318)
            _3458 <= _1189;
        else
            _3458 <= _3455;
    end
    assign _3450 = 17'b00000000000000001;
    assign _219 = host_lane1_div_int;
    assign _3449 = { gnd,
                     _219 };
    assign _3451 = _3449 - _3450;
    always @(posedge _320) begin
        if (_318)
            _3454 <= _1189;
        else
            _3454 <= _3451;
    end
    assign _221 = host_lane1_div_frac;
    assign _3469 = { gnd,
                     _221 };
    assign _3471 = _3470[7:0];
    assign _3472 = _3467 ? _3471 : _3443;
    assign _3473 = _3440 ? _3472 : _3443;
    assign _3475 = _1501 ? _1279 : _3473;
    assign _222 = _3475;
    always @(posedge _320) begin
        if (_318)
            _3443 <= _1279;
        else
            _3443 <= _222;
    end
    assign _3468 = { gnd,
                     _3443 };
    assign _3470 = _3468 + _3469;
    assign _3476 = _3470[8:8];
    assign _3477 = _3467 ? _3476 : _3448;
    assign _3478 = _3440 ? _3477 : _3448;
    assign _3480 = _1501 ? _1122 : _3478;
    assign _223 = _3480;
    always @(posedge _320) begin
        if (_318)
            _3448 <= _1122;
        else
            _3448 <= _223;
    end
    assign _3459 = _3448 ? _3458 : _3454;
    assign _3445 = { gnd,
                     _1537 };
    assign _3460 = _3445 == _3459;
    assign _3463 = _1565 ? _3462 : _3460;
    assign _3466 = _1533 ? _3465 : _3463;
    assign _3444 = ~ _230;
    assign _3467 = _3444 & _3466;
    assign _3489 = _3467 ? _1229 : _3487;
    assign _3439 = ~ _230;
    assign _3437 = _1528 & _1526;
    assign _682 = g_mode == _2097;
    assign _3436 = _1503 | _682;
    assign _3438 = _3436 | _3437;
    assign _3440 = _3438 & _3439;
    assign _3490 = _3440 ? _3489 : _1537;
    assign _3492 = _1501 ? _1229 : _3490;
    assign _224 = _3492;
    always @(posedge _320) begin
        if (_318)
            _1537 <= _1229;
        else
            _1537 <= _224;
    end
    assign _1544 = _1537 < _1543;
    assign _1545 = ~ _1544;
    assign _1534 = _1526 & _1530;
    assign _1546 = _1534 & _1545;
    assign _1563 = _1546 & _1562;
    assign _1565 = _1563 & _1564;
    assign _1574 = _1565 ? _1573 : _1566;
    assign _226 = host_lane1_code;
    assign _1530 = _226 == _1271;
    assign _1531 = ~ _1530;
    assign _1528 = g_mode == _1270;
    assign _1532 = _1528 | _1531;
    assign _1525 = ~ _230;
    assign _1521 = _381[7:7];
    assign _1520 = _381[6:6];
    assign _1519 = _381[5:5];
    assign _1518 = _381[4:4];
    assign _1517 = _381[3:3];
    assign _1516 = _381[2:2];
    assign _1515 = _381[1:1];
    assign _1514 = _381[0:0];
    always @* begin
        case (_228)
        0:
            _1522 <= _1514;
        1:
            _1522 <= _1515;
        2:
            _1522 <= _1516;
        3:
            _1522 <= _1517;
        4:
            _1522 <= _1518;
        5:
            _1522 <= _1519;
        6:
            _1522 <= _1520;
        default:
            _1522 <= _1521;
        endcase
    end
    assign _1512 = _365[7:7];
    assign _1511 = _365[6:6];
    assign _1510 = _365[5:5];
    assign _1509 = _365[4:4];
    assign _1508 = _365[3:3];
    assign _1507 = _365[2:2];
    assign _1506 = _365[1:1];
    assign _1505 = _365[0:0];
    assign _228 = host_lane1_data_pin;
    always @* begin
        case (_228)
        0:
            _1513 <= _1505;
        1:
            _1513 <= _1506;
        2:
            _1513 <= _1507;
        3:
            _1513 <= _1508;
        4:
            _1513 <= _1509;
        5:
            _1513 <= _1510;
        6:
            _1513 <= _1511;
        default:
            _1513 <= _1512;
        endcase
    end
    assign _1523 = _1513 ^ _1522;
    assign _1524 = _232 & _1523;
    assign _1526 = _1524 & _1525;
    assign _1533 = _1526 & _1532;
    assign _1577 = _1533 ? _1576 : _1574;
    assign _230 = host_lane1_clk_pin_en;
    assign _1601 = _230 ? _1600 : _1577;
    assign _232 = host_lane1_dir;
    assign _1504 = _1503 & _232;
    assign _1602 = _1504 & _1601;
    assign _3552 = _1602 ? _3551 : _3500;
    assign _1788 = _292 == _1997;
    assign _3554 = _1788 ? _2571 : _3552;
    assign _3254 = _292 == _2496;
    assign _3561 = _3254 ? _3560 : _3554;
    assign _1501 = _292 == _1998;
    assign _3567 = _1501 ? _3566 : _3561;
    assign _1498 = _292 == _1327;
    assign _1499 = _1498 | _327;
    assign _3569 = _1499 ? _2571 : _3567;
    assign _233 = _3569;
    always @(posedge _320) begin
        if (_318)
            g_mode <= _2571;
        else
            g_mode <= _233;
    end
    assign _1503 = g_mode == _1271;
    assign _1791 = _1503 & _1790;
    assign _1799 = _1791 & _1798;
    assign _1953 = _1799 & _1952;
    assign _1955 = _1953 & _1954;
    assign _1946 = ~ _654;
    assign _1945 = _1701 & _1944;
    assign _1947 = _1945 & _1946;
    assign _1956 = _1947 | _1955;
    assign _1937 = _1933 == _1271;
    assign _1935 = _1933 == _1270;
    assign _1938 = _1935 | _1937;
    assign _3570 = _1861 & _1938;
    assign _3571 = _3570 | _1956;
    assign _234 = _3571;
    assign _3573 = _234 & _3572;
    assign _3576 = _3573 ? _3575 : _3043;
    assign _235 = _3576;
    always @(posedge _320) begin
        if (_318)
            _3043 <= _1130;
        else
            _3043 <= _235;
    end
    always @* begin
        case (_3043)
        0:
            _3101 <= _3058;
        1:
            _3101 <= _3064;
        2:
            _3101 <= _3070;
        3:
            _3101 <= _3076;
        4:
            _3101 <= _3082;
        5:
            _3101 <= _3088;
        6:
            _3101 <= _3094;
        default:
            _3101 <= _3100;
        endcase
    end
    assign _3103 = _654 ? _1277 : _3101;
    assign _3194 = g_byte_0[7:1];
    assign _3195 = { _1480,
                     _3194 };
    assign _3192 = g_byte_0[6:0];
    assign _3193 = { _3192,
                     _1480 };
    assign _3196 = _238 ? _3195 : _3193;
    assign _3581 = _1682 ? _3196 : _3580;
    assign _3582 = _1673 ? _3581 : _3580;
    assign _3583 = _1658 ? _3582 : _3580;
    assign _3584 = _1489 ? _3580 : _3583;
    assign _3577 = g_data_left_0 ? _3104 : g_byte_0;
    assign _3578 = _1474 ? g_byte_0 : _3577;
    assign _3579 = _1709 ? _3578 : g_byte_0;
    assign _3580 = _1701 ? _3579 : g_byte_0;
    assign _3585 = _1444 ? _3584 : _3580;
    assign _236 = _3585;
    always @(posedge _320) begin
        if (_318)
            g_byte_0 <= _1279;
        else
            g_byte_0 <= _236;
    end
    assign _1943 = g_bitpos_0 == _1130;
    assign _1940 = ~ _1474;
    assign _1941 = _1940 & g_data_left_0;
    assign _1944 = _1941 & _1943;
    assign _3104 = _1944 ? _3103 : g_byte_0;
    assign _3105 = _3104[0:0];
    assign _3113 = { _3105,
                     _3106,
                     _3107,
                     _3108,
                     _3109,
                     _3110,
                     _3111,
                     _3112 };
    assign _238 = host_lane0_lsb_first;
    assign _3114 = _238 ? _3104 : _3113;
    assign _3115 = _3114[0:0];
    assign _3593 = g_bitpos_0 + _1490;
    assign _3594 = _1682 ? _3593 : _3591;
    assign _3595 = _1673 ? _3594 : _3591;
    assign _3596 = _1658 ? _3595 : _3591;
    assign _3597 = _1489 ? _3591 : _3596;
    assign _3587 = g_bitpos_0 + _1490;
    assign _3588 = g_data_left_0 ? _3587 : g_bitpos_0;
    assign _3589 = _1474 ? g_bitpos_0 : _3588;
    assign _3590 = _1709 ? _3589 : g_bitpos_0;
    assign _3591 = _1701 ? _3590 : g_bitpos_0;
    assign _3598 = _1444 ? _3597 : _3591;
    assign _3600 = _1343 ? _1130 : _3598;
    assign _239 = _3600;
    always @(posedge _320) begin
        if (_318)
            g_bitpos_0 <= _1130;
        else
            g_bitpos_0 <= _239;
    end
    always @* begin
        case (g_bitpos_0)
        0:
            _3123 <= _3115;
        1:
            _3123 <= _3116;
        2:
            _3123 <= _3117;
        3:
            _3123 <= _3118;
        4:
            _3123 <= _3119;
        5:
            _3123 <= _3120;
        6:
            _3123 <= _3121;
        default:
            _3123 <= _3122;
        endcase
    end
    assign _241 = host_lane0_crc_inv;
    assign _243 = host_lane0_init;
    assign _3642 = g_crc_0[30:0];
    assign _3644 = { _3642,
                     _1122 };
    assign _3636 = g_crc_0[31:31];
    assign _3637 = _1480 ^ _3636;
    assign _3639 = _3637 ? _248 : _2128;
    assign _3633 = g_crc_0[30:0];
    assign _3635 = { _3633,
                     _1122 };
    assign _3640 = _3635 ^ _3639;
    assign _3641 = _1673 ? _3640 : _3632;
    assign _245 = host_lane0_crc_width;
    assign _3610 = g_left_0 - _2936;
    assign _3611 = _2981 ? _3610 : _3608;
    assign _3612 = _1658 ? _3611 : _3608;
    assign _3613 = _1489 ? _3608 : _3612;
    assign _3604 = g_left_0 - _2936;
    assign _3605 = g_data_left_0 ? g_left_0 : _3604;
    assign _3606 = _1474 ? g_left_0 : _3605;
    assign _3607 = _1709 ? _3606 : g_left_0;
    assign _3608 = _1701 ? _3607 : g_left_0;
    assign _3614 = _1444 ? _3613 : _3608;
    assign _3615 = _3602 ? _245 : _3614;
    assign _3617 = _1343 ? _1253 : _3615;
    assign _246 = _3617;
    always @(posedge _320) begin
        if (_318)
            g_left_0 <= _1253;
        else
            g_left_0 <= _246;
    end
    assign _1707 = g_left_0 == _1253;
    assign _1708 = ~ _1707;
    assign _2979 = ~ g_data_left_0;
    assign _2978 = _1444 & _1658;
    assign _2980 = _2978 & _2979;
    assign _2981 = _2980 & _1708;
    assign _3645 = _2981 ? _3644 : _3641;
    assign _3646 = _1658 ? _3645 : _3632;
    assign _3647 = _1489 ? _3632 : _3646;
    assign _248 = host_lane0_poly;
    assign _3624 = g_crc_0[31:31];
    assign _3625 = _3125 ^ _3624;
    assign _3627 = _3625 ? _248 : _2128;
    assign _3621 = g_crc_0[30:0];
    assign _3623 = { _3621,
                     _1122 };
    assign _3628 = _3623 ^ _3627;
    assign _3618 = g_crc_0[30:0];
    assign _3620 = { _3618,
                     _1122 };
    assign _3629 = g_data_left_0 ? _3628 : _3620;
    assign _3630 = _1474 ? g_crc_0 : _3629;
    assign _3631 = _1709 ? _3630 : g_crc_0;
    assign _3632 = _1701 ? _3631 : g_crc_0;
    assign _3648 = _1444 ? _3647 : _3632;
    assign _3649 = _1343 ? _243 : _3648;
    assign _3651 = _1341 ? _2128 : _3649;
    assign _249 = _3651;
    always @(posedge _320) begin
        if (_318)
            g_crc_0 <= _2128;
        else
            g_crc_0 <= _249;
    end
    assign _2985 = g_crc_0[31:31];
    assign _2986 = _2985 ^ _241;
    assign _3667 = _3666 ? _3664 : g_lim_0;
    assign _3668 = g_len_cap_0 ? _3667 : g_lim_0;
    assign _250 = _3668;
    always @(posedge _320) begin
        if (_318)
            g_lim_0 <= _1279;
        else
            g_lim_0 <= _250;
    end
    assign _1670 = { _1279,
                     g_lim_0 };
    assign _252 = host_lane0_frame_bits;
    assign _2960 = g_sr_0[14:0];
    assign _2961 = { _2960,
                     _1480 };
    assign _3669 = _1658 ? _2961 : g_sr_0;
    assign _3670 = _1489 ? g_sr_0 : _3669;
    assign _3671 = _1444 ? _3670 : g_sr_0;
    assign _3673 = _1343 ? _1229 : _3671;
    assign _253 = _3673;
    always @(posedge _320) begin
        if (_318)
            g_sr_0 <= _1229;
        else
            g_sr_0 <= _253;
    end
    assign _3659 = g_sr_0[3:0];
    assign _255 = host_lane0_len_max;
    assign _3660 = _255 < _3659;
    assign _3661 = _3660 ? _255 : _3659;
    assign _3663 = { _1122,
                     _3661,
                     _1130 };
    assign _257 = host_lane0_skip;
    assign _3657 = { _2571,
                     _257 };
    assign _3664 = _3657 + _3663;
    assign _3665 = { _1279,
                     _3664 };
    assign _3666 = _3665 < _252;
    assign _3692 = _3666 ? _1961 : g_len_known_0;
    assign _259 = host_lane0_len_pos;
    assign _3678 = g_cnt_0[5:0];
    assign _3679 = _3678 == _259;
    assign _3674 = g_cnt_0[15:6];
    assign _3676 = _3674 == _1134;
    assign _261 = host_lane0_len_en;
    assign _3677 = _261 & _3676;
    assign _3680 = _3677 & _3679;
    assign _3682 = _3680 ? _1961 : g_len_cap_0;
    assign _3683 = _1673 ? _3682 : g_len_cap_0;
    assign _3684 = _1658 ? _3683 : g_len_cap_0;
    assign _3685 = _1489 ? g_len_cap_0 : _3684;
    assign _3686 = _1444 ? _3685 : g_len_cap_0;
    assign _3688 = g_len_cap_0 ? _1122 : _3686;
    assign _3690 = _1343 ? _1122 : _3688;
    assign _262 = _3690;
    always @(posedge _320) begin
        if (_318)
            g_len_cap_0 <= _1122;
        else
            g_len_cap_0 <= _262;
    end
    assign _3693 = g_len_cap_0 ? _3692 : g_len_known_0;
    assign _3695 = _1343 ? _1122 : _3693;
    assign _263 = _3695;
    always @(posedge _320) begin
        if (_318)
            g_len_known_0 <= _1122;
        else
            g_len_known_0 <= _263;
    end
    assign _1671 = g_len_known_0 ? _1670 : _252;
    assign _3715 = g_cnt_0 + _4190;
    assign _3716 = _1673 ? _3715 : _3713;
    assign _1658 = ~ _1474;
    assign _3717 = _1658 ? _3716 : _3713;
    assign _3698 = _1489 ? _3697 : _1480;
    assign _3696 = _1709 ? _3125 : g_last_0;
    assign _3697 = _1701 ? _3696 : g_last_0;
    assign _3699 = _1444 ? _3698 : _3697;
    assign _3701 = _1343 ? _1961 : _3699;
    assign _264 = _3701;
    always @(posedge _320) begin
        if (_318)
            g_last_0 <= vdd;
        else
            g_last_0 <= _264;
    end
    assign _1485 = ~ g_last_0;
    assign _1482 = _269 == _1270;
    assign _1486 = _1482 ? _1485 : gnd;
    assign _3703 = _285 == _1270;
    assign _3704 = _3703 ? _1355 : g_prev_0;
    assign _3705 = _1444 ? _3704 : g_prev_0;
    assign _3707 = _1343 ? _1961 : _3705;
    assign _265 = _3707;
    always @(posedge _320) begin
        if (_318)
            g_prev_0 <= vdd;
        else
            g_prev_0 <= _265;
    end
    assign _1479 = _1355 == g_prev_0;
    assign _1476 = _285 == _1270;
    assign _1480 = _1476 ? _1479 : _1355;
    assign _1487 = _1480 == _1486;
    assign _1488 = ~ _1487;
    assign _1489 = _1474 & _1488;
    assign _3718 = _1489 ? _3713 : _3717;
    assign _3709 = g_cnt_0 + _4190;
    assign _3710 = g_data_left_0 ? _3709 : g_cnt_0;
    assign _3711 = _1474 ? g_cnt_0 : _3710;
    assign _3712 = _1709 ? _3711 : g_cnt_0;
    assign _3713 = _1701 ? _3712 : g_cnt_0;
    assign _3719 = _1444 ? _3718 : _3713;
    assign _3721 = _1343 ? _1229 : _3719;
    assign _266 = _3721;
    always @(posedge _320) begin
        if (_318)
            g_cnt_0 <= _1229;
        else
            g_cnt_0 <= _266;
    end
    assign g_data_left_0 = g_cnt_0 < _1671;
    assign _3124 = g_data_left_0 ? _3123 : _2986;
    assign _3125 = _1474 ? _1486 : _3124;
    assign _3727 = _3125 == g_last_0;
    assign _3725 = g_run_0 == _1130;
    assign _3726 = ~ _3725;
    assign _3728 = _3726 & _3727;
    assign _3732 = _3728 ? _3731 : _1490;
    assign _3723 = _269 == _1271;
    assign _3737 = _3723 ? _3736 : _3732;
    assign _3738 = _1709 ? _3737 : g_run_0;
    assign _3739 = _1701 ? _3738 : g_run_0;
    assign _3757 = _1444 ? _3756 : _3739;
    assign _3759 = _1343 ? _1130 : _3757;
    assign _267 = _3759;
    always @(posedge _320) begin
        if (_318)
            g_run_0 <= _1130;
        else
            g_run_0 <= _267;
    end
    assign _1473 = g_run_0 == _163;
    assign _269 = host_lane0_stuff;
    assign _1468 = _269 == _2571;
    assign _1469 = ~ _1468;
    assign _1474 = _1469 & _1473;
    assign _1702 = _1474 | g_data_left_0;
    assign _1709 = _1702 | _1708;
    assign _3773 = _1709 ? _3772 : _1961;
    assign _1692 = ~ _291;
    assign _1693 = _1345 & _1692;
    assign _1701 = _1693 & _1700;
    assign _3774 = _1701 ? _3773 : f_lane0_out;
    assign _1697 = _1414 == _1229;
    assign _1695 = _1379 == _1229;
    assign _1698 = _1407 ? _1697 : _1695;
    assign _1699 = _1375 ? vdd : _1698;
    assign _1700 = _287 ? _1442 : _1699;
    assign _3766 = ~ _1700;
    assign _3763 = _285 == _1271;
    assign _3760 = ~ _291;
    assign _3761 = _1345 & _3760;
    assign _3764 = _3761 & _3763;
    assign _3765 = _3764 & _1443;
    assign _3767 = _3765 & _3766;
    assign _3775 = _3767 ? _3037 : _3774;
    assign _3777 = _1459 ? _1961 : _3775;
    assign _3779 = _1690 ? _1961 : _3777;
    assign _3781 = _1343 ? _1961 : _3779;
    assign _3783 = _1341 ? _1961 : _3781;
    assign _270 = _3783;
    always @(posedge _320) begin
        if (_318)
            f_lane0_out <= vdd;
        else
            f_lane0_out <= _270;
    end
    assign _1457 = _1355 == f_lane0_out;
    assign _1458 = ~ _1457;
    assign _1440 = ~ _1428;
    assign _1441 = _1437 & _1440;
    assign _1436 = _381[7:7];
    assign _1435 = _381[6:6];
    assign _1434 = _381[5:5];
    assign _1433 = _381[4:4];
    assign _1432 = _381[3:3];
    assign _1431 = _381[2:2];
    assign _1430 = _381[1:1];
    assign _1429 = _381[0:0];
    always @* begin
        case (_272)
        0:
            _1437 <= _1429;
        1:
            _1437 <= _1430;
        2:
            _1437 <= _1431;
        3:
            _1437 <= _1432;
        4:
            _1437 <= _1433;
        5:
            _1437 <= _1434;
        6:
            _1437 <= _1435;
        default:
            _1437 <= _1436;
        endcase
    end
    assign _1438 = ~ _1437;
    assign _1427 = _365[7:7];
    assign _1426 = _365[6:6];
    assign _1425 = _365[5:5];
    assign _1424 = _365[4:4];
    assign _1423 = _365[3:3];
    assign _1422 = _365[2:2];
    assign _1421 = _365[1:1];
    assign _1420 = _365[0:0];
    assign _272 = host_lane0_clk_pin;
    always @* begin
        case (_272)
        0:
            _1428 <= _1420;
        1:
            _1428 <= _1421;
        2:
            _1428 <= _1422;
        3:
            _1428 <= _1423;
        4:
            _1428 <= _1424;
        5:
            _1428 <= _1425;
        6:
            _1428 <= _1426;
        default:
            _1428 <= _1427;
        endcase
    end
    assign _1439 = _1428 & _1438;
    assign _274 = host_lane0_clk_edge;
    assign _1442 = _274 ? _1441 : _1439;
    assign _1418 = _1403 == _1229;
    assign _1415 = _1414 == _1403;
    assign _1408 = _1379 == _1403;
    assign _1406 = ~ _1370;
    assign _1397 = _276[15:2];
    assign _1398 = { _2571,
                     _1397 };
    assign _1394 = _276[15:1];
    assign _1395 = { _1122,
                     _1394 };
    assign _1399 = _1395 + _1398;
    assign _1391 = _276[15:1];
    assign _1392 = { _1122,
                     _1391 };
    assign _1389 = _291 & _1372;
    assign _1400 = _1389 ? _1399 : _1392;
    always @(posedge _320) begin
        if (_318)
            _1403 <= _1229;
        else
            _1403 <= _1400;
    end
    assign _1404 = _1379 < _1403;
    assign _1381 = _276[15:2];
    assign _1382 = { _2571,
                     _1381 };
    always @(posedge _320) begin
        if (_318)
            _1385 <= _1229;
        else
            _1385 <= _1382;
    end
    assign _3829 = ~ _1370;
    assign _3830 = _1405 & _3829;
    assign _3831 = _3830 ? _1414 : _1379;
    assign _3833 = _1375 ? _1229 : _3831;
    assign _3835 = _3833 + _4190;
    assign _3813 = _3807 == _1189;
    assign _1410 = _276[15:1];
    assign _1411 = { _1122,
                     _1410 };
    always @(posedge _320) begin
        if (_318)
            _1414 <= _1229;
        else
            _1414 <= _1411;
    end
    assign _3809 = { gnd,
                     _1414 };
    assign _3810 = _3809 == _3807;
    assign _3803 = { gnd,
                     _276 };
    always @(posedge _320) begin
        if (_318)
            _3806 <= _1189;
        else
            _3806 <= _3803;
    end
    assign _276 = host_lane0_div_int;
    assign _3797 = { gnd,
                     _276 };
    assign _3799 = _3797 - _3450;
    always @(posedge _320) begin
        if (_318)
            _3802 <= _1189;
        else
            _3802 <= _3799;
    end
    assign _278 = host_lane0_div_frac;
    assign _3817 = { gnd,
                     _278 };
    assign _3819 = _3818[7:0];
    assign _3820 = _3815 ? _3819 : _3791;
    assign _3821 = _3788 ? _3820 : _3791;
    assign _3823 = _1343 ? _1279 : _3821;
    assign _279 = _3823;
    always @(posedge _320) begin
        if (_318)
            _3791 <= _1279;
        else
            _3791 <= _279;
    end
    assign _3816 = { gnd,
                     _3791 };
    assign _3818 = _3816 + _3817;
    assign _3824 = _3818[8:8];
    assign _3825 = _3815 ? _3824 : _3796;
    assign _3826 = _3788 ? _3825 : _3796;
    assign _3828 = _1343 ? _1122 : _3826;
    assign _280 = _3828;
    always @(posedge _320) begin
        if (_318)
            _3796 <= _1122;
        else
            _3796 <= _280;
    end
    assign _3807 = _3796 ? _3806 : _3802;
    assign _3793 = { gnd,
                     _1379 };
    assign _3808 = _3793 == _3807;
    assign _3811 = _1407 ? _3810 : _3808;
    assign _3814 = _1375 ? _3813 : _3811;
    assign _3792 = ~ _287;
    assign _3815 = _3792 & _3814;
    assign _3837 = _3815 ? _1229 : _3835;
    assign _3787 = ~ _287;
    assign _3785 = _1370 & _1368;
    assign _668 = g_mode_0 == _2097;
    assign _3784 = _1345 | _668;
    assign _3786 = _3784 | _3785;
    assign _3788 = _3786 & _3787;
    assign _3838 = _3788 ? _3837 : _1379;
    assign _3840 = _1343 ? _1229 : _3838;
    assign _281 = _3840;
    always @(posedge _320) begin
        if (_318)
            _1379 <= _1229;
        else
            _1379 <= _281;
    end
    assign _1386 = _1379 < _1385;
    assign _1387 = ~ _1386;
    assign _1376 = _1368 & _1372;
    assign _1388 = _1376 & _1387;
    assign _1405 = _1388 & _1404;
    assign _1407 = _1405 & _1406;
    assign _1416 = _1407 ? _1415 : _1408;
    assign _1372 = _285 == _1271;
    assign _1373 = ~ _1372;
    assign _1370 = g_mode_0 == _1270;
    assign _1374 = _1370 | _1373;
    assign _1367 = ~ _287;
    assign _1363 = _381[7:7];
    assign _1362 = _381[6:6];
    assign _1361 = _381[5:5];
    assign _1360 = _381[4:4];
    assign _1359 = _381[3:3];
    assign _1358 = _381[2:2];
    assign _1357 = _381[1:1];
    assign _1356 = _381[0:0];
    always @* begin
        case (_283)
        0:
            _1364 <= _1356;
        1:
            _1364 <= _1357;
        2:
            _1364 <= _1358;
        3:
            _1364 <= _1359;
        4:
            _1364 <= _1360;
        5:
            _1364 <= _1361;
        6:
            _1364 <= _1362;
        default:
            _1364 <= _1363;
        endcase
    end
    assign _1354 = _365[7:7];
    assign _1353 = _365[6:6];
    assign _1352 = _365[5:5];
    assign _1351 = _365[4:4];
    assign _1350 = _365[3:3];
    assign _1349 = _365[2:2];
    assign _1348 = _365[1:1];
    assign _1347 = _365[0:0];
    assign _283 = host_lane0_data_pin;
    always @* begin
        case (_283)
        0:
            _1355 <= _1347;
        1:
            _1355 <= _1348;
        2:
            _1355 <= _1349;
        3:
            _1355 <= _1350;
        4:
            _1355 <= _1351;
        5:
            _1355 <= _1352;
        6:
            _1355 <= _1353;
        default:
            _1355 <= _1354;
        endcase
    end
    assign _1365 = _1355 ^ _1364;
    assign _1366 = _291 & _1365;
    assign _1368 = _1366 & _1367;
    assign _1375 = _1368 & _1374;
    assign _1419 = _1375 ? _1418 : _1416;
    assign _1443 = _287 ? _1442 : _1419;
    assign _285 = host_lane0_code;
    assign _1451 = _285 == _1271;
    assign _1452 = ~ _1451;
    assign _287 = host_lane0_clk_pin_en;
    assign _1448 = ~ _287;
    assign _289 = host_lane0_readback;
    assign _291 = host_lane0_dir;
    assign _1445 = ~ _291;
    assign _1446 = _1345 & _1445;
    assign _1447 = _1446 & _289;
    assign _1449 = _1447 & _1448;
    assign _1453 = _1449 & _1452;
    assign _1454 = _1453 & _1443;
    assign _1459 = _1454 & _1458;
    assign _3852 = _1459 ? _2571 : _3850;
    assign _3904 = _1444 ? _3903 : _3852;
    assign _1690 = _292 == _1463;
    assign _3906 = _1690 ? _2571 : _3904;
    assign _3602 = _292 == _2001;
    assign _3913 = _3602 ? _3912 : _3906;
    assign _1343 = _292 == _1490;
    assign _3919 = _1343 ? _3918 : _3913;
    assign _2621 = _767[90:88];
    assign _2620 = _761[90:88];
    assign _2619 = _755[90:88];
    assign _2618 = _358[90:88];
    always @* begin
        case (f_winner)
        0:
            _2622 <= _2618;
        1:
            _2622 <= _2619;
        2:
            _2622 <= _2620;
        default:
            _2622 <= _2621;
        endcase
    end
    assign _2614 = _767[87:87];
    assign _2613 = _761[87:87];
    assign _2612 = _755[87:87];
    assign _2611 = _358[87:87];
    always @* begin
        case (f_winner)
        0:
            _2615 <= _2611;
        1:
            _2615 <= _2612;
        2:
            _2615 <= _2613;
        default:
            _2615 <= _2614;
        endcase
    end
    assign _3841 = ~ _2615;
    assign _3842 = _1246 & _3841;
    assign _3844 = _3842 ? _2622 : _1130;
    assign _292 = _3844;
    assign _1340 = _292 == _1327;
    assign _1341 = _1340 | _327;
    assign _3921 = _1341 ? _2571 : _3919;
    assign _293 = _3921;
    always @(posedge _320) begin
        if (_318)
            g_mode_0 <= _2571;
        else
            g_mode_0 <= _293;
    end
    assign _1345 = g_mode_0 == _1271;
    assign _1346 = _1345 & _291;
    assign _1444 = _1346 & _1443;
    assign _1659 = _1444 & _1658;
    assign _1673 = _1659 & g_data_left_0;
    assign _1682 = _1673 & _1681;
    assign _1688 = _1682 & _1687;
    assign _1724 = _1688 | _1723;
    assign _3021 = _1724 | _1826;
    assign _295 = host_rx_to_tx;
    assign _3022 = _295 & _3021;
    assign _296 = _3022;
    assign _3049 = _296 | _3048;
    assign _3051 = _3049 & _3050;
    assign _3922 = _3051 ^ _3573;
    assign _3928 = _3922 ? _3927 : _297;
    always @(posedge _320) begin
        if (_318)
            _3931 <= _2120;
        else
            _3931 <= _3928;
    end
    assign _297 = _3931;
    assign _654 = _297 == _2120;
    assign _3933 = _654 ? _1277 : _3101;
    assign _1932 = _750[28:27];
    assign _1930 = _767[95:94];
    assign _1929 = _761[95:94];
    assign _1928 = _755[95:94];
    assign _1927 = _358[95:94];
    always @* begin
        case (f_winner)
        0:
            _1931 <= _1927;
        1:
            _1931 <= _1928;
        2:
            _1931 <= _1929;
        default:
            _1931 <= _1930;
        endcase
    end
    assign _1933 = _1860 ? _1932 : _1931;
    always @* begin
        case (_1933)
        0:
            _3945 <= _647;
        1:
            _3945 <= _3933;
        2:
            _3945 <= _3942;
        default:
            _3945 <= _3944;
        endcase
    end
    assign _3946 = _1861 ? _3945 : _647;
    assign _298 = _3946;
    always @(posedge _320) begin
        if (_318)
            _647 <= _1279;
        else
            _647 <= _298;
    end
    assign _648 = _647[0:0];
    assign _3957 = 8'b00001000;
    assign _3956 = 8'b00000111;
    assign _3955 = _642 - _1748;
    assign _3952 = _750[30:29];
    assign _767 = _357[511:400];
    assign _3950 = _767[99:98];
    assign _761 = _357[399:288];
    assign _3949 = _761[99:98];
    assign _3948 = _755[99:98];
    assign _3947 = _358[99:98];
    always @* begin
        case (f_winner)
        0:
            _3951 <= _3947;
        1:
            _3951 <= _3948;
        2:
            _3951 <= _3949;
        default:
            _3951 <= _3950;
        endcase
    end
    assign _3953 = _1860 ? _3952 : _3951;
    always @* begin
        case (_3953)
        0:
            _3958 <= _642;
        1:
            _3958 <= _3955;
        2:
            _3958 <= _3956;
        default:
            _3958 <= _3957;
        endcase
    end
    assign _3959 = _1861 ? _3958 : _642;
    assign _299 = _3959;
    always @(posedge _320) begin
        if (_318)
            _642 <= _1279;
        else
            _642 <= _299;
    end
    assign _644 = _642 == _1279;
    assign _872 = _755[61:58];
    always @* begin
        case (_872)
        0:
            _873 <= vdd;
        1:
            _873 <= _644;
        2:
            _873 <= _648;
        3:
            _873 <= _652;
        4:
            _873 <= _654;
        5:
            _873 <= _656;
        6:
            _873 <= _660;
        7:
            _873 <= _663;
        8:
            _873 <= _668;
        9:
            _873 <= _671;
        10:
            _873 <= _674;
        11:
            _873 <= _677;
        12:
            _873 <= _682;
        13:
            _873 <= _685;
        14:
            _873 <= _688;
        default:
            _873 <= _691;
        endcase
    end
    assign _875 = _873 ^ _874;
    assign _867 = _755[57:42];
    assign _869 = _867 == _1119;
    assign _858 = _804[57:42];
    assign _859 = { gnd,
                    _858 };
    assign _860 = _859 + _847;
    always @(posedge _320) begin
        if (_318)
            _863 <= _1189;
        else
            _863 <= _860;
    end
    assign _864 = _863 < _803;
    assign _865 = ~ _864;
    assign _854 = _755[41:26];
    assign _856 = _854 == _1229;
    assign _602 = _598 + _1490;
    assign _3974 = _598 + _1490;
    assign _3970 = _598 == _2496;
    assign _3971 = ~ _3970;
    assign _3968 = _378[0:0];
    assign _3972 = _3968 & _3971;
    assign _3975 = _3972 ? _3974 : _598;
    assign _3965 = _378[0:0];
    assign _3966 = ~ _3965;
    assign _3964 = f_chg_now[0:0];
    assign _3967 = _3964 & _3966;
    assign _3977 = _3967 ? _1490 : _3975;
    assign _3961 = _342 == _1271;
    assign _3963 = _3961 ? _1130 : _598;
    assign _3960 = _342 == _1270;
    assign _3978 = _3960 ? _3977 : _3963;
    assign _300 = _3978;
    always @(posedge _320) begin
        if (_318)
            _598 <= _1130;
        else
            _598 <= _300;
    end
    assign _600 = _598 == _2496;
    assign _603 = _600 ? _598 : _602;
    assign _593 = _378[0:0];
    assign _594 = ~ _593;
    assign _592 = f_chg_now[0:0];
    assign _595 = _592 & _594;
    assign _605 = _595 ? _1490 : _603;
    assign _589 = f_changed_all[0:0];
    assign _590 = f_in_fetch & _589;
    assign _606 = _590 ? _605 : _1130;
    assign _838 = _808[0:0];
    assign _840 = _838 ? _606 : _1130;
    assign _581 = _577 + _1490;
    assign _3993 = _577 + _1490;
    assign _3989 = _577 == _2496;
    assign _3990 = ~ _3989;
    assign _3987 = _378[1:1];
    assign _3991 = _3987 & _3990;
    assign _3994 = _3991 ? _3993 : _577;
    assign _3984 = _378[1:1];
    assign _3985 = ~ _3984;
    assign _3983 = f_chg_now[1:1];
    assign _3986 = _3983 & _3985;
    assign _3996 = _3986 ? _1490 : _3994;
    assign _3980 = _342 == _1271;
    assign _3982 = _3980 ? _1130 : _577;
    assign _3979 = _342 == _1270;
    assign _3997 = _3979 ? _3996 : _3982;
    assign _301 = _3997;
    always @(posedge _320) begin
        if (_318)
            _577 <= _1130;
        else
            _577 <= _301;
    end
    assign _579 = _577 == _2496;
    assign _582 = _579 ? _577 : _581;
    assign _572 = _378[1:1];
    assign _573 = ~ _572;
    assign _571 = f_chg_now[1:1];
    assign _574 = _571 & _573;
    assign _584 = _574 ? _1490 : _582;
    assign _568 = f_changed_all[1:1];
    assign _569 = f_in_fetch & _568;
    assign _585 = _569 ? _584 : _1130;
    assign _835 = _808[1:1];
    assign _837 = _835 ? _585 : _1130;
    assign _841 = _837 < _840;
    assign _842 = _841 ? _840 : _837;
    assign _558 = _554 + _1490;
    assign _4012 = _554 + _1490;
    assign _4008 = _554 == _2496;
    assign _4009 = ~ _4008;
    assign _4006 = _378[2:2];
    assign _4010 = _4006 & _4009;
    assign _4013 = _4010 ? _4012 : _554;
    assign _4003 = _378[2:2];
    assign _4004 = ~ _4003;
    assign _4002 = f_chg_now[2:2];
    assign _4005 = _4002 & _4004;
    assign _4015 = _4005 ? _1490 : _4013;
    assign _3999 = _342 == _1271;
    assign _4001 = _3999 ? _1130 : _554;
    assign _3998 = _342 == _1270;
    assign _4016 = _3998 ? _4015 : _4001;
    assign _302 = _4016;
    always @(posedge _320) begin
        if (_318)
            _554 <= _1130;
        else
            _554 <= _302;
    end
    assign _556 = _554 == _2496;
    assign _559 = _556 ? _554 : _558;
    assign _549 = _378[2:2];
    assign _550 = ~ _549;
    assign _548 = f_chg_now[2:2];
    assign _551 = _548 & _550;
    assign _561 = _551 ? _1490 : _559;
    assign _545 = f_changed_all[2:2];
    assign _546 = f_in_fetch & _545;
    assign _562 = _546 ? _561 : _1130;
    assign _830 = _808[2:2];
    assign _832 = _830 ? _562 : _1130;
    assign _537 = _533 + _1490;
    assign _4031 = _533 + _1490;
    assign _4027 = _533 == _2496;
    assign _4028 = ~ _4027;
    assign _4025 = _378[3:3];
    assign _4029 = _4025 & _4028;
    assign _4032 = _4029 ? _4031 : _533;
    assign _4022 = _378[3:3];
    assign _4023 = ~ _4022;
    assign _4021 = f_chg_now[3:3];
    assign _4024 = _4021 & _4023;
    assign _4034 = _4024 ? _1490 : _4032;
    assign _4018 = _342 == _1271;
    assign _4020 = _4018 ? _1130 : _533;
    assign _4017 = _342 == _1270;
    assign _4035 = _4017 ? _4034 : _4020;
    assign _303 = _4035;
    always @(posedge _320) begin
        if (_318)
            _533 <= _1130;
        else
            _533 <= _303;
    end
    assign _535 = _533 == _2496;
    assign _538 = _535 ? _533 : _537;
    assign _528 = _378[3:3];
    assign _529 = ~ _528;
    assign _527 = f_chg_now[3:3];
    assign _530 = _527 & _529;
    assign _540 = _530 ? _1490 : _538;
    assign _524 = f_changed_all[3:3];
    assign _525 = f_in_fetch & _524;
    assign _541 = _525 ? _540 : _1130;
    assign _827 = _808[3:3];
    assign _829 = _827 ? _541 : _1130;
    assign _833 = _829 < _832;
    assign _834 = _833 ? _832 : _829;
    assign _843 = _834 < _842;
    assign _844 = _843 ? _842 : _834;
    assign _512 = _508 + _1490;
    assign _4050 = _508 + _1490;
    assign _4046 = _508 == _2496;
    assign _4047 = ~ _4046;
    assign _4044 = _378[4:4];
    assign _4048 = _4044 & _4047;
    assign _4051 = _4048 ? _4050 : _508;
    assign _4041 = _378[4:4];
    assign _4042 = ~ _4041;
    assign _4040 = f_chg_now[4:4];
    assign _4043 = _4040 & _4042;
    assign _4053 = _4043 ? _1490 : _4051;
    assign _4037 = _342 == _1271;
    assign _4039 = _4037 ? _1130 : _508;
    assign _4036 = _342 == _1270;
    assign _4054 = _4036 ? _4053 : _4039;
    assign _304 = _4054;
    always @(posedge _320) begin
        if (_318)
            _508 <= _1130;
        else
            _508 <= _304;
    end
    assign _510 = _508 == _2496;
    assign _513 = _510 ? _508 : _512;
    assign _503 = _378[4:4];
    assign _504 = ~ _503;
    assign _502 = f_chg_now[4:4];
    assign _505 = _502 & _504;
    assign _515 = _505 ? _1490 : _513;
    assign _499 = f_changed_all[4:4];
    assign _500 = f_in_fetch & _499;
    assign _516 = _500 ? _515 : _1130;
    assign _820 = _808[4:4];
    assign _822 = _820 ? _516 : _1130;
    assign _491 = _487 + _1490;
    assign _4069 = _487 + _1490;
    assign _4065 = _487 == _2496;
    assign _4066 = ~ _4065;
    assign _4063 = _378[5:5];
    assign _4067 = _4063 & _4066;
    assign _4070 = _4067 ? _4069 : _487;
    assign _4060 = _378[5:5];
    assign _4061 = ~ _4060;
    assign _4059 = f_chg_now[5:5];
    assign _4062 = _4059 & _4061;
    assign _4072 = _4062 ? _1490 : _4070;
    assign _4056 = _342 == _1271;
    assign _4058 = _4056 ? _1130 : _487;
    assign _4055 = _342 == _1270;
    assign _4073 = _4055 ? _4072 : _4058;
    assign _305 = _4073;
    always @(posedge _320) begin
        if (_318)
            _487 <= _1130;
        else
            _487 <= _305;
    end
    assign _489 = _487 == _2496;
    assign _492 = _489 ? _487 : _491;
    assign _482 = _378[5:5];
    assign _483 = ~ _482;
    assign _481 = f_chg_now[5:5];
    assign _484 = _481 & _483;
    assign _494 = _484 ? _1490 : _492;
    assign _478 = f_changed_all[5:5];
    assign _479 = f_in_fetch & _478;
    assign _495 = _479 ? _494 : _1130;
    assign _817 = _808[5:5];
    assign _819 = _817 ? _495 : _1130;
    assign _823 = _819 < _822;
    assign _824 = _823 ? _822 : _819;
    assign _468 = _464 + _1490;
    assign _4088 = _464 + _1490;
    assign _4084 = _464 == _2496;
    assign _4085 = ~ _4084;
    assign _4082 = _378[6:6];
    assign _4086 = _4082 & _4085;
    assign _4089 = _4086 ? _4088 : _464;
    assign _4079 = _378[6:6];
    assign _4080 = ~ _4079;
    assign _4078 = f_chg_now[6:6];
    assign _4081 = _4078 & _4080;
    assign _4091 = _4081 ? _1490 : _4089;
    assign _4075 = _342 == _1271;
    assign _4077 = _4075 ? _1130 : _464;
    assign _4074 = _342 == _1270;
    assign _4092 = _4074 ? _4091 : _4077;
    assign _306 = _4092;
    always @(posedge _320) begin
        if (_318)
            _464 <= _1130;
        else
            _464 <= _306;
    end
    assign _466 = _464 == _2496;
    assign _469 = _466 ? _464 : _468;
    assign _459 = _378[6:6];
    assign _460 = ~ _459;
    assign _458 = f_chg_now[6:6];
    assign _461 = _458 & _460;
    assign _471 = _461 ? _1490 : _469;
    assign _455 = f_changed_all[6:6];
    assign _456 = f_in_fetch & _455;
    assign _472 = _456 ? _471 : _1130;
    assign _812 = _808[6:6];
    assign _814 = _812 ? _472 : _1130;
    assign _447 = _443 + _1490;
    assign _4107 = _443 + _1490;
    assign _4103 = _443 == _2496;
    assign _4104 = ~ _4103;
    assign _4101 = _378[7:7];
    assign _4105 = _4101 & _4104;
    assign _4108 = _4105 ? _4107 : _443;
    assign _4098 = _378[7:7];
    assign _4099 = ~ _4098;
    assign _4097 = f_chg_now[7:7];
    assign _4100 = _4097 & _4099;
    assign _4110 = _4100 ? _1490 : _4108;
    assign _4094 = _342 == _1271;
    assign _4096 = _4094 ? _1130 : _443;
    assign _4093 = _342 == _1270;
    assign _4111 = _4093 ? _4110 : _4096;
    assign _307 = _4111;
    always @(posedge _320) begin
        if (_318)
            _443 <= _1130;
        else
            _443 <= _307;
    end
    assign _445 = _443 == _2496;
    assign _448 = _445 ? _443 : _447;
    assign _438 = _378[7:7];
    assign _439 = ~ _438;
    assign _437 = f_chg_now[7:7];
    assign _440 = _437 & _439;
    assign _450 = _440 ? _1490 : _448;
    assign _434 = f_changed_all[7:7];
    assign _435 = f_in_fetch & _434;
    assign _451 = _435 ? _450 : _1130;
    assign _808 = _804[23:16];
    assign _809 = _808[7:7];
    assign _811 = _809 ? _451 : _1130;
    assign _815 = _811 < _814;
    assign _816 = _815 ? _814 : _811;
    assign _825 = _816 < _824;
    assign _826 = _825 ? _824 : _816;
    assign _845 = _826 < _844;
    assign _846 = _845 ? _844 : _826;
    assign _847 = { _1173,
                    _846 };
    assign _4114 = _409 == _1490;
    assign _4115 = _4114 ? _312 : _356;
    assign _4112 = _342 == _1270;
    assign _4116 = _4112 ? _4115 : _356;
    assign _308 = _4116;
    always @(posedge _320) begin
        if (_318)
            _356 <= _346;
        else
            _356 <= _308;
    end
    assign _423 = _409 == _1490;
    assign _424 = f_in_fetch & _423;
    assign _425 = _424 ? _312 : _356;
    assign _4119 = _409 == _1463;
    assign _4120 = _4119 ? _312 : _353;
    assign _4117 = _342 == _1270;
    assign _4121 = _4117 ? _4120 : _353;
    assign _309 = _4121;
    always @(posedge _320) begin
        if (_318)
            _353 <= _346;
        else
            _353 <= _309;
    end
    assign _419 = _409 == _1463;
    assign _420 = f_in_fetch & _419;
    assign _421 = _420 ? _312 : _353;
    assign _4124 = _409 == _2001;
    assign _4125 = _4124 ? _312 : _350;
    assign _4122 = _342 == _1270;
    assign _4126 = _4122 ? _4125 : _350;
    assign _310 = _4126;
    always @(posedge _320) begin
        if (_318)
            _350 <= _346;
        else
            _350 <= _310;
    end
    assign _415 = _409 == _2001;
    assign _416 = f_in_fetch & _415;
    assign _417 = _416 ? _312 : _350;
    assign _312 = ram_rec_rdata;
    assign _411 = _409 == _1327;
    assign _412 = f_in_fetch & _411;
    assign _413 = _412 ? _312 : _347;
    assign _426 = { _413,
                    _417,
                    _421,
                    _425 };
    assign _804 = _426[287:176];
    assign _805 = _804[41:26];
    assign _806 = { gnd,
                    _805 };
    assign _848 = _806 + _847;
    always @(posedge _320) begin
        if (_318)
            _851 <= _1189;
        else
            _851 <= _848;
    end
    assign gnd = 1'b0;
    assign _803 = { gnd,
                    _800 };
    assign _852 = _803 < _851;
    assign _853 = ~ _852;
    assign _857 = _853 | _856;
    assign _866 = _857 & _865;
    assign _4154 = _399 + _4190;
    assign _4150 = _399 == _1119;
    assign _4151 = ~ _4150;
    assign _4152 = _4148 & _4151;
    assign _4155 = _4152 ? _4154 : _399;
    assign _4134 = _4133[2:2];
    assign _4135 = _1861 & _4134;
    assign _4157 = _4135 ? _1229 : _4155;
    assign _4159 = _2029 ? _1229 : _4157;
    assign _313 = _4159;
    always @(posedge _320) begin
        if (_318)
            _399 <= _1229;
        else
            _399 <= _313;
    end
    assign _4171 = _396 + _4190;
    assign _4167 = _396 == _1119;
    assign _4168 = ~ _4167;
    assign _4146 = 9'b111111111;
    assign _4147 = _4139 == _4146;
    assign _4144 = 6'b111111;
    assign _4143 = _4139[5:0];
    assign _4145 = _4143 == _4144;
    assign _4138 = 9'b000000000;
    assign _4160 = 9'b000000001;
    assign _4161 = _4139 + _4160;
    assign _4163 = _2029 ? _4138 : _4161;
    assign _314 = _4163;
    always @(posedge _320) begin
        if (_318)
            _4139 <= _4138;
        else
            _4139 <= _314;
    end
    assign _4140 = _4139[2:0];
    assign _4142 = _4140 == _2496;
    assign _4136 = _750[63:62];
    always @* begin
        case (_4136)
        0:
            _4148 <= vdd;
        1:
            _4148 <= _4142;
        2:
            _4148 <= _4145;
        default:
            _4148 <= _4147;
        endcase
    end
    assign _4169 = _4148 & _4168;
    assign _4172 = _4169 ? _4171 : _396;
    assign _4164 = _4133[1:1];
    assign _4165 = _1861 & _4164;
    assign _4174 = _4165 ? _1229 : _4172;
    assign _4176 = _2029 ? _1229 : _4174;
    assign _315 = _4176;
    always @(posedge _320) begin
        if (_318)
            _396 <= _1229;
        else
            _396 <= _315;
    end
    assign _799 = _755[25:24];
    always @* begin
        case (_799)
        0:
            _800 <= _393;
        1:
            _800 <= _396;
        2:
            _800 <= _399;
        default:
            _800 <= _399;
        endcase
    end
    assign _802 = _800 == _1119;
    assign _870 = _802 ? _869 : _866;
    always @(posedge _320) begin
        if (_318)
            _381 <= _1279;
        else
            _381 <= _365;
    end
    assign f_chg_now = _365 ^ _381;
    assign _4178 = _342 == _1271;
    assign _4180 = _4178 ? _1279 : _378;
    assign _4177 = _342 == _1270;
    assign _4181 = _4177 ? f_changed_all : _4180;
    assign _4183 = _2029 ? _1279 : _4181;
    assign _316 = _4183;
    always @(posedge _320) begin
        if (_318)
            _378 <= _1279;
        else
            _378 <= _316;
    end
    assign f_changed_all = _378 | f_chg_now;
    assign _793 = f_changed_all & f_chgmask1;
    assign _795 = _793 == _1279;
    assign _796 = ~ _795;
    assign f_chgmask1 = _755[23:16];
    assign _792 = f_chgmask1 == _1279;
    assign _797 = _792 | _796;
    assign _786 = _755[7:0];
    assign _784 = _755[15:8];
    assign vdd = 1'b1;
    assign _318 = clear;
    assign _320 = clock;
    assign _322 = pins_in;
    always @(posedge _320) begin
        if (_318)
            _362 <= _1279;
        else
            _362 <= _322;
    end
    always @(posedge _320) begin
        if (_318)
            _365 <= _1279;
        else
            _365 <= _362;
    end
    assign _785 = _365 ^ _784;
    assign _787 = _785 & _786;
    assign _789 = _787 == _1279;
    assign _755 = _357[287:176];
    assign f_valid1 = _755[111:111];
    assign _790 = f_valid1 & _789;
    assign _798 = _790 & _797;
    assign _871 = _798 & _870;
    assign _876 = _871 & _875;
    assign _915 = _876 & _914;
    assign _916 = f_in_eval & _915;
    assign _920 = _916 & _919;
    assign f_fire1 = _920 & _782;
    assign _1064 = f_fire1 ? _1270 : _1062;
    assign f_winner = f_fire0 ? _2571 : _1064;
    always @* begin
        case (f_winner)
        0:
            _4131 <= _4127;
        1:
            _4131 <= _4128;
        2:
            _4131 <= _4129;
        default:
            _4131 <= _4130;
        endcase
    end
    assign _4133 = _1860 ? _4132 : _4131;
    assign _4184 = _4133[0:0];
    assign _1859 = _409 == _1327;
    assign f_in_fetch = _342 == _1270;
    assign _1860 = f_in_fetch & _1859;
    assign _1861 = _1860 | _1246;
    assign _4185 = _1861 & _4184;
    assign _4194 = _4185 ? _1229 : _4192;
    assign _4196 = _2029 ? _1229 : _4194;
    assign _323 = _4196;
    always @(posedge _320) begin
        if (_318)
            _393 <= _1229;
        else
            _393 <= _323;
    end
    assign _2077 = _750[33:32];
    always @* begin
        case (_2077)
        0:
            _2078 <= _393;
        1:
            _2078 <= _396;
        2:
            _2078 <= _399;
        default:
            _2078 <= _399;
        endcase
    end
    assign _2076 = _750[49:34];
    assign _2079 = _2076 < _2078;
    assign _750 = _357[63:0];
    assign _2074 = _750[31:31];
    assign _2072 = ~ _1246;
    assign _2073 = f_in_eval & _2072;
    assign _2075 = _2073 & _2074;
    assign _2080 = _2075 & _2079;
    assign _2085 = _2080 & _2084;
    assign _2093 = _2085 | f_unexp_now;
    assign f_viol_now = _2093 | f_amb_now;
    assign _4202 = f_viol_now ? _4201 : _409;
    assign _4205 = _1246 ? _4204 : _4202;
    assign _4198 = _342 == _1271;
    assign _4206 = _4198 ? _4205 : _409;
    assign _4197 = _342 == _1270;
    assign _4209 = _4197 ? _4208 : _4206;
    assign _4211 = _2029 ? _1130 : _4209;
    assign _324 = _4211;
    always @(posedge _320) begin
        if (_318)
            _409 <= _1130;
        else
            _409 <= _324;
    end
    assign _4214 = _409 == _1327;
    assign _4215 = _4214 ? _312 : _347;
    assign _4212 = _342 == _1270;
    assign _4216 = _4212 ? _4215 : _347;
    assign _325 = _4216;
    always @(posedge _320) begin
        if (_318)
            _347 <= _346;
        else
            _347 <= _325;
    end
    assign _357 = { _347,
                    _350,
                    _353,
                    _356 };
    assign _358 = _357[175:64];
    assign f_valid0 = _358[111:111];
    assign _372 = f_valid0 & _371;
    assign _389 = _372 & _388;
    assign _638 = _389 & _637;
    assign _695 = _638 & _694;
    assign _739 = _695 & _738;
    assign f_in_eval = _342 == _1271;
    assign _740 = f_in_eval & _739;
    assign _749 = _740 & _748;
    assign f_fire0 = _749 & _782;
    assign _1150 = f_fire0 | f_fire1;
    assign _1151 = _1150 | f_fire2;
    assign _1246 = _1151 | f_fire3;
    assign _4235 = _1246 ? _4234 : _4232;
    assign _4220 = _342 == _2097;
    assign _4222 = _4220 ? _2571 : _342;
    assign _4218 = _342 == _1271;
    assign _4236 = _4218 ? _4235 : _4222;
    assign _4217 = _342 == _1270;
    assign _4239 = _4217 ? _4238 : _4236;
    assign _327 = host_stop;
    assign _4241 = _327 ? _2571 : _4239;
    assign _4243 = _2029 ? _1270 : _4241;
    assign _328 = _4243;
    always @(posedge _320) begin
        if (_318)
            _342 <= _2571;
        else
            _342 <= _328;
    end
    assign _1304 = _342 == _2571;
    assign _330 = host_verify;
    assign _2728 = _330 & _1304;
    assign _2730 = _2728 & _2729;
    assign _4245 = _2730 ? _1961 : f_sweeping;
    assign _4255 = f_sweeping ? _4254 : _4245;
    assign _331 = _4255;
    always @(posedge _320) begin
        if (_318)
            f_sweeping <= _1122;
        else
            f_sweeping <= _331;
    end
    assign _4267 = f_sweeping ? _4266 : _4260;
    assign _332 = _4267;
    always @(posedge _320) begin
        if (_318)
            f_image_valid <= _1122;
        else
            f_image_valid <= _332;
    end
    assign _334 = host_start;
    assign _2029 = _334 & f_image_valid;
    assign _4291 = _2029 ? _1279 : _4289;
    assign _335 = _4291;
    always @(posedge _320) begin
        if (_318)
            f_pout <= _1279;
        else
            f_pout <= _335;
    end
    assign _2653 = f_pout[7:7];
    assign _337 = host_pin_src;
    assign _2649 = _337[23:21];
    always @* begin
        case (_2649)
        0:
            _2660 <= _2653;
        1:
            _2660 <= f_lane0_out;
        2:
            _2660 <= _2654;
        3:
            _2660 <= _2655;
        4:
            _2660 <= _2657;
        5:
            _2660 <= f_lane1_out;
        6:
            _2660 <= _2658;
        default:
            _2660 <= _2659;
        endcase
    end
    assign _2724 = { _2660,
                     _2669,
                     _2678,
                     _2687,
                     _2696,
                     _2705,
                     _2714,
                     _2723 };
    assign _4293 = _2724 & _4292;
    assign pins_out = _4293;
    assign pins_oe = _2727;
    assign st_running = _2584;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1254;
    assign st_accepting = _2583;
    assign st_taken = _2581;
    assign st_taken_edge = _2578;
    assign st_viol = _2575;
    assign st_viol_kind = _2572;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _1726;
    assign st_tx_empty = _654;
    assign st_rx_data = _2567;
    assign st_rx_empty = _2502;
    assign st_vlog_data = _2500;
    assign st_vlog_empty = _2121;
    assign st_cov_rdata = _2129;
    assign st_irq = _2125;
    assign st_halted_viol = _2058;
    assign st_rx_overflow = _2051;
    assign st_vlog_overflow = _2039;
    assign st_cov_overrun = _2032;
    assign st_host_err = _2014;
    assign st_host_err_cause = _2019;
    assign st_lane_active = _1970;
    assign st_image_valid = f_image_valid;
    assign st_verify_busy = f_sweeping;
    assign st_tx_collision = _1960;
    assign st_drops = _1926;
    assign st_lane_status = _1657;
    assign ram_rec_addr = _1338;
    assign ram_rec_re = _1330;
    assign ram_rec_we = f_store_we;
    assign ram_rec_wdata = _17;
    assign ram_cov_addr = _1323;
    assign ram_cov_re = _1318;
    assign ram_cov_we = _1315;
    assign ram_cov_wdata = _1302;

endmodule
