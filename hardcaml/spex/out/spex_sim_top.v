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
    input [4:0] host_tx_wm;
    input host_tx_wm_en;
    input [4:0] host_rx_wm;
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

    wire [2:0] _458;
    wire [2:0] _488;
    wire [2:0] _489;
    wire [2:0] _461;
    wire [2:0] _460;
    wire [2:0] _462;
    wire [2:0] _463;
    wire [2:0] _490;
    wire [2:0] _492;
    wire [2:0] _494;
    wire [2:0] _1;
    reg [2:0] _459;
    wire [7:0] _673;
    wire [2:0] _644;
    wire [2:0] _618;
    wire [2:0] _619;
    wire [2:0] _645;
    wire [2:0] _647;
    wire [2:0] _649;
    wire [2:0] _2;
    reg [2:0] _615;
    wire [7:0] _661;
    wire [15:0] _674;
    wire [7:0] _761;
    wire [7:0] _767;
    wire [7:0] _768;
    wire [7:0] _763;
    wire _764;
    wire _765;
    wire _757;
    wire _754;
    wire _755;
    wire _751;
    wire _748;
    wire _749;
    wire _750;
    wire _752;
    wire _756;
    wire _758;
    wire _747;
    wire _759;
    wire _766;
    wire [7:0] _769;
    wire [7:0] _771;
    wire [7:0] _4;
    reg [7:0] _762;
    wire [7:0] _870;
    wire _866;
    wire _867;
    wire _859;
    wire _856;
    wire _857;
    wire _853;
    wire _850;
    wire _851;
    wire _852;
    wire _854;
    wire _858;
    wire _860;
    wire _746;
    wire _848;
    wire _849;
    wire _861;
    wire _868;
    wire [7:0] _871;
    wire [7:0] _873;
    wire [7:0] _5;
    reg [7:0] _864;
    wire [7:0] _1744;
    wire _1740;
    wire _1741;
    wire _1734;
    wire _1735;
    wire _1742;
    wire [7:0] _1745;
    wire [7:0] _1747;
    wire [7:0] _6;
    reg [7:0] _1738;
    wire [7:0] _1759;
    wire _1755;
    wire _1756;
    wire _1757;
    wire [7:0] _1760;
    wire [7:0] _1762;
    wire [7:0] _7;
    reg [7:0] _1753;
    wire [7:0] _1786;
    wire _1782;
    wire _1783;
    wire _1784;
    wire [7:0] _1787;
    wire _9;
    wire [7:0] _1789;
    wire [7:0] _10;
    reg [7:0] _1780;
    wire [39:0] _1790;
    wire _1823;
    wire _1825;
    wire _1803;
    wire _1821;
    wire _1826;
    wire _1828;
    wire _12;
    reg _1824;
    wire [1:0] _1837;
    wire [2:0] _1892;
    wire [2:0] _1894;
    wire [2:0] _17;
    reg [2:0] _1891;
    wire _1887;
    wire [2:0] _1877;
    wire [2:0] _1873;
    wire [2:0] _1874;
    wire [2:0] _1878;
    wire [2:0] _1870;
    wire [2:0] _1869;
    wire [2:0] _1871;
    wire [2:0] _1879;
    wire _1865;
    wire _1862;
    wire _1863;
    wire _1864;
    wire _1866;
    wire _1858;
    wire _1859;
    wire _1835;
    wire _1855;
    wire _1856;
    wire _1836;
    wire [1:0] _20;
    wire _1853;
    wire _1854;
    wire _1857;
    wire _1860;
    wire _1849;
    wire _1845;
    wire _1850;
    wire _1843;
    wire _22;
    wire _1842;
    wire _1844;
    wire _1851;
    wire _1840;
    wire _1841;
    wire _1852;
    wire _1861;
    wire _1867;
    wire [2:0] _1880;
    wire _1882;
    wire _1883;
    wire _1888;
    wire _1896;
    wire _24;
    wire _1898;
    wire _25;
    reg _1886;
    wire _1775;
    wire _1776;
    wire _1767;
    wire _1777;
    wire _1904;
    wire _1906;
    wire _27;
    reg _1902;
    wire _1750;
    wire _1911;
    wire _1913;
    wire _29;
    reg _1909;
    wire _1917;
    wire _1732;
    wire _1725;
    wire _1733;
    wire _846;
    wire _842;
    wire _847;
    wire _1914;
    wire _31;
    wire _1915;
    wire _1916;
    wire _1918;
    wire _1923;
    wire _1925;
    wire _32;
    reg _1921;
    wire _1929;
    wire _1930;
    wire _1935;
    wire _36;
    wire _1937;
    wire _1939;
    wire _37;
    reg _1933;
    wire _1968;
    wire _1970;
    wire _1966;
    wire _1972;
    wire _1973;
    wire _1974;
    wire _1941;
    wire _1975;
    wire _1977;
    wire _38;
    reg _1928;
    wire _1992;
    wire [4:0] _40;
    wire [5:0] _1985;
    wire _1986;
    wire _1987;
    wire _42;
    wire _1988;
    wire [4:0] _1980;
    wire [4:0] _1978;
    wire [4:0] _44;
    wire _1979;
    wire [4:0] _1981;
    wire [5:0] _1982;
    wire _1983;
    wire _1984;
    wire _1989;
    wire _1993;
    wire _1994;
    wire _1995;
    wire _2097;
    wire _2096;
    wire _2098;
    wire [31:0] _2095;
    wire _2089;
    wire _2087;
    wire _2085;
    wire _47;
    wire _2084;
    wire _2086;
    wire _2088;
    wire f_host_cov_we;
    wire _2091;
    wire [11:0] _2078;
    wire _2075;
    wire _2076;
    wire [11:0] _2077;
    wire _2079;
    wire [11:0] _2080;
    wire [11:0] _2081;
    wire [11:0] _2067;
    wire [11:0] _2028;
    wire [11:0] _2025;
    wire [12:0] _2022;
    wire [9:0] _2019;
    wire [12:0] _2020;
    wire [12:0] _2021;
    reg [2:0] _1996;
    wire [2:0] _48;
    reg [2:0] _2016;
    wire [12:0] _2017;
    wire [12:0] _2002;
    wire [12:0] _2001;
    wire [15:0] _1997;
    wire _2000;
    wire [12:0] _2003;
    wire [12:0] _49;
    reg [12:0] _2012;
    wire _2018;
    wire [12:0] _2023;
    wire [12:0] _2009;
    wire _2024;
    wire [11:0] _2027;
    wire [15:0] _2004;
    wire _2005;
    wire _50;
    reg _2008;
    wire [11:0] _2029;
    wire [11:0] _51;
    reg [11:0] _2068;
    wire [11:0] _2032;
    reg [1:0] _1998;
    reg [15:0] _1999;
    wire [15:0] _2030;
    wire _2031;
    wire [11:0] _2034;
    wire [11:0] _52;
    reg [11:0] _2065;
    wire _2069;
    wire _2070;
    wire [11:0] _2071;
    wire [11:0] _2062;
    wire _2072;
    wire [11:0] _2073;
    wire _2061;
    wire [11:0] _2074;
    wire [7:0] _2057;
    wire [1:0] _2052;
    wire [1:0] _2051;
    wire _2036;
    wire _2035;
    wire _2037;
    wire _53;
    reg _2050;
    wire [1:0] _2053;
    wire [6:0] _2047;
    wire [8:0] _2054;
    wire [7:0] _2045;
    wire [8:0] _2046;
    wire [8:0] _2055;
    wire _2056;
    wire [7:0] _2059;
    wire [31:0] _2082;
    wire [31:0] _55;
    wire [31:0] _2083;
    reg [31:0] _2092[0:255];
    wire [7:0] _56;
    reg [7:0] _2043;
    wire [7:0] _1771;
    wire [7:0] _57;
    reg [7:0] _1774;
    wire [7:0] _59;
    wire [7:0] _2040;
    wire _2038;
    wire _61;
    wire _1763;
    wire _2039;
    wire _62;
    reg _1766;
    wire _63;
    reg _1848;
    wire [7:0] _2044;
    wire [31:0] _2093;
    reg [31:0] _2099;
    wire [31:0] _64;
    wire _2100;
    wire _2101;
    wire [31:0] _2103;
    wire [2:0] _2470;
    wire _2471;
    wire _2472;
    wire [47:0] _2469;
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
    wire _2435;
    wire _2436;
    reg [47:0] _2437;
    wire [2:0] _2110;
    wire [2:0] _2111;
    wire [2:0] _67;
    reg [2:0] _2108;
    wire _2429;
    wire _2430;
    wire [2:0] _2402;
    wire [28:0] _2119;
    wire [28:0] _2118;
    wire [28:0] _2121;
    wire [28:0] _2122;
    wire [2:0] _2115;
    wire _2117;
    wire [28:0] _2123;
    wire [28:0] _68;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2400;
    wire [2:0] _2141;
    wire _2137;
    wire _2138;
    wire _2135;
    wire _2139;
    wire [2:0] _2142;
    wire _2132;
    wire _2133;
    wire _2130;
    wire _2129;
    wire _2131;
    wire _2134;
    wire [2:0] _2144;
    wire _2125;
    wire [2:0] _2145;
    wire [2:0] _69;
    reg [2:0] _2128;
    wire _2391;
    wire [2:0] _2393;
    wire [2:0] _2162;
    wire _2158;
    wire _2159;
    wire _2156;
    wire _2160;
    wire [2:0] _2163;
    wire _2153;
    wire _2154;
    wire _2151;
    wire _2150;
    wire _2152;
    wire _2155;
    wire [2:0] _2165;
    wire _2146;
    wire [2:0] _2166;
    wire [2:0] _70;
    reg [2:0] _2149;
    wire _2388;
    wire [2:0] _2390;
    wire [2:0] _2394;
    wire [2:0] _2183;
    wire _2179;
    wire _2180;
    wire _2177;
    wire _2181;
    wire [2:0] _2184;
    wire _2174;
    wire _2175;
    wire _2172;
    wire _2171;
    wire _2173;
    wire _2176;
    wire [2:0] _2186;
    wire _2167;
    wire [2:0] _2187;
    wire [2:0] _71;
    reg [2:0] _2170;
    wire _2384;
    wire [2:0] _2386;
    wire [2:0] _2204;
    wire _2200;
    wire _2201;
    wire _2198;
    wire _2202;
    wire [2:0] _2205;
    wire _2195;
    wire _2196;
    wire _2193;
    wire _2192;
    wire _2194;
    wire _2197;
    wire [2:0] _2207;
    wire _2188;
    wire [2:0] _2208;
    wire [2:0] _72;
    reg [2:0] _2191;
    wire _2381;
    wire [2:0] _2383;
    wire [2:0] _2387;
    wire [2:0] _2395;
    wire [2:0] _2225;
    wire _2221;
    wire _2222;
    wire _2219;
    wire _2223;
    wire [2:0] _2226;
    wire _2216;
    wire _2217;
    wire _2214;
    wire _2213;
    wire _2215;
    wire _2218;
    wire [2:0] _2228;
    wire _2209;
    wire [2:0] _2229;
    wire [2:0] _73;
    reg [2:0] _2212;
    wire _2376;
    wire [2:0] _2378;
    wire [2:0] _2246;
    wire _2242;
    wire _2243;
    wire _2240;
    wire _2244;
    wire [2:0] _2247;
    wire _2237;
    wire _2238;
    wire _2235;
    wire _2234;
    wire _2236;
    wire _2239;
    wire [2:0] _2249;
    wire _2230;
    wire [2:0] _2250;
    wire [2:0] _74;
    reg [2:0] _2233;
    wire _2373;
    wire [2:0] _2375;
    wire [2:0] _2379;
    wire [2:0] _2267;
    wire _2263;
    wire _2264;
    wire _2261;
    wire _2265;
    wire [2:0] _2268;
    wire _2258;
    wire _2259;
    wire _2256;
    wire _2255;
    wire _2257;
    wire _2260;
    wire [2:0] _2270;
    wire _2251;
    wire [2:0] _2271;
    wire [2:0] _75;
    reg [2:0] _2254;
    wire _2369;
    wire [2:0] _2371;
    wire [2:0] _2288;
    wire _2284;
    wire _2285;
    wire _2282;
    wire _2286;
    wire [2:0] _2289;
    wire _2279;
    wire _2280;
    wire _2277;
    wire _2276;
    wire _2278;
    wire _2281;
    wire [2:0] _2291;
    wire _2272;
    wire [2:0] _2292;
    wire [2:0] _76;
    reg [2:0] _2275;
    wire _2366;
    wire [2:0] _2368;
    wire [2:0] _2372;
    wire [2:0] _2380;
    wire [2:0] _2396;
    wire _2361;
    wire _2360;
    wire _2362;
    wire _2358;
    wire _2357;
    wire _2359;
    wire _2363;
    wire _2354;
    wire _2353;
    wire _2355;
    wire _2351;
    wire _2350;
    wire _2352;
    wire _2356;
    wire _2364;
    wire [2:0] _2397;
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
    wire _2313;
    wire _2312;
    wire _2314;
    wire [2:0] _2316;
    wire _2308;
    wire _2307;
    wire _2309;
    wire [2:0] _2311;
    wire _2317;
    wire [2:0] _2318;
    wire _2301;
    wire _2300;
    wire _2302;
    wire [2:0] _2304;
    wire _2296;
    wire _2295;
    wire _2297;
    wire [2:0] _2299;
    wire _2305;
    wire [2:0] _2306;
    wire _2319;
    wire [2:0] _2320;
    wire _2347;
    wire [2:0] _2348;
    wire [2:0] _2349;
    wire [2:0] _2398;
    wire [2:0] _2293;
    wire _2399;
    wire [28:0] _2401;
    wire [31:0] _2403;
    wire [47:0] _2407;
    wire [47:0] _77;
    reg [47:0] _2431;
    wire [2:0] _2424;
    wire [3:0] _1990;
    wire [3:0] _2413;
    wire [3:0] _2414;
    wire [3:0] _2412;
    wire [3:0] _2415;
    wire [3:0] _1748;
    wire _1749;
    wire _2104;
    wire _78;
    wire _2105;
    wire _2410;
    wire [3:0] _2416;
    reg [3:0] _2419;
    wire [3:0] _79;
    wire _1991;
    wire _2408;
    wire _81;
    wire _2409;
    wire [2:0] _2425;
    wire [2:0] _82;
    reg [2:0] _2422;
    reg [47:0] _2474;
    wire [4:0] _2681;
    wire _2682;
    wire _2683;
    reg [7:0] _2684;
    wire [4:0] _2675;
    wire _2676;
    wire _2677;
    reg [7:0] _2678;
    wire [4:0] _2669;
    wire _2670;
    wire _2671;
    reg [7:0] _2672;
    wire [4:0] _2663;
    wire _2664;
    wire _2665;
    reg [7:0] _2666;
    wire [4:0] _2657;
    wire _2658;
    wire _2659;
    reg [7:0] _2660;
    wire [4:0] _2651;
    wire _2652;
    wire _2653;
    reg [7:0] _2654;
    wire [4:0] _2645;
    wire _2646;
    wire _2647;
    reg [7:0] _2648;
    wire [4:0] _2639;
    wire _2640;
    wire _2641;
    reg [7:0] _2642;
    wire [4:0] _2633;
    wire _2634;
    wire _2635;
    reg [7:0] _2636;
    wire [4:0] _2627;
    wire _2628;
    wire _2629;
    reg [7:0] _2630;
    wire [4:0] _2621;
    wire _2622;
    wire _2623;
    reg [7:0] _2624;
    wire [4:0] _2615;
    wire _2616;
    wire _2617;
    reg [7:0] _2618;
    wire [4:0] _2609;
    wire _2610;
    wire _2611;
    reg [7:0] _2612;
    wire [4:0] _2603;
    wire _2604;
    wire _2605;
    reg [7:0] _2606;
    wire [4:0] _2597;
    wire _2598;
    wire _2599;
    reg [7:0] _2600;
    wire [4:0] _2591;
    wire _2592;
    wire _2593;
    reg [7:0] _2594;
    wire [4:0] _2585;
    wire _2586;
    wire _2587;
    reg [7:0] _2588;
    wire [4:0] _2579;
    wire _2580;
    wire _2581;
    reg [7:0] _2582;
    wire [4:0] _2573;
    wire _2574;
    wire _2575;
    reg [7:0] _2576;
    wire [4:0] _2567;
    wire _2568;
    wire _2569;
    reg [7:0] _2570;
    wire [4:0] _2561;
    wire _2562;
    wire _2563;
    reg [7:0] _2564;
    wire [4:0] _2555;
    wire _2556;
    wire _2557;
    reg [7:0] _2558;
    wire [4:0] _2549;
    wire _2550;
    wire _2551;
    reg [7:0] _2552;
    wire [4:0] _2543;
    wire _2544;
    wire _2545;
    reg [7:0] _2546;
    wire [4:0] _2537;
    wire _2538;
    wire _2539;
    reg [7:0] _2540;
    wire [4:0] _2531;
    wire _2532;
    wire _2533;
    reg [7:0] _2534;
    wire [4:0] _2525;
    wire _2526;
    wire _2527;
    reg [7:0] _2528;
    wire [4:0] _2519;
    wire _2520;
    wire _2521;
    reg [7:0] _2522;
    wire [4:0] _2513;
    wire _2514;
    wire _2515;
    reg [7:0] _2516;
    wire [4:0] _2507;
    wire _2508;
    wire _2509;
    reg [7:0] _2510;
    wire _2502;
    wire _2503;
    reg [7:0] _2504;
    wire [4:0] _2483;
    wire [4:0] _2484;
    wire [4:0] _85;
    reg [4:0] _2481;
    wire _2496;
    wire _2497;
    reg [7:0] _2498;
    wire [4:0] _2491;
    wire [4:0] _2492;
    wire [4:0] _86;
    reg [4:0] _2489;
    reg [7:0] _2685;
    wire [31:0] _2686;
    wire [31:0] _2687;
    wire [31:0] _90;
    reg [31:0] ts_reg;
    wire [1:0] _2689;
    wire [1:0] _2404;
    wire [1:0] _2406;
    reg [1:0] _2690;
    reg _2693;
    reg [1:0] _2696;
    reg _2699;
    wire _2700;
    wire _2701;
    wire _2702;
    wire [7:0] _2843;
    wire [7:0] _2844;
    wire [7:0] _2724;
    wire [7:0] _2722;
    wire [7:0] _2721;
    wire [7:0] _2720;
    wire [7:0] _2719;
    reg [7:0] _2723;
    wire [7:0] _2725;
    wire [7:0] _2726;
    wire [7:0] _2717;
    wire [7:0] _2718;
    wire [7:0] _2727;
    wire [7:0] _2761;
    wire [7:0] _2762;
    wire [7:0] _2764;
    wire [7:0] _2766;
    wire [7:0] _100;
    reg [7:0] f_poe;
    wire [7:0] _2845;
    wire [7:0] _103;
    wire [7:0] _4632;
    wire _2840;
    wire _2839;
    wire _2837;
    wire _2838;
    wire _2836;
    wire _2835;
    wire _2834;
    wire [2:0] _2833;
    reg _2841;
    wire _2831;
    wire _2830;
    wire _2828;
    wire _2829;
    wire _2827;
    wire _2826;
    wire _2825;
    wire [2:0] _2824;
    reg _2832;
    wire _2822;
    wire _2821;
    wire _2819;
    wire _2820;
    wire _2818;
    wire _2817;
    wire _2816;
    wire [2:0] _2815;
    reg _2823;
    wire _2813;
    wire _2812;
    wire _2810;
    wire _2811;
    wire _2809;
    wire _2808;
    wire _2807;
    wire [2:0] _2806;
    reg _2814;
    wire _2804;
    wire _2803;
    wire _2801;
    wire _2802;
    wire _2800;
    wire _2799;
    wire _2798;
    wire [2:0] _2797;
    reg _2805;
    wire _2795;
    wire _2794;
    wire _2792;
    wire _2793;
    wire _2791;
    wire _2790;
    wire _2789;
    wire [2:0] _2788;
    reg _2796;
    wire _2786;
    wire _2785;
    wire _2783;
    wire _2784;
    wire _2782;
    wire _2781;
    wire _2780;
    wire [2:0] _2779;
    reg _2787;
    wire _2777;
    wire _2776;
    wire _2774;
    wire _2775;
    wire _2773;
    wire _2772;
    wire [2:0] _4624;
    wire _4621;
    wire [1:0] _4622;
    wire [3:0] _4623;
    wire [6:0] _4625;
    wire [7:0] _4626;
    wire [7:0] _4627;
    wire _2758;
    wire _2757;
    wire _2756;
    wire _2754;
    wire _2755;
    wire _2752;
    wire _2753;
    wire _2749;
    wire _2750;
    wire _2751;
    wire _2746;
    wire _2747;
    wire _2748;
    wire _2743;
    wire _2742;
    wire _2744;
    wire _2741;
    wire _2745;
    wire [7:0] _2759;
    wire _2728;
    wire _2734;
    wire [7:0] _2760;
    wire [7:0] _4619;
    wire [7:0] _4615;
    wire [7:0] _4613;
    wire [7:0] _4612;
    wire [7:0] _4611;
    wire [7:0] _4610;
    reg [7:0] _4614;
    wire [7:0] _4616;
    wire [7:0] _4617;
    wire [7:0] _2715;
    wire [7:0] _2713;
    wire [7:0] _2712;
    wire [7:0] _2711;
    wire [7:0] _2710;
    reg [7:0] _2714;
    wire [7:0] _2716;
    wire [7:0] _4608;
    wire [7:0] _4609;
    wire [7:0] _4618;
    wire [7:0] _4620;
    wire [7:0] _4628;
    wire _2704;
    wire _2705;
    wire _2706;
    wire [7:0] _4629;
    wire [31:0] _105;
    wire [31:0] _4601;
    wire [31:0] _2960;
    wire [30:0] _2958;
    wire [31:0] _2959;
    wire [31:0] _2961;
    wire [30:0] _2955;
    wire [31:0] _2956;
    wire [30:0] _2948;
    wire [31:0] _2949;
    wire [31:0] _2951;
    wire [30:0] _2945;
    wire [31:0] _2946;
    wire [30:0] _2938;
    wire [31:0] _2939;
    wire [31:0] _2941;
    wire [30:0] _2935;
    wire [31:0] _2936;
    wire [30:0] _2928;
    wire [31:0] _2929;
    wire [31:0] _2931;
    wire [30:0] _2925;
    wire [31:0] _2926;
    wire [30:0] _2918;
    wire [31:0] _2919;
    wire [31:0] _2921;
    wire [30:0] _2915;
    wire [31:0] _2916;
    wire [30:0] _2908;
    wire [31:0] _2909;
    wire [31:0] _2911;
    wire [30:0] _2905;
    wire [31:0] _2906;
    wire [30:0] _2898;
    wire [31:0] _2899;
    wire [31:0] _2901;
    wire [30:0] _2895;
    wire [31:0] _2896;
    wire [30:0] _2888;
    wire [31:0] _2889;
    wire [31:0] _2891;
    wire [30:0] _2885;
    wire [31:0] _2886;
    wire [7:0] _2879;
    wire [7:0] _2878;
    wire [7:0] _2877;
    wire [7:0] _2876;
    wire [7:0] _2875;
    wire [7:0] _2874;
    wire [7:0] _2873;
    wire [7:0] _2872;
    wire [7:0] _2871;
    wire [7:0] _2870;
    wire [7:0] _2869;
    wire [7:0] _2868;
    wire [7:0] _2867;
    wire [7:0] _2866;
    wire [7:0] _2865;
    wire [7:0] _2864;
    wire [12:0] _2861;
    wire [12:0] _2862;
    wire [3:0] _2863;
    reg [7:0] _2880;
    wire [23:0] _2860;
    wire [31:0] _2881;
    wire _2858;
    wire _2859;
    wire [31:0] _2963;
    wire [31:0] _2853;
    wire [31:0] _2964;
    wire [31:0] _106;
    reg [31:0] _2851;
    wire [31:0] _2882;
    wire _2883;
    wire [31:0] _2892;
    wire _2893;
    wire [31:0] _2902;
    wire _2903;
    wire [31:0] _2912;
    wire _2913;
    wire [31:0] _2922;
    wire _2923;
    wire [31:0] _2932;
    wire _2933;
    wire [31:0] _2942;
    wire _2943;
    wire [31:0] _2952;
    wire _2953;
    wire [31:0] _2962;
    wire [31:0] _4602;
    wire f_sw_match;
    wire _4604;
    wire _4606;
    wire _4596;
    wire _4598;
    wire _4600;
    wire [12:0] _4589;
    wire f_sw_last;
    wire _4592;
    wire _108;
    wire _4586;
    wire _4587;
    wire _4588;
    wire _4594;
    wire _2847;
    wire [1:0] _4578;
    wire [1:0] _4574;
    wire [1:0] _1967;
    wire _4565;
    wire [1:0] _4567;
    wire _4564;
    wire [1:0] _4569;
    wire _4563;
    wire [1:0] _4571;
    wire [1:0] _4572;
    wire [7:0] _1701;
    wire _1703;
    wire _1694;
    wire [15:0] _1689;
    wire _1690;
    wire _1691;
    wire _1688;
    wire _1692;
    wire _1695;
    wire [3:0] _1685;
    wire _1687;
    wire _1696;
    wire _1683;
    wire _1679;
    wire _1680;
    wire _1677;
    wire _1681;
    wire _1684;
    wire _1675;
    reg [2:0] _1669;
    wire [15:0] _1670;
    wire _1671;
    wire _1665;
    wire _1672;
    wire _1663;
    wire _1673;
    wire _1676;
    wire [1:0] _1662;
    reg _1697;
    wire _1661;
    wire _1698;
    wire _1658;
    wire [3:0] _1656;
    reg _1657;
    wire _1659;
    wire [15:0] _1651;
    wire _1653;
    wire [16:0] _1646;
    wire [15:0] _1642;
    wire [16:0] _1643;
    wire [16:0] _1644;
    reg [16:0] _1647;
    wire _1648;
    wire _1649;
    wire [15:0] _1638;
    wire _1640;
    wire _1622;
    wire [2:0] _1624;
    wire _1619;
    wire [2:0] _1621;
    wire _1625;
    wire [2:0] _1626;
    wire _1614;
    wire [2:0] _1616;
    wire _1611;
    wire [2:0] _1613;
    wire _1617;
    wire [2:0] _1618;
    wire _1627;
    wire [2:0] _1628;
    wire _1604;
    wire [2:0] _1606;
    wire _1601;
    wire [2:0] _1603;
    wire _1607;
    wire [2:0] _1608;
    wire _1596;
    wire [2:0] _1598;
    wire [7:0] _1592;
    wire _1593;
    wire [2:0] _1595;
    wire _1599;
    wire [2:0] _1600;
    wire _1609;
    wire [2:0] _1610;
    wire _1629;
    wire [2:0] _1630;
    wire [13:0] _1591;
    wire [16:0] _1631;
    wire [111:0] _1588;
    wire [15:0] _1589;
    wire [16:0] _1590;
    wire [16:0] _1632;
    reg [16:0] _1635;
    wire [16:0] _1587;
    wire _1636;
    wire _1637;
    wire _1641;
    wire _1650;
    wire [1:0] _1583;
    reg [15:0] _1584;
    wire _1586;
    wire _1654;
    wire [7:0] _1577;
    wire _1579;
    wire _1580;
    wire _1576;
    wire _1581;
    wire [7:0] _1570;
    wire [7:0] _1568;
    wire [7:0] _1569;
    wire [7:0] _1571;
    wire _1573;
    wire _1574;
    wire _1582;
    wire _1655;
    wire _1660;
    wire _1699;
    wire _1700;
    wire _1704;
    wire f_fire3;
    wire [7:0] _1252;
    wire _1254;
    wire _1240;
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
    reg [2:0] _1215;
    wire [15:0] _1216;
    wire _1217;
    wire _1211;
    wire _1218;
    wire _1209;
    wire _1219;
    wire _1222;
    wire [1:0] _1208;
    reg _1243;
    wire _1207;
    wire _1244;
    wire _1199;
    wire [3:0] _1175;
    reg _1198;
    wire _1200;
    wire [15:0] _1170;
    wire _1172;
    wire [15:0] _1161;
    wire [16:0] _1162;
    wire [16:0] _1163;
    reg [16:0] _1166;
    wire _1167;
    wire _1168;
    wire [15:0] _1157;
    wire _1159;
    wire _1123;
    wire [2:0] _1143;
    wire _1102;
    wire [2:0] _1122;
    wire _1144;
    wire [2:0] _1145;
    wire _1079;
    wire [2:0] _1099;
    wire _1058;
    wire [2:0] _1078;
    wire _1100;
    wire [2:0] _1101;
    wire _1146;
    wire [2:0] _1147;
    wire _1033;
    wire [2:0] _1053;
    wire _1012;
    wire [2:0] _1032;
    wire _1054;
    wire [2:0] _1055;
    wire _989;
    wire [2:0] _1009;
    wire [7:0] _967;
    wire _968;
    wire [2:0] _988;
    wire _1010;
    wire [2:0] _1011;
    wire _1056;
    wire [2:0] _1057;
    wire _1148;
    wire [2:0] _1149;
    wire [16:0] _1150;
    wire [111:0] _963;
    wire [15:0] _964;
    wire [16:0] _965;
    wire [16:0] _1151;
    reg [16:0] _1154;
    wire [16:0] _945;
    wire _1155;
    wire _1156;
    wire _1160;
    wire _1169;
    wire [1:0] _932;
    reg [15:0] _942;
    wire _944;
    wire _1173;
    wire [7:0] _926;
    wire _928;
    wire _929;
    wire _917;
    wire _930;
    wire [7:0] _910;
    wire [7:0] _908;
    wire [7:0] _909;
    wire [7:0] _911;
    wire _913;
    wire [127:0] _891;
    wire [2:0] _4548;
    wire [2:0] _4544;
    wire _4539;
    wire [2:0] _4541;
    wire [7:0] _1958;
    wire _1960;
    wire _1961;
    wire _1956;
    wire _1957;
    wire f_unexp_now;
    wire _2968;
    wire _2969;
    wire _2971;
    wire _2972;
    wire _2967;
    wire _2965;
    wire _2973;
    wire _109;
    reg _1953;
    wire _1954;
    wire [15:0] _4530;
    wire [15:0] _4531;
    wire _4527;
    wire _4528;
    wire _4529;
    wire [15:0] _4532;
    wire [2:0] _4472;
    wire [2:0] _4470;
    wire [2:0] _4469;
    wire [2:0] _4468;
    wire [2:0] _4467;
    wire [7:0] _1562;
    wire _1564;
    wire _1555;
    wire _1551;
    wire _1552;
    wire _1549;
    wire _1553;
    wire _1556;
    wire [3:0] _1546;
    wire _1548;
    wire _1557;
    wire _1544;
    wire _1540;
    wire _1541;
    wire _1538;
    wire _1542;
    wire _1545;
    wire _1536;
    reg [2:0] _1530;
    wire [15:0] _1531;
    wire _1532;
    wire _1526;
    wire _1533;
    wire _1524;
    wire _1534;
    wire _1537;
    wire [1:0] _1523;
    reg _1558;
    wire _1522;
    wire _1559;
    wire _1519;
    wire [3:0] _1517;
    reg _1518;
    wire _1520;
    wire [15:0] _1512;
    wire _1514;
    wire [15:0] _1503;
    wire [16:0] _1504;
    wire [16:0] _1505;
    reg [16:0] _1508;
    wire _1509;
    wire _1510;
    wire [15:0] _1499;
    wire _1501;
    wire _1483;
    wire [2:0] _1485;
    wire _1480;
    wire [2:0] _1482;
    wire _1486;
    wire [2:0] _1487;
    wire _1475;
    wire [2:0] _1477;
    wire _1472;
    wire [2:0] _1474;
    wire _1478;
    wire [2:0] _1479;
    wire _1488;
    wire [2:0] _1489;
    wire _1465;
    wire [2:0] _1467;
    wire _1462;
    wire [2:0] _1464;
    wire _1468;
    wire [2:0] _1469;
    wire _1457;
    wire [2:0] _1459;
    wire [7:0] _1453;
    wire _1454;
    wire [2:0] _1456;
    wire _1460;
    wire [2:0] _1461;
    wire _1470;
    wire [2:0] _1471;
    wire _1490;
    wire [2:0] _1491;
    wire [16:0] _1492;
    wire [111:0] _1449;
    wire [15:0] _1450;
    wire [16:0] _1451;
    wire [16:0] _1493;
    reg [16:0] _1496;
    wire [16:0] _1448;
    wire _1497;
    wire _1498;
    wire _1502;
    wire _1511;
    wire [1:0] _1444;
    reg [15:0] _1445;
    wire _1447;
    wire _1515;
    wire [7:0] _1438;
    wire _1440;
    wire _1441;
    wire _1437;
    wire _1442;
    wire [7:0] _1431;
    wire [7:0] _1429;
    wire [7:0] _1430;
    wire [7:0] _1432;
    wire _1434;
    wire _1435;
    wire _1443;
    wire _1516;
    wire _1521;
    wire _1560;
    wire _1561;
    wire _1565;
    wire f_fire2;
    wire [1:0] _1710;
    wire _1287;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _1277;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _1271;
    wire [7:0] _1265;
    wire [7:0] f_chgmask0;
    wire [7:0] _1259;
    wire [7:0] f_watch;
    wire [7:0] _1260;
    wire [7:0] _1266;
    wire [7:0] _1272;
    wire [7:0] f_relevant;
    wire [7:0] _1279;
    wire _1281;
    wire _1282;
    wire f_amb_now;
    wire _1284;
    wire _1288;
    wire [7:0] _1250;
    wire [7:0] _2978;
    wire [7:0] _2979;
    wire _2975;
    wire [7:0] _2977;
    wire _2974;
    wire [7:0] _2980;
    wire [7:0] _2982;
    wire [7:0] _110;
    reg [7:0] _1249;
    wire [7:0] f_multi_eff;
    wire [7:0] _1423;
    wire _1425;
    wire _1416;
    wire _1412;
    wire _1413;
    wire _1410;
    wire _1414;
    wire _1417;
    wire [3:0] _1407;
    wire _1409;
    wire _1418;
    wire _1405;
    wire _1401;
    wire _1402;
    wire _1399;
    wire _1403;
    wire _1406;
    wire _1397;
    reg [2:0] _1391;
    wire [15:0] _1392;
    wire _1393;
    wire _1387;
    wire _1394;
    wire _1385;
    wire _1395;
    wire _1398;
    wire [1:0] _1384;
    reg _1419;
    wire [1:0] _112;
    wire [1:0] _2983;
    wire [1:0] _113;
    reg [1:0] _1204;
    wire _1206;
    wire _1383;
    wire _1420;
    wire _1380;
    wire _2987;
    wire _2985;
    wire _2988;
    wire _2990;
    wire _2992;
    wire _114;
    reg _660;
    wire [15:0] _2999;
    wire [15:0] _3000;
    wire _3002;
    wire _2993;
    wire _3003;
    wire _3005;
    wire _3006;
    wire _3007;
    wire _3008;
    wire _3010;
    wire _3012;
    wire _115;
    reg _657;
    wire [15:0] _117;
    wire [15:0] _119;
    wire [15:0] _3050;
    wire [15:0] _3051;
    wire [15:0] _3052;
    wire _3054;
    wire _3025;
    wire _3026;
    wire _3028;
    wire _3029;
    wire _3030;
    wire _3031;
    wire _3033;
    wire _120;
    reg g_crc_bad;
    wire _3027;
    wire _3044;
    wire [5:0] _3042;
    wire _3043;
    wire _3045;
    wire _3046;
    wire _3047;
    wire _3048;
    wire _3049;
    wire _3037;
    wire _3035;
    wire _3034;
    wire _3036;
    wire _3038;
    wire _121;
    reg g_resid_chk;
    wire _3055;
    wire _3057;
    wire _3059;
    wire _122;
    reg _654;
    wire _3063;
    wire _3061;
    wire _3064;
    wire _3066;
    wire _3068;
    wire _123;
    reg _672;
    wire [15:0] _3075;
    wire [15:0] _3076;
    wire _3078;
    wire _3069;
    wire _3079;
    wire _3081;
    wire _3082;
    wire _3083;
    wire _3084;
    wire _3086;
    wire _3088;
    wire _124;
    reg _669;
    wire [15:0] _126;
    wire [15:0] _128;
    wire [15:0] _3126;
    wire [15:0] _3127;
    wire [15:0] _3128;
    wire _3130;
    wire _3101;
    wire _3102;
    wire _3104;
    wire _3105;
    wire _3106;
    wire _3107;
    wire _3109;
    wire _129;
    reg g_crc_bad_0;
    wire _3103;
    wire _3120;
    wire _3119;
    wire _3121;
    wire _3122;
    wire _3123;
    wire _3124;
    wire _3125;
    wire _3113;
    wire _3111;
    wire _3110;
    wire _3112;
    wire _3114;
    wire _130;
    reg g_resid_chk_0;
    wire _3131;
    wire _3133;
    wire _3135;
    wire _131;
    reg _666;
    wire [7:0] _133;
    wire [6:0] _1196;
    wire [6:0] _1195;
    wire _1197;
    wire [15:0] _1192;
    wire _3140;
    wire _3139;
    wire _3141;
    wire _3138;
    wire _3142;
    wire _3137;
    wire _3143;
    wire [14:0] _3136;
    wire [15:0] _3144;
    wire [15:0] _134;
    reg [15:0] _1193;
    wire _1194;
    wire [5:0] _742;
    wire [5:0] _3161;
    wire [5:0] _3157;
    wire [5:0] _3155;
    wire [5:0] _3158;
    wire _2476;
    wire _2485;
    wire _136;
    wire _2486;
    wire _2477;
    wire _3151;
    wire _3147;
    wire _3145;
    wire _3146;
    wire _3148;
    wire _3152;
    wire f_rx_push;
    wire _2478;
    wire _3153;
    wire [5:0] _3159;
    reg [5:0] _3162;
    wire [5:0] _138;
    wire _743;
    wire _1188;
    wire [6:0] _4241;
    wire [7:0] _4242;
    wire _4239;
    wire _4238;
    wire _4237;
    wire _4236;
    wire _4235;
    wire _4234;
    wire _4233;
    wire _4232;
    wire [7:0] _4240;
    wire [5:0] _4224;
    wire [5:0] _4222;
    wire [5:0] _4225;
    wire _745;
    wire _3178;
    wire _3175;
    wire _140;
    wire _3176;
    wire _739;
    wire [2:0] _733;
    wire _728;
    wire g_tx_bit;
    wire _729;
    wire _730;
    wire _731;
    wire [2:0] _734;
    wire _736;
    wire _737;
    wire _708;
    wire _738;
    wire _740;
    wire _704;
    wire [5:0] _695;
    wire _696;
    wire _697;
    wire [9:0] _691;
    wire _693;
    wire _694;
    wire _698;
    wire _4212;
    wire _4213;
    wire [1:0] _4216;
    wire _4205;
    wire _4206;
    wire _4207;
    wire _4208;
    wire [1:0] _4210;
    wire [2:0] _4191;
    wire [2:0] _4188;
    wire _4184;
    wire _4182;
    wire _4183;
    wire _4185;
    wire [2:0] _4189;
    wire _4180;
    wire [2:0] _4192;
    wire _4193;
    wire [2:0] _4174;
    wire _4170;
    wire _4168;
    wire _4169;
    wire _4171;
    wire [2:0] _4175;
    wire _4166;
    wire [2:0] _4177;
    wire _4178;
    wire _4194;
    wire _4195;
    wire _4196;
    wire _4162;
    wire _4160;
    wire _4163;
    wire [15:0] _4155;
    wire _4156;
    wire _4153;
    wire _4157;
    wire _4151;
    wire _4152;
    wire _4158;
    wire _4164;
    wire _4197;
    wire [1:0] _4199;
    wire [1:0] _4201;
    wire [1:0] _4147;
    wire _4143;
    wire [1:0] _4145;
    wire [1:0] _4148;
    wire _3398;
    wire _3399;
    wire _141;
    reg _3165;
    wire _4069;
    wire _4067;
    wire _4068;
    reg _4070;
    wire [2:0] _143;
    wire [2:0] _4051;
    wire [2:0] _4052;
    wire [2:0] _4047;
    wire _4043;
    wire _4041;
    wire _4042;
    wire _4044;
    wire [2:0] _4048;
    wire _4039;
    wire [2:0] _4053;
    wire [2:0] _4054;
    wire [2:0] _4033;
    wire [2:0] _4034;
    wire [2:0] _4029;
    wire _3394;
    wire _3393;
    wire _3392;
    wire _3391;
    wire _3390;
    wire _3389;
    wire _3388;
    wire _3384;
    wire _3383;
    wire _3382;
    wire _3381;
    wire _3380;
    wire _3379;
    wire _3378;
    wire _3370;
    wire _3371;
    reg [7:0] _3372;
    wire _3364;
    wire _3365;
    reg [7:0] _3366;
    wire _3358;
    wire _3359;
    reg [7:0] _3360;
    wire _3352;
    wire _3353;
    reg [7:0] _3354;
    wire _3346;
    wire _3347;
    reg [7:0] _3348;
    wire _3340;
    wire _3341;
    reg [7:0] _3342;
    wire _3334;
    wire _3335;
    reg [7:0] _3336;
    wire _3328;
    wire _3329;
    reg [7:0] _3330;
    wire _3322;
    wire _3323;
    reg [7:0] _3324;
    wire _3316;
    wire _3317;
    reg [7:0] _3318;
    wire _3310;
    wire _3311;
    reg [7:0] _3312;
    wire _3304;
    wire _3305;
    reg [7:0] _3306;
    wire _3298;
    wire _3299;
    reg [7:0] _3300;
    wire _3292;
    wire _3293;
    reg [7:0] _3294;
    wire _3286;
    wire _3287;
    reg [7:0] _3288;
    wire _3280;
    wire _3281;
    reg [7:0] _3282;
    wire _3274;
    wire _3275;
    reg [7:0] _3276;
    wire _3268;
    wire _3269;
    reg [7:0] _3270;
    wire _3262;
    wire _3263;
    reg [7:0] _3264;
    wire _3256;
    wire _3257;
    reg [7:0] _3258;
    wire _3250;
    wire _3251;
    reg [7:0] _3252;
    wire _3244;
    wire _3245;
    reg [7:0] _3246;
    wire _3238;
    wire _3239;
    reg [7:0] _3240;
    wire _3232;
    wire _3233;
    reg [7:0] _3234;
    wire _3226;
    wire _3227;
    reg [7:0] _3228;
    wire _3220;
    wire _3221;
    reg [7:0] _3222;
    wire _3214;
    wire _3215;
    reg [7:0] _3216;
    wire _3208;
    wire _3209;
    reg [7:0] _3210;
    wire _3202;
    wire _3203;
    reg [7:0] _3204;
    wire _3196;
    wire _3197;
    reg [7:0] _3198;
    wire _3190;
    wire _3191;
    reg [7:0] _3192;
    wire [4:0] _3401;
    wire [4:0] _3402;
    wire [4:0] _144;
    reg [4:0] _3182;
    wire _3184;
    wire _3185;
    wire [7:0] _3469;
    wire [7:0] _3470;
    wire [7:0] _3420;
    wire [7:0] _3418;
    wire [7:0] _3421;
    wire [7:0] _145;
    reg [7:0] _3407;
    wire [7:0] _3416;
    wire [7:0] _3417;
    wire [7:0] _3462;
    wire [7:0] _3429;
    wire [7:0] _3427;
    wire [7:0] _3430;
    wire [7:0] _146;
    reg [7:0] _3426;
    wire [6:0] _3447;
    wire [7:0] _3448;
    wire [6:0] _3445;
    wire _3443;
    wire _3442;
    wire _3441;
    wire _3440;
    wire _3439;
    wire _3438;
    wire _3437;
    wire _3436;
    wire [2:0] _3434;
    wire [2:0] _3433;
    wire [2:0] _3432;
    wire [2:0] _3431;
    reg [2:0] _3435;
    reg _3444;
    wire [7:0] _3446;
    reg [7:0] _3449;
    wire [7:0] _3450;
    wire [7:0] _147;
    reg [7:0] _1187;
    wire _3428;
    wire _3454;
    wire _3422;
    wire _3423;
    wire _3452;
    wire [1:0] _1718;
    wire [1:0] _1717;
    wire [1:0] _1716;
    wire [1:0] _1715;
    reg [1:0] _1719;
    wire [1:0] _1721;
    wire f_eng_push;
    wire _1724;
    wire _1730;
    wire _1727;
    wire _1728;
    wire _1726;
    wire _1729;
    wire _1731;
    wire _3455;
    wire _148;
    reg _876;
    wire [7:0] _3461;
    wire _3419;
    wire _3459;
    wire _839;
    wire [2:0] _833;
    wire _828;
    wire g_tx_bit_0;
    wire _829;
    wire _830;
    wire _831;
    wire [2:0] _834;
    wire _836;
    wire _837;
    wire _808;
    wire _838;
    wire _840;
    wire _804;
    wire _805;
    wire _841;
    wire _3403;
    wire _3404;
    wire _3457;
    wire _3460;
    wire _149;
    reg _774;
    wire _844;
    wire _843;
    wire _845;
    wire [7:0] _3463;
    wire [7:0] _3471;
    wire [7:0] _150;
    wire [7:0] _151;
    wire [7:0] _153;
    wire [7:0] _3172;
    reg [7:0] _3186;
    wire [4:0] _3860;
    wire _3857;
    wire _1818;
    wire _809;
    wire _3847;
    wire _3848;
    wire [1:0] _3851;
    wire _3840;
    wire _3841;
    wire _3842;
    wire _3843;
    wire [1:0] _3845;
    wire [2:0] _3826;
    wire [2:0] _3823;
    wire _3819;
    wire _3817;
    wire _3818;
    wire _3820;
    wire [2:0] _3824;
    wire _3815;
    wire [2:0] _3827;
    wire _3828;
    wire [2:0] _3809;
    wire _3805;
    wire _3803;
    wire _3804;
    wire _3806;
    wire [2:0] _3810;
    wire _3801;
    wire [2:0] _3812;
    wire _3813;
    wire _3829;
    wire _3830;
    wire _3831;
    wire _3797;
    wire _3795;
    wire _3798;
    wire [15:0] _3790;
    wire _3791;
    wire _3788;
    wire _3792;
    wire _3786;
    wire _3787;
    wire _3793;
    wire _3799;
    wire _3832;
    wire [1:0] _3834;
    wire [1:0] _3836;
    wire [1:0] _3782;
    wire _3778;
    wire [1:0] _3780;
    wire [1:0] _3783;
    wire _3499;
    wire _3500;
    wire _154;
    reg _3474;
    wire _3708;
    wire _3706;
    wire _3707;
    reg _3709;
    wire [2:0] _156;
    wire [2:0] _3690;
    wire [2:0] _3691;
    wire [2:0] _3686;
    wire _3682;
    wire _3680;
    wire _3681;
    wire _3683;
    wire [2:0] _3687;
    wire _3678;
    wire [2:0] _3692;
    wire [2:0] _3693;
    wire [2:0] _3672;
    wire [2:0] _3673;
    wire [2:0] _3668;
    wire _3495;
    wire _3494;
    wire _3493;
    wire _3492;
    wire _3491;
    wire _3490;
    wire _3489;
    wire _3485;
    wire _3484;
    wire _3483;
    wire _3482;
    wire _3481;
    wire _3480;
    wire _3479;
    wire [7:0] _3476;
    wire [6:0] _3413;
    wire [7:0] _3414;
    wire [6:0] _3411;
    wire [7:0] _3412;
    wire [7:0] _3415;
    wire [7:0] _3505;
    wire [7:0] _3506;
    wire [7:0] _3507;
    wire [7:0] _3508;
    wire [7:0] _3501;
    wire [7:0] _3502;
    wire [7:0] _3503;
    wire [7:0] _3504;
    wire [7:0] _3509;
    wire [7:0] _157;
    reg [7:0] g_byte;
    wire _1815;
    wire _1812;
    wire _1813;
    wire _1816;
    wire [7:0] _3477;
    wire _3478;
    wire [7:0] _3486;
    wire _159;
    wire [7:0] _3487;
    wire _3488;
    wire [2:0] _3517;
    wire [5:0] _795;
    wire _796;
    wire _797;
    wire [9:0] _791;
    wire _793;
    wire _794;
    wire _798;
    wire _799;
    wire [2:0] _3518;
    wire [2:0] _3519;
    wire [2:0] _3520;
    wire [2:0] _3521;
    wire [2:0] _3511;
    wire [2:0] _3512;
    wire [2:0] _3513;
    wire [2:0] _3514;
    wire [2:0] _3515;
    wire [2:0] _3522;
    wire [2:0] _3524;
    wire [2:0] _160;
    reg [2:0] g_bitpos;
    reg _3496;
    wire _162;
    wire [31:0] _164;
    wire [30:0] _3577;
    wire [31:0] _3579;
    wire _3570;
    wire _3571;
    wire [31:0] _3573;
    wire [30:0] _3567;
    wire [31:0] _3569;
    wire [31:0] _3574;
    wire [5:0] _3563;
    wire _3564;
    wire _3565;
    wire [9:0] _3558;
    wire _3560;
    wire _3561;
    wire _3557;
    wire _3562;
    wire _3566;
    wire [31:0] _3575;
    wire [31:0] _3576;
    wire [5:0] _166;
    wire [5:0] _3534;
    wire [5:0] _3535;
    wire [5:0] _3536;
    wire [5:0] _3537;
    wire [5:0] _3528;
    wire [5:0] _3529;
    wire [5:0] _3530;
    wire [5:0] _3531;
    wire [5:0] _3532;
    wire [5:0] _3538;
    wire [5:0] _3539;
    wire [5:0] _3541;
    wire [5:0] _167;
    reg [5:0] g_left;
    wire _824;
    wire _825;
    wire _3017;
    wire _3016;
    wire _3018;
    wire _3019;
    wire [31:0] _3580;
    wire [31:0] _3581;
    wire [31:0] _3582;
    wire [31:0] _169;
    wire _3548;
    wire _3549;
    wire [31:0] _3551;
    wire [30:0] _3545;
    wire [31:0] _3547;
    wire [31:0] _3552;
    wire [30:0] _3542;
    wire [31:0] _3544;
    wire [31:0] _3553;
    wire [31:0] _3554;
    wire [31:0] _3555;
    wire [31:0] _3556;
    wire [31:0] _3583;
    wire [31:0] _3584;
    wire [31:0] _3586;
    wire [31:0] _170;
    reg [31:0] g_crc;
    wire _3023;
    wire _3024;
    wire [7:0] _3602;
    wire [7:0] _3603;
    wire [7:0] _171;
    reg [7:0] g_lim;
    wire [15:0] _787;
    wire [15:0] _173;
    wire [14:0] _2997;
    wire [15:0] _2998;
    wire [15:0] _3604;
    wire [15:0] _3605;
    wire [15:0] _3606;
    wire [15:0] _3608;
    wire [15:0] _174;
    reg [15:0] g_sr;
    wire [3:0] _3594;
    wire [3:0] _176;
    wire _3595;
    wire [3:0] _3596;
    wire [7:0] _3598;
    wire [5:0] _178;
    wire [7:0] _3592;
    wire [7:0] _3599;
    wire [15:0] _3600;
    wire _3601;
    wire _3629;
    wire [5:0] _180;
    wire [5:0] _3615;
    wire _3616;
    wire [9:0] _3611;
    wire _3613;
    wire _182;
    wire _3609;
    wire _184;
    wire _3610;
    wire _3614;
    wire _3617;
    wire _3619;
    wire _3620;
    wire _3621;
    wire _3622;
    wire _3623;
    wire _3625;
    wire _3627;
    wire _185;
    reg g_len_cap;
    wire _3630;
    wire _3632;
    wire _186;
    reg g_len_known;
    wire [15:0] _788;
    wire [15:0] _3652;
    wire _776;
    wire _790;
    wire [15:0] _3653;
    wire _775;
    wire [15:0] _3654;
    wire _3635;
    wire _3633;
    wire _3634;
    wire _3636;
    wire _3638;
    wire _187;
    reg g_last;
    wire _638;
    wire _635;
    wire _639;
    wire _3640;
    wire _3641;
    wire _3642;
    wire _3644;
    wire _188;
    reg g_prev;
    wire _632;
    wire _629;
    wire _633;
    wire _640;
    wire _641;
    wire _642;
    wire [15:0] _3655;
    wire [15:0] _3646;
    wire [15:0] _3647;
    wire [15:0] _3648;
    wire [15:0] _3649;
    wire [15:0] _3650;
    wire [15:0] _3656;
    wire [15:0] _3658;
    wire [15:0] _189;
    reg [15:0] g_cnt;
    wire g_data_left;
    wire _3497;
    wire _3498;
    wire _3664;
    wire _3662;
    wire _3663;
    wire _3665;
    wire [2:0] _3669;
    wire _3660;
    wire [2:0] _3674;
    wire [2:0] _3675;
    wire [2:0] _3676;
    wire [2:0] _3694;
    wire [2:0] _3696;
    wire [2:0] _190;
    reg [2:0] g_run;
    wire _626;
    wire [1:0] _192;
    wire _621;
    wire _622;
    wire _627;
    wire _819;
    wire _826;
    wire _3710;
    wire _3711;
    wire _814;
    wire _812;
    wire _815;
    wire _816;
    wire _817;
    wire _3703;
    wire _3700;
    wire _3697;
    wire _3698;
    wire _3701;
    wire _3702;
    wire _3704;
    wire _3712;
    wire _3714;
    wire _3716;
    wire _3718;
    wire _3720;
    wire _193;
    reg f_lane1_out;
    wire _610;
    wire _611;
    wire _604;
    wire _605;
    wire _601;
    wire _195;
    wire _598;
    wire _599;
    wire _600;
    wire _602;
    wire _606;
    wire _607;
    wire _612;
    wire [1:0] _3785;
    wire _593;
    wire _594;
    reg _590;
    wire _591;
    wire _583;
    wire _582;
    wire _581;
    wire _580;
    wire _579;
    wire _578;
    wire _577;
    wire _576;
    wire [2:0] _197;
    reg _584;
    reg _587;
    wire _592;
    wire _199;
    wire _595;
    wire _574;
    wire _571;
    wire _564;
    wire _562;
    wire [13:0] _553;
    wire [15:0] _554;
    wire [14:0] _550;
    wire [15:0] _551;
    wire [15:0] _555;
    wire [14:0] _547;
    wire [15:0] _548;
    wire _545;
    wire [15:0] _556;
    reg [15:0] _559;
    wire _560;
    wire [13:0] _537;
    wire [15:0] _538;
    reg [15:0] _541;
    wire _3766;
    wire _3767;
    wire [15:0] _3768;
    wire [15:0] _3770;
    wire [15:0] _3772;
    wire _3750;
    wire [14:0] _566;
    wire [15:0] _567;
    reg [15:0] _570;
    wire [16:0] _3746;
    wire _3747;
    wire [16:0] _3740;
    reg [16:0] _3743;
    wire [16:0] _3735;
    wire [15:0] _201;
    wire [16:0] _3734;
    wire [16:0] _3736;
    reg [16:0] _3739;
    wire [7:0] _203;
    wire [8:0] _3754;
    wire [7:0] _3756;
    wire [7:0] _3757;
    wire [7:0] _3758;
    wire [7:0] _3760;
    wire [7:0] _204;
    reg [7:0] _3728;
    wire [8:0] _3753;
    wire [8:0] _3755;
    wire _3761;
    wire _3762;
    wire _3763;
    wire _3765;
    wire _205;
    reg _3733;
    wire [16:0] _3744;
    wire [16:0] _3730;
    wire _3745;
    wire _3748;
    wire _3751;
    wire _3729;
    wire _3752;
    wire [15:0] _3774;
    wire _3724;
    wire _3722;
    wire _651;
    wire _3721;
    wire _3723;
    wire _3725;
    wire [15:0] _3775;
    wire [15:0] _3777;
    wire [15:0] _206;
    reg [15:0] _535;
    wire _542;
    wire _543;
    wire _532;
    wire _544;
    wire _561;
    wire _563;
    wire _572;
    wire [1:0] _208;
    wire _528;
    wire _529;
    wire _526;
    wire _530;
    wire _523;
    reg _520;
    wire _513;
    wire _512;
    wire _511;
    wire _510;
    wire _509;
    wire _508;
    wire _507;
    wire _506;
    wire [2:0] _210;
    reg _514;
    reg _517;
    wire _521;
    wire _522;
    wire _524;
    wire _531;
    wire _575;
    wire _212;
    wire _596;
    wire _214;
    wire _505;
    wire _597;
    wire [1:0] _3837;
    wire _807;
    wire [1:0] _3839;
    wire _3526;
    wire [1:0] _3846;
    wire _499;
    wire [1:0] _3852;
    wire _496;
    wire _497;
    wire [1:0] _3854;
    wire [1:0] _215;
    reg [1:0] g_mode;
    wire _504;
    wire _810;
    wire _818;
    wire _1817;
    wire _1819;
    wire _1810;
    wire _1809;
    wire _1811;
    wire _1820;
    wire _1801;
    wire _1799;
    wire _1802;
    wire _3855;
    wire _3856;
    wire _216;
    wire _3858;
    wire [4:0] _3861;
    wire [4:0] _217;
    reg [4:0] _3171;
    reg [7:0] _3373;
    wire [7:0] _3375;
    wire [6:0] _3466;
    wire [7:0] _3467;
    wire [6:0] _3464;
    wire [7:0] _3465;
    wire [7:0] _3468;
    wire [7:0] _3866;
    wire [7:0] _3867;
    wire [7:0] _3868;
    wire [7:0] _3869;
    wire [7:0] _3862;
    wire [7:0] _3863;
    wire [7:0] _3864;
    wire [7:0] _3865;
    wire [7:0] _3870;
    wire [7:0] _218;
    reg [7:0] g_byte_0;
    wire _1807;
    wire _1804;
    wire _1805;
    wire _1808;
    wire [7:0] _3376;
    wire _3377;
    wire [7:0] _3385;
    wire _220;
    wire [7:0] _3386;
    wire _3387;
    wire [2:0] _3878;
    wire [2:0] _3879;
    wire [2:0] _3880;
    wire [2:0] _3881;
    wire [2:0] _3882;
    wire [2:0] _3872;
    wire [2:0] _3873;
    wire [2:0] _3874;
    wire [2:0] _3875;
    wire [2:0] _3876;
    wire [2:0] _3883;
    wire [2:0] _3885;
    wire [2:0] _221;
    reg [2:0] g_bitpos_0;
    reg _3395;
    wire _223;
    wire [31:0] _225;
    wire [30:0] _3938;
    wire [31:0] _3940;
    wire _3931;
    wire _3932;
    wire [31:0] _3934;
    wire [30:0] _3928;
    wire [31:0] _3930;
    wire [31:0] _3935;
    wire [5:0] _3924;
    wire _3925;
    wire _3926;
    wire [9:0] _3919;
    wire _3921;
    wire _3922;
    wire _3918;
    wire _3923;
    wire _3927;
    wire [31:0] _3936;
    wire [31:0] _3937;
    wire [5:0] _227;
    wire [5:0] _3895;
    wire [5:0] _3896;
    wire [5:0] _3897;
    wire [5:0] _3898;
    wire [5:0] _3889;
    wire [5:0] _3890;
    wire [5:0] _3891;
    wire [5:0] _3892;
    wire [5:0] _3893;
    wire [5:0] _3899;
    wire [5:0] _3900;
    wire [5:0] _3902;
    wire [5:0] _228;
    reg [5:0] g_left_0;
    wire _724;
    wire _725;
    wire _3093;
    wire _3092;
    wire _3094;
    wire _3095;
    wire [31:0] _3941;
    wire [31:0] _3942;
    wire [31:0] _3943;
    wire [31:0] _230;
    wire _3909;
    wire _3910;
    wire [31:0] _3912;
    wire [30:0] _3906;
    wire [31:0] _3908;
    wire [31:0] _3913;
    wire [30:0] _3903;
    wire [31:0] _3905;
    wire [31:0] _3914;
    wire [31:0] _3915;
    wire [31:0] _3916;
    wire [31:0] _3917;
    wire [31:0] _3944;
    wire [31:0] _3945;
    wire [31:0] _3947;
    wire [31:0] _231;
    reg [31:0] g_crc_0;
    wire _3099;
    wire _3100;
    wire [7:0] _3963;
    wire [7:0] _3964;
    wire [7:0] _232;
    reg [7:0] g_lim_0;
    wire [15:0] _687;
    wire [15:0] _234;
    wire [14:0] _3073;
    wire [15:0] _3074;
    wire [15:0] _3965;
    wire [15:0] _3966;
    wire [15:0] _3967;
    wire [15:0] _3969;
    wire [15:0] _235;
    reg [15:0] g_sr_0;
    wire [3:0] _3955;
    wire [3:0] _237;
    wire _3956;
    wire [3:0] _3957;
    wire [7:0] _3959;
    wire [5:0] _239;
    wire [7:0] _3953;
    wire [7:0] _3960;
    wire [15:0] _3961;
    wire _3962;
    wire _3990;
    wire [5:0] _241;
    wire [5:0] _3976;
    wire _3977;
    wire [9:0] _3972;
    wire _3974;
    wire _243;
    wire _3970;
    wire _245;
    wire _3971;
    wire _3975;
    wire _3978;
    wire _3980;
    wire _3981;
    wire _3982;
    wire _3983;
    wire _3984;
    wire _3986;
    wire _3988;
    wire _246;
    reg g_len_cap_0;
    wire _3991;
    wire _3993;
    wire _247;
    reg g_len_known_0;
    wire [15:0] _688;
    wire [15:0] _4013;
    wire [15:0] _4014;
    wire _675;
    wire [15:0] _4015;
    wire _3996;
    wire _3994;
    wire _3995;
    wire _3997;
    wire _3999;
    wire _248;
    reg g_last_0;
    wire _483;
    wire _479;
    wire _484;
    wire _4001;
    wire _4002;
    wire _4003;
    wire _4005;
    wire _249;
    reg g_prev_0;
    wire _476;
    wire _473;
    wire _477;
    wire _485;
    wire _486;
    wire _487;
    wire [15:0] _4016;
    wire [15:0] _4007;
    wire [15:0] _4008;
    wire [15:0] _4009;
    wire [15:0] _4010;
    wire [15:0] _4011;
    wire [15:0] _4017;
    wire [15:0] _4019;
    wire [15:0] _250;
    reg [15:0] g_cnt_0;
    wire g_data_left_0;
    wire _3396;
    wire _3397;
    wire _4025;
    wire _4023;
    wire _4024;
    wire _4026;
    wire [2:0] _4030;
    wire _4021;
    wire [2:0] _4035;
    wire [2:0] _4036;
    wire [2:0] _4037;
    wire [2:0] _4055;
    wire [2:0] _4057;
    wire [2:0] _251;
    reg [2:0] g_run_0;
    wire _470;
    wire [1:0] _253;
    wire _465;
    wire _466;
    wire _471;
    wire _719;
    wire _726;
    wire _4071;
    wire _709;
    wire _710;
    wire _718;
    wire _4072;
    wire _714;
    wire _712;
    wire _715;
    wire _716;
    wire _717;
    wire _4064;
    wire _4061;
    wire _4058;
    wire _4059;
    wire _4062;
    wire _4063;
    wire _4065;
    wire _4073;
    wire _4075;
    wire _4077;
    wire _4079;
    wire _4081;
    wire _254;
    reg f_lane0_out;
    wire _454;
    wire _455;
    wire _437;
    wire _438;
    reg _434;
    wire _435;
    wire _427;
    wire _426;
    wire _425;
    wire _424;
    wire _423;
    wire _422;
    wire _421;
    wire _420;
    wire [2:0] _256;
    reg _428;
    reg _431;
    wire _436;
    wire _258;
    wire _439;
    wire _418;
    wire _415;
    wire _408;
    wire _406;
    wire [13:0] _397;
    wire [15:0] _398;
    wire [14:0] _394;
    wire [15:0] _395;
    wire [15:0] _399;
    wire [14:0] _391;
    wire [15:0] _392;
    wire _389;
    wire [15:0] _400;
    reg [15:0] _403;
    wire _404;
    wire [13:0] _381;
    wire [15:0] _382;
    reg [15:0] _385;
    wire _4127;
    wire _4128;
    wire [15:0] _4129;
    wire [15:0] _4131;
    wire [15:0] _4133;
    wire _4111;
    wire [14:0] _410;
    wire [15:0] _411;
    reg [15:0] _414;
    wire [16:0] _4107;
    wire _4108;
    wire [16:0] _4101;
    reg [16:0] _4104;
    wire [15:0] _260;
    wire [16:0] _4095;
    wire [16:0] _4097;
    reg [16:0] _4100;
    wire [7:0] _262;
    wire [8:0] _4115;
    wire [7:0] _4117;
    wire [7:0] _4118;
    wire [7:0] _4119;
    wire [7:0] _4121;
    wire [7:0] _263;
    reg [7:0] _4089;
    wire [8:0] _4114;
    wire [8:0] _4116;
    wire _4122;
    wire _4123;
    wire _4124;
    wire _4126;
    wire _264;
    reg _4094;
    wire [16:0] _4105;
    wire [16:0] _4091;
    wire _4106;
    wire _4109;
    wire _4112;
    wire _4090;
    wire _4113;
    wire [15:0] _4135;
    wire _4085;
    wire _4083;
    wire _663;
    wire _4082;
    wire _4084;
    wire _4086;
    wire [15:0] _4136;
    wire [15:0] _4138;
    wire [15:0] _265;
    reg [15:0] _379;
    wire _386;
    wire _387;
    wire _376;
    wire _388;
    wire _405;
    wire _407;
    wire _416;
    wire _372;
    wire _373;
    wire _370;
    wire _374;
    wire _367;
    reg _364;
    wire _357;
    wire _356;
    wire _355;
    wire _354;
    wire _353;
    wire _352;
    wire _351;
    wire _350;
    wire [2:0] _267;
    reg _358;
    reg _361;
    wire _365;
    wire _366;
    wire _368;
    wire _375;
    wire _419;
    wire _440;
    wire [1:0] _269;
    wire _448;
    wire _449;
    wire _271;
    wire _445;
    wire _273;
    wire _275;
    wire _442;
    wire _443;
    wire _444;
    wire _446;
    wire _450;
    wire _451;
    wire _456;
    wire [1:0] _4150;
    wire [1:0] _4202;
    wire _707;
    wire [1:0] _4204;
    wire _3887;
    wire [1:0] _4211;
    wire _339;
    wire [1:0] _4217;
    wire [2:0] _2739;
    wire [2:0] _2738;
    wire [2:0] _2737;
    wire [2:0] _2736;
    reg [2:0] _2740;
    wire _2732;
    wire _2731;
    wire _2730;
    wire _2729;
    reg _2733;
    wire _4139;
    wire _4140;
    wire [2:0] _4142;
    wire [2:0] _276;
    wire _336;
    wire _337;
    wire [1:0] _4219;
    wire [1:0] _277;
    reg [1:0] g_mode_0;
    wire _345;
    wire _346;
    wire _441;
    wire _676;
    wire _690;
    wire _699;
    wire _705;
    wire _741;
    wire _3149;
    wire _279;
    wire _3150;
    wire _280;
    wire _3177;
    wire _3179;
    wire _4220;
    wire [5:0] _4226;
    reg [5:0] _4229;
    wire [5:0] _281;
    wire _1190;
    wire [7:0] _4231;
    wire [1:0] _1796;
    wire [1:0] _1794;
    wire [1:0] _1793;
    wire [1:0] _1792;
    wire [1:0] _1791;
    reg [1:0] _1795;
    wire [1:0] _1797;
    reg [7:0] _4243;
    wire [7:0] _4244;
    wire [7:0] _282;
    reg [7:0] _1183;
    wire _1184;
    wire [7:0] _4255;
    wire [7:0] _4254;
    wire [7:0] _4253;
    wire [1:0] _4250;
    wire [1:0] _4248;
    wire [1:0] _4247;
    wire [1:0] _4246;
    wire [1:0] _4245;
    reg [1:0] _4249;
    wire [1:0] _4251;
    reg [7:0] _4256;
    wire [7:0] _4257;
    wire [7:0] _283;
    reg [7:0] _1178;
    wire _1180;
    wire [3:0] _1378;
    reg _1379;
    wire _1381;
    wire [15:0] _1373;
    wire _1375;
    wire [15:0] _1364;
    wire [16:0] _1365;
    wire [16:0] _1366;
    reg [16:0] _1369;
    wire _1370;
    wire _1371;
    wire [15:0] _1360;
    wire _1362;
    wire [2:0] _1138;
    wire [2:0] _4272;
    wire _4268;
    wire _4269;
    wire _4266;
    wire _4270;
    wire [2:0] _4273;
    wire _4263;
    wire _4264;
    wire _4262;
    wire _4265;
    wire [2:0] _4275;
    wire _4259;
    wire [2:0] _4261;
    wire _4258;
    wire [2:0] _4276;
    wire [2:0] _284;
    reg [2:0] _1134;
    wire _1136;
    wire [2:0] _1139;
    wire _1129;
    wire _1130;
    wire _1128;
    wire _1131;
    wire [2:0] _1141;
    wire _1125;
    wire _1126;
    wire [2:0] _1142;
    wire _1344;
    wire [2:0] _1346;
    wire [2:0] _1117;
    wire [2:0] _4291;
    wire _4287;
    wire _4288;
    wire _4285;
    wire _4289;
    wire [2:0] _4292;
    wire _4282;
    wire _4283;
    wire _4281;
    wire _4284;
    wire [2:0] _4294;
    wire _4278;
    wire [2:0] _4280;
    wire _4277;
    wire [2:0] _4295;
    wire [2:0] _285;
    reg [2:0] _1113;
    wire _1115;
    wire [2:0] _1118;
    wire _1108;
    wire _1109;
    wire _1107;
    wire _1110;
    wire [2:0] _1120;
    wire _1104;
    wire _1105;
    wire [2:0] _1121;
    wire _1341;
    wire [2:0] _1343;
    wire _1347;
    wire [2:0] _1348;
    wire [2:0] _1094;
    wire [2:0] _4310;
    wire _4306;
    wire _4307;
    wire _4304;
    wire _4308;
    wire [2:0] _4311;
    wire _4301;
    wire _4302;
    wire _4300;
    wire _4303;
    wire [2:0] _4313;
    wire _4297;
    wire [2:0] _4299;
    wire _4296;
    wire [2:0] _4314;
    wire [2:0] _286;
    reg [2:0] _1090;
    wire _1092;
    wire [2:0] _1095;
    wire _1085;
    wire _1086;
    wire _1084;
    wire _1087;
    wire [2:0] _1097;
    wire _1081;
    wire _1082;
    wire [2:0] _1098;
    wire _1336;
    wire [2:0] _1338;
    wire [2:0] _1073;
    wire [2:0] _4329;
    wire _4325;
    wire _4326;
    wire _4323;
    wire _4327;
    wire [2:0] _4330;
    wire _4320;
    wire _4321;
    wire _4319;
    wire _4322;
    wire [2:0] _4332;
    wire _4316;
    wire [2:0] _4318;
    wire _4315;
    wire [2:0] _4333;
    wire [2:0] _287;
    reg [2:0] _1069;
    wire _1071;
    wire [2:0] _1074;
    wire _1064;
    wire _1065;
    wire _1063;
    wire _1066;
    wire [2:0] _1076;
    wire _1060;
    wire _1061;
    wire [2:0] _1077;
    wire _1333;
    wire [2:0] _1335;
    wire _1339;
    wire [2:0] _1340;
    wire _1349;
    wire [2:0] _1350;
    wire [2:0] _1048;
    wire [2:0] _4348;
    wire _4344;
    wire _4345;
    wire _4342;
    wire _4346;
    wire [2:0] _4349;
    wire _4339;
    wire _4340;
    wire _4338;
    wire _4341;
    wire [2:0] _4351;
    wire _4335;
    wire [2:0] _4337;
    wire _4334;
    wire [2:0] _4352;
    wire [2:0] _288;
    reg [2:0] _1044;
    wire _1046;
    wire [2:0] _1049;
    wire _1039;
    wire _1040;
    wire _1038;
    wire _1041;
    wire [2:0] _1051;
    wire _1035;
    wire _1036;
    wire [2:0] _1052;
    wire _1326;
    wire [2:0] _1328;
    wire [2:0] _1027;
    wire [2:0] _4367;
    wire _4363;
    wire _4364;
    wire _4361;
    wire _4365;
    wire [2:0] _4368;
    wire _4358;
    wire _4359;
    wire _4357;
    wire _4360;
    wire [2:0] _4370;
    wire _4354;
    wire [2:0] _4356;
    wire _4353;
    wire [2:0] _4371;
    wire [2:0] _289;
    reg [2:0] _1023;
    wire _1025;
    wire [2:0] _1028;
    wire _1018;
    wire _1019;
    wire _1017;
    wire _1020;
    wire [2:0] _1030;
    wire _1014;
    wire _1015;
    wire [2:0] _1031;
    wire _1323;
    wire [2:0] _1325;
    wire _1329;
    wire [2:0] _1330;
    wire [2:0] _1004;
    wire [2:0] _4386;
    wire _4382;
    wire _4383;
    wire _4380;
    wire _4384;
    wire [2:0] _4387;
    wire _4377;
    wire _4378;
    wire _4376;
    wire _4379;
    wire [2:0] _4389;
    wire _4373;
    wire [2:0] _4375;
    wire _4372;
    wire [2:0] _4390;
    wire [2:0] _290;
    reg [2:0] _1000;
    wire _1002;
    wire [2:0] _1005;
    wire _995;
    wire _996;
    wire _994;
    wire _997;
    wire [2:0] _1007;
    wire _991;
    wire _992;
    wire [2:0] _1008;
    wire _1318;
    wire [2:0] _1320;
    wire [2:0] _983;
    wire [2:0] _4405;
    wire _4401;
    wire _4402;
    wire _4399;
    wire _4403;
    wire [2:0] _4406;
    wire _4396;
    wire _4397;
    wire _4395;
    wire _4398;
    wire [2:0] _4408;
    wire _4392;
    wire [2:0] _4394;
    wire _4391;
    wire [2:0] _4409;
    wire [2:0] _291;
    reg [2:0] _979;
    wire _981;
    wire [2:0] _984;
    wire _974;
    wire _975;
    wire _973;
    wire _976;
    wire [2:0] _986;
    wire _970;
    wire _971;
    wire [2:0] _987;
    wire [7:0] _1314;
    wire _1315;
    wire [2:0] _1317;
    wire _1321;
    wire [2:0] _1322;
    wire _1331;
    wire [2:0] _1332;
    wire _1351;
    wire [2:0] _1352;
    wire [16:0] _1353;
    wire _4412;
    wire [127:0] _4413;
    wire _4410;
    wire [127:0] _4414;
    wire [127:0] _292;
    reg [127:0] _901;
    wire _959;
    wire _960;
    wire [127:0] _961;
    wire _4417;
    wire [127:0] _4418;
    wire _4415;
    wire [127:0] _4419;
    wire [127:0] _293;
    reg [127:0] _898;
    wire _955;
    wire _956;
    wire [127:0] _957;
    wire _4422;
    wire [127:0] _4423;
    wire _4420;
    wire [127:0] _4424;
    wire [127:0] _294;
    reg [127:0] _895;
    wire _951;
    wire _952;
    wire [127:0] _953;
    wire _4465;
    wire _4459;
    wire _296;
    wire _4458;
    wire f_store_we;
    wire [127:0] _298;
    reg [127:0] _4461[0:255];
    wire [1:0] _4455;
    wire [5:0] _300;
    wire [111:0] _1273;
    wire [5:0] _4437;
    wire [111:0] _1267;
    wire [5:0] _4436;
    wire [5:0] _4435;
    wire [5:0] _4434;
    reg [5:0] _4438;
    wire _4439;
    wire _4440;
    wire [5:0] _4441;
    wire [5:0] _302;
    wire [5:0] _4428;
    wire [5:0] _303;
    reg [5:0] _4427;
    wire [1:0] f_policy;
    wire _4431;
    wire [5:0] _4432;
    wire [5:0] _4433;
    wire [5:0] _4442;
    wire _4429;
    wire [5:0] _4443;
    wire [5:0] _4444;
    wire [5:0] _304;
    reg [5:0] _1770;
    wire [7:0] _4456;
    wire [12:0] _4448;
    wire [12:0] _4446;
    wire [12:0] _4449;
    wire [12:0] _305;
    reg [12:0] f_sw_cnt;
    wire [7:0] _4453;
    wire [7:0] _307;
    wire [7:0] _4454;
    wire _4451;
    wire _4452;
    wire [7:0] _4457;
    wire [127:0] _4462;
    reg [127:0] _4466;
    wire [127:0] _308;
    wire _947;
    wire _948;
    wire [127:0] _949;
    wire [511:0] _962;
    wire [111:0] _1310;
    wire [15:0] _1311;
    wire [16:0] _1312;
    wire [16:0] _1354;
    reg [16:0] _1357;
    wire gnd;
    wire [16:0] _1309;
    wire _1358;
    wire _1359;
    wire _1363;
    wire _1372;
    wire [15:0] _4494;
    wire _4490;
    wire _4491;
    wire _4492;
    wire [15:0] _4495;
    wire _4474;
    wire _4475;
    wire [15:0] _4497;
    wire [15:0] _4499;
    wire [15:0] _309;
    reg [15:0] _941;
    wire [15:0] _4511;
    wire _4507;
    wire _4508;
    wire [8:0] _4486;
    wire _4487;
    wire [5:0] _4484;
    wire [5:0] _4483;
    wire _4485;
    wire [8:0] _4478;
    wire [8:0] _4500;
    wire [8:0] _4501;
    wire [8:0] _4503;
    wire [8:0] _310;
    reg [8:0] _4479;
    wire [2:0] _4480;
    wire _4482;
    wire [1:0] _4476;
    reg _4488;
    wire _4509;
    wire [15:0] _4512;
    wire _4504;
    wire _4505;
    wire [15:0] _4514;
    wire [15:0] _4516;
    wire [15:0] _311;
    reg [15:0] _938;
    wire [1:0] _1305;
    reg [15:0] _1306;
    wire _1308;
    wire _1376;
    reg [7:0] _923;
    wire [7:0] f_chg_now;
    wire _4518;
    wire [7:0] _4520;
    wire _4517;
    wire [7:0] _4521;
    wire [7:0] _4523;
    wire [7:0] _312;
    reg [7:0] _920;
    wire [7:0] f_changed_all;
    wire [7:0] _1299;
    wire _1301;
    wire _1302;
    wire [7:0] f_chgmask1;
    wire _1298;
    wire _1303;
    wire [7:0] _1292;
    wire [7:0] _1290;
    wire vdd;
    wire _314;
    wire _316;
    wire [7:0] _318;
    reg [7:0] _349;
    reg [7:0] _907;
    wire [7:0] _1291;
    wire [7:0] _1293;
    wire _1295;
    wire [111:0] _1261;
    wire f_valid1;
    wire _1296;
    wire _1304;
    wire _1377;
    wire _1382;
    wire _1421;
    wire _1422;
    wire _1426;
    wire f_fire1;
    wire [1:0] _1712;
    wire [1:0] f_winner;
    reg [2:0] _4471;
    wire [2:0] _4473;
    wire _4524;
    wire _886;
    wire f_in_fetch;
    wire _887;
    wire _1707;
    wire _4525;
    wire [15:0] _4534;
    wire [15:0] _4536;
    wire [15:0] _319;
    reg [15:0] _935;
    wire [1:0] _1947;
    reg [15:0] _1948;
    wire [15:0] _1946;
    wire _1949;
    wire [63:0] _1256;
    wire _1944;
    wire _1942;
    wire _1943;
    wire _1945;
    wire _1950;
    wire _1955;
    wire _1963;
    wire f_viol_now;
    wire [2:0] _4542;
    wire [2:0] _4545;
    wire _4538;
    wire [2:0] _4546;
    wire _4537;
    wire [2:0] _4549;
    wire [2:0] _4551;
    wire [2:0] _320;
    reg [2:0] _884;
    wire _4554;
    wire [127:0] _4555;
    wire _4552;
    wire [127:0] _4556;
    wire [127:0] _321;
    reg [127:0] _892;
    wire [511:0] _902;
    wire [111:0] _903;
    wire f_valid0;
    wire _914;
    wire _931;
    wire _1174;
    wire _1201;
    wire _1245;
    wire f_in_eval;
    wire _1246;
    wire _1255;
    wire f_fire0;
    wire _1428;
    wire _1567;
    wire _1706;
    wire [1:0] _4575;
    wire _4560;
    wire [1:0] _4562;
    wire _4558;
    wire [1:0] _4576;
    wire _4557;
    wire [1:0] _4579;
    wire _323;
    wire [1:0] _4581;
    wire [1:0] _4583;
    wire [1:0] _324;
    reg [1:0] _879;
    wire _1839;
    wire _326;
    wire _2846;
    wire _2848;
    wire _4585;
    wire _4595;
    wire _327;
    reg f_sweeping;
    wire _4607;
    wire _328;
    reg f_image_valid;
    wire _330;
    wire _1899;
    wire [7:0] _4631;
    wire [7:0] _331;
    reg [7:0] f_pout;
    wire _2771;
    wire [23:0] _333;
    wire [2:0] _2767;
    reg _2778;
    wire [7:0] _2842;
    wire [7:0] _4633;
    assign _458 = 3'b000;
    assign _488 = 3'b001;
    assign _489 = _487 ? _488 : _463;
    assign _461 = 3'b100;
    assign _460 = 3'b010;
    assign _462 = f_lane0_out ? _461 : _460;
    assign _463 = _456 ? _462 : _459;
    assign _490 = _441 ? _489 : _463;
    assign _492 = _339 ? _458 : _490;
    assign _494 = _337 ? _458 : _492;
    assign _1 = _494;
    always @(posedge _316) begin
        if (_314)
            _459 <= _458;
        else
            _459 <= _1;
    end
    assign _673 = { _663,
                    _666,
                    _669,
                    _672,
                    gnd,
                    _459 };
    assign _644 = _642 ? _488 : _619;
    assign _618 = f_lane1_out ? _461 : _460;
    assign _619 = _612 ? _618 : _615;
    assign _645 = _597 ? _644 : _619;
    assign _647 = _499 ? _458 : _645;
    assign _649 = _497 ? _458 : _647;
    assign _2 = _649;
    always @(posedge _316) begin
        if (_314)
            _615 <= _458;
        else
            _615 <= _2;
    end
    assign _661 = { _651,
                    _654,
                    _657,
                    _660,
                    gnd,
                    _615 };
    assign _674 = { _661,
                    _673 };
    assign _761 = 8'b00000000;
    assign _767 = 8'b00000001;
    assign _768 = _762 + _767;
    assign _763 = 8'b11111111;
    assign _764 = _762 == _763;
    assign _765 = ~ _764;
    assign _757 = ~ _705;
    assign _754 = _734 == _458;
    assign _755 = ~ _754;
    assign _751 = _345 | _663;
    assign _748 = ~ _707;
    assign _749 = _337 & _748;
    assign _750 = _749 & _275;
    assign _752 = _750 & _751;
    assign _756 = _752 & _755;
    assign _758 = _756 & _757;
    assign _747 = _741 & _746;
    assign _759 = _747 | _758;
    assign _766 = _759 & _765;
    assign _769 = _766 ? _768 : _762;
    assign _771 = _9 ? _761 : _769;
    assign _4 = _771;
    always @(posedge _316) begin
        if (_314)
            _762 <= _761;
        else
            _762 <= _4;
    end
    assign _870 = _864 + _767;
    assign _866 = _864 == _763;
    assign _867 = ~ _866;
    assign _859 = ~ _805;
    assign _856 = _834 == _458;
    assign _857 = ~ _856;
    assign _853 = _504 | _651;
    assign _850 = ~ _807;
    assign _851 = _497 & _850;
    assign _852 = _851 & _214;
    assign _854 = _852 & _853;
    assign _858 = _854 & _857;
    assign _860 = _858 & _859;
    assign _746 = _279 ? _745 : _743;
    assign _848 = _845 & _746;
    assign _849 = _847 | _848;
    assign _861 = _849 | _860;
    assign _868 = _861 & _867;
    assign _871 = _868 ? _870 : _864;
    assign _873 = _9 ? _761 : _871;
    assign _5 = _873;
    always @(posedge _316) begin
        if (_314)
            _864 <= _761;
        else
            _864 <= _5;
    end
    assign _1744 = _1738 + _767;
    assign _1740 = _1738 == _763;
    assign _1741 = ~ _1740;
    assign _1734 = _1731 & _743;
    assign _1735 = _1733 | _1734;
    assign _1742 = _1735 & _1741;
    assign _1745 = _1742 ? _1744 : _1738;
    assign _1747 = _9 ? _761 : _1745;
    assign _6 = _1747;
    always @(posedge _316) begin
        if (_314)
            _1738 <= _761;
        else
            _1738 <= _6;
    end
    assign _1759 = _1753 + _767;
    assign _1755 = _1753 == _763;
    assign _1756 = ~ _1755;
    assign _1757 = _1750 & _1756;
    assign _1760 = _1757 ? _1759 : _1753;
    assign _1762 = _9 ? _761 : _1760;
    assign _7 = _1762;
    always @(posedge _316) begin
        if (_314)
            _1753 <= _761;
        else
            _1753 <= _7;
    end
    assign _1786 = _1780 + _767;
    assign _1782 = _1780 == _763;
    assign _1783 = ~ _1782;
    assign _1784 = _1777 & _1783;
    assign _1787 = _1784 ? _1786 : _1780;
    assign _9 = host_drop_clear;
    assign _1789 = _9 ? _761 : _1787;
    assign _10 = _1789;
    always @(posedge _316) begin
        if (_314)
            _1780 <= _761;
        else
            _1780 <= _10;
    end
    assign _1790 = { _1780,
                     _1753,
                     _1738,
                     _864,
                     _762 };
    assign _1823 = 1'b0;
    assign _1825 = 1'b1;
    assign _1803 = _1707 & _1802;
    assign _1821 = _1803 & _1820;
    assign _1826 = _1821 ? _1825 : _1824;
    assign _1828 = _24 ? _1823 : _1826;
    assign _12 = _1828;
    always @(posedge _316) begin
        if (_314)
            _1824 <= _1823;
        else
            _1824 <= _12;
    end
    assign _1837 = { _1835,
                     _1836 };
    assign _1892 = _1888 ? _1880 : _1891;
    assign _1894 = _24 ? _458 : _1892;
    assign _17 = _1894;
    always @(posedge _316) begin
        if (_314)
            _1891 <= _458;
        else
            _1891 <= _17;
    end
    assign _1887 = ~ _1886;
    assign _1877 = _1841 ? _488 : _460;
    assign _1873 = 3'b011;
    assign _1874 = _1857 ? _1873 : _461;
    assign _1878 = _1852 ? _1877 : _1874;
    assign _1870 = 3'b101;
    assign _1869 = 3'b110;
    assign _1871 = _1864 ? _1870 : _1869;
    assign _1879 = _1861 ? _1878 : _1871;
    assign _1865 = _140 & _279;
    assign _1862 = _296 | _47;
    assign _1863 = _1862 | _22;
    assign _1864 = f_sweeping & _1863;
    assign _1866 = _1864 | _1865;
    assign _1858 = ~ f_image_valid;
    assign _1859 = _330 & _1858;
    assign _1835 = _526 | _504;
    assign _1855 = _20[1:1];
    assign _1856 = _1855 & _1835;
    assign _1836 = _370 | _345;
    assign _20 = host_lane_we;
    assign _1853 = _20[0:0];
    assign _1854 = _1853 & _1836;
    assign _1857 = _1854 | _1856;
    assign _1860 = _1857 | _1859;
    assign _1849 = _1766 | _1848;
    assign _1845 = _47 & _1839;
    assign _1850 = _1845 & _1849;
    assign _1843 = ~ _1839;
    assign _22 = host_cov_re;
    assign _1842 = _47 | _22;
    assign _1844 = _1842 & _1843;
    assign _1851 = _1844 | _1850;
    assign _1840 = ~ _1839;
    assign _1841 = _296 & _1840;
    assign _1852 = _1841 | _1851;
    assign _1861 = _1852 | _1860;
    assign _1867 = _1861 | _1866;
    assign _1880 = _1867 ? _1879 : _458;
    assign _1882 = _1880 == _458;
    assign _1883 = ~ _1882;
    assign _1888 = _1883 & _1887;
    assign _1896 = _1888 ? _1825 : _1886;
    assign _24 = host_err_clear;
    assign _1898 = _24 ? _1823 : _1896;
    assign _25 = _1898;
    always @(posedge _316) begin
        if (_314)
            _1886 <= _1823;
        else
            _1886 <= _25;
    end
    assign _1775 = _1771 == _1774;
    assign _1776 = ~ _1775;
    assign _1767 = _1763 & _1766;
    assign _1777 = _1767 & _1776;
    assign _1904 = _1777 ? _1825 : _1902;
    assign _1906 = _1899 ? _1823 : _1904;
    assign _27 = _1906;
    always @(posedge _316) begin
        if (_314)
            _1902 <= _1823;
        else
            _1902 <= _27;
    end
    assign _1750 = _78 & _1749;
    assign _1911 = _1750 ? _1825 : _1909;
    assign _1913 = _1899 ? _1823 : _1911;
    assign _29 = _1913;
    always @(posedge _316) begin
        if (_314)
            _1909 <= _1823;
        else
            _1909 <= _29;
    end
    assign _1917 = _280 & _745;
    assign _1732 = ~ _1731;
    assign _1725 = _876 & _1724;
    assign _1733 = _1725 & _1732;
    assign _846 = ~ _845;
    assign _842 = _774 & _841;
    assign _847 = _842 & _846;
    assign _1914 = _847 | _1733;
    assign _31 = _1914;
    assign _1915 = f_rx_push & _743;
    assign _1916 = _1915 | _31;
    assign _1918 = _1916 | _1917;
    assign _1923 = _1918 ? _1825 : _1921;
    assign _1925 = _1899 ? _1823 : _1923;
    assign _32 = _1925;
    always @(posedge _316) begin
        if (_314)
            _1921 <= _1823;
        else
            _1921 <= _32;
    end
    assign _1929 = _1256[61:61];
    assign _1930 = _887 & _1929;
    assign _1935 = _1930 ? _1825 : _1933;
    assign _36 = host_irq_ack;
    assign _1937 = _36 ? _1823 : _1935;
    assign _1939 = _1899 ? _1823 : _1937;
    assign _37 = _1939;
    always @(posedge _316) begin
        if (_314)
            _1933 <= _1823;
        else
            _1933 <= _37;
    end
    assign _1968 = f_policy == _1967;
    assign _1970 = _1968 ? _1825 : _1928;
    assign _1966 = f_policy == _2689;
    assign _1972 = _1966 ? _1825 : _1970;
    assign _1973 = f_viol_now ? _1972 : _1928;
    assign _1974 = _1706 ? _1928 : _1973;
    assign _1941 = _879 == _2052;
    assign _1975 = _1941 ? _1974 : _1928;
    assign _1977 = _1899 ? _1823 : _1975;
    assign _38 = _1977;
    always @(posedge _316) begin
        if (_314)
            _1928 <= _1823;
        else
            _1928 <= _38;
    end
    assign _1992 = ~ _1991;
    assign _40 = host_tx_wm;
    assign _1985 = { gnd,
                     _40 };
    assign _1986 = _1985 < _281;
    assign _1987 = ~ _1986;
    assign _42 = host_tx_wm_en;
    assign _1988 = _42 & _1987;
    assign _1980 = 5'b00001;
    assign _1978 = 5'b00000;
    assign _44 = host_rx_wm;
    assign _1979 = _44 == _1978;
    assign _1981 = _1979 ? _1980 : _44;
    assign _1982 = { gnd,
                     _1981 };
    assign _1983 = _138 < _1982;
    assign _1984 = ~ _1983;
    assign _1989 = _1984 | _1988;
    assign _1993 = _1989 | _1992;
    assign _1994 = _1993 | _1928;
    assign _1995 = _1994 | _1933;
    assign _2097 = ~ f_host_cov_we;
    assign _2096 = ~ _1848;
    assign _2098 = _2096 & _2097;
    assign _2095 = 32'b00000000000000000000000000000000;
    assign _2089 = ~ f_sweeping;
    assign _2087 = ~ _1766;
    assign _2085 = ~ _1848;
    assign _47 = host_cov_we;
    assign _2084 = _47 & _1839;
    assign _2086 = _2084 & _2085;
    assign _2088 = _2086 & _2087;
    assign f_host_cov_we = _2088 & _2089;
    assign _2091 = _1848 | f_host_cov_we;
    assign _2078 = _64[11:0];
    assign _2075 = _2068 < _2065;
    assign _2076 = _2050 & _2075;
    assign _2077 = _2076 ? _2065 : _2068;
    assign _2079 = _2077 < _2078;
    assign _2080 = _2079 ? _2078 : _2077;
    assign _2081 = _2061 ? _2077 : _2080;
    assign _2067 = 12'b000000000000;
    assign _2028 = 12'b111111111111;
    assign _2025 = _2023[11:0];
    assign _2022 = 13'b0000000000000;
    assign _2019 = 10'b0000000000;
    assign _2020 = { _2019,
                     _2016 };
    assign _2021 = _2012 - _2020;
    always @* begin
        case (f_winner)
        0:
            _1996 <= _1215;
        1:
            _1996 <= _1391;
        2:
            _1996 <= _1530;
        default:
            _1996 <= _1669;
        endcase
    end
    assign _48 = _1996;
    always @(posedge _316) begin
        if (_314)
            _2016 <= _458;
        else
            _2016 <= _48;
    end
    assign _2017 = { _2019,
                     _2016 };
    assign _2002 = 13'b1111111111111;
    assign _2001 = _1999[12:0];
    assign _1997 = 16'b0001111111111111;
    assign _2000 = _1997 < _1999;
    assign _2003 = _2000 ? _2002 : _2001;
    assign _49 = _2003;
    always @(posedge _316) begin
        if (_314)
            _2012 <= _2022;
        else
            _2012 <= _49;
    end
    assign _2018 = _2012 < _2017;
    assign _2023 = _2018 ? _2022 : _2021;
    assign _2009 = 13'b0111111111111;
    assign _2024 = _2009 < _2023;
    assign _2027 = _2024 ? _2028 : _2025;
    assign _2004 = 16'b1111111111111111;
    assign _2005 = _1999 == _2004;
    assign _50 = _2005;
    always @(posedge _316) begin
        if (_314)
            _2008 <= _1823;
        else
            _2008 <= _50;
    end
    assign _2029 = _2008 ? _2028 : _2027;
    assign _51 = _2029;
    always @(posedge _316) begin
        if (_314)
            _2068 <= _2067;
        else
            _2068 <= _51;
    end
    assign _2032 = _1999[11:0];
    always @* begin
        case (f_winner)
        0:
            _1998 <= _932;
        1:
            _1998 <= _1305;
        2:
            _1998 <= _1444;
        default:
            _1998 <= _1583;
        endcase
    end
    always @* begin
        case (_1998)
        0:
            _1999 <= _935;
        1:
            _1999 <= _938;
        2:
            _1999 <= _941;
        default:
            _1999 <= _941;
        endcase
    end
    assign _2030 = 16'b0000111111111111;
    assign _2031 = _2030 < _1999;
    assign _2034 = _2031 ? _2028 : _2032;
    assign _52 = _2034;
    always @(posedge _316) begin
        if (_314)
            _2065 <= _2067;
        else
            _2065 <= _52;
    end
    assign _2069 = _2065 < _2068;
    assign _2070 = _2050 & _2069;
    assign _2071 = _2070 ? _2065 : _2068;
    assign _2062 = _64[23:12];
    assign _2072 = _2062 < _2071;
    assign _2073 = _2072 ? _2062 : _2071;
    assign _2061 = _2045 == _761;
    assign _2074 = _2061 ? _2071 : _2073;
    assign _2057 = _2055[7:0];
    assign _2052 = 2'b10;
    assign _2051 = 2'b01;
    assign _2036 = _1771 == _1774;
    assign _2035 = _1763 & _1766;
    assign _2037 = _2035 & _2036;
    assign _53 = _2037;
    always @(posedge _316) begin
        if (_314)
            _2050 <= _1823;
        else
            _2050 <= _53;
    end
    assign _2053 = _2050 ? _2052 : _2051;
    assign _2047 = 7'b0000000;
    assign _2054 = { _2047,
                     _2053 };
    assign _2045 = _64[31:24];
    assign _2046 = { gnd,
                     _2045 };
    assign _2055 = _2046 + _2054;
    assign _2056 = _2055[8:8];
    assign _2059 = _2056 ? _763 : _2057;
    assign _2082 = { _2059,
                     _2074,
                     _2081 };
    assign _55 = host_cov_wdata;
    assign _2083 = _1848 ? _2082 : _55;
    always @(posedge _316) begin
        if (_2091)
            _2092[_2044] <= _2083;
    end
    assign _56 = _1774;
    always @(posedge _316) begin
        if (_314)
            _2043 <= _761;
        else
            _2043 <= _56;
    end
    assign _1771 = { _1770,
                     f_winner };
    assign _57 = _1771;
    always @(posedge _316) begin
        if (_314)
            _1774 <= _761;
        else
            _1774 <= _57;
    end
    assign _59 = host_cov_addr;
    assign _2040 = _1766 ? _1774 : _59;
    assign _2038 = ~ _1766;
    assign _61 = host_cover_en;
    assign _1763 = _1706 & _61;
    assign _2039 = _1763 & _2038;
    assign _62 = _2039;
    always @(posedge _316) begin
        if (_314)
            _1766 <= _1823;
        else
            _1766 <= _62;
    end
    assign _63 = _1766;
    always @(posedge _316) begin
        if (_314)
            _1848 <= _1823;
        else
            _1848 <= _63;
    end
    assign _2044 = _1848 ? _2043 : _2040;
    assign _2093 = _2092[_2044];
    always @(posedge _316) begin
        if (_2098)
            _2099 <= _2093;
    end
    assign _64 = _2099;
    assign _2100 = ~ f_sweeping;
    assign _2101 = _1839 & _2100;
    assign _2103 = _2101 ? _64 : _2095;
    assign _2470 = 3'b111;
    assign _2471 = _2108 == _2470;
    assign _2472 = _2105 & _2471;
    assign _2469 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _316) begin
        if (_314)
            _2473 <= _2469;
        else
            if (_2472)
                _2473 <= _77;
    end
    assign _2465 = _2108 == _1869;
    assign _2466 = _2105 & _2465;
    always @(posedge _316) begin
        if (_314)
            _2467 <= _2469;
        else
            if (_2466)
                _2467 <= _77;
    end
    assign _2459 = _2108 == _1870;
    assign _2460 = _2105 & _2459;
    always @(posedge _316) begin
        if (_314)
            _2461 <= _2469;
        else
            if (_2460)
                _2461 <= _77;
    end
    assign _2453 = _2108 == _461;
    assign _2454 = _2105 & _2453;
    always @(posedge _316) begin
        if (_314)
            _2455 <= _2469;
        else
            if (_2454)
                _2455 <= _77;
    end
    assign _2447 = _2108 == _1873;
    assign _2448 = _2105 & _2447;
    always @(posedge _316) begin
        if (_314)
            _2449 <= _2469;
        else
            if (_2448)
                _2449 <= _77;
    end
    assign _2441 = _2108 == _460;
    assign _2442 = _2105 & _2441;
    always @(posedge _316) begin
        if (_314)
            _2443 <= _2469;
        else
            if (_2442)
                _2443 <= _77;
    end
    assign _2435 = _2108 == _488;
    assign _2436 = _2105 & _2435;
    always @(posedge _316) begin
        if (_314)
            _2437 <= _2469;
        else
            if (_2436)
                _2437 <= _77;
    end
    assign _2110 = _2108 + _488;
    assign _2111 = _2105 ? _2110 : _2108;
    assign _67 = _2111;
    always @(posedge _316) begin
        if (_314)
            _2108 <= _458;
        else
            _2108 <= _67;
    end
    assign _2429 = _2108 == _458;
    assign _2430 = _2105 & _2429;
    assign _2402 = _2293 - _2398;
    assign _2119 = 29'b11111111111111111111111111111;
    assign _2118 = 29'b00000000000000000000000000000;
    assign _2121 = 29'b00000000000000000000000000001;
    assign _2122 = ts_hi_m1 + _2121;
    assign _2115 = ts_reg[2:0];
    assign _2117 = _2115 == _2470;
    assign _2123 = _2117 ? _2122 : ts_hi_m1;
    assign _68 = _2123;
    always @(posedge _316) begin
        if (_314)
            ts_hi_m1 <= _2119;
        else
            ts_hi_m1 <= _68;
    end
    assign _2400 = ts_reg[31:3];
    assign _2141 = _2128 + _488;
    assign _2137 = _2128 == _2470;
    assign _2138 = ~ _2137;
    assign _2135 = _1249[0:0];
    assign _2139 = _2135 & _2138;
    assign _2142 = _2139 ? _2141 : _2128;
    assign _2132 = _1249[0:0];
    assign _2133 = ~ _2132;
    assign _2130 = _920[0:0];
    assign _2129 = f_chg_now[0:0];
    assign _2131 = _2129 & _2130;
    assign _2134 = _2131 & _2133;
    assign _2144 = _2134 ? _488 : _2142;
    assign _2125 = _879 == _2051;
    assign _2145 = _2125 ? _2144 : _2128;
    assign _69 = _2145;
    always @(posedge _316) begin
        if (_314)
            _2128 <= _458;
        else
            _2128 <= _69;
    end
    assign _2391 = _1249[0:0];
    assign _2393 = _2391 ? _2128 : _458;
    assign _2162 = _2149 + _488;
    assign _2158 = _2149 == _2470;
    assign _2159 = ~ _2158;
    assign _2156 = _1249[1:1];
    assign _2160 = _2156 & _2159;
    assign _2163 = _2160 ? _2162 : _2149;
    assign _2153 = _1249[1:1];
    assign _2154 = ~ _2153;
    assign _2151 = _920[1:1];
    assign _2150 = f_chg_now[1:1];
    assign _2152 = _2150 & _2151;
    assign _2155 = _2152 & _2154;
    assign _2165 = _2155 ? _488 : _2163;
    assign _2146 = _879 == _2051;
    assign _2166 = _2146 ? _2165 : _2149;
    assign _70 = _2166;
    always @(posedge _316) begin
        if (_314)
            _2149 <= _458;
        else
            _2149 <= _70;
    end
    assign _2388 = _1249[1:1];
    assign _2390 = _2388 ? _2149 : _458;
    assign _2394 = _2350 ? _2393 : _2390;
    assign _2183 = _2170 + _488;
    assign _2179 = _2170 == _2470;
    assign _2180 = ~ _2179;
    assign _2177 = _1249[2:2];
    assign _2181 = _2177 & _2180;
    assign _2184 = _2181 ? _2183 : _2170;
    assign _2174 = _1249[2:2];
    assign _2175 = ~ _2174;
    assign _2172 = _920[2:2];
    assign _2171 = f_chg_now[2:2];
    assign _2173 = _2171 & _2172;
    assign _2176 = _2173 & _2175;
    assign _2186 = _2176 ? _488 : _2184;
    assign _2167 = _879 == _2051;
    assign _2187 = _2167 ? _2186 : _2170;
    assign _71 = _2187;
    always @(posedge _316) begin
        if (_314)
            _2170 <= _458;
        else
            _2170 <= _71;
    end
    assign _2384 = _1249[2:2];
    assign _2386 = _2384 ? _2170 : _458;
    assign _2204 = _2191 + _488;
    assign _2200 = _2191 == _2470;
    assign _2201 = ~ _2200;
    assign _2198 = _1249[3:3];
    assign _2202 = _2198 & _2201;
    assign _2205 = _2202 ? _2204 : _2191;
    assign _2195 = _1249[3:3];
    assign _2196 = ~ _2195;
    assign _2193 = _920[3:3];
    assign _2192 = f_chg_now[3:3];
    assign _2194 = _2192 & _2193;
    assign _2197 = _2194 & _2196;
    assign _2207 = _2197 ? _488 : _2205;
    assign _2188 = _879 == _2051;
    assign _2208 = _2188 ? _2207 : _2191;
    assign _72 = _2208;
    always @(posedge _316) begin
        if (_314)
            _2191 <= _458;
        else
            _2191 <= _72;
    end
    assign _2381 = _1249[3:3];
    assign _2383 = _2381 ? _2191 : _458;
    assign _2387 = _2353 ? _2386 : _2383;
    assign _2395 = _2352 ? _2394 : _2387;
    assign _2225 = _2212 + _488;
    assign _2221 = _2212 == _2470;
    assign _2222 = ~ _2221;
    assign _2219 = _1249[4:4];
    assign _2223 = _2219 & _2222;
    assign _2226 = _2223 ? _2225 : _2212;
    assign _2216 = _1249[4:4];
    assign _2217 = ~ _2216;
    assign _2214 = _920[4:4];
    assign _2213 = f_chg_now[4:4];
    assign _2215 = _2213 & _2214;
    assign _2218 = _2215 & _2217;
    assign _2228 = _2218 ? _488 : _2226;
    assign _2209 = _879 == _2051;
    assign _2229 = _2209 ? _2228 : _2212;
    assign _73 = _2229;
    always @(posedge _316) begin
        if (_314)
            _2212 <= _458;
        else
            _2212 <= _73;
    end
    assign _2376 = _1249[4:4];
    assign _2378 = _2376 ? _2212 : _458;
    assign _2246 = _2233 + _488;
    assign _2242 = _2233 == _2470;
    assign _2243 = ~ _2242;
    assign _2240 = _1249[5:5];
    assign _2244 = _2240 & _2243;
    assign _2247 = _2244 ? _2246 : _2233;
    assign _2237 = _1249[5:5];
    assign _2238 = ~ _2237;
    assign _2235 = _920[5:5];
    assign _2234 = f_chg_now[5:5];
    assign _2236 = _2234 & _2235;
    assign _2239 = _2236 & _2238;
    assign _2249 = _2239 ? _488 : _2247;
    assign _2230 = _879 == _2051;
    assign _2250 = _2230 ? _2249 : _2233;
    assign _74 = _2250;
    always @(posedge _316) begin
        if (_314)
            _2233 <= _458;
        else
            _2233 <= _74;
    end
    assign _2373 = _1249[5:5];
    assign _2375 = _2373 ? _2233 : _458;
    assign _2379 = _2357 ? _2378 : _2375;
    assign _2267 = _2254 + _488;
    assign _2263 = _2254 == _2470;
    assign _2264 = ~ _2263;
    assign _2261 = _1249[6:6];
    assign _2265 = _2261 & _2264;
    assign _2268 = _2265 ? _2267 : _2254;
    assign _2258 = _1249[6:6];
    assign _2259 = ~ _2258;
    assign _2256 = _920[6:6];
    assign _2255 = f_chg_now[6:6];
    assign _2257 = _2255 & _2256;
    assign _2260 = _2257 & _2259;
    assign _2270 = _2260 ? _488 : _2268;
    assign _2251 = _879 == _2051;
    assign _2271 = _2251 ? _2270 : _2254;
    assign _75 = _2271;
    always @(posedge _316) begin
        if (_314)
            _2254 <= _458;
        else
            _2254 <= _75;
    end
    assign _2369 = _1249[6:6];
    assign _2371 = _2369 ? _2254 : _458;
    assign _2288 = _2275 + _488;
    assign _2284 = _2275 == _2470;
    assign _2285 = ~ _2284;
    assign _2282 = _1249[7:7];
    assign _2286 = _2282 & _2285;
    assign _2289 = _2286 ? _2288 : _2275;
    assign _2279 = _1249[7:7];
    assign _2280 = ~ _2279;
    assign _2277 = _920[7:7];
    assign _2276 = f_chg_now[7:7];
    assign _2278 = _2276 & _2277;
    assign _2281 = _2278 & _2280;
    assign _2291 = _2281 ? _488 : _2289;
    assign _2272 = _879 == _2051;
    assign _2292 = _2272 ? _2291 : _2275;
    assign _76 = _2292;
    always @(posedge _316) begin
        if (_314)
            _2275 <= _458;
        else
            _2275 <= _76;
    end
    assign _2366 = _1249[7:7];
    assign _2368 = _2366 ? _2275 : _458;
    assign _2372 = _2360 ? _2371 : _2368;
    assign _2380 = _2359 ? _2379 : _2372;
    assign _2396 = _2356 ? _2395 : _2380;
    assign _2361 = _1279[7:7];
    assign _2360 = _1279[6:6];
    assign _2362 = _2360 | _2361;
    assign _2358 = _1279[5:5];
    assign _2357 = _1279[4:4];
    assign _2359 = _2357 | _2358;
    assign _2363 = _2359 | _2362;
    assign _2354 = _1279[3:3];
    assign _2353 = _1279[2:2];
    assign _2355 = _2353 | _2354;
    assign _2351 = _1279[1:1];
    assign _2350 = _1279[0:0];
    assign _2352 = _2350 | _2351;
    assign _2356 = _2352 | _2355;
    assign _2364 = _2356 | _2363;
    assign _2397 = _2364 ? _2396 : _458;
    assign _2339 = f_watch[0:0];
    assign _2338 = _920[0:0];
    assign _2340 = _2338 & _2339;
    assign _2342 = _2340 ? _1134 : _458;
    assign _2334 = f_watch[1:1];
    assign _2333 = _920[1:1];
    assign _2335 = _2333 & _2334;
    assign _2337 = _2335 ? _1113 : _458;
    assign _2343 = _2337 < _2342;
    assign _2344 = _2343 ? _2342 : _2337;
    assign _2327 = f_watch[2:2];
    assign _2326 = _920[2:2];
    assign _2328 = _2326 & _2327;
    assign _2330 = _2328 ? _1090 : _458;
    assign _2322 = f_watch[3:3];
    assign _2321 = _920[3:3];
    assign _2323 = _2321 & _2322;
    assign _2325 = _2323 ? _1069 : _458;
    assign _2331 = _2325 < _2330;
    assign _2332 = _2331 ? _2330 : _2325;
    assign _2345 = _2332 < _2344;
    assign _2346 = _2345 ? _2344 : _2332;
    assign _2313 = f_watch[4:4];
    assign _2312 = _920[4:4];
    assign _2314 = _2312 & _2313;
    assign _2316 = _2314 ? _1044 : _458;
    assign _2308 = f_watch[5:5];
    assign _2307 = _920[5:5];
    assign _2309 = _2307 & _2308;
    assign _2311 = _2309 ? _1023 : _458;
    assign _2317 = _2311 < _2316;
    assign _2318 = _2317 ? _2316 : _2311;
    assign _2301 = f_watch[6:6];
    assign _2300 = _920[6:6];
    assign _2302 = _2300 & _2301;
    assign _2304 = _2302 ? _1000 : _458;
    assign _2296 = f_watch[7:7];
    assign _2295 = _920[7:7];
    assign _2297 = _2295 & _2296;
    assign _2299 = _2297 ? _979 : _458;
    assign _2305 = _2299 < _2304;
    assign _2306 = _2305 ? _2304 : _2299;
    assign _2319 = _2306 < _2318;
    assign _2320 = _2319 ? _2318 : _2306;
    assign _2347 = _2320 < _2346;
    assign _2348 = _2347 ? _2346 : _2320;
    assign _2349 = f_unexp_now ? _2348 : _458;
    assign _2398 = f_amb_now ? _2397 : _2349;
    assign _2293 = ts_reg[2:0];
    assign _2399 = _2293 < _2398;
    assign _2401 = _2399 ? ts_hi_m1 : _2400;
    assign _2403 = { _2401,
                     _2402 };
    assign _2407 = { _2403,
                     _1770,
                     _2406,
                     _907 };
    assign _77 = _2407;
    always @(posedge _316) begin
        if (_314)
            _2431 <= _2469;
        else
            if (_2430)
                _2431 <= _77;
    end
    assign _2424 = _2422 + _488;
    assign _1990 = 4'b0000;
    assign _2413 = 4'b0001;
    assign _2414 = _79 + _2413;
    assign _2412 = _79 - _2413;
    assign _2415 = _2105 ? _2414 : _2412;
    assign _1748 = 4'b1000;
    assign _1749 = _79 == _1748;
    assign _2104 = ~ _1749;
    assign _78 = f_viol_now;
    assign _2105 = _78 & _2104;
    assign _2410 = _2105 ^ _2409;
    assign _2416 = _2410 ? _2415 : _79;
    always @(posedge _316) begin
        if (_314)
            _2419 <= _1990;
        else
            _2419 <= _2416;
    end
    assign _79 = _2419;
    assign _1991 = _79 == _1990;
    assign _2408 = ~ _1991;
    assign _81 = host_vlog_pop;
    assign _2409 = _81 & _2408;
    assign _2425 = _2409 ? _2424 : _2422;
    assign _82 = _2425;
    always @(posedge _316) begin
        if (_314)
            _2422 <= _458;
        else
            _2422 <= _82;
    end
    always @* begin
        case (_2422)
        0:
            _2474 <= _2431;
        1:
            _2474 <= _2437;
        2:
            _2474 <= _2443;
        3:
            _2474 <= _2449;
        4:
            _2474 <= _2455;
        5:
            _2474 <= _2461;
        6:
            _2474 <= _2467;
        default:
            _2474 <= _2473;
        endcase
    end
    assign _2681 = 5'b11111;
    assign _2682 = _2481 == _2681;
    assign _2683 = _2478 & _2682;
    always @(posedge _316) begin
        if (_314)
            _2684 <= _761;
        else
            if (_2683)
                _2684 <= _150;
    end
    assign _2675 = 5'b11110;
    assign _2676 = _2481 == _2675;
    assign _2677 = _2478 & _2676;
    always @(posedge _316) begin
        if (_314)
            _2678 <= _761;
        else
            if (_2677)
                _2678 <= _150;
    end
    assign _2669 = 5'b11101;
    assign _2670 = _2481 == _2669;
    assign _2671 = _2478 & _2670;
    always @(posedge _316) begin
        if (_314)
            _2672 <= _761;
        else
            if (_2671)
                _2672 <= _150;
    end
    assign _2663 = 5'b11100;
    assign _2664 = _2481 == _2663;
    assign _2665 = _2478 & _2664;
    always @(posedge _316) begin
        if (_314)
            _2666 <= _761;
        else
            if (_2665)
                _2666 <= _150;
    end
    assign _2657 = 5'b11011;
    assign _2658 = _2481 == _2657;
    assign _2659 = _2478 & _2658;
    always @(posedge _316) begin
        if (_314)
            _2660 <= _761;
        else
            if (_2659)
                _2660 <= _150;
    end
    assign _2651 = 5'b11010;
    assign _2652 = _2481 == _2651;
    assign _2653 = _2478 & _2652;
    always @(posedge _316) begin
        if (_314)
            _2654 <= _761;
        else
            if (_2653)
                _2654 <= _150;
    end
    assign _2645 = 5'b11001;
    assign _2646 = _2481 == _2645;
    assign _2647 = _2478 & _2646;
    always @(posedge _316) begin
        if (_314)
            _2648 <= _761;
        else
            if (_2647)
                _2648 <= _150;
    end
    assign _2639 = 5'b11000;
    assign _2640 = _2481 == _2639;
    assign _2641 = _2478 & _2640;
    always @(posedge _316) begin
        if (_314)
            _2642 <= _761;
        else
            if (_2641)
                _2642 <= _150;
    end
    assign _2633 = 5'b10111;
    assign _2634 = _2481 == _2633;
    assign _2635 = _2478 & _2634;
    always @(posedge _316) begin
        if (_314)
            _2636 <= _761;
        else
            if (_2635)
                _2636 <= _150;
    end
    assign _2627 = 5'b10110;
    assign _2628 = _2481 == _2627;
    assign _2629 = _2478 & _2628;
    always @(posedge _316) begin
        if (_314)
            _2630 <= _761;
        else
            if (_2629)
                _2630 <= _150;
    end
    assign _2621 = 5'b10101;
    assign _2622 = _2481 == _2621;
    assign _2623 = _2478 & _2622;
    always @(posedge _316) begin
        if (_314)
            _2624 <= _761;
        else
            if (_2623)
                _2624 <= _150;
    end
    assign _2615 = 5'b10100;
    assign _2616 = _2481 == _2615;
    assign _2617 = _2478 & _2616;
    always @(posedge _316) begin
        if (_314)
            _2618 <= _761;
        else
            if (_2617)
                _2618 <= _150;
    end
    assign _2609 = 5'b10011;
    assign _2610 = _2481 == _2609;
    assign _2611 = _2478 & _2610;
    always @(posedge _316) begin
        if (_314)
            _2612 <= _761;
        else
            if (_2611)
                _2612 <= _150;
    end
    assign _2603 = 5'b10010;
    assign _2604 = _2481 == _2603;
    assign _2605 = _2478 & _2604;
    always @(posedge _316) begin
        if (_314)
            _2606 <= _761;
        else
            if (_2605)
                _2606 <= _150;
    end
    assign _2597 = 5'b10001;
    assign _2598 = _2481 == _2597;
    assign _2599 = _2478 & _2598;
    always @(posedge _316) begin
        if (_314)
            _2600 <= _761;
        else
            if (_2599)
                _2600 <= _150;
    end
    assign _2591 = 5'b10000;
    assign _2592 = _2481 == _2591;
    assign _2593 = _2478 & _2592;
    always @(posedge _316) begin
        if (_314)
            _2594 <= _761;
        else
            if (_2593)
                _2594 <= _150;
    end
    assign _2585 = 5'b01111;
    assign _2586 = _2481 == _2585;
    assign _2587 = _2478 & _2586;
    always @(posedge _316) begin
        if (_314)
            _2588 <= _761;
        else
            if (_2587)
                _2588 <= _150;
    end
    assign _2579 = 5'b01110;
    assign _2580 = _2481 == _2579;
    assign _2581 = _2478 & _2580;
    always @(posedge _316) begin
        if (_314)
            _2582 <= _761;
        else
            if (_2581)
                _2582 <= _150;
    end
    assign _2573 = 5'b01101;
    assign _2574 = _2481 == _2573;
    assign _2575 = _2478 & _2574;
    always @(posedge _316) begin
        if (_314)
            _2576 <= _761;
        else
            if (_2575)
                _2576 <= _150;
    end
    assign _2567 = 5'b01100;
    assign _2568 = _2481 == _2567;
    assign _2569 = _2478 & _2568;
    always @(posedge _316) begin
        if (_314)
            _2570 <= _761;
        else
            if (_2569)
                _2570 <= _150;
    end
    assign _2561 = 5'b01011;
    assign _2562 = _2481 == _2561;
    assign _2563 = _2478 & _2562;
    always @(posedge _316) begin
        if (_314)
            _2564 <= _761;
        else
            if (_2563)
                _2564 <= _150;
    end
    assign _2555 = 5'b01010;
    assign _2556 = _2481 == _2555;
    assign _2557 = _2478 & _2556;
    always @(posedge _316) begin
        if (_314)
            _2558 <= _761;
        else
            if (_2557)
                _2558 <= _150;
    end
    assign _2549 = 5'b01001;
    assign _2550 = _2481 == _2549;
    assign _2551 = _2478 & _2550;
    always @(posedge _316) begin
        if (_314)
            _2552 <= _761;
        else
            if (_2551)
                _2552 <= _150;
    end
    assign _2543 = 5'b01000;
    assign _2544 = _2481 == _2543;
    assign _2545 = _2478 & _2544;
    always @(posedge _316) begin
        if (_314)
            _2546 <= _761;
        else
            if (_2545)
                _2546 <= _150;
    end
    assign _2537 = 5'b00111;
    assign _2538 = _2481 == _2537;
    assign _2539 = _2478 & _2538;
    always @(posedge _316) begin
        if (_314)
            _2540 <= _761;
        else
            if (_2539)
                _2540 <= _150;
    end
    assign _2531 = 5'b00110;
    assign _2532 = _2481 == _2531;
    assign _2533 = _2478 & _2532;
    always @(posedge _316) begin
        if (_314)
            _2534 <= _761;
        else
            if (_2533)
                _2534 <= _150;
    end
    assign _2525 = 5'b00101;
    assign _2526 = _2481 == _2525;
    assign _2527 = _2478 & _2526;
    always @(posedge _316) begin
        if (_314)
            _2528 <= _761;
        else
            if (_2527)
                _2528 <= _150;
    end
    assign _2519 = 5'b00100;
    assign _2520 = _2481 == _2519;
    assign _2521 = _2478 & _2520;
    always @(posedge _316) begin
        if (_314)
            _2522 <= _761;
        else
            if (_2521)
                _2522 <= _150;
    end
    assign _2513 = 5'b00011;
    assign _2514 = _2481 == _2513;
    assign _2515 = _2478 & _2514;
    always @(posedge _316) begin
        if (_314)
            _2516 <= _761;
        else
            if (_2515)
                _2516 <= _150;
    end
    assign _2507 = 5'b00010;
    assign _2508 = _2481 == _2507;
    assign _2509 = _2478 & _2508;
    always @(posedge _316) begin
        if (_314)
            _2510 <= _761;
        else
            if (_2509)
                _2510 <= _150;
    end
    assign _2502 = _2481 == _1980;
    assign _2503 = _2478 & _2502;
    always @(posedge _316) begin
        if (_314)
            _2504 <= _761;
        else
            if (_2503)
                _2504 <= _150;
    end
    assign _2483 = _2481 + _1980;
    assign _2484 = _2478 ? _2483 : _2481;
    assign _85 = _2484;
    always @(posedge _316) begin
        if (_314)
            _2481 <= _1978;
        else
            _2481 <= _85;
    end
    assign _2496 = _2481 == _1978;
    assign _2497 = _2478 & _2496;
    always @(posedge _316) begin
        if (_314)
            _2498 <= _761;
        else
            if (_2497)
                _2498 <= _150;
    end
    assign _2491 = _2489 + _1980;
    assign _2492 = _2486 ? _2491 : _2489;
    assign _86 = _2492;
    always @(posedge _316) begin
        if (_314)
            _2489 <= _1978;
        else
            _2489 <= _86;
    end
    always @* begin
        case (_2489)
        0:
            _2685 <= _2498;
        1:
            _2685 <= _2504;
        2:
            _2685 <= _2510;
        3:
            _2685 <= _2516;
        4:
            _2685 <= _2522;
        5:
            _2685 <= _2528;
        6:
            _2685 <= _2534;
        7:
            _2685 <= _2540;
        8:
            _2685 <= _2546;
        9:
            _2685 <= _2552;
        10:
            _2685 <= _2558;
        11:
            _2685 <= _2564;
        12:
            _2685 <= _2570;
        13:
            _2685 <= _2576;
        14:
            _2685 <= _2582;
        15:
            _2685 <= _2588;
        16:
            _2685 <= _2594;
        17:
            _2685 <= _2600;
        18:
            _2685 <= _2606;
        19:
            _2685 <= _2612;
        20:
            _2685 <= _2618;
        21:
            _2685 <= _2624;
        22:
            _2685 <= _2630;
        23:
            _2685 <= _2636;
        24:
            _2685 <= _2642;
        25:
            _2685 <= _2648;
        26:
            _2685 <= _2654;
        27:
            _2685 <= _2660;
        28:
            _2685 <= _2666;
        29:
            _2685 <= _2672;
        30:
            _2685 <= _2678;
        default:
            _2685 <= _2684;
        endcase
    end
    assign _2686 = 32'b00000000000000000000000000000001;
    assign _2687 = ts_reg + _2686;
    assign _90 = _2687;
    always @(posedge _316) begin
        if (_314)
            ts_reg <= _2095;
        else
            ts_reg <= _90;
    end
    assign _2689 = 2'b00;
    assign _2404 = { _1955,
                     f_unexp_now };
    assign _2406 = f_amb_now ? _2689 : _2404;
    always @(posedge _316) begin
        if (_314)
            _2690 <= _2689;
        else
            _2690 <= _2406;
    end
    always @(posedge _316) begin
        if (_314)
            _2693 <= _1823;
        else
            _2693 <= f_viol_now;
    end
    always @(posedge _316) begin
        if (_314)
            _2696 <= _2689;
        else
            _2696 <= f_winner;
    end
    always @(posedge _316) begin
        if (_314)
            _2699 <= _1823;
        else
            _2699 <= _1706;
    end
    assign _2700 = _1256[60:60];
    assign _2701 = f_in_eval & _2700;
    assign _2702 = ~ _1839;
    assign _2843 = _103 & _2842;
    assign _2844 = ~ _2843;
    assign _2724 = _1256[23:16];
    assign _2722 = _1273[86:79];
    assign _2721 = _1267[86:79];
    assign _2720 = _1261[86:79];
    assign _2719 = _903[86:79];
    always @* begin
        case (f_winner)
        0:
            _2723 <= _2719;
        1:
            _2723 <= _2720;
        2:
            _2723 <= _2721;
        default:
            _2723 <= _2722;
        endcase
    end
    assign _2725 = _887 ? _2724 : _2723;
    assign _2726 = _2725 & _2716;
    assign _2717 = ~ _2716;
    assign _2718 = f_poe & _2717;
    assign _2727 = _2718 | _2726;
    assign _2761 = _2727 | _2760;
    assign _2762 = _2706 ? _2761 : f_poe;
    assign _2764 = _323 ? _761 : _2762;
    assign _2766 = _1899 ? _761 : _2764;
    assign _100 = _2766;
    always @(posedge _316) begin
        if (_314)
            f_poe <= _761;
        else
            f_poe <= _100;
    end
    assign _2845 = f_poe & _2844;
    assign _103 = host_open_drain;
    assign _4632 = ~ _103;
    assign _2840 = f_lane1_out & _2834;
    assign _2839 = ~ f_lane1_out;
    assign _2837 = ~ f_lane0_out;
    assign _2838 = _2837 & _2834;
    assign _2836 = f_lane0_out & _2834;
    assign _2835 = ~ f_lane0_out;
    assign _2834 = f_pout[0:0];
    assign _2833 = _333[2:0];
    always @* begin
        case (_2833)
        0:
            _2841 <= _2834;
        1:
            _2841 <= f_lane0_out;
        2:
            _2841 <= _2835;
        3:
            _2841 <= _2836;
        4:
            _2841 <= _2838;
        5:
            _2841 <= f_lane1_out;
        6:
            _2841 <= _2839;
        default:
            _2841 <= _2840;
        endcase
    end
    assign _2831 = f_lane1_out & _2825;
    assign _2830 = ~ f_lane1_out;
    assign _2828 = ~ f_lane0_out;
    assign _2829 = _2828 & _2825;
    assign _2827 = f_lane0_out & _2825;
    assign _2826 = ~ f_lane0_out;
    assign _2825 = f_pout[1:1];
    assign _2824 = _333[5:3];
    always @* begin
        case (_2824)
        0:
            _2832 <= _2825;
        1:
            _2832 <= f_lane0_out;
        2:
            _2832 <= _2826;
        3:
            _2832 <= _2827;
        4:
            _2832 <= _2829;
        5:
            _2832 <= f_lane1_out;
        6:
            _2832 <= _2830;
        default:
            _2832 <= _2831;
        endcase
    end
    assign _2822 = f_lane1_out & _2816;
    assign _2821 = ~ f_lane1_out;
    assign _2819 = ~ f_lane0_out;
    assign _2820 = _2819 & _2816;
    assign _2818 = f_lane0_out & _2816;
    assign _2817 = ~ f_lane0_out;
    assign _2816 = f_pout[2:2];
    assign _2815 = _333[8:6];
    always @* begin
        case (_2815)
        0:
            _2823 <= _2816;
        1:
            _2823 <= f_lane0_out;
        2:
            _2823 <= _2817;
        3:
            _2823 <= _2818;
        4:
            _2823 <= _2820;
        5:
            _2823 <= f_lane1_out;
        6:
            _2823 <= _2821;
        default:
            _2823 <= _2822;
        endcase
    end
    assign _2813 = f_lane1_out & _2807;
    assign _2812 = ~ f_lane1_out;
    assign _2810 = ~ f_lane0_out;
    assign _2811 = _2810 & _2807;
    assign _2809 = f_lane0_out & _2807;
    assign _2808 = ~ f_lane0_out;
    assign _2807 = f_pout[3:3];
    assign _2806 = _333[11:9];
    always @* begin
        case (_2806)
        0:
            _2814 <= _2807;
        1:
            _2814 <= f_lane0_out;
        2:
            _2814 <= _2808;
        3:
            _2814 <= _2809;
        4:
            _2814 <= _2811;
        5:
            _2814 <= f_lane1_out;
        6:
            _2814 <= _2812;
        default:
            _2814 <= _2813;
        endcase
    end
    assign _2804 = f_lane1_out & _2798;
    assign _2803 = ~ f_lane1_out;
    assign _2801 = ~ f_lane0_out;
    assign _2802 = _2801 & _2798;
    assign _2800 = f_lane0_out & _2798;
    assign _2799 = ~ f_lane0_out;
    assign _2798 = f_pout[4:4];
    assign _2797 = _333[14:12];
    always @* begin
        case (_2797)
        0:
            _2805 <= _2798;
        1:
            _2805 <= f_lane0_out;
        2:
            _2805 <= _2799;
        3:
            _2805 <= _2800;
        4:
            _2805 <= _2802;
        5:
            _2805 <= f_lane1_out;
        6:
            _2805 <= _2803;
        default:
            _2805 <= _2804;
        endcase
    end
    assign _2795 = f_lane1_out & _2789;
    assign _2794 = ~ f_lane1_out;
    assign _2792 = ~ f_lane0_out;
    assign _2793 = _2792 & _2789;
    assign _2791 = f_lane0_out & _2789;
    assign _2790 = ~ f_lane0_out;
    assign _2789 = f_pout[5:5];
    assign _2788 = _333[17:15];
    always @* begin
        case (_2788)
        0:
            _2796 <= _2789;
        1:
            _2796 <= f_lane0_out;
        2:
            _2796 <= _2790;
        3:
            _2796 <= _2791;
        4:
            _2796 <= _2793;
        5:
            _2796 <= f_lane1_out;
        6:
            _2796 <= _2794;
        default:
            _2796 <= _2795;
        endcase
    end
    assign _2786 = f_lane1_out & _2780;
    assign _2785 = ~ f_lane1_out;
    assign _2783 = ~ f_lane0_out;
    assign _2784 = _2783 & _2780;
    assign _2782 = f_lane0_out & _2780;
    assign _2781 = ~ f_lane0_out;
    assign _2780 = f_pout[6:6];
    assign _2779 = _333[20:18];
    always @* begin
        case (_2779)
        0:
            _2787 <= _2780;
        1:
            _2787 <= f_lane0_out;
        2:
            _2787 <= _2781;
        3:
            _2787 <= _2782;
        4:
            _2787 <= _2784;
        5:
            _2787 <= f_lane1_out;
        6:
            _2787 <= _2785;
        default:
            _2787 <= _2786;
        endcase
    end
    assign _2777 = f_lane1_out & _2771;
    assign _2776 = ~ f_lane1_out;
    assign _2774 = ~ f_lane0_out;
    assign _2775 = _2774 & _2771;
    assign _2773 = f_lane0_out & _2771;
    assign _2772 = ~ f_lane0_out;
    assign _4624 = { _4622,
                     _4621 };
    assign _4621 = _1183[0:0];
    assign _4622 = { _4621,
                     _4621 };
    assign _4623 = { _4622,
                     _4622 };
    assign _4625 = { _4623,
                     _4624 };
    assign _4626 = { _4625,
                     _4621 };
    assign _4627 = _4626 & _2760;
    assign _2758 = _2754 & _2752;
    assign _2757 = _2754 & _2750;
    assign _2756 = _2754 & _2747;
    assign _2754 = ~ _2741;
    assign _2755 = _2754 & _2744;
    assign _2752 = _2749 & _2746;
    assign _2753 = _2741 & _2752;
    assign _2749 = ~ _2742;
    assign _2750 = _2749 & _2743;
    assign _2751 = _2741 & _2750;
    assign _2746 = ~ _2743;
    assign _2747 = _2742 & _2746;
    assign _2748 = _2741 & _2747;
    assign _2743 = _2740[0:0];
    assign _2742 = _2740[1:1];
    assign _2744 = _2742 & _2743;
    assign _2741 = _2740[2:2];
    assign _2745 = _2741 & _2744;
    assign _2759 = { _2745,
                     _2748,
                     _2751,
                     _2753,
                     _2755,
                     _2756,
                     _2757,
                     _2758 };
    assign _2728 = ~ _887;
    assign _2734 = _2728 & _2733;
    assign _2760 = _2734 ? _2759 : _761;
    assign _4619 = ~ _2760;
    assign _4615 = _1256[15:8];
    assign _4613 = _1273[78:71];
    assign _4612 = _1267[78:71];
    assign _4611 = _1261[78:71];
    assign _4610 = _903[78:71];
    always @* begin
        case (f_winner)
        0:
            _4614 <= _4610;
        1:
            _4614 <= _4611;
        2:
            _4614 <= _4612;
        default:
            _4614 <= _4613;
        endcase
    end
    assign _4616 = _887 ? _4615 : _4614;
    assign _4617 = _4616 & _2716;
    assign _2715 = _1256[7:0];
    assign _2713 = _1273[70:63];
    assign _2712 = _1267[70:63];
    assign _2711 = _1261[70:63];
    assign _2710 = _903[70:63];
    always @* begin
        case (f_winner)
        0:
            _2714 <= _2710;
        1:
            _2714 <= _2711;
        2:
            _2714 <= _2712;
        default:
            _2714 <= _2713;
        endcase
    end
    assign _2716 = _887 ? _2715 : _2714;
    assign _4608 = ~ _2716;
    assign _4609 = f_pout & _4608;
    assign _4618 = _4609 | _4617;
    assign _4620 = _4618 & _4619;
    assign _4628 = _4620 | _4627;
    assign _2704 = _1204 == _2689;
    assign _2705 = _2704 | _1206;
    assign _2706 = _1707 & _2705;
    assign _4629 = _2706 ? _4628 : f_pout;
    assign _105 = host_crc_expect;
    assign _4601 = 32'b11111111111111111111111111111111;
    assign _2960 = 32'b11101101101110001000001100100000;
    assign _2958 = _2952[31:1];
    assign _2959 = { _1823,
                     _2958 };
    assign _2961 = _2959 ^ _2960;
    assign _2955 = _2952[31:1];
    assign _2956 = { _1823,
                     _2955 };
    assign _2948 = _2942[31:1];
    assign _2949 = { _1823,
                     _2948 };
    assign _2951 = _2949 ^ _2960;
    assign _2945 = _2942[31:1];
    assign _2946 = { _1823,
                     _2945 };
    assign _2938 = _2932[31:1];
    assign _2939 = { _1823,
                     _2938 };
    assign _2941 = _2939 ^ _2960;
    assign _2935 = _2932[31:1];
    assign _2936 = { _1823,
                     _2935 };
    assign _2928 = _2922[31:1];
    assign _2929 = { _1823,
                     _2928 };
    assign _2931 = _2929 ^ _2960;
    assign _2925 = _2922[31:1];
    assign _2926 = { _1823,
                     _2925 };
    assign _2918 = _2912[31:1];
    assign _2919 = { _1823,
                     _2918 };
    assign _2921 = _2919 ^ _2960;
    assign _2915 = _2912[31:1];
    assign _2916 = { _1823,
                     _2915 };
    assign _2908 = _2902[31:1];
    assign _2909 = { _1823,
                     _2908 };
    assign _2911 = _2909 ^ _2960;
    assign _2905 = _2902[31:1];
    assign _2906 = { _1823,
                     _2905 };
    assign _2898 = _2892[31:1];
    assign _2899 = { _1823,
                     _2898 };
    assign _2901 = _2899 ^ _2960;
    assign _2895 = _2892[31:1];
    assign _2896 = { _1823,
                     _2895 };
    assign _2888 = _2882[31:1];
    assign _2889 = { _1823,
                     _2888 };
    assign _2891 = _2889 ^ _2960;
    assign _2885 = _2882[31:1];
    assign _2886 = { _1823,
                     _2885 };
    assign _2879 = _308[127:120];
    assign _2878 = _308[119:112];
    assign _2877 = _308[111:104];
    assign _2876 = _308[103:96];
    assign _2875 = _308[95:88];
    assign _2874 = _308[87:80];
    assign _2873 = _308[79:72];
    assign _2872 = _308[71:64];
    assign _2871 = _308[63:56];
    assign _2870 = _308[55:48];
    assign _2869 = _308[47:40];
    assign _2868 = _308[39:32];
    assign _2867 = _308[31:24];
    assign _2866 = _308[23:16];
    assign _2865 = _308[15:8];
    assign _2864 = _308[7:0];
    assign _2861 = 13'b0000000000001;
    assign _2862 = f_sw_cnt - _2861;
    assign _2863 = _2862[3:0];
    always @* begin
        case (_2863)
        0:
            _2880 <= _2864;
        1:
            _2880 <= _2865;
        2:
            _2880 <= _2866;
        3:
            _2880 <= _2867;
        4:
            _2880 <= _2868;
        5:
            _2880 <= _2869;
        6:
            _2880 <= _2870;
        7:
            _2880 <= _2871;
        8:
            _2880 <= _2872;
        9:
            _2880 <= _2873;
        10:
            _2880 <= _2874;
        11:
            _2880 <= _2875;
        12:
            _2880 <= _2876;
        13:
            _2880 <= _2877;
        14:
            _2880 <= _2878;
        default:
            _2880 <= _2879;
        endcase
    end
    assign _2860 = 24'b000000000000000000000000;
    assign _2881 = { _2860,
                     _2880 };
    assign _2858 = f_sw_cnt == _2022;
    assign _2859 = ~ _2858;
    assign _2963 = _2859 ? _2962 : _2853;
    assign _2853 = _2848 ? _4601 : _2851;
    assign _2964 = f_sweeping ? _2963 : _2853;
    assign _106 = _2964;
    always @(posedge _316) begin
        if (_314)
            _2851 <= _4601;
        else
            _2851 <= _106;
    end
    assign _2882 = _2851 ^ _2881;
    assign _2883 = _2882[0:0];
    assign _2892 = _2883 ? _2891 : _2886;
    assign _2893 = _2892[0:0];
    assign _2902 = _2893 ? _2901 : _2896;
    assign _2903 = _2902[0:0];
    assign _2912 = _2903 ? _2911 : _2906;
    assign _2913 = _2912[0:0];
    assign _2922 = _2913 ? _2921 : _2916;
    assign _2923 = _2922[0:0];
    assign _2932 = _2923 ? _2931 : _2926;
    assign _2933 = _2932[0:0];
    assign _2942 = _2933 ? _2941 : _2936;
    assign _2943 = _2942[0:0];
    assign _2952 = _2943 ? _2951 : _2946;
    assign _2953 = _2952[0:0];
    assign _2962 = _2953 ? _2961 : _2956;
    assign _4602 = _2962 ^ _4601;
    assign f_sw_match = _4602 == _105;
    assign _4604 = f_sw_last ? f_sw_match : _4600;
    assign _4606 = _4588 ? _1823 : _4604;
    assign _4596 = f_store_we | _108;
    assign _4598 = _4596 ? _1823 : f_image_valid;
    assign _4600 = _2848 ? _1823 : _4598;
    assign _4589 = 13'b1000000000000;
    assign f_sw_last = f_sw_cnt == _4589;
    assign _4592 = f_sw_last ? _1823 : _4585;
    assign _108 = host_crc_expect_we;
    assign _4586 = _330 | _296;
    assign _4587 = _4586 | _108;
    assign _4588 = f_sweeping & _4587;
    assign _4594 = _4588 ? _1823 : _4592;
    assign _2847 = ~ f_sweeping;
    assign _4578 = _887 ? _2052 : _879;
    assign _4574 = _4440 ? _2051 : _879;
    assign _1967 = 2'b11;
    assign _4565 = f_policy == _1967;
    assign _4567 = _4565 ? _2689 : _879;
    assign _4564 = f_policy == _2052;
    assign _4569 = _4564 ? _2051 : _4567;
    assign _4563 = f_policy == _2689;
    assign _4571 = _4563 ? _2689 : _4569;
    assign _4572 = f_viol_now ? _4571 : _879;
    assign _1701 = f_chgmask3 & f_multi_eff;
    assign _1703 = _1701 == _761;
    assign _1694 = _1651 == _2004;
    assign _1689 = 16'b0000000000000000;
    assign _1690 = _1651 == _1689;
    assign _1691 = _1690 & _1671;
    assign _1688 = _1587 == _1647;
    assign _1692 = _1688 | _1691;
    assign _1695 = _1586 ? _1694 : _1692;
    assign _1685 = _1193[3:0];
    assign _1687 = _1685 == _1990;
    assign _1696 = _1687 | _1695;
    assign _1683 = _1651 == _2004;
    assign _1679 = _1651 == _1689;
    assign _1680 = _1679 & _1671;
    assign _1677 = _1587 == _1647;
    assign _1681 = _1677 | _1680;
    assign _1684 = _1586 ? _1683 : _1681;
    assign _1675 = _1638 == _2004;
    always @(posedge _316) begin
        if (_314)
            _1669 <= _458;
        else
            _1669 <= _1630;
    end
    assign _1670 = { _2022,
                     _1669 };
    assign _1671 = _1584 < _1670;
    assign _1665 = _1638 == _1689;
    assign _1672 = _1665 & _1671;
    assign _1663 = _1587 == _1635;
    assign _1673 = _1663 | _1672;
    assign _1676 = _1586 ? _1675 : _1673;
    assign _1662 = _1273[104:103];
    always @* begin
        case (_1662)
        0:
            _1697 <= vdd;
        1:
            _1697 <= _1676;
        2:
            _1697 <= _1684;
        default:
            _1697 <= _1696;
        endcase
    end
    assign _1661 = ~ _1206;
    assign _1698 = _1661 | _1697;
    assign _1658 = _1273[62:62];
    assign _1656 = _1273[61:58];
    always @* begin
        case (_1656)
        0:
            _1657 <= vdd;
        1:
            _1657 <= _1180;
        2:
            _1657 <= _1184;
        3:
            _1657 <= _1188;
        4:
            _1657 <= _1190;
        5:
            _1657 <= _743;
        6:
            _1657 <= _1194;
        7:
            _1657 <= _1197;
        8:
            _1657 <= _663;
        9:
            _1657 <= _666;
        10:
            _1657 <= _669;
        11:
            _1657 <= _672;
        12:
            _1657 <= _651;
        13:
            _1657 <= _654;
        14:
            _1657 <= _657;
        default:
            _1657 <= _660;
        endcase
    end
    assign _1659 = _1657 ^ _1658;
    assign _1651 = _1273[57:42];
    assign _1653 = _1651 == _2004;
    assign _1646 = 17'b00000000000000000;
    assign _1642 = _1588[57:42];
    assign _1643 = { gnd,
                     _1642 };
    assign _1644 = _1643 + _1631;
    always @(posedge _316) begin
        if (_314)
            _1647 <= _1646;
        else
            _1647 <= _1644;
    end
    assign _1648 = _1647 < _1587;
    assign _1649 = ~ _1648;
    assign _1638 = _1273[41:26];
    assign _1640 = _1638 == _1689;
    assign _1622 = _1592[0:0];
    assign _1624 = _1622 ? _1142 : _458;
    assign _1619 = _1592[1:1];
    assign _1621 = _1619 ? _1121 : _458;
    assign _1625 = _1621 < _1624;
    assign _1626 = _1625 ? _1624 : _1621;
    assign _1614 = _1592[2:2];
    assign _1616 = _1614 ? _1098 : _458;
    assign _1611 = _1592[3:3];
    assign _1613 = _1611 ? _1077 : _458;
    assign _1617 = _1613 < _1616;
    assign _1618 = _1617 ? _1616 : _1613;
    assign _1627 = _1618 < _1626;
    assign _1628 = _1627 ? _1626 : _1618;
    assign _1604 = _1592[4:4];
    assign _1606 = _1604 ? _1052 : _458;
    assign _1601 = _1592[5:5];
    assign _1603 = _1601 ? _1031 : _458;
    assign _1607 = _1603 < _1606;
    assign _1608 = _1607 ? _1606 : _1603;
    assign _1596 = _1592[6:6];
    assign _1598 = _1596 ? _1008 : _458;
    assign _1592 = _1588[23:16];
    assign _1593 = _1592[7:7];
    assign _1595 = _1593 ? _987 : _458;
    assign _1599 = _1595 < _1598;
    assign _1600 = _1599 ? _1598 : _1595;
    assign _1609 = _1600 < _1608;
    assign _1610 = _1609 ? _1608 : _1600;
    assign _1629 = _1610 < _1628;
    assign _1630 = _1629 ? _1628 : _1610;
    assign _1591 = 14'b00000000000000;
    assign _1631 = { _1591,
                     _1630 };
    assign _1588 = _962[511:400];
    assign _1589 = _1588[41:26];
    assign _1590 = { gnd,
                     _1589 };
    assign _1632 = _1590 + _1631;
    always @(posedge _316) begin
        if (_314)
            _1635 <= _1646;
        else
            _1635 <= _1632;
    end
    assign _1587 = { gnd,
                     _1584 };
    assign _1636 = _1587 < _1635;
    assign _1637 = ~ _1636;
    assign _1641 = _1637 | _1640;
    assign _1650 = _1641 & _1649;
    assign _1583 = _1273[25:24];
    always @* begin
        case (_1583)
        0:
            _1584 <= _935;
        1:
            _1584 <= _938;
        2:
            _1584 <= _941;
        default:
            _1584 <= _941;
        endcase
    end
    assign _1586 = _1584 == _2004;
    assign _1654 = _1586 ? _1653 : _1650;
    assign _1577 = f_changed_all & f_chgmask3;
    assign _1579 = _1577 == _761;
    assign _1580 = ~ _1579;
    assign _1576 = f_chgmask3 == _761;
    assign _1581 = _1576 | _1580;
    assign _1570 = _1273[7:0];
    assign _1568 = _1273[15:8];
    assign _1569 = _907 ^ _1568;
    assign _1571 = _1569 & _1570;
    assign _1573 = _1571 == _761;
    assign _1574 = f_valid3 & _1573;
    assign _1582 = _1574 & _1581;
    assign _1655 = _1582 & _1654;
    assign _1660 = _1655 & _1659;
    assign _1699 = _1660 & _1698;
    assign _1700 = f_in_eval & _1699;
    assign _1704 = _1700 & _1703;
    assign f_fire3 = _1704 & _1288;
    assign _1252 = f_chgmask0 & f_multi_eff;
    assign _1254 = _1252 == _761;
    assign _1240 = _1170 == _2004;
    assign _1236 = _1170 == _1689;
    assign _1237 = _1236 & _1217;
    assign _1234 = _945 == _1166;
    assign _1238 = _1234 | _1237;
    assign _1241 = _944 ? _1240 : _1238;
    assign _1231 = _1193[3:0];
    assign _1233 = _1231 == _1990;
    assign _1242 = _1233 | _1241;
    assign _1229 = _1170 == _2004;
    assign _1225 = _1170 == _1689;
    assign _1226 = _1225 & _1217;
    assign _1223 = _945 == _1166;
    assign _1227 = _1223 | _1226;
    assign _1230 = _944 ? _1229 : _1227;
    assign _1221 = _1157 == _2004;
    always @(posedge _316) begin
        if (_314)
            _1215 <= _458;
        else
            _1215 <= _1149;
    end
    assign _1216 = { _2022,
                     _1215 };
    assign _1217 = _942 < _1216;
    assign _1211 = _1157 == _1689;
    assign _1218 = _1211 & _1217;
    assign _1209 = _945 == _1154;
    assign _1219 = _1209 | _1218;
    assign _1222 = _944 ? _1221 : _1219;
    assign _1208 = _903[104:103];
    always @* begin
        case (_1208)
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
    assign _1207 = ~ _1206;
    assign _1244 = _1207 | _1243;
    assign _1199 = _903[62:62];
    assign _1175 = _903[61:58];
    always @* begin
        case (_1175)
        0:
            _1198 <= vdd;
        1:
            _1198 <= _1180;
        2:
            _1198 <= _1184;
        3:
            _1198 <= _1188;
        4:
            _1198 <= _1190;
        5:
            _1198 <= _743;
        6:
            _1198 <= _1194;
        7:
            _1198 <= _1197;
        8:
            _1198 <= _663;
        9:
            _1198 <= _666;
        10:
            _1198 <= _669;
        11:
            _1198 <= _672;
        12:
            _1198 <= _651;
        13:
            _1198 <= _654;
        14:
            _1198 <= _657;
        default:
            _1198 <= _660;
        endcase
    end
    assign _1200 = _1198 ^ _1199;
    assign _1170 = _903[57:42];
    assign _1172 = _1170 == _2004;
    assign _1161 = _963[57:42];
    assign _1162 = { gnd,
                     _1161 };
    assign _1163 = _1162 + _1150;
    always @(posedge _316) begin
        if (_314)
            _1166 <= _1646;
        else
            _1166 <= _1163;
    end
    assign _1167 = _1166 < _945;
    assign _1168 = ~ _1167;
    assign _1157 = _903[41:26];
    assign _1159 = _1157 == _1689;
    assign _1123 = _967[0:0];
    assign _1143 = _1123 ? _1142 : _458;
    assign _1102 = _967[1:1];
    assign _1122 = _1102 ? _1121 : _458;
    assign _1144 = _1122 < _1143;
    assign _1145 = _1144 ? _1143 : _1122;
    assign _1079 = _967[2:2];
    assign _1099 = _1079 ? _1098 : _458;
    assign _1058 = _967[3:3];
    assign _1078 = _1058 ? _1077 : _458;
    assign _1100 = _1078 < _1099;
    assign _1101 = _1100 ? _1099 : _1078;
    assign _1146 = _1101 < _1145;
    assign _1147 = _1146 ? _1145 : _1101;
    assign _1033 = _967[4:4];
    assign _1053 = _1033 ? _1052 : _458;
    assign _1012 = _967[5:5];
    assign _1032 = _1012 ? _1031 : _458;
    assign _1054 = _1032 < _1053;
    assign _1055 = _1054 ? _1053 : _1032;
    assign _989 = _967[6:6];
    assign _1009 = _989 ? _1008 : _458;
    assign _967 = _963[23:16];
    assign _968 = _967[7:7];
    assign _988 = _968 ? _987 : _458;
    assign _1010 = _988 < _1009;
    assign _1011 = _1010 ? _1009 : _988;
    assign _1056 = _1011 < _1055;
    assign _1057 = _1056 ? _1055 : _1011;
    assign _1148 = _1057 < _1147;
    assign _1149 = _1148 ? _1147 : _1057;
    assign _1150 = { _1591,
                     _1149 };
    assign _963 = _962[175:64];
    assign _964 = _963[41:26];
    assign _965 = { gnd,
                    _964 };
    assign _1151 = _965 + _1150;
    always @(posedge _316) begin
        if (_314)
            _1154 <= _1646;
        else
            _1154 <= _1151;
    end
    assign _945 = { gnd,
                    _942 };
    assign _1155 = _945 < _1154;
    assign _1156 = ~ _1155;
    assign _1160 = _1156 | _1159;
    assign _1169 = _1160 & _1168;
    assign _932 = _903[25:24];
    always @* begin
        case (_932)
        0:
            _942 <= _935;
        1:
            _942 <= _938;
        2:
            _942 <= _941;
        default:
            _942 <= _941;
        endcase
    end
    assign _944 = _942 == _2004;
    assign _1173 = _944 ? _1172 : _1169;
    assign _926 = f_changed_all & f_chgmask0;
    assign _928 = _926 == _761;
    assign _929 = ~ _928;
    assign _917 = f_chgmask0 == _761;
    assign _930 = _917 | _929;
    assign _910 = _903[7:0];
    assign _908 = _903[15:8];
    assign _909 = _907 ^ _908;
    assign _911 = _909 & _910;
    assign _913 = _911 == _761;
    assign _891 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _4548 = _884 + _488;
    assign _4544 = _4440 ? _458 : _884;
    assign _4539 = f_policy == _2052;
    assign _4541 = _4539 ? _458 : _884;
    assign _1958 = f_changed_all & f_watch;
    assign _1960 = _1958 == _761;
    assign _1961 = ~ _1960;
    assign _1956 = ~ _1706;
    assign _1957 = f_in_eval & _1956;
    assign f_unexp_now = _1957 & _1961;
    assign _2968 = ~ f_amb_now;
    assign _2969 = _1955 & _2968;
    assign _2971 = _2969 ? _1825 : _2967;
    assign _2972 = _1706 ? _2967 : _2971;
    assign _2967 = _1707 ? _1823 : _1953;
    assign _2965 = _879 == _2052;
    assign _2973 = _2965 ? _2972 : _2967;
    assign _109 = _2973;
    always @(posedge _316) begin
        if (_314)
            _1953 <= _1823;
        else
            _1953 <= _109;
    end
    assign _1954 = ~ _1953;
    assign _4530 = 16'b0000000000000001;
    assign _4531 = _935 + _4530;
    assign _4527 = _935 == _2004;
    assign _4528 = ~ _4527;
    assign _4529 = _4488 & _4528;
    assign _4532 = _4529 ? _4531 : _935;
    assign _4472 = _1256[26:24];
    assign _4470 = _1273[93:91];
    assign _4469 = _1267[93:91];
    assign _4468 = _1261[93:91];
    assign _4467 = _903[93:91];
    assign _1562 = f_chgmask2 & f_multi_eff;
    assign _1564 = _1562 == _761;
    assign _1555 = _1512 == _2004;
    assign _1551 = _1512 == _1689;
    assign _1552 = _1551 & _1532;
    assign _1549 = _1448 == _1508;
    assign _1553 = _1549 | _1552;
    assign _1556 = _1447 ? _1555 : _1553;
    assign _1546 = _1193[3:0];
    assign _1548 = _1546 == _1990;
    assign _1557 = _1548 | _1556;
    assign _1544 = _1512 == _2004;
    assign _1540 = _1512 == _1689;
    assign _1541 = _1540 & _1532;
    assign _1538 = _1448 == _1508;
    assign _1542 = _1538 | _1541;
    assign _1545 = _1447 ? _1544 : _1542;
    assign _1536 = _1499 == _2004;
    always @(posedge _316) begin
        if (_314)
            _1530 <= _458;
        else
            _1530 <= _1491;
    end
    assign _1531 = { _2022,
                     _1530 };
    assign _1532 = _1445 < _1531;
    assign _1526 = _1499 == _1689;
    assign _1533 = _1526 & _1532;
    assign _1524 = _1448 == _1496;
    assign _1534 = _1524 | _1533;
    assign _1537 = _1447 ? _1536 : _1534;
    assign _1523 = _1267[104:103];
    always @* begin
        case (_1523)
        0:
            _1558 <= vdd;
        1:
            _1558 <= _1537;
        2:
            _1558 <= _1545;
        default:
            _1558 <= _1557;
        endcase
    end
    assign _1522 = ~ _1206;
    assign _1559 = _1522 | _1558;
    assign _1519 = _1267[62:62];
    assign _1517 = _1267[61:58];
    always @* begin
        case (_1517)
        0:
            _1518 <= vdd;
        1:
            _1518 <= _1180;
        2:
            _1518 <= _1184;
        3:
            _1518 <= _1188;
        4:
            _1518 <= _1190;
        5:
            _1518 <= _743;
        6:
            _1518 <= _1194;
        7:
            _1518 <= _1197;
        8:
            _1518 <= _663;
        9:
            _1518 <= _666;
        10:
            _1518 <= _669;
        11:
            _1518 <= _672;
        12:
            _1518 <= _651;
        13:
            _1518 <= _654;
        14:
            _1518 <= _657;
        default:
            _1518 <= _660;
        endcase
    end
    assign _1520 = _1518 ^ _1519;
    assign _1512 = _1267[57:42];
    assign _1514 = _1512 == _2004;
    assign _1503 = _1449[57:42];
    assign _1504 = { gnd,
                     _1503 };
    assign _1505 = _1504 + _1492;
    always @(posedge _316) begin
        if (_314)
            _1508 <= _1646;
        else
            _1508 <= _1505;
    end
    assign _1509 = _1508 < _1448;
    assign _1510 = ~ _1509;
    assign _1499 = _1267[41:26];
    assign _1501 = _1499 == _1689;
    assign _1483 = _1453[0:0];
    assign _1485 = _1483 ? _1142 : _458;
    assign _1480 = _1453[1:1];
    assign _1482 = _1480 ? _1121 : _458;
    assign _1486 = _1482 < _1485;
    assign _1487 = _1486 ? _1485 : _1482;
    assign _1475 = _1453[2:2];
    assign _1477 = _1475 ? _1098 : _458;
    assign _1472 = _1453[3:3];
    assign _1474 = _1472 ? _1077 : _458;
    assign _1478 = _1474 < _1477;
    assign _1479 = _1478 ? _1477 : _1474;
    assign _1488 = _1479 < _1487;
    assign _1489 = _1488 ? _1487 : _1479;
    assign _1465 = _1453[4:4];
    assign _1467 = _1465 ? _1052 : _458;
    assign _1462 = _1453[5:5];
    assign _1464 = _1462 ? _1031 : _458;
    assign _1468 = _1464 < _1467;
    assign _1469 = _1468 ? _1467 : _1464;
    assign _1457 = _1453[6:6];
    assign _1459 = _1457 ? _1008 : _458;
    assign _1453 = _1449[23:16];
    assign _1454 = _1453[7:7];
    assign _1456 = _1454 ? _987 : _458;
    assign _1460 = _1456 < _1459;
    assign _1461 = _1460 ? _1459 : _1456;
    assign _1470 = _1461 < _1469;
    assign _1471 = _1470 ? _1469 : _1461;
    assign _1490 = _1471 < _1489;
    assign _1491 = _1490 ? _1489 : _1471;
    assign _1492 = { _1591,
                     _1491 };
    assign _1449 = _962[399:288];
    assign _1450 = _1449[41:26];
    assign _1451 = { gnd,
                     _1450 };
    assign _1493 = _1451 + _1492;
    always @(posedge _316) begin
        if (_314)
            _1496 <= _1646;
        else
            _1496 <= _1493;
    end
    assign _1448 = { gnd,
                     _1445 };
    assign _1497 = _1448 < _1496;
    assign _1498 = ~ _1497;
    assign _1502 = _1498 | _1501;
    assign _1511 = _1502 & _1510;
    assign _1444 = _1267[25:24];
    always @* begin
        case (_1444)
        0:
            _1445 <= _935;
        1:
            _1445 <= _938;
        2:
            _1445 <= _941;
        default:
            _1445 <= _941;
        endcase
    end
    assign _1447 = _1445 == _2004;
    assign _1515 = _1447 ? _1514 : _1511;
    assign _1438 = f_changed_all & f_chgmask2;
    assign _1440 = _1438 == _761;
    assign _1441 = ~ _1440;
    assign _1437 = f_chgmask2 == _761;
    assign _1442 = _1437 | _1441;
    assign _1431 = _1267[7:0];
    assign _1429 = _1267[15:8];
    assign _1430 = _907 ^ _1429;
    assign _1432 = _1430 & _1431;
    assign _1434 = _1432 == _761;
    assign _1435 = f_valid2 & _1434;
    assign _1443 = _1435 & _1442;
    assign _1516 = _1443 & _1515;
    assign _1521 = _1516 & _1520;
    assign _1560 = _1521 & _1559;
    assign _1561 = f_in_eval & _1560;
    assign _1565 = _1561 & _1564;
    assign f_fire2 = _1565 & _1288;
    assign _1710 = f_fire2 ? _2052 : _1967;
    assign _1287 = f_policy == _2051;
    assign f_chgmask3 = _1273[23:16];
    assign f_valid3 = _1273[111:111];
    assign _1277 = f_valid3 ? f_chgmask3 : _761;
    assign f_chgmask2 = _1267[23:16];
    assign f_valid2 = _1267[111:111];
    assign _1271 = f_valid2 ? f_chgmask2 : _761;
    assign _1265 = f_valid1 ? f_chgmask1 : _761;
    assign f_chgmask0 = _903[23:16];
    assign _1259 = f_valid0 ? f_chgmask0 : _761;
    assign f_watch = _1256[57:50];
    assign _1260 = f_watch | _1259;
    assign _1266 = _1260 | _1265;
    assign _1272 = _1266 | _1271;
    assign f_relevant = _1272 | _1277;
    assign _1279 = f_multi_eff & f_relevant;
    assign _1281 = _1279 == _761;
    assign _1282 = ~ _1281;
    assign f_amb_now = f_in_eval & _1282;
    assign _1284 = ~ f_amb_now;
    assign _1288 = _1284 | _1287;
    assign _1250 = _920 & f_chg_now;
    assign _2978 = _920 & f_chg_now;
    assign _2979 = _1249 | _2978;
    assign _2975 = _879 == _2052;
    assign _2977 = _2975 ? _761 : _1249;
    assign _2974 = _879 == _2051;
    assign _2980 = _2974 ? _2979 : _2977;
    assign _2982 = _1899 ? _761 : _2980;
    assign _110 = _2982;
    always @(posedge _316) begin
        if (_314)
            _1249 <= _761;
        else
            _1249 <= _110;
    end
    assign f_multi_eff = _1249 | _1250;
    assign _1423 = f_chgmask1 & f_multi_eff;
    assign _1425 = _1423 == _761;
    assign _1416 = _1373 == _2004;
    assign _1412 = _1373 == _1689;
    assign _1413 = _1412 & _1393;
    assign _1410 = _1309 == _1369;
    assign _1414 = _1410 | _1413;
    assign _1417 = _1308 ? _1416 : _1414;
    assign _1407 = _1193[3:0];
    assign _1409 = _1407 == _1990;
    assign _1418 = _1409 | _1417;
    assign _1405 = _1373 == _2004;
    assign _1401 = _1373 == _1689;
    assign _1402 = _1401 & _1393;
    assign _1399 = _1309 == _1369;
    assign _1403 = _1399 | _1402;
    assign _1406 = _1308 ? _1405 : _1403;
    assign _1397 = _1360 == _2004;
    always @(posedge _316) begin
        if (_314)
            _1391 <= _458;
        else
            _1391 <= _1352;
    end
    assign _1392 = { _2022,
                     _1391 };
    assign _1393 = _1306 < _1392;
    assign _1387 = _1360 == _1689;
    assign _1394 = _1387 & _1393;
    assign _1385 = _1309 == _1357;
    assign _1395 = _1385 | _1394;
    assign _1398 = _1308 ? _1397 : _1395;
    assign _1384 = _1261[104:103];
    always @* begin
        case (_1384)
        0:
            _1419 <= vdd;
        1:
            _1419 <= _1398;
        2:
            _1419 <= _1406;
        default:
            _1419 <= _1418;
        endcase
    end
    assign _112 = host_role;
    assign _2983 = _1899 ? _112 : _1204;
    assign _113 = _2983;
    always @(posedge _316) begin
        if (_314)
            _1204 <= _2689;
        else
            _1204 <= _113;
    end
    assign _1206 = _1204 == _2052;
    assign _1383 = ~ _1206;
    assign _1420 = _1383 | _1419;
    assign _1380 = _1261[62:62];
    assign _2987 = _642 ? _1825 : _2985;
    assign _2985 = _612 ? _1825 : _660;
    assign _2988 = _597 ? _2987 : _2985;
    assign _2990 = _499 ? _1823 : _2988;
    assign _2992 = _497 ? _1823 : _2990;
    assign _114 = _2992;
    always @(posedge _316) begin
        if (_314)
            _660 <= _1823;
        else
            _660 <= _114;
    end
    assign _2999 = _2998 ^ _119;
    assign _3000 = _2999 & _117;
    assign _3002 = _3000 == _1689;
    assign _2993 = ~ _182;
    assign _3003 = _2993 & _3002;
    assign _3005 = _3003 ? _1825 : _657;
    assign _3006 = _775 ? _3005 : _657;
    assign _3007 = _642 ? _657 : _3006;
    assign _3008 = _597 ? _3007 : _657;
    assign _3010 = _499 ? _1823 : _3008;
    assign _3012 = _497 ? _1823 : _3010;
    assign _115 = _3012;
    always @(posedge _316) begin
        if (_314)
            _657 <= _1823;
        else
            _657 <= _115;
    end
    assign _117 = host_lane1_sync_mask;
    assign _119 = host_lane1_sync;
    assign _3050 = g_crc[31:16];
    assign _3051 = _3050 ^ _119;
    assign _3052 = _3051 & _117;
    assign _3054 = _3052 == _1689;
    assign _3025 = _633 == _3024;
    assign _3026 = ~ _3025;
    assign _3028 = _3019 ? _3027 : g_crc_bad;
    assign _3029 = _775 ? _3028 : g_crc_bad;
    assign _3030 = _642 ? g_crc_bad : _3029;
    assign _3031 = _597 ? _3030 : g_crc_bad;
    assign _3033 = _499 ? _1823 : _3031;
    assign _120 = _3033;
    always @(posedge _316) begin
        if (_314)
            g_crc_bad <= _1823;
        else
            g_crc_bad <= _120;
    end
    assign _3027 = g_crc_bad | _3026;
    assign _3044 = ~ _3027;
    assign _3042 = 6'b000001;
    assign _3043 = g_left == _3042;
    assign _3045 = _3043 ? _3044 : _654;
    assign _3046 = _3019 ? _3045 : _654;
    assign _3047 = _775 ? _3046 : _654;
    assign _3048 = _642 ? _654 : _3047;
    assign _3049 = _597 ? _3048 : _654;
    assign _3037 = ~ _497;
    assign _3035 = ~ _499;
    assign _3034 = _805 & _182;
    assign _3036 = _3034 & _3035;
    assign _3038 = _3036 & _3037;
    assign _121 = _3038;
    always @(posedge _316) begin
        if (_314)
            g_resid_chk <= _1823;
        else
            g_resid_chk <= _121;
    end
    assign _3055 = g_resid_chk ? _3054 : _3049;
    assign _3057 = _499 ? _1823 : _3055;
    assign _3059 = _497 ? _1823 : _3057;
    assign _122 = _3059;
    always @(posedge _316) begin
        if (_314)
            _654 <= _1823;
        else
            _654 <= _122;
    end
    assign _3063 = _487 ? _1825 : _3061;
    assign _3061 = _456 ? _1825 : _672;
    assign _3064 = _441 ? _3063 : _3061;
    assign _3066 = _339 ? _1823 : _3064;
    assign _3068 = _337 ? _1823 : _3066;
    assign _123 = _3068;
    always @(posedge _316) begin
        if (_314)
            _672 <= _1823;
        else
            _672 <= _123;
    end
    assign _3075 = _3074 ^ _128;
    assign _3076 = _3075 & _126;
    assign _3078 = _3076 == _1689;
    assign _3069 = ~ _243;
    assign _3079 = _3069 & _3078;
    assign _3081 = _3079 ? _1825 : _669;
    assign _3082 = _675 ? _3081 : _669;
    assign _3083 = _487 ? _669 : _3082;
    assign _3084 = _441 ? _3083 : _669;
    assign _3086 = _339 ? _1823 : _3084;
    assign _3088 = _337 ? _1823 : _3086;
    assign _124 = _3088;
    always @(posedge _316) begin
        if (_314)
            _669 <= _1823;
        else
            _669 <= _124;
    end
    assign _126 = host_lane0_sync_mask;
    assign _128 = host_lane0_sync;
    assign _3126 = g_crc_0[31:16];
    assign _3127 = _3126 ^ _128;
    assign _3128 = _3127 & _126;
    assign _3130 = _3128 == _1689;
    assign _3101 = _477 == _3100;
    assign _3102 = ~ _3101;
    assign _3104 = _3095 ? _3103 : g_crc_bad_0;
    assign _3105 = _675 ? _3104 : g_crc_bad_0;
    assign _3106 = _487 ? g_crc_bad_0 : _3105;
    assign _3107 = _441 ? _3106 : g_crc_bad_0;
    assign _3109 = _339 ? _1823 : _3107;
    assign _129 = _3109;
    always @(posedge _316) begin
        if (_314)
            g_crc_bad_0 <= _1823;
        else
            g_crc_bad_0 <= _129;
    end
    assign _3103 = g_crc_bad_0 | _3102;
    assign _3120 = ~ _3103;
    assign _3119 = g_left_0 == _3042;
    assign _3121 = _3119 ? _3120 : _666;
    assign _3122 = _3095 ? _3121 : _666;
    assign _3123 = _675 ? _3122 : _666;
    assign _3124 = _487 ? _666 : _3123;
    assign _3125 = _441 ? _3124 : _666;
    assign _3113 = ~ _337;
    assign _3111 = ~ _339;
    assign _3110 = _705 & _243;
    assign _3112 = _3110 & _3111;
    assign _3114 = _3112 & _3113;
    assign _130 = _3114;
    always @(posedge _316) begin
        if (_314)
            g_resid_chk_0 <= _1823;
        else
            g_resid_chk_0 <= _130;
    end
    assign _3131 = g_resid_chk_0 ? _3130 : _3125;
    assign _3133 = _339 ? _1823 : _3131;
    assign _3135 = _337 ? _1823 : _3133;
    assign _131 = _3135;
    always @(posedge _316) begin
        if (_314)
            _666 <= _1823;
        else
            _666 <= _131;
    end
    assign _133 = host_match_addr;
    assign _1196 = _133[6:0];
    assign _1195 = _1187[7:1];
    assign _1197 = _1195 == _1196;
    assign _1192 = 16'b1010110011100001;
    assign _3140 = _1193[10:10];
    assign _3139 = _1193[12:12];
    assign _3141 = _3139 ^ _3140;
    assign _3138 = _1193[13:13];
    assign _3142 = _3138 ^ _3141;
    assign _3137 = _1193[15:15];
    assign _3143 = _3137 ^ _3142;
    assign _3136 = _1193[14:0];
    assign _3144 = { _3136,
                     _3143 };
    assign _134 = _3144;
    always @(posedge _316) begin
        if (_314)
            _1193 <= _1192;
        else
            _1193 <= _134;
    end
    assign _1194 = _1193[0:0];
    assign _742 = 6'b100000;
    assign _3161 = 6'b000000;
    assign _3157 = _138 + _3042;
    assign _3155 = _138 - _3042;
    assign _3158 = _2478 ? _3157 : _3155;
    assign _2476 = _138 == _3161;
    assign _2485 = ~ _2476;
    assign _136 = host_rx_pop;
    assign _2486 = _136 & _2485;
    assign _2477 = ~ _743;
    assign _3151 = ~ _3150;
    assign _3147 = _876 | _1724;
    assign _3145 = _774 | _841;
    assign _3146 = _741 | _3145;
    assign _3148 = _3146 | _3147;
    assign _3152 = _3148 & _3151;
    assign f_rx_push = _3152;
    assign _2478 = f_rx_push & _2477;
    assign _3153 = _2478 ^ _2486;
    assign _3159 = _3153 ? _3158 : _138;
    always @(posedge _316) begin
        if (_314)
            _3162 <= _3161;
        else
            _3162 <= _3159;
    end
    assign _138 = _3162;
    assign _743 = _138 == _742;
    assign _1188 = _1187[0:0];
    assign _4241 = _1183[7:1];
    assign _4242 = { vdd,
                     _4241 };
    assign _4239 = _4231[7:7];
    assign _4238 = _4231[6:6];
    assign _4237 = _4231[5:5];
    assign _4236 = _4231[4:4];
    assign _4235 = _4231[3:3];
    assign _4234 = _4231[2:2];
    assign _4233 = _4231[1:1];
    assign _4232 = _4231[0:0];
    assign _4240 = { _4232,
                     _4233,
                     _4234,
                     _4235,
                     _4236,
                     _4237,
                     _4238,
                     _4239 };
    assign _4224 = _281 + _3042;
    assign _4222 = _281 - _3042;
    assign _4225 = _3179 ? _4224 : _4222;
    assign _745 = _281 == _742;
    assign _3178 = ~ _745;
    assign _3175 = ~ _279;
    assign _140 = host_tx_push;
    assign _3176 = _140 & _3175;
    assign _739 = ~ _705;
    assign _733 = g_bitpos_0 + _488;
    assign _728 = ~ _471;
    assign g_tx_bit = _718 & _726;
    assign _729 = g_tx_bit & _728;
    assign _730 = _729 & g_data_left_0;
    assign _731 = _699 | _730;
    assign _734 = _731 ? _733 : g_bitpos_0;
    assign _736 = _734 == _458;
    assign _737 = ~ _736;
    assign _708 = _707 & _275;
    assign _738 = _708 & _737;
    assign _740 = _738 & _739;
    assign _704 = g_bitpos_0 == _2470;
    assign _695 = g_cnt_0[5:0];
    assign _696 = _695 < _239;
    assign _697 = ~ _696;
    assign _691 = g_cnt_0[15:6];
    assign _693 = _691 == _2019;
    assign _694 = ~ _693;
    assign _698 = _694 | _697;
    assign _4212 = ~ _271;
    assign _4213 = _275 & _4212;
    assign _4216 = _4213 ? _2051 : _2052;
    assign _4205 = ~ _726;
    assign _4206 = _718 & _4205;
    assign _4207 = _663 | _4206;
    assign _4208 = _4207 | _4197;
    assign _4210 = _4208 ? _2052 : _4204;
    assign _4191 = g_run_0 + _488;
    assign _4188 = g_run_0 + _488;
    assign _4184 = vdd == g_last_0;
    assign _4182 = g_run_0 == _458;
    assign _4183 = ~ _4182;
    assign _4185 = _4183 & _4184;
    assign _4189 = _4185 ? _4188 : _488;
    assign _4180 = _253 == _2052;
    assign _4192 = _4180 ? _4191 : _4189;
    assign _4193 = _4192 == _143;
    assign _4174 = g_run_0 + _488;
    assign _4170 = gnd == g_last_0;
    assign _4168 = g_run_0 == _458;
    assign _4169 = ~ _4168;
    assign _4171 = _4169 & _4170;
    assign _4175 = _4171 ? _4174 : _488;
    assign _4166 = _253 == _2052;
    assign _4177 = _4166 ? _458 : _4175;
    assign _4178 = _4177 == _143;
    assign _4194 = _477 ? _4193 : _4178;
    assign _4195 = _466 & _4194;
    assign _4196 = ~ _4195;
    assign _4162 = g_left_0 == _3042;
    assign _4160 = g_left_0 == _3161;
    assign _4163 = _3095 ? _4162 : _4160;
    assign _4155 = g_cnt_0 + _4530;
    assign _4156 = _4155 == _688;
    assign _4153 = g_cnt_0 == _688;
    assign _4157 = _690 ? _4156 : _4153;
    assign _4151 = ~ _487;
    assign _4152 = _441 & _4151;
    assign _4158 = _4152 & _4157;
    assign _4164 = _4158 & _4163;
    assign _4197 = _4164 & _4196;
    assign _4199 = _4197 ? _1967 : _4150;
    assign _4201 = _487 ? _2689 : _4199;
    assign _4147 = _726 ? _4145 : _1967;
    assign _4143 = _370 & _368;
    assign _4145 = _4143 ? _2052 : g_mode_0;
    assign _4148 = _718 ? _4147 : _4145;
    assign _3398 = _726 ? _3397 : _3165;
    assign _3399 = _718 ? _3398 : _3165;
    assign _141 = _3399;
    always @(posedge _316) begin
        if (_314)
            _3165 <= _1823;
        else
            _3165 <= _141;
    end
    assign _4069 = ~ _3397;
    assign _4067 = ~ f_lane0_out;
    assign _4068 = _3397 ? f_lane0_out : _4067;
    always @* begin
        case (_269)
        0:
            _4070 <= _3397;
        1:
            _4070 <= _4068;
        2:
            _4070 <= _4069;
        default:
            _4070 <= _3397;
        endcase
    end
    assign _143 = host_lane0_stuff_len;
    assign _4051 = g_run_0 + _488;
    assign _4052 = _477 ? _4051 : _458;
    assign _4047 = g_run_0 + _488;
    assign _4043 = _477 == g_last_0;
    assign _4041 = g_run_0 == _458;
    assign _4042 = ~ _4041;
    assign _4044 = _4042 & _4043;
    assign _4048 = _4044 ? _4047 : _488;
    assign _4039 = _253 == _2052;
    assign _4053 = _4039 ? _4052 : _4048;
    assign _4054 = _487 ? _4037 : _4053;
    assign _4033 = g_run_0 + _488;
    assign _4034 = _3397 ? _4033 : _458;
    assign _4029 = g_run_0 + _488;
    assign _3394 = _3386[7:7];
    assign _3393 = _3386[6:6];
    assign _3392 = _3386[5:5];
    assign _3391 = _3386[4:4];
    assign _3390 = _3386[3:3];
    assign _3389 = _3386[2:2];
    assign _3388 = _3386[1:1];
    assign _3384 = _3376[7:7];
    assign _3383 = _3376[6:6];
    assign _3382 = _3376[5:5];
    assign _3381 = _3376[4:4];
    assign _3380 = _3376[3:3];
    assign _3379 = _3376[2:2];
    assign _3378 = _3376[1:1];
    assign _3370 = _3182 == _2681;
    assign _3371 = _3179 & _3370;
    always @(posedge _316) begin
        if (_314)
            _3372 <= _761;
        else
            if (_3371)
                _3372 <= _3172;
    end
    assign _3364 = _3182 == _2675;
    assign _3365 = _3179 & _3364;
    always @(posedge _316) begin
        if (_314)
            _3366 <= _761;
        else
            if (_3365)
                _3366 <= _3172;
    end
    assign _3358 = _3182 == _2669;
    assign _3359 = _3179 & _3358;
    always @(posedge _316) begin
        if (_314)
            _3360 <= _761;
        else
            if (_3359)
                _3360 <= _3172;
    end
    assign _3352 = _3182 == _2663;
    assign _3353 = _3179 & _3352;
    always @(posedge _316) begin
        if (_314)
            _3354 <= _761;
        else
            if (_3353)
                _3354 <= _3172;
    end
    assign _3346 = _3182 == _2657;
    assign _3347 = _3179 & _3346;
    always @(posedge _316) begin
        if (_314)
            _3348 <= _761;
        else
            if (_3347)
                _3348 <= _3172;
    end
    assign _3340 = _3182 == _2651;
    assign _3341 = _3179 & _3340;
    always @(posedge _316) begin
        if (_314)
            _3342 <= _761;
        else
            if (_3341)
                _3342 <= _3172;
    end
    assign _3334 = _3182 == _2645;
    assign _3335 = _3179 & _3334;
    always @(posedge _316) begin
        if (_314)
            _3336 <= _761;
        else
            if (_3335)
                _3336 <= _3172;
    end
    assign _3328 = _3182 == _2639;
    assign _3329 = _3179 & _3328;
    always @(posedge _316) begin
        if (_314)
            _3330 <= _761;
        else
            if (_3329)
                _3330 <= _3172;
    end
    assign _3322 = _3182 == _2633;
    assign _3323 = _3179 & _3322;
    always @(posedge _316) begin
        if (_314)
            _3324 <= _761;
        else
            if (_3323)
                _3324 <= _3172;
    end
    assign _3316 = _3182 == _2627;
    assign _3317 = _3179 & _3316;
    always @(posedge _316) begin
        if (_314)
            _3318 <= _761;
        else
            if (_3317)
                _3318 <= _3172;
    end
    assign _3310 = _3182 == _2621;
    assign _3311 = _3179 & _3310;
    always @(posedge _316) begin
        if (_314)
            _3312 <= _761;
        else
            if (_3311)
                _3312 <= _3172;
    end
    assign _3304 = _3182 == _2615;
    assign _3305 = _3179 & _3304;
    always @(posedge _316) begin
        if (_314)
            _3306 <= _761;
        else
            if (_3305)
                _3306 <= _3172;
    end
    assign _3298 = _3182 == _2609;
    assign _3299 = _3179 & _3298;
    always @(posedge _316) begin
        if (_314)
            _3300 <= _761;
        else
            if (_3299)
                _3300 <= _3172;
    end
    assign _3292 = _3182 == _2603;
    assign _3293 = _3179 & _3292;
    always @(posedge _316) begin
        if (_314)
            _3294 <= _761;
        else
            if (_3293)
                _3294 <= _3172;
    end
    assign _3286 = _3182 == _2597;
    assign _3287 = _3179 & _3286;
    always @(posedge _316) begin
        if (_314)
            _3288 <= _761;
        else
            if (_3287)
                _3288 <= _3172;
    end
    assign _3280 = _3182 == _2591;
    assign _3281 = _3179 & _3280;
    always @(posedge _316) begin
        if (_314)
            _3282 <= _761;
        else
            if (_3281)
                _3282 <= _3172;
    end
    assign _3274 = _3182 == _2585;
    assign _3275 = _3179 & _3274;
    always @(posedge _316) begin
        if (_314)
            _3276 <= _761;
        else
            if (_3275)
                _3276 <= _3172;
    end
    assign _3268 = _3182 == _2579;
    assign _3269 = _3179 & _3268;
    always @(posedge _316) begin
        if (_314)
            _3270 <= _761;
        else
            if (_3269)
                _3270 <= _3172;
    end
    assign _3262 = _3182 == _2573;
    assign _3263 = _3179 & _3262;
    always @(posedge _316) begin
        if (_314)
            _3264 <= _761;
        else
            if (_3263)
                _3264 <= _3172;
    end
    assign _3256 = _3182 == _2567;
    assign _3257 = _3179 & _3256;
    always @(posedge _316) begin
        if (_314)
            _3258 <= _761;
        else
            if (_3257)
                _3258 <= _3172;
    end
    assign _3250 = _3182 == _2561;
    assign _3251 = _3179 & _3250;
    always @(posedge _316) begin
        if (_314)
            _3252 <= _761;
        else
            if (_3251)
                _3252 <= _3172;
    end
    assign _3244 = _3182 == _2555;
    assign _3245 = _3179 & _3244;
    always @(posedge _316) begin
        if (_314)
            _3246 <= _761;
        else
            if (_3245)
                _3246 <= _3172;
    end
    assign _3238 = _3182 == _2549;
    assign _3239 = _3179 & _3238;
    always @(posedge _316) begin
        if (_314)
            _3240 <= _761;
        else
            if (_3239)
                _3240 <= _3172;
    end
    assign _3232 = _3182 == _2543;
    assign _3233 = _3179 & _3232;
    always @(posedge _316) begin
        if (_314)
            _3234 <= _761;
        else
            if (_3233)
                _3234 <= _3172;
    end
    assign _3226 = _3182 == _2537;
    assign _3227 = _3179 & _3226;
    always @(posedge _316) begin
        if (_314)
            _3228 <= _761;
        else
            if (_3227)
                _3228 <= _3172;
    end
    assign _3220 = _3182 == _2531;
    assign _3221 = _3179 & _3220;
    always @(posedge _316) begin
        if (_314)
            _3222 <= _761;
        else
            if (_3221)
                _3222 <= _3172;
    end
    assign _3214 = _3182 == _2525;
    assign _3215 = _3179 & _3214;
    always @(posedge _316) begin
        if (_314)
            _3216 <= _761;
        else
            if (_3215)
                _3216 <= _3172;
    end
    assign _3208 = _3182 == _2519;
    assign _3209 = _3179 & _3208;
    always @(posedge _316) begin
        if (_314)
            _3210 <= _761;
        else
            if (_3209)
                _3210 <= _3172;
    end
    assign _3202 = _3182 == _2513;
    assign _3203 = _3179 & _3202;
    always @(posedge _316) begin
        if (_314)
            _3204 <= _761;
        else
            if (_3203)
                _3204 <= _3172;
    end
    assign _3196 = _3182 == _2507;
    assign _3197 = _3179 & _3196;
    always @(posedge _316) begin
        if (_314)
            _3198 <= _761;
        else
            if (_3197)
                _3198 <= _3172;
    end
    assign _3190 = _3182 == _1980;
    assign _3191 = _3179 & _3190;
    always @(posedge _316) begin
        if (_314)
            _3192 <= _761;
        else
            if (_3191)
                _3192 <= _3172;
    end
    assign _3401 = _3182 + _1980;
    assign _3402 = _3179 ? _3401 : _3182;
    assign _144 = _3402;
    always @(posedge _316) begin
        if (_314)
            _3182 <= _1978;
        else
            _3182 <= _144;
    end
    assign _3184 = _3182 == _1978;
    assign _3185 = _3179 & _3184;
    assign _3469 = _699 ? _3468 : g_byte_0;
    assign _3470 = _705 ? _3468 : _3469;
    assign _3420 = _3419 ? _3417 : _3407;
    assign _3418 = _3404 ? _3417 : _3407;
    assign _3421 = _845 ? _3420 : _3418;
    assign _145 = _3421;
    always @(posedge _316) begin
        if (_314)
            _3407 <= _761;
        else
            _3407 <= _145;
    end
    assign _3416 = _799 ? _3415 : g_byte;
    assign _3417 = _805 ? _3415 : _3416;
    assign _3462 = _774 ? _3407 : _3417;
    assign _3429 = _3428 ? _1187 : _3426;
    assign _3427 = _3423 ? _1187 : _3426;
    assign _3430 = _1731 ? _3429 : _3427;
    assign _146 = _3430;
    always @(posedge _316) begin
        if (_314)
            _3426 <= _761;
        else
            _3426 <= _146;
    end
    assign _3447 = _1187[6:0];
    assign _3448 = { _3447,
                     _3444 };
    assign _3445 = _1187[7:1];
    assign _3443 = _907[7:7];
    assign _3442 = _907[6:6];
    assign _3441 = _907[5:5];
    assign _3440 = _907[4:4];
    assign _3439 = _907[3:3];
    assign _3438 = _907[2:2];
    assign _3437 = _907[1:1];
    assign _3436 = _907[0:0];
    assign _3434 = _1273[102:100];
    assign _3433 = _1267[102:100];
    assign _3432 = _1261[102:100];
    assign _3431 = _903[102:100];
    always @* begin
        case (f_winner)
        0:
            _3435 <= _3431;
        1:
            _3435 <= _3432;
        2:
            _3435 <= _3433;
        default:
            _3435 <= _3434;
        endcase
    end
    always @* begin
        case (_3435)
        0:
            _3444 <= _3436;
        1:
            _3444 <= _3437;
        2:
            _3444 <= _3438;
        3:
            _3444 <= _3439;
        4:
            _3444 <= _3440;
        5:
            _3444 <= _3441;
        6:
            _3444 <= _3442;
        default:
            _3444 <= _3443;
        endcase
    end
    assign _3446 = { _3444,
                     _3445 };
    always @* begin
        case (_1721)
        0:
            _3449 <= _1187;
        1:
            _3449 <= _3446;
        2:
            _3449 <= _3448;
        default:
            _3449 <= _1187;
        endcase
    end
    assign _3450 = _1707 ? _3449 : _1187;
    assign _147 = _3450;
    always @(posedge _316) begin
        if (_314)
            _1187 <= _761;
        else
            _1187 <= _147;
    end
    assign _3428 = _876 & _1724;
    assign _3454 = _3428 ? _876 : _1823;
    assign _3422 = ~ _876;
    assign _3423 = _3422 & _1724;
    assign _3452 = _3423 ? _1825 : _876;
    assign _1718 = _1273[97:96];
    assign _1717 = _1267[97:96];
    assign _1716 = _1261[97:96];
    assign _1715 = _903[97:96];
    always @* begin
        case (f_winner)
        0:
            _1719 <= _1715;
        1:
            _1719 <= _1716;
        2:
            _1719 <= _1717;
        default:
            _1719 <= _1718;
        endcase
    end
    assign _1721 = _887 ? _2689 : _1719;
    assign f_eng_push = _1721 == _1967;
    assign _1724 = _1707 & f_eng_push;
    assign _1730 = _876 | _1724;
    assign _1727 = _774 | _841;
    assign _1728 = ~ _1727;
    assign _1726 = ~ _741;
    assign _1729 = _1726 & _1728;
    assign _1731 = _1729 & _1730;
    assign _3455 = _1731 ? _3454 : _3452;
    assign _148 = _3455;
    always @(posedge _316) begin
        if (_314)
            _876 <= _1823;
        else
            _876 <= _148;
    end
    assign _3461 = _876 ? _3426 : _1187;
    assign _3419 = _774 & _841;
    assign _3459 = _3419 ? _774 : _1823;
    assign _839 = ~ _805;
    assign _833 = g_bitpos + _488;
    assign _828 = ~ _627;
    assign g_tx_bit_0 = _818 & _826;
    assign _829 = g_tx_bit_0 & _828;
    assign _830 = _829 & g_data_left;
    assign _831 = _799 | _830;
    assign _834 = _831 ? _833 : g_bitpos;
    assign _836 = _834 == _458;
    assign _837 = ~ _836;
    assign _808 = _807 & _214;
    assign _838 = _808 & _837;
    assign _840 = _838 & _839;
    assign _804 = g_bitpos == _2470;
    assign _805 = _799 & _804;
    assign _841 = _805 | _840;
    assign _3403 = ~ _774;
    assign _3404 = _3403 & _841;
    assign _3457 = _3404 ? _1825 : _774;
    assign _3460 = _845 ? _3459 : _3457;
    assign _149 = _3460;
    always @(posedge _316) begin
        if (_314)
            _774 <= _1823;
        else
            _774 <= _149;
    end
    assign _844 = _774 | _841;
    assign _843 = ~ _741;
    assign _845 = _843 & _844;
    assign _3463 = _845 ? _3462 : _3461;
    assign _3471 = _741 ? _3470 : _3463;
    assign _150 = _3471;
    assign _151 = _150;
    assign _153 = host_tx_data;
    assign _3172 = _280 ? _151 : _153;
    always @(posedge _316) begin
        if (_314)
            _3186 <= _761;
        else
            if (_3185)
                _3186 <= _3172;
    end
    assign _3860 = _3171 + _1980;
    assign _3857 = ~ _1190;
    assign _1818 = ~ _1190;
    assign _809 = ~ _214;
    assign _3847 = ~ _212;
    assign _3848 = _214 & _3847;
    assign _3851 = _3848 ? _2051 : _2052;
    assign _3840 = ~ _826;
    assign _3841 = _818 & _3840;
    assign _3842 = _651 | _3841;
    assign _3843 = _3842 | _3832;
    assign _3845 = _3843 ? _2052 : _3839;
    assign _3826 = g_run + _488;
    assign _3823 = g_run + _488;
    assign _3819 = vdd == g_last;
    assign _3817 = g_run == _458;
    assign _3818 = ~ _3817;
    assign _3820 = _3818 & _3819;
    assign _3824 = _3820 ? _3823 : _488;
    assign _3815 = _192 == _2052;
    assign _3827 = _3815 ? _3826 : _3824;
    assign _3828 = _3827 == _156;
    assign _3809 = g_run + _488;
    assign _3805 = gnd == g_last;
    assign _3803 = g_run == _458;
    assign _3804 = ~ _3803;
    assign _3806 = _3804 & _3805;
    assign _3810 = _3806 ? _3809 : _488;
    assign _3801 = _192 == _2052;
    assign _3812 = _3801 ? _458 : _3810;
    assign _3813 = _3812 == _156;
    assign _3829 = _633 ? _3828 : _3813;
    assign _3830 = _622 & _3829;
    assign _3831 = ~ _3830;
    assign _3797 = g_left == _3042;
    assign _3795 = g_left == _3161;
    assign _3798 = _3019 ? _3797 : _3795;
    assign _3790 = g_cnt + _4530;
    assign _3791 = _3790 == _788;
    assign _3788 = g_cnt == _788;
    assign _3792 = _790 ? _3791 : _3788;
    assign _3786 = ~ _642;
    assign _3787 = _597 & _3786;
    assign _3793 = _3787 & _3792;
    assign _3799 = _3793 & _3798;
    assign _3832 = _3799 & _3831;
    assign _3834 = _3832 ? _1967 : _3785;
    assign _3836 = _642 ? _2689 : _3834;
    assign _3782 = _826 ? _3780 : _1967;
    assign _3778 = _526 & _524;
    assign _3780 = _3778 ? _2052 : g_mode;
    assign _3783 = _818 ? _3782 : _3780;
    assign _3499 = _826 ? _3498 : _3474;
    assign _3500 = _818 ? _3499 : _3474;
    assign _154 = _3500;
    always @(posedge _316) begin
        if (_314)
            _3474 <= _1823;
        else
            _3474 <= _154;
    end
    assign _3708 = ~ _3498;
    assign _3706 = ~ f_lane1_out;
    assign _3707 = _3498 ? f_lane1_out : _3706;
    always @* begin
        case (_208)
        0:
            _3709 <= _3498;
        1:
            _3709 <= _3707;
        2:
            _3709 <= _3708;
        default:
            _3709 <= _3498;
        endcase
    end
    assign _156 = host_lane1_stuff_len;
    assign _3690 = g_run + _488;
    assign _3691 = _633 ? _3690 : _458;
    assign _3686 = g_run + _488;
    assign _3682 = _633 == g_last;
    assign _3680 = g_run == _458;
    assign _3681 = ~ _3680;
    assign _3683 = _3681 & _3682;
    assign _3687 = _3683 ? _3686 : _488;
    assign _3678 = _192 == _2052;
    assign _3692 = _3678 ? _3691 : _3687;
    assign _3693 = _642 ? _3676 : _3692;
    assign _3672 = g_run + _488;
    assign _3673 = _3498 ? _3672 : _458;
    assign _3668 = g_run + _488;
    assign _3495 = _3487[7:7];
    assign _3494 = _3487[6:6];
    assign _3493 = _3487[5:5];
    assign _3492 = _3487[4:4];
    assign _3491 = _3487[3:3];
    assign _3490 = _3487[2:2];
    assign _3489 = _3487[1:1];
    assign _3485 = _3477[7:7];
    assign _3484 = _3477[6:6];
    assign _3483 = _3477[5:5];
    assign _3482 = _3477[4:4];
    assign _3481 = _3477[3:3];
    assign _3480 = _3477[2:2];
    assign _3479 = _3477[1:1];
    assign _3476 = _1190 ? _763 : _3373;
    assign _3413 = g_byte[7:1];
    assign _3414 = { _633,
                     _3413 };
    assign _3411 = g_byte[6:0];
    assign _3412 = { _3411,
                     _633 };
    assign _3415 = _159 ? _3414 : _3412;
    assign _3505 = _799 ? _3415 : _3504;
    assign _3506 = _790 ? _3505 : _3504;
    assign _3507 = _775 ? _3506 : _3504;
    assign _3508 = _642 ? _3504 : _3507;
    assign _3501 = g_data_left ? _3477 : g_byte;
    assign _3502 = _627 ? g_byte : _3501;
    assign _3503 = _826 ? _3502 : g_byte;
    assign _3504 = _818 ? _3503 : g_byte;
    assign _3509 = _597 ? _3508 : _3504;
    assign _157 = _3509;
    always @(posedge _316) begin
        if (_314)
            g_byte <= _761;
        else
            g_byte <= _157;
    end
    assign _1815 = g_bitpos == _458;
    assign _1812 = ~ _627;
    assign _1813 = _1812 & g_data_left;
    assign _1816 = _1813 & _1815;
    assign _3477 = _1816 ? _3476 : g_byte;
    assign _3478 = _3477[0:0];
    assign _3486 = { _3478,
                     _3479,
                     _3480,
                     _3481,
                     _3482,
                     _3483,
                     _3484,
                     _3485 };
    assign _159 = host_lane1_lsb_first;
    assign _3487 = _159 ? _3477 : _3486;
    assign _3488 = _3487[0:0];
    assign _3517 = g_bitpos + _488;
    assign _795 = g_cnt[5:0];
    assign _796 = _795 < _178;
    assign _797 = ~ _796;
    assign _791 = g_cnt[15:6];
    assign _793 = _791 == _2019;
    assign _794 = ~ _793;
    assign _798 = _794 | _797;
    assign _799 = _790 & _798;
    assign _3518 = _799 ? _3517 : _3515;
    assign _3519 = _790 ? _3518 : _3515;
    assign _3520 = _775 ? _3519 : _3515;
    assign _3521 = _642 ? _3515 : _3520;
    assign _3511 = g_bitpos + _488;
    assign _3512 = g_data_left ? _3511 : g_bitpos;
    assign _3513 = _627 ? g_bitpos : _3512;
    assign _3514 = _826 ? _3513 : g_bitpos;
    assign _3515 = _818 ? _3514 : g_bitpos;
    assign _3522 = _597 ? _3521 : _3515;
    assign _3524 = _499 ? _458 : _3522;
    assign _160 = _3524;
    always @(posedge _316) begin
        if (_314)
            g_bitpos <= _458;
        else
            g_bitpos <= _160;
    end
    always @* begin
        case (g_bitpos)
        0:
            _3496 <= _3488;
        1:
            _3496 <= _3489;
        2:
            _3496 <= _3490;
        3:
            _3496 <= _3491;
        4:
            _3496 <= _3492;
        5:
            _3496 <= _3493;
        6:
            _3496 <= _3494;
        default:
            _3496 <= _3495;
        endcase
    end
    assign _162 = host_lane1_crc_inv;
    assign _164 = host_lane1_init;
    assign _3577 = g_crc[30:0];
    assign _3579 = { _3577,
                     _1823 };
    assign _3570 = g_crc[31:31];
    assign _3571 = _633 ^ _3570;
    assign _3573 = _3571 ? _169 : _2095;
    assign _3567 = g_crc[30:0];
    assign _3569 = { _3567,
                     _1823 };
    assign _3574 = _3569 ^ _3573;
    assign _3563 = g_cnt[5:0];
    assign _3564 = _3563 < _180;
    assign _3565 = ~ _3564;
    assign _3558 = g_cnt[15:6];
    assign _3560 = _3558 == _2019;
    assign _3561 = ~ _3560;
    assign _3557 = ~ _182;
    assign _3562 = _3557 | _3561;
    assign _3566 = _3562 | _3565;
    assign _3575 = _3566 ? _3574 : _3556;
    assign _3576 = _790 ? _3575 : _3556;
    assign _166 = host_lane1_crc_width;
    assign _3534 = g_left - _3042;
    assign _3535 = _3019 ? _3534 : _3532;
    assign _3536 = _775 ? _3535 : _3532;
    assign _3537 = _642 ? _3532 : _3536;
    assign _3528 = g_left - _3042;
    assign _3529 = g_data_left ? g_left : _3528;
    assign _3530 = _627 ? g_left : _3529;
    assign _3531 = _826 ? _3530 : g_left;
    assign _3532 = _818 ? _3531 : g_left;
    assign _3538 = _597 ? _3537 : _3532;
    assign _3539 = _3526 ? _166 : _3538;
    assign _3541 = _499 ? _3161 : _3539;
    assign _167 = _3541;
    always @(posedge _316) begin
        if (_314)
            g_left <= _3161;
        else
            g_left <= _167;
    end
    assign _824 = g_left == _3161;
    assign _825 = ~ _824;
    assign _3017 = ~ g_data_left;
    assign _3016 = _597 & _775;
    assign _3018 = _3016 & _3017;
    assign _3019 = _3018 & _825;
    assign _3580 = _3019 ? _3579 : _3576;
    assign _3581 = _775 ? _3580 : _3556;
    assign _3582 = _642 ? _3556 : _3581;
    assign _169 = host_lane1_poly;
    assign _3548 = g_crc[31:31];
    assign _3549 = _3498 ^ _3548;
    assign _3551 = _3549 ? _169 : _2095;
    assign _3545 = g_crc[30:0];
    assign _3547 = { _3545,
                     _1823 };
    assign _3552 = _3547 ^ _3551;
    assign _3542 = g_crc[30:0];
    assign _3544 = { _3542,
                     _1823 };
    assign _3553 = g_data_left ? _3552 : _3544;
    assign _3554 = _627 ? g_crc : _3553;
    assign _3555 = _826 ? _3554 : g_crc;
    assign _3556 = _818 ? _3555 : g_crc;
    assign _3583 = _597 ? _3582 : _3556;
    assign _3584 = _499 ? _164 : _3583;
    assign _3586 = _497 ? _2095 : _3584;
    assign _170 = _3586;
    always @(posedge _316) begin
        if (_314)
            g_crc <= _2095;
        else
            g_crc <= _170;
    end
    assign _3023 = g_crc[31:31];
    assign _3024 = _3023 ^ _162;
    assign _3602 = _3601 ? _3599 : g_lim;
    assign _3603 = g_len_cap ? _3602 : g_lim;
    assign _171 = _3603;
    always @(posedge _316) begin
        if (_314)
            g_lim <= _761;
        else
            g_lim <= _171;
    end
    assign _787 = { _761,
                    g_lim };
    assign _173 = host_lane1_frame_bits;
    assign _2997 = g_sr[14:0];
    assign _2998 = { _2997,
                     _633 };
    assign _3604 = _775 ? _2998 : g_sr;
    assign _3605 = _642 ? g_sr : _3604;
    assign _3606 = _597 ? _3605 : g_sr;
    assign _3608 = _499 ? _1689 : _3606;
    assign _174 = _3608;
    always @(posedge _316) begin
        if (_314)
            g_sr <= _1689;
        else
            g_sr <= _174;
    end
    assign _3594 = g_sr[3:0];
    assign _176 = host_lane1_len_max;
    assign _3595 = _176 < _3594;
    assign _3596 = _3595 ? _176 : _3594;
    assign _3598 = { _1823,
                     _3596,
                     _458 };
    assign _178 = host_lane1_skip;
    assign _3592 = { _2689,
                     _178 };
    assign _3599 = _3592 + _3598;
    assign _3600 = { _761,
                     _3599 };
    assign _3601 = _3600 < _173;
    assign _3629 = _3601 ? _1825 : g_len_known;
    assign _180 = host_lane1_len_pos;
    assign _3615 = g_cnt[5:0];
    assign _3616 = _3615 == _180;
    assign _3611 = g_cnt[15:6];
    assign _3613 = _3611 == _2019;
    assign _182 = host_lane1_crc_resid;
    assign _3609 = ~ _182;
    assign _184 = host_lane1_len_en;
    assign _3610 = _184 & _3609;
    assign _3614 = _3610 & _3613;
    assign _3617 = _3614 & _3616;
    assign _3619 = _3617 ? _1825 : g_len_cap;
    assign _3620 = _790 ? _3619 : g_len_cap;
    assign _3621 = _775 ? _3620 : g_len_cap;
    assign _3622 = _642 ? g_len_cap : _3621;
    assign _3623 = _597 ? _3622 : g_len_cap;
    assign _3625 = g_len_cap ? _1823 : _3623;
    assign _3627 = _499 ? _1823 : _3625;
    assign _185 = _3627;
    always @(posedge _316) begin
        if (_314)
            g_len_cap <= _1823;
        else
            g_len_cap <= _185;
    end
    assign _3630 = g_len_cap ? _3629 : g_len_known;
    assign _3632 = _499 ? _1823 : _3630;
    assign _186 = _3632;
    always @(posedge _316) begin
        if (_314)
            g_len_known <= _1823;
        else
            g_len_known <= _186;
    end
    assign _788 = g_len_known ? _787 : _173;
    assign _3652 = g_cnt + _4530;
    assign _776 = _597 & _775;
    assign _790 = _776 & g_data_left;
    assign _3653 = _790 ? _3652 : _3650;
    assign _775 = ~ _627;
    assign _3654 = _775 ? _3653 : _3650;
    assign _3635 = _642 ? _3634 : _633;
    assign _3633 = _826 ? _3498 : g_last;
    assign _3634 = _818 ? _3633 : g_last;
    assign _3636 = _597 ? _3635 : _3634;
    assign _3638 = _499 ? _1825 : _3636;
    assign _187 = _3638;
    always @(posedge _316) begin
        if (_314)
            g_last <= vdd;
        else
            g_last <= _187;
    end
    assign _638 = ~ g_last;
    assign _635 = _192 == _2051;
    assign _639 = _635 ? _638 : gnd;
    assign _3640 = _208 == _2051;
    assign _3641 = _3640 ? _517 : g_prev;
    assign _3642 = _597 ? _3641 : g_prev;
    assign _3644 = _499 ? _1825 : _3642;
    assign _188 = _3644;
    always @(posedge _316) begin
        if (_314)
            g_prev <= vdd;
        else
            g_prev <= _188;
    end
    assign _632 = _517 == g_prev;
    assign _629 = _208 == _2051;
    assign _633 = _629 ? _632 : _517;
    assign _640 = _633 == _639;
    assign _641 = ~ _640;
    assign _642 = _627 & _641;
    assign _3655 = _642 ? _3650 : _3654;
    assign _3646 = g_cnt + _4530;
    assign _3647 = g_data_left ? _3646 : g_cnt;
    assign _3648 = _627 ? g_cnt : _3647;
    assign _3649 = _826 ? _3648 : g_cnt;
    assign _3650 = _818 ? _3649 : g_cnt;
    assign _3656 = _597 ? _3655 : _3650;
    assign _3658 = _499 ? _1689 : _3656;
    assign _189 = _3658;
    always @(posedge _316) begin
        if (_314)
            g_cnt <= _1689;
        else
            g_cnt <= _189;
    end
    assign g_data_left = g_cnt < _788;
    assign _3497 = g_data_left ? _3496 : _3024;
    assign _3498 = _627 ? _639 : _3497;
    assign _3664 = _3498 == g_last;
    assign _3662 = g_run == _458;
    assign _3663 = ~ _3662;
    assign _3665 = _3663 & _3664;
    assign _3669 = _3665 ? _3668 : _488;
    assign _3660 = _192 == _2052;
    assign _3674 = _3660 ? _3673 : _3669;
    assign _3675 = _826 ? _3674 : g_run;
    assign _3676 = _818 ? _3675 : g_run;
    assign _3694 = _597 ? _3693 : _3676;
    assign _3696 = _499 ? _458 : _3694;
    assign _190 = _3696;
    always @(posedge _316) begin
        if (_314)
            g_run <= _458;
        else
            g_run <= _190;
    end
    assign _626 = g_run == _156;
    assign _192 = host_lane1_stuff;
    assign _621 = _192 == _2689;
    assign _622 = ~ _621;
    assign _627 = _622 & _626;
    assign _819 = _627 | g_data_left;
    assign _826 = _819 | _825;
    assign _3710 = _826 ? _3709 : _1825;
    assign _3711 = _818 ? _3710 : f_lane1_out;
    assign _814 = _570 == _1689;
    assign _812 = _535 == _1689;
    assign _815 = _563 ? _814 : _812;
    assign _816 = _531 ? vdd : _815;
    assign _817 = _212 ? _595 : _816;
    assign _3703 = ~ _817;
    assign _3700 = _208 == _2052;
    assign _3697 = ~ _214;
    assign _3698 = _504 & _3697;
    assign _3701 = _3698 & _3700;
    assign _3702 = _3701 & _596;
    assign _3704 = _3702 & _3703;
    assign _3712 = _3704 ? _3474 : _3711;
    assign _3714 = _612 ? _1825 : _3712;
    assign _3716 = _807 ? _1825 : _3714;
    assign _3718 = _499 ? _1825 : _3716;
    assign _3720 = _497 ? _1825 : _3718;
    assign _193 = _3720;
    always @(posedge _316) begin
        if (_314)
            f_lane1_out <= vdd;
        else
            f_lane1_out <= _193;
    end
    assign _610 = _517 == f_lane1_out;
    assign _611 = ~ _610;
    assign _604 = _208 == _2052;
    assign _605 = ~ _604;
    assign _601 = ~ _212;
    assign _195 = host_lane1_readback;
    assign _598 = ~ _214;
    assign _599 = _504 & _598;
    assign _600 = _599 & _195;
    assign _602 = _600 & _601;
    assign _606 = _602 & _605;
    assign _607 = _606 & _596;
    assign _612 = _607 & _611;
    assign _3785 = _612 ? _2689 : _3783;
    assign _593 = ~ _587;
    assign _594 = _590 & _593;
    always @(posedge _316) begin
        if (_314)
            _590 <= _1823;
        else
            _590 <= _587;
    end
    assign _591 = ~ _590;
    assign _583 = _349[7:7];
    assign _582 = _349[6:6];
    assign _581 = _349[5:5];
    assign _580 = _349[4:4];
    assign _579 = _349[3:3];
    assign _578 = _349[2:2];
    assign _577 = _349[1:1];
    assign _576 = _349[0:0];
    assign _197 = host_lane1_clk_pin;
    always @* begin
        case (_197)
        0:
            _584 <= _576;
        1:
            _584 <= _577;
        2:
            _584 <= _578;
        3:
            _584 <= _579;
        4:
            _584 <= _580;
        5:
            _584 <= _581;
        6:
            _584 <= _582;
        default:
            _584 <= _583;
        endcase
    end
    always @(posedge _316) begin
        if (_314)
            _587 <= _1823;
        else
            _587 <= _584;
    end
    assign _592 = _587 & _591;
    assign _199 = host_lane1_clk_edge;
    assign _595 = _199 ? _594 : _592;
    assign _574 = _559 == _1689;
    assign _571 = _570 == _559;
    assign _564 = _535 == _559;
    assign _562 = ~ _526;
    assign _553 = _201[15:2];
    assign _554 = { _2689,
                    _553 };
    assign _550 = _201[15:1];
    assign _551 = { _1823,
                    _550 };
    assign _555 = _551 + _554;
    assign _547 = _201[15:1];
    assign _548 = { _1823,
                    _547 };
    assign _545 = _214 & _528;
    assign _556 = _545 ? _555 : _548;
    always @(posedge _316) begin
        if (_314)
            _559 <= _1689;
        else
            _559 <= _556;
    end
    assign _560 = _535 < _559;
    assign _537 = _201[15:2];
    assign _538 = { _2689,
                    _537 };
    always @(posedge _316) begin
        if (_314)
            _541 <= _1689;
        else
            _541 <= _538;
    end
    assign _3766 = ~ _526;
    assign _3767 = _561 & _3766;
    assign _3768 = _3767 ? _570 : _535;
    assign _3770 = _531 ? _1689 : _3768;
    assign _3772 = _3770 + _4530;
    assign _3750 = _3744 == _1646;
    assign _566 = _201[15:1];
    assign _567 = { _1823,
                    _566 };
    always @(posedge _316) begin
        if (_314)
            _570 <= _1689;
        else
            _570 <= _567;
    end
    assign _3746 = { gnd,
                     _570 };
    assign _3747 = _3746 == _3744;
    assign _3740 = { gnd,
                     _201 };
    always @(posedge _316) begin
        if (_314)
            _3743 <= _1646;
        else
            _3743 <= _3740;
    end
    assign _3735 = 17'b00000000000000001;
    assign _201 = host_lane1_div_int;
    assign _3734 = { gnd,
                     _201 };
    assign _3736 = _3734 - _3735;
    always @(posedge _316) begin
        if (_314)
            _3739 <= _1646;
        else
            _3739 <= _3736;
    end
    assign _203 = host_lane1_div_frac;
    assign _3754 = { gnd,
                     _203 };
    assign _3756 = _3755[7:0];
    assign _3757 = _3752 ? _3756 : _3728;
    assign _3758 = _3725 ? _3757 : _3728;
    assign _3760 = _499 ? _761 : _3758;
    assign _204 = _3760;
    always @(posedge _316) begin
        if (_314)
            _3728 <= _761;
        else
            _3728 <= _204;
    end
    assign _3753 = { gnd,
                     _3728 };
    assign _3755 = _3753 + _3754;
    assign _3761 = _3755[8:8];
    assign _3762 = _3752 ? _3761 : _3733;
    assign _3763 = _3725 ? _3762 : _3733;
    assign _3765 = _499 ? _1823 : _3763;
    assign _205 = _3765;
    always @(posedge _316) begin
        if (_314)
            _3733 <= _1823;
        else
            _3733 <= _205;
    end
    assign _3744 = _3733 ? _3743 : _3739;
    assign _3730 = { gnd,
                     _535 };
    assign _3745 = _3730 == _3744;
    assign _3748 = _563 ? _3747 : _3745;
    assign _3751 = _531 ? _3750 : _3748;
    assign _3729 = ~ _212;
    assign _3752 = _3729 & _3751;
    assign _3774 = _3752 ? _1689 : _3772;
    assign _3724 = ~ _212;
    assign _3722 = _526 & _524;
    assign _651 = g_mode == _1967;
    assign _3721 = _504 | _651;
    assign _3723 = _3721 | _3722;
    assign _3725 = _3723 & _3724;
    assign _3775 = _3725 ? _3774 : _535;
    assign _3777 = _499 ? _1689 : _3775;
    assign _206 = _3777;
    always @(posedge _316) begin
        if (_314)
            _535 <= _1689;
        else
            _535 <= _206;
    end
    assign _542 = _535 < _541;
    assign _543 = ~ _542;
    assign _532 = _524 & _528;
    assign _544 = _532 & _543;
    assign _561 = _544 & _560;
    assign _563 = _561 & _562;
    assign _572 = _563 ? _571 : _564;
    assign _208 = host_lane1_code;
    assign _528 = _208 == _2052;
    assign _529 = ~ _528;
    assign _526 = g_mode == _2051;
    assign _530 = _526 | _529;
    assign _523 = ~ _212;
    always @(posedge _316) begin
        if (_314)
            _520 <= _1823;
        else
            _520 <= _517;
    end
    assign _513 = _349[7:7];
    assign _512 = _349[6:6];
    assign _511 = _349[5:5];
    assign _510 = _349[4:4];
    assign _509 = _349[3:3];
    assign _508 = _349[2:2];
    assign _507 = _349[1:1];
    assign _506 = _349[0:0];
    assign _210 = host_lane1_data_pin;
    always @* begin
        case (_210)
        0:
            _514 <= _506;
        1:
            _514 <= _507;
        2:
            _514 <= _508;
        3:
            _514 <= _509;
        4:
            _514 <= _510;
        5:
            _514 <= _511;
        6:
            _514 <= _512;
        default:
            _514 <= _513;
        endcase
    end
    always @(posedge _316) begin
        if (_314)
            _517 <= _1823;
        else
            _517 <= _514;
    end
    assign _521 = _517 ^ _520;
    assign _522 = _214 & _521;
    assign _524 = _522 & _523;
    assign _531 = _524 & _530;
    assign _575 = _531 ? _574 : _572;
    assign _212 = host_lane1_clk_pin_en;
    assign _596 = _212 ? _595 : _575;
    assign _214 = host_lane1_dir;
    assign _505 = _504 & _214;
    assign _597 = _505 & _596;
    assign _3837 = _597 ? _3836 : _3785;
    assign _807 = _276 == _1869;
    assign _3839 = _807 ? _2689 : _3837;
    assign _3526 = _276 == _2470;
    assign _3846 = _3526 ? _3845 : _3839;
    assign _499 = _276 == _1870;
    assign _3852 = _499 ? _3851 : _3846;
    assign _496 = _276 == _461;
    assign _497 = _496 | _323;
    assign _3854 = _497 ? _2689 : _3852;
    assign _215 = _3854;
    always @(posedge _316) begin
        if (_314)
            g_mode <= _2689;
        else
            g_mode <= _215;
    end
    assign _504 = g_mode == _2052;
    assign _810 = _504 & _809;
    assign _818 = _810 & _817;
    assign _1817 = _818 & _1816;
    assign _1819 = _1817 & _1818;
    assign _1810 = ~ _1190;
    assign _1809 = _718 & _1808;
    assign _1811 = _1809 & _1810;
    assign _1820 = _1811 | _1819;
    assign _1801 = _1797 == _2052;
    assign _1799 = _1797 == _2051;
    assign _1802 = _1799 | _1801;
    assign _3855 = _1707 & _1802;
    assign _3856 = _3855 | _1820;
    assign _216 = _3856;
    assign _3858 = _216 & _3857;
    assign _3861 = _3858 ? _3860 : _3171;
    assign _217 = _3861;
    always @(posedge _316) begin
        if (_314)
            _3171 <= _1978;
        else
            _3171 <= _217;
    end
    always @* begin
        case (_3171)
        0:
            _3373 <= _3186;
        1:
            _3373 <= _3192;
        2:
            _3373 <= _3198;
        3:
            _3373 <= _3204;
        4:
            _3373 <= _3210;
        5:
            _3373 <= _3216;
        6:
            _3373 <= _3222;
        7:
            _3373 <= _3228;
        8:
            _3373 <= _3234;
        9:
            _3373 <= _3240;
        10:
            _3373 <= _3246;
        11:
            _3373 <= _3252;
        12:
            _3373 <= _3258;
        13:
            _3373 <= _3264;
        14:
            _3373 <= _3270;
        15:
            _3373 <= _3276;
        16:
            _3373 <= _3282;
        17:
            _3373 <= _3288;
        18:
            _3373 <= _3294;
        19:
            _3373 <= _3300;
        20:
            _3373 <= _3306;
        21:
            _3373 <= _3312;
        22:
            _3373 <= _3318;
        23:
            _3373 <= _3324;
        24:
            _3373 <= _3330;
        25:
            _3373 <= _3336;
        26:
            _3373 <= _3342;
        27:
            _3373 <= _3348;
        28:
            _3373 <= _3354;
        29:
            _3373 <= _3360;
        30:
            _3373 <= _3366;
        default:
            _3373 <= _3372;
        endcase
    end
    assign _3375 = _1190 ? _763 : _3373;
    assign _3466 = g_byte_0[7:1];
    assign _3467 = { _477,
                     _3466 };
    assign _3464 = g_byte_0[6:0];
    assign _3465 = { _3464,
                     _477 };
    assign _3468 = _220 ? _3467 : _3465;
    assign _3866 = _699 ? _3468 : _3865;
    assign _3867 = _690 ? _3866 : _3865;
    assign _3868 = _675 ? _3867 : _3865;
    assign _3869 = _487 ? _3865 : _3868;
    assign _3862 = g_data_left_0 ? _3376 : g_byte_0;
    assign _3863 = _471 ? g_byte_0 : _3862;
    assign _3864 = _726 ? _3863 : g_byte_0;
    assign _3865 = _718 ? _3864 : g_byte_0;
    assign _3870 = _441 ? _3869 : _3865;
    assign _218 = _3870;
    always @(posedge _316) begin
        if (_314)
            g_byte_0 <= _761;
        else
            g_byte_0 <= _218;
    end
    assign _1807 = g_bitpos_0 == _458;
    assign _1804 = ~ _471;
    assign _1805 = _1804 & g_data_left_0;
    assign _1808 = _1805 & _1807;
    assign _3376 = _1808 ? _3375 : g_byte_0;
    assign _3377 = _3376[0:0];
    assign _3385 = { _3377,
                     _3378,
                     _3379,
                     _3380,
                     _3381,
                     _3382,
                     _3383,
                     _3384 };
    assign _220 = host_lane0_lsb_first;
    assign _3386 = _220 ? _3376 : _3385;
    assign _3387 = _3386[0:0];
    assign _3878 = g_bitpos_0 + _488;
    assign _3879 = _699 ? _3878 : _3876;
    assign _3880 = _690 ? _3879 : _3876;
    assign _3881 = _675 ? _3880 : _3876;
    assign _3882 = _487 ? _3876 : _3881;
    assign _3872 = g_bitpos_0 + _488;
    assign _3873 = g_data_left_0 ? _3872 : g_bitpos_0;
    assign _3874 = _471 ? g_bitpos_0 : _3873;
    assign _3875 = _726 ? _3874 : g_bitpos_0;
    assign _3876 = _718 ? _3875 : g_bitpos_0;
    assign _3883 = _441 ? _3882 : _3876;
    assign _3885 = _339 ? _458 : _3883;
    assign _221 = _3885;
    always @(posedge _316) begin
        if (_314)
            g_bitpos_0 <= _458;
        else
            g_bitpos_0 <= _221;
    end
    always @* begin
        case (g_bitpos_0)
        0:
            _3395 <= _3387;
        1:
            _3395 <= _3388;
        2:
            _3395 <= _3389;
        3:
            _3395 <= _3390;
        4:
            _3395 <= _3391;
        5:
            _3395 <= _3392;
        6:
            _3395 <= _3393;
        default:
            _3395 <= _3394;
        endcase
    end
    assign _223 = host_lane0_crc_inv;
    assign _225 = host_lane0_init;
    assign _3938 = g_crc_0[30:0];
    assign _3940 = { _3938,
                     _1823 };
    assign _3931 = g_crc_0[31:31];
    assign _3932 = _477 ^ _3931;
    assign _3934 = _3932 ? _230 : _2095;
    assign _3928 = g_crc_0[30:0];
    assign _3930 = { _3928,
                     _1823 };
    assign _3935 = _3930 ^ _3934;
    assign _3924 = g_cnt_0[5:0];
    assign _3925 = _3924 < _241;
    assign _3926 = ~ _3925;
    assign _3919 = g_cnt_0[15:6];
    assign _3921 = _3919 == _2019;
    assign _3922 = ~ _3921;
    assign _3918 = ~ _243;
    assign _3923 = _3918 | _3922;
    assign _3927 = _3923 | _3926;
    assign _3936 = _3927 ? _3935 : _3917;
    assign _3937 = _690 ? _3936 : _3917;
    assign _227 = host_lane0_crc_width;
    assign _3895 = g_left_0 - _3042;
    assign _3896 = _3095 ? _3895 : _3893;
    assign _3897 = _675 ? _3896 : _3893;
    assign _3898 = _487 ? _3893 : _3897;
    assign _3889 = g_left_0 - _3042;
    assign _3890 = g_data_left_0 ? g_left_0 : _3889;
    assign _3891 = _471 ? g_left_0 : _3890;
    assign _3892 = _726 ? _3891 : g_left_0;
    assign _3893 = _718 ? _3892 : g_left_0;
    assign _3899 = _441 ? _3898 : _3893;
    assign _3900 = _3887 ? _227 : _3899;
    assign _3902 = _339 ? _3161 : _3900;
    assign _228 = _3902;
    always @(posedge _316) begin
        if (_314)
            g_left_0 <= _3161;
        else
            g_left_0 <= _228;
    end
    assign _724 = g_left_0 == _3161;
    assign _725 = ~ _724;
    assign _3093 = ~ g_data_left_0;
    assign _3092 = _441 & _675;
    assign _3094 = _3092 & _3093;
    assign _3095 = _3094 & _725;
    assign _3941 = _3095 ? _3940 : _3937;
    assign _3942 = _675 ? _3941 : _3917;
    assign _3943 = _487 ? _3917 : _3942;
    assign _230 = host_lane0_poly;
    assign _3909 = g_crc_0[31:31];
    assign _3910 = _3397 ^ _3909;
    assign _3912 = _3910 ? _230 : _2095;
    assign _3906 = g_crc_0[30:0];
    assign _3908 = { _3906,
                     _1823 };
    assign _3913 = _3908 ^ _3912;
    assign _3903 = g_crc_0[30:0];
    assign _3905 = { _3903,
                     _1823 };
    assign _3914 = g_data_left_0 ? _3913 : _3905;
    assign _3915 = _471 ? g_crc_0 : _3914;
    assign _3916 = _726 ? _3915 : g_crc_0;
    assign _3917 = _718 ? _3916 : g_crc_0;
    assign _3944 = _441 ? _3943 : _3917;
    assign _3945 = _339 ? _225 : _3944;
    assign _3947 = _337 ? _2095 : _3945;
    assign _231 = _3947;
    always @(posedge _316) begin
        if (_314)
            g_crc_0 <= _2095;
        else
            g_crc_0 <= _231;
    end
    assign _3099 = g_crc_0[31:31];
    assign _3100 = _3099 ^ _223;
    assign _3963 = _3962 ? _3960 : g_lim_0;
    assign _3964 = g_len_cap_0 ? _3963 : g_lim_0;
    assign _232 = _3964;
    always @(posedge _316) begin
        if (_314)
            g_lim_0 <= _761;
        else
            g_lim_0 <= _232;
    end
    assign _687 = { _761,
                    g_lim_0 };
    assign _234 = host_lane0_frame_bits;
    assign _3073 = g_sr_0[14:0];
    assign _3074 = { _3073,
                     _477 };
    assign _3965 = _675 ? _3074 : g_sr_0;
    assign _3966 = _487 ? g_sr_0 : _3965;
    assign _3967 = _441 ? _3966 : g_sr_0;
    assign _3969 = _339 ? _1689 : _3967;
    assign _235 = _3969;
    always @(posedge _316) begin
        if (_314)
            g_sr_0 <= _1689;
        else
            g_sr_0 <= _235;
    end
    assign _3955 = g_sr_0[3:0];
    assign _237 = host_lane0_len_max;
    assign _3956 = _237 < _3955;
    assign _3957 = _3956 ? _237 : _3955;
    assign _3959 = { _1823,
                     _3957,
                     _458 };
    assign _239 = host_lane0_skip;
    assign _3953 = { _2689,
                     _239 };
    assign _3960 = _3953 + _3959;
    assign _3961 = { _761,
                     _3960 };
    assign _3962 = _3961 < _234;
    assign _3990 = _3962 ? _1825 : g_len_known_0;
    assign _241 = host_lane0_len_pos;
    assign _3976 = g_cnt_0[5:0];
    assign _3977 = _3976 == _241;
    assign _3972 = g_cnt_0[15:6];
    assign _3974 = _3972 == _2019;
    assign _243 = host_lane0_crc_resid;
    assign _3970 = ~ _243;
    assign _245 = host_lane0_len_en;
    assign _3971 = _245 & _3970;
    assign _3975 = _3971 & _3974;
    assign _3978 = _3975 & _3977;
    assign _3980 = _3978 ? _1825 : g_len_cap_0;
    assign _3981 = _690 ? _3980 : g_len_cap_0;
    assign _3982 = _675 ? _3981 : g_len_cap_0;
    assign _3983 = _487 ? g_len_cap_0 : _3982;
    assign _3984 = _441 ? _3983 : g_len_cap_0;
    assign _3986 = g_len_cap_0 ? _1823 : _3984;
    assign _3988 = _339 ? _1823 : _3986;
    assign _246 = _3988;
    always @(posedge _316) begin
        if (_314)
            g_len_cap_0 <= _1823;
        else
            g_len_cap_0 <= _246;
    end
    assign _3991 = g_len_cap_0 ? _3990 : g_len_known_0;
    assign _3993 = _339 ? _1823 : _3991;
    assign _247 = _3993;
    always @(posedge _316) begin
        if (_314)
            g_len_known_0 <= _1823;
        else
            g_len_known_0 <= _247;
    end
    assign _688 = g_len_known_0 ? _687 : _234;
    assign _4013 = g_cnt_0 + _4530;
    assign _4014 = _690 ? _4013 : _4011;
    assign _675 = ~ _471;
    assign _4015 = _675 ? _4014 : _4011;
    assign _3996 = _487 ? _3995 : _477;
    assign _3994 = _726 ? _3397 : g_last_0;
    assign _3995 = _718 ? _3994 : g_last_0;
    assign _3997 = _441 ? _3996 : _3995;
    assign _3999 = _339 ? _1825 : _3997;
    assign _248 = _3999;
    always @(posedge _316) begin
        if (_314)
            g_last_0 <= vdd;
        else
            g_last_0 <= _248;
    end
    assign _483 = ~ g_last_0;
    assign _479 = _253 == _2051;
    assign _484 = _479 ? _483 : gnd;
    assign _4001 = _269 == _2051;
    assign _4002 = _4001 ? _361 : g_prev_0;
    assign _4003 = _441 ? _4002 : g_prev_0;
    assign _4005 = _339 ? _1825 : _4003;
    assign _249 = _4005;
    always @(posedge _316) begin
        if (_314)
            g_prev_0 <= vdd;
        else
            g_prev_0 <= _249;
    end
    assign _476 = _361 == g_prev_0;
    assign _473 = _269 == _2051;
    assign _477 = _473 ? _476 : _361;
    assign _485 = _477 == _484;
    assign _486 = ~ _485;
    assign _487 = _471 & _486;
    assign _4016 = _487 ? _4011 : _4015;
    assign _4007 = g_cnt_0 + _4530;
    assign _4008 = g_data_left_0 ? _4007 : g_cnt_0;
    assign _4009 = _471 ? g_cnt_0 : _4008;
    assign _4010 = _726 ? _4009 : g_cnt_0;
    assign _4011 = _718 ? _4010 : g_cnt_0;
    assign _4017 = _441 ? _4016 : _4011;
    assign _4019 = _339 ? _1689 : _4017;
    assign _250 = _4019;
    always @(posedge _316) begin
        if (_314)
            g_cnt_0 <= _1689;
        else
            g_cnt_0 <= _250;
    end
    assign g_data_left_0 = g_cnt_0 < _688;
    assign _3396 = g_data_left_0 ? _3395 : _3100;
    assign _3397 = _471 ? _484 : _3396;
    assign _4025 = _3397 == g_last_0;
    assign _4023 = g_run_0 == _458;
    assign _4024 = ~ _4023;
    assign _4026 = _4024 & _4025;
    assign _4030 = _4026 ? _4029 : _488;
    assign _4021 = _253 == _2052;
    assign _4035 = _4021 ? _4034 : _4030;
    assign _4036 = _726 ? _4035 : g_run_0;
    assign _4037 = _718 ? _4036 : g_run_0;
    assign _4055 = _441 ? _4054 : _4037;
    assign _4057 = _339 ? _458 : _4055;
    assign _251 = _4057;
    always @(posedge _316) begin
        if (_314)
            g_run_0 <= _458;
        else
            g_run_0 <= _251;
    end
    assign _470 = g_run_0 == _143;
    assign _253 = host_lane0_stuff;
    assign _465 = _253 == _2689;
    assign _466 = ~ _465;
    assign _471 = _466 & _470;
    assign _719 = _471 | g_data_left_0;
    assign _726 = _719 | _725;
    assign _4071 = _726 ? _4070 : _1825;
    assign _709 = ~ _275;
    assign _710 = _345 & _709;
    assign _718 = _710 & _717;
    assign _4072 = _718 ? _4071 : f_lane0_out;
    assign _714 = _414 == _1689;
    assign _712 = _379 == _1689;
    assign _715 = _407 ? _714 : _712;
    assign _716 = _375 ? vdd : _715;
    assign _717 = _271 ? _439 : _716;
    assign _4064 = ~ _717;
    assign _4061 = _269 == _2052;
    assign _4058 = ~ _275;
    assign _4059 = _345 & _4058;
    assign _4062 = _4059 & _4061;
    assign _4063 = _4062 & _440;
    assign _4065 = _4063 & _4064;
    assign _4073 = _4065 ? _3165 : _4072;
    assign _4075 = _456 ? _1825 : _4073;
    assign _4077 = _707 ? _1825 : _4075;
    assign _4079 = _339 ? _1825 : _4077;
    assign _4081 = _337 ? _1825 : _4079;
    assign _254 = _4081;
    always @(posedge _316) begin
        if (_314)
            f_lane0_out <= vdd;
        else
            f_lane0_out <= _254;
    end
    assign _454 = _361 == f_lane0_out;
    assign _455 = ~ _454;
    assign _437 = ~ _431;
    assign _438 = _434 & _437;
    always @(posedge _316) begin
        if (_314)
            _434 <= _1823;
        else
            _434 <= _431;
    end
    assign _435 = ~ _434;
    assign _427 = _349[7:7];
    assign _426 = _349[6:6];
    assign _425 = _349[5:5];
    assign _424 = _349[4:4];
    assign _423 = _349[3:3];
    assign _422 = _349[2:2];
    assign _421 = _349[1:1];
    assign _420 = _349[0:0];
    assign _256 = host_lane0_clk_pin;
    always @* begin
        case (_256)
        0:
            _428 <= _420;
        1:
            _428 <= _421;
        2:
            _428 <= _422;
        3:
            _428 <= _423;
        4:
            _428 <= _424;
        5:
            _428 <= _425;
        6:
            _428 <= _426;
        default:
            _428 <= _427;
        endcase
    end
    always @(posedge _316) begin
        if (_314)
            _431 <= _1823;
        else
            _431 <= _428;
    end
    assign _436 = _431 & _435;
    assign _258 = host_lane0_clk_edge;
    assign _439 = _258 ? _438 : _436;
    assign _418 = _403 == _1689;
    assign _415 = _414 == _403;
    assign _408 = _379 == _403;
    assign _406 = ~ _370;
    assign _397 = _260[15:2];
    assign _398 = { _2689,
                    _397 };
    assign _394 = _260[15:1];
    assign _395 = { _1823,
                    _394 };
    assign _399 = _395 + _398;
    assign _391 = _260[15:1];
    assign _392 = { _1823,
                    _391 };
    assign _389 = _275 & _372;
    assign _400 = _389 ? _399 : _392;
    always @(posedge _316) begin
        if (_314)
            _403 <= _1689;
        else
            _403 <= _400;
    end
    assign _404 = _379 < _403;
    assign _381 = _260[15:2];
    assign _382 = { _2689,
                    _381 };
    always @(posedge _316) begin
        if (_314)
            _385 <= _1689;
        else
            _385 <= _382;
    end
    assign _4127 = ~ _370;
    assign _4128 = _405 & _4127;
    assign _4129 = _4128 ? _414 : _379;
    assign _4131 = _375 ? _1689 : _4129;
    assign _4133 = _4131 + _4530;
    assign _4111 = _4105 == _1646;
    assign _410 = _260[15:1];
    assign _411 = { _1823,
                    _410 };
    always @(posedge _316) begin
        if (_314)
            _414 <= _1689;
        else
            _414 <= _411;
    end
    assign _4107 = { gnd,
                     _414 };
    assign _4108 = _4107 == _4105;
    assign _4101 = { gnd,
                     _260 };
    always @(posedge _316) begin
        if (_314)
            _4104 <= _1646;
        else
            _4104 <= _4101;
    end
    assign _260 = host_lane0_div_int;
    assign _4095 = { gnd,
                     _260 };
    assign _4097 = _4095 - _3735;
    always @(posedge _316) begin
        if (_314)
            _4100 <= _1646;
        else
            _4100 <= _4097;
    end
    assign _262 = host_lane0_div_frac;
    assign _4115 = { gnd,
                     _262 };
    assign _4117 = _4116[7:0];
    assign _4118 = _4113 ? _4117 : _4089;
    assign _4119 = _4086 ? _4118 : _4089;
    assign _4121 = _339 ? _761 : _4119;
    assign _263 = _4121;
    always @(posedge _316) begin
        if (_314)
            _4089 <= _761;
        else
            _4089 <= _263;
    end
    assign _4114 = { gnd,
                     _4089 };
    assign _4116 = _4114 + _4115;
    assign _4122 = _4116[8:8];
    assign _4123 = _4113 ? _4122 : _4094;
    assign _4124 = _4086 ? _4123 : _4094;
    assign _4126 = _339 ? _1823 : _4124;
    assign _264 = _4126;
    always @(posedge _316) begin
        if (_314)
            _4094 <= _1823;
        else
            _4094 <= _264;
    end
    assign _4105 = _4094 ? _4104 : _4100;
    assign _4091 = { gnd,
                     _379 };
    assign _4106 = _4091 == _4105;
    assign _4109 = _407 ? _4108 : _4106;
    assign _4112 = _375 ? _4111 : _4109;
    assign _4090 = ~ _271;
    assign _4113 = _4090 & _4112;
    assign _4135 = _4113 ? _1689 : _4133;
    assign _4085 = ~ _271;
    assign _4083 = _370 & _368;
    assign _663 = g_mode_0 == _1967;
    assign _4082 = _345 | _663;
    assign _4084 = _4082 | _4083;
    assign _4086 = _4084 & _4085;
    assign _4136 = _4086 ? _4135 : _379;
    assign _4138 = _339 ? _1689 : _4136;
    assign _265 = _4138;
    always @(posedge _316) begin
        if (_314)
            _379 <= _1689;
        else
            _379 <= _265;
    end
    assign _386 = _379 < _385;
    assign _387 = ~ _386;
    assign _376 = _368 & _372;
    assign _388 = _376 & _387;
    assign _405 = _388 & _404;
    assign _407 = _405 & _406;
    assign _416 = _407 ? _415 : _408;
    assign _372 = _269 == _2052;
    assign _373 = ~ _372;
    assign _370 = g_mode_0 == _2051;
    assign _374 = _370 | _373;
    assign _367 = ~ _271;
    always @(posedge _316) begin
        if (_314)
            _364 <= _1823;
        else
            _364 <= _361;
    end
    assign _357 = _349[7:7];
    assign _356 = _349[6:6];
    assign _355 = _349[5:5];
    assign _354 = _349[4:4];
    assign _353 = _349[3:3];
    assign _352 = _349[2:2];
    assign _351 = _349[1:1];
    assign _350 = _349[0:0];
    assign _267 = host_lane0_data_pin;
    always @* begin
        case (_267)
        0:
            _358 <= _350;
        1:
            _358 <= _351;
        2:
            _358 <= _352;
        3:
            _358 <= _353;
        4:
            _358 <= _354;
        5:
            _358 <= _355;
        6:
            _358 <= _356;
        default:
            _358 <= _357;
        endcase
    end
    always @(posedge _316) begin
        if (_314)
            _361 <= _1823;
        else
            _361 <= _358;
    end
    assign _365 = _361 ^ _364;
    assign _366 = _275 & _365;
    assign _368 = _366 & _367;
    assign _375 = _368 & _374;
    assign _419 = _375 ? _418 : _416;
    assign _440 = _271 ? _439 : _419;
    assign _269 = host_lane0_code;
    assign _448 = _269 == _2052;
    assign _449 = ~ _448;
    assign _271 = host_lane0_clk_pin_en;
    assign _445 = ~ _271;
    assign _273 = host_lane0_readback;
    assign _275 = host_lane0_dir;
    assign _442 = ~ _275;
    assign _443 = _345 & _442;
    assign _444 = _443 & _273;
    assign _446 = _444 & _445;
    assign _450 = _446 & _449;
    assign _451 = _450 & _440;
    assign _456 = _451 & _455;
    assign _4150 = _456 ? _2689 : _4148;
    assign _4202 = _441 ? _4201 : _4150;
    assign _707 = _276 == _460;
    assign _4204 = _707 ? _2689 : _4202;
    assign _3887 = _276 == _1873;
    assign _4211 = _3887 ? _4210 : _4204;
    assign _339 = _276 == _488;
    assign _4217 = _339 ? _4216 : _4211;
    assign _2739 = _1273[90:88];
    assign _2738 = _1267[90:88];
    assign _2737 = _1261[90:88];
    assign _2736 = _903[90:88];
    always @* begin
        case (f_winner)
        0:
            _2740 <= _2736;
        1:
            _2740 <= _2737;
        2:
            _2740 <= _2738;
        default:
            _2740 <= _2739;
        endcase
    end
    assign _2732 = _1273[87:87];
    assign _2731 = _1267[87:87];
    assign _2730 = _1261[87:87];
    assign _2729 = _903[87:87];
    always @* begin
        case (f_winner)
        0:
            _2733 <= _2729;
        1:
            _2733 <= _2730;
        2:
            _2733 <= _2731;
        default:
            _2733 <= _2732;
        endcase
    end
    assign _4139 = ~ _2733;
    assign _4140 = _1706 & _4139;
    assign _4142 = _4140 ? _2740 : _458;
    assign _276 = _4142;
    assign _336 = _276 == _461;
    assign _337 = _336 | _323;
    assign _4219 = _337 ? _2689 : _4217;
    assign _277 = _4219;
    always @(posedge _316) begin
        if (_314)
            g_mode_0 <= _2689;
        else
            g_mode_0 <= _277;
    end
    assign _345 = g_mode_0 == _2052;
    assign _346 = _345 & _275;
    assign _441 = _346 & _440;
    assign _676 = _441 & _675;
    assign _690 = _676 & g_data_left_0;
    assign _699 = _690 & _698;
    assign _705 = _699 & _704;
    assign _741 = _705 | _740;
    assign _3149 = _741 | _845;
    assign _279 = host_rx_to_tx;
    assign _3150 = _279 & _3149;
    assign _280 = _3150;
    assign _3177 = _280 | _3176;
    assign _3179 = _3177 & _3178;
    assign _4220 = _3179 ^ _3858;
    assign _4226 = _4220 ? _4225 : _281;
    always @(posedge _316) begin
        if (_314)
            _4229 <= _3161;
        else
            _4229 <= _4226;
    end
    assign _281 = _4229;
    assign _1190 = _281 == _3161;
    assign _4231 = _1190 ? _763 : _3373;
    assign _1796 = _1256[28:27];
    assign _1794 = _1273[95:94];
    assign _1793 = _1267[95:94];
    assign _1792 = _1261[95:94];
    assign _1791 = _903[95:94];
    always @* begin
        case (f_winner)
        0:
            _1795 <= _1791;
        1:
            _1795 <= _1792;
        2:
            _1795 <= _1793;
        default:
            _1795 <= _1794;
        endcase
    end
    assign _1797 = _887 ? _1796 : _1795;
    always @* begin
        case (_1797)
        0:
            _4243 <= _1183;
        1:
            _4243 <= _4231;
        2:
            _4243 <= _4240;
        default:
            _4243 <= _4242;
        endcase
    end
    assign _4244 = _1707 ? _4243 : _1183;
    assign _282 = _4244;
    always @(posedge _316) begin
        if (_314)
            _1183 <= _761;
        else
            _1183 <= _282;
    end
    assign _1184 = _1183[0:0];
    assign _4255 = 8'b00001000;
    assign _4254 = 8'b00000111;
    assign _4253 = _1178 - _767;
    assign _4250 = _1256[30:29];
    assign _4248 = _1273[99:98];
    assign _4247 = _1267[99:98];
    assign _4246 = _1261[99:98];
    assign _4245 = _903[99:98];
    always @* begin
        case (f_winner)
        0:
            _4249 <= _4245;
        1:
            _4249 <= _4246;
        2:
            _4249 <= _4247;
        default:
            _4249 <= _4248;
        endcase
    end
    assign _4251 = _887 ? _4250 : _4249;
    always @* begin
        case (_4251)
        0:
            _4256 <= _1178;
        1:
            _4256 <= _4253;
        2:
            _4256 <= _4254;
        default:
            _4256 <= _4255;
        endcase
    end
    assign _4257 = _1707 ? _4256 : _1178;
    assign _283 = _4257;
    always @(posedge _316) begin
        if (_314)
            _1178 <= _761;
        else
            _1178 <= _283;
    end
    assign _1180 = _1178 == _761;
    assign _1378 = _1261[61:58];
    always @* begin
        case (_1378)
        0:
            _1379 <= vdd;
        1:
            _1379 <= _1180;
        2:
            _1379 <= _1184;
        3:
            _1379 <= _1188;
        4:
            _1379 <= _1190;
        5:
            _1379 <= _743;
        6:
            _1379 <= _1194;
        7:
            _1379 <= _1197;
        8:
            _1379 <= _663;
        9:
            _1379 <= _666;
        10:
            _1379 <= _669;
        11:
            _1379 <= _672;
        12:
            _1379 <= _651;
        13:
            _1379 <= _654;
        14:
            _1379 <= _657;
        default:
            _1379 <= _660;
        endcase
    end
    assign _1381 = _1379 ^ _1380;
    assign _1373 = _1261[57:42];
    assign _1375 = _1373 == _2004;
    assign _1364 = _1310[57:42];
    assign _1365 = { gnd,
                     _1364 };
    assign _1366 = _1365 + _1353;
    always @(posedge _316) begin
        if (_314)
            _1369 <= _1646;
        else
            _1369 <= _1366;
    end
    assign _1370 = _1369 < _1309;
    assign _1371 = ~ _1370;
    assign _1360 = _1261[41:26];
    assign _1362 = _1360 == _1689;
    assign _1138 = _1134 + _488;
    assign _4272 = _1134 + _488;
    assign _4268 = _1134 == _2470;
    assign _4269 = ~ _4268;
    assign _4266 = _920[0:0];
    assign _4270 = _4266 & _4269;
    assign _4273 = _4270 ? _4272 : _1134;
    assign _4263 = _920[0:0];
    assign _4264 = ~ _4263;
    assign _4262 = f_chg_now[0:0];
    assign _4265 = _4262 & _4264;
    assign _4275 = _4265 ? _488 : _4273;
    assign _4259 = _879 == _2052;
    assign _4261 = _4259 ? _458 : _1134;
    assign _4258 = _879 == _2051;
    assign _4276 = _4258 ? _4275 : _4261;
    assign _284 = _4276;
    always @(posedge _316) begin
        if (_314)
            _1134 <= _458;
        else
            _1134 <= _284;
    end
    assign _1136 = _1134 == _2470;
    assign _1139 = _1136 ? _1134 : _1138;
    assign _1129 = _920[0:0];
    assign _1130 = ~ _1129;
    assign _1128 = f_chg_now[0:0];
    assign _1131 = _1128 & _1130;
    assign _1141 = _1131 ? _488 : _1139;
    assign _1125 = f_changed_all[0:0];
    assign _1126 = f_in_fetch & _1125;
    assign _1142 = _1126 ? _1141 : _458;
    assign _1344 = _1314[0:0];
    assign _1346 = _1344 ? _1142 : _458;
    assign _1117 = _1113 + _488;
    assign _4291 = _1113 + _488;
    assign _4287 = _1113 == _2470;
    assign _4288 = ~ _4287;
    assign _4285 = _920[1:1];
    assign _4289 = _4285 & _4288;
    assign _4292 = _4289 ? _4291 : _1113;
    assign _4282 = _920[1:1];
    assign _4283 = ~ _4282;
    assign _4281 = f_chg_now[1:1];
    assign _4284 = _4281 & _4283;
    assign _4294 = _4284 ? _488 : _4292;
    assign _4278 = _879 == _2052;
    assign _4280 = _4278 ? _458 : _1113;
    assign _4277 = _879 == _2051;
    assign _4295 = _4277 ? _4294 : _4280;
    assign _285 = _4295;
    always @(posedge _316) begin
        if (_314)
            _1113 <= _458;
        else
            _1113 <= _285;
    end
    assign _1115 = _1113 == _2470;
    assign _1118 = _1115 ? _1113 : _1117;
    assign _1108 = _920[1:1];
    assign _1109 = ~ _1108;
    assign _1107 = f_chg_now[1:1];
    assign _1110 = _1107 & _1109;
    assign _1120 = _1110 ? _488 : _1118;
    assign _1104 = f_changed_all[1:1];
    assign _1105 = f_in_fetch & _1104;
    assign _1121 = _1105 ? _1120 : _458;
    assign _1341 = _1314[1:1];
    assign _1343 = _1341 ? _1121 : _458;
    assign _1347 = _1343 < _1346;
    assign _1348 = _1347 ? _1346 : _1343;
    assign _1094 = _1090 + _488;
    assign _4310 = _1090 + _488;
    assign _4306 = _1090 == _2470;
    assign _4307 = ~ _4306;
    assign _4304 = _920[2:2];
    assign _4308 = _4304 & _4307;
    assign _4311 = _4308 ? _4310 : _1090;
    assign _4301 = _920[2:2];
    assign _4302 = ~ _4301;
    assign _4300 = f_chg_now[2:2];
    assign _4303 = _4300 & _4302;
    assign _4313 = _4303 ? _488 : _4311;
    assign _4297 = _879 == _2052;
    assign _4299 = _4297 ? _458 : _1090;
    assign _4296 = _879 == _2051;
    assign _4314 = _4296 ? _4313 : _4299;
    assign _286 = _4314;
    always @(posedge _316) begin
        if (_314)
            _1090 <= _458;
        else
            _1090 <= _286;
    end
    assign _1092 = _1090 == _2470;
    assign _1095 = _1092 ? _1090 : _1094;
    assign _1085 = _920[2:2];
    assign _1086 = ~ _1085;
    assign _1084 = f_chg_now[2:2];
    assign _1087 = _1084 & _1086;
    assign _1097 = _1087 ? _488 : _1095;
    assign _1081 = f_changed_all[2:2];
    assign _1082 = f_in_fetch & _1081;
    assign _1098 = _1082 ? _1097 : _458;
    assign _1336 = _1314[2:2];
    assign _1338 = _1336 ? _1098 : _458;
    assign _1073 = _1069 + _488;
    assign _4329 = _1069 + _488;
    assign _4325 = _1069 == _2470;
    assign _4326 = ~ _4325;
    assign _4323 = _920[3:3];
    assign _4327 = _4323 & _4326;
    assign _4330 = _4327 ? _4329 : _1069;
    assign _4320 = _920[3:3];
    assign _4321 = ~ _4320;
    assign _4319 = f_chg_now[3:3];
    assign _4322 = _4319 & _4321;
    assign _4332 = _4322 ? _488 : _4330;
    assign _4316 = _879 == _2052;
    assign _4318 = _4316 ? _458 : _1069;
    assign _4315 = _879 == _2051;
    assign _4333 = _4315 ? _4332 : _4318;
    assign _287 = _4333;
    always @(posedge _316) begin
        if (_314)
            _1069 <= _458;
        else
            _1069 <= _287;
    end
    assign _1071 = _1069 == _2470;
    assign _1074 = _1071 ? _1069 : _1073;
    assign _1064 = _920[3:3];
    assign _1065 = ~ _1064;
    assign _1063 = f_chg_now[3:3];
    assign _1066 = _1063 & _1065;
    assign _1076 = _1066 ? _488 : _1074;
    assign _1060 = f_changed_all[3:3];
    assign _1061 = f_in_fetch & _1060;
    assign _1077 = _1061 ? _1076 : _458;
    assign _1333 = _1314[3:3];
    assign _1335 = _1333 ? _1077 : _458;
    assign _1339 = _1335 < _1338;
    assign _1340 = _1339 ? _1338 : _1335;
    assign _1349 = _1340 < _1348;
    assign _1350 = _1349 ? _1348 : _1340;
    assign _1048 = _1044 + _488;
    assign _4348 = _1044 + _488;
    assign _4344 = _1044 == _2470;
    assign _4345 = ~ _4344;
    assign _4342 = _920[4:4];
    assign _4346 = _4342 & _4345;
    assign _4349 = _4346 ? _4348 : _1044;
    assign _4339 = _920[4:4];
    assign _4340 = ~ _4339;
    assign _4338 = f_chg_now[4:4];
    assign _4341 = _4338 & _4340;
    assign _4351 = _4341 ? _488 : _4349;
    assign _4335 = _879 == _2052;
    assign _4337 = _4335 ? _458 : _1044;
    assign _4334 = _879 == _2051;
    assign _4352 = _4334 ? _4351 : _4337;
    assign _288 = _4352;
    always @(posedge _316) begin
        if (_314)
            _1044 <= _458;
        else
            _1044 <= _288;
    end
    assign _1046 = _1044 == _2470;
    assign _1049 = _1046 ? _1044 : _1048;
    assign _1039 = _920[4:4];
    assign _1040 = ~ _1039;
    assign _1038 = f_chg_now[4:4];
    assign _1041 = _1038 & _1040;
    assign _1051 = _1041 ? _488 : _1049;
    assign _1035 = f_changed_all[4:4];
    assign _1036 = f_in_fetch & _1035;
    assign _1052 = _1036 ? _1051 : _458;
    assign _1326 = _1314[4:4];
    assign _1328 = _1326 ? _1052 : _458;
    assign _1027 = _1023 + _488;
    assign _4367 = _1023 + _488;
    assign _4363 = _1023 == _2470;
    assign _4364 = ~ _4363;
    assign _4361 = _920[5:5];
    assign _4365 = _4361 & _4364;
    assign _4368 = _4365 ? _4367 : _1023;
    assign _4358 = _920[5:5];
    assign _4359 = ~ _4358;
    assign _4357 = f_chg_now[5:5];
    assign _4360 = _4357 & _4359;
    assign _4370 = _4360 ? _488 : _4368;
    assign _4354 = _879 == _2052;
    assign _4356 = _4354 ? _458 : _1023;
    assign _4353 = _879 == _2051;
    assign _4371 = _4353 ? _4370 : _4356;
    assign _289 = _4371;
    always @(posedge _316) begin
        if (_314)
            _1023 <= _458;
        else
            _1023 <= _289;
    end
    assign _1025 = _1023 == _2470;
    assign _1028 = _1025 ? _1023 : _1027;
    assign _1018 = _920[5:5];
    assign _1019 = ~ _1018;
    assign _1017 = f_chg_now[5:5];
    assign _1020 = _1017 & _1019;
    assign _1030 = _1020 ? _488 : _1028;
    assign _1014 = f_changed_all[5:5];
    assign _1015 = f_in_fetch & _1014;
    assign _1031 = _1015 ? _1030 : _458;
    assign _1323 = _1314[5:5];
    assign _1325 = _1323 ? _1031 : _458;
    assign _1329 = _1325 < _1328;
    assign _1330 = _1329 ? _1328 : _1325;
    assign _1004 = _1000 + _488;
    assign _4386 = _1000 + _488;
    assign _4382 = _1000 == _2470;
    assign _4383 = ~ _4382;
    assign _4380 = _920[6:6];
    assign _4384 = _4380 & _4383;
    assign _4387 = _4384 ? _4386 : _1000;
    assign _4377 = _920[6:6];
    assign _4378 = ~ _4377;
    assign _4376 = f_chg_now[6:6];
    assign _4379 = _4376 & _4378;
    assign _4389 = _4379 ? _488 : _4387;
    assign _4373 = _879 == _2052;
    assign _4375 = _4373 ? _458 : _1000;
    assign _4372 = _879 == _2051;
    assign _4390 = _4372 ? _4389 : _4375;
    assign _290 = _4390;
    always @(posedge _316) begin
        if (_314)
            _1000 <= _458;
        else
            _1000 <= _290;
    end
    assign _1002 = _1000 == _2470;
    assign _1005 = _1002 ? _1000 : _1004;
    assign _995 = _920[6:6];
    assign _996 = ~ _995;
    assign _994 = f_chg_now[6:6];
    assign _997 = _994 & _996;
    assign _1007 = _997 ? _488 : _1005;
    assign _991 = f_changed_all[6:6];
    assign _992 = f_in_fetch & _991;
    assign _1008 = _992 ? _1007 : _458;
    assign _1318 = _1314[6:6];
    assign _1320 = _1318 ? _1008 : _458;
    assign _983 = _979 + _488;
    assign _4405 = _979 + _488;
    assign _4401 = _979 == _2470;
    assign _4402 = ~ _4401;
    assign _4399 = _920[7:7];
    assign _4403 = _4399 & _4402;
    assign _4406 = _4403 ? _4405 : _979;
    assign _4396 = _920[7:7];
    assign _4397 = ~ _4396;
    assign _4395 = f_chg_now[7:7];
    assign _4398 = _4395 & _4397;
    assign _4408 = _4398 ? _488 : _4406;
    assign _4392 = _879 == _2052;
    assign _4394 = _4392 ? _458 : _979;
    assign _4391 = _879 == _2051;
    assign _4409 = _4391 ? _4408 : _4394;
    assign _291 = _4409;
    always @(posedge _316) begin
        if (_314)
            _979 <= _458;
        else
            _979 <= _291;
    end
    assign _981 = _979 == _2470;
    assign _984 = _981 ? _979 : _983;
    assign _974 = _920[7:7];
    assign _975 = ~ _974;
    assign _973 = f_chg_now[7:7];
    assign _976 = _973 & _975;
    assign _986 = _976 ? _488 : _984;
    assign _970 = f_changed_all[7:7];
    assign _971 = f_in_fetch & _970;
    assign _987 = _971 ? _986 : _458;
    assign _1314 = _1310[23:16];
    assign _1315 = _1314[7:7];
    assign _1317 = _1315 ? _987 : _458;
    assign _1321 = _1317 < _1320;
    assign _1322 = _1321 ? _1320 : _1317;
    assign _1331 = _1322 < _1330;
    assign _1332 = _1331 ? _1330 : _1322;
    assign _1351 = _1332 < _1350;
    assign _1352 = _1351 ? _1350 : _1332;
    assign _1353 = { _1591,
                     _1352 };
    assign _4412 = _884 == _488;
    assign _4413 = _4412 ? _308 : _901;
    assign _4410 = _879 == _2051;
    assign _4414 = _4410 ? _4413 : _901;
    assign _292 = _4414;
    always @(posedge _316) begin
        if (_314)
            _901 <= _891;
        else
            _901 <= _292;
    end
    assign _959 = _884 == _488;
    assign _960 = f_in_fetch & _959;
    assign _961 = _960 ? _308 : _901;
    assign _4417 = _884 == _460;
    assign _4418 = _4417 ? _308 : _898;
    assign _4415 = _879 == _2051;
    assign _4419 = _4415 ? _4418 : _898;
    assign _293 = _4419;
    always @(posedge _316) begin
        if (_314)
            _898 <= _891;
        else
            _898 <= _293;
    end
    assign _955 = _884 == _460;
    assign _956 = f_in_fetch & _955;
    assign _957 = _956 ? _308 : _898;
    assign _4422 = _884 == _1873;
    assign _4423 = _4422 ? _308 : _895;
    assign _4420 = _879 == _2051;
    assign _4424 = _4420 ? _4423 : _895;
    assign _294 = _4424;
    always @(posedge _316) begin
        if (_314)
            _895 <= _891;
        else
            _895 <= _294;
    end
    assign _951 = _884 == _1873;
    assign _952 = f_in_fetch & _951;
    assign _953 = _952 ? _308 : _895;
    assign _4465 = _4452 | f_sweeping;
    assign _4459 = ~ f_sweeping;
    assign _296 = host_rec_we;
    assign _4458 = _296 & _1839;
    assign f_store_we = _4458 & _4459;
    assign _298 = host_rec_wdata;
    always @(posedge _316) begin
        if (f_store_we)
            _4461[_4457] <= _298;
    end
    assign _4455 = _884[1:0];
    assign _300 = host_start_loc;
    assign _1273 = _902[511:400];
    assign _4437 = _1273[110:105];
    assign _1267 = _902[399:288];
    assign _4436 = _1267[110:105];
    assign _4435 = _1261[110:105];
    assign _4434 = _903[110:105];
    always @* begin
        case (f_winner)
        0:
            _4438 <= _4434;
        1:
            _4438 <= _4435;
        2:
            _4438 <= _4436;
        default:
            _4438 <= _4437;
        endcase
    end
    assign _4439 = _4438 == _1770;
    assign _4440 = ~ _4439;
    assign _4441 = _4440 ? _4438 : _1770;
    assign _302 = host_recover_loc;
    assign _4428 = _1899 ? _302 : _4427;
    assign _303 = _4428;
    always @(posedge _316) begin
        if (_314)
            _4427 <= _3161;
        else
            _4427 <= _303;
    end
    assign f_policy = _1256[59:58];
    assign _4431 = f_policy == _2052;
    assign _4432 = _4431 ? _4427 : _1770;
    assign _4433 = f_viol_now ? _4432 : _1770;
    assign _4442 = _1706 ? _4441 : _4433;
    assign _4429 = _879 == _2052;
    assign _4443 = _4429 ? _4442 : _1770;
    assign _4444 = _1899 ? _300 : _4443;
    assign _304 = _4444;
    always @(posedge _316) begin
        if (_314)
            _1770 <= _3161;
        else
            _1770 <= _304;
    end
    assign _4456 = { _1770,
                     _4455 };
    assign _4448 = f_sw_cnt + _2861;
    assign _4446 = _2848 ? _2022 : f_sw_cnt;
    assign _4449 = f_sweeping ? _4448 : _4446;
    assign _305 = _4449;
    always @(posedge _316) begin
        if (_314)
            f_sw_cnt <= _2022;
        else
            f_sw_cnt <= _305;
    end
    assign _4453 = f_sw_cnt[11:4];
    assign _307 = host_rec_waddr;
    assign _4454 = f_sweeping ? _4453 : _307;
    assign _4451 = _884 < _461;
    assign _4452 = f_in_fetch & _4451;
    assign _4457 = _4452 ? _4456 : _4454;
    assign _4462 = _4461[_4457];
    always @(posedge _316) begin
        if (_4465)
            _4466 <= _4462;
    end
    assign _308 = _4466;
    assign _947 = _884 == _461;
    assign _948 = f_in_fetch & _947;
    assign _949 = _948 ? _308 : _892;
    assign _962 = { _949,
                    _953,
                    _957,
                    _961 };
    assign _1310 = _962[287:176];
    assign _1311 = _1310[41:26];
    assign _1312 = { gnd,
                     _1311 };
    assign _1354 = _1312 + _1353;
    always @(posedge _316) begin
        if (_314)
            _1357 <= _1646;
        else
            _1357 <= _1354;
    end
    assign gnd = 1'b0;
    assign _1309 = { gnd,
                     _1306 };
    assign _1358 = _1309 < _1357;
    assign _1359 = ~ _1358;
    assign _1363 = _1359 | _1362;
    assign _1372 = _1363 & _1371;
    assign _4494 = _941 + _4530;
    assign _4490 = _941 == _2004;
    assign _4491 = ~ _4490;
    assign _4492 = _4488 & _4491;
    assign _4495 = _4492 ? _4494 : _941;
    assign _4474 = _4473[2:2];
    assign _4475 = _1707 & _4474;
    assign _4497 = _4475 ? _1689 : _4495;
    assign _4499 = _1899 ? _1689 : _4497;
    assign _309 = _4499;
    always @(posedge _316) begin
        if (_314)
            _941 <= _1689;
        else
            _941 <= _309;
    end
    assign _4511 = _938 + _4530;
    assign _4507 = _938 == _2004;
    assign _4508 = ~ _4507;
    assign _4486 = 9'b111111111;
    assign _4487 = _4479 == _4486;
    assign _4484 = 6'b111111;
    assign _4483 = _4479[5:0];
    assign _4485 = _4483 == _4484;
    assign _4478 = 9'b000000000;
    assign _4500 = 9'b000000001;
    assign _4501 = _4479 + _4500;
    assign _4503 = _1899 ? _4478 : _4501;
    assign _310 = _4503;
    always @(posedge _316) begin
        if (_314)
            _4479 <= _4478;
        else
            _4479 <= _310;
    end
    assign _4480 = _4479[2:0];
    assign _4482 = _4480 == _2470;
    assign _4476 = _1256[63:62];
    always @* begin
        case (_4476)
        0:
            _4488 <= vdd;
        1:
            _4488 <= _4482;
        2:
            _4488 <= _4485;
        default:
            _4488 <= _4487;
        endcase
    end
    assign _4509 = _4488 & _4508;
    assign _4512 = _4509 ? _4511 : _938;
    assign _4504 = _4473[1:1];
    assign _4505 = _1707 & _4504;
    assign _4514 = _4505 ? _1689 : _4512;
    assign _4516 = _1899 ? _1689 : _4514;
    assign _311 = _4516;
    always @(posedge _316) begin
        if (_314)
            _938 <= _1689;
        else
            _938 <= _311;
    end
    assign _1305 = _1261[25:24];
    always @* begin
        case (_1305)
        0:
            _1306 <= _935;
        1:
            _1306 <= _938;
        2:
            _1306 <= _941;
        default:
            _1306 <= _941;
        endcase
    end
    assign _1308 = _1306 == _2004;
    assign _1376 = _1308 ? _1375 : _1372;
    always @(posedge _316) begin
        if (_314)
            _923 <= _761;
        else
            _923 <= _907;
    end
    assign f_chg_now = _907 ^ _923;
    assign _4518 = _879 == _2052;
    assign _4520 = _4518 ? _761 : _920;
    assign _4517 = _879 == _2051;
    assign _4521 = _4517 ? f_changed_all : _4520;
    assign _4523 = _1899 ? _761 : _4521;
    assign _312 = _4523;
    always @(posedge _316) begin
        if (_314)
            _920 <= _761;
        else
            _920 <= _312;
    end
    assign f_changed_all = _920 | f_chg_now;
    assign _1299 = f_changed_all & f_chgmask1;
    assign _1301 = _1299 == _761;
    assign _1302 = ~ _1301;
    assign f_chgmask1 = _1261[23:16];
    assign _1298 = f_chgmask1 == _761;
    assign _1303 = _1298 | _1302;
    assign _1292 = _1261[7:0];
    assign _1290 = _1261[15:8];
    assign vdd = 1'b1;
    assign _314 = clear;
    assign _316 = clock;
    assign _318 = pins_in;
    always @(posedge _316) begin
        if (_314)
            _349 <= _761;
        else
            _349 <= _318;
    end
    always @(posedge _316) begin
        if (_314)
            _907 <= _761;
        else
            _907 <= _349;
    end
    assign _1291 = _907 ^ _1290;
    assign _1293 = _1291 & _1292;
    assign _1295 = _1293 == _761;
    assign _1261 = _902[287:176];
    assign f_valid1 = _1261[111:111];
    assign _1296 = f_valid1 & _1295;
    assign _1304 = _1296 & _1303;
    assign _1377 = _1304 & _1376;
    assign _1382 = _1377 & _1381;
    assign _1421 = _1382 & _1420;
    assign _1422 = f_in_eval & _1421;
    assign _1426 = _1422 & _1425;
    assign f_fire1 = _1426 & _1288;
    assign _1712 = f_fire1 ? _2051 : _1710;
    assign f_winner = f_fire0 ? _2689 : _1712;
    always @* begin
        case (f_winner)
        0:
            _4471 <= _4467;
        1:
            _4471 <= _4468;
        2:
            _4471 <= _4469;
        default:
            _4471 <= _4470;
        endcase
    end
    assign _4473 = _887 ? _4472 : _4471;
    assign _4524 = _4473[0:0];
    assign _886 = _884 == _461;
    assign f_in_fetch = _879 == _2051;
    assign _887 = f_in_fetch & _886;
    assign _1707 = _887 | _1706;
    assign _4525 = _1707 & _4524;
    assign _4534 = _4525 ? _1689 : _4532;
    assign _4536 = _1899 ? _1689 : _4534;
    assign _319 = _4536;
    always @(posedge _316) begin
        if (_314)
            _935 <= _1689;
        else
            _935 <= _319;
    end
    assign _1947 = _1256[33:32];
    always @* begin
        case (_1947)
        0:
            _1948 <= _935;
        1:
            _1948 <= _938;
        2:
            _1948 <= _941;
        default:
            _1948 <= _941;
        endcase
    end
    assign _1946 = _1256[49:34];
    assign _1949 = _1946 < _1948;
    assign _1256 = _902[63:0];
    assign _1944 = _1256[31:31];
    assign _1942 = ~ _1706;
    assign _1943 = f_in_eval & _1942;
    assign _1945 = _1943 & _1944;
    assign _1950 = _1945 & _1949;
    assign _1955 = _1950 & _1954;
    assign _1963 = _1955 | f_unexp_now;
    assign f_viol_now = _1963 | f_amb_now;
    assign _4542 = f_viol_now ? _4541 : _884;
    assign _4545 = _1706 ? _4544 : _4542;
    assign _4538 = _879 == _2052;
    assign _4546 = _4538 ? _4545 : _884;
    assign _4537 = _879 == _2051;
    assign _4549 = _4537 ? _4548 : _4546;
    assign _4551 = _1899 ? _458 : _4549;
    assign _320 = _4551;
    always @(posedge _316) begin
        if (_314)
            _884 <= _458;
        else
            _884 <= _320;
    end
    assign _4554 = _884 == _461;
    assign _4555 = _4554 ? _308 : _892;
    assign _4552 = _879 == _2051;
    assign _4556 = _4552 ? _4555 : _892;
    assign _321 = _4556;
    always @(posedge _316) begin
        if (_314)
            _892 <= _891;
        else
            _892 <= _321;
    end
    assign _902 = { _892,
                    _895,
                    _898,
                    _901 };
    assign _903 = _902[175:64];
    assign f_valid0 = _903[111:111];
    assign _914 = f_valid0 & _913;
    assign _931 = _914 & _930;
    assign _1174 = _931 & _1173;
    assign _1201 = _1174 & _1200;
    assign _1245 = _1201 & _1244;
    assign f_in_eval = _879 == _2052;
    assign _1246 = f_in_eval & _1245;
    assign _1255 = _1246 & _1254;
    assign f_fire0 = _1255 & _1288;
    assign _1428 = f_fire0 | f_fire1;
    assign _1567 = _1428 | f_fire2;
    assign _1706 = _1567 | f_fire3;
    assign _4575 = _1706 ? _4574 : _4572;
    assign _4560 = _879 == _1967;
    assign _4562 = _4560 ? _2689 : _879;
    assign _4558 = _879 == _2052;
    assign _4576 = _4558 ? _4575 : _4562;
    assign _4557 = _879 == _2051;
    assign _4579 = _4557 ? _4578 : _4576;
    assign _323 = host_stop;
    assign _4581 = _323 ? _2689 : _4579;
    assign _4583 = _1899 ? _2051 : _4581;
    assign _324 = _4583;
    always @(posedge _316) begin
        if (_314)
            _879 <= _2689;
        else
            _879 <= _324;
    end
    assign _1839 = _879 == _2689;
    assign _326 = host_verify;
    assign _2846 = _326 & _1839;
    assign _2848 = _2846 & _2847;
    assign _4585 = _2848 ? _1825 : f_sweeping;
    assign _4595 = f_sweeping ? _4594 : _4585;
    assign _327 = _4595;
    always @(posedge _316) begin
        if (_314)
            f_sweeping <= _1823;
        else
            f_sweeping <= _327;
    end
    assign _4607 = f_sweeping ? _4606 : _4600;
    assign _328 = _4607;
    always @(posedge _316) begin
        if (_314)
            f_image_valid <= _1823;
        else
            f_image_valid <= _328;
    end
    assign _330 = host_start;
    assign _1899 = _330 & f_image_valid;
    assign _4631 = _1899 ? _761 : _4629;
    assign _331 = _4631;
    always @(posedge _316) begin
        if (_314)
            f_pout <= _761;
        else
            f_pout <= _331;
    end
    assign _2771 = f_pout[7:7];
    assign _333 = host_pin_src;
    assign _2767 = _333[23:21];
    always @* begin
        case (_2767)
        0:
            _2778 <= _2771;
        1:
            _2778 <= f_lane0_out;
        2:
            _2778 <= _2772;
        3:
            _2778 <= _2773;
        4:
            _2778 <= _2775;
        5:
            _2778 <= f_lane1_out;
        6:
            _2778 <= _2776;
        default:
            _2778 <= _2777;
        endcase
    end
    assign _2842 = { _2778,
                     _2787,
                     _2796,
                     _2805,
                     _2814,
                     _2823,
                     _2832,
                     _2841 };
    assign _4633 = _2842 & _4632;
    assign pins_out = _4633;
    assign pins_oe = _2845;
    assign st_running = _2702;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1770;
    assign st_accepting = _2701;
    assign st_taken = _2699;
    assign st_taken_edge = _2696;
    assign st_viol = _2693;
    assign st_viol_kind = _2690;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _745;
    assign st_tx_empty = _1190;
    assign st_rx_data = _2685;
    assign st_rx_empty = _2476;
    assign st_vlog_data = _2474;
    assign st_vlog_empty = _1991;
    assign st_cov_rdata = _2103;
    assign st_irq = _1995;
    assign st_halted_viol = _1928;
    assign st_rx_overflow = _1921;
    assign st_vlog_overflow = _1909;
    assign st_cov_overrun = _1902;
    assign st_host_err = _1886;
    assign st_host_err_cause = _1891;
    assign st_lane_active = _1837;
    assign st_image_valid = f_image_valid;
    assign st_verify_busy = f_sweeping;
    assign st_tx_collision = _1824;
    assign st_drops = _1790;
    assign st_lane_status = _674;

endmodule
