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

    wire [11:0] _1271;
    wire _1268;
    wire _1269;
    wire [11:0] _1270;
    wire _1272;
    wire [11:0] _1273;
    wire [11:0] _1274;
    wire [11:0] _1260;
    wire [11:0] _1117;
    wire [11:0] _1114;
    wire [12:0] _1111;
    wire [9:0] _1108;
    wire [12:0] _1109;
    wire [12:0] _1110;
    wire [2:0] _1104;
    reg [2:0] _1084;
    wire [2:0] _1;
    reg [2:0] _1105;
    wire [12:0] _1106;
    wire [12:0] _1091;
    wire [12:0] _1090;
    wire [15:0] _1085;
    wire _1089;
    wire [12:0] _1092;
    wire [12:0] _2;
    reg [12:0] _1101;
    wire _1107;
    wire [12:0] _1112;
    wire [12:0] _1098;
    wire _1113;
    wire [11:0] _1116;
    wire _1096;
    wire [15:0] _1093;
    wire _1094;
    wire _3;
    reg _1097;
    wire [11:0] _1118;
    wire [11:0] _4;
    reg [11:0] _1261;
    wire [11:0] _1121;
    reg [1:0] _1087;
    reg [15:0] _1088;
    wire [15:0] _1119;
    wire _1120;
    wire [11:0] _1123;
    wire [11:0] _5;
    reg [11:0] _1258;
    wire _1262;
    wire _1263;
    wire [11:0] _1264;
    wire [11:0] _1255;
    wire _1265;
    wire [11:0] _1266;
    wire [7:0] _1253;
    wire _1254;
    wire [11:0] _1267;
    wire [7:0] _1251;
    wire [7:0] _1250;
    wire [1:0] _1245;
    wire [1:0] _1244;
    wire _1233;
    wire _1225;
    wire _1234;
    wire _6;
    reg _1243;
    wire [1:0] _1246;
    wire [6:0] _1240;
    wire [8:0] _1247;
    wire [7:0] _1238;
    wire [8:0] _1239;
    wire [8:0] _1248;
    wire _1249;
    wire [7:0] _1252;
    wire [31:0] _1275;
    wire [31:0] _8;
    wire [31:0] _1276;
    wire _1289;
    wire _1287;
    wire _1282;
    wire _1280;
    wire _1279;
    wire _1281;
    wire _1283;
    wire f_host_cov_we;
    wire _1291;
    wire _1290;
    wire _1292;
    wire [7:0] _12;
    reg [7:0] _1296;
    wire [7:0] _14;
    wire [7:0] _1293;
    wire [7:0] _1297;
    wire [127:0] _17;
    wire _1304;
    wire [1:0] _1310;
    wire [7:0] _1311;
    wire [7:0] _1308;
    wire [7:0] _22;
    wire [7:0] _1309;
    wire [2:0] _1301;
    wire _1302;
    wire _1303;
    wire [7:0] _1312;
    wire [2:0] _1464;
    wire [2:0] _1465;
    wire [2:0] _1437;
    wire [2:0] _1439;
    wire [2:0] _1440;
    wire [2:0] _1466;
    wire [2:0] _1468;
    wire [2:0] _1470;
    wire [2:0] _24;
    reg [2:0] _1436;
    wire [7:0] _1630;
    wire [2:0] _1623;
    wire [2:0] _1597;
    wire [2:0] _1598;
    wire [2:0] _1624;
    wire [2:0] _1626;
    wire [2:0] _1628;
    wire [2:0] _25;
    reg [2:0] _1594;
    wire [7:0] _1629;
    wire [15:0] _1631;
    wire [7:0] _1701;
    wire [7:0] _1702;
    wire _1698;
    wire _1699;
    wire _1691;
    wire _1688;
    wire _1689;
    wire _1685;
    wire _1682;
    wire _1683;
    wire _1684;
    wire _1686;
    wire _1690;
    wire _1692;
    wire _1681;
    wire _1693;
    wire _1700;
    wire [7:0] _1703;
    wire [7:0] _1705;
    wire [7:0] _27;
    reg [7:0] _1696;
    wire [7:0] _1786;
    wire _1782;
    wire _1783;
    wire _1775;
    wire _1772;
    wire _1773;
    wire _1769;
    wire _1766;
    wire _1767;
    wire _1768;
    wire _1770;
    wire _1774;
    wire _1776;
    wire _1764;
    wire _1765;
    wire _1777;
    wire _1784;
    wire [7:0] _1787;
    wire [7:0] _1789;
    wire [7:0] _28;
    reg [7:0] _1780;
    wire [7:0] _1826;
    wire _1822;
    wire _1823;
    wire _1816;
    wire _1817;
    wire _1824;
    wire [7:0] _1827;
    wire [7:0] _1829;
    wire [7:0] _29;
    reg [7:0] _1820;
    wire [7:0] _1841;
    wire _1837;
    wire _1838;
    wire _1839;
    wire [7:0] _1842;
    wire [7:0] _1844;
    wire [7:0] _30;
    reg [7:0] _1835;
    wire [7:0] _1857;
    wire _1853;
    wire _1854;
    wire _1855;
    wire [7:0] _1858;
    wire _32;
    wire [7:0] _1860;
    wire [7:0] _33;
    reg [7:0] _1851;
    wire [39:0] _1861;
    wire _1896;
    wire _1874;
    wire _1892;
    wire _1897;
    wire _1899;
    wire _35;
    reg _1895;
    wire [1:0] _1905;
    wire [2:0] _1951;
    wire [2:0] _1953;
    wire [2:0] _40;
    reg [2:0] _1950;
    wire _1946;
    wire [2:0] _1936;
    wire [2:0] _1932;
    wire [2:0] _1933;
    wire [2:0] _1937;
    wire [2:0] _1930;
    wire [2:0] _1938;
    wire _1925;
    wire _1926;
    wire _1927;
    wire _1921;
    wire _1922;
    wire _1903;
    wire _1918;
    wire _1919;
    wire _1904;
    wire [1:0] _43;
    wire _1916;
    wire _1917;
    wire _1920;
    wire _1923;
    wire _44;
    reg _1237;
    wire _1912;
    wire _1911;
    wire _1913;
    wire _1909;
    wire _46;
    wire _48;
    wire _1908;
    wire _1910;
    wire _1914;
    wire _1906;
    wire _1907;
    wire _1915;
    wire _1924;
    wire _1928;
    wire [2:0] _1939;
    wire _1941;
    wire _1942;
    wire _1947;
    wire _1955;
    wire _50;
    wire _1957;
    wire _51;
    reg _1945;
    wire [7:0] _53;
    reg [7:0] _1232;
    wire [7:0] _1229;
    wire _1846;
    wire _1847;
    wire _1958;
    wire _1959;
    wire _54;
    reg _1224;
    wire _56;
    wire _1221;
    wire _1845;
    wire _1848;
    wire _1965;
    wire _1967;
    wire _57;
    reg _1963;
    wire _1832;
    wire _1972;
    wire _1974;
    wire _59;
    reg _1970;
    wire _1814;
    wire _1807;
    wire _1815;
    wire _1762;
    wire _1758;
    wire _1763;
    wire _1975;
    wire _61;
    wire _1976;
    wire _1977;
    wire _1982;
    wire _1984;
    wire _62;
    reg _1980;
    wire _1988;
    wire _1989;
    wire _1994;
    wire _66;
    wire _1996;
    wire _1998;
    wire _67;
    reg _1992;
    wire _2027;
    wire _2029;
    wire _2025;
    wire _2031;
    wire _2032;
    wire _2033;
    wire _2000;
    wire _2034;
    wire _2036;
    wire _68;
    reg _1987;
    wire _2051;
    wire [2:0] _70;
    wire [3:0] _2044;
    wire _2045;
    wire _2046;
    wire _72;
    wire _2047;
    wire [2:0] _74;
    wire _2038;
    wire [2:0] _2040;
    wire [3:0] _2041;
    wire _2042;
    wire _2043;
    wire _2048;
    wire _2052;
    wire _2053;
    wire _2054;
    wire [31:0] _77;
    wire [31:0] _2057;
    wire _2055;
    wire _2056;
    wire [31:0] _2058;
    wire [2:0] _2425;
    wire _2426;
    wire _2427;
    wire [47:0] _2424;
    reg [47:0] _2428;
    wire [2:0] _2419;
    wire _2420;
    wire _2421;
    reg [47:0] _2422;
    wire _2414;
    wire _2415;
    reg [47:0] _2416;
    wire _2408;
    wire _2409;
    reg [47:0] _2410;
    wire _2402;
    wire _2403;
    reg [47:0] _2404;
    wire _2396;
    wire _2397;
    reg [47:0] _2398;
    wire _2390;
    wire _2391;
    reg [47:0] _2392;
    wire [2:0] _2065;
    wire [2:0] _2066;
    wire [2:0] _80;
    reg [2:0] _2063;
    wire _2384;
    wire _2385;
    wire [2:0] _2357;
    wire [28:0] _2074;
    wire [28:0] _2073;
    wire [28:0] _2076;
    wire [28:0] _2077;
    wire [2:0] _2070;
    wire _2072;
    wire [28:0] _2078;
    wire [28:0] _81;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2355;
    wire [2:0] _2096;
    wire _2092;
    wire _2093;
    wire _2090;
    wire _2094;
    wire [2:0] _2097;
    wire _2087;
    wire _2088;
    wire _2085;
    wire _2084;
    wire _2086;
    wire _2089;
    wire [2:0] _2099;
    wire _2080;
    wire [2:0] _2100;
    wire [2:0] _82;
    reg [2:0] _2083;
    wire _2346;
    wire [2:0] _2348;
    wire [2:0] _2117;
    wire _2113;
    wire _2114;
    wire _2111;
    wire _2115;
    wire [2:0] _2118;
    wire _2108;
    wire _2109;
    wire _2106;
    wire _2105;
    wire _2107;
    wire _2110;
    wire [2:0] _2120;
    wire _2101;
    wire [2:0] _2121;
    wire [2:0] _83;
    reg [2:0] _2104;
    wire _2343;
    wire [2:0] _2345;
    wire [2:0] _2349;
    wire [2:0] _2138;
    wire _2134;
    wire _2135;
    wire _2132;
    wire _2136;
    wire [2:0] _2139;
    wire _2129;
    wire _2130;
    wire _2127;
    wire _2126;
    wire _2128;
    wire _2131;
    wire [2:0] _2141;
    wire _2122;
    wire [2:0] _2142;
    wire [2:0] _84;
    reg [2:0] _2125;
    wire _2339;
    wire [2:0] _2341;
    wire [2:0] _2159;
    wire _2155;
    wire _2156;
    wire _2153;
    wire _2157;
    wire [2:0] _2160;
    wire _2150;
    wire _2151;
    wire _2148;
    wire _2147;
    wire _2149;
    wire _2152;
    wire [2:0] _2162;
    wire _2143;
    wire [2:0] _2163;
    wire [2:0] _85;
    reg [2:0] _2146;
    wire _2336;
    wire [2:0] _2338;
    wire [2:0] _2342;
    wire [2:0] _2350;
    wire [2:0] _2180;
    wire _2176;
    wire _2177;
    wire _2174;
    wire _2178;
    wire [2:0] _2181;
    wire _2171;
    wire _2172;
    wire _2169;
    wire _2168;
    wire _2170;
    wire _2173;
    wire [2:0] _2183;
    wire _2164;
    wire [2:0] _2184;
    wire [2:0] _86;
    reg [2:0] _2167;
    wire _2331;
    wire [2:0] _2333;
    wire [2:0] _2201;
    wire _2197;
    wire _2198;
    wire _2195;
    wire _2199;
    wire [2:0] _2202;
    wire _2192;
    wire _2193;
    wire _2190;
    wire _2189;
    wire _2191;
    wire _2194;
    wire [2:0] _2204;
    wire _2185;
    wire [2:0] _2205;
    wire [2:0] _87;
    reg [2:0] _2188;
    wire _2328;
    wire [2:0] _2330;
    wire [2:0] _2334;
    wire [2:0] _2222;
    wire _2218;
    wire _2219;
    wire _2216;
    wire _2220;
    wire [2:0] _2223;
    wire _2213;
    wire _2214;
    wire _2211;
    wire _2210;
    wire _2212;
    wire _2215;
    wire [2:0] _2225;
    wire _2206;
    wire [2:0] _2226;
    wire [2:0] _88;
    reg [2:0] _2209;
    wire _2324;
    wire [2:0] _2326;
    wire [2:0] _2243;
    wire _2239;
    wire _2240;
    wire _2237;
    wire _2241;
    wire [2:0] _2244;
    wire _2234;
    wire _2235;
    wire _2232;
    wire _2231;
    wire _2233;
    wire _2236;
    wire [2:0] _2246;
    wire _2227;
    wire [2:0] _2247;
    wire [2:0] _89;
    reg [2:0] _2230;
    wire _2321;
    wire [2:0] _2323;
    wire [2:0] _2327;
    wire [2:0] _2335;
    wire [2:0] _2351;
    wire _2316;
    wire _2315;
    wire _2317;
    wire _2313;
    wire _2312;
    wire _2314;
    wire _2318;
    wire _2309;
    wire _2308;
    wire _2310;
    wire _2306;
    wire _2305;
    wire _2307;
    wire _2311;
    wire _2319;
    wire [2:0] _2352;
    wire _2294;
    wire _2293;
    wire _2295;
    wire [2:0] _2297;
    wire _2289;
    wire _2288;
    wire _2290;
    wire [2:0] _2292;
    wire _2298;
    wire [2:0] _2299;
    wire _2282;
    wire _2281;
    wire _2283;
    wire [2:0] _2285;
    wire _2277;
    wire _2276;
    wire _2278;
    wire [2:0] _2280;
    wire _2286;
    wire [2:0] _2287;
    wire _2300;
    wire [2:0] _2301;
    wire _2268;
    wire _2267;
    wire _2269;
    wire [2:0] _2271;
    wire _2263;
    wire _2262;
    wire _2264;
    wire [2:0] _2266;
    wire _2272;
    wire [2:0] _2273;
    wire _2256;
    wire _2255;
    wire _2257;
    wire [2:0] _2259;
    wire _2251;
    wire _2250;
    wire _2252;
    wire [2:0] _2254;
    wire _2260;
    wire [2:0] _2261;
    wire _2274;
    wire [2:0] _2275;
    wire _2302;
    wire [2:0] _2303;
    wire [2:0] _2304;
    wire [2:0] _2353;
    wire [2:0] _2248;
    wire _2354;
    wire [28:0] _2356;
    wire [31:0] _2358;
    wire [47:0] _2362;
    wire [47:0] _90;
    reg [47:0] _2386;
    wire [2:0] _2379;
    wire [3:0] _2049;
    wire [3:0] _2368;
    wire [3:0] _2369;
    wire [3:0] _2367;
    wire [3:0] _2370;
    wire [3:0] _1830;
    wire _1831;
    wire _2059;
    wire _91;
    wire _2060;
    wire _2365;
    wire [3:0] _2371;
    reg [3:0] _2374;
    wire [3:0] _92;
    wire _2050;
    wire _2363;
    wire _94;
    wire _2364;
    wire [2:0] _2380;
    wire [2:0] _95;
    reg [2:0] _2377;
    reg [47:0] _2429;
    wire _2535;
    wire _2536;
    reg [7:0] _2537;
    wire _2529;
    wire _2530;
    reg [7:0] _2531;
    wire _2523;
    wire _2524;
    reg [7:0] _2525;
    wire _2517;
    wire _2518;
    reg [7:0] _2519;
    wire _2511;
    wire _2512;
    reg [7:0] _2513;
    wire _2505;
    wire _2506;
    reg [7:0] _2507;
    wire _2499;
    wire _2500;
    reg [7:0] _2501;
    wire [2:0] _2438;
    wire [2:0] _2439;
    wire [2:0] _98;
    reg [2:0] _2436;
    wire _2493;
    wire _2494;
    wire [7:0] _2479;
    wire [7:0] _2480;
    wire [7:0] _2457;
    wire [7:0] _2455;
    wire [7:0] _2458;
    wire [7:0] _99;
    reg [7:0] _2444;
    wire [7:0] _2453;
    wire [7:0] _2454;
    wire [7:0] _2469;
    wire [7:0] _2466;
    wire [7:0] _2464;
    wire [7:0] _2467;
    wire [7:0] _100;
    reg [7:0] _2463;
    wire [7:0] _2468;
    wire [7:0] _2470;
    wire [7:0] _2481;
    wire [7:0] _101;
    reg [7:0] _2495;
    wire [2:0] _2488;
    wire [2:0] _2489;
    wire [2:0] _102;
    reg [2:0] _2486;
    reg [7:0] _2538;
    wire [31:0] _2541;
    wire [31:0] _2542;
    wire [31:0] _106;
    reg [31:0] ts_reg;
    wire [1:0] _2544;
    wire [1:0] _2359;
    wire [1:0] _2361;
    reg [1:0] _2545;
    reg _2548;
    reg [1:0] _2551;
    reg _2554;
    wire _2555;
    wire _2556;
    wire _2557;
    wire [7:0] _2698;
    wire [7:0] _2699;
    wire [7:0] _2579;
    wire [7:0] _2577;
    wire [7:0] _2576;
    wire [7:0] _2575;
    wire [7:0] _2574;
    reg [7:0] _2578;
    wire [7:0] _2580;
    wire [7:0] _2581;
    wire [7:0] _2572;
    wire [7:0] _2573;
    wire [7:0] _2582;
    wire [7:0] _2616;
    wire [7:0] _2617;
    wire [7:0] _2619;
    wire [7:0] _2621;
    wire [7:0] _116;
    reg [7:0] f_poe;
    wire [7:0] _2700;
    wire [7:0] _119;
    wire [7:0] _4133;
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
    wire _2653;
    wire [2:0] _2652;
    reg _2660;
    wire _2650;
    wire _2649;
    wire _2647;
    wire _2648;
    wire _2646;
    wire _2645;
    wire _2644;
    wire [2:0] _2643;
    reg _2651;
    wire _2641;
    wire _2640;
    wire _2638;
    wire _2639;
    wire _2637;
    wire _2636;
    wire _2635;
    wire [2:0] _2634;
    reg _2642;
    wire _2632;
    wire _2631;
    wire _2629;
    wire _2630;
    wire _2628;
    wire _2627;
    wire [2:0] _4125;
    wire _4122;
    wire [1:0] _4123;
    wire [3:0] _4124;
    wire [6:0] _4126;
    wire [7:0] _4127;
    wire [7:0] _4128;
    wire _2613;
    wire _2612;
    wire _2611;
    wire _2609;
    wire _2610;
    wire _2607;
    wire _2608;
    wire _2604;
    wire _2605;
    wire _2606;
    wire _2601;
    wire _2602;
    wire _2603;
    wire _2598;
    wire _2597;
    wire _2599;
    wire _2596;
    wire _2600;
    wire [7:0] _2614;
    wire _2583;
    wire _2589;
    wire [7:0] _2615;
    wire [7:0] _4120;
    wire [7:0] _4116;
    wire [7:0] _4114;
    wire [7:0] _4113;
    wire [7:0] _4112;
    wire [7:0] _4111;
    reg [7:0] _4115;
    wire [7:0] _4117;
    wire [7:0] _4118;
    wire [7:0] _2570;
    wire [7:0] _2568;
    wire [7:0] _2567;
    wire [7:0] _2566;
    wire [7:0] _2565;
    reg [7:0] _2569;
    wire [7:0] _2571;
    wire [7:0] _4109;
    wire [7:0] _4110;
    wire [7:0] _4119;
    wire [7:0] _4121;
    wire [7:0] _4129;
    wire _2559;
    wire _2560;
    wire _2561;
    wire [7:0] _4130;
    wire [31:0] _121;
    wire [31:0] _4102;
    wire [31:0] _2812;
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
    wire [30:0] _2740;
    wire [31:0] _2741;
    wire [31:0] _2743;
    wire [30:0] _2737;
    wire [31:0] _2738;
    wire [7:0] _2731;
    wire [7:0] _2730;
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
    wire [12:0] _2713;
    wire [12:0] _2714;
    wire [3:0] _2715;
    reg [7:0] _2732;
    wire [23:0] _2712;
    wire [31:0] _2733;
    wire _2710;
    wire _2711;
    wire [31:0] _2815;
    wire [31:0] _2708;
    wire [31:0] _2816;
    wire [31:0] _122;
    reg [31:0] _2706;
    wire [31:0] _2734;
    wire _2735;
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
    wire [31:0] _4103;
    wire f_sw_match;
    wire _4105;
    wire _4107;
    wire _1299;
    wire _1298;
    wire f_store_we;
    wire _4097;
    wire _4099;
    wire _4101;
    wire [12:0] _4090;
    wire [12:0] _2820;
    wire [12:0] _2818;
    wire [12:0] _2821;
    wire [12:0] _123;
    reg [12:0] f_sw_cnt;
    wire f_sw_last;
    wire _4093;
    wire _125;
    wire _127;
    wire _4087;
    wire _4088;
    wire _4089;
    wire _4095;
    wire _2702;
    wire [1:0] _4079;
    wire [1:0] _4075;
    wire [1:0] _2026;
    wire _4066;
    wire [1:0] _4068;
    wire _4065;
    wire [1:0] _4070;
    wire _4064;
    wire [1:0] _4072;
    wire [1:0] _4073;
    wire [7:0] _1215;
    wire _1217;
    wire _1208;
    wire [15:0] _1203;
    wire _1204;
    wire _1205;
    wire _1202;
    wire _1206;
    wire _1209;
    wire [3:0] _1199;
    wire _1201;
    wire _1210;
    wire _1197;
    wire _1193;
    wire _1194;
    wire _1191;
    wire _1195;
    wire _1198;
    wire _1189;
    reg [2:0] _1083;
    wire [15:0] _1184;
    wire _1185;
    wire _1182;
    wire _1186;
    wire _1180;
    wire _1187;
    wire _1190;
    wire [1:0] _1179;
    reg _1211;
    wire _1178;
    wire _1212;
    wire _1175;
    wire [3:0] _1173;
    reg _1174;
    wire _1176;
    wire [15:0] _1168;
    wire _1170;
    wire [16:0] _1163;
    wire [15:0] _1159;
    wire [16:0] _1160;
    wire [16:0] _1161;
    reg [16:0] _1164;
    wire _1165;
    wire _1166;
    wire [15:0] _1155;
    wire _1157;
    wire _1072;
    wire [2:0] _1074;
    wire _1069;
    wire [2:0] _1071;
    wire _1075;
    wire [2:0] _1076;
    wire _1064;
    wire [2:0] _1066;
    wire _1061;
    wire [2:0] _1063;
    wire _1067;
    wire [2:0] _1068;
    wire _1077;
    wire [2:0] _1078;
    wire _1054;
    wire [2:0] _1056;
    wire _1051;
    wire [2:0] _1053;
    wire _1057;
    wire [2:0] _1058;
    wire _1046;
    wire [2:0] _1048;
    wire [7:0] _1042;
    wire _1043;
    wire [2:0] _1045;
    wire _1049;
    wire [2:0] _1050;
    wire _1059;
    wire [2:0] _1060;
    wire _1079;
    wire [2:0] _1080;
    wire [13:0] _1147;
    wire [16:0] _1148;
    wire [111:0] _1041;
    wire [15:0] _1145;
    wire [16:0] _1146;
    wire [16:0] _1149;
    reg [16:0] _1152;
    wire [16:0] _1144;
    wire _1153;
    wire _1154;
    wire _1158;
    wire _1167;
    wire [1:0] _1086;
    reg [15:0] _1141;
    wire _1143;
    wire _1171;
    wire [7:0] _1135;
    wire _1137;
    wire _1138;
    wire _1134;
    wire _1139;
    wire [7:0] _1128;
    wire [7:0] _1126;
    wire [7:0] _1127;
    wire [7:0] _1129;
    wire _1131;
    wire _1132;
    wire _1140;
    wire _1172;
    wire _1177;
    wire _1213;
    wire _1214;
    wire _1218;
    wire f_fire3;
    wire [7:0] _720;
    wire _722;
    wire _708;
    wire _704;
    wire _705;
    wire _702;
    wire _706;
    wire _709;
    wire [3:0] _699;
    wire _701;
    wire _710;
    wire _697;
    wire _693;
    wire _694;
    wire _691;
    wire _695;
    wire _698;
    wire _689;
    reg [2:0] _683;
    wire [15:0] _684;
    wire _685;
    wire _679;
    wire _686;
    wire _677;
    wire _687;
    wire _690;
    wire [1:0] _676;
    reg _711;
    wire _675;
    wire _712;
    wire _667;
    wire [3:0] _613;
    reg _666;
    wire _668;
    wire [15:0] _608;
    wire _610;
    wire [15:0] _599;
    wire [16:0] _600;
    wire [16:0] _601;
    reg [16:0] _604;
    wire _605;
    wire _606;
    wire [15:0] _595;
    wire _597;
    wire _561;
    wire [2:0] _581;
    wire _540;
    wire [2:0] _560;
    wire _582;
    wire [2:0] _583;
    wire _517;
    wire [2:0] _537;
    wire _496;
    wire [2:0] _516;
    wire _538;
    wire [2:0] _539;
    wire _584;
    wire [2:0] _585;
    wire _471;
    wire [2:0] _491;
    wire _450;
    wire [2:0] _470;
    wire _492;
    wire [2:0] _493;
    wire _427;
    wire [2:0] _447;
    wire [7:0] _405;
    wire _406;
    wire [2:0] _426;
    wire _448;
    wire [2:0] _449;
    wire _494;
    wire [2:0] _495;
    wire _586;
    wire [2:0] _587;
    wire [16:0] _588;
    wire [111:0] _401;
    wire [15:0] _402;
    wire [16:0] _403;
    wire [16:0] _589;
    reg [16:0] _592;
    wire [16:0] _378;
    wire _593;
    wire _594;
    wire _598;
    wire _607;
    wire [1:0] _364;
    reg [15:0] _374;
    wire _376;
    wire _611;
    wire [7:0] _358;
    wire _360;
    wire _361;
    wire _349;
    wire _362;
    wire [7:0] _342;
    wire [7:0] _340;
    wire [7:0] _341;
    wire [7:0] _343;
    wire _345;
    wire [127:0] _320;
    wire [2:0] _4049;
    wire [5:0] _1227;
    wire [5:0] _129;
    wire [5:0] _2838;
    wire [5:0] _131;
    wire [5:0] _2825;
    wire [5:0] _132;
    reg [5:0] _2824;
    wire _2828;
    wire [5:0] _2829;
    wire [5:0] _2830;
    wire [5:0] _2839;
    wire _2826;
    wire [5:0] _2840;
    wire [5:0] _2841;
    wire [5:0] _133;
    reg [5:0] _1228;
    wire [5:0] _2834;
    wire [5:0] _2833;
    wire [5:0] _2832;
    wire [5:0] _2831;
    reg [5:0] _2835;
    wire _2836;
    wire _2837;
    wire [2:0] _4045;
    wire _4040;
    wire [2:0] _4042;
    wire [7:0] _2017;
    wire _2019;
    wire _2020;
    wire _2015;
    wire _2016;
    wire f_unexp_now;
    wire _2845;
    wire _2846;
    wire _2848;
    wire _2849;
    wire _2844;
    wire _2842;
    wire _2850;
    wire _134;
    reg _2012;
    wire _2013;
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
    wire [7:0] _1029;
    wire _1031;
    wire _1022;
    wire _1018;
    wire _1019;
    wire _1016;
    wire _1020;
    wire _1023;
    wire [3:0] _1013;
    wire _1015;
    wire _1024;
    wire _1011;
    wire _1007;
    wire _1008;
    wire _1005;
    wire _1009;
    wire _1012;
    wire _1003;
    reg [2:0] _997;
    wire [15:0] _998;
    wire _999;
    wire _993;
    wire _1000;
    wire _991;
    wire _1001;
    wire _1004;
    wire [1:0] _990;
    reg _1025;
    wire _989;
    wire _1026;
    wire _986;
    wire [3:0] _984;
    reg _985;
    wire _987;
    wire [15:0] _979;
    wire _981;
    wire [15:0] _970;
    wire [16:0] _971;
    wire [16:0] _972;
    reg [16:0] _975;
    wire _976;
    wire _977;
    wire [15:0] _966;
    wire _968;
    wire _950;
    wire [2:0] _952;
    wire _947;
    wire [2:0] _949;
    wire _953;
    wire [2:0] _954;
    wire _942;
    wire [2:0] _944;
    wire _939;
    wire [2:0] _941;
    wire _945;
    wire [2:0] _946;
    wire _955;
    wire [2:0] _956;
    wire _932;
    wire [2:0] _934;
    wire _929;
    wire [2:0] _931;
    wire _935;
    wire [2:0] _936;
    wire _924;
    wire [2:0] _926;
    wire [7:0] _920;
    wire _921;
    wire [2:0] _923;
    wire _927;
    wire [2:0] _928;
    wire _937;
    wire [2:0] _938;
    wire _957;
    wire [2:0] _958;
    wire [16:0] _959;
    wire [111:0] _916;
    wire [15:0] _917;
    wire [16:0] _918;
    wire [16:0] _960;
    reg [16:0] _963;
    wire [16:0] _915;
    wire _964;
    wire _965;
    wire _969;
    wire _978;
    wire [1:0] _911;
    reg [15:0] _912;
    wire _914;
    wire _982;
    wire [7:0] _905;
    wire _907;
    wire _908;
    wire _904;
    wire _909;
    wire [7:0] _898;
    wire [7:0] _896;
    wire [7:0] _897;
    wire [7:0] _899;
    wire _901;
    wire _902;
    wire _910;
    wire _983;
    wire _988;
    wire _1027;
    wire _1028;
    wire _1032;
    wire f_fire2;
    wire [1:0] _1036;
    wire [1:0] f_policy;
    wire _755;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _745;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _739;
    wire [7:0] _733;
    wire [7:0] f_chgmask0;
    wire [7:0] _727;
    wire [7:0] f_watch;
    wire [7:0] _728;
    wire [7:0] _734;
    wire [7:0] _740;
    wire [7:0] f_relevant;
    wire [7:0] _747;
    wire _749;
    wire _750;
    wire f_amb_now;
    wire _752;
    wire _756;
    wire [7:0] _718;
    wire [7:0] _2855;
    wire [7:0] _2856;
    wire _2852;
    wire [7:0] _2854;
    wire _2851;
    wire [7:0] _2857;
    wire [7:0] _2859;
    wire [7:0] _135;
    reg [7:0] _717;
    wire [7:0] f_multi_eff;
    wire [7:0] _891;
    wire _893;
    wire _884;
    wire _880;
    wire _881;
    wire _878;
    wire _882;
    wire _885;
    wire [3:0] _875;
    wire _877;
    wire _886;
    wire _873;
    wire _869;
    wire _870;
    wire _867;
    wire _871;
    wire _874;
    wire _865;
    reg [2:0] _859;
    wire [15:0] _860;
    wire _861;
    wire _855;
    wire _862;
    wire _853;
    wire _863;
    wire _866;
    wire [1:0] _852;
    reg _887;
    wire [1:0] _137;
    wire [1:0] _2860;
    wire [1:0] _138;
    reg [1:0] _672;
    wire _674;
    wire _851;
    wire _888;
    wire _848;
    wire _2864;
    wire _2862;
    wire _2865;
    wire _2867;
    wire _2869;
    wire _139;
    reg _665;
    wire [15:0] _141;
    wire [15:0] _143;
    wire [15:0] _2875;
    wire [15:0] _2876;
    wire [15:0] _2877;
    wire [15:0] _2879;
    wire [15:0] _144;
    reg [15:0] _2872;
    wire [14:0] _2873;
    wire [15:0] _2874;
    wire [15:0] _2880;
    wire [15:0] _2881;
    wire _2883;
    wire _2885;
    wire _2886;
    wire _2887;
    wire _2888;
    wire _2890;
    wire _2892;
    wire _145;
    reg _662;
    wire _2905;
    wire _2906;
    wire _2908;
    wire _2909;
    wire _2910;
    wire _2911;
    wire _2913;
    wire _146;
    reg g_crc_bad;
    wire _2907;
    wire _2916;
    wire [5:0] _2914;
    wire _2915;
    wire _2917;
    wire _2918;
    wire _2919;
    wire _2920;
    wire _2921;
    wire _2923;
    wire _2925;
    wire _147;
    reg _659;
    wire _2929;
    wire _2927;
    wire _2930;
    wire _2932;
    wire _2934;
    wire _148;
    reg _651;
    wire [15:0] _150;
    wire [15:0] _152;
    wire [15:0] _2940;
    wire [15:0] _2941;
    wire [15:0] _2942;
    wire [15:0] _2944;
    wire [15:0] _153;
    reg [15:0] _2937;
    wire [14:0] _2938;
    wire [15:0] _2939;
    wire [15:0] _2945;
    wire [15:0] _2946;
    wire _2948;
    wire _2950;
    wire _2951;
    wire _2952;
    wire _2953;
    wire _2955;
    wire _2957;
    wire _154;
    reg _648;
    wire _2970;
    wire _2971;
    wire _2973;
    wire _2974;
    wire _2975;
    wire _2976;
    wire _2978;
    wire _155;
    reg g_crc_bad_0;
    wire _2972;
    wire _2981;
    wire _2980;
    wire _2982;
    wire _2983;
    wire _2984;
    wire _2985;
    wire _2986;
    wire _2988;
    wire _2990;
    wire _156;
    reg _645;
    wire [7:0] _158;
    wire [6:0] _636;
    wire [6:0] _635;
    wire _637;
    wire [15:0] _632;
    wire _2995;
    wire _2994;
    wire _2996;
    wire _2993;
    wire _2997;
    wire _2992;
    wire _2998;
    wire [14:0] _2991;
    wire [15:0] _2999;
    wire [15:0] _159;
    reg [15:0] _633;
    wire _634;
    wire [3:0] _3018;
    wire [3:0] _3016;
    wire [3:0] _3019;
    wire _2431;
    wire _2482;
    wire _161;
    wire _2483;
    wire _2432;
    wire _2465;
    wire _3003;
    wire _2459;
    wire _2460;
    wire _3001;
    wire _1805;
    wire _1806;
    wire _1812;
    wire _1809;
    wire _1810;
    wire _1808;
    wire _1811;
    wire _1813;
    wire _3004;
    wire _162;
    reg _1792;
    wire _3012;
    wire _2456;
    wire _3008;
    wire _2440;
    wire _2441;
    wire _3006;
    wire _1755;
    wire [2:0] _1749;
    wire _1744;
    wire g_tx_bit;
    wire _1745;
    wire _1746;
    wire _1747;
    wire [2:0] _1750;
    wire _1752;
    wire _1753;
    wire _1724;
    wire _1754;
    wire _1756;
    wire _1720;
    wire _1721;
    wire _1757;
    wire _1760;
    wire _1759;
    wire _1761;
    wire _3009;
    wire _163;
    reg _1708;
    wire _3010;
    wire _1678;
    wire [2:0] _1672;
    wire _1667;
    wire g_tx_bit_0;
    wire _1668;
    wire _1669;
    wire _1670;
    wire [2:0] _1673;
    wire _1675;
    wire _1676;
    wire _1647;
    wire _1677;
    wire _1679;
    wire _1643;
    wire _1644;
    wire _1680;
    wire _3011;
    wire _3013;
    wire _164;
    wire _2433;
    wire _3014;
    wire [3:0] _3020;
    reg [3:0] _3023;
    wire [3:0] _165;
    wire _630;
    wire [6:0] _3040;
    wire [7:0] _3041;
    wire [6:0] _3038;
    wire _3036;
    wire _3035;
    wire _3034;
    wire _3033;
    wire _3032;
    wire _3031;
    wire _3030;
    wire _3029;
    wire [2:0] _3027;
    wire [2:0] _3026;
    wire [2:0] _3025;
    wire [2:0] _3024;
    reg [2:0] _3028;
    reg _3037;
    wire [7:0] _3039;
    wire [1:0] _1800;
    wire [1:0] _1799;
    wire [1:0] _1798;
    wire [1:0] _1797;
    reg [1:0] _1801;
    wire [1:0] _1803;
    reg [7:0] _3042;
    wire [7:0] _3043;
    wire [7:0] _166;
    reg [7:0] _625;
    wire _626;
    wire [6:0] _3784;
    wire [7:0] _3785;
    wire _3782;
    wire _3781;
    wire _3780;
    wire _3779;
    wire _3778;
    wire _3777;
    wire _3776;
    wire _3775;
    wire [7:0] _3783;
    wire [3:0] _3767;
    wire [3:0] _3765;
    wire [3:0] _3768;
    wire _3457;
    wire _1889;
    wire _1725;
    wire _3417;
    wire _3418;
    wire [1:0] _3421;
    wire _3410;
    wire _3411;
    wire _3412;
    wire _3413;
    wire [1:0] _3415;
    wire [2:0] _3396;
    wire [2:0] _3393;
    wire _3389;
    wire _3387;
    wire _3388;
    wire _3390;
    wire [2:0] _3394;
    wire _3385;
    wire [2:0] _3397;
    wire _3398;
    wire [2:0] _3379;
    wire _3375;
    wire _3373;
    wire _3374;
    wire _3376;
    wire [2:0] _3380;
    wire _3371;
    wire [2:0] _3382;
    wire _3383;
    wire _3399;
    wire _3400;
    wire _3401;
    wire _3367;
    wire _3365;
    wire _3368;
    wire [15:0] _3360;
    wire _3361;
    wire _3358;
    wire _3362;
    wire _3356;
    wire _3357;
    wire _3363;
    wire _3369;
    wire _3402;
    wire [1:0] _3404;
    wire [1:0] _3406;
    wire [1:0] _3352;
    wire _3348;
    wire [1:0] _3350;
    wire [1:0] _3353;
    wire _3128;
    wire _3129;
    wire _167;
    reg _3046;
    wire _3278;
    wire _3276;
    wire _3277;
    reg _3279;
    wire [2:0] _169;
    wire [2:0] _3260;
    wire [2:0] _3261;
    wire [2:0] _3256;
    wire _3252;
    wire _3250;
    wire _3251;
    wire _3253;
    wire [2:0] _3257;
    wire _3248;
    wire [2:0] _3262;
    wire [2:0] _3263;
    wire [2:0] _3242;
    wire [2:0] _3243;
    wire [2:0] _3238;
    wire _3124;
    wire _3123;
    wire _3122;
    wire _3121;
    wire _3120;
    wire _3119;
    wire _3118;
    wire _3114;
    wire _3113;
    wire _3112;
    wire _3111;
    wire _3110;
    wire _3109;
    wire _3108;
    wire [7:0] _3105;
    wire [6:0] _2450;
    wire [7:0] _2451;
    wire [6:0] _2448;
    wire [7:0] _2449;
    wire [7:0] _2452;
    wire [7:0] _3134;
    wire [7:0] _3135;
    wire [7:0] _3136;
    wire [7:0] _3130;
    wire [7:0] _3131;
    wire [7:0] _3132;
    wire [7:0] _3133;
    wire [7:0] _3137;
    wire [7:0] _170;
    reg [7:0] g_byte;
    wire _1886;
    wire _1883;
    wire _1884;
    wire _1887;
    wire [7:0] _3106;
    wire _3107;
    wire [7:0] _3115;
    wire _172;
    wire [7:0] _3116;
    wire _3117;
    wire [2:0] _3145;
    wire [2:0] _3146;
    wire [2:0] _3147;
    wire [2:0] _3148;
    wire [2:0] _3139;
    wire [2:0] _3140;
    wire [2:0] _3141;
    wire [2:0] _3142;
    wire [2:0] _3143;
    wire [2:0] _3149;
    wire [2:0] _3151;
    wire [2:0] _173;
    reg [2:0] g_bitpos;
    reg _3125;
    wire _175;
    wire [31:0] _177;
    wire [30:0] _3193;
    wire [31:0] _3195;
    wire _3187;
    wire _3188;
    wire [31:0] _3190;
    wire [30:0] _3184;
    wire [31:0] _3186;
    wire [31:0] _3191;
    wire [31:0] _3192;
    wire [5:0] _179;
    wire [5:0] _3161;
    wire [5:0] _3162;
    wire [5:0] _3163;
    wire [5:0] _3164;
    wire [5:0] _3155;
    wire [5:0] _3156;
    wire [5:0] _3157;
    wire [5:0] _3158;
    wire [5:0] _3159;
    wire [5:0] _3165;
    wire [5:0] _3166;
    wire [5:0] _3168;
    wire [5:0] _180;
    reg [5:0] g_left;
    wire _1740;
    wire _1741;
    wire _2897;
    wire _2896;
    wire _2898;
    wire _2899;
    wire [31:0] _3196;
    wire [31:0] _3197;
    wire [31:0] _3198;
    wire [31:0] _182;
    wire _3175;
    wire _3176;
    wire [31:0] _3178;
    wire [30:0] _3172;
    wire [31:0] _3174;
    wire [31:0] _3179;
    wire [30:0] _3169;
    wire [31:0] _3171;
    wire [31:0] _3180;
    wire [31:0] _3181;
    wire [31:0] _3182;
    wire [31:0] _3183;
    wire [31:0] _3199;
    wire [31:0] _3200;
    wire [31:0] _3202;
    wire [31:0] _183;
    reg [31:0] g_crc;
    wire _2903;
    wire _2904;
    wire [15:0] _185;
    wire [15:0] _3222;
    wire _1710;
    wire _1715;
    wire [15:0] _3223;
    wire _1709;
    wire [15:0] _3224;
    wire _3205;
    wire _3203;
    wire _3204;
    wire _3206;
    wire _3208;
    wire _186;
    reg g_last;
    wire _1617;
    wire _1614;
    wire _1618;
    wire _3210;
    wire _3211;
    wire _3212;
    wire _3214;
    wire _187;
    reg g_prev;
    wire _1611;
    wire _1608;
    wire _1612;
    wire _1619;
    wire _1620;
    wire _1621;
    wire [15:0] _3225;
    wire [15:0] _3216;
    wire [15:0] _3217;
    wire [15:0] _3218;
    wire [15:0] _3219;
    wire [15:0] _3220;
    wire [15:0] _3226;
    wire [15:0] _3228;
    wire [15:0] _188;
    reg [15:0] g_cnt;
    wire g_data_left;
    wire _3126;
    wire _3127;
    wire _3234;
    wire _3232;
    wire _3233;
    wire _3235;
    wire [2:0] _3239;
    wire _3230;
    wire [2:0] _3244;
    wire [2:0] _3245;
    wire [2:0] _3246;
    wire [2:0] _3264;
    wire [2:0] _3266;
    wire [2:0] _189;
    reg [2:0] g_run;
    wire _1605;
    wire [1:0] _191;
    wire _1600;
    wire _1601;
    wire _1606;
    wire _1735;
    wire _1742;
    wire _3280;
    wire _3281;
    wire _1730;
    wire _1728;
    wire _1731;
    wire _1732;
    wire _1733;
    wire _3273;
    wire _3270;
    wire _3267;
    wire _3268;
    wire _3271;
    wire _3272;
    wire _3274;
    wire _3282;
    wire _3284;
    wire _3286;
    wire _3288;
    wire _3290;
    wire _192;
    reg f_lane1_out;
    wire _1589;
    wire _1590;
    wire _1583;
    wire _1584;
    wire _1580;
    wire _194;
    wire _1577;
    wire _1578;
    wire _1579;
    wire _1581;
    wire _1585;
    wire _1586;
    wire _1591;
    wire [1:0] _3355;
    wire _1572;
    wire _1573;
    wire _1568;
    wire _1567;
    wire _1566;
    wire _1565;
    wire _1564;
    wire _1563;
    wire _1562;
    wire _1561;
    reg _1569;
    wire _1570;
    wire _1559;
    wire _1558;
    wire _1557;
    wire _1556;
    wire _1555;
    wire _1554;
    wire _1553;
    wire _1552;
    wire [2:0] _196;
    reg _1560;
    wire _1571;
    wire _198;
    wire _1574;
    wire _1550;
    wire _1547;
    wire _1540;
    wire _1538;
    wire [13:0] _1529;
    wire [15:0] _1530;
    wire [14:0] _1526;
    wire [15:0] _1527;
    wire [15:0] _1531;
    wire [14:0] _1523;
    wire [15:0] _1524;
    wire _1521;
    wire [15:0] _1532;
    reg [15:0] _1535;
    wire _1536;
    wire [13:0] _1513;
    wire [15:0] _1514;
    reg [15:0] _1517;
    wire _3336;
    wire _3337;
    wire [15:0] _3338;
    wire [15:0] _3340;
    wire [15:0] _3342;
    wire _3320;
    wire [14:0] _1542;
    wire [15:0] _1543;
    reg [15:0] _1546;
    wire [16:0] _3316;
    wire _3317;
    wire [16:0] _3310;
    reg [16:0] _3313;
    wire [16:0] _3305;
    wire [15:0] _200;
    wire [16:0] _3304;
    wire [16:0] _3306;
    reg [16:0] _3309;
    wire [7:0] _202;
    wire [8:0] _3324;
    wire [7:0] _3326;
    wire [7:0] _3327;
    wire [7:0] _3328;
    wire [7:0] _3330;
    wire [7:0] _203;
    reg [7:0] _3298;
    wire [8:0] _3323;
    wire [8:0] _3325;
    wire _3331;
    wire _3332;
    wire _3333;
    wire _3335;
    wire _204;
    reg _3303;
    wire [16:0] _3314;
    wire [16:0] _3300;
    wire _3315;
    wire _3318;
    wire _3321;
    wire _3299;
    wire _3322;
    wire [15:0] _3344;
    wire _3294;
    wire _3292;
    wire _656;
    wire _3291;
    wire _3293;
    wire _3295;
    wire [15:0] _3345;
    wire [15:0] _3347;
    wire [15:0] _205;
    reg [15:0] _1511;
    wire _1518;
    wire _1519;
    wire _1508;
    wire _1520;
    wire _1537;
    wire _1539;
    wire _1548;
    wire [1:0] _207;
    wire _1504;
    wire _1505;
    wire _1502;
    wire _1506;
    wire _1499;
    wire _1495;
    wire _1494;
    wire _1493;
    wire _1492;
    wire _1491;
    wire _1490;
    wire _1489;
    wire _1488;
    reg _1496;
    wire _1486;
    wire _1485;
    wire _1484;
    wire _1483;
    wire _1482;
    wire _1481;
    wire _1480;
    wire _1479;
    wire [2:0] _209;
    reg _1487;
    wire _1497;
    wire _1498;
    wire _1500;
    wire _1507;
    wire _1551;
    wire _211;
    wire _1575;
    wire _213;
    wire _1478;
    wire _1576;
    wire [1:0] _3407;
    wire _1723;
    wire [1:0] _3409;
    wire _3153;
    wire [1:0] _3416;
    wire _1475;
    wire [1:0] _3422;
    wire _1472;
    wire _1473;
    wire [1:0] _3424;
    wire [1:0] _214;
    reg [1:0] g_mode;
    wire _1477;
    wire _1726;
    wire _1734;
    wire _1888;
    wire _1890;
    wire _1881;
    wire _1648;
    wire _3753;
    wire _3754;
    wire [1:0] _3757;
    wire _3746;
    wire _3747;
    wire _3748;
    wire _3749;
    wire [1:0] _3751;
    wire [2:0] _3732;
    wire [2:0] _3729;
    wire _3725;
    wire _3723;
    wire _3724;
    wire _3726;
    wire [2:0] _3730;
    wire _3721;
    wire [2:0] _3733;
    wire _3734;
    wire [2:0] _3715;
    wire _3711;
    wire _3709;
    wire _3710;
    wire _3712;
    wire [2:0] _3716;
    wire _3707;
    wire [2:0] _3718;
    wire _3719;
    wire _3735;
    wire _3736;
    wire _3737;
    wire _3703;
    wire _3701;
    wire _3704;
    wire [15:0] _3696;
    wire _3697;
    wire _3694;
    wire _3698;
    wire _3692;
    wire _3693;
    wire _3699;
    wire _3705;
    wire _3738;
    wire [1:0] _3740;
    wire [1:0] _3742;
    wire [1:0] _3688;
    wire _3684;
    wire [1:0] _3686;
    wire [1:0] _3689;
    wire _3452;
    wire _3453;
    wire _215;
    reg _3427;
    wire _3610;
    wire _3608;
    wire _3609;
    reg _3611;
    wire [2:0] _217;
    wire [2:0] _3592;
    wire [2:0] _3593;
    wire [2:0] _3588;
    wire _3584;
    wire _3582;
    wire _3583;
    wire _3585;
    wire [2:0] _3589;
    wire _3580;
    wire [2:0] _3594;
    wire [2:0] _3595;
    wire [2:0] _3574;
    wire [2:0] _3575;
    wire [2:0] _3570;
    wire _3448;
    wire _3447;
    wire _3446;
    wire _3445;
    wire _3444;
    wire _3443;
    wire _3442;
    wire _3438;
    wire _3437;
    wire _3436;
    wire _3435;
    wire _3434;
    wire _3433;
    wire _3432;
    wire _3100;
    wire _3101;
    reg [7:0] _3102;
    wire _3094;
    wire _3095;
    reg [7:0] _3096;
    wire _3088;
    wire _3089;
    reg [7:0] _3090;
    wire _3082;
    wire _3083;
    reg [7:0] _3084;
    wire _3076;
    wire _3077;
    reg [7:0] _3078;
    wire _3070;
    wire _3071;
    reg [7:0] _3072;
    wire _3064;
    wire _3065;
    reg [7:0] _3066;
    wire [2:0] _3455;
    wire [2:0] _3456;
    wire [2:0] _218;
    reg [2:0] _3056;
    wire _3058;
    wire _3059;
    wire [7:0] _220;
    reg [7:0] _3060;
    wire [2:0] _3460;
    wire [2:0] _3461;
    wire [2:0] _221;
    reg [2:0] _3049;
    reg [7:0] _3103;
    wire [7:0] _3429;
    wire [6:0] _2476;
    wire [7:0] _2477;
    wire [6:0] _2474;
    wire [7:0] _2475;
    wire [7:0] _2478;
    wire [7:0] _3466;
    wire [7:0] _3467;
    wire [7:0] _3468;
    wire [7:0] _3462;
    wire [7:0] _3463;
    wire [7:0] _3464;
    wire [7:0] _3465;
    wire [7:0] _3469;
    wire [7:0] _222;
    reg [7:0] g_byte_0;
    wire _1878;
    wire _1875;
    wire _1876;
    wire _1879;
    wire [7:0] _3430;
    wire _3431;
    wire [7:0] _3439;
    wire _224;
    wire [7:0] _3440;
    wire _3441;
    wire [2:0] _3477;
    wire [2:0] _3478;
    wire [2:0] _3479;
    wire [2:0] _3480;
    wire [2:0] _3471;
    wire [2:0] _3472;
    wire [2:0] _3473;
    wire [2:0] _3474;
    wire [2:0] _3475;
    wire [2:0] _3481;
    wire [2:0] _3483;
    wire [2:0] _225;
    reg [2:0] g_bitpos_0;
    reg _3449;
    wire _227;
    wire [31:0] _229;
    wire [30:0] _3525;
    wire [31:0] _3527;
    wire _3519;
    wire _3520;
    wire [31:0] _3522;
    wire [30:0] _3516;
    wire [31:0] _3518;
    wire [31:0] _3523;
    wire [31:0] _3524;
    wire [5:0] _231;
    wire [5:0] _3493;
    wire [5:0] _3494;
    wire [5:0] _3495;
    wire [5:0] _3496;
    wire [5:0] _3487;
    wire [5:0] _3488;
    wire [5:0] _3489;
    wire [5:0] _3490;
    wire [5:0] _3491;
    wire [5:0] _3497;
    wire [5:0] _3498;
    wire [5:0] _3500;
    wire [5:0] _232;
    reg [5:0] g_left_0;
    wire _1663;
    wire _1664;
    wire _2962;
    wire _2961;
    wire _2963;
    wire _2964;
    wire [31:0] _3528;
    wire [31:0] _3529;
    wire [31:0] _3530;
    wire [31:0] _234;
    wire _3507;
    wire _3508;
    wire [31:0] _3510;
    wire [30:0] _3504;
    wire [31:0] _3506;
    wire [31:0] _3511;
    wire [30:0] _3501;
    wire [31:0] _3503;
    wire [31:0] _3512;
    wire [31:0] _3513;
    wire [31:0] _3514;
    wire [31:0] _3515;
    wire [31:0] _3531;
    wire [31:0] _3532;
    wire [31:0] _3534;
    wire [31:0] _235;
    reg [31:0] g_crc_0;
    wire _2968;
    wire _2969;
    wire [15:0] _237;
    wire [15:0] _3554;
    wire _1633;
    wire _1638;
    wire [15:0] _3555;
    wire _1632;
    wire [15:0] _3556;
    wire _3537;
    wire _3535;
    wire _3536;
    wire _3538;
    wire _3540;
    wire _238;
    reg g_last_0;
    wire _1459;
    wire _1456;
    wire _1460;
    wire _3542;
    wire _3543;
    wire _3544;
    wire _3546;
    wire _239;
    reg g_prev_0;
    wire _1453;
    wire _1450;
    wire _1454;
    wire _1461;
    wire _1462;
    wire _1463;
    wire [15:0] _3557;
    wire [15:0] _3548;
    wire [15:0] _3549;
    wire [15:0] _3550;
    wire [15:0] _3551;
    wire [15:0] _3552;
    wire [15:0] _3558;
    wire [15:0] _3560;
    wire [15:0] _240;
    reg [15:0] g_cnt_0;
    wire g_data_left_0;
    wire _3450;
    wire _3451;
    wire _3566;
    wire _3564;
    wire _3565;
    wire _3567;
    wire [2:0] _3571;
    wire _3562;
    wire [2:0] _3576;
    wire [2:0] _3577;
    wire [2:0] _3578;
    wire [2:0] _3596;
    wire [2:0] _3598;
    wire [2:0] _241;
    reg [2:0] g_run_0;
    wire _1447;
    wire [1:0] _243;
    wire _1442;
    wire _1443;
    wire _1448;
    wire _1658;
    wire _1665;
    wire _3612;
    wire _3613;
    wire _1653;
    wire _1651;
    wire _1654;
    wire _1655;
    wire _1656;
    wire _3605;
    wire _3602;
    wire _3599;
    wire _3600;
    wire _3603;
    wire _3604;
    wire _3606;
    wire _3614;
    wire _3616;
    wire _3618;
    wire _3620;
    wire _3622;
    wire _244;
    reg f_lane0_out;
    wire _1431;
    wire _1432;
    wire _1425;
    wire _1426;
    wire _1422;
    wire _246;
    wire _1419;
    wire _1420;
    wire _1421;
    wire _1423;
    wire _1427;
    wire _1428;
    wire _1433;
    wire [1:0] _3691;
    wire _1414;
    wire _1415;
    wire _1410;
    wire _1409;
    wire _1408;
    wire _1407;
    wire _1406;
    wire _1405;
    wire _1404;
    wire _1403;
    reg _1411;
    wire _1412;
    wire _1401;
    wire _1400;
    wire _1399;
    wire _1398;
    wire _1397;
    wire _1396;
    wire _1395;
    wire _1394;
    wire [2:0] _248;
    reg _1402;
    wire _1413;
    wire _250;
    wire _1416;
    wire _1392;
    wire _1389;
    wire _1382;
    wire _1380;
    wire [13:0] _1371;
    wire [15:0] _1372;
    wire [14:0] _1368;
    wire [15:0] _1369;
    wire [15:0] _1373;
    wire [14:0] _1365;
    wire [15:0] _1366;
    wire _1363;
    wire [15:0] _1374;
    reg [15:0] _1377;
    wire _1378;
    wire [13:0] _1355;
    wire [15:0] _1356;
    reg [15:0] _1359;
    wire _3668;
    wire _3669;
    wire [15:0] _3670;
    wire [15:0] _3672;
    wire [15:0] _3674;
    wire _3652;
    wire [14:0] _1384;
    wire [15:0] _1385;
    reg [15:0] _1388;
    wire [16:0] _3648;
    wire _3649;
    wire [16:0] _3642;
    reg [16:0] _3645;
    wire [15:0] _252;
    wire [16:0] _3636;
    wire [16:0] _3638;
    reg [16:0] _3641;
    wire [7:0] _254;
    wire [8:0] _3656;
    wire [7:0] _3658;
    wire [7:0] _3659;
    wire [7:0] _3660;
    wire [7:0] _3662;
    wire [7:0] _255;
    reg [7:0] _3630;
    wire [8:0] _3655;
    wire [8:0] _3657;
    wire _3663;
    wire _3664;
    wire _3665;
    wire _3667;
    wire _256;
    reg _3635;
    wire [16:0] _3646;
    wire [16:0] _3632;
    wire _3647;
    wire _3650;
    wire _3653;
    wire _3631;
    wire _3654;
    wire [15:0] _3676;
    wire _3626;
    wire _3624;
    wire _642;
    wire _3623;
    wire _3625;
    wire _3627;
    wire [15:0] _3677;
    wire [15:0] _3679;
    wire [15:0] _257;
    reg [15:0] _1353;
    wire _1360;
    wire _1361;
    wire _1350;
    wire _1362;
    wire _1379;
    wire _1381;
    wire _1390;
    wire [1:0] _259;
    wire _1346;
    wire _1347;
    wire _1344;
    wire _1348;
    wire _1341;
    wire _1337;
    wire _1336;
    wire _1335;
    wire _1334;
    wire _1333;
    wire _1332;
    wire _1331;
    wire _1330;
    reg _1338;
    wire _1328;
    wire _1327;
    wire _1326;
    wire _1325;
    wire _1324;
    wire _1323;
    wire _1322;
    wire _1321;
    wire [2:0] _261;
    reg _1329;
    wire _1339;
    wire _1340;
    wire _1342;
    wire _1349;
    wire _1393;
    wire _263;
    wire _1417;
    wire _265;
    wire _1320;
    wire _1418;
    wire [1:0] _3743;
    wire _1646;
    wire [1:0] _3745;
    wire _3485;
    wire [1:0] _3752;
    wire _1317;
    wire [1:0] _3758;
    wire [2:0] _2594;
    wire [2:0] _2593;
    wire [2:0] _2592;
    wire [2:0] _2591;
    reg [2:0] _2595;
    wire _2587;
    wire _2586;
    wire _2585;
    wire _2584;
    reg _2588;
    wire _3680;
    wire _3681;
    wire [2:0] _3683;
    wire [2:0] _266;
    wire _1314;
    wire _1315;
    wire [1:0] _3760;
    wire [1:0] _267;
    reg [1:0] g_mode_0;
    wire _1319;
    wire _1649;
    wire _1657;
    wire _1880;
    wire _1882;
    wire _1891;
    wire _1872;
    wire _1870;
    wire _1873;
    wire _3761;
    wire _3762;
    wire _268;
    wire _3458;
    wire _2540;
    wire _3052;
    wire _270;
    wire _3053;
    wire _3763;
    wire [3:0] _3769;
    reg [3:0] _3772;
    wire [3:0] _271;
    wire _628;
    wire [7:0] _3774;
    wire [1:0] _1867;
    wire [1:0] _1865;
    wire [1:0] _1864;
    wire [1:0] _1863;
    wire [1:0] _1862;
    reg [1:0] _1866;
    wire [1:0] _1868;
    reg [7:0] _3786;
    wire [7:0] _3787;
    wire [7:0] _272;
    reg [7:0] _621;
    wire _622;
    wire [7:0] _3798;
    wire [7:0] _3797;
    wire [7:0] _3796;
    wire [1:0] _3793;
    wire [111:0] _741;
    wire [1:0] _3791;
    wire [111:0] _735;
    wire [1:0] _3790;
    wire [1:0] _3789;
    wire [1:0] _3788;
    reg [1:0] _3792;
    wire [1:0] _3794;
    reg [7:0] _3799;
    wire [7:0] _3800;
    wire [7:0] _273;
    reg [7:0] _616;
    wire _618;
    wire [3:0] _846;
    reg _847;
    wire _849;
    wire [15:0] _841;
    wire _843;
    wire [15:0] _832;
    wire [16:0] _833;
    wire [16:0] _834;
    reg [16:0] _837;
    wire _838;
    wire _839;
    wire [15:0] _828;
    wire _830;
    wire [2:0] _576;
    wire [2:0] _3815;
    wire _3811;
    wire _3812;
    wire _3809;
    wire _3813;
    wire [2:0] _3816;
    wire _3806;
    wire _3807;
    wire _3805;
    wire _3808;
    wire [2:0] _3818;
    wire _3802;
    wire [2:0] _3804;
    wire _3801;
    wire [2:0] _3819;
    wire [2:0] _274;
    reg [2:0] _572;
    wire _574;
    wire [2:0] _577;
    wire _567;
    wire _568;
    wire _566;
    wire _569;
    wire [2:0] _579;
    wire _563;
    wire _564;
    wire [2:0] _580;
    wire _812;
    wire [2:0] _814;
    wire [2:0] _555;
    wire [2:0] _3834;
    wire _3830;
    wire _3831;
    wire _3828;
    wire _3832;
    wire [2:0] _3835;
    wire _3825;
    wire _3826;
    wire _3824;
    wire _3827;
    wire [2:0] _3837;
    wire _3821;
    wire [2:0] _3823;
    wire _3820;
    wire [2:0] _3838;
    wire [2:0] _275;
    reg [2:0] _551;
    wire _553;
    wire [2:0] _556;
    wire _546;
    wire _547;
    wire _545;
    wire _548;
    wire [2:0] _558;
    wire _542;
    wire _543;
    wire [2:0] _559;
    wire _809;
    wire [2:0] _811;
    wire _815;
    wire [2:0] _816;
    wire [2:0] _532;
    wire [2:0] _3853;
    wire _3849;
    wire _3850;
    wire _3847;
    wire _3851;
    wire [2:0] _3854;
    wire _3844;
    wire _3845;
    wire _3843;
    wire _3846;
    wire [2:0] _3856;
    wire _3840;
    wire [2:0] _3842;
    wire _3839;
    wire [2:0] _3857;
    wire [2:0] _276;
    reg [2:0] _528;
    wire _530;
    wire [2:0] _533;
    wire _523;
    wire _524;
    wire _522;
    wire _525;
    wire [2:0] _535;
    wire _519;
    wire _520;
    wire [2:0] _536;
    wire _804;
    wire [2:0] _806;
    wire [2:0] _511;
    wire [2:0] _3872;
    wire _3868;
    wire _3869;
    wire _3866;
    wire _3870;
    wire [2:0] _3873;
    wire _3863;
    wire _3864;
    wire _3862;
    wire _3865;
    wire [2:0] _3875;
    wire _3859;
    wire [2:0] _3861;
    wire _3858;
    wire [2:0] _3876;
    wire [2:0] _277;
    reg [2:0] _507;
    wire _509;
    wire [2:0] _512;
    wire _502;
    wire _503;
    wire _501;
    wire _504;
    wire [2:0] _514;
    wire _498;
    wire _499;
    wire [2:0] _515;
    wire _801;
    wire [2:0] _803;
    wire _807;
    wire [2:0] _808;
    wire _817;
    wire [2:0] _818;
    wire [2:0] _486;
    wire [2:0] _3891;
    wire _3887;
    wire _3888;
    wire _3885;
    wire _3889;
    wire [2:0] _3892;
    wire _3882;
    wire _3883;
    wire _3881;
    wire _3884;
    wire [2:0] _3894;
    wire _3878;
    wire [2:0] _3880;
    wire _3877;
    wire [2:0] _3895;
    wire [2:0] _278;
    reg [2:0] _482;
    wire _484;
    wire [2:0] _487;
    wire _477;
    wire _478;
    wire _476;
    wire _479;
    wire [2:0] _489;
    wire _473;
    wire _474;
    wire [2:0] _490;
    wire _794;
    wire [2:0] _796;
    wire [2:0] _465;
    wire [2:0] _3910;
    wire _3906;
    wire _3907;
    wire _3904;
    wire _3908;
    wire [2:0] _3911;
    wire _3901;
    wire _3902;
    wire _3900;
    wire _3903;
    wire [2:0] _3913;
    wire _3897;
    wire [2:0] _3899;
    wire _3896;
    wire [2:0] _3914;
    wire [2:0] _279;
    reg [2:0] _461;
    wire _463;
    wire [2:0] _466;
    wire _456;
    wire _457;
    wire _455;
    wire _458;
    wire [2:0] _468;
    wire _452;
    wire _453;
    wire [2:0] _469;
    wire _791;
    wire [2:0] _793;
    wire _797;
    wire [2:0] _798;
    wire [2:0] _442;
    wire [2:0] _3929;
    wire _3925;
    wire _3926;
    wire _3923;
    wire _3927;
    wire [2:0] _3930;
    wire _3920;
    wire _3921;
    wire _3919;
    wire _3922;
    wire [2:0] _3932;
    wire _3916;
    wire [2:0] _3918;
    wire _3915;
    wire [2:0] _3933;
    wire [2:0] _280;
    reg [2:0] _438;
    wire _440;
    wire [2:0] _443;
    wire _433;
    wire _434;
    wire _432;
    wire _435;
    wire [2:0] _445;
    wire _429;
    wire _430;
    wire [2:0] _446;
    wire _786;
    wire [2:0] _788;
    wire [2:0] _421;
    wire [2:0] _3948;
    wire _3944;
    wire _3945;
    wire _3942;
    wire _3946;
    wire [2:0] _3949;
    wire _3939;
    wire _3940;
    wire _3938;
    wire _3941;
    wire [2:0] _3951;
    wire _3935;
    wire [2:0] _3937;
    wire _3934;
    wire [2:0] _3952;
    wire [2:0] _281;
    reg [2:0] _417;
    wire _419;
    wire [2:0] _422;
    wire _412;
    wire _413;
    wire _411;
    wire _414;
    wire [2:0] _424;
    wire _408;
    wire _409;
    wire [2:0] _425;
    wire [7:0] _782;
    wire _783;
    wire [2:0] _785;
    wire _789;
    wire [2:0] _790;
    wire _799;
    wire [2:0] _800;
    wire _819;
    wire [2:0] _820;
    wire [16:0] _821;
    wire _3955;
    wire [127:0] _3956;
    wire _3953;
    wire [127:0] _3957;
    wire [127:0] _282;
    reg [127:0] _330;
    wire _397;
    wire _398;
    wire [127:0] _399;
    wire _3960;
    wire [127:0] _3961;
    wire _3958;
    wire [127:0] _3962;
    wire [127:0] _283;
    reg [127:0] _327;
    wire _393;
    wire _394;
    wire [127:0] _395;
    wire _3965;
    wire [127:0] _3966;
    wire _3963;
    wire [127:0] _3967;
    wire [127:0] _284;
    reg [127:0] _324;
    wire _389;
    wire _390;
    wire [127:0] _391;
    wire [127:0] _286;
    wire _385;
    wire _386;
    wire [127:0] _387;
    wire [511:0] _400;
    wire [111:0] _778;
    wire [15:0] _779;
    wire [16:0] _780;
    wire [16:0] _822;
    reg [16:0] _825;
    wire gnd;
    wire [16:0] _777;
    wire _826;
    wire _827;
    wire _831;
    wire _840;
    wire [15:0] _3995;
    wire _3991;
    wire _3992;
    wire _3993;
    wire [15:0] _3996;
    wire _3975;
    wire _3976;
    wire [15:0] _3998;
    wire [15:0] _4000;
    wire [15:0] _287;
    reg [15:0] _373;
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
    wire [8:0] _288;
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
    wire [15:0] _289;
    reg [15:0] _370;
    wire [1:0] _773;
    reg [15:0] _774;
    wire _776;
    wire _844;
    reg [7:0] _355;
    wire [7:0] f_chg_now;
    wire _4019;
    wire [7:0] _4021;
    wire _4018;
    wire [7:0] _4022;
    wire [7:0] _4024;
    wire [7:0] _290;
    reg [7:0] _352;
    wire [7:0] f_changed_all;
    wire [7:0] _767;
    wire _769;
    wire _770;
    wire [7:0] f_chgmask1;
    wire _766;
    wire _771;
    wire [7:0] _760;
    wire [7:0] _758;
    wire vdd;
    wire _292;
    wire _294;
    wire [7:0] _296;
    reg [7:0] _336;
    reg [7:0] _339;
    wire [7:0] _759;
    wire [7:0] _761;
    wire _763;
    wire [111:0] _729;
    wire f_valid1;
    wire _764;
    wire _772;
    wire _845;
    wire _850;
    wire _889;
    wire _890;
    wire _894;
    wire f_fire1;
    wire [1:0] _1038;
    wire [1:0] f_winner;
    reg [2:0] _3972;
    wire [2:0] _3974;
    wire _4025;
    wire _1794;
    wire f_in_fetch;
    wire _1795;
    wire _1796;
    wire _4026;
    wire [15:0] _4035;
    wire [15:0] _4037;
    wire [15:0] _297;
    reg [15:0] _367;
    wire [1:0] _2006;
    reg [15:0] _2007;
    wire [15:0] _2005;
    wire _2008;
    wire [63:0] _724;
    wire _2003;
    wire _2001;
    wire _2002;
    wire _2004;
    wire _2009;
    wire _2014;
    wire _2022;
    wire f_viol_now;
    wire [2:0] _4043;
    wire [2:0] _4046;
    wire _4039;
    wire [2:0] _4047;
    wire _4038;
    wire [2:0] _4050;
    wire [2:0] _4052;
    wire [2:0] _298;
    reg [2:0] _383;
    wire _4055;
    wire [127:0] _4056;
    wire _4053;
    wire [127:0] _4057;
    wire [127:0] _299;
    reg [127:0] _321;
    wire [511:0] _331;
    wire [111:0] _332;
    wire f_valid0;
    wire _346;
    wire _363;
    wire _612;
    wire _669;
    wire _713;
    wire f_in_eval;
    wire _714;
    wire _723;
    wire f_fire0;
    wire _1124;
    wire _1125;
    wire _1220;
    wire [1:0] _4076;
    wire _4061;
    wire [1:0] _4063;
    wire _4059;
    wire [1:0] _4077;
    wire _4058;
    wire [1:0] _4080;
    wire _301;
    wire [1:0] _4082;
    wire [1:0] _4084;
    wire [1:0] _302;
    reg [1:0] _316;
    wire _1278;
    wire _304;
    wire _2701;
    wire _2703;
    wire _4086;
    wire _4096;
    wire _305;
    reg f_sweeping;
    wire _4108;
    wire _306;
    reg f_image_valid;
    wire _308;
    wire _1960;
    wire [7:0] _4132;
    wire [7:0] _309;
    reg [7:0] f_pout;
    wire _2626;
    wire [23:0] _311;
    wire [2:0] _2622;
    reg _2633;
    wire [7:0] _2697;
    wire [7:0] _4134;
    assign _1271 = _77[11:0];
    assign _1268 = _1261 < _1258;
    assign _1269 = _1243 & _1268;
    assign _1270 = _1269 ? _1258 : _1261;
    assign _1272 = _1270 < _1271;
    assign _1273 = _1272 ? _1271 : _1270;
    assign _1274 = _1254 ? _1270 : _1273;
    assign _1260 = 12'b000000000000;
    assign _1117 = 12'b111111111111;
    assign _1114 = _1112[11:0];
    assign _1111 = 13'b0000000000000;
    assign _1108 = 10'b0000000000;
    assign _1109 = { _1108,
                     _1105 };
    assign _1110 = _1101 - _1109;
    assign _1104 = 3'b000;
    always @* begin
        case (f_winner)
        0:
            _1084 <= _683;
        1:
            _1084 <= _859;
        2:
            _1084 <= _997;
        default:
            _1084 <= _1083;
        endcase
    end
    assign _1 = _1084;
    always @(posedge _294) begin
        if (_292)
            _1105 <= _1104;
        else
            _1105 <= _1;
    end
    assign _1106 = { _1108,
                     _1105 };
    assign _1091 = 13'b1111111111111;
    assign _1090 = _1088[12:0];
    assign _1085 = 16'b0001111111111111;
    assign _1089 = _1085 < _1088;
    assign _1092 = _1089 ? _1091 : _1090;
    assign _2 = _1092;
    always @(posedge _294) begin
        if (_292)
            _1101 <= _1111;
        else
            _1101 <= _2;
    end
    assign _1107 = _1101 < _1106;
    assign _1112 = _1107 ? _1111 : _1110;
    assign _1098 = 13'b0111111111111;
    assign _1113 = _1098 < _1112;
    assign _1116 = _1113 ? _1117 : _1114;
    assign _1096 = 1'b0;
    assign _1093 = 16'b1111111111111111;
    assign _1094 = _1088 == _1093;
    assign _3 = _1094;
    always @(posedge _294) begin
        if (_292)
            _1097 <= _1096;
        else
            _1097 <= _3;
    end
    assign _1118 = _1097 ? _1117 : _1116;
    assign _4 = _1118;
    always @(posedge _294) begin
        if (_292)
            _1261 <= _1260;
        else
            _1261 <= _4;
    end
    assign _1121 = _1088[11:0];
    always @* begin
        case (f_winner)
        0:
            _1087 <= _364;
        1:
            _1087 <= _773;
        2:
            _1087 <= _911;
        default:
            _1087 <= _1086;
        endcase
    end
    always @* begin
        case (_1087)
        0:
            _1088 <= _367;
        1:
            _1088 <= _370;
        2:
            _1088 <= _373;
        default:
            _1088 <= _373;
        endcase
    end
    assign _1119 = 16'b0000111111111111;
    assign _1120 = _1119 < _1088;
    assign _1123 = _1120 ? _1117 : _1121;
    assign _5 = _1123;
    always @(posedge _294) begin
        if (_292)
            _1258 <= _1260;
        else
            _1258 <= _5;
    end
    assign _1262 = _1258 < _1261;
    assign _1263 = _1243 & _1262;
    assign _1264 = _1263 ? _1258 : _1261;
    assign _1255 = _77[23:12];
    assign _1265 = _1255 < _1264;
    assign _1266 = _1265 ? _1255 : _1264;
    assign _1253 = 8'b00000000;
    assign _1254 = _1238 == _1253;
    assign _1267 = _1254 ? _1264 : _1266;
    assign _1251 = 8'b11111111;
    assign _1250 = _1248[7:0];
    assign _1245 = 2'b10;
    assign _1244 = 2'b01;
    assign _1233 = _1229 == _1232;
    assign _1225 = _1221 & _1224;
    assign _1234 = _1225 & _1233;
    assign _6 = _1234;
    always @(posedge _294) begin
        if (_292)
            _1243 <= _1096;
        else
            _1243 <= _6;
    end
    assign _1246 = _1243 ? _1245 : _1244;
    assign _1240 = 7'b0000000;
    assign _1247 = { _1240,
                     _1246 };
    assign _1238 = _77[31:24];
    assign _1239 = { gnd,
                     _1238 };
    assign _1248 = _1239 + _1247;
    assign _1249 = _1248[8:8];
    assign _1252 = _1249 ? _1251 : _1250;
    assign _1275 = { _1252,
                     _1267,
                     _1274 };
    assign _8 = host_cov_wdata;
    assign _1276 = _1237 ? _1275 : _8;
    assign _1289 = _1237 | f_host_cov_we;
    assign _1287 = ~ f_sweeping;
    assign _1282 = ~ _1224;
    assign _1280 = ~ _1237;
    assign _1279 = _48 & _1278;
    assign _1281 = _1279 & _1280;
    assign _1283 = _1281 & _1282;
    assign f_host_cov_we = _1283 & _1287;
    assign _1291 = ~ f_host_cov_we;
    assign _1290 = ~ _1237;
    assign _1292 = _1290 & _1291;
    assign _12 = _1232;
    always @(posedge _294) begin
        if (_292)
            _1296 <= _1253;
        else
            _1296 <= _12;
    end
    assign _14 = host_cov_addr;
    assign _1293 = _1224 ? _1232 : _14;
    assign _1297 = _1237 ? _1296 : _1293;
    assign _17 = host_rec_wdata;
    assign _1304 = _1303 | f_sweeping;
    assign _1310 = _383[1:0];
    assign _1311 = { _1228,
                     _1310 };
    assign _1308 = f_sw_cnt[11:4];
    assign _22 = host_rec_waddr;
    assign _1309 = f_sweeping ? _1308 : _22;
    assign _1301 = 3'b100;
    assign _1302 = _383 < _1301;
    assign _1303 = f_in_fetch & _1302;
    assign _1312 = _1303 ? _1311 : _1309;
    assign _1464 = 3'b001;
    assign _1465 = _1463 ? _1464 : _1440;
    assign _1437 = 3'b010;
    assign _1439 = f_lane0_out ? _1301 : _1437;
    assign _1440 = _1433 ? _1439 : _1436;
    assign _1466 = _1418 ? _1465 : _1440;
    assign _1468 = _1317 ? _1104 : _1466;
    assign _1470 = _1315 ? _1104 : _1468;
    assign _24 = _1470;
    always @(posedge _294) begin
        if (_292)
            _1436 <= _1104;
        else
            _1436 <= _24;
    end
    assign _1630 = { _642,
                     _645,
                     _648,
                     _651,
                     gnd,
                     _1436 };
    assign _1623 = _1621 ? _1464 : _1598;
    assign _1597 = f_lane1_out ? _1301 : _1437;
    assign _1598 = _1591 ? _1597 : _1594;
    assign _1624 = _1576 ? _1623 : _1598;
    assign _1626 = _1475 ? _1104 : _1624;
    assign _1628 = _1473 ? _1104 : _1626;
    assign _25 = _1628;
    always @(posedge _294) begin
        if (_292)
            _1594 <= _1104;
        else
            _1594 <= _25;
    end
    assign _1629 = { _656,
                     _659,
                     _662,
                     _665,
                     gnd,
                     _1594 };
    assign _1631 = { _1629,
                     _1630 };
    assign _1701 = 8'b00000001;
    assign _1702 = _1696 + _1701;
    assign _1698 = _1696 == _1251;
    assign _1699 = ~ _1698;
    assign _1691 = ~ _1644;
    assign _1688 = _1673 == _1104;
    assign _1689 = ~ _1688;
    assign _1685 = _1319 | _642;
    assign _1682 = ~ _1646;
    assign _1683 = _1315 & _1682;
    assign _1684 = _1683 & _265;
    assign _1686 = _1684 & _1685;
    assign _1690 = _1686 & _1689;
    assign _1692 = _1690 & _1691;
    assign _1681 = _1680 & _630;
    assign _1693 = _1681 | _1692;
    assign _1700 = _1693 & _1699;
    assign _1703 = _1700 ? _1702 : _1696;
    assign _1705 = _32 ? _1253 : _1703;
    assign _27 = _1705;
    always @(posedge _294) begin
        if (_292)
            _1696 <= _1253;
        else
            _1696 <= _27;
    end
    assign _1786 = _1780 + _1701;
    assign _1782 = _1780 == _1251;
    assign _1783 = ~ _1782;
    assign _1775 = ~ _1721;
    assign _1772 = _1750 == _1104;
    assign _1773 = ~ _1772;
    assign _1769 = _1477 | _656;
    assign _1766 = ~ _1723;
    assign _1767 = _1473 & _1766;
    assign _1768 = _1767 & _213;
    assign _1770 = _1768 & _1769;
    assign _1774 = _1770 & _1773;
    assign _1776 = _1774 & _1775;
    assign _1764 = _1761 & _630;
    assign _1765 = _1763 | _1764;
    assign _1777 = _1765 | _1776;
    assign _1784 = _1777 & _1783;
    assign _1787 = _1784 ? _1786 : _1780;
    assign _1789 = _32 ? _1253 : _1787;
    assign _28 = _1789;
    always @(posedge _294) begin
        if (_292)
            _1780 <= _1253;
        else
            _1780 <= _28;
    end
    assign _1826 = _1820 + _1701;
    assign _1822 = _1820 == _1251;
    assign _1823 = ~ _1822;
    assign _1816 = _1813 & _630;
    assign _1817 = _1815 | _1816;
    assign _1824 = _1817 & _1823;
    assign _1827 = _1824 ? _1826 : _1820;
    assign _1829 = _32 ? _1253 : _1827;
    assign _29 = _1829;
    always @(posedge _294) begin
        if (_292)
            _1820 <= _1253;
        else
            _1820 <= _29;
    end
    assign _1841 = _1835 + _1701;
    assign _1837 = _1835 == _1251;
    assign _1838 = ~ _1837;
    assign _1839 = _1832 & _1838;
    assign _1842 = _1839 ? _1841 : _1835;
    assign _1844 = _32 ? _1253 : _1842;
    assign _30 = _1844;
    always @(posedge _294) begin
        if (_292)
            _1835 <= _1253;
        else
            _1835 <= _30;
    end
    assign _1857 = _1851 + _1701;
    assign _1853 = _1851 == _1251;
    assign _1854 = ~ _1853;
    assign _1855 = _1848 & _1854;
    assign _1858 = _1855 ? _1857 : _1851;
    assign _32 = host_drop_clear;
    assign _1860 = _32 ? _1253 : _1858;
    assign _33 = _1860;
    always @(posedge _294) begin
        if (_292)
            _1851 <= _1253;
        else
            _1851 <= _33;
    end
    assign _1861 = { _1851,
                     _1835,
                     _1820,
                     _1780,
                     _1696 };
    assign _1896 = 1'b1;
    assign _1874 = _1796 & _1873;
    assign _1892 = _1874 & _1891;
    assign _1897 = _1892 ? _1896 : _1895;
    assign _1899 = _50 ? _1096 : _1897;
    assign _35 = _1899;
    always @(posedge _294) begin
        if (_292)
            _1895 <= _1096;
        else
            _1895 <= _35;
    end
    assign _1905 = { _1903,
                     _1904 };
    assign _1951 = _1947 ? _1939 : _1950;
    assign _1953 = _50 ? _1104 : _1951;
    assign _40 = _1953;
    always @(posedge _294) begin
        if (_292)
            _1950 <= _1104;
        else
            _1950 <= _40;
    end
    assign _1946 = ~ _1945;
    assign _1936 = _1907 ? _1464 : _1437;
    assign _1932 = 3'b011;
    assign _1933 = _1920 ? _1932 : _1301;
    assign _1937 = _1915 ? _1936 : _1933;
    assign _1930 = 3'b101;
    assign _1938 = _1924 ? _1937 : _1930;
    assign _1925 = _127 | _48;
    assign _1926 = _1925 | _46;
    assign _1927 = f_sweeping & _1926;
    assign _1921 = ~ f_image_valid;
    assign _1922 = _308 & _1921;
    assign _1903 = _1502 | _1477;
    assign _1918 = _43[1:1];
    assign _1919 = _1918 & _1903;
    assign _1904 = _1344 | _1319;
    assign _43 = host_lane_we;
    assign _1916 = _43[0:0];
    assign _1917 = _1916 & _1904;
    assign _1920 = _1917 | _1919;
    assign _1923 = _1920 | _1922;
    assign _44 = _1224;
    always @(posedge _294) begin
        if (_292)
            _1237 <= _1096;
        else
            _1237 <= _44;
    end
    assign _1912 = _1224 | _1237;
    assign _1911 = _48 & _1278;
    assign _1913 = _1911 & _1912;
    assign _1909 = ~ _1278;
    assign _46 = host_cov_re;
    assign _48 = host_cov_we;
    assign _1908 = _48 | _46;
    assign _1910 = _1908 & _1909;
    assign _1914 = _1910 | _1913;
    assign _1906 = ~ _1278;
    assign _1907 = _127 & _1906;
    assign _1915 = _1907 | _1914;
    assign _1924 = _1915 | _1923;
    assign _1928 = _1924 | _1927;
    assign _1939 = _1928 ? _1938 : _1104;
    assign _1941 = _1939 == _1104;
    assign _1942 = ~ _1941;
    assign _1947 = _1942 & _1946;
    assign _1955 = _1947 ? _1896 : _1945;
    assign _50 = host_err_clear;
    assign _1957 = _50 ? _1096 : _1955;
    assign _51 = _1957;
    always @(posedge _294) begin
        if (_292)
            _1945 <= _1096;
        else
            _1945 <= _51;
    end
    assign _53 = _1229;
    always @(posedge _294) begin
        if (_292)
            _1232 <= _1253;
        else
            _1232 <= _53;
    end
    assign _1229 = { _1228,
                     f_winner };
    assign _1846 = _1229 == _1232;
    assign _1847 = ~ _1846;
    assign _1958 = ~ _1224;
    assign _1959 = _1221 & _1958;
    assign _54 = _1959;
    always @(posedge _294) begin
        if (_292)
            _1224 <= _1096;
        else
            _1224 <= _54;
    end
    assign _56 = host_cover_en;
    assign _1221 = _1220 & _56;
    assign _1845 = _1221 & _1224;
    assign _1848 = _1845 & _1847;
    assign _1965 = _1848 ? _1896 : _1963;
    assign _1967 = _1960 ? _1096 : _1965;
    assign _57 = _1967;
    always @(posedge _294) begin
        if (_292)
            _1963 <= _1096;
        else
            _1963 <= _57;
    end
    assign _1832 = _91 & _1831;
    assign _1972 = _1832 ? _1896 : _1970;
    assign _1974 = _1960 ? _1096 : _1972;
    assign _59 = _1974;
    always @(posedge _294) begin
        if (_292)
            _1970 <= _1096;
        else
            _1970 <= _59;
    end
    assign _1814 = ~ _1813;
    assign _1807 = _1792 & _1806;
    assign _1815 = _1807 & _1814;
    assign _1762 = ~ _1761;
    assign _1758 = _1708 & _1757;
    assign _1763 = _1758 & _1762;
    assign _1975 = _1763 | _1815;
    assign _61 = _1975;
    assign _1976 = _164 & _630;
    assign _1977 = _1976 | _61;
    assign _1982 = _1977 ? _1896 : _1980;
    assign _1984 = _1960 ? _1096 : _1982;
    assign _62 = _1984;
    always @(posedge _294) begin
        if (_292)
            _1980 <= _1096;
        else
            _1980 <= _62;
    end
    assign _1988 = _724[61:61];
    assign _1989 = _1795 & _1988;
    assign _1994 = _1989 ? _1896 : _1992;
    assign _66 = host_irq_ack;
    assign _1996 = _66 ? _1096 : _1994;
    assign _1998 = _1960 ? _1096 : _1996;
    assign _67 = _1998;
    always @(posedge _294) begin
        if (_292)
            _1992 <= _1096;
        else
            _1992 <= _67;
    end
    assign _2027 = f_policy == _2026;
    assign _2029 = _2027 ? _1896 : _1987;
    assign _2025 = f_policy == _2544;
    assign _2031 = _2025 ? _1896 : _2029;
    assign _2032 = f_viol_now ? _2031 : _1987;
    assign _2033 = _1220 ? _1987 : _2032;
    assign _2000 = _316 == _1245;
    assign _2034 = _2000 ? _2033 : _1987;
    assign _2036 = _1960 ? _1096 : _2034;
    assign _68 = _2036;
    always @(posedge _294) begin
        if (_292)
            _1987 <= _1096;
        else
            _1987 <= _68;
    end
    assign _2051 = ~ _2050;
    assign _70 = host_tx_wm;
    assign _2044 = { gnd,
                     _70 };
    assign _2045 = _2044 < _271;
    assign _2046 = ~ _2045;
    assign _72 = host_tx_wm_en;
    assign _2047 = _72 & _2046;
    assign _74 = host_rx_wm;
    assign _2038 = _74 == _1104;
    assign _2040 = _2038 ? _1464 : _74;
    assign _2041 = { gnd,
                     _2040 };
    assign _2042 = _165 < _2041;
    assign _2043 = ~ _2042;
    assign _2048 = _2043 | _2047;
    assign _2052 = _2048 | _2051;
    assign _2053 = _2052 | _1987;
    assign _2054 = _2053 | _1992;
    assign _77 = ram_cov_rdata;
    assign _2057 = 32'b00000000000000000000000000000000;
    assign _2055 = ~ f_sweeping;
    assign _2056 = _1278 & _2055;
    assign _2058 = _2056 ? _77 : _2057;
    assign _2425 = 3'b111;
    assign _2426 = _2063 == _2425;
    assign _2427 = _2060 & _2426;
    assign _2424 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _294) begin
        if (_292)
            _2428 <= _2424;
        else
            if (_2427)
                _2428 <= _90;
    end
    assign _2419 = 3'b110;
    assign _2420 = _2063 == _2419;
    assign _2421 = _2060 & _2420;
    always @(posedge _294) begin
        if (_292)
            _2422 <= _2424;
        else
            if (_2421)
                _2422 <= _90;
    end
    assign _2414 = _2063 == _1930;
    assign _2415 = _2060 & _2414;
    always @(posedge _294) begin
        if (_292)
            _2416 <= _2424;
        else
            if (_2415)
                _2416 <= _90;
    end
    assign _2408 = _2063 == _1301;
    assign _2409 = _2060 & _2408;
    always @(posedge _294) begin
        if (_292)
            _2410 <= _2424;
        else
            if (_2409)
                _2410 <= _90;
    end
    assign _2402 = _2063 == _1932;
    assign _2403 = _2060 & _2402;
    always @(posedge _294) begin
        if (_292)
            _2404 <= _2424;
        else
            if (_2403)
                _2404 <= _90;
    end
    assign _2396 = _2063 == _1437;
    assign _2397 = _2060 & _2396;
    always @(posedge _294) begin
        if (_292)
            _2398 <= _2424;
        else
            if (_2397)
                _2398 <= _90;
    end
    assign _2390 = _2063 == _1464;
    assign _2391 = _2060 & _2390;
    always @(posedge _294) begin
        if (_292)
            _2392 <= _2424;
        else
            if (_2391)
                _2392 <= _90;
    end
    assign _2065 = _2063 + _1464;
    assign _2066 = _2060 ? _2065 : _2063;
    assign _80 = _2066;
    always @(posedge _294) begin
        if (_292)
            _2063 <= _1104;
        else
            _2063 <= _80;
    end
    assign _2384 = _2063 == _1104;
    assign _2385 = _2060 & _2384;
    assign _2357 = _2248 - _2353;
    assign _2074 = 29'b11111111111111111111111111111;
    assign _2073 = 29'b00000000000000000000000000000;
    assign _2076 = 29'b00000000000000000000000000001;
    assign _2077 = ts_hi_m1 + _2076;
    assign _2070 = ts_reg[2:0];
    assign _2072 = _2070 == _2425;
    assign _2078 = _2072 ? _2077 : ts_hi_m1;
    assign _81 = _2078;
    always @(posedge _294) begin
        if (_292)
            ts_hi_m1 <= _2074;
        else
            ts_hi_m1 <= _81;
    end
    assign _2355 = ts_reg[31:3];
    assign _2096 = _2083 + _1464;
    assign _2092 = _2083 == _2425;
    assign _2093 = ~ _2092;
    assign _2090 = _717[0:0];
    assign _2094 = _2090 & _2093;
    assign _2097 = _2094 ? _2096 : _2083;
    assign _2087 = _717[0:0];
    assign _2088 = ~ _2087;
    assign _2085 = _352[0:0];
    assign _2084 = f_chg_now[0:0];
    assign _2086 = _2084 & _2085;
    assign _2089 = _2086 & _2088;
    assign _2099 = _2089 ? _1464 : _2097;
    assign _2080 = _316 == _1244;
    assign _2100 = _2080 ? _2099 : _2083;
    assign _82 = _2100;
    always @(posedge _294) begin
        if (_292)
            _2083 <= _1104;
        else
            _2083 <= _82;
    end
    assign _2346 = _717[0:0];
    assign _2348 = _2346 ? _2083 : _1104;
    assign _2117 = _2104 + _1464;
    assign _2113 = _2104 == _2425;
    assign _2114 = ~ _2113;
    assign _2111 = _717[1:1];
    assign _2115 = _2111 & _2114;
    assign _2118 = _2115 ? _2117 : _2104;
    assign _2108 = _717[1:1];
    assign _2109 = ~ _2108;
    assign _2106 = _352[1:1];
    assign _2105 = f_chg_now[1:1];
    assign _2107 = _2105 & _2106;
    assign _2110 = _2107 & _2109;
    assign _2120 = _2110 ? _1464 : _2118;
    assign _2101 = _316 == _1244;
    assign _2121 = _2101 ? _2120 : _2104;
    assign _83 = _2121;
    always @(posedge _294) begin
        if (_292)
            _2104 <= _1104;
        else
            _2104 <= _83;
    end
    assign _2343 = _717[1:1];
    assign _2345 = _2343 ? _2104 : _1104;
    assign _2349 = _2305 ? _2348 : _2345;
    assign _2138 = _2125 + _1464;
    assign _2134 = _2125 == _2425;
    assign _2135 = ~ _2134;
    assign _2132 = _717[2:2];
    assign _2136 = _2132 & _2135;
    assign _2139 = _2136 ? _2138 : _2125;
    assign _2129 = _717[2:2];
    assign _2130 = ~ _2129;
    assign _2127 = _352[2:2];
    assign _2126 = f_chg_now[2:2];
    assign _2128 = _2126 & _2127;
    assign _2131 = _2128 & _2130;
    assign _2141 = _2131 ? _1464 : _2139;
    assign _2122 = _316 == _1244;
    assign _2142 = _2122 ? _2141 : _2125;
    assign _84 = _2142;
    always @(posedge _294) begin
        if (_292)
            _2125 <= _1104;
        else
            _2125 <= _84;
    end
    assign _2339 = _717[2:2];
    assign _2341 = _2339 ? _2125 : _1104;
    assign _2159 = _2146 + _1464;
    assign _2155 = _2146 == _2425;
    assign _2156 = ~ _2155;
    assign _2153 = _717[3:3];
    assign _2157 = _2153 & _2156;
    assign _2160 = _2157 ? _2159 : _2146;
    assign _2150 = _717[3:3];
    assign _2151 = ~ _2150;
    assign _2148 = _352[3:3];
    assign _2147 = f_chg_now[3:3];
    assign _2149 = _2147 & _2148;
    assign _2152 = _2149 & _2151;
    assign _2162 = _2152 ? _1464 : _2160;
    assign _2143 = _316 == _1244;
    assign _2163 = _2143 ? _2162 : _2146;
    assign _85 = _2163;
    always @(posedge _294) begin
        if (_292)
            _2146 <= _1104;
        else
            _2146 <= _85;
    end
    assign _2336 = _717[3:3];
    assign _2338 = _2336 ? _2146 : _1104;
    assign _2342 = _2308 ? _2341 : _2338;
    assign _2350 = _2307 ? _2349 : _2342;
    assign _2180 = _2167 + _1464;
    assign _2176 = _2167 == _2425;
    assign _2177 = ~ _2176;
    assign _2174 = _717[4:4];
    assign _2178 = _2174 & _2177;
    assign _2181 = _2178 ? _2180 : _2167;
    assign _2171 = _717[4:4];
    assign _2172 = ~ _2171;
    assign _2169 = _352[4:4];
    assign _2168 = f_chg_now[4:4];
    assign _2170 = _2168 & _2169;
    assign _2173 = _2170 & _2172;
    assign _2183 = _2173 ? _1464 : _2181;
    assign _2164 = _316 == _1244;
    assign _2184 = _2164 ? _2183 : _2167;
    assign _86 = _2184;
    always @(posedge _294) begin
        if (_292)
            _2167 <= _1104;
        else
            _2167 <= _86;
    end
    assign _2331 = _717[4:4];
    assign _2333 = _2331 ? _2167 : _1104;
    assign _2201 = _2188 + _1464;
    assign _2197 = _2188 == _2425;
    assign _2198 = ~ _2197;
    assign _2195 = _717[5:5];
    assign _2199 = _2195 & _2198;
    assign _2202 = _2199 ? _2201 : _2188;
    assign _2192 = _717[5:5];
    assign _2193 = ~ _2192;
    assign _2190 = _352[5:5];
    assign _2189 = f_chg_now[5:5];
    assign _2191 = _2189 & _2190;
    assign _2194 = _2191 & _2193;
    assign _2204 = _2194 ? _1464 : _2202;
    assign _2185 = _316 == _1244;
    assign _2205 = _2185 ? _2204 : _2188;
    assign _87 = _2205;
    always @(posedge _294) begin
        if (_292)
            _2188 <= _1104;
        else
            _2188 <= _87;
    end
    assign _2328 = _717[5:5];
    assign _2330 = _2328 ? _2188 : _1104;
    assign _2334 = _2312 ? _2333 : _2330;
    assign _2222 = _2209 + _1464;
    assign _2218 = _2209 == _2425;
    assign _2219 = ~ _2218;
    assign _2216 = _717[6:6];
    assign _2220 = _2216 & _2219;
    assign _2223 = _2220 ? _2222 : _2209;
    assign _2213 = _717[6:6];
    assign _2214 = ~ _2213;
    assign _2211 = _352[6:6];
    assign _2210 = f_chg_now[6:6];
    assign _2212 = _2210 & _2211;
    assign _2215 = _2212 & _2214;
    assign _2225 = _2215 ? _1464 : _2223;
    assign _2206 = _316 == _1244;
    assign _2226 = _2206 ? _2225 : _2209;
    assign _88 = _2226;
    always @(posedge _294) begin
        if (_292)
            _2209 <= _1104;
        else
            _2209 <= _88;
    end
    assign _2324 = _717[6:6];
    assign _2326 = _2324 ? _2209 : _1104;
    assign _2243 = _2230 + _1464;
    assign _2239 = _2230 == _2425;
    assign _2240 = ~ _2239;
    assign _2237 = _717[7:7];
    assign _2241 = _2237 & _2240;
    assign _2244 = _2241 ? _2243 : _2230;
    assign _2234 = _717[7:7];
    assign _2235 = ~ _2234;
    assign _2232 = _352[7:7];
    assign _2231 = f_chg_now[7:7];
    assign _2233 = _2231 & _2232;
    assign _2236 = _2233 & _2235;
    assign _2246 = _2236 ? _1464 : _2244;
    assign _2227 = _316 == _1244;
    assign _2247 = _2227 ? _2246 : _2230;
    assign _89 = _2247;
    always @(posedge _294) begin
        if (_292)
            _2230 <= _1104;
        else
            _2230 <= _89;
    end
    assign _2321 = _717[7:7];
    assign _2323 = _2321 ? _2230 : _1104;
    assign _2327 = _2315 ? _2326 : _2323;
    assign _2335 = _2314 ? _2334 : _2327;
    assign _2351 = _2311 ? _2350 : _2335;
    assign _2316 = _747[7:7];
    assign _2315 = _747[6:6];
    assign _2317 = _2315 | _2316;
    assign _2313 = _747[5:5];
    assign _2312 = _747[4:4];
    assign _2314 = _2312 | _2313;
    assign _2318 = _2314 | _2317;
    assign _2309 = _747[3:3];
    assign _2308 = _747[2:2];
    assign _2310 = _2308 | _2309;
    assign _2306 = _747[1:1];
    assign _2305 = _747[0:0];
    assign _2307 = _2305 | _2306;
    assign _2311 = _2307 | _2310;
    assign _2319 = _2311 | _2318;
    assign _2352 = _2319 ? _2351 : _1104;
    assign _2294 = f_watch[0:0];
    assign _2293 = _352[0:0];
    assign _2295 = _2293 & _2294;
    assign _2297 = _2295 ? _572 : _1104;
    assign _2289 = f_watch[1:1];
    assign _2288 = _352[1:1];
    assign _2290 = _2288 & _2289;
    assign _2292 = _2290 ? _551 : _1104;
    assign _2298 = _2292 < _2297;
    assign _2299 = _2298 ? _2297 : _2292;
    assign _2282 = f_watch[2:2];
    assign _2281 = _352[2:2];
    assign _2283 = _2281 & _2282;
    assign _2285 = _2283 ? _528 : _1104;
    assign _2277 = f_watch[3:3];
    assign _2276 = _352[3:3];
    assign _2278 = _2276 & _2277;
    assign _2280 = _2278 ? _507 : _1104;
    assign _2286 = _2280 < _2285;
    assign _2287 = _2286 ? _2285 : _2280;
    assign _2300 = _2287 < _2299;
    assign _2301 = _2300 ? _2299 : _2287;
    assign _2268 = f_watch[4:4];
    assign _2267 = _352[4:4];
    assign _2269 = _2267 & _2268;
    assign _2271 = _2269 ? _482 : _1104;
    assign _2263 = f_watch[5:5];
    assign _2262 = _352[5:5];
    assign _2264 = _2262 & _2263;
    assign _2266 = _2264 ? _461 : _1104;
    assign _2272 = _2266 < _2271;
    assign _2273 = _2272 ? _2271 : _2266;
    assign _2256 = f_watch[6:6];
    assign _2255 = _352[6:6];
    assign _2257 = _2255 & _2256;
    assign _2259 = _2257 ? _438 : _1104;
    assign _2251 = f_watch[7:7];
    assign _2250 = _352[7:7];
    assign _2252 = _2250 & _2251;
    assign _2254 = _2252 ? _417 : _1104;
    assign _2260 = _2254 < _2259;
    assign _2261 = _2260 ? _2259 : _2254;
    assign _2274 = _2261 < _2273;
    assign _2275 = _2274 ? _2273 : _2261;
    assign _2302 = _2275 < _2301;
    assign _2303 = _2302 ? _2301 : _2275;
    assign _2304 = f_unexp_now ? _2303 : _1104;
    assign _2353 = f_amb_now ? _2352 : _2304;
    assign _2248 = ts_reg[2:0];
    assign _2354 = _2248 < _2353;
    assign _2356 = _2354 ? ts_hi_m1 : _2355;
    assign _2358 = { _2356,
                     _2357 };
    assign _2362 = { _2358,
                     _1228,
                     _2361,
                     _339 };
    assign _90 = _2362;
    always @(posedge _294) begin
        if (_292)
            _2386 <= _2424;
        else
            if (_2385)
                _2386 <= _90;
    end
    assign _2379 = _2377 + _1464;
    assign _2049 = 4'b0000;
    assign _2368 = 4'b0001;
    assign _2369 = _92 + _2368;
    assign _2367 = _92 - _2368;
    assign _2370 = _2060 ? _2369 : _2367;
    assign _1830 = 4'b1000;
    assign _1831 = _92 == _1830;
    assign _2059 = ~ _1831;
    assign _91 = f_viol_now;
    assign _2060 = _91 & _2059;
    assign _2365 = _2060 ^ _2364;
    assign _2371 = _2365 ? _2370 : _92;
    always @(posedge _294) begin
        if (_292)
            _2374 <= _2049;
        else
            _2374 <= _2371;
    end
    assign _92 = _2374;
    assign _2050 = _92 == _2049;
    assign _2363 = ~ _2050;
    assign _94 = host_vlog_pop;
    assign _2364 = _94 & _2363;
    assign _2380 = _2364 ? _2379 : _2377;
    assign _95 = _2380;
    always @(posedge _294) begin
        if (_292)
            _2377 <= _1104;
        else
            _2377 <= _95;
    end
    always @* begin
        case (_2377)
        0:
            _2429 <= _2386;
        1:
            _2429 <= _2392;
        2:
            _2429 <= _2398;
        3:
            _2429 <= _2404;
        4:
            _2429 <= _2410;
        5:
            _2429 <= _2416;
        6:
            _2429 <= _2422;
        default:
            _2429 <= _2428;
        endcase
    end
    assign _2535 = _2436 == _2425;
    assign _2536 = _2433 & _2535;
    always @(posedge _294) begin
        if (_292)
            _2537 <= _1253;
        else
            if (_2536)
                _2537 <= _101;
    end
    assign _2529 = _2436 == _2419;
    assign _2530 = _2433 & _2529;
    always @(posedge _294) begin
        if (_292)
            _2531 <= _1253;
        else
            if (_2530)
                _2531 <= _101;
    end
    assign _2523 = _2436 == _1930;
    assign _2524 = _2433 & _2523;
    always @(posedge _294) begin
        if (_292)
            _2525 <= _1253;
        else
            if (_2524)
                _2525 <= _101;
    end
    assign _2517 = _2436 == _1301;
    assign _2518 = _2433 & _2517;
    always @(posedge _294) begin
        if (_292)
            _2519 <= _1253;
        else
            if (_2518)
                _2519 <= _101;
    end
    assign _2511 = _2436 == _1932;
    assign _2512 = _2433 & _2511;
    always @(posedge _294) begin
        if (_292)
            _2513 <= _1253;
        else
            if (_2512)
                _2513 <= _101;
    end
    assign _2505 = _2436 == _1437;
    assign _2506 = _2433 & _2505;
    always @(posedge _294) begin
        if (_292)
            _2507 <= _1253;
        else
            if (_2506)
                _2507 <= _101;
    end
    assign _2499 = _2436 == _1464;
    assign _2500 = _2433 & _2499;
    always @(posedge _294) begin
        if (_292)
            _2501 <= _1253;
        else
            if (_2500)
                _2501 <= _101;
    end
    assign _2438 = _2436 + _1464;
    assign _2439 = _2433 ? _2438 : _2436;
    assign _98 = _2439;
    always @(posedge _294) begin
        if (_292)
            _2436 <= _1104;
        else
            _2436 <= _98;
    end
    assign _2493 = _2436 == _1104;
    assign _2494 = _2433 & _2493;
    assign _2479 = _1638 ? _2478 : g_byte_0;
    assign _2480 = _1644 ? _2478 : _2479;
    assign _2457 = _2456 ? _2454 : _2444;
    assign _2455 = _2441 ? _2454 : _2444;
    assign _2458 = _1761 ? _2457 : _2455;
    assign _99 = _2458;
    always @(posedge _294) begin
        if (_292)
            _2444 <= _1253;
        else
            _2444 <= _99;
    end
    assign _2453 = _1715 ? _2452 : g_byte;
    assign _2454 = _1721 ? _2452 : _2453;
    assign _2469 = _1708 ? _2444 : _2454;
    assign _2466 = _2465 ? _625 : _2463;
    assign _2464 = _2460 ? _625 : _2463;
    assign _2467 = _1813 ? _2466 : _2464;
    assign _100 = _2467;
    always @(posedge _294) begin
        if (_292)
            _2463 <= _1253;
        else
            _2463 <= _100;
    end
    assign _2468 = _1792 ? _2463 : _625;
    assign _2470 = _1761 ? _2469 : _2468;
    assign _2481 = _1680 ? _2480 : _2470;
    assign _101 = _2481;
    always @(posedge _294) begin
        if (_292)
            _2495 <= _1253;
        else
            if (_2494)
                _2495 <= _101;
    end
    assign _2488 = _2486 + _1464;
    assign _2489 = _2483 ? _2488 : _2486;
    assign _102 = _2489;
    always @(posedge _294) begin
        if (_292)
            _2486 <= _1104;
        else
            _2486 <= _102;
    end
    always @* begin
        case (_2486)
        0:
            _2538 <= _2495;
        1:
            _2538 <= _2501;
        2:
            _2538 <= _2507;
        3:
            _2538 <= _2513;
        4:
            _2538 <= _2519;
        5:
            _2538 <= _2525;
        6:
            _2538 <= _2531;
        default:
            _2538 <= _2537;
        endcase
    end
    assign _2541 = 32'b00000000000000000000000000000001;
    assign _2542 = ts_reg + _2541;
    assign _106 = _2542;
    always @(posedge _294) begin
        if (_292)
            ts_reg <= _2057;
        else
            ts_reg <= _106;
    end
    assign _2544 = 2'b00;
    assign _2359 = { _2014,
                     f_unexp_now };
    assign _2361 = f_amb_now ? _2544 : _2359;
    always @(posedge _294) begin
        if (_292)
            _2545 <= _2544;
        else
            _2545 <= _2361;
    end
    always @(posedge _294) begin
        if (_292)
            _2548 <= _1096;
        else
            _2548 <= f_viol_now;
    end
    always @(posedge _294) begin
        if (_292)
            _2551 <= _2544;
        else
            _2551 <= f_winner;
    end
    always @(posedge _294) begin
        if (_292)
            _2554 <= _1096;
        else
            _2554 <= _1220;
    end
    assign _2555 = _724[60:60];
    assign _2556 = f_in_eval & _2555;
    assign _2557 = ~ _1278;
    assign _2698 = _119 & _2697;
    assign _2699 = ~ _2698;
    assign _2579 = _724[23:16];
    assign _2577 = _741[86:79];
    assign _2576 = _735[86:79];
    assign _2575 = _729[86:79];
    assign _2574 = _332[86:79];
    always @* begin
        case (f_winner)
        0:
            _2578 <= _2574;
        1:
            _2578 <= _2575;
        2:
            _2578 <= _2576;
        default:
            _2578 <= _2577;
        endcase
    end
    assign _2580 = _1795 ? _2579 : _2578;
    assign _2581 = _2580 & _2571;
    assign _2572 = ~ _2571;
    assign _2573 = f_poe & _2572;
    assign _2582 = _2573 | _2581;
    assign _2616 = _2582 | _2615;
    assign _2617 = _2561 ? _2616 : f_poe;
    assign _2619 = _301 ? _1253 : _2617;
    assign _2621 = _1960 ? _1253 : _2619;
    assign _116 = _2621;
    always @(posedge _294) begin
        if (_292)
            f_poe <= _1253;
        else
            f_poe <= _116;
    end
    assign _2700 = f_poe & _2699;
    assign _119 = host_open_drain;
    assign _4133 = ~ _119;
    assign _2695 = f_lane1_out & _2689;
    assign _2694 = ~ f_lane1_out;
    assign _2692 = ~ f_lane0_out;
    assign _2693 = _2692 & _2689;
    assign _2691 = f_lane0_out & _2689;
    assign _2690 = ~ f_lane0_out;
    assign _2689 = f_pout[0:0];
    assign _2688 = _311[2:0];
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
    assign _2680 = f_pout[1:1];
    assign _2679 = _311[5:3];
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
    assign _2671 = f_pout[2:2];
    assign _2670 = _311[8:6];
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
    assign _2662 = f_pout[3:3];
    assign _2661 = _311[11:9];
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
    assign _2653 = f_pout[4:4];
    assign _2652 = _311[14:12];
    always @* begin
        case (_2652)
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
    assign _2650 = f_lane1_out & _2644;
    assign _2649 = ~ f_lane1_out;
    assign _2647 = ~ f_lane0_out;
    assign _2648 = _2647 & _2644;
    assign _2646 = f_lane0_out & _2644;
    assign _2645 = ~ f_lane0_out;
    assign _2644 = f_pout[5:5];
    assign _2643 = _311[17:15];
    always @* begin
        case (_2643)
        0:
            _2651 <= _2644;
        1:
            _2651 <= f_lane0_out;
        2:
            _2651 <= _2645;
        3:
            _2651 <= _2646;
        4:
            _2651 <= _2648;
        5:
            _2651 <= f_lane1_out;
        6:
            _2651 <= _2649;
        default:
            _2651 <= _2650;
        endcase
    end
    assign _2641 = f_lane1_out & _2635;
    assign _2640 = ~ f_lane1_out;
    assign _2638 = ~ f_lane0_out;
    assign _2639 = _2638 & _2635;
    assign _2637 = f_lane0_out & _2635;
    assign _2636 = ~ f_lane0_out;
    assign _2635 = f_pout[6:6];
    assign _2634 = _311[20:18];
    always @* begin
        case (_2634)
        0:
            _2642 <= _2635;
        1:
            _2642 <= f_lane0_out;
        2:
            _2642 <= _2636;
        3:
            _2642 <= _2637;
        4:
            _2642 <= _2639;
        5:
            _2642 <= f_lane1_out;
        6:
            _2642 <= _2640;
        default:
            _2642 <= _2641;
        endcase
    end
    assign _2632 = f_lane1_out & _2626;
    assign _2631 = ~ f_lane1_out;
    assign _2629 = ~ f_lane0_out;
    assign _2630 = _2629 & _2626;
    assign _2628 = f_lane0_out & _2626;
    assign _2627 = ~ f_lane0_out;
    assign _4125 = { _4123,
                     _4122 };
    assign _4122 = _621[0:0];
    assign _4123 = { _4122,
                     _4122 };
    assign _4124 = { _4123,
                     _4123 };
    assign _4126 = { _4124,
                     _4125 };
    assign _4127 = { _4126,
                     _4122 };
    assign _4128 = _4127 & _2615;
    assign _2613 = _2609 & _2607;
    assign _2612 = _2609 & _2605;
    assign _2611 = _2609 & _2602;
    assign _2609 = ~ _2596;
    assign _2610 = _2609 & _2599;
    assign _2607 = _2604 & _2601;
    assign _2608 = _2596 & _2607;
    assign _2604 = ~ _2597;
    assign _2605 = _2604 & _2598;
    assign _2606 = _2596 & _2605;
    assign _2601 = ~ _2598;
    assign _2602 = _2597 & _2601;
    assign _2603 = _2596 & _2602;
    assign _2598 = _2595[0:0];
    assign _2597 = _2595[1:1];
    assign _2599 = _2597 & _2598;
    assign _2596 = _2595[2:2];
    assign _2600 = _2596 & _2599;
    assign _2614 = { _2600,
                     _2603,
                     _2606,
                     _2608,
                     _2610,
                     _2611,
                     _2612,
                     _2613 };
    assign _2583 = ~ _1795;
    assign _2589 = _2583 & _2588;
    assign _2615 = _2589 ? _2614 : _1253;
    assign _4120 = ~ _2615;
    assign _4116 = _724[15:8];
    assign _4114 = _741[78:71];
    assign _4113 = _735[78:71];
    assign _4112 = _729[78:71];
    assign _4111 = _332[78:71];
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
    assign _4117 = _1795 ? _4116 : _4115;
    assign _4118 = _4117 & _2571;
    assign _2570 = _724[7:0];
    assign _2568 = _741[70:63];
    assign _2567 = _735[70:63];
    assign _2566 = _729[70:63];
    assign _2565 = _332[70:63];
    always @* begin
        case (f_winner)
        0:
            _2569 <= _2565;
        1:
            _2569 <= _2566;
        2:
            _2569 <= _2567;
        default:
            _2569 <= _2568;
        endcase
    end
    assign _2571 = _1795 ? _2570 : _2569;
    assign _4109 = ~ _2571;
    assign _4110 = f_pout & _4109;
    assign _4119 = _4110 | _4118;
    assign _4121 = _4119 & _4120;
    assign _4129 = _4121 | _4128;
    assign _2559 = _672 == _2544;
    assign _2560 = _2559 | _674;
    assign _2561 = _1796 & _2560;
    assign _4130 = _2561 ? _4129 : f_pout;
    assign _121 = host_crc_expect;
    assign _4102 = 32'b11111111111111111111111111111111;
    assign _2812 = 32'b11101101101110001000001100100000;
    assign _2810 = _2804[31:1];
    assign _2811 = { _1096,
                     _2810 };
    assign _2813 = _2811 ^ _2812;
    assign _2807 = _2804[31:1];
    assign _2808 = { _1096,
                     _2807 };
    assign _2800 = _2794[31:1];
    assign _2801 = { _1096,
                     _2800 };
    assign _2803 = _2801 ^ _2812;
    assign _2797 = _2794[31:1];
    assign _2798 = { _1096,
                     _2797 };
    assign _2790 = _2784[31:1];
    assign _2791 = { _1096,
                     _2790 };
    assign _2793 = _2791 ^ _2812;
    assign _2787 = _2784[31:1];
    assign _2788 = { _1096,
                     _2787 };
    assign _2780 = _2774[31:1];
    assign _2781 = { _1096,
                     _2780 };
    assign _2783 = _2781 ^ _2812;
    assign _2777 = _2774[31:1];
    assign _2778 = { _1096,
                     _2777 };
    assign _2770 = _2764[31:1];
    assign _2771 = { _1096,
                     _2770 };
    assign _2773 = _2771 ^ _2812;
    assign _2767 = _2764[31:1];
    assign _2768 = { _1096,
                     _2767 };
    assign _2760 = _2754[31:1];
    assign _2761 = { _1096,
                     _2760 };
    assign _2763 = _2761 ^ _2812;
    assign _2757 = _2754[31:1];
    assign _2758 = { _1096,
                     _2757 };
    assign _2750 = _2744[31:1];
    assign _2751 = { _1096,
                     _2750 };
    assign _2753 = _2751 ^ _2812;
    assign _2747 = _2744[31:1];
    assign _2748 = { _1096,
                     _2747 };
    assign _2740 = _2734[31:1];
    assign _2741 = { _1096,
                     _2740 };
    assign _2743 = _2741 ^ _2812;
    assign _2737 = _2734[31:1];
    assign _2738 = { _1096,
                     _2737 };
    assign _2731 = _286[127:120];
    assign _2730 = _286[119:112];
    assign _2729 = _286[111:104];
    assign _2728 = _286[103:96];
    assign _2727 = _286[95:88];
    assign _2726 = _286[87:80];
    assign _2725 = _286[79:72];
    assign _2724 = _286[71:64];
    assign _2723 = _286[63:56];
    assign _2722 = _286[55:48];
    assign _2721 = _286[47:40];
    assign _2720 = _286[39:32];
    assign _2719 = _286[31:24];
    assign _2718 = _286[23:16];
    assign _2717 = _286[15:8];
    assign _2716 = _286[7:0];
    assign _2713 = 13'b0000000000001;
    assign _2714 = f_sw_cnt - _2713;
    assign _2715 = _2714[3:0];
    always @* begin
        case (_2715)
        0:
            _2732 <= _2716;
        1:
            _2732 <= _2717;
        2:
            _2732 <= _2718;
        3:
            _2732 <= _2719;
        4:
            _2732 <= _2720;
        5:
            _2732 <= _2721;
        6:
            _2732 <= _2722;
        7:
            _2732 <= _2723;
        8:
            _2732 <= _2724;
        9:
            _2732 <= _2725;
        10:
            _2732 <= _2726;
        11:
            _2732 <= _2727;
        12:
            _2732 <= _2728;
        13:
            _2732 <= _2729;
        14:
            _2732 <= _2730;
        default:
            _2732 <= _2731;
        endcase
    end
    assign _2712 = 24'b000000000000000000000000;
    assign _2733 = { _2712,
                     _2732 };
    assign _2710 = f_sw_cnt == _1111;
    assign _2711 = ~ _2710;
    assign _2815 = _2711 ? _2814 : _2708;
    assign _2708 = _2703 ? _4102 : _2706;
    assign _2816 = f_sweeping ? _2815 : _2708;
    assign _122 = _2816;
    always @(posedge _294) begin
        if (_292)
            _2706 <= _4102;
        else
            _2706 <= _122;
    end
    assign _2734 = _2706 ^ _2733;
    assign _2735 = _2734[0:0];
    assign _2744 = _2735 ? _2743 : _2738;
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
    assign _4103 = _2814 ^ _4102;
    assign f_sw_match = _4103 == _121;
    assign _4105 = f_sw_last ? f_sw_match : _4101;
    assign _4107 = _4089 ? _1096 : _4105;
    assign _1299 = ~ f_sweeping;
    assign _1298 = _127 & _1278;
    assign f_store_we = _1298 & _1299;
    assign _4097 = f_store_we | _125;
    assign _4099 = _4097 ? _1096 : f_image_valid;
    assign _4101 = _2703 ? _1096 : _4099;
    assign _4090 = 13'b1000000000000;
    assign _2820 = f_sw_cnt + _2713;
    assign _2818 = _2703 ? _1111 : f_sw_cnt;
    assign _2821 = f_sweeping ? _2820 : _2818;
    assign _123 = _2821;
    always @(posedge _294) begin
        if (_292)
            f_sw_cnt <= _1111;
        else
            f_sw_cnt <= _123;
    end
    assign f_sw_last = f_sw_cnt == _4090;
    assign _4093 = f_sw_last ? _1096 : _4086;
    assign _125 = host_crc_expect_we;
    assign _127 = host_rec_we;
    assign _4087 = _308 | _127;
    assign _4088 = _4087 | _125;
    assign _4089 = f_sweeping & _4088;
    assign _4095 = _4089 ? _1096 : _4093;
    assign _2702 = ~ f_sweeping;
    assign _4079 = _1795 ? _1245 : _316;
    assign _4075 = _2837 ? _1244 : _316;
    assign _2026 = 2'b11;
    assign _4066 = f_policy == _2026;
    assign _4068 = _4066 ? _2544 : _316;
    assign _4065 = f_policy == _1245;
    assign _4070 = _4065 ? _1244 : _4068;
    assign _4064 = f_policy == _2544;
    assign _4072 = _4064 ? _2544 : _4070;
    assign _4073 = f_viol_now ? _4072 : _316;
    assign _1215 = f_chgmask3 & f_multi_eff;
    assign _1217 = _1215 == _1253;
    assign _1208 = _1168 == _1093;
    assign _1203 = 16'b0000000000000000;
    assign _1204 = _1168 == _1203;
    assign _1205 = _1204 & _1185;
    assign _1202 = _1144 == _1164;
    assign _1206 = _1202 | _1205;
    assign _1209 = _1143 ? _1208 : _1206;
    assign _1199 = _633[3:0];
    assign _1201 = _1199 == _2049;
    assign _1210 = _1201 | _1209;
    assign _1197 = _1168 == _1093;
    assign _1193 = _1168 == _1203;
    assign _1194 = _1193 & _1185;
    assign _1191 = _1144 == _1164;
    assign _1195 = _1191 | _1194;
    assign _1198 = _1143 ? _1197 : _1195;
    assign _1189 = _1155 == _1093;
    always @(posedge _294) begin
        if (_292)
            _1083 <= _1104;
        else
            _1083 <= _1080;
    end
    assign _1184 = { _1111,
                     _1083 };
    assign _1185 = _1141 < _1184;
    assign _1182 = _1155 == _1203;
    assign _1186 = _1182 & _1185;
    assign _1180 = _1144 == _1152;
    assign _1187 = _1180 | _1186;
    assign _1190 = _1143 ? _1189 : _1187;
    assign _1179 = _741[104:103];
    always @* begin
        case (_1179)
        0:
            _1211 <= vdd;
        1:
            _1211 <= _1190;
        2:
            _1211 <= _1198;
        default:
            _1211 <= _1210;
        endcase
    end
    assign _1178 = ~ _674;
    assign _1212 = _1178 | _1211;
    assign _1175 = _741[62:62];
    assign _1173 = _741[61:58];
    always @* begin
        case (_1173)
        0:
            _1174 <= vdd;
        1:
            _1174 <= _618;
        2:
            _1174 <= _622;
        3:
            _1174 <= _626;
        4:
            _1174 <= _628;
        5:
            _1174 <= _630;
        6:
            _1174 <= _634;
        7:
            _1174 <= _637;
        8:
            _1174 <= _642;
        9:
            _1174 <= _645;
        10:
            _1174 <= _648;
        11:
            _1174 <= _651;
        12:
            _1174 <= _656;
        13:
            _1174 <= _659;
        14:
            _1174 <= _662;
        default:
            _1174 <= _665;
        endcase
    end
    assign _1176 = _1174 ^ _1175;
    assign _1168 = _741[57:42];
    assign _1170 = _1168 == _1093;
    assign _1163 = 17'b00000000000000000;
    assign _1159 = _1041[57:42];
    assign _1160 = { gnd,
                     _1159 };
    assign _1161 = _1160 + _1148;
    always @(posedge _294) begin
        if (_292)
            _1164 <= _1163;
        else
            _1164 <= _1161;
    end
    assign _1165 = _1164 < _1144;
    assign _1166 = ~ _1165;
    assign _1155 = _741[41:26];
    assign _1157 = _1155 == _1203;
    assign _1072 = _1042[0:0];
    assign _1074 = _1072 ? _580 : _1104;
    assign _1069 = _1042[1:1];
    assign _1071 = _1069 ? _559 : _1104;
    assign _1075 = _1071 < _1074;
    assign _1076 = _1075 ? _1074 : _1071;
    assign _1064 = _1042[2:2];
    assign _1066 = _1064 ? _536 : _1104;
    assign _1061 = _1042[3:3];
    assign _1063 = _1061 ? _515 : _1104;
    assign _1067 = _1063 < _1066;
    assign _1068 = _1067 ? _1066 : _1063;
    assign _1077 = _1068 < _1076;
    assign _1078 = _1077 ? _1076 : _1068;
    assign _1054 = _1042[4:4];
    assign _1056 = _1054 ? _490 : _1104;
    assign _1051 = _1042[5:5];
    assign _1053 = _1051 ? _469 : _1104;
    assign _1057 = _1053 < _1056;
    assign _1058 = _1057 ? _1056 : _1053;
    assign _1046 = _1042[6:6];
    assign _1048 = _1046 ? _446 : _1104;
    assign _1042 = _1041[23:16];
    assign _1043 = _1042[7:7];
    assign _1045 = _1043 ? _425 : _1104;
    assign _1049 = _1045 < _1048;
    assign _1050 = _1049 ? _1048 : _1045;
    assign _1059 = _1050 < _1058;
    assign _1060 = _1059 ? _1058 : _1050;
    assign _1079 = _1060 < _1078;
    assign _1080 = _1079 ? _1078 : _1060;
    assign _1147 = 14'b00000000000000;
    assign _1148 = { _1147,
                     _1080 };
    assign _1041 = _400[511:400];
    assign _1145 = _1041[41:26];
    assign _1146 = { gnd,
                     _1145 };
    assign _1149 = _1146 + _1148;
    always @(posedge _294) begin
        if (_292)
            _1152 <= _1163;
        else
            _1152 <= _1149;
    end
    assign _1144 = { gnd,
                     _1141 };
    assign _1153 = _1144 < _1152;
    assign _1154 = ~ _1153;
    assign _1158 = _1154 | _1157;
    assign _1167 = _1158 & _1166;
    assign _1086 = _741[25:24];
    always @* begin
        case (_1086)
        0:
            _1141 <= _367;
        1:
            _1141 <= _370;
        2:
            _1141 <= _373;
        default:
            _1141 <= _373;
        endcase
    end
    assign _1143 = _1141 == _1093;
    assign _1171 = _1143 ? _1170 : _1167;
    assign _1135 = f_changed_all & f_chgmask3;
    assign _1137 = _1135 == _1253;
    assign _1138 = ~ _1137;
    assign _1134 = f_chgmask3 == _1253;
    assign _1139 = _1134 | _1138;
    assign _1128 = _741[7:0];
    assign _1126 = _741[15:8];
    assign _1127 = _339 ^ _1126;
    assign _1129 = _1127 & _1128;
    assign _1131 = _1129 == _1253;
    assign _1132 = f_valid3 & _1131;
    assign _1140 = _1132 & _1139;
    assign _1172 = _1140 & _1171;
    assign _1177 = _1172 & _1176;
    assign _1213 = _1177 & _1212;
    assign _1214 = f_in_eval & _1213;
    assign _1218 = _1214 & _1217;
    assign f_fire3 = _1218 & _756;
    assign _720 = f_chgmask0 & f_multi_eff;
    assign _722 = _720 == _1253;
    assign _708 = _608 == _1093;
    assign _704 = _608 == _1203;
    assign _705 = _704 & _685;
    assign _702 = _378 == _604;
    assign _706 = _702 | _705;
    assign _709 = _376 ? _708 : _706;
    assign _699 = _633[3:0];
    assign _701 = _699 == _2049;
    assign _710 = _701 | _709;
    assign _697 = _608 == _1093;
    assign _693 = _608 == _1203;
    assign _694 = _693 & _685;
    assign _691 = _378 == _604;
    assign _695 = _691 | _694;
    assign _698 = _376 ? _697 : _695;
    assign _689 = _595 == _1093;
    always @(posedge _294) begin
        if (_292)
            _683 <= _1104;
        else
            _683 <= _587;
    end
    assign _684 = { _1111,
                    _683 };
    assign _685 = _374 < _684;
    assign _679 = _595 == _1203;
    assign _686 = _679 & _685;
    assign _677 = _378 == _592;
    assign _687 = _677 | _686;
    assign _690 = _376 ? _689 : _687;
    assign _676 = _332[104:103];
    always @* begin
        case (_676)
        0:
            _711 <= vdd;
        1:
            _711 <= _690;
        2:
            _711 <= _698;
        default:
            _711 <= _710;
        endcase
    end
    assign _675 = ~ _674;
    assign _712 = _675 | _711;
    assign _667 = _332[62:62];
    assign _613 = _332[61:58];
    always @* begin
        case (_613)
        0:
            _666 <= vdd;
        1:
            _666 <= _618;
        2:
            _666 <= _622;
        3:
            _666 <= _626;
        4:
            _666 <= _628;
        5:
            _666 <= _630;
        6:
            _666 <= _634;
        7:
            _666 <= _637;
        8:
            _666 <= _642;
        9:
            _666 <= _645;
        10:
            _666 <= _648;
        11:
            _666 <= _651;
        12:
            _666 <= _656;
        13:
            _666 <= _659;
        14:
            _666 <= _662;
        default:
            _666 <= _665;
        endcase
    end
    assign _668 = _666 ^ _667;
    assign _608 = _332[57:42];
    assign _610 = _608 == _1093;
    assign _599 = _401[57:42];
    assign _600 = { gnd,
                    _599 };
    assign _601 = _600 + _588;
    always @(posedge _294) begin
        if (_292)
            _604 <= _1163;
        else
            _604 <= _601;
    end
    assign _605 = _604 < _378;
    assign _606 = ~ _605;
    assign _595 = _332[41:26];
    assign _597 = _595 == _1203;
    assign _561 = _405[0:0];
    assign _581 = _561 ? _580 : _1104;
    assign _540 = _405[1:1];
    assign _560 = _540 ? _559 : _1104;
    assign _582 = _560 < _581;
    assign _583 = _582 ? _581 : _560;
    assign _517 = _405[2:2];
    assign _537 = _517 ? _536 : _1104;
    assign _496 = _405[3:3];
    assign _516 = _496 ? _515 : _1104;
    assign _538 = _516 < _537;
    assign _539 = _538 ? _537 : _516;
    assign _584 = _539 < _583;
    assign _585 = _584 ? _583 : _539;
    assign _471 = _405[4:4];
    assign _491 = _471 ? _490 : _1104;
    assign _450 = _405[5:5];
    assign _470 = _450 ? _469 : _1104;
    assign _492 = _470 < _491;
    assign _493 = _492 ? _491 : _470;
    assign _427 = _405[6:6];
    assign _447 = _427 ? _446 : _1104;
    assign _405 = _401[23:16];
    assign _406 = _405[7:7];
    assign _426 = _406 ? _425 : _1104;
    assign _448 = _426 < _447;
    assign _449 = _448 ? _447 : _426;
    assign _494 = _449 < _493;
    assign _495 = _494 ? _493 : _449;
    assign _586 = _495 < _585;
    assign _587 = _586 ? _585 : _495;
    assign _588 = { _1147,
                    _587 };
    assign _401 = _400[175:64];
    assign _402 = _401[41:26];
    assign _403 = { gnd,
                    _402 };
    assign _589 = _403 + _588;
    always @(posedge _294) begin
        if (_292)
            _592 <= _1163;
        else
            _592 <= _589;
    end
    assign _378 = { gnd,
                    _374 };
    assign _593 = _378 < _592;
    assign _594 = ~ _593;
    assign _598 = _594 | _597;
    assign _607 = _598 & _606;
    assign _364 = _332[25:24];
    always @* begin
        case (_364)
        0:
            _374 <= _367;
        1:
            _374 <= _370;
        2:
            _374 <= _373;
        default:
            _374 <= _373;
        endcase
    end
    assign _376 = _374 == _1093;
    assign _611 = _376 ? _610 : _607;
    assign _358 = f_changed_all & f_chgmask0;
    assign _360 = _358 == _1253;
    assign _361 = ~ _360;
    assign _349 = f_chgmask0 == _1253;
    assign _362 = _349 | _361;
    assign _342 = _332[7:0];
    assign _340 = _332[15:8];
    assign _341 = _339 ^ _340;
    assign _343 = _341 & _342;
    assign _345 = _343 == _1253;
    assign _320 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _4049 = _383 + _1464;
    assign _1227 = 6'b000000;
    assign _129 = host_start_loc;
    assign _2838 = _2837 ? _2835 : _1228;
    assign _131 = host_recover_loc;
    assign _2825 = _1960 ? _131 : _2824;
    assign _132 = _2825;
    always @(posedge _294) begin
        if (_292)
            _2824 <= _1227;
        else
            _2824 <= _132;
    end
    assign _2828 = f_policy == _1245;
    assign _2829 = _2828 ? _2824 : _1228;
    assign _2830 = f_viol_now ? _2829 : _1228;
    assign _2839 = _1220 ? _2838 : _2830;
    assign _2826 = _316 == _1245;
    assign _2840 = _2826 ? _2839 : _1228;
    assign _2841 = _1960 ? _129 : _2840;
    assign _133 = _2841;
    always @(posedge _294) begin
        if (_292)
            _1228 <= _1227;
        else
            _1228 <= _133;
    end
    assign _2834 = _741[110:105];
    assign _2833 = _735[110:105];
    assign _2832 = _729[110:105];
    assign _2831 = _332[110:105];
    always @* begin
        case (f_winner)
        0:
            _2835 <= _2831;
        1:
            _2835 <= _2832;
        2:
            _2835 <= _2833;
        default:
            _2835 <= _2834;
        endcase
    end
    assign _2836 = _2835 == _1228;
    assign _2837 = ~ _2836;
    assign _4045 = _2837 ? _1104 : _383;
    assign _4040 = f_policy == _1245;
    assign _4042 = _4040 ? _1104 : _383;
    assign _2017 = f_changed_all & f_watch;
    assign _2019 = _2017 == _1253;
    assign _2020 = ~ _2019;
    assign _2015 = ~ _1220;
    assign _2016 = f_in_eval & _2015;
    assign f_unexp_now = _2016 & _2020;
    assign _2845 = ~ f_amb_now;
    assign _2846 = _2014 & _2845;
    assign _2848 = _2846 ? _1896 : _2844;
    assign _2849 = _1220 ? _2844 : _2848;
    assign _2844 = _1796 ? _1096 : _2012;
    assign _2842 = _316 == _1245;
    assign _2850 = _2842 ? _2849 : _2844;
    assign _134 = _2850;
    always @(posedge _294) begin
        if (_292)
            _2012 <= _1096;
        else
            _2012 <= _134;
    end
    assign _2013 = ~ _2012;
    assign _4031 = 16'b0000000000000001;
    assign _4032 = _367 + _4031;
    assign _4028 = _367 == _1093;
    assign _4029 = ~ _4028;
    assign _4030 = _3989 & _4029;
    assign _4033 = _4030 ? _4032 : _367;
    assign _3973 = _724[26:24];
    assign _3971 = _741[93:91];
    assign _3970 = _735[93:91];
    assign _3969 = _729[93:91];
    assign _3968 = _332[93:91];
    assign _1029 = f_chgmask2 & f_multi_eff;
    assign _1031 = _1029 == _1253;
    assign _1022 = _979 == _1093;
    assign _1018 = _979 == _1203;
    assign _1019 = _1018 & _999;
    assign _1016 = _915 == _975;
    assign _1020 = _1016 | _1019;
    assign _1023 = _914 ? _1022 : _1020;
    assign _1013 = _633[3:0];
    assign _1015 = _1013 == _2049;
    assign _1024 = _1015 | _1023;
    assign _1011 = _979 == _1093;
    assign _1007 = _979 == _1203;
    assign _1008 = _1007 & _999;
    assign _1005 = _915 == _975;
    assign _1009 = _1005 | _1008;
    assign _1012 = _914 ? _1011 : _1009;
    assign _1003 = _966 == _1093;
    always @(posedge _294) begin
        if (_292)
            _997 <= _1104;
        else
            _997 <= _958;
    end
    assign _998 = { _1111,
                    _997 };
    assign _999 = _912 < _998;
    assign _993 = _966 == _1203;
    assign _1000 = _993 & _999;
    assign _991 = _915 == _963;
    assign _1001 = _991 | _1000;
    assign _1004 = _914 ? _1003 : _1001;
    assign _990 = _735[104:103];
    always @* begin
        case (_990)
        0:
            _1025 <= vdd;
        1:
            _1025 <= _1004;
        2:
            _1025 <= _1012;
        default:
            _1025 <= _1024;
        endcase
    end
    assign _989 = ~ _674;
    assign _1026 = _989 | _1025;
    assign _986 = _735[62:62];
    assign _984 = _735[61:58];
    always @* begin
        case (_984)
        0:
            _985 <= vdd;
        1:
            _985 <= _618;
        2:
            _985 <= _622;
        3:
            _985 <= _626;
        4:
            _985 <= _628;
        5:
            _985 <= _630;
        6:
            _985 <= _634;
        7:
            _985 <= _637;
        8:
            _985 <= _642;
        9:
            _985 <= _645;
        10:
            _985 <= _648;
        11:
            _985 <= _651;
        12:
            _985 <= _656;
        13:
            _985 <= _659;
        14:
            _985 <= _662;
        default:
            _985 <= _665;
        endcase
    end
    assign _987 = _985 ^ _986;
    assign _979 = _735[57:42];
    assign _981 = _979 == _1093;
    assign _970 = _916[57:42];
    assign _971 = { gnd,
                    _970 };
    assign _972 = _971 + _959;
    always @(posedge _294) begin
        if (_292)
            _975 <= _1163;
        else
            _975 <= _972;
    end
    assign _976 = _975 < _915;
    assign _977 = ~ _976;
    assign _966 = _735[41:26];
    assign _968 = _966 == _1203;
    assign _950 = _920[0:0];
    assign _952 = _950 ? _580 : _1104;
    assign _947 = _920[1:1];
    assign _949 = _947 ? _559 : _1104;
    assign _953 = _949 < _952;
    assign _954 = _953 ? _952 : _949;
    assign _942 = _920[2:2];
    assign _944 = _942 ? _536 : _1104;
    assign _939 = _920[3:3];
    assign _941 = _939 ? _515 : _1104;
    assign _945 = _941 < _944;
    assign _946 = _945 ? _944 : _941;
    assign _955 = _946 < _954;
    assign _956 = _955 ? _954 : _946;
    assign _932 = _920[4:4];
    assign _934 = _932 ? _490 : _1104;
    assign _929 = _920[5:5];
    assign _931 = _929 ? _469 : _1104;
    assign _935 = _931 < _934;
    assign _936 = _935 ? _934 : _931;
    assign _924 = _920[6:6];
    assign _926 = _924 ? _446 : _1104;
    assign _920 = _916[23:16];
    assign _921 = _920[7:7];
    assign _923 = _921 ? _425 : _1104;
    assign _927 = _923 < _926;
    assign _928 = _927 ? _926 : _923;
    assign _937 = _928 < _936;
    assign _938 = _937 ? _936 : _928;
    assign _957 = _938 < _956;
    assign _958 = _957 ? _956 : _938;
    assign _959 = { _1147,
                    _958 };
    assign _916 = _400[399:288];
    assign _917 = _916[41:26];
    assign _918 = { gnd,
                    _917 };
    assign _960 = _918 + _959;
    always @(posedge _294) begin
        if (_292)
            _963 <= _1163;
        else
            _963 <= _960;
    end
    assign _915 = { gnd,
                    _912 };
    assign _964 = _915 < _963;
    assign _965 = ~ _964;
    assign _969 = _965 | _968;
    assign _978 = _969 & _977;
    assign _911 = _735[25:24];
    always @* begin
        case (_911)
        0:
            _912 <= _367;
        1:
            _912 <= _370;
        2:
            _912 <= _373;
        default:
            _912 <= _373;
        endcase
    end
    assign _914 = _912 == _1093;
    assign _982 = _914 ? _981 : _978;
    assign _905 = f_changed_all & f_chgmask2;
    assign _907 = _905 == _1253;
    assign _908 = ~ _907;
    assign _904 = f_chgmask2 == _1253;
    assign _909 = _904 | _908;
    assign _898 = _735[7:0];
    assign _896 = _735[15:8];
    assign _897 = _339 ^ _896;
    assign _899 = _897 & _898;
    assign _901 = _899 == _1253;
    assign _902 = f_valid2 & _901;
    assign _910 = _902 & _909;
    assign _983 = _910 & _982;
    assign _988 = _983 & _987;
    assign _1027 = _988 & _1026;
    assign _1028 = f_in_eval & _1027;
    assign _1032 = _1028 & _1031;
    assign f_fire2 = _1032 & _756;
    assign _1036 = f_fire2 ? _1245 : _2026;
    assign f_policy = _724[59:58];
    assign _755 = f_policy == _1244;
    assign f_chgmask3 = _741[23:16];
    assign f_valid3 = _741[111:111];
    assign _745 = f_valid3 ? f_chgmask3 : _1253;
    assign f_chgmask2 = _735[23:16];
    assign f_valid2 = _735[111:111];
    assign _739 = f_valid2 ? f_chgmask2 : _1253;
    assign _733 = f_valid1 ? f_chgmask1 : _1253;
    assign f_chgmask0 = _332[23:16];
    assign _727 = f_valid0 ? f_chgmask0 : _1253;
    assign f_watch = _724[57:50];
    assign _728 = f_watch | _727;
    assign _734 = _728 | _733;
    assign _740 = _734 | _739;
    assign f_relevant = _740 | _745;
    assign _747 = f_multi_eff & f_relevant;
    assign _749 = _747 == _1253;
    assign _750 = ~ _749;
    assign f_amb_now = f_in_eval & _750;
    assign _752 = ~ f_amb_now;
    assign _756 = _752 | _755;
    assign _718 = _352 & f_chg_now;
    assign _2855 = _352 & f_chg_now;
    assign _2856 = _717 | _2855;
    assign _2852 = _316 == _1245;
    assign _2854 = _2852 ? _1253 : _717;
    assign _2851 = _316 == _1244;
    assign _2857 = _2851 ? _2856 : _2854;
    assign _2859 = _1960 ? _1253 : _2857;
    assign _135 = _2859;
    always @(posedge _294) begin
        if (_292)
            _717 <= _1253;
        else
            _717 <= _135;
    end
    assign f_multi_eff = _717 | _718;
    assign _891 = f_chgmask1 & f_multi_eff;
    assign _893 = _891 == _1253;
    assign _884 = _841 == _1093;
    assign _880 = _841 == _1203;
    assign _881 = _880 & _861;
    assign _878 = _777 == _837;
    assign _882 = _878 | _881;
    assign _885 = _776 ? _884 : _882;
    assign _875 = _633[3:0];
    assign _877 = _875 == _2049;
    assign _886 = _877 | _885;
    assign _873 = _841 == _1093;
    assign _869 = _841 == _1203;
    assign _870 = _869 & _861;
    assign _867 = _777 == _837;
    assign _871 = _867 | _870;
    assign _874 = _776 ? _873 : _871;
    assign _865 = _828 == _1093;
    always @(posedge _294) begin
        if (_292)
            _859 <= _1104;
        else
            _859 <= _820;
    end
    assign _860 = { _1111,
                    _859 };
    assign _861 = _774 < _860;
    assign _855 = _828 == _1203;
    assign _862 = _855 & _861;
    assign _853 = _777 == _825;
    assign _863 = _853 | _862;
    assign _866 = _776 ? _865 : _863;
    assign _852 = _729[104:103];
    always @* begin
        case (_852)
        0:
            _887 <= vdd;
        1:
            _887 <= _866;
        2:
            _887 <= _874;
        default:
            _887 <= _886;
        endcase
    end
    assign _137 = host_role;
    assign _2860 = _1960 ? _137 : _672;
    assign _138 = _2860;
    always @(posedge _294) begin
        if (_292)
            _672 <= _2544;
        else
            _672 <= _138;
    end
    assign _674 = _672 == _1245;
    assign _851 = ~ _674;
    assign _888 = _851 | _887;
    assign _848 = _729[62:62];
    assign _2864 = _1621 ? _1896 : _2862;
    assign _2862 = _1591 ? _1896 : _665;
    assign _2865 = _1576 ? _2864 : _2862;
    assign _2867 = _1475 ? _1096 : _2865;
    assign _2869 = _1473 ? _1096 : _2867;
    assign _139 = _2869;
    always @(posedge _294) begin
        if (_292)
            _665 <= _1096;
        else
            _665 <= _139;
    end
    assign _141 = host_lane1_sync_mask;
    assign _143 = host_lane1_sync;
    assign _2875 = _1709 ? _2874 : _2872;
    assign _2876 = _1621 ? _2872 : _2875;
    assign _2877 = _1576 ? _2876 : _2872;
    assign _2879 = _1475 ? _1203 : _2877;
    assign _144 = _2879;
    always @(posedge _294) begin
        if (_292)
            _2872 <= _1203;
        else
            _2872 <= _144;
    end
    assign _2873 = _2872[14:0];
    assign _2874 = { _2873,
                     _1612 };
    assign _2880 = _2874 ^ _143;
    assign _2881 = _2880 & _141;
    assign _2883 = _2881 == _1203;
    assign _2885 = _2883 ? _1896 : _662;
    assign _2886 = _1709 ? _2885 : _662;
    assign _2887 = _1621 ? _662 : _2886;
    assign _2888 = _1576 ? _2887 : _662;
    assign _2890 = _1475 ? _1096 : _2888;
    assign _2892 = _1473 ? _1096 : _2890;
    assign _145 = _2892;
    always @(posedge _294) begin
        if (_292)
            _662 <= _1096;
        else
            _662 <= _145;
    end
    assign _2905 = _1612 == _2904;
    assign _2906 = ~ _2905;
    assign _2908 = _2899 ? _2907 : g_crc_bad;
    assign _2909 = _1709 ? _2908 : g_crc_bad;
    assign _2910 = _1621 ? g_crc_bad : _2909;
    assign _2911 = _1576 ? _2910 : g_crc_bad;
    assign _2913 = _1475 ? _1096 : _2911;
    assign _146 = _2913;
    always @(posedge _294) begin
        if (_292)
            g_crc_bad <= _1096;
        else
            g_crc_bad <= _146;
    end
    assign _2907 = g_crc_bad | _2906;
    assign _2916 = ~ _2907;
    assign _2914 = 6'b000001;
    assign _2915 = g_left == _2914;
    assign _2917 = _2915 ? _2916 : _659;
    assign _2918 = _2899 ? _2917 : _659;
    assign _2919 = _1709 ? _2918 : _659;
    assign _2920 = _1621 ? _659 : _2919;
    assign _2921 = _1576 ? _2920 : _659;
    assign _2923 = _1475 ? _1096 : _2921;
    assign _2925 = _1473 ? _1096 : _2923;
    assign _147 = _2925;
    always @(posedge _294) begin
        if (_292)
            _659 <= _1096;
        else
            _659 <= _147;
    end
    assign _2929 = _1463 ? _1896 : _2927;
    assign _2927 = _1433 ? _1896 : _651;
    assign _2930 = _1418 ? _2929 : _2927;
    assign _2932 = _1317 ? _1096 : _2930;
    assign _2934 = _1315 ? _1096 : _2932;
    assign _148 = _2934;
    always @(posedge _294) begin
        if (_292)
            _651 <= _1096;
        else
            _651 <= _148;
    end
    assign _150 = host_lane0_sync_mask;
    assign _152 = host_lane0_sync;
    assign _2940 = _1632 ? _2939 : _2937;
    assign _2941 = _1463 ? _2937 : _2940;
    assign _2942 = _1418 ? _2941 : _2937;
    assign _2944 = _1317 ? _1203 : _2942;
    assign _153 = _2944;
    always @(posedge _294) begin
        if (_292)
            _2937 <= _1203;
        else
            _2937 <= _153;
    end
    assign _2938 = _2937[14:0];
    assign _2939 = { _2938,
                     _1454 };
    assign _2945 = _2939 ^ _152;
    assign _2946 = _2945 & _150;
    assign _2948 = _2946 == _1203;
    assign _2950 = _2948 ? _1896 : _648;
    assign _2951 = _1632 ? _2950 : _648;
    assign _2952 = _1463 ? _648 : _2951;
    assign _2953 = _1418 ? _2952 : _648;
    assign _2955 = _1317 ? _1096 : _2953;
    assign _2957 = _1315 ? _1096 : _2955;
    assign _154 = _2957;
    always @(posedge _294) begin
        if (_292)
            _648 <= _1096;
        else
            _648 <= _154;
    end
    assign _2970 = _1454 == _2969;
    assign _2971 = ~ _2970;
    assign _2973 = _2964 ? _2972 : g_crc_bad_0;
    assign _2974 = _1632 ? _2973 : g_crc_bad_0;
    assign _2975 = _1463 ? g_crc_bad_0 : _2974;
    assign _2976 = _1418 ? _2975 : g_crc_bad_0;
    assign _2978 = _1317 ? _1096 : _2976;
    assign _155 = _2978;
    always @(posedge _294) begin
        if (_292)
            g_crc_bad_0 <= _1096;
        else
            g_crc_bad_0 <= _155;
    end
    assign _2972 = g_crc_bad_0 | _2971;
    assign _2981 = ~ _2972;
    assign _2980 = g_left_0 == _2914;
    assign _2982 = _2980 ? _2981 : _645;
    assign _2983 = _2964 ? _2982 : _645;
    assign _2984 = _1632 ? _2983 : _645;
    assign _2985 = _1463 ? _645 : _2984;
    assign _2986 = _1418 ? _2985 : _645;
    assign _2988 = _1317 ? _1096 : _2986;
    assign _2990 = _1315 ? _1096 : _2988;
    assign _156 = _2990;
    always @(posedge _294) begin
        if (_292)
            _645 <= _1096;
        else
            _645 <= _156;
    end
    assign _158 = host_match_addr;
    assign _636 = _158[6:0];
    assign _635 = _625[7:1];
    assign _637 = _635 == _636;
    assign _632 = 16'b1010110011100001;
    assign _2995 = _633[10:10];
    assign _2994 = _633[12:12];
    assign _2996 = _2994 ^ _2995;
    assign _2993 = _633[13:13];
    assign _2997 = _2993 ^ _2996;
    assign _2992 = _633[15:15];
    assign _2998 = _2992 ^ _2997;
    assign _2991 = _633[14:0];
    assign _2999 = { _2991,
                     _2998 };
    assign _159 = _2999;
    always @(posedge _294) begin
        if (_292)
            _633 <= _632;
        else
            _633 <= _159;
    end
    assign _634 = _633[0:0];
    assign _3018 = _165 + _2368;
    assign _3016 = _165 - _2368;
    assign _3019 = _2433 ? _3018 : _3016;
    assign _2431 = _165 == _2049;
    assign _2482 = ~ _2431;
    assign _161 = host_rx_pop;
    assign _2483 = _161 & _2482;
    assign _2432 = ~ _630;
    assign _2465 = _1792 & _1806;
    assign _3003 = _2465 ? _1792 : _1096;
    assign _2459 = ~ _1792;
    assign _2460 = _2459 & _1806;
    assign _3001 = _2460 ? _1896 : _1792;
    assign _1805 = _1803 == _2026;
    assign _1806 = _1796 & _1805;
    assign _1812 = _1792 | _1806;
    assign _1809 = _1708 | _1757;
    assign _1810 = ~ _1809;
    assign _1808 = ~ _1680;
    assign _1811 = _1808 & _1810;
    assign _1813 = _1811 & _1812;
    assign _3004 = _1813 ? _3003 : _3001;
    assign _162 = _3004;
    always @(posedge _294) begin
        if (_292)
            _1792 <= _1096;
        else
            _1792 <= _162;
    end
    assign _3012 = _1792 | _1806;
    assign _2456 = _1708 & _1757;
    assign _3008 = _2456 ? _1708 : _1096;
    assign _2440 = ~ _1708;
    assign _2441 = _2440 & _1757;
    assign _3006 = _2441 ? _1896 : _1708;
    assign _1755 = ~ _1721;
    assign _1749 = g_bitpos + _1464;
    assign _1744 = ~ _1606;
    assign g_tx_bit = _1734 & _1742;
    assign _1745 = g_tx_bit & _1744;
    assign _1746 = _1745 & g_data_left;
    assign _1747 = _1715 | _1746;
    assign _1750 = _1747 ? _1749 : g_bitpos;
    assign _1752 = _1750 == _1104;
    assign _1753 = ~ _1752;
    assign _1724 = _1723 & _213;
    assign _1754 = _1724 & _1753;
    assign _1756 = _1754 & _1755;
    assign _1720 = g_bitpos == _2425;
    assign _1721 = _1715 & _1720;
    assign _1757 = _1721 | _1756;
    assign _1760 = _1708 | _1757;
    assign _1759 = ~ _1680;
    assign _1761 = _1759 & _1760;
    assign _3009 = _1761 ? _3008 : _3006;
    assign _163 = _3009;
    always @(posedge _294) begin
        if (_292)
            _1708 <= _1096;
        else
            _1708 <= _163;
    end
    assign _3010 = _1708 | _1757;
    assign _1678 = ~ _1644;
    assign _1672 = g_bitpos_0 + _1464;
    assign _1667 = ~ _1448;
    assign g_tx_bit_0 = _1657 & _1665;
    assign _1668 = g_tx_bit_0 & _1667;
    assign _1669 = _1668 & g_data_left_0;
    assign _1670 = _1638 | _1669;
    assign _1673 = _1670 ? _1672 : g_bitpos_0;
    assign _1675 = _1673 == _1104;
    assign _1676 = ~ _1675;
    assign _1647 = _1646 & _265;
    assign _1677 = _1647 & _1676;
    assign _1679 = _1677 & _1678;
    assign _1643 = g_bitpos_0 == _2425;
    assign _1644 = _1638 & _1643;
    assign _1680 = _1644 | _1679;
    assign _3011 = _1680 | _3010;
    assign _3013 = _3011 | _3012;
    assign _164 = _3013;
    assign _2433 = _164 & _2432;
    assign _3014 = _2433 ^ _2483;
    assign _3020 = _3014 ? _3019 : _165;
    always @(posedge _294) begin
        if (_292)
            _3023 <= _2049;
        else
            _3023 <= _3020;
    end
    assign _165 = _3023;
    assign _630 = _165 == _1830;
    assign _3040 = _625[6:0];
    assign _3041 = { _3040,
                     _3037 };
    assign _3038 = _625[7:1];
    assign _3036 = _339[7:7];
    assign _3035 = _339[6:6];
    assign _3034 = _339[5:5];
    assign _3033 = _339[4:4];
    assign _3032 = _339[3:3];
    assign _3031 = _339[2:2];
    assign _3030 = _339[1:1];
    assign _3029 = _339[0:0];
    assign _3027 = _741[102:100];
    assign _3026 = _735[102:100];
    assign _3025 = _729[102:100];
    assign _3024 = _332[102:100];
    always @* begin
        case (f_winner)
        0:
            _3028 <= _3024;
        1:
            _3028 <= _3025;
        2:
            _3028 <= _3026;
        default:
            _3028 <= _3027;
        endcase
    end
    always @* begin
        case (_3028)
        0:
            _3037 <= _3029;
        1:
            _3037 <= _3030;
        2:
            _3037 <= _3031;
        3:
            _3037 <= _3032;
        4:
            _3037 <= _3033;
        5:
            _3037 <= _3034;
        6:
            _3037 <= _3035;
        default:
            _3037 <= _3036;
        endcase
    end
    assign _3039 = { _3037,
                     _3038 };
    assign _1800 = _741[97:96];
    assign _1799 = _735[97:96];
    assign _1798 = _729[97:96];
    assign _1797 = _332[97:96];
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
    assign _1803 = _1795 ? _2544 : _1801;
    always @* begin
        case (_1803)
        0:
            _3042 <= _625;
        1:
            _3042 <= _3039;
        2:
            _3042 <= _3041;
        default:
            _3042 <= _625;
        endcase
    end
    assign _3043 = _1796 ? _3042 : _625;
    assign _166 = _3043;
    always @(posedge _294) begin
        if (_292)
            _625 <= _1253;
        else
            _625 <= _166;
    end
    assign _626 = _625[0:0];
    assign _3784 = _621[7:1];
    assign _3785 = { vdd,
                     _3784 };
    assign _3782 = _3774[7:7];
    assign _3781 = _3774[6:6];
    assign _3780 = _3774[5:5];
    assign _3779 = _3774[4:4];
    assign _3778 = _3774[3:3];
    assign _3777 = _3774[2:2];
    assign _3776 = _3774[1:1];
    assign _3775 = _3774[0:0];
    assign _3783 = { _3775,
                     _3776,
                     _3777,
                     _3778,
                     _3779,
                     _3780,
                     _3781,
                     _3782 };
    assign _3767 = _271 + _2368;
    assign _3765 = _271 - _2368;
    assign _3768 = _3053 ? _3767 : _3765;
    assign _3457 = ~ _628;
    assign _1889 = ~ _628;
    assign _1725 = ~ _213;
    assign _3417 = ~ _211;
    assign _3418 = _213 & _3417;
    assign _3421 = _3418 ? _1244 : _1245;
    assign _3410 = ~ _1742;
    assign _3411 = _1734 & _3410;
    assign _3412 = _656 | _3411;
    assign _3413 = _3412 | _3402;
    assign _3415 = _3413 ? _1245 : _3409;
    assign _3396 = g_run + _1464;
    assign _3393 = g_run + _1464;
    assign _3389 = vdd == g_last;
    assign _3387 = g_run == _1104;
    assign _3388 = ~ _3387;
    assign _3390 = _3388 & _3389;
    assign _3394 = _3390 ? _3393 : _1464;
    assign _3385 = _191 == _1245;
    assign _3397 = _3385 ? _3396 : _3394;
    assign _3398 = _3397 == _169;
    assign _3379 = g_run + _1464;
    assign _3375 = gnd == g_last;
    assign _3373 = g_run == _1104;
    assign _3374 = ~ _3373;
    assign _3376 = _3374 & _3375;
    assign _3380 = _3376 ? _3379 : _1464;
    assign _3371 = _191 == _1245;
    assign _3382 = _3371 ? _1104 : _3380;
    assign _3383 = _3382 == _169;
    assign _3399 = _1612 ? _3398 : _3383;
    assign _3400 = _1601 & _3399;
    assign _3401 = ~ _3400;
    assign _3367 = g_left == _2914;
    assign _3365 = g_left == _1227;
    assign _3368 = _2899 ? _3367 : _3365;
    assign _3360 = g_cnt + _4031;
    assign _3361 = _3360 == _185;
    assign _3358 = g_cnt == _185;
    assign _3362 = _1715 ? _3361 : _3358;
    assign _3356 = ~ _1621;
    assign _3357 = _1576 & _3356;
    assign _3363 = _3357 & _3362;
    assign _3369 = _3363 & _3368;
    assign _3402 = _3369 & _3401;
    assign _3404 = _3402 ? _2026 : _3355;
    assign _3406 = _1621 ? _2544 : _3404;
    assign _3352 = _1742 ? _3350 : _2026;
    assign _3348 = _1502 & _1500;
    assign _3350 = _3348 ? _1245 : g_mode;
    assign _3353 = _1734 ? _3352 : _3350;
    assign _3128 = _1742 ? _3127 : _3046;
    assign _3129 = _1734 ? _3128 : _3046;
    assign _167 = _3129;
    always @(posedge _294) begin
        if (_292)
            _3046 <= _1096;
        else
            _3046 <= _167;
    end
    assign _3278 = ~ _3127;
    assign _3276 = ~ f_lane1_out;
    assign _3277 = _3127 ? f_lane1_out : _3276;
    always @* begin
        case (_207)
        0:
            _3279 <= _3127;
        1:
            _3279 <= _3277;
        2:
            _3279 <= _3278;
        default:
            _3279 <= _3127;
        endcase
    end
    assign _169 = host_lane1_stuff_len;
    assign _3260 = g_run + _1464;
    assign _3261 = _1612 ? _3260 : _1104;
    assign _3256 = g_run + _1464;
    assign _3252 = _1612 == g_last;
    assign _3250 = g_run == _1104;
    assign _3251 = ~ _3250;
    assign _3253 = _3251 & _3252;
    assign _3257 = _3253 ? _3256 : _1464;
    assign _3248 = _191 == _1245;
    assign _3262 = _3248 ? _3261 : _3257;
    assign _3263 = _1621 ? _3246 : _3262;
    assign _3242 = g_run + _1464;
    assign _3243 = _3127 ? _3242 : _1104;
    assign _3238 = g_run + _1464;
    assign _3124 = _3116[7:7];
    assign _3123 = _3116[6:6];
    assign _3122 = _3116[5:5];
    assign _3121 = _3116[4:4];
    assign _3120 = _3116[3:3];
    assign _3119 = _3116[2:2];
    assign _3118 = _3116[1:1];
    assign _3114 = _3106[7:7];
    assign _3113 = _3106[6:6];
    assign _3112 = _3106[5:5];
    assign _3111 = _3106[4:4];
    assign _3110 = _3106[3:3];
    assign _3109 = _3106[2:2];
    assign _3108 = _3106[1:1];
    assign _3105 = _628 ? _1251 : _3103;
    assign _2450 = g_byte[7:1];
    assign _2451 = { _1612,
                     _2450 };
    assign _2448 = g_byte[6:0];
    assign _2449 = { _2448,
                     _1612 };
    assign _2452 = _172 ? _2451 : _2449;
    assign _3134 = _1715 ? _2452 : _3133;
    assign _3135 = _1709 ? _3134 : _3133;
    assign _3136 = _1621 ? _3133 : _3135;
    assign _3130 = g_data_left ? _3106 : g_byte;
    assign _3131 = _1606 ? g_byte : _3130;
    assign _3132 = _1742 ? _3131 : g_byte;
    assign _3133 = _1734 ? _3132 : g_byte;
    assign _3137 = _1576 ? _3136 : _3133;
    assign _170 = _3137;
    always @(posedge _294) begin
        if (_292)
            g_byte <= _1253;
        else
            g_byte <= _170;
    end
    assign _1886 = g_bitpos == _1104;
    assign _1883 = ~ _1606;
    assign _1884 = _1883 & g_data_left;
    assign _1887 = _1884 & _1886;
    assign _3106 = _1887 ? _3105 : g_byte;
    assign _3107 = _3106[0:0];
    assign _3115 = { _3107,
                     _3108,
                     _3109,
                     _3110,
                     _3111,
                     _3112,
                     _3113,
                     _3114 };
    assign _172 = host_lane1_lsb_first;
    assign _3116 = _172 ? _3106 : _3115;
    assign _3117 = _3116[0:0];
    assign _3145 = g_bitpos + _1464;
    assign _3146 = _1715 ? _3145 : _3143;
    assign _3147 = _1709 ? _3146 : _3143;
    assign _3148 = _1621 ? _3143 : _3147;
    assign _3139 = g_bitpos + _1464;
    assign _3140 = g_data_left ? _3139 : g_bitpos;
    assign _3141 = _1606 ? g_bitpos : _3140;
    assign _3142 = _1742 ? _3141 : g_bitpos;
    assign _3143 = _1734 ? _3142 : g_bitpos;
    assign _3149 = _1576 ? _3148 : _3143;
    assign _3151 = _1475 ? _1104 : _3149;
    assign _173 = _3151;
    always @(posedge _294) begin
        if (_292)
            g_bitpos <= _1104;
        else
            g_bitpos <= _173;
    end
    always @* begin
        case (g_bitpos)
        0:
            _3125 <= _3117;
        1:
            _3125 <= _3118;
        2:
            _3125 <= _3119;
        3:
            _3125 <= _3120;
        4:
            _3125 <= _3121;
        5:
            _3125 <= _3122;
        6:
            _3125 <= _3123;
        default:
            _3125 <= _3124;
        endcase
    end
    assign _175 = host_lane1_crc_inv;
    assign _177 = host_lane1_init;
    assign _3193 = g_crc[30:0];
    assign _3195 = { _3193,
                     _1096 };
    assign _3187 = g_crc[31:31];
    assign _3188 = _1612 ^ _3187;
    assign _3190 = _3188 ? _182 : _2057;
    assign _3184 = g_crc[30:0];
    assign _3186 = { _3184,
                     _1096 };
    assign _3191 = _3186 ^ _3190;
    assign _3192 = _1715 ? _3191 : _3183;
    assign _179 = host_lane1_crc_width;
    assign _3161 = g_left - _2914;
    assign _3162 = _2899 ? _3161 : _3159;
    assign _3163 = _1709 ? _3162 : _3159;
    assign _3164 = _1621 ? _3159 : _3163;
    assign _3155 = g_left - _2914;
    assign _3156 = g_data_left ? g_left : _3155;
    assign _3157 = _1606 ? g_left : _3156;
    assign _3158 = _1742 ? _3157 : g_left;
    assign _3159 = _1734 ? _3158 : g_left;
    assign _3165 = _1576 ? _3164 : _3159;
    assign _3166 = _3153 ? _179 : _3165;
    assign _3168 = _1475 ? _1227 : _3166;
    assign _180 = _3168;
    always @(posedge _294) begin
        if (_292)
            g_left <= _1227;
        else
            g_left <= _180;
    end
    assign _1740 = g_left == _1227;
    assign _1741 = ~ _1740;
    assign _2897 = ~ g_data_left;
    assign _2896 = _1576 & _1709;
    assign _2898 = _2896 & _2897;
    assign _2899 = _2898 & _1741;
    assign _3196 = _2899 ? _3195 : _3192;
    assign _3197 = _1709 ? _3196 : _3183;
    assign _3198 = _1621 ? _3183 : _3197;
    assign _182 = host_lane1_poly;
    assign _3175 = g_crc[31:31];
    assign _3176 = _3127 ^ _3175;
    assign _3178 = _3176 ? _182 : _2057;
    assign _3172 = g_crc[30:0];
    assign _3174 = { _3172,
                     _1096 };
    assign _3179 = _3174 ^ _3178;
    assign _3169 = g_crc[30:0];
    assign _3171 = { _3169,
                     _1096 };
    assign _3180 = g_data_left ? _3179 : _3171;
    assign _3181 = _1606 ? g_crc : _3180;
    assign _3182 = _1742 ? _3181 : g_crc;
    assign _3183 = _1734 ? _3182 : g_crc;
    assign _3199 = _1576 ? _3198 : _3183;
    assign _3200 = _1475 ? _177 : _3199;
    assign _3202 = _1473 ? _2057 : _3200;
    assign _183 = _3202;
    always @(posedge _294) begin
        if (_292)
            g_crc <= _2057;
        else
            g_crc <= _183;
    end
    assign _2903 = g_crc[31:31];
    assign _2904 = _2903 ^ _175;
    assign _185 = host_lane1_frame_bits;
    assign _3222 = g_cnt + _4031;
    assign _1710 = _1576 & _1709;
    assign _1715 = _1710 & g_data_left;
    assign _3223 = _1715 ? _3222 : _3220;
    assign _1709 = ~ _1606;
    assign _3224 = _1709 ? _3223 : _3220;
    assign _3205 = _1621 ? _3204 : _1612;
    assign _3203 = _1742 ? _3127 : g_last;
    assign _3204 = _1734 ? _3203 : g_last;
    assign _3206 = _1576 ? _3205 : _3204;
    assign _3208 = _1475 ? _1896 : _3206;
    assign _186 = _3208;
    always @(posedge _294) begin
        if (_292)
            g_last <= vdd;
        else
            g_last <= _186;
    end
    assign _1617 = ~ g_last;
    assign _1614 = _191 == _1244;
    assign _1618 = _1614 ? _1617 : gnd;
    assign _3210 = _207 == _1244;
    assign _3211 = _3210 ? _1487 : g_prev;
    assign _3212 = _1576 ? _3211 : g_prev;
    assign _3214 = _1475 ? _1896 : _3212;
    assign _187 = _3214;
    always @(posedge _294) begin
        if (_292)
            g_prev <= vdd;
        else
            g_prev <= _187;
    end
    assign _1611 = _1487 == g_prev;
    assign _1608 = _207 == _1244;
    assign _1612 = _1608 ? _1611 : _1487;
    assign _1619 = _1612 == _1618;
    assign _1620 = ~ _1619;
    assign _1621 = _1606 & _1620;
    assign _3225 = _1621 ? _3220 : _3224;
    assign _3216 = g_cnt + _4031;
    assign _3217 = g_data_left ? _3216 : g_cnt;
    assign _3218 = _1606 ? g_cnt : _3217;
    assign _3219 = _1742 ? _3218 : g_cnt;
    assign _3220 = _1734 ? _3219 : g_cnt;
    assign _3226 = _1576 ? _3225 : _3220;
    assign _3228 = _1475 ? _1203 : _3226;
    assign _188 = _3228;
    always @(posedge _294) begin
        if (_292)
            g_cnt <= _1203;
        else
            g_cnt <= _188;
    end
    assign g_data_left = g_cnt < _185;
    assign _3126 = g_data_left ? _3125 : _2904;
    assign _3127 = _1606 ? _1618 : _3126;
    assign _3234 = _3127 == g_last;
    assign _3232 = g_run == _1104;
    assign _3233 = ~ _3232;
    assign _3235 = _3233 & _3234;
    assign _3239 = _3235 ? _3238 : _1464;
    assign _3230 = _191 == _1245;
    assign _3244 = _3230 ? _3243 : _3239;
    assign _3245 = _1742 ? _3244 : g_run;
    assign _3246 = _1734 ? _3245 : g_run;
    assign _3264 = _1576 ? _3263 : _3246;
    assign _3266 = _1475 ? _1104 : _3264;
    assign _189 = _3266;
    always @(posedge _294) begin
        if (_292)
            g_run <= _1104;
        else
            g_run <= _189;
    end
    assign _1605 = g_run == _169;
    assign _191 = host_lane1_stuff;
    assign _1600 = _191 == _2544;
    assign _1601 = ~ _1600;
    assign _1606 = _1601 & _1605;
    assign _1735 = _1606 | g_data_left;
    assign _1742 = _1735 | _1741;
    assign _3280 = _1742 ? _3279 : _1896;
    assign _3281 = _1734 ? _3280 : f_lane1_out;
    assign _1730 = _1546 == _1203;
    assign _1728 = _1511 == _1203;
    assign _1731 = _1539 ? _1730 : _1728;
    assign _1732 = _1507 ? vdd : _1731;
    assign _1733 = _211 ? _1574 : _1732;
    assign _3273 = ~ _1733;
    assign _3270 = _207 == _1245;
    assign _3267 = ~ _213;
    assign _3268 = _1477 & _3267;
    assign _3271 = _3268 & _3270;
    assign _3272 = _3271 & _1575;
    assign _3274 = _3272 & _3273;
    assign _3282 = _3274 ? _3046 : _3281;
    assign _3284 = _1591 ? _1896 : _3282;
    assign _3286 = _1723 ? _1896 : _3284;
    assign _3288 = _1475 ? _1896 : _3286;
    assign _3290 = _1473 ? _1896 : _3288;
    assign _192 = _3290;
    always @(posedge _294) begin
        if (_292)
            f_lane1_out <= vdd;
        else
            f_lane1_out <= _192;
    end
    assign _1589 = _1487 == f_lane1_out;
    assign _1590 = ~ _1589;
    assign _1583 = _207 == _1245;
    assign _1584 = ~ _1583;
    assign _1580 = ~ _211;
    assign _194 = host_lane1_readback;
    assign _1577 = ~ _213;
    assign _1578 = _1477 & _1577;
    assign _1579 = _1578 & _194;
    assign _1581 = _1579 & _1580;
    assign _1585 = _1581 & _1584;
    assign _1586 = _1585 & _1575;
    assign _1591 = _1586 & _1590;
    assign _3355 = _1591 ? _2544 : _3353;
    assign _1572 = ~ _1560;
    assign _1573 = _1569 & _1572;
    assign _1568 = _355[7:7];
    assign _1567 = _355[6:6];
    assign _1566 = _355[5:5];
    assign _1565 = _355[4:4];
    assign _1564 = _355[3:3];
    assign _1563 = _355[2:2];
    assign _1562 = _355[1:1];
    assign _1561 = _355[0:0];
    always @* begin
        case (_196)
        0:
            _1569 <= _1561;
        1:
            _1569 <= _1562;
        2:
            _1569 <= _1563;
        3:
            _1569 <= _1564;
        4:
            _1569 <= _1565;
        5:
            _1569 <= _1566;
        6:
            _1569 <= _1567;
        default:
            _1569 <= _1568;
        endcase
    end
    assign _1570 = ~ _1569;
    assign _1559 = _339[7:7];
    assign _1558 = _339[6:6];
    assign _1557 = _339[5:5];
    assign _1556 = _339[4:4];
    assign _1555 = _339[3:3];
    assign _1554 = _339[2:2];
    assign _1553 = _339[1:1];
    assign _1552 = _339[0:0];
    assign _196 = host_lane1_clk_pin;
    always @* begin
        case (_196)
        0:
            _1560 <= _1552;
        1:
            _1560 <= _1553;
        2:
            _1560 <= _1554;
        3:
            _1560 <= _1555;
        4:
            _1560 <= _1556;
        5:
            _1560 <= _1557;
        6:
            _1560 <= _1558;
        default:
            _1560 <= _1559;
        endcase
    end
    assign _1571 = _1560 & _1570;
    assign _198 = host_lane1_clk_edge;
    assign _1574 = _198 ? _1573 : _1571;
    assign _1550 = _1535 == _1203;
    assign _1547 = _1546 == _1535;
    assign _1540 = _1511 == _1535;
    assign _1538 = ~ _1502;
    assign _1529 = _200[15:2];
    assign _1530 = { _2544,
                     _1529 };
    assign _1526 = _200[15:1];
    assign _1527 = { _1096,
                     _1526 };
    assign _1531 = _1527 + _1530;
    assign _1523 = _200[15:1];
    assign _1524 = { _1096,
                     _1523 };
    assign _1521 = _213 & _1504;
    assign _1532 = _1521 ? _1531 : _1524;
    always @(posedge _294) begin
        if (_292)
            _1535 <= _1203;
        else
            _1535 <= _1532;
    end
    assign _1536 = _1511 < _1535;
    assign _1513 = _200[15:2];
    assign _1514 = { _2544,
                     _1513 };
    always @(posedge _294) begin
        if (_292)
            _1517 <= _1203;
        else
            _1517 <= _1514;
    end
    assign _3336 = ~ _1502;
    assign _3337 = _1537 & _3336;
    assign _3338 = _3337 ? _1546 : _1511;
    assign _3340 = _1507 ? _1203 : _3338;
    assign _3342 = _3340 + _4031;
    assign _3320 = _3314 == _1163;
    assign _1542 = _200[15:1];
    assign _1543 = { _1096,
                     _1542 };
    always @(posedge _294) begin
        if (_292)
            _1546 <= _1203;
        else
            _1546 <= _1543;
    end
    assign _3316 = { gnd,
                     _1546 };
    assign _3317 = _3316 == _3314;
    assign _3310 = { gnd,
                     _200 };
    always @(posedge _294) begin
        if (_292)
            _3313 <= _1163;
        else
            _3313 <= _3310;
    end
    assign _3305 = 17'b00000000000000001;
    assign _200 = host_lane1_div_int;
    assign _3304 = { gnd,
                     _200 };
    assign _3306 = _3304 - _3305;
    always @(posedge _294) begin
        if (_292)
            _3309 <= _1163;
        else
            _3309 <= _3306;
    end
    assign _202 = host_lane1_div_frac;
    assign _3324 = { gnd,
                     _202 };
    assign _3326 = _3325[7:0];
    assign _3327 = _3322 ? _3326 : _3298;
    assign _3328 = _3295 ? _3327 : _3298;
    assign _3330 = _1475 ? _1253 : _3328;
    assign _203 = _3330;
    always @(posedge _294) begin
        if (_292)
            _3298 <= _1253;
        else
            _3298 <= _203;
    end
    assign _3323 = { gnd,
                     _3298 };
    assign _3325 = _3323 + _3324;
    assign _3331 = _3325[8:8];
    assign _3332 = _3322 ? _3331 : _3303;
    assign _3333 = _3295 ? _3332 : _3303;
    assign _3335 = _1475 ? _1096 : _3333;
    assign _204 = _3335;
    always @(posedge _294) begin
        if (_292)
            _3303 <= _1096;
        else
            _3303 <= _204;
    end
    assign _3314 = _3303 ? _3313 : _3309;
    assign _3300 = { gnd,
                     _1511 };
    assign _3315 = _3300 == _3314;
    assign _3318 = _1539 ? _3317 : _3315;
    assign _3321 = _1507 ? _3320 : _3318;
    assign _3299 = ~ _211;
    assign _3322 = _3299 & _3321;
    assign _3344 = _3322 ? _1203 : _3342;
    assign _3294 = ~ _211;
    assign _3292 = _1502 & _1500;
    assign _656 = g_mode == _2026;
    assign _3291 = _1477 | _656;
    assign _3293 = _3291 | _3292;
    assign _3295 = _3293 & _3294;
    assign _3345 = _3295 ? _3344 : _1511;
    assign _3347 = _1475 ? _1203 : _3345;
    assign _205 = _3347;
    always @(posedge _294) begin
        if (_292)
            _1511 <= _1203;
        else
            _1511 <= _205;
    end
    assign _1518 = _1511 < _1517;
    assign _1519 = ~ _1518;
    assign _1508 = _1500 & _1504;
    assign _1520 = _1508 & _1519;
    assign _1537 = _1520 & _1536;
    assign _1539 = _1537 & _1538;
    assign _1548 = _1539 ? _1547 : _1540;
    assign _207 = host_lane1_code;
    assign _1504 = _207 == _1245;
    assign _1505 = ~ _1504;
    assign _1502 = g_mode == _1244;
    assign _1506 = _1502 | _1505;
    assign _1499 = ~ _211;
    assign _1495 = _355[7:7];
    assign _1494 = _355[6:6];
    assign _1493 = _355[5:5];
    assign _1492 = _355[4:4];
    assign _1491 = _355[3:3];
    assign _1490 = _355[2:2];
    assign _1489 = _355[1:1];
    assign _1488 = _355[0:0];
    always @* begin
        case (_209)
        0:
            _1496 <= _1488;
        1:
            _1496 <= _1489;
        2:
            _1496 <= _1490;
        3:
            _1496 <= _1491;
        4:
            _1496 <= _1492;
        5:
            _1496 <= _1493;
        6:
            _1496 <= _1494;
        default:
            _1496 <= _1495;
        endcase
    end
    assign _1486 = _339[7:7];
    assign _1485 = _339[6:6];
    assign _1484 = _339[5:5];
    assign _1483 = _339[4:4];
    assign _1482 = _339[3:3];
    assign _1481 = _339[2:2];
    assign _1480 = _339[1:1];
    assign _1479 = _339[0:0];
    assign _209 = host_lane1_data_pin;
    always @* begin
        case (_209)
        0:
            _1487 <= _1479;
        1:
            _1487 <= _1480;
        2:
            _1487 <= _1481;
        3:
            _1487 <= _1482;
        4:
            _1487 <= _1483;
        5:
            _1487 <= _1484;
        6:
            _1487 <= _1485;
        default:
            _1487 <= _1486;
        endcase
    end
    assign _1497 = _1487 ^ _1496;
    assign _1498 = _213 & _1497;
    assign _1500 = _1498 & _1499;
    assign _1507 = _1500 & _1506;
    assign _1551 = _1507 ? _1550 : _1548;
    assign _211 = host_lane1_clk_pin_en;
    assign _1575 = _211 ? _1574 : _1551;
    assign _213 = host_lane1_dir;
    assign _1478 = _1477 & _213;
    assign _1576 = _1478 & _1575;
    assign _3407 = _1576 ? _3406 : _3355;
    assign _1723 = _266 == _2419;
    assign _3409 = _1723 ? _2544 : _3407;
    assign _3153 = _266 == _2425;
    assign _3416 = _3153 ? _3415 : _3409;
    assign _1475 = _266 == _1930;
    assign _3422 = _1475 ? _3421 : _3416;
    assign _1472 = _266 == _1301;
    assign _1473 = _1472 | _301;
    assign _3424 = _1473 ? _2544 : _3422;
    assign _214 = _3424;
    always @(posedge _294) begin
        if (_292)
            g_mode <= _2544;
        else
            g_mode <= _214;
    end
    assign _1477 = g_mode == _1245;
    assign _1726 = _1477 & _1725;
    assign _1734 = _1726 & _1733;
    assign _1888 = _1734 & _1887;
    assign _1890 = _1888 & _1889;
    assign _1881 = ~ _628;
    assign _1648 = ~ _265;
    assign _3753 = ~ _263;
    assign _3754 = _265 & _3753;
    assign _3757 = _3754 ? _1244 : _1245;
    assign _3746 = ~ _1665;
    assign _3747 = _1657 & _3746;
    assign _3748 = _642 | _3747;
    assign _3749 = _3748 | _3738;
    assign _3751 = _3749 ? _1245 : _3745;
    assign _3732 = g_run_0 + _1464;
    assign _3729 = g_run_0 + _1464;
    assign _3725 = vdd == g_last_0;
    assign _3723 = g_run_0 == _1104;
    assign _3724 = ~ _3723;
    assign _3726 = _3724 & _3725;
    assign _3730 = _3726 ? _3729 : _1464;
    assign _3721 = _243 == _1245;
    assign _3733 = _3721 ? _3732 : _3730;
    assign _3734 = _3733 == _217;
    assign _3715 = g_run_0 + _1464;
    assign _3711 = gnd == g_last_0;
    assign _3709 = g_run_0 == _1104;
    assign _3710 = ~ _3709;
    assign _3712 = _3710 & _3711;
    assign _3716 = _3712 ? _3715 : _1464;
    assign _3707 = _243 == _1245;
    assign _3718 = _3707 ? _1104 : _3716;
    assign _3719 = _3718 == _217;
    assign _3735 = _1454 ? _3734 : _3719;
    assign _3736 = _1443 & _3735;
    assign _3737 = ~ _3736;
    assign _3703 = g_left_0 == _2914;
    assign _3701 = g_left_0 == _1227;
    assign _3704 = _2964 ? _3703 : _3701;
    assign _3696 = g_cnt_0 + _4031;
    assign _3697 = _3696 == _237;
    assign _3694 = g_cnt_0 == _237;
    assign _3698 = _1638 ? _3697 : _3694;
    assign _3692 = ~ _1463;
    assign _3693 = _1418 & _3692;
    assign _3699 = _3693 & _3698;
    assign _3705 = _3699 & _3704;
    assign _3738 = _3705 & _3737;
    assign _3740 = _3738 ? _2026 : _3691;
    assign _3742 = _1463 ? _2544 : _3740;
    assign _3688 = _1665 ? _3686 : _2026;
    assign _3684 = _1344 & _1342;
    assign _3686 = _3684 ? _1245 : g_mode_0;
    assign _3689 = _1657 ? _3688 : _3686;
    assign _3452 = _1665 ? _3451 : _3427;
    assign _3453 = _1657 ? _3452 : _3427;
    assign _215 = _3453;
    always @(posedge _294) begin
        if (_292)
            _3427 <= _1096;
        else
            _3427 <= _215;
    end
    assign _3610 = ~ _3451;
    assign _3608 = ~ f_lane0_out;
    assign _3609 = _3451 ? f_lane0_out : _3608;
    always @* begin
        case (_259)
        0:
            _3611 <= _3451;
        1:
            _3611 <= _3609;
        2:
            _3611 <= _3610;
        default:
            _3611 <= _3451;
        endcase
    end
    assign _217 = host_lane0_stuff_len;
    assign _3592 = g_run_0 + _1464;
    assign _3593 = _1454 ? _3592 : _1104;
    assign _3588 = g_run_0 + _1464;
    assign _3584 = _1454 == g_last_0;
    assign _3582 = g_run_0 == _1104;
    assign _3583 = ~ _3582;
    assign _3585 = _3583 & _3584;
    assign _3589 = _3585 ? _3588 : _1464;
    assign _3580 = _243 == _1245;
    assign _3594 = _3580 ? _3593 : _3589;
    assign _3595 = _1463 ? _3578 : _3594;
    assign _3574 = g_run_0 + _1464;
    assign _3575 = _3451 ? _3574 : _1104;
    assign _3570 = g_run_0 + _1464;
    assign _3448 = _3440[7:7];
    assign _3447 = _3440[6:6];
    assign _3446 = _3440[5:5];
    assign _3445 = _3440[4:4];
    assign _3444 = _3440[3:3];
    assign _3443 = _3440[2:2];
    assign _3442 = _3440[1:1];
    assign _3438 = _3430[7:7];
    assign _3437 = _3430[6:6];
    assign _3436 = _3430[5:5];
    assign _3435 = _3430[4:4];
    assign _3434 = _3430[3:3];
    assign _3433 = _3430[2:2];
    assign _3432 = _3430[1:1];
    assign _3100 = _3056 == _2425;
    assign _3101 = _3053 & _3100;
    always @(posedge _294) begin
        if (_292)
            _3102 <= _1253;
        else
            if (_3101)
                _3102 <= _220;
    end
    assign _3094 = _3056 == _2419;
    assign _3095 = _3053 & _3094;
    always @(posedge _294) begin
        if (_292)
            _3096 <= _1253;
        else
            if (_3095)
                _3096 <= _220;
    end
    assign _3088 = _3056 == _1930;
    assign _3089 = _3053 & _3088;
    always @(posedge _294) begin
        if (_292)
            _3090 <= _1253;
        else
            if (_3089)
                _3090 <= _220;
    end
    assign _3082 = _3056 == _1301;
    assign _3083 = _3053 & _3082;
    always @(posedge _294) begin
        if (_292)
            _3084 <= _1253;
        else
            if (_3083)
                _3084 <= _220;
    end
    assign _3076 = _3056 == _1932;
    assign _3077 = _3053 & _3076;
    always @(posedge _294) begin
        if (_292)
            _3078 <= _1253;
        else
            if (_3077)
                _3078 <= _220;
    end
    assign _3070 = _3056 == _1437;
    assign _3071 = _3053 & _3070;
    always @(posedge _294) begin
        if (_292)
            _3072 <= _1253;
        else
            if (_3071)
                _3072 <= _220;
    end
    assign _3064 = _3056 == _1464;
    assign _3065 = _3053 & _3064;
    always @(posedge _294) begin
        if (_292)
            _3066 <= _1253;
        else
            if (_3065)
                _3066 <= _220;
    end
    assign _3455 = _3056 + _1464;
    assign _3456 = _3053 ? _3455 : _3056;
    assign _218 = _3456;
    always @(posedge _294) begin
        if (_292)
            _3056 <= _1104;
        else
            _3056 <= _218;
    end
    assign _3058 = _3056 == _1104;
    assign _3059 = _3053 & _3058;
    assign _220 = host_tx_data;
    always @(posedge _294) begin
        if (_292)
            _3060 <= _1253;
        else
            if (_3059)
                _3060 <= _220;
    end
    assign _3460 = _3049 + _1464;
    assign _3461 = _3458 ? _3460 : _3049;
    assign _221 = _3461;
    always @(posedge _294) begin
        if (_292)
            _3049 <= _1104;
        else
            _3049 <= _221;
    end
    always @* begin
        case (_3049)
        0:
            _3103 <= _3060;
        1:
            _3103 <= _3066;
        2:
            _3103 <= _3072;
        3:
            _3103 <= _3078;
        4:
            _3103 <= _3084;
        5:
            _3103 <= _3090;
        6:
            _3103 <= _3096;
        default:
            _3103 <= _3102;
        endcase
    end
    assign _3429 = _628 ? _1251 : _3103;
    assign _2476 = g_byte_0[7:1];
    assign _2477 = { _1454,
                     _2476 };
    assign _2474 = g_byte_0[6:0];
    assign _2475 = { _2474,
                     _1454 };
    assign _2478 = _224 ? _2477 : _2475;
    assign _3466 = _1638 ? _2478 : _3465;
    assign _3467 = _1632 ? _3466 : _3465;
    assign _3468 = _1463 ? _3465 : _3467;
    assign _3462 = g_data_left_0 ? _3430 : g_byte_0;
    assign _3463 = _1448 ? g_byte_0 : _3462;
    assign _3464 = _1665 ? _3463 : g_byte_0;
    assign _3465 = _1657 ? _3464 : g_byte_0;
    assign _3469 = _1418 ? _3468 : _3465;
    assign _222 = _3469;
    always @(posedge _294) begin
        if (_292)
            g_byte_0 <= _1253;
        else
            g_byte_0 <= _222;
    end
    assign _1878 = g_bitpos_0 == _1104;
    assign _1875 = ~ _1448;
    assign _1876 = _1875 & g_data_left_0;
    assign _1879 = _1876 & _1878;
    assign _3430 = _1879 ? _3429 : g_byte_0;
    assign _3431 = _3430[0:0];
    assign _3439 = { _3431,
                     _3432,
                     _3433,
                     _3434,
                     _3435,
                     _3436,
                     _3437,
                     _3438 };
    assign _224 = host_lane0_lsb_first;
    assign _3440 = _224 ? _3430 : _3439;
    assign _3441 = _3440[0:0];
    assign _3477 = g_bitpos_0 + _1464;
    assign _3478 = _1638 ? _3477 : _3475;
    assign _3479 = _1632 ? _3478 : _3475;
    assign _3480 = _1463 ? _3475 : _3479;
    assign _3471 = g_bitpos_0 + _1464;
    assign _3472 = g_data_left_0 ? _3471 : g_bitpos_0;
    assign _3473 = _1448 ? g_bitpos_0 : _3472;
    assign _3474 = _1665 ? _3473 : g_bitpos_0;
    assign _3475 = _1657 ? _3474 : g_bitpos_0;
    assign _3481 = _1418 ? _3480 : _3475;
    assign _3483 = _1317 ? _1104 : _3481;
    assign _225 = _3483;
    always @(posedge _294) begin
        if (_292)
            g_bitpos_0 <= _1104;
        else
            g_bitpos_0 <= _225;
    end
    always @* begin
        case (g_bitpos_0)
        0:
            _3449 <= _3441;
        1:
            _3449 <= _3442;
        2:
            _3449 <= _3443;
        3:
            _3449 <= _3444;
        4:
            _3449 <= _3445;
        5:
            _3449 <= _3446;
        6:
            _3449 <= _3447;
        default:
            _3449 <= _3448;
        endcase
    end
    assign _227 = host_lane0_crc_inv;
    assign _229 = host_lane0_init;
    assign _3525 = g_crc_0[30:0];
    assign _3527 = { _3525,
                     _1096 };
    assign _3519 = g_crc_0[31:31];
    assign _3520 = _1454 ^ _3519;
    assign _3522 = _3520 ? _234 : _2057;
    assign _3516 = g_crc_0[30:0];
    assign _3518 = { _3516,
                     _1096 };
    assign _3523 = _3518 ^ _3522;
    assign _3524 = _1638 ? _3523 : _3515;
    assign _231 = host_lane0_crc_width;
    assign _3493 = g_left_0 - _2914;
    assign _3494 = _2964 ? _3493 : _3491;
    assign _3495 = _1632 ? _3494 : _3491;
    assign _3496 = _1463 ? _3491 : _3495;
    assign _3487 = g_left_0 - _2914;
    assign _3488 = g_data_left_0 ? g_left_0 : _3487;
    assign _3489 = _1448 ? g_left_0 : _3488;
    assign _3490 = _1665 ? _3489 : g_left_0;
    assign _3491 = _1657 ? _3490 : g_left_0;
    assign _3497 = _1418 ? _3496 : _3491;
    assign _3498 = _3485 ? _231 : _3497;
    assign _3500 = _1317 ? _1227 : _3498;
    assign _232 = _3500;
    always @(posedge _294) begin
        if (_292)
            g_left_0 <= _1227;
        else
            g_left_0 <= _232;
    end
    assign _1663 = g_left_0 == _1227;
    assign _1664 = ~ _1663;
    assign _2962 = ~ g_data_left_0;
    assign _2961 = _1418 & _1632;
    assign _2963 = _2961 & _2962;
    assign _2964 = _2963 & _1664;
    assign _3528 = _2964 ? _3527 : _3524;
    assign _3529 = _1632 ? _3528 : _3515;
    assign _3530 = _1463 ? _3515 : _3529;
    assign _234 = host_lane0_poly;
    assign _3507 = g_crc_0[31:31];
    assign _3508 = _3451 ^ _3507;
    assign _3510 = _3508 ? _234 : _2057;
    assign _3504 = g_crc_0[30:0];
    assign _3506 = { _3504,
                     _1096 };
    assign _3511 = _3506 ^ _3510;
    assign _3501 = g_crc_0[30:0];
    assign _3503 = { _3501,
                     _1096 };
    assign _3512 = g_data_left_0 ? _3511 : _3503;
    assign _3513 = _1448 ? g_crc_0 : _3512;
    assign _3514 = _1665 ? _3513 : g_crc_0;
    assign _3515 = _1657 ? _3514 : g_crc_0;
    assign _3531 = _1418 ? _3530 : _3515;
    assign _3532 = _1317 ? _229 : _3531;
    assign _3534 = _1315 ? _2057 : _3532;
    assign _235 = _3534;
    always @(posedge _294) begin
        if (_292)
            g_crc_0 <= _2057;
        else
            g_crc_0 <= _235;
    end
    assign _2968 = g_crc_0[31:31];
    assign _2969 = _2968 ^ _227;
    assign _237 = host_lane0_frame_bits;
    assign _3554 = g_cnt_0 + _4031;
    assign _1633 = _1418 & _1632;
    assign _1638 = _1633 & g_data_left_0;
    assign _3555 = _1638 ? _3554 : _3552;
    assign _1632 = ~ _1448;
    assign _3556 = _1632 ? _3555 : _3552;
    assign _3537 = _1463 ? _3536 : _1454;
    assign _3535 = _1665 ? _3451 : g_last_0;
    assign _3536 = _1657 ? _3535 : g_last_0;
    assign _3538 = _1418 ? _3537 : _3536;
    assign _3540 = _1317 ? _1896 : _3538;
    assign _238 = _3540;
    always @(posedge _294) begin
        if (_292)
            g_last_0 <= vdd;
        else
            g_last_0 <= _238;
    end
    assign _1459 = ~ g_last_0;
    assign _1456 = _243 == _1244;
    assign _1460 = _1456 ? _1459 : gnd;
    assign _3542 = _259 == _1244;
    assign _3543 = _3542 ? _1329 : g_prev_0;
    assign _3544 = _1418 ? _3543 : g_prev_0;
    assign _3546 = _1317 ? _1896 : _3544;
    assign _239 = _3546;
    always @(posedge _294) begin
        if (_292)
            g_prev_0 <= vdd;
        else
            g_prev_0 <= _239;
    end
    assign _1453 = _1329 == g_prev_0;
    assign _1450 = _259 == _1244;
    assign _1454 = _1450 ? _1453 : _1329;
    assign _1461 = _1454 == _1460;
    assign _1462 = ~ _1461;
    assign _1463 = _1448 & _1462;
    assign _3557 = _1463 ? _3552 : _3556;
    assign _3548 = g_cnt_0 + _4031;
    assign _3549 = g_data_left_0 ? _3548 : g_cnt_0;
    assign _3550 = _1448 ? g_cnt_0 : _3549;
    assign _3551 = _1665 ? _3550 : g_cnt_0;
    assign _3552 = _1657 ? _3551 : g_cnt_0;
    assign _3558 = _1418 ? _3557 : _3552;
    assign _3560 = _1317 ? _1203 : _3558;
    assign _240 = _3560;
    always @(posedge _294) begin
        if (_292)
            g_cnt_0 <= _1203;
        else
            g_cnt_0 <= _240;
    end
    assign g_data_left_0 = g_cnt_0 < _237;
    assign _3450 = g_data_left_0 ? _3449 : _2969;
    assign _3451 = _1448 ? _1460 : _3450;
    assign _3566 = _3451 == g_last_0;
    assign _3564 = g_run_0 == _1104;
    assign _3565 = ~ _3564;
    assign _3567 = _3565 & _3566;
    assign _3571 = _3567 ? _3570 : _1464;
    assign _3562 = _243 == _1245;
    assign _3576 = _3562 ? _3575 : _3571;
    assign _3577 = _1665 ? _3576 : g_run_0;
    assign _3578 = _1657 ? _3577 : g_run_0;
    assign _3596 = _1418 ? _3595 : _3578;
    assign _3598 = _1317 ? _1104 : _3596;
    assign _241 = _3598;
    always @(posedge _294) begin
        if (_292)
            g_run_0 <= _1104;
        else
            g_run_0 <= _241;
    end
    assign _1447 = g_run_0 == _217;
    assign _243 = host_lane0_stuff;
    assign _1442 = _243 == _2544;
    assign _1443 = ~ _1442;
    assign _1448 = _1443 & _1447;
    assign _1658 = _1448 | g_data_left_0;
    assign _1665 = _1658 | _1664;
    assign _3612 = _1665 ? _3611 : _1896;
    assign _3613 = _1657 ? _3612 : f_lane0_out;
    assign _1653 = _1388 == _1203;
    assign _1651 = _1353 == _1203;
    assign _1654 = _1381 ? _1653 : _1651;
    assign _1655 = _1349 ? vdd : _1654;
    assign _1656 = _263 ? _1416 : _1655;
    assign _3605 = ~ _1656;
    assign _3602 = _259 == _1245;
    assign _3599 = ~ _265;
    assign _3600 = _1319 & _3599;
    assign _3603 = _3600 & _3602;
    assign _3604 = _3603 & _1417;
    assign _3606 = _3604 & _3605;
    assign _3614 = _3606 ? _3427 : _3613;
    assign _3616 = _1433 ? _1896 : _3614;
    assign _3618 = _1646 ? _1896 : _3616;
    assign _3620 = _1317 ? _1896 : _3618;
    assign _3622 = _1315 ? _1896 : _3620;
    assign _244 = _3622;
    always @(posedge _294) begin
        if (_292)
            f_lane0_out <= vdd;
        else
            f_lane0_out <= _244;
    end
    assign _1431 = _1329 == f_lane0_out;
    assign _1432 = ~ _1431;
    assign _1425 = _259 == _1245;
    assign _1426 = ~ _1425;
    assign _1422 = ~ _263;
    assign _246 = host_lane0_readback;
    assign _1419 = ~ _265;
    assign _1420 = _1319 & _1419;
    assign _1421 = _1420 & _246;
    assign _1423 = _1421 & _1422;
    assign _1427 = _1423 & _1426;
    assign _1428 = _1427 & _1417;
    assign _1433 = _1428 & _1432;
    assign _3691 = _1433 ? _2544 : _3689;
    assign _1414 = ~ _1402;
    assign _1415 = _1411 & _1414;
    assign _1410 = _355[7:7];
    assign _1409 = _355[6:6];
    assign _1408 = _355[5:5];
    assign _1407 = _355[4:4];
    assign _1406 = _355[3:3];
    assign _1405 = _355[2:2];
    assign _1404 = _355[1:1];
    assign _1403 = _355[0:0];
    always @* begin
        case (_248)
        0:
            _1411 <= _1403;
        1:
            _1411 <= _1404;
        2:
            _1411 <= _1405;
        3:
            _1411 <= _1406;
        4:
            _1411 <= _1407;
        5:
            _1411 <= _1408;
        6:
            _1411 <= _1409;
        default:
            _1411 <= _1410;
        endcase
    end
    assign _1412 = ~ _1411;
    assign _1401 = _339[7:7];
    assign _1400 = _339[6:6];
    assign _1399 = _339[5:5];
    assign _1398 = _339[4:4];
    assign _1397 = _339[3:3];
    assign _1396 = _339[2:2];
    assign _1395 = _339[1:1];
    assign _1394 = _339[0:0];
    assign _248 = host_lane0_clk_pin;
    always @* begin
        case (_248)
        0:
            _1402 <= _1394;
        1:
            _1402 <= _1395;
        2:
            _1402 <= _1396;
        3:
            _1402 <= _1397;
        4:
            _1402 <= _1398;
        5:
            _1402 <= _1399;
        6:
            _1402 <= _1400;
        default:
            _1402 <= _1401;
        endcase
    end
    assign _1413 = _1402 & _1412;
    assign _250 = host_lane0_clk_edge;
    assign _1416 = _250 ? _1415 : _1413;
    assign _1392 = _1377 == _1203;
    assign _1389 = _1388 == _1377;
    assign _1382 = _1353 == _1377;
    assign _1380 = ~ _1344;
    assign _1371 = _252[15:2];
    assign _1372 = { _2544,
                     _1371 };
    assign _1368 = _252[15:1];
    assign _1369 = { _1096,
                     _1368 };
    assign _1373 = _1369 + _1372;
    assign _1365 = _252[15:1];
    assign _1366 = { _1096,
                     _1365 };
    assign _1363 = _265 & _1346;
    assign _1374 = _1363 ? _1373 : _1366;
    always @(posedge _294) begin
        if (_292)
            _1377 <= _1203;
        else
            _1377 <= _1374;
    end
    assign _1378 = _1353 < _1377;
    assign _1355 = _252[15:2];
    assign _1356 = { _2544,
                     _1355 };
    always @(posedge _294) begin
        if (_292)
            _1359 <= _1203;
        else
            _1359 <= _1356;
    end
    assign _3668 = ~ _1344;
    assign _3669 = _1379 & _3668;
    assign _3670 = _3669 ? _1388 : _1353;
    assign _3672 = _1349 ? _1203 : _3670;
    assign _3674 = _3672 + _4031;
    assign _3652 = _3646 == _1163;
    assign _1384 = _252[15:1];
    assign _1385 = { _1096,
                     _1384 };
    always @(posedge _294) begin
        if (_292)
            _1388 <= _1203;
        else
            _1388 <= _1385;
    end
    assign _3648 = { gnd,
                     _1388 };
    assign _3649 = _3648 == _3646;
    assign _3642 = { gnd,
                     _252 };
    always @(posedge _294) begin
        if (_292)
            _3645 <= _1163;
        else
            _3645 <= _3642;
    end
    assign _252 = host_lane0_div_int;
    assign _3636 = { gnd,
                     _252 };
    assign _3638 = _3636 - _3305;
    always @(posedge _294) begin
        if (_292)
            _3641 <= _1163;
        else
            _3641 <= _3638;
    end
    assign _254 = host_lane0_div_frac;
    assign _3656 = { gnd,
                     _254 };
    assign _3658 = _3657[7:0];
    assign _3659 = _3654 ? _3658 : _3630;
    assign _3660 = _3627 ? _3659 : _3630;
    assign _3662 = _1317 ? _1253 : _3660;
    assign _255 = _3662;
    always @(posedge _294) begin
        if (_292)
            _3630 <= _1253;
        else
            _3630 <= _255;
    end
    assign _3655 = { gnd,
                     _3630 };
    assign _3657 = _3655 + _3656;
    assign _3663 = _3657[8:8];
    assign _3664 = _3654 ? _3663 : _3635;
    assign _3665 = _3627 ? _3664 : _3635;
    assign _3667 = _1317 ? _1096 : _3665;
    assign _256 = _3667;
    always @(posedge _294) begin
        if (_292)
            _3635 <= _1096;
        else
            _3635 <= _256;
    end
    assign _3646 = _3635 ? _3645 : _3641;
    assign _3632 = { gnd,
                     _1353 };
    assign _3647 = _3632 == _3646;
    assign _3650 = _1381 ? _3649 : _3647;
    assign _3653 = _1349 ? _3652 : _3650;
    assign _3631 = ~ _263;
    assign _3654 = _3631 & _3653;
    assign _3676 = _3654 ? _1203 : _3674;
    assign _3626 = ~ _263;
    assign _3624 = _1344 & _1342;
    assign _642 = g_mode_0 == _2026;
    assign _3623 = _1319 | _642;
    assign _3625 = _3623 | _3624;
    assign _3627 = _3625 & _3626;
    assign _3677 = _3627 ? _3676 : _1353;
    assign _3679 = _1317 ? _1203 : _3677;
    assign _257 = _3679;
    always @(posedge _294) begin
        if (_292)
            _1353 <= _1203;
        else
            _1353 <= _257;
    end
    assign _1360 = _1353 < _1359;
    assign _1361 = ~ _1360;
    assign _1350 = _1342 & _1346;
    assign _1362 = _1350 & _1361;
    assign _1379 = _1362 & _1378;
    assign _1381 = _1379 & _1380;
    assign _1390 = _1381 ? _1389 : _1382;
    assign _259 = host_lane0_code;
    assign _1346 = _259 == _1245;
    assign _1347 = ~ _1346;
    assign _1344 = g_mode_0 == _1244;
    assign _1348 = _1344 | _1347;
    assign _1341 = ~ _263;
    assign _1337 = _355[7:7];
    assign _1336 = _355[6:6];
    assign _1335 = _355[5:5];
    assign _1334 = _355[4:4];
    assign _1333 = _355[3:3];
    assign _1332 = _355[2:2];
    assign _1331 = _355[1:1];
    assign _1330 = _355[0:0];
    always @* begin
        case (_261)
        0:
            _1338 <= _1330;
        1:
            _1338 <= _1331;
        2:
            _1338 <= _1332;
        3:
            _1338 <= _1333;
        4:
            _1338 <= _1334;
        5:
            _1338 <= _1335;
        6:
            _1338 <= _1336;
        default:
            _1338 <= _1337;
        endcase
    end
    assign _1328 = _339[7:7];
    assign _1327 = _339[6:6];
    assign _1326 = _339[5:5];
    assign _1325 = _339[4:4];
    assign _1324 = _339[3:3];
    assign _1323 = _339[2:2];
    assign _1322 = _339[1:1];
    assign _1321 = _339[0:0];
    assign _261 = host_lane0_data_pin;
    always @* begin
        case (_261)
        0:
            _1329 <= _1321;
        1:
            _1329 <= _1322;
        2:
            _1329 <= _1323;
        3:
            _1329 <= _1324;
        4:
            _1329 <= _1325;
        5:
            _1329 <= _1326;
        6:
            _1329 <= _1327;
        default:
            _1329 <= _1328;
        endcase
    end
    assign _1339 = _1329 ^ _1338;
    assign _1340 = _265 & _1339;
    assign _1342 = _1340 & _1341;
    assign _1349 = _1342 & _1348;
    assign _1393 = _1349 ? _1392 : _1390;
    assign _263 = host_lane0_clk_pin_en;
    assign _1417 = _263 ? _1416 : _1393;
    assign _265 = host_lane0_dir;
    assign _1320 = _1319 & _265;
    assign _1418 = _1320 & _1417;
    assign _3743 = _1418 ? _3742 : _3691;
    assign _1646 = _266 == _1437;
    assign _3745 = _1646 ? _2544 : _3743;
    assign _3485 = _266 == _1932;
    assign _3752 = _3485 ? _3751 : _3745;
    assign _1317 = _266 == _1464;
    assign _3758 = _1317 ? _3757 : _3752;
    assign _2594 = _741[90:88];
    assign _2593 = _735[90:88];
    assign _2592 = _729[90:88];
    assign _2591 = _332[90:88];
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
    assign _2587 = _741[87:87];
    assign _2586 = _735[87:87];
    assign _2585 = _729[87:87];
    assign _2584 = _332[87:87];
    always @* begin
        case (f_winner)
        0:
            _2588 <= _2584;
        1:
            _2588 <= _2585;
        2:
            _2588 <= _2586;
        default:
            _2588 <= _2587;
        endcase
    end
    assign _3680 = ~ _2588;
    assign _3681 = _1220 & _3680;
    assign _3683 = _3681 ? _2595 : _1104;
    assign _266 = _3683;
    assign _1314 = _266 == _1301;
    assign _1315 = _1314 | _301;
    assign _3760 = _1315 ? _2544 : _3758;
    assign _267 = _3760;
    always @(posedge _294) begin
        if (_292)
            g_mode_0 <= _2544;
        else
            g_mode_0 <= _267;
    end
    assign _1319 = g_mode_0 == _1245;
    assign _1649 = _1319 & _1648;
    assign _1657 = _1649 & _1656;
    assign _1880 = _1657 & _1879;
    assign _1882 = _1880 & _1881;
    assign _1891 = _1882 | _1890;
    assign _1872 = _1868 == _1245;
    assign _1870 = _1868 == _1244;
    assign _1873 = _1870 | _1872;
    assign _3761 = _1796 & _1873;
    assign _3762 = _3761 | _1891;
    assign _268 = _3762;
    assign _3458 = _268 & _3457;
    assign _2540 = _271 == _1830;
    assign _3052 = ~ _2540;
    assign _270 = host_tx_push;
    assign _3053 = _270 & _3052;
    assign _3763 = _3053 ^ _3458;
    assign _3769 = _3763 ? _3768 : _271;
    always @(posedge _294) begin
        if (_292)
            _3772 <= _2049;
        else
            _3772 <= _3769;
    end
    assign _271 = _3772;
    assign _628 = _271 == _2049;
    assign _3774 = _628 ? _1251 : _3103;
    assign _1867 = _724[28:27];
    assign _1865 = _741[95:94];
    assign _1864 = _735[95:94];
    assign _1863 = _729[95:94];
    assign _1862 = _332[95:94];
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
    assign _1868 = _1795 ? _1867 : _1866;
    always @* begin
        case (_1868)
        0:
            _3786 <= _621;
        1:
            _3786 <= _3774;
        2:
            _3786 <= _3783;
        default:
            _3786 <= _3785;
        endcase
    end
    assign _3787 = _1796 ? _3786 : _621;
    assign _272 = _3787;
    always @(posedge _294) begin
        if (_292)
            _621 <= _1253;
        else
            _621 <= _272;
    end
    assign _622 = _621[0:0];
    assign _3798 = 8'b00001000;
    assign _3797 = 8'b00000111;
    assign _3796 = _616 - _1701;
    assign _3793 = _724[30:29];
    assign _741 = _331[511:400];
    assign _3791 = _741[99:98];
    assign _735 = _331[399:288];
    assign _3790 = _735[99:98];
    assign _3789 = _729[99:98];
    assign _3788 = _332[99:98];
    always @* begin
        case (f_winner)
        0:
            _3792 <= _3788;
        1:
            _3792 <= _3789;
        2:
            _3792 <= _3790;
        default:
            _3792 <= _3791;
        endcase
    end
    assign _3794 = _1795 ? _3793 : _3792;
    always @* begin
        case (_3794)
        0:
            _3799 <= _616;
        1:
            _3799 <= _3796;
        2:
            _3799 <= _3797;
        default:
            _3799 <= _3798;
        endcase
    end
    assign _3800 = _1796 ? _3799 : _616;
    assign _273 = _3800;
    always @(posedge _294) begin
        if (_292)
            _616 <= _1253;
        else
            _616 <= _273;
    end
    assign _618 = _616 == _1253;
    assign _846 = _729[61:58];
    always @* begin
        case (_846)
        0:
            _847 <= vdd;
        1:
            _847 <= _618;
        2:
            _847 <= _622;
        3:
            _847 <= _626;
        4:
            _847 <= _628;
        5:
            _847 <= _630;
        6:
            _847 <= _634;
        7:
            _847 <= _637;
        8:
            _847 <= _642;
        9:
            _847 <= _645;
        10:
            _847 <= _648;
        11:
            _847 <= _651;
        12:
            _847 <= _656;
        13:
            _847 <= _659;
        14:
            _847 <= _662;
        default:
            _847 <= _665;
        endcase
    end
    assign _849 = _847 ^ _848;
    assign _841 = _729[57:42];
    assign _843 = _841 == _1093;
    assign _832 = _778[57:42];
    assign _833 = { gnd,
                    _832 };
    assign _834 = _833 + _821;
    always @(posedge _294) begin
        if (_292)
            _837 <= _1163;
        else
            _837 <= _834;
    end
    assign _838 = _837 < _777;
    assign _839 = ~ _838;
    assign _828 = _729[41:26];
    assign _830 = _828 == _1203;
    assign _576 = _572 + _1464;
    assign _3815 = _572 + _1464;
    assign _3811 = _572 == _2425;
    assign _3812 = ~ _3811;
    assign _3809 = _352[0:0];
    assign _3813 = _3809 & _3812;
    assign _3816 = _3813 ? _3815 : _572;
    assign _3806 = _352[0:0];
    assign _3807 = ~ _3806;
    assign _3805 = f_chg_now[0:0];
    assign _3808 = _3805 & _3807;
    assign _3818 = _3808 ? _1464 : _3816;
    assign _3802 = _316 == _1245;
    assign _3804 = _3802 ? _1104 : _572;
    assign _3801 = _316 == _1244;
    assign _3819 = _3801 ? _3818 : _3804;
    assign _274 = _3819;
    always @(posedge _294) begin
        if (_292)
            _572 <= _1104;
        else
            _572 <= _274;
    end
    assign _574 = _572 == _2425;
    assign _577 = _574 ? _572 : _576;
    assign _567 = _352[0:0];
    assign _568 = ~ _567;
    assign _566 = f_chg_now[0:0];
    assign _569 = _566 & _568;
    assign _579 = _569 ? _1464 : _577;
    assign _563 = f_changed_all[0:0];
    assign _564 = f_in_fetch & _563;
    assign _580 = _564 ? _579 : _1104;
    assign _812 = _782[0:0];
    assign _814 = _812 ? _580 : _1104;
    assign _555 = _551 + _1464;
    assign _3834 = _551 + _1464;
    assign _3830 = _551 == _2425;
    assign _3831 = ~ _3830;
    assign _3828 = _352[1:1];
    assign _3832 = _3828 & _3831;
    assign _3835 = _3832 ? _3834 : _551;
    assign _3825 = _352[1:1];
    assign _3826 = ~ _3825;
    assign _3824 = f_chg_now[1:1];
    assign _3827 = _3824 & _3826;
    assign _3837 = _3827 ? _1464 : _3835;
    assign _3821 = _316 == _1245;
    assign _3823 = _3821 ? _1104 : _551;
    assign _3820 = _316 == _1244;
    assign _3838 = _3820 ? _3837 : _3823;
    assign _275 = _3838;
    always @(posedge _294) begin
        if (_292)
            _551 <= _1104;
        else
            _551 <= _275;
    end
    assign _553 = _551 == _2425;
    assign _556 = _553 ? _551 : _555;
    assign _546 = _352[1:1];
    assign _547 = ~ _546;
    assign _545 = f_chg_now[1:1];
    assign _548 = _545 & _547;
    assign _558 = _548 ? _1464 : _556;
    assign _542 = f_changed_all[1:1];
    assign _543 = f_in_fetch & _542;
    assign _559 = _543 ? _558 : _1104;
    assign _809 = _782[1:1];
    assign _811 = _809 ? _559 : _1104;
    assign _815 = _811 < _814;
    assign _816 = _815 ? _814 : _811;
    assign _532 = _528 + _1464;
    assign _3853 = _528 + _1464;
    assign _3849 = _528 == _2425;
    assign _3850 = ~ _3849;
    assign _3847 = _352[2:2];
    assign _3851 = _3847 & _3850;
    assign _3854 = _3851 ? _3853 : _528;
    assign _3844 = _352[2:2];
    assign _3845 = ~ _3844;
    assign _3843 = f_chg_now[2:2];
    assign _3846 = _3843 & _3845;
    assign _3856 = _3846 ? _1464 : _3854;
    assign _3840 = _316 == _1245;
    assign _3842 = _3840 ? _1104 : _528;
    assign _3839 = _316 == _1244;
    assign _3857 = _3839 ? _3856 : _3842;
    assign _276 = _3857;
    always @(posedge _294) begin
        if (_292)
            _528 <= _1104;
        else
            _528 <= _276;
    end
    assign _530 = _528 == _2425;
    assign _533 = _530 ? _528 : _532;
    assign _523 = _352[2:2];
    assign _524 = ~ _523;
    assign _522 = f_chg_now[2:2];
    assign _525 = _522 & _524;
    assign _535 = _525 ? _1464 : _533;
    assign _519 = f_changed_all[2:2];
    assign _520 = f_in_fetch & _519;
    assign _536 = _520 ? _535 : _1104;
    assign _804 = _782[2:2];
    assign _806 = _804 ? _536 : _1104;
    assign _511 = _507 + _1464;
    assign _3872 = _507 + _1464;
    assign _3868 = _507 == _2425;
    assign _3869 = ~ _3868;
    assign _3866 = _352[3:3];
    assign _3870 = _3866 & _3869;
    assign _3873 = _3870 ? _3872 : _507;
    assign _3863 = _352[3:3];
    assign _3864 = ~ _3863;
    assign _3862 = f_chg_now[3:3];
    assign _3865 = _3862 & _3864;
    assign _3875 = _3865 ? _1464 : _3873;
    assign _3859 = _316 == _1245;
    assign _3861 = _3859 ? _1104 : _507;
    assign _3858 = _316 == _1244;
    assign _3876 = _3858 ? _3875 : _3861;
    assign _277 = _3876;
    always @(posedge _294) begin
        if (_292)
            _507 <= _1104;
        else
            _507 <= _277;
    end
    assign _509 = _507 == _2425;
    assign _512 = _509 ? _507 : _511;
    assign _502 = _352[3:3];
    assign _503 = ~ _502;
    assign _501 = f_chg_now[3:3];
    assign _504 = _501 & _503;
    assign _514 = _504 ? _1464 : _512;
    assign _498 = f_changed_all[3:3];
    assign _499 = f_in_fetch & _498;
    assign _515 = _499 ? _514 : _1104;
    assign _801 = _782[3:3];
    assign _803 = _801 ? _515 : _1104;
    assign _807 = _803 < _806;
    assign _808 = _807 ? _806 : _803;
    assign _817 = _808 < _816;
    assign _818 = _817 ? _816 : _808;
    assign _486 = _482 + _1464;
    assign _3891 = _482 + _1464;
    assign _3887 = _482 == _2425;
    assign _3888 = ~ _3887;
    assign _3885 = _352[4:4];
    assign _3889 = _3885 & _3888;
    assign _3892 = _3889 ? _3891 : _482;
    assign _3882 = _352[4:4];
    assign _3883 = ~ _3882;
    assign _3881 = f_chg_now[4:4];
    assign _3884 = _3881 & _3883;
    assign _3894 = _3884 ? _1464 : _3892;
    assign _3878 = _316 == _1245;
    assign _3880 = _3878 ? _1104 : _482;
    assign _3877 = _316 == _1244;
    assign _3895 = _3877 ? _3894 : _3880;
    assign _278 = _3895;
    always @(posedge _294) begin
        if (_292)
            _482 <= _1104;
        else
            _482 <= _278;
    end
    assign _484 = _482 == _2425;
    assign _487 = _484 ? _482 : _486;
    assign _477 = _352[4:4];
    assign _478 = ~ _477;
    assign _476 = f_chg_now[4:4];
    assign _479 = _476 & _478;
    assign _489 = _479 ? _1464 : _487;
    assign _473 = f_changed_all[4:4];
    assign _474 = f_in_fetch & _473;
    assign _490 = _474 ? _489 : _1104;
    assign _794 = _782[4:4];
    assign _796 = _794 ? _490 : _1104;
    assign _465 = _461 + _1464;
    assign _3910 = _461 + _1464;
    assign _3906 = _461 == _2425;
    assign _3907 = ~ _3906;
    assign _3904 = _352[5:5];
    assign _3908 = _3904 & _3907;
    assign _3911 = _3908 ? _3910 : _461;
    assign _3901 = _352[5:5];
    assign _3902 = ~ _3901;
    assign _3900 = f_chg_now[5:5];
    assign _3903 = _3900 & _3902;
    assign _3913 = _3903 ? _1464 : _3911;
    assign _3897 = _316 == _1245;
    assign _3899 = _3897 ? _1104 : _461;
    assign _3896 = _316 == _1244;
    assign _3914 = _3896 ? _3913 : _3899;
    assign _279 = _3914;
    always @(posedge _294) begin
        if (_292)
            _461 <= _1104;
        else
            _461 <= _279;
    end
    assign _463 = _461 == _2425;
    assign _466 = _463 ? _461 : _465;
    assign _456 = _352[5:5];
    assign _457 = ~ _456;
    assign _455 = f_chg_now[5:5];
    assign _458 = _455 & _457;
    assign _468 = _458 ? _1464 : _466;
    assign _452 = f_changed_all[5:5];
    assign _453 = f_in_fetch & _452;
    assign _469 = _453 ? _468 : _1104;
    assign _791 = _782[5:5];
    assign _793 = _791 ? _469 : _1104;
    assign _797 = _793 < _796;
    assign _798 = _797 ? _796 : _793;
    assign _442 = _438 + _1464;
    assign _3929 = _438 + _1464;
    assign _3925 = _438 == _2425;
    assign _3926 = ~ _3925;
    assign _3923 = _352[6:6];
    assign _3927 = _3923 & _3926;
    assign _3930 = _3927 ? _3929 : _438;
    assign _3920 = _352[6:6];
    assign _3921 = ~ _3920;
    assign _3919 = f_chg_now[6:6];
    assign _3922 = _3919 & _3921;
    assign _3932 = _3922 ? _1464 : _3930;
    assign _3916 = _316 == _1245;
    assign _3918 = _3916 ? _1104 : _438;
    assign _3915 = _316 == _1244;
    assign _3933 = _3915 ? _3932 : _3918;
    assign _280 = _3933;
    always @(posedge _294) begin
        if (_292)
            _438 <= _1104;
        else
            _438 <= _280;
    end
    assign _440 = _438 == _2425;
    assign _443 = _440 ? _438 : _442;
    assign _433 = _352[6:6];
    assign _434 = ~ _433;
    assign _432 = f_chg_now[6:6];
    assign _435 = _432 & _434;
    assign _445 = _435 ? _1464 : _443;
    assign _429 = f_changed_all[6:6];
    assign _430 = f_in_fetch & _429;
    assign _446 = _430 ? _445 : _1104;
    assign _786 = _782[6:6];
    assign _788 = _786 ? _446 : _1104;
    assign _421 = _417 + _1464;
    assign _3948 = _417 + _1464;
    assign _3944 = _417 == _2425;
    assign _3945 = ~ _3944;
    assign _3942 = _352[7:7];
    assign _3946 = _3942 & _3945;
    assign _3949 = _3946 ? _3948 : _417;
    assign _3939 = _352[7:7];
    assign _3940 = ~ _3939;
    assign _3938 = f_chg_now[7:7];
    assign _3941 = _3938 & _3940;
    assign _3951 = _3941 ? _1464 : _3949;
    assign _3935 = _316 == _1245;
    assign _3937 = _3935 ? _1104 : _417;
    assign _3934 = _316 == _1244;
    assign _3952 = _3934 ? _3951 : _3937;
    assign _281 = _3952;
    always @(posedge _294) begin
        if (_292)
            _417 <= _1104;
        else
            _417 <= _281;
    end
    assign _419 = _417 == _2425;
    assign _422 = _419 ? _417 : _421;
    assign _412 = _352[7:7];
    assign _413 = ~ _412;
    assign _411 = f_chg_now[7:7];
    assign _414 = _411 & _413;
    assign _424 = _414 ? _1464 : _422;
    assign _408 = f_changed_all[7:7];
    assign _409 = f_in_fetch & _408;
    assign _425 = _409 ? _424 : _1104;
    assign _782 = _778[23:16];
    assign _783 = _782[7:7];
    assign _785 = _783 ? _425 : _1104;
    assign _789 = _785 < _788;
    assign _790 = _789 ? _788 : _785;
    assign _799 = _790 < _798;
    assign _800 = _799 ? _798 : _790;
    assign _819 = _800 < _818;
    assign _820 = _819 ? _818 : _800;
    assign _821 = { _1147,
                    _820 };
    assign _3955 = _383 == _1464;
    assign _3956 = _3955 ? _286 : _330;
    assign _3953 = _316 == _1244;
    assign _3957 = _3953 ? _3956 : _330;
    assign _282 = _3957;
    always @(posedge _294) begin
        if (_292)
            _330 <= _320;
        else
            _330 <= _282;
    end
    assign _397 = _383 == _1464;
    assign _398 = f_in_fetch & _397;
    assign _399 = _398 ? _286 : _330;
    assign _3960 = _383 == _1437;
    assign _3961 = _3960 ? _286 : _327;
    assign _3958 = _316 == _1244;
    assign _3962 = _3958 ? _3961 : _327;
    assign _283 = _3962;
    always @(posedge _294) begin
        if (_292)
            _327 <= _320;
        else
            _327 <= _283;
    end
    assign _393 = _383 == _1437;
    assign _394 = f_in_fetch & _393;
    assign _395 = _394 ? _286 : _327;
    assign _3965 = _383 == _1932;
    assign _3966 = _3965 ? _286 : _324;
    assign _3963 = _316 == _1244;
    assign _3967 = _3963 ? _3966 : _324;
    assign _284 = _3967;
    always @(posedge _294) begin
        if (_292)
            _324 <= _320;
        else
            _324 <= _284;
    end
    assign _389 = _383 == _1932;
    assign _390 = f_in_fetch & _389;
    assign _391 = _390 ? _286 : _324;
    assign _286 = ram_rec_rdata;
    assign _385 = _383 == _1301;
    assign _386 = f_in_fetch & _385;
    assign _387 = _386 ? _286 : _321;
    assign _400 = { _387,
                    _391,
                    _395,
                    _399 };
    assign _778 = _400[287:176];
    assign _779 = _778[41:26];
    assign _780 = { gnd,
                    _779 };
    assign _822 = _780 + _821;
    always @(posedge _294) begin
        if (_292)
            _825 <= _1163;
        else
            _825 <= _822;
    end
    assign gnd = 1'b0;
    assign _777 = { gnd,
                    _774 };
    assign _826 = _777 < _825;
    assign _827 = ~ _826;
    assign _831 = _827 | _830;
    assign _840 = _831 & _839;
    assign _3995 = _373 + _4031;
    assign _3991 = _373 == _1093;
    assign _3992 = ~ _3991;
    assign _3993 = _3989 & _3992;
    assign _3996 = _3993 ? _3995 : _373;
    assign _3975 = _3974[2:2];
    assign _3976 = _1796 & _3975;
    assign _3998 = _3976 ? _1203 : _3996;
    assign _4000 = _1960 ? _1203 : _3998;
    assign _287 = _4000;
    always @(posedge _294) begin
        if (_292)
            _373 <= _1203;
        else
            _373 <= _287;
    end
    assign _4012 = _370 + _4031;
    assign _4008 = _370 == _1093;
    assign _4009 = ~ _4008;
    assign _3987 = 9'b111111111;
    assign _3988 = _3980 == _3987;
    assign _3985 = 6'b111111;
    assign _3984 = _3980[5:0];
    assign _3986 = _3984 == _3985;
    assign _3979 = 9'b000000000;
    assign _4001 = 9'b000000001;
    assign _4002 = _3980 + _4001;
    assign _4004 = _1960 ? _3979 : _4002;
    assign _288 = _4004;
    always @(posedge _294) begin
        if (_292)
            _3980 <= _3979;
        else
            _3980 <= _288;
    end
    assign _3981 = _3980[2:0];
    assign _3983 = _3981 == _2425;
    assign _3977 = _724[63:62];
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
    assign _4013 = _4010 ? _4012 : _370;
    assign _4005 = _3974[1:1];
    assign _4006 = _1796 & _4005;
    assign _4015 = _4006 ? _1203 : _4013;
    assign _4017 = _1960 ? _1203 : _4015;
    assign _289 = _4017;
    always @(posedge _294) begin
        if (_292)
            _370 <= _1203;
        else
            _370 <= _289;
    end
    assign _773 = _729[25:24];
    always @* begin
        case (_773)
        0:
            _774 <= _367;
        1:
            _774 <= _370;
        2:
            _774 <= _373;
        default:
            _774 <= _373;
        endcase
    end
    assign _776 = _774 == _1093;
    assign _844 = _776 ? _843 : _840;
    always @(posedge _294) begin
        if (_292)
            _355 <= _1253;
        else
            _355 <= _339;
    end
    assign f_chg_now = _339 ^ _355;
    assign _4019 = _316 == _1245;
    assign _4021 = _4019 ? _1253 : _352;
    assign _4018 = _316 == _1244;
    assign _4022 = _4018 ? f_changed_all : _4021;
    assign _4024 = _1960 ? _1253 : _4022;
    assign _290 = _4024;
    always @(posedge _294) begin
        if (_292)
            _352 <= _1253;
        else
            _352 <= _290;
    end
    assign f_changed_all = _352 | f_chg_now;
    assign _767 = f_changed_all & f_chgmask1;
    assign _769 = _767 == _1253;
    assign _770 = ~ _769;
    assign f_chgmask1 = _729[23:16];
    assign _766 = f_chgmask1 == _1253;
    assign _771 = _766 | _770;
    assign _760 = _729[7:0];
    assign _758 = _729[15:8];
    assign vdd = 1'b1;
    assign _292 = clear;
    assign _294 = clock;
    assign _296 = pins_in;
    always @(posedge _294) begin
        if (_292)
            _336 <= _1253;
        else
            _336 <= _296;
    end
    always @(posedge _294) begin
        if (_292)
            _339 <= _1253;
        else
            _339 <= _336;
    end
    assign _759 = _339 ^ _758;
    assign _761 = _759 & _760;
    assign _763 = _761 == _1253;
    assign _729 = _331[287:176];
    assign f_valid1 = _729[111:111];
    assign _764 = f_valid1 & _763;
    assign _772 = _764 & _771;
    assign _845 = _772 & _844;
    assign _850 = _845 & _849;
    assign _889 = _850 & _888;
    assign _890 = f_in_eval & _889;
    assign _894 = _890 & _893;
    assign f_fire1 = _894 & _756;
    assign _1038 = f_fire1 ? _1244 : _1036;
    assign f_winner = f_fire0 ? _2544 : _1038;
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
    assign _3974 = _1795 ? _3973 : _3972;
    assign _4025 = _3974[0:0];
    assign _1794 = _383 == _1301;
    assign f_in_fetch = _316 == _1244;
    assign _1795 = f_in_fetch & _1794;
    assign _1796 = _1795 | _1220;
    assign _4026 = _1796 & _4025;
    assign _4035 = _4026 ? _1203 : _4033;
    assign _4037 = _1960 ? _1203 : _4035;
    assign _297 = _4037;
    always @(posedge _294) begin
        if (_292)
            _367 <= _1203;
        else
            _367 <= _297;
    end
    assign _2006 = _724[33:32];
    always @* begin
        case (_2006)
        0:
            _2007 <= _367;
        1:
            _2007 <= _370;
        2:
            _2007 <= _373;
        default:
            _2007 <= _373;
        endcase
    end
    assign _2005 = _724[49:34];
    assign _2008 = _2005 < _2007;
    assign _724 = _331[63:0];
    assign _2003 = _724[31:31];
    assign _2001 = ~ _1220;
    assign _2002 = f_in_eval & _2001;
    assign _2004 = _2002 & _2003;
    assign _2009 = _2004 & _2008;
    assign _2014 = _2009 & _2013;
    assign _2022 = _2014 | f_unexp_now;
    assign f_viol_now = _2022 | f_amb_now;
    assign _4043 = f_viol_now ? _4042 : _383;
    assign _4046 = _1220 ? _4045 : _4043;
    assign _4039 = _316 == _1245;
    assign _4047 = _4039 ? _4046 : _383;
    assign _4038 = _316 == _1244;
    assign _4050 = _4038 ? _4049 : _4047;
    assign _4052 = _1960 ? _1104 : _4050;
    assign _298 = _4052;
    always @(posedge _294) begin
        if (_292)
            _383 <= _1104;
        else
            _383 <= _298;
    end
    assign _4055 = _383 == _1301;
    assign _4056 = _4055 ? _286 : _321;
    assign _4053 = _316 == _1244;
    assign _4057 = _4053 ? _4056 : _321;
    assign _299 = _4057;
    always @(posedge _294) begin
        if (_292)
            _321 <= _320;
        else
            _321 <= _299;
    end
    assign _331 = { _321,
                    _324,
                    _327,
                    _330 };
    assign _332 = _331[175:64];
    assign f_valid0 = _332[111:111];
    assign _346 = f_valid0 & _345;
    assign _363 = _346 & _362;
    assign _612 = _363 & _611;
    assign _669 = _612 & _668;
    assign _713 = _669 & _712;
    assign f_in_eval = _316 == _1245;
    assign _714 = f_in_eval & _713;
    assign _723 = _714 & _722;
    assign f_fire0 = _723 & _756;
    assign _1124 = f_fire0 | f_fire1;
    assign _1125 = _1124 | f_fire2;
    assign _1220 = _1125 | f_fire3;
    assign _4076 = _1220 ? _4075 : _4073;
    assign _4061 = _316 == _2026;
    assign _4063 = _4061 ? _2544 : _316;
    assign _4059 = _316 == _1245;
    assign _4077 = _4059 ? _4076 : _4063;
    assign _4058 = _316 == _1244;
    assign _4080 = _4058 ? _4079 : _4077;
    assign _301 = host_stop;
    assign _4082 = _301 ? _2544 : _4080;
    assign _4084 = _1960 ? _1244 : _4082;
    assign _302 = _4084;
    always @(posedge _294) begin
        if (_292)
            _316 <= _2544;
        else
            _316 <= _302;
    end
    assign _1278 = _316 == _2544;
    assign _304 = host_verify;
    assign _2701 = _304 & _1278;
    assign _2703 = _2701 & _2702;
    assign _4086 = _2703 ? _1896 : f_sweeping;
    assign _4096 = f_sweeping ? _4095 : _4086;
    assign _305 = _4096;
    always @(posedge _294) begin
        if (_292)
            f_sweeping <= _1096;
        else
            f_sweeping <= _305;
    end
    assign _4108 = f_sweeping ? _4107 : _4101;
    assign _306 = _4108;
    always @(posedge _294) begin
        if (_292)
            f_image_valid <= _1096;
        else
            f_image_valid <= _306;
    end
    assign _308 = host_start;
    assign _1960 = _308 & f_image_valid;
    assign _4132 = _1960 ? _1253 : _4130;
    assign _309 = _4132;
    always @(posedge _294) begin
        if (_292)
            f_pout <= _1253;
        else
            f_pout <= _309;
    end
    assign _2626 = f_pout[7:7];
    assign _311 = host_pin_src;
    assign _2622 = _311[23:21];
    always @* begin
        case (_2622)
        0:
            _2633 <= _2626;
        1:
            _2633 <= f_lane0_out;
        2:
            _2633 <= _2627;
        3:
            _2633 <= _2628;
        4:
            _2633 <= _2630;
        5:
            _2633 <= f_lane1_out;
        6:
            _2633 <= _2631;
        default:
            _2633 <= _2632;
        endcase
    end
    assign _2697 = { _2633,
                     _2642,
                     _2651,
                     _2660,
                     _2669,
                     _2678,
                     _2687,
                     _2696 };
    assign _4134 = _2697 & _4133;
    assign pins_out = _4134;
    assign pins_oe = _2700;
    assign st_running = _2557;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1228;
    assign st_accepting = _2556;
    assign st_taken = _2554;
    assign st_taken_edge = _2551;
    assign st_viol = _2548;
    assign st_viol_kind = _2545;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _2540;
    assign st_tx_empty = _628;
    assign st_rx_data = _2538;
    assign st_rx_empty = _2431;
    assign st_vlog_data = _2429;
    assign st_vlog_empty = _2050;
    assign st_cov_rdata = _2058;
    assign st_irq = _2054;
    assign st_halted_viol = _1987;
    assign st_rx_overflow = _1980;
    assign st_vlog_overflow = _1970;
    assign st_cov_overrun = _1963;
    assign st_host_err = _1945;
    assign st_host_err_cause = _1950;
    assign st_lane_active = _1905;
    assign st_image_valid = f_image_valid;
    assign st_verify_busy = f_sweeping;
    assign st_tx_collision = _1895;
    assign st_drops = _1861;
    assign st_lane_status = _1631;
    assign ram_rec_addr = _1312;
    assign ram_rec_re = _1304;
    assign ram_rec_we = f_store_we;
    assign ram_rec_wdata = _17;
    assign ram_cov_addr = _1297;
    assign ram_cov_re = _1292;
    assign ram_cov_we = _1289;
    assign ram_cov_wdata = _1276;

endmodule
