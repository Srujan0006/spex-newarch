module spex_core (
    host_cov_wdata,
    host_cov_we,
    host_cov_addr,
    host_rec_wdata,
    host_rec_we,
    host_rec_waddr,
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
    input host_cov_we;
    input [7:0] host_cov_addr;
    input [127:0] host_rec_wdata;
    input host_rec_we;
    input [7:0] host_rec_waddr;
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
    output [15:0] st_lane_status;
    output [7:0] ram_rec_addr;
    output ram_rec_re;
    output ram_rec_we;
    output [127:0] ram_rec_wdata;
    output [7:0] ram_cov_addr;
    output ram_cov_re;
    output ram_cov_we;
    output [31:0] ram_cov_wdata;

    wire [11:0] _1231;
    wire _1228;
    wire _1229;
    wire [11:0] _1230;
    wire _1232;
    wire [11:0] _1233;
    wire [11:0] _1234;
    wire [11:0] _1220;
    wire [11:0] _1077;
    wire [11:0] _1074;
    wire [12:0] _1071;
    wire [9:0] _1068;
    wire [12:0] _1069;
    wire [12:0] _1070;
    wire [2:0] _1064;
    reg [2:0] _1044;
    wire [2:0] _1;
    reg [2:0] _1065;
    wire [12:0] _1066;
    wire [12:0] _1051;
    wire [12:0] _1050;
    wire [15:0] _1045;
    wire _1049;
    wire [12:0] _1052;
    wire [12:0] _2;
    reg [12:0] _1061;
    wire _1067;
    wire [12:0] _1072;
    wire [12:0] _1058;
    wire _1073;
    wire [11:0] _1076;
    wire _1056;
    wire [15:0] _1053;
    wire _1054;
    wire _3;
    reg _1057;
    wire [11:0] _1078;
    wire [11:0] _4;
    reg [11:0] _1221;
    wire [11:0] _1081;
    reg [1:0] _1047;
    reg [15:0] _1048;
    wire [15:0] _1079;
    wire _1080;
    wire [11:0] _1083;
    wire [11:0] _5;
    reg [11:0] _1218;
    wire _1222;
    wire _1223;
    wire [11:0] _1224;
    wire [11:0] _1215;
    wire _1225;
    wire [11:0] _1226;
    wire [7:0] _1213;
    wire _1214;
    wire [11:0] _1227;
    wire [7:0] _1211;
    wire [7:0] _1210;
    wire [1:0] _1205;
    wire [1:0] _1204;
    wire _1193;
    wire _1185;
    wire _1194;
    wire _6;
    reg _1203;
    wire [1:0] _1206;
    wire [6:0] _1200;
    wire [8:0] _1207;
    wire [7:0] _1198;
    wire [8:0] _1199;
    wire [8:0] _1208;
    wire _1209;
    wire [7:0] _1212;
    wire [31:0] _1235;
    wire [31:0] _8;
    wire [31:0] _1236;
    wire _1244;
    wire _1242;
    wire _1240;
    wire _12;
    wire _1239;
    wire _1241;
    wire _1243;
    wire _1246;
    wire _1245;
    wire _1247;
    wire [7:0] _14;
    reg [7:0] _1251;
    wire [7:0] _16;
    wire [7:0] _1248;
    wire _17;
    reg _1197;
    wire [7:0] _1252;
    wire [127:0] _20;
    wire _23;
    wire _1253;
    wire [1:0] _1257;
    wire [7:0] _1258;
    wire [7:0] _27;
    wire [2:0] _1254;
    wire _1255;
    wire _1256;
    wire [7:0] _1259;
    wire [2:0] _1410;
    wire [2:0] _1411;
    wire [2:0] _1383;
    wire [2:0] _1385;
    wire [2:0] _1386;
    wire [2:0] _1412;
    wire [2:0] _1414;
    wire [2:0] _1416;
    wire [2:0] _29;
    reg [2:0] _1382;
    wire [7:0] _1575;
    wire [2:0] _1568;
    wire [2:0] _1542;
    wire [2:0] _1543;
    wire [2:0] _1569;
    wire [2:0] _1571;
    wire [2:0] _1573;
    wire [2:0] _30;
    reg [2:0] _1539;
    wire [7:0] _1574;
    wire [15:0] _1576;
    wire _1586;
    wire [7:0] _32;
    reg [7:0] _1192;
    wire [7:0] _1189;
    wire _1580;
    wire _1581;
    wire _1577;
    wire _1578;
    wire _33;
    reg _1184;
    wire _35;
    wire _1181;
    wire _1579;
    wire _1582;
    wire _1587;
    wire _1589;
    wire _36;
    reg _1585;
    wire _1592;
    wire _1597;
    wire _1599;
    wire _38;
    reg _1595;
    wire _1731;
    wire _1724;
    wire _1732;
    wire _1705;
    wire _1652;
    wire _1706;
    wire _1733;
    wire _40;
    wire _1734;
    wire _1735;
    wire _1740;
    wire _1742;
    wire _41;
    reg _1738;
    wire _1746;
    wire _1747;
    wire _1752;
    wire _45;
    wire _1754;
    wire _1756;
    wire _46;
    reg _1750;
    wire _1785;
    wire _1787;
    wire _1783;
    wire _1789;
    wire _1790;
    wire _1791;
    wire _1758;
    wire _1792;
    wire _1794;
    wire _47;
    reg _1745;
    wire _1800;
    wire _1797;
    wire _1801;
    wire _1802;
    wire _1803;
    wire [31:0] _50;
    wire [2:0] _2170;
    wire _2171;
    wire _2172;
    wire [47:0] _2169;
    reg [47:0] _2173;
    wire [2:0] _2164;
    wire _2165;
    wire _2166;
    reg [47:0] _2167;
    wire [2:0] _2158;
    wire _2159;
    wire _2160;
    reg [47:0] _2161;
    wire _2153;
    wire _2154;
    reg [47:0] _2155;
    wire [2:0] _2146;
    wire _2147;
    wire _2148;
    reg [47:0] _2149;
    wire _2141;
    wire _2142;
    reg [47:0] _2143;
    wire _2135;
    wire _2136;
    reg [47:0] _2137;
    wire [2:0] _1810;
    wire [2:0] _1811;
    wire [2:0] _53;
    reg [2:0] _1808;
    wire _2129;
    wire _2130;
    wire [2:0] _2102;
    wire [28:0] _1819;
    wire [28:0] _1818;
    wire [28:0] _1821;
    wire [28:0] _1822;
    wire [2:0] _1815;
    wire _1817;
    wire [28:0] _1823;
    wire [28:0] _54;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2100;
    wire [2:0] _1841;
    wire _1837;
    wire _1838;
    wire _1835;
    wire _1839;
    wire [2:0] _1842;
    wire _1832;
    wire _1833;
    wire _1830;
    wire _1829;
    wire _1831;
    wire _1834;
    wire [2:0] _1844;
    wire _1825;
    wire [2:0] _1845;
    wire [2:0] _55;
    reg [2:0] _1828;
    wire _2091;
    wire [2:0] _2093;
    wire [2:0] _1862;
    wire _1858;
    wire _1859;
    wire _1856;
    wire _1860;
    wire [2:0] _1863;
    wire _1853;
    wire _1854;
    wire _1851;
    wire _1850;
    wire _1852;
    wire _1855;
    wire [2:0] _1865;
    wire _1846;
    wire [2:0] _1866;
    wire [2:0] _56;
    reg [2:0] _1849;
    wire _2088;
    wire [2:0] _2090;
    wire [2:0] _2094;
    wire [2:0] _1883;
    wire _1879;
    wire _1880;
    wire _1877;
    wire _1881;
    wire [2:0] _1884;
    wire _1874;
    wire _1875;
    wire _1872;
    wire _1871;
    wire _1873;
    wire _1876;
    wire [2:0] _1886;
    wire _1867;
    wire [2:0] _1887;
    wire [2:0] _57;
    reg [2:0] _1870;
    wire _2084;
    wire [2:0] _2086;
    wire [2:0] _1904;
    wire _1900;
    wire _1901;
    wire _1898;
    wire _1902;
    wire [2:0] _1905;
    wire _1895;
    wire _1896;
    wire _1893;
    wire _1892;
    wire _1894;
    wire _1897;
    wire [2:0] _1907;
    wire _1888;
    wire [2:0] _1908;
    wire [2:0] _58;
    reg [2:0] _1891;
    wire _2081;
    wire [2:0] _2083;
    wire [2:0] _2087;
    wire [2:0] _2095;
    wire [2:0] _1925;
    wire _1921;
    wire _1922;
    wire _1919;
    wire _1923;
    wire [2:0] _1926;
    wire _1916;
    wire _1917;
    wire _1914;
    wire _1913;
    wire _1915;
    wire _1918;
    wire [2:0] _1928;
    wire _1909;
    wire [2:0] _1929;
    wire [2:0] _59;
    reg [2:0] _1912;
    wire _2076;
    wire [2:0] _2078;
    wire [2:0] _1946;
    wire _1942;
    wire _1943;
    wire _1940;
    wire _1944;
    wire [2:0] _1947;
    wire _1937;
    wire _1938;
    wire _1935;
    wire _1934;
    wire _1936;
    wire _1939;
    wire [2:0] _1949;
    wire _1930;
    wire [2:0] _1950;
    wire [2:0] _60;
    reg [2:0] _1933;
    wire _2073;
    wire [2:0] _2075;
    wire [2:0] _2079;
    wire [2:0] _1967;
    wire _1963;
    wire _1964;
    wire _1961;
    wire _1965;
    wire [2:0] _1968;
    wire _1958;
    wire _1959;
    wire _1956;
    wire _1955;
    wire _1957;
    wire _1960;
    wire [2:0] _1970;
    wire _1951;
    wire [2:0] _1971;
    wire [2:0] _61;
    reg [2:0] _1954;
    wire _2069;
    wire [2:0] _2071;
    wire [2:0] _1988;
    wire _1984;
    wire _1985;
    wire _1982;
    wire _1986;
    wire [2:0] _1989;
    wire _1979;
    wire _1980;
    wire _1977;
    wire _1976;
    wire _1978;
    wire _1981;
    wire [2:0] _1991;
    wire _1972;
    wire [2:0] _1992;
    wire [2:0] _62;
    reg [2:0] _1975;
    wire _2066;
    wire [2:0] _2068;
    wire [2:0] _2072;
    wire [2:0] _2080;
    wire [2:0] _2096;
    wire _2061;
    wire _2060;
    wire _2062;
    wire _2058;
    wire _2057;
    wire _2059;
    wire _2063;
    wire _2054;
    wire _2053;
    wire _2055;
    wire _2051;
    wire _2050;
    wire _2052;
    wire _2056;
    wire _2064;
    wire [2:0] _2097;
    wire _2039;
    wire _2038;
    wire _2040;
    wire [2:0] _2042;
    wire _2034;
    wire _2033;
    wire _2035;
    wire [2:0] _2037;
    wire _2043;
    wire [2:0] _2044;
    wire _2027;
    wire _2026;
    wire _2028;
    wire [2:0] _2030;
    wire _2022;
    wire _2021;
    wire _2023;
    wire [2:0] _2025;
    wire _2031;
    wire [2:0] _2032;
    wire _2045;
    wire [2:0] _2046;
    wire _2013;
    wire _2012;
    wire _2014;
    wire [2:0] _2016;
    wire _2008;
    wire _2007;
    wire _2009;
    wire [2:0] _2011;
    wire _2017;
    wire [2:0] _2018;
    wire _2001;
    wire _2000;
    wire _2002;
    wire [2:0] _2004;
    wire _1996;
    wire _1995;
    wire _1997;
    wire [2:0] _1999;
    wire _2005;
    wire [2:0] _2006;
    wire _2019;
    wire [2:0] _2020;
    wire _2047;
    wire [2:0] _2048;
    wire [2:0] _2049;
    wire [2:0] _2098;
    wire [2:0] _1993;
    wire _2099;
    wire [28:0] _2101;
    wire [31:0] _2103;
    wire [47:0] _2107;
    wire [47:0] _63;
    reg [47:0] _2131;
    wire [2:0] _2124;
    wire [3:0] _1798;
    wire [3:0] _2113;
    wire [3:0] _2114;
    wire [3:0] _2112;
    wire [3:0] _2115;
    wire [3:0] _1590;
    wire _1591;
    wire _1804;
    wire _64;
    wire _1805;
    wire _2110;
    wire [3:0] _2116;
    reg [3:0] _2119;
    wire [3:0] _65;
    wire _1799;
    wire _2108;
    wire _67;
    wire _2109;
    wire [2:0] _2125;
    wire [2:0] _68;
    reg [2:0] _2122;
    reg [47:0] _2174;
    wire _2278;
    wire _2279;
    reg [7:0] _2280;
    wire _2272;
    wire _2273;
    reg [7:0] _2274;
    wire _2266;
    wire _2267;
    reg [7:0] _2268;
    wire _2260;
    wire _2261;
    reg [7:0] _2262;
    wire _2254;
    wire _2255;
    reg [7:0] _2256;
    wire _2248;
    wire _2249;
    reg [7:0] _2250;
    wire _2242;
    wire _2243;
    reg [7:0] _2244;
    wire [2:0] _2181;
    wire [2:0] _2182;
    wire [2:0] _71;
    reg [2:0] _2179;
    wire _2236;
    wire _2237;
    wire [7:0] _2222;
    wire [7:0] _2223;
    wire [7:0] _2200;
    wire [7:0] _2198;
    wire [7:0] _2201;
    wire [7:0] _72;
    reg [7:0] _2187;
    wire [7:0] _2196;
    wire [7:0] _2197;
    wire [7:0] _2212;
    wire [7:0] _2209;
    wire [7:0] _2207;
    wire [7:0] _2210;
    wire [7:0] _73;
    reg [7:0] _2206;
    wire [7:0] _2211;
    wire [7:0] _2213;
    wire [7:0] _2224;
    wire [7:0] _74;
    reg [7:0] _2238;
    wire [2:0] _2231;
    wire [2:0] _2232;
    wire [2:0] _75;
    reg [2:0] _2229;
    reg [7:0] _2281;
    wire [31:0] _1813;
    wire [31:0] _2284;
    wire [31:0] _2285;
    wire [31:0] _79;
    reg [31:0] ts_reg;
    wire [1:0] _2287;
    wire [1:0] _2104;
    wire [1:0] _2106;
    reg [1:0] _2288;
    reg _2291;
    reg [1:0] _2294;
    reg _2297;
    wire _2298;
    wire _2299;
    wire _1238;
    wire _2300;
    wire [7:0] _2441;
    wire [7:0] _2442;
    wire [7:0] _2322;
    wire [7:0] _2320;
    wire [7:0] _2319;
    wire [7:0] _2318;
    wire [7:0] _2317;
    reg [7:0] _2321;
    wire [7:0] _2323;
    wire [7:0] _2324;
    wire [7:0] _2315;
    wire [7:0] _2316;
    wire [7:0] _2325;
    wire [7:0] _2359;
    wire [7:0] _2360;
    wire [7:0] _2362;
    wire [7:0] _2364;
    wire [7:0] _89;
    reg [7:0] _2307;
    wire [7:0] _2443;
    wire [7:0] _92;
    wire [7:0] _3756;
    wire _2438;
    wire _2437;
    wire _2435;
    wire _2436;
    wire _2434;
    wire _2433;
    wire _2432;
    wire [2:0] _2431;
    reg _2439;
    wire _2429;
    wire _2428;
    wire _2426;
    wire _2427;
    wire _2425;
    wire _2424;
    wire _2423;
    wire [2:0] _2422;
    reg _2430;
    wire _2420;
    wire _2419;
    wire _2417;
    wire _2418;
    wire _2416;
    wire _2415;
    wire _2414;
    wire [2:0] _2413;
    reg _2421;
    wire _2411;
    wire _2410;
    wire _2408;
    wire _2409;
    wire _2407;
    wire _2406;
    wire _2405;
    wire [2:0] _2404;
    reg _2412;
    wire _2402;
    wire _2401;
    wire _2399;
    wire _2400;
    wire _2398;
    wire _2397;
    wire _2396;
    wire [2:0] _2395;
    reg _2403;
    wire _2393;
    wire _2392;
    wire _2390;
    wire _2391;
    wire _2389;
    wire _2388;
    wire _2387;
    wire [2:0] _2386;
    reg _2394;
    wire _2384;
    wire _2383;
    wire _2381;
    wire _2382;
    wire _2380;
    wire _2379;
    wire _2378;
    wire [2:0] _2377;
    reg _2385;
    wire _2375;
    wire _2374;
    wire _2372;
    wire _2373;
    wire _2371;
    wire _2370;
    wire [2:0] _3748;
    wire _3745;
    wire [1:0] _3746;
    wire [3:0] _3747;
    wire [6:0] _3749;
    wire [7:0] _3750;
    wire [7:0] _3751;
    wire _2356;
    wire _2355;
    wire _2354;
    wire _2352;
    wire _2353;
    wire _2350;
    wire _2351;
    wire _2347;
    wire _2348;
    wire _2349;
    wire _2344;
    wire _2345;
    wire _2346;
    wire _2341;
    wire _2340;
    wire _2342;
    wire _2339;
    wire _2343;
    wire [7:0] _2357;
    wire _2326;
    wire _2332;
    wire [7:0] _2358;
    wire [7:0] _3743;
    wire [7:0] _3739;
    wire [7:0] _3737;
    wire [7:0] _3736;
    wire [7:0] _3735;
    wire [7:0] _3734;
    reg [7:0] _3738;
    wire [7:0] _3740;
    wire [7:0] _3741;
    wire [7:0] _2313;
    wire [7:0] _2311;
    wire [7:0] _2310;
    wire [7:0] _2309;
    wire [7:0] _2308;
    reg [7:0] _2312;
    wire [7:0] _2314;
    wire [7:0] _3732;
    wire [7:0] _3733;
    wire [7:0] _3742;
    wire [7:0] _3744;
    wire [7:0] _3752;
    wire _2302;
    wire _2303;
    wire _1711;
    wire [1:0] _3726;
    wire [1:0] _3722;
    wire [1:0] _1784;
    wire _3713;
    wire [1:0] _3715;
    wire _3712;
    wire [1:0] _3717;
    wire _3711;
    wire [1:0] _3719;
    wire [1:0] _3720;
    wire [7:0] _1175;
    wire _1177;
    wire _1168;
    wire [15:0] _1163;
    wire _1164;
    wire _1165;
    wire _1162;
    wire _1166;
    wire _1169;
    wire [3:0] _1159;
    wire _1161;
    wire _1170;
    wire _1157;
    wire _1153;
    wire _1154;
    wire _1151;
    wire _1155;
    wire _1158;
    wire _1149;
    reg [2:0] _1043;
    wire [15:0] _1144;
    wire _1145;
    wire _1142;
    wire _1146;
    wire _1140;
    wire _1147;
    wire _1150;
    wire [1:0] _1139;
    reg _1171;
    wire _1138;
    wire _1172;
    wire _1135;
    wire [3:0] _1133;
    reg _1134;
    wire _1136;
    wire [15:0] _1128;
    wire _1130;
    wire [16:0] _1123;
    wire [15:0] _1119;
    wire [16:0] _1120;
    wire [16:0] _1121;
    reg [16:0] _1124;
    wire _1125;
    wire _1126;
    wire [15:0] _1115;
    wire _1117;
    wire _1032;
    wire [2:0] _1034;
    wire _1029;
    wire [2:0] _1031;
    wire _1035;
    wire [2:0] _1036;
    wire _1024;
    wire [2:0] _1026;
    wire _1021;
    wire [2:0] _1023;
    wire _1027;
    wire [2:0] _1028;
    wire _1037;
    wire [2:0] _1038;
    wire _1014;
    wire [2:0] _1016;
    wire _1011;
    wire [2:0] _1013;
    wire _1017;
    wire [2:0] _1018;
    wire _1006;
    wire [2:0] _1008;
    wire [7:0] _1002;
    wire _1003;
    wire [2:0] _1005;
    wire _1009;
    wire [2:0] _1010;
    wire _1019;
    wire [2:0] _1020;
    wire _1039;
    wire [2:0] _1040;
    wire [13:0] _1107;
    wire [16:0] _1108;
    wire [111:0] _1001;
    wire [15:0] _1105;
    wire [16:0] _1106;
    wire [16:0] _1109;
    reg [16:0] _1112;
    wire [16:0] _1104;
    wire _1113;
    wire _1114;
    wire _1118;
    wire _1127;
    wire [1:0] _1046;
    reg [15:0] _1101;
    wire _1103;
    wire _1131;
    wire [7:0] _1095;
    wire _1097;
    wire _1098;
    wire _1094;
    wire _1099;
    wire [7:0] _1088;
    wire [7:0] _1086;
    wire [7:0] _1087;
    wire [7:0] _1089;
    wire _1091;
    wire _1092;
    wire _1100;
    wire _1132;
    wire _1137;
    wire _1173;
    wire _1174;
    wire _1178;
    wire f_fire3;
    wire [7:0] _680;
    wire _682;
    wire _668;
    wire _664;
    wire _665;
    wire _662;
    wire _666;
    wire _669;
    wire [3:0] _659;
    wire _661;
    wire _670;
    wire _657;
    wire _653;
    wire _654;
    wire _651;
    wire _655;
    wire _658;
    wire _649;
    reg [2:0] _643;
    wire [15:0] _644;
    wire _645;
    wire _639;
    wire _646;
    wire _637;
    wire _647;
    wire _650;
    wire [1:0] _636;
    reg _671;
    wire _635;
    wire _672;
    wire _627;
    wire [3:0] _573;
    reg _626;
    wire _628;
    wire [15:0] _568;
    wire _570;
    wire [15:0] _559;
    wire [16:0] _560;
    wire [16:0] _561;
    reg [16:0] _564;
    wire _565;
    wire _566;
    wire [15:0] _555;
    wire _557;
    wire _521;
    wire [2:0] _541;
    wire _500;
    wire [2:0] _520;
    wire _542;
    wire [2:0] _543;
    wire _477;
    wire [2:0] _497;
    wire _456;
    wire [2:0] _476;
    wire _498;
    wire [2:0] _499;
    wire _544;
    wire [2:0] _545;
    wire _431;
    wire [2:0] _451;
    wire _410;
    wire [2:0] _430;
    wire _452;
    wire [2:0] _453;
    wire _387;
    wire [2:0] _407;
    wire [7:0] _365;
    wire _366;
    wire [2:0] _386;
    wire _408;
    wire [2:0] _409;
    wire _454;
    wire [2:0] _455;
    wire _546;
    wire [2:0] _547;
    wire [16:0] _548;
    wire [111:0] _361;
    wire [15:0] _362;
    wire [16:0] _363;
    wire [16:0] _549;
    reg [16:0] _552;
    wire [16:0] _338;
    wire _553;
    wire _554;
    wire _558;
    wire _567;
    wire [1:0] _324;
    reg [15:0] _334;
    wire _336;
    wire _571;
    wire [7:0] _318;
    wire _320;
    wire _321;
    wire _309;
    wire _322;
    wire [7:0] _302;
    wire [7:0] _300;
    wire [7:0] _301;
    wire [7:0] _303;
    wire _305;
    wire [127:0] _280;
    wire [2:0] _3696;
    wire [5:0] _1187;
    wire [5:0] _94;
    wire [5:0] _2456;
    wire [5:0] _96;
    wire _2446;
    wire [5:0] _2447;
    wire [5:0] _2448;
    wire [5:0] _2457;
    wire _2444;
    wire [5:0] _2458;
    wire [5:0] _2459;
    wire [5:0] _97;
    reg [5:0] _1188;
    wire [5:0] _2452;
    wire [5:0] _2451;
    wire [5:0] _2450;
    wire [5:0] _2449;
    reg [5:0] _2453;
    wire _2454;
    wire _2455;
    wire [2:0] _3692;
    wire _3687;
    wire [2:0] _3689;
    wire [7:0] _1775;
    wire _1777;
    wire _1778;
    wire _1773;
    wire _1774;
    wire f_unexp_now;
    wire _2463;
    wire _2464;
    wire _2466;
    wire _2467;
    wire _2462;
    wire _2460;
    wire _2468;
    wire _98;
    reg _1770;
    wire _1771;
    wire [15:0] _3678;
    wire [15:0] _3679;
    wire _3675;
    wire _3676;
    wire _3677;
    wire [15:0] _3680;
    wire [2:0] _3620;
    wire [2:0] _3618;
    wire [2:0] _3617;
    wire [2:0] _3616;
    wire [2:0] _3615;
    wire [7:0] _989;
    wire _991;
    wire _982;
    wire _978;
    wire _979;
    wire _976;
    wire _980;
    wire _983;
    wire [3:0] _973;
    wire _975;
    wire _984;
    wire _971;
    wire _967;
    wire _968;
    wire _965;
    wire _969;
    wire _972;
    wire _963;
    reg [2:0] _957;
    wire [15:0] _958;
    wire _959;
    wire _953;
    wire _960;
    wire _951;
    wire _961;
    wire _964;
    wire [1:0] _950;
    reg _985;
    wire _949;
    wire _986;
    wire _946;
    wire [3:0] _944;
    reg _945;
    wire _947;
    wire [15:0] _939;
    wire _941;
    wire [15:0] _930;
    wire [16:0] _931;
    wire [16:0] _932;
    reg [16:0] _935;
    wire _936;
    wire _937;
    wire [15:0] _926;
    wire _928;
    wire _910;
    wire [2:0] _912;
    wire _907;
    wire [2:0] _909;
    wire _913;
    wire [2:0] _914;
    wire _902;
    wire [2:0] _904;
    wire _899;
    wire [2:0] _901;
    wire _905;
    wire [2:0] _906;
    wire _915;
    wire [2:0] _916;
    wire _892;
    wire [2:0] _894;
    wire _889;
    wire [2:0] _891;
    wire _895;
    wire [2:0] _896;
    wire _884;
    wire [2:0] _886;
    wire [7:0] _880;
    wire _881;
    wire [2:0] _883;
    wire _887;
    wire [2:0] _888;
    wire _897;
    wire [2:0] _898;
    wire _917;
    wire [2:0] _918;
    wire [16:0] _919;
    wire [111:0] _876;
    wire [15:0] _877;
    wire [16:0] _878;
    wire [16:0] _920;
    reg [16:0] _923;
    wire [16:0] _875;
    wire _924;
    wire _925;
    wire _929;
    wire _938;
    wire [1:0] _871;
    reg [15:0] _872;
    wire _874;
    wire _942;
    wire [7:0] _865;
    wire _867;
    wire _868;
    wire _864;
    wire _869;
    wire [7:0] _858;
    wire [7:0] _856;
    wire [7:0] _857;
    wire [7:0] _859;
    wire _861;
    wire _862;
    wire _870;
    wire _943;
    wire _948;
    wire _987;
    wire _988;
    wire _992;
    wire f_fire2;
    wire [1:0] _996;
    wire [1:0] _713;
    wire _715;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _705;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _699;
    wire [7:0] _693;
    wire [7:0] f_chgmask0;
    wire [7:0] _687;
    wire [7:0] f_watch;
    wire [7:0] _688;
    wire [7:0] _694;
    wire [7:0] _700;
    wire [7:0] f_relevant;
    wire [7:0] _707;
    wire _709;
    wire _710;
    wire f_amb_now;
    wire _712;
    wire _716;
    wire [7:0] _678;
    wire [7:0] _2473;
    wire [7:0] _2474;
    wire _2470;
    wire [7:0] _2472;
    wire _2469;
    wire [7:0] _2475;
    wire [7:0] _2477;
    wire [7:0] _99;
    reg [7:0] _677;
    wire [7:0] f_multi_eff;
    wire [7:0] _851;
    wire _853;
    wire _844;
    wire _840;
    wire _841;
    wire _838;
    wire _842;
    wire _845;
    wire [3:0] _835;
    wire _837;
    wire _846;
    wire _833;
    wire _829;
    wire _830;
    wire _827;
    wire _831;
    wire _834;
    wire _825;
    reg [2:0] _819;
    wire [15:0] _820;
    wire _821;
    wire _815;
    wire _822;
    wire _813;
    wire _823;
    wire _826;
    wire [1:0] _812;
    reg _847;
    wire [1:0] _101;
    wire [1:0] _2478;
    wire [1:0] _102;
    reg [1:0] _632;
    wire _634;
    wire _811;
    wire _848;
    wire _808;
    wire _2482;
    wire _2480;
    wire _2483;
    wire _2485;
    wire _2487;
    wire _103;
    reg _625;
    wire [15:0] _105;
    wire [15:0] _107;
    wire [15:0] _2493;
    wire [15:0] _2494;
    wire [15:0] _2495;
    wire [15:0] _2497;
    wire [15:0] _108;
    reg [15:0] _2490;
    wire [14:0] _2491;
    wire [15:0] _2492;
    wire [15:0] _2498;
    wire [15:0] _2499;
    wire _2501;
    wire _2503;
    wire _2504;
    wire _2505;
    wire _2506;
    wire _2508;
    wire _2510;
    wire _109;
    reg _622;
    wire _2523;
    wire _2524;
    wire _2526;
    wire _2527;
    wire _2528;
    wire _2529;
    wire _2531;
    wire _110;
    reg _2513;
    wire _2525;
    wire _2534;
    wire [5:0] _2532;
    wire _2533;
    wire _2535;
    wire _2536;
    wire _2537;
    wire _2538;
    wire _2539;
    wire _2541;
    wire _2543;
    wire _111;
    reg _619;
    wire _2547;
    wire _2545;
    wire _2548;
    wire _2550;
    wire _2552;
    wire _112;
    reg _611;
    wire [15:0] _114;
    wire [15:0] _116;
    wire [15:0] _2558;
    wire [15:0] _2559;
    wire [15:0] _2560;
    wire [15:0] _2562;
    wire [15:0] _117;
    reg [15:0] _2555;
    wire [14:0] _2556;
    wire [15:0] _2557;
    wire [15:0] _2563;
    wire [15:0] _2564;
    wire _2566;
    wire _2568;
    wire _2569;
    wire _2570;
    wire _2571;
    wire _2573;
    wire _2575;
    wire _118;
    reg _608;
    wire _2588;
    wire _2589;
    wire _2591;
    wire _2592;
    wire _2593;
    wire _2594;
    wire _2596;
    wire _119;
    reg _2578;
    wire _2590;
    wire _2599;
    wire _2598;
    wire _2600;
    wire _2601;
    wire _2602;
    wire _2603;
    wire _2604;
    wire _2606;
    wire _2608;
    wire _120;
    reg _605;
    wire [7:0] _122;
    wire [6:0] _596;
    wire [6:0] _595;
    wire _597;
    wire [15:0] _592;
    wire _2613;
    wire _2612;
    wire _2614;
    wire _2611;
    wire _2615;
    wire _2610;
    wire _2616;
    wire [14:0] _2609;
    wire [15:0] _2617;
    wire [15:0] _123;
    reg [15:0] _593;
    wire _594;
    wire [3:0] _2636;
    wire [3:0] _2634;
    wire [3:0] _2637;
    wire _1796;
    wire _2225;
    wire _125;
    wire _2226;
    wire _2175;
    wire _2208;
    wire _2621;
    wire _2202;
    wire _2203;
    wire _2619;
    wire _1722;
    wire _1723;
    wire _1729;
    wire _1726;
    wire _1727;
    wire _1725;
    wire _1728;
    wire _1730;
    wire _2622;
    wire _126;
    reg _1709;
    wire _2630;
    wire _2199;
    wire _2626;
    wire _2183;
    wire _2184;
    wire _2624;
    wire _1649;
    wire [2:0] _1643;
    wire _1638;
    wire _1637;
    wire _1639;
    wire _1640;
    wire _1641;
    wire [2:0] _1644;
    wire _1646;
    wire _1647;
    wire _1618;
    wire _1648;
    wire _1650;
    wire _1614;
    wire _1615;
    wire _1651;
    wire _1703;
    wire _1702;
    wire _1704;
    wire _2627;
    wire _127;
    reg _1602;
    wire _2628;
    wire _1699;
    wire [2:0] _1693;
    wire _1688;
    wire _1687;
    wire _1689;
    wire _1690;
    wire _1691;
    wire [2:0] _1694;
    wire _1696;
    wire _1697;
    wire _1668;
    wire _1698;
    wire _1700;
    wire _1664;
    wire _1665;
    wire _1701;
    wire _2629;
    wire _2631;
    wire _128;
    wire _2176;
    wire _2632;
    wire [3:0] _2638;
    reg [3:0] _2641;
    wire [3:0] _129;
    wire _590;
    wire [6:0] _2658;
    wire [7:0] _2659;
    wire [6:0] _2656;
    wire _2654;
    wire _2653;
    wire _2652;
    wire _2651;
    wire _2650;
    wire _2649;
    wire _2648;
    wire _2647;
    wire [2:0] _2645;
    wire [2:0] _2644;
    wire [2:0] _2643;
    wire [2:0] _2642;
    reg [2:0] _2646;
    reg _2655;
    wire [7:0] _2657;
    wire [1:0] _1717;
    wire [1:0] _1716;
    wire [1:0] _1715;
    wire [1:0] _1714;
    reg [1:0] _1718;
    wire [1:0] _1720;
    reg [7:0] _2660;
    wire [7:0] _2661;
    wire [7:0] _130;
    reg [7:0] _585;
    wire _586;
    wire [6:0] _3431;
    wire [7:0] _3432;
    wire _3429;
    wire _3428;
    wire _3427;
    wire _3426;
    wire _3425;
    wire _3424;
    wire _3423;
    wire _3422;
    wire [7:0] _3430;
    wire [3:0] _3414;
    wire [3:0] _3412;
    wire [3:0] _3415;
    wire _3085;
    wire _3406;
    wire _1619;
    wire _3040;
    wire _3041;
    wire [1:0] _3044;
    wire _3033;
    wire _3034;
    wire _3035;
    wire _3036;
    wire [1:0] _3038;
    wire [2:0] _3019;
    wire [2:0] _3016;
    wire _3012;
    wire _3010;
    wire _3011;
    wire _3013;
    wire [2:0] _3017;
    wire _3008;
    wire [2:0] _3020;
    wire _3021;
    wire [2:0] _3002;
    wire _2998;
    wire _2996;
    wire _2997;
    wire _2999;
    wire [2:0] _3003;
    wire _2994;
    wire [2:0] _3005;
    wire _3006;
    wire _3022;
    wire _3023;
    wire _3024;
    wire _2990;
    wire _2988;
    wire _2991;
    wire [15:0] _2983;
    wire _2984;
    wire _2981;
    wire _2985;
    wire _2979;
    wire _2980;
    wire _2986;
    wire _2992;
    wire _3025;
    wire [1:0] _3027;
    wire [1:0] _3029;
    wire [1:0] _2975;
    wire _2971;
    wire [1:0] _2973;
    wire [1:0] _2976;
    wire _2751;
    wire _2752;
    wire _131;
    reg _2664;
    wire _2901;
    wire _2899;
    wire _2900;
    reg _2902;
    wire [2:0] _133;
    wire [2:0] _2883;
    wire [2:0] _2884;
    wire [2:0] _2879;
    wire _2875;
    wire _2873;
    wire _2874;
    wire _2876;
    wire [2:0] _2880;
    wire _2871;
    wire [2:0] _2885;
    wire [2:0] _2886;
    wire [2:0] _2865;
    wire [2:0] _2866;
    wire [2:0] _2861;
    wire _2747;
    wire _2746;
    wire _2745;
    wire _2744;
    wire _2743;
    wire _2742;
    wire _2741;
    wire _2737;
    wire _2736;
    wire _2735;
    wire _2734;
    wire _2733;
    wire _2732;
    wire _2731;
    wire [7:0] _2728;
    wire [6:0] _2193;
    wire [7:0] _2194;
    wire [6:0] _2191;
    wire [7:0] _2192;
    wire [7:0] _2195;
    wire [7:0] _2757;
    wire [7:0] _2758;
    wire [7:0] _2759;
    wire [7:0] _2753;
    wire [7:0] _2754;
    wire [7:0] _2755;
    wire [7:0] _2756;
    wire [7:0] _2760;
    wire [7:0] _134;
    reg [7:0] _2190;
    wire _2668;
    wire _2665;
    wire _2666;
    wire _2669;
    wire [7:0] _2729;
    wire _2730;
    wire [7:0] _2738;
    wire _136;
    wire [7:0] _2739;
    wire _2740;
    wire [2:0] _2768;
    wire [2:0] _2769;
    wire [2:0] _2770;
    wire [2:0] _2771;
    wire [2:0] _2762;
    wire [2:0] _2763;
    wire [2:0] _2764;
    wire [2:0] _2765;
    wire [2:0] _2766;
    wire [2:0] _2772;
    wire [2:0] _2774;
    wire [2:0] _137;
    reg [2:0] _1612;
    reg _2748;
    wire _139;
    wire [31:0] _141;
    wire [30:0] _2816;
    wire [31:0] _2818;
    wire _2810;
    wire _2811;
    wire [31:0] _2813;
    wire [30:0] _2807;
    wire [31:0] _2809;
    wire [31:0] _2814;
    wire [31:0] _2815;
    wire [5:0] _143;
    wire [5:0] _2784;
    wire [5:0] _2785;
    wire [5:0] _2786;
    wire [5:0] _2787;
    wire [5:0] _2778;
    wire [5:0] _2779;
    wire [5:0] _2780;
    wire [5:0] _2781;
    wire [5:0] _2782;
    wire [5:0] _2788;
    wire [5:0] _2789;
    wire [5:0] _2791;
    wire [5:0] _144;
    reg [5:0] _1632;
    wire _1634;
    wire _1635;
    wire _2515;
    wire _2514;
    wire _2516;
    wire _2517;
    wire [31:0] _2819;
    wire [31:0] _2820;
    wire [31:0] _2821;
    wire [31:0] _146;
    wire _2798;
    wire _2799;
    wire [31:0] _2801;
    wire [30:0] _2795;
    wire [31:0] _2797;
    wire [31:0] _2802;
    wire [30:0] _2792;
    wire [31:0] _2794;
    wire [31:0] _2803;
    wire [31:0] _2804;
    wire [31:0] _2805;
    wire [31:0] _2806;
    wire [31:0] _2822;
    wire [31:0] _2823;
    wire [31:0] _2825;
    wire [31:0] _147;
    reg [31:0] _2520;
    wire _2521;
    wire _2522;
    wire [15:0] _149;
    wire [15:0] _2845;
    wire _1604;
    wire _1609;
    wire [15:0] _2846;
    wire _1603;
    wire [15:0] _2847;
    wire _2828;
    wire _2826;
    wire _2827;
    wire _2829;
    wire _2831;
    wire _150;
    reg _1561;
    wire _1562;
    wire _1559;
    wire _1563;
    wire _2833;
    wire _2834;
    wire _2835;
    wire _2837;
    wire _151;
    reg _1555;
    wire _1556;
    wire _1553;
    wire _1557;
    wire _1564;
    wire _1565;
    wire _1566;
    wire [15:0] _2848;
    wire [15:0] _2839;
    wire [15:0] _2840;
    wire [15:0] _2841;
    wire [15:0] _2842;
    wire [15:0] _2843;
    wire [15:0] _2849;
    wire [15:0] _2851;
    wire [15:0] _152;
    reg [15:0] _1607;
    wire _1608;
    wire _2749;
    wire _2750;
    wire _2857;
    wire _2855;
    wire _2856;
    wire _2858;
    wire [2:0] _2862;
    wire _2853;
    wire [2:0] _2867;
    wire [2:0] _2868;
    wire [2:0] _2869;
    wire [2:0] _2887;
    wire [2:0] _2889;
    wire [2:0] _153;
    reg [2:0] _1549;
    wire _1550;
    wire [1:0] _155;
    wire _1545;
    wire _1546;
    wire _1551;
    wire _1629;
    wire _1636;
    wire _2903;
    wire _2904;
    wire _1624;
    wire _1622;
    wire _1625;
    wire _1626;
    wire _1627;
    wire _2896;
    wire _2893;
    wire _2890;
    wire _2891;
    wire _2894;
    wire _2895;
    wire _2897;
    wire _2905;
    wire _2907;
    wire _2909;
    wire _2911;
    wire _2913;
    wire _156;
    reg _1533;
    wire _1534;
    wire _1535;
    wire _1528;
    wire _1529;
    wire _1525;
    wire _158;
    wire _1522;
    wire _1523;
    wire _1524;
    wire _1526;
    wire _1530;
    wire _1531;
    wire _1536;
    wire [1:0] _2978;
    wire _1517;
    wire _1518;
    wire _1513;
    wire _1512;
    wire _1511;
    wire _1510;
    wire _1509;
    wire _1508;
    wire _1507;
    wire _1506;
    reg _1514;
    wire _1515;
    wire _1504;
    wire _1503;
    wire _1502;
    wire _1501;
    wire _1500;
    wire _1499;
    wire _1498;
    wire _1497;
    wire [2:0] _160;
    reg _1505;
    wire _1516;
    wire _162;
    wire _1519;
    wire _1495;
    wire _1492;
    wire _1485;
    wire _1483;
    wire [13:0] _1474;
    wire [15:0] _1475;
    wire [14:0] _1471;
    wire [15:0] _1472;
    wire [15:0] _1476;
    wire [14:0] _1468;
    wire [15:0] _1469;
    wire _1466;
    wire [15:0] _1477;
    reg [15:0] _1480;
    wire _1481;
    wire [13:0] _1458;
    wire [15:0] _1459;
    reg [15:0] _1462;
    wire _2959;
    wire _2960;
    wire [15:0] _2961;
    wire [15:0] _2963;
    wire [15:0] _2965;
    wire _2943;
    wire [14:0] _1487;
    wire [15:0] _1488;
    reg [15:0] _1491;
    wire [16:0] _2939;
    wire _2940;
    wire [16:0] _2933;
    reg [16:0] _2936;
    wire [16:0] _2928;
    wire [15:0] _164;
    wire [16:0] _2927;
    wire [16:0] _2929;
    reg [16:0] _2932;
    wire [7:0] _166;
    wire [8:0] _2947;
    wire [7:0] _2949;
    wire [7:0] _2950;
    wire [7:0] _2951;
    wire [7:0] _2953;
    wire [7:0] _167;
    reg [7:0] _2921;
    wire [8:0] _2946;
    wire [8:0] _2948;
    wire _2954;
    wire _2955;
    wire _2956;
    wire _2958;
    wire _168;
    reg _2926;
    wire [16:0] _2937;
    wire [16:0] _2923;
    wire _2938;
    wire _2941;
    wire _2944;
    wire _2922;
    wire _2945;
    wire [15:0] _2967;
    wire _2917;
    wire _2915;
    wire _616;
    wire _2914;
    wire _2916;
    wire _2918;
    wire [15:0] _2968;
    wire [15:0] _2970;
    wire [15:0] _169;
    reg [15:0] _1456;
    wire _1463;
    wire _1464;
    wire _1453;
    wire _1465;
    wire _1482;
    wire _1484;
    wire _1493;
    wire [1:0] _171;
    wire _1449;
    wire _1450;
    wire _1447;
    wire _1451;
    wire _1444;
    wire _1440;
    wire _1439;
    wire _1438;
    wire _1437;
    wire _1436;
    wire _1435;
    wire _1434;
    wire _1433;
    reg _1441;
    wire _1431;
    wire _1430;
    wire _1429;
    wire _1428;
    wire _1427;
    wire _1426;
    wire _1425;
    wire _1424;
    wire [2:0] _173;
    reg _1432;
    wire _1442;
    wire _1443;
    wire _1445;
    wire _1452;
    wire _1496;
    wire _175;
    wire _1520;
    wire _177;
    wire _1423;
    wire _1521;
    wire [1:0] _3030;
    wire _1617;
    wire [1:0] _3032;
    wire _2776;
    wire [1:0] _3039;
    wire _1420;
    wire [1:0] _3045;
    wire _1418;
    wire [1:0] _3047;
    wire [1:0] _178;
    reg [1:0] _614;
    wire _1422;
    wire _1620;
    wire _1628;
    wire _3405;
    wire _3407;
    wire _3403;
    wire _1669;
    wire _3381;
    wire _3382;
    wire [1:0] _3385;
    wire _3374;
    wire _3375;
    wire _3376;
    wire _3377;
    wire [1:0] _3379;
    wire [2:0] _3360;
    wire [2:0] _3357;
    wire _3353;
    wire _3351;
    wire _3352;
    wire _3354;
    wire [2:0] _3358;
    wire _3349;
    wire [2:0] _3361;
    wire _3362;
    wire [2:0] _3343;
    wire _3339;
    wire _3337;
    wire _3338;
    wire _3340;
    wire [2:0] _3344;
    wire _3335;
    wire [2:0] _3346;
    wire _3347;
    wire _3363;
    wire _3364;
    wire _3365;
    wire _3331;
    wire _3329;
    wire _3332;
    wire [15:0] _3324;
    wire _3325;
    wire _3322;
    wire _3326;
    wire _3320;
    wire _3321;
    wire _3327;
    wire _3333;
    wire _3366;
    wire [1:0] _3368;
    wire [1:0] _3370;
    wire [1:0] _3316;
    wire _3312;
    wire [1:0] _3314;
    wire [1:0] _3317;
    wire _3080;
    wire _3081;
    wire _179;
    reg _3050;
    wire _3238;
    wire _3236;
    wire _3237;
    reg _3239;
    wire [2:0] _181;
    wire [2:0] _3220;
    wire [2:0] _3221;
    wire [2:0] _3216;
    wire _3212;
    wire _3210;
    wire _3211;
    wire _3213;
    wire [2:0] _3217;
    wire _3208;
    wire [2:0] _3222;
    wire [2:0] _3223;
    wire [2:0] _3202;
    wire [2:0] _3203;
    wire [2:0] _3198;
    wire _3076;
    wire _3075;
    wire _3074;
    wire _3073;
    wire _3072;
    wire _3071;
    wire _3070;
    wire _3066;
    wire _3065;
    wire _3064;
    wire _3063;
    wire _3062;
    wire _3061;
    wire _3060;
    wire _2723;
    wire _2724;
    reg [7:0] _2725;
    wire _2717;
    wire _2718;
    reg [7:0] _2719;
    wire _2711;
    wire _2712;
    reg [7:0] _2713;
    wire _2705;
    wire _2706;
    reg [7:0] _2707;
    wire _2699;
    wire _2700;
    reg [7:0] _2701;
    wire _2693;
    wire _2694;
    reg [7:0] _2695;
    wire _2687;
    wire _2688;
    reg [7:0] _2689;
    wire [2:0] _3083;
    wire [2:0] _3084;
    wire [2:0] _182;
    reg [2:0] _2679;
    wire _2681;
    wire _2682;
    wire [7:0] _184;
    reg [7:0] _2683;
    wire [2:0] _3088;
    wire [2:0] _3089;
    wire [2:0] _185;
    reg [2:0] _2672;
    reg [7:0] _2726;
    wire [7:0] _3057;
    wire [6:0] _2219;
    wire [7:0] _2220;
    wire [6:0] _2217;
    wire [7:0] _2218;
    wire [7:0] _2221;
    wire [7:0] _3094;
    wire [7:0] _3095;
    wire [7:0] _3096;
    wire [7:0] _3090;
    wire [7:0] _3091;
    wire [7:0] _3092;
    wire [7:0] _3093;
    wire [7:0] _3097;
    wire [7:0] _186;
    reg [7:0] _2216;
    wire _3054;
    wire _3051;
    wire _3052;
    wire _3055;
    wire [7:0] _3058;
    wire _3059;
    wire [7:0] _3067;
    wire _188;
    wire [7:0] _3068;
    wire _3069;
    wire [2:0] _3105;
    wire [2:0] _3106;
    wire [2:0] _3107;
    wire [2:0] _3108;
    wire [2:0] _3099;
    wire [2:0] _3100;
    wire [2:0] _3101;
    wire [2:0] _3102;
    wire [2:0] _3103;
    wire [2:0] _3109;
    wire [2:0] _3111;
    wire [2:0] _189;
    reg [2:0] _1662;
    reg _3077;
    wire _191;
    wire [31:0] _193;
    wire [30:0] _3153;
    wire [31:0] _3155;
    wire _3147;
    wire _3148;
    wire [31:0] _3150;
    wire [30:0] _3144;
    wire [31:0] _3146;
    wire [31:0] _3151;
    wire [31:0] _3152;
    wire [5:0] _195;
    wire [5:0] _3121;
    wire [5:0] _3122;
    wire [5:0] _3123;
    wire [5:0] _3124;
    wire [5:0] _3115;
    wire [5:0] _3116;
    wire [5:0] _3117;
    wire [5:0] _3118;
    wire [5:0] _3119;
    wire [5:0] _3125;
    wire [5:0] _3126;
    wire [5:0] _3128;
    wire [5:0] _196;
    reg [5:0] _1682;
    wire _1684;
    wire _1685;
    wire _2580;
    wire _2579;
    wire _2581;
    wire _2582;
    wire [31:0] _3156;
    wire [31:0] _3157;
    wire [31:0] _3158;
    wire [31:0] _198;
    wire _3135;
    wire _3136;
    wire [31:0] _3138;
    wire [30:0] _3132;
    wire [31:0] _3134;
    wire [31:0] _3139;
    wire [30:0] _3129;
    wire [31:0] _3131;
    wire [31:0] _3140;
    wire [31:0] _3141;
    wire [31:0] _3142;
    wire [31:0] _3143;
    wire [31:0] _3159;
    wire [31:0] _3160;
    wire [31:0] _3162;
    wire [31:0] _199;
    reg [31:0] _2585;
    wire _2586;
    wire _2587;
    wire [15:0] _201;
    wire [15:0] _3182;
    wire _1654;
    wire _1659;
    wire [15:0] _3183;
    wire _1653;
    wire [15:0] _3184;
    wire _3165;
    wire _3163;
    wire _3164;
    wire _3166;
    wire _3168;
    wire _202;
    reg _1404;
    wire _1405;
    wire _1402;
    wire _1406;
    wire _3170;
    wire _3171;
    wire _3172;
    wire _3174;
    wire _203;
    reg _1398;
    wire _1399;
    wire _1396;
    wire _1400;
    wire _1407;
    wire _1408;
    wire _1409;
    wire [15:0] _3185;
    wire [15:0] _3176;
    wire [15:0] _3177;
    wire [15:0] _3178;
    wire [15:0] _3179;
    wire [15:0] _3180;
    wire [15:0] _3186;
    wire [15:0] _3188;
    wire [15:0] _204;
    reg [15:0] _1657;
    wire _1658;
    wire _3078;
    wire _3079;
    wire _3194;
    wire _3192;
    wire _3193;
    wire _3195;
    wire [2:0] _3199;
    wire _3190;
    wire [2:0] _3204;
    wire [2:0] _3205;
    wire [2:0] _3206;
    wire [2:0] _3224;
    wire [2:0] _3226;
    wire [2:0] _205;
    reg [2:0] _1392;
    wire _1393;
    wire [1:0] _207;
    wire _1388;
    wire _1389;
    wire _1394;
    wire _1679;
    wire _1686;
    wire _3240;
    wire _3241;
    wire _1674;
    wire _1672;
    wire _1675;
    wire _1676;
    wire _1677;
    wire _3233;
    wire _3230;
    wire _3227;
    wire _3228;
    wire _3231;
    wire _3232;
    wire _3234;
    wire _3242;
    wire _3244;
    wire _3246;
    wire _3248;
    wire _3250;
    wire _208;
    reg _1376;
    wire _1377;
    wire _1378;
    wire _1371;
    wire _1372;
    wire _1368;
    wire _210;
    wire _1365;
    wire _1366;
    wire _1367;
    wire _1369;
    wire _1373;
    wire _1374;
    wire _1379;
    wire [1:0] _3319;
    wire _1360;
    wire _1361;
    wire _1356;
    wire _1355;
    wire _1354;
    wire _1353;
    wire _1352;
    wire _1351;
    wire _1350;
    wire _1349;
    reg _1357;
    wire _1358;
    wire _1347;
    wire _1346;
    wire _1345;
    wire _1344;
    wire _1343;
    wire _1342;
    wire _1341;
    wire _1340;
    wire [2:0] _212;
    reg _1348;
    wire _1359;
    wire _214;
    wire _1362;
    wire _1338;
    wire _1335;
    wire _1328;
    wire _1326;
    wire [13:0] _1317;
    wire [15:0] _1318;
    wire [14:0] _1314;
    wire [15:0] _1315;
    wire [15:0] _1319;
    wire [14:0] _1311;
    wire [15:0] _1312;
    wire _1309;
    wire [15:0] _1320;
    reg [15:0] _1323;
    wire _1324;
    wire [13:0] _1301;
    wire [15:0] _1302;
    reg [15:0] _1305;
    wire _3296;
    wire _3297;
    wire [15:0] _3298;
    wire [15:0] _3300;
    wire [15:0] _3302;
    wire _3280;
    wire [14:0] _1330;
    wire [15:0] _1331;
    reg [15:0] _1334;
    wire [16:0] _3276;
    wire _3277;
    wire [16:0] _3270;
    reg [16:0] _3273;
    wire [15:0] _216;
    wire [16:0] _3264;
    wire [16:0] _3266;
    reg [16:0] _3269;
    wire [7:0] _218;
    wire [8:0] _3284;
    wire [7:0] _3286;
    wire [7:0] _3287;
    wire [7:0] _3288;
    wire [7:0] _3290;
    wire [7:0] _219;
    reg [7:0] _3258;
    wire [8:0] _3283;
    wire [8:0] _3285;
    wire _3291;
    wire _3292;
    wire _3293;
    wire _3295;
    wire _220;
    reg _3263;
    wire [16:0] _3274;
    wire [16:0] _3260;
    wire _3275;
    wire _3278;
    wire _3281;
    wire _3259;
    wire _3282;
    wire [15:0] _3304;
    wire _3254;
    wire _3252;
    wire _602;
    wire _3251;
    wire _3253;
    wire _3255;
    wire [15:0] _3305;
    wire [15:0] _3307;
    wire [15:0] _221;
    reg [15:0] _1299;
    wire _1306;
    wire _1307;
    wire _1296;
    wire _1308;
    wire _1325;
    wire _1327;
    wire _1336;
    wire [1:0] _223;
    wire _1292;
    wire _1293;
    wire _1290;
    wire _1294;
    wire _1287;
    wire _1283;
    wire _1282;
    wire _1281;
    wire _1280;
    wire _1279;
    wire _1278;
    wire _1277;
    wire _1276;
    reg _1284;
    wire _1274;
    wire _1273;
    wire _1272;
    wire _1271;
    wire _1270;
    wire _1269;
    wire _1268;
    wire _1267;
    wire [2:0] _225;
    reg _1275;
    wire _1285;
    wire _1286;
    wire _1288;
    wire _1295;
    wire _1339;
    wire _227;
    wire _1363;
    wire _229;
    wire _1266;
    wire _1364;
    wire [1:0] _3371;
    wire _1667;
    wire [1:0] _3373;
    wire _3113;
    wire [1:0] _3380;
    wire _1263;
    wire [1:0] _3386;
    wire [2:0] _2337;
    wire [2:0] _2336;
    wire [2:0] _2335;
    wire [2:0] _2334;
    reg [2:0] _2338;
    wire _2330;
    wire _2329;
    wire _2328;
    wire _2327;
    reg _2331;
    wire _3308;
    wire _3309;
    wire [2:0] _3311;
    wire [2:0] _230;
    wire _1261;
    wire [1:0] _3388;
    wire [1:0] _231;
    reg [1:0] _600;
    wire _1265;
    wire _1670;
    wire _1678;
    wire _3402;
    wire _3404;
    wire _3408;
    wire _3399;
    wire _3397;
    wire _3400;
    wire _3401;
    wire _3409;
    wire _232;
    wire _3086;
    wire _2283;
    wire _2675;
    wire _234;
    wire _2676;
    wire _3410;
    wire [3:0] _3416;
    reg [3:0] _3419;
    wire [3:0] _235;
    wire _588;
    wire [7:0] _3421;
    wire [1:0] _3394;
    wire [1:0] _3392;
    wire [1:0] _3391;
    wire [1:0] _3390;
    wire [1:0] _3389;
    reg [1:0] _3393;
    wire [1:0] _3395;
    reg [7:0] _3433;
    wire [7:0] _3434;
    wire [7:0] _236;
    reg [7:0] _581;
    wire _582;
    wire [7:0] _3445;
    wire [7:0] _3444;
    wire [7:0] _3442;
    wire [7:0] _3443;
    wire [1:0] _3440;
    wire [111:0] _701;
    wire [1:0] _3438;
    wire [111:0] _695;
    wire [1:0] _3437;
    wire [1:0] _3436;
    wire [1:0] _3435;
    reg [1:0] _3439;
    wire [1:0] _3441;
    reg [7:0] _3446;
    wire [7:0] _3447;
    wire [7:0] _237;
    reg [7:0] _576;
    wire _578;
    wire [3:0] _806;
    reg _807;
    wire _809;
    wire [15:0] _801;
    wire _803;
    wire [15:0] _792;
    wire [16:0] _793;
    wire [16:0] _794;
    reg [16:0] _797;
    wire _798;
    wire _799;
    wire [15:0] _788;
    wire _790;
    wire [2:0] _536;
    wire [2:0] _3462;
    wire _3458;
    wire _3459;
    wire _3456;
    wire _3460;
    wire [2:0] _3463;
    wire _3453;
    wire _3454;
    wire _3452;
    wire _3455;
    wire [2:0] _3465;
    wire _3449;
    wire [2:0] _3451;
    wire _3448;
    wire [2:0] _3466;
    wire [2:0] _238;
    reg [2:0] _532;
    wire _534;
    wire [2:0] _537;
    wire _527;
    wire _528;
    wire _526;
    wire _529;
    wire [2:0] _539;
    wire _523;
    wire _524;
    wire [2:0] _540;
    wire _772;
    wire [2:0] _774;
    wire [2:0] _515;
    wire [2:0] _3481;
    wire _3477;
    wire _3478;
    wire _3475;
    wire _3479;
    wire [2:0] _3482;
    wire _3472;
    wire _3473;
    wire _3471;
    wire _3474;
    wire [2:0] _3484;
    wire _3468;
    wire [2:0] _3470;
    wire _3467;
    wire [2:0] _3485;
    wire [2:0] _239;
    reg [2:0] _511;
    wire _513;
    wire [2:0] _516;
    wire _506;
    wire _507;
    wire _505;
    wire _508;
    wire [2:0] _518;
    wire _502;
    wire _503;
    wire [2:0] _519;
    wire _769;
    wire [2:0] _771;
    wire _775;
    wire [2:0] _776;
    wire [2:0] _492;
    wire [2:0] _3500;
    wire _3496;
    wire _3497;
    wire _3494;
    wire _3498;
    wire [2:0] _3501;
    wire _3491;
    wire _3492;
    wire _3490;
    wire _3493;
    wire [2:0] _3503;
    wire _3487;
    wire [2:0] _3489;
    wire _3486;
    wire [2:0] _3504;
    wire [2:0] _240;
    reg [2:0] _488;
    wire _490;
    wire [2:0] _493;
    wire _483;
    wire _484;
    wire _482;
    wire _485;
    wire [2:0] _495;
    wire _479;
    wire _480;
    wire [2:0] _496;
    wire _764;
    wire [2:0] _766;
    wire [2:0] _471;
    wire [2:0] _3519;
    wire _3515;
    wire _3516;
    wire _3513;
    wire _3517;
    wire [2:0] _3520;
    wire _3510;
    wire _3511;
    wire _3509;
    wire _3512;
    wire [2:0] _3522;
    wire _3506;
    wire [2:0] _3508;
    wire _3505;
    wire [2:0] _3523;
    wire [2:0] _241;
    reg [2:0] _467;
    wire _469;
    wire [2:0] _472;
    wire _462;
    wire _463;
    wire _461;
    wire _464;
    wire [2:0] _474;
    wire _458;
    wire _459;
    wire [2:0] _475;
    wire _761;
    wire [2:0] _763;
    wire _767;
    wire [2:0] _768;
    wire _777;
    wire [2:0] _778;
    wire [2:0] _446;
    wire [2:0] _3538;
    wire _3534;
    wire _3535;
    wire _3532;
    wire _3536;
    wire [2:0] _3539;
    wire _3529;
    wire _3530;
    wire _3528;
    wire _3531;
    wire [2:0] _3541;
    wire _3525;
    wire [2:0] _3527;
    wire _3524;
    wire [2:0] _3542;
    wire [2:0] _242;
    reg [2:0] _442;
    wire _444;
    wire [2:0] _447;
    wire _437;
    wire _438;
    wire _436;
    wire _439;
    wire [2:0] _449;
    wire _433;
    wire _434;
    wire [2:0] _450;
    wire _754;
    wire [2:0] _756;
    wire [2:0] _425;
    wire [2:0] _3557;
    wire _3553;
    wire _3554;
    wire _3551;
    wire _3555;
    wire [2:0] _3558;
    wire _3548;
    wire _3549;
    wire _3547;
    wire _3550;
    wire [2:0] _3560;
    wire _3544;
    wire [2:0] _3546;
    wire _3543;
    wire [2:0] _3561;
    wire [2:0] _243;
    reg [2:0] _421;
    wire _423;
    wire [2:0] _426;
    wire _416;
    wire _417;
    wire _415;
    wire _418;
    wire [2:0] _428;
    wire _412;
    wire _413;
    wire [2:0] _429;
    wire _751;
    wire [2:0] _753;
    wire _757;
    wire [2:0] _758;
    wire [2:0] _402;
    wire [2:0] _3576;
    wire _3572;
    wire _3573;
    wire _3570;
    wire _3574;
    wire [2:0] _3577;
    wire _3567;
    wire _3568;
    wire _3566;
    wire _3569;
    wire [2:0] _3579;
    wire _3563;
    wire [2:0] _3565;
    wire _3562;
    wire [2:0] _3580;
    wire [2:0] _244;
    reg [2:0] _398;
    wire _400;
    wire [2:0] _403;
    wire _393;
    wire _394;
    wire _392;
    wire _395;
    wire [2:0] _405;
    wire _389;
    wire _390;
    wire [2:0] _406;
    wire _746;
    wire [2:0] _748;
    wire [2:0] _381;
    wire [2:0] _3595;
    wire _3591;
    wire _3592;
    wire _3589;
    wire _3593;
    wire [2:0] _3596;
    wire _3586;
    wire _3587;
    wire _3585;
    wire _3588;
    wire [2:0] _3598;
    wire _3582;
    wire [2:0] _3584;
    wire _3581;
    wire [2:0] _3599;
    wire [2:0] _245;
    reg [2:0] _377;
    wire _379;
    wire [2:0] _382;
    wire _372;
    wire _373;
    wire _371;
    wire _374;
    wire [2:0] _384;
    wire _368;
    wire _369;
    wire [2:0] _385;
    wire [7:0] _742;
    wire _743;
    wire [2:0] _745;
    wire _749;
    wire [2:0] _750;
    wire _759;
    wire [2:0] _760;
    wire _779;
    wire [2:0] _780;
    wire [16:0] _781;
    wire _3602;
    wire [127:0] _3603;
    wire _3600;
    wire [127:0] _3604;
    wire [127:0] _246;
    reg [127:0] _290;
    wire _357;
    wire _358;
    wire [127:0] _359;
    wire _3607;
    wire [127:0] _3608;
    wire _3605;
    wire [127:0] _3609;
    wire [127:0] _247;
    reg [127:0] _287;
    wire _353;
    wire _354;
    wire [127:0] _355;
    wire _3612;
    wire [127:0] _3613;
    wire _3610;
    wire [127:0] _3614;
    wire [127:0] _248;
    reg [127:0] _284;
    wire _349;
    wire _350;
    wire [127:0] _351;
    wire [127:0] _250;
    wire _345;
    wire _346;
    wire [127:0] _347;
    wire [511:0] _360;
    wire [111:0] _738;
    wire [15:0] _739;
    wire [16:0] _740;
    wire [16:0] _782;
    reg [16:0] _785;
    wire gnd;
    wire [16:0] _737;
    wire _786;
    wire _787;
    wire _791;
    wire _800;
    wire [15:0] _3642;
    wire _3638;
    wire _3639;
    wire _3640;
    wire [15:0] _3643;
    wire _3622;
    wire _3623;
    wire [15:0] _3645;
    wire [15:0] _3647;
    wire [15:0] _251;
    reg [15:0] _333;
    wire [15:0] _3659;
    wire _3655;
    wire _3656;
    wire [8:0] _3634;
    wire _3635;
    wire [5:0] _3632;
    wire [5:0] _3631;
    wire _3633;
    wire [8:0] _3626;
    wire [8:0] _3648;
    wire [8:0] _3649;
    wire [8:0] _3651;
    wire [8:0] _252;
    reg [8:0] _3627;
    wire [2:0] _3628;
    wire _3630;
    wire [1:0] _3624;
    reg _3636;
    wire _3657;
    wire [15:0] _3660;
    wire _3652;
    wire _3653;
    wire [15:0] _3662;
    wire [15:0] _3664;
    wire [15:0] _253;
    reg [15:0] _330;
    wire [1:0] _733;
    reg [15:0] _734;
    wire _736;
    wire _804;
    reg [7:0] _315;
    wire [7:0] f_chg_now;
    wire _3666;
    wire [7:0] _3668;
    wire _3665;
    wire [7:0] _3669;
    wire [7:0] _3671;
    wire [7:0] _254;
    reg [7:0] _312;
    wire [7:0] f_changed_all;
    wire [7:0] _727;
    wire _729;
    wire _730;
    wire [7:0] f_chgmask1;
    wire _726;
    wire _731;
    wire [7:0] _720;
    wire [7:0] _718;
    wire vdd;
    wire _256;
    wire _258;
    wire [7:0] _260;
    reg [7:0] _296;
    reg [7:0] _299;
    wire [7:0] _719;
    wire [7:0] _721;
    wire _723;
    wire [111:0] _689;
    wire f_valid1;
    wire _724;
    wire _732;
    wire _805;
    wire _810;
    wire _849;
    wire _850;
    wire _854;
    wire f_fire1;
    wire [1:0] _998;
    wire [1:0] f_winner;
    reg [2:0] _3619;
    wire [2:0] _3621;
    wire _3672;
    wire _3673;
    wire [15:0] _3682;
    wire [15:0] _3684;
    wire [15:0] _261;
    reg [15:0] _327;
    wire [1:0] _1764;
    reg [15:0] _1765;
    wire [15:0] _1763;
    wire _1766;
    wire [63:0] _684;
    wire _1761;
    wire _1759;
    wire _1760;
    wire _1762;
    wire _1767;
    wire _1772;
    wire _1780;
    wire _1781;
    wire [2:0] _3690;
    wire [2:0] _3693;
    wire _3686;
    wire [2:0] _3694;
    wire _3685;
    wire [2:0] _3697;
    wire [2:0] _3699;
    wire [2:0] _262;
    reg [2:0] _343;
    wire _3702;
    wire [127:0] _3703;
    wire _3700;
    wire [127:0] _3704;
    wire [127:0] _263;
    reg [127:0] _281;
    wire [511:0] _291;
    wire [111:0] _292;
    wire f_valid0;
    wire _306;
    wire _323;
    wire _572;
    wire _629;
    wire _673;
    wire f_in_eval;
    wire _674;
    wire _683;
    wire f_fire0;
    wire _1084;
    wire _1085;
    wire _1180;
    wire [1:0] _3723;
    wire _3708;
    wire [1:0] _3710;
    wire _3706;
    wire [1:0] _3724;
    wire _3705;
    wire [1:0] _3727;
    wire _265;
    wire [1:0] _3729;
    wire [1:0] _3731;
    wire [1:0] _266;
    reg [1:0] _276;
    wire f_in_fetch;
    wire _1712;
    wire _1713;
    wire _2304;
    wire [7:0] _3753;
    wire _268;
    wire [7:0] _3755;
    wire [7:0] _269;
    reg [7:0] _2368;
    wire _2369;
    wire [23:0] _271;
    wire [2:0] _2365;
    reg _2376;
    wire [7:0] _2440;
    wire [7:0] _3757;
    assign _1231 = _50[11:0];
    assign _1228 = _1221 < _1218;
    assign _1229 = _1203 & _1228;
    assign _1230 = _1229 ? _1218 : _1221;
    assign _1232 = _1230 < _1231;
    assign _1233 = _1232 ? _1231 : _1230;
    assign _1234 = _1214 ? _1230 : _1233;
    assign _1220 = 12'b000000000000;
    assign _1077 = 12'b111111111111;
    assign _1074 = _1072[11:0];
    assign _1071 = 13'b0000000000000;
    assign _1068 = 10'b0000000000;
    assign _1069 = { _1068,
                     _1065 };
    assign _1070 = _1061 - _1069;
    assign _1064 = 3'b000;
    always @* begin
        case (f_winner)
        0:
            _1044 <= _643;
        1:
            _1044 <= _819;
        2:
            _1044 <= _957;
        default:
            _1044 <= _1043;
        endcase
    end
    assign _1 = _1044;
    always @(posedge _258) begin
        if (_256)
            _1065 <= _1064;
        else
            _1065 <= _1;
    end
    assign _1066 = { _1068,
                     _1065 };
    assign _1051 = 13'b1111111111111;
    assign _1050 = _1048[12:0];
    assign _1045 = 16'b0001111111111111;
    assign _1049 = _1045 < _1048;
    assign _1052 = _1049 ? _1051 : _1050;
    assign _2 = _1052;
    always @(posedge _258) begin
        if (_256)
            _1061 <= _1071;
        else
            _1061 <= _2;
    end
    assign _1067 = _1061 < _1066;
    assign _1072 = _1067 ? _1071 : _1070;
    assign _1058 = 13'b0111111111111;
    assign _1073 = _1058 < _1072;
    assign _1076 = _1073 ? _1077 : _1074;
    assign _1056 = 1'b0;
    assign _1053 = 16'b1111111111111111;
    assign _1054 = _1048 == _1053;
    assign _3 = _1054;
    always @(posedge _258) begin
        if (_256)
            _1057 <= _1056;
        else
            _1057 <= _3;
    end
    assign _1078 = _1057 ? _1077 : _1076;
    assign _4 = _1078;
    always @(posedge _258) begin
        if (_256)
            _1221 <= _1220;
        else
            _1221 <= _4;
    end
    assign _1081 = _1048[11:0];
    always @* begin
        case (f_winner)
        0:
            _1047 <= _324;
        1:
            _1047 <= _733;
        2:
            _1047 <= _871;
        default:
            _1047 <= _1046;
        endcase
    end
    always @* begin
        case (_1047)
        0:
            _1048 <= _327;
        1:
            _1048 <= _330;
        2:
            _1048 <= _333;
        default:
            _1048 <= _333;
        endcase
    end
    assign _1079 = 16'b0000111111111111;
    assign _1080 = _1079 < _1048;
    assign _1083 = _1080 ? _1077 : _1081;
    assign _5 = _1083;
    always @(posedge _258) begin
        if (_256)
            _1218 <= _1220;
        else
            _1218 <= _5;
    end
    assign _1222 = _1218 < _1221;
    assign _1223 = _1203 & _1222;
    assign _1224 = _1223 ? _1218 : _1221;
    assign _1215 = _50[23:12];
    assign _1225 = _1215 < _1224;
    assign _1226 = _1225 ? _1215 : _1224;
    assign _1213 = 8'b00000000;
    assign _1214 = _1198 == _1213;
    assign _1227 = _1214 ? _1224 : _1226;
    assign _1211 = 8'b11111111;
    assign _1210 = _1208[7:0];
    assign _1205 = 2'b10;
    assign _1204 = 2'b01;
    assign _1193 = _1189 == _1192;
    assign _1185 = _1181 & _1184;
    assign _1194 = _1185 & _1193;
    assign _6 = _1194;
    always @(posedge _258) begin
        if (_256)
            _1203 <= _1056;
        else
            _1203 <= _6;
    end
    assign _1206 = _1203 ? _1205 : _1204;
    assign _1200 = 7'b0000000;
    assign _1207 = { _1200,
                     _1206 };
    assign _1198 = _50[31:24];
    assign _1199 = { gnd,
                     _1198 };
    assign _1208 = _1199 + _1207;
    assign _1209 = _1208[8:8];
    assign _1212 = _1209 ? _1211 : _1210;
    assign _1235 = { _1212,
                     _1227,
                     _1234 };
    assign _8 = host_cov_wdata;
    assign _1236 = _1197 ? _1235 : _8;
    assign _1244 = _1197 | _1243;
    assign _1242 = ~ _1184;
    assign _1240 = ~ _1197;
    assign _12 = host_cov_we;
    assign _1239 = _12 & _1238;
    assign _1241 = _1239 & _1240;
    assign _1243 = _1241 & _1242;
    assign _1246 = ~ _1243;
    assign _1245 = ~ _1197;
    assign _1247 = _1245 & _1246;
    assign _14 = _1192;
    always @(posedge _258) begin
        if (_256)
            _1251 <= _1213;
        else
            _1251 <= _14;
    end
    assign _16 = host_cov_addr;
    assign _1248 = _1184 ? _1192 : _16;
    assign _17 = _1184;
    always @(posedge _258) begin
        if (_256)
            _1197 <= _1056;
        else
            _1197 <= _17;
    end
    assign _1252 = _1197 ? _1251 : _1248;
    assign _20 = host_rec_wdata;
    assign _23 = host_rec_we;
    assign _1253 = _23 & _1238;
    assign _1257 = _343[1:0];
    assign _1258 = { _1188,
                     _1257 };
    assign _27 = host_rec_waddr;
    assign _1254 = 3'b100;
    assign _1255 = _343 < _1254;
    assign _1256 = f_in_fetch & _1255;
    assign _1259 = _1256 ? _1258 : _27;
    assign _1410 = 3'b001;
    assign _1411 = _1409 ? _1410 : _1386;
    assign _1383 = 3'b010;
    assign _1385 = _1376 ? _1254 : _1383;
    assign _1386 = _1379 ? _1385 : _1382;
    assign _1412 = _1364 ? _1411 : _1386;
    assign _1414 = _1263 ? _1064 : _1412;
    assign _1416 = _1261 ? _1064 : _1414;
    assign _29 = _1416;
    always @(posedge _258) begin
        if (_256)
            _1382 <= _1064;
        else
            _1382 <= _29;
    end
    assign _1575 = { _602,
                     _605,
                     _608,
                     _611,
                     gnd,
                     _1382 };
    assign _1568 = _1566 ? _1410 : _1543;
    assign _1542 = _1533 ? _1254 : _1383;
    assign _1543 = _1536 ? _1542 : _1539;
    assign _1569 = _1521 ? _1568 : _1543;
    assign _1571 = _1420 ? _1064 : _1569;
    assign _1573 = _1418 ? _1064 : _1571;
    assign _30 = _1573;
    always @(posedge _258) begin
        if (_256)
            _1539 <= _1064;
        else
            _1539 <= _30;
    end
    assign _1574 = { _616,
                     _619,
                     _622,
                     _625,
                     gnd,
                     _1539 };
    assign _1576 = { _1574,
                     _1575 };
    assign _1586 = 1'b1;
    assign _32 = _1189;
    always @(posedge _258) begin
        if (_256)
            _1192 <= _1213;
        else
            _1192 <= _32;
    end
    assign _1189 = { _1188,
                     f_winner };
    assign _1580 = _1189 == _1192;
    assign _1581 = ~ _1580;
    assign _1577 = ~ _1184;
    assign _1578 = _1181 & _1577;
    assign _33 = _1578;
    always @(posedge _258) begin
        if (_256)
            _1184 <= _1056;
        else
            _1184 <= _33;
    end
    assign _35 = host_cover_en;
    assign _1181 = _1180 & _35;
    assign _1579 = _1181 & _1184;
    assign _1582 = _1579 & _1581;
    assign _1587 = _1582 ? _1586 : _1585;
    assign _1589 = _268 ? _1056 : _1587;
    assign _36 = _1589;
    always @(posedge _258) begin
        if (_256)
            _1585 <= _1056;
        else
            _1585 <= _36;
    end
    assign _1592 = _64 & _1591;
    assign _1597 = _1592 ? _1586 : _1595;
    assign _1599 = _268 ? _1056 : _1597;
    assign _38 = _1599;
    always @(posedge _258) begin
        if (_256)
            _1595 <= _1056;
        else
            _1595 <= _38;
    end
    assign _1731 = ~ _1730;
    assign _1724 = _1709 & _1723;
    assign _1732 = _1724 & _1731;
    assign _1705 = ~ _1704;
    assign _1652 = _1602 & _1651;
    assign _1706 = _1652 & _1705;
    assign _1733 = _1706 | _1732;
    assign _40 = _1733;
    assign _1734 = _128 & _590;
    assign _1735 = _1734 | _40;
    assign _1740 = _1735 ? _1586 : _1738;
    assign _1742 = _268 ? _1056 : _1740;
    assign _41 = _1742;
    always @(posedge _258) begin
        if (_256)
            _1738 <= _1056;
        else
            _1738 <= _41;
    end
    assign _1746 = _684[61:61];
    assign _1747 = _1712 & _1746;
    assign _1752 = _1747 ? _1586 : _1750;
    assign _45 = host_irq_ack;
    assign _1754 = _45 ? _1056 : _1752;
    assign _1756 = _268 ? _1056 : _1754;
    assign _46 = _1756;
    always @(posedge _258) begin
        if (_256)
            _1750 <= _1056;
        else
            _1750 <= _46;
    end
    assign _1785 = _713 == _1784;
    assign _1787 = _1785 ? _1586 : _1745;
    assign _1783 = _713 == _2287;
    assign _1789 = _1783 ? _1586 : _1787;
    assign _1790 = _1781 ? _1789 : _1745;
    assign _1791 = _1180 ? _1745 : _1790;
    assign _1758 = _276 == _1205;
    assign _1792 = _1758 ? _1791 : _1745;
    assign _1794 = _268 ? _1056 : _1792;
    assign _47 = _1794;
    always @(posedge _258) begin
        if (_256)
            _1745 <= _1056;
        else
            _1745 <= _47;
    end
    assign _1800 = ~ _1799;
    assign _1797 = ~ _1796;
    assign _1801 = _1797 | _1800;
    assign _1802 = _1801 | _1745;
    assign _1803 = _1802 | _1750;
    assign _50 = ram_cov_rdata;
    assign _2170 = 3'b111;
    assign _2171 = _1808 == _2170;
    assign _2172 = _1805 & _2171;
    assign _2169 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _258) begin
        if (_256)
            _2173 <= _2169;
        else
            if (_2172)
                _2173 <= _63;
    end
    assign _2164 = 3'b110;
    assign _2165 = _1808 == _2164;
    assign _2166 = _1805 & _2165;
    always @(posedge _258) begin
        if (_256)
            _2167 <= _2169;
        else
            if (_2166)
                _2167 <= _63;
    end
    assign _2158 = 3'b101;
    assign _2159 = _1808 == _2158;
    assign _2160 = _1805 & _2159;
    always @(posedge _258) begin
        if (_256)
            _2161 <= _2169;
        else
            if (_2160)
                _2161 <= _63;
    end
    assign _2153 = _1808 == _1254;
    assign _2154 = _1805 & _2153;
    always @(posedge _258) begin
        if (_256)
            _2155 <= _2169;
        else
            if (_2154)
                _2155 <= _63;
    end
    assign _2146 = 3'b011;
    assign _2147 = _1808 == _2146;
    assign _2148 = _1805 & _2147;
    always @(posedge _258) begin
        if (_256)
            _2149 <= _2169;
        else
            if (_2148)
                _2149 <= _63;
    end
    assign _2141 = _1808 == _1383;
    assign _2142 = _1805 & _2141;
    always @(posedge _258) begin
        if (_256)
            _2143 <= _2169;
        else
            if (_2142)
                _2143 <= _63;
    end
    assign _2135 = _1808 == _1410;
    assign _2136 = _1805 & _2135;
    always @(posedge _258) begin
        if (_256)
            _2137 <= _2169;
        else
            if (_2136)
                _2137 <= _63;
    end
    assign _1810 = _1808 + _1410;
    assign _1811 = _1805 ? _1810 : _1808;
    assign _53 = _1811;
    always @(posedge _258) begin
        if (_256)
            _1808 <= _1064;
        else
            _1808 <= _53;
    end
    assign _2129 = _1808 == _1064;
    assign _2130 = _1805 & _2129;
    assign _2102 = _1993 - _2098;
    assign _1819 = 29'b11111111111111111111111111111;
    assign _1818 = 29'b00000000000000000000000000000;
    assign _1821 = 29'b00000000000000000000000000001;
    assign _1822 = ts_hi_m1 + _1821;
    assign _1815 = ts_reg[2:0];
    assign _1817 = _1815 == _2170;
    assign _1823 = _1817 ? _1822 : ts_hi_m1;
    assign _54 = _1823;
    always @(posedge _258) begin
        if (_256)
            ts_hi_m1 <= _1819;
        else
            ts_hi_m1 <= _54;
    end
    assign _2100 = ts_reg[31:3];
    assign _1841 = _1828 + _1410;
    assign _1837 = _1828 == _2170;
    assign _1838 = ~ _1837;
    assign _1835 = _677[0:0];
    assign _1839 = _1835 & _1838;
    assign _1842 = _1839 ? _1841 : _1828;
    assign _1832 = _677[0:0];
    assign _1833 = ~ _1832;
    assign _1830 = _312[0:0];
    assign _1829 = f_chg_now[0:0];
    assign _1831 = _1829 & _1830;
    assign _1834 = _1831 & _1833;
    assign _1844 = _1834 ? _1410 : _1842;
    assign _1825 = _276 == _1204;
    assign _1845 = _1825 ? _1844 : _1828;
    assign _55 = _1845;
    always @(posedge _258) begin
        if (_256)
            _1828 <= _1064;
        else
            _1828 <= _55;
    end
    assign _2091 = _677[0:0];
    assign _2093 = _2091 ? _1828 : _1064;
    assign _1862 = _1849 + _1410;
    assign _1858 = _1849 == _2170;
    assign _1859 = ~ _1858;
    assign _1856 = _677[1:1];
    assign _1860 = _1856 & _1859;
    assign _1863 = _1860 ? _1862 : _1849;
    assign _1853 = _677[1:1];
    assign _1854 = ~ _1853;
    assign _1851 = _312[1:1];
    assign _1850 = f_chg_now[1:1];
    assign _1852 = _1850 & _1851;
    assign _1855 = _1852 & _1854;
    assign _1865 = _1855 ? _1410 : _1863;
    assign _1846 = _276 == _1204;
    assign _1866 = _1846 ? _1865 : _1849;
    assign _56 = _1866;
    always @(posedge _258) begin
        if (_256)
            _1849 <= _1064;
        else
            _1849 <= _56;
    end
    assign _2088 = _677[1:1];
    assign _2090 = _2088 ? _1849 : _1064;
    assign _2094 = _2050 ? _2093 : _2090;
    assign _1883 = _1870 + _1410;
    assign _1879 = _1870 == _2170;
    assign _1880 = ~ _1879;
    assign _1877 = _677[2:2];
    assign _1881 = _1877 & _1880;
    assign _1884 = _1881 ? _1883 : _1870;
    assign _1874 = _677[2:2];
    assign _1875 = ~ _1874;
    assign _1872 = _312[2:2];
    assign _1871 = f_chg_now[2:2];
    assign _1873 = _1871 & _1872;
    assign _1876 = _1873 & _1875;
    assign _1886 = _1876 ? _1410 : _1884;
    assign _1867 = _276 == _1204;
    assign _1887 = _1867 ? _1886 : _1870;
    assign _57 = _1887;
    always @(posedge _258) begin
        if (_256)
            _1870 <= _1064;
        else
            _1870 <= _57;
    end
    assign _2084 = _677[2:2];
    assign _2086 = _2084 ? _1870 : _1064;
    assign _1904 = _1891 + _1410;
    assign _1900 = _1891 == _2170;
    assign _1901 = ~ _1900;
    assign _1898 = _677[3:3];
    assign _1902 = _1898 & _1901;
    assign _1905 = _1902 ? _1904 : _1891;
    assign _1895 = _677[3:3];
    assign _1896 = ~ _1895;
    assign _1893 = _312[3:3];
    assign _1892 = f_chg_now[3:3];
    assign _1894 = _1892 & _1893;
    assign _1897 = _1894 & _1896;
    assign _1907 = _1897 ? _1410 : _1905;
    assign _1888 = _276 == _1204;
    assign _1908 = _1888 ? _1907 : _1891;
    assign _58 = _1908;
    always @(posedge _258) begin
        if (_256)
            _1891 <= _1064;
        else
            _1891 <= _58;
    end
    assign _2081 = _677[3:3];
    assign _2083 = _2081 ? _1891 : _1064;
    assign _2087 = _2053 ? _2086 : _2083;
    assign _2095 = _2052 ? _2094 : _2087;
    assign _1925 = _1912 + _1410;
    assign _1921 = _1912 == _2170;
    assign _1922 = ~ _1921;
    assign _1919 = _677[4:4];
    assign _1923 = _1919 & _1922;
    assign _1926 = _1923 ? _1925 : _1912;
    assign _1916 = _677[4:4];
    assign _1917 = ~ _1916;
    assign _1914 = _312[4:4];
    assign _1913 = f_chg_now[4:4];
    assign _1915 = _1913 & _1914;
    assign _1918 = _1915 & _1917;
    assign _1928 = _1918 ? _1410 : _1926;
    assign _1909 = _276 == _1204;
    assign _1929 = _1909 ? _1928 : _1912;
    assign _59 = _1929;
    always @(posedge _258) begin
        if (_256)
            _1912 <= _1064;
        else
            _1912 <= _59;
    end
    assign _2076 = _677[4:4];
    assign _2078 = _2076 ? _1912 : _1064;
    assign _1946 = _1933 + _1410;
    assign _1942 = _1933 == _2170;
    assign _1943 = ~ _1942;
    assign _1940 = _677[5:5];
    assign _1944 = _1940 & _1943;
    assign _1947 = _1944 ? _1946 : _1933;
    assign _1937 = _677[5:5];
    assign _1938 = ~ _1937;
    assign _1935 = _312[5:5];
    assign _1934 = f_chg_now[5:5];
    assign _1936 = _1934 & _1935;
    assign _1939 = _1936 & _1938;
    assign _1949 = _1939 ? _1410 : _1947;
    assign _1930 = _276 == _1204;
    assign _1950 = _1930 ? _1949 : _1933;
    assign _60 = _1950;
    always @(posedge _258) begin
        if (_256)
            _1933 <= _1064;
        else
            _1933 <= _60;
    end
    assign _2073 = _677[5:5];
    assign _2075 = _2073 ? _1933 : _1064;
    assign _2079 = _2057 ? _2078 : _2075;
    assign _1967 = _1954 + _1410;
    assign _1963 = _1954 == _2170;
    assign _1964 = ~ _1963;
    assign _1961 = _677[6:6];
    assign _1965 = _1961 & _1964;
    assign _1968 = _1965 ? _1967 : _1954;
    assign _1958 = _677[6:6];
    assign _1959 = ~ _1958;
    assign _1956 = _312[6:6];
    assign _1955 = f_chg_now[6:6];
    assign _1957 = _1955 & _1956;
    assign _1960 = _1957 & _1959;
    assign _1970 = _1960 ? _1410 : _1968;
    assign _1951 = _276 == _1204;
    assign _1971 = _1951 ? _1970 : _1954;
    assign _61 = _1971;
    always @(posedge _258) begin
        if (_256)
            _1954 <= _1064;
        else
            _1954 <= _61;
    end
    assign _2069 = _677[6:6];
    assign _2071 = _2069 ? _1954 : _1064;
    assign _1988 = _1975 + _1410;
    assign _1984 = _1975 == _2170;
    assign _1985 = ~ _1984;
    assign _1982 = _677[7:7];
    assign _1986 = _1982 & _1985;
    assign _1989 = _1986 ? _1988 : _1975;
    assign _1979 = _677[7:7];
    assign _1980 = ~ _1979;
    assign _1977 = _312[7:7];
    assign _1976 = f_chg_now[7:7];
    assign _1978 = _1976 & _1977;
    assign _1981 = _1978 & _1980;
    assign _1991 = _1981 ? _1410 : _1989;
    assign _1972 = _276 == _1204;
    assign _1992 = _1972 ? _1991 : _1975;
    assign _62 = _1992;
    always @(posedge _258) begin
        if (_256)
            _1975 <= _1064;
        else
            _1975 <= _62;
    end
    assign _2066 = _677[7:7];
    assign _2068 = _2066 ? _1975 : _1064;
    assign _2072 = _2060 ? _2071 : _2068;
    assign _2080 = _2059 ? _2079 : _2072;
    assign _2096 = _2056 ? _2095 : _2080;
    assign _2061 = _707[7:7];
    assign _2060 = _707[6:6];
    assign _2062 = _2060 | _2061;
    assign _2058 = _707[5:5];
    assign _2057 = _707[4:4];
    assign _2059 = _2057 | _2058;
    assign _2063 = _2059 | _2062;
    assign _2054 = _707[3:3];
    assign _2053 = _707[2:2];
    assign _2055 = _2053 | _2054;
    assign _2051 = _707[1:1];
    assign _2050 = _707[0:0];
    assign _2052 = _2050 | _2051;
    assign _2056 = _2052 | _2055;
    assign _2064 = _2056 | _2063;
    assign _2097 = _2064 ? _2096 : _1064;
    assign _2039 = f_watch[0:0];
    assign _2038 = _312[0:0];
    assign _2040 = _2038 & _2039;
    assign _2042 = _2040 ? _532 : _1064;
    assign _2034 = f_watch[1:1];
    assign _2033 = _312[1:1];
    assign _2035 = _2033 & _2034;
    assign _2037 = _2035 ? _511 : _1064;
    assign _2043 = _2037 < _2042;
    assign _2044 = _2043 ? _2042 : _2037;
    assign _2027 = f_watch[2:2];
    assign _2026 = _312[2:2];
    assign _2028 = _2026 & _2027;
    assign _2030 = _2028 ? _488 : _1064;
    assign _2022 = f_watch[3:3];
    assign _2021 = _312[3:3];
    assign _2023 = _2021 & _2022;
    assign _2025 = _2023 ? _467 : _1064;
    assign _2031 = _2025 < _2030;
    assign _2032 = _2031 ? _2030 : _2025;
    assign _2045 = _2032 < _2044;
    assign _2046 = _2045 ? _2044 : _2032;
    assign _2013 = f_watch[4:4];
    assign _2012 = _312[4:4];
    assign _2014 = _2012 & _2013;
    assign _2016 = _2014 ? _442 : _1064;
    assign _2008 = f_watch[5:5];
    assign _2007 = _312[5:5];
    assign _2009 = _2007 & _2008;
    assign _2011 = _2009 ? _421 : _1064;
    assign _2017 = _2011 < _2016;
    assign _2018 = _2017 ? _2016 : _2011;
    assign _2001 = f_watch[6:6];
    assign _2000 = _312[6:6];
    assign _2002 = _2000 & _2001;
    assign _2004 = _2002 ? _398 : _1064;
    assign _1996 = f_watch[7:7];
    assign _1995 = _312[7:7];
    assign _1997 = _1995 & _1996;
    assign _1999 = _1997 ? _377 : _1064;
    assign _2005 = _1999 < _2004;
    assign _2006 = _2005 ? _2004 : _1999;
    assign _2019 = _2006 < _2018;
    assign _2020 = _2019 ? _2018 : _2006;
    assign _2047 = _2020 < _2046;
    assign _2048 = _2047 ? _2046 : _2020;
    assign _2049 = f_unexp_now ? _2048 : _1064;
    assign _2098 = f_amb_now ? _2097 : _2049;
    assign _1993 = ts_reg[2:0];
    assign _2099 = _1993 < _2098;
    assign _2101 = _2099 ? ts_hi_m1 : _2100;
    assign _2103 = { _2101,
                     _2102 };
    assign _2107 = { _2103,
                     _1188,
                     _2106,
                     _299 };
    assign _63 = _2107;
    always @(posedge _258) begin
        if (_256)
            _2131 <= _2169;
        else
            if (_2130)
                _2131 <= _63;
    end
    assign _2124 = _2122 + _1410;
    assign _1798 = 4'b0000;
    assign _2113 = 4'b0001;
    assign _2114 = _65 + _2113;
    assign _2112 = _65 - _2113;
    assign _2115 = _1805 ? _2114 : _2112;
    assign _1590 = 4'b1000;
    assign _1591 = _65 == _1590;
    assign _1804 = ~ _1591;
    assign _64 = _1781;
    assign _1805 = _64 & _1804;
    assign _2110 = _1805 ^ _2109;
    assign _2116 = _2110 ? _2115 : _65;
    always @(posedge _258) begin
        if (_256)
            _2119 <= _1798;
        else
            _2119 <= _2116;
    end
    assign _65 = _2119;
    assign _1799 = _65 == _1798;
    assign _2108 = ~ _1799;
    assign _67 = host_vlog_pop;
    assign _2109 = _67 & _2108;
    assign _2125 = _2109 ? _2124 : _2122;
    assign _68 = _2125;
    always @(posedge _258) begin
        if (_256)
            _2122 <= _1064;
        else
            _2122 <= _68;
    end
    always @* begin
        case (_2122)
        0:
            _2174 <= _2131;
        1:
            _2174 <= _2137;
        2:
            _2174 <= _2143;
        3:
            _2174 <= _2149;
        4:
            _2174 <= _2155;
        5:
            _2174 <= _2161;
        6:
            _2174 <= _2167;
        default:
            _2174 <= _2173;
        endcase
    end
    assign _2278 = _2179 == _2170;
    assign _2279 = _2176 & _2278;
    always @(posedge _258) begin
        if (_256)
            _2280 <= _1213;
        else
            if (_2279)
                _2280 <= _74;
    end
    assign _2272 = _2179 == _2164;
    assign _2273 = _2176 & _2272;
    always @(posedge _258) begin
        if (_256)
            _2274 <= _1213;
        else
            if (_2273)
                _2274 <= _74;
    end
    assign _2266 = _2179 == _2158;
    assign _2267 = _2176 & _2266;
    always @(posedge _258) begin
        if (_256)
            _2268 <= _1213;
        else
            if (_2267)
                _2268 <= _74;
    end
    assign _2260 = _2179 == _1254;
    assign _2261 = _2176 & _2260;
    always @(posedge _258) begin
        if (_256)
            _2262 <= _1213;
        else
            if (_2261)
                _2262 <= _74;
    end
    assign _2254 = _2179 == _2146;
    assign _2255 = _2176 & _2254;
    always @(posedge _258) begin
        if (_256)
            _2256 <= _1213;
        else
            if (_2255)
                _2256 <= _74;
    end
    assign _2248 = _2179 == _1383;
    assign _2249 = _2176 & _2248;
    always @(posedge _258) begin
        if (_256)
            _2250 <= _1213;
        else
            if (_2249)
                _2250 <= _74;
    end
    assign _2242 = _2179 == _1410;
    assign _2243 = _2176 & _2242;
    always @(posedge _258) begin
        if (_256)
            _2244 <= _1213;
        else
            if (_2243)
                _2244 <= _74;
    end
    assign _2181 = _2179 + _1410;
    assign _2182 = _2176 ? _2181 : _2179;
    assign _71 = _2182;
    always @(posedge _258) begin
        if (_256)
            _2179 <= _1064;
        else
            _2179 <= _71;
    end
    assign _2236 = _2179 == _1064;
    assign _2237 = _2176 & _2236;
    assign _2222 = _1659 ? _2221 : _2216;
    assign _2223 = _1665 ? _2221 : _2222;
    assign _2200 = _2199 ? _2197 : _2187;
    assign _2198 = _2184 ? _2197 : _2187;
    assign _2201 = _1704 ? _2200 : _2198;
    assign _72 = _2201;
    always @(posedge _258) begin
        if (_256)
            _2187 <= _1213;
        else
            _2187 <= _72;
    end
    assign _2196 = _1609 ? _2195 : _2190;
    assign _2197 = _1615 ? _2195 : _2196;
    assign _2212 = _1602 ? _2187 : _2197;
    assign _2209 = _2208 ? _585 : _2206;
    assign _2207 = _2203 ? _585 : _2206;
    assign _2210 = _1730 ? _2209 : _2207;
    assign _73 = _2210;
    always @(posedge _258) begin
        if (_256)
            _2206 <= _1213;
        else
            _2206 <= _73;
    end
    assign _2211 = _1709 ? _2206 : _585;
    assign _2213 = _1704 ? _2212 : _2211;
    assign _2224 = _1701 ? _2223 : _2213;
    assign _74 = _2224;
    always @(posedge _258) begin
        if (_256)
            _2238 <= _1213;
        else
            if (_2237)
                _2238 <= _74;
    end
    assign _2231 = _2229 + _1410;
    assign _2232 = _2226 ? _2231 : _2229;
    assign _75 = _2232;
    always @(posedge _258) begin
        if (_256)
            _2229 <= _1064;
        else
            _2229 <= _75;
    end
    always @* begin
        case (_2229)
        0:
            _2281 <= _2238;
        1:
            _2281 <= _2244;
        2:
            _2281 <= _2250;
        3:
            _2281 <= _2256;
        4:
            _2281 <= _2262;
        5:
            _2281 <= _2268;
        6:
            _2281 <= _2274;
        default:
            _2281 <= _2280;
        endcase
    end
    assign _1813 = 32'b00000000000000000000000000000000;
    assign _2284 = 32'b00000000000000000000000000000001;
    assign _2285 = ts_reg + _2284;
    assign _79 = _2285;
    always @(posedge _258) begin
        if (_256)
            ts_reg <= _1813;
        else
            ts_reg <= _79;
    end
    assign _2287 = 2'b00;
    assign _2104 = { _1772,
                     f_unexp_now };
    assign _2106 = f_amb_now ? _2287 : _2104;
    always @(posedge _258) begin
        if (_256)
            _2288 <= _2287;
        else
            _2288 <= _2106;
    end
    always @(posedge _258) begin
        if (_256)
            _2291 <= _1056;
        else
            _2291 <= _1781;
    end
    always @(posedge _258) begin
        if (_256)
            _2294 <= _2287;
        else
            _2294 <= f_winner;
    end
    always @(posedge _258) begin
        if (_256)
            _2297 <= _1056;
        else
            _2297 <= _1180;
    end
    assign _2298 = _684[60:60];
    assign _2299 = f_in_eval & _2298;
    assign _1238 = _276 == _2287;
    assign _2300 = ~ _1238;
    assign _2441 = _92 & _2440;
    assign _2442 = ~ _2441;
    assign _2322 = _684[23:16];
    assign _2320 = _701[86:79];
    assign _2319 = _695[86:79];
    assign _2318 = _689[86:79];
    assign _2317 = _292[86:79];
    always @* begin
        case (f_winner)
        0:
            _2321 <= _2317;
        1:
            _2321 <= _2318;
        2:
            _2321 <= _2319;
        default:
            _2321 <= _2320;
        endcase
    end
    assign _2323 = _1712 ? _2322 : _2321;
    assign _2324 = _2323 & _2314;
    assign _2315 = ~ _2314;
    assign _2316 = _2307 & _2315;
    assign _2325 = _2316 | _2324;
    assign _2359 = _2325 | _2358;
    assign _2360 = _2304 ? _2359 : _2307;
    assign _2362 = _265 ? _1213 : _2360;
    assign _2364 = _268 ? _1213 : _2362;
    assign _89 = _2364;
    always @(posedge _258) begin
        if (_256)
            _2307 <= _1213;
        else
            _2307 <= _89;
    end
    assign _2443 = _2307 & _2442;
    assign _92 = host_open_drain;
    assign _3756 = ~ _92;
    assign _2438 = _1533 & _2432;
    assign _2437 = ~ _1533;
    assign _2435 = ~ _1376;
    assign _2436 = _2435 & _2432;
    assign _2434 = _1376 & _2432;
    assign _2433 = ~ _1376;
    assign _2432 = _2368[0:0];
    assign _2431 = _271[2:0];
    always @* begin
        case (_2431)
        0:
            _2439 <= _2432;
        1:
            _2439 <= _1376;
        2:
            _2439 <= _2433;
        3:
            _2439 <= _2434;
        4:
            _2439 <= _2436;
        5:
            _2439 <= _1533;
        6:
            _2439 <= _2437;
        default:
            _2439 <= _2438;
        endcase
    end
    assign _2429 = _1533 & _2423;
    assign _2428 = ~ _1533;
    assign _2426 = ~ _1376;
    assign _2427 = _2426 & _2423;
    assign _2425 = _1376 & _2423;
    assign _2424 = ~ _1376;
    assign _2423 = _2368[1:1];
    assign _2422 = _271[5:3];
    always @* begin
        case (_2422)
        0:
            _2430 <= _2423;
        1:
            _2430 <= _1376;
        2:
            _2430 <= _2424;
        3:
            _2430 <= _2425;
        4:
            _2430 <= _2427;
        5:
            _2430 <= _1533;
        6:
            _2430 <= _2428;
        default:
            _2430 <= _2429;
        endcase
    end
    assign _2420 = _1533 & _2414;
    assign _2419 = ~ _1533;
    assign _2417 = ~ _1376;
    assign _2418 = _2417 & _2414;
    assign _2416 = _1376 & _2414;
    assign _2415 = ~ _1376;
    assign _2414 = _2368[2:2];
    assign _2413 = _271[8:6];
    always @* begin
        case (_2413)
        0:
            _2421 <= _2414;
        1:
            _2421 <= _1376;
        2:
            _2421 <= _2415;
        3:
            _2421 <= _2416;
        4:
            _2421 <= _2418;
        5:
            _2421 <= _1533;
        6:
            _2421 <= _2419;
        default:
            _2421 <= _2420;
        endcase
    end
    assign _2411 = _1533 & _2405;
    assign _2410 = ~ _1533;
    assign _2408 = ~ _1376;
    assign _2409 = _2408 & _2405;
    assign _2407 = _1376 & _2405;
    assign _2406 = ~ _1376;
    assign _2405 = _2368[3:3];
    assign _2404 = _271[11:9];
    always @* begin
        case (_2404)
        0:
            _2412 <= _2405;
        1:
            _2412 <= _1376;
        2:
            _2412 <= _2406;
        3:
            _2412 <= _2407;
        4:
            _2412 <= _2409;
        5:
            _2412 <= _1533;
        6:
            _2412 <= _2410;
        default:
            _2412 <= _2411;
        endcase
    end
    assign _2402 = _1533 & _2396;
    assign _2401 = ~ _1533;
    assign _2399 = ~ _1376;
    assign _2400 = _2399 & _2396;
    assign _2398 = _1376 & _2396;
    assign _2397 = ~ _1376;
    assign _2396 = _2368[4:4];
    assign _2395 = _271[14:12];
    always @* begin
        case (_2395)
        0:
            _2403 <= _2396;
        1:
            _2403 <= _1376;
        2:
            _2403 <= _2397;
        3:
            _2403 <= _2398;
        4:
            _2403 <= _2400;
        5:
            _2403 <= _1533;
        6:
            _2403 <= _2401;
        default:
            _2403 <= _2402;
        endcase
    end
    assign _2393 = _1533 & _2387;
    assign _2392 = ~ _1533;
    assign _2390 = ~ _1376;
    assign _2391 = _2390 & _2387;
    assign _2389 = _1376 & _2387;
    assign _2388 = ~ _1376;
    assign _2387 = _2368[5:5];
    assign _2386 = _271[17:15];
    always @* begin
        case (_2386)
        0:
            _2394 <= _2387;
        1:
            _2394 <= _1376;
        2:
            _2394 <= _2388;
        3:
            _2394 <= _2389;
        4:
            _2394 <= _2391;
        5:
            _2394 <= _1533;
        6:
            _2394 <= _2392;
        default:
            _2394 <= _2393;
        endcase
    end
    assign _2384 = _1533 & _2378;
    assign _2383 = ~ _1533;
    assign _2381 = ~ _1376;
    assign _2382 = _2381 & _2378;
    assign _2380 = _1376 & _2378;
    assign _2379 = ~ _1376;
    assign _2378 = _2368[6:6];
    assign _2377 = _271[20:18];
    always @* begin
        case (_2377)
        0:
            _2385 <= _2378;
        1:
            _2385 <= _1376;
        2:
            _2385 <= _2379;
        3:
            _2385 <= _2380;
        4:
            _2385 <= _2382;
        5:
            _2385 <= _1533;
        6:
            _2385 <= _2383;
        default:
            _2385 <= _2384;
        endcase
    end
    assign _2375 = _1533 & _2369;
    assign _2374 = ~ _1533;
    assign _2372 = ~ _1376;
    assign _2373 = _2372 & _2369;
    assign _2371 = _1376 & _2369;
    assign _2370 = ~ _1376;
    assign _3748 = { _3746,
                     _3745 };
    assign _3745 = _581[0:0];
    assign _3746 = { _3745,
                     _3745 };
    assign _3747 = { _3746,
                     _3746 };
    assign _3749 = { _3747,
                     _3748 };
    assign _3750 = { _3749,
                     _3745 };
    assign _3751 = _3750 & _2358;
    assign _2356 = _2352 & _2350;
    assign _2355 = _2352 & _2348;
    assign _2354 = _2352 & _2345;
    assign _2352 = ~ _2339;
    assign _2353 = _2352 & _2342;
    assign _2350 = _2347 & _2344;
    assign _2351 = _2339 & _2350;
    assign _2347 = ~ _2340;
    assign _2348 = _2347 & _2341;
    assign _2349 = _2339 & _2348;
    assign _2344 = ~ _2341;
    assign _2345 = _2340 & _2344;
    assign _2346 = _2339 & _2345;
    assign _2341 = _2338[0:0];
    assign _2340 = _2338[1:1];
    assign _2342 = _2340 & _2341;
    assign _2339 = _2338[2:2];
    assign _2343 = _2339 & _2342;
    assign _2357 = { _2343,
                     _2346,
                     _2349,
                     _2351,
                     _2353,
                     _2354,
                     _2355,
                     _2356 };
    assign _2326 = ~ _1712;
    assign _2332 = _2326 & _2331;
    assign _2358 = _2332 ? _2357 : _1213;
    assign _3743 = ~ _2358;
    assign _3739 = _684[15:8];
    assign _3737 = _701[78:71];
    assign _3736 = _695[78:71];
    assign _3735 = _689[78:71];
    assign _3734 = _292[78:71];
    always @* begin
        case (f_winner)
        0:
            _3738 <= _3734;
        1:
            _3738 <= _3735;
        2:
            _3738 <= _3736;
        default:
            _3738 <= _3737;
        endcase
    end
    assign _3740 = _1712 ? _3739 : _3738;
    assign _3741 = _3740 & _2314;
    assign _2313 = _684[7:0];
    assign _2311 = _701[70:63];
    assign _2310 = _695[70:63];
    assign _2309 = _689[70:63];
    assign _2308 = _292[70:63];
    always @* begin
        case (f_winner)
        0:
            _2312 <= _2308;
        1:
            _2312 <= _2309;
        2:
            _2312 <= _2310;
        default:
            _2312 <= _2311;
        endcase
    end
    assign _2314 = _1712 ? _2313 : _2312;
    assign _3732 = ~ _2314;
    assign _3733 = _2368 & _3732;
    assign _3742 = _3733 | _3741;
    assign _3744 = _3742 & _3743;
    assign _3752 = _3744 | _3751;
    assign _2302 = _632 == _2287;
    assign _2303 = _2302 | _634;
    assign _1711 = _343 == _1254;
    assign _3726 = _1712 ? _1205 : _276;
    assign _3722 = _2455 ? _1204 : _276;
    assign _1784 = 2'b11;
    assign _3713 = _713 == _1784;
    assign _3715 = _3713 ? _2287 : _276;
    assign _3712 = _713 == _1205;
    assign _3717 = _3712 ? _1204 : _3715;
    assign _3711 = _713 == _2287;
    assign _3719 = _3711 ? _2287 : _3717;
    assign _3720 = _1781 ? _3719 : _276;
    assign _1175 = f_chgmask3 & f_multi_eff;
    assign _1177 = _1175 == _1213;
    assign _1168 = _1128 == _1053;
    assign _1163 = 16'b0000000000000000;
    assign _1164 = _1128 == _1163;
    assign _1165 = _1164 & _1145;
    assign _1162 = _1104 == _1124;
    assign _1166 = _1162 | _1165;
    assign _1169 = _1103 ? _1168 : _1166;
    assign _1159 = _593[3:0];
    assign _1161 = _1159 == _1798;
    assign _1170 = _1161 | _1169;
    assign _1157 = _1128 == _1053;
    assign _1153 = _1128 == _1163;
    assign _1154 = _1153 & _1145;
    assign _1151 = _1104 == _1124;
    assign _1155 = _1151 | _1154;
    assign _1158 = _1103 ? _1157 : _1155;
    assign _1149 = _1115 == _1053;
    always @(posedge _258) begin
        if (_256)
            _1043 <= _1064;
        else
            _1043 <= _1040;
    end
    assign _1144 = { _1071,
                     _1043 };
    assign _1145 = _1101 < _1144;
    assign _1142 = _1115 == _1163;
    assign _1146 = _1142 & _1145;
    assign _1140 = _1104 == _1112;
    assign _1147 = _1140 | _1146;
    assign _1150 = _1103 ? _1149 : _1147;
    assign _1139 = _701[104:103];
    always @* begin
        case (_1139)
        0:
            _1171 <= vdd;
        1:
            _1171 <= _1150;
        2:
            _1171 <= _1158;
        default:
            _1171 <= _1170;
        endcase
    end
    assign _1138 = ~ _634;
    assign _1172 = _1138 | _1171;
    assign _1135 = _701[62:62];
    assign _1133 = _701[61:58];
    always @* begin
        case (_1133)
        0:
            _1134 <= vdd;
        1:
            _1134 <= _578;
        2:
            _1134 <= _582;
        3:
            _1134 <= _586;
        4:
            _1134 <= _588;
        5:
            _1134 <= _590;
        6:
            _1134 <= _594;
        7:
            _1134 <= _597;
        8:
            _1134 <= _602;
        9:
            _1134 <= _605;
        10:
            _1134 <= _608;
        11:
            _1134 <= _611;
        12:
            _1134 <= _616;
        13:
            _1134 <= _619;
        14:
            _1134 <= _622;
        default:
            _1134 <= _625;
        endcase
    end
    assign _1136 = _1134 ^ _1135;
    assign _1128 = _701[57:42];
    assign _1130 = _1128 == _1053;
    assign _1123 = 17'b00000000000000000;
    assign _1119 = _1001[57:42];
    assign _1120 = { gnd,
                     _1119 };
    assign _1121 = _1120 + _1108;
    always @(posedge _258) begin
        if (_256)
            _1124 <= _1123;
        else
            _1124 <= _1121;
    end
    assign _1125 = _1124 < _1104;
    assign _1126 = ~ _1125;
    assign _1115 = _701[41:26];
    assign _1117 = _1115 == _1163;
    assign _1032 = _1002[0:0];
    assign _1034 = _1032 ? _540 : _1064;
    assign _1029 = _1002[1:1];
    assign _1031 = _1029 ? _519 : _1064;
    assign _1035 = _1031 < _1034;
    assign _1036 = _1035 ? _1034 : _1031;
    assign _1024 = _1002[2:2];
    assign _1026 = _1024 ? _496 : _1064;
    assign _1021 = _1002[3:3];
    assign _1023 = _1021 ? _475 : _1064;
    assign _1027 = _1023 < _1026;
    assign _1028 = _1027 ? _1026 : _1023;
    assign _1037 = _1028 < _1036;
    assign _1038 = _1037 ? _1036 : _1028;
    assign _1014 = _1002[4:4];
    assign _1016 = _1014 ? _450 : _1064;
    assign _1011 = _1002[5:5];
    assign _1013 = _1011 ? _429 : _1064;
    assign _1017 = _1013 < _1016;
    assign _1018 = _1017 ? _1016 : _1013;
    assign _1006 = _1002[6:6];
    assign _1008 = _1006 ? _406 : _1064;
    assign _1002 = _1001[23:16];
    assign _1003 = _1002[7:7];
    assign _1005 = _1003 ? _385 : _1064;
    assign _1009 = _1005 < _1008;
    assign _1010 = _1009 ? _1008 : _1005;
    assign _1019 = _1010 < _1018;
    assign _1020 = _1019 ? _1018 : _1010;
    assign _1039 = _1020 < _1038;
    assign _1040 = _1039 ? _1038 : _1020;
    assign _1107 = 14'b00000000000000;
    assign _1108 = { _1107,
                     _1040 };
    assign _1001 = _360[511:400];
    assign _1105 = _1001[41:26];
    assign _1106 = { gnd,
                     _1105 };
    assign _1109 = _1106 + _1108;
    always @(posedge _258) begin
        if (_256)
            _1112 <= _1123;
        else
            _1112 <= _1109;
    end
    assign _1104 = { gnd,
                     _1101 };
    assign _1113 = _1104 < _1112;
    assign _1114 = ~ _1113;
    assign _1118 = _1114 | _1117;
    assign _1127 = _1118 & _1126;
    assign _1046 = _701[25:24];
    always @* begin
        case (_1046)
        0:
            _1101 <= _327;
        1:
            _1101 <= _330;
        2:
            _1101 <= _333;
        default:
            _1101 <= _333;
        endcase
    end
    assign _1103 = _1101 == _1053;
    assign _1131 = _1103 ? _1130 : _1127;
    assign _1095 = f_changed_all & f_chgmask3;
    assign _1097 = _1095 == _1213;
    assign _1098 = ~ _1097;
    assign _1094 = f_chgmask3 == _1213;
    assign _1099 = _1094 | _1098;
    assign _1088 = _701[7:0];
    assign _1086 = _701[15:8];
    assign _1087 = _299 ^ _1086;
    assign _1089 = _1087 & _1088;
    assign _1091 = _1089 == _1213;
    assign _1092 = f_valid3 & _1091;
    assign _1100 = _1092 & _1099;
    assign _1132 = _1100 & _1131;
    assign _1137 = _1132 & _1136;
    assign _1173 = _1137 & _1172;
    assign _1174 = f_in_eval & _1173;
    assign _1178 = _1174 & _1177;
    assign f_fire3 = _1178 & _716;
    assign _680 = f_chgmask0 & f_multi_eff;
    assign _682 = _680 == _1213;
    assign _668 = _568 == _1053;
    assign _664 = _568 == _1163;
    assign _665 = _664 & _645;
    assign _662 = _338 == _564;
    assign _666 = _662 | _665;
    assign _669 = _336 ? _668 : _666;
    assign _659 = _593[3:0];
    assign _661 = _659 == _1798;
    assign _670 = _661 | _669;
    assign _657 = _568 == _1053;
    assign _653 = _568 == _1163;
    assign _654 = _653 & _645;
    assign _651 = _338 == _564;
    assign _655 = _651 | _654;
    assign _658 = _336 ? _657 : _655;
    assign _649 = _555 == _1053;
    always @(posedge _258) begin
        if (_256)
            _643 <= _1064;
        else
            _643 <= _547;
    end
    assign _644 = { _1071,
                    _643 };
    assign _645 = _334 < _644;
    assign _639 = _555 == _1163;
    assign _646 = _639 & _645;
    assign _637 = _338 == _552;
    assign _647 = _637 | _646;
    assign _650 = _336 ? _649 : _647;
    assign _636 = _292[104:103];
    always @* begin
        case (_636)
        0:
            _671 <= vdd;
        1:
            _671 <= _650;
        2:
            _671 <= _658;
        default:
            _671 <= _670;
        endcase
    end
    assign _635 = ~ _634;
    assign _672 = _635 | _671;
    assign _627 = _292[62:62];
    assign _573 = _292[61:58];
    always @* begin
        case (_573)
        0:
            _626 <= vdd;
        1:
            _626 <= _578;
        2:
            _626 <= _582;
        3:
            _626 <= _586;
        4:
            _626 <= _588;
        5:
            _626 <= _590;
        6:
            _626 <= _594;
        7:
            _626 <= _597;
        8:
            _626 <= _602;
        9:
            _626 <= _605;
        10:
            _626 <= _608;
        11:
            _626 <= _611;
        12:
            _626 <= _616;
        13:
            _626 <= _619;
        14:
            _626 <= _622;
        default:
            _626 <= _625;
        endcase
    end
    assign _628 = _626 ^ _627;
    assign _568 = _292[57:42];
    assign _570 = _568 == _1053;
    assign _559 = _361[57:42];
    assign _560 = { gnd,
                    _559 };
    assign _561 = _560 + _548;
    always @(posedge _258) begin
        if (_256)
            _564 <= _1123;
        else
            _564 <= _561;
    end
    assign _565 = _564 < _338;
    assign _566 = ~ _565;
    assign _555 = _292[41:26];
    assign _557 = _555 == _1163;
    assign _521 = _365[0:0];
    assign _541 = _521 ? _540 : _1064;
    assign _500 = _365[1:1];
    assign _520 = _500 ? _519 : _1064;
    assign _542 = _520 < _541;
    assign _543 = _542 ? _541 : _520;
    assign _477 = _365[2:2];
    assign _497 = _477 ? _496 : _1064;
    assign _456 = _365[3:3];
    assign _476 = _456 ? _475 : _1064;
    assign _498 = _476 < _497;
    assign _499 = _498 ? _497 : _476;
    assign _544 = _499 < _543;
    assign _545 = _544 ? _543 : _499;
    assign _431 = _365[4:4];
    assign _451 = _431 ? _450 : _1064;
    assign _410 = _365[5:5];
    assign _430 = _410 ? _429 : _1064;
    assign _452 = _430 < _451;
    assign _453 = _452 ? _451 : _430;
    assign _387 = _365[6:6];
    assign _407 = _387 ? _406 : _1064;
    assign _365 = _361[23:16];
    assign _366 = _365[7:7];
    assign _386 = _366 ? _385 : _1064;
    assign _408 = _386 < _407;
    assign _409 = _408 ? _407 : _386;
    assign _454 = _409 < _453;
    assign _455 = _454 ? _453 : _409;
    assign _546 = _455 < _545;
    assign _547 = _546 ? _545 : _455;
    assign _548 = { _1107,
                    _547 };
    assign _361 = _360[175:64];
    assign _362 = _361[41:26];
    assign _363 = { gnd,
                    _362 };
    assign _549 = _363 + _548;
    always @(posedge _258) begin
        if (_256)
            _552 <= _1123;
        else
            _552 <= _549;
    end
    assign _338 = { gnd,
                    _334 };
    assign _553 = _338 < _552;
    assign _554 = ~ _553;
    assign _558 = _554 | _557;
    assign _567 = _558 & _566;
    assign _324 = _292[25:24];
    always @* begin
        case (_324)
        0:
            _334 <= _327;
        1:
            _334 <= _330;
        2:
            _334 <= _333;
        default:
            _334 <= _333;
        endcase
    end
    assign _336 = _334 == _1053;
    assign _571 = _336 ? _570 : _567;
    assign _318 = f_changed_all & f_chgmask0;
    assign _320 = _318 == _1213;
    assign _321 = ~ _320;
    assign _309 = f_chgmask0 == _1213;
    assign _322 = _309 | _321;
    assign _302 = _292[7:0];
    assign _300 = _292[15:8];
    assign _301 = _299 ^ _300;
    assign _303 = _301 & _302;
    assign _305 = _303 == _1213;
    assign _280 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _3696 = _343 + _1410;
    assign _1187 = 6'b000000;
    assign _94 = host_start_loc;
    assign _2456 = _2455 ? _2453 : _1188;
    assign _96 = host_recover_loc;
    assign _2446 = _713 == _1205;
    assign _2447 = _2446 ? _96 : _1188;
    assign _2448 = _1781 ? _2447 : _1188;
    assign _2457 = _1180 ? _2456 : _2448;
    assign _2444 = _276 == _1205;
    assign _2458 = _2444 ? _2457 : _1188;
    assign _2459 = _268 ? _94 : _2458;
    assign _97 = _2459;
    always @(posedge _258) begin
        if (_256)
            _1188 <= _1187;
        else
            _1188 <= _97;
    end
    assign _2452 = _701[110:105];
    assign _2451 = _695[110:105];
    assign _2450 = _689[110:105];
    assign _2449 = _292[110:105];
    always @* begin
        case (f_winner)
        0:
            _2453 <= _2449;
        1:
            _2453 <= _2450;
        2:
            _2453 <= _2451;
        default:
            _2453 <= _2452;
        endcase
    end
    assign _2454 = _2453 == _1188;
    assign _2455 = ~ _2454;
    assign _3692 = _2455 ? _1064 : _343;
    assign _3687 = _713 == _1205;
    assign _3689 = _3687 ? _1064 : _343;
    assign _1775 = f_changed_all & f_watch;
    assign _1777 = _1775 == _1213;
    assign _1778 = ~ _1777;
    assign _1773 = ~ _1180;
    assign _1774 = f_in_eval & _1773;
    assign f_unexp_now = _1774 & _1778;
    assign _2463 = ~ f_amb_now;
    assign _2464 = _1772 & _2463;
    assign _2466 = _2464 ? _1586 : _2462;
    assign _2467 = _1180 ? _2462 : _2466;
    assign _2462 = _1713 ? _1056 : _1770;
    assign _2460 = _276 == _1205;
    assign _2468 = _2460 ? _2467 : _2462;
    assign _98 = _2468;
    always @(posedge _258) begin
        if (_256)
            _1770 <= _1056;
        else
            _1770 <= _98;
    end
    assign _1771 = ~ _1770;
    assign _3678 = 16'b0000000000000001;
    assign _3679 = _327 + _3678;
    assign _3675 = _327 == _1053;
    assign _3676 = ~ _3675;
    assign _3677 = _3636 & _3676;
    assign _3680 = _3677 ? _3679 : _327;
    assign _3620 = _684[26:24];
    assign _3618 = _701[93:91];
    assign _3617 = _695[93:91];
    assign _3616 = _689[93:91];
    assign _3615 = _292[93:91];
    assign _989 = f_chgmask2 & f_multi_eff;
    assign _991 = _989 == _1213;
    assign _982 = _939 == _1053;
    assign _978 = _939 == _1163;
    assign _979 = _978 & _959;
    assign _976 = _875 == _935;
    assign _980 = _976 | _979;
    assign _983 = _874 ? _982 : _980;
    assign _973 = _593[3:0];
    assign _975 = _973 == _1798;
    assign _984 = _975 | _983;
    assign _971 = _939 == _1053;
    assign _967 = _939 == _1163;
    assign _968 = _967 & _959;
    assign _965 = _875 == _935;
    assign _969 = _965 | _968;
    assign _972 = _874 ? _971 : _969;
    assign _963 = _926 == _1053;
    always @(posedge _258) begin
        if (_256)
            _957 <= _1064;
        else
            _957 <= _918;
    end
    assign _958 = { _1071,
                    _957 };
    assign _959 = _872 < _958;
    assign _953 = _926 == _1163;
    assign _960 = _953 & _959;
    assign _951 = _875 == _923;
    assign _961 = _951 | _960;
    assign _964 = _874 ? _963 : _961;
    assign _950 = _695[104:103];
    always @* begin
        case (_950)
        0:
            _985 <= vdd;
        1:
            _985 <= _964;
        2:
            _985 <= _972;
        default:
            _985 <= _984;
        endcase
    end
    assign _949 = ~ _634;
    assign _986 = _949 | _985;
    assign _946 = _695[62:62];
    assign _944 = _695[61:58];
    always @* begin
        case (_944)
        0:
            _945 <= vdd;
        1:
            _945 <= _578;
        2:
            _945 <= _582;
        3:
            _945 <= _586;
        4:
            _945 <= _588;
        5:
            _945 <= _590;
        6:
            _945 <= _594;
        7:
            _945 <= _597;
        8:
            _945 <= _602;
        9:
            _945 <= _605;
        10:
            _945 <= _608;
        11:
            _945 <= _611;
        12:
            _945 <= _616;
        13:
            _945 <= _619;
        14:
            _945 <= _622;
        default:
            _945 <= _625;
        endcase
    end
    assign _947 = _945 ^ _946;
    assign _939 = _695[57:42];
    assign _941 = _939 == _1053;
    assign _930 = _876[57:42];
    assign _931 = { gnd,
                    _930 };
    assign _932 = _931 + _919;
    always @(posedge _258) begin
        if (_256)
            _935 <= _1123;
        else
            _935 <= _932;
    end
    assign _936 = _935 < _875;
    assign _937 = ~ _936;
    assign _926 = _695[41:26];
    assign _928 = _926 == _1163;
    assign _910 = _880[0:0];
    assign _912 = _910 ? _540 : _1064;
    assign _907 = _880[1:1];
    assign _909 = _907 ? _519 : _1064;
    assign _913 = _909 < _912;
    assign _914 = _913 ? _912 : _909;
    assign _902 = _880[2:2];
    assign _904 = _902 ? _496 : _1064;
    assign _899 = _880[3:3];
    assign _901 = _899 ? _475 : _1064;
    assign _905 = _901 < _904;
    assign _906 = _905 ? _904 : _901;
    assign _915 = _906 < _914;
    assign _916 = _915 ? _914 : _906;
    assign _892 = _880[4:4];
    assign _894 = _892 ? _450 : _1064;
    assign _889 = _880[5:5];
    assign _891 = _889 ? _429 : _1064;
    assign _895 = _891 < _894;
    assign _896 = _895 ? _894 : _891;
    assign _884 = _880[6:6];
    assign _886 = _884 ? _406 : _1064;
    assign _880 = _876[23:16];
    assign _881 = _880[7:7];
    assign _883 = _881 ? _385 : _1064;
    assign _887 = _883 < _886;
    assign _888 = _887 ? _886 : _883;
    assign _897 = _888 < _896;
    assign _898 = _897 ? _896 : _888;
    assign _917 = _898 < _916;
    assign _918 = _917 ? _916 : _898;
    assign _919 = { _1107,
                    _918 };
    assign _876 = _360[399:288];
    assign _877 = _876[41:26];
    assign _878 = { gnd,
                    _877 };
    assign _920 = _878 + _919;
    always @(posedge _258) begin
        if (_256)
            _923 <= _1123;
        else
            _923 <= _920;
    end
    assign _875 = { gnd,
                    _872 };
    assign _924 = _875 < _923;
    assign _925 = ~ _924;
    assign _929 = _925 | _928;
    assign _938 = _929 & _937;
    assign _871 = _695[25:24];
    always @* begin
        case (_871)
        0:
            _872 <= _327;
        1:
            _872 <= _330;
        2:
            _872 <= _333;
        default:
            _872 <= _333;
        endcase
    end
    assign _874 = _872 == _1053;
    assign _942 = _874 ? _941 : _938;
    assign _865 = f_changed_all & f_chgmask2;
    assign _867 = _865 == _1213;
    assign _868 = ~ _867;
    assign _864 = f_chgmask2 == _1213;
    assign _869 = _864 | _868;
    assign _858 = _695[7:0];
    assign _856 = _695[15:8];
    assign _857 = _299 ^ _856;
    assign _859 = _857 & _858;
    assign _861 = _859 == _1213;
    assign _862 = f_valid2 & _861;
    assign _870 = _862 & _869;
    assign _943 = _870 & _942;
    assign _948 = _943 & _947;
    assign _987 = _948 & _986;
    assign _988 = f_in_eval & _987;
    assign _992 = _988 & _991;
    assign f_fire2 = _992 & _716;
    assign _996 = f_fire2 ? _1205 : _1784;
    assign _713 = _684[59:58];
    assign _715 = _713 == _1204;
    assign f_chgmask3 = _701[23:16];
    assign f_valid3 = _701[111:111];
    assign _705 = f_valid3 ? f_chgmask3 : _1213;
    assign f_chgmask2 = _695[23:16];
    assign f_valid2 = _695[111:111];
    assign _699 = f_valid2 ? f_chgmask2 : _1213;
    assign _693 = f_valid1 ? f_chgmask1 : _1213;
    assign f_chgmask0 = _292[23:16];
    assign _687 = f_valid0 ? f_chgmask0 : _1213;
    assign f_watch = _684[57:50];
    assign _688 = f_watch | _687;
    assign _694 = _688 | _693;
    assign _700 = _694 | _699;
    assign f_relevant = _700 | _705;
    assign _707 = f_multi_eff & f_relevant;
    assign _709 = _707 == _1213;
    assign _710 = ~ _709;
    assign f_amb_now = f_in_eval & _710;
    assign _712 = ~ f_amb_now;
    assign _716 = _712 | _715;
    assign _678 = _312 & f_chg_now;
    assign _2473 = _312 & f_chg_now;
    assign _2474 = _677 | _2473;
    assign _2470 = _276 == _1205;
    assign _2472 = _2470 ? _1213 : _677;
    assign _2469 = _276 == _1204;
    assign _2475 = _2469 ? _2474 : _2472;
    assign _2477 = _268 ? _1213 : _2475;
    assign _99 = _2477;
    always @(posedge _258) begin
        if (_256)
            _677 <= _1213;
        else
            _677 <= _99;
    end
    assign f_multi_eff = _677 | _678;
    assign _851 = f_chgmask1 & f_multi_eff;
    assign _853 = _851 == _1213;
    assign _844 = _801 == _1053;
    assign _840 = _801 == _1163;
    assign _841 = _840 & _821;
    assign _838 = _737 == _797;
    assign _842 = _838 | _841;
    assign _845 = _736 ? _844 : _842;
    assign _835 = _593[3:0];
    assign _837 = _835 == _1798;
    assign _846 = _837 | _845;
    assign _833 = _801 == _1053;
    assign _829 = _801 == _1163;
    assign _830 = _829 & _821;
    assign _827 = _737 == _797;
    assign _831 = _827 | _830;
    assign _834 = _736 ? _833 : _831;
    assign _825 = _788 == _1053;
    always @(posedge _258) begin
        if (_256)
            _819 <= _1064;
        else
            _819 <= _780;
    end
    assign _820 = { _1071,
                    _819 };
    assign _821 = _734 < _820;
    assign _815 = _788 == _1163;
    assign _822 = _815 & _821;
    assign _813 = _737 == _785;
    assign _823 = _813 | _822;
    assign _826 = _736 ? _825 : _823;
    assign _812 = _689[104:103];
    always @* begin
        case (_812)
        0:
            _847 <= vdd;
        1:
            _847 <= _826;
        2:
            _847 <= _834;
        default:
            _847 <= _846;
        endcase
    end
    assign _101 = host_role;
    assign _2478 = _268 ? _101 : _632;
    assign _102 = _2478;
    always @(posedge _258) begin
        if (_256)
            _632 <= _2287;
        else
            _632 <= _102;
    end
    assign _634 = _632 == _1205;
    assign _811 = ~ _634;
    assign _848 = _811 | _847;
    assign _808 = _689[62:62];
    assign _2482 = _1566 ? _1586 : _2480;
    assign _2480 = _1536 ? _1586 : _625;
    assign _2483 = _1521 ? _2482 : _2480;
    assign _2485 = _1420 ? _1056 : _2483;
    assign _2487 = _1418 ? _1056 : _2485;
    assign _103 = _2487;
    always @(posedge _258) begin
        if (_256)
            _625 <= _1056;
        else
            _625 <= _103;
    end
    assign _105 = host_lane1_sync_mask;
    assign _107 = host_lane1_sync;
    assign _2493 = _1603 ? _2492 : _2490;
    assign _2494 = _1566 ? _2490 : _2493;
    assign _2495 = _1521 ? _2494 : _2490;
    assign _2497 = _1420 ? _1163 : _2495;
    assign _108 = _2497;
    always @(posedge _258) begin
        if (_256)
            _2490 <= _1163;
        else
            _2490 <= _108;
    end
    assign _2491 = _2490[14:0];
    assign _2492 = { _2491,
                     _1557 };
    assign _2498 = _2492 ^ _107;
    assign _2499 = _2498 & _105;
    assign _2501 = _2499 == _1163;
    assign _2503 = _2501 ? _1586 : _622;
    assign _2504 = _1603 ? _2503 : _622;
    assign _2505 = _1566 ? _622 : _2504;
    assign _2506 = _1521 ? _2505 : _622;
    assign _2508 = _1420 ? _1056 : _2506;
    assign _2510 = _1418 ? _1056 : _2508;
    assign _109 = _2510;
    always @(posedge _258) begin
        if (_256)
            _622 <= _1056;
        else
            _622 <= _109;
    end
    assign _2523 = _1557 == _2522;
    assign _2524 = ~ _2523;
    assign _2526 = _2517 ? _2525 : _2513;
    assign _2527 = _1603 ? _2526 : _2513;
    assign _2528 = _1566 ? _2513 : _2527;
    assign _2529 = _1521 ? _2528 : _2513;
    assign _2531 = _1420 ? _1056 : _2529;
    assign _110 = _2531;
    always @(posedge _258) begin
        if (_256)
            _2513 <= _1056;
        else
            _2513 <= _110;
    end
    assign _2525 = _2513 | _2524;
    assign _2534 = ~ _2525;
    assign _2532 = 6'b000001;
    assign _2533 = _1632 == _2532;
    assign _2535 = _2533 ? _2534 : _619;
    assign _2536 = _2517 ? _2535 : _619;
    assign _2537 = _1603 ? _2536 : _619;
    assign _2538 = _1566 ? _619 : _2537;
    assign _2539 = _1521 ? _2538 : _619;
    assign _2541 = _1420 ? _1056 : _2539;
    assign _2543 = _1418 ? _1056 : _2541;
    assign _111 = _2543;
    always @(posedge _258) begin
        if (_256)
            _619 <= _1056;
        else
            _619 <= _111;
    end
    assign _2547 = _1409 ? _1586 : _2545;
    assign _2545 = _1379 ? _1586 : _611;
    assign _2548 = _1364 ? _2547 : _2545;
    assign _2550 = _1263 ? _1056 : _2548;
    assign _2552 = _1261 ? _1056 : _2550;
    assign _112 = _2552;
    always @(posedge _258) begin
        if (_256)
            _611 <= _1056;
        else
            _611 <= _112;
    end
    assign _114 = host_lane0_sync_mask;
    assign _116 = host_lane0_sync;
    assign _2558 = _1653 ? _2557 : _2555;
    assign _2559 = _1409 ? _2555 : _2558;
    assign _2560 = _1364 ? _2559 : _2555;
    assign _2562 = _1263 ? _1163 : _2560;
    assign _117 = _2562;
    always @(posedge _258) begin
        if (_256)
            _2555 <= _1163;
        else
            _2555 <= _117;
    end
    assign _2556 = _2555[14:0];
    assign _2557 = { _2556,
                     _1400 };
    assign _2563 = _2557 ^ _116;
    assign _2564 = _2563 & _114;
    assign _2566 = _2564 == _1163;
    assign _2568 = _2566 ? _1586 : _608;
    assign _2569 = _1653 ? _2568 : _608;
    assign _2570 = _1409 ? _608 : _2569;
    assign _2571 = _1364 ? _2570 : _608;
    assign _2573 = _1263 ? _1056 : _2571;
    assign _2575 = _1261 ? _1056 : _2573;
    assign _118 = _2575;
    always @(posedge _258) begin
        if (_256)
            _608 <= _1056;
        else
            _608 <= _118;
    end
    assign _2588 = _1400 == _2587;
    assign _2589 = ~ _2588;
    assign _2591 = _2582 ? _2590 : _2578;
    assign _2592 = _1653 ? _2591 : _2578;
    assign _2593 = _1409 ? _2578 : _2592;
    assign _2594 = _1364 ? _2593 : _2578;
    assign _2596 = _1263 ? _1056 : _2594;
    assign _119 = _2596;
    always @(posedge _258) begin
        if (_256)
            _2578 <= _1056;
        else
            _2578 <= _119;
    end
    assign _2590 = _2578 | _2589;
    assign _2599 = ~ _2590;
    assign _2598 = _1682 == _2532;
    assign _2600 = _2598 ? _2599 : _605;
    assign _2601 = _2582 ? _2600 : _605;
    assign _2602 = _1653 ? _2601 : _605;
    assign _2603 = _1409 ? _605 : _2602;
    assign _2604 = _1364 ? _2603 : _605;
    assign _2606 = _1263 ? _1056 : _2604;
    assign _2608 = _1261 ? _1056 : _2606;
    assign _120 = _2608;
    always @(posedge _258) begin
        if (_256)
            _605 <= _1056;
        else
            _605 <= _120;
    end
    assign _122 = host_match_addr;
    assign _596 = _122[6:0];
    assign _595 = _585[7:1];
    assign _597 = _595 == _596;
    assign _592 = 16'b1010110011100001;
    assign _2613 = _593[10:10];
    assign _2612 = _593[12:12];
    assign _2614 = _2612 ^ _2613;
    assign _2611 = _593[13:13];
    assign _2615 = _2611 ^ _2614;
    assign _2610 = _593[15:15];
    assign _2616 = _2610 ^ _2615;
    assign _2609 = _593[14:0];
    assign _2617 = { _2609,
                     _2616 };
    assign _123 = _2617;
    always @(posedge _258) begin
        if (_256)
            _593 <= _592;
        else
            _593 <= _123;
    end
    assign _594 = _593[0:0];
    assign _2636 = _129 + _2113;
    assign _2634 = _129 - _2113;
    assign _2637 = _2176 ? _2636 : _2634;
    assign _1796 = _129 == _1798;
    assign _2225 = ~ _1796;
    assign _125 = host_rx_pop;
    assign _2226 = _125 & _2225;
    assign _2175 = ~ _590;
    assign _2208 = _1709 & _1723;
    assign _2621 = _2208 ? _1709 : _1056;
    assign _2202 = ~ _1709;
    assign _2203 = _2202 & _1723;
    assign _2619 = _2203 ? _1586 : _1709;
    assign _1722 = _1720 == _1784;
    assign _1723 = _1713 & _1722;
    assign _1729 = _1709 | _1723;
    assign _1726 = _1602 | _1651;
    assign _1727 = ~ _1726;
    assign _1725 = ~ _1701;
    assign _1728 = _1725 & _1727;
    assign _1730 = _1728 & _1729;
    assign _2622 = _1730 ? _2621 : _2619;
    assign _126 = _2622;
    always @(posedge _258) begin
        if (_256)
            _1709 <= _1056;
        else
            _1709 <= _126;
    end
    assign _2630 = _1709 | _1723;
    assign _2199 = _1602 & _1651;
    assign _2626 = _2199 ? _1602 : _1056;
    assign _2183 = ~ _1602;
    assign _2184 = _2183 & _1651;
    assign _2624 = _2184 ? _1586 : _1602;
    assign _1649 = ~ _1615;
    assign _1643 = _1612 + _1410;
    assign _1638 = ~ _1551;
    assign _1637 = _1628 & _1636;
    assign _1639 = _1637 & _1638;
    assign _1640 = _1639 & _1608;
    assign _1641 = _1609 | _1640;
    assign _1644 = _1641 ? _1643 : _1612;
    assign _1646 = _1644 == _1064;
    assign _1647 = ~ _1646;
    assign _1618 = _1617 & _177;
    assign _1648 = _1618 & _1647;
    assign _1650 = _1648 & _1649;
    assign _1614 = _1612 == _2170;
    assign _1615 = _1609 & _1614;
    assign _1651 = _1615 | _1650;
    assign _1703 = _1602 | _1651;
    assign _1702 = ~ _1701;
    assign _1704 = _1702 & _1703;
    assign _2627 = _1704 ? _2626 : _2624;
    assign _127 = _2627;
    always @(posedge _258) begin
        if (_256)
            _1602 <= _1056;
        else
            _1602 <= _127;
    end
    assign _2628 = _1602 | _1651;
    assign _1699 = ~ _1665;
    assign _1693 = _1662 + _1410;
    assign _1688 = ~ _1394;
    assign _1687 = _1678 & _1686;
    assign _1689 = _1687 & _1688;
    assign _1690 = _1689 & _1658;
    assign _1691 = _1659 | _1690;
    assign _1694 = _1691 ? _1693 : _1662;
    assign _1696 = _1694 == _1064;
    assign _1697 = ~ _1696;
    assign _1668 = _1667 & _229;
    assign _1698 = _1668 & _1697;
    assign _1700 = _1698 & _1699;
    assign _1664 = _1662 == _2170;
    assign _1665 = _1659 & _1664;
    assign _1701 = _1665 | _1700;
    assign _2629 = _1701 | _2628;
    assign _2631 = _2629 | _2630;
    assign _128 = _2631;
    assign _2176 = _128 & _2175;
    assign _2632 = _2176 ^ _2226;
    assign _2638 = _2632 ? _2637 : _129;
    always @(posedge _258) begin
        if (_256)
            _2641 <= _1798;
        else
            _2641 <= _2638;
    end
    assign _129 = _2641;
    assign _590 = _129 == _1590;
    assign _2658 = _585[6:0];
    assign _2659 = { _2658,
                     _2655 };
    assign _2656 = _585[7:1];
    assign _2654 = _299[7:7];
    assign _2653 = _299[6:6];
    assign _2652 = _299[5:5];
    assign _2651 = _299[4:4];
    assign _2650 = _299[3:3];
    assign _2649 = _299[2:2];
    assign _2648 = _299[1:1];
    assign _2647 = _299[0:0];
    assign _2645 = _701[102:100];
    assign _2644 = _695[102:100];
    assign _2643 = _689[102:100];
    assign _2642 = _292[102:100];
    always @* begin
        case (f_winner)
        0:
            _2646 <= _2642;
        1:
            _2646 <= _2643;
        2:
            _2646 <= _2644;
        default:
            _2646 <= _2645;
        endcase
    end
    always @* begin
        case (_2646)
        0:
            _2655 <= _2647;
        1:
            _2655 <= _2648;
        2:
            _2655 <= _2649;
        3:
            _2655 <= _2650;
        4:
            _2655 <= _2651;
        5:
            _2655 <= _2652;
        6:
            _2655 <= _2653;
        default:
            _2655 <= _2654;
        endcase
    end
    assign _2657 = { _2655,
                     _2656 };
    assign _1717 = _701[97:96];
    assign _1716 = _695[97:96];
    assign _1715 = _689[97:96];
    assign _1714 = _292[97:96];
    always @* begin
        case (f_winner)
        0:
            _1718 <= _1714;
        1:
            _1718 <= _1715;
        2:
            _1718 <= _1716;
        default:
            _1718 <= _1717;
        endcase
    end
    assign _1720 = _1712 ? _2287 : _1718;
    always @* begin
        case (_1720)
        0:
            _2660 <= _585;
        1:
            _2660 <= _2657;
        2:
            _2660 <= _2659;
        default:
            _2660 <= _585;
        endcase
    end
    assign _2661 = _1713 ? _2660 : _585;
    assign _130 = _2661;
    always @(posedge _258) begin
        if (_256)
            _585 <= _1213;
        else
            _585 <= _130;
    end
    assign _586 = _585[0:0];
    assign _3431 = _581[7:1];
    assign _3432 = { vdd,
                     _3431 };
    assign _3429 = _3421[7:7];
    assign _3428 = _3421[6:6];
    assign _3427 = _3421[5:5];
    assign _3426 = _3421[4:4];
    assign _3425 = _3421[3:3];
    assign _3424 = _3421[2:2];
    assign _3423 = _3421[1:1];
    assign _3422 = _3421[0:0];
    assign _3430 = { _3422,
                     _3423,
                     _3424,
                     _3425,
                     _3426,
                     _3427,
                     _3428,
                     _3429 };
    assign _3414 = _235 + _2113;
    assign _3412 = _235 - _2113;
    assign _3415 = _2676 ? _3414 : _3412;
    assign _3085 = ~ _588;
    assign _3406 = ~ _588;
    assign _1619 = ~ _177;
    assign _3040 = ~ _175;
    assign _3041 = _177 & _3040;
    assign _3044 = _3041 ? _1204 : _1205;
    assign _3033 = ~ _1636;
    assign _3034 = _1628 & _3033;
    assign _3035 = _616 | _3034;
    assign _3036 = _3035 | _3025;
    assign _3038 = _3036 ? _1205 : _3032;
    assign _3019 = _1549 + _1410;
    assign _3016 = _1549 + _1410;
    assign _3012 = vdd == _1561;
    assign _3010 = _1549 == _1064;
    assign _3011 = ~ _3010;
    assign _3013 = _3011 & _3012;
    assign _3017 = _3013 ? _3016 : _1410;
    assign _3008 = _155 == _1205;
    assign _3020 = _3008 ? _3019 : _3017;
    assign _3021 = _3020 == _133;
    assign _3002 = _1549 + _1410;
    assign _2998 = gnd == _1561;
    assign _2996 = _1549 == _1064;
    assign _2997 = ~ _2996;
    assign _2999 = _2997 & _2998;
    assign _3003 = _2999 ? _3002 : _1410;
    assign _2994 = _155 == _1205;
    assign _3005 = _2994 ? _1064 : _3003;
    assign _3006 = _3005 == _133;
    assign _3022 = _1557 ? _3021 : _3006;
    assign _3023 = _1546 & _3022;
    assign _3024 = ~ _3023;
    assign _2990 = _1632 == _2532;
    assign _2988 = _1632 == _1187;
    assign _2991 = _2517 ? _2990 : _2988;
    assign _2983 = _1607 + _3678;
    assign _2984 = _2983 == _149;
    assign _2981 = _1607 == _149;
    assign _2985 = _1609 ? _2984 : _2981;
    assign _2979 = ~ _1566;
    assign _2980 = _1521 & _2979;
    assign _2986 = _2980 & _2985;
    assign _2992 = _2986 & _2991;
    assign _3025 = _2992 & _3024;
    assign _3027 = _3025 ? _1784 : _2978;
    assign _3029 = _1566 ? _2287 : _3027;
    assign _2975 = _1636 ? _2973 : _1784;
    assign _2971 = _1447 & _1445;
    assign _2973 = _2971 ? _1205 : _614;
    assign _2976 = _1628 ? _2975 : _2973;
    assign _2751 = _1636 ? _2750 : _2664;
    assign _2752 = _1628 ? _2751 : _2664;
    assign _131 = _2752;
    always @(posedge _258) begin
        if (_256)
            _2664 <= _1056;
        else
            _2664 <= _131;
    end
    assign _2901 = ~ _2750;
    assign _2899 = ~ _1533;
    assign _2900 = _2750 ? _1533 : _2899;
    always @* begin
        case (_171)
        0:
            _2902 <= _2750;
        1:
            _2902 <= _2900;
        2:
            _2902 <= _2901;
        default:
            _2902 <= _2750;
        endcase
    end
    assign _133 = host_lane1_stuff_len;
    assign _2883 = _1549 + _1410;
    assign _2884 = _1557 ? _2883 : _1064;
    assign _2879 = _1549 + _1410;
    assign _2875 = _1557 == _1561;
    assign _2873 = _1549 == _1064;
    assign _2874 = ~ _2873;
    assign _2876 = _2874 & _2875;
    assign _2880 = _2876 ? _2879 : _1410;
    assign _2871 = _155 == _1205;
    assign _2885 = _2871 ? _2884 : _2880;
    assign _2886 = _1566 ? _2869 : _2885;
    assign _2865 = _1549 + _1410;
    assign _2866 = _2750 ? _2865 : _1064;
    assign _2861 = _1549 + _1410;
    assign _2747 = _2739[7:7];
    assign _2746 = _2739[6:6];
    assign _2745 = _2739[5:5];
    assign _2744 = _2739[4:4];
    assign _2743 = _2739[3:3];
    assign _2742 = _2739[2:2];
    assign _2741 = _2739[1:1];
    assign _2737 = _2729[7:7];
    assign _2736 = _2729[6:6];
    assign _2735 = _2729[5:5];
    assign _2734 = _2729[4:4];
    assign _2733 = _2729[3:3];
    assign _2732 = _2729[2:2];
    assign _2731 = _2729[1:1];
    assign _2728 = _588 ? _1211 : _2726;
    assign _2193 = _2190[7:1];
    assign _2194 = { _1557,
                     _2193 };
    assign _2191 = _2190[6:0];
    assign _2192 = { _2191,
                     _1557 };
    assign _2195 = _136 ? _2194 : _2192;
    assign _2757 = _1609 ? _2195 : _2756;
    assign _2758 = _1603 ? _2757 : _2756;
    assign _2759 = _1566 ? _2756 : _2758;
    assign _2753 = _1608 ? _2729 : _2190;
    assign _2754 = _1551 ? _2190 : _2753;
    assign _2755 = _1636 ? _2754 : _2190;
    assign _2756 = _1628 ? _2755 : _2190;
    assign _2760 = _1521 ? _2759 : _2756;
    assign _134 = _2760;
    always @(posedge _258) begin
        if (_256)
            _2190 <= _1213;
        else
            _2190 <= _134;
    end
    assign _2668 = _1612 == _1064;
    assign _2665 = ~ _1551;
    assign _2666 = _2665 & _1608;
    assign _2669 = _2666 & _2668;
    assign _2729 = _2669 ? _2728 : _2190;
    assign _2730 = _2729[0:0];
    assign _2738 = { _2730,
                     _2731,
                     _2732,
                     _2733,
                     _2734,
                     _2735,
                     _2736,
                     _2737 };
    assign _136 = host_lane1_lsb_first;
    assign _2739 = _136 ? _2729 : _2738;
    assign _2740 = _2739[0:0];
    assign _2768 = _1612 + _1410;
    assign _2769 = _1609 ? _2768 : _2766;
    assign _2770 = _1603 ? _2769 : _2766;
    assign _2771 = _1566 ? _2766 : _2770;
    assign _2762 = _1612 + _1410;
    assign _2763 = _1608 ? _2762 : _1612;
    assign _2764 = _1551 ? _1612 : _2763;
    assign _2765 = _1636 ? _2764 : _1612;
    assign _2766 = _1628 ? _2765 : _1612;
    assign _2772 = _1521 ? _2771 : _2766;
    assign _2774 = _1420 ? _1064 : _2772;
    assign _137 = _2774;
    always @(posedge _258) begin
        if (_256)
            _1612 <= _1064;
        else
            _1612 <= _137;
    end
    always @* begin
        case (_1612)
        0:
            _2748 <= _2740;
        1:
            _2748 <= _2741;
        2:
            _2748 <= _2742;
        3:
            _2748 <= _2743;
        4:
            _2748 <= _2744;
        5:
            _2748 <= _2745;
        6:
            _2748 <= _2746;
        default:
            _2748 <= _2747;
        endcase
    end
    assign _139 = host_lane1_crc_inv;
    assign _141 = host_lane1_init;
    assign _2816 = _2520[30:0];
    assign _2818 = { _2816,
                     _1056 };
    assign _2810 = _2520[31:31];
    assign _2811 = _1557 ^ _2810;
    assign _2813 = _2811 ? _146 : _1813;
    assign _2807 = _2520[30:0];
    assign _2809 = { _2807,
                     _1056 };
    assign _2814 = _2809 ^ _2813;
    assign _2815 = _1609 ? _2814 : _2806;
    assign _143 = host_lane1_crc_width;
    assign _2784 = _1632 - _2532;
    assign _2785 = _2517 ? _2784 : _2782;
    assign _2786 = _1603 ? _2785 : _2782;
    assign _2787 = _1566 ? _2782 : _2786;
    assign _2778 = _1632 - _2532;
    assign _2779 = _1608 ? _1632 : _2778;
    assign _2780 = _1551 ? _1632 : _2779;
    assign _2781 = _1636 ? _2780 : _1632;
    assign _2782 = _1628 ? _2781 : _1632;
    assign _2788 = _1521 ? _2787 : _2782;
    assign _2789 = _2776 ? _143 : _2788;
    assign _2791 = _1420 ? _1187 : _2789;
    assign _144 = _2791;
    always @(posedge _258) begin
        if (_256)
            _1632 <= _1187;
        else
            _1632 <= _144;
    end
    assign _1634 = _1632 == _1187;
    assign _1635 = ~ _1634;
    assign _2515 = ~ _1608;
    assign _2514 = _1521 & _1603;
    assign _2516 = _2514 & _2515;
    assign _2517 = _2516 & _1635;
    assign _2819 = _2517 ? _2818 : _2815;
    assign _2820 = _1603 ? _2819 : _2806;
    assign _2821 = _1566 ? _2806 : _2820;
    assign _146 = host_lane1_poly;
    assign _2798 = _2520[31:31];
    assign _2799 = _2750 ^ _2798;
    assign _2801 = _2799 ? _146 : _1813;
    assign _2795 = _2520[30:0];
    assign _2797 = { _2795,
                     _1056 };
    assign _2802 = _2797 ^ _2801;
    assign _2792 = _2520[30:0];
    assign _2794 = { _2792,
                     _1056 };
    assign _2803 = _1608 ? _2802 : _2794;
    assign _2804 = _1551 ? _2520 : _2803;
    assign _2805 = _1636 ? _2804 : _2520;
    assign _2806 = _1628 ? _2805 : _2520;
    assign _2822 = _1521 ? _2821 : _2806;
    assign _2823 = _1420 ? _141 : _2822;
    assign _2825 = _1418 ? _1813 : _2823;
    assign _147 = _2825;
    always @(posedge _258) begin
        if (_256)
            _2520 <= _1813;
        else
            _2520 <= _147;
    end
    assign _2521 = _2520[31:31];
    assign _2522 = _2521 ^ _139;
    assign _149 = host_lane1_frame_bits;
    assign _2845 = _1607 + _3678;
    assign _1604 = _1521 & _1603;
    assign _1609 = _1604 & _1608;
    assign _2846 = _1609 ? _2845 : _2843;
    assign _1603 = ~ _1551;
    assign _2847 = _1603 ? _2846 : _2843;
    assign _2828 = _1566 ? _2827 : _1557;
    assign _2826 = _1636 ? _2750 : _1561;
    assign _2827 = _1628 ? _2826 : _1561;
    assign _2829 = _1521 ? _2828 : _2827;
    assign _2831 = _1420 ? _1586 : _2829;
    assign _150 = _2831;
    always @(posedge _258) begin
        if (_256)
            _1561 <= vdd;
        else
            _1561 <= _150;
    end
    assign _1562 = ~ _1561;
    assign _1559 = _155 == _1204;
    assign _1563 = _1559 ? _1562 : gnd;
    assign _2833 = _171 == _1204;
    assign _2834 = _2833 ? _1432 : _1555;
    assign _2835 = _1521 ? _2834 : _1555;
    assign _2837 = _1420 ? _1586 : _2835;
    assign _151 = _2837;
    always @(posedge _258) begin
        if (_256)
            _1555 <= vdd;
        else
            _1555 <= _151;
    end
    assign _1556 = _1432 == _1555;
    assign _1553 = _171 == _1204;
    assign _1557 = _1553 ? _1556 : _1432;
    assign _1564 = _1557 == _1563;
    assign _1565 = ~ _1564;
    assign _1566 = _1551 & _1565;
    assign _2848 = _1566 ? _2843 : _2847;
    assign _2839 = _1607 + _3678;
    assign _2840 = _1608 ? _2839 : _1607;
    assign _2841 = _1551 ? _1607 : _2840;
    assign _2842 = _1636 ? _2841 : _1607;
    assign _2843 = _1628 ? _2842 : _1607;
    assign _2849 = _1521 ? _2848 : _2843;
    assign _2851 = _1420 ? _1163 : _2849;
    assign _152 = _2851;
    always @(posedge _258) begin
        if (_256)
            _1607 <= _1163;
        else
            _1607 <= _152;
    end
    assign _1608 = _1607 < _149;
    assign _2749 = _1608 ? _2748 : _2522;
    assign _2750 = _1551 ? _1563 : _2749;
    assign _2857 = _2750 == _1561;
    assign _2855 = _1549 == _1064;
    assign _2856 = ~ _2855;
    assign _2858 = _2856 & _2857;
    assign _2862 = _2858 ? _2861 : _1410;
    assign _2853 = _155 == _1205;
    assign _2867 = _2853 ? _2866 : _2862;
    assign _2868 = _1636 ? _2867 : _1549;
    assign _2869 = _1628 ? _2868 : _1549;
    assign _2887 = _1521 ? _2886 : _2869;
    assign _2889 = _1420 ? _1064 : _2887;
    assign _153 = _2889;
    always @(posedge _258) begin
        if (_256)
            _1549 <= _1064;
        else
            _1549 <= _153;
    end
    assign _1550 = _1549 == _133;
    assign _155 = host_lane1_stuff;
    assign _1545 = _155 == _2287;
    assign _1546 = ~ _1545;
    assign _1551 = _1546 & _1550;
    assign _1629 = _1551 | _1608;
    assign _1636 = _1629 | _1635;
    assign _2903 = _1636 ? _2902 : _1586;
    assign _2904 = _1628 ? _2903 : _1533;
    assign _1624 = _1491 == _1163;
    assign _1622 = _1456 == _1163;
    assign _1625 = _1484 ? _1624 : _1622;
    assign _1626 = _1452 ? vdd : _1625;
    assign _1627 = _175 ? _1519 : _1626;
    assign _2896 = ~ _1627;
    assign _2893 = _171 == _1205;
    assign _2890 = ~ _177;
    assign _2891 = _1422 & _2890;
    assign _2894 = _2891 & _2893;
    assign _2895 = _2894 & _1520;
    assign _2897 = _2895 & _2896;
    assign _2905 = _2897 ? _2664 : _2904;
    assign _2907 = _1536 ? _1586 : _2905;
    assign _2909 = _1617 ? _1586 : _2907;
    assign _2911 = _1420 ? _1586 : _2909;
    assign _2913 = _1418 ? _1586 : _2911;
    assign _156 = _2913;
    always @(posedge _258) begin
        if (_256)
            _1533 <= vdd;
        else
            _1533 <= _156;
    end
    assign _1534 = _1432 == _1533;
    assign _1535 = ~ _1534;
    assign _1528 = _171 == _1205;
    assign _1529 = ~ _1528;
    assign _1525 = ~ _175;
    assign _158 = host_lane1_readback;
    assign _1522 = ~ _177;
    assign _1523 = _1422 & _1522;
    assign _1524 = _1523 & _158;
    assign _1526 = _1524 & _1525;
    assign _1530 = _1526 & _1529;
    assign _1531 = _1530 & _1520;
    assign _1536 = _1531 & _1535;
    assign _2978 = _1536 ? _2287 : _2976;
    assign _1517 = ~ _1505;
    assign _1518 = _1514 & _1517;
    assign _1513 = _315[7:7];
    assign _1512 = _315[6:6];
    assign _1511 = _315[5:5];
    assign _1510 = _315[4:4];
    assign _1509 = _315[3:3];
    assign _1508 = _315[2:2];
    assign _1507 = _315[1:1];
    assign _1506 = _315[0:0];
    always @* begin
        case (_160)
        0:
            _1514 <= _1506;
        1:
            _1514 <= _1507;
        2:
            _1514 <= _1508;
        3:
            _1514 <= _1509;
        4:
            _1514 <= _1510;
        5:
            _1514 <= _1511;
        6:
            _1514 <= _1512;
        default:
            _1514 <= _1513;
        endcase
    end
    assign _1515 = ~ _1514;
    assign _1504 = _299[7:7];
    assign _1503 = _299[6:6];
    assign _1502 = _299[5:5];
    assign _1501 = _299[4:4];
    assign _1500 = _299[3:3];
    assign _1499 = _299[2:2];
    assign _1498 = _299[1:1];
    assign _1497 = _299[0:0];
    assign _160 = host_lane1_clk_pin;
    always @* begin
        case (_160)
        0:
            _1505 <= _1497;
        1:
            _1505 <= _1498;
        2:
            _1505 <= _1499;
        3:
            _1505 <= _1500;
        4:
            _1505 <= _1501;
        5:
            _1505 <= _1502;
        6:
            _1505 <= _1503;
        default:
            _1505 <= _1504;
        endcase
    end
    assign _1516 = _1505 & _1515;
    assign _162 = host_lane1_clk_edge;
    assign _1519 = _162 ? _1518 : _1516;
    assign _1495 = _1480 == _1163;
    assign _1492 = _1491 == _1480;
    assign _1485 = _1456 == _1480;
    assign _1483 = ~ _1447;
    assign _1474 = _164[15:2];
    assign _1475 = { _2287,
                     _1474 };
    assign _1471 = _164[15:1];
    assign _1472 = { _1056,
                     _1471 };
    assign _1476 = _1472 + _1475;
    assign _1468 = _164[15:1];
    assign _1469 = { _1056,
                     _1468 };
    assign _1466 = _177 & _1449;
    assign _1477 = _1466 ? _1476 : _1469;
    always @(posedge _258) begin
        if (_256)
            _1480 <= _1163;
        else
            _1480 <= _1477;
    end
    assign _1481 = _1456 < _1480;
    assign _1458 = _164[15:2];
    assign _1459 = { _2287,
                     _1458 };
    always @(posedge _258) begin
        if (_256)
            _1462 <= _1163;
        else
            _1462 <= _1459;
    end
    assign _2959 = ~ _1447;
    assign _2960 = _1482 & _2959;
    assign _2961 = _2960 ? _1491 : _1456;
    assign _2963 = _1452 ? _1163 : _2961;
    assign _2965 = _2963 + _3678;
    assign _2943 = _2937 == _1123;
    assign _1487 = _164[15:1];
    assign _1488 = { _1056,
                     _1487 };
    always @(posedge _258) begin
        if (_256)
            _1491 <= _1163;
        else
            _1491 <= _1488;
    end
    assign _2939 = { gnd,
                     _1491 };
    assign _2940 = _2939 == _2937;
    assign _2933 = { gnd,
                     _164 };
    always @(posedge _258) begin
        if (_256)
            _2936 <= _1123;
        else
            _2936 <= _2933;
    end
    assign _2928 = 17'b00000000000000001;
    assign _164 = host_lane1_div_int;
    assign _2927 = { gnd,
                     _164 };
    assign _2929 = _2927 - _2928;
    always @(posedge _258) begin
        if (_256)
            _2932 <= _1123;
        else
            _2932 <= _2929;
    end
    assign _166 = host_lane1_div_frac;
    assign _2947 = { gnd,
                     _166 };
    assign _2949 = _2948[7:0];
    assign _2950 = _2945 ? _2949 : _2921;
    assign _2951 = _2918 ? _2950 : _2921;
    assign _2953 = _1420 ? _1213 : _2951;
    assign _167 = _2953;
    always @(posedge _258) begin
        if (_256)
            _2921 <= _1213;
        else
            _2921 <= _167;
    end
    assign _2946 = { gnd,
                     _2921 };
    assign _2948 = _2946 + _2947;
    assign _2954 = _2948[8:8];
    assign _2955 = _2945 ? _2954 : _2926;
    assign _2956 = _2918 ? _2955 : _2926;
    assign _2958 = _1420 ? _1056 : _2956;
    assign _168 = _2958;
    always @(posedge _258) begin
        if (_256)
            _2926 <= _1056;
        else
            _2926 <= _168;
    end
    assign _2937 = _2926 ? _2936 : _2932;
    assign _2923 = { gnd,
                     _1456 };
    assign _2938 = _2923 == _2937;
    assign _2941 = _1484 ? _2940 : _2938;
    assign _2944 = _1452 ? _2943 : _2941;
    assign _2922 = ~ _175;
    assign _2945 = _2922 & _2944;
    assign _2967 = _2945 ? _1163 : _2965;
    assign _2917 = ~ _175;
    assign _2915 = _1447 & _1445;
    assign _616 = _614 == _1784;
    assign _2914 = _1422 | _616;
    assign _2916 = _2914 | _2915;
    assign _2918 = _2916 & _2917;
    assign _2968 = _2918 ? _2967 : _1456;
    assign _2970 = _1420 ? _1163 : _2968;
    assign _169 = _2970;
    always @(posedge _258) begin
        if (_256)
            _1456 <= _1163;
        else
            _1456 <= _169;
    end
    assign _1463 = _1456 < _1462;
    assign _1464 = ~ _1463;
    assign _1453 = _1445 & _1449;
    assign _1465 = _1453 & _1464;
    assign _1482 = _1465 & _1481;
    assign _1484 = _1482 & _1483;
    assign _1493 = _1484 ? _1492 : _1485;
    assign _171 = host_lane1_code;
    assign _1449 = _171 == _1205;
    assign _1450 = ~ _1449;
    assign _1447 = _614 == _1204;
    assign _1451 = _1447 | _1450;
    assign _1444 = ~ _175;
    assign _1440 = _315[7:7];
    assign _1439 = _315[6:6];
    assign _1438 = _315[5:5];
    assign _1437 = _315[4:4];
    assign _1436 = _315[3:3];
    assign _1435 = _315[2:2];
    assign _1434 = _315[1:1];
    assign _1433 = _315[0:0];
    always @* begin
        case (_173)
        0:
            _1441 <= _1433;
        1:
            _1441 <= _1434;
        2:
            _1441 <= _1435;
        3:
            _1441 <= _1436;
        4:
            _1441 <= _1437;
        5:
            _1441 <= _1438;
        6:
            _1441 <= _1439;
        default:
            _1441 <= _1440;
        endcase
    end
    assign _1431 = _299[7:7];
    assign _1430 = _299[6:6];
    assign _1429 = _299[5:5];
    assign _1428 = _299[4:4];
    assign _1427 = _299[3:3];
    assign _1426 = _299[2:2];
    assign _1425 = _299[1:1];
    assign _1424 = _299[0:0];
    assign _173 = host_lane1_data_pin;
    always @* begin
        case (_173)
        0:
            _1432 <= _1424;
        1:
            _1432 <= _1425;
        2:
            _1432 <= _1426;
        3:
            _1432 <= _1427;
        4:
            _1432 <= _1428;
        5:
            _1432 <= _1429;
        6:
            _1432 <= _1430;
        default:
            _1432 <= _1431;
        endcase
    end
    assign _1442 = _1432 ^ _1441;
    assign _1443 = _177 & _1442;
    assign _1445 = _1443 & _1444;
    assign _1452 = _1445 & _1451;
    assign _1496 = _1452 ? _1495 : _1493;
    assign _175 = host_lane1_clk_pin_en;
    assign _1520 = _175 ? _1519 : _1496;
    assign _177 = host_lane1_dir;
    assign _1423 = _1422 & _177;
    assign _1521 = _1423 & _1520;
    assign _3030 = _1521 ? _3029 : _2978;
    assign _1617 = _230 == _2164;
    assign _3032 = _1617 ? _2287 : _3030;
    assign _2776 = _230 == _2170;
    assign _3039 = _2776 ? _3038 : _3032;
    assign _1420 = _230 == _2158;
    assign _3045 = _1420 ? _3044 : _3039;
    assign _1418 = _230 == _1254;
    assign _3047 = _1418 ? _2287 : _3045;
    assign _178 = _3047;
    always @(posedge _258) begin
        if (_256)
            _614 <= _2287;
        else
            _614 <= _178;
    end
    assign _1422 = _614 == _1205;
    assign _1620 = _1422 & _1619;
    assign _1628 = _1620 & _1627;
    assign _3405 = _1628 & _2669;
    assign _3407 = _3405 & _3406;
    assign _3403 = ~ _588;
    assign _1669 = ~ _229;
    assign _3381 = ~ _227;
    assign _3382 = _229 & _3381;
    assign _3385 = _3382 ? _1204 : _1205;
    assign _3374 = ~ _1686;
    assign _3375 = _1678 & _3374;
    assign _3376 = _602 | _3375;
    assign _3377 = _3376 | _3366;
    assign _3379 = _3377 ? _1205 : _3373;
    assign _3360 = _1392 + _1410;
    assign _3357 = _1392 + _1410;
    assign _3353 = vdd == _1404;
    assign _3351 = _1392 == _1064;
    assign _3352 = ~ _3351;
    assign _3354 = _3352 & _3353;
    assign _3358 = _3354 ? _3357 : _1410;
    assign _3349 = _207 == _1205;
    assign _3361 = _3349 ? _3360 : _3358;
    assign _3362 = _3361 == _181;
    assign _3343 = _1392 + _1410;
    assign _3339 = gnd == _1404;
    assign _3337 = _1392 == _1064;
    assign _3338 = ~ _3337;
    assign _3340 = _3338 & _3339;
    assign _3344 = _3340 ? _3343 : _1410;
    assign _3335 = _207 == _1205;
    assign _3346 = _3335 ? _1064 : _3344;
    assign _3347 = _3346 == _181;
    assign _3363 = _1400 ? _3362 : _3347;
    assign _3364 = _1389 & _3363;
    assign _3365 = ~ _3364;
    assign _3331 = _1682 == _2532;
    assign _3329 = _1682 == _1187;
    assign _3332 = _2582 ? _3331 : _3329;
    assign _3324 = _1657 + _3678;
    assign _3325 = _3324 == _201;
    assign _3322 = _1657 == _201;
    assign _3326 = _1659 ? _3325 : _3322;
    assign _3320 = ~ _1409;
    assign _3321 = _1364 & _3320;
    assign _3327 = _3321 & _3326;
    assign _3333 = _3327 & _3332;
    assign _3366 = _3333 & _3365;
    assign _3368 = _3366 ? _1784 : _3319;
    assign _3370 = _1409 ? _2287 : _3368;
    assign _3316 = _1686 ? _3314 : _1784;
    assign _3312 = _1290 & _1288;
    assign _3314 = _3312 ? _1205 : _600;
    assign _3317 = _1678 ? _3316 : _3314;
    assign _3080 = _1686 ? _3079 : _3050;
    assign _3081 = _1678 ? _3080 : _3050;
    assign _179 = _3081;
    always @(posedge _258) begin
        if (_256)
            _3050 <= _1056;
        else
            _3050 <= _179;
    end
    assign _3238 = ~ _3079;
    assign _3236 = ~ _1376;
    assign _3237 = _3079 ? _1376 : _3236;
    always @* begin
        case (_223)
        0:
            _3239 <= _3079;
        1:
            _3239 <= _3237;
        2:
            _3239 <= _3238;
        default:
            _3239 <= _3079;
        endcase
    end
    assign _181 = host_lane0_stuff_len;
    assign _3220 = _1392 + _1410;
    assign _3221 = _1400 ? _3220 : _1064;
    assign _3216 = _1392 + _1410;
    assign _3212 = _1400 == _1404;
    assign _3210 = _1392 == _1064;
    assign _3211 = ~ _3210;
    assign _3213 = _3211 & _3212;
    assign _3217 = _3213 ? _3216 : _1410;
    assign _3208 = _207 == _1205;
    assign _3222 = _3208 ? _3221 : _3217;
    assign _3223 = _1409 ? _3206 : _3222;
    assign _3202 = _1392 + _1410;
    assign _3203 = _3079 ? _3202 : _1064;
    assign _3198 = _1392 + _1410;
    assign _3076 = _3068[7:7];
    assign _3075 = _3068[6:6];
    assign _3074 = _3068[5:5];
    assign _3073 = _3068[4:4];
    assign _3072 = _3068[3:3];
    assign _3071 = _3068[2:2];
    assign _3070 = _3068[1:1];
    assign _3066 = _3058[7:7];
    assign _3065 = _3058[6:6];
    assign _3064 = _3058[5:5];
    assign _3063 = _3058[4:4];
    assign _3062 = _3058[3:3];
    assign _3061 = _3058[2:2];
    assign _3060 = _3058[1:1];
    assign _2723 = _2679 == _2170;
    assign _2724 = _2676 & _2723;
    always @(posedge _258) begin
        if (_256)
            _2725 <= _1213;
        else
            if (_2724)
                _2725 <= _184;
    end
    assign _2717 = _2679 == _2164;
    assign _2718 = _2676 & _2717;
    always @(posedge _258) begin
        if (_256)
            _2719 <= _1213;
        else
            if (_2718)
                _2719 <= _184;
    end
    assign _2711 = _2679 == _2158;
    assign _2712 = _2676 & _2711;
    always @(posedge _258) begin
        if (_256)
            _2713 <= _1213;
        else
            if (_2712)
                _2713 <= _184;
    end
    assign _2705 = _2679 == _1254;
    assign _2706 = _2676 & _2705;
    always @(posedge _258) begin
        if (_256)
            _2707 <= _1213;
        else
            if (_2706)
                _2707 <= _184;
    end
    assign _2699 = _2679 == _2146;
    assign _2700 = _2676 & _2699;
    always @(posedge _258) begin
        if (_256)
            _2701 <= _1213;
        else
            if (_2700)
                _2701 <= _184;
    end
    assign _2693 = _2679 == _1383;
    assign _2694 = _2676 & _2693;
    always @(posedge _258) begin
        if (_256)
            _2695 <= _1213;
        else
            if (_2694)
                _2695 <= _184;
    end
    assign _2687 = _2679 == _1410;
    assign _2688 = _2676 & _2687;
    always @(posedge _258) begin
        if (_256)
            _2689 <= _1213;
        else
            if (_2688)
                _2689 <= _184;
    end
    assign _3083 = _2679 + _1410;
    assign _3084 = _2676 ? _3083 : _2679;
    assign _182 = _3084;
    always @(posedge _258) begin
        if (_256)
            _2679 <= _1064;
        else
            _2679 <= _182;
    end
    assign _2681 = _2679 == _1064;
    assign _2682 = _2676 & _2681;
    assign _184 = host_tx_data;
    always @(posedge _258) begin
        if (_256)
            _2683 <= _1213;
        else
            if (_2682)
                _2683 <= _184;
    end
    assign _3088 = _2672 + _1410;
    assign _3089 = _3086 ? _3088 : _2672;
    assign _185 = _3089;
    always @(posedge _258) begin
        if (_256)
            _2672 <= _1064;
        else
            _2672 <= _185;
    end
    always @* begin
        case (_2672)
        0:
            _2726 <= _2683;
        1:
            _2726 <= _2689;
        2:
            _2726 <= _2695;
        3:
            _2726 <= _2701;
        4:
            _2726 <= _2707;
        5:
            _2726 <= _2713;
        6:
            _2726 <= _2719;
        default:
            _2726 <= _2725;
        endcase
    end
    assign _3057 = _588 ? _1211 : _2726;
    assign _2219 = _2216[7:1];
    assign _2220 = { _1400,
                     _2219 };
    assign _2217 = _2216[6:0];
    assign _2218 = { _2217,
                     _1400 };
    assign _2221 = _188 ? _2220 : _2218;
    assign _3094 = _1659 ? _2221 : _3093;
    assign _3095 = _1653 ? _3094 : _3093;
    assign _3096 = _1409 ? _3093 : _3095;
    assign _3090 = _1658 ? _3058 : _2216;
    assign _3091 = _1394 ? _2216 : _3090;
    assign _3092 = _1686 ? _3091 : _2216;
    assign _3093 = _1678 ? _3092 : _2216;
    assign _3097 = _1364 ? _3096 : _3093;
    assign _186 = _3097;
    always @(posedge _258) begin
        if (_256)
            _2216 <= _1213;
        else
            _2216 <= _186;
    end
    assign _3054 = _1662 == _1064;
    assign _3051 = ~ _1394;
    assign _3052 = _3051 & _1658;
    assign _3055 = _3052 & _3054;
    assign _3058 = _3055 ? _3057 : _2216;
    assign _3059 = _3058[0:0];
    assign _3067 = { _3059,
                     _3060,
                     _3061,
                     _3062,
                     _3063,
                     _3064,
                     _3065,
                     _3066 };
    assign _188 = host_lane0_lsb_first;
    assign _3068 = _188 ? _3058 : _3067;
    assign _3069 = _3068[0:0];
    assign _3105 = _1662 + _1410;
    assign _3106 = _1659 ? _3105 : _3103;
    assign _3107 = _1653 ? _3106 : _3103;
    assign _3108 = _1409 ? _3103 : _3107;
    assign _3099 = _1662 + _1410;
    assign _3100 = _1658 ? _3099 : _1662;
    assign _3101 = _1394 ? _1662 : _3100;
    assign _3102 = _1686 ? _3101 : _1662;
    assign _3103 = _1678 ? _3102 : _1662;
    assign _3109 = _1364 ? _3108 : _3103;
    assign _3111 = _1263 ? _1064 : _3109;
    assign _189 = _3111;
    always @(posedge _258) begin
        if (_256)
            _1662 <= _1064;
        else
            _1662 <= _189;
    end
    always @* begin
        case (_1662)
        0:
            _3077 <= _3069;
        1:
            _3077 <= _3070;
        2:
            _3077 <= _3071;
        3:
            _3077 <= _3072;
        4:
            _3077 <= _3073;
        5:
            _3077 <= _3074;
        6:
            _3077 <= _3075;
        default:
            _3077 <= _3076;
        endcase
    end
    assign _191 = host_lane0_crc_inv;
    assign _193 = host_lane0_init;
    assign _3153 = _2585[30:0];
    assign _3155 = { _3153,
                     _1056 };
    assign _3147 = _2585[31:31];
    assign _3148 = _1400 ^ _3147;
    assign _3150 = _3148 ? _198 : _1813;
    assign _3144 = _2585[30:0];
    assign _3146 = { _3144,
                     _1056 };
    assign _3151 = _3146 ^ _3150;
    assign _3152 = _1659 ? _3151 : _3143;
    assign _195 = host_lane0_crc_width;
    assign _3121 = _1682 - _2532;
    assign _3122 = _2582 ? _3121 : _3119;
    assign _3123 = _1653 ? _3122 : _3119;
    assign _3124 = _1409 ? _3119 : _3123;
    assign _3115 = _1682 - _2532;
    assign _3116 = _1658 ? _1682 : _3115;
    assign _3117 = _1394 ? _1682 : _3116;
    assign _3118 = _1686 ? _3117 : _1682;
    assign _3119 = _1678 ? _3118 : _1682;
    assign _3125 = _1364 ? _3124 : _3119;
    assign _3126 = _3113 ? _195 : _3125;
    assign _3128 = _1263 ? _1187 : _3126;
    assign _196 = _3128;
    always @(posedge _258) begin
        if (_256)
            _1682 <= _1187;
        else
            _1682 <= _196;
    end
    assign _1684 = _1682 == _1187;
    assign _1685 = ~ _1684;
    assign _2580 = ~ _1658;
    assign _2579 = _1364 & _1653;
    assign _2581 = _2579 & _2580;
    assign _2582 = _2581 & _1685;
    assign _3156 = _2582 ? _3155 : _3152;
    assign _3157 = _1653 ? _3156 : _3143;
    assign _3158 = _1409 ? _3143 : _3157;
    assign _198 = host_lane0_poly;
    assign _3135 = _2585[31:31];
    assign _3136 = _3079 ^ _3135;
    assign _3138 = _3136 ? _198 : _1813;
    assign _3132 = _2585[30:0];
    assign _3134 = { _3132,
                     _1056 };
    assign _3139 = _3134 ^ _3138;
    assign _3129 = _2585[30:0];
    assign _3131 = { _3129,
                     _1056 };
    assign _3140 = _1658 ? _3139 : _3131;
    assign _3141 = _1394 ? _2585 : _3140;
    assign _3142 = _1686 ? _3141 : _2585;
    assign _3143 = _1678 ? _3142 : _2585;
    assign _3159 = _1364 ? _3158 : _3143;
    assign _3160 = _1263 ? _193 : _3159;
    assign _3162 = _1261 ? _1813 : _3160;
    assign _199 = _3162;
    always @(posedge _258) begin
        if (_256)
            _2585 <= _1813;
        else
            _2585 <= _199;
    end
    assign _2586 = _2585[31:31];
    assign _2587 = _2586 ^ _191;
    assign _201 = host_lane0_frame_bits;
    assign _3182 = _1657 + _3678;
    assign _1654 = _1364 & _1653;
    assign _1659 = _1654 & _1658;
    assign _3183 = _1659 ? _3182 : _3180;
    assign _1653 = ~ _1394;
    assign _3184 = _1653 ? _3183 : _3180;
    assign _3165 = _1409 ? _3164 : _1400;
    assign _3163 = _1686 ? _3079 : _1404;
    assign _3164 = _1678 ? _3163 : _1404;
    assign _3166 = _1364 ? _3165 : _3164;
    assign _3168 = _1263 ? _1586 : _3166;
    assign _202 = _3168;
    always @(posedge _258) begin
        if (_256)
            _1404 <= vdd;
        else
            _1404 <= _202;
    end
    assign _1405 = ~ _1404;
    assign _1402 = _207 == _1204;
    assign _1406 = _1402 ? _1405 : gnd;
    assign _3170 = _223 == _1204;
    assign _3171 = _3170 ? _1275 : _1398;
    assign _3172 = _1364 ? _3171 : _1398;
    assign _3174 = _1263 ? _1586 : _3172;
    assign _203 = _3174;
    always @(posedge _258) begin
        if (_256)
            _1398 <= vdd;
        else
            _1398 <= _203;
    end
    assign _1399 = _1275 == _1398;
    assign _1396 = _223 == _1204;
    assign _1400 = _1396 ? _1399 : _1275;
    assign _1407 = _1400 == _1406;
    assign _1408 = ~ _1407;
    assign _1409 = _1394 & _1408;
    assign _3185 = _1409 ? _3180 : _3184;
    assign _3176 = _1657 + _3678;
    assign _3177 = _1658 ? _3176 : _1657;
    assign _3178 = _1394 ? _1657 : _3177;
    assign _3179 = _1686 ? _3178 : _1657;
    assign _3180 = _1678 ? _3179 : _1657;
    assign _3186 = _1364 ? _3185 : _3180;
    assign _3188 = _1263 ? _1163 : _3186;
    assign _204 = _3188;
    always @(posedge _258) begin
        if (_256)
            _1657 <= _1163;
        else
            _1657 <= _204;
    end
    assign _1658 = _1657 < _201;
    assign _3078 = _1658 ? _3077 : _2587;
    assign _3079 = _1394 ? _1406 : _3078;
    assign _3194 = _3079 == _1404;
    assign _3192 = _1392 == _1064;
    assign _3193 = ~ _3192;
    assign _3195 = _3193 & _3194;
    assign _3199 = _3195 ? _3198 : _1410;
    assign _3190 = _207 == _1205;
    assign _3204 = _3190 ? _3203 : _3199;
    assign _3205 = _1686 ? _3204 : _1392;
    assign _3206 = _1678 ? _3205 : _1392;
    assign _3224 = _1364 ? _3223 : _3206;
    assign _3226 = _1263 ? _1064 : _3224;
    assign _205 = _3226;
    always @(posedge _258) begin
        if (_256)
            _1392 <= _1064;
        else
            _1392 <= _205;
    end
    assign _1393 = _1392 == _181;
    assign _207 = host_lane0_stuff;
    assign _1388 = _207 == _2287;
    assign _1389 = ~ _1388;
    assign _1394 = _1389 & _1393;
    assign _1679 = _1394 | _1658;
    assign _1686 = _1679 | _1685;
    assign _3240 = _1686 ? _3239 : _1586;
    assign _3241 = _1678 ? _3240 : _1376;
    assign _1674 = _1334 == _1163;
    assign _1672 = _1299 == _1163;
    assign _1675 = _1327 ? _1674 : _1672;
    assign _1676 = _1295 ? vdd : _1675;
    assign _1677 = _227 ? _1362 : _1676;
    assign _3233 = ~ _1677;
    assign _3230 = _223 == _1205;
    assign _3227 = ~ _229;
    assign _3228 = _1265 & _3227;
    assign _3231 = _3228 & _3230;
    assign _3232 = _3231 & _1363;
    assign _3234 = _3232 & _3233;
    assign _3242 = _3234 ? _3050 : _3241;
    assign _3244 = _1379 ? _1586 : _3242;
    assign _3246 = _1667 ? _1586 : _3244;
    assign _3248 = _1263 ? _1586 : _3246;
    assign _3250 = _1261 ? _1586 : _3248;
    assign _208 = _3250;
    always @(posedge _258) begin
        if (_256)
            _1376 <= vdd;
        else
            _1376 <= _208;
    end
    assign _1377 = _1275 == _1376;
    assign _1378 = ~ _1377;
    assign _1371 = _223 == _1205;
    assign _1372 = ~ _1371;
    assign _1368 = ~ _227;
    assign _210 = host_lane0_readback;
    assign _1365 = ~ _229;
    assign _1366 = _1265 & _1365;
    assign _1367 = _1366 & _210;
    assign _1369 = _1367 & _1368;
    assign _1373 = _1369 & _1372;
    assign _1374 = _1373 & _1363;
    assign _1379 = _1374 & _1378;
    assign _3319 = _1379 ? _2287 : _3317;
    assign _1360 = ~ _1348;
    assign _1361 = _1357 & _1360;
    assign _1356 = _315[7:7];
    assign _1355 = _315[6:6];
    assign _1354 = _315[5:5];
    assign _1353 = _315[4:4];
    assign _1352 = _315[3:3];
    assign _1351 = _315[2:2];
    assign _1350 = _315[1:1];
    assign _1349 = _315[0:0];
    always @* begin
        case (_212)
        0:
            _1357 <= _1349;
        1:
            _1357 <= _1350;
        2:
            _1357 <= _1351;
        3:
            _1357 <= _1352;
        4:
            _1357 <= _1353;
        5:
            _1357 <= _1354;
        6:
            _1357 <= _1355;
        default:
            _1357 <= _1356;
        endcase
    end
    assign _1358 = ~ _1357;
    assign _1347 = _299[7:7];
    assign _1346 = _299[6:6];
    assign _1345 = _299[5:5];
    assign _1344 = _299[4:4];
    assign _1343 = _299[3:3];
    assign _1342 = _299[2:2];
    assign _1341 = _299[1:1];
    assign _1340 = _299[0:0];
    assign _212 = host_lane0_clk_pin;
    always @* begin
        case (_212)
        0:
            _1348 <= _1340;
        1:
            _1348 <= _1341;
        2:
            _1348 <= _1342;
        3:
            _1348 <= _1343;
        4:
            _1348 <= _1344;
        5:
            _1348 <= _1345;
        6:
            _1348 <= _1346;
        default:
            _1348 <= _1347;
        endcase
    end
    assign _1359 = _1348 & _1358;
    assign _214 = host_lane0_clk_edge;
    assign _1362 = _214 ? _1361 : _1359;
    assign _1338 = _1323 == _1163;
    assign _1335 = _1334 == _1323;
    assign _1328 = _1299 == _1323;
    assign _1326 = ~ _1290;
    assign _1317 = _216[15:2];
    assign _1318 = { _2287,
                     _1317 };
    assign _1314 = _216[15:1];
    assign _1315 = { _1056,
                     _1314 };
    assign _1319 = _1315 + _1318;
    assign _1311 = _216[15:1];
    assign _1312 = { _1056,
                     _1311 };
    assign _1309 = _229 & _1292;
    assign _1320 = _1309 ? _1319 : _1312;
    always @(posedge _258) begin
        if (_256)
            _1323 <= _1163;
        else
            _1323 <= _1320;
    end
    assign _1324 = _1299 < _1323;
    assign _1301 = _216[15:2];
    assign _1302 = { _2287,
                     _1301 };
    always @(posedge _258) begin
        if (_256)
            _1305 <= _1163;
        else
            _1305 <= _1302;
    end
    assign _3296 = ~ _1290;
    assign _3297 = _1325 & _3296;
    assign _3298 = _3297 ? _1334 : _1299;
    assign _3300 = _1295 ? _1163 : _3298;
    assign _3302 = _3300 + _3678;
    assign _3280 = _3274 == _1123;
    assign _1330 = _216[15:1];
    assign _1331 = { _1056,
                     _1330 };
    always @(posedge _258) begin
        if (_256)
            _1334 <= _1163;
        else
            _1334 <= _1331;
    end
    assign _3276 = { gnd,
                     _1334 };
    assign _3277 = _3276 == _3274;
    assign _3270 = { gnd,
                     _216 };
    always @(posedge _258) begin
        if (_256)
            _3273 <= _1123;
        else
            _3273 <= _3270;
    end
    assign _216 = host_lane0_div_int;
    assign _3264 = { gnd,
                     _216 };
    assign _3266 = _3264 - _2928;
    always @(posedge _258) begin
        if (_256)
            _3269 <= _1123;
        else
            _3269 <= _3266;
    end
    assign _218 = host_lane0_div_frac;
    assign _3284 = { gnd,
                     _218 };
    assign _3286 = _3285[7:0];
    assign _3287 = _3282 ? _3286 : _3258;
    assign _3288 = _3255 ? _3287 : _3258;
    assign _3290 = _1263 ? _1213 : _3288;
    assign _219 = _3290;
    always @(posedge _258) begin
        if (_256)
            _3258 <= _1213;
        else
            _3258 <= _219;
    end
    assign _3283 = { gnd,
                     _3258 };
    assign _3285 = _3283 + _3284;
    assign _3291 = _3285[8:8];
    assign _3292 = _3282 ? _3291 : _3263;
    assign _3293 = _3255 ? _3292 : _3263;
    assign _3295 = _1263 ? _1056 : _3293;
    assign _220 = _3295;
    always @(posedge _258) begin
        if (_256)
            _3263 <= _1056;
        else
            _3263 <= _220;
    end
    assign _3274 = _3263 ? _3273 : _3269;
    assign _3260 = { gnd,
                     _1299 };
    assign _3275 = _3260 == _3274;
    assign _3278 = _1327 ? _3277 : _3275;
    assign _3281 = _1295 ? _3280 : _3278;
    assign _3259 = ~ _227;
    assign _3282 = _3259 & _3281;
    assign _3304 = _3282 ? _1163 : _3302;
    assign _3254 = ~ _227;
    assign _3252 = _1290 & _1288;
    assign _602 = _600 == _1784;
    assign _3251 = _1265 | _602;
    assign _3253 = _3251 | _3252;
    assign _3255 = _3253 & _3254;
    assign _3305 = _3255 ? _3304 : _1299;
    assign _3307 = _1263 ? _1163 : _3305;
    assign _221 = _3307;
    always @(posedge _258) begin
        if (_256)
            _1299 <= _1163;
        else
            _1299 <= _221;
    end
    assign _1306 = _1299 < _1305;
    assign _1307 = ~ _1306;
    assign _1296 = _1288 & _1292;
    assign _1308 = _1296 & _1307;
    assign _1325 = _1308 & _1324;
    assign _1327 = _1325 & _1326;
    assign _1336 = _1327 ? _1335 : _1328;
    assign _223 = host_lane0_code;
    assign _1292 = _223 == _1205;
    assign _1293 = ~ _1292;
    assign _1290 = _600 == _1204;
    assign _1294 = _1290 | _1293;
    assign _1287 = ~ _227;
    assign _1283 = _315[7:7];
    assign _1282 = _315[6:6];
    assign _1281 = _315[5:5];
    assign _1280 = _315[4:4];
    assign _1279 = _315[3:3];
    assign _1278 = _315[2:2];
    assign _1277 = _315[1:1];
    assign _1276 = _315[0:0];
    always @* begin
        case (_225)
        0:
            _1284 <= _1276;
        1:
            _1284 <= _1277;
        2:
            _1284 <= _1278;
        3:
            _1284 <= _1279;
        4:
            _1284 <= _1280;
        5:
            _1284 <= _1281;
        6:
            _1284 <= _1282;
        default:
            _1284 <= _1283;
        endcase
    end
    assign _1274 = _299[7:7];
    assign _1273 = _299[6:6];
    assign _1272 = _299[5:5];
    assign _1271 = _299[4:4];
    assign _1270 = _299[3:3];
    assign _1269 = _299[2:2];
    assign _1268 = _299[1:1];
    assign _1267 = _299[0:0];
    assign _225 = host_lane0_data_pin;
    always @* begin
        case (_225)
        0:
            _1275 <= _1267;
        1:
            _1275 <= _1268;
        2:
            _1275 <= _1269;
        3:
            _1275 <= _1270;
        4:
            _1275 <= _1271;
        5:
            _1275 <= _1272;
        6:
            _1275 <= _1273;
        default:
            _1275 <= _1274;
        endcase
    end
    assign _1285 = _1275 ^ _1284;
    assign _1286 = _229 & _1285;
    assign _1288 = _1286 & _1287;
    assign _1295 = _1288 & _1294;
    assign _1339 = _1295 ? _1338 : _1336;
    assign _227 = host_lane0_clk_pin_en;
    assign _1363 = _227 ? _1362 : _1339;
    assign _229 = host_lane0_dir;
    assign _1266 = _1265 & _229;
    assign _1364 = _1266 & _1363;
    assign _3371 = _1364 ? _3370 : _3319;
    assign _1667 = _230 == _1383;
    assign _3373 = _1667 ? _2287 : _3371;
    assign _3113 = _230 == _2146;
    assign _3380 = _3113 ? _3379 : _3373;
    assign _1263 = _230 == _1410;
    assign _3386 = _1263 ? _3385 : _3380;
    assign _2337 = _701[90:88];
    assign _2336 = _695[90:88];
    assign _2335 = _689[90:88];
    assign _2334 = _292[90:88];
    always @* begin
        case (f_winner)
        0:
            _2338 <= _2334;
        1:
            _2338 <= _2335;
        2:
            _2338 <= _2336;
        default:
            _2338 <= _2337;
        endcase
    end
    assign _2330 = _701[87:87];
    assign _2329 = _695[87:87];
    assign _2328 = _689[87:87];
    assign _2327 = _292[87:87];
    always @* begin
        case (f_winner)
        0:
            _2331 <= _2327;
        1:
            _2331 <= _2328;
        2:
            _2331 <= _2329;
        default:
            _2331 <= _2330;
        endcase
    end
    assign _3308 = ~ _2331;
    assign _3309 = _1180 & _3308;
    assign _3311 = _3309 ? _2338 : _1064;
    assign _230 = _3311;
    assign _1261 = _230 == _1254;
    assign _3388 = _1261 ? _2287 : _3386;
    assign _231 = _3388;
    always @(posedge _258) begin
        if (_256)
            _600 <= _2287;
        else
            _600 <= _231;
    end
    assign _1265 = _600 == _1205;
    assign _1670 = _1265 & _1669;
    assign _1678 = _1670 & _1677;
    assign _3402 = _1678 & _3055;
    assign _3404 = _3402 & _3403;
    assign _3408 = _3404 | _3407;
    assign _3399 = _3395 == _1205;
    assign _3397 = _3395 == _1204;
    assign _3400 = _3397 | _3399;
    assign _3401 = _1713 & _3400;
    assign _3409 = _3401 | _3408;
    assign _232 = _3409;
    assign _3086 = _232 & _3085;
    assign _2283 = _235 == _1590;
    assign _2675 = ~ _2283;
    assign _234 = host_tx_push;
    assign _2676 = _234 & _2675;
    assign _3410 = _2676 ^ _3086;
    assign _3416 = _3410 ? _3415 : _235;
    always @(posedge _258) begin
        if (_256)
            _3419 <= _1798;
        else
            _3419 <= _3416;
    end
    assign _235 = _3419;
    assign _588 = _235 == _1798;
    assign _3421 = _588 ? _1211 : _2726;
    assign _3394 = _684[28:27];
    assign _3392 = _701[95:94];
    assign _3391 = _695[95:94];
    assign _3390 = _689[95:94];
    assign _3389 = _292[95:94];
    always @* begin
        case (f_winner)
        0:
            _3393 <= _3389;
        1:
            _3393 <= _3390;
        2:
            _3393 <= _3391;
        default:
            _3393 <= _3392;
        endcase
    end
    assign _3395 = _1712 ? _3394 : _3393;
    always @* begin
        case (_3395)
        0:
            _3433 <= _581;
        1:
            _3433 <= _3421;
        2:
            _3433 <= _3430;
        default:
            _3433 <= _3432;
        endcase
    end
    assign _3434 = _1713 ? _3433 : _581;
    assign _236 = _3434;
    always @(posedge _258) begin
        if (_256)
            _581 <= _1213;
        else
            _581 <= _236;
    end
    assign _582 = _581[0:0];
    assign _3445 = 8'b00001000;
    assign _3444 = 8'b00000111;
    assign _3442 = 8'b00000001;
    assign _3443 = _576 - _3442;
    assign _3440 = _684[30:29];
    assign _701 = _291[511:400];
    assign _3438 = _701[99:98];
    assign _695 = _291[399:288];
    assign _3437 = _695[99:98];
    assign _3436 = _689[99:98];
    assign _3435 = _292[99:98];
    always @* begin
        case (f_winner)
        0:
            _3439 <= _3435;
        1:
            _3439 <= _3436;
        2:
            _3439 <= _3437;
        default:
            _3439 <= _3438;
        endcase
    end
    assign _3441 = _1712 ? _3440 : _3439;
    always @* begin
        case (_3441)
        0:
            _3446 <= _576;
        1:
            _3446 <= _3443;
        2:
            _3446 <= _3444;
        default:
            _3446 <= _3445;
        endcase
    end
    assign _3447 = _1713 ? _3446 : _576;
    assign _237 = _3447;
    always @(posedge _258) begin
        if (_256)
            _576 <= _1213;
        else
            _576 <= _237;
    end
    assign _578 = _576 == _1213;
    assign _806 = _689[61:58];
    always @* begin
        case (_806)
        0:
            _807 <= vdd;
        1:
            _807 <= _578;
        2:
            _807 <= _582;
        3:
            _807 <= _586;
        4:
            _807 <= _588;
        5:
            _807 <= _590;
        6:
            _807 <= _594;
        7:
            _807 <= _597;
        8:
            _807 <= _602;
        9:
            _807 <= _605;
        10:
            _807 <= _608;
        11:
            _807 <= _611;
        12:
            _807 <= _616;
        13:
            _807 <= _619;
        14:
            _807 <= _622;
        default:
            _807 <= _625;
        endcase
    end
    assign _809 = _807 ^ _808;
    assign _801 = _689[57:42];
    assign _803 = _801 == _1053;
    assign _792 = _738[57:42];
    assign _793 = { gnd,
                    _792 };
    assign _794 = _793 + _781;
    always @(posedge _258) begin
        if (_256)
            _797 <= _1123;
        else
            _797 <= _794;
    end
    assign _798 = _797 < _737;
    assign _799 = ~ _798;
    assign _788 = _689[41:26];
    assign _790 = _788 == _1163;
    assign _536 = _532 + _1410;
    assign _3462 = _532 + _1410;
    assign _3458 = _532 == _2170;
    assign _3459 = ~ _3458;
    assign _3456 = _312[0:0];
    assign _3460 = _3456 & _3459;
    assign _3463 = _3460 ? _3462 : _532;
    assign _3453 = _312[0:0];
    assign _3454 = ~ _3453;
    assign _3452 = f_chg_now[0:0];
    assign _3455 = _3452 & _3454;
    assign _3465 = _3455 ? _1410 : _3463;
    assign _3449 = _276 == _1205;
    assign _3451 = _3449 ? _1064 : _532;
    assign _3448 = _276 == _1204;
    assign _3466 = _3448 ? _3465 : _3451;
    assign _238 = _3466;
    always @(posedge _258) begin
        if (_256)
            _532 <= _1064;
        else
            _532 <= _238;
    end
    assign _534 = _532 == _2170;
    assign _537 = _534 ? _532 : _536;
    assign _527 = _312[0:0];
    assign _528 = ~ _527;
    assign _526 = f_chg_now[0:0];
    assign _529 = _526 & _528;
    assign _539 = _529 ? _1410 : _537;
    assign _523 = f_changed_all[0:0];
    assign _524 = f_in_fetch & _523;
    assign _540 = _524 ? _539 : _1064;
    assign _772 = _742[0:0];
    assign _774 = _772 ? _540 : _1064;
    assign _515 = _511 + _1410;
    assign _3481 = _511 + _1410;
    assign _3477 = _511 == _2170;
    assign _3478 = ~ _3477;
    assign _3475 = _312[1:1];
    assign _3479 = _3475 & _3478;
    assign _3482 = _3479 ? _3481 : _511;
    assign _3472 = _312[1:1];
    assign _3473 = ~ _3472;
    assign _3471 = f_chg_now[1:1];
    assign _3474 = _3471 & _3473;
    assign _3484 = _3474 ? _1410 : _3482;
    assign _3468 = _276 == _1205;
    assign _3470 = _3468 ? _1064 : _511;
    assign _3467 = _276 == _1204;
    assign _3485 = _3467 ? _3484 : _3470;
    assign _239 = _3485;
    always @(posedge _258) begin
        if (_256)
            _511 <= _1064;
        else
            _511 <= _239;
    end
    assign _513 = _511 == _2170;
    assign _516 = _513 ? _511 : _515;
    assign _506 = _312[1:1];
    assign _507 = ~ _506;
    assign _505 = f_chg_now[1:1];
    assign _508 = _505 & _507;
    assign _518 = _508 ? _1410 : _516;
    assign _502 = f_changed_all[1:1];
    assign _503 = f_in_fetch & _502;
    assign _519 = _503 ? _518 : _1064;
    assign _769 = _742[1:1];
    assign _771 = _769 ? _519 : _1064;
    assign _775 = _771 < _774;
    assign _776 = _775 ? _774 : _771;
    assign _492 = _488 + _1410;
    assign _3500 = _488 + _1410;
    assign _3496 = _488 == _2170;
    assign _3497 = ~ _3496;
    assign _3494 = _312[2:2];
    assign _3498 = _3494 & _3497;
    assign _3501 = _3498 ? _3500 : _488;
    assign _3491 = _312[2:2];
    assign _3492 = ~ _3491;
    assign _3490 = f_chg_now[2:2];
    assign _3493 = _3490 & _3492;
    assign _3503 = _3493 ? _1410 : _3501;
    assign _3487 = _276 == _1205;
    assign _3489 = _3487 ? _1064 : _488;
    assign _3486 = _276 == _1204;
    assign _3504 = _3486 ? _3503 : _3489;
    assign _240 = _3504;
    always @(posedge _258) begin
        if (_256)
            _488 <= _1064;
        else
            _488 <= _240;
    end
    assign _490 = _488 == _2170;
    assign _493 = _490 ? _488 : _492;
    assign _483 = _312[2:2];
    assign _484 = ~ _483;
    assign _482 = f_chg_now[2:2];
    assign _485 = _482 & _484;
    assign _495 = _485 ? _1410 : _493;
    assign _479 = f_changed_all[2:2];
    assign _480 = f_in_fetch & _479;
    assign _496 = _480 ? _495 : _1064;
    assign _764 = _742[2:2];
    assign _766 = _764 ? _496 : _1064;
    assign _471 = _467 + _1410;
    assign _3519 = _467 + _1410;
    assign _3515 = _467 == _2170;
    assign _3516 = ~ _3515;
    assign _3513 = _312[3:3];
    assign _3517 = _3513 & _3516;
    assign _3520 = _3517 ? _3519 : _467;
    assign _3510 = _312[3:3];
    assign _3511 = ~ _3510;
    assign _3509 = f_chg_now[3:3];
    assign _3512 = _3509 & _3511;
    assign _3522 = _3512 ? _1410 : _3520;
    assign _3506 = _276 == _1205;
    assign _3508 = _3506 ? _1064 : _467;
    assign _3505 = _276 == _1204;
    assign _3523 = _3505 ? _3522 : _3508;
    assign _241 = _3523;
    always @(posedge _258) begin
        if (_256)
            _467 <= _1064;
        else
            _467 <= _241;
    end
    assign _469 = _467 == _2170;
    assign _472 = _469 ? _467 : _471;
    assign _462 = _312[3:3];
    assign _463 = ~ _462;
    assign _461 = f_chg_now[3:3];
    assign _464 = _461 & _463;
    assign _474 = _464 ? _1410 : _472;
    assign _458 = f_changed_all[3:3];
    assign _459 = f_in_fetch & _458;
    assign _475 = _459 ? _474 : _1064;
    assign _761 = _742[3:3];
    assign _763 = _761 ? _475 : _1064;
    assign _767 = _763 < _766;
    assign _768 = _767 ? _766 : _763;
    assign _777 = _768 < _776;
    assign _778 = _777 ? _776 : _768;
    assign _446 = _442 + _1410;
    assign _3538 = _442 + _1410;
    assign _3534 = _442 == _2170;
    assign _3535 = ~ _3534;
    assign _3532 = _312[4:4];
    assign _3536 = _3532 & _3535;
    assign _3539 = _3536 ? _3538 : _442;
    assign _3529 = _312[4:4];
    assign _3530 = ~ _3529;
    assign _3528 = f_chg_now[4:4];
    assign _3531 = _3528 & _3530;
    assign _3541 = _3531 ? _1410 : _3539;
    assign _3525 = _276 == _1205;
    assign _3527 = _3525 ? _1064 : _442;
    assign _3524 = _276 == _1204;
    assign _3542 = _3524 ? _3541 : _3527;
    assign _242 = _3542;
    always @(posedge _258) begin
        if (_256)
            _442 <= _1064;
        else
            _442 <= _242;
    end
    assign _444 = _442 == _2170;
    assign _447 = _444 ? _442 : _446;
    assign _437 = _312[4:4];
    assign _438 = ~ _437;
    assign _436 = f_chg_now[4:4];
    assign _439 = _436 & _438;
    assign _449 = _439 ? _1410 : _447;
    assign _433 = f_changed_all[4:4];
    assign _434 = f_in_fetch & _433;
    assign _450 = _434 ? _449 : _1064;
    assign _754 = _742[4:4];
    assign _756 = _754 ? _450 : _1064;
    assign _425 = _421 + _1410;
    assign _3557 = _421 + _1410;
    assign _3553 = _421 == _2170;
    assign _3554 = ~ _3553;
    assign _3551 = _312[5:5];
    assign _3555 = _3551 & _3554;
    assign _3558 = _3555 ? _3557 : _421;
    assign _3548 = _312[5:5];
    assign _3549 = ~ _3548;
    assign _3547 = f_chg_now[5:5];
    assign _3550 = _3547 & _3549;
    assign _3560 = _3550 ? _1410 : _3558;
    assign _3544 = _276 == _1205;
    assign _3546 = _3544 ? _1064 : _421;
    assign _3543 = _276 == _1204;
    assign _3561 = _3543 ? _3560 : _3546;
    assign _243 = _3561;
    always @(posedge _258) begin
        if (_256)
            _421 <= _1064;
        else
            _421 <= _243;
    end
    assign _423 = _421 == _2170;
    assign _426 = _423 ? _421 : _425;
    assign _416 = _312[5:5];
    assign _417 = ~ _416;
    assign _415 = f_chg_now[5:5];
    assign _418 = _415 & _417;
    assign _428 = _418 ? _1410 : _426;
    assign _412 = f_changed_all[5:5];
    assign _413 = f_in_fetch & _412;
    assign _429 = _413 ? _428 : _1064;
    assign _751 = _742[5:5];
    assign _753 = _751 ? _429 : _1064;
    assign _757 = _753 < _756;
    assign _758 = _757 ? _756 : _753;
    assign _402 = _398 + _1410;
    assign _3576 = _398 + _1410;
    assign _3572 = _398 == _2170;
    assign _3573 = ~ _3572;
    assign _3570 = _312[6:6];
    assign _3574 = _3570 & _3573;
    assign _3577 = _3574 ? _3576 : _398;
    assign _3567 = _312[6:6];
    assign _3568 = ~ _3567;
    assign _3566 = f_chg_now[6:6];
    assign _3569 = _3566 & _3568;
    assign _3579 = _3569 ? _1410 : _3577;
    assign _3563 = _276 == _1205;
    assign _3565 = _3563 ? _1064 : _398;
    assign _3562 = _276 == _1204;
    assign _3580 = _3562 ? _3579 : _3565;
    assign _244 = _3580;
    always @(posedge _258) begin
        if (_256)
            _398 <= _1064;
        else
            _398 <= _244;
    end
    assign _400 = _398 == _2170;
    assign _403 = _400 ? _398 : _402;
    assign _393 = _312[6:6];
    assign _394 = ~ _393;
    assign _392 = f_chg_now[6:6];
    assign _395 = _392 & _394;
    assign _405 = _395 ? _1410 : _403;
    assign _389 = f_changed_all[6:6];
    assign _390 = f_in_fetch & _389;
    assign _406 = _390 ? _405 : _1064;
    assign _746 = _742[6:6];
    assign _748 = _746 ? _406 : _1064;
    assign _381 = _377 + _1410;
    assign _3595 = _377 + _1410;
    assign _3591 = _377 == _2170;
    assign _3592 = ~ _3591;
    assign _3589 = _312[7:7];
    assign _3593 = _3589 & _3592;
    assign _3596 = _3593 ? _3595 : _377;
    assign _3586 = _312[7:7];
    assign _3587 = ~ _3586;
    assign _3585 = f_chg_now[7:7];
    assign _3588 = _3585 & _3587;
    assign _3598 = _3588 ? _1410 : _3596;
    assign _3582 = _276 == _1205;
    assign _3584 = _3582 ? _1064 : _377;
    assign _3581 = _276 == _1204;
    assign _3599 = _3581 ? _3598 : _3584;
    assign _245 = _3599;
    always @(posedge _258) begin
        if (_256)
            _377 <= _1064;
        else
            _377 <= _245;
    end
    assign _379 = _377 == _2170;
    assign _382 = _379 ? _377 : _381;
    assign _372 = _312[7:7];
    assign _373 = ~ _372;
    assign _371 = f_chg_now[7:7];
    assign _374 = _371 & _373;
    assign _384 = _374 ? _1410 : _382;
    assign _368 = f_changed_all[7:7];
    assign _369 = f_in_fetch & _368;
    assign _385 = _369 ? _384 : _1064;
    assign _742 = _738[23:16];
    assign _743 = _742[7:7];
    assign _745 = _743 ? _385 : _1064;
    assign _749 = _745 < _748;
    assign _750 = _749 ? _748 : _745;
    assign _759 = _750 < _758;
    assign _760 = _759 ? _758 : _750;
    assign _779 = _760 < _778;
    assign _780 = _779 ? _778 : _760;
    assign _781 = { _1107,
                    _780 };
    assign _3602 = _343 == _1410;
    assign _3603 = _3602 ? _250 : _290;
    assign _3600 = _276 == _1204;
    assign _3604 = _3600 ? _3603 : _290;
    assign _246 = _3604;
    always @(posedge _258) begin
        if (_256)
            _290 <= _280;
        else
            _290 <= _246;
    end
    assign _357 = _343 == _1410;
    assign _358 = f_in_fetch & _357;
    assign _359 = _358 ? _250 : _290;
    assign _3607 = _343 == _1383;
    assign _3608 = _3607 ? _250 : _287;
    assign _3605 = _276 == _1204;
    assign _3609 = _3605 ? _3608 : _287;
    assign _247 = _3609;
    always @(posedge _258) begin
        if (_256)
            _287 <= _280;
        else
            _287 <= _247;
    end
    assign _353 = _343 == _1383;
    assign _354 = f_in_fetch & _353;
    assign _355 = _354 ? _250 : _287;
    assign _3612 = _343 == _2146;
    assign _3613 = _3612 ? _250 : _284;
    assign _3610 = _276 == _1204;
    assign _3614 = _3610 ? _3613 : _284;
    assign _248 = _3614;
    always @(posedge _258) begin
        if (_256)
            _284 <= _280;
        else
            _284 <= _248;
    end
    assign _349 = _343 == _2146;
    assign _350 = f_in_fetch & _349;
    assign _351 = _350 ? _250 : _284;
    assign _250 = ram_rec_rdata;
    assign _345 = _343 == _1254;
    assign _346 = f_in_fetch & _345;
    assign _347 = _346 ? _250 : _281;
    assign _360 = { _347,
                    _351,
                    _355,
                    _359 };
    assign _738 = _360[287:176];
    assign _739 = _738[41:26];
    assign _740 = { gnd,
                    _739 };
    assign _782 = _740 + _781;
    always @(posedge _258) begin
        if (_256)
            _785 <= _1123;
        else
            _785 <= _782;
    end
    assign gnd = 1'b0;
    assign _737 = { gnd,
                    _734 };
    assign _786 = _737 < _785;
    assign _787 = ~ _786;
    assign _791 = _787 | _790;
    assign _800 = _791 & _799;
    assign _3642 = _333 + _3678;
    assign _3638 = _333 == _1053;
    assign _3639 = ~ _3638;
    assign _3640 = _3636 & _3639;
    assign _3643 = _3640 ? _3642 : _333;
    assign _3622 = _3621[2:2];
    assign _3623 = _1713 & _3622;
    assign _3645 = _3623 ? _1163 : _3643;
    assign _3647 = _268 ? _1163 : _3645;
    assign _251 = _3647;
    always @(posedge _258) begin
        if (_256)
            _333 <= _1163;
        else
            _333 <= _251;
    end
    assign _3659 = _330 + _3678;
    assign _3655 = _330 == _1053;
    assign _3656 = ~ _3655;
    assign _3634 = 9'b111111111;
    assign _3635 = _3627 == _3634;
    assign _3632 = 6'b111111;
    assign _3631 = _3627[5:0];
    assign _3633 = _3631 == _3632;
    assign _3626 = 9'b000000000;
    assign _3648 = 9'b000000001;
    assign _3649 = _3627 + _3648;
    assign _3651 = _268 ? _3626 : _3649;
    assign _252 = _3651;
    always @(posedge _258) begin
        if (_256)
            _3627 <= _3626;
        else
            _3627 <= _252;
    end
    assign _3628 = _3627[2:0];
    assign _3630 = _3628 == _2170;
    assign _3624 = _684[63:62];
    always @* begin
        case (_3624)
        0:
            _3636 <= vdd;
        1:
            _3636 <= _3630;
        2:
            _3636 <= _3633;
        default:
            _3636 <= _3635;
        endcase
    end
    assign _3657 = _3636 & _3656;
    assign _3660 = _3657 ? _3659 : _330;
    assign _3652 = _3621[1:1];
    assign _3653 = _1713 & _3652;
    assign _3662 = _3653 ? _1163 : _3660;
    assign _3664 = _268 ? _1163 : _3662;
    assign _253 = _3664;
    always @(posedge _258) begin
        if (_256)
            _330 <= _1163;
        else
            _330 <= _253;
    end
    assign _733 = _689[25:24];
    always @* begin
        case (_733)
        0:
            _734 <= _327;
        1:
            _734 <= _330;
        2:
            _734 <= _333;
        default:
            _734 <= _333;
        endcase
    end
    assign _736 = _734 == _1053;
    assign _804 = _736 ? _803 : _800;
    always @(posedge _258) begin
        if (_256)
            _315 <= _1213;
        else
            _315 <= _299;
    end
    assign f_chg_now = _299 ^ _315;
    assign _3666 = _276 == _1205;
    assign _3668 = _3666 ? _1213 : _312;
    assign _3665 = _276 == _1204;
    assign _3669 = _3665 ? f_changed_all : _3668;
    assign _3671 = _268 ? _1213 : _3669;
    assign _254 = _3671;
    always @(posedge _258) begin
        if (_256)
            _312 <= _1213;
        else
            _312 <= _254;
    end
    assign f_changed_all = _312 | f_chg_now;
    assign _727 = f_changed_all & f_chgmask1;
    assign _729 = _727 == _1213;
    assign _730 = ~ _729;
    assign f_chgmask1 = _689[23:16];
    assign _726 = f_chgmask1 == _1213;
    assign _731 = _726 | _730;
    assign _720 = _689[7:0];
    assign _718 = _689[15:8];
    assign vdd = 1'b1;
    assign _256 = clear;
    assign _258 = clock;
    assign _260 = pins_in;
    always @(posedge _258) begin
        if (_256)
            _296 <= _1213;
        else
            _296 <= _260;
    end
    always @(posedge _258) begin
        if (_256)
            _299 <= _1213;
        else
            _299 <= _296;
    end
    assign _719 = _299 ^ _718;
    assign _721 = _719 & _720;
    assign _723 = _721 == _1213;
    assign _689 = _291[287:176];
    assign f_valid1 = _689[111:111];
    assign _724 = f_valid1 & _723;
    assign _732 = _724 & _731;
    assign _805 = _732 & _804;
    assign _810 = _805 & _809;
    assign _849 = _810 & _848;
    assign _850 = f_in_eval & _849;
    assign _854 = _850 & _853;
    assign f_fire1 = _854 & _716;
    assign _998 = f_fire1 ? _1204 : _996;
    assign f_winner = f_fire0 ? _2287 : _998;
    always @* begin
        case (f_winner)
        0:
            _3619 <= _3615;
        1:
            _3619 <= _3616;
        2:
            _3619 <= _3617;
        default:
            _3619 <= _3618;
        endcase
    end
    assign _3621 = _1712 ? _3620 : _3619;
    assign _3672 = _3621[0:0];
    assign _3673 = _1713 & _3672;
    assign _3682 = _3673 ? _1163 : _3680;
    assign _3684 = _268 ? _1163 : _3682;
    assign _261 = _3684;
    always @(posedge _258) begin
        if (_256)
            _327 <= _1163;
        else
            _327 <= _261;
    end
    assign _1764 = _684[33:32];
    always @* begin
        case (_1764)
        0:
            _1765 <= _327;
        1:
            _1765 <= _330;
        2:
            _1765 <= _333;
        default:
            _1765 <= _333;
        endcase
    end
    assign _1763 = _684[49:34];
    assign _1766 = _1763 < _1765;
    assign _684 = _291[63:0];
    assign _1761 = _684[31:31];
    assign _1759 = ~ _1180;
    assign _1760 = f_in_eval & _1759;
    assign _1762 = _1760 & _1761;
    assign _1767 = _1762 & _1766;
    assign _1772 = _1767 & _1771;
    assign _1780 = _1772 | f_unexp_now;
    assign _1781 = _1780 | f_amb_now;
    assign _3690 = _1781 ? _3689 : _343;
    assign _3693 = _1180 ? _3692 : _3690;
    assign _3686 = _276 == _1205;
    assign _3694 = _3686 ? _3693 : _343;
    assign _3685 = _276 == _1204;
    assign _3697 = _3685 ? _3696 : _3694;
    assign _3699 = _268 ? _1064 : _3697;
    assign _262 = _3699;
    always @(posedge _258) begin
        if (_256)
            _343 <= _1064;
        else
            _343 <= _262;
    end
    assign _3702 = _343 == _1254;
    assign _3703 = _3702 ? _250 : _281;
    assign _3700 = _276 == _1204;
    assign _3704 = _3700 ? _3703 : _281;
    assign _263 = _3704;
    always @(posedge _258) begin
        if (_256)
            _281 <= _280;
        else
            _281 <= _263;
    end
    assign _291 = { _281,
                    _284,
                    _287,
                    _290 };
    assign _292 = _291[175:64];
    assign f_valid0 = _292[111:111];
    assign _306 = f_valid0 & _305;
    assign _323 = _306 & _322;
    assign _572 = _323 & _571;
    assign _629 = _572 & _628;
    assign _673 = _629 & _672;
    assign f_in_eval = _276 == _1205;
    assign _674 = f_in_eval & _673;
    assign _683 = _674 & _682;
    assign f_fire0 = _683 & _716;
    assign _1084 = f_fire0 | f_fire1;
    assign _1085 = _1084 | f_fire2;
    assign _1180 = _1085 | f_fire3;
    assign _3723 = _1180 ? _3722 : _3720;
    assign _3708 = _276 == _1784;
    assign _3710 = _3708 ? _2287 : _276;
    assign _3706 = _276 == _1205;
    assign _3724 = _3706 ? _3723 : _3710;
    assign _3705 = _276 == _1204;
    assign _3727 = _3705 ? _3726 : _3724;
    assign _265 = host_stop;
    assign _3729 = _265 ? _2287 : _3727;
    assign _3731 = _268 ? _1204 : _3729;
    assign _266 = _3731;
    always @(posedge _258) begin
        if (_256)
            _276 <= _2287;
        else
            _276 <= _266;
    end
    assign f_in_fetch = _276 == _1204;
    assign _1712 = f_in_fetch & _1711;
    assign _1713 = _1712 | _1180;
    assign _2304 = _1713 & _2303;
    assign _3753 = _2304 ? _3752 : _2368;
    assign _268 = host_start;
    assign _3755 = _268 ? _1213 : _3753;
    assign _269 = _3755;
    always @(posedge _258) begin
        if (_256)
            _2368 <= _1213;
        else
            _2368 <= _269;
    end
    assign _2369 = _2368[7:7];
    assign _271 = host_pin_src;
    assign _2365 = _271[23:21];
    always @* begin
        case (_2365)
        0:
            _2376 <= _2369;
        1:
            _2376 <= _1376;
        2:
            _2376 <= _2370;
        3:
            _2376 <= _2371;
        4:
            _2376 <= _2373;
        5:
            _2376 <= _1533;
        6:
            _2376 <= _2374;
        default:
            _2376 <= _2375;
        endcase
    end
    assign _2440 = { _2376,
                     _2385,
                     _2394,
                     _2403,
                     _2412,
                     _2421,
                     _2430,
                     _2439 };
    assign _3757 = _2440 & _3756;
    assign pins_out = _3757;
    assign pins_oe = _2443;
    assign st_running = _2300;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1188;
    assign st_accepting = _2299;
    assign st_taken = _2297;
    assign st_taken_edge = _2294;
    assign st_viol = _2291;
    assign st_viol_kind = _2288;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _2283;
    assign st_tx_empty = _588;
    assign st_rx_data = _2281;
    assign st_rx_empty = _1796;
    assign st_vlog_data = _2174;
    assign st_vlog_empty = _1799;
    assign st_cov_rdata = _50;
    assign st_irq = _1803;
    assign st_halted_viol = _1745;
    assign st_rx_overflow = _1738;
    assign st_vlog_overflow = _1595;
    assign st_cov_overrun = _1585;
    assign st_lane_status = _1576;
    assign ram_rec_addr = _1259;
    assign ram_rec_re = _1256;
    assign ram_rec_we = _1253;
    assign ram_rec_wdata = _20;
    assign ram_cov_addr = _1252;
    assign ram_cov_re = _1247;
    assign ram_cov_we = _1244;
    assign ram_cov_wdata = _1236;

endmodule
