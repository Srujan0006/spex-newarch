module spex_sim_top (
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
    st_lane_status
);

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
    output [15:0] st_lane_status;

    wire [2:0] _397;
    wire [2:0] _427;
    wire [2:0] _428;
    wire [2:0] _400;
    wire [2:0] _399;
    wire [2:0] _401;
    wire [2:0] _402;
    wire [2:0] _429;
    wire [2:0] _431;
    wire [2:0] _433;
    wire [2:0] _1;
    reg [2:0] _398;
    wire [7:0] _617;
    wire [2:0] _588;
    wire [2:0] _562;
    wire [2:0] _563;
    wire [2:0] _589;
    wire [2:0] _591;
    wire [2:0] _593;
    wire [2:0] _2;
    reg [2:0] _559;
    wire [7:0] _605;
    wire [15:0] _618;
    wire _1465;
    wire _1467;
    wire _1461;
    wire _1462;
    wire _1446;
    wire _1463;
    wire _1468;
    wire _1470;
    wire _4;
    reg _1466;
    wire _1473;
    wire _1478;
    wire _1480;
    wire _6;
    reg _1476;
    wire _1612;
    wire _1605;
    wire _1613;
    wire _1586;
    wire _1533;
    wire _1587;
    wire _1614;
    wire _8;
    wire _1615;
    wire _1616;
    wire _1621;
    wire _1623;
    wire _9;
    reg _1619;
    wire _1627;
    wire _1628;
    wire _1633;
    wire _13;
    wire _1635;
    wire _1637;
    wire _14;
    reg _1631;
    wire _1666;
    wire _1668;
    wire _1664;
    wire _1670;
    wire _1671;
    wire _1672;
    wire _1639;
    wire _1673;
    wire _1675;
    wire _15;
    reg _1626;
    wire _1681;
    wire _1678;
    wire _1682;
    wire _1683;
    wire _1684;
    wire _1789;
    wire _1788;
    wire _1790;
    wire [31:0] _1787;
    wire _1781;
    wire _1779;
    wire _18;
    wire _1778;
    wire _1780;
    wire _1782;
    wire _1783;
    wire [11:0] _1770;
    wire _1767;
    wire _1768;
    wire [11:0] _1769;
    wire _1771;
    wire [11:0] _1772;
    wire [11:0] _1773;
    wire [11:0] _1759;
    wire [11:0] _1717;
    wire [11:0] _1714;
    wire [12:0] _1711;
    wire [9:0] _1708;
    wire [12:0] _1709;
    wire [12:0] _1710;
    reg [2:0] _1685;
    wire [2:0] _19;
    reg [2:0] _1705;
    wire [12:0] _1706;
    wire [12:0] _1691;
    wire [12:0] _1690;
    wire [15:0] _1686;
    wire _1689;
    wire [12:0] _1692;
    wire [12:0] _20;
    reg [12:0] _1701;
    wire _1707;
    wire [12:0] _1712;
    wire [12:0] _1698;
    wire _1713;
    wire [11:0] _1716;
    wire [15:0] _1693;
    wire _1694;
    wire _21;
    reg _1697;
    wire [11:0] _1718;
    wire [11:0] _22;
    reg [11:0] _1760;
    wire [11:0] _1721;
    reg [1:0] _1687;
    reg [15:0] _1688;
    wire [15:0] _1719;
    wire _1720;
    wire [11:0] _1723;
    wire [11:0] _23;
    reg [11:0] _1757;
    wire _1761;
    wire _1762;
    wire [11:0] _1763;
    wire [11:0] _1754;
    wire _1764;
    wire [11:0] _1765;
    wire [7:0] _1752;
    wire _1753;
    wire [11:0] _1766;
    wire [7:0] _1750;
    wire [7:0] _1749;
    wire [1:0] _1744;
    wire [1:0] _1743;
    wire _1725;
    wire _1724;
    wire _1726;
    wire _24;
    reg _1742;
    wire [1:0] _1745;
    wire [6:0] _1739;
    wire [8:0] _1746;
    wire [7:0] _1737;
    wire [8:0] _1738;
    wire [8:0] _1747;
    wire _1748;
    wire [7:0] _1751;
    wire [31:0] _1774;
    wire [31:0] _26;
    wire [31:0] _1775;
    reg [31:0] _1784[0:255];
    wire [7:0] _27;
    reg [7:0] _1735;
    wire [7:0] _1457;
    wire [7:0] _28;
    reg [7:0] _1460;
    wire [7:0] _30;
    wire [7:0] _1732;
    wire _1727;
    wire _32;
    wire _1442;
    wire _1728;
    wire _33;
    reg _1445;
    wire _34;
    reg _1731;
    wire [7:0] _1736;
    wire [31:0] _1785;
    reg [31:0] _1791;
    wire [31:0] _35;
    wire [2:0] _2158;
    wire _2159;
    wire _2160;
    wire [47:0] _2157;
    reg [47:0] _2161;
    wire [2:0] _2152;
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
    wire [2:0] _2134;
    wire _2135;
    wire _2136;
    reg [47:0] _2137;
    wire _2129;
    wire _2130;
    reg [47:0] _2131;
    wire _2123;
    wire _2124;
    reg [47:0] _2125;
    wire [2:0] _1798;
    wire [2:0] _1799;
    wire [2:0] _38;
    reg [2:0] _1796;
    wire _2117;
    wire _2118;
    wire [2:0] _2090;
    wire [28:0] _1807;
    wire [28:0] _1806;
    wire [28:0] _1809;
    wire [28:0] _1810;
    wire [2:0] _1803;
    wire _1805;
    wire [28:0] _1811;
    wire [28:0] _39;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2088;
    wire [2:0] _1829;
    wire _1825;
    wire _1826;
    wire _1823;
    wire _1827;
    wire [2:0] _1830;
    wire _1820;
    wire _1821;
    wire _1818;
    wire _1817;
    wire _1819;
    wire _1822;
    wire [2:0] _1832;
    wire _1813;
    wire [2:0] _1833;
    wire [2:0] _40;
    reg [2:0] _1816;
    wire _2079;
    wire [2:0] _2081;
    wire [2:0] _1850;
    wire _1846;
    wire _1847;
    wire _1844;
    wire _1848;
    wire [2:0] _1851;
    wire _1841;
    wire _1842;
    wire _1839;
    wire _1838;
    wire _1840;
    wire _1843;
    wire [2:0] _1853;
    wire _1834;
    wire [2:0] _1854;
    wire [2:0] _41;
    reg [2:0] _1837;
    wire _2076;
    wire [2:0] _2078;
    wire [2:0] _2082;
    wire [2:0] _1871;
    wire _1867;
    wire _1868;
    wire _1865;
    wire _1869;
    wire [2:0] _1872;
    wire _1862;
    wire _1863;
    wire _1860;
    wire _1859;
    wire _1861;
    wire _1864;
    wire [2:0] _1874;
    wire _1855;
    wire [2:0] _1875;
    wire [2:0] _42;
    reg [2:0] _1858;
    wire _2072;
    wire [2:0] _2074;
    wire [2:0] _1892;
    wire _1888;
    wire _1889;
    wire _1886;
    wire _1890;
    wire [2:0] _1893;
    wire _1883;
    wire _1884;
    wire _1881;
    wire _1880;
    wire _1882;
    wire _1885;
    wire [2:0] _1895;
    wire _1876;
    wire [2:0] _1896;
    wire [2:0] _43;
    reg [2:0] _1879;
    wire _2069;
    wire [2:0] _2071;
    wire [2:0] _2075;
    wire [2:0] _2083;
    wire [2:0] _1913;
    wire _1909;
    wire _1910;
    wire _1907;
    wire _1911;
    wire [2:0] _1914;
    wire _1904;
    wire _1905;
    wire _1902;
    wire _1901;
    wire _1903;
    wire _1906;
    wire [2:0] _1916;
    wire _1897;
    wire [2:0] _1917;
    wire [2:0] _44;
    reg [2:0] _1900;
    wire _2064;
    wire [2:0] _2066;
    wire [2:0] _1934;
    wire _1930;
    wire _1931;
    wire _1928;
    wire _1932;
    wire [2:0] _1935;
    wire _1925;
    wire _1926;
    wire _1923;
    wire _1922;
    wire _1924;
    wire _1927;
    wire [2:0] _1937;
    wire _1918;
    wire [2:0] _1938;
    wire [2:0] _45;
    reg [2:0] _1921;
    wire _2061;
    wire [2:0] _2063;
    wire [2:0] _2067;
    wire [2:0] _1955;
    wire _1951;
    wire _1952;
    wire _1949;
    wire _1953;
    wire [2:0] _1956;
    wire _1946;
    wire _1947;
    wire _1944;
    wire _1943;
    wire _1945;
    wire _1948;
    wire [2:0] _1958;
    wire _1939;
    wire [2:0] _1959;
    wire [2:0] _46;
    reg [2:0] _1942;
    wire _2057;
    wire [2:0] _2059;
    wire [2:0] _1976;
    wire _1972;
    wire _1973;
    wire _1970;
    wire _1974;
    wire [2:0] _1977;
    wire _1967;
    wire _1968;
    wire _1965;
    wire _1964;
    wire _1966;
    wire _1969;
    wire [2:0] _1979;
    wire _1960;
    wire [2:0] _1980;
    wire [2:0] _47;
    reg [2:0] _1963;
    wire _2054;
    wire [2:0] _2056;
    wire [2:0] _2060;
    wire [2:0] _2068;
    wire [2:0] _2084;
    wire _2049;
    wire _2048;
    wire _2050;
    wire _2046;
    wire _2045;
    wire _2047;
    wire _2051;
    wire _2042;
    wire _2041;
    wire _2043;
    wire _2039;
    wire _2038;
    wire _2040;
    wire _2044;
    wire _2052;
    wire [2:0] _2085;
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
    wire _2015;
    wire _2014;
    wire _2016;
    wire [2:0] _2018;
    wire _2010;
    wire _2009;
    wire _2011;
    wire [2:0] _2013;
    wire _2019;
    wire [2:0] _2020;
    wire _2033;
    wire [2:0] _2034;
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
    wire _1989;
    wire _1988;
    wire _1990;
    wire [2:0] _1992;
    wire _1984;
    wire _1983;
    wire _1985;
    wire [2:0] _1987;
    wire _1993;
    wire [2:0] _1994;
    wire _2007;
    wire [2:0] _2008;
    wire _2035;
    wire [2:0] _2036;
    wire [2:0] _2037;
    wire [2:0] _2086;
    wire [2:0] _1981;
    wire _2087;
    wire [28:0] _2089;
    wire [31:0] _2091;
    wire [47:0] _2095;
    wire [47:0] _48;
    reg [47:0] _2119;
    wire [2:0] _2112;
    wire [3:0] _1679;
    wire [3:0] _2101;
    wire [3:0] _2102;
    wire [3:0] _2100;
    wire [3:0] _2103;
    wire [3:0] _1471;
    wire _1472;
    wire _1792;
    wire _49;
    wire _1793;
    wire _2098;
    wire [3:0] _2104;
    reg [3:0] _2107;
    wire [3:0] _50;
    wire _1680;
    wire _2096;
    wire _52;
    wire _2097;
    wire [2:0] _2113;
    wire [2:0] _53;
    reg [2:0] _2110;
    reg [47:0] _2162;
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
    wire _2236;
    wire _2237;
    reg [7:0] _2238;
    wire _2230;
    wire _2231;
    reg [7:0] _2232;
    wire [2:0] _2169;
    wire [2:0] _2170;
    wire [2:0] _56;
    reg [2:0] _2167;
    wire _2224;
    wire _2225;
    wire [7:0] _2210;
    wire [7:0] _2211;
    wire [7:0] _2188;
    wire [7:0] _2186;
    wire [7:0] _2189;
    wire [7:0] _57;
    reg [7:0] _2175;
    wire [7:0] _2184;
    wire [7:0] _2185;
    wire [7:0] _2200;
    wire [7:0] _2197;
    wire [7:0] _2195;
    wire [7:0] _2198;
    wire [7:0] _58;
    reg [7:0] _2194;
    wire [7:0] _2199;
    wire [7:0] _2201;
    wire [7:0] _2212;
    wire [7:0] _59;
    reg [7:0] _2226;
    wire [2:0] _2219;
    wire [2:0] _2220;
    wire [2:0] _60;
    reg [2:0] _2217;
    reg [7:0] _2269;
    wire [31:0] _2272;
    wire [31:0] _2273;
    wire [31:0] _64;
    reg [31:0] ts_reg;
    wire [1:0] _2275;
    wire [1:0] _2092;
    wire [1:0] _2094;
    reg [1:0] _2276;
    reg _2279;
    reg [1:0] _2282;
    reg _2285;
    wire _2286;
    wire _2287;
    wire _2288;
    wire [7:0] _2429;
    wire [7:0] _2430;
    wire [7:0] _2310;
    wire [7:0] _2308;
    wire [7:0] _2307;
    wire [7:0] _2306;
    wire [7:0] _2305;
    reg [7:0] _2309;
    wire [7:0] _2311;
    wire [7:0] _2312;
    wire [7:0] _2303;
    wire [7:0] _2304;
    wire [7:0] _2313;
    wire [7:0] _2347;
    wire [7:0] _2348;
    wire [7:0] _2350;
    wire [7:0] _2352;
    wire [7:0] _74;
    reg [7:0] _2295;
    wire [7:0] _2431;
    wire [7:0] _77;
    wire [7:0] _3756;
    wire _2426;
    wire _2425;
    wire _2423;
    wire _2424;
    wire _2422;
    wire _2421;
    wire _2420;
    wire [2:0] _2419;
    reg _2427;
    wire _2417;
    wire _2416;
    wire _2414;
    wire _2415;
    wire _2413;
    wire _2412;
    wire _2411;
    wire [2:0] _2410;
    reg _2418;
    wire _2408;
    wire _2407;
    wire _2405;
    wire _2406;
    wire _2404;
    wire _2403;
    wire _2402;
    wire [2:0] _2401;
    reg _2409;
    wire _2399;
    wire _2398;
    wire _2396;
    wire _2397;
    wire _2395;
    wire _2394;
    wire _2393;
    wire [2:0] _2392;
    reg _2400;
    wire _2390;
    wire _2389;
    wire _2387;
    wire _2388;
    wire _2386;
    wire _2385;
    wire _2384;
    wire [2:0] _2383;
    reg _2391;
    wire _2381;
    wire _2380;
    wire _2378;
    wire _2379;
    wire _2377;
    wire _2376;
    wire _2375;
    wire [2:0] _2374;
    reg _2382;
    wire _2372;
    wire _2371;
    wire _2369;
    wire _2370;
    wire _2368;
    wire _2367;
    wire _2366;
    wire [2:0] _2365;
    reg _2373;
    wire _2363;
    wire _2362;
    wire _2360;
    wire _2361;
    wire _2359;
    wire _2358;
    wire [2:0] _3748;
    wire _3745;
    wire [1:0] _3746;
    wire [3:0] _3747;
    wire [6:0] _3749;
    wire [7:0] _3750;
    wire [7:0] _3751;
    wire _2344;
    wire _2343;
    wire _2342;
    wire _2340;
    wire _2341;
    wire _2338;
    wire _2339;
    wire _2335;
    wire _2336;
    wire _2337;
    wire _2332;
    wire _2333;
    wire _2334;
    wire _2329;
    wire _2328;
    wire _2330;
    wire _2327;
    wire _2331;
    wire [7:0] _2345;
    wire _2314;
    wire _2320;
    wire [7:0] _2346;
    wire [7:0] _3743;
    wire [7:0] _3739;
    wire [7:0] _3737;
    wire [7:0] _3736;
    wire [7:0] _3735;
    wire [7:0] _3734;
    reg [7:0] _3738;
    wire [7:0] _3740;
    wire [7:0] _3741;
    wire [7:0] _2301;
    wire [7:0] _2299;
    wire [7:0] _2298;
    wire [7:0] _2297;
    wire [7:0] _2296;
    reg [7:0] _2300;
    wire [7:0] _2302;
    wire [7:0] _3732;
    wire [7:0] _3733;
    wire [7:0] _3742;
    wire [7:0] _3744;
    wire [7:0] _3752;
    wire _2290;
    wire _2291;
    wire _1592;
    wire [1:0] _3726;
    wire [1:0] _3722;
    wire [1:0] _1665;
    wire _3713;
    wire [1:0] _3715;
    wire _3712;
    wire [1:0] _3717;
    wire _3711;
    wire [1:0] _3719;
    wire [1:0] _3720;
    wire [7:0] _1436;
    wire _1438;
    wire _1429;
    wire [15:0] _1424;
    wire _1425;
    wire _1426;
    wire _1423;
    wire _1427;
    wire _1430;
    wire [3:0] _1420;
    wire _1422;
    wire _1431;
    wire _1418;
    wire _1414;
    wire _1415;
    wire _1412;
    wire _1416;
    wire _1419;
    wire _1410;
    reg [2:0] _1404;
    wire [15:0] _1405;
    wire _1406;
    wire _1400;
    wire _1407;
    wire _1398;
    wire _1408;
    wire _1411;
    wire [1:0] _1397;
    reg _1432;
    wire _1396;
    wire _1433;
    wire _1393;
    wire [3:0] _1391;
    reg _1392;
    wire _1394;
    wire [15:0] _1386;
    wire _1388;
    wire [16:0] _1381;
    wire [15:0] _1377;
    wire [16:0] _1378;
    wire [16:0] _1379;
    reg [16:0] _1382;
    wire _1383;
    wire _1384;
    wire [15:0] _1373;
    wire _1375;
    wire _1357;
    wire [2:0] _1359;
    wire _1354;
    wire [2:0] _1356;
    wire _1360;
    wire [2:0] _1361;
    wire _1349;
    wire [2:0] _1351;
    wire _1346;
    wire [2:0] _1348;
    wire _1352;
    wire [2:0] _1353;
    wire _1362;
    wire [2:0] _1363;
    wire _1339;
    wire [2:0] _1341;
    wire _1336;
    wire [2:0] _1338;
    wire _1342;
    wire [2:0] _1343;
    wire _1331;
    wire [2:0] _1333;
    wire [7:0] _1327;
    wire _1328;
    wire [2:0] _1330;
    wire _1334;
    wire [2:0] _1335;
    wire _1344;
    wire [2:0] _1345;
    wire _1364;
    wire [2:0] _1365;
    wire [13:0] _1326;
    wire [16:0] _1366;
    wire [111:0] _1323;
    wire [15:0] _1324;
    wire [16:0] _1325;
    wire [16:0] _1367;
    reg [16:0] _1370;
    wire [16:0] _1322;
    wire _1371;
    wire _1372;
    wire _1376;
    wire _1385;
    wire [1:0] _1318;
    reg [15:0] _1319;
    wire _1321;
    wire _1389;
    wire [7:0] _1312;
    wire _1314;
    wire _1315;
    wire _1311;
    wire _1316;
    wire [7:0] _1305;
    wire [7:0] _1303;
    wire [7:0] _1304;
    wire [7:0] _1306;
    wire _1308;
    wire _1309;
    wire _1317;
    wire _1390;
    wire _1395;
    wire _1434;
    wire _1435;
    wire _1439;
    wire f_fire3;
    wire [7:0] _987;
    wire _989;
    wire _975;
    wire _971;
    wire _972;
    wire _969;
    wire _973;
    wire _976;
    wire [3:0] _966;
    wire _968;
    wire _977;
    wire _964;
    wire _960;
    wire _961;
    wire _958;
    wire _962;
    wire _965;
    wire _956;
    reg [2:0] _950;
    wire [15:0] _951;
    wire _952;
    wire _946;
    wire _953;
    wire _944;
    wire _954;
    wire _957;
    wire [1:0] _943;
    reg _978;
    wire _942;
    wire _979;
    wire _934;
    wire [3:0] _908;
    reg _933;
    wire _935;
    wire [15:0] _903;
    wire _905;
    wire [15:0] _894;
    wire [16:0] _895;
    wire [16:0] _896;
    reg [16:0] _899;
    wire _900;
    wire _901;
    wire [15:0] _890;
    wire _892;
    wire _856;
    wire [2:0] _876;
    wire _835;
    wire [2:0] _855;
    wire _877;
    wire [2:0] _878;
    wire _812;
    wire [2:0] _832;
    wire _791;
    wire [2:0] _811;
    wire _833;
    wire [2:0] _834;
    wire _879;
    wire [2:0] _880;
    wire _766;
    wire [2:0] _786;
    wire _745;
    wire [2:0] _765;
    wire _787;
    wire [2:0] _788;
    wire _722;
    wire [2:0] _742;
    wire [7:0] _700;
    wire _701;
    wire [2:0] _721;
    wire _743;
    wire [2:0] _744;
    wire _789;
    wire [2:0] _790;
    wire _881;
    wire [2:0] _882;
    wire [16:0] _883;
    wire [111:0] _696;
    wire [15:0] _697;
    wire [16:0] _698;
    wire [16:0] _884;
    reg [16:0] _887;
    wire [16:0] _673;
    wire _888;
    wire _889;
    wire _893;
    wire _902;
    wire [1:0] _660;
    reg [15:0] _670;
    wire _672;
    wire _906;
    wire [7:0] _654;
    wire _656;
    wire _657;
    wire _648;
    wire _658;
    wire [7:0] _641;
    wire [7:0] _639;
    wire [7:0] _640;
    wire [7:0] _642;
    wire _644;
    wire [127:0] _625;
    wire [2:0] _3696;
    wire [2:0] _3692;
    wire _3687;
    wire [2:0] _3689;
    wire [7:0] _1656;
    wire _1658;
    wire _1659;
    wire _1654;
    wire _1655;
    wire f_unexp_now;
    wire _2435;
    wire _2436;
    wire _2438;
    wire _2439;
    wire _2434;
    wire _2432;
    wire _2440;
    wire _78;
    reg _1651;
    wire _1652;
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
    wire [7:0] _1297;
    wire _1299;
    wire _1290;
    wire _1286;
    wire _1287;
    wire _1284;
    wire _1288;
    wire _1291;
    wire [3:0] _1281;
    wire _1283;
    wire _1292;
    wire _1279;
    wire _1275;
    wire _1276;
    wire _1273;
    wire _1277;
    wire _1280;
    wire _1271;
    reg [2:0] _1265;
    wire [15:0] _1266;
    wire _1267;
    wire _1261;
    wire _1268;
    wire _1259;
    wire _1269;
    wire _1272;
    wire [1:0] _1258;
    reg _1293;
    wire _1257;
    wire _1294;
    wire _1254;
    wire [3:0] _1252;
    reg _1253;
    wire _1255;
    wire [15:0] _1247;
    wire _1249;
    wire [15:0] _1238;
    wire [16:0] _1239;
    wire [16:0] _1240;
    reg [16:0] _1243;
    wire _1244;
    wire _1245;
    wire [15:0] _1234;
    wire _1236;
    wire _1218;
    wire [2:0] _1220;
    wire _1215;
    wire [2:0] _1217;
    wire _1221;
    wire [2:0] _1222;
    wire _1210;
    wire [2:0] _1212;
    wire _1207;
    wire [2:0] _1209;
    wire _1213;
    wire [2:0] _1214;
    wire _1223;
    wire [2:0] _1224;
    wire _1200;
    wire [2:0] _1202;
    wire _1197;
    wire [2:0] _1199;
    wire _1203;
    wire [2:0] _1204;
    wire _1192;
    wire [2:0] _1194;
    wire [7:0] _1188;
    wire _1189;
    wire [2:0] _1191;
    wire _1195;
    wire [2:0] _1196;
    wire _1205;
    wire [2:0] _1206;
    wire _1225;
    wire [2:0] _1226;
    wire [16:0] _1227;
    wire [111:0] _1184;
    wire [15:0] _1185;
    wire [16:0] _1186;
    wire [16:0] _1228;
    reg [16:0] _1231;
    wire [16:0] _1183;
    wire _1232;
    wire _1233;
    wire _1237;
    wire _1246;
    wire [1:0] _1179;
    reg [15:0] _1180;
    wire _1182;
    wire _1250;
    wire [7:0] _1173;
    wire _1175;
    wire _1176;
    wire _1172;
    wire _1177;
    wire [7:0] _1166;
    wire [7:0] _1164;
    wire [7:0] _1165;
    wire [7:0] _1167;
    wire _1169;
    wire _1170;
    wire _1178;
    wire _1251;
    wire _1256;
    wire _1295;
    wire _1296;
    wire _1300;
    wire f_fire2;
    wire [1:0] _1452;
    wire _1022;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _1012;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _1006;
    wire [7:0] _1000;
    wire [7:0] f_chgmask0;
    wire [7:0] _994;
    wire [7:0] f_watch;
    wire [7:0] _995;
    wire [7:0] _1001;
    wire [7:0] _1007;
    wire [7:0] f_relevant;
    wire [7:0] _1014;
    wire _1016;
    wire _1017;
    wire f_amb_now;
    wire _1019;
    wire _1023;
    wire [7:0] _985;
    wire [7:0] _2445;
    wire [7:0] _2446;
    wire _2442;
    wire [7:0] _2444;
    wire _2441;
    wire [7:0] _2447;
    wire [7:0] _2449;
    wire [7:0] _79;
    reg [7:0] _984;
    wire [7:0] f_multi_eff;
    wire [7:0] _1158;
    wire _1160;
    wire _1151;
    wire _1147;
    wire _1148;
    wire _1145;
    wire _1149;
    wire _1152;
    wire [3:0] _1142;
    wire _1144;
    wire _1153;
    wire _1140;
    wire _1136;
    wire _1137;
    wire _1134;
    wire _1138;
    wire _1141;
    wire _1132;
    reg [2:0] _1126;
    wire [15:0] _1127;
    wire _1128;
    wire _1122;
    wire _1129;
    wire _1120;
    wire _1130;
    wire _1133;
    wire [1:0] _1119;
    reg _1154;
    wire [1:0] _81;
    wire [1:0] _2450;
    wire [1:0] _82;
    reg [1:0] _939;
    wire _941;
    wire _1118;
    wire _1155;
    wire _1115;
    wire _2454;
    wire _2452;
    wire _2455;
    wire _2457;
    wire _2459;
    wire _83;
    reg _604;
    wire [15:0] _85;
    wire [15:0] _87;
    wire [15:0] _2465;
    wire [15:0] _2466;
    wire [15:0] _2467;
    wire [15:0] _2469;
    wire [15:0] _88;
    reg [15:0] _2462;
    wire [14:0] _2463;
    wire [15:0] _2464;
    wire [15:0] _2470;
    wire [15:0] _2471;
    wire _2473;
    wire _2475;
    wire _2476;
    wire _2477;
    wire _2478;
    wire _2480;
    wire _2482;
    wire _89;
    reg _601;
    wire _2495;
    wire _2496;
    wire _2498;
    wire _2499;
    wire _2500;
    wire _2501;
    wire _2503;
    wire _90;
    reg _2485;
    wire _2497;
    wire _2506;
    wire [5:0] _2504;
    wire _2505;
    wire _2507;
    wire _2508;
    wire _2509;
    wire _2510;
    wire _2511;
    wire _2513;
    wire _2515;
    wire _91;
    reg _598;
    wire _2519;
    wire _2517;
    wire _2520;
    wire _2522;
    wire _2524;
    wire _92;
    reg _616;
    wire [15:0] _94;
    wire [15:0] _96;
    wire [15:0] _2530;
    wire [15:0] _2531;
    wire [15:0] _2532;
    wire [15:0] _2534;
    wire [15:0] _97;
    reg [15:0] _2527;
    wire [14:0] _2528;
    wire [15:0] _2529;
    wire [15:0] _2535;
    wire [15:0] _2536;
    wire _2538;
    wire _2540;
    wire _2541;
    wire _2542;
    wire _2543;
    wire _2545;
    wire _2547;
    wire _98;
    reg _613;
    wire _2560;
    wire _2561;
    wire _2563;
    wire _2564;
    wire _2565;
    wire _2566;
    wire _2568;
    wire _99;
    reg _2550;
    wire _2562;
    wire _2571;
    wire _2570;
    wire _2572;
    wire _2573;
    wire _2574;
    wire _2575;
    wire _2576;
    wire _2578;
    wire _2580;
    wire _100;
    reg _610;
    wire [7:0] _102;
    wire [6:0] _931;
    wire [6:0] _930;
    wire _932;
    wire [15:0] _927;
    wire _2585;
    wire _2584;
    wire _2586;
    wire _2583;
    wire _2587;
    wire _2582;
    wire _2588;
    wire [14:0] _2581;
    wire [15:0] _2589;
    wire [15:0] _103;
    reg [15:0] _928;
    wire _929;
    wire [3:0] _2608;
    wire [3:0] _2606;
    wire [3:0] _2609;
    wire _1677;
    wire _2213;
    wire _105;
    wire _2214;
    wire _2163;
    wire _2196;
    wire _2593;
    wire _2190;
    wire _2191;
    wire _2591;
    wire _1603;
    wire _1604;
    wire _1610;
    wire _1607;
    wire _1608;
    wire _1606;
    wire _1609;
    wire _1611;
    wire _2594;
    wire _106;
    reg _1590;
    wire _2602;
    wire _2187;
    wire _2598;
    wire _2171;
    wire _2172;
    wire _2596;
    wire _1530;
    wire [2:0] _1524;
    wire _1519;
    wire _1518;
    wire _1520;
    wire _1521;
    wire _1522;
    wire [2:0] _1525;
    wire _1527;
    wire _1528;
    wire _1499;
    wire _1529;
    wire _1531;
    wire _1495;
    wire _1496;
    wire _1532;
    wire _1584;
    wire _1583;
    wire _1585;
    wire _2599;
    wire _107;
    reg _1483;
    wire _2600;
    wire _1580;
    wire [2:0] _1574;
    wire _1569;
    wire _1568;
    wire _1570;
    wire _1571;
    wire _1572;
    wire [2:0] _1575;
    wire _1577;
    wire _1578;
    wire _1549;
    wire _1579;
    wire _1581;
    wire _1545;
    wire _1546;
    wire _1582;
    wire _2601;
    wire _2603;
    wire _108;
    wire _2164;
    wire _2604;
    wire [3:0] _2610;
    reg [3:0] _2613;
    wire [3:0] _109;
    wire _925;
    wire [6:0] _2630;
    wire [7:0] _2631;
    wire [6:0] _2628;
    wire _2626;
    wire _2625;
    wire _2624;
    wire _2623;
    wire _2622;
    wire _2621;
    wire _2620;
    wire _2619;
    wire [2:0] _2617;
    wire [2:0] _2616;
    wire [2:0] _2615;
    wire [2:0] _2614;
    reg [2:0] _2618;
    reg _2627;
    wire [7:0] _2629;
    wire [1:0] _1598;
    wire [1:0] _1597;
    wire [1:0] _1596;
    wire [1:0] _1595;
    reg [1:0] _1599;
    wire [1:0] _1601;
    reg [7:0] _2632;
    wire [7:0] _2633;
    wire [7:0] _110;
    reg [7:0] _920;
    wire _921;
    wire [6:0] _3403;
    wire [7:0] _3404;
    wire _3401;
    wire _3400;
    wire _3399;
    wire _3398;
    wire _3397;
    wire _3396;
    wire _3395;
    wire _3394;
    wire [7:0] _3402;
    wire [3:0] _3386;
    wire [3:0] _3384;
    wire [3:0] _3387;
    wire _3057;
    wire _3378;
    wire _1500;
    wire _3012;
    wire _3013;
    wire [1:0] _3016;
    wire _3005;
    wire _3006;
    wire _3007;
    wire _3008;
    wire [1:0] _3010;
    wire [2:0] _2991;
    wire [2:0] _2988;
    wire _2984;
    wire _2982;
    wire _2983;
    wire _2985;
    wire [2:0] _2989;
    wire _2980;
    wire [2:0] _2992;
    wire _2993;
    wire [2:0] _2974;
    wire _2970;
    wire _2968;
    wire _2969;
    wire _2971;
    wire [2:0] _2975;
    wire _2966;
    wire [2:0] _2977;
    wire _2978;
    wire _2994;
    wire _2995;
    wire _2996;
    wire _2962;
    wire [5:0] _2959;
    wire _2960;
    wire _2963;
    wire [15:0] _2955;
    wire _2956;
    wire _2953;
    wire _2957;
    wire _2951;
    wire _2952;
    wire _2958;
    wire _2964;
    wire _2997;
    wire [1:0] _2999;
    wire [1:0] _3001;
    wire [1:0] _2947;
    wire _2943;
    wire [1:0] _2945;
    wire [1:0] _2948;
    wire _2723;
    wire _2724;
    wire _111;
    reg _2636;
    wire _2873;
    wire _2871;
    wire _2872;
    reg _2874;
    wire [2:0] _113;
    wire [2:0] _2855;
    wire [2:0] _2856;
    wire [2:0] _2851;
    wire _2847;
    wire _2845;
    wire _2846;
    wire _2848;
    wire [2:0] _2852;
    wire _2843;
    wire [2:0] _2857;
    wire [2:0] _2858;
    wire [2:0] _2837;
    wire [2:0] _2838;
    wire [2:0] _2833;
    wire _2719;
    wire _2718;
    wire _2717;
    wire _2716;
    wire _2715;
    wire _2714;
    wire _2713;
    wire _2709;
    wire _2708;
    wire _2707;
    wire _2706;
    wire _2705;
    wire _2704;
    wire _2703;
    wire [7:0] _2700;
    wire [6:0] _2181;
    wire [7:0] _2182;
    wire [6:0] _2179;
    wire [7:0] _2180;
    wire [7:0] _2183;
    wire [7:0] _2729;
    wire [7:0] _2730;
    wire [7:0] _2731;
    wire [7:0] _2725;
    wire [7:0] _2726;
    wire [7:0] _2727;
    wire [7:0] _2728;
    wire [7:0] _2732;
    wire [7:0] _114;
    reg [7:0] _2178;
    wire _2640;
    wire _2637;
    wire _2638;
    wire _2641;
    wire [7:0] _2701;
    wire _2702;
    wire [7:0] _2710;
    wire _116;
    wire [7:0] _2711;
    wire _2712;
    wire [2:0] _2740;
    wire [2:0] _2741;
    wire [2:0] _2742;
    wire [2:0] _2743;
    wire [2:0] _2734;
    wire [2:0] _2735;
    wire [2:0] _2736;
    wire [2:0] _2737;
    wire [2:0] _2738;
    wire [2:0] _2744;
    wire [2:0] _2746;
    wire [2:0] _117;
    reg [2:0] _1493;
    reg _2720;
    wire _119;
    wire [31:0] _121;
    wire [30:0] _2788;
    wire [31:0] _2790;
    wire _2782;
    wire _2783;
    wire [31:0] _2785;
    wire [30:0] _2779;
    wire [31:0] _2781;
    wire [31:0] _2786;
    wire [31:0] _2787;
    wire [5:0] _123;
    wire [5:0] _2756;
    wire [5:0] _2757;
    wire [5:0] _2758;
    wire [5:0] _2759;
    wire [5:0] _2750;
    wire [5:0] _2751;
    wire [5:0] _2752;
    wire [5:0] _2753;
    wire [5:0] _2754;
    wire [5:0] _2760;
    wire [5:0] _2761;
    wire [5:0] _2763;
    wire [5:0] _124;
    reg [5:0] _1513;
    wire _1515;
    wire _1516;
    wire _2487;
    wire _2486;
    wire _2488;
    wire _2489;
    wire [31:0] _2791;
    wire [31:0] _2792;
    wire [31:0] _2793;
    wire [31:0] _126;
    wire _2770;
    wire _2771;
    wire [31:0] _2773;
    wire [30:0] _2767;
    wire [31:0] _2769;
    wire [31:0] _2774;
    wire [30:0] _2764;
    wire [31:0] _2766;
    wire [31:0] _2775;
    wire [31:0] _2776;
    wire [31:0] _2777;
    wire [31:0] _2778;
    wire [31:0] _2794;
    wire [31:0] _2795;
    wire [31:0] _2797;
    wire [31:0] _127;
    reg [31:0] _2492;
    wire _2493;
    wire _2494;
    wire [15:0] _129;
    wire [15:0] _2817;
    wire _1485;
    wire _1490;
    wire [15:0] _2818;
    wire _1484;
    wire [15:0] _2819;
    wire _2800;
    wire _2798;
    wire _2799;
    wire _2801;
    wire _2803;
    wire _130;
    reg _581;
    wire _582;
    wire _579;
    wire _583;
    wire _2805;
    wire _2806;
    wire _2807;
    wire _2809;
    wire _131;
    reg _575;
    wire _576;
    wire _573;
    wire _577;
    wire _584;
    wire _585;
    wire _586;
    wire [15:0] _2820;
    wire [15:0] _2811;
    wire [15:0] _2812;
    wire [15:0] _2813;
    wire [15:0] _2814;
    wire [15:0] _2815;
    wire [15:0] _2821;
    wire [15:0] _2823;
    wire [15:0] _132;
    reg [15:0] _1488;
    wire _1489;
    wire _2721;
    wire _2722;
    wire _2829;
    wire _2827;
    wire _2828;
    wire _2830;
    wire [2:0] _2834;
    wire _2825;
    wire [2:0] _2839;
    wire [2:0] _2840;
    wire [2:0] _2841;
    wire [2:0] _2859;
    wire [2:0] _2861;
    wire [2:0] _133;
    reg [2:0] _569;
    wire _570;
    wire [1:0] _135;
    wire _565;
    wire _566;
    wire _571;
    wire _1510;
    wire _1517;
    wire _2875;
    wire _2876;
    wire _1505;
    wire _1503;
    wire _1506;
    wire _1507;
    wire _1508;
    wire _2868;
    wire _2865;
    wire _2862;
    wire _2863;
    wire _2866;
    wire _2867;
    wire _2869;
    wire _2877;
    wire _2879;
    wire _2881;
    wire _2883;
    wire _2885;
    wire _136;
    reg _553;
    wire _554;
    wire _555;
    wire _548;
    wire _549;
    wire _545;
    wire _138;
    wire _542;
    wire _543;
    wire _544;
    wire _546;
    wire _550;
    wire _551;
    wire _556;
    wire [1:0] _2950;
    wire _537;
    wire _538;
    wire _533;
    wire _532;
    wire _531;
    wire _530;
    wire _529;
    wire _528;
    wire _527;
    wire _526;
    reg _534;
    wire _535;
    wire _524;
    wire _523;
    wire _522;
    wire _521;
    wire _520;
    wire _519;
    wire _518;
    wire _517;
    wire [2:0] _140;
    reg _525;
    wire _536;
    wire _142;
    wire _539;
    wire _515;
    wire _512;
    wire _505;
    wire _503;
    wire [13:0] _494;
    wire [15:0] _495;
    wire [14:0] _491;
    wire [15:0] _492;
    wire [15:0] _496;
    wire [14:0] _488;
    wire [15:0] _489;
    wire _486;
    wire [15:0] _497;
    reg [15:0] _500;
    wire _501;
    wire [13:0] _478;
    wire [15:0] _479;
    reg [15:0] _482;
    wire _2931;
    wire _2932;
    wire [15:0] _2933;
    wire [15:0] _2935;
    wire [15:0] _2937;
    wire _2915;
    wire [14:0] _507;
    wire [15:0] _508;
    reg [15:0] _511;
    wire [16:0] _2911;
    wire _2912;
    wire [16:0] _2905;
    reg [16:0] _2908;
    wire [16:0] _2900;
    wire [15:0] _144;
    wire [16:0] _2899;
    wire [16:0] _2901;
    reg [16:0] _2904;
    wire [7:0] _146;
    wire [8:0] _2919;
    wire [7:0] _2921;
    wire [7:0] _2922;
    wire [7:0] _2923;
    wire [7:0] _2925;
    wire [7:0] _147;
    reg [7:0] _2893;
    wire [8:0] _2918;
    wire [8:0] _2920;
    wire _2926;
    wire _2927;
    wire _2928;
    wire _2930;
    wire _148;
    reg _2898;
    wire [16:0] _2909;
    wire [16:0] _2895;
    wire _2910;
    wire _2913;
    wire _2916;
    wire _2894;
    wire _2917;
    wire [15:0] _2939;
    wire _2889;
    wire _2887;
    wire _595;
    wire _2886;
    wire _2888;
    wire _2890;
    wire [15:0] _2940;
    wire [15:0] _2942;
    wire [15:0] _149;
    reg [15:0] _476;
    wire _483;
    wire _484;
    wire _473;
    wire _485;
    wire _502;
    wire _504;
    wire _513;
    wire [1:0] _151;
    wire _469;
    wire _470;
    wire _467;
    wire _471;
    wire _464;
    wire _460;
    wire _459;
    wire _458;
    wire _457;
    wire _456;
    wire _455;
    wire _454;
    wire _453;
    reg _461;
    wire _451;
    wire _450;
    wire _449;
    wire _448;
    wire _447;
    wire _446;
    wire _445;
    wire _444;
    wire [2:0] _153;
    reg _452;
    wire _462;
    wire _463;
    wire _465;
    wire _472;
    wire _516;
    wire _155;
    wire _540;
    wire _157;
    wire _443;
    wire _541;
    wire [1:0] _3002;
    wire _1498;
    wire [1:0] _3004;
    wire _2748;
    wire [1:0] _3011;
    wire _437;
    wire [1:0] _3017;
    wire _435;
    wire [1:0] _3019;
    wire [1:0] _158;
    reg [1:0] _440;
    wire _442;
    wire _1501;
    wire _1509;
    wire _3377;
    wire _3379;
    wire _3375;
    wire _1550;
    wire _3353;
    wire _3354;
    wire [1:0] _3357;
    wire _3346;
    wire _3347;
    wire _3348;
    wire _3349;
    wire [1:0] _3351;
    wire [2:0] _3332;
    wire [2:0] _3329;
    wire _3325;
    wire _3323;
    wire _3324;
    wire _3326;
    wire [2:0] _3330;
    wire _3321;
    wire [2:0] _3333;
    wire _3334;
    wire [2:0] _3315;
    wire _3311;
    wire _3309;
    wire _3310;
    wire _3312;
    wire [2:0] _3316;
    wire _3307;
    wire [2:0] _3318;
    wire _3319;
    wire _3335;
    wire _3336;
    wire _3337;
    wire _3303;
    wire _3301;
    wire _3304;
    wire [15:0] _3296;
    wire _3297;
    wire _3294;
    wire _3298;
    wire _3292;
    wire _3293;
    wire _3299;
    wire _3305;
    wire _3338;
    wire [1:0] _3340;
    wire [1:0] _3342;
    wire [1:0] _3288;
    wire _3284;
    wire [1:0] _3286;
    wire [1:0] _3289;
    wire _3052;
    wire _3053;
    wire _159;
    reg _3022;
    wire _3210;
    wire _3208;
    wire _3209;
    reg _3211;
    wire [2:0] _161;
    wire [2:0] _3192;
    wire [2:0] _3193;
    wire [2:0] _3188;
    wire _3184;
    wire _3182;
    wire _3183;
    wire _3185;
    wire [2:0] _3189;
    wire _3180;
    wire [2:0] _3194;
    wire [2:0] _3195;
    wire [2:0] _3174;
    wire [2:0] _3175;
    wire [2:0] _3170;
    wire _3048;
    wire _3047;
    wire _3046;
    wire _3045;
    wire _3044;
    wire _3043;
    wire _3042;
    wire _3038;
    wire _3037;
    wire _3036;
    wire _3035;
    wire _3034;
    wire _3033;
    wire _3032;
    wire _2695;
    wire _2696;
    reg [7:0] _2697;
    wire _2689;
    wire _2690;
    reg [7:0] _2691;
    wire _2683;
    wire _2684;
    reg [7:0] _2685;
    wire _2677;
    wire _2678;
    reg [7:0] _2679;
    wire _2671;
    wire _2672;
    reg [7:0] _2673;
    wire _2665;
    wire _2666;
    reg [7:0] _2667;
    wire _2659;
    wire _2660;
    reg [7:0] _2661;
    wire [2:0] _3055;
    wire [2:0] _3056;
    wire [2:0] _162;
    reg [2:0] _2651;
    wire _2653;
    wire _2654;
    wire [7:0] _164;
    reg [7:0] _2655;
    wire [2:0] _3060;
    wire [2:0] _3061;
    wire [2:0] _165;
    reg [2:0] _2644;
    reg [7:0] _2698;
    wire [7:0] _3029;
    wire [6:0] _2207;
    wire [7:0] _2208;
    wire [6:0] _2205;
    wire [7:0] _2206;
    wire [7:0] _2209;
    wire [7:0] _3066;
    wire [7:0] _3067;
    wire [7:0] _3068;
    wire [7:0] _3062;
    wire [7:0] _3063;
    wire [7:0] _3064;
    wire [7:0] _3065;
    wire [7:0] _3069;
    wire [7:0] _166;
    reg [7:0] _2204;
    wire _3026;
    wire _3023;
    wire _3024;
    wire _3027;
    wire [7:0] _3030;
    wire _3031;
    wire [7:0] _3039;
    wire _168;
    wire [7:0] _3040;
    wire _3041;
    wire [2:0] _3077;
    wire [2:0] _3078;
    wire [2:0] _3079;
    wire [2:0] _3080;
    wire [2:0] _3071;
    wire [2:0] _3072;
    wire [2:0] _3073;
    wire [2:0] _3074;
    wire [2:0] _3075;
    wire [2:0] _3081;
    wire [2:0] _3083;
    wire [2:0] _169;
    reg [2:0] _1543;
    reg _3049;
    wire _171;
    wire [31:0] _173;
    wire [30:0] _3125;
    wire [31:0] _3127;
    wire _3119;
    wire _3120;
    wire [31:0] _3122;
    wire [30:0] _3116;
    wire [31:0] _3118;
    wire [31:0] _3123;
    wire [31:0] _3124;
    wire [5:0] _175;
    wire [5:0] _3093;
    wire [5:0] _3094;
    wire [5:0] _3095;
    wire [5:0] _3096;
    wire [5:0] _3087;
    wire [5:0] _3088;
    wire [5:0] _3089;
    wire [5:0] _3090;
    wire [5:0] _3091;
    wire [5:0] _3097;
    wire [5:0] _3098;
    wire [5:0] _3100;
    wire [5:0] _176;
    reg [5:0] _1563;
    wire _1565;
    wire _1566;
    wire _2552;
    wire _2551;
    wire _2553;
    wire _2554;
    wire [31:0] _3128;
    wire [31:0] _3129;
    wire [31:0] _3130;
    wire [31:0] _178;
    wire _3107;
    wire _3108;
    wire [31:0] _3110;
    wire [30:0] _3104;
    wire [31:0] _3106;
    wire [31:0] _3111;
    wire [30:0] _3101;
    wire [31:0] _3103;
    wire [31:0] _3112;
    wire [31:0] _3113;
    wire [31:0] _3114;
    wire [31:0] _3115;
    wire [31:0] _3131;
    wire [31:0] _3132;
    wire [31:0] _3134;
    wire [31:0] _179;
    reg [31:0] _2557;
    wire _2558;
    wire _2559;
    wire [15:0] _181;
    wire [15:0] _3154;
    wire _1535;
    wire _1540;
    wire [15:0] _3155;
    wire _1534;
    wire [15:0] _3156;
    wire _3137;
    wire _3135;
    wire _3136;
    wire _3138;
    wire _3140;
    wire _182;
    reg _421;
    wire _422;
    wire _418;
    wire _423;
    wire _3142;
    wire _3143;
    wire _3144;
    wire _3146;
    wire _183;
    reg _414;
    wire _415;
    wire _412;
    wire _416;
    wire _424;
    wire _425;
    wire _426;
    wire [15:0] _3157;
    wire [15:0] _3148;
    wire [15:0] _3149;
    wire [15:0] _3150;
    wire [15:0] _3151;
    wire [15:0] _3152;
    wire [15:0] _3158;
    wire [15:0] _3160;
    wire [15:0] _184;
    reg [15:0] _1538;
    wire _1539;
    wire _3050;
    wire _3051;
    wire _3166;
    wire _3164;
    wire _3165;
    wire _3167;
    wire [2:0] _3171;
    wire _3162;
    wire [2:0] _3176;
    wire [2:0] _3177;
    wire [2:0] _3178;
    wire [2:0] _3196;
    wire [2:0] _3198;
    wire [2:0] _185;
    reg [2:0] _408;
    wire _409;
    wire [1:0] _187;
    wire _404;
    wire _405;
    wire _410;
    wire _1560;
    wire _1567;
    wire _3212;
    wire _3213;
    wire _1555;
    wire _1553;
    wire _1556;
    wire _1557;
    wire _1558;
    wire _3205;
    wire _3202;
    wire _3199;
    wire _3200;
    wire _3203;
    wire _3204;
    wire _3206;
    wire _3214;
    wire _3216;
    wire _3218;
    wire _3220;
    wire _3222;
    wire _188;
    reg _392;
    wire _393;
    wire _394;
    wire _387;
    wire _388;
    wire _384;
    wire _190;
    wire _381;
    wire _382;
    wire _383;
    wire _385;
    wire _389;
    wire _390;
    wire _395;
    wire [1:0] _3291;
    wire _376;
    wire _377;
    wire _372;
    wire _371;
    wire _370;
    wire _369;
    wire _368;
    wire _367;
    wire _366;
    wire _365;
    reg _373;
    wire _374;
    wire _363;
    wire _362;
    wire _361;
    wire _360;
    wire _359;
    wire _358;
    wire _357;
    wire _356;
    wire [2:0] _192;
    reg _364;
    wire _375;
    wire _194;
    wire _378;
    wire _354;
    wire _351;
    wire _344;
    wire _342;
    wire [13:0] _333;
    wire [15:0] _334;
    wire [14:0] _330;
    wire [15:0] _331;
    wire [15:0] _335;
    wire [14:0] _327;
    wire [15:0] _328;
    wire _325;
    wire [15:0] _336;
    reg [15:0] _339;
    wire _340;
    wire [13:0] _317;
    wire [15:0] _318;
    reg [15:0] _321;
    wire _3268;
    wire _3269;
    wire [15:0] _3270;
    wire [15:0] _3272;
    wire [15:0] _3274;
    wire _3252;
    wire [14:0] _346;
    wire [15:0] _347;
    reg [15:0] _350;
    wire [16:0] _3248;
    wire _3249;
    wire [16:0] _3242;
    reg [16:0] _3245;
    wire [15:0] _196;
    wire [16:0] _3236;
    wire [16:0] _3238;
    reg [16:0] _3241;
    wire [7:0] _198;
    wire [8:0] _3256;
    wire [7:0] _3258;
    wire [7:0] _3259;
    wire [7:0] _3260;
    wire [7:0] _3262;
    wire [7:0] _199;
    reg [7:0] _3230;
    wire [8:0] _3255;
    wire [8:0] _3257;
    wire _3263;
    wire _3264;
    wire _3265;
    wire _3267;
    wire _200;
    reg _3235;
    wire [16:0] _3246;
    wire [16:0] _3232;
    wire _3247;
    wire _3250;
    wire _3253;
    wire _3231;
    wire _3254;
    wire [15:0] _3276;
    wire _3226;
    wire _3224;
    wire _607;
    wire _3223;
    wire _3225;
    wire _3227;
    wire [15:0] _3277;
    wire [15:0] _3279;
    wire [15:0] _201;
    reg [15:0] _315;
    wire _322;
    wire _323;
    wire _312;
    wire _324;
    wire _341;
    wire _343;
    wire _352;
    wire [1:0] _203;
    wire _308;
    wire _309;
    wire _306;
    wire _310;
    wire _303;
    wire _299;
    wire _298;
    wire _297;
    wire _296;
    wire _295;
    wire _294;
    wire _293;
    wire _292;
    reg _300;
    wire _287;
    wire _286;
    wire _285;
    wire _284;
    wire _283;
    wire _282;
    wire _281;
    wire _280;
    wire [2:0] _205;
    reg _288;
    wire _301;
    wire _302;
    wire _304;
    wire _311;
    wire _355;
    wire _207;
    wire _379;
    wire _209;
    wire _273;
    wire _380;
    wire [1:0] _3343;
    wire _1548;
    wire [1:0] _3345;
    wire _3085;
    wire [1:0] _3352;
    wire _266;
    wire [1:0] _3358;
    wire [2:0] _2325;
    wire [2:0] _2324;
    wire [2:0] _2323;
    wire [2:0] _2322;
    reg [2:0] _2326;
    wire _2318;
    wire _2317;
    wire _2316;
    wire _2315;
    reg _2319;
    wire _3280;
    wire _3281;
    wire [2:0] _3283;
    wire [2:0] _210;
    wire _264;
    wire [1:0] _3360;
    wire [1:0] _211;
    reg [1:0] _270;
    wire _272;
    wire _1551;
    wire _1559;
    wire _3374;
    wire _3376;
    wire _3380;
    wire _3371;
    wire _3369;
    wire _3372;
    wire _3373;
    wire _3381;
    wire _212;
    wire _3058;
    wire _2271;
    wire _2647;
    wire _214;
    wire _2648;
    wire _3382;
    wire [3:0] _3388;
    reg [3:0] _3391;
    wire [3:0] _215;
    wire _923;
    wire [7:0] _3393;
    wire [1:0] _3366;
    wire [1:0] _3364;
    wire [1:0] _3363;
    wire [1:0] _3362;
    wire [1:0] _3361;
    reg [1:0] _3365;
    wire [1:0] _3367;
    reg [7:0] _3405;
    wire [7:0] _3406;
    wire [7:0] _216;
    reg [7:0] _916;
    wire _917;
    wire [7:0] _3417;
    wire [7:0] _3416;
    wire [7:0] _3414;
    wire [7:0] _3415;
    wire [1:0] _3412;
    wire [1:0] _3410;
    wire [1:0] _3409;
    wire [1:0] _3408;
    wire [1:0] _3407;
    reg [1:0] _3411;
    wire [1:0] _3413;
    reg [7:0] _3418;
    wire [7:0] _3419;
    wire [7:0] _217;
    reg [7:0] _911;
    wire _913;
    wire [3:0] _1113;
    reg _1114;
    wire _1116;
    wire [15:0] _1108;
    wire _1110;
    wire [15:0] _1099;
    wire [16:0] _1100;
    wire [16:0] _1101;
    reg [16:0] _1104;
    wire _1105;
    wire _1106;
    wire [15:0] _1095;
    wire _1097;
    wire [2:0] _871;
    wire [2:0] _3434;
    wire _3430;
    wire _3431;
    wire _3428;
    wire _3432;
    wire [2:0] _3435;
    wire _3425;
    wire _3426;
    wire _3424;
    wire _3427;
    wire [2:0] _3437;
    wire _3421;
    wire [2:0] _3423;
    wire _3420;
    wire [2:0] _3438;
    wire [2:0] _218;
    reg [2:0] _867;
    wire _869;
    wire [2:0] _872;
    wire _862;
    wire _863;
    wire _861;
    wire _864;
    wire [2:0] _874;
    wire _858;
    wire _859;
    wire [2:0] _875;
    wire _1079;
    wire [2:0] _1081;
    wire [2:0] _850;
    wire [2:0] _3453;
    wire _3449;
    wire _3450;
    wire _3447;
    wire _3451;
    wire [2:0] _3454;
    wire _3444;
    wire _3445;
    wire _3443;
    wire _3446;
    wire [2:0] _3456;
    wire _3440;
    wire [2:0] _3442;
    wire _3439;
    wire [2:0] _3457;
    wire [2:0] _219;
    reg [2:0] _846;
    wire _848;
    wire [2:0] _851;
    wire _841;
    wire _842;
    wire _840;
    wire _843;
    wire [2:0] _853;
    wire _837;
    wire _838;
    wire [2:0] _854;
    wire _1076;
    wire [2:0] _1078;
    wire _1082;
    wire [2:0] _1083;
    wire [2:0] _827;
    wire [2:0] _3472;
    wire _3468;
    wire _3469;
    wire _3466;
    wire _3470;
    wire [2:0] _3473;
    wire _3463;
    wire _3464;
    wire _3462;
    wire _3465;
    wire [2:0] _3475;
    wire _3459;
    wire [2:0] _3461;
    wire _3458;
    wire [2:0] _3476;
    wire [2:0] _220;
    reg [2:0] _823;
    wire _825;
    wire [2:0] _828;
    wire _818;
    wire _819;
    wire _817;
    wire _820;
    wire [2:0] _830;
    wire _814;
    wire _815;
    wire [2:0] _831;
    wire _1071;
    wire [2:0] _1073;
    wire [2:0] _806;
    wire [2:0] _3491;
    wire _3487;
    wire _3488;
    wire _3485;
    wire _3489;
    wire [2:0] _3492;
    wire _3482;
    wire _3483;
    wire _3481;
    wire _3484;
    wire [2:0] _3494;
    wire _3478;
    wire [2:0] _3480;
    wire _3477;
    wire [2:0] _3495;
    wire [2:0] _221;
    reg [2:0] _802;
    wire _804;
    wire [2:0] _807;
    wire _797;
    wire _798;
    wire _796;
    wire _799;
    wire [2:0] _809;
    wire _793;
    wire _794;
    wire [2:0] _810;
    wire _1068;
    wire [2:0] _1070;
    wire _1074;
    wire [2:0] _1075;
    wire _1084;
    wire [2:0] _1085;
    wire [2:0] _781;
    wire [2:0] _3510;
    wire _3506;
    wire _3507;
    wire _3504;
    wire _3508;
    wire [2:0] _3511;
    wire _3501;
    wire _3502;
    wire _3500;
    wire _3503;
    wire [2:0] _3513;
    wire _3497;
    wire [2:0] _3499;
    wire _3496;
    wire [2:0] _3514;
    wire [2:0] _222;
    reg [2:0] _777;
    wire _779;
    wire [2:0] _782;
    wire _772;
    wire _773;
    wire _771;
    wire _774;
    wire [2:0] _784;
    wire _768;
    wire _769;
    wire [2:0] _785;
    wire _1061;
    wire [2:0] _1063;
    wire [2:0] _760;
    wire [2:0] _3529;
    wire _3525;
    wire _3526;
    wire _3523;
    wire _3527;
    wire [2:0] _3530;
    wire _3520;
    wire _3521;
    wire _3519;
    wire _3522;
    wire [2:0] _3532;
    wire _3516;
    wire [2:0] _3518;
    wire _3515;
    wire [2:0] _3533;
    wire [2:0] _223;
    reg [2:0] _756;
    wire _758;
    wire [2:0] _761;
    wire _751;
    wire _752;
    wire _750;
    wire _753;
    wire [2:0] _763;
    wire _747;
    wire _748;
    wire [2:0] _764;
    wire _1058;
    wire [2:0] _1060;
    wire _1064;
    wire [2:0] _1065;
    wire [2:0] _737;
    wire [2:0] _3548;
    wire _3544;
    wire _3545;
    wire _3542;
    wire _3546;
    wire [2:0] _3549;
    wire _3539;
    wire _3540;
    wire _3538;
    wire _3541;
    wire [2:0] _3551;
    wire _3535;
    wire [2:0] _3537;
    wire _3534;
    wire [2:0] _3552;
    wire [2:0] _224;
    reg [2:0] _733;
    wire _735;
    wire [2:0] _738;
    wire _728;
    wire _729;
    wire _727;
    wire _730;
    wire [2:0] _740;
    wire _724;
    wire _725;
    wire [2:0] _741;
    wire _1053;
    wire [2:0] _1055;
    wire [2:0] _716;
    wire [2:0] _3567;
    wire _3563;
    wire _3564;
    wire _3561;
    wire _3565;
    wire [2:0] _3568;
    wire _3558;
    wire _3559;
    wire _3557;
    wire _3560;
    wire [2:0] _3570;
    wire _3554;
    wire [2:0] _3556;
    wire _3553;
    wire [2:0] _3571;
    wire [2:0] _225;
    reg [2:0] _712;
    wire _714;
    wire [2:0] _717;
    wire _707;
    wire _708;
    wire _706;
    wire _709;
    wire [2:0] _719;
    wire _703;
    wire _704;
    wire [2:0] _720;
    wire [7:0] _1049;
    wire _1050;
    wire [2:0] _1052;
    wire _1056;
    wire [2:0] _1057;
    wire _1066;
    wire [2:0] _1067;
    wire _1086;
    wire [2:0] _1087;
    wire [16:0] _1088;
    wire _3574;
    wire [127:0] _3575;
    wire _3572;
    wire [127:0] _3576;
    wire [127:0] _226;
    reg [127:0] _635;
    wire _692;
    wire _693;
    wire [127:0] _694;
    wire _3579;
    wire [127:0] _3580;
    wire _3577;
    wire [127:0] _3581;
    wire [127:0] _227;
    reg [127:0] _632;
    wire _688;
    wire _689;
    wire [127:0] _690;
    wire _3584;
    wire [127:0] _3585;
    wire _3582;
    wire [127:0] _3586;
    wire [127:0] _228;
    reg [127:0] _629;
    wire _684;
    wire _685;
    wire [127:0] _686;
    wire _1777;
    wire _230;
    wire _3609;
    wire [127:0] _232;
    reg [127:0] _3610[0:255];
    wire [1:0] _3606;
    wire [5:0] _234;
    wire [111:0] _1008;
    wire [5:0] _3595;
    wire [111:0] _1002;
    wire [5:0] _3594;
    wire [5:0] _3593;
    wire [5:0] _3592;
    reg [5:0] _3596;
    wire _3597;
    wire _3598;
    wire [5:0] _3599;
    wire [5:0] _236;
    wire [1:0] _1020;
    wire _3589;
    wire [5:0] _3590;
    wire [5:0] _3591;
    wire [5:0] _3600;
    wire _3587;
    wire [5:0] _3601;
    wire [5:0] _3602;
    wire [5:0] _237;
    reg [5:0] _1449;
    wire [7:0] _3607;
    wire [7:0] _239;
    wire _3604;
    wire _3605;
    wire [7:0] _3608;
    wire [127:0] _3611;
    reg [127:0] _3614;
    wire [127:0] _240;
    wire _680;
    wire _681;
    wire [127:0] _682;
    wire [511:0] _695;
    wire [111:0] _1045;
    wire [15:0] _1046;
    wire [16:0] _1047;
    wire [16:0] _1089;
    reg [16:0] _1092;
    wire gnd;
    wire [16:0] _1044;
    wire _1093;
    wire _1094;
    wire _1098;
    wire _1107;
    wire [15:0] _3642;
    wire _3638;
    wire _3639;
    wire _3640;
    wire [15:0] _3643;
    wire _3622;
    wire _3623;
    wire [15:0] _3645;
    wire [15:0] _3647;
    wire [15:0] _241;
    reg [15:0] _669;
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
    wire [8:0] _242;
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
    wire [15:0] _243;
    reg [15:0] _666;
    wire [1:0] _1040;
    reg [15:0] _1041;
    wire _1043;
    wire _1111;
    reg [7:0] _291;
    wire [7:0] f_chg_now;
    wire _3666;
    wire [7:0] _3668;
    wire _3665;
    wire [7:0] _3669;
    wire [7:0] _3671;
    wire [7:0] _244;
    reg [7:0] _651;
    wire [7:0] f_changed_all;
    wire [7:0] _1034;
    wire _1036;
    wire _1037;
    wire [7:0] f_chgmask1;
    wire _1033;
    wire _1038;
    wire [7:0] _1027;
    wire [7:0] _1025;
    wire vdd;
    wire _246;
    wire _248;
    wire [7:0] _250;
    reg [7:0] _276;
    reg [7:0] _279;
    wire [7:0] _1026;
    wire [7:0] _1028;
    wire _1030;
    wire [111:0] _996;
    wire f_valid1;
    wire _1031;
    wire _1039;
    wire _1112;
    wire _1117;
    wire _1156;
    wire _1157;
    wire _1161;
    wire f_fire1;
    wire [1:0] _1454;
    wire [1:0] f_winner;
    reg [2:0] _3619;
    wire [2:0] _3621;
    wire _3672;
    wire _3673;
    wire [15:0] _3682;
    wire [15:0] _3684;
    wire [15:0] _251;
    reg [15:0] _663;
    wire [1:0] _1645;
    reg [15:0] _1646;
    wire [15:0] _1644;
    wire _1647;
    wire [63:0] _991;
    wire _1642;
    wire _1640;
    wire _1641;
    wire _1643;
    wire _1648;
    wire _1653;
    wire _1661;
    wire _1662;
    wire [2:0] _3690;
    wire [2:0] _3693;
    wire _3686;
    wire [2:0] _3694;
    wire _3685;
    wire [2:0] _3697;
    wire [2:0] _3699;
    wire [2:0] _252;
    reg [2:0] _678;
    wire _3702;
    wire [127:0] _3703;
    wire _3700;
    wire [127:0] _3704;
    wire [127:0] _253;
    reg [127:0] _626;
    wire [511:0] _636;
    wire [111:0] _637;
    wire f_valid0;
    wire _645;
    wire _659;
    wire _907;
    wire _936;
    wire _980;
    wire f_in_eval;
    wire _981;
    wire _990;
    wire f_fire0;
    wire _1163;
    wire _1302;
    wire _1441;
    wire [1:0] _3723;
    wire _3708;
    wire [1:0] _3710;
    wire _3706;
    wire [1:0] _3724;
    wire _3705;
    wire [1:0] _3727;
    wire _255;
    wire [1:0] _3729;
    wire [1:0] _3731;
    wire [1:0] _256;
    reg [1:0] _621;
    wire f_in_fetch;
    wire _1593;
    wire _1594;
    wire _2292;
    wire [7:0] _3753;
    wire _258;
    wire [7:0] _3755;
    wire [7:0] _259;
    reg [7:0] _2356;
    wire _2357;
    wire [23:0] _261;
    wire [2:0] _2353;
    reg _2364;
    wire [7:0] _2428;
    wire [7:0] _3757;
    assign _397 = 3'b000;
    assign _427 = 3'b001;
    assign _428 = _426 ? _427 : _402;
    assign _400 = 3'b100;
    assign _399 = 3'b010;
    assign _401 = _392 ? _400 : _399;
    assign _402 = _395 ? _401 : _398;
    assign _429 = _380 ? _428 : _402;
    assign _431 = _266 ? _397 : _429;
    assign _433 = _264 ? _397 : _431;
    assign _1 = _433;
    always @(posedge _248) begin
        if (_246)
            _398 <= _397;
        else
            _398 <= _1;
    end
    assign _617 = { _607,
                    _610,
                    _613,
                    _616,
                    gnd,
                    _398 };
    assign _588 = _586 ? _427 : _563;
    assign _562 = _553 ? _400 : _399;
    assign _563 = _556 ? _562 : _559;
    assign _589 = _541 ? _588 : _563;
    assign _591 = _437 ? _397 : _589;
    assign _593 = _435 ? _397 : _591;
    assign _2 = _593;
    always @(posedge _248) begin
        if (_246)
            _559 <= _397;
        else
            _559 <= _2;
    end
    assign _605 = { _595,
                    _598,
                    _601,
                    _604,
                    gnd,
                    _559 };
    assign _618 = { _605,
                    _617 };
    assign _1465 = 1'b0;
    assign _1467 = 1'b1;
    assign _1461 = _1457 == _1460;
    assign _1462 = ~ _1461;
    assign _1446 = _1442 & _1445;
    assign _1463 = _1446 & _1462;
    assign _1468 = _1463 ? _1467 : _1466;
    assign _1470 = _258 ? _1465 : _1468;
    assign _4 = _1470;
    always @(posedge _248) begin
        if (_246)
            _1466 <= _1465;
        else
            _1466 <= _4;
    end
    assign _1473 = _49 & _1472;
    assign _1478 = _1473 ? _1467 : _1476;
    assign _1480 = _258 ? _1465 : _1478;
    assign _6 = _1480;
    always @(posedge _248) begin
        if (_246)
            _1476 <= _1465;
        else
            _1476 <= _6;
    end
    assign _1612 = ~ _1611;
    assign _1605 = _1590 & _1604;
    assign _1613 = _1605 & _1612;
    assign _1586 = ~ _1585;
    assign _1533 = _1483 & _1532;
    assign _1587 = _1533 & _1586;
    assign _1614 = _1587 | _1613;
    assign _8 = _1614;
    assign _1615 = _108 & _925;
    assign _1616 = _1615 | _8;
    assign _1621 = _1616 ? _1467 : _1619;
    assign _1623 = _258 ? _1465 : _1621;
    assign _9 = _1623;
    always @(posedge _248) begin
        if (_246)
            _1619 <= _1465;
        else
            _1619 <= _9;
    end
    assign _1627 = _991[61:61];
    assign _1628 = _1593 & _1627;
    assign _1633 = _1628 ? _1467 : _1631;
    assign _13 = host_irq_ack;
    assign _1635 = _13 ? _1465 : _1633;
    assign _1637 = _258 ? _1465 : _1635;
    assign _14 = _1637;
    always @(posedge _248) begin
        if (_246)
            _1631 <= _1465;
        else
            _1631 <= _14;
    end
    assign _1666 = _1020 == _1665;
    assign _1668 = _1666 ? _1467 : _1626;
    assign _1664 = _1020 == _2275;
    assign _1670 = _1664 ? _1467 : _1668;
    assign _1671 = _1662 ? _1670 : _1626;
    assign _1672 = _1441 ? _1626 : _1671;
    assign _1639 = _621 == _1744;
    assign _1673 = _1639 ? _1672 : _1626;
    assign _1675 = _258 ? _1465 : _1673;
    assign _15 = _1675;
    always @(posedge _248) begin
        if (_246)
            _1626 <= _1465;
        else
            _1626 <= _15;
    end
    assign _1681 = ~ _1680;
    assign _1678 = ~ _1677;
    assign _1682 = _1678 | _1681;
    assign _1683 = _1682 | _1626;
    assign _1684 = _1683 | _1631;
    assign _1789 = ~ _1782;
    assign _1788 = ~ _1731;
    assign _1790 = _1788 & _1789;
    assign _1787 = 32'b00000000000000000000000000000000;
    assign _1781 = ~ _1445;
    assign _1779 = ~ _1731;
    assign _18 = host_cov_we;
    assign _1778 = _18 & _1777;
    assign _1780 = _1778 & _1779;
    assign _1782 = _1780 & _1781;
    assign _1783 = _1731 | _1782;
    assign _1770 = _35[11:0];
    assign _1767 = _1760 < _1757;
    assign _1768 = _1742 & _1767;
    assign _1769 = _1768 ? _1757 : _1760;
    assign _1771 = _1769 < _1770;
    assign _1772 = _1771 ? _1770 : _1769;
    assign _1773 = _1753 ? _1769 : _1772;
    assign _1759 = 12'b000000000000;
    assign _1717 = 12'b111111111111;
    assign _1714 = _1712[11:0];
    assign _1711 = 13'b0000000000000;
    assign _1708 = 10'b0000000000;
    assign _1709 = { _1708,
                     _1705 };
    assign _1710 = _1701 - _1709;
    always @* begin
        case (f_winner)
        0:
            _1685 <= _950;
        1:
            _1685 <= _1126;
        2:
            _1685 <= _1265;
        default:
            _1685 <= _1404;
        endcase
    end
    assign _19 = _1685;
    always @(posedge _248) begin
        if (_246)
            _1705 <= _397;
        else
            _1705 <= _19;
    end
    assign _1706 = { _1708,
                     _1705 };
    assign _1691 = 13'b1111111111111;
    assign _1690 = _1688[12:0];
    assign _1686 = 16'b0001111111111111;
    assign _1689 = _1686 < _1688;
    assign _1692 = _1689 ? _1691 : _1690;
    assign _20 = _1692;
    always @(posedge _248) begin
        if (_246)
            _1701 <= _1711;
        else
            _1701 <= _20;
    end
    assign _1707 = _1701 < _1706;
    assign _1712 = _1707 ? _1711 : _1710;
    assign _1698 = 13'b0111111111111;
    assign _1713 = _1698 < _1712;
    assign _1716 = _1713 ? _1717 : _1714;
    assign _1693 = 16'b1111111111111111;
    assign _1694 = _1688 == _1693;
    assign _21 = _1694;
    always @(posedge _248) begin
        if (_246)
            _1697 <= _1465;
        else
            _1697 <= _21;
    end
    assign _1718 = _1697 ? _1717 : _1716;
    assign _22 = _1718;
    always @(posedge _248) begin
        if (_246)
            _1760 <= _1759;
        else
            _1760 <= _22;
    end
    assign _1721 = _1688[11:0];
    always @* begin
        case (f_winner)
        0:
            _1687 <= _660;
        1:
            _1687 <= _1040;
        2:
            _1687 <= _1179;
        default:
            _1687 <= _1318;
        endcase
    end
    always @* begin
        case (_1687)
        0:
            _1688 <= _663;
        1:
            _1688 <= _666;
        2:
            _1688 <= _669;
        default:
            _1688 <= _669;
        endcase
    end
    assign _1719 = 16'b0000111111111111;
    assign _1720 = _1719 < _1688;
    assign _1723 = _1720 ? _1717 : _1721;
    assign _23 = _1723;
    always @(posedge _248) begin
        if (_246)
            _1757 <= _1759;
        else
            _1757 <= _23;
    end
    assign _1761 = _1757 < _1760;
    assign _1762 = _1742 & _1761;
    assign _1763 = _1762 ? _1757 : _1760;
    assign _1754 = _35[23:12];
    assign _1764 = _1754 < _1763;
    assign _1765 = _1764 ? _1754 : _1763;
    assign _1752 = 8'b00000000;
    assign _1753 = _1737 == _1752;
    assign _1766 = _1753 ? _1763 : _1765;
    assign _1750 = 8'b11111111;
    assign _1749 = _1747[7:0];
    assign _1744 = 2'b10;
    assign _1743 = 2'b01;
    assign _1725 = _1457 == _1460;
    assign _1724 = _1442 & _1445;
    assign _1726 = _1724 & _1725;
    assign _24 = _1726;
    always @(posedge _248) begin
        if (_246)
            _1742 <= _1465;
        else
            _1742 <= _24;
    end
    assign _1745 = _1742 ? _1744 : _1743;
    assign _1739 = 7'b0000000;
    assign _1746 = { _1739,
                     _1745 };
    assign _1737 = _35[31:24];
    assign _1738 = { gnd,
                     _1737 };
    assign _1747 = _1738 + _1746;
    assign _1748 = _1747[8:8];
    assign _1751 = _1748 ? _1750 : _1749;
    assign _1774 = { _1751,
                     _1766,
                     _1773 };
    assign _26 = host_cov_wdata;
    assign _1775 = _1731 ? _1774 : _26;
    always @(posedge _248) begin
        if (_1783)
            _1784[_1736] <= _1775;
    end
    assign _27 = _1460;
    always @(posedge _248) begin
        if (_246)
            _1735 <= _1752;
        else
            _1735 <= _27;
    end
    assign _1457 = { _1449,
                     f_winner };
    assign _28 = _1457;
    always @(posedge _248) begin
        if (_246)
            _1460 <= _1752;
        else
            _1460 <= _28;
    end
    assign _30 = host_cov_addr;
    assign _1732 = _1445 ? _1460 : _30;
    assign _1727 = ~ _1445;
    assign _32 = host_cover_en;
    assign _1442 = _1441 & _32;
    assign _1728 = _1442 & _1727;
    assign _33 = _1728;
    always @(posedge _248) begin
        if (_246)
            _1445 <= _1465;
        else
            _1445 <= _33;
    end
    assign _34 = _1445;
    always @(posedge _248) begin
        if (_246)
            _1731 <= _1465;
        else
            _1731 <= _34;
    end
    assign _1736 = _1731 ? _1735 : _1732;
    assign _1785 = _1784[_1736];
    always @(posedge _248) begin
        if (_1790)
            _1791 <= _1785;
    end
    assign _35 = _1791;
    assign _2158 = 3'b111;
    assign _2159 = _1796 == _2158;
    assign _2160 = _1793 & _2159;
    assign _2157 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _248) begin
        if (_246)
            _2161 <= _2157;
        else
            if (_2160)
                _2161 <= _48;
    end
    assign _2152 = 3'b110;
    assign _2153 = _1796 == _2152;
    assign _2154 = _1793 & _2153;
    always @(posedge _248) begin
        if (_246)
            _2155 <= _2157;
        else
            if (_2154)
                _2155 <= _48;
    end
    assign _2146 = 3'b101;
    assign _2147 = _1796 == _2146;
    assign _2148 = _1793 & _2147;
    always @(posedge _248) begin
        if (_246)
            _2149 <= _2157;
        else
            if (_2148)
                _2149 <= _48;
    end
    assign _2141 = _1796 == _400;
    assign _2142 = _1793 & _2141;
    always @(posedge _248) begin
        if (_246)
            _2143 <= _2157;
        else
            if (_2142)
                _2143 <= _48;
    end
    assign _2134 = 3'b011;
    assign _2135 = _1796 == _2134;
    assign _2136 = _1793 & _2135;
    always @(posedge _248) begin
        if (_246)
            _2137 <= _2157;
        else
            if (_2136)
                _2137 <= _48;
    end
    assign _2129 = _1796 == _399;
    assign _2130 = _1793 & _2129;
    always @(posedge _248) begin
        if (_246)
            _2131 <= _2157;
        else
            if (_2130)
                _2131 <= _48;
    end
    assign _2123 = _1796 == _427;
    assign _2124 = _1793 & _2123;
    always @(posedge _248) begin
        if (_246)
            _2125 <= _2157;
        else
            if (_2124)
                _2125 <= _48;
    end
    assign _1798 = _1796 + _427;
    assign _1799 = _1793 ? _1798 : _1796;
    assign _38 = _1799;
    always @(posedge _248) begin
        if (_246)
            _1796 <= _397;
        else
            _1796 <= _38;
    end
    assign _2117 = _1796 == _397;
    assign _2118 = _1793 & _2117;
    assign _2090 = _1981 - _2086;
    assign _1807 = 29'b11111111111111111111111111111;
    assign _1806 = 29'b00000000000000000000000000000;
    assign _1809 = 29'b00000000000000000000000000001;
    assign _1810 = ts_hi_m1 + _1809;
    assign _1803 = ts_reg[2:0];
    assign _1805 = _1803 == _2158;
    assign _1811 = _1805 ? _1810 : ts_hi_m1;
    assign _39 = _1811;
    always @(posedge _248) begin
        if (_246)
            ts_hi_m1 <= _1807;
        else
            ts_hi_m1 <= _39;
    end
    assign _2088 = ts_reg[31:3];
    assign _1829 = _1816 + _427;
    assign _1825 = _1816 == _2158;
    assign _1826 = ~ _1825;
    assign _1823 = _984[0:0];
    assign _1827 = _1823 & _1826;
    assign _1830 = _1827 ? _1829 : _1816;
    assign _1820 = _984[0:0];
    assign _1821 = ~ _1820;
    assign _1818 = _651[0:0];
    assign _1817 = f_chg_now[0:0];
    assign _1819 = _1817 & _1818;
    assign _1822 = _1819 & _1821;
    assign _1832 = _1822 ? _427 : _1830;
    assign _1813 = _621 == _1743;
    assign _1833 = _1813 ? _1832 : _1816;
    assign _40 = _1833;
    always @(posedge _248) begin
        if (_246)
            _1816 <= _397;
        else
            _1816 <= _40;
    end
    assign _2079 = _984[0:0];
    assign _2081 = _2079 ? _1816 : _397;
    assign _1850 = _1837 + _427;
    assign _1846 = _1837 == _2158;
    assign _1847 = ~ _1846;
    assign _1844 = _984[1:1];
    assign _1848 = _1844 & _1847;
    assign _1851 = _1848 ? _1850 : _1837;
    assign _1841 = _984[1:1];
    assign _1842 = ~ _1841;
    assign _1839 = _651[1:1];
    assign _1838 = f_chg_now[1:1];
    assign _1840 = _1838 & _1839;
    assign _1843 = _1840 & _1842;
    assign _1853 = _1843 ? _427 : _1851;
    assign _1834 = _621 == _1743;
    assign _1854 = _1834 ? _1853 : _1837;
    assign _41 = _1854;
    always @(posedge _248) begin
        if (_246)
            _1837 <= _397;
        else
            _1837 <= _41;
    end
    assign _2076 = _984[1:1];
    assign _2078 = _2076 ? _1837 : _397;
    assign _2082 = _2038 ? _2081 : _2078;
    assign _1871 = _1858 + _427;
    assign _1867 = _1858 == _2158;
    assign _1868 = ~ _1867;
    assign _1865 = _984[2:2];
    assign _1869 = _1865 & _1868;
    assign _1872 = _1869 ? _1871 : _1858;
    assign _1862 = _984[2:2];
    assign _1863 = ~ _1862;
    assign _1860 = _651[2:2];
    assign _1859 = f_chg_now[2:2];
    assign _1861 = _1859 & _1860;
    assign _1864 = _1861 & _1863;
    assign _1874 = _1864 ? _427 : _1872;
    assign _1855 = _621 == _1743;
    assign _1875 = _1855 ? _1874 : _1858;
    assign _42 = _1875;
    always @(posedge _248) begin
        if (_246)
            _1858 <= _397;
        else
            _1858 <= _42;
    end
    assign _2072 = _984[2:2];
    assign _2074 = _2072 ? _1858 : _397;
    assign _1892 = _1879 + _427;
    assign _1888 = _1879 == _2158;
    assign _1889 = ~ _1888;
    assign _1886 = _984[3:3];
    assign _1890 = _1886 & _1889;
    assign _1893 = _1890 ? _1892 : _1879;
    assign _1883 = _984[3:3];
    assign _1884 = ~ _1883;
    assign _1881 = _651[3:3];
    assign _1880 = f_chg_now[3:3];
    assign _1882 = _1880 & _1881;
    assign _1885 = _1882 & _1884;
    assign _1895 = _1885 ? _427 : _1893;
    assign _1876 = _621 == _1743;
    assign _1896 = _1876 ? _1895 : _1879;
    assign _43 = _1896;
    always @(posedge _248) begin
        if (_246)
            _1879 <= _397;
        else
            _1879 <= _43;
    end
    assign _2069 = _984[3:3];
    assign _2071 = _2069 ? _1879 : _397;
    assign _2075 = _2041 ? _2074 : _2071;
    assign _2083 = _2040 ? _2082 : _2075;
    assign _1913 = _1900 + _427;
    assign _1909 = _1900 == _2158;
    assign _1910 = ~ _1909;
    assign _1907 = _984[4:4];
    assign _1911 = _1907 & _1910;
    assign _1914 = _1911 ? _1913 : _1900;
    assign _1904 = _984[4:4];
    assign _1905 = ~ _1904;
    assign _1902 = _651[4:4];
    assign _1901 = f_chg_now[4:4];
    assign _1903 = _1901 & _1902;
    assign _1906 = _1903 & _1905;
    assign _1916 = _1906 ? _427 : _1914;
    assign _1897 = _621 == _1743;
    assign _1917 = _1897 ? _1916 : _1900;
    assign _44 = _1917;
    always @(posedge _248) begin
        if (_246)
            _1900 <= _397;
        else
            _1900 <= _44;
    end
    assign _2064 = _984[4:4];
    assign _2066 = _2064 ? _1900 : _397;
    assign _1934 = _1921 + _427;
    assign _1930 = _1921 == _2158;
    assign _1931 = ~ _1930;
    assign _1928 = _984[5:5];
    assign _1932 = _1928 & _1931;
    assign _1935 = _1932 ? _1934 : _1921;
    assign _1925 = _984[5:5];
    assign _1926 = ~ _1925;
    assign _1923 = _651[5:5];
    assign _1922 = f_chg_now[5:5];
    assign _1924 = _1922 & _1923;
    assign _1927 = _1924 & _1926;
    assign _1937 = _1927 ? _427 : _1935;
    assign _1918 = _621 == _1743;
    assign _1938 = _1918 ? _1937 : _1921;
    assign _45 = _1938;
    always @(posedge _248) begin
        if (_246)
            _1921 <= _397;
        else
            _1921 <= _45;
    end
    assign _2061 = _984[5:5];
    assign _2063 = _2061 ? _1921 : _397;
    assign _2067 = _2045 ? _2066 : _2063;
    assign _1955 = _1942 + _427;
    assign _1951 = _1942 == _2158;
    assign _1952 = ~ _1951;
    assign _1949 = _984[6:6];
    assign _1953 = _1949 & _1952;
    assign _1956 = _1953 ? _1955 : _1942;
    assign _1946 = _984[6:6];
    assign _1947 = ~ _1946;
    assign _1944 = _651[6:6];
    assign _1943 = f_chg_now[6:6];
    assign _1945 = _1943 & _1944;
    assign _1948 = _1945 & _1947;
    assign _1958 = _1948 ? _427 : _1956;
    assign _1939 = _621 == _1743;
    assign _1959 = _1939 ? _1958 : _1942;
    assign _46 = _1959;
    always @(posedge _248) begin
        if (_246)
            _1942 <= _397;
        else
            _1942 <= _46;
    end
    assign _2057 = _984[6:6];
    assign _2059 = _2057 ? _1942 : _397;
    assign _1976 = _1963 + _427;
    assign _1972 = _1963 == _2158;
    assign _1973 = ~ _1972;
    assign _1970 = _984[7:7];
    assign _1974 = _1970 & _1973;
    assign _1977 = _1974 ? _1976 : _1963;
    assign _1967 = _984[7:7];
    assign _1968 = ~ _1967;
    assign _1965 = _651[7:7];
    assign _1964 = f_chg_now[7:7];
    assign _1966 = _1964 & _1965;
    assign _1969 = _1966 & _1968;
    assign _1979 = _1969 ? _427 : _1977;
    assign _1960 = _621 == _1743;
    assign _1980 = _1960 ? _1979 : _1963;
    assign _47 = _1980;
    always @(posedge _248) begin
        if (_246)
            _1963 <= _397;
        else
            _1963 <= _47;
    end
    assign _2054 = _984[7:7];
    assign _2056 = _2054 ? _1963 : _397;
    assign _2060 = _2048 ? _2059 : _2056;
    assign _2068 = _2047 ? _2067 : _2060;
    assign _2084 = _2044 ? _2083 : _2068;
    assign _2049 = _1014[7:7];
    assign _2048 = _1014[6:6];
    assign _2050 = _2048 | _2049;
    assign _2046 = _1014[5:5];
    assign _2045 = _1014[4:4];
    assign _2047 = _2045 | _2046;
    assign _2051 = _2047 | _2050;
    assign _2042 = _1014[3:3];
    assign _2041 = _1014[2:2];
    assign _2043 = _2041 | _2042;
    assign _2039 = _1014[1:1];
    assign _2038 = _1014[0:0];
    assign _2040 = _2038 | _2039;
    assign _2044 = _2040 | _2043;
    assign _2052 = _2044 | _2051;
    assign _2085 = _2052 ? _2084 : _397;
    assign _2027 = f_watch[0:0];
    assign _2026 = _651[0:0];
    assign _2028 = _2026 & _2027;
    assign _2030 = _2028 ? _867 : _397;
    assign _2022 = f_watch[1:1];
    assign _2021 = _651[1:1];
    assign _2023 = _2021 & _2022;
    assign _2025 = _2023 ? _846 : _397;
    assign _2031 = _2025 < _2030;
    assign _2032 = _2031 ? _2030 : _2025;
    assign _2015 = f_watch[2:2];
    assign _2014 = _651[2:2];
    assign _2016 = _2014 & _2015;
    assign _2018 = _2016 ? _823 : _397;
    assign _2010 = f_watch[3:3];
    assign _2009 = _651[3:3];
    assign _2011 = _2009 & _2010;
    assign _2013 = _2011 ? _802 : _397;
    assign _2019 = _2013 < _2018;
    assign _2020 = _2019 ? _2018 : _2013;
    assign _2033 = _2020 < _2032;
    assign _2034 = _2033 ? _2032 : _2020;
    assign _2001 = f_watch[4:4];
    assign _2000 = _651[4:4];
    assign _2002 = _2000 & _2001;
    assign _2004 = _2002 ? _777 : _397;
    assign _1996 = f_watch[5:5];
    assign _1995 = _651[5:5];
    assign _1997 = _1995 & _1996;
    assign _1999 = _1997 ? _756 : _397;
    assign _2005 = _1999 < _2004;
    assign _2006 = _2005 ? _2004 : _1999;
    assign _1989 = f_watch[6:6];
    assign _1988 = _651[6:6];
    assign _1990 = _1988 & _1989;
    assign _1992 = _1990 ? _733 : _397;
    assign _1984 = f_watch[7:7];
    assign _1983 = _651[7:7];
    assign _1985 = _1983 & _1984;
    assign _1987 = _1985 ? _712 : _397;
    assign _1993 = _1987 < _1992;
    assign _1994 = _1993 ? _1992 : _1987;
    assign _2007 = _1994 < _2006;
    assign _2008 = _2007 ? _2006 : _1994;
    assign _2035 = _2008 < _2034;
    assign _2036 = _2035 ? _2034 : _2008;
    assign _2037 = f_unexp_now ? _2036 : _397;
    assign _2086 = f_amb_now ? _2085 : _2037;
    assign _1981 = ts_reg[2:0];
    assign _2087 = _1981 < _2086;
    assign _2089 = _2087 ? ts_hi_m1 : _2088;
    assign _2091 = { _2089,
                     _2090 };
    assign _2095 = { _2091,
                     _1449,
                     _2094,
                     _279 };
    assign _48 = _2095;
    always @(posedge _248) begin
        if (_246)
            _2119 <= _2157;
        else
            if (_2118)
                _2119 <= _48;
    end
    assign _2112 = _2110 + _427;
    assign _1679 = 4'b0000;
    assign _2101 = 4'b0001;
    assign _2102 = _50 + _2101;
    assign _2100 = _50 - _2101;
    assign _2103 = _1793 ? _2102 : _2100;
    assign _1471 = 4'b1000;
    assign _1472 = _50 == _1471;
    assign _1792 = ~ _1472;
    assign _49 = _1662;
    assign _1793 = _49 & _1792;
    assign _2098 = _1793 ^ _2097;
    assign _2104 = _2098 ? _2103 : _50;
    always @(posedge _248) begin
        if (_246)
            _2107 <= _1679;
        else
            _2107 <= _2104;
    end
    assign _50 = _2107;
    assign _1680 = _50 == _1679;
    assign _2096 = ~ _1680;
    assign _52 = host_vlog_pop;
    assign _2097 = _52 & _2096;
    assign _2113 = _2097 ? _2112 : _2110;
    assign _53 = _2113;
    always @(posedge _248) begin
        if (_246)
            _2110 <= _397;
        else
            _2110 <= _53;
    end
    always @* begin
        case (_2110)
        0:
            _2162 <= _2119;
        1:
            _2162 <= _2125;
        2:
            _2162 <= _2131;
        3:
            _2162 <= _2137;
        4:
            _2162 <= _2143;
        5:
            _2162 <= _2149;
        6:
            _2162 <= _2155;
        default:
            _2162 <= _2161;
        endcase
    end
    assign _2266 = _2167 == _2158;
    assign _2267 = _2164 & _2266;
    always @(posedge _248) begin
        if (_246)
            _2268 <= _1752;
        else
            if (_2267)
                _2268 <= _59;
    end
    assign _2260 = _2167 == _2152;
    assign _2261 = _2164 & _2260;
    always @(posedge _248) begin
        if (_246)
            _2262 <= _1752;
        else
            if (_2261)
                _2262 <= _59;
    end
    assign _2254 = _2167 == _2146;
    assign _2255 = _2164 & _2254;
    always @(posedge _248) begin
        if (_246)
            _2256 <= _1752;
        else
            if (_2255)
                _2256 <= _59;
    end
    assign _2248 = _2167 == _400;
    assign _2249 = _2164 & _2248;
    always @(posedge _248) begin
        if (_246)
            _2250 <= _1752;
        else
            if (_2249)
                _2250 <= _59;
    end
    assign _2242 = _2167 == _2134;
    assign _2243 = _2164 & _2242;
    always @(posedge _248) begin
        if (_246)
            _2244 <= _1752;
        else
            if (_2243)
                _2244 <= _59;
    end
    assign _2236 = _2167 == _399;
    assign _2237 = _2164 & _2236;
    always @(posedge _248) begin
        if (_246)
            _2238 <= _1752;
        else
            if (_2237)
                _2238 <= _59;
    end
    assign _2230 = _2167 == _427;
    assign _2231 = _2164 & _2230;
    always @(posedge _248) begin
        if (_246)
            _2232 <= _1752;
        else
            if (_2231)
                _2232 <= _59;
    end
    assign _2169 = _2167 + _427;
    assign _2170 = _2164 ? _2169 : _2167;
    assign _56 = _2170;
    always @(posedge _248) begin
        if (_246)
            _2167 <= _397;
        else
            _2167 <= _56;
    end
    assign _2224 = _2167 == _397;
    assign _2225 = _2164 & _2224;
    assign _2210 = _1540 ? _2209 : _2204;
    assign _2211 = _1546 ? _2209 : _2210;
    assign _2188 = _2187 ? _2185 : _2175;
    assign _2186 = _2172 ? _2185 : _2175;
    assign _2189 = _1585 ? _2188 : _2186;
    assign _57 = _2189;
    always @(posedge _248) begin
        if (_246)
            _2175 <= _1752;
        else
            _2175 <= _57;
    end
    assign _2184 = _1490 ? _2183 : _2178;
    assign _2185 = _1496 ? _2183 : _2184;
    assign _2200 = _1483 ? _2175 : _2185;
    assign _2197 = _2196 ? _920 : _2194;
    assign _2195 = _2191 ? _920 : _2194;
    assign _2198 = _1611 ? _2197 : _2195;
    assign _58 = _2198;
    always @(posedge _248) begin
        if (_246)
            _2194 <= _1752;
        else
            _2194 <= _58;
    end
    assign _2199 = _1590 ? _2194 : _920;
    assign _2201 = _1585 ? _2200 : _2199;
    assign _2212 = _1582 ? _2211 : _2201;
    assign _59 = _2212;
    always @(posedge _248) begin
        if (_246)
            _2226 <= _1752;
        else
            if (_2225)
                _2226 <= _59;
    end
    assign _2219 = _2217 + _427;
    assign _2220 = _2214 ? _2219 : _2217;
    assign _60 = _2220;
    always @(posedge _248) begin
        if (_246)
            _2217 <= _397;
        else
            _2217 <= _60;
    end
    always @* begin
        case (_2217)
        0:
            _2269 <= _2226;
        1:
            _2269 <= _2232;
        2:
            _2269 <= _2238;
        3:
            _2269 <= _2244;
        4:
            _2269 <= _2250;
        5:
            _2269 <= _2256;
        6:
            _2269 <= _2262;
        default:
            _2269 <= _2268;
        endcase
    end
    assign _2272 = 32'b00000000000000000000000000000001;
    assign _2273 = ts_reg + _2272;
    assign _64 = _2273;
    always @(posedge _248) begin
        if (_246)
            ts_reg <= _1787;
        else
            ts_reg <= _64;
    end
    assign _2275 = 2'b00;
    assign _2092 = { _1653,
                     f_unexp_now };
    assign _2094 = f_amb_now ? _2275 : _2092;
    always @(posedge _248) begin
        if (_246)
            _2276 <= _2275;
        else
            _2276 <= _2094;
    end
    always @(posedge _248) begin
        if (_246)
            _2279 <= _1465;
        else
            _2279 <= _1662;
    end
    always @(posedge _248) begin
        if (_246)
            _2282 <= _2275;
        else
            _2282 <= f_winner;
    end
    always @(posedge _248) begin
        if (_246)
            _2285 <= _1465;
        else
            _2285 <= _1441;
    end
    assign _2286 = _991[60:60];
    assign _2287 = f_in_eval & _2286;
    assign _2288 = ~ _1777;
    assign _2429 = _77 & _2428;
    assign _2430 = ~ _2429;
    assign _2310 = _991[23:16];
    assign _2308 = _1008[86:79];
    assign _2307 = _1002[86:79];
    assign _2306 = _996[86:79];
    assign _2305 = _637[86:79];
    always @* begin
        case (f_winner)
        0:
            _2309 <= _2305;
        1:
            _2309 <= _2306;
        2:
            _2309 <= _2307;
        default:
            _2309 <= _2308;
        endcase
    end
    assign _2311 = _1593 ? _2310 : _2309;
    assign _2312 = _2311 & _2302;
    assign _2303 = ~ _2302;
    assign _2304 = _2295 & _2303;
    assign _2313 = _2304 | _2312;
    assign _2347 = _2313 | _2346;
    assign _2348 = _2292 ? _2347 : _2295;
    assign _2350 = _255 ? _1752 : _2348;
    assign _2352 = _258 ? _1752 : _2350;
    assign _74 = _2352;
    always @(posedge _248) begin
        if (_246)
            _2295 <= _1752;
        else
            _2295 <= _74;
    end
    assign _2431 = _2295 & _2430;
    assign _77 = host_open_drain;
    assign _3756 = ~ _77;
    assign _2426 = _553 & _2420;
    assign _2425 = ~ _553;
    assign _2423 = ~ _392;
    assign _2424 = _2423 & _2420;
    assign _2422 = _392 & _2420;
    assign _2421 = ~ _392;
    assign _2420 = _2356[0:0];
    assign _2419 = _261[2:0];
    always @* begin
        case (_2419)
        0:
            _2427 <= _2420;
        1:
            _2427 <= _392;
        2:
            _2427 <= _2421;
        3:
            _2427 <= _2422;
        4:
            _2427 <= _2424;
        5:
            _2427 <= _553;
        6:
            _2427 <= _2425;
        default:
            _2427 <= _2426;
        endcase
    end
    assign _2417 = _553 & _2411;
    assign _2416 = ~ _553;
    assign _2414 = ~ _392;
    assign _2415 = _2414 & _2411;
    assign _2413 = _392 & _2411;
    assign _2412 = ~ _392;
    assign _2411 = _2356[1:1];
    assign _2410 = _261[5:3];
    always @* begin
        case (_2410)
        0:
            _2418 <= _2411;
        1:
            _2418 <= _392;
        2:
            _2418 <= _2412;
        3:
            _2418 <= _2413;
        4:
            _2418 <= _2415;
        5:
            _2418 <= _553;
        6:
            _2418 <= _2416;
        default:
            _2418 <= _2417;
        endcase
    end
    assign _2408 = _553 & _2402;
    assign _2407 = ~ _553;
    assign _2405 = ~ _392;
    assign _2406 = _2405 & _2402;
    assign _2404 = _392 & _2402;
    assign _2403 = ~ _392;
    assign _2402 = _2356[2:2];
    assign _2401 = _261[8:6];
    always @* begin
        case (_2401)
        0:
            _2409 <= _2402;
        1:
            _2409 <= _392;
        2:
            _2409 <= _2403;
        3:
            _2409 <= _2404;
        4:
            _2409 <= _2406;
        5:
            _2409 <= _553;
        6:
            _2409 <= _2407;
        default:
            _2409 <= _2408;
        endcase
    end
    assign _2399 = _553 & _2393;
    assign _2398 = ~ _553;
    assign _2396 = ~ _392;
    assign _2397 = _2396 & _2393;
    assign _2395 = _392 & _2393;
    assign _2394 = ~ _392;
    assign _2393 = _2356[3:3];
    assign _2392 = _261[11:9];
    always @* begin
        case (_2392)
        0:
            _2400 <= _2393;
        1:
            _2400 <= _392;
        2:
            _2400 <= _2394;
        3:
            _2400 <= _2395;
        4:
            _2400 <= _2397;
        5:
            _2400 <= _553;
        6:
            _2400 <= _2398;
        default:
            _2400 <= _2399;
        endcase
    end
    assign _2390 = _553 & _2384;
    assign _2389 = ~ _553;
    assign _2387 = ~ _392;
    assign _2388 = _2387 & _2384;
    assign _2386 = _392 & _2384;
    assign _2385 = ~ _392;
    assign _2384 = _2356[4:4];
    assign _2383 = _261[14:12];
    always @* begin
        case (_2383)
        0:
            _2391 <= _2384;
        1:
            _2391 <= _392;
        2:
            _2391 <= _2385;
        3:
            _2391 <= _2386;
        4:
            _2391 <= _2388;
        5:
            _2391 <= _553;
        6:
            _2391 <= _2389;
        default:
            _2391 <= _2390;
        endcase
    end
    assign _2381 = _553 & _2375;
    assign _2380 = ~ _553;
    assign _2378 = ~ _392;
    assign _2379 = _2378 & _2375;
    assign _2377 = _392 & _2375;
    assign _2376 = ~ _392;
    assign _2375 = _2356[5:5];
    assign _2374 = _261[17:15];
    always @* begin
        case (_2374)
        0:
            _2382 <= _2375;
        1:
            _2382 <= _392;
        2:
            _2382 <= _2376;
        3:
            _2382 <= _2377;
        4:
            _2382 <= _2379;
        5:
            _2382 <= _553;
        6:
            _2382 <= _2380;
        default:
            _2382 <= _2381;
        endcase
    end
    assign _2372 = _553 & _2366;
    assign _2371 = ~ _553;
    assign _2369 = ~ _392;
    assign _2370 = _2369 & _2366;
    assign _2368 = _392 & _2366;
    assign _2367 = ~ _392;
    assign _2366 = _2356[6:6];
    assign _2365 = _261[20:18];
    always @* begin
        case (_2365)
        0:
            _2373 <= _2366;
        1:
            _2373 <= _392;
        2:
            _2373 <= _2367;
        3:
            _2373 <= _2368;
        4:
            _2373 <= _2370;
        5:
            _2373 <= _553;
        6:
            _2373 <= _2371;
        default:
            _2373 <= _2372;
        endcase
    end
    assign _2363 = _553 & _2357;
    assign _2362 = ~ _553;
    assign _2360 = ~ _392;
    assign _2361 = _2360 & _2357;
    assign _2359 = _392 & _2357;
    assign _2358 = ~ _392;
    assign _3748 = { _3746,
                     _3745 };
    assign _3745 = _916[0:0];
    assign _3746 = { _3745,
                     _3745 };
    assign _3747 = { _3746,
                     _3746 };
    assign _3749 = { _3747,
                     _3748 };
    assign _3750 = { _3749,
                     _3745 };
    assign _3751 = _3750 & _2346;
    assign _2344 = _2340 & _2338;
    assign _2343 = _2340 & _2336;
    assign _2342 = _2340 & _2333;
    assign _2340 = ~ _2327;
    assign _2341 = _2340 & _2330;
    assign _2338 = _2335 & _2332;
    assign _2339 = _2327 & _2338;
    assign _2335 = ~ _2328;
    assign _2336 = _2335 & _2329;
    assign _2337 = _2327 & _2336;
    assign _2332 = ~ _2329;
    assign _2333 = _2328 & _2332;
    assign _2334 = _2327 & _2333;
    assign _2329 = _2326[0:0];
    assign _2328 = _2326[1:1];
    assign _2330 = _2328 & _2329;
    assign _2327 = _2326[2:2];
    assign _2331 = _2327 & _2330;
    assign _2345 = { _2331,
                     _2334,
                     _2337,
                     _2339,
                     _2341,
                     _2342,
                     _2343,
                     _2344 };
    assign _2314 = ~ _1593;
    assign _2320 = _2314 & _2319;
    assign _2346 = _2320 ? _2345 : _1752;
    assign _3743 = ~ _2346;
    assign _3739 = _991[15:8];
    assign _3737 = _1008[78:71];
    assign _3736 = _1002[78:71];
    assign _3735 = _996[78:71];
    assign _3734 = _637[78:71];
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
    assign _3740 = _1593 ? _3739 : _3738;
    assign _3741 = _3740 & _2302;
    assign _2301 = _991[7:0];
    assign _2299 = _1008[70:63];
    assign _2298 = _1002[70:63];
    assign _2297 = _996[70:63];
    assign _2296 = _637[70:63];
    always @* begin
        case (f_winner)
        0:
            _2300 <= _2296;
        1:
            _2300 <= _2297;
        2:
            _2300 <= _2298;
        default:
            _2300 <= _2299;
        endcase
    end
    assign _2302 = _1593 ? _2301 : _2300;
    assign _3732 = ~ _2302;
    assign _3733 = _2356 & _3732;
    assign _3742 = _3733 | _3741;
    assign _3744 = _3742 & _3743;
    assign _3752 = _3744 | _3751;
    assign _2290 = _939 == _2275;
    assign _2291 = _2290 | _941;
    assign _1592 = _678 == _400;
    assign _3726 = _1593 ? _1744 : _621;
    assign _3722 = _3598 ? _1743 : _621;
    assign _1665 = 2'b11;
    assign _3713 = _1020 == _1665;
    assign _3715 = _3713 ? _2275 : _621;
    assign _3712 = _1020 == _1744;
    assign _3717 = _3712 ? _1743 : _3715;
    assign _3711 = _1020 == _2275;
    assign _3719 = _3711 ? _2275 : _3717;
    assign _3720 = _1662 ? _3719 : _621;
    assign _1436 = f_chgmask3 & f_multi_eff;
    assign _1438 = _1436 == _1752;
    assign _1429 = _1386 == _1693;
    assign _1424 = 16'b0000000000000000;
    assign _1425 = _1386 == _1424;
    assign _1426 = _1425 & _1406;
    assign _1423 = _1322 == _1382;
    assign _1427 = _1423 | _1426;
    assign _1430 = _1321 ? _1429 : _1427;
    assign _1420 = _928[3:0];
    assign _1422 = _1420 == _1679;
    assign _1431 = _1422 | _1430;
    assign _1418 = _1386 == _1693;
    assign _1414 = _1386 == _1424;
    assign _1415 = _1414 & _1406;
    assign _1412 = _1322 == _1382;
    assign _1416 = _1412 | _1415;
    assign _1419 = _1321 ? _1418 : _1416;
    assign _1410 = _1373 == _1693;
    always @(posedge _248) begin
        if (_246)
            _1404 <= _397;
        else
            _1404 <= _1365;
    end
    assign _1405 = { _1711,
                     _1404 };
    assign _1406 = _1319 < _1405;
    assign _1400 = _1373 == _1424;
    assign _1407 = _1400 & _1406;
    assign _1398 = _1322 == _1370;
    assign _1408 = _1398 | _1407;
    assign _1411 = _1321 ? _1410 : _1408;
    assign _1397 = _1008[104:103];
    always @* begin
        case (_1397)
        0:
            _1432 <= vdd;
        1:
            _1432 <= _1411;
        2:
            _1432 <= _1419;
        default:
            _1432 <= _1431;
        endcase
    end
    assign _1396 = ~ _941;
    assign _1433 = _1396 | _1432;
    assign _1393 = _1008[62:62];
    assign _1391 = _1008[61:58];
    always @* begin
        case (_1391)
        0:
            _1392 <= vdd;
        1:
            _1392 <= _913;
        2:
            _1392 <= _917;
        3:
            _1392 <= _921;
        4:
            _1392 <= _923;
        5:
            _1392 <= _925;
        6:
            _1392 <= _929;
        7:
            _1392 <= _932;
        8:
            _1392 <= _607;
        9:
            _1392 <= _610;
        10:
            _1392 <= _613;
        11:
            _1392 <= _616;
        12:
            _1392 <= _595;
        13:
            _1392 <= _598;
        14:
            _1392 <= _601;
        default:
            _1392 <= _604;
        endcase
    end
    assign _1394 = _1392 ^ _1393;
    assign _1386 = _1008[57:42];
    assign _1388 = _1386 == _1693;
    assign _1381 = 17'b00000000000000000;
    assign _1377 = _1323[57:42];
    assign _1378 = { gnd,
                     _1377 };
    assign _1379 = _1378 + _1366;
    always @(posedge _248) begin
        if (_246)
            _1382 <= _1381;
        else
            _1382 <= _1379;
    end
    assign _1383 = _1382 < _1322;
    assign _1384 = ~ _1383;
    assign _1373 = _1008[41:26];
    assign _1375 = _1373 == _1424;
    assign _1357 = _1327[0:0];
    assign _1359 = _1357 ? _875 : _397;
    assign _1354 = _1327[1:1];
    assign _1356 = _1354 ? _854 : _397;
    assign _1360 = _1356 < _1359;
    assign _1361 = _1360 ? _1359 : _1356;
    assign _1349 = _1327[2:2];
    assign _1351 = _1349 ? _831 : _397;
    assign _1346 = _1327[3:3];
    assign _1348 = _1346 ? _810 : _397;
    assign _1352 = _1348 < _1351;
    assign _1353 = _1352 ? _1351 : _1348;
    assign _1362 = _1353 < _1361;
    assign _1363 = _1362 ? _1361 : _1353;
    assign _1339 = _1327[4:4];
    assign _1341 = _1339 ? _785 : _397;
    assign _1336 = _1327[5:5];
    assign _1338 = _1336 ? _764 : _397;
    assign _1342 = _1338 < _1341;
    assign _1343 = _1342 ? _1341 : _1338;
    assign _1331 = _1327[6:6];
    assign _1333 = _1331 ? _741 : _397;
    assign _1327 = _1323[23:16];
    assign _1328 = _1327[7:7];
    assign _1330 = _1328 ? _720 : _397;
    assign _1334 = _1330 < _1333;
    assign _1335 = _1334 ? _1333 : _1330;
    assign _1344 = _1335 < _1343;
    assign _1345 = _1344 ? _1343 : _1335;
    assign _1364 = _1345 < _1363;
    assign _1365 = _1364 ? _1363 : _1345;
    assign _1326 = 14'b00000000000000;
    assign _1366 = { _1326,
                     _1365 };
    assign _1323 = _695[511:400];
    assign _1324 = _1323[41:26];
    assign _1325 = { gnd,
                     _1324 };
    assign _1367 = _1325 + _1366;
    always @(posedge _248) begin
        if (_246)
            _1370 <= _1381;
        else
            _1370 <= _1367;
    end
    assign _1322 = { gnd,
                     _1319 };
    assign _1371 = _1322 < _1370;
    assign _1372 = ~ _1371;
    assign _1376 = _1372 | _1375;
    assign _1385 = _1376 & _1384;
    assign _1318 = _1008[25:24];
    always @* begin
        case (_1318)
        0:
            _1319 <= _663;
        1:
            _1319 <= _666;
        2:
            _1319 <= _669;
        default:
            _1319 <= _669;
        endcase
    end
    assign _1321 = _1319 == _1693;
    assign _1389 = _1321 ? _1388 : _1385;
    assign _1312 = f_changed_all & f_chgmask3;
    assign _1314 = _1312 == _1752;
    assign _1315 = ~ _1314;
    assign _1311 = f_chgmask3 == _1752;
    assign _1316 = _1311 | _1315;
    assign _1305 = _1008[7:0];
    assign _1303 = _1008[15:8];
    assign _1304 = _279 ^ _1303;
    assign _1306 = _1304 & _1305;
    assign _1308 = _1306 == _1752;
    assign _1309 = f_valid3 & _1308;
    assign _1317 = _1309 & _1316;
    assign _1390 = _1317 & _1389;
    assign _1395 = _1390 & _1394;
    assign _1434 = _1395 & _1433;
    assign _1435 = f_in_eval & _1434;
    assign _1439 = _1435 & _1438;
    assign f_fire3 = _1439 & _1023;
    assign _987 = f_chgmask0 & f_multi_eff;
    assign _989 = _987 == _1752;
    assign _975 = _903 == _1693;
    assign _971 = _903 == _1424;
    assign _972 = _971 & _952;
    assign _969 = _673 == _899;
    assign _973 = _969 | _972;
    assign _976 = _672 ? _975 : _973;
    assign _966 = _928[3:0];
    assign _968 = _966 == _1679;
    assign _977 = _968 | _976;
    assign _964 = _903 == _1693;
    assign _960 = _903 == _1424;
    assign _961 = _960 & _952;
    assign _958 = _673 == _899;
    assign _962 = _958 | _961;
    assign _965 = _672 ? _964 : _962;
    assign _956 = _890 == _1693;
    always @(posedge _248) begin
        if (_246)
            _950 <= _397;
        else
            _950 <= _882;
    end
    assign _951 = { _1711,
                    _950 };
    assign _952 = _670 < _951;
    assign _946 = _890 == _1424;
    assign _953 = _946 & _952;
    assign _944 = _673 == _887;
    assign _954 = _944 | _953;
    assign _957 = _672 ? _956 : _954;
    assign _943 = _637[104:103];
    always @* begin
        case (_943)
        0:
            _978 <= vdd;
        1:
            _978 <= _957;
        2:
            _978 <= _965;
        default:
            _978 <= _977;
        endcase
    end
    assign _942 = ~ _941;
    assign _979 = _942 | _978;
    assign _934 = _637[62:62];
    assign _908 = _637[61:58];
    always @* begin
        case (_908)
        0:
            _933 <= vdd;
        1:
            _933 <= _913;
        2:
            _933 <= _917;
        3:
            _933 <= _921;
        4:
            _933 <= _923;
        5:
            _933 <= _925;
        6:
            _933 <= _929;
        7:
            _933 <= _932;
        8:
            _933 <= _607;
        9:
            _933 <= _610;
        10:
            _933 <= _613;
        11:
            _933 <= _616;
        12:
            _933 <= _595;
        13:
            _933 <= _598;
        14:
            _933 <= _601;
        default:
            _933 <= _604;
        endcase
    end
    assign _935 = _933 ^ _934;
    assign _903 = _637[57:42];
    assign _905 = _903 == _1693;
    assign _894 = _696[57:42];
    assign _895 = { gnd,
                    _894 };
    assign _896 = _895 + _883;
    always @(posedge _248) begin
        if (_246)
            _899 <= _1381;
        else
            _899 <= _896;
    end
    assign _900 = _899 < _673;
    assign _901 = ~ _900;
    assign _890 = _637[41:26];
    assign _892 = _890 == _1424;
    assign _856 = _700[0:0];
    assign _876 = _856 ? _875 : _397;
    assign _835 = _700[1:1];
    assign _855 = _835 ? _854 : _397;
    assign _877 = _855 < _876;
    assign _878 = _877 ? _876 : _855;
    assign _812 = _700[2:2];
    assign _832 = _812 ? _831 : _397;
    assign _791 = _700[3:3];
    assign _811 = _791 ? _810 : _397;
    assign _833 = _811 < _832;
    assign _834 = _833 ? _832 : _811;
    assign _879 = _834 < _878;
    assign _880 = _879 ? _878 : _834;
    assign _766 = _700[4:4];
    assign _786 = _766 ? _785 : _397;
    assign _745 = _700[5:5];
    assign _765 = _745 ? _764 : _397;
    assign _787 = _765 < _786;
    assign _788 = _787 ? _786 : _765;
    assign _722 = _700[6:6];
    assign _742 = _722 ? _741 : _397;
    assign _700 = _696[23:16];
    assign _701 = _700[7:7];
    assign _721 = _701 ? _720 : _397;
    assign _743 = _721 < _742;
    assign _744 = _743 ? _742 : _721;
    assign _789 = _744 < _788;
    assign _790 = _789 ? _788 : _744;
    assign _881 = _790 < _880;
    assign _882 = _881 ? _880 : _790;
    assign _883 = { _1326,
                    _882 };
    assign _696 = _695[175:64];
    assign _697 = _696[41:26];
    assign _698 = { gnd,
                    _697 };
    assign _884 = _698 + _883;
    always @(posedge _248) begin
        if (_246)
            _887 <= _1381;
        else
            _887 <= _884;
    end
    assign _673 = { gnd,
                    _670 };
    assign _888 = _673 < _887;
    assign _889 = ~ _888;
    assign _893 = _889 | _892;
    assign _902 = _893 & _901;
    assign _660 = _637[25:24];
    always @* begin
        case (_660)
        0:
            _670 <= _663;
        1:
            _670 <= _666;
        2:
            _670 <= _669;
        default:
            _670 <= _669;
        endcase
    end
    assign _672 = _670 == _1693;
    assign _906 = _672 ? _905 : _902;
    assign _654 = f_changed_all & f_chgmask0;
    assign _656 = _654 == _1752;
    assign _657 = ~ _656;
    assign _648 = f_chgmask0 == _1752;
    assign _658 = _648 | _657;
    assign _641 = _637[7:0];
    assign _639 = _637[15:8];
    assign _640 = _279 ^ _639;
    assign _642 = _640 & _641;
    assign _644 = _642 == _1752;
    assign _625 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _3696 = _678 + _427;
    assign _3692 = _3598 ? _397 : _678;
    assign _3687 = _1020 == _1744;
    assign _3689 = _3687 ? _397 : _678;
    assign _1656 = f_changed_all & f_watch;
    assign _1658 = _1656 == _1752;
    assign _1659 = ~ _1658;
    assign _1654 = ~ _1441;
    assign _1655 = f_in_eval & _1654;
    assign f_unexp_now = _1655 & _1659;
    assign _2435 = ~ f_amb_now;
    assign _2436 = _1653 & _2435;
    assign _2438 = _2436 ? _1467 : _2434;
    assign _2439 = _1441 ? _2434 : _2438;
    assign _2434 = _1594 ? _1465 : _1651;
    assign _2432 = _621 == _1744;
    assign _2440 = _2432 ? _2439 : _2434;
    assign _78 = _2440;
    always @(posedge _248) begin
        if (_246)
            _1651 <= _1465;
        else
            _1651 <= _78;
    end
    assign _1652 = ~ _1651;
    assign _3678 = 16'b0000000000000001;
    assign _3679 = _663 + _3678;
    assign _3675 = _663 == _1693;
    assign _3676 = ~ _3675;
    assign _3677 = _3636 & _3676;
    assign _3680 = _3677 ? _3679 : _663;
    assign _3620 = _991[26:24];
    assign _3618 = _1008[93:91];
    assign _3617 = _1002[93:91];
    assign _3616 = _996[93:91];
    assign _3615 = _637[93:91];
    assign _1297 = f_chgmask2 & f_multi_eff;
    assign _1299 = _1297 == _1752;
    assign _1290 = _1247 == _1693;
    assign _1286 = _1247 == _1424;
    assign _1287 = _1286 & _1267;
    assign _1284 = _1183 == _1243;
    assign _1288 = _1284 | _1287;
    assign _1291 = _1182 ? _1290 : _1288;
    assign _1281 = _928[3:0];
    assign _1283 = _1281 == _1679;
    assign _1292 = _1283 | _1291;
    assign _1279 = _1247 == _1693;
    assign _1275 = _1247 == _1424;
    assign _1276 = _1275 & _1267;
    assign _1273 = _1183 == _1243;
    assign _1277 = _1273 | _1276;
    assign _1280 = _1182 ? _1279 : _1277;
    assign _1271 = _1234 == _1693;
    always @(posedge _248) begin
        if (_246)
            _1265 <= _397;
        else
            _1265 <= _1226;
    end
    assign _1266 = { _1711,
                     _1265 };
    assign _1267 = _1180 < _1266;
    assign _1261 = _1234 == _1424;
    assign _1268 = _1261 & _1267;
    assign _1259 = _1183 == _1231;
    assign _1269 = _1259 | _1268;
    assign _1272 = _1182 ? _1271 : _1269;
    assign _1258 = _1002[104:103];
    always @* begin
        case (_1258)
        0:
            _1293 <= vdd;
        1:
            _1293 <= _1272;
        2:
            _1293 <= _1280;
        default:
            _1293 <= _1292;
        endcase
    end
    assign _1257 = ~ _941;
    assign _1294 = _1257 | _1293;
    assign _1254 = _1002[62:62];
    assign _1252 = _1002[61:58];
    always @* begin
        case (_1252)
        0:
            _1253 <= vdd;
        1:
            _1253 <= _913;
        2:
            _1253 <= _917;
        3:
            _1253 <= _921;
        4:
            _1253 <= _923;
        5:
            _1253 <= _925;
        6:
            _1253 <= _929;
        7:
            _1253 <= _932;
        8:
            _1253 <= _607;
        9:
            _1253 <= _610;
        10:
            _1253 <= _613;
        11:
            _1253 <= _616;
        12:
            _1253 <= _595;
        13:
            _1253 <= _598;
        14:
            _1253 <= _601;
        default:
            _1253 <= _604;
        endcase
    end
    assign _1255 = _1253 ^ _1254;
    assign _1247 = _1002[57:42];
    assign _1249 = _1247 == _1693;
    assign _1238 = _1184[57:42];
    assign _1239 = { gnd,
                     _1238 };
    assign _1240 = _1239 + _1227;
    always @(posedge _248) begin
        if (_246)
            _1243 <= _1381;
        else
            _1243 <= _1240;
    end
    assign _1244 = _1243 < _1183;
    assign _1245 = ~ _1244;
    assign _1234 = _1002[41:26];
    assign _1236 = _1234 == _1424;
    assign _1218 = _1188[0:0];
    assign _1220 = _1218 ? _875 : _397;
    assign _1215 = _1188[1:1];
    assign _1217 = _1215 ? _854 : _397;
    assign _1221 = _1217 < _1220;
    assign _1222 = _1221 ? _1220 : _1217;
    assign _1210 = _1188[2:2];
    assign _1212 = _1210 ? _831 : _397;
    assign _1207 = _1188[3:3];
    assign _1209 = _1207 ? _810 : _397;
    assign _1213 = _1209 < _1212;
    assign _1214 = _1213 ? _1212 : _1209;
    assign _1223 = _1214 < _1222;
    assign _1224 = _1223 ? _1222 : _1214;
    assign _1200 = _1188[4:4];
    assign _1202 = _1200 ? _785 : _397;
    assign _1197 = _1188[5:5];
    assign _1199 = _1197 ? _764 : _397;
    assign _1203 = _1199 < _1202;
    assign _1204 = _1203 ? _1202 : _1199;
    assign _1192 = _1188[6:6];
    assign _1194 = _1192 ? _741 : _397;
    assign _1188 = _1184[23:16];
    assign _1189 = _1188[7:7];
    assign _1191 = _1189 ? _720 : _397;
    assign _1195 = _1191 < _1194;
    assign _1196 = _1195 ? _1194 : _1191;
    assign _1205 = _1196 < _1204;
    assign _1206 = _1205 ? _1204 : _1196;
    assign _1225 = _1206 < _1224;
    assign _1226 = _1225 ? _1224 : _1206;
    assign _1227 = { _1326,
                     _1226 };
    assign _1184 = _695[399:288];
    assign _1185 = _1184[41:26];
    assign _1186 = { gnd,
                     _1185 };
    assign _1228 = _1186 + _1227;
    always @(posedge _248) begin
        if (_246)
            _1231 <= _1381;
        else
            _1231 <= _1228;
    end
    assign _1183 = { gnd,
                     _1180 };
    assign _1232 = _1183 < _1231;
    assign _1233 = ~ _1232;
    assign _1237 = _1233 | _1236;
    assign _1246 = _1237 & _1245;
    assign _1179 = _1002[25:24];
    always @* begin
        case (_1179)
        0:
            _1180 <= _663;
        1:
            _1180 <= _666;
        2:
            _1180 <= _669;
        default:
            _1180 <= _669;
        endcase
    end
    assign _1182 = _1180 == _1693;
    assign _1250 = _1182 ? _1249 : _1246;
    assign _1173 = f_changed_all & f_chgmask2;
    assign _1175 = _1173 == _1752;
    assign _1176 = ~ _1175;
    assign _1172 = f_chgmask2 == _1752;
    assign _1177 = _1172 | _1176;
    assign _1166 = _1002[7:0];
    assign _1164 = _1002[15:8];
    assign _1165 = _279 ^ _1164;
    assign _1167 = _1165 & _1166;
    assign _1169 = _1167 == _1752;
    assign _1170 = f_valid2 & _1169;
    assign _1178 = _1170 & _1177;
    assign _1251 = _1178 & _1250;
    assign _1256 = _1251 & _1255;
    assign _1295 = _1256 & _1294;
    assign _1296 = f_in_eval & _1295;
    assign _1300 = _1296 & _1299;
    assign f_fire2 = _1300 & _1023;
    assign _1452 = f_fire2 ? _1744 : _1665;
    assign _1022 = _1020 == _1743;
    assign f_chgmask3 = _1008[23:16];
    assign f_valid3 = _1008[111:111];
    assign _1012 = f_valid3 ? f_chgmask3 : _1752;
    assign f_chgmask2 = _1002[23:16];
    assign f_valid2 = _1002[111:111];
    assign _1006 = f_valid2 ? f_chgmask2 : _1752;
    assign _1000 = f_valid1 ? f_chgmask1 : _1752;
    assign f_chgmask0 = _637[23:16];
    assign _994 = f_valid0 ? f_chgmask0 : _1752;
    assign f_watch = _991[57:50];
    assign _995 = f_watch | _994;
    assign _1001 = _995 | _1000;
    assign _1007 = _1001 | _1006;
    assign f_relevant = _1007 | _1012;
    assign _1014 = f_multi_eff & f_relevant;
    assign _1016 = _1014 == _1752;
    assign _1017 = ~ _1016;
    assign f_amb_now = f_in_eval & _1017;
    assign _1019 = ~ f_amb_now;
    assign _1023 = _1019 | _1022;
    assign _985 = _651 & f_chg_now;
    assign _2445 = _651 & f_chg_now;
    assign _2446 = _984 | _2445;
    assign _2442 = _621 == _1744;
    assign _2444 = _2442 ? _1752 : _984;
    assign _2441 = _621 == _1743;
    assign _2447 = _2441 ? _2446 : _2444;
    assign _2449 = _258 ? _1752 : _2447;
    assign _79 = _2449;
    always @(posedge _248) begin
        if (_246)
            _984 <= _1752;
        else
            _984 <= _79;
    end
    assign f_multi_eff = _984 | _985;
    assign _1158 = f_chgmask1 & f_multi_eff;
    assign _1160 = _1158 == _1752;
    assign _1151 = _1108 == _1693;
    assign _1147 = _1108 == _1424;
    assign _1148 = _1147 & _1128;
    assign _1145 = _1044 == _1104;
    assign _1149 = _1145 | _1148;
    assign _1152 = _1043 ? _1151 : _1149;
    assign _1142 = _928[3:0];
    assign _1144 = _1142 == _1679;
    assign _1153 = _1144 | _1152;
    assign _1140 = _1108 == _1693;
    assign _1136 = _1108 == _1424;
    assign _1137 = _1136 & _1128;
    assign _1134 = _1044 == _1104;
    assign _1138 = _1134 | _1137;
    assign _1141 = _1043 ? _1140 : _1138;
    assign _1132 = _1095 == _1693;
    always @(posedge _248) begin
        if (_246)
            _1126 <= _397;
        else
            _1126 <= _1087;
    end
    assign _1127 = { _1711,
                     _1126 };
    assign _1128 = _1041 < _1127;
    assign _1122 = _1095 == _1424;
    assign _1129 = _1122 & _1128;
    assign _1120 = _1044 == _1092;
    assign _1130 = _1120 | _1129;
    assign _1133 = _1043 ? _1132 : _1130;
    assign _1119 = _996[104:103];
    always @* begin
        case (_1119)
        0:
            _1154 <= vdd;
        1:
            _1154 <= _1133;
        2:
            _1154 <= _1141;
        default:
            _1154 <= _1153;
        endcase
    end
    assign _81 = host_role;
    assign _2450 = _258 ? _81 : _939;
    assign _82 = _2450;
    always @(posedge _248) begin
        if (_246)
            _939 <= _2275;
        else
            _939 <= _82;
    end
    assign _941 = _939 == _1744;
    assign _1118 = ~ _941;
    assign _1155 = _1118 | _1154;
    assign _1115 = _996[62:62];
    assign _2454 = _586 ? _1467 : _2452;
    assign _2452 = _556 ? _1467 : _604;
    assign _2455 = _541 ? _2454 : _2452;
    assign _2457 = _437 ? _1465 : _2455;
    assign _2459 = _435 ? _1465 : _2457;
    assign _83 = _2459;
    always @(posedge _248) begin
        if (_246)
            _604 <= _1465;
        else
            _604 <= _83;
    end
    assign _85 = host_lane1_sync_mask;
    assign _87 = host_lane1_sync;
    assign _2465 = _1484 ? _2464 : _2462;
    assign _2466 = _586 ? _2462 : _2465;
    assign _2467 = _541 ? _2466 : _2462;
    assign _2469 = _437 ? _1424 : _2467;
    assign _88 = _2469;
    always @(posedge _248) begin
        if (_246)
            _2462 <= _1424;
        else
            _2462 <= _88;
    end
    assign _2463 = _2462[14:0];
    assign _2464 = { _2463,
                     _577 };
    assign _2470 = _2464 ^ _87;
    assign _2471 = _2470 & _85;
    assign _2473 = _2471 == _1424;
    assign _2475 = _2473 ? _1467 : _601;
    assign _2476 = _1484 ? _2475 : _601;
    assign _2477 = _586 ? _601 : _2476;
    assign _2478 = _541 ? _2477 : _601;
    assign _2480 = _437 ? _1465 : _2478;
    assign _2482 = _435 ? _1465 : _2480;
    assign _89 = _2482;
    always @(posedge _248) begin
        if (_246)
            _601 <= _1465;
        else
            _601 <= _89;
    end
    assign _2495 = _577 == _2494;
    assign _2496 = ~ _2495;
    assign _2498 = _2489 ? _2497 : _2485;
    assign _2499 = _1484 ? _2498 : _2485;
    assign _2500 = _586 ? _2485 : _2499;
    assign _2501 = _541 ? _2500 : _2485;
    assign _2503 = _437 ? _1465 : _2501;
    assign _90 = _2503;
    always @(posedge _248) begin
        if (_246)
            _2485 <= _1465;
        else
            _2485 <= _90;
    end
    assign _2497 = _2485 | _2496;
    assign _2506 = ~ _2497;
    assign _2504 = 6'b000001;
    assign _2505 = _1513 == _2504;
    assign _2507 = _2505 ? _2506 : _598;
    assign _2508 = _2489 ? _2507 : _598;
    assign _2509 = _1484 ? _2508 : _598;
    assign _2510 = _586 ? _598 : _2509;
    assign _2511 = _541 ? _2510 : _598;
    assign _2513 = _437 ? _1465 : _2511;
    assign _2515 = _435 ? _1465 : _2513;
    assign _91 = _2515;
    always @(posedge _248) begin
        if (_246)
            _598 <= _1465;
        else
            _598 <= _91;
    end
    assign _2519 = _426 ? _1467 : _2517;
    assign _2517 = _395 ? _1467 : _616;
    assign _2520 = _380 ? _2519 : _2517;
    assign _2522 = _266 ? _1465 : _2520;
    assign _2524 = _264 ? _1465 : _2522;
    assign _92 = _2524;
    always @(posedge _248) begin
        if (_246)
            _616 <= _1465;
        else
            _616 <= _92;
    end
    assign _94 = host_lane0_sync_mask;
    assign _96 = host_lane0_sync;
    assign _2530 = _1534 ? _2529 : _2527;
    assign _2531 = _426 ? _2527 : _2530;
    assign _2532 = _380 ? _2531 : _2527;
    assign _2534 = _266 ? _1424 : _2532;
    assign _97 = _2534;
    always @(posedge _248) begin
        if (_246)
            _2527 <= _1424;
        else
            _2527 <= _97;
    end
    assign _2528 = _2527[14:0];
    assign _2529 = { _2528,
                     _416 };
    assign _2535 = _2529 ^ _96;
    assign _2536 = _2535 & _94;
    assign _2538 = _2536 == _1424;
    assign _2540 = _2538 ? _1467 : _613;
    assign _2541 = _1534 ? _2540 : _613;
    assign _2542 = _426 ? _613 : _2541;
    assign _2543 = _380 ? _2542 : _613;
    assign _2545 = _266 ? _1465 : _2543;
    assign _2547 = _264 ? _1465 : _2545;
    assign _98 = _2547;
    always @(posedge _248) begin
        if (_246)
            _613 <= _1465;
        else
            _613 <= _98;
    end
    assign _2560 = _416 == _2559;
    assign _2561 = ~ _2560;
    assign _2563 = _2554 ? _2562 : _2550;
    assign _2564 = _1534 ? _2563 : _2550;
    assign _2565 = _426 ? _2550 : _2564;
    assign _2566 = _380 ? _2565 : _2550;
    assign _2568 = _266 ? _1465 : _2566;
    assign _99 = _2568;
    always @(posedge _248) begin
        if (_246)
            _2550 <= _1465;
        else
            _2550 <= _99;
    end
    assign _2562 = _2550 | _2561;
    assign _2571 = ~ _2562;
    assign _2570 = _1563 == _2504;
    assign _2572 = _2570 ? _2571 : _610;
    assign _2573 = _2554 ? _2572 : _610;
    assign _2574 = _1534 ? _2573 : _610;
    assign _2575 = _426 ? _610 : _2574;
    assign _2576 = _380 ? _2575 : _610;
    assign _2578 = _266 ? _1465 : _2576;
    assign _2580 = _264 ? _1465 : _2578;
    assign _100 = _2580;
    always @(posedge _248) begin
        if (_246)
            _610 <= _1465;
        else
            _610 <= _100;
    end
    assign _102 = host_match_addr;
    assign _931 = _102[6:0];
    assign _930 = _920[7:1];
    assign _932 = _930 == _931;
    assign _927 = 16'b1010110011100001;
    assign _2585 = _928[10:10];
    assign _2584 = _928[12:12];
    assign _2586 = _2584 ^ _2585;
    assign _2583 = _928[13:13];
    assign _2587 = _2583 ^ _2586;
    assign _2582 = _928[15:15];
    assign _2588 = _2582 ^ _2587;
    assign _2581 = _928[14:0];
    assign _2589 = { _2581,
                     _2588 };
    assign _103 = _2589;
    always @(posedge _248) begin
        if (_246)
            _928 <= _927;
        else
            _928 <= _103;
    end
    assign _929 = _928[0:0];
    assign _2608 = _109 + _2101;
    assign _2606 = _109 - _2101;
    assign _2609 = _2164 ? _2608 : _2606;
    assign _1677 = _109 == _1679;
    assign _2213 = ~ _1677;
    assign _105 = host_rx_pop;
    assign _2214 = _105 & _2213;
    assign _2163 = ~ _925;
    assign _2196 = _1590 & _1604;
    assign _2593 = _2196 ? _1590 : _1465;
    assign _2190 = ~ _1590;
    assign _2191 = _2190 & _1604;
    assign _2591 = _2191 ? _1467 : _1590;
    assign _1603 = _1601 == _1665;
    assign _1604 = _1594 & _1603;
    assign _1610 = _1590 | _1604;
    assign _1607 = _1483 | _1532;
    assign _1608 = ~ _1607;
    assign _1606 = ~ _1582;
    assign _1609 = _1606 & _1608;
    assign _1611 = _1609 & _1610;
    assign _2594 = _1611 ? _2593 : _2591;
    assign _106 = _2594;
    always @(posedge _248) begin
        if (_246)
            _1590 <= _1465;
        else
            _1590 <= _106;
    end
    assign _2602 = _1590 | _1604;
    assign _2187 = _1483 & _1532;
    assign _2598 = _2187 ? _1483 : _1465;
    assign _2171 = ~ _1483;
    assign _2172 = _2171 & _1532;
    assign _2596 = _2172 ? _1467 : _1483;
    assign _1530 = ~ _1496;
    assign _1524 = _1493 + _427;
    assign _1519 = ~ _571;
    assign _1518 = _1509 & _1517;
    assign _1520 = _1518 & _1519;
    assign _1521 = _1520 & _1489;
    assign _1522 = _1490 | _1521;
    assign _1525 = _1522 ? _1524 : _1493;
    assign _1527 = _1525 == _397;
    assign _1528 = ~ _1527;
    assign _1499 = _1498 & _157;
    assign _1529 = _1499 & _1528;
    assign _1531 = _1529 & _1530;
    assign _1495 = _1493 == _2158;
    assign _1496 = _1490 & _1495;
    assign _1532 = _1496 | _1531;
    assign _1584 = _1483 | _1532;
    assign _1583 = ~ _1582;
    assign _1585 = _1583 & _1584;
    assign _2599 = _1585 ? _2598 : _2596;
    assign _107 = _2599;
    always @(posedge _248) begin
        if (_246)
            _1483 <= _1465;
        else
            _1483 <= _107;
    end
    assign _2600 = _1483 | _1532;
    assign _1580 = ~ _1546;
    assign _1574 = _1543 + _427;
    assign _1569 = ~ _410;
    assign _1568 = _1559 & _1567;
    assign _1570 = _1568 & _1569;
    assign _1571 = _1570 & _1539;
    assign _1572 = _1540 | _1571;
    assign _1575 = _1572 ? _1574 : _1543;
    assign _1577 = _1575 == _397;
    assign _1578 = ~ _1577;
    assign _1549 = _1548 & _209;
    assign _1579 = _1549 & _1578;
    assign _1581 = _1579 & _1580;
    assign _1545 = _1543 == _2158;
    assign _1546 = _1540 & _1545;
    assign _1582 = _1546 | _1581;
    assign _2601 = _1582 | _2600;
    assign _2603 = _2601 | _2602;
    assign _108 = _2603;
    assign _2164 = _108 & _2163;
    assign _2604 = _2164 ^ _2214;
    assign _2610 = _2604 ? _2609 : _109;
    always @(posedge _248) begin
        if (_246)
            _2613 <= _1679;
        else
            _2613 <= _2610;
    end
    assign _109 = _2613;
    assign _925 = _109 == _1471;
    assign _2630 = _920[6:0];
    assign _2631 = { _2630,
                     _2627 };
    assign _2628 = _920[7:1];
    assign _2626 = _279[7:7];
    assign _2625 = _279[6:6];
    assign _2624 = _279[5:5];
    assign _2623 = _279[4:4];
    assign _2622 = _279[3:3];
    assign _2621 = _279[2:2];
    assign _2620 = _279[1:1];
    assign _2619 = _279[0:0];
    assign _2617 = _1008[102:100];
    assign _2616 = _1002[102:100];
    assign _2615 = _996[102:100];
    assign _2614 = _637[102:100];
    always @* begin
        case (f_winner)
        0:
            _2618 <= _2614;
        1:
            _2618 <= _2615;
        2:
            _2618 <= _2616;
        default:
            _2618 <= _2617;
        endcase
    end
    always @* begin
        case (_2618)
        0:
            _2627 <= _2619;
        1:
            _2627 <= _2620;
        2:
            _2627 <= _2621;
        3:
            _2627 <= _2622;
        4:
            _2627 <= _2623;
        5:
            _2627 <= _2624;
        6:
            _2627 <= _2625;
        default:
            _2627 <= _2626;
        endcase
    end
    assign _2629 = { _2627,
                     _2628 };
    assign _1598 = _1008[97:96];
    assign _1597 = _1002[97:96];
    assign _1596 = _996[97:96];
    assign _1595 = _637[97:96];
    always @* begin
        case (f_winner)
        0:
            _1599 <= _1595;
        1:
            _1599 <= _1596;
        2:
            _1599 <= _1597;
        default:
            _1599 <= _1598;
        endcase
    end
    assign _1601 = _1593 ? _2275 : _1599;
    always @* begin
        case (_1601)
        0:
            _2632 <= _920;
        1:
            _2632 <= _2629;
        2:
            _2632 <= _2631;
        default:
            _2632 <= _920;
        endcase
    end
    assign _2633 = _1594 ? _2632 : _920;
    assign _110 = _2633;
    always @(posedge _248) begin
        if (_246)
            _920 <= _1752;
        else
            _920 <= _110;
    end
    assign _921 = _920[0:0];
    assign _3403 = _916[7:1];
    assign _3404 = { vdd,
                     _3403 };
    assign _3401 = _3393[7:7];
    assign _3400 = _3393[6:6];
    assign _3399 = _3393[5:5];
    assign _3398 = _3393[4:4];
    assign _3397 = _3393[3:3];
    assign _3396 = _3393[2:2];
    assign _3395 = _3393[1:1];
    assign _3394 = _3393[0:0];
    assign _3402 = { _3394,
                     _3395,
                     _3396,
                     _3397,
                     _3398,
                     _3399,
                     _3400,
                     _3401 };
    assign _3386 = _215 + _2101;
    assign _3384 = _215 - _2101;
    assign _3387 = _2648 ? _3386 : _3384;
    assign _3057 = ~ _923;
    assign _3378 = ~ _923;
    assign _1500 = ~ _157;
    assign _3012 = ~ _155;
    assign _3013 = _157 & _3012;
    assign _3016 = _3013 ? _1743 : _1744;
    assign _3005 = ~ _1517;
    assign _3006 = _1509 & _3005;
    assign _3007 = _595 | _3006;
    assign _3008 = _3007 | _2997;
    assign _3010 = _3008 ? _1744 : _3004;
    assign _2991 = _569 + _427;
    assign _2988 = _569 + _427;
    assign _2984 = vdd == _581;
    assign _2982 = _569 == _397;
    assign _2983 = ~ _2982;
    assign _2985 = _2983 & _2984;
    assign _2989 = _2985 ? _2988 : _427;
    assign _2980 = _135 == _1744;
    assign _2992 = _2980 ? _2991 : _2989;
    assign _2993 = _2992 == _113;
    assign _2974 = _569 + _427;
    assign _2970 = gnd == _581;
    assign _2968 = _569 == _397;
    assign _2969 = ~ _2968;
    assign _2971 = _2969 & _2970;
    assign _2975 = _2971 ? _2974 : _427;
    assign _2966 = _135 == _1744;
    assign _2977 = _2966 ? _397 : _2975;
    assign _2978 = _2977 == _113;
    assign _2994 = _577 ? _2993 : _2978;
    assign _2995 = _566 & _2994;
    assign _2996 = ~ _2995;
    assign _2962 = _1513 == _2504;
    assign _2959 = 6'b000000;
    assign _2960 = _1513 == _2959;
    assign _2963 = _2489 ? _2962 : _2960;
    assign _2955 = _1488 + _3678;
    assign _2956 = _2955 == _129;
    assign _2953 = _1488 == _129;
    assign _2957 = _1490 ? _2956 : _2953;
    assign _2951 = ~ _586;
    assign _2952 = _541 & _2951;
    assign _2958 = _2952 & _2957;
    assign _2964 = _2958 & _2963;
    assign _2997 = _2964 & _2996;
    assign _2999 = _2997 ? _1665 : _2950;
    assign _3001 = _586 ? _2275 : _2999;
    assign _2947 = _1517 ? _2945 : _1665;
    assign _2943 = _467 & _465;
    assign _2945 = _2943 ? _1744 : _440;
    assign _2948 = _1509 ? _2947 : _2945;
    assign _2723 = _1517 ? _2722 : _2636;
    assign _2724 = _1509 ? _2723 : _2636;
    assign _111 = _2724;
    always @(posedge _248) begin
        if (_246)
            _2636 <= _1465;
        else
            _2636 <= _111;
    end
    assign _2873 = ~ _2722;
    assign _2871 = ~ _553;
    assign _2872 = _2722 ? _553 : _2871;
    always @* begin
        case (_151)
        0:
            _2874 <= _2722;
        1:
            _2874 <= _2872;
        2:
            _2874 <= _2873;
        default:
            _2874 <= _2722;
        endcase
    end
    assign _113 = host_lane1_stuff_len;
    assign _2855 = _569 + _427;
    assign _2856 = _577 ? _2855 : _397;
    assign _2851 = _569 + _427;
    assign _2847 = _577 == _581;
    assign _2845 = _569 == _397;
    assign _2846 = ~ _2845;
    assign _2848 = _2846 & _2847;
    assign _2852 = _2848 ? _2851 : _427;
    assign _2843 = _135 == _1744;
    assign _2857 = _2843 ? _2856 : _2852;
    assign _2858 = _586 ? _2841 : _2857;
    assign _2837 = _569 + _427;
    assign _2838 = _2722 ? _2837 : _397;
    assign _2833 = _569 + _427;
    assign _2719 = _2711[7:7];
    assign _2718 = _2711[6:6];
    assign _2717 = _2711[5:5];
    assign _2716 = _2711[4:4];
    assign _2715 = _2711[3:3];
    assign _2714 = _2711[2:2];
    assign _2713 = _2711[1:1];
    assign _2709 = _2701[7:7];
    assign _2708 = _2701[6:6];
    assign _2707 = _2701[5:5];
    assign _2706 = _2701[4:4];
    assign _2705 = _2701[3:3];
    assign _2704 = _2701[2:2];
    assign _2703 = _2701[1:1];
    assign _2700 = _923 ? _1750 : _2698;
    assign _2181 = _2178[7:1];
    assign _2182 = { _577,
                     _2181 };
    assign _2179 = _2178[6:0];
    assign _2180 = { _2179,
                     _577 };
    assign _2183 = _116 ? _2182 : _2180;
    assign _2729 = _1490 ? _2183 : _2728;
    assign _2730 = _1484 ? _2729 : _2728;
    assign _2731 = _586 ? _2728 : _2730;
    assign _2725 = _1489 ? _2701 : _2178;
    assign _2726 = _571 ? _2178 : _2725;
    assign _2727 = _1517 ? _2726 : _2178;
    assign _2728 = _1509 ? _2727 : _2178;
    assign _2732 = _541 ? _2731 : _2728;
    assign _114 = _2732;
    always @(posedge _248) begin
        if (_246)
            _2178 <= _1752;
        else
            _2178 <= _114;
    end
    assign _2640 = _1493 == _397;
    assign _2637 = ~ _571;
    assign _2638 = _2637 & _1489;
    assign _2641 = _2638 & _2640;
    assign _2701 = _2641 ? _2700 : _2178;
    assign _2702 = _2701[0:0];
    assign _2710 = { _2702,
                     _2703,
                     _2704,
                     _2705,
                     _2706,
                     _2707,
                     _2708,
                     _2709 };
    assign _116 = host_lane1_lsb_first;
    assign _2711 = _116 ? _2701 : _2710;
    assign _2712 = _2711[0:0];
    assign _2740 = _1493 + _427;
    assign _2741 = _1490 ? _2740 : _2738;
    assign _2742 = _1484 ? _2741 : _2738;
    assign _2743 = _586 ? _2738 : _2742;
    assign _2734 = _1493 + _427;
    assign _2735 = _1489 ? _2734 : _1493;
    assign _2736 = _571 ? _1493 : _2735;
    assign _2737 = _1517 ? _2736 : _1493;
    assign _2738 = _1509 ? _2737 : _1493;
    assign _2744 = _541 ? _2743 : _2738;
    assign _2746 = _437 ? _397 : _2744;
    assign _117 = _2746;
    always @(posedge _248) begin
        if (_246)
            _1493 <= _397;
        else
            _1493 <= _117;
    end
    always @* begin
        case (_1493)
        0:
            _2720 <= _2712;
        1:
            _2720 <= _2713;
        2:
            _2720 <= _2714;
        3:
            _2720 <= _2715;
        4:
            _2720 <= _2716;
        5:
            _2720 <= _2717;
        6:
            _2720 <= _2718;
        default:
            _2720 <= _2719;
        endcase
    end
    assign _119 = host_lane1_crc_inv;
    assign _121 = host_lane1_init;
    assign _2788 = _2492[30:0];
    assign _2790 = { _2788,
                     _1465 };
    assign _2782 = _2492[31:31];
    assign _2783 = _577 ^ _2782;
    assign _2785 = _2783 ? _126 : _1787;
    assign _2779 = _2492[30:0];
    assign _2781 = { _2779,
                     _1465 };
    assign _2786 = _2781 ^ _2785;
    assign _2787 = _1490 ? _2786 : _2778;
    assign _123 = host_lane1_crc_width;
    assign _2756 = _1513 - _2504;
    assign _2757 = _2489 ? _2756 : _2754;
    assign _2758 = _1484 ? _2757 : _2754;
    assign _2759 = _586 ? _2754 : _2758;
    assign _2750 = _1513 - _2504;
    assign _2751 = _1489 ? _1513 : _2750;
    assign _2752 = _571 ? _1513 : _2751;
    assign _2753 = _1517 ? _2752 : _1513;
    assign _2754 = _1509 ? _2753 : _1513;
    assign _2760 = _541 ? _2759 : _2754;
    assign _2761 = _2748 ? _123 : _2760;
    assign _2763 = _437 ? _2959 : _2761;
    assign _124 = _2763;
    always @(posedge _248) begin
        if (_246)
            _1513 <= _2959;
        else
            _1513 <= _124;
    end
    assign _1515 = _1513 == _2959;
    assign _1516 = ~ _1515;
    assign _2487 = ~ _1489;
    assign _2486 = _541 & _1484;
    assign _2488 = _2486 & _2487;
    assign _2489 = _2488 & _1516;
    assign _2791 = _2489 ? _2790 : _2787;
    assign _2792 = _1484 ? _2791 : _2778;
    assign _2793 = _586 ? _2778 : _2792;
    assign _126 = host_lane1_poly;
    assign _2770 = _2492[31:31];
    assign _2771 = _2722 ^ _2770;
    assign _2773 = _2771 ? _126 : _1787;
    assign _2767 = _2492[30:0];
    assign _2769 = { _2767,
                     _1465 };
    assign _2774 = _2769 ^ _2773;
    assign _2764 = _2492[30:0];
    assign _2766 = { _2764,
                     _1465 };
    assign _2775 = _1489 ? _2774 : _2766;
    assign _2776 = _571 ? _2492 : _2775;
    assign _2777 = _1517 ? _2776 : _2492;
    assign _2778 = _1509 ? _2777 : _2492;
    assign _2794 = _541 ? _2793 : _2778;
    assign _2795 = _437 ? _121 : _2794;
    assign _2797 = _435 ? _1787 : _2795;
    assign _127 = _2797;
    always @(posedge _248) begin
        if (_246)
            _2492 <= _1787;
        else
            _2492 <= _127;
    end
    assign _2493 = _2492[31:31];
    assign _2494 = _2493 ^ _119;
    assign _129 = host_lane1_frame_bits;
    assign _2817 = _1488 + _3678;
    assign _1485 = _541 & _1484;
    assign _1490 = _1485 & _1489;
    assign _2818 = _1490 ? _2817 : _2815;
    assign _1484 = ~ _571;
    assign _2819 = _1484 ? _2818 : _2815;
    assign _2800 = _586 ? _2799 : _577;
    assign _2798 = _1517 ? _2722 : _581;
    assign _2799 = _1509 ? _2798 : _581;
    assign _2801 = _541 ? _2800 : _2799;
    assign _2803 = _437 ? _1467 : _2801;
    assign _130 = _2803;
    always @(posedge _248) begin
        if (_246)
            _581 <= vdd;
        else
            _581 <= _130;
    end
    assign _582 = ~ _581;
    assign _579 = _135 == _1743;
    assign _583 = _579 ? _582 : gnd;
    assign _2805 = _151 == _1743;
    assign _2806 = _2805 ? _452 : _575;
    assign _2807 = _541 ? _2806 : _575;
    assign _2809 = _437 ? _1467 : _2807;
    assign _131 = _2809;
    always @(posedge _248) begin
        if (_246)
            _575 <= vdd;
        else
            _575 <= _131;
    end
    assign _576 = _452 == _575;
    assign _573 = _151 == _1743;
    assign _577 = _573 ? _576 : _452;
    assign _584 = _577 == _583;
    assign _585 = ~ _584;
    assign _586 = _571 & _585;
    assign _2820 = _586 ? _2815 : _2819;
    assign _2811 = _1488 + _3678;
    assign _2812 = _1489 ? _2811 : _1488;
    assign _2813 = _571 ? _1488 : _2812;
    assign _2814 = _1517 ? _2813 : _1488;
    assign _2815 = _1509 ? _2814 : _1488;
    assign _2821 = _541 ? _2820 : _2815;
    assign _2823 = _437 ? _1424 : _2821;
    assign _132 = _2823;
    always @(posedge _248) begin
        if (_246)
            _1488 <= _1424;
        else
            _1488 <= _132;
    end
    assign _1489 = _1488 < _129;
    assign _2721 = _1489 ? _2720 : _2494;
    assign _2722 = _571 ? _583 : _2721;
    assign _2829 = _2722 == _581;
    assign _2827 = _569 == _397;
    assign _2828 = ~ _2827;
    assign _2830 = _2828 & _2829;
    assign _2834 = _2830 ? _2833 : _427;
    assign _2825 = _135 == _1744;
    assign _2839 = _2825 ? _2838 : _2834;
    assign _2840 = _1517 ? _2839 : _569;
    assign _2841 = _1509 ? _2840 : _569;
    assign _2859 = _541 ? _2858 : _2841;
    assign _2861 = _437 ? _397 : _2859;
    assign _133 = _2861;
    always @(posedge _248) begin
        if (_246)
            _569 <= _397;
        else
            _569 <= _133;
    end
    assign _570 = _569 == _113;
    assign _135 = host_lane1_stuff;
    assign _565 = _135 == _2275;
    assign _566 = ~ _565;
    assign _571 = _566 & _570;
    assign _1510 = _571 | _1489;
    assign _1517 = _1510 | _1516;
    assign _2875 = _1517 ? _2874 : _1467;
    assign _2876 = _1509 ? _2875 : _553;
    assign _1505 = _511 == _1424;
    assign _1503 = _476 == _1424;
    assign _1506 = _504 ? _1505 : _1503;
    assign _1507 = _472 ? vdd : _1506;
    assign _1508 = _155 ? _539 : _1507;
    assign _2868 = ~ _1508;
    assign _2865 = _151 == _1744;
    assign _2862 = ~ _157;
    assign _2863 = _442 & _2862;
    assign _2866 = _2863 & _2865;
    assign _2867 = _2866 & _540;
    assign _2869 = _2867 & _2868;
    assign _2877 = _2869 ? _2636 : _2876;
    assign _2879 = _556 ? _1467 : _2877;
    assign _2881 = _1498 ? _1467 : _2879;
    assign _2883 = _437 ? _1467 : _2881;
    assign _2885 = _435 ? _1467 : _2883;
    assign _136 = _2885;
    always @(posedge _248) begin
        if (_246)
            _553 <= vdd;
        else
            _553 <= _136;
    end
    assign _554 = _452 == _553;
    assign _555 = ~ _554;
    assign _548 = _151 == _1744;
    assign _549 = ~ _548;
    assign _545 = ~ _155;
    assign _138 = host_lane1_readback;
    assign _542 = ~ _157;
    assign _543 = _442 & _542;
    assign _544 = _543 & _138;
    assign _546 = _544 & _545;
    assign _550 = _546 & _549;
    assign _551 = _550 & _540;
    assign _556 = _551 & _555;
    assign _2950 = _556 ? _2275 : _2948;
    assign _537 = ~ _525;
    assign _538 = _534 & _537;
    assign _533 = _291[7:7];
    assign _532 = _291[6:6];
    assign _531 = _291[5:5];
    assign _530 = _291[4:4];
    assign _529 = _291[3:3];
    assign _528 = _291[2:2];
    assign _527 = _291[1:1];
    assign _526 = _291[0:0];
    always @* begin
        case (_140)
        0:
            _534 <= _526;
        1:
            _534 <= _527;
        2:
            _534 <= _528;
        3:
            _534 <= _529;
        4:
            _534 <= _530;
        5:
            _534 <= _531;
        6:
            _534 <= _532;
        default:
            _534 <= _533;
        endcase
    end
    assign _535 = ~ _534;
    assign _524 = _279[7:7];
    assign _523 = _279[6:6];
    assign _522 = _279[5:5];
    assign _521 = _279[4:4];
    assign _520 = _279[3:3];
    assign _519 = _279[2:2];
    assign _518 = _279[1:1];
    assign _517 = _279[0:0];
    assign _140 = host_lane1_clk_pin;
    always @* begin
        case (_140)
        0:
            _525 <= _517;
        1:
            _525 <= _518;
        2:
            _525 <= _519;
        3:
            _525 <= _520;
        4:
            _525 <= _521;
        5:
            _525 <= _522;
        6:
            _525 <= _523;
        default:
            _525 <= _524;
        endcase
    end
    assign _536 = _525 & _535;
    assign _142 = host_lane1_clk_edge;
    assign _539 = _142 ? _538 : _536;
    assign _515 = _500 == _1424;
    assign _512 = _511 == _500;
    assign _505 = _476 == _500;
    assign _503 = ~ _467;
    assign _494 = _144[15:2];
    assign _495 = { _2275,
                    _494 };
    assign _491 = _144[15:1];
    assign _492 = { _1465,
                    _491 };
    assign _496 = _492 + _495;
    assign _488 = _144[15:1];
    assign _489 = { _1465,
                    _488 };
    assign _486 = _157 & _469;
    assign _497 = _486 ? _496 : _489;
    always @(posedge _248) begin
        if (_246)
            _500 <= _1424;
        else
            _500 <= _497;
    end
    assign _501 = _476 < _500;
    assign _478 = _144[15:2];
    assign _479 = { _2275,
                    _478 };
    always @(posedge _248) begin
        if (_246)
            _482 <= _1424;
        else
            _482 <= _479;
    end
    assign _2931 = ~ _467;
    assign _2932 = _502 & _2931;
    assign _2933 = _2932 ? _511 : _476;
    assign _2935 = _472 ? _1424 : _2933;
    assign _2937 = _2935 + _3678;
    assign _2915 = _2909 == _1381;
    assign _507 = _144[15:1];
    assign _508 = { _1465,
                    _507 };
    always @(posedge _248) begin
        if (_246)
            _511 <= _1424;
        else
            _511 <= _508;
    end
    assign _2911 = { gnd,
                     _511 };
    assign _2912 = _2911 == _2909;
    assign _2905 = { gnd,
                     _144 };
    always @(posedge _248) begin
        if (_246)
            _2908 <= _1381;
        else
            _2908 <= _2905;
    end
    assign _2900 = 17'b00000000000000001;
    assign _144 = host_lane1_div_int;
    assign _2899 = { gnd,
                     _144 };
    assign _2901 = _2899 - _2900;
    always @(posedge _248) begin
        if (_246)
            _2904 <= _1381;
        else
            _2904 <= _2901;
    end
    assign _146 = host_lane1_div_frac;
    assign _2919 = { gnd,
                     _146 };
    assign _2921 = _2920[7:0];
    assign _2922 = _2917 ? _2921 : _2893;
    assign _2923 = _2890 ? _2922 : _2893;
    assign _2925 = _437 ? _1752 : _2923;
    assign _147 = _2925;
    always @(posedge _248) begin
        if (_246)
            _2893 <= _1752;
        else
            _2893 <= _147;
    end
    assign _2918 = { gnd,
                     _2893 };
    assign _2920 = _2918 + _2919;
    assign _2926 = _2920[8:8];
    assign _2927 = _2917 ? _2926 : _2898;
    assign _2928 = _2890 ? _2927 : _2898;
    assign _2930 = _437 ? _1465 : _2928;
    assign _148 = _2930;
    always @(posedge _248) begin
        if (_246)
            _2898 <= _1465;
        else
            _2898 <= _148;
    end
    assign _2909 = _2898 ? _2908 : _2904;
    assign _2895 = { gnd,
                     _476 };
    assign _2910 = _2895 == _2909;
    assign _2913 = _504 ? _2912 : _2910;
    assign _2916 = _472 ? _2915 : _2913;
    assign _2894 = ~ _155;
    assign _2917 = _2894 & _2916;
    assign _2939 = _2917 ? _1424 : _2937;
    assign _2889 = ~ _155;
    assign _2887 = _467 & _465;
    assign _595 = _440 == _1665;
    assign _2886 = _442 | _595;
    assign _2888 = _2886 | _2887;
    assign _2890 = _2888 & _2889;
    assign _2940 = _2890 ? _2939 : _476;
    assign _2942 = _437 ? _1424 : _2940;
    assign _149 = _2942;
    always @(posedge _248) begin
        if (_246)
            _476 <= _1424;
        else
            _476 <= _149;
    end
    assign _483 = _476 < _482;
    assign _484 = ~ _483;
    assign _473 = _465 & _469;
    assign _485 = _473 & _484;
    assign _502 = _485 & _501;
    assign _504 = _502 & _503;
    assign _513 = _504 ? _512 : _505;
    assign _151 = host_lane1_code;
    assign _469 = _151 == _1744;
    assign _470 = ~ _469;
    assign _467 = _440 == _1743;
    assign _471 = _467 | _470;
    assign _464 = ~ _155;
    assign _460 = _291[7:7];
    assign _459 = _291[6:6];
    assign _458 = _291[5:5];
    assign _457 = _291[4:4];
    assign _456 = _291[3:3];
    assign _455 = _291[2:2];
    assign _454 = _291[1:1];
    assign _453 = _291[0:0];
    always @* begin
        case (_153)
        0:
            _461 <= _453;
        1:
            _461 <= _454;
        2:
            _461 <= _455;
        3:
            _461 <= _456;
        4:
            _461 <= _457;
        5:
            _461 <= _458;
        6:
            _461 <= _459;
        default:
            _461 <= _460;
        endcase
    end
    assign _451 = _279[7:7];
    assign _450 = _279[6:6];
    assign _449 = _279[5:5];
    assign _448 = _279[4:4];
    assign _447 = _279[3:3];
    assign _446 = _279[2:2];
    assign _445 = _279[1:1];
    assign _444 = _279[0:0];
    assign _153 = host_lane1_data_pin;
    always @* begin
        case (_153)
        0:
            _452 <= _444;
        1:
            _452 <= _445;
        2:
            _452 <= _446;
        3:
            _452 <= _447;
        4:
            _452 <= _448;
        5:
            _452 <= _449;
        6:
            _452 <= _450;
        default:
            _452 <= _451;
        endcase
    end
    assign _462 = _452 ^ _461;
    assign _463 = _157 & _462;
    assign _465 = _463 & _464;
    assign _472 = _465 & _471;
    assign _516 = _472 ? _515 : _513;
    assign _155 = host_lane1_clk_pin_en;
    assign _540 = _155 ? _539 : _516;
    assign _157 = host_lane1_dir;
    assign _443 = _442 & _157;
    assign _541 = _443 & _540;
    assign _3002 = _541 ? _3001 : _2950;
    assign _1498 = _210 == _2152;
    assign _3004 = _1498 ? _2275 : _3002;
    assign _2748 = _210 == _2158;
    assign _3011 = _2748 ? _3010 : _3004;
    assign _437 = _210 == _2146;
    assign _3017 = _437 ? _3016 : _3011;
    assign _435 = _210 == _400;
    assign _3019 = _435 ? _2275 : _3017;
    assign _158 = _3019;
    always @(posedge _248) begin
        if (_246)
            _440 <= _2275;
        else
            _440 <= _158;
    end
    assign _442 = _440 == _1744;
    assign _1501 = _442 & _1500;
    assign _1509 = _1501 & _1508;
    assign _3377 = _1509 & _2641;
    assign _3379 = _3377 & _3378;
    assign _3375 = ~ _923;
    assign _1550 = ~ _209;
    assign _3353 = ~ _207;
    assign _3354 = _209 & _3353;
    assign _3357 = _3354 ? _1743 : _1744;
    assign _3346 = ~ _1567;
    assign _3347 = _1559 & _3346;
    assign _3348 = _607 | _3347;
    assign _3349 = _3348 | _3338;
    assign _3351 = _3349 ? _1744 : _3345;
    assign _3332 = _408 + _427;
    assign _3329 = _408 + _427;
    assign _3325 = vdd == _421;
    assign _3323 = _408 == _397;
    assign _3324 = ~ _3323;
    assign _3326 = _3324 & _3325;
    assign _3330 = _3326 ? _3329 : _427;
    assign _3321 = _187 == _1744;
    assign _3333 = _3321 ? _3332 : _3330;
    assign _3334 = _3333 == _161;
    assign _3315 = _408 + _427;
    assign _3311 = gnd == _421;
    assign _3309 = _408 == _397;
    assign _3310 = ~ _3309;
    assign _3312 = _3310 & _3311;
    assign _3316 = _3312 ? _3315 : _427;
    assign _3307 = _187 == _1744;
    assign _3318 = _3307 ? _397 : _3316;
    assign _3319 = _3318 == _161;
    assign _3335 = _416 ? _3334 : _3319;
    assign _3336 = _405 & _3335;
    assign _3337 = ~ _3336;
    assign _3303 = _1563 == _2504;
    assign _3301 = _1563 == _2959;
    assign _3304 = _2554 ? _3303 : _3301;
    assign _3296 = _1538 + _3678;
    assign _3297 = _3296 == _181;
    assign _3294 = _1538 == _181;
    assign _3298 = _1540 ? _3297 : _3294;
    assign _3292 = ~ _426;
    assign _3293 = _380 & _3292;
    assign _3299 = _3293 & _3298;
    assign _3305 = _3299 & _3304;
    assign _3338 = _3305 & _3337;
    assign _3340 = _3338 ? _1665 : _3291;
    assign _3342 = _426 ? _2275 : _3340;
    assign _3288 = _1567 ? _3286 : _1665;
    assign _3284 = _306 & _304;
    assign _3286 = _3284 ? _1744 : _270;
    assign _3289 = _1559 ? _3288 : _3286;
    assign _3052 = _1567 ? _3051 : _3022;
    assign _3053 = _1559 ? _3052 : _3022;
    assign _159 = _3053;
    always @(posedge _248) begin
        if (_246)
            _3022 <= _1465;
        else
            _3022 <= _159;
    end
    assign _3210 = ~ _3051;
    assign _3208 = ~ _392;
    assign _3209 = _3051 ? _392 : _3208;
    always @* begin
        case (_203)
        0:
            _3211 <= _3051;
        1:
            _3211 <= _3209;
        2:
            _3211 <= _3210;
        default:
            _3211 <= _3051;
        endcase
    end
    assign _161 = host_lane0_stuff_len;
    assign _3192 = _408 + _427;
    assign _3193 = _416 ? _3192 : _397;
    assign _3188 = _408 + _427;
    assign _3184 = _416 == _421;
    assign _3182 = _408 == _397;
    assign _3183 = ~ _3182;
    assign _3185 = _3183 & _3184;
    assign _3189 = _3185 ? _3188 : _427;
    assign _3180 = _187 == _1744;
    assign _3194 = _3180 ? _3193 : _3189;
    assign _3195 = _426 ? _3178 : _3194;
    assign _3174 = _408 + _427;
    assign _3175 = _3051 ? _3174 : _397;
    assign _3170 = _408 + _427;
    assign _3048 = _3040[7:7];
    assign _3047 = _3040[6:6];
    assign _3046 = _3040[5:5];
    assign _3045 = _3040[4:4];
    assign _3044 = _3040[3:3];
    assign _3043 = _3040[2:2];
    assign _3042 = _3040[1:1];
    assign _3038 = _3030[7:7];
    assign _3037 = _3030[6:6];
    assign _3036 = _3030[5:5];
    assign _3035 = _3030[4:4];
    assign _3034 = _3030[3:3];
    assign _3033 = _3030[2:2];
    assign _3032 = _3030[1:1];
    assign _2695 = _2651 == _2158;
    assign _2696 = _2648 & _2695;
    always @(posedge _248) begin
        if (_246)
            _2697 <= _1752;
        else
            if (_2696)
                _2697 <= _164;
    end
    assign _2689 = _2651 == _2152;
    assign _2690 = _2648 & _2689;
    always @(posedge _248) begin
        if (_246)
            _2691 <= _1752;
        else
            if (_2690)
                _2691 <= _164;
    end
    assign _2683 = _2651 == _2146;
    assign _2684 = _2648 & _2683;
    always @(posedge _248) begin
        if (_246)
            _2685 <= _1752;
        else
            if (_2684)
                _2685 <= _164;
    end
    assign _2677 = _2651 == _400;
    assign _2678 = _2648 & _2677;
    always @(posedge _248) begin
        if (_246)
            _2679 <= _1752;
        else
            if (_2678)
                _2679 <= _164;
    end
    assign _2671 = _2651 == _2134;
    assign _2672 = _2648 & _2671;
    always @(posedge _248) begin
        if (_246)
            _2673 <= _1752;
        else
            if (_2672)
                _2673 <= _164;
    end
    assign _2665 = _2651 == _399;
    assign _2666 = _2648 & _2665;
    always @(posedge _248) begin
        if (_246)
            _2667 <= _1752;
        else
            if (_2666)
                _2667 <= _164;
    end
    assign _2659 = _2651 == _427;
    assign _2660 = _2648 & _2659;
    always @(posedge _248) begin
        if (_246)
            _2661 <= _1752;
        else
            if (_2660)
                _2661 <= _164;
    end
    assign _3055 = _2651 + _427;
    assign _3056 = _2648 ? _3055 : _2651;
    assign _162 = _3056;
    always @(posedge _248) begin
        if (_246)
            _2651 <= _397;
        else
            _2651 <= _162;
    end
    assign _2653 = _2651 == _397;
    assign _2654 = _2648 & _2653;
    assign _164 = host_tx_data;
    always @(posedge _248) begin
        if (_246)
            _2655 <= _1752;
        else
            if (_2654)
                _2655 <= _164;
    end
    assign _3060 = _2644 + _427;
    assign _3061 = _3058 ? _3060 : _2644;
    assign _165 = _3061;
    always @(posedge _248) begin
        if (_246)
            _2644 <= _397;
        else
            _2644 <= _165;
    end
    always @* begin
        case (_2644)
        0:
            _2698 <= _2655;
        1:
            _2698 <= _2661;
        2:
            _2698 <= _2667;
        3:
            _2698 <= _2673;
        4:
            _2698 <= _2679;
        5:
            _2698 <= _2685;
        6:
            _2698 <= _2691;
        default:
            _2698 <= _2697;
        endcase
    end
    assign _3029 = _923 ? _1750 : _2698;
    assign _2207 = _2204[7:1];
    assign _2208 = { _416,
                     _2207 };
    assign _2205 = _2204[6:0];
    assign _2206 = { _2205,
                     _416 };
    assign _2209 = _168 ? _2208 : _2206;
    assign _3066 = _1540 ? _2209 : _3065;
    assign _3067 = _1534 ? _3066 : _3065;
    assign _3068 = _426 ? _3065 : _3067;
    assign _3062 = _1539 ? _3030 : _2204;
    assign _3063 = _410 ? _2204 : _3062;
    assign _3064 = _1567 ? _3063 : _2204;
    assign _3065 = _1559 ? _3064 : _2204;
    assign _3069 = _380 ? _3068 : _3065;
    assign _166 = _3069;
    always @(posedge _248) begin
        if (_246)
            _2204 <= _1752;
        else
            _2204 <= _166;
    end
    assign _3026 = _1543 == _397;
    assign _3023 = ~ _410;
    assign _3024 = _3023 & _1539;
    assign _3027 = _3024 & _3026;
    assign _3030 = _3027 ? _3029 : _2204;
    assign _3031 = _3030[0:0];
    assign _3039 = { _3031,
                     _3032,
                     _3033,
                     _3034,
                     _3035,
                     _3036,
                     _3037,
                     _3038 };
    assign _168 = host_lane0_lsb_first;
    assign _3040 = _168 ? _3030 : _3039;
    assign _3041 = _3040[0:0];
    assign _3077 = _1543 + _427;
    assign _3078 = _1540 ? _3077 : _3075;
    assign _3079 = _1534 ? _3078 : _3075;
    assign _3080 = _426 ? _3075 : _3079;
    assign _3071 = _1543 + _427;
    assign _3072 = _1539 ? _3071 : _1543;
    assign _3073 = _410 ? _1543 : _3072;
    assign _3074 = _1567 ? _3073 : _1543;
    assign _3075 = _1559 ? _3074 : _1543;
    assign _3081 = _380 ? _3080 : _3075;
    assign _3083 = _266 ? _397 : _3081;
    assign _169 = _3083;
    always @(posedge _248) begin
        if (_246)
            _1543 <= _397;
        else
            _1543 <= _169;
    end
    always @* begin
        case (_1543)
        0:
            _3049 <= _3041;
        1:
            _3049 <= _3042;
        2:
            _3049 <= _3043;
        3:
            _3049 <= _3044;
        4:
            _3049 <= _3045;
        5:
            _3049 <= _3046;
        6:
            _3049 <= _3047;
        default:
            _3049 <= _3048;
        endcase
    end
    assign _171 = host_lane0_crc_inv;
    assign _173 = host_lane0_init;
    assign _3125 = _2557[30:0];
    assign _3127 = { _3125,
                     _1465 };
    assign _3119 = _2557[31:31];
    assign _3120 = _416 ^ _3119;
    assign _3122 = _3120 ? _178 : _1787;
    assign _3116 = _2557[30:0];
    assign _3118 = { _3116,
                     _1465 };
    assign _3123 = _3118 ^ _3122;
    assign _3124 = _1540 ? _3123 : _3115;
    assign _175 = host_lane0_crc_width;
    assign _3093 = _1563 - _2504;
    assign _3094 = _2554 ? _3093 : _3091;
    assign _3095 = _1534 ? _3094 : _3091;
    assign _3096 = _426 ? _3091 : _3095;
    assign _3087 = _1563 - _2504;
    assign _3088 = _1539 ? _1563 : _3087;
    assign _3089 = _410 ? _1563 : _3088;
    assign _3090 = _1567 ? _3089 : _1563;
    assign _3091 = _1559 ? _3090 : _1563;
    assign _3097 = _380 ? _3096 : _3091;
    assign _3098 = _3085 ? _175 : _3097;
    assign _3100 = _266 ? _2959 : _3098;
    assign _176 = _3100;
    always @(posedge _248) begin
        if (_246)
            _1563 <= _2959;
        else
            _1563 <= _176;
    end
    assign _1565 = _1563 == _2959;
    assign _1566 = ~ _1565;
    assign _2552 = ~ _1539;
    assign _2551 = _380 & _1534;
    assign _2553 = _2551 & _2552;
    assign _2554 = _2553 & _1566;
    assign _3128 = _2554 ? _3127 : _3124;
    assign _3129 = _1534 ? _3128 : _3115;
    assign _3130 = _426 ? _3115 : _3129;
    assign _178 = host_lane0_poly;
    assign _3107 = _2557[31:31];
    assign _3108 = _3051 ^ _3107;
    assign _3110 = _3108 ? _178 : _1787;
    assign _3104 = _2557[30:0];
    assign _3106 = { _3104,
                     _1465 };
    assign _3111 = _3106 ^ _3110;
    assign _3101 = _2557[30:0];
    assign _3103 = { _3101,
                     _1465 };
    assign _3112 = _1539 ? _3111 : _3103;
    assign _3113 = _410 ? _2557 : _3112;
    assign _3114 = _1567 ? _3113 : _2557;
    assign _3115 = _1559 ? _3114 : _2557;
    assign _3131 = _380 ? _3130 : _3115;
    assign _3132 = _266 ? _173 : _3131;
    assign _3134 = _264 ? _1787 : _3132;
    assign _179 = _3134;
    always @(posedge _248) begin
        if (_246)
            _2557 <= _1787;
        else
            _2557 <= _179;
    end
    assign _2558 = _2557[31:31];
    assign _2559 = _2558 ^ _171;
    assign _181 = host_lane0_frame_bits;
    assign _3154 = _1538 + _3678;
    assign _1535 = _380 & _1534;
    assign _1540 = _1535 & _1539;
    assign _3155 = _1540 ? _3154 : _3152;
    assign _1534 = ~ _410;
    assign _3156 = _1534 ? _3155 : _3152;
    assign _3137 = _426 ? _3136 : _416;
    assign _3135 = _1567 ? _3051 : _421;
    assign _3136 = _1559 ? _3135 : _421;
    assign _3138 = _380 ? _3137 : _3136;
    assign _3140 = _266 ? _1467 : _3138;
    assign _182 = _3140;
    always @(posedge _248) begin
        if (_246)
            _421 <= vdd;
        else
            _421 <= _182;
    end
    assign _422 = ~ _421;
    assign _418 = _187 == _1743;
    assign _423 = _418 ? _422 : gnd;
    assign _3142 = _203 == _1743;
    assign _3143 = _3142 ? _288 : _414;
    assign _3144 = _380 ? _3143 : _414;
    assign _3146 = _266 ? _1467 : _3144;
    assign _183 = _3146;
    always @(posedge _248) begin
        if (_246)
            _414 <= vdd;
        else
            _414 <= _183;
    end
    assign _415 = _288 == _414;
    assign _412 = _203 == _1743;
    assign _416 = _412 ? _415 : _288;
    assign _424 = _416 == _423;
    assign _425 = ~ _424;
    assign _426 = _410 & _425;
    assign _3157 = _426 ? _3152 : _3156;
    assign _3148 = _1538 + _3678;
    assign _3149 = _1539 ? _3148 : _1538;
    assign _3150 = _410 ? _1538 : _3149;
    assign _3151 = _1567 ? _3150 : _1538;
    assign _3152 = _1559 ? _3151 : _1538;
    assign _3158 = _380 ? _3157 : _3152;
    assign _3160 = _266 ? _1424 : _3158;
    assign _184 = _3160;
    always @(posedge _248) begin
        if (_246)
            _1538 <= _1424;
        else
            _1538 <= _184;
    end
    assign _1539 = _1538 < _181;
    assign _3050 = _1539 ? _3049 : _2559;
    assign _3051 = _410 ? _423 : _3050;
    assign _3166 = _3051 == _421;
    assign _3164 = _408 == _397;
    assign _3165 = ~ _3164;
    assign _3167 = _3165 & _3166;
    assign _3171 = _3167 ? _3170 : _427;
    assign _3162 = _187 == _1744;
    assign _3176 = _3162 ? _3175 : _3171;
    assign _3177 = _1567 ? _3176 : _408;
    assign _3178 = _1559 ? _3177 : _408;
    assign _3196 = _380 ? _3195 : _3178;
    assign _3198 = _266 ? _397 : _3196;
    assign _185 = _3198;
    always @(posedge _248) begin
        if (_246)
            _408 <= _397;
        else
            _408 <= _185;
    end
    assign _409 = _408 == _161;
    assign _187 = host_lane0_stuff;
    assign _404 = _187 == _2275;
    assign _405 = ~ _404;
    assign _410 = _405 & _409;
    assign _1560 = _410 | _1539;
    assign _1567 = _1560 | _1566;
    assign _3212 = _1567 ? _3211 : _1467;
    assign _3213 = _1559 ? _3212 : _392;
    assign _1555 = _350 == _1424;
    assign _1553 = _315 == _1424;
    assign _1556 = _343 ? _1555 : _1553;
    assign _1557 = _311 ? vdd : _1556;
    assign _1558 = _207 ? _378 : _1557;
    assign _3205 = ~ _1558;
    assign _3202 = _203 == _1744;
    assign _3199 = ~ _209;
    assign _3200 = _272 & _3199;
    assign _3203 = _3200 & _3202;
    assign _3204 = _3203 & _379;
    assign _3206 = _3204 & _3205;
    assign _3214 = _3206 ? _3022 : _3213;
    assign _3216 = _395 ? _1467 : _3214;
    assign _3218 = _1548 ? _1467 : _3216;
    assign _3220 = _266 ? _1467 : _3218;
    assign _3222 = _264 ? _1467 : _3220;
    assign _188 = _3222;
    always @(posedge _248) begin
        if (_246)
            _392 <= vdd;
        else
            _392 <= _188;
    end
    assign _393 = _288 == _392;
    assign _394 = ~ _393;
    assign _387 = _203 == _1744;
    assign _388 = ~ _387;
    assign _384 = ~ _207;
    assign _190 = host_lane0_readback;
    assign _381 = ~ _209;
    assign _382 = _272 & _381;
    assign _383 = _382 & _190;
    assign _385 = _383 & _384;
    assign _389 = _385 & _388;
    assign _390 = _389 & _379;
    assign _395 = _390 & _394;
    assign _3291 = _395 ? _2275 : _3289;
    assign _376 = ~ _364;
    assign _377 = _373 & _376;
    assign _372 = _291[7:7];
    assign _371 = _291[6:6];
    assign _370 = _291[5:5];
    assign _369 = _291[4:4];
    assign _368 = _291[3:3];
    assign _367 = _291[2:2];
    assign _366 = _291[1:1];
    assign _365 = _291[0:0];
    always @* begin
        case (_192)
        0:
            _373 <= _365;
        1:
            _373 <= _366;
        2:
            _373 <= _367;
        3:
            _373 <= _368;
        4:
            _373 <= _369;
        5:
            _373 <= _370;
        6:
            _373 <= _371;
        default:
            _373 <= _372;
        endcase
    end
    assign _374 = ~ _373;
    assign _363 = _279[7:7];
    assign _362 = _279[6:6];
    assign _361 = _279[5:5];
    assign _360 = _279[4:4];
    assign _359 = _279[3:3];
    assign _358 = _279[2:2];
    assign _357 = _279[1:1];
    assign _356 = _279[0:0];
    assign _192 = host_lane0_clk_pin;
    always @* begin
        case (_192)
        0:
            _364 <= _356;
        1:
            _364 <= _357;
        2:
            _364 <= _358;
        3:
            _364 <= _359;
        4:
            _364 <= _360;
        5:
            _364 <= _361;
        6:
            _364 <= _362;
        default:
            _364 <= _363;
        endcase
    end
    assign _375 = _364 & _374;
    assign _194 = host_lane0_clk_edge;
    assign _378 = _194 ? _377 : _375;
    assign _354 = _339 == _1424;
    assign _351 = _350 == _339;
    assign _344 = _315 == _339;
    assign _342 = ~ _306;
    assign _333 = _196[15:2];
    assign _334 = { _2275,
                    _333 };
    assign _330 = _196[15:1];
    assign _331 = { _1465,
                    _330 };
    assign _335 = _331 + _334;
    assign _327 = _196[15:1];
    assign _328 = { _1465,
                    _327 };
    assign _325 = _209 & _308;
    assign _336 = _325 ? _335 : _328;
    always @(posedge _248) begin
        if (_246)
            _339 <= _1424;
        else
            _339 <= _336;
    end
    assign _340 = _315 < _339;
    assign _317 = _196[15:2];
    assign _318 = { _2275,
                    _317 };
    always @(posedge _248) begin
        if (_246)
            _321 <= _1424;
        else
            _321 <= _318;
    end
    assign _3268 = ~ _306;
    assign _3269 = _341 & _3268;
    assign _3270 = _3269 ? _350 : _315;
    assign _3272 = _311 ? _1424 : _3270;
    assign _3274 = _3272 + _3678;
    assign _3252 = _3246 == _1381;
    assign _346 = _196[15:1];
    assign _347 = { _1465,
                    _346 };
    always @(posedge _248) begin
        if (_246)
            _350 <= _1424;
        else
            _350 <= _347;
    end
    assign _3248 = { gnd,
                     _350 };
    assign _3249 = _3248 == _3246;
    assign _3242 = { gnd,
                     _196 };
    always @(posedge _248) begin
        if (_246)
            _3245 <= _1381;
        else
            _3245 <= _3242;
    end
    assign _196 = host_lane0_div_int;
    assign _3236 = { gnd,
                     _196 };
    assign _3238 = _3236 - _2900;
    always @(posedge _248) begin
        if (_246)
            _3241 <= _1381;
        else
            _3241 <= _3238;
    end
    assign _198 = host_lane0_div_frac;
    assign _3256 = { gnd,
                     _198 };
    assign _3258 = _3257[7:0];
    assign _3259 = _3254 ? _3258 : _3230;
    assign _3260 = _3227 ? _3259 : _3230;
    assign _3262 = _266 ? _1752 : _3260;
    assign _199 = _3262;
    always @(posedge _248) begin
        if (_246)
            _3230 <= _1752;
        else
            _3230 <= _199;
    end
    assign _3255 = { gnd,
                     _3230 };
    assign _3257 = _3255 + _3256;
    assign _3263 = _3257[8:8];
    assign _3264 = _3254 ? _3263 : _3235;
    assign _3265 = _3227 ? _3264 : _3235;
    assign _3267 = _266 ? _1465 : _3265;
    assign _200 = _3267;
    always @(posedge _248) begin
        if (_246)
            _3235 <= _1465;
        else
            _3235 <= _200;
    end
    assign _3246 = _3235 ? _3245 : _3241;
    assign _3232 = { gnd,
                     _315 };
    assign _3247 = _3232 == _3246;
    assign _3250 = _343 ? _3249 : _3247;
    assign _3253 = _311 ? _3252 : _3250;
    assign _3231 = ~ _207;
    assign _3254 = _3231 & _3253;
    assign _3276 = _3254 ? _1424 : _3274;
    assign _3226 = ~ _207;
    assign _3224 = _306 & _304;
    assign _607 = _270 == _1665;
    assign _3223 = _272 | _607;
    assign _3225 = _3223 | _3224;
    assign _3227 = _3225 & _3226;
    assign _3277 = _3227 ? _3276 : _315;
    assign _3279 = _266 ? _1424 : _3277;
    assign _201 = _3279;
    always @(posedge _248) begin
        if (_246)
            _315 <= _1424;
        else
            _315 <= _201;
    end
    assign _322 = _315 < _321;
    assign _323 = ~ _322;
    assign _312 = _304 & _308;
    assign _324 = _312 & _323;
    assign _341 = _324 & _340;
    assign _343 = _341 & _342;
    assign _352 = _343 ? _351 : _344;
    assign _203 = host_lane0_code;
    assign _308 = _203 == _1744;
    assign _309 = ~ _308;
    assign _306 = _270 == _1743;
    assign _310 = _306 | _309;
    assign _303 = ~ _207;
    assign _299 = _291[7:7];
    assign _298 = _291[6:6];
    assign _297 = _291[5:5];
    assign _296 = _291[4:4];
    assign _295 = _291[3:3];
    assign _294 = _291[2:2];
    assign _293 = _291[1:1];
    assign _292 = _291[0:0];
    always @* begin
        case (_205)
        0:
            _300 <= _292;
        1:
            _300 <= _293;
        2:
            _300 <= _294;
        3:
            _300 <= _295;
        4:
            _300 <= _296;
        5:
            _300 <= _297;
        6:
            _300 <= _298;
        default:
            _300 <= _299;
        endcase
    end
    assign _287 = _279[7:7];
    assign _286 = _279[6:6];
    assign _285 = _279[5:5];
    assign _284 = _279[4:4];
    assign _283 = _279[3:3];
    assign _282 = _279[2:2];
    assign _281 = _279[1:1];
    assign _280 = _279[0:0];
    assign _205 = host_lane0_data_pin;
    always @* begin
        case (_205)
        0:
            _288 <= _280;
        1:
            _288 <= _281;
        2:
            _288 <= _282;
        3:
            _288 <= _283;
        4:
            _288 <= _284;
        5:
            _288 <= _285;
        6:
            _288 <= _286;
        default:
            _288 <= _287;
        endcase
    end
    assign _301 = _288 ^ _300;
    assign _302 = _209 & _301;
    assign _304 = _302 & _303;
    assign _311 = _304 & _310;
    assign _355 = _311 ? _354 : _352;
    assign _207 = host_lane0_clk_pin_en;
    assign _379 = _207 ? _378 : _355;
    assign _209 = host_lane0_dir;
    assign _273 = _272 & _209;
    assign _380 = _273 & _379;
    assign _3343 = _380 ? _3342 : _3291;
    assign _1548 = _210 == _399;
    assign _3345 = _1548 ? _2275 : _3343;
    assign _3085 = _210 == _2134;
    assign _3352 = _3085 ? _3351 : _3345;
    assign _266 = _210 == _427;
    assign _3358 = _266 ? _3357 : _3352;
    assign _2325 = _1008[90:88];
    assign _2324 = _1002[90:88];
    assign _2323 = _996[90:88];
    assign _2322 = _637[90:88];
    always @* begin
        case (f_winner)
        0:
            _2326 <= _2322;
        1:
            _2326 <= _2323;
        2:
            _2326 <= _2324;
        default:
            _2326 <= _2325;
        endcase
    end
    assign _2318 = _1008[87:87];
    assign _2317 = _1002[87:87];
    assign _2316 = _996[87:87];
    assign _2315 = _637[87:87];
    always @* begin
        case (f_winner)
        0:
            _2319 <= _2315;
        1:
            _2319 <= _2316;
        2:
            _2319 <= _2317;
        default:
            _2319 <= _2318;
        endcase
    end
    assign _3280 = ~ _2319;
    assign _3281 = _1441 & _3280;
    assign _3283 = _3281 ? _2326 : _397;
    assign _210 = _3283;
    assign _264 = _210 == _400;
    assign _3360 = _264 ? _2275 : _3358;
    assign _211 = _3360;
    always @(posedge _248) begin
        if (_246)
            _270 <= _2275;
        else
            _270 <= _211;
    end
    assign _272 = _270 == _1744;
    assign _1551 = _272 & _1550;
    assign _1559 = _1551 & _1558;
    assign _3374 = _1559 & _3027;
    assign _3376 = _3374 & _3375;
    assign _3380 = _3376 | _3379;
    assign _3371 = _3367 == _1744;
    assign _3369 = _3367 == _1743;
    assign _3372 = _3369 | _3371;
    assign _3373 = _1594 & _3372;
    assign _3381 = _3373 | _3380;
    assign _212 = _3381;
    assign _3058 = _212 & _3057;
    assign _2271 = _215 == _1471;
    assign _2647 = ~ _2271;
    assign _214 = host_tx_push;
    assign _2648 = _214 & _2647;
    assign _3382 = _2648 ^ _3058;
    assign _3388 = _3382 ? _3387 : _215;
    always @(posedge _248) begin
        if (_246)
            _3391 <= _1679;
        else
            _3391 <= _3388;
    end
    assign _215 = _3391;
    assign _923 = _215 == _1679;
    assign _3393 = _923 ? _1750 : _2698;
    assign _3366 = _991[28:27];
    assign _3364 = _1008[95:94];
    assign _3363 = _1002[95:94];
    assign _3362 = _996[95:94];
    assign _3361 = _637[95:94];
    always @* begin
        case (f_winner)
        0:
            _3365 <= _3361;
        1:
            _3365 <= _3362;
        2:
            _3365 <= _3363;
        default:
            _3365 <= _3364;
        endcase
    end
    assign _3367 = _1593 ? _3366 : _3365;
    always @* begin
        case (_3367)
        0:
            _3405 <= _916;
        1:
            _3405 <= _3393;
        2:
            _3405 <= _3402;
        default:
            _3405 <= _3404;
        endcase
    end
    assign _3406 = _1594 ? _3405 : _916;
    assign _216 = _3406;
    always @(posedge _248) begin
        if (_246)
            _916 <= _1752;
        else
            _916 <= _216;
    end
    assign _917 = _916[0:0];
    assign _3417 = 8'b00001000;
    assign _3416 = 8'b00000111;
    assign _3414 = 8'b00000001;
    assign _3415 = _911 - _3414;
    assign _3412 = _991[30:29];
    assign _3410 = _1008[99:98];
    assign _3409 = _1002[99:98];
    assign _3408 = _996[99:98];
    assign _3407 = _637[99:98];
    always @* begin
        case (f_winner)
        0:
            _3411 <= _3407;
        1:
            _3411 <= _3408;
        2:
            _3411 <= _3409;
        default:
            _3411 <= _3410;
        endcase
    end
    assign _3413 = _1593 ? _3412 : _3411;
    always @* begin
        case (_3413)
        0:
            _3418 <= _911;
        1:
            _3418 <= _3415;
        2:
            _3418 <= _3416;
        default:
            _3418 <= _3417;
        endcase
    end
    assign _3419 = _1594 ? _3418 : _911;
    assign _217 = _3419;
    always @(posedge _248) begin
        if (_246)
            _911 <= _1752;
        else
            _911 <= _217;
    end
    assign _913 = _911 == _1752;
    assign _1113 = _996[61:58];
    always @* begin
        case (_1113)
        0:
            _1114 <= vdd;
        1:
            _1114 <= _913;
        2:
            _1114 <= _917;
        3:
            _1114 <= _921;
        4:
            _1114 <= _923;
        5:
            _1114 <= _925;
        6:
            _1114 <= _929;
        7:
            _1114 <= _932;
        8:
            _1114 <= _607;
        9:
            _1114 <= _610;
        10:
            _1114 <= _613;
        11:
            _1114 <= _616;
        12:
            _1114 <= _595;
        13:
            _1114 <= _598;
        14:
            _1114 <= _601;
        default:
            _1114 <= _604;
        endcase
    end
    assign _1116 = _1114 ^ _1115;
    assign _1108 = _996[57:42];
    assign _1110 = _1108 == _1693;
    assign _1099 = _1045[57:42];
    assign _1100 = { gnd,
                     _1099 };
    assign _1101 = _1100 + _1088;
    always @(posedge _248) begin
        if (_246)
            _1104 <= _1381;
        else
            _1104 <= _1101;
    end
    assign _1105 = _1104 < _1044;
    assign _1106 = ~ _1105;
    assign _1095 = _996[41:26];
    assign _1097 = _1095 == _1424;
    assign _871 = _867 + _427;
    assign _3434 = _867 + _427;
    assign _3430 = _867 == _2158;
    assign _3431 = ~ _3430;
    assign _3428 = _651[0:0];
    assign _3432 = _3428 & _3431;
    assign _3435 = _3432 ? _3434 : _867;
    assign _3425 = _651[0:0];
    assign _3426 = ~ _3425;
    assign _3424 = f_chg_now[0:0];
    assign _3427 = _3424 & _3426;
    assign _3437 = _3427 ? _427 : _3435;
    assign _3421 = _621 == _1744;
    assign _3423 = _3421 ? _397 : _867;
    assign _3420 = _621 == _1743;
    assign _3438 = _3420 ? _3437 : _3423;
    assign _218 = _3438;
    always @(posedge _248) begin
        if (_246)
            _867 <= _397;
        else
            _867 <= _218;
    end
    assign _869 = _867 == _2158;
    assign _872 = _869 ? _867 : _871;
    assign _862 = _651[0:0];
    assign _863 = ~ _862;
    assign _861 = f_chg_now[0:0];
    assign _864 = _861 & _863;
    assign _874 = _864 ? _427 : _872;
    assign _858 = f_changed_all[0:0];
    assign _859 = f_in_fetch & _858;
    assign _875 = _859 ? _874 : _397;
    assign _1079 = _1049[0:0];
    assign _1081 = _1079 ? _875 : _397;
    assign _850 = _846 + _427;
    assign _3453 = _846 + _427;
    assign _3449 = _846 == _2158;
    assign _3450 = ~ _3449;
    assign _3447 = _651[1:1];
    assign _3451 = _3447 & _3450;
    assign _3454 = _3451 ? _3453 : _846;
    assign _3444 = _651[1:1];
    assign _3445 = ~ _3444;
    assign _3443 = f_chg_now[1:1];
    assign _3446 = _3443 & _3445;
    assign _3456 = _3446 ? _427 : _3454;
    assign _3440 = _621 == _1744;
    assign _3442 = _3440 ? _397 : _846;
    assign _3439 = _621 == _1743;
    assign _3457 = _3439 ? _3456 : _3442;
    assign _219 = _3457;
    always @(posedge _248) begin
        if (_246)
            _846 <= _397;
        else
            _846 <= _219;
    end
    assign _848 = _846 == _2158;
    assign _851 = _848 ? _846 : _850;
    assign _841 = _651[1:1];
    assign _842 = ~ _841;
    assign _840 = f_chg_now[1:1];
    assign _843 = _840 & _842;
    assign _853 = _843 ? _427 : _851;
    assign _837 = f_changed_all[1:1];
    assign _838 = f_in_fetch & _837;
    assign _854 = _838 ? _853 : _397;
    assign _1076 = _1049[1:1];
    assign _1078 = _1076 ? _854 : _397;
    assign _1082 = _1078 < _1081;
    assign _1083 = _1082 ? _1081 : _1078;
    assign _827 = _823 + _427;
    assign _3472 = _823 + _427;
    assign _3468 = _823 == _2158;
    assign _3469 = ~ _3468;
    assign _3466 = _651[2:2];
    assign _3470 = _3466 & _3469;
    assign _3473 = _3470 ? _3472 : _823;
    assign _3463 = _651[2:2];
    assign _3464 = ~ _3463;
    assign _3462 = f_chg_now[2:2];
    assign _3465 = _3462 & _3464;
    assign _3475 = _3465 ? _427 : _3473;
    assign _3459 = _621 == _1744;
    assign _3461 = _3459 ? _397 : _823;
    assign _3458 = _621 == _1743;
    assign _3476 = _3458 ? _3475 : _3461;
    assign _220 = _3476;
    always @(posedge _248) begin
        if (_246)
            _823 <= _397;
        else
            _823 <= _220;
    end
    assign _825 = _823 == _2158;
    assign _828 = _825 ? _823 : _827;
    assign _818 = _651[2:2];
    assign _819 = ~ _818;
    assign _817 = f_chg_now[2:2];
    assign _820 = _817 & _819;
    assign _830 = _820 ? _427 : _828;
    assign _814 = f_changed_all[2:2];
    assign _815 = f_in_fetch & _814;
    assign _831 = _815 ? _830 : _397;
    assign _1071 = _1049[2:2];
    assign _1073 = _1071 ? _831 : _397;
    assign _806 = _802 + _427;
    assign _3491 = _802 + _427;
    assign _3487 = _802 == _2158;
    assign _3488 = ~ _3487;
    assign _3485 = _651[3:3];
    assign _3489 = _3485 & _3488;
    assign _3492 = _3489 ? _3491 : _802;
    assign _3482 = _651[3:3];
    assign _3483 = ~ _3482;
    assign _3481 = f_chg_now[3:3];
    assign _3484 = _3481 & _3483;
    assign _3494 = _3484 ? _427 : _3492;
    assign _3478 = _621 == _1744;
    assign _3480 = _3478 ? _397 : _802;
    assign _3477 = _621 == _1743;
    assign _3495 = _3477 ? _3494 : _3480;
    assign _221 = _3495;
    always @(posedge _248) begin
        if (_246)
            _802 <= _397;
        else
            _802 <= _221;
    end
    assign _804 = _802 == _2158;
    assign _807 = _804 ? _802 : _806;
    assign _797 = _651[3:3];
    assign _798 = ~ _797;
    assign _796 = f_chg_now[3:3];
    assign _799 = _796 & _798;
    assign _809 = _799 ? _427 : _807;
    assign _793 = f_changed_all[3:3];
    assign _794 = f_in_fetch & _793;
    assign _810 = _794 ? _809 : _397;
    assign _1068 = _1049[3:3];
    assign _1070 = _1068 ? _810 : _397;
    assign _1074 = _1070 < _1073;
    assign _1075 = _1074 ? _1073 : _1070;
    assign _1084 = _1075 < _1083;
    assign _1085 = _1084 ? _1083 : _1075;
    assign _781 = _777 + _427;
    assign _3510 = _777 + _427;
    assign _3506 = _777 == _2158;
    assign _3507 = ~ _3506;
    assign _3504 = _651[4:4];
    assign _3508 = _3504 & _3507;
    assign _3511 = _3508 ? _3510 : _777;
    assign _3501 = _651[4:4];
    assign _3502 = ~ _3501;
    assign _3500 = f_chg_now[4:4];
    assign _3503 = _3500 & _3502;
    assign _3513 = _3503 ? _427 : _3511;
    assign _3497 = _621 == _1744;
    assign _3499 = _3497 ? _397 : _777;
    assign _3496 = _621 == _1743;
    assign _3514 = _3496 ? _3513 : _3499;
    assign _222 = _3514;
    always @(posedge _248) begin
        if (_246)
            _777 <= _397;
        else
            _777 <= _222;
    end
    assign _779 = _777 == _2158;
    assign _782 = _779 ? _777 : _781;
    assign _772 = _651[4:4];
    assign _773 = ~ _772;
    assign _771 = f_chg_now[4:4];
    assign _774 = _771 & _773;
    assign _784 = _774 ? _427 : _782;
    assign _768 = f_changed_all[4:4];
    assign _769 = f_in_fetch & _768;
    assign _785 = _769 ? _784 : _397;
    assign _1061 = _1049[4:4];
    assign _1063 = _1061 ? _785 : _397;
    assign _760 = _756 + _427;
    assign _3529 = _756 + _427;
    assign _3525 = _756 == _2158;
    assign _3526 = ~ _3525;
    assign _3523 = _651[5:5];
    assign _3527 = _3523 & _3526;
    assign _3530 = _3527 ? _3529 : _756;
    assign _3520 = _651[5:5];
    assign _3521 = ~ _3520;
    assign _3519 = f_chg_now[5:5];
    assign _3522 = _3519 & _3521;
    assign _3532 = _3522 ? _427 : _3530;
    assign _3516 = _621 == _1744;
    assign _3518 = _3516 ? _397 : _756;
    assign _3515 = _621 == _1743;
    assign _3533 = _3515 ? _3532 : _3518;
    assign _223 = _3533;
    always @(posedge _248) begin
        if (_246)
            _756 <= _397;
        else
            _756 <= _223;
    end
    assign _758 = _756 == _2158;
    assign _761 = _758 ? _756 : _760;
    assign _751 = _651[5:5];
    assign _752 = ~ _751;
    assign _750 = f_chg_now[5:5];
    assign _753 = _750 & _752;
    assign _763 = _753 ? _427 : _761;
    assign _747 = f_changed_all[5:5];
    assign _748 = f_in_fetch & _747;
    assign _764 = _748 ? _763 : _397;
    assign _1058 = _1049[5:5];
    assign _1060 = _1058 ? _764 : _397;
    assign _1064 = _1060 < _1063;
    assign _1065 = _1064 ? _1063 : _1060;
    assign _737 = _733 + _427;
    assign _3548 = _733 + _427;
    assign _3544 = _733 == _2158;
    assign _3545 = ~ _3544;
    assign _3542 = _651[6:6];
    assign _3546 = _3542 & _3545;
    assign _3549 = _3546 ? _3548 : _733;
    assign _3539 = _651[6:6];
    assign _3540 = ~ _3539;
    assign _3538 = f_chg_now[6:6];
    assign _3541 = _3538 & _3540;
    assign _3551 = _3541 ? _427 : _3549;
    assign _3535 = _621 == _1744;
    assign _3537 = _3535 ? _397 : _733;
    assign _3534 = _621 == _1743;
    assign _3552 = _3534 ? _3551 : _3537;
    assign _224 = _3552;
    always @(posedge _248) begin
        if (_246)
            _733 <= _397;
        else
            _733 <= _224;
    end
    assign _735 = _733 == _2158;
    assign _738 = _735 ? _733 : _737;
    assign _728 = _651[6:6];
    assign _729 = ~ _728;
    assign _727 = f_chg_now[6:6];
    assign _730 = _727 & _729;
    assign _740 = _730 ? _427 : _738;
    assign _724 = f_changed_all[6:6];
    assign _725 = f_in_fetch & _724;
    assign _741 = _725 ? _740 : _397;
    assign _1053 = _1049[6:6];
    assign _1055 = _1053 ? _741 : _397;
    assign _716 = _712 + _427;
    assign _3567 = _712 + _427;
    assign _3563 = _712 == _2158;
    assign _3564 = ~ _3563;
    assign _3561 = _651[7:7];
    assign _3565 = _3561 & _3564;
    assign _3568 = _3565 ? _3567 : _712;
    assign _3558 = _651[7:7];
    assign _3559 = ~ _3558;
    assign _3557 = f_chg_now[7:7];
    assign _3560 = _3557 & _3559;
    assign _3570 = _3560 ? _427 : _3568;
    assign _3554 = _621 == _1744;
    assign _3556 = _3554 ? _397 : _712;
    assign _3553 = _621 == _1743;
    assign _3571 = _3553 ? _3570 : _3556;
    assign _225 = _3571;
    always @(posedge _248) begin
        if (_246)
            _712 <= _397;
        else
            _712 <= _225;
    end
    assign _714 = _712 == _2158;
    assign _717 = _714 ? _712 : _716;
    assign _707 = _651[7:7];
    assign _708 = ~ _707;
    assign _706 = f_chg_now[7:7];
    assign _709 = _706 & _708;
    assign _719 = _709 ? _427 : _717;
    assign _703 = f_changed_all[7:7];
    assign _704 = f_in_fetch & _703;
    assign _720 = _704 ? _719 : _397;
    assign _1049 = _1045[23:16];
    assign _1050 = _1049[7:7];
    assign _1052 = _1050 ? _720 : _397;
    assign _1056 = _1052 < _1055;
    assign _1057 = _1056 ? _1055 : _1052;
    assign _1066 = _1057 < _1065;
    assign _1067 = _1066 ? _1065 : _1057;
    assign _1086 = _1067 < _1085;
    assign _1087 = _1086 ? _1085 : _1067;
    assign _1088 = { _1326,
                     _1087 };
    assign _3574 = _678 == _427;
    assign _3575 = _3574 ? _240 : _635;
    assign _3572 = _621 == _1743;
    assign _3576 = _3572 ? _3575 : _635;
    assign _226 = _3576;
    always @(posedge _248) begin
        if (_246)
            _635 <= _625;
        else
            _635 <= _226;
    end
    assign _692 = _678 == _427;
    assign _693 = f_in_fetch & _692;
    assign _694 = _693 ? _240 : _635;
    assign _3579 = _678 == _399;
    assign _3580 = _3579 ? _240 : _632;
    assign _3577 = _621 == _1743;
    assign _3581 = _3577 ? _3580 : _632;
    assign _227 = _3581;
    always @(posedge _248) begin
        if (_246)
            _632 <= _625;
        else
            _632 <= _227;
    end
    assign _688 = _678 == _399;
    assign _689 = f_in_fetch & _688;
    assign _690 = _689 ? _240 : _632;
    assign _3584 = _678 == _2134;
    assign _3585 = _3584 ? _240 : _629;
    assign _3582 = _621 == _1743;
    assign _3586 = _3582 ? _3585 : _629;
    assign _228 = _3586;
    always @(posedge _248) begin
        if (_246)
            _629 <= _625;
        else
            _629 <= _228;
    end
    assign _684 = _678 == _2134;
    assign _685 = f_in_fetch & _684;
    assign _686 = _685 ? _240 : _629;
    assign _1777 = _621 == _2275;
    assign _230 = host_rec_we;
    assign _3609 = _230 & _1777;
    assign _232 = host_rec_wdata;
    always @(posedge _248) begin
        if (_3609)
            _3610[_3608] <= _232;
    end
    assign _3606 = _678[1:0];
    assign _234 = host_start_loc;
    assign _1008 = _636[511:400];
    assign _3595 = _1008[110:105];
    assign _1002 = _636[399:288];
    assign _3594 = _1002[110:105];
    assign _3593 = _996[110:105];
    assign _3592 = _637[110:105];
    always @* begin
        case (f_winner)
        0:
            _3596 <= _3592;
        1:
            _3596 <= _3593;
        2:
            _3596 <= _3594;
        default:
            _3596 <= _3595;
        endcase
    end
    assign _3597 = _3596 == _1449;
    assign _3598 = ~ _3597;
    assign _3599 = _3598 ? _3596 : _1449;
    assign _236 = host_recover_loc;
    assign _1020 = _991[59:58];
    assign _3589 = _1020 == _1744;
    assign _3590 = _3589 ? _236 : _1449;
    assign _3591 = _1662 ? _3590 : _1449;
    assign _3600 = _1441 ? _3599 : _3591;
    assign _3587 = _621 == _1744;
    assign _3601 = _3587 ? _3600 : _1449;
    assign _3602 = _258 ? _234 : _3601;
    assign _237 = _3602;
    always @(posedge _248) begin
        if (_246)
            _1449 <= _2959;
        else
            _1449 <= _237;
    end
    assign _3607 = { _1449,
                     _3606 };
    assign _239 = host_rec_waddr;
    assign _3604 = _678 < _400;
    assign _3605 = f_in_fetch & _3604;
    assign _3608 = _3605 ? _3607 : _239;
    assign _3611 = _3610[_3608];
    always @(posedge _248) begin
        if (_3605)
            _3614 <= _3611;
    end
    assign _240 = _3614;
    assign _680 = _678 == _400;
    assign _681 = f_in_fetch & _680;
    assign _682 = _681 ? _240 : _626;
    assign _695 = { _682,
                    _686,
                    _690,
                    _694 };
    assign _1045 = _695[287:176];
    assign _1046 = _1045[41:26];
    assign _1047 = { gnd,
                     _1046 };
    assign _1089 = _1047 + _1088;
    always @(posedge _248) begin
        if (_246)
            _1092 <= _1381;
        else
            _1092 <= _1089;
    end
    assign gnd = 1'b0;
    assign _1044 = { gnd,
                     _1041 };
    assign _1093 = _1044 < _1092;
    assign _1094 = ~ _1093;
    assign _1098 = _1094 | _1097;
    assign _1107 = _1098 & _1106;
    assign _3642 = _669 + _3678;
    assign _3638 = _669 == _1693;
    assign _3639 = ~ _3638;
    assign _3640 = _3636 & _3639;
    assign _3643 = _3640 ? _3642 : _669;
    assign _3622 = _3621[2:2];
    assign _3623 = _1594 & _3622;
    assign _3645 = _3623 ? _1424 : _3643;
    assign _3647 = _258 ? _1424 : _3645;
    assign _241 = _3647;
    always @(posedge _248) begin
        if (_246)
            _669 <= _1424;
        else
            _669 <= _241;
    end
    assign _3659 = _666 + _3678;
    assign _3655 = _666 == _1693;
    assign _3656 = ~ _3655;
    assign _3634 = 9'b111111111;
    assign _3635 = _3627 == _3634;
    assign _3632 = 6'b111111;
    assign _3631 = _3627[5:0];
    assign _3633 = _3631 == _3632;
    assign _3626 = 9'b000000000;
    assign _3648 = 9'b000000001;
    assign _3649 = _3627 + _3648;
    assign _3651 = _258 ? _3626 : _3649;
    assign _242 = _3651;
    always @(posedge _248) begin
        if (_246)
            _3627 <= _3626;
        else
            _3627 <= _242;
    end
    assign _3628 = _3627[2:0];
    assign _3630 = _3628 == _2158;
    assign _3624 = _991[63:62];
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
    assign _3660 = _3657 ? _3659 : _666;
    assign _3652 = _3621[1:1];
    assign _3653 = _1594 & _3652;
    assign _3662 = _3653 ? _1424 : _3660;
    assign _3664 = _258 ? _1424 : _3662;
    assign _243 = _3664;
    always @(posedge _248) begin
        if (_246)
            _666 <= _1424;
        else
            _666 <= _243;
    end
    assign _1040 = _996[25:24];
    always @* begin
        case (_1040)
        0:
            _1041 <= _663;
        1:
            _1041 <= _666;
        2:
            _1041 <= _669;
        default:
            _1041 <= _669;
        endcase
    end
    assign _1043 = _1041 == _1693;
    assign _1111 = _1043 ? _1110 : _1107;
    always @(posedge _248) begin
        if (_246)
            _291 <= _1752;
        else
            _291 <= _279;
    end
    assign f_chg_now = _279 ^ _291;
    assign _3666 = _621 == _1744;
    assign _3668 = _3666 ? _1752 : _651;
    assign _3665 = _621 == _1743;
    assign _3669 = _3665 ? f_changed_all : _3668;
    assign _3671 = _258 ? _1752 : _3669;
    assign _244 = _3671;
    always @(posedge _248) begin
        if (_246)
            _651 <= _1752;
        else
            _651 <= _244;
    end
    assign f_changed_all = _651 | f_chg_now;
    assign _1034 = f_changed_all & f_chgmask1;
    assign _1036 = _1034 == _1752;
    assign _1037 = ~ _1036;
    assign f_chgmask1 = _996[23:16];
    assign _1033 = f_chgmask1 == _1752;
    assign _1038 = _1033 | _1037;
    assign _1027 = _996[7:0];
    assign _1025 = _996[15:8];
    assign vdd = 1'b1;
    assign _246 = clear;
    assign _248 = clock;
    assign _250 = pins_in;
    always @(posedge _248) begin
        if (_246)
            _276 <= _1752;
        else
            _276 <= _250;
    end
    always @(posedge _248) begin
        if (_246)
            _279 <= _1752;
        else
            _279 <= _276;
    end
    assign _1026 = _279 ^ _1025;
    assign _1028 = _1026 & _1027;
    assign _1030 = _1028 == _1752;
    assign _996 = _636[287:176];
    assign f_valid1 = _996[111:111];
    assign _1031 = f_valid1 & _1030;
    assign _1039 = _1031 & _1038;
    assign _1112 = _1039 & _1111;
    assign _1117 = _1112 & _1116;
    assign _1156 = _1117 & _1155;
    assign _1157 = f_in_eval & _1156;
    assign _1161 = _1157 & _1160;
    assign f_fire1 = _1161 & _1023;
    assign _1454 = f_fire1 ? _1743 : _1452;
    assign f_winner = f_fire0 ? _2275 : _1454;
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
    assign _3621 = _1593 ? _3620 : _3619;
    assign _3672 = _3621[0:0];
    assign _3673 = _1594 & _3672;
    assign _3682 = _3673 ? _1424 : _3680;
    assign _3684 = _258 ? _1424 : _3682;
    assign _251 = _3684;
    always @(posedge _248) begin
        if (_246)
            _663 <= _1424;
        else
            _663 <= _251;
    end
    assign _1645 = _991[33:32];
    always @* begin
        case (_1645)
        0:
            _1646 <= _663;
        1:
            _1646 <= _666;
        2:
            _1646 <= _669;
        default:
            _1646 <= _669;
        endcase
    end
    assign _1644 = _991[49:34];
    assign _1647 = _1644 < _1646;
    assign _991 = _636[63:0];
    assign _1642 = _991[31:31];
    assign _1640 = ~ _1441;
    assign _1641 = f_in_eval & _1640;
    assign _1643 = _1641 & _1642;
    assign _1648 = _1643 & _1647;
    assign _1653 = _1648 & _1652;
    assign _1661 = _1653 | f_unexp_now;
    assign _1662 = _1661 | f_amb_now;
    assign _3690 = _1662 ? _3689 : _678;
    assign _3693 = _1441 ? _3692 : _3690;
    assign _3686 = _621 == _1744;
    assign _3694 = _3686 ? _3693 : _678;
    assign _3685 = _621 == _1743;
    assign _3697 = _3685 ? _3696 : _3694;
    assign _3699 = _258 ? _397 : _3697;
    assign _252 = _3699;
    always @(posedge _248) begin
        if (_246)
            _678 <= _397;
        else
            _678 <= _252;
    end
    assign _3702 = _678 == _400;
    assign _3703 = _3702 ? _240 : _626;
    assign _3700 = _621 == _1743;
    assign _3704 = _3700 ? _3703 : _626;
    assign _253 = _3704;
    always @(posedge _248) begin
        if (_246)
            _626 <= _625;
        else
            _626 <= _253;
    end
    assign _636 = { _626,
                    _629,
                    _632,
                    _635 };
    assign _637 = _636[175:64];
    assign f_valid0 = _637[111:111];
    assign _645 = f_valid0 & _644;
    assign _659 = _645 & _658;
    assign _907 = _659 & _906;
    assign _936 = _907 & _935;
    assign _980 = _936 & _979;
    assign f_in_eval = _621 == _1744;
    assign _981 = f_in_eval & _980;
    assign _990 = _981 & _989;
    assign f_fire0 = _990 & _1023;
    assign _1163 = f_fire0 | f_fire1;
    assign _1302 = _1163 | f_fire2;
    assign _1441 = _1302 | f_fire3;
    assign _3723 = _1441 ? _3722 : _3720;
    assign _3708 = _621 == _1665;
    assign _3710 = _3708 ? _2275 : _621;
    assign _3706 = _621 == _1744;
    assign _3724 = _3706 ? _3723 : _3710;
    assign _3705 = _621 == _1743;
    assign _3727 = _3705 ? _3726 : _3724;
    assign _255 = host_stop;
    assign _3729 = _255 ? _2275 : _3727;
    assign _3731 = _258 ? _1743 : _3729;
    assign _256 = _3731;
    always @(posedge _248) begin
        if (_246)
            _621 <= _2275;
        else
            _621 <= _256;
    end
    assign f_in_fetch = _621 == _1743;
    assign _1593 = f_in_fetch & _1592;
    assign _1594 = _1593 | _1441;
    assign _2292 = _1594 & _2291;
    assign _3753 = _2292 ? _3752 : _2356;
    assign _258 = host_start;
    assign _3755 = _258 ? _1752 : _3753;
    assign _259 = _3755;
    always @(posedge _248) begin
        if (_246)
            _2356 <= _1752;
        else
            _2356 <= _259;
    end
    assign _2357 = _2356[7:7];
    assign _261 = host_pin_src;
    assign _2353 = _261[23:21];
    always @* begin
        case (_2353)
        0:
            _2364 <= _2357;
        1:
            _2364 <= _392;
        2:
            _2364 <= _2358;
        3:
            _2364 <= _2359;
        4:
            _2364 <= _2361;
        5:
            _2364 <= _553;
        6:
            _2364 <= _2362;
        default:
            _2364 <= _2363;
        endcase
    end
    assign _2428 = { _2364,
                     _2373,
                     _2382,
                     _2391,
                     _2400,
                     _2409,
                     _2418,
                     _2427 };
    assign _3757 = _2428 & _3756;
    assign pins_out = _3757;
    assign pins_oe = _2431;
    assign st_running = _2288;
    assign st_in_entry = f_in_fetch;
    assign st_cur_loc = _1449;
    assign st_accepting = _2287;
    assign st_taken = _2285;
    assign st_taken_edge = _2282;
    assign st_viol = _2279;
    assign st_viol_kind = _2276;
    assign st_timestamp = ts_reg;
    assign st_tx_full = _2271;
    assign st_tx_empty = _923;
    assign st_rx_data = _2269;
    assign st_rx_empty = _1677;
    assign st_vlog_data = _2162;
    assign st_vlog_empty = _1680;
    assign st_cov_rdata = _35;
    assign st_irq = _1684;
    assign st_halted_viol = _1626;
    assign st_rx_overflow = _1619;
    assign st_vlog_overflow = _1476;
    assign st_cov_overrun = _1466;
    assign st_lane_status = _618;

endmodule
