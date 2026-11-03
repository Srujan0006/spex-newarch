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

    wire [2:0] _438;
    wire [2:0] _468;
    wire [2:0] _469;
    wire [2:0] _441;
    wire [2:0] _440;
    wire [2:0] _442;
    wire [2:0] _443;
    wire [2:0] _470;
    wire [2:0] _472;
    wire [2:0] _474;
    wire [2:0] _1;
    reg [2:0] _439;
    wire [7:0] _659;
    wire [2:0] _630;
    wire [2:0] _604;
    wire [2:0] _605;
    wire [2:0] _631;
    wire [2:0] _633;
    wire [2:0] _635;
    wire [2:0] _2;
    reg [2:0] _601;
    wire [7:0] _647;
    wire [15:0] _660;
    wire [7:0] _726;
    wire [7:0] _732;
    wire [7:0] _733;
    wire [7:0] _728;
    wire _729;
    wire _730;
    wire _722;
    wire _719;
    wire _720;
    wire _716;
    wire _713;
    wire _714;
    wire _715;
    wire _717;
    wire _721;
    wire _723;
    wire _712;
    wire _724;
    wire _731;
    wire [7:0] _734;
    wire [7:0] _736;
    wire [7:0] _4;
    reg [7:0] _727;
    wire [7:0] _817;
    wire _813;
    wire _814;
    wire _806;
    wire _803;
    wire _804;
    wire _800;
    wire _797;
    wire _798;
    wire _799;
    wire _801;
    wire _805;
    wire _807;
    wire _795;
    wire _796;
    wire _808;
    wire _815;
    wire [7:0] _818;
    wire [7:0] _820;
    wire [7:0] _5;
    reg [7:0] _811;
    wire [7:0] _1685;
    wire _1681;
    wire _1682;
    wire _1675;
    wire _1676;
    wire _1683;
    wire [7:0] _1686;
    wire [7:0] _1688;
    wire [7:0] _6;
    reg [7:0] _1679;
    wire [7:0] _1700;
    wire _1696;
    wire _1697;
    wire _1698;
    wire [7:0] _1701;
    wire [7:0] _1703;
    wire [7:0] _7;
    reg [7:0] _1694;
    wire [7:0] _1727;
    wire _1723;
    wire _1724;
    wire _1725;
    wire [7:0] _1728;
    wire _9;
    wire [7:0] _1730;
    wire [7:0] _10;
    reg [7:0] _1721;
    wire [39:0] _1731;
    wire _1764;
    wire _1766;
    wire _1744;
    wire _1762;
    wire _1767;
    wire _1769;
    wire _12;
    reg _1765;
    wire [1:0] _1778;
    wire [2:0] _1829;
    wire [2:0] _1831;
    wire [2:0] _17;
    reg [2:0] _1828;
    wire _1824;
    wire [2:0] _1814;
    wire [2:0] _1810;
    wire [2:0] _1811;
    wire [2:0] _1815;
    wire [2:0] _1808;
    wire [2:0] _1816;
    wire _1803;
    wire _1804;
    wire _1805;
    wire _1799;
    wire _1800;
    wire _1776;
    wire _1796;
    wire _1797;
    wire _1777;
    wire [1:0] _20;
    wire _1794;
    wire _1795;
    wire _1798;
    wire _1801;
    wire _1790;
    wire _1786;
    wire _1791;
    wire _1784;
    wire _22;
    wire _1783;
    wire _1785;
    wire _1792;
    wire _1781;
    wire _1782;
    wire _1793;
    wire _1802;
    wire _1806;
    wire [2:0] _1817;
    wire _1819;
    wire _1820;
    wire _1825;
    wire _1833;
    wire _24;
    wire _1835;
    wire _25;
    reg _1823;
    wire _1716;
    wire _1717;
    wire _1708;
    wire _1718;
    wire _1841;
    wire _1843;
    wire _27;
    reg _1839;
    wire _1691;
    wire _1848;
    wire _1850;
    wire _29;
    reg _1846;
    wire _1673;
    wire _1666;
    wire _1674;
    wire _793;
    wire _789;
    wire _794;
    wire _1851;
    wire _31;
    wire _1852;
    wire _1853;
    wire _1858;
    wire _1860;
    wire _32;
    reg _1856;
    wire _1864;
    wire _1865;
    wire _1870;
    wire _36;
    wire _1872;
    wire _1874;
    wire _37;
    reg _1868;
    wire _1903;
    wire _1905;
    wire _1901;
    wire _1907;
    wire _1908;
    wire _1909;
    wire _1876;
    wire _1910;
    wire _1912;
    wire _38;
    reg _1863;
    wire _1927;
    wire [2:0] _40;
    wire [3:0] _1920;
    wire _1921;
    wire _1922;
    wire _42;
    wire _1923;
    wire [2:0] _44;
    wire _1914;
    wire [2:0] _1916;
    wire [3:0] _1917;
    wire _1918;
    wire _1919;
    wire _1924;
    wire _1928;
    wire _1929;
    wire _1930;
    wire _2032;
    wire _2031;
    wire _2033;
    wire [31:0] _2030;
    wire _2024;
    wire _2022;
    wire _2020;
    wire _47;
    wire _2019;
    wire _2021;
    wire _2023;
    wire f_host_cov_we;
    wire _2026;
    wire [11:0] _2013;
    wire _2010;
    wire _2011;
    wire [11:0] _2012;
    wire _2014;
    wire [11:0] _2015;
    wire [11:0] _2016;
    wire [11:0] _2002;
    wire [11:0] _1963;
    wire [11:0] _1960;
    wire [12:0] _1957;
    wire [9:0] _1954;
    wire [12:0] _1955;
    wire [12:0] _1956;
    reg [2:0] _1931;
    wire [2:0] _48;
    reg [2:0] _1951;
    wire [12:0] _1952;
    wire [12:0] _1937;
    wire [12:0] _1936;
    wire [15:0] _1932;
    wire _1935;
    wire [12:0] _1938;
    wire [12:0] _49;
    reg [12:0] _1947;
    wire _1953;
    wire [12:0] _1958;
    wire [12:0] _1944;
    wire _1959;
    wire [11:0] _1962;
    wire [15:0] _1939;
    wire _1940;
    wire _50;
    reg _1943;
    wire [11:0] _1964;
    wire [11:0] _51;
    reg [11:0] _2003;
    wire [11:0] _1967;
    reg [1:0] _1933;
    reg [15:0] _1934;
    wire [15:0] _1965;
    wire _1966;
    wire [11:0] _1969;
    wire [11:0] _52;
    reg [11:0] _2000;
    wire _2004;
    wire _2005;
    wire [11:0] _2006;
    wire [11:0] _1997;
    wire _2007;
    wire [11:0] _2008;
    wire _1996;
    wire [11:0] _2009;
    wire [7:0] _1992;
    wire [1:0] _1987;
    wire [1:0] _1986;
    wire _1971;
    wire _1970;
    wire _1972;
    wire _53;
    reg _1985;
    wire [1:0] _1988;
    wire [6:0] _1982;
    wire [8:0] _1989;
    wire [7:0] _1980;
    wire [8:0] _1981;
    wire [8:0] _1990;
    wire _1991;
    wire [7:0] _1994;
    wire [31:0] _2017;
    wire [31:0] _55;
    wire [31:0] _2018;
    reg [31:0] _2027[0:255];
    wire [7:0] _56;
    reg [7:0] _1978;
    wire [7:0] _1712;
    wire [7:0] _57;
    reg [7:0] _1715;
    wire [7:0] _59;
    wire [7:0] _1975;
    wire _1973;
    wire _61;
    wire _1704;
    wire _1974;
    wire _62;
    reg _1707;
    wire _63;
    reg _1789;
    wire [7:0] _1979;
    wire [31:0] _2028;
    reg [31:0] _2034;
    wire [31:0] _64;
    wire _2035;
    wire _2036;
    wire [31:0] _2038;
    wire [2:0] _2405;
    wire _2406;
    wire _2407;
    wire [47:0] _2404;
    reg [47:0] _2408;
    wire [2:0] _2399;
    wire _2400;
    wire _2401;
    reg [47:0] _2402;
    wire _2394;
    wire _2395;
    reg [47:0] _2396;
    wire _2388;
    wire _2389;
    reg [47:0] _2390;
    wire _2382;
    wire _2383;
    reg [47:0] _2384;
    wire _2376;
    wire _2377;
    reg [47:0] _2378;
    wire _2370;
    wire _2371;
    reg [47:0] _2372;
    wire [2:0] _2045;
    wire [2:0] _2046;
    wire [2:0] _67;
    reg [2:0] _2043;
    wire _2364;
    wire _2365;
    wire [2:0] _2337;
    wire [28:0] _2054;
    wire [28:0] _2053;
    wire [28:0] _2056;
    wire [28:0] _2057;
    wire [2:0] _2050;
    wire _2052;
    wire [28:0] _2058;
    wire [28:0] _68;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2335;
    wire [2:0] _2076;
    wire _2072;
    wire _2073;
    wire _2070;
    wire _2074;
    wire [2:0] _2077;
    wire _2067;
    wire _2068;
    wire _2065;
    wire _2064;
    wire _2066;
    wire _2069;
    wire [2:0] _2079;
    wire _2060;
    wire [2:0] _2080;
    wire [2:0] _69;
    reg [2:0] _2063;
    wire _2326;
    wire [2:0] _2328;
    wire [2:0] _2097;
    wire _2093;
    wire _2094;
    wire _2091;
    wire _2095;
    wire [2:0] _2098;
    wire _2088;
    wire _2089;
    wire _2086;
    wire _2085;
    wire _2087;
    wire _2090;
    wire [2:0] _2100;
    wire _2081;
    wire [2:0] _2101;
    wire [2:0] _70;
    reg [2:0] _2084;
    wire _2323;
    wire [2:0] _2325;
    wire [2:0] _2329;
    wire [2:0] _2118;
    wire _2114;
    wire _2115;
    wire _2112;
    wire _2116;
    wire [2:0] _2119;
    wire _2109;
    wire _2110;
    wire _2107;
    wire _2106;
    wire _2108;
    wire _2111;
    wire [2:0] _2121;
    wire _2102;
    wire [2:0] _2122;
    wire [2:0] _71;
    reg [2:0] _2105;
    wire _2319;
    wire [2:0] _2321;
    wire [2:0] _2139;
    wire _2135;
    wire _2136;
    wire _2133;
    wire _2137;
    wire [2:0] _2140;
    wire _2130;
    wire _2131;
    wire _2128;
    wire _2127;
    wire _2129;
    wire _2132;
    wire [2:0] _2142;
    wire _2123;
    wire [2:0] _2143;
    wire [2:0] _72;
    reg [2:0] _2126;
    wire _2316;
    wire [2:0] _2318;
    wire [2:0] _2322;
    wire [2:0] _2330;
    wire [2:0] _2160;
    wire _2156;
    wire _2157;
    wire _2154;
    wire _2158;
    wire [2:0] _2161;
    wire _2151;
    wire _2152;
    wire _2149;
    wire _2148;
    wire _2150;
    wire _2153;
    wire [2:0] _2163;
    wire _2144;
    wire [2:0] _2164;
    wire [2:0] _73;
    reg [2:0] _2147;
    wire _2311;
    wire [2:0] _2313;
    wire [2:0] _2181;
    wire _2177;
    wire _2178;
    wire _2175;
    wire _2179;
    wire [2:0] _2182;
    wire _2172;
    wire _2173;
    wire _2170;
    wire _2169;
    wire _2171;
    wire _2174;
    wire [2:0] _2184;
    wire _2165;
    wire [2:0] _2185;
    wire [2:0] _74;
    reg [2:0] _2168;
    wire _2308;
    wire [2:0] _2310;
    wire [2:0] _2314;
    wire [2:0] _2202;
    wire _2198;
    wire _2199;
    wire _2196;
    wire _2200;
    wire [2:0] _2203;
    wire _2193;
    wire _2194;
    wire _2191;
    wire _2190;
    wire _2192;
    wire _2195;
    wire [2:0] _2205;
    wire _2186;
    wire [2:0] _2206;
    wire [2:0] _75;
    reg [2:0] _2189;
    wire _2304;
    wire [2:0] _2306;
    wire [2:0] _2223;
    wire _2219;
    wire _2220;
    wire _2217;
    wire _2221;
    wire [2:0] _2224;
    wire _2214;
    wire _2215;
    wire _2212;
    wire _2211;
    wire _2213;
    wire _2216;
    wire [2:0] _2226;
    wire _2207;
    wire [2:0] _2227;
    wire [2:0] _76;
    reg [2:0] _2210;
    wire _2301;
    wire [2:0] _2303;
    wire [2:0] _2307;
    wire [2:0] _2315;
    wire [2:0] _2331;
    wire _2296;
    wire _2295;
    wire _2297;
    wire _2293;
    wire _2292;
    wire _2294;
    wire _2298;
    wire _2289;
    wire _2288;
    wire _2290;
    wire _2286;
    wire _2285;
    wire _2287;
    wire _2291;
    wire _2299;
    wire [2:0] _2332;
    wire _2274;
    wire _2273;
    wire _2275;
    wire [2:0] _2277;
    wire _2269;
    wire _2268;
    wire _2270;
    wire [2:0] _2272;
    wire _2278;
    wire [2:0] _2279;
    wire _2262;
    wire _2261;
    wire _2263;
    wire [2:0] _2265;
    wire _2257;
    wire _2256;
    wire _2258;
    wire [2:0] _2260;
    wire _2266;
    wire [2:0] _2267;
    wire _2280;
    wire [2:0] _2281;
    wire _2248;
    wire _2247;
    wire _2249;
    wire [2:0] _2251;
    wire _2243;
    wire _2242;
    wire _2244;
    wire [2:0] _2246;
    wire _2252;
    wire [2:0] _2253;
    wire _2236;
    wire _2235;
    wire _2237;
    wire [2:0] _2239;
    wire _2231;
    wire _2230;
    wire _2232;
    wire [2:0] _2234;
    wire _2240;
    wire [2:0] _2241;
    wire _2254;
    wire [2:0] _2255;
    wire _2282;
    wire [2:0] _2283;
    wire [2:0] _2284;
    wire [2:0] _2333;
    wire [2:0] _2228;
    wire _2334;
    wire [28:0] _2336;
    wire [31:0] _2338;
    wire [47:0] _2342;
    wire [47:0] _77;
    reg [47:0] _2366;
    wire [2:0] _2359;
    wire [3:0] _1925;
    wire [3:0] _2348;
    wire [3:0] _2349;
    wire [3:0] _2347;
    wire [3:0] _2350;
    wire [3:0] _1689;
    wire _1690;
    wire _2039;
    wire _78;
    wire _2040;
    wire _2345;
    wire [3:0] _2351;
    reg [3:0] _2354;
    wire [3:0] _79;
    wire _1926;
    wire _2343;
    wire _81;
    wire _2344;
    wire [2:0] _2360;
    wire [2:0] _82;
    reg [2:0] _2357;
    reg [47:0] _2409;
    wire _2515;
    wire _2516;
    reg [7:0] _2517;
    wire _2509;
    wire _2510;
    reg [7:0] _2511;
    wire _2503;
    wire _2504;
    reg [7:0] _2505;
    wire _2497;
    wire _2498;
    reg [7:0] _2499;
    wire _2491;
    wire _2492;
    reg [7:0] _2493;
    wire _2485;
    wire _2486;
    reg [7:0] _2487;
    wire _2479;
    wire _2480;
    reg [7:0] _2481;
    wire [2:0] _2418;
    wire [2:0] _2419;
    wire [2:0] _85;
    reg [2:0] _2416;
    wire _2473;
    wire _2474;
    wire [7:0] _2459;
    wire [7:0] _2460;
    wire [7:0] _2437;
    wire [7:0] _2435;
    wire [7:0] _2438;
    wire [7:0] _86;
    reg [7:0] _2424;
    wire [7:0] _2433;
    wire [7:0] _2434;
    wire [7:0] _2449;
    wire [7:0] _2446;
    wire [7:0] _2444;
    wire [7:0] _2447;
    wire [7:0] _87;
    reg [7:0] _2443;
    wire [7:0] _2448;
    wire [7:0] _2450;
    wire [7:0] _2461;
    wire [7:0] _88;
    reg [7:0] _2475;
    wire [2:0] _2468;
    wire [2:0] _2469;
    wire [2:0] _89;
    reg [2:0] _2466;
    reg [7:0] _2518;
    wire [31:0] _2521;
    wire [31:0] _2522;
    wire [31:0] _93;
    reg [31:0] ts_reg;
    wire [1:0] _2524;
    wire [1:0] _2339;
    wire [1:0] _2341;
    reg [1:0] _2525;
    reg _2528;
    reg [1:0] _2531;
    reg _2534;
    wire _2535;
    wire _2536;
    wire _2537;
    wire [7:0] _2678;
    wire [7:0] _2679;
    wire [7:0] _2559;
    wire [7:0] _2557;
    wire [7:0] _2556;
    wire [7:0] _2555;
    wire [7:0] _2554;
    reg [7:0] _2558;
    wire [7:0] _2560;
    wire [7:0] _2561;
    wire [7:0] _2552;
    wire [7:0] _2553;
    wire [7:0] _2562;
    wire [7:0] _2596;
    wire [7:0] _2597;
    wire [7:0] _2599;
    wire [7:0] _2601;
    wire [7:0] _103;
    reg [7:0] f_poe;
    wire [7:0] _2680;
    wire [7:0] _106;
    wire [7:0] _4133;
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
    wire _2633;
    wire [2:0] _2632;
    reg _2640;
    wire _2630;
    wire _2629;
    wire _2627;
    wire _2628;
    wire _2626;
    wire _2625;
    wire _2624;
    wire [2:0] _2623;
    reg _2631;
    wire _2621;
    wire _2620;
    wire _2618;
    wire _2619;
    wire _2617;
    wire _2616;
    wire _2615;
    wire [2:0] _2614;
    reg _2622;
    wire _2612;
    wire _2611;
    wire _2609;
    wire _2610;
    wire _2608;
    wire _2607;
    wire [2:0] _4125;
    wire _4122;
    wire [1:0] _4123;
    wire [3:0] _4124;
    wire [6:0] _4126;
    wire [7:0] _4127;
    wire [7:0] _4128;
    wire _2593;
    wire _2592;
    wire _2591;
    wire _2589;
    wire _2590;
    wire _2587;
    wire _2588;
    wire _2584;
    wire _2585;
    wire _2586;
    wire _2581;
    wire _2582;
    wire _2583;
    wire _2578;
    wire _2577;
    wire _2579;
    wire _2576;
    wire _2580;
    wire [7:0] _2594;
    wire _2563;
    wire _2569;
    wire [7:0] _2595;
    wire [7:0] _4120;
    wire [7:0] _4116;
    wire [7:0] _4114;
    wire [7:0] _4113;
    wire [7:0] _4112;
    wire [7:0] _4111;
    reg [7:0] _4115;
    wire [7:0] _4117;
    wire [7:0] _4118;
    wire [7:0] _2550;
    wire [7:0] _2548;
    wire [7:0] _2547;
    wire [7:0] _2546;
    wire [7:0] _2545;
    reg [7:0] _2549;
    wire [7:0] _2551;
    wire [7:0] _4109;
    wire [7:0] _4110;
    wire [7:0] _4119;
    wire [7:0] _4121;
    wire [7:0] _4129;
    wire _2539;
    wire _2540;
    wire _2541;
    wire [7:0] _4130;
    wire [31:0] _108;
    wire [31:0] _4102;
    wire [31:0] _2795;
    wire [30:0] _2793;
    wire [31:0] _2794;
    wire [31:0] _2796;
    wire [30:0] _2790;
    wire [31:0] _2791;
    wire [30:0] _2783;
    wire [31:0] _2784;
    wire [31:0] _2786;
    wire [30:0] _2780;
    wire [31:0] _2781;
    wire [30:0] _2773;
    wire [31:0] _2774;
    wire [31:0] _2776;
    wire [30:0] _2770;
    wire [31:0] _2771;
    wire [30:0] _2763;
    wire [31:0] _2764;
    wire [31:0] _2766;
    wire [30:0] _2760;
    wire [31:0] _2761;
    wire [30:0] _2753;
    wire [31:0] _2754;
    wire [31:0] _2756;
    wire [30:0] _2750;
    wire [31:0] _2751;
    wire [30:0] _2743;
    wire [31:0] _2744;
    wire [31:0] _2746;
    wire [30:0] _2740;
    wire [31:0] _2741;
    wire [30:0] _2733;
    wire [31:0] _2734;
    wire [31:0] _2736;
    wire [30:0] _2730;
    wire [31:0] _2731;
    wire [30:0] _2723;
    wire [31:0] _2724;
    wire [31:0] _2726;
    wire [30:0] _2720;
    wire [31:0] _2721;
    wire [7:0] _2714;
    wire [7:0] _2713;
    wire [7:0] _2712;
    wire [7:0] _2711;
    wire [7:0] _2710;
    wire [7:0] _2709;
    wire [7:0] _2708;
    wire [7:0] _2707;
    wire [7:0] _2706;
    wire [7:0] _2705;
    wire [7:0] _2704;
    wire [7:0] _2703;
    wire [7:0] _2702;
    wire [7:0] _2701;
    wire [7:0] _2700;
    wire [7:0] _2699;
    wire [12:0] _2696;
    wire [12:0] _2697;
    wire [3:0] _2698;
    reg [7:0] _2715;
    wire [23:0] _2695;
    wire [31:0] _2716;
    wire _2693;
    wire _2694;
    wire [31:0] _2798;
    wire [31:0] _2688;
    wire [31:0] _2799;
    wire [31:0] _109;
    reg [31:0] _2686;
    wire [31:0] _2717;
    wire _2718;
    wire [31:0] _2727;
    wire _2728;
    wire [31:0] _2737;
    wire _2738;
    wire [31:0] _2747;
    wire _2748;
    wire [31:0] _2757;
    wire _2758;
    wire [31:0] _2767;
    wire _2768;
    wire [31:0] _2777;
    wire _2778;
    wire [31:0] _2787;
    wire _2788;
    wire [31:0] _2797;
    wire [31:0] _4103;
    wire f_sw_match;
    wire _4105;
    wire _4107;
    wire _4097;
    wire _4099;
    wire _4101;
    wire [12:0] _4090;
    wire f_sw_last;
    wire _4093;
    wire _111;
    wire _4087;
    wire _4088;
    wire _4089;
    wire _4095;
    wire _2682;
    wire [1:0] _4079;
    wire [1:0] _4075;
    wire [1:0] _1902;
    wire _4066;
    wire [1:0] _4068;
    wire _4065;
    wire [1:0] _4070;
    wire _4064;
    wire [1:0] _4072;
    wire [1:0] _4073;
    wire [7:0] _1642;
    wire _1644;
    wire _1635;
    wire [15:0] _1630;
    wire _1631;
    wire _1632;
    wire _1629;
    wire _1633;
    wire _1636;
    wire [3:0] _1626;
    wire _1628;
    wire _1637;
    wire _1624;
    wire _1620;
    wire _1621;
    wire _1618;
    wire _1622;
    wire _1625;
    wire _1616;
    reg [2:0] _1610;
    wire [15:0] _1611;
    wire _1612;
    wire _1606;
    wire _1613;
    wire _1604;
    wire _1614;
    wire _1617;
    wire [1:0] _1603;
    reg _1638;
    wire _1602;
    wire _1639;
    wire _1599;
    wire [3:0] _1597;
    reg _1598;
    wire _1600;
    wire [15:0] _1592;
    wire _1594;
    wire [16:0] _1587;
    wire [15:0] _1583;
    wire [16:0] _1584;
    wire [16:0] _1585;
    reg [16:0] _1588;
    wire _1589;
    wire _1590;
    wire [15:0] _1579;
    wire _1581;
    wire _1563;
    wire [2:0] _1565;
    wire _1560;
    wire [2:0] _1562;
    wire _1566;
    wire [2:0] _1567;
    wire _1555;
    wire [2:0] _1557;
    wire _1552;
    wire [2:0] _1554;
    wire _1558;
    wire [2:0] _1559;
    wire _1568;
    wire [2:0] _1569;
    wire _1545;
    wire [2:0] _1547;
    wire _1542;
    wire [2:0] _1544;
    wire _1548;
    wire [2:0] _1549;
    wire _1537;
    wire [2:0] _1539;
    wire [7:0] _1533;
    wire _1534;
    wire [2:0] _1536;
    wire _1540;
    wire [2:0] _1541;
    wire _1550;
    wire [2:0] _1551;
    wire _1570;
    wire [2:0] _1571;
    wire [13:0] _1532;
    wire [16:0] _1572;
    wire [111:0] _1529;
    wire [15:0] _1530;
    wire [16:0] _1531;
    wire [16:0] _1573;
    reg [16:0] _1576;
    wire [16:0] _1528;
    wire _1577;
    wire _1578;
    wire _1582;
    wire _1591;
    wire [1:0] _1524;
    reg [15:0] _1525;
    wire _1527;
    wire _1595;
    wire [7:0] _1518;
    wire _1520;
    wire _1521;
    wire _1517;
    wire _1522;
    wire [7:0] _1511;
    wire [7:0] _1509;
    wire [7:0] _1510;
    wire [7:0] _1512;
    wire _1514;
    wire _1515;
    wire _1523;
    wire _1596;
    wire _1601;
    wire _1640;
    wire _1641;
    wire _1645;
    wire f_fire3;
    wire [7:0] _1193;
    wire _1195;
    wire _1181;
    wire _1177;
    wire _1178;
    wire _1175;
    wire _1179;
    wire _1182;
    wire [3:0] _1172;
    wire _1174;
    wire _1183;
    wire _1170;
    wire _1166;
    wire _1167;
    wire _1164;
    wire _1168;
    wire _1171;
    wire _1162;
    reg [2:0] _1156;
    wire [15:0] _1157;
    wire _1158;
    wire _1152;
    wire _1159;
    wire _1150;
    wire _1160;
    wire _1163;
    wire [1:0] _1149;
    reg _1184;
    wire _1148;
    wire _1185;
    wire _1140;
    wire [3:0] _1116;
    reg _1139;
    wire _1141;
    wire [15:0] _1111;
    wire _1113;
    wire [15:0] _1102;
    wire [16:0] _1103;
    wire [16:0] _1104;
    reg [16:0] _1107;
    wire _1108;
    wire _1109;
    wire [15:0] _1098;
    wire _1100;
    wire _1064;
    wire [2:0] _1084;
    wire _1043;
    wire [2:0] _1063;
    wire _1085;
    wire [2:0] _1086;
    wire _1020;
    wire [2:0] _1040;
    wire _999;
    wire [2:0] _1019;
    wire _1041;
    wire [2:0] _1042;
    wire _1087;
    wire [2:0] _1088;
    wire _974;
    wire [2:0] _994;
    wire _953;
    wire [2:0] _973;
    wire _995;
    wire [2:0] _996;
    wire _930;
    wire [2:0] _950;
    wire [7:0] _908;
    wire _909;
    wire [2:0] _929;
    wire _951;
    wire [2:0] _952;
    wire _997;
    wire [2:0] _998;
    wire _1089;
    wire [2:0] _1090;
    wire [16:0] _1091;
    wire [111:0] _904;
    wire [15:0] _905;
    wire [16:0] _906;
    wire [16:0] _1092;
    reg [16:0] _1095;
    wire [16:0] _886;
    wire _1096;
    wire _1097;
    wire _1101;
    wire _1110;
    wire [1:0] _873;
    reg [15:0] _883;
    wire _885;
    wire _1114;
    wire [7:0] _867;
    wire _869;
    wire _870;
    wire _861;
    wire _871;
    wire [7:0] _854;
    wire [7:0] _852;
    wire [7:0] _853;
    wire [7:0] _855;
    wire _857;
    wire [127:0] _838;
    wire [2:0] _4049;
    wire [2:0] _4045;
    wire _4040;
    wire [2:0] _4042;
    wire [7:0] _1893;
    wire _1895;
    wire _1896;
    wire _1891;
    wire _1892;
    wire f_unexp_now;
    wire _2803;
    wire _2804;
    wire _2806;
    wire _2807;
    wire _2802;
    wire _2800;
    wire _2808;
    wire _112;
    reg _1888;
    wire _1889;
    wire [15:0] _4031;
    wire [15:0] _4032;
    wire _4028;
    wire _4029;
    wire _4030;
    wire [15:0] _4033;
    wire [2:0] _3973;
    wire [2:0] _3971;
    wire [2:0] _3970;
    wire [2:0] _3969;
    wire [2:0] _3968;
    wire [7:0] _1503;
    wire _1505;
    wire _1496;
    wire _1492;
    wire _1493;
    wire _1490;
    wire _1494;
    wire _1497;
    wire [3:0] _1487;
    wire _1489;
    wire _1498;
    wire _1485;
    wire _1481;
    wire _1482;
    wire _1479;
    wire _1483;
    wire _1486;
    wire _1477;
    reg [2:0] _1471;
    wire [15:0] _1472;
    wire _1473;
    wire _1467;
    wire _1474;
    wire _1465;
    wire _1475;
    wire _1478;
    wire [1:0] _1464;
    reg _1499;
    wire _1463;
    wire _1500;
    wire _1460;
    wire [3:0] _1458;
    reg _1459;
    wire _1461;
    wire [15:0] _1453;
    wire _1455;
    wire [15:0] _1444;
    wire [16:0] _1445;
    wire [16:0] _1446;
    reg [16:0] _1449;
    wire _1450;
    wire _1451;
    wire [15:0] _1440;
    wire _1442;
    wire _1424;
    wire [2:0] _1426;
    wire _1421;
    wire [2:0] _1423;
    wire _1427;
    wire [2:0] _1428;
    wire _1416;
    wire [2:0] _1418;
    wire _1413;
    wire [2:0] _1415;
    wire _1419;
    wire [2:0] _1420;
    wire _1429;
    wire [2:0] _1430;
    wire _1406;
    wire [2:0] _1408;
    wire _1403;
    wire [2:0] _1405;
    wire _1409;
    wire [2:0] _1410;
    wire _1398;
    wire [2:0] _1400;
    wire [7:0] _1394;
    wire _1395;
    wire [2:0] _1397;
    wire _1401;
    wire [2:0] _1402;
    wire _1411;
    wire [2:0] _1412;
    wire _1431;
    wire [2:0] _1432;
    wire [16:0] _1433;
    wire [111:0] _1390;
    wire [15:0] _1391;
    wire [16:0] _1392;
    wire [16:0] _1434;
    reg [16:0] _1437;
    wire [16:0] _1389;
    wire _1438;
    wire _1439;
    wire _1443;
    wire _1452;
    wire [1:0] _1385;
    reg [15:0] _1386;
    wire _1388;
    wire _1456;
    wire [7:0] _1379;
    wire _1381;
    wire _1382;
    wire _1378;
    wire _1383;
    wire [7:0] _1372;
    wire [7:0] _1370;
    wire [7:0] _1371;
    wire [7:0] _1373;
    wire _1375;
    wire _1376;
    wire _1384;
    wire _1457;
    wire _1462;
    wire _1501;
    wire _1502;
    wire _1506;
    wire f_fire2;
    wire [1:0] _1651;
    wire _1228;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _1218;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _1212;
    wire [7:0] _1206;
    wire [7:0] f_chgmask0;
    wire [7:0] _1200;
    wire [7:0] f_watch;
    wire [7:0] _1201;
    wire [7:0] _1207;
    wire [7:0] _1213;
    wire [7:0] f_relevant;
    wire [7:0] _1220;
    wire _1222;
    wire _1223;
    wire f_amb_now;
    wire _1225;
    wire _1229;
    wire [7:0] _1191;
    wire [7:0] _2813;
    wire [7:0] _2814;
    wire _2810;
    wire [7:0] _2812;
    wire _2809;
    wire [7:0] _2815;
    wire [7:0] _2817;
    wire [7:0] _113;
    reg [7:0] _1190;
    wire [7:0] f_multi_eff;
    wire [7:0] _1364;
    wire _1366;
    wire _1357;
    wire _1353;
    wire _1354;
    wire _1351;
    wire _1355;
    wire _1358;
    wire [3:0] _1348;
    wire _1350;
    wire _1359;
    wire _1346;
    wire _1342;
    wire _1343;
    wire _1340;
    wire _1344;
    wire _1347;
    wire _1338;
    reg [2:0] _1332;
    wire [15:0] _1333;
    wire _1334;
    wire _1328;
    wire _1335;
    wire _1326;
    wire _1336;
    wire _1339;
    wire [1:0] _1325;
    reg _1360;
    wire [1:0] _115;
    wire [1:0] _2818;
    wire [1:0] _116;
    reg [1:0] _1145;
    wire _1147;
    wire _1324;
    wire _1361;
    wire _1321;
    wire _2822;
    wire _2820;
    wire _2823;
    wire _2825;
    wire _2827;
    wire _117;
    reg _646;
    wire [15:0] _119;
    wire [15:0] _121;
    wire [15:0] _2833;
    wire [15:0] _2834;
    wire [15:0] _2835;
    wire [15:0] _2837;
    wire [15:0] _122;
    reg [15:0] _2830;
    wire [14:0] _2831;
    wire [15:0] _2832;
    wire [15:0] _2838;
    wire [15:0] _2839;
    wire _2841;
    wire _2843;
    wire _2844;
    wire _2845;
    wire _2846;
    wire _2848;
    wire _2850;
    wire _123;
    reg _643;
    wire _2863;
    wire _2864;
    wire _2866;
    wire _2867;
    wire _2868;
    wire _2869;
    wire _2871;
    wire _124;
    reg g_crc_bad;
    wire _2865;
    wire _2874;
    wire [5:0] _2872;
    wire _2873;
    wire _2875;
    wire _2876;
    wire _2877;
    wire _2878;
    wire _2879;
    wire _2881;
    wire _2883;
    wire _125;
    reg _640;
    wire _2887;
    wire _2885;
    wire _2888;
    wire _2890;
    wire _2892;
    wire _126;
    reg _658;
    wire [15:0] _128;
    wire [15:0] _130;
    wire [15:0] _2898;
    wire [15:0] _2899;
    wire [15:0] _2900;
    wire [15:0] _2902;
    wire [15:0] _131;
    reg [15:0] _2895;
    wire [14:0] _2896;
    wire [15:0] _2897;
    wire [15:0] _2903;
    wire [15:0] _2904;
    wire _2906;
    wire _2908;
    wire _2909;
    wire _2910;
    wire _2911;
    wire _2913;
    wire _2915;
    wire _132;
    reg _655;
    wire _2928;
    wire _2929;
    wire _2931;
    wire _2932;
    wire _2933;
    wire _2934;
    wire _2936;
    wire _133;
    reg g_crc_bad_0;
    wire _2930;
    wire _2939;
    wire _2938;
    wire _2940;
    wire _2941;
    wire _2942;
    wire _2943;
    wire _2944;
    wire _2946;
    wire _2948;
    wire _134;
    reg _652;
    wire [7:0] _136;
    wire [6:0] _1137;
    wire [6:0] _1136;
    wire _1138;
    wire [15:0] _1133;
    wire _2953;
    wire _2952;
    wire _2954;
    wire _2951;
    wire _2955;
    wire _2950;
    wire _2956;
    wire [14:0] _2949;
    wire [15:0] _2957;
    wire [15:0] _137;
    reg [15:0] _1134;
    wire _1135;
    wire [3:0] _2976;
    wire [3:0] _2974;
    wire [3:0] _2977;
    wire _2411;
    wire _2462;
    wire _139;
    wire _2463;
    wire _2412;
    wire _2445;
    wire _2961;
    wire _2439;
    wire _2440;
    wire _2959;
    wire _1664;
    wire _1665;
    wire _1671;
    wire _1668;
    wire _1669;
    wire _1667;
    wire _1670;
    wire _1672;
    wire _2962;
    wire _140;
    reg _823;
    wire _2970;
    wire _2436;
    wire _2966;
    wire _2420;
    wire _2421;
    wire _2964;
    wire _786;
    wire [2:0] _780;
    wire _775;
    wire g_tx_bit;
    wire _776;
    wire _777;
    wire _778;
    wire [2:0] _781;
    wire _783;
    wire _784;
    wire _755;
    wire _785;
    wire _787;
    wire _751;
    wire _752;
    wire _788;
    wire _791;
    wire _790;
    wire _792;
    wire _2967;
    wire _141;
    reg _739;
    wire _2968;
    wire _707;
    wire [2:0] _701;
    wire _696;
    wire g_tx_bit_0;
    wire _697;
    wire _698;
    wire _699;
    wire [2:0] _702;
    wire _704;
    wire _705;
    wire _676;
    wire _706;
    wire _708;
    wire _672;
    wire _673;
    wire _709;
    wire _2969;
    wire _2971;
    wire _142;
    wire _2413;
    wire _2972;
    wire [3:0] _2978;
    reg [3:0] _2981;
    wire [3:0] _143;
    wire _711;
    wire [6:0] _2998;
    wire [7:0] _2999;
    wire [6:0] _2996;
    wire _2994;
    wire _2993;
    wire _2992;
    wire _2991;
    wire _2990;
    wire _2989;
    wire _2988;
    wire _2987;
    wire [2:0] _2985;
    wire [2:0] _2984;
    wire [2:0] _2983;
    wire [2:0] _2982;
    reg [2:0] _2986;
    reg _2995;
    wire [7:0] _2997;
    wire [1:0] _1659;
    wire [1:0] _1658;
    wire [1:0] _1657;
    wire [1:0] _1656;
    reg [1:0] _1660;
    wire [1:0] _1662;
    reg [7:0] _3000;
    wire [7:0] _3001;
    wire [7:0] _144;
    reg [7:0] _1128;
    wire _1129;
    wire [6:0] _3742;
    wire [7:0] _3743;
    wire _3740;
    wire _3739;
    wire _3738;
    wire _3737;
    wire _3736;
    wire _3735;
    wire _3734;
    wire _3733;
    wire [7:0] _3741;
    wire [3:0] _3725;
    wire [3:0] _3723;
    wire [3:0] _3726;
    wire _3415;
    wire _1759;
    wire _756;
    wire _3375;
    wire _3376;
    wire [1:0] _3379;
    wire _3368;
    wire _3369;
    wire _3370;
    wire _3371;
    wire [1:0] _3373;
    wire [2:0] _3354;
    wire [2:0] _3351;
    wire _3347;
    wire _3345;
    wire _3346;
    wire _3348;
    wire [2:0] _3352;
    wire _3343;
    wire [2:0] _3355;
    wire _3356;
    wire [2:0] _3337;
    wire _3333;
    wire _3331;
    wire _3332;
    wire _3334;
    wire [2:0] _3338;
    wire _3329;
    wire [2:0] _3340;
    wire _3341;
    wire _3357;
    wire _3358;
    wire _3359;
    wire _3325;
    wire [5:0] _3322;
    wire _3323;
    wire _3326;
    wire [15:0] _3318;
    wire _3319;
    wire _3316;
    wire _3320;
    wire _3314;
    wire _3315;
    wire _3321;
    wire _3327;
    wire _3360;
    wire [1:0] _3362;
    wire [1:0] _3364;
    wire [1:0] _3310;
    wire _3306;
    wire [1:0] _3308;
    wire [1:0] _3311;
    wire _3086;
    wire _3087;
    wire _145;
    reg _3004;
    wire _3236;
    wire _3234;
    wire _3235;
    reg _3237;
    wire [2:0] _147;
    wire [2:0] _3218;
    wire [2:0] _3219;
    wire [2:0] _3214;
    wire _3210;
    wire _3208;
    wire _3209;
    wire _3211;
    wire [2:0] _3215;
    wire _3206;
    wire [2:0] _3220;
    wire [2:0] _3221;
    wire [2:0] _3200;
    wire [2:0] _3201;
    wire [2:0] _3196;
    wire _3082;
    wire _3081;
    wire _3080;
    wire _3079;
    wire _3078;
    wire _3077;
    wire _3076;
    wire _3072;
    wire _3071;
    wire _3070;
    wire _3069;
    wire _3068;
    wire _3067;
    wire _3066;
    wire [7:0] _3063;
    wire [6:0] _2430;
    wire [7:0] _2431;
    wire [6:0] _2428;
    wire [7:0] _2429;
    wire [7:0] _2432;
    wire [7:0] _3092;
    wire [7:0] _3093;
    wire [7:0] _3094;
    wire [7:0] _3088;
    wire [7:0] _3089;
    wire [7:0] _3090;
    wire [7:0] _3091;
    wire [7:0] _3095;
    wire [7:0] _148;
    reg [7:0] g_byte;
    wire _1756;
    wire _1753;
    wire _1754;
    wire _1757;
    wire [7:0] _3064;
    wire _3065;
    wire [7:0] _3073;
    wire _150;
    wire [7:0] _3074;
    wire _3075;
    wire [2:0] _3103;
    wire [2:0] _3104;
    wire [2:0] _3105;
    wire [2:0] _3106;
    wire [2:0] _3097;
    wire [2:0] _3098;
    wire [2:0] _3099;
    wire [2:0] _3100;
    wire [2:0] _3101;
    wire [2:0] _3107;
    wire [2:0] _3109;
    wire [2:0] _151;
    reg [2:0] g_bitpos;
    reg _3083;
    wire _153;
    wire [31:0] _155;
    wire [30:0] _3151;
    wire [31:0] _3153;
    wire _3145;
    wire _3146;
    wire [31:0] _3148;
    wire [30:0] _3142;
    wire [31:0] _3144;
    wire [31:0] _3149;
    wire [31:0] _3150;
    wire [5:0] _157;
    wire [5:0] _3119;
    wire [5:0] _3120;
    wire [5:0] _3121;
    wire [5:0] _3122;
    wire [5:0] _3113;
    wire [5:0] _3114;
    wire [5:0] _3115;
    wire [5:0] _3116;
    wire [5:0] _3117;
    wire [5:0] _3123;
    wire [5:0] _3124;
    wire [5:0] _3126;
    wire [5:0] _158;
    reg [5:0] g_left;
    wire _771;
    wire _772;
    wire _2855;
    wire _2854;
    wire _2856;
    wire _2857;
    wire [31:0] _3154;
    wire [31:0] _3155;
    wire [31:0] _3156;
    wire [31:0] _160;
    wire _3133;
    wire _3134;
    wire [31:0] _3136;
    wire [30:0] _3130;
    wire [31:0] _3132;
    wire [31:0] _3137;
    wire [30:0] _3127;
    wire [31:0] _3129;
    wire [31:0] _3138;
    wire [31:0] _3139;
    wire [31:0] _3140;
    wire [31:0] _3141;
    wire [31:0] _3157;
    wire [31:0] _3158;
    wire [31:0] _3160;
    wire [31:0] _161;
    reg [31:0] g_crc;
    wire _2861;
    wire _2862;
    wire [15:0] _163;
    wire [15:0] _3180;
    wire _741;
    wire _746;
    wire [15:0] _3181;
    wire _740;
    wire [15:0] _3182;
    wire _3163;
    wire _3161;
    wire _3162;
    wire _3164;
    wire _3166;
    wire _164;
    reg g_last;
    wire _624;
    wire _621;
    wire _625;
    wire _3168;
    wire _3169;
    wire _3170;
    wire _3172;
    wire _165;
    reg g_prev;
    wire _618;
    wire _615;
    wire _619;
    wire _626;
    wire _627;
    wire _628;
    wire [15:0] _3183;
    wire [15:0] _3174;
    wire [15:0] _3175;
    wire [15:0] _3176;
    wire [15:0] _3177;
    wire [15:0] _3178;
    wire [15:0] _3184;
    wire [15:0] _3186;
    wire [15:0] _166;
    reg [15:0] g_cnt;
    wire g_data_left;
    wire _3084;
    wire _3085;
    wire _3192;
    wire _3190;
    wire _3191;
    wire _3193;
    wire [2:0] _3197;
    wire _3188;
    wire [2:0] _3202;
    wire [2:0] _3203;
    wire [2:0] _3204;
    wire [2:0] _3222;
    wire [2:0] _3224;
    wire [2:0] _167;
    reg [2:0] g_run;
    wire _612;
    wire [1:0] _169;
    wire _607;
    wire _608;
    wire _613;
    wire _766;
    wire _773;
    wire _3238;
    wire _3239;
    wire _761;
    wire _759;
    wire _762;
    wire _763;
    wire _764;
    wire _3231;
    wire _3228;
    wire _3225;
    wire _3226;
    wire _3229;
    wire _3230;
    wire _3232;
    wire _3240;
    wire _3242;
    wire _3244;
    wire _3246;
    wire _3248;
    wire _170;
    reg f_lane1_out;
    wire _596;
    wire _597;
    wire _590;
    wire _591;
    wire _587;
    wire _172;
    wire _584;
    wire _585;
    wire _586;
    wire _588;
    wire _592;
    wire _593;
    wire _598;
    wire [1:0] _3313;
    wire _579;
    wire _580;
    wire _575;
    wire _574;
    wire _573;
    wire _572;
    wire _571;
    wire _570;
    wire _569;
    wire _568;
    reg _576;
    wire _577;
    wire _566;
    wire _565;
    wire _564;
    wire _563;
    wire _562;
    wire _561;
    wire _560;
    wire _559;
    wire [2:0] _174;
    reg _567;
    wire _578;
    wire _176;
    wire _581;
    wire _557;
    wire _554;
    wire _547;
    wire _545;
    wire [13:0] _536;
    wire [15:0] _537;
    wire [14:0] _533;
    wire [15:0] _534;
    wire [15:0] _538;
    wire [14:0] _530;
    wire [15:0] _531;
    wire _528;
    wire [15:0] _539;
    reg [15:0] _542;
    wire _543;
    wire [13:0] _520;
    wire [15:0] _521;
    reg [15:0] _524;
    wire _3294;
    wire _3295;
    wire [15:0] _3296;
    wire [15:0] _3298;
    wire [15:0] _3300;
    wire _3278;
    wire [14:0] _549;
    wire [15:0] _550;
    reg [15:0] _553;
    wire [16:0] _3274;
    wire _3275;
    wire [16:0] _3268;
    reg [16:0] _3271;
    wire [16:0] _3263;
    wire [15:0] _178;
    wire [16:0] _3262;
    wire [16:0] _3264;
    reg [16:0] _3267;
    wire [7:0] _180;
    wire [8:0] _3282;
    wire [7:0] _3284;
    wire [7:0] _3285;
    wire [7:0] _3286;
    wire [7:0] _3288;
    wire [7:0] _181;
    reg [7:0] _3256;
    wire [8:0] _3281;
    wire [8:0] _3283;
    wire _3289;
    wire _3290;
    wire _3291;
    wire _3293;
    wire _182;
    reg _3261;
    wire [16:0] _3272;
    wire [16:0] _3258;
    wire _3273;
    wire _3276;
    wire _3279;
    wire _3257;
    wire _3280;
    wire [15:0] _3302;
    wire _3252;
    wire _3250;
    wire _637;
    wire _3249;
    wire _3251;
    wire _3253;
    wire [15:0] _3303;
    wire [15:0] _3305;
    wire [15:0] _183;
    reg [15:0] _518;
    wire _525;
    wire _526;
    wire _515;
    wire _527;
    wire _544;
    wire _546;
    wire _555;
    wire [1:0] _185;
    wire _511;
    wire _512;
    wire _509;
    wire _513;
    wire _506;
    wire _502;
    wire _501;
    wire _500;
    wire _499;
    wire _498;
    wire _497;
    wire _496;
    wire _495;
    reg _503;
    wire _493;
    wire _492;
    wire _491;
    wire _490;
    wire _489;
    wire _488;
    wire _487;
    wire _486;
    wire [2:0] _187;
    reg _494;
    wire _504;
    wire _505;
    wire _507;
    wire _514;
    wire _558;
    wire _189;
    wire _582;
    wire _191;
    wire _485;
    wire _583;
    wire [1:0] _3365;
    wire _754;
    wire [1:0] _3367;
    wire _3111;
    wire [1:0] _3374;
    wire _479;
    wire [1:0] _3380;
    wire _476;
    wire _477;
    wire [1:0] _3382;
    wire [1:0] _192;
    reg [1:0] g_mode;
    wire _484;
    wire _757;
    wire _765;
    wire _1758;
    wire _1760;
    wire _1751;
    wire _677;
    wire _3711;
    wire _3712;
    wire [1:0] _3715;
    wire _3704;
    wire _3705;
    wire _3706;
    wire _3707;
    wire [1:0] _3709;
    wire [2:0] _3690;
    wire [2:0] _3687;
    wire _3683;
    wire _3681;
    wire _3682;
    wire _3684;
    wire [2:0] _3688;
    wire _3679;
    wire [2:0] _3691;
    wire _3692;
    wire [2:0] _3673;
    wire _3669;
    wire _3667;
    wire _3668;
    wire _3670;
    wire [2:0] _3674;
    wire _3665;
    wire [2:0] _3676;
    wire _3677;
    wire _3693;
    wire _3694;
    wire _3695;
    wire _3661;
    wire _3659;
    wire _3662;
    wire [15:0] _3654;
    wire _3655;
    wire _3652;
    wire _3656;
    wire _3650;
    wire _3651;
    wire _3657;
    wire _3663;
    wire _3696;
    wire [1:0] _3698;
    wire [1:0] _3700;
    wire [1:0] _3646;
    wire _3642;
    wire [1:0] _3644;
    wire [1:0] _3647;
    wire _3410;
    wire _3411;
    wire _193;
    reg _3385;
    wire _3568;
    wire _3566;
    wire _3567;
    reg _3569;
    wire [2:0] _195;
    wire [2:0] _3550;
    wire [2:0] _3551;
    wire [2:0] _3546;
    wire _3542;
    wire _3540;
    wire _3541;
    wire _3543;
    wire [2:0] _3547;
    wire _3538;
    wire [2:0] _3552;
    wire [2:0] _3553;
    wire [2:0] _3532;
    wire [2:0] _3533;
    wire [2:0] _3528;
    wire _3406;
    wire _3405;
    wire _3404;
    wire _3403;
    wire _3402;
    wire _3401;
    wire _3400;
    wire _3396;
    wire _3395;
    wire _3394;
    wire _3393;
    wire _3392;
    wire _3391;
    wire _3390;
    wire _3058;
    wire _3059;
    reg [7:0] _3060;
    wire _3052;
    wire _3053;
    reg [7:0] _3054;
    wire _3046;
    wire _3047;
    reg [7:0] _3048;
    wire _3040;
    wire _3041;
    reg [7:0] _3042;
    wire _3034;
    wire _3035;
    reg [7:0] _3036;
    wire _3028;
    wire _3029;
    reg [7:0] _3030;
    wire _3022;
    wire _3023;
    reg [7:0] _3024;
    wire [2:0] _3413;
    wire [2:0] _3414;
    wire [2:0] _196;
    reg [2:0] _3014;
    wire _3016;
    wire _3017;
    wire [7:0] _198;
    reg [7:0] _3018;
    wire [2:0] _3418;
    wire [2:0] _3419;
    wire [2:0] _199;
    reg [2:0] _3007;
    reg [7:0] _3061;
    wire [7:0] _3387;
    wire [6:0] _2456;
    wire [7:0] _2457;
    wire [6:0] _2454;
    wire [7:0] _2455;
    wire [7:0] _2458;
    wire [7:0] _3424;
    wire [7:0] _3425;
    wire [7:0] _3426;
    wire [7:0] _3420;
    wire [7:0] _3421;
    wire [7:0] _3422;
    wire [7:0] _3423;
    wire [7:0] _3427;
    wire [7:0] _200;
    reg [7:0] g_byte_0;
    wire _1748;
    wire _1745;
    wire _1746;
    wire _1749;
    wire [7:0] _3388;
    wire _3389;
    wire [7:0] _3397;
    wire _202;
    wire [7:0] _3398;
    wire _3399;
    wire [2:0] _3435;
    wire [2:0] _3436;
    wire [2:0] _3437;
    wire [2:0] _3438;
    wire [2:0] _3429;
    wire [2:0] _3430;
    wire [2:0] _3431;
    wire [2:0] _3432;
    wire [2:0] _3433;
    wire [2:0] _3439;
    wire [2:0] _3441;
    wire [2:0] _203;
    reg [2:0] g_bitpos_0;
    reg _3407;
    wire _205;
    wire [31:0] _207;
    wire [30:0] _3483;
    wire [31:0] _3485;
    wire _3477;
    wire _3478;
    wire [31:0] _3480;
    wire [30:0] _3474;
    wire [31:0] _3476;
    wire [31:0] _3481;
    wire [31:0] _3482;
    wire [5:0] _209;
    wire [5:0] _3451;
    wire [5:0] _3452;
    wire [5:0] _3453;
    wire [5:0] _3454;
    wire [5:0] _3445;
    wire [5:0] _3446;
    wire [5:0] _3447;
    wire [5:0] _3448;
    wire [5:0] _3449;
    wire [5:0] _3455;
    wire [5:0] _3456;
    wire [5:0] _3458;
    wire [5:0] _210;
    reg [5:0] g_left_0;
    wire _692;
    wire _693;
    wire _2920;
    wire _2919;
    wire _2921;
    wire _2922;
    wire [31:0] _3486;
    wire [31:0] _3487;
    wire [31:0] _3488;
    wire [31:0] _212;
    wire _3465;
    wire _3466;
    wire [31:0] _3468;
    wire [30:0] _3462;
    wire [31:0] _3464;
    wire [31:0] _3469;
    wire [30:0] _3459;
    wire [31:0] _3461;
    wire [31:0] _3470;
    wire [31:0] _3471;
    wire [31:0] _3472;
    wire [31:0] _3473;
    wire [31:0] _3489;
    wire [31:0] _3490;
    wire [31:0] _3492;
    wire [31:0] _213;
    reg [31:0] g_crc_0;
    wire _2926;
    wire _2927;
    wire [15:0] _215;
    wire [15:0] _3512;
    wire _662;
    wire _667;
    wire [15:0] _3513;
    wire _661;
    wire [15:0] _3514;
    wire _3495;
    wire _3493;
    wire _3494;
    wire _3496;
    wire _3498;
    wire _216;
    reg g_last_0;
    wire _463;
    wire _459;
    wire _464;
    wire _3500;
    wire _3501;
    wire _3502;
    wire _3504;
    wire _217;
    reg g_prev_0;
    wire _456;
    wire _453;
    wire _457;
    wire _465;
    wire _466;
    wire _467;
    wire [15:0] _3515;
    wire [15:0] _3506;
    wire [15:0] _3507;
    wire [15:0] _3508;
    wire [15:0] _3509;
    wire [15:0] _3510;
    wire [15:0] _3516;
    wire [15:0] _3518;
    wire [15:0] _218;
    reg [15:0] g_cnt_0;
    wire g_data_left_0;
    wire _3408;
    wire _3409;
    wire _3524;
    wire _3522;
    wire _3523;
    wire _3525;
    wire [2:0] _3529;
    wire _3520;
    wire [2:0] _3534;
    wire [2:0] _3535;
    wire [2:0] _3536;
    wire [2:0] _3554;
    wire [2:0] _3556;
    wire [2:0] _219;
    reg [2:0] g_run_0;
    wire _450;
    wire [1:0] _221;
    wire _445;
    wire _446;
    wire _451;
    wire _687;
    wire _694;
    wire _3570;
    wire _3571;
    wire _682;
    wire _680;
    wire _683;
    wire _684;
    wire _685;
    wire _3563;
    wire _3560;
    wire _3557;
    wire _3558;
    wire _3561;
    wire _3562;
    wire _3564;
    wire _3572;
    wire _3574;
    wire _3576;
    wire _3578;
    wire _3580;
    wire _222;
    reg f_lane0_out;
    wire _434;
    wire _435;
    wire _428;
    wire _429;
    wire _425;
    wire _224;
    wire _422;
    wire _423;
    wire _424;
    wire _426;
    wire _430;
    wire _431;
    wire _436;
    wire [1:0] _3649;
    wire _417;
    wire _418;
    wire _413;
    wire _412;
    wire _411;
    wire _410;
    wire _409;
    wire _408;
    wire _407;
    wire _406;
    reg _414;
    wire _415;
    wire _404;
    wire _403;
    wire _402;
    wire _401;
    wire _400;
    wire _399;
    wire _398;
    wire _397;
    wire [2:0] _226;
    reg _405;
    wire _416;
    wire _228;
    wire _419;
    wire _395;
    wire _392;
    wire _385;
    wire _383;
    wire [13:0] _374;
    wire [15:0] _375;
    wire [14:0] _371;
    wire [15:0] _372;
    wire [15:0] _376;
    wire [14:0] _368;
    wire [15:0] _369;
    wire _366;
    wire [15:0] _377;
    reg [15:0] _380;
    wire _381;
    wire [13:0] _358;
    wire [15:0] _359;
    reg [15:0] _362;
    wire _3626;
    wire _3627;
    wire [15:0] _3628;
    wire [15:0] _3630;
    wire [15:0] _3632;
    wire _3610;
    wire [14:0] _387;
    wire [15:0] _388;
    reg [15:0] _391;
    wire [16:0] _3606;
    wire _3607;
    wire [16:0] _3600;
    reg [16:0] _3603;
    wire [15:0] _230;
    wire [16:0] _3594;
    wire [16:0] _3596;
    reg [16:0] _3599;
    wire [7:0] _232;
    wire [8:0] _3614;
    wire [7:0] _3616;
    wire [7:0] _3617;
    wire [7:0] _3618;
    wire [7:0] _3620;
    wire [7:0] _233;
    reg [7:0] _3588;
    wire [8:0] _3613;
    wire [8:0] _3615;
    wire _3621;
    wire _3622;
    wire _3623;
    wire _3625;
    wire _234;
    reg _3593;
    wire [16:0] _3604;
    wire [16:0] _3590;
    wire _3605;
    wire _3608;
    wire _3611;
    wire _3589;
    wire _3612;
    wire [15:0] _3634;
    wire _3584;
    wire _3582;
    wire _649;
    wire _3581;
    wire _3583;
    wire _3585;
    wire [15:0] _3635;
    wire [15:0] _3637;
    wire [15:0] _235;
    reg [15:0] _356;
    wire _363;
    wire _364;
    wire _353;
    wire _365;
    wire _382;
    wire _384;
    wire _393;
    wire [1:0] _237;
    wire _349;
    wire _350;
    wire _347;
    wire _351;
    wire _344;
    wire _340;
    wire _339;
    wire _338;
    wire _337;
    wire _336;
    wire _335;
    wire _334;
    wire _333;
    reg _341;
    wire _328;
    wire _327;
    wire _326;
    wire _325;
    wire _324;
    wire _323;
    wire _322;
    wire _321;
    wire [2:0] _239;
    reg _329;
    wire _342;
    wire _343;
    wire _345;
    wire _352;
    wire _396;
    wire _241;
    wire _420;
    wire _243;
    wire _314;
    wire _421;
    wire [1:0] _3701;
    wire _675;
    wire [1:0] _3703;
    wire _3443;
    wire [1:0] _3710;
    wire _307;
    wire [1:0] _3716;
    wire [2:0] _2574;
    wire [2:0] _2573;
    wire [2:0] _2572;
    wire [2:0] _2571;
    reg [2:0] _2575;
    wire _2567;
    wire _2566;
    wire _2565;
    wire _2564;
    reg _2568;
    wire _3638;
    wire _3639;
    wire [2:0] _3641;
    wire [2:0] _244;
    wire _304;
    wire _305;
    wire [1:0] _3718;
    wire [1:0] _245;
    reg [1:0] g_mode_0;
    wire _313;
    wire _678;
    wire _686;
    wire _1750;
    wire _1752;
    wire _1761;
    wire _1742;
    wire _1740;
    wire _1743;
    wire _3719;
    wire _3720;
    wire _246;
    wire _3416;
    wire _2520;
    wire _3010;
    wire _248;
    wire _3011;
    wire _3721;
    wire [3:0] _3727;
    reg [3:0] _3730;
    wire [3:0] _249;
    wire _1131;
    wire [7:0] _3732;
    wire [1:0] _1737;
    wire [1:0] _1735;
    wire [1:0] _1734;
    wire [1:0] _1733;
    wire [1:0] _1732;
    reg [1:0] _1736;
    wire [1:0] _1738;
    reg [7:0] _3744;
    wire [7:0] _3745;
    wire [7:0] _250;
    reg [7:0] _1124;
    wire _1125;
    wire [7:0] _3756;
    wire [7:0] _3755;
    wire [7:0] _3754;
    wire [1:0] _3751;
    wire [1:0] _3749;
    wire [1:0] _3748;
    wire [1:0] _3747;
    wire [1:0] _3746;
    reg [1:0] _3750;
    wire [1:0] _3752;
    reg [7:0] _3757;
    wire [7:0] _3758;
    wire [7:0] _251;
    reg [7:0] _1119;
    wire _1121;
    wire [3:0] _1319;
    reg _1320;
    wire _1322;
    wire [15:0] _1314;
    wire _1316;
    wire [15:0] _1305;
    wire [16:0] _1306;
    wire [16:0] _1307;
    reg [16:0] _1310;
    wire _1311;
    wire _1312;
    wire [15:0] _1301;
    wire _1303;
    wire [2:0] _1079;
    wire [2:0] _3773;
    wire _3769;
    wire _3770;
    wire _3767;
    wire _3771;
    wire [2:0] _3774;
    wire _3764;
    wire _3765;
    wire _3763;
    wire _3766;
    wire [2:0] _3776;
    wire _3760;
    wire [2:0] _3762;
    wire _3759;
    wire [2:0] _3777;
    wire [2:0] _252;
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
    wire _1285;
    wire [2:0] _1287;
    wire [2:0] _1058;
    wire [2:0] _3792;
    wire _3788;
    wire _3789;
    wire _3786;
    wire _3790;
    wire [2:0] _3793;
    wire _3783;
    wire _3784;
    wire _3782;
    wire _3785;
    wire [2:0] _3795;
    wire _3779;
    wire [2:0] _3781;
    wire _3778;
    wire [2:0] _3796;
    wire [2:0] _253;
    reg [2:0] _1054;
    wire _1056;
    wire [2:0] _1059;
    wire _1049;
    wire _1050;
    wire _1048;
    wire _1051;
    wire [2:0] _1061;
    wire _1045;
    wire _1046;
    wire [2:0] _1062;
    wire _1282;
    wire [2:0] _1284;
    wire _1288;
    wire [2:0] _1289;
    wire [2:0] _1035;
    wire [2:0] _3811;
    wire _3807;
    wire _3808;
    wire _3805;
    wire _3809;
    wire [2:0] _3812;
    wire _3802;
    wire _3803;
    wire _3801;
    wire _3804;
    wire [2:0] _3814;
    wire _3798;
    wire [2:0] _3800;
    wire _3797;
    wire [2:0] _3815;
    wire [2:0] _254;
    reg [2:0] _1031;
    wire _1033;
    wire [2:0] _1036;
    wire _1026;
    wire _1027;
    wire _1025;
    wire _1028;
    wire [2:0] _1038;
    wire _1022;
    wire _1023;
    wire [2:0] _1039;
    wire _1277;
    wire [2:0] _1279;
    wire [2:0] _1014;
    wire [2:0] _3830;
    wire _3826;
    wire _3827;
    wire _3824;
    wire _3828;
    wire [2:0] _3831;
    wire _3821;
    wire _3822;
    wire _3820;
    wire _3823;
    wire [2:0] _3833;
    wire _3817;
    wire [2:0] _3819;
    wire _3816;
    wire [2:0] _3834;
    wire [2:0] _255;
    reg [2:0] _1010;
    wire _1012;
    wire [2:0] _1015;
    wire _1005;
    wire _1006;
    wire _1004;
    wire _1007;
    wire [2:0] _1017;
    wire _1001;
    wire _1002;
    wire [2:0] _1018;
    wire _1274;
    wire [2:0] _1276;
    wire _1280;
    wire [2:0] _1281;
    wire _1290;
    wire [2:0] _1291;
    wire [2:0] _989;
    wire [2:0] _3849;
    wire _3845;
    wire _3846;
    wire _3843;
    wire _3847;
    wire [2:0] _3850;
    wire _3840;
    wire _3841;
    wire _3839;
    wire _3842;
    wire [2:0] _3852;
    wire _3836;
    wire [2:0] _3838;
    wire _3835;
    wire [2:0] _3853;
    wire [2:0] _256;
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
    wire _1267;
    wire [2:0] _1269;
    wire [2:0] _968;
    wire [2:0] _3868;
    wire _3864;
    wire _3865;
    wire _3862;
    wire _3866;
    wire [2:0] _3869;
    wire _3859;
    wire _3860;
    wire _3858;
    wire _3861;
    wire [2:0] _3871;
    wire _3855;
    wire [2:0] _3857;
    wire _3854;
    wire [2:0] _3872;
    wire [2:0] _257;
    reg [2:0] _964;
    wire _966;
    wire [2:0] _969;
    wire _959;
    wire _960;
    wire _958;
    wire _961;
    wire [2:0] _971;
    wire _955;
    wire _956;
    wire [2:0] _972;
    wire _1264;
    wire [2:0] _1266;
    wire _1270;
    wire [2:0] _1271;
    wire [2:0] _945;
    wire [2:0] _3887;
    wire _3883;
    wire _3884;
    wire _3881;
    wire _3885;
    wire [2:0] _3888;
    wire _3878;
    wire _3879;
    wire _3877;
    wire _3880;
    wire [2:0] _3890;
    wire _3874;
    wire [2:0] _3876;
    wire _3873;
    wire [2:0] _3891;
    wire [2:0] _258;
    reg [2:0] _941;
    wire _943;
    wire [2:0] _946;
    wire _936;
    wire _937;
    wire _935;
    wire _938;
    wire [2:0] _948;
    wire _932;
    wire _933;
    wire [2:0] _949;
    wire _1259;
    wire [2:0] _1261;
    wire [2:0] _924;
    wire [2:0] _3906;
    wire _3902;
    wire _3903;
    wire _3900;
    wire _3904;
    wire [2:0] _3907;
    wire _3897;
    wire _3898;
    wire _3896;
    wire _3899;
    wire [2:0] _3909;
    wire _3893;
    wire [2:0] _3895;
    wire _3892;
    wire [2:0] _3910;
    wire [2:0] _259;
    reg [2:0] _920;
    wire _922;
    wire [2:0] _925;
    wire _915;
    wire _916;
    wire _914;
    wire _917;
    wire [2:0] _927;
    wire _911;
    wire _912;
    wire [2:0] _928;
    wire [7:0] _1255;
    wire _1256;
    wire [2:0] _1258;
    wire _1262;
    wire [2:0] _1263;
    wire _1272;
    wire [2:0] _1273;
    wire _1292;
    wire [2:0] _1293;
    wire [16:0] _1294;
    wire _3913;
    wire [127:0] _3914;
    wire _3911;
    wire [127:0] _3915;
    wire [127:0] _260;
    reg [127:0] _848;
    wire _900;
    wire _901;
    wire [127:0] _902;
    wire _3918;
    wire [127:0] _3919;
    wire _3916;
    wire [127:0] _3920;
    wire [127:0] _261;
    reg [127:0] _845;
    wire _896;
    wire _897;
    wire [127:0] _898;
    wire _3923;
    wire [127:0] _3924;
    wire _3921;
    wire [127:0] _3925;
    wire [127:0] _262;
    reg [127:0] _842;
    wire _892;
    wire _893;
    wire [127:0] _894;
    wire _3966;
    wire _3960;
    wire _264;
    wire _3959;
    wire f_store_we;
    wire [127:0] _266;
    reg [127:0] _3962[0:255];
    wire [1:0] _3956;
    wire [5:0] _268;
    wire [111:0] _1214;
    wire [5:0] _3938;
    wire [111:0] _1208;
    wire [5:0] _3937;
    wire [5:0] _3936;
    wire [5:0] _3935;
    reg [5:0] _3939;
    wire _3940;
    wire _3941;
    wire [5:0] _3942;
    wire [5:0] _270;
    wire [5:0] _3929;
    wire [5:0] _271;
    reg [5:0] _3928;
    wire [1:0] f_policy;
    wire _3932;
    wire [5:0] _3933;
    wire [5:0] _3934;
    wire [5:0] _3943;
    wire _3930;
    wire [5:0] _3944;
    wire [5:0] _3945;
    wire [5:0] _272;
    reg [5:0] _1711;
    wire [7:0] _3957;
    wire [12:0] _3949;
    wire [12:0] _3947;
    wire [12:0] _3950;
    wire [12:0] _273;
    reg [12:0] f_sw_cnt;
    wire [7:0] _3954;
    wire [7:0] _275;
    wire [7:0] _3955;
    wire _3952;
    wire _3953;
    wire [7:0] _3958;
    wire [127:0] _3963;
    reg [127:0] _3967;
    wire [127:0] _276;
    wire _888;
    wire _889;
    wire [127:0] _890;
    wire [511:0] _903;
    wire [111:0] _1251;
    wire [15:0] _1252;
    wire [16:0] _1253;
    wire [16:0] _1295;
    reg [16:0] _1298;
    wire gnd;
    wire [16:0] _1250;
    wire _1299;
    wire _1300;
    wire _1304;
    wire _1313;
    wire [15:0] _3995;
    wire _3991;
    wire _3992;
    wire _3993;
    wire [15:0] _3996;
    wire _3975;
    wire _3976;
    wire [15:0] _3998;
    wire [15:0] _4000;
    wire [15:0] _277;
    reg [15:0] _882;
    wire [15:0] _4012;
    wire _4008;
    wire _4009;
    wire [8:0] _3987;
    wire _3988;
    wire [5:0] _3985;
    wire [5:0] _3984;
    wire _3986;
    wire [8:0] _3979;
    wire [8:0] _4001;
    wire [8:0] _4002;
    wire [8:0] _4004;
    wire [8:0] _278;
    reg [8:0] _3980;
    wire [2:0] _3981;
    wire _3983;
    wire [1:0] _3977;
    reg _3989;
    wire _4010;
    wire [15:0] _4013;
    wire _4005;
    wire _4006;
    wire [15:0] _4015;
    wire [15:0] _4017;
    wire [15:0] _279;
    reg [15:0] _879;
    wire [1:0] _1246;
    reg [15:0] _1247;
    wire _1249;
    wire _1317;
    reg [7:0] _332;
    wire [7:0] f_chg_now;
    wire _4019;
    wire [7:0] _4021;
    wire _4018;
    wire [7:0] _4022;
    wire [7:0] _4024;
    wire [7:0] _280;
    reg [7:0] _864;
    wire [7:0] f_changed_all;
    wire [7:0] _1240;
    wire _1242;
    wire _1243;
    wire [7:0] f_chgmask1;
    wire _1239;
    wire _1244;
    wire [7:0] _1233;
    wire [7:0] _1231;
    wire vdd;
    wire _282;
    wire _284;
    wire [7:0] _286;
    reg [7:0] _317;
    reg [7:0] _320;
    wire [7:0] _1232;
    wire [7:0] _1234;
    wire _1236;
    wire [111:0] _1202;
    wire f_valid1;
    wire _1237;
    wire _1245;
    wire _1318;
    wire _1323;
    wire _1362;
    wire _1363;
    wire _1367;
    wire f_fire1;
    wire [1:0] _1653;
    wire [1:0] f_winner;
    reg [2:0] _3972;
    wire [2:0] _3974;
    wire _4025;
    wire _833;
    wire f_in_fetch;
    wire _834;
    wire _1648;
    wire _4026;
    wire [15:0] _4035;
    wire [15:0] _4037;
    wire [15:0] _287;
    reg [15:0] _876;
    wire [1:0] _1882;
    reg [15:0] _1883;
    wire [15:0] _1881;
    wire _1884;
    wire [63:0] _1197;
    wire _1879;
    wire _1877;
    wire _1878;
    wire _1880;
    wire _1885;
    wire _1890;
    wire _1898;
    wire f_viol_now;
    wire [2:0] _4043;
    wire [2:0] _4046;
    wire _4039;
    wire [2:0] _4047;
    wire _4038;
    wire [2:0] _4050;
    wire [2:0] _4052;
    wire [2:0] _288;
    reg [2:0] _831;
    wire _4055;
    wire [127:0] _4056;
    wire _4053;
    wire [127:0] _4057;
    wire [127:0] _289;
    reg [127:0] _839;
    wire [511:0] _849;
    wire [111:0] _850;
    wire f_valid0;
    wire _858;
    wire _872;
    wire _1115;
    wire _1142;
    wire _1186;
    wire f_in_eval;
    wire _1187;
    wire _1196;
    wire f_fire0;
    wire _1369;
    wire _1508;
    wire _1647;
    wire [1:0] _4076;
    wire _4061;
    wire [1:0] _4063;
    wire _4059;
    wire [1:0] _4077;
    wire _4058;
    wire [1:0] _4080;
    wire _291;
    wire [1:0] _4082;
    wire [1:0] _4084;
    wire [1:0] _292;
    reg [1:0] _826;
    wire _1780;
    wire _294;
    wire _2681;
    wire _2683;
    wire _4086;
    wire _4096;
    wire _295;
    reg f_sweeping;
    wire _4108;
    wire _296;
    reg f_image_valid;
    wire _298;
    wire _1836;
    wire [7:0] _4132;
    wire [7:0] _299;
    reg [7:0] f_pout;
    wire _2606;
    wire [23:0] _301;
    wire [2:0] _2602;
    reg _2613;
    wire [7:0] _2677;
    wire [7:0] _4134;
    assign _438 = 3'b000;
    assign _468 = 3'b001;
    assign _469 = _467 ? _468 : _443;
    assign _441 = 3'b100;
    assign _440 = 3'b010;
    assign _442 = f_lane0_out ? _441 : _440;
    assign _443 = _436 ? _442 : _439;
    assign _470 = _421 ? _469 : _443;
    assign _472 = _307 ? _438 : _470;
    assign _474 = _305 ? _438 : _472;
    assign _1 = _474;
    always @(posedge _284) begin
        if (_282)
            _439 <= _438;
        else
            _439 <= _1;
    end
    assign _659 = { _649,
                    _652,
                    _655,
                    _658,
                    gnd,
                    _439 };
    assign _630 = _628 ? _468 : _605;
    assign _604 = f_lane1_out ? _441 : _440;
    assign _605 = _598 ? _604 : _601;
    assign _631 = _583 ? _630 : _605;
    assign _633 = _479 ? _438 : _631;
    assign _635 = _477 ? _438 : _633;
    assign _2 = _635;
    always @(posedge _284) begin
        if (_282)
            _601 <= _438;
        else
            _601 <= _2;
    end
    assign _647 = { _637,
                    _640,
                    _643,
                    _646,
                    gnd,
                    _601 };
    assign _660 = { _647,
                    _659 };
    assign _726 = 8'b00000000;
    assign _732 = 8'b00000001;
    assign _733 = _727 + _732;
    assign _728 = 8'b11111111;
    assign _729 = _727 == _728;
    assign _730 = ~ _729;
    assign _722 = ~ _673;
    assign _719 = _702 == _438;
    assign _720 = ~ _719;
    assign _716 = _313 | _649;
    assign _713 = ~ _675;
    assign _714 = _305 & _713;
    assign _715 = _714 & _243;
    assign _717 = _715 & _716;
    assign _721 = _717 & _720;
    assign _723 = _721 & _722;
    assign _712 = _709 & _711;
    assign _724 = _712 | _723;
    assign _731 = _724 & _730;
    assign _734 = _731 ? _733 : _727;
    assign _736 = _9 ? _726 : _734;
    assign _4 = _736;
    always @(posedge _284) begin
        if (_282)
            _727 <= _726;
        else
            _727 <= _4;
    end
    assign _817 = _811 + _732;
    assign _813 = _811 == _728;
    assign _814 = ~ _813;
    assign _806 = ~ _752;
    assign _803 = _781 == _438;
    assign _804 = ~ _803;
    assign _800 = _484 | _637;
    assign _797 = ~ _754;
    assign _798 = _477 & _797;
    assign _799 = _798 & _191;
    assign _801 = _799 & _800;
    assign _805 = _801 & _804;
    assign _807 = _805 & _806;
    assign _795 = _792 & _711;
    assign _796 = _794 | _795;
    assign _808 = _796 | _807;
    assign _815 = _808 & _814;
    assign _818 = _815 ? _817 : _811;
    assign _820 = _9 ? _726 : _818;
    assign _5 = _820;
    always @(posedge _284) begin
        if (_282)
            _811 <= _726;
        else
            _811 <= _5;
    end
    assign _1685 = _1679 + _732;
    assign _1681 = _1679 == _728;
    assign _1682 = ~ _1681;
    assign _1675 = _1672 & _711;
    assign _1676 = _1674 | _1675;
    assign _1683 = _1676 & _1682;
    assign _1686 = _1683 ? _1685 : _1679;
    assign _1688 = _9 ? _726 : _1686;
    assign _6 = _1688;
    always @(posedge _284) begin
        if (_282)
            _1679 <= _726;
        else
            _1679 <= _6;
    end
    assign _1700 = _1694 + _732;
    assign _1696 = _1694 == _728;
    assign _1697 = ~ _1696;
    assign _1698 = _1691 & _1697;
    assign _1701 = _1698 ? _1700 : _1694;
    assign _1703 = _9 ? _726 : _1701;
    assign _7 = _1703;
    always @(posedge _284) begin
        if (_282)
            _1694 <= _726;
        else
            _1694 <= _7;
    end
    assign _1727 = _1721 + _732;
    assign _1723 = _1721 == _728;
    assign _1724 = ~ _1723;
    assign _1725 = _1718 & _1724;
    assign _1728 = _1725 ? _1727 : _1721;
    assign _9 = host_drop_clear;
    assign _1730 = _9 ? _726 : _1728;
    assign _10 = _1730;
    always @(posedge _284) begin
        if (_282)
            _1721 <= _726;
        else
            _1721 <= _10;
    end
    assign _1731 = { _1721,
                     _1694,
                     _1679,
                     _811,
                     _727 };
    assign _1764 = 1'b0;
    assign _1766 = 1'b1;
    assign _1744 = _1648 & _1743;
    assign _1762 = _1744 & _1761;
    assign _1767 = _1762 ? _1766 : _1765;
    assign _1769 = _24 ? _1764 : _1767;
    assign _12 = _1769;
    always @(posedge _284) begin
        if (_282)
            _1765 <= _1764;
        else
            _1765 <= _12;
    end
    assign _1778 = { _1776,
                     _1777 };
    assign _1829 = _1825 ? _1817 : _1828;
    assign _1831 = _24 ? _438 : _1829;
    assign _17 = _1831;
    always @(posedge _284) begin
        if (_282)
            _1828 <= _438;
        else
            _1828 <= _17;
    end
    assign _1824 = ~ _1823;
    assign _1814 = _1782 ? _468 : _440;
    assign _1810 = 3'b011;
    assign _1811 = _1798 ? _1810 : _441;
    assign _1815 = _1793 ? _1814 : _1811;
    assign _1808 = 3'b101;
    assign _1816 = _1802 ? _1815 : _1808;
    assign _1803 = _264 | _47;
    assign _1804 = _1803 | _22;
    assign _1805 = f_sweeping & _1804;
    assign _1799 = ~ f_image_valid;
    assign _1800 = _298 & _1799;
    assign _1776 = _509 | _484;
    assign _1796 = _20[1:1];
    assign _1797 = _1796 & _1776;
    assign _1777 = _347 | _313;
    assign _20 = host_lane_we;
    assign _1794 = _20[0:0];
    assign _1795 = _1794 & _1777;
    assign _1798 = _1795 | _1797;
    assign _1801 = _1798 | _1800;
    assign _1790 = _1707 | _1789;
    assign _1786 = _47 & _1780;
    assign _1791 = _1786 & _1790;
    assign _1784 = ~ _1780;
    assign _22 = host_cov_re;
    assign _1783 = _47 | _22;
    assign _1785 = _1783 & _1784;
    assign _1792 = _1785 | _1791;
    assign _1781 = ~ _1780;
    assign _1782 = _264 & _1781;
    assign _1793 = _1782 | _1792;
    assign _1802 = _1793 | _1801;
    assign _1806 = _1802 | _1805;
    assign _1817 = _1806 ? _1816 : _438;
    assign _1819 = _1817 == _438;
    assign _1820 = ~ _1819;
    assign _1825 = _1820 & _1824;
    assign _1833 = _1825 ? _1766 : _1823;
    assign _24 = host_err_clear;
    assign _1835 = _24 ? _1764 : _1833;
    assign _25 = _1835;
    always @(posedge _284) begin
        if (_282)
            _1823 <= _1764;
        else
            _1823 <= _25;
    end
    assign _1716 = _1712 == _1715;
    assign _1717 = ~ _1716;
    assign _1708 = _1704 & _1707;
    assign _1718 = _1708 & _1717;
    assign _1841 = _1718 ? _1766 : _1839;
    assign _1843 = _1836 ? _1764 : _1841;
    assign _27 = _1843;
    always @(posedge _284) begin
        if (_282)
            _1839 <= _1764;
        else
            _1839 <= _27;
    end
    assign _1691 = _78 & _1690;
    assign _1848 = _1691 ? _1766 : _1846;
    assign _1850 = _1836 ? _1764 : _1848;
    assign _29 = _1850;
    always @(posedge _284) begin
        if (_282)
            _1846 <= _1764;
        else
            _1846 <= _29;
    end
    assign _1673 = ~ _1672;
    assign _1666 = _823 & _1665;
    assign _1674 = _1666 & _1673;
    assign _793 = ~ _792;
    assign _789 = _739 & _788;
    assign _794 = _789 & _793;
    assign _1851 = _794 | _1674;
    assign _31 = _1851;
    assign _1852 = _142 & _711;
    assign _1853 = _1852 | _31;
    assign _1858 = _1853 ? _1766 : _1856;
    assign _1860 = _1836 ? _1764 : _1858;
    assign _32 = _1860;
    always @(posedge _284) begin
        if (_282)
            _1856 <= _1764;
        else
            _1856 <= _32;
    end
    assign _1864 = _1197[61:61];
    assign _1865 = _834 & _1864;
    assign _1870 = _1865 ? _1766 : _1868;
    assign _36 = host_irq_ack;
    assign _1872 = _36 ? _1764 : _1870;
    assign _1874 = _1836 ? _1764 : _1872;
    assign _37 = _1874;
    always @(posedge _284) begin
        if (_282)
            _1868 <= _1764;
        else
            _1868 <= _37;
    end
    assign _1903 = f_policy == _1902;
    assign _1905 = _1903 ? _1766 : _1863;
    assign _1901 = f_policy == _2524;
    assign _1907 = _1901 ? _1766 : _1905;
    assign _1908 = f_viol_now ? _1907 : _1863;
    assign _1909 = _1647 ? _1863 : _1908;
    assign _1876 = _826 == _1987;
    assign _1910 = _1876 ? _1909 : _1863;
    assign _1912 = _1836 ? _1764 : _1910;
    assign _38 = _1912;
    always @(posedge _284) begin
        if (_282)
            _1863 <= _1764;
        else
            _1863 <= _38;
    end
    assign _1927 = ~ _1926;
    assign _40 = host_tx_wm;
    assign _1920 = { gnd,
                     _40 };
    assign _1921 = _1920 < _249;
    assign _1922 = ~ _1921;
    assign _42 = host_tx_wm_en;
    assign _1923 = _42 & _1922;
    assign _44 = host_rx_wm;
    assign _1914 = _44 == _438;
    assign _1916 = _1914 ? _468 : _44;
    assign _1917 = { gnd,
                     _1916 };
    assign _1918 = _143 < _1917;
    assign _1919 = ~ _1918;
    assign _1924 = _1919 | _1923;
    assign _1928 = _1924 | _1927;
    assign _1929 = _1928 | _1863;
    assign _1930 = _1929 | _1868;
    assign _2032 = ~ f_host_cov_we;
    assign _2031 = ~ _1789;
    assign _2033 = _2031 & _2032;
    assign _2030 = 32'b00000000000000000000000000000000;
    assign _2024 = ~ f_sweeping;
    assign _2022 = ~ _1707;
    assign _2020 = ~ _1789;
    assign _47 = host_cov_we;
    assign _2019 = _47 & _1780;
    assign _2021 = _2019 & _2020;
    assign _2023 = _2021 & _2022;
    assign f_host_cov_we = _2023 & _2024;
    assign _2026 = _1789 | f_host_cov_we;
    assign _2013 = _64[11:0];
    assign _2010 = _2003 < _2000;
    assign _2011 = _1985 & _2010;
    assign _2012 = _2011 ? _2000 : _2003;
    assign _2014 = _2012 < _2013;
    assign _2015 = _2014 ? _2013 : _2012;
    assign _2016 = _1996 ? _2012 : _2015;
    assign _2002 = 12'b000000000000;
    assign _1963 = 12'b111111111111;
    assign _1960 = _1958[11:0];
    assign _1957 = 13'b0000000000000;
    assign _1954 = 10'b0000000000;
    assign _1955 = { _1954,
                     _1951 };
    assign _1956 = _1947 - _1955;
    always @* begin
        case (f_winner)
        0:
            _1931 <= _1156;
        1:
            _1931 <= _1332;
        2:
            _1931 <= _1471;
        default:
            _1931 <= _1610;
        endcase
    end
    assign _48 = _1931;
    always @(posedge _284) begin
        if (_282)
            _1951 <= _438;
        else
            _1951 <= _48;
    end
    assign _1952 = { _1954,
                     _1951 };
    assign _1937 = 13'b1111111111111;
    assign _1936 = _1934[12:0];
    assign _1932 = 16'b0001111111111111;
    assign _1935 = _1932 < _1934;
    assign _1938 = _1935 ? _1937 : _1936;
    assign _49 = _1938;
    always @(posedge _284) begin
        if (_282)
            _1947 <= _1957;
        else
            _1947 <= _49;
    end
    assign _1953 = _1947 < _1952;
    assign _1958 = _1953 ? _1957 : _1956;
    assign _1944 = 13'b0111111111111;
    assign _1959 = _1944 < _1958;
    assign _1962 = _1959 ? _1963 : _1960;
    assign _1939 = 16'b1111111111111111;
    assign _1940 = _1934 == _1939;
    assign _50 = _1940;
    always @(posedge _284) begin
        if (_282)
            _1943 <= _1764;
        else
            _1943 <= _50;
    end
    assign _1964 = _1943 ? _1963 : _1962;
    assign _51 = _1964;
    always @(posedge _284) begin
        if (_282)
            _2003 <= _2002;
        else
            _2003 <= _51;
    end
    assign _1967 = _1934[11:0];
    always @* begin
        case (f_winner)
        0:
            _1933 <= _873;
        1:
            _1933 <= _1246;
        2:
            _1933 <= _1385;
        default:
            _1933 <= _1524;
        endcase
    end
    always @* begin
        case (_1933)
        0:
            _1934 <= _876;
        1:
            _1934 <= _879;
        2:
            _1934 <= _882;
        default:
            _1934 <= _882;
        endcase
    end
    assign _1965 = 16'b0000111111111111;
    assign _1966 = _1965 < _1934;
    assign _1969 = _1966 ? _1963 : _1967;
    assign _52 = _1969;
    always @(posedge _284) begin
        if (_282)
            _2000 <= _2002;
        else
            _2000 <= _52;
    end
    assign _2004 = _2000 < _2003;
    assign _2005 = _1985 & _2004;
    assign _2006 = _2005 ? _2000 : _2003;
    assign _1997 = _64[23:12];
    assign _2007 = _1997 < _2006;
    assign _2008 = _2007 ? _1997 : _2006;
    assign _1996 = _1980 == _726;
    assign _2009 = _1996 ? _2006 : _2008;
    assign _1992 = _1990[7:0];
    assign _1987 = 2'b10;
    assign _1986 = 2'b01;
    assign _1971 = _1712 == _1715;
    assign _1970 = _1704 & _1707;
    assign _1972 = _1970 & _1971;
    assign _53 = _1972;
    always @(posedge _284) begin
        if (_282)
            _1985 <= _1764;
        else
            _1985 <= _53;
    end
    assign _1988 = _1985 ? _1987 : _1986;
    assign _1982 = 7'b0000000;
    assign _1989 = { _1982,
                     _1988 };
    assign _1980 = _64[31:24];
    assign _1981 = { gnd,
                     _1980 };
    assign _1990 = _1981 + _1989;
    assign _1991 = _1990[8:8];
    assign _1994 = _1991 ? _728 : _1992;
    assign _2017 = { _1994,
                     _2009,
                     _2016 };
    assign _55 = host_cov_wdata;
    assign _2018 = _1789 ? _2017 : _55;
    always @(posedge _284) begin
        if (_2026)
            _2027[_1979] <= _2018;
    end
    assign _56 = _1715;
    always @(posedge _284) begin
        if (_282)
            _1978 <= _726;
        else
            _1978 <= _56;
    end
    assign _1712 = { _1711,
                     f_winner };
    assign _57 = _1712;
    always @(posedge _284) begin
        if (_282)
            _1715 <= _726;
        else
            _1715 <= _57;
    end
    assign _59 = host_cov_addr;
    assign _1975 = _1707 ? _1715 : _59;
    assign _1973 = ~ _1707;
    assign _61 = host_cover_en;
    assign _1704 = _1647 & _61;
    assign _1974 = _1704 & _1973;
    assign _62 = _1974;
    always @(posedge _284) begin
        if (_282)
            _1707 <= _1764;
        else
            _1707 <= _62;
    end
    assign _63 = _1707;
    always @(posedge _284) begin
        if (_282)
            _1789 <= _1764;
        else
            _1789 <= _63;
    end
    assign _1979 = _1789 ? _1978 : _1975;
    assign _2028 = _2027[_1979];
    always @(posedge _284) begin
        if (_2033)
            _2034 <= _2028;
    end
    assign _64 = _2034;
    assign _2035 = ~ f_sweeping;
    assign _2036 = _1780 & _2035;
    assign _2038 = _2036 ? _64 : _2030;
    assign _2405 = 3'b111;
    assign _2406 = _2043 == _2405;
    assign _2407 = _2040 & _2406;
    assign _2404 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _284) begin
        if (_282)
            _2408 <= _2404;
        else
            if (_2407)
                _2408 <= _77;
    end
    assign _2399 = 3'b110;
    assign _2400 = _2043 == _2399;
    assign _2401 = _2040 & _2400;
    always @(posedge _284) begin
        if (_282)
            _2402 <= _2404;
        else
            if (_2401)
                _2402 <= _77;
    end
    assign _2394 = _2043 == _1808;
    assign _2395 = _2040 & _2394;
    always @(posedge _284) begin
        if (_282)
            _2396 <= _2404;
        else
            if (_2395)
                _2396 <= _77;
    end
    assign _2388 = _2043 == _441;
    assign _2389 = _2040 & _2388;
    always @(posedge _284) begin
        if (_282)
            _2390 <= _2404;
        else
            if (_2389)
                _2390 <= _77;
    end
    assign _2382 = _2043 == _1810;
    assign _2383 = _2040 & _2382;
    always @(posedge _284) begin
        if (_282)
            _2384 <= _2404;
        else
            if (_2383)
                _2384 <= _77;
    end
    assign _2376 = _2043 == _440;
    assign _2377 = _2040 & _2376;
    always @(posedge _284) begin
        if (_282)
            _2378 <= _2404;
        else
            if (_2377)
                _2378 <= _77;
    end
    assign _2370 = _2043 == _468;
    assign _2371 = _2040 & _2370;
    always @(posedge _284) begin
        if (_282)
            _2372 <= _2404;
        else
            if (_2371)
                _2372 <= _77;
    end
    assign _2045 = _2043 + _468;
    assign _2046 = _2040 ? _2045 : _2043;
    assign _67 = _2046;
    always @(posedge _284) begin
        if (_282)
            _2043 <= _438;
        else
            _2043 <= _67;
    end
    assign _2364 = _2043 == _438;
    assign _2365 = _2040 & _2364;
    assign _2337 = _2228 - _2333;
    assign _2054 = 29'b11111111111111111111111111111;
    assign _2053 = 29'b00000000000000000000000000000;
    assign _2056 = 29'b00000000000000000000000000001;
    assign _2057 = ts_hi_m1 + _2056;
    assign _2050 = ts_reg[2:0];
    assign _2052 = _2050 == _2405;
    assign _2058 = _2052 ? _2057 : ts_hi_m1;
    assign _68 = _2058;
    always @(posedge _284) begin
        if (_282)
            ts_hi_m1 <= _2054;
        else
            ts_hi_m1 <= _68;
    end
    assign _2335 = ts_reg[31:3];
    assign _2076 = _2063 + _468;
    assign _2072 = _2063 == _2405;
    assign _2073 = ~ _2072;
    assign _2070 = _1190[0:0];
    assign _2074 = _2070 & _2073;
    assign _2077 = _2074 ? _2076 : _2063;
    assign _2067 = _1190[0:0];
    assign _2068 = ~ _2067;
    assign _2065 = _864[0:0];
    assign _2064 = f_chg_now[0:0];
    assign _2066 = _2064 & _2065;
    assign _2069 = _2066 & _2068;
    assign _2079 = _2069 ? _468 : _2077;
    assign _2060 = _826 == _1986;
    assign _2080 = _2060 ? _2079 : _2063;
    assign _69 = _2080;
    always @(posedge _284) begin
        if (_282)
            _2063 <= _438;
        else
            _2063 <= _69;
    end
    assign _2326 = _1190[0:0];
    assign _2328 = _2326 ? _2063 : _438;
    assign _2097 = _2084 + _468;
    assign _2093 = _2084 == _2405;
    assign _2094 = ~ _2093;
    assign _2091 = _1190[1:1];
    assign _2095 = _2091 & _2094;
    assign _2098 = _2095 ? _2097 : _2084;
    assign _2088 = _1190[1:1];
    assign _2089 = ~ _2088;
    assign _2086 = _864[1:1];
    assign _2085 = f_chg_now[1:1];
    assign _2087 = _2085 & _2086;
    assign _2090 = _2087 & _2089;
    assign _2100 = _2090 ? _468 : _2098;
    assign _2081 = _826 == _1986;
    assign _2101 = _2081 ? _2100 : _2084;
    assign _70 = _2101;
    always @(posedge _284) begin
        if (_282)
            _2084 <= _438;
        else
            _2084 <= _70;
    end
    assign _2323 = _1190[1:1];
    assign _2325 = _2323 ? _2084 : _438;
    assign _2329 = _2285 ? _2328 : _2325;
    assign _2118 = _2105 + _468;
    assign _2114 = _2105 == _2405;
    assign _2115 = ~ _2114;
    assign _2112 = _1190[2:2];
    assign _2116 = _2112 & _2115;
    assign _2119 = _2116 ? _2118 : _2105;
    assign _2109 = _1190[2:2];
    assign _2110 = ~ _2109;
    assign _2107 = _864[2:2];
    assign _2106 = f_chg_now[2:2];
    assign _2108 = _2106 & _2107;
    assign _2111 = _2108 & _2110;
    assign _2121 = _2111 ? _468 : _2119;
    assign _2102 = _826 == _1986;
    assign _2122 = _2102 ? _2121 : _2105;
    assign _71 = _2122;
    always @(posedge _284) begin
        if (_282)
            _2105 <= _438;
        else
            _2105 <= _71;
    end
    assign _2319 = _1190[2:2];
    assign _2321 = _2319 ? _2105 : _438;
    assign _2139 = _2126 + _468;
    assign _2135 = _2126 == _2405;
    assign _2136 = ~ _2135;
    assign _2133 = _1190[3:3];
    assign _2137 = _2133 & _2136;
    assign _2140 = _2137 ? _2139 : _2126;
    assign _2130 = _1190[3:3];
    assign _2131 = ~ _2130;
    assign _2128 = _864[3:3];
    assign _2127 = f_chg_now[3:3];
    assign _2129 = _2127 & _2128;
    assign _2132 = _2129 & _2131;
    assign _2142 = _2132 ? _468 : _2140;
    assign _2123 = _826 == _1986;
    assign _2143 = _2123 ? _2142 : _2126;
    assign _72 = _2143;
    always @(posedge _284) begin
        if (_282)
            _2126 <= _438;
        else
            _2126 <= _72;
    end
    assign _2316 = _1190[3:3];
    assign _2318 = _2316 ? _2126 : _438;
    assign _2322 = _2288 ? _2321 : _2318;
    assign _2330 = _2287 ? _2329 : _2322;
    assign _2160 = _2147 + _468;
    assign _2156 = _2147 == _2405;
    assign _2157 = ~ _2156;
    assign _2154 = _1190[4:4];
    assign _2158 = _2154 & _2157;
    assign _2161 = _2158 ? _2160 : _2147;
    assign _2151 = _1190[4:4];
    assign _2152 = ~ _2151;
    assign _2149 = _864[4:4];
    assign _2148 = f_chg_now[4:4];
    assign _2150 = _2148 & _2149;
    assign _2153 = _2150 & _2152;
    assign _2163 = _2153 ? _468 : _2161;
    assign _2144 = _826 == _1986;
    assign _2164 = _2144 ? _2163 : _2147;
    assign _73 = _2164;
    always @(posedge _284) begin
        if (_282)
            _2147 <= _438;
        else
            _2147 <= _73;
    end
    assign _2311 = _1190[4:4];
    assign _2313 = _2311 ? _2147 : _438;
    assign _2181 = _2168 + _468;
    assign _2177 = _2168 == _2405;
    assign _2178 = ~ _2177;
    assign _2175 = _1190[5:5];
    assign _2179 = _2175 & _2178;
    assign _2182 = _2179 ? _2181 : _2168;
    assign _2172 = _1190[5:5];
    assign _2173 = ~ _2172;
    assign _2170 = _864[5:5];
    assign _2169 = f_chg_now[5:5];
    assign _2171 = _2169 & _2170;
    assign _2174 = _2171 & _2173;
    assign _2184 = _2174 ? _468 : _2182;
    assign _2165 = _826 == _1986;
    assign _2185 = _2165 ? _2184 : _2168;
    assign _74 = _2185;
    always @(posedge _284) begin
        if (_282)
            _2168 <= _438;
        else
            _2168 <= _74;
    end
    assign _2308 = _1190[5:5];
    assign _2310 = _2308 ? _2168 : _438;
    assign _2314 = _2292 ? _2313 : _2310;
    assign _2202 = _2189 + _468;
    assign _2198 = _2189 == _2405;
    assign _2199 = ~ _2198;
    assign _2196 = _1190[6:6];
    assign _2200 = _2196 & _2199;
    assign _2203 = _2200 ? _2202 : _2189;
    assign _2193 = _1190[6:6];
    assign _2194 = ~ _2193;
    assign _2191 = _864[6:6];
    assign _2190 = f_chg_now[6:6];
    assign _2192 = _2190 & _2191;
    assign _2195 = _2192 & _2194;
    assign _2205 = _2195 ? _468 : _2203;
    assign _2186 = _826 == _1986;
    assign _2206 = _2186 ? _2205 : _2189;
    assign _75 = _2206;
    always @(posedge _284) begin
        if (_282)
            _2189 <= _438;
        else
            _2189 <= _75;
    end
    assign _2304 = _1190[6:6];
    assign _2306 = _2304 ? _2189 : _438;
    assign _2223 = _2210 + _468;
    assign _2219 = _2210 == _2405;
    assign _2220 = ~ _2219;
    assign _2217 = _1190[7:7];
    assign _2221 = _2217 & _2220;
    assign _2224 = _2221 ? _2223 : _2210;
    assign _2214 = _1190[7:7];
    assign _2215 = ~ _2214;
    assign _2212 = _864[7:7];
    assign _2211 = f_chg_now[7:7];
    assign _2213 = _2211 & _2212;
    assign _2216 = _2213 & _2215;
    assign _2226 = _2216 ? _468 : _2224;
    assign _2207 = _826 == _1986;
    assign _2227 = _2207 ? _2226 : _2210;
    assign _76 = _2227;
    always @(posedge _284) begin
        if (_282)
            _2210 <= _438;
        else
            _2210 <= _76;
    end
    assign _2301 = _1190[7:7];
    assign _2303 = _2301 ? _2210 : _438;
    assign _2307 = _2295 ? _2306 : _2303;
    assign _2315 = _2294 ? _2314 : _2307;
    assign _2331 = _2291 ? _2330 : _2315;
    assign _2296 = _1220[7:7];
    assign _2295 = _1220[6:6];
    assign _2297 = _2295 | _2296;
    assign _2293 = _1220[5:5];
    assign _2292 = _1220[4:4];
    assign _2294 = _2292 | _2293;
    assign _2298 = _2294 | _2297;
    assign _2289 = _1220[3:3];
    assign _2288 = _1220[2:2];
    assign _2290 = _2288 | _2289;
    assign _2286 = _1220[1:1];
    assign _2285 = _1220[0:0];
    assign _2287 = _2285 | _2286;
    assign _2291 = _2287 | _2290;
    assign _2299 = _2291 | _2298;
    assign _2332 = _2299 ? _2331 : _438;
    assign _2274 = f_watch[0:0];
    assign _2273 = _864[0:0];
    assign _2275 = _2273 & _2274;
    assign _2277 = _2275 ? _1075 : _438;
    assign _2269 = f_watch[1:1];
    assign _2268 = _864[1:1];
    assign _2270 = _2268 & _2269;
    assign _2272 = _2270 ? _1054 : _438;
    assign _2278 = _2272 < _2277;
    assign _2279 = _2278 ? _2277 : _2272;
    assign _2262 = f_watch[2:2];
    assign _2261 = _864[2:2];
    assign _2263 = _2261 & _2262;
    assign _2265 = _2263 ? _1031 : _438;
    assign _2257 = f_watch[3:3];
    assign _2256 = _864[3:3];
    assign _2258 = _2256 & _2257;
    assign _2260 = _2258 ? _1010 : _438;
    assign _2266 = _2260 < _2265;
    assign _2267 = _2266 ? _2265 : _2260;
    assign _2280 = _2267 < _2279;
    assign _2281 = _2280 ? _2279 : _2267;
    assign _2248 = f_watch[4:4];
    assign _2247 = _864[4:4];
    assign _2249 = _2247 & _2248;
    assign _2251 = _2249 ? _985 : _438;
    assign _2243 = f_watch[5:5];
    assign _2242 = _864[5:5];
    assign _2244 = _2242 & _2243;
    assign _2246 = _2244 ? _964 : _438;
    assign _2252 = _2246 < _2251;
    assign _2253 = _2252 ? _2251 : _2246;
    assign _2236 = f_watch[6:6];
    assign _2235 = _864[6:6];
    assign _2237 = _2235 & _2236;
    assign _2239 = _2237 ? _941 : _438;
    assign _2231 = f_watch[7:7];
    assign _2230 = _864[7:7];
    assign _2232 = _2230 & _2231;
    assign _2234 = _2232 ? _920 : _438;
    assign _2240 = _2234 < _2239;
    assign _2241 = _2240 ? _2239 : _2234;
    assign _2254 = _2241 < _2253;
    assign _2255 = _2254 ? _2253 : _2241;
    assign _2282 = _2255 < _2281;
    assign _2283 = _2282 ? _2281 : _2255;
    assign _2284 = f_unexp_now ? _2283 : _438;
    assign _2333 = f_amb_now ? _2332 : _2284;
    assign _2228 = ts_reg[2:0];
    assign _2334 = _2228 < _2333;
    assign _2336 = _2334 ? ts_hi_m1 : _2335;
    assign _2338 = { _2336,
                     _2337 };
    assign _2342 = { _2338,
                     _1711,
                     _2341,
                     _320 };
    assign _77 = _2342;
    always @(posedge _284) begin
        if (_282)
            _2366 <= _2404;
        else
            if (_2365)
                _2366 <= _77;
    end
    assign _2359 = _2357 + _468;
    assign _1925 = 4'b0000;
    assign _2348 = 4'b0001;
    assign _2349 = _79 + _2348;
    assign _2347 = _79 - _2348;
    assign _2350 = _2040 ? _2349 : _2347;
    assign _1689 = 4'b1000;
    assign _1690 = _79 == _1689;
    assign _2039 = ~ _1690;
    assign _78 = f_viol_now;
    assign _2040 = _78 & _2039;
    assign _2345 = _2040 ^ _2344;
    assign _2351 = _2345 ? _2350 : _79;
    always @(posedge _284) begin
        if (_282)
            _2354 <= _1925;
        else
            _2354 <= _2351;
    end
    assign _79 = _2354;
    assign _1926 = _79 == _1925;
    assign _2343 = ~ _1926;
    assign _81 = host_vlog_pop;
    assign _2344 = _81 & _2343;
    assign _2360 = _2344 ? _2359 : _2357;
    assign _82 = _2360;
    always @(posedge _284) begin
        if (_282)
            _2357 <= _438;
        else
            _2357 <= _82;
    end
    always @* begin
        case (_2357)
        0:
            _2409 <= _2366;
        1:
            _2409 <= _2372;
        2:
            _2409 <= _2378;
        3:
            _2409 <= _2384;
        4:
            _2409 <= _2390;
        5:
            _2409 <= _2396;
        6:
            _2409 <= _2402;
        default:
            _2409 <= _2408;
        endcase
    end
    assign _2515 = _2416 == _2405;
    assign _2516 = _2413 & _2515;
    always @(posedge _284) begin
        if (_282)
            _2517 <= _726;
        else
            if (_2516)
                _2517 <= _88;
    end
    assign _2509 = _2416 == _2399;
    assign _2510 = _2413 & _2509;
    always @(posedge _284) begin
        if (_282)
            _2511 <= _726;
        else
            if (_2510)
                _2511 <= _88;
    end
    assign _2503 = _2416 == _1808;
    assign _2504 = _2413 & _2503;
    always @(posedge _284) begin
        if (_282)
            _2505 <= _726;
        else
            if (_2504)
                _2505 <= _88;
    end
    assign _2497 = _2416 == _441;
    assign _2498 = _2413 & _2497;
    always @(posedge _284) begin
        if (_282)
            _2499 <= _726;
        else
            if (_2498)
                _2499 <= _88;
    end
    assign _2491 = _2416 == _1810;
    assign _2492 = _2413 & _2491;
    always @(posedge _284) begin
        if (_282)
            _2493 <= _726;
        else
            if (_2492)
                _2493 <= _88;
    end
    assign _2485 = _2416 == _440;
    assign _2486 = _2413 & _2485;
    always @(posedge _284) begin
        if (_282)
            _2487 <= _726;
        else
            if (_2486)
                _2487 <= _88;
    end
    assign _2479 = _2416 == _468;
    assign _2480 = _2413 & _2479;
    always @(posedge _284) begin
        if (_282)
            _2481 <= _726;
        else
            if (_2480)
                _2481 <= _88;
    end
    assign _2418 = _2416 + _468;
    assign _2419 = _2413 ? _2418 : _2416;
    assign _85 = _2419;
    always @(posedge _284) begin
        if (_282)
            _2416 <= _438;
        else
            _2416 <= _85;
    end
    assign _2473 = _2416 == _438;
    assign _2474 = _2413 & _2473;
    assign _2459 = _667 ? _2458 : g_byte_0;
    assign _2460 = _673 ? _2458 : _2459;
    assign _2437 = _2436 ? _2434 : _2424;
    assign _2435 = _2421 ? _2434 : _2424;
    assign _2438 = _792 ? _2437 : _2435;
    assign _86 = _2438;
    always @(posedge _284) begin
        if (_282)
            _2424 <= _726;
        else
            _2424 <= _86;
    end
    assign _2433 = _746 ? _2432 : g_byte;
    assign _2434 = _752 ? _2432 : _2433;
    assign _2449 = _739 ? _2424 : _2434;
    assign _2446 = _2445 ? _1128 : _2443;
    assign _2444 = _2440 ? _1128 : _2443;
    assign _2447 = _1672 ? _2446 : _2444;
    assign _87 = _2447;
    always @(posedge _284) begin
        if (_282)
            _2443 <= _726;
        else
            _2443 <= _87;
    end
    assign _2448 = _823 ? _2443 : _1128;
    assign _2450 = _792 ? _2449 : _2448;
    assign _2461 = _709 ? _2460 : _2450;
    assign _88 = _2461;
    always @(posedge _284) begin
        if (_282)
            _2475 <= _726;
        else
            if (_2474)
                _2475 <= _88;
    end
    assign _2468 = _2466 + _468;
    assign _2469 = _2463 ? _2468 : _2466;
    assign _89 = _2469;
    always @(posedge _284) begin
        if (_282)
            _2466 <= _438;
        else
            _2466 <= _89;
    end
    always @* begin
        case (_2466)
        0:
            _2518 <= _2475;
        1:
            _2518 <= _2481;
        2:
            _2518 <= _2487;
        3:
            _2518 <= _2493;
        4:
            _2518 <= _2499;
        5:
            _2518 <= _2505;
        6:
            _2518 <= _2511;
        default:
            _2518 <= _2517;
        endcase
    end
    assign _2521 = 32'b00000000000000000000000000000001;
    assign _2522 = ts_reg + _2521;
    assign _93 = _2522;
    always @(posedge _284) begin
        if (_282)
            ts_reg <= _2030;
        else
            ts_reg <= _93;
    end
    assign _2524 = 2'b00;
    assign _2339 = { _1890,
                     f_unexp_now };
    assign _2341 = f_amb_now ? _2524 : _2339;
    always @(posedge _284) begin
        if (_282)
            _2525 <= _2524;
        else
            _2525 <= _2341;
    end
    always @(posedge _284) begin
        if (_282)
            _2528 <= _1764;
        else
            _2528 <= f_viol_now;
    end
    always @(posedge _284) begin
        if (_282)
            _2531 <= _2524;
        else
            _2531 <= f_winner;
    end
    always @(posedge _284) begin
        if (_282)
            _2534 <= _1764;
        else
            _2534 <= _1647;
    end
    assign _2535 = _1197[60:60];
    assign _2536 = f_in_eval & _2535;
    assign _2537 = ~ _1780;
    assign _2678 = _106 & _2677;
    assign _2679 = ~ _2678;
    assign _2559 = _1197[23:16];
    assign _2557 = _1214[86:79];
    assign _2556 = _1208[86:79];
    assign _2555 = _1202[86:79];
    assign _2554 = _850[86:79];
    always @* begin
        case (f_winner)
        0:
            _2558 <= _2554;
        1:
            _2558 <= _2555;
        2:
            _2558 <= _2556;
        default:
            _2558 <= _2557;
        endcase
    end
    assign _2560 = _834 ? _2559 : _2558;
    assign _2561 = _2560 & _2551;
    assign _2552 = ~ _2551;
    assign _2553 = f_poe & _2552;
    assign _2562 = _2553 | _2561;
    assign _2596 = _2562 | _2595;
    assign _2597 = _2541 ? _2596 : f_poe;
    assign _2599 = _291 ? _726 : _2597;
    assign _2601 = _1836 ? _726 : _2599;
    assign _103 = _2601;
    always @(posedge _284) begin
        if (_282)
            f_poe <= _726;
        else
            f_poe <= _103;
    end
    assign _2680 = f_poe & _2679;
    assign _106 = host_open_drain;
    assign _4133 = ~ _106;
    assign _2675 = f_lane1_out & _2669;
    assign _2674 = ~ f_lane1_out;
    assign _2672 = ~ f_lane0_out;
    assign _2673 = _2672 & _2669;
    assign _2671 = f_lane0_out & _2669;
    assign _2670 = ~ f_lane0_out;
    assign _2669 = f_pout[0:0];
    assign _2668 = _301[2:0];
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
    assign _2660 = f_pout[1:1];
    assign _2659 = _301[5:3];
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
    assign _2651 = f_pout[2:2];
    assign _2650 = _301[8:6];
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
    assign _2642 = f_pout[3:3];
    assign _2641 = _301[11:9];
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
    assign _2633 = f_pout[4:4];
    assign _2632 = _301[14:12];
    always @* begin
        case (_2632)
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
    assign _2630 = f_lane1_out & _2624;
    assign _2629 = ~ f_lane1_out;
    assign _2627 = ~ f_lane0_out;
    assign _2628 = _2627 & _2624;
    assign _2626 = f_lane0_out & _2624;
    assign _2625 = ~ f_lane0_out;
    assign _2624 = f_pout[5:5];
    assign _2623 = _301[17:15];
    always @* begin
        case (_2623)
        0:
            _2631 <= _2624;
        1:
            _2631 <= f_lane0_out;
        2:
            _2631 <= _2625;
        3:
            _2631 <= _2626;
        4:
            _2631 <= _2628;
        5:
            _2631 <= f_lane1_out;
        6:
            _2631 <= _2629;
        default:
            _2631 <= _2630;
        endcase
    end
    assign _2621 = f_lane1_out & _2615;
    assign _2620 = ~ f_lane1_out;
    assign _2618 = ~ f_lane0_out;
    assign _2619 = _2618 & _2615;
    assign _2617 = f_lane0_out & _2615;
    assign _2616 = ~ f_lane0_out;
    assign _2615 = f_pout[6:6];
    assign _2614 = _301[20:18];
    always @* begin
        case (_2614)
        0:
            _2622 <= _2615;
        1:
            _2622 <= f_lane0_out;
        2:
            _2622 <= _2616;
        3:
            _2622 <= _2617;
        4:
            _2622 <= _2619;
        5:
            _2622 <= f_lane1_out;
        6:
            _2622 <= _2620;
        default:
            _2622 <= _2621;
        endcase
    end
    assign _2612 = f_lane1_out & _2606;
    assign _2611 = ~ f_lane1_out;
    assign _2609 = ~ f_lane0_out;
    assign _2610 = _2609 & _2606;
    assign _2608 = f_lane0_out & _2606;
    assign _2607 = ~ f_lane0_out;
    assign _4125 = { _4123,
                     _4122 };
    assign _4122 = _1124[0:0];
    assign _4123 = { _4122,
                     _4122 };
    assign _4124 = { _4123,
                     _4123 };
    assign _4126 = { _4124,
                     _4125 };
    assign _4127 = { _4126,
                     _4122 };
    assign _4128 = _4127 & _2595;
    assign _2593 = _2589 & _2587;
    assign _2592 = _2589 & _2585;
    assign _2591 = _2589 & _2582;
    assign _2589 = ~ _2576;
    assign _2590 = _2589 & _2579;
    assign _2587 = _2584 & _2581;
    assign _2588 = _2576 & _2587;
    assign _2584 = ~ _2577;
    assign _2585 = _2584 & _2578;
    assign _2586 = _2576 & _2585;
    assign _2581 = ~ _2578;
    assign _2582 = _2577 & _2581;
    assign _2583 = _2576 & _2582;
    assign _2578 = _2575[0:0];
    assign _2577 = _2575[1:1];
    assign _2579 = _2577 & _2578;
    assign _2576 = _2575[2:2];
    assign _2580 = _2576 & _2579;
    assign _2594 = { _2580,
                     _2583,
                     _2586,
                     _2588,
                     _2590,
                     _2591,
                     _2592,
                     _2593 };
    assign _2563 = ~ _834;
    assign _2569 = _2563 & _2568;
    assign _2595 = _2569 ? _2594 : _726;
    assign _4120 = ~ _2595;
    assign _4116 = _1197[15:8];
    assign _4114 = _1214[78:71];
    assign _4113 = _1208[78:71];
    assign _4112 = _1202[78:71];
    assign _4111 = _850[78:71];
    always @* begin
        case (f_winner)
        0:
            _4115 <= _4111;
        1:
            _4115 <= _4112;
        2:
            _4115 <= _4113;
        default:
            _4115 <= _4114;
        endcase
    end
    assign _4117 = _834 ? _4116 : _4115;
    assign _4118 = _4117 & _2551;
    assign _2550 = _1197[7:0];
    assign _2548 = _1214[70:63];
    assign _2547 = _1208[70:63];
    assign _2546 = _1202[70:63];
    assign _2545 = _850[70:63];
    always @* begin
        case (f_winner)
        0:
            _2549 <= _2545;
        1:
            _2549 <= _2546;
        2:
            _2549 <= _2547;
        default:
            _2549 <= _2548;
        endcase
    end
    assign _2551 = _834 ? _2550 : _2549;
    assign _4109 = ~ _2551;
    assign _4110 = f_pout & _4109;
    assign _4119 = _4110 | _4118;
    assign _4121 = _4119 & _4120;
    assign _4129 = _4121 | _4128;
    assign _2539 = _1145 == _2524;
    assign _2540 = _2539 | _1147;
    assign _2541 = _1648 & _2540;
    assign _4130 = _2541 ? _4129 : f_pout;
    assign _108 = host_crc_expect;
    assign _4102 = 32'b11111111111111111111111111111111;
    assign _2795 = 32'b11101101101110001000001100100000;
    assign _2793 = _2787[31:1];
    assign _2794 = { _1764,
                     _2793 };
    assign _2796 = _2794 ^ _2795;
    assign _2790 = _2787[31:1];
    assign _2791 = { _1764,
                     _2790 };
    assign _2783 = _2777[31:1];
    assign _2784 = { _1764,
                     _2783 };
    assign _2786 = _2784 ^ _2795;
    assign _2780 = _2777[31:1];
    assign _2781 = { _1764,
                     _2780 };
    assign _2773 = _2767[31:1];
    assign _2774 = { _1764,
                     _2773 };
    assign _2776 = _2774 ^ _2795;
    assign _2770 = _2767[31:1];
    assign _2771 = { _1764,
                     _2770 };
    assign _2763 = _2757[31:1];
    assign _2764 = { _1764,
                     _2763 };
    assign _2766 = _2764 ^ _2795;
    assign _2760 = _2757[31:1];
    assign _2761 = { _1764,
                     _2760 };
    assign _2753 = _2747[31:1];
    assign _2754 = { _1764,
                     _2753 };
    assign _2756 = _2754 ^ _2795;
    assign _2750 = _2747[31:1];
    assign _2751 = { _1764,
                     _2750 };
    assign _2743 = _2737[31:1];
    assign _2744 = { _1764,
                     _2743 };
    assign _2746 = _2744 ^ _2795;
    assign _2740 = _2737[31:1];
    assign _2741 = { _1764,
                     _2740 };
    assign _2733 = _2727[31:1];
    assign _2734 = { _1764,
                     _2733 };
    assign _2736 = _2734 ^ _2795;
    assign _2730 = _2727[31:1];
    assign _2731 = { _1764,
                     _2730 };
    assign _2723 = _2717[31:1];
    assign _2724 = { _1764,
                     _2723 };
    assign _2726 = _2724 ^ _2795;
    assign _2720 = _2717[31:1];
    assign _2721 = { _1764,
                     _2720 };
    assign _2714 = _276[127:120];
    assign _2713 = _276[119:112];
    assign _2712 = _276[111:104];
    assign _2711 = _276[103:96];
    assign _2710 = _276[95:88];
    assign _2709 = _276[87:80];
    assign _2708 = _276[79:72];
    assign _2707 = _276[71:64];
    assign _2706 = _276[63:56];
    assign _2705 = _276[55:48];
    assign _2704 = _276[47:40];
    assign _2703 = _276[39:32];
    assign _2702 = _276[31:24];
    assign _2701 = _276[23:16];
    assign _2700 = _276[15:8];
    assign _2699 = _276[7:0];
    assign _2696 = 13'b0000000000001;
    assign _2697 = f_sw_cnt - _2696;
    assign _2698 = _2697[3:0];
    always @* begin
        case (_2698)
        0:
            _2715 <= _2699;
        1:
            _2715 <= _2700;
        2:
            _2715 <= _2701;
        3:
            _2715 <= _2702;
        4:
            _2715 <= _2703;
        5:
            _2715 <= _2704;
        6:
            _2715 <= _2705;
        7:
            _2715 <= _2706;
        8:
            _2715 <= _2707;
        9:
            _2715 <= _2708;
        10:
            _2715 <= _2709;
        11:
            _2715 <= _2710;
        12:
            _2715 <= _2711;
        13:
            _2715 <= _2712;
        14:
            _2715 <= _2713;
        default:
            _2715 <= _2714;
        endcase
    end
    assign _2695 = 24'b000000000000000000000000;
    assign _2716 = { _2695,
                     _2715 };
    assign _2693 = f_sw_cnt == _1957;
    assign _2694 = ~ _2693;
    assign _2798 = _2694 ? _2797 : _2688;
    assign _2688 = _2683 ? _4102 : _2686;
    assign _2799 = f_sweeping ? _2798 : _2688;
    assign _109 = _2799;
    always @(posedge _284) begin
        if (_282)
            _2686 <= _4102;
        else
            _2686 <= _109;
    end
    assign _2717 = _2686 ^ _2716;
    assign _2718 = _2717[0:0];
    assign _2727 = _2718 ? _2726 : _2721;
    assign _2728 = _2727[0:0];
    assign _2737 = _2728 ? _2736 : _2731;
    assign _2738 = _2737[0:0];
    assign _2747 = _2738 ? _2746 : _2741;
    assign _2748 = _2747[0:0];
    assign _2757 = _2748 ? _2756 : _2751;
    assign _2758 = _2757[0:0];
    assign _2767 = _2758 ? _2766 : _2761;
    assign _2768 = _2767[0:0];
    assign _2777 = _2768 ? _2776 : _2771;
    assign _2778 = _2777[0:0];
    assign _2787 = _2778 ? _2786 : _2781;
    assign _2788 = _2787[0:0];
    assign _2797 = _2788 ? _2796 : _2791;
    assign _4103 = _2797 ^ _4102;
    assign f_sw_match = _4103 == _108;
    assign _4105 = f_sw_last ? f_sw_match : _4101;
    assign _4107 = _4089 ? _1764 : _4105;
    assign _4097 = f_store_we | _111;
    assign _4099 = _4097 ? _1764 : f_image_valid;
    assign _4101 = _2683 ? _1764 : _4099;
    assign _4090 = 13'b1000000000000;
    assign f_sw_last = f_sw_cnt == _4090;
    assign _4093 = f_sw_last ? _1764 : _4086;
    assign _111 = host_crc_expect_we;
    assign _4087 = _298 | _264;
    assign _4088 = _4087 | _111;
    assign _4089 = f_sweeping & _4088;
    assign _4095 = _4089 ? _1764 : _4093;
    assign _2682 = ~ f_sweeping;
    assign _4079 = _834 ? _1987 : _826;
    assign _4075 = _3941 ? _1986 : _826;
    assign _1902 = 2'b11;
    assign _4066 = f_policy == _1902;
    assign _4068 = _4066 ? _2524 : _826;
    assign _4065 = f_policy == _1987;
    assign _4070 = _4065 ? _1986 : _4068;
    assign _4064 = f_policy == _2524;
    assign _4072 = _4064 ? _2524 : _4070;
    assign _4073 = f_viol_now ? _4072 : _826;
    assign _1642 = f_chgmask3 & f_multi_eff;
    assign _1644 = _1642 == _726;
    assign _1635 = _1592 == _1939;
    assign _1630 = 16'b0000000000000000;
    assign _1631 = _1592 == _1630;
    assign _1632 = _1631 & _1612;
    assign _1629 = _1528 == _1588;
    assign _1633 = _1629 | _1632;
    assign _1636 = _1527 ? _1635 : _1633;
    assign _1626 = _1134[3:0];
    assign _1628 = _1626 == _1925;
    assign _1637 = _1628 | _1636;
    assign _1624 = _1592 == _1939;
    assign _1620 = _1592 == _1630;
    assign _1621 = _1620 & _1612;
    assign _1618 = _1528 == _1588;
    assign _1622 = _1618 | _1621;
    assign _1625 = _1527 ? _1624 : _1622;
    assign _1616 = _1579 == _1939;
    always @(posedge _284) begin
        if (_282)
            _1610 <= _438;
        else
            _1610 <= _1571;
    end
    assign _1611 = { _1957,
                     _1610 };
    assign _1612 = _1525 < _1611;
    assign _1606 = _1579 == _1630;
    assign _1613 = _1606 & _1612;
    assign _1604 = _1528 == _1576;
    assign _1614 = _1604 | _1613;
    assign _1617 = _1527 ? _1616 : _1614;
    assign _1603 = _1214[104:103];
    always @* begin
        case (_1603)
        0:
            _1638 <= vdd;
        1:
            _1638 <= _1617;
        2:
            _1638 <= _1625;
        default:
            _1638 <= _1637;
        endcase
    end
    assign _1602 = ~ _1147;
    assign _1639 = _1602 | _1638;
    assign _1599 = _1214[62:62];
    assign _1597 = _1214[61:58];
    always @* begin
        case (_1597)
        0:
            _1598 <= vdd;
        1:
            _1598 <= _1121;
        2:
            _1598 <= _1125;
        3:
            _1598 <= _1129;
        4:
            _1598 <= _1131;
        5:
            _1598 <= _711;
        6:
            _1598 <= _1135;
        7:
            _1598 <= _1138;
        8:
            _1598 <= _649;
        9:
            _1598 <= _652;
        10:
            _1598 <= _655;
        11:
            _1598 <= _658;
        12:
            _1598 <= _637;
        13:
            _1598 <= _640;
        14:
            _1598 <= _643;
        default:
            _1598 <= _646;
        endcase
    end
    assign _1600 = _1598 ^ _1599;
    assign _1592 = _1214[57:42];
    assign _1594 = _1592 == _1939;
    assign _1587 = 17'b00000000000000000;
    assign _1583 = _1529[57:42];
    assign _1584 = { gnd,
                     _1583 };
    assign _1585 = _1584 + _1572;
    always @(posedge _284) begin
        if (_282)
            _1588 <= _1587;
        else
            _1588 <= _1585;
    end
    assign _1589 = _1588 < _1528;
    assign _1590 = ~ _1589;
    assign _1579 = _1214[41:26];
    assign _1581 = _1579 == _1630;
    assign _1563 = _1533[0:0];
    assign _1565 = _1563 ? _1083 : _438;
    assign _1560 = _1533[1:1];
    assign _1562 = _1560 ? _1062 : _438;
    assign _1566 = _1562 < _1565;
    assign _1567 = _1566 ? _1565 : _1562;
    assign _1555 = _1533[2:2];
    assign _1557 = _1555 ? _1039 : _438;
    assign _1552 = _1533[3:3];
    assign _1554 = _1552 ? _1018 : _438;
    assign _1558 = _1554 < _1557;
    assign _1559 = _1558 ? _1557 : _1554;
    assign _1568 = _1559 < _1567;
    assign _1569 = _1568 ? _1567 : _1559;
    assign _1545 = _1533[4:4];
    assign _1547 = _1545 ? _993 : _438;
    assign _1542 = _1533[5:5];
    assign _1544 = _1542 ? _972 : _438;
    assign _1548 = _1544 < _1547;
    assign _1549 = _1548 ? _1547 : _1544;
    assign _1537 = _1533[6:6];
    assign _1539 = _1537 ? _949 : _438;
    assign _1533 = _1529[23:16];
    assign _1534 = _1533[7:7];
    assign _1536 = _1534 ? _928 : _438;
    assign _1540 = _1536 < _1539;
    assign _1541 = _1540 ? _1539 : _1536;
    assign _1550 = _1541 < _1549;
    assign _1551 = _1550 ? _1549 : _1541;
    assign _1570 = _1551 < _1569;
    assign _1571 = _1570 ? _1569 : _1551;
    assign _1532 = 14'b00000000000000;
    assign _1572 = { _1532,
                     _1571 };
    assign _1529 = _903[511:400];
    assign _1530 = _1529[41:26];
    assign _1531 = { gnd,
                     _1530 };
    assign _1573 = _1531 + _1572;
    always @(posedge _284) begin
        if (_282)
            _1576 <= _1587;
        else
            _1576 <= _1573;
    end
    assign _1528 = { gnd,
                     _1525 };
    assign _1577 = _1528 < _1576;
    assign _1578 = ~ _1577;
    assign _1582 = _1578 | _1581;
    assign _1591 = _1582 & _1590;
    assign _1524 = _1214[25:24];
    always @* begin
        case (_1524)
        0:
            _1525 <= _876;
        1:
            _1525 <= _879;
        2:
            _1525 <= _882;
        default:
            _1525 <= _882;
        endcase
    end
    assign _1527 = _1525 == _1939;
    assign _1595 = _1527 ? _1594 : _1591;
    assign _1518 = f_changed_all & f_chgmask3;
    assign _1520 = _1518 == _726;
    assign _1521 = ~ _1520;
    assign _1517 = f_chgmask3 == _726;
    assign _1522 = _1517 | _1521;
    assign _1511 = _1214[7:0];
    assign _1509 = _1214[15:8];
    assign _1510 = _320 ^ _1509;
    assign _1512 = _1510 & _1511;
    assign _1514 = _1512 == _726;
    assign _1515 = f_valid3 & _1514;
    assign _1523 = _1515 & _1522;
    assign _1596 = _1523 & _1595;
    assign _1601 = _1596 & _1600;
    assign _1640 = _1601 & _1639;
    assign _1641 = f_in_eval & _1640;
    assign _1645 = _1641 & _1644;
    assign f_fire3 = _1645 & _1229;
    assign _1193 = f_chgmask0 & f_multi_eff;
    assign _1195 = _1193 == _726;
    assign _1181 = _1111 == _1939;
    assign _1177 = _1111 == _1630;
    assign _1178 = _1177 & _1158;
    assign _1175 = _886 == _1107;
    assign _1179 = _1175 | _1178;
    assign _1182 = _885 ? _1181 : _1179;
    assign _1172 = _1134[3:0];
    assign _1174 = _1172 == _1925;
    assign _1183 = _1174 | _1182;
    assign _1170 = _1111 == _1939;
    assign _1166 = _1111 == _1630;
    assign _1167 = _1166 & _1158;
    assign _1164 = _886 == _1107;
    assign _1168 = _1164 | _1167;
    assign _1171 = _885 ? _1170 : _1168;
    assign _1162 = _1098 == _1939;
    always @(posedge _284) begin
        if (_282)
            _1156 <= _438;
        else
            _1156 <= _1090;
    end
    assign _1157 = { _1957,
                     _1156 };
    assign _1158 = _883 < _1157;
    assign _1152 = _1098 == _1630;
    assign _1159 = _1152 & _1158;
    assign _1150 = _886 == _1095;
    assign _1160 = _1150 | _1159;
    assign _1163 = _885 ? _1162 : _1160;
    assign _1149 = _850[104:103];
    always @* begin
        case (_1149)
        0:
            _1184 <= vdd;
        1:
            _1184 <= _1163;
        2:
            _1184 <= _1171;
        default:
            _1184 <= _1183;
        endcase
    end
    assign _1148 = ~ _1147;
    assign _1185 = _1148 | _1184;
    assign _1140 = _850[62:62];
    assign _1116 = _850[61:58];
    always @* begin
        case (_1116)
        0:
            _1139 <= vdd;
        1:
            _1139 <= _1121;
        2:
            _1139 <= _1125;
        3:
            _1139 <= _1129;
        4:
            _1139 <= _1131;
        5:
            _1139 <= _711;
        6:
            _1139 <= _1135;
        7:
            _1139 <= _1138;
        8:
            _1139 <= _649;
        9:
            _1139 <= _652;
        10:
            _1139 <= _655;
        11:
            _1139 <= _658;
        12:
            _1139 <= _637;
        13:
            _1139 <= _640;
        14:
            _1139 <= _643;
        default:
            _1139 <= _646;
        endcase
    end
    assign _1141 = _1139 ^ _1140;
    assign _1111 = _850[57:42];
    assign _1113 = _1111 == _1939;
    assign _1102 = _904[57:42];
    assign _1103 = { gnd,
                     _1102 };
    assign _1104 = _1103 + _1091;
    always @(posedge _284) begin
        if (_282)
            _1107 <= _1587;
        else
            _1107 <= _1104;
    end
    assign _1108 = _1107 < _886;
    assign _1109 = ~ _1108;
    assign _1098 = _850[41:26];
    assign _1100 = _1098 == _1630;
    assign _1064 = _908[0:0];
    assign _1084 = _1064 ? _1083 : _438;
    assign _1043 = _908[1:1];
    assign _1063 = _1043 ? _1062 : _438;
    assign _1085 = _1063 < _1084;
    assign _1086 = _1085 ? _1084 : _1063;
    assign _1020 = _908[2:2];
    assign _1040 = _1020 ? _1039 : _438;
    assign _999 = _908[3:3];
    assign _1019 = _999 ? _1018 : _438;
    assign _1041 = _1019 < _1040;
    assign _1042 = _1041 ? _1040 : _1019;
    assign _1087 = _1042 < _1086;
    assign _1088 = _1087 ? _1086 : _1042;
    assign _974 = _908[4:4];
    assign _994 = _974 ? _993 : _438;
    assign _953 = _908[5:5];
    assign _973 = _953 ? _972 : _438;
    assign _995 = _973 < _994;
    assign _996 = _995 ? _994 : _973;
    assign _930 = _908[6:6];
    assign _950 = _930 ? _949 : _438;
    assign _908 = _904[23:16];
    assign _909 = _908[7:7];
    assign _929 = _909 ? _928 : _438;
    assign _951 = _929 < _950;
    assign _952 = _951 ? _950 : _929;
    assign _997 = _952 < _996;
    assign _998 = _997 ? _996 : _952;
    assign _1089 = _998 < _1088;
    assign _1090 = _1089 ? _1088 : _998;
    assign _1091 = { _1532,
                     _1090 };
    assign _904 = _903[175:64];
    assign _905 = _904[41:26];
    assign _906 = { gnd,
                    _905 };
    assign _1092 = _906 + _1091;
    always @(posedge _284) begin
        if (_282)
            _1095 <= _1587;
        else
            _1095 <= _1092;
    end
    assign _886 = { gnd,
                    _883 };
    assign _1096 = _886 < _1095;
    assign _1097 = ~ _1096;
    assign _1101 = _1097 | _1100;
    assign _1110 = _1101 & _1109;
    assign _873 = _850[25:24];
    always @* begin
        case (_873)
        0:
            _883 <= _876;
        1:
            _883 <= _879;
        2:
            _883 <= _882;
        default:
            _883 <= _882;
        endcase
    end
    assign _885 = _883 == _1939;
    assign _1114 = _885 ? _1113 : _1110;
    assign _867 = f_changed_all & f_chgmask0;
    assign _869 = _867 == _726;
    assign _870 = ~ _869;
    assign _861 = f_chgmask0 == _726;
    assign _871 = _861 | _870;
    assign _854 = _850[7:0];
    assign _852 = _850[15:8];
    assign _853 = _320 ^ _852;
    assign _855 = _853 & _854;
    assign _857 = _855 == _726;
    assign _838 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _4049 = _831 + _468;
    assign _4045 = _3941 ? _438 : _831;
    assign _4040 = f_policy == _1987;
    assign _4042 = _4040 ? _438 : _831;
    assign _1893 = f_changed_all & f_watch;
    assign _1895 = _1893 == _726;
    assign _1896 = ~ _1895;
    assign _1891 = ~ _1647;
    assign _1892 = f_in_eval & _1891;
    assign f_unexp_now = _1892 & _1896;
    assign _2803 = ~ f_amb_now;
    assign _2804 = _1890 & _2803;
    assign _2806 = _2804 ? _1766 : _2802;
    assign _2807 = _1647 ? _2802 : _2806;
    assign _2802 = _1648 ? _1764 : _1888;
    assign _2800 = _826 == _1987;
    assign _2808 = _2800 ? _2807 : _2802;
    assign _112 = _2808;
    always @(posedge _284) begin
        if (_282)
            _1888 <= _1764;
        else
            _1888 <= _112;
    end
    assign _1889 = ~ _1888;
    assign _4031 = 16'b0000000000000001;
    assign _4032 = _876 + _4031;
    assign _4028 = _876 == _1939;
    assign _4029 = ~ _4028;
    assign _4030 = _3989 & _4029;
    assign _4033 = _4030 ? _4032 : _876;
    assign _3973 = _1197[26:24];
    assign _3971 = _1214[93:91];
    assign _3970 = _1208[93:91];
    assign _3969 = _1202[93:91];
    assign _3968 = _850[93:91];
    assign _1503 = f_chgmask2 & f_multi_eff;
    assign _1505 = _1503 == _726;
    assign _1496 = _1453 == _1939;
    assign _1492 = _1453 == _1630;
    assign _1493 = _1492 & _1473;
    assign _1490 = _1389 == _1449;
    assign _1494 = _1490 | _1493;
    assign _1497 = _1388 ? _1496 : _1494;
    assign _1487 = _1134[3:0];
    assign _1489 = _1487 == _1925;
    assign _1498 = _1489 | _1497;
    assign _1485 = _1453 == _1939;
    assign _1481 = _1453 == _1630;
    assign _1482 = _1481 & _1473;
    assign _1479 = _1389 == _1449;
    assign _1483 = _1479 | _1482;
    assign _1486 = _1388 ? _1485 : _1483;
    assign _1477 = _1440 == _1939;
    always @(posedge _284) begin
        if (_282)
            _1471 <= _438;
        else
            _1471 <= _1432;
    end
    assign _1472 = { _1957,
                     _1471 };
    assign _1473 = _1386 < _1472;
    assign _1467 = _1440 == _1630;
    assign _1474 = _1467 & _1473;
    assign _1465 = _1389 == _1437;
    assign _1475 = _1465 | _1474;
    assign _1478 = _1388 ? _1477 : _1475;
    assign _1464 = _1208[104:103];
    always @* begin
        case (_1464)
        0:
            _1499 <= vdd;
        1:
            _1499 <= _1478;
        2:
            _1499 <= _1486;
        default:
            _1499 <= _1498;
        endcase
    end
    assign _1463 = ~ _1147;
    assign _1500 = _1463 | _1499;
    assign _1460 = _1208[62:62];
    assign _1458 = _1208[61:58];
    always @* begin
        case (_1458)
        0:
            _1459 <= vdd;
        1:
            _1459 <= _1121;
        2:
            _1459 <= _1125;
        3:
            _1459 <= _1129;
        4:
            _1459 <= _1131;
        5:
            _1459 <= _711;
        6:
            _1459 <= _1135;
        7:
            _1459 <= _1138;
        8:
            _1459 <= _649;
        9:
            _1459 <= _652;
        10:
            _1459 <= _655;
        11:
            _1459 <= _658;
        12:
            _1459 <= _637;
        13:
            _1459 <= _640;
        14:
            _1459 <= _643;
        default:
            _1459 <= _646;
        endcase
    end
    assign _1461 = _1459 ^ _1460;
    assign _1453 = _1208[57:42];
    assign _1455 = _1453 == _1939;
    assign _1444 = _1390[57:42];
    assign _1445 = { gnd,
                     _1444 };
    assign _1446 = _1445 + _1433;
    always @(posedge _284) begin
        if (_282)
            _1449 <= _1587;
        else
            _1449 <= _1446;
    end
    assign _1450 = _1449 < _1389;
    assign _1451 = ~ _1450;
    assign _1440 = _1208[41:26];
    assign _1442 = _1440 == _1630;
    assign _1424 = _1394[0:0];
    assign _1426 = _1424 ? _1083 : _438;
    assign _1421 = _1394[1:1];
    assign _1423 = _1421 ? _1062 : _438;
    assign _1427 = _1423 < _1426;
    assign _1428 = _1427 ? _1426 : _1423;
    assign _1416 = _1394[2:2];
    assign _1418 = _1416 ? _1039 : _438;
    assign _1413 = _1394[3:3];
    assign _1415 = _1413 ? _1018 : _438;
    assign _1419 = _1415 < _1418;
    assign _1420 = _1419 ? _1418 : _1415;
    assign _1429 = _1420 < _1428;
    assign _1430 = _1429 ? _1428 : _1420;
    assign _1406 = _1394[4:4];
    assign _1408 = _1406 ? _993 : _438;
    assign _1403 = _1394[5:5];
    assign _1405 = _1403 ? _972 : _438;
    assign _1409 = _1405 < _1408;
    assign _1410 = _1409 ? _1408 : _1405;
    assign _1398 = _1394[6:6];
    assign _1400 = _1398 ? _949 : _438;
    assign _1394 = _1390[23:16];
    assign _1395 = _1394[7:7];
    assign _1397 = _1395 ? _928 : _438;
    assign _1401 = _1397 < _1400;
    assign _1402 = _1401 ? _1400 : _1397;
    assign _1411 = _1402 < _1410;
    assign _1412 = _1411 ? _1410 : _1402;
    assign _1431 = _1412 < _1430;
    assign _1432 = _1431 ? _1430 : _1412;
    assign _1433 = { _1532,
                     _1432 };
    assign _1390 = _903[399:288];
    assign _1391 = _1390[41:26];
    assign _1392 = { gnd,
                     _1391 };
    assign _1434 = _1392 + _1433;
    always @(posedge _284) begin
        if (_282)
            _1437 <= _1587;
        else
            _1437 <= _1434;
    end
    assign _1389 = { gnd,
                     _1386 };
    assign _1438 = _1389 < _1437;
    assign _1439 = ~ _1438;
    assign _1443 = _1439 | _1442;
    assign _1452 = _1443 & _1451;
    assign _1385 = _1208[25:24];
    always @* begin
        case (_1385)
        0:
            _1386 <= _876;
        1:
            _1386 <= _879;
        2:
            _1386 <= _882;
        default:
            _1386 <= _882;
        endcase
    end
    assign _1388 = _1386 == _1939;
    assign _1456 = _1388 ? _1455 : _1452;
    assign _1379 = f_changed_all & f_chgmask2;
    assign _1381 = _1379 == _726;
    assign _1382 = ~ _1381;
    assign _1378 = f_chgmask2 == _726;
    assign _1383 = _1378 | _1382;
    assign _1372 = _1208[7:0];
    assign _1370 = _1208[15:8];
    assign _1371 = _320 ^ _1370;
    assign _1373 = _1371 & _1372;
    assign _1375 = _1373 == _726;
    assign _1376 = f_valid2 & _1375;
    assign _1384 = _1376 & _1383;
    assign _1457 = _1384 & _1456;
    assign _1462 = _1457 & _1461;
    assign _1501 = _1462 & _1500;
    assign _1502 = f_in_eval & _1501;
    assign _1506 = _1502 & _1505;
    assign f_fire2 = _1506 & _1229;
    assign _1651 = f_fire2 ? _1987 : _1902;
    assign _1228 = f_policy == _1986;
    assign f_chgmask3 = _1214[23:16];
    assign f_valid3 = _1214[111:111];
    assign _1218 = f_valid3 ? f_chgmask3 : _726;
    assign f_chgmask2 = _1208[23:16];
    assign f_valid2 = _1208[111:111];
    assign _1212 = f_valid2 ? f_chgmask2 : _726;
    assign _1206 = f_valid1 ? f_chgmask1 : _726;
    assign f_chgmask0 = _850[23:16];
    assign _1200 = f_valid0 ? f_chgmask0 : _726;
    assign f_watch = _1197[57:50];
    assign _1201 = f_watch | _1200;
    assign _1207 = _1201 | _1206;
    assign _1213 = _1207 | _1212;
    assign f_relevant = _1213 | _1218;
    assign _1220 = f_multi_eff & f_relevant;
    assign _1222 = _1220 == _726;
    assign _1223 = ~ _1222;
    assign f_amb_now = f_in_eval & _1223;
    assign _1225 = ~ f_amb_now;
    assign _1229 = _1225 | _1228;
    assign _1191 = _864 & f_chg_now;
    assign _2813 = _864 & f_chg_now;
    assign _2814 = _1190 | _2813;
    assign _2810 = _826 == _1987;
    assign _2812 = _2810 ? _726 : _1190;
    assign _2809 = _826 == _1986;
    assign _2815 = _2809 ? _2814 : _2812;
    assign _2817 = _1836 ? _726 : _2815;
    assign _113 = _2817;
    always @(posedge _284) begin
        if (_282)
            _1190 <= _726;
        else
            _1190 <= _113;
    end
    assign f_multi_eff = _1190 | _1191;
    assign _1364 = f_chgmask1 & f_multi_eff;
    assign _1366 = _1364 == _726;
    assign _1357 = _1314 == _1939;
    assign _1353 = _1314 == _1630;
    assign _1354 = _1353 & _1334;
    assign _1351 = _1250 == _1310;
    assign _1355 = _1351 | _1354;
    assign _1358 = _1249 ? _1357 : _1355;
    assign _1348 = _1134[3:0];
    assign _1350 = _1348 == _1925;
    assign _1359 = _1350 | _1358;
    assign _1346 = _1314 == _1939;
    assign _1342 = _1314 == _1630;
    assign _1343 = _1342 & _1334;
    assign _1340 = _1250 == _1310;
    assign _1344 = _1340 | _1343;
    assign _1347 = _1249 ? _1346 : _1344;
    assign _1338 = _1301 == _1939;
    always @(posedge _284) begin
        if (_282)
            _1332 <= _438;
        else
            _1332 <= _1293;
    end
    assign _1333 = { _1957,
                     _1332 };
    assign _1334 = _1247 < _1333;
    assign _1328 = _1301 == _1630;
    assign _1335 = _1328 & _1334;
    assign _1326 = _1250 == _1298;
    assign _1336 = _1326 | _1335;
    assign _1339 = _1249 ? _1338 : _1336;
    assign _1325 = _1202[104:103];
    always @* begin
        case (_1325)
        0:
            _1360 <= vdd;
        1:
            _1360 <= _1339;
        2:
            _1360 <= _1347;
        default:
            _1360 <= _1359;
        endcase
    end
    assign _115 = host_role;
    assign _2818 = _1836 ? _115 : _1145;
    assign _116 = _2818;
    always @(posedge _284) begin
        if (_282)
            _1145 <= _2524;
        else
            _1145 <= _116;
    end
    assign _1147 = _1145 == _1987;
    assign _1324 = ~ _1147;
    assign _1361 = _1324 | _1360;
    assign _1321 = _1202[62:62];
    assign _2822 = _628 ? _1766 : _2820;
    assign _2820 = _598 ? _1766 : _646;
    assign _2823 = _583 ? _2822 : _2820;
    assign _2825 = _479 ? _1764 : _2823;
    assign _2827 = _477 ? _1764 : _2825;
    assign _117 = _2827;
    always @(posedge _284) begin
        if (_282)
            _646 <= _1764;
        else
            _646 <= _117;
    end
    assign _119 = host_lane1_sync_mask;
    assign _121 = host_lane1_sync;
    assign _2833 = _740 ? _2832 : _2830;
    assign _2834 = _628 ? _2830 : _2833;
    assign _2835 = _583 ? _2834 : _2830;
    assign _2837 = _479 ? _1630 : _2835;
    assign _122 = _2837;
    always @(posedge _284) begin
        if (_282)
            _2830 <= _1630;
        else
            _2830 <= _122;
    end
    assign _2831 = _2830[14:0];
    assign _2832 = { _2831,
                     _619 };
    assign _2838 = _2832 ^ _121;
    assign _2839 = _2838 & _119;
    assign _2841 = _2839 == _1630;
    assign _2843 = _2841 ? _1766 : _643;
    assign _2844 = _740 ? _2843 : _643;
    assign _2845 = _628 ? _643 : _2844;
    assign _2846 = _583 ? _2845 : _643;
    assign _2848 = _479 ? _1764 : _2846;
    assign _2850 = _477 ? _1764 : _2848;
    assign _123 = _2850;
    always @(posedge _284) begin
        if (_282)
            _643 <= _1764;
        else
            _643 <= _123;
    end
    assign _2863 = _619 == _2862;
    assign _2864 = ~ _2863;
    assign _2866 = _2857 ? _2865 : g_crc_bad;
    assign _2867 = _740 ? _2866 : g_crc_bad;
    assign _2868 = _628 ? g_crc_bad : _2867;
    assign _2869 = _583 ? _2868 : g_crc_bad;
    assign _2871 = _479 ? _1764 : _2869;
    assign _124 = _2871;
    always @(posedge _284) begin
        if (_282)
            g_crc_bad <= _1764;
        else
            g_crc_bad <= _124;
    end
    assign _2865 = g_crc_bad | _2864;
    assign _2874 = ~ _2865;
    assign _2872 = 6'b000001;
    assign _2873 = g_left == _2872;
    assign _2875 = _2873 ? _2874 : _640;
    assign _2876 = _2857 ? _2875 : _640;
    assign _2877 = _740 ? _2876 : _640;
    assign _2878 = _628 ? _640 : _2877;
    assign _2879 = _583 ? _2878 : _640;
    assign _2881 = _479 ? _1764 : _2879;
    assign _2883 = _477 ? _1764 : _2881;
    assign _125 = _2883;
    always @(posedge _284) begin
        if (_282)
            _640 <= _1764;
        else
            _640 <= _125;
    end
    assign _2887 = _467 ? _1766 : _2885;
    assign _2885 = _436 ? _1766 : _658;
    assign _2888 = _421 ? _2887 : _2885;
    assign _2890 = _307 ? _1764 : _2888;
    assign _2892 = _305 ? _1764 : _2890;
    assign _126 = _2892;
    always @(posedge _284) begin
        if (_282)
            _658 <= _1764;
        else
            _658 <= _126;
    end
    assign _128 = host_lane0_sync_mask;
    assign _130 = host_lane0_sync;
    assign _2898 = _661 ? _2897 : _2895;
    assign _2899 = _467 ? _2895 : _2898;
    assign _2900 = _421 ? _2899 : _2895;
    assign _2902 = _307 ? _1630 : _2900;
    assign _131 = _2902;
    always @(posedge _284) begin
        if (_282)
            _2895 <= _1630;
        else
            _2895 <= _131;
    end
    assign _2896 = _2895[14:0];
    assign _2897 = { _2896,
                     _457 };
    assign _2903 = _2897 ^ _130;
    assign _2904 = _2903 & _128;
    assign _2906 = _2904 == _1630;
    assign _2908 = _2906 ? _1766 : _655;
    assign _2909 = _661 ? _2908 : _655;
    assign _2910 = _467 ? _655 : _2909;
    assign _2911 = _421 ? _2910 : _655;
    assign _2913 = _307 ? _1764 : _2911;
    assign _2915 = _305 ? _1764 : _2913;
    assign _132 = _2915;
    always @(posedge _284) begin
        if (_282)
            _655 <= _1764;
        else
            _655 <= _132;
    end
    assign _2928 = _457 == _2927;
    assign _2929 = ~ _2928;
    assign _2931 = _2922 ? _2930 : g_crc_bad_0;
    assign _2932 = _661 ? _2931 : g_crc_bad_0;
    assign _2933 = _467 ? g_crc_bad_0 : _2932;
    assign _2934 = _421 ? _2933 : g_crc_bad_0;
    assign _2936 = _307 ? _1764 : _2934;
    assign _133 = _2936;
    always @(posedge _284) begin
        if (_282)
            g_crc_bad_0 <= _1764;
        else
            g_crc_bad_0 <= _133;
    end
    assign _2930 = g_crc_bad_0 | _2929;
    assign _2939 = ~ _2930;
    assign _2938 = g_left_0 == _2872;
    assign _2940 = _2938 ? _2939 : _652;
    assign _2941 = _2922 ? _2940 : _652;
    assign _2942 = _661 ? _2941 : _652;
    assign _2943 = _467 ? _652 : _2942;
    assign _2944 = _421 ? _2943 : _652;
    assign _2946 = _307 ? _1764 : _2944;
    assign _2948 = _305 ? _1764 : _2946;
    assign _134 = _2948;
    always @(posedge _284) begin
        if (_282)
            _652 <= _1764;
        else
            _652 <= _134;
    end
    assign _136 = host_match_addr;
    assign _1137 = _136[6:0];
    assign _1136 = _1128[7:1];
    assign _1138 = _1136 == _1137;
    assign _1133 = 16'b1010110011100001;
    assign _2953 = _1134[10:10];
    assign _2952 = _1134[12:12];
    assign _2954 = _2952 ^ _2953;
    assign _2951 = _1134[13:13];
    assign _2955 = _2951 ^ _2954;
    assign _2950 = _1134[15:15];
    assign _2956 = _2950 ^ _2955;
    assign _2949 = _1134[14:0];
    assign _2957 = { _2949,
                     _2956 };
    assign _137 = _2957;
    always @(posedge _284) begin
        if (_282)
            _1134 <= _1133;
        else
            _1134 <= _137;
    end
    assign _1135 = _1134[0:0];
    assign _2976 = _143 + _2348;
    assign _2974 = _143 - _2348;
    assign _2977 = _2413 ? _2976 : _2974;
    assign _2411 = _143 == _1925;
    assign _2462 = ~ _2411;
    assign _139 = host_rx_pop;
    assign _2463 = _139 & _2462;
    assign _2412 = ~ _711;
    assign _2445 = _823 & _1665;
    assign _2961 = _2445 ? _823 : _1764;
    assign _2439 = ~ _823;
    assign _2440 = _2439 & _1665;
    assign _2959 = _2440 ? _1766 : _823;
    assign _1664 = _1662 == _1902;
    assign _1665 = _1648 & _1664;
    assign _1671 = _823 | _1665;
    assign _1668 = _739 | _788;
    assign _1669 = ~ _1668;
    assign _1667 = ~ _709;
    assign _1670 = _1667 & _1669;
    assign _1672 = _1670 & _1671;
    assign _2962 = _1672 ? _2961 : _2959;
    assign _140 = _2962;
    always @(posedge _284) begin
        if (_282)
            _823 <= _1764;
        else
            _823 <= _140;
    end
    assign _2970 = _823 | _1665;
    assign _2436 = _739 & _788;
    assign _2966 = _2436 ? _739 : _1764;
    assign _2420 = ~ _739;
    assign _2421 = _2420 & _788;
    assign _2964 = _2421 ? _1766 : _739;
    assign _786 = ~ _752;
    assign _780 = g_bitpos + _468;
    assign _775 = ~ _613;
    assign g_tx_bit = _765 & _773;
    assign _776 = g_tx_bit & _775;
    assign _777 = _776 & g_data_left;
    assign _778 = _746 | _777;
    assign _781 = _778 ? _780 : g_bitpos;
    assign _783 = _781 == _438;
    assign _784 = ~ _783;
    assign _755 = _754 & _191;
    assign _785 = _755 & _784;
    assign _787 = _785 & _786;
    assign _751 = g_bitpos == _2405;
    assign _752 = _746 & _751;
    assign _788 = _752 | _787;
    assign _791 = _739 | _788;
    assign _790 = ~ _709;
    assign _792 = _790 & _791;
    assign _2967 = _792 ? _2966 : _2964;
    assign _141 = _2967;
    always @(posedge _284) begin
        if (_282)
            _739 <= _1764;
        else
            _739 <= _141;
    end
    assign _2968 = _739 | _788;
    assign _707 = ~ _673;
    assign _701 = g_bitpos_0 + _468;
    assign _696 = ~ _451;
    assign g_tx_bit_0 = _686 & _694;
    assign _697 = g_tx_bit_0 & _696;
    assign _698 = _697 & g_data_left_0;
    assign _699 = _667 | _698;
    assign _702 = _699 ? _701 : g_bitpos_0;
    assign _704 = _702 == _438;
    assign _705 = ~ _704;
    assign _676 = _675 & _243;
    assign _706 = _676 & _705;
    assign _708 = _706 & _707;
    assign _672 = g_bitpos_0 == _2405;
    assign _673 = _667 & _672;
    assign _709 = _673 | _708;
    assign _2969 = _709 | _2968;
    assign _2971 = _2969 | _2970;
    assign _142 = _2971;
    assign _2413 = _142 & _2412;
    assign _2972 = _2413 ^ _2463;
    assign _2978 = _2972 ? _2977 : _143;
    always @(posedge _284) begin
        if (_282)
            _2981 <= _1925;
        else
            _2981 <= _2978;
    end
    assign _143 = _2981;
    assign _711 = _143 == _1689;
    assign _2998 = _1128[6:0];
    assign _2999 = { _2998,
                     _2995 };
    assign _2996 = _1128[7:1];
    assign _2994 = _320[7:7];
    assign _2993 = _320[6:6];
    assign _2992 = _320[5:5];
    assign _2991 = _320[4:4];
    assign _2990 = _320[3:3];
    assign _2989 = _320[2:2];
    assign _2988 = _320[1:1];
    assign _2987 = _320[0:0];
    assign _2985 = _1214[102:100];
    assign _2984 = _1208[102:100];
    assign _2983 = _1202[102:100];
    assign _2982 = _850[102:100];
    always @* begin
        case (f_winner)
        0:
            _2986 <= _2982;
        1:
            _2986 <= _2983;
        2:
            _2986 <= _2984;
        default:
            _2986 <= _2985;
        endcase
    end
    always @* begin
        case (_2986)
        0:
            _2995 <= _2987;
        1:
            _2995 <= _2988;
        2:
            _2995 <= _2989;
        3:
            _2995 <= _2990;
        4:
            _2995 <= _2991;
        5:
            _2995 <= _2992;
        6:
            _2995 <= _2993;
        default:
            _2995 <= _2994;
        endcase
    end
    assign _2997 = { _2995,
                     _2996 };
    assign _1659 = _1214[97:96];
    assign _1658 = _1208[97:96];
    assign _1657 = _1202[97:96];
    assign _1656 = _850[97:96];
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
    assign _1662 = _834 ? _2524 : _1660;
    always @* begin
        case (_1662)
        0:
            _3000 <= _1128;
        1:
            _3000 <= _2997;
        2:
            _3000 <= _2999;
        default:
            _3000 <= _1128;
        endcase
    end
    assign _3001 = _1648 ? _3000 : _1128;
    assign _144 = _3001;
    always @(posedge _284) begin
        if (_282)
            _1128 <= _726;
        else
            _1128 <= _144;
    end
    assign _1129 = _1128[0:0];
    assign _3742 = _1124[7:1];
    assign _3743 = { vdd,
                     _3742 };
    assign _3740 = _3732[7:7];
    assign _3739 = _3732[6:6];
    assign _3738 = _3732[5:5];
    assign _3737 = _3732[4:4];
    assign _3736 = _3732[3:3];
    assign _3735 = _3732[2:2];
    assign _3734 = _3732[1:1];
    assign _3733 = _3732[0:0];
    assign _3741 = { _3733,
                     _3734,
                     _3735,
                     _3736,
                     _3737,
                     _3738,
                     _3739,
                     _3740 };
    assign _3725 = _249 + _2348;
    assign _3723 = _249 - _2348;
    assign _3726 = _3011 ? _3725 : _3723;
    assign _3415 = ~ _1131;
    assign _1759 = ~ _1131;
    assign _756 = ~ _191;
    assign _3375 = ~ _189;
    assign _3376 = _191 & _3375;
    assign _3379 = _3376 ? _1986 : _1987;
    assign _3368 = ~ _773;
    assign _3369 = _765 & _3368;
    assign _3370 = _637 | _3369;
    assign _3371 = _3370 | _3360;
    assign _3373 = _3371 ? _1987 : _3367;
    assign _3354 = g_run + _468;
    assign _3351 = g_run + _468;
    assign _3347 = vdd == g_last;
    assign _3345 = g_run == _438;
    assign _3346 = ~ _3345;
    assign _3348 = _3346 & _3347;
    assign _3352 = _3348 ? _3351 : _468;
    assign _3343 = _169 == _1987;
    assign _3355 = _3343 ? _3354 : _3352;
    assign _3356 = _3355 == _147;
    assign _3337 = g_run + _468;
    assign _3333 = gnd == g_last;
    assign _3331 = g_run == _438;
    assign _3332 = ~ _3331;
    assign _3334 = _3332 & _3333;
    assign _3338 = _3334 ? _3337 : _468;
    assign _3329 = _169 == _1987;
    assign _3340 = _3329 ? _438 : _3338;
    assign _3341 = _3340 == _147;
    assign _3357 = _619 ? _3356 : _3341;
    assign _3358 = _608 & _3357;
    assign _3359 = ~ _3358;
    assign _3325 = g_left == _2872;
    assign _3322 = 6'b000000;
    assign _3323 = g_left == _3322;
    assign _3326 = _2857 ? _3325 : _3323;
    assign _3318 = g_cnt + _4031;
    assign _3319 = _3318 == _163;
    assign _3316 = g_cnt == _163;
    assign _3320 = _746 ? _3319 : _3316;
    assign _3314 = ~ _628;
    assign _3315 = _583 & _3314;
    assign _3321 = _3315 & _3320;
    assign _3327 = _3321 & _3326;
    assign _3360 = _3327 & _3359;
    assign _3362 = _3360 ? _1902 : _3313;
    assign _3364 = _628 ? _2524 : _3362;
    assign _3310 = _773 ? _3308 : _1902;
    assign _3306 = _509 & _507;
    assign _3308 = _3306 ? _1987 : g_mode;
    assign _3311 = _765 ? _3310 : _3308;
    assign _3086 = _773 ? _3085 : _3004;
    assign _3087 = _765 ? _3086 : _3004;
    assign _145 = _3087;
    always @(posedge _284) begin
        if (_282)
            _3004 <= _1764;
        else
            _3004 <= _145;
    end
    assign _3236 = ~ _3085;
    assign _3234 = ~ f_lane1_out;
    assign _3235 = _3085 ? f_lane1_out : _3234;
    always @* begin
        case (_185)
        0:
            _3237 <= _3085;
        1:
            _3237 <= _3235;
        2:
            _3237 <= _3236;
        default:
            _3237 <= _3085;
        endcase
    end
    assign _147 = host_lane1_stuff_len;
    assign _3218 = g_run + _468;
    assign _3219 = _619 ? _3218 : _438;
    assign _3214 = g_run + _468;
    assign _3210 = _619 == g_last;
    assign _3208 = g_run == _438;
    assign _3209 = ~ _3208;
    assign _3211 = _3209 & _3210;
    assign _3215 = _3211 ? _3214 : _468;
    assign _3206 = _169 == _1987;
    assign _3220 = _3206 ? _3219 : _3215;
    assign _3221 = _628 ? _3204 : _3220;
    assign _3200 = g_run + _468;
    assign _3201 = _3085 ? _3200 : _438;
    assign _3196 = g_run + _468;
    assign _3082 = _3074[7:7];
    assign _3081 = _3074[6:6];
    assign _3080 = _3074[5:5];
    assign _3079 = _3074[4:4];
    assign _3078 = _3074[3:3];
    assign _3077 = _3074[2:2];
    assign _3076 = _3074[1:1];
    assign _3072 = _3064[7:7];
    assign _3071 = _3064[6:6];
    assign _3070 = _3064[5:5];
    assign _3069 = _3064[4:4];
    assign _3068 = _3064[3:3];
    assign _3067 = _3064[2:2];
    assign _3066 = _3064[1:1];
    assign _3063 = _1131 ? _728 : _3061;
    assign _2430 = g_byte[7:1];
    assign _2431 = { _619,
                     _2430 };
    assign _2428 = g_byte[6:0];
    assign _2429 = { _2428,
                     _619 };
    assign _2432 = _150 ? _2431 : _2429;
    assign _3092 = _746 ? _2432 : _3091;
    assign _3093 = _740 ? _3092 : _3091;
    assign _3094 = _628 ? _3091 : _3093;
    assign _3088 = g_data_left ? _3064 : g_byte;
    assign _3089 = _613 ? g_byte : _3088;
    assign _3090 = _773 ? _3089 : g_byte;
    assign _3091 = _765 ? _3090 : g_byte;
    assign _3095 = _583 ? _3094 : _3091;
    assign _148 = _3095;
    always @(posedge _284) begin
        if (_282)
            g_byte <= _726;
        else
            g_byte <= _148;
    end
    assign _1756 = g_bitpos == _438;
    assign _1753 = ~ _613;
    assign _1754 = _1753 & g_data_left;
    assign _1757 = _1754 & _1756;
    assign _3064 = _1757 ? _3063 : g_byte;
    assign _3065 = _3064[0:0];
    assign _3073 = { _3065,
                     _3066,
                     _3067,
                     _3068,
                     _3069,
                     _3070,
                     _3071,
                     _3072 };
    assign _150 = host_lane1_lsb_first;
    assign _3074 = _150 ? _3064 : _3073;
    assign _3075 = _3074[0:0];
    assign _3103 = g_bitpos + _468;
    assign _3104 = _746 ? _3103 : _3101;
    assign _3105 = _740 ? _3104 : _3101;
    assign _3106 = _628 ? _3101 : _3105;
    assign _3097 = g_bitpos + _468;
    assign _3098 = g_data_left ? _3097 : g_bitpos;
    assign _3099 = _613 ? g_bitpos : _3098;
    assign _3100 = _773 ? _3099 : g_bitpos;
    assign _3101 = _765 ? _3100 : g_bitpos;
    assign _3107 = _583 ? _3106 : _3101;
    assign _3109 = _479 ? _438 : _3107;
    assign _151 = _3109;
    always @(posedge _284) begin
        if (_282)
            g_bitpos <= _438;
        else
            g_bitpos <= _151;
    end
    always @* begin
        case (g_bitpos)
        0:
            _3083 <= _3075;
        1:
            _3083 <= _3076;
        2:
            _3083 <= _3077;
        3:
            _3083 <= _3078;
        4:
            _3083 <= _3079;
        5:
            _3083 <= _3080;
        6:
            _3083 <= _3081;
        default:
            _3083 <= _3082;
        endcase
    end
    assign _153 = host_lane1_crc_inv;
    assign _155 = host_lane1_init;
    assign _3151 = g_crc[30:0];
    assign _3153 = { _3151,
                     _1764 };
    assign _3145 = g_crc[31:31];
    assign _3146 = _619 ^ _3145;
    assign _3148 = _3146 ? _160 : _2030;
    assign _3142 = g_crc[30:0];
    assign _3144 = { _3142,
                     _1764 };
    assign _3149 = _3144 ^ _3148;
    assign _3150 = _746 ? _3149 : _3141;
    assign _157 = host_lane1_crc_width;
    assign _3119 = g_left - _2872;
    assign _3120 = _2857 ? _3119 : _3117;
    assign _3121 = _740 ? _3120 : _3117;
    assign _3122 = _628 ? _3117 : _3121;
    assign _3113 = g_left - _2872;
    assign _3114 = g_data_left ? g_left : _3113;
    assign _3115 = _613 ? g_left : _3114;
    assign _3116 = _773 ? _3115 : g_left;
    assign _3117 = _765 ? _3116 : g_left;
    assign _3123 = _583 ? _3122 : _3117;
    assign _3124 = _3111 ? _157 : _3123;
    assign _3126 = _479 ? _3322 : _3124;
    assign _158 = _3126;
    always @(posedge _284) begin
        if (_282)
            g_left <= _3322;
        else
            g_left <= _158;
    end
    assign _771 = g_left == _3322;
    assign _772 = ~ _771;
    assign _2855 = ~ g_data_left;
    assign _2854 = _583 & _740;
    assign _2856 = _2854 & _2855;
    assign _2857 = _2856 & _772;
    assign _3154 = _2857 ? _3153 : _3150;
    assign _3155 = _740 ? _3154 : _3141;
    assign _3156 = _628 ? _3141 : _3155;
    assign _160 = host_lane1_poly;
    assign _3133 = g_crc[31:31];
    assign _3134 = _3085 ^ _3133;
    assign _3136 = _3134 ? _160 : _2030;
    assign _3130 = g_crc[30:0];
    assign _3132 = { _3130,
                     _1764 };
    assign _3137 = _3132 ^ _3136;
    assign _3127 = g_crc[30:0];
    assign _3129 = { _3127,
                     _1764 };
    assign _3138 = g_data_left ? _3137 : _3129;
    assign _3139 = _613 ? g_crc : _3138;
    assign _3140 = _773 ? _3139 : g_crc;
    assign _3141 = _765 ? _3140 : g_crc;
    assign _3157 = _583 ? _3156 : _3141;
    assign _3158 = _479 ? _155 : _3157;
    assign _3160 = _477 ? _2030 : _3158;
    assign _161 = _3160;
    always @(posedge _284) begin
        if (_282)
            g_crc <= _2030;
        else
            g_crc <= _161;
    end
    assign _2861 = g_crc[31:31];
    assign _2862 = _2861 ^ _153;
    assign _163 = host_lane1_frame_bits;
    assign _3180 = g_cnt + _4031;
    assign _741 = _583 & _740;
    assign _746 = _741 & g_data_left;
    assign _3181 = _746 ? _3180 : _3178;
    assign _740 = ~ _613;
    assign _3182 = _740 ? _3181 : _3178;
    assign _3163 = _628 ? _3162 : _619;
    assign _3161 = _773 ? _3085 : g_last;
    assign _3162 = _765 ? _3161 : g_last;
    assign _3164 = _583 ? _3163 : _3162;
    assign _3166 = _479 ? _1766 : _3164;
    assign _164 = _3166;
    always @(posedge _284) begin
        if (_282)
            g_last <= vdd;
        else
            g_last <= _164;
    end
    assign _624 = ~ g_last;
    assign _621 = _169 == _1986;
    assign _625 = _621 ? _624 : gnd;
    assign _3168 = _185 == _1986;
    assign _3169 = _3168 ? _494 : g_prev;
    assign _3170 = _583 ? _3169 : g_prev;
    assign _3172 = _479 ? _1766 : _3170;
    assign _165 = _3172;
    always @(posedge _284) begin
        if (_282)
            g_prev <= vdd;
        else
            g_prev <= _165;
    end
    assign _618 = _494 == g_prev;
    assign _615 = _185 == _1986;
    assign _619 = _615 ? _618 : _494;
    assign _626 = _619 == _625;
    assign _627 = ~ _626;
    assign _628 = _613 & _627;
    assign _3183 = _628 ? _3178 : _3182;
    assign _3174 = g_cnt + _4031;
    assign _3175 = g_data_left ? _3174 : g_cnt;
    assign _3176 = _613 ? g_cnt : _3175;
    assign _3177 = _773 ? _3176 : g_cnt;
    assign _3178 = _765 ? _3177 : g_cnt;
    assign _3184 = _583 ? _3183 : _3178;
    assign _3186 = _479 ? _1630 : _3184;
    assign _166 = _3186;
    always @(posedge _284) begin
        if (_282)
            g_cnt <= _1630;
        else
            g_cnt <= _166;
    end
    assign g_data_left = g_cnt < _163;
    assign _3084 = g_data_left ? _3083 : _2862;
    assign _3085 = _613 ? _625 : _3084;
    assign _3192 = _3085 == g_last;
    assign _3190 = g_run == _438;
    assign _3191 = ~ _3190;
    assign _3193 = _3191 & _3192;
    assign _3197 = _3193 ? _3196 : _468;
    assign _3188 = _169 == _1987;
    assign _3202 = _3188 ? _3201 : _3197;
    assign _3203 = _773 ? _3202 : g_run;
    assign _3204 = _765 ? _3203 : g_run;
    assign _3222 = _583 ? _3221 : _3204;
    assign _3224 = _479 ? _438 : _3222;
    assign _167 = _3224;
    always @(posedge _284) begin
        if (_282)
            g_run <= _438;
        else
            g_run <= _167;
    end
    assign _612 = g_run == _147;
    assign _169 = host_lane1_stuff;
    assign _607 = _169 == _2524;
    assign _608 = ~ _607;
    assign _613 = _608 & _612;
    assign _766 = _613 | g_data_left;
    assign _773 = _766 | _772;
    assign _3238 = _773 ? _3237 : _1766;
    assign _3239 = _765 ? _3238 : f_lane1_out;
    assign _761 = _553 == _1630;
    assign _759 = _518 == _1630;
    assign _762 = _546 ? _761 : _759;
    assign _763 = _514 ? vdd : _762;
    assign _764 = _189 ? _581 : _763;
    assign _3231 = ~ _764;
    assign _3228 = _185 == _1987;
    assign _3225 = ~ _191;
    assign _3226 = _484 & _3225;
    assign _3229 = _3226 & _3228;
    assign _3230 = _3229 & _582;
    assign _3232 = _3230 & _3231;
    assign _3240 = _3232 ? _3004 : _3239;
    assign _3242 = _598 ? _1766 : _3240;
    assign _3244 = _754 ? _1766 : _3242;
    assign _3246 = _479 ? _1766 : _3244;
    assign _3248 = _477 ? _1766 : _3246;
    assign _170 = _3248;
    always @(posedge _284) begin
        if (_282)
            f_lane1_out <= vdd;
        else
            f_lane1_out <= _170;
    end
    assign _596 = _494 == f_lane1_out;
    assign _597 = ~ _596;
    assign _590 = _185 == _1987;
    assign _591 = ~ _590;
    assign _587 = ~ _189;
    assign _172 = host_lane1_readback;
    assign _584 = ~ _191;
    assign _585 = _484 & _584;
    assign _586 = _585 & _172;
    assign _588 = _586 & _587;
    assign _592 = _588 & _591;
    assign _593 = _592 & _582;
    assign _598 = _593 & _597;
    assign _3313 = _598 ? _2524 : _3311;
    assign _579 = ~ _567;
    assign _580 = _576 & _579;
    assign _575 = _332[7:7];
    assign _574 = _332[6:6];
    assign _573 = _332[5:5];
    assign _572 = _332[4:4];
    assign _571 = _332[3:3];
    assign _570 = _332[2:2];
    assign _569 = _332[1:1];
    assign _568 = _332[0:0];
    always @* begin
        case (_174)
        0:
            _576 <= _568;
        1:
            _576 <= _569;
        2:
            _576 <= _570;
        3:
            _576 <= _571;
        4:
            _576 <= _572;
        5:
            _576 <= _573;
        6:
            _576 <= _574;
        default:
            _576 <= _575;
        endcase
    end
    assign _577 = ~ _576;
    assign _566 = _320[7:7];
    assign _565 = _320[6:6];
    assign _564 = _320[5:5];
    assign _563 = _320[4:4];
    assign _562 = _320[3:3];
    assign _561 = _320[2:2];
    assign _560 = _320[1:1];
    assign _559 = _320[0:0];
    assign _174 = host_lane1_clk_pin;
    always @* begin
        case (_174)
        0:
            _567 <= _559;
        1:
            _567 <= _560;
        2:
            _567 <= _561;
        3:
            _567 <= _562;
        4:
            _567 <= _563;
        5:
            _567 <= _564;
        6:
            _567 <= _565;
        default:
            _567 <= _566;
        endcase
    end
    assign _578 = _567 & _577;
    assign _176 = host_lane1_clk_edge;
    assign _581 = _176 ? _580 : _578;
    assign _557 = _542 == _1630;
    assign _554 = _553 == _542;
    assign _547 = _518 == _542;
    assign _545 = ~ _509;
    assign _536 = _178[15:2];
    assign _537 = { _2524,
                    _536 };
    assign _533 = _178[15:1];
    assign _534 = { _1764,
                    _533 };
    assign _538 = _534 + _537;
    assign _530 = _178[15:1];
    assign _531 = { _1764,
                    _530 };
    assign _528 = _191 & _511;
    assign _539 = _528 ? _538 : _531;
    always @(posedge _284) begin
        if (_282)
            _542 <= _1630;
        else
            _542 <= _539;
    end
    assign _543 = _518 < _542;
    assign _520 = _178[15:2];
    assign _521 = { _2524,
                    _520 };
    always @(posedge _284) begin
        if (_282)
            _524 <= _1630;
        else
            _524 <= _521;
    end
    assign _3294 = ~ _509;
    assign _3295 = _544 & _3294;
    assign _3296 = _3295 ? _553 : _518;
    assign _3298 = _514 ? _1630 : _3296;
    assign _3300 = _3298 + _4031;
    assign _3278 = _3272 == _1587;
    assign _549 = _178[15:1];
    assign _550 = { _1764,
                    _549 };
    always @(posedge _284) begin
        if (_282)
            _553 <= _1630;
        else
            _553 <= _550;
    end
    assign _3274 = { gnd,
                     _553 };
    assign _3275 = _3274 == _3272;
    assign _3268 = { gnd,
                     _178 };
    always @(posedge _284) begin
        if (_282)
            _3271 <= _1587;
        else
            _3271 <= _3268;
    end
    assign _3263 = 17'b00000000000000001;
    assign _178 = host_lane1_div_int;
    assign _3262 = { gnd,
                     _178 };
    assign _3264 = _3262 - _3263;
    always @(posedge _284) begin
        if (_282)
            _3267 <= _1587;
        else
            _3267 <= _3264;
    end
    assign _180 = host_lane1_div_frac;
    assign _3282 = { gnd,
                     _180 };
    assign _3284 = _3283[7:0];
    assign _3285 = _3280 ? _3284 : _3256;
    assign _3286 = _3253 ? _3285 : _3256;
    assign _3288 = _479 ? _726 : _3286;
    assign _181 = _3288;
    always @(posedge _284) begin
        if (_282)
            _3256 <= _726;
        else
            _3256 <= _181;
    end
    assign _3281 = { gnd,
                     _3256 };
    assign _3283 = _3281 + _3282;
    assign _3289 = _3283[8:8];
    assign _3290 = _3280 ? _3289 : _3261;
    assign _3291 = _3253 ? _3290 : _3261;
    assign _3293 = _479 ? _1764 : _3291;
    assign _182 = _3293;
    always @(posedge _284) begin
        if (_282)
            _3261 <= _1764;
        else
            _3261 <= _182;
    end
    assign _3272 = _3261 ? _3271 : _3267;
    assign _3258 = { gnd,
                     _518 };
    assign _3273 = _3258 == _3272;
    assign _3276 = _546 ? _3275 : _3273;
    assign _3279 = _514 ? _3278 : _3276;
    assign _3257 = ~ _189;
    assign _3280 = _3257 & _3279;
    assign _3302 = _3280 ? _1630 : _3300;
    assign _3252 = ~ _189;
    assign _3250 = _509 & _507;
    assign _637 = g_mode == _1902;
    assign _3249 = _484 | _637;
    assign _3251 = _3249 | _3250;
    assign _3253 = _3251 & _3252;
    assign _3303 = _3253 ? _3302 : _518;
    assign _3305 = _479 ? _1630 : _3303;
    assign _183 = _3305;
    always @(posedge _284) begin
        if (_282)
            _518 <= _1630;
        else
            _518 <= _183;
    end
    assign _525 = _518 < _524;
    assign _526 = ~ _525;
    assign _515 = _507 & _511;
    assign _527 = _515 & _526;
    assign _544 = _527 & _543;
    assign _546 = _544 & _545;
    assign _555 = _546 ? _554 : _547;
    assign _185 = host_lane1_code;
    assign _511 = _185 == _1987;
    assign _512 = ~ _511;
    assign _509 = g_mode == _1986;
    assign _513 = _509 | _512;
    assign _506 = ~ _189;
    assign _502 = _332[7:7];
    assign _501 = _332[6:6];
    assign _500 = _332[5:5];
    assign _499 = _332[4:4];
    assign _498 = _332[3:3];
    assign _497 = _332[2:2];
    assign _496 = _332[1:1];
    assign _495 = _332[0:0];
    always @* begin
        case (_187)
        0:
            _503 <= _495;
        1:
            _503 <= _496;
        2:
            _503 <= _497;
        3:
            _503 <= _498;
        4:
            _503 <= _499;
        5:
            _503 <= _500;
        6:
            _503 <= _501;
        default:
            _503 <= _502;
        endcase
    end
    assign _493 = _320[7:7];
    assign _492 = _320[6:6];
    assign _491 = _320[5:5];
    assign _490 = _320[4:4];
    assign _489 = _320[3:3];
    assign _488 = _320[2:2];
    assign _487 = _320[1:1];
    assign _486 = _320[0:0];
    assign _187 = host_lane1_data_pin;
    always @* begin
        case (_187)
        0:
            _494 <= _486;
        1:
            _494 <= _487;
        2:
            _494 <= _488;
        3:
            _494 <= _489;
        4:
            _494 <= _490;
        5:
            _494 <= _491;
        6:
            _494 <= _492;
        default:
            _494 <= _493;
        endcase
    end
    assign _504 = _494 ^ _503;
    assign _505 = _191 & _504;
    assign _507 = _505 & _506;
    assign _514 = _507 & _513;
    assign _558 = _514 ? _557 : _555;
    assign _189 = host_lane1_clk_pin_en;
    assign _582 = _189 ? _581 : _558;
    assign _191 = host_lane1_dir;
    assign _485 = _484 & _191;
    assign _583 = _485 & _582;
    assign _3365 = _583 ? _3364 : _3313;
    assign _754 = _244 == _2399;
    assign _3367 = _754 ? _2524 : _3365;
    assign _3111 = _244 == _2405;
    assign _3374 = _3111 ? _3373 : _3367;
    assign _479 = _244 == _1808;
    assign _3380 = _479 ? _3379 : _3374;
    assign _476 = _244 == _441;
    assign _477 = _476 | _291;
    assign _3382 = _477 ? _2524 : _3380;
    assign _192 = _3382;
    always @(posedge _284) begin
        if (_282)
            g_mode <= _2524;
        else
            g_mode <= _192;
    end
    assign _484 = g_mode == _1987;
    assign _757 = _484 & _756;
    assign _765 = _757 & _764;
    assign _1758 = _765 & _1757;
    assign _1760 = _1758 & _1759;
    assign _1751 = ~ _1131;
    assign _677 = ~ _243;
    assign _3711 = ~ _241;
    assign _3712 = _243 & _3711;
    assign _3715 = _3712 ? _1986 : _1987;
    assign _3704 = ~ _694;
    assign _3705 = _686 & _3704;
    assign _3706 = _649 | _3705;
    assign _3707 = _3706 | _3696;
    assign _3709 = _3707 ? _1987 : _3703;
    assign _3690 = g_run_0 + _468;
    assign _3687 = g_run_0 + _468;
    assign _3683 = vdd == g_last_0;
    assign _3681 = g_run_0 == _438;
    assign _3682 = ~ _3681;
    assign _3684 = _3682 & _3683;
    assign _3688 = _3684 ? _3687 : _468;
    assign _3679 = _221 == _1987;
    assign _3691 = _3679 ? _3690 : _3688;
    assign _3692 = _3691 == _195;
    assign _3673 = g_run_0 + _468;
    assign _3669 = gnd == g_last_0;
    assign _3667 = g_run_0 == _438;
    assign _3668 = ~ _3667;
    assign _3670 = _3668 & _3669;
    assign _3674 = _3670 ? _3673 : _468;
    assign _3665 = _221 == _1987;
    assign _3676 = _3665 ? _438 : _3674;
    assign _3677 = _3676 == _195;
    assign _3693 = _457 ? _3692 : _3677;
    assign _3694 = _446 & _3693;
    assign _3695 = ~ _3694;
    assign _3661 = g_left_0 == _2872;
    assign _3659 = g_left_0 == _3322;
    assign _3662 = _2922 ? _3661 : _3659;
    assign _3654 = g_cnt_0 + _4031;
    assign _3655 = _3654 == _215;
    assign _3652 = g_cnt_0 == _215;
    assign _3656 = _667 ? _3655 : _3652;
    assign _3650 = ~ _467;
    assign _3651 = _421 & _3650;
    assign _3657 = _3651 & _3656;
    assign _3663 = _3657 & _3662;
    assign _3696 = _3663 & _3695;
    assign _3698 = _3696 ? _1902 : _3649;
    assign _3700 = _467 ? _2524 : _3698;
    assign _3646 = _694 ? _3644 : _1902;
    assign _3642 = _347 & _345;
    assign _3644 = _3642 ? _1987 : g_mode_0;
    assign _3647 = _686 ? _3646 : _3644;
    assign _3410 = _694 ? _3409 : _3385;
    assign _3411 = _686 ? _3410 : _3385;
    assign _193 = _3411;
    always @(posedge _284) begin
        if (_282)
            _3385 <= _1764;
        else
            _3385 <= _193;
    end
    assign _3568 = ~ _3409;
    assign _3566 = ~ f_lane0_out;
    assign _3567 = _3409 ? f_lane0_out : _3566;
    always @* begin
        case (_237)
        0:
            _3569 <= _3409;
        1:
            _3569 <= _3567;
        2:
            _3569 <= _3568;
        default:
            _3569 <= _3409;
        endcase
    end
    assign _195 = host_lane0_stuff_len;
    assign _3550 = g_run_0 + _468;
    assign _3551 = _457 ? _3550 : _438;
    assign _3546 = g_run_0 + _468;
    assign _3542 = _457 == g_last_0;
    assign _3540 = g_run_0 == _438;
    assign _3541 = ~ _3540;
    assign _3543 = _3541 & _3542;
    assign _3547 = _3543 ? _3546 : _468;
    assign _3538 = _221 == _1987;
    assign _3552 = _3538 ? _3551 : _3547;
    assign _3553 = _467 ? _3536 : _3552;
    assign _3532 = g_run_0 + _468;
    assign _3533 = _3409 ? _3532 : _438;
    assign _3528 = g_run_0 + _468;
    assign _3406 = _3398[7:7];
    assign _3405 = _3398[6:6];
    assign _3404 = _3398[5:5];
    assign _3403 = _3398[4:4];
    assign _3402 = _3398[3:3];
    assign _3401 = _3398[2:2];
    assign _3400 = _3398[1:1];
    assign _3396 = _3388[7:7];
    assign _3395 = _3388[6:6];
    assign _3394 = _3388[5:5];
    assign _3393 = _3388[4:4];
    assign _3392 = _3388[3:3];
    assign _3391 = _3388[2:2];
    assign _3390 = _3388[1:1];
    assign _3058 = _3014 == _2405;
    assign _3059 = _3011 & _3058;
    always @(posedge _284) begin
        if (_282)
            _3060 <= _726;
        else
            if (_3059)
                _3060 <= _198;
    end
    assign _3052 = _3014 == _2399;
    assign _3053 = _3011 & _3052;
    always @(posedge _284) begin
        if (_282)
            _3054 <= _726;
        else
            if (_3053)
                _3054 <= _198;
    end
    assign _3046 = _3014 == _1808;
    assign _3047 = _3011 & _3046;
    always @(posedge _284) begin
        if (_282)
            _3048 <= _726;
        else
            if (_3047)
                _3048 <= _198;
    end
    assign _3040 = _3014 == _441;
    assign _3041 = _3011 & _3040;
    always @(posedge _284) begin
        if (_282)
            _3042 <= _726;
        else
            if (_3041)
                _3042 <= _198;
    end
    assign _3034 = _3014 == _1810;
    assign _3035 = _3011 & _3034;
    always @(posedge _284) begin
        if (_282)
            _3036 <= _726;
        else
            if (_3035)
                _3036 <= _198;
    end
    assign _3028 = _3014 == _440;
    assign _3029 = _3011 & _3028;
    always @(posedge _284) begin
        if (_282)
            _3030 <= _726;
        else
            if (_3029)
                _3030 <= _198;
    end
    assign _3022 = _3014 == _468;
    assign _3023 = _3011 & _3022;
    always @(posedge _284) begin
        if (_282)
            _3024 <= _726;
        else
            if (_3023)
                _3024 <= _198;
    end
    assign _3413 = _3014 + _468;
    assign _3414 = _3011 ? _3413 : _3014;
    assign _196 = _3414;
    always @(posedge _284) begin
        if (_282)
            _3014 <= _438;
        else
            _3014 <= _196;
    end
    assign _3016 = _3014 == _438;
    assign _3017 = _3011 & _3016;
    assign _198 = host_tx_data;
    always @(posedge _284) begin
        if (_282)
            _3018 <= _726;
        else
            if (_3017)
                _3018 <= _198;
    end
    assign _3418 = _3007 + _468;
    assign _3419 = _3416 ? _3418 : _3007;
    assign _199 = _3419;
    always @(posedge _284) begin
        if (_282)
            _3007 <= _438;
        else
            _3007 <= _199;
    end
    always @* begin
        case (_3007)
        0:
            _3061 <= _3018;
        1:
            _3061 <= _3024;
        2:
            _3061 <= _3030;
        3:
            _3061 <= _3036;
        4:
            _3061 <= _3042;
        5:
            _3061 <= _3048;
        6:
            _3061 <= _3054;
        default:
            _3061 <= _3060;
        endcase
    end
    assign _3387 = _1131 ? _728 : _3061;
    assign _2456 = g_byte_0[7:1];
    assign _2457 = { _457,
                     _2456 };
    assign _2454 = g_byte_0[6:0];
    assign _2455 = { _2454,
                     _457 };
    assign _2458 = _202 ? _2457 : _2455;
    assign _3424 = _667 ? _2458 : _3423;
    assign _3425 = _661 ? _3424 : _3423;
    assign _3426 = _467 ? _3423 : _3425;
    assign _3420 = g_data_left_0 ? _3388 : g_byte_0;
    assign _3421 = _451 ? g_byte_0 : _3420;
    assign _3422 = _694 ? _3421 : g_byte_0;
    assign _3423 = _686 ? _3422 : g_byte_0;
    assign _3427 = _421 ? _3426 : _3423;
    assign _200 = _3427;
    always @(posedge _284) begin
        if (_282)
            g_byte_0 <= _726;
        else
            g_byte_0 <= _200;
    end
    assign _1748 = g_bitpos_0 == _438;
    assign _1745 = ~ _451;
    assign _1746 = _1745 & g_data_left_0;
    assign _1749 = _1746 & _1748;
    assign _3388 = _1749 ? _3387 : g_byte_0;
    assign _3389 = _3388[0:0];
    assign _3397 = { _3389,
                     _3390,
                     _3391,
                     _3392,
                     _3393,
                     _3394,
                     _3395,
                     _3396 };
    assign _202 = host_lane0_lsb_first;
    assign _3398 = _202 ? _3388 : _3397;
    assign _3399 = _3398[0:0];
    assign _3435 = g_bitpos_0 + _468;
    assign _3436 = _667 ? _3435 : _3433;
    assign _3437 = _661 ? _3436 : _3433;
    assign _3438 = _467 ? _3433 : _3437;
    assign _3429 = g_bitpos_0 + _468;
    assign _3430 = g_data_left_0 ? _3429 : g_bitpos_0;
    assign _3431 = _451 ? g_bitpos_0 : _3430;
    assign _3432 = _694 ? _3431 : g_bitpos_0;
    assign _3433 = _686 ? _3432 : g_bitpos_0;
    assign _3439 = _421 ? _3438 : _3433;
    assign _3441 = _307 ? _438 : _3439;
    assign _203 = _3441;
    always @(posedge _284) begin
        if (_282)
            g_bitpos_0 <= _438;
        else
            g_bitpos_0 <= _203;
    end
    always @* begin
        case (g_bitpos_0)
        0:
            _3407 <= _3399;
        1:
            _3407 <= _3400;
        2:
            _3407 <= _3401;
        3:
            _3407 <= _3402;
        4:
            _3407 <= _3403;
        5:
            _3407 <= _3404;
        6:
            _3407 <= _3405;
        default:
            _3407 <= _3406;
        endcase
    end
    assign _205 = host_lane0_crc_inv;
    assign _207 = host_lane0_init;
    assign _3483 = g_crc_0[30:0];
    assign _3485 = { _3483,
                     _1764 };
    assign _3477 = g_crc_0[31:31];
    assign _3478 = _457 ^ _3477;
    assign _3480 = _3478 ? _212 : _2030;
    assign _3474 = g_crc_0[30:0];
    assign _3476 = { _3474,
                     _1764 };
    assign _3481 = _3476 ^ _3480;
    assign _3482 = _667 ? _3481 : _3473;
    assign _209 = host_lane0_crc_width;
    assign _3451 = g_left_0 - _2872;
    assign _3452 = _2922 ? _3451 : _3449;
    assign _3453 = _661 ? _3452 : _3449;
    assign _3454 = _467 ? _3449 : _3453;
    assign _3445 = g_left_0 - _2872;
    assign _3446 = g_data_left_0 ? g_left_0 : _3445;
    assign _3447 = _451 ? g_left_0 : _3446;
    assign _3448 = _694 ? _3447 : g_left_0;
    assign _3449 = _686 ? _3448 : g_left_0;
    assign _3455 = _421 ? _3454 : _3449;
    assign _3456 = _3443 ? _209 : _3455;
    assign _3458 = _307 ? _3322 : _3456;
    assign _210 = _3458;
    always @(posedge _284) begin
        if (_282)
            g_left_0 <= _3322;
        else
            g_left_0 <= _210;
    end
    assign _692 = g_left_0 == _3322;
    assign _693 = ~ _692;
    assign _2920 = ~ g_data_left_0;
    assign _2919 = _421 & _661;
    assign _2921 = _2919 & _2920;
    assign _2922 = _2921 & _693;
    assign _3486 = _2922 ? _3485 : _3482;
    assign _3487 = _661 ? _3486 : _3473;
    assign _3488 = _467 ? _3473 : _3487;
    assign _212 = host_lane0_poly;
    assign _3465 = g_crc_0[31:31];
    assign _3466 = _3409 ^ _3465;
    assign _3468 = _3466 ? _212 : _2030;
    assign _3462 = g_crc_0[30:0];
    assign _3464 = { _3462,
                     _1764 };
    assign _3469 = _3464 ^ _3468;
    assign _3459 = g_crc_0[30:0];
    assign _3461 = { _3459,
                     _1764 };
    assign _3470 = g_data_left_0 ? _3469 : _3461;
    assign _3471 = _451 ? g_crc_0 : _3470;
    assign _3472 = _694 ? _3471 : g_crc_0;
    assign _3473 = _686 ? _3472 : g_crc_0;
    assign _3489 = _421 ? _3488 : _3473;
    assign _3490 = _307 ? _207 : _3489;
    assign _3492 = _305 ? _2030 : _3490;
    assign _213 = _3492;
    always @(posedge _284) begin
        if (_282)
            g_crc_0 <= _2030;
        else
            g_crc_0 <= _213;
    end
    assign _2926 = g_crc_0[31:31];
    assign _2927 = _2926 ^ _205;
    assign _215 = host_lane0_frame_bits;
    assign _3512 = g_cnt_0 + _4031;
    assign _662 = _421 & _661;
    assign _667 = _662 & g_data_left_0;
    assign _3513 = _667 ? _3512 : _3510;
    assign _661 = ~ _451;
    assign _3514 = _661 ? _3513 : _3510;
    assign _3495 = _467 ? _3494 : _457;
    assign _3493 = _694 ? _3409 : g_last_0;
    assign _3494 = _686 ? _3493 : g_last_0;
    assign _3496 = _421 ? _3495 : _3494;
    assign _3498 = _307 ? _1766 : _3496;
    assign _216 = _3498;
    always @(posedge _284) begin
        if (_282)
            g_last_0 <= vdd;
        else
            g_last_0 <= _216;
    end
    assign _463 = ~ g_last_0;
    assign _459 = _221 == _1986;
    assign _464 = _459 ? _463 : gnd;
    assign _3500 = _237 == _1986;
    assign _3501 = _3500 ? _329 : g_prev_0;
    assign _3502 = _421 ? _3501 : g_prev_0;
    assign _3504 = _307 ? _1766 : _3502;
    assign _217 = _3504;
    always @(posedge _284) begin
        if (_282)
            g_prev_0 <= vdd;
        else
            g_prev_0 <= _217;
    end
    assign _456 = _329 == g_prev_0;
    assign _453 = _237 == _1986;
    assign _457 = _453 ? _456 : _329;
    assign _465 = _457 == _464;
    assign _466 = ~ _465;
    assign _467 = _451 & _466;
    assign _3515 = _467 ? _3510 : _3514;
    assign _3506 = g_cnt_0 + _4031;
    assign _3507 = g_data_left_0 ? _3506 : g_cnt_0;
    assign _3508 = _451 ? g_cnt_0 : _3507;
    assign _3509 = _694 ? _3508 : g_cnt_0;
    assign _3510 = _686 ? _3509 : g_cnt_0;
    assign _3516 = _421 ? _3515 : _3510;
    assign _3518 = _307 ? _1630 : _3516;
    assign _218 = _3518;
    always @(posedge _284) begin
        if (_282)
            g_cnt_0 <= _1630;
        else
            g_cnt_0 <= _218;
    end
    assign g_data_left_0 = g_cnt_0 < _215;
    assign _3408 = g_data_left_0 ? _3407 : _2927;
    assign _3409 = _451 ? _464 : _3408;
    assign _3524 = _3409 == g_last_0;
    assign _3522 = g_run_0 == _438;
    assign _3523 = ~ _3522;
    assign _3525 = _3523 & _3524;
    assign _3529 = _3525 ? _3528 : _468;
    assign _3520 = _221 == _1987;
    assign _3534 = _3520 ? _3533 : _3529;
    assign _3535 = _694 ? _3534 : g_run_0;
    assign _3536 = _686 ? _3535 : g_run_0;
    assign _3554 = _421 ? _3553 : _3536;
    assign _3556 = _307 ? _438 : _3554;
    assign _219 = _3556;
    always @(posedge _284) begin
        if (_282)
            g_run_0 <= _438;
        else
            g_run_0 <= _219;
    end
    assign _450 = g_run_0 == _195;
    assign _221 = host_lane0_stuff;
    assign _445 = _221 == _2524;
    assign _446 = ~ _445;
    assign _451 = _446 & _450;
    assign _687 = _451 | g_data_left_0;
    assign _694 = _687 | _693;
    assign _3570 = _694 ? _3569 : _1766;
    assign _3571 = _686 ? _3570 : f_lane0_out;
    assign _682 = _391 == _1630;
    assign _680 = _356 == _1630;
    assign _683 = _384 ? _682 : _680;
    assign _684 = _352 ? vdd : _683;
    assign _685 = _241 ? _419 : _684;
    assign _3563 = ~ _685;
    assign _3560 = _237 == _1987;
    assign _3557 = ~ _243;
    assign _3558 = _313 & _3557;
    assign _3561 = _3558 & _3560;
    assign _3562 = _3561 & _420;
    assign _3564 = _3562 & _3563;
    assign _3572 = _3564 ? _3385 : _3571;
    assign _3574 = _436 ? _1766 : _3572;
    assign _3576 = _675 ? _1766 : _3574;
    assign _3578 = _307 ? _1766 : _3576;
    assign _3580 = _305 ? _1766 : _3578;
    assign _222 = _3580;
    always @(posedge _284) begin
        if (_282)
            f_lane0_out <= vdd;
        else
            f_lane0_out <= _222;
    end
    assign _434 = _329 == f_lane0_out;
    assign _435 = ~ _434;
    assign _428 = _237 == _1987;
    assign _429 = ~ _428;
    assign _425 = ~ _241;
    assign _224 = host_lane0_readback;
    assign _422 = ~ _243;
    assign _423 = _313 & _422;
    assign _424 = _423 & _224;
    assign _426 = _424 & _425;
    assign _430 = _426 & _429;
    assign _431 = _430 & _420;
    assign _436 = _431 & _435;
    assign _3649 = _436 ? _2524 : _3647;
    assign _417 = ~ _405;
    assign _418 = _414 & _417;
    assign _413 = _332[7:7];
    assign _412 = _332[6:6];
    assign _411 = _332[5:5];
    assign _410 = _332[4:4];
    assign _409 = _332[3:3];
    assign _408 = _332[2:2];
    assign _407 = _332[1:1];
    assign _406 = _332[0:0];
    always @* begin
        case (_226)
        0:
            _414 <= _406;
        1:
            _414 <= _407;
        2:
            _414 <= _408;
        3:
            _414 <= _409;
        4:
            _414 <= _410;
        5:
            _414 <= _411;
        6:
            _414 <= _412;
        default:
            _414 <= _413;
        endcase
    end
    assign _415 = ~ _414;
    assign _404 = _320[7:7];
    assign _403 = _320[6:6];
    assign _402 = _320[5:5];
    assign _401 = _320[4:4];
    assign _400 = _320[3:3];
    assign _399 = _320[2:2];
    assign _398 = _320[1:1];
    assign _397 = _320[0:0];
    assign _226 = host_lane0_clk_pin;
    always @* begin
        case (_226)
        0:
            _405 <= _397;
        1:
            _405 <= _398;
        2:
            _405 <= _399;
        3:
            _405 <= _400;
        4:
            _405 <= _401;
        5:
            _405 <= _402;
        6:
            _405 <= _403;
        default:
            _405 <= _404;
        endcase
    end
    assign _416 = _405 & _415;
    assign _228 = host_lane0_clk_edge;
    assign _419 = _228 ? _418 : _416;
    assign _395 = _380 == _1630;
    assign _392 = _391 == _380;
    assign _385 = _356 == _380;
    assign _383 = ~ _347;
    assign _374 = _230[15:2];
    assign _375 = { _2524,
                    _374 };
    assign _371 = _230[15:1];
    assign _372 = { _1764,
                    _371 };
    assign _376 = _372 + _375;
    assign _368 = _230[15:1];
    assign _369 = { _1764,
                    _368 };
    assign _366 = _243 & _349;
    assign _377 = _366 ? _376 : _369;
    always @(posedge _284) begin
        if (_282)
            _380 <= _1630;
        else
            _380 <= _377;
    end
    assign _381 = _356 < _380;
    assign _358 = _230[15:2];
    assign _359 = { _2524,
                    _358 };
    always @(posedge _284) begin
        if (_282)
            _362 <= _1630;
        else
            _362 <= _359;
    end
    assign _3626 = ~ _347;
    assign _3627 = _382 & _3626;
    assign _3628 = _3627 ? _391 : _356;
    assign _3630 = _352 ? _1630 : _3628;
    assign _3632 = _3630 + _4031;
    assign _3610 = _3604 == _1587;
    assign _387 = _230[15:1];
    assign _388 = { _1764,
                    _387 };
    always @(posedge _284) begin
        if (_282)
            _391 <= _1630;
        else
            _391 <= _388;
    end
    assign _3606 = { gnd,
                     _391 };
    assign _3607 = _3606 == _3604;
    assign _3600 = { gnd,
                     _230 };
    always @(posedge _284) begin
        if (_282)
            _3603 <= _1587;
        else
            _3603 <= _3600;
    end
    assign _230 = host_lane0_div_int;
    assign _3594 = { gnd,
                     _230 };
    assign _3596 = _3594 - _3263;
    always @(posedge _284) begin
        if (_282)
            _3599 <= _1587;
        else
            _3599 <= _3596;
    end
    assign _232 = host_lane0_div_frac;
    assign _3614 = { gnd,
                     _232 };
    assign _3616 = _3615[7:0];
    assign _3617 = _3612 ? _3616 : _3588;
    assign _3618 = _3585 ? _3617 : _3588;
    assign _3620 = _307 ? _726 : _3618;
    assign _233 = _3620;
    always @(posedge _284) begin
        if (_282)
            _3588 <= _726;
        else
            _3588 <= _233;
    end
    assign _3613 = { gnd,
                     _3588 };
    assign _3615 = _3613 + _3614;
    assign _3621 = _3615[8:8];
    assign _3622 = _3612 ? _3621 : _3593;
    assign _3623 = _3585 ? _3622 : _3593;
    assign _3625 = _307 ? _1764 : _3623;
    assign _234 = _3625;
    always @(posedge _284) begin
        if (_282)
            _3593 <= _1764;
        else
            _3593 <= _234;
    end
    assign _3604 = _3593 ? _3603 : _3599;
    assign _3590 = { gnd,
                     _356 };
    assign _3605 = _3590 == _3604;
    assign _3608 = _384 ? _3607 : _3605;
    assign _3611 = _352 ? _3610 : _3608;
    assign _3589 = ~ _241;
    assign _3612 = _3589 & _3611;
    assign _3634 = _3612 ? _1630 : _3632;
    assign _3584 = ~ _241;
    assign _3582 = _347 & _345;
    assign _649 = g_mode_0 == _1902;
    assign _3581 = _313 | _649;
    assign _3583 = _3581 | _3582;
    assign _3585 = _3583 & _3584;
    assign _3635 = _3585 ? _3634 : _356;
    assign _3637 = _307 ? _1630 : _3635;
    assign _235 = _3637;
    always @(posedge _284) begin
        if (_282)
            _356 <= _1630;
        else
            _356 <= _235;
    end
    assign _363 = _356 < _362;
    assign _364 = ~ _363;
    assign _353 = _345 & _349;
    assign _365 = _353 & _364;
    assign _382 = _365 & _381;
    assign _384 = _382 & _383;
    assign _393 = _384 ? _392 : _385;
    assign _237 = host_lane0_code;
    assign _349 = _237 == _1987;
    assign _350 = ~ _349;
    assign _347 = g_mode_0 == _1986;
    assign _351 = _347 | _350;
    assign _344 = ~ _241;
    assign _340 = _332[7:7];
    assign _339 = _332[6:6];
    assign _338 = _332[5:5];
    assign _337 = _332[4:4];
    assign _336 = _332[3:3];
    assign _335 = _332[2:2];
    assign _334 = _332[1:1];
    assign _333 = _332[0:0];
    always @* begin
        case (_239)
        0:
            _341 <= _333;
        1:
            _341 <= _334;
        2:
            _341 <= _335;
        3:
            _341 <= _336;
        4:
            _341 <= _337;
        5:
            _341 <= _338;
        6:
            _341 <= _339;
        default:
            _341 <= _340;
        endcase
    end
    assign _328 = _320[7:7];
    assign _327 = _320[6:6];
    assign _326 = _320[5:5];
    assign _325 = _320[4:4];
    assign _324 = _320[3:3];
    assign _323 = _320[2:2];
    assign _322 = _320[1:1];
    assign _321 = _320[0:0];
    assign _239 = host_lane0_data_pin;
    always @* begin
        case (_239)
        0:
            _329 <= _321;
        1:
            _329 <= _322;
        2:
            _329 <= _323;
        3:
            _329 <= _324;
        4:
            _329 <= _325;
        5:
            _329 <= _326;
        6:
            _329 <= _327;
        default:
            _329 <= _328;
        endcase
    end
    assign _342 = _329 ^ _341;
    assign _343 = _243 & _342;
    assign _345 = _343 & _344;
    assign _352 = _345 & _351;
    assign _396 = _352 ? _395 : _393;
    assign _241 = host_lane0_clk_pin_en;
    assign _420 = _241 ? _419 : _396;
    assign _243 = host_lane0_dir;
    assign _314 = _313 & _243;
    assign _421 = _314 & _420;
    assign _3701 = _421 ? _3700 : _3649;
    assign _675 = _244 == _440;
    assign _3703 = _675 ? _2524 : _3701;
    assign _3443 = _244 == _1810;
    assign _3710 = _3443 ? _3709 : _3703;
    assign _307 = _244 == _468;
    assign _3716 = _307 ? _3715 : _3710;
    assign _2574 = _1214[90:88];
    assign _2573 = _1208[90:88];
    assign _2572 = _1202[90:88];
    assign _2571 = _850[90:88];
    always @* begin
        case (f_winner)
        0:
            _2575 <= _2571;
        1:
            _2575 <= _2572;
        2:
            _2575 <= _2573;
        default:
            _2575 <= _2574;
        endcase
    end
    assign _2567 = _1214[87:87];
    assign _2566 = _1208[87:87];
    assign _2565 = _1202[87:87];
    assign _2564 = _850[87:87];
    always @* begin
        case (f_winner)
        0:
            _2568 <= _2564;
        1:
            _2568 <= _2565;
        2:
            _2568 <= _2566;
        default:
            _2568 <= _2567;
        endcase
    end
    assign _3638 = ~ _2568;
    assign _3639 = _1647 & _3638;
    assign _3641 = _3639 ? _2575 : _438;
    assign _244 = _3641;
    assign _304 = _244 == _441;
    assign _305 = _304 | _291;
    assign _3718 = _305 ? _2524 : _3716;
    assign _245 = _3718;
    always @(posedge _284) begin
        if (_282)
            g_mode_0 <= _2524;
        else
            g_mode_0 <= _245;
    end
    assign _313 = g_mode_0 == _1987;
    assign _678 = _313 & _677;
    assign _686 = _678 & _685;
    assign _1750 = _686 & _1749;
    assign _1752 = _1750 & _1751;
    assign _1761 = _1752 | _1760;
    assign _1742 = _1738 == _1987;
    assign _1740 = _1738 == _1986;
    assign _1743 = _1740 | _1742;
    assign _3719 = _1648 & _1743;
    assign _3720 = _3719 | _1761;
    assign _246 = _3720;
    assign _3416 = _246 & _3415;
    assign _2520 = _249 == _1689;
    assign _3010 = ~ _2520;
    assign _248 = host_tx_push;
    assign _3011 = _248 & _3010;
    assign _3721 = _3011 ^ _3416;
    assign _3727 = _3721 ? _3726 : _249;
    always @(posedge _284) begin
        if (_282)
            _3730 <= _1925;
        else
            _3730 <= _3727;
    end
    assign _249 = _3730;
    assign _1131 = _249 == _1925;
    assign _3732 = _1131 ? _728 : _3061;
    assign _1737 = _1197[28:27];
    assign _1735 = _1214[95:94];
    assign _1734 = _1208[95:94];
    assign _1733 = _1202[95:94];
    assign _1732 = _850[95:94];
    always @* begin
        case (f_winner)
        0:
            _1736 <= _1732;
        1:
            _1736 <= _1733;
        2:
            _1736 <= _1734;
        default:
            _1736 <= _1735;
        endcase
    end
    assign _1738 = _834 ? _1737 : _1736;
    always @* begin
        case (_1738)
        0:
            _3744 <= _1124;
        1:
            _3744 <= _3732;
        2:
            _3744 <= _3741;
        default:
            _3744 <= _3743;
        endcase
    end
    assign _3745 = _1648 ? _3744 : _1124;
    assign _250 = _3745;
    always @(posedge _284) begin
        if (_282)
            _1124 <= _726;
        else
            _1124 <= _250;
    end
    assign _1125 = _1124[0:0];
    assign _3756 = 8'b00001000;
    assign _3755 = 8'b00000111;
    assign _3754 = _1119 - _732;
    assign _3751 = _1197[30:29];
    assign _3749 = _1214[99:98];
    assign _3748 = _1208[99:98];
    assign _3747 = _1202[99:98];
    assign _3746 = _850[99:98];
    always @* begin
        case (f_winner)
        0:
            _3750 <= _3746;
        1:
            _3750 <= _3747;
        2:
            _3750 <= _3748;
        default:
            _3750 <= _3749;
        endcase
    end
    assign _3752 = _834 ? _3751 : _3750;
    always @* begin
        case (_3752)
        0:
            _3757 <= _1119;
        1:
            _3757 <= _3754;
        2:
            _3757 <= _3755;
        default:
            _3757 <= _3756;
        endcase
    end
    assign _3758 = _1648 ? _3757 : _1119;
    assign _251 = _3758;
    always @(posedge _284) begin
        if (_282)
            _1119 <= _726;
        else
            _1119 <= _251;
    end
    assign _1121 = _1119 == _726;
    assign _1319 = _1202[61:58];
    always @* begin
        case (_1319)
        0:
            _1320 <= vdd;
        1:
            _1320 <= _1121;
        2:
            _1320 <= _1125;
        3:
            _1320 <= _1129;
        4:
            _1320 <= _1131;
        5:
            _1320 <= _711;
        6:
            _1320 <= _1135;
        7:
            _1320 <= _1138;
        8:
            _1320 <= _649;
        9:
            _1320 <= _652;
        10:
            _1320 <= _655;
        11:
            _1320 <= _658;
        12:
            _1320 <= _637;
        13:
            _1320 <= _640;
        14:
            _1320 <= _643;
        default:
            _1320 <= _646;
        endcase
    end
    assign _1322 = _1320 ^ _1321;
    assign _1314 = _1202[57:42];
    assign _1316 = _1314 == _1939;
    assign _1305 = _1251[57:42];
    assign _1306 = { gnd,
                     _1305 };
    assign _1307 = _1306 + _1294;
    always @(posedge _284) begin
        if (_282)
            _1310 <= _1587;
        else
            _1310 <= _1307;
    end
    assign _1311 = _1310 < _1250;
    assign _1312 = ~ _1311;
    assign _1301 = _1202[41:26];
    assign _1303 = _1301 == _1630;
    assign _1079 = _1075 + _468;
    assign _3773 = _1075 + _468;
    assign _3769 = _1075 == _2405;
    assign _3770 = ~ _3769;
    assign _3767 = _864[0:0];
    assign _3771 = _3767 & _3770;
    assign _3774 = _3771 ? _3773 : _1075;
    assign _3764 = _864[0:0];
    assign _3765 = ~ _3764;
    assign _3763 = f_chg_now[0:0];
    assign _3766 = _3763 & _3765;
    assign _3776 = _3766 ? _468 : _3774;
    assign _3760 = _826 == _1987;
    assign _3762 = _3760 ? _438 : _1075;
    assign _3759 = _826 == _1986;
    assign _3777 = _3759 ? _3776 : _3762;
    assign _252 = _3777;
    always @(posedge _284) begin
        if (_282)
            _1075 <= _438;
        else
            _1075 <= _252;
    end
    assign _1077 = _1075 == _2405;
    assign _1080 = _1077 ? _1075 : _1079;
    assign _1070 = _864[0:0];
    assign _1071 = ~ _1070;
    assign _1069 = f_chg_now[0:0];
    assign _1072 = _1069 & _1071;
    assign _1082 = _1072 ? _468 : _1080;
    assign _1066 = f_changed_all[0:0];
    assign _1067 = f_in_fetch & _1066;
    assign _1083 = _1067 ? _1082 : _438;
    assign _1285 = _1255[0:0];
    assign _1287 = _1285 ? _1083 : _438;
    assign _1058 = _1054 + _468;
    assign _3792 = _1054 + _468;
    assign _3788 = _1054 == _2405;
    assign _3789 = ~ _3788;
    assign _3786 = _864[1:1];
    assign _3790 = _3786 & _3789;
    assign _3793 = _3790 ? _3792 : _1054;
    assign _3783 = _864[1:1];
    assign _3784 = ~ _3783;
    assign _3782 = f_chg_now[1:1];
    assign _3785 = _3782 & _3784;
    assign _3795 = _3785 ? _468 : _3793;
    assign _3779 = _826 == _1987;
    assign _3781 = _3779 ? _438 : _1054;
    assign _3778 = _826 == _1986;
    assign _3796 = _3778 ? _3795 : _3781;
    assign _253 = _3796;
    always @(posedge _284) begin
        if (_282)
            _1054 <= _438;
        else
            _1054 <= _253;
    end
    assign _1056 = _1054 == _2405;
    assign _1059 = _1056 ? _1054 : _1058;
    assign _1049 = _864[1:1];
    assign _1050 = ~ _1049;
    assign _1048 = f_chg_now[1:1];
    assign _1051 = _1048 & _1050;
    assign _1061 = _1051 ? _468 : _1059;
    assign _1045 = f_changed_all[1:1];
    assign _1046 = f_in_fetch & _1045;
    assign _1062 = _1046 ? _1061 : _438;
    assign _1282 = _1255[1:1];
    assign _1284 = _1282 ? _1062 : _438;
    assign _1288 = _1284 < _1287;
    assign _1289 = _1288 ? _1287 : _1284;
    assign _1035 = _1031 + _468;
    assign _3811 = _1031 + _468;
    assign _3807 = _1031 == _2405;
    assign _3808 = ~ _3807;
    assign _3805 = _864[2:2];
    assign _3809 = _3805 & _3808;
    assign _3812 = _3809 ? _3811 : _1031;
    assign _3802 = _864[2:2];
    assign _3803 = ~ _3802;
    assign _3801 = f_chg_now[2:2];
    assign _3804 = _3801 & _3803;
    assign _3814 = _3804 ? _468 : _3812;
    assign _3798 = _826 == _1987;
    assign _3800 = _3798 ? _438 : _1031;
    assign _3797 = _826 == _1986;
    assign _3815 = _3797 ? _3814 : _3800;
    assign _254 = _3815;
    always @(posedge _284) begin
        if (_282)
            _1031 <= _438;
        else
            _1031 <= _254;
    end
    assign _1033 = _1031 == _2405;
    assign _1036 = _1033 ? _1031 : _1035;
    assign _1026 = _864[2:2];
    assign _1027 = ~ _1026;
    assign _1025 = f_chg_now[2:2];
    assign _1028 = _1025 & _1027;
    assign _1038 = _1028 ? _468 : _1036;
    assign _1022 = f_changed_all[2:2];
    assign _1023 = f_in_fetch & _1022;
    assign _1039 = _1023 ? _1038 : _438;
    assign _1277 = _1255[2:2];
    assign _1279 = _1277 ? _1039 : _438;
    assign _1014 = _1010 + _468;
    assign _3830 = _1010 + _468;
    assign _3826 = _1010 == _2405;
    assign _3827 = ~ _3826;
    assign _3824 = _864[3:3];
    assign _3828 = _3824 & _3827;
    assign _3831 = _3828 ? _3830 : _1010;
    assign _3821 = _864[3:3];
    assign _3822 = ~ _3821;
    assign _3820 = f_chg_now[3:3];
    assign _3823 = _3820 & _3822;
    assign _3833 = _3823 ? _468 : _3831;
    assign _3817 = _826 == _1987;
    assign _3819 = _3817 ? _438 : _1010;
    assign _3816 = _826 == _1986;
    assign _3834 = _3816 ? _3833 : _3819;
    assign _255 = _3834;
    always @(posedge _284) begin
        if (_282)
            _1010 <= _438;
        else
            _1010 <= _255;
    end
    assign _1012 = _1010 == _2405;
    assign _1015 = _1012 ? _1010 : _1014;
    assign _1005 = _864[3:3];
    assign _1006 = ~ _1005;
    assign _1004 = f_chg_now[3:3];
    assign _1007 = _1004 & _1006;
    assign _1017 = _1007 ? _468 : _1015;
    assign _1001 = f_changed_all[3:3];
    assign _1002 = f_in_fetch & _1001;
    assign _1018 = _1002 ? _1017 : _438;
    assign _1274 = _1255[3:3];
    assign _1276 = _1274 ? _1018 : _438;
    assign _1280 = _1276 < _1279;
    assign _1281 = _1280 ? _1279 : _1276;
    assign _1290 = _1281 < _1289;
    assign _1291 = _1290 ? _1289 : _1281;
    assign _989 = _985 + _468;
    assign _3849 = _985 + _468;
    assign _3845 = _985 == _2405;
    assign _3846 = ~ _3845;
    assign _3843 = _864[4:4];
    assign _3847 = _3843 & _3846;
    assign _3850 = _3847 ? _3849 : _985;
    assign _3840 = _864[4:4];
    assign _3841 = ~ _3840;
    assign _3839 = f_chg_now[4:4];
    assign _3842 = _3839 & _3841;
    assign _3852 = _3842 ? _468 : _3850;
    assign _3836 = _826 == _1987;
    assign _3838 = _3836 ? _438 : _985;
    assign _3835 = _826 == _1986;
    assign _3853 = _3835 ? _3852 : _3838;
    assign _256 = _3853;
    always @(posedge _284) begin
        if (_282)
            _985 <= _438;
        else
            _985 <= _256;
    end
    assign _987 = _985 == _2405;
    assign _990 = _987 ? _985 : _989;
    assign _980 = _864[4:4];
    assign _981 = ~ _980;
    assign _979 = f_chg_now[4:4];
    assign _982 = _979 & _981;
    assign _992 = _982 ? _468 : _990;
    assign _976 = f_changed_all[4:4];
    assign _977 = f_in_fetch & _976;
    assign _993 = _977 ? _992 : _438;
    assign _1267 = _1255[4:4];
    assign _1269 = _1267 ? _993 : _438;
    assign _968 = _964 + _468;
    assign _3868 = _964 + _468;
    assign _3864 = _964 == _2405;
    assign _3865 = ~ _3864;
    assign _3862 = _864[5:5];
    assign _3866 = _3862 & _3865;
    assign _3869 = _3866 ? _3868 : _964;
    assign _3859 = _864[5:5];
    assign _3860 = ~ _3859;
    assign _3858 = f_chg_now[5:5];
    assign _3861 = _3858 & _3860;
    assign _3871 = _3861 ? _468 : _3869;
    assign _3855 = _826 == _1987;
    assign _3857 = _3855 ? _438 : _964;
    assign _3854 = _826 == _1986;
    assign _3872 = _3854 ? _3871 : _3857;
    assign _257 = _3872;
    always @(posedge _284) begin
        if (_282)
            _964 <= _438;
        else
            _964 <= _257;
    end
    assign _966 = _964 == _2405;
    assign _969 = _966 ? _964 : _968;
    assign _959 = _864[5:5];
    assign _960 = ~ _959;
    assign _958 = f_chg_now[5:5];
    assign _961 = _958 & _960;
    assign _971 = _961 ? _468 : _969;
    assign _955 = f_changed_all[5:5];
    assign _956 = f_in_fetch & _955;
    assign _972 = _956 ? _971 : _438;
    assign _1264 = _1255[5:5];
    assign _1266 = _1264 ? _972 : _438;
    assign _1270 = _1266 < _1269;
    assign _1271 = _1270 ? _1269 : _1266;
    assign _945 = _941 + _468;
    assign _3887 = _941 + _468;
    assign _3883 = _941 == _2405;
    assign _3884 = ~ _3883;
    assign _3881 = _864[6:6];
    assign _3885 = _3881 & _3884;
    assign _3888 = _3885 ? _3887 : _941;
    assign _3878 = _864[6:6];
    assign _3879 = ~ _3878;
    assign _3877 = f_chg_now[6:6];
    assign _3880 = _3877 & _3879;
    assign _3890 = _3880 ? _468 : _3888;
    assign _3874 = _826 == _1987;
    assign _3876 = _3874 ? _438 : _941;
    assign _3873 = _826 == _1986;
    assign _3891 = _3873 ? _3890 : _3876;
    assign _258 = _3891;
    always @(posedge _284) begin
        if (_282)
            _941 <= _438;
        else
            _941 <= _258;
    end
    assign _943 = _941 == _2405;
    assign _946 = _943 ? _941 : _945;
    assign _936 = _864[6:6];
    assign _937 = ~ _936;
    assign _935 = f_chg_now[6:6];
    assign _938 = _935 & _937;
    assign _948 = _938 ? _468 : _946;
    assign _932 = f_changed_all[6:6];
    assign _933 = f_in_fetch & _932;
    assign _949 = _933 ? _948 : _438;
    assign _1259 = _1255[6:6];
    assign _1261 = _1259 ? _949 : _438;
    assign _924 = _920 + _468;
    assign _3906 = _920 + _468;
    assign _3902 = _920 == _2405;
    assign _3903 = ~ _3902;
    assign _3900 = _864[7:7];
    assign _3904 = _3900 & _3903;
    assign _3907 = _3904 ? _3906 : _920;
    assign _3897 = _864[7:7];
    assign _3898 = ~ _3897;
    assign _3896 = f_chg_now[7:7];
    assign _3899 = _3896 & _3898;
    assign _3909 = _3899 ? _468 : _3907;
    assign _3893 = _826 == _1987;
    assign _3895 = _3893 ? _438 : _920;
    assign _3892 = _826 == _1986;
    assign _3910 = _3892 ? _3909 : _3895;
    assign _259 = _3910;
    always @(posedge _284) begin
        if (_282)
            _920 <= _438;
        else
            _920 <= _259;
    end
    assign _922 = _920 == _2405;
    assign _925 = _922 ? _920 : _924;
    assign _915 = _864[7:7];
    assign _916 = ~ _915;
    assign _914 = f_chg_now[7:7];
    assign _917 = _914 & _916;
    assign _927 = _917 ? _468 : _925;
    assign _911 = f_changed_all[7:7];
    assign _912 = f_in_fetch & _911;
    assign _928 = _912 ? _927 : _438;
    assign _1255 = _1251[23:16];
    assign _1256 = _1255[7:7];
    assign _1258 = _1256 ? _928 : _438;
    assign _1262 = _1258 < _1261;
    assign _1263 = _1262 ? _1261 : _1258;
    assign _1272 = _1263 < _1271;
    assign _1273 = _1272 ? _1271 : _1263;
    assign _1292 = _1273 < _1291;
    assign _1293 = _1292 ? _1291 : _1273;
    assign _1294 = { _1532,
                     _1293 };
    assign _3913 = _831 == _468;
    assign _3914 = _3913 ? _276 : _848;
    assign _3911 = _826 == _1986;
    assign _3915 = _3911 ? _3914 : _848;
    assign _260 = _3915;
    always @(posedge _284) begin
        if (_282)
            _848 <= _838;
        else
            _848 <= _260;
    end
    assign _900 = _831 == _468;
    assign _901 = f_in_fetch & _900;
    assign _902 = _901 ? _276 : _848;
    assign _3918 = _831 == _440;
    assign _3919 = _3918 ? _276 : _845;
    assign _3916 = _826 == _1986;
    assign _3920 = _3916 ? _3919 : _845;
    assign _261 = _3920;
    always @(posedge _284) begin
        if (_282)
            _845 <= _838;
        else
            _845 <= _261;
    end
    assign _896 = _831 == _440;
    assign _897 = f_in_fetch & _896;
    assign _898 = _897 ? _276 : _845;
    assign _3923 = _831 == _1810;
    assign _3924 = _3923 ? _276 : _842;
    assign _3921 = _826 == _1986;
    assign _3925 = _3921 ? _3924 : _842;
    assign _262 = _3925;
    always @(posedge _284) begin
        if (_282)
            _842 <= _838;
        else
            _842 <= _262;
    end
    assign _892 = _831 == _1810;
    assign _893 = f_in_fetch & _892;
    assign _894 = _893 ? _276 : _842;
    assign _3966 = _3953 | f_sweeping;
    assign _3960 = ~ f_sweeping;
    assign _264 = host_rec_we;
    assign _3959 = _264 & _1780;
    assign f_store_we = _3959 & _3960;
    assign _266 = host_rec_wdata;
    always @(posedge _284) begin
        if (f_store_we)
            _3962[_3958] <= _266;
    end
    assign _3956 = _831[1:0];
    assign _268 = host_start_loc;
    assign _1214 = _849[511:400];
    assign _3938 = _1214[110:105];
    assign _1208 = _849[399:288];
    assign _3937 = _1208[110:105];
    assign _3936 = _1202[110:105];
    assign _3935 = _850[110:105];
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
    assign _3940 = _3939 == _1711;
    assign _3941 = ~ _3940;
    assign _3942 = _3941 ? _3939 : _1711;
    assign _270 = host_recover_loc;
    assign _3929 = _1836 ? _270 : _3928;
    assign _271 = _3929;
    always @(posedge _284) begin
        if (_282)
            _3928 <= _3322;
        else
            _3928 <= _271;
    end
    assign f_policy = _1197[59:58];
    assign _3932 = f_policy == _1987;
    assign _3933 = _3932 ? _3928 : _1711;
    assign _3934 = f_viol_now ? _3933 : _1711;
    assign _3943 = _1647 ? _3942 : _3934;
    assign _3930 = _826 == _1987;
    assign _3944 = _3930 ? _3943 : _1711;
    assign _3945 = _1836 ? _268 : _3944;
    assign _272 = _3945;
    always @(posedge _284) begin
        if (_282)
            _1711 <= _3322;
        else
            _1711 <= _272;
    end
    assign _3957 = { _1711,
                     _3956 };
    assign _3949 = f_sw_cnt + _2696;
    assign _3947 = _2683 ? _1957 : f_sw_cnt;
    assign _3950 = f_sweeping ? _3949 : _3947;
    assign _273 = _3950;
    always @(posedge _284) begin
        if (_282)
            f_sw_cnt <= _1957;
        else
            f_sw_cnt <= _273;
    end
    assign _3954 = f_sw_cnt[11:4];
    assign _275 = host_rec_waddr;
    assign _3955 = f_sweeping ? _3954 : _275;
    assign _3952 = _831 < _441;
    assign _3953 = f_in_fetch & _3952;
    assign _3958 = _3953 ? _3957 : _3955;
    assign _3963 = _3962[_3958];
    always @(posedge _284) begin
        if (_3966)
            _3967 <= _3963;
    end
    assign _276 = _3967;
    assign _888 = _831 == _441;
    assign _889 = f_in_fetch & _888;
    assign _890 = _889 ? _276 : _839;
    assign _903 = { _890,
                    _894,
                    _898,
                    _902 };
    assign _1251 = _903[287:176];
    assign _1252 = _1251[41:26];
    assign _1253 = { gnd,
                     _1252 };
    assign _1295 = _1253 + _1294;
    always @(posedge _284) begin
        if (_282)
            _1298 <= _1587;
        else
            _1298 <= _1295;
    end
    assign gnd = 1'b0;
    assign _1250 = { gnd,
                     _1247 };
    assign _1299 = _1250 < _1298;
    assign _1300 = ~ _1299;
    assign _1304 = _1300 | _1303;
    assign _1313 = _1304 & _1312;
    assign _3995 = _882 + _4031;
    assign _3991 = _882 == _1939;
    assign _3992 = ~ _3991;
    assign _3993 = _3989 & _3992;
    assign _3996 = _3993 ? _3995 : _882;
    assign _3975 = _3974[2:2];
    assign _3976 = _1648 & _3975;
    assign _3998 = _3976 ? _1630 : _3996;
    assign _4000 = _1836 ? _1630 : _3998;
    assign _277 = _4000;
    always @(posedge _284) begin
        if (_282)
            _882 <= _1630;
        else
            _882 <= _277;
    end
    assign _4012 = _879 + _4031;
    assign _4008 = _879 == _1939;
    assign _4009 = ~ _4008;
    assign _3987 = 9'b111111111;
    assign _3988 = _3980 == _3987;
    assign _3985 = 6'b111111;
    assign _3984 = _3980[5:0];
    assign _3986 = _3984 == _3985;
    assign _3979 = 9'b000000000;
    assign _4001 = 9'b000000001;
    assign _4002 = _3980 + _4001;
    assign _4004 = _1836 ? _3979 : _4002;
    assign _278 = _4004;
    always @(posedge _284) begin
        if (_282)
            _3980 <= _3979;
        else
            _3980 <= _278;
    end
    assign _3981 = _3980[2:0];
    assign _3983 = _3981 == _2405;
    assign _3977 = _1197[63:62];
    always @* begin
        case (_3977)
        0:
            _3989 <= vdd;
        1:
            _3989 <= _3983;
        2:
            _3989 <= _3986;
        default:
            _3989 <= _3988;
        endcase
    end
    assign _4010 = _3989 & _4009;
    assign _4013 = _4010 ? _4012 : _879;
    assign _4005 = _3974[1:1];
    assign _4006 = _1648 & _4005;
    assign _4015 = _4006 ? _1630 : _4013;
    assign _4017 = _1836 ? _1630 : _4015;
    assign _279 = _4017;
    always @(posedge _284) begin
        if (_282)
            _879 <= _1630;
        else
            _879 <= _279;
    end
    assign _1246 = _1202[25:24];
    always @* begin
        case (_1246)
        0:
            _1247 <= _876;
        1:
            _1247 <= _879;
        2:
            _1247 <= _882;
        default:
            _1247 <= _882;
        endcase
    end
    assign _1249 = _1247 == _1939;
    assign _1317 = _1249 ? _1316 : _1313;
    always @(posedge _284) begin
        if (_282)
            _332 <= _726;
        else
            _332 <= _320;
    end
    assign f_chg_now = _320 ^ _332;
    assign _4019 = _826 == _1987;
    assign _4021 = _4019 ? _726 : _864;
    assign _4018 = _826 == _1986;
    assign _4022 = _4018 ? f_changed_all : _4021;
    assign _4024 = _1836 ? _726 : _4022;
    assign _280 = _4024;
    always @(posedge _284) begin
        if (_282)
            _864 <= _726;
        else
            _864 <= _280;
    end
    assign f_changed_all = _864 | f_chg_now;
    assign _1240 = f_changed_all & f_chgmask1;
    assign _1242 = _1240 == _726;
    assign _1243 = ~ _1242;
    assign f_chgmask1 = _1202[23:16];
    assign _1239 = f_chgmask1 == _726;
    assign _1244 = _1239 | _1243;
    assign _1233 = _1202[7:0];
    assign _1231 = _1202[15:8];
    assign vdd = 1'b1;
    assign _282 = clear;
    assign _284 = clock;
    assign _286 = pins_in;
    always @(posedge _284) begin
        if (_282)
            _317 <= _726;
        else
            _317 <= _286;
    end
    always @(posedge _284) begin
        if (_282)
            _320 <= _726;
        else
            _320 <= _317;
    end
    assign _1232 = _320 ^ _1231;
    assign _1234 = _1232 & _1233;
    assign _1236 = _1234 == _726;
    assign _1202 = _849[287:176];
    assign f_valid1 = _1202[111:111];
    assign _1237 = f_valid1 & _1236;
    assign _1245 = _1237 & _1244;
    assign _1318 = _1245 & _1317;
    assign _1323 = _1318 & _1322;
    assign _1362 = _1323 & _1361;
    assign _1363 = f_in_eval & _1362;
    assign _1367 = _1363 & _1366;
    assign f_fire1 = _1367 & _1229;
    assign _1653 = f_fire1 ? _1986 : _1651;
    assign f_winner = f_fire0 ? _2524 : _1653;
    always @* begin
        case (f_winner)
        0:
            _3972 <= _3968;
        1:
            _3972 <= _3969;
        2:
            _3972 <= _3970;
        default:
            _3972 <= _3971;
        endcase
    end
    assign _3974 = _834 ? _3973 : _3972;
    assign _4025 = _3974[0:0];
    assign _833 = _831 == _441;
    assign f_in_fetch = _826 == _1986;
    assign _834 = f_in_fetch & _833;
    assign _1648 = _834 | _1647;
    assign _4026 = _1648 & _4025;
    assign _4035 = _4026 ? _1630 : _4033;
    assign _4037 = _1836 ? _1630 : _4035;
    assign _287 = _4037;
    always @(posedge _284) begin
        if (_282)
            _876 <= _1630;
        else
            _876 <= _287;
    end
    assign _1882 = _1197[33:32];
    always @* begin
        case (_1882)
        0:
            _1883 <= _876;
        1:
            _1883 <= _879;
        2:
            _1883 <= _882;
        default:
            _1883 <= _882;
        endcase
    end
    assign _1881 = _1197[49:34];
    assign _1884 = _1881 < _1883;
    assign _1197 = _849[63:0];
    assign _1879 = _1197[31:31];
    assign _1877 = ~ _1647;
    assign _1878 = f_in_eval & _1877;
    assign _1880 = _1878 & _1879;
    assign _1885 = _1880 & _1884;
    assign _1890 = _1885 & _1889;
    assign _1898 = _1890 | f_unexp_now;
    assign f_viol_now = _1898 | f_amb_now;
    assign _4043 = f_viol_now ? _4042 : _831;
    assign _4046 = _1647 ? _4045 : _4043;
    assign _4039 = _826 == _1987;
    assign _4047 = _4039 ? _4046 : _831;
    assign _4038 = _826 == _1986;
    assign _4050 = _4038 ? _4049 : _4047;
    assign _4052 = _1836 ? _438 : _4050;
    assign _288 = _4052;
    always @(posedge _284) begin
        if (_282)
            _831 <= _438;
        else
            _831 <= _288;
    end
    assign _4055 = _831 == _441;
    assign _4056 = _4055 ? _276 : _839;
    assign _4053 = _826 == _1986;
    assign _4057 = _4053 ? _4056 : _839;
    assign _289 = _4057;
    always @(posedge _284) begin
        if (_282)
            _839 <= _838;
        else
            _839 <= _289;
    end
    assign _849 = { _839,
                    _842,
                    _845,
                    _848 };
    assign _850 = _849[175:64];
    assign f_valid0 = _850[111:111];
    assign _858 = f_valid0 & _857;
    assign _872 = _858 & _871;
    assign _1115 = _872 & _1114;
    assign _1142 = _1115 & _1141;
    assign _1186 = _1142 & _1185;
    assign f_in_eval = _826 == _1987;
    assign _1187 = f_in_eval & _1186;
    assign _1196 = _1187 & _1195;
    assign f_fire0 = _1196 & _1229;
    assign _1369 = f_fire0 | f_fire1;
    assign _1508 = _1369 | f_fire2;
    assign _1647 = _1508 | f_fire3;
    assign _4076 = _1647 ? _4075 : _4073;
    assign _4061 = _826 == _1902;
    assign _4063 = _4061 ? _2524 : _826;
    assign _4059 = _826 == _1987;
    assign _4077 = _4059 ? _4076 : _4063;
    assign _4058 = _826 == _1986;
    assign _4080 = _4058 ? _4079 : _4077;
    assign _291 = host_stop;
    assign _4082 = _291 ? _2524 : _4080;
    assign _4084 = _1836 ? _1986 : _4082;
    assign _292 = _4084;
    always @(posedge _284) begin
        if (_282)
            _826 <= _2524;
        else
            _826 <= _292;
    end
    assign _1780 = _826 == _2524;
    assign _294 = host_verify;
    assign _2681 = _294 & _1780;
    assign _2683 = _2681 & _2682;
    assign _4086 = _2683 ? _1766 : f_sweeping;
    assign _4096 = f_sweeping ? _4095 : _4086;
    assign _295 = _4096;
    always @(posedge _284) begin
        if (_282)
            f_sweeping <= _1764;
        else
            f_sweeping <= _295;
    end
    assign _4108 = f_sweeping ? _4107 : _4101;
    assign _296 = _4108;
    always @(posedge _284) begin
        if (_282)
            f_image_valid <= _1764;
        else
            f_image_valid <= _296;
    end
    assign _298 = host_start;
    assign _1836 = _298 & f_image_valid;
    assign _4132 = _1836 ? _726 : _4130;
    assign _299 = _4132;
    always @(posedge _284) begin
        if (_282)
            f_pout <= _726;
        else
            f_pout <= _299;
    end
    assign _2606 = f_pout[7:7];
    assign _301 = host_pin_src;
    assign _2602 = _301[23:21];
    always @* begin
        case (_2602)
        0:
            _2613 <= _2606;
        1:
            _2613 <= f_lane0_out;
        2:
            _2613 <= _2607;
        3:
            _2613 <= _2608;
        4:
            _2613 <= _2610;
        5:
            _2613 <= f_lane1_out;
        6:
            _2613 <= _2611;
        default:
            _2613 <= _2612;
        endcase
    end
    assign _2677 = { _2613,
                     _2622,
                     _2631,
                     _2640,
                     _2649,
                     _2658,
                     _2667,
                     _2676 };
    assign _4134 = _2677 & _4133;
    assign pins_out = _4134;
    assign pins_oe = _2680;
    assign st_running = _2537;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1711;
    assign st_accepting = _2536;
    assign st_taken = _2534;
    assign st_taken_edge = _2531;
    assign st_viol = _2528;
    assign st_viol_kind = _2525;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _2520;
    assign st_tx_empty = _1131;
    assign st_rx_data = _2518;
    assign st_rx_empty = _2411;
    assign st_vlog_data = _2409;
    assign st_vlog_empty = _1926;
    assign st_cov_rdata = _2038;
    assign st_irq = _1930;
    assign st_halted_viol = _1863;
    assign st_rx_overflow = _1856;
    assign st_vlog_overflow = _1846;
    assign st_cov_overrun = _1839;
    assign st_host_err = _1823;
    assign st_host_err_cause = _1828;
    assign st_lane_active = _1778;
    assign st_image_valid = f_image_valid;
    assign st_verify_busy = f_sweeping;
    assign st_tx_collision = _1765;
    assign st_drops = _1731;
    assign st_lane_status = _660;

endmodule
