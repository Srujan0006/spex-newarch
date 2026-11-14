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
    host_lane1_crc_resid,
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
    host_lane0_crc_resid,
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
    input host_lane1_crc_resid;
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
    input host_lane0_crc_resid;
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

    wire [11:0] _1303;
    wire _1300;
    wire _1301;
    wire [11:0] _1302;
    wire _1304;
    wire [11:0] _1305;
    wire [11:0] _1306;
    wire [11:0] _1292;
    wire [11:0] _1149;
    wire [11:0] _1146;
    wire [12:0] _1143;
    wire [9:0] _1140;
    wire [12:0] _1141;
    wire [12:0] _1142;
    wire [2:0] _1136;
    reg [2:0] _1116;
    wire [2:0] _1;
    reg [2:0] _1137;
    wire [12:0] _1138;
    wire [12:0] _1123;
    wire [12:0] _1122;
    wire [15:0] _1117;
    wire _1121;
    wire [12:0] _1124;
    wire [12:0] _2;
    reg [12:0] _1133;
    wire _1139;
    wire [12:0] _1144;
    wire [12:0] _1130;
    wire _1145;
    wire [11:0] _1148;
    wire _1128;
    wire [15:0] _1125;
    wire _1126;
    wire _3;
    reg _1129;
    wire [11:0] _1150;
    wire [11:0] _4;
    reg [11:0] _1293;
    wire [11:0] _1153;
    reg [1:0] _1119;
    reg [15:0] _1120;
    wire [15:0] _1151;
    wire _1152;
    wire [11:0] _1155;
    wire [11:0] _5;
    reg [11:0] _1290;
    wire _1294;
    wire _1295;
    wire [11:0] _1296;
    wire [11:0] _1287;
    wire _1297;
    wire [11:0] _1298;
    wire [7:0] _1285;
    wire _1286;
    wire [11:0] _1299;
    wire [7:0] _1283;
    wire [7:0] _1282;
    wire [1:0] _1277;
    wire [1:0] _1276;
    wire _1265;
    wire _1257;
    wire _1266;
    wire _6;
    reg _1275;
    wire [1:0] _1278;
    wire [6:0] _1272;
    wire [8:0] _1279;
    wire [7:0] _1270;
    wire [8:0] _1271;
    wire [8:0] _1280;
    wire _1281;
    wire [7:0] _1284;
    wire [31:0] _1307;
    wire [31:0] _8;
    wire [31:0] _1308;
    wire _1321;
    wire _1319;
    wire _1314;
    wire _1312;
    wire _1311;
    wire _1313;
    wire _1315;
    wire f_host_cov_we;
    wire _1323;
    wire _1322;
    wire _1324;
    wire [7:0] _12;
    reg [7:0] _1328;
    wire [7:0] _14;
    wire [7:0] _1325;
    wire [7:0] _1329;
    wire [127:0] _17;
    wire _1336;
    wire [1:0] _1342;
    wire [7:0] _1343;
    wire [7:0] _1340;
    wire [7:0] _22;
    wire [7:0] _1341;
    wire [2:0] _1333;
    wire _1334;
    wire _1335;
    wire [7:0] _1344;
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
    wire [7:0] _1650;
    wire [2:0] _1643;
    wire [2:0] _1617;
    wire [2:0] _1618;
    wire [2:0] _1644;
    wire [2:0] _1646;
    wire [2:0] _1648;
    wire [2:0] _25;
    reg [2:0] _1614;
    wire [7:0] _1649;
    wire [15:0] _1651;
    wire [7:0] _1742;
    wire [7:0] _1743;
    wire _1739;
    wire _1740;
    wire _1732;
    wire _1729;
    wire _1730;
    wire _1726;
    wire _1723;
    wire _1724;
    wire _1725;
    wire _1727;
    wire _1731;
    wire _1733;
    wire _1722;
    wire _1734;
    wire _1741;
    wire [7:0] _1744;
    wire [7:0] _1746;
    wire [7:0] _27;
    reg [7:0] _1737;
    wire [7:0] _1845;
    wire _1841;
    wire _1842;
    wire _1834;
    wire _1831;
    wire _1832;
    wire _1828;
    wire _1825;
    wire _1826;
    wire _1827;
    wire _1829;
    wire _1833;
    wire _1835;
    wire _1721;
    wire _1823;
    wire _1824;
    wire _1836;
    wire _1843;
    wire [7:0] _1846;
    wire [7:0] _1848;
    wire [7:0] _28;
    reg [7:0] _1839;
    wire [7:0] _1885;
    wire _1881;
    wire _1882;
    wire _1875;
    wire _1876;
    wire _1883;
    wire [7:0] _1886;
    wire [7:0] _1888;
    wire [7:0] _29;
    reg [7:0] _1879;
    wire [7:0] _1900;
    wire _1896;
    wire _1897;
    wire _1898;
    wire [7:0] _1901;
    wire [7:0] _1903;
    wire [7:0] _30;
    reg [7:0] _1894;
    wire [7:0] _1916;
    wire _1912;
    wire _1913;
    wire _1914;
    wire [7:0] _1917;
    wire _32;
    wire [7:0] _1919;
    wire [7:0] _33;
    reg [7:0] _1910;
    wire [39:0] _1920;
    wire _1955;
    wire _1933;
    wire _1951;
    wire _1956;
    wire _1958;
    wire _35;
    reg _1954;
    wire [1:0] _1964;
    wire [2:0] _2014;
    wire [2:0] _2016;
    wire [2:0] _40;
    reg [2:0] _2013;
    wire _2009;
    wire [2:0] _1999;
    wire [2:0] _1995;
    wire [2:0] _1996;
    wire [2:0] _2000;
    wire [2:0] _1992;
    wire [2:0] _1991;
    wire [2:0] _1993;
    wire [2:0] _2001;
    wire _1987;
    wire _1984;
    wire _1985;
    wire _1986;
    wire _1988;
    wire _1980;
    wire _1981;
    wire _1962;
    wire _1977;
    wire _1978;
    wire _1963;
    wire [1:0] _43;
    wire _1975;
    wire _1976;
    wire _1979;
    wire _1982;
    wire _44;
    reg _1269;
    wire _1971;
    wire _1970;
    wire _1972;
    wire _1968;
    wire _46;
    wire _48;
    wire _1967;
    wire _1969;
    wire _1973;
    wire _1965;
    wire _1966;
    wire _1974;
    wire _1983;
    wire _1989;
    wire [2:0] _2002;
    wire _2004;
    wire _2005;
    wire _2010;
    wire _2018;
    wire _50;
    wire _2020;
    wire _51;
    reg _2008;
    wire [7:0] _53;
    reg [7:0] _1264;
    wire [7:0] _1261;
    wire _1905;
    wire _1906;
    wire _2021;
    wire _2022;
    wire _54;
    reg _1256;
    wire _56;
    wire _1253;
    wire _1904;
    wire _1907;
    wire _2028;
    wire _2030;
    wire _57;
    reg _2026;
    wire _1891;
    wire _2035;
    wire _2037;
    wire _59;
    reg _2033;
    wire _2041;
    wire _1873;
    wire _1866;
    wire _1874;
    wire _1821;
    wire _1817;
    wire _1822;
    wire _2038;
    wire _61;
    wire _2039;
    wire _2040;
    wire _2042;
    wire _2047;
    wire _2049;
    wire _62;
    reg _2045;
    wire _2053;
    wire _2054;
    wire _2059;
    wire _66;
    wire _2061;
    wire _2063;
    wire _67;
    reg _2057;
    wire _2092;
    wire _2094;
    wire _2090;
    wire _2096;
    wire _2097;
    wire _2098;
    wire _2065;
    wire _2099;
    wire _2101;
    wire _68;
    reg _2052;
    wire _2116;
    wire [2:0] _70;
    wire [3:0] _2109;
    wire _2110;
    wire _2111;
    wire _72;
    wire _2112;
    wire [2:0] _74;
    wire _2103;
    wire [2:0] _2105;
    wire [3:0] _2106;
    wire _2107;
    wire _2108;
    wire _2113;
    wire _2117;
    wire _2118;
    wire _2119;
    wire [31:0] _77;
    wire [31:0] _2122;
    wire _2120;
    wire _2121;
    wire [31:0] _2123;
    wire [2:0] _2490;
    wire _2491;
    wire _2492;
    wire [47:0] _2489;
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
    wire _2455;
    wire _2456;
    reg [47:0] _2457;
    wire [2:0] _2130;
    wire [2:0] _2131;
    wire [2:0] _80;
    reg [2:0] _2128;
    wire _2449;
    wire _2450;
    wire [2:0] _2422;
    wire [28:0] _2139;
    wire [28:0] _2138;
    wire [28:0] _2141;
    wire [28:0] _2142;
    wire [2:0] _2135;
    wire _2137;
    wire [28:0] _2143;
    wire [28:0] _81;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2420;
    wire [2:0] _2161;
    wire _2157;
    wire _2158;
    wire _2155;
    wire _2159;
    wire [2:0] _2162;
    wire _2152;
    wire _2153;
    wire _2150;
    wire _2149;
    wire _2151;
    wire _2154;
    wire [2:0] _2164;
    wire _2145;
    wire [2:0] _2165;
    wire [2:0] _82;
    reg [2:0] _2148;
    wire _2411;
    wire [2:0] _2413;
    wire [2:0] _2182;
    wire _2178;
    wire _2179;
    wire _2176;
    wire _2180;
    wire [2:0] _2183;
    wire _2173;
    wire _2174;
    wire _2171;
    wire _2170;
    wire _2172;
    wire _2175;
    wire [2:0] _2185;
    wire _2166;
    wire [2:0] _2186;
    wire [2:0] _83;
    reg [2:0] _2169;
    wire _2408;
    wire [2:0] _2410;
    wire [2:0] _2414;
    wire [2:0] _2203;
    wire _2199;
    wire _2200;
    wire _2197;
    wire _2201;
    wire [2:0] _2204;
    wire _2194;
    wire _2195;
    wire _2192;
    wire _2191;
    wire _2193;
    wire _2196;
    wire [2:0] _2206;
    wire _2187;
    wire [2:0] _2207;
    wire [2:0] _84;
    reg [2:0] _2190;
    wire _2404;
    wire [2:0] _2406;
    wire [2:0] _2224;
    wire _2220;
    wire _2221;
    wire _2218;
    wire _2222;
    wire [2:0] _2225;
    wire _2215;
    wire _2216;
    wire _2213;
    wire _2212;
    wire _2214;
    wire _2217;
    wire [2:0] _2227;
    wire _2208;
    wire [2:0] _2228;
    wire [2:0] _85;
    reg [2:0] _2211;
    wire _2401;
    wire [2:0] _2403;
    wire [2:0] _2407;
    wire [2:0] _2415;
    wire [2:0] _2245;
    wire _2241;
    wire _2242;
    wire _2239;
    wire _2243;
    wire [2:0] _2246;
    wire _2236;
    wire _2237;
    wire _2234;
    wire _2233;
    wire _2235;
    wire _2238;
    wire [2:0] _2248;
    wire _2229;
    wire [2:0] _2249;
    wire [2:0] _86;
    reg [2:0] _2232;
    wire _2396;
    wire [2:0] _2398;
    wire [2:0] _2266;
    wire _2262;
    wire _2263;
    wire _2260;
    wire _2264;
    wire [2:0] _2267;
    wire _2257;
    wire _2258;
    wire _2255;
    wire _2254;
    wire _2256;
    wire _2259;
    wire [2:0] _2269;
    wire _2250;
    wire [2:0] _2270;
    wire [2:0] _87;
    reg [2:0] _2253;
    wire _2393;
    wire [2:0] _2395;
    wire [2:0] _2399;
    wire [2:0] _2287;
    wire _2283;
    wire _2284;
    wire _2281;
    wire _2285;
    wire [2:0] _2288;
    wire _2278;
    wire _2279;
    wire _2276;
    wire _2275;
    wire _2277;
    wire _2280;
    wire [2:0] _2290;
    wire _2271;
    wire [2:0] _2291;
    wire [2:0] _88;
    reg [2:0] _2274;
    wire _2389;
    wire [2:0] _2391;
    wire [2:0] _2308;
    wire _2304;
    wire _2305;
    wire _2302;
    wire _2306;
    wire [2:0] _2309;
    wire _2299;
    wire _2300;
    wire _2297;
    wire _2296;
    wire _2298;
    wire _2301;
    wire [2:0] _2311;
    wire _2292;
    wire [2:0] _2312;
    wire [2:0] _89;
    reg [2:0] _2295;
    wire _2386;
    wire [2:0] _2388;
    wire [2:0] _2392;
    wire [2:0] _2400;
    wire [2:0] _2416;
    wire _2381;
    wire _2380;
    wire _2382;
    wire _2378;
    wire _2377;
    wire _2379;
    wire _2383;
    wire _2374;
    wire _2373;
    wire _2375;
    wire _2371;
    wire _2370;
    wire _2372;
    wire _2376;
    wire _2384;
    wire [2:0] _2417;
    wire _2359;
    wire _2358;
    wire _2360;
    wire [2:0] _2362;
    wire _2354;
    wire _2353;
    wire _2355;
    wire [2:0] _2357;
    wire _2363;
    wire [2:0] _2364;
    wire _2347;
    wire _2346;
    wire _2348;
    wire [2:0] _2350;
    wire _2342;
    wire _2341;
    wire _2343;
    wire [2:0] _2345;
    wire _2351;
    wire [2:0] _2352;
    wire _2365;
    wire [2:0] _2366;
    wire _2333;
    wire _2332;
    wire _2334;
    wire [2:0] _2336;
    wire _2328;
    wire _2327;
    wire _2329;
    wire [2:0] _2331;
    wire _2337;
    wire [2:0] _2338;
    wire _2321;
    wire _2320;
    wire _2322;
    wire [2:0] _2324;
    wire _2316;
    wire _2315;
    wire _2317;
    wire [2:0] _2319;
    wire _2325;
    wire [2:0] _2326;
    wire _2339;
    wire [2:0] _2340;
    wire _2367;
    wire [2:0] _2368;
    wire [2:0] _2369;
    wire [2:0] _2418;
    wire [2:0] _2313;
    wire _2419;
    wire [28:0] _2421;
    wire [31:0] _2423;
    wire [47:0] _2427;
    wire [47:0] _90;
    reg [47:0] _2451;
    wire [2:0] _2444;
    wire [3:0] _2114;
    wire [3:0] _2433;
    wire [3:0] _2434;
    wire [3:0] _2432;
    wire [3:0] _2435;
    wire [3:0] _1889;
    wire _1890;
    wire _2124;
    wire _91;
    wire _2125;
    wire _2430;
    wire [3:0] _2436;
    reg [3:0] _2439;
    wire [3:0] _92;
    wire _2115;
    wire _2428;
    wire _94;
    wire _2429;
    wire [2:0] _2445;
    wire [2:0] _95;
    reg [2:0] _2442;
    reg [47:0] _2494;
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
    wire _2522;
    wire _2523;
    reg [7:0] _2524;
    wire [2:0] _2503;
    wire [2:0] _2504;
    wire [2:0] _98;
    reg [2:0] _2501;
    wire _2516;
    wire _2517;
    reg [7:0] _2518;
    wire [2:0] _2511;
    wire [2:0] _2512;
    wire [2:0] _99;
    reg [2:0] _2509;
    reg [7:0] _2561;
    wire [31:0] _2562;
    wire [31:0] _2563;
    wire [31:0] _103;
    reg [31:0] ts_reg;
    wire [1:0] _2565;
    wire [1:0] _2424;
    wire [1:0] _2426;
    reg [1:0] _2566;
    reg _2569;
    reg [1:0] _2572;
    reg _2575;
    wire _2576;
    wire _2577;
    wire _2578;
    wire [7:0] _2719;
    wire [7:0] _2720;
    wire [7:0] _2600;
    wire [7:0] _2598;
    wire [7:0] _2597;
    wire [7:0] _2596;
    wire [7:0] _2595;
    reg [7:0] _2599;
    wire [7:0] _2601;
    wire [7:0] _2602;
    wire [7:0] _2593;
    wire [7:0] _2594;
    wire [7:0] _2603;
    wire [7:0] _2637;
    wire [7:0] _2638;
    wire [7:0] _2640;
    wire [7:0] _2642;
    wire [7:0] _113;
    reg [7:0] f_poe;
    wire [7:0] _2721;
    wire [7:0] _116;
    wire [7:0] _4344;
    wire _2716;
    wire _2715;
    wire _2713;
    wire _2714;
    wire _2712;
    wire _2711;
    wire _2710;
    wire [2:0] _2709;
    reg _2717;
    wire _2707;
    wire _2706;
    wire _2704;
    wire _2705;
    wire _2703;
    wire _2702;
    wire _2701;
    wire [2:0] _2700;
    reg _2708;
    wire _2698;
    wire _2697;
    wire _2695;
    wire _2696;
    wire _2694;
    wire _2693;
    wire _2692;
    wire [2:0] _2691;
    reg _2699;
    wire _2689;
    wire _2688;
    wire _2686;
    wire _2687;
    wire _2685;
    wire _2684;
    wire _2683;
    wire [2:0] _2682;
    reg _2690;
    wire _2680;
    wire _2679;
    wire _2677;
    wire _2678;
    wire _2676;
    wire _2675;
    wire _2674;
    wire [2:0] _2673;
    reg _2681;
    wire _2671;
    wire _2670;
    wire _2668;
    wire _2669;
    wire _2667;
    wire _2666;
    wire _2665;
    wire [2:0] _2664;
    reg _2672;
    wire _2662;
    wire _2661;
    wire _2659;
    wire _2660;
    wire _2658;
    wire _2657;
    wire _2656;
    wire [2:0] _2655;
    reg _2663;
    wire _2653;
    wire _2652;
    wire _2650;
    wire _2651;
    wire _2649;
    wire _2648;
    wire [2:0] _4336;
    wire _4333;
    wire [1:0] _4334;
    wire [3:0] _4335;
    wire [6:0] _4337;
    wire [7:0] _4338;
    wire [7:0] _4339;
    wire _2634;
    wire _2633;
    wire _2632;
    wire _2630;
    wire _2631;
    wire _2628;
    wire _2629;
    wire _2625;
    wire _2626;
    wire _2627;
    wire _2622;
    wire _2623;
    wire _2624;
    wire _2619;
    wire _2618;
    wire _2620;
    wire _2617;
    wire _2621;
    wire [7:0] _2635;
    wire _2604;
    wire _2610;
    wire [7:0] _2636;
    wire [7:0] _4331;
    wire [7:0] _4327;
    wire [7:0] _4325;
    wire [7:0] _4324;
    wire [7:0] _4323;
    wire [7:0] _4322;
    reg [7:0] _4326;
    wire [7:0] _4328;
    wire [7:0] _4329;
    wire [7:0] _2591;
    wire [7:0] _2589;
    wire [7:0] _2588;
    wire [7:0] _2587;
    wire [7:0] _2586;
    reg [7:0] _2590;
    wire [7:0] _2592;
    wire [7:0] _4320;
    wire [7:0] _4321;
    wire [7:0] _4330;
    wire [7:0] _4332;
    wire [7:0] _4340;
    wire _2580;
    wire _2581;
    wire _2582;
    wire [7:0] _4341;
    wire [31:0] _118;
    wire [31:0] _4313;
    wire [31:0] _2833;
    wire [30:0] _2831;
    wire [31:0] _2832;
    wire [31:0] _2834;
    wire [30:0] _2828;
    wire [31:0] _2829;
    wire [30:0] _2821;
    wire [31:0] _2822;
    wire [31:0] _2824;
    wire [30:0] _2818;
    wire [31:0] _2819;
    wire [30:0] _2811;
    wire [31:0] _2812;
    wire [31:0] _2814;
    wire [30:0] _2808;
    wire [31:0] _2809;
    wire [30:0] _2801;
    wire [31:0] _2802;
    wire [31:0] _2804;
    wire [30:0] _2798;
    wire [31:0] _2799;
    wire [30:0] _2791;
    wire [31:0] _2792;
    wire [31:0] _2794;
    wire [30:0] _2788;
    wire [31:0] _2789;
    wire [30:0] _2781;
    wire [31:0] _2782;
    wire [31:0] _2784;
    wire [30:0] _2778;
    wire [31:0] _2779;
    wire [30:0] _2771;
    wire [31:0] _2772;
    wire [31:0] _2774;
    wire [30:0] _2768;
    wire [31:0] _2769;
    wire [30:0] _2761;
    wire [31:0] _2762;
    wire [31:0] _2764;
    wire [30:0] _2758;
    wire [31:0] _2759;
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
    wire [7:0] _2742;
    wire [7:0] _2741;
    wire [7:0] _2740;
    wire [7:0] _2739;
    wire [7:0] _2738;
    wire [7:0] _2737;
    wire [12:0] _2734;
    wire [12:0] _2735;
    wire [3:0] _2736;
    reg [7:0] _2753;
    wire [23:0] _2733;
    wire [31:0] _2754;
    wire _2731;
    wire _2732;
    wire [31:0] _2836;
    wire [31:0] _2729;
    wire [31:0] _2837;
    wire [31:0] _119;
    reg [31:0] _2727;
    wire [31:0] _2755;
    wire _2756;
    wire [31:0] _2765;
    wire _2766;
    wire [31:0] _2775;
    wire _2776;
    wire [31:0] _2785;
    wire _2786;
    wire [31:0] _2795;
    wire _2796;
    wire [31:0] _2805;
    wire _2806;
    wire [31:0] _2815;
    wire _2816;
    wire [31:0] _2825;
    wire _2826;
    wire [31:0] _2835;
    wire [31:0] _4314;
    wire f_sw_match;
    wire _4316;
    wire _4318;
    wire _1331;
    wire _1330;
    wire f_store_we;
    wire _4308;
    wire _4310;
    wire _4312;
    wire [12:0] _4301;
    wire [12:0] _2841;
    wire [12:0] _2839;
    wire [12:0] _2842;
    wire [12:0] _120;
    reg [12:0] f_sw_cnt;
    wire f_sw_last;
    wire _4304;
    wire _122;
    wire _124;
    wire _4298;
    wire _4299;
    wire _4300;
    wire _4306;
    wire _2723;
    wire [1:0] _4290;
    wire [1:0] _4286;
    wire [1:0] _2091;
    wire _4277;
    wire [1:0] _4279;
    wire _4276;
    wire [1:0] _4281;
    wire _4275;
    wire [1:0] _4283;
    wire [1:0] _4284;
    wire [7:0] _1247;
    wire _1249;
    wire _1240;
    wire [15:0] _1235;
    wire _1236;
    wire _1237;
    wire _1234;
    wire _1238;
    wire _1241;
    wire [3:0] _1231;
    wire _1233;
    wire _1242;
    wire _1229;
    wire _1225;
    wire _1226;
    wire _1223;
    wire _1227;
    wire _1230;
    wire _1221;
    reg [2:0] _1115;
    wire [15:0] _1216;
    wire _1217;
    wire _1214;
    wire _1218;
    wire _1212;
    wire _1219;
    wire _1222;
    wire [1:0] _1211;
    reg _1243;
    wire _1210;
    wire _1244;
    wire _1207;
    wire [3:0] _1205;
    reg _1206;
    wire _1208;
    wire [15:0] _1200;
    wire _1202;
    wire [16:0] _1195;
    wire [15:0] _1191;
    wire [16:0] _1192;
    wire [16:0] _1193;
    reg [16:0] _1196;
    wire _1197;
    wire _1198;
    wire [15:0] _1187;
    wire _1189;
    wire _1104;
    wire [2:0] _1106;
    wire _1101;
    wire [2:0] _1103;
    wire _1107;
    wire [2:0] _1108;
    wire _1096;
    wire [2:0] _1098;
    wire _1093;
    wire [2:0] _1095;
    wire _1099;
    wire [2:0] _1100;
    wire _1109;
    wire [2:0] _1110;
    wire _1086;
    wire [2:0] _1088;
    wire _1083;
    wire [2:0] _1085;
    wire _1089;
    wire [2:0] _1090;
    wire _1078;
    wire [2:0] _1080;
    wire [7:0] _1074;
    wire _1075;
    wire [2:0] _1077;
    wire _1081;
    wire [2:0] _1082;
    wire _1091;
    wire [2:0] _1092;
    wire _1111;
    wire [2:0] _1112;
    wire [13:0] _1179;
    wire [16:0] _1180;
    wire [111:0] _1073;
    wire [15:0] _1177;
    wire [16:0] _1178;
    wire [16:0] _1181;
    reg [16:0] _1184;
    wire [16:0] _1176;
    wire _1185;
    wire _1186;
    wire _1190;
    wire _1199;
    wire [1:0] _1118;
    reg [15:0] _1173;
    wire _1175;
    wire _1203;
    wire [7:0] _1167;
    wire _1169;
    wire _1170;
    wire _1166;
    wire _1171;
    wire [7:0] _1160;
    wire [7:0] _1158;
    wire [7:0] _1159;
    wire [7:0] _1161;
    wire _1163;
    wire _1164;
    wire _1172;
    wire _1204;
    wire _1209;
    wire _1245;
    wire _1246;
    wire _1250;
    wire f_fire3;
    wire [7:0] _752;
    wire _754;
    wire _740;
    wire _736;
    wire _737;
    wire _734;
    wire _738;
    wire _741;
    wire [3:0] _731;
    wire _733;
    wire _742;
    wire _729;
    wire _725;
    wire _726;
    wire _723;
    wire _727;
    wire _730;
    wire _721;
    reg [2:0] _715;
    wire [15:0] _716;
    wire _717;
    wire _711;
    wire _718;
    wire _709;
    wire _719;
    wire _722;
    wire [1:0] _708;
    reg _743;
    wire _707;
    wire _744;
    wire _699;
    wire [3:0] _645;
    reg _698;
    wire _700;
    wire [15:0] _640;
    wire _642;
    wire [15:0] _631;
    wire [16:0] _632;
    wire [16:0] _633;
    reg [16:0] _636;
    wire _637;
    wire _638;
    wire [15:0] _627;
    wire _629;
    wire _593;
    wire [2:0] _613;
    wire _572;
    wire [2:0] _592;
    wire _614;
    wire [2:0] _615;
    wire _549;
    wire [2:0] _569;
    wire _528;
    wire [2:0] _548;
    wire _570;
    wire [2:0] _571;
    wire _616;
    wire [2:0] _617;
    wire _503;
    wire [2:0] _523;
    wire _482;
    wire [2:0] _502;
    wire _524;
    wire [2:0] _525;
    wire _459;
    wire [2:0] _479;
    wire [7:0] _437;
    wire _438;
    wire [2:0] _458;
    wire _480;
    wire [2:0] _481;
    wire _526;
    wire [2:0] _527;
    wire _618;
    wire [2:0] _619;
    wire [16:0] _620;
    wire [111:0] _433;
    wire [15:0] _434;
    wire [16:0] _435;
    wire [16:0] _621;
    reg [16:0] _624;
    wire [16:0] _410;
    wire _625;
    wire _626;
    wire _630;
    wire _639;
    wire [1:0] _396;
    reg [15:0] _406;
    wire _408;
    wire _643;
    wire [7:0] _390;
    wire _392;
    wire _393;
    wire _381;
    wire _394;
    wire [7:0] _374;
    wire [7:0] _372;
    wire [7:0] _373;
    wire [7:0] _375;
    wire _377;
    wire [127:0] _352;
    wire [2:0] _4260;
    wire [5:0] _1259;
    wire [5:0] _126;
    wire [5:0] _2859;
    wire [5:0] _128;
    wire [5:0] _2846;
    wire [5:0] _129;
    reg [5:0] _2845;
    wire _2849;
    wire [5:0] _2850;
    wire [5:0] _2851;
    wire [5:0] _2860;
    wire _2847;
    wire [5:0] _2861;
    wire [5:0] _2862;
    wire [5:0] _130;
    reg [5:0] _1260;
    wire [5:0] _2855;
    wire [5:0] _2854;
    wire [5:0] _2853;
    wire [5:0] _2852;
    reg [5:0] _2856;
    wire _2857;
    wire _2858;
    wire [2:0] _4256;
    wire _4251;
    wire [2:0] _4253;
    wire [7:0] _2082;
    wire _2084;
    wire _2085;
    wire _2080;
    wire _2081;
    wire f_unexp_now;
    wire _2866;
    wire _2867;
    wire _2869;
    wire _2870;
    wire _2865;
    wire _2863;
    wire _2871;
    wire _131;
    reg _2077;
    wire _2078;
    wire [15:0] _4242;
    wire [15:0] _4243;
    wire _4239;
    wire _4240;
    wire _4241;
    wire [15:0] _4244;
    wire [2:0] _4184;
    wire [2:0] _4182;
    wire [2:0] _4181;
    wire [2:0] _4180;
    wire [2:0] _4179;
    wire [7:0] _1061;
    wire _1063;
    wire _1054;
    wire _1050;
    wire _1051;
    wire _1048;
    wire _1052;
    wire _1055;
    wire [3:0] _1045;
    wire _1047;
    wire _1056;
    wire _1043;
    wire _1039;
    wire _1040;
    wire _1037;
    wire _1041;
    wire _1044;
    wire _1035;
    reg [2:0] _1029;
    wire [15:0] _1030;
    wire _1031;
    wire _1025;
    wire _1032;
    wire _1023;
    wire _1033;
    wire _1036;
    wire [1:0] _1022;
    reg _1057;
    wire _1021;
    wire _1058;
    wire _1018;
    wire [3:0] _1016;
    reg _1017;
    wire _1019;
    wire [15:0] _1011;
    wire _1013;
    wire [15:0] _1002;
    wire [16:0] _1003;
    wire [16:0] _1004;
    reg [16:0] _1007;
    wire _1008;
    wire _1009;
    wire [15:0] _998;
    wire _1000;
    wire _982;
    wire [2:0] _984;
    wire _979;
    wire [2:0] _981;
    wire _985;
    wire [2:0] _986;
    wire _974;
    wire [2:0] _976;
    wire _971;
    wire [2:0] _973;
    wire _977;
    wire [2:0] _978;
    wire _987;
    wire [2:0] _988;
    wire _964;
    wire [2:0] _966;
    wire _961;
    wire [2:0] _963;
    wire _967;
    wire [2:0] _968;
    wire _956;
    wire [2:0] _958;
    wire [7:0] _952;
    wire _953;
    wire [2:0] _955;
    wire _959;
    wire [2:0] _960;
    wire _969;
    wire [2:0] _970;
    wire _989;
    wire [2:0] _990;
    wire [16:0] _991;
    wire [111:0] _948;
    wire [15:0] _949;
    wire [16:0] _950;
    wire [16:0] _992;
    reg [16:0] _995;
    wire [16:0] _947;
    wire _996;
    wire _997;
    wire _1001;
    wire _1010;
    wire [1:0] _943;
    reg [15:0] _944;
    wire _946;
    wire _1014;
    wire [7:0] _937;
    wire _939;
    wire _940;
    wire _936;
    wire _941;
    wire [7:0] _930;
    wire [7:0] _928;
    wire [7:0] _929;
    wire [7:0] _931;
    wire _933;
    wire _934;
    wire _942;
    wire _1015;
    wire _1020;
    wire _1059;
    wire _1060;
    wire _1064;
    wire f_fire2;
    wire [1:0] _1068;
    wire [1:0] f_policy;
    wire _787;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _777;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _771;
    wire [7:0] _765;
    wire [7:0] f_chgmask0;
    wire [7:0] _759;
    wire [7:0] f_watch;
    wire [7:0] _760;
    wire [7:0] _766;
    wire [7:0] _772;
    wire [7:0] f_relevant;
    wire [7:0] _779;
    wire _781;
    wire _782;
    wire f_amb_now;
    wire _784;
    wire _788;
    wire [7:0] _750;
    wire [7:0] _2876;
    wire [7:0] _2877;
    wire _2873;
    wire [7:0] _2875;
    wire _2872;
    wire [7:0] _2878;
    wire [7:0] _2880;
    wire [7:0] _132;
    reg [7:0] _749;
    wire [7:0] f_multi_eff;
    wire [7:0] _923;
    wire _925;
    wire _916;
    wire _912;
    wire _913;
    wire _910;
    wire _914;
    wire _917;
    wire [3:0] _907;
    wire _909;
    wire _918;
    wire _905;
    wire _901;
    wire _902;
    wire _899;
    wire _903;
    wire _906;
    wire _897;
    reg [2:0] _891;
    wire [15:0] _892;
    wire _893;
    wire _887;
    wire _894;
    wire _885;
    wire _895;
    wire _898;
    wire [1:0] _884;
    reg _919;
    wire [1:0] _134;
    wire [1:0] _2881;
    wire [1:0] _135;
    reg [1:0] _704;
    wire _706;
    wire _883;
    wire _920;
    wire _880;
    wire _2885;
    wire _2883;
    wire _2886;
    wire _2888;
    wire _2890;
    wire _136;
    reg _697;
    wire [15:0] _2897;
    wire [15:0] _2898;
    wire _2900;
    wire _2891;
    wire _2901;
    wire _2903;
    wire _2904;
    wire _2905;
    wire _2906;
    wire _2908;
    wire _2910;
    wire _137;
    reg _694;
    wire [15:0] _139;
    wire [15:0] _141;
    wire [15:0] _2948;
    wire [15:0] _2949;
    wire [15:0] _2950;
    wire _2952;
    wire _2923;
    wire _2924;
    wire _2926;
    wire _2927;
    wire _2928;
    wire _2929;
    wire _2931;
    wire _142;
    reg g_crc_bad;
    wire _2925;
    wire _2942;
    wire [5:0] _2940;
    wire _2941;
    wire _2943;
    wire _2944;
    wire _2945;
    wire _2946;
    wire _2947;
    wire _2935;
    wire _2933;
    wire _2932;
    wire _2934;
    wire _2936;
    wire _143;
    reg g_resid_chk;
    wire _2953;
    wire _2955;
    wire _2957;
    wire _144;
    reg _691;
    wire _2961;
    wire _2959;
    wire _2962;
    wire _2964;
    wire _2966;
    wire _145;
    reg _683;
    wire [15:0] _2973;
    wire [15:0] _2974;
    wire _2976;
    wire _2967;
    wire _2977;
    wire _2979;
    wire _2980;
    wire _2981;
    wire _2982;
    wire _2984;
    wire _2986;
    wire _146;
    reg _680;
    wire [15:0] _148;
    wire [15:0] _150;
    wire [15:0] _3024;
    wire [15:0] _3025;
    wire [15:0] _3026;
    wire _3028;
    wire _2999;
    wire _3000;
    wire _3002;
    wire _3003;
    wire _3004;
    wire _3005;
    wire _3007;
    wire _151;
    reg g_crc_bad_0;
    wire _3001;
    wire _3018;
    wire _3017;
    wire _3019;
    wire _3020;
    wire _3021;
    wire _3022;
    wire _3023;
    wire _3011;
    wire _3009;
    wire _3008;
    wire _3010;
    wire _3012;
    wire _152;
    reg g_resid_chk_0;
    wire _3029;
    wire _3031;
    wire _3033;
    wire _153;
    reg _677;
    wire [7:0] _155;
    wire [6:0] _668;
    wire [6:0] _667;
    wire _669;
    wire [15:0] _664;
    wire _3038;
    wire _3037;
    wire _3039;
    wire _3036;
    wire _3040;
    wire _3035;
    wire _3041;
    wire [14:0] _3034;
    wire [15:0] _3042;
    wire [15:0] _156;
    reg [15:0] _665;
    wire _666;
    wire [3:0] _3055;
    wire [3:0] _3053;
    wire [3:0] _3056;
    wire _2496;
    wire _2505;
    wire _158;
    wire _2506;
    wire _2497;
    wire _3049;
    wire _3045;
    wire _3043;
    wire _3044;
    wire _3046;
    wire _3050;
    wire f_rx_push;
    wire _2498;
    wire _3051;
    wire [3:0] _3057;
    reg [3:0] _3060;
    wire [3:0] _160;
    wire _662;
    wire _658;
    wire [6:0] _3995;
    wire [7:0] _3996;
    wire _3993;
    wire _3992;
    wire _3991;
    wire _3990;
    wire _3989;
    wire _3988;
    wire _3987;
    wire _3986;
    wire [7:0] _3994;
    wire [3:0] _3978;
    wire [3:0] _3976;
    wire [3:0] _3979;
    wire _1720;
    wire _3076;
    wire _3073;
    wire _162;
    wire _3074;
    wire _1716;
    wire [2:0] _1710;
    wire _1705;
    wire g_tx_bit;
    wire _1706;
    wire _1707;
    wire _1708;
    wire [2:0] _1711;
    wire _1713;
    wire _1714;
    wire _1685;
    wire _1715;
    wire _1717;
    wire _1681;
    wire [5:0] _1672;
    wire _1673;
    wire _1674;
    wire [9:0] _1668;
    wire _1670;
    wire _1671;
    wire _1675;
    wire _3966;
    wire _3967;
    wire [1:0] _3970;
    wire _3959;
    wire _3960;
    wire _3961;
    wire _3962;
    wire [1:0] _3964;
    wire [2:0] _3945;
    wire [2:0] _3942;
    wire _3938;
    wire _3936;
    wire _3937;
    wire _3939;
    wire [2:0] _3943;
    wire _3934;
    wire [2:0] _3946;
    wire _3947;
    wire [2:0] _3928;
    wire _3924;
    wire _3922;
    wire _3923;
    wire _3925;
    wire [2:0] _3929;
    wire _3920;
    wire [2:0] _3931;
    wire _3932;
    wire _3948;
    wire _3949;
    wire _3950;
    wire _3916;
    wire _3914;
    wire _3917;
    wire [15:0] _3909;
    wire _3910;
    wire _3907;
    wire _3911;
    wire _3905;
    wire _3906;
    wire _3912;
    wire _3918;
    wire _3951;
    wire [1:0] _3953;
    wire [1:0] _3955;
    wire [1:0] _3901;
    wire _3897;
    wire [1:0] _3899;
    wire [1:0] _3902;
    wire _3152;
    wire _3153;
    wire _163;
    reg _3063;
    wire _3823;
    wire _3821;
    wire _3822;
    reg _3824;
    wire [2:0] _165;
    wire [2:0] _3805;
    wire [2:0] _3806;
    wire [2:0] _3801;
    wire _3797;
    wire _3795;
    wire _3796;
    wire _3798;
    wire [2:0] _3802;
    wire _3793;
    wire [2:0] _3807;
    wire [2:0] _3808;
    wire [2:0] _3787;
    wire [2:0] _3788;
    wire [2:0] _3783;
    wire _3148;
    wire _3147;
    wire _3146;
    wire _3145;
    wire _3144;
    wire _3143;
    wire _3142;
    wire _3138;
    wire _3137;
    wire _3136;
    wire _3135;
    wire _3134;
    wire _3133;
    wire _3132;
    wire _3124;
    wire _3125;
    reg [7:0] _3126;
    wire _3118;
    wire _3119;
    reg [7:0] _3120;
    wire _3112;
    wire _3113;
    reg [7:0] _3114;
    wire _3106;
    wire _3107;
    reg [7:0] _3108;
    wire _3100;
    wire _3101;
    reg [7:0] _3102;
    wire _3094;
    wire _3095;
    reg [7:0] _3096;
    wire _3088;
    wire _3089;
    reg [7:0] _3090;
    wire [2:0] _3155;
    wire [2:0] _3156;
    wire [2:0] _166;
    reg [2:0] _3080;
    wire _3082;
    wire _3083;
    wire [7:0] _3223;
    wire [7:0] _3224;
    wire [7:0] _3174;
    wire [7:0] _3172;
    wire [7:0] _3175;
    wire [7:0] _167;
    reg [7:0] _3161;
    wire [7:0] _3170;
    wire [7:0] _3171;
    wire [7:0] _3216;
    wire [7:0] _3183;
    wire [7:0] _3181;
    wire [7:0] _3184;
    wire [7:0] _168;
    reg [7:0] _3180;
    wire [6:0] _3201;
    wire [7:0] _3202;
    wire [6:0] _3199;
    wire _3197;
    wire _3196;
    wire _3195;
    wire _3194;
    wire _3193;
    wire _3192;
    wire _3191;
    wire _3190;
    wire [2:0] _3188;
    wire [2:0] _3187;
    wire [2:0] _3186;
    wire [2:0] _3185;
    reg [2:0] _3189;
    reg _3198;
    wire [7:0] _3200;
    reg [7:0] _3203;
    wire [7:0] _3204;
    wire [7:0] _169;
    reg [7:0] _657;
    wire _3182;
    wire _3208;
    wire _3176;
    wire _3177;
    wire _3206;
    wire [1:0] _1859;
    wire [1:0] _1858;
    wire [1:0] _1857;
    wire [1:0] _1856;
    reg [1:0] _1860;
    wire [1:0] _1862;
    wire f_eng_push;
    wire _1865;
    wire _1871;
    wire _1868;
    wire _1869;
    wire _1867;
    wire _1870;
    wire _1872;
    wire _3209;
    wire _170;
    reg _1851;
    wire [7:0] _3215;
    wire _3173;
    wire _3213;
    wire _1814;
    wire [2:0] _1808;
    wire _1803;
    wire g_tx_bit_0;
    wire _1804;
    wire _1805;
    wire _1806;
    wire [2:0] _1809;
    wire _1811;
    wire _1812;
    wire _1783;
    wire _1813;
    wire _1815;
    wire _1779;
    wire _1780;
    wire _1816;
    wire _3157;
    wire _3158;
    wire _3211;
    wire _3214;
    wire _171;
    reg _1749;
    wire _1819;
    wire _1818;
    wire _1820;
    wire [7:0] _3217;
    wire [7:0] _3225;
    wire [7:0] _172;
    wire [7:0] _173;
    wire [7:0] _175;
    wire [7:0] _3070;
    reg [7:0] _3084;
    wire [2:0] _3614;
    wire _3611;
    wire _1948;
    wire _1784;
    wire _3601;
    wire _3602;
    wire [1:0] _3605;
    wire _3594;
    wire _3595;
    wire _3596;
    wire _3597;
    wire [1:0] _3599;
    wire [2:0] _3580;
    wire [2:0] _3577;
    wire _3573;
    wire _3571;
    wire _3572;
    wire _3574;
    wire [2:0] _3578;
    wire _3569;
    wire [2:0] _3581;
    wire _3582;
    wire [2:0] _3563;
    wire _3559;
    wire _3557;
    wire _3558;
    wire _3560;
    wire [2:0] _3564;
    wire _3555;
    wire [2:0] _3566;
    wire _3567;
    wire _3583;
    wire _3584;
    wire _3585;
    wire _3551;
    wire _3549;
    wire _3552;
    wire [15:0] _3544;
    wire _3545;
    wire _3542;
    wire _3546;
    wire _3540;
    wire _3541;
    wire _3547;
    wire _3553;
    wire _3586;
    wire [1:0] _3588;
    wire [1:0] _3590;
    wire [1:0] _3536;
    wire _3532;
    wire [1:0] _3534;
    wire [1:0] _3537;
    wire _3253;
    wire _3254;
    wire _176;
    reg _3228;
    wire _3462;
    wire _3460;
    wire _3461;
    reg _3463;
    wire [2:0] _178;
    wire [2:0] _3444;
    wire [2:0] _3445;
    wire [2:0] _3440;
    wire _3436;
    wire _3434;
    wire _3435;
    wire _3437;
    wire [2:0] _3441;
    wire _3432;
    wire [2:0] _3446;
    wire [2:0] _3447;
    wire [2:0] _3426;
    wire [2:0] _3427;
    wire [2:0] _3422;
    wire _3249;
    wire _3248;
    wire _3247;
    wire _3246;
    wire _3245;
    wire _3244;
    wire _3243;
    wire _3239;
    wire _3238;
    wire _3237;
    wire _3236;
    wire _3235;
    wire _3234;
    wire _3233;
    wire [7:0] _3230;
    wire [6:0] _3167;
    wire [7:0] _3168;
    wire [6:0] _3165;
    wire [7:0] _3166;
    wire [7:0] _3169;
    wire [7:0] _3259;
    wire [7:0] _3260;
    wire [7:0] _3261;
    wire [7:0] _3262;
    wire [7:0] _3255;
    wire [7:0] _3256;
    wire [7:0] _3257;
    wire [7:0] _3258;
    wire [7:0] _3263;
    wire [7:0] _179;
    reg [7:0] g_byte;
    wire _1945;
    wire _1942;
    wire _1943;
    wire _1946;
    wire [7:0] _3231;
    wire _3232;
    wire [7:0] _3240;
    wire _181;
    wire [7:0] _3241;
    wire _3242;
    wire [2:0] _3271;
    wire [5:0] _1770;
    wire _1771;
    wire _1772;
    wire [9:0] _1766;
    wire _1768;
    wire _1769;
    wire _1773;
    wire _1774;
    wire [2:0] _3272;
    wire [2:0] _3273;
    wire [2:0] _3274;
    wire [2:0] _3275;
    wire [2:0] _3265;
    wire [2:0] _3266;
    wire [2:0] _3267;
    wire [2:0] _3268;
    wire [2:0] _3269;
    wire [2:0] _3276;
    wire [2:0] _3278;
    wire [2:0] _182;
    reg [2:0] g_bitpos;
    reg _3250;
    wire _184;
    wire [31:0] _186;
    wire [30:0] _3331;
    wire [31:0] _3333;
    wire _3324;
    wire _3325;
    wire [31:0] _3327;
    wire [30:0] _3321;
    wire [31:0] _3323;
    wire [31:0] _3328;
    wire [5:0] _3317;
    wire _3318;
    wire _3319;
    wire [9:0] _3312;
    wire _3314;
    wire _3315;
    wire _3311;
    wire _3316;
    wire _3320;
    wire [31:0] _3329;
    wire [31:0] _3330;
    wire [5:0] _188;
    wire [5:0] _3288;
    wire [5:0] _3289;
    wire [5:0] _3290;
    wire [5:0] _3291;
    wire [5:0] _3282;
    wire [5:0] _3283;
    wire [5:0] _3284;
    wire [5:0] _3285;
    wire [5:0] _3286;
    wire [5:0] _3292;
    wire [5:0] _3293;
    wire [5:0] _3295;
    wire [5:0] _189;
    reg [5:0] g_left;
    wire _1799;
    wire _1800;
    wire _2915;
    wire _2914;
    wire _2916;
    wire _2917;
    wire [31:0] _3334;
    wire [31:0] _3335;
    wire [31:0] _3336;
    wire [31:0] _191;
    wire _3302;
    wire _3303;
    wire [31:0] _3305;
    wire [30:0] _3299;
    wire [31:0] _3301;
    wire [31:0] _3306;
    wire [30:0] _3296;
    wire [31:0] _3298;
    wire [31:0] _3307;
    wire [31:0] _3308;
    wire [31:0] _3309;
    wire [31:0] _3310;
    wire [31:0] _3337;
    wire [31:0] _3338;
    wire [31:0] _3340;
    wire [31:0] _192;
    reg [31:0] g_crc;
    wire _2921;
    wire _2922;
    wire [7:0] _3356;
    wire [7:0] _3357;
    wire [7:0] _193;
    reg [7:0] g_lim;
    wire [15:0] _1762;
    wire [15:0] _195;
    wire [14:0] _2895;
    wire [15:0] _2896;
    wire [15:0] _3358;
    wire [15:0] _3359;
    wire [15:0] _3360;
    wire [15:0] _3362;
    wire [15:0] _196;
    reg [15:0] g_sr;
    wire [3:0] _3348;
    wire [3:0] _198;
    wire _3349;
    wire [3:0] _3350;
    wire [7:0] _3352;
    wire [5:0] _200;
    wire [7:0] _3346;
    wire [7:0] _3353;
    wire [15:0] _3354;
    wire _3355;
    wire _3383;
    wire [5:0] _202;
    wire [5:0] _3369;
    wire _3370;
    wire [9:0] _3365;
    wire _3367;
    wire _204;
    wire _3363;
    wire _206;
    wire _3364;
    wire _3368;
    wire _3371;
    wire _3373;
    wire _3374;
    wire _3375;
    wire _3376;
    wire _3377;
    wire _3379;
    wire _3381;
    wire _207;
    reg g_len_cap;
    wire _3384;
    wire _3386;
    wire _208;
    reg g_len_known;
    wire [15:0] _1763;
    wire [15:0] _3406;
    wire _1751;
    wire _1765;
    wire [15:0] _3407;
    wire _1750;
    wire [15:0] _3408;
    wire _3389;
    wire _3387;
    wire _3388;
    wire _3390;
    wire _3392;
    wire _209;
    reg g_last;
    wire _1637;
    wire _1634;
    wire _1638;
    wire _3394;
    wire _3395;
    wire _3396;
    wire _3398;
    wire _210;
    reg g_prev;
    wire _1631;
    wire _1628;
    wire _1632;
    wire _1639;
    wire _1640;
    wire _1641;
    wire [15:0] _3409;
    wire [15:0] _3400;
    wire [15:0] _3401;
    wire [15:0] _3402;
    wire [15:0] _3403;
    wire [15:0] _3404;
    wire [15:0] _3410;
    wire [15:0] _3412;
    wire [15:0] _211;
    reg [15:0] g_cnt;
    wire g_data_left;
    wire _3251;
    wire _3252;
    wire _3418;
    wire _3416;
    wire _3417;
    wire _3419;
    wire [2:0] _3423;
    wire _3414;
    wire [2:0] _3428;
    wire [2:0] _3429;
    wire [2:0] _3430;
    wire [2:0] _3448;
    wire [2:0] _3450;
    wire [2:0] _212;
    reg [2:0] g_run;
    wire _1625;
    wire [1:0] _214;
    wire _1620;
    wire _1621;
    wire _1626;
    wire _1794;
    wire _1801;
    wire _3464;
    wire _3465;
    wire _1789;
    wire _1787;
    wire _1790;
    wire _1791;
    wire _1792;
    wire _3457;
    wire _3454;
    wire _3451;
    wire _3452;
    wire _3455;
    wire _3456;
    wire _3458;
    wire _3466;
    wire _3468;
    wire _3470;
    wire _3472;
    wire _3474;
    wire _215;
    reg f_lane1_out;
    wire _1609;
    wire _1610;
    wire _1603;
    wire _1604;
    wire _1600;
    wire _217;
    wire _1597;
    wire _1598;
    wire _1599;
    wire _1601;
    wire _1605;
    wire _1606;
    wire _1611;
    wire [1:0] _3539;
    wire _1592;
    wire _1593;
    reg _1589;
    wire _1590;
    wire _1582;
    wire _1581;
    wire _1580;
    wire _1579;
    wire _1578;
    wire _1577;
    wire _1576;
    wire _1575;
    wire [2:0] _219;
    reg _1583;
    reg _1586;
    wire _1591;
    wire _221;
    wire _1594;
    wire _1573;
    wire _1570;
    wire _1563;
    wire _1561;
    wire [13:0] _1552;
    wire [15:0] _1553;
    wire [14:0] _1549;
    wire [15:0] _1550;
    wire [15:0] _1554;
    wire [14:0] _1546;
    wire [15:0] _1547;
    wire _1544;
    wire [15:0] _1555;
    reg [15:0] _1558;
    wire _1559;
    wire [13:0] _1536;
    wire [15:0] _1537;
    reg [15:0] _1540;
    wire _3520;
    wire _3521;
    wire [15:0] _3522;
    wire [15:0] _3524;
    wire [15:0] _3526;
    wire _3504;
    wire [14:0] _1565;
    wire [15:0] _1566;
    reg [15:0] _1569;
    wire [16:0] _3500;
    wire _3501;
    wire [16:0] _3494;
    reg [16:0] _3497;
    wire [16:0] _3489;
    wire [15:0] _223;
    wire [16:0] _3488;
    wire [16:0] _3490;
    reg [16:0] _3493;
    wire [7:0] _225;
    wire [8:0] _3508;
    wire [7:0] _3510;
    wire [7:0] _3511;
    wire [7:0] _3512;
    wire [7:0] _3514;
    wire [7:0] _226;
    reg [7:0] _3482;
    wire [8:0] _3507;
    wire [8:0] _3509;
    wire _3515;
    wire _3516;
    wire _3517;
    wire _3519;
    wire _227;
    reg _3487;
    wire [16:0] _3498;
    wire [16:0] _3484;
    wire _3499;
    wire _3502;
    wire _3505;
    wire _3483;
    wire _3506;
    wire [15:0] _3528;
    wire _3478;
    wire _3476;
    wire _688;
    wire _3475;
    wire _3477;
    wire _3479;
    wire [15:0] _3529;
    wire [15:0] _3531;
    wire [15:0] _228;
    reg [15:0] _1534;
    wire _1541;
    wire _1542;
    wire _1531;
    wire _1543;
    wire _1560;
    wire _1562;
    wire _1571;
    wire [1:0] _230;
    wire _1527;
    wire _1528;
    wire _1525;
    wire _1529;
    wire _1522;
    reg _1519;
    wire _1512;
    wire _1511;
    wire _1510;
    wire _1509;
    wire _1508;
    wire _1507;
    wire _1506;
    wire _1505;
    wire [2:0] _232;
    reg _1513;
    reg _1516;
    wire _1520;
    wire _1521;
    wire _1523;
    wire _1530;
    wire _1574;
    wire _234;
    wire _1595;
    wire _236;
    wire _1504;
    wire _1596;
    wire [1:0] _3591;
    wire _1782;
    wire [1:0] _3593;
    wire _3280;
    wire [1:0] _3600;
    wire _1501;
    wire [1:0] _3606;
    wire _1498;
    wire _1499;
    wire [1:0] _3608;
    wire [1:0] _237;
    reg [1:0] g_mode;
    wire _1503;
    wire _1785;
    wire _1793;
    wire _1947;
    wire _1949;
    wire _1940;
    wire _1939;
    wire _1941;
    wire _1950;
    wire _1931;
    wire _1929;
    wire _1932;
    wire _3609;
    wire _3610;
    wire _238;
    wire _3612;
    wire [2:0] _3615;
    wire [2:0] _239;
    reg [2:0] _3069;
    reg [7:0] _3127;
    wire [7:0] _3129;
    wire [6:0] _3220;
    wire [7:0] _3221;
    wire [6:0] _3218;
    wire [7:0] _3219;
    wire [7:0] _3222;
    wire [7:0] _3620;
    wire [7:0] _3621;
    wire [7:0] _3622;
    wire [7:0] _3623;
    wire [7:0] _3616;
    wire [7:0] _3617;
    wire [7:0] _3618;
    wire [7:0] _3619;
    wire [7:0] _3624;
    wire [7:0] _240;
    reg [7:0] g_byte_0;
    wire _1937;
    wire _1934;
    wire _1935;
    wire _1938;
    wire [7:0] _3130;
    wire _3131;
    wire [7:0] _3139;
    wire _242;
    wire [7:0] _3140;
    wire _3141;
    wire [2:0] _3632;
    wire [2:0] _3633;
    wire [2:0] _3634;
    wire [2:0] _3635;
    wire [2:0] _3636;
    wire [2:0] _3626;
    wire [2:0] _3627;
    wire [2:0] _3628;
    wire [2:0] _3629;
    wire [2:0] _3630;
    wire [2:0] _3637;
    wire [2:0] _3639;
    wire [2:0] _243;
    reg [2:0] g_bitpos_0;
    reg _3149;
    wire _245;
    wire [31:0] _247;
    wire [30:0] _3692;
    wire [31:0] _3694;
    wire _3685;
    wire _3686;
    wire [31:0] _3688;
    wire [30:0] _3682;
    wire [31:0] _3684;
    wire [31:0] _3689;
    wire [5:0] _3678;
    wire _3679;
    wire _3680;
    wire [9:0] _3673;
    wire _3675;
    wire _3676;
    wire _3672;
    wire _3677;
    wire _3681;
    wire [31:0] _3690;
    wire [31:0] _3691;
    wire [5:0] _249;
    wire [5:0] _3649;
    wire [5:0] _3650;
    wire [5:0] _3651;
    wire [5:0] _3652;
    wire [5:0] _3643;
    wire [5:0] _3644;
    wire [5:0] _3645;
    wire [5:0] _3646;
    wire [5:0] _3647;
    wire [5:0] _3653;
    wire [5:0] _3654;
    wire [5:0] _3656;
    wire [5:0] _250;
    reg [5:0] g_left_0;
    wire _1701;
    wire _1702;
    wire _2991;
    wire _2990;
    wire _2992;
    wire _2993;
    wire [31:0] _3695;
    wire [31:0] _3696;
    wire [31:0] _3697;
    wire [31:0] _252;
    wire _3663;
    wire _3664;
    wire [31:0] _3666;
    wire [30:0] _3660;
    wire [31:0] _3662;
    wire [31:0] _3667;
    wire [30:0] _3657;
    wire [31:0] _3659;
    wire [31:0] _3668;
    wire [31:0] _3669;
    wire [31:0] _3670;
    wire [31:0] _3671;
    wire [31:0] _3698;
    wire [31:0] _3699;
    wire [31:0] _3701;
    wire [31:0] _253;
    reg [31:0] g_crc_0;
    wire _2997;
    wire _2998;
    wire [7:0] _3717;
    wire [7:0] _3718;
    wire [7:0] _254;
    reg [7:0] g_lim_0;
    wire [15:0] _1664;
    wire [15:0] _256;
    wire [14:0] _2971;
    wire [15:0] _2972;
    wire [15:0] _3719;
    wire [15:0] _3720;
    wire [15:0] _3721;
    wire [15:0] _3723;
    wire [15:0] _257;
    reg [15:0] g_sr_0;
    wire [3:0] _3709;
    wire [3:0] _259;
    wire _3710;
    wire [3:0] _3711;
    wire [7:0] _3713;
    wire [5:0] _261;
    wire [7:0] _3707;
    wire [7:0] _3714;
    wire [15:0] _3715;
    wire _3716;
    wire _3744;
    wire [5:0] _263;
    wire [5:0] _3730;
    wire _3731;
    wire [9:0] _3726;
    wire _3728;
    wire _265;
    wire _3724;
    wire _267;
    wire _3725;
    wire _3729;
    wire _3732;
    wire _3734;
    wire _3735;
    wire _3736;
    wire _3737;
    wire _3738;
    wire _3740;
    wire _3742;
    wire _268;
    reg g_len_cap_0;
    wire _3745;
    wire _3747;
    wire _269;
    reg g_len_known_0;
    wire [15:0] _1665;
    wire [15:0] _3767;
    wire [15:0] _3768;
    wire _1652;
    wire [15:0] _3769;
    wire _3750;
    wire _3748;
    wire _3749;
    wire _3751;
    wire _3753;
    wire _270;
    reg g_last_0;
    wire _1485;
    wire _1482;
    wire _1486;
    wire _3755;
    wire _3756;
    wire _3757;
    wire _3759;
    wire _271;
    reg g_prev_0;
    wire _1479;
    wire _1476;
    wire _1480;
    wire _1487;
    wire _1488;
    wire _1489;
    wire [15:0] _3770;
    wire [15:0] _3761;
    wire [15:0] _3762;
    wire [15:0] _3763;
    wire [15:0] _3764;
    wire [15:0] _3765;
    wire [15:0] _3771;
    wire [15:0] _3773;
    wire [15:0] _272;
    reg [15:0] g_cnt_0;
    wire g_data_left_0;
    wire _3150;
    wire _3151;
    wire _3779;
    wire _3777;
    wire _3778;
    wire _3780;
    wire [2:0] _3784;
    wire _3775;
    wire [2:0] _3789;
    wire [2:0] _3790;
    wire [2:0] _3791;
    wire [2:0] _3809;
    wire [2:0] _3811;
    wire [2:0] _273;
    reg [2:0] g_run_0;
    wire _1473;
    wire [1:0] _275;
    wire _1468;
    wire _1469;
    wire _1474;
    wire _1696;
    wire _1703;
    wire _3825;
    wire _1686;
    wire _1687;
    wire _1695;
    wire _3826;
    wire _1691;
    wire _1689;
    wire _1692;
    wire _1693;
    wire _1694;
    wire _3818;
    wire _3815;
    wire _3812;
    wire _3813;
    wire _3816;
    wire _3817;
    wire _3819;
    wire _3827;
    wire _3829;
    wire _3831;
    wire _3833;
    wire _3835;
    wire _276;
    reg f_lane0_out;
    wire _1457;
    wire _1458;
    wire _1440;
    wire _1441;
    reg _1437;
    wire _1438;
    wire _1430;
    wire _1429;
    wire _1428;
    wire _1427;
    wire _1426;
    wire _1425;
    wire _1424;
    wire _1423;
    wire [2:0] _278;
    reg _1431;
    reg _1434;
    wire _1439;
    wire _280;
    wire _1442;
    wire _1421;
    wire _1418;
    wire _1411;
    wire _1409;
    wire [13:0] _1400;
    wire [15:0] _1401;
    wire [14:0] _1397;
    wire [15:0] _1398;
    wire [15:0] _1402;
    wire [14:0] _1394;
    wire [15:0] _1395;
    wire _1392;
    wire [15:0] _1403;
    reg [15:0] _1406;
    wire _1407;
    wire [13:0] _1384;
    wire [15:0] _1385;
    reg [15:0] _1388;
    wire _3881;
    wire _3882;
    wire [15:0] _3883;
    wire [15:0] _3885;
    wire [15:0] _3887;
    wire _3865;
    wire [14:0] _1413;
    wire [15:0] _1414;
    reg [15:0] _1417;
    wire [16:0] _3861;
    wire _3862;
    wire [16:0] _3855;
    reg [16:0] _3858;
    wire [15:0] _282;
    wire [16:0] _3849;
    wire [16:0] _3851;
    reg [16:0] _3854;
    wire [7:0] _284;
    wire [8:0] _3869;
    wire [7:0] _3871;
    wire [7:0] _3872;
    wire [7:0] _3873;
    wire [7:0] _3875;
    wire [7:0] _285;
    reg [7:0] _3843;
    wire [8:0] _3868;
    wire [8:0] _3870;
    wire _3876;
    wire _3877;
    wire _3878;
    wire _3880;
    wire _286;
    reg _3848;
    wire [16:0] _3859;
    wire [16:0] _3845;
    wire _3860;
    wire _3863;
    wire _3866;
    wire _3844;
    wire _3867;
    wire [15:0] _3889;
    wire _3839;
    wire _3837;
    wire _674;
    wire _3836;
    wire _3838;
    wire _3840;
    wire [15:0] _3890;
    wire [15:0] _3892;
    wire [15:0] _287;
    reg [15:0] _1382;
    wire _1389;
    wire _1390;
    wire _1379;
    wire _1391;
    wire _1408;
    wire _1410;
    wire _1419;
    wire _1375;
    wire _1376;
    wire _1373;
    wire _1377;
    wire _1370;
    reg _1367;
    wire _1360;
    wire _1359;
    wire _1358;
    wire _1357;
    wire _1356;
    wire _1355;
    wire _1354;
    wire _1353;
    wire [2:0] _289;
    reg _1361;
    reg _1364;
    wire _1368;
    wire _1369;
    wire _1371;
    wire _1378;
    wire _1422;
    wire _1443;
    wire [1:0] _291;
    wire _1451;
    wire _1452;
    wire _293;
    wire _1448;
    wire _295;
    wire _297;
    wire _1445;
    wire _1446;
    wire _1447;
    wire _1449;
    wire _1453;
    wire _1454;
    wire _1459;
    wire [1:0] _3904;
    wire [1:0] _3956;
    wire _1684;
    wire [1:0] _3958;
    wire _3641;
    wire [1:0] _3965;
    wire _1349;
    wire [1:0] _3971;
    wire [2:0] _2615;
    wire [2:0] _2614;
    wire [2:0] _2613;
    wire [2:0] _2612;
    reg [2:0] _2616;
    wire _2608;
    wire _2607;
    wire _2606;
    wire _2605;
    reg _2609;
    wire _3893;
    wire _3894;
    wire [2:0] _3896;
    wire [2:0] _298;
    wire _1346;
    wire _1347;
    wire [1:0] _3973;
    wire [1:0] _299;
    reg [1:0] g_mode_0;
    wire _1351;
    wire _1352;
    wire _1444;
    wire _1653;
    wire _1667;
    wire _1676;
    wire _1682;
    wire _1718;
    wire _3047;
    wire _301;
    wire _3048;
    wire _302;
    wire _3075;
    wire _3077;
    wire _3974;
    wire [3:0] _3980;
    reg [3:0] _3983;
    wire [3:0] _303;
    wire _660;
    wire [7:0] _3985;
    wire [1:0] _1926;
    wire [1:0] _1924;
    wire [1:0] _1923;
    wire [1:0] _1922;
    wire [1:0] _1921;
    reg [1:0] _1925;
    wire [1:0] _1927;
    reg [7:0] _3997;
    wire [7:0] _3998;
    wire [7:0] _304;
    reg [7:0] _653;
    wire _654;
    wire [7:0] _4009;
    wire [7:0] _4008;
    wire [7:0] _4007;
    wire [1:0] _4004;
    wire [111:0] _773;
    wire [1:0] _4002;
    wire [111:0] _767;
    wire [1:0] _4001;
    wire [1:0] _4000;
    wire [1:0] _3999;
    reg [1:0] _4003;
    wire [1:0] _4005;
    reg [7:0] _4010;
    wire [7:0] _4011;
    wire [7:0] _305;
    reg [7:0] _648;
    wire _650;
    wire [3:0] _878;
    reg _879;
    wire _881;
    wire [15:0] _873;
    wire _875;
    wire [15:0] _864;
    wire [16:0] _865;
    wire [16:0] _866;
    reg [16:0] _869;
    wire _870;
    wire _871;
    wire [15:0] _860;
    wire _862;
    wire [2:0] _608;
    wire [2:0] _4026;
    wire _4022;
    wire _4023;
    wire _4020;
    wire _4024;
    wire [2:0] _4027;
    wire _4017;
    wire _4018;
    wire _4016;
    wire _4019;
    wire [2:0] _4029;
    wire _4013;
    wire [2:0] _4015;
    wire _4012;
    wire [2:0] _4030;
    wire [2:0] _306;
    reg [2:0] _604;
    wire _606;
    wire [2:0] _609;
    wire _599;
    wire _600;
    wire _598;
    wire _601;
    wire [2:0] _611;
    wire _595;
    wire _596;
    wire [2:0] _612;
    wire _844;
    wire [2:0] _846;
    wire [2:0] _587;
    wire [2:0] _4045;
    wire _4041;
    wire _4042;
    wire _4039;
    wire _4043;
    wire [2:0] _4046;
    wire _4036;
    wire _4037;
    wire _4035;
    wire _4038;
    wire [2:0] _4048;
    wire _4032;
    wire [2:0] _4034;
    wire _4031;
    wire [2:0] _4049;
    wire [2:0] _307;
    reg [2:0] _583;
    wire _585;
    wire [2:0] _588;
    wire _578;
    wire _579;
    wire _577;
    wire _580;
    wire [2:0] _590;
    wire _574;
    wire _575;
    wire [2:0] _591;
    wire _841;
    wire [2:0] _843;
    wire _847;
    wire [2:0] _848;
    wire [2:0] _564;
    wire [2:0] _4064;
    wire _4060;
    wire _4061;
    wire _4058;
    wire _4062;
    wire [2:0] _4065;
    wire _4055;
    wire _4056;
    wire _4054;
    wire _4057;
    wire [2:0] _4067;
    wire _4051;
    wire [2:0] _4053;
    wire _4050;
    wire [2:0] _4068;
    wire [2:0] _308;
    reg [2:0] _560;
    wire _562;
    wire [2:0] _565;
    wire _555;
    wire _556;
    wire _554;
    wire _557;
    wire [2:0] _567;
    wire _551;
    wire _552;
    wire [2:0] _568;
    wire _836;
    wire [2:0] _838;
    wire [2:0] _543;
    wire [2:0] _4083;
    wire _4079;
    wire _4080;
    wire _4077;
    wire _4081;
    wire [2:0] _4084;
    wire _4074;
    wire _4075;
    wire _4073;
    wire _4076;
    wire [2:0] _4086;
    wire _4070;
    wire [2:0] _4072;
    wire _4069;
    wire [2:0] _4087;
    wire [2:0] _309;
    reg [2:0] _539;
    wire _541;
    wire [2:0] _544;
    wire _534;
    wire _535;
    wire _533;
    wire _536;
    wire [2:0] _546;
    wire _530;
    wire _531;
    wire [2:0] _547;
    wire _833;
    wire [2:0] _835;
    wire _839;
    wire [2:0] _840;
    wire _849;
    wire [2:0] _850;
    wire [2:0] _518;
    wire [2:0] _4102;
    wire _4098;
    wire _4099;
    wire _4096;
    wire _4100;
    wire [2:0] _4103;
    wire _4093;
    wire _4094;
    wire _4092;
    wire _4095;
    wire [2:0] _4105;
    wire _4089;
    wire [2:0] _4091;
    wire _4088;
    wire [2:0] _4106;
    wire [2:0] _310;
    reg [2:0] _514;
    wire _516;
    wire [2:0] _519;
    wire _509;
    wire _510;
    wire _508;
    wire _511;
    wire [2:0] _521;
    wire _505;
    wire _506;
    wire [2:0] _522;
    wire _826;
    wire [2:0] _828;
    wire [2:0] _497;
    wire [2:0] _4121;
    wire _4117;
    wire _4118;
    wire _4115;
    wire _4119;
    wire [2:0] _4122;
    wire _4112;
    wire _4113;
    wire _4111;
    wire _4114;
    wire [2:0] _4124;
    wire _4108;
    wire [2:0] _4110;
    wire _4107;
    wire [2:0] _4125;
    wire [2:0] _311;
    reg [2:0] _493;
    wire _495;
    wire [2:0] _498;
    wire _488;
    wire _489;
    wire _487;
    wire _490;
    wire [2:0] _500;
    wire _484;
    wire _485;
    wire [2:0] _501;
    wire _823;
    wire [2:0] _825;
    wire _829;
    wire [2:0] _830;
    wire [2:0] _474;
    wire [2:0] _4140;
    wire _4136;
    wire _4137;
    wire _4134;
    wire _4138;
    wire [2:0] _4141;
    wire _4131;
    wire _4132;
    wire _4130;
    wire _4133;
    wire [2:0] _4143;
    wire _4127;
    wire [2:0] _4129;
    wire _4126;
    wire [2:0] _4144;
    wire [2:0] _312;
    reg [2:0] _470;
    wire _472;
    wire [2:0] _475;
    wire _465;
    wire _466;
    wire _464;
    wire _467;
    wire [2:0] _477;
    wire _461;
    wire _462;
    wire [2:0] _478;
    wire _818;
    wire [2:0] _820;
    wire [2:0] _453;
    wire [2:0] _4159;
    wire _4155;
    wire _4156;
    wire _4153;
    wire _4157;
    wire [2:0] _4160;
    wire _4150;
    wire _4151;
    wire _4149;
    wire _4152;
    wire [2:0] _4162;
    wire _4146;
    wire [2:0] _4148;
    wire _4145;
    wire [2:0] _4163;
    wire [2:0] _313;
    reg [2:0] _449;
    wire _451;
    wire [2:0] _454;
    wire _444;
    wire _445;
    wire _443;
    wire _446;
    wire [2:0] _456;
    wire _440;
    wire _441;
    wire [2:0] _457;
    wire [7:0] _814;
    wire _815;
    wire [2:0] _817;
    wire _821;
    wire [2:0] _822;
    wire _831;
    wire [2:0] _832;
    wire _851;
    wire [2:0] _852;
    wire [16:0] _853;
    wire _4166;
    wire [127:0] _4167;
    wire _4164;
    wire [127:0] _4168;
    wire [127:0] _314;
    reg [127:0] _362;
    wire _429;
    wire _430;
    wire [127:0] _431;
    wire _4171;
    wire [127:0] _4172;
    wire _4169;
    wire [127:0] _4173;
    wire [127:0] _315;
    reg [127:0] _359;
    wire _425;
    wire _426;
    wire [127:0] _427;
    wire _4176;
    wire [127:0] _4177;
    wire _4174;
    wire [127:0] _4178;
    wire [127:0] _316;
    reg [127:0] _356;
    wire _421;
    wire _422;
    wire [127:0] _423;
    wire [127:0] _318;
    wire _417;
    wire _418;
    wire [127:0] _419;
    wire [511:0] _432;
    wire [111:0] _810;
    wire [15:0] _811;
    wire [16:0] _812;
    wire [16:0] _854;
    reg [16:0] _857;
    wire gnd;
    wire [16:0] _809;
    wire _858;
    wire _859;
    wire _863;
    wire _872;
    wire [15:0] _4206;
    wire _4202;
    wire _4203;
    wire _4204;
    wire [15:0] _4207;
    wire _4186;
    wire _4187;
    wire [15:0] _4209;
    wire [15:0] _4211;
    wire [15:0] _319;
    reg [15:0] _405;
    wire [15:0] _4223;
    wire _4219;
    wire _4220;
    wire [8:0] _4198;
    wire _4199;
    wire [5:0] _4196;
    wire [5:0] _4195;
    wire _4197;
    wire [8:0] _4190;
    wire [8:0] _4212;
    wire [8:0] _4213;
    wire [8:0] _4215;
    wire [8:0] _320;
    reg [8:0] _4191;
    wire [2:0] _4192;
    wire _4194;
    wire [1:0] _4188;
    reg _4200;
    wire _4221;
    wire [15:0] _4224;
    wire _4216;
    wire _4217;
    wire [15:0] _4226;
    wire [15:0] _4228;
    wire [15:0] _321;
    reg [15:0] _402;
    wire [1:0] _805;
    reg [15:0] _806;
    wire _808;
    wire _876;
    reg [7:0] _387;
    wire [7:0] f_chg_now;
    wire _4230;
    wire [7:0] _4232;
    wire _4229;
    wire [7:0] _4233;
    wire [7:0] _4235;
    wire [7:0] _322;
    reg [7:0] _384;
    wire [7:0] f_changed_all;
    wire [7:0] _799;
    wire _801;
    wire _802;
    wire [7:0] f_chgmask1;
    wire _798;
    wire _803;
    wire [7:0] _792;
    wire [7:0] _790;
    wire vdd;
    wire _324;
    wire _326;
    wire [7:0] _328;
    reg [7:0] _368;
    reg [7:0] _371;
    wire [7:0] _791;
    wire [7:0] _793;
    wire _795;
    wire [111:0] _761;
    wire f_valid1;
    wire _796;
    wire _804;
    wire _877;
    wire _882;
    wire _921;
    wire _922;
    wire _926;
    wire f_fire1;
    wire [1:0] _1070;
    wire [1:0] f_winner;
    reg [2:0] _4183;
    wire [2:0] _4185;
    wire _4236;
    wire _1853;
    wire f_in_fetch;
    wire _1854;
    wire _1855;
    wire _4237;
    wire [15:0] _4246;
    wire [15:0] _4248;
    wire [15:0] _329;
    reg [15:0] _399;
    wire [1:0] _2071;
    reg [15:0] _2072;
    wire [15:0] _2070;
    wire _2073;
    wire [63:0] _756;
    wire _2068;
    wire _2066;
    wire _2067;
    wire _2069;
    wire _2074;
    wire _2079;
    wire _2087;
    wire f_viol_now;
    wire [2:0] _4254;
    wire [2:0] _4257;
    wire _4250;
    wire [2:0] _4258;
    wire _4249;
    wire [2:0] _4261;
    wire [2:0] _4263;
    wire [2:0] _330;
    reg [2:0] _415;
    wire _4266;
    wire [127:0] _4267;
    wire _4264;
    wire [127:0] _4268;
    wire [127:0] _331;
    reg [127:0] _353;
    wire [511:0] _363;
    wire [111:0] _364;
    wire f_valid0;
    wire _378;
    wire _395;
    wire _644;
    wire _701;
    wire _745;
    wire f_in_eval;
    wire _746;
    wire _755;
    wire f_fire0;
    wire _1156;
    wire _1157;
    wire _1252;
    wire [1:0] _4287;
    wire _4272;
    wire [1:0] _4274;
    wire _4270;
    wire [1:0] _4288;
    wire _4269;
    wire [1:0] _4291;
    wire _333;
    wire [1:0] _4293;
    wire [1:0] _4295;
    wire [1:0] _334;
    reg [1:0] _348;
    wire _1310;
    wire _336;
    wire _2722;
    wire _2724;
    wire _4297;
    wire _4307;
    wire _337;
    reg f_sweeping;
    wire _4319;
    wire _338;
    reg f_image_valid;
    wire _340;
    wire _2023;
    wire [7:0] _4343;
    wire [7:0] _341;
    reg [7:0] f_pout;
    wire _2647;
    wire [23:0] _343;
    wire [2:0] _2643;
    reg _2654;
    wire [7:0] _2718;
    wire [7:0] _4345;
    assign _1303 = _77[11:0];
    assign _1300 = _1293 < _1290;
    assign _1301 = _1275 & _1300;
    assign _1302 = _1301 ? _1290 : _1293;
    assign _1304 = _1302 < _1303;
    assign _1305 = _1304 ? _1303 : _1302;
    assign _1306 = _1286 ? _1302 : _1305;
    assign _1292 = 12'b000000000000;
    assign _1149 = 12'b111111111111;
    assign _1146 = _1144[11:0];
    assign _1143 = 13'b0000000000000;
    assign _1140 = 10'b0000000000;
    assign _1141 = { _1140,
                     _1137 };
    assign _1142 = _1133 - _1141;
    assign _1136 = 3'b000;
    always @* begin
        case (f_winner)
        0:
            _1116 <= _715;
        1:
            _1116 <= _891;
        2:
            _1116 <= _1029;
        default:
            _1116 <= _1115;
        endcase
    end
    assign _1 = _1116;
    always @(posedge _326) begin
        if (_324)
            _1137 <= _1136;
        else
            _1137 <= _1;
    end
    assign _1138 = { _1140,
                     _1137 };
    assign _1123 = 13'b1111111111111;
    assign _1122 = _1120[12:0];
    assign _1117 = 16'b0001111111111111;
    assign _1121 = _1117 < _1120;
    assign _1124 = _1121 ? _1123 : _1122;
    assign _2 = _1124;
    always @(posedge _326) begin
        if (_324)
            _1133 <= _1143;
        else
            _1133 <= _2;
    end
    assign _1139 = _1133 < _1138;
    assign _1144 = _1139 ? _1143 : _1142;
    assign _1130 = 13'b0111111111111;
    assign _1145 = _1130 < _1144;
    assign _1148 = _1145 ? _1149 : _1146;
    assign _1128 = 1'b0;
    assign _1125 = 16'b1111111111111111;
    assign _1126 = _1120 == _1125;
    assign _3 = _1126;
    always @(posedge _326) begin
        if (_324)
            _1129 <= _1128;
        else
            _1129 <= _3;
    end
    assign _1150 = _1129 ? _1149 : _1148;
    assign _4 = _1150;
    always @(posedge _326) begin
        if (_324)
            _1293 <= _1292;
        else
            _1293 <= _4;
    end
    assign _1153 = _1120[11:0];
    always @* begin
        case (f_winner)
        0:
            _1119 <= _396;
        1:
            _1119 <= _805;
        2:
            _1119 <= _943;
        default:
            _1119 <= _1118;
        endcase
    end
    always @* begin
        case (_1119)
        0:
            _1120 <= _399;
        1:
            _1120 <= _402;
        2:
            _1120 <= _405;
        default:
            _1120 <= _405;
        endcase
    end
    assign _1151 = 16'b0000111111111111;
    assign _1152 = _1151 < _1120;
    assign _1155 = _1152 ? _1149 : _1153;
    assign _5 = _1155;
    always @(posedge _326) begin
        if (_324)
            _1290 <= _1292;
        else
            _1290 <= _5;
    end
    assign _1294 = _1290 < _1293;
    assign _1295 = _1275 & _1294;
    assign _1296 = _1295 ? _1290 : _1293;
    assign _1287 = _77[23:12];
    assign _1297 = _1287 < _1296;
    assign _1298 = _1297 ? _1287 : _1296;
    assign _1285 = 8'b00000000;
    assign _1286 = _1270 == _1285;
    assign _1299 = _1286 ? _1296 : _1298;
    assign _1283 = 8'b11111111;
    assign _1282 = _1280[7:0];
    assign _1277 = 2'b10;
    assign _1276 = 2'b01;
    assign _1265 = _1261 == _1264;
    assign _1257 = _1253 & _1256;
    assign _1266 = _1257 & _1265;
    assign _6 = _1266;
    always @(posedge _326) begin
        if (_324)
            _1275 <= _1128;
        else
            _1275 <= _6;
    end
    assign _1278 = _1275 ? _1277 : _1276;
    assign _1272 = 7'b0000000;
    assign _1279 = { _1272,
                     _1278 };
    assign _1270 = _77[31:24];
    assign _1271 = { gnd,
                     _1270 };
    assign _1280 = _1271 + _1279;
    assign _1281 = _1280[8:8];
    assign _1284 = _1281 ? _1283 : _1282;
    assign _1307 = { _1284,
                     _1299,
                     _1306 };
    assign _8 = host_cov_wdata;
    assign _1308 = _1269 ? _1307 : _8;
    assign _1321 = _1269 | f_host_cov_we;
    assign _1319 = ~ f_sweeping;
    assign _1314 = ~ _1256;
    assign _1312 = ~ _1269;
    assign _1311 = _48 & _1310;
    assign _1313 = _1311 & _1312;
    assign _1315 = _1313 & _1314;
    assign f_host_cov_we = _1315 & _1319;
    assign _1323 = ~ f_host_cov_we;
    assign _1322 = ~ _1269;
    assign _1324 = _1322 & _1323;
    assign _12 = _1264;
    always @(posedge _326) begin
        if (_324)
            _1328 <= _1285;
        else
            _1328 <= _12;
    end
    assign _14 = host_cov_addr;
    assign _1325 = _1256 ? _1264 : _14;
    assign _1329 = _1269 ? _1328 : _1325;
    assign _17 = host_rec_wdata;
    assign _1336 = _1335 | f_sweeping;
    assign _1342 = _415[1:0];
    assign _1343 = { _1260,
                     _1342 };
    assign _1340 = f_sw_cnt[11:4];
    assign _22 = host_rec_waddr;
    assign _1341 = f_sweeping ? _1340 : _22;
    assign _1333 = 3'b100;
    assign _1334 = _415 < _1333;
    assign _1335 = f_in_fetch & _1334;
    assign _1344 = _1335 ? _1343 : _1341;
    assign _1490 = 3'b001;
    assign _1491 = _1489 ? _1490 : _1466;
    assign _1463 = 3'b010;
    assign _1465 = f_lane0_out ? _1333 : _1463;
    assign _1466 = _1459 ? _1465 : _1462;
    assign _1492 = _1444 ? _1491 : _1466;
    assign _1494 = _1349 ? _1136 : _1492;
    assign _1496 = _1347 ? _1136 : _1494;
    assign _24 = _1496;
    always @(posedge _326) begin
        if (_324)
            _1462 <= _1136;
        else
            _1462 <= _24;
    end
    assign _1650 = { _674,
                     _677,
                     _680,
                     _683,
                     gnd,
                     _1462 };
    assign _1643 = _1641 ? _1490 : _1618;
    assign _1617 = f_lane1_out ? _1333 : _1463;
    assign _1618 = _1611 ? _1617 : _1614;
    assign _1644 = _1596 ? _1643 : _1618;
    assign _1646 = _1501 ? _1136 : _1644;
    assign _1648 = _1499 ? _1136 : _1646;
    assign _25 = _1648;
    always @(posedge _326) begin
        if (_324)
            _1614 <= _1136;
        else
            _1614 <= _25;
    end
    assign _1649 = { _688,
                     _691,
                     _694,
                     _697,
                     gnd,
                     _1614 };
    assign _1651 = { _1649,
                     _1650 };
    assign _1742 = 8'b00000001;
    assign _1743 = _1737 + _1742;
    assign _1739 = _1737 == _1283;
    assign _1740 = ~ _1739;
    assign _1732 = ~ _1682;
    assign _1729 = _1711 == _1136;
    assign _1730 = ~ _1729;
    assign _1726 = _1351 | _674;
    assign _1723 = ~ _1684;
    assign _1724 = _1347 & _1723;
    assign _1725 = _1724 & _297;
    assign _1727 = _1725 & _1726;
    assign _1731 = _1727 & _1730;
    assign _1733 = _1731 & _1732;
    assign _1722 = _1718 & _1721;
    assign _1734 = _1722 | _1733;
    assign _1741 = _1734 & _1740;
    assign _1744 = _1741 ? _1743 : _1737;
    assign _1746 = _32 ? _1285 : _1744;
    assign _27 = _1746;
    always @(posedge _326) begin
        if (_324)
            _1737 <= _1285;
        else
            _1737 <= _27;
    end
    assign _1845 = _1839 + _1742;
    assign _1841 = _1839 == _1283;
    assign _1842 = ~ _1841;
    assign _1834 = ~ _1780;
    assign _1831 = _1809 == _1136;
    assign _1832 = ~ _1831;
    assign _1828 = _1503 | _688;
    assign _1825 = ~ _1782;
    assign _1826 = _1499 & _1825;
    assign _1827 = _1826 & _236;
    assign _1829 = _1827 & _1828;
    assign _1833 = _1829 & _1832;
    assign _1835 = _1833 & _1834;
    assign _1721 = _301 ? _1720 : _662;
    assign _1823 = _1820 & _1721;
    assign _1824 = _1822 | _1823;
    assign _1836 = _1824 | _1835;
    assign _1843 = _1836 & _1842;
    assign _1846 = _1843 ? _1845 : _1839;
    assign _1848 = _32 ? _1285 : _1846;
    assign _28 = _1848;
    always @(posedge _326) begin
        if (_324)
            _1839 <= _1285;
        else
            _1839 <= _28;
    end
    assign _1885 = _1879 + _1742;
    assign _1881 = _1879 == _1283;
    assign _1882 = ~ _1881;
    assign _1875 = _1872 & _662;
    assign _1876 = _1874 | _1875;
    assign _1883 = _1876 & _1882;
    assign _1886 = _1883 ? _1885 : _1879;
    assign _1888 = _32 ? _1285 : _1886;
    assign _29 = _1888;
    always @(posedge _326) begin
        if (_324)
            _1879 <= _1285;
        else
            _1879 <= _29;
    end
    assign _1900 = _1894 + _1742;
    assign _1896 = _1894 == _1283;
    assign _1897 = ~ _1896;
    assign _1898 = _1891 & _1897;
    assign _1901 = _1898 ? _1900 : _1894;
    assign _1903 = _32 ? _1285 : _1901;
    assign _30 = _1903;
    always @(posedge _326) begin
        if (_324)
            _1894 <= _1285;
        else
            _1894 <= _30;
    end
    assign _1916 = _1910 + _1742;
    assign _1912 = _1910 == _1283;
    assign _1913 = ~ _1912;
    assign _1914 = _1907 & _1913;
    assign _1917 = _1914 ? _1916 : _1910;
    assign _32 = host_drop_clear;
    assign _1919 = _32 ? _1285 : _1917;
    assign _33 = _1919;
    always @(posedge _326) begin
        if (_324)
            _1910 <= _1285;
        else
            _1910 <= _33;
    end
    assign _1920 = { _1910,
                     _1894,
                     _1879,
                     _1839,
                     _1737 };
    assign _1955 = 1'b1;
    assign _1933 = _1855 & _1932;
    assign _1951 = _1933 & _1950;
    assign _1956 = _1951 ? _1955 : _1954;
    assign _1958 = _50 ? _1128 : _1956;
    assign _35 = _1958;
    always @(posedge _326) begin
        if (_324)
            _1954 <= _1128;
        else
            _1954 <= _35;
    end
    assign _1964 = { _1962,
                     _1963 };
    assign _2014 = _2010 ? _2002 : _2013;
    assign _2016 = _50 ? _1136 : _2014;
    assign _40 = _2016;
    always @(posedge _326) begin
        if (_324)
            _2013 <= _1136;
        else
            _2013 <= _40;
    end
    assign _2009 = ~ _2008;
    assign _1999 = _1966 ? _1490 : _1463;
    assign _1995 = 3'b011;
    assign _1996 = _1979 ? _1995 : _1333;
    assign _2000 = _1974 ? _1999 : _1996;
    assign _1992 = 3'b101;
    assign _1991 = 3'b110;
    assign _1993 = _1986 ? _1992 : _1991;
    assign _2001 = _1983 ? _2000 : _1993;
    assign _1987 = _162 & _301;
    assign _1984 = _124 | _48;
    assign _1985 = _1984 | _46;
    assign _1986 = f_sweeping & _1985;
    assign _1988 = _1986 | _1987;
    assign _1980 = ~ f_image_valid;
    assign _1981 = _340 & _1980;
    assign _1962 = _1525 | _1503;
    assign _1977 = _43[1:1];
    assign _1978 = _1977 & _1962;
    assign _1963 = _1373 | _1351;
    assign _43 = host_lane_we;
    assign _1975 = _43[0:0];
    assign _1976 = _1975 & _1963;
    assign _1979 = _1976 | _1978;
    assign _1982 = _1979 | _1981;
    assign _44 = _1256;
    always @(posedge _326) begin
        if (_324)
            _1269 <= _1128;
        else
            _1269 <= _44;
    end
    assign _1971 = _1256 | _1269;
    assign _1970 = _48 & _1310;
    assign _1972 = _1970 & _1971;
    assign _1968 = ~ _1310;
    assign _46 = host_cov_re;
    assign _48 = host_cov_we;
    assign _1967 = _48 | _46;
    assign _1969 = _1967 & _1968;
    assign _1973 = _1969 | _1972;
    assign _1965 = ~ _1310;
    assign _1966 = _124 & _1965;
    assign _1974 = _1966 | _1973;
    assign _1983 = _1974 | _1982;
    assign _1989 = _1983 | _1988;
    assign _2002 = _1989 ? _2001 : _1136;
    assign _2004 = _2002 == _1136;
    assign _2005 = ~ _2004;
    assign _2010 = _2005 & _2009;
    assign _2018 = _2010 ? _1955 : _2008;
    assign _50 = host_err_clear;
    assign _2020 = _50 ? _1128 : _2018;
    assign _51 = _2020;
    always @(posedge _326) begin
        if (_324)
            _2008 <= _1128;
        else
            _2008 <= _51;
    end
    assign _53 = _1261;
    always @(posedge _326) begin
        if (_324)
            _1264 <= _1285;
        else
            _1264 <= _53;
    end
    assign _1261 = { _1260,
                     f_winner };
    assign _1905 = _1261 == _1264;
    assign _1906 = ~ _1905;
    assign _2021 = ~ _1256;
    assign _2022 = _1253 & _2021;
    assign _54 = _2022;
    always @(posedge _326) begin
        if (_324)
            _1256 <= _1128;
        else
            _1256 <= _54;
    end
    assign _56 = host_cover_en;
    assign _1253 = _1252 & _56;
    assign _1904 = _1253 & _1256;
    assign _1907 = _1904 & _1906;
    assign _2028 = _1907 ? _1955 : _2026;
    assign _2030 = _2023 ? _1128 : _2028;
    assign _57 = _2030;
    always @(posedge _326) begin
        if (_324)
            _2026 <= _1128;
        else
            _2026 <= _57;
    end
    assign _1891 = _91 & _1890;
    assign _2035 = _1891 ? _1955 : _2033;
    assign _2037 = _2023 ? _1128 : _2035;
    assign _59 = _2037;
    always @(posedge _326) begin
        if (_324)
            _2033 <= _1128;
        else
            _2033 <= _59;
    end
    assign _2041 = _302 & _1720;
    assign _1873 = ~ _1872;
    assign _1866 = _1851 & _1865;
    assign _1874 = _1866 & _1873;
    assign _1821 = ~ _1820;
    assign _1817 = _1749 & _1816;
    assign _1822 = _1817 & _1821;
    assign _2038 = _1822 | _1874;
    assign _61 = _2038;
    assign _2039 = f_rx_push & _662;
    assign _2040 = _2039 | _61;
    assign _2042 = _2040 | _2041;
    assign _2047 = _2042 ? _1955 : _2045;
    assign _2049 = _2023 ? _1128 : _2047;
    assign _62 = _2049;
    always @(posedge _326) begin
        if (_324)
            _2045 <= _1128;
        else
            _2045 <= _62;
    end
    assign _2053 = _756[61:61];
    assign _2054 = _1854 & _2053;
    assign _2059 = _2054 ? _1955 : _2057;
    assign _66 = host_irq_ack;
    assign _2061 = _66 ? _1128 : _2059;
    assign _2063 = _2023 ? _1128 : _2061;
    assign _67 = _2063;
    always @(posedge _326) begin
        if (_324)
            _2057 <= _1128;
        else
            _2057 <= _67;
    end
    assign _2092 = f_policy == _2091;
    assign _2094 = _2092 ? _1955 : _2052;
    assign _2090 = f_policy == _2565;
    assign _2096 = _2090 ? _1955 : _2094;
    assign _2097 = f_viol_now ? _2096 : _2052;
    assign _2098 = _1252 ? _2052 : _2097;
    assign _2065 = _348 == _1277;
    assign _2099 = _2065 ? _2098 : _2052;
    assign _2101 = _2023 ? _1128 : _2099;
    assign _68 = _2101;
    always @(posedge _326) begin
        if (_324)
            _2052 <= _1128;
        else
            _2052 <= _68;
    end
    assign _2116 = ~ _2115;
    assign _70 = host_tx_wm;
    assign _2109 = { gnd,
                     _70 };
    assign _2110 = _2109 < _303;
    assign _2111 = ~ _2110;
    assign _72 = host_tx_wm_en;
    assign _2112 = _72 & _2111;
    assign _74 = host_rx_wm;
    assign _2103 = _74 == _1136;
    assign _2105 = _2103 ? _1490 : _74;
    assign _2106 = { gnd,
                     _2105 };
    assign _2107 = _160 < _2106;
    assign _2108 = ~ _2107;
    assign _2113 = _2108 | _2112;
    assign _2117 = _2113 | _2116;
    assign _2118 = _2117 | _2052;
    assign _2119 = _2118 | _2057;
    assign _77 = ram_cov_rdata;
    assign _2122 = 32'b00000000000000000000000000000000;
    assign _2120 = ~ f_sweeping;
    assign _2121 = _1310 & _2120;
    assign _2123 = _2121 ? _77 : _2122;
    assign _2490 = 3'b111;
    assign _2491 = _2128 == _2490;
    assign _2492 = _2125 & _2491;
    assign _2489 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _326) begin
        if (_324)
            _2493 <= _2489;
        else
            if (_2492)
                _2493 <= _90;
    end
    assign _2485 = _2128 == _1991;
    assign _2486 = _2125 & _2485;
    always @(posedge _326) begin
        if (_324)
            _2487 <= _2489;
        else
            if (_2486)
                _2487 <= _90;
    end
    assign _2479 = _2128 == _1992;
    assign _2480 = _2125 & _2479;
    always @(posedge _326) begin
        if (_324)
            _2481 <= _2489;
        else
            if (_2480)
                _2481 <= _90;
    end
    assign _2473 = _2128 == _1333;
    assign _2474 = _2125 & _2473;
    always @(posedge _326) begin
        if (_324)
            _2475 <= _2489;
        else
            if (_2474)
                _2475 <= _90;
    end
    assign _2467 = _2128 == _1995;
    assign _2468 = _2125 & _2467;
    always @(posedge _326) begin
        if (_324)
            _2469 <= _2489;
        else
            if (_2468)
                _2469 <= _90;
    end
    assign _2461 = _2128 == _1463;
    assign _2462 = _2125 & _2461;
    always @(posedge _326) begin
        if (_324)
            _2463 <= _2489;
        else
            if (_2462)
                _2463 <= _90;
    end
    assign _2455 = _2128 == _1490;
    assign _2456 = _2125 & _2455;
    always @(posedge _326) begin
        if (_324)
            _2457 <= _2489;
        else
            if (_2456)
                _2457 <= _90;
    end
    assign _2130 = _2128 + _1490;
    assign _2131 = _2125 ? _2130 : _2128;
    assign _80 = _2131;
    always @(posedge _326) begin
        if (_324)
            _2128 <= _1136;
        else
            _2128 <= _80;
    end
    assign _2449 = _2128 == _1136;
    assign _2450 = _2125 & _2449;
    assign _2422 = _2313 - _2418;
    assign _2139 = 29'b11111111111111111111111111111;
    assign _2138 = 29'b00000000000000000000000000000;
    assign _2141 = 29'b00000000000000000000000000001;
    assign _2142 = ts_hi_m1 + _2141;
    assign _2135 = ts_reg[2:0];
    assign _2137 = _2135 == _2490;
    assign _2143 = _2137 ? _2142 : ts_hi_m1;
    assign _81 = _2143;
    always @(posedge _326) begin
        if (_324)
            ts_hi_m1 <= _2139;
        else
            ts_hi_m1 <= _81;
    end
    assign _2420 = ts_reg[31:3];
    assign _2161 = _2148 + _1490;
    assign _2157 = _2148 == _2490;
    assign _2158 = ~ _2157;
    assign _2155 = _749[0:0];
    assign _2159 = _2155 & _2158;
    assign _2162 = _2159 ? _2161 : _2148;
    assign _2152 = _749[0:0];
    assign _2153 = ~ _2152;
    assign _2150 = _384[0:0];
    assign _2149 = f_chg_now[0:0];
    assign _2151 = _2149 & _2150;
    assign _2154 = _2151 & _2153;
    assign _2164 = _2154 ? _1490 : _2162;
    assign _2145 = _348 == _1276;
    assign _2165 = _2145 ? _2164 : _2148;
    assign _82 = _2165;
    always @(posedge _326) begin
        if (_324)
            _2148 <= _1136;
        else
            _2148 <= _82;
    end
    assign _2411 = _749[0:0];
    assign _2413 = _2411 ? _2148 : _1136;
    assign _2182 = _2169 + _1490;
    assign _2178 = _2169 == _2490;
    assign _2179 = ~ _2178;
    assign _2176 = _749[1:1];
    assign _2180 = _2176 & _2179;
    assign _2183 = _2180 ? _2182 : _2169;
    assign _2173 = _749[1:1];
    assign _2174 = ~ _2173;
    assign _2171 = _384[1:1];
    assign _2170 = f_chg_now[1:1];
    assign _2172 = _2170 & _2171;
    assign _2175 = _2172 & _2174;
    assign _2185 = _2175 ? _1490 : _2183;
    assign _2166 = _348 == _1276;
    assign _2186 = _2166 ? _2185 : _2169;
    assign _83 = _2186;
    always @(posedge _326) begin
        if (_324)
            _2169 <= _1136;
        else
            _2169 <= _83;
    end
    assign _2408 = _749[1:1];
    assign _2410 = _2408 ? _2169 : _1136;
    assign _2414 = _2370 ? _2413 : _2410;
    assign _2203 = _2190 + _1490;
    assign _2199 = _2190 == _2490;
    assign _2200 = ~ _2199;
    assign _2197 = _749[2:2];
    assign _2201 = _2197 & _2200;
    assign _2204 = _2201 ? _2203 : _2190;
    assign _2194 = _749[2:2];
    assign _2195 = ~ _2194;
    assign _2192 = _384[2:2];
    assign _2191 = f_chg_now[2:2];
    assign _2193 = _2191 & _2192;
    assign _2196 = _2193 & _2195;
    assign _2206 = _2196 ? _1490 : _2204;
    assign _2187 = _348 == _1276;
    assign _2207 = _2187 ? _2206 : _2190;
    assign _84 = _2207;
    always @(posedge _326) begin
        if (_324)
            _2190 <= _1136;
        else
            _2190 <= _84;
    end
    assign _2404 = _749[2:2];
    assign _2406 = _2404 ? _2190 : _1136;
    assign _2224 = _2211 + _1490;
    assign _2220 = _2211 == _2490;
    assign _2221 = ~ _2220;
    assign _2218 = _749[3:3];
    assign _2222 = _2218 & _2221;
    assign _2225 = _2222 ? _2224 : _2211;
    assign _2215 = _749[3:3];
    assign _2216 = ~ _2215;
    assign _2213 = _384[3:3];
    assign _2212 = f_chg_now[3:3];
    assign _2214 = _2212 & _2213;
    assign _2217 = _2214 & _2216;
    assign _2227 = _2217 ? _1490 : _2225;
    assign _2208 = _348 == _1276;
    assign _2228 = _2208 ? _2227 : _2211;
    assign _85 = _2228;
    always @(posedge _326) begin
        if (_324)
            _2211 <= _1136;
        else
            _2211 <= _85;
    end
    assign _2401 = _749[3:3];
    assign _2403 = _2401 ? _2211 : _1136;
    assign _2407 = _2373 ? _2406 : _2403;
    assign _2415 = _2372 ? _2414 : _2407;
    assign _2245 = _2232 + _1490;
    assign _2241 = _2232 == _2490;
    assign _2242 = ~ _2241;
    assign _2239 = _749[4:4];
    assign _2243 = _2239 & _2242;
    assign _2246 = _2243 ? _2245 : _2232;
    assign _2236 = _749[4:4];
    assign _2237 = ~ _2236;
    assign _2234 = _384[4:4];
    assign _2233 = f_chg_now[4:4];
    assign _2235 = _2233 & _2234;
    assign _2238 = _2235 & _2237;
    assign _2248 = _2238 ? _1490 : _2246;
    assign _2229 = _348 == _1276;
    assign _2249 = _2229 ? _2248 : _2232;
    assign _86 = _2249;
    always @(posedge _326) begin
        if (_324)
            _2232 <= _1136;
        else
            _2232 <= _86;
    end
    assign _2396 = _749[4:4];
    assign _2398 = _2396 ? _2232 : _1136;
    assign _2266 = _2253 + _1490;
    assign _2262 = _2253 == _2490;
    assign _2263 = ~ _2262;
    assign _2260 = _749[5:5];
    assign _2264 = _2260 & _2263;
    assign _2267 = _2264 ? _2266 : _2253;
    assign _2257 = _749[5:5];
    assign _2258 = ~ _2257;
    assign _2255 = _384[5:5];
    assign _2254 = f_chg_now[5:5];
    assign _2256 = _2254 & _2255;
    assign _2259 = _2256 & _2258;
    assign _2269 = _2259 ? _1490 : _2267;
    assign _2250 = _348 == _1276;
    assign _2270 = _2250 ? _2269 : _2253;
    assign _87 = _2270;
    always @(posedge _326) begin
        if (_324)
            _2253 <= _1136;
        else
            _2253 <= _87;
    end
    assign _2393 = _749[5:5];
    assign _2395 = _2393 ? _2253 : _1136;
    assign _2399 = _2377 ? _2398 : _2395;
    assign _2287 = _2274 + _1490;
    assign _2283 = _2274 == _2490;
    assign _2284 = ~ _2283;
    assign _2281 = _749[6:6];
    assign _2285 = _2281 & _2284;
    assign _2288 = _2285 ? _2287 : _2274;
    assign _2278 = _749[6:6];
    assign _2279 = ~ _2278;
    assign _2276 = _384[6:6];
    assign _2275 = f_chg_now[6:6];
    assign _2277 = _2275 & _2276;
    assign _2280 = _2277 & _2279;
    assign _2290 = _2280 ? _1490 : _2288;
    assign _2271 = _348 == _1276;
    assign _2291 = _2271 ? _2290 : _2274;
    assign _88 = _2291;
    always @(posedge _326) begin
        if (_324)
            _2274 <= _1136;
        else
            _2274 <= _88;
    end
    assign _2389 = _749[6:6];
    assign _2391 = _2389 ? _2274 : _1136;
    assign _2308 = _2295 + _1490;
    assign _2304 = _2295 == _2490;
    assign _2305 = ~ _2304;
    assign _2302 = _749[7:7];
    assign _2306 = _2302 & _2305;
    assign _2309 = _2306 ? _2308 : _2295;
    assign _2299 = _749[7:7];
    assign _2300 = ~ _2299;
    assign _2297 = _384[7:7];
    assign _2296 = f_chg_now[7:7];
    assign _2298 = _2296 & _2297;
    assign _2301 = _2298 & _2300;
    assign _2311 = _2301 ? _1490 : _2309;
    assign _2292 = _348 == _1276;
    assign _2312 = _2292 ? _2311 : _2295;
    assign _89 = _2312;
    always @(posedge _326) begin
        if (_324)
            _2295 <= _1136;
        else
            _2295 <= _89;
    end
    assign _2386 = _749[7:7];
    assign _2388 = _2386 ? _2295 : _1136;
    assign _2392 = _2380 ? _2391 : _2388;
    assign _2400 = _2379 ? _2399 : _2392;
    assign _2416 = _2376 ? _2415 : _2400;
    assign _2381 = _779[7:7];
    assign _2380 = _779[6:6];
    assign _2382 = _2380 | _2381;
    assign _2378 = _779[5:5];
    assign _2377 = _779[4:4];
    assign _2379 = _2377 | _2378;
    assign _2383 = _2379 | _2382;
    assign _2374 = _779[3:3];
    assign _2373 = _779[2:2];
    assign _2375 = _2373 | _2374;
    assign _2371 = _779[1:1];
    assign _2370 = _779[0:0];
    assign _2372 = _2370 | _2371;
    assign _2376 = _2372 | _2375;
    assign _2384 = _2376 | _2383;
    assign _2417 = _2384 ? _2416 : _1136;
    assign _2359 = f_watch[0:0];
    assign _2358 = _384[0:0];
    assign _2360 = _2358 & _2359;
    assign _2362 = _2360 ? _604 : _1136;
    assign _2354 = f_watch[1:1];
    assign _2353 = _384[1:1];
    assign _2355 = _2353 & _2354;
    assign _2357 = _2355 ? _583 : _1136;
    assign _2363 = _2357 < _2362;
    assign _2364 = _2363 ? _2362 : _2357;
    assign _2347 = f_watch[2:2];
    assign _2346 = _384[2:2];
    assign _2348 = _2346 & _2347;
    assign _2350 = _2348 ? _560 : _1136;
    assign _2342 = f_watch[3:3];
    assign _2341 = _384[3:3];
    assign _2343 = _2341 & _2342;
    assign _2345 = _2343 ? _539 : _1136;
    assign _2351 = _2345 < _2350;
    assign _2352 = _2351 ? _2350 : _2345;
    assign _2365 = _2352 < _2364;
    assign _2366 = _2365 ? _2364 : _2352;
    assign _2333 = f_watch[4:4];
    assign _2332 = _384[4:4];
    assign _2334 = _2332 & _2333;
    assign _2336 = _2334 ? _514 : _1136;
    assign _2328 = f_watch[5:5];
    assign _2327 = _384[5:5];
    assign _2329 = _2327 & _2328;
    assign _2331 = _2329 ? _493 : _1136;
    assign _2337 = _2331 < _2336;
    assign _2338 = _2337 ? _2336 : _2331;
    assign _2321 = f_watch[6:6];
    assign _2320 = _384[6:6];
    assign _2322 = _2320 & _2321;
    assign _2324 = _2322 ? _470 : _1136;
    assign _2316 = f_watch[7:7];
    assign _2315 = _384[7:7];
    assign _2317 = _2315 & _2316;
    assign _2319 = _2317 ? _449 : _1136;
    assign _2325 = _2319 < _2324;
    assign _2326 = _2325 ? _2324 : _2319;
    assign _2339 = _2326 < _2338;
    assign _2340 = _2339 ? _2338 : _2326;
    assign _2367 = _2340 < _2366;
    assign _2368 = _2367 ? _2366 : _2340;
    assign _2369 = f_unexp_now ? _2368 : _1136;
    assign _2418 = f_amb_now ? _2417 : _2369;
    assign _2313 = ts_reg[2:0];
    assign _2419 = _2313 < _2418;
    assign _2421 = _2419 ? ts_hi_m1 : _2420;
    assign _2423 = { _2421,
                     _2422 };
    assign _2427 = { _2423,
                     _1260,
                     _2426,
                     _371 };
    assign _90 = _2427;
    always @(posedge _326) begin
        if (_324)
            _2451 <= _2489;
        else
            if (_2450)
                _2451 <= _90;
    end
    assign _2444 = _2442 + _1490;
    assign _2114 = 4'b0000;
    assign _2433 = 4'b0001;
    assign _2434 = _92 + _2433;
    assign _2432 = _92 - _2433;
    assign _2435 = _2125 ? _2434 : _2432;
    assign _1889 = 4'b1000;
    assign _1890 = _92 == _1889;
    assign _2124 = ~ _1890;
    assign _91 = f_viol_now;
    assign _2125 = _91 & _2124;
    assign _2430 = _2125 ^ _2429;
    assign _2436 = _2430 ? _2435 : _92;
    always @(posedge _326) begin
        if (_324)
            _2439 <= _2114;
        else
            _2439 <= _2436;
    end
    assign _92 = _2439;
    assign _2115 = _92 == _2114;
    assign _2428 = ~ _2115;
    assign _94 = host_vlog_pop;
    assign _2429 = _94 & _2428;
    assign _2445 = _2429 ? _2444 : _2442;
    assign _95 = _2445;
    always @(posedge _326) begin
        if (_324)
            _2442 <= _1136;
        else
            _2442 <= _95;
    end
    always @* begin
        case (_2442)
        0:
            _2494 <= _2451;
        1:
            _2494 <= _2457;
        2:
            _2494 <= _2463;
        3:
            _2494 <= _2469;
        4:
            _2494 <= _2475;
        5:
            _2494 <= _2481;
        6:
            _2494 <= _2487;
        default:
            _2494 <= _2493;
        endcase
    end
    assign _2558 = _2501 == _2490;
    assign _2559 = _2498 & _2558;
    always @(posedge _326) begin
        if (_324)
            _2560 <= _1285;
        else
            if (_2559)
                _2560 <= _172;
    end
    assign _2552 = _2501 == _1991;
    assign _2553 = _2498 & _2552;
    always @(posedge _326) begin
        if (_324)
            _2554 <= _1285;
        else
            if (_2553)
                _2554 <= _172;
    end
    assign _2546 = _2501 == _1992;
    assign _2547 = _2498 & _2546;
    always @(posedge _326) begin
        if (_324)
            _2548 <= _1285;
        else
            if (_2547)
                _2548 <= _172;
    end
    assign _2540 = _2501 == _1333;
    assign _2541 = _2498 & _2540;
    always @(posedge _326) begin
        if (_324)
            _2542 <= _1285;
        else
            if (_2541)
                _2542 <= _172;
    end
    assign _2534 = _2501 == _1995;
    assign _2535 = _2498 & _2534;
    always @(posedge _326) begin
        if (_324)
            _2536 <= _1285;
        else
            if (_2535)
                _2536 <= _172;
    end
    assign _2528 = _2501 == _1463;
    assign _2529 = _2498 & _2528;
    always @(posedge _326) begin
        if (_324)
            _2530 <= _1285;
        else
            if (_2529)
                _2530 <= _172;
    end
    assign _2522 = _2501 == _1490;
    assign _2523 = _2498 & _2522;
    always @(posedge _326) begin
        if (_324)
            _2524 <= _1285;
        else
            if (_2523)
                _2524 <= _172;
    end
    assign _2503 = _2501 + _1490;
    assign _2504 = _2498 ? _2503 : _2501;
    assign _98 = _2504;
    always @(posedge _326) begin
        if (_324)
            _2501 <= _1136;
        else
            _2501 <= _98;
    end
    assign _2516 = _2501 == _1136;
    assign _2517 = _2498 & _2516;
    always @(posedge _326) begin
        if (_324)
            _2518 <= _1285;
        else
            if (_2517)
                _2518 <= _172;
    end
    assign _2511 = _2509 + _1490;
    assign _2512 = _2506 ? _2511 : _2509;
    assign _99 = _2512;
    always @(posedge _326) begin
        if (_324)
            _2509 <= _1136;
        else
            _2509 <= _99;
    end
    always @* begin
        case (_2509)
        0:
            _2561 <= _2518;
        1:
            _2561 <= _2524;
        2:
            _2561 <= _2530;
        3:
            _2561 <= _2536;
        4:
            _2561 <= _2542;
        5:
            _2561 <= _2548;
        6:
            _2561 <= _2554;
        default:
            _2561 <= _2560;
        endcase
    end
    assign _2562 = 32'b00000000000000000000000000000001;
    assign _2563 = ts_reg + _2562;
    assign _103 = _2563;
    always @(posedge _326) begin
        if (_324)
            ts_reg <= _2122;
        else
            ts_reg <= _103;
    end
    assign _2565 = 2'b00;
    assign _2424 = { _2079,
                     f_unexp_now };
    assign _2426 = f_amb_now ? _2565 : _2424;
    always @(posedge _326) begin
        if (_324)
            _2566 <= _2565;
        else
            _2566 <= _2426;
    end
    always @(posedge _326) begin
        if (_324)
            _2569 <= _1128;
        else
            _2569 <= f_viol_now;
    end
    always @(posedge _326) begin
        if (_324)
            _2572 <= _2565;
        else
            _2572 <= f_winner;
    end
    always @(posedge _326) begin
        if (_324)
            _2575 <= _1128;
        else
            _2575 <= _1252;
    end
    assign _2576 = _756[60:60];
    assign _2577 = f_in_eval & _2576;
    assign _2578 = ~ _1310;
    assign _2719 = _116 & _2718;
    assign _2720 = ~ _2719;
    assign _2600 = _756[23:16];
    assign _2598 = _773[86:79];
    assign _2597 = _767[86:79];
    assign _2596 = _761[86:79];
    assign _2595 = _364[86:79];
    always @* begin
        case (f_winner)
        0:
            _2599 <= _2595;
        1:
            _2599 <= _2596;
        2:
            _2599 <= _2597;
        default:
            _2599 <= _2598;
        endcase
    end
    assign _2601 = _1854 ? _2600 : _2599;
    assign _2602 = _2601 & _2592;
    assign _2593 = ~ _2592;
    assign _2594 = f_poe & _2593;
    assign _2603 = _2594 | _2602;
    assign _2637 = _2603 | _2636;
    assign _2638 = _2582 ? _2637 : f_poe;
    assign _2640 = _333 ? _1285 : _2638;
    assign _2642 = _2023 ? _1285 : _2640;
    assign _113 = _2642;
    always @(posedge _326) begin
        if (_324)
            f_poe <= _1285;
        else
            f_poe <= _113;
    end
    assign _2721 = f_poe & _2720;
    assign _116 = host_open_drain;
    assign _4344 = ~ _116;
    assign _2716 = f_lane1_out & _2710;
    assign _2715 = ~ f_lane1_out;
    assign _2713 = ~ f_lane0_out;
    assign _2714 = _2713 & _2710;
    assign _2712 = f_lane0_out & _2710;
    assign _2711 = ~ f_lane0_out;
    assign _2710 = f_pout[0:0];
    assign _2709 = _343[2:0];
    always @* begin
        case (_2709)
        0:
            _2717 <= _2710;
        1:
            _2717 <= f_lane0_out;
        2:
            _2717 <= _2711;
        3:
            _2717 <= _2712;
        4:
            _2717 <= _2714;
        5:
            _2717 <= f_lane1_out;
        6:
            _2717 <= _2715;
        default:
            _2717 <= _2716;
        endcase
    end
    assign _2707 = f_lane1_out & _2701;
    assign _2706 = ~ f_lane1_out;
    assign _2704 = ~ f_lane0_out;
    assign _2705 = _2704 & _2701;
    assign _2703 = f_lane0_out & _2701;
    assign _2702 = ~ f_lane0_out;
    assign _2701 = f_pout[1:1];
    assign _2700 = _343[5:3];
    always @* begin
        case (_2700)
        0:
            _2708 <= _2701;
        1:
            _2708 <= f_lane0_out;
        2:
            _2708 <= _2702;
        3:
            _2708 <= _2703;
        4:
            _2708 <= _2705;
        5:
            _2708 <= f_lane1_out;
        6:
            _2708 <= _2706;
        default:
            _2708 <= _2707;
        endcase
    end
    assign _2698 = f_lane1_out & _2692;
    assign _2697 = ~ f_lane1_out;
    assign _2695 = ~ f_lane0_out;
    assign _2696 = _2695 & _2692;
    assign _2694 = f_lane0_out & _2692;
    assign _2693 = ~ f_lane0_out;
    assign _2692 = f_pout[2:2];
    assign _2691 = _343[8:6];
    always @* begin
        case (_2691)
        0:
            _2699 <= _2692;
        1:
            _2699 <= f_lane0_out;
        2:
            _2699 <= _2693;
        3:
            _2699 <= _2694;
        4:
            _2699 <= _2696;
        5:
            _2699 <= f_lane1_out;
        6:
            _2699 <= _2697;
        default:
            _2699 <= _2698;
        endcase
    end
    assign _2689 = f_lane1_out & _2683;
    assign _2688 = ~ f_lane1_out;
    assign _2686 = ~ f_lane0_out;
    assign _2687 = _2686 & _2683;
    assign _2685 = f_lane0_out & _2683;
    assign _2684 = ~ f_lane0_out;
    assign _2683 = f_pout[3:3];
    assign _2682 = _343[11:9];
    always @* begin
        case (_2682)
        0:
            _2690 <= _2683;
        1:
            _2690 <= f_lane0_out;
        2:
            _2690 <= _2684;
        3:
            _2690 <= _2685;
        4:
            _2690 <= _2687;
        5:
            _2690 <= f_lane1_out;
        6:
            _2690 <= _2688;
        default:
            _2690 <= _2689;
        endcase
    end
    assign _2680 = f_lane1_out & _2674;
    assign _2679 = ~ f_lane1_out;
    assign _2677 = ~ f_lane0_out;
    assign _2678 = _2677 & _2674;
    assign _2676 = f_lane0_out & _2674;
    assign _2675 = ~ f_lane0_out;
    assign _2674 = f_pout[4:4];
    assign _2673 = _343[14:12];
    always @* begin
        case (_2673)
        0:
            _2681 <= _2674;
        1:
            _2681 <= f_lane0_out;
        2:
            _2681 <= _2675;
        3:
            _2681 <= _2676;
        4:
            _2681 <= _2678;
        5:
            _2681 <= f_lane1_out;
        6:
            _2681 <= _2679;
        default:
            _2681 <= _2680;
        endcase
    end
    assign _2671 = f_lane1_out & _2665;
    assign _2670 = ~ f_lane1_out;
    assign _2668 = ~ f_lane0_out;
    assign _2669 = _2668 & _2665;
    assign _2667 = f_lane0_out & _2665;
    assign _2666 = ~ f_lane0_out;
    assign _2665 = f_pout[5:5];
    assign _2664 = _343[17:15];
    always @* begin
        case (_2664)
        0:
            _2672 <= _2665;
        1:
            _2672 <= f_lane0_out;
        2:
            _2672 <= _2666;
        3:
            _2672 <= _2667;
        4:
            _2672 <= _2669;
        5:
            _2672 <= f_lane1_out;
        6:
            _2672 <= _2670;
        default:
            _2672 <= _2671;
        endcase
    end
    assign _2662 = f_lane1_out & _2656;
    assign _2661 = ~ f_lane1_out;
    assign _2659 = ~ f_lane0_out;
    assign _2660 = _2659 & _2656;
    assign _2658 = f_lane0_out & _2656;
    assign _2657 = ~ f_lane0_out;
    assign _2656 = f_pout[6:6];
    assign _2655 = _343[20:18];
    always @* begin
        case (_2655)
        0:
            _2663 <= _2656;
        1:
            _2663 <= f_lane0_out;
        2:
            _2663 <= _2657;
        3:
            _2663 <= _2658;
        4:
            _2663 <= _2660;
        5:
            _2663 <= f_lane1_out;
        6:
            _2663 <= _2661;
        default:
            _2663 <= _2662;
        endcase
    end
    assign _2653 = f_lane1_out & _2647;
    assign _2652 = ~ f_lane1_out;
    assign _2650 = ~ f_lane0_out;
    assign _2651 = _2650 & _2647;
    assign _2649 = f_lane0_out & _2647;
    assign _2648 = ~ f_lane0_out;
    assign _4336 = { _4334,
                     _4333 };
    assign _4333 = _653[0:0];
    assign _4334 = { _4333,
                     _4333 };
    assign _4335 = { _4334,
                     _4334 };
    assign _4337 = { _4335,
                     _4336 };
    assign _4338 = { _4337,
                     _4333 };
    assign _4339 = _4338 & _2636;
    assign _2634 = _2630 & _2628;
    assign _2633 = _2630 & _2626;
    assign _2632 = _2630 & _2623;
    assign _2630 = ~ _2617;
    assign _2631 = _2630 & _2620;
    assign _2628 = _2625 & _2622;
    assign _2629 = _2617 & _2628;
    assign _2625 = ~ _2618;
    assign _2626 = _2625 & _2619;
    assign _2627 = _2617 & _2626;
    assign _2622 = ~ _2619;
    assign _2623 = _2618 & _2622;
    assign _2624 = _2617 & _2623;
    assign _2619 = _2616[0:0];
    assign _2618 = _2616[1:1];
    assign _2620 = _2618 & _2619;
    assign _2617 = _2616[2:2];
    assign _2621 = _2617 & _2620;
    assign _2635 = { _2621,
                     _2624,
                     _2627,
                     _2629,
                     _2631,
                     _2632,
                     _2633,
                     _2634 };
    assign _2604 = ~ _1854;
    assign _2610 = _2604 & _2609;
    assign _2636 = _2610 ? _2635 : _1285;
    assign _4331 = ~ _2636;
    assign _4327 = _756[15:8];
    assign _4325 = _773[78:71];
    assign _4324 = _767[78:71];
    assign _4323 = _761[78:71];
    assign _4322 = _364[78:71];
    always @* begin
        case (f_winner)
        0:
            _4326 <= _4322;
        1:
            _4326 <= _4323;
        2:
            _4326 <= _4324;
        default:
            _4326 <= _4325;
        endcase
    end
    assign _4328 = _1854 ? _4327 : _4326;
    assign _4329 = _4328 & _2592;
    assign _2591 = _756[7:0];
    assign _2589 = _773[70:63];
    assign _2588 = _767[70:63];
    assign _2587 = _761[70:63];
    assign _2586 = _364[70:63];
    always @* begin
        case (f_winner)
        0:
            _2590 <= _2586;
        1:
            _2590 <= _2587;
        2:
            _2590 <= _2588;
        default:
            _2590 <= _2589;
        endcase
    end
    assign _2592 = _1854 ? _2591 : _2590;
    assign _4320 = ~ _2592;
    assign _4321 = f_pout & _4320;
    assign _4330 = _4321 | _4329;
    assign _4332 = _4330 & _4331;
    assign _4340 = _4332 | _4339;
    assign _2580 = _704 == _2565;
    assign _2581 = _2580 | _706;
    assign _2582 = _1855 & _2581;
    assign _4341 = _2582 ? _4340 : f_pout;
    assign _118 = host_crc_expect;
    assign _4313 = 32'b11111111111111111111111111111111;
    assign _2833 = 32'b11101101101110001000001100100000;
    assign _2831 = _2825[31:1];
    assign _2832 = { _1128,
                     _2831 };
    assign _2834 = _2832 ^ _2833;
    assign _2828 = _2825[31:1];
    assign _2829 = { _1128,
                     _2828 };
    assign _2821 = _2815[31:1];
    assign _2822 = { _1128,
                     _2821 };
    assign _2824 = _2822 ^ _2833;
    assign _2818 = _2815[31:1];
    assign _2819 = { _1128,
                     _2818 };
    assign _2811 = _2805[31:1];
    assign _2812 = { _1128,
                     _2811 };
    assign _2814 = _2812 ^ _2833;
    assign _2808 = _2805[31:1];
    assign _2809 = { _1128,
                     _2808 };
    assign _2801 = _2795[31:1];
    assign _2802 = { _1128,
                     _2801 };
    assign _2804 = _2802 ^ _2833;
    assign _2798 = _2795[31:1];
    assign _2799 = { _1128,
                     _2798 };
    assign _2791 = _2785[31:1];
    assign _2792 = { _1128,
                     _2791 };
    assign _2794 = _2792 ^ _2833;
    assign _2788 = _2785[31:1];
    assign _2789 = { _1128,
                     _2788 };
    assign _2781 = _2775[31:1];
    assign _2782 = { _1128,
                     _2781 };
    assign _2784 = _2782 ^ _2833;
    assign _2778 = _2775[31:1];
    assign _2779 = { _1128,
                     _2778 };
    assign _2771 = _2765[31:1];
    assign _2772 = { _1128,
                     _2771 };
    assign _2774 = _2772 ^ _2833;
    assign _2768 = _2765[31:1];
    assign _2769 = { _1128,
                     _2768 };
    assign _2761 = _2755[31:1];
    assign _2762 = { _1128,
                     _2761 };
    assign _2764 = _2762 ^ _2833;
    assign _2758 = _2755[31:1];
    assign _2759 = { _1128,
                     _2758 };
    assign _2752 = _318[127:120];
    assign _2751 = _318[119:112];
    assign _2750 = _318[111:104];
    assign _2749 = _318[103:96];
    assign _2748 = _318[95:88];
    assign _2747 = _318[87:80];
    assign _2746 = _318[79:72];
    assign _2745 = _318[71:64];
    assign _2744 = _318[63:56];
    assign _2743 = _318[55:48];
    assign _2742 = _318[47:40];
    assign _2741 = _318[39:32];
    assign _2740 = _318[31:24];
    assign _2739 = _318[23:16];
    assign _2738 = _318[15:8];
    assign _2737 = _318[7:0];
    assign _2734 = 13'b0000000000001;
    assign _2735 = f_sw_cnt - _2734;
    assign _2736 = _2735[3:0];
    always @* begin
        case (_2736)
        0:
            _2753 <= _2737;
        1:
            _2753 <= _2738;
        2:
            _2753 <= _2739;
        3:
            _2753 <= _2740;
        4:
            _2753 <= _2741;
        5:
            _2753 <= _2742;
        6:
            _2753 <= _2743;
        7:
            _2753 <= _2744;
        8:
            _2753 <= _2745;
        9:
            _2753 <= _2746;
        10:
            _2753 <= _2747;
        11:
            _2753 <= _2748;
        12:
            _2753 <= _2749;
        13:
            _2753 <= _2750;
        14:
            _2753 <= _2751;
        default:
            _2753 <= _2752;
        endcase
    end
    assign _2733 = 24'b000000000000000000000000;
    assign _2754 = { _2733,
                     _2753 };
    assign _2731 = f_sw_cnt == _1143;
    assign _2732 = ~ _2731;
    assign _2836 = _2732 ? _2835 : _2729;
    assign _2729 = _2724 ? _4313 : _2727;
    assign _2837 = f_sweeping ? _2836 : _2729;
    assign _119 = _2837;
    always @(posedge _326) begin
        if (_324)
            _2727 <= _4313;
        else
            _2727 <= _119;
    end
    assign _2755 = _2727 ^ _2754;
    assign _2756 = _2755[0:0];
    assign _2765 = _2756 ? _2764 : _2759;
    assign _2766 = _2765[0:0];
    assign _2775 = _2766 ? _2774 : _2769;
    assign _2776 = _2775[0:0];
    assign _2785 = _2776 ? _2784 : _2779;
    assign _2786 = _2785[0:0];
    assign _2795 = _2786 ? _2794 : _2789;
    assign _2796 = _2795[0:0];
    assign _2805 = _2796 ? _2804 : _2799;
    assign _2806 = _2805[0:0];
    assign _2815 = _2806 ? _2814 : _2809;
    assign _2816 = _2815[0:0];
    assign _2825 = _2816 ? _2824 : _2819;
    assign _2826 = _2825[0:0];
    assign _2835 = _2826 ? _2834 : _2829;
    assign _4314 = _2835 ^ _4313;
    assign f_sw_match = _4314 == _118;
    assign _4316 = f_sw_last ? f_sw_match : _4312;
    assign _4318 = _4300 ? _1128 : _4316;
    assign _1331 = ~ f_sweeping;
    assign _1330 = _124 & _1310;
    assign f_store_we = _1330 & _1331;
    assign _4308 = f_store_we | _122;
    assign _4310 = _4308 ? _1128 : f_image_valid;
    assign _4312 = _2724 ? _1128 : _4310;
    assign _4301 = 13'b1000000000000;
    assign _2841 = f_sw_cnt + _2734;
    assign _2839 = _2724 ? _1143 : f_sw_cnt;
    assign _2842 = f_sweeping ? _2841 : _2839;
    assign _120 = _2842;
    always @(posedge _326) begin
        if (_324)
            f_sw_cnt <= _1143;
        else
            f_sw_cnt <= _120;
    end
    assign f_sw_last = f_sw_cnt == _4301;
    assign _4304 = f_sw_last ? _1128 : _4297;
    assign _122 = host_crc_expect_we;
    assign _124 = host_rec_we;
    assign _4298 = _340 | _124;
    assign _4299 = _4298 | _122;
    assign _4300 = f_sweeping & _4299;
    assign _4306 = _4300 ? _1128 : _4304;
    assign _2723 = ~ f_sweeping;
    assign _4290 = _1854 ? _1277 : _348;
    assign _4286 = _2858 ? _1276 : _348;
    assign _2091 = 2'b11;
    assign _4277 = f_policy == _2091;
    assign _4279 = _4277 ? _2565 : _348;
    assign _4276 = f_policy == _1277;
    assign _4281 = _4276 ? _1276 : _4279;
    assign _4275 = f_policy == _2565;
    assign _4283 = _4275 ? _2565 : _4281;
    assign _4284 = f_viol_now ? _4283 : _348;
    assign _1247 = f_chgmask3 & f_multi_eff;
    assign _1249 = _1247 == _1285;
    assign _1240 = _1200 == _1125;
    assign _1235 = 16'b0000000000000000;
    assign _1236 = _1200 == _1235;
    assign _1237 = _1236 & _1217;
    assign _1234 = _1176 == _1196;
    assign _1238 = _1234 | _1237;
    assign _1241 = _1175 ? _1240 : _1238;
    assign _1231 = _665[3:0];
    assign _1233 = _1231 == _2114;
    assign _1242 = _1233 | _1241;
    assign _1229 = _1200 == _1125;
    assign _1225 = _1200 == _1235;
    assign _1226 = _1225 & _1217;
    assign _1223 = _1176 == _1196;
    assign _1227 = _1223 | _1226;
    assign _1230 = _1175 ? _1229 : _1227;
    assign _1221 = _1187 == _1125;
    always @(posedge _326) begin
        if (_324)
            _1115 <= _1136;
        else
            _1115 <= _1112;
    end
    assign _1216 = { _1143,
                     _1115 };
    assign _1217 = _1173 < _1216;
    assign _1214 = _1187 == _1235;
    assign _1218 = _1214 & _1217;
    assign _1212 = _1176 == _1184;
    assign _1219 = _1212 | _1218;
    assign _1222 = _1175 ? _1221 : _1219;
    assign _1211 = _773[104:103];
    always @* begin
        case (_1211)
        0:
            _1243 <= vdd;
        1:
            _1243 <= _1222;
        2:
            _1243 <= _1230;
        default:
            _1243 <= _1242;
        endcase
    end
    assign _1210 = ~ _706;
    assign _1244 = _1210 | _1243;
    assign _1207 = _773[62:62];
    assign _1205 = _773[61:58];
    always @* begin
        case (_1205)
        0:
            _1206 <= vdd;
        1:
            _1206 <= _650;
        2:
            _1206 <= _654;
        3:
            _1206 <= _658;
        4:
            _1206 <= _660;
        5:
            _1206 <= _662;
        6:
            _1206 <= _666;
        7:
            _1206 <= _669;
        8:
            _1206 <= _674;
        9:
            _1206 <= _677;
        10:
            _1206 <= _680;
        11:
            _1206 <= _683;
        12:
            _1206 <= _688;
        13:
            _1206 <= _691;
        14:
            _1206 <= _694;
        default:
            _1206 <= _697;
        endcase
    end
    assign _1208 = _1206 ^ _1207;
    assign _1200 = _773[57:42];
    assign _1202 = _1200 == _1125;
    assign _1195 = 17'b00000000000000000;
    assign _1191 = _1073[57:42];
    assign _1192 = { gnd,
                     _1191 };
    assign _1193 = _1192 + _1180;
    always @(posedge _326) begin
        if (_324)
            _1196 <= _1195;
        else
            _1196 <= _1193;
    end
    assign _1197 = _1196 < _1176;
    assign _1198 = ~ _1197;
    assign _1187 = _773[41:26];
    assign _1189 = _1187 == _1235;
    assign _1104 = _1074[0:0];
    assign _1106 = _1104 ? _612 : _1136;
    assign _1101 = _1074[1:1];
    assign _1103 = _1101 ? _591 : _1136;
    assign _1107 = _1103 < _1106;
    assign _1108 = _1107 ? _1106 : _1103;
    assign _1096 = _1074[2:2];
    assign _1098 = _1096 ? _568 : _1136;
    assign _1093 = _1074[3:3];
    assign _1095 = _1093 ? _547 : _1136;
    assign _1099 = _1095 < _1098;
    assign _1100 = _1099 ? _1098 : _1095;
    assign _1109 = _1100 < _1108;
    assign _1110 = _1109 ? _1108 : _1100;
    assign _1086 = _1074[4:4];
    assign _1088 = _1086 ? _522 : _1136;
    assign _1083 = _1074[5:5];
    assign _1085 = _1083 ? _501 : _1136;
    assign _1089 = _1085 < _1088;
    assign _1090 = _1089 ? _1088 : _1085;
    assign _1078 = _1074[6:6];
    assign _1080 = _1078 ? _478 : _1136;
    assign _1074 = _1073[23:16];
    assign _1075 = _1074[7:7];
    assign _1077 = _1075 ? _457 : _1136;
    assign _1081 = _1077 < _1080;
    assign _1082 = _1081 ? _1080 : _1077;
    assign _1091 = _1082 < _1090;
    assign _1092 = _1091 ? _1090 : _1082;
    assign _1111 = _1092 < _1110;
    assign _1112 = _1111 ? _1110 : _1092;
    assign _1179 = 14'b00000000000000;
    assign _1180 = { _1179,
                     _1112 };
    assign _1073 = _432[511:400];
    assign _1177 = _1073[41:26];
    assign _1178 = { gnd,
                     _1177 };
    assign _1181 = _1178 + _1180;
    always @(posedge _326) begin
        if (_324)
            _1184 <= _1195;
        else
            _1184 <= _1181;
    end
    assign _1176 = { gnd,
                     _1173 };
    assign _1185 = _1176 < _1184;
    assign _1186 = ~ _1185;
    assign _1190 = _1186 | _1189;
    assign _1199 = _1190 & _1198;
    assign _1118 = _773[25:24];
    always @* begin
        case (_1118)
        0:
            _1173 <= _399;
        1:
            _1173 <= _402;
        2:
            _1173 <= _405;
        default:
            _1173 <= _405;
        endcase
    end
    assign _1175 = _1173 == _1125;
    assign _1203 = _1175 ? _1202 : _1199;
    assign _1167 = f_changed_all & f_chgmask3;
    assign _1169 = _1167 == _1285;
    assign _1170 = ~ _1169;
    assign _1166 = f_chgmask3 == _1285;
    assign _1171 = _1166 | _1170;
    assign _1160 = _773[7:0];
    assign _1158 = _773[15:8];
    assign _1159 = _371 ^ _1158;
    assign _1161 = _1159 & _1160;
    assign _1163 = _1161 == _1285;
    assign _1164 = f_valid3 & _1163;
    assign _1172 = _1164 & _1171;
    assign _1204 = _1172 & _1203;
    assign _1209 = _1204 & _1208;
    assign _1245 = _1209 & _1244;
    assign _1246 = f_in_eval & _1245;
    assign _1250 = _1246 & _1249;
    assign f_fire3 = _1250 & _788;
    assign _752 = f_chgmask0 & f_multi_eff;
    assign _754 = _752 == _1285;
    assign _740 = _640 == _1125;
    assign _736 = _640 == _1235;
    assign _737 = _736 & _717;
    assign _734 = _410 == _636;
    assign _738 = _734 | _737;
    assign _741 = _408 ? _740 : _738;
    assign _731 = _665[3:0];
    assign _733 = _731 == _2114;
    assign _742 = _733 | _741;
    assign _729 = _640 == _1125;
    assign _725 = _640 == _1235;
    assign _726 = _725 & _717;
    assign _723 = _410 == _636;
    assign _727 = _723 | _726;
    assign _730 = _408 ? _729 : _727;
    assign _721 = _627 == _1125;
    always @(posedge _326) begin
        if (_324)
            _715 <= _1136;
        else
            _715 <= _619;
    end
    assign _716 = { _1143,
                    _715 };
    assign _717 = _406 < _716;
    assign _711 = _627 == _1235;
    assign _718 = _711 & _717;
    assign _709 = _410 == _624;
    assign _719 = _709 | _718;
    assign _722 = _408 ? _721 : _719;
    assign _708 = _364[104:103];
    always @* begin
        case (_708)
        0:
            _743 <= vdd;
        1:
            _743 <= _722;
        2:
            _743 <= _730;
        default:
            _743 <= _742;
        endcase
    end
    assign _707 = ~ _706;
    assign _744 = _707 | _743;
    assign _699 = _364[62:62];
    assign _645 = _364[61:58];
    always @* begin
        case (_645)
        0:
            _698 <= vdd;
        1:
            _698 <= _650;
        2:
            _698 <= _654;
        3:
            _698 <= _658;
        4:
            _698 <= _660;
        5:
            _698 <= _662;
        6:
            _698 <= _666;
        7:
            _698 <= _669;
        8:
            _698 <= _674;
        9:
            _698 <= _677;
        10:
            _698 <= _680;
        11:
            _698 <= _683;
        12:
            _698 <= _688;
        13:
            _698 <= _691;
        14:
            _698 <= _694;
        default:
            _698 <= _697;
        endcase
    end
    assign _700 = _698 ^ _699;
    assign _640 = _364[57:42];
    assign _642 = _640 == _1125;
    assign _631 = _433[57:42];
    assign _632 = { gnd,
                    _631 };
    assign _633 = _632 + _620;
    always @(posedge _326) begin
        if (_324)
            _636 <= _1195;
        else
            _636 <= _633;
    end
    assign _637 = _636 < _410;
    assign _638 = ~ _637;
    assign _627 = _364[41:26];
    assign _629 = _627 == _1235;
    assign _593 = _437[0:0];
    assign _613 = _593 ? _612 : _1136;
    assign _572 = _437[1:1];
    assign _592 = _572 ? _591 : _1136;
    assign _614 = _592 < _613;
    assign _615 = _614 ? _613 : _592;
    assign _549 = _437[2:2];
    assign _569 = _549 ? _568 : _1136;
    assign _528 = _437[3:3];
    assign _548 = _528 ? _547 : _1136;
    assign _570 = _548 < _569;
    assign _571 = _570 ? _569 : _548;
    assign _616 = _571 < _615;
    assign _617 = _616 ? _615 : _571;
    assign _503 = _437[4:4];
    assign _523 = _503 ? _522 : _1136;
    assign _482 = _437[5:5];
    assign _502 = _482 ? _501 : _1136;
    assign _524 = _502 < _523;
    assign _525 = _524 ? _523 : _502;
    assign _459 = _437[6:6];
    assign _479 = _459 ? _478 : _1136;
    assign _437 = _433[23:16];
    assign _438 = _437[7:7];
    assign _458 = _438 ? _457 : _1136;
    assign _480 = _458 < _479;
    assign _481 = _480 ? _479 : _458;
    assign _526 = _481 < _525;
    assign _527 = _526 ? _525 : _481;
    assign _618 = _527 < _617;
    assign _619 = _618 ? _617 : _527;
    assign _620 = { _1179,
                    _619 };
    assign _433 = _432[175:64];
    assign _434 = _433[41:26];
    assign _435 = { gnd,
                    _434 };
    assign _621 = _435 + _620;
    always @(posedge _326) begin
        if (_324)
            _624 <= _1195;
        else
            _624 <= _621;
    end
    assign _410 = { gnd,
                    _406 };
    assign _625 = _410 < _624;
    assign _626 = ~ _625;
    assign _630 = _626 | _629;
    assign _639 = _630 & _638;
    assign _396 = _364[25:24];
    always @* begin
        case (_396)
        0:
            _406 <= _399;
        1:
            _406 <= _402;
        2:
            _406 <= _405;
        default:
            _406 <= _405;
        endcase
    end
    assign _408 = _406 == _1125;
    assign _643 = _408 ? _642 : _639;
    assign _390 = f_changed_all & f_chgmask0;
    assign _392 = _390 == _1285;
    assign _393 = ~ _392;
    assign _381 = f_chgmask0 == _1285;
    assign _394 = _381 | _393;
    assign _374 = _364[7:0];
    assign _372 = _364[15:8];
    assign _373 = _371 ^ _372;
    assign _375 = _373 & _374;
    assign _377 = _375 == _1285;
    assign _352 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _4260 = _415 + _1490;
    assign _1259 = 6'b000000;
    assign _126 = host_start_loc;
    assign _2859 = _2858 ? _2856 : _1260;
    assign _128 = host_recover_loc;
    assign _2846 = _2023 ? _128 : _2845;
    assign _129 = _2846;
    always @(posedge _326) begin
        if (_324)
            _2845 <= _1259;
        else
            _2845 <= _129;
    end
    assign _2849 = f_policy == _1277;
    assign _2850 = _2849 ? _2845 : _1260;
    assign _2851 = f_viol_now ? _2850 : _1260;
    assign _2860 = _1252 ? _2859 : _2851;
    assign _2847 = _348 == _1277;
    assign _2861 = _2847 ? _2860 : _1260;
    assign _2862 = _2023 ? _126 : _2861;
    assign _130 = _2862;
    always @(posedge _326) begin
        if (_324)
            _1260 <= _1259;
        else
            _1260 <= _130;
    end
    assign _2855 = _773[110:105];
    assign _2854 = _767[110:105];
    assign _2853 = _761[110:105];
    assign _2852 = _364[110:105];
    always @* begin
        case (f_winner)
        0:
            _2856 <= _2852;
        1:
            _2856 <= _2853;
        2:
            _2856 <= _2854;
        default:
            _2856 <= _2855;
        endcase
    end
    assign _2857 = _2856 == _1260;
    assign _2858 = ~ _2857;
    assign _4256 = _2858 ? _1136 : _415;
    assign _4251 = f_policy == _1277;
    assign _4253 = _4251 ? _1136 : _415;
    assign _2082 = f_changed_all & f_watch;
    assign _2084 = _2082 == _1285;
    assign _2085 = ~ _2084;
    assign _2080 = ~ _1252;
    assign _2081 = f_in_eval & _2080;
    assign f_unexp_now = _2081 & _2085;
    assign _2866 = ~ f_amb_now;
    assign _2867 = _2079 & _2866;
    assign _2869 = _2867 ? _1955 : _2865;
    assign _2870 = _1252 ? _2865 : _2869;
    assign _2865 = _1855 ? _1128 : _2077;
    assign _2863 = _348 == _1277;
    assign _2871 = _2863 ? _2870 : _2865;
    assign _131 = _2871;
    always @(posedge _326) begin
        if (_324)
            _2077 <= _1128;
        else
            _2077 <= _131;
    end
    assign _2078 = ~ _2077;
    assign _4242 = 16'b0000000000000001;
    assign _4243 = _399 + _4242;
    assign _4239 = _399 == _1125;
    assign _4240 = ~ _4239;
    assign _4241 = _4200 & _4240;
    assign _4244 = _4241 ? _4243 : _399;
    assign _4184 = _756[26:24];
    assign _4182 = _773[93:91];
    assign _4181 = _767[93:91];
    assign _4180 = _761[93:91];
    assign _4179 = _364[93:91];
    assign _1061 = f_chgmask2 & f_multi_eff;
    assign _1063 = _1061 == _1285;
    assign _1054 = _1011 == _1125;
    assign _1050 = _1011 == _1235;
    assign _1051 = _1050 & _1031;
    assign _1048 = _947 == _1007;
    assign _1052 = _1048 | _1051;
    assign _1055 = _946 ? _1054 : _1052;
    assign _1045 = _665[3:0];
    assign _1047 = _1045 == _2114;
    assign _1056 = _1047 | _1055;
    assign _1043 = _1011 == _1125;
    assign _1039 = _1011 == _1235;
    assign _1040 = _1039 & _1031;
    assign _1037 = _947 == _1007;
    assign _1041 = _1037 | _1040;
    assign _1044 = _946 ? _1043 : _1041;
    assign _1035 = _998 == _1125;
    always @(posedge _326) begin
        if (_324)
            _1029 <= _1136;
        else
            _1029 <= _990;
    end
    assign _1030 = { _1143,
                     _1029 };
    assign _1031 = _944 < _1030;
    assign _1025 = _998 == _1235;
    assign _1032 = _1025 & _1031;
    assign _1023 = _947 == _995;
    assign _1033 = _1023 | _1032;
    assign _1036 = _946 ? _1035 : _1033;
    assign _1022 = _767[104:103];
    always @* begin
        case (_1022)
        0:
            _1057 <= vdd;
        1:
            _1057 <= _1036;
        2:
            _1057 <= _1044;
        default:
            _1057 <= _1056;
        endcase
    end
    assign _1021 = ~ _706;
    assign _1058 = _1021 | _1057;
    assign _1018 = _767[62:62];
    assign _1016 = _767[61:58];
    always @* begin
        case (_1016)
        0:
            _1017 <= vdd;
        1:
            _1017 <= _650;
        2:
            _1017 <= _654;
        3:
            _1017 <= _658;
        4:
            _1017 <= _660;
        5:
            _1017 <= _662;
        6:
            _1017 <= _666;
        7:
            _1017 <= _669;
        8:
            _1017 <= _674;
        9:
            _1017 <= _677;
        10:
            _1017 <= _680;
        11:
            _1017 <= _683;
        12:
            _1017 <= _688;
        13:
            _1017 <= _691;
        14:
            _1017 <= _694;
        default:
            _1017 <= _697;
        endcase
    end
    assign _1019 = _1017 ^ _1018;
    assign _1011 = _767[57:42];
    assign _1013 = _1011 == _1125;
    assign _1002 = _948[57:42];
    assign _1003 = { gnd,
                     _1002 };
    assign _1004 = _1003 + _991;
    always @(posedge _326) begin
        if (_324)
            _1007 <= _1195;
        else
            _1007 <= _1004;
    end
    assign _1008 = _1007 < _947;
    assign _1009 = ~ _1008;
    assign _998 = _767[41:26];
    assign _1000 = _998 == _1235;
    assign _982 = _952[0:0];
    assign _984 = _982 ? _612 : _1136;
    assign _979 = _952[1:1];
    assign _981 = _979 ? _591 : _1136;
    assign _985 = _981 < _984;
    assign _986 = _985 ? _984 : _981;
    assign _974 = _952[2:2];
    assign _976 = _974 ? _568 : _1136;
    assign _971 = _952[3:3];
    assign _973 = _971 ? _547 : _1136;
    assign _977 = _973 < _976;
    assign _978 = _977 ? _976 : _973;
    assign _987 = _978 < _986;
    assign _988 = _987 ? _986 : _978;
    assign _964 = _952[4:4];
    assign _966 = _964 ? _522 : _1136;
    assign _961 = _952[5:5];
    assign _963 = _961 ? _501 : _1136;
    assign _967 = _963 < _966;
    assign _968 = _967 ? _966 : _963;
    assign _956 = _952[6:6];
    assign _958 = _956 ? _478 : _1136;
    assign _952 = _948[23:16];
    assign _953 = _952[7:7];
    assign _955 = _953 ? _457 : _1136;
    assign _959 = _955 < _958;
    assign _960 = _959 ? _958 : _955;
    assign _969 = _960 < _968;
    assign _970 = _969 ? _968 : _960;
    assign _989 = _970 < _988;
    assign _990 = _989 ? _988 : _970;
    assign _991 = { _1179,
                    _990 };
    assign _948 = _432[399:288];
    assign _949 = _948[41:26];
    assign _950 = { gnd,
                    _949 };
    assign _992 = _950 + _991;
    always @(posedge _326) begin
        if (_324)
            _995 <= _1195;
        else
            _995 <= _992;
    end
    assign _947 = { gnd,
                    _944 };
    assign _996 = _947 < _995;
    assign _997 = ~ _996;
    assign _1001 = _997 | _1000;
    assign _1010 = _1001 & _1009;
    assign _943 = _767[25:24];
    always @* begin
        case (_943)
        0:
            _944 <= _399;
        1:
            _944 <= _402;
        2:
            _944 <= _405;
        default:
            _944 <= _405;
        endcase
    end
    assign _946 = _944 == _1125;
    assign _1014 = _946 ? _1013 : _1010;
    assign _937 = f_changed_all & f_chgmask2;
    assign _939 = _937 == _1285;
    assign _940 = ~ _939;
    assign _936 = f_chgmask2 == _1285;
    assign _941 = _936 | _940;
    assign _930 = _767[7:0];
    assign _928 = _767[15:8];
    assign _929 = _371 ^ _928;
    assign _931 = _929 & _930;
    assign _933 = _931 == _1285;
    assign _934 = f_valid2 & _933;
    assign _942 = _934 & _941;
    assign _1015 = _942 & _1014;
    assign _1020 = _1015 & _1019;
    assign _1059 = _1020 & _1058;
    assign _1060 = f_in_eval & _1059;
    assign _1064 = _1060 & _1063;
    assign f_fire2 = _1064 & _788;
    assign _1068 = f_fire2 ? _1277 : _2091;
    assign f_policy = _756[59:58];
    assign _787 = f_policy == _1276;
    assign f_chgmask3 = _773[23:16];
    assign f_valid3 = _773[111:111];
    assign _777 = f_valid3 ? f_chgmask3 : _1285;
    assign f_chgmask2 = _767[23:16];
    assign f_valid2 = _767[111:111];
    assign _771 = f_valid2 ? f_chgmask2 : _1285;
    assign _765 = f_valid1 ? f_chgmask1 : _1285;
    assign f_chgmask0 = _364[23:16];
    assign _759 = f_valid0 ? f_chgmask0 : _1285;
    assign f_watch = _756[57:50];
    assign _760 = f_watch | _759;
    assign _766 = _760 | _765;
    assign _772 = _766 | _771;
    assign f_relevant = _772 | _777;
    assign _779 = f_multi_eff & f_relevant;
    assign _781 = _779 == _1285;
    assign _782 = ~ _781;
    assign f_amb_now = f_in_eval & _782;
    assign _784 = ~ f_amb_now;
    assign _788 = _784 | _787;
    assign _750 = _384 & f_chg_now;
    assign _2876 = _384 & f_chg_now;
    assign _2877 = _749 | _2876;
    assign _2873 = _348 == _1277;
    assign _2875 = _2873 ? _1285 : _749;
    assign _2872 = _348 == _1276;
    assign _2878 = _2872 ? _2877 : _2875;
    assign _2880 = _2023 ? _1285 : _2878;
    assign _132 = _2880;
    always @(posedge _326) begin
        if (_324)
            _749 <= _1285;
        else
            _749 <= _132;
    end
    assign f_multi_eff = _749 | _750;
    assign _923 = f_chgmask1 & f_multi_eff;
    assign _925 = _923 == _1285;
    assign _916 = _873 == _1125;
    assign _912 = _873 == _1235;
    assign _913 = _912 & _893;
    assign _910 = _809 == _869;
    assign _914 = _910 | _913;
    assign _917 = _808 ? _916 : _914;
    assign _907 = _665[3:0];
    assign _909 = _907 == _2114;
    assign _918 = _909 | _917;
    assign _905 = _873 == _1125;
    assign _901 = _873 == _1235;
    assign _902 = _901 & _893;
    assign _899 = _809 == _869;
    assign _903 = _899 | _902;
    assign _906 = _808 ? _905 : _903;
    assign _897 = _860 == _1125;
    always @(posedge _326) begin
        if (_324)
            _891 <= _1136;
        else
            _891 <= _852;
    end
    assign _892 = { _1143,
                    _891 };
    assign _893 = _806 < _892;
    assign _887 = _860 == _1235;
    assign _894 = _887 & _893;
    assign _885 = _809 == _857;
    assign _895 = _885 | _894;
    assign _898 = _808 ? _897 : _895;
    assign _884 = _761[104:103];
    always @* begin
        case (_884)
        0:
            _919 <= vdd;
        1:
            _919 <= _898;
        2:
            _919 <= _906;
        default:
            _919 <= _918;
        endcase
    end
    assign _134 = host_role;
    assign _2881 = _2023 ? _134 : _704;
    assign _135 = _2881;
    always @(posedge _326) begin
        if (_324)
            _704 <= _2565;
        else
            _704 <= _135;
    end
    assign _706 = _704 == _1277;
    assign _883 = ~ _706;
    assign _920 = _883 | _919;
    assign _880 = _761[62:62];
    assign _2885 = _1641 ? _1955 : _2883;
    assign _2883 = _1611 ? _1955 : _697;
    assign _2886 = _1596 ? _2885 : _2883;
    assign _2888 = _1501 ? _1128 : _2886;
    assign _2890 = _1499 ? _1128 : _2888;
    assign _136 = _2890;
    always @(posedge _326) begin
        if (_324)
            _697 <= _1128;
        else
            _697 <= _136;
    end
    assign _2897 = _2896 ^ _141;
    assign _2898 = _2897 & _139;
    assign _2900 = _2898 == _1235;
    assign _2891 = ~ _204;
    assign _2901 = _2891 & _2900;
    assign _2903 = _2901 ? _1955 : _694;
    assign _2904 = _1750 ? _2903 : _694;
    assign _2905 = _1641 ? _694 : _2904;
    assign _2906 = _1596 ? _2905 : _694;
    assign _2908 = _1501 ? _1128 : _2906;
    assign _2910 = _1499 ? _1128 : _2908;
    assign _137 = _2910;
    always @(posedge _326) begin
        if (_324)
            _694 <= _1128;
        else
            _694 <= _137;
    end
    assign _139 = host_lane1_sync_mask;
    assign _141 = host_lane1_sync;
    assign _2948 = g_crc[31:16];
    assign _2949 = _2948 ^ _141;
    assign _2950 = _2949 & _139;
    assign _2952 = _2950 == _1235;
    assign _2923 = _1632 == _2922;
    assign _2924 = ~ _2923;
    assign _2926 = _2917 ? _2925 : g_crc_bad;
    assign _2927 = _1750 ? _2926 : g_crc_bad;
    assign _2928 = _1641 ? g_crc_bad : _2927;
    assign _2929 = _1596 ? _2928 : g_crc_bad;
    assign _2931 = _1501 ? _1128 : _2929;
    assign _142 = _2931;
    always @(posedge _326) begin
        if (_324)
            g_crc_bad <= _1128;
        else
            g_crc_bad <= _142;
    end
    assign _2925 = g_crc_bad | _2924;
    assign _2942 = ~ _2925;
    assign _2940 = 6'b000001;
    assign _2941 = g_left == _2940;
    assign _2943 = _2941 ? _2942 : _691;
    assign _2944 = _2917 ? _2943 : _691;
    assign _2945 = _1750 ? _2944 : _691;
    assign _2946 = _1641 ? _691 : _2945;
    assign _2947 = _1596 ? _2946 : _691;
    assign _2935 = ~ _1499;
    assign _2933 = ~ _1501;
    assign _2932 = _1780 & _204;
    assign _2934 = _2932 & _2933;
    assign _2936 = _2934 & _2935;
    assign _143 = _2936;
    always @(posedge _326) begin
        if (_324)
            g_resid_chk <= _1128;
        else
            g_resid_chk <= _143;
    end
    assign _2953 = g_resid_chk ? _2952 : _2947;
    assign _2955 = _1501 ? _1128 : _2953;
    assign _2957 = _1499 ? _1128 : _2955;
    assign _144 = _2957;
    always @(posedge _326) begin
        if (_324)
            _691 <= _1128;
        else
            _691 <= _144;
    end
    assign _2961 = _1489 ? _1955 : _2959;
    assign _2959 = _1459 ? _1955 : _683;
    assign _2962 = _1444 ? _2961 : _2959;
    assign _2964 = _1349 ? _1128 : _2962;
    assign _2966 = _1347 ? _1128 : _2964;
    assign _145 = _2966;
    always @(posedge _326) begin
        if (_324)
            _683 <= _1128;
        else
            _683 <= _145;
    end
    assign _2973 = _2972 ^ _150;
    assign _2974 = _2973 & _148;
    assign _2976 = _2974 == _1235;
    assign _2967 = ~ _265;
    assign _2977 = _2967 & _2976;
    assign _2979 = _2977 ? _1955 : _680;
    assign _2980 = _1652 ? _2979 : _680;
    assign _2981 = _1489 ? _680 : _2980;
    assign _2982 = _1444 ? _2981 : _680;
    assign _2984 = _1349 ? _1128 : _2982;
    assign _2986 = _1347 ? _1128 : _2984;
    assign _146 = _2986;
    always @(posedge _326) begin
        if (_324)
            _680 <= _1128;
        else
            _680 <= _146;
    end
    assign _148 = host_lane0_sync_mask;
    assign _150 = host_lane0_sync;
    assign _3024 = g_crc_0[31:16];
    assign _3025 = _3024 ^ _150;
    assign _3026 = _3025 & _148;
    assign _3028 = _3026 == _1235;
    assign _2999 = _1480 == _2998;
    assign _3000 = ~ _2999;
    assign _3002 = _2993 ? _3001 : g_crc_bad_0;
    assign _3003 = _1652 ? _3002 : g_crc_bad_0;
    assign _3004 = _1489 ? g_crc_bad_0 : _3003;
    assign _3005 = _1444 ? _3004 : g_crc_bad_0;
    assign _3007 = _1349 ? _1128 : _3005;
    assign _151 = _3007;
    always @(posedge _326) begin
        if (_324)
            g_crc_bad_0 <= _1128;
        else
            g_crc_bad_0 <= _151;
    end
    assign _3001 = g_crc_bad_0 | _3000;
    assign _3018 = ~ _3001;
    assign _3017 = g_left_0 == _2940;
    assign _3019 = _3017 ? _3018 : _677;
    assign _3020 = _2993 ? _3019 : _677;
    assign _3021 = _1652 ? _3020 : _677;
    assign _3022 = _1489 ? _677 : _3021;
    assign _3023 = _1444 ? _3022 : _677;
    assign _3011 = ~ _1347;
    assign _3009 = ~ _1349;
    assign _3008 = _1682 & _265;
    assign _3010 = _3008 & _3009;
    assign _3012 = _3010 & _3011;
    assign _152 = _3012;
    always @(posedge _326) begin
        if (_324)
            g_resid_chk_0 <= _1128;
        else
            g_resid_chk_0 <= _152;
    end
    assign _3029 = g_resid_chk_0 ? _3028 : _3023;
    assign _3031 = _1349 ? _1128 : _3029;
    assign _3033 = _1347 ? _1128 : _3031;
    assign _153 = _3033;
    always @(posedge _326) begin
        if (_324)
            _677 <= _1128;
        else
            _677 <= _153;
    end
    assign _155 = host_match_addr;
    assign _668 = _155[6:0];
    assign _667 = _657[7:1];
    assign _669 = _667 == _668;
    assign _664 = 16'b1010110011100001;
    assign _3038 = _665[10:10];
    assign _3037 = _665[12:12];
    assign _3039 = _3037 ^ _3038;
    assign _3036 = _665[13:13];
    assign _3040 = _3036 ^ _3039;
    assign _3035 = _665[15:15];
    assign _3041 = _3035 ^ _3040;
    assign _3034 = _665[14:0];
    assign _3042 = { _3034,
                     _3041 };
    assign _156 = _3042;
    always @(posedge _326) begin
        if (_324)
            _665 <= _664;
        else
            _665 <= _156;
    end
    assign _666 = _665[0:0];
    assign _3055 = _160 + _2433;
    assign _3053 = _160 - _2433;
    assign _3056 = _2498 ? _3055 : _3053;
    assign _2496 = _160 == _2114;
    assign _2505 = ~ _2496;
    assign _158 = host_rx_pop;
    assign _2506 = _158 & _2505;
    assign _2497 = ~ _662;
    assign _3049 = ~ _3048;
    assign _3045 = _1851 | _1865;
    assign _3043 = _1749 | _1816;
    assign _3044 = _1718 | _3043;
    assign _3046 = _3044 | _3045;
    assign _3050 = _3046 & _3049;
    assign f_rx_push = _3050;
    assign _2498 = f_rx_push & _2497;
    assign _3051 = _2498 ^ _2506;
    assign _3057 = _3051 ? _3056 : _160;
    always @(posedge _326) begin
        if (_324)
            _3060 <= _2114;
        else
            _3060 <= _3057;
    end
    assign _160 = _3060;
    assign _662 = _160 == _1889;
    assign _658 = _657[0:0];
    assign _3995 = _653[7:1];
    assign _3996 = { vdd,
                     _3995 };
    assign _3993 = _3985[7:7];
    assign _3992 = _3985[6:6];
    assign _3991 = _3985[5:5];
    assign _3990 = _3985[4:4];
    assign _3989 = _3985[3:3];
    assign _3988 = _3985[2:2];
    assign _3987 = _3985[1:1];
    assign _3986 = _3985[0:0];
    assign _3994 = { _3986,
                     _3987,
                     _3988,
                     _3989,
                     _3990,
                     _3991,
                     _3992,
                     _3993 };
    assign _3978 = _303 + _2433;
    assign _3976 = _303 - _2433;
    assign _3979 = _3077 ? _3978 : _3976;
    assign _1720 = _303 == _1889;
    assign _3076 = ~ _1720;
    assign _3073 = ~ _301;
    assign _162 = host_tx_push;
    assign _3074 = _162 & _3073;
    assign _1716 = ~ _1682;
    assign _1710 = g_bitpos_0 + _1490;
    assign _1705 = ~ _1474;
    assign g_tx_bit = _1695 & _1703;
    assign _1706 = g_tx_bit & _1705;
    assign _1707 = _1706 & g_data_left_0;
    assign _1708 = _1676 | _1707;
    assign _1711 = _1708 ? _1710 : g_bitpos_0;
    assign _1713 = _1711 == _1136;
    assign _1714 = ~ _1713;
    assign _1685 = _1684 & _297;
    assign _1715 = _1685 & _1714;
    assign _1717 = _1715 & _1716;
    assign _1681 = g_bitpos_0 == _2490;
    assign _1672 = g_cnt_0[5:0];
    assign _1673 = _1672 < _261;
    assign _1674 = ~ _1673;
    assign _1668 = g_cnt_0[15:6];
    assign _1670 = _1668 == _1140;
    assign _1671 = ~ _1670;
    assign _1675 = _1671 | _1674;
    assign _3966 = ~ _293;
    assign _3967 = _297 & _3966;
    assign _3970 = _3967 ? _1276 : _1277;
    assign _3959 = ~ _1703;
    assign _3960 = _1695 & _3959;
    assign _3961 = _674 | _3960;
    assign _3962 = _3961 | _3951;
    assign _3964 = _3962 ? _1277 : _3958;
    assign _3945 = g_run_0 + _1490;
    assign _3942 = g_run_0 + _1490;
    assign _3938 = vdd == g_last_0;
    assign _3936 = g_run_0 == _1136;
    assign _3937 = ~ _3936;
    assign _3939 = _3937 & _3938;
    assign _3943 = _3939 ? _3942 : _1490;
    assign _3934 = _275 == _1277;
    assign _3946 = _3934 ? _3945 : _3943;
    assign _3947 = _3946 == _165;
    assign _3928 = g_run_0 + _1490;
    assign _3924 = gnd == g_last_0;
    assign _3922 = g_run_0 == _1136;
    assign _3923 = ~ _3922;
    assign _3925 = _3923 & _3924;
    assign _3929 = _3925 ? _3928 : _1490;
    assign _3920 = _275 == _1277;
    assign _3931 = _3920 ? _1136 : _3929;
    assign _3932 = _3931 == _165;
    assign _3948 = _1480 ? _3947 : _3932;
    assign _3949 = _1469 & _3948;
    assign _3950 = ~ _3949;
    assign _3916 = g_left_0 == _2940;
    assign _3914 = g_left_0 == _1259;
    assign _3917 = _2993 ? _3916 : _3914;
    assign _3909 = g_cnt_0 + _4242;
    assign _3910 = _3909 == _1665;
    assign _3907 = g_cnt_0 == _1665;
    assign _3911 = _1667 ? _3910 : _3907;
    assign _3905 = ~ _1489;
    assign _3906 = _1444 & _3905;
    assign _3912 = _3906 & _3911;
    assign _3918 = _3912 & _3917;
    assign _3951 = _3918 & _3950;
    assign _3953 = _3951 ? _2091 : _3904;
    assign _3955 = _1489 ? _2565 : _3953;
    assign _3901 = _1703 ? _3899 : _2091;
    assign _3897 = _1373 & _1371;
    assign _3899 = _3897 ? _1277 : g_mode_0;
    assign _3902 = _1695 ? _3901 : _3899;
    assign _3152 = _1703 ? _3151 : _3063;
    assign _3153 = _1695 ? _3152 : _3063;
    assign _163 = _3153;
    always @(posedge _326) begin
        if (_324)
            _3063 <= _1128;
        else
            _3063 <= _163;
    end
    assign _3823 = ~ _3151;
    assign _3821 = ~ f_lane0_out;
    assign _3822 = _3151 ? f_lane0_out : _3821;
    always @* begin
        case (_291)
        0:
            _3824 <= _3151;
        1:
            _3824 <= _3822;
        2:
            _3824 <= _3823;
        default:
            _3824 <= _3151;
        endcase
    end
    assign _165 = host_lane0_stuff_len;
    assign _3805 = g_run_0 + _1490;
    assign _3806 = _1480 ? _3805 : _1136;
    assign _3801 = g_run_0 + _1490;
    assign _3797 = _1480 == g_last_0;
    assign _3795 = g_run_0 == _1136;
    assign _3796 = ~ _3795;
    assign _3798 = _3796 & _3797;
    assign _3802 = _3798 ? _3801 : _1490;
    assign _3793 = _275 == _1277;
    assign _3807 = _3793 ? _3806 : _3802;
    assign _3808 = _1489 ? _3791 : _3807;
    assign _3787 = g_run_0 + _1490;
    assign _3788 = _3151 ? _3787 : _1136;
    assign _3783 = g_run_0 + _1490;
    assign _3148 = _3140[7:7];
    assign _3147 = _3140[6:6];
    assign _3146 = _3140[5:5];
    assign _3145 = _3140[4:4];
    assign _3144 = _3140[3:3];
    assign _3143 = _3140[2:2];
    assign _3142 = _3140[1:1];
    assign _3138 = _3130[7:7];
    assign _3137 = _3130[6:6];
    assign _3136 = _3130[5:5];
    assign _3135 = _3130[4:4];
    assign _3134 = _3130[3:3];
    assign _3133 = _3130[2:2];
    assign _3132 = _3130[1:1];
    assign _3124 = _3080 == _2490;
    assign _3125 = _3077 & _3124;
    always @(posedge _326) begin
        if (_324)
            _3126 <= _1285;
        else
            if (_3125)
                _3126 <= _3070;
    end
    assign _3118 = _3080 == _1991;
    assign _3119 = _3077 & _3118;
    always @(posedge _326) begin
        if (_324)
            _3120 <= _1285;
        else
            if (_3119)
                _3120 <= _3070;
    end
    assign _3112 = _3080 == _1992;
    assign _3113 = _3077 & _3112;
    always @(posedge _326) begin
        if (_324)
            _3114 <= _1285;
        else
            if (_3113)
                _3114 <= _3070;
    end
    assign _3106 = _3080 == _1333;
    assign _3107 = _3077 & _3106;
    always @(posedge _326) begin
        if (_324)
            _3108 <= _1285;
        else
            if (_3107)
                _3108 <= _3070;
    end
    assign _3100 = _3080 == _1995;
    assign _3101 = _3077 & _3100;
    always @(posedge _326) begin
        if (_324)
            _3102 <= _1285;
        else
            if (_3101)
                _3102 <= _3070;
    end
    assign _3094 = _3080 == _1463;
    assign _3095 = _3077 & _3094;
    always @(posedge _326) begin
        if (_324)
            _3096 <= _1285;
        else
            if (_3095)
                _3096 <= _3070;
    end
    assign _3088 = _3080 == _1490;
    assign _3089 = _3077 & _3088;
    always @(posedge _326) begin
        if (_324)
            _3090 <= _1285;
        else
            if (_3089)
                _3090 <= _3070;
    end
    assign _3155 = _3080 + _1490;
    assign _3156 = _3077 ? _3155 : _3080;
    assign _166 = _3156;
    always @(posedge _326) begin
        if (_324)
            _3080 <= _1136;
        else
            _3080 <= _166;
    end
    assign _3082 = _3080 == _1136;
    assign _3083 = _3077 & _3082;
    assign _3223 = _1676 ? _3222 : g_byte_0;
    assign _3224 = _1682 ? _3222 : _3223;
    assign _3174 = _3173 ? _3171 : _3161;
    assign _3172 = _3158 ? _3171 : _3161;
    assign _3175 = _1820 ? _3174 : _3172;
    assign _167 = _3175;
    always @(posedge _326) begin
        if (_324)
            _3161 <= _1285;
        else
            _3161 <= _167;
    end
    assign _3170 = _1774 ? _3169 : g_byte;
    assign _3171 = _1780 ? _3169 : _3170;
    assign _3216 = _1749 ? _3161 : _3171;
    assign _3183 = _3182 ? _657 : _3180;
    assign _3181 = _3177 ? _657 : _3180;
    assign _3184 = _1872 ? _3183 : _3181;
    assign _168 = _3184;
    always @(posedge _326) begin
        if (_324)
            _3180 <= _1285;
        else
            _3180 <= _168;
    end
    assign _3201 = _657[6:0];
    assign _3202 = { _3201,
                     _3198 };
    assign _3199 = _657[7:1];
    assign _3197 = _371[7:7];
    assign _3196 = _371[6:6];
    assign _3195 = _371[5:5];
    assign _3194 = _371[4:4];
    assign _3193 = _371[3:3];
    assign _3192 = _371[2:2];
    assign _3191 = _371[1:1];
    assign _3190 = _371[0:0];
    assign _3188 = _773[102:100];
    assign _3187 = _767[102:100];
    assign _3186 = _761[102:100];
    assign _3185 = _364[102:100];
    always @* begin
        case (f_winner)
        0:
            _3189 <= _3185;
        1:
            _3189 <= _3186;
        2:
            _3189 <= _3187;
        default:
            _3189 <= _3188;
        endcase
    end
    always @* begin
        case (_3189)
        0:
            _3198 <= _3190;
        1:
            _3198 <= _3191;
        2:
            _3198 <= _3192;
        3:
            _3198 <= _3193;
        4:
            _3198 <= _3194;
        5:
            _3198 <= _3195;
        6:
            _3198 <= _3196;
        default:
            _3198 <= _3197;
        endcase
    end
    assign _3200 = { _3198,
                     _3199 };
    always @* begin
        case (_1862)
        0:
            _3203 <= _657;
        1:
            _3203 <= _3200;
        2:
            _3203 <= _3202;
        default:
            _3203 <= _657;
        endcase
    end
    assign _3204 = _1855 ? _3203 : _657;
    assign _169 = _3204;
    always @(posedge _326) begin
        if (_324)
            _657 <= _1285;
        else
            _657 <= _169;
    end
    assign _3182 = _1851 & _1865;
    assign _3208 = _3182 ? _1851 : _1128;
    assign _3176 = ~ _1851;
    assign _3177 = _3176 & _1865;
    assign _3206 = _3177 ? _1955 : _1851;
    assign _1859 = _773[97:96];
    assign _1858 = _767[97:96];
    assign _1857 = _761[97:96];
    assign _1856 = _364[97:96];
    always @* begin
        case (f_winner)
        0:
            _1860 <= _1856;
        1:
            _1860 <= _1857;
        2:
            _1860 <= _1858;
        default:
            _1860 <= _1859;
        endcase
    end
    assign _1862 = _1854 ? _2565 : _1860;
    assign f_eng_push = _1862 == _2091;
    assign _1865 = _1855 & f_eng_push;
    assign _1871 = _1851 | _1865;
    assign _1868 = _1749 | _1816;
    assign _1869 = ~ _1868;
    assign _1867 = ~ _1718;
    assign _1870 = _1867 & _1869;
    assign _1872 = _1870 & _1871;
    assign _3209 = _1872 ? _3208 : _3206;
    assign _170 = _3209;
    always @(posedge _326) begin
        if (_324)
            _1851 <= _1128;
        else
            _1851 <= _170;
    end
    assign _3215 = _1851 ? _3180 : _657;
    assign _3173 = _1749 & _1816;
    assign _3213 = _3173 ? _1749 : _1128;
    assign _1814 = ~ _1780;
    assign _1808 = g_bitpos + _1490;
    assign _1803 = ~ _1626;
    assign g_tx_bit_0 = _1793 & _1801;
    assign _1804 = g_tx_bit_0 & _1803;
    assign _1805 = _1804 & g_data_left;
    assign _1806 = _1774 | _1805;
    assign _1809 = _1806 ? _1808 : g_bitpos;
    assign _1811 = _1809 == _1136;
    assign _1812 = ~ _1811;
    assign _1783 = _1782 & _236;
    assign _1813 = _1783 & _1812;
    assign _1815 = _1813 & _1814;
    assign _1779 = g_bitpos == _2490;
    assign _1780 = _1774 & _1779;
    assign _1816 = _1780 | _1815;
    assign _3157 = ~ _1749;
    assign _3158 = _3157 & _1816;
    assign _3211 = _3158 ? _1955 : _1749;
    assign _3214 = _1820 ? _3213 : _3211;
    assign _171 = _3214;
    always @(posedge _326) begin
        if (_324)
            _1749 <= _1128;
        else
            _1749 <= _171;
    end
    assign _1819 = _1749 | _1816;
    assign _1818 = ~ _1718;
    assign _1820 = _1818 & _1819;
    assign _3217 = _1820 ? _3216 : _3215;
    assign _3225 = _1718 ? _3224 : _3217;
    assign _172 = _3225;
    assign _173 = _172;
    assign _175 = host_tx_data;
    assign _3070 = _302 ? _173 : _175;
    always @(posedge _326) begin
        if (_324)
            _3084 <= _1285;
        else
            if (_3083)
                _3084 <= _3070;
    end
    assign _3614 = _3069 + _1490;
    assign _3611 = ~ _660;
    assign _1948 = ~ _660;
    assign _1784 = ~ _236;
    assign _3601 = ~ _234;
    assign _3602 = _236 & _3601;
    assign _3605 = _3602 ? _1276 : _1277;
    assign _3594 = ~ _1801;
    assign _3595 = _1793 & _3594;
    assign _3596 = _688 | _3595;
    assign _3597 = _3596 | _3586;
    assign _3599 = _3597 ? _1277 : _3593;
    assign _3580 = g_run + _1490;
    assign _3577 = g_run + _1490;
    assign _3573 = vdd == g_last;
    assign _3571 = g_run == _1136;
    assign _3572 = ~ _3571;
    assign _3574 = _3572 & _3573;
    assign _3578 = _3574 ? _3577 : _1490;
    assign _3569 = _214 == _1277;
    assign _3581 = _3569 ? _3580 : _3578;
    assign _3582 = _3581 == _178;
    assign _3563 = g_run + _1490;
    assign _3559 = gnd == g_last;
    assign _3557 = g_run == _1136;
    assign _3558 = ~ _3557;
    assign _3560 = _3558 & _3559;
    assign _3564 = _3560 ? _3563 : _1490;
    assign _3555 = _214 == _1277;
    assign _3566 = _3555 ? _1136 : _3564;
    assign _3567 = _3566 == _178;
    assign _3583 = _1632 ? _3582 : _3567;
    assign _3584 = _1621 & _3583;
    assign _3585 = ~ _3584;
    assign _3551 = g_left == _2940;
    assign _3549 = g_left == _1259;
    assign _3552 = _2917 ? _3551 : _3549;
    assign _3544 = g_cnt + _4242;
    assign _3545 = _3544 == _1763;
    assign _3542 = g_cnt == _1763;
    assign _3546 = _1765 ? _3545 : _3542;
    assign _3540 = ~ _1641;
    assign _3541 = _1596 & _3540;
    assign _3547 = _3541 & _3546;
    assign _3553 = _3547 & _3552;
    assign _3586 = _3553 & _3585;
    assign _3588 = _3586 ? _2091 : _3539;
    assign _3590 = _1641 ? _2565 : _3588;
    assign _3536 = _1801 ? _3534 : _2091;
    assign _3532 = _1525 & _1523;
    assign _3534 = _3532 ? _1277 : g_mode;
    assign _3537 = _1793 ? _3536 : _3534;
    assign _3253 = _1801 ? _3252 : _3228;
    assign _3254 = _1793 ? _3253 : _3228;
    assign _176 = _3254;
    always @(posedge _326) begin
        if (_324)
            _3228 <= _1128;
        else
            _3228 <= _176;
    end
    assign _3462 = ~ _3252;
    assign _3460 = ~ f_lane1_out;
    assign _3461 = _3252 ? f_lane1_out : _3460;
    always @* begin
        case (_230)
        0:
            _3463 <= _3252;
        1:
            _3463 <= _3461;
        2:
            _3463 <= _3462;
        default:
            _3463 <= _3252;
        endcase
    end
    assign _178 = host_lane1_stuff_len;
    assign _3444 = g_run + _1490;
    assign _3445 = _1632 ? _3444 : _1136;
    assign _3440 = g_run + _1490;
    assign _3436 = _1632 == g_last;
    assign _3434 = g_run == _1136;
    assign _3435 = ~ _3434;
    assign _3437 = _3435 & _3436;
    assign _3441 = _3437 ? _3440 : _1490;
    assign _3432 = _214 == _1277;
    assign _3446 = _3432 ? _3445 : _3441;
    assign _3447 = _1641 ? _3430 : _3446;
    assign _3426 = g_run + _1490;
    assign _3427 = _3252 ? _3426 : _1136;
    assign _3422 = g_run + _1490;
    assign _3249 = _3241[7:7];
    assign _3248 = _3241[6:6];
    assign _3247 = _3241[5:5];
    assign _3246 = _3241[4:4];
    assign _3245 = _3241[3:3];
    assign _3244 = _3241[2:2];
    assign _3243 = _3241[1:1];
    assign _3239 = _3231[7:7];
    assign _3238 = _3231[6:6];
    assign _3237 = _3231[5:5];
    assign _3236 = _3231[4:4];
    assign _3235 = _3231[3:3];
    assign _3234 = _3231[2:2];
    assign _3233 = _3231[1:1];
    assign _3230 = _660 ? _1283 : _3127;
    assign _3167 = g_byte[7:1];
    assign _3168 = { _1632,
                     _3167 };
    assign _3165 = g_byte[6:0];
    assign _3166 = { _3165,
                     _1632 };
    assign _3169 = _181 ? _3168 : _3166;
    assign _3259 = _1774 ? _3169 : _3258;
    assign _3260 = _1765 ? _3259 : _3258;
    assign _3261 = _1750 ? _3260 : _3258;
    assign _3262 = _1641 ? _3258 : _3261;
    assign _3255 = g_data_left ? _3231 : g_byte;
    assign _3256 = _1626 ? g_byte : _3255;
    assign _3257 = _1801 ? _3256 : g_byte;
    assign _3258 = _1793 ? _3257 : g_byte;
    assign _3263 = _1596 ? _3262 : _3258;
    assign _179 = _3263;
    always @(posedge _326) begin
        if (_324)
            g_byte <= _1285;
        else
            g_byte <= _179;
    end
    assign _1945 = g_bitpos == _1136;
    assign _1942 = ~ _1626;
    assign _1943 = _1942 & g_data_left;
    assign _1946 = _1943 & _1945;
    assign _3231 = _1946 ? _3230 : g_byte;
    assign _3232 = _3231[0:0];
    assign _3240 = { _3232,
                     _3233,
                     _3234,
                     _3235,
                     _3236,
                     _3237,
                     _3238,
                     _3239 };
    assign _181 = host_lane1_lsb_first;
    assign _3241 = _181 ? _3231 : _3240;
    assign _3242 = _3241[0:0];
    assign _3271 = g_bitpos + _1490;
    assign _1770 = g_cnt[5:0];
    assign _1771 = _1770 < _200;
    assign _1772 = ~ _1771;
    assign _1766 = g_cnt[15:6];
    assign _1768 = _1766 == _1140;
    assign _1769 = ~ _1768;
    assign _1773 = _1769 | _1772;
    assign _1774 = _1765 & _1773;
    assign _3272 = _1774 ? _3271 : _3269;
    assign _3273 = _1765 ? _3272 : _3269;
    assign _3274 = _1750 ? _3273 : _3269;
    assign _3275 = _1641 ? _3269 : _3274;
    assign _3265 = g_bitpos + _1490;
    assign _3266 = g_data_left ? _3265 : g_bitpos;
    assign _3267 = _1626 ? g_bitpos : _3266;
    assign _3268 = _1801 ? _3267 : g_bitpos;
    assign _3269 = _1793 ? _3268 : g_bitpos;
    assign _3276 = _1596 ? _3275 : _3269;
    assign _3278 = _1501 ? _1136 : _3276;
    assign _182 = _3278;
    always @(posedge _326) begin
        if (_324)
            g_bitpos <= _1136;
        else
            g_bitpos <= _182;
    end
    always @* begin
        case (g_bitpos)
        0:
            _3250 <= _3242;
        1:
            _3250 <= _3243;
        2:
            _3250 <= _3244;
        3:
            _3250 <= _3245;
        4:
            _3250 <= _3246;
        5:
            _3250 <= _3247;
        6:
            _3250 <= _3248;
        default:
            _3250 <= _3249;
        endcase
    end
    assign _184 = host_lane1_crc_inv;
    assign _186 = host_lane1_init;
    assign _3331 = g_crc[30:0];
    assign _3333 = { _3331,
                     _1128 };
    assign _3324 = g_crc[31:31];
    assign _3325 = _1632 ^ _3324;
    assign _3327 = _3325 ? _191 : _2122;
    assign _3321 = g_crc[30:0];
    assign _3323 = { _3321,
                     _1128 };
    assign _3328 = _3323 ^ _3327;
    assign _3317 = g_cnt[5:0];
    assign _3318 = _3317 < _202;
    assign _3319 = ~ _3318;
    assign _3312 = g_cnt[15:6];
    assign _3314 = _3312 == _1140;
    assign _3315 = ~ _3314;
    assign _3311 = ~ _204;
    assign _3316 = _3311 | _3315;
    assign _3320 = _3316 | _3319;
    assign _3329 = _3320 ? _3328 : _3310;
    assign _3330 = _1765 ? _3329 : _3310;
    assign _188 = host_lane1_crc_width;
    assign _3288 = g_left - _2940;
    assign _3289 = _2917 ? _3288 : _3286;
    assign _3290 = _1750 ? _3289 : _3286;
    assign _3291 = _1641 ? _3286 : _3290;
    assign _3282 = g_left - _2940;
    assign _3283 = g_data_left ? g_left : _3282;
    assign _3284 = _1626 ? g_left : _3283;
    assign _3285 = _1801 ? _3284 : g_left;
    assign _3286 = _1793 ? _3285 : g_left;
    assign _3292 = _1596 ? _3291 : _3286;
    assign _3293 = _3280 ? _188 : _3292;
    assign _3295 = _1501 ? _1259 : _3293;
    assign _189 = _3295;
    always @(posedge _326) begin
        if (_324)
            g_left <= _1259;
        else
            g_left <= _189;
    end
    assign _1799 = g_left == _1259;
    assign _1800 = ~ _1799;
    assign _2915 = ~ g_data_left;
    assign _2914 = _1596 & _1750;
    assign _2916 = _2914 & _2915;
    assign _2917 = _2916 & _1800;
    assign _3334 = _2917 ? _3333 : _3330;
    assign _3335 = _1750 ? _3334 : _3310;
    assign _3336 = _1641 ? _3310 : _3335;
    assign _191 = host_lane1_poly;
    assign _3302 = g_crc[31:31];
    assign _3303 = _3252 ^ _3302;
    assign _3305 = _3303 ? _191 : _2122;
    assign _3299 = g_crc[30:0];
    assign _3301 = { _3299,
                     _1128 };
    assign _3306 = _3301 ^ _3305;
    assign _3296 = g_crc[30:0];
    assign _3298 = { _3296,
                     _1128 };
    assign _3307 = g_data_left ? _3306 : _3298;
    assign _3308 = _1626 ? g_crc : _3307;
    assign _3309 = _1801 ? _3308 : g_crc;
    assign _3310 = _1793 ? _3309 : g_crc;
    assign _3337 = _1596 ? _3336 : _3310;
    assign _3338 = _1501 ? _186 : _3337;
    assign _3340 = _1499 ? _2122 : _3338;
    assign _192 = _3340;
    always @(posedge _326) begin
        if (_324)
            g_crc <= _2122;
        else
            g_crc <= _192;
    end
    assign _2921 = g_crc[31:31];
    assign _2922 = _2921 ^ _184;
    assign _3356 = _3355 ? _3353 : g_lim;
    assign _3357 = g_len_cap ? _3356 : g_lim;
    assign _193 = _3357;
    always @(posedge _326) begin
        if (_324)
            g_lim <= _1285;
        else
            g_lim <= _193;
    end
    assign _1762 = { _1285,
                     g_lim };
    assign _195 = host_lane1_frame_bits;
    assign _2895 = g_sr[14:0];
    assign _2896 = { _2895,
                     _1632 };
    assign _3358 = _1750 ? _2896 : g_sr;
    assign _3359 = _1641 ? g_sr : _3358;
    assign _3360 = _1596 ? _3359 : g_sr;
    assign _3362 = _1501 ? _1235 : _3360;
    assign _196 = _3362;
    always @(posedge _326) begin
        if (_324)
            g_sr <= _1235;
        else
            g_sr <= _196;
    end
    assign _3348 = g_sr[3:0];
    assign _198 = host_lane1_len_max;
    assign _3349 = _198 < _3348;
    assign _3350 = _3349 ? _198 : _3348;
    assign _3352 = { _1128,
                     _3350,
                     _1136 };
    assign _200 = host_lane1_skip;
    assign _3346 = { _2565,
                     _200 };
    assign _3353 = _3346 + _3352;
    assign _3354 = { _1285,
                     _3353 };
    assign _3355 = _3354 < _195;
    assign _3383 = _3355 ? _1955 : g_len_known;
    assign _202 = host_lane1_len_pos;
    assign _3369 = g_cnt[5:0];
    assign _3370 = _3369 == _202;
    assign _3365 = g_cnt[15:6];
    assign _3367 = _3365 == _1140;
    assign _204 = host_lane1_crc_resid;
    assign _3363 = ~ _204;
    assign _206 = host_lane1_len_en;
    assign _3364 = _206 & _3363;
    assign _3368 = _3364 & _3367;
    assign _3371 = _3368 & _3370;
    assign _3373 = _3371 ? _1955 : g_len_cap;
    assign _3374 = _1765 ? _3373 : g_len_cap;
    assign _3375 = _1750 ? _3374 : g_len_cap;
    assign _3376 = _1641 ? g_len_cap : _3375;
    assign _3377 = _1596 ? _3376 : g_len_cap;
    assign _3379 = g_len_cap ? _1128 : _3377;
    assign _3381 = _1501 ? _1128 : _3379;
    assign _207 = _3381;
    always @(posedge _326) begin
        if (_324)
            g_len_cap <= _1128;
        else
            g_len_cap <= _207;
    end
    assign _3384 = g_len_cap ? _3383 : g_len_known;
    assign _3386 = _1501 ? _1128 : _3384;
    assign _208 = _3386;
    always @(posedge _326) begin
        if (_324)
            g_len_known <= _1128;
        else
            g_len_known <= _208;
    end
    assign _1763 = g_len_known ? _1762 : _195;
    assign _3406 = g_cnt + _4242;
    assign _1751 = _1596 & _1750;
    assign _1765 = _1751 & g_data_left;
    assign _3407 = _1765 ? _3406 : _3404;
    assign _1750 = ~ _1626;
    assign _3408 = _1750 ? _3407 : _3404;
    assign _3389 = _1641 ? _3388 : _1632;
    assign _3387 = _1801 ? _3252 : g_last;
    assign _3388 = _1793 ? _3387 : g_last;
    assign _3390 = _1596 ? _3389 : _3388;
    assign _3392 = _1501 ? _1955 : _3390;
    assign _209 = _3392;
    always @(posedge _326) begin
        if (_324)
            g_last <= vdd;
        else
            g_last <= _209;
    end
    assign _1637 = ~ g_last;
    assign _1634 = _214 == _1276;
    assign _1638 = _1634 ? _1637 : gnd;
    assign _3394 = _230 == _1276;
    assign _3395 = _3394 ? _1516 : g_prev;
    assign _3396 = _1596 ? _3395 : g_prev;
    assign _3398 = _1501 ? _1955 : _3396;
    assign _210 = _3398;
    always @(posedge _326) begin
        if (_324)
            g_prev <= vdd;
        else
            g_prev <= _210;
    end
    assign _1631 = _1516 == g_prev;
    assign _1628 = _230 == _1276;
    assign _1632 = _1628 ? _1631 : _1516;
    assign _1639 = _1632 == _1638;
    assign _1640 = ~ _1639;
    assign _1641 = _1626 & _1640;
    assign _3409 = _1641 ? _3404 : _3408;
    assign _3400 = g_cnt + _4242;
    assign _3401 = g_data_left ? _3400 : g_cnt;
    assign _3402 = _1626 ? g_cnt : _3401;
    assign _3403 = _1801 ? _3402 : g_cnt;
    assign _3404 = _1793 ? _3403 : g_cnt;
    assign _3410 = _1596 ? _3409 : _3404;
    assign _3412 = _1501 ? _1235 : _3410;
    assign _211 = _3412;
    always @(posedge _326) begin
        if (_324)
            g_cnt <= _1235;
        else
            g_cnt <= _211;
    end
    assign g_data_left = g_cnt < _1763;
    assign _3251 = g_data_left ? _3250 : _2922;
    assign _3252 = _1626 ? _1638 : _3251;
    assign _3418 = _3252 == g_last;
    assign _3416 = g_run == _1136;
    assign _3417 = ~ _3416;
    assign _3419 = _3417 & _3418;
    assign _3423 = _3419 ? _3422 : _1490;
    assign _3414 = _214 == _1277;
    assign _3428 = _3414 ? _3427 : _3423;
    assign _3429 = _1801 ? _3428 : g_run;
    assign _3430 = _1793 ? _3429 : g_run;
    assign _3448 = _1596 ? _3447 : _3430;
    assign _3450 = _1501 ? _1136 : _3448;
    assign _212 = _3450;
    always @(posedge _326) begin
        if (_324)
            g_run <= _1136;
        else
            g_run <= _212;
    end
    assign _1625 = g_run == _178;
    assign _214 = host_lane1_stuff;
    assign _1620 = _214 == _2565;
    assign _1621 = ~ _1620;
    assign _1626 = _1621 & _1625;
    assign _1794 = _1626 | g_data_left;
    assign _1801 = _1794 | _1800;
    assign _3464 = _1801 ? _3463 : _1955;
    assign _3465 = _1793 ? _3464 : f_lane1_out;
    assign _1789 = _1569 == _1235;
    assign _1787 = _1534 == _1235;
    assign _1790 = _1562 ? _1789 : _1787;
    assign _1791 = _1530 ? vdd : _1790;
    assign _1792 = _234 ? _1594 : _1791;
    assign _3457 = ~ _1792;
    assign _3454 = _230 == _1277;
    assign _3451 = ~ _236;
    assign _3452 = _1503 & _3451;
    assign _3455 = _3452 & _3454;
    assign _3456 = _3455 & _1595;
    assign _3458 = _3456 & _3457;
    assign _3466 = _3458 ? _3228 : _3465;
    assign _3468 = _1611 ? _1955 : _3466;
    assign _3470 = _1782 ? _1955 : _3468;
    assign _3472 = _1501 ? _1955 : _3470;
    assign _3474 = _1499 ? _1955 : _3472;
    assign _215 = _3474;
    always @(posedge _326) begin
        if (_324)
            f_lane1_out <= vdd;
        else
            f_lane1_out <= _215;
    end
    assign _1609 = _1516 == f_lane1_out;
    assign _1610 = ~ _1609;
    assign _1603 = _230 == _1277;
    assign _1604 = ~ _1603;
    assign _1600 = ~ _234;
    assign _217 = host_lane1_readback;
    assign _1597 = ~ _236;
    assign _1598 = _1503 & _1597;
    assign _1599 = _1598 & _217;
    assign _1601 = _1599 & _1600;
    assign _1605 = _1601 & _1604;
    assign _1606 = _1605 & _1595;
    assign _1611 = _1606 & _1610;
    assign _3539 = _1611 ? _2565 : _3537;
    assign _1592 = ~ _1586;
    assign _1593 = _1589 & _1592;
    always @(posedge _326) begin
        if (_324)
            _1589 <= _1128;
        else
            _1589 <= _1586;
    end
    assign _1590 = ~ _1589;
    assign _1582 = _368[7:7];
    assign _1581 = _368[6:6];
    assign _1580 = _368[5:5];
    assign _1579 = _368[4:4];
    assign _1578 = _368[3:3];
    assign _1577 = _368[2:2];
    assign _1576 = _368[1:1];
    assign _1575 = _368[0:0];
    assign _219 = host_lane1_clk_pin;
    always @* begin
        case (_219)
        0:
            _1583 <= _1575;
        1:
            _1583 <= _1576;
        2:
            _1583 <= _1577;
        3:
            _1583 <= _1578;
        4:
            _1583 <= _1579;
        5:
            _1583 <= _1580;
        6:
            _1583 <= _1581;
        default:
            _1583 <= _1582;
        endcase
    end
    always @(posedge _326) begin
        if (_324)
            _1586 <= _1128;
        else
            _1586 <= _1583;
    end
    assign _1591 = _1586 & _1590;
    assign _221 = host_lane1_clk_edge;
    assign _1594 = _221 ? _1593 : _1591;
    assign _1573 = _1558 == _1235;
    assign _1570 = _1569 == _1558;
    assign _1563 = _1534 == _1558;
    assign _1561 = ~ _1525;
    assign _1552 = _223[15:2];
    assign _1553 = { _2565,
                     _1552 };
    assign _1549 = _223[15:1];
    assign _1550 = { _1128,
                     _1549 };
    assign _1554 = _1550 + _1553;
    assign _1546 = _223[15:1];
    assign _1547 = { _1128,
                     _1546 };
    assign _1544 = _236 & _1527;
    assign _1555 = _1544 ? _1554 : _1547;
    always @(posedge _326) begin
        if (_324)
            _1558 <= _1235;
        else
            _1558 <= _1555;
    end
    assign _1559 = _1534 < _1558;
    assign _1536 = _223[15:2];
    assign _1537 = { _2565,
                     _1536 };
    always @(posedge _326) begin
        if (_324)
            _1540 <= _1235;
        else
            _1540 <= _1537;
    end
    assign _3520 = ~ _1525;
    assign _3521 = _1560 & _3520;
    assign _3522 = _3521 ? _1569 : _1534;
    assign _3524 = _1530 ? _1235 : _3522;
    assign _3526 = _3524 + _4242;
    assign _3504 = _3498 == _1195;
    assign _1565 = _223[15:1];
    assign _1566 = { _1128,
                     _1565 };
    always @(posedge _326) begin
        if (_324)
            _1569 <= _1235;
        else
            _1569 <= _1566;
    end
    assign _3500 = { gnd,
                     _1569 };
    assign _3501 = _3500 == _3498;
    assign _3494 = { gnd,
                     _223 };
    always @(posedge _326) begin
        if (_324)
            _3497 <= _1195;
        else
            _3497 <= _3494;
    end
    assign _3489 = 17'b00000000000000001;
    assign _223 = host_lane1_div_int;
    assign _3488 = { gnd,
                     _223 };
    assign _3490 = _3488 - _3489;
    always @(posedge _326) begin
        if (_324)
            _3493 <= _1195;
        else
            _3493 <= _3490;
    end
    assign _225 = host_lane1_div_frac;
    assign _3508 = { gnd,
                     _225 };
    assign _3510 = _3509[7:0];
    assign _3511 = _3506 ? _3510 : _3482;
    assign _3512 = _3479 ? _3511 : _3482;
    assign _3514 = _1501 ? _1285 : _3512;
    assign _226 = _3514;
    always @(posedge _326) begin
        if (_324)
            _3482 <= _1285;
        else
            _3482 <= _226;
    end
    assign _3507 = { gnd,
                     _3482 };
    assign _3509 = _3507 + _3508;
    assign _3515 = _3509[8:8];
    assign _3516 = _3506 ? _3515 : _3487;
    assign _3517 = _3479 ? _3516 : _3487;
    assign _3519 = _1501 ? _1128 : _3517;
    assign _227 = _3519;
    always @(posedge _326) begin
        if (_324)
            _3487 <= _1128;
        else
            _3487 <= _227;
    end
    assign _3498 = _3487 ? _3497 : _3493;
    assign _3484 = { gnd,
                     _1534 };
    assign _3499 = _3484 == _3498;
    assign _3502 = _1562 ? _3501 : _3499;
    assign _3505 = _1530 ? _3504 : _3502;
    assign _3483 = ~ _234;
    assign _3506 = _3483 & _3505;
    assign _3528 = _3506 ? _1235 : _3526;
    assign _3478 = ~ _234;
    assign _3476 = _1525 & _1523;
    assign _688 = g_mode == _2091;
    assign _3475 = _1503 | _688;
    assign _3477 = _3475 | _3476;
    assign _3479 = _3477 & _3478;
    assign _3529 = _3479 ? _3528 : _1534;
    assign _3531 = _1501 ? _1235 : _3529;
    assign _228 = _3531;
    always @(posedge _326) begin
        if (_324)
            _1534 <= _1235;
        else
            _1534 <= _228;
    end
    assign _1541 = _1534 < _1540;
    assign _1542 = ~ _1541;
    assign _1531 = _1523 & _1527;
    assign _1543 = _1531 & _1542;
    assign _1560 = _1543 & _1559;
    assign _1562 = _1560 & _1561;
    assign _1571 = _1562 ? _1570 : _1563;
    assign _230 = host_lane1_code;
    assign _1527 = _230 == _1277;
    assign _1528 = ~ _1527;
    assign _1525 = g_mode == _1276;
    assign _1529 = _1525 | _1528;
    assign _1522 = ~ _234;
    always @(posedge _326) begin
        if (_324)
            _1519 <= _1128;
        else
            _1519 <= _1516;
    end
    assign _1512 = _368[7:7];
    assign _1511 = _368[6:6];
    assign _1510 = _368[5:5];
    assign _1509 = _368[4:4];
    assign _1508 = _368[3:3];
    assign _1507 = _368[2:2];
    assign _1506 = _368[1:1];
    assign _1505 = _368[0:0];
    assign _232 = host_lane1_data_pin;
    always @* begin
        case (_232)
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
    always @(posedge _326) begin
        if (_324)
            _1516 <= _1128;
        else
            _1516 <= _1513;
    end
    assign _1520 = _1516 ^ _1519;
    assign _1521 = _236 & _1520;
    assign _1523 = _1521 & _1522;
    assign _1530 = _1523 & _1529;
    assign _1574 = _1530 ? _1573 : _1571;
    assign _234 = host_lane1_clk_pin_en;
    assign _1595 = _234 ? _1594 : _1574;
    assign _236 = host_lane1_dir;
    assign _1504 = _1503 & _236;
    assign _1596 = _1504 & _1595;
    assign _3591 = _1596 ? _3590 : _3539;
    assign _1782 = _298 == _1991;
    assign _3593 = _1782 ? _2565 : _3591;
    assign _3280 = _298 == _2490;
    assign _3600 = _3280 ? _3599 : _3593;
    assign _1501 = _298 == _1992;
    assign _3606 = _1501 ? _3605 : _3600;
    assign _1498 = _298 == _1333;
    assign _1499 = _1498 | _333;
    assign _3608 = _1499 ? _2565 : _3606;
    assign _237 = _3608;
    always @(posedge _326) begin
        if (_324)
            g_mode <= _2565;
        else
            g_mode <= _237;
    end
    assign _1503 = g_mode == _1277;
    assign _1785 = _1503 & _1784;
    assign _1793 = _1785 & _1792;
    assign _1947 = _1793 & _1946;
    assign _1949 = _1947 & _1948;
    assign _1940 = ~ _660;
    assign _1939 = _1695 & _1938;
    assign _1941 = _1939 & _1940;
    assign _1950 = _1941 | _1949;
    assign _1931 = _1927 == _1277;
    assign _1929 = _1927 == _1276;
    assign _1932 = _1929 | _1931;
    assign _3609 = _1855 & _1932;
    assign _3610 = _3609 | _1950;
    assign _238 = _3610;
    assign _3612 = _238 & _3611;
    assign _3615 = _3612 ? _3614 : _3069;
    assign _239 = _3615;
    always @(posedge _326) begin
        if (_324)
            _3069 <= _1136;
        else
            _3069 <= _239;
    end
    always @* begin
        case (_3069)
        0:
            _3127 <= _3084;
        1:
            _3127 <= _3090;
        2:
            _3127 <= _3096;
        3:
            _3127 <= _3102;
        4:
            _3127 <= _3108;
        5:
            _3127 <= _3114;
        6:
            _3127 <= _3120;
        default:
            _3127 <= _3126;
        endcase
    end
    assign _3129 = _660 ? _1283 : _3127;
    assign _3220 = g_byte_0[7:1];
    assign _3221 = { _1480,
                     _3220 };
    assign _3218 = g_byte_0[6:0];
    assign _3219 = { _3218,
                     _1480 };
    assign _3222 = _242 ? _3221 : _3219;
    assign _3620 = _1676 ? _3222 : _3619;
    assign _3621 = _1667 ? _3620 : _3619;
    assign _3622 = _1652 ? _3621 : _3619;
    assign _3623 = _1489 ? _3619 : _3622;
    assign _3616 = g_data_left_0 ? _3130 : g_byte_0;
    assign _3617 = _1474 ? g_byte_0 : _3616;
    assign _3618 = _1703 ? _3617 : g_byte_0;
    assign _3619 = _1695 ? _3618 : g_byte_0;
    assign _3624 = _1444 ? _3623 : _3619;
    assign _240 = _3624;
    always @(posedge _326) begin
        if (_324)
            g_byte_0 <= _1285;
        else
            g_byte_0 <= _240;
    end
    assign _1937 = g_bitpos_0 == _1136;
    assign _1934 = ~ _1474;
    assign _1935 = _1934 & g_data_left_0;
    assign _1938 = _1935 & _1937;
    assign _3130 = _1938 ? _3129 : g_byte_0;
    assign _3131 = _3130[0:0];
    assign _3139 = { _3131,
                     _3132,
                     _3133,
                     _3134,
                     _3135,
                     _3136,
                     _3137,
                     _3138 };
    assign _242 = host_lane0_lsb_first;
    assign _3140 = _242 ? _3130 : _3139;
    assign _3141 = _3140[0:0];
    assign _3632 = g_bitpos_0 + _1490;
    assign _3633 = _1676 ? _3632 : _3630;
    assign _3634 = _1667 ? _3633 : _3630;
    assign _3635 = _1652 ? _3634 : _3630;
    assign _3636 = _1489 ? _3630 : _3635;
    assign _3626 = g_bitpos_0 + _1490;
    assign _3627 = g_data_left_0 ? _3626 : g_bitpos_0;
    assign _3628 = _1474 ? g_bitpos_0 : _3627;
    assign _3629 = _1703 ? _3628 : g_bitpos_0;
    assign _3630 = _1695 ? _3629 : g_bitpos_0;
    assign _3637 = _1444 ? _3636 : _3630;
    assign _3639 = _1349 ? _1136 : _3637;
    assign _243 = _3639;
    always @(posedge _326) begin
        if (_324)
            g_bitpos_0 <= _1136;
        else
            g_bitpos_0 <= _243;
    end
    always @* begin
        case (g_bitpos_0)
        0:
            _3149 <= _3141;
        1:
            _3149 <= _3142;
        2:
            _3149 <= _3143;
        3:
            _3149 <= _3144;
        4:
            _3149 <= _3145;
        5:
            _3149 <= _3146;
        6:
            _3149 <= _3147;
        default:
            _3149 <= _3148;
        endcase
    end
    assign _245 = host_lane0_crc_inv;
    assign _247 = host_lane0_init;
    assign _3692 = g_crc_0[30:0];
    assign _3694 = { _3692,
                     _1128 };
    assign _3685 = g_crc_0[31:31];
    assign _3686 = _1480 ^ _3685;
    assign _3688 = _3686 ? _252 : _2122;
    assign _3682 = g_crc_0[30:0];
    assign _3684 = { _3682,
                     _1128 };
    assign _3689 = _3684 ^ _3688;
    assign _3678 = g_cnt_0[5:0];
    assign _3679 = _3678 < _263;
    assign _3680 = ~ _3679;
    assign _3673 = g_cnt_0[15:6];
    assign _3675 = _3673 == _1140;
    assign _3676 = ~ _3675;
    assign _3672 = ~ _265;
    assign _3677 = _3672 | _3676;
    assign _3681 = _3677 | _3680;
    assign _3690 = _3681 ? _3689 : _3671;
    assign _3691 = _1667 ? _3690 : _3671;
    assign _249 = host_lane0_crc_width;
    assign _3649 = g_left_0 - _2940;
    assign _3650 = _2993 ? _3649 : _3647;
    assign _3651 = _1652 ? _3650 : _3647;
    assign _3652 = _1489 ? _3647 : _3651;
    assign _3643 = g_left_0 - _2940;
    assign _3644 = g_data_left_0 ? g_left_0 : _3643;
    assign _3645 = _1474 ? g_left_0 : _3644;
    assign _3646 = _1703 ? _3645 : g_left_0;
    assign _3647 = _1695 ? _3646 : g_left_0;
    assign _3653 = _1444 ? _3652 : _3647;
    assign _3654 = _3641 ? _249 : _3653;
    assign _3656 = _1349 ? _1259 : _3654;
    assign _250 = _3656;
    always @(posedge _326) begin
        if (_324)
            g_left_0 <= _1259;
        else
            g_left_0 <= _250;
    end
    assign _1701 = g_left_0 == _1259;
    assign _1702 = ~ _1701;
    assign _2991 = ~ g_data_left_0;
    assign _2990 = _1444 & _1652;
    assign _2992 = _2990 & _2991;
    assign _2993 = _2992 & _1702;
    assign _3695 = _2993 ? _3694 : _3691;
    assign _3696 = _1652 ? _3695 : _3671;
    assign _3697 = _1489 ? _3671 : _3696;
    assign _252 = host_lane0_poly;
    assign _3663 = g_crc_0[31:31];
    assign _3664 = _3151 ^ _3663;
    assign _3666 = _3664 ? _252 : _2122;
    assign _3660 = g_crc_0[30:0];
    assign _3662 = { _3660,
                     _1128 };
    assign _3667 = _3662 ^ _3666;
    assign _3657 = g_crc_0[30:0];
    assign _3659 = { _3657,
                     _1128 };
    assign _3668 = g_data_left_0 ? _3667 : _3659;
    assign _3669 = _1474 ? g_crc_0 : _3668;
    assign _3670 = _1703 ? _3669 : g_crc_0;
    assign _3671 = _1695 ? _3670 : g_crc_0;
    assign _3698 = _1444 ? _3697 : _3671;
    assign _3699 = _1349 ? _247 : _3698;
    assign _3701 = _1347 ? _2122 : _3699;
    assign _253 = _3701;
    always @(posedge _326) begin
        if (_324)
            g_crc_0 <= _2122;
        else
            g_crc_0 <= _253;
    end
    assign _2997 = g_crc_0[31:31];
    assign _2998 = _2997 ^ _245;
    assign _3717 = _3716 ? _3714 : g_lim_0;
    assign _3718 = g_len_cap_0 ? _3717 : g_lim_0;
    assign _254 = _3718;
    always @(posedge _326) begin
        if (_324)
            g_lim_0 <= _1285;
        else
            g_lim_0 <= _254;
    end
    assign _1664 = { _1285,
                     g_lim_0 };
    assign _256 = host_lane0_frame_bits;
    assign _2971 = g_sr_0[14:0];
    assign _2972 = { _2971,
                     _1480 };
    assign _3719 = _1652 ? _2972 : g_sr_0;
    assign _3720 = _1489 ? g_sr_0 : _3719;
    assign _3721 = _1444 ? _3720 : g_sr_0;
    assign _3723 = _1349 ? _1235 : _3721;
    assign _257 = _3723;
    always @(posedge _326) begin
        if (_324)
            g_sr_0 <= _1235;
        else
            g_sr_0 <= _257;
    end
    assign _3709 = g_sr_0[3:0];
    assign _259 = host_lane0_len_max;
    assign _3710 = _259 < _3709;
    assign _3711 = _3710 ? _259 : _3709;
    assign _3713 = { _1128,
                     _3711,
                     _1136 };
    assign _261 = host_lane0_skip;
    assign _3707 = { _2565,
                     _261 };
    assign _3714 = _3707 + _3713;
    assign _3715 = { _1285,
                     _3714 };
    assign _3716 = _3715 < _256;
    assign _3744 = _3716 ? _1955 : g_len_known_0;
    assign _263 = host_lane0_len_pos;
    assign _3730 = g_cnt_0[5:0];
    assign _3731 = _3730 == _263;
    assign _3726 = g_cnt_0[15:6];
    assign _3728 = _3726 == _1140;
    assign _265 = host_lane0_crc_resid;
    assign _3724 = ~ _265;
    assign _267 = host_lane0_len_en;
    assign _3725 = _267 & _3724;
    assign _3729 = _3725 & _3728;
    assign _3732 = _3729 & _3731;
    assign _3734 = _3732 ? _1955 : g_len_cap_0;
    assign _3735 = _1667 ? _3734 : g_len_cap_0;
    assign _3736 = _1652 ? _3735 : g_len_cap_0;
    assign _3737 = _1489 ? g_len_cap_0 : _3736;
    assign _3738 = _1444 ? _3737 : g_len_cap_0;
    assign _3740 = g_len_cap_0 ? _1128 : _3738;
    assign _3742 = _1349 ? _1128 : _3740;
    assign _268 = _3742;
    always @(posedge _326) begin
        if (_324)
            g_len_cap_0 <= _1128;
        else
            g_len_cap_0 <= _268;
    end
    assign _3745 = g_len_cap_0 ? _3744 : g_len_known_0;
    assign _3747 = _1349 ? _1128 : _3745;
    assign _269 = _3747;
    always @(posedge _326) begin
        if (_324)
            g_len_known_0 <= _1128;
        else
            g_len_known_0 <= _269;
    end
    assign _1665 = g_len_known_0 ? _1664 : _256;
    assign _3767 = g_cnt_0 + _4242;
    assign _3768 = _1667 ? _3767 : _3765;
    assign _1652 = ~ _1474;
    assign _3769 = _1652 ? _3768 : _3765;
    assign _3750 = _1489 ? _3749 : _1480;
    assign _3748 = _1703 ? _3151 : g_last_0;
    assign _3749 = _1695 ? _3748 : g_last_0;
    assign _3751 = _1444 ? _3750 : _3749;
    assign _3753 = _1349 ? _1955 : _3751;
    assign _270 = _3753;
    always @(posedge _326) begin
        if (_324)
            g_last_0 <= vdd;
        else
            g_last_0 <= _270;
    end
    assign _1485 = ~ g_last_0;
    assign _1482 = _275 == _1276;
    assign _1486 = _1482 ? _1485 : gnd;
    assign _3755 = _291 == _1276;
    assign _3756 = _3755 ? _1364 : g_prev_0;
    assign _3757 = _1444 ? _3756 : g_prev_0;
    assign _3759 = _1349 ? _1955 : _3757;
    assign _271 = _3759;
    always @(posedge _326) begin
        if (_324)
            g_prev_0 <= vdd;
        else
            g_prev_0 <= _271;
    end
    assign _1479 = _1364 == g_prev_0;
    assign _1476 = _291 == _1276;
    assign _1480 = _1476 ? _1479 : _1364;
    assign _1487 = _1480 == _1486;
    assign _1488 = ~ _1487;
    assign _1489 = _1474 & _1488;
    assign _3770 = _1489 ? _3765 : _3769;
    assign _3761 = g_cnt_0 + _4242;
    assign _3762 = g_data_left_0 ? _3761 : g_cnt_0;
    assign _3763 = _1474 ? g_cnt_0 : _3762;
    assign _3764 = _1703 ? _3763 : g_cnt_0;
    assign _3765 = _1695 ? _3764 : g_cnt_0;
    assign _3771 = _1444 ? _3770 : _3765;
    assign _3773 = _1349 ? _1235 : _3771;
    assign _272 = _3773;
    always @(posedge _326) begin
        if (_324)
            g_cnt_0 <= _1235;
        else
            g_cnt_0 <= _272;
    end
    assign g_data_left_0 = g_cnt_0 < _1665;
    assign _3150 = g_data_left_0 ? _3149 : _2998;
    assign _3151 = _1474 ? _1486 : _3150;
    assign _3779 = _3151 == g_last_0;
    assign _3777 = g_run_0 == _1136;
    assign _3778 = ~ _3777;
    assign _3780 = _3778 & _3779;
    assign _3784 = _3780 ? _3783 : _1490;
    assign _3775 = _275 == _1277;
    assign _3789 = _3775 ? _3788 : _3784;
    assign _3790 = _1703 ? _3789 : g_run_0;
    assign _3791 = _1695 ? _3790 : g_run_0;
    assign _3809 = _1444 ? _3808 : _3791;
    assign _3811 = _1349 ? _1136 : _3809;
    assign _273 = _3811;
    always @(posedge _326) begin
        if (_324)
            g_run_0 <= _1136;
        else
            g_run_0 <= _273;
    end
    assign _1473 = g_run_0 == _165;
    assign _275 = host_lane0_stuff;
    assign _1468 = _275 == _2565;
    assign _1469 = ~ _1468;
    assign _1474 = _1469 & _1473;
    assign _1696 = _1474 | g_data_left_0;
    assign _1703 = _1696 | _1702;
    assign _3825 = _1703 ? _3824 : _1955;
    assign _1686 = ~ _297;
    assign _1687 = _1351 & _1686;
    assign _1695 = _1687 & _1694;
    assign _3826 = _1695 ? _3825 : f_lane0_out;
    assign _1691 = _1417 == _1235;
    assign _1689 = _1382 == _1235;
    assign _1692 = _1410 ? _1691 : _1689;
    assign _1693 = _1378 ? vdd : _1692;
    assign _1694 = _293 ? _1442 : _1693;
    assign _3818 = ~ _1694;
    assign _3815 = _291 == _1277;
    assign _3812 = ~ _297;
    assign _3813 = _1351 & _3812;
    assign _3816 = _3813 & _3815;
    assign _3817 = _3816 & _1443;
    assign _3819 = _3817 & _3818;
    assign _3827 = _3819 ? _3063 : _3826;
    assign _3829 = _1459 ? _1955 : _3827;
    assign _3831 = _1684 ? _1955 : _3829;
    assign _3833 = _1349 ? _1955 : _3831;
    assign _3835 = _1347 ? _1955 : _3833;
    assign _276 = _3835;
    always @(posedge _326) begin
        if (_324)
            f_lane0_out <= vdd;
        else
            f_lane0_out <= _276;
    end
    assign _1457 = _1364 == f_lane0_out;
    assign _1458 = ~ _1457;
    assign _1440 = ~ _1434;
    assign _1441 = _1437 & _1440;
    always @(posedge _326) begin
        if (_324)
            _1437 <= _1128;
        else
            _1437 <= _1434;
    end
    assign _1438 = ~ _1437;
    assign _1430 = _368[7:7];
    assign _1429 = _368[6:6];
    assign _1428 = _368[5:5];
    assign _1427 = _368[4:4];
    assign _1426 = _368[3:3];
    assign _1425 = _368[2:2];
    assign _1424 = _368[1:1];
    assign _1423 = _368[0:0];
    assign _278 = host_lane0_clk_pin;
    always @* begin
        case (_278)
        0:
            _1431 <= _1423;
        1:
            _1431 <= _1424;
        2:
            _1431 <= _1425;
        3:
            _1431 <= _1426;
        4:
            _1431 <= _1427;
        5:
            _1431 <= _1428;
        6:
            _1431 <= _1429;
        default:
            _1431 <= _1430;
        endcase
    end
    always @(posedge _326) begin
        if (_324)
            _1434 <= _1128;
        else
            _1434 <= _1431;
    end
    assign _1439 = _1434 & _1438;
    assign _280 = host_lane0_clk_edge;
    assign _1442 = _280 ? _1441 : _1439;
    assign _1421 = _1406 == _1235;
    assign _1418 = _1417 == _1406;
    assign _1411 = _1382 == _1406;
    assign _1409 = ~ _1373;
    assign _1400 = _282[15:2];
    assign _1401 = { _2565,
                     _1400 };
    assign _1397 = _282[15:1];
    assign _1398 = { _1128,
                     _1397 };
    assign _1402 = _1398 + _1401;
    assign _1394 = _282[15:1];
    assign _1395 = { _1128,
                     _1394 };
    assign _1392 = _297 & _1375;
    assign _1403 = _1392 ? _1402 : _1395;
    always @(posedge _326) begin
        if (_324)
            _1406 <= _1235;
        else
            _1406 <= _1403;
    end
    assign _1407 = _1382 < _1406;
    assign _1384 = _282[15:2];
    assign _1385 = { _2565,
                     _1384 };
    always @(posedge _326) begin
        if (_324)
            _1388 <= _1235;
        else
            _1388 <= _1385;
    end
    assign _3881 = ~ _1373;
    assign _3882 = _1408 & _3881;
    assign _3883 = _3882 ? _1417 : _1382;
    assign _3885 = _1378 ? _1235 : _3883;
    assign _3887 = _3885 + _4242;
    assign _3865 = _3859 == _1195;
    assign _1413 = _282[15:1];
    assign _1414 = { _1128,
                     _1413 };
    always @(posedge _326) begin
        if (_324)
            _1417 <= _1235;
        else
            _1417 <= _1414;
    end
    assign _3861 = { gnd,
                     _1417 };
    assign _3862 = _3861 == _3859;
    assign _3855 = { gnd,
                     _282 };
    always @(posedge _326) begin
        if (_324)
            _3858 <= _1195;
        else
            _3858 <= _3855;
    end
    assign _282 = host_lane0_div_int;
    assign _3849 = { gnd,
                     _282 };
    assign _3851 = _3849 - _3489;
    always @(posedge _326) begin
        if (_324)
            _3854 <= _1195;
        else
            _3854 <= _3851;
    end
    assign _284 = host_lane0_div_frac;
    assign _3869 = { gnd,
                     _284 };
    assign _3871 = _3870[7:0];
    assign _3872 = _3867 ? _3871 : _3843;
    assign _3873 = _3840 ? _3872 : _3843;
    assign _3875 = _1349 ? _1285 : _3873;
    assign _285 = _3875;
    always @(posedge _326) begin
        if (_324)
            _3843 <= _1285;
        else
            _3843 <= _285;
    end
    assign _3868 = { gnd,
                     _3843 };
    assign _3870 = _3868 + _3869;
    assign _3876 = _3870[8:8];
    assign _3877 = _3867 ? _3876 : _3848;
    assign _3878 = _3840 ? _3877 : _3848;
    assign _3880 = _1349 ? _1128 : _3878;
    assign _286 = _3880;
    always @(posedge _326) begin
        if (_324)
            _3848 <= _1128;
        else
            _3848 <= _286;
    end
    assign _3859 = _3848 ? _3858 : _3854;
    assign _3845 = { gnd,
                     _1382 };
    assign _3860 = _3845 == _3859;
    assign _3863 = _1410 ? _3862 : _3860;
    assign _3866 = _1378 ? _3865 : _3863;
    assign _3844 = ~ _293;
    assign _3867 = _3844 & _3866;
    assign _3889 = _3867 ? _1235 : _3887;
    assign _3839 = ~ _293;
    assign _3837 = _1373 & _1371;
    assign _674 = g_mode_0 == _2091;
    assign _3836 = _1351 | _674;
    assign _3838 = _3836 | _3837;
    assign _3840 = _3838 & _3839;
    assign _3890 = _3840 ? _3889 : _1382;
    assign _3892 = _1349 ? _1235 : _3890;
    assign _287 = _3892;
    always @(posedge _326) begin
        if (_324)
            _1382 <= _1235;
        else
            _1382 <= _287;
    end
    assign _1389 = _1382 < _1388;
    assign _1390 = ~ _1389;
    assign _1379 = _1371 & _1375;
    assign _1391 = _1379 & _1390;
    assign _1408 = _1391 & _1407;
    assign _1410 = _1408 & _1409;
    assign _1419 = _1410 ? _1418 : _1411;
    assign _1375 = _291 == _1277;
    assign _1376 = ~ _1375;
    assign _1373 = g_mode_0 == _1276;
    assign _1377 = _1373 | _1376;
    assign _1370 = ~ _293;
    always @(posedge _326) begin
        if (_324)
            _1367 <= _1128;
        else
            _1367 <= _1364;
    end
    assign _1360 = _368[7:7];
    assign _1359 = _368[6:6];
    assign _1358 = _368[5:5];
    assign _1357 = _368[4:4];
    assign _1356 = _368[3:3];
    assign _1355 = _368[2:2];
    assign _1354 = _368[1:1];
    assign _1353 = _368[0:0];
    assign _289 = host_lane0_data_pin;
    always @* begin
        case (_289)
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
    always @(posedge _326) begin
        if (_324)
            _1364 <= _1128;
        else
            _1364 <= _1361;
    end
    assign _1368 = _1364 ^ _1367;
    assign _1369 = _297 & _1368;
    assign _1371 = _1369 & _1370;
    assign _1378 = _1371 & _1377;
    assign _1422 = _1378 ? _1421 : _1419;
    assign _1443 = _293 ? _1442 : _1422;
    assign _291 = host_lane0_code;
    assign _1451 = _291 == _1277;
    assign _1452 = ~ _1451;
    assign _293 = host_lane0_clk_pin_en;
    assign _1448 = ~ _293;
    assign _295 = host_lane0_readback;
    assign _297 = host_lane0_dir;
    assign _1445 = ~ _297;
    assign _1446 = _1351 & _1445;
    assign _1447 = _1446 & _295;
    assign _1449 = _1447 & _1448;
    assign _1453 = _1449 & _1452;
    assign _1454 = _1453 & _1443;
    assign _1459 = _1454 & _1458;
    assign _3904 = _1459 ? _2565 : _3902;
    assign _3956 = _1444 ? _3955 : _3904;
    assign _1684 = _298 == _1463;
    assign _3958 = _1684 ? _2565 : _3956;
    assign _3641 = _298 == _1995;
    assign _3965 = _3641 ? _3964 : _3958;
    assign _1349 = _298 == _1490;
    assign _3971 = _1349 ? _3970 : _3965;
    assign _2615 = _773[90:88];
    assign _2614 = _767[90:88];
    assign _2613 = _761[90:88];
    assign _2612 = _364[90:88];
    always @* begin
        case (f_winner)
        0:
            _2616 <= _2612;
        1:
            _2616 <= _2613;
        2:
            _2616 <= _2614;
        default:
            _2616 <= _2615;
        endcase
    end
    assign _2608 = _773[87:87];
    assign _2607 = _767[87:87];
    assign _2606 = _761[87:87];
    assign _2605 = _364[87:87];
    always @* begin
        case (f_winner)
        0:
            _2609 <= _2605;
        1:
            _2609 <= _2606;
        2:
            _2609 <= _2607;
        default:
            _2609 <= _2608;
        endcase
    end
    assign _3893 = ~ _2609;
    assign _3894 = _1252 & _3893;
    assign _3896 = _3894 ? _2616 : _1136;
    assign _298 = _3896;
    assign _1346 = _298 == _1333;
    assign _1347 = _1346 | _333;
    assign _3973 = _1347 ? _2565 : _3971;
    assign _299 = _3973;
    always @(posedge _326) begin
        if (_324)
            g_mode_0 <= _2565;
        else
            g_mode_0 <= _299;
    end
    assign _1351 = g_mode_0 == _1277;
    assign _1352 = _1351 & _297;
    assign _1444 = _1352 & _1443;
    assign _1653 = _1444 & _1652;
    assign _1667 = _1653 & g_data_left_0;
    assign _1676 = _1667 & _1675;
    assign _1682 = _1676 & _1681;
    assign _1718 = _1682 | _1717;
    assign _3047 = _1718 | _1820;
    assign _301 = host_rx_to_tx;
    assign _3048 = _301 & _3047;
    assign _302 = _3048;
    assign _3075 = _302 | _3074;
    assign _3077 = _3075 & _3076;
    assign _3974 = _3077 ^ _3612;
    assign _3980 = _3974 ? _3979 : _303;
    always @(posedge _326) begin
        if (_324)
            _3983 <= _2114;
        else
            _3983 <= _3980;
    end
    assign _303 = _3983;
    assign _660 = _303 == _2114;
    assign _3985 = _660 ? _1283 : _3127;
    assign _1926 = _756[28:27];
    assign _1924 = _773[95:94];
    assign _1923 = _767[95:94];
    assign _1922 = _761[95:94];
    assign _1921 = _364[95:94];
    always @* begin
        case (f_winner)
        0:
            _1925 <= _1921;
        1:
            _1925 <= _1922;
        2:
            _1925 <= _1923;
        default:
            _1925 <= _1924;
        endcase
    end
    assign _1927 = _1854 ? _1926 : _1925;
    always @* begin
        case (_1927)
        0:
            _3997 <= _653;
        1:
            _3997 <= _3985;
        2:
            _3997 <= _3994;
        default:
            _3997 <= _3996;
        endcase
    end
    assign _3998 = _1855 ? _3997 : _653;
    assign _304 = _3998;
    always @(posedge _326) begin
        if (_324)
            _653 <= _1285;
        else
            _653 <= _304;
    end
    assign _654 = _653[0:0];
    assign _4009 = 8'b00001000;
    assign _4008 = 8'b00000111;
    assign _4007 = _648 - _1742;
    assign _4004 = _756[30:29];
    assign _773 = _363[511:400];
    assign _4002 = _773[99:98];
    assign _767 = _363[399:288];
    assign _4001 = _767[99:98];
    assign _4000 = _761[99:98];
    assign _3999 = _364[99:98];
    always @* begin
        case (f_winner)
        0:
            _4003 <= _3999;
        1:
            _4003 <= _4000;
        2:
            _4003 <= _4001;
        default:
            _4003 <= _4002;
        endcase
    end
    assign _4005 = _1854 ? _4004 : _4003;
    always @* begin
        case (_4005)
        0:
            _4010 <= _648;
        1:
            _4010 <= _4007;
        2:
            _4010 <= _4008;
        default:
            _4010 <= _4009;
        endcase
    end
    assign _4011 = _1855 ? _4010 : _648;
    assign _305 = _4011;
    always @(posedge _326) begin
        if (_324)
            _648 <= _1285;
        else
            _648 <= _305;
    end
    assign _650 = _648 == _1285;
    assign _878 = _761[61:58];
    always @* begin
        case (_878)
        0:
            _879 <= vdd;
        1:
            _879 <= _650;
        2:
            _879 <= _654;
        3:
            _879 <= _658;
        4:
            _879 <= _660;
        5:
            _879 <= _662;
        6:
            _879 <= _666;
        7:
            _879 <= _669;
        8:
            _879 <= _674;
        9:
            _879 <= _677;
        10:
            _879 <= _680;
        11:
            _879 <= _683;
        12:
            _879 <= _688;
        13:
            _879 <= _691;
        14:
            _879 <= _694;
        default:
            _879 <= _697;
        endcase
    end
    assign _881 = _879 ^ _880;
    assign _873 = _761[57:42];
    assign _875 = _873 == _1125;
    assign _864 = _810[57:42];
    assign _865 = { gnd,
                    _864 };
    assign _866 = _865 + _853;
    always @(posedge _326) begin
        if (_324)
            _869 <= _1195;
        else
            _869 <= _866;
    end
    assign _870 = _869 < _809;
    assign _871 = ~ _870;
    assign _860 = _761[41:26];
    assign _862 = _860 == _1235;
    assign _608 = _604 + _1490;
    assign _4026 = _604 + _1490;
    assign _4022 = _604 == _2490;
    assign _4023 = ~ _4022;
    assign _4020 = _384[0:0];
    assign _4024 = _4020 & _4023;
    assign _4027 = _4024 ? _4026 : _604;
    assign _4017 = _384[0:0];
    assign _4018 = ~ _4017;
    assign _4016 = f_chg_now[0:0];
    assign _4019 = _4016 & _4018;
    assign _4029 = _4019 ? _1490 : _4027;
    assign _4013 = _348 == _1277;
    assign _4015 = _4013 ? _1136 : _604;
    assign _4012 = _348 == _1276;
    assign _4030 = _4012 ? _4029 : _4015;
    assign _306 = _4030;
    always @(posedge _326) begin
        if (_324)
            _604 <= _1136;
        else
            _604 <= _306;
    end
    assign _606 = _604 == _2490;
    assign _609 = _606 ? _604 : _608;
    assign _599 = _384[0:0];
    assign _600 = ~ _599;
    assign _598 = f_chg_now[0:0];
    assign _601 = _598 & _600;
    assign _611 = _601 ? _1490 : _609;
    assign _595 = f_changed_all[0:0];
    assign _596 = f_in_fetch & _595;
    assign _612 = _596 ? _611 : _1136;
    assign _844 = _814[0:0];
    assign _846 = _844 ? _612 : _1136;
    assign _587 = _583 + _1490;
    assign _4045 = _583 + _1490;
    assign _4041 = _583 == _2490;
    assign _4042 = ~ _4041;
    assign _4039 = _384[1:1];
    assign _4043 = _4039 & _4042;
    assign _4046 = _4043 ? _4045 : _583;
    assign _4036 = _384[1:1];
    assign _4037 = ~ _4036;
    assign _4035 = f_chg_now[1:1];
    assign _4038 = _4035 & _4037;
    assign _4048 = _4038 ? _1490 : _4046;
    assign _4032 = _348 == _1277;
    assign _4034 = _4032 ? _1136 : _583;
    assign _4031 = _348 == _1276;
    assign _4049 = _4031 ? _4048 : _4034;
    assign _307 = _4049;
    always @(posedge _326) begin
        if (_324)
            _583 <= _1136;
        else
            _583 <= _307;
    end
    assign _585 = _583 == _2490;
    assign _588 = _585 ? _583 : _587;
    assign _578 = _384[1:1];
    assign _579 = ~ _578;
    assign _577 = f_chg_now[1:1];
    assign _580 = _577 & _579;
    assign _590 = _580 ? _1490 : _588;
    assign _574 = f_changed_all[1:1];
    assign _575 = f_in_fetch & _574;
    assign _591 = _575 ? _590 : _1136;
    assign _841 = _814[1:1];
    assign _843 = _841 ? _591 : _1136;
    assign _847 = _843 < _846;
    assign _848 = _847 ? _846 : _843;
    assign _564 = _560 + _1490;
    assign _4064 = _560 + _1490;
    assign _4060 = _560 == _2490;
    assign _4061 = ~ _4060;
    assign _4058 = _384[2:2];
    assign _4062 = _4058 & _4061;
    assign _4065 = _4062 ? _4064 : _560;
    assign _4055 = _384[2:2];
    assign _4056 = ~ _4055;
    assign _4054 = f_chg_now[2:2];
    assign _4057 = _4054 & _4056;
    assign _4067 = _4057 ? _1490 : _4065;
    assign _4051 = _348 == _1277;
    assign _4053 = _4051 ? _1136 : _560;
    assign _4050 = _348 == _1276;
    assign _4068 = _4050 ? _4067 : _4053;
    assign _308 = _4068;
    always @(posedge _326) begin
        if (_324)
            _560 <= _1136;
        else
            _560 <= _308;
    end
    assign _562 = _560 == _2490;
    assign _565 = _562 ? _560 : _564;
    assign _555 = _384[2:2];
    assign _556 = ~ _555;
    assign _554 = f_chg_now[2:2];
    assign _557 = _554 & _556;
    assign _567 = _557 ? _1490 : _565;
    assign _551 = f_changed_all[2:2];
    assign _552 = f_in_fetch & _551;
    assign _568 = _552 ? _567 : _1136;
    assign _836 = _814[2:2];
    assign _838 = _836 ? _568 : _1136;
    assign _543 = _539 + _1490;
    assign _4083 = _539 + _1490;
    assign _4079 = _539 == _2490;
    assign _4080 = ~ _4079;
    assign _4077 = _384[3:3];
    assign _4081 = _4077 & _4080;
    assign _4084 = _4081 ? _4083 : _539;
    assign _4074 = _384[3:3];
    assign _4075 = ~ _4074;
    assign _4073 = f_chg_now[3:3];
    assign _4076 = _4073 & _4075;
    assign _4086 = _4076 ? _1490 : _4084;
    assign _4070 = _348 == _1277;
    assign _4072 = _4070 ? _1136 : _539;
    assign _4069 = _348 == _1276;
    assign _4087 = _4069 ? _4086 : _4072;
    assign _309 = _4087;
    always @(posedge _326) begin
        if (_324)
            _539 <= _1136;
        else
            _539 <= _309;
    end
    assign _541 = _539 == _2490;
    assign _544 = _541 ? _539 : _543;
    assign _534 = _384[3:3];
    assign _535 = ~ _534;
    assign _533 = f_chg_now[3:3];
    assign _536 = _533 & _535;
    assign _546 = _536 ? _1490 : _544;
    assign _530 = f_changed_all[3:3];
    assign _531 = f_in_fetch & _530;
    assign _547 = _531 ? _546 : _1136;
    assign _833 = _814[3:3];
    assign _835 = _833 ? _547 : _1136;
    assign _839 = _835 < _838;
    assign _840 = _839 ? _838 : _835;
    assign _849 = _840 < _848;
    assign _850 = _849 ? _848 : _840;
    assign _518 = _514 + _1490;
    assign _4102 = _514 + _1490;
    assign _4098 = _514 == _2490;
    assign _4099 = ~ _4098;
    assign _4096 = _384[4:4];
    assign _4100 = _4096 & _4099;
    assign _4103 = _4100 ? _4102 : _514;
    assign _4093 = _384[4:4];
    assign _4094 = ~ _4093;
    assign _4092 = f_chg_now[4:4];
    assign _4095 = _4092 & _4094;
    assign _4105 = _4095 ? _1490 : _4103;
    assign _4089 = _348 == _1277;
    assign _4091 = _4089 ? _1136 : _514;
    assign _4088 = _348 == _1276;
    assign _4106 = _4088 ? _4105 : _4091;
    assign _310 = _4106;
    always @(posedge _326) begin
        if (_324)
            _514 <= _1136;
        else
            _514 <= _310;
    end
    assign _516 = _514 == _2490;
    assign _519 = _516 ? _514 : _518;
    assign _509 = _384[4:4];
    assign _510 = ~ _509;
    assign _508 = f_chg_now[4:4];
    assign _511 = _508 & _510;
    assign _521 = _511 ? _1490 : _519;
    assign _505 = f_changed_all[4:4];
    assign _506 = f_in_fetch & _505;
    assign _522 = _506 ? _521 : _1136;
    assign _826 = _814[4:4];
    assign _828 = _826 ? _522 : _1136;
    assign _497 = _493 + _1490;
    assign _4121 = _493 + _1490;
    assign _4117 = _493 == _2490;
    assign _4118 = ~ _4117;
    assign _4115 = _384[5:5];
    assign _4119 = _4115 & _4118;
    assign _4122 = _4119 ? _4121 : _493;
    assign _4112 = _384[5:5];
    assign _4113 = ~ _4112;
    assign _4111 = f_chg_now[5:5];
    assign _4114 = _4111 & _4113;
    assign _4124 = _4114 ? _1490 : _4122;
    assign _4108 = _348 == _1277;
    assign _4110 = _4108 ? _1136 : _493;
    assign _4107 = _348 == _1276;
    assign _4125 = _4107 ? _4124 : _4110;
    assign _311 = _4125;
    always @(posedge _326) begin
        if (_324)
            _493 <= _1136;
        else
            _493 <= _311;
    end
    assign _495 = _493 == _2490;
    assign _498 = _495 ? _493 : _497;
    assign _488 = _384[5:5];
    assign _489 = ~ _488;
    assign _487 = f_chg_now[5:5];
    assign _490 = _487 & _489;
    assign _500 = _490 ? _1490 : _498;
    assign _484 = f_changed_all[5:5];
    assign _485 = f_in_fetch & _484;
    assign _501 = _485 ? _500 : _1136;
    assign _823 = _814[5:5];
    assign _825 = _823 ? _501 : _1136;
    assign _829 = _825 < _828;
    assign _830 = _829 ? _828 : _825;
    assign _474 = _470 + _1490;
    assign _4140 = _470 + _1490;
    assign _4136 = _470 == _2490;
    assign _4137 = ~ _4136;
    assign _4134 = _384[6:6];
    assign _4138 = _4134 & _4137;
    assign _4141 = _4138 ? _4140 : _470;
    assign _4131 = _384[6:6];
    assign _4132 = ~ _4131;
    assign _4130 = f_chg_now[6:6];
    assign _4133 = _4130 & _4132;
    assign _4143 = _4133 ? _1490 : _4141;
    assign _4127 = _348 == _1277;
    assign _4129 = _4127 ? _1136 : _470;
    assign _4126 = _348 == _1276;
    assign _4144 = _4126 ? _4143 : _4129;
    assign _312 = _4144;
    always @(posedge _326) begin
        if (_324)
            _470 <= _1136;
        else
            _470 <= _312;
    end
    assign _472 = _470 == _2490;
    assign _475 = _472 ? _470 : _474;
    assign _465 = _384[6:6];
    assign _466 = ~ _465;
    assign _464 = f_chg_now[6:6];
    assign _467 = _464 & _466;
    assign _477 = _467 ? _1490 : _475;
    assign _461 = f_changed_all[6:6];
    assign _462 = f_in_fetch & _461;
    assign _478 = _462 ? _477 : _1136;
    assign _818 = _814[6:6];
    assign _820 = _818 ? _478 : _1136;
    assign _453 = _449 + _1490;
    assign _4159 = _449 + _1490;
    assign _4155 = _449 == _2490;
    assign _4156 = ~ _4155;
    assign _4153 = _384[7:7];
    assign _4157 = _4153 & _4156;
    assign _4160 = _4157 ? _4159 : _449;
    assign _4150 = _384[7:7];
    assign _4151 = ~ _4150;
    assign _4149 = f_chg_now[7:7];
    assign _4152 = _4149 & _4151;
    assign _4162 = _4152 ? _1490 : _4160;
    assign _4146 = _348 == _1277;
    assign _4148 = _4146 ? _1136 : _449;
    assign _4145 = _348 == _1276;
    assign _4163 = _4145 ? _4162 : _4148;
    assign _313 = _4163;
    always @(posedge _326) begin
        if (_324)
            _449 <= _1136;
        else
            _449 <= _313;
    end
    assign _451 = _449 == _2490;
    assign _454 = _451 ? _449 : _453;
    assign _444 = _384[7:7];
    assign _445 = ~ _444;
    assign _443 = f_chg_now[7:7];
    assign _446 = _443 & _445;
    assign _456 = _446 ? _1490 : _454;
    assign _440 = f_changed_all[7:7];
    assign _441 = f_in_fetch & _440;
    assign _457 = _441 ? _456 : _1136;
    assign _814 = _810[23:16];
    assign _815 = _814[7:7];
    assign _817 = _815 ? _457 : _1136;
    assign _821 = _817 < _820;
    assign _822 = _821 ? _820 : _817;
    assign _831 = _822 < _830;
    assign _832 = _831 ? _830 : _822;
    assign _851 = _832 < _850;
    assign _852 = _851 ? _850 : _832;
    assign _853 = { _1179,
                    _852 };
    assign _4166 = _415 == _1490;
    assign _4167 = _4166 ? _318 : _362;
    assign _4164 = _348 == _1276;
    assign _4168 = _4164 ? _4167 : _362;
    assign _314 = _4168;
    always @(posedge _326) begin
        if (_324)
            _362 <= _352;
        else
            _362 <= _314;
    end
    assign _429 = _415 == _1490;
    assign _430 = f_in_fetch & _429;
    assign _431 = _430 ? _318 : _362;
    assign _4171 = _415 == _1463;
    assign _4172 = _4171 ? _318 : _359;
    assign _4169 = _348 == _1276;
    assign _4173 = _4169 ? _4172 : _359;
    assign _315 = _4173;
    always @(posedge _326) begin
        if (_324)
            _359 <= _352;
        else
            _359 <= _315;
    end
    assign _425 = _415 == _1463;
    assign _426 = f_in_fetch & _425;
    assign _427 = _426 ? _318 : _359;
    assign _4176 = _415 == _1995;
    assign _4177 = _4176 ? _318 : _356;
    assign _4174 = _348 == _1276;
    assign _4178 = _4174 ? _4177 : _356;
    assign _316 = _4178;
    always @(posedge _326) begin
        if (_324)
            _356 <= _352;
        else
            _356 <= _316;
    end
    assign _421 = _415 == _1995;
    assign _422 = f_in_fetch & _421;
    assign _423 = _422 ? _318 : _356;
    assign _318 = ram_rec_rdata;
    assign _417 = _415 == _1333;
    assign _418 = f_in_fetch & _417;
    assign _419 = _418 ? _318 : _353;
    assign _432 = { _419,
                    _423,
                    _427,
                    _431 };
    assign _810 = _432[287:176];
    assign _811 = _810[41:26];
    assign _812 = { gnd,
                    _811 };
    assign _854 = _812 + _853;
    always @(posedge _326) begin
        if (_324)
            _857 <= _1195;
        else
            _857 <= _854;
    end
    assign gnd = 1'b0;
    assign _809 = { gnd,
                    _806 };
    assign _858 = _809 < _857;
    assign _859 = ~ _858;
    assign _863 = _859 | _862;
    assign _872 = _863 & _871;
    assign _4206 = _405 + _4242;
    assign _4202 = _405 == _1125;
    assign _4203 = ~ _4202;
    assign _4204 = _4200 & _4203;
    assign _4207 = _4204 ? _4206 : _405;
    assign _4186 = _4185[2:2];
    assign _4187 = _1855 & _4186;
    assign _4209 = _4187 ? _1235 : _4207;
    assign _4211 = _2023 ? _1235 : _4209;
    assign _319 = _4211;
    always @(posedge _326) begin
        if (_324)
            _405 <= _1235;
        else
            _405 <= _319;
    end
    assign _4223 = _402 + _4242;
    assign _4219 = _402 == _1125;
    assign _4220 = ~ _4219;
    assign _4198 = 9'b111111111;
    assign _4199 = _4191 == _4198;
    assign _4196 = 6'b111111;
    assign _4195 = _4191[5:0];
    assign _4197 = _4195 == _4196;
    assign _4190 = 9'b000000000;
    assign _4212 = 9'b000000001;
    assign _4213 = _4191 + _4212;
    assign _4215 = _2023 ? _4190 : _4213;
    assign _320 = _4215;
    always @(posedge _326) begin
        if (_324)
            _4191 <= _4190;
        else
            _4191 <= _320;
    end
    assign _4192 = _4191[2:0];
    assign _4194 = _4192 == _2490;
    assign _4188 = _756[63:62];
    always @* begin
        case (_4188)
        0:
            _4200 <= vdd;
        1:
            _4200 <= _4194;
        2:
            _4200 <= _4197;
        default:
            _4200 <= _4199;
        endcase
    end
    assign _4221 = _4200 & _4220;
    assign _4224 = _4221 ? _4223 : _402;
    assign _4216 = _4185[1:1];
    assign _4217 = _1855 & _4216;
    assign _4226 = _4217 ? _1235 : _4224;
    assign _4228 = _2023 ? _1235 : _4226;
    assign _321 = _4228;
    always @(posedge _326) begin
        if (_324)
            _402 <= _1235;
        else
            _402 <= _321;
    end
    assign _805 = _761[25:24];
    always @* begin
        case (_805)
        0:
            _806 <= _399;
        1:
            _806 <= _402;
        2:
            _806 <= _405;
        default:
            _806 <= _405;
        endcase
    end
    assign _808 = _806 == _1125;
    assign _876 = _808 ? _875 : _872;
    always @(posedge _326) begin
        if (_324)
            _387 <= _1285;
        else
            _387 <= _371;
    end
    assign f_chg_now = _371 ^ _387;
    assign _4230 = _348 == _1277;
    assign _4232 = _4230 ? _1285 : _384;
    assign _4229 = _348 == _1276;
    assign _4233 = _4229 ? f_changed_all : _4232;
    assign _4235 = _2023 ? _1285 : _4233;
    assign _322 = _4235;
    always @(posedge _326) begin
        if (_324)
            _384 <= _1285;
        else
            _384 <= _322;
    end
    assign f_changed_all = _384 | f_chg_now;
    assign _799 = f_changed_all & f_chgmask1;
    assign _801 = _799 == _1285;
    assign _802 = ~ _801;
    assign f_chgmask1 = _761[23:16];
    assign _798 = f_chgmask1 == _1285;
    assign _803 = _798 | _802;
    assign _792 = _761[7:0];
    assign _790 = _761[15:8];
    assign vdd = 1'b1;
    assign _324 = clear;
    assign _326 = clock;
    assign _328 = pins_in;
    always @(posedge _326) begin
        if (_324)
            _368 <= _1285;
        else
            _368 <= _328;
    end
    always @(posedge _326) begin
        if (_324)
            _371 <= _1285;
        else
            _371 <= _368;
    end
    assign _791 = _371 ^ _790;
    assign _793 = _791 & _792;
    assign _795 = _793 == _1285;
    assign _761 = _363[287:176];
    assign f_valid1 = _761[111:111];
    assign _796 = f_valid1 & _795;
    assign _804 = _796 & _803;
    assign _877 = _804 & _876;
    assign _882 = _877 & _881;
    assign _921 = _882 & _920;
    assign _922 = f_in_eval & _921;
    assign _926 = _922 & _925;
    assign f_fire1 = _926 & _788;
    assign _1070 = f_fire1 ? _1276 : _1068;
    assign f_winner = f_fire0 ? _2565 : _1070;
    always @* begin
        case (f_winner)
        0:
            _4183 <= _4179;
        1:
            _4183 <= _4180;
        2:
            _4183 <= _4181;
        default:
            _4183 <= _4182;
        endcase
    end
    assign _4185 = _1854 ? _4184 : _4183;
    assign _4236 = _4185[0:0];
    assign _1853 = _415 == _1333;
    assign f_in_fetch = _348 == _1276;
    assign _1854 = f_in_fetch & _1853;
    assign _1855 = _1854 | _1252;
    assign _4237 = _1855 & _4236;
    assign _4246 = _4237 ? _1235 : _4244;
    assign _4248 = _2023 ? _1235 : _4246;
    assign _329 = _4248;
    always @(posedge _326) begin
        if (_324)
            _399 <= _1235;
        else
            _399 <= _329;
    end
    assign _2071 = _756[33:32];
    always @* begin
        case (_2071)
        0:
            _2072 <= _399;
        1:
            _2072 <= _402;
        2:
            _2072 <= _405;
        default:
            _2072 <= _405;
        endcase
    end
    assign _2070 = _756[49:34];
    assign _2073 = _2070 < _2072;
    assign _756 = _363[63:0];
    assign _2068 = _756[31:31];
    assign _2066 = ~ _1252;
    assign _2067 = f_in_eval & _2066;
    assign _2069 = _2067 & _2068;
    assign _2074 = _2069 & _2073;
    assign _2079 = _2074 & _2078;
    assign _2087 = _2079 | f_unexp_now;
    assign f_viol_now = _2087 | f_amb_now;
    assign _4254 = f_viol_now ? _4253 : _415;
    assign _4257 = _1252 ? _4256 : _4254;
    assign _4250 = _348 == _1277;
    assign _4258 = _4250 ? _4257 : _415;
    assign _4249 = _348 == _1276;
    assign _4261 = _4249 ? _4260 : _4258;
    assign _4263 = _2023 ? _1136 : _4261;
    assign _330 = _4263;
    always @(posedge _326) begin
        if (_324)
            _415 <= _1136;
        else
            _415 <= _330;
    end
    assign _4266 = _415 == _1333;
    assign _4267 = _4266 ? _318 : _353;
    assign _4264 = _348 == _1276;
    assign _4268 = _4264 ? _4267 : _353;
    assign _331 = _4268;
    always @(posedge _326) begin
        if (_324)
            _353 <= _352;
        else
            _353 <= _331;
    end
    assign _363 = { _353,
                    _356,
                    _359,
                    _362 };
    assign _364 = _363[175:64];
    assign f_valid0 = _364[111:111];
    assign _378 = f_valid0 & _377;
    assign _395 = _378 & _394;
    assign _644 = _395 & _643;
    assign _701 = _644 & _700;
    assign _745 = _701 & _744;
    assign f_in_eval = _348 == _1277;
    assign _746 = f_in_eval & _745;
    assign _755 = _746 & _754;
    assign f_fire0 = _755 & _788;
    assign _1156 = f_fire0 | f_fire1;
    assign _1157 = _1156 | f_fire2;
    assign _1252 = _1157 | f_fire3;
    assign _4287 = _1252 ? _4286 : _4284;
    assign _4272 = _348 == _2091;
    assign _4274 = _4272 ? _2565 : _348;
    assign _4270 = _348 == _1277;
    assign _4288 = _4270 ? _4287 : _4274;
    assign _4269 = _348 == _1276;
    assign _4291 = _4269 ? _4290 : _4288;
    assign _333 = host_stop;
    assign _4293 = _333 ? _2565 : _4291;
    assign _4295 = _2023 ? _1276 : _4293;
    assign _334 = _4295;
    always @(posedge _326) begin
        if (_324)
            _348 <= _2565;
        else
            _348 <= _334;
    end
    assign _1310 = _348 == _2565;
    assign _336 = host_verify;
    assign _2722 = _336 & _1310;
    assign _2724 = _2722 & _2723;
    assign _4297 = _2724 ? _1955 : f_sweeping;
    assign _4307 = f_sweeping ? _4306 : _4297;
    assign _337 = _4307;
    always @(posedge _326) begin
        if (_324)
            f_sweeping <= _1128;
        else
            f_sweeping <= _337;
    end
    assign _4319 = f_sweeping ? _4318 : _4312;
    assign _338 = _4319;
    always @(posedge _326) begin
        if (_324)
            f_image_valid <= _1128;
        else
            f_image_valid <= _338;
    end
    assign _340 = host_start;
    assign _2023 = _340 & f_image_valid;
    assign _4343 = _2023 ? _1285 : _4341;
    assign _341 = _4343;
    always @(posedge _326) begin
        if (_324)
            f_pout <= _1285;
        else
            f_pout <= _341;
    end
    assign _2647 = f_pout[7:7];
    assign _343 = host_pin_src;
    assign _2643 = _343[23:21];
    always @* begin
        case (_2643)
        0:
            _2654 <= _2647;
        1:
            _2654 <= f_lane0_out;
        2:
            _2654 <= _2648;
        3:
            _2654 <= _2649;
        4:
            _2654 <= _2651;
        5:
            _2654 <= f_lane1_out;
        6:
            _2654 <= _2652;
        default:
            _2654 <= _2653;
        endcase
    end
    assign _2718 = { _2654,
                     _2663,
                     _2672,
                     _2681,
                     _2690,
                     _2699,
                     _2708,
                     _2717 };
    assign _4345 = _2718 & _4344;
    assign pins_out = _4345;
    assign pins_oe = _2721;
    assign st_running = _2578;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1260;
    assign st_accepting = _2577;
    assign st_taken = _2575;
    assign st_taken_edge = _2572;
    assign st_viol = _2569;
    assign st_viol_kind = _2566;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _1720;
    assign st_tx_empty = _660;
    assign st_rx_data = _2561;
    assign st_rx_empty = _2496;
    assign st_vlog_data = _2494;
    assign st_vlog_empty = _2115;
    assign st_cov_rdata = _2123;
    assign st_irq = _2119;
    assign st_halted_viol = _2052;
    assign st_rx_overflow = _2045;
    assign st_vlog_overflow = _2033;
    assign st_cov_overrun = _2026;
    assign st_host_err = _2008;
    assign st_host_err_cause = _2013;
    assign st_lane_active = _1964;
    assign st_image_valid = f_image_valid;
    assign st_verify_busy = f_sweeping;
    assign st_tx_collision = _1954;
    assign st_drops = _1920;
    assign st_lane_status = _1651;
    assign ram_rec_addr = _1344;
    assign ram_rec_re = _1336;
    assign ram_rec_we = f_store_we;
    assign ram_rec_wdata = _17;
    assign ram_cov_addr = _1329;
    assign ram_cov_re = _1324;
    assign ram_cov_we = _1321;
    assign ram_cov_wdata = _1308;

endmodule
