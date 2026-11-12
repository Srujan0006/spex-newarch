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

    wire [2:0] _452;
    wire [2:0] _482;
    wire [2:0] _483;
    wire [2:0] _455;
    wire [2:0] _454;
    wire [2:0] _456;
    wire [2:0] _457;
    wire [2:0] _484;
    wire [2:0] _486;
    wire [2:0] _488;
    wire [2:0] _1;
    reg [2:0] _453;
    wire [7:0] _667;
    wire [2:0] _638;
    wire [2:0] _612;
    wire [2:0] _613;
    wire [2:0] _639;
    wire [2:0] _641;
    wire [2:0] _643;
    wire [2:0] _2;
    reg [2:0] _609;
    wire [7:0] _655;
    wire [15:0] _668;
    wire [7:0] _755;
    wire [7:0] _761;
    wire [7:0] _762;
    wire [7:0] _757;
    wire _758;
    wire _759;
    wire _751;
    wire _748;
    wire _749;
    wire _745;
    wire _742;
    wire _743;
    wire _744;
    wire _746;
    wire _750;
    wire _752;
    wire _741;
    wire _753;
    wire _760;
    wire [7:0] _763;
    wire [7:0] _765;
    wire [7:0] _4;
    reg [7:0] _756;
    wire [7:0] _864;
    wire _860;
    wire _861;
    wire _853;
    wire _850;
    wire _851;
    wire _847;
    wire _844;
    wire _845;
    wire _846;
    wire _848;
    wire _852;
    wire _854;
    wire _740;
    wire _842;
    wire _843;
    wire _855;
    wire _862;
    wire [7:0] _865;
    wire [7:0] _867;
    wire [7:0] _5;
    reg [7:0] _858;
    wire [7:0] _1738;
    wire _1734;
    wire _1735;
    wire _1728;
    wire _1729;
    wire _1736;
    wire [7:0] _1739;
    wire [7:0] _1741;
    wire [7:0] _6;
    reg [7:0] _1732;
    wire [7:0] _1753;
    wire _1749;
    wire _1750;
    wire _1751;
    wire [7:0] _1754;
    wire [7:0] _1756;
    wire [7:0] _7;
    reg [7:0] _1747;
    wire [7:0] _1780;
    wire _1776;
    wire _1777;
    wire _1778;
    wire [7:0] _1781;
    wire _9;
    wire [7:0] _1783;
    wire [7:0] _10;
    reg [7:0] _1774;
    wire [39:0] _1784;
    wire _1817;
    wire _1819;
    wire _1797;
    wire _1815;
    wire _1820;
    wire _1822;
    wire _12;
    reg _1818;
    wire [1:0] _1831;
    wire [2:0] _1886;
    wire [2:0] _1888;
    wire [2:0] _17;
    reg [2:0] _1885;
    wire _1881;
    wire [2:0] _1871;
    wire [2:0] _1867;
    wire [2:0] _1868;
    wire [2:0] _1872;
    wire [2:0] _1864;
    wire [2:0] _1863;
    wire [2:0] _1865;
    wire [2:0] _1873;
    wire _1859;
    wire _1856;
    wire _1857;
    wire _1858;
    wire _1860;
    wire _1852;
    wire _1853;
    wire _1829;
    wire _1849;
    wire _1850;
    wire _1830;
    wire [1:0] _20;
    wire _1847;
    wire _1848;
    wire _1851;
    wire _1854;
    wire _1843;
    wire _1839;
    wire _1844;
    wire _1837;
    wire _22;
    wire _1836;
    wire _1838;
    wire _1845;
    wire _1834;
    wire _1835;
    wire _1846;
    wire _1855;
    wire _1861;
    wire [2:0] _1874;
    wire _1876;
    wire _1877;
    wire _1882;
    wire _1890;
    wire _24;
    wire _1892;
    wire _25;
    reg _1880;
    wire _1769;
    wire _1770;
    wire _1761;
    wire _1771;
    wire _1898;
    wire _1900;
    wire _27;
    reg _1896;
    wire _1744;
    wire _1905;
    wire _1907;
    wire _29;
    reg _1903;
    wire _1911;
    wire _1726;
    wire _1719;
    wire _1727;
    wire _840;
    wire _836;
    wire _841;
    wire _1908;
    wire _31;
    wire _1909;
    wire _1910;
    wire _1912;
    wire _1917;
    wire _1919;
    wire _32;
    reg _1915;
    wire _1923;
    wire _1924;
    wire _1929;
    wire _36;
    wire _1931;
    wire _1933;
    wire _37;
    reg _1927;
    wire _1962;
    wire _1964;
    wire _1960;
    wire _1966;
    wire _1967;
    wire _1968;
    wire _1935;
    wire _1969;
    wire _1971;
    wire _38;
    reg _1922;
    wire _1986;
    wire [2:0] _40;
    wire [3:0] _1979;
    wire _1980;
    wire _1981;
    wire _42;
    wire _1982;
    wire [2:0] _44;
    wire _1973;
    wire [2:0] _1975;
    wire [3:0] _1976;
    wire _1977;
    wire _1978;
    wire _1983;
    wire _1987;
    wire _1988;
    wire _1989;
    wire _2091;
    wire _2090;
    wire _2092;
    wire [31:0] _2089;
    wire _2083;
    wire _2081;
    wire _2079;
    wire _47;
    wire _2078;
    wire _2080;
    wire _2082;
    wire f_host_cov_we;
    wire _2085;
    wire [11:0] _2072;
    wire _2069;
    wire _2070;
    wire [11:0] _2071;
    wire _2073;
    wire [11:0] _2074;
    wire [11:0] _2075;
    wire [11:0] _2061;
    wire [11:0] _2022;
    wire [11:0] _2019;
    wire [12:0] _2016;
    wire [9:0] _2013;
    wire [12:0] _2014;
    wire [12:0] _2015;
    reg [2:0] _1990;
    wire [2:0] _48;
    reg [2:0] _2010;
    wire [12:0] _2011;
    wire [12:0] _1996;
    wire [12:0] _1995;
    wire [15:0] _1991;
    wire _1994;
    wire [12:0] _1997;
    wire [12:0] _49;
    reg [12:0] _2006;
    wire _2012;
    wire [12:0] _2017;
    wire [12:0] _2003;
    wire _2018;
    wire [11:0] _2021;
    wire [15:0] _1998;
    wire _1999;
    wire _50;
    reg _2002;
    wire [11:0] _2023;
    wire [11:0] _51;
    reg [11:0] _2062;
    wire [11:0] _2026;
    reg [1:0] _1992;
    reg [15:0] _1993;
    wire [15:0] _2024;
    wire _2025;
    wire [11:0] _2028;
    wire [11:0] _52;
    reg [11:0] _2059;
    wire _2063;
    wire _2064;
    wire [11:0] _2065;
    wire [11:0] _2056;
    wire _2066;
    wire [11:0] _2067;
    wire _2055;
    wire [11:0] _2068;
    wire [7:0] _2051;
    wire [1:0] _2046;
    wire [1:0] _2045;
    wire _2030;
    wire _2029;
    wire _2031;
    wire _53;
    reg _2044;
    wire [1:0] _2047;
    wire [6:0] _2041;
    wire [8:0] _2048;
    wire [7:0] _2039;
    wire [8:0] _2040;
    wire [8:0] _2049;
    wire _2050;
    wire [7:0] _2053;
    wire [31:0] _2076;
    wire [31:0] _55;
    wire [31:0] _2077;
    reg [31:0] _2086[0:255];
    wire [7:0] _56;
    reg [7:0] _2037;
    wire [7:0] _1765;
    wire [7:0] _57;
    reg [7:0] _1768;
    wire [7:0] _59;
    wire [7:0] _2034;
    wire _2032;
    wire _61;
    wire _1757;
    wire _2033;
    wire _62;
    reg _1760;
    wire _63;
    reg _1842;
    wire [7:0] _2038;
    wire [31:0] _2087;
    reg [31:0] _2093;
    wire [31:0] _64;
    wire _2094;
    wire _2095;
    wire [31:0] _2097;
    wire [2:0] _2464;
    wire _2465;
    wire _2466;
    wire [47:0] _2463;
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
    wire _2435;
    wire _2436;
    reg [47:0] _2437;
    wire _2429;
    wire _2430;
    reg [47:0] _2431;
    wire [2:0] _2104;
    wire [2:0] _2105;
    wire [2:0] _67;
    reg [2:0] _2102;
    wire _2423;
    wire _2424;
    wire [2:0] _2396;
    wire [28:0] _2113;
    wire [28:0] _2112;
    wire [28:0] _2115;
    wire [28:0] _2116;
    wire [2:0] _2109;
    wire _2111;
    wire [28:0] _2117;
    wire [28:0] _68;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2394;
    wire [2:0] _2135;
    wire _2131;
    wire _2132;
    wire _2129;
    wire _2133;
    wire [2:0] _2136;
    wire _2126;
    wire _2127;
    wire _2124;
    wire _2123;
    wire _2125;
    wire _2128;
    wire [2:0] _2138;
    wire _2119;
    wire [2:0] _2139;
    wire [2:0] _69;
    reg [2:0] _2122;
    wire _2385;
    wire [2:0] _2387;
    wire [2:0] _2156;
    wire _2152;
    wire _2153;
    wire _2150;
    wire _2154;
    wire [2:0] _2157;
    wire _2147;
    wire _2148;
    wire _2145;
    wire _2144;
    wire _2146;
    wire _2149;
    wire [2:0] _2159;
    wire _2140;
    wire [2:0] _2160;
    wire [2:0] _70;
    reg [2:0] _2143;
    wire _2382;
    wire [2:0] _2384;
    wire [2:0] _2388;
    wire [2:0] _2177;
    wire _2173;
    wire _2174;
    wire _2171;
    wire _2175;
    wire [2:0] _2178;
    wire _2168;
    wire _2169;
    wire _2166;
    wire _2165;
    wire _2167;
    wire _2170;
    wire [2:0] _2180;
    wire _2161;
    wire [2:0] _2181;
    wire [2:0] _71;
    reg [2:0] _2164;
    wire _2378;
    wire [2:0] _2380;
    wire [2:0] _2198;
    wire _2194;
    wire _2195;
    wire _2192;
    wire _2196;
    wire [2:0] _2199;
    wire _2189;
    wire _2190;
    wire _2187;
    wire _2186;
    wire _2188;
    wire _2191;
    wire [2:0] _2201;
    wire _2182;
    wire [2:0] _2202;
    wire [2:0] _72;
    reg [2:0] _2185;
    wire _2375;
    wire [2:0] _2377;
    wire [2:0] _2381;
    wire [2:0] _2389;
    wire [2:0] _2219;
    wire _2215;
    wire _2216;
    wire _2213;
    wire _2217;
    wire [2:0] _2220;
    wire _2210;
    wire _2211;
    wire _2208;
    wire _2207;
    wire _2209;
    wire _2212;
    wire [2:0] _2222;
    wire _2203;
    wire [2:0] _2223;
    wire [2:0] _73;
    reg [2:0] _2206;
    wire _2370;
    wire [2:0] _2372;
    wire [2:0] _2240;
    wire _2236;
    wire _2237;
    wire _2234;
    wire _2238;
    wire [2:0] _2241;
    wire _2231;
    wire _2232;
    wire _2229;
    wire _2228;
    wire _2230;
    wire _2233;
    wire [2:0] _2243;
    wire _2224;
    wire [2:0] _2244;
    wire [2:0] _74;
    reg [2:0] _2227;
    wire _2367;
    wire [2:0] _2369;
    wire [2:0] _2373;
    wire [2:0] _2261;
    wire _2257;
    wire _2258;
    wire _2255;
    wire _2259;
    wire [2:0] _2262;
    wire _2252;
    wire _2253;
    wire _2250;
    wire _2249;
    wire _2251;
    wire _2254;
    wire [2:0] _2264;
    wire _2245;
    wire [2:0] _2265;
    wire [2:0] _75;
    reg [2:0] _2248;
    wire _2363;
    wire [2:0] _2365;
    wire [2:0] _2282;
    wire _2278;
    wire _2279;
    wire _2276;
    wire _2280;
    wire [2:0] _2283;
    wire _2273;
    wire _2274;
    wire _2271;
    wire _2270;
    wire _2272;
    wire _2275;
    wire [2:0] _2285;
    wire _2266;
    wire [2:0] _2286;
    wire [2:0] _76;
    reg [2:0] _2269;
    wire _2360;
    wire [2:0] _2362;
    wire [2:0] _2366;
    wire [2:0] _2374;
    wire [2:0] _2390;
    wire _2355;
    wire _2354;
    wire _2356;
    wire _2352;
    wire _2351;
    wire _2353;
    wire _2357;
    wire _2348;
    wire _2347;
    wire _2349;
    wire _2345;
    wire _2344;
    wire _2346;
    wire _2350;
    wire _2358;
    wire [2:0] _2391;
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
    wire _2295;
    wire _2294;
    wire _2296;
    wire [2:0] _2298;
    wire _2290;
    wire _2289;
    wire _2291;
    wire [2:0] _2293;
    wire _2299;
    wire [2:0] _2300;
    wire _2313;
    wire [2:0] _2314;
    wire _2341;
    wire [2:0] _2342;
    wire [2:0] _2343;
    wire [2:0] _2392;
    wire [2:0] _2287;
    wire _2393;
    wire [28:0] _2395;
    wire [31:0] _2397;
    wire [47:0] _2401;
    wire [47:0] _77;
    reg [47:0] _2425;
    wire [2:0] _2418;
    wire [3:0] _1984;
    wire [3:0] _2407;
    wire [3:0] _2408;
    wire [3:0] _2406;
    wire [3:0] _2409;
    wire [3:0] _1742;
    wire _1743;
    wire _2098;
    wire _78;
    wire _2099;
    wire _2404;
    wire [3:0] _2410;
    reg [3:0] _2413;
    wire [3:0] _79;
    wire _1985;
    wire _2402;
    wire _81;
    wire _2403;
    wire [2:0] _2419;
    wire [2:0] _82;
    reg [2:0] _2416;
    reg [47:0] _2468;
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
    wire _2502;
    wire _2503;
    reg [7:0] _2504;
    wire _2496;
    wire _2497;
    reg [7:0] _2498;
    wire [2:0] _2477;
    wire [2:0] _2478;
    wire [2:0] _85;
    reg [2:0] _2475;
    wire _2490;
    wire _2491;
    reg [7:0] _2492;
    wire [2:0] _2485;
    wire [2:0] _2486;
    wire [2:0] _86;
    reg [2:0] _2483;
    reg [7:0] _2535;
    wire [31:0] _2536;
    wire [31:0] _2537;
    wire [31:0] _90;
    reg [31:0] ts_reg;
    wire [1:0] _2539;
    wire [1:0] _2398;
    wire [1:0] _2400;
    reg [1:0] _2540;
    reg _2543;
    reg [1:0] _2546;
    reg _2549;
    wire _2550;
    wire _2551;
    wire _2552;
    wire [7:0] _2693;
    wire [7:0] _2694;
    wire [7:0] _2574;
    wire [7:0] _2572;
    wire [7:0] _2571;
    wire [7:0] _2570;
    wire [7:0] _2569;
    reg [7:0] _2573;
    wire [7:0] _2575;
    wire [7:0] _2576;
    wire [7:0] _2567;
    wire [7:0] _2568;
    wire [7:0] _2577;
    wire [7:0] _2611;
    wire [7:0] _2612;
    wire [7:0] _2614;
    wire [7:0] _2616;
    wire [7:0] _100;
    reg [7:0] f_poe;
    wire [7:0] _2695;
    wire [7:0] _103;
    wire [7:0] _4280;
    wire _2690;
    wire _2689;
    wire _2687;
    wire _2688;
    wire _2686;
    wire _2685;
    wire _2684;
    wire [2:0] _2683;
    reg _2691;
    wire _2681;
    wire _2680;
    wire _2678;
    wire _2679;
    wire _2677;
    wire _2676;
    wire _2675;
    wire [2:0] _2674;
    reg _2682;
    wire _2672;
    wire _2671;
    wire _2669;
    wire _2670;
    wire _2668;
    wire _2667;
    wire _2666;
    wire [2:0] _2665;
    reg _2673;
    wire _2663;
    wire _2662;
    wire _2660;
    wire _2661;
    wire _2659;
    wire _2658;
    wire _2657;
    wire [2:0] _2656;
    reg _2664;
    wire _2654;
    wire _2653;
    wire _2651;
    wire _2652;
    wire _2650;
    wire _2649;
    wire _2648;
    wire [2:0] _2647;
    reg _2655;
    wire _2645;
    wire _2644;
    wire _2642;
    wire _2643;
    wire _2641;
    wire _2640;
    wire _2639;
    wire [2:0] _2638;
    reg _2646;
    wire _2636;
    wire _2635;
    wire _2633;
    wire _2634;
    wire _2632;
    wire _2631;
    wire _2630;
    wire [2:0] _2629;
    reg _2637;
    wire _2627;
    wire _2626;
    wire _2624;
    wire _2625;
    wire _2623;
    wire _2622;
    wire [2:0] _4272;
    wire _4269;
    wire [1:0] _4270;
    wire [3:0] _4271;
    wire [6:0] _4273;
    wire [7:0] _4274;
    wire [7:0] _4275;
    wire _2608;
    wire _2607;
    wire _2606;
    wire _2604;
    wire _2605;
    wire _2602;
    wire _2603;
    wire _2599;
    wire _2600;
    wire _2601;
    wire _2596;
    wire _2597;
    wire _2598;
    wire _2593;
    wire _2592;
    wire _2594;
    wire _2591;
    wire _2595;
    wire [7:0] _2609;
    wire _2578;
    wire _2584;
    wire [7:0] _2610;
    wire [7:0] _4267;
    wire [7:0] _4263;
    wire [7:0] _4261;
    wire [7:0] _4260;
    wire [7:0] _4259;
    wire [7:0] _4258;
    reg [7:0] _4262;
    wire [7:0] _4264;
    wire [7:0] _4265;
    wire [7:0] _2565;
    wire [7:0] _2563;
    wire [7:0] _2562;
    wire [7:0] _2561;
    wire [7:0] _2560;
    reg [7:0] _2564;
    wire [7:0] _2566;
    wire [7:0] _4256;
    wire [7:0] _4257;
    wire [7:0] _4266;
    wire [7:0] _4268;
    wire [7:0] _4276;
    wire _2554;
    wire _2555;
    wire _2556;
    wire [7:0] _4277;
    wire [31:0] _105;
    wire [31:0] _4249;
    wire [31:0] _2810;
    wire [30:0] _2808;
    wire [31:0] _2809;
    wire [31:0] _2811;
    wire [30:0] _2805;
    wire [31:0] _2806;
    wire [30:0] _2798;
    wire [31:0] _2799;
    wire [31:0] _2801;
    wire [30:0] _2795;
    wire [31:0] _2796;
    wire [30:0] _2788;
    wire [31:0] _2789;
    wire [31:0] _2791;
    wire [30:0] _2785;
    wire [31:0] _2786;
    wire [30:0] _2778;
    wire [31:0] _2779;
    wire [31:0] _2781;
    wire [30:0] _2775;
    wire [31:0] _2776;
    wire [30:0] _2768;
    wire [31:0] _2769;
    wire [31:0] _2771;
    wire [30:0] _2765;
    wire [31:0] _2766;
    wire [30:0] _2758;
    wire [31:0] _2759;
    wire [31:0] _2761;
    wire [30:0] _2755;
    wire [31:0] _2756;
    wire [30:0] _2748;
    wire [31:0] _2749;
    wire [31:0] _2751;
    wire [30:0] _2745;
    wire [31:0] _2746;
    wire [30:0] _2738;
    wire [31:0] _2739;
    wire [31:0] _2741;
    wire [30:0] _2735;
    wire [31:0] _2736;
    wire [7:0] _2729;
    wire [7:0] _2728;
    wire [7:0] _2727;
    wire [7:0] _2726;
    wire [7:0] _2725;
    wire [7:0] _2724;
    wire [7:0] _2723;
    wire [7:0] _2722;
    wire [7:0] _2721;
    wire [7:0] _2720;
    wire [7:0] _2719;
    wire [7:0] _2718;
    wire [7:0] _2717;
    wire [7:0] _2716;
    wire [7:0] _2715;
    wire [7:0] _2714;
    wire [12:0] _2711;
    wire [12:0] _2712;
    wire [3:0] _2713;
    reg [7:0] _2730;
    wire [23:0] _2710;
    wire [31:0] _2731;
    wire _2708;
    wire _2709;
    wire [31:0] _2813;
    wire [31:0] _2703;
    wire [31:0] _2814;
    wire [31:0] _106;
    reg [31:0] _2701;
    wire [31:0] _2732;
    wire _2733;
    wire [31:0] _2742;
    wire _2743;
    wire [31:0] _2752;
    wire _2753;
    wire [31:0] _2762;
    wire _2763;
    wire [31:0] _2772;
    wire _2773;
    wire [31:0] _2782;
    wire _2783;
    wire [31:0] _2792;
    wire _2793;
    wire [31:0] _2802;
    wire _2803;
    wire [31:0] _2812;
    wire [31:0] _4250;
    wire f_sw_match;
    wire _4252;
    wire _4254;
    wire _4244;
    wire _4246;
    wire _4248;
    wire [12:0] _4237;
    wire f_sw_last;
    wire _4240;
    wire _108;
    wire _4234;
    wire _4235;
    wire _4236;
    wire _4242;
    wire _2697;
    wire [1:0] _4226;
    wire [1:0] _4222;
    wire [1:0] _1961;
    wire _4213;
    wire [1:0] _4215;
    wire _4212;
    wire [1:0] _4217;
    wire _4211;
    wire [1:0] _4219;
    wire [1:0] _4220;
    wire [7:0] _1695;
    wire _1697;
    wire _1688;
    wire [15:0] _1683;
    wire _1684;
    wire _1685;
    wire _1682;
    wire _1686;
    wire _1689;
    wire [3:0] _1679;
    wire _1681;
    wire _1690;
    wire _1677;
    wire _1673;
    wire _1674;
    wire _1671;
    wire _1675;
    wire _1678;
    wire _1669;
    reg [2:0] _1663;
    wire [15:0] _1664;
    wire _1665;
    wire _1659;
    wire _1666;
    wire _1657;
    wire _1667;
    wire _1670;
    wire [1:0] _1656;
    reg _1691;
    wire _1655;
    wire _1692;
    wire _1652;
    wire [3:0] _1650;
    reg _1651;
    wire _1653;
    wire [15:0] _1645;
    wire _1647;
    wire [16:0] _1640;
    wire [15:0] _1636;
    wire [16:0] _1637;
    wire [16:0] _1638;
    reg [16:0] _1641;
    wire _1642;
    wire _1643;
    wire [15:0] _1632;
    wire _1634;
    wire _1616;
    wire [2:0] _1618;
    wire _1613;
    wire [2:0] _1615;
    wire _1619;
    wire [2:0] _1620;
    wire _1608;
    wire [2:0] _1610;
    wire _1605;
    wire [2:0] _1607;
    wire _1611;
    wire [2:0] _1612;
    wire _1621;
    wire [2:0] _1622;
    wire _1598;
    wire [2:0] _1600;
    wire _1595;
    wire [2:0] _1597;
    wire _1601;
    wire [2:0] _1602;
    wire _1590;
    wire [2:0] _1592;
    wire [7:0] _1586;
    wire _1587;
    wire [2:0] _1589;
    wire _1593;
    wire [2:0] _1594;
    wire _1603;
    wire [2:0] _1604;
    wire _1623;
    wire [2:0] _1624;
    wire [13:0] _1585;
    wire [16:0] _1625;
    wire [111:0] _1582;
    wire [15:0] _1583;
    wire [16:0] _1584;
    wire [16:0] _1626;
    reg [16:0] _1629;
    wire [16:0] _1581;
    wire _1630;
    wire _1631;
    wire _1635;
    wire _1644;
    wire [1:0] _1577;
    reg [15:0] _1578;
    wire _1580;
    wire _1648;
    wire [7:0] _1571;
    wire _1573;
    wire _1574;
    wire _1570;
    wire _1575;
    wire [7:0] _1564;
    wire [7:0] _1562;
    wire [7:0] _1563;
    wire [7:0] _1565;
    wire _1567;
    wire _1568;
    wire _1576;
    wire _1649;
    wire _1654;
    wire _1693;
    wire _1694;
    wire _1698;
    wire f_fire3;
    wire [7:0] _1246;
    wire _1248;
    wire _1234;
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
    reg [2:0] _1209;
    wire [15:0] _1210;
    wire _1211;
    wire _1205;
    wire _1212;
    wire _1203;
    wire _1213;
    wire _1216;
    wire [1:0] _1202;
    reg _1237;
    wire _1201;
    wire _1238;
    wire _1193;
    wire [3:0] _1169;
    reg _1192;
    wire _1194;
    wire [15:0] _1164;
    wire _1166;
    wire [15:0] _1155;
    wire [16:0] _1156;
    wire [16:0] _1157;
    reg [16:0] _1160;
    wire _1161;
    wire _1162;
    wire [15:0] _1151;
    wire _1153;
    wire _1117;
    wire [2:0] _1137;
    wire _1096;
    wire [2:0] _1116;
    wire _1138;
    wire [2:0] _1139;
    wire _1073;
    wire [2:0] _1093;
    wire _1052;
    wire [2:0] _1072;
    wire _1094;
    wire [2:0] _1095;
    wire _1140;
    wire [2:0] _1141;
    wire _1027;
    wire [2:0] _1047;
    wire _1006;
    wire [2:0] _1026;
    wire _1048;
    wire [2:0] _1049;
    wire _983;
    wire [2:0] _1003;
    wire [7:0] _961;
    wire _962;
    wire [2:0] _982;
    wire _1004;
    wire [2:0] _1005;
    wire _1050;
    wire [2:0] _1051;
    wire _1142;
    wire [2:0] _1143;
    wire [16:0] _1144;
    wire [111:0] _957;
    wire [15:0] _958;
    wire [16:0] _959;
    wire [16:0] _1145;
    reg [16:0] _1148;
    wire [16:0] _939;
    wire _1149;
    wire _1150;
    wire _1154;
    wire _1163;
    wire [1:0] _926;
    reg [15:0] _936;
    wire _938;
    wire _1167;
    wire [7:0] _920;
    wire _922;
    wire _923;
    wire _911;
    wire _924;
    wire [7:0] _904;
    wire [7:0] _902;
    wire [7:0] _903;
    wire [7:0] _905;
    wire _907;
    wire [127:0] _885;
    wire [2:0] _4196;
    wire [2:0] _4192;
    wire _4187;
    wire [2:0] _4189;
    wire [7:0] _1952;
    wire _1954;
    wire _1955;
    wire _1950;
    wire _1951;
    wire f_unexp_now;
    wire _2818;
    wire _2819;
    wire _2821;
    wire _2822;
    wire _2817;
    wire _2815;
    wire _2823;
    wire _109;
    reg _1947;
    wire _1948;
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
    wire [7:0] _1556;
    wire _1558;
    wire _1549;
    wire _1545;
    wire _1546;
    wire _1543;
    wire _1547;
    wire _1550;
    wire [3:0] _1540;
    wire _1542;
    wire _1551;
    wire _1538;
    wire _1534;
    wire _1535;
    wire _1532;
    wire _1536;
    wire _1539;
    wire _1530;
    reg [2:0] _1524;
    wire [15:0] _1525;
    wire _1526;
    wire _1520;
    wire _1527;
    wire _1518;
    wire _1528;
    wire _1531;
    wire [1:0] _1517;
    reg _1552;
    wire _1516;
    wire _1553;
    wire _1513;
    wire [3:0] _1511;
    reg _1512;
    wire _1514;
    wire [15:0] _1506;
    wire _1508;
    wire [15:0] _1497;
    wire [16:0] _1498;
    wire [16:0] _1499;
    reg [16:0] _1502;
    wire _1503;
    wire _1504;
    wire [15:0] _1493;
    wire _1495;
    wire _1477;
    wire [2:0] _1479;
    wire _1474;
    wire [2:0] _1476;
    wire _1480;
    wire [2:0] _1481;
    wire _1469;
    wire [2:0] _1471;
    wire _1466;
    wire [2:0] _1468;
    wire _1472;
    wire [2:0] _1473;
    wire _1482;
    wire [2:0] _1483;
    wire _1459;
    wire [2:0] _1461;
    wire _1456;
    wire [2:0] _1458;
    wire _1462;
    wire [2:0] _1463;
    wire _1451;
    wire [2:0] _1453;
    wire [7:0] _1447;
    wire _1448;
    wire [2:0] _1450;
    wire _1454;
    wire [2:0] _1455;
    wire _1464;
    wire [2:0] _1465;
    wire _1484;
    wire [2:0] _1485;
    wire [16:0] _1486;
    wire [111:0] _1443;
    wire [15:0] _1444;
    wire [16:0] _1445;
    wire [16:0] _1487;
    reg [16:0] _1490;
    wire [16:0] _1442;
    wire _1491;
    wire _1492;
    wire _1496;
    wire _1505;
    wire [1:0] _1438;
    reg [15:0] _1439;
    wire _1441;
    wire _1509;
    wire [7:0] _1432;
    wire _1434;
    wire _1435;
    wire _1431;
    wire _1436;
    wire [7:0] _1425;
    wire [7:0] _1423;
    wire [7:0] _1424;
    wire [7:0] _1426;
    wire _1428;
    wire _1429;
    wire _1437;
    wire _1510;
    wire _1515;
    wire _1554;
    wire _1555;
    wire _1559;
    wire f_fire2;
    wire [1:0] _1704;
    wire _1281;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _1271;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _1265;
    wire [7:0] _1259;
    wire [7:0] f_chgmask0;
    wire [7:0] _1253;
    wire [7:0] f_watch;
    wire [7:0] _1254;
    wire [7:0] _1260;
    wire [7:0] _1266;
    wire [7:0] f_relevant;
    wire [7:0] _1273;
    wire _1275;
    wire _1276;
    wire f_amb_now;
    wire _1278;
    wire _1282;
    wire [7:0] _1244;
    wire [7:0] _2828;
    wire [7:0] _2829;
    wire _2825;
    wire [7:0] _2827;
    wire _2824;
    wire [7:0] _2830;
    wire [7:0] _2832;
    wire [7:0] _110;
    reg [7:0] _1243;
    wire [7:0] f_multi_eff;
    wire [7:0] _1417;
    wire _1419;
    wire _1410;
    wire _1406;
    wire _1407;
    wire _1404;
    wire _1408;
    wire _1411;
    wire [3:0] _1401;
    wire _1403;
    wire _1412;
    wire _1399;
    wire _1395;
    wire _1396;
    wire _1393;
    wire _1397;
    wire _1400;
    wire _1391;
    reg [2:0] _1385;
    wire [15:0] _1386;
    wire _1387;
    wire _1381;
    wire _1388;
    wire _1379;
    wire _1389;
    wire _1392;
    wire [1:0] _1378;
    reg _1413;
    wire [1:0] _112;
    wire [1:0] _2833;
    wire [1:0] _113;
    reg [1:0] _1198;
    wire _1200;
    wire _1377;
    wire _1414;
    wire _1374;
    wire _2837;
    wire _2835;
    wire _2838;
    wire _2840;
    wire _2842;
    wire _114;
    reg _654;
    wire [15:0] _116;
    wire [15:0] _118;
    wire [15:0] _2848;
    wire [15:0] _2849;
    wire _2851;
    wire _2853;
    wire _2854;
    wire _2855;
    wire _2856;
    wire _2858;
    wire _2860;
    wire _119;
    reg _651;
    wire _2873;
    wire _2874;
    wire _2876;
    wire _2877;
    wire _2878;
    wire _2879;
    wire _2881;
    wire _120;
    reg g_crc_bad;
    wire _2875;
    wire _2884;
    wire [5:0] _2882;
    wire _2883;
    wire _2885;
    wire _2886;
    wire _2887;
    wire _2888;
    wire _2889;
    wire _2891;
    wire _2893;
    wire _121;
    reg _648;
    wire _2897;
    wire _2895;
    wire _2898;
    wire _2900;
    wire _2902;
    wire _122;
    reg _666;
    wire [15:0] _124;
    wire [15:0] _126;
    wire [15:0] _2908;
    wire [15:0] _2909;
    wire _2911;
    wire _2913;
    wire _2914;
    wire _2915;
    wire _2916;
    wire _2918;
    wire _2920;
    wire _127;
    reg _663;
    wire _2933;
    wire _2934;
    wire _2936;
    wire _2937;
    wire _2938;
    wire _2939;
    wire _2941;
    wire _128;
    reg g_crc_bad_0;
    wire _2935;
    wire _2944;
    wire _2943;
    wire _2945;
    wire _2946;
    wire _2947;
    wire _2948;
    wire _2949;
    wire _2951;
    wire _2953;
    wire _129;
    reg _660;
    wire [7:0] _131;
    wire [6:0] _1190;
    wire [6:0] _1189;
    wire _1191;
    wire [15:0] _1186;
    wire _2958;
    wire _2957;
    wire _2959;
    wire _2956;
    wire _2960;
    wire _2955;
    wire _2961;
    wire [14:0] _2954;
    wire [15:0] _2962;
    wire [15:0] _132;
    reg [15:0] _1187;
    wire _1188;
    wire [3:0] _2975;
    wire [3:0] _2973;
    wire [3:0] _2976;
    wire _2470;
    wire _2479;
    wire _134;
    wire _2480;
    wire _2471;
    wire _2969;
    wire _2965;
    wire _2963;
    wire _2964;
    wire _2966;
    wire _2970;
    wire f_rx_push;
    wire _2472;
    wire _2971;
    wire [3:0] _2977;
    reg [3:0] _2980;
    wire [3:0] _136;
    wire _737;
    wire _1182;
    wire [6:0] _3889;
    wire [7:0] _3890;
    wire _3887;
    wire _3886;
    wire _3885;
    wire _3884;
    wire _3883;
    wire _3882;
    wire _3881;
    wire _3880;
    wire [7:0] _3888;
    wire [3:0] _3872;
    wire [3:0] _3870;
    wire [3:0] _3873;
    wire _739;
    wire _2996;
    wire _2993;
    wire _138;
    wire _2994;
    wire _733;
    wire [2:0] _727;
    wire _722;
    wire g_tx_bit;
    wire _723;
    wire _724;
    wire _725;
    wire [2:0] _728;
    wire _730;
    wire _731;
    wire _702;
    wire _732;
    wire _734;
    wire _698;
    wire [5:0] _689;
    wire _690;
    wire _691;
    wire [9:0] _685;
    wire _687;
    wire _688;
    wire _692;
    wire _3860;
    wire _3861;
    wire [1:0] _3864;
    wire _3853;
    wire _3854;
    wire _3855;
    wire _3856;
    wire [1:0] _3858;
    wire [2:0] _3839;
    wire [2:0] _3836;
    wire _3832;
    wire _3830;
    wire _3831;
    wire _3833;
    wire [2:0] _3837;
    wire _3828;
    wire [2:0] _3840;
    wire _3841;
    wire [2:0] _3822;
    wire _3818;
    wire _3816;
    wire _3817;
    wire _3819;
    wire [2:0] _3823;
    wire _3814;
    wire [2:0] _3825;
    wire _3826;
    wire _3842;
    wire _3843;
    wire _3844;
    wire _3810;
    wire [5:0] _3807;
    wire _3808;
    wire _3811;
    wire [15:0] _3803;
    wire _3804;
    wire _3801;
    wire _3805;
    wire _3799;
    wire _3800;
    wire _3806;
    wire _3812;
    wire _3845;
    wire [1:0] _3847;
    wire [1:0] _3849;
    wire [1:0] _3795;
    wire _3791;
    wire [1:0] _3793;
    wire [1:0] _3796;
    wire _3072;
    wire _3073;
    wire _139;
    reg _2983;
    wire _3717;
    wire _3715;
    wire _3716;
    reg _3718;
    wire [2:0] _141;
    wire [2:0] _3699;
    wire [2:0] _3700;
    wire [2:0] _3695;
    wire _3691;
    wire _3689;
    wire _3690;
    wire _3692;
    wire [2:0] _3696;
    wire _3687;
    wire [2:0] _3701;
    wire [2:0] _3702;
    wire [2:0] _3681;
    wire [2:0] _3682;
    wire [2:0] _3677;
    wire _3068;
    wire _3067;
    wire _3066;
    wire _3065;
    wire _3064;
    wire _3063;
    wire _3062;
    wire _3058;
    wire _3057;
    wire _3056;
    wire _3055;
    wire _3054;
    wire _3053;
    wire _3052;
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
    wire _3014;
    wire _3015;
    reg [7:0] _3016;
    wire _3008;
    wire _3009;
    reg [7:0] _3010;
    wire [2:0] _3075;
    wire [2:0] _3076;
    wire [2:0] _142;
    reg [2:0] _3000;
    wire _3002;
    wire _3003;
    wire [7:0] _3143;
    wire [7:0] _3144;
    wire [7:0] _3094;
    wire [7:0] _3092;
    wire [7:0] _3095;
    wire [7:0] _143;
    reg [7:0] _3081;
    wire [7:0] _3090;
    wire [7:0] _3091;
    wire [7:0] _3136;
    wire [7:0] _3103;
    wire [7:0] _3101;
    wire [7:0] _3104;
    wire [7:0] _144;
    reg [7:0] _3100;
    wire [6:0] _3121;
    wire [7:0] _3122;
    wire [6:0] _3119;
    wire _3117;
    wire _3116;
    wire _3115;
    wire _3114;
    wire _3113;
    wire _3112;
    wire _3111;
    wire _3110;
    wire [2:0] _3108;
    wire [2:0] _3107;
    wire [2:0] _3106;
    wire [2:0] _3105;
    reg [2:0] _3109;
    reg _3118;
    wire [7:0] _3120;
    reg [7:0] _3123;
    wire [7:0] _3124;
    wire [7:0] _145;
    reg [7:0] _1181;
    wire _3102;
    wire _3128;
    wire _3096;
    wire _3097;
    wire _3126;
    wire [1:0] _1712;
    wire [1:0] _1711;
    wire [1:0] _1710;
    wire [1:0] _1709;
    reg [1:0] _1713;
    wire [1:0] _1715;
    wire f_eng_push;
    wire _1718;
    wire _1724;
    wire _1721;
    wire _1722;
    wire _1720;
    wire _1723;
    wire _1725;
    wire _3129;
    wire _146;
    reg _870;
    wire [7:0] _3135;
    wire _3093;
    wire _3133;
    wire _833;
    wire [2:0] _827;
    wire _822;
    wire g_tx_bit_0;
    wire _823;
    wire _824;
    wire _825;
    wire [2:0] _828;
    wire _830;
    wire _831;
    wire _802;
    wire _832;
    wire _834;
    wire _798;
    wire _799;
    wire _835;
    wire _3077;
    wire _3078;
    wire _3131;
    wire _3134;
    wire _147;
    reg _768;
    wire _838;
    wire _837;
    wire _839;
    wire [7:0] _3137;
    wire [7:0] _3145;
    wire [7:0] _148;
    wire [7:0] _149;
    wire [7:0] _151;
    wire [7:0] _2990;
    reg [7:0] _3004;
    wire [2:0] _3521;
    wire _3518;
    wire _1812;
    wire _803;
    wire _3508;
    wire _3509;
    wire [1:0] _3512;
    wire _3501;
    wire _3502;
    wire _3503;
    wire _3504;
    wire [1:0] _3506;
    wire [2:0] _3487;
    wire [2:0] _3484;
    wire _3480;
    wire _3478;
    wire _3479;
    wire _3481;
    wire [2:0] _3485;
    wire _3476;
    wire [2:0] _3488;
    wire _3489;
    wire [2:0] _3470;
    wire _3466;
    wire _3464;
    wire _3465;
    wire _3467;
    wire [2:0] _3471;
    wire _3462;
    wire [2:0] _3473;
    wire _3474;
    wire _3490;
    wire _3491;
    wire _3492;
    wire _3458;
    wire _3456;
    wire _3459;
    wire [15:0] _3451;
    wire _3452;
    wire _3449;
    wire _3453;
    wire _3447;
    wire _3448;
    wire _3454;
    wire _3460;
    wire _3493;
    wire [1:0] _3495;
    wire [1:0] _3497;
    wire [1:0] _3443;
    wire _3439;
    wire [1:0] _3441;
    wire [1:0] _3444;
    wire _3173;
    wire _3174;
    wire _152;
    reg _3148;
    wire _3369;
    wire _3367;
    wire _3368;
    reg _3370;
    wire [2:0] _154;
    wire [2:0] _3351;
    wire [2:0] _3352;
    wire [2:0] _3347;
    wire _3343;
    wire _3341;
    wire _3342;
    wire _3344;
    wire [2:0] _3348;
    wire _3339;
    wire [2:0] _3353;
    wire [2:0] _3354;
    wire [2:0] _3333;
    wire [2:0] _3334;
    wire [2:0] _3329;
    wire _3169;
    wire _3168;
    wire _3167;
    wire _3166;
    wire _3165;
    wire _3164;
    wire _3163;
    wire _3159;
    wire _3158;
    wire _3157;
    wire _3156;
    wire _3155;
    wire _3154;
    wire _3153;
    wire [7:0] _3150;
    wire [6:0] _3087;
    wire [7:0] _3088;
    wire [6:0] _3085;
    wire [7:0] _3086;
    wire [7:0] _3089;
    wire [7:0] _3179;
    wire [7:0] _3180;
    wire [7:0] _3181;
    wire [7:0] _3182;
    wire [7:0] _3175;
    wire [7:0] _3176;
    wire [7:0] _3177;
    wire [7:0] _3178;
    wire [7:0] _3183;
    wire [7:0] _155;
    reg [7:0] g_byte;
    wire _1809;
    wire _1806;
    wire _1807;
    wire _1810;
    wire [7:0] _3151;
    wire _3152;
    wire [7:0] _3160;
    wire _157;
    wire [7:0] _3161;
    wire _3162;
    wire [2:0] _3191;
    wire [5:0] _789;
    wire _790;
    wire _791;
    wire [9:0] _785;
    wire _787;
    wire _788;
    wire _792;
    wire _793;
    wire [2:0] _3192;
    wire [2:0] _3193;
    wire [2:0] _3194;
    wire [2:0] _3195;
    wire [2:0] _3185;
    wire [2:0] _3186;
    wire [2:0] _3187;
    wire [2:0] _3188;
    wire [2:0] _3189;
    wire [2:0] _3196;
    wire [2:0] _3198;
    wire [2:0] _158;
    reg [2:0] g_bitpos;
    reg _3170;
    wire _160;
    wire [31:0] _162;
    wire [30:0] _3240;
    wire [31:0] _3242;
    wire _3234;
    wire _3235;
    wire [31:0] _3237;
    wire [30:0] _3231;
    wire [31:0] _3233;
    wire [31:0] _3238;
    wire [31:0] _3239;
    wire [5:0] _164;
    wire [5:0] _3208;
    wire [5:0] _3209;
    wire [5:0] _3210;
    wire [5:0] _3211;
    wire [5:0] _3202;
    wire [5:0] _3203;
    wire [5:0] _3204;
    wire [5:0] _3205;
    wire [5:0] _3206;
    wire [5:0] _3212;
    wire [5:0] _3213;
    wire [5:0] _3215;
    wire [5:0] _165;
    reg [5:0] g_left;
    wire _818;
    wire _819;
    wire _2865;
    wire _2864;
    wire _2866;
    wire _2867;
    wire [31:0] _3243;
    wire [31:0] _3244;
    wire [31:0] _3245;
    wire [31:0] _167;
    wire _3222;
    wire _3223;
    wire [31:0] _3225;
    wire [30:0] _3219;
    wire [31:0] _3221;
    wire [31:0] _3226;
    wire [30:0] _3216;
    wire [31:0] _3218;
    wire [31:0] _3227;
    wire [31:0] _3228;
    wire [31:0] _3229;
    wire [31:0] _3230;
    wire [31:0] _3246;
    wire [31:0] _3247;
    wire [31:0] _3249;
    wire [31:0] _168;
    reg [31:0] g_crc;
    wire _2871;
    wire _2872;
    wire [7:0] _3265;
    wire [7:0] _3266;
    wire [7:0] _169;
    reg [7:0] g_lim;
    wire [15:0] _781;
    wire [15:0] _171;
    wire [14:0] _2846;
    wire [15:0] _2847;
    wire [15:0] _3267;
    wire [15:0] _3268;
    wire [15:0] _3269;
    wire [15:0] _3271;
    wire [15:0] _172;
    reg [15:0] g_sr;
    wire [3:0] _3257;
    wire [3:0] _174;
    wire _3258;
    wire [3:0] _3259;
    wire [7:0] _3261;
    wire [5:0] _176;
    wire [7:0] _3255;
    wire [7:0] _3262;
    wire [15:0] _3263;
    wire _3264;
    wire _3290;
    wire [5:0] _178;
    wire [5:0] _3276;
    wire _3277;
    wire [9:0] _3272;
    wire _3274;
    wire _180;
    wire _3275;
    wire _3278;
    wire _3280;
    wire _3281;
    wire _3282;
    wire _3283;
    wire _3284;
    wire _3286;
    wire _3288;
    wire _181;
    reg g_len_cap;
    wire _3291;
    wire _3293;
    wire _182;
    reg g_len_known;
    wire [15:0] _782;
    wire [15:0] _3313;
    wire _770;
    wire _784;
    wire [15:0] _3314;
    wire _769;
    wire [15:0] _3315;
    wire _3296;
    wire _3294;
    wire _3295;
    wire _3297;
    wire _3299;
    wire _183;
    reg g_last;
    wire _632;
    wire _629;
    wire _633;
    wire _3301;
    wire _3302;
    wire _3303;
    wire _3305;
    wire _184;
    reg g_prev;
    wire _626;
    wire _623;
    wire _627;
    wire _634;
    wire _635;
    wire _636;
    wire [15:0] _3316;
    wire [15:0] _3307;
    wire [15:0] _3308;
    wire [15:0] _3309;
    wire [15:0] _3310;
    wire [15:0] _3311;
    wire [15:0] _3317;
    wire [15:0] _3319;
    wire [15:0] _185;
    reg [15:0] g_cnt;
    wire g_data_left;
    wire _3171;
    wire _3172;
    wire _3325;
    wire _3323;
    wire _3324;
    wire _3326;
    wire [2:0] _3330;
    wire _3321;
    wire [2:0] _3335;
    wire [2:0] _3336;
    wire [2:0] _3337;
    wire [2:0] _3355;
    wire [2:0] _3357;
    wire [2:0] _186;
    reg [2:0] g_run;
    wire _620;
    wire [1:0] _188;
    wire _615;
    wire _616;
    wire _621;
    wire _813;
    wire _820;
    wire _3371;
    wire _3372;
    wire _808;
    wire _806;
    wire _809;
    wire _810;
    wire _811;
    wire _3364;
    wire _3361;
    wire _3358;
    wire _3359;
    wire _3362;
    wire _3363;
    wire _3365;
    wire _3373;
    wire _3375;
    wire _3377;
    wire _3379;
    wire _3381;
    wire _189;
    reg f_lane1_out;
    wire _604;
    wire _605;
    wire _598;
    wire _599;
    wire _595;
    wire _191;
    wire _592;
    wire _593;
    wire _594;
    wire _596;
    wire _600;
    wire _601;
    wire _606;
    wire [1:0] _3446;
    wire _587;
    wire _588;
    reg _584;
    wire _585;
    wire _577;
    wire _576;
    wire _575;
    wire _574;
    wire _573;
    wire _572;
    wire _571;
    wire _570;
    wire [2:0] _193;
    reg _578;
    reg _581;
    wire _586;
    wire _195;
    wire _589;
    wire _568;
    wire _565;
    wire _558;
    wire _556;
    wire [13:0] _547;
    wire [15:0] _548;
    wire [14:0] _544;
    wire [15:0] _545;
    wire [15:0] _549;
    wire [14:0] _541;
    wire [15:0] _542;
    wire _539;
    wire [15:0] _550;
    reg [15:0] _553;
    wire _554;
    wire [13:0] _531;
    wire [15:0] _532;
    reg [15:0] _535;
    wire _3427;
    wire _3428;
    wire [15:0] _3429;
    wire [15:0] _3431;
    wire [15:0] _3433;
    wire _3411;
    wire [14:0] _560;
    wire [15:0] _561;
    reg [15:0] _564;
    wire [16:0] _3407;
    wire _3408;
    wire [16:0] _3401;
    reg [16:0] _3404;
    wire [16:0] _3396;
    wire [15:0] _197;
    wire [16:0] _3395;
    wire [16:0] _3397;
    reg [16:0] _3400;
    wire [7:0] _199;
    wire [8:0] _3415;
    wire [7:0] _3417;
    wire [7:0] _3418;
    wire [7:0] _3419;
    wire [7:0] _3421;
    wire [7:0] _200;
    reg [7:0] _3389;
    wire [8:0] _3414;
    wire [8:0] _3416;
    wire _3422;
    wire _3423;
    wire _3424;
    wire _3426;
    wire _201;
    reg _3394;
    wire [16:0] _3405;
    wire [16:0] _3391;
    wire _3406;
    wire _3409;
    wire _3412;
    wire _3390;
    wire _3413;
    wire [15:0] _3435;
    wire _3385;
    wire _3383;
    wire _645;
    wire _3382;
    wire _3384;
    wire _3386;
    wire [15:0] _3436;
    wire [15:0] _3438;
    wire [15:0] _202;
    reg [15:0] _529;
    wire _536;
    wire _537;
    wire _526;
    wire _538;
    wire _555;
    wire _557;
    wire _566;
    wire [1:0] _204;
    wire _522;
    wire _523;
    wire _520;
    wire _524;
    wire _517;
    reg _514;
    wire _507;
    wire _506;
    wire _505;
    wire _504;
    wire _503;
    wire _502;
    wire _501;
    wire _500;
    wire [2:0] _206;
    reg _508;
    reg _511;
    wire _515;
    wire _516;
    wire _518;
    wire _525;
    wire _569;
    wire _208;
    wire _590;
    wire _210;
    wire _499;
    wire _591;
    wire [1:0] _3498;
    wire _801;
    wire [1:0] _3500;
    wire _3200;
    wire [1:0] _3507;
    wire _493;
    wire [1:0] _3513;
    wire _490;
    wire _491;
    wire [1:0] _3515;
    wire [1:0] _211;
    reg [1:0] g_mode;
    wire _498;
    wire _804;
    wire _812;
    wire _1811;
    wire _1813;
    wire _1804;
    wire _1803;
    wire _1805;
    wire _1814;
    wire _1795;
    wire _1793;
    wire _1796;
    wire _3516;
    wire _3517;
    wire _212;
    wire _3519;
    wire [2:0] _3522;
    wire [2:0] _213;
    reg [2:0] _2989;
    reg [7:0] _3047;
    wire [7:0] _3049;
    wire [6:0] _3140;
    wire [7:0] _3141;
    wire [6:0] _3138;
    wire [7:0] _3139;
    wire [7:0] _3142;
    wire [7:0] _3527;
    wire [7:0] _3528;
    wire [7:0] _3529;
    wire [7:0] _3530;
    wire [7:0] _3523;
    wire [7:0] _3524;
    wire [7:0] _3525;
    wire [7:0] _3526;
    wire [7:0] _3531;
    wire [7:0] _214;
    reg [7:0] g_byte_0;
    wire _1801;
    wire _1798;
    wire _1799;
    wire _1802;
    wire [7:0] _3050;
    wire _3051;
    wire [7:0] _3059;
    wire _216;
    wire [7:0] _3060;
    wire _3061;
    wire [2:0] _3539;
    wire [2:0] _3540;
    wire [2:0] _3541;
    wire [2:0] _3542;
    wire [2:0] _3543;
    wire [2:0] _3533;
    wire [2:0] _3534;
    wire [2:0] _3535;
    wire [2:0] _3536;
    wire [2:0] _3537;
    wire [2:0] _3544;
    wire [2:0] _3546;
    wire [2:0] _217;
    reg [2:0] g_bitpos_0;
    reg _3069;
    wire _219;
    wire [31:0] _221;
    wire [30:0] _3588;
    wire [31:0] _3590;
    wire _3582;
    wire _3583;
    wire [31:0] _3585;
    wire [30:0] _3579;
    wire [31:0] _3581;
    wire [31:0] _3586;
    wire [31:0] _3587;
    wire [5:0] _223;
    wire [5:0] _3556;
    wire [5:0] _3557;
    wire [5:0] _3558;
    wire [5:0] _3559;
    wire [5:0] _3550;
    wire [5:0] _3551;
    wire [5:0] _3552;
    wire [5:0] _3553;
    wire [5:0] _3554;
    wire [5:0] _3560;
    wire [5:0] _3561;
    wire [5:0] _3563;
    wire [5:0] _224;
    reg [5:0] g_left_0;
    wire _718;
    wire _719;
    wire _2925;
    wire _2924;
    wire _2926;
    wire _2927;
    wire [31:0] _3591;
    wire [31:0] _3592;
    wire [31:0] _3593;
    wire [31:0] _226;
    wire _3570;
    wire _3571;
    wire [31:0] _3573;
    wire [30:0] _3567;
    wire [31:0] _3569;
    wire [31:0] _3574;
    wire [30:0] _3564;
    wire [31:0] _3566;
    wire [31:0] _3575;
    wire [31:0] _3576;
    wire [31:0] _3577;
    wire [31:0] _3578;
    wire [31:0] _3594;
    wire [31:0] _3595;
    wire [31:0] _3597;
    wire [31:0] _227;
    reg [31:0] g_crc_0;
    wire _2931;
    wire _2932;
    wire [7:0] _3613;
    wire [7:0] _3614;
    wire [7:0] _228;
    reg [7:0] g_lim_0;
    wire [15:0] _681;
    wire [15:0] _230;
    wire [14:0] _2906;
    wire [15:0] _2907;
    wire [15:0] _3615;
    wire [15:0] _3616;
    wire [15:0] _3617;
    wire [15:0] _3619;
    wire [15:0] _231;
    reg [15:0] g_sr_0;
    wire [3:0] _3605;
    wire [3:0] _233;
    wire _3606;
    wire [3:0] _3607;
    wire [7:0] _3609;
    wire [5:0] _235;
    wire [7:0] _3603;
    wire [7:0] _3610;
    wire [15:0] _3611;
    wire _3612;
    wire _3638;
    wire [5:0] _237;
    wire [5:0] _3624;
    wire _3625;
    wire [9:0] _3620;
    wire _3622;
    wire _239;
    wire _3623;
    wire _3626;
    wire _3628;
    wire _3629;
    wire _3630;
    wire _3631;
    wire _3632;
    wire _3634;
    wire _3636;
    wire _240;
    reg g_len_cap_0;
    wire _3639;
    wire _3641;
    wire _241;
    reg g_len_known_0;
    wire [15:0] _682;
    wire [15:0] _3661;
    wire [15:0] _3662;
    wire _669;
    wire [15:0] _3663;
    wire _3644;
    wire _3642;
    wire _3643;
    wire _3645;
    wire _3647;
    wire _242;
    reg g_last_0;
    wire _477;
    wire _473;
    wire _478;
    wire _3649;
    wire _3650;
    wire _3651;
    wire _3653;
    wire _243;
    reg g_prev_0;
    wire _470;
    wire _467;
    wire _471;
    wire _479;
    wire _480;
    wire _481;
    wire [15:0] _3664;
    wire [15:0] _3655;
    wire [15:0] _3656;
    wire [15:0] _3657;
    wire [15:0] _3658;
    wire [15:0] _3659;
    wire [15:0] _3665;
    wire [15:0] _3667;
    wire [15:0] _244;
    reg [15:0] g_cnt_0;
    wire g_data_left_0;
    wire _3070;
    wire _3071;
    wire _3673;
    wire _3671;
    wire _3672;
    wire _3674;
    wire [2:0] _3678;
    wire _3669;
    wire [2:0] _3683;
    wire [2:0] _3684;
    wire [2:0] _3685;
    wire [2:0] _3703;
    wire [2:0] _3705;
    wire [2:0] _245;
    reg [2:0] g_run_0;
    wire _464;
    wire [1:0] _247;
    wire _459;
    wire _460;
    wire _465;
    wire _713;
    wire _720;
    wire _3719;
    wire _703;
    wire _704;
    wire _712;
    wire _3720;
    wire _708;
    wire _706;
    wire _709;
    wire _710;
    wire _711;
    wire _3712;
    wire _3709;
    wire _3706;
    wire _3707;
    wire _3710;
    wire _3711;
    wire _3713;
    wire _3721;
    wire _3723;
    wire _3725;
    wire _3727;
    wire _3729;
    wire _248;
    reg f_lane0_out;
    wire _448;
    wire _449;
    wire _431;
    wire _432;
    reg _428;
    wire _429;
    wire _421;
    wire _420;
    wire _419;
    wire _418;
    wire _417;
    wire _416;
    wire _415;
    wire _414;
    wire [2:0] _250;
    reg _422;
    reg _425;
    wire _430;
    wire _252;
    wire _433;
    wire _412;
    wire _409;
    wire _402;
    wire _400;
    wire [13:0] _391;
    wire [15:0] _392;
    wire [14:0] _388;
    wire [15:0] _389;
    wire [15:0] _393;
    wire [14:0] _385;
    wire [15:0] _386;
    wire _383;
    wire [15:0] _394;
    reg [15:0] _397;
    wire _398;
    wire [13:0] _375;
    wire [15:0] _376;
    reg [15:0] _379;
    wire _3775;
    wire _3776;
    wire [15:0] _3777;
    wire [15:0] _3779;
    wire [15:0] _3781;
    wire _3759;
    wire [14:0] _404;
    wire [15:0] _405;
    reg [15:0] _408;
    wire [16:0] _3755;
    wire _3756;
    wire [16:0] _3749;
    reg [16:0] _3752;
    wire [15:0] _254;
    wire [16:0] _3743;
    wire [16:0] _3745;
    reg [16:0] _3748;
    wire [7:0] _256;
    wire [8:0] _3763;
    wire [7:0] _3765;
    wire [7:0] _3766;
    wire [7:0] _3767;
    wire [7:0] _3769;
    wire [7:0] _257;
    reg [7:0] _3737;
    wire [8:0] _3762;
    wire [8:0] _3764;
    wire _3770;
    wire _3771;
    wire _3772;
    wire _3774;
    wire _258;
    reg _3742;
    wire [16:0] _3753;
    wire [16:0] _3739;
    wire _3754;
    wire _3757;
    wire _3760;
    wire _3738;
    wire _3761;
    wire [15:0] _3783;
    wire _3733;
    wire _3731;
    wire _657;
    wire _3730;
    wire _3732;
    wire _3734;
    wire [15:0] _3784;
    wire [15:0] _3786;
    wire [15:0] _259;
    reg [15:0] _373;
    wire _380;
    wire _381;
    wire _370;
    wire _382;
    wire _399;
    wire _401;
    wire _410;
    wire _366;
    wire _367;
    wire _364;
    wire _368;
    wire _361;
    reg _358;
    wire _351;
    wire _350;
    wire _349;
    wire _348;
    wire _347;
    wire _346;
    wire _345;
    wire _344;
    wire [2:0] _261;
    reg _352;
    reg _355;
    wire _359;
    wire _360;
    wire _362;
    wire _369;
    wire _413;
    wire _434;
    wire [1:0] _263;
    wire _442;
    wire _443;
    wire _265;
    wire _439;
    wire _267;
    wire _269;
    wire _436;
    wire _437;
    wire _438;
    wire _440;
    wire _444;
    wire _445;
    wire _450;
    wire [1:0] _3798;
    wire [1:0] _3850;
    wire _701;
    wire [1:0] _3852;
    wire _3548;
    wire [1:0] _3859;
    wire _333;
    wire [1:0] _3865;
    wire [2:0] _2589;
    wire [2:0] _2588;
    wire [2:0] _2587;
    wire [2:0] _2586;
    reg [2:0] _2590;
    wire _2582;
    wire _2581;
    wire _2580;
    wire _2579;
    reg _2583;
    wire _3787;
    wire _3788;
    wire [2:0] _3790;
    wire [2:0] _270;
    wire _330;
    wire _331;
    wire [1:0] _3867;
    wire [1:0] _271;
    reg [1:0] g_mode_0;
    wire _339;
    wire _340;
    wire _435;
    wire _670;
    wire _684;
    wire _693;
    wire _699;
    wire _735;
    wire _2967;
    wire _273;
    wire _2968;
    wire _274;
    wire _2995;
    wire _2997;
    wire _3868;
    wire [3:0] _3874;
    reg [3:0] _3877;
    wire [3:0] _275;
    wire _1184;
    wire [7:0] _3879;
    wire [1:0] _1790;
    wire [1:0] _1788;
    wire [1:0] _1787;
    wire [1:0] _1786;
    wire [1:0] _1785;
    reg [1:0] _1789;
    wire [1:0] _1791;
    reg [7:0] _3891;
    wire [7:0] _3892;
    wire [7:0] _276;
    reg [7:0] _1177;
    wire _1178;
    wire [7:0] _3903;
    wire [7:0] _3902;
    wire [7:0] _3901;
    wire [1:0] _3898;
    wire [1:0] _3896;
    wire [1:0] _3895;
    wire [1:0] _3894;
    wire [1:0] _3893;
    reg [1:0] _3897;
    wire [1:0] _3899;
    reg [7:0] _3904;
    wire [7:0] _3905;
    wire [7:0] _277;
    reg [7:0] _1172;
    wire _1174;
    wire [3:0] _1372;
    reg _1373;
    wire _1375;
    wire [15:0] _1367;
    wire _1369;
    wire [15:0] _1358;
    wire [16:0] _1359;
    wire [16:0] _1360;
    reg [16:0] _1363;
    wire _1364;
    wire _1365;
    wire [15:0] _1354;
    wire _1356;
    wire [2:0] _1132;
    wire [2:0] _3920;
    wire _3916;
    wire _3917;
    wire _3914;
    wire _3918;
    wire [2:0] _3921;
    wire _3911;
    wire _3912;
    wire _3910;
    wire _3913;
    wire [2:0] _3923;
    wire _3907;
    wire [2:0] _3909;
    wire _3906;
    wire [2:0] _3924;
    wire [2:0] _278;
    reg [2:0] _1128;
    wire _1130;
    wire [2:0] _1133;
    wire _1123;
    wire _1124;
    wire _1122;
    wire _1125;
    wire [2:0] _1135;
    wire _1119;
    wire _1120;
    wire [2:0] _1136;
    wire _1338;
    wire [2:0] _1340;
    wire [2:0] _1111;
    wire [2:0] _3939;
    wire _3935;
    wire _3936;
    wire _3933;
    wire _3937;
    wire [2:0] _3940;
    wire _3930;
    wire _3931;
    wire _3929;
    wire _3932;
    wire [2:0] _3942;
    wire _3926;
    wire [2:0] _3928;
    wire _3925;
    wire [2:0] _3943;
    wire [2:0] _279;
    reg [2:0] _1107;
    wire _1109;
    wire [2:0] _1112;
    wire _1102;
    wire _1103;
    wire _1101;
    wire _1104;
    wire [2:0] _1114;
    wire _1098;
    wire _1099;
    wire [2:0] _1115;
    wire _1335;
    wire [2:0] _1337;
    wire _1341;
    wire [2:0] _1342;
    wire [2:0] _1088;
    wire [2:0] _3958;
    wire _3954;
    wire _3955;
    wire _3952;
    wire _3956;
    wire [2:0] _3959;
    wire _3949;
    wire _3950;
    wire _3948;
    wire _3951;
    wire [2:0] _3961;
    wire _3945;
    wire [2:0] _3947;
    wire _3944;
    wire [2:0] _3962;
    wire [2:0] _280;
    reg [2:0] _1084;
    wire _1086;
    wire [2:0] _1089;
    wire _1079;
    wire _1080;
    wire _1078;
    wire _1081;
    wire [2:0] _1091;
    wire _1075;
    wire _1076;
    wire [2:0] _1092;
    wire _1330;
    wire [2:0] _1332;
    wire [2:0] _1067;
    wire [2:0] _3977;
    wire _3973;
    wire _3974;
    wire _3971;
    wire _3975;
    wire [2:0] _3978;
    wire _3968;
    wire _3969;
    wire _3967;
    wire _3970;
    wire [2:0] _3980;
    wire _3964;
    wire [2:0] _3966;
    wire _3963;
    wire [2:0] _3981;
    wire [2:0] _281;
    reg [2:0] _1063;
    wire _1065;
    wire [2:0] _1068;
    wire _1058;
    wire _1059;
    wire _1057;
    wire _1060;
    wire [2:0] _1070;
    wire _1054;
    wire _1055;
    wire [2:0] _1071;
    wire _1327;
    wire [2:0] _1329;
    wire _1333;
    wire [2:0] _1334;
    wire _1343;
    wire [2:0] _1344;
    wire [2:0] _1042;
    wire [2:0] _3996;
    wire _3992;
    wire _3993;
    wire _3990;
    wire _3994;
    wire [2:0] _3997;
    wire _3987;
    wire _3988;
    wire _3986;
    wire _3989;
    wire [2:0] _3999;
    wire _3983;
    wire [2:0] _3985;
    wire _3982;
    wire [2:0] _4000;
    wire [2:0] _282;
    reg [2:0] _1038;
    wire _1040;
    wire [2:0] _1043;
    wire _1033;
    wire _1034;
    wire _1032;
    wire _1035;
    wire [2:0] _1045;
    wire _1029;
    wire _1030;
    wire [2:0] _1046;
    wire _1320;
    wire [2:0] _1322;
    wire [2:0] _1021;
    wire [2:0] _4015;
    wire _4011;
    wire _4012;
    wire _4009;
    wire _4013;
    wire [2:0] _4016;
    wire _4006;
    wire _4007;
    wire _4005;
    wire _4008;
    wire [2:0] _4018;
    wire _4002;
    wire [2:0] _4004;
    wire _4001;
    wire [2:0] _4019;
    wire [2:0] _283;
    reg [2:0] _1017;
    wire _1019;
    wire [2:0] _1022;
    wire _1012;
    wire _1013;
    wire _1011;
    wire _1014;
    wire [2:0] _1024;
    wire _1008;
    wire _1009;
    wire [2:0] _1025;
    wire _1317;
    wire [2:0] _1319;
    wire _1323;
    wire [2:0] _1324;
    wire [2:0] _998;
    wire [2:0] _4034;
    wire _4030;
    wire _4031;
    wire _4028;
    wire _4032;
    wire [2:0] _4035;
    wire _4025;
    wire _4026;
    wire _4024;
    wire _4027;
    wire [2:0] _4037;
    wire _4021;
    wire [2:0] _4023;
    wire _4020;
    wire [2:0] _4038;
    wire [2:0] _284;
    reg [2:0] _994;
    wire _996;
    wire [2:0] _999;
    wire _989;
    wire _990;
    wire _988;
    wire _991;
    wire [2:0] _1001;
    wire _985;
    wire _986;
    wire [2:0] _1002;
    wire _1312;
    wire [2:0] _1314;
    wire [2:0] _977;
    wire [2:0] _4053;
    wire _4049;
    wire _4050;
    wire _4047;
    wire _4051;
    wire [2:0] _4054;
    wire _4044;
    wire _4045;
    wire _4043;
    wire _4046;
    wire [2:0] _4056;
    wire _4040;
    wire [2:0] _4042;
    wire _4039;
    wire [2:0] _4057;
    wire [2:0] _285;
    reg [2:0] _973;
    wire _975;
    wire [2:0] _978;
    wire _968;
    wire _969;
    wire _967;
    wire _970;
    wire [2:0] _980;
    wire _964;
    wire _965;
    wire [2:0] _981;
    wire [7:0] _1308;
    wire _1309;
    wire [2:0] _1311;
    wire _1315;
    wire [2:0] _1316;
    wire _1325;
    wire [2:0] _1326;
    wire _1345;
    wire [2:0] _1346;
    wire [16:0] _1347;
    wire _4060;
    wire [127:0] _4061;
    wire _4058;
    wire [127:0] _4062;
    wire [127:0] _286;
    reg [127:0] _895;
    wire _953;
    wire _954;
    wire [127:0] _955;
    wire _4065;
    wire [127:0] _4066;
    wire _4063;
    wire [127:0] _4067;
    wire [127:0] _287;
    reg [127:0] _892;
    wire _949;
    wire _950;
    wire [127:0] _951;
    wire _4070;
    wire [127:0] _4071;
    wire _4068;
    wire [127:0] _4072;
    wire [127:0] _288;
    reg [127:0] _889;
    wire _945;
    wire _946;
    wire [127:0] _947;
    wire _4113;
    wire _4107;
    wire _290;
    wire _4106;
    wire f_store_we;
    wire [127:0] _292;
    reg [127:0] _4109[0:255];
    wire [1:0] _4103;
    wire [5:0] _294;
    wire [111:0] _1267;
    wire [5:0] _4085;
    wire [111:0] _1261;
    wire [5:0] _4084;
    wire [5:0] _4083;
    wire [5:0] _4082;
    reg [5:0] _4086;
    wire _4087;
    wire _4088;
    wire [5:0] _4089;
    wire [5:0] _296;
    wire [5:0] _4076;
    wire [5:0] _297;
    reg [5:0] _4075;
    wire [1:0] f_policy;
    wire _4079;
    wire [5:0] _4080;
    wire [5:0] _4081;
    wire [5:0] _4090;
    wire _4077;
    wire [5:0] _4091;
    wire [5:0] _4092;
    wire [5:0] _298;
    reg [5:0] _1764;
    wire [7:0] _4104;
    wire [12:0] _4096;
    wire [12:0] _4094;
    wire [12:0] _4097;
    wire [12:0] _299;
    reg [12:0] f_sw_cnt;
    wire [7:0] _4101;
    wire [7:0] _301;
    wire [7:0] _4102;
    wire _4099;
    wire _4100;
    wire [7:0] _4105;
    wire [127:0] _4110;
    reg [127:0] _4114;
    wire [127:0] _302;
    wire _941;
    wire _942;
    wire [127:0] _943;
    wire [511:0] _956;
    wire [111:0] _1304;
    wire [15:0] _1305;
    wire [16:0] _1306;
    wire [16:0] _1348;
    reg [16:0] _1351;
    wire gnd;
    wire [16:0] _1303;
    wire _1352;
    wire _1353;
    wire _1357;
    wire _1366;
    wire [15:0] _4142;
    wire _4138;
    wire _4139;
    wire _4140;
    wire [15:0] _4143;
    wire _4122;
    wire _4123;
    wire [15:0] _4145;
    wire [15:0] _4147;
    wire [15:0] _303;
    reg [15:0] _935;
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
    wire [8:0] _304;
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
    wire [15:0] _305;
    reg [15:0] _932;
    wire [1:0] _1299;
    reg [15:0] _1300;
    wire _1302;
    wire _1370;
    reg [7:0] _917;
    wire [7:0] f_chg_now;
    wire _4166;
    wire [7:0] _4168;
    wire _4165;
    wire [7:0] _4169;
    wire [7:0] _4171;
    wire [7:0] _306;
    reg [7:0] _914;
    wire [7:0] f_changed_all;
    wire [7:0] _1293;
    wire _1295;
    wire _1296;
    wire [7:0] f_chgmask1;
    wire _1292;
    wire _1297;
    wire [7:0] _1286;
    wire [7:0] _1284;
    wire vdd;
    wire _308;
    wire _310;
    wire [7:0] _312;
    reg [7:0] _343;
    reg [7:0] _901;
    wire [7:0] _1285;
    wire [7:0] _1287;
    wire _1289;
    wire [111:0] _1255;
    wire f_valid1;
    wire _1290;
    wire _1298;
    wire _1371;
    wire _1376;
    wire _1415;
    wire _1416;
    wire _1420;
    wire f_fire1;
    wire [1:0] _1706;
    wire [1:0] f_winner;
    reg [2:0] _4119;
    wire [2:0] _4121;
    wire _4172;
    wire _880;
    wire f_in_fetch;
    wire _881;
    wire _1701;
    wire _4173;
    wire [15:0] _4182;
    wire [15:0] _4184;
    wire [15:0] _313;
    reg [15:0] _929;
    wire [1:0] _1941;
    reg [15:0] _1942;
    wire [15:0] _1940;
    wire _1943;
    wire [63:0] _1250;
    wire _1938;
    wire _1936;
    wire _1937;
    wire _1939;
    wire _1944;
    wire _1949;
    wire _1957;
    wire f_viol_now;
    wire [2:0] _4190;
    wire [2:0] _4193;
    wire _4186;
    wire [2:0] _4194;
    wire _4185;
    wire [2:0] _4197;
    wire [2:0] _4199;
    wire [2:0] _314;
    reg [2:0] _878;
    wire _4202;
    wire [127:0] _4203;
    wire _4200;
    wire [127:0] _4204;
    wire [127:0] _315;
    reg [127:0] _886;
    wire [511:0] _896;
    wire [111:0] _897;
    wire f_valid0;
    wire _908;
    wire _925;
    wire _1168;
    wire _1195;
    wire _1239;
    wire f_in_eval;
    wire _1240;
    wire _1249;
    wire f_fire0;
    wire _1422;
    wire _1561;
    wire _1700;
    wire [1:0] _4223;
    wire _4208;
    wire [1:0] _4210;
    wire _4206;
    wire [1:0] _4224;
    wire _4205;
    wire [1:0] _4227;
    wire _317;
    wire [1:0] _4229;
    wire [1:0] _4231;
    wire [1:0] _318;
    reg [1:0] _873;
    wire _1833;
    wire _320;
    wire _2696;
    wire _2698;
    wire _4233;
    wire _4243;
    wire _321;
    reg f_sweeping;
    wire _4255;
    wire _322;
    reg f_image_valid;
    wire _324;
    wire _1893;
    wire [7:0] _4279;
    wire [7:0] _325;
    reg [7:0] f_pout;
    wire _2621;
    wire [23:0] _327;
    wire [2:0] _2617;
    reg _2628;
    wire [7:0] _2692;
    wire [7:0] _4281;
    assign _452 = 3'b000;
    assign _482 = 3'b001;
    assign _483 = _481 ? _482 : _457;
    assign _455 = 3'b100;
    assign _454 = 3'b010;
    assign _456 = f_lane0_out ? _455 : _454;
    assign _457 = _450 ? _456 : _453;
    assign _484 = _435 ? _483 : _457;
    assign _486 = _333 ? _452 : _484;
    assign _488 = _331 ? _452 : _486;
    assign _1 = _488;
    always @(posedge _310) begin
        if (_308)
            _453 <= _452;
        else
            _453 <= _1;
    end
    assign _667 = { _657,
                    _660,
                    _663,
                    _666,
                    gnd,
                    _453 };
    assign _638 = _636 ? _482 : _613;
    assign _612 = f_lane1_out ? _455 : _454;
    assign _613 = _606 ? _612 : _609;
    assign _639 = _591 ? _638 : _613;
    assign _641 = _493 ? _452 : _639;
    assign _643 = _491 ? _452 : _641;
    assign _2 = _643;
    always @(posedge _310) begin
        if (_308)
            _609 <= _452;
        else
            _609 <= _2;
    end
    assign _655 = { _645,
                    _648,
                    _651,
                    _654,
                    gnd,
                    _609 };
    assign _668 = { _655,
                    _667 };
    assign _755 = 8'b00000000;
    assign _761 = 8'b00000001;
    assign _762 = _756 + _761;
    assign _757 = 8'b11111111;
    assign _758 = _756 == _757;
    assign _759 = ~ _758;
    assign _751 = ~ _699;
    assign _748 = _728 == _452;
    assign _749 = ~ _748;
    assign _745 = _339 | _657;
    assign _742 = ~ _701;
    assign _743 = _331 & _742;
    assign _744 = _743 & _269;
    assign _746 = _744 & _745;
    assign _750 = _746 & _749;
    assign _752 = _750 & _751;
    assign _741 = _735 & _740;
    assign _753 = _741 | _752;
    assign _760 = _753 & _759;
    assign _763 = _760 ? _762 : _756;
    assign _765 = _9 ? _755 : _763;
    assign _4 = _765;
    always @(posedge _310) begin
        if (_308)
            _756 <= _755;
        else
            _756 <= _4;
    end
    assign _864 = _858 + _761;
    assign _860 = _858 == _757;
    assign _861 = ~ _860;
    assign _853 = ~ _799;
    assign _850 = _828 == _452;
    assign _851 = ~ _850;
    assign _847 = _498 | _645;
    assign _844 = ~ _801;
    assign _845 = _491 & _844;
    assign _846 = _845 & _210;
    assign _848 = _846 & _847;
    assign _852 = _848 & _851;
    assign _854 = _852 & _853;
    assign _740 = _273 ? _739 : _737;
    assign _842 = _839 & _740;
    assign _843 = _841 | _842;
    assign _855 = _843 | _854;
    assign _862 = _855 & _861;
    assign _865 = _862 ? _864 : _858;
    assign _867 = _9 ? _755 : _865;
    assign _5 = _867;
    always @(posedge _310) begin
        if (_308)
            _858 <= _755;
        else
            _858 <= _5;
    end
    assign _1738 = _1732 + _761;
    assign _1734 = _1732 == _757;
    assign _1735 = ~ _1734;
    assign _1728 = _1725 & _737;
    assign _1729 = _1727 | _1728;
    assign _1736 = _1729 & _1735;
    assign _1739 = _1736 ? _1738 : _1732;
    assign _1741 = _9 ? _755 : _1739;
    assign _6 = _1741;
    always @(posedge _310) begin
        if (_308)
            _1732 <= _755;
        else
            _1732 <= _6;
    end
    assign _1753 = _1747 + _761;
    assign _1749 = _1747 == _757;
    assign _1750 = ~ _1749;
    assign _1751 = _1744 & _1750;
    assign _1754 = _1751 ? _1753 : _1747;
    assign _1756 = _9 ? _755 : _1754;
    assign _7 = _1756;
    always @(posedge _310) begin
        if (_308)
            _1747 <= _755;
        else
            _1747 <= _7;
    end
    assign _1780 = _1774 + _761;
    assign _1776 = _1774 == _757;
    assign _1777 = ~ _1776;
    assign _1778 = _1771 & _1777;
    assign _1781 = _1778 ? _1780 : _1774;
    assign _9 = host_drop_clear;
    assign _1783 = _9 ? _755 : _1781;
    assign _10 = _1783;
    always @(posedge _310) begin
        if (_308)
            _1774 <= _755;
        else
            _1774 <= _10;
    end
    assign _1784 = { _1774,
                     _1747,
                     _1732,
                     _858,
                     _756 };
    assign _1817 = 1'b0;
    assign _1819 = 1'b1;
    assign _1797 = _1701 & _1796;
    assign _1815 = _1797 & _1814;
    assign _1820 = _1815 ? _1819 : _1818;
    assign _1822 = _24 ? _1817 : _1820;
    assign _12 = _1822;
    always @(posedge _310) begin
        if (_308)
            _1818 <= _1817;
        else
            _1818 <= _12;
    end
    assign _1831 = { _1829,
                     _1830 };
    assign _1886 = _1882 ? _1874 : _1885;
    assign _1888 = _24 ? _452 : _1886;
    assign _17 = _1888;
    always @(posedge _310) begin
        if (_308)
            _1885 <= _452;
        else
            _1885 <= _17;
    end
    assign _1881 = ~ _1880;
    assign _1871 = _1835 ? _482 : _454;
    assign _1867 = 3'b011;
    assign _1868 = _1851 ? _1867 : _455;
    assign _1872 = _1846 ? _1871 : _1868;
    assign _1864 = 3'b101;
    assign _1863 = 3'b110;
    assign _1865 = _1858 ? _1864 : _1863;
    assign _1873 = _1855 ? _1872 : _1865;
    assign _1859 = _138 & _273;
    assign _1856 = _290 | _47;
    assign _1857 = _1856 | _22;
    assign _1858 = f_sweeping & _1857;
    assign _1860 = _1858 | _1859;
    assign _1852 = ~ f_image_valid;
    assign _1853 = _324 & _1852;
    assign _1829 = _520 | _498;
    assign _1849 = _20[1:1];
    assign _1850 = _1849 & _1829;
    assign _1830 = _364 | _339;
    assign _20 = host_lane_we;
    assign _1847 = _20[0:0];
    assign _1848 = _1847 & _1830;
    assign _1851 = _1848 | _1850;
    assign _1854 = _1851 | _1853;
    assign _1843 = _1760 | _1842;
    assign _1839 = _47 & _1833;
    assign _1844 = _1839 & _1843;
    assign _1837 = ~ _1833;
    assign _22 = host_cov_re;
    assign _1836 = _47 | _22;
    assign _1838 = _1836 & _1837;
    assign _1845 = _1838 | _1844;
    assign _1834 = ~ _1833;
    assign _1835 = _290 & _1834;
    assign _1846 = _1835 | _1845;
    assign _1855 = _1846 | _1854;
    assign _1861 = _1855 | _1860;
    assign _1874 = _1861 ? _1873 : _452;
    assign _1876 = _1874 == _452;
    assign _1877 = ~ _1876;
    assign _1882 = _1877 & _1881;
    assign _1890 = _1882 ? _1819 : _1880;
    assign _24 = host_err_clear;
    assign _1892 = _24 ? _1817 : _1890;
    assign _25 = _1892;
    always @(posedge _310) begin
        if (_308)
            _1880 <= _1817;
        else
            _1880 <= _25;
    end
    assign _1769 = _1765 == _1768;
    assign _1770 = ~ _1769;
    assign _1761 = _1757 & _1760;
    assign _1771 = _1761 & _1770;
    assign _1898 = _1771 ? _1819 : _1896;
    assign _1900 = _1893 ? _1817 : _1898;
    assign _27 = _1900;
    always @(posedge _310) begin
        if (_308)
            _1896 <= _1817;
        else
            _1896 <= _27;
    end
    assign _1744 = _78 & _1743;
    assign _1905 = _1744 ? _1819 : _1903;
    assign _1907 = _1893 ? _1817 : _1905;
    assign _29 = _1907;
    always @(posedge _310) begin
        if (_308)
            _1903 <= _1817;
        else
            _1903 <= _29;
    end
    assign _1911 = _274 & _739;
    assign _1726 = ~ _1725;
    assign _1719 = _870 & _1718;
    assign _1727 = _1719 & _1726;
    assign _840 = ~ _839;
    assign _836 = _768 & _835;
    assign _841 = _836 & _840;
    assign _1908 = _841 | _1727;
    assign _31 = _1908;
    assign _1909 = f_rx_push & _737;
    assign _1910 = _1909 | _31;
    assign _1912 = _1910 | _1911;
    assign _1917 = _1912 ? _1819 : _1915;
    assign _1919 = _1893 ? _1817 : _1917;
    assign _32 = _1919;
    always @(posedge _310) begin
        if (_308)
            _1915 <= _1817;
        else
            _1915 <= _32;
    end
    assign _1923 = _1250[61:61];
    assign _1924 = _881 & _1923;
    assign _1929 = _1924 ? _1819 : _1927;
    assign _36 = host_irq_ack;
    assign _1931 = _36 ? _1817 : _1929;
    assign _1933 = _1893 ? _1817 : _1931;
    assign _37 = _1933;
    always @(posedge _310) begin
        if (_308)
            _1927 <= _1817;
        else
            _1927 <= _37;
    end
    assign _1962 = f_policy == _1961;
    assign _1964 = _1962 ? _1819 : _1922;
    assign _1960 = f_policy == _2539;
    assign _1966 = _1960 ? _1819 : _1964;
    assign _1967 = f_viol_now ? _1966 : _1922;
    assign _1968 = _1700 ? _1922 : _1967;
    assign _1935 = _873 == _2046;
    assign _1969 = _1935 ? _1968 : _1922;
    assign _1971 = _1893 ? _1817 : _1969;
    assign _38 = _1971;
    always @(posedge _310) begin
        if (_308)
            _1922 <= _1817;
        else
            _1922 <= _38;
    end
    assign _1986 = ~ _1985;
    assign _40 = host_tx_wm;
    assign _1979 = { gnd,
                     _40 };
    assign _1980 = _1979 < _275;
    assign _1981 = ~ _1980;
    assign _42 = host_tx_wm_en;
    assign _1982 = _42 & _1981;
    assign _44 = host_rx_wm;
    assign _1973 = _44 == _452;
    assign _1975 = _1973 ? _482 : _44;
    assign _1976 = { gnd,
                     _1975 };
    assign _1977 = _136 < _1976;
    assign _1978 = ~ _1977;
    assign _1983 = _1978 | _1982;
    assign _1987 = _1983 | _1986;
    assign _1988 = _1987 | _1922;
    assign _1989 = _1988 | _1927;
    assign _2091 = ~ f_host_cov_we;
    assign _2090 = ~ _1842;
    assign _2092 = _2090 & _2091;
    assign _2089 = 32'b00000000000000000000000000000000;
    assign _2083 = ~ f_sweeping;
    assign _2081 = ~ _1760;
    assign _2079 = ~ _1842;
    assign _47 = host_cov_we;
    assign _2078 = _47 & _1833;
    assign _2080 = _2078 & _2079;
    assign _2082 = _2080 & _2081;
    assign f_host_cov_we = _2082 & _2083;
    assign _2085 = _1842 | f_host_cov_we;
    assign _2072 = _64[11:0];
    assign _2069 = _2062 < _2059;
    assign _2070 = _2044 & _2069;
    assign _2071 = _2070 ? _2059 : _2062;
    assign _2073 = _2071 < _2072;
    assign _2074 = _2073 ? _2072 : _2071;
    assign _2075 = _2055 ? _2071 : _2074;
    assign _2061 = 12'b000000000000;
    assign _2022 = 12'b111111111111;
    assign _2019 = _2017[11:0];
    assign _2016 = 13'b0000000000000;
    assign _2013 = 10'b0000000000;
    assign _2014 = { _2013,
                     _2010 };
    assign _2015 = _2006 - _2014;
    always @* begin
        case (f_winner)
        0:
            _1990 <= _1209;
        1:
            _1990 <= _1385;
        2:
            _1990 <= _1524;
        default:
            _1990 <= _1663;
        endcase
    end
    assign _48 = _1990;
    always @(posedge _310) begin
        if (_308)
            _2010 <= _452;
        else
            _2010 <= _48;
    end
    assign _2011 = { _2013,
                     _2010 };
    assign _1996 = 13'b1111111111111;
    assign _1995 = _1993[12:0];
    assign _1991 = 16'b0001111111111111;
    assign _1994 = _1991 < _1993;
    assign _1997 = _1994 ? _1996 : _1995;
    assign _49 = _1997;
    always @(posedge _310) begin
        if (_308)
            _2006 <= _2016;
        else
            _2006 <= _49;
    end
    assign _2012 = _2006 < _2011;
    assign _2017 = _2012 ? _2016 : _2015;
    assign _2003 = 13'b0111111111111;
    assign _2018 = _2003 < _2017;
    assign _2021 = _2018 ? _2022 : _2019;
    assign _1998 = 16'b1111111111111111;
    assign _1999 = _1993 == _1998;
    assign _50 = _1999;
    always @(posedge _310) begin
        if (_308)
            _2002 <= _1817;
        else
            _2002 <= _50;
    end
    assign _2023 = _2002 ? _2022 : _2021;
    assign _51 = _2023;
    always @(posedge _310) begin
        if (_308)
            _2062 <= _2061;
        else
            _2062 <= _51;
    end
    assign _2026 = _1993[11:0];
    always @* begin
        case (f_winner)
        0:
            _1992 <= _926;
        1:
            _1992 <= _1299;
        2:
            _1992 <= _1438;
        default:
            _1992 <= _1577;
        endcase
    end
    always @* begin
        case (_1992)
        0:
            _1993 <= _929;
        1:
            _1993 <= _932;
        2:
            _1993 <= _935;
        default:
            _1993 <= _935;
        endcase
    end
    assign _2024 = 16'b0000111111111111;
    assign _2025 = _2024 < _1993;
    assign _2028 = _2025 ? _2022 : _2026;
    assign _52 = _2028;
    always @(posedge _310) begin
        if (_308)
            _2059 <= _2061;
        else
            _2059 <= _52;
    end
    assign _2063 = _2059 < _2062;
    assign _2064 = _2044 & _2063;
    assign _2065 = _2064 ? _2059 : _2062;
    assign _2056 = _64[23:12];
    assign _2066 = _2056 < _2065;
    assign _2067 = _2066 ? _2056 : _2065;
    assign _2055 = _2039 == _755;
    assign _2068 = _2055 ? _2065 : _2067;
    assign _2051 = _2049[7:0];
    assign _2046 = 2'b10;
    assign _2045 = 2'b01;
    assign _2030 = _1765 == _1768;
    assign _2029 = _1757 & _1760;
    assign _2031 = _2029 & _2030;
    assign _53 = _2031;
    always @(posedge _310) begin
        if (_308)
            _2044 <= _1817;
        else
            _2044 <= _53;
    end
    assign _2047 = _2044 ? _2046 : _2045;
    assign _2041 = 7'b0000000;
    assign _2048 = { _2041,
                     _2047 };
    assign _2039 = _64[31:24];
    assign _2040 = { gnd,
                     _2039 };
    assign _2049 = _2040 + _2048;
    assign _2050 = _2049[8:8];
    assign _2053 = _2050 ? _757 : _2051;
    assign _2076 = { _2053,
                     _2068,
                     _2075 };
    assign _55 = host_cov_wdata;
    assign _2077 = _1842 ? _2076 : _55;
    always @(posedge _310) begin
        if (_2085)
            _2086[_2038] <= _2077;
    end
    assign _56 = _1768;
    always @(posedge _310) begin
        if (_308)
            _2037 <= _755;
        else
            _2037 <= _56;
    end
    assign _1765 = { _1764,
                     f_winner };
    assign _57 = _1765;
    always @(posedge _310) begin
        if (_308)
            _1768 <= _755;
        else
            _1768 <= _57;
    end
    assign _59 = host_cov_addr;
    assign _2034 = _1760 ? _1768 : _59;
    assign _2032 = ~ _1760;
    assign _61 = host_cover_en;
    assign _1757 = _1700 & _61;
    assign _2033 = _1757 & _2032;
    assign _62 = _2033;
    always @(posedge _310) begin
        if (_308)
            _1760 <= _1817;
        else
            _1760 <= _62;
    end
    assign _63 = _1760;
    always @(posedge _310) begin
        if (_308)
            _1842 <= _1817;
        else
            _1842 <= _63;
    end
    assign _2038 = _1842 ? _2037 : _2034;
    assign _2087 = _2086[_2038];
    always @(posedge _310) begin
        if (_2092)
            _2093 <= _2087;
    end
    assign _64 = _2093;
    assign _2094 = ~ f_sweeping;
    assign _2095 = _1833 & _2094;
    assign _2097 = _2095 ? _64 : _2089;
    assign _2464 = 3'b111;
    assign _2465 = _2102 == _2464;
    assign _2466 = _2099 & _2465;
    assign _2463 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _310) begin
        if (_308)
            _2467 <= _2463;
        else
            if (_2466)
                _2467 <= _77;
    end
    assign _2459 = _2102 == _1863;
    assign _2460 = _2099 & _2459;
    always @(posedge _310) begin
        if (_308)
            _2461 <= _2463;
        else
            if (_2460)
                _2461 <= _77;
    end
    assign _2453 = _2102 == _1864;
    assign _2454 = _2099 & _2453;
    always @(posedge _310) begin
        if (_308)
            _2455 <= _2463;
        else
            if (_2454)
                _2455 <= _77;
    end
    assign _2447 = _2102 == _455;
    assign _2448 = _2099 & _2447;
    always @(posedge _310) begin
        if (_308)
            _2449 <= _2463;
        else
            if (_2448)
                _2449 <= _77;
    end
    assign _2441 = _2102 == _1867;
    assign _2442 = _2099 & _2441;
    always @(posedge _310) begin
        if (_308)
            _2443 <= _2463;
        else
            if (_2442)
                _2443 <= _77;
    end
    assign _2435 = _2102 == _454;
    assign _2436 = _2099 & _2435;
    always @(posedge _310) begin
        if (_308)
            _2437 <= _2463;
        else
            if (_2436)
                _2437 <= _77;
    end
    assign _2429 = _2102 == _482;
    assign _2430 = _2099 & _2429;
    always @(posedge _310) begin
        if (_308)
            _2431 <= _2463;
        else
            if (_2430)
                _2431 <= _77;
    end
    assign _2104 = _2102 + _482;
    assign _2105 = _2099 ? _2104 : _2102;
    assign _67 = _2105;
    always @(posedge _310) begin
        if (_308)
            _2102 <= _452;
        else
            _2102 <= _67;
    end
    assign _2423 = _2102 == _452;
    assign _2424 = _2099 & _2423;
    assign _2396 = _2287 - _2392;
    assign _2113 = 29'b11111111111111111111111111111;
    assign _2112 = 29'b00000000000000000000000000000;
    assign _2115 = 29'b00000000000000000000000000001;
    assign _2116 = ts_hi_m1 + _2115;
    assign _2109 = ts_reg[2:0];
    assign _2111 = _2109 == _2464;
    assign _2117 = _2111 ? _2116 : ts_hi_m1;
    assign _68 = _2117;
    always @(posedge _310) begin
        if (_308)
            ts_hi_m1 <= _2113;
        else
            ts_hi_m1 <= _68;
    end
    assign _2394 = ts_reg[31:3];
    assign _2135 = _2122 + _482;
    assign _2131 = _2122 == _2464;
    assign _2132 = ~ _2131;
    assign _2129 = _1243[0:0];
    assign _2133 = _2129 & _2132;
    assign _2136 = _2133 ? _2135 : _2122;
    assign _2126 = _1243[0:0];
    assign _2127 = ~ _2126;
    assign _2124 = _914[0:0];
    assign _2123 = f_chg_now[0:0];
    assign _2125 = _2123 & _2124;
    assign _2128 = _2125 & _2127;
    assign _2138 = _2128 ? _482 : _2136;
    assign _2119 = _873 == _2045;
    assign _2139 = _2119 ? _2138 : _2122;
    assign _69 = _2139;
    always @(posedge _310) begin
        if (_308)
            _2122 <= _452;
        else
            _2122 <= _69;
    end
    assign _2385 = _1243[0:0];
    assign _2387 = _2385 ? _2122 : _452;
    assign _2156 = _2143 + _482;
    assign _2152 = _2143 == _2464;
    assign _2153 = ~ _2152;
    assign _2150 = _1243[1:1];
    assign _2154 = _2150 & _2153;
    assign _2157 = _2154 ? _2156 : _2143;
    assign _2147 = _1243[1:1];
    assign _2148 = ~ _2147;
    assign _2145 = _914[1:1];
    assign _2144 = f_chg_now[1:1];
    assign _2146 = _2144 & _2145;
    assign _2149 = _2146 & _2148;
    assign _2159 = _2149 ? _482 : _2157;
    assign _2140 = _873 == _2045;
    assign _2160 = _2140 ? _2159 : _2143;
    assign _70 = _2160;
    always @(posedge _310) begin
        if (_308)
            _2143 <= _452;
        else
            _2143 <= _70;
    end
    assign _2382 = _1243[1:1];
    assign _2384 = _2382 ? _2143 : _452;
    assign _2388 = _2344 ? _2387 : _2384;
    assign _2177 = _2164 + _482;
    assign _2173 = _2164 == _2464;
    assign _2174 = ~ _2173;
    assign _2171 = _1243[2:2];
    assign _2175 = _2171 & _2174;
    assign _2178 = _2175 ? _2177 : _2164;
    assign _2168 = _1243[2:2];
    assign _2169 = ~ _2168;
    assign _2166 = _914[2:2];
    assign _2165 = f_chg_now[2:2];
    assign _2167 = _2165 & _2166;
    assign _2170 = _2167 & _2169;
    assign _2180 = _2170 ? _482 : _2178;
    assign _2161 = _873 == _2045;
    assign _2181 = _2161 ? _2180 : _2164;
    assign _71 = _2181;
    always @(posedge _310) begin
        if (_308)
            _2164 <= _452;
        else
            _2164 <= _71;
    end
    assign _2378 = _1243[2:2];
    assign _2380 = _2378 ? _2164 : _452;
    assign _2198 = _2185 + _482;
    assign _2194 = _2185 == _2464;
    assign _2195 = ~ _2194;
    assign _2192 = _1243[3:3];
    assign _2196 = _2192 & _2195;
    assign _2199 = _2196 ? _2198 : _2185;
    assign _2189 = _1243[3:3];
    assign _2190 = ~ _2189;
    assign _2187 = _914[3:3];
    assign _2186 = f_chg_now[3:3];
    assign _2188 = _2186 & _2187;
    assign _2191 = _2188 & _2190;
    assign _2201 = _2191 ? _482 : _2199;
    assign _2182 = _873 == _2045;
    assign _2202 = _2182 ? _2201 : _2185;
    assign _72 = _2202;
    always @(posedge _310) begin
        if (_308)
            _2185 <= _452;
        else
            _2185 <= _72;
    end
    assign _2375 = _1243[3:3];
    assign _2377 = _2375 ? _2185 : _452;
    assign _2381 = _2347 ? _2380 : _2377;
    assign _2389 = _2346 ? _2388 : _2381;
    assign _2219 = _2206 + _482;
    assign _2215 = _2206 == _2464;
    assign _2216 = ~ _2215;
    assign _2213 = _1243[4:4];
    assign _2217 = _2213 & _2216;
    assign _2220 = _2217 ? _2219 : _2206;
    assign _2210 = _1243[4:4];
    assign _2211 = ~ _2210;
    assign _2208 = _914[4:4];
    assign _2207 = f_chg_now[4:4];
    assign _2209 = _2207 & _2208;
    assign _2212 = _2209 & _2211;
    assign _2222 = _2212 ? _482 : _2220;
    assign _2203 = _873 == _2045;
    assign _2223 = _2203 ? _2222 : _2206;
    assign _73 = _2223;
    always @(posedge _310) begin
        if (_308)
            _2206 <= _452;
        else
            _2206 <= _73;
    end
    assign _2370 = _1243[4:4];
    assign _2372 = _2370 ? _2206 : _452;
    assign _2240 = _2227 + _482;
    assign _2236 = _2227 == _2464;
    assign _2237 = ~ _2236;
    assign _2234 = _1243[5:5];
    assign _2238 = _2234 & _2237;
    assign _2241 = _2238 ? _2240 : _2227;
    assign _2231 = _1243[5:5];
    assign _2232 = ~ _2231;
    assign _2229 = _914[5:5];
    assign _2228 = f_chg_now[5:5];
    assign _2230 = _2228 & _2229;
    assign _2233 = _2230 & _2232;
    assign _2243 = _2233 ? _482 : _2241;
    assign _2224 = _873 == _2045;
    assign _2244 = _2224 ? _2243 : _2227;
    assign _74 = _2244;
    always @(posedge _310) begin
        if (_308)
            _2227 <= _452;
        else
            _2227 <= _74;
    end
    assign _2367 = _1243[5:5];
    assign _2369 = _2367 ? _2227 : _452;
    assign _2373 = _2351 ? _2372 : _2369;
    assign _2261 = _2248 + _482;
    assign _2257 = _2248 == _2464;
    assign _2258 = ~ _2257;
    assign _2255 = _1243[6:6];
    assign _2259 = _2255 & _2258;
    assign _2262 = _2259 ? _2261 : _2248;
    assign _2252 = _1243[6:6];
    assign _2253 = ~ _2252;
    assign _2250 = _914[6:6];
    assign _2249 = f_chg_now[6:6];
    assign _2251 = _2249 & _2250;
    assign _2254 = _2251 & _2253;
    assign _2264 = _2254 ? _482 : _2262;
    assign _2245 = _873 == _2045;
    assign _2265 = _2245 ? _2264 : _2248;
    assign _75 = _2265;
    always @(posedge _310) begin
        if (_308)
            _2248 <= _452;
        else
            _2248 <= _75;
    end
    assign _2363 = _1243[6:6];
    assign _2365 = _2363 ? _2248 : _452;
    assign _2282 = _2269 + _482;
    assign _2278 = _2269 == _2464;
    assign _2279 = ~ _2278;
    assign _2276 = _1243[7:7];
    assign _2280 = _2276 & _2279;
    assign _2283 = _2280 ? _2282 : _2269;
    assign _2273 = _1243[7:7];
    assign _2274 = ~ _2273;
    assign _2271 = _914[7:7];
    assign _2270 = f_chg_now[7:7];
    assign _2272 = _2270 & _2271;
    assign _2275 = _2272 & _2274;
    assign _2285 = _2275 ? _482 : _2283;
    assign _2266 = _873 == _2045;
    assign _2286 = _2266 ? _2285 : _2269;
    assign _76 = _2286;
    always @(posedge _310) begin
        if (_308)
            _2269 <= _452;
        else
            _2269 <= _76;
    end
    assign _2360 = _1243[7:7];
    assign _2362 = _2360 ? _2269 : _452;
    assign _2366 = _2354 ? _2365 : _2362;
    assign _2374 = _2353 ? _2373 : _2366;
    assign _2390 = _2350 ? _2389 : _2374;
    assign _2355 = _1273[7:7];
    assign _2354 = _1273[6:6];
    assign _2356 = _2354 | _2355;
    assign _2352 = _1273[5:5];
    assign _2351 = _1273[4:4];
    assign _2353 = _2351 | _2352;
    assign _2357 = _2353 | _2356;
    assign _2348 = _1273[3:3];
    assign _2347 = _1273[2:2];
    assign _2349 = _2347 | _2348;
    assign _2345 = _1273[1:1];
    assign _2344 = _1273[0:0];
    assign _2346 = _2344 | _2345;
    assign _2350 = _2346 | _2349;
    assign _2358 = _2350 | _2357;
    assign _2391 = _2358 ? _2390 : _452;
    assign _2333 = f_watch[0:0];
    assign _2332 = _914[0:0];
    assign _2334 = _2332 & _2333;
    assign _2336 = _2334 ? _1128 : _452;
    assign _2328 = f_watch[1:1];
    assign _2327 = _914[1:1];
    assign _2329 = _2327 & _2328;
    assign _2331 = _2329 ? _1107 : _452;
    assign _2337 = _2331 < _2336;
    assign _2338 = _2337 ? _2336 : _2331;
    assign _2321 = f_watch[2:2];
    assign _2320 = _914[2:2];
    assign _2322 = _2320 & _2321;
    assign _2324 = _2322 ? _1084 : _452;
    assign _2316 = f_watch[3:3];
    assign _2315 = _914[3:3];
    assign _2317 = _2315 & _2316;
    assign _2319 = _2317 ? _1063 : _452;
    assign _2325 = _2319 < _2324;
    assign _2326 = _2325 ? _2324 : _2319;
    assign _2339 = _2326 < _2338;
    assign _2340 = _2339 ? _2338 : _2326;
    assign _2307 = f_watch[4:4];
    assign _2306 = _914[4:4];
    assign _2308 = _2306 & _2307;
    assign _2310 = _2308 ? _1038 : _452;
    assign _2302 = f_watch[5:5];
    assign _2301 = _914[5:5];
    assign _2303 = _2301 & _2302;
    assign _2305 = _2303 ? _1017 : _452;
    assign _2311 = _2305 < _2310;
    assign _2312 = _2311 ? _2310 : _2305;
    assign _2295 = f_watch[6:6];
    assign _2294 = _914[6:6];
    assign _2296 = _2294 & _2295;
    assign _2298 = _2296 ? _994 : _452;
    assign _2290 = f_watch[7:7];
    assign _2289 = _914[7:7];
    assign _2291 = _2289 & _2290;
    assign _2293 = _2291 ? _973 : _452;
    assign _2299 = _2293 < _2298;
    assign _2300 = _2299 ? _2298 : _2293;
    assign _2313 = _2300 < _2312;
    assign _2314 = _2313 ? _2312 : _2300;
    assign _2341 = _2314 < _2340;
    assign _2342 = _2341 ? _2340 : _2314;
    assign _2343 = f_unexp_now ? _2342 : _452;
    assign _2392 = f_amb_now ? _2391 : _2343;
    assign _2287 = ts_reg[2:0];
    assign _2393 = _2287 < _2392;
    assign _2395 = _2393 ? ts_hi_m1 : _2394;
    assign _2397 = { _2395,
                     _2396 };
    assign _2401 = { _2397,
                     _1764,
                     _2400,
                     _901 };
    assign _77 = _2401;
    always @(posedge _310) begin
        if (_308)
            _2425 <= _2463;
        else
            if (_2424)
                _2425 <= _77;
    end
    assign _2418 = _2416 + _482;
    assign _1984 = 4'b0000;
    assign _2407 = 4'b0001;
    assign _2408 = _79 + _2407;
    assign _2406 = _79 - _2407;
    assign _2409 = _2099 ? _2408 : _2406;
    assign _1742 = 4'b1000;
    assign _1743 = _79 == _1742;
    assign _2098 = ~ _1743;
    assign _78 = f_viol_now;
    assign _2099 = _78 & _2098;
    assign _2404 = _2099 ^ _2403;
    assign _2410 = _2404 ? _2409 : _79;
    always @(posedge _310) begin
        if (_308)
            _2413 <= _1984;
        else
            _2413 <= _2410;
    end
    assign _79 = _2413;
    assign _1985 = _79 == _1984;
    assign _2402 = ~ _1985;
    assign _81 = host_vlog_pop;
    assign _2403 = _81 & _2402;
    assign _2419 = _2403 ? _2418 : _2416;
    assign _82 = _2419;
    always @(posedge _310) begin
        if (_308)
            _2416 <= _452;
        else
            _2416 <= _82;
    end
    always @* begin
        case (_2416)
        0:
            _2468 <= _2425;
        1:
            _2468 <= _2431;
        2:
            _2468 <= _2437;
        3:
            _2468 <= _2443;
        4:
            _2468 <= _2449;
        5:
            _2468 <= _2455;
        6:
            _2468 <= _2461;
        default:
            _2468 <= _2467;
        endcase
    end
    assign _2532 = _2475 == _2464;
    assign _2533 = _2472 & _2532;
    always @(posedge _310) begin
        if (_308)
            _2534 <= _755;
        else
            if (_2533)
                _2534 <= _148;
    end
    assign _2526 = _2475 == _1863;
    assign _2527 = _2472 & _2526;
    always @(posedge _310) begin
        if (_308)
            _2528 <= _755;
        else
            if (_2527)
                _2528 <= _148;
    end
    assign _2520 = _2475 == _1864;
    assign _2521 = _2472 & _2520;
    always @(posedge _310) begin
        if (_308)
            _2522 <= _755;
        else
            if (_2521)
                _2522 <= _148;
    end
    assign _2514 = _2475 == _455;
    assign _2515 = _2472 & _2514;
    always @(posedge _310) begin
        if (_308)
            _2516 <= _755;
        else
            if (_2515)
                _2516 <= _148;
    end
    assign _2508 = _2475 == _1867;
    assign _2509 = _2472 & _2508;
    always @(posedge _310) begin
        if (_308)
            _2510 <= _755;
        else
            if (_2509)
                _2510 <= _148;
    end
    assign _2502 = _2475 == _454;
    assign _2503 = _2472 & _2502;
    always @(posedge _310) begin
        if (_308)
            _2504 <= _755;
        else
            if (_2503)
                _2504 <= _148;
    end
    assign _2496 = _2475 == _482;
    assign _2497 = _2472 & _2496;
    always @(posedge _310) begin
        if (_308)
            _2498 <= _755;
        else
            if (_2497)
                _2498 <= _148;
    end
    assign _2477 = _2475 + _482;
    assign _2478 = _2472 ? _2477 : _2475;
    assign _85 = _2478;
    always @(posedge _310) begin
        if (_308)
            _2475 <= _452;
        else
            _2475 <= _85;
    end
    assign _2490 = _2475 == _452;
    assign _2491 = _2472 & _2490;
    always @(posedge _310) begin
        if (_308)
            _2492 <= _755;
        else
            if (_2491)
                _2492 <= _148;
    end
    assign _2485 = _2483 + _482;
    assign _2486 = _2480 ? _2485 : _2483;
    assign _86 = _2486;
    always @(posedge _310) begin
        if (_308)
            _2483 <= _452;
        else
            _2483 <= _86;
    end
    always @* begin
        case (_2483)
        0:
            _2535 <= _2492;
        1:
            _2535 <= _2498;
        2:
            _2535 <= _2504;
        3:
            _2535 <= _2510;
        4:
            _2535 <= _2516;
        5:
            _2535 <= _2522;
        6:
            _2535 <= _2528;
        default:
            _2535 <= _2534;
        endcase
    end
    assign _2536 = 32'b00000000000000000000000000000001;
    assign _2537 = ts_reg + _2536;
    assign _90 = _2537;
    always @(posedge _310) begin
        if (_308)
            ts_reg <= _2089;
        else
            ts_reg <= _90;
    end
    assign _2539 = 2'b00;
    assign _2398 = { _1949,
                     f_unexp_now };
    assign _2400 = f_amb_now ? _2539 : _2398;
    always @(posedge _310) begin
        if (_308)
            _2540 <= _2539;
        else
            _2540 <= _2400;
    end
    always @(posedge _310) begin
        if (_308)
            _2543 <= _1817;
        else
            _2543 <= f_viol_now;
    end
    always @(posedge _310) begin
        if (_308)
            _2546 <= _2539;
        else
            _2546 <= f_winner;
    end
    always @(posedge _310) begin
        if (_308)
            _2549 <= _1817;
        else
            _2549 <= _1700;
    end
    assign _2550 = _1250[60:60];
    assign _2551 = f_in_eval & _2550;
    assign _2552 = ~ _1833;
    assign _2693 = _103 & _2692;
    assign _2694 = ~ _2693;
    assign _2574 = _1250[23:16];
    assign _2572 = _1267[86:79];
    assign _2571 = _1261[86:79];
    assign _2570 = _1255[86:79];
    assign _2569 = _897[86:79];
    always @* begin
        case (f_winner)
        0:
            _2573 <= _2569;
        1:
            _2573 <= _2570;
        2:
            _2573 <= _2571;
        default:
            _2573 <= _2572;
        endcase
    end
    assign _2575 = _881 ? _2574 : _2573;
    assign _2576 = _2575 & _2566;
    assign _2567 = ~ _2566;
    assign _2568 = f_poe & _2567;
    assign _2577 = _2568 | _2576;
    assign _2611 = _2577 | _2610;
    assign _2612 = _2556 ? _2611 : f_poe;
    assign _2614 = _317 ? _755 : _2612;
    assign _2616 = _1893 ? _755 : _2614;
    assign _100 = _2616;
    always @(posedge _310) begin
        if (_308)
            f_poe <= _755;
        else
            f_poe <= _100;
    end
    assign _2695 = f_poe & _2694;
    assign _103 = host_open_drain;
    assign _4280 = ~ _103;
    assign _2690 = f_lane1_out & _2684;
    assign _2689 = ~ f_lane1_out;
    assign _2687 = ~ f_lane0_out;
    assign _2688 = _2687 & _2684;
    assign _2686 = f_lane0_out & _2684;
    assign _2685 = ~ f_lane0_out;
    assign _2684 = f_pout[0:0];
    assign _2683 = _327[2:0];
    always @* begin
        case (_2683)
        0:
            _2691 <= _2684;
        1:
            _2691 <= f_lane0_out;
        2:
            _2691 <= _2685;
        3:
            _2691 <= _2686;
        4:
            _2691 <= _2688;
        5:
            _2691 <= f_lane1_out;
        6:
            _2691 <= _2689;
        default:
            _2691 <= _2690;
        endcase
    end
    assign _2681 = f_lane1_out & _2675;
    assign _2680 = ~ f_lane1_out;
    assign _2678 = ~ f_lane0_out;
    assign _2679 = _2678 & _2675;
    assign _2677 = f_lane0_out & _2675;
    assign _2676 = ~ f_lane0_out;
    assign _2675 = f_pout[1:1];
    assign _2674 = _327[5:3];
    always @* begin
        case (_2674)
        0:
            _2682 <= _2675;
        1:
            _2682 <= f_lane0_out;
        2:
            _2682 <= _2676;
        3:
            _2682 <= _2677;
        4:
            _2682 <= _2679;
        5:
            _2682 <= f_lane1_out;
        6:
            _2682 <= _2680;
        default:
            _2682 <= _2681;
        endcase
    end
    assign _2672 = f_lane1_out & _2666;
    assign _2671 = ~ f_lane1_out;
    assign _2669 = ~ f_lane0_out;
    assign _2670 = _2669 & _2666;
    assign _2668 = f_lane0_out & _2666;
    assign _2667 = ~ f_lane0_out;
    assign _2666 = f_pout[2:2];
    assign _2665 = _327[8:6];
    always @* begin
        case (_2665)
        0:
            _2673 <= _2666;
        1:
            _2673 <= f_lane0_out;
        2:
            _2673 <= _2667;
        3:
            _2673 <= _2668;
        4:
            _2673 <= _2670;
        5:
            _2673 <= f_lane1_out;
        6:
            _2673 <= _2671;
        default:
            _2673 <= _2672;
        endcase
    end
    assign _2663 = f_lane1_out & _2657;
    assign _2662 = ~ f_lane1_out;
    assign _2660 = ~ f_lane0_out;
    assign _2661 = _2660 & _2657;
    assign _2659 = f_lane0_out & _2657;
    assign _2658 = ~ f_lane0_out;
    assign _2657 = f_pout[3:3];
    assign _2656 = _327[11:9];
    always @* begin
        case (_2656)
        0:
            _2664 <= _2657;
        1:
            _2664 <= f_lane0_out;
        2:
            _2664 <= _2658;
        3:
            _2664 <= _2659;
        4:
            _2664 <= _2661;
        5:
            _2664 <= f_lane1_out;
        6:
            _2664 <= _2662;
        default:
            _2664 <= _2663;
        endcase
    end
    assign _2654 = f_lane1_out & _2648;
    assign _2653 = ~ f_lane1_out;
    assign _2651 = ~ f_lane0_out;
    assign _2652 = _2651 & _2648;
    assign _2650 = f_lane0_out & _2648;
    assign _2649 = ~ f_lane0_out;
    assign _2648 = f_pout[4:4];
    assign _2647 = _327[14:12];
    always @* begin
        case (_2647)
        0:
            _2655 <= _2648;
        1:
            _2655 <= f_lane0_out;
        2:
            _2655 <= _2649;
        3:
            _2655 <= _2650;
        4:
            _2655 <= _2652;
        5:
            _2655 <= f_lane1_out;
        6:
            _2655 <= _2653;
        default:
            _2655 <= _2654;
        endcase
    end
    assign _2645 = f_lane1_out & _2639;
    assign _2644 = ~ f_lane1_out;
    assign _2642 = ~ f_lane0_out;
    assign _2643 = _2642 & _2639;
    assign _2641 = f_lane0_out & _2639;
    assign _2640 = ~ f_lane0_out;
    assign _2639 = f_pout[5:5];
    assign _2638 = _327[17:15];
    always @* begin
        case (_2638)
        0:
            _2646 <= _2639;
        1:
            _2646 <= f_lane0_out;
        2:
            _2646 <= _2640;
        3:
            _2646 <= _2641;
        4:
            _2646 <= _2643;
        5:
            _2646 <= f_lane1_out;
        6:
            _2646 <= _2644;
        default:
            _2646 <= _2645;
        endcase
    end
    assign _2636 = f_lane1_out & _2630;
    assign _2635 = ~ f_lane1_out;
    assign _2633 = ~ f_lane0_out;
    assign _2634 = _2633 & _2630;
    assign _2632 = f_lane0_out & _2630;
    assign _2631 = ~ f_lane0_out;
    assign _2630 = f_pout[6:6];
    assign _2629 = _327[20:18];
    always @* begin
        case (_2629)
        0:
            _2637 <= _2630;
        1:
            _2637 <= f_lane0_out;
        2:
            _2637 <= _2631;
        3:
            _2637 <= _2632;
        4:
            _2637 <= _2634;
        5:
            _2637 <= f_lane1_out;
        6:
            _2637 <= _2635;
        default:
            _2637 <= _2636;
        endcase
    end
    assign _2627 = f_lane1_out & _2621;
    assign _2626 = ~ f_lane1_out;
    assign _2624 = ~ f_lane0_out;
    assign _2625 = _2624 & _2621;
    assign _2623 = f_lane0_out & _2621;
    assign _2622 = ~ f_lane0_out;
    assign _4272 = { _4270,
                     _4269 };
    assign _4269 = _1177[0:0];
    assign _4270 = { _4269,
                     _4269 };
    assign _4271 = { _4270,
                     _4270 };
    assign _4273 = { _4271,
                     _4272 };
    assign _4274 = { _4273,
                     _4269 };
    assign _4275 = _4274 & _2610;
    assign _2608 = _2604 & _2602;
    assign _2607 = _2604 & _2600;
    assign _2606 = _2604 & _2597;
    assign _2604 = ~ _2591;
    assign _2605 = _2604 & _2594;
    assign _2602 = _2599 & _2596;
    assign _2603 = _2591 & _2602;
    assign _2599 = ~ _2592;
    assign _2600 = _2599 & _2593;
    assign _2601 = _2591 & _2600;
    assign _2596 = ~ _2593;
    assign _2597 = _2592 & _2596;
    assign _2598 = _2591 & _2597;
    assign _2593 = _2590[0:0];
    assign _2592 = _2590[1:1];
    assign _2594 = _2592 & _2593;
    assign _2591 = _2590[2:2];
    assign _2595 = _2591 & _2594;
    assign _2609 = { _2595,
                     _2598,
                     _2601,
                     _2603,
                     _2605,
                     _2606,
                     _2607,
                     _2608 };
    assign _2578 = ~ _881;
    assign _2584 = _2578 & _2583;
    assign _2610 = _2584 ? _2609 : _755;
    assign _4267 = ~ _2610;
    assign _4263 = _1250[15:8];
    assign _4261 = _1267[78:71];
    assign _4260 = _1261[78:71];
    assign _4259 = _1255[78:71];
    assign _4258 = _897[78:71];
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
    assign _4264 = _881 ? _4263 : _4262;
    assign _4265 = _4264 & _2566;
    assign _2565 = _1250[7:0];
    assign _2563 = _1267[70:63];
    assign _2562 = _1261[70:63];
    assign _2561 = _1255[70:63];
    assign _2560 = _897[70:63];
    always @* begin
        case (f_winner)
        0:
            _2564 <= _2560;
        1:
            _2564 <= _2561;
        2:
            _2564 <= _2562;
        default:
            _2564 <= _2563;
        endcase
    end
    assign _2566 = _881 ? _2565 : _2564;
    assign _4256 = ~ _2566;
    assign _4257 = f_pout & _4256;
    assign _4266 = _4257 | _4265;
    assign _4268 = _4266 & _4267;
    assign _4276 = _4268 | _4275;
    assign _2554 = _1198 == _2539;
    assign _2555 = _2554 | _1200;
    assign _2556 = _1701 & _2555;
    assign _4277 = _2556 ? _4276 : f_pout;
    assign _105 = host_crc_expect;
    assign _4249 = 32'b11111111111111111111111111111111;
    assign _2810 = 32'b11101101101110001000001100100000;
    assign _2808 = _2802[31:1];
    assign _2809 = { _1817,
                     _2808 };
    assign _2811 = _2809 ^ _2810;
    assign _2805 = _2802[31:1];
    assign _2806 = { _1817,
                     _2805 };
    assign _2798 = _2792[31:1];
    assign _2799 = { _1817,
                     _2798 };
    assign _2801 = _2799 ^ _2810;
    assign _2795 = _2792[31:1];
    assign _2796 = { _1817,
                     _2795 };
    assign _2788 = _2782[31:1];
    assign _2789 = { _1817,
                     _2788 };
    assign _2791 = _2789 ^ _2810;
    assign _2785 = _2782[31:1];
    assign _2786 = { _1817,
                     _2785 };
    assign _2778 = _2772[31:1];
    assign _2779 = { _1817,
                     _2778 };
    assign _2781 = _2779 ^ _2810;
    assign _2775 = _2772[31:1];
    assign _2776 = { _1817,
                     _2775 };
    assign _2768 = _2762[31:1];
    assign _2769 = { _1817,
                     _2768 };
    assign _2771 = _2769 ^ _2810;
    assign _2765 = _2762[31:1];
    assign _2766 = { _1817,
                     _2765 };
    assign _2758 = _2752[31:1];
    assign _2759 = { _1817,
                     _2758 };
    assign _2761 = _2759 ^ _2810;
    assign _2755 = _2752[31:1];
    assign _2756 = { _1817,
                     _2755 };
    assign _2748 = _2742[31:1];
    assign _2749 = { _1817,
                     _2748 };
    assign _2751 = _2749 ^ _2810;
    assign _2745 = _2742[31:1];
    assign _2746 = { _1817,
                     _2745 };
    assign _2738 = _2732[31:1];
    assign _2739 = { _1817,
                     _2738 };
    assign _2741 = _2739 ^ _2810;
    assign _2735 = _2732[31:1];
    assign _2736 = { _1817,
                     _2735 };
    assign _2729 = _302[127:120];
    assign _2728 = _302[119:112];
    assign _2727 = _302[111:104];
    assign _2726 = _302[103:96];
    assign _2725 = _302[95:88];
    assign _2724 = _302[87:80];
    assign _2723 = _302[79:72];
    assign _2722 = _302[71:64];
    assign _2721 = _302[63:56];
    assign _2720 = _302[55:48];
    assign _2719 = _302[47:40];
    assign _2718 = _302[39:32];
    assign _2717 = _302[31:24];
    assign _2716 = _302[23:16];
    assign _2715 = _302[15:8];
    assign _2714 = _302[7:0];
    assign _2711 = 13'b0000000000001;
    assign _2712 = f_sw_cnt - _2711;
    assign _2713 = _2712[3:0];
    always @* begin
        case (_2713)
        0:
            _2730 <= _2714;
        1:
            _2730 <= _2715;
        2:
            _2730 <= _2716;
        3:
            _2730 <= _2717;
        4:
            _2730 <= _2718;
        5:
            _2730 <= _2719;
        6:
            _2730 <= _2720;
        7:
            _2730 <= _2721;
        8:
            _2730 <= _2722;
        9:
            _2730 <= _2723;
        10:
            _2730 <= _2724;
        11:
            _2730 <= _2725;
        12:
            _2730 <= _2726;
        13:
            _2730 <= _2727;
        14:
            _2730 <= _2728;
        default:
            _2730 <= _2729;
        endcase
    end
    assign _2710 = 24'b000000000000000000000000;
    assign _2731 = { _2710,
                     _2730 };
    assign _2708 = f_sw_cnt == _2016;
    assign _2709 = ~ _2708;
    assign _2813 = _2709 ? _2812 : _2703;
    assign _2703 = _2698 ? _4249 : _2701;
    assign _2814 = f_sweeping ? _2813 : _2703;
    assign _106 = _2814;
    always @(posedge _310) begin
        if (_308)
            _2701 <= _4249;
        else
            _2701 <= _106;
    end
    assign _2732 = _2701 ^ _2731;
    assign _2733 = _2732[0:0];
    assign _2742 = _2733 ? _2741 : _2736;
    assign _2743 = _2742[0:0];
    assign _2752 = _2743 ? _2751 : _2746;
    assign _2753 = _2752[0:0];
    assign _2762 = _2753 ? _2761 : _2756;
    assign _2763 = _2762[0:0];
    assign _2772 = _2763 ? _2771 : _2766;
    assign _2773 = _2772[0:0];
    assign _2782 = _2773 ? _2781 : _2776;
    assign _2783 = _2782[0:0];
    assign _2792 = _2783 ? _2791 : _2786;
    assign _2793 = _2792[0:0];
    assign _2802 = _2793 ? _2801 : _2796;
    assign _2803 = _2802[0:0];
    assign _2812 = _2803 ? _2811 : _2806;
    assign _4250 = _2812 ^ _4249;
    assign f_sw_match = _4250 == _105;
    assign _4252 = f_sw_last ? f_sw_match : _4248;
    assign _4254 = _4236 ? _1817 : _4252;
    assign _4244 = f_store_we | _108;
    assign _4246 = _4244 ? _1817 : f_image_valid;
    assign _4248 = _2698 ? _1817 : _4246;
    assign _4237 = 13'b1000000000000;
    assign f_sw_last = f_sw_cnt == _4237;
    assign _4240 = f_sw_last ? _1817 : _4233;
    assign _108 = host_crc_expect_we;
    assign _4234 = _324 | _290;
    assign _4235 = _4234 | _108;
    assign _4236 = f_sweeping & _4235;
    assign _4242 = _4236 ? _1817 : _4240;
    assign _2697 = ~ f_sweeping;
    assign _4226 = _881 ? _2046 : _873;
    assign _4222 = _4088 ? _2045 : _873;
    assign _1961 = 2'b11;
    assign _4213 = f_policy == _1961;
    assign _4215 = _4213 ? _2539 : _873;
    assign _4212 = f_policy == _2046;
    assign _4217 = _4212 ? _2045 : _4215;
    assign _4211 = f_policy == _2539;
    assign _4219 = _4211 ? _2539 : _4217;
    assign _4220 = f_viol_now ? _4219 : _873;
    assign _1695 = f_chgmask3 & f_multi_eff;
    assign _1697 = _1695 == _755;
    assign _1688 = _1645 == _1998;
    assign _1683 = 16'b0000000000000000;
    assign _1684 = _1645 == _1683;
    assign _1685 = _1684 & _1665;
    assign _1682 = _1581 == _1641;
    assign _1686 = _1682 | _1685;
    assign _1689 = _1580 ? _1688 : _1686;
    assign _1679 = _1187[3:0];
    assign _1681 = _1679 == _1984;
    assign _1690 = _1681 | _1689;
    assign _1677 = _1645 == _1998;
    assign _1673 = _1645 == _1683;
    assign _1674 = _1673 & _1665;
    assign _1671 = _1581 == _1641;
    assign _1675 = _1671 | _1674;
    assign _1678 = _1580 ? _1677 : _1675;
    assign _1669 = _1632 == _1998;
    always @(posedge _310) begin
        if (_308)
            _1663 <= _452;
        else
            _1663 <= _1624;
    end
    assign _1664 = { _2016,
                     _1663 };
    assign _1665 = _1578 < _1664;
    assign _1659 = _1632 == _1683;
    assign _1666 = _1659 & _1665;
    assign _1657 = _1581 == _1629;
    assign _1667 = _1657 | _1666;
    assign _1670 = _1580 ? _1669 : _1667;
    assign _1656 = _1267[104:103];
    always @* begin
        case (_1656)
        0:
            _1691 <= vdd;
        1:
            _1691 <= _1670;
        2:
            _1691 <= _1678;
        default:
            _1691 <= _1690;
        endcase
    end
    assign _1655 = ~ _1200;
    assign _1692 = _1655 | _1691;
    assign _1652 = _1267[62:62];
    assign _1650 = _1267[61:58];
    always @* begin
        case (_1650)
        0:
            _1651 <= vdd;
        1:
            _1651 <= _1174;
        2:
            _1651 <= _1178;
        3:
            _1651 <= _1182;
        4:
            _1651 <= _1184;
        5:
            _1651 <= _737;
        6:
            _1651 <= _1188;
        7:
            _1651 <= _1191;
        8:
            _1651 <= _657;
        9:
            _1651 <= _660;
        10:
            _1651 <= _663;
        11:
            _1651 <= _666;
        12:
            _1651 <= _645;
        13:
            _1651 <= _648;
        14:
            _1651 <= _651;
        default:
            _1651 <= _654;
        endcase
    end
    assign _1653 = _1651 ^ _1652;
    assign _1645 = _1267[57:42];
    assign _1647 = _1645 == _1998;
    assign _1640 = 17'b00000000000000000;
    assign _1636 = _1582[57:42];
    assign _1637 = { gnd,
                     _1636 };
    assign _1638 = _1637 + _1625;
    always @(posedge _310) begin
        if (_308)
            _1641 <= _1640;
        else
            _1641 <= _1638;
    end
    assign _1642 = _1641 < _1581;
    assign _1643 = ~ _1642;
    assign _1632 = _1267[41:26];
    assign _1634 = _1632 == _1683;
    assign _1616 = _1586[0:0];
    assign _1618 = _1616 ? _1136 : _452;
    assign _1613 = _1586[1:1];
    assign _1615 = _1613 ? _1115 : _452;
    assign _1619 = _1615 < _1618;
    assign _1620 = _1619 ? _1618 : _1615;
    assign _1608 = _1586[2:2];
    assign _1610 = _1608 ? _1092 : _452;
    assign _1605 = _1586[3:3];
    assign _1607 = _1605 ? _1071 : _452;
    assign _1611 = _1607 < _1610;
    assign _1612 = _1611 ? _1610 : _1607;
    assign _1621 = _1612 < _1620;
    assign _1622 = _1621 ? _1620 : _1612;
    assign _1598 = _1586[4:4];
    assign _1600 = _1598 ? _1046 : _452;
    assign _1595 = _1586[5:5];
    assign _1597 = _1595 ? _1025 : _452;
    assign _1601 = _1597 < _1600;
    assign _1602 = _1601 ? _1600 : _1597;
    assign _1590 = _1586[6:6];
    assign _1592 = _1590 ? _1002 : _452;
    assign _1586 = _1582[23:16];
    assign _1587 = _1586[7:7];
    assign _1589 = _1587 ? _981 : _452;
    assign _1593 = _1589 < _1592;
    assign _1594 = _1593 ? _1592 : _1589;
    assign _1603 = _1594 < _1602;
    assign _1604 = _1603 ? _1602 : _1594;
    assign _1623 = _1604 < _1622;
    assign _1624 = _1623 ? _1622 : _1604;
    assign _1585 = 14'b00000000000000;
    assign _1625 = { _1585,
                     _1624 };
    assign _1582 = _956[511:400];
    assign _1583 = _1582[41:26];
    assign _1584 = { gnd,
                     _1583 };
    assign _1626 = _1584 + _1625;
    always @(posedge _310) begin
        if (_308)
            _1629 <= _1640;
        else
            _1629 <= _1626;
    end
    assign _1581 = { gnd,
                     _1578 };
    assign _1630 = _1581 < _1629;
    assign _1631 = ~ _1630;
    assign _1635 = _1631 | _1634;
    assign _1644 = _1635 & _1643;
    assign _1577 = _1267[25:24];
    always @* begin
        case (_1577)
        0:
            _1578 <= _929;
        1:
            _1578 <= _932;
        2:
            _1578 <= _935;
        default:
            _1578 <= _935;
        endcase
    end
    assign _1580 = _1578 == _1998;
    assign _1648 = _1580 ? _1647 : _1644;
    assign _1571 = f_changed_all & f_chgmask3;
    assign _1573 = _1571 == _755;
    assign _1574 = ~ _1573;
    assign _1570 = f_chgmask3 == _755;
    assign _1575 = _1570 | _1574;
    assign _1564 = _1267[7:0];
    assign _1562 = _1267[15:8];
    assign _1563 = _901 ^ _1562;
    assign _1565 = _1563 & _1564;
    assign _1567 = _1565 == _755;
    assign _1568 = f_valid3 & _1567;
    assign _1576 = _1568 & _1575;
    assign _1649 = _1576 & _1648;
    assign _1654 = _1649 & _1653;
    assign _1693 = _1654 & _1692;
    assign _1694 = f_in_eval & _1693;
    assign _1698 = _1694 & _1697;
    assign f_fire3 = _1698 & _1282;
    assign _1246 = f_chgmask0 & f_multi_eff;
    assign _1248 = _1246 == _755;
    assign _1234 = _1164 == _1998;
    assign _1230 = _1164 == _1683;
    assign _1231 = _1230 & _1211;
    assign _1228 = _939 == _1160;
    assign _1232 = _1228 | _1231;
    assign _1235 = _938 ? _1234 : _1232;
    assign _1225 = _1187[3:0];
    assign _1227 = _1225 == _1984;
    assign _1236 = _1227 | _1235;
    assign _1223 = _1164 == _1998;
    assign _1219 = _1164 == _1683;
    assign _1220 = _1219 & _1211;
    assign _1217 = _939 == _1160;
    assign _1221 = _1217 | _1220;
    assign _1224 = _938 ? _1223 : _1221;
    assign _1215 = _1151 == _1998;
    always @(posedge _310) begin
        if (_308)
            _1209 <= _452;
        else
            _1209 <= _1143;
    end
    assign _1210 = { _2016,
                     _1209 };
    assign _1211 = _936 < _1210;
    assign _1205 = _1151 == _1683;
    assign _1212 = _1205 & _1211;
    assign _1203 = _939 == _1148;
    assign _1213 = _1203 | _1212;
    assign _1216 = _938 ? _1215 : _1213;
    assign _1202 = _897[104:103];
    always @* begin
        case (_1202)
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
    assign _1201 = ~ _1200;
    assign _1238 = _1201 | _1237;
    assign _1193 = _897[62:62];
    assign _1169 = _897[61:58];
    always @* begin
        case (_1169)
        0:
            _1192 <= vdd;
        1:
            _1192 <= _1174;
        2:
            _1192 <= _1178;
        3:
            _1192 <= _1182;
        4:
            _1192 <= _1184;
        5:
            _1192 <= _737;
        6:
            _1192 <= _1188;
        7:
            _1192 <= _1191;
        8:
            _1192 <= _657;
        9:
            _1192 <= _660;
        10:
            _1192 <= _663;
        11:
            _1192 <= _666;
        12:
            _1192 <= _645;
        13:
            _1192 <= _648;
        14:
            _1192 <= _651;
        default:
            _1192 <= _654;
        endcase
    end
    assign _1194 = _1192 ^ _1193;
    assign _1164 = _897[57:42];
    assign _1166 = _1164 == _1998;
    assign _1155 = _957[57:42];
    assign _1156 = { gnd,
                     _1155 };
    assign _1157 = _1156 + _1144;
    always @(posedge _310) begin
        if (_308)
            _1160 <= _1640;
        else
            _1160 <= _1157;
    end
    assign _1161 = _1160 < _939;
    assign _1162 = ~ _1161;
    assign _1151 = _897[41:26];
    assign _1153 = _1151 == _1683;
    assign _1117 = _961[0:0];
    assign _1137 = _1117 ? _1136 : _452;
    assign _1096 = _961[1:1];
    assign _1116 = _1096 ? _1115 : _452;
    assign _1138 = _1116 < _1137;
    assign _1139 = _1138 ? _1137 : _1116;
    assign _1073 = _961[2:2];
    assign _1093 = _1073 ? _1092 : _452;
    assign _1052 = _961[3:3];
    assign _1072 = _1052 ? _1071 : _452;
    assign _1094 = _1072 < _1093;
    assign _1095 = _1094 ? _1093 : _1072;
    assign _1140 = _1095 < _1139;
    assign _1141 = _1140 ? _1139 : _1095;
    assign _1027 = _961[4:4];
    assign _1047 = _1027 ? _1046 : _452;
    assign _1006 = _961[5:5];
    assign _1026 = _1006 ? _1025 : _452;
    assign _1048 = _1026 < _1047;
    assign _1049 = _1048 ? _1047 : _1026;
    assign _983 = _961[6:6];
    assign _1003 = _983 ? _1002 : _452;
    assign _961 = _957[23:16];
    assign _962 = _961[7:7];
    assign _982 = _962 ? _981 : _452;
    assign _1004 = _982 < _1003;
    assign _1005 = _1004 ? _1003 : _982;
    assign _1050 = _1005 < _1049;
    assign _1051 = _1050 ? _1049 : _1005;
    assign _1142 = _1051 < _1141;
    assign _1143 = _1142 ? _1141 : _1051;
    assign _1144 = { _1585,
                     _1143 };
    assign _957 = _956[175:64];
    assign _958 = _957[41:26];
    assign _959 = { gnd,
                    _958 };
    assign _1145 = _959 + _1144;
    always @(posedge _310) begin
        if (_308)
            _1148 <= _1640;
        else
            _1148 <= _1145;
    end
    assign _939 = { gnd,
                    _936 };
    assign _1149 = _939 < _1148;
    assign _1150 = ~ _1149;
    assign _1154 = _1150 | _1153;
    assign _1163 = _1154 & _1162;
    assign _926 = _897[25:24];
    always @* begin
        case (_926)
        0:
            _936 <= _929;
        1:
            _936 <= _932;
        2:
            _936 <= _935;
        default:
            _936 <= _935;
        endcase
    end
    assign _938 = _936 == _1998;
    assign _1167 = _938 ? _1166 : _1163;
    assign _920 = f_changed_all & f_chgmask0;
    assign _922 = _920 == _755;
    assign _923 = ~ _922;
    assign _911 = f_chgmask0 == _755;
    assign _924 = _911 | _923;
    assign _904 = _897[7:0];
    assign _902 = _897[15:8];
    assign _903 = _901 ^ _902;
    assign _905 = _903 & _904;
    assign _907 = _905 == _755;
    assign _885 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _4196 = _878 + _482;
    assign _4192 = _4088 ? _452 : _878;
    assign _4187 = f_policy == _2046;
    assign _4189 = _4187 ? _452 : _878;
    assign _1952 = f_changed_all & f_watch;
    assign _1954 = _1952 == _755;
    assign _1955 = ~ _1954;
    assign _1950 = ~ _1700;
    assign _1951 = f_in_eval & _1950;
    assign f_unexp_now = _1951 & _1955;
    assign _2818 = ~ f_amb_now;
    assign _2819 = _1949 & _2818;
    assign _2821 = _2819 ? _1819 : _2817;
    assign _2822 = _1700 ? _2817 : _2821;
    assign _2817 = _1701 ? _1817 : _1947;
    assign _2815 = _873 == _2046;
    assign _2823 = _2815 ? _2822 : _2817;
    assign _109 = _2823;
    always @(posedge _310) begin
        if (_308)
            _1947 <= _1817;
        else
            _1947 <= _109;
    end
    assign _1948 = ~ _1947;
    assign _4178 = 16'b0000000000000001;
    assign _4179 = _929 + _4178;
    assign _4175 = _929 == _1998;
    assign _4176 = ~ _4175;
    assign _4177 = _4136 & _4176;
    assign _4180 = _4177 ? _4179 : _929;
    assign _4120 = _1250[26:24];
    assign _4118 = _1267[93:91];
    assign _4117 = _1261[93:91];
    assign _4116 = _1255[93:91];
    assign _4115 = _897[93:91];
    assign _1556 = f_chgmask2 & f_multi_eff;
    assign _1558 = _1556 == _755;
    assign _1549 = _1506 == _1998;
    assign _1545 = _1506 == _1683;
    assign _1546 = _1545 & _1526;
    assign _1543 = _1442 == _1502;
    assign _1547 = _1543 | _1546;
    assign _1550 = _1441 ? _1549 : _1547;
    assign _1540 = _1187[3:0];
    assign _1542 = _1540 == _1984;
    assign _1551 = _1542 | _1550;
    assign _1538 = _1506 == _1998;
    assign _1534 = _1506 == _1683;
    assign _1535 = _1534 & _1526;
    assign _1532 = _1442 == _1502;
    assign _1536 = _1532 | _1535;
    assign _1539 = _1441 ? _1538 : _1536;
    assign _1530 = _1493 == _1998;
    always @(posedge _310) begin
        if (_308)
            _1524 <= _452;
        else
            _1524 <= _1485;
    end
    assign _1525 = { _2016,
                     _1524 };
    assign _1526 = _1439 < _1525;
    assign _1520 = _1493 == _1683;
    assign _1527 = _1520 & _1526;
    assign _1518 = _1442 == _1490;
    assign _1528 = _1518 | _1527;
    assign _1531 = _1441 ? _1530 : _1528;
    assign _1517 = _1261[104:103];
    always @* begin
        case (_1517)
        0:
            _1552 <= vdd;
        1:
            _1552 <= _1531;
        2:
            _1552 <= _1539;
        default:
            _1552 <= _1551;
        endcase
    end
    assign _1516 = ~ _1200;
    assign _1553 = _1516 | _1552;
    assign _1513 = _1261[62:62];
    assign _1511 = _1261[61:58];
    always @* begin
        case (_1511)
        0:
            _1512 <= vdd;
        1:
            _1512 <= _1174;
        2:
            _1512 <= _1178;
        3:
            _1512 <= _1182;
        4:
            _1512 <= _1184;
        5:
            _1512 <= _737;
        6:
            _1512 <= _1188;
        7:
            _1512 <= _1191;
        8:
            _1512 <= _657;
        9:
            _1512 <= _660;
        10:
            _1512 <= _663;
        11:
            _1512 <= _666;
        12:
            _1512 <= _645;
        13:
            _1512 <= _648;
        14:
            _1512 <= _651;
        default:
            _1512 <= _654;
        endcase
    end
    assign _1514 = _1512 ^ _1513;
    assign _1506 = _1261[57:42];
    assign _1508 = _1506 == _1998;
    assign _1497 = _1443[57:42];
    assign _1498 = { gnd,
                     _1497 };
    assign _1499 = _1498 + _1486;
    always @(posedge _310) begin
        if (_308)
            _1502 <= _1640;
        else
            _1502 <= _1499;
    end
    assign _1503 = _1502 < _1442;
    assign _1504 = ~ _1503;
    assign _1493 = _1261[41:26];
    assign _1495 = _1493 == _1683;
    assign _1477 = _1447[0:0];
    assign _1479 = _1477 ? _1136 : _452;
    assign _1474 = _1447[1:1];
    assign _1476 = _1474 ? _1115 : _452;
    assign _1480 = _1476 < _1479;
    assign _1481 = _1480 ? _1479 : _1476;
    assign _1469 = _1447[2:2];
    assign _1471 = _1469 ? _1092 : _452;
    assign _1466 = _1447[3:3];
    assign _1468 = _1466 ? _1071 : _452;
    assign _1472 = _1468 < _1471;
    assign _1473 = _1472 ? _1471 : _1468;
    assign _1482 = _1473 < _1481;
    assign _1483 = _1482 ? _1481 : _1473;
    assign _1459 = _1447[4:4];
    assign _1461 = _1459 ? _1046 : _452;
    assign _1456 = _1447[5:5];
    assign _1458 = _1456 ? _1025 : _452;
    assign _1462 = _1458 < _1461;
    assign _1463 = _1462 ? _1461 : _1458;
    assign _1451 = _1447[6:6];
    assign _1453 = _1451 ? _1002 : _452;
    assign _1447 = _1443[23:16];
    assign _1448 = _1447[7:7];
    assign _1450 = _1448 ? _981 : _452;
    assign _1454 = _1450 < _1453;
    assign _1455 = _1454 ? _1453 : _1450;
    assign _1464 = _1455 < _1463;
    assign _1465 = _1464 ? _1463 : _1455;
    assign _1484 = _1465 < _1483;
    assign _1485 = _1484 ? _1483 : _1465;
    assign _1486 = { _1585,
                     _1485 };
    assign _1443 = _956[399:288];
    assign _1444 = _1443[41:26];
    assign _1445 = { gnd,
                     _1444 };
    assign _1487 = _1445 + _1486;
    always @(posedge _310) begin
        if (_308)
            _1490 <= _1640;
        else
            _1490 <= _1487;
    end
    assign _1442 = { gnd,
                     _1439 };
    assign _1491 = _1442 < _1490;
    assign _1492 = ~ _1491;
    assign _1496 = _1492 | _1495;
    assign _1505 = _1496 & _1504;
    assign _1438 = _1261[25:24];
    always @* begin
        case (_1438)
        0:
            _1439 <= _929;
        1:
            _1439 <= _932;
        2:
            _1439 <= _935;
        default:
            _1439 <= _935;
        endcase
    end
    assign _1441 = _1439 == _1998;
    assign _1509 = _1441 ? _1508 : _1505;
    assign _1432 = f_changed_all & f_chgmask2;
    assign _1434 = _1432 == _755;
    assign _1435 = ~ _1434;
    assign _1431 = f_chgmask2 == _755;
    assign _1436 = _1431 | _1435;
    assign _1425 = _1261[7:0];
    assign _1423 = _1261[15:8];
    assign _1424 = _901 ^ _1423;
    assign _1426 = _1424 & _1425;
    assign _1428 = _1426 == _755;
    assign _1429 = f_valid2 & _1428;
    assign _1437 = _1429 & _1436;
    assign _1510 = _1437 & _1509;
    assign _1515 = _1510 & _1514;
    assign _1554 = _1515 & _1553;
    assign _1555 = f_in_eval & _1554;
    assign _1559 = _1555 & _1558;
    assign f_fire2 = _1559 & _1282;
    assign _1704 = f_fire2 ? _2046 : _1961;
    assign _1281 = f_policy == _2045;
    assign f_chgmask3 = _1267[23:16];
    assign f_valid3 = _1267[111:111];
    assign _1271 = f_valid3 ? f_chgmask3 : _755;
    assign f_chgmask2 = _1261[23:16];
    assign f_valid2 = _1261[111:111];
    assign _1265 = f_valid2 ? f_chgmask2 : _755;
    assign _1259 = f_valid1 ? f_chgmask1 : _755;
    assign f_chgmask0 = _897[23:16];
    assign _1253 = f_valid0 ? f_chgmask0 : _755;
    assign f_watch = _1250[57:50];
    assign _1254 = f_watch | _1253;
    assign _1260 = _1254 | _1259;
    assign _1266 = _1260 | _1265;
    assign f_relevant = _1266 | _1271;
    assign _1273 = f_multi_eff & f_relevant;
    assign _1275 = _1273 == _755;
    assign _1276 = ~ _1275;
    assign f_amb_now = f_in_eval & _1276;
    assign _1278 = ~ f_amb_now;
    assign _1282 = _1278 | _1281;
    assign _1244 = _914 & f_chg_now;
    assign _2828 = _914 & f_chg_now;
    assign _2829 = _1243 | _2828;
    assign _2825 = _873 == _2046;
    assign _2827 = _2825 ? _755 : _1243;
    assign _2824 = _873 == _2045;
    assign _2830 = _2824 ? _2829 : _2827;
    assign _2832 = _1893 ? _755 : _2830;
    assign _110 = _2832;
    always @(posedge _310) begin
        if (_308)
            _1243 <= _755;
        else
            _1243 <= _110;
    end
    assign f_multi_eff = _1243 | _1244;
    assign _1417 = f_chgmask1 & f_multi_eff;
    assign _1419 = _1417 == _755;
    assign _1410 = _1367 == _1998;
    assign _1406 = _1367 == _1683;
    assign _1407 = _1406 & _1387;
    assign _1404 = _1303 == _1363;
    assign _1408 = _1404 | _1407;
    assign _1411 = _1302 ? _1410 : _1408;
    assign _1401 = _1187[3:0];
    assign _1403 = _1401 == _1984;
    assign _1412 = _1403 | _1411;
    assign _1399 = _1367 == _1998;
    assign _1395 = _1367 == _1683;
    assign _1396 = _1395 & _1387;
    assign _1393 = _1303 == _1363;
    assign _1397 = _1393 | _1396;
    assign _1400 = _1302 ? _1399 : _1397;
    assign _1391 = _1354 == _1998;
    always @(posedge _310) begin
        if (_308)
            _1385 <= _452;
        else
            _1385 <= _1346;
    end
    assign _1386 = { _2016,
                     _1385 };
    assign _1387 = _1300 < _1386;
    assign _1381 = _1354 == _1683;
    assign _1388 = _1381 & _1387;
    assign _1379 = _1303 == _1351;
    assign _1389 = _1379 | _1388;
    assign _1392 = _1302 ? _1391 : _1389;
    assign _1378 = _1255[104:103];
    always @* begin
        case (_1378)
        0:
            _1413 <= vdd;
        1:
            _1413 <= _1392;
        2:
            _1413 <= _1400;
        default:
            _1413 <= _1412;
        endcase
    end
    assign _112 = host_role;
    assign _2833 = _1893 ? _112 : _1198;
    assign _113 = _2833;
    always @(posedge _310) begin
        if (_308)
            _1198 <= _2539;
        else
            _1198 <= _113;
    end
    assign _1200 = _1198 == _2046;
    assign _1377 = ~ _1200;
    assign _1414 = _1377 | _1413;
    assign _1374 = _1255[62:62];
    assign _2837 = _636 ? _1819 : _2835;
    assign _2835 = _606 ? _1819 : _654;
    assign _2838 = _591 ? _2837 : _2835;
    assign _2840 = _493 ? _1817 : _2838;
    assign _2842 = _491 ? _1817 : _2840;
    assign _114 = _2842;
    always @(posedge _310) begin
        if (_308)
            _654 <= _1817;
        else
            _654 <= _114;
    end
    assign _116 = host_lane1_sync_mask;
    assign _118 = host_lane1_sync;
    assign _2848 = _2847 ^ _118;
    assign _2849 = _2848 & _116;
    assign _2851 = _2849 == _1683;
    assign _2853 = _2851 ? _1819 : _651;
    assign _2854 = _769 ? _2853 : _651;
    assign _2855 = _636 ? _651 : _2854;
    assign _2856 = _591 ? _2855 : _651;
    assign _2858 = _493 ? _1817 : _2856;
    assign _2860 = _491 ? _1817 : _2858;
    assign _119 = _2860;
    always @(posedge _310) begin
        if (_308)
            _651 <= _1817;
        else
            _651 <= _119;
    end
    assign _2873 = _627 == _2872;
    assign _2874 = ~ _2873;
    assign _2876 = _2867 ? _2875 : g_crc_bad;
    assign _2877 = _769 ? _2876 : g_crc_bad;
    assign _2878 = _636 ? g_crc_bad : _2877;
    assign _2879 = _591 ? _2878 : g_crc_bad;
    assign _2881 = _493 ? _1817 : _2879;
    assign _120 = _2881;
    always @(posedge _310) begin
        if (_308)
            g_crc_bad <= _1817;
        else
            g_crc_bad <= _120;
    end
    assign _2875 = g_crc_bad | _2874;
    assign _2884 = ~ _2875;
    assign _2882 = 6'b000001;
    assign _2883 = g_left == _2882;
    assign _2885 = _2883 ? _2884 : _648;
    assign _2886 = _2867 ? _2885 : _648;
    assign _2887 = _769 ? _2886 : _648;
    assign _2888 = _636 ? _648 : _2887;
    assign _2889 = _591 ? _2888 : _648;
    assign _2891 = _493 ? _1817 : _2889;
    assign _2893 = _491 ? _1817 : _2891;
    assign _121 = _2893;
    always @(posedge _310) begin
        if (_308)
            _648 <= _1817;
        else
            _648 <= _121;
    end
    assign _2897 = _481 ? _1819 : _2895;
    assign _2895 = _450 ? _1819 : _666;
    assign _2898 = _435 ? _2897 : _2895;
    assign _2900 = _333 ? _1817 : _2898;
    assign _2902 = _331 ? _1817 : _2900;
    assign _122 = _2902;
    always @(posedge _310) begin
        if (_308)
            _666 <= _1817;
        else
            _666 <= _122;
    end
    assign _124 = host_lane0_sync_mask;
    assign _126 = host_lane0_sync;
    assign _2908 = _2907 ^ _126;
    assign _2909 = _2908 & _124;
    assign _2911 = _2909 == _1683;
    assign _2913 = _2911 ? _1819 : _663;
    assign _2914 = _669 ? _2913 : _663;
    assign _2915 = _481 ? _663 : _2914;
    assign _2916 = _435 ? _2915 : _663;
    assign _2918 = _333 ? _1817 : _2916;
    assign _2920 = _331 ? _1817 : _2918;
    assign _127 = _2920;
    always @(posedge _310) begin
        if (_308)
            _663 <= _1817;
        else
            _663 <= _127;
    end
    assign _2933 = _471 == _2932;
    assign _2934 = ~ _2933;
    assign _2936 = _2927 ? _2935 : g_crc_bad_0;
    assign _2937 = _669 ? _2936 : g_crc_bad_0;
    assign _2938 = _481 ? g_crc_bad_0 : _2937;
    assign _2939 = _435 ? _2938 : g_crc_bad_0;
    assign _2941 = _333 ? _1817 : _2939;
    assign _128 = _2941;
    always @(posedge _310) begin
        if (_308)
            g_crc_bad_0 <= _1817;
        else
            g_crc_bad_0 <= _128;
    end
    assign _2935 = g_crc_bad_0 | _2934;
    assign _2944 = ~ _2935;
    assign _2943 = g_left_0 == _2882;
    assign _2945 = _2943 ? _2944 : _660;
    assign _2946 = _2927 ? _2945 : _660;
    assign _2947 = _669 ? _2946 : _660;
    assign _2948 = _481 ? _660 : _2947;
    assign _2949 = _435 ? _2948 : _660;
    assign _2951 = _333 ? _1817 : _2949;
    assign _2953 = _331 ? _1817 : _2951;
    assign _129 = _2953;
    always @(posedge _310) begin
        if (_308)
            _660 <= _1817;
        else
            _660 <= _129;
    end
    assign _131 = host_match_addr;
    assign _1190 = _131[6:0];
    assign _1189 = _1181[7:1];
    assign _1191 = _1189 == _1190;
    assign _1186 = 16'b1010110011100001;
    assign _2958 = _1187[10:10];
    assign _2957 = _1187[12:12];
    assign _2959 = _2957 ^ _2958;
    assign _2956 = _1187[13:13];
    assign _2960 = _2956 ^ _2959;
    assign _2955 = _1187[15:15];
    assign _2961 = _2955 ^ _2960;
    assign _2954 = _1187[14:0];
    assign _2962 = { _2954,
                     _2961 };
    assign _132 = _2962;
    always @(posedge _310) begin
        if (_308)
            _1187 <= _1186;
        else
            _1187 <= _132;
    end
    assign _1188 = _1187[0:0];
    assign _2975 = _136 + _2407;
    assign _2973 = _136 - _2407;
    assign _2976 = _2472 ? _2975 : _2973;
    assign _2470 = _136 == _1984;
    assign _2479 = ~ _2470;
    assign _134 = host_rx_pop;
    assign _2480 = _134 & _2479;
    assign _2471 = ~ _737;
    assign _2969 = ~ _2968;
    assign _2965 = _870 | _1718;
    assign _2963 = _768 | _835;
    assign _2964 = _735 | _2963;
    assign _2966 = _2964 | _2965;
    assign _2970 = _2966 & _2969;
    assign f_rx_push = _2970;
    assign _2472 = f_rx_push & _2471;
    assign _2971 = _2472 ^ _2480;
    assign _2977 = _2971 ? _2976 : _136;
    always @(posedge _310) begin
        if (_308)
            _2980 <= _1984;
        else
            _2980 <= _2977;
    end
    assign _136 = _2980;
    assign _737 = _136 == _1742;
    assign _1182 = _1181[0:0];
    assign _3889 = _1177[7:1];
    assign _3890 = { vdd,
                     _3889 };
    assign _3887 = _3879[7:7];
    assign _3886 = _3879[6:6];
    assign _3885 = _3879[5:5];
    assign _3884 = _3879[4:4];
    assign _3883 = _3879[3:3];
    assign _3882 = _3879[2:2];
    assign _3881 = _3879[1:1];
    assign _3880 = _3879[0:0];
    assign _3888 = { _3880,
                     _3881,
                     _3882,
                     _3883,
                     _3884,
                     _3885,
                     _3886,
                     _3887 };
    assign _3872 = _275 + _2407;
    assign _3870 = _275 - _2407;
    assign _3873 = _2997 ? _3872 : _3870;
    assign _739 = _275 == _1742;
    assign _2996 = ~ _739;
    assign _2993 = ~ _273;
    assign _138 = host_tx_push;
    assign _2994 = _138 & _2993;
    assign _733 = ~ _699;
    assign _727 = g_bitpos_0 + _482;
    assign _722 = ~ _465;
    assign g_tx_bit = _712 & _720;
    assign _723 = g_tx_bit & _722;
    assign _724 = _723 & g_data_left_0;
    assign _725 = _693 | _724;
    assign _728 = _725 ? _727 : g_bitpos_0;
    assign _730 = _728 == _452;
    assign _731 = ~ _730;
    assign _702 = _701 & _269;
    assign _732 = _702 & _731;
    assign _734 = _732 & _733;
    assign _698 = g_bitpos_0 == _2464;
    assign _689 = g_cnt_0[5:0];
    assign _690 = _689 < _235;
    assign _691 = ~ _690;
    assign _685 = g_cnt_0[15:6];
    assign _687 = _685 == _2013;
    assign _688 = ~ _687;
    assign _692 = _688 | _691;
    assign _3860 = ~ _265;
    assign _3861 = _269 & _3860;
    assign _3864 = _3861 ? _2045 : _2046;
    assign _3853 = ~ _720;
    assign _3854 = _712 & _3853;
    assign _3855 = _657 | _3854;
    assign _3856 = _3855 | _3845;
    assign _3858 = _3856 ? _2046 : _3852;
    assign _3839 = g_run_0 + _482;
    assign _3836 = g_run_0 + _482;
    assign _3832 = vdd == g_last_0;
    assign _3830 = g_run_0 == _452;
    assign _3831 = ~ _3830;
    assign _3833 = _3831 & _3832;
    assign _3837 = _3833 ? _3836 : _482;
    assign _3828 = _247 == _2046;
    assign _3840 = _3828 ? _3839 : _3837;
    assign _3841 = _3840 == _141;
    assign _3822 = g_run_0 + _482;
    assign _3818 = gnd == g_last_0;
    assign _3816 = g_run_0 == _452;
    assign _3817 = ~ _3816;
    assign _3819 = _3817 & _3818;
    assign _3823 = _3819 ? _3822 : _482;
    assign _3814 = _247 == _2046;
    assign _3825 = _3814 ? _452 : _3823;
    assign _3826 = _3825 == _141;
    assign _3842 = _471 ? _3841 : _3826;
    assign _3843 = _460 & _3842;
    assign _3844 = ~ _3843;
    assign _3810 = g_left_0 == _2882;
    assign _3807 = 6'b000000;
    assign _3808 = g_left_0 == _3807;
    assign _3811 = _2927 ? _3810 : _3808;
    assign _3803 = g_cnt_0 + _4178;
    assign _3804 = _3803 == _682;
    assign _3801 = g_cnt_0 == _682;
    assign _3805 = _684 ? _3804 : _3801;
    assign _3799 = ~ _481;
    assign _3800 = _435 & _3799;
    assign _3806 = _3800 & _3805;
    assign _3812 = _3806 & _3811;
    assign _3845 = _3812 & _3844;
    assign _3847 = _3845 ? _1961 : _3798;
    assign _3849 = _481 ? _2539 : _3847;
    assign _3795 = _720 ? _3793 : _1961;
    assign _3791 = _364 & _362;
    assign _3793 = _3791 ? _2046 : g_mode_0;
    assign _3796 = _712 ? _3795 : _3793;
    assign _3072 = _720 ? _3071 : _2983;
    assign _3073 = _712 ? _3072 : _2983;
    assign _139 = _3073;
    always @(posedge _310) begin
        if (_308)
            _2983 <= _1817;
        else
            _2983 <= _139;
    end
    assign _3717 = ~ _3071;
    assign _3715 = ~ f_lane0_out;
    assign _3716 = _3071 ? f_lane0_out : _3715;
    always @* begin
        case (_263)
        0:
            _3718 <= _3071;
        1:
            _3718 <= _3716;
        2:
            _3718 <= _3717;
        default:
            _3718 <= _3071;
        endcase
    end
    assign _141 = host_lane0_stuff_len;
    assign _3699 = g_run_0 + _482;
    assign _3700 = _471 ? _3699 : _452;
    assign _3695 = g_run_0 + _482;
    assign _3691 = _471 == g_last_0;
    assign _3689 = g_run_0 == _452;
    assign _3690 = ~ _3689;
    assign _3692 = _3690 & _3691;
    assign _3696 = _3692 ? _3695 : _482;
    assign _3687 = _247 == _2046;
    assign _3701 = _3687 ? _3700 : _3696;
    assign _3702 = _481 ? _3685 : _3701;
    assign _3681 = g_run_0 + _482;
    assign _3682 = _3071 ? _3681 : _452;
    assign _3677 = g_run_0 + _482;
    assign _3068 = _3060[7:7];
    assign _3067 = _3060[6:6];
    assign _3066 = _3060[5:5];
    assign _3065 = _3060[4:4];
    assign _3064 = _3060[3:3];
    assign _3063 = _3060[2:2];
    assign _3062 = _3060[1:1];
    assign _3058 = _3050[7:7];
    assign _3057 = _3050[6:6];
    assign _3056 = _3050[5:5];
    assign _3055 = _3050[4:4];
    assign _3054 = _3050[3:3];
    assign _3053 = _3050[2:2];
    assign _3052 = _3050[1:1];
    assign _3044 = _3000 == _2464;
    assign _3045 = _2997 & _3044;
    always @(posedge _310) begin
        if (_308)
            _3046 <= _755;
        else
            if (_3045)
                _3046 <= _2990;
    end
    assign _3038 = _3000 == _1863;
    assign _3039 = _2997 & _3038;
    always @(posedge _310) begin
        if (_308)
            _3040 <= _755;
        else
            if (_3039)
                _3040 <= _2990;
    end
    assign _3032 = _3000 == _1864;
    assign _3033 = _2997 & _3032;
    always @(posedge _310) begin
        if (_308)
            _3034 <= _755;
        else
            if (_3033)
                _3034 <= _2990;
    end
    assign _3026 = _3000 == _455;
    assign _3027 = _2997 & _3026;
    always @(posedge _310) begin
        if (_308)
            _3028 <= _755;
        else
            if (_3027)
                _3028 <= _2990;
    end
    assign _3020 = _3000 == _1867;
    assign _3021 = _2997 & _3020;
    always @(posedge _310) begin
        if (_308)
            _3022 <= _755;
        else
            if (_3021)
                _3022 <= _2990;
    end
    assign _3014 = _3000 == _454;
    assign _3015 = _2997 & _3014;
    always @(posedge _310) begin
        if (_308)
            _3016 <= _755;
        else
            if (_3015)
                _3016 <= _2990;
    end
    assign _3008 = _3000 == _482;
    assign _3009 = _2997 & _3008;
    always @(posedge _310) begin
        if (_308)
            _3010 <= _755;
        else
            if (_3009)
                _3010 <= _2990;
    end
    assign _3075 = _3000 + _482;
    assign _3076 = _2997 ? _3075 : _3000;
    assign _142 = _3076;
    always @(posedge _310) begin
        if (_308)
            _3000 <= _452;
        else
            _3000 <= _142;
    end
    assign _3002 = _3000 == _452;
    assign _3003 = _2997 & _3002;
    assign _3143 = _693 ? _3142 : g_byte_0;
    assign _3144 = _699 ? _3142 : _3143;
    assign _3094 = _3093 ? _3091 : _3081;
    assign _3092 = _3078 ? _3091 : _3081;
    assign _3095 = _839 ? _3094 : _3092;
    assign _143 = _3095;
    always @(posedge _310) begin
        if (_308)
            _3081 <= _755;
        else
            _3081 <= _143;
    end
    assign _3090 = _793 ? _3089 : g_byte;
    assign _3091 = _799 ? _3089 : _3090;
    assign _3136 = _768 ? _3081 : _3091;
    assign _3103 = _3102 ? _1181 : _3100;
    assign _3101 = _3097 ? _1181 : _3100;
    assign _3104 = _1725 ? _3103 : _3101;
    assign _144 = _3104;
    always @(posedge _310) begin
        if (_308)
            _3100 <= _755;
        else
            _3100 <= _144;
    end
    assign _3121 = _1181[6:0];
    assign _3122 = { _3121,
                     _3118 };
    assign _3119 = _1181[7:1];
    assign _3117 = _901[7:7];
    assign _3116 = _901[6:6];
    assign _3115 = _901[5:5];
    assign _3114 = _901[4:4];
    assign _3113 = _901[3:3];
    assign _3112 = _901[2:2];
    assign _3111 = _901[1:1];
    assign _3110 = _901[0:0];
    assign _3108 = _1267[102:100];
    assign _3107 = _1261[102:100];
    assign _3106 = _1255[102:100];
    assign _3105 = _897[102:100];
    always @* begin
        case (f_winner)
        0:
            _3109 <= _3105;
        1:
            _3109 <= _3106;
        2:
            _3109 <= _3107;
        default:
            _3109 <= _3108;
        endcase
    end
    always @* begin
        case (_3109)
        0:
            _3118 <= _3110;
        1:
            _3118 <= _3111;
        2:
            _3118 <= _3112;
        3:
            _3118 <= _3113;
        4:
            _3118 <= _3114;
        5:
            _3118 <= _3115;
        6:
            _3118 <= _3116;
        default:
            _3118 <= _3117;
        endcase
    end
    assign _3120 = { _3118,
                     _3119 };
    always @* begin
        case (_1715)
        0:
            _3123 <= _1181;
        1:
            _3123 <= _3120;
        2:
            _3123 <= _3122;
        default:
            _3123 <= _1181;
        endcase
    end
    assign _3124 = _1701 ? _3123 : _1181;
    assign _145 = _3124;
    always @(posedge _310) begin
        if (_308)
            _1181 <= _755;
        else
            _1181 <= _145;
    end
    assign _3102 = _870 & _1718;
    assign _3128 = _3102 ? _870 : _1817;
    assign _3096 = ~ _870;
    assign _3097 = _3096 & _1718;
    assign _3126 = _3097 ? _1819 : _870;
    assign _1712 = _1267[97:96];
    assign _1711 = _1261[97:96];
    assign _1710 = _1255[97:96];
    assign _1709 = _897[97:96];
    always @* begin
        case (f_winner)
        0:
            _1713 <= _1709;
        1:
            _1713 <= _1710;
        2:
            _1713 <= _1711;
        default:
            _1713 <= _1712;
        endcase
    end
    assign _1715 = _881 ? _2539 : _1713;
    assign f_eng_push = _1715 == _1961;
    assign _1718 = _1701 & f_eng_push;
    assign _1724 = _870 | _1718;
    assign _1721 = _768 | _835;
    assign _1722 = ~ _1721;
    assign _1720 = ~ _735;
    assign _1723 = _1720 & _1722;
    assign _1725 = _1723 & _1724;
    assign _3129 = _1725 ? _3128 : _3126;
    assign _146 = _3129;
    always @(posedge _310) begin
        if (_308)
            _870 <= _1817;
        else
            _870 <= _146;
    end
    assign _3135 = _870 ? _3100 : _1181;
    assign _3093 = _768 & _835;
    assign _3133 = _3093 ? _768 : _1817;
    assign _833 = ~ _799;
    assign _827 = g_bitpos + _482;
    assign _822 = ~ _621;
    assign g_tx_bit_0 = _812 & _820;
    assign _823 = g_tx_bit_0 & _822;
    assign _824 = _823 & g_data_left;
    assign _825 = _793 | _824;
    assign _828 = _825 ? _827 : g_bitpos;
    assign _830 = _828 == _452;
    assign _831 = ~ _830;
    assign _802 = _801 & _210;
    assign _832 = _802 & _831;
    assign _834 = _832 & _833;
    assign _798 = g_bitpos == _2464;
    assign _799 = _793 & _798;
    assign _835 = _799 | _834;
    assign _3077 = ~ _768;
    assign _3078 = _3077 & _835;
    assign _3131 = _3078 ? _1819 : _768;
    assign _3134 = _839 ? _3133 : _3131;
    assign _147 = _3134;
    always @(posedge _310) begin
        if (_308)
            _768 <= _1817;
        else
            _768 <= _147;
    end
    assign _838 = _768 | _835;
    assign _837 = ~ _735;
    assign _839 = _837 & _838;
    assign _3137 = _839 ? _3136 : _3135;
    assign _3145 = _735 ? _3144 : _3137;
    assign _148 = _3145;
    assign _149 = _148;
    assign _151 = host_tx_data;
    assign _2990 = _274 ? _149 : _151;
    always @(posedge _310) begin
        if (_308)
            _3004 <= _755;
        else
            if (_3003)
                _3004 <= _2990;
    end
    assign _3521 = _2989 + _482;
    assign _3518 = ~ _1184;
    assign _1812 = ~ _1184;
    assign _803 = ~ _210;
    assign _3508 = ~ _208;
    assign _3509 = _210 & _3508;
    assign _3512 = _3509 ? _2045 : _2046;
    assign _3501 = ~ _820;
    assign _3502 = _812 & _3501;
    assign _3503 = _645 | _3502;
    assign _3504 = _3503 | _3493;
    assign _3506 = _3504 ? _2046 : _3500;
    assign _3487 = g_run + _482;
    assign _3484 = g_run + _482;
    assign _3480 = vdd == g_last;
    assign _3478 = g_run == _452;
    assign _3479 = ~ _3478;
    assign _3481 = _3479 & _3480;
    assign _3485 = _3481 ? _3484 : _482;
    assign _3476 = _188 == _2046;
    assign _3488 = _3476 ? _3487 : _3485;
    assign _3489 = _3488 == _154;
    assign _3470 = g_run + _482;
    assign _3466 = gnd == g_last;
    assign _3464 = g_run == _452;
    assign _3465 = ~ _3464;
    assign _3467 = _3465 & _3466;
    assign _3471 = _3467 ? _3470 : _482;
    assign _3462 = _188 == _2046;
    assign _3473 = _3462 ? _452 : _3471;
    assign _3474 = _3473 == _154;
    assign _3490 = _627 ? _3489 : _3474;
    assign _3491 = _616 & _3490;
    assign _3492 = ~ _3491;
    assign _3458 = g_left == _2882;
    assign _3456 = g_left == _3807;
    assign _3459 = _2867 ? _3458 : _3456;
    assign _3451 = g_cnt + _4178;
    assign _3452 = _3451 == _782;
    assign _3449 = g_cnt == _782;
    assign _3453 = _784 ? _3452 : _3449;
    assign _3447 = ~ _636;
    assign _3448 = _591 & _3447;
    assign _3454 = _3448 & _3453;
    assign _3460 = _3454 & _3459;
    assign _3493 = _3460 & _3492;
    assign _3495 = _3493 ? _1961 : _3446;
    assign _3497 = _636 ? _2539 : _3495;
    assign _3443 = _820 ? _3441 : _1961;
    assign _3439 = _520 & _518;
    assign _3441 = _3439 ? _2046 : g_mode;
    assign _3444 = _812 ? _3443 : _3441;
    assign _3173 = _820 ? _3172 : _3148;
    assign _3174 = _812 ? _3173 : _3148;
    assign _152 = _3174;
    always @(posedge _310) begin
        if (_308)
            _3148 <= _1817;
        else
            _3148 <= _152;
    end
    assign _3369 = ~ _3172;
    assign _3367 = ~ f_lane1_out;
    assign _3368 = _3172 ? f_lane1_out : _3367;
    always @* begin
        case (_204)
        0:
            _3370 <= _3172;
        1:
            _3370 <= _3368;
        2:
            _3370 <= _3369;
        default:
            _3370 <= _3172;
        endcase
    end
    assign _154 = host_lane1_stuff_len;
    assign _3351 = g_run + _482;
    assign _3352 = _627 ? _3351 : _452;
    assign _3347 = g_run + _482;
    assign _3343 = _627 == g_last;
    assign _3341 = g_run == _452;
    assign _3342 = ~ _3341;
    assign _3344 = _3342 & _3343;
    assign _3348 = _3344 ? _3347 : _482;
    assign _3339 = _188 == _2046;
    assign _3353 = _3339 ? _3352 : _3348;
    assign _3354 = _636 ? _3337 : _3353;
    assign _3333 = g_run + _482;
    assign _3334 = _3172 ? _3333 : _452;
    assign _3329 = g_run + _482;
    assign _3169 = _3161[7:7];
    assign _3168 = _3161[6:6];
    assign _3167 = _3161[5:5];
    assign _3166 = _3161[4:4];
    assign _3165 = _3161[3:3];
    assign _3164 = _3161[2:2];
    assign _3163 = _3161[1:1];
    assign _3159 = _3151[7:7];
    assign _3158 = _3151[6:6];
    assign _3157 = _3151[5:5];
    assign _3156 = _3151[4:4];
    assign _3155 = _3151[3:3];
    assign _3154 = _3151[2:2];
    assign _3153 = _3151[1:1];
    assign _3150 = _1184 ? _757 : _3047;
    assign _3087 = g_byte[7:1];
    assign _3088 = { _627,
                     _3087 };
    assign _3085 = g_byte[6:0];
    assign _3086 = { _3085,
                     _627 };
    assign _3089 = _157 ? _3088 : _3086;
    assign _3179 = _793 ? _3089 : _3178;
    assign _3180 = _784 ? _3179 : _3178;
    assign _3181 = _769 ? _3180 : _3178;
    assign _3182 = _636 ? _3178 : _3181;
    assign _3175 = g_data_left ? _3151 : g_byte;
    assign _3176 = _621 ? g_byte : _3175;
    assign _3177 = _820 ? _3176 : g_byte;
    assign _3178 = _812 ? _3177 : g_byte;
    assign _3183 = _591 ? _3182 : _3178;
    assign _155 = _3183;
    always @(posedge _310) begin
        if (_308)
            g_byte <= _755;
        else
            g_byte <= _155;
    end
    assign _1809 = g_bitpos == _452;
    assign _1806 = ~ _621;
    assign _1807 = _1806 & g_data_left;
    assign _1810 = _1807 & _1809;
    assign _3151 = _1810 ? _3150 : g_byte;
    assign _3152 = _3151[0:0];
    assign _3160 = { _3152,
                     _3153,
                     _3154,
                     _3155,
                     _3156,
                     _3157,
                     _3158,
                     _3159 };
    assign _157 = host_lane1_lsb_first;
    assign _3161 = _157 ? _3151 : _3160;
    assign _3162 = _3161[0:0];
    assign _3191 = g_bitpos + _482;
    assign _789 = g_cnt[5:0];
    assign _790 = _789 < _176;
    assign _791 = ~ _790;
    assign _785 = g_cnt[15:6];
    assign _787 = _785 == _2013;
    assign _788 = ~ _787;
    assign _792 = _788 | _791;
    assign _793 = _784 & _792;
    assign _3192 = _793 ? _3191 : _3189;
    assign _3193 = _784 ? _3192 : _3189;
    assign _3194 = _769 ? _3193 : _3189;
    assign _3195 = _636 ? _3189 : _3194;
    assign _3185 = g_bitpos + _482;
    assign _3186 = g_data_left ? _3185 : g_bitpos;
    assign _3187 = _621 ? g_bitpos : _3186;
    assign _3188 = _820 ? _3187 : g_bitpos;
    assign _3189 = _812 ? _3188 : g_bitpos;
    assign _3196 = _591 ? _3195 : _3189;
    assign _3198 = _493 ? _452 : _3196;
    assign _158 = _3198;
    always @(posedge _310) begin
        if (_308)
            g_bitpos <= _452;
        else
            g_bitpos <= _158;
    end
    always @* begin
        case (g_bitpos)
        0:
            _3170 <= _3162;
        1:
            _3170 <= _3163;
        2:
            _3170 <= _3164;
        3:
            _3170 <= _3165;
        4:
            _3170 <= _3166;
        5:
            _3170 <= _3167;
        6:
            _3170 <= _3168;
        default:
            _3170 <= _3169;
        endcase
    end
    assign _160 = host_lane1_crc_inv;
    assign _162 = host_lane1_init;
    assign _3240 = g_crc[30:0];
    assign _3242 = { _3240,
                     _1817 };
    assign _3234 = g_crc[31:31];
    assign _3235 = _627 ^ _3234;
    assign _3237 = _3235 ? _167 : _2089;
    assign _3231 = g_crc[30:0];
    assign _3233 = { _3231,
                     _1817 };
    assign _3238 = _3233 ^ _3237;
    assign _3239 = _784 ? _3238 : _3230;
    assign _164 = host_lane1_crc_width;
    assign _3208 = g_left - _2882;
    assign _3209 = _2867 ? _3208 : _3206;
    assign _3210 = _769 ? _3209 : _3206;
    assign _3211 = _636 ? _3206 : _3210;
    assign _3202 = g_left - _2882;
    assign _3203 = g_data_left ? g_left : _3202;
    assign _3204 = _621 ? g_left : _3203;
    assign _3205 = _820 ? _3204 : g_left;
    assign _3206 = _812 ? _3205 : g_left;
    assign _3212 = _591 ? _3211 : _3206;
    assign _3213 = _3200 ? _164 : _3212;
    assign _3215 = _493 ? _3807 : _3213;
    assign _165 = _3215;
    always @(posedge _310) begin
        if (_308)
            g_left <= _3807;
        else
            g_left <= _165;
    end
    assign _818 = g_left == _3807;
    assign _819 = ~ _818;
    assign _2865 = ~ g_data_left;
    assign _2864 = _591 & _769;
    assign _2866 = _2864 & _2865;
    assign _2867 = _2866 & _819;
    assign _3243 = _2867 ? _3242 : _3239;
    assign _3244 = _769 ? _3243 : _3230;
    assign _3245 = _636 ? _3230 : _3244;
    assign _167 = host_lane1_poly;
    assign _3222 = g_crc[31:31];
    assign _3223 = _3172 ^ _3222;
    assign _3225 = _3223 ? _167 : _2089;
    assign _3219 = g_crc[30:0];
    assign _3221 = { _3219,
                     _1817 };
    assign _3226 = _3221 ^ _3225;
    assign _3216 = g_crc[30:0];
    assign _3218 = { _3216,
                     _1817 };
    assign _3227 = g_data_left ? _3226 : _3218;
    assign _3228 = _621 ? g_crc : _3227;
    assign _3229 = _820 ? _3228 : g_crc;
    assign _3230 = _812 ? _3229 : g_crc;
    assign _3246 = _591 ? _3245 : _3230;
    assign _3247 = _493 ? _162 : _3246;
    assign _3249 = _491 ? _2089 : _3247;
    assign _168 = _3249;
    always @(posedge _310) begin
        if (_308)
            g_crc <= _2089;
        else
            g_crc <= _168;
    end
    assign _2871 = g_crc[31:31];
    assign _2872 = _2871 ^ _160;
    assign _3265 = _3264 ? _3262 : g_lim;
    assign _3266 = g_len_cap ? _3265 : g_lim;
    assign _169 = _3266;
    always @(posedge _310) begin
        if (_308)
            g_lim <= _755;
        else
            g_lim <= _169;
    end
    assign _781 = { _755,
                    g_lim };
    assign _171 = host_lane1_frame_bits;
    assign _2846 = g_sr[14:0];
    assign _2847 = { _2846,
                     _627 };
    assign _3267 = _769 ? _2847 : g_sr;
    assign _3268 = _636 ? g_sr : _3267;
    assign _3269 = _591 ? _3268 : g_sr;
    assign _3271 = _493 ? _1683 : _3269;
    assign _172 = _3271;
    always @(posedge _310) begin
        if (_308)
            g_sr <= _1683;
        else
            g_sr <= _172;
    end
    assign _3257 = g_sr[3:0];
    assign _174 = host_lane1_len_max;
    assign _3258 = _174 < _3257;
    assign _3259 = _3258 ? _174 : _3257;
    assign _3261 = { _1817,
                     _3259,
                     _452 };
    assign _176 = host_lane1_skip;
    assign _3255 = { _2539,
                     _176 };
    assign _3262 = _3255 + _3261;
    assign _3263 = { _755,
                     _3262 };
    assign _3264 = _3263 < _171;
    assign _3290 = _3264 ? _1819 : g_len_known;
    assign _178 = host_lane1_len_pos;
    assign _3276 = g_cnt[5:0];
    assign _3277 = _3276 == _178;
    assign _3272 = g_cnt[15:6];
    assign _3274 = _3272 == _2013;
    assign _180 = host_lane1_len_en;
    assign _3275 = _180 & _3274;
    assign _3278 = _3275 & _3277;
    assign _3280 = _3278 ? _1819 : g_len_cap;
    assign _3281 = _784 ? _3280 : g_len_cap;
    assign _3282 = _769 ? _3281 : g_len_cap;
    assign _3283 = _636 ? g_len_cap : _3282;
    assign _3284 = _591 ? _3283 : g_len_cap;
    assign _3286 = g_len_cap ? _1817 : _3284;
    assign _3288 = _493 ? _1817 : _3286;
    assign _181 = _3288;
    always @(posedge _310) begin
        if (_308)
            g_len_cap <= _1817;
        else
            g_len_cap <= _181;
    end
    assign _3291 = g_len_cap ? _3290 : g_len_known;
    assign _3293 = _493 ? _1817 : _3291;
    assign _182 = _3293;
    always @(posedge _310) begin
        if (_308)
            g_len_known <= _1817;
        else
            g_len_known <= _182;
    end
    assign _782 = g_len_known ? _781 : _171;
    assign _3313 = g_cnt + _4178;
    assign _770 = _591 & _769;
    assign _784 = _770 & g_data_left;
    assign _3314 = _784 ? _3313 : _3311;
    assign _769 = ~ _621;
    assign _3315 = _769 ? _3314 : _3311;
    assign _3296 = _636 ? _3295 : _627;
    assign _3294 = _820 ? _3172 : g_last;
    assign _3295 = _812 ? _3294 : g_last;
    assign _3297 = _591 ? _3296 : _3295;
    assign _3299 = _493 ? _1819 : _3297;
    assign _183 = _3299;
    always @(posedge _310) begin
        if (_308)
            g_last <= vdd;
        else
            g_last <= _183;
    end
    assign _632 = ~ g_last;
    assign _629 = _188 == _2045;
    assign _633 = _629 ? _632 : gnd;
    assign _3301 = _204 == _2045;
    assign _3302 = _3301 ? _511 : g_prev;
    assign _3303 = _591 ? _3302 : g_prev;
    assign _3305 = _493 ? _1819 : _3303;
    assign _184 = _3305;
    always @(posedge _310) begin
        if (_308)
            g_prev <= vdd;
        else
            g_prev <= _184;
    end
    assign _626 = _511 == g_prev;
    assign _623 = _204 == _2045;
    assign _627 = _623 ? _626 : _511;
    assign _634 = _627 == _633;
    assign _635 = ~ _634;
    assign _636 = _621 & _635;
    assign _3316 = _636 ? _3311 : _3315;
    assign _3307 = g_cnt + _4178;
    assign _3308 = g_data_left ? _3307 : g_cnt;
    assign _3309 = _621 ? g_cnt : _3308;
    assign _3310 = _820 ? _3309 : g_cnt;
    assign _3311 = _812 ? _3310 : g_cnt;
    assign _3317 = _591 ? _3316 : _3311;
    assign _3319 = _493 ? _1683 : _3317;
    assign _185 = _3319;
    always @(posedge _310) begin
        if (_308)
            g_cnt <= _1683;
        else
            g_cnt <= _185;
    end
    assign g_data_left = g_cnt < _782;
    assign _3171 = g_data_left ? _3170 : _2872;
    assign _3172 = _621 ? _633 : _3171;
    assign _3325 = _3172 == g_last;
    assign _3323 = g_run == _452;
    assign _3324 = ~ _3323;
    assign _3326 = _3324 & _3325;
    assign _3330 = _3326 ? _3329 : _482;
    assign _3321 = _188 == _2046;
    assign _3335 = _3321 ? _3334 : _3330;
    assign _3336 = _820 ? _3335 : g_run;
    assign _3337 = _812 ? _3336 : g_run;
    assign _3355 = _591 ? _3354 : _3337;
    assign _3357 = _493 ? _452 : _3355;
    assign _186 = _3357;
    always @(posedge _310) begin
        if (_308)
            g_run <= _452;
        else
            g_run <= _186;
    end
    assign _620 = g_run == _154;
    assign _188 = host_lane1_stuff;
    assign _615 = _188 == _2539;
    assign _616 = ~ _615;
    assign _621 = _616 & _620;
    assign _813 = _621 | g_data_left;
    assign _820 = _813 | _819;
    assign _3371 = _820 ? _3370 : _1819;
    assign _3372 = _812 ? _3371 : f_lane1_out;
    assign _808 = _564 == _1683;
    assign _806 = _529 == _1683;
    assign _809 = _557 ? _808 : _806;
    assign _810 = _525 ? vdd : _809;
    assign _811 = _208 ? _589 : _810;
    assign _3364 = ~ _811;
    assign _3361 = _204 == _2046;
    assign _3358 = ~ _210;
    assign _3359 = _498 & _3358;
    assign _3362 = _3359 & _3361;
    assign _3363 = _3362 & _590;
    assign _3365 = _3363 & _3364;
    assign _3373 = _3365 ? _3148 : _3372;
    assign _3375 = _606 ? _1819 : _3373;
    assign _3377 = _801 ? _1819 : _3375;
    assign _3379 = _493 ? _1819 : _3377;
    assign _3381 = _491 ? _1819 : _3379;
    assign _189 = _3381;
    always @(posedge _310) begin
        if (_308)
            f_lane1_out <= vdd;
        else
            f_lane1_out <= _189;
    end
    assign _604 = _511 == f_lane1_out;
    assign _605 = ~ _604;
    assign _598 = _204 == _2046;
    assign _599 = ~ _598;
    assign _595 = ~ _208;
    assign _191 = host_lane1_readback;
    assign _592 = ~ _210;
    assign _593 = _498 & _592;
    assign _594 = _593 & _191;
    assign _596 = _594 & _595;
    assign _600 = _596 & _599;
    assign _601 = _600 & _590;
    assign _606 = _601 & _605;
    assign _3446 = _606 ? _2539 : _3444;
    assign _587 = ~ _581;
    assign _588 = _584 & _587;
    always @(posedge _310) begin
        if (_308)
            _584 <= _1817;
        else
            _584 <= _581;
    end
    assign _585 = ~ _584;
    assign _577 = _343[7:7];
    assign _576 = _343[6:6];
    assign _575 = _343[5:5];
    assign _574 = _343[4:4];
    assign _573 = _343[3:3];
    assign _572 = _343[2:2];
    assign _571 = _343[1:1];
    assign _570 = _343[0:0];
    assign _193 = host_lane1_clk_pin;
    always @* begin
        case (_193)
        0:
            _578 <= _570;
        1:
            _578 <= _571;
        2:
            _578 <= _572;
        3:
            _578 <= _573;
        4:
            _578 <= _574;
        5:
            _578 <= _575;
        6:
            _578 <= _576;
        default:
            _578 <= _577;
        endcase
    end
    always @(posedge _310) begin
        if (_308)
            _581 <= _1817;
        else
            _581 <= _578;
    end
    assign _586 = _581 & _585;
    assign _195 = host_lane1_clk_edge;
    assign _589 = _195 ? _588 : _586;
    assign _568 = _553 == _1683;
    assign _565 = _564 == _553;
    assign _558 = _529 == _553;
    assign _556 = ~ _520;
    assign _547 = _197[15:2];
    assign _548 = { _2539,
                    _547 };
    assign _544 = _197[15:1];
    assign _545 = { _1817,
                    _544 };
    assign _549 = _545 + _548;
    assign _541 = _197[15:1];
    assign _542 = { _1817,
                    _541 };
    assign _539 = _210 & _522;
    assign _550 = _539 ? _549 : _542;
    always @(posedge _310) begin
        if (_308)
            _553 <= _1683;
        else
            _553 <= _550;
    end
    assign _554 = _529 < _553;
    assign _531 = _197[15:2];
    assign _532 = { _2539,
                    _531 };
    always @(posedge _310) begin
        if (_308)
            _535 <= _1683;
        else
            _535 <= _532;
    end
    assign _3427 = ~ _520;
    assign _3428 = _555 & _3427;
    assign _3429 = _3428 ? _564 : _529;
    assign _3431 = _525 ? _1683 : _3429;
    assign _3433 = _3431 + _4178;
    assign _3411 = _3405 == _1640;
    assign _560 = _197[15:1];
    assign _561 = { _1817,
                    _560 };
    always @(posedge _310) begin
        if (_308)
            _564 <= _1683;
        else
            _564 <= _561;
    end
    assign _3407 = { gnd,
                     _564 };
    assign _3408 = _3407 == _3405;
    assign _3401 = { gnd,
                     _197 };
    always @(posedge _310) begin
        if (_308)
            _3404 <= _1640;
        else
            _3404 <= _3401;
    end
    assign _3396 = 17'b00000000000000001;
    assign _197 = host_lane1_div_int;
    assign _3395 = { gnd,
                     _197 };
    assign _3397 = _3395 - _3396;
    always @(posedge _310) begin
        if (_308)
            _3400 <= _1640;
        else
            _3400 <= _3397;
    end
    assign _199 = host_lane1_div_frac;
    assign _3415 = { gnd,
                     _199 };
    assign _3417 = _3416[7:0];
    assign _3418 = _3413 ? _3417 : _3389;
    assign _3419 = _3386 ? _3418 : _3389;
    assign _3421 = _493 ? _755 : _3419;
    assign _200 = _3421;
    always @(posedge _310) begin
        if (_308)
            _3389 <= _755;
        else
            _3389 <= _200;
    end
    assign _3414 = { gnd,
                     _3389 };
    assign _3416 = _3414 + _3415;
    assign _3422 = _3416[8:8];
    assign _3423 = _3413 ? _3422 : _3394;
    assign _3424 = _3386 ? _3423 : _3394;
    assign _3426 = _493 ? _1817 : _3424;
    assign _201 = _3426;
    always @(posedge _310) begin
        if (_308)
            _3394 <= _1817;
        else
            _3394 <= _201;
    end
    assign _3405 = _3394 ? _3404 : _3400;
    assign _3391 = { gnd,
                     _529 };
    assign _3406 = _3391 == _3405;
    assign _3409 = _557 ? _3408 : _3406;
    assign _3412 = _525 ? _3411 : _3409;
    assign _3390 = ~ _208;
    assign _3413 = _3390 & _3412;
    assign _3435 = _3413 ? _1683 : _3433;
    assign _3385 = ~ _208;
    assign _3383 = _520 & _518;
    assign _645 = g_mode == _1961;
    assign _3382 = _498 | _645;
    assign _3384 = _3382 | _3383;
    assign _3386 = _3384 & _3385;
    assign _3436 = _3386 ? _3435 : _529;
    assign _3438 = _493 ? _1683 : _3436;
    assign _202 = _3438;
    always @(posedge _310) begin
        if (_308)
            _529 <= _1683;
        else
            _529 <= _202;
    end
    assign _536 = _529 < _535;
    assign _537 = ~ _536;
    assign _526 = _518 & _522;
    assign _538 = _526 & _537;
    assign _555 = _538 & _554;
    assign _557 = _555 & _556;
    assign _566 = _557 ? _565 : _558;
    assign _204 = host_lane1_code;
    assign _522 = _204 == _2046;
    assign _523 = ~ _522;
    assign _520 = g_mode == _2045;
    assign _524 = _520 | _523;
    assign _517 = ~ _208;
    always @(posedge _310) begin
        if (_308)
            _514 <= _1817;
        else
            _514 <= _511;
    end
    assign _507 = _343[7:7];
    assign _506 = _343[6:6];
    assign _505 = _343[5:5];
    assign _504 = _343[4:4];
    assign _503 = _343[3:3];
    assign _502 = _343[2:2];
    assign _501 = _343[1:1];
    assign _500 = _343[0:0];
    assign _206 = host_lane1_data_pin;
    always @* begin
        case (_206)
        0:
            _508 <= _500;
        1:
            _508 <= _501;
        2:
            _508 <= _502;
        3:
            _508 <= _503;
        4:
            _508 <= _504;
        5:
            _508 <= _505;
        6:
            _508 <= _506;
        default:
            _508 <= _507;
        endcase
    end
    always @(posedge _310) begin
        if (_308)
            _511 <= _1817;
        else
            _511 <= _508;
    end
    assign _515 = _511 ^ _514;
    assign _516 = _210 & _515;
    assign _518 = _516 & _517;
    assign _525 = _518 & _524;
    assign _569 = _525 ? _568 : _566;
    assign _208 = host_lane1_clk_pin_en;
    assign _590 = _208 ? _589 : _569;
    assign _210 = host_lane1_dir;
    assign _499 = _498 & _210;
    assign _591 = _499 & _590;
    assign _3498 = _591 ? _3497 : _3446;
    assign _801 = _270 == _1863;
    assign _3500 = _801 ? _2539 : _3498;
    assign _3200 = _270 == _2464;
    assign _3507 = _3200 ? _3506 : _3500;
    assign _493 = _270 == _1864;
    assign _3513 = _493 ? _3512 : _3507;
    assign _490 = _270 == _455;
    assign _491 = _490 | _317;
    assign _3515 = _491 ? _2539 : _3513;
    assign _211 = _3515;
    always @(posedge _310) begin
        if (_308)
            g_mode <= _2539;
        else
            g_mode <= _211;
    end
    assign _498 = g_mode == _2046;
    assign _804 = _498 & _803;
    assign _812 = _804 & _811;
    assign _1811 = _812 & _1810;
    assign _1813 = _1811 & _1812;
    assign _1804 = ~ _1184;
    assign _1803 = _712 & _1802;
    assign _1805 = _1803 & _1804;
    assign _1814 = _1805 | _1813;
    assign _1795 = _1791 == _2046;
    assign _1793 = _1791 == _2045;
    assign _1796 = _1793 | _1795;
    assign _3516 = _1701 & _1796;
    assign _3517 = _3516 | _1814;
    assign _212 = _3517;
    assign _3519 = _212 & _3518;
    assign _3522 = _3519 ? _3521 : _2989;
    assign _213 = _3522;
    always @(posedge _310) begin
        if (_308)
            _2989 <= _452;
        else
            _2989 <= _213;
    end
    always @* begin
        case (_2989)
        0:
            _3047 <= _3004;
        1:
            _3047 <= _3010;
        2:
            _3047 <= _3016;
        3:
            _3047 <= _3022;
        4:
            _3047 <= _3028;
        5:
            _3047 <= _3034;
        6:
            _3047 <= _3040;
        default:
            _3047 <= _3046;
        endcase
    end
    assign _3049 = _1184 ? _757 : _3047;
    assign _3140 = g_byte_0[7:1];
    assign _3141 = { _471,
                     _3140 };
    assign _3138 = g_byte_0[6:0];
    assign _3139 = { _3138,
                     _471 };
    assign _3142 = _216 ? _3141 : _3139;
    assign _3527 = _693 ? _3142 : _3526;
    assign _3528 = _684 ? _3527 : _3526;
    assign _3529 = _669 ? _3528 : _3526;
    assign _3530 = _481 ? _3526 : _3529;
    assign _3523 = g_data_left_0 ? _3050 : g_byte_0;
    assign _3524 = _465 ? g_byte_0 : _3523;
    assign _3525 = _720 ? _3524 : g_byte_0;
    assign _3526 = _712 ? _3525 : g_byte_0;
    assign _3531 = _435 ? _3530 : _3526;
    assign _214 = _3531;
    always @(posedge _310) begin
        if (_308)
            g_byte_0 <= _755;
        else
            g_byte_0 <= _214;
    end
    assign _1801 = g_bitpos_0 == _452;
    assign _1798 = ~ _465;
    assign _1799 = _1798 & g_data_left_0;
    assign _1802 = _1799 & _1801;
    assign _3050 = _1802 ? _3049 : g_byte_0;
    assign _3051 = _3050[0:0];
    assign _3059 = { _3051,
                     _3052,
                     _3053,
                     _3054,
                     _3055,
                     _3056,
                     _3057,
                     _3058 };
    assign _216 = host_lane0_lsb_first;
    assign _3060 = _216 ? _3050 : _3059;
    assign _3061 = _3060[0:0];
    assign _3539 = g_bitpos_0 + _482;
    assign _3540 = _693 ? _3539 : _3537;
    assign _3541 = _684 ? _3540 : _3537;
    assign _3542 = _669 ? _3541 : _3537;
    assign _3543 = _481 ? _3537 : _3542;
    assign _3533 = g_bitpos_0 + _482;
    assign _3534 = g_data_left_0 ? _3533 : g_bitpos_0;
    assign _3535 = _465 ? g_bitpos_0 : _3534;
    assign _3536 = _720 ? _3535 : g_bitpos_0;
    assign _3537 = _712 ? _3536 : g_bitpos_0;
    assign _3544 = _435 ? _3543 : _3537;
    assign _3546 = _333 ? _452 : _3544;
    assign _217 = _3546;
    always @(posedge _310) begin
        if (_308)
            g_bitpos_0 <= _452;
        else
            g_bitpos_0 <= _217;
    end
    always @* begin
        case (g_bitpos_0)
        0:
            _3069 <= _3061;
        1:
            _3069 <= _3062;
        2:
            _3069 <= _3063;
        3:
            _3069 <= _3064;
        4:
            _3069 <= _3065;
        5:
            _3069 <= _3066;
        6:
            _3069 <= _3067;
        default:
            _3069 <= _3068;
        endcase
    end
    assign _219 = host_lane0_crc_inv;
    assign _221 = host_lane0_init;
    assign _3588 = g_crc_0[30:0];
    assign _3590 = { _3588,
                     _1817 };
    assign _3582 = g_crc_0[31:31];
    assign _3583 = _471 ^ _3582;
    assign _3585 = _3583 ? _226 : _2089;
    assign _3579 = g_crc_0[30:0];
    assign _3581 = { _3579,
                     _1817 };
    assign _3586 = _3581 ^ _3585;
    assign _3587 = _684 ? _3586 : _3578;
    assign _223 = host_lane0_crc_width;
    assign _3556 = g_left_0 - _2882;
    assign _3557 = _2927 ? _3556 : _3554;
    assign _3558 = _669 ? _3557 : _3554;
    assign _3559 = _481 ? _3554 : _3558;
    assign _3550 = g_left_0 - _2882;
    assign _3551 = g_data_left_0 ? g_left_0 : _3550;
    assign _3552 = _465 ? g_left_0 : _3551;
    assign _3553 = _720 ? _3552 : g_left_0;
    assign _3554 = _712 ? _3553 : g_left_0;
    assign _3560 = _435 ? _3559 : _3554;
    assign _3561 = _3548 ? _223 : _3560;
    assign _3563 = _333 ? _3807 : _3561;
    assign _224 = _3563;
    always @(posedge _310) begin
        if (_308)
            g_left_0 <= _3807;
        else
            g_left_0 <= _224;
    end
    assign _718 = g_left_0 == _3807;
    assign _719 = ~ _718;
    assign _2925 = ~ g_data_left_0;
    assign _2924 = _435 & _669;
    assign _2926 = _2924 & _2925;
    assign _2927 = _2926 & _719;
    assign _3591 = _2927 ? _3590 : _3587;
    assign _3592 = _669 ? _3591 : _3578;
    assign _3593 = _481 ? _3578 : _3592;
    assign _226 = host_lane0_poly;
    assign _3570 = g_crc_0[31:31];
    assign _3571 = _3071 ^ _3570;
    assign _3573 = _3571 ? _226 : _2089;
    assign _3567 = g_crc_0[30:0];
    assign _3569 = { _3567,
                     _1817 };
    assign _3574 = _3569 ^ _3573;
    assign _3564 = g_crc_0[30:0];
    assign _3566 = { _3564,
                     _1817 };
    assign _3575 = g_data_left_0 ? _3574 : _3566;
    assign _3576 = _465 ? g_crc_0 : _3575;
    assign _3577 = _720 ? _3576 : g_crc_0;
    assign _3578 = _712 ? _3577 : g_crc_0;
    assign _3594 = _435 ? _3593 : _3578;
    assign _3595 = _333 ? _221 : _3594;
    assign _3597 = _331 ? _2089 : _3595;
    assign _227 = _3597;
    always @(posedge _310) begin
        if (_308)
            g_crc_0 <= _2089;
        else
            g_crc_0 <= _227;
    end
    assign _2931 = g_crc_0[31:31];
    assign _2932 = _2931 ^ _219;
    assign _3613 = _3612 ? _3610 : g_lim_0;
    assign _3614 = g_len_cap_0 ? _3613 : g_lim_0;
    assign _228 = _3614;
    always @(posedge _310) begin
        if (_308)
            g_lim_0 <= _755;
        else
            g_lim_0 <= _228;
    end
    assign _681 = { _755,
                    g_lim_0 };
    assign _230 = host_lane0_frame_bits;
    assign _2906 = g_sr_0[14:0];
    assign _2907 = { _2906,
                     _471 };
    assign _3615 = _669 ? _2907 : g_sr_0;
    assign _3616 = _481 ? g_sr_0 : _3615;
    assign _3617 = _435 ? _3616 : g_sr_0;
    assign _3619 = _333 ? _1683 : _3617;
    assign _231 = _3619;
    always @(posedge _310) begin
        if (_308)
            g_sr_0 <= _1683;
        else
            g_sr_0 <= _231;
    end
    assign _3605 = g_sr_0[3:0];
    assign _233 = host_lane0_len_max;
    assign _3606 = _233 < _3605;
    assign _3607 = _3606 ? _233 : _3605;
    assign _3609 = { _1817,
                     _3607,
                     _452 };
    assign _235 = host_lane0_skip;
    assign _3603 = { _2539,
                     _235 };
    assign _3610 = _3603 + _3609;
    assign _3611 = { _755,
                     _3610 };
    assign _3612 = _3611 < _230;
    assign _3638 = _3612 ? _1819 : g_len_known_0;
    assign _237 = host_lane0_len_pos;
    assign _3624 = g_cnt_0[5:0];
    assign _3625 = _3624 == _237;
    assign _3620 = g_cnt_0[15:6];
    assign _3622 = _3620 == _2013;
    assign _239 = host_lane0_len_en;
    assign _3623 = _239 & _3622;
    assign _3626 = _3623 & _3625;
    assign _3628 = _3626 ? _1819 : g_len_cap_0;
    assign _3629 = _684 ? _3628 : g_len_cap_0;
    assign _3630 = _669 ? _3629 : g_len_cap_0;
    assign _3631 = _481 ? g_len_cap_0 : _3630;
    assign _3632 = _435 ? _3631 : g_len_cap_0;
    assign _3634 = g_len_cap_0 ? _1817 : _3632;
    assign _3636 = _333 ? _1817 : _3634;
    assign _240 = _3636;
    always @(posedge _310) begin
        if (_308)
            g_len_cap_0 <= _1817;
        else
            g_len_cap_0 <= _240;
    end
    assign _3639 = g_len_cap_0 ? _3638 : g_len_known_0;
    assign _3641 = _333 ? _1817 : _3639;
    assign _241 = _3641;
    always @(posedge _310) begin
        if (_308)
            g_len_known_0 <= _1817;
        else
            g_len_known_0 <= _241;
    end
    assign _682 = g_len_known_0 ? _681 : _230;
    assign _3661 = g_cnt_0 + _4178;
    assign _3662 = _684 ? _3661 : _3659;
    assign _669 = ~ _465;
    assign _3663 = _669 ? _3662 : _3659;
    assign _3644 = _481 ? _3643 : _471;
    assign _3642 = _720 ? _3071 : g_last_0;
    assign _3643 = _712 ? _3642 : g_last_0;
    assign _3645 = _435 ? _3644 : _3643;
    assign _3647 = _333 ? _1819 : _3645;
    assign _242 = _3647;
    always @(posedge _310) begin
        if (_308)
            g_last_0 <= vdd;
        else
            g_last_0 <= _242;
    end
    assign _477 = ~ g_last_0;
    assign _473 = _247 == _2045;
    assign _478 = _473 ? _477 : gnd;
    assign _3649 = _263 == _2045;
    assign _3650 = _3649 ? _355 : g_prev_0;
    assign _3651 = _435 ? _3650 : g_prev_0;
    assign _3653 = _333 ? _1819 : _3651;
    assign _243 = _3653;
    always @(posedge _310) begin
        if (_308)
            g_prev_0 <= vdd;
        else
            g_prev_0 <= _243;
    end
    assign _470 = _355 == g_prev_0;
    assign _467 = _263 == _2045;
    assign _471 = _467 ? _470 : _355;
    assign _479 = _471 == _478;
    assign _480 = ~ _479;
    assign _481 = _465 & _480;
    assign _3664 = _481 ? _3659 : _3663;
    assign _3655 = g_cnt_0 + _4178;
    assign _3656 = g_data_left_0 ? _3655 : g_cnt_0;
    assign _3657 = _465 ? g_cnt_0 : _3656;
    assign _3658 = _720 ? _3657 : g_cnt_0;
    assign _3659 = _712 ? _3658 : g_cnt_0;
    assign _3665 = _435 ? _3664 : _3659;
    assign _3667 = _333 ? _1683 : _3665;
    assign _244 = _3667;
    always @(posedge _310) begin
        if (_308)
            g_cnt_0 <= _1683;
        else
            g_cnt_0 <= _244;
    end
    assign g_data_left_0 = g_cnt_0 < _682;
    assign _3070 = g_data_left_0 ? _3069 : _2932;
    assign _3071 = _465 ? _478 : _3070;
    assign _3673 = _3071 == g_last_0;
    assign _3671 = g_run_0 == _452;
    assign _3672 = ~ _3671;
    assign _3674 = _3672 & _3673;
    assign _3678 = _3674 ? _3677 : _482;
    assign _3669 = _247 == _2046;
    assign _3683 = _3669 ? _3682 : _3678;
    assign _3684 = _720 ? _3683 : g_run_0;
    assign _3685 = _712 ? _3684 : g_run_0;
    assign _3703 = _435 ? _3702 : _3685;
    assign _3705 = _333 ? _452 : _3703;
    assign _245 = _3705;
    always @(posedge _310) begin
        if (_308)
            g_run_0 <= _452;
        else
            g_run_0 <= _245;
    end
    assign _464 = g_run_0 == _141;
    assign _247 = host_lane0_stuff;
    assign _459 = _247 == _2539;
    assign _460 = ~ _459;
    assign _465 = _460 & _464;
    assign _713 = _465 | g_data_left_0;
    assign _720 = _713 | _719;
    assign _3719 = _720 ? _3718 : _1819;
    assign _703 = ~ _269;
    assign _704 = _339 & _703;
    assign _712 = _704 & _711;
    assign _3720 = _712 ? _3719 : f_lane0_out;
    assign _708 = _408 == _1683;
    assign _706 = _373 == _1683;
    assign _709 = _401 ? _708 : _706;
    assign _710 = _369 ? vdd : _709;
    assign _711 = _265 ? _433 : _710;
    assign _3712 = ~ _711;
    assign _3709 = _263 == _2046;
    assign _3706 = ~ _269;
    assign _3707 = _339 & _3706;
    assign _3710 = _3707 & _3709;
    assign _3711 = _3710 & _434;
    assign _3713 = _3711 & _3712;
    assign _3721 = _3713 ? _2983 : _3720;
    assign _3723 = _450 ? _1819 : _3721;
    assign _3725 = _701 ? _1819 : _3723;
    assign _3727 = _333 ? _1819 : _3725;
    assign _3729 = _331 ? _1819 : _3727;
    assign _248 = _3729;
    always @(posedge _310) begin
        if (_308)
            f_lane0_out <= vdd;
        else
            f_lane0_out <= _248;
    end
    assign _448 = _355 == f_lane0_out;
    assign _449 = ~ _448;
    assign _431 = ~ _425;
    assign _432 = _428 & _431;
    always @(posedge _310) begin
        if (_308)
            _428 <= _1817;
        else
            _428 <= _425;
    end
    assign _429 = ~ _428;
    assign _421 = _343[7:7];
    assign _420 = _343[6:6];
    assign _419 = _343[5:5];
    assign _418 = _343[4:4];
    assign _417 = _343[3:3];
    assign _416 = _343[2:2];
    assign _415 = _343[1:1];
    assign _414 = _343[0:0];
    assign _250 = host_lane0_clk_pin;
    always @* begin
        case (_250)
        0:
            _422 <= _414;
        1:
            _422 <= _415;
        2:
            _422 <= _416;
        3:
            _422 <= _417;
        4:
            _422 <= _418;
        5:
            _422 <= _419;
        6:
            _422 <= _420;
        default:
            _422 <= _421;
        endcase
    end
    always @(posedge _310) begin
        if (_308)
            _425 <= _1817;
        else
            _425 <= _422;
    end
    assign _430 = _425 & _429;
    assign _252 = host_lane0_clk_edge;
    assign _433 = _252 ? _432 : _430;
    assign _412 = _397 == _1683;
    assign _409 = _408 == _397;
    assign _402 = _373 == _397;
    assign _400 = ~ _364;
    assign _391 = _254[15:2];
    assign _392 = { _2539,
                    _391 };
    assign _388 = _254[15:1];
    assign _389 = { _1817,
                    _388 };
    assign _393 = _389 + _392;
    assign _385 = _254[15:1];
    assign _386 = { _1817,
                    _385 };
    assign _383 = _269 & _366;
    assign _394 = _383 ? _393 : _386;
    always @(posedge _310) begin
        if (_308)
            _397 <= _1683;
        else
            _397 <= _394;
    end
    assign _398 = _373 < _397;
    assign _375 = _254[15:2];
    assign _376 = { _2539,
                    _375 };
    always @(posedge _310) begin
        if (_308)
            _379 <= _1683;
        else
            _379 <= _376;
    end
    assign _3775 = ~ _364;
    assign _3776 = _399 & _3775;
    assign _3777 = _3776 ? _408 : _373;
    assign _3779 = _369 ? _1683 : _3777;
    assign _3781 = _3779 + _4178;
    assign _3759 = _3753 == _1640;
    assign _404 = _254[15:1];
    assign _405 = { _1817,
                    _404 };
    always @(posedge _310) begin
        if (_308)
            _408 <= _1683;
        else
            _408 <= _405;
    end
    assign _3755 = { gnd,
                     _408 };
    assign _3756 = _3755 == _3753;
    assign _3749 = { gnd,
                     _254 };
    always @(posedge _310) begin
        if (_308)
            _3752 <= _1640;
        else
            _3752 <= _3749;
    end
    assign _254 = host_lane0_div_int;
    assign _3743 = { gnd,
                     _254 };
    assign _3745 = _3743 - _3396;
    always @(posedge _310) begin
        if (_308)
            _3748 <= _1640;
        else
            _3748 <= _3745;
    end
    assign _256 = host_lane0_div_frac;
    assign _3763 = { gnd,
                     _256 };
    assign _3765 = _3764[7:0];
    assign _3766 = _3761 ? _3765 : _3737;
    assign _3767 = _3734 ? _3766 : _3737;
    assign _3769 = _333 ? _755 : _3767;
    assign _257 = _3769;
    always @(posedge _310) begin
        if (_308)
            _3737 <= _755;
        else
            _3737 <= _257;
    end
    assign _3762 = { gnd,
                     _3737 };
    assign _3764 = _3762 + _3763;
    assign _3770 = _3764[8:8];
    assign _3771 = _3761 ? _3770 : _3742;
    assign _3772 = _3734 ? _3771 : _3742;
    assign _3774 = _333 ? _1817 : _3772;
    assign _258 = _3774;
    always @(posedge _310) begin
        if (_308)
            _3742 <= _1817;
        else
            _3742 <= _258;
    end
    assign _3753 = _3742 ? _3752 : _3748;
    assign _3739 = { gnd,
                     _373 };
    assign _3754 = _3739 == _3753;
    assign _3757 = _401 ? _3756 : _3754;
    assign _3760 = _369 ? _3759 : _3757;
    assign _3738 = ~ _265;
    assign _3761 = _3738 & _3760;
    assign _3783 = _3761 ? _1683 : _3781;
    assign _3733 = ~ _265;
    assign _3731 = _364 & _362;
    assign _657 = g_mode_0 == _1961;
    assign _3730 = _339 | _657;
    assign _3732 = _3730 | _3731;
    assign _3734 = _3732 & _3733;
    assign _3784 = _3734 ? _3783 : _373;
    assign _3786 = _333 ? _1683 : _3784;
    assign _259 = _3786;
    always @(posedge _310) begin
        if (_308)
            _373 <= _1683;
        else
            _373 <= _259;
    end
    assign _380 = _373 < _379;
    assign _381 = ~ _380;
    assign _370 = _362 & _366;
    assign _382 = _370 & _381;
    assign _399 = _382 & _398;
    assign _401 = _399 & _400;
    assign _410 = _401 ? _409 : _402;
    assign _366 = _263 == _2046;
    assign _367 = ~ _366;
    assign _364 = g_mode_0 == _2045;
    assign _368 = _364 | _367;
    assign _361 = ~ _265;
    always @(posedge _310) begin
        if (_308)
            _358 <= _1817;
        else
            _358 <= _355;
    end
    assign _351 = _343[7:7];
    assign _350 = _343[6:6];
    assign _349 = _343[5:5];
    assign _348 = _343[4:4];
    assign _347 = _343[3:3];
    assign _346 = _343[2:2];
    assign _345 = _343[1:1];
    assign _344 = _343[0:0];
    assign _261 = host_lane0_data_pin;
    always @* begin
        case (_261)
        0:
            _352 <= _344;
        1:
            _352 <= _345;
        2:
            _352 <= _346;
        3:
            _352 <= _347;
        4:
            _352 <= _348;
        5:
            _352 <= _349;
        6:
            _352 <= _350;
        default:
            _352 <= _351;
        endcase
    end
    always @(posedge _310) begin
        if (_308)
            _355 <= _1817;
        else
            _355 <= _352;
    end
    assign _359 = _355 ^ _358;
    assign _360 = _269 & _359;
    assign _362 = _360 & _361;
    assign _369 = _362 & _368;
    assign _413 = _369 ? _412 : _410;
    assign _434 = _265 ? _433 : _413;
    assign _263 = host_lane0_code;
    assign _442 = _263 == _2046;
    assign _443 = ~ _442;
    assign _265 = host_lane0_clk_pin_en;
    assign _439 = ~ _265;
    assign _267 = host_lane0_readback;
    assign _269 = host_lane0_dir;
    assign _436 = ~ _269;
    assign _437 = _339 & _436;
    assign _438 = _437 & _267;
    assign _440 = _438 & _439;
    assign _444 = _440 & _443;
    assign _445 = _444 & _434;
    assign _450 = _445 & _449;
    assign _3798 = _450 ? _2539 : _3796;
    assign _3850 = _435 ? _3849 : _3798;
    assign _701 = _270 == _454;
    assign _3852 = _701 ? _2539 : _3850;
    assign _3548 = _270 == _1867;
    assign _3859 = _3548 ? _3858 : _3852;
    assign _333 = _270 == _482;
    assign _3865 = _333 ? _3864 : _3859;
    assign _2589 = _1267[90:88];
    assign _2588 = _1261[90:88];
    assign _2587 = _1255[90:88];
    assign _2586 = _897[90:88];
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
    assign _2582 = _1267[87:87];
    assign _2581 = _1261[87:87];
    assign _2580 = _1255[87:87];
    assign _2579 = _897[87:87];
    always @* begin
        case (f_winner)
        0:
            _2583 <= _2579;
        1:
            _2583 <= _2580;
        2:
            _2583 <= _2581;
        default:
            _2583 <= _2582;
        endcase
    end
    assign _3787 = ~ _2583;
    assign _3788 = _1700 & _3787;
    assign _3790 = _3788 ? _2590 : _452;
    assign _270 = _3790;
    assign _330 = _270 == _455;
    assign _331 = _330 | _317;
    assign _3867 = _331 ? _2539 : _3865;
    assign _271 = _3867;
    always @(posedge _310) begin
        if (_308)
            g_mode_0 <= _2539;
        else
            g_mode_0 <= _271;
    end
    assign _339 = g_mode_0 == _2046;
    assign _340 = _339 & _269;
    assign _435 = _340 & _434;
    assign _670 = _435 & _669;
    assign _684 = _670 & g_data_left_0;
    assign _693 = _684 & _692;
    assign _699 = _693 & _698;
    assign _735 = _699 | _734;
    assign _2967 = _735 | _839;
    assign _273 = host_rx_to_tx;
    assign _2968 = _273 & _2967;
    assign _274 = _2968;
    assign _2995 = _274 | _2994;
    assign _2997 = _2995 & _2996;
    assign _3868 = _2997 ^ _3519;
    assign _3874 = _3868 ? _3873 : _275;
    always @(posedge _310) begin
        if (_308)
            _3877 <= _1984;
        else
            _3877 <= _3874;
    end
    assign _275 = _3877;
    assign _1184 = _275 == _1984;
    assign _3879 = _1184 ? _757 : _3047;
    assign _1790 = _1250[28:27];
    assign _1788 = _1267[95:94];
    assign _1787 = _1261[95:94];
    assign _1786 = _1255[95:94];
    assign _1785 = _897[95:94];
    always @* begin
        case (f_winner)
        0:
            _1789 <= _1785;
        1:
            _1789 <= _1786;
        2:
            _1789 <= _1787;
        default:
            _1789 <= _1788;
        endcase
    end
    assign _1791 = _881 ? _1790 : _1789;
    always @* begin
        case (_1791)
        0:
            _3891 <= _1177;
        1:
            _3891 <= _3879;
        2:
            _3891 <= _3888;
        default:
            _3891 <= _3890;
        endcase
    end
    assign _3892 = _1701 ? _3891 : _1177;
    assign _276 = _3892;
    always @(posedge _310) begin
        if (_308)
            _1177 <= _755;
        else
            _1177 <= _276;
    end
    assign _1178 = _1177[0:0];
    assign _3903 = 8'b00001000;
    assign _3902 = 8'b00000111;
    assign _3901 = _1172 - _761;
    assign _3898 = _1250[30:29];
    assign _3896 = _1267[99:98];
    assign _3895 = _1261[99:98];
    assign _3894 = _1255[99:98];
    assign _3893 = _897[99:98];
    always @* begin
        case (f_winner)
        0:
            _3897 <= _3893;
        1:
            _3897 <= _3894;
        2:
            _3897 <= _3895;
        default:
            _3897 <= _3896;
        endcase
    end
    assign _3899 = _881 ? _3898 : _3897;
    always @* begin
        case (_3899)
        0:
            _3904 <= _1172;
        1:
            _3904 <= _3901;
        2:
            _3904 <= _3902;
        default:
            _3904 <= _3903;
        endcase
    end
    assign _3905 = _1701 ? _3904 : _1172;
    assign _277 = _3905;
    always @(posedge _310) begin
        if (_308)
            _1172 <= _755;
        else
            _1172 <= _277;
    end
    assign _1174 = _1172 == _755;
    assign _1372 = _1255[61:58];
    always @* begin
        case (_1372)
        0:
            _1373 <= vdd;
        1:
            _1373 <= _1174;
        2:
            _1373 <= _1178;
        3:
            _1373 <= _1182;
        4:
            _1373 <= _1184;
        5:
            _1373 <= _737;
        6:
            _1373 <= _1188;
        7:
            _1373 <= _1191;
        8:
            _1373 <= _657;
        9:
            _1373 <= _660;
        10:
            _1373 <= _663;
        11:
            _1373 <= _666;
        12:
            _1373 <= _645;
        13:
            _1373 <= _648;
        14:
            _1373 <= _651;
        default:
            _1373 <= _654;
        endcase
    end
    assign _1375 = _1373 ^ _1374;
    assign _1367 = _1255[57:42];
    assign _1369 = _1367 == _1998;
    assign _1358 = _1304[57:42];
    assign _1359 = { gnd,
                     _1358 };
    assign _1360 = _1359 + _1347;
    always @(posedge _310) begin
        if (_308)
            _1363 <= _1640;
        else
            _1363 <= _1360;
    end
    assign _1364 = _1363 < _1303;
    assign _1365 = ~ _1364;
    assign _1354 = _1255[41:26];
    assign _1356 = _1354 == _1683;
    assign _1132 = _1128 + _482;
    assign _3920 = _1128 + _482;
    assign _3916 = _1128 == _2464;
    assign _3917 = ~ _3916;
    assign _3914 = _914[0:0];
    assign _3918 = _3914 & _3917;
    assign _3921 = _3918 ? _3920 : _1128;
    assign _3911 = _914[0:0];
    assign _3912 = ~ _3911;
    assign _3910 = f_chg_now[0:0];
    assign _3913 = _3910 & _3912;
    assign _3923 = _3913 ? _482 : _3921;
    assign _3907 = _873 == _2046;
    assign _3909 = _3907 ? _452 : _1128;
    assign _3906 = _873 == _2045;
    assign _3924 = _3906 ? _3923 : _3909;
    assign _278 = _3924;
    always @(posedge _310) begin
        if (_308)
            _1128 <= _452;
        else
            _1128 <= _278;
    end
    assign _1130 = _1128 == _2464;
    assign _1133 = _1130 ? _1128 : _1132;
    assign _1123 = _914[0:0];
    assign _1124 = ~ _1123;
    assign _1122 = f_chg_now[0:0];
    assign _1125 = _1122 & _1124;
    assign _1135 = _1125 ? _482 : _1133;
    assign _1119 = f_changed_all[0:0];
    assign _1120 = f_in_fetch & _1119;
    assign _1136 = _1120 ? _1135 : _452;
    assign _1338 = _1308[0:0];
    assign _1340 = _1338 ? _1136 : _452;
    assign _1111 = _1107 + _482;
    assign _3939 = _1107 + _482;
    assign _3935 = _1107 == _2464;
    assign _3936 = ~ _3935;
    assign _3933 = _914[1:1];
    assign _3937 = _3933 & _3936;
    assign _3940 = _3937 ? _3939 : _1107;
    assign _3930 = _914[1:1];
    assign _3931 = ~ _3930;
    assign _3929 = f_chg_now[1:1];
    assign _3932 = _3929 & _3931;
    assign _3942 = _3932 ? _482 : _3940;
    assign _3926 = _873 == _2046;
    assign _3928 = _3926 ? _452 : _1107;
    assign _3925 = _873 == _2045;
    assign _3943 = _3925 ? _3942 : _3928;
    assign _279 = _3943;
    always @(posedge _310) begin
        if (_308)
            _1107 <= _452;
        else
            _1107 <= _279;
    end
    assign _1109 = _1107 == _2464;
    assign _1112 = _1109 ? _1107 : _1111;
    assign _1102 = _914[1:1];
    assign _1103 = ~ _1102;
    assign _1101 = f_chg_now[1:1];
    assign _1104 = _1101 & _1103;
    assign _1114 = _1104 ? _482 : _1112;
    assign _1098 = f_changed_all[1:1];
    assign _1099 = f_in_fetch & _1098;
    assign _1115 = _1099 ? _1114 : _452;
    assign _1335 = _1308[1:1];
    assign _1337 = _1335 ? _1115 : _452;
    assign _1341 = _1337 < _1340;
    assign _1342 = _1341 ? _1340 : _1337;
    assign _1088 = _1084 + _482;
    assign _3958 = _1084 + _482;
    assign _3954 = _1084 == _2464;
    assign _3955 = ~ _3954;
    assign _3952 = _914[2:2];
    assign _3956 = _3952 & _3955;
    assign _3959 = _3956 ? _3958 : _1084;
    assign _3949 = _914[2:2];
    assign _3950 = ~ _3949;
    assign _3948 = f_chg_now[2:2];
    assign _3951 = _3948 & _3950;
    assign _3961 = _3951 ? _482 : _3959;
    assign _3945 = _873 == _2046;
    assign _3947 = _3945 ? _452 : _1084;
    assign _3944 = _873 == _2045;
    assign _3962 = _3944 ? _3961 : _3947;
    assign _280 = _3962;
    always @(posedge _310) begin
        if (_308)
            _1084 <= _452;
        else
            _1084 <= _280;
    end
    assign _1086 = _1084 == _2464;
    assign _1089 = _1086 ? _1084 : _1088;
    assign _1079 = _914[2:2];
    assign _1080 = ~ _1079;
    assign _1078 = f_chg_now[2:2];
    assign _1081 = _1078 & _1080;
    assign _1091 = _1081 ? _482 : _1089;
    assign _1075 = f_changed_all[2:2];
    assign _1076 = f_in_fetch & _1075;
    assign _1092 = _1076 ? _1091 : _452;
    assign _1330 = _1308[2:2];
    assign _1332 = _1330 ? _1092 : _452;
    assign _1067 = _1063 + _482;
    assign _3977 = _1063 + _482;
    assign _3973 = _1063 == _2464;
    assign _3974 = ~ _3973;
    assign _3971 = _914[3:3];
    assign _3975 = _3971 & _3974;
    assign _3978 = _3975 ? _3977 : _1063;
    assign _3968 = _914[3:3];
    assign _3969 = ~ _3968;
    assign _3967 = f_chg_now[3:3];
    assign _3970 = _3967 & _3969;
    assign _3980 = _3970 ? _482 : _3978;
    assign _3964 = _873 == _2046;
    assign _3966 = _3964 ? _452 : _1063;
    assign _3963 = _873 == _2045;
    assign _3981 = _3963 ? _3980 : _3966;
    assign _281 = _3981;
    always @(posedge _310) begin
        if (_308)
            _1063 <= _452;
        else
            _1063 <= _281;
    end
    assign _1065 = _1063 == _2464;
    assign _1068 = _1065 ? _1063 : _1067;
    assign _1058 = _914[3:3];
    assign _1059 = ~ _1058;
    assign _1057 = f_chg_now[3:3];
    assign _1060 = _1057 & _1059;
    assign _1070 = _1060 ? _482 : _1068;
    assign _1054 = f_changed_all[3:3];
    assign _1055 = f_in_fetch & _1054;
    assign _1071 = _1055 ? _1070 : _452;
    assign _1327 = _1308[3:3];
    assign _1329 = _1327 ? _1071 : _452;
    assign _1333 = _1329 < _1332;
    assign _1334 = _1333 ? _1332 : _1329;
    assign _1343 = _1334 < _1342;
    assign _1344 = _1343 ? _1342 : _1334;
    assign _1042 = _1038 + _482;
    assign _3996 = _1038 + _482;
    assign _3992 = _1038 == _2464;
    assign _3993 = ~ _3992;
    assign _3990 = _914[4:4];
    assign _3994 = _3990 & _3993;
    assign _3997 = _3994 ? _3996 : _1038;
    assign _3987 = _914[4:4];
    assign _3988 = ~ _3987;
    assign _3986 = f_chg_now[4:4];
    assign _3989 = _3986 & _3988;
    assign _3999 = _3989 ? _482 : _3997;
    assign _3983 = _873 == _2046;
    assign _3985 = _3983 ? _452 : _1038;
    assign _3982 = _873 == _2045;
    assign _4000 = _3982 ? _3999 : _3985;
    assign _282 = _4000;
    always @(posedge _310) begin
        if (_308)
            _1038 <= _452;
        else
            _1038 <= _282;
    end
    assign _1040 = _1038 == _2464;
    assign _1043 = _1040 ? _1038 : _1042;
    assign _1033 = _914[4:4];
    assign _1034 = ~ _1033;
    assign _1032 = f_chg_now[4:4];
    assign _1035 = _1032 & _1034;
    assign _1045 = _1035 ? _482 : _1043;
    assign _1029 = f_changed_all[4:4];
    assign _1030 = f_in_fetch & _1029;
    assign _1046 = _1030 ? _1045 : _452;
    assign _1320 = _1308[4:4];
    assign _1322 = _1320 ? _1046 : _452;
    assign _1021 = _1017 + _482;
    assign _4015 = _1017 + _482;
    assign _4011 = _1017 == _2464;
    assign _4012 = ~ _4011;
    assign _4009 = _914[5:5];
    assign _4013 = _4009 & _4012;
    assign _4016 = _4013 ? _4015 : _1017;
    assign _4006 = _914[5:5];
    assign _4007 = ~ _4006;
    assign _4005 = f_chg_now[5:5];
    assign _4008 = _4005 & _4007;
    assign _4018 = _4008 ? _482 : _4016;
    assign _4002 = _873 == _2046;
    assign _4004 = _4002 ? _452 : _1017;
    assign _4001 = _873 == _2045;
    assign _4019 = _4001 ? _4018 : _4004;
    assign _283 = _4019;
    always @(posedge _310) begin
        if (_308)
            _1017 <= _452;
        else
            _1017 <= _283;
    end
    assign _1019 = _1017 == _2464;
    assign _1022 = _1019 ? _1017 : _1021;
    assign _1012 = _914[5:5];
    assign _1013 = ~ _1012;
    assign _1011 = f_chg_now[5:5];
    assign _1014 = _1011 & _1013;
    assign _1024 = _1014 ? _482 : _1022;
    assign _1008 = f_changed_all[5:5];
    assign _1009 = f_in_fetch & _1008;
    assign _1025 = _1009 ? _1024 : _452;
    assign _1317 = _1308[5:5];
    assign _1319 = _1317 ? _1025 : _452;
    assign _1323 = _1319 < _1322;
    assign _1324 = _1323 ? _1322 : _1319;
    assign _998 = _994 + _482;
    assign _4034 = _994 + _482;
    assign _4030 = _994 == _2464;
    assign _4031 = ~ _4030;
    assign _4028 = _914[6:6];
    assign _4032 = _4028 & _4031;
    assign _4035 = _4032 ? _4034 : _994;
    assign _4025 = _914[6:6];
    assign _4026 = ~ _4025;
    assign _4024 = f_chg_now[6:6];
    assign _4027 = _4024 & _4026;
    assign _4037 = _4027 ? _482 : _4035;
    assign _4021 = _873 == _2046;
    assign _4023 = _4021 ? _452 : _994;
    assign _4020 = _873 == _2045;
    assign _4038 = _4020 ? _4037 : _4023;
    assign _284 = _4038;
    always @(posedge _310) begin
        if (_308)
            _994 <= _452;
        else
            _994 <= _284;
    end
    assign _996 = _994 == _2464;
    assign _999 = _996 ? _994 : _998;
    assign _989 = _914[6:6];
    assign _990 = ~ _989;
    assign _988 = f_chg_now[6:6];
    assign _991 = _988 & _990;
    assign _1001 = _991 ? _482 : _999;
    assign _985 = f_changed_all[6:6];
    assign _986 = f_in_fetch & _985;
    assign _1002 = _986 ? _1001 : _452;
    assign _1312 = _1308[6:6];
    assign _1314 = _1312 ? _1002 : _452;
    assign _977 = _973 + _482;
    assign _4053 = _973 + _482;
    assign _4049 = _973 == _2464;
    assign _4050 = ~ _4049;
    assign _4047 = _914[7:7];
    assign _4051 = _4047 & _4050;
    assign _4054 = _4051 ? _4053 : _973;
    assign _4044 = _914[7:7];
    assign _4045 = ~ _4044;
    assign _4043 = f_chg_now[7:7];
    assign _4046 = _4043 & _4045;
    assign _4056 = _4046 ? _482 : _4054;
    assign _4040 = _873 == _2046;
    assign _4042 = _4040 ? _452 : _973;
    assign _4039 = _873 == _2045;
    assign _4057 = _4039 ? _4056 : _4042;
    assign _285 = _4057;
    always @(posedge _310) begin
        if (_308)
            _973 <= _452;
        else
            _973 <= _285;
    end
    assign _975 = _973 == _2464;
    assign _978 = _975 ? _973 : _977;
    assign _968 = _914[7:7];
    assign _969 = ~ _968;
    assign _967 = f_chg_now[7:7];
    assign _970 = _967 & _969;
    assign _980 = _970 ? _482 : _978;
    assign _964 = f_changed_all[7:7];
    assign _965 = f_in_fetch & _964;
    assign _981 = _965 ? _980 : _452;
    assign _1308 = _1304[23:16];
    assign _1309 = _1308[7:7];
    assign _1311 = _1309 ? _981 : _452;
    assign _1315 = _1311 < _1314;
    assign _1316 = _1315 ? _1314 : _1311;
    assign _1325 = _1316 < _1324;
    assign _1326 = _1325 ? _1324 : _1316;
    assign _1345 = _1326 < _1344;
    assign _1346 = _1345 ? _1344 : _1326;
    assign _1347 = { _1585,
                     _1346 };
    assign _4060 = _878 == _482;
    assign _4061 = _4060 ? _302 : _895;
    assign _4058 = _873 == _2045;
    assign _4062 = _4058 ? _4061 : _895;
    assign _286 = _4062;
    always @(posedge _310) begin
        if (_308)
            _895 <= _885;
        else
            _895 <= _286;
    end
    assign _953 = _878 == _482;
    assign _954 = f_in_fetch & _953;
    assign _955 = _954 ? _302 : _895;
    assign _4065 = _878 == _454;
    assign _4066 = _4065 ? _302 : _892;
    assign _4063 = _873 == _2045;
    assign _4067 = _4063 ? _4066 : _892;
    assign _287 = _4067;
    always @(posedge _310) begin
        if (_308)
            _892 <= _885;
        else
            _892 <= _287;
    end
    assign _949 = _878 == _454;
    assign _950 = f_in_fetch & _949;
    assign _951 = _950 ? _302 : _892;
    assign _4070 = _878 == _1867;
    assign _4071 = _4070 ? _302 : _889;
    assign _4068 = _873 == _2045;
    assign _4072 = _4068 ? _4071 : _889;
    assign _288 = _4072;
    always @(posedge _310) begin
        if (_308)
            _889 <= _885;
        else
            _889 <= _288;
    end
    assign _945 = _878 == _1867;
    assign _946 = f_in_fetch & _945;
    assign _947 = _946 ? _302 : _889;
    assign _4113 = _4100 | f_sweeping;
    assign _4107 = ~ f_sweeping;
    assign _290 = host_rec_we;
    assign _4106 = _290 & _1833;
    assign f_store_we = _4106 & _4107;
    assign _292 = host_rec_wdata;
    always @(posedge _310) begin
        if (f_store_we)
            _4109[_4105] <= _292;
    end
    assign _4103 = _878[1:0];
    assign _294 = host_start_loc;
    assign _1267 = _896[511:400];
    assign _4085 = _1267[110:105];
    assign _1261 = _896[399:288];
    assign _4084 = _1261[110:105];
    assign _4083 = _1255[110:105];
    assign _4082 = _897[110:105];
    always @* begin
        case (f_winner)
        0:
            _4086 <= _4082;
        1:
            _4086 <= _4083;
        2:
            _4086 <= _4084;
        default:
            _4086 <= _4085;
        endcase
    end
    assign _4087 = _4086 == _1764;
    assign _4088 = ~ _4087;
    assign _4089 = _4088 ? _4086 : _1764;
    assign _296 = host_recover_loc;
    assign _4076 = _1893 ? _296 : _4075;
    assign _297 = _4076;
    always @(posedge _310) begin
        if (_308)
            _4075 <= _3807;
        else
            _4075 <= _297;
    end
    assign f_policy = _1250[59:58];
    assign _4079 = f_policy == _2046;
    assign _4080 = _4079 ? _4075 : _1764;
    assign _4081 = f_viol_now ? _4080 : _1764;
    assign _4090 = _1700 ? _4089 : _4081;
    assign _4077 = _873 == _2046;
    assign _4091 = _4077 ? _4090 : _1764;
    assign _4092 = _1893 ? _294 : _4091;
    assign _298 = _4092;
    always @(posedge _310) begin
        if (_308)
            _1764 <= _3807;
        else
            _1764 <= _298;
    end
    assign _4104 = { _1764,
                     _4103 };
    assign _4096 = f_sw_cnt + _2711;
    assign _4094 = _2698 ? _2016 : f_sw_cnt;
    assign _4097 = f_sweeping ? _4096 : _4094;
    assign _299 = _4097;
    always @(posedge _310) begin
        if (_308)
            f_sw_cnt <= _2016;
        else
            f_sw_cnt <= _299;
    end
    assign _4101 = f_sw_cnt[11:4];
    assign _301 = host_rec_waddr;
    assign _4102 = f_sweeping ? _4101 : _301;
    assign _4099 = _878 < _455;
    assign _4100 = f_in_fetch & _4099;
    assign _4105 = _4100 ? _4104 : _4102;
    assign _4110 = _4109[_4105];
    always @(posedge _310) begin
        if (_4113)
            _4114 <= _4110;
    end
    assign _302 = _4114;
    assign _941 = _878 == _455;
    assign _942 = f_in_fetch & _941;
    assign _943 = _942 ? _302 : _886;
    assign _956 = { _943,
                    _947,
                    _951,
                    _955 };
    assign _1304 = _956[287:176];
    assign _1305 = _1304[41:26];
    assign _1306 = { gnd,
                     _1305 };
    assign _1348 = _1306 + _1347;
    always @(posedge _310) begin
        if (_308)
            _1351 <= _1640;
        else
            _1351 <= _1348;
    end
    assign gnd = 1'b0;
    assign _1303 = { gnd,
                     _1300 };
    assign _1352 = _1303 < _1351;
    assign _1353 = ~ _1352;
    assign _1357 = _1353 | _1356;
    assign _1366 = _1357 & _1365;
    assign _4142 = _935 + _4178;
    assign _4138 = _935 == _1998;
    assign _4139 = ~ _4138;
    assign _4140 = _4136 & _4139;
    assign _4143 = _4140 ? _4142 : _935;
    assign _4122 = _4121[2:2];
    assign _4123 = _1701 & _4122;
    assign _4145 = _4123 ? _1683 : _4143;
    assign _4147 = _1893 ? _1683 : _4145;
    assign _303 = _4147;
    always @(posedge _310) begin
        if (_308)
            _935 <= _1683;
        else
            _935 <= _303;
    end
    assign _4159 = _932 + _4178;
    assign _4155 = _932 == _1998;
    assign _4156 = ~ _4155;
    assign _4134 = 9'b111111111;
    assign _4135 = _4127 == _4134;
    assign _4132 = 6'b111111;
    assign _4131 = _4127[5:0];
    assign _4133 = _4131 == _4132;
    assign _4126 = 9'b000000000;
    assign _4148 = 9'b000000001;
    assign _4149 = _4127 + _4148;
    assign _4151 = _1893 ? _4126 : _4149;
    assign _304 = _4151;
    always @(posedge _310) begin
        if (_308)
            _4127 <= _4126;
        else
            _4127 <= _304;
    end
    assign _4128 = _4127[2:0];
    assign _4130 = _4128 == _2464;
    assign _4124 = _1250[63:62];
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
    assign _4160 = _4157 ? _4159 : _932;
    assign _4152 = _4121[1:1];
    assign _4153 = _1701 & _4152;
    assign _4162 = _4153 ? _1683 : _4160;
    assign _4164 = _1893 ? _1683 : _4162;
    assign _305 = _4164;
    always @(posedge _310) begin
        if (_308)
            _932 <= _1683;
        else
            _932 <= _305;
    end
    assign _1299 = _1255[25:24];
    always @* begin
        case (_1299)
        0:
            _1300 <= _929;
        1:
            _1300 <= _932;
        2:
            _1300 <= _935;
        default:
            _1300 <= _935;
        endcase
    end
    assign _1302 = _1300 == _1998;
    assign _1370 = _1302 ? _1369 : _1366;
    always @(posedge _310) begin
        if (_308)
            _917 <= _755;
        else
            _917 <= _901;
    end
    assign f_chg_now = _901 ^ _917;
    assign _4166 = _873 == _2046;
    assign _4168 = _4166 ? _755 : _914;
    assign _4165 = _873 == _2045;
    assign _4169 = _4165 ? f_changed_all : _4168;
    assign _4171 = _1893 ? _755 : _4169;
    assign _306 = _4171;
    always @(posedge _310) begin
        if (_308)
            _914 <= _755;
        else
            _914 <= _306;
    end
    assign f_changed_all = _914 | f_chg_now;
    assign _1293 = f_changed_all & f_chgmask1;
    assign _1295 = _1293 == _755;
    assign _1296 = ~ _1295;
    assign f_chgmask1 = _1255[23:16];
    assign _1292 = f_chgmask1 == _755;
    assign _1297 = _1292 | _1296;
    assign _1286 = _1255[7:0];
    assign _1284 = _1255[15:8];
    assign vdd = 1'b1;
    assign _308 = clear;
    assign _310 = clock;
    assign _312 = pins_in;
    always @(posedge _310) begin
        if (_308)
            _343 <= _755;
        else
            _343 <= _312;
    end
    always @(posedge _310) begin
        if (_308)
            _901 <= _755;
        else
            _901 <= _343;
    end
    assign _1285 = _901 ^ _1284;
    assign _1287 = _1285 & _1286;
    assign _1289 = _1287 == _755;
    assign _1255 = _896[287:176];
    assign f_valid1 = _1255[111:111];
    assign _1290 = f_valid1 & _1289;
    assign _1298 = _1290 & _1297;
    assign _1371 = _1298 & _1370;
    assign _1376 = _1371 & _1375;
    assign _1415 = _1376 & _1414;
    assign _1416 = f_in_eval & _1415;
    assign _1420 = _1416 & _1419;
    assign f_fire1 = _1420 & _1282;
    assign _1706 = f_fire1 ? _2045 : _1704;
    assign f_winner = f_fire0 ? _2539 : _1706;
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
    assign _4121 = _881 ? _4120 : _4119;
    assign _4172 = _4121[0:0];
    assign _880 = _878 == _455;
    assign f_in_fetch = _873 == _2045;
    assign _881 = f_in_fetch & _880;
    assign _1701 = _881 | _1700;
    assign _4173 = _1701 & _4172;
    assign _4182 = _4173 ? _1683 : _4180;
    assign _4184 = _1893 ? _1683 : _4182;
    assign _313 = _4184;
    always @(posedge _310) begin
        if (_308)
            _929 <= _1683;
        else
            _929 <= _313;
    end
    assign _1941 = _1250[33:32];
    always @* begin
        case (_1941)
        0:
            _1942 <= _929;
        1:
            _1942 <= _932;
        2:
            _1942 <= _935;
        default:
            _1942 <= _935;
        endcase
    end
    assign _1940 = _1250[49:34];
    assign _1943 = _1940 < _1942;
    assign _1250 = _896[63:0];
    assign _1938 = _1250[31:31];
    assign _1936 = ~ _1700;
    assign _1937 = f_in_eval & _1936;
    assign _1939 = _1937 & _1938;
    assign _1944 = _1939 & _1943;
    assign _1949 = _1944 & _1948;
    assign _1957 = _1949 | f_unexp_now;
    assign f_viol_now = _1957 | f_amb_now;
    assign _4190 = f_viol_now ? _4189 : _878;
    assign _4193 = _1700 ? _4192 : _4190;
    assign _4186 = _873 == _2046;
    assign _4194 = _4186 ? _4193 : _878;
    assign _4185 = _873 == _2045;
    assign _4197 = _4185 ? _4196 : _4194;
    assign _4199 = _1893 ? _452 : _4197;
    assign _314 = _4199;
    always @(posedge _310) begin
        if (_308)
            _878 <= _452;
        else
            _878 <= _314;
    end
    assign _4202 = _878 == _455;
    assign _4203 = _4202 ? _302 : _886;
    assign _4200 = _873 == _2045;
    assign _4204 = _4200 ? _4203 : _886;
    assign _315 = _4204;
    always @(posedge _310) begin
        if (_308)
            _886 <= _885;
        else
            _886 <= _315;
    end
    assign _896 = { _886,
                    _889,
                    _892,
                    _895 };
    assign _897 = _896[175:64];
    assign f_valid0 = _897[111:111];
    assign _908 = f_valid0 & _907;
    assign _925 = _908 & _924;
    assign _1168 = _925 & _1167;
    assign _1195 = _1168 & _1194;
    assign _1239 = _1195 & _1238;
    assign f_in_eval = _873 == _2046;
    assign _1240 = f_in_eval & _1239;
    assign _1249 = _1240 & _1248;
    assign f_fire0 = _1249 & _1282;
    assign _1422 = f_fire0 | f_fire1;
    assign _1561 = _1422 | f_fire2;
    assign _1700 = _1561 | f_fire3;
    assign _4223 = _1700 ? _4222 : _4220;
    assign _4208 = _873 == _1961;
    assign _4210 = _4208 ? _2539 : _873;
    assign _4206 = _873 == _2046;
    assign _4224 = _4206 ? _4223 : _4210;
    assign _4205 = _873 == _2045;
    assign _4227 = _4205 ? _4226 : _4224;
    assign _317 = host_stop;
    assign _4229 = _317 ? _2539 : _4227;
    assign _4231 = _1893 ? _2045 : _4229;
    assign _318 = _4231;
    always @(posedge _310) begin
        if (_308)
            _873 <= _2539;
        else
            _873 <= _318;
    end
    assign _1833 = _873 == _2539;
    assign _320 = host_verify;
    assign _2696 = _320 & _1833;
    assign _2698 = _2696 & _2697;
    assign _4233 = _2698 ? _1819 : f_sweeping;
    assign _4243 = f_sweeping ? _4242 : _4233;
    assign _321 = _4243;
    always @(posedge _310) begin
        if (_308)
            f_sweeping <= _1817;
        else
            f_sweeping <= _321;
    end
    assign _4255 = f_sweeping ? _4254 : _4248;
    assign _322 = _4255;
    always @(posedge _310) begin
        if (_308)
            f_image_valid <= _1817;
        else
            f_image_valid <= _322;
    end
    assign _324 = host_start;
    assign _1893 = _324 & f_image_valid;
    assign _4279 = _1893 ? _755 : _4277;
    assign _325 = _4279;
    always @(posedge _310) begin
        if (_308)
            f_pout <= _755;
        else
            f_pout <= _325;
    end
    assign _2621 = f_pout[7:7];
    assign _327 = host_pin_src;
    assign _2617 = _327[23:21];
    always @* begin
        case (_2617)
        0:
            _2628 <= _2621;
        1:
            _2628 <= f_lane0_out;
        2:
            _2628 <= _2622;
        3:
            _2628 <= _2623;
        4:
            _2628 <= _2625;
        5:
            _2628 <= f_lane1_out;
        6:
            _2628 <= _2626;
        default:
            _2628 <= _2627;
        endcase
    end
    assign _2692 = { _2628,
                     _2637,
                     _2646,
                     _2655,
                     _2664,
                     _2673,
                     _2682,
                     _2691 };
    assign _4281 = _2692 & _4280;
    assign pins_out = _4281;
    assign pins_oe = _2695;
    assign st_running = _2552;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1764;
    assign st_accepting = _2551;
    assign st_taken = _2549;
    assign st_taken_edge = _2546;
    assign st_viol = _2543;
    assign st_viol_kind = _2540;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _739;
    assign st_tx_empty = _1184;
    assign st_rx_data = _2535;
    assign st_rx_empty = _2470;
    assign st_vlog_data = _2468;
    assign st_vlog_empty = _1985;
    assign st_cov_rdata = _2097;
    assign st_irq = _1989;
    assign st_halted_viol = _1922;
    assign st_rx_overflow = _1915;
    assign st_vlog_overflow = _1903;
    assign st_cov_overrun = _1896;
    assign st_host_err = _1880;
    assign st_host_err_cause = _1885;
    assign st_lane_active = _1831;
    assign st_image_valid = f_image_valid;
    assign st_verify_busy = f_sweeping;
    assign st_tx_collision = _1818;
    assign st_drops = _1784;
    assign st_lane_status = _668;

endmodule
