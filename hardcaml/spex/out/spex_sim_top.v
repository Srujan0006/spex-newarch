module spex_sim_top (
    host_lane_we,
    host_cov_re,
    host_err_clear,
    host_irq_ack,
    host_cov_we,
    host_cov_wdata,
    host_cov_addr,
    host_cover_en,
    host_vlog_pop,
    host_open_drain,
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
    st_lane_status
);

    input [1:0] host_lane_we;
    input host_cov_re;
    input host_err_clear;
    input host_irq_ack;
    input host_cov_we;
    input [31:0] host_cov_wdata;
    input [7:0] host_cov_addr;
    input host_cover_en;
    input host_vlog_pop;
    input [7:0] host_open_drain;
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
    output [15:0] st_lane_status;

    wire [2:0] _410;
    wire [2:0] _440;
    wire [2:0] _441;
    wire [2:0] _413;
    wire [2:0] _412;
    wire [2:0] _414;
    wire [2:0] _415;
    wire [2:0] _442;
    wire [2:0] _444;
    wire [2:0] _446;
    wire [2:0] _1;
    reg [2:0] _411;
    wire [7:0] _631;
    wire [2:0] _602;
    wire [2:0] _576;
    wire [2:0] _577;
    wire [2:0] _603;
    wire [2:0] _605;
    wire [2:0] _607;
    wire [2:0] _2;
    reg [2:0] _573;
    wire [7:0] _619;
    wire [15:0] _632;
    wire [1:0] _635;
    wire [2:0] _681;
    wire [2:0] _683;
    wire [2:0] _5;
    reg [2:0] _680;
    wire _674;
    wire _684;
    wire _676;
    wire [2:0] _667;
    wire [2:0] _664;
    wire [2:0] _668;
    wire _633;
    wire _659;
    wire _660;
    wire _634;
    wire [1:0] _8;
    wire _657;
    wire _658;
    wire _661;
    wire _653;
    wire _646;
    wire _654;
    wire _644;
    wire _10;
    wire _643;
    wire _645;
    wire _655;
    wire _641;
    wire _642;
    wire _656;
    wire _662;
    wire [2:0] _669;
    wire _671;
    wire _672;
    wire _677;
    wire _685;
    wire _12;
    wire _687;
    wire _13;
    reg _675;
    wire _1524;
    wire _1525;
    wire _1509;
    wire _1526;
    wire _1531;
    wire _1533;
    wire _15;
    reg _1529;
    wire _1536;
    wire _1541;
    wire _1543;
    wire _17;
    reg _1539;
    wire _1675;
    wire _1668;
    wire _1676;
    wire _1649;
    wire _1596;
    wire _1650;
    wire _1677;
    wire _19;
    wire _1678;
    wire _1679;
    wire _1684;
    wire _1686;
    wire _20;
    reg _1682;
    wire _1690;
    wire _1691;
    wire _1696;
    wire _24;
    wire _1698;
    wire _1700;
    wire _25;
    reg _1694;
    wire _1729;
    wire _1731;
    wire _1727;
    wire _1733;
    wire _1734;
    wire _1735;
    wire _1702;
    wire _1736;
    wire _1738;
    wire _26;
    reg _1689;
    wire _1744;
    wire _1741;
    wire _1745;
    wire _1746;
    wire _1747;
    wire _1847;
    wire _1846;
    wire _1848;
    wire [31:0] _1845;
    wire _1839;
    wire _1837;
    wire _29;
    wire _1836;
    wire _1838;
    wire f_host_cov_we;
    wire _1841;
    wire [11:0] _1830;
    wire _1827;
    wire _1828;
    wire [11:0] _1829;
    wire _1831;
    wire [11:0] _1832;
    wire [11:0] _1833;
    wire [11:0] _1819;
    wire [11:0] _1780;
    wire [11:0] _1777;
    wire [12:0] _1774;
    wire [9:0] _1771;
    wire [12:0] _1772;
    wire [12:0] _1773;
    reg [2:0] _1748;
    wire [2:0] _30;
    reg [2:0] _1768;
    wire [12:0] _1769;
    wire [12:0] _1754;
    wire [12:0] _1753;
    wire [15:0] _1749;
    wire _1752;
    wire [12:0] _1755;
    wire [12:0] _31;
    reg [12:0] _1764;
    wire _1770;
    wire [12:0] _1775;
    wire [12:0] _1761;
    wire _1776;
    wire [11:0] _1779;
    wire [15:0] _1756;
    wire _1757;
    wire _32;
    reg _1760;
    wire [11:0] _1781;
    wire [11:0] _33;
    reg [11:0] _1820;
    wire [11:0] _1784;
    reg [1:0] _1750;
    reg [15:0] _1751;
    wire [15:0] _1782;
    wire _1783;
    wire [11:0] _1786;
    wire [11:0] _34;
    reg [11:0] _1817;
    wire _1821;
    wire _1822;
    wire [11:0] _1823;
    wire [11:0] _1814;
    wire _1824;
    wire [11:0] _1825;
    wire [7:0] _1812;
    wire _1813;
    wire [11:0] _1826;
    wire [7:0] _1810;
    wire [7:0] _1809;
    wire [1:0] _1804;
    wire [1:0] _1803;
    wire _1788;
    wire _1787;
    wire _1789;
    wire _35;
    reg _1802;
    wire [1:0] _1805;
    wire [6:0] _1799;
    wire [8:0] _1806;
    wire [7:0] _1797;
    wire [8:0] _1798;
    wire [8:0] _1807;
    wire _1808;
    wire [7:0] _1811;
    wire [31:0] _1834;
    wire [31:0] _37;
    wire [31:0] _1835;
    reg [31:0] _1842[0:255];
    wire [7:0] _38;
    reg [7:0] _1795;
    wire [7:0] _1520;
    wire [7:0] _39;
    reg [7:0] _1523;
    wire [7:0] _41;
    wire [7:0] _1792;
    wire _1790;
    wire _43;
    wire _1508;
    wire _1791;
    wire _44;
    reg _649;
    wire _45;
    reg _652;
    wire [7:0] _1796;
    wire [31:0] _1843;
    reg [31:0] _1849;
    wire [31:0] _46;
    wire [31:0] _1851;
    wire [2:0] _2218;
    wire _2219;
    wire _2220;
    wire [47:0] _2217;
    reg [47:0] _2221;
    wire [2:0] _2212;
    wire _2213;
    wire _2214;
    reg [47:0] _2215;
    wire [2:0] _2206;
    wire _2207;
    wire _2208;
    reg [47:0] _2209;
    wire _2201;
    wire _2202;
    reg [47:0] _2203;
    wire _2195;
    wire _2196;
    reg [47:0] _2197;
    wire _2189;
    wire _2190;
    reg [47:0] _2191;
    wire _2183;
    wire _2184;
    reg [47:0] _2185;
    wire [2:0] _1858;
    wire [2:0] _1859;
    wire [2:0] _49;
    reg [2:0] _1856;
    wire _2177;
    wire _2178;
    wire [2:0] _2150;
    wire [28:0] _1867;
    wire [28:0] _1866;
    wire [28:0] _1869;
    wire [28:0] _1870;
    wire [2:0] _1863;
    wire _1865;
    wire [28:0] _1871;
    wire [28:0] _50;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2148;
    wire [2:0] _1889;
    wire _1885;
    wire _1886;
    wire _1883;
    wire _1887;
    wire [2:0] _1890;
    wire _1880;
    wire _1881;
    wire _1878;
    wire _1877;
    wire _1879;
    wire _1882;
    wire [2:0] _1892;
    wire _1873;
    wire [2:0] _1893;
    wire [2:0] _51;
    reg [2:0] _1876;
    wire _2139;
    wire [2:0] _2141;
    wire [2:0] _1910;
    wire _1906;
    wire _1907;
    wire _1904;
    wire _1908;
    wire [2:0] _1911;
    wire _1901;
    wire _1902;
    wire _1899;
    wire _1898;
    wire _1900;
    wire _1903;
    wire [2:0] _1913;
    wire _1894;
    wire [2:0] _1914;
    wire [2:0] _52;
    reg [2:0] _1897;
    wire _2136;
    wire [2:0] _2138;
    wire [2:0] _2142;
    wire [2:0] _1931;
    wire _1927;
    wire _1928;
    wire _1925;
    wire _1929;
    wire [2:0] _1932;
    wire _1922;
    wire _1923;
    wire _1920;
    wire _1919;
    wire _1921;
    wire _1924;
    wire [2:0] _1934;
    wire _1915;
    wire [2:0] _1935;
    wire [2:0] _53;
    reg [2:0] _1918;
    wire _2132;
    wire [2:0] _2134;
    wire [2:0] _1952;
    wire _1948;
    wire _1949;
    wire _1946;
    wire _1950;
    wire [2:0] _1953;
    wire _1943;
    wire _1944;
    wire _1941;
    wire _1940;
    wire _1942;
    wire _1945;
    wire [2:0] _1955;
    wire _1936;
    wire [2:0] _1956;
    wire [2:0] _54;
    reg [2:0] _1939;
    wire _2129;
    wire [2:0] _2131;
    wire [2:0] _2135;
    wire [2:0] _2143;
    wire [2:0] _1973;
    wire _1969;
    wire _1970;
    wire _1967;
    wire _1971;
    wire [2:0] _1974;
    wire _1964;
    wire _1965;
    wire _1962;
    wire _1961;
    wire _1963;
    wire _1966;
    wire [2:0] _1976;
    wire _1957;
    wire [2:0] _1977;
    wire [2:0] _55;
    reg [2:0] _1960;
    wire _2124;
    wire [2:0] _2126;
    wire [2:0] _1994;
    wire _1990;
    wire _1991;
    wire _1988;
    wire _1992;
    wire [2:0] _1995;
    wire _1985;
    wire _1986;
    wire _1983;
    wire _1982;
    wire _1984;
    wire _1987;
    wire [2:0] _1997;
    wire _1978;
    wire [2:0] _1998;
    wire [2:0] _56;
    reg [2:0] _1981;
    wire _2121;
    wire [2:0] _2123;
    wire [2:0] _2127;
    wire [2:0] _2015;
    wire _2011;
    wire _2012;
    wire _2009;
    wire _2013;
    wire [2:0] _2016;
    wire _2006;
    wire _2007;
    wire _2004;
    wire _2003;
    wire _2005;
    wire _2008;
    wire [2:0] _2018;
    wire _1999;
    wire [2:0] _2019;
    wire [2:0] _57;
    reg [2:0] _2002;
    wire _2117;
    wire [2:0] _2119;
    wire [2:0] _2036;
    wire _2032;
    wire _2033;
    wire _2030;
    wire _2034;
    wire [2:0] _2037;
    wire _2027;
    wire _2028;
    wire _2025;
    wire _2024;
    wire _2026;
    wire _2029;
    wire [2:0] _2039;
    wire _2020;
    wire [2:0] _2040;
    wire [2:0] _58;
    reg [2:0] _2023;
    wire _2114;
    wire [2:0] _2116;
    wire [2:0] _2120;
    wire [2:0] _2128;
    wire [2:0] _2144;
    wire _2109;
    wire _2108;
    wire _2110;
    wire _2106;
    wire _2105;
    wire _2107;
    wire _2111;
    wire _2102;
    wire _2101;
    wire _2103;
    wire _2099;
    wire _2098;
    wire _2100;
    wire _2104;
    wire _2112;
    wire [2:0] _2145;
    wire _2087;
    wire _2086;
    wire _2088;
    wire [2:0] _2090;
    wire _2082;
    wire _2081;
    wire _2083;
    wire [2:0] _2085;
    wire _2091;
    wire [2:0] _2092;
    wire _2075;
    wire _2074;
    wire _2076;
    wire [2:0] _2078;
    wire _2070;
    wire _2069;
    wire _2071;
    wire [2:0] _2073;
    wire _2079;
    wire [2:0] _2080;
    wire _2093;
    wire [2:0] _2094;
    wire _2061;
    wire _2060;
    wire _2062;
    wire [2:0] _2064;
    wire _2056;
    wire _2055;
    wire _2057;
    wire [2:0] _2059;
    wire _2065;
    wire [2:0] _2066;
    wire _2049;
    wire _2048;
    wire _2050;
    wire [2:0] _2052;
    wire _2044;
    wire _2043;
    wire _2045;
    wire [2:0] _2047;
    wire _2053;
    wire [2:0] _2054;
    wire _2067;
    wire [2:0] _2068;
    wire _2095;
    wire [2:0] _2096;
    wire [2:0] _2097;
    wire [2:0] _2146;
    wire [2:0] _2041;
    wire _2147;
    wire [28:0] _2149;
    wire [31:0] _2151;
    wire [47:0] _2155;
    wire [47:0] _59;
    reg [47:0] _2179;
    wire [2:0] _2172;
    wire [3:0] _1742;
    wire [3:0] _2161;
    wire [3:0] _2162;
    wire [3:0] _2160;
    wire [3:0] _2163;
    wire [3:0] _1534;
    wire _1535;
    wire _1852;
    wire _60;
    wire _1853;
    wire _2158;
    wire [3:0] _2164;
    reg [3:0] _2167;
    wire [3:0] _61;
    wire _1743;
    wire _2156;
    wire _63;
    wire _2157;
    wire [2:0] _2173;
    wire [2:0] _64;
    reg [2:0] _2170;
    reg [47:0] _2222;
    wire _2326;
    wire _2327;
    reg [7:0] _2328;
    wire _2320;
    wire _2321;
    reg [7:0] _2322;
    wire _2314;
    wire _2315;
    reg [7:0] _2316;
    wire _2308;
    wire _2309;
    reg [7:0] _2310;
    wire _2302;
    wire _2303;
    reg [7:0] _2304;
    wire _2296;
    wire _2297;
    reg [7:0] _2298;
    wire _2290;
    wire _2291;
    reg [7:0] _2292;
    wire [2:0] _2229;
    wire [2:0] _2230;
    wire [2:0] _67;
    reg [2:0] _2227;
    wire _2284;
    wire _2285;
    wire [7:0] _2270;
    wire [7:0] _2271;
    wire [7:0] _2248;
    wire [7:0] _2246;
    wire [7:0] _2249;
    wire [7:0] _68;
    reg [7:0] _2235;
    wire [7:0] _2244;
    wire [7:0] _2245;
    wire [7:0] _2260;
    wire [7:0] _2257;
    wire [7:0] _2255;
    wire [7:0] _2258;
    wire [7:0] _69;
    reg [7:0] _2254;
    wire [7:0] _2259;
    wire [7:0] _2261;
    wire [7:0] _2272;
    wire [7:0] _70;
    reg [7:0] _2286;
    wire [2:0] _2279;
    wire [2:0] _2280;
    wire [2:0] _71;
    reg [2:0] _2277;
    reg [7:0] _2329;
    wire [31:0] _2332;
    wire [31:0] _2333;
    wire [31:0] _75;
    reg [31:0] ts_reg;
    wire [1:0] _2335;
    wire [1:0] _2152;
    wire [1:0] _2154;
    reg [1:0] _2336;
    reg _2339;
    reg [1:0] _2342;
    reg _2345;
    wire _2346;
    wire _2347;
    wire _2348;
    wire [7:0] _2489;
    wire [7:0] _2490;
    wire [7:0] _2370;
    wire [7:0] _2368;
    wire [7:0] _2367;
    wire [7:0] _2366;
    wire [7:0] _2365;
    reg [7:0] _2369;
    wire [7:0] _2371;
    wire [7:0] _2372;
    wire [7:0] _2363;
    wire [7:0] _2364;
    wire [7:0] _2373;
    wire [7:0] _2407;
    wire [7:0] _2408;
    wire [7:0] _2410;
    wire [7:0] _2412;
    wire [7:0] _85;
    reg [7:0] _2355;
    wire [7:0] _2491;
    wire [7:0] _88;
    wire [7:0] _3820;
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
    wire _2471;
    wire [2:0] _2470;
    reg _2478;
    wire _2468;
    wire _2467;
    wire _2465;
    wire _2466;
    wire _2464;
    wire _2463;
    wire _2462;
    wire [2:0] _2461;
    reg _2469;
    wire _2459;
    wire _2458;
    wire _2456;
    wire _2457;
    wire _2455;
    wire _2454;
    wire _2453;
    wire [2:0] _2452;
    reg _2460;
    wire _2450;
    wire _2449;
    wire _2447;
    wire _2448;
    wire _2446;
    wire _2445;
    wire _2444;
    wire [2:0] _2443;
    reg _2451;
    wire _2441;
    wire _2440;
    wire _2438;
    wire _2439;
    wire _2437;
    wire _2436;
    wire _2435;
    wire [2:0] _2434;
    reg _2442;
    wire _2432;
    wire _2431;
    wire _2429;
    wire _2430;
    wire _2428;
    wire _2427;
    wire _2426;
    wire [2:0] _2425;
    reg _2433;
    wire _2423;
    wire _2422;
    wire _2420;
    wire _2421;
    wire _2419;
    wire _2418;
    wire [2:0] _3812;
    wire _3809;
    wire [1:0] _3810;
    wire [3:0] _3811;
    wire [6:0] _3813;
    wire [7:0] _3814;
    wire [7:0] _3815;
    wire _2404;
    wire _2403;
    wire _2402;
    wire _2400;
    wire _2401;
    wire _2398;
    wire _2399;
    wire _2395;
    wire _2396;
    wire _2397;
    wire _2392;
    wire _2393;
    wire _2394;
    wire _2389;
    wire _2388;
    wire _2390;
    wire _2387;
    wire _2391;
    wire [7:0] _2405;
    wire _2374;
    wire _2380;
    wire [7:0] _2406;
    wire [7:0] _3807;
    wire [7:0] _3803;
    wire [7:0] _3801;
    wire [7:0] _3800;
    wire [7:0] _3799;
    wire [7:0] _3798;
    reg [7:0] _3802;
    wire [7:0] _3804;
    wire [7:0] _3805;
    wire [7:0] _2361;
    wire [7:0] _2359;
    wire [7:0] _2358;
    wire [7:0] _2357;
    wire [7:0] _2356;
    reg [7:0] _2360;
    wire [7:0] _2362;
    wire [7:0] _3796;
    wire [7:0] _3797;
    wire [7:0] _3806;
    wire [7:0] _3808;
    wire [7:0] _3816;
    wire _2350;
    wire _2351;
    wire _1655;
    wire [1:0] _3790;
    wire [1:0] _3786;
    wire [1:0] _1728;
    wire _3777;
    wire [1:0] _3779;
    wire _3776;
    wire [1:0] _3781;
    wire _3775;
    wire [1:0] _3783;
    wire [1:0] _3784;
    wire [7:0] _1502;
    wire _1504;
    wire _1495;
    wire [15:0] _1490;
    wire _1491;
    wire _1492;
    wire _1489;
    wire _1493;
    wire _1496;
    wire [3:0] _1486;
    wire _1488;
    wire _1497;
    wire _1484;
    wire _1480;
    wire _1481;
    wire _1478;
    wire _1482;
    wire _1485;
    wire _1476;
    reg [2:0] _1470;
    wire [15:0] _1471;
    wire _1472;
    wire _1466;
    wire _1473;
    wire _1464;
    wire _1474;
    wire _1477;
    wire [1:0] _1463;
    reg _1498;
    wire _1462;
    wire _1499;
    wire _1459;
    wire [3:0] _1457;
    reg _1458;
    wire _1460;
    wire [15:0] _1452;
    wire _1454;
    wire [16:0] _1447;
    wire [15:0] _1443;
    wire [16:0] _1444;
    wire [16:0] _1445;
    reg [16:0] _1448;
    wire _1449;
    wire _1450;
    wire [15:0] _1439;
    wire _1441;
    wire _1423;
    wire [2:0] _1425;
    wire _1420;
    wire [2:0] _1422;
    wire _1426;
    wire [2:0] _1427;
    wire _1415;
    wire [2:0] _1417;
    wire _1412;
    wire [2:0] _1414;
    wire _1418;
    wire [2:0] _1419;
    wire _1428;
    wire [2:0] _1429;
    wire _1405;
    wire [2:0] _1407;
    wire _1402;
    wire [2:0] _1404;
    wire _1408;
    wire [2:0] _1409;
    wire _1397;
    wire [2:0] _1399;
    wire [7:0] _1393;
    wire _1394;
    wire [2:0] _1396;
    wire _1400;
    wire [2:0] _1401;
    wire _1410;
    wire [2:0] _1411;
    wire _1430;
    wire [2:0] _1431;
    wire [13:0] _1392;
    wire [16:0] _1432;
    wire [111:0] _1389;
    wire [15:0] _1390;
    wire [16:0] _1391;
    wire [16:0] _1433;
    reg [16:0] _1436;
    wire [16:0] _1388;
    wire _1437;
    wire _1438;
    wire _1442;
    wire _1451;
    wire [1:0] _1384;
    reg [15:0] _1385;
    wire _1387;
    wire _1455;
    wire [7:0] _1378;
    wire _1380;
    wire _1381;
    wire _1377;
    wire _1382;
    wire [7:0] _1371;
    wire [7:0] _1369;
    wire [7:0] _1370;
    wire [7:0] _1372;
    wire _1374;
    wire _1375;
    wire _1383;
    wire _1456;
    wire _1461;
    wire _1500;
    wire _1501;
    wire _1505;
    wire f_fire3;
    wire [7:0] _1053;
    wire _1055;
    wire _1041;
    wire _1037;
    wire _1038;
    wire _1035;
    wire _1039;
    wire _1042;
    wire [3:0] _1032;
    wire _1034;
    wire _1043;
    wire _1030;
    wire _1026;
    wire _1027;
    wire _1024;
    wire _1028;
    wire _1031;
    wire _1022;
    reg [2:0] _1016;
    wire [15:0] _1017;
    wire _1018;
    wire _1012;
    wire _1019;
    wire _1010;
    wire _1020;
    wire _1023;
    wire [1:0] _1009;
    reg _1044;
    wire _1008;
    wire _1045;
    wire _1000;
    wire [3:0] _974;
    reg _999;
    wire _1001;
    wire [15:0] _969;
    wire _971;
    wire [15:0] _960;
    wire [16:0] _961;
    wire [16:0] _962;
    reg [16:0] _965;
    wire _966;
    wire _967;
    wire [15:0] _956;
    wire _958;
    wire _922;
    wire [2:0] _942;
    wire _901;
    wire [2:0] _921;
    wire _943;
    wire [2:0] _944;
    wire _878;
    wire [2:0] _898;
    wire _857;
    wire [2:0] _877;
    wire _899;
    wire [2:0] _900;
    wire _945;
    wire [2:0] _946;
    wire _832;
    wire [2:0] _852;
    wire _811;
    wire [2:0] _831;
    wire _853;
    wire [2:0] _854;
    wire _788;
    wire [2:0] _808;
    wire [7:0] _766;
    wire _767;
    wire [2:0] _787;
    wire _809;
    wire [2:0] _810;
    wire _855;
    wire [2:0] _856;
    wire _947;
    wire [2:0] _948;
    wire [16:0] _949;
    wire [111:0] _762;
    wire [15:0] _763;
    wire [16:0] _764;
    wire [16:0] _950;
    reg [16:0] _953;
    wire [16:0] _739;
    wire _954;
    wire _955;
    wire _959;
    wire _968;
    wire [1:0] _726;
    reg [15:0] _736;
    wire _738;
    wire _972;
    wire [7:0] _720;
    wire _722;
    wire _723;
    wire _714;
    wire _724;
    wire [7:0] _707;
    wire [7:0] _705;
    wire [7:0] _706;
    wire [7:0] _708;
    wire _710;
    wire [127:0] _691;
    wire [2:0] _3760;
    wire [2:0] _3756;
    wire _3751;
    wire [2:0] _3753;
    wire [7:0] _1719;
    wire _1721;
    wire _1722;
    wire _1717;
    wire _1718;
    wire f_unexp_now;
    wire _2495;
    wire _2496;
    wire _2498;
    wire _2499;
    wire _2494;
    wire _2492;
    wire _2500;
    wire _89;
    reg _1714;
    wire _1715;
    wire [15:0] _3742;
    wire [15:0] _3743;
    wire _3739;
    wire _3740;
    wire _3741;
    wire [15:0] _3744;
    wire [2:0] _3684;
    wire [2:0] _3682;
    wire [2:0] _3681;
    wire [2:0] _3680;
    wire [2:0] _3679;
    wire [7:0] _1363;
    wire _1365;
    wire _1356;
    wire _1352;
    wire _1353;
    wire _1350;
    wire _1354;
    wire _1357;
    wire [3:0] _1347;
    wire _1349;
    wire _1358;
    wire _1345;
    wire _1341;
    wire _1342;
    wire _1339;
    wire _1343;
    wire _1346;
    wire _1337;
    reg [2:0] _1331;
    wire [15:0] _1332;
    wire _1333;
    wire _1327;
    wire _1334;
    wire _1325;
    wire _1335;
    wire _1338;
    wire [1:0] _1324;
    reg _1359;
    wire _1323;
    wire _1360;
    wire _1320;
    wire [3:0] _1318;
    reg _1319;
    wire _1321;
    wire [15:0] _1313;
    wire _1315;
    wire [15:0] _1304;
    wire [16:0] _1305;
    wire [16:0] _1306;
    reg [16:0] _1309;
    wire _1310;
    wire _1311;
    wire [15:0] _1300;
    wire _1302;
    wire _1284;
    wire [2:0] _1286;
    wire _1281;
    wire [2:0] _1283;
    wire _1287;
    wire [2:0] _1288;
    wire _1276;
    wire [2:0] _1278;
    wire _1273;
    wire [2:0] _1275;
    wire _1279;
    wire [2:0] _1280;
    wire _1289;
    wire [2:0] _1290;
    wire _1266;
    wire [2:0] _1268;
    wire _1263;
    wire [2:0] _1265;
    wire _1269;
    wire [2:0] _1270;
    wire _1258;
    wire [2:0] _1260;
    wire [7:0] _1254;
    wire _1255;
    wire [2:0] _1257;
    wire _1261;
    wire [2:0] _1262;
    wire _1271;
    wire [2:0] _1272;
    wire _1291;
    wire [2:0] _1292;
    wire [16:0] _1293;
    wire [111:0] _1250;
    wire [15:0] _1251;
    wire [16:0] _1252;
    wire [16:0] _1294;
    reg [16:0] _1297;
    wire [16:0] _1249;
    wire _1298;
    wire _1299;
    wire _1303;
    wire _1312;
    wire [1:0] _1245;
    reg [15:0] _1246;
    wire _1248;
    wire _1316;
    wire [7:0] _1239;
    wire _1241;
    wire _1242;
    wire _1238;
    wire _1243;
    wire [7:0] _1232;
    wire [7:0] _1230;
    wire [7:0] _1231;
    wire [7:0] _1233;
    wire _1235;
    wire _1236;
    wire _1244;
    wire _1317;
    wire _1322;
    wire _1361;
    wire _1362;
    wire _1366;
    wire f_fire2;
    wire [1:0] _1515;
    wire _1088;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _1078;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _1072;
    wire [7:0] _1066;
    wire [7:0] f_chgmask0;
    wire [7:0] _1060;
    wire [7:0] f_watch;
    wire [7:0] _1061;
    wire [7:0] _1067;
    wire [7:0] _1073;
    wire [7:0] f_relevant;
    wire [7:0] _1080;
    wire _1082;
    wire _1083;
    wire f_amb_now;
    wire _1085;
    wire _1089;
    wire [7:0] _1051;
    wire [7:0] _2505;
    wire [7:0] _2506;
    wire _2502;
    wire [7:0] _2504;
    wire _2501;
    wire [7:0] _2507;
    wire [7:0] _2509;
    wire [7:0] _90;
    reg [7:0] _1050;
    wire [7:0] f_multi_eff;
    wire [7:0] _1224;
    wire _1226;
    wire _1217;
    wire _1213;
    wire _1214;
    wire _1211;
    wire _1215;
    wire _1218;
    wire [3:0] _1208;
    wire _1210;
    wire _1219;
    wire _1206;
    wire _1202;
    wire _1203;
    wire _1200;
    wire _1204;
    wire _1207;
    wire _1198;
    reg [2:0] _1192;
    wire [15:0] _1193;
    wire _1194;
    wire _1188;
    wire _1195;
    wire _1186;
    wire _1196;
    wire _1199;
    wire [1:0] _1185;
    reg _1220;
    wire [1:0] _92;
    wire [1:0] _2510;
    wire [1:0] _93;
    reg [1:0] _1005;
    wire _1007;
    wire _1184;
    wire _1221;
    wire _1181;
    wire _2514;
    wire _2512;
    wire _2515;
    wire _2517;
    wire _2519;
    wire _94;
    reg _618;
    wire [15:0] _96;
    wire [15:0] _98;
    wire [15:0] _2525;
    wire [15:0] _2526;
    wire [15:0] _2527;
    wire [15:0] _2529;
    wire [15:0] _99;
    reg [15:0] _2522;
    wire [14:0] _2523;
    wire [15:0] _2524;
    wire [15:0] _2530;
    wire [15:0] _2531;
    wire _2533;
    wire _2535;
    wire _2536;
    wire _2537;
    wire _2538;
    wire _2540;
    wire _2542;
    wire _100;
    reg _615;
    wire _2555;
    wire _2556;
    wire _2558;
    wire _2559;
    wire _2560;
    wire _2561;
    wire _2563;
    wire _101;
    reg _2545;
    wire _2557;
    wire _2566;
    wire [5:0] _2564;
    wire _2565;
    wire _2567;
    wire _2568;
    wire _2569;
    wire _2570;
    wire _2571;
    wire _2573;
    wire _2575;
    wire _102;
    reg _612;
    wire _2579;
    wire _2577;
    wire _2580;
    wire _2582;
    wire _2584;
    wire _103;
    reg _630;
    wire [15:0] _105;
    wire [15:0] _107;
    wire [15:0] _2590;
    wire [15:0] _2591;
    wire [15:0] _2592;
    wire [15:0] _2594;
    wire [15:0] _108;
    reg [15:0] _2587;
    wire [14:0] _2588;
    wire [15:0] _2589;
    wire [15:0] _2595;
    wire [15:0] _2596;
    wire _2598;
    wire _2600;
    wire _2601;
    wire _2602;
    wire _2603;
    wire _2605;
    wire _2607;
    wire _109;
    reg _627;
    wire _2620;
    wire _2621;
    wire _2623;
    wire _2624;
    wire _2625;
    wire _2626;
    wire _2628;
    wire _110;
    reg _2610;
    wire _2622;
    wire _2631;
    wire _2630;
    wire _2632;
    wire _2633;
    wire _2634;
    wire _2635;
    wire _2636;
    wire _2638;
    wire _2640;
    wire _111;
    reg _624;
    wire [7:0] _113;
    wire [6:0] _997;
    wire [6:0] _996;
    wire _998;
    wire [15:0] _993;
    wire _2645;
    wire _2644;
    wire _2646;
    wire _2643;
    wire _2647;
    wire _2642;
    wire _2648;
    wire [14:0] _2641;
    wire [15:0] _2649;
    wire [15:0] _114;
    reg [15:0] _994;
    wire _995;
    wire [3:0] _2668;
    wire [3:0] _2666;
    wire [3:0] _2669;
    wire _1740;
    wire _2273;
    wire _116;
    wire _2274;
    wire _2223;
    wire _2256;
    wire _2653;
    wire _2250;
    wire _2251;
    wire _2651;
    wire _1666;
    wire _1667;
    wire _1673;
    wire _1670;
    wire _1671;
    wire _1669;
    wire _1672;
    wire _1674;
    wire _2654;
    wire _117;
    reg _1653;
    wire _2662;
    wire _2247;
    wire _2658;
    wire _2231;
    wire _2232;
    wire _2656;
    wire _1593;
    wire [2:0] _1587;
    wire _1582;
    wire _1581;
    wire _1583;
    wire _1584;
    wire _1585;
    wire [2:0] _1588;
    wire _1590;
    wire _1591;
    wire _1562;
    wire _1592;
    wire _1594;
    wire _1558;
    wire _1559;
    wire _1595;
    wire _1647;
    wire _1646;
    wire _1648;
    wire _2659;
    wire _118;
    reg _1546;
    wire _2660;
    wire _1643;
    wire [2:0] _1637;
    wire _1632;
    wire _1631;
    wire _1633;
    wire _1634;
    wire _1635;
    wire [2:0] _1638;
    wire _1640;
    wire _1641;
    wire _1612;
    wire _1642;
    wire _1644;
    wire _1608;
    wire _1609;
    wire _1645;
    wire _2661;
    wire _2663;
    wire _119;
    wire _2224;
    wire _2664;
    wire [3:0] _2670;
    reg [3:0] _2673;
    wire [3:0] _120;
    wire _991;
    wire [6:0] _2690;
    wire [7:0] _2691;
    wire [6:0] _2688;
    wire _2686;
    wire _2685;
    wire _2684;
    wire _2683;
    wire _2682;
    wire _2681;
    wire _2680;
    wire _2679;
    wire [2:0] _2677;
    wire [2:0] _2676;
    wire [2:0] _2675;
    wire [2:0] _2674;
    reg [2:0] _2678;
    reg _2687;
    wire [7:0] _2689;
    wire [1:0] _1661;
    wire [1:0] _1660;
    wire [1:0] _1659;
    wire [1:0] _1658;
    reg [1:0] _1662;
    wire [1:0] _1664;
    reg [7:0] _2692;
    wire [7:0] _2693;
    wire [7:0] _121;
    reg [7:0] _986;
    wire _987;
    wire [6:0] _3463;
    wire [7:0] _3464;
    wire _3461;
    wire _3460;
    wire _3459;
    wire _3458;
    wire _3457;
    wire _3456;
    wire _3455;
    wire _3454;
    wire [7:0] _3462;
    wire [3:0] _3446;
    wire [3:0] _3444;
    wire [3:0] _3447;
    wire _3117;
    wire _3438;
    wire _1563;
    wire _3072;
    wire _3073;
    wire [1:0] _3076;
    wire _3065;
    wire _3066;
    wire _3067;
    wire _3068;
    wire [1:0] _3070;
    wire [2:0] _3051;
    wire [2:0] _3048;
    wire _3044;
    wire _3042;
    wire _3043;
    wire _3045;
    wire [2:0] _3049;
    wire _3040;
    wire [2:0] _3052;
    wire _3053;
    wire [2:0] _3034;
    wire _3030;
    wire _3028;
    wire _3029;
    wire _3031;
    wire [2:0] _3035;
    wire _3026;
    wire [2:0] _3037;
    wire _3038;
    wire _3054;
    wire _3055;
    wire _3056;
    wire _3022;
    wire [5:0] _3019;
    wire _3020;
    wire _3023;
    wire [15:0] _3015;
    wire _3016;
    wire _3013;
    wire _3017;
    wire _3011;
    wire _3012;
    wire _3018;
    wire _3024;
    wire _3057;
    wire [1:0] _3059;
    wire [1:0] _3061;
    wire [1:0] _3007;
    wire _3003;
    wire [1:0] _3005;
    wire [1:0] _3008;
    wire _2783;
    wire _2784;
    wire _122;
    reg _2696;
    wire _2933;
    wire _2931;
    wire _2932;
    reg _2934;
    wire [2:0] _124;
    wire [2:0] _2915;
    wire [2:0] _2916;
    wire [2:0] _2911;
    wire _2907;
    wire _2905;
    wire _2906;
    wire _2908;
    wire [2:0] _2912;
    wire _2903;
    wire [2:0] _2917;
    wire [2:0] _2918;
    wire [2:0] _2897;
    wire [2:0] _2898;
    wire [2:0] _2893;
    wire _2779;
    wire _2778;
    wire _2777;
    wire _2776;
    wire _2775;
    wire _2774;
    wire _2773;
    wire _2769;
    wire _2768;
    wire _2767;
    wire _2766;
    wire _2765;
    wire _2764;
    wire _2763;
    wire [7:0] _2760;
    wire [6:0] _2241;
    wire [7:0] _2242;
    wire [6:0] _2239;
    wire [7:0] _2240;
    wire [7:0] _2243;
    wire [7:0] _2789;
    wire [7:0] _2790;
    wire [7:0] _2791;
    wire [7:0] _2785;
    wire [7:0] _2786;
    wire [7:0] _2787;
    wire [7:0] _2788;
    wire [7:0] _2792;
    wire [7:0] _125;
    reg [7:0] _2238;
    wire _2700;
    wire _2697;
    wire _2698;
    wire _2701;
    wire [7:0] _2761;
    wire _2762;
    wire [7:0] _2770;
    wire _127;
    wire [7:0] _2771;
    wire _2772;
    wire [2:0] _2800;
    wire [2:0] _2801;
    wire [2:0] _2802;
    wire [2:0] _2803;
    wire [2:0] _2794;
    wire [2:0] _2795;
    wire [2:0] _2796;
    wire [2:0] _2797;
    wire [2:0] _2798;
    wire [2:0] _2804;
    wire [2:0] _2806;
    wire [2:0] _128;
    reg [2:0] _1556;
    reg _2780;
    wire _130;
    wire [31:0] _132;
    wire [30:0] _2848;
    wire [31:0] _2850;
    wire _2842;
    wire _2843;
    wire [31:0] _2845;
    wire [30:0] _2839;
    wire [31:0] _2841;
    wire [31:0] _2846;
    wire [31:0] _2847;
    wire [5:0] _134;
    wire [5:0] _2816;
    wire [5:0] _2817;
    wire [5:0] _2818;
    wire [5:0] _2819;
    wire [5:0] _2810;
    wire [5:0] _2811;
    wire [5:0] _2812;
    wire [5:0] _2813;
    wire [5:0] _2814;
    wire [5:0] _2820;
    wire [5:0] _2821;
    wire [5:0] _2823;
    wire [5:0] _135;
    reg [5:0] _1576;
    wire _1578;
    wire _1579;
    wire _2547;
    wire _2546;
    wire _2548;
    wire _2549;
    wire [31:0] _2851;
    wire [31:0] _2852;
    wire [31:0] _2853;
    wire [31:0] _137;
    wire _2830;
    wire _2831;
    wire [31:0] _2833;
    wire [30:0] _2827;
    wire [31:0] _2829;
    wire [31:0] _2834;
    wire [30:0] _2824;
    wire [31:0] _2826;
    wire [31:0] _2835;
    wire [31:0] _2836;
    wire [31:0] _2837;
    wire [31:0] _2838;
    wire [31:0] _2854;
    wire [31:0] _2855;
    wire [31:0] _2857;
    wire [31:0] _138;
    reg [31:0] _2552;
    wire _2553;
    wire _2554;
    wire [15:0] _140;
    wire [15:0] _2877;
    wire _1548;
    wire _1553;
    wire [15:0] _2878;
    wire _1547;
    wire [15:0] _2879;
    wire _2860;
    wire _2858;
    wire _2859;
    wire _2861;
    wire _2863;
    wire _141;
    reg _595;
    wire _596;
    wire _593;
    wire _597;
    wire _2865;
    wire _2866;
    wire _2867;
    wire _2869;
    wire _142;
    reg _589;
    wire _590;
    wire _587;
    wire _591;
    wire _598;
    wire _599;
    wire _600;
    wire [15:0] _2880;
    wire [15:0] _2871;
    wire [15:0] _2872;
    wire [15:0] _2873;
    wire [15:0] _2874;
    wire [15:0] _2875;
    wire [15:0] _2881;
    wire [15:0] _2883;
    wire [15:0] _143;
    reg [15:0] _1551;
    wire _1552;
    wire _2781;
    wire _2782;
    wire _2889;
    wire _2887;
    wire _2888;
    wire _2890;
    wire [2:0] _2894;
    wire _2885;
    wire [2:0] _2899;
    wire [2:0] _2900;
    wire [2:0] _2901;
    wire [2:0] _2919;
    wire [2:0] _2921;
    wire [2:0] _144;
    reg [2:0] _583;
    wire _584;
    wire [1:0] _146;
    wire _579;
    wire _580;
    wire _585;
    wire _1573;
    wire _1580;
    wire _2935;
    wire _2936;
    wire _1568;
    wire _1566;
    wire _1569;
    wire _1570;
    wire _1571;
    wire _2928;
    wire _2925;
    wire _2922;
    wire _2923;
    wire _2926;
    wire _2927;
    wire _2929;
    wire _2937;
    wire _2939;
    wire _2941;
    wire _2943;
    wire _2945;
    wire _147;
    reg _567;
    wire _568;
    wire _569;
    wire _562;
    wire _563;
    wire _559;
    wire _149;
    wire _556;
    wire _557;
    wire _558;
    wire _560;
    wire _564;
    wire _565;
    wire _570;
    wire [1:0] _3010;
    wire _551;
    wire _552;
    wire _547;
    wire _546;
    wire _545;
    wire _544;
    wire _543;
    wire _542;
    wire _541;
    wire _540;
    reg _548;
    wire _549;
    wire _538;
    wire _537;
    wire _536;
    wire _535;
    wire _534;
    wire _533;
    wire _532;
    wire _531;
    wire [2:0] _151;
    reg _539;
    wire _550;
    wire _153;
    wire _553;
    wire _529;
    wire _526;
    wire _519;
    wire _517;
    wire [13:0] _508;
    wire [15:0] _509;
    wire [14:0] _505;
    wire [15:0] _506;
    wire [15:0] _510;
    wire [14:0] _502;
    wire [15:0] _503;
    wire _500;
    wire [15:0] _511;
    reg [15:0] _514;
    wire _515;
    wire [13:0] _492;
    wire [15:0] _493;
    reg [15:0] _496;
    wire _2991;
    wire _2992;
    wire [15:0] _2993;
    wire [15:0] _2995;
    wire [15:0] _2997;
    wire _2975;
    wire [14:0] _521;
    wire [15:0] _522;
    reg [15:0] _525;
    wire [16:0] _2971;
    wire _2972;
    wire [16:0] _2965;
    reg [16:0] _2968;
    wire [16:0] _2960;
    wire [15:0] _155;
    wire [16:0] _2959;
    wire [16:0] _2961;
    reg [16:0] _2964;
    wire [7:0] _157;
    wire [8:0] _2979;
    wire [7:0] _2981;
    wire [7:0] _2982;
    wire [7:0] _2983;
    wire [7:0] _2985;
    wire [7:0] _158;
    reg [7:0] _2953;
    wire [8:0] _2978;
    wire [8:0] _2980;
    wire _2986;
    wire _2987;
    wire _2988;
    wire _2990;
    wire _159;
    reg _2958;
    wire [16:0] _2969;
    wire [16:0] _2955;
    wire _2970;
    wire _2973;
    wire _2976;
    wire _2954;
    wire _2977;
    wire [15:0] _2999;
    wire _2949;
    wire _2947;
    wire _609;
    wire _2946;
    wire _2948;
    wire _2950;
    wire [15:0] _3000;
    wire [15:0] _3002;
    wire [15:0] _160;
    reg [15:0] _490;
    wire _497;
    wire _498;
    wire _487;
    wire _499;
    wire _516;
    wire _518;
    wire _527;
    wire [1:0] _162;
    wire _483;
    wire _484;
    wire _481;
    wire _485;
    wire _478;
    wire _474;
    wire _473;
    wire _472;
    wire _471;
    wire _470;
    wire _469;
    wire _468;
    wire _467;
    reg _475;
    wire _465;
    wire _464;
    wire _463;
    wire _462;
    wire _461;
    wire _460;
    wire _459;
    wire _458;
    wire [2:0] _164;
    reg _466;
    wire _476;
    wire _477;
    wire _479;
    wire _486;
    wire _530;
    wire _166;
    wire _554;
    wire _168;
    wire _457;
    wire _555;
    wire [1:0] _3062;
    wire _1561;
    wire [1:0] _3064;
    wire _2808;
    wire [1:0] _3071;
    wire _451;
    wire [1:0] _3077;
    wire _448;
    wire _449;
    wire [1:0] _3079;
    wire [1:0] _169;
    reg [1:0] _454;
    wire _456;
    wire _1564;
    wire _1572;
    wire _3437;
    wire _3439;
    wire _3435;
    wire _1613;
    wire _3413;
    wire _3414;
    wire [1:0] _3417;
    wire _3406;
    wire _3407;
    wire _3408;
    wire _3409;
    wire [1:0] _3411;
    wire [2:0] _3392;
    wire [2:0] _3389;
    wire _3385;
    wire _3383;
    wire _3384;
    wire _3386;
    wire [2:0] _3390;
    wire _3381;
    wire [2:0] _3393;
    wire _3394;
    wire [2:0] _3375;
    wire _3371;
    wire _3369;
    wire _3370;
    wire _3372;
    wire [2:0] _3376;
    wire _3367;
    wire [2:0] _3378;
    wire _3379;
    wire _3395;
    wire _3396;
    wire _3397;
    wire _3363;
    wire _3361;
    wire _3364;
    wire [15:0] _3356;
    wire _3357;
    wire _3354;
    wire _3358;
    wire _3352;
    wire _3353;
    wire _3359;
    wire _3365;
    wire _3398;
    wire [1:0] _3400;
    wire [1:0] _3402;
    wire [1:0] _3348;
    wire _3344;
    wire [1:0] _3346;
    wire [1:0] _3349;
    wire _3112;
    wire _3113;
    wire _170;
    reg _3082;
    wire _3270;
    wire _3268;
    wire _3269;
    reg _3271;
    wire [2:0] _172;
    wire [2:0] _3252;
    wire [2:0] _3253;
    wire [2:0] _3248;
    wire _3244;
    wire _3242;
    wire _3243;
    wire _3245;
    wire [2:0] _3249;
    wire _3240;
    wire [2:0] _3254;
    wire [2:0] _3255;
    wire [2:0] _3234;
    wire [2:0] _3235;
    wire [2:0] _3230;
    wire _3108;
    wire _3107;
    wire _3106;
    wire _3105;
    wire _3104;
    wire _3103;
    wire _3102;
    wire _3098;
    wire _3097;
    wire _3096;
    wire _3095;
    wire _3094;
    wire _3093;
    wire _3092;
    wire _2755;
    wire _2756;
    reg [7:0] _2757;
    wire _2749;
    wire _2750;
    reg [7:0] _2751;
    wire _2743;
    wire _2744;
    reg [7:0] _2745;
    wire _2737;
    wire _2738;
    reg [7:0] _2739;
    wire _2731;
    wire _2732;
    reg [7:0] _2733;
    wire _2725;
    wire _2726;
    reg [7:0] _2727;
    wire _2719;
    wire _2720;
    reg [7:0] _2721;
    wire [2:0] _3115;
    wire [2:0] _3116;
    wire [2:0] _173;
    reg [2:0] _2711;
    wire _2713;
    wire _2714;
    wire [7:0] _175;
    reg [7:0] _2715;
    wire [2:0] _3120;
    wire [2:0] _3121;
    wire [2:0] _176;
    reg [2:0] _2704;
    reg [7:0] _2758;
    wire [7:0] _3089;
    wire [6:0] _2267;
    wire [7:0] _2268;
    wire [6:0] _2265;
    wire [7:0] _2266;
    wire [7:0] _2269;
    wire [7:0] _3126;
    wire [7:0] _3127;
    wire [7:0] _3128;
    wire [7:0] _3122;
    wire [7:0] _3123;
    wire [7:0] _3124;
    wire [7:0] _3125;
    wire [7:0] _3129;
    wire [7:0] _177;
    reg [7:0] _2264;
    wire _3086;
    wire _3083;
    wire _3084;
    wire _3087;
    wire [7:0] _3090;
    wire _3091;
    wire [7:0] _3099;
    wire _179;
    wire [7:0] _3100;
    wire _3101;
    wire [2:0] _3137;
    wire [2:0] _3138;
    wire [2:0] _3139;
    wire [2:0] _3140;
    wire [2:0] _3131;
    wire [2:0] _3132;
    wire [2:0] _3133;
    wire [2:0] _3134;
    wire [2:0] _3135;
    wire [2:0] _3141;
    wire [2:0] _3143;
    wire [2:0] _180;
    reg [2:0] _1606;
    reg _3109;
    wire _182;
    wire [31:0] _184;
    wire [30:0] _3185;
    wire [31:0] _3187;
    wire _3179;
    wire _3180;
    wire [31:0] _3182;
    wire [30:0] _3176;
    wire [31:0] _3178;
    wire [31:0] _3183;
    wire [31:0] _3184;
    wire [5:0] _186;
    wire [5:0] _3153;
    wire [5:0] _3154;
    wire [5:0] _3155;
    wire [5:0] _3156;
    wire [5:0] _3147;
    wire [5:0] _3148;
    wire [5:0] _3149;
    wire [5:0] _3150;
    wire [5:0] _3151;
    wire [5:0] _3157;
    wire [5:0] _3158;
    wire [5:0] _3160;
    wire [5:0] _187;
    reg [5:0] _1626;
    wire _1628;
    wire _1629;
    wire _2612;
    wire _2611;
    wire _2613;
    wire _2614;
    wire [31:0] _3188;
    wire [31:0] _3189;
    wire [31:0] _3190;
    wire [31:0] _189;
    wire _3167;
    wire _3168;
    wire [31:0] _3170;
    wire [30:0] _3164;
    wire [31:0] _3166;
    wire [31:0] _3171;
    wire [30:0] _3161;
    wire [31:0] _3163;
    wire [31:0] _3172;
    wire [31:0] _3173;
    wire [31:0] _3174;
    wire [31:0] _3175;
    wire [31:0] _3191;
    wire [31:0] _3192;
    wire [31:0] _3194;
    wire [31:0] _190;
    reg [31:0] _2617;
    wire _2618;
    wire _2619;
    wire [15:0] _192;
    wire [15:0] _3214;
    wire _1598;
    wire _1603;
    wire [15:0] _3215;
    wire _1597;
    wire [15:0] _3216;
    wire _3197;
    wire _3195;
    wire _3196;
    wire _3198;
    wire _3200;
    wire _193;
    reg _434;
    wire _435;
    wire _431;
    wire _436;
    wire _3202;
    wire _3203;
    wire _3204;
    wire _3206;
    wire _194;
    reg _427;
    wire _428;
    wire _425;
    wire _429;
    wire _437;
    wire _438;
    wire _439;
    wire [15:0] _3217;
    wire [15:0] _3208;
    wire [15:0] _3209;
    wire [15:0] _3210;
    wire [15:0] _3211;
    wire [15:0] _3212;
    wire [15:0] _3218;
    wire [15:0] _3220;
    wire [15:0] _195;
    reg [15:0] _1601;
    wire _1602;
    wire _3110;
    wire _3111;
    wire _3226;
    wire _3224;
    wire _3225;
    wire _3227;
    wire [2:0] _3231;
    wire _3222;
    wire [2:0] _3236;
    wire [2:0] _3237;
    wire [2:0] _3238;
    wire [2:0] _3256;
    wire [2:0] _3258;
    wire [2:0] _196;
    reg [2:0] _421;
    wire _422;
    wire [1:0] _198;
    wire _417;
    wire _418;
    wire _423;
    wire _1623;
    wire _1630;
    wire _3272;
    wire _3273;
    wire _1618;
    wire _1616;
    wire _1619;
    wire _1620;
    wire _1621;
    wire _3265;
    wire _3262;
    wire _3259;
    wire _3260;
    wire _3263;
    wire _3264;
    wire _3266;
    wire _3274;
    wire _3276;
    wire _3278;
    wire _3280;
    wire _3282;
    wire _199;
    reg _405;
    wire _406;
    wire _407;
    wire _400;
    wire _401;
    wire _397;
    wire _201;
    wire _394;
    wire _395;
    wire _396;
    wire _398;
    wire _402;
    wire _403;
    wire _408;
    wire [1:0] _3351;
    wire _389;
    wire _390;
    wire _385;
    wire _384;
    wire _383;
    wire _382;
    wire _381;
    wire _380;
    wire _379;
    wire _378;
    reg _386;
    wire _387;
    wire _376;
    wire _375;
    wire _374;
    wire _373;
    wire _372;
    wire _371;
    wire _370;
    wire _369;
    wire [2:0] _203;
    reg _377;
    wire _388;
    wire _205;
    wire _391;
    wire _367;
    wire _364;
    wire _357;
    wire _355;
    wire [13:0] _346;
    wire [15:0] _347;
    wire [14:0] _343;
    wire [15:0] _344;
    wire [15:0] _348;
    wire [14:0] _340;
    wire [15:0] _341;
    wire _338;
    wire [15:0] _349;
    reg [15:0] _352;
    wire _353;
    wire [13:0] _330;
    wire [15:0] _331;
    reg [15:0] _334;
    wire _3328;
    wire _3329;
    wire [15:0] _3330;
    wire [15:0] _3332;
    wire [15:0] _3334;
    wire _3312;
    wire [14:0] _359;
    wire [15:0] _360;
    reg [15:0] _363;
    wire [16:0] _3308;
    wire _3309;
    wire [16:0] _3302;
    reg [16:0] _3305;
    wire [15:0] _207;
    wire [16:0] _3296;
    wire [16:0] _3298;
    reg [16:0] _3301;
    wire [7:0] _209;
    wire [8:0] _3316;
    wire [7:0] _3318;
    wire [7:0] _3319;
    wire [7:0] _3320;
    wire [7:0] _3322;
    wire [7:0] _210;
    reg [7:0] _3290;
    wire [8:0] _3315;
    wire [8:0] _3317;
    wire _3323;
    wire _3324;
    wire _3325;
    wire _3327;
    wire _211;
    reg _3295;
    wire [16:0] _3306;
    wire [16:0] _3292;
    wire _3307;
    wire _3310;
    wire _3313;
    wire _3291;
    wire _3314;
    wire [15:0] _3336;
    wire _3286;
    wire _3284;
    wire _621;
    wire _3283;
    wire _3285;
    wire _3287;
    wire [15:0] _3337;
    wire [15:0] _3339;
    wire [15:0] _212;
    reg [15:0] _328;
    wire _335;
    wire _336;
    wire _325;
    wire _337;
    wire _354;
    wire _356;
    wire _365;
    wire [1:0] _214;
    wire _321;
    wire _322;
    wire _319;
    wire _323;
    wire _316;
    wire _312;
    wire _311;
    wire _310;
    wire _309;
    wire _308;
    wire _307;
    wire _306;
    wire _305;
    reg _313;
    wire _300;
    wire _299;
    wire _298;
    wire _297;
    wire _296;
    wire _295;
    wire _294;
    wire _293;
    wire [2:0] _216;
    reg _301;
    wire _314;
    wire _315;
    wire _317;
    wire _324;
    wire _368;
    wire _218;
    wire _392;
    wire _220;
    wire _286;
    wire _393;
    wire [1:0] _3403;
    wire _1611;
    wire [1:0] _3405;
    wire _3145;
    wire [1:0] _3412;
    wire _279;
    wire [1:0] _3418;
    wire [2:0] _2385;
    wire [2:0] _2384;
    wire [2:0] _2383;
    wire [2:0] _2382;
    reg [2:0] _2386;
    wire _2378;
    wire _2377;
    wire _2376;
    wire _2375;
    reg _2379;
    wire _3340;
    wire _3341;
    wire [2:0] _3343;
    wire [2:0] _221;
    wire _276;
    wire _277;
    wire [1:0] _3420;
    wire [1:0] _222;
    reg [1:0] _283;
    wire _285;
    wire _1614;
    wire _1622;
    wire _3434;
    wire _3436;
    wire _3440;
    wire _3431;
    wire _3429;
    wire _3432;
    wire _3433;
    wire _3441;
    wire _223;
    wire _3118;
    wire _2331;
    wire _2707;
    wire _225;
    wire _2708;
    wire _3442;
    wire [3:0] _3448;
    reg [3:0] _3451;
    wire [3:0] _226;
    wire _989;
    wire [7:0] _3453;
    wire [1:0] _3426;
    wire [1:0] _3424;
    wire [1:0] _3423;
    wire [1:0] _3422;
    wire [1:0] _3421;
    reg [1:0] _3425;
    wire [1:0] _3427;
    reg [7:0] _3465;
    wire [7:0] _3466;
    wire [7:0] _227;
    reg [7:0] _982;
    wire _983;
    wire [7:0] _3477;
    wire [7:0] _3476;
    wire [7:0] _3474;
    wire [7:0] _3475;
    wire [1:0] _3472;
    wire [1:0] _3470;
    wire [1:0] _3469;
    wire [1:0] _3468;
    wire [1:0] _3467;
    reg [1:0] _3471;
    wire [1:0] _3473;
    reg [7:0] _3478;
    wire [7:0] _3479;
    wire [7:0] _228;
    reg [7:0] _977;
    wire _979;
    wire [3:0] _1179;
    reg _1180;
    wire _1182;
    wire [15:0] _1174;
    wire _1176;
    wire [15:0] _1165;
    wire [16:0] _1166;
    wire [16:0] _1167;
    reg [16:0] _1170;
    wire _1171;
    wire _1172;
    wire [15:0] _1161;
    wire _1163;
    wire [2:0] _937;
    wire [2:0] _3494;
    wire _3490;
    wire _3491;
    wire _3488;
    wire _3492;
    wire [2:0] _3495;
    wire _3485;
    wire _3486;
    wire _3484;
    wire _3487;
    wire [2:0] _3497;
    wire _3481;
    wire [2:0] _3483;
    wire _3480;
    wire [2:0] _3498;
    wire [2:0] _229;
    reg [2:0] _933;
    wire _935;
    wire [2:0] _938;
    wire _928;
    wire _929;
    wire _927;
    wire _930;
    wire [2:0] _940;
    wire _924;
    wire _925;
    wire [2:0] _941;
    wire _1145;
    wire [2:0] _1147;
    wire [2:0] _916;
    wire [2:0] _3513;
    wire _3509;
    wire _3510;
    wire _3507;
    wire _3511;
    wire [2:0] _3514;
    wire _3504;
    wire _3505;
    wire _3503;
    wire _3506;
    wire [2:0] _3516;
    wire _3500;
    wire [2:0] _3502;
    wire _3499;
    wire [2:0] _3517;
    wire [2:0] _230;
    reg [2:0] _912;
    wire _914;
    wire [2:0] _917;
    wire _907;
    wire _908;
    wire _906;
    wire _909;
    wire [2:0] _919;
    wire _903;
    wire _904;
    wire [2:0] _920;
    wire _1142;
    wire [2:0] _1144;
    wire _1148;
    wire [2:0] _1149;
    wire [2:0] _893;
    wire [2:0] _3532;
    wire _3528;
    wire _3529;
    wire _3526;
    wire _3530;
    wire [2:0] _3533;
    wire _3523;
    wire _3524;
    wire _3522;
    wire _3525;
    wire [2:0] _3535;
    wire _3519;
    wire [2:0] _3521;
    wire _3518;
    wire [2:0] _3536;
    wire [2:0] _231;
    reg [2:0] _889;
    wire _891;
    wire [2:0] _894;
    wire _884;
    wire _885;
    wire _883;
    wire _886;
    wire [2:0] _896;
    wire _880;
    wire _881;
    wire [2:0] _897;
    wire _1137;
    wire [2:0] _1139;
    wire [2:0] _872;
    wire [2:0] _3551;
    wire _3547;
    wire _3548;
    wire _3545;
    wire _3549;
    wire [2:0] _3552;
    wire _3542;
    wire _3543;
    wire _3541;
    wire _3544;
    wire [2:0] _3554;
    wire _3538;
    wire [2:0] _3540;
    wire _3537;
    wire [2:0] _3555;
    wire [2:0] _232;
    reg [2:0] _868;
    wire _870;
    wire [2:0] _873;
    wire _863;
    wire _864;
    wire _862;
    wire _865;
    wire [2:0] _875;
    wire _859;
    wire _860;
    wire [2:0] _876;
    wire _1134;
    wire [2:0] _1136;
    wire _1140;
    wire [2:0] _1141;
    wire _1150;
    wire [2:0] _1151;
    wire [2:0] _847;
    wire [2:0] _3570;
    wire _3566;
    wire _3567;
    wire _3564;
    wire _3568;
    wire [2:0] _3571;
    wire _3561;
    wire _3562;
    wire _3560;
    wire _3563;
    wire [2:0] _3573;
    wire _3557;
    wire [2:0] _3559;
    wire _3556;
    wire [2:0] _3574;
    wire [2:0] _233;
    reg [2:0] _843;
    wire _845;
    wire [2:0] _848;
    wire _838;
    wire _839;
    wire _837;
    wire _840;
    wire [2:0] _850;
    wire _834;
    wire _835;
    wire [2:0] _851;
    wire _1127;
    wire [2:0] _1129;
    wire [2:0] _826;
    wire [2:0] _3589;
    wire _3585;
    wire _3586;
    wire _3583;
    wire _3587;
    wire [2:0] _3590;
    wire _3580;
    wire _3581;
    wire _3579;
    wire _3582;
    wire [2:0] _3592;
    wire _3576;
    wire [2:0] _3578;
    wire _3575;
    wire [2:0] _3593;
    wire [2:0] _234;
    reg [2:0] _822;
    wire _824;
    wire [2:0] _827;
    wire _817;
    wire _818;
    wire _816;
    wire _819;
    wire [2:0] _829;
    wire _813;
    wire _814;
    wire [2:0] _830;
    wire _1124;
    wire [2:0] _1126;
    wire _1130;
    wire [2:0] _1131;
    wire [2:0] _803;
    wire [2:0] _3608;
    wire _3604;
    wire _3605;
    wire _3602;
    wire _3606;
    wire [2:0] _3609;
    wire _3599;
    wire _3600;
    wire _3598;
    wire _3601;
    wire [2:0] _3611;
    wire _3595;
    wire [2:0] _3597;
    wire _3594;
    wire [2:0] _3612;
    wire [2:0] _235;
    reg [2:0] _799;
    wire _801;
    wire [2:0] _804;
    wire _794;
    wire _795;
    wire _793;
    wire _796;
    wire [2:0] _806;
    wire _790;
    wire _791;
    wire [2:0] _807;
    wire _1119;
    wire [2:0] _1121;
    wire [2:0] _782;
    wire [2:0] _3627;
    wire _3623;
    wire _3624;
    wire _3621;
    wire _3625;
    wire [2:0] _3628;
    wire _3618;
    wire _3619;
    wire _3617;
    wire _3620;
    wire [2:0] _3630;
    wire _3614;
    wire [2:0] _3616;
    wire _3613;
    wire [2:0] _3631;
    wire [2:0] _236;
    reg [2:0] _778;
    wire _780;
    wire [2:0] _783;
    wire _773;
    wire _774;
    wire _772;
    wire _775;
    wire [2:0] _785;
    wire _769;
    wire _770;
    wire [2:0] _786;
    wire [7:0] _1115;
    wire _1116;
    wire [2:0] _1118;
    wire _1122;
    wire [2:0] _1123;
    wire _1132;
    wire [2:0] _1133;
    wire _1152;
    wire [2:0] _1153;
    wire [16:0] _1154;
    wire _3634;
    wire [127:0] _3635;
    wire _3632;
    wire [127:0] _3636;
    wire [127:0] _237;
    reg [127:0] _701;
    wire _758;
    wire _759;
    wire [127:0] _760;
    wire _3639;
    wire [127:0] _3640;
    wire _3637;
    wire [127:0] _3641;
    wire [127:0] _238;
    reg [127:0] _698;
    wire _754;
    wire _755;
    wire [127:0] _756;
    wire _3644;
    wire [127:0] _3645;
    wire _3642;
    wire [127:0] _3646;
    wire [127:0] _239;
    reg [127:0] _695;
    wire _750;
    wire _751;
    wire [127:0] _752;
    wire _640;
    wire _241;
    wire _3673;
    wire [127:0] _243;
    reg [127:0] _3674[0:255];
    wire [1:0] _3670;
    wire [5:0] _245;
    wire [111:0] _1074;
    wire [5:0] _3659;
    wire [111:0] _1068;
    wire [5:0] _3658;
    wire [5:0] _3657;
    wire [5:0] _3656;
    reg [5:0] _3660;
    wire _3661;
    wire _3662;
    wire [5:0] _3663;
    wire [5:0] _247;
    wire [5:0] _3650;
    wire [5:0] _248;
    reg [5:0] _3649;
    wire [1:0] f_policy;
    wire _3653;
    wire [5:0] _3654;
    wire [5:0] _3655;
    wire [5:0] _3664;
    wire _3651;
    wire [5:0] _3665;
    wire [5:0] _3666;
    wire [5:0] _249;
    reg [5:0] _1512;
    wire [7:0] _3671;
    wire [7:0] _251;
    wire _3668;
    wire _3669;
    wire [7:0] _3672;
    wire [127:0] _3675;
    reg [127:0] _3678;
    wire [127:0] _252;
    wire _746;
    wire _747;
    wire [127:0] _748;
    wire [511:0] _761;
    wire [111:0] _1111;
    wire [15:0] _1112;
    wire [16:0] _1113;
    wire [16:0] _1155;
    reg [16:0] _1158;
    wire gnd;
    wire [16:0] _1110;
    wire _1159;
    wire _1160;
    wire _1164;
    wire _1173;
    wire [15:0] _3706;
    wire _3702;
    wire _3703;
    wire _3704;
    wire [15:0] _3707;
    wire _3686;
    wire _3687;
    wire [15:0] _3709;
    wire [15:0] _3711;
    wire [15:0] _253;
    reg [15:0] _735;
    wire [15:0] _3723;
    wire _3719;
    wire _3720;
    wire [8:0] _3698;
    wire _3699;
    wire [5:0] _3696;
    wire [5:0] _3695;
    wire _3697;
    wire [8:0] _3690;
    wire [8:0] _3712;
    wire [8:0] _3713;
    wire [8:0] _3715;
    wire [8:0] _254;
    reg [8:0] _3691;
    wire [2:0] _3692;
    wire _3694;
    wire [1:0] _3688;
    reg _3700;
    wire _3721;
    wire [15:0] _3724;
    wire _3716;
    wire _3717;
    wire [15:0] _3726;
    wire [15:0] _3728;
    wire [15:0] _255;
    reg [15:0] _732;
    wire [1:0] _1106;
    reg [15:0] _1107;
    wire _1109;
    wire _1177;
    reg [7:0] _304;
    wire [7:0] f_chg_now;
    wire _3730;
    wire [7:0] _3732;
    wire _3729;
    wire [7:0] _3733;
    wire [7:0] _3735;
    wire [7:0] _256;
    reg [7:0] _717;
    wire [7:0] f_changed_all;
    wire [7:0] _1100;
    wire _1102;
    wire _1103;
    wire [7:0] f_chgmask1;
    wire _1099;
    wire _1104;
    wire [7:0] _1093;
    wire [7:0] _1091;
    wire vdd;
    wire _258;
    wire _260;
    wire [7:0] _262;
    reg [7:0] _289;
    reg [7:0] _292;
    wire [7:0] _1092;
    wire [7:0] _1094;
    wire _1096;
    wire [111:0] _1062;
    wire f_valid1;
    wire _1097;
    wire _1105;
    wire _1178;
    wire _1183;
    wire _1222;
    wire _1223;
    wire _1227;
    wire f_fire1;
    wire [1:0] _1517;
    wire [1:0] f_winner;
    reg [2:0] _3683;
    wire [2:0] _3685;
    wire _3736;
    wire _3737;
    wire [15:0] _3746;
    wire [15:0] _3748;
    wire [15:0] _263;
    reg [15:0] _729;
    wire [1:0] _1708;
    reg [15:0] _1709;
    wire [15:0] _1707;
    wire _1710;
    wire [63:0] _1057;
    wire _1705;
    wire _1703;
    wire _1704;
    wire _1706;
    wire _1711;
    wire _1716;
    wire _1724;
    wire f_viol_now;
    wire [2:0] _3754;
    wire [2:0] _3757;
    wire _3750;
    wire [2:0] _3758;
    wire _3749;
    wire [2:0] _3761;
    wire [2:0] _3763;
    wire [2:0] _264;
    reg [2:0] _744;
    wire _3766;
    wire [127:0] _3767;
    wire _3764;
    wire [127:0] _3768;
    wire [127:0] _265;
    reg [127:0] _692;
    wire [511:0] _702;
    wire [111:0] _703;
    wire f_valid0;
    wire _711;
    wire _725;
    wire _973;
    wire _1002;
    wire _1046;
    wire f_in_eval;
    wire _1047;
    wire _1056;
    wire f_fire0;
    wire _1229;
    wire _1368;
    wire _1507;
    wire [1:0] _3787;
    wire _3772;
    wire [1:0] _3774;
    wire _3770;
    wire [1:0] _3788;
    wire _3769;
    wire [1:0] _3791;
    wire _267;
    wire [1:0] _3793;
    wire [1:0] _3795;
    wire [1:0] _268;
    reg [1:0] _638;
    wire f_in_fetch;
    wire _1656;
    wire _1657;
    wire _2352;
    wire [7:0] _3817;
    wire _270;
    wire [7:0] _3819;
    wire [7:0] _271;
    reg [7:0] _2416;
    wire _2417;
    wire [23:0] _273;
    wire [2:0] _2413;
    reg _2424;
    wire [7:0] _2488;
    wire [7:0] _3821;
    assign _410 = 3'b000;
    assign _440 = 3'b001;
    assign _441 = _439 ? _440 : _415;
    assign _413 = 3'b100;
    assign _412 = 3'b010;
    assign _414 = _405 ? _413 : _412;
    assign _415 = _408 ? _414 : _411;
    assign _442 = _393 ? _441 : _415;
    assign _444 = _279 ? _410 : _442;
    assign _446 = _277 ? _410 : _444;
    assign _1 = _446;
    always @(posedge _260) begin
        if (_258)
            _411 <= _410;
        else
            _411 <= _1;
    end
    assign _631 = { _621,
                    _624,
                    _627,
                    _630,
                    gnd,
                    _411 };
    assign _602 = _600 ? _440 : _577;
    assign _576 = _567 ? _413 : _412;
    assign _577 = _570 ? _576 : _573;
    assign _603 = _555 ? _602 : _577;
    assign _605 = _451 ? _410 : _603;
    assign _607 = _449 ? _410 : _605;
    assign _2 = _607;
    always @(posedge _260) begin
        if (_258)
            _573 <= _410;
        else
            _573 <= _2;
    end
    assign _619 = { _609,
                    _612,
                    _615,
                    _618,
                    gnd,
                    _573 };
    assign _632 = { _619,
                    _631 };
    assign _635 = { _633,
                    _634 };
    assign _681 = _677 ? _669 : _680;
    assign _683 = _12 ? _410 : _681;
    assign _5 = _683;
    always @(posedge _260) begin
        if (_258)
            _680 <= _410;
        else
            _680 <= _5;
    end
    assign _674 = 1'b0;
    assign _684 = 1'b1;
    assign _676 = ~ _675;
    assign _667 = _642 ? _440 : _412;
    assign _664 = 3'b011;
    assign _668 = _656 ? _667 : _664;
    assign _633 = _481 | _456;
    assign _659 = _8[1:1];
    assign _660 = _659 & _633;
    assign _634 = _319 | _285;
    assign _8 = host_lane_we;
    assign _657 = _8[0:0];
    assign _658 = _657 & _634;
    assign _661 = _658 | _660;
    assign _653 = _649 | _652;
    assign _646 = _29 & _640;
    assign _654 = _646 & _653;
    assign _644 = ~ _640;
    assign _10 = host_cov_re;
    assign _643 = _29 | _10;
    assign _645 = _643 & _644;
    assign _655 = _645 | _654;
    assign _641 = ~ _640;
    assign _642 = _241 & _641;
    assign _656 = _642 | _655;
    assign _662 = _656 | _661;
    assign _669 = _662 ? _668 : _410;
    assign _671 = _669 == _410;
    assign _672 = ~ _671;
    assign _677 = _672 & _676;
    assign _685 = _677 ? _684 : _675;
    assign _12 = host_err_clear;
    assign _687 = _12 ? _674 : _685;
    assign _13 = _687;
    always @(posedge _260) begin
        if (_258)
            _675 <= _674;
        else
            _675 <= _13;
    end
    assign _1524 = _1520 == _1523;
    assign _1525 = ~ _1524;
    assign _1509 = _1508 & _649;
    assign _1526 = _1509 & _1525;
    assign _1531 = _1526 ? _684 : _1529;
    assign _1533 = _270 ? _674 : _1531;
    assign _15 = _1533;
    always @(posedge _260) begin
        if (_258)
            _1529 <= _674;
        else
            _1529 <= _15;
    end
    assign _1536 = _60 & _1535;
    assign _1541 = _1536 ? _684 : _1539;
    assign _1543 = _270 ? _674 : _1541;
    assign _17 = _1543;
    always @(posedge _260) begin
        if (_258)
            _1539 <= _674;
        else
            _1539 <= _17;
    end
    assign _1675 = ~ _1674;
    assign _1668 = _1653 & _1667;
    assign _1676 = _1668 & _1675;
    assign _1649 = ~ _1648;
    assign _1596 = _1546 & _1595;
    assign _1650 = _1596 & _1649;
    assign _1677 = _1650 | _1676;
    assign _19 = _1677;
    assign _1678 = _119 & _991;
    assign _1679 = _1678 | _19;
    assign _1684 = _1679 ? _684 : _1682;
    assign _1686 = _270 ? _674 : _1684;
    assign _20 = _1686;
    always @(posedge _260) begin
        if (_258)
            _1682 <= _674;
        else
            _1682 <= _20;
    end
    assign _1690 = _1057[61:61];
    assign _1691 = _1656 & _1690;
    assign _1696 = _1691 ? _684 : _1694;
    assign _24 = host_irq_ack;
    assign _1698 = _24 ? _674 : _1696;
    assign _1700 = _270 ? _674 : _1698;
    assign _25 = _1700;
    always @(posedge _260) begin
        if (_258)
            _1694 <= _674;
        else
            _1694 <= _25;
    end
    assign _1729 = f_policy == _1728;
    assign _1731 = _1729 ? _684 : _1689;
    assign _1727 = f_policy == _2335;
    assign _1733 = _1727 ? _684 : _1731;
    assign _1734 = f_viol_now ? _1733 : _1689;
    assign _1735 = _1507 ? _1689 : _1734;
    assign _1702 = _638 == _1804;
    assign _1736 = _1702 ? _1735 : _1689;
    assign _1738 = _270 ? _674 : _1736;
    assign _26 = _1738;
    always @(posedge _260) begin
        if (_258)
            _1689 <= _674;
        else
            _1689 <= _26;
    end
    assign _1744 = ~ _1743;
    assign _1741 = ~ _1740;
    assign _1745 = _1741 | _1744;
    assign _1746 = _1745 | _1689;
    assign _1747 = _1746 | _1694;
    assign _1847 = ~ f_host_cov_we;
    assign _1846 = ~ _652;
    assign _1848 = _1846 & _1847;
    assign _1845 = 32'b00000000000000000000000000000000;
    assign _1839 = ~ _649;
    assign _1837 = ~ _652;
    assign _29 = host_cov_we;
    assign _1836 = _29 & _640;
    assign _1838 = _1836 & _1837;
    assign f_host_cov_we = _1838 & _1839;
    assign _1841 = _652 | f_host_cov_we;
    assign _1830 = _46[11:0];
    assign _1827 = _1820 < _1817;
    assign _1828 = _1802 & _1827;
    assign _1829 = _1828 ? _1817 : _1820;
    assign _1831 = _1829 < _1830;
    assign _1832 = _1831 ? _1830 : _1829;
    assign _1833 = _1813 ? _1829 : _1832;
    assign _1819 = 12'b000000000000;
    assign _1780 = 12'b111111111111;
    assign _1777 = _1775[11:0];
    assign _1774 = 13'b0000000000000;
    assign _1771 = 10'b0000000000;
    assign _1772 = { _1771,
                     _1768 };
    assign _1773 = _1764 - _1772;
    always @* begin
        case (f_winner)
        0:
            _1748 <= _1016;
        1:
            _1748 <= _1192;
        2:
            _1748 <= _1331;
        default:
            _1748 <= _1470;
        endcase
    end
    assign _30 = _1748;
    always @(posedge _260) begin
        if (_258)
            _1768 <= _410;
        else
            _1768 <= _30;
    end
    assign _1769 = { _1771,
                     _1768 };
    assign _1754 = 13'b1111111111111;
    assign _1753 = _1751[12:0];
    assign _1749 = 16'b0001111111111111;
    assign _1752 = _1749 < _1751;
    assign _1755 = _1752 ? _1754 : _1753;
    assign _31 = _1755;
    always @(posedge _260) begin
        if (_258)
            _1764 <= _1774;
        else
            _1764 <= _31;
    end
    assign _1770 = _1764 < _1769;
    assign _1775 = _1770 ? _1774 : _1773;
    assign _1761 = 13'b0111111111111;
    assign _1776 = _1761 < _1775;
    assign _1779 = _1776 ? _1780 : _1777;
    assign _1756 = 16'b1111111111111111;
    assign _1757 = _1751 == _1756;
    assign _32 = _1757;
    always @(posedge _260) begin
        if (_258)
            _1760 <= _674;
        else
            _1760 <= _32;
    end
    assign _1781 = _1760 ? _1780 : _1779;
    assign _33 = _1781;
    always @(posedge _260) begin
        if (_258)
            _1820 <= _1819;
        else
            _1820 <= _33;
    end
    assign _1784 = _1751[11:0];
    always @* begin
        case (f_winner)
        0:
            _1750 <= _726;
        1:
            _1750 <= _1106;
        2:
            _1750 <= _1245;
        default:
            _1750 <= _1384;
        endcase
    end
    always @* begin
        case (_1750)
        0:
            _1751 <= _729;
        1:
            _1751 <= _732;
        2:
            _1751 <= _735;
        default:
            _1751 <= _735;
        endcase
    end
    assign _1782 = 16'b0000111111111111;
    assign _1783 = _1782 < _1751;
    assign _1786 = _1783 ? _1780 : _1784;
    assign _34 = _1786;
    always @(posedge _260) begin
        if (_258)
            _1817 <= _1819;
        else
            _1817 <= _34;
    end
    assign _1821 = _1817 < _1820;
    assign _1822 = _1802 & _1821;
    assign _1823 = _1822 ? _1817 : _1820;
    assign _1814 = _46[23:12];
    assign _1824 = _1814 < _1823;
    assign _1825 = _1824 ? _1814 : _1823;
    assign _1812 = 8'b00000000;
    assign _1813 = _1797 == _1812;
    assign _1826 = _1813 ? _1823 : _1825;
    assign _1810 = 8'b11111111;
    assign _1809 = _1807[7:0];
    assign _1804 = 2'b10;
    assign _1803 = 2'b01;
    assign _1788 = _1520 == _1523;
    assign _1787 = _1508 & _649;
    assign _1789 = _1787 & _1788;
    assign _35 = _1789;
    always @(posedge _260) begin
        if (_258)
            _1802 <= _674;
        else
            _1802 <= _35;
    end
    assign _1805 = _1802 ? _1804 : _1803;
    assign _1799 = 7'b0000000;
    assign _1806 = { _1799,
                     _1805 };
    assign _1797 = _46[31:24];
    assign _1798 = { gnd,
                     _1797 };
    assign _1807 = _1798 + _1806;
    assign _1808 = _1807[8:8];
    assign _1811 = _1808 ? _1810 : _1809;
    assign _1834 = { _1811,
                     _1826,
                     _1833 };
    assign _37 = host_cov_wdata;
    assign _1835 = _652 ? _1834 : _37;
    always @(posedge _260) begin
        if (_1841)
            _1842[_1796] <= _1835;
    end
    assign _38 = _1523;
    always @(posedge _260) begin
        if (_258)
            _1795 <= _1812;
        else
            _1795 <= _38;
    end
    assign _1520 = { _1512,
                     f_winner };
    assign _39 = _1520;
    always @(posedge _260) begin
        if (_258)
            _1523 <= _1812;
        else
            _1523 <= _39;
    end
    assign _41 = host_cov_addr;
    assign _1792 = _649 ? _1523 : _41;
    assign _1790 = ~ _649;
    assign _43 = host_cover_en;
    assign _1508 = _1507 & _43;
    assign _1791 = _1508 & _1790;
    assign _44 = _1791;
    always @(posedge _260) begin
        if (_258)
            _649 <= _674;
        else
            _649 <= _44;
    end
    assign _45 = _649;
    always @(posedge _260) begin
        if (_258)
            _652 <= _674;
        else
            _652 <= _45;
    end
    assign _1796 = _652 ? _1795 : _1792;
    assign _1843 = _1842[_1796];
    always @(posedge _260) begin
        if (_1848)
            _1849 <= _1843;
    end
    assign _46 = _1849;
    assign _1851 = _640 ? _46 : _1845;
    assign _2218 = 3'b111;
    assign _2219 = _1856 == _2218;
    assign _2220 = _1853 & _2219;
    assign _2217 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _260) begin
        if (_258)
            _2221 <= _2217;
        else
            if (_2220)
                _2221 <= _59;
    end
    assign _2212 = 3'b110;
    assign _2213 = _1856 == _2212;
    assign _2214 = _1853 & _2213;
    always @(posedge _260) begin
        if (_258)
            _2215 <= _2217;
        else
            if (_2214)
                _2215 <= _59;
    end
    assign _2206 = 3'b101;
    assign _2207 = _1856 == _2206;
    assign _2208 = _1853 & _2207;
    always @(posedge _260) begin
        if (_258)
            _2209 <= _2217;
        else
            if (_2208)
                _2209 <= _59;
    end
    assign _2201 = _1856 == _413;
    assign _2202 = _1853 & _2201;
    always @(posedge _260) begin
        if (_258)
            _2203 <= _2217;
        else
            if (_2202)
                _2203 <= _59;
    end
    assign _2195 = _1856 == _664;
    assign _2196 = _1853 & _2195;
    always @(posedge _260) begin
        if (_258)
            _2197 <= _2217;
        else
            if (_2196)
                _2197 <= _59;
    end
    assign _2189 = _1856 == _412;
    assign _2190 = _1853 & _2189;
    always @(posedge _260) begin
        if (_258)
            _2191 <= _2217;
        else
            if (_2190)
                _2191 <= _59;
    end
    assign _2183 = _1856 == _440;
    assign _2184 = _1853 & _2183;
    always @(posedge _260) begin
        if (_258)
            _2185 <= _2217;
        else
            if (_2184)
                _2185 <= _59;
    end
    assign _1858 = _1856 + _440;
    assign _1859 = _1853 ? _1858 : _1856;
    assign _49 = _1859;
    always @(posedge _260) begin
        if (_258)
            _1856 <= _410;
        else
            _1856 <= _49;
    end
    assign _2177 = _1856 == _410;
    assign _2178 = _1853 & _2177;
    assign _2150 = _2041 - _2146;
    assign _1867 = 29'b11111111111111111111111111111;
    assign _1866 = 29'b00000000000000000000000000000;
    assign _1869 = 29'b00000000000000000000000000001;
    assign _1870 = ts_hi_m1 + _1869;
    assign _1863 = ts_reg[2:0];
    assign _1865 = _1863 == _2218;
    assign _1871 = _1865 ? _1870 : ts_hi_m1;
    assign _50 = _1871;
    always @(posedge _260) begin
        if (_258)
            ts_hi_m1 <= _1867;
        else
            ts_hi_m1 <= _50;
    end
    assign _2148 = ts_reg[31:3];
    assign _1889 = _1876 + _440;
    assign _1885 = _1876 == _2218;
    assign _1886 = ~ _1885;
    assign _1883 = _1050[0:0];
    assign _1887 = _1883 & _1886;
    assign _1890 = _1887 ? _1889 : _1876;
    assign _1880 = _1050[0:0];
    assign _1881 = ~ _1880;
    assign _1878 = _717[0:0];
    assign _1877 = f_chg_now[0:0];
    assign _1879 = _1877 & _1878;
    assign _1882 = _1879 & _1881;
    assign _1892 = _1882 ? _440 : _1890;
    assign _1873 = _638 == _1803;
    assign _1893 = _1873 ? _1892 : _1876;
    assign _51 = _1893;
    always @(posedge _260) begin
        if (_258)
            _1876 <= _410;
        else
            _1876 <= _51;
    end
    assign _2139 = _1050[0:0];
    assign _2141 = _2139 ? _1876 : _410;
    assign _1910 = _1897 + _440;
    assign _1906 = _1897 == _2218;
    assign _1907 = ~ _1906;
    assign _1904 = _1050[1:1];
    assign _1908 = _1904 & _1907;
    assign _1911 = _1908 ? _1910 : _1897;
    assign _1901 = _1050[1:1];
    assign _1902 = ~ _1901;
    assign _1899 = _717[1:1];
    assign _1898 = f_chg_now[1:1];
    assign _1900 = _1898 & _1899;
    assign _1903 = _1900 & _1902;
    assign _1913 = _1903 ? _440 : _1911;
    assign _1894 = _638 == _1803;
    assign _1914 = _1894 ? _1913 : _1897;
    assign _52 = _1914;
    always @(posedge _260) begin
        if (_258)
            _1897 <= _410;
        else
            _1897 <= _52;
    end
    assign _2136 = _1050[1:1];
    assign _2138 = _2136 ? _1897 : _410;
    assign _2142 = _2098 ? _2141 : _2138;
    assign _1931 = _1918 + _440;
    assign _1927 = _1918 == _2218;
    assign _1928 = ~ _1927;
    assign _1925 = _1050[2:2];
    assign _1929 = _1925 & _1928;
    assign _1932 = _1929 ? _1931 : _1918;
    assign _1922 = _1050[2:2];
    assign _1923 = ~ _1922;
    assign _1920 = _717[2:2];
    assign _1919 = f_chg_now[2:2];
    assign _1921 = _1919 & _1920;
    assign _1924 = _1921 & _1923;
    assign _1934 = _1924 ? _440 : _1932;
    assign _1915 = _638 == _1803;
    assign _1935 = _1915 ? _1934 : _1918;
    assign _53 = _1935;
    always @(posedge _260) begin
        if (_258)
            _1918 <= _410;
        else
            _1918 <= _53;
    end
    assign _2132 = _1050[2:2];
    assign _2134 = _2132 ? _1918 : _410;
    assign _1952 = _1939 + _440;
    assign _1948 = _1939 == _2218;
    assign _1949 = ~ _1948;
    assign _1946 = _1050[3:3];
    assign _1950 = _1946 & _1949;
    assign _1953 = _1950 ? _1952 : _1939;
    assign _1943 = _1050[3:3];
    assign _1944 = ~ _1943;
    assign _1941 = _717[3:3];
    assign _1940 = f_chg_now[3:3];
    assign _1942 = _1940 & _1941;
    assign _1945 = _1942 & _1944;
    assign _1955 = _1945 ? _440 : _1953;
    assign _1936 = _638 == _1803;
    assign _1956 = _1936 ? _1955 : _1939;
    assign _54 = _1956;
    always @(posedge _260) begin
        if (_258)
            _1939 <= _410;
        else
            _1939 <= _54;
    end
    assign _2129 = _1050[3:3];
    assign _2131 = _2129 ? _1939 : _410;
    assign _2135 = _2101 ? _2134 : _2131;
    assign _2143 = _2100 ? _2142 : _2135;
    assign _1973 = _1960 + _440;
    assign _1969 = _1960 == _2218;
    assign _1970 = ~ _1969;
    assign _1967 = _1050[4:4];
    assign _1971 = _1967 & _1970;
    assign _1974 = _1971 ? _1973 : _1960;
    assign _1964 = _1050[4:4];
    assign _1965 = ~ _1964;
    assign _1962 = _717[4:4];
    assign _1961 = f_chg_now[4:4];
    assign _1963 = _1961 & _1962;
    assign _1966 = _1963 & _1965;
    assign _1976 = _1966 ? _440 : _1974;
    assign _1957 = _638 == _1803;
    assign _1977 = _1957 ? _1976 : _1960;
    assign _55 = _1977;
    always @(posedge _260) begin
        if (_258)
            _1960 <= _410;
        else
            _1960 <= _55;
    end
    assign _2124 = _1050[4:4];
    assign _2126 = _2124 ? _1960 : _410;
    assign _1994 = _1981 + _440;
    assign _1990 = _1981 == _2218;
    assign _1991 = ~ _1990;
    assign _1988 = _1050[5:5];
    assign _1992 = _1988 & _1991;
    assign _1995 = _1992 ? _1994 : _1981;
    assign _1985 = _1050[5:5];
    assign _1986 = ~ _1985;
    assign _1983 = _717[5:5];
    assign _1982 = f_chg_now[5:5];
    assign _1984 = _1982 & _1983;
    assign _1987 = _1984 & _1986;
    assign _1997 = _1987 ? _440 : _1995;
    assign _1978 = _638 == _1803;
    assign _1998 = _1978 ? _1997 : _1981;
    assign _56 = _1998;
    always @(posedge _260) begin
        if (_258)
            _1981 <= _410;
        else
            _1981 <= _56;
    end
    assign _2121 = _1050[5:5];
    assign _2123 = _2121 ? _1981 : _410;
    assign _2127 = _2105 ? _2126 : _2123;
    assign _2015 = _2002 + _440;
    assign _2011 = _2002 == _2218;
    assign _2012 = ~ _2011;
    assign _2009 = _1050[6:6];
    assign _2013 = _2009 & _2012;
    assign _2016 = _2013 ? _2015 : _2002;
    assign _2006 = _1050[6:6];
    assign _2007 = ~ _2006;
    assign _2004 = _717[6:6];
    assign _2003 = f_chg_now[6:6];
    assign _2005 = _2003 & _2004;
    assign _2008 = _2005 & _2007;
    assign _2018 = _2008 ? _440 : _2016;
    assign _1999 = _638 == _1803;
    assign _2019 = _1999 ? _2018 : _2002;
    assign _57 = _2019;
    always @(posedge _260) begin
        if (_258)
            _2002 <= _410;
        else
            _2002 <= _57;
    end
    assign _2117 = _1050[6:6];
    assign _2119 = _2117 ? _2002 : _410;
    assign _2036 = _2023 + _440;
    assign _2032 = _2023 == _2218;
    assign _2033 = ~ _2032;
    assign _2030 = _1050[7:7];
    assign _2034 = _2030 & _2033;
    assign _2037 = _2034 ? _2036 : _2023;
    assign _2027 = _1050[7:7];
    assign _2028 = ~ _2027;
    assign _2025 = _717[7:7];
    assign _2024 = f_chg_now[7:7];
    assign _2026 = _2024 & _2025;
    assign _2029 = _2026 & _2028;
    assign _2039 = _2029 ? _440 : _2037;
    assign _2020 = _638 == _1803;
    assign _2040 = _2020 ? _2039 : _2023;
    assign _58 = _2040;
    always @(posedge _260) begin
        if (_258)
            _2023 <= _410;
        else
            _2023 <= _58;
    end
    assign _2114 = _1050[7:7];
    assign _2116 = _2114 ? _2023 : _410;
    assign _2120 = _2108 ? _2119 : _2116;
    assign _2128 = _2107 ? _2127 : _2120;
    assign _2144 = _2104 ? _2143 : _2128;
    assign _2109 = _1080[7:7];
    assign _2108 = _1080[6:6];
    assign _2110 = _2108 | _2109;
    assign _2106 = _1080[5:5];
    assign _2105 = _1080[4:4];
    assign _2107 = _2105 | _2106;
    assign _2111 = _2107 | _2110;
    assign _2102 = _1080[3:3];
    assign _2101 = _1080[2:2];
    assign _2103 = _2101 | _2102;
    assign _2099 = _1080[1:1];
    assign _2098 = _1080[0:0];
    assign _2100 = _2098 | _2099;
    assign _2104 = _2100 | _2103;
    assign _2112 = _2104 | _2111;
    assign _2145 = _2112 ? _2144 : _410;
    assign _2087 = f_watch[0:0];
    assign _2086 = _717[0:0];
    assign _2088 = _2086 & _2087;
    assign _2090 = _2088 ? _933 : _410;
    assign _2082 = f_watch[1:1];
    assign _2081 = _717[1:1];
    assign _2083 = _2081 & _2082;
    assign _2085 = _2083 ? _912 : _410;
    assign _2091 = _2085 < _2090;
    assign _2092 = _2091 ? _2090 : _2085;
    assign _2075 = f_watch[2:2];
    assign _2074 = _717[2:2];
    assign _2076 = _2074 & _2075;
    assign _2078 = _2076 ? _889 : _410;
    assign _2070 = f_watch[3:3];
    assign _2069 = _717[3:3];
    assign _2071 = _2069 & _2070;
    assign _2073 = _2071 ? _868 : _410;
    assign _2079 = _2073 < _2078;
    assign _2080 = _2079 ? _2078 : _2073;
    assign _2093 = _2080 < _2092;
    assign _2094 = _2093 ? _2092 : _2080;
    assign _2061 = f_watch[4:4];
    assign _2060 = _717[4:4];
    assign _2062 = _2060 & _2061;
    assign _2064 = _2062 ? _843 : _410;
    assign _2056 = f_watch[5:5];
    assign _2055 = _717[5:5];
    assign _2057 = _2055 & _2056;
    assign _2059 = _2057 ? _822 : _410;
    assign _2065 = _2059 < _2064;
    assign _2066 = _2065 ? _2064 : _2059;
    assign _2049 = f_watch[6:6];
    assign _2048 = _717[6:6];
    assign _2050 = _2048 & _2049;
    assign _2052 = _2050 ? _799 : _410;
    assign _2044 = f_watch[7:7];
    assign _2043 = _717[7:7];
    assign _2045 = _2043 & _2044;
    assign _2047 = _2045 ? _778 : _410;
    assign _2053 = _2047 < _2052;
    assign _2054 = _2053 ? _2052 : _2047;
    assign _2067 = _2054 < _2066;
    assign _2068 = _2067 ? _2066 : _2054;
    assign _2095 = _2068 < _2094;
    assign _2096 = _2095 ? _2094 : _2068;
    assign _2097 = f_unexp_now ? _2096 : _410;
    assign _2146 = f_amb_now ? _2145 : _2097;
    assign _2041 = ts_reg[2:0];
    assign _2147 = _2041 < _2146;
    assign _2149 = _2147 ? ts_hi_m1 : _2148;
    assign _2151 = { _2149,
                     _2150 };
    assign _2155 = { _2151,
                     _1512,
                     _2154,
                     _292 };
    assign _59 = _2155;
    always @(posedge _260) begin
        if (_258)
            _2179 <= _2217;
        else
            if (_2178)
                _2179 <= _59;
    end
    assign _2172 = _2170 + _440;
    assign _1742 = 4'b0000;
    assign _2161 = 4'b0001;
    assign _2162 = _61 + _2161;
    assign _2160 = _61 - _2161;
    assign _2163 = _1853 ? _2162 : _2160;
    assign _1534 = 4'b1000;
    assign _1535 = _61 == _1534;
    assign _1852 = ~ _1535;
    assign _60 = f_viol_now;
    assign _1853 = _60 & _1852;
    assign _2158 = _1853 ^ _2157;
    assign _2164 = _2158 ? _2163 : _61;
    always @(posedge _260) begin
        if (_258)
            _2167 <= _1742;
        else
            _2167 <= _2164;
    end
    assign _61 = _2167;
    assign _1743 = _61 == _1742;
    assign _2156 = ~ _1743;
    assign _63 = host_vlog_pop;
    assign _2157 = _63 & _2156;
    assign _2173 = _2157 ? _2172 : _2170;
    assign _64 = _2173;
    always @(posedge _260) begin
        if (_258)
            _2170 <= _410;
        else
            _2170 <= _64;
    end
    always @* begin
        case (_2170)
        0:
            _2222 <= _2179;
        1:
            _2222 <= _2185;
        2:
            _2222 <= _2191;
        3:
            _2222 <= _2197;
        4:
            _2222 <= _2203;
        5:
            _2222 <= _2209;
        6:
            _2222 <= _2215;
        default:
            _2222 <= _2221;
        endcase
    end
    assign _2326 = _2227 == _2218;
    assign _2327 = _2224 & _2326;
    always @(posedge _260) begin
        if (_258)
            _2328 <= _1812;
        else
            if (_2327)
                _2328 <= _70;
    end
    assign _2320 = _2227 == _2212;
    assign _2321 = _2224 & _2320;
    always @(posedge _260) begin
        if (_258)
            _2322 <= _1812;
        else
            if (_2321)
                _2322 <= _70;
    end
    assign _2314 = _2227 == _2206;
    assign _2315 = _2224 & _2314;
    always @(posedge _260) begin
        if (_258)
            _2316 <= _1812;
        else
            if (_2315)
                _2316 <= _70;
    end
    assign _2308 = _2227 == _413;
    assign _2309 = _2224 & _2308;
    always @(posedge _260) begin
        if (_258)
            _2310 <= _1812;
        else
            if (_2309)
                _2310 <= _70;
    end
    assign _2302 = _2227 == _664;
    assign _2303 = _2224 & _2302;
    always @(posedge _260) begin
        if (_258)
            _2304 <= _1812;
        else
            if (_2303)
                _2304 <= _70;
    end
    assign _2296 = _2227 == _412;
    assign _2297 = _2224 & _2296;
    always @(posedge _260) begin
        if (_258)
            _2298 <= _1812;
        else
            if (_2297)
                _2298 <= _70;
    end
    assign _2290 = _2227 == _440;
    assign _2291 = _2224 & _2290;
    always @(posedge _260) begin
        if (_258)
            _2292 <= _1812;
        else
            if (_2291)
                _2292 <= _70;
    end
    assign _2229 = _2227 + _440;
    assign _2230 = _2224 ? _2229 : _2227;
    assign _67 = _2230;
    always @(posedge _260) begin
        if (_258)
            _2227 <= _410;
        else
            _2227 <= _67;
    end
    assign _2284 = _2227 == _410;
    assign _2285 = _2224 & _2284;
    assign _2270 = _1603 ? _2269 : _2264;
    assign _2271 = _1609 ? _2269 : _2270;
    assign _2248 = _2247 ? _2245 : _2235;
    assign _2246 = _2232 ? _2245 : _2235;
    assign _2249 = _1648 ? _2248 : _2246;
    assign _68 = _2249;
    always @(posedge _260) begin
        if (_258)
            _2235 <= _1812;
        else
            _2235 <= _68;
    end
    assign _2244 = _1553 ? _2243 : _2238;
    assign _2245 = _1559 ? _2243 : _2244;
    assign _2260 = _1546 ? _2235 : _2245;
    assign _2257 = _2256 ? _986 : _2254;
    assign _2255 = _2251 ? _986 : _2254;
    assign _2258 = _1674 ? _2257 : _2255;
    assign _69 = _2258;
    always @(posedge _260) begin
        if (_258)
            _2254 <= _1812;
        else
            _2254 <= _69;
    end
    assign _2259 = _1653 ? _2254 : _986;
    assign _2261 = _1648 ? _2260 : _2259;
    assign _2272 = _1645 ? _2271 : _2261;
    assign _70 = _2272;
    always @(posedge _260) begin
        if (_258)
            _2286 <= _1812;
        else
            if (_2285)
                _2286 <= _70;
    end
    assign _2279 = _2277 + _440;
    assign _2280 = _2274 ? _2279 : _2277;
    assign _71 = _2280;
    always @(posedge _260) begin
        if (_258)
            _2277 <= _410;
        else
            _2277 <= _71;
    end
    always @* begin
        case (_2277)
        0:
            _2329 <= _2286;
        1:
            _2329 <= _2292;
        2:
            _2329 <= _2298;
        3:
            _2329 <= _2304;
        4:
            _2329 <= _2310;
        5:
            _2329 <= _2316;
        6:
            _2329 <= _2322;
        default:
            _2329 <= _2328;
        endcase
    end
    assign _2332 = 32'b00000000000000000000000000000001;
    assign _2333 = ts_reg + _2332;
    assign _75 = _2333;
    always @(posedge _260) begin
        if (_258)
            ts_reg <= _1845;
        else
            ts_reg <= _75;
    end
    assign _2335 = 2'b00;
    assign _2152 = { _1716,
                     f_unexp_now };
    assign _2154 = f_amb_now ? _2335 : _2152;
    always @(posedge _260) begin
        if (_258)
            _2336 <= _2335;
        else
            _2336 <= _2154;
    end
    always @(posedge _260) begin
        if (_258)
            _2339 <= _674;
        else
            _2339 <= f_viol_now;
    end
    always @(posedge _260) begin
        if (_258)
            _2342 <= _2335;
        else
            _2342 <= f_winner;
    end
    always @(posedge _260) begin
        if (_258)
            _2345 <= _674;
        else
            _2345 <= _1507;
    end
    assign _2346 = _1057[60:60];
    assign _2347 = f_in_eval & _2346;
    assign _2348 = ~ _640;
    assign _2489 = _88 & _2488;
    assign _2490 = ~ _2489;
    assign _2370 = _1057[23:16];
    assign _2368 = _1074[86:79];
    assign _2367 = _1068[86:79];
    assign _2366 = _1062[86:79];
    assign _2365 = _703[86:79];
    always @* begin
        case (f_winner)
        0:
            _2369 <= _2365;
        1:
            _2369 <= _2366;
        2:
            _2369 <= _2367;
        default:
            _2369 <= _2368;
        endcase
    end
    assign _2371 = _1656 ? _2370 : _2369;
    assign _2372 = _2371 & _2362;
    assign _2363 = ~ _2362;
    assign _2364 = _2355 & _2363;
    assign _2373 = _2364 | _2372;
    assign _2407 = _2373 | _2406;
    assign _2408 = _2352 ? _2407 : _2355;
    assign _2410 = _267 ? _1812 : _2408;
    assign _2412 = _270 ? _1812 : _2410;
    assign _85 = _2412;
    always @(posedge _260) begin
        if (_258)
            _2355 <= _1812;
        else
            _2355 <= _85;
    end
    assign _2491 = _2355 & _2490;
    assign _88 = host_open_drain;
    assign _3820 = ~ _88;
    assign _2486 = _567 & _2480;
    assign _2485 = ~ _567;
    assign _2483 = ~ _405;
    assign _2484 = _2483 & _2480;
    assign _2482 = _405 & _2480;
    assign _2481 = ~ _405;
    assign _2480 = _2416[0:0];
    assign _2479 = _273[2:0];
    always @* begin
        case (_2479)
        0:
            _2487 <= _2480;
        1:
            _2487 <= _405;
        2:
            _2487 <= _2481;
        3:
            _2487 <= _2482;
        4:
            _2487 <= _2484;
        5:
            _2487 <= _567;
        6:
            _2487 <= _2485;
        default:
            _2487 <= _2486;
        endcase
    end
    assign _2477 = _567 & _2471;
    assign _2476 = ~ _567;
    assign _2474 = ~ _405;
    assign _2475 = _2474 & _2471;
    assign _2473 = _405 & _2471;
    assign _2472 = ~ _405;
    assign _2471 = _2416[1:1];
    assign _2470 = _273[5:3];
    always @* begin
        case (_2470)
        0:
            _2478 <= _2471;
        1:
            _2478 <= _405;
        2:
            _2478 <= _2472;
        3:
            _2478 <= _2473;
        4:
            _2478 <= _2475;
        5:
            _2478 <= _567;
        6:
            _2478 <= _2476;
        default:
            _2478 <= _2477;
        endcase
    end
    assign _2468 = _567 & _2462;
    assign _2467 = ~ _567;
    assign _2465 = ~ _405;
    assign _2466 = _2465 & _2462;
    assign _2464 = _405 & _2462;
    assign _2463 = ~ _405;
    assign _2462 = _2416[2:2];
    assign _2461 = _273[8:6];
    always @* begin
        case (_2461)
        0:
            _2469 <= _2462;
        1:
            _2469 <= _405;
        2:
            _2469 <= _2463;
        3:
            _2469 <= _2464;
        4:
            _2469 <= _2466;
        5:
            _2469 <= _567;
        6:
            _2469 <= _2467;
        default:
            _2469 <= _2468;
        endcase
    end
    assign _2459 = _567 & _2453;
    assign _2458 = ~ _567;
    assign _2456 = ~ _405;
    assign _2457 = _2456 & _2453;
    assign _2455 = _405 & _2453;
    assign _2454 = ~ _405;
    assign _2453 = _2416[3:3];
    assign _2452 = _273[11:9];
    always @* begin
        case (_2452)
        0:
            _2460 <= _2453;
        1:
            _2460 <= _405;
        2:
            _2460 <= _2454;
        3:
            _2460 <= _2455;
        4:
            _2460 <= _2457;
        5:
            _2460 <= _567;
        6:
            _2460 <= _2458;
        default:
            _2460 <= _2459;
        endcase
    end
    assign _2450 = _567 & _2444;
    assign _2449 = ~ _567;
    assign _2447 = ~ _405;
    assign _2448 = _2447 & _2444;
    assign _2446 = _405 & _2444;
    assign _2445 = ~ _405;
    assign _2444 = _2416[4:4];
    assign _2443 = _273[14:12];
    always @* begin
        case (_2443)
        0:
            _2451 <= _2444;
        1:
            _2451 <= _405;
        2:
            _2451 <= _2445;
        3:
            _2451 <= _2446;
        4:
            _2451 <= _2448;
        5:
            _2451 <= _567;
        6:
            _2451 <= _2449;
        default:
            _2451 <= _2450;
        endcase
    end
    assign _2441 = _567 & _2435;
    assign _2440 = ~ _567;
    assign _2438 = ~ _405;
    assign _2439 = _2438 & _2435;
    assign _2437 = _405 & _2435;
    assign _2436 = ~ _405;
    assign _2435 = _2416[5:5];
    assign _2434 = _273[17:15];
    always @* begin
        case (_2434)
        0:
            _2442 <= _2435;
        1:
            _2442 <= _405;
        2:
            _2442 <= _2436;
        3:
            _2442 <= _2437;
        4:
            _2442 <= _2439;
        5:
            _2442 <= _567;
        6:
            _2442 <= _2440;
        default:
            _2442 <= _2441;
        endcase
    end
    assign _2432 = _567 & _2426;
    assign _2431 = ~ _567;
    assign _2429 = ~ _405;
    assign _2430 = _2429 & _2426;
    assign _2428 = _405 & _2426;
    assign _2427 = ~ _405;
    assign _2426 = _2416[6:6];
    assign _2425 = _273[20:18];
    always @* begin
        case (_2425)
        0:
            _2433 <= _2426;
        1:
            _2433 <= _405;
        2:
            _2433 <= _2427;
        3:
            _2433 <= _2428;
        4:
            _2433 <= _2430;
        5:
            _2433 <= _567;
        6:
            _2433 <= _2431;
        default:
            _2433 <= _2432;
        endcase
    end
    assign _2423 = _567 & _2417;
    assign _2422 = ~ _567;
    assign _2420 = ~ _405;
    assign _2421 = _2420 & _2417;
    assign _2419 = _405 & _2417;
    assign _2418 = ~ _405;
    assign _3812 = { _3810,
                     _3809 };
    assign _3809 = _982[0:0];
    assign _3810 = { _3809,
                     _3809 };
    assign _3811 = { _3810,
                     _3810 };
    assign _3813 = { _3811,
                     _3812 };
    assign _3814 = { _3813,
                     _3809 };
    assign _3815 = _3814 & _2406;
    assign _2404 = _2400 & _2398;
    assign _2403 = _2400 & _2396;
    assign _2402 = _2400 & _2393;
    assign _2400 = ~ _2387;
    assign _2401 = _2400 & _2390;
    assign _2398 = _2395 & _2392;
    assign _2399 = _2387 & _2398;
    assign _2395 = ~ _2388;
    assign _2396 = _2395 & _2389;
    assign _2397 = _2387 & _2396;
    assign _2392 = ~ _2389;
    assign _2393 = _2388 & _2392;
    assign _2394 = _2387 & _2393;
    assign _2389 = _2386[0:0];
    assign _2388 = _2386[1:1];
    assign _2390 = _2388 & _2389;
    assign _2387 = _2386[2:2];
    assign _2391 = _2387 & _2390;
    assign _2405 = { _2391,
                     _2394,
                     _2397,
                     _2399,
                     _2401,
                     _2402,
                     _2403,
                     _2404 };
    assign _2374 = ~ _1656;
    assign _2380 = _2374 & _2379;
    assign _2406 = _2380 ? _2405 : _1812;
    assign _3807 = ~ _2406;
    assign _3803 = _1057[15:8];
    assign _3801 = _1074[78:71];
    assign _3800 = _1068[78:71];
    assign _3799 = _1062[78:71];
    assign _3798 = _703[78:71];
    always @* begin
        case (f_winner)
        0:
            _3802 <= _3798;
        1:
            _3802 <= _3799;
        2:
            _3802 <= _3800;
        default:
            _3802 <= _3801;
        endcase
    end
    assign _3804 = _1656 ? _3803 : _3802;
    assign _3805 = _3804 & _2362;
    assign _2361 = _1057[7:0];
    assign _2359 = _1074[70:63];
    assign _2358 = _1068[70:63];
    assign _2357 = _1062[70:63];
    assign _2356 = _703[70:63];
    always @* begin
        case (f_winner)
        0:
            _2360 <= _2356;
        1:
            _2360 <= _2357;
        2:
            _2360 <= _2358;
        default:
            _2360 <= _2359;
        endcase
    end
    assign _2362 = _1656 ? _2361 : _2360;
    assign _3796 = ~ _2362;
    assign _3797 = _2416 & _3796;
    assign _3806 = _3797 | _3805;
    assign _3808 = _3806 & _3807;
    assign _3816 = _3808 | _3815;
    assign _2350 = _1005 == _2335;
    assign _2351 = _2350 | _1007;
    assign _1655 = _744 == _413;
    assign _3790 = _1656 ? _1804 : _638;
    assign _3786 = _3662 ? _1803 : _638;
    assign _1728 = 2'b11;
    assign _3777 = f_policy == _1728;
    assign _3779 = _3777 ? _2335 : _638;
    assign _3776 = f_policy == _1804;
    assign _3781 = _3776 ? _1803 : _3779;
    assign _3775 = f_policy == _2335;
    assign _3783 = _3775 ? _2335 : _3781;
    assign _3784 = f_viol_now ? _3783 : _638;
    assign _1502 = f_chgmask3 & f_multi_eff;
    assign _1504 = _1502 == _1812;
    assign _1495 = _1452 == _1756;
    assign _1490 = 16'b0000000000000000;
    assign _1491 = _1452 == _1490;
    assign _1492 = _1491 & _1472;
    assign _1489 = _1388 == _1448;
    assign _1493 = _1489 | _1492;
    assign _1496 = _1387 ? _1495 : _1493;
    assign _1486 = _994[3:0];
    assign _1488 = _1486 == _1742;
    assign _1497 = _1488 | _1496;
    assign _1484 = _1452 == _1756;
    assign _1480 = _1452 == _1490;
    assign _1481 = _1480 & _1472;
    assign _1478 = _1388 == _1448;
    assign _1482 = _1478 | _1481;
    assign _1485 = _1387 ? _1484 : _1482;
    assign _1476 = _1439 == _1756;
    always @(posedge _260) begin
        if (_258)
            _1470 <= _410;
        else
            _1470 <= _1431;
    end
    assign _1471 = { _1774,
                     _1470 };
    assign _1472 = _1385 < _1471;
    assign _1466 = _1439 == _1490;
    assign _1473 = _1466 & _1472;
    assign _1464 = _1388 == _1436;
    assign _1474 = _1464 | _1473;
    assign _1477 = _1387 ? _1476 : _1474;
    assign _1463 = _1074[104:103];
    always @* begin
        case (_1463)
        0:
            _1498 <= vdd;
        1:
            _1498 <= _1477;
        2:
            _1498 <= _1485;
        default:
            _1498 <= _1497;
        endcase
    end
    assign _1462 = ~ _1007;
    assign _1499 = _1462 | _1498;
    assign _1459 = _1074[62:62];
    assign _1457 = _1074[61:58];
    always @* begin
        case (_1457)
        0:
            _1458 <= vdd;
        1:
            _1458 <= _979;
        2:
            _1458 <= _983;
        3:
            _1458 <= _987;
        4:
            _1458 <= _989;
        5:
            _1458 <= _991;
        6:
            _1458 <= _995;
        7:
            _1458 <= _998;
        8:
            _1458 <= _621;
        9:
            _1458 <= _624;
        10:
            _1458 <= _627;
        11:
            _1458 <= _630;
        12:
            _1458 <= _609;
        13:
            _1458 <= _612;
        14:
            _1458 <= _615;
        default:
            _1458 <= _618;
        endcase
    end
    assign _1460 = _1458 ^ _1459;
    assign _1452 = _1074[57:42];
    assign _1454 = _1452 == _1756;
    assign _1447 = 17'b00000000000000000;
    assign _1443 = _1389[57:42];
    assign _1444 = { gnd,
                     _1443 };
    assign _1445 = _1444 + _1432;
    always @(posedge _260) begin
        if (_258)
            _1448 <= _1447;
        else
            _1448 <= _1445;
    end
    assign _1449 = _1448 < _1388;
    assign _1450 = ~ _1449;
    assign _1439 = _1074[41:26];
    assign _1441 = _1439 == _1490;
    assign _1423 = _1393[0:0];
    assign _1425 = _1423 ? _941 : _410;
    assign _1420 = _1393[1:1];
    assign _1422 = _1420 ? _920 : _410;
    assign _1426 = _1422 < _1425;
    assign _1427 = _1426 ? _1425 : _1422;
    assign _1415 = _1393[2:2];
    assign _1417 = _1415 ? _897 : _410;
    assign _1412 = _1393[3:3];
    assign _1414 = _1412 ? _876 : _410;
    assign _1418 = _1414 < _1417;
    assign _1419 = _1418 ? _1417 : _1414;
    assign _1428 = _1419 < _1427;
    assign _1429 = _1428 ? _1427 : _1419;
    assign _1405 = _1393[4:4];
    assign _1407 = _1405 ? _851 : _410;
    assign _1402 = _1393[5:5];
    assign _1404 = _1402 ? _830 : _410;
    assign _1408 = _1404 < _1407;
    assign _1409 = _1408 ? _1407 : _1404;
    assign _1397 = _1393[6:6];
    assign _1399 = _1397 ? _807 : _410;
    assign _1393 = _1389[23:16];
    assign _1394 = _1393[7:7];
    assign _1396 = _1394 ? _786 : _410;
    assign _1400 = _1396 < _1399;
    assign _1401 = _1400 ? _1399 : _1396;
    assign _1410 = _1401 < _1409;
    assign _1411 = _1410 ? _1409 : _1401;
    assign _1430 = _1411 < _1429;
    assign _1431 = _1430 ? _1429 : _1411;
    assign _1392 = 14'b00000000000000;
    assign _1432 = { _1392,
                     _1431 };
    assign _1389 = _761[511:400];
    assign _1390 = _1389[41:26];
    assign _1391 = { gnd,
                     _1390 };
    assign _1433 = _1391 + _1432;
    always @(posedge _260) begin
        if (_258)
            _1436 <= _1447;
        else
            _1436 <= _1433;
    end
    assign _1388 = { gnd,
                     _1385 };
    assign _1437 = _1388 < _1436;
    assign _1438 = ~ _1437;
    assign _1442 = _1438 | _1441;
    assign _1451 = _1442 & _1450;
    assign _1384 = _1074[25:24];
    always @* begin
        case (_1384)
        0:
            _1385 <= _729;
        1:
            _1385 <= _732;
        2:
            _1385 <= _735;
        default:
            _1385 <= _735;
        endcase
    end
    assign _1387 = _1385 == _1756;
    assign _1455 = _1387 ? _1454 : _1451;
    assign _1378 = f_changed_all & f_chgmask3;
    assign _1380 = _1378 == _1812;
    assign _1381 = ~ _1380;
    assign _1377 = f_chgmask3 == _1812;
    assign _1382 = _1377 | _1381;
    assign _1371 = _1074[7:0];
    assign _1369 = _1074[15:8];
    assign _1370 = _292 ^ _1369;
    assign _1372 = _1370 & _1371;
    assign _1374 = _1372 == _1812;
    assign _1375 = f_valid3 & _1374;
    assign _1383 = _1375 & _1382;
    assign _1456 = _1383 & _1455;
    assign _1461 = _1456 & _1460;
    assign _1500 = _1461 & _1499;
    assign _1501 = f_in_eval & _1500;
    assign _1505 = _1501 & _1504;
    assign f_fire3 = _1505 & _1089;
    assign _1053 = f_chgmask0 & f_multi_eff;
    assign _1055 = _1053 == _1812;
    assign _1041 = _969 == _1756;
    assign _1037 = _969 == _1490;
    assign _1038 = _1037 & _1018;
    assign _1035 = _739 == _965;
    assign _1039 = _1035 | _1038;
    assign _1042 = _738 ? _1041 : _1039;
    assign _1032 = _994[3:0];
    assign _1034 = _1032 == _1742;
    assign _1043 = _1034 | _1042;
    assign _1030 = _969 == _1756;
    assign _1026 = _969 == _1490;
    assign _1027 = _1026 & _1018;
    assign _1024 = _739 == _965;
    assign _1028 = _1024 | _1027;
    assign _1031 = _738 ? _1030 : _1028;
    assign _1022 = _956 == _1756;
    always @(posedge _260) begin
        if (_258)
            _1016 <= _410;
        else
            _1016 <= _948;
    end
    assign _1017 = { _1774,
                     _1016 };
    assign _1018 = _736 < _1017;
    assign _1012 = _956 == _1490;
    assign _1019 = _1012 & _1018;
    assign _1010 = _739 == _953;
    assign _1020 = _1010 | _1019;
    assign _1023 = _738 ? _1022 : _1020;
    assign _1009 = _703[104:103];
    always @* begin
        case (_1009)
        0:
            _1044 <= vdd;
        1:
            _1044 <= _1023;
        2:
            _1044 <= _1031;
        default:
            _1044 <= _1043;
        endcase
    end
    assign _1008 = ~ _1007;
    assign _1045 = _1008 | _1044;
    assign _1000 = _703[62:62];
    assign _974 = _703[61:58];
    always @* begin
        case (_974)
        0:
            _999 <= vdd;
        1:
            _999 <= _979;
        2:
            _999 <= _983;
        3:
            _999 <= _987;
        4:
            _999 <= _989;
        5:
            _999 <= _991;
        6:
            _999 <= _995;
        7:
            _999 <= _998;
        8:
            _999 <= _621;
        9:
            _999 <= _624;
        10:
            _999 <= _627;
        11:
            _999 <= _630;
        12:
            _999 <= _609;
        13:
            _999 <= _612;
        14:
            _999 <= _615;
        default:
            _999 <= _618;
        endcase
    end
    assign _1001 = _999 ^ _1000;
    assign _969 = _703[57:42];
    assign _971 = _969 == _1756;
    assign _960 = _762[57:42];
    assign _961 = { gnd,
                    _960 };
    assign _962 = _961 + _949;
    always @(posedge _260) begin
        if (_258)
            _965 <= _1447;
        else
            _965 <= _962;
    end
    assign _966 = _965 < _739;
    assign _967 = ~ _966;
    assign _956 = _703[41:26];
    assign _958 = _956 == _1490;
    assign _922 = _766[0:0];
    assign _942 = _922 ? _941 : _410;
    assign _901 = _766[1:1];
    assign _921 = _901 ? _920 : _410;
    assign _943 = _921 < _942;
    assign _944 = _943 ? _942 : _921;
    assign _878 = _766[2:2];
    assign _898 = _878 ? _897 : _410;
    assign _857 = _766[3:3];
    assign _877 = _857 ? _876 : _410;
    assign _899 = _877 < _898;
    assign _900 = _899 ? _898 : _877;
    assign _945 = _900 < _944;
    assign _946 = _945 ? _944 : _900;
    assign _832 = _766[4:4];
    assign _852 = _832 ? _851 : _410;
    assign _811 = _766[5:5];
    assign _831 = _811 ? _830 : _410;
    assign _853 = _831 < _852;
    assign _854 = _853 ? _852 : _831;
    assign _788 = _766[6:6];
    assign _808 = _788 ? _807 : _410;
    assign _766 = _762[23:16];
    assign _767 = _766[7:7];
    assign _787 = _767 ? _786 : _410;
    assign _809 = _787 < _808;
    assign _810 = _809 ? _808 : _787;
    assign _855 = _810 < _854;
    assign _856 = _855 ? _854 : _810;
    assign _947 = _856 < _946;
    assign _948 = _947 ? _946 : _856;
    assign _949 = { _1392,
                    _948 };
    assign _762 = _761[175:64];
    assign _763 = _762[41:26];
    assign _764 = { gnd,
                    _763 };
    assign _950 = _764 + _949;
    always @(posedge _260) begin
        if (_258)
            _953 <= _1447;
        else
            _953 <= _950;
    end
    assign _739 = { gnd,
                    _736 };
    assign _954 = _739 < _953;
    assign _955 = ~ _954;
    assign _959 = _955 | _958;
    assign _968 = _959 & _967;
    assign _726 = _703[25:24];
    always @* begin
        case (_726)
        0:
            _736 <= _729;
        1:
            _736 <= _732;
        2:
            _736 <= _735;
        default:
            _736 <= _735;
        endcase
    end
    assign _738 = _736 == _1756;
    assign _972 = _738 ? _971 : _968;
    assign _720 = f_changed_all & f_chgmask0;
    assign _722 = _720 == _1812;
    assign _723 = ~ _722;
    assign _714 = f_chgmask0 == _1812;
    assign _724 = _714 | _723;
    assign _707 = _703[7:0];
    assign _705 = _703[15:8];
    assign _706 = _292 ^ _705;
    assign _708 = _706 & _707;
    assign _710 = _708 == _1812;
    assign _691 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _3760 = _744 + _440;
    assign _3756 = _3662 ? _410 : _744;
    assign _3751 = f_policy == _1804;
    assign _3753 = _3751 ? _410 : _744;
    assign _1719 = f_changed_all & f_watch;
    assign _1721 = _1719 == _1812;
    assign _1722 = ~ _1721;
    assign _1717 = ~ _1507;
    assign _1718 = f_in_eval & _1717;
    assign f_unexp_now = _1718 & _1722;
    assign _2495 = ~ f_amb_now;
    assign _2496 = _1716 & _2495;
    assign _2498 = _2496 ? _684 : _2494;
    assign _2499 = _1507 ? _2494 : _2498;
    assign _2494 = _1657 ? _674 : _1714;
    assign _2492 = _638 == _1804;
    assign _2500 = _2492 ? _2499 : _2494;
    assign _89 = _2500;
    always @(posedge _260) begin
        if (_258)
            _1714 <= _674;
        else
            _1714 <= _89;
    end
    assign _1715 = ~ _1714;
    assign _3742 = 16'b0000000000000001;
    assign _3743 = _729 + _3742;
    assign _3739 = _729 == _1756;
    assign _3740 = ~ _3739;
    assign _3741 = _3700 & _3740;
    assign _3744 = _3741 ? _3743 : _729;
    assign _3684 = _1057[26:24];
    assign _3682 = _1074[93:91];
    assign _3681 = _1068[93:91];
    assign _3680 = _1062[93:91];
    assign _3679 = _703[93:91];
    assign _1363 = f_chgmask2 & f_multi_eff;
    assign _1365 = _1363 == _1812;
    assign _1356 = _1313 == _1756;
    assign _1352 = _1313 == _1490;
    assign _1353 = _1352 & _1333;
    assign _1350 = _1249 == _1309;
    assign _1354 = _1350 | _1353;
    assign _1357 = _1248 ? _1356 : _1354;
    assign _1347 = _994[3:0];
    assign _1349 = _1347 == _1742;
    assign _1358 = _1349 | _1357;
    assign _1345 = _1313 == _1756;
    assign _1341 = _1313 == _1490;
    assign _1342 = _1341 & _1333;
    assign _1339 = _1249 == _1309;
    assign _1343 = _1339 | _1342;
    assign _1346 = _1248 ? _1345 : _1343;
    assign _1337 = _1300 == _1756;
    always @(posedge _260) begin
        if (_258)
            _1331 <= _410;
        else
            _1331 <= _1292;
    end
    assign _1332 = { _1774,
                     _1331 };
    assign _1333 = _1246 < _1332;
    assign _1327 = _1300 == _1490;
    assign _1334 = _1327 & _1333;
    assign _1325 = _1249 == _1297;
    assign _1335 = _1325 | _1334;
    assign _1338 = _1248 ? _1337 : _1335;
    assign _1324 = _1068[104:103];
    always @* begin
        case (_1324)
        0:
            _1359 <= vdd;
        1:
            _1359 <= _1338;
        2:
            _1359 <= _1346;
        default:
            _1359 <= _1358;
        endcase
    end
    assign _1323 = ~ _1007;
    assign _1360 = _1323 | _1359;
    assign _1320 = _1068[62:62];
    assign _1318 = _1068[61:58];
    always @* begin
        case (_1318)
        0:
            _1319 <= vdd;
        1:
            _1319 <= _979;
        2:
            _1319 <= _983;
        3:
            _1319 <= _987;
        4:
            _1319 <= _989;
        5:
            _1319 <= _991;
        6:
            _1319 <= _995;
        7:
            _1319 <= _998;
        8:
            _1319 <= _621;
        9:
            _1319 <= _624;
        10:
            _1319 <= _627;
        11:
            _1319 <= _630;
        12:
            _1319 <= _609;
        13:
            _1319 <= _612;
        14:
            _1319 <= _615;
        default:
            _1319 <= _618;
        endcase
    end
    assign _1321 = _1319 ^ _1320;
    assign _1313 = _1068[57:42];
    assign _1315 = _1313 == _1756;
    assign _1304 = _1250[57:42];
    assign _1305 = { gnd,
                     _1304 };
    assign _1306 = _1305 + _1293;
    always @(posedge _260) begin
        if (_258)
            _1309 <= _1447;
        else
            _1309 <= _1306;
    end
    assign _1310 = _1309 < _1249;
    assign _1311 = ~ _1310;
    assign _1300 = _1068[41:26];
    assign _1302 = _1300 == _1490;
    assign _1284 = _1254[0:0];
    assign _1286 = _1284 ? _941 : _410;
    assign _1281 = _1254[1:1];
    assign _1283 = _1281 ? _920 : _410;
    assign _1287 = _1283 < _1286;
    assign _1288 = _1287 ? _1286 : _1283;
    assign _1276 = _1254[2:2];
    assign _1278 = _1276 ? _897 : _410;
    assign _1273 = _1254[3:3];
    assign _1275 = _1273 ? _876 : _410;
    assign _1279 = _1275 < _1278;
    assign _1280 = _1279 ? _1278 : _1275;
    assign _1289 = _1280 < _1288;
    assign _1290 = _1289 ? _1288 : _1280;
    assign _1266 = _1254[4:4];
    assign _1268 = _1266 ? _851 : _410;
    assign _1263 = _1254[5:5];
    assign _1265 = _1263 ? _830 : _410;
    assign _1269 = _1265 < _1268;
    assign _1270 = _1269 ? _1268 : _1265;
    assign _1258 = _1254[6:6];
    assign _1260 = _1258 ? _807 : _410;
    assign _1254 = _1250[23:16];
    assign _1255 = _1254[7:7];
    assign _1257 = _1255 ? _786 : _410;
    assign _1261 = _1257 < _1260;
    assign _1262 = _1261 ? _1260 : _1257;
    assign _1271 = _1262 < _1270;
    assign _1272 = _1271 ? _1270 : _1262;
    assign _1291 = _1272 < _1290;
    assign _1292 = _1291 ? _1290 : _1272;
    assign _1293 = { _1392,
                     _1292 };
    assign _1250 = _761[399:288];
    assign _1251 = _1250[41:26];
    assign _1252 = { gnd,
                     _1251 };
    assign _1294 = _1252 + _1293;
    always @(posedge _260) begin
        if (_258)
            _1297 <= _1447;
        else
            _1297 <= _1294;
    end
    assign _1249 = { gnd,
                     _1246 };
    assign _1298 = _1249 < _1297;
    assign _1299 = ~ _1298;
    assign _1303 = _1299 | _1302;
    assign _1312 = _1303 & _1311;
    assign _1245 = _1068[25:24];
    always @* begin
        case (_1245)
        0:
            _1246 <= _729;
        1:
            _1246 <= _732;
        2:
            _1246 <= _735;
        default:
            _1246 <= _735;
        endcase
    end
    assign _1248 = _1246 == _1756;
    assign _1316 = _1248 ? _1315 : _1312;
    assign _1239 = f_changed_all & f_chgmask2;
    assign _1241 = _1239 == _1812;
    assign _1242 = ~ _1241;
    assign _1238 = f_chgmask2 == _1812;
    assign _1243 = _1238 | _1242;
    assign _1232 = _1068[7:0];
    assign _1230 = _1068[15:8];
    assign _1231 = _292 ^ _1230;
    assign _1233 = _1231 & _1232;
    assign _1235 = _1233 == _1812;
    assign _1236 = f_valid2 & _1235;
    assign _1244 = _1236 & _1243;
    assign _1317 = _1244 & _1316;
    assign _1322 = _1317 & _1321;
    assign _1361 = _1322 & _1360;
    assign _1362 = f_in_eval & _1361;
    assign _1366 = _1362 & _1365;
    assign f_fire2 = _1366 & _1089;
    assign _1515 = f_fire2 ? _1804 : _1728;
    assign _1088 = f_policy == _1803;
    assign f_chgmask3 = _1074[23:16];
    assign f_valid3 = _1074[111:111];
    assign _1078 = f_valid3 ? f_chgmask3 : _1812;
    assign f_chgmask2 = _1068[23:16];
    assign f_valid2 = _1068[111:111];
    assign _1072 = f_valid2 ? f_chgmask2 : _1812;
    assign _1066 = f_valid1 ? f_chgmask1 : _1812;
    assign f_chgmask0 = _703[23:16];
    assign _1060 = f_valid0 ? f_chgmask0 : _1812;
    assign f_watch = _1057[57:50];
    assign _1061 = f_watch | _1060;
    assign _1067 = _1061 | _1066;
    assign _1073 = _1067 | _1072;
    assign f_relevant = _1073 | _1078;
    assign _1080 = f_multi_eff & f_relevant;
    assign _1082 = _1080 == _1812;
    assign _1083 = ~ _1082;
    assign f_amb_now = f_in_eval & _1083;
    assign _1085 = ~ f_amb_now;
    assign _1089 = _1085 | _1088;
    assign _1051 = _717 & f_chg_now;
    assign _2505 = _717 & f_chg_now;
    assign _2506 = _1050 | _2505;
    assign _2502 = _638 == _1804;
    assign _2504 = _2502 ? _1812 : _1050;
    assign _2501 = _638 == _1803;
    assign _2507 = _2501 ? _2506 : _2504;
    assign _2509 = _270 ? _1812 : _2507;
    assign _90 = _2509;
    always @(posedge _260) begin
        if (_258)
            _1050 <= _1812;
        else
            _1050 <= _90;
    end
    assign f_multi_eff = _1050 | _1051;
    assign _1224 = f_chgmask1 & f_multi_eff;
    assign _1226 = _1224 == _1812;
    assign _1217 = _1174 == _1756;
    assign _1213 = _1174 == _1490;
    assign _1214 = _1213 & _1194;
    assign _1211 = _1110 == _1170;
    assign _1215 = _1211 | _1214;
    assign _1218 = _1109 ? _1217 : _1215;
    assign _1208 = _994[3:0];
    assign _1210 = _1208 == _1742;
    assign _1219 = _1210 | _1218;
    assign _1206 = _1174 == _1756;
    assign _1202 = _1174 == _1490;
    assign _1203 = _1202 & _1194;
    assign _1200 = _1110 == _1170;
    assign _1204 = _1200 | _1203;
    assign _1207 = _1109 ? _1206 : _1204;
    assign _1198 = _1161 == _1756;
    always @(posedge _260) begin
        if (_258)
            _1192 <= _410;
        else
            _1192 <= _1153;
    end
    assign _1193 = { _1774,
                     _1192 };
    assign _1194 = _1107 < _1193;
    assign _1188 = _1161 == _1490;
    assign _1195 = _1188 & _1194;
    assign _1186 = _1110 == _1158;
    assign _1196 = _1186 | _1195;
    assign _1199 = _1109 ? _1198 : _1196;
    assign _1185 = _1062[104:103];
    always @* begin
        case (_1185)
        0:
            _1220 <= vdd;
        1:
            _1220 <= _1199;
        2:
            _1220 <= _1207;
        default:
            _1220 <= _1219;
        endcase
    end
    assign _92 = host_role;
    assign _2510 = _270 ? _92 : _1005;
    assign _93 = _2510;
    always @(posedge _260) begin
        if (_258)
            _1005 <= _2335;
        else
            _1005 <= _93;
    end
    assign _1007 = _1005 == _1804;
    assign _1184 = ~ _1007;
    assign _1221 = _1184 | _1220;
    assign _1181 = _1062[62:62];
    assign _2514 = _600 ? _684 : _2512;
    assign _2512 = _570 ? _684 : _618;
    assign _2515 = _555 ? _2514 : _2512;
    assign _2517 = _451 ? _674 : _2515;
    assign _2519 = _449 ? _674 : _2517;
    assign _94 = _2519;
    always @(posedge _260) begin
        if (_258)
            _618 <= _674;
        else
            _618 <= _94;
    end
    assign _96 = host_lane1_sync_mask;
    assign _98 = host_lane1_sync;
    assign _2525 = _1547 ? _2524 : _2522;
    assign _2526 = _600 ? _2522 : _2525;
    assign _2527 = _555 ? _2526 : _2522;
    assign _2529 = _451 ? _1490 : _2527;
    assign _99 = _2529;
    always @(posedge _260) begin
        if (_258)
            _2522 <= _1490;
        else
            _2522 <= _99;
    end
    assign _2523 = _2522[14:0];
    assign _2524 = { _2523,
                     _591 };
    assign _2530 = _2524 ^ _98;
    assign _2531 = _2530 & _96;
    assign _2533 = _2531 == _1490;
    assign _2535 = _2533 ? _684 : _615;
    assign _2536 = _1547 ? _2535 : _615;
    assign _2537 = _600 ? _615 : _2536;
    assign _2538 = _555 ? _2537 : _615;
    assign _2540 = _451 ? _674 : _2538;
    assign _2542 = _449 ? _674 : _2540;
    assign _100 = _2542;
    always @(posedge _260) begin
        if (_258)
            _615 <= _674;
        else
            _615 <= _100;
    end
    assign _2555 = _591 == _2554;
    assign _2556 = ~ _2555;
    assign _2558 = _2549 ? _2557 : _2545;
    assign _2559 = _1547 ? _2558 : _2545;
    assign _2560 = _600 ? _2545 : _2559;
    assign _2561 = _555 ? _2560 : _2545;
    assign _2563 = _451 ? _674 : _2561;
    assign _101 = _2563;
    always @(posedge _260) begin
        if (_258)
            _2545 <= _674;
        else
            _2545 <= _101;
    end
    assign _2557 = _2545 | _2556;
    assign _2566 = ~ _2557;
    assign _2564 = 6'b000001;
    assign _2565 = _1576 == _2564;
    assign _2567 = _2565 ? _2566 : _612;
    assign _2568 = _2549 ? _2567 : _612;
    assign _2569 = _1547 ? _2568 : _612;
    assign _2570 = _600 ? _612 : _2569;
    assign _2571 = _555 ? _2570 : _612;
    assign _2573 = _451 ? _674 : _2571;
    assign _2575 = _449 ? _674 : _2573;
    assign _102 = _2575;
    always @(posedge _260) begin
        if (_258)
            _612 <= _674;
        else
            _612 <= _102;
    end
    assign _2579 = _439 ? _684 : _2577;
    assign _2577 = _408 ? _684 : _630;
    assign _2580 = _393 ? _2579 : _2577;
    assign _2582 = _279 ? _674 : _2580;
    assign _2584 = _277 ? _674 : _2582;
    assign _103 = _2584;
    always @(posedge _260) begin
        if (_258)
            _630 <= _674;
        else
            _630 <= _103;
    end
    assign _105 = host_lane0_sync_mask;
    assign _107 = host_lane0_sync;
    assign _2590 = _1597 ? _2589 : _2587;
    assign _2591 = _439 ? _2587 : _2590;
    assign _2592 = _393 ? _2591 : _2587;
    assign _2594 = _279 ? _1490 : _2592;
    assign _108 = _2594;
    always @(posedge _260) begin
        if (_258)
            _2587 <= _1490;
        else
            _2587 <= _108;
    end
    assign _2588 = _2587[14:0];
    assign _2589 = { _2588,
                     _429 };
    assign _2595 = _2589 ^ _107;
    assign _2596 = _2595 & _105;
    assign _2598 = _2596 == _1490;
    assign _2600 = _2598 ? _684 : _627;
    assign _2601 = _1597 ? _2600 : _627;
    assign _2602 = _439 ? _627 : _2601;
    assign _2603 = _393 ? _2602 : _627;
    assign _2605 = _279 ? _674 : _2603;
    assign _2607 = _277 ? _674 : _2605;
    assign _109 = _2607;
    always @(posedge _260) begin
        if (_258)
            _627 <= _674;
        else
            _627 <= _109;
    end
    assign _2620 = _429 == _2619;
    assign _2621 = ~ _2620;
    assign _2623 = _2614 ? _2622 : _2610;
    assign _2624 = _1597 ? _2623 : _2610;
    assign _2625 = _439 ? _2610 : _2624;
    assign _2626 = _393 ? _2625 : _2610;
    assign _2628 = _279 ? _674 : _2626;
    assign _110 = _2628;
    always @(posedge _260) begin
        if (_258)
            _2610 <= _674;
        else
            _2610 <= _110;
    end
    assign _2622 = _2610 | _2621;
    assign _2631 = ~ _2622;
    assign _2630 = _1626 == _2564;
    assign _2632 = _2630 ? _2631 : _624;
    assign _2633 = _2614 ? _2632 : _624;
    assign _2634 = _1597 ? _2633 : _624;
    assign _2635 = _439 ? _624 : _2634;
    assign _2636 = _393 ? _2635 : _624;
    assign _2638 = _279 ? _674 : _2636;
    assign _2640 = _277 ? _674 : _2638;
    assign _111 = _2640;
    always @(posedge _260) begin
        if (_258)
            _624 <= _674;
        else
            _624 <= _111;
    end
    assign _113 = host_match_addr;
    assign _997 = _113[6:0];
    assign _996 = _986[7:1];
    assign _998 = _996 == _997;
    assign _993 = 16'b1010110011100001;
    assign _2645 = _994[10:10];
    assign _2644 = _994[12:12];
    assign _2646 = _2644 ^ _2645;
    assign _2643 = _994[13:13];
    assign _2647 = _2643 ^ _2646;
    assign _2642 = _994[15:15];
    assign _2648 = _2642 ^ _2647;
    assign _2641 = _994[14:0];
    assign _2649 = { _2641,
                     _2648 };
    assign _114 = _2649;
    always @(posedge _260) begin
        if (_258)
            _994 <= _993;
        else
            _994 <= _114;
    end
    assign _995 = _994[0:0];
    assign _2668 = _120 + _2161;
    assign _2666 = _120 - _2161;
    assign _2669 = _2224 ? _2668 : _2666;
    assign _1740 = _120 == _1742;
    assign _2273 = ~ _1740;
    assign _116 = host_rx_pop;
    assign _2274 = _116 & _2273;
    assign _2223 = ~ _991;
    assign _2256 = _1653 & _1667;
    assign _2653 = _2256 ? _1653 : _674;
    assign _2250 = ~ _1653;
    assign _2251 = _2250 & _1667;
    assign _2651 = _2251 ? _684 : _1653;
    assign _1666 = _1664 == _1728;
    assign _1667 = _1657 & _1666;
    assign _1673 = _1653 | _1667;
    assign _1670 = _1546 | _1595;
    assign _1671 = ~ _1670;
    assign _1669 = ~ _1645;
    assign _1672 = _1669 & _1671;
    assign _1674 = _1672 & _1673;
    assign _2654 = _1674 ? _2653 : _2651;
    assign _117 = _2654;
    always @(posedge _260) begin
        if (_258)
            _1653 <= _674;
        else
            _1653 <= _117;
    end
    assign _2662 = _1653 | _1667;
    assign _2247 = _1546 & _1595;
    assign _2658 = _2247 ? _1546 : _674;
    assign _2231 = ~ _1546;
    assign _2232 = _2231 & _1595;
    assign _2656 = _2232 ? _684 : _1546;
    assign _1593 = ~ _1559;
    assign _1587 = _1556 + _440;
    assign _1582 = ~ _585;
    assign _1581 = _1572 & _1580;
    assign _1583 = _1581 & _1582;
    assign _1584 = _1583 & _1552;
    assign _1585 = _1553 | _1584;
    assign _1588 = _1585 ? _1587 : _1556;
    assign _1590 = _1588 == _410;
    assign _1591 = ~ _1590;
    assign _1562 = _1561 & _168;
    assign _1592 = _1562 & _1591;
    assign _1594 = _1592 & _1593;
    assign _1558 = _1556 == _2218;
    assign _1559 = _1553 & _1558;
    assign _1595 = _1559 | _1594;
    assign _1647 = _1546 | _1595;
    assign _1646 = ~ _1645;
    assign _1648 = _1646 & _1647;
    assign _2659 = _1648 ? _2658 : _2656;
    assign _118 = _2659;
    always @(posedge _260) begin
        if (_258)
            _1546 <= _674;
        else
            _1546 <= _118;
    end
    assign _2660 = _1546 | _1595;
    assign _1643 = ~ _1609;
    assign _1637 = _1606 + _440;
    assign _1632 = ~ _423;
    assign _1631 = _1622 & _1630;
    assign _1633 = _1631 & _1632;
    assign _1634 = _1633 & _1602;
    assign _1635 = _1603 | _1634;
    assign _1638 = _1635 ? _1637 : _1606;
    assign _1640 = _1638 == _410;
    assign _1641 = ~ _1640;
    assign _1612 = _1611 & _220;
    assign _1642 = _1612 & _1641;
    assign _1644 = _1642 & _1643;
    assign _1608 = _1606 == _2218;
    assign _1609 = _1603 & _1608;
    assign _1645 = _1609 | _1644;
    assign _2661 = _1645 | _2660;
    assign _2663 = _2661 | _2662;
    assign _119 = _2663;
    assign _2224 = _119 & _2223;
    assign _2664 = _2224 ^ _2274;
    assign _2670 = _2664 ? _2669 : _120;
    always @(posedge _260) begin
        if (_258)
            _2673 <= _1742;
        else
            _2673 <= _2670;
    end
    assign _120 = _2673;
    assign _991 = _120 == _1534;
    assign _2690 = _986[6:0];
    assign _2691 = { _2690,
                     _2687 };
    assign _2688 = _986[7:1];
    assign _2686 = _292[7:7];
    assign _2685 = _292[6:6];
    assign _2684 = _292[5:5];
    assign _2683 = _292[4:4];
    assign _2682 = _292[3:3];
    assign _2681 = _292[2:2];
    assign _2680 = _292[1:1];
    assign _2679 = _292[0:0];
    assign _2677 = _1074[102:100];
    assign _2676 = _1068[102:100];
    assign _2675 = _1062[102:100];
    assign _2674 = _703[102:100];
    always @* begin
        case (f_winner)
        0:
            _2678 <= _2674;
        1:
            _2678 <= _2675;
        2:
            _2678 <= _2676;
        default:
            _2678 <= _2677;
        endcase
    end
    always @* begin
        case (_2678)
        0:
            _2687 <= _2679;
        1:
            _2687 <= _2680;
        2:
            _2687 <= _2681;
        3:
            _2687 <= _2682;
        4:
            _2687 <= _2683;
        5:
            _2687 <= _2684;
        6:
            _2687 <= _2685;
        default:
            _2687 <= _2686;
        endcase
    end
    assign _2689 = { _2687,
                     _2688 };
    assign _1661 = _1074[97:96];
    assign _1660 = _1068[97:96];
    assign _1659 = _1062[97:96];
    assign _1658 = _703[97:96];
    always @* begin
        case (f_winner)
        0:
            _1662 <= _1658;
        1:
            _1662 <= _1659;
        2:
            _1662 <= _1660;
        default:
            _1662 <= _1661;
        endcase
    end
    assign _1664 = _1656 ? _2335 : _1662;
    always @* begin
        case (_1664)
        0:
            _2692 <= _986;
        1:
            _2692 <= _2689;
        2:
            _2692 <= _2691;
        default:
            _2692 <= _986;
        endcase
    end
    assign _2693 = _1657 ? _2692 : _986;
    assign _121 = _2693;
    always @(posedge _260) begin
        if (_258)
            _986 <= _1812;
        else
            _986 <= _121;
    end
    assign _987 = _986[0:0];
    assign _3463 = _982[7:1];
    assign _3464 = { vdd,
                     _3463 };
    assign _3461 = _3453[7:7];
    assign _3460 = _3453[6:6];
    assign _3459 = _3453[5:5];
    assign _3458 = _3453[4:4];
    assign _3457 = _3453[3:3];
    assign _3456 = _3453[2:2];
    assign _3455 = _3453[1:1];
    assign _3454 = _3453[0:0];
    assign _3462 = { _3454,
                     _3455,
                     _3456,
                     _3457,
                     _3458,
                     _3459,
                     _3460,
                     _3461 };
    assign _3446 = _226 + _2161;
    assign _3444 = _226 - _2161;
    assign _3447 = _2708 ? _3446 : _3444;
    assign _3117 = ~ _989;
    assign _3438 = ~ _989;
    assign _1563 = ~ _168;
    assign _3072 = ~ _166;
    assign _3073 = _168 & _3072;
    assign _3076 = _3073 ? _1803 : _1804;
    assign _3065 = ~ _1580;
    assign _3066 = _1572 & _3065;
    assign _3067 = _609 | _3066;
    assign _3068 = _3067 | _3057;
    assign _3070 = _3068 ? _1804 : _3064;
    assign _3051 = _583 + _440;
    assign _3048 = _583 + _440;
    assign _3044 = vdd == _595;
    assign _3042 = _583 == _410;
    assign _3043 = ~ _3042;
    assign _3045 = _3043 & _3044;
    assign _3049 = _3045 ? _3048 : _440;
    assign _3040 = _146 == _1804;
    assign _3052 = _3040 ? _3051 : _3049;
    assign _3053 = _3052 == _124;
    assign _3034 = _583 + _440;
    assign _3030 = gnd == _595;
    assign _3028 = _583 == _410;
    assign _3029 = ~ _3028;
    assign _3031 = _3029 & _3030;
    assign _3035 = _3031 ? _3034 : _440;
    assign _3026 = _146 == _1804;
    assign _3037 = _3026 ? _410 : _3035;
    assign _3038 = _3037 == _124;
    assign _3054 = _591 ? _3053 : _3038;
    assign _3055 = _580 & _3054;
    assign _3056 = ~ _3055;
    assign _3022 = _1576 == _2564;
    assign _3019 = 6'b000000;
    assign _3020 = _1576 == _3019;
    assign _3023 = _2549 ? _3022 : _3020;
    assign _3015 = _1551 + _3742;
    assign _3016 = _3015 == _140;
    assign _3013 = _1551 == _140;
    assign _3017 = _1553 ? _3016 : _3013;
    assign _3011 = ~ _600;
    assign _3012 = _555 & _3011;
    assign _3018 = _3012 & _3017;
    assign _3024 = _3018 & _3023;
    assign _3057 = _3024 & _3056;
    assign _3059 = _3057 ? _1728 : _3010;
    assign _3061 = _600 ? _2335 : _3059;
    assign _3007 = _1580 ? _3005 : _1728;
    assign _3003 = _481 & _479;
    assign _3005 = _3003 ? _1804 : _454;
    assign _3008 = _1572 ? _3007 : _3005;
    assign _2783 = _1580 ? _2782 : _2696;
    assign _2784 = _1572 ? _2783 : _2696;
    assign _122 = _2784;
    always @(posedge _260) begin
        if (_258)
            _2696 <= _674;
        else
            _2696 <= _122;
    end
    assign _2933 = ~ _2782;
    assign _2931 = ~ _567;
    assign _2932 = _2782 ? _567 : _2931;
    always @* begin
        case (_162)
        0:
            _2934 <= _2782;
        1:
            _2934 <= _2932;
        2:
            _2934 <= _2933;
        default:
            _2934 <= _2782;
        endcase
    end
    assign _124 = host_lane1_stuff_len;
    assign _2915 = _583 + _440;
    assign _2916 = _591 ? _2915 : _410;
    assign _2911 = _583 + _440;
    assign _2907 = _591 == _595;
    assign _2905 = _583 == _410;
    assign _2906 = ~ _2905;
    assign _2908 = _2906 & _2907;
    assign _2912 = _2908 ? _2911 : _440;
    assign _2903 = _146 == _1804;
    assign _2917 = _2903 ? _2916 : _2912;
    assign _2918 = _600 ? _2901 : _2917;
    assign _2897 = _583 + _440;
    assign _2898 = _2782 ? _2897 : _410;
    assign _2893 = _583 + _440;
    assign _2779 = _2771[7:7];
    assign _2778 = _2771[6:6];
    assign _2777 = _2771[5:5];
    assign _2776 = _2771[4:4];
    assign _2775 = _2771[3:3];
    assign _2774 = _2771[2:2];
    assign _2773 = _2771[1:1];
    assign _2769 = _2761[7:7];
    assign _2768 = _2761[6:6];
    assign _2767 = _2761[5:5];
    assign _2766 = _2761[4:4];
    assign _2765 = _2761[3:3];
    assign _2764 = _2761[2:2];
    assign _2763 = _2761[1:1];
    assign _2760 = _989 ? _1810 : _2758;
    assign _2241 = _2238[7:1];
    assign _2242 = { _591,
                     _2241 };
    assign _2239 = _2238[6:0];
    assign _2240 = { _2239,
                     _591 };
    assign _2243 = _127 ? _2242 : _2240;
    assign _2789 = _1553 ? _2243 : _2788;
    assign _2790 = _1547 ? _2789 : _2788;
    assign _2791 = _600 ? _2788 : _2790;
    assign _2785 = _1552 ? _2761 : _2238;
    assign _2786 = _585 ? _2238 : _2785;
    assign _2787 = _1580 ? _2786 : _2238;
    assign _2788 = _1572 ? _2787 : _2238;
    assign _2792 = _555 ? _2791 : _2788;
    assign _125 = _2792;
    always @(posedge _260) begin
        if (_258)
            _2238 <= _1812;
        else
            _2238 <= _125;
    end
    assign _2700 = _1556 == _410;
    assign _2697 = ~ _585;
    assign _2698 = _2697 & _1552;
    assign _2701 = _2698 & _2700;
    assign _2761 = _2701 ? _2760 : _2238;
    assign _2762 = _2761[0:0];
    assign _2770 = { _2762,
                     _2763,
                     _2764,
                     _2765,
                     _2766,
                     _2767,
                     _2768,
                     _2769 };
    assign _127 = host_lane1_lsb_first;
    assign _2771 = _127 ? _2761 : _2770;
    assign _2772 = _2771[0:0];
    assign _2800 = _1556 + _440;
    assign _2801 = _1553 ? _2800 : _2798;
    assign _2802 = _1547 ? _2801 : _2798;
    assign _2803 = _600 ? _2798 : _2802;
    assign _2794 = _1556 + _440;
    assign _2795 = _1552 ? _2794 : _1556;
    assign _2796 = _585 ? _1556 : _2795;
    assign _2797 = _1580 ? _2796 : _1556;
    assign _2798 = _1572 ? _2797 : _1556;
    assign _2804 = _555 ? _2803 : _2798;
    assign _2806 = _451 ? _410 : _2804;
    assign _128 = _2806;
    always @(posedge _260) begin
        if (_258)
            _1556 <= _410;
        else
            _1556 <= _128;
    end
    always @* begin
        case (_1556)
        0:
            _2780 <= _2772;
        1:
            _2780 <= _2773;
        2:
            _2780 <= _2774;
        3:
            _2780 <= _2775;
        4:
            _2780 <= _2776;
        5:
            _2780 <= _2777;
        6:
            _2780 <= _2778;
        default:
            _2780 <= _2779;
        endcase
    end
    assign _130 = host_lane1_crc_inv;
    assign _132 = host_lane1_init;
    assign _2848 = _2552[30:0];
    assign _2850 = { _2848,
                     _674 };
    assign _2842 = _2552[31:31];
    assign _2843 = _591 ^ _2842;
    assign _2845 = _2843 ? _137 : _1845;
    assign _2839 = _2552[30:0];
    assign _2841 = { _2839,
                     _674 };
    assign _2846 = _2841 ^ _2845;
    assign _2847 = _1553 ? _2846 : _2838;
    assign _134 = host_lane1_crc_width;
    assign _2816 = _1576 - _2564;
    assign _2817 = _2549 ? _2816 : _2814;
    assign _2818 = _1547 ? _2817 : _2814;
    assign _2819 = _600 ? _2814 : _2818;
    assign _2810 = _1576 - _2564;
    assign _2811 = _1552 ? _1576 : _2810;
    assign _2812 = _585 ? _1576 : _2811;
    assign _2813 = _1580 ? _2812 : _1576;
    assign _2814 = _1572 ? _2813 : _1576;
    assign _2820 = _555 ? _2819 : _2814;
    assign _2821 = _2808 ? _134 : _2820;
    assign _2823 = _451 ? _3019 : _2821;
    assign _135 = _2823;
    always @(posedge _260) begin
        if (_258)
            _1576 <= _3019;
        else
            _1576 <= _135;
    end
    assign _1578 = _1576 == _3019;
    assign _1579 = ~ _1578;
    assign _2547 = ~ _1552;
    assign _2546 = _555 & _1547;
    assign _2548 = _2546 & _2547;
    assign _2549 = _2548 & _1579;
    assign _2851 = _2549 ? _2850 : _2847;
    assign _2852 = _1547 ? _2851 : _2838;
    assign _2853 = _600 ? _2838 : _2852;
    assign _137 = host_lane1_poly;
    assign _2830 = _2552[31:31];
    assign _2831 = _2782 ^ _2830;
    assign _2833 = _2831 ? _137 : _1845;
    assign _2827 = _2552[30:0];
    assign _2829 = { _2827,
                     _674 };
    assign _2834 = _2829 ^ _2833;
    assign _2824 = _2552[30:0];
    assign _2826 = { _2824,
                     _674 };
    assign _2835 = _1552 ? _2834 : _2826;
    assign _2836 = _585 ? _2552 : _2835;
    assign _2837 = _1580 ? _2836 : _2552;
    assign _2838 = _1572 ? _2837 : _2552;
    assign _2854 = _555 ? _2853 : _2838;
    assign _2855 = _451 ? _132 : _2854;
    assign _2857 = _449 ? _1845 : _2855;
    assign _138 = _2857;
    always @(posedge _260) begin
        if (_258)
            _2552 <= _1845;
        else
            _2552 <= _138;
    end
    assign _2553 = _2552[31:31];
    assign _2554 = _2553 ^ _130;
    assign _140 = host_lane1_frame_bits;
    assign _2877 = _1551 + _3742;
    assign _1548 = _555 & _1547;
    assign _1553 = _1548 & _1552;
    assign _2878 = _1553 ? _2877 : _2875;
    assign _1547 = ~ _585;
    assign _2879 = _1547 ? _2878 : _2875;
    assign _2860 = _600 ? _2859 : _591;
    assign _2858 = _1580 ? _2782 : _595;
    assign _2859 = _1572 ? _2858 : _595;
    assign _2861 = _555 ? _2860 : _2859;
    assign _2863 = _451 ? _684 : _2861;
    assign _141 = _2863;
    always @(posedge _260) begin
        if (_258)
            _595 <= vdd;
        else
            _595 <= _141;
    end
    assign _596 = ~ _595;
    assign _593 = _146 == _1803;
    assign _597 = _593 ? _596 : gnd;
    assign _2865 = _162 == _1803;
    assign _2866 = _2865 ? _466 : _589;
    assign _2867 = _555 ? _2866 : _589;
    assign _2869 = _451 ? _684 : _2867;
    assign _142 = _2869;
    always @(posedge _260) begin
        if (_258)
            _589 <= vdd;
        else
            _589 <= _142;
    end
    assign _590 = _466 == _589;
    assign _587 = _162 == _1803;
    assign _591 = _587 ? _590 : _466;
    assign _598 = _591 == _597;
    assign _599 = ~ _598;
    assign _600 = _585 & _599;
    assign _2880 = _600 ? _2875 : _2879;
    assign _2871 = _1551 + _3742;
    assign _2872 = _1552 ? _2871 : _1551;
    assign _2873 = _585 ? _1551 : _2872;
    assign _2874 = _1580 ? _2873 : _1551;
    assign _2875 = _1572 ? _2874 : _1551;
    assign _2881 = _555 ? _2880 : _2875;
    assign _2883 = _451 ? _1490 : _2881;
    assign _143 = _2883;
    always @(posedge _260) begin
        if (_258)
            _1551 <= _1490;
        else
            _1551 <= _143;
    end
    assign _1552 = _1551 < _140;
    assign _2781 = _1552 ? _2780 : _2554;
    assign _2782 = _585 ? _597 : _2781;
    assign _2889 = _2782 == _595;
    assign _2887 = _583 == _410;
    assign _2888 = ~ _2887;
    assign _2890 = _2888 & _2889;
    assign _2894 = _2890 ? _2893 : _440;
    assign _2885 = _146 == _1804;
    assign _2899 = _2885 ? _2898 : _2894;
    assign _2900 = _1580 ? _2899 : _583;
    assign _2901 = _1572 ? _2900 : _583;
    assign _2919 = _555 ? _2918 : _2901;
    assign _2921 = _451 ? _410 : _2919;
    assign _144 = _2921;
    always @(posedge _260) begin
        if (_258)
            _583 <= _410;
        else
            _583 <= _144;
    end
    assign _584 = _583 == _124;
    assign _146 = host_lane1_stuff;
    assign _579 = _146 == _2335;
    assign _580 = ~ _579;
    assign _585 = _580 & _584;
    assign _1573 = _585 | _1552;
    assign _1580 = _1573 | _1579;
    assign _2935 = _1580 ? _2934 : _684;
    assign _2936 = _1572 ? _2935 : _567;
    assign _1568 = _525 == _1490;
    assign _1566 = _490 == _1490;
    assign _1569 = _518 ? _1568 : _1566;
    assign _1570 = _486 ? vdd : _1569;
    assign _1571 = _166 ? _553 : _1570;
    assign _2928 = ~ _1571;
    assign _2925 = _162 == _1804;
    assign _2922 = ~ _168;
    assign _2923 = _456 & _2922;
    assign _2926 = _2923 & _2925;
    assign _2927 = _2926 & _554;
    assign _2929 = _2927 & _2928;
    assign _2937 = _2929 ? _2696 : _2936;
    assign _2939 = _570 ? _684 : _2937;
    assign _2941 = _1561 ? _684 : _2939;
    assign _2943 = _451 ? _684 : _2941;
    assign _2945 = _449 ? _684 : _2943;
    assign _147 = _2945;
    always @(posedge _260) begin
        if (_258)
            _567 <= vdd;
        else
            _567 <= _147;
    end
    assign _568 = _466 == _567;
    assign _569 = ~ _568;
    assign _562 = _162 == _1804;
    assign _563 = ~ _562;
    assign _559 = ~ _166;
    assign _149 = host_lane1_readback;
    assign _556 = ~ _168;
    assign _557 = _456 & _556;
    assign _558 = _557 & _149;
    assign _560 = _558 & _559;
    assign _564 = _560 & _563;
    assign _565 = _564 & _554;
    assign _570 = _565 & _569;
    assign _3010 = _570 ? _2335 : _3008;
    assign _551 = ~ _539;
    assign _552 = _548 & _551;
    assign _547 = _304[7:7];
    assign _546 = _304[6:6];
    assign _545 = _304[5:5];
    assign _544 = _304[4:4];
    assign _543 = _304[3:3];
    assign _542 = _304[2:2];
    assign _541 = _304[1:1];
    assign _540 = _304[0:0];
    always @* begin
        case (_151)
        0:
            _548 <= _540;
        1:
            _548 <= _541;
        2:
            _548 <= _542;
        3:
            _548 <= _543;
        4:
            _548 <= _544;
        5:
            _548 <= _545;
        6:
            _548 <= _546;
        default:
            _548 <= _547;
        endcase
    end
    assign _549 = ~ _548;
    assign _538 = _292[7:7];
    assign _537 = _292[6:6];
    assign _536 = _292[5:5];
    assign _535 = _292[4:4];
    assign _534 = _292[3:3];
    assign _533 = _292[2:2];
    assign _532 = _292[1:1];
    assign _531 = _292[0:0];
    assign _151 = host_lane1_clk_pin;
    always @* begin
        case (_151)
        0:
            _539 <= _531;
        1:
            _539 <= _532;
        2:
            _539 <= _533;
        3:
            _539 <= _534;
        4:
            _539 <= _535;
        5:
            _539 <= _536;
        6:
            _539 <= _537;
        default:
            _539 <= _538;
        endcase
    end
    assign _550 = _539 & _549;
    assign _153 = host_lane1_clk_edge;
    assign _553 = _153 ? _552 : _550;
    assign _529 = _514 == _1490;
    assign _526 = _525 == _514;
    assign _519 = _490 == _514;
    assign _517 = ~ _481;
    assign _508 = _155[15:2];
    assign _509 = { _2335,
                    _508 };
    assign _505 = _155[15:1];
    assign _506 = { _674,
                    _505 };
    assign _510 = _506 + _509;
    assign _502 = _155[15:1];
    assign _503 = { _674,
                    _502 };
    assign _500 = _168 & _483;
    assign _511 = _500 ? _510 : _503;
    always @(posedge _260) begin
        if (_258)
            _514 <= _1490;
        else
            _514 <= _511;
    end
    assign _515 = _490 < _514;
    assign _492 = _155[15:2];
    assign _493 = { _2335,
                    _492 };
    always @(posedge _260) begin
        if (_258)
            _496 <= _1490;
        else
            _496 <= _493;
    end
    assign _2991 = ~ _481;
    assign _2992 = _516 & _2991;
    assign _2993 = _2992 ? _525 : _490;
    assign _2995 = _486 ? _1490 : _2993;
    assign _2997 = _2995 + _3742;
    assign _2975 = _2969 == _1447;
    assign _521 = _155[15:1];
    assign _522 = { _674,
                    _521 };
    always @(posedge _260) begin
        if (_258)
            _525 <= _1490;
        else
            _525 <= _522;
    end
    assign _2971 = { gnd,
                     _525 };
    assign _2972 = _2971 == _2969;
    assign _2965 = { gnd,
                     _155 };
    always @(posedge _260) begin
        if (_258)
            _2968 <= _1447;
        else
            _2968 <= _2965;
    end
    assign _2960 = 17'b00000000000000001;
    assign _155 = host_lane1_div_int;
    assign _2959 = { gnd,
                     _155 };
    assign _2961 = _2959 - _2960;
    always @(posedge _260) begin
        if (_258)
            _2964 <= _1447;
        else
            _2964 <= _2961;
    end
    assign _157 = host_lane1_div_frac;
    assign _2979 = { gnd,
                     _157 };
    assign _2981 = _2980[7:0];
    assign _2982 = _2977 ? _2981 : _2953;
    assign _2983 = _2950 ? _2982 : _2953;
    assign _2985 = _451 ? _1812 : _2983;
    assign _158 = _2985;
    always @(posedge _260) begin
        if (_258)
            _2953 <= _1812;
        else
            _2953 <= _158;
    end
    assign _2978 = { gnd,
                     _2953 };
    assign _2980 = _2978 + _2979;
    assign _2986 = _2980[8:8];
    assign _2987 = _2977 ? _2986 : _2958;
    assign _2988 = _2950 ? _2987 : _2958;
    assign _2990 = _451 ? _674 : _2988;
    assign _159 = _2990;
    always @(posedge _260) begin
        if (_258)
            _2958 <= _674;
        else
            _2958 <= _159;
    end
    assign _2969 = _2958 ? _2968 : _2964;
    assign _2955 = { gnd,
                     _490 };
    assign _2970 = _2955 == _2969;
    assign _2973 = _518 ? _2972 : _2970;
    assign _2976 = _486 ? _2975 : _2973;
    assign _2954 = ~ _166;
    assign _2977 = _2954 & _2976;
    assign _2999 = _2977 ? _1490 : _2997;
    assign _2949 = ~ _166;
    assign _2947 = _481 & _479;
    assign _609 = _454 == _1728;
    assign _2946 = _456 | _609;
    assign _2948 = _2946 | _2947;
    assign _2950 = _2948 & _2949;
    assign _3000 = _2950 ? _2999 : _490;
    assign _3002 = _451 ? _1490 : _3000;
    assign _160 = _3002;
    always @(posedge _260) begin
        if (_258)
            _490 <= _1490;
        else
            _490 <= _160;
    end
    assign _497 = _490 < _496;
    assign _498 = ~ _497;
    assign _487 = _479 & _483;
    assign _499 = _487 & _498;
    assign _516 = _499 & _515;
    assign _518 = _516 & _517;
    assign _527 = _518 ? _526 : _519;
    assign _162 = host_lane1_code;
    assign _483 = _162 == _1804;
    assign _484 = ~ _483;
    assign _481 = _454 == _1803;
    assign _485 = _481 | _484;
    assign _478 = ~ _166;
    assign _474 = _304[7:7];
    assign _473 = _304[6:6];
    assign _472 = _304[5:5];
    assign _471 = _304[4:4];
    assign _470 = _304[3:3];
    assign _469 = _304[2:2];
    assign _468 = _304[1:1];
    assign _467 = _304[0:0];
    always @* begin
        case (_164)
        0:
            _475 <= _467;
        1:
            _475 <= _468;
        2:
            _475 <= _469;
        3:
            _475 <= _470;
        4:
            _475 <= _471;
        5:
            _475 <= _472;
        6:
            _475 <= _473;
        default:
            _475 <= _474;
        endcase
    end
    assign _465 = _292[7:7];
    assign _464 = _292[6:6];
    assign _463 = _292[5:5];
    assign _462 = _292[4:4];
    assign _461 = _292[3:3];
    assign _460 = _292[2:2];
    assign _459 = _292[1:1];
    assign _458 = _292[0:0];
    assign _164 = host_lane1_data_pin;
    always @* begin
        case (_164)
        0:
            _466 <= _458;
        1:
            _466 <= _459;
        2:
            _466 <= _460;
        3:
            _466 <= _461;
        4:
            _466 <= _462;
        5:
            _466 <= _463;
        6:
            _466 <= _464;
        default:
            _466 <= _465;
        endcase
    end
    assign _476 = _466 ^ _475;
    assign _477 = _168 & _476;
    assign _479 = _477 & _478;
    assign _486 = _479 & _485;
    assign _530 = _486 ? _529 : _527;
    assign _166 = host_lane1_clk_pin_en;
    assign _554 = _166 ? _553 : _530;
    assign _168 = host_lane1_dir;
    assign _457 = _456 & _168;
    assign _555 = _457 & _554;
    assign _3062 = _555 ? _3061 : _3010;
    assign _1561 = _221 == _2212;
    assign _3064 = _1561 ? _2335 : _3062;
    assign _2808 = _221 == _2218;
    assign _3071 = _2808 ? _3070 : _3064;
    assign _451 = _221 == _2206;
    assign _3077 = _451 ? _3076 : _3071;
    assign _448 = _221 == _413;
    assign _449 = _448 | _267;
    assign _3079 = _449 ? _2335 : _3077;
    assign _169 = _3079;
    always @(posedge _260) begin
        if (_258)
            _454 <= _2335;
        else
            _454 <= _169;
    end
    assign _456 = _454 == _1804;
    assign _1564 = _456 & _1563;
    assign _1572 = _1564 & _1571;
    assign _3437 = _1572 & _2701;
    assign _3439 = _3437 & _3438;
    assign _3435 = ~ _989;
    assign _1613 = ~ _220;
    assign _3413 = ~ _218;
    assign _3414 = _220 & _3413;
    assign _3417 = _3414 ? _1803 : _1804;
    assign _3406 = ~ _1630;
    assign _3407 = _1622 & _3406;
    assign _3408 = _621 | _3407;
    assign _3409 = _3408 | _3398;
    assign _3411 = _3409 ? _1804 : _3405;
    assign _3392 = _421 + _440;
    assign _3389 = _421 + _440;
    assign _3385 = vdd == _434;
    assign _3383 = _421 == _410;
    assign _3384 = ~ _3383;
    assign _3386 = _3384 & _3385;
    assign _3390 = _3386 ? _3389 : _440;
    assign _3381 = _198 == _1804;
    assign _3393 = _3381 ? _3392 : _3390;
    assign _3394 = _3393 == _172;
    assign _3375 = _421 + _440;
    assign _3371 = gnd == _434;
    assign _3369 = _421 == _410;
    assign _3370 = ~ _3369;
    assign _3372 = _3370 & _3371;
    assign _3376 = _3372 ? _3375 : _440;
    assign _3367 = _198 == _1804;
    assign _3378 = _3367 ? _410 : _3376;
    assign _3379 = _3378 == _172;
    assign _3395 = _429 ? _3394 : _3379;
    assign _3396 = _418 & _3395;
    assign _3397 = ~ _3396;
    assign _3363 = _1626 == _2564;
    assign _3361 = _1626 == _3019;
    assign _3364 = _2614 ? _3363 : _3361;
    assign _3356 = _1601 + _3742;
    assign _3357 = _3356 == _192;
    assign _3354 = _1601 == _192;
    assign _3358 = _1603 ? _3357 : _3354;
    assign _3352 = ~ _439;
    assign _3353 = _393 & _3352;
    assign _3359 = _3353 & _3358;
    assign _3365 = _3359 & _3364;
    assign _3398 = _3365 & _3397;
    assign _3400 = _3398 ? _1728 : _3351;
    assign _3402 = _439 ? _2335 : _3400;
    assign _3348 = _1630 ? _3346 : _1728;
    assign _3344 = _319 & _317;
    assign _3346 = _3344 ? _1804 : _283;
    assign _3349 = _1622 ? _3348 : _3346;
    assign _3112 = _1630 ? _3111 : _3082;
    assign _3113 = _1622 ? _3112 : _3082;
    assign _170 = _3113;
    always @(posedge _260) begin
        if (_258)
            _3082 <= _674;
        else
            _3082 <= _170;
    end
    assign _3270 = ~ _3111;
    assign _3268 = ~ _405;
    assign _3269 = _3111 ? _405 : _3268;
    always @* begin
        case (_214)
        0:
            _3271 <= _3111;
        1:
            _3271 <= _3269;
        2:
            _3271 <= _3270;
        default:
            _3271 <= _3111;
        endcase
    end
    assign _172 = host_lane0_stuff_len;
    assign _3252 = _421 + _440;
    assign _3253 = _429 ? _3252 : _410;
    assign _3248 = _421 + _440;
    assign _3244 = _429 == _434;
    assign _3242 = _421 == _410;
    assign _3243 = ~ _3242;
    assign _3245 = _3243 & _3244;
    assign _3249 = _3245 ? _3248 : _440;
    assign _3240 = _198 == _1804;
    assign _3254 = _3240 ? _3253 : _3249;
    assign _3255 = _439 ? _3238 : _3254;
    assign _3234 = _421 + _440;
    assign _3235 = _3111 ? _3234 : _410;
    assign _3230 = _421 + _440;
    assign _3108 = _3100[7:7];
    assign _3107 = _3100[6:6];
    assign _3106 = _3100[5:5];
    assign _3105 = _3100[4:4];
    assign _3104 = _3100[3:3];
    assign _3103 = _3100[2:2];
    assign _3102 = _3100[1:1];
    assign _3098 = _3090[7:7];
    assign _3097 = _3090[6:6];
    assign _3096 = _3090[5:5];
    assign _3095 = _3090[4:4];
    assign _3094 = _3090[3:3];
    assign _3093 = _3090[2:2];
    assign _3092 = _3090[1:1];
    assign _2755 = _2711 == _2218;
    assign _2756 = _2708 & _2755;
    always @(posedge _260) begin
        if (_258)
            _2757 <= _1812;
        else
            if (_2756)
                _2757 <= _175;
    end
    assign _2749 = _2711 == _2212;
    assign _2750 = _2708 & _2749;
    always @(posedge _260) begin
        if (_258)
            _2751 <= _1812;
        else
            if (_2750)
                _2751 <= _175;
    end
    assign _2743 = _2711 == _2206;
    assign _2744 = _2708 & _2743;
    always @(posedge _260) begin
        if (_258)
            _2745 <= _1812;
        else
            if (_2744)
                _2745 <= _175;
    end
    assign _2737 = _2711 == _413;
    assign _2738 = _2708 & _2737;
    always @(posedge _260) begin
        if (_258)
            _2739 <= _1812;
        else
            if (_2738)
                _2739 <= _175;
    end
    assign _2731 = _2711 == _664;
    assign _2732 = _2708 & _2731;
    always @(posedge _260) begin
        if (_258)
            _2733 <= _1812;
        else
            if (_2732)
                _2733 <= _175;
    end
    assign _2725 = _2711 == _412;
    assign _2726 = _2708 & _2725;
    always @(posedge _260) begin
        if (_258)
            _2727 <= _1812;
        else
            if (_2726)
                _2727 <= _175;
    end
    assign _2719 = _2711 == _440;
    assign _2720 = _2708 & _2719;
    always @(posedge _260) begin
        if (_258)
            _2721 <= _1812;
        else
            if (_2720)
                _2721 <= _175;
    end
    assign _3115 = _2711 + _440;
    assign _3116 = _2708 ? _3115 : _2711;
    assign _173 = _3116;
    always @(posedge _260) begin
        if (_258)
            _2711 <= _410;
        else
            _2711 <= _173;
    end
    assign _2713 = _2711 == _410;
    assign _2714 = _2708 & _2713;
    assign _175 = host_tx_data;
    always @(posedge _260) begin
        if (_258)
            _2715 <= _1812;
        else
            if (_2714)
                _2715 <= _175;
    end
    assign _3120 = _2704 + _440;
    assign _3121 = _3118 ? _3120 : _2704;
    assign _176 = _3121;
    always @(posedge _260) begin
        if (_258)
            _2704 <= _410;
        else
            _2704 <= _176;
    end
    always @* begin
        case (_2704)
        0:
            _2758 <= _2715;
        1:
            _2758 <= _2721;
        2:
            _2758 <= _2727;
        3:
            _2758 <= _2733;
        4:
            _2758 <= _2739;
        5:
            _2758 <= _2745;
        6:
            _2758 <= _2751;
        default:
            _2758 <= _2757;
        endcase
    end
    assign _3089 = _989 ? _1810 : _2758;
    assign _2267 = _2264[7:1];
    assign _2268 = { _429,
                     _2267 };
    assign _2265 = _2264[6:0];
    assign _2266 = { _2265,
                     _429 };
    assign _2269 = _179 ? _2268 : _2266;
    assign _3126 = _1603 ? _2269 : _3125;
    assign _3127 = _1597 ? _3126 : _3125;
    assign _3128 = _439 ? _3125 : _3127;
    assign _3122 = _1602 ? _3090 : _2264;
    assign _3123 = _423 ? _2264 : _3122;
    assign _3124 = _1630 ? _3123 : _2264;
    assign _3125 = _1622 ? _3124 : _2264;
    assign _3129 = _393 ? _3128 : _3125;
    assign _177 = _3129;
    always @(posedge _260) begin
        if (_258)
            _2264 <= _1812;
        else
            _2264 <= _177;
    end
    assign _3086 = _1606 == _410;
    assign _3083 = ~ _423;
    assign _3084 = _3083 & _1602;
    assign _3087 = _3084 & _3086;
    assign _3090 = _3087 ? _3089 : _2264;
    assign _3091 = _3090[0:0];
    assign _3099 = { _3091,
                     _3092,
                     _3093,
                     _3094,
                     _3095,
                     _3096,
                     _3097,
                     _3098 };
    assign _179 = host_lane0_lsb_first;
    assign _3100 = _179 ? _3090 : _3099;
    assign _3101 = _3100[0:0];
    assign _3137 = _1606 + _440;
    assign _3138 = _1603 ? _3137 : _3135;
    assign _3139 = _1597 ? _3138 : _3135;
    assign _3140 = _439 ? _3135 : _3139;
    assign _3131 = _1606 + _440;
    assign _3132 = _1602 ? _3131 : _1606;
    assign _3133 = _423 ? _1606 : _3132;
    assign _3134 = _1630 ? _3133 : _1606;
    assign _3135 = _1622 ? _3134 : _1606;
    assign _3141 = _393 ? _3140 : _3135;
    assign _3143 = _279 ? _410 : _3141;
    assign _180 = _3143;
    always @(posedge _260) begin
        if (_258)
            _1606 <= _410;
        else
            _1606 <= _180;
    end
    always @* begin
        case (_1606)
        0:
            _3109 <= _3101;
        1:
            _3109 <= _3102;
        2:
            _3109 <= _3103;
        3:
            _3109 <= _3104;
        4:
            _3109 <= _3105;
        5:
            _3109 <= _3106;
        6:
            _3109 <= _3107;
        default:
            _3109 <= _3108;
        endcase
    end
    assign _182 = host_lane0_crc_inv;
    assign _184 = host_lane0_init;
    assign _3185 = _2617[30:0];
    assign _3187 = { _3185,
                     _674 };
    assign _3179 = _2617[31:31];
    assign _3180 = _429 ^ _3179;
    assign _3182 = _3180 ? _189 : _1845;
    assign _3176 = _2617[30:0];
    assign _3178 = { _3176,
                     _674 };
    assign _3183 = _3178 ^ _3182;
    assign _3184 = _1603 ? _3183 : _3175;
    assign _186 = host_lane0_crc_width;
    assign _3153 = _1626 - _2564;
    assign _3154 = _2614 ? _3153 : _3151;
    assign _3155 = _1597 ? _3154 : _3151;
    assign _3156 = _439 ? _3151 : _3155;
    assign _3147 = _1626 - _2564;
    assign _3148 = _1602 ? _1626 : _3147;
    assign _3149 = _423 ? _1626 : _3148;
    assign _3150 = _1630 ? _3149 : _1626;
    assign _3151 = _1622 ? _3150 : _1626;
    assign _3157 = _393 ? _3156 : _3151;
    assign _3158 = _3145 ? _186 : _3157;
    assign _3160 = _279 ? _3019 : _3158;
    assign _187 = _3160;
    always @(posedge _260) begin
        if (_258)
            _1626 <= _3019;
        else
            _1626 <= _187;
    end
    assign _1628 = _1626 == _3019;
    assign _1629 = ~ _1628;
    assign _2612 = ~ _1602;
    assign _2611 = _393 & _1597;
    assign _2613 = _2611 & _2612;
    assign _2614 = _2613 & _1629;
    assign _3188 = _2614 ? _3187 : _3184;
    assign _3189 = _1597 ? _3188 : _3175;
    assign _3190 = _439 ? _3175 : _3189;
    assign _189 = host_lane0_poly;
    assign _3167 = _2617[31:31];
    assign _3168 = _3111 ^ _3167;
    assign _3170 = _3168 ? _189 : _1845;
    assign _3164 = _2617[30:0];
    assign _3166 = { _3164,
                     _674 };
    assign _3171 = _3166 ^ _3170;
    assign _3161 = _2617[30:0];
    assign _3163 = { _3161,
                     _674 };
    assign _3172 = _1602 ? _3171 : _3163;
    assign _3173 = _423 ? _2617 : _3172;
    assign _3174 = _1630 ? _3173 : _2617;
    assign _3175 = _1622 ? _3174 : _2617;
    assign _3191 = _393 ? _3190 : _3175;
    assign _3192 = _279 ? _184 : _3191;
    assign _3194 = _277 ? _1845 : _3192;
    assign _190 = _3194;
    always @(posedge _260) begin
        if (_258)
            _2617 <= _1845;
        else
            _2617 <= _190;
    end
    assign _2618 = _2617[31:31];
    assign _2619 = _2618 ^ _182;
    assign _192 = host_lane0_frame_bits;
    assign _3214 = _1601 + _3742;
    assign _1598 = _393 & _1597;
    assign _1603 = _1598 & _1602;
    assign _3215 = _1603 ? _3214 : _3212;
    assign _1597 = ~ _423;
    assign _3216 = _1597 ? _3215 : _3212;
    assign _3197 = _439 ? _3196 : _429;
    assign _3195 = _1630 ? _3111 : _434;
    assign _3196 = _1622 ? _3195 : _434;
    assign _3198 = _393 ? _3197 : _3196;
    assign _3200 = _279 ? _684 : _3198;
    assign _193 = _3200;
    always @(posedge _260) begin
        if (_258)
            _434 <= vdd;
        else
            _434 <= _193;
    end
    assign _435 = ~ _434;
    assign _431 = _198 == _1803;
    assign _436 = _431 ? _435 : gnd;
    assign _3202 = _214 == _1803;
    assign _3203 = _3202 ? _301 : _427;
    assign _3204 = _393 ? _3203 : _427;
    assign _3206 = _279 ? _684 : _3204;
    assign _194 = _3206;
    always @(posedge _260) begin
        if (_258)
            _427 <= vdd;
        else
            _427 <= _194;
    end
    assign _428 = _301 == _427;
    assign _425 = _214 == _1803;
    assign _429 = _425 ? _428 : _301;
    assign _437 = _429 == _436;
    assign _438 = ~ _437;
    assign _439 = _423 & _438;
    assign _3217 = _439 ? _3212 : _3216;
    assign _3208 = _1601 + _3742;
    assign _3209 = _1602 ? _3208 : _1601;
    assign _3210 = _423 ? _1601 : _3209;
    assign _3211 = _1630 ? _3210 : _1601;
    assign _3212 = _1622 ? _3211 : _1601;
    assign _3218 = _393 ? _3217 : _3212;
    assign _3220 = _279 ? _1490 : _3218;
    assign _195 = _3220;
    always @(posedge _260) begin
        if (_258)
            _1601 <= _1490;
        else
            _1601 <= _195;
    end
    assign _1602 = _1601 < _192;
    assign _3110 = _1602 ? _3109 : _2619;
    assign _3111 = _423 ? _436 : _3110;
    assign _3226 = _3111 == _434;
    assign _3224 = _421 == _410;
    assign _3225 = ~ _3224;
    assign _3227 = _3225 & _3226;
    assign _3231 = _3227 ? _3230 : _440;
    assign _3222 = _198 == _1804;
    assign _3236 = _3222 ? _3235 : _3231;
    assign _3237 = _1630 ? _3236 : _421;
    assign _3238 = _1622 ? _3237 : _421;
    assign _3256 = _393 ? _3255 : _3238;
    assign _3258 = _279 ? _410 : _3256;
    assign _196 = _3258;
    always @(posedge _260) begin
        if (_258)
            _421 <= _410;
        else
            _421 <= _196;
    end
    assign _422 = _421 == _172;
    assign _198 = host_lane0_stuff;
    assign _417 = _198 == _2335;
    assign _418 = ~ _417;
    assign _423 = _418 & _422;
    assign _1623 = _423 | _1602;
    assign _1630 = _1623 | _1629;
    assign _3272 = _1630 ? _3271 : _684;
    assign _3273 = _1622 ? _3272 : _405;
    assign _1618 = _363 == _1490;
    assign _1616 = _328 == _1490;
    assign _1619 = _356 ? _1618 : _1616;
    assign _1620 = _324 ? vdd : _1619;
    assign _1621 = _218 ? _391 : _1620;
    assign _3265 = ~ _1621;
    assign _3262 = _214 == _1804;
    assign _3259 = ~ _220;
    assign _3260 = _285 & _3259;
    assign _3263 = _3260 & _3262;
    assign _3264 = _3263 & _392;
    assign _3266 = _3264 & _3265;
    assign _3274 = _3266 ? _3082 : _3273;
    assign _3276 = _408 ? _684 : _3274;
    assign _3278 = _1611 ? _684 : _3276;
    assign _3280 = _279 ? _684 : _3278;
    assign _3282 = _277 ? _684 : _3280;
    assign _199 = _3282;
    always @(posedge _260) begin
        if (_258)
            _405 <= vdd;
        else
            _405 <= _199;
    end
    assign _406 = _301 == _405;
    assign _407 = ~ _406;
    assign _400 = _214 == _1804;
    assign _401 = ~ _400;
    assign _397 = ~ _218;
    assign _201 = host_lane0_readback;
    assign _394 = ~ _220;
    assign _395 = _285 & _394;
    assign _396 = _395 & _201;
    assign _398 = _396 & _397;
    assign _402 = _398 & _401;
    assign _403 = _402 & _392;
    assign _408 = _403 & _407;
    assign _3351 = _408 ? _2335 : _3349;
    assign _389 = ~ _377;
    assign _390 = _386 & _389;
    assign _385 = _304[7:7];
    assign _384 = _304[6:6];
    assign _383 = _304[5:5];
    assign _382 = _304[4:4];
    assign _381 = _304[3:3];
    assign _380 = _304[2:2];
    assign _379 = _304[1:1];
    assign _378 = _304[0:0];
    always @* begin
        case (_203)
        0:
            _386 <= _378;
        1:
            _386 <= _379;
        2:
            _386 <= _380;
        3:
            _386 <= _381;
        4:
            _386 <= _382;
        5:
            _386 <= _383;
        6:
            _386 <= _384;
        default:
            _386 <= _385;
        endcase
    end
    assign _387 = ~ _386;
    assign _376 = _292[7:7];
    assign _375 = _292[6:6];
    assign _374 = _292[5:5];
    assign _373 = _292[4:4];
    assign _372 = _292[3:3];
    assign _371 = _292[2:2];
    assign _370 = _292[1:1];
    assign _369 = _292[0:0];
    assign _203 = host_lane0_clk_pin;
    always @* begin
        case (_203)
        0:
            _377 <= _369;
        1:
            _377 <= _370;
        2:
            _377 <= _371;
        3:
            _377 <= _372;
        4:
            _377 <= _373;
        5:
            _377 <= _374;
        6:
            _377 <= _375;
        default:
            _377 <= _376;
        endcase
    end
    assign _388 = _377 & _387;
    assign _205 = host_lane0_clk_edge;
    assign _391 = _205 ? _390 : _388;
    assign _367 = _352 == _1490;
    assign _364 = _363 == _352;
    assign _357 = _328 == _352;
    assign _355 = ~ _319;
    assign _346 = _207[15:2];
    assign _347 = { _2335,
                    _346 };
    assign _343 = _207[15:1];
    assign _344 = { _674,
                    _343 };
    assign _348 = _344 + _347;
    assign _340 = _207[15:1];
    assign _341 = { _674,
                    _340 };
    assign _338 = _220 & _321;
    assign _349 = _338 ? _348 : _341;
    always @(posedge _260) begin
        if (_258)
            _352 <= _1490;
        else
            _352 <= _349;
    end
    assign _353 = _328 < _352;
    assign _330 = _207[15:2];
    assign _331 = { _2335,
                    _330 };
    always @(posedge _260) begin
        if (_258)
            _334 <= _1490;
        else
            _334 <= _331;
    end
    assign _3328 = ~ _319;
    assign _3329 = _354 & _3328;
    assign _3330 = _3329 ? _363 : _328;
    assign _3332 = _324 ? _1490 : _3330;
    assign _3334 = _3332 + _3742;
    assign _3312 = _3306 == _1447;
    assign _359 = _207[15:1];
    assign _360 = { _674,
                    _359 };
    always @(posedge _260) begin
        if (_258)
            _363 <= _1490;
        else
            _363 <= _360;
    end
    assign _3308 = { gnd,
                     _363 };
    assign _3309 = _3308 == _3306;
    assign _3302 = { gnd,
                     _207 };
    always @(posedge _260) begin
        if (_258)
            _3305 <= _1447;
        else
            _3305 <= _3302;
    end
    assign _207 = host_lane0_div_int;
    assign _3296 = { gnd,
                     _207 };
    assign _3298 = _3296 - _2960;
    always @(posedge _260) begin
        if (_258)
            _3301 <= _1447;
        else
            _3301 <= _3298;
    end
    assign _209 = host_lane0_div_frac;
    assign _3316 = { gnd,
                     _209 };
    assign _3318 = _3317[7:0];
    assign _3319 = _3314 ? _3318 : _3290;
    assign _3320 = _3287 ? _3319 : _3290;
    assign _3322 = _279 ? _1812 : _3320;
    assign _210 = _3322;
    always @(posedge _260) begin
        if (_258)
            _3290 <= _1812;
        else
            _3290 <= _210;
    end
    assign _3315 = { gnd,
                     _3290 };
    assign _3317 = _3315 + _3316;
    assign _3323 = _3317[8:8];
    assign _3324 = _3314 ? _3323 : _3295;
    assign _3325 = _3287 ? _3324 : _3295;
    assign _3327 = _279 ? _674 : _3325;
    assign _211 = _3327;
    always @(posedge _260) begin
        if (_258)
            _3295 <= _674;
        else
            _3295 <= _211;
    end
    assign _3306 = _3295 ? _3305 : _3301;
    assign _3292 = { gnd,
                     _328 };
    assign _3307 = _3292 == _3306;
    assign _3310 = _356 ? _3309 : _3307;
    assign _3313 = _324 ? _3312 : _3310;
    assign _3291 = ~ _218;
    assign _3314 = _3291 & _3313;
    assign _3336 = _3314 ? _1490 : _3334;
    assign _3286 = ~ _218;
    assign _3284 = _319 & _317;
    assign _621 = _283 == _1728;
    assign _3283 = _285 | _621;
    assign _3285 = _3283 | _3284;
    assign _3287 = _3285 & _3286;
    assign _3337 = _3287 ? _3336 : _328;
    assign _3339 = _279 ? _1490 : _3337;
    assign _212 = _3339;
    always @(posedge _260) begin
        if (_258)
            _328 <= _1490;
        else
            _328 <= _212;
    end
    assign _335 = _328 < _334;
    assign _336 = ~ _335;
    assign _325 = _317 & _321;
    assign _337 = _325 & _336;
    assign _354 = _337 & _353;
    assign _356 = _354 & _355;
    assign _365 = _356 ? _364 : _357;
    assign _214 = host_lane0_code;
    assign _321 = _214 == _1804;
    assign _322 = ~ _321;
    assign _319 = _283 == _1803;
    assign _323 = _319 | _322;
    assign _316 = ~ _218;
    assign _312 = _304[7:7];
    assign _311 = _304[6:6];
    assign _310 = _304[5:5];
    assign _309 = _304[4:4];
    assign _308 = _304[3:3];
    assign _307 = _304[2:2];
    assign _306 = _304[1:1];
    assign _305 = _304[0:0];
    always @* begin
        case (_216)
        0:
            _313 <= _305;
        1:
            _313 <= _306;
        2:
            _313 <= _307;
        3:
            _313 <= _308;
        4:
            _313 <= _309;
        5:
            _313 <= _310;
        6:
            _313 <= _311;
        default:
            _313 <= _312;
        endcase
    end
    assign _300 = _292[7:7];
    assign _299 = _292[6:6];
    assign _298 = _292[5:5];
    assign _297 = _292[4:4];
    assign _296 = _292[3:3];
    assign _295 = _292[2:2];
    assign _294 = _292[1:1];
    assign _293 = _292[0:0];
    assign _216 = host_lane0_data_pin;
    always @* begin
        case (_216)
        0:
            _301 <= _293;
        1:
            _301 <= _294;
        2:
            _301 <= _295;
        3:
            _301 <= _296;
        4:
            _301 <= _297;
        5:
            _301 <= _298;
        6:
            _301 <= _299;
        default:
            _301 <= _300;
        endcase
    end
    assign _314 = _301 ^ _313;
    assign _315 = _220 & _314;
    assign _317 = _315 & _316;
    assign _324 = _317 & _323;
    assign _368 = _324 ? _367 : _365;
    assign _218 = host_lane0_clk_pin_en;
    assign _392 = _218 ? _391 : _368;
    assign _220 = host_lane0_dir;
    assign _286 = _285 & _220;
    assign _393 = _286 & _392;
    assign _3403 = _393 ? _3402 : _3351;
    assign _1611 = _221 == _412;
    assign _3405 = _1611 ? _2335 : _3403;
    assign _3145 = _221 == _664;
    assign _3412 = _3145 ? _3411 : _3405;
    assign _279 = _221 == _440;
    assign _3418 = _279 ? _3417 : _3412;
    assign _2385 = _1074[90:88];
    assign _2384 = _1068[90:88];
    assign _2383 = _1062[90:88];
    assign _2382 = _703[90:88];
    always @* begin
        case (f_winner)
        0:
            _2386 <= _2382;
        1:
            _2386 <= _2383;
        2:
            _2386 <= _2384;
        default:
            _2386 <= _2385;
        endcase
    end
    assign _2378 = _1074[87:87];
    assign _2377 = _1068[87:87];
    assign _2376 = _1062[87:87];
    assign _2375 = _703[87:87];
    always @* begin
        case (f_winner)
        0:
            _2379 <= _2375;
        1:
            _2379 <= _2376;
        2:
            _2379 <= _2377;
        default:
            _2379 <= _2378;
        endcase
    end
    assign _3340 = ~ _2379;
    assign _3341 = _1507 & _3340;
    assign _3343 = _3341 ? _2386 : _410;
    assign _221 = _3343;
    assign _276 = _221 == _413;
    assign _277 = _276 | _267;
    assign _3420 = _277 ? _2335 : _3418;
    assign _222 = _3420;
    always @(posedge _260) begin
        if (_258)
            _283 <= _2335;
        else
            _283 <= _222;
    end
    assign _285 = _283 == _1804;
    assign _1614 = _285 & _1613;
    assign _1622 = _1614 & _1621;
    assign _3434 = _1622 & _3087;
    assign _3436 = _3434 & _3435;
    assign _3440 = _3436 | _3439;
    assign _3431 = _3427 == _1804;
    assign _3429 = _3427 == _1803;
    assign _3432 = _3429 | _3431;
    assign _3433 = _1657 & _3432;
    assign _3441 = _3433 | _3440;
    assign _223 = _3441;
    assign _3118 = _223 & _3117;
    assign _2331 = _226 == _1534;
    assign _2707 = ~ _2331;
    assign _225 = host_tx_push;
    assign _2708 = _225 & _2707;
    assign _3442 = _2708 ^ _3118;
    assign _3448 = _3442 ? _3447 : _226;
    always @(posedge _260) begin
        if (_258)
            _3451 <= _1742;
        else
            _3451 <= _3448;
    end
    assign _226 = _3451;
    assign _989 = _226 == _1742;
    assign _3453 = _989 ? _1810 : _2758;
    assign _3426 = _1057[28:27];
    assign _3424 = _1074[95:94];
    assign _3423 = _1068[95:94];
    assign _3422 = _1062[95:94];
    assign _3421 = _703[95:94];
    always @* begin
        case (f_winner)
        0:
            _3425 <= _3421;
        1:
            _3425 <= _3422;
        2:
            _3425 <= _3423;
        default:
            _3425 <= _3424;
        endcase
    end
    assign _3427 = _1656 ? _3426 : _3425;
    always @* begin
        case (_3427)
        0:
            _3465 <= _982;
        1:
            _3465 <= _3453;
        2:
            _3465 <= _3462;
        default:
            _3465 <= _3464;
        endcase
    end
    assign _3466 = _1657 ? _3465 : _982;
    assign _227 = _3466;
    always @(posedge _260) begin
        if (_258)
            _982 <= _1812;
        else
            _982 <= _227;
    end
    assign _983 = _982[0:0];
    assign _3477 = 8'b00001000;
    assign _3476 = 8'b00000111;
    assign _3474 = 8'b00000001;
    assign _3475 = _977 - _3474;
    assign _3472 = _1057[30:29];
    assign _3470 = _1074[99:98];
    assign _3469 = _1068[99:98];
    assign _3468 = _1062[99:98];
    assign _3467 = _703[99:98];
    always @* begin
        case (f_winner)
        0:
            _3471 <= _3467;
        1:
            _3471 <= _3468;
        2:
            _3471 <= _3469;
        default:
            _3471 <= _3470;
        endcase
    end
    assign _3473 = _1656 ? _3472 : _3471;
    always @* begin
        case (_3473)
        0:
            _3478 <= _977;
        1:
            _3478 <= _3475;
        2:
            _3478 <= _3476;
        default:
            _3478 <= _3477;
        endcase
    end
    assign _3479 = _1657 ? _3478 : _977;
    assign _228 = _3479;
    always @(posedge _260) begin
        if (_258)
            _977 <= _1812;
        else
            _977 <= _228;
    end
    assign _979 = _977 == _1812;
    assign _1179 = _1062[61:58];
    always @* begin
        case (_1179)
        0:
            _1180 <= vdd;
        1:
            _1180 <= _979;
        2:
            _1180 <= _983;
        3:
            _1180 <= _987;
        4:
            _1180 <= _989;
        5:
            _1180 <= _991;
        6:
            _1180 <= _995;
        7:
            _1180 <= _998;
        8:
            _1180 <= _621;
        9:
            _1180 <= _624;
        10:
            _1180 <= _627;
        11:
            _1180 <= _630;
        12:
            _1180 <= _609;
        13:
            _1180 <= _612;
        14:
            _1180 <= _615;
        default:
            _1180 <= _618;
        endcase
    end
    assign _1182 = _1180 ^ _1181;
    assign _1174 = _1062[57:42];
    assign _1176 = _1174 == _1756;
    assign _1165 = _1111[57:42];
    assign _1166 = { gnd,
                     _1165 };
    assign _1167 = _1166 + _1154;
    always @(posedge _260) begin
        if (_258)
            _1170 <= _1447;
        else
            _1170 <= _1167;
    end
    assign _1171 = _1170 < _1110;
    assign _1172 = ~ _1171;
    assign _1161 = _1062[41:26];
    assign _1163 = _1161 == _1490;
    assign _937 = _933 + _440;
    assign _3494 = _933 + _440;
    assign _3490 = _933 == _2218;
    assign _3491 = ~ _3490;
    assign _3488 = _717[0:0];
    assign _3492 = _3488 & _3491;
    assign _3495 = _3492 ? _3494 : _933;
    assign _3485 = _717[0:0];
    assign _3486 = ~ _3485;
    assign _3484 = f_chg_now[0:0];
    assign _3487 = _3484 & _3486;
    assign _3497 = _3487 ? _440 : _3495;
    assign _3481 = _638 == _1804;
    assign _3483 = _3481 ? _410 : _933;
    assign _3480 = _638 == _1803;
    assign _3498 = _3480 ? _3497 : _3483;
    assign _229 = _3498;
    always @(posedge _260) begin
        if (_258)
            _933 <= _410;
        else
            _933 <= _229;
    end
    assign _935 = _933 == _2218;
    assign _938 = _935 ? _933 : _937;
    assign _928 = _717[0:0];
    assign _929 = ~ _928;
    assign _927 = f_chg_now[0:0];
    assign _930 = _927 & _929;
    assign _940 = _930 ? _440 : _938;
    assign _924 = f_changed_all[0:0];
    assign _925 = f_in_fetch & _924;
    assign _941 = _925 ? _940 : _410;
    assign _1145 = _1115[0:0];
    assign _1147 = _1145 ? _941 : _410;
    assign _916 = _912 + _440;
    assign _3513 = _912 + _440;
    assign _3509 = _912 == _2218;
    assign _3510 = ~ _3509;
    assign _3507 = _717[1:1];
    assign _3511 = _3507 & _3510;
    assign _3514 = _3511 ? _3513 : _912;
    assign _3504 = _717[1:1];
    assign _3505 = ~ _3504;
    assign _3503 = f_chg_now[1:1];
    assign _3506 = _3503 & _3505;
    assign _3516 = _3506 ? _440 : _3514;
    assign _3500 = _638 == _1804;
    assign _3502 = _3500 ? _410 : _912;
    assign _3499 = _638 == _1803;
    assign _3517 = _3499 ? _3516 : _3502;
    assign _230 = _3517;
    always @(posedge _260) begin
        if (_258)
            _912 <= _410;
        else
            _912 <= _230;
    end
    assign _914 = _912 == _2218;
    assign _917 = _914 ? _912 : _916;
    assign _907 = _717[1:1];
    assign _908 = ~ _907;
    assign _906 = f_chg_now[1:1];
    assign _909 = _906 & _908;
    assign _919 = _909 ? _440 : _917;
    assign _903 = f_changed_all[1:1];
    assign _904 = f_in_fetch & _903;
    assign _920 = _904 ? _919 : _410;
    assign _1142 = _1115[1:1];
    assign _1144 = _1142 ? _920 : _410;
    assign _1148 = _1144 < _1147;
    assign _1149 = _1148 ? _1147 : _1144;
    assign _893 = _889 + _440;
    assign _3532 = _889 + _440;
    assign _3528 = _889 == _2218;
    assign _3529 = ~ _3528;
    assign _3526 = _717[2:2];
    assign _3530 = _3526 & _3529;
    assign _3533 = _3530 ? _3532 : _889;
    assign _3523 = _717[2:2];
    assign _3524 = ~ _3523;
    assign _3522 = f_chg_now[2:2];
    assign _3525 = _3522 & _3524;
    assign _3535 = _3525 ? _440 : _3533;
    assign _3519 = _638 == _1804;
    assign _3521 = _3519 ? _410 : _889;
    assign _3518 = _638 == _1803;
    assign _3536 = _3518 ? _3535 : _3521;
    assign _231 = _3536;
    always @(posedge _260) begin
        if (_258)
            _889 <= _410;
        else
            _889 <= _231;
    end
    assign _891 = _889 == _2218;
    assign _894 = _891 ? _889 : _893;
    assign _884 = _717[2:2];
    assign _885 = ~ _884;
    assign _883 = f_chg_now[2:2];
    assign _886 = _883 & _885;
    assign _896 = _886 ? _440 : _894;
    assign _880 = f_changed_all[2:2];
    assign _881 = f_in_fetch & _880;
    assign _897 = _881 ? _896 : _410;
    assign _1137 = _1115[2:2];
    assign _1139 = _1137 ? _897 : _410;
    assign _872 = _868 + _440;
    assign _3551 = _868 + _440;
    assign _3547 = _868 == _2218;
    assign _3548 = ~ _3547;
    assign _3545 = _717[3:3];
    assign _3549 = _3545 & _3548;
    assign _3552 = _3549 ? _3551 : _868;
    assign _3542 = _717[3:3];
    assign _3543 = ~ _3542;
    assign _3541 = f_chg_now[3:3];
    assign _3544 = _3541 & _3543;
    assign _3554 = _3544 ? _440 : _3552;
    assign _3538 = _638 == _1804;
    assign _3540 = _3538 ? _410 : _868;
    assign _3537 = _638 == _1803;
    assign _3555 = _3537 ? _3554 : _3540;
    assign _232 = _3555;
    always @(posedge _260) begin
        if (_258)
            _868 <= _410;
        else
            _868 <= _232;
    end
    assign _870 = _868 == _2218;
    assign _873 = _870 ? _868 : _872;
    assign _863 = _717[3:3];
    assign _864 = ~ _863;
    assign _862 = f_chg_now[3:3];
    assign _865 = _862 & _864;
    assign _875 = _865 ? _440 : _873;
    assign _859 = f_changed_all[3:3];
    assign _860 = f_in_fetch & _859;
    assign _876 = _860 ? _875 : _410;
    assign _1134 = _1115[3:3];
    assign _1136 = _1134 ? _876 : _410;
    assign _1140 = _1136 < _1139;
    assign _1141 = _1140 ? _1139 : _1136;
    assign _1150 = _1141 < _1149;
    assign _1151 = _1150 ? _1149 : _1141;
    assign _847 = _843 + _440;
    assign _3570 = _843 + _440;
    assign _3566 = _843 == _2218;
    assign _3567 = ~ _3566;
    assign _3564 = _717[4:4];
    assign _3568 = _3564 & _3567;
    assign _3571 = _3568 ? _3570 : _843;
    assign _3561 = _717[4:4];
    assign _3562 = ~ _3561;
    assign _3560 = f_chg_now[4:4];
    assign _3563 = _3560 & _3562;
    assign _3573 = _3563 ? _440 : _3571;
    assign _3557 = _638 == _1804;
    assign _3559 = _3557 ? _410 : _843;
    assign _3556 = _638 == _1803;
    assign _3574 = _3556 ? _3573 : _3559;
    assign _233 = _3574;
    always @(posedge _260) begin
        if (_258)
            _843 <= _410;
        else
            _843 <= _233;
    end
    assign _845 = _843 == _2218;
    assign _848 = _845 ? _843 : _847;
    assign _838 = _717[4:4];
    assign _839 = ~ _838;
    assign _837 = f_chg_now[4:4];
    assign _840 = _837 & _839;
    assign _850 = _840 ? _440 : _848;
    assign _834 = f_changed_all[4:4];
    assign _835 = f_in_fetch & _834;
    assign _851 = _835 ? _850 : _410;
    assign _1127 = _1115[4:4];
    assign _1129 = _1127 ? _851 : _410;
    assign _826 = _822 + _440;
    assign _3589 = _822 + _440;
    assign _3585 = _822 == _2218;
    assign _3586 = ~ _3585;
    assign _3583 = _717[5:5];
    assign _3587 = _3583 & _3586;
    assign _3590 = _3587 ? _3589 : _822;
    assign _3580 = _717[5:5];
    assign _3581 = ~ _3580;
    assign _3579 = f_chg_now[5:5];
    assign _3582 = _3579 & _3581;
    assign _3592 = _3582 ? _440 : _3590;
    assign _3576 = _638 == _1804;
    assign _3578 = _3576 ? _410 : _822;
    assign _3575 = _638 == _1803;
    assign _3593 = _3575 ? _3592 : _3578;
    assign _234 = _3593;
    always @(posedge _260) begin
        if (_258)
            _822 <= _410;
        else
            _822 <= _234;
    end
    assign _824 = _822 == _2218;
    assign _827 = _824 ? _822 : _826;
    assign _817 = _717[5:5];
    assign _818 = ~ _817;
    assign _816 = f_chg_now[5:5];
    assign _819 = _816 & _818;
    assign _829 = _819 ? _440 : _827;
    assign _813 = f_changed_all[5:5];
    assign _814 = f_in_fetch & _813;
    assign _830 = _814 ? _829 : _410;
    assign _1124 = _1115[5:5];
    assign _1126 = _1124 ? _830 : _410;
    assign _1130 = _1126 < _1129;
    assign _1131 = _1130 ? _1129 : _1126;
    assign _803 = _799 + _440;
    assign _3608 = _799 + _440;
    assign _3604 = _799 == _2218;
    assign _3605 = ~ _3604;
    assign _3602 = _717[6:6];
    assign _3606 = _3602 & _3605;
    assign _3609 = _3606 ? _3608 : _799;
    assign _3599 = _717[6:6];
    assign _3600 = ~ _3599;
    assign _3598 = f_chg_now[6:6];
    assign _3601 = _3598 & _3600;
    assign _3611 = _3601 ? _440 : _3609;
    assign _3595 = _638 == _1804;
    assign _3597 = _3595 ? _410 : _799;
    assign _3594 = _638 == _1803;
    assign _3612 = _3594 ? _3611 : _3597;
    assign _235 = _3612;
    always @(posedge _260) begin
        if (_258)
            _799 <= _410;
        else
            _799 <= _235;
    end
    assign _801 = _799 == _2218;
    assign _804 = _801 ? _799 : _803;
    assign _794 = _717[6:6];
    assign _795 = ~ _794;
    assign _793 = f_chg_now[6:6];
    assign _796 = _793 & _795;
    assign _806 = _796 ? _440 : _804;
    assign _790 = f_changed_all[6:6];
    assign _791 = f_in_fetch & _790;
    assign _807 = _791 ? _806 : _410;
    assign _1119 = _1115[6:6];
    assign _1121 = _1119 ? _807 : _410;
    assign _782 = _778 + _440;
    assign _3627 = _778 + _440;
    assign _3623 = _778 == _2218;
    assign _3624 = ~ _3623;
    assign _3621 = _717[7:7];
    assign _3625 = _3621 & _3624;
    assign _3628 = _3625 ? _3627 : _778;
    assign _3618 = _717[7:7];
    assign _3619 = ~ _3618;
    assign _3617 = f_chg_now[7:7];
    assign _3620 = _3617 & _3619;
    assign _3630 = _3620 ? _440 : _3628;
    assign _3614 = _638 == _1804;
    assign _3616 = _3614 ? _410 : _778;
    assign _3613 = _638 == _1803;
    assign _3631 = _3613 ? _3630 : _3616;
    assign _236 = _3631;
    always @(posedge _260) begin
        if (_258)
            _778 <= _410;
        else
            _778 <= _236;
    end
    assign _780 = _778 == _2218;
    assign _783 = _780 ? _778 : _782;
    assign _773 = _717[7:7];
    assign _774 = ~ _773;
    assign _772 = f_chg_now[7:7];
    assign _775 = _772 & _774;
    assign _785 = _775 ? _440 : _783;
    assign _769 = f_changed_all[7:7];
    assign _770 = f_in_fetch & _769;
    assign _786 = _770 ? _785 : _410;
    assign _1115 = _1111[23:16];
    assign _1116 = _1115[7:7];
    assign _1118 = _1116 ? _786 : _410;
    assign _1122 = _1118 < _1121;
    assign _1123 = _1122 ? _1121 : _1118;
    assign _1132 = _1123 < _1131;
    assign _1133 = _1132 ? _1131 : _1123;
    assign _1152 = _1133 < _1151;
    assign _1153 = _1152 ? _1151 : _1133;
    assign _1154 = { _1392,
                     _1153 };
    assign _3634 = _744 == _440;
    assign _3635 = _3634 ? _252 : _701;
    assign _3632 = _638 == _1803;
    assign _3636 = _3632 ? _3635 : _701;
    assign _237 = _3636;
    always @(posedge _260) begin
        if (_258)
            _701 <= _691;
        else
            _701 <= _237;
    end
    assign _758 = _744 == _440;
    assign _759 = f_in_fetch & _758;
    assign _760 = _759 ? _252 : _701;
    assign _3639 = _744 == _412;
    assign _3640 = _3639 ? _252 : _698;
    assign _3637 = _638 == _1803;
    assign _3641 = _3637 ? _3640 : _698;
    assign _238 = _3641;
    always @(posedge _260) begin
        if (_258)
            _698 <= _691;
        else
            _698 <= _238;
    end
    assign _754 = _744 == _412;
    assign _755 = f_in_fetch & _754;
    assign _756 = _755 ? _252 : _698;
    assign _3644 = _744 == _664;
    assign _3645 = _3644 ? _252 : _695;
    assign _3642 = _638 == _1803;
    assign _3646 = _3642 ? _3645 : _695;
    assign _239 = _3646;
    always @(posedge _260) begin
        if (_258)
            _695 <= _691;
        else
            _695 <= _239;
    end
    assign _750 = _744 == _664;
    assign _751 = f_in_fetch & _750;
    assign _752 = _751 ? _252 : _695;
    assign _640 = _638 == _2335;
    assign _241 = host_rec_we;
    assign _3673 = _241 & _640;
    assign _243 = host_rec_wdata;
    always @(posedge _260) begin
        if (_3673)
            _3674[_3672] <= _243;
    end
    assign _3670 = _744[1:0];
    assign _245 = host_start_loc;
    assign _1074 = _702[511:400];
    assign _3659 = _1074[110:105];
    assign _1068 = _702[399:288];
    assign _3658 = _1068[110:105];
    assign _3657 = _1062[110:105];
    assign _3656 = _703[110:105];
    always @* begin
        case (f_winner)
        0:
            _3660 <= _3656;
        1:
            _3660 <= _3657;
        2:
            _3660 <= _3658;
        default:
            _3660 <= _3659;
        endcase
    end
    assign _3661 = _3660 == _1512;
    assign _3662 = ~ _3661;
    assign _3663 = _3662 ? _3660 : _1512;
    assign _247 = host_recover_loc;
    assign _3650 = _270 ? _247 : _3649;
    assign _248 = _3650;
    always @(posedge _260) begin
        if (_258)
            _3649 <= _3019;
        else
            _3649 <= _248;
    end
    assign f_policy = _1057[59:58];
    assign _3653 = f_policy == _1804;
    assign _3654 = _3653 ? _3649 : _1512;
    assign _3655 = f_viol_now ? _3654 : _1512;
    assign _3664 = _1507 ? _3663 : _3655;
    assign _3651 = _638 == _1804;
    assign _3665 = _3651 ? _3664 : _1512;
    assign _3666 = _270 ? _245 : _3665;
    assign _249 = _3666;
    always @(posedge _260) begin
        if (_258)
            _1512 <= _3019;
        else
            _1512 <= _249;
    end
    assign _3671 = { _1512,
                     _3670 };
    assign _251 = host_rec_waddr;
    assign _3668 = _744 < _413;
    assign _3669 = f_in_fetch & _3668;
    assign _3672 = _3669 ? _3671 : _251;
    assign _3675 = _3674[_3672];
    always @(posedge _260) begin
        if (_3669)
            _3678 <= _3675;
    end
    assign _252 = _3678;
    assign _746 = _744 == _413;
    assign _747 = f_in_fetch & _746;
    assign _748 = _747 ? _252 : _692;
    assign _761 = { _748,
                    _752,
                    _756,
                    _760 };
    assign _1111 = _761[287:176];
    assign _1112 = _1111[41:26];
    assign _1113 = { gnd,
                     _1112 };
    assign _1155 = _1113 + _1154;
    always @(posedge _260) begin
        if (_258)
            _1158 <= _1447;
        else
            _1158 <= _1155;
    end
    assign gnd = 1'b0;
    assign _1110 = { gnd,
                     _1107 };
    assign _1159 = _1110 < _1158;
    assign _1160 = ~ _1159;
    assign _1164 = _1160 | _1163;
    assign _1173 = _1164 & _1172;
    assign _3706 = _735 + _3742;
    assign _3702 = _735 == _1756;
    assign _3703 = ~ _3702;
    assign _3704 = _3700 & _3703;
    assign _3707 = _3704 ? _3706 : _735;
    assign _3686 = _3685[2:2];
    assign _3687 = _1657 & _3686;
    assign _3709 = _3687 ? _1490 : _3707;
    assign _3711 = _270 ? _1490 : _3709;
    assign _253 = _3711;
    always @(posedge _260) begin
        if (_258)
            _735 <= _1490;
        else
            _735 <= _253;
    end
    assign _3723 = _732 + _3742;
    assign _3719 = _732 == _1756;
    assign _3720 = ~ _3719;
    assign _3698 = 9'b111111111;
    assign _3699 = _3691 == _3698;
    assign _3696 = 6'b111111;
    assign _3695 = _3691[5:0];
    assign _3697 = _3695 == _3696;
    assign _3690 = 9'b000000000;
    assign _3712 = 9'b000000001;
    assign _3713 = _3691 + _3712;
    assign _3715 = _270 ? _3690 : _3713;
    assign _254 = _3715;
    always @(posedge _260) begin
        if (_258)
            _3691 <= _3690;
        else
            _3691 <= _254;
    end
    assign _3692 = _3691[2:0];
    assign _3694 = _3692 == _2218;
    assign _3688 = _1057[63:62];
    always @* begin
        case (_3688)
        0:
            _3700 <= vdd;
        1:
            _3700 <= _3694;
        2:
            _3700 <= _3697;
        default:
            _3700 <= _3699;
        endcase
    end
    assign _3721 = _3700 & _3720;
    assign _3724 = _3721 ? _3723 : _732;
    assign _3716 = _3685[1:1];
    assign _3717 = _1657 & _3716;
    assign _3726 = _3717 ? _1490 : _3724;
    assign _3728 = _270 ? _1490 : _3726;
    assign _255 = _3728;
    always @(posedge _260) begin
        if (_258)
            _732 <= _1490;
        else
            _732 <= _255;
    end
    assign _1106 = _1062[25:24];
    always @* begin
        case (_1106)
        0:
            _1107 <= _729;
        1:
            _1107 <= _732;
        2:
            _1107 <= _735;
        default:
            _1107 <= _735;
        endcase
    end
    assign _1109 = _1107 == _1756;
    assign _1177 = _1109 ? _1176 : _1173;
    always @(posedge _260) begin
        if (_258)
            _304 <= _1812;
        else
            _304 <= _292;
    end
    assign f_chg_now = _292 ^ _304;
    assign _3730 = _638 == _1804;
    assign _3732 = _3730 ? _1812 : _717;
    assign _3729 = _638 == _1803;
    assign _3733 = _3729 ? f_changed_all : _3732;
    assign _3735 = _270 ? _1812 : _3733;
    assign _256 = _3735;
    always @(posedge _260) begin
        if (_258)
            _717 <= _1812;
        else
            _717 <= _256;
    end
    assign f_changed_all = _717 | f_chg_now;
    assign _1100 = f_changed_all & f_chgmask1;
    assign _1102 = _1100 == _1812;
    assign _1103 = ~ _1102;
    assign f_chgmask1 = _1062[23:16];
    assign _1099 = f_chgmask1 == _1812;
    assign _1104 = _1099 | _1103;
    assign _1093 = _1062[7:0];
    assign _1091 = _1062[15:8];
    assign vdd = 1'b1;
    assign _258 = clear;
    assign _260 = clock;
    assign _262 = pins_in;
    always @(posedge _260) begin
        if (_258)
            _289 <= _1812;
        else
            _289 <= _262;
    end
    always @(posedge _260) begin
        if (_258)
            _292 <= _1812;
        else
            _292 <= _289;
    end
    assign _1092 = _292 ^ _1091;
    assign _1094 = _1092 & _1093;
    assign _1096 = _1094 == _1812;
    assign _1062 = _702[287:176];
    assign f_valid1 = _1062[111:111];
    assign _1097 = f_valid1 & _1096;
    assign _1105 = _1097 & _1104;
    assign _1178 = _1105 & _1177;
    assign _1183 = _1178 & _1182;
    assign _1222 = _1183 & _1221;
    assign _1223 = f_in_eval & _1222;
    assign _1227 = _1223 & _1226;
    assign f_fire1 = _1227 & _1089;
    assign _1517 = f_fire1 ? _1803 : _1515;
    assign f_winner = f_fire0 ? _2335 : _1517;
    always @* begin
        case (f_winner)
        0:
            _3683 <= _3679;
        1:
            _3683 <= _3680;
        2:
            _3683 <= _3681;
        default:
            _3683 <= _3682;
        endcase
    end
    assign _3685 = _1656 ? _3684 : _3683;
    assign _3736 = _3685[0:0];
    assign _3737 = _1657 & _3736;
    assign _3746 = _3737 ? _1490 : _3744;
    assign _3748 = _270 ? _1490 : _3746;
    assign _263 = _3748;
    always @(posedge _260) begin
        if (_258)
            _729 <= _1490;
        else
            _729 <= _263;
    end
    assign _1708 = _1057[33:32];
    always @* begin
        case (_1708)
        0:
            _1709 <= _729;
        1:
            _1709 <= _732;
        2:
            _1709 <= _735;
        default:
            _1709 <= _735;
        endcase
    end
    assign _1707 = _1057[49:34];
    assign _1710 = _1707 < _1709;
    assign _1057 = _702[63:0];
    assign _1705 = _1057[31:31];
    assign _1703 = ~ _1507;
    assign _1704 = f_in_eval & _1703;
    assign _1706 = _1704 & _1705;
    assign _1711 = _1706 & _1710;
    assign _1716 = _1711 & _1715;
    assign _1724 = _1716 | f_unexp_now;
    assign f_viol_now = _1724 | f_amb_now;
    assign _3754 = f_viol_now ? _3753 : _744;
    assign _3757 = _1507 ? _3756 : _3754;
    assign _3750 = _638 == _1804;
    assign _3758 = _3750 ? _3757 : _744;
    assign _3749 = _638 == _1803;
    assign _3761 = _3749 ? _3760 : _3758;
    assign _3763 = _270 ? _410 : _3761;
    assign _264 = _3763;
    always @(posedge _260) begin
        if (_258)
            _744 <= _410;
        else
            _744 <= _264;
    end
    assign _3766 = _744 == _413;
    assign _3767 = _3766 ? _252 : _692;
    assign _3764 = _638 == _1803;
    assign _3768 = _3764 ? _3767 : _692;
    assign _265 = _3768;
    always @(posedge _260) begin
        if (_258)
            _692 <= _691;
        else
            _692 <= _265;
    end
    assign _702 = { _692,
                    _695,
                    _698,
                    _701 };
    assign _703 = _702[175:64];
    assign f_valid0 = _703[111:111];
    assign _711 = f_valid0 & _710;
    assign _725 = _711 & _724;
    assign _973 = _725 & _972;
    assign _1002 = _973 & _1001;
    assign _1046 = _1002 & _1045;
    assign f_in_eval = _638 == _1804;
    assign _1047 = f_in_eval & _1046;
    assign _1056 = _1047 & _1055;
    assign f_fire0 = _1056 & _1089;
    assign _1229 = f_fire0 | f_fire1;
    assign _1368 = _1229 | f_fire2;
    assign _1507 = _1368 | f_fire3;
    assign _3787 = _1507 ? _3786 : _3784;
    assign _3772 = _638 == _1728;
    assign _3774 = _3772 ? _2335 : _638;
    assign _3770 = _638 == _1804;
    assign _3788 = _3770 ? _3787 : _3774;
    assign _3769 = _638 == _1803;
    assign _3791 = _3769 ? _3790 : _3788;
    assign _267 = host_stop;
    assign _3793 = _267 ? _2335 : _3791;
    assign _3795 = _270 ? _1803 : _3793;
    assign _268 = _3795;
    always @(posedge _260) begin
        if (_258)
            _638 <= _2335;
        else
            _638 <= _268;
    end
    assign f_in_fetch = _638 == _1803;
    assign _1656 = f_in_fetch & _1655;
    assign _1657 = _1656 | _1507;
    assign _2352 = _1657 & _2351;
    assign _3817 = _2352 ? _3816 : _2416;
    assign _270 = host_start;
    assign _3819 = _270 ? _1812 : _3817;
    assign _271 = _3819;
    always @(posedge _260) begin
        if (_258)
            _2416 <= _1812;
        else
            _2416 <= _271;
    end
    assign _2417 = _2416[7:7];
    assign _273 = host_pin_src;
    assign _2413 = _273[23:21];
    always @* begin
        case (_2413)
        0:
            _2424 <= _2417;
        1:
            _2424 <= _405;
        2:
            _2424 <= _2418;
        3:
            _2424 <= _2419;
        4:
            _2424 <= _2421;
        5:
            _2424 <= _567;
        6:
            _2424 <= _2422;
        default:
            _2424 <= _2423;
        endcase
    end
    assign _2488 = { _2424,
                     _2433,
                     _2442,
                     _2451,
                     _2460,
                     _2469,
                     _2478,
                     _2487 };
    assign _3821 = _2488 & _3820;
    assign pins_out = _3821;
    assign pins_oe = _2491;
    assign st_running = _2348;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1512;
    assign st_accepting = _2347;
    assign st_taken = _2345;
    assign st_taken_edge = _2342;
    assign st_viol = _2339;
    assign st_viol_kind = _2336;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _2331;
    assign st_tx_empty = _989;
    assign st_rx_data = _2329;
    assign st_rx_empty = _1740;
    assign st_vlog_data = _2222;
    assign st_vlog_empty = _1743;
    assign st_cov_rdata = _1851;
    assign st_irq = _1747;
    assign st_halted_viol = _1689;
    assign st_rx_overflow = _1682;
    assign st_vlog_overflow = _1539;
    assign st_cov_overrun = _1529;
    assign st_host_err = _675;
    assign st_host_err_cause = _680;
    assign st_lane_active = _635;
    assign st_lane_status = _632;

endmodule
