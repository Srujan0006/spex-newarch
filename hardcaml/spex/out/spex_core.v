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
    wire [2:0] _1484;
    wire [2:0] _1485;
    wire [2:0] _1457;
    wire [2:0] _1459;
    wire [2:0] _1460;
    wire [2:0] _1486;
    wire [2:0] _1488;
    wire [2:0] _1490;
    wire [2:0] _24;
    reg [2:0] _1456;
    wire [7:0] _1644;
    wire [2:0] _1637;
    wire [2:0] _1611;
    wire [2:0] _1612;
    wire [2:0] _1638;
    wire [2:0] _1640;
    wire [2:0] _1642;
    wire [2:0] _25;
    reg [2:0] _1608;
    wire [7:0] _1643;
    wire [15:0] _1645;
    wire [7:0] _1736;
    wire [7:0] _1737;
    wire _1733;
    wire _1734;
    wire _1726;
    wire _1723;
    wire _1724;
    wire _1720;
    wire _1717;
    wire _1718;
    wire _1719;
    wire _1721;
    wire _1725;
    wire _1727;
    wire _1716;
    wire _1728;
    wire _1735;
    wire [7:0] _1738;
    wire [7:0] _1740;
    wire [7:0] _27;
    reg [7:0] _1731;
    wire [7:0] _1839;
    wire _1835;
    wire _1836;
    wire _1828;
    wire _1825;
    wire _1826;
    wire _1822;
    wire _1819;
    wire _1820;
    wire _1821;
    wire _1823;
    wire _1827;
    wire _1829;
    wire _1715;
    wire _1817;
    wire _1818;
    wire _1830;
    wire _1837;
    wire [7:0] _1840;
    wire [7:0] _1842;
    wire [7:0] _28;
    reg [7:0] _1833;
    wire [7:0] _1879;
    wire _1875;
    wire _1876;
    wire _1869;
    wire _1870;
    wire _1877;
    wire [7:0] _1880;
    wire [7:0] _1882;
    wire [7:0] _29;
    reg [7:0] _1873;
    wire [7:0] _1894;
    wire _1890;
    wire _1891;
    wire _1892;
    wire [7:0] _1895;
    wire [7:0] _1897;
    wire [7:0] _30;
    reg [7:0] _1888;
    wire [7:0] _1910;
    wire _1906;
    wire _1907;
    wire _1908;
    wire [7:0] _1911;
    wire _32;
    wire [7:0] _1913;
    wire [7:0] _33;
    reg [7:0] _1904;
    wire [39:0] _1914;
    wire _1949;
    wire _1927;
    wire _1945;
    wire _1950;
    wire _1952;
    wire _35;
    reg _1948;
    wire [1:0] _1958;
    wire [2:0] _2008;
    wire [2:0] _2010;
    wire [2:0] _40;
    reg [2:0] _2007;
    wire _2003;
    wire [2:0] _1993;
    wire [2:0] _1989;
    wire [2:0] _1990;
    wire [2:0] _1994;
    wire [2:0] _1986;
    wire [2:0] _1985;
    wire [2:0] _1987;
    wire [2:0] _1995;
    wire _1981;
    wire _1978;
    wire _1979;
    wire _1980;
    wire _1982;
    wire _1974;
    wire _1975;
    wire _1956;
    wire _1971;
    wire _1972;
    wire _1957;
    wire [1:0] _43;
    wire _1969;
    wire _1970;
    wire _1973;
    wire _1976;
    wire _44;
    reg _1263;
    wire _1965;
    wire _1964;
    wire _1966;
    wire _1962;
    wire _46;
    wire _48;
    wire _1961;
    wire _1963;
    wire _1967;
    wire _1959;
    wire _1960;
    wire _1968;
    wire _1977;
    wire _1983;
    wire [2:0] _1996;
    wire _1998;
    wire _1999;
    wire _2004;
    wire _2012;
    wire _50;
    wire _2014;
    wire _51;
    reg _2002;
    wire [7:0] _53;
    reg [7:0] _1258;
    wire [7:0] _1255;
    wire _1899;
    wire _1900;
    wire _2015;
    wire _2016;
    wire _54;
    reg _1250;
    wire _56;
    wire _1247;
    wire _1898;
    wire _1901;
    wire _2022;
    wire _2024;
    wire _57;
    reg _2020;
    wire _1885;
    wire _2029;
    wire _2031;
    wire _59;
    reg _2027;
    wire _2035;
    wire _1867;
    wire _1860;
    wire _1868;
    wire _1815;
    wire _1811;
    wire _1816;
    wire _2032;
    wire _61;
    wire _2033;
    wire _2034;
    wire _2036;
    wire _2041;
    wire _2043;
    wire _62;
    reg _2039;
    wire _2047;
    wire _2048;
    wire _2053;
    wire _66;
    wire _2055;
    wire _2057;
    wire _67;
    reg _2051;
    wire _2086;
    wire _2088;
    wire _2084;
    wire _2090;
    wire _2091;
    wire _2092;
    wire _2059;
    wire _2093;
    wire _2095;
    wire _68;
    reg _2046;
    wire _2110;
    wire [2:0] _70;
    wire [3:0] _2103;
    wire _2104;
    wire _2105;
    wire _72;
    wire _2106;
    wire [2:0] _74;
    wire _2097;
    wire [2:0] _2099;
    wire [3:0] _2100;
    wire _2101;
    wire _2102;
    wire _2107;
    wire _2111;
    wire _2112;
    wire _2113;
    wire [31:0] _77;
    wire [31:0] _2116;
    wire _2114;
    wire _2115;
    wire [31:0] _2117;
    wire [2:0] _2484;
    wire _2485;
    wire _2486;
    wire [47:0] _2483;
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
    wire _2449;
    wire _2450;
    reg [47:0] _2451;
    wire [2:0] _2124;
    wire [2:0] _2125;
    wire [2:0] _80;
    reg [2:0] _2122;
    wire _2443;
    wire _2444;
    wire [2:0] _2416;
    wire [28:0] _2133;
    wire [28:0] _2132;
    wire [28:0] _2135;
    wire [28:0] _2136;
    wire [2:0] _2129;
    wire _2131;
    wire [28:0] _2137;
    wire [28:0] _81;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2414;
    wire [2:0] _2155;
    wire _2151;
    wire _2152;
    wire _2149;
    wire _2153;
    wire [2:0] _2156;
    wire _2146;
    wire _2147;
    wire _2144;
    wire _2143;
    wire _2145;
    wire _2148;
    wire [2:0] _2158;
    wire _2139;
    wire [2:0] _2159;
    wire [2:0] _82;
    reg [2:0] _2142;
    wire _2405;
    wire [2:0] _2407;
    wire [2:0] _2176;
    wire _2172;
    wire _2173;
    wire _2170;
    wire _2174;
    wire [2:0] _2177;
    wire _2167;
    wire _2168;
    wire _2165;
    wire _2164;
    wire _2166;
    wire _2169;
    wire [2:0] _2179;
    wire _2160;
    wire [2:0] _2180;
    wire [2:0] _83;
    reg [2:0] _2163;
    wire _2402;
    wire [2:0] _2404;
    wire [2:0] _2408;
    wire [2:0] _2197;
    wire _2193;
    wire _2194;
    wire _2191;
    wire _2195;
    wire [2:0] _2198;
    wire _2188;
    wire _2189;
    wire _2186;
    wire _2185;
    wire _2187;
    wire _2190;
    wire [2:0] _2200;
    wire _2181;
    wire [2:0] _2201;
    wire [2:0] _84;
    reg [2:0] _2184;
    wire _2398;
    wire [2:0] _2400;
    wire [2:0] _2218;
    wire _2214;
    wire _2215;
    wire _2212;
    wire _2216;
    wire [2:0] _2219;
    wire _2209;
    wire _2210;
    wire _2207;
    wire _2206;
    wire _2208;
    wire _2211;
    wire [2:0] _2221;
    wire _2202;
    wire [2:0] _2222;
    wire [2:0] _85;
    reg [2:0] _2205;
    wire _2395;
    wire [2:0] _2397;
    wire [2:0] _2401;
    wire [2:0] _2409;
    wire [2:0] _2239;
    wire _2235;
    wire _2236;
    wire _2233;
    wire _2237;
    wire [2:0] _2240;
    wire _2230;
    wire _2231;
    wire _2228;
    wire _2227;
    wire _2229;
    wire _2232;
    wire [2:0] _2242;
    wire _2223;
    wire [2:0] _2243;
    wire [2:0] _86;
    reg [2:0] _2226;
    wire _2390;
    wire [2:0] _2392;
    wire [2:0] _2260;
    wire _2256;
    wire _2257;
    wire _2254;
    wire _2258;
    wire [2:0] _2261;
    wire _2251;
    wire _2252;
    wire _2249;
    wire _2248;
    wire _2250;
    wire _2253;
    wire [2:0] _2263;
    wire _2244;
    wire [2:0] _2264;
    wire [2:0] _87;
    reg [2:0] _2247;
    wire _2387;
    wire [2:0] _2389;
    wire [2:0] _2393;
    wire [2:0] _2281;
    wire _2277;
    wire _2278;
    wire _2275;
    wire _2279;
    wire [2:0] _2282;
    wire _2272;
    wire _2273;
    wire _2270;
    wire _2269;
    wire _2271;
    wire _2274;
    wire [2:0] _2284;
    wire _2265;
    wire [2:0] _2285;
    wire [2:0] _88;
    reg [2:0] _2268;
    wire _2383;
    wire [2:0] _2385;
    wire [2:0] _2302;
    wire _2298;
    wire _2299;
    wire _2296;
    wire _2300;
    wire [2:0] _2303;
    wire _2293;
    wire _2294;
    wire _2291;
    wire _2290;
    wire _2292;
    wire _2295;
    wire [2:0] _2305;
    wire _2286;
    wire [2:0] _2306;
    wire [2:0] _89;
    reg [2:0] _2289;
    wire _2380;
    wire [2:0] _2382;
    wire [2:0] _2386;
    wire [2:0] _2394;
    wire [2:0] _2410;
    wire _2375;
    wire _2374;
    wire _2376;
    wire _2372;
    wire _2371;
    wire _2373;
    wire _2377;
    wire _2368;
    wire _2367;
    wire _2369;
    wire _2365;
    wire _2364;
    wire _2366;
    wire _2370;
    wire _2378;
    wire [2:0] _2411;
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
    wire _2341;
    wire _2340;
    wire _2342;
    wire [2:0] _2344;
    wire _2336;
    wire _2335;
    wire _2337;
    wire [2:0] _2339;
    wire _2345;
    wire [2:0] _2346;
    wire _2359;
    wire [2:0] _2360;
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
    wire _2315;
    wire _2314;
    wire _2316;
    wire [2:0] _2318;
    wire _2310;
    wire _2309;
    wire _2311;
    wire [2:0] _2313;
    wire _2319;
    wire [2:0] _2320;
    wire _2333;
    wire [2:0] _2334;
    wire _2361;
    wire [2:0] _2362;
    wire [2:0] _2363;
    wire [2:0] _2412;
    wire [2:0] _2307;
    wire _2413;
    wire [28:0] _2415;
    wire [31:0] _2417;
    wire [47:0] _2421;
    wire [47:0] _90;
    reg [47:0] _2445;
    wire [2:0] _2438;
    wire [3:0] _2108;
    wire [3:0] _2427;
    wire [3:0] _2428;
    wire [3:0] _2426;
    wire [3:0] _2429;
    wire [3:0] _1883;
    wire _1884;
    wire _2118;
    wire _91;
    wire _2119;
    wire _2424;
    wire [3:0] _2430;
    reg [3:0] _2433;
    wire [3:0] _92;
    wire _2109;
    wire _2422;
    wire _94;
    wire _2423;
    wire [2:0] _2439;
    wire [2:0] _95;
    reg [2:0] _2436;
    reg [47:0] _2488;
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
    wire _2516;
    wire _2517;
    reg [7:0] _2518;
    wire [2:0] _2497;
    wire [2:0] _2498;
    wire [2:0] _98;
    reg [2:0] _2495;
    wire _2510;
    wire _2511;
    reg [7:0] _2512;
    wire [2:0] _2505;
    wire [2:0] _2506;
    wire [2:0] _99;
    reg [2:0] _2503;
    reg [7:0] _2555;
    wire [31:0] _2556;
    wire [31:0] _2557;
    wire [31:0] _103;
    reg [31:0] ts_reg;
    wire [1:0] _2559;
    wire [1:0] _2418;
    wire [1:0] _2420;
    reg [1:0] _2560;
    reg _2563;
    reg [1:0] _2566;
    reg _2569;
    wire _2570;
    wire _2571;
    wire _2572;
    wire [7:0] _2713;
    wire [7:0] _2714;
    wire [7:0] _2594;
    wire [7:0] _2592;
    wire [7:0] _2591;
    wire [7:0] _2590;
    wire [7:0] _2589;
    reg [7:0] _2593;
    wire [7:0] _2595;
    wire [7:0] _2596;
    wire [7:0] _2587;
    wire [7:0] _2588;
    wire [7:0] _2597;
    wire [7:0] _2631;
    wire [7:0] _2632;
    wire [7:0] _2634;
    wire [7:0] _2636;
    wire [7:0] _113;
    reg [7:0] f_poe;
    wire [7:0] _2715;
    wire [7:0] _116;
    wire [7:0] _4280;
    wire _2710;
    wire _2709;
    wire _2707;
    wire _2708;
    wire _2706;
    wire _2705;
    wire _2704;
    wire [2:0] _2703;
    reg _2711;
    wire _2701;
    wire _2700;
    wire _2698;
    wire _2699;
    wire _2697;
    wire _2696;
    wire _2695;
    wire [2:0] _2694;
    reg _2702;
    wire _2692;
    wire _2691;
    wire _2689;
    wire _2690;
    wire _2688;
    wire _2687;
    wire _2686;
    wire [2:0] _2685;
    reg _2693;
    wire _2683;
    wire _2682;
    wire _2680;
    wire _2681;
    wire _2679;
    wire _2678;
    wire _2677;
    wire [2:0] _2676;
    reg _2684;
    wire _2674;
    wire _2673;
    wire _2671;
    wire _2672;
    wire _2670;
    wire _2669;
    wire _2668;
    wire [2:0] _2667;
    reg _2675;
    wire _2665;
    wire _2664;
    wire _2662;
    wire _2663;
    wire _2661;
    wire _2660;
    wire _2659;
    wire [2:0] _2658;
    reg _2666;
    wire _2656;
    wire _2655;
    wire _2653;
    wire _2654;
    wire _2652;
    wire _2651;
    wire _2650;
    wire [2:0] _2649;
    reg _2657;
    wire _2647;
    wire _2646;
    wire _2644;
    wire _2645;
    wire _2643;
    wire _2642;
    wire [2:0] _4272;
    wire _4269;
    wire [1:0] _4270;
    wire [3:0] _4271;
    wire [6:0] _4273;
    wire [7:0] _4274;
    wire [7:0] _4275;
    wire _2628;
    wire _2627;
    wire _2626;
    wire _2624;
    wire _2625;
    wire _2622;
    wire _2623;
    wire _2619;
    wire _2620;
    wire _2621;
    wire _2616;
    wire _2617;
    wire _2618;
    wire _2613;
    wire _2612;
    wire _2614;
    wire _2611;
    wire _2615;
    wire [7:0] _2629;
    wire _2598;
    wire _2604;
    wire [7:0] _2630;
    wire [7:0] _4267;
    wire [7:0] _4263;
    wire [7:0] _4261;
    wire [7:0] _4260;
    wire [7:0] _4259;
    wire [7:0] _4258;
    reg [7:0] _4262;
    wire [7:0] _4264;
    wire [7:0] _4265;
    wire [7:0] _2585;
    wire [7:0] _2583;
    wire [7:0] _2582;
    wire [7:0] _2581;
    wire [7:0] _2580;
    reg [7:0] _2584;
    wire [7:0] _2586;
    wire [7:0] _4256;
    wire [7:0] _4257;
    wire [7:0] _4266;
    wire [7:0] _4268;
    wire [7:0] _4276;
    wire _2574;
    wire _2575;
    wire _2576;
    wire [7:0] _4277;
    wire [31:0] _118;
    wire [31:0] _4249;
    wire [31:0] _2827;
    wire [30:0] _2825;
    wire [31:0] _2826;
    wire [31:0] _2828;
    wire [30:0] _2822;
    wire [31:0] _2823;
    wire [30:0] _2815;
    wire [31:0] _2816;
    wire [31:0] _2818;
    wire [30:0] _2812;
    wire [31:0] _2813;
    wire [30:0] _2805;
    wire [31:0] _2806;
    wire [31:0] _2808;
    wire [30:0] _2802;
    wire [31:0] _2803;
    wire [30:0] _2795;
    wire [31:0] _2796;
    wire [31:0] _2798;
    wire [30:0] _2792;
    wire [31:0] _2793;
    wire [30:0] _2785;
    wire [31:0] _2786;
    wire [31:0] _2788;
    wire [30:0] _2782;
    wire [31:0] _2783;
    wire [30:0] _2775;
    wire [31:0] _2776;
    wire [31:0] _2778;
    wire [30:0] _2772;
    wire [31:0] _2773;
    wire [30:0] _2765;
    wire [31:0] _2766;
    wire [31:0] _2768;
    wire [30:0] _2762;
    wire [31:0] _2763;
    wire [30:0] _2755;
    wire [31:0] _2756;
    wire [31:0] _2758;
    wire [30:0] _2752;
    wire [31:0] _2753;
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
    wire [7:0] _2736;
    wire [7:0] _2735;
    wire [7:0] _2734;
    wire [7:0] _2733;
    wire [7:0] _2732;
    wire [7:0] _2731;
    wire [12:0] _2728;
    wire [12:0] _2729;
    wire [3:0] _2730;
    reg [7:0] _2747;
    wire [23:0] _2727;
    wire [31:0] _2748;
    wire _2725;
    wire _2726;
    wire [31:0] _2830;
    wire [31:0] _2723;
    wire [31:0] _2831;
    wire [31:0] _119;
    reg [31:0] _2721;
    wire [31:0] _2749;
    wire _2750;
    wire [31:0] _2759;
    wire _2760;
    wire [31:0] _2769;
    wire _2770;
    wire [31:0] _2779;
    wire _2780;
    wire [31:0] _2789;
    wire _2790;
    wire [31:0] _2799;
    wire _2800;
    wire [31:0] _2809;
    wire _2810;
    wire [31:0] _2819;
    wire _2820;
    wire [31:0] _2829;
    wire [31:0] _4250;
    wire f_sw_match;
    wire _4252;
    wire _4254;
    wire _1325;
    wire _1324;
    wire f_store_we;
    wire _4244;
    wire _4246;
    wire _4248;
    wire [12:0] _4237;
    wire [12:0] _2835;
    wire [12:0] _2833;
    wire [12:0] _2836;
    wire [12:0] _120;
    reg [12:0] f_sw_cnt;
    wire f_sw_last;
    wire _4240;
    wire _122;
    wire _124;
    wire _4234;
    wire _4235;
    wire _4236;
    wire _4242;
    wire _2717;
    wire [1:0] _4226;
    wire [1:0] _4222;
    wire [1:0] _2085;
    wire _4213;
    wire [1:0] _4215;
    wire _4212;
    wire [1:0] _4217;
    wire _4211;
    wire [1:0] _4219;
    wire [1:0] _4220;
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
    wire [2:0] _4196;
    wire [5:0] _1253;
    wire [5:0] _126;
    wire [5:0] _2853;
    wire [5:0] _128;
    wire [5:0] _2840;
    wire [5:0] _129;
    reg [5:0] _2839;
    wire _2843;
    wire [5:0] _2844;
    wire [5:0] _2845;
    wire [5:0] _2854;
    wire _2841;
    wire [5:0] _2855;
    wire [5:0] _2856;
    wire [5:0] _130;
    reg [5:0] _1254;
    wire [5:0] _2849;
    wire [5:0] _2848;
    wire [5:0] _2847;
    wire [5:0] _2846;
    reg [5:0] _2850;
    wire _2851;
    wire _2852;
    wire [2:0] _4192;
    wire _4187;
    wire [2:0] _4189;
    wire [7:0] _2076;
    wire _2078;
    wire _2079;
    wire _2074;
    wire _2075;
    wire f_unexp_now;
    wire _2860;
    wire _2861;
    wire _2863;
    wire _2864;
    wire _2859;
    wire _2857;
    wire _2865;
    wire _131;
    reg _2071;
    wire _2072;
    wire [15:0] _4178;
    wire [15:0] _4179;
    wire _4175;
    wire _4176;
    wire _4177;
    wire [15:0] _4180;
    wire [2:0] _4120;
    wire [2:0] _4118;
    wire [2:0] _4117;
    wire [2:0] _4116;
    wire [2:0] _4115;
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
    wire [7:0] _2870;
    wire [7:0] _2871;
    wire _2867;
    wire [7:0] _2869;
    wire _2866;
    wire [7:0] _2872;
    wire [7:0] _2874;
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
    wire [1:0] _2875;
    wire [1:0] _135;
    reg [1:0] _698;
    wire _700;
    wire _877;
    wire _914;
    wire _874;
    wire _2879;
    wire _2877;
    wire _2880;
    wire _2882;
    wire _2884;
    wire _136;
    reg _691;
    wire [15:0] _138;
    wire [15:0] _140;
    wire [15:0] _2890;
    wire [15:0] _2891;
    wire _2893;
    wire _2895;
    wire _2896;
    wire _2897;
    wire _2898;
    wire _2900;
    wire _2902;
    wire _141;
    reg _688;
    wire _2915;
    wire _2916;
    wire _2918;
    wire _2919;
    wire _2920;
    wire _2921;
    wire _2923;
    wire _142;
    reg g_crc_bad;
    wire _2917;
    wire _2926;
    wire [5:0] _2924;
    wire _2925;
    wire _2927;
    wire _2928;
    wire _2929;
    wire _2930;
    wire _2931;
    wire _2933;
    wire _2935;
    wire _143;
    reg _685;
    wire _2939;
    wire _2937;
    wire _2940;
    wire _2942;
    wire _2944;
    wire _144;
    reg _677;
    wire [15:0] _146;
    wire [15:0] _148;
    wire [15:0] _2950;
    wire [15:0] _2951;
    wire _2953;
    wire _2955;
    wire _2956;
    wire _2957;
    wire _2958;
    wire _2960;
    wire _2962;
    wire _149;
    reg _674;
    wire _2975;
    wire _2976;
    wire _2978;
    wire _2979;
    wire _2980;
    wire _2981;
    wire _2983;
    wire _150;
    reg g_crc_bad_0;
    wire _2977;
    wire _2986;
    wire _2985;
    wire _2987;
    wire _2988;
    wire _2989;
    wire _2990;
    wire _2991;
    wire _2993;
    wire _2995;
    wire _151;
    reg _671;
    wire [7:0] _153;
    wire [6:0] _662;
    wire [6:0] _661;
    wire _663;
    wire [15:0] _658;
    wire _3000;
    wire _2999;
    wire _3001;
    wire _2998;
    wire _3002;
    wire _2997;
    wire _3003;
    wire [14:0] _2996;
    wire [15:0] _3004;
    wire [15:0] _154;
    reg [15:0] _659;
    wire _660;
    wire [3:0] _3017;
    wire [3:0] _3015;
    wire [3:0] _3018;
    wire _2490;
    wire _2499;
    wire _156;
    wire _2500;
    wire _2491;
    wire _3011;
    wire _3007;
    wire _3005;
    wire _3006;
    wire _3008;
    wire _3012;
    wire f_rx_push;
    wire _2492;
    wire _3013;
    wire [3:0] _3019;
    reg [3:0] _3022;
    wire [3:0] _158;
    wire _656;
    wire _652;
    wire [6:0] _3931;
    wire [7:0] _3932;
    wire _3929;
    wire _3928;
    wire _3927;
    wire _3926;
    wire _3925;
    wire _3924;
    wire _3923;
    wire _3922;
    wire [7:0] _3930;
    wire [3:0] _3914;
    wire [3:0] _3912;
    wire [3:0] _3915;
    wire _1714;
    wire _3038;
    wire _3035;
    wire _160;
    wire _3036;
    wire _1710;
    wire [2:0] _1704;
    wire _1699;
    wire g_tx_bit;
    wire _1700;
    wire _1701;
    wire _1702;
    wire [2:0] _1705;
    wire _1707;
    wire _1708;
    wire _1679;
    wire _1709;
    wire _1711;
    wire _1675;
    wire [5:0] _1666;
    wire _1667;
    wire _1668;
    wire [9:0] _1662;
    wire _1664;
    wire _1665;
    wire _1669;
    wire _3902;
    wire _3903;
    wire [1:0] _3906;
    wire _3895;
    wire _3896;
    wire _3897;
    wire _3898;
    wire [1:0] _3900;
    wire [2:0] _3881;
    wire [2:0] _3878;
    wire _3874;
    wire _3872;
    wire _3873;
    wire _3875;
    wire [2:0] _3879;
    wire _3870;
    wire [2:0] _3882;
    wire _3883;
    wire [2:0] _3864;
    wire _3860;
    wire _3858;
    wire _3859;
    wire _3861;
    wire [2:0] _3865;
    wire _3856;
    wire [2:0] _3867;
    wire _3868;
    wire _3884;
    wire _3885;
    wire _3886;
    wire _3852;
    wire _3850;
    wire _3853;
    wire [15:0] _3845;
    wire _3846;
    wire _3843;
    wire _3847;
    wire _3841;
    wire _3842;
    wire _3848;
    wire _3854;
    wire _3887;
    wire [1:0] _3889;
    wire [1:0] _3891;
    wire [1:0] _3837;
    wire _3833;
    wire [1:0] _3835;
    wire [1:0] _3838;
    wire _3114;
    wire _3115;
    wire _161;
    reg _3025;
    wire _3759;
    wire _3757;
    wire _3758;
    reg _3760;
    wire [2:0] _163;
    wire [2:0] _3741;
    wire [2:0] _3742;
    wire [2:0] _3737;
    wire _3733;
    wire _3731;
    wire _3732;
    wire _3734;
    wire [2:0] _3738;
    wire _3729;
    wire [2:0] _3743;
    wire [2:0] _3744;
    wire [2:0] _3723;
    wire [2:0] _3724;
    wire [2:0] _3719;
    wire _3110;
    wire _3109;
    wire _3108;
    wire _3107;
    wire _3106;
    wire _3105;
    wire _3104;
    wire _3100;
    wire _3099;
    wire _3098;
    wire _3097;
    wire _3096;
    wire _3095;
    wire _3094;
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
    wire _3056;
    wire _3057;
    reg [7:0] _3058;
    wire _3050;
    wire _3051;
    reg [7:0] _3052;
    wire [2:0] _3117;
    wire [2:0] _3118;
    wire [2:0] _164;
    reg [2:0] _3042;
    wire _3044;
    wire _3045;
    wire [7:0] _3185;
    wire [7:0] _3186;
    wire [7:0] _3136;
    wire [7:0] _3134;
    wire [7:0] _3137;
    wire [7:0] _165;
    reg [7:0] _3123;
    wire [7:0] _3132;
    wire [7:0] _3133;
    wire [7:0] _3178;
    wire [7:0] _3145;
    wire [7:0] _3143;
    wire [7:0] _3146;
    wire [7:0] _166;
    reg [7:0] _3142;
    wire [6:0] _3163;
    wire [7:0] _3164;
    wire [6:0] _3161;
    wire _3159;
    wire _3158;
    wire _3157;
    wire _3156;
    wire _3155;
    wire _3154;
    wire _3153;
    wire _3152;
    wire [2:0] _3150;
    wire [2:0] _3149;
    wire [2:0] _3148;
    wire [2:0] _3147;
    reg [2:0] _3151;
    reg _3160;
    wire [7:0] _3162;
    reg [7:0] _3165;
    wire [7:0] _3166;
    wire [7:0] _167;
    reg [7:0] _651;
    wire _3144;
    wire _3170;
    wire _3138;
    wire _3139;
    wire _3168;
    wire [1:0] _1853;
    wire [1:0] _1852;
    wire [1:0] _1851;
    wire [1:0] _1850;
    reg [1:0] _1854;
    wire [1:0] _1856;
    wire f_eng_push;
    wire _1859;
    wire _1865;
    wire _1862;
    wire _1863;
    wire _1861;
    wire _1864;
    wire _1866;
    wire _3171;
    wire _168;
    reg _1845;
    wire [7:0] _3177;
    wire _3135;
    wire _3175;
    wire _1808;
    wire [2:0] _1802;
    wire _1797;
    wire g_tx_bit_0;
    wire _1798;
    wire _1799;
    wire _1800;
    wire [2:0] _1803;
    wire _1805;
    wire _1806;
    wire _1777;
    wire _1807;
    wire _1809;
    wire _1773;
    wire _1774;
    wire _1810;
    wire _3119;
    wire _3120;
    wire _3173;
    wire _3176;
    wire _169;
    reg _1743;
    wire _1813;
    wire _1812;
    wire _1814;
    wire [7:0] _3179;
    wire [7:0] _3187;
    wire [7:0] _170;
    wire [7:0] _171;
    wire [7:0] _173;
    wire [7:0] _3032;
    reg [7:0] _3046;
    wire [2:0] _3563;
    wire _3560;
    wire _1942;
    wire _1778;
    wire _3550;
    wire _3551;
    wire [1:0] _3554;
    wire _3543;
    wire _3544;
    wire _3545;
    wire _3546;
    wire [1:0] _3548;
    wire [2:0] _3529;
    wire [2:0] _3526;
    wire _3522;
    wire _3520;
    wire _3521;
    wire _3523;
    wire [2:0] _3527;
    wire _3518;
    wire [2:0] _3530;
    wire _3531;
    wire [2:0] _3512;
    wire _3508;
    wire _3506;
    wire _3507;
    wire _3509;
    wire [2:0] _3513;
    wire _3504;
    wire [2:0] _3515;
    wire _3516;
    wire _3532;
    wire _3533;
    wire _3534;
    wire _3500;
    wire _3498;
    wire _3501;
    wire [15:0] _3493;
    wire _3494;
    wire _3491;
    wire _3495;
    wire _3489;
    wire _3490;
    wire _3496;
    wire _3502;
    wire _3535;
    wire [1:0] _3537;
    wire [1:0] _3539;
    wire [1:0] _3485;
    wire _3481;
    wire [1:0] _3483;
    wire [1:0] _3486;
    wire _3215;
    wire _3216;
    wire _174;
    reg _3190;
    wire _3411;
    wire _3409;
    wire _3410;
    reg _3412;
    wire [2:0] _176;
    wire [2:0] _3393;
    wire [2:0] _3394;
    wire [2:0] _3389;
    wire _3385;
    wire _3383;
    wire _3384;
    wire _3386;
    wire [2:0] _3390;
    wire _3381;
    wire [2:0] _3395;
    wire [2:0] _3396;
    wire [2:0] _3375;
    wire [2:0] _3376;
    wire [2:0] _3371;
    wire _3211;
    wire _3210;
    wire _3209;
    wire _3208;
    wire _3207;
    wire _3206;
    wire _3205;
    wire _3201;
    wire _3200;
    wire _3199;
    wire _3198;
    wire _3197;
    wire _3196;
    wire _3195;
    wire [7:0] _3192;
    wire [6:0] _3129;
    wire [7:0] _3130;
    wire [6:0] _3127;
    wire [7:0] _3128;
    wire [7:0] _3131;
    wire [7:0] _3221;
    wire [7:0] _3222;
    wire [7:0] _3223;
    wire [7:0] _3224;
    wire [7:0] _3217;
    wire [7:0] _3218;
    wire [7:0] _3219;
    wire [7:0] _3220;
    wire [7:0] _3225;
    wire [7:0] _177;
    reg [7:0] g_byte;
    wire _1939;
    wire _1936;
    wire _1937;
    wire _1940;
    wire [7:0] _3193;
    wire _3194;
    wire [7:0] _3202;
    wire _179;
    wire [7:0] _3203;
    wire _3204;
    wire [2:0] _3233;
    wire [5:0] _1764;
    wire _1765;
    wire _1766;
    wire [9:0] _1760;
    wire _1762;
    wire _1763;
    wire _1767;
    wire _1768;
    wire [2:0] _3234;
    wire [2:0] _3235;
    wire [2:0] _3236;
    wire [2:0] _3237;
    wire [2:0] _3227;
    wire [2:0] _3228;
    wire [2:0] _3229;
    wire [2:0] _3230;
    wire [2:0] _3231;
    wire [2:0] _3238;
    wire [2:0] _3240;
    wire [2:0] _180;
    reg [2:0] g_bitpos;
    reg _3212;
    wire _182;
    wire [31:0] _184;
    wire [30:0] _3282;
    wire [31:0] _3284;
    wire _3276;
    wire _3277;
    wire [31:0] _3279;
    wire [30:0] _3273;
    wire [31:0] _3275;
    wire [31:0] _3280;
    wire [31:0] _3281;
    wire [5:0] _186;
    wire [5:0] _3250;
    wire [5:0] _3251;
    wire [5:0] _3252;
    wire [5:0] _3253;
    wire [5:0] _3244;
    wire [5:0] _3245;
    wire [5:0] _3246;
    wire [5:0] _3247;
    wire [5:0] _3248;
    wire [5:0] _3254;
    wire [5:0] _3255;
    wire [5:0] _3257;
    wire [5:0] _187;
    reg [5:0] g_left;
    wire _1793;
    wire _1794;
    wire _2907;
    wire _2906;
    wire _2908;
    wire _2909;
    wire [31:0] _3285;
    wire [31:0] _3286;
    wire [31:0] _3287;
    wire [31:0] _189;
    wire _3264;
    wire _3265;
    wire [31:0] _3267;
    wire [30:0] _3261;
    wire [31:0] _3263;
    wire [31:0] _3268;
    wire [30:0] _3258;
    wire [31:0] _3260;
    wire [31:0] _3269;
    wire [31:0] _3270;
    wire [31:0] _3271;
    wire [31:0] _3272;
    wire [31:0] _3288;
    wire [31:0] _3289;
    wire [31:0] _3291;
    wire [31:0] _190;
    reg [31:0] g_crc;
    wire _2913;
    wire _2914;
    wire [7:0] _3307;
    wire [7:0] _3308;
    wire [7:0] _191;
    reg [7:0] g_lim;
    wire [15:0] _1756;
    wire [15:0] _193;
    wire [14:0] _2888;
    wire [15:0] _2889;
    wire [15:0] _3309;
    wire [15:0] _3310;
    wire [15:0] _3311;
    wire [15:0] _3313;
    wire [15:0] _194;
    reg [15:0] g_sr;
    wire [3:0] _3299;
    wire [3:0] _196;
    wire _3300;
    wire [3:0] _3301;
    wire [7:0] _3303;
    wire [5:0] _198;
    wire [7:0] _3297;
    wire [7:0] _3304;
    wire [15:0] _3305;
    wire _3306;
    wire _3332;
    wire [5:0] _200;
    wire [5:0] _3318;
    wire _3319;
    wire [9:0] _3314;
    wire _3316;
    wire _202;
    wire _3317;
    wire _3320;
    wire _3322;
    wire _3323;
    wire _3324;
    wire _3325;
    wire _3326;
    wire _3328;
    wire _3330;
    wire _203;
    reg g_len_cap;
    wire _3333;
    wire _3335;
    wire _204;
    reg g_len_known;
    wire [15:0] _1757;
    wire [15:0] _3355;
    wire _1745;
    wire _1759;
    wire [15:0] _3356;
    wire _1744;
    wire [15:0] _3357;
    wire _3338;
    wire _3336;
    wire _3337;
    wire _3339;
    wire _3341;
    wire _205;
    reg g_last;
    wire _1631;
    wire _1628;
    wire _1632;
    wire _3343;
    wire _3344;
    wire _3345;
    wire _3347;
    wire _206;
    reg g_prev;
    wire _1625;
    wire _1622;
    wire _1626;
    wire _1633;
    wire _1634;
    wire _1635;
    wire [15:0] _3358;
    wire [15:0] _3349;
    wire [15:0] _3350;
    wire [15:0] _3351;
    wire [15:0] _3352;
    wire [15:0] _3353;
    wire [15:0] _3359;
    wire [15:0] _3361;
    wire [15:0] _207;
    reg [15:0] g_cnt;
    wire g_data_left;
    wire _3213;
    wire _3214;
    wire _3367;
    wire _3365;
    wire _3366;
    wire _3368;
    wire [2:0] _3372;
    wire _3363;
    wire [2:0] _3377;
    wire [2:0] _3378;
    wire [2:0] _3379;
    wire [2:0] _3397;
    wire [2:0] _3399;
    wire [2:0] _208;
    reg [2:0] g_run;
    wire _1619;
    wire [1:0] _210;
    wire _1614;
    wire _1615;
    wire _1620;
    wire _1788;
    wire _1795;
    wire _3413;
    wire _3414;
    wire _1783;
    wire _1781;
    wire _1784;
    wire _1785;
    wire _1786;
    wire _3406;
    wire _3403;
    wire _3400;
    wire _3401;
    wire _3404;
    wire _3405;
    wire _3407;
    wire _3415;
    wire _3417;
    wire _3419;
    wire _3421;
    wire _3423;
    wire _211;
    reg f_lane1_out;
    wire _1603;
    wire _1604;
    wire _1597;
    wire _1598;
    wire _1594;
    wire _213;
    wire _1591;
    wire _1592;
    wire _1593;
    wire _1595;
    wire _1599;
    wire _1600;
    wire _1605;
    wire [1:0] _3488;
    wire _1586;
    wire _1587;
    reg _1583;
    wire _1584;
    wire _1576;
    wire _1575;
    wire _1574;
    wire _1573;
    wire _1572;
    wire _1571;
    wire _1570;
    wire _1569;
    wire [2:0] _215;
    reg _1577;
    reg _1580;
    wire _1585;
    wire _217;
    wire _1588;
    wire _1567;
    wire _1564;
    wire _1557;
    wire _1555;
    wire [13:0] _1546;
    wire [15:0] _1547;
    wire [14:0] _1543;
    wire [15:0] _1544;
    wire [15:0] _1548;
    wire [14:0] _1540;
    wire [15:0] _1541;
    wire _1538;
    wire [15:0] _1549;
    reg [15:0] _1552;
    wire _1553;
    wire [13:0] _1530;
    wire [15:0] _1531;
    reg [15:0] _1534;
    wire _3469;
    wire _3470;
    wire [15:0] _3471;
    wire [15:0] _3473;
    wire [15:0] _3475;
    wire _3453;
    wire [14:0] _1559;
    wire [15:0] _1560;
    reg [15:0] _1563;
    wire [16:0] _3449;
    wire _3450;
    wire [16:0] _3443;
    reg [16:0] _3446;
    wire [16:0] _3438;
    wire [15:0] _219;
    wire [16:0] _3437;
    wire [16:0] _3439;
    reg [16:0] _3442;
    wire [7:0] _221;
    wire [8:0] _3457;
    wire [7:0] _3459;
    wire [7:0] _3460;
    wire [7:0] _3461;
    wire [7:0] _3463;
    wire [7:0] _222;
    reg [7:0] _3431;
    wire [8:0] _3456;
    wire [8:0] _3458;
    wire _3464;
    wire _3465;
    wire _3466;
    wire _3468;
    wire _223;
    reg _3436;
    wire [16:0] _3447;
    wire [16:0] _3433;
    wire _3448;
    wire _3451;
    wire _3454;
    wire _3432;
    wire _3455;
    wire [15:0] _3477;
    wire _3427;
    wire _3425;
    wire _682;
    wire _3424;
    wire _3426;
    wire _3428;
    wire [15:0] _3478;
    wire [15:0] _3480;
    wire [15:0] _224;
    reg [15:0] _1528;
    wire _1535;
    wire _1536;
    wire _1525;
    wire _1537;
    wire _1554;
    wire _1556;
    wire _1565;
    wire [1:0] _226;
    wire _1521;
    wire _1522;
    wire _1519;
    wire _1523;
    wire _1516;
    reg _1513;
    wire _1506;
    wire _1505;
    wire _1504;
    wire _1503;
    wire _1502;
    wire _1501;
    wire _1500;
    wire _1499;
    wire [2:0] _228;
    reg _1507;
    reg _1510;
    wire _1514;
    wire _1515;
    wire _1517;
    wire _1524;
    wire _1568;
    wire _230;
    wire _1589;
    wire _232;
    wire _1498;
    wire _1590;
    wire [1:0] _3540;
    wire _1776;
    wire [1:0] _3542;
    wire _3242;
    wire [1:0] _3549;
    wire _1495;
    wire [1:0] _3555;
    wire _1492;
    wire _1493;
    wire [1:0] _3557;
    wire [1:0] _233;
    reg [1:0] g_mode;
    wire _1497;
    wire _1779;
    wire _1787;
    wire _1941;
    wire _1943;
    wire _1934;
    wire _1933;
    wire _1935;
    wire _1944;
    wire _1925;
    wire _1923;
    wire _1926;
    wire _3558;
    wire _3559;
    wire _234;
    wire _3561;
    wire [2:0] _3564;
    wire [2:0] _235;
    reg [2:0] _3031;
    reg [7:0] _3089;
    wire [7:0] _3091;
    wire [6:0] _3182;
    wire [7:0] _3183;
    wire [6:0] _3180;
    wire [7:0] _3181;
    wire [7:0] _3184;
    wire [7:0] _3569;
    wire [7:0] _3570;
    wire [7:0] _3571;
    wire [7:0] _3572;
    wire [7:0] _3565;
    wire [7:0] _3566;
    wire [7:0] _3567;
    wire [7:0] _3568;
    wire [7:0] _3573;
    wire [7:0] _236;
    reg [7:0] g_byte_0;
    wire _1931;
    wire _1928;
    wire _1929;
    wire _1932;
    wire [7:0] _3092;
    wire _3093;
    wire [7:0] _3101;
    wire _238;
    wire [7:0] _3102;
    wire _3103;
    wire [2:0] _3581;
    wire [2:0] _3582;
    wire [2:0] _3583;
    wire [2:0] _3584;
    wire [2:0] _3585;
    wire [2:0] _3575;
    wire [2:0] _3576;
    wire [2:0] _3577;
    wire [2:0] _3578;
    wire [2:0] _3579;
    wire [2:0] _3586;
    wire [2:0] _3588;
    wire [2:0] _239;
    reg [2:0] g_bitpos_0;
    reg _3111;
    wire _241;
    wire [31:0] _243;
    wire [30:0] _3630;
    wire [31:0] _3632;
    wire _3624;
    wire _3625;
    wire [31:0] _3627;
    wire [30:0] _3621;
    wire [31:0] _3623;
    wire [31:0] _3628;
    wire [31:0] _3629;
    wire [5:0] _245;
    wire [5:0] _3598;
    wire [5:0] _3599;
    wire [5:0] _3600;
    wire [5:0] _3601;
    wire [5:0] _3592;
    wire [5:0] _3593;
    wire [5:0] _3594;
    wire [5:0] _3595;
    wire [5:0] _3596;
    wire [5:0] _3602;
    wire [5:0] _3603;
    wire [5:0] _3605;
    wire [5:0] _246;
    reg [5:0] g_left_0;
    wire _1695;
    wire _1696;
    wire _2967;
    wire _2966;
    wire _2968;
    wire _2969;
    wire [31:0] _3633;
    wire [31:0] _3634;
    wire [31:0] _3635;
    wire [31:0] _248;
    wire _3612;
    wire _3613;
    wire [31:0] _3615;
    wire [30:0] _3609;
    wire [31:0] _3611;
    wire [31:0] _3616;
    wire [30:0] _3606;
    wire [31:0] _3608;
    wire [31:0] _3617;
    wire [31:0] _3618;
    wire [31:0] _3619;
    wire [31:0] _3620;
    wire [31:0] _3636;
    wire [31:0] _3637;
    wire [31:0] _3639;
    wire [31:0] _249;
    reg [31:0] g_crc_0;
    wire _2973;
    wire _2974;
    wire [7:0] _3655;
    wire [7:0] _3656;
    wire [7:0] _250;
    reg [7:0] g_lim_0;
    wire [15:0] _1658;
    wire [15:0] _252;
    wire [14:0] _2948;
    wire [15:0] _2949;
    wire [15:0] _3657;
    wire [15:0] _3658;
    wire [15:0] _3659;
    wire [15:0] _3661;
    wire [15:0] _253;
    reg [15:0] g_sr_0;
    wire [3:0] _3647;
    wire [3:0] _255;
    wire _3648;
    wire [3:0] _3649;
    wire [7:0] _3651;
    wire [5:0] _257;
    wire [7:0] _3645;
    wire [7:0] _3652;
    wire [15:0] _3653;
    wire _3654;
    wire _3680;
    wire [5:0] _259;
    wire [5:0] _3666;
    wire _3667;
    wire [9:0] _3662;
    wire _3664;
    wire _261;
    wire _3665;
    wire _3668;
    wire _3670;
    wire _3671;
    wire _3672;
    wire _3673;
    wire _3674;
    wire _3676;
    wire _3678;
    wire _262;
    reg g_len_cap_0;
    wire _3681;
    wire _3683;
    wire _263;
    reg g_len_known_0;
    wire [15:0] _1659;
    wire [15:0] _3703;
    wire [15:0] _3704;
    wire _1646;
    wire [15:0] _3705;
    wire _3686;
    wire _3684;
    wire _3685;
    wire _3687;
    wire _3689;
    wire _264;
    reg g_last_0;
    wire _1479;
    wire _1476;
    wire _1480;
    wire _3691;
    wire _3692;
    wire _3693;
    wire _3695;
    wire _265;
    reg g_prev_0;
    wire _1473;
    wire _1470;
    wire _1474;
    wire _1481;
    wire _1482;
    wire _1483;
    wire [15:0] _3706;
    wire [15:0] _3697;
    wire [15:0] _3698;
    wire [15:0] _3699;
    wire [15:0] _3700;
    wire [15:0] _3701;
    wire [15:0] _3707;
    wire [15:0] _3709;
    wire [15:0] _266;
    reg [15:0] g_cnt_0;
    wire g_data_left_0;
    wire _3112;
    wire _3113;
    wire _3715;
    wire _3713;
    wire _3714;
    wire _3716;
    wire [2:0] _3720;
    wire _3711;
    wire [2:0] _3725;
    wire [2:0] _3726;
    wire [2:0] _3727;
    wire [2:0] _3745;
    wire [2:0] _3747;
    wire [2:0] _267;
    reg [2:0] g_run_0;
    wire _1467;
    wire [1:0] _269;
    wire _1462;
    wire _1463;
    wire _1468;
    wire _1690;
    wire _1697;
    wire _3761;
    wire _1680;
    wire _1681;
    wire _1689;
    wire _3762;
    wire _1685;
    wire _1683;
    wire _1686;
    wire _1687;
    wire _1688;
    wire _3754;
    wire _3751;
    wire _3748;
    wire _3749;
    wire _3752;
    wire _3753;
    wire _3755;
    wire _3763;
    wire _3765;
    wire _3767;
    wire _3769;
    wire _3771;
    wire _270;
    reg f_lane0_out;
    wire _1451;
    wire _1452;
    wire _1434;
    wire _1435;
    reg _1431;
    wire _1432;
    wire _1424;
    wire _1423;
    wire _1422;
    wire _1421;
    wire _1420;
    wire _1419;
    wire _1418;
    wire _1417;
    wire [2:0] _272;
    reg _1425;
    reg _1428;
    wire _1433;
    wire _274;
    wire _1436;
    wire _1415;
    wire _1412;
    wire _1405;
    wire _1403;
    wire [13:0] _1394;
    wire [15:0] _1395;
    wire [14:0] _1391;
    wire [15:0] _1392;
    wire [15:0] _1396;
    wire [14:0] _1388;
    wire [15:0] _1389;
    wire _1386;
    wire [15:0] _1397;
    reg [15:0] _1400;
    wire _1401;
    wire [13:0] _1378;
    wire [15:0] _1379;
    reg [15:0] _1382;
    wire _3817;
    wire _3818;
    wire [15:0] _3819;
    wire [15:0] _3821;
    wire [15:0] _3823;
    wire _3801;
    wire [14:0] _1407;
    wire [15:0] _1408;
    reg [15:0] _1411;
    wire [16:0] _3797;
    wire _3798;
    wire [16:0] _3791;
    reg [16:0] _3794;
    wire [15:0] _276;
    wire [16:0] _3785;
    wire [16:0] _3787;
    reg [16:0] _3790;
    wire [7:0] _278;
    wire [8:0] _3805;
    wire [7:0] _3807;
    wire [7:0] _3808;
    wire [7:0] _3809;
    wire [7:0] _3811;
    wire [7:0] _279;
    reg [7:0] _3779;
    wire [8:0] _3804;
    wire [8:0] _3806;
    wire _3812;
    wire _3813;
    wire _3814;
    wire _3816;
    wire _280;
    reg _3784;
    wire [16:0] _3795;
    wire [16:0] _3781;
    wire _3796;
    wire _3799;
    wire _3802;
    wire _3780;
    wire _3803;
    wire [15:0] _3825;
    wire _3775;
    wire _3773;
    wire _668;
    wire _3772;
    wire _3774;
    wire _3776;
    wire [15:0] _3826;
    wire [15:0] _3828;
    wire [15:0] _281;
    reg [15:0] _1376;
    wire _1383;
    wire _1384;
    wire _1373;
    wire _1385;
    wire _1402;
    wire _1404;
    wire _1413;
    wire _1369;
    wire _1370;
    wire _1367;
    wire _1371;
    wire _1364;
    reg _1361;
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
    reg _1358;
    wire _1362;
    wire _1363;
    wire _1365;
    wire _1372;
    wire _1416;
    wire _1437;
    wire [1:0] _285;
    wire _1445;
    wire _1446;
    wire _287;
    wire _1442;
    wire _289;
    wire _291;
    wire _1439;
    wire _1440;
    wire _1441;
    wire _1443;
    wire _1447;
    wire _1448;
    wire _1453;
    wire [1:0] _3840;
    wire [1:0] _3892;
    wire _1678;
    wire [1:0] _3894;
    wire _3590;
    wire [1:0] _3901;
    wire _1343;
    wire [1:0] _3907;
    wire [2:0] _2609;
    wire [2:0] _2608;
    wire [2:0] _2607;
    wire [2:0] _2606;
    reg [2:0] _2610;
    wire _2602;
    wire _2601;
    wire _2600;
    wire _2599;
    reg _2603;
    wire _3829;
    wire _3830;
    wire [2:0] _3832;
    wire [2:0] _292;
    wire _1340;
    wire _1341;
    wire [1:0] _3909;
    wire [1:0] _293;
    reg [1:0] g_mode_0;
    wire _1345;
    wire _1346;
    wire _1438;
    wire _1647;
    wire _1661;
    wire _1670;
    wire _1676;
    wire _1712;
    wire _3009;
    wire _295;
    wire _3010;
    wire _296;
    wire _3037;
    wire _3039;
    wire _3910;
    wire [3:0] _3916;
    reg [3:0] _3919;
    wire [3:0] _297;
    wire _654;
    wire [7:0] _3921;
    wire [1:0] _1920;
    wire [1:0] _1918;
    wire [1:0] _1917;
    wire [1:0] _1916;
    wire [1:0] _1915;
    reg [1:0] _1919;
    wire [1:0] _1921;
    reg [7:0] _3933;
    wire [7:0] _3934;
    wire [7:0] _298;
    reg [7:0] _647;
    wire _648;
    wire [7:0] _3945;
    wire [7:0] _3944;
    wire [7:0] _3943;
    wire [1:0] _3940;
    wire [111:0] _767;
    wire [1:0] _3938;
    wire [111:0] _761;
    wire [1:0] _3937;
    wire [1:0] _3936;
    wire [1:0] _3935;
    reg [1:0] _3939;
    wire [1:0] _3941;
    reg [7:0] _3946;
    wire [7:0] _3947;
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
    wire [2:0] _3962;
    wire _3958;
    wire _3959;
    wire _3956;
    wire _3960;
    wire [2:0] _3963;
    wire _3953;
    wire _3954;
    wire _3952;
    wire _3955;
    wire [2:0] _3965;
    wire _3949;
    wire [2:0] _3951;
    wire _3948;
    wire [2:0] _3966;
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
    wire [2:0] _3981;
    wire _3977;
    wire _3978;
    wire _3975;
    wire _3979;
    wire [2:0] _3982;
    wire _3972;
    wire _3973;
    wire _3971;
    wire _3974;
    wire [2:0] _3984;
    wire _3968;
    wire [2:0] _3970;
    wire _3967;
    wire [2:0] _3985;
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
    wire [2:0] _4000;
    wire _3996;
    wire _3997;
    wire _3994;
    wire _3998;
    wire [2:0] _4001;
    wire _3991;
    wire _3992;
    wire _3990;
    wire _3993;
    wire [2:0] _4003;
    wire _3987;
    wire [2:0] _3989;
    wire _3986;
    wire [2:0] _4004;
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
    wire [2:0] _4019;
    wire _4015;
    wire _4016;
    wire _4013;
    wire _4017;
    wire [2:0] _4020;
    wire _4010;
    wire _4011;
    wire _4009;
    wire _4012;
    wire [2:0] _4022;
    wire _4006;
    wire [2:0] _4008;
    wire _4005;
    wire [2:0] _4023;
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
    wire [2:0] _4038;
    wire _4034;
    wire _4035;
    wire _4032;
    wire _4036;
    wire [2:0] _4039;
    wire _4029;
    wire _4030;
    wire _4028;
    wire _4031;
    wire [2:0] _4041;
    wire _4025;
    wire [2:0] _4027;
    wire _4024;
    wire [2:0] _4042;
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
    wire [2:0] _4057;
    wire _4053;
    wire _4054;
    wire _4051;
    wire _4055;
    wire [2:0] _4058;
    wire _4048;
    wire _4049;
    wire _4047;
    wire _4050;
    wire [2:0] _4060;
    wire _4044;
    wire [2:0] _4046;
    wire _4043;
    wire [2:0] _4061;
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
    wire [2:0] _4076;
    wire _4072;
    wire _4073;
    wire _4070;
    wire _4074;
    wire [2:0] _4077;
    wire _4067;
    wire _4068;
    wire _4066;
    wire _4069;
    wire [2:0] _4079;
    wire _4063;
    wire [2:0] _4065;
    wire _4062;
    wire [2:0] _4080;
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
    wire [2:0] _4095;
    wire _4091;
    wire _4092;
    wire _4089;
    wire _4093;
    wire [2:0] _4096;
    wire _4086;
    wire _4087;
    wire _4085;
    wire _4088;
    wire [2:0] _4098;
    wire _4082;
    wire [2:0] _4084;
    wire _4081;
    wire [2:0] _4099;
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
    wire _4102;
    wire [127:0] _4103;
    wire _4100;
    wire [127:0] _4104;
    wire [127:0] _308;
    reg [127:0] _356;
    wire _423;
    wire _424;
    wire [127:0] _425;
    wire _4107;
    wire [127:0] _4108;
    wire _4105;
    wire [127:0] _4109;
    wire [127:0] _309;
    reg [127:0] _353;
    wire _419;
    wire _420;
    wire [127:0] _421;
    wire _4112;
    wire [127:0] _4113;
    wire _4110;
    wire [127:0] _4114;
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
    wire [15:0] _4142;
    wire _4138;
    wire _4139;
    wire _4140;
    wire [15:0] _4143;
    wire _4122;
    wire _4123;
    wire [15:0] _4145;
    wire [15:0] _4147;
    wire [15:0] _313;
    reg [15:0] _399;
    wire [15:0] _4159;
    wire _4155;
    wire _4156;
    wire [8:0] _4134;
    wire _4135;
    wire [5:0] _4132;
    wire [5:0] _4131;
    wire _4133;
    wire [8:0] _4126;
    wire [8:0] _4148;
    wire [8:0] _4149;
    wire [8:0] _4151;
    wire [8:0] _314;
    reg [8:0] _4127;
    wire [2:0] _4128;
    wire _4130;
    wire [1:0] _4124;
    reg _4136;
    wire _4157;
    wire [15:0] _4160;
    wire _4152;
    wire _4153;
    wire [15:0] _4162;
    wire [15:0] _4164;
    wire [15:0] _315;
    reg [15:0] _396;
    wire [1:0] _799;
    reg [15:0] _800;
    wire _802;
    wire _870;
    reg [7:0] _381;
    wire [7:0] f_chg_now;
    wire _4166;
    wire [7:0] _4168;
    wire _4165;
    wire [7:0] _4169;
    wire [7:0] _4171;
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
    reg [2:0] _4119;
    wire [2:0] _4121;
    wire _4172;
    wire _1847;
    wire f_in_fetch;
    wire _1848;
    wire _1849;
    wire _4173;
    wire [15:0] _4182;
    wire [15:0] _4184;
    wire [15:0] _323;
    reg [15:0] _393;
    wire [1:0] _2065;
    reg [15:0] _2066;
    wire [15:0] _2064;
    wire _2067;
    wire [63:0] _750;
    wire _2062;
    wire _2060;
    wire _2061;
    wire _2063;
    wire _2068;
    wire _2073;
    wire _2081;
    wire f_viol_now;
    wire [2:0] _4190;
    wire [2:0] _4193;
    wire _4186;
    wire [2:0] _4194;
    wire _4185;
    wire [2:0] _4197;
    wire [2:0] _4199;
    wire [2:0] _324;
    reg [2:0] _409;
    wire _4202;
    wire [127:0] _4203;
    wire _4200;
    wire [127:0] _4204;
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
    wire [1:0] _4223;
    wire _4208;
    wire [1:0] _4210;
    wire _4206;
    wire [1:0] _4224;
    wire _4205;
    wire [1:0] _4227;
    wire _327;
    wire [1:0] _4229;
    wire [1:0] _4231;
    wire [1:0] _328;
    reg [1:0] _342;
    wire _1304;
    wire _330;
    wire _2716;
    wire _2718;
    wire _4233;
    wire _4243;
    wire _331;
    reg f_sweeping;
    wire _4255;
    wire _332;
    reg f_image_valid;
    wire _334;
    wire _2017;
    wire [7:0] _4279;
    wire [7:0] _335;
    reg [7:0] f_pout;
    wire _2641;
    wire [23:0] _337;
    wire [2:0] _2637;
    reg _2648;
    wire [7:0] _2712;
    wire [7:0] _4281;
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
    assign _1484 = 3'b001;
    assign _1485 = _1483 ? _1484 : _1460;
    assign _1457 = 3'b010;
    assign _1459 = f_lane0_out ? _1327 : _1457;
    assign _1460 = _1453 ? _1459 : _1456;
    assign _1486 = _1438 ? _1485 : _1460;
    assign _1488 = _1343 ? _1130 : _1486;
    assign _1490 = _1341 ? _1130 : _1488;
    assign _24 = _1490;
    always @(posedge _320) begin
        if (_318)
            _1456 <= _1130;
        else
            _1456 <= _24;
    end
    assign _1644 = { _668,
                     _671,
                     _674,
                     _677,
                     gnd,
                     _1456 };
    assign _1637 = _1635 ? _1484 : _1612;
    assign _1611 = f_lane1_out ? _1327 : _1457;
    assign _1612 = _1605 ? _1611 : _1608;
    assign _1638 = _1590 ? _1637 : _1612;
    assign _1640 = _1495 ? _1130 : _1638;
    assign _1642 = _1493 ? _1130 : _1640;
    assign _25 = _1642;
    always @(posedge _320) begin
        if (_318)
            _1608 <= _1130;
        else
            _1608 <= _25;
    end
    assign _1643 = { _682,
                     _685,
                     _688,
                     _691,
                     gnd,
                     _1608 };
    assign _1645 = { _1643,
                     _1644 };
    assign _1736 = 8'b00000001;
    assign _1737 = _1731 + _1736;
    assign _1733 = _1731 == _1277;
    assign _1734 = ~ _1733;
    assign _1726 = ~ _1676;
    assign _1723 = _1705 == _1130;
    assign _1724 = ~ _1723;
    assign _1720 = _1345 | _668;
    assign _1717 = ~ _1678;
    assign _1718 = _1341 & _1717;
    assign _1719 = _1718 & _291;
    assign _1721 = _1719 & _1720;
    assign _1725 = _1721 & _1724;
    assign _1727 = _1725 & _1726;
    assign _1716 = _1712 & _1715;
    assign _1728 = _1716 | _1727;
    assign _1735 = _1728 & _1734;
    assign _1738 = _1735 ? _1737 : _1731;
    assign _1740 = _32 ? _1279 : _1738;
    assign _27 = _1740;
    always @(posedge _320) begin
        if (_318)
            _1731 <= _1279;
        else
            _1731 <= _27;
    end
    assign _1839 = _1833 + _1736;
    assign _1835 = _1833 == _1277;
    assign _1836 = ~ _1835;
    assign _1828 = ~ _1774;
    assign _1825 = _1803 == _1130;
    assign _1826 = ~ _1825;
    assign _1822 = _1497 | _682;
    assign _1819 = ~ _1776;
    assign _1820 = _1493 & _1819;
    assign _1821 = _1820 & _232;
    assign _1823 = _1821 & _1822;
    assign _1827 = _1823 & _1826;
    assign _1829 = _1827 & _1828;
    assign _1715 = _295 ? _1714 : _656;
    assign _1817 = _1814 & _1715;
    assign _1818 = _1816 | _1817;
    assign _1830 = _1818 | _1829;
    assign _1837 = _1830 & _1836;
    assign _1840 = _1837 ? _1839 : _1833;
    assign _1842 = _32 ? _1279 : _1840;
    assign _28 = _1842;
    always @(posedge _320) begin
        if (_318)
            _1833 <= _1279;
        else
            _1833 <= _28;
    end
    assign _1879 = _1873 + _1736;
    assign _1875 = _1873 == _1277;
    assign _1876 = ~ _1875;
    assign _1869 = _1866 & _656;
    assign _1870 = _1868 | _1869;
    assign _1877 = _1870 & _1876;
    assign _1880 = _1877 ? _1879 : _1873;
    assign _1882 = _32 ? _1279 : _1880;
    assign _29 = _1882;
    always @(posedge _320) begin
        if (_318)
            _1873 <= _1279;
        else
            _1873 <= _29;
    end
    assign _1894 = _1888 + _1736;
    assign _1890 = _1888 == _1277;
    assign _1891 = ~ _1890;
    assign _1892 = _1885 & _1891;
    assign _1895 = _1892 ? _1894 : _1888;
    assign _1897 = _32 ? _1279 : _1895;
    assign _30 = _1897;
    always @(posedge _320) begin
        if (_318)
            _1888 <= _1279;
        else
            _1888 <= _30;
    end
    assign _1910 = _1904 + _1736;
    assign _1906 = _1904 == _1277;
    assign _1907 = ~ _1906;
    assign _1908 = _1901 & _1907;
    assign _1911 = _1908 ? _1910 : _1904;
    assign _32 = host_drop_clear;
    assign _1913 = _32 ? _1279 : _1911;
    assign _33 = _1913;
    always @(posedge _320) begin
        if (_318)
            _1904 <= _1279;
        else
            _1904 <= _33;
    end
    assign _1914 = { _1904,
                     _1888,
                     _1873,
                     _1833,
                     _1731 };
    assign _1949 = 1'b1;
    assign _1927 = _1849 & _1926;
    assign _1945 = _1927 & _1944;
    assign _1950 = _1945 ? _1949 : _1948;
    assign _1952 = _50 ? _1122 : _1950;
    assign _35 = _1952;
    always @(posedge _320) begin
        if (_318)
            _1948 <= _1122;
        else
            _1948 <= _35;
    end
    assign _1958 = { _1956,
                     _1957 };
    assign _2008 = _2004 ? _1996 : _2007;
    assign _2010 = _50 ? _1130 : _2008;
    assign _40 = _2010;
    always @(posedge _320) begin
        if (_318)
            _2007 <= _1130;
        else
            _2007 <= _40;
    end
    assign _2003 = ~ _2002;
    assign _1993 = _1960 ? _1484 : _1457;
    assign _1989 = 3'b011;
    assign _1990 = _1973 ? _1989 : _1327;
    assign _1994 = _1968 ? _1993 : _1990;
    assign _1986 = 3'b101;
    assign _1985 = 3'b110;
    assign _1987 = _1980 ? _1986 : _1985;
    assign _1995 = _1977 ? _1994 : _1987;
    assign _1981 = _160 & _295;
    assign _1978 = _124 | _48;
    assign _1979 = _1978 | _46;
    assign _1980 = f_sweeping & _1979;
    assign _1982 = _1980 | _1981;
    assign _1974 = ~ f_image_valid;
    assign _1975 = _334 & _1974;
    assign _1956 = _1519 | _1497;
    assign _1971 = _43[1:1];
    assign _1972 = _1971 & _1956;
    assign _1957 = _1367 | _1345;
    assign _43 = host_lane_we;
    assign _1969 = _43[0:0];
    assign _1970 = _1969 & _1957;
    assign _1973 = _1970 | _1972;
    assign _1976 = _1973 | _1975;
    assign _44 = _1250;
    always @(posedge _320) begin
        if (_318)
            _1263 <= _1122;
        else
            _1263 <= _44;
    end
    assign _1965 = _1250 | _1263;
    assign _1964 = _48 & _1304;
    assign _1966 = _1964 & _1965;
    assign _1962 = ~ _1304;
    assign _46 = host_cov_re;
    assign _48 = host_cov_we;
    assign _1961 = _48 | _46;
    assign _1963 = _1961 & _1962;
    assign _1967 = _1963 | _1966;
    assign _1959 = ~ _1304;
    assign _1960 = _124 & _1959;
    assign _1968 = _1960 | _1967;
    assign _1977 = _1968 | _1976;
    assign _1983 = _1977 | _1982;
    assign _1996 = _1983 ? _1995 : _1130;
    assign _1998 = _1996 == _1130;
    assign _1999 = ~ _1998;
    assign _2004 = _1999 & _2003;
    assign _2012 = _2004 ? _1949 : _2002;
    assign _50 = host_err_clear;
    assign _2014 = _50 ? _1122 : _2012;
    assign _51 = _2014;
    always @(posedge _320) begin
        if (_318)
            _2002 <= _1122;
        else
            _2002 <= _51;
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
    assign _1899 = _1255 == _1258;
    assign _1900 = ~ _1899;
    assign _2015 = ~ _1250;
    assign _2016 = _1247 & _2015;
    assign _54 = _2016;
    always @(posedge _320) begin
        if (_318)
            _1250 <= _1122;
        else
            _1250 <= _54;
    end
    assign _56 = host_cover_en;
    assign _1247 = _1246 & _56;
    assign _1898 = _1247 & _1250;
    assign _1901 = _1898 & _1900;
    assign _2022 = _1901 ? _1949 : _2020;
    assign _2024 = _2017 ? _1122 : _2022;
    assign _57 = _2024;
    always @(posedge _320) begin
        if (_318)
            _2020 <= _1122;
        else
            _2020 <= _57;
    end
    assign _1885 = _91 & _1884;
    assign _2029 = _1885 ? _1949 : _2027;
    assign _2031 = _2017 ? _1122 : _2029;
    assign _59 = _2031;
    always @(posedge _320) begin
        if (_318)
            _2027 <= _1122;
        else
            _2027 <= _59;
    end
    assign _2035 = _296 & _1714;
    assign _1867 = ~ _1866;
    assign _1860 = _1845 & _1859;
    assign _1868 = _1860 & _1867;
    assign _1815 = ~ _1814;
    assign _1811 = _1743 & _1810;
    assign _1816 = _1811 & _1815;
    assign _2032 = _1816 | _1868;
    assign _61 = _2032;
    assign _2033 = f_rx_push & _656;
    assign _2034 = _2033 | _61;
    assign _2036 = _2034 | _2035;
    assign _2041 = _2036 ? _1949 : _2039;
    assign _2043 = _2017 ? _1122 : _2041;
    assign _62 = _2043;
    always @(posedge _320) begin
        if (_318)
            _2039 <= _1122;
        else
            _2039 <= _62;
    end
    assign _2047 = _750[61:61];
    assign _2048 = _1848 & _2047;
    assign _2053 = _2048 ? _1949 : _2051;
    assign _66 = host_irq_ack;
    assign _2055 = _66 ? _1122 : _2053;
    assign _2057 = _2017 ? _1122 : _2055;
    assign _67 = _2057;
    always @(posedge _320) begin
        if (_318)
            _2051 <= _1122;
        else
            _2051 <= _67;
    end
    assign _2086 = f_policy == _2085;
    assign _2088 = _2086 ? _1949 : _2046;
    assign _2084 = f_policy == _2559;
    assign _2090 = _2084 ? _1949 : _2088;
    assign _2091 = f_viol_now ? _2090 : _2046;
    assign _2092 = _1246 ? _2046 : _2091;
    assign _2059 = _342 == _1271;
    assign _2093 = _2059 ? _2092 : _2046;
    assign _2095 = _2017 ? _1122 : _2093;
    assign _68 = _2095;
    always @(posedge _320) begin
        if (_318)
            _2046 <= _1122;
        else
            _2046 <= _68;
    end
    assign _2110 = ~ _2109;
    assign _70 = host_tx_wm;
    assign _2103 = { gnd,
                     _70 };
    assign _2104 = _2103 < _297;
    assign _2105 = ~ _2104;
    assign _72 = host_tx_wm_en;
    assign _2106 = _72 & _2105;
    assign _74 = host_rx_wm;
    assign _2097 = _74 == _1130;
    assign _2099 = _2097 ? _1484 : _74;
    assign _2100 = { gnd,
                     _2099 };
    assign _2101 = _158 < _2100;
    assign _2102 = ~ _2101;
    assign _2107 = _2102 | _2106;
    assign _2111 = _2107 | _2110;
    assign _2112 = _2111 | _2046;
    assign _2113 = _2112 | _2051;
    assign _77 = ram_cov_rdata;
    assign _2116 = 32'b00000000000000000000000000000000;
    assign _2114 = ~ f_sweeping;
    assign _2115 = _1304 & _2114;
    assign _2117 = _2115 ? _77 : _2116;
    assign _2484 = 3'b111;
    assign _2485 = _2122 == _2484;
    assign _2486 = _2119 & _2485;
    assign _2483 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _320) begin
        if (_318)
            _2487 <= _2483;
        else
            if (_2486)
                _2487 <= _90;
    end
    assign _2479 = _2122 == _1985;
    assign _2480 = _2119 & _2479;
    always @(posedge _320) begin
        if (_318)
            _2481 <= _2483;
        else
            if (_2480)
                _2481 <= _90;
    end
    assign _2473 = _2122 == _1986;
    assign _2474 = _2119 & _2473;
    always @(posedge _320) begin
        if (_318)
            _2475 <= _2483;
        else
            if (_2474)
                _2475 <= _90;
    end
    assign _2467 = _2122 == _1327;
    assign _2468 = _2119 & _2467;
    always @(posedge _320) begin
        if (_318)
            _2469 <= _2483;
        else
            if (_2468)
                _2469 <= _90;
    end
    assign _2461 = _2122 == _1989;
    assign _2462 = _2119 & _2461;
    always @(posedge _320) begin
        if (_318)
            _2463 <= _2483;
        else
            if (_2462)
                _2463 <= _90;
    end
    assign _2455 = _2122 == _1457;
    assign _2456 = _2119 & _2455;
    always @(posedge _320) begin
        if (_318)
            _2457 <= _2483;
        else
            if (_2456)
                _2457 <= _90;
    end
    assign _2449 = _2122 == _1484;
    assign _2450 = _2119 & _2449;
    always @(posedge _320) begin
        if (_318)
            _2451 <= _2483;
        else
            if (_2450)
                _2451 <= _90;
    end
    assign _2124 = _2122 + _1484;
    assign _2125 = _2119 ? _2124 : _2122;
    assign _80 = _2125;
    always @(posedge _320) begin
        if (_318)
            _2122 <= _1130;
        else
            _2122 <= _80;
    end
    assign _2443 = _2122 == _1130;
    assign _2444 = _2119 & _2443;
    assign _2416 = _2307 - _2412;
    assign _2133 = 29'b11111111111111111111111111111;
    assign _2132 = 29'b00000000000000000000000000000;
    assign _2135 = 29'b00000000000000000000000000001;
    assign _2136 = ts_hi_m1 + _2135;
    assign _2129 = ts_reg[2:0];
    assign _2131 = _2129 == _2484;
    assign _2137 = _2131 ? _2136 : ts_hi_m1;
    assign _81 = _2137;
    always @(posedge _320) begin
        if (_318)
            ts_hi_m1 <= _2133;
        else
            ts_hi_m1 <= _81;
    end
    assign _2414 = ts_reg[31:3];
    assign _2155 = _2142 + _1484;
    assign _2151 = _2142 == _2484;
    assign _2152 = ~ _2151;
    assign _2149 = _743[0:0];
    assign _2153 = _2149 & _2152;
    assign _2156 = _2153 ? _2155 : _2142;
    assign _2146 = _743[0:0];
    assign _2147 = ~ _2146;
    assign _2144 = _378[0:0];
    assign _2143 = f_chg_now[0:0];
    assign _2145 = _2143 & _2144;
    assign _2148 = _2145 & _2147;
    assign _2158 = _2148 ? _1484 : _2156;
    assign _2139 = _342 == _1270;
    assign _2159 = _2139 ? _2158 : _2142;
    assign _82 = _2159;
    always @(posedge _320) begin
        if (_318)
            _2142 <= _1130;
        else
            _2142 <= _82;
    end
    assign _2405 = _743[0:0];
    assign _2407 = _2405 ? _2142 : _1130;
    assign _2176 = _2163 + _1484;
    assign _2172 = _2163 == _2484;
    assign _2173 = ~ _2172;
    assign _2170 = _743[1:1];
    assign _2174 = _2170 & _2173;
    assign _2177 = _2174 ? _2176 : _2163;
    assign _2167 = _743[1:1];
    assign _2168 = ~ _2167;
    assign _2165 = _378[1:1];
    assign _2164 = f_chg_now[1:1];
    assign _2166 = _2164 & _2165;
    assign _2169 = _2166 & _2168;
    assign _2179 = _2169 ? _1484 : _2177;
    assign _2160 = _342 == _1270;
    assign _2180 = _2160 ? _2179 : _2163;
    assign _83 = _2180;
    always @(posedge _320) begin
        if (_318)
            _2163 <= _1130;
        else
            _2163 <= _83;
    end
    assign _2402 = _743[1:1];
    assign _2404 = _2402 ? _2163 : _1130;
    assign _2408 = _2364 ? _2407 : _2404;
    assign _2197 = _2184 + _1484;
    assign _2193 = _2184 == _2484;
    assign _2194 = ~ _2193;
    assign _2191 = _743[2:2];
    assign _2195 = _2191 & _2194;
    assign _2198 = _2195 ? _2197 : _2184;
    assign _2188 = _743[2:2];
    assign _2189 = ~ _2188;
    assign _2186 = _378[2:2];
    assign _2185 = f_chg_now[2:2];
    assign _2187 = _2185 & _2186;
    assign _2190 = _2187 & _2189;
    assign _2200 = _2190 ? _1484 : _2198;
    assign _2181 = _342 == _1270;
    assign _2201 = _2181 ? _2200 : _2184;
    assign _84 = _2201;
    always @(posedge _320) begin
        if (_318)
            _2184 <= _1130;
        else
            _2184 <= _84;
    end
    assign _2398 = _743[2:2];
    assign _2400 = _2398 ? _2184 : _1130;
    assign _2218 = _2205 + _1484;
    assign _2214 = _2205 == _2484;
    assign _2215 = ~ _2214;
    assign _2212 = _743[3:3];
    assign _2216 = _2212 & _2215;
    assign _2219 = _2216 ? _2218 : _2205;
    assign _2209 = _743[3:3];
    assign _2210 = ~ _2209;
    assign _2207 = _378[3:3];
    assign _2206 = f_chg_now[3:3];
    assign _2208 = _2206 & _2207;
    assign _2211 = _2208 & _2210;
    assign _2221 = _2211 ? _1484 : _2219;
    assign _2202 = _342 == _1270;
    assign _2222 = _2202 ? _2221 : _2205;
    assign _85 = _2222;
    always @(posedge _320) begin
        if (_318)
            _2205 <= _1130;
        else
            _2205 <= _85;
    end
    assign _2395 = _743[3:3];
    assign _2397 = _2395 ? _2205 : _1130;
    assign _2401 = _2367 ? _2400 : _2397;
    assign _2409 = _2366 ? _2408 : _2401;
    assign _2239 = _2226 + _1484;
    assign _2235 = _2226 == _2484;
    assign _2236 = ~ _2235;
    assign _2233 = _743[4:4];
    assign _2237 = _2233 & _2236;
    assign _2240 = _2237 ? _2239 : _2226;
    assign _2230 = _743[4:4];
    assign _2231 = ~ _2230;
    assign _2228 = _378[4:4];
    assign _2227 = f_chg_now[4:4];
    assign _2229 = _2227 & _2228;
    assign _2232 = _2229 & _2231;
    assign _2242 = _2232 ? _1484 : _2240;
    assign _2223 = _342 == _1270;
    assign _2243 = _2223 ? _2242 : _2226;
    assign _86 = _2243;
    always @(posedge _320) begin
        if (_318)
            _2226 <= _1130;
        else
            _2226 <= _86;
    end
    assign _2390 = _743[4:4];
    assign _2392 = _2390 ? _2226 : _1130;
    assign _2260 = _2247 + _1484;
    assign _2256 = _2247 == _2484;
    assign _2257 = ~ _2256;
    assign _2254 = _743[5:5];
    assign _2258 = _2254 & _2257;
    assign _2261 = _2258 ? _2260 : _2247;
    assign _2251 = _743[5:5];
    assign _2252 = ~ _2251;
    assign _2249 = _378[5:5];
    assign _2248 = f_chg_now[5:5];
    assign _2250 = _2248 & _2249;
    assign _2253 = _2250 & _2252;
    assign _2263 = _2253 ? _1484 : _2261;
    assign _2244 = _342 == _1270;
    assign _2264 = _2244 ? _2263 : _2247;
    assign _87 = _2264;
    always @(posedge _320) begin
        if (_318)
            _2247 <= _1130;
        else
            _2247 <= _87;
    end
    assign _2387 = _743[5:5];
    assign _2389 = _2387 ? _2247 : _1130;
    assign _2393 = _2371 ? _2392 : _2389;
    assign _2281 = _2268 + _1484;
    assign _2277 = _2268 == _2484;
    assign _2278 = ~ _2277;
    assign _2275 = _743[6:6];
    assign _2279 = _2275 & _2278;
    assign _2282 = _2279 ? _2281 : _2268;
    assign _2272 = _743[6:6];
    assign _2273 = ~ _2272;
    assign _2270 = _378[6:6];
    assign _2269 = f_chg_now[6:6];
    assign _2271 = _2269 & _2270;
    assign _2274 = _2271 & _2273;
    assign _2284 = _2274 ? _1484 : _2282;
    assign _2265 = _342 == _1270;
    assign _2285 = _2265 ? _2284 : _2268;
    assign _88 = _2285;
    always @(posedge _320) begin
        if (_318)
            _2268 <= _1130;
        else
            _2268 <= _88;
    end
    assign _2383 = _743[6:6];
    assign _2385 = _2383 ? _2268 : _1130;
    assign _2302 = _2289 + _1484;
    assign _2298 = _2289 == _2484;
    assign _2299 = ~ _2298;
    assign _2296 = _743[7:7];
    assign _2300 = _2296 & _2299;
    assign _2303 = _2300 ? _2302 : _2289;
    assign _2293 = _743[7:7];
    assign _2294 = ~ _2293;
    assign _2291 = _378[7:7];
    assign _2290 = f_chg_now[7:7];
    assign _2292 = _2290 & _2291;
    assign _2295 = _2292 & _2294;
    assign _2305 = _2295 ? _1484 : _2303;
    assign _2286 = _342 == _1270;
    assign _2306 = _2286 ? _2305 : _2289;
    assign _89 = _2306;
    always @(posedge _320) begin
        if (_318)
            _2289 <= _1130;
        else
            _2289 <= _89;
    end
    assign _2380 = _743[7:7];
    assign _2382 = _2380 ? _2289 : _1130;
    assign _2386 = _2374 ? _2385 : _2382;
    assign _2394 = _2373 ? _2393 : _2386;
    assign _2410 = _2370 ? _2409 : _2394;
    assign _2375 = _773[7:7];
    assign _2374 = _773[6:6];
    assign _2376 = _2374 | _2375;
    assign _2372 = _773[5:5];
    assign _2371 = _773[4:4];
    assign _2373 = _2371 | _2372;
    assign _2377 = _2373 | _2376;
    assign _2368 = _773[3:3];
    assign _2367 = _773[2:2];
    assign _2369 = _2367 | _2368;
    assign _2365 = _773[1:1];
    assign _2364 = _773[0:0];
    assign _2366 = _2364 | _2365;
    assign _2370 = _2366 | _2369;
    assign _2378 = _2370 | _2377;
    assign _2411 = _2378 ? _2410 : _1130;
    assign _2353 = f_watch[0:0];
    assign _2352 = _378[0:0];
    assign _2354 = _2352 & _2353;
    assign _2356 = _2354 ? _598 : _1130;
    assign _2348 = f_watch[1:1];
    assign _2347 = _378[1:1];
    assign _2349 = _2347 & _2348;
    assign _2351 = _2349 ? _577 : _1130;
    assign _2357 = _2351 < _2356;
    assign _2358 = _2357 ? _2356 : _2351;
    assign _2341 = f_watch[2:2];
    assign _2340 = _378[2:2];
    assign _2342 = _2340 & _2341;
    assign _2344 = _2342 ? _554 : _1130;
    assign _2336 = f_watch[3:3];
    assign _2335 = _378[3:3];
    assign _2337 = _2335 & _2336;
    assign _2339 = _2337 ? _533 : _1130;
    assign _2345 = _2339 < _2344;
    assign _2346 = _2345 ? _2344 : _2339;
    assign _2359 = _2346 < _2358;
    assign _2360 = _2359 ? _2358 : _2346;
    assign _2327 = f_watch[4:4];
    assign _2326 = _378[4:4];
    assign _2328 = _2326 & _2327;
    assign _2330 = _2328 ? _508 : _1130;
    assign _2322 = f_watch[5:5];
    assign _2321 = _378[5:5];
    assign _2323 = _2321 & _2322;
    assign _2325 = _2323 ? _487 : _1130;
    assign _2331 = _2325 < _2330;
    assign _2332 = _2331 ? _2330 : _2325;
    assign _2315 = f_watch[6:6];
    assign _2314 = _378[6:6];
    assign _2316 = _2314 & _2315;
    assign _2318 = _2316 ? _464 : _1130;
    assign _2310 = f_watch[7:7];
    assign _2309 = _378[7:7];
    assign _2311 = _2309 & _2310;
    assign _2313 = _2311 ? _443 : _1130;
    assign _2319 = _2313 < _2318;
    assign _2320 = _2319 ? _2318 : _2313;
    assign _2333 = _2320 < _2332;
    assign _2334 = _2333 ? _2332 : _2320;
    assign _2361 = _2334 < _2360;
    assign _2362 = _2361 ? _2360 : _2334;
    assign _2363 = f_unexp_now ? _2362 : _1130;
    assign _2412 = f_amb_now ? _2411 : _2363;
    assign _2307 = ts_reg[2:0];
    assign _2413 = _2307 < _2412;
    assign _2415 = _2413 ? ts_hi_m1 : _2414;
    assign _2417 = { _2415,
                     _2416 };
    assign _2421 = { _2417,
                     _1254,
                     _2420,
                     _365 };
    assign _90 = _2421;
    always @(posedge _320) begin
        if (_318)
            _2445 <= _2483;
        else
            if (_2444)
                _2445 <= _90;
    end
    assign _2438 = _2436 + _1484;
    assign _2108 = 4'b0000;
    assign _2427 = 4'b0001;
    assign _2428 = _92 + _2427;
    assign _2426 = _92 - _2427;
    assign _2429 = _2119 ? _2428 : _2426;
    assign _1883 = 4'b1000;
    assign _1884 = _92 == _1883;
    assign _2118 = ~ _1884;
    assign _91 = f_viol_now;
    assign _2119 = _91 & _2118;
    assign _2424 = _2119 ^ _2423;
    assign _2430 = _2424 ? _2429 : _92;
    always @(posedge _320) begin
        if (_318)
            _2433 <= _2108;
        else
            _2433 <= _2430;
    end
    assign _92 = _2433;
    assign _2109 = _92 == _2108;
    assign _2422 = ~ _2109;
    assign _94 = host_vlog_pop;
    assign _2423 = _94 & _2422;
    assign _2439 = _2423 ? _2438 : _2436;
    assign _95 = _2439;
    always @(posedge _320) begin
        if (_318)
            _2436 <= _1130;
        else
            _2436 <= _95;
    end
    always @* begin
        case (_2436)
        0:
            _2488 <= _2445;
        1:
            _2488 <= _2451;
        2:
            _2488 <= _2457;
        3:
            _2488 <= _2463;
        4:
            _2488 <= _2469;
        5:
            _2488 <= _2475;
        6:
            _2488 <= _2481;
        default:
            _2488 <= _2487;
        endcase
    end
    assign _2552 = _2495 == _2484;
    assign _2553 = _2492 & _2552;
    always @(posedge _320) begin
        if (_318)
            _2554 <= _1279;
        else
            if (_2553)
                _2554 <= _170;
    end
    assign _2546 = _2495 == _1985;
    assign _2547 = _2492 & _2546;
    always @(posedge _320) begin
        if (_318)
            _2548 <= _1279;
        else
            if (_2547)
                _2548 <= _170;
    end
    assign _2540 = _2495 == _1986;
    assign _2541 = _2492 & _2540;
    always @(posedge _320) begin
        if (_318)
            _2542 <= _1279;
        else
            if (_2541)
                _2542 <= _170;
    end
    assign _2534 = _2495 == _1327;
    assign _2535 = _2492 & _2534;
    always @(posedge _320) begin
        if (_318)
            _2536 <= _1279;
        else
            if (_2535)
                _2536 <= _170;
    end
    assign _2528 = _2495 == _1989;
    assign _2529 = _2492 & _2528;
    always @(posedge _320) begin
        if (_318)
            _2530 <= _1279;
        else
            if (_2529)
                _2530 <= _170;
    end
    assign _2522 = _2495 == _1457;
    assign _2523 = _2492 & _2522;
    always @(posedge _320) begin
        if (_318)
            _2524 <= _1279;
        else
            if (_2523)
                _2524 <= _170;
    end
    assign _2516 = _2495 == _1484;
    assign _2517 = _2492 & _2516;
    always @(posedge _320) begin
        if (_318)
            _2518 <= _1279;
        else
            if (_2517)
                _2518 <= _170;
    end
    assign _2497 = _2495 + _1484;
    assign _2498 = _2492 ? _2497 : _2495;
    assign _98 = _2498;
    always @(posedge _320) begin
        if (_318)
            _2495 <= _1130;
        else
            _2495 <= _98;
    end
    assign _2510 = _2495 == _1130;
    assign _2511 = _2492 & _2510;
    always @(posedge _320) begin
        if (_318)
            _2512 <= _1279;
        else
            if (_2511)
                _2512 <= _170;
    end
    assign _2505 = _2503 + _1484;
    assign _2506 = _2500 ? _2505 : _2503;
    assign _99 = _2506;
    always @(posedge _320) begin
        if (_318)
            _2503 <= _1130;
        else
            _2503 <= _99;
    end
    always @* begin
        case (_2503)
        0:
            _2555 <= _2512;
        1:
            _2555 <= _2518;
        2:
            _2555 <= _2524;
        3:
            _2555 <= _2530;
        4:
            _2555 <= _2536;
        5:
            _2555 <= _2542;
        6:
            _2555 <= _2548;
        default:
            _2555 <= _2554;
        endcase
    end
    assign _2556 = 32'b00000000000000000000000000000001;
    assign _2557 = ts_reg + _2556;
    assign _103 = _2557;
    always @(posedge _320) begin
        if (_318)
            ts_reg <= _2116;
        else
            ts_reg <= _103;
    end
    assign _2559 = 2'b00;
    assign _2418 = { _2073,
                     f_unexp_now };
    assign _2420 = f_amb_now ? _2559 : _2418;
    always @(posedge _320) begin
        if (_318)
            _2560 <= _2559;
        else
            _2560 <= _2420;
    end
    always @(posedge _320) begin
        if (_318)
            _2563 <= _1122;
        else
            _2563 <= f_viol_now;
    end
    always @(posedge _320) begin
        if (_318)
            _2566 <= _2559;
        else
            _2566 <= f_winner;
    end
    always @(posedge _320) begin
        if (_318)
            _2569 <= _1122;
        else
            _2569 <= _1246;
    end
    assign _2570 = _750[60:60];
    assign _2571 = f_in_eval & _2570;
    assign _2572 = ~ _1304;
    assign _2713 = _116 & _2712;
    assign _2714 = ~ _2713;
    assign _2594 = _750[23:16];
    assign _2592 = _767[86:79];
    assign _2591 = _761[86:79];
    assign _2590 = _755[86:79];
    assign _2589 = _358[86:79];
    always @* begin
        case (f_winner)
        0:
            _2593 <= _2589;
        1:
            _2593 <= _2590;
        2:
            _2593 <= _2591;
        default:
            _2593 <= _2592;
        endcase
    end
    assign _2595 = _1848 ? _2594 : _2593;
    assign _2596 = _2595 & _2586;
    assign _2587 = ~ _2586;
    assign _2588 = f_poe & _2587;
    assign _2597 = _2588 | _2596;
    assign _2631 = _2597 | _2630;
    assign _2632 = _2576 ? _2631 : f_poe;
    assign _2634 = _327 ? _1279 : _2632;
    assign _2636 = _2017 ? _1279 : _2634;
    assign _113 = _2636;
    always @(posedge _320) begin
        if (_318)
            f_poe <= _1279;
        else
            f_poe <= _113;
    end
    assign _2715 = f_poe & _2714;
    assign _116 = host_open_drain;
    assign _4280 = ~ _116;
    assign _2710 = f_lane1_out & _2704;
    assign _2709 = ~ f_lane1_out;
    assign _2707 = ~ f_lane0_out;
    assign _2708 = _2707 & _2704;
    assign _2706 = f_lane0_out & _2704;
    assign _2705 = ~ f_lane0_out;
    assign _2704 = f_pout[0:0];
    assign _2703 = _337[2:0];
    always @* begin
        case (_2703)
        0:
            _2711 <= _2704;
        1:
            _2711 <= f_lane0_out;
        2:
            _2711 <= _2705;
        3:
            _2711 <= _2706;
        4:
            _2711 <= _2708;
        5:
            _2711 <= f_lane1_out;
        6:
            _2711 <= _2709;
        default:
            _2711 <= _2710;
        endcase
    end
    assign _2701 = f_lane1_out & _2695;
    assign _2700 = ~ f_lane1_out;
    assign _2698 = ~ f_lane0_out;
    assign _2699 = _2698 & _2695;
    assign _2697 = f_lane0_out & _2695;
    assign _2696 = ~ f_lane0_out;
    assign _2695 = f_pout[1:1];
    assign _2694 = _337[5:3];
    always @* begin
        case (_2694)
        0:
            _2702 <= _2695;
        1:
            _2702 <= f_lane0_out;
        2:
            _2702 <= _2696;
        3:
            _2702 <= _2697;
        4:
            _2702 <= _2699;
        5:
            _2702 <= f_lane1_out;
        6:
            _2702 <= _2700;
        default:
            _2702 <= _2701;
        endcase
    end
    assign _2692 = f_lane1_out & _2686;
    assign _2691 = ~ f_lane1_out;
    assign _2689 = ~ f_lane0_out;
    assign _2690 = _2689 & _2686;
    assign _2688 = f_lane0_out & _2686;
    assign _2687 = ~ f_lane0_out;
    assign _2686 = f_pout[2:2];
    assign _2685 = _337[8:6];
    always @* begin
        case (_2685)
        0:
            _2693 <= _2686;
        1:
            _2693 <= f_lane0_out;
        2:
            _2693 <= _2687;
        3:
            _2693 <= _2688;
        4:
            _2693 <= _2690;
        5:
            _2693 <= f_lane1_out;
        6:
            _2693 <= _2691;
        default:
            _2693 <= _2692;
        endcase
    end
    assign _2683 = f_lane1_out & _2677;
    assign _2682 = ~ f_lane1_out;
    assign _2680 = ~ f_lane0_out;
    assign _2681 = _2680 & _2677;
    assign _2679 = f_lane0_out & _2677;
    assign _2678 = ~ f_lane0_out;
    assign _2677 = f_pout[3:3];
    assign _2676 = _337[11:9];
    always @* begin
        case (_2676)
        0:
            _2684 <= _2677;
        1:
            _2684 <= f_lane0_out;
        2:
            _2684 <= _2678;
        3:
            _2684 <= _2679;
        4:
            _2684 <= _2681;
        5:
            _2684 <= f_lane1_out;
        6:
            _2684 <= _2682;
        default:
            _2684 <= _2683;
        endcase
    end
    assign _2674 = f_lane1_out & _2668;
    assign _2673 = ~ f_lane1_out;
    assign _2671 = ~ f_lane0_out;
    assign _2672 = _2671 & _2668;
    assign _2670 = f_lane0_out & _2668;
    assign _2669 = ~ f_lane0_out;
    assign _2668 = f_pout[4:4];
    assign _2667 = _337[14:12];
    always @* begin
        case (_2667)
        0:
            _2675 <= _2668;
        1:
            _2675 <= f_lane0_out;
        2:
            _2675 <= _2669;
        3:
            _2675 <= _2670;
        4:
            _2675 <= _2672;
        5:
            _2675 <= f_lane1_out;
        6:
            _2675 <= _2673;
        default:
            _2675 <= _2674;
        endcase
    end
    assign _2665 = f_lane1_out & _2659;
    assign _2664 = ~ f_lane1_out;
    assign _2662 = ~ f_lane0_out;
    assign _2663 = _2662 & _2659;
    assign _2661 = f_lane0_out & _2659;
    assign _2660 = ~ f_lane0_out;
    assign _2659 = f_pout[5:5];
    assign _2658 = _337[17:15];
    always @* begin
        case (_2658)
        0:
            _2666 <= _2659;
        1:
            _2666 <= f_lane0_out;
        2:
            _2666 <= _2660;
        3:
            _2666 <= _2661;
        4:
            _2666 <= _2663;
        5:
            _2666 <= f_lane1_out;
        6:
            _2666 <= _2664;
        default:
            _2666 <= _2665;
        endcase
    end
    assign _2656 = f_lane1_out & _2650;
    assign _2655 = ~ f_lane1_out;
    assign _2653 = ~ f_lane0_out;
    assign _2654 = _2653 & _2650;
    assign _2652 = f_lane0_out & _2650;
    assign _2651 = ~ f_lane0_out;
    assign _2650 = f_pout[6:6];
    assign _2649 = _337[20:18];
    always @* begin
        case (_2649)
        0:
            _2657 <= _2650;
        1:
            _2657 <= f_lane0_out;
        2:
            _2657 <= _2651;
        3:
            _2657 <= _2652;
        4:
            _2657 <= _2654;
        5:
            _2657 <= f_lane1_out;
        6:
            _2657 <= _2655;
        default:
            _2657 <= _2656;
        endcase
    end
    assign _2647 = f_lane1_out & _2641;
    assign _2646 = ~ f_lane1_out;
    assign _2644 = ~ f_lane0_out;
    assign _2645 = _2644 & _2641;
    assign _2643 = f_lane0_out & _2641;
    assign _2642 = ~ f_lane0_out;
    assign _4272 = { _4270,
                     _4269 };
    assign _4269 = _647[0:0];
    assign _4270 = { _4269,
                     _4269 };
    assign _4271 = { _4270,
                     _4270 };
    assign _4273 = { _4271,
                     _4272 };
    assign _4274 = { _4273,
                     _4269 };
    assign _4275 = _4274 & _2630;
    assign _2628 = _2624 & _2622;
    assign _2627 = _2624 & _2620;
    assign _2626 = _2624 & _2617;
    assign _2624 = ~ _2611;
    assign _2625 = _2624 & _2614;
    assign _2622 = _2619 & _2616;
    assign _2623 = _2611 & _2622;
    assign _2619 = ~ _2612;
    assign _2620 = _2619 & _2613;
    assign _2621 = _2611 & _2620;
    assign _2616 = ~ _2613;
    assign _2617 = _2612 & _2616;
    assign _2618 = _2611 & _2617;
    assign _2613 = _2610[0:0];
    assign _2612 = _2610[1:1];
    assign _2614 = _2612 & _2613;
    assign _2611 = _2610[2:2];
    assign _2615 = _2611 & _2614;
    assign _2629 = { _2615,
                     _2618,
                     _2621,
                     _2623,
                     _2625,
                     _2626,
                     _2627,
                     _2628 };
    assign _2598 = ~ _1848;
    assign _2604 = _2598 & _2603;
    assign _2630 = _2604 ? _2629 : _1279;
    assign _4267 = ~ _2630;
    assign _4263 = _750[15:8];
    assign _4261 = _767[78:71];
    assign _4260 = _761[78:71];
    assign _4259 = _755[78:71];
    assign _4258 = _358[78:71];
    always @* begin
        case (f_winner)
        0:
            _4262 <= _4258;
        1:
            _4262 <= _4259;
        2:
            _4262 <= _4260;
        default:
            _4262 <= _4261;
        endcase
    end
    assign _4264 = _1848 ? _4263 : _4262;
    assign _4265 = _4264 & _2586;
    assign _2585 = _750[7:0];
    assign _2583 = _767[70:63];
    assign _2582 = _761[70:63];
    assign _2581 = _755[70:63];
    assign _2580 = _358[70:63];
    always @* begin
        case (f_winner)
        0:
            _2584 <= _2580;
        1:
            _2584 <= _2581;
        2:
            _2584 <= _2582;
        default:
            _2584 <= _2583;
        endcase
    end
    assign _2586 = _1848 ? _2585 : _2584;
    assign _4256 = ~ _2586;
    assign _4257 = f_pout & _4256;
    assign _4266 = _4257 | _4265;
    assign _4268 = _4266 & _4267;
    assign _4276 = _4268 | _4275;
    assign _2574 = _698 == _2559;
    assign _2575 = _2574 | _700;
    assign _2576 = _1849 & _2575;
    assign _4277 = _2576 ? _4276 : f_pout;
    assign _118 = host_crc_expect;
    assign _4249 = 32'b11111111111111111111111111111111;
    assign _2827 = 32'b11101101101110001000001100100000;
    assign _2825 = _2819[31:1];
    assign _2826 = { _1122,
                     _2825 };
    assign _2828 = _2826 ^ _2827;
    assign _2822 = _2819[31:1];
    assign _2823 = { _1122,
                     _2822 };
    assign _2815 = _2809[31:1];
    assign _2816 = { _1122,
                     _2815 };
    assign _2818 = _2816 ^ _2827;
    assign _2812 = _2809[31:1];
    assign _2813 = { _1122,
                     _2812 };
    assign _2805 = _2799[31:1];
    assign _2806 = { _1122,
                     _2805 };
    assign _2808 = _2806 ^ _2827;
    assign _2802 = _2799[31:1];
    assign _2803 = { _1122,
                     _2802 };
    assign _2795 = _2789[31:1];
    assign _2796 = { _1122,
                     _2795 };
    assign _2798 = _2796 ^ _2827;
    assign _2792 = _2789[31:1];
    assign _2793 = { _1122,
                     _2792 };
    assign _2785 = _2779[31:1];
    assign _2786 = { _1122,
                     _2785 };
    assign _2788 = _2786 ^ _2827;
    assign _2782 = _2779[31:1];
    assign _2783 = { _1122,
                     _2782 };
    assign _2775 = _2769[31:1];
    assign _2776 = { _1122,
                     _2775 };
    assign _2778 = _2776 ^ _2827;
    assign _2772 = _2769[31:1];
    assign _2773 = { _1122,
                     _2772 };
    assign _2765 = _2759[31:1];
    assign _2766 = { _1122,
                     _2765 };
    assign _2768 = _2766 ^ _2827;
    assign _2762 = _2759[31:1];
    assign _2763 = { _1122,
                     _2762 };
    assign _2755 = _2749[31:1];
    assign _2756 = { _1122,
                     _2755 };
    assign _2758 = _2756 ^ _2827;
    assign _2752 = _2749[31:1];
    assign _2753 = { _1122,
                     _2752 };
    assign _2746 = _312[127:120];
    assign _2745 = _312[119:112];
    assign _2744 = _312[111:104];
    assign _2743 = _312[103:96];
    assign _2742 = _312[95:88];
    assign _2741 = _312[87:80];
    assign _2740 = _312[79:72];
    assign _2739 = _312[71:64];
    assign _2738 = _312[63:56];
    assign _2737 = _312[55:48];
    assign _2736 = _312[47:40];
    assign _2735 = _312[39:32];
    assign _2734 = _312[31:24];
    assign _2733 = _312[23:16];
    assign _2732 = _312[15:8];
    assign _2731 = _312[7:0];
    assign _2728 = 13'b0000000000001;
    assign _2729 = f_sw_cnt - _2728;
    assign _2730 = _2729[3:0];
    always @* begin
        case (_2730)
        0:
            _2747 <= _2731;
        1:
            _2747 <= _2732;
        2:
            _2747 <= _2733;
        3:
            _2747 <= _2734;
        4:
            _2747 <= _2735;
        5:
            _2747 <= _2736;
        6:
            _2747 <= _2737;
        7:
            _2747 <= _2738;
        8:
            _2747 <= _2739;
        9:
            _2747 <= _2740;
        10:
            _2747 <= _2741;
        11:
            _2747 <= _2742;
        12:
            _2747 <= _2743;
        13:
            _2747 <= _2744;
        14:
            _2747 <= _2745;
        default:
            _2747 <= _2746;
        endcase
    end
    assign _2727 = 24'b000000000000000000000000;
    assign _2748 = { _2727,
                     _2747 };
    assign _2725 = f_sw_cnt == _1137;
    assign _2726 = ~ _2725;
    assign _2830 = _2726 ? _2829 : _2723;
    assign _2723 = _2718 ? _4249 : _2721;
    assign _2831 = f_sweeping ? _2830 : _2723;
    assign _119 = _2831;
    always @(posedge _320) begin
        if (_318)
            _2721 <= _4249;
        else
            _2721 <= _119;
    end
    assign _2749 = _2721 ^ _2748;
    assign _2750 = _2749[0:0];
    assign _2759 = _2750 ? _2758 : _2753;
    assign _2760 = _2759[0:0];
    assign _2769 = _2760 ? _2768 : _2763;
    assign _2770 = _2769[0:0];
    assign _2779 = _2770 ? _2778 : _2773;
    assign _2780 = _2779[0:0];
    assign _2789 = _2780 ? _2788 : _2783;
    assign _2790 = _2789[0:0];
    assign _2799 = _2790 ? _2798 : _2793;
    assign _2800 = _2799[0:0];
    assign _2809 = _2800 ? _2808 : _2803;
    assign _2810 = _2809[0:0];
    assign _2819 = _2810 ? _2818 : _2813;
    assign _2820 = _2819[0:0];
    assign _2829 = _2820 ? _2828 : _2823;
    assign _4250 = _2829 ^ _4249;
    assign f_sw_match = _4250 == _118;
    assign _4252 = f_sw_last ? f_sw_match : _4248;
    assign _4254 = _4236 ? _1122 : _4252;
    assign _1325 = ~ f_sweeping;
    assign _1324 = _124 & _1304;
    assign f_store_we = _1324 & _1325;
    assign _4244 = f_store_we | _122;
    assign _4246 = _4244 ? _1122 : f_image_valid;
    assign _4248 = _2718 ? _1122 : _4246;
    assign _4237 = 13'b1000000000000;
    assign _2835 = f_sw_cnt + _2728;
    assign _2833 = _2718 ? _1137 : f_sw_cnt;
    assign _2836 = f_sweeping ? _2835 : _2833;
    assign _120 = _2836;
    always @(posedge _320) begin
        if (_318)
            f_sw_cnt <= _1137;
        else
            f_sw_cnt <= _120;
    end
    assign f_sw_last = f_sw_cnt == _4237;
    assign _4240 = f_sw_last ? _1122 : _4233;
    assign _122 = host_crc_expect_we;
    assign _124 = host_rec_we;
    assign _4234 = _334 | _124;
    assign _4235 = _4234 | _122;
    assign _4236 = f_sweeping & _4235;
    assign _4242 = _4236 ? _1122 : _4240;
    assign _2717 = ~ f_sweeping;
    assign _4226 = _1848 ? _1271 : _342;
    assign _4222 = _2852 ? _1270 : _342;
    assign _2085 = 2'b11;
    assign _4213 = f_policy == _2085;
    assign _4215 = _4213 ? _2559 : _342;
    assign _4212 = f_policy == _1271;
    assign _4217 = _4212 ? _1270 : _4215;
    assign _4211 = f_policy == _2559;
    assign _4219 = _4211 ? _2559 : _4217;
    assign _4220 = f_viol_now ? _4219 : _342;
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
    assign _1227 = _1225 == _2108;
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
    assign _727 = _725 == _2108;
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
    assign _4196 = _409 + _1484;
    assign _1253 = 6'b000000;
    assign _126 = host_start_loc;
    assign _2853 = _2852 ? _2850 : _1254;
    assign _128 = host_recover_loc;
    assign _2840 = _2017 ? _128 : _2839;
    assign _129 = _2840;
    always @(posedge _320) begin
        if (_318)
            _2839 <= _1253;
        else
            _2839 <= _129;
    end
    assign _2843 = f_policy == _1271;
    assign _2844 = _2843 ? _2839 : _1254;
    assign _2845 = f_viol_now ? _2844 : _1254;
    assign _2854 = _1246 ? _2853 : _2845;
    assign _2841 = _342 == _1271;
    assign _2855 = _2841 ? _2854 : _1254;
    assign _2856 = _2017 ? _126 : _2855;
    assign _130 = _2856;
    always @(posedge _320) begin
        if (_318)
            _1254 <= _1253;
        else
            _1254 <= _130;
    end
    assign _2849 = _767[110:105];
    assign _2848 = _761[110:105];
    assign _2847 = _755[110:105];
    assign _2846 = _358[110:105];
    always @* begin
        case (f_winner)
        0:
            _2850 <= _2846;
        1:
            _2850 <= _2847;
        2:
            _2850 <= _2848;
        default:
            _2850 <= _2849;
        endcase
    end
    assign _2851 = _2850 == _1254;
    assign _2852 = ~ _2851;
    assign _4192 = _2852 ? _1130 : _409;
    assign _4187 = f_policy == _1271;
    assign _4189 = _4187 ? _1130 : _409;
    assign _2076 = f_changed_all & f_watch;
    assign _2078 = _2076 == _1279;
    assign _2079 = ~ _2078;
    assign _2074 = ~ _1246;
    assign _2075 = f_in_eval & _2074;
    assign f_unexp_now = _2075 & _2079;
    assign _2860 = ~ f_amb_now;
    assign _2861 = _2073 & _2860;
    assign _2863 = _2861 ? _1949 : _2859;
    assign _2864 = _1246 ? _2859 : _2863;
    assign _2859 = _1849 ? _1122 : _2071;
    assign _2857 = _342 == _1271;
    assign _2865 = _2857 ? _2864 : _2859;
    assign _131 = _2865;
    always @(posedge _320) begin
        if (_318)
            _2071 <= _1122;
        else
            _2071 <= _131;
    end
    assign _2072 = ~ _2071;
    assign _4178 = 16'b0000000000000001;
    assign _4179 = _393 + _4178;
    assign _4175 = _393 == _1119;
    assign _4176 = ~ _4175;
    assign _4177 = _4136 & _4176;
    assign _4180 = _4177 ? _4179 : _393;
    assign _4120 = _750[26:24];
    assign _4118 = _767[93:91];
    assign _4117 = _761[93:91];
    assign _4116 = _755[93:91];
    assign _4115 = _358[93:91];
    assign _1055 = f_chgmask2 & f_multi_eff;
    assign _1057 = _1055 == _1279;
    assign _1048 = _1005 == _1119;
    assign _1044 = _1005 == _1229;
    assign _1045 = _1044 & _1025;
    assign _1042 = _941 == _1001;
    assign _1046 = _1042 | _1045;
    assign _1049 = _940 ? _1048 : _1046;
    assign _1039 = _659[3:0];
    assign _1041 = _1039 == _2108;
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
    assign _1062 = f_fire2 ? _1271 : _2085;
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
    assign _2870 = _378 & f_chg_now;
    assign _2871 = _743 | _2870;
    assign _2867 = _342 == _1271;
    assign _2869 = _2867 ? _1279 : _743;
    assign _2866 = _342 == _1270;
    assign _2872 = _2866 ? _2871 : _2869;
    assign _2874 = _2017 ? _1279 : _2872;
    assign _132 = _2874;
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
    assign _903 = _901 == _2108;
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
    assign _2875 = _2017 ? _134 : _698;
    assign _135 = _2875;
    always @(posedge _320) begin
        if (_318)
            _698 <= _2559;
        else
            _698 <= _135;
    end
    assign _700 = _698 == _1271;
    assign _877 = ~ _700;
    assign _914 = _877 | _913;
    assign _874 = _755[62:62];
    assign _2879 = _1635 ? _1949 : _2877;
    assign _2877 = _1605 ? _1949 : _691;
    assign _2880 = _1590 ? _2879 : _2877;
    assign _2882 = _1495 ? _1122 : _2880;
    assign _2884 = _1493 ? _1122 : _2882;
    assign _136 = _2884;
    always @(posedge _320) begin
        if (_318)
            _691 <= _1122;
        else
            _691 <= _136;
    end
    assign _138 = host_lane1_sync_mask;
    assign _140 = host_lane1_sync;
    assign _2890 = _2889 ^ _140;
    assign _2891 = _2890 & _138;
    assign _2893 = _2891 == _1229;
    assign _2895 = _2893 ? _1949 : _688;
    assign _2896 = _1744 ? _2895 : _688;
    assign _2897 = _1635 ? _688 : _2896;
    assign _2898 = _1590 ? _2897 : _688;
    assign _2900 = _1495 ? _1122 : _2898;
    assign _2902 = _1493 ? _1122 : _2900;
    assign _141 = _2902;
    always @(posedge _320) begin
        if (_318)
            _688 <= _1122;
        else
            _688 <= _141;
    end
    assign _2915 = _1626 == _2914;
    assign _2916 = ~ _2915;
    assign _2918 = _2909 ? _2917 : g_crc_bad;
    assign _2919 = _1744 ? _2918 : g_crc_bad;
    assign _2920 = _1635 ? g_crc_bad : _2919;
    assign _2921 = _1590 ? _2920 : g_crc_bad;
    assign _2923 = _1495 ? _1122 : _2921;
    assign _142 = _2923;
    always @(posedge _320) begin
        if (_318)
            g_crc_bad <= _1122;
        else
            g_crc_bad <= _142;
    end
    assign _2917 = g_crc_bad | _2916;
    assign _2926 = ~ _2917;
    assign _2924 = 6'b000001;
    assign _2925 = g_left == _2924;
    assign _2927 = _2925 ? _2926 : _685;
    assign _2928 = _2909 ? _2927 : _685;
    assign _2929 = _1744 ? _2928 : _685;
    assign _2930 = _1635 ? _685 : _2929;
    assign _2931 = _1590 ? _2930 : _685;
    assign _2933 = _1495 ? _1122 : _2931;
    assign _2935 = _1493 ? _1122 : _2933;
    assign _143 = _2935;
    always @(posedge _320) begin
        if (_318)
            _685 <= _1122;
        else
            _685 <= _143;
    end
    assign _2939 = _1483 ? _1949 : _2937;
    assign _2937 = _1453 ? _1949 : _677;
    assign _2940 = _1438 ? _2939 : _2937;
    assign _2942 = _1343 ? _1122 : _2940;
    assign _2944 = _1341 ? _1122 : _2942;
    assign _144 = _2944;
    always @(posedge _320) begin
        if (_318)
            _677 <= _1122;
        else
            _677 <= _144;
    end
    assign _146 = host_lane0_sync_mask;
    assign _148 = host_lane0_sync;
    assign _2950 = _2949 ^ _148;
    assign _2951 = _2950 & _146;
    assign _2953 = _2951 == _1229;
    assign _2955 = _2953 ? _1949 : _674;
    assign _2956 = _1646 ? _2955 : _674;
    assign _2957 = _1483 ? _674 : _2956;
    assign _2958 = _1438 ? _2957 : _674;
    assign _2960 = _1343 ? _1122 : _2958;
    assign _2962 = _1341 ? _1122 : _2960;
    assign _149 = _2962;
    always @(posedge _320) begin
        if (_318)
            _674 <= _1122;
        else
            _674 <= _149;
    end
    assign _2975 = _1474 == _2974;
    assign _2976 = ~ _2975;
    assign _2978 = _2969 ? _2977 : g_crc_bad_0;
    assign _2979 = _1646 ? _2978 : g_crc_bad_0;
    assign _2980 = _1483 ? g_crc_bad_0 : _2979;
    assign _2981 = _1438 ? _2980 : g_crc_bad_0;
    assign _2983 = _1343 ? _1122 : _2981;
    assign _150 = _2983;
    always @(posedge _320) begin
        if (_318)
            g_crc_bad_0 <= _1122;
        else
            g_crc_bad_0 <= _150;
    end
    assign _2977 = g_crc_bad_0 | _2976;
    assign _2986 = ~ _2977;
    assign _2985 = g_left_0 == _2924;
    assign _2987 = _2985 ? _2986 : _671;
    assign _2988 = _2969 ? _2987 : _671;
    assign _2989 = _1646 ? _2988 : _671;
    assign _2990 = _1483 ? _671 : _2989;
    assign _2991 = _1438 ? _2990 : _671;
    assign _2993 = _1343 ? _1122 : _2991;
    assign _2995 = _1341 ? _1122 : _2993;
    assign _151 = _2995;
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
    assign _3000 = _659[10:10];
    assign _2999 = _659[12:12];
    assign _3001 = _2999 ^ _3000;
    assign _2998 = _659[13:13];
    assign _3002 = _2998 ^ _3001;
    assign _2997 = _659[15:15];
    assign _3003 = _2997 ^ _3002;
    assign _2996 = _659[14:0];
    assign _3004 = { _2996,
                     _3003 };
    assign _154 = _3004;
    always @(posedge _320) begin
        if (_318)
            _659 <= _658;
        else
            _659 <= _154;
    end
    assign _660 = _659[0:0];
    assign _3017 = _158 + _2427;
    assign _3015 = _158 - _2427;
    assign _3018 = _2492 ? _3017 : _3015;
    assign _2490 = _158 == _2108;
    assign _2499 = ~ _2490;
    assign _156 = host_rx_pop;
    assign _2500 = _156 & _2499;
    assign _2491 = ~ _656;
    assign _3011 = ~ _3010;
    assign _3007 = _1845 | _1859;
    assign _3005 = _1743 | _1810;
    assign _3006 = _1712 | _3005;
    assign _3008 = _3006 | _3007;
    assign _3012 = _3008 & _3011;
    assign f_rx_push = _3012;
    assign _2492 = f_rx_push & _2491;
    assign _3013 = _2492 ^ _2500;
    assign _3019 = _3013 ? _3018 : _158;
    always @(posedge _320) begin
        if (_318)
            _3022 <= _2108;
        else
            _3022 <= _3019;
    end
    assign _158 = _3022;
    assign _656 = _158 == _1883;
    assign _652 = _651[0:0];
    assign _3931 = _647[7:1];
    assign _3932 = { vdd,
                     _3931 };
    assign _3929 = _3921[7:7];
    assign _3928 = _3921[6:6];
    assign _3927 = _3921[5:5];
    assign _3926 = _3921[4:4];
    assign _3925 = _3921[3:3];
    assign _3924 = _3921[2:2];
    assign _3923 = _3921[1:1];
    assign _3922 = _3921[0:0];
    assign _3930 = { _3922,
                     _3923,
                     _3924,
                     _3925,
                     _3926,
                     _3927,
                     _3928,
                     _3929 };
    assign _3914 = _297 + _2427;
    assign _3912 = _297 - _2427;
    assign _3915 = _3039 ? _3914 : _3912;
    assign _1714 = _297 == _1883;
    assign _3038 = ~ _1714;
    assign _3035 = ~ _295;
    assign _160 = host_tx_push;
    assign _3036 = _160 & _3035;
    assign _1710 = ~ _1676;
    assign _1704 = g_bitpos_0 + _1484;
    assign _1699 = ~ _1468;
    assign g_tx_bit = _1689 & _1697;
    assign _1700 = g_tx_bit & _1699;
    assign _1701 = _1700 & g_data_left_0;
    assign _1702 = _1670 | _1701;
    assign _1705 = _1702 ? _1704 : g_bitpos_0;
    assign _1707 = _1705 == _1130;
    assign _1708 = ~ _1707;
    assign _1679 = _1678 & _291;
    assign _1709 = _1679 & _1708;
    assign _1711 = _1709 & _1710;
    assign _1675 = g_bitpos_0 == _2484;
    assign _1666 = g_cnt_0[5:0];
    assign _1667 = _1666 < _257;
    assign _1668 = ~ _1667;
    assign _1662 = g_cnt_0[15:6];
    assign _1664 = _1662 == _1134;
    assign _1665 = ~ _1664;
    assign _1669 = _1665 | _1668;
    assign _3902 = ~ _287;
    assign _3903 = _291 & _3902;
    assign _3906 = _3903 ? _1270 : _1271;
    assign _3895 = ~ _1697;
    assign _3896 = _1689 & _3895;
    assign _3897 = _668 | _3896;
    assign _3898 = _3897 | _3887;
    assign _3900 = _3898 ? _1271 : _3894;
    assign _3881 = g_run_0 + _1484;
    assign _3878 = g_run_0 + _1484;
    assign _3874 = vdd == g_last_0;
    assign _3872 = g_run_0 == _1130;
    assign _3873 = ~ _3872;
    assign _3875 = _3873 & _3874;
    assign _3879 = _3875 ? _3878 : _1484;
    assign _3870 = _269 == _1271;
    assign _3882 = _3870 ? _3881 : _3879;
    assign _3883 = _3882 == _163;
    assign _3864 = g_run_0 + _1484;
    assign _3860 = gnd == g_last_0;
    assign _3858 = g_run_0 == _1130;
    assign _3859 = ~ _3858;
    assign _3861 = _3859 & _3860;
    assign _3865 = _3861 ? _3864 : _1484;
    assign _3856 = _269 == _1271;
    assign _3867 = _3856 ? _1130 : _3865;
    assign _3868 = _3867 == _163;
    assign _3884 = _1474 ? _3883 : _3868;
    assign _3885 = _1463 & _3884;
    assign _3886 = ~ _3885;
    assign _3852 = g_left_0 == _2924;
    assign _3850 = g_left_0 == _1253;
    assign _3853 = _2969 ? _3852 : _3850;
    assign _3845 = g_cnt_0 + _4178;
    assign _3846 = _3845 == _1659;
    assign _3843 = g_cnt_0 == _1659;
    assign _3847 = _1661 ? _3846 : _3843;
    assign _3841 = ~ _1483;
    assign _3842 = _1438 & _3841;
    assign _3848 = _3842 & _3847;
    assign _3854 = _3848 & _3853;
    assign _3887 = _3854 & _3886;
    assign _3889 = _3887 ? _2085 : _3840;
    assign _3891 = _1483 ? _2559 : _3889;
    assign _3837 = _1697 ? _3835 : _2085;
    assign _3833 = _1367 & _1365;
    assign _3835 = _3833 ? _1271 : g_mode_0;
    assign _3838 = _1689 ? _3837 : _3835;
    assign _3114 = _1697 ? _3113 : _3025;
    assign _3115 = _1689 ? _3114 : _3025;
    assign _161 = _3115;
    always @(posedge _320) begin
        if (_318)
            _3025 <= _1122;
        else
            _3025 <= _161;
    end
    assign _3759 = ~ _3113;
    assign _3757 = ~ f_lane0_out;
    assign _3758 = _3113 ? f_lane0_out : _3757;
    always @* begin
        case (_285)
        0:
            _3760 <= _3113;
        1:
            _3760 <= _3758;
        2:
            _3760 <= _3759;
        default:
            _3760 <= _3113;
        endcase
    end
    assign _163 = host_lane0_stuff_len;
    assign _3741 = g_run_0 + _1484;
    assign _3742 = _1474 ? _3741 : _1130;
    assign _3737 = g_run_0 + _1484;
    assign _3733 = _1474 == g_last_0;
    assign _3731 = g_run_0 == _1130;
    assign _3732 = ~ _3731;
    assign _3734 = _3732 & _3733;
    assign _3738 = _3734 ? _3737 : _1484;
    assign _3729 = _269 == _1271;
    assign _3743 = _3729 ? _3742 : _3738;
    assign _3744 = _1483 ? _3727 : _3743;
    assign _3723 = g_run_0 + _1484;
    assign _3724 = _3113 ? _3723 : _1130;
    assign _3719 = g_run_0 + _1484;
    assign _3110 = _3102[7:7];
    assign _3109 = _3102[6:6];
    assign _3108 = _3102[5:5];
    assign _3107 = _3102[4:4];
    assign _3106 = _3102[3:3];
    assign _3105 = _3102[2:2];
    assign _3104 = _3102[1:1];
    assign _3100 = _3092[7:7];
    assign _3099 = _3092[6:6];
    assign _3098 = _3092[5:5];
    assign _3097 = _3092[4:4];
    assign _3096 = _3092[3:3];
    assign _3095 = _3092[2:2];
    assign _3094 = _3092[1:1];
    assign _3086 = _3042 == _2484;
    assign _3087 = _3039 & _3086;
    always @(posedge _320) begin
        if (_318)
            _3088 <= _1279;
        else
            if (_3087)
                _3088 <= _3032;
    end
    assign _3080 = _3042 == _1985;
    assign _3081 = _3039 & _3080;
    always @(posedge _320) begin
        if (_318)
            _3082 <= _1279;
        else
            if (_3081)
                _3082 <= _3032;
    end
    assign _3074 = _3042 == _1986;
    assign _3075 = _3039 & _3074;
    always @(posedge _320) begin
        if (_318)
            _3076 <= _1279;
        else
            if (_3075)
                _3076 <= _3032;
    end
    assign _3068 = _3042 == _1327;
    assign _3069 = _3039 & _3068;
    always @(posedge _320) begin
        if (_318)
            _3070 <= _1279;
        else
            if (_3069)
                _3070 <= _3032;
    end
    assign _3062 = _3042 == _1989;
    assign _3063 = _3039 & _3062;
    always @(posedge _320) begin
        if (_318)
            _3064 <= _1279;
        else
            if (_3063)
                _3064 <= _3032;
    end
    assign _3056 = _3042 == _1457;
    assign _3057 = _3039 & _3056;
    always @(posedge _320) begin
        if (_318)
            _3058 <= _1279;
        else
            if (_3057)
                _3058 <= _3032;
    end
    assign _3050 = _3042 == _1484;
    assign _3051 = _3039 & _3050;
    always @(posedge _320) begin
        if (_318)
            _3052 <= _1279;
        else
            if (_3051)
                _3052 <= _3032;
    end
    assign _3117 = _3042 + _1484;
    assign _3118 = _3039 ? _3117 : _3042;
    assign _164 = _3118;
    always @(posedge _320) begin
        if (_318)
            _3042 <= _1130;
        else
            _3042 <= _164;
    end
    assign _3044 = _3042 == _1130;
    assign _3045 = _3039 & _3044;
    assign _3185 = _1670 ? _3184 : g_byte_0;
    assign _3186 = _1676 ? _3184 : _3185;
    assign _3136 = _3135 ? _3133 : _3123;
    assign _3134 = _3120 ? _3133 : _3123;
    assign _3137 = _1814 ? _3136 : _3134;
    assign _165 = _3137;
    always @(posedge _320) begin
        if (_318)
            _3123 <= _1279;
        else
            _3123 <= _165;
    end
    assign _3132 = _1768 ? _3131 : g_byte;
    assign _3133 = _1774 ? _3131 : _3132;
    assign _3178 = _1743 ? _3123 : _3133;
    assign _3145 = _3144 ? _651 : _3142;
    assign _3143 = _3139 ? _651 : _3142;
    assign _3146 = _1866 ? _3145 : _3143;
    assign _166 = _3146;
    always @(posedge _320) begin
        if (_318)
            _3142 <= _1279;
        else
            _3142 <= _166;
    end
    assign _3163 = _651[6:0];
    assign _3164 = { _3163,
                     _3160 };
    assign _3161 = _651[7:1];
    assign _3159 = _365[7:7];
    assign _3158 = _365[6:6];
    assign _3157 = _365[5:5];
    assign _3156 = _365[4:4];
    assign _3155 = _365[3:3];
    assign _3154 = _365[2:2];
    assign _3153 = _365[1:1];
    assign _3152 = _365[0:0];
    assign _3150 = _767[102:100];
    assign _3149 = _761[102:100];
    assign _3148 = _755[102:100];
    assign _3147 = _358[102:100];
    always @* begin
        case (f_winner)
        0:
            _3151 <= _3147;
        1:
            _3151 <= _3148;
        2:
            _3151 <= _3149;
        default:
            _3151 <= _3150;
        endcase
    end
    always @* begin
        case (_3151)
        0:
            _3160 <= _3152;
        1:
            _3160 <= _3153;
        2:
            _3160 <= _3154;
        3:
            _3160 <= _3155;
        4:
            _3160 <= _3156;
        5:
            _3160 <= _3157;
        6:
            _3160 <= _3158;
        default:
            _3160 <= _3159;
        endcase
    end
    assign _3162 = { _3160,
                     _3161 };
    always @* begin
        case (_1856)
        0:
            _3165 <= _651;
        1:
            _3165 <= _3162;
        2:
            _3165 <= _3164;
        default:
            _3165 <= _651;
        endcase
    end
    assign _3166 = _1849 ? _3165 : _651;
    assign _167 = _3166;
    always @(posedge _320) begin
        if (_318)
            _651 <= _1279;
        else
            _651 <= _167;
    end
    assign _3144 = _1845 & _1859;
    assign _3170 = _3144 ? _1845 : _1122;
    assign _3138 = ~ _1845;
    assign _3139 = _3138 & _1859;
    assign _3168 = _3139 ? _1949 : _1845;
    assign _1853 = _767[97:96];
    assign _1852 = _761[97:96];
    assign _1851 = _755[97:96];
    assign _1850 = _358[97:96];
    always @* begin
        case (f_winner)
        0:
            _1854 <= _1850;
        1:
            _1854 <= _1851;
        2:
            _1854 <= _1852;
        default:
            _1854 <= _1853;
        endcase
    end
    assign _1856 = _1848 ? _2559 : _1854;
    assign f_eng_push = _1856 == _2085;
    assign _1859 = _1849 & f_eng_push;
    assign _1865 = _1845 | _1859;
    assign _1862 = _1743 | _1810;
    assign _1863 = ~ _1862;
    assign _1861 = ~ _1712;
    assign _1864 = _1861 & _1863;
    assign _1866 = _1864 & _1865;
    assign _3171 = _1866 ? _3170 : _3168;
    assign _168 = _3171;
    always @(posedge _320) begin
        if (_318)
            _1845 <= _1122;
        else
            _1845 <= _168;
    end
    assign _3177 = _1845 ? _3142 : _651;
    assign _3135 = _1743 & _1810;
    assign _3175 = _3135 ? _1743 : _1122;
    assign _1808 = ~ _1774;
    assign _1802 = g_bitpos + _1484;
    assign _1797 = ~ _1620;
    assign g_tx_bit_0 = _1787 & _1795;
    assign _1798 = g_tx_bit_0 & _1797;
    assign _1799 = _1798 & g_data_left;
    assign _1800 = _1768 | _1799;
    assign _1803 = _1800 ? _1802 : g_bitpos;
    assign _1805 = _1803 == _1130;
    assign _1806 = ~ _1805;
    assign _1777 = _1776 & _232;
    assign _1807 = _1777 & _1806;
    assign _1809 = _1807 & _1808;
    assign _1773 = g_bitpos == _2484;
    assign _1774 = _1768 & _1773;
    assign _1810 = _1774 | _1809;
    assign _3119 = ~ _1743;
    assign _3120 = _3119 & _1810;
    assign _3173 = _3120 ? _1949 : _1743;
    assign _3176 = _1814 ? _3175 : _3173;
    assign _169 = _3176;
    always @(posedge _320) begin
        if (_318)
            _1743 <= _1122;
        else
            _1743 <= _169;
    end
    assign _1813 = _1743 | _1810;
    assign _1812 = ~ _1712;
    assign _1814 = _1812 & _1813;
    assign _3179 = _1814 ? _3178 : _3177;
    assign _3187 = _1712 ? _3186 : _3179;
    assign _170 = _3187;
    assign _171 = _170;
    assign _173 = host_tx_data;
    assign _3032 = _296 ? _171 : _173;
    always @(posedge _320) begin
        if (_318)
            _3046 <= _1279;
        else
            if (_3045)
                _3046 <= _3032;
    end
    assign _3563 = _3031 + _1484;
    assign _3560 = ~ _654;
    assign _1942 = ~ _654;
    assign _1778 = ~ _232;
    assign _3550 = ~ _230;
    assign _3551 = _232 & _3550;
    assign _3554 = _3551 ? _1270 : _1271;
    assign _3543 = ~ _1795;
    assign _3544 = _1787 & _3543;
    assign _3545 = _682 | _3544;
    assign _3546 = _3545 | _3535;
    assign _3548 = _3546 ? _1271 : _3542;
    assign _3529 = g_run + _1484;
    assign _3526 = g_run + _1484;
    assign _3522 = vdd == g_last;
    assign _3520 = g_run == _1130;
    assign _3521 = ~ _3520;
    assign _3523 = _3521 & _3522;
    assign _3527 = _3523 ? _3526 : _1484;
    assign _3518 = _210 == _1271;
    assign _3530 = _3518 ? _3529 : _3527;
    assign _3531 = _3530 == _176;
    assign _3512 = g_run + _1484;
    assign _3508 = gnd == g_last;
    assign _3506 = g_run == _1130;
    assign _3507 = ~ _3506;
    assign _3509 = _3507 & _3508;
    assign _3513 = _3509 ? _3512 : _1484;
    assign _3504 = _210 == _1271;
    assign _3515 = _3504 ? _1130 : _3513;
    assign _3516 = _3515 == _176;
    assign _3532 = _1626 ? _3531 : _3516;
    assign _3533 = _1615 & _3532;
    assign _3534 = ~ _3533;
    assign _3500 = g_left == _2924;
    assign _3498 = g_left == _1253;
    assign _3501 = _2909 ? _3500 : _3498;
    assign _3493 = g_cnt + _4178;
    assign _3494 = _3493 == _1757;
    assign _3491 = g_cnt == _1757;
    assign _3495 = _1759 ? _3494 : _3491;
    assign _3489 = ~ _1635;
    assign _3490 = _1590 & _3489;
    assign _3496 = _3490 & _3495;
    assign _3502 = _3496 & _3501;
    assign _3535 = _3502 & _3534;
    assign _3537 = _3535 ? _2085 : _3488;
    assign _3539 = _1635 ? _2559 : _3537;
    assign _3485 = _1795 ? _3483 : _2085;
    assign _3481 = _1519 & _1517;
    assign _3483 = _3481 ? _1271 : g_mode;
    assign _3486 = _1787 ? _3485 : _3483;
    assign _3215 = _1795 ? _3214 : _3190;
    assign _3216 = _1787 ? _3215 : _3190;
    assign _174 = _3216;
    always @(posedge _320) begin
        if (_318)
            _3190 <= _1122;
        else
            _3190 <= _174;
    end
    assign _3411 = ~ _3214;
    assign _3409 = ~ f_lane1_out;
    assign _3410 = _3214 ? f_lane1_out : _3409;
    always @* begin
        case (_226)
        0:
            _3412 <= _3214;
        1:
            _3412 <= _3410;
        2:
            _3412 <= _3411;
        default:
            _3412 <= _3214;
        endcase
    end
    assign _176 = host_lane1_stuff_len;
    assign _3393 = g_run + _1484;
    assign _3394 = _1626 ? _3393 : _1130;
    assign _3389 = g_run + _1484;
    assign _3385 = _1626 == g_last;
    assign _3383 = g_run == _1130;
    assign _3384 = ~ _3383;
    assign _3386 = _3384 & _3385;
    assign _3390 = _3386 ? _3389 : _1484;
    assign _3381 = _210 == _1271;
    assign _3395 = _3381 ? _3394 : _3390;
    assign _3396 = _1635 ? _3379 : _3395;
    assign _3375 = g_run + _1484;
    assign _3376 = _3214 ? _3375 : _1130;
    assign _3371 = g_run + _1484;
    assign _3211 = _3203[7:7];
    assign _3210 = _3203[6:6];
    assign _3209 = _3203[5:5];
    assign _3208 = _3203[4:4];
    assign _3207 = _3203[3:3];
    assign _3206 = _3203[2:2];
    assign _3205 = _3203[1:1];
    assign _3201 = _3193[7:7];
    assign _3200 = _3193[6:6];
    assign _3199 = _3193[5:5];
    assign _3198 = _3193[4:4];
    assign _3197 = _3193[3:3];
    assign _3196 = _3193[2:2];
    assign _3195 = _3193[1:1];
    assign _3192 = _654 ? _1277 : _3089;
    assign _3129 = g_byte[7:1];
    assign _3130 = { _1626,
                     _3129 };
    assign _3127 = g_byte[6:0];
    assign _3128 = { _3127,
                     _1626 };
    assign _3131 = _179 ? _3130 : _3128;
    assign _3221 = _1768 ? _3131 : _3220;
    assign _3222 = _1759 ? _3221 : _3220;
    assign _3223 = _1744 ? _3222 : _3220;
    assign _3224 = _1635 ? _3220 : _3223;
    assign _3217 = g_data_left ? _3193 : g_byte;
    assign _3218 = _1620 ? g_byte : _3217;
    assign _3219 = _1795 ? _3218 : g_byte;
    assign _3220 = _1787 ? _3219 : g_byte;
    assign _3225 = _1590 ? _3224 : _3220;
    assign _177 = _3225;
    always @(posedge _320) begin
        if (_318)
            g_byte <= _1279;
        else
            g_byte <= _177;
    end
    assign _1939 = g_bitpos == _1130;
    assign _1936 = ~ _1620;
    assign _1937 = _1936 & g_data_left;
    assign _1940 = _1937 & _1939;
    assign _3193 = _1940 ? _3192 : g_byte;
    assign _3194 = _3193[0:0];
    assign _3202 = { _3194,
                     _3195,
                     _3196,
                     _3197,
                     _3198,
                     _3199,
                     _3200,
                     _3201 };
    assign _179 = host_lane1_lsb_first;
    assign _3203 = _179 ? _3193 : _3202;
    assign _3204 = _3203[0:0];
    assign _3233 = g_bitpos + _1484;
    assign _1764 = g_cnt[5:0];
    assign _1765 = _1764 < _198;
    assign _1766 = ~ _1765;
    assign _1760 = g_cnt[15:6];
    assign _1762 = _1760 == _1134;
    assign _1763 = ~ _1762;
    assign _1767 = _1763 | _1766;
    assign _1768 = _1759 & _1767;
    assign _3234 = _1768 ? _3233 : _3231;
    assign _3235 = _1759 ? _3234 : _3231;
    assign _3236 = _1744 ? _3235 : _3231;
    assign _3237 = _1635 ? _3231 : _3236;
    assign _3227 = g_bitpos + _1484;
    assign _3228 = g_data_left ? _3227 : g_bitpos;
    assign _3229 = _1620 ? g_bitpos : _3228;
    assign _3230 = _1795 ? _3229 : g_bitpos;
    assign _3231 = _1787 ? _3230 : g_bitpos;
    assign _3238 = _1590 ? _3237 : _3231;
    assign _3240 = _1495 ? _1130 : _3238;
    assign _180 = _3240;
    always @(posedge _320) begin
        if (_318)
            g_bitpos <= _1130;
        else
            g_bitpos <= _180;
    end
    always @* begin
        case (g_bitpos)
        0:
            _3212 <= _3204;
        1:
            _3212 <= _3205;
        2:
            _3212 <= _3206;
        3:
            _3212 <= _3207;
        4:
            _3212 <= _3208;
        5:
            _3212 <= _3209;
        6:
            _3212 <= _3210;
        default:
            _3212 <= _3211;
        endcase
    end
    assign _182 = host_lane1_crc_inv;
    assign _184 = host_lane1_init;
    assign _3282 = g_crc[30:0];
    assign _3284 = { _3282,
                     _1122 };
    assign _3276 = g_crc[31:31];
    assign _3277 = _1626 ^ _3276;
    assign _3279 = _3277 ? _189 : _2116;
    assign _3273 = g_crc[30:0];
    assign _3275 = { _3273,
                     _1122 };
    assign _3280 = _3275 ^ _3279;
    assign _3281 = _1759 ? _3280 : _3272;
    assign _186 = host_lane1_crc_width;
    assign _3250 = g_left - _2924;
    assign _3251 = _2909 ? _3250 : _3248;
    assign _3252 = _1744 ? _3251 : _3248;
    assign _3253 = _1635 ? _3248 : _3252;
    assign _3244 = g_left - _2924;
    assign _3245 = g_data_left ? g_left : _3244;
    assign _3246 = _1620 ? g_left : _3245;
    assign _3247 = _1795 ? _3246 : g_left;
    assign _3248 = _1787 ? _3247 : g_left;
    assign _3254 = _1590 ? _3253 : _3248;
    assign _3255 = _3242 ? _186 : _3254;
    assign _3257 = _1495 ? _1253 : _3255;
    assign _187 = _3257;
    always @(posedge _320) begin
        if (_318)
            g_left <= _1253;
        else
            g_left <= _187;
    end
    assign _1793 = g_left == _1253;
    assign _1794 = ~ _1793;
    assign _2907 = ~ g_data_left;
    assign _2906 = _1590 & _1744;
    assign _2908 = _2906 & _2907;
    assign _2909 = _2908 & _1794;
    assign _3285 = _2909 ? _3284 : _3281;
    assign _3286 = _1744 ? _3285 : _3272;
    assign _3287 = _1635 ? _3272 : _3286;
    assign _189 = host_lane1_poly;
    assign _3264 = g_crc[31:31];
    assign _3265 = _3214 ^ _3264;
    assign _3267 = _3265 ? _189 : _2116;
    assign _3261 = g_crc[30:0];
    assign _3263 = { _3261,
                     _1122 };
    assign _3268 = _3263 ^ _3267;
    assign _3258 = g_crc[30:0];
    assign _3260 = { _3258,
                     _1122 };
    assign _3269 = g_data_left ? _3268 : _3260;
    assign _3270 = _1620 ? g_crc : _3269;
    assign _3271 = _1795 ? _3270 : g_crc;
    assign _3272 = _1787 ? _3271 : g_crc;
    assign _3288 = _1590 ? _3287 : _3272;
    assign _3289 = _1495 ? _184 : _3288;
    assign _3291 = _1493 ? _2116 : _3289;
    assign _190 = _3291;
    always @(posedge _320) begin
        if (_318)
            g_crc <= _2116;
        else
            g_crc <= _190;
    end
    assign _2913 = g_crc[31:31];
    assign _2914 = _2913 ^ _182;
    assign _3307 = _3306 ? _3304 : g_lim;
    assign _3308 = g_len_cap ? _3307 : g_lim;
    assign _191 = _3308;
    always @(posedge _320) begin
        if (_318)
            g_lim <= _1279;
        else
            g_lim <= _191;
    end
    assign _1756 = { _1279,
                     g_lim };
    assign _193 = host_lane1_frame_bits;
    assign _2888 = g_sr[14:0];
    assign _2889 = { _2888,
                     _1626 };
    assign _3309 = _1744 ? _2889 : g_sr;
    assign _3310 = _1635 ? g_sr : _3309;
    assign _3311 = _1590 ? _3310 : g_sr;
    assign _3313 = _1495 ? _1229 : _3311;
    assign _194 = _3313;
    always @(posedge _320) begin
        if (_318)
            g_sr <= _1229;
        else
            g_sr <= _194;
    end
    assign _3299 = g_sr[3:0];
    assign _196 = host_lane1_len_max;
    assign _3300 = _196 < _3299;
    assign _3301 = _3300 ? _196 : _3299;
    assign _3303 = { _1122,
                     _3301,
                     _1130 };
    assign _198 = host_lane1_skip;
    assign _3297 = { _2559,
                     _198 };
    assign _3304 = _3297 + _3303;
    assign _3305 = { _1279,
                     _3304 };
    assign _3306 = _3305 < _193;
    assign _3332 = _3306 ? _1949 : g_len_known;
    assign _200 = host_lane1_len_pos;
    assign _3318 = g_cnt[5:0];
    assign _3319 = _3318 == _200;
    assign _3314 = g_cnt[15:6];
    assign _3316 = _3314 == _1134;
    assign _202 = host_lane1_len_en;
    assign _3317 = _202 & _3316;
    assign _3320 = _3317 & _3319;
    assign _3322 = _3320 ? _1949 : g_len_cap;
    assign _3323 = _1759 ? _3322 : g_len_cap;
    assign _3324 = _1744 ? _3323 : g_len_cap;
    assign _3325 = _1635 ? g_len_cap : _3324;
    assign _3326 = _1590 ? _3325 : g_len_cap;
    assign _3328 = g_len_cap ? _1122 : _3326;
    assign _3330 = _1495 ? _1122 : _3328;
    assign _203 = _3330;
    always @(posedge _320) begin
        if (_318)
            g_len_cap <= _1122;
        else
            g_len_cap <= _203;
    end
    assign _3333 = g_len_cap ? _3332 : g_len_known;
    assign _3335 = _1495 ? _1122 : _3333;
    assign _204 = _3335;
    always @(posedge _320) begin
        if (_318)
            g_len_known <= _1122;
        else
            g_len_known <= _204;
    end
    assign _1757 = g_len_known ? _1756 : _193;
    assign _3355 = g_cnt + _4178;
    assign _1745 = _1590 & _1744;
    assign _1759 = _1745 & g_data_left;
    assign _3356 = _1759 ? _3355 : _3353;
    assign _1744 = ~ _1620;
    assign _3357 = _1744 ? _3356 : _3353;
    assign _3338 = _1635 ? _3337 : _1626;
    assign _3336 = _1795 ? _3214 : g_last;
    assign _3337 = _1787 ? _3336 : g_last;
    assign _3339 = _1590 ? _3338 : _3337;
    assign _3341 = _1495 ? _1949 : _3339;
    assign _205 = _3341;
    always @(posedge _320) begin
        if (_318)
            g_last <= vdd;
        else
            g_last <= _205;
    end
    assign _1631 = ~ g_last;
    assign _1628 = _210 == _1270;
    assign _1632 = _1628 ? _1631 : gnd;
    assign _3343 = _226 == _1270;
    assign _3344 = _3343 ? _1510 : g_prev;
    assign _3345 = _1590 ? _3344 : g_prev;
    assign _3347 = _1495 ? _1949 : _3345;
    assign _206 = _3347;
    always @(posedge _320) begin
        if (_318)
            g_prev <= vdd;
        else
            g_prev <= _206;
    end
    assign _1625 = _1510 == g_prev;
    assign _1622 = _226 == _1270;
    assign _1626 = _1622 ? _1625 : _1510;
    assign _1633 = _1626 == _1632;
    assign _1634 = ~ _1633;
    assign _1635 = _1620 & _1634;
    assign _3358 = _1635 ? _3353 : _3357;
    assign _3349 = g_cnt + _4178;
    assign _3350 = g_data_left ? _3349 : g_cnt;
    assign _3351 = _1620 ? g_cnt : _3350;
    assign _3352 = _1795 ? _3351 : g_cnt;
    assign _3353 = _1787 ? _3352 : g_cnt;
    assign _3359 = _1590 ? _3358 : _3353;
    assign _3361 = _1495 ? _1229 : _3359;
    assign _207 = _3361;
    always @(posedge _320) begin
        if (_318)
            g_cnt <= _1229;
        else
            g_cnt <= _207;
    end
    assign g_data_left = g_cnt < _1757;
    assign _3213 = g_data_left ? _3212 : _2914;
    assign _3214 = _1620 ? _1632 : _3213;
    assign _3367 = _3214 == g_last;
    assign _3365 = g_run == _1130;
    assign _3366 = ~ _3365;
    assign _3368 = _3366 & _3367;
    assign _3372 = _3368 ? _3371 : _1484;
    assign _3363 = _210 == _1271;
    assign _3377 = _3363 ? _3376 : _3372;
    assign _3378 = _1795 ? _3377 : g_run;
    assign _3379 = _1787 ? _3378 : g_run;
    assign _3397 = _1590 ? _3396 : _3379;
    assign _3399 = _1495 ? _1130 : _3397;
    assign _208 = _3399;
    always @(posedge _320) begin
        if (_318)
            g_run <= _1130;
        else
            g_run <= _208;
    end
    assign _1619 = g_run == _176;
    assign _210 = host_lane1_stuff;
    assign _1614 = _210 == _2559;
    assign _1615 = ~ _1614;
    assign _1620 = _1615 & _1619;
    assign _1788 = _1620 | g_data_left;
    assign _1795 = _1788 | _1794;
    assign _3413 = _1795 ? _3412 : _1949;
    assign _3414 = _1787 ? _3413 : f_lane1_out;
    assign _1783 = _1563 == _1229;
    assign _1781 = _1528 == _1229;
    assign _1784 = _1556 ? _1783 : _1781;
    assign _1785 = _1524 ? vdd : _1784;
    assign _1786 = _230 ? _1588 : _1785;
    assign _3406 = ~ _1786;
    assign _3403 = _226 == _1271;
    assign _3400 = ~ _232;
    assign _3401 = _1497 & _3400;
    assign _3404 = _3401 & _3403;
    assign _3405 = _3404 & _1589;
    assign _3407 = _3405 & _3406;
    assign _3415 = _3407 ? _3190 : _3414;
    assign _3417 = _1605 ? _1949 : _3415;
    assign _3419 = _1776 ? _1949 : _3417;
    assign _3421 = _1495 ? _1949 : _3419;
    assign _3423 = _1493 ? _1949 : _3421;
    assign _211 = _3423;
    always @(posedge _320) begin
        if (_318)
            f_lane1_out <= vdd;
        else
            f_lane1_out <= _211;
    end
    assign _1603 = _1510 == f_lane1_out;
    assign _1604 = ~ _1603;
    assign _1597 = _226 == _1271;
    assign _1598 = ~ _1597;
    assign _1594 = ~ _230;
    assign _213 = host_lane1_readback;
    assign _1591 = ~ _232;
    assign _1592 = _1497 & _1591;
    assign _1593 = _1592 & _213;
    assign _1595 = _1593 & _1594;
    assign _1599 = _1595 & _1598;
    assign _1600 = _1599 & _1589;
    assign _1605 = _1600 & _1604;
    assign _3488 = _1605 ? _2559 : _3486;
    assign _1586 = ~ _1580;
    assign _1587 = _1583 & _1586;
    always @(posedge _320) begin
        if (_318)
            _1583 <= _1122;
        else
            _1583 <= _1580;
    end
    assign _1584 = ~ _1583;
    assign _1576 = _362[7:7];
    assign _1575 = _362[6:6];
    assign _1574 = _362[5:5];
    assign _1573 = _362[4:4];
    assign _1572 = _362[3:3];
    assign _1571 = _362[2:2];
    assign _1570 = _362[1:1];
    assign _1569 = _362[0:0];
    assign _215 = host_lane1_clk_pin;
    always @* begin
        case (_215)
        0:
            _1577 <= _1569;
        1:
            _1577 <= _1570;
        2:
            _1577 <= _1571;
        3:
            _1577 <= _1572;
        4:
            _1577 <= _1573;
        5:
            _1577 <= _1574;
        6:
            _1577 <= _1575;
        default:
            _1577 <= _1576;
        endcase
    end
    always @(posedge _320) begin
        if (_318)
            _1580 <= _1122;
        else
            _1580 <= _1577;
    end
    assign _1585 = _1580 & _1584;
    assign _217 = host_lane1_clk_edge;
    assign _1588 = _217 ? _1587 : _1585;
    assign _1567 = _1552 == _1229;
    assign _1564 = _1563 == _1552;
    assign _1557 = _1528 == _1552;
    assign _1555 = ~ _1519;
    assign _1546 = _219[15:2];
    assign _1547 = { _2559,
                     _1546 };
    assign _1543 = _219[15:1];
    assign _1544 = { _1122,
                     _1543 };
    assign _1548 = _1544 + _1547;
    assign _1540 = _219[15:1];
    assign _1541 = { _1122,
                     _1540 };
    assign _1538 = _232 & _1521;
    assign _1549 = _1538 ? _1548 : _1541;
    always @(posedge _320) begin
        if (_318)
            _1552 <= _1229;
        else
            _1552 <= _1549;
    end
    assign _1553 = _1528 < _1552;
    assign _1530 = _219[15:2];
    assign _1531 = { _2559,
                     _1530 };
    always @(posedge _320) begin
        if (_318)
            _1534 <= _1229;
        else
            _1534 <= _1531;
    end
    assign _3469 = ~ _1519;
    assign _3470 = _1554 & _3469;
    assign _3471 = _3470 ? _1563 : _1528;
    assign _3473 = _1524 ? _1229 : _3471;
    assign _3475 = _3473 + _4178;
    assign _3453 = _3447 == _1189;
    assign _1559 = _219[15:1];
    assign _1560 = { _1122,
                     _1559 };
    always @(posedge _320) begin
        if (_318)
            _1563 <= _1229;
        else
            _1563 <= _1560;
    end
    assign _3449 = { gnd,
                     _1563 };
    assign _3450 = _3449 == _3447;
    assign _3443 = { gnd,
                     _219 };
    always @(posedge _320) begin
        if (_318)
            _3446 <= _1189;
        else
            _3446 <= _3443;
    end
    assign _3438 = 17'b00000000000000001;
    assign _219 = host_lane1_div_int;
    assign _3437 = { gnd,
                     _219 };
    assign _3439 = _3437 - _3438;
    always @(posedge _320) begin
        if (_318)
            _3442 <= _1189;
        else
            _3442 <= _3439;
    end
    assign _221 = host_lane1_div_frac;
    assign _3457 = { gnd,
                     _221 };
    assign _3459 = _3458[7:0];
    assign _3460 = _3455 ? _3459 : _3431;
    assign _3461 = _3428 ? _3460 : _3431;
    assign _3463 = _1495 ? _1279 : _3461;
    assign _222 = _3463;
    always @(posedge _320) begin
        if (_318)
            _3431 <= _1279;
        else
            _3431 <= _222;
    end
    assign _3456 = { gnd,
                     _3431 };
    assign _3458 = _3456 + _3457;
    assign _3464 = _3458[8:8];
    assign _3465 = _3455 ? _3464 : _3436;
    assign _3466 = _3428 ? _3465 : _3436;
    assign _3468 = _1495 ? _1122 : _3466;
    assign _223 = _3468;
    always @(posedge _320) begin
        if (_318)
            _3436 <= _1122;
        else
            _3436 <= _223;
    end
    assign _3447 = _3436 ? _3446 : _3442;
    assign _3433 = { gnd,
                     _1528 };
    assign _3448 = _3433 == _3447;
    assign _3451 = _1556 ? _3450 : _3448;
    assign _3454 = _1524 ? _3453 : _3451;
    assign _3432 = ~ _230;
    assign _3455 = _3432 & _3454;
    assign _3477 = _3455 ? _1229 : _3475;
    assign _3427 = ~ _230;
    assign _3425 = _1519 & _1517;
    assign _682 = g_mode == _2085;
    assign _3424 = _1497 | _682;
    assign _3426 = _3424 | _3425;
    assign _3428 = _3426 & _3427;
    assign _3478 = _3428 ? _3477 : _1528;
    assign _3480 = _1495 ? _1229 : _3478;
    assign _224 = _3480;
    always @(posedge _320) begin
        if (_318)
            _1528 <= _1229;
        else
            _1528 <= _224;
    end
    assign _1535 = _1528 < _1534;
    assign _1536 = ~ _1535;
    assign _1525 = _1517 & _1521;
    assign _1537 = _1525 & _1536;
    assign _1554 = _1537 & _1553;
    assign _1556 = _1554 & _1555;
    assign _1565 = _1556 ? _1564 : _1557;
    assign _226 = host_lane1_code;
    assign _1521 = _226 == _1271;
    assign _1522 = ~ _1521;
    assign _1519 = g_mode == _1270;
    assign _1523 = _1519 | _1522;
    assign _1516 = ~ _230;
    always @(posedge _320) begin
        if (_318)
            _1513 <= _1122;
        else
            _1513 <= _1510;
    end
    assign _1506 = _362[7:7];
    assign _1505 = _362[6:6];
    assign _1504 = _362[5:5];
    assign _1503 = _362[4:4];
    assign _1502 = _362[3:3];
    assign _1501 = _362[2:2];
    assign _1500 = _362[1:1];
    assign _1499 = _362[0:0];
    assign _228 = host_lane1_data_pin;
    always @* begin
        case (_228)
        0:
            _1507 <= _1499;
        1:
            _1507 <= _1500;
        2:
            _1507 <= _1501;
        3:
            _1507 <= _1502;
        4:
            _1507 <= _1503;
        5:
            _1507 <= _1504;
        6:
            _1507 <= _1505;
        default:
            _1507 <= _1506;
        endcase
    end
    always @(posedge _320) begin
        if (_318)
            _1510 <= _1122;
        else
            _1510 <= _1507;
    end
    assign _1514 = _1510 ^ _1513;
    assign _1515 = _232 & _1514;
    assign _1517 = _1515 & _1516;
    assign _1524 = _1517 & _1523;
    assign _1568 = _1524 ? _1567 : _1565;
    assign _230 = host_lane1_clk_pin_en;
    assign _1589 = _230 ? _1588 : _1568;
    assign _232 = host_lane1_dir;
    assign _1498 = _1497 & _232;
    assign _1590 = _1498 & _1589;
    assign _3540 = _1590 ? _3539 : _3488;
    assign _1776 = _292 == _1985;
    assign _3542 = _1776 ? _2559 : _3540;
    assign _3242 = _292 == _2484;
    assign _3549 = _3242 ? _3548 : _3542;
    assign _1495 = _292 == _1986;
    assign _3555 = _1495 ? _3554 : _3549;
    assign _1492 = _292 == _1327;
    assign _1493 = _1492 | _327;
    assign _3557 = _1493 ? _2559 : _3555;
    assign _233 = _3557;
    always @(posedge _320) begin
        if (_318)
            g_mode <= _2559;
        else
            g_mode <= _233;
    end
    assign _1497 = g_mode == _1271;
    assign _1779 = _1497 & _1778;
    assign _1787 = _1779 & _1786;
    assign _1941 = _1787 & _1940;
    assign _1943 = _1941 & _1942;
    assign _1934 = ~ _654;
    assign _1933 = _1689 & _1932;
    assign _1935 = _1933 & _1934;
    assign _1944 = _1935 | _1943;
    assign _1925 = _1921 == _1271;
    assign _1923 = _1921 == _1270;
    assign _1926 = _1923 | _1925;
    assign _3558 = _1849 & _1926;
    assign _3559 = _3558 | _1944;
    assign _234 = _3559;
    assign _3561 = _234 & _3560;
    assign _3564 = _3561 ? _3563 : _3031;
    assign _235 = _3564;
    always @(posedge _320) begin
        if (_318)
            _3031 <= _1130;
        else
            _3031 <= _235;
    end
    always @* begin
        case (_3031)
        0:
            _3089 <= _3046;
        1:
            _3089 <= _3052;
        2:
            _3089 <= _3058;
        3:
            _3089 <= _3064;
        4:
            _3089 <= _3070;
        5:
            _3089 <= _3076;
        6:
            _3089 <= _3082;
        default:
            _3089 <= _3088;
        endcase
    end
    assign _3091 = _654 ? _1277 : _3089;
    assign _3182 = g_byte_0[7:1];
    assign _3183 = { _1474,
                     _3182 };
    assign _3180 = g_byte_0[6:0];
    assign _3181 = { _3180,
                     _1474 };
    assign _3184 = _238 ? _3183 : _3181;
    assign _3569 = _1670 ? _3184 : _3568;
    assign _3570 = _1661 ? _3569 : _3568;
    assign _3571 = _1646 ? _3570 : _3568;
    assign _3572 = _1483 ? _3568 : _3571;
    assign _3565 = g_data_left_0 ? _3092 : g_byte_0;
    assign _3566 = _1468 ? g_byte_0 : _3565;
    assign _3567 = _1697 ? _3566 : g_byte_0;
    assign _3568 = _1689 ? _3567 : g_byte_0;
    assign _3573 = _1438 ? _3572 : _3568;
    assign _236 = _3573;
    always @(posedge _320) begin
        if (_318)
            g_byte_0 <= _1279;
        else
            g_byte_0 <= _236;
    end
    assign _1931 = g_bitpos_0 == _1130;
    assign _1928 = ~ _1468;
    assign _1929 = _1928 & g_data_left_0;
    assign _1932 = _1929 & _1931;
    assign _3092 = _1932 ? _3091 : g_byte_0;
    assign _3093 = _3092[0:0];
    assign _3101 = { _3093,
                     _3094,
                     _3095,
                     _3096,
                     _3097,
                     _3098,
                     _3099,
                     _3100 };
    assign _238 = host_lane0_lsb_first;
    assign _3102 = _238 ? _3092 : _3101;
    assign _3103 = _3102[0:0];
    assign _3581 = g_bitpos_0 + _1484;
    assign _3582 = _1670 ? _3581 : _3579;
    assign _3583 = _1661 ? _3582 : _3579;
    assign _3584 = _1646 ? _3583 : _3579;
    assign _3585 = _1483 ? _3579 : _3584;
    assign _3575 = g_bitpos_0 + _1484;
    assign _3576 = g_data_left_0 ? _3575 : g_bitpos_0;
    assign _3577 = _1468 ? g_bitpos_0 : _3576;
    assign _3578 = _1697 ? _3577 : g_bitpos_0;
    assign _3579 = _1689 ? _3578 : g_bitpos_0;
    assign _3586 = _1438 ? _3585 : _3579;
    assign _3588 = _1343 ? _1130 : _3586;
    assign _239 = _3588;
    always @(posedge _320) begin
        if (_318)
            g_bitpos_0 <= _1130;
        else
            g_bitpos_0 <= _239;
    end
    always @* begin
        case (g_bitpos_0)
        0:
            _3111 <= _3103;
        1:
            _3111 <= _3104;
        2:
            _3111 <= _3105;
        3:
            _3111 <= _3106;
        4:
            _3111 <= _3107;
        5:
            _3111 <= _3108;
        6:
            _3111 <= _3109;
        default:
            _3111 <= _3110;
        endcase
    end
    assign _241 = host_lane0_crc_inv;
    assign _243 = host_lane0_init;
    assign _3630 = g_crc_0[30:0];
    assign _3632 = { _3630,
                     _1122 };
    assign _3624 = g_crc_0[31:31];
    assign _3625 = _1474 ^ _3624;
    assign _3627 = _3625 ? _248 : _2116;
    assign _3621 = g_crc_0[30:0];
    assign _3623 = { _3621,
                     _1122 };
    assign _3628 = _3623 ^ _3627;
    assign _3629 = _1661 ? _3628 : _3620;
    assign _245 = host_lane0_crc_width;
    assign _3598 = g_left_0 - _2924;
    assign _3599 = _2969 ? _3598 : _3596;
    assign _3600 = _1646 ? _3599 : _3596;
    assign _3601 = _1483 ? _3596 : _3600;
    assign _3592 = g_left_0 - _2924;
    assign _3593 = g_data_left_0 ? g_left_0 : _3592;
    assign _3594 = _1468 ? g_left_0 : _3593;
    assign _3595 = _1697 ? _3594 : g_left_0;
    assign _3596 = _1689 ? _3595 : g_left_0;
    assign _3602 = _1438 ? _3601 : _3596;
    assign _3603 = _3590 ? _245 : _3602;
    assign _3605 = _1343 ? _1253 : _3603;
    assign _246 = _3605;
    always @(posedge _320) begin
        if (_318)
            g_left_0 <= _1253;
        else
            g_left_0 <= _246;
    end
    assign _1695 = g_left_0 == _1253;
    assign _1696 = ~ _1695;
    assign _2967 = ~ g_data_left_0;
    assign _2966 = _1438 & _1646;
    assign _2968 = _2966 & _2967;
    assign _2969 = _2968 & _1696;
    assign _3633 = _2969 ? _3632 : _3629;
    assign _3634 = _1646 ? _3633 : _3620;
    assign _3635 = _1483 ? _3620 : _3634;
    assign _248 = host_lane0_poly;
    assign _3612 = g_crc_0[31:31];
    assign _3613 = _3113 ^ _3612;
    assign _3615 = _3613 ? _248 : _2116;
    assign _3609 = g_crc_0[30:0];
    assign _3611 = { _3609,
                     _1122 };
    assign _3616 = _3611 ^ _3615;
    assign _3606 = g_crc_0[30:0];
    assign _3608 = { _3606,
                     _1122 };
    assign _3617 = g_data_left_0 ? _3616 : _3608;
    assign _3618 = _1468 ? g_crc_0 : _3617;
    assign _3619 = _1697 ? _3618 : g_crc_0;
    assign _3620 = _1689 ? _3619 : g_crc_0;
    assign _3636 = _1438 ? _3635 : _3620;
    assign _3637 = _1343 ? _243 : _3636;
    assign _3639 = _1341 ? _2116 : _3637;
    assign _249 = _3639;
    always @(posedge _320) begin
        if (_318)
            g_crc_0 <= _2116;
        else
            g_crc_0 <= _249;
    end
    assign _2973 = g_crc_0[31:31];
    assign _2974 = _2973 ^ _241;
    assign _3655 = _3654 ? _3652 : g_lim_0;
    assign _3656 = g_len_cap_0 ? _3655 : g_lim_0;
    assign _250 = _3656;
    always @(posedge _320) begin
        if (_318)
            g_lim_0 <= _1279;
        else
            g_lim_0 <= _250;
    end
    assign _1658 = { _1279,
                     g_lim_0 };
    assign _252 = host_lane0_frame_bits;
    assign _2948 = g_sr_0[14:0];
    assign _2949 = { _2948,
                     _1474 };
    assign _3657 = _1646 ? _2949 : g_sr_0;
    assign _3658 = _1483 ? g_sr_0 : _3657;
    assign _3659 = _1438 ? _3658 : g_sr_0;
    assign _3661 = _1343 ? _1229 : _3659;
    assign _253 = _3661;
    always @(posedge _320) begin
        if (_318)
            g_sr_0 <= _1229;
        else
            g_sr_0 <= _253;
    end
    assign _3647 = g_sr_0[3:0];
    assign _255 = host_lane0_len_max;
    assign _3648 = _255 < _3647;
    assign _3649 = _3648 ? _255 : _3647;
    assign _3651 = { _1122,
                     _3649,
                     _1130 };
    assign _257 = host_lane0_skip;
    assign _3645 = { _2559,
                     _257 };
    assign _3652 = _3645 + _3651;
    assign _3653 = { _1279,
                     _3652 };
    assign _3654 = _3653 < _252;
    assign _3680 = _3654 ? _1949 : g_len_known_0;
    assign _259 = host_lane0_len_pos;
    assign _3666 = g_cnt_0[5:0];
    assign _3667 = _3666 == _259;
    assign _3662 = g_cnt_0[15:6];
    assign _3664 = _3662 == _1134;
    assign _261 = host_lane0_len_en;
    assign _3665 = _261 & _3664;
    assign _3668 = _3665 & _3667;
    assign _3670 = _3668 ? _1949 : g_len_cap_0;
    assign _3671 = _1661 ? _3670 : g_len_cap_0;
    assign _3672 = _1646 ? _3671 : g_len_cap_0;
    assign _3673 = _1483 ? g_len_cap_0 : _3672;
    assign _3674 = _1438 ? _3673 : g_len_cap_0;
    assign _3676 = g_len_cap_0 ? _1122 : _3674;
    assign _3678 = _1343 ? _1122 : _3676;
    assign _262 = _3678;
    always @(posedge _320) begin
        if (_318)
            g_len_cap_0 <= _1122;
        else
            g_len_cap_0 <= _262;
    end
    assign _3681 = g_len_cap_0 ? _3680 : g_len_known_0;
    assign _3683 = _1343 ? _1122 : _3681;
    assign _263 = _3683;
    always @(posedge _320) begin
        if (_318)
            g_len_known_0 <= _1122;
        else
            g_len_known_0 <= _263;
    end
    assign _1659 = g_len_known_0 ? _1658 : _252;
    assign _3703 = g_cnt_0 + _4178;
    assign _3704 = _1661 ? _3703 : _3701;
    assign _1646 = ~ _1468;
    assign _3705 = _1646 ? _3704 : _3701;
    assign _3686 = _1483 ? _3685 : _1474;
    assign _3684 = _1697 ? _3113 : g_last_0;
    assign _3685 = _1689 ? _3684 : g_last_0;
    assign _3687 = _1438 ? _3686 : _3685;
    assign _3689 = _1343 ? _1949 : _3687;
    assign _264 = _3689;
    always @(posedge _320) begin
        if (_318)
            g_last_0 <= vdd;
        else
            g_last_0 <= _264;
    end
    assign _1479 = ~ g_last_0;
    assign _1476 = _269 == _1270;
    assign _1480 = _1476 ? _1479 : gnd;
    assign _3691 = _285 == _1270;
    assign _3692 = _3691 ? _1358 : g_prev_0;
    assign _3693 = _1438 ? _3692 : g_prev_0;
    assign _3695 = _1343 ? _1949 : _3693;
    assign _265 = _3695;
    always @(posedge _320) begin
        if (_318)
            g_prev_0 <= vdd;
        else
            g_prev_0 <= _265;
    end
    assign _1473 = _1358 == g_prev_0;
    assign _1470 = _285 == _1270;
    assign _1474 = _1470 ? _1473 : _1358;
    assign _1481 = _1474 == _1480;
    assign _1482 = ~ _1481;
    assign _1483 = _1468 & _1482;
    assign _3706 = _1483 ? _3701 : _3705;
    assign _3697 = g_cnt_0 + _4178;
    assign _3698 = g_data_left_0 ? _3697 : g_cnt_0;
    assign _3699 = _1468 ? g_cnt_0 : _3698;
    assign _3700 = _1697 ? _3699 : g_cnt_0;
    assign _3701 = _1689 ? _3700 : g_cnt_0;
    assign _3707 = _1438 ? _3706 : _3701;
    assign _3709 = _1343 ? _1229 : _3707;
    assign _266 = _3709;
    always @(posedge _320) begin
        if (_318)
            g_cnt_0 <= _1229;
        else
            g_cnt_0 <= _266;
    end
    assign g_data_left_0 = g_cnt_0 < _1659;
    assign _3112 = g_data_left_0 ? _3111 : _2974;
    assign _3113 = _1468 ? _1480 : _3112;
    assign _3715 = _3113 == g_last_0;
    assign _3713 = g_run_0 == _1130;
    assign _3714 = ~ _3713;
    assign _3716 = _3714 & _3715;
    assign _3720 = _3716 ? _3719 : _1484;
    assign _3711 = _269 == _1271;
    assign _3725 = _3711 ? _3724 : _3720;
    assign _3726 = _1697 ? _3725 : g_run_0;
    assign _3727 = _1689 ? _3726 : g_run_0;
    assign _3745 = _1438 ? _3744 : _3727;
    assign _3747 = _1343 ? _1130 : _3745;
    assign _267 = _3747;
    always @(posedge _320) begin
        if (_318)
            g_run_0 <= _1130;
        else
            g_run_0 <= _267;
    end
    assign _1467 = g_run_0 == _163;
    assign _269 = host_lane0_stuff;
    assign _1462 = _269 == _2559;
    assign _1463 = ~ _1462;
    assign _1468 = _1463 & _1467;
    assign _1690 = _1468 | g_data_left_0;
    assign _1697 = _1690 | _1696;
    assign _3761 = _1697 ? _3760 : _1949;
    assign _1680 = ~ _291;
    assign _1681 = _1345 & _1680;
    assign _1689 = _1681 & _1688;
    assign _3762 = _1689 ? _3761 : f_lane0_out;
    assign _1685 = _1411 == _1229;
    assign _1683 = _1376 == _1229;
    assign _1686 = _1404 ? _1685 : _1683;
    assign _1687 = _1372 ? vdd : _1686;
    assign _1688 = _287 ? _1436 : _1687;
    assign _3754 = ~ _1688;
    assign _3751 = _285 == _1271;
    assign _3748 = ~ _291;
    assign _3749 = _1345 & _3748;
    assign _3752 = _3749 & _3751;
    assign _3753 = _3752 & _1437;
    assign _3755 = _3753 & _3754;
    assign _3763 = _3755 ? _3025 : _3762;
    assign _3765 = _1453 ? _1949 : _3763;
    assign _3767 = _1678 ? _1949 : _3765;
    assign _3769 = _1343 ? _1949 : _3767;
    assign _3771 = _1341 ? _1949 : _3769;
    assign _270 = _3771;
    always @(posedge _320) begin
        if (_318)
            f_lane0_out <= vdd;
        else
            f_lane0_out <= _270;
    end
    assign _1451 = _1358 == f_lane0_out;
    assign _1452 = ~ _1451;
    assign _1434 = ~ _1428;
    assign _1435 = _1431 & _1434;
    always @(posedge _320) begin
        if (_318)
            _1431 <= _1122;
        else
            _1431 <= _1428;
    end
    assign _1432 = ~ _1431;
    assign _1424 = _362[7:7];
    assign _1423 = _362[6:6];
    assign _1422 = _362[5:5];
    assign _1421 = _362[4:4];
    assign _1420 = _362[3:3];
    assign _1419 = _362[2:2];
    assign _1418 = _362[1:1];
    assign _1417 = _362[0:0];
    assign _272 = host_lane0_clk_pin;
    always @* begin
        case (_272)
        0:
            _1425 <= _1417;
        1:
            _1425 <= _1418;
        2:
            _1425 <= _1419;
        3:
            _1425 <= _1420;
        4:
            _1425 <= _1421;
        5:
            _1425 <= _1422;
        6:
            _1425 <= _1423;
        default:
            _1425 <= _1424;
        endcase
    end
    always @(posedge _320) begin
        if (_318)
            _1428 <= _1122;
        else
            _1428 <= _1425;
    end
    assign _1433 = _1428 & _1432;
    assign _274 = host_lane0_clk_edge;
    assign _1436 = _274 ? _1435 : _1433;
    assign _1415 = _1400 == _1229;
    assign _1412 = _1411 == _1400;
    assign _1405 = _1376 == _1400;
    assign _1403 = ~ _1367;
    assign _1394 = _276[15:2];
    assign _1395 = { _2559,
                     _1394 };
    assign _1391 = _276[15:1];
    assign _1392 = { _1122,
                     _1391 };
    assign _1396 = _1392 + _1395;
    assign _1388 = _276[15:1];
    assign _1389 = { _1122,
                     _1388 };
    assign _1386 = _291 & _1369;
    assign _1397 = _1386 ? _1396 : _1389;
    always @(posedge _320) begin
        if (_318)
            _1400 <= _1229;
        else
            _1400 <= _1397;
    end
    assign _1401 = _1376 < _1400;
    assign _1378 = _276[15:2];
    assign _1379 = { _2559,
                     _1378 };
    always @(posedge _320) begin
        if (_318)
            _1382 <= _1229;
        else
            _1382 <= _1379;
    end
    assign _3817 = ~ _1367;
    assign _3818 = _1402 & _3817;
    assign _3819 = _3818 ? _1411 : _1376;
    assign _3821 = _1372 ? _1229 : _3819;
    assign _3823 = _3821 + _4178;
    assign _3801 = _3795 == _1189;
    assign _1407 = _276[15:1];
    assign _1408 = { _1122,
                     _1407 };
    always @(posedge _320) begin
        if (_318)
            _1411 <= _1229;
        else
            _1411 <= _1408;
    end
    assign _3797 = { gnd,
                     _1411 };
    assign _3798 = _3797 == _3795;
    assign _3791 = { gnd,
                     _276 };
    always @(posedge _320) begin
        if (_318)
            _3794 <= _1189;
        else
            _3794 <= _3791;
    end
    assign _276 = host_lane0_div_int;
    assign _3785 = { gnd,
                     _276 };
    assign _3787 = _3785 - _3438;
    always @(posedge _320) begin
        if (_318)
            _3790 <= _1189;
        else
            _3790 <= _3787;
    end
    assign _278 = host_lane0_div_frac;
    assign _3805 = { gnd,
                     _278 };
    assign _3807 = _3806[7:0];
    assign _3808 = _3803 ? _3807 : _3779;
    assign _3809 = _3776 ? _3808 : _3779;
    assign _3811 = _1343 ? _1279 : _3809;
    assign _279 = _3811;
    always @(posedge _320) begin
        if (_318)
            _3779 <= _1279;
        else
            _3779 <= _279;
    end
    assign _3804 = { gnd,
                     _3779 };
    assign _3806 = _3804 + _3805;
    assign _3812 = _3806[8:8];
    assign _3813 = _3803 ? _3812 : _3784;
    assign _3814 = _3776 ? _3813 : _3784;
    assign _3816 = _1343 ? _1122 : _3814;
    assign _280 = _3816;
    always @(posedge _320) begin
        if (_318)
            _3784 <= _1122;
        else
            _3784 <= _280;
    end
    assign _3795 = _3784 ? _3794 : _3790;
    assign _3781 = { gnd,
                     _1376 };
    assign _3796 = _3781 == _3795;
    assign _3799 = _1404 ? _3798 : _3796;
    assign _3802 = _1372 ? _3801 : _3799;
    assign _3780 = ~ _287;
    assign _3803 = _3780 & _3802;
    assign _3825 = _3803 ? _1229 : _3823;
    assign _3775 = ~ _287;
    assign _3773 = _1367 & _1365;
    assign _668 = g_mode_0 == _2085;
    assign _3772 = _1345 | _668;
    assign _3774 = _3772 | _3773;
    assign _3776 = _3774 & _3775;
    assign _3826 = _3776 ? _3825 : _1376;
    assign _3828 = _1343 ? _1229 : _3826;
    assign _281 = _3828;
    always @(posedge _320) begin
        if (_318)
            _1376 <= _1229;
        else
            _1376 <= _281;
    end
    assign _1383 = _1376 < _1382;
    assign _1384 = ~ _1383;
    assign _1373 = _1365 & _1369;
    assign _1385 = _1373 & _1384;
    assign _1402 = _1385 & _1401;
    assign _1404 = _1402 & _1403;
    assign _1413 = _1404 ? _1412 : _1405;
    assign _1369 = _285 == _1271;
    assign _1370 = ~ _1369;
    assign _1367 = g_mode_0 == _1270;
    assign _1371 = _1367 | _1370;
    assign _1364 = ~ _287;
    always @(posedge _320) begin
        if (_318)
            _1361 <= _1122;
        else
            _1361 <= _1358;
    end
    assign _1354 = _362[7:7];
    assign _1353 = _362[6:6];
    assign _1352 = _362[5:5];
    assign _1351 = _362[4:4];
    assign _1350 = _362[3:3];
    assign _1349 = _362[2:2];
    assign _1348 = _362[1:1];
    assign _1347 = _362[0:0];
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
    always @(posedge _320) begin
        if (_318)
            _1358 <= _1122;
        else
            _1358 <= _1355;
    end
    assign _1362 = _1358 ^ _1361;
    assign _1363 = _291 & _1362;
    assign _1365 = _1363 & _1364;
    assign _1372 = _1365 & _1371;
    assign _1416 = _1372 ? _1415 : _1413;
    assign _1437 = _287 ? _1436 : _1416;
    assign _285 = host_lane0_code;
    assign _1445 = _285 == _1271;
    assign _1446 = ~ _1445;
    assign _287 = host_lane0_clk_pin_en;
    assign _1442 = ~ _287;
    assign _289 = host_lane0_readback;
    assign _291 = host_lane0_dir;
    assign _1439 = ~ _291;
    assign _1440 = _1345 & _1439;
    assign _1441 = _1440 & _289;
    assign _1443 = _1441 & _1442;
    assign _1447 = _1443 & _1446;
    assign _1448 = _1447 & _1437;
    assign _1453 = _1448 & _1452;
    assign _3840 = _1453 ? _2559 : _3838;
    assign _3892 = _1438 ? _3891 : _3840;
    assign _1678 = _292 == _1457;
    assign _3894 = _1678 ? _2559 : _3892;
    assign _3590 = _292 == _1989;
    assign _3901 = _3590 ? _3900 : _3894;
    assign _1343 = _292 == _1484;
    assign _3907 = _1343 ? _3906 : _3901;
    assign _2609 = _767[90:88];
    assign _2608 = _761[90:88];
    assign _2607 = _755[90:88];
    assign _2606 = _358[90:88];
    always @* begin
        case (f_winner)
        0:
            _2610 <= _2606;
        1:
            _2610 <= _2607;
        2:
            _2610 <= _2608;
        default:
            _2610 <= _2609;
        endcase
    end
    assign _2602 = _767[87:87];
    assign _2601 = _761[87:87];
    assign _2600 = _755[87:87];
    assign _2599 = _358[87:87];
    always @* begin
        case (f_winner)
        0:
            _2603 <= _2599;
        1:
            _2603 <= _2600;
        2:
            _2603 <= _2601;
        default:
            _2603 <= _2602;
        endcase
    end
    assign _3829 = ~ _2603;
    assign _3830 = _1246 & _3829;
    assign _3832 = _3830 ? _2610 : _1130;
    assign _292 = _3832;
    assign _1340 = _292 == _1327;
    assign _1341 = _1340 | _327;
    assign _3909 = _1341 ? _2559 : _3907;
    assign _293 = _3909;
    always @(posedge _320) begin
        if (_318)
            g_mode_0 <= _2559;
        else
            g_mode_0 <= _293;
    end
    assign _1345 = g_mode_0 == _1271;
    assign _1346 = _1345 & _291;
    assign _1438 = _1346 & _1437;
    assign _1647 = _1438 & _1646;
    assign _1661 = _1647 & g_data_left_0;
    assign _1670 = _1661 & _1669;
    assign _1676 = _1670 & _1675;
    assign _1712 = _1676 | _1711;
    assign _3009 = _1712 | _1814;
    assign _295 = host_rx_to_tx;
    assign _3010 = _295 & _3009;
    assign _296 = _3010;
    assign _3037 = _296 | _3036;
    assign _3039 = _3037 & _3038;
    assign _3910 = _3039 ^ _3561;
    assign _3916 = _3910 ? _3915 : _297;
    always @(posedge _320) begin
        if (_318)
            _3919 <= _2108;
        else
            _3919 <= _3916;
    end
    assign _297 = _3919;
    assign _654 = _297 == _2108;
    assign _3921 = _654 ? _1277 : _3089;
    assign _1920 = _750[28:27];
    assign _1918 = _767[95:94];
    assign _1917 = _761[95:94];
    assign _1916 = _755[95:94];
    assign _1915 = _358[95:94];
    always @* begin
        case (f_winner)
        0:
            _1919 <= _1915;
        1:
            _1919 <= _1916;
        2:
            _1919 <= _1917;
        default:
            _1919 <= _1918;
        endcase
    end
    assign _1921 = _1848 ? _1920 : _1919;
    always @* begin
        case (_1921)
        0:
            _3933 <= _647;
        1:
            _3933 <= _3921;
        2:
            _3933 <= _3930;
        default:
            _3933 <= _3932;
        endcase
    end
    assign _3934 = _1849 ? _3933 : _647;
    assign _298 = _3934;
    always @(posedge _320) begin
        if (_318)
            _647 <= _1279;
        else
            _647 <= _298;
    end
    assign _648 = _647[0:0];
    assign _3945 = 8'b00001000;
    assign _3944 = 8'b00000111;
    assign _3943 = _642 - _1736;
    assign _3940 = _750[30:29];
    assign _767 = _357[511:400];
    assign _3938 = _767[99:98];
    assign _761 = _357[399:288];
    assign _3937 = _761[99:98];
    assign _3936 = _755[99:98];
    assign _3935 = _358[99:98];
    always @* begin
        case (f_winner)
        0:
            _3939 <= _3935;
        1:
            _3939 <= _3936;
        2:
            _3939 <= _3937;
        default:
            _3939 <= _3938;
        endcase
    end
    assign _3941 = _1848 ? _3940 : _3939;
    always @* begin
        case (_3941)
        0:
            _3946 <= _642;
        1:
            _3946 <= _3943;
        2:
            _3946 <= _3944;
        default:
            _3946 <= _3945;
        endcase
    end
    assign _3947 = _1849 ? _3946 : _642;
    assign _299 = _3947;
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
    assign _602 = _598 + _1484;
    assign _3962 = _598 + _1484;
    assign _3958 = _598 == _2484;
    assign _3959 = ~ _3958;
    assign _3956 = _378[0:0];
    assign _3960 = _3956 & _3959;
    assign _3963 = _3960 ? _3962 : _598;
    assign _3953 = _378[0:0];
    assign _3954 = ~ _3953;
    assign _3952 = f_chg_now[0:0];
    assign _3955 = _3952 & _3954;
    assign _3965 = _3955 ? _1484 : _3963;
    assign _3949 = _342 == _1271;
    assign _3951 = _3949 ? _1130 : _598;
    assign _3948 = _342 == _1270;
    assign _3966 = _3948 ? _3965 : _3951;
    assign _300 = _3966;
    always @(posedge _320) begin
        if (_318)
            _598 <= _1130;
        else
            _598 <= _300;
    end
    assign _600 = _598 == _2484;
    assign _603 = _600 ? _598 : _602;
    assign _593 = _378[0:0];
    assign _594 = ~ _593;
    assign _592 = f_chg_now[0:0];
    assign _595 = _592 & _594;
    assign _605 = _595 ? _1484 : _603;
    assign _589 = f_changed_all[0:0];
    assign _590 = f_in_fetch & _589;
    assign _606 = _590 ? _605 : _1130;
    assign _838 = _808[0:0];
    assign _840 = _838 ? _606 : _1130;
    assign _581 = _577 + _1484;
    assign _3981 = _577 + _1484;
    assign _3977 = _577 == _2484;
    assign _3978 = ~ _3977;
    assign _3975 = _378[1:1];
    assign _3979 = _3975 & _3978;
    assign _3982 = _3979 ? _3981 : _577;
    assign _3972 = _378[1:1];
    assign _3973 = ~ _3972;
    assign _3971 = f_chg_now[1:1];
    assign _3974 = _3971 & _3973;
    assign _3984 = _3974 ? _1484 : _3982;
    assign _3968 = _342 == _1271;
    assign _3970 = _3968 ? _1130 : _577;
    assign _3967 = _342 == _1270;
    assign _3985 = _3967 ? _3984 : _3970;
    assign _301 = _3985;
    always @(posedge _320) begin
        if (_318)
            _577 <= _1130;
        else
            _577 <= _301;
    end
    assign _579 = _577 == _2484;
    assign _582 = _579 ? _577 : _581;
    assign _572 = _378[1:1];
    assign _573 = ~ _572;
    assign _571 = f_chg_now[1:1];
    assign _574 = _571 & _573;
    assign _584 = _574 ? _1484 : _582;
    assign _568 = f_changed_all[1:1];
    assign _569 = f_in_fetch & _568;
    assign _585 = _569 ? _584 : _1130;
    assign _835 = _808[1:1];
    assign _837 = _835 ? _585 : _1130;
    assign _841 = _837 < _840;
    assign _842 = _841 ? _840 : _837;
    assign _558 = _554 + _1484;
    assign _4000 = _554 + _1484;
    assign _3996 = _554 == _2484;
    assign _3997 = ~ _3996;
    assign _3994 = _378[2:2];
    assign _3998 = _3994 & _3997;
    assign _4001 = _3998 ? _4000 : _554;
    assign _3991 = _378[2:2];
    assign _3992 = ~ _3991;
    assign _3990 = f_chg_now[2:2];
    assign _3993 = _3990 & _3992;
    assign _4003 = _3993 ? _1484 : _4001;
    assign _3987 = _342 == _1271;
    assign _3989 = _3987 ? _1130 : _554;
    assign _3986 = _342 == _1270;
    assign _4004 = _3986 ? _4003 : _3989;
    assign _302 = _4004;
    always @(posedge _320) begin
        if (_318)
            _554 <= _1130;
        else
            _554 <= _302;
    end
    assign _556 = _554 == _2484;
    assign _559 = _556 ? _554 : _558;
    assign _549 = _378[2:2];
    assign _550 = ~ _549;
    assign _548 = f_chg_now[2:2];
    assign _551 = _548 & _550;
    assign _561 = _551 ? _1484 : _559;
    assign _545 = f_changed_all[2:2];
    assign _546 = f_in_fetch & _545;
    assign _562 = _546 ? _561 : _1130;
    assign _830 = _808[2:2];
    assign _832 = _830 ? _562 : _1130;
    assign _537 = _533 + _1484;
    assign _4019 = _533 + _1484;
    assign _4015 = _533 == _2484;
    assign _4016 = ~ _4015;
    assign _4013 = _378[3:3];
    assign _4017 = _4013 & _4016;
    assign _4020 = _4017 ? _4019 : _533;
    assign _4010 = _378[3:3];
    assign _4011 = ~ _4010;
    assign _4009 = f_chg_now[3:3];
    assign _4012 = _4009 & _4011;
    assign _4022 = _4012 ? _1484 : _4020;
    assign _4006 = _342 == _1271;
    assign _4008 = _4006 ? _1130 : _533;
    assign _4005 = _342 == _1270;
    assign _4023 = _4005 ? _4022 : _4008;
    assign _303 = _4023;
    always @(posedge _320) begin
        if (_318)
            _533 <= _1130;
        else
            _533 <= _303;
    end
    assign _535 = _533 == _2484;
    assign _538 = _535 ? _533 : _537;
    assign _528 = _378[3:3];
    assign _529 = ~ _528;
    assign _527 = f_chg_now[3:3];
    assign _530 = _527 & _529;
    assign _540 = _530 ? _1484 : _538;
    assign _524 = f_changed_all[3:3];
    assign _525 = f_in_fetch & _524;
    assign _541 = _525 ? _540 : _1130;
    assign _827 = _808[3:3];
    assign _829 = _827 ? _541 : _1130;
    assign _833 = _829 < _832;
    assign _834 = _833 ? _832 : _829;
    assign _843 = _834 < _842;
    assign _844 = _843 ? _842 : _834;
    assign _512 = _508 + _1484;
    assign _4038 = _508 + _1484;
    assign _4034 = _508 == _2484;
    assign _4035 = ~ _4034;
    assign _4032 = _378[4:4];
    assign _4036 = _4032 & _4035;
    assign _4039 = _4036 ? _4038 : _508;
    assign _4029 = _378[4:4];
    assign _4030 = ~ _4029;
    assign _4028 = f_chg_now[4:4];
    assign _4031 = _4028 & _4030;
    assign _4041 = _4031 ? _1484 : _4039;
    assign _4025 = _342 == _1271;
    assign _4027 = _4025 ? _1130 : _508;
    assign _4024 = _342 == _1270;
    assign _4042 = _4024 ? _4041 : _4027;
    assign _304 = _4042;
    always @(posedge _320) begin
        if (_318)
            _508 <= _1130;
        else
            _508 <= _304;
    end
    assign _510 = _508 == _2484;
    assign _513 = _510 ? _508 : _512;
    assign _503 = _378[4:4];
    assign _504 = ~ _503;
    assign _502 = f_chg_now[4:4];
    assign _505 = _502 & _504;
    assign _515 = _505 ? _1484 : _513;
    assign _499 = f_changed_all[4:4];
    assign _500 = f_in_fetch & _499;
    assign _516 = _500 ? _515 : _1130;
    assign _820 = _808[4:4];
    assign _822 = _820 ? _516 : _1130;
    assign _491 = _487 + _1484;
    assign _4057 = _487 + _1484;
    assign _4053 = _487 == _2484;
    assign _4054 = ~ _4053;
    assign _4051 = _378[5:5];
    assign _4055 = _4051 & _4054;
    assign _4058 = _4055 ? _4057 : _487;
    assign _4048 = _378[5:5];
    assign _4049 = ~ _4048;
    assign _4047 = f_chg_now[5:5];
    assign _4050 = _4047 & _4049;
    assign _4060 = _4050 ? _1484 : _4058;
    assign _4044 = _342 == _1271;
    assign _4046 = _4044 ? _1130 : _487;
    assign _4043 = _342 == _1270;
    assign _4061 = _4043 ? _4060 : _4046;
    assign _305 = _4061;
    always @(posedge _320) begin
        if (_318)
            _487 <= _1130;
        else
            _487 <= _305;
    end
    assign _489 = _487 == _2484;
    assign _492 = _489 ? _487 : _491;
    assign _482 = _378[5:5];
    assign _483 = ~ _482;
    assign _481 = f_chg_now[5:5];
    assign _484 = _481 & _483;
    assign _494 = _484 ? _1484 : _492;
    assign _478 = f_changed_all[5:5];
    assign _479 = f_in_fetch & _478;
    assign _495 = _479 ? _494 : _1130;
    assign _817 = _808[5:5];
    assign _819 = _817 ? _495 : _1130;
    assign _823 = _819 < _822;
    assign _824 = _823 ? _822 : _819;
    assign _468 = _464 + _1484;
    assign _4076 = _464 + _1484;
    assign _4072 = _464 == _2484;
    assign _4073 = ~ _4072;
    assign _4070 = _378[6:6];
    assign _4074 = _4070 & _4073;
    assign _4077 = _4074 ? _4076 : _464;
    assign _4067 = _378[6:6];
    assign _4068 = ~ _4067;
    assign _4066 = f_chg_now[6:6];
    assign _4069 = _4066 & _4068;
    assign _4079 = _4069 ? _1484 : _4077;
    assign _4063 = _342 == _1271;
    assign _4065 = _4063 ? _1130 : _464;
    assign _4062 = _342 == _1270;
    assign _4080 = _4062 ? _4079 : _4065;
    assign _306 = _4080;
    always @(posedge _320) begin
        if (_318)
            _464 <= _1130;
        else
            _464 <= _306;
    end
    assign _466 = _464 == _2484;
    assign _469 = _466 ? _464 : _468;
    assign _459 = _378[6:6];
    assign _460 = ~ _459;
    assign _458 = f_chg_now[6:6];
    assign _461 = _458 & _460;
    assign _471 = _461 ? _1484 : _469;
    assign _455 = f_changed_all[6:6];
    assign _456 = f_in_fetch & _455;
    assign _472 = _456 ? _471 : _1130;
    assign _812 = _808[6:6];
    assign _814 = _812 ? _472 : _1130;
    assign _447 = _443 + _1484;
    assign _4095 = _443 + _1484;
    assign _4091 = _443 == _2484;
    assign _4092 = ~ _4091;
    assign _4089 = _378[7:7];
    assign _4093 = _4089 & _4092;
    assign _4096 = _4093 ? _4095 : _443;
    assign _4086 = _378[7:7];
    assign _4087 = ~ _4086;
    assign _4085 = f_chg_now[7:7];
    assign _4088 = _4085 & _4087;
    assign _4098 = _4088 ? _1484 : _4096;
    assign _4082 = _342 == _1271;
    assign _4084 = _4082 ? _1130 : _443;
    assign _4081 = _342 == _1270;
    assign _4099 = _4081 ? _4098 : _4084;
    assign _307 = _4099;
    always @(posedge _320) begin
        if (_318)
            _443 <= _1130;
        else
            _443 <= _307;
    end
    assign _445 = _443 == _2484;
    assign _448 = _445 ? _443 : _447;
    assign _438 = _378[7:7];
    assign _439 = ~ _438;
    assign _437 = f_chg_now[7:7];
    assign _440 = _437 & _439;
    assign _450 = _440 ? _1484 : _448;
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
    assign _4102 = _409 == _1484;
    assign _4103 = _4102 ? _312 : _356;
    assign _4100 = _342 == _1270;
    assign _4104 = _4100 ? _4103 : _356;
    assign _308 = _4104;
    always @(posedge _320) begin
        if (_318)
            _356 <= _346;
        else
            _356 <= _308;
    end
    assign _423 = _409 == _1484;
    assign _424 = f_in_fetch & _423;
    assign _425 = _424 ? _312 : _356;
    assign _4107 = _409 == _1457;
    assign _4108 = _4107 ? _312 : _353;
    assign _4105 = _342 == _1270;
    assign _4109 = _4105 ? _4108 : _353;
    assign _309 = _4109;
    always @(posedge _320) begin
        if (_318)
            _353 <= _346;
        else
            _353 <= _309;
    end
    assign _419 = _409 == _1457;
    assign _420 = f_in_fetch & _419;
    assign _421 = _420 ? _312 : _353;
    assign _4112 = _409 == _1989;
    assign _4113 = _4112 ? _312 : _350;
    assign _4110 = _342 == _1270;
    assign _4114 = _4110 ? _4113 : _350;
    assign _310 = _4114;
    always @(posedge _320) begin
        if (_318)
            _350 <= _346;
        else
            _350 <= _310;
    end
    assign _415 = _409 == _1989;
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
    assign _4142 = _399 + _4178;
    assign _4138 = _399 == _1119;
    assign _4139 = ~ _4138;
    assign _4140 = _4136 & _4139;
    assign _4143 = _4140 ? _4142 : _399;
    assign _4122 = _4121[2:2];
    assign _4123 = _1849 & _4122;
    assign _4145 = _4123 ? _1229 : _4143;
    assign _4147 = _2017 ? _1229 : _4145;
    assign _313 = _4147;
    always @(posedge _320) begin
        if (_318)
            _399 <= _1229;
        else
            _399 <= _313;
    end
    assign _4159 = _396 + _4178;
    assign _4155 = _396 == _1119;
    assign _4156 = ~ _4155;
    assign _4134 = 9'b111111111;
    assign _4135 = _4127 == _4134;
    assign _4132 = 6'b111111;
    assign _4131 = _4127[5:0];
    assign _4133 = _4131 == _4132;
    assign _4126 = 9'b000000000;
    assign _4148 = 9'b000000001;
    assign _4149 = _4127 + _4148;
    assign _4151 = _2017 ? _4126 : _4149;
    assign _314 = _4151;
    always @(posedge _320) begin
        if (_318)
            _4127 <= _4126;
        else
            _4127 <= _314;
    end
    assign _4128 = _4127[2:0];
    assign _4130 = _4128 == _2484;
    assign _4124 = _750[63:62];
    always @* begin
        case (_4124)
        0:
            _4136 <= vdd;
        1:
            _4136 <= _4130;
        2:
            _4136 <= _4133;
        default:
            _4136 <= _4135;
        endcase
    end
    assign _4157 = _4136 & _4156;
    assign _4160 = _4157 ? _4159 : _396;
    assign _4152 = _4121[1:1];
    assign _4153 = _1849 & _4152;
    assign _4162 = _4153 ? _1229 : _4160;
    assign _4164 = _2017 ? _1229 : _4162;
    assign _315 = _4164;
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
    assign _4166 = _342 == _1271;
    assign _4168 = _4166 ? _1279 : _378;
    assign _4165 = _342 == _1270;
    assign _4169 = _4165 ? f_changed_all : _4168;
    assign _4171 = _2017 ? _1279 : _4169;
    assign _316 = _4171;
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
    assign f_winner = f_fire0 ? _2559 : _1064;
    always @* begin
        case (f_winner)
        0:
            _4119 <= _4115;
        1:
            _4119 <= _4116;
        2:
            _4119 <= _4117;
        default:
            _4119 <= _4118;
        endcase
    end
    assign _4121 = _1848 ? _4120 : _4119;
    assign _4172 = _4121[0:0];
    assign _1847 = _409 == _1327;
    assign f_in_fetch = _342 == _1270;
    assign _1848 = f_in_fetch & _1847;
    assign _1849 = _1848 | _1246;
    assign _4173 = _1849 & _4172;
    assign _4182 = _4173 ? _1229 : _4180;
    assign _4184 = _2017 ? _1229 : _4182;
    assign _323 = _4184;
    always @(posedge _320) begin
        if (_318)
            _393 <= _1229;
        else
            _393 <= _323;
    end
    assign _2065 = _750[33:32];
    always @* begin
        case (_2065)
        0:
            _2066 <= _393;
        1:
            _2066 <= _396;
        2:
            _2066 <= _399;
        default:
            _2066 <= _399;
        endcase
    end
    assign _2064 = _750[49:34];
    assign _2067 = _2064 < _2066;
    assign _750 = _357[63:0];
    assign _2062 = _750[31:31];
    assign _2060 = ~ _1246;
    assign _2061 = f_in_eval & _2060;
    assign _2063 = _2061 & _2062;
    assign _2068 = _2063 & _2067;
    assign _2073 = _2068 & _2072;
    assign _2081 = _2073 | f_unexp_now;
    assign f_viol_now = _2081 | f_amb_now;
    assign _4190 = f_viol_now ? _4189 : _409;
    assign _4193 = _1246 ? _4192 : _4190;
    assign _4186 = _342 == _1271;
    assign _4194 = _4186 ? _4193 : _409;
    assign _4185 = _342 == _1270;
    assign _4197 = _4185 ? _4196 : _4194;
    assign _4199 = _2017 ? _1130 : _4197;
    assign _324 = _4199;
    always @(posedge _320) begin
        if (_318)
            _409 <= _1130;
        else
            _409 <= _324;
    end
    assign _4202 = _409 == _1327;
    assign _4203 = _4202 ? _312 : _347;
    assign _4200 = _342 == _1270;
    assign _4204 = _4200 ? _4203 : _347;
    assign _325 = _4204;
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
    assign _4223 = _1246 ? _4222 : _4220;
    assign _4208 = _342 == _2085;
    assign _4210 = _4208 ? _2559 : _342;
    assign _4206 = _342 == _1271;
    assign _4224 = _4206 ? _4223 : _4210;
    assign _4205 = _342 == _1270;
    assign _4227 = _4205 ? _4226 : _4224;
    assign _327 = host_stop;
    assign _4229 = _327 ? _2559 : _4227;
    assign _4231 = _2017 ? _1270 : _4229;
    assign _328 = _4231;
    always @(posedge _320) begin
        if (_318)
            _342 <= _2559;
        else
            _342 <= _328;
    end
    assign _1304 = _342 == _2559;
    assign _330 = host_verify;
    assign _2716 = _330 & _1304;
    assign _2718 = _2716 & _2717;
    assign _4233 = _2718 ? _1949 : f_sweeping;
    assign _4243 = f_sweeping ? _4242 : _4233;
    assign _331 = _4243;
    always @(posedge _320) begin
        if (_318)
            f_sweeping <= _1122;
        else
            f_sweeping <= _331;
    end
    assign _4255 = f_sweeping ? _4254 : _4248;
    assign _332 = _4255;
    always @(posedge _320) begin
        if (_318)
            f_image_valid <= _1122;
        else
            f_image_valid <= _332;
    end
    assign _334 = host_start;
    assign _2017 = _334 & f_image_valid;
    assign _4279 = _2017 ? _1279 : _4277;
    assign _335 = _4279;
    always @(posedge _320) begin
        if (_318)
            f_pout <= _1279;
        else
            f_pout <= _335;
    end
    assign _2641 = f_pout[7:7];
    assign _337 = host_pin_src;
    assign _2637 = _337[23:21];
    always @* begin
        case (_2637)
        0:
            _2648 <= _2641;
        1:
            _2648 <= f_lane0_out;
        2:
            _2648 <= _2642;
        3:
            _2648 <= _2643;
        4:
            _2648 <= _2645;
        5:
            _2648 <= f_lane1_out;
        6:
            _2648 <= _2646;
        default:
            _2648 <= _2647;
        endcase
    end
    assign _2712 = { _2648,
                     _2657,
                     _2666,
                     _2675,
                     _2684,
                     _2693,
                     _2702,
                     _2711 };
    assign _4281 = _2712 & _4280;
    assign pins_out = _4281;
    assign pins_oe = _2715;
    assign st_running = _2572;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1254;
    assign st_accepting = _2571;
    assign st_taken = _2569;
    assign st_taken_edge = _2566;
    assign st_viol = _2563;
    assign st_viol_kind = _2560;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _1714;
    assign st_tx_empty = _654;
    assign st_rx_data = _2555;
    assign st_rx_empty = _2490;
    assign st_vlog_data = _2488;
    assign st_vlog_empty = _2109;
    assign st_cov_rdata = _2117;
    assign st_irq = _2113;
    assign st_halted_viol = _2046;
    assign st_rx_overflow = _2039;
    assign st_vlog_overflow = _2027;
    assign st_cov_overrun = _2020;
    assign st_host_err = _2002;
    assign st_host_err_cause = _2007;
    assign st_lane_active = _1958;
    assign st_image_valid = f_image_valid;
    assign st_verify_busy = f_sweeping;
    assign st_tx_collision = _1948;
    assign st_drops = _1914;
    assign st_lane_status = _1645;
    assign ram_rec_addr = _1338;
    assign ram_rec_re = _1330;
    assign ram_rec_we = f_store_we;
    assign ram_rec_wdata = _17;
    assign ram_cov_addr = _1323;
    assign ram_cov_re = _1318;
    assign ram_cov_we = _1315;
    assign ram_cov_wdata = _1302;

endmodule
