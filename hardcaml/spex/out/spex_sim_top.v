module spex_sim_top (
    host_drop_clear,
    host_lane_we,
    host_cov_re,
    host_err_clear,
    host_irq_ack,
    host_tx_wm,
    host_tx_wm_en,
    host_rx_wm,
    host_cov_we,
    host_cov_wdata,
    host_cov_addr,
    host_cover_en,
    host_vlog_pop,
    host_open_drain,
    host_crc_expect,
    host_crc_expect_we,
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
    host_rec_we,
    host_rec_wdata,
    host_start_loc,
    host_recover_loc,
    host_rec_waddr,
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
    st_lane_status
);

    input host_drop_clear;
    input [1:0] host_lane_we;
    input host_cov_re;
    input host_err_clear;
    input host_irq_ack;
    input [2:0] host_tx_wm;
    input host_tx_wm_en;
    input [2:0] host_rx_wm;
    input host_cov_we;
    input [31:0] host_cov_wdata;
    input [7:0] host_cov_addr;
    input host_cover_en;
    input host_vlog_pop;
    input [7:0] host_open_drain;
    input [31:0] host_crc_expect;
    input host_crc_expect_we;
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
    input host_rec_we;
    input [127:0] host_rec_wdata;
    input [5:0] host_start_loc;
    input [5:0] host_recover_loc;
    input [7:0] host_rec_waddr;
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

    wire [2:0] _464;
    wire [2:0] _494;
    wire [2:0] _495;
    wire [2:0] _467;
    wire [2:0] _466;
    wire [2:0] _468;
    wire [2:0] _469;
    wire [2:0] _496;
    wire [2:0] _498;
    wire [2:0] _500;
    wire [2:0] _1;
    reg [2:0] _465;
    wire [7:0] _685;
    wire [2:0] _656;
    wire [2:0] _630;
    wire [2:0] _631;
    wire [2:0] _657;
    wire [2:0] _659;
    wire [2:0] _661;
    wire [2:0] _2;
    reg [2:0] _627;
    wire [7:0] _673;
    wire [15:0] _686;
    wire [7:0] _773;
    wire [7:0] _779;
    wire [7:0] _780;
    wire [7:0] _775;
    wire _776;
    wire _777;
    wire _769;
    wire _766;
    wire _767;
    wire _763;
    wire _760;
    wire _761;
    wire _762;
    wire _764;
    wire _768;
    wire _770;
    wire _759;
    wire _771;
    wire _778;
    wire [7:0] _781;
    wire [7:0] _783;
    wire [7:0] _4;
    reg [7:0] _774;
    wire [7:0] _882;
    wire _878;
    wire _879;
    wire _871;
    wire _868;
    wire _869;
    wire _865;
    wire _862;
    wire _863;
    wire _864;
    wire _866;
    wire _870;
    wire _872;
    wire _758;
    wire _860;
    wire _861;
    wire _873;
    wire _880;
    wire [7:0] _883;
    wire [7:0] _885;
    wire [7:0] _5;
    reg [7:0] _876;
    wire [7:0] _1750;
    wire _1746;
    wire _1747;
    wire _1740;
    wire _1741;
    wire _1748;
    wire [7:0] _1751;
    wire [7:0] _1753;
    wire [7:0] _6;
    reg [7:0] _1744;
    wire [7:0] _1765;
    wire _1761;
    wire _1762;
    wire _1763;
    wire [7:0] _1766;
    wire [7:0] _1768;
    wire [7:0] _7;
    reg [7:0] _1759;
    wire [7:0] _1792;
    wire _1788;
    wire _1789;
    wire _1790;
    wire [7:0] _1793;
    wire _9;
    wire [7:0] _1795;
    wire [7:0] _10;
    reg [7:0] _1786;
    wire [39:0] _1796;
    wire _1829;
    wire _1831;
    wire _1809;
    wire _1827;
    wire _1832;
    wire _1834;
    wire _12;
    reg _1830;
    wire [1:0] _1843;
    wire [2:0] _1898;
    wire [2:0] _1900;
    wire [2:0] _17;
    reg [2:0] _1897;
    wire _1893;
    wire [2:0] _1883;
    wire [2:0] _1879;
    wire [2:0] _1880;
    wire [2:0] _1884;
    wire [2:0] _1876;
    wire [2:0] _1875;
    wire [2:0] _1877;
    wire [2:0] _1885;
    wire _1871;
    wire _1868;
    wire _1869;
    wire _1870;
    wire _1872;
    wire _1864;
    wire _1865;
    wire _1841;
    wire _1861;
    wire _1862;
    wire _1842;
    wire [1:0] _20;
    wire _1859;
    wire _1860;
    wire _1863;
    wire _1866;
    wire _1855;
    wire _1851;
    wire _1856;
    wire _1849;
    wire _22;
    wire _1848;
    wire _1850;
    wire _1857;
    wire _1846;
    wire _1847;
    wire _1858;
    wire _1867;
    wire _1873;
    wire [2:0] _1886;
    wire _1888;
    wire _1889;
    wire _1894;
    wire _1902;
    wire _24;
    wire _1904;
    wire _25;
    reg _1892;
    wire _1781;
    wire _1782;
    wire _1773;
    wire _1783;
    wire _1910;
    wire _1912;
    wire _27;
    reg _1908;
    wire _1756;
    wire _1917;
    wire _1919;
    wire _29;
    reg _1915;
    wire _1923;
    wire _1738;
    wire _1731;
    wire _1739;
    wire _858;
    wire _854;
    wire _859;
    wire _1920;
    wire _31;
    wire _1921;
    wire _1922;
    wire _1924;
    wire _1929;
    wire _1931;
    wire _32;
    reg _1927;
    wire _1935;
    wire _1936;
    wire _1941;
    wire _36;
    wire _1943;
    wire _1945;
    wire _37;
    reg _1939;
    wire _1974;
    wire _1976;
    wire _1972;
    wire _1978;
    wire _1979;
    wire _1980;
    wire _1947;
    wire _1981;
    wire _1983;
    wire _38;
    reg _1934;
    wire _1998;
    wire [2:0] _40;
    wire [3:0] _1991;
    wire _1992;
    wire _1993;
    wire _42;
    wire _1994;
    wire [2:0] _44;
    wire _1985;
    wire [2:0] _1987;
    wire [3:0] _1988;
    wire _1989;
    wire _1990;
    wire _1995;
    wire _1999;
    wire _2000;
    wire _2001;
    wire _2103;
    wire _2102;
    wire _2104;
    wire [31:0] _2101;
    wire _2095;
    wire _2093;
    wire _2091;
    wire _47;
    wire _2090;
    wire _2092;
    wire _2094;
    wire f_host_cov_we;
    wire _2097;
    wire [11:0] _2084;
    wire _2081;
    wire _2082;
    wire [11:0] _2083;
    wire _2085;
    wire [11:0] _2086;
    wire [11:0] _2087;
    wire [11:0] _2073;
    wire [11:0] _2034;
    wire [11:0] _2031;
    wire [12:0] _2028;
    wire [9:0] _2025;
    wire [12:0] _2026;
    wire [12:0] _2027;
    reg [2:0] _2002;
    wire [2:0] _48;
    reg [2:0] _2022;
    wire [12:0] _2023;
    wire [12:0] _2008;
    wire [12:0] _2007;
    wire [15:0] _2003;
    wire _2006;
    wire [12:0] _2009;
    wire [12:0] _49;
    reg [12:0] _2018;
    wire _2024;
    wire [12:0] _2029;
    wire [12:0] _2015;
    wire _2030;
    wire [11:0] _2033;
    wire [15:0] _2010;
    wire _2011;
    wire _50;
    reg _2014;
    wire [11:0] _2035;
    wire [11:0] _51;
    reg [11:0] _2074;
    wire [11:0] _2038;
    reg [1:0] _2004;
    reg [15:0] _2005;
    wire [15:0] _2036;
    wire _2037;
    wire [11:0] _2040;
    wire [11:0] _52;
    reg [11:0] _2071;
    wire _2075;
    wire _2076;
    wire [11:0] _2077;
    wire [11:0] _2068;
    wire _2078;
    wire [11:0] _2079;
    wire _2067;
    wire [11:0] _2080;
    wire [7:0] _2063;
    wire [1:0] _2058;
    wire [1:0] _2057;
    wire _2042;
    wire _2041;
    wire _2043;
    wire _53;
    reg _2056;
    wire [1:0] _2059;
    wire [6:0] _2053;
    wire [8:0] _2060;
    wire [7:0] _2051;
    wire [8:0] _2052;
    wire [8:0] _2061;
    wire _2062;
    wire [7:0] _2065;
    wire [31:0] _2088;
    wire [31:0] _55;
    wire [31:0] _2089;
    reg [31:0] _2098[0:255];
    wire [7:0] _56;
    reg [7:0] _2049;
    wire [7:0] _1777;
    wire [7:0] _57;
    reg [7:0] _1780;
    wire [7:0] _59;
    wire [7:0] _2046;
    wire _2044;
    wire _61;
    wire _1769;
    wire _2045;
    wire _62;
    reg _1772;
    wire _63;
    reg _1854;
    wire [7:0] _2050;
    wire [31:0] _2099;
    reg [31:0] _2105;
    wire [31:0] _64;
    wire _2106;
    wire _2107;
    wire [31:0] _2109;
    wire [2:0] _2476;
    wire _2477;
    wire _2478;
    wire [47:0] _2475;
    reg [47:0] _2479;
    wire _2471;
    wire _2472;
    reg [47:0] _2473;
    wire _2465;
    wire _2466;
    reg [47:0] _2467;
    wire _2459;
    wire _2460;
    reg [47:0] _2461;
    wire _2453;
    wire _2454;
    reg [47:0] _2455;
    wire _2447;
    wire _2448;
    reg [47:0] _2449;
    wire _2441;
    wire _2442;
    reg [47:0] _2443;
    wire [2:0] _2116;
    wire [2:0] _2117;
    wire [2:0] _67;
    reg [2:0] _2114;
    wire _2435;
    wire _2436;
    wire [2:0] _2408;
    wire [28:0] _2125;
    wire [28:0] _2124;
    wire [28:0] _2127;
    wire [28:0] _2128;
    wire [2:0] _2121;
    wire _2123;
    wire [28:0] _2129;
    wire [28:0] _68;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2406;
    wire [2:0] _2147;
    wire _2143;
    wire _2144;
    wire _2141;
    wire _2145;
    wire [2:0] _2148;
    wire _2138;
    wire _2139;
    wire _2136;
    wire _2135;
    wire _2137;
    wire _2140;
    wire [2:0] _2150;
    wire _2131;
    wire [2:0] _2151;
    wire [2:0] _69;
    reg [2:0] _2134;
    wire _2397;
    wire [2:0] _2399;
    wire [2:0] _2168;
    wire _2164;
    wire _2165;
    wire _2162;
    wire _2166;
    wire [2:0] _2169;
    wire _2159;
    wire _2160;
    wire _2157;
    wire _2156;
    wire _2158;
    wire _2161;
    wire [2:0] _2171;
    wire _2152;
    wire [2:0] _2172;
    wire [2:0] _70;
    reg [2:0] _2155;
    wire _2394;
    wire [2:0] _2396;
    wire [2:0] _2400;
    wire [2:0] _2189;
    wire _2185;
    wire _2186;
    wire _2183;
    wire _2187;
    wire [2:0] _2190;
    wire _2180;
    wire _2181;
    wire _2178;
    wire _2177;
    wire _2179;
    wire _2182;
    wire [2:0] _2192;
    wire _2173;
    wire [2:0] _2193;
    wire [2:0] _71;
    reg [2:0] _2176;
    wire _2390;
    wire [2:0] _2392;
    wire [2:0] _2210;
    wire _2206;
    wire _2207;
    wire _2204;
    wire _2208;
    wire [2:0] _2211;
    wire _2201;
    wire _2202;
    wire _2199;
    wire _2198;
    wire _2200;
    wire _2203;
    wire [2:0] _2213;
    wire _2194;
    wire [2:0] _2214;
    wire [2:0] _72;
    reg [2:0] _2197;
    wire _2387;
    wire [2:0] _2389;
    wire [2:0] _2393;
    wire [2:0] _2401;
    wire [2:0] _2231;
    wire _2227;
    wire _2228;
    wire _2225;
    wire _2229;
    wire [2:0] _2232;
    wire _2222;
    wire _2223;
    wire _2220;
    wire _2219;
    wire _2221;
    wire _2224;
    wire [2:0] _2234;
    wire _2215;
    wire [2:0] _2235;
    wire [2:0] _73;
    reg [2:0] _2218;
    wire _2382;
    wire [2:0] _2384;
    wire [2:0] _2252;
    wire _2248;
    wire _2249;
    wire _2246;
    wire _2250;
    wire [2:0] _2253;
    wire _2243;
    wire _2244;
    wire _2241;
    wire _2240;
    wire _2242;
    wire _2245;
    wire [2:0] _2255;
    wire _2236;
    wire [2:0] _2256;
    wire [2:0] _74;
    reg [2:0] _2239;
    wire _2379;
    wire [2:0] _2381;
    wire [2:0] _2385;
    wire [2:0] _2273;
    wire _2269;
    wire _2270;
    wire _2267;
    wire _2271;
    wire [2:0] _2274;
    wire _2264;
    wire _2265;
    wire _2262;
    wire _2261;
    wire _2263;
    wire _2266;
    wire [2:0] _2276;
    wire _2257;
    wire [2:0] _2277;
    wire [2:0] _75;
    reg [2:0] _2260;
    wire _2375;
    wire [2:0] _2377;
    wire [2:0] _2294;
    wire _2290;
    wire _2291;
    wire _2288;
    wire _2292;
    wire [2:0] _2295;
    wire _2285;
    wire _2286;
    wire _2283;
    wire _2282;
    wire _2284;
    wire _2287;
    wire [2:0] _2297;
    wire _2278;
    wire [2:0] _2298;
    wire [2:0] _76;
    reg [2:0] _2281;
    wire _2372;
    wire [2:0] _2374;
    wire [2:0] _2378;
    wire [2:0] _2386;
    wire [2:0] _2402;
    wire _2367;
    wire _2366;
    wire _2368;
    wire _2364;
    wire _2363;
    wire _2365;
    wire _2369;
    wire _2360;
    wire _2359;
    wire _2361;
    wire _2357;
    wire _2356;
    wire _2358;
    wire _2362;
    wire _2370;
    wire [2:0] _2403;
    wire _2345;
    wire _2344;
    wire _2346;
    wire [2:0] _2348;
    wire _2340;
    wire _2339;
    wire _2341;
    wire [2:0] _2343;
    wire _2349;
    wire [2:0] _2350;
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
    wire _2351;
    wire [2:0] _2352;
    wire _2319;
    wire _2318;
    wire _2320;
    wire [2:0] _2322;
    wire _2314;
    wire _2313;
    wire _2315;
    wire [2:0] _2317;
    wire _2323;
    wire [2:0] _2324;
    wire _2307;
    wire _2306;
    wire _2308;
    wire [2:0] _2310;
    wire _2302;
    wire _2301;
    wire _2303;
    wire [2:0] _2305;
    wire _2311;
    wire [2:0] _2312;
    wire _2325;
    wire [2:0] _2326;
    wire _2353;
    wire [2:0] _2354;
    wire [2:0] _2355;
    wire [2:0] _2404;
    wire [2:0] _2299;
    wire _2405;
    wire [28:0] _2407;
    wire [31:0] _2409;
    wire [47:0] _2413;
    wire [47:0] _77;
    reg [47:0] _2437;
    wire [2:0] _2430;
    wire [3:0] _1996;
    wire [3:0] _2419;
    wire [3:0] _2420;
    wire [3:0] _2418;
    wire [3:0] _2421;
    wire [3:0] _1754;
    wire _1755;
    wire _2110;
    wire _78;
    wire _2111;
    wire _2416;
    wire [3:0] _2422;
    reg [3:0] _2425;
    wire [3:0] _79;
    wire _1997;
    wire _2414;
    wire _81;
    wire _2415;
    wire [2:0] _2431;
    wire [2:0] _82;
    reg [2:0] _2428;
    reg [47:0] _2480;
    wire _2544;
    wire _2545;
    reg [7:0] _2546;
    wire _2538;
    wire _2539;
    reg [7:0] _2540;
    wire _2532;
    wire _2533;
    reg [7:0] _2534;
    wire _2526;
    wire _2527;
    reg [7:0] _2528;
    wire _2520;
    wire _2521;
    reg [7:0] _2522;
    wire _2514;
    wire _2515;
    reg [7:0] _2516;
    wire _2508;
    wire _2509;
    reg [7:0] _2510;
    wire [2:0] _2489;
    wire [2:0] _2490;
    wire [2:0] _85;
    reg [2:0] _2487;
    wire _2502;
    wire _2503;
    reg [7:0] _2504;
    wire [2:0] _2497;
    wire [2:0] _2498;
    wire [2:0] _86;
    reg [2:0] _2495;
    reg [7:0] _2547;
    wire [31:0] _2548;
    wire [31:0] _2549;
    wire [31:0] _90;
    reg [31:0] ts_reg;
    wire [1:0] _2551;
    wire [1:0] _2410;
    wire [1:0] _2412;
    reg [1:0] _2552;
    reg _2555;
    reg [1:0] _2558;
    reg _2561;
    wire _2562;
    wire _2563;
    wire _2564;
    wire [7:0] _2705;
    wire [7:0] _2706;
    wire [7:0] _2586;
    wire [7:0] _2584;
    wire [7:0] _2583;
    wire [7:0] _2582;
    wire [7:0] _2581;
    reg [7:0] _2585;
    wire [7:0] _2587;
    wire [7:0] _2588;
    wire [7:0] _2579;
    wire [7:0] _2580;
    wire [7:0] _2589;
    wire [7:0] _2623;
    wire [7:0] _2624;
    wire [7:0] _2626;
    wire [7:0] _2628;
    wire [7:0] _100;
    reg [7:0] f_poe;
    wire [7:0] _2707;
    wire [7:0] _103;
    wire [7:0] _4292;
    wire _2702;
    wire _2701;
    wire _2699;
    wire _2700;
    wire _2698;
    wire _2697;
    wire _2696;
    wire [2:0] _2695;
    reg _2703;
    wire _2693;
    wire _2692;
    wire _2690;
    wire _2691;
    wire _2689;
    wire _2688;
    wire _2687;
    wire [2:0] _2686;
    reg _2694;
    wire _2684;
    wire _2683;
    wire _2681;
    wire _2682;
    wire _2680;
    wire _2679;
    wire _2678;
    wire [2:0] _2677;
    reg _2685;
    wire _2675;
    wire _2674;
    wire _2672;
    wire _2673;
    wire _2671;
    wire _2670;
    wire _2669;
    wire [2:0] _2668;
    reg _2676;
    wire _2666;
    wire _2665;
    wire _2663;
    wire _2664;
    wire _2662;
    wire _2661;
    wire _2660;
    wire [2:0] _2659;
    reg _2667;
    wire _2657;
    wire _2656;
    wire _2654;
    wire _2655;
    wire _2653;
    wire _2652;
    wire _2651;
    wire [2:0] _2650;
    reg _2658;
    wire _2648;
    wire _2647;
    wire _2645;
    wire _2646;
    wire _2644;
    wire _2643;
    wire _2642;
    wire [2:0] _2641;
    reg _2649;
    wire _2639;
    wire _2638;
    wire _2636;
    wire _2637;
    wire _2635;
    wire _2634;
    wire [2:0] _4284;
    wire _4281;
    wire [1:0] _4282;
    wire [3:0] _4283;
    wire [6:0] _4285;
    wire [7:0] _4286;
    wire [7:0] _4287;
    wire _2620;
    wire _2619;
    wire _2618;
    wire _2616;
    wire _2617;
    wire _2614;
    wire _2615;
    wire _2611;
    wire _2612;
    wire _2613;
    wire _2608;
    wire _2609;
    wire _2610;
    wire _2605;
    wire _2604;
    wire _2606;
    wire _2603;
    wire _2607;
    wire [7:0] _2621;
    wire _2590;
    wire _2596;
    wire [7:0] _2622;
    wire [7:0] _4279;
    wire [7:0] _4275;
    wire [7:0] _4273;
    wire [7:0] _4272;
    wire [7:0] _4271;
    wire [7:0] _4270;
    reg [7:0] _4274;
    wire [7:0] _4276;
    wire [7:0] _4277;
    wire [7:0] _2577;
    wire [7:0] _2575;
    wire [7:0] _2574;
    wire [7:0] _2573;
    wire [7:0] _2572;
    reg [7:0] _2576;
    wire [7:0] _2578;
    wire [7:0] _4268;
    wire [7:0] _4269;
    wire [7:0] _4278;
    wire [7:0] _4280;
    wire [7:0] _4288;
    wire _2566;
    wire _2567;
    wire _2568;
    wire [7:0] _4289;
    wire [31:0] _105;
    wire [31:0] _4261;
    wire [31:0] _2822;
    wire [30:0] _2820;
    wire [31:0] _2821;
    wire [31:0] _2823;
    wire [30:0] _2817;
    wire [31:0] _2818;
    wire [30:0] _2810;
    wire [31:0] _2811;
    wire [31:0] _2813;
    wire [30:0] _2807;
    wire [31:0] _2808;
    wire [30:0] _2800;
    wire [31:0] _2801;
    wire [31:0] _2803;
    wire [30:0] _2797;
    wire [31:0] _2798;
    wire [30:0] _2790;
    wire [31:0] _2791;
    wire [31:0] _2793;
    wire [30:0] _2787;
    wire [31:0] _2788;
    wire [30:0] _2780;
    wire [31:0] _2781;
    wire [31:0] _2783;
    wire [30:0] _2777;
    wire [31:0] _2778;
    wire [30:0] _2770;
    wire [31:0] _2771;
    wire [31:0] _2773;
    wire [30:0] _2767;
    wire [31:0] _2768;
    wire [30:0] _2760;
    wire [31:0] _2761;
    wire [31:0] _2763;
    wire [30:0] _2757;
    wire [31:0] _2758;
    wire [30:0] _2750;
    wire [31:0] _2751;
    wire [31:0] _2753;
    wire [30:0] _2747;
    wire [31:0] _2748;
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
    wire [7:0] _2730;
    wire [7:0] _2729;
    wire [7:0] _2728;
    wire [7:0] _2727;
    wire [7:0] _2726;
    wire [12:0] _2723;
    wire [12:0] _2724;
    wire [3:0] _2725;
    reg [7:0] _2742;
    wire [23:0] _2722;
    wire [31:0] _2743;
    wire _2720;
    wire _2721;
    wire [31:0] _2825;
    wire [31:0] _2715;
    wire [31:0] _2826;
    wire [31:0] _106;
    reg [31:0] _2713;
    wire [31:0] _2744;
    wire _2745;
    wire [31:0] _2754;
    wire _2755;
    wire [31:0] _2764;
    wire _2765;
    wire [31:0] _2774;
    wire _2775;
    wire [31:0] _2784;
    wire _2785;
    wire [31:0] _2794;
    wire _2795;
    wire [31:0] _2804;
    wire _2805;
    wire [31:0] _2814;
    wire _2815;
    wire [31:0] _2824;
    wire [31:0] _4262;
    wire f_sw_match;
    wire _4264;
    wire _4266;
    wire _4256;
    wire _4258;
    wire _4260;
    wire [12:0] _4249;
    wire f_sw_last;
    wire _4252;
    wire _108;
    wire _4246;
    wire _4247;
    wire _4248;
    wire _4254;
    wire _2709;
    wire [1:0] _4238;
    wire [1:0] _4234;
    wire [1:0] _1973;
    wire _4225;
    wire [1:0] _4227;
    wire _4224;
    wire [1:0] _4229;
    wire _4223;
    wire [1:0] _4231;
    wire [1:0] _4232;
    wire [7:0] _1707;
    wire _1709;
    wire _1700;
    wire [15:0] _1695;
    wire _1696;
    wire _1697;
    wire _1694;
    wire _1698;
    wire _1701;
    wire [3:0] _1691;
    wire _1693;
    wire _1702;
    wire _1689;
    wire _1685;
    wire _1686;
    wire _1683;
    wire _1687;
    wire _1690;
    wire _1681;
    reg [2:0] _1675;
    wire [15:0] _1676;
    wire _1677;
    wire _1671;
    wire _1678;
    wire _1669;
    wire _1679;
    wire _1682;
    wire [1:0] _1668;
    reg _1703;
    wire _1667;
    wire _1704;
    wire _1664;
    wire [3:0] _1662;
    reg _1663;
    wire _1665;
    wire [15:0] _1657;
    wire _1659;
    wire [16:0] _1652;
    wire [15:0] _1648;
    wire [16:0] _1649;
    wire [16:0] _1650;
    reg [16:0] _1653;
    wire _1654;
    wire _1655;
    wire [15:0] _1644;
    wire _1646;
    wire _1628;
    wire [2:0] _1630;
    wire _1625;
    wire [2:0] _1627;
    wire _1631;
    wire [2:0] _1632;
    wire _1620;
    wire [2:0] _1622;
    wire _1617;
    wire [2:0] _1619;
    wire _1623;
    wire [2:0] _1624;
    wire _1633;
    wire [2:0] _1634;
    wire _1610;
    wire [2:0] _1612;
    wire _1607;
    wire [2:0] _1609;
    wire _1613;
    wire [2:0] _1614;
    wire _1602;
    wire [2:0] _1604;
    wire [7:0] _1598;
    wire _1599;
    wire [2:0] _1601;
    wire _1605;
    wire [2:0] _1606;
    wire _1615;
    wire [2:0] _1616;
    wire _1635;
    wire [2:0] _1636;
    wire [13:0] _1597;
    wire [16:0] _1637;
    wire [111:0] _1594;
    wire [15:0] _1595;
    wire [16:0] _1596;
    wire [16:0] _1638;
    reg [16:0] _1641;
    wire [16:0] _1593;
    wire _1642;
    wire _1643;
    wire _1647;
    wire _1656;
    wire [1:0] _1589;
    reg [15:0] _1590;
    wire _1592;
    wire _1660;
    wire [7:0] _1583;
    wire _1585;
    wire _1586;
    wire _1582;
    wire _1587;
    wire [7:0] _1576;
    wire [7:0] _1574;
    wire [7:0] _1575;
    wire [7:0] _1577;
    wire _1579;
    wire _1580;
    wire _1588;
    wire _1661;
    wire _1666;
    wire _1705;
    wire _1706;
    wire _1710;
    wire f_fire3;
    wire [7:0] _1258;
    wire _1260;
    wire _1246;
    wire _1242;
    wire _1243;
    wire _1240;
    wire _1244;
    wire _1247;
    wire [3:0] _1237;
    wire _1239;
    wire _1248;
    wire _1235;
    wire _1231;
    wire _1232;
    wire _1229;
    wire _1233;
    wire _1236;
    wire _1227;
    reg [2:0] _1221;
    wire [15:0] _1222;
    wire _1223;
    wire _1217;
    wire _1224;
    wire _1215;
    wire _1225;
    wire _1228;
    wire [1:0] _1214;
    reg _1249;
    wire _1213;
    wire _1250;
    wire _1205;
    wire [3:0] _1181;
    reg _1204;
    wire _1206;
    wire [15:0] _1176;
    wire _1178;
    wire [15:0] _1167;
    wire [16:0] _1168;
    wire [16:0] _1169;
    reg [16:0] _1172;
    wire _1173;
    wire _1174;
    wire [15:0] _1163;
    wire _1165;
    wire _1129;
    wire [2:0] _1149;
    wire _1108;
    wire [2:0] _1128;
    wire _1150;
    wire [2:0] _1151;
    wire _1085;
    wire [2:0] _1105;
    wire _1064;
    wire [2:0] _1084;
    wire _1106;
    wire [2:0] _1107;
    wire _1152;
    wire [2:0] _1153;
    wire _1039;
    wire [2:0] _1059;
    wire _1018;
    wire [2:0] _1038;
    wire _1060;
    wire [2:0] _1061;
    wire _995;
    wire [2:0] _1015;
    wire [7:0] _973;
    wire _974;
    wire [2:0] _994;
    wire _1016;
    wire [2:0] _1017;
    wire _1062;
    wire [2:0] _1063;
    wire _1154;
    wire [2:0] _1155;
    wire [16:0] _1156;
    wire [111:0] _969;
    wire [15:0] _970;
    wire [16:0] _971;
    wire [16:0] _1157;
    reg [16:0] _1160;
    wire [16:0] _951;
    wire _1161;
    wire _1162;
    wire _1166;
    wire _1175;
    wire [1:0] _938;
    reg [15:0] _948;
    wire _950;
    wire _1179;
    wire [7:0] _932;
    wire _934;
    wire _935;
    wire _926;
    wire _936;
    wire [7:0] _919;
    wire [7:0] _917;
    wire [7:0] _918;
    wire [7:0] _920;
    wire _922;
    wire [127:0] _903;
    wire [2:0] _4208;
    wire [2:0] _4204;
    wire _4199;
    wire [2:0] _4201;
    wire [7:0] _1964;
    wire _1966;
    wire _1967;
    wire _1962;
    wire _1963;
    wire f_unexp_now;
    wire _2830;
    wire _2831;
    wire _2833;
    wire _2834;
    wire _2829;
    wire _2827;
    wire _2835;
    wire _109;
    reg _1959;
    wire _1960;
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
    wire [7:0] _1568;
    wire _1570;
    wire _1561;
    wire _1557;
    wire _1558;
    wire _1555;
    wire _1559;
    wire _1562;
    wire [3:0] _1552;
    wire _1554;
    wire _1563;
    wire _1550;
    wire _1546;
    wire _1547;
    wire _1544;
    wire _1548;
    wire _1551;
    wire _1542;
    reg [2:0] _1536;
    wire [15:0] _1537;
    wire _1538;
    wire _1532;
    wire _1539;
    wire _1530;
    wire _1540;
    wire _1543;
    wire [1:0] _1529;
    reg _1564;
    wire _1528;
    wire _1565;
    wire _1525;
    wire [3:0] _1523;
    reg _1524;
    wire _1526;
    wire [15:0] _1518;
    wire _1520;
    wire [15:0] _1509;
    wire [16:0] _1510;
    wire [16:0] _1511;
    reg [16:0] _1514;
    wire _1515;
    wire _1516;
    wire [15:0] _1505;
    wire _1507;
    wire _1489;
    wire [2:0] _1491;
    wire _1486;
    wire [2:0] _1488;
    wire _1492;
    wire [2:0] _1493;
    wire _1481;
    wire [2:0] _1483;
    wire _1478;
    wire [2:0] _1480;
    wire _1484;
    wire [2:0] _1485;
    wire _1494;
    wire [2:0] _1495;
    wire _1471;
    wire [2:0] _1473;
    wire _1468;
    wire [2:0] _1470;
    wire _1474;
    wire [2:0] _1475;
    wire _1463;
    wire [2:0] _1465;
    wire [7:0] _1459;
    wire _1460;
    wire [2:0] _1462;
    wire _1466;
    wire [2:0] _1467;
    wire _1476;
    wire [2:0] _1477;
    wire _1496;
    wire [2:0] _1497;
    wire [16:0] _1498;
    wire [111:0] _1455;
    wire [15:0] _1456;
    wire [16:0] _1457;
    wire [16:0] _1499;
    reg [16:0] _1502;
    wire [16:0] _1454;
    wire _1503;
    wire _1504;
    wire _1508;
    wire _1517;
    wire [1:0] _1450;
    reg [15:0] _1451;
    wire _1453;
    wire _1521;
    wire [7:0] _1444;
    wire _1446;
    wire _1447;
    wire _1443;
    wire _1448;
    wire [7:0] _1437;
    wire [7:0] _1435;
    wire [7:0] _1436;
    wire [7:0] _1438;
    wire _1440;
    wire _1441;
    wire _1449;
    wire _1522;
    wire _1527;
    wire _1566;
    wire _1567;
    wire _1571;
    wire f_fire2;
    wire [1:0] _1716;
    wire _1293;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _1283;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _1277;
    wire [7:0] _1271;
    wire [7:0] f_chgmask0;
    wire [7:0] _1265;
    wire [7:0] f_watch;
    wire [7:0] _1266;
    wire [7:0] _1272;
    wire [7:0] _1278;
    wire [7:0] f_relevant;
    wire [7:0] _1285;
    wire _1287;
    wire _1288;
    wire f_amb_now;
    wire _1290;
    wire _1294;
    wire [7:0] _1256;
    wire [7:0] _2840;
    wire [7:0] _2841;
    wire _2837;
    wire [7:0] _2839;
    wire _2836;
    wire [7:0] _2842;
    wire [7:0] _2844;
    wire [7:0] _110;
    reg [7:0] _1255;
    wire [7:0] f_multi_eff;
    wire [7:0] _1429;
    wire _1431;
    wire _1422;
    wire _1418;
    wire _1419;
    wire _1416;
    wire _1420;
    wire _1423;
    wire [3:0] _1413;
    wire _1415;
    wire _1424;
    wire _1411;
    wire _1407;
    wire _1408;
    wire _1405;
    wire _1409;
    wire _1412;
    wire _1403;
    reg [2:0] _1397;
    wire [15:0] _1398;
    wire _1399;
    wire _1393;
    wire _1400;
    wire _1391;
    wire _1401;
    wire _1404;
    wire [1:0] _1390;
    reg _1425;
    wire [1:0] _112;
    wire [1:0] _2845;
    wire [1:0] _113;
    reg [1:0] _1210;
    wire _1212;
    wire _1389;
    wire _1426;
    wire _1386;
    wire _2849;
    wire _2847;
    wire _2850;
    wire _2852;
    wire _2854;
    wire _114;
    reg _672;
    wire [15:0] _116;
    wire [15:0] _118;
    wire [15:0] _2860;
    wire [15:0] _2861;
    wire _2863;
    wire _2865;
    wire _2866;
    wire _2867;
    wire _2868;
    wire _2870;
    wire _2872;
    wire _119;
    reg _669;
    wire _2885;
    wire _2886;
    wire _2888;
    wire _2889;
    wire _2890;
    wire _2891;
    wire _2893;
    wire _120;
    reg g_crc_bad;
    wire _2887;
    wire _2896;
    wire [5:0] _2894;
    wire _2895;
    wire _2897;
    wire _2898;
    wire _2899;
    wire _2900;
    wire _2901;
    wire _2903;
    wire _2905;
    wire _121;
    reg _666;
    wire _2909;
    wire _2907;
    wire _2910;
    wire _2912;
    wire _2914;
    wire _122;
    reg _684;
    wire [15:0] _124;
    wire [15:0] _126;
    wire [15:0] _2920;
    wire [15:0] _2921;
    wire _2923;
    wire _2925;
    wire _2926;
    wire _2927;
    wire _2928;
    wire _2930;
    wire _2932;
    wire _127;
    reg _681;
    wire _2945;
    wire _2946;
    wire _2948;
    wire _2949;
    wire _2950;
    wire _2951;
    wire _2953;
    wire _128;
    reg g_crc_bad_0;
    wire _2947;
    wire _2956;
    wire _2955;
    wire _2957;
    wire _2958;
    wire _2959;
    wire _2960;
    wire _2961;
    wire _2963;
    wire _2965;
    wire _129;
    reg _678;
    wire [7:0] _131;
    wire [6:0] _1202;
    wire [6:0] _1201;
    wire _1203;
    wire [15:0] _1198;
    wire _2970;
    wire _2969;
    wire _2971;
    wire _2968;
    wire _2972;
    wire _2967;
    wire _2973;
    wire [14:0] _2966;
    wire [15:0] _2974;
    wire [15:0] _132;
    reg [15:0] _1199;
    wire _1200;
    wire [3:0] _2987;
    wire [3:0] _2985;
    wire [3:0] _2988;
    wire _2482;
    wire _2491;
    wire _134;
    wire _2492;
    wire _2483;
    wire _2981;
    wire _2977;
    wire _2975;
    wire _2976;
    wire _2978;
    wire _2982;
    wire f_rx_push;
    wire _2484;
    wire _2983;
    wire [3:0] _2989;
    reg [3:0] _2992;
    wire [3:0] _136;
    wire _755;
    wire _1194;
    wire [6:0] _3901;
    wire [7:0] _3902;
    wire _3899;
    wire _3898;
    wire _3897;
    wire _3896;
    wire _3895;
    wire _3894;
    wire _3893;
    wire _3892;
    wire [7:0] _3900;
    wire [3:0] _3884;
    wire [3:0] _3882;
    wire [3:0] _3885;
    wire _757;
    wire _3008;
    wire _3005;
    wire _138;
    wire _3006;
    wire _751;
    wire [2:0] _745;
    wire _740;
    wire g_tx_bit;
    wire _741;
    wire _742;
    wire _743;
    wire [2:0] _746;
    wire _748;
    wire _749;
    wire _720;
    wire _750;
    wire _752;
    wire _716;
    wire [5:0] _707;
    wire _708;
    wire _709;
    wire [9:0] _703;
    wire _705;
    wire _706;
    wire _710;
    wire _3872;
    wire _3873;
    wire [1:0] _3876;
    wire _3865;
    wire _3866;
    wire _3867;
    wire _3868;
    wire [1:0] _3870;
    wire [2:0] _3851;
    wire [2:0] _3848;
    wire _3844;
    wire _3842;
    wire _3843;
    wire _3845;
    wire [2:0] _3849;
    wire _3840;
    wire [2:0] _3852;
    wire _3853;
    wire [2:0] _3834;
    wire _3830;
    wire _3828;
    wire _3829;
    wire _3831;
    wire [2:0] _3835;
    wire _3826;
    wire [2:0] _3837;
    wire _3838;
    wire _3854;
    wire _3855;
    wire _3856;
    wire _3822;
    wire [5:0] _3819;
    wire _3820;
    wire _3823;
    wire [15:0] _3815;
    wire _3816;
    wire _3813;
    wire _3817;
    wire _3811;
    wire _3812;
    wire _3818;
    wire _3824;
    wire _3857;
    wire [1:0] _3859;
    wire [1:0] _3861;
    wire [1:0] _3807;
    wire _3803;
    wire [1:0] _3805;
    wire [1:0] _3808;
    wire _3084;
    wire _3085;
    wire _139;
    reg _2995;
    wire _3729;
    wire _3727;
    wire _3728;
    reg _3730;
    wire [2:0] _141;
    wire [2:0] _3711;
    wire [2:0] _3712;
    wire [2:0] _3707;
    wire _3703;
    wire _3701;
    wire _3702;
    wire _3704;
    wire [2:0] _3708;
    wire _3699;
    wire [2:0] _3713;
    wire [2:0] _3714;
    wire [2:0] _3693;
    wire [2:0] _3694;
    wire [2:0] _3689;
    wire _3080;
    wire _3079;
    wire _3078;
    wire _3077;
    wire _3076;
    wire _3075;
    wire _3074;
    wire _3070;
    wire _3069;
    wire _3068;
    wire _3067;
    wire _3066;
    wire _3065;
    wire _3064;
    wire _3056;
    wire _3057;
    reg [7:0] _3058;
    wire _3050;
    wire _3051;
    reg [7:0] _3052;
    wire _3044;
    wire _3045;
    reg [7:0] _3046;
    wire _3038;
    wire _3039;
    reg [7:0] _3040;
    wire _3032;
    wire _3033;
    reg [7:0] _3034;
    wire _3026;
    wire _3027;
    reg [7:0] _3028;
    wire _3020;
    wire _3021;
    reg [7:0] _3022;
    wire [2:0] _3087;
    wire [2:0] _3088;
    wire [2:0] _142;
    reg [2:0] _3012;
    wire _3014;
    wire _3015;
    wire [7:0] _3155;
    wire [7:0] _3156;
    wire [7:0] _3106;
    wire [7:0] _3104;
    wire [7:0] _3107;
    wire [7:0] _143;
    reg [7:0] _3093;
    wire [7:0] _3102;
    wire [7:0] _3103;
    wire [7:0] _3148;
    wire [7:0] _3115;
    wire [7:0] _3113;
    wire [7:0] _3116;
    wire [7:0] _144;
    reg [7:0] _3112;
    wire [6:0] _3133;
    wire [7:0] _3134;
    wire [6:0] _3131;
    wire _3129;
    wire _3128;
    wire _3127;
    wire _3126;
    wire _3125;
    wire _3124;
    wire _3123;
    wire _3122;
    wire [2:0] _3120;
    wire [2:0] _3119;
    wire [2:0] _3118;
    wire [2:0] _3117;
    reg [2:0] _3121;
    reg _3130;
    wire [7:0] _3132;
    reg [7:0] _3135;
    wire [7:0] _3136;
    wire [7:0] _145;
    reg [7:0] _1193;
    wire _3114;
    wire _3140;
    wire _3108;
    wire _3109;
    wire _3138;
    wire [1:0] _1724;
    wire [1:0] _1723;
    wire [1:0] _1722;
    wire [1:0] _1721;
    reg [1:0] _1725;
    wire [1:0] _1727;
    wire f_eng_push;
    wire _1730;
    wire _1736;
    wire _1733;
    wire _1734;
    wire _1732;
    wire _1735;
    wire _1737;
    wire _3141;
    wire _146;
    reg _888;
    wire [7:0] _3147;
    wire _3105;
    wire _3145;
    wire _851;
    wire [2:0] _845;
    wire _840;
    wire g_tx_bit_0;
    wire _841;
    wire _842;
    wire _843;
    wire [2:0] _846;
    wire _848;
    wire _849;
    wire _820;
    wire _850;
    wire _852;
    wire _816;
    wire _817;
    wire _853;
    wire _3089;
    wire _3090;
    wire _3143;
    wire _3146;
    wire _147;
    reg _786;
    wire _856;
    wire _855;
    wire _857;
    wire [7:0] _3149;
    wire [7:0] _3157;
    wire [7:0] _148;
    wire [7:0] _149;
    wire [7:0] _151;
    wire [7:0] _3002;
    reg [7:0] _3016;
    wire [2:0] _3533;
    wire _3530;
    wire _1824;
    wire _821;
    wire _3520;
    wire _3521;
    wire [1:0] _3524;
    wire _3513;
    wire _3514;
    wire _3515;
    wire _3516;
    wire [1:0] _3518;
    wire [2:0] _3499;
    wire [2:0] _3496;
    wire _3492;
    wire _3490;
    wire _3491;
    wire _3493;
    wire [2:0] _3497;
    wire _3488;
    wire [2:0] _3500;
    wire _3501;
    wire [2:0] _3482;
    wire _3478;
    wire _3476;
    wire _3477;
    wire _3479;
    wire [2:0] _3483;
    wire _3474;
    wire [2:0] _3485;
    wire _3486;
    wire _3502;
    wire _3503;
    wire _3504;
    wire _3470;
    wire _3468;
    wire _3471;
    wire [15:0] _3463;
    wire _3464;
    wire _3461;
    wire _3465;
    wire _3459;
    wire _3460;
    wire _3466;
    wire _3472;
    wire _3505;
    wire [1:0] _3507;
    wire [1:0] _3509;
    wire [1:0] _3455;
    wire _3451;
    wire [1:0] _3453;
    wire [1:0] _3456;
    wire _3185;
    wire _3186;
    wire _152;
    reg _3160;
    wire _3381;
    wire _3379;
    wire _3380;
    reg _3382;
    wire [2:0] _154;
    wire [2:0] _3363;
    wire [2:0] _3364;
    wire [2:0] _3359;
    wire _3355;
    wire _3353;
    wire _3354;
    wire _3356;
    wire [2:0] _3360;
    wire _3351;
    wire [2:0] _3365;
    wire [2:0] _3366;
    wire [2:0] _3345;
    wire [2:0] _3346;
    wire [2:0] _3341;
    wire _3181;
    wire _3180;
    wire _3179;
    wire _3178;
    wire _3177;
    wire _3176;
    wire _3175;
    wire _3171;
    wire _3170;
    wire _3169;
    wire _3168;
    wire _3167;
    wire _3166;
    wire _3165;
    wire [7:0] _3162;
    wire [6:0] _3099;
    wire [7:0] _3100;
    wire [6:0] _3097;
    wire [7:0] _3098;
    wire [7:0] _3101;
    wire [7:0] _3191;
    wire [7:0] _3192;
    wire [7:0] _3193;
    wire [7:0] _3194;
    wire [7:0] _3187;
    wire [7:0] _3188;
    wire [7:0] _3189;
    wire [7:0] _3190;
    wire [7:0] _3195;
    wire [7:0] _155;
    reg [7:0] g_byte;
    wire _1821;
    wire _1818;
    wire _1819;
    wire _1822;
    wire [7:0] _3163;
    wire _3164;
    wire [7:0] _3172;
    wire _157;
    wire [7:0] _3173;
    wire _3174;
    wire [2:0] _3203;
    wire [5:0] _807;
    wire _808;
    wire _809;
    wire [9:0] _803;
    wire _805;
    wire _806;
    wire _810;
    wire _811;
    wire [2:0] _3204;
    wire [2:0] _3205;
    wire [2:0] _3206;
    wire [2:0] _3207;
    wire [2:0] _3197;
    wire [2:0] _3198;
    wire [2:0] _3199;
    wire [2:0] _3200;
    wire [2:0] _3201;
    wire [2:0] _3208;
    wire [2:0] _3210;
    wire [2:0] _158;
    reg [2:0] g_bitpos;
    reg _3182;
    wire _160;
    wire [31:0] _162;
    wire [30:0] _3252;
    wire [31:0] _3254;
    wire _3246;
    wire _3247;
    wire [31:0] _3249;
    wire [30:0] _3243;
    wire [31:0] _3245;
    wire [31:0] _3250;
    wire [31:0] _3251;
    wire [5:0] _164;
    wire [5:0] _3220;
    wire [5:0] _3221;
    wire [5:0] _3222;
    wire [5:0] _3223;
    wire [5:0] _3214;
    wire [5:0] _3215;
    wire [5:0] _3216;
    wire [5:0] _3217;
    wire [5:0] _3218;
    wire [5:0] _3224;
    wire [5:0] _3225;
    wire [5:0] _3227;
    wire [5:0] _165;
    reg [5:0] g_left;
    wire _836;
    wire _837;
    wire _2877;
    wire _2876;
    wire _2878;
    wire _2879;
    wire [31:0] _3255;
    wire [31:0] _3256;
    wire [31:0] _3257;
    wire [31:0] _167;
    wire _3234;
    wire _3235;
    wire [31:0] _3237;
    wire [30:0] _3231;
    wire [31:0] _3233;
    wire [31:0] _3238;
    wire [30:0] _3228;
    wire [31:0] _3230;
    wire [31:0] _3239;
    wire [31:0] _3240;
    wire [31:0] _3241;
    wire [31:0] _3242;
    wire [31:0] _3258;
    wire [31:0] _3259;
    wire [31:0] _3261;
    wire [31:0] _168;
    reg [31:0] g_crc;
    wire _2883;
    wire _2884;
    wire [7:0] _3277;
    wire [7:0] _3278;
    wire [7:0] _169;
    reg [7:0] _798;
    wire [15:0] _799;
    wire [15:0] _171;
    wire [14:0] _2858;
    wire [15:0] _2859;
    wire [15:0] _3279;
    wire [15:0] _3280;
    wire [15:0] _3281;
    wire [15:0] _3283;
    wire [15:0] _172;
    reg [15:0] _2857;
    wire [3:0] _3269;
    wire [3:0] _174;
    wire _3270;
    wire [3:0] _3271;
    wire [7:0] _3273;
    wire [5:0] _176;
    wire [7:0] _3267;
    wire [7:0] _3274;
    wire [15:0] _3275;
    wire _3276;
    wire _3302;
    wire [5:0] _178;
    wire [5:0] _3288;
    wire _3289;
    wire [9:0] _3284;
    wire _3286;
    wire _180;
    wire _3287;
    wire _3290;
    wire _3292;
    wire _3293;
    wire _3294;
    wire _3295;
    wire _3296;
    wire _3298;
    wire _3300;
    wire _181;
    reg g_len_cap;
    wire _3303;
    wire _3305;
    wire _182;
    reg g_len_known;
    wire [15:0] _800;
    wire [15:0] _3325;
    wire _788;
    wire _802;
    wire [15:0] _3326;
    wire _787;
    wire [15:0] _3327;
    wire _3308;
    wire _3306;
    wire _3307;
    wire _3309;
    wire _3311;
    wire _183;
    reg g_last;
    wire _650;
    wire _647;
    wire _651;
    wire _3313;
    wire _3314;
    wire _3315;
    wire _3317;
    wire _184;
    reg g_prev;
    wire _644;
    wire _641;
    wire _645;
    wire _652;
    wire _653;
    wire _654;
    wire [15:0] _3328;
    wire [15:0] _3319;
    wire [15:0] _3320;
    wire [15:0] _3321;
    wire [15:0] _3322;
    wire [15:0] _3323;
    wire [15:0] _3329;
    wire [15:0] _3331;
    wire [15:0] _185;
    reg [15:0] g_cnt;
    wire g_data_left;
    wire _3183;
    wire _3184;
    wire _3337;
    wire _3335;
    wire _3336;
    wire _3338;
    wire [2:0] _3342;
    wire _3333;
    wire [2:0] _3347;
    wire [2:0] _3348;
    wire [2:0] _3349;
    wire [2:0] _3367;
    wire [2:0] _3369;
    wire [2:0] _186;
    reg [2:0] g_run;
    wire _638;
    wire [1:0] _188;
    wire _633;
    wire _634;
    wire _639;
    wire _831;
    wire _838;
    wire _3383;
    wire _3384;
    wire _826;
    wire _824;
    wire _827;
    wire _828;
    wire _829;
    wire _3376;
    wire _3373;
    wire _3370;
    wire _3371;
    wire _3374;
    wire _3375;
    wire _3377;
    wire _3385;
    wire _3387;
    wire _3389;
    wire _3391;
    wire _3393;
    wire _189;
    reg f_lane1_out;
    wire _622;
    wire _623;
    wire _616;
    wire _617;
    wire _613;
    wire _191;
    wire _610;
    wire _611;
    wire _612;
    wire _614;
    wire _618;
    wire _619;
    wire _624;
    wire [1:0] _3458;
    wire _605;
    wire _606;
    wire _601;
    wire _600;
    wire _599;
    wire _598;
    wire _597;
    wire _596;
    wire _595;
    wire _594;
    reg _602;
    wire _603;
    wire _592;
    wire _591;
    wire _590;
    wire _589;
    wire _588;
    wire _587;
    wire _586;
    wire _585;
    wire [2:0] _193;
    reg _593;
    wire _604;
    wire _195;
    wire _607;
    wire _583;
    wire _580;
    wire _573;
    wire _571;
    wire [13:0] _562;
    wire [15:0] _563;
    wire [14:0] _559;
    wire [15:0] _560;
    wire [15:0] _564;
    wire [14:0] _556;
    wire [15:0] _557;
    wire _554;
    wire [15:0] _565;
    reg [15:0] _568;
    wire _569;
    wire [13:0] _546;
    wire [15:0] _547;
    reg [15:0] _550;
    wire _3439;
    wire _3440;
    wire [15:0] _3441;
    wire [15:0] _3443;
    wire [15:0] _3445;
    wire _3423;
    wire [14:0] _575;
    wire [15:0] _576;
    reg [15:0] _579;
    wire [16:0] _3419;
    wire _3420;
    wire [16:0] _3413;
    reg [16:0] _3416;
    wire [16:0] _3408;
    wire [15:0] _197;
    wire [16:0] _3407;
    wire [16:0] _3409;
    reg [16:0] _3412;
    wire [7:0] _199;
    wire [8:0] _3427;
    wire [7:0] _3429;
    wire [7:0] _3430;
    wire [7:0] _3431;
    wire [7:0] _3433;
    wire [7:0] _200;
    reg [7:0] _3401;
    wire [8:0] _3426;
    wire [8:0] _3428;
    wire _3434;
    wire _3435;
    wire _3436;
    wire _3438;
    wire _201;
    reg _3406;
    wire [16:0] _3417;
    wire [16:0] _3403;
    wire _3418;
    wire _3421;
    wire _3424;
    wire _3402;
    wire _3425;
    wire [15:0] _3447;
    wire _3397;
    wire _3395;
    wire _663;
    wire _3394;
    wire _3396;
    wire _3398;
    wire [15:0] _3448;
    wire [15:0] _3450;
    wire [15:0] _202;
    reg [15:0] _544;
    wire _551;
    wire _552;
    wire _541;
    wire _553;
    wire _570;
    wire _572;
    wire _581;
    wire [1:0] _204;
    wire _537;
    wire _538;
    wire _535;
    wire _539;
    wire _532;
    wire _528;
    wire _527;
    wire _526;
    wire _525;
    wire _524;
    wire _523;
    wire _522;
    wire _521;
    reg _529;
    wire _519;
    wire _518;
    wire _517;
    wire _516;
    wire _515;
    wire _514;
    wire _513;
    wire _512;
    wire [2:0] _206;
    reg _520;
    wire _530;
    wire _531;
    wire _533;
    wire _540;
    wire _584;
    wire _208;
    wire _608;
    wire _210;
    wire _511;
    wire _609;
    wire [1:0] _3510;
    wire _819;
    wire [1:0] _3512;
    wire _3212;
    wire [1:0] _3519;
    wire _505;
    wire [1:0] _3525;
    wire _502;
    wire _503;
    wire [1:0] _3527;
    wire [1:0] _211;
    reg [1:0] g_mode;
    wire _510;
    wire _822;
    wire _830;
    wire _1823;
    wire _1825;
    wire _1816;
    wire _1815;
    wire _1817;
    wire _1826;
    wire _1807;
    wire _1805;
    wire _1808;
    wire _3528;
    wire _3529;
    wire _212;
    wire _3531;
    wire [2:0] _3534;
    wire [2:0] _213;
    reg [2:0] _3001;
    reg [7:0] _3059;
    wire [7:0] _3061;
    wire [6:0] _3152;
    wire [7:0] _3153;
    wire [6:0] _3150;
    wire [7:0] _3151;
    wire [7:0] _3154;
    wire [7:0] _3539;
    wire [7:0] _3540;
    wire [7:0] _3541;
    wire [7:0] _3542;
    wire [7:0] _3535;
    wire [7:0] _3536;
    wire [7:0] _3537;
    wire [7:0] _3538;
    wire [7:0] _3543;
    wire [7:0] _214;
    reg [7:0] g_byte_0;
    wire _1813;
    wire _1810;
    wire _1811;
    wire _1814;
    wire [7:0] _3062;
    wire _3063;
    wire [7:0] _3071;
    wire _216;
    wire [7:0] _3072;
    wire _3073;
    wire [2:0] _3551;
    wire [2:0] _3552;
    wire [2:0] _3553;
    wire [2:0] _3554;
    wire [2:0] _3555;
    wire [2:0] _3545;
    wire [2:0] _3546;
    wire [2:0] _3547;
    wire [2:0] _3548;
    wire [2:0] _3549;
    wire [2:0] _3556;
    wire [2:0] _3558;
    wire [2:0] _217;
    reg [2:0] g_bitpos_0;
    reg _3081;
    wire _219;
    wire [31:0] _221;
    wire [30:0] _3600;
    wire [31:0] _3602;
    wire _3594;
    wire _3595;
    wire [31:0] _3597;
    wire [30:0] _3591;
    wire [31:0] _3593;
    wire [31:0] _3598;
    wire [31:0] _3599;
    wire [5:0] _223;
    wire [5:0] _3568;
    wire [5:0] _3569;
    wire [5:0] _3570;
    wire [5:0] _3571;
    wire [5:0] _3562;
    wire [5:0] _3563;
    wire [5:0] _3564;
    wire [5:0] _3565;
    wire [5:0] _3566;
    wire [5:0] _3572;
    wire [5:0] _3573;
    wire [5:0] _3575;
    wire [5:0] _224;
    reg [5:0] g_left_0;
    wire _736;
    wire _737;
    wire _2937;
    wire _2936;
    wire _2938;
    wire _2939;
    wire [31:0] _3603;
    wire [31:0] _3604;
    wire [31:0] _3605;
    wire [31:0] _226;
    wire _3582;
    wire _3583;
    wire [31:0] _3585;
    wire [30:0] _3579;
    wire [31:0] _3581;
    wire [31:0] _3586;
    wire [30:0] _3576;
    wire [31:0] _3578;
    wire [31:0] _3587;
    wire [31:0] _3588;
    wire [31:0] _3589;
    wire [31:0] _3590;
    wire [31:0] _3606;
    wire [31:0] _3607;
    wire [31:0] _3609;
    wire [31:0] _227;
    reg [31:0] g_crc_0;
    wire _2943;
    wire _2944;
    wire [7:0] _3625;
    wire [7:0] _3626;
    wire [7:0] _228;
    reg [7:0] _698;
    wire [15:0] _699;
    wire [15:0] _230;
    wire [14:0] _2918;
    wire [15:0] _2919;
    wire [15:0] _3627;
    wire [15:0] _3628;
    wire [15:0] _3629;
    wire [15:0] _3631;
    wire [15:0] _231;
    reg [15:0] _2917;
    wire [3:0] _3617;
    wire [3:0] _233;
    wire _3618;
    wire [3:0] _3619;
    wire [7:0] _3621;
    wire [5:0] _235;
    wire [7:0] _3615;
    wire [7:0] _3622;
    wire [15:0] _3623;
    wire _3624;
    wire _3650;
    wire [5:0] _237;
    wire [5:0] _3636;
    wire _3637;
    wire [9:0] _3632;
    wire _3634;
    wire _239;
    wire _3635;
    wire _3638;
    wire _3640;
    wire _3641;
    wire _3642;
    wire _3643;
    wire _3644;
    wire _3646;
    wire _3648;
    wire _240;
    reg g_len_cap_0;
    wire _3651;
    wire _3653;
    wire _241;
    reg g_len_known_0;
    wire [15:0] _700;
    wire [15:0] _3673;
    wire [15:0] _3674;
    wire _687;
    wire [15:0] _3675;
    wire _3656;
    wire _3654;
    wire _3655;
    wire _3657;
    wire _3659;
    wire _242;
    reg g_last_0;
    wire _489;
    wire _485;
    wire _490;
    wire _3661;
    wire _3662;
    wire _3663;
    wire _3665;
    wire _243;
    reg g_prev_0;
    wire _482;
    wire _479;
    wire _483;
    wire _491;
    wire _492;
    wire _493;
    wire [15:0] _3676;
    wire [15:0] _3667;
    wire [15:0] _3668;
    wire [15:0] _3669;
    wire [15:0] _3670;
    wire [15:0] _3671;
    wire [15:0] _3677;
    wire [15:0] _3679;
    wire [15:0] _244;
    reg [15:0] g_cnt_0;
    wire g_data_left_0;
    wire _3082;
    wire _3083;
    wire _3685;
    wire _3683;
    wire _3684;
    wire _3686;
    wire [2:0] _3690;
    wire _3681;
    wire [2:0] _3695;
    wire [2:0] _3696;
    wire [2:0] _3697;
    wire [2:0] _3715;
    wire [2:0] _3717;
    wire [2:0] _245;
    reg [2:0] g_run_0;
    wire _476;
    wire [1:0] _247;
    wire _471;
    wire _472;
    wire _477;
    wire _731;
    wire _738;
    wire _3731;
    wire _721;
    wire _722;
    wire _730;
    wire _3732;
    wire _726;
    wire _724;
    wire _727;
    wire _728;
    wire _729;
    wire _3724;
    wire _3721;
    wire _3718;
    wire _3719;
    wire _3722;
    wire _3723;
    wire _3725;
    wire _3733;
    wire _3735;
    wire _3737;
    wire _3739;
    wire _3741;
    wire _248;
    reg f_lane0_out;
    wire _460;
    wire _461;
    wire _443;
    wire _444;
    wire _439;
    wire _438;
    wire _437;
    wire _436;
    wire _435;
    wire _434;
    wire _433;
    wire _432;
    reg _440;
    wire _441;
    wire _430;
    wire _429;
    wire _428;
    wire _427;
    wire _426;
    wire _425;
    wire _424;
    wire _423;
    wire [2:0] _250;
    reg _431;
    wire _442;
    wire _252;
    wire _445;
    wire _421;
    wire _418;
    wire _411;
    wire _409;
    wire [13:0] _400;
    wire [15:0] _401;
    wire [14:0] _397;
    wire [15:0] _398;
    wire [15:0] _402;
    wire [14:0] _394;
    wire [15:0] _395;
    wire _392;
    wire [15:0] _403;
    reg [15:0] _406;
    wire _407;
    wire [13:0] _384;
    wire [15:0] _385;
    reg [15:0] _388;
    wire _3787;
    wire _3788;
    wire [15:0] _3789;
    wire [15:0] _3791;
    wire [15:0] _3793;
    wire _3771;
    wire [14:0] _413;
    wire [15:0] _414;
    reg [15:0] _417;
    wire [16:0] _3767;
    wire _3768;
    wire [16:0] _3761;
    reg [16:0] _3764;
    wire [15:0] _254;
    wire [16:0] _3755;
    wire [16:0] _3757;
    reg [16:0] _3760;
    wire [7:0] _256;
    wire [8:0] _3775;
    wire [7:0] _3777;
    wire [7:0] _3778;
    wire [7:0] _3779;
    wire [7:0] _3781;
    wire [7:0] _257;
    reg [7:0] _3749;
    wire [8:0] _3774;
    wire [8:0] _3776;
    wire _3782;
    wire _3783;
    wire _3784;
    wire _3786;
    wire _258;
    reg _3754;
    wire [16:0] _3765;
    wire [16:0] _3751;
    wire _3766;
    wire _3769;
    wire _3772;
    wire _3750;
    wire _3773;
    wire [15:0] _3795;
    wire _3745;
    wire _3743;
    wire _675;
    wire _3742;
    wire _3744;
    wire _3746;
    wire [15:0] _3796;
    wire [15:0] _3798;
    wire [15:0] _259;
    reg [15:0] _382;
    wire _389;
    wire _390;
    wire _379;
    wire _391;
    wire _408;
    wire _410;
    wire _419;
    wire _375;
    wire _376;
    wire _373;
    wire _377;
    wire _370;
    wire _366;
    wire _365;
    wire _364;
    wire _363;
    wire _362;
    wire _361;
    wire _360;
    wire _359;
    reg _367;
    wire _354;
    wire _353;
    wire _352;
    wire _351;
    wire _350;
    wire _349;
    wire _348;
    wire _347;
    wire [2:0] _261;
    reg _355;
    wire _368;
    wire _369;
    wire _371;
    wire _378;
    wire _422;
    wire _446;
    wire [1:0] _263;
    wire _454;
    wire _455;
    wire _265;
    wire _451;
    wire _267;
    wire _269;
    wire _448;
    wire _449;
    wire _450;
    wire _452;
    wire _456;
    wire _457;
    wire _462;
    wire [1:0] _3810;
    wire [1:0] _3862;
    wire _719;
    wire [1:0] _3864;
    wire _3560;
    wire [1:0] _3871;
    wire _333;
    wire [1:0] _3877;
    wire [2:0] _2601;
    wire [2:0] _2600;
    wire [2:0] _2599;
    wire [2:0] _2598;
    reg [2:0] _2602;
    wire _2594;
    wire _2593;
    wire _2592;
    wire _2591;
    reg _2595;
    wire _3799;
    wire _3800;
    wire [2:0] _3802;
    wire [2:0] _270;
    wire _330;
    wire _331;
    wire [1:0] _3879;
    wire [1:0] _271;
    reg [1:0] g_mode_0;
    wire _339;
    wire _340;
    wire _447;
    wire _688;
    wire _702;
    wire _711;
    wire _717;
    wire _753;
    wire _2979;
    wire _273;
    wire _2980;
    wire _274;
    wire _3007;
    wire _3009;
    wire _3880;
    wire [3:0] _3886;
    reg [3:0] _3889;
    wire [3:0] _275;
    wire _1196;
    wire [7:0] _3891;
    wire [1:0] _1802;
    wire [1:0] _1800;
    wire [1:0] _1799;
    wire [1:0] _1798;
    wire [1:0] _1797;
    reg [1:0] _1801;
    wire [1:0] _1803;
    reg [7:0] _3903;
    wire [7:0] _3904;
    wire [7:0] _276;
    reg [7:0] _1189;
    wire _1190;
    wire [7:0] _3915;
    wire [7:0] _3914;
    wire [7:0] _3913;
    wire [1:0] _3910;
    wire [1:0] _3908;
    wire [1:0] _3907;
    wire [1:0] _3906;
    wire [1:0] _3905;
    reg [1:0] _3909;
    wire [1:0] _3911;
    reg [7:0] _3916;
    wire [7:0] _3917;
    wire [7:0] _277;
    reg [7:0] _1184;
    wire _1186;
    wire [3:0] _1384;
    reg _1385;
    wire _1387;
    wire [15:0] _1379;
    wire _1381;
    wire [15:0] _1370;
    wire [16:0] _1371;
    wire [16:0] _1372;
    reg [16:0] _1375;
    wire _1376;
    wire _1377;
    wire [15:0] _1366;
    wire _1368;
    wire [2:0] _1144;
    wire [2:0] _3932;
    wire _3928;
    wire _3929;
    wire _3926;
    wire _3930;
    wire [2:0] _3933;
    wire _3923;
    wire _3924;
    wire _3922;
    wire _3925;
    wire [2:0] _3935;
    wire _3919;
    wire [2:0] _3921;
    wire _3918;
    wire [2:0] _3936;
    wire [2:0] _278;
    reg [2:0] _1140;
    wire _1142;
    wire [2:0] _1145;
    wire _1135;
    wire _1136;
    wire _1134;
    wire _1137;
    wire [2:0] _1147;
    wire _1131;
    wire _1132;
    wire [2:0] _1148;
    wire _1350;
    wire [2:0] _1352;
    wire [2:0] _1123;
    wire [2:0] _3951;
    wire _3947;
    wire _3948;
    wire _3945;
    wire _3949;
    wire [2:0] _3952;
    wire _3942;
    wire _3943;
    wire _3941;
    wire _3944;
    wire [2:0] _3954;
    wire _3938;
    wire [2:0] _3940;
    wire _3937;
    wire [2:0] _3955;
    wire [2:0] _279;
    reg [2:0] _1119;
    wire _1121;
    wire [2:0] _1124;
    wire _1114;
    wire _1115;
    wire _1113;
    wire _1116;
    wire [2:0] _1126;
    wire _1110;
    wire _1111;
    wire [2:0] _1127;
    wire _1347;
    wire [2:0] _1349;
    wire _1353;
    wire [2:0] _1354;
    wire [2:0] _1100;
    wire [2:0] _3970;
    wire _3966;
    wire _3967;
    wire _3964;
    wire _3968;
    wire [2:0] _3971;
    wire _3961;
    wire _3962;
    wire _3960;
    wire _3963;
    wire [2:0] _3973;
    wire _3957;
    wire [2:0] _3959;
    wire _3956;
    wire [2:0] _3974;
    wire [2:0] _280;
    reg [2:0] _1096;
    wire _1098;
    wire [2:0] _1101;
    wire _1091;
    wire _1092;
    wire _1090;
    wire _1093;
    wire [2:0] _1103;
    wire _1087;
    wire _1088;
    wire [2:0] _1104;
    wire _1342;
    wire [2:0] _1344;
    wire [2:0] _1079;
    wire [2:0] _3989;
    wire _3985;
    wire _3986;
    wire _3983;
    wire _3987;
    wire [2:0] _3990;
    wire _3980;
    wire _3981;
    wire _3979;
    wire _3982;
    wire [2:0] _3992;
    wire _3976;
    wire [2:0] _3978;
    wire _3975;
    wire [2:0] _3993;
    wire [2:0] _281;
    reg [2:0] _1075;
    wire _1077;
    wire [2:0] _1080;
    wire _1070;
    wire _1071;
    wire _1069;
    wire _1072;
    wire [2:0] _1082;
    wire _1066;
    wire _1067;
    wire [2:0] _1083;
    wire _1339;
    wire [2:0] _1341;
    wire _1345;
    wire [2:0] _1346;
    wire _1355;
    wire [2:0] _1356;
    wire [2:0] _1054;
    wire [2:0] _4008;
    wire _4004;
    wire _4005;
    wire _4002;
    wire _4006;
    wire [2:0] _4009;
    wire _3999;
    wire _4000;
    wire _3998;
    wire _4001;
    wire [2:0] _4011;
    wire _3995;
    wire [2:0] _3997;
    wire _3994;
    wire [2:0] _4012;
    wire [2:0] _282;
    reg [2:0] _1050;
    wire _1052;
    wire [2:0] _1055;
    wire _1045;
    wire _1046;
    wire _1044;
    wire _1047;
    wire [2:0] _1057;
    wire _1041;
    wire _1042;
    wire [2:0] _1058;
    wire _1332;
    wire [2:0] _1334;
    wire [2:0] _1033;
    wire [2:0] _4027;
    wire _4023;
    wire _4024;
    wire _4021;
    wire _4025;
    wire [2:0] _4028;
    wire _4018;
    wire _4019;
    wire _4017;
    wire _4020;
    wire [2:0] _4030;
    wire _4014;
    wire [2:0] _4016;
    wire _4013;
    wire [2:0] _4031;
    wire [2:0] _283;
    reg [2:0] _1029;
    wire _1031;
    wire [2:0] _1034;
    wire _1024;
    wire _1025;
    wire _1023;
    wire _1026;
    wire [2:0] _1036;
    wire _1020;
    wire _1021;
    wire [2:0] _1037;
    wire _1329;
    wire [2:0] _1331;
    wire _1335;
    wire [2:0] _1336;
    wire [2:0] _1010;
    wire [2:0] _4046;
    wire _4042;
    wire _4043;
    wire _4040;
    wire _4044;
    wire [2:0] _4047;
    wire _4037;
    wire _4038;
    wire _4036;
    wire _4039;
    wire [2:0] _4049;
    wire _4033;
    wire [2:0] _4035;
    wire _4032;
    wire [2:0] _4050;
    wire [2:0] _284;
    reg [2:0] _1006;
    wire _1008;
    wire [2:0] _1011;
    wire _1001;
    wire _1002;
    wire _1000;
    wire _1003;
    wire [2:0] _1013;
    wire _997;
    wire _998;
    wire [2:0] _1014;
    wire _1324;
    wire [2:0] _1326;
    wire [2:0] _989;
    wire [2:0] _4065;
    wire _4061;
    wire _4062;
    wire _4059;
    wire _4063;
    wire [2:0] _4066;
    wire _4056;
    wire _4057;
    wire _4055;
    wire _4058;
    wire [2:0] _4068;
    wire _4052;
    wire [2:0] _4054;
    wire _4051;
    wire [2:0] _4069;
    wire [2:0] _285;
    reg [2:0] _985;
    wire _987;
    wire [2:0] _990;
    wire _980;
    wire _981;
    wire _979;
    wire _982;
    wire [2:0] _992;
    wire _976;
    wire _977;
    wire [2:0] _993;
    wire [7:0] _1320;
    wire _1321;
    wire [2:0] _1323;
    wire _1327;
    wire [2:0] _1328;
    wire _1337;
    wire [2:0] _1338;
    wire _1357;
    wire [2:0] _1358;
    wire [16:0] _1359;
    wire _4072;
    wire [127:0] _4073;
    wire _4070;
    wire [127:0] _4074;
    wire [127:0] _286;
    reg [127:0] _913;
    wire _965;
    wire _966;
    wire [127:0] _967;
    wire _4077;
    wire [127:0] _4078;
    wire _4075;
    wire [127:0] _4079;
    wire [127:0] _287;
    reg [127:0] _910;
    wire _961;
    wire _962;
    wire [127:0] _963;
    wire _4082;
    wire [127:0] _4083;
    wire _4080;
    wire [127:0] _4084;
    wire [127:0] _288;
    reg [127:0] _907;
    wire _957;
    wire _958;
    wire [127:0] _959;
    wire _4125;
    wire _4119;
    wire _290;
    wire _4118;
    wire f_store_we;
    wire [127:0] _292;
    reg [127:0] _4121[0:255];
    wire [1:0] _4115;
    wire [5:0] _294;
    wire [111:0] _1279;
    wire [5:0] _4097;
    wire [111:0] _1273;
    wire [5:0] _4096;
    wire [5:0] _4095;
    wire [5:0] _4094;
    reg [5:0] _4098;
    wire _4099;
    wire _4100;
    wire [5:0] _4101;
    wire [5:0] _296;
    wire [5:0] _4088;
    wire [5:0] _297;
    reg [5:0] _4087;
    wire [1:0] f_policy;
    wire _4091;
    wire [5:0] _4092;
    wire [5:0] _4093;
    wire [5:0] _4102;
    wire _4089;
    wire [5:0] _4103;
    wire [5:0] _4104;
    wire [5:0] _298;
    reg [5:0] _1776;
    wire [7:0] _4116;
    wire [12:0] _4108;
    wire [12:0] _4106;
    wire [12:0] _4109;
    wire [12:0] _299;
    reg [12:0] f_sw_cnt;
    wire [7:0] _4113;
    wire [7:0] _301;
    wire [7:0] _4114;
    wire _4111;
    wire _4112;
    wire [7:0] _4117;
    wire [127:0] _4122;
    reg [127:0] _4126;
    wire [127:0] _302;
    wire _953;
    wire _954;
    wire [127:0] _955;
    wire [511:0] _968;
    wire [111:0] _1316;
    wire [15:0] _1317;
    wire [16:0] _1318;
    wire [16:0] _1360;
    reg [16:0] _1363;
    wire gnd;
    wire [16:0] _1315;
    wire _1364;
    wire _1365;
    wire _1369;
    wire _1378;
    wire [15:0] _4154;
    wire _4150;
    wire _4151;
    wire _4152;
    wire [15:0] _4155;
    wire _4134;
    wire _4135;
    wire [15:0] _4157;
    wire [15:0] _4159;
    wire [15:0] _303;
    reg [15:0] _947;
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
    wire [8:0] _304;
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
    wire [15:0] _305;
    reg [15:0] _944;
    wire [1:0] _1311;
    reg [15:0] _1312;
    wire _1314;
    wire _1382;
    reg [7:0] _358;
    wire [7:0] f_chg_now;
    wire _4178;
    wire [7:0] _4180;
    wire _4177;
    wire [7:0] _4181;
    wire [7:0] _4183;
    wire [7:0] _306;
    reg [7:0] _929;
    wire [7:0] f_changed_all;
    wire [7:0] _1305;
    wire _1307;
    wire _1308;
    wire [7:0] f_chgmask1;
    wire _1304;
    wire _1309;
    wire [7:0] _1298;
    wire [7:0] _1296;
    wire vdd;
    wire _308;
    wire _310;
    wire [7:0] _312;
    reg [7:0] _343;
    reg [7:0] _346;
    wire [7:0] _1297;
    wire [7:0] _1299;
    wire _1301;
    wire [111:0] _1267;
    wire f_valid1;
    wire _1302;
    wire _1310;
    wire _1383;
    wire _1388;
    wire _1427;
    wire _1428;
    wire _1432;
    wire f_fire1;
    wire [1:0] _1718;
    wire [1:0] f_winner;
    reg [2:0] _4131;
    wire [2:0] _4133;
    wire _4184;
    wire _898;
    wire f_in_fetch;
    wire _899;
    wire _1713;
    wire _4185;
    wire [15:0] _4194;
    wire [15:0] _4196;
    wire [15:0] _313;
    reg [15:0] _941;
    wire [1:0] _1953;
    reg [15:0] _1954;
    wire [15:0] _1952;
    wire _1955;
    wire [63:0] _1262;
    wire _1950;
    wire _1948;
    wire _1949;
    wire _1951;
    wire _1956;
    wire _1961;
    wire _1969;
    wire f_viol_now;
    wire [2:0] _4202;
    wire [2:0] _4205;
    wire _4198;
    wire [2:0] _4206;
    wire _4197;
    wire [2:0] _4209;
    wire [2:0] _4211;
    wire [2:0] _314;
    reg [2:0] _896;
    wire _4214;
    wire [127:0] _4215;
    wire _4212;
    wire [127:0] _4216;
    wire [127:0] _315;
    reg [127:0] _904;
    wire [511:0] _914;
    wire [111:0] _915;
    wire f_valid0;
    wire _923;
    wire _937;
    wire _1180;
    wire _1207;
    wire _1251;
    wire f_in_eval;
    wire _1252;
    wire _1261;
    wire f_fire0;
    wire _1434;
    wire _1573;
    wire _1712;
    wire [1:0] _4235;
    wire _4220;
    wire [1:0] _4222;
    wire _4218;
    wire [1:0] _4236;
    wire _4217;
    wire [1:0] _4239;
    wire _317;
    wire [1:0] _4241;
    wire [1:0] _4243;
    wire [1:0] _318;
    reg [1:0] _891;
    wire _1845;
    wire _320;
    wire _2708;
    wire _2710;
    wire _4245;
    wire _4255;
    wire _321;
    reg f_sweeping;
    wire _4267;
    wire _322;
    reg f_image_valid;
    wire _324;
    wire _1905;
    wire [7:0] _4291;
    wire [7:0] _325;
    reg [7:0] f_pout;
    wire _2633;
    wire [23:0] _327;
    wire [2:0] _2629;
    reg _2640;
    wire [7:0] _2704;
    wire [7:0] _4293;
    assign _464 = 3'b000;
    assign _494 = 3'b001;
    assign _495 = _493 ? _494 : _469;
    assign _467 = 3'b100;
    assign _466 = 3'b010;
    assign _468 = f_lane0_out ? _467 : _466;
    assign _469 = _462 ? _468 : _465;
    assign _496 = _447 ? _495 : _469;
    assign _498 = _333 ? _464 : _496;
    assign _500 = _331 ? _464 : _498;
    assign _1 = _500;
    always @(posedge _310) begin
        if (_308)
            _465 <= _464;
        else
            _465 <= _1;
    end
    assign _685 = { _675,
                    _678,
                    _681,
                    _684,
                    gnd,
                    _465 };
    assign _656 = _654 ? _494 : _631;
    assign _630 = f_lane1_out ? _467 : _466;
    assign _631 = _624 ? _630 : _627;
    assign _657 = _609 ? _656 : _631;
    assign _659 = _505 ? _464 : _657;
    assign _661 = _503 ? _464 : _659;
    assign _2 = _661;
    always @(posedge _310) begin
        if (_308)
            _627 <= _464;
        else
            _627 <= _2;
    end
    assign _673 = { _663,
                    _666,
                    _669,
                    _672,
                    gnd,
                    _627 };
    assign _686 = { _673,
                    _685 };
    assign _773 = 8'b00000000;
    assign _779 = 8'b00000001;
    assign _780 = _774 + _779;
    assign _775 = 8'b11111111;
    assign _776 = _774 == _775;
    assign _777 = ~ _776;
    assign _769 = ~ _717;
    assign _766 = _746 == _464;
    assign _767 = ~ _766;
    assign _763 = _339 | _675;
    assign _760 = ~ _719;
    assign _761 = _331 & _760;
    assign _762 = _761 & _269;
    assign _764 = _762 & _763;
    assign _768 = _764 & _767;
    assign _770 = _768 & _769;
    assign _759 = _753 & _758;
    assign _771 = _759 | _770;
    assign _778 = _771 & _777;
    assign _781 = _778 ? _780 : _774;
    assign _783 = _9 ? _773 : _781;
    assign _4 = _783;
    always @(posedge _310) begin
        if (_308)
            _774 <= _773;
        else
            _774 <= _4;
    end
    assign _882 = _876 + _779;
    assign _878 = _876 == _775;
    assign _879 = ~ _878;
    assign _871 = ~ _817;
    assign _868 = _846 == _464;
    assign _869 = ~ _868;
    assign _865 = _510 | _663;
    assign _862 = ~ _819;
    assign _863 = _503 & _862;
    assign _864 = _863 & _210;
    assign _866 = _864 & _865;
    assign _870 = _866 & _869;
    assign _872 = _870 & _871;
    assign _758 = _273 ? _757 : _755;
    assign _860 = _857 & _758;
    assign _861 = _859 | _860;
    assign _873 = _861 | _872;
    assign _880 = _873 & _879;
    assign _883 = _880 ? _882 : _876;
    assign _885 = _9 ? _773 : _883;
    assign _5 = _885;
    always @(posedge _310) begin
        if (_308)
            _876 <= _773;
        else
            _876 <= _5;
    end
    assign _1750 = _1744 + _779;
    assign _1746 = _1744 == _775;
    assign _1747 = ~ _1746;
    assign _1740 = _1737 & _755;
    assign _1741 = _1739 | _1740;
    assign _1748 = _1741 & _1747;
    assign _1751 = _1748 ? _1750 : _1744;
    assign _1753 = _9 ? _773 : _1751;
    assign _6 = _1753;
    always @(posedge _310) begin
        if (_308)
            _1744 <= _773;
        else
            _1744 <= _6;
    end
    assign _1765 = _1759 + _779;
    assign _1761 = _1759 == _775;
    assign _1762 = ~ _1761;
    assign _1763 = _1756 & _1762;
    assign _1766 = _1763 ? _1765 : _1759;
    assign _1768 = _9 ? _773 : _1766;
    assign _7 = _1768;
    always @(posedge _310) begin
        if (_308)
            _1759 <= _773;
        else
            _1759 <= _7;
    end
    assign _1792 = _1786 + _779;
    assign _1788 = _1786 == _775;
    assign _1789 = ~ _1788;
    assign _1790 = _1783 & _1789;
    assign _1793 = _1790 ? _1792 : _1786;
    assign _9 = host_drop_clear;
    assign _1795 = _9 ? _773 : _1793;
    assign _10 = _1795;
    always @(posedge _310) begin
        if (_308)
            _1786 <= _773;
        else
            _1786 <= _10;
    end
    assign _1796 = { _1786,
                     _1759,
                     _1744,
                     _876,
                     _774 };
    assign _1829 = 1'b0;
    assign _1831 = 1'b1;
    assign _1809 = _1713 & _1808;
    assign _1827 = _1809 & _1826;
    assign _1832 = _1827 ? _1831 : _1830;
    assign _1834 = _24 ? _1829 : _1832;
    assign _12 = _1834;
    always @(posedge _310) begin
        if (_308)
            _1830 <= _1829;
        else
            _1830 <= _12;
    end
    assign _1843 = { _1841,
                     _1842 };
    assign _1898 = _1894 ? _1886 : _1897;
    assign _1900 = _24 ? _464 : _1898;
    assign _17 = _1900;
    always @(posedge _310) begin
        if (_308)
            _1897 <= _464;
        else
            _1897 <= _17;
    end
    assign _1893 = ~ _1892;
    assign _1883 = _1847 ? _494 : _466;
    assign _1879 = 3'b011;
    assign _1880 = _1863 ? _1879 : _467;
    assign _1884 = _1858 ? _1883 : _1880;
    assign _1876 = 3'b101;
    assign _1875 = 3'b110;
    assign _1877 = _1870 ? _1876 : _1875;
    assign _1885 = _1867 ? _1884 : _1877;
    assign _1871 = _138 & _273;
    assign _1868 = _290 | _47;
    assign _1869 = _1868 | _22;
    assign _1870 = f_sweeping & _1869;
    assign _1872 = _1870 | _1871;
    assign _1864 = ~ f_image_valid;
    assign _1865 = _324 & _1864;
    assign _1841 = _535 | _510;
    assign _1861 = _20[1:1];
    assign _1862 = _1861 & _1841;
    assign _1842 = _373 | _339;
    assign _20 = host_lane_we;
    assign _1859 = _20[0:0];
    assign _1860 = _1859 & _1842;
    assign _1863 = _1860 | _1862;
    assign _1866 = _1863 | _1865;
    assign _1855 = _1772 | _1854;
    assign _1851 = _47 & _1845;
    assign _1856 = _1851 & _1855;
    assign _1849 = ~ _1845;
    assign _22 = host_cov_re;
    assign _1848 = _47 | _22;
    assign _1850 = _1848 & _1849;
    assign _1857 = _1850 | _1856;
    assign _1846 = ~ _1845;
    assign _1847 = _290 & _1846;
    assign _1858 = _1847 | _1857;
    assign _1867 = _1858 | _1866;
    assign _1873 = _1867 | _1872;
    assign _1886 = _1873 ? _1885 : _464;
    assign _1888 = _1886 == _464;
    assign _1889 = ~ _1888;
    assign _1894 = _1889 & _1893;
    assign _1902 = _1894 ? _1831 : _1892;
    assign _24 = host_err_clear;
    assign _1904 = _24 ? _1829 : _1902;
    assign _25 = _1904;
    always @(posedge _310) begin
        if (_308)
            _1892 <= _1829;
        else
            _1892 <= _25;
    end
    assign _1781 = _1777 == _1780;
    assign _1782 = ~ _1781;
    assign _1773 = _1769 & _1772;
    assign _1783 = _1773 & _1782;
    assign _1910 = _1783 ? _1831 : _1908;
    assign _1912 = _1905 ? _1829 : _1910;
    assign _27 = _1912;
    always @(posedge _310) begin
        if (_308)
            _1908 <= _1829;
        else
            _1908 <= _27;
    end
    assign _1756 = _78 & _1755;
    assign _1917 = _1756 ? _1831 : _1915;
    assign _1919 = _1905 ? _1829 : _1917;
    assign _29 = _1919;
    always @(posedge _310) begin
        if (_308)
            _1915 <= _1829;
        else
            _1915 <= _29;
    end
    assign _1923 = _274 & _757;
    assign _1738 = ~ _1737;
    assign _1731 = _888 & _1730;
    assign _1739 = _1731 & _1738;
    assign _858 = ~ _857;
    assign _854 = _786 & _853;
    assign _859 = _854 & _858;
    assign _1920 = _859 | _1739;
    assign _31 = _1920;
    assign _1921 = f_rx_push & _755;
    assign _1922 = _1921 | _31;
    assign _1924 = _1922 | _1923;
    assign _1929 = _1924 ? _1831 : _1927;
    assign _1931 = _1905 ? _1829 : _1929;
    assign _32 = _1931;
    always @(posedge _310) begin
        if (_308)
            _1927 <= _1829;
        else
            _1927 <= _32;
    end
    assign _1935 = _1262[61:61];
    assign _1936 = _899 & _1935;
    assign _1941 = _1936 ? _1831 : _1939;
    assign _36 = host_irq_ack;
    assign _1943 = _36 ? _1829 : _1941;
    assign _1945 = _1905 ? _1829 : _1943;
    assign _37 = _1945;
    always @(posedge _310) begin
        if (_308)
            _1939 <= _1829;
        else
            _1939 <= _37;
    end
    assign _1974 = f_policy == _1973;
    assign _1976 = _1974 ? _1831 : _1934;
    assign _1972 = f_policy == _2551;
    assign _1978 = _1972 ? _1831 : _1976;
    assign _1979 = f_viol_now ? _1978 : _1934;
    assign _1980 = _1712 ? _1934 : _1979;
    assign _1947 = _891 == _2058;
    assign _1981 = _1947 ? _1980 : _1934;
    assign _1983 = _1905 ? _1829 : _1981;
    assign _38 = _1983;
    always @(posedge _310) begin
        if (_308)
            _1934 <= _1829;
        else
            _1934 <= _38;
    end
    assign _1998 = ~ _1997;
    assign _40 = host_tx_wm;
    assign _1991 = { gnd,
                     _40 };
    assign _1992 = _1991 < _275;
    assign _1993 = ~ _1992;
    assign _42 = host_tx_wm_en;
    assign _1994 = _42 & _1993;
    assign _44 = host_rx_wm;
    assign _1985 = _44 == _464;
    assign _1987 = _1985 ? _494 : _44;
    assign _1988 = { gnd,
                     _1987 };
    assign _1989 = _136 < _1988;
    assign _1990 = ~ _1989;
    assign _1995 = _1990 | _1994;
    assign _1999 = _1995 | _1998;
    assign _2000 = _1999 | _1934;
    assign _2001 = _2000 | _1939;
    assign _2103 = ~ f_host_cov_we;
    assign _2102 = ~ _1854;
    assign _2104 = _2102 & _2103;
    assign _2101 = 32'b00000000000000000000000000000000;
    assign _2095 = ~ f_sweeping;
    assign _2093 = ~ _1772;
    assign _2091 = ~ _1854;
    assign _47 = host_cov_we;
    assign _2090 = _47 & _1845;
    assign _2092 = _2090 & _2091;
    assign _2094 = _2092 & _2093;
    assign f_host_cov_we = _2094 & _2095;
    assign _2097 = _1854 | f_host_cov_we;
    assign _2084 = _64[11:0];
    assign _2081 = _2074 < _2071;
    assign _2082 = _2056 & _2081;
    assign _2083 = _2082 ? _2071 : _2074;
    assign _2085 = _2083 < _2084;
    assign _2086 = _2085 ? _2084 : _2083;
    assign _2087 = _2067 ? _2083 : _2086;
    assign _2073 = 12'b000000000000;
    assign _2034 = 12'b111111111111;
    assign _2031 = _2029[11:0];
    assign _2028 = 13'b0000000000000;
    assign _2025 = 10'b0000000000;
    assign _2026 = { _2025,
                     _2022 };
    assign _2027 = _2018 - _2026;
    always @* begin
        case (f_winner)
        0:
            _2002 <= _1221;
        1:
            _2002 <= _1397;
        2:
            _2002 <= _1536;
        default:
            _2002 <= _1675;
        endcase
    end
    assign _48 = _2002;
    always @(posedge _310) begin
        if (_308)
            _2022 <= _464;
        else
            _2022 <= _48;
    end
    assign _2023 = { _2025,
                     _2022 };
    assign _2008 = 13'b1111111111111;
    assign _2007 = _2005[12:0];
    assign _2003 = 16'b0001111111111111;
    assign _2006 = _2003 < _2005;
    assign _2009 = _2006 ? _2008 : _2007;
    assign _49 = _2009;
    always @(posedge _310) begin
        if (_308)
            _2018 <= _2028;
        else
            _2018 <= _49;
    end
    assign _2024 = _2018 < _2023;
    assign _2029 = _2024 ? _2028 : _2027;
    assign _2015 = 13'b0111111111111;
    assign _2030 = _2015 < _2029;
    assign _2033 = _2030 ? _2034 : _2031;
    assign _2010 = 16'b1111111111111111;
    assign _2011 = _2005 == _2010;
    assign _50 = _2011;
    always @(posedge _310) begin
        if (_308)
            _2014 <= _1829;
        else
            _2014 <= _50;
    end
    assign _2035 = _2014 ? _2034 : _2033;
    assign _51 = _2035;
    always @(posedge _310) begin
        if (_308)
            _2074 <= _2073;
        else
            _2074 <= _51;
    end
    assign _2038 = _2005[11:0];
    always @* begin
        case (f_winner)
        0:
            _2004 <= _938;
        1:
            _2004 <= _1311;
        2:
            _2004 <= _1450;
        default:
            _2004 <= _1589;
        endcase
    end
    always @* begin
        case (_2004)
        0:
            _2005 <= _941;
        1:
            _2005 <= _944;
        2:
            _2005 <= _947;
        default:
            _2005 <= _947;
        endcase
    end
    assign _2036 = 16'b0000111111111111;
    assign _2037 = _2036 < _2005;
    assign _2040 = _2037 ? _2034 : _2038;
    assign _52 = _2040;
    always @(posedge _310) begin
        if (_308)
            _2071 <= _2073;
        else
            _2071 <= _52;
    end
    assign _2075 = _2071 < _2074;
    assign _2076 = _2056 & _2075;
    assign _2077 = _2076 ? _2071 : _2074;
    assign _2068 = _64[23:12];
    assign _2078 = _2068 < _2077;
    assign _2079 = _2078 ? _2068 : _2077;
    assign _2067 = _2051 == _773;
    assign _2080 = _2067 ? _2077 : _2079;
    assign _2063 = _2061[7:0];
    assign _2058 = 2'b10;
    assign _2057 = 2'b01;
    assign _2042 = _1777 == _1780;
    assign _2041 = _1769 & _1772;
    assign _2043 = _2041 & _2042;
    assign _53 = _2043;
    always @(posedge _310) begin
        if (_308)
            _2056 <= _1829;
        else
            _2056 <= _53;
    end
    assign _2059 = _2056 ? _2058 : _2057;
    assign _2053 = 7'b0000000;
    assign _2060 = { _2053,
                     _2059 };
    assign _2051 = _64[31:24];
    assign _2052 = { gnd,
                     _2051 };
    assign _2061 = _2052 + _2060;
    assign _2062 = _2061[8:8];
    assign _2065 = _2062 ? _775 : _2063;
    assign _2088 = { _2065,
                     _2080,
                     _2087 };
    assign _55 = host_cov_wdata;
    assign _2089 = _1854 ? _2088 : _55;
    always @(posedge _310) begin
        if (_2097)
            _2098[_2050] <= _2089;
    end
    assign _56 = _1780;
    always @(posedge _310) begin
        if (_308)
            _2049 <= _773;
        else
            _2049 <= _56;
    end
    assign _1777 = { _1776,
                     f_winner };
    assign _57 = _1777;
    always @(posedge _310) begin
        if (_308)
            _1780 <= _773;
        else
            _1780 <= _57;
    end
    assign _59 = host_cov_addr;
    assign _2046 = _1772 ? _1780 : _59;
    assign _2044 = ~ _1772;
    assign _61 = host_cover_en;
    assign _1769 = _1712 & _61;
    assign _2045 = _1769 & _2044;
    assign _62 = _2045;
    always @(posedge _310) begin
        if (_308)
            _1772 <= _1829;
        else
            _1772 <= _62;
    end
    assign _63 = _1772;
    always @(posedge _310) begin
        if (_308)
            _1854 <= _1829;
        else
            _1854 <= _63;
    end
    assign _2050 = _1854 ? _2049 : _2046;
    assign _2099 = _2098[_2050];
    always @(posedge _310) begin
        if (_2104)
            _2105 <= _2099;
    end
    assign _64 = _2105;
    assign _2106 = ~ f_sweeping;
    assign _2107 = _1845 & _2106;
    assign _2109 = _2107 ? _64 : _2101;
    assign _2476 = 3'b111;
    assign _2477 = _2114 == _2476;
    assign _2478 = _2111 & _2477;
    assign _2475 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _310) begin
        if (_308)
            _2479 <= _2475;
        else
            if (_2478)
                _2479 <= _77;
    end
    assign _2471 = _2114 == _1875;
    assign _2472 = _2111 & _2471;
    always @(posedge _310) begin
        if (_308)
            _2473 <= _2475;
        else
            if (_2472)
                _2473 <= _77;
    end
    assign _2465 = _2114 == _1876;
    assign _2466 = _2111 & _2465;
    always @(posedge _310) begin
        if (_308)
            _2467 <= _2475;
        else
            if (_2466)
                _2467 <= _77;
    end
    assign _2459 = _2114 == _467;
    assign _2460 = _2111 & _2459;
    always @(posedge _310) begin
        if (_308)
            _2461 <= _2475;
        else
            if (_2460)
                _2461 <= _77;
    end
    assign _2453 = _2114 == _1879;
    assign _2454 = _2111 & _2453;
    always @(posedge _310) begin
        if (_308)
            _2455 <= _2475;
        else
            if (_2454)
                _2455 <= _77;
    end
    assign _2447 = _2114 == _466;
    assign _2448 = _2111 & _2447;
    always @(posedge _310) begin
        if (_308)
            _2449 <= _2475;
        else
            if (_2448)
                _2449 <= _77;
    end
    assign _2441 = _2114 == _494;
    assign _2442 = _2111 & _2441;
    always @(posedge _310) begin
        if (_308)
            _2443 <= _2475;
        else
            if (_2442)
                _2443 <= _77;
    end
    assign _2116 = _2114 + _494;
    assign _2117 = _2111 ? _2116 : _2114;
    assign _67 = _2117;
    always @(posedge _310) begin
        if (_308)
            _2114 <= _464;
        else
            _2114 <= _67;
    end
    assign _2435 = _2114 == _464;
    assign _2436 = _2111 & _2435;
    assign _2408 = _2299 - _2404;
    assign _2125 = 29'b11111111111111111111111111111;
    assign _2124 = 29'b00000000000000000000000000000;
    assign _2127 = 29'b00000000000000000000000000001;
    assign _2128 = ts_hi_m1 + _2127;
    assign _2121 = ts_reg[2:0];
    assign _2123 = _2121 == _2476;
    assign _2129 = _2123 ? _2128 : ts_hi_m1;
    assign _68 = _2129;
    always @(posedge _310) begin
        if (_308)
            ts_hi_m1 <= _2125;
        else
            ts_hi_m1 <= _68;
    end
    assign _2406 = ts_reg[31:3];
    assign _2147 = _2134 + _494;
    assign _2143 = _2134 == _2476;
    assign _2144 = ~ _2143;
    assign _2141 = _1255[0:0];
    assign _2145 = _2141 & _2144;
    assign _2148 = _2145 ? _2147 : _2134;
    assign _2138 = _1255[0:0];
    assign _2139 = ~ _2138;
    assign _2136 = _929[0:0];
    assign _2135 = f_chg_now[0:0];
    assign _2137 = _2135 & _2136;
    assign _2140 = _2137 & _2139;
    assign _2150 = _2140 ? _494 : _2148;
    assign _2131 = _891 == _2057;
    assign _2151 = _2131 ? _2150 : _2134;
    assign _69 = _2151;
    always @(posedge _310) begin
        if (_308)
            _2134 <= _464;
        else
            _2134 <= _69;
    end
    assign _2397 = _1255[0:0];
    assign _2399 = _2397 ? _2134 : _464;
    assign _2168 = _2155 + _494;
    assign _2164 = _2155 == _2476;
    assign _2165 = ~ _2164;
    assign _2162 = _1255[1:1];
    assign _2166 = _2162 & _2165;
    assign _2169 = _2166 ? _2168 : _2155;
    assign _2159 = _1255[1:1];
    assign _2160 = ~ _2159;
    assign _2157 = _929[1:1];
    assign _2156 = f_chg_now[1:1];
    assign _2158 = _2156 & _2157;
    assign _2161 = _2158 & _2160;
    assign _2171 = _2161 ? _494 : _2169;
    assign _2152 = _891 == _2057;
    assign _2172 = _2152 ? _2171 : _2155;
    assign _70 = _2172;
    always @(posedge _310) begin
        if (_308)
            _2155 <= _464;
        else
            _2155 <= _70;
    end
    assign _2394 = _1255[1:1];
    assign _2396 = _2394 ? _2155 : _464;
    assign _2400 = _2356 ? _2399 : _2396;
    assign _2189 = _2176 + _494;
    assign _2185 = _2176 == _2476;
    assign _2186 = ~ _2185;
    assign _2183 = _1255[2:2];
    assign _2187 = _2183 & _2186;
    assign _2190 = _2187 ? _2189 : _2176;
    assign _2180 = _1255[2:2];
    assign _2181 = ~ _2180;
    assign _2178 = _929[2:2];
    assign _2177 = f_chg_now[2:2];
    assign _2179 = _2177 & _2178;
    assign _2182 = _2179 & _2181;
    assign _2192 = _2182 ? _494 : _2190;
    assign _2173 = _891 == _2057;
    assign _2193 = _2173 ? _2192 : _2176;
    assign _71 = _2193;
    always @(posedge _310) begin
        if (_308)
            _2176 <= _464;
        else
            _2176 <= _71;
    end
    assign _2390 = _1255[2:2];
    assign _2392 = _2390 ? _2176 : _464;
    assign _2210 = _2197 + _494;
    assign _2206 = _2197 == _2476;
    assign _2207 = ~ _2206;
    assign _2204 = _1255[3:3];
    assign _2208 = _2204 & _2207;
    assign _2211 = _2208 ? _2210 : _2197;
    assign _2201 = _1255[3:3];
    assign _2202 = ~ _2201;
    assign _2199 = _929[3:3];
    assign _2198 = f_chg_now[3:3];
    assign _2200 = _2198 & _2199;
    assign _2203 = _2200 & _2202;
    assign _2213 = _2203 ? _494 : _2211;
    assign _2194 = _891 == _2057;
    assign _2214 = _2194 ? _2213 : _2197;
    assign _72 = _2214;
    always @(posedge _310) begin
        if (_308)
            _2197 <= _464;
        else
            _2197 <= _72;
    end
    assign _2387 = _1255[3:3];
    assign _2389 = _2387 ? _2197 : _464;
    assign _2393 = _2359 ? _2392 : _2389;
    assign _2401 = _2358 ? _2400 : _2393;
    assign _2231 = _2218 + _494;
    assign _2227 = _2218 == _2476;
    assign _2228 = ~ _2227;
    assign _2225 = _1255[4:4];
    assign _2229 = _2225 & _2228;
    assign _2232 = _2229 ? _2231 : _2218;
    assign _2222 = _1255[4:4];
    assign _2223 = ~ _2222;
    assign _2220 = _929[4:4];
    assign _2219 = f_chg_now[4:4];
    assign _2221 = _2219 & _2220;
    assign _2224 = _2221 & _2223;
    assign _2234 = _2224 ? _494 : _2232;
    assign _2215 = _891 == _2057;
    assign _2235 = _2215 ? _2234 : _2218;
    assign _73 = _2235;
    always @(posedge _310) begin
        if (_308)
            _2218 <= _464;
        else
            _2218 <= _73;
    end
    assign _2382 = _1255[4:4];
    assign _2384 = _2382 ? _2218 : _464;
    assign _2252 = _2239 + _494;
    assign _2248 = _2239 == _2476;
    assign _2249 = ~ _2248;
    assign _2246 = _1255[5:5];
    assign _2250 = _2246 & _2249;
    assign _2253 = _2250 ? _2252 : _2239;
    assign _2243 = _1255[5:5];
    assign _2244 = ~ _2243;
    assign _2241 = _929[5:5];
    assign _2240 = f_chg_now[5:5];
    assign _2242 = _2240 & _2241;
    assign _2245 = _2242 & _2244;
    assign _2255 = _2245 ? _494 : _2253;
    assign _2236 = _891 == _2057;
    assign _2256 = _2236 ? _2255 : _2239;
    assign _74 = _2256;
    always @(posedge _310) begin
        if (_308)
            _2239 <= _464;
        else
            _2239 <= _74;
    end
    assign _2379 = _1255[5:5];
    assign _2381 = _2379 ? _2239 : _464;
    assign _2385 = _2363 ? _2384 : _2381;
    assign _2273 = _2260 + _494;
    assign _2269 = _2260 == _2476;
    assign _2270 = ~ _2269;
    assign _2267 = _1255[6:6];
    assign _2271 = _2267 & _2270;
    assign _2274 = _2271 ? _2273 : _2260;
    assign _2264 = _1255[6:6];
    assign _2265 = ~ _2264;
    assign _2262 = _929[6:6];
    assign _2261 = f_chg_now[6:6];
    assign _2263 = _2261 & _2262;
    assign _2266 = _2263 & _2265;
    assign _2276 = _2266 ? _494 : _2274;
    assign _2257 = _891 == _2057;
    assign _2277 = _2257 ? _2276 : _2260;
    assign _75 = _2277;
    always @(posedge _310) begin
        if (_308)
            _2260 <= _464;
        else
            _2260 <= _75;
    end
    assign _2375 = _1255[6:6];
    assign _2377 = _2375 ? _2260 : _464;
    assign _2294 = _2281 + _494;
    assign _2290 = _2281 == _2476;
    assign _2291 = ~ _2290;
    assign _2288 = _1255[7:7];
    assign _2292 = _2288 & _2291;
    assign _2295 = _2292 ? _2294 : _2281;
    assign _2285 = _1255[7:7];
    assign _2286 = ~ _2285;
    assign _2283 = _929[7:7];
    assign _2282 = f_chg_now[7:7];
    assign _2284 = _2282 & _2283;
    assign _2287 = _2284 & _2286;
    assign _2297 = _2287 ? _494 : _2295;
    assign _2278 = _891 == _2057;
    assign _2298 = _2278 ? _2297 : _2281;
    assign _76 = _2298;
    always @(posedge _310) begin
        if (_308)
            _2281 <= _464;
        else
            _2281 <= _76;
    end
    assign _2372 = _1255[7:7];
    assign _2374 = _2372 ? _2281 : _464;
    assign _2378 = _2366 ? _2377 : _2374;
    assign _2386 = _2365 ? _2385 : _2378;
    assign _2402 = _2362 ? _2401 : _2386;
    assign _2367 = _1285[7:7];
    assign _2366 = _1285[6:6];
    assign _2368 = _2366 | _2367;
    assign _2364 = _1285[5:5];
    assign _2363 = _1285[4:4];
    assign _2365 = _2363 | _2364;
    assign _2369 = _2365 | _2368;
    assign _2360 = _1285[3:3];
    assign _2359 = _1285[2:2];
    assign _2361 = _2359 | _2360;
    assign _2357 = _1285[1:1];
    assign _2356 = _1285[0:0];
    assign _2358 = _2356 | _2357;
    assign _2362 = _2358 | _2361;
    assign _2370 = _2362 | _2369;
    assign _2403 = _2370 ? _2402 : _464;
    assign _2345 = f_watch[0:0];
    assign _2344 = _929[0:0];
    assign _2346 = _2344 & _2345;
    assign _2348 = _2346 ? _1140 : _464;
    assign _2340 = f_watch[1:1];
    assign _2339 = _929[1:1];
    assign _2341 = _2339 & _2340;
    assign _2343 = _2341 ? _1119 : _464;
    assign _2349 = _2343 < _2348;
    assign _2350 = _2349 ? _2348 : _2343;
    assign _2333 = f_watch[2:2];
    assign _2332 = _929[2:2];
    assign _2334 = _2332 & _2333;
    assign _2336 = _2334 ? _1096 : _464;
    assign _2328 = f_watch[3:3];
    assign _2327 = _929[3:3];
    assign _2329 = _2327 & _2328;
    assign _2331 = _2329 ? _1075 : _464;
    assign _2337 = _2331 < _2336;
    assign _2338 = _2337 ? _2336 : _2331;
    assign _2351 = _2338 < _2350;
    assign _2352 = _2351 ? _2350 : _2338;
    assign _2319 = f_watch[4:4];
    assign _2318 = _929[4:4];
    assign _2320 = _2318 & _2319;
    assign _2322 = _2320 ? _1050 : _464;
    assign _2314 = f_watch[5:5];
    assign _2313 = _929[5:5];
    assign _2315 = _2313 & _2314;
    assign _2317 = _2315 ? _1029 : _464;
    assign _2323 = _2317 < _2322;
    assign _2324 = _2323 ? _2322 : _2317;
    assign _2307 = f_watch[6:6];
    assign _2306 = _929[6:6];
    assign _2308 = _2306 & _2307;
    assign _2310 = _2308 ? _1006 : _464;
    assign _2302 = f_watch[7:7];
    assign _2301 = _929[7:7];
    assign _2303 = _2301 & _2302;
    assign _2305 = _2303 ? _985 : _464;
    assign _2311 = _2305 < _2310;
    assign _2312 = _2311 ? _2310 : _2305;
    assign _2325 = _2312 < _2324;
    assign _2326 = _2325 ? _2324 : _2312;
    assign _2353 = _2326 < _2352;
    assign _2354 = _2353 ? _2352 : _2326;
    assign _2355 = f_unexp_now ? _2354 : _464;
    assign _2404 = f_amb_now ? _2403 : _2355;
    assign _2299 = ts_reg[2:0];
    assign _2405 = _2299 < _2404;
    assign _2407 = _2405 ? ts_hi_m1 : _2406;
    assign _2409 = { _2407,
                     _2408 };
    assign _2413 = { _2409,
                     _1776,
                     _2412,
                     _346 };
    assign _77 = _2413;
    always @(posedge _310) begin
        if (_308)
            _2437 <= _2475;
        else
            if (_2436)
                _2437 <= _77;
    end
    assign _2430 = _2428 + _494;
    assign _1996 = 4'b0000;
    assign _2419 = 4'b0001;
    assign _2420 = _79 + _2419;
    assign _2418 = _79 - _2419;
    assign _2421 = _2111 ? _2420 : _2418;
    assign _1754 = 4'b1000;
    assign _1755 = _79 == _1754;
    assign _2110 = ~ _1755;
    assign _78 = f_viol_now;
    assign _2111 = _78 & _2110;
    assign _2416 = _2111 ^ _2415;
    assign _2422 = _2416 ? _2421 : _79;
    always @(posedge _310) begin
        if (_308)
            _2425 <= _1996;
        else
            _2425 <= _2422;
    end
    assign _79 = _2425;
    assign _1997 = _79 == _1996;
    assign _2414 = ~ _1997;
    assign _81 = host_vlog_pop;
    assign _2415 = _81 & _2414;
    assign _2431 = _2415 ? _2430 : _2428;
    assign _82 = _2431;
    always @(posedge _310) begin
        if (_308)
            _2428 <= _464;
        else
            _2428 <= _82;
    end
    always @* begin
        case (_2428)
        0:
            _2480 <= _2437;
        1:
            _2480 <= _2443;
        2:
            _2480 <= _2449;
        3:
            _2480 <= _2455;
        4:
            _2480 <= _2461;
        5:
            _2480 <= _2467;
        6:
            _2480 <= _2473;
        default:
            _2480 <= _2479;
        endcase
    end
    assign _2544 = _2487 == _2476;
    assign _2545 = _2484 & _2544;
    always @(posedge _310) begin
        if (_308)
            _2546 <= _773;
        else
            if (_2545)
                _2546 <= _148;
    end
    assign _2538 = _2487 == _1875;
    assign _2539 = _2484 & _2538;
    always @(posedge _310) begin
        if (_308)
            _2540 <= _773;
        else
            if (_2539)
                _2540 <= _148;
    end
    assign _2532 = _2487 == _1876;
    assign _2533 = _2484 & _2532;
    always @(posedge _310) begin
        if (_308)
            _2534 <= _773;
        else
            if (_2533)
                _2534 <= _148;
    end
    assign _2526 = _2487 == _467;
    assign _2527 = _2484 & _2526;
    always @(posedge _310) begin
        if (_308)
            _2528 <= _773;
        else
            if (_2527)
                _2528 <= _148;
    end
    assign _2520 = _2487 == _1879;
    assign _2521 = _2484 & _2520;
    always @(posedge _310) begin
        if (_308)
            _2522 <= _773;
        else
            if (_2521)
                _2522 <= _148;
    end
    assign _2514 = _2487 == _466;
    assign _2515 = _2484 & _2514;
    always @(posedge _310) begin
        if (_308)
            _2516 <= _773;
        else
            if (_2515)
                _2516 <= _148;
    end
    assign _2508 = _2487 == _494;
    assign _2509 = _2484 & _2508;
    always @(posedge _310) begin
        if (_308)
            _2510 <= _773;
        else
            if (_2509)
                _2510 <= _148;
    end
    assign _2489 = _2487 + _494;
    assign _2490 = _2484 ? _2489 : _2487;
    assign _85 = _2490;
    always @(posedge _310) begin
        if (_308)
            _2487 <= _464;
        else
            _2487 <= _85;
    end
    assign _2502 = _2487 == _464;
    assign _2503 = _2484 & _2502;
    always @(posedge _310) begin
        if (_308)
            _2504 <= _773;
        else
            if (_2503)
                _2504 <= _148;
    end
    assign _2497 = _2495 + _494;
    assign _2498 = _2492 ? _2497 : _2495;
    assign _86 = _2498;
    always @(posedge _310) begin
        if (_308)
            _2495 <= _464;
        else
            _2495 <= _86;
    end
    always @* begin
        case (_2495)
        0:
            _2547 <= _2504;
        1:
            _2547 <= _2510;
        2:
            _2547 <= _2516;
        3:
            _2547 <= _2522;
        4:
            _2547 <= _2528;
        5:
            _2547 <= _2534;
        6:
            _2547 <= _2540;
        default:
            _2547 <= _2546;
        endcase
    end
    assign _2548 = 32'b00000000000000000000000000000001;
    assign _2549 = ts_reg + _2548;
    assign _90 = _2549;
    always @(posedge _310) begin
        if (_308)
            ts_reg <= _2101;
        else
            ts_reg <= _90;
    end
    assign _2551 = 2'b00;
    assign _2410 = { _1961,
                     f_unexp_now };
    assign _2412 = f_amb_now ? _2551 : _2410;
    always @(posedge _310) begin
        if (_308)
            _2552 <= _2551;
        else
            _2552 <= _2412;
    end
    always @(posedge _310) begin
        if (_308)
            _2555 <= _1829;
        else
            _2555 <= f_viol_now;
    end
    always @(posedge _310) begin
        if (_308)
            _2558 <= _2551;
        else
            _2558 <= f_winner;
    end
    always @(posedge _310) begin
        if (_308)
            _2561 <= _1829;
        else
            _2561 <= _1712;
    end
    assign _2562 = _1262[60:60];
    assign _2563 = f_in_eval & _2562;
    assign _2564 = ~ _1845;
    assign _2705 = _103 & _2704;
    assign _2706 = ~ _2705;
    assign _2586 = _1262[23:16];
    assign _2584 = _1279[86:79];
    assign _2583 = _1273[86:79];
    assign _2582 = _1267[86:79];
    assign _2581 = _915[86:79];
    always @* begin
        case (f_winner)
        0:
            _2585 <= _2581;
        1:
            _2585 <= _2582;
        2:
            _2585 <= _2583;
        default:
            _2585 <= _2584;
        endcase
    end
    assign _2587 = _899 ? _2586 : _2585;
    assign _2588 = _2587 & _2578;
    assign _2579 = ~ _2578;
    assign _2580 = f_poe & _2579;
    assign _2589 = _2580 | _2588;
    assign _2623 = _2589 | _2622;
    assign _2624 = _2568 ? _2623 : f_poe;
    assign _2626 = _317 ? _773 : _2624;
    assign _2628 = _1905 ? _773 : _2626;
    assign _100 = _2628;
    always @(posedge _310) begin
        if (_308)
            f_poe <= _773;
        else
            f_poe <= _100;
    end
    assign _2707 = f_poe & _2706;
    assign _103 = host_open_drain;
    assign _4292 = ~ _103;
    assign _2702 = f_lane1_out & _2696;
    assign _2701 = ~ f_lane1_out;
    assign _2699 = ~ f_lane0_out;
    assign _2700 = _2699 & _2696;
    assign _2698 = f_lane0_out & _2696;
    assign _2697 = ~ f_lane0_out;
    assign _2696 = f_pout[0:0];
    assign _2695 = _327[2:0];
    always @* begin
        case (_2695)
        0:
            _2703 <= _2696;
        1:
            _2703 <= f_lane0_out;
        2:
            _2703 <= _2697;
        3:
            _2703 <= _2698;
        4:
            _2703 <= _2700;
        5:
            _2703 <= f_lane1_out;
        6:
            _2703 <= _2701;
        default:
            _2703 <= _2702;
        endcase
    end
    assign _2693 = f_lane1_out & _2687;
    assign _2692 = ~ f_lane1_out;
    assign _2690 = ~ f_lane0_out;
    assign _2691 = _2690 & _2687;
    assign _2689 = f_lane0_out & _2687;
    assign _2688 = ~ f_lane0_out;
    assign _2687 = f_pout[1:1];
    assign _2686 = _327[5:3];
    always @* begin
        case (_2686)
        0:
            _2694 <= _2687;
        1:
            _2694 <= f_lane0_out;
        2:
            _2694 <= _2688;
        3:
            _2694 <= _2689;
        4:
            _2694 <= _2691;
        5:
            _2694 <= f_lane1_out;
        6:
            _2694 <= _2692;
        default:
            _2694 <= _2693;
        endcase
    end
    assign _2684 = f_lane1_out & _2678;
    assign _2683 = ~ f_lane1_out;
    assign _2681 = ~ f_lane0_out;
    assign _2682 = _2681 & _2678;
    assign _2680 = f_lane0_out & _2678;
    assign _2679 = ~ f_lane0_out;
    assign _2678 = f_pout[2:2];
    assign _2677 = _327[8:6];
    always @* begin
        case (_2677)
        0:
            _2685 <= _2678;
        1:
            _2685 <= f_lane0_out;
        2:
            _2685 <= _2679;
        3:
            _2685 <= _2680;
        4:
            _2685 <= _2682;
        5:
            _2685 <= f_lane1_out;
        6:
            _2685 <= _2683;
        default:
            _2685 <= _2684;
        endcase
    end
    assign _2675 = f_lane1_out & _2669;
    assign _2674 = ~ f_lane1_out;
    assign _2672 = ~ f_lane0_out;
    assign _2673 = _2672 & _2669;
    assign _2671 = f_lane0_out & _2669;
    assign _2670 = ~ f_lane0_out;
    assign _2669 = f_pout[3:3];
    assign _2668 = _327[11:9];
    always @* begin
        case (_2668)
        0:
            _2676 <= _2669;
        1:
            _2676 <= f_lane0_out;
        2:
            _2676 <= _2670;
        3:
            _2676 <= _2671;
        4:
            _2676 <= _2673;
        5:
            _2676 <= f_lane1_out;
        6:
            _2676 <= _2674;
        default:
            _2676 <= _2675;
        endcase
    end
    assign _2666 = f_lane1_out & _2660;
    assign _2665 = ~ f_lane1_out;
    assign _2663 = ~ f_lane0_out;
    assign _2664 = _2663 & _2660;
    assign _2662 = f_lane0_out & _2660;
    assign _2661 = ~ f_lane0_out;
    assign _2660 = f_pout[4:4];
    assign _2659 = _327[14:12];
    always @* begin
        case (_2659)
        0:
            _2667 <= _2660;
        1:
            _2667 <= f_lane0_out;
        2:
            _2667 <= _2661;
        3:
            _2667 <= _2662;
        4:
            _2667 <= _2664;
        5:
            _2667 <= f_lane1_out;
        6:
            _2667 <= _2665;
        default:
            _2667 <= _2666;
        endcase
    end
    assign _2657 = f_lane1_out & _2651;
    assign _2656 = ~ f_lane1_out;
    assign _2654 = ~ f_lane0_out;
    assign _2655 = _2654 & _2651;
    assign _2653 = f_lane0_out & _2651;
    assign _2652 = ~ f_lane0_out;
    assign _2651 = f_pout[5:5];
    assign _2650 = _327[17:15];
    always @* begin
        case (_2650)
        0:
            _2658 <= _2651;
        1:
            _2658 <= f_lane0_out;
        2:
            _2658 <= _2652;
        3:
            _2658 <= _2653;
        4:
            _2658 <= _2655;
        5:
            _2658 <= f_lane1_out;
        6:
            _2658 <= _2656;
        default:
            _2658 <= _2657;
        endcase
    end
    assign _2648 = f_lane1_out & _2642;
    assign _2647 = ~ f_lane1_out;
    assign _2645 = ~ f_lane0_out;
    assign _2646 = _2645 & _2642;
    assign _2644 = f_lane0_out & _2642;
    assign _2643 = ~ f_lane0_out;
    assign _2642 = f_pout[6:6];
    assign _2641 = _327[20:18];
    always @* begin
        case (_2641)
        0:
            _2649 <= _2642;
        1:
            _2649 <= f_lane0_out;
        2:
            _2649 <= _2643;
        3:
            _2649 <= _2644;
        4:
            _2649 <= _2646;
        5:
            _2649 <= f_lane1_out;
        6:
            _2649 <= _2647;
        default:
            _2649 <= _2648;
        endcase
    end
    assign _2639 = f_lane1_out & _2633;
    assign _2638 = ~ f_lane1_out;
    assign _2636 = ~ f_lane0_out;
    assign _2637 = _2636 & _2633;
    assign _2635 = f_lane0_out & _2633;
    assign _2634 = ~ f_lane0_out;
    assign _4284 = { _4282,
                     _4281 };
    assign _4281 = _1189[0:0];
    assign _4282 = { _4281,
                     _4281 };
    assign _4283 = { _4282,
                     _4282 };
    assign _4285 = { _4283,
                     _4284 };
    assign _4286 = { _4285,
                     _4281 };
    assign _4287 = _4286 & _2622;
    assign _2620 = _2616 & _2614;
    assign _2619 = _2616 & _2612;
    assign _2618 = _2616 & _2609;
    assign _2616 = ~ _2603;
    assign _2617 = _2616 & _2606;
    assign _2614 = _2611 & _2608;
    assign _2615 = _2603 & _2614;
    assign _2611 = ~ _2604;
    assign _2612 = _2611 & _2605;
    assign _2613 = _2603 & _2612;
    assign _2608 = ~ _2605;
    assign _2609 = _2604 & _2608;
    assign _2610 = _2603 & _2609;
    assign _2605 = _2602[0:0];
    assign _2604 = _2602[1:1];
    assign _2606 = _2604 & _2605;
    assign _2603 = _2602[2:2];
    assign _2607 = _2603 & _2606;
    assign _2621 = { _2607,
                     _2610,
                     _2613,
                     _2615,
                     _2617,
                     _2618,
                     _2619,
                     _2620 };
    assign _2590 = ~ _899;
    assign _2596 = _2590 & _2595;
    assign _2622 = _2596 ? _2621 : _773;
    assign _4279 = ~ _2622;
    assign _4275 = _1262[15:8];
    assign _4273 = _1279[78:71];
    assign _4272 = _1273[78:71];
    assign _4271 = _1267[78:71];
    assign _4270 = _915[78:71];
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
    assign _4276 = _899 ? _4275 : _4274;
    assign _4277 = _4276 & _2578;
    assign _2577 = _1262[7:0];
    assign _2575 = _1279[70:63];
    assign _2574 = _1273[70:63];
    assign _2573 = _1267[70:63];
    assign _2572 = _915[70:63];
    always @* begin
        case (f_winner)
        0:
            _2576 <= _2572;
        1:
            _2576 <= _2573;
        2:
            _2576 <= _2574;
        default:
            _2576 <= _2575;
        endcase
    end
    assign _2578 = _899 ? _2577 : _2576;
    assign _4268 = ~ _2578;
    assign _4269 = f_pout & _4268;
    assign _4278 = _4269 | _4277;
    assign _4280 = _4278 & _4279;
    assign _4288 = _4280 | _4287;
    assign _2566 = _1210 == _2551;
    assign _2567 = _2566 | _1212;
    assign _2568 = _1713 & _2567;
    assign _4289 = _2568 ? _4288 : f_pout;
    assign _105 = host_crc_expect;
    assign _4261 = 32'b11111111111111111111111111111111;
    assign _2822 = 32'b11101101101110001000001100100000;
    assign _2820 = _2814[31:1];
    assign _2821 = { _1829,
                     _2820 };
    assign _2823 = _2821 ^ _2822;
    assign _2817 = _2814[31:1];
    assign _2818 = { _1829,
                     _2817 };
    assign _2810 = _2804[31:1];
    assign _2811 = { _1829,
                     _2810 };
    assign _2813 = _2811 ^ _2822;
    assign _2807 = _2804[31:1];
    assign _2808 = { _1829,
                     _2807 };
    assign _2800 = _2794[31:1];
    assign _2801 = { _1829,
                     _2800 };
    assign _2803 = _2801 ^ _2822;
    assign _2797 = _2794[31:1];
    assign _2798 = { _1829,
                     _2797 };
    assign _2790 = _2784[31:1];
    assign _2791 = { _1829,
                     _2790 };
    assign _2793 = _2791 ^ _2822;
    assign _2787 = _2784[31:1];
    assign _2788 = { _1829,
                     _2787 };
    assign _2780 = _2774[31:1];
    assign _2781 = { _1829,
                     _2780 };
    assign _2783 = _2781 ^ _2822;
    assign _2777 = _2774[31:1];
    assign _2778 = { _1829,
                     _2777 };
    assign _2770 = _2764[31:1];
    assign _2771 = { _1829,
                     _2770 };
    assign _2773 = _2771 ^ _2822;
    assign _2767 = _2764[31:1];
    assign _2768 = { _1829,
                     _2767 };
    assign _2760 = _2754[31:1];
    assign _2761 = { _1829,
                     _2760 };
    assign _2763 = _2761 ^ _2822;
    assign _2757 = _2754[31:1];
    assign _2758 = { _1829,
                     _2757 };
    assign _2750 = _2744[31:1];
    assign _2751 = { _1829,
                     _2750 };
    assign _2753 = _2751 ^ _2822;
    assign _2747 = _2744[31:1];
    assign _2748 = { _1829,
                     _2747 };
    assign _2741 = _302[127:120];
    assign _2740 = _302[119:112];
    assign _2739 = _302[111:104];
    assign _2738 = _302[103:96];
    assign _2737 = _302[95:88];
    assign _2736 = _302[87:80];
    assign _2735 = _302[79:72];
    assign _2734 = _302[71:64];
    assign _2733 = _302[63:56];
    assign _2732 = _302[55:48];
    assign _2731 = _302[47:40];
    assign _2730 = _302[39:32];
    assign _2729 = _302[31:24];
    assign _2728 = _302[23:16];
    assign _2727 = _302[15:8];
    assign _2726 = _302[7:0];
    assign _2723 = 13'b0000000000001;
    assign _2724 = f_sw_cnt - _2723;
    assign _2725 = _2724[3:0];
    always @* begin
        case (_2725)
        0:
            _2742 <= _2726;
        1:
            _2742 <= _2727;
        2:
            _2742 <= _2728;
        3:
            _2742 <= _2729;
        4:
            _2742 <= _2730;
        5:
            _2742 <= _2731;
        6:
            _2742 <= _2732;
        7:
            _2742 <= _2733;
        8:
            _2742 <= _2734;
        9:
            _2742 <= _2735;
        10:
            _2742 <= _2736;
        11:
            _2742 <= _2737;
        12:
            _2742 <= _2738;
        13:
            _2742 <= _2739;
        14:
            _2742 <= _2740;
        default:
            _2742 <= _2741;
        endcase
    end
    assign _2722 = 24'b000000000000000000000000;
    assign _2743 = { _2722,
                     _2742 };
    assign _2720 = f_sw_cnt == _2028;
    assign _2721 = ~ _2720;
    assign _2825 = _2721 ? _2824 : _2715;
    assign _2715 = _2710 ? _4261 : _2713;
    assign _2826 = f_sweeping ? _2825 : _2715;
    assign _106 = _2826;
    always @(posedge _310) begin
        if (_308)
            _2713 <= _4261;
        else
            _2713 <= _106;
    end
    assign _2744 = _2713 ^ _2743;
    assign _2745 = _2744[0:0];
    assign _2754 = _2745 ? _2753 : _2748;
    assign _2755 = _2754[0:0];
    assign _2764 = _2755 ? _2763 : _2758;
    assign _2765 = _2764[0:0];
    assign _2774 = _2765 ? _2773 : _2768;
    assign _2775 = _2774[0:0];
    assign _2784 = _2775 ? _2783 : _2778;
    assign _2785 = _2784[0:0];
    assign _2794 = _2785 ? _2793 : _2788;
    assign _2795 = _2794[0:0];
    assign _2804 = _2795 ? _2803 : _2798;
    assign _2805 = _2804[0:0];
    assign _2814 = _2805 ? _2813 : _2808;
    assign _2815 = _2814[0:0];
    assign _2824 = _2815 ? _2823 : _2818;
    assign _4262 = _2824 ^ _4261;
    assign f_sw_match = _4262 == _105;
    assign _4264 = f_sw_last ? f_sw_match : _4260;
    assign _4266 = _4248 ? _1829 : _4264;
    assign _4256 = f_store_we | _108;
    assign _4258 = _4256 ? _1829 : f_image_valid;
    assign _4260 = _2710 ? _1829 : _4258;
    assign _4249 = 13'b1000000000000;
    assign f_sw_last = f_sw_cnt == _4249;
    assign _4252 = f_sw_last ? _1829 : _4245;
    assign _108 = host_crc_expect_we;
    assign _4246 = _324 | _290;
    assign _4247 = _4246 | _108;
    assign _4248 = f_sweeping & _4247;
    assign _4254 = _4248 ? _1829 : _4252;
    assign _2709 = ~ f_sweeping;
    assign _4238 = _899 ? _2058 : _891;
    assign _4234 = _4100 ? _2057 : _891;
    assign _1973 = 2'b11;
    assign _4225 = f_policy == _1973;
    assign _4227 = _4225 ? _2551 : _891;
    assign _4224 = f_policy == _2058;
    assign _4229 = _4224 ? _2057 : _4227;
    assign _4223 = f_policy == _2551;
    assign _4231 = _4223 ? _2551 : _4229;
    assign _4232 = f_viol_now ? _4231 : _891;
    assign _1707 = f_chgmask3 & f_multi_eff;
    assign _1709 = _1707 == _773;
    assign _1700 = _1657 == _2010;
    assign _1695 = 16'b0000000000000000;
    assign _1696 = _1657 == _1695;
    assign _1697 = _1696 & _1677;
    assign _1694 = _1593 == _1653;
    assign _1698 = _1694 | _1697;
    assign _1701 = _1592 ? _1700 : _1698;
    assign _1691 = _1199[3:0];
    assign _1693 = _1691 == _1996;
    assign _1702 = _1693 | _1701;
    assign _1689 = _1657 == _2010;
    assign _1685 = _1657 == _1695;
    assign _1686 = _1685 & _1677;
    assign _1683 = _1593 == _1653;
    assign _1687 = _1683 | _1686;
    assign _1690 = _1592 ? _1689 : _1687;
    assign _1681 = _1644 == _2010;
    always @(posedge _310) begin
        if (_308)
            _1675 <= _464;
        else
            _1675 <= _1636;
    end
    assign _1676 = { _2028,
                     _1675 };
    assign _1677 = _1590 < _1676;
    assign _1671 = _1644 == _1695;
    assign _1678 = _1671 & _1677;
    assign _1669 = _1593 == _1641;
    assign _1679 = _1669 | _1678;
    assign _1682 = _1592 ? _1681 : _1679;
    assign _1668 = _1279[104:103];
    always @* begin
        case (_1668)
        0:
            _1703 <= vdd;
        1:
            _1703 <= _1682;
        2:
            _1703 <= _1690;
        default:
            _1703 <= _1702;
        endcase
    end
    assign _1667 = ~ _1212;
    assign _1704 = _1667 | _1703;
    assign _1664 = _1279[62:62];
    assign _1662 = _1279[61:58];
    always @* begin
        case (_1662)
        0:
            _1663 <= vdd;
        1:
            _1663 <= _1186;
        2:
            _1663 <= _1190;
        3:
            _1663 <= _1194;
        4:
            _1663 <= _1196;
        5:
            _1663 <= _755;
        6:
            _1663 <= _1200;
        7:
            _1663 <= _1203;
        8:
            _1663 <= _675;
        9:
            _1663 <= _678;
        10:
            _1663 <= _681;
        11:
            _1663 <= _684;
        12:
            _1663 <= _663;
        13:
            _1663 <= _666;
        14:
            _1663 <= _669;
        default:
            _1663 <= _672;
        endcase
    end
    assign _1665 = _1663 ^ _1664;
    assign _1657 = _1279[57:42];
    assign _1659 = _1657 == _2010;
    assign _1652 = 17'b00000000000000000;
    assign _1648 = _1594[57:42];
    assign _1649 = { gnd,
                     _1648 };
    assign _1650 = _1649 + _1637;
    always @(posedge _310) begin
        if (_308)
            _1653 <= _1652;
        else
            _1653 <= _1650;
    end
    assign _1654 = _1653 < _1593;
    assign _1655 = ~ _1654;
    assign _1644 = _1279[41:26];
    assign _1646 = _1644 == _1695;
    assign _1628 = _1598[0:0];
    assign _1630 = _1628 ? _1148 : _464;
    assign _1625 = _1598[1:1];
    assign _1627 = _1625 ? _1127 : _464;
    assign _1631 = _1627 < _1630;
    assign _1632 = _1631 ? _1630 : _1627;
    assign _1620 = _1598[2:2];
    assign _1622 = _1620 ? _1104 : _464;
    assign _1617 = _1598[3:3];
    assign _1619 = _1617 ? _1083 : _464;
    assign _1623 = _1619 < _1622;
    assign _1624 = _1623 ? _1622 : _1619;
    assign _1633 = _1624 < _1632;
    assign _1634 = _1633 ? _1632 : _1624;
    assign _1610 = _1598[4:4];
    assign _1612 = _1610 ? _1058 : _464;
    assign _1607 = _1598[5:5];
    assign _1609 = _1607 ? _1037 : _464;
    assign _1613 = _1609 < _1612;
    assign _1614 = _1613 ? _1612 : _1609;
    assign _1602 = _1598[6:6];
    assign _1604 = _1602 ? _1014 : _464;
    assign _1598 = _1594[23:16];
    assign _1599 = _1598[7:7];
    assign _1601 = _1599 ? _993 : _464;
    assign _1605 = _1601 < _1604;
    assign _1606 = _1605 ? _1604 : _1601;
    assign _1615 = _1606 < _1614;
    assign _1616 = _1615 ? _1614 : _1606;
    assign _1635 = _1616 < _1634;
    assign _1636 = _1635 ? _1634 : _1616;
    assign _1597 = 14'b00000000000000;
    assign _1637 = { _1597,
                     _1636 };
    assign _1594 = _968[511:400];
    assign _1595 = _1594[41:26];
    assign _1596 = { gnd,
                     _1595 };
    assign _1638 = _1596 + _1637;
    always @(posedge _310) begin
        if (_308)
            _1641 <= _1652;
        else
            _1641 <= _1638;
    end
    assign _1593 = { gnd,
                     _1590 };
    assign _1642 = _1593 < _1641;
    assign _1643 = ~ _1642;
    assign _1647 = _1643 | _1646;
    assign _1656 = _1647 & _1655;
    assign _1589 = _1279[25:24];
    always @* begin
        case (_1589)
        0:
            _1590 <= _941;
        1:
            _1590 <= _944;
        2:
            _1590 <= _947;
        default:
            _1590 <= _947;
        endcase
    end
    assign _1592 = _1590 == _2010;
    assign _1660 = _1592 ? _1659 : _1656;
    assign _1583 = f_changed_all & f_chgmask3;
    assign _1585 = _1583 == _773;
    assign _1586 = ~ _1585;
    assign _1582 = f_chgmask3 == _773;
    assign _1587 = _1582 | _1586;
    assign _1576 = _1279[7:0];
    assign _1574 = _1279[15:8];
    assign _1575 = _346 ^ _1574;
    assign _1577 = _1575 & _1576;
    assign _1579 = _1577 == _773;
    assign _1580 = f_valid3 & _1579;
    assign _1588 = _1580 & _1587;
    assign _1661 = _1588 & _1660;
    assign _1666 = _1661 & _1665;
    assign _1705 = _1666 & _1704;
    assign _1706 = f_in_eval & _1705;
    assign _1710 = _1706 & _1709;
    assign f_fire3 = _1710 & _1294;
    assign _1258 = f_chgmask0 & f_multi_eff;
    assign _1260 = _1258 == _773;
    assign _1246 = _1176 == _2010;
    assign _1242 = _1176 == _1695;
    assign _1243 = _1242 & _1223;
    assign _1240 = _951 == _1172;
    assign _1244 = _1240 | _1243;
    assign _1247 = _950 ? _1246 : _1244;
    assign _1237 = _1199[3:0];
    assign _1239 = _1237 == _1996;
    assign _1248 = _1239 | _1247;
    assign _1235 = _1176 == _2010;
    assign _1231 = _1176 == _1695;
    assign _1232 = _1231 & _1223;
    assign _1229 = _951 == _1172;
    assign _1233 = _1229 | _1232;
    assign _1236 = _950 ? _1235 : _1233;
    assign _1227 = _1163 == _2010;
    always @(posedge _310) begin
        if (_308)
            _1221 <= _464;
        else
            _1221 <= _1155;
    end
    assign _1222 = { _2028,
                     _1221 };
    assign _1223 = _948 < _1222;
    assign _1217 = _1163 == _1695;
    assign _1224 = _1217 & _1223;
    assign _1215 = _951 == _1160;
    assign _1225 = _1215 | _1224;
    assign _1228 = _950 ? _1227 : _1225;
    assign _1214 = _915[104:103];
    always @* begin
        case (_1214)
        0:
            _1249 <= vdd;
        1:
            _1249 <= _1228;
        2:
            _1249 <= _1236;
        default:
            _1249 <= _1248;
        endcase
    end
    assign _1213 = ~ _1212;
    assign _1250 = _1213 | _1249;
    assign _1205 = _915[62:62];
    assign _1181 = _915[61:58];
    always @* begin
        case (_1181)
        0:
            _1204 <= vdd;
        1:
            _1204 <= _1186;
        2:
            _1204 <= _1190;
        3:
            _1204 <= _1194;
        4:
            _1204 <= _1196;
        5:
            _1204 <= _755;
        6:
            _1204 <= _1200;
        7:
            _1204 <= _1203;
        8:
            _1204 <= _675;
        9:
            _1204 <= _678;
        10:
            _1204 <= _681;
        11:
            _1204 <= _684;
        12:
            _1204 <= _663;
        13:
            _1204 <= _666;
        14:
            _1204 <= _669;
        default:
            _1204 <= _672;
        endcase
    end
    assign _1206 = _1204 ^ _1205;
    assign _1176 = _915[57:42];
    assign _1178 = _1176 == _2010;
    assign _1167 = _969[57:42];
    assign _1168 = { gnd,
                     _1167 };
    assign _1169 = _1168 + _1156;
    always @(posedge _310) begin
        if (_308)
            _1172 <= _1652;
        else
            _1172 <= _1169;
    end
    assign _1173 = _1172 < _951;
    assign _1174 = ~ _1173;
    assign _1163 = _915[41:26];
    assign _1165 = _1163 == _1695;
    assign _1129 = _973[0:0];
    assign _1149 = _1129 ? _1148 : _464;
    assign _1108 = _973[1:1];
    assign _1128 = _1108 ? _1127 : _464;
    assign _1150 = _1128 < _1149;
    assign _1151 = _1150 ? _1149 : _1128;
    assign _1085 = _973[2:2];
    assign _1105 = _1085 ? _1104 : _464;
    assign _1064 = _973[3:3];
    assign _1084 = _1064 ? _1083 : _464;
    assign _1106 = _1084 < _1105;
    assign _1107 = _1106 ? _1105 : _1084;
    assign _1152 = _1107 < _1151;
    assign _1153 = _1152 ? _1151 : _1107;
    assign _1039 = _973[4:4];
    assign _1059 = _1039 ? _1058 : _464;
    assign _1018 = _973[5:5];
    assign _1038 = _1018 ? _1037 : _464;
    assign _1060 = _1038 < _1059;
    assign _1061 = _1060 ? _1059 : _1038;
    assign _995 = _973[6:6];
    assign _1015 = _995 ? _1014 : _464;
    assign _973 = _969[23:16];
    assign _974 = _973[7:7];
    assign _994 = _974 ? _993 : _464;
    assign _1016 = _994 < _1015;
    assign _1017 = _1016 ? _1015 : _994;
    assign _1062 = _1017 < _1061;
    assign _1063 = _1062 ? _1061 : _1017;
    assign _1154 = _1063 < _1153;
    assign _1155 = _1154 ? _1153 : _1063;
    assign _1156 = { _1597,
                     _1155 };
    assign _969 = _968[175:64];
    assign _970 = _969[41:26];
    assign _971 = { gnd,
                    _970 };
    assign _1157 = _971 + _1156;
    always @(posedge _310) begin
        if (_308)
            _1160 <= _1652;
        else
            _1160 <= _1157;
    end
    assign _951 = { gnd,
                    _948 };
    assign _1161 = _951 < _1160;
    assign _1162 = ~ _1161;
    assign _1166 = _1162 | _1165;
    assign _1175 = _1166 & _1174;
    assign _938 = _915[25:24];
    always @* begin
        case (_938)
        0:
            _948 <= _941;
        1:
            _948 <= _944;
        2:
            _948 <= _947;
        default:
            _948 <= _947;
        endcase
    end
    assign _950 = _948 == _2010;
    assign _1179 = _950 ? _1178 : _1175;
    assign _932 = f_changed_all & f_chgmask0;
    assign _934 = _932 == _773;
    assign _935 = ~ _934;
    assign _926 = f_chgmask0 == _773;
    assign _936 = _926 | _935;
    assign _919 = _915[7:0];
    assign _917 = _915[15:8];
    assign _918 = _346 ^ _917;
    assign _920 = _918 & _919;
    assign _922 = _920 == _773;
    assign _903 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _4208 = _896 + _494;
    assign _4204 = _4100 ? _464 : _896;
    assign _4199 = f_policy == _2058;
    assign _4201 = _4199 ? _464 : _896;
    assign _1964 = f_changed_all & f_watch;
    assign _1966 = _1964 == _773;
    assign _1967 = ~ _1966;
    assign _1962 = ~ _1712;
    assign _1963 = f_in_eval & _1962;
    assign f_unexp_now = _1963 & _1967;
    assign _2830 = ~ f_amb_now;
    assign _2831 = _1961 & _2830;
    assign _2833 = _2831 ? _1831 : _2829;
    assign _2834 = _1712 ? _2829 : _2833;
    assign _2829 = _1713 ? _1829 : _1959;
    assign _2827 = _891 == _2058;
    assign _2835 = _2827 ? _2834 : _2829;
    assign _109 = _2835;
    always @(posedge _310) begin
        if (_308)
            _1959 <= _1829;
        else
            _1959 <= _109;
    end
    assign _1960 = ~ _1959;
    assign _4190 = 16'b0000000000000001;
    assign _4191 = _941 + _4190;
    assign _4187 = _941 == _2010;
    assign _4188 = ~ _4187;
    assign _4189 = _4148 & _4188;
    assign _4192 = _4189 ? _4191 : _941;
    assign _4132 = _1262[26:24];
    assign _4130 = _1279[93:91];
    assign _4129 = _1273[93:91];
    assign _4128 = _1267[93:91];
    assign _4127 = _915[93:91];
    assign _1568 = f_chgmask2 & f_multi_eff;
    assign _1570 = _1568 == _773;
    assign _1561 = _1518 == _2010;
    assign _1557 = _1518 == _1695;
    assign _1558 = _1557 & _1538;
    assign _1555 = _1454 == _1514;
    assign _1559 = _1555 | _1558;
    assign _1562 = _1453 ? _1561 : _1559;
    assign _1552 = _1199[3:0];
    assign _1554 = _1552 == _1996;
    assign _1563 = _1554 | _1562;
    assign _1550 = _1518 == _2010;
    assign _1546 = _1518 == _1695;
    assign _1547 = _1546 & _1538;
    assign _1544 = _1454 == _1514;
    assign _1548 = _1544 | _1547;
    assign _1551 = _1453 ? _1550 : _1548;
    assign _1542 = _1505 == _2010;
    always @(posedge _310) begin
        if (_308)
            _1536 <= _464;
        else
            _1536 <= _1497;
    end
    assign _1537 = { _2028,
                     _1536 };
    assign _1538 = _1451 < _1537;
    assign _1532 = _1505 == _1695;
    assign _1539 = _1532 & _1538;
    assign _1530 = _1454 == _1502;
    assign _1540 = _1530 | _1539;
    assign _1543 = _1453 ? _1542 : _1540;
    assign _1529 = _1273[104:103];
    always @* begin
        case (_1529)
        0:
            _1564 <= vdd;
        1:
            _1564 <= _1543;
        2:
            _1564 <= _1551;
        default:
            _1564 <= _1563;
        endcase
    end
    assign _1528 = ~ _1212;
    assign _1565 = _1528 | _1564;
    assign _1525 = _1273[62:62];
    assign _1523 = _1273[61:58];
    always @* begin
        case (_1523)
        0:
            _1524 <= vdd;
        1:
            _1524 <= _1186;
        2:
            _1524 <= _1190;
        3:
            _1524 <= _1194;
        4:
            _1524 <= _1196;
        5:
            _1524 <= _755;
        6:
            _1524 <= _1200;
        7:
            _1524 <= _1203;
        8:
            _1524 <= _675;
        9:
            _1524 <= _678;
        10:
            _1524 <= _681;
        11:
            _1524 <= _684;
        12:
            _1524 <= _663;
        13:
            _1524 <= _666;
        14:
            _1524 <= _669;
        default:
            _1524 <= _672;
        endcase
    end
    assign _1526 = _1524 ^ _1525;
    assign _1518 = _1273[57:42];
    assign _1520 = _1518 == _2010;
    assign _1509 = _1455[57:42];
    assign _1510 = { gnd,
                     _1509 };
    assign _1511 = _1510 + _1498;
    always @(posedge _310) begin
        if (_308)
            _1514 <= _1652;
        else
            _1514 <= _1511;
    end
    assign _1515 = _1514 < _1454;
    assign _1516 = ~ _1515;
    assign _1505 = _1273[41:26];
    assign _1507 = _1505 == _1695;
    assign _1489 = _1459[0:0];
    assign _1491 = _1489 ? _1148 : _464;
    assign _1486 = _1459[1:1];
    assign _1488 = _1486 ? _1127 : _464;
    assign _1492 = _1488 < _1491;
    assign _1493 = _1492 ? _1491 : _1488;
    assign _1481 = _1459[2:2];
    assign _1483 = _1481 ? _1104 : _464;
    assign _1478 = _1459[3:3];
    assign _1480 = _1478 ? _1083 : _464;
    assign _1484 = _1480 < _1483;
    assign _1485 = _1484 ? _1483 : _1480;
    assign _1494 = _1485 < _1493;
    assign _1495 = _1494 ? _1493 : _1485;
    assign _1471 = _1459[4:4];
    assign _1473 = _1471 ? _1058 : _464;
    assign _1468 = _1459[5:5];
    assign _1470 = _1468 ? _1037 : _464;
    assign _1474 = _1470 < _1473;
    assign _1475 = _1474 ? _1473 : _1470;
    assign _1463 = _1459[6:6];
    assign _1465 = _1463 ? _1014 : _464;
    assign _1459 = _1455[23:16];
    assign _1460 = _1459[7:7];
    assign _1462 = _1460 ? _993 : _464;
    assign _1466 = _1462 < _1465;
    assign _1467 = _1466 ? _1465 : _1462;
    assign _1476 = _1467 < _1475;
    assign _1477 = _1476 ? _1475 : _1467;
    assign _1496 = _1477 < _1495;
    assign _1497 = _1496 ? _1495 : _1477;
    assign _1498 = { _1597,
                     _1497 };
    assign _1455 = _968[399:288];
    assign _1456 = _1455[41:26];
    assign _1457 = { gnd,
                     _1456 };
    assign _1499 = _1457 + _1498;
    always @(posedge _310) begin
        if (_308)
            _1502 <= _1652;
        else
            _1502 <= _1499;
    end
    assign _1454 = { gnd,
                     _1451 };
    assign _1503 = _1454 < _1502;
    assign _1504 = ~ _1503;
    assign _1508 = _1504 | _1507;
    assign _1517 = _1508 & _1516;
    assign _1450 = _1273[25:24];
    always @* begin
        case (_1450)
        0:
            _1451 <= _941;
        1:
            _1451 <= _944;
        2:
            _1451 <= _947;
        default:
            _1451 <= _947;
        endcase
    end
    assign _1453 = _1451 == _2010;
    assign _1521 = _1453 ? _1520 : _1517;
    assign _1444 = f_changed_all & f_chgmask2;
    assign _1446 = _1444 == _773;
    assign _1447 = ~ _1446;
    assign _1443 = f_chgmask2 == _773;
    assign _1448 = _1443 | _1447;
    assign _1437 = _1273[7:0];
    assign _1435 = _1273[15:8];
    assign _1436 = _346 ^ _1435;
    assign _1438 = _1436 & _1437;
    assign _1440 = _1438 == _773;
    assign _1441 = f_valid2 & _1440;
    assign _1449 = _1441 & _1448;
    assign _1522 = _1449 & _1521;
    assign _1527 = _1522 & _1526;
    assign _1566 = _1527 & _1565;
    assign _1567 = f_in_eval & _1566;
    assign _1571 = _1567 & _1570;
    assign f_fire2 = _1571 & _1294;
    assign _1716 = f_fire2 ? _2058 : _1973;
    assign _1293 = f_policy == _2057;
    assign f_chgmask3 = _1279[23:16];
    assign f_valid3 = _1279[111:111];
    assign _1283 = f_valid3 ? f_chgmask3 : _773;
    assign f_chgmask2 = _1273[23:16];
    assign f_valid2 = _1273[111:111];
    assign _1277 = f_valid2 ? f_chgmask2 : _773;
    assign _1271 = f_valid1 ? f_chgmask1 : _773;
    assign f_chgmask0 = _915[23:16];
    assign _1265 = f_valid0 ? f_chgmask0 : _773;
    assign f_watch = _1262[57:50];
    assign _1266 = f_watch | _1265;
    assign _1272 = _1266 | _1271;
    assign _1278 = _1272 | _1277;
    assign f_relevant = _1278 | _1283;
    assign _1285 = f_multi_eff & f_relevant;
    assign _1287 = _1285 == _773;
    assign _1288 = ~ _1287;
    assign f_amb_now = f_in_eval & _1288;
    assign _1290 = ~ f_amb_now;
    assign _1294 = _1290 | _1293;
    assign _1256 = _929 & f_chg_now;
    assign _2840 = _929 & f_chg_now;
    assign _2841 = _1255 | _2840;
    assign _2837 = _891 == _2058;
    assign _2839 = _2837 ? _773 : _1255;
    assign _2836 = _891 == _2057;
    assign _2842 = _2836 ? _2841 : _2839;
    assign _2844 = _1905 ? _773 : _2842;
    assign _110 = _2844;
    always @(posedge _310) begin
        if (_308)
            _1255 <= _773;
        else
            _1255 <= _110;
    end
    assign f_multi_eff = _1255 | _1256;
    assign _1429 = f_chgmask1 & f_multi_eff;
    assign _1431 = _1429 == _773;
    assign _1422 = _1379 == _2010;
    assign _1418 = _1379 == _1695;
    assign _1419 = _1418 & _1399;
    assign _1416 = _1315 == _1375;
    assign _1420 = _1416 | _1419;
    assign _1423 = _1314 ? _1422 : _1420;
    assign _1413 = _1199[3:0];
    assign _1415 = _1413 == _1996;
    assign _1424 = _1415 | _1423;
    assign _1411 = _1379 == _2010;
    assign _1407 = _1379 == _1695;
    assign _1408 = _1407 & _1399;
    assign _1405 = _1315 == _1375;
    assign _1409 = _1405 | _1408;
    assign _1412 = _1314 ? _1411 : _1409;
    assign _1403 = _1366 == _2010;
    always @(posedge _310) begin
        if (_308)
            _1397 <= _464;
        else
            _1397 <= _1358;
    end
    assign _1398 = { _2028,
                     _1397 };
    assign _1399 = _1312 < _1398;
    assign _1393 = _1366 == _1695;
    assign _1400 = _1393 & _1399;
    assign _1391 = _1315 == _1363;
    assign _1401 = _1391 | _1400;
    assign _1404 = _1314 ? _1403 : _1401;
    assign _1390 = _1267[104:103];
    always @* begin
        case (_1390)
        0:
            _1425 <= vdd;
        1:
            _1425 <= _1404;
        2:
            _1425 <= _1412;
        default:
            _1425 <= _1424;
        endcase
    end
    assign _112 = host_role;
    assign _2845 = _1905 ? _112 : _1210;
    assign _113 = _2845;
    always @(posedge _310) begin
        if (_308)
            _1210 <= _2551;
        else
            _1210 <= _113;
    end
    assign _1212 = _1210 == _2058;
    assign _1389 = ~ _1212;
    assign _1426 = _1389 | _1425;
    assign _1386 = _1267[62:62];
    assign _2849 = _654 ? _1831 : _2847;
    assign _2847 = _624 ? _1831 : _672;
    assign _2850 = _609 ? _2849 : _2847;
    assign _2852 = _505 ? _1829 : _2850;
    assign _2854 = _503 ? _1829 : _2852;
    assign _114 = _2854;
    always @(posedge _310) begin
        if (_308)
            _672 <= _1829;
        else
            _672 <= _114;
    end
    assign _116 = host_lane1_sync_mask;
    assign _118 = host_lane1_sync;
    assign _2860 = _2859 ^ _118;
    assign _2861 = _2860 & _116;
    assign _2863 = _2861 == _1695;
    assign _2865 = _2863 ? _1831 : _669;
    assign _2866 = _787 ? _2865 : _669;
    assign _2867 = _654 ? _669 : _2866;
    assign _2868 = _609 ? _2867 : _669;
    assign _2870 = _505 ? _1829 : _2868;
    assign _2872 = _503 ? _1829 : _2870;
    assign _119 = _2872;
    always @(posedge _310) begin
        if (_308)
            _669 <= _1829;
        else
            _669 <= _119;
    end
    assign _2885 = _645 == _2884;
    assign _2886 = ~ _2885;
    assign _2888 = _2879 ? _2887 : g_crc_bad;
    assign _2889 = _787 ? _2888 : g_crc_bad;
    assign _2890 = _654 ? g_crc_bad : _2889;
    assign _2891 = _609 ? _2890 : g_crc_bad;
    assign _2893 = _505 ? _1829 : _2891;
    assign _120 = _2893;
    always @(posedge _310) begin
        if (_308)
            g_crc_bad <= _1829;
        else
            g_crc_bad <= _120;
    end
    assign _2887 = g_crc_bad | _2886;
    assign _2896 = ~ _2887;
    assign _2894 = 6'b000001;
    assign _2895 = g_left == _2894;
    assign _2897 = _2895 ? _2896 : _666;
    assign _2898 = _2879 ? _2897 : _666;
    assign _2899 = _787 ? _2898 : _666;
    assign _2900 = _654 ? _666 : _2899;
    assign _2901 = _609 ? _2900 : _666;
    assign _2903 = _505 ? _1829 : _2901;
    assign _2905 = _503 ? _1829 : _2903;
    assign _121 = _2905;
    always @(posedge _310) begin
        if (_308)
            _666 <= _1829;
        else
            _666 <= _121;
    end
    assign _2909 = _493 ? _1831 : _2907;
    assign _2907 = _462 ? _1831 : _684;
    assign _2910 = _447 ? _2909 : _2907;
    assign _2912 = _333 ? _1829 : _2910;
    assign _2914 = _331 ? _1829 : _2912;
    assign _122 = _2914;
    always @(posedge _310) begin
        if (_308)
            _684 <= _1829;
        else
            _684 <= _122;
    end
    assign _124 = host_lane0_sync_mask;
    assign _126 = host_lane0_sync;
    assign _2920 = _2919 ^ _126;
    assign _2921 = _2920 & _124;
    assign _2923 = _2921 == _1695;
    assign _2925 = _2923 ? _1831 : _681;
    assign _2926 = _687 ? _2925 : _681;
    assign _2927 = _493 ? _681 : _2926;
    assign _2928 = _447 ? _2927 : _681;
    assign _2930 = _333 ? _1829 : _2928;
    assign _2932 = _331 ? _1829 : _2930;
    assign _127 = _2932;
    always @(posedge _310) begin
        if (_308)
            _681 <= _1829;
        else
            _681 <= _127;
    end
    assign _2945 = _483 == _2944;
    assign _2946 = ~ _2945;
    assign _2948 = _2939 ? _2947 : g_crc_bad_0;
    assign _2949 = _687 ? _2948 : g_crc_bad_0;
    assign _2950 = _493 ? g_crc_bad_0 : _2949;
    assign _2951 = _447 ? _2950 : g_crc_bad_0;
    assign _2953 = _333 ? _1829 : _2951;
    assign _128 = _2953;
    always @(posedge _310) begin
        if (_308)
            g_crc_bad_0 <= _1829;
        else
            g_crc_bad_0 <= _128;
    end
    assign _2947 = g_crc_bad_0 | _2946;
    assign _2956 = ~ _2947;
    assign _2955 = g_left_0 == _2894;
    assign _2957 = _2955 ? _2956 : _678;
    assign _2958 = _2939 ? _2957 : _678;
    assign _2959 = _687 ? _2958 : _678;
    assign _2960 = _493 ? _678 : _2959;
    assign _2961 = _447 ? _2960 : _678;
    assign _2963 = _333 ? _1829 : _2961;
    assign _2965 = _331 ? _1829 : _2963;
    assign _129 = _2965;
    always @(posedge _310) begin
        if (_308)
            _678 <= _1829;
        else
            _678 <= _129;
    end
    assign _131 = host_match_addr;
    assign _1202 = _131[6:0];
    assign _1201 = _1193[7:1];
    assign _1203 = _1201 == _1202;
    assign _1198 = 16'b1010110011100001;
    assign _2970 = _1199[10:10];
    assign _2969 = _1199[12:12];
    assign _2971 = _2969 ^ _2970;
    assign _2968 = _1199[13:13];
    assign _2972 = _2968 ^ _2971;
    assign _2967 = _1199[15:15];
    assign _2973 = _2967 ^ _2972;
    assign _2966 = _1199[14:0];
    assign _2974 = { _2966,
                     _2973 };
    assign _132 = _2974;
    always @(posedge _310) begin
        if (_308)
            _1199 <= _1198;
        else
            _1199 <= _132;
    end
    assign _1200 = _1199[0:0];
    assign _2987 = _136 + _2419;
    assign _2985 = _136 - _2419;
    assign _2988 = _2484 ? _2987 : _2985;
    assign _2482 = _136 == _1996;
    assign _2491 = ~ _2482;
    assign _134 = host_rx_pop;
    assign _2492 = _134 & _2491;
    assign _2483 = ~ _755;
    assign _2981 = ~ _2980;
    assign _2977 = _888 | _1730;
    assign _2975 = _786 | _853;
    assign _2976 = _753 | _2975;
    assign _2978 = _2976 | _2977;
    assign _2982 = _2978 & _2981;
    assign f_rx_push = _2982;
    assign _2484 = f_rx_push & _2483;
    assign _2983 = _2484 ^ _2492;
    assign _2989 = _2983 ? _2988 : _136;
    always @(posedge _310) begin
        if (_308)
            _2992 <= _1996;
        else
            _2992 <= _2989;
    end
    assign _136 = _2992;
    assign _755 = _136 == _1754;
    assign _1194 = _1193[0:0];
    assign _3901 = _1189[7:1];
    assign _3902 = { vdd,
                     _3901 };
    assign _3899 = _3891[7:7];
    assign _3898 = _3891[6:6];
    assign _3897 = _3891[5:5];
    assign _3896 = _3891[4:4];
    assign _3895 = _3891[3:3];
    assign _3894 = _3891[2:2];
    assign _3893 = _3891[1:1];
    assign _3892 = _3891[0:0];
    assign _3900 = { _3892,
                     _3893,
                     _3894,
                     _3895,
                     _3896,
                     _3897,
                     _3898,
                     _3899 };
    assign _3884 = _275 + _2419;
    assign _3882 = _275 - _2419;
    assign _3885 = _3009 ? _3884 : _3882;
    assign _757 = _275 == _1754;
    assign _3008 = ~ _757;
    assign _3005 = ~ _273;
    assign _138 = host_tx_push;
    assign _3006 = _138 & _3005;
    assign _751 = ~ _717;
    assign _745 = g_bitpos_0 + _494;
    assign _740 = ~ _477;
    assign g_tx_bit = _730 & _738;
    assign _741 = g_tx_bit & _740;
    assign _742 = _741 & g_data_left_0;
    assign _743 = _711 | _742;
    assign _746 = _743 ? _745 : g_bitpos_0;
    assign _748 = _746 == _464;
    assign _749 = ~ _748;
    assign _720 = _719 & _269;
    assign _750 = _720 & _749;
    assign _752 = _750 & _751;
    assign _716 = g_bitpos_0 == _2476;
    assign _707 = g_cnt_0[5:0];
    assign _708 = _707 < _235;
    assign _709 = ~ _708;
    assign _703 = g_cnt_0[15:6];
    assign _705 = _703 == _2025;
    assign _706 = ~ _705;
    assign _710 = _706 | _709;
    assign _3872 = ~ _265;
    assign _3873 = _269 & _3872;
    assign _3876 = _3873 ? _2057 : _2058;
    assign _3865 = ~ _738;
    assign _3866 = _730 & _3865;
    assign _3867 = _675 | _3866;
    assign _3868 = _3867 | _3857;
    assign _3870 = _3868 ? _2058 : _3864;
    assign _3851 = g_run_0 + _494;
    assign _3848 = g_run_0 + _494;
    assign _3844 = vdd == g_last_0;
    assign _3842 = g_run_0 == _464;
    assign _3843 = ~ _3842;
    assign _3845 = _3843 & _3844;
    assign _3849 = _3845 ? _3848 : _494;
    assign _3840 = _247 == _2058;
    assign _3852 = _3840 ? _3851 : _3849;
    assign _3853 = _3852 == _141;
    assign _3834 = g_run_0 + _494;
    assign _3830 = gnd == g_last_0;
    assign _3828 = g_run_0 == _464;
    assign _3829 = ~ _3828;
    assign _3831 = _3829 & _3830;
    assign _3835 = _3831 ? _3834 : _494;
    assign _3826 = _247 == _2058;
    assign _3837 = _3826 ? _464 : _3835;
    assign _3838 = _3837 == _141;
    assign _3854 = _483 ? _3853 : _3838;
    assign _3855 = _472 & _3854;
    assign _3856 = ~ _3855;
    assign _3822 = g_left_0 == _2894;
    assign _3819 = 6'b000000;
    assign _3820 = g_left_0 == _3819;
    assign _3823 = _2939 ? _3822 : _3820;
    assign _3815 = g_cnt_0 + _4190;
    assign _3816 = _3815 == _700;
    assign _3813 = g_cnt_0 == _700;
    assign _3817 = _702 ? _3816 : _3813;
    assign _3811 = ~ _493;
    assign _3812 = _447 & _3811;
    assign _3818 = _3812 & _3817;
    assign _3824 = _3818 & _3823;
    assign _3857 = _3824 & _3856;
    assign _3859 = _3857 ? _1973 : _3810;
    assign _3861 = _493 ? _2551 : _3859;
    assign _3807 = _738 ? _3805 : _1973;
    assign _3803 = _373 & _371;
    assign _3805 = _3803 ? _2058 : g_mode_0;
    assign _3808 = _730 ? _3807 : _3805;
    assign _3084 = _738 ? _3083 : _2995;
    assign _3085 = _730 ? _3084 : _2995;
    assign _139 = _3085;
    always @(posedge _310) begin
        if (_308)
            _2995 <= _1829;
        else
            _2995 <= _139;
    end
    assign _3729 = ~ _3083;
    assign _3727 = ~ f_lane0_out;
    assign _3728 = _3083 ? f_lane0_out : _3727;
    always @* begin
        case (_263)
        0:
            _3730 <= _3083;
        1:
            _3730 <= _3728;
        2:
            _3730 <= _3729;
        default:
            _3730 <= _3083;
        endcase
    end
    assign _141 = host_lane0_stuff_len;
    assign _3711 = g_run_0 + _494;
    assign _3712 = _483 ? _3711 : _464;
    assign _3707 = g_run_0 + _494;
    assign _3703 = _483 == g_last_0;
    assign _3701 = g_run_0 == _464;
    assign _3702 = ~ _3701;
    assign _3704 = _3702 & _3703;
    assign _3708 = _3704 ? _3707 : _494;
    assign _3699 = _247 == _2058;
    assign _3713 = _3699 ? _3712 : _3708;
    assign _3714 = _493 ? _3697 : _3713;
    assign _3693 = g_run_0 + _494;
    assign _3694 = _3083 ? _3693 : _464;
    assign _3689 = g_run_0 + _494;
    assign _3080 = _3072[7:7];
    assign _3079 = _3072[6:6];
    assign _3078 = _3072[5:5];
    assign _3077 = _3072[4:4];
    assign _3076 = _3072[3:3];
    assign _3075 = _3072[2:2];
    assign _3074 = _3072[1:1];
    assign _3070 = _3062[7:7];
    assign _3069 = _3062[6:6];
    assign _3068 = _3062[5:5];
    assign _3067 = _3062[4:4];
    assign _3066 = _3062[3:3];
    assign _3065 = _3062[2:2];
    assign _3064 = _3062[1:1];
    assign _3056 = _3012 == _2476;
    assign _3057 = _3009 & _3056;
    always @(posedge _310) begin
        if (_308)
            _3058 <= _773;
        else
            if (_3057)
                _3058 <= _3002;
    end
    assign _3050 = _3012 == _1875;
    assign _3051 = _3009 & _3050;
    always @(posedge _310) begin
        if (_308)
            _3052 <= _773;
        else
            if (_3051)
                _3052 <= _3002;
    end
    assign _3044 = _3012 == _1876;
    assign _3045 = _3009 & _3044;
    always @(posedge _310) begin
        if (_308)
            _3046 <= _773;
        else
            if (_3045)
                _3046 <= _3002;
    end
    assign _3038 = _3012 == _467;
    assign _3039 = _3009 & _3038;
    always @(posedge _310) begin
        if (_308)
            _3040 <= _773;
        else
            if (_3039)
                _3040 <= _3002;
    end
    assign _3032 = _3012 == _1879;
    assign _3033 = _3009 & _3032;
    always @(posedge _310) begin
        if (_308)
            _3034 <= _773;
        else
            if (_3033)
                _3034 <= _3002;
    end
    assign _3026 = _3012 == _466;
    assign _3027 = _3009 & _3026;
    always @(posedge _310) begin
        if (_308)
            _3028 <= _773;
        else
            if (_3027)
                _3028 <= _3002;
    end
    assign _3020 = _3012 == _494;
    assign _3021 = _3009 & _3020;
    always @(posedge _310) begin
        if (_308)
            _3022 <= _773;
        else
            if (_3021)
                _3022 <= _3002;
    end
    assign _3087 = _3012 + _494;
    assign _3088 = _3009 ? _3087 : _3012;
    assign _142 = _3088;
    always @(posedge _310) begin
        if (_308)
            _3012 <= _464;
        else
            _3012 <= _142;
    end
    assign _3014 = _3012 == _464;
    assign _3015 = _3009 & _3014;
    assign _3155 = _711 ? _3154 : g_byte_0;
    assign _3156 = _717 ? _3154 : _3155;
    assign _3106 = _3105 ? _3103 : _3093;
    assign _3104 = _3090 ? _3103 : _3093;
    assign _3107 = _857 ? _3106 : _3104;
    assign _143 = _3107;
    always @(posedge _310) begin
        if (_308)
            _3093 <= _773;
        else
            _3093 <= _143;
    end
    assign _3102 = _811 ? _3101 : g_byte;
    assign _3103 = _817 ? _3101 : _3102;
    assign _3148 = _786 ? _3093 : _3103;
    assign _3115 = _3114 ? _1193 : _3112;
    assign _3113 = _3109 ? _1193 : _3112;
    assign _3116 = _1737 ? _3115 : _3113;
    assign _144 = _3116;
    always @(posedge _310) begin
        if (_308)
            _3112 <= _773;
        else
            _3112 <= _144;
    end
    assign _3133 = _1193[6:0];
    assign _3134 = { _3133,
                     _3130 };
    assign _3131 = _1193[7:1];
    assign _3129 = _346[7:7];
    assign _3128 = _346[6:6];
    assign _3127 = _346[5:5];
    assign _3126 = _346[4:4];
    assign _3125 = _346[3:3];
    assign _3124 = _346[2:2];
    assign _3123 = _346[1:1];
    assign _3122 = _346[0:0];
    assign _3120 = _1279[102:100];
    assign _3119 = _1273[102:100];
    assign _3118 = _1267[102:100];
    assign _3117 = _915[102:100];
    always @* begin
        case (f_winner)
        0:
            _3121 <= _3117;
        1:
            _3121 <= _3118;
        2:
            _3121 <= _3119;
        default:
            _3121 <= _3120;
        endcase
    end
    always @* begin
        case (_3121)
        0:
            _3130 <= _3122;
        1:
            _3130 <= _3123;
        2:
            _3130 <= _3124;
        3:
            _3130 <= _3125;
        4:
            _3130 <= _3126;
        5:
            _3130 <= _3127;
        6:
            _3130 <= _3128;
        default:
            _3130 <= _3129;
        endcase
    end
    assign _3132 = { _3130,
                     _3131 };
    always @* begin
        case (_1727)
        0:
            _3135 <= _1193;
        1:
            _3135 <= _3132;
        2:
            _3135 <= _3134;
        default:
            _3135 <= _1193;
        endcase
    end
    assign _3136 = _1713 ? _3135 : _1193;
    assign _145 = _3136;
    always @(posedge _310) begin
        if (_308)
            _1193 <= _773;
        else
            _1193 <= _145;
    end
    assign _3114 = _888 & _1730;
    assign _3140 = _3114 ? _888 : _1829;
    assign _3108 = ~ _888;
    assign _3109 = _3108 & _1730;
    assign _3138 = _3109 ? _1831 : _888;
    assign _1724 = _1279[97:96];
    assign _1723 = _1273[97:96];
    assign _1722 = _1267[97:96];
    assign _1721 = _915[97:96];
    always @* begin
        case (f_winner)
        0:
            _1725 <= _1721;
        1:
            _1725 <= _1722;
        2:
            _1725 <= _1723;
        default:
            _1725 <= _1724;
        endcase
    end
    assign _1727 = _899 ? _2551 : _1725;
    assign f_eng_push = _1727 == _1973;
    assign _1730 = _1713 & f_eng_push;
    assign _1736 = _888 | _1730;
    assign _1733 = _786 | _853;
    assign _1734 = ~ _1733;
    assign _1732 = ~ _753;
    assign _1735 = _1732 & _1734;
    assign _1737 = _1735 & _1736;
    assign _3141 = _1737 ? _3140 : _3138;
    assign _146 = _3141;
    always @(posedge _310) begin
        if (_308)
            _888 <= _1829;
        else
            _888 <= _146;
    end
    assign _3147 = _888 ? _3112 : _1193;
    assign _3105 = _786 & _853;
    assign _3145 = _3105 ? _786 : _1829;
    assign _851 = ~ _817;
    assign _845 = g_bitpos + _494;
    assign _840 = ~ _639;
    assign g_tx_bit_0 = _830 & _838;
    assign _841 = g_tx_bit_0 & _840;
    assign _842 = _841 & g_data_left;
    assign _843 = _811 | _842;
    assign _846 = _843 ? _845 : g_bitpos;
    assign _848 = _846 == _464;
    assign _849 = ~ _848;
    assign _820 = _819 & _210;
    assign _850 = _820 & _849;
    assign _852 = _850 & _851;
    assign _816 = g_bitpos == _2476;
    assign _817 = _811 & _816;
    assign _853 = _817 | _852;
    assign _3089 = ~ _786;
    assign _3090 = _3089 & _853;
    assign _3143 = _3090 ? _1831 : _786;
    assign _3146 = _857 ? _3145 : _3143;
    assign _147 = _3146;
    always @(posedge _310) begin
        if (_308)
            _786 <= _1829;
        else
            _786 <= _147;
    end
    assign _856 = _786 | _853;
    assign _855 = ~ _753;
    assign _857 = _855 & _856;
    assign _3149 = _857 ? _3148 : _3147;
    assign _3157 = _753 ? _3156 : _3149;
    assign _148 = _3157;
    assign _149 = _148;
    assign _151 = host_tx_data;
    assign _3002 = _274 ? _149 : _151;
    always @(posedge _310) begin
        if (_308)
            _3016 <= _773;
        else
            if (_3015)
                _3016 <= _3002;
    end
    assign _3533 = _3001 + _494;
    assign _3530 = ~ _1196;
    assign _1824 = ~ _1196;
    assign _821 = ~ _210;
    assign _3520 = ~ _208;
    assign _3521 = _210 & _3520;
    assign _3524 = _3521 ? _2057 : _2058;
    assign _3513 = ~ _838;
    assign _3514 = _830 & _3513;
    assign _3515 = _663 | _3514;
    assign _3516 = _3515 | _3505;
    assign _3518 = _3516 ? _2058 : _3512;
    assign _3499 = g_run + _494;
    assign _3496 = g_run + _494;
    assign _3492 = vdd == g_last;
    assign _3490 = g_run == _464;
    assign _3491 = ~ _3490;
    assign _3493 = _3491 & _3492;
    assign _3497 = _3493 ? _3496 : _494;
    assign _3488 = _188 == _2058;
    assign _3500 = _3488 ? _3499 : _3497;
    assign _3501 = _3500 == _154;
    assign _3482 = g_run + _494;
    assign _3478 = gnd == g_last;
    assign _3476 = g_run == _464;
    assign _3477 = ~ _3476;
    assign _3479 = _3477 & _3478;
    assign _3483 = _3479 ? _3482 : _494;
    assign _3474 = _188 == _2058;
    assign _3485 = _3474 ? _464 : _3483;
    assign _3486 = _3485 == _154;
    assign _3502 = _645 ? _3501 : _3486;
    assign _3503 = _634 & _3502;
    assign _3504 = ~ _3503;
    assign _3470 = g_left == _2894;
    assign _3468 = g_left == _3819;
    assign _3471 = _2879 ? _3470 : _3468;
    assign _3463 = g_cnt + _4190;
    assign _3464 = _3463 == _800;
    assign _3461 = g_cnt == _800;
    assign _3465 = _802 ? _3464 : _3461;
    assign _3459 = ~ _654;
    assign _3460 = _609 & _3459;
    assign _3466 = _3460 & _3465;
    assign _3472 = _3466 & _3471;
    assign _3505 = _3472 & _3504;
    assign _3507 = _3505 ? _1973 : _3458;
    assign _3509 = _654 ? _2551 : _3507;
    assign _3455 = _838 ? _3453 : _1973;
    assign _3451 = _535 & _533;
    assign _3453 = _3451 ? _2058 : g_mode;
    assign _3456 = _830 ? _3455 : _3453;
    assign _3185 = _838 ? _3184 : _3160;
    assign _3186 = _830 ? _3185 : _3160;
    assign _152 = _3186;
    always @(posedge _310) begin
        if (_308)
            _3160 <= _1829;
        else
            _3160 <= _152;
    end
    assign _3381 = ~ _3184;
    assign _3379 = ~ f_lane1_out;
    assign _3380 = _3184 ? f_lane1_out : _3379;
    always @* begin
        case (_204)
        0:
            _3382 <= _3184;
        1:
            _3382 <= _3380;
        2:
            _3382 <= _3381;
        default:
            _3382 <= _3184;
        endcase
    end
    assign _154 = host_lane1_stuff_len;
    assign _3363 = g_run + _494;
    assign _3364 = _645 ? _3363 : _464;
    assign _3359 = g_run + _494;
    assign _3355 = _645 == g_last;
    assign _3353 = g_run == _464;
    assign _3354 = ~ _3353;
    assign _3356 = _3354 & _3355;
    assign _3360 = _3356 ? _3359 : _494;
    assign _3351 = _188 == _2058;
    assign _3365 = _3351 ? _3364 : _3360;
    assign _3366 = _654 ? _3349 : _3365;
    assign _3345 = g_run + _494;
    assign _3346 = _3184 ? _3345 : _464;
    assign _3341 = g_run + _494;
    assign _3181 = _3173[7:7];
    assign _3180 = _3173[6:6];
    assign _3179 = _3173[5:5];
    assign _3178 = _3173[4:4];
    assign _3177 = _3173[3:3];
    assign _3176 = _3173[2:2];
    assign _3175 = _3173[1:1];
    assign _3171 = _3163[7:7];
    assign _3170 = _3163[6:6];
    assign _3169 = _3163[5:5];
    assign _3168 = _3163[4:4];
    assign _3167 = _3163[3:3];
    assign _3166 = _3163[2:2];
    assign _3165 = _3163[1:1];
    assign _3162 = _1196 ? _775 : _3059;
    assign _3099 = g_byte[7:1];
    assign _3100 = { _645,
                     _3099 };
    assign _3097 = g_byte[6:0];
    assign _3098 = { _3097,
                     _645 };
    assign _3101 = _157 ? _3100 : _3098;
    assign _3191 = _811 ? _3101 : _3190;
    assign _3192 = _802 ? _3191 : _3190;
    assign _3193 = _787 ? _3192 : _3190;
    assign _3194 = _654 ? _3190 : _3193;
    assign _3187 = g_data_left ? _3163 : g_byte;
    assign _3188 = _639 ? g_byte : _3187;
    assign _3189 = _838 ? _3188 : g_byte;
    assign _3190 = _830 ? _3189 : g_byte;
    assign _3195 = _609 ? _3194 : _3190;
    assign _155 = _3195;
    always @(posedge _310) begin
        if (_308)
            g_byte <= _773;
        else
            g_byte <= _155;
    end
    assign _1821 = g_bitpos == _464;
    assign _1818 = ~ _639;
    assign _1819 = _1818 & g_data_left;
    assign _1822 = _1819 & _1821;
    assign _3163 = _1822 ? _3162 : g_byte;
    assign _3164 = _3163[0:0];
    assign _3172 = { _3164,
                     _3165,
                     _3166,
                     _3167,
                     _3168,
                     _3169,
                     _3170,
                     _3171 };
    assign _157 = host_lane1_lsb_first;
    assign _3173 = _157 ? _3163 : _3172;
    assign _3174 = _3173[0:0];
    assign _3203 = g_bitpos + _494;
    assign _807 = g_cnt[5:0];
    assign _808 = _807 < _176;
    assign _809 = ~ _808;
    assign _803 = g_cnt[15:6];
    assign _805 = _803 == _2025;
    assign _806 = ~ _805;
    assign _810 = _806 | _809;
    assign _811 = _802 & _810;
    assign _3204 = _811 ? _3203 : _3201;
    assign _3205 = _802 ? _3204 : _3201;
    assign _3206 = _787 ? _3205 : _3201;
    assign _3207 = _654 ? _3201 : _3206;
    assign _3197 = g_bitpos + _494;
    assign _3198 = g_data_left ? _3197 : g_bitpos;
    assign _3199 = _639 ? g_bitpos : _3198;
    assign _3200 = _838 ? _3199 : g_bitpos;
    assign _3201 = _830 ? _3200 : g_bitpos;
    assign _3208 = _609 ? _3207 : _3201;
    assign _3210 = _505 ? _464 : _3208;
    assign _158 = _3210;
    always @(posedge _310) begin
        if (_308)
            g_bitpos <= _464;
        else
            g_bitpos <= _158;
    end
    always @* begin
        case (g_bitpos)
        0:
            _3182 <= _3174;
        1:
            _3182 <= _3175;
        2:
            _3182 <= _3176;
        3:
            _3182 <= _3177;
        4:
            _3182 <= _3178;
        5:
            _3182 <= _3179;
        6:
            _3182 <= _3180;
        default:
            _3182 <= _3181;
        endcase
    end
    assign _160 = host_lane1_crc_inv;
    assign _162 = host_lane1_init;
    assign _3252 = g_crc[30:0];
    assign _3254 = { _3252,
                     _1829 };
    assign _3246 = g_crc[31:31];
    assign _3247 = _645 ^ _3246;
    assign _3249 = _3247 ? _167 : _2101;
    assign _3243 = g_crc[30:0];
    assign _3245 = { _3243,
                     _1829 };
    assign _3250 = _3245 ^ _3249;
    assign _3251 = _802 ? _3250 : _3242;
    assign _164 = host_lane1_crc_width;
    assign _3220 = g_left - _2894;
    assign _3221 = _2879 ? _3220 : _3218;
    assign _3222 = _787 ? _3221 : _3218;
    assign _3223 = _654 ? _3218 : _3222;
    assign _3214 = g_left - _2894;
    assign _3215 = g_data_left ? g_left : _3214;
    assign _3216 = _639 ? g_left : _3215;
    assign _3217 = _838 ? _3216 : g_left;
    assign _3218 = _830 ? _3217 : g_left;
    assign _3224 = _609 ? _3223 : _3218;
    assign _3225 = _3212 ? _164 : _3224;
    assign _3227 = _505 ? _3819 : _3225;
    assign _165 = _3227;
    always @(posedge _310) begin
        if (_308)
            g_left <= _3819;
        else
            g_left <= _165;
    end
    assign _836 = g_left == _3819;
    assign _837 = ~ _836;
    assign _2877 = ~ g_data_left;
    assign _2876 = _609 & _787;
    assign _2878 = _2876 & _2877;
    assign _2879 = _2878 & _837;
    assign _3255 = _2879 ? _3254 : _3251;
    assign _3256 = _787 ? _3255 : _3242;
    assign _3257 = _654 ? _3242 : _3256;
    assign _167 = host_lane1_poly;
    assign _3234 = g_crc[31:31];
    assign _3235 = _3184 ^ _3234;
    assign _3237 = _3235 ? _167 : _2101;
    assign _3231 = g_crc[30:0];
    assign _3233 = { _3231,
                     _1829 };
    assign _3238 = _3233 ^ _3237;
    assign _3228 = g_crc[30:0];
    assign _3230 = { _3228,
                     _1829 };
    assign _3239 = g_data_left ? _3238 : _3230;
    assign _3240 = _639 ? g_crc : _3239;
    assign _3241 = _838 ? _3240 : g_crc;
    assign _3242 = _830 ? _3241 : g_crc;
    assign _3258 = _609 ? _3257 : _3242;
    assign _3259 = _505 ? _162 : _3258;
    assign _3261 = _503 ? _2101 : _3259;
    assign _168 = _3261;
    always @(posedge _310) begin
        if (_308)
            g_crc <= _2101;
        else
            g_crc <= _168;
    end
    assign _2883 = g_crc[31:31];
    assign _2884 = _2883 ^ _160;
    assign _3277 = _3276 ? _3274 : _798;
    assign _3278 = g_len_cap ? _3277 : _798;
    assign _169 = _3278;
    always @(posedge _310) begin
        if (_308)
            _798 <= _773;
        else
            _798 <= _169;
    end
    assign _799 = { _773,
                    _798 };
    assign _171 = host_lane1_frame_bits;
    assign _2858 = _2857[14:0];
    assign _2859 = { _2858,
                     _645 };
    assign _3279 = _787 ? _2859 : _2857;
    assign _3280 = _654 ? _2857 : _3279;
    assign _3281 = _609 ? _3280 : _2857;
    assign _3283 = _505 ? _1695 : _3281;
    assign _172 = _3283;
    always @(posedge _310) begin
        if (_308)
            _2857 <= _1695;
        else
            _2857 <= _172;
    end
    assign _3269 = _2857[3:0];
    assign _174 = host_lane1_len_max;
    assign _3270 = _174 < _3269;
    assign _3271 = _3270 ? _174 : _3269;
    assign _3273 = { _1829,
                     _3271,
                     _464 };
    assign _176 = host_lane1_skip;
    assign _3267 = { _2551,
                     _176 };
    assign _3274 = _3267 + _3273;
    assign _3275 = { _773,
                     _3274 };
    assign _3276 = _3275 < _171;
    assign _3302 = _3276 ? _1831 : g_len_known;
    assign _178 = host_lane1_len_pos;
    assign _3288 = g_cnt[5:0];
    assign _3289 = _3288 == _178;
    assign _3284 = g_cnt[15:6];
    assign _3286 = _3284 == _2025;
    assign _180 = host_lane1_len_en;
    assign _3287 = _180 & _3286;
    assign _3290 = _3287 & _3289;
    assign _3292 = _3290 ? _1831 : g_len_cap;
    assign _3293 = _802 ? _3292 : g_len_cap;
    assign _3294 = _787 ? _3293 : g_len_cap;
    assign _3295 = _654 ? g_len_cap : _3294;
    assign _3296 = _609 ? _3295 : g_len_cap;
    assign _3298 = g_len_cap ? _1829 : _3296;
    assign _3300 = _505 ? _1829 : _3298;
    assign _181 = _3300;
    always @(posedge _310) begin
        if (_308)
            g_len_cap <= _1829;
        else
            g_len_cap <= _181;
    end
    assign _3303 = g_len_cap ? _3302 : g_len_known;
    assign _3305 = _505 ? _1829 : _3303;
    assign _182 = _3305;
    always @(posedge _310) begin
        if (_308)
            g_len_known <= _1829;
        else
            g_len_known <= _182;
    end
    assign _800 = g_len_known ? _799 : _171;
    assign _3325 = g_cnt + _4190;
    assign _788 = _609 & _787;
    assign _802 = _788 & g_data_left;
    assign _3326 = _802 ? _3325 : _3323;
    assign _787 = ~ _639;
    assign _3327 = _787 ? _3326 : _3323;
    assign _3308 = _654 ? _3307 : _645;
    assign _3306 = _838 ? _3184 : g_last;
    assign _3307 = _830 ? _3306 : g_last;
    assign _3309 = _609 ? _3308 : _3307;
    assign _3311 = _505 ? _1831 : _3309;
    assign _183 = _3311;
    always @(posedge _310) begin
        if (_308)
            g_last <= vdd;
        else
            g_last <= _183;
    end
    assign _650 = ~ g_last;
    assign _647 = _188 == _2057;
    assign _651 = _647 ? _650 : gnd;
    assign _3313 = _204 == _2057;
    assign _3314 = _3313 ? _520 : g_prev;
    assign _3315 = _609 ? _3314 : g_prev;
    assign _3317 = _505 ? _1831 : _3315;
    assign _184 = _3317;
    always @(posedge _310) begin
        if (_308)
            g_prev <= vdd;
        else
            g_prev <= _184;
    end
    assign _644 = _520 == g_prev;
    assign _641 = _204 == _2057;
    assign _645 = _641 ? _644 : _520;
    assign _652 = _645 == _651;
    assign _653 = ~ _652;
    assign _654 = _639 & _653;
    assign _3328 = _654 ? _3323 : _3327;
    assign _3319 = g_cnt + _4190;
    assign _3320 = g_data_left ? _3319 : g_cnt;
    assign _3321 = _639 ? g_cnt : _3320;
    assign _3322 = _838 ? _3321 : g_cnt;
    assign _3323 = _830 ? _3322 : g_cnt;
    assign _3329 = _609 ? _3328 : _3323;
    assign _3331 = _505 ? _1695 : _3329;
    assign _185 = _3331;
    always @(posedge _310) begin
        if (_308)
            g_cnt <= _1695;
        else
            g_cnt <= _185;
    end
    assign g_data_left = g_cnt < _800;
    assign _3183 = g_data_left ? _3182 : _2884;
    assign _3184 = _639 ? _651 : _3183;
    assign _3337 = _3184 == g_last;
    assign _3335 = g_run == _464;
    assign _3336 = ~ _3335;
    assign _3338 = _3336 & _3337;
    assign _3342 = _3338 ? _3341 : _494;
    assign _3333 = _188 == _2058;
    assign _3347 = _3333 ? _3346 : _3342;
    assign _3348 = _838 ? _3347 : g_run;
    assign _3349 = _830 ? _3348 : g_run;
    assign _3367 = _609 ? _3366 : _3349;
    assign _3369 = _505 ? _464 : _3367;
    assign _186 = _3369;
    always @(posedge _310) begin
        if (_308)
            g_run <= _464;
        else
            g_run <= _186;
    end
    assign _638 = g_run == _154;
    assign _188 = host_lane1_stuff;
    assign _633 = _188 == _2551;
    assign _634 = ~ _633;
    assign _639 = _634 & _638;
    assign _831 = _639 | g_data_left;
    assign _838 = _831 | _837;
    assign _3383 = _838 ? _3382 : _1831;
    assign _3384 = _830 ? _3383 : f_lane1_out;
    assign _826 = _579 == _1695;
    assign _824 = _544 == _1695;
    assign _827 = _572 ? _826 : _824;
    assign _828 = _540 ? vdd : _827;
    assign _829 = _208 ? _607 : _828;
    assign _3376 = ~ _829;
    assign _3373 = _204 == _2058;
    assign _3370 = ~ _210;
    assign _3371 = _510 & _3370;
    assign _3374 = _3371 & _3373;
    assign _3375 = _3374 & _608;
    assign _3377 = _3375 & _3376;
    assign _3385 = _3377 ? _3160 : _3384;
    assign _3387 = _624 ? _1831 : _3385;
    assign _3389 = _819 ? _1831 : _3387;
    assign _3391 = _505 ? _1831 : _3389;
    assign _3393 = _503 ? _1831 : _3391;
    assign _189 = _3393;
    always @(posedge _310) begin
        if (_308)
            f_lane1_out <= vdd;
        else
            f_lane1_out <= _189;
    end
    assign _622 = _520 == f_lane1_out;
    assign _623 = ~ _622;
    assign _616 = _204 == _2058;
    assign _617 = ~ _616;
    assign _613 = ~ _208;
    assign _191 = host_lane1_readback;
    assign _610 = ~ _210;
    assign _611 = _510 & _610;
    assign _612 = _611 & _191;
    assign _614 = _612 & _613;
    assign _618 = _614 & _617;
    assign _619 = _618 & _608;
    assign _624 = _619 & _623;
    assign _3458 = _624 ? _2551 : _3456;
    assign _605 = ~ _593;
    assign _606 = _602 & _605;
    assign _601 = _358[7:7];
    assign _600 = _358[6:6];
    assign _599 = _358[5:5];
    assign _598 = _358[4:4];
    assign _597 = _358[3:3];
    assign _596 = _358[2:2];
    assign _595 = _358[1:1];
    assign _594 = _358[0:0];
    always @* begin
        case (_193)
        0:
            _602 <= _594;
        1:
            _602 <= _595;
        2:
            _602 <= _596;
        3:
            _602 <= _597;
        4:
            _602 <= _598;
        5:
            _602 <= _599;
        6:
            _602 <= _600;
        default:
            _602 <= _601;
        endcase
    end
    assign _603 = ~ _602;
    assign _592 = _346[7:7];
    assign _591 = _346[6:6];
    assign _590 = _346[5:5];
    assign _589 = _346[4:4];
    assign _588 = _346[3:3];
    assign _587 = _346[2:2];
    assign _586 = _346[1:1];
    assign _585 = _346[0:0];
    assign _193 = host_lane1_clk_pin;
    always @* begin
        case (_193)
        0:
            _593 <= _585;
        1:
            _593 <= _586;
        2:
            _593 <= _587;
        3:
            _593 <= _588;
        4:
            _593 <= _589;
        5:
            _593 <= _590;
        6:
            _593 <= _591;
        default:
            _593 <= _592;
        endcase
    end
    assign _604 = _593 & _603;
    assign _195 = host_lane1_clk_edge;
    assign _607 = _195 ? _606 : _604;
    assign _583 = _568 == _1695;
    assign _580 = _579 == _568;
    assign _573 = _544 == _568;
    assign _571 = ~ _535;
    assign _562 = _197[15:2];
    assign _563 = { _2551,
                    _562 };
    assign _559 = _197[15:1];
    assign _560 = { _1829,
                    _559 };
    assign _564 = _560 + _563;
    assign _556 = _197[15:1];
    assign _557 = { _1829,
                    _556 };
    assign _554 = _210 & _537;
    assign _565 = _554 ? _564 : _557;
    always @(posedge _310) begin
        if (_308)
            _568 <= _1695;
        else
            _568 <= _565;
    end
    assign _569 = _544 < _568;
    assign _546 = _197[15:2];
    assign _547 = { _2551,
                    _546 };
    always @(posedge _310) begin
        if (_308)
            _550 <= _1695;
        else
            _550 <= _547;
    end
    assign _3439 = ~ _535;
    assign _3440 = _570 & _3439;
    assign _3441 = _3440 ? _579 : _544;
    assign _3443 = _540 ? _1695 : _3441;
    assign _3445 = _3443 + _4190;
    assign _3423 = _3417 == _1652;
    assign _575 = _197[15:1];
    assign _576 = { _1829,
                    _575 };
    always @(posedge _310) begin
        if (_308)
            _579 <= _1695;
        else
            _579 <= _576;
    end
    assign _3419 = { gnd,
                     _579 };
    assign _3420 = _3419 == _3417;
    assign _3413 = { gnd,
                     _197 };
    always @(posedge _310) begin
        if (_308)
            _3416 <= _1652;
        else
            _3416 <= _3413;
    end
    assign _3408 = 17'b00000000000000001;
    assign _197 = host_lane1_div_int;
    assign _3407 = { gnd,
                     _197 };
    assign _3409 = _3407 - _3408;
    always @(posedge _310) begin
        if (_308)
            _3412 <= _1652;
        else
            _3412 <= _3409;
    end
    assign _199 = host_lane1_div_frac;
    assign _3427 = { gnd,
                     _199 };
    assign _3429 = _3428[7:0];
    assign _3430 = _3425 ? _3429 : _3401;
    assign _3431 = _3398 ? _3430 : _3401;
    assign _3433 = _505 ? _773 : _3431;
    assign _200 = _3433;
    always @(posedge _310) begin
        if (_308)
            _3401 <= _773;
        else
            _3401 <= _200;
    end
    assign _3426 = { gnd,
                     _3401 };
    assign _3428 = _3426 + _3427;
    assign _3434 = _3428[8:8];
    assign _3435 = _3425 ? _3434 : _3406;
    assign _3436 = _3398 ? _3435 : _3406;
    assign _3438 = _505 ? _1829 : _3436;
    assign _201 = _3438;
    always @(posedge _310) begin
        if (_308)
            _3406 <= _1829;
        else
            _3406 <= _201;
    end
    assign _3417 = _3406 ? _3416 : _3412;
    assign _3403 = { gnd,
                     _544 };
    assign _3418 = _3403 == _3417;
    assign _3421 = _572 ? _3420 : _3418;
    assign _3424 = _540 ? _3423 : _3421;
    assign _3402 = ~ _208;
    assign _3425 = _3402 & _3424;
    assign _3447 = _3425 ? _1695 : _3445;
    assign _3397 = ~ _208;
    assign _3395 = _535 & _533;
    assign _663 = g_mode == _1973;
    assign _3394 = _510 | _663;
    assign _3396 = _3394 | _3395;
    assign _3398 = _3396 & _3397;
    assign _3448 = _3398 ? _3447 : _544;
    assign _3450 = _505 ? _1695 : _3448;
    assign _202 = _3450;
    always @(posedge _310) begin
        if (_308)
            _544 <= _1695;
        else
            _544 <= _202;
    end
    assign _551 = _544 < _550;
    assign _552 = ~ _551;
    assign _541 = _533 & _537;
    assign _553 = _541 & _552;
    assign _570 = _553 & _569;
    assign _572 = _570 & _571;
    assign _581 = _572 ? _580 : _573;
    assign _204 = host_lane1_code;
    assign _537 = _204 == _2058;
    assign _538 = ~ _537;
    assign _535 = g_mode == _2057;
    assign _539 = _535 | _538;
    assign _532 = ~ _208;
    assign _528 = _358[7:7];
    assign _527 = _358[6:6];
    assign _526 = _358[5:5];
    assign _525 = _358[4:4];
    assign _524 = _358[3:3];
    assign _523 = _358[2:2];
    assign _522 = _358[1:1];
    assign _521 = _358[0:0];
    always @* begin
        case (_206)
        0:
            _529 <= _521;
        1:
            _529 <= _522;
        2:
            _529 <= _523;
        3:
            _529 <= _524;
        4:
            _529 <= _525;
        5:
            _529 <= _526;
        6:
            _529 <= _527;
        default:
            _529 <= _528;
        endcase
    end
    assign _519 = _346[7:7];
    assign _518 = _346[6:6];
    assign _517 = _346[5:5];
    assign _516 = _346[4:4];
    assign _515 = _346[3:3];
    assign _514 = _346[2:2];
    assign _513 = _346[1:1];
    assign _512 = _346[0:0];
    assign _206 = host_lane1_data_pin;
    always @* begin
        case (_206)
        0:
            _520 <= _512;
        1:
            _520 <= _513;
        2:
            _520 <= _514;
        3:
            _520 <= _515;
        4:
            _520 <= _516;
        5:
            _520 <= _517;
        6:
            _520 <= _518;
        default:
            _520 <= _519;
        endcase
    end
    assign _530 = _520 ^ _529;
    assign _531 = _210 & _530;
    assign _533 = _531 & _532;
    assign _540 = _533 & _539;
    assign _584 = _540 ? _583 : _581;
    assign _208 = host_lane1_clk_pin_en;
    assign _608 = _208 ? _607 : _584;
    assign _210 = host_lane1_dir;
    assign _511 = _510 & _210;
    assign _609 = _511 & _608;
    assign _3510 = _609 ? _3509 : _3458;
    assign _819 = _270 == _1875;
    assign _3512 = _819 ? _2551 : _3510;
    assign _3212 = _270 == _2476;
    assign _3519 = _3212 ? _3518 : _3512;
    assign _505 = _270 == _1876;
    assign _3525 = _505 ? _3524 : _3519;
    assign _502 = _270 == _467;
    assign _503 = _502 | _317;
    assign _3527 = _503 ? _2551 : _3525;
    assign _211 = _3527;
    always @(posedge _310) begin
        if (_308)
            g_mode <= _2551;
        else
            g_mode <= _211;
    end
    assign _510 = g_mode == _2058;
    assign _822 = _510 & _821;
    assign _830 = _822 & _829;
    assign _1823 = _830 & _1822;
    assign _1825 = _1823 & _1824;
    assign _1816 = ~ _1196;
    assign _1815 = _730 & _1814;
    assign _1817 = _1815 & _1816;
    assign _1826 = _1817 | _1825;
    assign _1807 = _1803 == _2058;
    assign _1805 = _1803 == _2057;
    assign _1808 = _1805 | _1807;
    assign _3528 = _1713 & _1808;
    assign _3529 = _3528 | _1826;
    assign _212 = _3529;
    assign _3531 = _212 & _3530;
    assign _3534 = _3531 ? _3533 : _3001;
    assign _213 = _3534;
    always @(posedge _310) begin
        if (_308)
            _3001 <= _464;
        else
            _3001 <= _213;
    end
    always @* begin
        case (_3001)
        0:
            _3059 <= _3016;
        1:
            _3059 <= _3022;
        2:
            _3059 <= _3028;
        3:
            _3059 <= _3034;
        4:
            _3059 <= _3040;
        5:
            _3059 <= _3046;
        6:
            _3059 <= _3052;
        default:
            _3059 <= _3058;
        endcase
    end
    assign _3061 = _1196 ? _775 : _3059;
    assign _3152 = g_byte_0[7:1];
    assign _3153 = { _483,
                     _3152 };
    assign _3150 = g_byte_0[6:0];
    assign _3151 = { _3150,
                     _483 };
    assign _3154 = _216 ? _3153 : _3151;
    assign _3539 = _711 ? _3154 : _3538;
    assign _3540 = _702 ? _3539 : _3538;
    assign _3541 = _687 ? _3540 : _3538;
    assign _3542 = _493 ? _3538 : _3541;
    assign _3535 = g_data_left_0 ? _3062 : g_byte_0;
    assign _3536 = _477 ? g_byte_0 : _3535;
    assign _3537 = _738 ? _3536 : g_byte_0;
    assign _3538 = _730 ? _3537 : g_byte_0;
    assign _3543 = _447 ? _3542 : _3538;
    assign _214 = _3543;
    always @(posedge _310) begin
        if (_308)
            g_byte_0 <= _773;
        else
            g_byte_0 <= _214;
    end
    assign _1813 = g_bitpos_0 == _464;
    assign _1810 = ~ _477;
    assign _1811 = _1810 & g_data_left_0;
    assign _1814 = _1811 & _1813;
    assign _3062 = _1814 ? _3061 : g_byte_0;
    assign _3063 = _3062[0:0];
    assign _3071 = { _3063,
                     _3064,
                     _3065,
                     _3066,
                     _3067,
                     _3068,
                     _3069,
                     _3070 };
    assign _216 = host_lane0_lsb_first;
    assign _3072 = _216 ? _3062 : _3071;
    assign _3073 = _3072[0:0];
    assign _3551 = g_bitpos_0 + _494;
    assign _3552 = _711 ? _3551 : _3549;
    assign _3553 = _702 ? _3552 : _3549;
    assign _3554 = _687 ? _3553 : _3549;
    assign _3555 = _493 ? _3549 : _3554;
    assign _3545 = g_bitpos_0 + _494;
    assign _3546 = g_data_left_0 ? _3545 : g_bitpos_0;
    assign _3547 = _477 ? g_bitpos_0 : _3546;
    assign _3548 = _738 ? _3547 : g_bitpos_0;
    assign _3549 = _730 ? _3548 : g_bitpos_0;
    assign _3556 = _447 ? _3555 : _3549;
    assign _3558 = _333 ? _464 : _3556;
    assign _217 = _3558;
    always @(posedge _310) begin
        if (_308)
            g_bitpos_0 <= _464;
        else
            g_bitpos_0 <= _217;
    end
    always @* begin
        case (g_bitpos_0)
        0:
            _3081 <= _3073;
        1:
            _3081 <= _3074;
        2:
            _3081 <= _3075;
        3:
            _3081 <= _3076;
        4:
            _3081 <= _3077;
        5:
            _3081 <= _3078;
        6:
            _3081 <= _3079;
        default:
            _3081 <= _3080;
        endcase
    end
    assign _219 = host_lane0_crc_inv;
    assign _221 = host_lane0_init;
    assign _3600 = g_crc_0[30:0];
    assign _3602 = { _3600,
                     _1829 };
    assign _3594 = g_crc_0[31:31];
    assign _3595 = _483 ^ _3594;
    assign _3597 = _3595 ? _226 : _2101;
    assign _3591 = g_crc_0[30:0];
    assign _3593 = { _3591,
                     _1829 };
    assign _3598 = _3593 ^ _3597;
    assign _3599 = _702 ? _3598 : _3590;
    assign _223 = host_lane0_crc_width;
    assign _3568 = g_left_0 - _2894;
    assign _3569 = _2939 ? _3568 : _3566;
    assign _3570 = _687 ? _3569 : _3566;
    assign _3571 = _493 ? _3566 : _3570;
    assign _3562 = g_left_0 - _2894;
    assign _3563 = g_data_left_0 ? g_left_0 : _3562;
    assign _3564 = _477 ? g_left_0 : _3563;
    assign _3565 = _738 ? _3564 : g_left_0;
    assign _3566 = _730 ? _3565 : g_left_0;
    assign _3572 = _447 ? _3571 : _3566;
    assign _3573 = _3560 ? _223 : _3572;
    assign _3575 = _333 ? _3819 : _3573;
    assign _224 = _3575;
    always @(posedge _310) begin
        if (_308)
            g_left_0 <= _3819;
        else
            g_left_0 <= _224;
    end
    assign _736 = g_left_0 == _3819;
    assign _737 = ~ _736;
    assign _2937 = ~ g_data_left_0;
    assign _2936 = _447 & _687;
    assign _2938 = _2936 & _2937;
    assign _2939 = _2938 & _737;
    assign _3603 = _2939 ? _3602 : _3599;
    assign _3604 = _687 ? _3603 : _3590;
    assign _3605 = _493 ? _3590 : _3604;
    assign _226 = host_lane0_poly;
    assign _3582 = g_crc_0[31:31];
    assign _3583 = _3083 ^ _3582;
    assign _3585 = _3583 ? _226 : _2101;
    assign _3579 = g_crc_0[30:0];
    assign _3581 = { _3579,
                     _1829 };
    assign _3586 = _3581 ^ _3585;
    assign _3576 = g_crc_0[30:0];
    assign _3578 = { _3576,
                     _1829 };
    assign _3587 = g_data_left_0 ? _3586 : _3578;
    assign _3588 = _477 ? g_crc_0 : _3587;
    assign _3589 = _738 ? _3588 : g_crc_0;
    assign _3590 = _730 ? _3589 : g_crc_0;
    assign _3606 = _447 ? _3605 : _3590;
    assign _3607 = _333 ? _221 : _3606;
    assign _3609 = _331 ? _2101 : _3607;
    assign _227 = _3609;
    always @(posedge _310) begin
        if (_308)
            g_crc_0 <= _2101;
        else
            g_crc_0 <= _227;
    end
    assign _2943 = g_crc_0[31:31];
    assign _2944 = _2943 ^ _219;
    assign _3625 = _3624 ? _3622 : _698;
    assign _3626 = g_len_cap_0 ? _3625 : _698;
    assign _228 = _3626;
    always @(posedge _310) begin
        if (_308)
            _698 <= _773;
        else
            _698 <= _228;
    end
    assign _699 = { _773,
                    _698 };
    assign _230 = host_lane0_frame_bits;
    assign _2918 = _2917[14:0];
    assign _2919 = { _2918,
                     _483 };
    assign _3627 = _687 ? _2919 : _2917;
    assign _3628 = _493 ? _2917 : _3627;
    assign _3629 = _447 ? _3628 : _2917;
    assign _3631 = _333 ? _1695 : _3629;
    assign _231 = _3631;
    always @(posedge _310) begin
        if (_308)
            _2917 <= _1695;
        else
            _2917 <= _231;
    end
    assign _3617 = _2917[3:0];
    assign _233 = host_lane0_len_max;
    assign _3618 = _233 < _3617;
    assign _3619 = _3618 ? _233 : _3617;
    assign _3621 = { _1829,
                     _3619,
                     _464 };
    assign _235 = host_lane0_skip;
    assign _3615 = { _2551,
                     _235 };
    assign _3622 = _3615 + _3621;
    assign _3623 = { _773,
                     _3622 };
    assign _3624 = _3623 < _230;
    assign _3650 = _3624 ? _1831 : g_len_known_0;
    assign _237 = host_lane0_len_pos;
    assign _3636 = g_cnt_0[5:0];
    assign _3637 = _3636 == _237;
    assign _3632 = g_cnt_0[15:6];
    assign _3634 = _3632 == _2025;
    assign _239 = host_lane0_len_en;
    assign _3635 = _239 & _3634;
    assign _3638 = _3635 & _3637;
    assign _3640 = _3638 ? _1831 : g_len_cap_0;
    assign _3641 = _702 ? _3640 : g_len_cap_0;
    assign _3642 = _687 ? _3641 : g_len_cap_0;
    assign _3643 = _493 ? g_len_cap_0 : _3642;
    assign _3644 = _447 ? _3643 : g_len_cap_0;
    assign _3646 = g_len_cap_0 ? _1829 : _3644;
    assign _3648 = _333 ? _1829 : _3646;
    assign _240 = _3648;
    always @(posedge _310) begin
        if (_308)
            g_len_cap_0 <= _1829;
        else
            g_len_cap_0 <= _240;
    end
    assign _3651 = g_len_cap_0 ? _3650 : g_len_known_0;
    assign _3653 = _333 ? _1829 : _3651;
    assign _241 = _3653;
    always @(posedge _310) begin
        if (_308)
            g_len_known_0 <= _1829;
        else
            g_len_known_0 <= _241;
    end
    assign _700 = g_len_known_0 ? _699 : _230;
    assign _3673 = g_cnt_0 + _4190;
    assign _3674 = _702 ? _3673 : _3671;
    assign _687 = ~ _477;
    assign _3675 = _687 ? _3674 : _3671;
    assign _3656 = _493 ? _3655 : _483;
    assign _3654 = _738 ? _3083 : g_last_0;
    assign _3655 = _730 ? _3654 : g_last_0;
    assign _3657 = _447 ? _3656 : _3655;
    assign _3659 = _333 ? _1831 : _3657;
    assign _242 = _3659;
    always @(posedge _310) begin
        if (_308)
            g_last_0 <= vdd;
        else
            g_last_0 <= _242;
    end
    assign _489 = ~ g_last_0;
    assign _485 = _247 == _2057;
    assign _490 = _485 ? _489 : gnd;
    assign _3661 = _263 == _2057;
    assign _3662 = _3661 ? _355 : g_prev_0;
    assign _3663 = _447 ? _3662 : g_prev_0;
    assign _3665 = _333 ? _1831 : _3663;
    assign _243 = _3665;
    always @(posedge _310) begin
        if (_308)
            g_prev_0 <= vdd;
        else
            g_prev_0 <= _243;
    end
    assign _482 = _355 == g_prev_0;
    assign _479 = _263 == _2057;
    assign _483 = _479 ? _482 : _355;
    assign _491 = _483 == _490;
    assign _492 = ~ _491;
    assign _493 = _477 & _492;
    assign _3676 = _493 ? _3671 : _3675;
    assign _3667 = g_cnt_0 + _4190;
    assign _3668 = g_data_left_0 ? _3667 : g_cnt_0;
    assign _3669 = _477 ? g_cnt_0 : _3668;
    assign _3670 = _738 ? _3669 : g_cnt_0;
    assign _3671 = _730 ? _3670 : g_cnt_0;
    assign _3677 = _447 ? _3676 : _3671;
    assign _3679 = _333 ? _1695 : _3677;
    assign _244 = _3679;
    always @(posedge _310) begin
        if (_308)
            g_cnt_0 <= _1695;
        else
            g_cnt_0 <= _244;
    end
    assign g_data_left_0 = g_cnt_0 < _700;
    assign _3082 = g_data_left_0 ? _3081 : _2944;
    assign _3083 = _477 ? _490 : _3082;
    assign _3685 = _3083 == g_last_0;
    assign _3683 = g_run_0 == _464;
    assign _3684 = ~ _3683;
    assign _3686 = _3684 & _3685;
    assign _3690 = _3686 ? _3689 : _494;
    assign _3681 = _247 == _2058;
    assign _3695 = _3681 ? _3694 : _3690;
    assign _3696 = _738 ? _3695 : g_run_0;
    assign _3697 = _730 ? _3696 : g_run_0;
    assign _3715 = _447 ? _3714 : _3697;
    assign _3717 = _333 ? _464 : _3715;
    assign _245 = _3717;
    always @(posedge _310) begin
        if (_308)
            g_run_0 <= _464;
        else
            g_run_0 <= _245;
    end
    assign _476 = g_run_0 == _141;
    assign _247 = host_lane0_stuff;
    assign _471 = _247 == _2551;
    assign _472 = ~ _471;
    assign _477 = _472 & _476;
    assign _731 = _477 | g_data_left_0;
    assign _738 = _731 | _737;
    assign _3731 = _738 ? _3730 : _1831;
    assign _721 = ~ _269;
    assign _722 = _339 & _721;
    assign _730 = _722 & _729;
    assign _3732 = _730 ? _3731 : f_lane0_out;
    assign _726 = _417 == _1695;
    assign _724 = _382 == _1695;
    assign _727 = _410 ? _726 : _724;
    assign _728 = _378 ? vdd : _727;
    assign _729 = _265 ? _445 : _728;
    assign _3724 = ~ _729;
    assign _3721 = _263 == _2058;
    assign _3718 = ~ _269;
    assign _3719 = _339 & _3718;
    assign _3722 = _3719 & _3721;
    assign _3723 = _3722 & _446;
    assign _3725 = _3723 & _3724;
    assign _3733 = _3725 ? _2995 : _3732;
    assign _3735 = _462 ? _1831 : _3733;
    assign _3737 = _719 ? _1831 : _3735;
    assign _3739 = _333 ? _1831 : _3737;
    assign _3741 = _331 ? _1831 : _3739;
    assign _248 = _3741;
    always @(posedge _310) begin
        if (_308)
            f_lane0_out <= vdd;
        else
            f_lane0_out <= _248;
    end
    assign _460 = _355 == f_lane0_out;
    assign _461 = ~ _460;
    assign _443 = ~ _431;
    assign _444 = _440 & _443;
    assign _439 = _358[7:7];
    assign _438 = _358[6:6];
    assign _437 = _358[5:5];
    assign _436 = _358[4:4];
    assign _435 = _358[3:3];
    assign _434 = _358[2:2];
    assign _433 = _358[1:1];
    assign _432 = _358[0:0];
    always @* begin
        case (_250)
        0:
            _440 <= _432;
        1:
            _440 <= _433;
        2:
            _440 <= _434;
        3:
            _440 <= _435;
        4:
            _440 <= _436;
        5:
            _440 <= _437;
        6:
            _440 <= _438;
        default:
            _440 <= _439;
        endcase
    end
    assign _441 = ~ _440;
    assign _430 = _346[7:7];
    assign _429 = _346[6:6];
    assign _428 = _346[5:5];
    assign _427 = _346[4:4];
    assign _426 = _346[3:3];
    assign _425 = _346[2:2];
    assign _424 = _346[1:1];
    assign _423 = _346[0:0];
    assign _250 = host_lane0_clk_pin;
    always @* begin
        case (_250)
        0:
            _431 <= _423;
        1:
            _431 <= _424;
        2:
            _431 <= _425;
        3:
            _431 <= _426;
        4:
            _431 <= _427;
        5:
            _431 <= _428;
        6:
            _431 <= _429;
        default:
            _431 <= _430;
        endcase
    end
    assign _442 = _431 & _441;
    assign _252 = host_lane0_clk_edge;
    assign _445 = _252 ? _444 : _442;
    assign _421 = _406 == _1695;
    assign _418 = _417 == _406;
    assign _411 = _382 == _406;
    assign _409 = ~ _373;
    assign _400 = _254[15:2];
    assign _401 = { _2551,
                    _400 };
    assign _397 = _254[15:1];
    assign _398 = { _1829,
                    _397 };
    assign _402 = _398 + _401;
    assign _394 = _254[15:1];
    assign _395 = { _1829,
                    _394 };
    assign _392 = _269 & _375;
    assign _403 = _392 ? _402 : _395;
    always @(posedge _310) begin
        if (_308)
            _406 <= _1695;
        else
            _406 <= _403;
    end
    assign _407 = _382 < _406;
    assign _384 = _254[15:2];
    assign _385 = { _2551,
                    _384 };
    always @(posedge _310) begin
        if (_308)
            _388 <= _1695;
        else
            _388 <= _385;
    end
    assign _3787 = ~ _373;
    assign _3788 = _408 & _3787;
    assign _3789 = _3788 ? _417 : _382;
    assign _3791 = _378 ? _1695 : _3789;
    assign _3793 = _3791 + _4190;
    assign _3771 = _3765 == _1652;
    assign _413 = _254[15:1];
    assign _414 = { _1829,
                    _413 };
    always @(posedge _310) begin
        if (_308)
            _417 <= _1695;
        else
            _417 <= _414;
    end
    assign _3767 = { gnd,
                     _417 };
    assign _3768 = _3767 == _3765;
    assign _3761 = { gnd,
                     _254 };
    always @(posedge _310) begin
        if (_308)
            _3764 <= _1652;
        else
            _3764 <= _3761;
    end
    assign _254 = host_lane0_div_int;
    assign _3755 = { gnd,
                     _254 };
    assign _3757 = _3755 - _3408;
    always @(posedge _310) begin
        if (_308)
            _3760 <= _1652;
        else
            _3760 <= _3757;
    end
    assign _256 = host_lane0_div_frac;
    assign _3775 = { gnd,
                     _256 };
    assign _3777 = _3776[7:0];
    assign _3778 = _3773 ? _3777 : _3749;
    assign _3779 = _3746 ? _3778 : _3749;
    assign _3781 = _333 ? _773 : _3779;
    assign _257 = _3781;
    always @(posedge _310) begin
        if (_308)
            _3749 <= _773;
        else
            _3749 <= _257;
    end
    assign _3774 = { gnd,
                     _3749 };
    assign _3776 = _3774 + _3775;
    assign _3782 = _3776[8:8];
    assign _3783 = _3773 ? _3782 : _3754;
    assign _3784 = _3746 ? _3783 : _3754;
    assign _3786 = _333 ? _1829 : _3784;
    assign _258 = _3786;
    always @(posedge _310) begin
        if (_308)
            _3754 <= _1829;
        else
            _3754 <= _258;
    end
    assign _3765 = _3754 ? _3764 : _3760;
    assign _3751 = { gnd,
                     _382 };
    assign _3766 = _3751 == _3765;
    assign _3769 = _410 ? _3768 : _3766;
    assign _3772 = _378 ? _3771 : _3769;
    assign _3750 = ~ _265;
    assign _3773 = _3750 & _3772;
    assign _3795 = _3773 ? _1695 : _3793;
    assign _3745 = ~ _265;
    assign _3743 = _373 & _371;
    assign _675 = g_mode_0 == _1973;
    assign _3742 = _339 | _675;
    assign _3744 = _3742 | _3743;
    assign _3746 = _3744 & _3745;
    assign _3796 = _3746 ? _3795 : _382;
    assign _3798 = _333 ? _1695 : _3796;
    assign _259 = _3798;
    always @(posedge _310) begin
        if (_308)
            _382 <= _1695;
        else
            _382 <= _259;
    end
    assign _389 = _382 < _388;
    assign _390 = ~ _389;
    assign _379 = _371 & _375;
    assign _391 = _379 & _390;
    assign _408 = _391 & _407;
    assign _410 = _408 & _409;
    assign _419 = _410 ? _418 : _411;
    assign _375 = _263 == _2058;
    assign _376 = ~ _375;
    assign _373 = g_mode_0 == _2057;
    assign _377 = _373 | _376;
    assign _370 = ~ _265;
    assign _366 = _358[7:7];
    assign _365 = _358[6:6];
    assign _364 = _358[5:5];
    assign _363 = _358[4:4];
    assign _362 = _358[3:3];
    assign _361 = _358[2:2];
    assign _360 = _358[1:1];
    assign _359 = _358[0:0];
    always @* begin
        case (_261)
        0:
            _367 <= _359;
        1:
            _367 <= _360;
        2:
            _367 <= _361;
        3:
            _367 <= _362;
        4:
            _367 <= _363;
        5:
            _367 <= _364;
        6:
            _367 <= _365;
        default:
            _367 <= _366;
        endcase
    end
    assign _354 = _346[7:7];
    assign _353 = _346[6:6];
    assign _352 = _346[5:5];
    assign _351 = _346[4:4];
    assign _350 = _346[3:3];
    assign _349 = _346[2:2];
    assign _348 = _346[1:1];
    assign _347 = _346[0:0];
    assign _261 = host_lane0_data_pin;
    always @* begin
        case (_261)
        0:
            _355 <= _347;
        1:
            _355 <= _348;
        2:
            _355 <= _349;
        3:
            _355 <= _350;
        4:
            _355 <= _351;
        5:
            _355 <= _352;
        6:
            _355 <= _353;
        default:
            _355 <= _354;
        endcase
    end
    assign _368 = _355 ^ _367;
    assign _369 = _269 & _368;
    assign _371 = _369 & _370;
    assign _378 = _371 & _377;
    assign _422 = _378 ? _421 : _419;
    assign _446 = _265 ? _445 : _422;
    assign _263 = host_lane0_code;
    assign _454 = _263 == _2058;
    assign _455 = ~ _454;
    assign _265 = host_lane0_clk_pin_en;
    assign _451 = ~ _265;
    assign _267 = host_lane0_readback;
    assign _269 = host_lane0_dir;
    assign _448 = ~ _269;
    assign _449 = _339 & _448;
    assign _450 = _449 & _267;
    assign _452 = _450 & _451;
    assign _456 = _452 & _455;
    assign _457 = _456 & _446;
    assign _462 = _457 & _461;
    assign _3810 = _462 ? _2551 : _3808;
    assign _3862 = _447 ? _3861 : _3810;
    assign _719 = _270 == _466;
    assign _3864 = _719 ? _2551 : _3862;
    assign _3560 = _270 == _1879;
    assign _3871 = _3560 ? _3870 : _3864;
    assign _333 = _270 == _494;
    assign _3877 = _333 ? _3876 : _3871;
    assign _2601 = _1279[90:88];
    assign _2600 = _1273[90:88];
    assign _2599 = _1267[90:88];
    assign _2598 = _915[90:88];
    always @* begin
        case (f_winner)
        0:
            _2602 <= _2598;
        1:
            _2602 <= _2599;
        2:
            _2602 <= _2600;
        default:
            _2602 <= _2601;
        endcase
    end
    assign _2594 = _1279[87:87];
    assign _2593 = _1273[87:87];
    assign _2592 = _1267[87:87];
    assign _2591 = _915[87:87];
    always @* begin
        case (f_winner)
        0:
            _2595 <= _2591;
        1:
            _2595 <= _2592;
        2:
            _2595 <= _2593;
        default:
            _2595 <= _2594;
        endcase
    end
    assign _3799 = ~ _2595;
    assign _3800 = _1712 & _3799;
    assign _3802 = _3800 ? _2602 : _464;
    assign _270 = _3802;
    assign _330 = _270 == _467;
    assign _331 = _330 | _317;
    assign _3879 = _331 ? _2551 : _3877;
    assign _271 = _3879;
    always @(posedge _310) begin
        if (_308)
            g_mode_0 <= _2551;
        else
            g_mode_0 <= _271;
    end
    assign _339 = g_mode_0 == _2058;
    assign _340 = _339 & _269;
    assign _447 = _340 & _446;
    assign _688 = _447 & _687;
    assign _702 = _688 & g_data_left_0;
    assign _711 = _702 & _710;
    assign _717 = _711 & _716;
    assign _753 = _717 | _752;
    assign _2979 = _753 | _857;
    assign _273 = host_rx_to_tx;
    assign _2980 = _273 & _2979;
    assign _274 = _2980;
    assign _3007 = _274 | _3006;
    assign _3009 = _3007 & _3008;
    assign _3880 = _3009 ^ _3531;
    assign _3886 = _3880 ? _3885 : _275;
    always @(posedge _310) begin
        if (_308)
            _3889 <= _1996;
        else
            _3889 <= _3886;
    end
    assign _275 = _3889;
    assign _1196 = _275 == _1996;
    assign _3891 = _1196 ? _775 : _3059;
    assign _1802 = _1262[28:27];
    assign _1800 = _1279[95:94];
    assign _1799 = _1273[95:94];
    assign _1798 = _1267[95:94];
    assign _1797 = _915[95:94];
    always @* begin
        case (f_winner)
        0:
            _1801 <= _1797;
        1:
            _1801 <= _1798;
        2:
            _1801 <= _1799;
        default:
            _1801 <= _1800;
        endcase
    end
    assign _1803 = _899 ? _1802 : _1801;
    always @* begin
        case (_1803)
        0:
            _3903 <= _1189;
        1:
            _3903 <= _3891;
        2:
            _3903 <= _3900;
        default:
            _3903 <= _3902;
        endcase
    end
    assign _3904 = _1713 ? _3903 : _1189;
    assign _276 = _3904;
    always @(posedge _310) begin
        if (_308)
            _1189 <= _773;
        else
            _1189 <= _276;
    end
    assign _1190 = _1189[0:0];
    assign _3915 = 8'b00001000;
    assign _3914 = 8'b00000111;
    assign _3913 = _1184 - _779;
    assign _3910 = _1262[30:29];
    assign _3908 = _1279[99:98];
    assign _3907 = _1273[99:98];
    assign _3906 = _1267[99:98];
    assign _3905 = _915[99:98];
    always @* begin
        case (f_winner)
        0:
            _3909 <= _3905;
        1:
            _3909 <= _3906;
        2:
            _3909 <= _3907;
        default:
            _3909 <= _3908;
        endcase
    end
    assign _3911 = _899 ? _3910 : _3909;
    always @* begin
        case (_3911)
        0:
            _3916 <= _1184;
        1:
            _3916 <= _3913;
        2:
            _3916 <= _3914;
        default:
            _3916 <= _3915;
        endcase
    end
    assign _3917 = _1713 ? _3916 : _1184;
    assign _277 = _3917;
    always @(posedge _310) begin
        if (_308)
            _1184 <= _773;
        else
            _1184 <= _277;
    end
    assign _1186 = _1184 == _773;
    assign _1384 = _1267[61:58];
    always @* begin
        case (_1384)
        0:
            _1385 <= vdd;
        1:
            _1385 <= _1186;
        2:
            _1385 <= _1190;
        3:
            _1385 <= _1194;
        4:
            _1385 <= _1196;
        5:
            _1385 <= _755;
        6:
            _1385 <= _1200;
        7:
            _1385 <= _1203;
        8:
            _1385 <= _675;
        9:
            _1385 <= _678;
        10:
            _1385 <= _681;
        11:
            _1385 <= _684;
        12:
            _1385 <= _663;
        13:
            _1385 <= _666;
        14:
            _1385 <= _669;
        default:
            _1385 <= _672;
        endcase
    end
    assign _1387 = _1385 ^ _1386;
    assign _1379 = _1267[57:42];
    assign _1381 = _1379 == _2010;
    assign _1370 = _1316[57:42];
    assign _1371 = { gnd,
                     _1370 };
    assign _1372 = _1371 + _1359;
    always @(posedge _310) begin
        if (_308)
            _1375 <= _1652;
        else
            _1375 <= _1372;
    end
    assign _1376 = _1375 < _1315;
    assign _1377 = ~ _1376;
    assign _1366 = _1267[41:26];
    assign _1368 = _1366 == _1695;
    assign _1144 = _1140 + _494;
    assign _3932 = _1140 + _494;
    assign _3928 = _1140 == _2476;
    assign _3929 = ~ _3928;
    assign _3926 = _929[0:0];
    assign _3930 = _3926 & _3929;
    assign _3933 = _3930 ? _3932 : _1140;
    assign _3923 = _929[0:0];
    assign _3924 = ~ _3923;
    assign _3922 = f_chg_now[0:0];
    assign _3925 = _3922 & _3924;
    assign _3935 = _3925 ? _494 : _3933;
    assign _3919 = _891 == _2058;
    assign _3921 = _3919 ? _464 : _1140;
    assign _3918 = _891 == _2057;
    assign _3936 = _3918 ? _3935 : _3921;
    assign _278 = _3936;
    always @(posedge _310) begin
        if (_308)
            _1140 <= _464;
        else
            _1140 <= _278;
    end
    assign _1142 = _1140 == _2476;
    assign _1145 = _1142 ? _1140 : _1144;
    assign _1135 = _929[0:0];
    assign _1136 = ~ _1135;
    assign _1134 = f_chg_now[0:0];
    assign _1137 = _1134 & _1136;
    assign _1147 = _1137 ? _494 : _1145;
    assign _1131 = f_changed_all[0:0];
    assign _1132 = f_in_fetch & _1131;
    assign _1148 = _1132 ? _1147 : _464;
    assign _1350 = _1320[0:0];
    assign _1352 = _1350 ? _1148 : _464;
    assign _1123 = _1119 + _494;
    assign _3951 = _1119 + _494;
    assign _3947 = _1119 == _2476;
    assign _3948 = ~ _3947;
    assign _3945 = _929[1:1];
    assign _3949 = _3945 & _3948;
    assign _3952 = _3949 ? _3951 : _1119;
    assign _3942 = _929[1:1];
    assign _3943 = ~ _3942;
    assign _3941 = f_chg_now[1:1];
    assign _3944 = _3941 & _3943;
    assign _3954 = _3944 ? _494 : _3952;
    assign _3938 = _891 == _2058;
    assign _3940 = _3938 ? _464 : _1119;
    assign _3937 = _891 == _2057;
    assign _3955 = _3937 ? _3954 : _3940;
    assign _279 = _3955;
    always @(posedge _310) begin
        if (_308)
            _1119 <= _464;
        else
            _1119 <= _279;
    end
    assign _1121 = _1119 == _2476;
    assign _1124 = _1121 ? _1119 : _1123;
    assign _1114 = _929[1:1];
    assign _1115 = ~ _1114;
    assign _1113 = f_chg_now[1:1];
    assign _1116 = _1113 & _1115;
    assign _1126 = _1116 ? _494 : _1124;
    assign _1110 = f_changed_all[1:1];
    assign _1111 = f_in_fetch & _1110;
    assign _1127 = _1111 ? _1126 : _464;
    assign _1347 = _1320[1:1];
    assign _1349 = _1347 ? _1127 : _464;
    assign _1353 = _1349 < _1352;
    assign _1354 = _1353 ? _1352 : _1349;
    assign _1100 = _1096 + _494;
    assign _3970 = _1096 + _494;
    assign _3966 = _1096 == _2476;
    assign _3967 = ~ _3966;
    assign _3964 = _929[2:2];
    assign _3968 = _3964 & _3967;
    assign _3971 = _3968 ? _3970 : _1096;
    assign _3961 = _929[2:2];
    assign _3962 = ~ _3961;
    assign _3960 = f_chg_now[2:2];
    assign _3963 = _3960 & _3962;
    assign _3973 = _3963 ? _494 : _3971;
    assign _3957 = _891 == _2058;
    assign _3959 = _3957 ? _464 : _1096;
    assign _3956 = _891 == _2057;
    assign _3974 = _3956 ? _3973 : _3959;
    assign _280 = _3974;
    always @(posedge _310) begin
        if (_308)
            _1096 <= _464;
        else
            _1096 <= _280;
    end
    assign _1098 = _1096 == _2476;
    assign _1101 = _1098 ? _1096 : _1100;
    assign _1091 = _929[2:2];
    assign _1092 = ~ _1091;
    assign _1090 = f_chg_now[2:2];
    assign _1093 = _1090 & _1092;
    assign _1103 = _1093 ? _494 : _1101;
    assign _1087 = f_changed_all[2:2];
    assign _1088 = f_in_fetch & _1087;
    assign _1104 = _1088 ? _1103 : _464;
    assign _1342 = _1320[2:2];
    assign _1344 = _1342 ? _1104 : _464;
    assign _1079 = _1075 + _494;
    assign _3989 = _1075 + _494;
    assign _3985 = _1075 == _2476;
    assign _3986 = ~ _3985;
    assign _3983 = _929[3:3];
    assign _3987 = _3983 & _3986;
    assign _3990 = _3987 ? _3989 : _1075;
    assign _3980 = _929[3:3];
    assign _3981 = ~ _3980;
    assign _3979 = f_chg_now[3:3];
    assign _3982 = _3979 & _3981;
    assign _3992 = _3982 ? _494 : _3990;
    assign _3976 = _891 == _2058;
    assign _3978 = _3976 ? _464 : _1075;
    assign _3975 = _891 == _2057;
    assign _3993 = _3975 ? _3992 : _3978;
    assign _281 = _3993;
    always @(posedge _310) begin
        if (_308)
            _1075 <= _464;
        else
            _1075 <= _281;
    end
    assign _1077 = _1075 == _2476;
    assign _1080 = _1077 ? _1075 : _1079;
    assign _1070 = _929[3:3];
    assign _1071 = ~ _1070;
    assign _1069 = f_chg_now[3:3];
    assign _1072 = _1069 & _1071;
    assign _1082 = _1072 ? _494 : _1080;
    assign _1066 = f_changed_all[3:3];
    assign _1067 = f_in_fetch & _1066;
    assign _1083 = _1067 ? _1082 : _464;
    assign _1339 = _1320[3:3];
    assign _1341 = _1339 ? _1083 : _464;
    assign _1345 = _1341 < _1344;
    assign _1346 = _1345 ? _1344 : _1341;
    assign _1355 = _1346 < _1354;
    assign _1356 = _1355 ? _1354 : _1346;
    assign _1054 = _1050 + _494;
    assign _4008 = _1050 + _494;
    assign _4004 = _1050 == _2476;
    assign _4005 = ~ _4004;
    assign _4002 = _929[4:4];
    assign _4006 = _4002 & _4005;
    assign _4009 = _4006 ? _4008 : _1050;
    assign _3999 = _929[4:4];
    assign _4000 = ~ _3999;
    assign _3998 = f_chg_now[4:4];
    assign _4001 = _3998 & _4000;
    assign _4011 = _4001 ? _494 : _4009;
    assign _3995 = _891 == _2058;
    assign _3997 = _3995 ? _464 : _1050;
    assign _3994 = _891 == _2057;
    assign _4012 = _3994 ? _4011 : _3997;
    assign _282 = _4012;
    always @(posedge _310) begin
        if (_308)
            _1050 <= _464;
        else
            _1050 <= _282;
    end
    assign _1052 = _1050 == _2476;
    assign _1055 = _1052 ? _1050 : _1054;
    assign _1045 = _929[4:4];
    assign _1046 = ~ _1045;
    assign _1044 = f_chg_now[4:4];
    assign _1047 = _1044 & _1046;
    assign _1057 = _1047 ? _494 : _1055;
    assign _1041 = f_changed_all[4:4];
    assign _1042 = f_in_fetch & _1041;
    assign _1058 = _1042 ? _1057 : _464;
    assign _1332 = _1320[4:4];
    assign _1334 = _1332 ? _1058 : _464;
    assign _1033 = _1029 + _494;
    assign _4027 = _1029 + _494;
    assign _4023 = _1029 == _2476;
    assign _4024 = ~ _4023;
    assign _4021 = _929[5:5];
    assign _4025 = _4021 & _4024;
    assign _4028 = _4025 ? _4027 : _1029;
    assign _4018 = _929[5:5];
    assign _4019 = ~ _4018;
    assign _4017 = f_chg_now[5:5];
    assign _4020 = _4017 & _4019;
    assign _4030 = _4020 ? _494 : _4028;
    assign _4014 = _891 == _2058;
    assign _4016 = _4014 ? _464 : _1029;
    assign _4013 = _891 == _2057;
    assign _4031 = _4013 ? _4030 : _4016;
    assign _283 = _4031;
    always @(posedge _310) begin
        if (_308)
            _1029 <= _464;
        else
            _1029 <= _283;
    end
    assign _1031 = _1029 == _2476;
    assign _1034 = _1031 ? _1029 : _1033;
    assign _1024 = _929[5:5];
    assign _1025 = ~ _1024;
    assign _1023 = f_chg_now[5:5];
    assign _1026 = _1023 & _1025;
    assign _1036 = _1026 ? _494 : _1034;
    assign _1020 = f_changed_all[5:5];
    assign _1021 = f_in_fetch & _1020;
    assign _1037 = _1021 ? _1036 : _464;
    assign _1329 = _1320[5:5];
    assign _1331 = _1329 ? _1037 : _464;
    assign _1335 = _1331 < _1334;
    assign _1336 = _1335 ? _1334 : _1331;
    assign _1010 = _1006 + _494;
    assign _4046 = _1006 + _494;
    assign _4042 = _1006 == _2476;
    assign _4043 = ~ _4042;
    assign _4040 = _929[6:6];
    assign _4044 = _4040 & _4043;
    assign _4047 = _4044 ? _4046 : _1006;
    assign _4037 = _929[6:6];
    assign _4038 = ~ _4037;
    assign _4036 = f_chg_now[6:6];
    assign _4039 = _4036 & _4038;
    assign _4049 = _4039 ? _494 : _4047;
    assign _4033 = _891 == _2058;
    assign _4035 = _4033 ? _464 : _1006;
    assign _4032 = _891 == _2057;
    assign _4050 = _4032 ? _4049 : _4035;
    assign _284 = _4050;
    always @(posedge _310) begin
        if (_308)
            _1006 <= _464;
        else
            _1006 <= _284;
    end
    assign _1008 = _1006 == _2476;
    assign _1011 = _1008 ? _1006 : _1010;
    assign _1001 = _929[6:6];
    assign _1002 = ~ _1001;
    assign _1000 = f_chg_now[6:6];
    assign _1003 = _1000 & _1002;
    assign _1013 = _1003 ? _494 : _1011;
    assign _997 = f_changed_all[6:6];
    assign _998 = f_in_fetch & _997;
    assign _1014 = _998 ? _1013 : _464;
    assign _1324 = _1320[6:6];
    assign _1326 = _1324 ? _1014 : _464;
    assign _989 = _985 + _494;
    assign _4065 = _985 + _494;
    assign _4061 = _985 == _2476;
    assign _4062 = ~ _4061;
    assign _4059 = _929[7:7];
    assign _4063 = _4059 & _4062;
    assign _4066 = _4063 ? _4065 : _985;
    assign _4056 = _929[7:7];
    assign _4057 = ~ _4056;
    assign _4055 = f_chg_now[7:7];
    assign _4058 = _4055 & _4057;
    assign _4068 = _4058 ? _494 : _4066;
    assign _4052 = _891 == _2058;
    assign _4054 = _4052 ? _464 : _985;
    assign _4051 = _891 == _2057;
    assign _4069 = _4051 ? _4068 : _4054;
    assign _285 = _4069;
    always @(posedge _310) begin
        if (_308)
            _985 <= _464;
        else
            _985 <= _285;
    end
    assign _987 = _985 == _2476;
    assign _990 = _987 ? _985 : _989;
    assign _980 = _929[7:7];
    assign _981 = ~ _980;
    assign _979 = f_chg_now[7:7];
    assign _982 = _979 & _981;
    assign _992 = _982 ? _494 : _990;
    assign _976 = f_changed_all[7:7];
    assign _977 = f_in_fetch & _976;
    assign _993 = _977 ? _992 : _464;
    assign _1320 = _1316[23:16];
    assign _1321 = _1320[7:7];
    assign _1323 = _1321 ? _993 : _464;
    assign _1327 = _1323 < _1326;
    assign _1328 = _1327 ? _1326 : _1323;
    assign _1337 = _1328 < _1336;
    assign _1338 = _1337 ? _1336 : _1328;
    assign _1357 = _1338 < _1356;
    assign _1358 = _1357 ? _1356 : _1338;
    assign _1359 = { _1597,
                     _1358 };
    assign _4072 = _896 == _494;
    assign _4073 = _4072 ? _302 : _913;
    assign _4070 = _891 == _2057;
    assign _4074 = _4070 ? _4073 : _913;
    assign _286 = _4074;
    always @(posedge _310) begin
        if (_308)
            _913 <= _903;
        else
            _913 <= _286;
    end
    assign _965 = _896 == _494;
    assign _966 = f_in_fetch & _965;
    assign _967 = _966 ? _302 : _913;
    assign _4077 = _896 == _466;
    assign _4078 = _4077 ? _302 : _910;
    assign _4075 = _891 == _2057;
    assign _4079 = _4075 ? _4078 : _910;
    assign _287 = _4079;
    always @(posedge _310) begin
        if (_308)
            _910 <= _903;
        else
            _910 <= _287;
    end
    assign _961 = _896 == _466;
    assign _962 = f_in_fetch & _961;
    assign _963 = _962 ? _302 : _910;
    assign _4082 = _896 == _1879;
    assign _4083 = _4082 ? _302 : _907;
    assign _4080 = _891 == _2057;
    assign _4084 = _4080 ? _4083 : _907;
    assign _288 = _4084;
    always @(posedge _310) begin
        if (_308)
            _907 <= _903;
        else
            _907 <= _288;
    end
    assign _957 = _896 == _1879;
    assign _958 = f_in_fetch & _957;
    assign _959 = _958 ? _302 : _907;
    assign _4125 = _4112 | f_sweeping;
    assign _4119 = ~ f_sweeping;
    assign _290 = host_rec_we;
    assign _4118 = _290 & _1845;
    assign f_store_we = _4118 & _4119;
    assign _292 = host_rec_wdata;
    always @(posedge _310) begin
        if (f_store_we)
            _4121[_4117] <= _292;
    end
    assign _4115 = _896[1:0];
    assign _294 = host_start_loc;
    assign _1279 = _914[511:400];
    assign _4097 = _1279[110:105];
    assign _1273 = _914[399:288];
    assign _4096 = _1273[110:105];
    assign _4095 = _1267[110:105];
    assign _4094 = _915[110:105];
    always @* begin
        case (f_winner)
        0:
            _4098 <= _4094;
        1:
            _4098 <= _4095;
        2:
            _4098 <= _4096;
        default:
            _4098 <= _4097;
        endcase
    end
    assign _4099 = _4098 == _1776;
    assign _4100 = ~ _4099;
    assign _4101 = _4100 ? _4098 : _1776;
    assign _296 = host_recover_loc;
    assign _4088 = _1905 ? _296 : _4087;
    assign _297 = _4088;
    always @(posedge _310) begin
        if (_308)
            _4087 <= _3819;
        else
            _4087 <= _297;
    end
    assign f_policy = _1262[59:58];
    assign _4091 = f_policy == _2058;
    assign _4092 = _4091 ? _4087 : _1776;
    assign _4093 = f_viol_now ? _4092 : _1776;
    assign _4102 = _1712 ? _4101 : _4093;
    assign _4089 = _891 == _2058;
    assign _4103 = _4089 ? _4102 : _1776;
    assign _4104 = _1905 ? _294 : _4103;
    assign _298 = _4104;
    always @(posedge _310) begin
        if (_308)
            _1776 <= _3819;
        else
            _1776 <= _298;
    end
    assign _4116 = { _1776,
                     _4115 };
    assign _4108 = f_sw_cnt + _2723;
    assign _4106 = _2710 ? _2028 : f_sw_cnt;
    assign _4109 = f_sweeping ? _4108 : _4106;
    assign _299 = _4109;
    always @(posedge _310) begin
        if (_308)
            f_sw_cnt <= _2028;
        else
            f_sw_cnt <= _299;
    end
    assign _4113 = f_sw_cnt[11:4];
    assign _301 = host_rec_waddr;
    assign _4114 = f_sweeping ? _4113 : _301;
    assign _4111 = _896 < _467;
    assign _4112 = f_in_fetch & _4111;
    assign _4117 = _4112 ? _4116 : _4114;
    assign _4122 = _4121[_4117];
    always @(posedge _310) begin
        if (_4125)
            _4126 <= _4122;
    end
    assign _302 = _4126;
    assign _953 = _896 == _467;
    assign _954 = f_in_fetch & _953;
    assign _955 = _954 ? _302 : _904;
    assign _968 = { _955,
                    _959,
                    _963,
                    _967 };
    assign _1316 = _968[287:176];
    assign _1317 = _1316[41:26];
    assign _1318 = { gnd,
                     _1317 };
    assign _1360 = _1318 + _1359;
    always @(posedge _310) begin
        if (_308)
            _1363 <= _1652;
        else
            _1363 <= _1360;
    end
    assign gnd = 1'b0;
    assign _1315 = { gnd,
                     _1312 };
    assign _1364 = _1315 < _1363;
    assign _1365 = ~ _1364;
    assign _1369 = _1365 | _1368;
    assign _1378 = _1369 & _1377;
    assign _4154 = _947 + _4190;
    assign _4150 = _947 == _2010;
    assign _4151 = ~ _4150;
    assign _4152 = _4148 & _4151;
    assign _4155 = _4152 ? _4154 : _947;
    assign _4134 = _4133[2:2];
    assign _4135 = _1713 & _4134;
    assign _4157 = _4135 ? _1695 : _4155;
    assign _4159 = _1905 ? _1695 : _4157;
    assign _303 = _4159;
    always @(posedge _310) begin
        if (_308)
            _947 <= _1695;
        else
            _947 <= _303;
    end
    assign _4171 = _944 + _4190;
    assign _4167 = _944 == _2010;
    assign _4168 = ~ _4167;
    assign _4146 = 9'b111111111;
    assign _4147 = _4139 == _4146;
    assign _4144 = 6'b111111;
    assign _4143 = _4139[5:0];
    assign _4145 = _4143 == _4144;
    assign _4138 = 9'b000000000;
    assign _4160 = 9'b000000001;
    assign _4161 = _4139 + _4160;
    assign _4163 = _1905 ? _4138 : _4161;
    assign _304 = _4163;
    always @(posedge _310) begin
        if (_308)
            _4139 <= _4138;
        else
            _4139 <= _304;
    end
    assign _4140 = _4139[2:0];
    assign _4142 = _4140 == _2476;
    assign _4136 = _1262[63:62];
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
    assign _4172 = _4169 ? _4171 : _944;
    assign _4164 = _4133[1:1];
    assign _4165 = _1713 & _4164;
    assign _4174 = _4165 ? _1695 : _4172;
    assign _4176 = _1905 ? _1695 : _4174;
    assign _305 = _4176;
    always @(posedge _310) begin
        if (_308)
            _944 <= _1695;
        else
            _944 <= _305;
    end
    assign _1311 = _1267[25:24];
    always @* begin
        case (_1311)
        0:
            _1312 <= _941;
        1:
            _1312 <= _944;
        2:
            _1312 <= _947;
        default:
            _1312 <= _947;
        endcase
    end
    assign _1314 = _1312 == _2010;
    assign _1382 = _1314 ? _1381 : _1378;
    always @(posedge _310) begin
        if (_308)
            _358 <= _773;
        else
            _358 <= _346;
    end
    assign f_chg_now = _346 ^ _358;
    assign _4178 = _891 == _2058;
    assign _4180 = _4178 ? _773 : _929;
    assign _4177 = _891 == _2057;
    assign _4181 = _4177 ? f_changed_all : _4180;
    assign _4183 = _1905 ? _773 : _4181;
    assign _306 = _4183;
    always @(posedge _310) begin
        if (_308)
            _929 <= _773;
        else
            _929 <= _306;
    end
    assign f_changed_all = _929 | f_chg_now;
    assign _1305 = f_changed_all & f_chgmask1;
    assign _1307 = _1305 == _773;
    assign _1308 = ~ _1307;
    assign f_chgmask1 = _1267[23:16];
    assign _1304 = f_chgmask1 == _773;
    assign _1309 = _1304 | _1308;
    assign _1298 = _1267[7:0];
    assign _1296 = _1267[15:8];
    assign vdd = 1'b1;
    assign _308 = clear;
    assign _310 = clock;
    assign _312 = pins_in;
    always @(posedge _310) begin
        if (_308)
            _343 <= _773;
        else
            _343 <= _312;
    end
    always @(posedge _310) begin
        if (_308)
            _346 <= _773;
        else
            _346 <= _343;
    end
    assign _1297 = _346 ^ _1296;
    assign _1299 = _1297 & _1298;
    assign _1301 = _1299 == _773;
    assign _1267 = _914[287:176];
    assign f_valid1 = _1267[111:111];
    assign _1302 = f_valid1 & _1301;
    assign _1310 = _1302 & _1309;
    assign _1383 = _1310 & _1382;
    assign _1388 = _1383 & _1387;
    assign _1427 = _1388 & _1426;
    assign _1428 = f_in_eval & _1427;
    assign _1432 = _1428 & _1431;
    assign f_fire1 = _1432 & _1294;
    assign _1718 = f_fire1 ? _2057 : _1716;
    assign f_winner = f_fire0 ? _2551 : _1718;
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
    assign _4133 = _899 ? _4132 : _4131;
    assign _4184 = _4133[0:0];
    assign _898 = _896 == _467;
    assign f_in_fetch = _891 == _2057;
    assign _899 = f_in_fetch & _898;
    assign _1713 = _899 | _1712;
    assign _4185 = _1713 & _4184;
    assign _4194 = _4185 ? _1695 : _4192;
    assign _4196 = _1905 ? _1695 : _4194;
    assign _313 = _4196;
    always @(posedge _310) begin
        if (_308)
            _941 <= _1695;
        else
            _941 <= _313;
    end
    assign _1953 = _1262[33:32];
    always @* begin
        case (_1953)
        0:
            _1954 <= _941;
        1:
            _1954 <= _944;
        2:
            _1954 <= _947;
        default:
            _1954 <= _947;
        endcase
    end
    assign _1952 = _1262[49:34];
    assign _1955 = _1952 < _1954;
    assign _1262 = _914[63:0];
    assign _1950 = _1262[31:31];
    assign _1948 = ~ _1712;
    assign _1949 = f_in_eval & _1948;
    assign _1951 = _1949 & _1950;
    assign _1956 = _1951 & _1955;
    assign _1961 = _1956 & _1960;
    assign _1969 = _1961 | f_unexp_now;
    assign f_viol_now = _1969 | f_amb_now;
    assign _4202 = f_viol_now ? _4201 : _896;
    assign _4205 = _1712 ? _4204 : _4202;
    assign _4198 = _891 == _2058;
    assign _4206 = _4198 ? _4205 : _896;
    assign _4197 = _891 == _2057;
    assign _4209 = _4197 ? _4208 : _4206;
    assign _4211 = _1905 ? _464 : _4209;
    assign _314 = _4211;
    always @(posedge _310) begin
        if (_308)
            _896 <= _464;
        else
            _896 <= _314;
    end
    assign _4214 = _896 == _467;
    assign _4215 = _4214 ? _302 : _904;
    assign _4212 = _891 == _2057;
    assign _4216 = _4212 ? _4215 : _904;
    assign _315 = _4216;
    always @(posedge _310) begin
        if (_308)
            _904 <= _903;
        else
            _904 <= _315;
    end
    assign _914 = { _904,
                    _907,
                    _910,
                    _913 };
    assign _915 = _914[175:64];
    assign f_valid0 = _915[111:111];
    assign _923 = f_valid0 & _922;
    assign _937 = _923 & _936;
    assign _1180 = _937 & _1179;
    assign _1207 = _1180 & _1206;
    assign _1251 = _1207 & _1250;
    assign f_in_eval = _891 == _2058;
    assign _1252 = f_in_eval & _1251;
    assign _1261 = _1252 & _1260;
    assign f_fire0 = _1261 & _1294;
    assign _1434 = f_fire0 | f_fire1;
    assign _1573 = _1434 | f_fire2;
    assign _1712 = _1573 | f_fire3;
    assign _4235 = _1712 ? _4234 : _4232;
    assign _4220 = _891 == _1973;
    assign _4222 = _4220 ? _2551 : _891;
    assign _4218 = _891 == _2058;
    assign _4236 = _4218 ? _4235 : _4222;
    assign _4217 = _891 == _2057;
    assign _4239 = _4217 ? _4238 : _4236;
    assign _317 = host_stop;
    assign _4241 = _317 ? _2551 : _4239;
    assign _4243 = _1905 ? _2057 : _4241;
    assign _318 = _4243;
    always @(posedge _310) begin
        if (_308)
            _891 <= _2551;
        else
            _891 <= _318;
    end
    assign _1845 = _891 == _2551;
    assign _320 = host_verify;
    assign _2708 = _320 & _1845;
    assign _2710 = _2708 & _2709;
    assign _4245 = _2710 ? _1831 : f_sweeping;
    assign _4255 = f_sweeping ? _4254 : _4245;
    assign _321 = _4255;
    always @(posedge _310) begin
        if (_308)
            f_sweeping <= _1829;
        else
            f_sweeping <= _321;
    end
    assign _4267 = f_sweeping ? _4266 : _4260;
    assign _322 = _4267;
    always @(posedge _310) begin
        if (_308)
            f_image_valid <= _1829;
        else
            f_image_valid <= _322;
    end
    assign _324 = host_start;
    assign _1905 = _324 & f_image_valid;
    assign _4291 = _1905 ? _773 : _4289;
    assign _325 = _4291;
    always @(posedge _310) begin
        if (_308)
            f_pout <= _773;
        else
            f_pout <= _325;
    end
    assign _2633 = f_pout[7:7];
    assign _327 = host_pin_src;
    assign _2629 = _327[23:21];
    always @* begin
        case (_2629)
        0:
            _2640 <= _2633;
        1:
            _2640 <= f_lane0_out;
        2:
            _2640 <= _2634;
        3:
            _2640 <= _2635;
        4:
            _2640 <= _2637;
        5:
            _2640 <= f_lane1_out;
        6:
            _2640 <= _2638;
        default:
            _2640 <= _2639;
        endcase
    end
    assign _2704 = { _2640,
                     _2649,
                     _2658,
                     _2667,
                     _2676,
                     _2685,
                     _2694,
                     _2703 };
    assign _4293 = _2704 & _4292;
    assign pins_out = _4293;
    assign pins_oe = _2707;
    assign st_running = _2564;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1776;
    assign st_accepting = _2563;
    assign st_taken = _2561;
    assign st_taken_edge = _2558;
    assign st_viol = _2555;
    assign st_viol_kind = _2552;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _757;
    assign st_tx_empty = _1196;
    assign st_rx_data = _2547;
    assign st_rx_empty = _2482;
    assign st_vlog_data = _2480;
    assign st_vlog_empty = _1997;
    assign st_cov_rdata = _2109;
    assign st_irq = _2001;
    assign st_halted_viol = _1934;
    assign st_rx_overflow = _1927;
    assign st_vlog_overflow = _1915;
    assign st_cov_overrun = _1908;
    assign st_host_err = _1892;
    assign st_host_err_cause = _1897;
    assign st_lane_active = _1843;
    assign st_image_valid = f_image_valid;
    assign st_verify_busy = f_sweeping;
    assign st_tx_collision = _1830;
    assign st_drops = _1796;
    assign st_lane_status = _686;

endmodule
