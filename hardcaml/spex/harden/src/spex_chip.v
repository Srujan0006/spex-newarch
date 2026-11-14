module spex_chip (
    ram_cov_rdata,
    pins_in,
    ram_rec_rdata,
    mosi,
    sck,
    clear,
    clock,
    cs_n,
    miso,
    irq,
    viol,
    entry,
    dbg,
    pins_out,
    pins_oe,
    ram_rec_addr,
    ram_rec_re,
    ram_rec_we,
    ram_rec_wdata,
    ram_cov_addr,
    ram_cov_re,
    ram_cov_we,
    ram_cov_wdata
);

    input [31:0] ram_cov_rdata;
    input [7:0] pins_in;
    input [127:0] ram_rec_rdata;
    input mosi;
    input sck;
    input clear;
    input clock;
    input cs_n;
    output miso;
    output irq;
    output viol;
    output entry;
    output [3:0] dbg;
    output [7:0] pins_out;
    output [7:0] pins_oe;
    output [7:0] ram_rec_addr;
    output ram_rec_re;
    output ram_rec_we;
    output [127:0] ram_rec_wdata;
    output [7:0] ram_cov_addr;
    output ram_cov_re;
    output ram_cov_we;
    output [31:0] ram_cov_wdata;

    wire [11:0] _1301;
    wire _1298;
    wire _1299;
    wire [11:0] _1300;
    wire _1302;
    wire [11:0] _1303;
    wire [11:0] _1304;
    wire [11:0] _1290;
    wire [11:0] _1088;
    wire [11:0] _1085;
    wire [12:0] _1082;
    wire [9:0] _1079;
    wire [12:0] _1080;
    wire [12:0] _1081;
    wire [2:0] _1075;
    reg [2:0] _1055;
    wire [2:0] _1;
    reg [2:0] _1076;
    wire [12:0] _1077;
    wire [12:0] _1062;
    wire [12:0] _1061;
    wire [15:0] _1056;
    wire _1060;
    wire [12:0] _1063;
    wire [12:0] _2;
    reg [12:0] _1072;
    wire _1078;
    wire [12:0] _1083;
    wire [12:0] _1069;
    wire _1084;
    wire [11:0] _1087;
    wire _1067;
    wire [15:0] _1064;
    wire _1065;
    wire _3;
    reg _1068;
    wire [11:0] _1089;
    wire [11:0] _4;
    reg [11:0] _1291;
    wire [11:0] _1092;
    reg [1:0] _1058;
    reg [15:0] _1059;
    wire [15:0] _1090;
    wire _1091;
    wire [11:0] _1094;
    wire [11:0] _5;
    reg [11:0] _1288;
    wire _1292;
    wire _1293;
    wire [11:0] _1294;
    wire [11:0] _1285;
    wire _1295;
    wire [11:0] _1296;
    wire [7:0] _1283;
    wire _1284;
    wire [11:0] _1297;
    wire [7:0] _1281;
    wire [7:0] _1280;
    wire [1:0] _1275;
    wire [1:0] _1274;
    wire _1208;
    wire _1200;
    wire _1209;
    wire _6;
    reg _1273;
    wire [1:0] _1276;
    wire [6:0] _1270;
    wire [8:0] _1277;
    wire [7:0] _1268;
    wire [8:0] _1269;
    wire [8:0] _1278;
    wire _1279;
    wire [7:0] _1282;
    wire [31:0] _1305;
    wire [31:0] _1250;
    wire [23:0] _1262;
    wire [31:0] _1263;
    wire [31:0] _1264;
    wire [31:0] _7;
    reg [31:0] _1251;
    wire [31:0] _1306;
    wire _1322;
    wire _1320;
    wire _1315;
    wire _1313;
    wire _1312;
    wire _1314;
    wire _1316;
    wire f_host_cov_we;
    wire _1324;
    wire _1323;
    wire _1325;
    wire [7:0] _11;
    reg [7:0] _1343;
    wire [7:0] _1335;
    wire [7:0] _1336;
    wire [7:0] _1337;
    wire [7:0] _12;
    reg [7:0] _1328;
    wire [7:0] _1338;
    wire [7:0] _1339;
    wire [7:0] _1340;
    wire [7:0] _1344;
    wire [127:0] _1349;
    wire [119:0] _1351;
    wire [127:0] _1352;
    wire [127:0] _1353;
    wire [127:0] _14;
    reg [127:0] _1350;
    wire _1363;
    wire [1:0] _1378;
    wire [7:0] _1379;
    wire [7:0] _1376;
    wire [7:0] _1370;
    wire [7:0] _1371;
    wire [7:0] _1372;
    wire [7:0] _18;
    reg [7:0] _1366;
    wire [7:0] _1377;
    wire [2:0] _1360;
    wire _1361;
    wire _1362;
    wire [7:0] _1380;
    wire [7:0] _1552;
    wire [7:0] _1553;
    wire [7:0] _1416;
    wire [7:0] _1414;
    wire [7:0] _1413;
    wire [7:0] _1412;
    wire [7:0] _1411;
    reg [7:0] _1415;
    wire [7:0] _1417;
    wire [7:0] _1418;
    wire [7:0] _1409;
    wire [7:0] _1410;
    wire [7:0] _1419;
    wire [7:0] _1453;
    wire [7:0] _1454;
    wire [7:0] _1456;
    wire [7:0] _1458;
    wire [7:0] _20;
    reg [7:0] f_poe;
    wire [7:0] _1554;
    wire [7:0] _1579;
    wire _1549;
    wire _1548;
    wire _1546;
    wire _1547;
    wire _1545;
    wire _1544;
    wire _1543;
    wire [2:0] _1542;
    reg _1550;
    wire _1540;
    wire _1539;
    wire _1537;
    wire _1538;
    wire _1536;
    wire _1535;
    wire _1534;
    wire [2:0] _1533;
    reg _1541;
    wire _1531;
    wire _1530;
    wire _1528;
    wire _1529;
    wire _1527;
    wire _1526;
    wire _1525;
    wire [2:0] _1524;
    reg _1532;
    wire _1522;
    wire _1521;
    wire _1519;
    wire _1520;
    wire _1518;
    wire _1517;
    wire _1516;
    wire [2:0] _1515;
    reg _1523;
    wire _1513;
    wire _1512;
    wire _1510;
    wire _1511;
    wire _1509;
    wire _1508;
    wire _1507;
    wire [2:0] _1506;
    reg _1514;
    wire _1504;
    wire _1503;
    wire _1501;
    wire _1502;
    wire _1500;
    wire _1499;
    wire _1498;
    wire [2:0] _1497;
    reg _1505;
    wire _1495;
    wire _1494;
    wire _1492;
    wire _1493;
    wire _1491;
    wire _1490;
    wire _1489;
    wire [2:0] _1488;
    reg _1496;
    wire _1486;
    wire _1485;
    wire _1481;
    wire _1482;
    wire _1480;
    wire _1479;
    wire [2:0] _1571;
    wire _1568;
    wire [1:0] _1569;
    wire [3:0] _1570;
    wire [6:0] _1572;
    wire [7:0] _1573;
    wire [7:0] _1574;
    wire _1450;
    wire _1449;
    wire _1448;
    wire _1446;
    wire _1447;
    wire _1444;
    wire _1445;
    wire _1441;
    wire _1442;
    wire _1443;
    wire _1438;
    wire _1439;
    wire _1440;
    wire _1435;
    wire _1434;
    wire _1436;
    wire _1433;
    wire _1437;
    wire [7:0] _1451;
    wire _1420;
    wire _1426;
    wire [7:0] _1452;
    wire [7:0] _1566;
    wire [7:0] _1562;
    wire [7:0] _1560;
    wire [7:0] _1559;
    wire [7:0] _1558;
    wire [7:0] _1557;
    reg [7:0] _1561;
    wire [7:0] _1563;
    wire [7:0] _1564;
    wire [7:0] _1407;
    wire [7:0] _1405;
    wire [7:0] _1404;
    wire [7:0] _1403;
    wire [7:0] _1402;
    reg [7:0] _1406;
    wire [7:0] _1408;
    wire [7:0] _1555;
    wire [7:0] _1556;
    wire [7:0] _1565;
    wire [7:0] _1567;
    wire [7:0] _1575;
    wire [1:0] _1395;
    wire _1396;
    wire _1397;
    wire _1398;
    wire [7:0] _1576;
    wire [7:0] _1578;
    wire [7:0] _22;
    reg [7:0] f_pout;
    wire _1476;
    wire [23:0] _1471;
    wire [2:0] _1472;
    reg _1487;
    wire [7:0] _1551;
    wire [7:0] _1580;
    reg [1:0] _1624;
    wire [3:0] _1631;
    reg _1590;
    wire [3:0] _1597;
    reg [1:0] _1586;
    wire [1:0] _1583;
    wire [3:0] _1587;
    wire [3:0] _1582;
    wire [1:0] _1581;
    reg [3:0] _1632;
    reg _1637;
    wire _5863;
    wire _5862;
    wire [7:0] _5864;
    wire [4:0] _1876;
    wire _1877;
    wire _1878;
    reg [7:0] _1879;
    wire [4:0] _1870;
    wire _1871;
    wire _1872;
    reg [7:0] _1873;
    wire [4:0] _1864;
    wire _1865;
    wire _1866;
    reg [7:0] _1867;
    wire [4:0] _1858;
    wire _1859;
    wire _1860;
    reg [7:0] _1861;
    wire [4:0] _1852;
    wire _1853;
    wire _1854;
    reg [7:0] _1855;
    wire [4:0] _1846;
    wire _1847;
    wire _1848;
    reg [7:0] _1849;
    wire [4:0] _1840;
    wire _1841;
    wire _1842;
    reg [7:0] _1843;
    wire [4:0] _1834;
    wire _1835;
    wire _1836;
    reg [7:0] _1837;
    wire [4:0] _1828;
    wire _1829;
    wire _1830;
    reg [7:0] _1831;
    wire [4:0] _1822;
    wire _1823;
    wire _1824;
    reg [7:0] _1825;
    wire [4:0] _1816;
    wire _1817;
    wire _1818;
    reg [7:0] _1819;
    wire [4:0] _1810;
    wire _1811;
    wire _1812;
    reg [7:0] _1813;
    wire [4:0] _1804;
    wire _1805;
    wire _1806;
    reg [7:0] _1807;
    wire [4:0] _1798;
    wire _1799;
    wire _1800;
    reg [7:0] _1801;
    wire [4:0] _1792;
    wire _1793;
    wire _1794;
    reg [7:0] _1795;
    wire [4:0] _1786;
    wire _1787;
    wire _1788;
    reg [7:0] _1789;
    wire [4:0] _1780;
    wire _1781;
    wire _1782;
    reg [7:0] _1783;
    wire [4:0] _1774;
    wire _1775;
    wire _1776;
    reg [7:0] _1777;
    wire [4:0] _1768;
    wire _1769;
    wire _1770;
    reg [7:0] _1771;
    wire [4:0] _1762;
    wire _1763;
    wire _1764;
    reg [7:0] _1765;
    wire [4:0] _1756;
    wire _1757;
    wire _1758;
    reg [7:0] _1759;
    wire [4:0] _1750;
    wire _1751;
    wire _1752;
    reg [7:0] _1753;
    wire [4:0] _1744;
    wire _1745;
    wire _1746;
    reg [7:0] _1747;
    wire [4:0] _1738;
    wire _1739;
    wire _1740;
    reg [7:0] _1741;
    wire [4:0] _1732;
    wire _1733;
    wire _1734;
    reg [7:0] _1735;
    wire [4:0] _1726;
    wire _1727;
    wire _1728;
    reg [7:0] _1729;
    wire [4:0] _1720;
    wire _1721;
    wire _1722;
    reg [7:0] _1723;
    wire [4:0] _1714;
    wire _1715;
    wire _1716;
    reg [7:0] _1717;
    wire [4:0] _1708;
    wire _1709;
    wire _1710;
    reg [7:0] _1711;
    wire [4:0] _1702;
    wire _1703;
    wire _1704;
    reg [7:0] _1705;
    wire [4:0] _1696;
    wire _1697;
    wire _1698;
    reg [7:0] _1699;
    wire [4:0] _1690;
    wire [4:0] _1673;
    wire [4:0] _1674;
    wire [4:0] _28;
    reg [4:0] _1671;
    wire _1691;
    wire _1692;
    reg [7:0] _1693;
    wire [4:0] _1686;
    wire [4:0] _1687;
    wire [4:0] _29;
    reg [4:0] _1684;
    reg [7:0] _1880;
    wire [7:0] _30;
    wire [7:0] _5855;
    wire [7:0] _5849;
    wire [7:0] _5848;
    wire [7:0] _5847;
    wire [7:0] _5846;
    wire [7:0] _5845;
    wire [2:0] _2239;
    wire _2240;
    wire _2241;
    wire [47:0] _2238;
    reg [47:0] _2242;
    wire [2:0] _2233;
    wire _2234;
    wire _2235;
    reg [47:0] _2236;
    wire [2:0] _2227;
    wire _2228;
    wire _2229;
    reg [47:0] _2230;
    wire _2222;
    wire _2223;
    reg [47:0] _2224;
    wire [2:0] _2215;
    wire _2216;
    wire _2217;
    reg [47:0] _2218;
    wire [2:0] _2209;
    wire _2210;
    wire _2211;
    reg [47:0] _2212;
    wire [2:0] _2203;
    wire _2204;
    wire _2205;
    reg [47:0] _2206;
    wire [2:0] _1889;
    wire [2:0] _1890;
    wire [2:0] _31;
    reg [2:0] _1887;
    wire _2198;
    wire _2199;
    wire [1:0] _1619;
    wire [1:0] _1621;
    wire [2:0] _2181;
    wire [28:0] _1898;
    wire [28:0] _1897;
    wire [28:0] _1900;
    wire [28:0] _1901;
    wire [2:0] _1894;
    wire _1896;
    wire [28:0] _1902;
    wire [28:0] _32;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2179;
    wire [2:0] _1920;
    wire _1916;
    wire _1917;
    wire _1914;
    wire _1918;
    wire [2:0] _1921;
    wire _1911;
    wire _1912;
    wire _1909;
    wire _1908;
    wire _1910;
    wire _1913;
    wire [2:0] _1923;
    wire _1904;
    wire [2:0] _1924;
    wire [2:0] _33;
    reg [2:0] _1907;
    wire _2170;
    wire [2:0] _2172;
    wire [2:0] _1941;
    wire _1937;
    wire _1938;
    wire _1935;
    wire _1939;
    wire [2:0] _1942;
    wire _1932;
    wire _1933;
    wire _1930;
    wire _1929;
    wire _1931;
    wire _1934;
    wire [2:0] _1944;
    wire _1925;
    wire [2:0] _1945;
    wire [2:0] _34;
    reg [2:0] _1928;
    wire _2167;
    wire [2:0] _2169;
    wire [2:0] _2173;
    wire [2:0] _1962;
    wire _1958;
    wire _1959;
    wire _1956;
    wire _1960;
    wire [2:0] _1963;
    wire _1953;
    wire _1954;
    wire _1951;
    wire _1950;
    wire _1952;
    wire _1955;
    wire [2:0] _1965;
    wire _1946;
    wire [2:0] _1966;
    wire [2:0] _35;
    reg [2:0] _1949;
    wire _2163;
    wire [2:0] _2165;
    wire [2:0] _1983;
    wire _1979;
    wire _1980;
    wire _1977;
    wire _1981;
    wire [2:0] _1984;
    wire _1974;
    wire _1975;
    wire _1972;
    wire _1971;
    wire _1973;
    wire _1976;
    wire [2:0] _1986;
    wire _1967;
    wire [2:0] _1987;
    wire [2:0] _36;
    reg [2:0] _1970;
    wire _2160;
    wire [2:0] _2162;
    wire [2:0] _2166;
    wire [2:0] _2174;
    wire [2:0] _2004;
    wire _2000;
    wire _2001;
    wire _1998;
    wire _2002;
    wire [2:0] _2005;
    wire _1995;
    wire _1996;
    wire _1993;
    wire _1992;
    wire _1994;
    wire _1997;
    wire [2:0] _2007;
    wire _1988;
    wire [2:0] _2008;
    wire [2:0] _37;
    reg [2:0] _1991;
    wire _2155;
    wire [2:0] _2157;
    wire [2:0] _2025;
    wire _2021;
    wire _2022;
    wire _2019;
    wire _2023;
    wire [2:0] _2026;
    wire _2016;
    wire _2017;
    wire _2014;
    wire _2013;
    wire _2015;
    wire _2018;
    wire [2:0] _2028;
    wire _2009;
    wire [2:0] _2029;
    wire [2:0] _38;
    reg [2:0] _2012;
    wire _2152;
    wire [2:0] _2154;
    wire [2:0] _2158;
    wire [2:0] _2046;
    wire _2042;
    wire _2043;
    wire _2040;
    wire _2044;
    wire [2:0] _2047;
    wire _2037;
    wire _2038;
    wire _2035;
    wire _2034;
    wire _2036;
    wire _2039;
    wire [2:0] _2049;
    wire _2030;
    wire [2:0] _2050;
    wire [2:0] _39;
    reg [2:0] _2033;
    wire _2148;
    wire [2:0] _2150;
    wire [2:0] _2067;
    wire _2063;
    wire _2064;
    wire _2061;
    wire _2065;
    wire [2:0] _2068;
    wire _2058;
    wire _2059;
    wire _2056;
    wire _2055;
    wire _2057;
    wire _2060;
    wire [2:0] _2070;
    wire _2051;
    wire [2:0] _2071;
    wire [2:0] _40;
    reg [2:0] _2054;
    wire _2145;
    wire [2:0] _2147;
    wire [2:0] _2151;
    wire [2:0] _2159;
    wire [2:0] _2175;
    wire _2140;
    wire _2139;
    wire _2141;
    wire _2137;
    wire _2136;
    wire _2138;
    wire _2142;
    wire _2133;
    wire _2132;
    wire _2134;
    wire _2130;
    wire _2129;
    wire _2131;
    wire _2135;
    wire _2143;
    wire [2:0] _2176;
    wire _2118;
    wire _2117;
    wire _2119;
    wire [2:0] _2121;
    wire _2113;
    wire _2112;
    wire _2114;
    wire [2:0] _2116;
    wire _2122;
    wire [2:0] _2123;
    wire _2106;
    wire _2105;
    wire _2107;
    wire [2:0] _2109;
    wire _2101;
    wire _2100;
    wire _2102;
    wire [2:0] _2104;
    wire _2110;
    wire [2:0] _2111;
    wire _2124;
    wire [2:0] _2125;
    wire _2092;
    wire _2091;
    wire _2093;
    wire [2:0] _2095;
    wire _2087;
    wire _2086;
    wire _2088;
    wire [2:0] _2090;
    wire _2096;
    wire [2:0] _2097;
    wire _2080;
    wire _2079;
    wire _2081;
    wire [2:0] _2083;
    wire _2075;
    wire _2074;
    wire _2076;
    wire [2:0] _2078;
    wire _2084;
    wire [2:0] _2085;
    wire _2098;
    wire [2:0] _2099;
    wire _2126;
    wire [2:0] _2127;
    wire [2:0] _2128;
    wire [2:0] _2177;
    wire [2:0] _2072;
    wire _2178;
    wire [28:0] _2180;
    wire [31:0] _2182;
    wire [47:0] _2183;
    wire [47:0] _41;
    reg [47:0] _2200;
    wire [2:0] _2193;
    wire [2:0] _2194;
    wire [2:0] _42;
    reg [2:0] _2191;
    reg [47:0] _2243;
    wire [47:0] _43;
    wire [7:0] _5844;
    wire [2:0] _5843;
    reg [7:0] _5850;
    wire [7:0] _5852;
    wire [7:0] _5841;
    wire [7:0] _5840;
    wire [7:0] _5839;
    wire [31:0] _45;
    wire _2244;
    wire _2245;
    wire [31:0] _2247;
    wire [31:0] _46;
    wire [7:0] _5838;
    wire [1:0] _5837;
    reg [7:0] _5842;
    wire [7:0] _5832;
    wire [7:0] _5831;
    wire [7:0] _5830;
    wire [7:0] _5829;
    wire [7:0] _2483;
    wire [7:0] _2484;
    wire _2480;
    wire _2481;
    wire _2473;
    wire _2470;
    wire _2471;
    wire _2467;
    wire _2464;
    wire _2465;
    wire _2466;
    wire _2468;
    wire _2472;
    wire _2474;
    wire _2460;
    wire _2475;
    wire _2482;
    wire [7:0] _2485;
    wire [7:0] _2487;
    wire [7:0] _47;
    reg [7:0] _2478;
    wire [7:0] _2727;
    wire _2723;
    wire _2724;
    wire _2716;
    wire _2713;
    wire _2714;
    wire _2710;
    wire _2707;
    wire _2708;
    wire _2709;
    wire _2711;
    wire _2715;
    wire _2717;
    wire _2459;
    wire _2702;
    wire _2703;
    wire _2718;
    wire _2725;
    wire [7:0] _2728;
    wire [7:0] _2730;
    wire [7:0] _48;
    reg [7:0] _2721;
    wire [7:0] _2763;
    wire _2759;
    wire _2760;
    wire _2753;
    wire _2754;
    wire _2761;
    wire [7:0] _2764;
    wire [7:0] _2766;
    wire [7:0] _49;
    reg [7:0] _2757;
    wire [7:0] _2776;
    wire _2772;
    wire _2773;
    wire _2774;
    wire [7:0] _2777;
    wire [7:0] _2779;
    wire [7:0] _50;
    reg [7:0] _2770;
    wire [7:0] _2808;
    wire _2804;
    wire _2805;
    wire _2806;
    wire [7:0] _2809;
    wire _2793;
    wire _2792;
    wire _2794;
    wire _2795;
    wire _51;
    reg _2250;
    wire [7:0] _2811;
    wire [7:0] _52;
    reg [7:0] _2802;
    wire [39:0] _2812;
    wire [39:0] _53;
    wire [7:0] _5828;
    wire [2:0] _5827;
    reg [7:0] _5834;
    wire [7:0] _5822;
    wire [4:0] _5819;
    wire _5817;
    wire [7:0] _5820;
    wire [7:0] _5816;
    wire [7:0] _5815;
    wire [7:0] _5814;
    wire _2850;
    wire _2828;
    wire _2846;
    wire _2851;
    wire _2853;
    wire _54;
    reg _2849;
    wire _55;
    wire _56;
    wire _57;
    wire [7:0] _5812;
    wire [3:0] _2863;
    wire [3:0] _2862;
    wire _2864;
    wire [7:0] _2865;
    wire [7:0] _2866;
    wire [7:0] _58;
    reg [7:0] _1464;
    wire [3:0] _2868;
    wire [3:0] _2867;
    wire _2869;
    wire [7:0] _2870;
    wire [7:0] _2871;
    wire [7:0] _59;
    reg [7:0] _1467;
    wire [3:0] _2873;
    wire [3:0] _2872;
    wire _2874;
    wire [7:0] _2875;
    wire [7:0] _2876;
    wire [7:0] _60;
    reg [7:0] _1470;
    wire [3:0] _5810;
    reg [7:0] _5825;
    wire [7:0] _5806;
    wire [2:0] _2916;
    wire [2:0] _2898;
    wire [2:0] _2899;
    wire [2:0] _2917;
    wire [2:0] _2919;
    wire [2:0] _2921;
    wire [2:0] _61;
    reg [2:0] _2895;
    wire [7:0] _2968;
    wire [2:0] _2961;
    wire [2:0] _2943;
    wire [2:0] _2944;
    wire [2:0] _2962;
    wire [2:0] _2964;
    wire [2:0] _2966;
    wire [2:0] _62;
    reg [2:0] _2940;
    wire [7:0] _2967;
    wire [15:0] _2969;
    wire [15:0] _63;
    wire [7:0] _5805;
    wire [7:0] _5804;
    wire [7:0] _5803;
    wire [23:0] _2974;
    wire [23:0] _2986;
    wire [3:0] _2983;
    wire [3:0] _2982;
    wire _2984;
    wire _2980;
    wire _2978;
    wire _2981;
    wire _2985;
    wire [23:0] _2987;
    wire [23:0] _2988;
    wire [23:0] _2989;
    wire [23:0] _64;
    reg [23:0] _2975;
    wire [7:0] _5802;
    wire [31:0] _2990;
    wire [31:0] _2991;
    wire [31:0] _65;
    reg [31:0] ts_reg;
    wire [31:0] _66;
    wire [7:0] _5801;
    wire [5:0] _67;
    wire [7:0] _5800;
    wire [2:0] _3057;
    wire [2:0] _3059;
    wire [2:0] _68;
    reg [2:0] _3056;
    wire [2:0] _69;
    wire _3052;
    wire [2:0] _3042;
    wire [2:0] _3039;
    wire [2:0] _3043;
    wire [2:0] _3036;
    wire [2:0] _3044;
    wire _3030;
    wire _3024;
    wire _3025;
    wire _3026;
    wire _3031;
    wire _3020;
    wire _3021;
    wire _3016;
    wire _3018;
    wire _3067;
    wire _3069;
    wire [1:0] _3071;
    wire _3064;
    wire _3066;
    wire [1:0] _3073;
    wire [1:0] _3074;
    wire [1:0] _70;
    reg [1:0] _3012;
    wire _3013;
    wire _3015;
    wire _3019;
    wire _3022;
    wire _71;
    reg _1267;
    wire _3006;
    wire _3005;
    wire _3007;
    wire _3003;
    wire _3000;
    wire _2995;
    wire _2996;
    wire _2997;
    wire _2998;
    wire _3001;
    wire [1:0] _1333;
    wire [1:0] _1332;
    wire _1334;
    wire _3077;
    wire _1247;
    wire _1248;
    wire _3078;
    wire _72;
    reg _1309;
    wire _3002;
    wire _3004;
    wire _3008;
    wire _2992;
    wire _2993;
    wire _3009;
    wire _3023;
    wire _3032;
    wire [2:0] _3045;
    wire _3047;
    wire _3048;
    wire _3053;
    wire _3085;
    wire _3081;
    wire _3080;
    wire _3082;
    wire _3083;
    wire _73;
    reg _2815;
    wire _3087;
    wire _74;
    reg _3051;
    wire _75;
    wire _76;
    wire [7:0] _77;
    reg [7:0] _1207;
    wire [7:0] _1204;
    wire _2797;
    wire _2798;
    wire _3088;
    wire _3089;
    wire _78;
    reg _1199;
    wire _1195;
    wire _1196;
    wire _2796;
    wire _2799;
    wire _3091;
    wire _3093;
    wire _79;
    reg _1630;
    wire _80;
    wire _2767;
    wire _3098;
    wire _3100;
    wire _81;
    reg _3096;
    wire _82;
    wire _3104;
    wire _2751;
    wire _2744;
    wire _2752;
    wire _2700;
    wire _2696;
    wire _2701;
    wire _3101;
    wire _83;
    wire _3102;
    wire _3103;
    wire _3105;
    wire _3107;
    wire _3109;
    wire _84;
    reg _1627;
    wire _85;
    wire [7:0] _5798;
    wire [3:0] _3110;
    wire _3111;
    wire [7:0] _3112;
    wire [7:0] _3113;
    wire [7:0] _86;
    reg [7:0] _1461;
    wire [7:0] _5797;
    wire [7:0] _5795;
    wire [7:0] _5793;
    wire _87;
    wire _88;
    wire _89;
    wire _5790;
    wire _90;
    wire _5789;
    wire _1591;
    wire _1592;
    wire _91;
    wire _3122;
    wire _3123;
    wire _3125;
    wire _3116;
    wire _3115;
    wire _3117;
    wire _3118;
    wire _92;
    reg _3121;
    wire _3127;
    wire _3129;
    wire _93;
    reg _1665;
    wire [3:0] _3146;
    wire [3:0] _3144;
    wire [3:0] _3147;
    wire _2187;
    wire [2:0] _3135;
    wire _3137;
    wire _3133;
    wire _3134;
    wire _3138;
    wire _3141;
    wire _94;
    reg _2186;
    wire _2188;
    wire _1882;
    wire _1883;
    wire _95;
    wire _1884;
    wire _3142;
    wire [3:0] _3148;
    reg [3:0] _3151;
    wire [3:0] _96;
    wire _1659;
    wire _1660;
    wire [4:0] _3155;
    wire [3:0] _3153;
    wire [3:0] _3152;
    wire _3154;
    wire [4:0] _3156;
    wire [4:0] _3157;
    wire [4:0] _97;
    reg [4:0] _1652;
    wire [5:0] _1653;
    wire _1654;
    wire _1655;
    wire _1649;
    wire _1656;
    wire [5:0] _1639;
    wire [4:0] _3162;
    wire _3161;
    wire [5:0] _3163;
    wire [3:0] _3159;
    wire [3:0] _3158;
    wire _3160;
    wire [5:0] _3164;
    wire [5:0] _3165;
    wire [5:0] _98;
    reg [5:0] _1640;
    wire [4:0] _1641;
    wire _1643;
    wire [4:0] _1645;
    wire [5:0] _1646;
    wire _1647;
    wire _1648;
    wire _1657;
    wire _1661;
    wire _1662;
    wire _1666;
    wire _99;
    wire _3171;
    wire _3173;
    wire _3169;
    wire _3175;
    wire _3176;
    wire _3177;
    wire _3167;
    wire _3178;
    wire _3180;
    wire _100;
    reg _1596;
    wire _101;
    wire [1:0] _5722;
    wire [1:0] _5718;
    wire _5709;
    wire [1:0] _5711;
    wire _5708;
    wire [1:0] _5713;
    wire _5707;
    wire [1:0] _5715;
    wire [1:0] _5716;
    wire [7:0] _1186;
    wire _1188;
    wire _1179;
    wire [15:0] _1174;
    wire _1175;
    wire _1176;
    wire _1173;
    wire _1177;
    wire _1180;
    wire [3:0] _1170;
    wire _1172;
    wire _1181;
    wire _1168;
    wire _1164;
    wire _1165;
    wire _1162;
    wire _1166;
    wire _1169;
    wire _1160;
    reg [2:0] _1054;
    wire [15:0] _1155;
    wire _1156;
    wire _1153;
    wire _1157;
    wire _1151;
    wire _1158;
    wire _1161;
    wire [1:0] _1150;
    reg _1182;
    wire _1149;
    wire _1183;
    wire _1146;
    wire [3:0] _1144;
    reg _1145;
    wire _1147;
    wire [15:0] _1139;
    wire _1141;
    wire [16:0] _1134;
    wire [15:0] _1130;
    wire [16:0] _1131;
    wire [16:0] _1132;
    reg [16:0] _1135;
    wire _1136;
    wire _1137;
    wire [15:0] _1126;
    wire _1128;
    wire _1043;
    wire [2:0] _1045;
    wire _1040;
    wire [2:0] _1042;
    wire _1046;
    wire [2:0] _1047;
    wire _1035;
    wire [2:0] _1037;
    wire _1032;
    wire [2:0] _1034;
    wire _1038;
    wire [2:0] _1039;
    wire _1048;
    wire [2:0] _1049;
    wire _1025;
    wire [2:0] _1027;
    wire _1022;
    wire [2:0] _1024;
    wire _1028;
    wire [2:0] _1029;
    wire _1017;
    wire [2:0] _1019;
    wire [7:0] _1013;
    wire _1014;
    wire [2:0] _1016;
    wire _1020;
    wire [2:0] _1021;
    wire _1030;
    wire [2:0] _1031;
    wire _1050;
    wire [2:0] _1051;
    wire [13:0] _1118;
    wire [16:0] _1119;
    wire [111:0] _1012;
    wire [15:0] _1116;
    wire [16:0] _1117;
    wire [16:0] _1120;
    reg [16:0] _1123;
    wire [16:0] _1115;
    wire _1124;
    wire _1125;
    wire _1129;
    wire _1138;
    wire [1:0] _1057;
    reg [15:0] _1112;
    wire _1114;
    wire _1142;
    wire [7:0] _1106;
    wire _1108;
    wire _1109;
    wire _1105;
    wire _1110;
    wire [7:0] _1099;
    wire [7:0] _1097;
    wire [7:0] _1098;
    wire [7:0] _1100;
    wire _1102;
    wire _1103;
    wire _1111;
    wire _1143;
    wire _1148;
    wire _1184;
    wire _1185;
    wire _1189;
    wire f_fire3;
    wire [7:0] _691;
    wire _693;
    wire _679;
    wire _675;
    wire _676;
    wire _673;
    wire _677;
    wire _680;
    wire [3:0] _670;
    wire _672;
    wire _681;
    wire _668;
    wire _664;
    wire _665;
    wire _662;
    wire _666;
    wire _669;
    wire _660;
    reg [2:0] _654;
    wire [15:0] _655;
    wire _656;
    wire _650;
    wire _657;
    wire _648;
    wire _658;
    wire _661;
    wire [1:0] _647;
    reg _682;
    wire _646;
    wire _683;
    wire _638;
    wire [3:0] _581;
    reg _637;
    wire _639;
    wire [15:0] _576;
    wire _578;
    wire [15:0] _567;
    wire [16:0] _568;
    wire [16:0] _569;
    reg [16:0] _572;
    wire _573;
    wire _574;
    wire [15:0] _563;
    wire _565;
    wire _529;
    wire [2:0] _549;
    wire _508;
    wire [2:0] _528;
    wire _550;
    wire [2:0] _551;
    wire _485;
    wire [2:0] _505;
    wire _464;
    wire [2:0] _484;
    wire _506;
    wire [2:0] _507;
    wire _552;
    wire [2:0] _553;
    wire _439;
    wire [2:0] _459;
    wire _418;
    wire [2:0] _438;
    wire _460;
    wire [2:0] _461;
    wire _395;
    wire [2:0] _415;
    wire [7:0] _373;
    wire _374;
    wire [2:0] _394;
    wire _416;
    wire [2:0] _417;
    wire _462;
    wire [2:0] _463;
    wire _554;
    wire [2:0] _555;
    wire [16:0] _556;
    wire [111:0] _369;
    wire [15:0] _370;
    wire [16:0] _371;
    wire [16:0] _557;
    reg [16:0] _560;
    wire [16:0] _346;
    wire _561;
    wire _562;
    wire _566;
    wire _575;
    wire [1:0] _332;
    reg [15:0] _342;
    wire _344;
    wire _579;
    wire [7:0] _326;
    wire _328;
    wire _329;
    wire _317;
    wire _330;
    wire [7:0] _310;
    wire [7:0] _308;
    wire [7:0] _309;
    wire [7:0] _311;
    wire _313;
    wire [2:0] _5479;
    wire [5:0] _3186;
    wire _3185;
    wire [5:0] _3187;
    wire [5:0] _3188;
    wire [5:0] _102;
    reg [5:0] _3183;
    wire [5:0] _3213;
    wire [5:0] _3194;
    wire [3:0] _3192;
    wire _3193;
    wire [5:0] _3195;
    wire [5:0] _3196;
    wire [5:0] _103;
    reg [5:0] _3191;
    wire [5:0] _3200;
    wire [5:0] _104;
    reg [5:0] _3199;
    wire _3203;
    wire [5:0] _3204;
    wire [5:0] _3205;
    wire [5:0] _3214;
    wire _3201;
    wire [5:0] _3215;
    wire [5:0] _3216;
    wire [5:0] _105;
    reg [5:0] _1203;
    wire [5:0] _3209;
    wire [5:0] _3208;
    wire [5:0] _3207;
    wire [5:0] _3206;
    reg [5:0] _3210;
    wire _3211;
    wire _3212;
    wire [2:0] _5475;
    wire _5470;
    wire [2:0] _5472;
    wire [7:0] _1614;
    wire _1616;
    wire _1617;
    wire _1612;
    wire _1613;
    wire f_unexp_now;
    wire _3220;
    wire _3221;
    wire _3223;
    wire _3224;
    wire _3219;
    wire _3217;
    wire _3225;
    wire _106;
    reg _1609;
    wire _1610;
    wire [15:0] _5461;
    wire [15:0] _5462;
    wire _5458;
    wire _5459;
    wire _5460;
    wire [15:0] _5463;
    wire [2:0] _5403;
    wire [2:0] _5401;
    wire [2:0] _5400;
    wire [2:0] _5399;
    wire [2:0] _5398;
    wire [7:0] _1000;
    wire _1002;
    wire _993;
    wire _989;
    wire _990;
    wire _987;
    wire _991;
    wire _994;
    wire [3:0] _984;
    wire _986;
    wire _995;
    wire _982;
    wire _978;
    wire _979;
    wire _976;
    wire _980;
    wire _983;
    wire _974;
    reg [2:0] _968;
    wire [15:0] _969;
    wire _970;
    wire _964;
    wire _971;
    wire _962;
    wire _972;
    wire _975;
    wire [1:0] _961;
    reg _996;
    wire _960;
    wire _997;
    wire _957;
    wire [3:0] _955;
    reg _956;
    wire _958;
    wire [15:0] _950;
    wire _952;
    wire [15:0] _941;
    wire [16:0] _942;
    wire [16:0] _943;
    reg [16:0] _946;
    wire _947;
    wire _948;
    wire [15:0] _937;
    wire _939;
    wire _921;
    wire [2:0] _923;
    wire _918;
    wire [2:0] _920;
    wire _924;
    wire [2:0] _925;
    wire _913;
    wire [2:0] _915;
    wire _910;
    wire [2:0] _912;
    wire _916;
    wire [2:0] _917;
    wire _926;
    wire [2:0] _927;
    wire _903;
    wire [2:0] _905;
    wire _900;
    wire [2:0] _902;
    wire _906;
    wire [2:0] _907;
    wire _895;
    wire [2:0] _897;
    wire [7:0] _891;
    wire _892;
    wire [2:0] _894;
    wire _898;
    wire [2:0] _899;
    wire _908;
    wire [2:0] _909;
    wire _928;
    wire [2:0] _929;
    wire [16:0] _930;
    wire [111:0] _887;
    wire [15:0] _888;
    wire [16:0] _889;
    wire [16:0] _931;
    reg [16:0] _934;
    wire [16:0] _886;
    wire _935;
    wire _936;
    wire _940;
    wire _949;
    wire [1:0] _882;
    reg [15:0] _883;
    wire _885;
    wire _953;
    wire [7:0] _876;
    wire _878;
    wire _879;
    wire _875;
    wire _880;
    wire [7:0] _869;
    wire [7:0] _867;
    wire [7:0] _868;
    wire [7:0] _870;
    wire _872;
    wire _873;
    wire _881;
    wire _954;
    wire _959;
    wire _998;
    wire _999;
    wire _1003;
    wire f_fire2;
    wire [1:0] _1007;
    wire [1:0] f_policy;
    wire _726;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _716;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _710;
    wire [7:0] _704;
    wire [7:0] f_chgmask0;
    wire [7:0] _698;
    wire [7:0] f_watch;
    wire [7:0] _699;
    wire [7:0] _705;
    wire [7:0] _711;
    wire [7:0] f_relevant;
    wire [7:0] _718;
    wire _720;
    wire _721;
    wire f_amb_now;
    wire _723;
    wire _727;
    wire [7:0] _689;
    wire [7:0] _3230;
    wire [7:0] _3231;
    wire _3227;
    wire [7:0] _3229;
    wire _3226;
    wire [7:0] _3232;
    wire [7:0] _3234;
    wire [7:0] _107;
    reg [7:0] _688;
    wire [7:0] f_multi_eff;
    wire [7:0] _862;
    wire _864;
    wire _855;
    wire _851;
    wire _852;
    wire _849;
    wire _853;
    wire _856;
    wire [3:0] _846;
    wire _848;
    wire _857;
    wire _844;
    wire _840;
    wire _841;
    wire _838;
    wire _842;
    wire _845;
    wire _836;
    reg [2:0] _830;
    wire [15:0] _831;
    wire _832;
    wire _826;
    wire _833;
    wire _824;
    wire _834;
    wire _837;
    wire [1:0] _823;
    reg _858;
    wire [1:0] _3235;
    wire [1:0] _3236;
    wire [1:0] _108;
    reg [1:0] _643;
    wire _645;
    wire _822;
    wire _859;
    wire _819;
    wire _3240;
    wire _3238;
    wire _3241;
    wire _3243;
    wire _3245;
    wire _109;
    reg _636;
    wire [15:0] _3260;
    wire [15:0] _3268;
    wire _3270;
    wire _3247;
    wire _3271;
    wire _3273;
    wire _3274;
    wire _3275;
    wire _3276;
    wire _3278;
    wire _3280;
    wire _110;
    reg _633;
    wire _3288;
    wire _3289;
    wire [4:0] _3284;
    wire _3286;
    wire _3281;
    wire _3283;
    wire _3287;
    wire _3290;
    wire [7:0] _3291;
    wire [7:0] _3292;
    wire [7:0] _111;
    reg [7:0] _3266;
    wire _3300;
    wire _3301;
    wire [4:0] _3296;
    wire _3298;
    wire _3293;
    wire _3295;
    wire _3299;
    wire _3302;
    wire [7:0] _3303;
    wire [7:0] _3304;
    wire [7:0] _112;
    reg [7:0] _3263;
    wire [15:0] _3267;
    wire _3312;
    wire _3313;
    wire [4:0] _3308;
    wire _3310;
    wire _3305;
    wire _3307;
    wire _3311;
    wire _3314;
    wire [7:0] _3315;
    wire [7:0] _3316;
    wire [7:0] _113;
    reg [7:0] _3258;
    wire _3324;
    wire _3325;
    wire [4:0] _3320;
    wire _3322;
    wire _3317;
    wire _3319;
    wire _3323;
    wire _3326;
    wire [7:0] _3327;
    wire [7:0] _3328;
    wire [7:0] _114;
    reg [7:0] _3255;
    wire [15:0] _3259;
    wire [15:0] _3367;
    wire [15:0] _3368;
    wire [15:0] _3369;
    wire _3371;
    wire _3342;
    wire _3343;
    wire _3345;
    wire _3346;
    wire _3347;
    wire _3348;
    wire _3350;
    wire _115;
    reg g_crc_bad;
    wire _3344;
    wire _3361;
    wire [5:0] _3359;
    wire _3360;
    wire _3362;
    wire _3363;
    wire _3364;
    wire _3365;
    wire _3366;
    wire _3354;
    wire _3352;
    wire _3351;
    wire _3353;
    wire _3355;
    wire _116;
    reg g_resid_chk;
    wire _3372;
    wire _3374;
    wire _3376;
    wire _117;
    reg _630;
    wire _3380;
    wire _3378;
    wire _3381;
    wire _3383;
    wire _3385;
    wire _118;
    reg _622;
    wire [15:0] _3400;
    wire [15:0] _3408;
    wire _3410;
    wire _3387;
    wire _3411;
    wire _3413;
    wire _3414;
    wire _3415;
    wire _3416;
    wire _3418;
    wire _3420;
    wire _119;
    reg _619;
    wire _3428;
    wire _3429;
    wire [4:0] _3424;
    wire _3426;
    wire _3421;
    wire _3423;
    wire _3427;
    wire _3430;
    wire [7:0] _3431;
    wire [7:0] _3432;
    wire [7:0] _120;
    reg [7:0] _3406;
    wire _3440;
    wire _3441;
    wire [4:0] _3436;
    wire _3438;
    wire _3433;
    wire _3435;
    wire _3439;
    wire _3442;
    wire [7:0] _3443;
    wire [7:0] _3444;
    wire [7:0] _121;
    reg [7:0] _3403;
    wire [15:0] _3407;
    wire _3452;
    wire _3453;
    wire [4:0] _3448;
    wire _3450;
    wire _3445;
    wire _3447;
    wire _3451;
    wire _3454;
    wire [7:0] _3455;
    wire [7:0] _3456;
    wire [7:0] _122;
    reg [7:0] _3398;
    wire _3464;
    wire _3465;
    wire [4:0] _3460;
    wire _3462;
    wire _3457;
    wire _3459;
    wire _3463;
    wire _3466;
    wire [7:0] _3467;
    wire [7:0] _3468;
    wire [7:0] _123;
    reg [7:0] _3395;
    wire [15:0] _3399;
    wire [15:0] _3507;
    wire [15:0] _3508;
    wire [15:0] _3509;
    wire _3511;
    wire _3482;
    wire _3483;
    wire _3485;
    wire _3486;
    wire _3487;
    wire _3488;
    wire _3490;
    wire _124;
    reg g_crc_bad_0;
    wire _3484;
    wire _3501;
    wire _3500;
    wire _3502;
    wire _3503;
    wire _3504;
    wire _3505;
    wire _3506;
    wire _3494;
    wire _3492;
    wire _3491;
    wire _3493;
    wire _3495;
    wire _125;
    reg g_resid_chk_0;
    wire _3512;
    wire _3514;
    wire _3516;
    wire _126;
    reg _616;
    wire [3:0] _3517;
    wire _3518;
    wire [7:0] _3519;
    wire [7:0] _3520;
    wire [7:0] _127;
    reg [7:0] _606;
    wire [6:0] _607;
    wire [6:0] _603;
    wire _608;
    wire [15:0] _600;
    wire _3525;
    wire _3524;
    wire _3526;
    wire _3523;
    wire _3527;
    wire _3522;
    wire _3528;
    wire [14:0] _3521;
    wire [15:0] _3529;
    wire [15:0] _128;
    reg [15:0] _601;
    wire _602;
    wire [5:0] _597;
    wire [5:0] _3548;
    wire [5:0] _3546;
    wire [5:0] _3549;
    wire _1679;
    wire _1680;
    wire _3531;
    wire _3130;
    wire _3131;
    wire _3532;
    wire _3535;
    wire _129;
    reg _1677;
    wire _1681;
    wire _1667;
    wire _3542;
    wire _3538;
    wire _3536;
    wire _3537;
    wire _3539;
    wire _3543;
    wire f_rx_push;
    wire _1668;
    wire _3544;
    wire [5:0] _3550;
    reg [5:0] _3553;
    wire [5:0] _131;
    wire _598;
    wire _594;
    wire [6:0] _5214;
    wire [7:0] _5215;
    wire _5212;
    wire _5211;
    wire _5210;
    wire _5209;
    wire _5208;
    wire _5207;
    wire _5206;
    wire _5205;
    wire [7:0] _5213;
    wire [5:0] _5197;
    wire [5:0] _5195;
    wire [5:0] _5198;
    wire _2458;
    wire _3579;
    wire _3576;
    wire _3559;
    wire _132;
    reg _3029;
    wire _3577;
    wire _2453;
    wire [2:0] _2447;
    wire _2442;
    wire g_tx_bit;
    wire _2443;
    wire _2444;
    wire _2445;
    wire [2:0] _2448;
    wire _2450;
    wire _2451;
    wire _2422;
    wire _2452;
    wire _2454;
    wire _2418;
    wire [5:0] _2405;
    wire _2410;
    wire _2411;
    wire [9:0] _2401;
    wire _2403;
    wire _2404;
    wire _2412;
    wire _5180;
    wire _5181;
    wire [1:0] _5184;
    wire _5173;
    wire _5174;
    wire _5175;
    wire _5176;
    wire [1:0] _5178;
    wire [2:0] _5159;
    wire [2:0] _5156;
    wire _5152;
    wire _5150;
    wire _5151;
    wire _5153;
    wire [2:0] _5157;
    wire _5148;
    wire [2:0] _5160;
    wire _5161;
    wire [2:0] _5142;
    wire _5138;
    wire _5136;
    wire _5137;
    wire _5139;
    wire [2:0] _5143;
    wire _5134;
    wire [2:0] _5145;
    wire _5146;
    wire _5162;
    wire _5163;
    wire _5164;
    wire _5130;
    wire _5128;
    wire _5131;
    wire [15:0] _5123;
    wire _5124;
    wire _5121;
    wire _5125;
    wire _5119;
    wire _5120;
    wire _5126;
    wire _5132;
    wire _5165;
    wire [1:0] _5167;
    wire [1:0] _5169;
    wire [1:0] _5115;
    wire _5111;
    wire [1:0] _5113;
    wire [1:0] _5116;
    wire _3799;
    wire _3800;
    wire _133;
    reg _3562;
    wire _3812;
    wire _3810;
    wire _3811;
    reg _3813;
    wire _3814;
    wire _3815;
    wire _3807;
    wire _3804;
    wire _3801;
    wire _3802;
    wire _3805;
    wire _3806;
    wire _3808;
    wire _3816;
    wire _3818;
    wire _3820;
    wire _3822;
    wire _3824;
    wire _134;
    reg f_lane0_out;
    wire _2890;
    wire _2891;
    wire _2339;
    wire _2336;
    wire _2329;
    wire _2337;
    wire _2340;
    wire _2363;
    wire _2886;
    wire _2887;
    wire _2883;
    wire _2881;
    wire _3014;
    wire _5086;
    wire _5087;
    wire [1:0] _5090;
    wire _5079;
    wire _5080;
    wire _5081;
    wire _5082;
    wire [1:0] _5084;
    wire [2:0] _5065;
    wire [2:0] _5062;
    wire _5058;
    wire _5056;
    wire _5057;
    wire _5059;
    wire [2:0] _5063;
    wire _5054;
    wire [2:0] _5066;
    wire _5067;
    wire [2:0] _5048;
    wire _5044;
    wire _5042;
    wire _5043;
    wire _5045;
    wire [2:0] _5049;
    wire _5040;
    wire [2:0] _5051;
    wire _5052;
    wire _5068;
    wire _5069;
    wire _5070;
    wire _5036;
    wire _5034;
    wire _5037;
    wire [15:0] _5029;
    wire _5030;
    wire _5027;
    wire _5031;
    wire _5025;
    wire _5026;
    wire _5032;
    wire _5038;
    wire _5071;
    wire [1:0] _5073;
    wire [1:0] _5075;
    wire [1:0] _5021;
    wire _5017;
    wire [1:0] _5019;
    wire [1:0] _5022;
    wire _3856;
    wire _3857;
    wire _135;
    reg _3827;
    wire _4884;
    wire _4882;
    wire _4883;
    reg _4885;
    wire [2:0] _2615;
    wire [2:0] _4854;
    wire [2:0] _4855;
    wire [2:0] _4850;
    wire _4846;
    wire _4844;
    wire _4845;
    wire _4847;
    wire [2:0] _4851;
    wire _4842;
    wire [2:0] _4856;
    wire [2:0] _4857;
    wire [2:0] _4836;
    wire [2:0] _4837;
    wire [2:0] _4832;
    wire _3852;
    wire _3851;
    wire _3850;
    wire _3849;
    wire _3848;
    wire _3847;
    wire _3846;
    wire _3842;
    wire _3841;
    wire _3840;
    wire _3839;
    wire _3838;
    wire _3837;
    wire _3836;
    wire _3771;
    wire _3772;
    reg [7:0] _3773;
    wire _3765;
    wire _3766;
    reg [7:0] _3767;
    wire _3759;
    wire _3760;
    reg [7:0] _3761;
    wire _3753;
    wire _3754;
    reg [7:0] _3755;
    wire _3747;
    wire _3748;
    reg [7:0] _3749;
    wire _3741;
    wire _3742;
    reg [7:0] _3743;
    wire _3735;
    wire _3736;
    reg [7:0] _3737;
    wire _3729;
    wire _3730;
    reg [7:0] _3731;
    wire _3723;
    wire _3724;
    reg [7:0] _3725;
    wire _3717;
    wire _3718;
    reg [7:0] _3719;
    wire _3711;
    wire _3712;
    reg [7:0] _3713;
    wire _3705;
    wire _3706;
    reg [7:0] _3707;
    wire _3699;
    wire _3700;
    reg [7:0] _3701;
    wire _3693;
    wire _3694;
    reg [7:0] _3695;
    wire _3687;
    wire _3688;
    reg [7:0] _3689;
    wire _3681;
    wire _3682;
    reg [7:0] _3683;
    wire _3675;
    wire _3676;
    reg [7:0] _3677;
    wire _3669;
    wire _3670;
    reg [7:0] _3671;
    wire _3663;
    wire _3664;
    reg [7:0] _3665;
    wire _3657;
    wire _3658;
    reg [7:0] _3659;
    wire _3651;
    wire _3652;
    reg [7:0] _3653;
    wire _3645;
    wire _3646;
    reg [7:0] _3647;
    wire _3639;
    wire _3640;
    reg [7:0] _3641;
    wire _3633;
    wire _3634;
    reg [7:0] _3635;
    wire _3627;
    wire _3628;
    reg [7:0] _3629;
    wire _3621;
    wire _3622;
    reg [7:0] _3623;
    wire _3615;
    wire _3616;
    reg [7:0] _3617;
    wire _3609;
    wire _3610;
    reg [7:0] _3611;
    wire _3603;
    wire _3604;
    reg [7:0] _3605;
    wire _3597;
    wire _3598;
    reg [7:0] _3599;
    wire _3591;
    wire _3592;
    reg [7:0] _3593;
    wire [4:0] _3859;
    wire [4:0] _3860;
    wire [4:0] _136;
    reg [4:0] _3583;
    wire _3585;
    wire _3586;
    wire [7:0] _3924;
    wire [7:0] _3925;
    wire [7:0] _3875;
    wire [7:0] _3873;
    wire [7:0] _3876;
    wire [7:0] _137;
    reg [7:0] _3865;
    wire [7:0] _3871;
    wire [7:0] _3872;
    wire [7:0] _3917;
    wire [7:0] _3884;
    wire [7:0] _3882;
    wire [7:0] _3885;
    wire [7:0] _138;
    reg [7:0] _3881;
    wire [6:0] _3902;
    wire [7:0] _3903;
    wire [6:0] _3900;
    wire _3898;
    wire _3897;
    wire _3896;
    wire _3895;
    wire _3894;
    wire _3893;
    wire _3892;
    wire _3891;
    wire [2:0] _3889;
    wire [2:0] _3888;
    wire [2:0] _3887;
    wire [2:0] _3886;
    reg [2:0] _3890;
    reg _3899;
    wire [7:0] _3901;
    reg [7:0] _3904;
    wire [7:0] _3905;
    wire [7:0] _139;
    reg [7:0] _593;
    wire _3883;
    wire _3909;
    wire _3877;
    wire _3878;
    wire _3907;
    wire [1:0] _2737;
    wire [1:0] _2736;
    wire [1:0] _2735;
    wire [1:0] _2734;
    reg [1:0] _2738;
    wire [1:0] _2740;
    wire f_eng_push;
    wire _2743;
    wire _2749;
    wire _2746;
    wire _2747;
    wire _2745;
    wire _2748;
    wire _2750;
    wire _3910;
    wire _140;
    reg _2733;
    wire [7:0] _3916;
    wire _3874;
    wire _3914;
    wire _2693;
    wire [2:0] _2687;
    wire _2682;
    wire g_tx_bit_0;
    wire _2683;
    wire _2684;
    wire _2685;
    wire [2:0] _2688;
    wire _2690;
    wire _2691;
    wire _2662;
    wire _2692;
    wire _2694;
    wire _2658;
    wire _2659;
    wire _2695;
    wire _3861;
    wire _3862;
    wire _3912;
    wire _3915;
    wire _141;
    reg _2490;
    wire _2698;
    wire _2697;
    wire _2699;
    wire [7:0] _3918;
    wire [7:0] _3926;
    wire [7:0] _142;
    wire [7:0] _143;
    wire _3555;
    wire _3556;
    wire [7:0] _3927;
    wire [7:0] _144;
    reg [7:0] _3572;
    wire [7:0] _3573;
    reg [7:0] _3587;
    wire [4:0] _4456;
    wire _4453;
    wire _2843;
    wire _2842;
    wire _2844;
    wire _2835;
    wire _2832;
    wire [2:0] _2375;
    wire [2:0] _4324;
    wire [2:0] _4325;
    wire [2:0] _4320;
    wire _4316;
    wire _4314;
    wire _4315;
    wire _4317;
    wire [2:0] _4321;
    wire _4312;
    wire [2:0] _4326;
    wire [2:0] _4327;
    wire [2:0] _4306;
    wire [2:0] _4307;
    wire [2:0] _4302;
    wire _4298;
    wire _4296;
    wire _4297;
    wire _4299;
    wire [2:0] _4303;
    wire _4294;
    wire [2:0] _4308;
    wire [7:0] _3947;
    wire [7:0] _3948;
    wire [7:0] _145;
    reg [7:0] g_lim;
    wire [15:0] _2397;
    wire _3956;
    wire _3957;
    wire [4:0] _3952;
    wire _3954;
    wire _3949;
    wire _3951;
    wire _3955;
    wire _3958;
    wire [7:0] _3959;
    wire [7:0] _3960;
    wire [7:0] _146;
    reg [7:0] _2391;
    wire _3968;
    wire _3969;
    wire [4:0] _3964;
    wire _3966;
    wire _3961;
    wire _3963;
    wire _3967;
    wire _3970;
    wire [7:0] _3971;
    wire [7:0] _3972;
    wire [7:0] _147;
    reg [7:0] _2388;
    wire [15:0] _2392;
    wire [14:0] _3391;
    wire [15:0] _3392;
    wire [15:0] _3973;
    wire [15:0] _3974;
    wire [15:0] _3975;
    wire [15:0] _3977;
    wire [15:0] _148;
    reg [15:0] g_sr;
    wire [3:0] _3939;
    wire _3985;
    wire _3986;
    wire [4:0] _3981;
    wire _3983;
    wire _3978;
    wire _3980;
    wire _3984;
    wire _3987;
    wire [7:0] _3988;
    wire [7:0] _3989;
    wire [7:0] _149;
    reg [7:0] _3937;
    wire [3:0] _3938;
    wire _3940;
    wire [3:0] _3941;
    wire [7:0] _3943;
    wire [5:0] _2409;
    wire [7:0] _3933;
    wire [7:0] _3944;
    wire [15:0] _3945;
    wire _3946;
    wire _4015;
    wire [5:0] _3997;
    wire _4002;
    wire [9:0] _3993;
    wire _3995;
    wire _3991;
    wire _3990;
    wire _3992;
    wire _3996;
    wire _4003;
    wire _4005;
    wire _4006;
    wire _4007;
    wire _4008;
    wire _4009;
    wire _4011;
    wire _4013;
    wire _150;
    reg g_len_cap;
    wire _4016;
    wire _4018;
    wire _151;
    reg g_len_known;
    wire [15:0] _2398;
    wire [15:0] _4286;
    wire [15:0] _4287;
    wire [15:0] _4288;
    wire _4269;
    wire _3795;
    wire _3794;
    wire _3793;
    wire _3792;
    wire _3791;
    wire _3790;
    wire _3789;
    wire _3785;
    wire _3784;
    wire _3783;
    wire _3782;
    wire _3781;
    wire _3780;
    wire _3779;
    wire [7:0] _3776;
    wire [6:0] _3921;
    wire [7:0] _3922;
    wire [6:0] _3919;
    wire [7:0] _3920;
    wire [7:0] _3923;
    wire [7:0] _4023;
    wire [7:0] _4024;
    wire [7:0] _4025;
    wire [7:0] _4026;
    wire [7:0] _4019;
    wire [7:0] _4020;
    wire [7:0] _4021;
    wire [7:0] _4022;
    wire [7:0] _4027;
    wire [7:0] _152;
    reg [7:0] g_byte;
    wire [7:0] _3777;
    wire _3778;
    wire [7:0] _3786;
    wire _3563;
    wire [7:0] _3787;
    wire _3788;
    wire [2:0] _4035;
    wire [2:0] _4036;
    wire [2:0] _4037;
    wire [2:0] _4038;
    wire [2:0] _4039;
    wire [2:0] _4029;
    wire [2:0] _4030;
    wire [2:0] _4031;
    wire [2:0] _4032;
    wire [2:0] _4033;
    wire [2:0] _4040;
    wire [2:0] _4042;
    wire [2:0] _153;
    reg [2:0] g_bitpos;
    reg _3796;
    wire _3480;
    wire _4053;
    wire _4054;
    wire [4:0] _4049;
    wire _4051;
    wire _4046;
    wire _4048;
    wire _4052;
    wire _4055;
    wire [7:0] _4056;
    wire [7:0] _4057;
    wire [7:0] _154;
    reg [7:0] _4045;
    wire _4068;
    wire _4069;
    wire [4:0] _4064;
    wire _4066;
    wire _4061;
    wire _4063;
    wire _4067;
    wire _4070;
    wire [7:0] _4071;
    wire [7:0] _4072;
    wire [7:0] _155;
    reg [7:0] _4060;
    wire _4083;
    wire _4084;
    wire [4:0] _4079;
    wire _4081;
    wire _4076;
    wire _4078;
    wire _4082;
    wire _4085;
    wire [7:0] _4086;
    wire [7:0] _4087;
    wire [7:0] _156;
    reg [7:0] _4075;
    wire _4098;
    wire _4099;
    wire [4:0] _4094;
    wire _4096;
    wire _4091;
    wire _4093;
    wire _4097;
    wire _4100;
    wire [7:0] _4101;
    wire [7:0] _4102;
    wire [7:0] _157;
    reg [7:0] _4090;
    wire [31:0] _4263;
    wire [30:0] _4256;
    wire [31:0] _4258;
    wire _4249;
    wire _4250;
    wire [31:0] _4252;
    wire [30:0] _4246;
    wire [31:0] _4248;
    wire [31:0] _4253;
    wire _4110;
    wire _4111;
    wire [4:0] _4106;
    wire _4108;
    wire _4103;
    wire _4105;
    wire _4109;
    wire _4112;
    wire [7:0] _4113;
    wire [7:0] _4114;
    wire [7:0] _158;
    reg [7:0] _4000;
    wire [5:0] _4001;
    wire [5:0] _4242;
    wire _4243;
    wire _4244;
    wire [9:0] _4237;
    wire _4239;
    wire _4240;
    wire _4122;
    wire _4123;
    wire [4:0] _4118;
    wire _4120;
    wire _4115;
    wire _4117;
    wire _4121;
    wire _4124;
    wire [7:0] _4125;
    wire [7:0] _4126;
    wire [7:0] _159;
    reg [7:0] _2408;
    wire _3386;
    wire _4236;
    wire _4241;
    wire _4245;
    wire [31:0] _4254;
    wire [31:0] _4255;
    wire _4137;
    wire _4138;
    wire [4:0] _4133;
    wire _4135;
    wire _4130;
    wire _4132;
    wire _4136;
    wire _4139;
    wire [7:0] _4140;
    wire [7:0] _4141;
    wire [7:0] _160;
    reg [7:0] _4129;
    wire [5:0] _4156;
    wire [5:0] _4151;
    wire [5:0] _4152;
    wire [5:0] _4153;
    wire [5:0] _4154;
    wire [5:0] _4145;
    wire [5:0] _4146;
    wire [5:0] _4147;
    wire [5:0] _4148;
    wire [5:0] _4149;
    wire [5:0] _4155;
    wire [5:0] _4157;
    wire [5:0] _4159;
    wire [5:0] _161;
    reg [5:0] g_left;
    wire _2438;
    wire _2439;
    wire _3473;
    wire _3472;
    wire _3474;
    wire _3475;
    wire [31:0] _4259;
    wire _2378;
    wire [31:0] _4260;
    wire [31:0] _4261;
    wire _4170;
    wire _4171;
    wire [4:0] _4166;
    wire _4168;
    wire _4163;
    wire _4165;
    wire _4169;
    wire _4172;
    wire [7:0] _4173;
    wire [7:0] _4174;
    wire [7:0] _162;
    reg [7:0] _4162;
    wire _4185;
    wire _4186;
    wire [4:0] _4181;
    wire _4183;
    wire _4178;
    wire _4180;
    wire _4184;
    wire _4187;
    wire [7:0] _4188;
    wire [7:0] _4189;
    wire [7:0] _163;
    reg [7:0] _4177;
    wire _4200;
    wire _4201;
    wire [4:0] _4196;
    wire _4198;
    wire _4193;
    wire _4195;
    wire _4199;
    wire _4202;
    wire [7:0] _4203;
    wire [7:0] _4204;
    wire [7:0] _164;
    reg [7:0] _4192;
    wire _4215;
    wire _4216;
    wire [4:0] _4211;
    wire _4213;
    wire _4208;
    wire _4210;
    wire _4214;
    wire _4217;
    wire [7:0] _4218;
    wire [7:0] _4219;
    wire [7:0] _165;
    reg [7:0] _4207;
    wire [31:0] _4229;
    wire _4226;
    wire _4227;
    wire [31:0] _4230;
    wire [30:0] _4223;
    wire [31:0] _4225;
    wire [31:0] _4231;
    wire [30:0] _4220;
    wire [31:0] _4222;
    wire [31:0] _4232;
    wire [31:0] _4233;
    wire [31:0] _4234;
    wire [31:0] _4235;
    wire [31:0] _4262;
    wire [31:0] _4264;
    wire [31:0] _4266;
    wire [31:0] _166;
    reg [31:0] g_crc;
    wire _3479;
    wire _3481;
    wire _3797;
    wire _3798;
    wire _4267;
    wire _4268;
    wire _4270;
    wire _4272;
    wire _167;
    reg g_last;
    wire _2910;
    wire _2907;
    wire _2911;
    wire _4274;
    wire _4275;
    wire _4276;
    wire _4278;
    wire _168;
    reg g_prev;
    wire _2904;
    wire _2901;
    wire _2905;
    wire _2912;
    wire _2913;
    wire _2914;
    wire [15:0] _4289;
    wire [15:0] _4280;
    wire [15:0] _4281;
    wire [15:0] _4282;
    wire [15:0] _4283;
    wire [15:0] _4284;
    wire [15:0] _4290;
    wire [15:0] _4292;
    wire [15:0] _169;
    reg [15:0] g_cnt;
    wire g_data_left;
    wire _2433;
    wire _2440;
    wire [2:0] _4309;
    wire [2:0] _4310;
    wire [2:0] _4328;
    wire [2:0] _4330;
    wire [2:0] _170;
    reg [2:0] g_run;
    wire _2376;
    wire _4338;
    wire _4339;
    wire [4:0] _4334;
    wire _4336;
    wire _4331;
    wire _4333;
    wire _4337;
    wire _4340;
    wire [7:0] _4341;
    wire [7:0] _4342;
    wire [7:0] _171;
    reg [7:0] _2367;
    wire [1:0] _2368;
    wire _2370;
    wire _2371;
    wire _2377;
    wire _2829;
    wire _2830;
    wire _2833;
    wire _2360;
    wire _2361;
    reg _2357;
    wire _2358;
    wire _2350;
    wire _2349;
    wire _2348;
    wire _2347;
    wire _2346;
    wire _2345;
    wire _2344;
    wire _2343;
    wire [2:0] _2342;
    reg _2351;
    reg _2354;
    wire _2359;
    wire _2341;
    wire _2362;
    wire _2428;
    wire _2426;
    wire _2327;
    wire [13:0] _2318;
    wire [15:0] _2319;
    wire [14:0] _2315;
    wire [15:0] _2316;
    wire [15:0] _2320;
    wire [14:0] _2312;
    wire [15:0] _2313;
    wire _2310;
    wire [15:0] _2321;
    reg [15:0] _2324;
    wire _2325;
    wire [13:0] _2302;
    wire [15:0] _2303;
    reg [15:0] _2306;
    wire _4427;
    wire _4428;
    wire [15:0] _4429;
    wire [15:0] _4431;
    wire [15:0] _4433;
    wire _4411;
    wire [14:0] _2331;
    wire [15:0] _2332;
    reg [15:0] _2335;
    wire [16:0] _4407;
    wire _4408;
    wire [16:0] _4401;
    reg [16:0] _4404;
    wire [16:0] _4396;
    wire _4350;
    wire _4351;
    wire [4:0] _4346;
    wire _4348;
    wire _4343;
    wire _4345;
    wire _4349;
    wire _4352;
    wire [7:0] _4353;
    wire [7:0] _4354;
    wire [7:0] _172;
    reg [7:0] _2300;
    wire _4362;
    wire _4363;
    wire [4:0] _4358;
    wire _4360;
    wire _4355;
    wire _4357;
    wire _4361;
    wire _4364;
    wire [7:0] _4365;
    wire [7:0] _4366;
    wire [7:0] _173;
    reg [7:0] _2297;
    wire [15:0] _2301;
    wire [16:0] _4395;
    wire [16:0] _4397;
    reg [16:0] _4400;
    wire _4377;
    wire _4378;
    wire [4:0] _4373;
    wire _4375;
    wire _4370;
    wire _4372;
    wire _4376;
    wire _4379;
    wire [7:0] _4380;
    wire [7:0] _4381;
    wire [7:0] _174;
    reg [7:0] _4369;
    wire [8:0] _4415;
    wire [7:0] _4417;
    wire [7:0] _4418;
    wire [7:0] _4419;
    wire [7:0] _4421;
    wire [7:0] _175;
    reg [7:0] _4389;
    wire [8:0] _4414;
    wire [8:0] _4416;
    wire _4422;
    wire _4423;
    wire _4424;
    wire _4426;
    wire _176;
    reg _4394;
    wire [16:0] _4405;
    wire [16:0] _4391;
    wire _4406;
    wire _4409;
    wire _4412;
    wire _4390;
    wire _4413;
    wire [15:0] _4435;
    wire _4385;
    wire _4383;
    wire _613;
    wire _4382;
    wire _4384;
    wire _4386;
    wire [15:0] _4436;
    wire [15:0] _4438;
    wire [15:0] _177;
    reg [15:0] _2293;
    wire _2307;
    wire _2308;
    wire _2290;
    wire _2309;
    wire _2326;
    wire _2328;
    wire _2429;
    wire [1:0] _2284;
    wire _2286;
    wire _2287;
    wire _2283;
    wire _2288;
    wire _2280;
    reg _2277;
    wire _2270;
    wire _2269;
    wire _2268;
    wire _2267;
    wire _2266;
    wire _2265;
    wire _2264;
    wire _2263;
    wire _4446;
    wire _4447;
    wire [4:0] _4442;
    wire _4444;
    wire _4439;
    wire _4441;
    wire _4445;
    wire _4448;
    wire [7:0] _4449;
    wire [7:0] _4450;
    wire [7:0] _178;
    reg [7:0] _2261;
    wire [2:0] _2262;
    reg _2271;
    reg _2274;
    wire _2278;
    wire _2279;
    wire _2281;
    wire _2289;
    wire _2430;
    wire _2258;
    wire _2431;
    wire _2423;
    wire _2424;
    wire _2432;
    wire _2834;
    wire _2836;
    wire _2845;
    wire _2826;
    wire _2824;
    wire _2827;
    wire _4451;
    wire _4452;
    wire _179;
    wire _4454;
    wire [4:0] _4457;
    wire [4:0] _180;
    reg [4:0] _3569;
    reg [7:0] _3774;
    wire [7:0] _3833;
    wire [6:0] _3868;
    wire [7:0] _3869;
    wire [6:0] _3866;
    wire [7:0] _3867;
    wire [7:0] _3870;
    wire [7:0] _4462;
    wire [7:0] _4463;
    wire [7:0] _4464;
    wire [7:0] _4465;
    wire [7:0] _4458;
    wire [7:0] _4459;
    wire [7:0] _4460;
    wire [7:0] _4461;
    wire [7:0] _4466;
    wire [7:0] _181;
    reg [7:0] g_byte_0;
    wire _2840;
    wire _2837;
    wire _2838;
    wire _2841;
    wire [7:0] _3834;
    wire _3835;
    wire [7:0] _3843;
    wire _3828;
    wire [7:0] _3844;
    wire _3845;
    wire [2:0] _4474;
    wire [5:0] _2645;
    wire _2650;
    wire _2651;
    wire [9:0] _2641;
    wire _2643;
    wire _2644;
    wire _2652;
    wire _2653;
    wire [2:0] _4475;
    wire [2:0] _4476;
    wire [2:0] _4477;
    wire [2:0] _4478;
    wire [2:0] _4468;
    wire [2:0] _4469;
    wire [2:0] _4470;
    wire [2:0] _4471;
    wire [2:0] _4472;
    wire [2:0] _4479;
    wire [2:0] _4481;
    wire [2:0] _182;
    reg [2:0] g_bitpos_0;
    reg _3853;
    wire _3340;
    wire _4492;
    wire _4493;
    wire [4:0] _4488;
    wire _4490;
    wire _4485;
    wire _4487;
    wire _4491;
    wire _4494;
    wire [7:0] _4495;
    wire [7:0] _4496;
    wire [7:0] _183;
    reg [7:0] _4484;
    wire _4507;
    wire _4508;
    wire [4:0] _4503;
    wire _4505;
    wire _4500;
    wire _4502;
    wire _4506;
    wire _4509;
    wire [7:0] _4510;
    wire [7:0] _4511;
    wire [7:0] _184;
    reg [7:0] _4499;
    wire _4522;
    wire _4523;
    wire [4:0] _4518;
    wire _4520;
    wire _4515;
    wire _4517;
    wire _4521;
    wire _4524;
    wire [7:0] _4525;
    wire [7:0] _4526;
    wire [7:0] _185;
    reg [7:0] _4514;
    wire _4537;
    wire _4538;
    wire [4:0] _4533;
    wire _4535;
    wire _4530;
    wire _4532;
    wire _4536;
    wire _4539;
    wire [7:0] _4540;
    wire [7:0] _4541;
    wire [7:0] _186;
    reg [7:0] _4529;
    wire [31:0] _4682;
    wire [30:0] _4675;
    wire [31:0] _4677;
    wire _4668;
    wire _4669;
    wire [31:0] _4671;
    wire [30:0] _4665;
    wire [31:0] _4667;
    wire [31:0] _4672;
    wire [5:0] _4657;
    wire _4662;
    wire _4663;
    wire [9:0] _4652;
    wire _4654;
    wire _4655;
    wire _4651;
    wire _4656;
    wire _4664;
    wire [31:0] _4673;
    wire [31:0] _4674;
    wire _4552;
    wire _4553;
    wire [4:0] _4548;
    wire _4550;
    wire _4545;
    wire _4547;
    wire _4551;
    wire _4554;
    wire [7:0] _4555;
    wire [7:0] _4556;
    wire [7:0] _187;
    reg [7:0] _4544;
    wire [5:0] _4571;
    wire [5:0] _4566;
    wire [5:0] _4567;
    wire [5:0] _4568;
    wire [5:0] _4569;
    wire [5:0] _4560;
    wire [5:0] _4561;
    wire [5:0] _4562;
    wire [5:0] _4563;
    wire [5:0] _4564;
    wire [5:0] _4570;
    wire [5:0] _4572;
    wire [5:0] _4574;
    wire [5:0] _188;
    reg [5:0] g_left_0;
    wire _2678;
    wire _2679;
    wire _3333;
    wire _3332;
    wire _3334;
    wire _3335;
    wire [31:0] _4678;
    wire [31:0] _4679;
    wire [31:0] _4680;
    wire _4585;
    wire _4586;
    wire [4:0] _4581;
    wire _4583;
    wire _4578;
    wire _4580;
    wire _4584;
    wire _4587;
    wire [7:0] _4588;
    wire [7:0] _4589;
    wire [7:0] _189;
    reg [7:0] _4577;
    wire _4600;
    wire _4601;
    wire [4:0] _4596;
    wire _4598;
    wire _4593;
    wire _4595;
    wire _4599;
    wire _4602;
    wire [7:0] _4603;
    wire [7:0] _4604;
    wire [7:0] _190;
    reg [7:0] _4592;
    wire _4615;
    wire _4616;
    wire [4:0] _4611;
    wire _4613;
    wire _4608;
    wire _4610;
    wire _4614;
    wire _4617;
    wire [7:0] _4618;
    wire [7:0] _4619;
    wire [7:0] _191;
    reg [7:0] _4607;
    wire _4630;
    wire _4631;
    wire [4:0] _4626;
    wire _4628;
    wire _4623;
    wire _4625;
    wire _4629;
    wire _4632;
    wire [7:0] _4633;
    wire [7:0] _4634;
    wire [7:0] _192;
    reg [7:0] _4622;
    wire [31:0] _4644;
    wire _4641;
    wire _4642;
    wire [31:0] _4645;
    wire [30:0] _4638;
    wire [31:0] _4640;
    wire [31:0] _4646;
    wire [30:0] _4635;
    wire [31:0] _4637;
    wire [31:0] _4647;
    wire [31:0] _4648;
    wire [31:0] _4649;
    wire [31:0] _4650;
    wire [31:0] _4681;
    wire [31:0] _4683;
    wire [31:0] _4685;
    wire [31:0] _193;
    reg [31:0] g_crc_0;
    wire _3339;
    wire _3341;
    wire [7:0] _4705;
    wire [7:0] _4706;
    wire [7:0] _194;
    reg [7:0] g_lim_0;
    wire [15:0] _2637;
    wire _4714;
    wire _4715;
    wire [4:0] _4710;
    wire _4712;
    wire _4707;
    wire _4709;
    wire _4713;
    wire _4716;
    wire [7:0] _4717;
    wire [7:0] _4718;
    wire [7:0] _195;
    reg [7:0] _2631;
    wire _4726;
    wire _4727;
    wire [4:0] _4722;
    wire _4724;
    wire _4719;
    wire _4721;
    wire _4725;
    wire _4728;
    wire [7:0] _4729;
    wire [7:0] _4730;
    wire [7:0] _196;
    reg [7:0] _2628;
    wire [15:0] _2632;
    wire [14:0] _3251;
    wire [15:0] _3252;
    wire [15:0] _4731;
    wire [15:0] _4732;
    wire [15:0] _4733;
    wire [15:0] _4735;
    wire [15:0] _197;
    reg [15:0] g_sr_0;
    wire [3:0] _4697;
    wire _4743;
    wire _4744;
    wire [4:0] _4739;
    wire _4741;
    wire _4736;
    wire _4738;
    wire _4742;
    wire _4745;
    wire [7:0] _4746;
    wire [7:0] _4747;
    wire [7:0] _198;
    reg [7:0] _4695;
    wire [3:0] _4696;
    wire _4698;
    wire [3:0] _4699;
    wire [7:0] _4701;
    wire [5:0] _2649;
    wire [7:0] _4691;
    wire [7:0] _4702;
    wire [15:0] _4703;
    wire _4704;
    wire _4793;
    wire _4755;
    wire _4756;
    wire [4:0] _4751;
    wire _4753;
    wire _4748;
    wire _4750;
    wire _4754;
    wire _4757;
    wire [7:0] _4758;
    wire [7:0] _4759;
    wire [7:0] _199;
    reg [7:0] _4660;
    wire [5:0] _4661;
    wire [5:0] _4779;
    wire _4780;
    wire [9:0] _4775;
    wire _4777;
    wire _3246;
    wire _4773;
    wire _4767;
    wire _4768;
    wire [4:0] _4763;
    wire _4765;
    wire _4760;
    wire _4762;
    wire _4766;
    wire _4769;
    wire [7:0] _4770;
    wire [7:0] _4771;
    wire [7:0] _200;
    reg [7:0] _2648;
    wire _4772;
    wire _4774;
    wire _4778;
    wire _4781;
    wire _4783;
    wire _4784;
    wire _4785;
    wire _4786;
    wire _4787;
    wire _4789;
    wire _4791;
    wire _201;
    reg g_len_cap_0;
    wire _4794;
    wire _4796;
    wire _202;
    reg g_len_known_0;
    wire [15:0] _2638;
    wire [15:0] _4816;
    wire _2619;
    wire _2640;
    wire [15:0] _4817;
    wire _2618;
    wire [15:0] _4818;
    wire _4799;
    wire _4797;
    wire _4798;
    wire _4800;
    wire _4802;
    wire _203;
    reg g_last_0;
    wire _2955;
    wire _2952;
    wire _2956;
    wire _4804;
    wire _4805;
    wire _4806;
    wire _4808;
    wire _204;
    reg g_prev_0;
    wire _2949;
    wire _2946;
    wire _2950;
    wire _2957;
    wire _2958;
    wire _2959;
    wire [15:0] _4819;
    wire [15:0] _4810;
    wire [15:0] _4811;
    wire [15:0] _4812;
    wire [15:0] _4813;
    wire [15:0] _4814;
    wire [15:0] _4820;
    wire [15:0] _4822;
    wire [15:0] _205;
    reg [15:0] g_cnt_0;
    wire g_data_left_0;
    wire _3854;
    wire _3855;
    wire _4828;
    wire _4826;
    wire _4827;
    wire _4829;
    wire [2:0] _4833;
    wire _4824;
    wire [2:0] _4838;
    wire [2:0] _4839;
    wire [2:0] _4840;
    wire [2:0] _4858;
    wire [2:0] _4860;
    wire [2:0] _206;
    reg [2:0] g_run_0;
    wire _2616;
    wire _4868;
    wire _4869;
    wire [4:0] _4864;
    wire _4866;
    wire _4861;
    wire _4863;
    wire _4867;
    wire _4870;
    wire [7:0] _4871;
    wire [7:0] _4872;
    wire [7:0] _207;
    reg [7:0] _2607;
    wire [1:0] _2608;
    wire _2610;
    wire _2611;
    wire _2617;
    wire _2673;
    wire _2680;
    wire _4886;
    wire _2663;
    wire _2664;
    wire _2672;
    wire _4887;
    wire _2668;
    wire _2666;
    wire _2669;
    wire _2670;
    wire _2671;
    wire _4879;
    wire _4876;
    wire _4873;
    wire _4874;
    wire _4877;
    wire _4878;
    wire _4880;
    wire _4888;
    wire _4890;
    wire _4892;
    wire _4894;
    wire _4896;
    wire _208;
    reg f_lane1_out;
    wire _2935;
    wire _2936;
    wire _2931;
    wire _2932;
    wire _2928;
    wire _2926;
    wire _2924;
    wire _2925;
    wire _2927;
    wire _2929;
    wire _2933;
    wire _2934;
    wire _2937;
    wire [1:0] _5024;
    wire _2600;
    wire _2601;
    reg _2597;
    wire _2598;
    wire _2590;
    wire _2589;
    wire _2588;
    wire _2587;
    wire _2586;
    wire _2585;
    wire _2584;
    wire _2583;
    wire [2:0] _2582;
    reg _2591;
    reg _2594;
    wire _2599;
    wire _2581;
    wire _2602;
    wire _2579;
    wire _2576;
    wire _2569;
    wire _2567;
    wire [13:0] _2558;
    wire [15:0] _2559;
    wire [14:0] _2555;
    wire [15:0] _2556;
    wire [15:0] _2560;
    wire [14:0] _2552;
    wire [15:0] _2553;
    wire _2550;
    wire [15:0] _2561;
    reg [15:0] _2564;
    wire _2565;
    wire [13:0] _2542;
    wire [15:0] _2543;
    reg [15:0] _2546;
    wire _4981;
    wire _4982;
    wire [15:0] _4983;
    wire [15:0] _4985;
    wire [15:0] _4987;
    wire _4965;
    wire [14:0] _2571;
    wire [15:0] _2572;
    reg [15:0] _2575;
    wire [16:0] _4961;
    wire _4962;
    wire [16:0] _4955;
    reg [16:0] _4958;
    wire _4904;
    wire _4905;
    wire [4:0] _4900;
    wire _4902;
    wire _4897;
    wire _4899;
    wire _4903;
    wire _4906;
    wire [7:0] _4907;
    wire [7:0] _4908;
    wire [7:0] _209;
    reg [7:0] _2540;
    wire _4916;
    wire _4917;
    wire [4:0] _4912;
    wire _4914;
    wire _4909;
    wire _4911;
    wire _4915;
    wire _4918;
    wire [7:0] _4919;
    wire [7:0] _4920;
    wire [7:0] _210;
    reg [7:0] _2537;
    wire [15:0] _2541;
    wire [16:0] _4949;
    wire [16:0] _4951;
    reg [16:0] _4954;
    wire _4931;
    wire _4932;
    wire [4:0] _4927;
    wire _4929;
    wire _4924;
    wire _4926;
    wire _4930;
    wire _4933;
    wire [7:0] _4934;
    wire [7:0] _4935;
    wire [7:0] _211;
    reg [7:0] _4923;
    wire [8:0] _4969;
    wire [7:0] _4971;
    wire [7:0] _4972;
    wire [7:0] _4973;
    wire [7:0] _4975;
    wire [7:0] _212;
    reg [7:0] _4943;
    wire [8:0] _4968;
    wire [8:0] _4970;
    wire _4976;
    wire _4977;
    wire _4978;
    wire _4980;
    wire _213;
    reg _4948;
    wire [16:0] _4959;
    wire [16:0] _4945;
    wire _4960;
    wire _4963;
    wire _4966;
    wire _4944;
    wire _4967;
    wire [15:0] _4989;
    wire _4939;
    wire _4937;
    wire _627;
    wire _4936;
    wire _4938;
    wire _4940;
    wire [15:0] _4990;
    wire [15:0] _4992;
    wire [15:0] _214;
    reg [15:0] _2533;
    wire _2547;
    wire _2548;
    wire _2530;
    wire _2549;
    wire _2566;
    wire _2568;
    wire _2577;
    wire [1:0] _2524;
    wire _2526;
    wire _2527;
    wire _2528;
    wire _2520;
    reg _2517;
    wire _2510;
    wire _2509;
    wire _2508;
    wire _2507;
    wire _2506;
    wire _2505;
    wire _2504;
    wire _2503;
    wire _5000;
    wire _5001;
    wire [4:0] _4996;
    wire _4998;
    wire _4993;
    wire _4995;
    wire _4999;
    wire _5002;
    wire [7:0] _5003;
    wire [7:0] _5004;
    wire [7:0] _215;
    reg [7:0] _2501;
    wire [2:0] _2502;
    reg _2511;
    reg _2514;
    wire _2518;
    wire _2519;
    wire _2521;
    wire _2529;
    wire _2580;
    wire _2498;
    wire _2603;
    wire _5012;
    wire _5013;
    wire [4:0] _5008;
    wire _5010;
    wire _5005;
    wire _5007;
    wire _5011;
    wire _5014;
    wire [7:0] _5015;
    wire [7:0] _5016;
    wire [7:0] _216;
    reg [7:0] _2495;
    wire _2496;
    wire _2492;
    wire _2497;
    wire _2604;
    wire [1:0] _5076;
    wire _2661;
    wire [1:0] _5078;
    wire _4558;
    wire [1:0] _5085;
    wire _2923;
    wire [1:0] _5091;
    wire _2705;
    wire _2706;
    wire [1:0] _5093;
    wire [1:0] _217;
    reg [1:0] g_mode;
    wire _2523;
    wire _3017;
    wire [1:0] _5094;
    wire [1:0] _218;
    wire _5102;
    wire _5103;
    wire [4:0] _5098;
    wire _5100;
    wire _5095;
    wire _5097;
    wire _5101;
    wire _5104;
    wire [7:0] _5105;
    wire _3061;
    wire _3062;
    wire [7:0] _5106;
    wire [7:0] _219;
    reg [7:0] _2255;
    wire _2256;
    wire _2879;
    wire _2880;
    wire _2882;
    wire _2884;
    wire _2888;
    wire _2889;
    wire _2892;
    wire [1:0] _5118;
    wire [1:0] _5170;
    wire _2421;
    wire [1:0] _5172;
    wire _4143;
    wire [1:0] _5179;
    wire _2878;
    wire [1:0] _5185;
    wire [2:0] _1431;
    wire [2:0] _1430;
    wire [2:0] _1429;
    wire [2:0] _1428;
    reg [2:0] _1432;
    wire _1424;
    wire _1423;
    wire _1422;
    wire _1421;
    reg _1425;
    wire _5107;
    wire _5108;
    wire [2:0] _5110;
    wire [2:0] _220;
    wire _2462;
    wire _2463;
    wire [1:0] _5187;
    wire [1:0] _221;
    reg [1:0] g_mode_0;
    wire _2252;
    wire _2257;
    wire _2364;
    wire _2379;
    wire _2400;
    wire _2413;
    wire _2419;
    wire _2455;
    wire _3540;
    wire [5:0] _5190;
    wire _5189;
    wire [5:0] _5191;
    wire [5:0] _5192;
    wire [5:0] _222;
    reg [5:0] _1194;
    wire _2456;
    wire _3541;
    wire _223;
    wire _3578;
    wire _3580;
    wire _5193;
    wire [5:0] _5199;
    reg [5:0] _5202;
    wire [5:0] _224;
    wire _596;
    wire [7:0] _5204;
    wire [1:0] _2821;
    wire [1:0] _2819;
    wire [1:0] _2818;
    wire [1:0] _2817;
    wire [1:0] _2816;
    reg [1:0] _2820;
    wire [1:0] _2822;
    reg [7:0] _5216;
    wire [7:0] _5217;
    wire [7:0] _225;
    reg [7:0] _589;
    wire _590;
    wire [7:0] _5228;
    wire [7:0] _5227;
    wire [7:0] _5226;
    wire [1:0] _5223;
    wire [111:0] _712;
    wire [1:0] _5221;
    wire [111:0] _706;
    wire [1:0] _5220;
    wire [1:0] _5219;
    wire [1:0] _5218;
    reg [1:0] _5222;
    wire [1:0] _5224;
    reg [7:0] _5229;
    wire [7:0] _5230;
    wire [7:0] _226;
    reg [7:0] _584;
    wire _586;
    wire [3:0] _817;
    reg _818;
    wire _820;
    wire [15:0] _812;
    wire _814;
    wire [15:0] _803;
    wire [16:0] _804;
    wire [16:0] _805;
    reg [16:0] _808;
    wire _809;
    wire _810;
    wire [15:0] _799;
    wire _801;
    wire [2:0] _544;
    wire [2:0] _5245;
    wire _5241;
    wire _5242;
    wire _5239;
    wire _5243;
    wire [2:0] _5246;
    wire _5236;
    wire _5237;
    wire _5235;
    wire _5238;
    wire [2:0] _5248;
    wire _5232;
    wire [2:0] _5234;
    wire _5231;
    wire [2:0] _5249;
    wire [2:0] _227;
    reg [2:0] _540;
    wire _542;
    wire [2:0] _545;
    wire _535;
    wire _536;
    wire _534;
    wire _537;
    wire [2:0] _547;
    wire _531;
    wire _532;
    wire [2:0] _548;
    wire _783;
    wire [2:0] _785;
    wire [2:0] _523;
    wire [2:0] _5264;
    wire _5260;
    wire _5261;
    wire _5258;
    wire _5262;
    wire [2:0] _5265;
    wire _5255;
    wire _5256;
    wire _5254;
    wire _5257;
    wire [2:0] _5267;
    wire _5251;
    wire [2:0] _5253;
    wire _5250;
    wire [2:0] _5268;
    wire [2:0] _228;
    reg [2:0] _519;
    wire _521;
    wire [2:0] _524;
    wire _514;
    wire _515;
    wire _513;
    wire _516;
    wire [2:0] _526;
    wire _510;
    wire _511;
    wire [2:0] _527;
    wire _780;
    wire [2:0] _782;
    wire _786;
    wire [2:0] _787;
    wire [2:0] _500;
    wire [2:0] _5283;
    wire _5279;
    wire _5280;
    wire _5277;
    wire _5281;
    wire [2:0] _5284;
    wire _5274;
    wire _5275;
    wire _5273;
    wire _5276;
    wire [2:0] _5286;
    wire _5270;
    wire [2:0] _5272;
    wire _5269;
    wire [2:0] _5287;
    wire [2:0] _229;
    reg [2:0] _496;
    wire _498;
    wire [2:0] _501;
    wire _491;
    wire _492;
    wire _490;
    wire _493;
    wire [2:0] _503;
    wire _487;
    wire _488;
    wire [2:0] _504;
    wire _775;
    wire [2:0] _777;
    wire [2:0] _479;
    wire [2:0] _5302;
    wire _5298;
    wire _5299;
    wire _5296;
    wire _5300;
    wire [2:0] _5303;
    wire _5293;
    wire _5294;
    wire _5292;
    wire _5295;
    wire [2:0] _5305;
    wire _5289;
    wire [2:0] _5291;
    wire _5288;
    wire [2:0] _5306;
    wire [2:0] _230;
    reg [2:0] _475;
    wire _477;
    wire [2:0] _480;
    wire _470;
    wire _471;
    wire _469;
    wire _472;
    wire [2:0] _482;
    wire _466;
    wire _467;
    wire [2:0] _483;
    wire _772;
    wire [2:0] _774;
    wire _778;
    wire [2:0] _779;
    wire _788;
    wire [2:0] _789;
    wire [2:0] _454;
    wire [2:0] _5321;
    wire _5317;
    wire _5318;
    wire _5315;
    wire _5319;
    wire [2:0] _5322;
    wire _5312;
    wire _5313;
    wire _5311;
    wire _5314;
    wire [2:0] _5324;
    wire _5308;
    wire [2:0] _5310;
    wire _5307;
    wire [2:0] _5325;
    wire [2:0] _231;
    reg [2:0] _450;
    wire _452;
    wire [2:0] _455;
    wire _445;
    wire _446;
    wire _444;
    wire _447;
    wire [2:0] _457;
    wire _441;
    wire _442;
    wire [2:0] _458;
    wire _765;
    wire [2:0] _767;
    wire [2:0] _433;
    wire [2:0] _5340;
    wire _5336;
    wire _5337;
    wire _5334;
    wire _5338;
    wire [2:0] _5341;
    wire _5331;
    wire _5332;
    wire _5330;
    wire _5333;
    wire [2:0] _5343;
    wire _5327;
    wire [2:0] _5329;
    wire _5326;
    wire [2:0] _5344;
    wire [2:0] _232;
    reg [2:0] _429;
    wire _431;
    wire [2:0] _434;
    wire _424;
    wire _425;
    wire _423;
    wire _426;
    wire [2:0] _436;
    wire _420;
    wire _421;
    wire [2:0] _437;
    wire _762;
    wire [2:0] _764;
    wire _768;
    wire [2:0] _769;
    wire [2:0] _410;
    wire [2:0] _5359;
    wire _5355;
    wire _5356;
    wire _5353;
    wire _5357;
    wire [2:0] _5360;
    wire _5350;
    wire _5351;
    wire _5349;
    wire _5352;
    wire [2:0] _5362;
    wire _5346;
    wire [2:0] _5348;
    wire _5345;
    wire [2:0] _5363;
    wire [2:0] _233;
    reg [2:0] _406;
    wire _408;
    wire [2:0] _411;
    wire _401;
    wire _402;
    wire _400;
    wire _403;
    wire [2:0] _413;
    wire _397;
    wire _398;
    wire [2:0] _414;
    wire _757;
    wire [2:0] _759;
    wire [2:0] _389;
    wire [2:0] _5378;
    wire _5374;
    wire _5375;
    wire _5372;
    wire _5376;
    wire [2:0] _5379;
    wire _5369;
    wire _5370;
    wire _5368;
    wire _5371;
    wire [2:0] _5381;
    wire _5365;
    wire [2:0] _5367;
    wire _5364;
    wire [2:0] _5382;
    wire [2:0] _234;
    reg [2:0] _385;
    wire _387;
    wire [2:0] _390;
    wire _380;
    wire _381;
    wire _379;
    wire _382;
    wire [2:0] _392;
    wire _376;
    wire _377;
    wire [2:0] _393;
    wire [7:0] _753;
    wire _754;
    wire [2:0] _756;
    wire _760;
    wire [2:0] _761;
    wire _770;
    wire [2:0] _771;
    wire _790;
    wire [2:0] _791;
    wire [16:0] _792;
    wire _5385;
    wire [127:0] _5386;
    wire _5383;
    wire [127:0] _5387;
    wire [127:0] _235;
    reg [127:0] _298;
    wire _365;
    wire _366;
    wire [127:0] _367;
    wire _5390;
    wire [127:0] _5391;
    wire _5388;
    wire [127:0] _5392;
    wire [127:0] _236;
    reg [127:0] _295;
    wire _361;
    wire _362;
    wire [127:0] _363;
    wire _5395;
    wire [127:0] _5396;
    wire _5393;
    wire [127:0] _5397;
    wire [127:0] _237;
    reg [127:0] _292;
    wire _357;
    wire _358;
    wire [127:0] _359;
    wire _353;
    wire _354;
    wire [127:0] _355;
    wire [511:0] _368;
    wire [111:0] _749;
    wire [15:0] _750;
    wire [16:0] _751;
    wire [16:0] _793;
    reg [16:0] _796;
    wire gnd;
    wire [16:0] _748;
    wire _797;
    wire _798;
    wire _802;
    wire _811;
    wire [15:0] _5425;
    wire _5421;
    wire _5422;
    wire _5423;
    wire [15:0] _5426;
    wire _5405;
    wire _5406;
    wire [15:0] _5428;
    wire [15:0] _5430;
    wire [15:0] _238;
    reg [15:0] _341;
    wire [15:0] _5442;
    wire _5438;
    wire _5439;
    wire [8:0] _5417;
    wire _5418;
    wire [5:0] _5415;
    wire [5:0] _5414;
    wire _5416;
    wire [8:0] _5409;
    wire [8:0] _5431;
    wire [8:0] _5432;
    wire [8:0] _5434;
    wire [8:0] _239;
    reg [8:0] _5410;
    wire [2:0] _5411;
    wire _5413;
    wire [1:0] _5407;
    reg _5419;
    wire _5440;
    wire [15:0] _5443;
    wire _5435;
    wire _5436;
    wire [15:0] _5445;
    wire [15:0] _5447;
    wire [15:0] _240;
    reg [15:0] _338;
    wire [1:0] _744;
    reg [15:0] _745;
    wire _747;
    wire _815;
    reg [7:0] _323;
    wire [7:0] f_chg_now;
    wire _5449;
    wire [7:0] _5451;
    wire _5448;
    wire [7:0] _5452;
    wire [7:0] _5454;
    wire [7:0] _241;
    reg [7:0] _320;
    wire [7:0] f_changed_all;
    wire [7:0] _738;
    wire _740;
    wire _741;
    wire [7:0] f_chgmask1;
    wire _737;
    wire _742;
    wire [7:0] _731;
    wire [7:0] _729;
    wire [7:0] _243;
    reg [7:0] _304;
    reg [7:0] _307;
    wire [7:0] _730;
    wire [7:0] _732;
    wire _734;
    wire [111:0] _700;
    wire f_valid1;
    wire _735;
    wire _743;
    wire _816;
    wire _821;
    wire _860;
    wire _861;
    wire _865;
    wire f_fire1;
    wire [1:0] _1009;
    wire [1:0] f_winner;
    reg [2:0] _5402;
    wire [2:0] _5404;
    wire _5455;
    wire _1392;
    wire f_in_fetch;
    wire _1393;
    wire _1394;
    wire _5456;
    wire [15:0] _5465;
    wire [15:0] _5467;
    wire [15:0] _244;
    reg [15:0] _335;
    wire [1:0] _1603;
    reg [15:0] _1604;
    wire [15:0] _1602;
    wire _1605;
    wire [63:0] _695;
    wire _1600;
    wire _1598;
    wire _1599;
    wire _1601;
    wire _1606;
    wire _1611;
    wire _1633;
    wire f_viol_now;
    wire [2:0] _5473;
    wire [2:0] _5476;
    wire _5469;
    wire [2:0] _5477;
    wire _5468;
    wire [2:0] _5480;
    wire [2:0] _5482;
    wire [2:0] _245;
    reg [2:0] _351;
    wire _5485;
    wire [127:0] _5486;
    wire _5483;
    wire [127:0] _5487;
    wire [127:0] _246;
    reg [127:0] _289;
    wire [511:0] _299;
    wire [111:0] _300;
    wire f_valid0;
    wire _314;
    wire _331;
    wire _580;
    wire _640;
    wire _684;
    wire f_in_eval;
    wire _685;
    wire _694;
    wire f_fire0;
    wire _1095;
    wire _1096;
    wire _1191;
    wire [1:0] _5719;
    wire _5704;
    wire [1:0] _5706;
    wire _5702;
    wire [1:0] _5720;
    wire _5701;
    wire [1:0] _5723;
    wire _5490;
    wire _5489;
    wire _5491;
    wire _5492;
    wire _247;
    reg _1390;
    wire [1:0] _5725;
    wire [7:0] _5499;
    wire [7:0] _5500;
    wire [7:0] _248;
    reg [7:0] _5495;
    wire [7:0] _5507;
    wire [7:0] _5508;
    wire [7:0] _249;
    reg [7:0] _5503;
    wire [7:0] _5515;
    wire [7:0] _5516;
    wire [7:0] _250;
    reg [7:0] _5511;
    wire [7:0] _5523;
    wire [7:0] _5524;
    wire [7:0] _251;
    reg [7:0] _5519;
    wire [31:0] _5690;
    wire [31:0] _5688;
    wire [31:0] _5639;
    wire [30:0] _5637;
    wire [31:0] _5638;
    wire [31:0] _5640;
    wire [30:0] _5634;
    wire [31:0] _5635;
    wire [30:0] _5627;
    wire [31:0] _5628;
    wire [31:0] _5630;
    wire [30:0] _5624;
    wire [31:0] _5625;
    wire [30:0] _5617;
    wire [31:0] _5618;
    wire [31:0] _5620;
    wire [30:0] _5614;
    wire [31:0] _5615;
    wire [30:0] _5607;
    wire [31:0] _5608;
    wire [31:0] _5610;
    wire [30:0] _5604;
    wire [31:0] _5605;
    wire [30:0] _5597;
    wire [31:0] _5598;
    wire [31:0] _5600;
    wire [30:0] _5594;
    wire [31:0] _5595;
    wire [30:0] _5587;
    wire [31:0] _5588;
    wire [31:0] _5590;
    wire [30:0] _5584;
    wire [31:0] _5585;
    wire [30:0] _5577;
    wire [31:0] _5578;
    wire [31:0] _5580;
    wire [30:0] _5574;
    wire [31:0] _5575;
    wire [30:0] _5567;
    wire [31:0] _5568;
    wire [31:0] _5570;
    wire [30:0] _5564;
    wire [31:0] _5565;
    wire [7:0] _5558;
    wire [7:0] _5557;
    wire [7:0] _5556;
    wire [7:0] _5555;
    wire [7:0] _5554;
    wire [7:0] _5553;
    wire [7:0] _5552;
    wire [7:0] _5551;
    wire [7:0] _5550;
    wire [7:0] _5549;
    wire [7:0] _5548;
    wire [7:0] _5547;
    wire [7:0] _5546;
    wire [7:0] _5545;
    wire [7:0] _5544;
    wire [127:0] _253;
    wire [7:0] _5543;
    wire [12:0] _5540;
    wire [12:0] _5541;
    wire [3:0] _5542;
    reg [7:0] _5559;
    wire [31:0] _5560;
    wire _5537;
    wire _5538;
    wire [31:0] _5642;
    wire [31:0] _5535;
    wire [31:0] _5643;
    wire [31:0] _254;
    reg [31:0] _5533;
    wire [31:0] _5561;
    wire _5562;
    wire [31:0] _5571;
    wire _5572;
    wire [31:0] _5581;
    wire _5582;
    wire [31:0] _5591;
    wire _5592;
    wire [31:0] _5601;
    wire _5602;
    wire [31:0] _5611;
    wire _5612;
    wire [31:0] _5621;
    wire _5622;
    wire [31:0] _5631;
    wire _5632;
    wire [31:0] _5641;
    wire [31:0] _5689;
    wire f_sw_match;
    wire _5692;
    wire _5694;
    wire _1358;
    wire _1357;
    wire f_store_we;
    wire _5683;
    wire _5685;
    wire _5687;
    wire [12:0] _5676;
    wire [12:0] _5647;
    wire [12:0] _5645;
    wire [12:0] _5648;
    wire [12:0] _255;
    reg [12:0] f_sw_cnt;
    wire f_sw_last;
    wire _5679;
    wire [3:0] _5496;
    wire _5498;
    wire _5651;
    wire [3:0] _5505;
    wire [3:0] _5504;
    wire _5506;
    wire _5653;
    wire [3:0] _5513;
    wire [3:0] _5512;
    wire _5514;
    wire _5655;
    wire [3:0] _5521;
    wire [3:0] _5520;
    wire _5522;
    wire _5657;
    wire _2860;
    wire _2857;
    wire _2858;
    wire _2855;
    wire _2856;
    wire _2859;
    wire _2861;
    wire _5658;
    wire _256;
    reg _5673;
    wire [3:0] _1368;
    wire [3:0] _1367;
    wire _1369;
    wire _5661;
    wire _1346;
    wire _1347;
    wire _5662;
    wire _257;
    reg _1356;
    wire _5670;
    wire _5674;
    wire _5675;
    wire _5681;
    wire _5529;
    wire _5665;
    wire _5664;
    wire _5666;
    wire _5667;
    wire _258;
    reg _5527;
    wire _5528;
    wire _5530;
    wire _5669;
    wire _5682;
    wire _259;
    reg f_sweeping;
    wire _5695;
    wire _260;
    reg f_image_valid;
    wire _5698;
    wire [3:0] _2790;
    wire _5697;
    wire _5699;
    wire _2786;
    wire _2787;
    wire _2783;
    wire _2784;
    wire _2781;
    wire _1243;
    wire _1238;
    wire _1244;
    wire _2782;
    wire _2785;
    wire _2788;
    wire _5700;
    wire _261;
    reg _1383;
    wire _1387;
    wire [1:0] _5727;
    wire [1:0] _262;
    reg [1:0] _284;
    wire _1311;
    wire _1593;
    wire _263;
    wire [7:0] _5791;
    wire [3:0] _5788;
    reg [7:0] _5809;
    wire _5787;
    wire [7:0] _5826;
    wire [12:0] _5746;
    wire [15:0] _5748;
    wire [15:0] _5745;
    wire [2:0] _5740;
    wire _5742;
    wire _5739;
    wire _5743;
    wire [15:0] _5749;
    wire [7:0] _5735;
    wire [15:0] _5736;
    wire [7:0] _5732;
    wire [15:0] _5733;
    wire _5731;
    wire [15:0] _5734;
    wire _5729;
    wire [15:0] _5737;
    wire [15:0] _5750;
    wire [15:0] _5751;
    wire [15:0] _264;
    reg [15:0] _1331;
    wire _5786;
    wire [7:0] _5835;
    wire [2:0] _1245;
    reg [7:0] _5858;
    wire _266;
    reg _1257;
    reg _1260;
    wire [6:0] _5752;
    wire [6:0] _5753;
    wire [6:0] _267;
    reg [6:0] _1254;
    wire [7:0] _1261;
    wire _5759;
    wire [7:0] _5760;
    wire [7:0] _5761;
    wire [7:0] _5763;
    wire [7:0] _268;
    reg [7:0] _1241;
    wire _1242;
    wire [1:0] _5768;
    wire _5765;
    wire _5766;
    wire [1:0] _5769;
    wire _1231;
    wire _1232;
    wire [1:0] _5770;
    wire [1:0] _5772;
    wire [1:0] _269;
    reg [1:0] _1235;
    wire _1237;
    wire _5784;
    wire [7:0] _5859;
    wire [6:0] _5781;
    wire [7:0] _5783;
    wire [2:0] _5774;
    wire _1225;
    wire _1221;
    wire _1226;
    wire [2:0] _5775;
    wire [2:0] _5777;
    wire [2:0] _270;
    reg [2:0] _1229;
    wire _2977;
    wire [7:0] _5860;
    reg _1224;
    wire _272;
    reg _1217;
    reg _1220;
    wire _2970;
    wire _2971;
    wire _2972;
    wire [7:0] _5861;
    wire _5756;
    reg _5755;
    wire _5757;
    wire [7:0] _5865;
    wire [7:0] _273;
    reg [7:0] _5780;
    wire _5866;
    wire vdd;
    wire _275;
    wire _277;
    wire _279;
    reg _1211;
    reg _1213;
    wire _1214;
    wire _5867;
    assign _1301 = _45[11:0];
    assign _1298 = _1291 < _1288;
    assign _1299 = _1273 & _1298;
    assign _1300 = _1299 ? _1288 : _1291;
    assign _1302 = _1300 < _1301;
    assign _1303 = _1302 ? _1301 : _1300;
    assign _1304 = _1284 ? _1300 : _1303;
    assign _1290 = 12'b000000000000;
    assign _1088 = 12'b111111111111;
    assign _1085 = _1083[11:0];
    assign _1082 = 13'b0000000000000;
    assign _1079 = 10'b0000000000;
    assign _1080 = { _1079,
                     _1076 };
    assign _1081 = _1072 - _1080;
    assign _1075 = 3'b000;
    always @* begin
        case (f_winner)
        0:
            _1055 <= _654;
        1:
            _1055 <= _830;
        2:
            _1055 <= _968;
        default:
            _1055 <= _1054;
        endcase
    end
    assign _1 = _1055;
    always @(posedge _277) begin
        if (_275)
            _1076 <= _1075;
        else
            _1076 <= _1;
    end
    assign _1077 = { _1079,
                     _1076 };
    assign _1062 = 13'b1111111111111;
    assign _1061 = _1059[12:0];
    assign _1056 = 16'b0001111111111111;
    assign _1060 = _1056 < _1059;
    assign _1063 = _1060 ? _1062 : _1061;
    assign _2 = _1063;
    always @(posedge _277) begin
        if (_275)
            _1072 <= _1082;
        else
            _1072 <= _2;
    end
    assign _1078 = _1072 < _1077;
    assign _1083 = _1078 ? _1082 : _1081;
    assign _1069 = 13'b0111111111111;
    assign _1084 = _1069 < _1083;
    assign _1087 = _1084 ? _1088 : _1085;
    assign _1067 = 1'b0;
    assign _1064 = 16'b1111111111111111;
    assign _1065 = _1059 == _1064;
    assign _3 = _1065;
    always @(posedge _277) begin
        if (_275)
            _1068 <= _1067;
        else
            _1068 <= _3;
    end
    assign _1089 = _1068 ? _1088 : _1087;
    assign _4 = _1089;
    always @(posedge _277) begin
        if (_275)
            _1291 <= _1290;
        else
            _1291 <= _4;
    end
    assign _1092 = _1059[11:0];
    always @* begin
        case (f_winner)
        0:
            _1058 <= _332;
        1:
            _1058 <= _744;
        2:
            _1058 <= _882;
        default:
            _1058 <= _1057;
        endcase
    end
    always @* begin
        case (_1058)
        0:
            _1059 <= _335;
        1:
            _1059 <= _338;
        2:
            _1059 <= _341;
        default:
            _1059 <= _341;
        endcase
    end
    assign _1090 = 16'b0000111111111111;
    assign _1091 = _1090 < _1059;
    assign _1094 = _1091 ? _1088 : _1092;
    assign _5 = _1094;
    always @(posedge _277) begin
        if (_275)
            _1288 <= _1290;
        else
            _1288 <= _5;
    end
    assign _1292 = _1288 < _1291;
    assign _1293 = _1273 & _1292;
    assign _1294 = _1293 ? _1288 : _1291;
    assign _1285 = _45[23:12];
    assign _1295 = _1285 < _1294;
    assign _1296 = _1295 ? _1285 : _1294;
    assign _1283 = 8'b00000000;
    assign _1284 = _1268 == _1283;
    assign _1297 = _1284 ? _1294 : _1296;
    assign _1281 = 8'b11111111;
    assign _1280 = _1278[7:0];
    assign _1275 = 2'b10;
    assign _1274 = 2'b01;
    assign _1208 = _1204 == _1207;
    assign _1200 = _1196 & _1199;
    assign _1209 = _1200 & _1208;
    assign _6 = _1209;
    always @(posedge _277) begin
        if (_275)
            _1273 <= _1067;
        else
            _1273 <= _6;
    end
    assign _1276 = _1273 ? _1275 : _1274;
    assign _1270 = 7'b0000000;
    assign _1277 = { _1270,
                     _1276 };
    assign _1268 = _45[31:24];
    assign _1269 = { gnd,
                     _1268 };
    assign _1278 = _1269 + _1277;
    assign _1279 = _1278[8:8];
    assign _1282 = _1279 ? _1281 : _1280;
    assign _1305 = { _1282,
                     _1297,
                     _1304 };
    assign _1250 = 32'b00000000000000000000000000000000;
    assign _1262 = _1251[31:8];
    assign _1263 = { _1261,
                     _1262 };
    assign _1264 = _1248 ? _1263 : _1251;
    assign _7 = _1264;
    always @(posedge _277) begin
        if (_275)
            _1251 <= _1250;
        else
            _1251 <= _7;
    end
    assign _1306 = _1267 ? _1305 : _1251;
    assign _1322 = _1267 | f_host_cov_we;
    assign _1320 = ~ f_sweeping;
    assign _1315 = ~ _1199;
    assign _1313 = ~ _1267;
    assign _1312 = _1309 & _1311;
    assign _1314 = _1312 & _1313;
    assign _1316 = _1314 & _1315;
    assign f_host_cov_we = _1316 & _1320;
    assign _1324 = ~ f_host_cov_we;
    assign _1323 = ~ _1267;
    assign _1325 = _1323 & _1324;
    assign _11 = _1207;
    always @(posedge _277) begin
        if (_275)
            _1343 <= _1283;
        else
            _1343 <= _11;
    end
    assign _1335 = _1331[9:2];
    assign _1336 = _1334 ? _1335 : _1328;
    assign _1337 = _1248 ? _1336 : _1328;
    assign _12 = _1337;
    always @(posedge _277) begin
        if (_275)
            _1328 <= _1283;
        else
            _1328 <= _12;
    end
    assign _1338 = _1331[9:2];
    assign _1339 = _1309 ? _1328 : _1338;
    assign _1340 = _1199 ? _1207 : _1339;
    assign _1344 = _1267 ? _1343 : _1340;
    assign _1349 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _1351 = _1350[127:8];
    assign _1352 = { _1261,
                     _1351 };
    assign _1353 = _1347 ? _1352 : _1350;
    assign _14 = _1353;
    always @(posedge _277) begin
        if (_275)
            _1350 <= _1349;
        else
            _1350 <= _14;
    end
    assign _1363 = _1362 | f_sweeping;
    assign _1378 = _351[1:0];
    assign _1379 = { _1203,
                     _1378 };
    assign _1376 = f_sw_cnt[11:4];
    assign _1370 = _1331[11:4];
    assign _1371 = _1369 ? _1370 : _1366;
    assign _1372 = _1347 ? _1371 : _1366;
    assign _18 = _1372;
    always @(posedge _277) begin
        if (_275)
            _1366 <= _1283;
        else
            _1366 <= _18;
    end
    assign _1377 = f_sweeping ? _1376 : _1366;
    assign _1360 = 3'b100;
    assign _1361 = _351 < _1360;
    assign _1362 = f_in_fetch & _1361;
    assign _1380 = _1362 ? _1379 : _1377;
    assign _1552 = _1461 & _1551;
    assign _1553 = ~ _1552;
    assign _1416 = _695[23:16];
    assign _1414 = _712[86:79];
    assign _1413 = _706[86:79];
    assign _1412 = _700[86:79];
    assign _1411 = _300[86:79];
    always @* begin
        case (f_winner)
        0:
            _1415 <= _1411;
        1:
            _1415 <= _1412;
        2:
            _1415 <= _1413;
        default:
            _1415 <= _1414;
        endcase
    end
    assign _1417 = _1393 ? _1416 : _1415;
    assign _1418 = _1417 & _1408;
    assign _1409 = ~ _1408;
    assign _1410 = f_poe & _1409;
    assign _1419 = _1410 | _1418;
    assign _1453 = _1419 | _1452;
    assign _1454 = _1398 ? _1453 : f_poe;
    assign _1456 = _1390 ? _1283 : _1454;
    assign _1458 = _1387 ? _1283 : _1456;
    assign _20 = _1458;
    always @(posedge _277) begin
        if (_275)
            f_poe <= _1283;
        else
            f_poe <= _20;
    end
    assign _1554 = f_poe & _1553;
    assign _1579 = ~ _1461;
    assign _1549 = f_lane1_out & _1543;
    assign _1548 = ~ f_lane1_out;
    assign _1546 = ~ f_lane0_out;
    assign _1547 = _1546 & _1543;
    assign _1545 = f_lane0_out & _1543;
    assign _1544 = ~ f_lane0_out;
    assign _1543 = f_pout[0:0];
    assign _1542 = _1471[2:0];
    always @* begin
        case (_1542)
        0:
            _1550 <= _1543;
        1:
            _1550 <= f_lane0_out;
        2:
            _1550 <= _1544;
        3:
            _1550 <= _1545;
        4:
            _1550 <= _1547;
        5:
            _1550 <= f_lane1_out;
        6:
            _1550 <= _1548;
        default:
            _1550 <= _1549;
        endcase
    end
    assign _1540 = f_lane1_out & _1534;
    assign _1539 = ~ f_lane1_out;
    assign _1537 = ~ f_lane0_out;
    assign _1538 = _1537 & _1534;
    assign _1536 = f_lane0_out & _1534;
    assign _1535 = ~ f_lane0_out;
    assign _1534 = f_pout[1:1];
    assign _1533 = _1471[5:3];
    always @* begin
        case (_1533)
        0:
            _1541 <= _1534;
        1:
            _1541 <= f_lane0_out;
        2:
            _1541 <= _1535;
        3:
            _1541 <= _1536;
        4:
            _1541 <= _1538;
        5:
            _1541 <= f_lane1_out;
        6:
            _1541 <= _1539;
        default:
            _1541 <= _1540;
        endcase
    end
    assign _1531 = f_lane1_out & _1525;
    assign _1530 = ~ f_lane1_out;
    assign _1528 = ~ f_lane0_out;
    assign _1529 = _1528 & _1525;
    assign _1527 = f_lane0_out & _1525;
    assign _1526 = ~ f_lane0_out;
    assign _1525 = f_pout[2:2];
    assign _1524 = _1471[8:6];
    always @* begin
        case (_1524)
        0:
            _1532 <= _1525;
        1:
            _1532 <= f_lane0_out;
        2:
            _1532 <= _1526;
        3:
            _1532 <= _1527;
        4:
            _1532 <= _1529;
        5:
            _1532 <= f_lane1_out;
        6:
            _1532 <= _1530;
        default:
            _1532 <= _1531;
        endcase
    end
    assign _1522 = f_lane1_out & _1516;
    assign _1521 = ~ f_lane1_out;
    assign _1519 = ~ f_lane0_out;
    assign _1520 = _1519 & _1516;
    assign _1518 = f_lane0_out & _1516;
    assign _1517 = ~ f_lane0_out;
    assign _1516 = f_pout[3:3];
    assign _1515 = _1471[11:9];
    always @* begin
        case (_1515)
        0:
            _1523 <= _1516;
        1:
            _1523 <= f_lane0_out;
        2:
            _1523 <= _1517;
        3:
            _1523 <= _1518;
        4:
            _1523 <= _1520;
        5:
            _1523 <= f_lane1_out;
        6:
            _1523 <= _1521;
        default:
            _1523 <= _1522;
        endcase
    end
    assign _1513 = f_lane1_out & _1507;
    assign _1512 = ~ f_lane1_out;
    assign _1510 = ~ f_lane0_out;
    assign _1511 = _1510 & _1507;
    assign _1509 = f_lane0_out & _1507;
    assign _1508 = ~ f_lane0_out;
    assign _1507 = f_pout[4:4];
    assign _1506 = _1471[14:12];
    always @* begin
        case (_1506)
        0:
            _1514 <= _1507;
        1:
            _1514 <= f_lane0_out;
        2:
            _1514 <= _1508;
        3:
            _1514 <= _1509;
        4:
            _1514 <= _1511;
        5:
            _1514 <= f_lane1_out;
        6:
            _1514 <= _1512;
        default:
            _1514 <= _1513;
        endcase
    end
    assign _1504 = f_lane1_out & _1498;
    assign _1503 = ~ f_lane1_out;
    assign _1501 = ~ f_lane0_out;
    assign _1502 = _1501 & _1498;
    assign _1500 = f_lane0_out & _1498;
    assign _1499 = ~ f_lane0_out;
    assign _1498 = f_pout[5:5];
    assign _1497 = _1471[17:15];
    always @* begin
        case (_1497)
        0:
            _1505 <= _1498;
        1:
            _1505 <= f_lane0_out;
        2:
            _1505 <= _1499;
        3:
            _1505 <= _1500;
        4:
            _1505 <= _1502;
        5:
            _1505 <= f_lane1_out;
        6:
            _1505 <= _1503;
        default:
            _1505 <= _1504;
        endcase
    end
    assign _1495 = f_lane1_out & _1489;
    assign _1494 = ~ f_lane1_out;
    assign _1492 = ~ f_lane0_out;
    assign _1493 = _1492 & _1489;
    assign _1491 = f_lane0_out & _1489;
    assign _1490 = ~ f_lane0_out;
    assign _1489 = f_pout[6:6];
    assign _1488 = _1471[20:18];
    always @* begin
        case (_1488)
        0:
            _1496 <= _1489;
        1:
            _1496 <= f_lane0_out;
        2:
            _1496 <= _1490;
        3:
            _1496 <= _1491;
        4:
            _1496 <= _1493;
        5:
            _1496 <= f_lane1_out;
        6:
            _1496 <= _1494;
        default:
            _1496 <= _1495;
        endcase
    end
    assign _1486 = f_lane1_out & _1476;
    assign _1485 = ~ f_lane1_out;
    assign _1481 = ~ f_lane0_out;
    assign _1482 = _1481 & _1476;
    assign _1480 = f_lane0_out & _1476;
    assign _1479 = ~ f_lane0_out;
    assign _1571 = { _1569,
                     _1568 };
    assign _1568 = _589[0:0];
    assign _1569 = { _1568,
                     _1568 };
    assign _1570 = { _1569,
                     _1569 };
    assign _1572 = { _1570,
                     _1571 };
    assign _1573 = { _1572,
                     _1568 };
    assign _1574 = _1573 & _1452;
    assign _1450 = _1446 & _1444;
    assign _1449 = _1446 & _1442;
    assign _1448 = _1446 & _1439;
    assign _1446 = ~ _1433;
    assign _1447 = _1446 & _1436;
    assign _1444 = _1441 & _1438;
    assign _1445 = _1433 & _1444;
    assign _1441 = ~ _1434;
    assign _1442 = _1441 & _1435;
    assign _1443 = _1433 & _1442;
    assign _1438 = ~ _1435;
    assign _1439 = _1434 & _1438;
    assign _1440 = _1433 & _1439;
    assign _1435 = _1432[0:0];
    assign _1434 = _1432[1:1];
    assign _1436 = _1434 & _1435;
    assign _1433 = _1432[2:2];
    assign _1437 = _1433 & _1436;
    assign _1451 = { _1437,
                     _1440,
                     _1443,
                     _1445,
                     _1447,
                     _1448,
                     _1449,
                     _1450 };
    assign _1420 = ~ _1393;
    assign _1426 = _1420 & _1425;
    assign _1452 = _1426 ? _1451 : _1283;
    assign _1566 = ~ _1452;
    assign _1562 = _695[15:8];
    assign _1560 = _712[78:71];
    assign _1559 = _706[78:71];
    assign _1558 = _700[78:71];
    assign _1557 = _300[78:71];
    always @* begin
        case (f_winner)
        0:
            _1561 <= _1557;
        1:
            _1561 <= _1558;
        2:
            _1561 <= _1559;
        default:
            _1561 <= _1560;
        endcase
    end
    assign _1563 = _1393 ? _1562 : _1561;
    assign _1564 = _1563 & _1408;
    assign _1407 = _695[7:0];
    assign _1405 = _712[70:63];
    assign _1404 = _706[70:63];
    assign _1403 = _700[70:63];
    assign _1402 = _300[70:63];
    always @* begin
        case (f_winner)
        0:
            _1406 <= _1402;
        1:
            _1406 <= _1403;
        2:
            _1406 <= _1404;
        default:
            _1406 <= _1405;
        endcase
    end
    assign _1408 = _1393 ? _1407 : _1406;
    assign _1555 = ~ _1408;
    assign _1556 = f_pout & _1555;
    assign _1565 = _1556 | _1564;
    assign _1567 = _1565 & _1566;
    assign _1575 = _1567 | _1574;
    assign _1395 = 2'b00;
    assign _1396 = _643 == _1395;
    assign _1397 = _1396 | _645;
    assign _1398 = _1394 & _1397;
    assign _1576 = _1398 ? _1575 : f_pout;
    assign _1578 = _1387 ? _1283 : _1576;
    assign _22 = _1578;
    always @(posedge _277) begin
        if (_275)
            f_pout <= _1283;
        else
            f_pout <= _22;
    end
    assign _1476 = f_pout[7:7];
    assign _1471 = { _1464,
                     _1467,
                     _1470 };
    assign _1472 = _1471[23:21];
    always @* begin
        case (_1472)
        0:
            _1487 <= _1476;
        1:
            _1487 <= f_lane0_out;
        2:
            _1487 <= _1479;
        3:
            _1487 <= _1480;
        4:
            _1487 <= _1482;
        5:
            _1487 <= f_lane1_out;
        6:
            _1487 <= _1485;
        default:
            _1487 <= _1486;
        endcase
    end
    assign _1551 = { _1487,
                     _1496,
                     _1505,
                     _1514,
                     _1523,
                     _1532,
                     _1541,
                     _1550 };
    assign _1580 = _1551 & _1579;
    always @(posedge _277) begin
        if (_275)
            _1624 <= _1395;
        else
            _1624 <= _1621;
    end
    assign _1631 = { _1624,
                     _1627,
                     _1630 };
    always @(posedge _277) begin
        if (_275)
            _1590 <= _1067;
        else
            _1590 <= _1191;
    end
    assign _1597 = { _1590,
                     _1592,
                     _1593,
                     _1596 };
    always @(posedge _277) begin
        if (_275)
            _1586 <= _1395;
        else
            _1586 <= f_winner;
    end
    assign _1583 = _1203[5:4];
    assign _1587 = { _1583,
                     _1586 };
    assign _1582 = _1203[3:0];
    assign _1581 = _1194[5:4];
    always @* begin
        case (_1581)
        0:
            _1632 <= _1582;
        1:
            _1632 <= _1587;
        2:
            _1632 <= _1597;
        default:
            _1632 <= _1631;
        endcase
    end
    always @(posedge _277) begin
        if (_275)
            _1637 <= _1067;
        else
            _1637 <= f_viol_now;
    end
    assign _5863 = ~ _89;
    assign _5862 = ~ _90;
    assign _5864 = { _263,
                     _101,
                     _99,
                     _91,
                     _5862,
                     _5863,
                     _88,
                     _87 };
    assign _1876 = 5'b11111;
    assign _1877 = _1671 == _1876;
    assign _1878 = _1668 & _1877;
    always @(posedge _277) begin
        if (_275)
            _1879 <= _1283;
        else
            if (_1878)
                _1879 <= _142;
    end
    assign _1870 = 5'b11110;
    assign _1871 = _1671 == _1870;
    assign _1872 = _1668 & _1871;
    always @(posedge _277) begin
        if (_275)
            _1873 <= _1283;
        else
            if (_1872)
                _1873 <= _142;
    end
    assign _1864 = 5'b11101;
    assign _1865 = _1671 == _1864;
    assign _1866 = _1668 & _1865;
    always @(posedge _277) begin
        if (_275)
            _1867 <= _1283;
        else
            if (_1866)
                _1867 <= _142;
    end
    assign _1858 = 5'b11100;
    assign _1859 = _1671 == _1858;
    assign _1860 = _1668 & _1859;
    always @(posedge _277) begin
        if (_275)
            _1861 <= _1283;
        else
            if (_1860)
                _1861 <= _142;
    end
    assign _1852 = 5'b11011;
    assign _1853 = _1671 == _1852;
    assign _1854 = _1668 & _1853;
    always @(posedge _277) begin
        if (_275)
            _1855 <= _1283;
        else
            if (_1854)
                _1855 <= _142;
    end
    assign _1846 = 5'b11010;
    assign _1847 = _1671 == _1846;
    assign _1848 = _1668 & _1847;
    always @(posedge _277) begin
        if (_275)
            _1849 <= _1283;
        else
            if (_1848)
                _1849 <= _142;
    end
    assign _1840 = 5'b11001;
    assign _1841 = _1671 == _1840;
    assign _1842 = _1668 & _1841;
    always @(posedge _277) begin
        if (_275)
            _1843 <= _1283;
        else
            if (_1842)
                _1843 <= _142;
    end
    assign _1834 = 5'b11000;
    assign _1835 = _1671 == _1834;
    assign _1836 = _1668 & _1835;
    always @(posedge _277) begin
        if (_275)
            _1837 <= _1283;
        else
            if (_1836)
                _1837 <= _142;
    end
    assign _1828 = 5'b10111;
    assign _1829 = _1671 == _1828;
    assign _1830 = _1668 & _1829;
    always @(posedge _277) begin
        if (_275)
            _1831 <= _1283;
        else
            if (_1830)
                _1831 <= _142;
    end
    assign _1822 = 5'b10110;
    assign _1823 = _1671 == _1822;
    assign _1824 = _1668 & _1823;
    always @(posedge _277) begin
        if (_275)
            _1825 <= _1283;
        else
            if (_1824)
                _1825 <= _142;
    end
    assign _1816 = 5'b10101;
    assign _1817 = _1671 == _1816;
    assign _1818 = _1668 & _1817;
    always @(posedge _277) begin
        if (_275)
            _1819 <= _1283;
        else
            if (_1818)
                _1819 <= _142;
    end
    assign _1810 = 5'b10100;
    assign _1811 = _1671 == _1810;
    assign _1812 = _1668 & _1811;
    always @(posedge _277) begin
        if (_275)
            _1813 <= _1283;
        else
            if (_1812)
                _1813 <= _142;
    end
    assign _1804 = 5'b10011;
    assign _1805 = _1671 == _1804;
    assign _1806 = _1668 & _1805;
    always @(posedge _277) begin
        if (_275)
            _1807 <= _1283;
        else
            if (_1806)
                _1807 <= _142;
    end
    assign _1798 = 5'b10010;
    assign _1799 = _1671 == _1798;
    assign _1800 = _1668 & _1799;
    always @(posedge _277) begin
        if (_275)
            _1801 <= _1283;
        else
            if (_1800)
                _1801 <= _142;
    end
    assign _1792 = 5'b10001;
    assign _1793 = _1671 == _1792;
    assign _1794 = _1668 & _1793;
    always @(posedge _277) begin
        if (_275)
            _1795 <= _1283;
        else
            if (_1794)
                _1795 <= _142;
    end
    assign _1786 = 5'b10000;
    assign _1787 = _1671 == _1786;
    assign _1788 = _1668 & _1787;
    always @(posedge _277) begin
        if (_275)
            _1789 <= _1283;
        else
            if (_1788)
                _1789 <= _142;
    end
    assign _1780 = 5'b01111;
    assign _1781 = _1671 == _1780;
    assign _1782 = _1668 & _1781;
    always @(posedge _277) begin
        if (_275)
            _1783 <= _1283;
        else
            if (_1782)
                _1783 <= _142;
    end
    assign _1774 = 5'b01110;
    assign _1775 = _1671 == _1774;
    assign _1776 = _1668 & _1775;
    always @(posedge _277) begin
        if (_275)
            _1777 <= _1283;
        else
            if (_1776)
                _1777 <= _142;
    end
    assign _1768 = 5'b01101;
    assign _1769 = _1671 == _1768;
    assign _1770 = _1668 & _1769;
    always @(posedge _277) begin
        if (_275)
            _1771 <= _1283;
        else
            if (_1770)
                _1771 <= _142;
    end
    assign _1762 = 5'b01100;
    assign _1763 = _1671 == _1762;
    assign _1764 = _1668 & _1763;
    always @(posedge _277) begin
        if (_275)
            _1765 <= _1283;
        else
            if (_1764)
                _1765 <= _142;
    end
    assign _1756 = 5'b01011;
    assign _1757 = _1671 == _1756;
    assign _1758 = _1668 & _1757;
    always @(posedge _277) begin
        if (_275)
            _1759 <= _1283;
        else
            if (_1758)
                _1759 <= _142;
    end
    assign _1750 = 5'b01010;
    assign _1751 = _1671 == _1750;
    assign _1752 = _1668 & _1751;
    always @(posedge _277) begin
        if (_275)
            _1753 <= _1283;
        else
            if (_1752)
                _1753 <= _142;
    end
    assign _1744 = 5'b01001;
    assign _1745 = _1671 == _1744;
    assign _1746 = _1668 & _1745;
    always @(posedge _277) begin
        if (_275)
            _1747 <= _1283;
        else
            if (_1746)
                _1747 <= _142;
    end
    assign _1738 = 5'b01000;
    assign _1739 = _1671 == _1738;
    assign _1740 = _1668 & _1739;
    always @(posedge _277) begin
        if (_275)
            _1741 <= _1283;
        else
            if (_1740)
                _1741 <= _142;
    end
    assign _1732 = 5'b00111;
    assign _1733 = _1671 == _1732;
    assign _1734 = _1668 & _1733;
    always @(posedge _277) begin
        if (_275)
            _1735 <= _1283;
        else
            if (_1734)
                _1735 <= _142;
    end
    assign _1726 = 5'b00110;
    assign _1727 = _1671 == _1726;
    assign _1728 = _1668 & _1727;
    always @(posedge _277) begin
        if (_275)
            _1729 <= _1283;
        else
            if (_1728)
                _1729 <= _142;
    end
    assign _1720 = 5'b00101;
    assign _1721 = _1671 == _1720;
    assign _1722 = _1668 & _1721;
    always @(posedge _277) begin
        if (_275)
            _1723 <= _1283;
        else
            if (_1722)
                _1723 <= _142;
    end
    assign _1714 = 5'b00100;
    assign _1715 = _1671 == _1714;
    assign _1716 = _1668 & _1715;
    always @(posedge _277) begin
        if (_275)
            _1717 <= _1283;
        else
            if (_1716)
                _1717 <= _142;
    end
    assign _1708 = 5'b00011;
    assign _1709 = _1671 == _1708;
    assign _1710 = _1668 & _1709;
    always @(posedge _277) begin
        if (_275)
            _1711 <= _1283;
        else
            if (_1710)
                _1711 <= _142;
    end
    assign _1702 = 5'b00010;
    assign _1703 = _1671 == _1702;
    assign _1704 = _1668 & _1703;
    always @(posedge _277) begin
        if (_275)
            _1705 <= _1283;
        else
            if (_1704)
                _1705 <= _142;
    end
    assign _1696 = 5'b00001;
    assign _1697 = _1671 == _1696;
    assign _1698 = _1668 & _1697;
    always @(posedge _277) begin
        if (_275)
            _1699 <= _1283;
        else
            if (_1698)
                _1699 <= _142;
    end
    assign _1690 = 5'b00000;
    assign _1673 = _1671 + _1696;
    assign _1674 = _1668 ? _1673 : _1671;
    assign _28 = _1674;
    always @(posedge _277) begin
        if (_275)
            _1671 <= _1690;
        else
            _1671 <= _28;
    end
    assign _1691 = _1671 == _1690;
    assign _1692 = _1668 & _1691;
    always @(posedge _277) begin
        if (_275)
            _1693 <= _1283;
        else
            if (_1692)
                _1693 <= _142;
    end
    assign _1686 = _1684 + _1696;
    assign _1687 = _1681 ? _1686 : _1684;
    assign _29 = _1687;
    always @(posedge _277) begin
        if (_275)
            _1684 <= _1690;
        else
            _1684 <= _29;
    end
    always @* begin
        case (_1684)
        0:
            _1880 <= _1693;
        1:
            _1880 <= _1699;
        2:
            _1880 <= _1705;
        3:
            _1880 <= _1711;
        4:
            _1880 <= _1717;
        5:
            _1880 <= _1723;
        6:
            _1880 <= _1729;
        7:
            _1880 <= _1735;
        8:
            _1880 <= _1741;
        9:
            _1880 <= _1747;
        10:
            _1880 <= _1753;
        11:
            _1880 <= _1759;
        12:
            _1880 <= _1765;
        13:
            _1880 <= _1771;
        14:
            _1880 <= _1777;
        15:
            _1880 <= _1783;
        16:
            _1880 <= _1789;
        17:
            _1880 <= _1795;
        18:
            _1880 <= _1801;
        19:
            _1880 <= _1807;
        20:
            _1880 <= _1813;
        21:
            _1880 <= _1819;
        22:
            _1880 <= _1825;
        23:
            _1880 <= _1831;
        24:
            _1880 <= _1837;
        25:
            _1880 <= _1843;
        26:
            _1880 <= _1849;
        27:
            _1880 <= _1855;
        28:
            _1880 <= _1861;
        29:
            _1880 <= _1867;
        30:
            _1880 <= _1873;
        default:
            _1880 <= _1879;
        endcase
    end
    assign _30 = _1880;
    assign _5855 = _90 ? _1283 : _30;
    assign _5849 = _43[47:40];
    assign _5848 = _43[39:32];
    assign _5847 = _43[31:24];
    assign _5846 = _43[23:16];
    assign _5845 = _43[15:8];
    assign _2239 = 3'b111;
    assign _2240 = _1887 == _2239;
    assign _2241 = _1884 & _2240;
    assign _2238 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _277) begin
        if (_275)
            _2242 <= _2238;
        else
            if (_2241)
                _2242 <= _41;
    end
    assign _2233 = 3'b110;
    assign _2234 = _1887 == _2233;
    assign _2235 = _1884 & _2234;
    always @(posedge _277) begin
        if (_275)
            _2236 <= _2238;
        else
            if (_2235)
                _2236 <= _41;
    end
    assign _2227 = 3'b101;
    assign _2228 = _1887 == _2227;
    assign _2229 = _1884 & _2228;
    always @(posedge _277) begin
        if (_275)
            _2230 <= _2238;
        else
            if (_2229)
                _2230 <= _41;
    end
    assign _2222 = _1887 == _1360;
    assign _2223 = _1884 & _2222;
    always @(posedge _277) begin
        if (_275)
            _2224 <= _2238;
        else
            if (_2223)
                _2224 <= _41;
    end
    assign _2215 = 3'b011;
    assign _2216 = _1887 == _2215;
    assign _2217 = _1884 & _2216;
    always @(posedge _277) begin
        if (_275)
            _2218 <= _2238;
        else
            if (_2217)
                _2218 <= _41;
    end
    assign _2209 = 3'b010;
    assign _2210 = _1887 == _2209;
    assign _2211 = _1884 & _2210;
    always @(posedge _277) begin
        if (_275)
            _2212 <= _2238;
        else
            if (_2211)
                _2212 <= _41;
    end
    assign _2203 = 3'b001;
    assign _2204 = _1887 == _2203;
    assign _2205 = _1884 & _2204;
    always @(posedge _277) begin
        if (_275)
            _2206 <= _2238;
        else
            if (_2205)
                _2206 <= _41;
    end
    assign _1889 = _1887 + _2203;
    assign _1890 = _1884 ? _1889 : _1887;
    assign _31 = _1890;
    always @(posedge _277) begin
        if (_275)
            _1887 <= _1075;
        else
            _1887 <= _31;
    end
    assign _2198 = _1887 == _1075;
    assign _2199 = _1884 & _2198;
    assign _1619 = { _1611,
                     f_unexp_now };
    assign _1621 = f_amb_now ? _1395 : _1619;
    assign _2181 = _2072 - _2177;
    assign _1898 = 29'b11111111111111111111111111111;
    assign _1897 = 29'b00000000000000000000000000000;
    assign _1900 = 29'b00000000000000000000000000001;
    assign _1901 = ts_hi_m1 + _1900;
    assign _1894 = ts_reg[2:0];
    assign _1896 = _1894 == _2239;
    assign _1902 = _1896 ? _1901 : ts_hi_m1;
    assign _32 = _1902;
    always @(posedge _277) begin
        if (_275)
            ts_hi_m1 <= _1898;
        else
            ts_hi_m1 <= _32;
    end
    assign _2179 = ts_reg[31:3];
    assign _1920 = _1907 + _2203;
    assign _1916 = _1907 == _2239;
    assign _1917 = ~ _1916;
    assign _1914 = _688[0:0];
    assign _1918 = _1914 & _1917;
    assign _1921 = _1918 ? _1920 : _1907;
    assign _1911 = _688[0:0];
    assign _1912 = ~ _1911;
    assign _1909 = _320[0:0];
    assign _1908 = f_chg_now[0:0];
    assign _1910 = _1908 & _1909;
    assign _1913 = _1910 & _1912;
    assign _1923 = _1913 ? _2203 : _1921;
    assign _1904 = _284 == _1274;
    assign _1924 = _1904 ? _1923 : _1907;
    assign _33 = _1924;
    always @(posedge _277) begin
        if (_275)
            _1907 <= _1075;
        else
            _1907 <= _33;
    end
    assign _2170 = _688[0:0];
    assign _2172 = _2170 ? _1907 : _1075;
    assign _1941 = _1928 + _2203;
    assign _1937 = _1928 == _2239;
    assign _1938 = ~ _1937;
    assign _1935 = _688[1:1];
    assign _1939 = _1935 & _1938;
    assign _1942 = _1939 ? _1941 : _1928;
    assign _1932 = _688[1:1];
    assign _1933 = ~ _1932;
    assign _1930 = _320[1:1];
    assign _1929 = f_chg_now[1:1];
    assign _1931 = _1929 & _1930;
    assign _1934 = _1931 & _1933;
    assign _1944 = _1934 ? _2203 : _1942;
    assign _1925 = _284 == _1274;
    assign _1945 = _1925 ? _1944 : _1928;
    assign _34 = _1945;
    always @(posedge _277) begin
        if (_275)
            _1928 <= _1075;
        else
            _1928 <= _34;
    end
    assign _2167 = _688[1:1];
    assign _2169 = _2167 ? _1928 : _1075;
    assign _2173 = _2129 ? _2172 : _2169;
    assign _1962 = _1949 + _2203;
    assign _1958 = _1949 == _2239;
    assign _1959 = ~ _1958;
    assign _1956 = _688[2:2];
    assign _1960 = _1956 & _1959;
    assign _1963 = _1960 ? _1962 : _1949;
    assign _1953 = _688[2:2];
    assign _1954 = ~ _1953;
    assign _1951 = _320[2:2];
    assign _1950 = f_chg_now[2:2];
    assign _1952 = _1950 & _1951;
    assign _1955 = _1952 & _1954;
    assign _1965 = _1955 ? _2203 : _1963;
    assign _1946 = _284 == _1274;
    assign _1966 = _1946 ? _1965 : _1949;
    assign _35 = _1966;
    always @(posedge _277) begin
        if (_275)
            _1949 <= _1075;
        else
            _1949 <= _35;
    end
    assign _2163 = _688[2:2];
    assign _2165 = _2163 ? _1949 : _1075;
    assign _1983 = _1970 + _2203;
    assign _1979 = _1970 == _2239;
    assign _1980 = ~ _1979;
    assign _1977 = _688[3:3];
    assign _1981 = _1977 & _1980;
    assign _1984 = _1981 ? _1983 : _1970;
    assign _1974 = _688[3:3];
    assign _1975 = ~ _1974;
    assign _1972 = _320[3:3];
    assign _1971 = f_chg_now[3:3];
    assign _1973 = _1971 & _1972;
    assign _1976 = _1973 & _1975;
    assign _1986 = _1976 ? _2203 : _1984;
    assign _1967 = _284 == _1274;
    assign _1987 = _1967 ? _1986 : _1970;
    assign _36 = _1987;
    always @(posedge _277) begin
        if (_275)
            _1970 <= _1075;
        else
            _1970 <= _36;
    end
    assign _2160 = _688[3:3];
    assign _2162 = _2160 ? _1970 : _1075;
    assign _2166 = _2132 ? _2165 : _2162;
    assign _2174 = _2131 ? _2173 : _2166;
    assign _2004 = _1991 + _2203;
    assign _2000 = _1991 == _2239;
    assign _2001 = ~ _2000;
    assign _1998 = _688[4:4];
    assign _2002 = _1998 & _2001;
    assign _2005 = _2002 ? _2004 : _1991;
    assign _1995 = _688[4:4];
    assign _1996 = ~ _1995;
    assign _1993 = _320[4:4];
    assign _1992 = f_chg_now[4:4];
    assign _1994 = _1992 & _1993;
    assign _1997 = _1994 & _1996;
    assign _2007 = _1997 ? _2203 : _2005;
    assign _1988 = _284 == _1274;
    assign _2008 = _1988 ? _2007 : _1991;
    assign _37 = _2008;
    always @(posedge _277) begin
        if (_275)
            _1991 <= _1075;
        else
            _1991 <= _37;
    end
    assign _2155 = _688[4:4];
    assign _2157 = _2155 ? _1991 : _1075;
    assign _2025 = _2012 + _2203;
    assign _2021 = _2012 == _2239;
    assign _2022 = ~ _2021;
    assign _2019 = _688[5:5];
    assign _2023 = _2019 & _2022;
    assign _2026 = _2023 ? _2025 : _2012;
    assign _2016 = _688[5:5];
    assign _2017 = ~ _2016;
    assign _2014 = _320[5:5];
    assign _2013 = f_chg_now[5:5];
    assign _2015 = _2013 & _2014;
    assign _2018 = _2015 & _2017;
    assign _2028 = _2018 ? _2203 : _2026;
    assign _2009 = _284 == _1274;
    assign _2029 = _2009 ? _2028 : _2012;
    assign _38 = _2029;
    always @(posedge _277) begin
        if (_275)
            _2012 <= _1075;
        else
            _2012 <= _38;
    end
    assign _2152 = _688[5:5];
    assign _2154 = _2152 ? _2012 : _1075;
    assign _2158 = _2136 ? _2157 : _2154;
    assign _2046 = _2033 + _2203;
    assign _2042 = _2033 == _2239;
    assign _2043 = ~ _2042;
    assign _2040 = _688[6:6];
    assign _2044 = _2040 & _2043;
    assign _2047 = _2044 ? _2046 : _2033;
    assign _2037 = _688[6:6];
    assign _2038 = ~ _2037;
    assign _2035 = _320[6:6];
    assign _2034 = f_chg_now[6:6];
    assign _2036 = _2034 & _2035;
    assign _2039 = _2036 & _2038;
    assign _2049 = _2039 ? _2203 : _2047;
    assign _2030 = _284 == _1274;
    assign _2050 = _2030 ? _2049 : _2033;
    assign _39 = _2050;
    always @(posedge _277) begin
        if (_275)
            _2033 <= _1075;
        else
            _2033 <= _39;
    end
    assign _2148 = _688[6:6];
    assign _2150 = _2148 ? _2033 : _1075;
    assign _2067 = _2054 + _2203;
    assign _2063 = _2054 == _2239;
    assign _2064 = ~ _2063;
    assign _2061 = _688[7:7];
    assign _2065 = _2061 & _2064;
    assign _2068 = _2065 ? _2067 : _2054;
    assign _2058 = _688[7:7];
    assign _2059 = ~ _2058;
    assign _2056 = _320[7:7];
    assign _2055 = f_chg_now[7:7];
    assign _2057 = _2055 & _2056;
    assign _2060 = _2057 & _2059;
    assign _2070 = _2060 ? _2203 : _2068;
    assign _2051 = _284 == _1274;
    assign _2071 = _2051 ? _2070 : _2054;
    assign _40 = _2071;
    always @(posedge _277) begin
        if (_275)
            _2054 <= _1075;
        else
            _2054 <= _40;
    end
    assign _2145 = _688[7:7];
    assign _2147 = _2145 ? _2054 : _1075;
    assign _2151 = _2139 ? _2150 : _2147;
    assign _2159 = _2138 ? _2158 : _2151;
    assign _2175 = _2135 ? _2174 : _2159;
    assign _2140 = _718[7:7];
    assign _2139 = _718[6:6];
    assign _2141 = _2139 | _2140;
    assign _2137 = _718[5:5];
    assign _2136 = _718[4:4];
    assign _2138 = _2136 | _2137;
    assign _2142 = _2138 | _2141;
    assign _2133 = _718[3:3];
    assign _2132 = _718[2:2];
    assign _2134 = _2132 | _2133;
    assign _2130 = _718[1:1];
    assign _2129 = _718[0:0];
    assign _2131 = _2129 | _2130;
    assign _2135 = _2131 | _2134;
    assign _2143 = _2135 | _2142;
    assign _2176 = _2143 ? _2175 : _1075;
    assign _2118 = f_watch[0:0];
    assign _2117 = _320[0:0];
    assign _2119 = _2117 & _2118;
    assign _2121 = _2119 ? _540 : _1075;
    assign _2113 = f_watch[1:1];
    assign _2112 = _320[1:1];
    assign _2114 = _2112 & _2113;
    assign _2116 = _2114 ? _519 : _1075;
    assign _2122 = _2116 < _2121;
    assign _2123 = _2122 ? _2121 : _2116;
    assign _2106 = f_watch[2:2];
    assign _2105 = _320[2:2];
    assign _2107 = _2105 & _2106;
    assign _2109 = _2107 ? _496 : _1075;
    assign _2101 = f_watch[3:3];
    assign _2100 = _320[3:3];
    assign _2102 = _2100 & _2101;
    assign _2104 = _2102 ? _475 : _1075;
    assign _2110 = _2104 < _2109;
    assign _2111 = _2110 ? _2109 : _2104;
    assign _2124 = _2111 < _2123;
    assign _2125 = _2124 ? _2123 : _2111;
    assign _2092 = f_watch[4:4];
    assign _2091 = _320[4:4];
    assign _2093 = _2091 & _2092;
    assign _2095 = _2093 ? _450 : _1075;
    assign _2087 = f_watch[5:5];
    assign _2086 = _320[5:5];
    assign _2088 = _2086 & _2087;
    assign _2090 = _2088 ? _429 : _1075;
    assign _2096 = _2090 < _2095;
    assign _2097 = _2096 ? _2095 : _2090;
    assign _2080 = f_watch[6:6];
    assign _2079 = _320[6:6];
    assign _2081 = _2079 & _2080;
    assign _2083 = _2081 ? _406 : _1075;
    assign _2075 = f_watch[7:7];
    assign _2074 = _320[7:7];
    assign _2076 = _2074 & _2075;
    assign _2078 = _2076 ? _385 : _1075;
    assign _2084 = _2078 < _2083;
    assign _2085 = _2084 ? _2083 : _2078;
    assign _2098 = _2085 < _2097;
    assign _2099 = _2098 ? _2097 : _2085;
    assign _2126 = _2099 < _2125;
    assign _2127 = _2126 ? _2125 : _2099;
    assign _2128 = f_unexp_now ? _2127 : _1075;
    assign _2177 = f_amb_now ? _2176 : _2128;
    assign _2072 = ts_reg[2:0];
    assign _2178 = _2072 < _2177;
    assign _2180 = _2178 ? ts_hi_m1 : _2179;
    assign _2182 = { _2180,
                     _2181 };
    assign _2183 = { _2182,
                     _1203,
                     _1621,
                     _307 };
    assign _41 = _2183;
    always @(posedge _277) begin
        if (_275)
            _2200 <= _2238;
        else
            if (_2199)
                _2200 <= _41;
    end
    assign _2193 = _2191 + _2203;
    assign _2194 = _2188 ? _2193 : _2191;
    assign _42 = _2194;
    always @(posedge _277) begin
        if (_275)
            _2191 <= _1075;
        else
            _2191 <= _42;
    end
    always @* begin
        case (_2191)
        0:
            _2243 <= _2200;
        1:
            _2243 <= _2206;
        2:
            _2243 <= _2212;
        3:
            _2243 <= _2218;
        4:
            _2243 <= _2224;
        5:
            _2243 <= _2230;
        6:
            _2243 <= _2236;
        default:
            _2243 <= _2242;
        endcase
    end
    assign _43 = _2243;
    assign _5844 = _43[7:0];
    assign _5843 = _1331[2:0];
    always @* begin
        case (_5843)
        0:
            _5850 <= _5844;
        1:
            _5850 <= _5845;
        2:
            _5850 <= _5846;
        3:
            _5850 <= _5847;
        4:
            _5850 <= _5848;
        default:
            _5850 <= _5849;
        endcase
    end
    assign _5852 = _89 ? _1283 : _5850;
    assign _5841 = _46[31:24];
    assign _5840 = _46[23:16];
    assign _5839 = _46[15:8];
    assign _45 = ram_cov_rdata;
    assign _2244 = ~ f_sweeping;
    assign _2245 = _1311 & _2244;
    assign _2247 = _2245 ? _45 : _1250;
    assign _46 = _2247;
    assign _5838 = _46[7:0];
    assign _5837 = _1331[1:0];
    always @* begin
        case (_5837)
        0:
            _5842 <= _5838;
        1:
            _5842 <= _5839;
        2:
            _5842 <= _5840;
        default:
            _5842 <= _5841;
        endcase
    end
    assign _5832 = _53[39:32];
    assign _5831 = _53[31:24];
    assign _5830 = _53[23:16];
    assign _5829 = _53[15:8];
    assign _2483 = 8'b00000001;
    assign _2484 = _2478 + _2483;
    assign _2480 = _2478 == _1281;
    assign _2481 = ~ _2480;
    assign _2473 = ~ _2419;
    assign _2470 = _2448 == _1075;
    assign _2471 = ~ _2470;
    assign _2467 = _2252 | _613;
    assign _2464 = ~ _2421;
    assign _2465 = _2463 & _2464;
    assign _2466 = _2465 & _2256;
    assign _2468 = _2466 & _2467;
    assign _2472 = _2468 & _2471;
    assign _2474 = _2472 & _2473;
    assign _2460 = _2455 & _2459;
    assign _2475 = _2460 | _2474;
    assign _2482 = _2475 & _2481;
    assign _2485 = _2482 ? _2484 : _2478;
    assign _2487 = _2250 ? _1283 : _2485;
    assign _47 = _2487;
    always @(posedge _277) begin
        if (_275)
            _2478 <= _1283;
        else
            _2478 <= _47;
    end
    assign _2727 = _2721 + _2483;
    assign _2723 = _2721 == _1281;
    assign _2724 = ~ _2723;
    assign _2716 = ~ _2659;
    assign _2713 = _2688 == _1075;
    assign _2714 = ~ _2713;
    assign _2710 = _2492 | _627;
    assign _2707 = ~ _2661;
    assign _2708 = _2706 & _2707;
    assign _2709 = _2708 & _2496;
    assign _2711 = _2709 & _2710;
    assign _2715 = _2711 & _2714;
    assign _2717 = _2715 & _2716;
    assign _2459 = _2456 ? _2458 : _598;
    assign _2702 = _2699 & _2459;
    assign _2703 = _2701 | _2702;
    assign _2718 = _2703 | _2717;
    assign _2725 = _2718 & _2724;
    assign _2728 = _2725 ? _2727 : _2721;
    assign _2730 = _2250 ? _1283 : _2728;
    assign _48 = _2730;
    always @(posedge _277) begin
        if (_275)
            _2721 <= _1283;
        else
            _2721 <= _48;
    end
    assign _2763 = _2757 + _2483;
    assign _2759 = _2757 == _1281;
    assign _2760 = ~ _2759;
    assign _2753 = _2750 & _598;
    assign _2754 = _2752 | _2753;
    assign _2761 = _2754 & _2760;
    assign _2764 = _2761 ? _2763 : _2757;
    assign _2766 = _2250 ? _1283 : _2764;
    assign _49 = _2766;
    always @(posedge _277) begin
        if (_275)
            _2757 <= _1283;
        else
            _2757 <= _49;
    end
    assign _2776 = _2770 + _2483;
    assign _2772 = _2770 == _1281;
    assign _2773 = ~ _2772;
    assign _2774 = _2767 & _2773;
    assign _2777 = _2774 ? _2776 : _2770;
    assign _2779 = _2250 ? _1283 : _2777;
    assign _50 = _2779;
    always @(posedge _277) begin
        if (_275)
            _2770 <= _1283;
        else
            _2770 <= _50;
    end
    assign _2808 = _2802 + _2483;
    assign _2804 = _2802 == _1281;
    assign _2805 = ~ _2804;
    assign _2806 = _2799 & _2805;
    assign _2809 = _2806 ? _2808 : _2802;
    assign _2793 = _1261[5:5];
    assign _2792 = _2790 == _2873;
    assign _2794 = _2792 ? _2793 : _1067;
    assign _2795 = _2788 ? _2794 : _1067;
    assign _51 = _2795;
    always @(posedge _277) begin
        if (_275)
            _2250 <= _1067;
        else
            _2250 <= _51;
    end
    assign _2811 = _2250 ? _1283 : _2809;
    assign _52 = _2811;
    always @(posedge _277) begin
        if (_275)
            _2802 <= _1283;
        else
            _2802 <= _52;
    end
    assign _2812 = { _2802,
                     _2770,
                     _2757,
                     _2721,
                     _2478 };
    assign _53 = _2812;
    assign _5828 = _53[7:0];
    assign _5827 = _1331[2:0];
    always @* begin
        case (_5827)
        0:
            _5834 <= _5828;
        1:
            _5834 <= _5829;
        2:
            _5834 <= _5830;
        3:
            _5834 <= _5831;
        4:
            _5834 <= _5832;
        default:
            _5834 <= _1283;
        endcase
    end
    assign _5822 = { _1075,
                     _1652 };
    assign _5819 = _1640[4:0];
    assign _5817 = _1640[5:5];
    assign _5820 = { _5817,
                     _1395,
                     _5819 };
    assign _5816 = 8'b01000000;
    assign _5815 = 8'b00100000;
    assign _5814 = 8'b00100100;
    assign _2850 = 1'b1;
    assign _2828 = _1394 & _2827;
    assign _2846 = _2828 & _2845;
    assign _2851 = _2846 ? _2850 : _2849;
    assign _2853 = _2815 ? _1067 : _2851;
    assign _54 = _2853;
    always @(posedge _277) begin
        if (_275)
            _2849 <= _1067;
        else
            _2849 <= _54;
    end
    assign _55 = _2849;
    assign _56 = f_sweeping;
    assign _57 = f_image_valid;
    assign _5812 = { _57,
                     _56,
                     _55,
                     _1690 };
    assign _2863 = 4'b0010;
    assign _2862 = _1331[3:0];
    assign _2864 = _2862 == _2863;
    assign _2865 = _2864 ? _1261 : _1464;
    assign _2866 = _2861 ? _2865 : _1464;
    assign _58 = _2866;
    always @(posedge _277) begin
        if (_275)
            _1464 <= _1283;
        else
            _1464 <= _58;
    end
    assign _2868 = 4'b0001;
    assign _2867 = _1331[3:0];
    assign _2869 = _2867 == _2868;
    assign _2870 = _2869 ? _1261 : _1467;
    assign _2871 = _2861 ? _2870 : _1467;
    assign _59 = _2871;
    always @(posedge _277) begin
        if (_275)
            _1467 <= _1283;
        else
            _1467 <= _59;
    end
    assign _2873 = 4'b0000;
    assign _2872 = _1331[3:0];
    assign _2874 = _2872 == _2873;
    assign _2875 = _2874 ? _1261 : _1470;
    assign _2876 = _2861 ? _2875 : _1470;
    assign _60 = _2876;
    always @(posedge _277) begin
        if (_275)
            _1470 <= _1283;
        else
            _1470 <= _60;
    end
    assign _5810 = _1331[3:0];
    always @* begin
        case (_5810)
        0:
            _5825 <= _1470;
        1:
            _5825 <= _1467;
        2:
            _5825 <= _1464;
        3:
            _5825 <= _5812;
        4:
            _5825 <= _2483;
        5:
            _5825 <= _5814;
        6:
            _5825 <= _5815;
        7:
            _5825 <= _5816;
        8:
            _5825 <= _5495;
        9:
            _5825 <= _5503;
        10:
            _5825 <= _5511;
        11:
            _5825 <= _5519;
        12:
            _5825 <= _5820;
        13:
            _5825 <= _5822;
        14:
            _5825 <= _1283;
        default:
            _5825 <= _1283;
        endcase
    end
    assign _5806 = _63[15:8];
    assign _2916 = _2914 ? _2203 : _2899;
    assign _2898 = f_lane0_out ? _1360 : _2209;
    assign _2899 = _2892 ? _2898 : _2895;
    assign _2917 = _2364 ? _2916 : _2899;
    assign _2919 = _2878 ? _1075 : _2917;
    assign _2921 = _2463 ? _1075 : _2919;
    assign _61 = _2921;
    always @(posedge _277) begin
        if (_275)
            _2895 <= _1075;
        else
            _2895 <= _61;
    end
    assign _2968 = { _613,
                     _616,
                     _619,
                     _622,
                     gnd,
                     _2895 };
    assign _2961 = _2959 ? _2203 : _2944;
    assign _2943 = f_lane1_out ? _1360 : _2209;
    assign _2944 = _2937 ? _2943 : _2940;
    assign _2962 = _2604 ? _2961 : _2944;
    assign _2964 = _2923 ? _1075 : _2962;
    assign _2966 = _2706 ? _1075 : _2964;
    assign _62 = _2966;
    always @(posedge _277) begin
        if (_275)
            _2940 <= _1075;
        else
            _2940 <= _62;
    end
    assign _2967 = { _627,
                     _630,
                     _633,
                     _636,
                     gnd,
                     _2940 };
    assign _2969 = { _2967,
                     _2968 };
    assign _63 = _2969;
    assign _5805 = _63[7:0];
    assign _5804 = _2975[23:16];
    assign _5803 = _2975[15:8];
    assign _2974 = 24'b000000000000000000000000;
    assign _2986 = _66[31:8];
    assign _2983 = 4'b1000;
    assign _2982 = _1331[3:0];
    assign _2984 = _2982 == _2983;
    assign _2980 = _1245 == _1075;
    assign _2978 = _1237 & _1242;
    assign _2981 = _2978 & _2980;
    assign _2985 = _2981 & _2984;
    assign _2987 = _2985 ? _2986 : _2975;
    assign _2988 = _2977 ? _2987 : _2975;
    assign _2989 = _2972 ? _2988 : _2975;
    assign _64 = _2989;
    always @(posedge _277) begin
        if (_275)
            _2975 <= _2974;
        else
            _2975 <= _64;
    end
    assign _5802 = _2975[7:0];
    assign _2990 = 32'b00000000000000000000000000000001;
    assign _2991 = ts_reg + _2990;
    assign _65 = _2991;
    always @(posedge _277) begin
        if (_275)
            ts_reg <= _1250;
        else
            ts_reg <= _65;
    end
    assign _66 = ts_reg;
    assign _5801 = _66[7:0];
    assign _67 = _1203;
    assign _5800 = { _1395,
                     _67 };
    assign _3057 = _3053 ? _3045 : _3056;
    assign _3059 = _2815 ? _1075 : _3057;
    assign _68 = _3059;
    always @(posedge _277) begin
        if (_275)
            _3056 <= _1075;
        else
            _3056 <= _68;
    end
    assign _69 = _3056;
    assign _3052 = ~ _3051;
    assign _3042 = _2993 ? _2203 : _2209;
    assign _3039 = _3019 ? _2215 : _1360;
    assign _3043 = _3009 ? _3042 : _3039;
    assign _3036 = _3026 ? _2227 : _2233;
    assign _3044 = _3023 ? _3043 : _3036;
    assign _3030 = _3029 & _2456;
    assign _3024 = _1356 | _1309;
    assign _3025 = _3024 | _3001;
    assign _3026 = f_sweeping & _3025;
    assign _3031 = _3026 | _3030;
    assign _3020 = ~ f_image_valid;
    assign _3021 = _1383 & _3020;
    assign _3016 = _3012[1:1];
    assign _3018 = _3016 & _3017;
    assign _3067 = _1331[5:5];
    assign _3069 = _3067 == _1067;
    assign _3071 = _3069 ? _1274 : _1395;
    assign _3064 = _1331[5:5];
    assign _3066 = _3064 == _2850;
    assign _3073 = _3066 ? _1275 : _3071;
    assign _3074 = _3062 ? _3073 : _1395;
    assign _70 = _3074;
    always @(posedge _277) begin
        if (_275)
            _3012 <= _1395;
        else
            _3012 <= _70;
    end
    assign _3013 = _3012[0:0];
    assign _3015 = _3013 & _3014;
    assign _3019 = _3015 | _3018;
    assign _3022 = _3019 | _3021;
    assign _71 = _1199;
    always @(posedge _277) begin
        if (_275)
            _1267 <= _1067;
        else
            _1267 <= _71;
    end
    assign _3006 = _1199 | _1267;
    assign _3005 = _1309 & _1311;
    assign _3007 = _3005 & _3006;
    assign _3003 = ~ _1311;
    assign _3000 = _1245 == _2209;
    assign _2995 = _1229 == _1075;
    assign _2996 = _2972 & _2995;
    assign _2997 = _2996 & _1237;
    assign _2998 = _2997 & _1242;
    assign _3001 = _2998 & _3000;
    assign _1333 = 2'b11;
    assign _1332 = _1331[1:0];
    assign _1334 = _1332 == _1333;
    assign _3077 = _1334 ? _2850 : _1067;
    assign _1247 = _1245 == _2209;
    assign _1248 = _1244 & _1247;
    assign _3078 = _1248 ? _3077 : _1067;
    assign _72 = _3078;
    always @(posedge _277) begin
        if (_275)
            _1309 <= _1067;
        else
            _1309 <= _72;
    end
    assign _3002 = _1309 | _3001;
    assign _3004 = _3002 & _3003;
    assign _3008 = _3004 | _3007;
    assign _2992 = ~ _1311;
    assign _2993 = _1356 & _2992;
    assign _3009 = _2993 | _3008;
    assign _3023 = _3009 | _3022;
    assign _3032 = _3023 | _3031;
    assign _3045 = _3032 ? _3044 : _1075;
    assign _3047 = _3045 == _1075;
    assign _3048 = ~ _3047;
    assign _3053 = _3048 & _3052;
    assign _3085 = _3053 ? _2850 : _3051;
    assign _3081 = _1261[3:3];
    assign _3080 = _2790 == _2873;
    assign _3082 = _3080 ? _3081 : _1067;
    assign _3083 = _2788 ? _3082 : _1067;
    assign _73 = _3083;
    always @(posedge _277) begin
        if (_275)
            _2815 <= _1067;
        else
            _2815 <= _73;
    end
    assign _3087 = _2815 ? _1067 : _3085;
    assign _74 = _3087;
    always @(posedge _277) begin
        if (_275)
            _3051 <= _1067;
        else
            _3051 <= _74;
    end
    assign _75 = _3051;
    assign _76 = _596;
    assign _77 = _1204;
    always @(posedge _277) begin
        if (_275)
            _1207 <= _1283;
        else
            _1207 <= _77;
    end
    assign _1204 = { _1203,
                     f_winner };
    assign _2797 = _1204 == _1207;
    assign _2798 = ~ _2797;
    assign _3088 = ~ _1199;
    assign _3089 = _1196 & _3088;
    assign _78 = _3089;
    always @(posedge _277) begin
        if (_275)
            _1199 <= _1067;
        else
            _1199 <= _78;
    end
    assign _1195 = _1194[2:2];
    assign _1196 = _1191 & _1195;
    assign _2796 = _1196 & _1199;
    assign _2799 = _2796 & _2798;
    assign _3091 = _2799 ? _2850 : _1630;
    assign _3093 = _1387 ? _1067 : _3091;
    assign _79 = _3093;
    always @(posedge _277) begin
        if (_275)
            _1630 <= _1067;
        else
            _1630 <= _79;
    end
    assign _80 = _1630;
    assign _2767 = _95 & _1882;
    assign _3098 = _2767 ? _2850 : _3096;
    assign _3100 = _1387 ? _1067 : _3098;
    assign _81 = _3100;
    always @(posedge _277) begin
        if (_275)
            _3096 <= _1067;
        else
            _3096 <= _81;
    end
    assign _82 = _3096;
    assign _3104 = _223 & _2458;
    assign _2751 = ~ _2750;
    assign _2744 = _2733 & _2743;
    assign _2752 = _2744 & _2751;
    assign _2700 = ~ _2699;
    assign _2696 = _2490 & _2695;
    assign _2701 = _2696 & _2700;
    assign _3101 = _2701 | _2752;
    assign _83 = _3101;
    assign _3102 = f_rx_push & _598;
    assign _3103 = _3102 | _83;
    assign _3105 = _3103 | _3104;
    assign _3107 = _3105 ? _2850 : _1627;
    assign _3109 = _1387 ? _1067 : _3107;
    assign _84 = _3109;
    always @(posedge _277) begin
        if (_275)
            _1627 <= _1067;
        else
            _1627 <= _84;
    end
    assign _85 = _1627;
    assign _5798 = { _85,
                     _82,
                     _80,
                     _76,
                     _75,
                     _69 };
    assign _3110 = 4'b0100;
    assign _3111 = _2790 == _3110;
    assign _3112 = _3111 ? _1261 : _1461;
    assign _3113 = _2788 ? _3112 : _1461;
    assign _86 = _3113;
    always @(posedge _277) begin
        if (_275)
            _1461 <= _1283;
        else
            _1461 <= _86;
    end
    assign _5797 = { _1395,
                     _3191 };
    assign _5795 = { _1395,
                     _3183 };
    assign _5793 = { _1395,
                     _1194 };
    assign _87 = f_in_fetch;
    assign _88 = _2458;
    assign _89 = _1659;
    assign _5790 = ~ _89;
    assign _90 = _1679;
    assign _5789 = ~ _90;
    assign _1591 = _695[60:60];
    assign _1592 = f_in_eval & _1591;
    assign _91 = _1592;
    assign _3122 = _695[61:61];
    assign _3123 = _1393 & _3122;
    assign _3125 = _3123 ? _2850 : _1665;
    assign _3116 = _1261[2:2];
    assign _3115 = _2790 == _2873;
    assign _3117 = _3115 ? _3116 : _1067;
    assign _3118 = _2788 ? _3117 : _1067;
    assign _92 = _3118;
    always @(posedge _277) begin
        if (_275)
            _3121 <= _1067;
        else
            _3121 <= _92;
    end
    assign _3127 = _3121 ? _1067 : _3125;
    assign _3129 = _1387 ? _1067 : _3127;
    assign _93 = _3129;
    always @(posedge _277) begin
        if (_275)
            _1665 <= _1067;
        else
            _1665 <= _93;
    end
    assign _3146 = _96 + _2868;
    assign _3144 = _96 - _2868;
    assign _3147 = _1884 ? _3146 : _3144;
    assign _2187 = ~ _1659;
    assign _3135 = _1331[2:0];
    assign _3137 = _3135 == _2227;
    assign _3133 = _1245 == _2215;
    assign _3134 = _3131 & _3133;
    assign _3138 = _3134 & _3137;
    assign _3141 = _3138 ? _2850 : _1067;
    assign _94 = _3141;
    always @(posedge _277) begin
        if (_275)
            _2186 <= _1067;
        else
            _2186 <= _94;
    end
    assign _2188 = _2186 & _2187;
    assign _1882 = _96 == _2983;
    assign _1883 = ~ _1882;
    assign _95 = f_viol_now;
    assign _1884 = _95 & _1883;
    assign _3142 = _1884 ^ _2188;
    assign _3148 = _3142 ? _3147 : _96;
    always @(posedge _277) begin
        if (_275)
            _3151 <= _2873;
        else
            _3151 <= _3148;
    end
    assign _96 = _3151;
    assign _1659 = _96 == _2873;
    assign _1660 = ~ _1659;
    assign _3155 = _1261[4:0];
    assign _3153 = 4'b1101;
    assign _3152 = _1331[3:0];
    assign _3154 = _3152 == _3153;
    assign _3156 = _3154 ? _3155 : _1652;
    assign _3157 = _2861 ? _3156 : _1652;
    assign _97 = _3157;
    always @(posedge _277) begin
        if (_275)
            _1652 <= _1690;
        else
            _1652 <= _97;
    end
    assign _1653 = { gnd,
                     _1652 };
    assign _1654 = _1653 < _224;
    assign _1655 = ~ _1654;
    assign _1649 = _1640[5:5];
    assign _1656 = _1649 & _1655;
    assign _1639 = 6'b000000;
    assign _3162 = _1261[4:0];
    assign _3161 = _1261[7:7];
    assign _3163 = { _3161,
                     _3162 };
    assign _3159 = 4'b1100;
    assign _3158 = _1331[3:0];
    assign _3160 = _3158 == _3159;
    assign _3164 = _3160 ? _3163 : _1640;
    assign _3165 = _2861 ? _3164 : _1640;
    assign _98 = _3165;
    always @(posedge _277) begin
        if (_275)
            _1640 <= _1639;
        else
            _1640 <= _98;
    end
    assign _1641 = _1640[4:0];
    assign _1643 = _1641 == _1690;
    assign _1645 = _1643 ? _1696 : _1641;
    assign _1646 = { gnd,
                     _1645 };
    assign _1647 = _131 < _1646;
    assign _1648 = ~ _1647;
    assign _1657 = _1648 | _1656;
    assign _1661 = _1657 | _1660;
    assign _1662 = _1661 | _1596;
    assign _1666 = _1662 | _1665;
    assign _99 = _1666;
    assign _3171 = f_policy == _1333;
    assign _3173 = _3171 ? _2850 : _1596;
    assign _3169 = f_policy == _1395;
    assign _3175 = _3169 ? _2850 : _3173;
    assign _3176 = f_viol_now ? _3175 : _1596;
    assign _3177 = _1191 ? _1596 : _3176;
    assign _3167 = _284 == _1275;
    assign _3178 = _3167 ? _3177 : _1596;
    assign _3180 = _1387 ? _1067 : _3178;
    assign _100 = _3180;
    always @(posedge _277) begin
        if (_275)
            _1596 <= _1067;
        else
            _1596 <= _100;
    end
    assign _101 = _1596;
    assign _5722 = _1393 ? _1275 : _284;
    assign _5718 = _3212 ? _1274 : _284;
    assign _5709 = f_policy == _1333;
    assign _5711 = _5709 ? _1395 : _284;
    assign _5708 = f_policy == _1275;
    assign _5713 = _5708 ? _1274 : _5711;
    assign _5707 = f_policy == _1395;
    assign _5715 = _5707 ? _1395 : _5713;
    assign _5716 = f_viol_now ? _5715 : _284;
    assign _1186 = f_chgmask3 & f_multi_eff;
    assign _1188 = _1186 == _1283;
    assign _1179 = _1139 == _1064;
    assign _1174 = 16'b0000000000000000;
    assign _1175 = _1139 == _1174;
    assign _1176 = _1175 & _1156;
    assign _1173 = _1115 == _1135;
    assign _1177 = _1173 | _1176;
    assign _1180 = _1114 ? _1179 : _1177;
    assign _1170 = _601[3:0];
    assign _1172 = _1170 == _2873;
    assign _1181 = _1172 | _1180;
    assign _1168 = _1139 == _1064;
    assign _1164 = _1139 == _1174;
    assign _1165 = _1164 & _1156;
    assign _1162 = _1115 == _1135;
    assign _1166 = _1162 | _1165;
    assign _1169 = _1114 ? _1168 : _1166;
    assign _1160 = _1126 == _1064;
    always @(posedge _277) begin
        if (_275)
            _1054 <= _1075;
        else
            _1054 <= _1051;
    end
    assign _1155 = { _1082,
                     _1054 };
    assign _1156 = _1112 < _1155;
    assign _1153 = _1126 == _1174;
    assign _1157 = _1153 & _1156;
    assign _1151 = _1115 == _1123;
    assign _1158 = _1151 | _1157;
    assign _1161 = _1114 ? _1160 : _1158;
    assign _1150 = _712[104:103];
    always @* begin
        case (_1150)
        0:
            _1182 <= vdd;
        1:
            _1182 <= _1161;
        2:
            _1182 <= _1169;
        default:
            _1182 <= _1181;
        endcase
    end
    assign _1149 = ~ _645;
    assign _1183 = _1149 | _1182;
    assign _1146 = _712[62:62];
    assign _1144 = _712[61:58];
    always @* begin
        case (_1144)
        0:
            _1145 <= vdd;
        1:
            _1145 <= _586;
        2:
            _1145 <= _590;
        3:
            _1145 <= _594;
        4:
            _1145 <= _596;
        5:
            _1145 <= _598;
        6:
            _1145 <= _602;
        7:
            _1145 <= _608;
        8:
            _1145 <= _613;
        9:
            _1145 <= _616;
        10:
            _1145 <= _619;
        11:
            _1145 <= _622;
        12:
            _1145 <= _627;
        13:
            _1145 <= _630;
        14:
            _1145 <= _633;
        default:
            _1145 <= _636;
        endcase
    end
    assign _1147 = _1145 ^ _1146;
    assign _1139 = _712[57:42];
    assign _1141 = _1139 == _1064;
    assign _1134 = 17'b00000000000000000;
    assign _1130 = _1012[57:42];
    assign _1131 = { gnd,
                     _1130 };
    assign _1132 = _1131 + _1119;
    always @(posedge _277) begin
        if (_275)
            _1135 <= _1134;
        else
            _1135 <= _1132;
    end
    assign _1136 = _1135 < _1115;
    assign _1137 = ~ _1136;
    assign _1126 = _712[41:26];
    assign _1128 = _1126 == _1174;
    assign _1043 = _1013[0:0];
    assign _1045 = _1043 ? _548 : _1075;
    assign _1040 = _1013[1:1];
    assign _1042 = _1040 ? _527 : _1075;
    assign _1046 = _1042 < _1045;
    assign _1047 = _1046 ? _1045 : _1042;
    assign _1035 = _1013[2:2];
    assign _1037 = _1035 ? _504 : _1075;
    assign _1032 = _1013[3:3];
    assign _1034 = _1032 ? _483 : _1075;
    assign _1038 = _1034 < _1037;
    assign _1039 = _1038 ? _1037 : _1034;
    assign _1048 = _1039 < _1047;
    assign _1049 = _1048 ? _1047 : _1039;
    assign _1025 = _1013[4:4];
    assign _1027 = _1025 ? _458 : _1075;
    assign _1022 = _1013[5:5];
    assign _1024 = _1022 ? _437 : _1075;
    assign _1028 = _1024 < _1027;
    assign _1029 = _1028 ? _1027 : _1024;
    assign _1017 = _1013[6:6];
    assign _1019 = _1017 ? _414 : _1075;
    assign _1013 = _1012[23:16];
    assign _1014 = _1013[7:7];
    assign _1016 = _1014 ? _393 : _1075;
    assign _1020 = _1016 < _1019;
    assign _1021 = _1020 ? _1019 : _1016;
    assign _1030 = _1021 < _1029;
    assign _1031 = _1030 ? _1029 : _1021;
    assign _1050 = _1031 < _1049;
    assign _1051 = _1050 ? _1049 : _1031;
    assign _1118 = 14'b00000000000000;
    assign _1119 = { _1118,
                     _1051 };
    assign _1012 = _368[511:400];
    assign _1116 = _1012[41:26];
    assign _1117 = { gnd,
                     _1116 };
    assign _1120 = _1117 + _1119;
    always @(posedge _277) begin
        if (_275)
            _1123 <= _1134;
        else
            _1123 <= _1120;
    end
    assign _1115 = { gnd,
                     _1112 };
    assign _1124 = _1115 < _1123;
    assign _1125 = ~ _1124;
    assign _1129 = _1125 | _1128;
    assign _1138 = _1129 & _1137;
    assign _1057 = _712[25:24];
    always @* begin
        case (_1057)
        0:
            _1112 <= _335;
        1:
            _1112 <= _338;
        2:
            _1112 <= _341;
        default:
            _1112 <= _341;
        endcase
    end
    assign _1114 = _1112 == _1064;
    assign _1142 = _1114 ? _1141 : _1138;
    assign _1106 = f_changed_all & f_chgmask3;
    assign _1108 = _1106 == _1283;
    assign _1109 = ~ _1108;
    assign _1105 = f_chgmask3 == _1283;
    assign _1110 = _1105 | _1109;
    assign _1099 = _712[7:0];
    assign _1097 = _712[15:8];
    assign _1098 = _307 ^ _1097;
    assign _1100 = _1098 & _1099;
    assign _1102 = _1100 == _1283;
    assign _1103 = f_valid3 & _1102;
    assign _1111 = _1103 & _1110;
    assign _1143 = _1111 & _1142;
    assign _1148 = _1143 & _1147;
    assign _1184 = _1148 & _1183;
    assign _1185 = f_in_eval & _1184;
    assign _1189 = _1185 & _1188;
    assign f_fire3 = _1189 & _727;
    assign _691 = f_chgmask0 & f_multi_eff;
    assign _693 = _691 == _1283;
    assign _679 = _576 == _1064;
    assign _675 = _576 == _1174;
    assign _676 = _675 & _656;
    assign _673 = _346 == _572;
    assign _677 = _673 | _676;
    assign _680 = _344 ? _679 : _677;
    assign _670 = _601[3:0];
    assign _672 = _670 == _2873;
    assign _681 = _672 | _680;
    assign _668 = _576 == _1064;
    assign _664 = _576 == _1174;
    assign _665 = _664 & _656;
    assign _662 = _346 == _572;
    assign _666 = _662 | _665;
    assign _669 = _344 ? _668 : _666;
    assign _660 = _563 == _1064;
    always @(posedge _277) begin
        if (_275)
            _654 <= _1075;
        else
            _654 <= _555;
    end
    assign _655 = { _1082,
                    _654 };
    assign _656 = _342 < _655;
    assign _650 = _563 == _1174;
    assign _657 = _650 & _656;
    assign _648 = _346 == _560;
    assign _658 = _648 | _657;
    assign _661 = _344 ? _660 : _658;
    assign _647 = _300[104:103];
    always @* begin
        case (_647)
        0:
            _682 <= vdd;
        1:
            _682 <= _661;
        2:
            _682 <= _669;
        default:
            _682 <= _681;
        endcase
    end
    assign _646 = ~ _645;
    assign _683 = _646 | _682;
    assign _638 = _300[62:62];
    assign _581 = _300[61:58];
    always @* begin
        case (_581)
        0:
            _637 <= vdd;
        1:
            _637 <= _586;
        2:
            _637 <= _590;
        3:
            _637 <= _594;
        4:
            _637 <= _596;
        5:
            _637 <= _598;
        6:
            _637 <= _602;
        7:
            _637 <= _608;
        8:
            _637 <= _613;
        9:
            _637 <= _616;
        10:
            _637 <= _619;
        11:
            _637 <= _622;
        12:
            _637 <= _627;
        13:
            _637 <= _630;
        14:
            _637 <= _633;
        default:
            _637 <= _636;
        endcase
    end
    assign _639 = _637 ^ _638;
    assign _576 = _300[57:42];
    assign _578 = _576 == _1064;
    assign _567 = _369[57:42];
    assign _568 = { gnd,
                    _567 };
    assign _569 = _568 + _556;
    always @(posedge _277) begin
        if (_275)
            _572 <= _1134;
        else
            _572 <= _569;
    end
    assign _573 = _572 < _346;
    assign _574 = ~ _573;
    assign _563 = _300[41:26];
    assign _565 = _563 == _1174;
    assign _529 = _373[0:0];
    assign _549 = _529 ? _548 : _1075;
    assign _508 = _373[1:1];
    assign _528 = _508 ? _527 : _1075;
    assign _550 = _528 < _549;
    assign _551 = _550 ? _549 : _528;
    assign _485 = _373[2:2];
    assign _505 = _485 ? _504 : _1075;
    assign _464 = _373[3:3];
    assign _484 = _464 ? _483 : _1075;
    assign _506 = _484 < _505;
    assign _507 = _506 ? _505 : _484;
    assign _552 = _507 < _551;
    assign _553 = _552 ? _551 : _507;
    assign _439 = _373[4:4];
    assign _459 = _439 ? _458 : _1075;
    assign _418 = _373[5:5];
    assign _438 = _418 ? _437 : _1075;
    assign _460 = _438 < _459;
    assign _461 = _460 ? _459 : _438;
    assign _395 = _373[6:6];
    assign _415 = _395 ? _414 : _1075;
    assign _373 = _369[23:16];
    assign _374 = _373[7:7];
    assign _394 = _374 ? _393 : _1075;
    assign _416 = _394 < _415;
    assign _417 = _416 ? _415 : _394;
    assign _462 = _417 < _461;
    assign _463 = _462 ? _461 : _417;
    assign _554 = _463 < _553;
    assign _555 = _554 ? _553 : _463;
    assign _556 = { _1118,
                    _555 };
    assign _369 = _368[175:64];
    assign _370 = _369[41:26];
    assign _371 = { gnd,
                    _370 };
    assign _557 = _371 + _556;
    always @(posedge _277) begin
        if (_275)
            _560 <= _1134;
        else
            _560 <= _557;
    end
    assign _346 = { gnd,
                    _342 };
    assign _561 = _346 < _560;
    assign _562 = ~ _561;
    assign _566 = _562 | _565;
    assign _575 = _566 & _574;
    assign _332 = _300[25:24];
    always @* begin
        case (_332)
        0:
            _342 <= _335;
        1:
            _342 <= _338;
        2:
            _342 <= _341;
        default:
            _342 <= _341;
        endcase
    end
    assign _344 = _342 == _1064;
    assign _579 = _344 ? _578 : _575;
    assign _326 = f_changed_all & f_chgmask0;
    assign _328 = _326 == _1283;
    assign _329 = ~ _328;
    assign _317 = f_chgmask0 == _1283;
    assign _330 = _317 | _329;
    assign _310 = _300[7:0];
    assign _308 = _300[15:8];
    assign _309 = _307 ^ _308;
    assign _311 = _309 & _310;
    assign _313 = _311 == _1283;
    assign _5479 = _351 + _2203;
    assign _3186 = _1261[5:0];
    assign _3185 = _2790 == _2863;
    assign _3187 = _3185 ? _3186 : _3183;
    assign _3188 = _2788 ? _3187 : _3183;
    assign _102 = _3188;
    always @(posedge _277) begin
        if (_275)
            _3183 <= _1639;
        else
            _3183 <= _102;
    end
    assign _3213 = _3212 ? _3210 : _1203;
    assign _3194 = _1261[5:0];
    assign _3192 = 4'b0011;
    assign _3193 = _2790 == _3192;
    assign _3195 = _3193 ? _3194 : _3191;
    assign _3196 = _2788 ? _3195 : _3191;
    assign _103 = _3196;
    always @(posedge _277) begin
        if (_275)
            _3191 <= _1639;
        else
            _3191 <= _103;
    end
    assign _3200 = _1387 ? _3191 : _3199;
    assign _104 = _3200;
    always @(posedge _277) begin
        if (_275)
            _3199 <= _1639;
        else
            _3199 <= _104;
    end
    assign _3203 = f_policy == _1275;
    assign _3204 = _3203 ? _3199 : _1203;
    assign _3205 = f_viol_now ? _3204 : _1203;
    assign _3214 = _1191 ? _3213 : _3205;
    assign _3201 = _284 == _1275;
    assign _3215 = _3201 ? _3214 : _1203;
    assign _3216 = _1387 ? _3183 : _3215;
    assign _105 = _3216;
    always @(posedge _277) begin
        if (_275)
            _1203 <= _1639;
        else
            _1203 <= _105;
    end
    assign _3209 = _712[110:105];
    assign _3208 = _706[110:105];
    assign _3207 = _700[110:105];
    assign _3206 = _300[110:105];
    always @* begin
        case (f_winner)
        0:
            _3210 <= _3206;
        1:
            _3210 <= _3207;
        2:
            _3210 <= _3208;
        default:
            _3210 <= _3209;
        endcase
    end
    assign _3211 = _3210 == _1203;
    assign _3212 = ~ _3211;
    assign _5475 = _3212 ? _1075 : _351;
    assign _5470 = f_policy == _1275;
    assign _5472 = _5470 ? _1075 : _351;
    assign _1614 = f_changed_all & f_watch;
    assign _1616 = _1614 == _1283;
    assign _1617 = ~ _1616;
    assign _1612 = ~ _1191;
    assign _1613 = f_in_eval & _1612;
    assign f_unexp_now = _1613 & _1617;
    assign _3220 = ~ f_amb_now;
    assign _3221 = _1611 & _3220;
    assign _3223 = _3221 ? _2850 : _3219;
    assign _3224 = _1191 ? _3219 : _3223;
    assign _3219 = _1394 ? _1067 : _1609;
    assign _3217 = _284 == _1275;
    assign _3225 = _3217 ? _3224 : _3219;
    assign _106 = _3225;
    always @(posedge _277) begin
        if (_275)
            _1609 <= _1067;
        else
            _1609 <= _106;
    end
    assign _1610 = ~ _1609;
    assign _5461 = 16'b0000000000000001;
    assign _5462 = _335 + _5461;
    assign _5458 = _335 == _1064;
    assign _5459 = ~ _5458;
    assign _5460 = _5419 & _5459;
    assign _5463 = _5460 ? _5462 : _335;
    assign _5403 = _695[26:24];
    assign _5401 = _712[93:91];
    assign _5400 = _706[93:91];
    assign _5399 = _700[93:91];
    assign _5398 = _300[93:91];
    assign _1000 = f_chgmask2 & f_multi_eff;
    assign _1002 = _1000 == _1283;
    assign _993 = _950 == _1064;
    assign _989 = _950 == _1174;
    assign _990 = _989 & _970;
    assign _987 = _886 == _946;
    assign _991 = _987 | _990;
    assign _994 = _885 ? _993 : _991;
    assign _984 = _601[3:0];
    assign _986 = _984 == _2873;
    assign _995 = _986 | _994;
    assign _982 = _950 == _1064;
    assign _978 = _950 == _1174;
    assign _979 = _978 & _970;
    assign _976 = _886 == _946;
    assign _980 = _976 | _979;
    assign _983 = _885 ? _982 : _980;
    assign _974 = _937 == _1064;
    always @(posedge _277) begin
        if (_275)
            _968 <= _1075;
        else
            _968 <= _929;
    end
    assign _969 = { _1082,
                    _968 };
    assign _970 = _883 < _969;
    assign _964 = _937 == _1174;
    assign _971 = _964 & _970;
    assign _962 = _886 == _934;
    assign _972 = _962 | _971;
    assign _975 = _885 ? _974 : _972;
    assign _961 = _706[104:103];
    always @* begin
        case (_961)
        0:
            _996 <= vdd;
        1:
            _996 <= _975;
        2:
            _996 <= _983;
        default:
            _996 <= _995;
        endcase
    end
    assign _960 = ~ _645;
    assign _997 = _960 | _996;
    assign _957 = _706[62:62];
    assign _955 = _706[61:58];
    always @* begin
        case (_955)
        0:
            _956 <= vdd;
        1:
            _956 <= _586;
        2:
            _956 <= _590;
        3:
            _956 <= _594;
        4:
            _956 <= _596;
        5:
            _956 <= _598;
        6:
            _956 <= _602;
        7:
            _956 <= _608;
        8:
            _956 <= _613;
        9:
            _956 <= _616;
        10:
            _956 <= _619;
        11:
            _956 <= _622;
        12:
            _956 <= _627;
        13:
            _956 <= _630;
        14:
            _956 <= _633;
        default:
            _956 <= _636;
        endcase
    end
    assign _958 = _956 ^ _957;
    assign _950 = _706[57:42];
    assign _952 = _950 == _1064;
    assign _941 = _887[57:42];
    assign _942 = { gnd,
                    _941 };
    assign _943 = _942 + _930;
    always @(posedge _277) begin
        if (_275)
            _946 <= _1134;
        else
            _946 <= _943;
    end
    assign _947 = _946 < _886;
    assign _948 = ~ _947;
    assign _937 = _706[41:26];
    assign _939 = _937 == _1174;
    assign _921 = _891[0:0];
    assign _923 = _921 ? _548 : _1075;
    assign _918 = _891[1:1];
    assign _920 = _918 ? _527 : _1075;
    assign _924 = _920 < _923;
    assign _925 = _924 ? _923 : _920;
    assign _913 = _891[2:2];
    assign _915 = _913 ? _504 : _1075;
    assign _910 = _891[3:3];
    assign _912 = _910 ? _483 : _1075;
    assign _916 = _912 < _915;
    assign _917 = _916 ? _915 : _912;
    assign _926 = _917 < _925;
    assign _927 = _926 ? _925 : _917;
    assign _903 = _891[4:4];
    assign _905 = _903 ? _458 : _1075;
    assign _900 = _891[5:5];
    assign _902 = _900 ? _437 : _1075;
    assign _906 = _902 < _905;
    assign _907 = _906 ? _905 : _902;
    assign _895 = _891[6:6];
    assign _897 = _895 ? _414 : _1075;
    assign _891 = _887[23:16];
    assign _892 = _891[7:7];
    assign _894 = _892 ? _393 : _1075;
    assign _898 = _894 < _897;
    assign _899 = _898 ? _897 : _894;
    assign _908 = _899 < _907;
    assign _909 = _908 ? _907 : _899;
    assign _928 = _909 < _927;
    assign _929 = _928 ? _927 : _909;
    assign _930 = { _1118,
                    _929 };
    assign _887 = _368[399:288];
    assign _888 = _887[41:26];
    assign _889 = { gnd,
                    _888 };
    assign _931 = _889 + _930;
    always @(posedge _277) begin
        if (_275)
            _934 <= _1134;
        else
            _934 <= _931;
    end
    assign _886 = { gnd,
                    _883 };
    assign _935 = _886 < _934;
    assign _936 = ~ _935;
    assign _940 = _936 | _939;
    assign _949 = _940 & _948;
    assign _882 = _706[25:24];
    always @* begin
        case (_882)
        0:
            _883 <= _335;
        1:
            _883 <= _338;
        2:
            _883 <= _341;
        default:
            _883 <= _341;
        endcase
    end
    assign _885 = _883 == _1064;
    assign _953 = _885 ? _952 : _949;
    assign _876 = f_changed_all & f_chgmask2;
    assign _878 = _876 == _1283;
    assign _879 = ~ _878;
    assign _875 = f_chgmask2 == _1283;
    assign _880 = _875 | _879;
    assign _869 = _706[7:0];
    assign _867 = _706[15:8];
    assign _868 = _307 ^ _867;
    assign _870 = _868 & _869;
    assign _872 = _870 == _1283;
    assign _873 = f_valid2 & _872;
    assign _881 = _873 & _880;
    assign _954 = _881 & _953;
    assign _959 = _954 & _958;
    assign _998 = _959 & _997;
    assign _999 = f_in_eval & _998;
    assign _1003 = _999 & _1002;
    assign f_fire2 = _1003 & _727;
    assign _1007 = f_fire2 ? _1275 : _1333;
    assign f_policy = _695[59:58];
    assign _726 = f_policy == _1274;
    assign f_chgmask3 = _712[23:16];
    assign f_valid3 = _712[111:111];
    assign _716 = f_valid3 ? f_chgmask3 : _1283;
    assign f_chgmask2 = _706[23:16];
    assign f_valid2 = _706[111:111];
    assign _710 = f_valid2 ? f_chgmask2 : _1283;
    assign _704 = f_valid1 ? f_chgmask1 : _1283;
    assign f_chgmask0 = _300[23:16];
    assign _698 = f_valid0 ? f_chgmask0 : _1283;
    assign f_watch = _695[57:50];
    assign _699 = f_watch | _698;
    assign _705 = _699 | _704;
    assign _711 = _705 | _710;
    assign f_relevant = _711 | _716;
    assign _718 = f_multi_eff & f_relevant;
    assign _720 = _718 == _1283;
    assign _721 = ~ _720;
    assign f_amb_now = f_in_eval & _721;
    assign _723 = ~ f_amb_now;
    assign _727 = _723 | _726;
    assign _689 = _320 & f_chg_now;
    assign _3230 = _320 & f_chg_now;
    assign _3231 = _688 | _3230;
    assign _3227 = _284 == _1275;
    assign _3229 = _3227 ? _1283 : _688;
    assign _3226 = _284 == _1274;
    assign _3232 = _3226 ? _3231 : _3229;
    assign _3234 = _1387 ? _1283 : _3232;
    assign _107 = _3234;
    always @(posedge _277) begin
        if (_275)
            _688 <= _1283;
        else
            _688 <= _107;
    end
    assign f_multi_eff = _688 | _689;
    assign _862 = f_chgmask1 & f_multi_eff;
    assign _864 = _862 == _1283;
    assign _855 = _812 == _1064;
    assign _851 = _812 == _1174;
    assign _852 = _851 & _832;
    assign _849 = _748 == _808;
    assign _853 = _849 | _852;
    assign _856 = _747 ? _855 : _853;
    assign _846 = _601[3:0];
    assign _848 = _846 == _2873;
    assign _857 = _848 | _856;
    assign _844 = _812 == _1064;
    assign _840 = _812 == _1174;
    assign _841 = _840 & _832;
    assign _838 = _748 == _808;
    assign _842 = _838 | _841;
    assign _845 = _747 ? _844 : _842;
    assign _836 = _799 == _1064;
    always @(posedge _277) begin
        if (_275)
            _830 <= _1075;
        else
            _830 <= _791;
    end
    assign _831 = { _1082,
                    _830 };
    assign _832 = _745 < _831;
    assign _826 = _799 == _1174;
    assign _833 = _826 & _832;
    assign _824 = _748 == _796;
    assign _834 = _824 | _833;
    assign _837 = _747 ? _836 : _834;
    assign _823 = _700[104:103];
    always @* begin
        case (_823)
        0:
            _858 <= vdd;
        1:
            _858 <= _837;
        2:
            _858 <= _845;
        default:
            _858 <= _857;
        endcase
    end
    assign _3235 = _1194[1:0];
    assign _3236 = _1387 ? _3235 : _643;
    assign _108 = _3236;
    always @(posedge _277) begin
        if (_275)
            _643 <= _1395;
        else
            _643 <= _108;
    end
    assign _645 = _643 == _1275;
    assign _822 = ~ _645;
    assign _859 = _822 | _858;
    assign _819 = _700[62:62];
    assign _3240 = _2959 ? _2850 : _3238;
    assign _3238 = _2937 ? _2850 : _636;
    assign _3241 = _2604 ? _3240 : _3238;
    assign _3243 = _2923 ? _1067 : _3241;
    assign _3245 = _2706 ? _1067 : _3243;
    assign _109 = _3245;
    always @(posedge _277) begin
        if (_275)
            _636 <= _1067;
        else
            _636 <= _109;
    end
    assign _3260 = _3252 ^ _3259;
    assign _3268 = _3260 & _3267;
    assign _3270 = _3268 == _1174;
    assign _3247 = ~ _3246;
    assign _3271 = _3247 & _3270;
    assign _3273 = _3271 ? _2850 : _633;
    assign _3274 = _2618 ? _3273 : _633;
    assign _3275 = _2959 ? _633 : _3274;
    assign _3276 = _2604 ? _3275 : _633;
    assign _3278 = _2923 ? _1067 : _3276;
    assign _3280 = _2706 ? _1067 : _3278;
    assign _110 = _3280;
    always @(posedge _277) begin
        if (_275)
            _633 <= _1067;
        else
            _633 <= _110;
    end
    assign _3288 = _218[1:1];
    assign _3289 = ~ _3288;
    assign _3284 = _1331[4:0];
    assign _3286 = _3284 == _1798;
    assign _3281 = _1331[5:5];
    assign _3283 = _3281 == _2850;
    assign _3287 = _3283 & _3286;
    assign _3290 = _3287 & _3289;
    assign _3291 = _3290 ? _1261 : _3266;
    assign _3292 = _3062 ? _3291 : _3266;
    assign _111 = _3292;
    always @(posedge _277) begin
        if (_275)
            _3266 <= _1283;
        else
            _3266 <= _111;
    end
    assign _3300 = _218[1:1];
    assign _3301 = ~ _3300;
    assign _3296 = _1331[4:0];
    assign _3298 = _3296 == _1804;
    assign _3293 = _1331[5:5];
    assign _3295 = _3293 == _2850;
    assign _3299 = _3295 & _3298;
    assign _3302 = _3299 & _3301;
    assign _3303 = _3302 ? _1261 : _3263;
    assign _3304 = _3062 ? _3303 : _3263;
    assign _112 = _3304;
    always @(posedge _277) begin
        if (_275)
            _3263 <= _1283;
        else
            _3263 <= _112;
    end
    assign _3267 = { _3263,
                     _3266 };
    assign _3312 = _218[1:1];
    assign _3313 = ~ _3312;
    assign _3308 = _1331[4:0];
    assign _3310 = _3308 == _1786;
    assign _3305 = _1331[5:5];
    assign _3307 = _3305 == _2850;
    assign _3311 = _3307 & _3310;
    assign _3314 = _3311 & _3313;
    assign _3315 = _3314 ? _1261 : _3258;
    assign _3316 = _3062 ? _3315 : _3258;
    assign _113 = _3316;
    always @(posedge _277) begin
        if (_275)
            _3258 <= _1283;
        else
            _3258 <= _113;
    end
    assign _3324 = _218[1:1];
    assign _3325 = ~ _3324;
    assign _3320 = _1331[4:0];
    assign _3322 = _3320 == _1792;
    assign _3317 = _1331[5:5];
    assign _3319 = _3317 == _2850;
    assign _3323 = _3319 & _3322;
    assign _3326 = _3323 & _3325;
    assign _3327 = _3326 ? _1261 : _3255;
    assign _3328 = _3062 ? _3327 : _3255;
    assign _114 = _3328;
    always @(posedge _277) begin
        if (_275)
            _3255 <= _1283;
        else
            _3255 <= _114;
    end
    assign _3259 = { _3255,
                     _3258 };
    assign _3367 = g_crc_0[31:16];
    assign _3368 = _3367 ^ _3259;
    assign _3369 = _3368 & _3267;
    assign _3371 = _3369 == _1174;
    assign _3342 = _2950 == _3341;
    assign _3343 = ~ _3342;
    assign _3345 = _3335 ? _3344 : g_crc_bad;
    assign _3346 = _2618 ? _3345 : g_crc_bad;
    assign _3347 = _2959 ? g_crc_bad : _3346;
    assign _3348 = _2604 ? _3347 : g_crc_bad;
    assign _3350 = _2923 ? _1067 : _3348;
    assign _115 = _3350;
    always @(posedge _277) begin
        if (_275)
            g_crc_bad <= _1067;
        else
            g_crc_bad <= _115;
    end
    assign _3344 = g_crc_bad | _3343;
    assign _3361 = ~ _3344;
    assign _3359 = 6'b000001;
    assign _3360 = g_left_0 == _3359;
    assign _3362 = _3360 ? _3361 : _630;
    assign _3363 = _3335 ? _3362 : _630;
    assign _3364 = _2618 ? _3363 : _630;
    assign _3365 = _2959 ? _630 : _3364;
    assign _3366 = _2604 ? _3365 : _630;
    assign _3354 = ~ _2706;
    assign _3352 = ~ _2923;
    assign _3351 = _2659 & _3246;
    assign _3353 = _3351 & _3352;
    assign _3355 = _3353 & _3354;
    assign _116 = _3355;
    always @(posedge _277) begin
        if (_275)
            g_resid_chk <= _1067;
        else
            g_resid_chk <= _116;
    end
    assign _3372 = g_resid_chk ? _3371 : _3366;
    assign _3374 = _2923 ? _1067 : _3372;
    assign _3376 = _2706 ? _1067 : _3374;
    assign _117 = _3376;
    always @(posedge _277) begin
        if (_275)
            _630 <= _1067;
        else
            _630 <= _117;
    end
    assign _3380 = _2914 ? _2850 : _3378;
    assign _3378 = _2892 ? _2850 : _622;
    assign _3381 = _2364 ? _3380 : _3378;
    assign _3383 = _2878 ? _1067 : _3381;
    assign _3385 = _2463 ? _1067 : _3383;
    assign _118 = _3385;
    always @(posedge _277) begin
        if (_275)
            _622 <= _1067;
        else
            _622 <= _118;
    end
    assign _3400 = _3392 ^ _3399;
    assign _3408 = _3400 & _3407;
    assign _3410 = _3408 == _1174;
    assign _3387 = ~ _3386;
    assign _3411 = _3387 & _3410;
    assign _3413 = _3411 ? _2850 : _619;
    assign _3414 = _2378 ? _3413 : _619;
    assign _3415 = _2914 ? _619 : _3414;
    assign _3416 = _2364 ? _3415 : _619;
    assign _3418 = _2878 ? _1067 : _3416;
    assign _3420 = _2463 ? _1067 : _3418;
    assign _119 = _3420;
    always @(posedge _277) begin
        if (_275)
            _619 <= _1067;
        else
            _619 <= _119;
    end
    assign _3428 = _218[0:0];
    assign _3429 = ~ _3428;
    assign _3424 = _1331[4:0];
    assign _3426 = _3424 == _1798;
    assign _3421 = _1331[5:5];
    assign _3423 = _3421 == _1067;
    assign _3427 = _3423 & _3426;
    assign _3430 = _3427 & _3429;
    assign _3431 = _3430 ? _1261 : _3406;
    assign _3432 = _3062 ? _3431 : _3406;
    assign _120 = _3432;
    always @(posedge _277) begin
        if (_275)
            _3406 <= _1283;
        else
            _3406 <= _120;
    end
    assign _3440 = _218[0:0];
    assign _3441 = ~ _3440;
    assign _3436 = _1331[4:0];
    assign _3438 = _3436 == _1804;
    assign _3433 = _1331[5:5];
    assign _3435 = _3433 == _1067;
    assign _3439 = _3435 & _3438;
    assign _3442 = _3439 & _3441;
    assign _3443 = _3442 ? _1261 : _3403;
    assign _3444 = _3062 ? _3443 : _3403;
    assign _121 = _3444;
    always @(posedge _277) begin
        if (_275)
            _3403 <= _1283;
        else
            _3403 <= _121;
    end
    assign _3407 = { _3403,
                     _3406 };
    assign _3452 = _218[0:0];
    assign _3453 = ~ _3452;
    assign _3448 = _1331[4:0];
    assign _3450 = _3448 == _1786;
    assign _3445 = _1331[5:5];
    assign _3447 = _3445 == _1067;
    assign _3451 = _3447 & _3450;
    assign _3454 = _3451 & _3453;
    assign _3455 = _3454 ? _1261 : _3398;
    assign _3456 = _3062 ? _3455 : _3398;
    assign _122 = _3456;
    always @(posedge _277) begin
        if (_275)
            _3398 <= _1283;
        else
            _3398 <= _122;
    end
    assign _3464 = _218[0:0];
    assign _3465 = ~ _3464;
    assign _3460 = _1331[4:0];
    assign _3462 = _3460 == _1792;
    assign _3457 = _1331[5:5];
    assign _3459 = _3457 == _1067;
    assign _3463 = _3459 & _3462;
    assign _3466 = _3463 & _3465;
    assign _3467 = _3466 ? _1261 : _3395;
    assign _3468 = _3062 ? _3467 : _3395;
    assign _123 = _3468;
    always @(posedge _277) begin
        if (_275)
            _3395 <= _1283;
        else
            _3395 <= _123;
    end
    assign _3399 = { _3395,
                     _3398 };
    assign _3507 = g_crc[31:16];
    assign _3508 = _3507 ^ _3399;
    assign _3509 = _3508 & _3407;
    assign _3511 = _3509 == _1174;
    assign _3482 = _2905 == _3481;
    assign _3483 = ~ _3482;
    assign _3485 = _3475 ? _3484 : g_crc_bad_0;
    assign _3486 = _2378 ? _3485 : g_crc_bad_0;
    assign _3487 = _2914 ? g_crc_bad_0 : _3486;
    assign _3488 = _2364 ? _3487 : g_crc_bad_0;
    assign _3490 = _2878 ? _1067 : _3488;
    assign _124 = _3490;
    always @(posedge _277) begin
        if (_275)
            g_crc_bad_0 <= _1067;
        else
            g_crc_bad_0 <= _124;
    end
    assign _3484 = g_crc_bad_0 | _3483;
    assign _3501 = ~ _3484;
    assign _3500 = g_left == _3359;
    assign _3502 = _3500 ? _3501 : _616;
    assign _3503 = _3475 ? _3502 : _616;
    assign _3504 = _2378 ? _3503 : _616;
    assign _3505 = _2914 ? _616 : _3504;
    assign _3506 = _2364 ? _3505 : _616;
    assign _3494 = ~ _2463;
    assign _3492 = ~ _2878;
    assign _3491 = _2419 & _3386;
    assign _3493 = _3491 & _3492;
    assign _3495 = _3493 & _3494;
    assign _125 = _3495;
    always @(posedge _277) begin
        if (_275)
            g_resid_chk_0 <= _1067;
        else
            g_resid_chk_0 <= _125;
    end
    assign _3512 = g_resid_chk_0 ? _3511 : _3506;
    assign _3514 = _2878 ? _1067 : _3512;
    assign _3516 = _2463 ? _1067 : _3514;
    assign _126 = _3516;
    always @(posedge _277) begin
        if (_275)
            _616 <= _1067;
        else
            _616 <= _126;
    end
    assign _3517 = 4'b0101;
    assign _3518 = _2790 == _3517;
    assign _3519 = _3518 ? _1261 : _606;
    assign _3520 = _2788 ? _3519 : _606;
    assign _127 = _3520;
    always @(posedge _277) begin
        if (_275)
            _606 <= _1283;
        else
            _606 <= _127;
    end
    assign _607 = _606[6:0];
    assign _603 = _593[7:1];
    assign _608 = _603 == _607;
    assign _600 = 16'b1010110011100001;
    assign _3525 = _601[10:10];
    assign _3524 = _601[12:12];
    assign _3526 = _3524 ^ _3525;
    assign _3523 = _601[13:13];
    assign _3527 = _3523 ^ _3526;
    assign _3522 = _601[15:15];
    assign _3528 = _3522 ^ _3527;
    assign _3521 = _601[14:0];
    assign _3529 = { _3521,
                     _3528 };
    assign _128 = _3529;
    always @(posedge _277) begin
        if (_275)
            _601 <= _600;
        else
            _601 <= _128;
    end
    assign _602 = _601[0:0];
    assign _597 = 6'b100000;
    assign _3548 = _131 + _3359;
    assign _3546 = _131 - _3359;
    assign _3549 = _1668 ? _3548 : _3546;
    assign _1679 = _131 == _1639;
    assign _1680 = ~ _1679;
    assign _3531 = _1245 == _2227;
    assign _3130 = _1232 & _1237;
    assign _3131 = _3130 & _1242;
    assign _3532 = _3131 & _3531;
    assign _3535 = _3532 ? _2850 : _1067;
    assign _129 = _3535;
    always @(posedge _277) begin
        if (_275)
            _1677 <= _1067;
        else
            _1677 <= _129;
    end
    assign _1681 = _1677 & _1680;
    assign _1667 = ~ _598;
    assign _3542 = ~ _3541;
    assign _3538 = _2733 | _2743;
    assign _3536 = _2490 | _2695;
    assign _3537 = _2455 | _3536;
    assign _3539 = _3537 | _3538;
    assign _3543 = _3539 & _3542;
    assign f_rx_push = _3543;
    assign _1668 = f_rx_push & _1667;
    assign _3544 = _1668 ^ _1681;
    assign _3550 = _3544 ? _3549 : _131;
    always @(posedge _277) begin
        if (_275)
            _3553 <= _1639;
        else
            _3553 <= _3550;
    end
    assign _131 = _3553;
    assign _598 = _131 == _597;
    assign _594 = _593[0:0];
    assign _5214 = _589[7:1];
    assign _5215 = { vdd,
                     _5214 };
    assign _5212 = _5204[7:7];
    assign _5211 = _5204[6:6];
    assign _5210 = _5204[5:5];
    assign _5209 = _5204[4:4];
    assign _5208 = _5204[3:3];
    assign _5207 = _5204[2:2];
    assign _5206 = _5204[1:1];
    assign _5205 = _5204[0:0];
    assign _5213 = { _5205,
                     _5206,
                     _5207,
                     _5208,
                     _5209,
                     _5210,
                     _5211,
                     _5212 };
    assign _5197 = _224 + _3359;
    assign _5195 = _224 - _3359;
    assign _5198 = _3580 ? _5197 : _5195;
    assign _2458 = _224 == _597;
    assign _3579 = ~ _2458;
    assign _3576 = ~ _2456;
    assign _3559 = _3556 ? _2850 : _1067;
    assign _132 = _3559;
    always @(posedge _277) begin
        if (_275)
            _3029 <= _1067;
        else
            _3029 <= _132;
    end
    assign _3577 = _3029 & _3576;
    assign _2453 = ~ _2419;
    assign _2447 = g_bitpos + _2203;
    assign _2442 = ~ _2377;
    assign g_tx_bit = _2432 & _2440;
    assign _2443 = g_tx_bit & _2442;
    assign _2444 = _2443 & g_data_left;
    assign _2445 = _2413 | _2444;
    assign _2448 = _2445 ? _2447 : g_bitpos;
    assign _2450 = _2448 == _1075;
    assign _2451 = ~ _2450;
    assign _2422 = _2421 & _2256;
    assign _2452 = _2422 & _2451;
    assign _2454 = _2452 & _2453;
    assign _2418 = g_bitpos == _2239;
    assign _2405 = g_cnt[5:0];
    assign _2410 = _2405 < _2409;
    assign _2411 = ~ _2410;
    assign _2401 = g_cnt[15:6];
    assign _2403 = _2401 == _1079;
    assign _2404 = ~ _2403;
    assign _2412 = _2404 | _2411;
    assign _5180 = ~ _2258;
    assign _5181 = _2256 & _5180;
    assign _5184 = _5181 ? _1274 : _1275;
    assign _5173 = ~ _2440;
    assign _5174 = _2432 & _5173;
    assign _5175 = _613 | _5174;
    assign _5176 = _5175 | _5165;
    assign _5178 = _5176 ? _1275 : _5172;
    assign _5159 = g_run + _2203;
    assign _5156 = g_run + _2203;
    assign _5152 = vdd == g_last;
    assign _5150 = g_run == _1075;
    assign _5151 = ~ _5150;
    assign _5153 = _5151 & _5152;
    assign _5157 = _5153 ? _5156 : _2203;
    assign _5148 = _2368 == _1275;
    assign _5160 = _5148 ? _5159 : _5157;
    assign _5161 = _5160 == _2375;
    assign _5142 = g_run + _2203;
    assign _5138 = gnd == g_last;
    assign _5136 = g_run == _1075;
    assign _5137 = ~ _5136;
    assign _5139 = _5137 & _5138;
    assign _5143 = _5139 ? _5142 : _2203;
    assign _5134 = _2368 == _1275;
    assign _5145 = _5134 ? _1075 : _5143;
    assign _5146 = _5145 == _2375;
    assign _5162 = _2905 ? _5161 : _5146;
    assign _5163 = _2371 & _5162;
    assign _5164 = ~ _5163;
    assign _5130 = g_left == _3359;
    assign _5128 = g_left == _1639;
    assign _5131 = _3475 ? _5130 : _5128;
    assign _5123 = g_cnt + _5461;
    assign _5124 = _5123 == _2398;
    assign _5121 = g_cnt == _2398;
    assign _5125 = _2400 ? _5124 : _5121;
    assign _5119 = ~ _2914;
    assign _5120 = _2364 & _5119;
    assign _5126 = _5120 & _5125;
    assign _5132 = _5126 & _5131;
    assign _5165 = _5132 & _5164;
    assign _5167 = _5165 ? _1333 : _5118;
    assign _5169 = _2914 ? _1395 : _5167;
    assign _5115 = _2440 ? _5113 : _1333;
    assign _5111 = _2283 & _2281;
    assign _5113 = _5111 ? _1275 : g_mode_0;
    assign _5116 = _2432 ? _5115 : _5113;
    assign _3799 = _2440 ? _3798 : _3562;
    assign _3800 = _2432 ? _3799 : _3562;
    assign _133 = _3800;
    always @(posedge _277) begin
        if (_275)
            _3562 <= _1067;
        else
            _3562 <= _133;
    end
    assign _3812 = ~ _3798;
    assign _3810 = ~ f_lane0_out;
    assign _3811 = _3798 ? f_lane0_out : _3810;
    always @* begin
        case (_2284)
        0:
            _3813 <= _3798;
        1:
            _3813 <= _3811;
        2:
            _3813 <= _3812;
        default:
            _3813 <= _3798;
        endcase
    end
    assign _3814 = _2440 ? _3813 : _2850;
    assign _3815 = _2432 ? _3814 : f_lane0_out;
    assign _3807 = ~ _2431;
    assign _3804 = _2284 == _1275;
    assign _3801 = ~ _2256;
    assign _3802 = _2252 & _3801;
    assign _3805 = _3802 & _3804;
    assign _3806 = _3805 & _2363;
    assign _3808 = _3806 & _3807;
    assign _3816 = _3808 ? _3562 : _3815;
    assign _3818 = _2892 ? _2850 : _3816;
    assign _3820 = _2421 ? _2850 : _3818;
    assign _3822 = _2878 ? _2850 : _3820;
    assign _3824 = _2463 ? _2850 : _3822;
    assign _134 = _3824;
    always @(posedge _277) begin
        if (_275)
            f_lane0_out <= vdd;
        else
            f_lane0_out <= _134;
    end
    assign _2890 = _2274 == f_lane0_out;
    assign _2891 = ~ _2890;
    assign _2339 = _2324 == _1174;
    assign _2336 = _2335 == _2324;
    assign _2329 = _2293 == _2324;
    assign _2337 = _2328 ? _2336 : _2329;
    assign _2340 = _2289 ? _2339 : _2337;
    assign _2363 = _2258 ? _2362 : _2340;
    assign _2886 = _2284 == _1275;
    assign _2887 = ~ _2886;
    assign _2883 = ~ _2258;
    assign _2881 = _2255[6:6];
    assign _3014 = _2283 | _2252;
    assign _5086 = ~ _2498;
    assign _5087 = _2496 & _5086;
    assign _5090 = _5087 ? _1274 : _1275;
    assign _5079 = ~ _2680;
    assign _5080 = _2672 & _5079;
    assign _5081 = _627 | _5080;
    assign _5082 = _5081 | _5071;
    assign _5084 = _5082 ? _1275 : _5078;
    assign _5065 = g_run_0 + _2203;
    assign _5062 = g_run_0 + _2203;
    assign _5058 = vdd == g_last_0;
    assign _5056 = g_run_0 == _1075;
    assign _5057 = ~ _5056;
    assign _5059 = _5057 & _5058;
    assign _5063 = _5059 ? _5062 : _2203;
    assign _5054 = _2608 == _1275;
    assign _5066 = _5054 ? _5065 : _5063;
    assign _5067 = _5066 == _2615;
    assign _5048 = g_run_0 + _2203;
    assign _5044 = gnd == g_last_0;
    assign _5042 = g_run_0 == _1075;
    assign _5043 = ~ _5042;
    assign _5045 = _5043 & _5044;
    assign _5049 = _5045 ? _5048 : _2203;
    assign _5040 = _2608 == _1275;
    assign _5051 = _5040 ? _1075 : _5049;
    assign _5052 = _5051 == _2615;
    assign _5068 = _2950 ? _5067 : _5052;
    assign _5069 = _2611 & _5068;
    assign _5070 = ~ _5069;
    assign _5036 = g_left_0 == _3359;
    assign _5034 = g_left_0 == _1639;
    assign _5037 = _3335 ? _5036 : _5034;
    assign _5029 = g_cnt_0 + _5461;
    assign _5030 = _5029 == _2638;
    assign _5027 = g_cnt_0 == _2638;
    assign _5031 = _2640 ? _5030 : _5027;
    assign _5025 = ~ _2959;
    assign _5026 = _2604 & _5025;
    assign _5032 = _5026 & _5031;
    assign _5038 = _5032 & _5037;
    assign _5071 = _5038 & _5070;
    assign _5073 = _5071 ? _1333 : _5024;
    assign _5075 = _2959 ? _1395 : _5073;
    assign _5021 = _2680 ? _5019 : _1333;
    assign _5017 = _2523 & _2521;
    assign _5019 = _5017 ? _1275 : g_mode;
    assign _5022 = _2672 ? _5021 : _5019;
    assign _3856 = _2680 ? _3855 : _3827;
    assign _3857 = _2672 ? _3856 : _3827;
    assign _135 = _3857;
    always @(posedge _277) begin
        if (_275)
            _3827 <= _1067;
        else
            _3827 <= _135;
    end
    assign _4884 = ~ _3855;
    assign _4882 = ~ f_lane1_out;
    assign _4883 = _3855 ? f_lane1_out : _4882;
    always @* begin
        case (_2524)
        0:
            _4885 <= _3855;
        1:
            _4885 <= _4883;
        2:
            _4885 <= _4884;
        default:
            _4885 <= _3855;
        endcase
    end
    assign _2615 = _2607[4:2];
    assign _4854 = g_run_0 + _2203;
    assign _4855 = _2950 ? _4854 : _1075;
    assign _4850 = g_run_0 + _2203;
    assign _4846 = _2950 == g_last_0;
    assign _4844 = g_run_0 == _1075;
    assign _4845 = ~ _4844;
    assign _4847 = _4845 & _4846;
    assign _4851 = _4847 ? _4850 : _2203;
    assign _4842 = _2608 == _1275;
    assign _4856 = _4842 ? _4855 : _4851;
    assign _4857 = _2959 ? _4840 : _4856;
    assign _4836 = g_run_0 + _2203;
    assign _4837 = _3855 ? _4836 : _1075;
    assign _4832 = g_run_0 + _2203;
    assign _3852 = _3844[7:7];
    assign _3851 = _3844[6:6];
    assign _3850 = _3844[5:5];
    assign _3849 = _3844[4:4];
    assign _3848 = _3844[3:3];
    assign _3847 = _3844[2:2];
    assign _3846 = _3844[1:1];
    assign _3842 = _3834[7:7];
    assign _3841 = _3834[6:6];
    assign _3840 = _3834[5:5];
    assign _3839 = _3834[4:4];
    assign _3838 = _3834[3:3];
    assign _3837 = _3834[2:2];
    assign _3836 = _3834[1:1];
    assign _3771 = _3583 == _1876;
    assign _3772 = _3580 & _3771;
    always @(posedge _277) begin
        if (_275)
            _3773 <= _1283;
        else
            if (_3772)
                _3773 <= _3573;
    end
    assign _3765 = _3583 == _1870;
    assign _3766 = _3580 & _3765;
    always @(posedge _277) begin
        if (_275)
            _3767 <= _1283;
        else
            if (_3766)
                _3767 <= _3573;
    end
    assign _3759 = _3583 == _1864;
    assign _3760 = _3580 & _3759;
    always @(posedge _277) begin
        if (_275)
            _3761 <= _1283;
        else
            if (_3760)
                _3761 <= _3573;
    end
    assign _3753 = _3583 == _1858;
    assign _3754 = _3580 & _3753;
    always @(posedge _277) begin
        if (_275)
            _3755 <= _1283;
        else
            if (_3754)
                _3755 <= _3573;
    end
    assign _3747 = _3583 == _1852;
    assign _3748 = _3580 & _3747;
    always @(posedge _277) begin
        if (_275)
            _3749 <= _1283;
        else
            if (_3748)
                _3749 <= _3573;
    end
    assign _3741 = _3583 == _1846;
    assign _3742 = _3580 & _3741;
    always @(posedge _277) begin
        if (_275)
            _3743 <= _1283;
        else
            if (_3742)
                _3743 <= _3573;
    end
    assign _3735 = _3583 == _1840;
    assign _3736 = _3580 & _3735;
    always @(posedge _277) begin
        if (_275)
            _3737 <= _1283;
        else
            if (_3736)
                _3737 <= _3573;
    end
    assign _3729 = _3583 == _1834;
    assign _3730 = _3580 & _3729;
    always @(posedge _277) begin
        if (_275)
            _3731 <= _1283;
        else
            if (_3730)
                _3731 <= _3573;
    end
    assign _3723 = _3583 == _1828;
    assign _3724 = _3580 & _3723;
    always @(posedge _277) begin
        if (_275)
            _3725 <= _1283;
        else
            if (_3724)
                _3725 <= _3573;
    end
    assign _3717 = _3583 == _1822;
    assign _3718 = _3580 & _3717;
    always @(posedge _277) begin
        if (_275)
            _3719 <= _1283;
        else
            if (_3718)
                _3719 <= _3573;
    end
    assign _3711 = _3583 == _1816;
    assign _3712 = _3580 & _3711;
    always @(posedge _277) begin
        if (_275)
            _3713 <= _1283;
        else
            if (_3712)
                _3713 <= _3573;
    end
    assign _3705 = _3583 == _1810;
    assign _3706 = _3580 & _3705;
    always @(posedge _277) begin
        if (_275)
            _3707 <= _1283;
        else
            if (_3706)
                _3707 <= _3573;
    end
    assign _3699 = _3583 == _1804;
    assign _3700 = _3580 & _3699;
    always @(posedge _277) begin
        if (_275)
            _3701 <= _1283;
        else
            if (_3700)
                _3701 <= _3573;
    end
    assign _3693 = _3583 == _1798;
    assign _3694 = _3580 & _3693;
    always @(posedge _277) begin
        if (_275)
            _3695 <= _1283;
        else
            if (_3694)
                _3695 <= _3573;
    end
    assign _3687 = _3583 == _1792;
    assign _3688 = _3580 & _3687;
    always @(posedge _277) begin
        if (_275)
            _3689 <= _1283;
        else
            if (_3688)
                _3689 <= _3573;
    end
    assign _3681 = _3583 == _1786;
    assign _3682 = _3580 & _3681;
    always @(posedge _277) begin
        if (_275)
            _3683 <= _1283;
        else
            if (_3682)
                _3683 <= _3573;
    end
    assign _3675 = _3583 == _1780;
    assign _3676 = _3580 & _3675;
    always @(posedge _277) begin
        if (_275)
            _3677 <= _1283;
        else
            if (_3676)
                _3677 <= _3573;
    end
    assign _3669 = _3583 == _1774;
    assign _3670 = _3580 & _3669;
    always @(posedge _277) begin
        if (_275)
            _3671 <= _1283;
        else
            if (_3670)
                _3671 <= _3573;
    end
    assign _3663 = _3583 == _1768;
    assign _3664 = _3580 & _3663;
    always @(posedge _277) begin
        if (_275)
            _3665 <= _1283;
        else
            if (_3664)
                _3665 <= _3573;
    end
    assign _3657 = _3583 == _1762;
    assign _3658 = _3580 & _3657;
    always @(posedge _277) begin
        if (_275)
            _3659 <= _1283;
        else
            if (_3658)
                _3659 <= _3573;
    end
    assign _3651 = _3583 == _1756;
    assign _3652 = _3580 & _3651;
    always @(posedge _277) begin
        if (_275)
            _3653 <= _1283;
        else
            if (_3652)
                _3653 <= _3573;
    end
    assign _3645 = _3583 == _1750;
    assign _3646 = _3580 & _3645;
    always @(posedge _277) begin
        if (_275)
            _3647 <= _1283;
        else
            if (_3646)
                _3647 <= _3573;
    end
    assign _3639 = _3583 == _1744;
    assign _3640 = _3580 & _3639;
    always @(posedge _277) begin
        if (_275)
            _3641 <= _1283;
        else
            if (_3640)
                _3641 <= _3573;
    end
    assign _3633 = _3583 == _1738;
    assign _3634 = _3580 & _3633;
    always @(posedge _277) begin
        if (_275)
            _3635 <= _1283;
        else
            if (_3634)
                _3635 <= _3573;
    end
    assign _3627 = _3583 == _1732;
    assign _3628 = _3580 & _3627;
    always @(posedge _277) begin
        if (_275)
            _3629 <= _1283;
        else
            if (_3628)
                _3629 <= _3573;
    end
    assign _3621 = _3583 == _1726;
    assign _3622 = _3580 & _3621;
    always @(posedge _277) begin
        if (_275)
            _3623 <= _1283;
        else
            if (_3622)
                _3623 <= _3573;
    end
    assign _3615 = _3583 == _1720;
    assign _3616 = _3580 & _3615;
    always @(posedge _277) begin
        if (_275)
            _3617 <= _1283;
        else
            if (_3616)
                _3617 <= _3573;
    end
    assign _3609 = _3583 == _1714;
    assign _3610 = _3580 & _3609;
    always @(posedge _277) begin
        if (_275)
            _3611 <= _1283;
        else
            if (_3610)
                _3611 <= _3573;
    end
    assign _3603 = _3583 == _1708;
    assign _3604 = _3580 & _3603;
    always @(posedge _277) begin
        if (_275)
            _3605 <= _1283;
        else
            if (_3604)
                _3605 <= _3573;
    end
    assign _3597 = _3583 == _1702;
    assign _3598 = _3580 & _3597;
    always @(posedge _277) begin
        if (_275)
            _3599 <= _1283;
        else
            if (_3598)
                _3599 <= _3573;
    end
    assign _3591 = _3583 == _1696;
    assign _3592 = _3580 & _3591;
    always @(posedge _277) begin
        if (_275)
            _3593 <= _1283;
        else
            if (_3592)
                _3593 <= _3573;
    end
    assign _3859 = _3583 + _1696;
    assign _3860 = _3580 ? _3859 : _3583;
    assign _136 = _3860;
    always @(posedge _277) begin
        if (_275)
            _3583 <= _1690;
        else
            _3583 <= _136;
    end
    assign _3585 = _3583 == _1690;
    assign _3586 = _3580 & _3585;
    assign _3924 = _2413 ? _3923 : g_byte;
    assign _3925 = _2419 ? _3923 : _3924;
    assign _3875 = _3874 ? _3872 : _3865;
    assign _3873 = _3862 ? _3872 : _3865;
    assign _3876 = _2699 ? _3875 : _3873;
    assign _137 = _3876;
    always @(posedge _277) begin
        if (_275)
            _3865 <= _1283;
        else
            _3865 <= _137;
    end
    assign _3871 = _2653 ? _3870 : g_byte_0;
    assign _3872 = _2659 ? _3870 : _3871;
    assign _3917 = _2490 ? _3865 : _3872;
    assign _3884 = _3883 ? _593 : _3881;
    assign _3882 = _3878 ? _593 : _3881;
    assign _3885 = _2750 ? _3884 : _3882;
    assign _138 = _3885;
    always @(posedge _277) begin
        if (_275)
            _3881 <= _1283;
        else
            _3881 <= _138;
    end
    assign _3902 = _593[6:0];
    assign _3903 = { _3902,
                     _3899 };
    assign _3900 = _593[7:1];
    assign _3898 = _307[7:7];
    assign _3897 = _307[6:6];
    assign _3896 = _307[5:5];
    assign _3895 = _307[4:4];
    assign _3894 = _307[3:3];
    assign _3893 = _307[2:2];
    assign _3892 = _307[1:1];
    assign _3891 = _307[0:0];
    assign _3889 = _712[102:100];
    assign _3888 = _706[102:100];
    assign _3887 = _700[102:100];
    assign _3886 = _300[102:100];
    always @* begin
        case (f_winner)
        0:
            _3890 <= _3886;
        1:
            _3890 <= _3887;
        2:
            _3890 <= _3888;
        default:
            _3890 <= _3889;
        endcase
    end
    always @* begin
        case (_3890)
        0:
            _3899 <= _3891;
        1:
            _3899 <= _3892;
        2:
            _3899 <= _3893;
        3:
            _3899 <= _3894;
        4:
            _3899 <= _3895;
        5:
            _3899 <= _3896;
        6:
            _3899 <= _3897;
        default:
            _3899 <= _3898;
        endcase
    end
    assign _3901 = { _3899,
                     _3900 };
    always @* begin
        case (_2740)
        0:
            _3904 <= _593;
        1:
            _3904 <= _3901;
        2:
            _3904 <= _3903;
        default:
            _3904 <= _593;
        endcase
    end
    assign _3905 = _1394 ? _3904 : _593;
    assign _139 = _3905;
    always @(posedge _277) begin
        if (_275)
            _593 <= _1283;
        else
            _593 <= _139;
    end
    assign _3883 = _2733 & _2743;
    assign _3909 = _3883 ? _2733 : _1067;
    assign _3877 = ~ _2733;
    assign _3878 = _3877 & _2743;
    assign _3907 = _3878 ? _2850 : _2733;
    assign _2737 = _712[97:96];
    assign _2736 = _706[97:96];
    assign _2735 = _700[97:96];
    assign _2734 = _300[97:96];
    always @* begin
        case (f_winner)
        0:
            _2738 <= _2734;
        1:
            _2738 <= _2735;
        2:
            _2738 <= _2736;
        default:
            _2738 <= _2737;
        endcase
    end
    assign _2740 = _1393 ? _1395 : _2738;
    assign f_eng_push = _2740 == _1333;
    assign _2743 = _1394 & f_eng_push;
    assign _2749 = _2733 | _2743;
    assign _2746 = _2490 | _2695;
    assign _2747 = ~ _2746;
    assign _2745 = ~ _2455;
    assign _2748 = _2745 & _2747;
    assign _2750 = _2748 & _2749;
    assign _3910 = _2750 ? _3909 : _3907;
    assign _140 = _3910;
    always @(posedge _277) begin
        if (_275)
            _2733 <= _1067;
        else
            _2733 <= _140;
    end
    assign _3916 = _2733 ? _3881 : _593;
    assign _3874 = _2490 & _2695;
    assign _3914 = _3874 ? _2490 : _1067;
    assign _2693 = ~ _2659;
    assign _2687 = g_bitpos_0 + _2203;
    assign _2682 = ~ _2617;
    assign g_tx_bit_0 = _2672 & _2680;
    assign _2683 = g_tx_bit_0 & _2682;
    assign _2684 = _2683 & g_data_left_0;
    assign _2685 = _2653 | _2684;
    assign _2688 = _2685 ? _2687 : g_bitpos_0;
    assign _2690 = _2688 == _1075;
    assign _2691 = ~ _2690;
    assign _2662 = _2661 & _2496;
    assign _2692 = _2662 & _2691;
    assign _2694 = _2692 & _2693;
    assign _2658 = g_bitpos_0 == _2239;
    assign _2659 = _2653 & _2658;
    assign _2695 = _2659 | _2694;
    assign _3861 = ~ _2490;
    assign _3862 = _3861 & _2695;
    assign _3912 = _3862 ? _2850 : _2490;
    assign _3915 = _2699 ? _3914 : _3912;
    assign _141 = _3915;
    always @(posedge _277) begin
        if (_275)
            _2490 <= _1067;
        else
            _2490 <= _141;
    end
    assign _2698 = _2490 | _2695;
    assign _2697 = ~ _2455;
    assign _2699 = _2697 & _2698;
    assign _3918 = _2699 ? _3917 : _3916;
    assign _3926 = _2455 ? _3925 : _3918;
    assign _142 = _3926;
    assign _143 = _142;
    assign _3555 = _1245 == _1360;
    assign _3556 = _1244 & _3555;
    assign _3927 = _3556 ? _1261 : _3572;
    assign _144 = _3927;
    always @(posedge _277) begin
        if (_275)
            _3572 <= _1283;
        else
            _3572 <= _144;
    end
    assign _3573 = _223 ? _143 : _3572;
    always @(posedge _277) begin
        if (_275)
            _3587 <= _1283;
        else
            if (_3586)
                _3587 <= _3573;
    end
    assign _4456 = _3569 + _1696;
    assign _4453 = ~ _596;
    assign _2843 = ~ _596;
    assign _2842 = _2672 & _2841;
    assign _2844 = _2842 & _2843;
    assign _2835 = ~ _596;
    assign _2832 = g_bitpos == _1075;
    assign _2375 = _2367[4:2];
    assign _4324 = g_run + _2203;
    assign _4325 = _2905 ? _4324 : _1075;
    assign _4320 = g_run + _2203;
    assign _4316 = _2905 == g_last;
    assign _4314 = g_run == _1075;
    assign _4315 = ~ _4314;
    assign _4317 = _4315 & _4316;
    assign _4321 = _4317 ? _4320 : _2203;
    assign _4312 = _2368 == _1275;
    assign _4326 = _4312 ? _4325 : _4321;
    assign _4327 = _2914 ? _4310 : _4326;
    assign _4306 = g_run + _2203;
    assign _4307 = _3798 ? _4306 : _1075;
    assign _4302 = g_run + _2203;
    assign _4298 = _3798 == g_last;
    assign _4296 = g_run == _1075;
    assign _4297 = ~ _4296;
    assign _4299 = _4297 & _4298;
    assign _4303 = _4299 ? _4302 : _2203;
    assign _4294 = _2368 == _1275;
    assign _4308 = _4294 ? _4307 : _4303;
    assign _3947 = _3946 ? _3944 : g_lim;
    assign _3948 = g_len_cap ? _3947 : g_lim;
    assign _145 = _3948;
    always @(posedge _277) begin
        if (_275)
            g_lim <= _1283;
        else
            g_lim <= _145;
    end
    assign _2397 = { _1283,
                     g_lim };
    assign _3956 = _218[0:0];
    assign _3957 = ~ _3956;
    assign _3952 = _1331[4:0];
    assign _3954 = _3952 == _1810;
    assign _3949 = _1331[5:5];
    assign _3951 = _3949 == _1067;
    assign _3955 = _3951 & _3954;
    assign _3958 = _3955 & _3957;
    assign _3959 = _3958 ? _1261 : _2391;
    assign _3960 = _3062 ? _3959 : _2391;
    assign _146 = _3960;
    always @(posedge _277) begin
        if (_275)
            _2391 <= _1283;
        else
            _2391 <= _146;
    end
    assign _3968 = _218[0:0];
    assign _3969 = ~ _3968;
    assign _3964 = _1331[4:0];
    assign _3966 = _3964 == _1816;
    assign _3961 = _1331[5:5];
    assign _3963 = _3961 == _1067;
    assign _3967 = _3963 & _3966;
    assign _3970 = _3967 & _3969;
    assign _3971 = _3970 ? _1261 : _2388;
    assign _3972 = _3062 ? _3971 : _2388;
    assign _147 = _3972;
    always @(posedge _277) begin
        if (_275)
            _2388 <= _1283;
        else
            _2388 <= _147;
    end
    assign _2392 = { _2388,
                     _2391 };
    assign _3391 = g_sr[14:0];
    assign _3392 = { _3391,
                     _2905 };
    assign _3973 = _2378 ? _3392 : g_sr;
    assign _3974 = _2914 ? g_sr : _3973;
    assign _3975 = _2364 ? _3974 : g_sr;
    assign _3977 = _2878 ? _1174 : _3975;
    assign _148 = _3977;
    always @(posedge _277) begin
        if (_275)
            g_sr <= _1174;
        else
            g_sr <= _148;
    end
    assign _3939 = g_sr[3:0];
    assign _3985 = _218[0:0];
    assign _3986 = ~ _3985;
    assign _3981 = _1331[4:0];
    assign _3983 = _3981 == _1828;
    assign _3978 = _1331[5:5];
    assign _3980 = _3978 == _1067;
    assign _3984 = _3980 & _3983;
    assign _3987 = _3984 & _3986;
    assign _3988 = _3987 ? _1261 : _3937;
    assign _3989 = _3062 ? _3988 : _3937;
    assign _149 = _3989;
    always @(posedge _277) begin
        if (_275)
            _3937 <= _1283;
        else
            _3937 <= _149;
    end
    assign _3938 = _3937[3:0];
    assign _3940 = _3938 < _3939;
    assign _3941 = _3940 ? _3938 : _3939;
    assign _3943 = { _1067,
                     _3941,
                     _1075 };
    assign _2409 = _2408[5:0];
    assign _3933 = { _1395,
                     _2409 };
    assign _3944 = _3933 + _3943;
    assign _3945 = { _1283,
                     _3944 };
    assign _3946 = _3945 < _2392;
    assign _4015 = _3946 ? _2850 : g_len_known;
    assign _3997 = g_cnt[5:0];
    assign _4002 = _3997 == _4001;
    assign _3993 = g_cnt[15:6];
    assign _3995 = _3993 == _1079;
    assign _3991 = ~ _3386;
    assign _3990 = _2408[7:7];
    assign _3992 = _3990 & _3991;
    assign _3996 = _3992 & _3995;
    assign _4003 = _3996 & _4002;
    assign _4005 = _4003 ? _2850 : g_len_cap;
    assign _4006 = _2400 ? _4005 : g_len_cap;
    assign _4007 = _2378 ? _4006 : g_len_cap;
    assign _4008 = _2914 ? g_len_cap : _4007;
    assign _4009 = _2364 ? _4008 : g_len_cap;
    assign _4011 = g_len_cap ? _1067 : _4009;
    assign _4013 = _2878 ? _1067 : _4011;
    assign _150 = _4013;
    always @(posedge _277) begin
        if (_275)
            g_len_cap <= _1067;
        else
            g_len_cap <= _150;
    end
    assign _4016 = g_len_cap ? _4015 : g_len_known;
    assign _4018 = _2878 ? _1067 : _4016;
    assign _151 = _4018;
    always @(posedge _277) begin
        if (_275)
            g_len_known <= _1067;
        else
            g_len_known <= _151;
    end
    assign _2398 = g_len_known ? _2397 : _2392;
    assign _4286 = g_cnt + _5461;
    assign _4287 = _2400 ? _4286 : _4284;
    assign _4288 = _2378 ? _4287 : _4284;
    assign _4269 = _2914 ? _4268 : _2905;
    assign _3795 = _3787[7:7];
    assign _3794 = _3787[6:6];
    assign _3793 = _3787[5:5];
    assign _3792 = _3787[4:4];
    assign _3791 = _3787[3:3];
    assign _3790 = _3787[2:2];
    assign _3789 = _3787[1:1];
    assign _3785 = _3777[7:7];
    assign _3784 = _3777[6:6];
    assign _3783 = _3777[5:5];
    assign _3782 = _3777[4:4];
    assign _3781 = _3777[3:3];
    assign _3780 = _3777[2:2];
    assign _3779 = _3777[1:1];
    assign _3776 = _596 ? _1281 : _3774;
    assign _3921 = g_byte[7:1];
    assign _3922 = { _2905,
                     _3921 };
    assign _3919 = g_byte[6:0];
    assign _3920 = { _3919,
                     _2905 };
    assign _3923 = _3563 ? _3922 : _3920;
    assign _4023 = _2413 ? _3923 : _4022;
    assign _4024 = _2400 ? _4023 : _4022;
    assign _4025 = _2378 ? _4024 : _4022;
    assign _4026 = _2914 ? _4022 : _4025;
    assign _4019 = g_data_left ? _3777 : g_byte;
    assign _4020 = _2377 ? g_byte : _4019;
    assign _4021 = _2440 ? _4020 : g_byte;
    assign _4022 = _2432 ? _4021 : g_byte;
    assign _4027 = _2364 ? _4026 : _4022;
    assign _152 = _4027;
    always @(posedge _277) begin
        if (_275)
            g_byte <= _1283;
        else
            g_byte <= _152;
    end
    assign _3777 = _2833 ? _3776 : g_byte;
    assign _3778 = _3777[0:0];
    assign _3786 = { _3778,
                     _3779,
                     _3780,
                     _3781,
                     _3782,
                     _3783,
                     _3784,
                     _3785 };
    assign _3563 = _2255[5:5];
    assign _3787 = _3563 ? _3777 : _3786;
    assign _3788 = _3787[0:0];
    assign _4035 = g_bitpos + _2203;
    assign _4036 = _2413 ? _4035 : _4033;
    assign _4037 = _2400 ? _4036 : _4033;
    assign _4038 = _2378 ? _4037 : _4033;
    assign _4039 = _2914 ? _4033 : _4038;
    assign _4029 = g_bitpos + _2203;
    assign _4030 = g_data_left ? _4029 : g_bitpos;
    assign _4031 = _2377 ? g_bitpos : _4030;
    assign _4032 = _2440 ? _4031 : g_bitpos;
    assign _4033 = _2432 ? _4032 : g_bitpos;
    assign _4040 = _2364 ? _4039 : _4033;
    assign _4042 = _2878 ? _1075 : _4040;
    assign _153 = _4042;
    always @(posedge _277) begin
        if (_275)
            g_bitpos <= _1075;
        else
            g_bitpos <= _153;
    end
    always @* begin
        case (g_bitpos)
        0:
            _3796 <= _3788;
        1:
            _3796 <= _3789;
        2:
            _3796 <= _3790;
        3:
            _3796 <= _3791;
        4:
            _3796 <= _3792;
        5:
            _3796 <= _3793;
        6:
            _3796 <= _3794;
        default:
            _3796 <= _3795;
        endcase
    end
    assign _3480 = _2255[7:7];
    assign _4053 = _218[0:0];
    assign _4054 = ~ _4053;
    assign _4049 = _1331[4:0];
    assign _4051 = _4049 == _1762;
    assign _4046 = _1331[5:5];
    assign _4048 = _4046 == _1067;
    assign _4052 = _4048 & _4051;
    assign _4055 = _4052 & _4054;
    assign _4056 = _4055 ? _1261 : _4045;
    assign _4057 = _3062 ? _4056 : _4045;
    assign _154 = _4057;
    always @(posedge _277) begin
        if (_275)
            _4045 <= _1283;
        else
            _4045 <= _154;
    end
    assign _4068 = _218[0:0];
    assign _4069 = ~ _4068;
    assign _4064 = _1331[4:0];
    assign _4066 = _4064 == _1768;
    assign _4061 = _1331[5:5];
    assign _4063 = _4061 == _1067;
    assign _4067 = _4063 & _4066;
    assign _4070 = _4067 & _4069;
    assign _4071 = _4070 ? _1261 : _4060;
    assign _4072 = _3062 ? _4071 : _4060;
    assign _155 = _4072;
    always @(posedge _277) begin
        if (_275)
            _4060 <= _1283;
        else
            _4060 <= _155;
    end
    assign _4083 = _218[0:0];
    assign _4084 = ~ _4083;
    assign _4079 = _1331[4:0];
    assign _4081 = _4079 == _1774;
    assign _4076 = _1331[5:5];
    assign _4078 = _4076 == _1067;
    assign _4082 = _4078 & _4081;
    assign _4085 = _4082 & _4084;
    assign _4086 = _4085 ? _1261 : _4075;
    assign _4087 = _3062 ? _4086 : _4075;
    assign _156 = _4087;
    always @(posedge _277) begin
        if (_275)
            _4075 <= _1283;
        else
            _4075 <= _156;
    end
    assign _4098 = _218[0:0];
    assign _4099 = ~ _4098;
    assign _4094 = _1331[4:0];
    assign _4096 = _4094 == _1780;
    assign _4091 = _1331[5:5];
    assign _4093 = _4091 == _1067;
    assign _4097 = _4093 & _4096;
    assign _4100 = _4097 & _4099;
    assign _4101 = _4100 ? _1261 : _4090;
    assign _4102 = _3062 ? _4101 : _4090;
    assign _157 = _4102;
    always @(posedge _277) begin
        if (_275)
            _4090 <= _1283;
        else
            _4090 <= _157;
    end
    assign _4263 = { _4090,
                     _4075,
                     _4060,
                     _4045 };
    assign _4256 = g_crc[30:0];
    assign _4258 = { _4256,
                     _1067 };
    assign _4249 = g_crc[31:31];
    assign _4250 = _2905 ^ _4249;
    assign _4252 = _4250 ? _4229 : _1250;
    assign _4246 = g_crc[30:0];
    assign _4248 = { _4246,
                     _1067 };
    assign _4253 = _4248 ^ _4252;
    assign _4110 = _218[0:0];
    assign _4111 = ~ _4110;
    assign _4106 = _1331[4:0];
    assign _4108 = _4106 == _1822;
    assign _4103 = _1331[5:5];
    assign _4105 = _4103 == _1067;
    assign _4109 = _4105 & _4108;
    assign _4112 = _4109 & _4111;
    assign _4113 = _4112 ? _1261 : _4000;
    assign _4114 = _3062 ? _4113 : _4000;
    assign _158 = _4114;
    always @(posedge _277) begin
        if (_275)
            _4000 <= _1283;
        else
            _4000 <= _158;
    end
    assign _4001 = _4000[5:0];
    assign _4242 = g_cnt[5:0];
    assign _4243 = _4242 < _4001;
    assign _4244 = ~ _4243;
    assign _4237 = g_cnt[15:6];
    assign _4239 = _4237 == _1079;
    assign _4240 = ~ _4239;
    assign _4122 = _218[0:0];
    assign _4123 = ~ _4122;
    assign _4118 = _1331[4:0];
    assign _4120 = _4118 == _1732;
    assign _4115 = _1331[5:5];
    assign _4117 = _4115 == _1067;
    assign _4121 = _4117 & _4120;
    assign _4124 = _4121 & _4123;
    assign _4125 = _4124 ? _1261 : _2408;
    assign _4126 = _3062 ? _4125 : _2408;
    assign _159 = _4126;
    always @(posedge _277) begin
        if (_275)
            _2408 <= _1283;
        else
            _2408 <= _159;
    end
    assign _3386 = _2408[6:6];
    assign _4236 = ~ _3386;
    assign _4241 = _4236 | _4240;
    assign _4245 = _4241 | _4244;
    assign _4254 = _4245 ? _4253 : _4235;
    assign _4255 = _2400 ? _4254 : _4235;
    assign _4137 = _218[0:0];
    assign _4138 = ~ _4137;
    assign _4133 = _1331[4:0];
    assign _4135 = _4133 == _1726;
    assign _4130 = _1331[5:5];
    assign _4132 = _4130 == _1067;
    assign _4136 = _4132 & _4135;
    assign _4139 = _4136 & _4138;
    assign _4140 = _4139 ? _1261 : _4129;
    assign _4141 = _3062 ? _4140 : _4129;
    assign _160 = _4141;
    always @(posedge _277) begin
        if (_275)
            _4129 <= _1283;
        else
            _4129 <= _160;
    end
    assign _4156 = _4129[5:0];
    assign _4151 = g_left - _3359;
    assign _4152 = _3475 ? _4151 : _4149;
    assign _4153 = _2378 ? _4152 : _4149;
    assign _4154 = _2914 ? _4149 : _4153;
    assign _4145 = g_left - _3359;
    assign _4146 = g_data_left ? g_left : _4145;
    assign _4147 = _2377 ? g_left : _4146;
    assign _4148 = _2440 ? _4147 : g_left;
    assign _4149 = _2432 ? _4148 : g_left;
    assign _4155 = _2364 ? _4154 : _4149;
    assign _4157 = _4143 ? _4156 : _4155;
    assign _4159 = _2878 ? _1639 : _4157;
    assign _161 = _4159;
    always @(posedge _277) begin
        if (_275)
            g_left <= _1639;
        else
            g_left <= _161;
    end
    assign _2438 = g_left == _1639;
    assign _2439 = ~ _2438;
    assign _3473 = ~ g_data_left;
    assign _3472 = _2364 & _2378;
    assign _3474 = _3472 & _3473;
    assign _3475 = _3474 & _2439;
    assign _4259 = _3475 ? _4258 : _4255;
    assign _2378 = ~ _2377;
    assign _4260 = _2378 ? _4259 : _4235;
    assign _4261 = _2914 ? _4235 : _4260;
    assign _4170 = _218[0:0];
    assign _4171 = ~ _4170;
    assign _4166 = _1331[4:0];
    assign _4168 = _4166 == _1738;
    assign _4163 = _1331[5:5];
    assign _4165 = _4163 == _1067;
    assign _4169 = _4165 & _4168;
    assign _4172 = _4169 & _4171;
    assign _4173 = _4172 ? _1261 : _4162;
    assign _4174 = _3062 ? _4173 : _4162;
    assign _162 = _4174;
    always @(posedge _277) begin
        if (_275)
            _4162 <= _1283;
        else
            _4162 <= _162;
    end
    assign _4185 = _218[0:0];
    assign _4186 = ~ _4185;
    assign _4181 = _1331[4:0];
    assign _4183 = _4181 == _1744;
    assign _4178 = _1331[5:5];
    assign _4180 = _4178 == _1067;
    assign _4184 = _4180 & _4183;
    assign _4187 = _4184 & _4186;
    assign _4188 = _4187 ? _1261 : _4177;
    assign _4189 = _3062 ? _4188 : _4177;
    assign _163 = _4189;
    always @(posedge _277) begin
        if (_275)
            _4177 <= _1283;
        else
            _4177 <= _163;
    end
    assign _4200 = _218[0:0];
    assign _4201 = ~ _4200;
    assign _4196 = _1331[4:0];
    assign _4198 = _4196 == _1750;
    assign _4193 = _1331[5:5];
    assign _4195 = _4193 == _1067;
    assign _4199 = _4195 & _4198;
    assign _4202 = _4199 & _4201;
    assign _4203 = _4202 ? _1261 : _4192;
    assign _4204 = _3062 ? _4203 : _4192;
    assign _164 = _4204;
    always @(posedge _277) begin
        if (_275)
            _4192 <= _1283;
        else
            _4192 <= _164;
    end
    assign _4215 = _218[0:0];
    assign _4216 = ~ _4215;
    assign _4211 = _1331[4:0];
    assign _4213 = _4211 == _1756;
    assign _4208 = _1331[5:5];
    assign _4210 = _4208 == _1067;
    assign _4214 = _4210 & _4213;
    assign _4217 = _4214 & _4216;
    assign _4218 = _4217 ? _1261 : _4207;
    assign _4219 = _3062 ? _4218 : _4207;
    assign _165 = _4219;
    always @(posedge _277) begin
        if (_275)
            _4207 <= _1283;
        else
            _4207 <= _165;
    end
    assign _4229 = { _4207,
                     _4192,
                     _4177,
                     _4162 };
    assign _4226 = g_crc[31:31];
    assign _4227 = _3798 ^ _4226;
    assign _4230 = _4227 ? _4229 : _1250;
    assign _4223 = g_crc[30:0];
    assign _4225 = { _4223,
                     _1067 };
    assign _4231 = _4225 ^ _4230;
    assign _4220 = g_crc[30:0];
    assign _4222 = { _4220,
                     _1067 };
    assign _4232 = g_data_left ? _4231 : _4222;
    assign _4233 = _2377 ? g_crc : _4232;
    assign _4234 = _2440 ? _4233 : g_crc;
    assign _4235 = _2432 ? _4234 : g_crc;
    assign _4262 = _2364 ? _4261 : _4235;
    assign _4264 = _2878 ? _4263 : _4262;
    assign _4266 = _2463 ? _1250 : _4264;
    assign _166 = _4266;
    always @(posedge _277) begin
        if (_275)
            g_crc <= _1250;
        else
            g_crc <= _166;
    end
    assign _3479 = g_crc[31:31];
    assign _3481 = _3479 ^ _3480;
    assign _3797 = g_data_left ? _3796 : _3481;
    assign _3798 = _2377 ? _2911 : _3797;
    assign _4267 = _2440 ? _3798 : g_last;
    assign _4268 = _2432 ? _4267 : g_last;
    assign _4270 = _2364 ? _4269 : _4268;
    assign _4272 = _2878 ? _2850 : _4270;
    assign _167 = _4272;
    always @(posedge _277) begin
        if (_275)
            g_last <= vdd;
        else
            g_last <= _167;
    end
    assign _2910 = ~ g_last;
    assign _2907 = _2368 == _1274;
    assign _2911 = _2907 ? _2910 : gnd;
    assign _4274 = _2284 == _1274;
    assign _4275 = _4274 ? _2274 : g_prev;
    assign _4276 = _2364 ? _4275 : g_prev;
    assign _4278 = _2878 ? _2850 : _4276;
    assign _168 = _4278;
    always @(posedge _277) begin
        if (_275)
            g_prev <= vdd;
        else
            g_prev <= _168;
    end
    assign _2904 = _2274 == g_prev;
    assign _2901 = _2284 == _1274;
    assign _2905 = _2901 ? _2904 : _2274;
    assign _2912 = _2905 == _2911;
    assign _2913 = ~ _2912;
    assign _2914 = _2377 & _2913;
    assign _4289 = _2914 ? _4284 : _4288;
    assign _4280 = g_cnt + _5461;
    assign _4281 = g_data_left ? _4280 : g_cnt;
    assign _4282 = _2377 ? g_cnt : _4281;
    assign _4283 = _2440 ? _4282 : g_cnt;
    assign _4284 = _2432 ? _4283 : g_cnt;
    assign _4290 = _2364 ? _4289 : _4284;
    assign _4292 = _2878 ? _1174 : _4290;
    assign _169 = _4292;
    always @(posedge _277) begin
        if (_275)
            g_cnt <= _1174;
        else
            g_cnt <= _169;
    end
    assign g_data_left = g_cnt < _2398;
    assign _2433 = _2377 | g_data_left;
    assign _2440 = _2433 | _2439;
    assign _4309 = _2440 ? _4308 : g_run;
    assign _4310 = _2432 ? _4309 : g_run;
    assign _4328 = _2364 ? _4327 : _4310;
    assign _4330 = _2878 ? _1075 : _4328;
    assign _170 = _4330;
    always @(posedge _277) begin
        if (_275)
            g_run <= _1075;
        else
            g_run <= _170;
    end
    assign _2376 = g_run == _2375;
    assign _4338 = _218[0:0];
    assign _4339 = ~ _4338;
    assign _4334 = _1331[4:0];
    assign _4336 = _4334 == _1720;
    assign _4331 = _1331[5:5];
    assign _4333 = _4331 == _1067;
    assign _4337 = _4333 & _4336;
    assign _4340 = _4337 & _4339;
    assign _4341 = _4340 ? _1261 : _2367;
    assign _4342 = _3062 ? _4341 : _2367;
    assign _171 = _4342;
    always @(posedge _277) begin
        if (_275)
            _2367 <= _1283;
        else
            _2367 <= _171;
    end
    assign _2368 = _2367[1:0];
    assign _2370 = _2368 == _1395;
    assign _2371 = ~ _2370;
    assign _2377 = _2371 & _2376;
    assign _2829 = ~ _2377;
    assign _2830 = _2829 & g_data_left;
    assign _2833 = _2830 & _2832;
    assign _2360 = ~ _2354;
    assign _2361 = _2357 & _2360;
    always @(posedge _277) begin
        if (_275)
            _2357 <= _1067;
        else
            _2357 <= _2354;
    end
    assign _2358 = ~ _2357;
    assign _2350 = _304[7:7];
    assign _2349 = _304[6:6];
    assign _2348 = _304[5:5];
    assign _2347 = _304[4:4];
    assign _2346 = _304[3:3];
    assign _2345 = _304[2:2];
    assign _2344 = _304[1:1];
    assign _2343 = _304[0:0];
    assign _2342 = _2261[2:0];
    always @* begin
        case (_2342)
        0:
            _2351 <= _2343;
        1:
            _2351 <= _2344;
        2:
            _2351 <= _2345;
        3:
            _2351 <= _2346;
        4:
            _2351 <= _2347;
        5:
            _2351 <= _2348;
        6:
            _2351 <= _2349;
        default:
            _2351 <= _2350;
        endcase
    end
    always @(posedge _277) begin
        if (_275)
            _2354 <= _1067;
        else
            _2354 <= _2351;
    end
    assign _2359 = _2354 & _2358;
    assign _2341 = _2255[2:2];
    assign _2362 = _2341 ? _2361 : _2359;
    assign _2428 = _2335 == _1174;
    assign _2426 = _2293 == _1174;
    assign _2327 = ~ _2283;
    assign _2318 = _2301[15:2];
    assign _2319 = { _1395,
                     _2318 };
    assign _2315 = _2301[15:1];
    assign _2316 = { _1067,
                     _2315 };
    assign _2320 = _2316 + _2319;
    assign _2312 = _2301[15:1];
    assign _2313 = { _1067,
                     _2312 };
    assign _2310 = _2256 & _2286;
    assign _2321 = _2310 ? _2320 : _2313;
    always @(posedge _277) begin
        if (_275)
            _2324 <= _1174;
        else
            _2324 <= _2321;
    end
    assign _2325 = _2293 < _2324;
    assign _2302 = _2301[15:2];
    assign _2303 = { _1395,
                     _2302 };
    always @(posedge _277) begin
        if (_275)
            _2306 <= _1174;
        else
            _2306 <= _2303;
    end
    assign _4427 = ~ _2283;
    assign _4428 = _2326 & _4427;
    assign _4429 = _4428 ? _2335 : _2293;
    assign _4431 = _2289 ? _1174 : _4429;
    assign _4433 = _4431 + _5461;
    assign _4411 = _4405 == _1134;
    assign _2331 = _2301[15:1];
    assign _2332 = { _1067,
                     _2331 };
    always @(posedge _277) begin
        if (_275)
            _2335 <= _1174;
        else
            _2335 <= _2332;
    end
    assign _4407 = { gnd,
                     _2335 };
    assign _4408 = _4407 == _4405;
    assign _4401 = { gnd,
                     _2301 };
    always @(posedge _277) begin
        if (_275)
            _4404 <= _1134;
        else
            _4404 <= _4401;
    end
    assign _4396 = 17'b00000000000000001;
    assign _4350 = _218[0:0];
    assign _4351 = ~ _4350;
    assign _4346 = _1331[4:0];
    assign _4348 = _4346 == _1690;
    assign _4343 = _1331[5:5];
    assign _4345 = _4343 == _1067;
    assign _4349 = _4345 & _4348;
    assign _4352 = _4349 & _4351;
    assign _4353 = _4352 ? _1261 : _2300;
    assign _4354 = _3062 ? _4353 : _2300;
    assign _172 = _4354;
    always @(posedge _277) begin
        if (_275)
            _2300 <= _1283;
        else
            _2300 <= _172;
    end
    assign _4362 = _218[0:0];
    assign _4363 = ~ _4362;
    assign _4358 = _1331[4:0];
    assign _4360 = _4358 == _1696;
    assign _4355 = _1331[5:5];
    assign _4357 = _4355 == _1067;
    assign _4361 = _4357 & _4360;
    assign _4364 = _4361 & _4363;
    assign _4365 = _4364 ? _1261 : _2297;
    assign _4366 = _3062 ? _4365 : _2297;
    assign _173 = _4366;
    always @(posedge _277) begin
        if (_275)
            _2297 <= _1283;
        else
            _2297 <= _173;
    end
    assign _2301 = { _2297,
                     _2300 };
    assign _4395 = { gnd,
                     _2301 };
    assign _4397 = _4395 - _4396;
    always @(posedge _277) begin
        if (_275)
            _4400 <= _1134;
        else
            _4400 <= _4397;
    end
    assign _4377 = _218[0:0];
    assign _4378 = ~ _4377;
    assign _4373 = _1331[4:0];
    assign _4375 = _4373 == _1702;
    assign _4370 = _1331[5:5];
    assign _4372 = _4370 == _1067;
    assign _4376 = _4372 & _4375;
    assign _4379 = _4376 & _4378;
    assign _4380 = _4379 ? _1261 : _4369;
    assign _4381 = _3062 ? _4380 : _4369;
    assign _174 = _4381;
    always @(posedge _277) begin
        if (_275)
            _4369 <= _1283;
        else
            _4369 <= _174;
    end
    assign _4415 = { gnd,
                     _4369 };
    assign _4417 = _4416[7:0];
    assign _4418 = _4413 ? _4417 : _4389;
    assign _4419 = _4386 ? _4418 : _4389;
    assign _4421 = _2878 ? _1283 : _4419;
    assign _175 = _4421;
    always @(posedge _277) begin
        if (_275)
            _4389 <= _1283;
        else
            _4389 <= _175;
    end
    assign _4414 = { gnd,
                     _4389 };
    assign _4416 = _4414 + _4415;
    assign _4422 = _4416[8:8];
    assign _4423 = _4413 ? _4422 : _4394;
    assign _4424 = _4386 ? _4423 : _4394;
    assign _4426 = _2878 ? _1067 : _4424;
    assign _176 = _4426;
    always @(posedge _277) begin
        if (_275)
            _4394 <= _1067;
        else
            _4394 <= _176;
    end
    assign _4405 = _4394 ? _4404 : _4400;
    assign _4391 = { gnd,
                     _2293 };
    assign _4406 = _4391 == _4405;
    assign _4409 = _2328 ? _4408 : _4406;
    assign _4412 = _2289 ? _4411 : _4409;
    assign _4390 = ~ _2258;
    assign _4413 = _4390 & _4412;
    assign _4435 = _4413 ? _1174 : _4433;
    assign _4385 = ~ _2258;
    assign _4383 = _2283 & _2281;
    assign _613 = g_mode_0 == _1333;
    assign _4382 = _2252 | _613;
    assign _4384 = _4382 | _4383;
    assign _4386 = _4384 & _4385;
    assign _4436 = _4386 ? _4435 : _2293;
    assign _4438 = _2878 ? _1174 : _4436;
    assign _177 = _4438;
    always @(posedge _277) begin
        if (_275)
            _2293 <= _1174;
        else
            _2293 <= _177;
    end
    assign _2307 = _2293 < _2306;
    assign _2308 = ~ _2307;
    assign _2290 = _2281 & _2286;
    assign _2309 = _2290 & _2308;
    assign _2326 = _2309 & _2325;
    assign _2328 = _2326 & _2327;
    assign _2429 = _2328 ? _2428 : _2426;
    assign _2284 = _2255[4:3];
    assign _2286 = _2284 == _1275;
    assign _2287 = ~ _2286;
    assign _2283 = g_mode_0 == _1274;
    assign _2288 = _2283 | _2287;
    assign _2280 = ~ _2258;
    always @(posedge _277) begin
        if (_275)
            _2277 <= _1067;
        else
            _2277 <= _2274;
    end
    assign _2270 = _304[7:7];
    assign _2269 = _304[6:6];
    assign _2268 = _304[5:5];
    assign _2267 = _304[4:4];
    assign _2266 = _304[3:3];
    assign _2265 = _304[2:2];
    assign _2264 = _304[1:1];
    assign _2263 = _304[0:0];
    assign _4446 = _218[0:0];
    assign _4447 = ~ _4446;
    assign _4442 = _1331[4:0];
    assign _4444 = _4442 == _1714;
    assign _4439 = _1331[5:5];
    assign _4441 = _4439 == _1067;
    assign _4445 = _4441 & _4444;
    assign _4448 = _4445 & _4447;
    assign _4449 = _4448 ? _1261 : _2261;
    assign _4450 = _3062 ? _4449 : _2261;
    assign _178 = _4450;
    always @(posedge _277) begin
        if (_275)
            _2261 <= _1283;
        else
            _2261 <= _178;
    end
    assign _2262 = _2261[5:3];
    always @* begin
        case (_2262)
        0:
            _2271 <= _2263;
        1:
            _2271 <= _2264;
        2:
            _2271 <= _2265;
        3:
            _2271 <= _2266;
        4:
            _2271 <= _2267;
        5:
            _2271 <= _2268;
        6:
            _2271 <= _2269;
        default:
            _2271 <= _2270;
        endcase
    end
    always @(posedge _277) begin
        if (_275)
            _2274 <= _1067;
        else
            _2274 <= _2271;
    end
    assign _2278 = _2274 ^ _2277;
    assign _2279 = _2256 & _2278;
    assign _2281 = _2279 & _2280;
    assign _2289 = _2281 & _2288;
    assign _2430 = _2289 ? vdd : _2429;
    assign _2258 = _2255[1:1];
    assign _2431 = _2258 ? _2362 : _2430;
    assign _2423 = ~ _2256;
    assign _2424 = _2252 & _2423;
    assign _2432 = _2424 & _2431;
    assign _2834 = _2432 & _2833;
    assign _2836 = _2834 & _2835;
    assign _2845 = _2836 | _2844;
    assign _2826 = _2822 == _1275;
    assign _2824 = _2822 == _1274;
    assign _2827 = _2824 | _2826;
    assign _4451 = _1394 & _2827;
    assign _4452 = _4451 | _2845;
    assign _179 = _4452;
    assign _4454 = _179 & _4453;
    assign _4457 = _4454 ? _4456 : _3569;
    assign _180 = _4457;
    always @(posedge _277) begin
        if (_275)
            _3569 <= _1690;
        else
            _3569 <= _180;
    end
    always @* begin
        case (_3569)
        0:
            _3774 <= _3587;
        1:
            _3774 <= _3593;
        2:
            _3774 <= _3599;
        3:
            _3774 <= _3605;
        4:
            _3774 <= _3611;
        5:
            _3774 <= _3617;
        6:
            _3774 <= _3623;
        7:
            _3774 <= _3629;
        8:
            _3774 <= _3635;
        9:
            _3774 <= _3641;
        10:
            _3774 <= _3647;
        11:
            _3774 <= _3653;
        12:
            _3774 <= _3659;
        13:
            _3774 <= _3665;
        14:
            _3774 <= _3671;
        15:
            _3774 <= _3677;
        16:
            _3774 <= _3683;
        17:
            _3774 <= _3689;
        18:
            _3774 <= _3695;
        19:
            _3774 <= _3701;
        20:
            _3774 <= _3707;
        21:
            _3774 <= _3713;
        22:
            _3774 <= _3719;
        23:
            _3774 <= _3725;
        24:
            _3774 <= _3731;
        25:
            _3774 <= _3737;
        26:
            _3774 <= _3743;
        27:
            _3774 <= _3749;
        28:
            _3774 <= _3755;
        29:
            _3774 <= _3761;
        30:
            _3774 <= _3767;
        default:
            _3774 <= _3773;
        endcase
    end
    assign _3833 = _596 ? _1281 : _3774;
    assign _3868 = g_byte_0[7:1];
    assign _3869 = { _2950,
                     _3868 };
    assign _3866 = g_byte_0[6:0];
    assign _3867 = { _3866,
                     _2950 };
    assign _3870 = _3828 ? _3869 : _3867;
    assign _4462 = _2653 ? _3870 : _4461;
    assign _4463 = _2640 ? _4462 : _4461;
    assign _4464 = _2618 ? _4463 : _4461;
    assign _4465 = _2959 ? _4461 : _4464;
    assign _4458 = g_data_left_0 ? _3834 : g_byte_0;
    assign _4459 = _2617 ? g_byte_0 : _4458;
    assign _4460 = _2680 ? _4459 : g_byte_0;
    assign _4461 = _2672 ? _4460 : g_byte_0;
    assign _4466 = _2604 ? _4465 : _4461;
    assign _181 = _4466;
    always @(posedge _277) begin
        if (_275)
            g_byte_0 <= _1283;
        else
            g_byte_0 <= _181;
    end
    assign _2840 = g_bitpos_0 == _1075;
    assign _2837 = ~ _2617;
    assign _2838 = _2837 & g_data_left_0;
    assign _2841 = _2838 & _2840;
    assign _3834 = _2841 ? _3833 : g_byte_0;
    assign _3835 = _3834[0:0];
    assign _3843 = { _3835,
                     _3836,
                     _3837,
                     _3838,
                     _3839,
                     _3840,
                     _3841,
                     _3842 };
    assign _3828 = _2495[5:5];
    assign _3844 = _3828 ? _3834 : _3843;
    assign _3845 = _3844[0:0];
    assign _4474 = g_bitpos_0 + _2203;
    assign _2645 = g_cnt_0[5:0];
    assign _2650 = _2645 < _2649;
    assign _2651 = ~ _2650;
    assign _2641 = g_cnt_0[15:6];
    assign _2643 = _2641 == _1079;
    assign _2644 = ~ _2643;
    assign _2652 = _2644 | _2651;
    assign _2653 = _2640 & _2652;
    assign _4475 = _2653 ? _4474 : _4472;
    assign _4476 = _2640 ? _4475 : _4472;
    assign _4477 = _2618 ? _4476 : _4472;
    assign _4478 = _2959 ? _4472 : _4477;
    assign _4468 = g_bitpos_0 + _2203;
    assign _4469 = g_data_left_0 ? _4468 : g_bitpos_0;
    assign _4470 = _2617 ? g_bitpos_0 : _4469;
    assign _4471 = _2680 ? _4470 : g_bitpos_0;
    assign _4472 = _2672 ? _4471 : g_bitpos_0;
    assign _4479 = _2604 ? _4478 : _4472;
    assign _4481 = _2923 ? _1075 : _4479;
    assign _182 = _4481;
    always @(posedge _277) begin
        if (_275)
            g_bitpos_0 <= _1075;
        else
            g_bitpos_0 <= _182;
    end
    always @* begin
        case (g_bitpos_0)
        0:
            _3853 <= _3845;
        1:
            _3853 <= _3846;
        2:
            _3853 <= _3847;
        3:
            _3853 <= _3848;
        4:
            _3853 <= _3849;
        5:
            _3853 <= _3850;
        6:
            _3853 <= _3851;
        default:
            _3853 <= _3852;
        endcase
    end
    assign _3340 = _2495[7:7];
    assign _4492 = _218[1:1];
    assign _4493 = ~ _4492;
    assign _4488 = _1331[4:0];
    assign _4490 = _4488 == _1762;
    assign _4485 = _1331[5:5];
    assign _4487 = _4485 == _2850;
    assign _4491 = _4487 & _4490;
    assign _4494 = _4491 & _4493;
    assign _4495 = _4494 ? _1261 : _4484;
    assign _4496 = _3062 ? _4495 : _4484;
    assign _183 = _4496;
    always @(posedge _277) begin
        if (_275)
            _4484 <= _1283;
        else
            _4484 <= _183;
    end
    assign _4507 = _218[1:1];
    assign _4508 = ~ _4507;
    assign _4503 = _1331[4:0];
    assign _4505 = _4503 == _1768;
    assign _4500 = _1331[5:5];
    assign _4502 = _4500 == _2850;
    assign _4506 = _4502 & _4505;
    assign _4509 = _4506 & _4508;
    assign _4510 = _4509 ? _1261 : _4499;
    assign _4511 = _3062 ? _4510 : _4499;
    assign _184 = _4511;
    always @(posedge _277) begin
        if (_275)
            _4499 <= _1283;
        else
            _4499 <= _184;
    end
    assign _4522 = _218[1:1];
    assign _4523 = ~ _4522;
    assign _4518 = _1331[4:0];
    assign _4520 = _4518 == _1774;
    assign _4515 = _1331[5:5];
    assign _4517 = _4515 == _2850;
    assign _4521 = _4517 & _4520;
    assign _4524 = _4521 & _4523;
    assign _4525 = _4524 ? _1261 : _4514;
    assign _4526 = _3062 ? _4525 : _4514;
    assign _185 = _4526;
    always @(posedge _277) begin
        if (_275)
            _4514 <= _1283;
        else
            _4514 <= _185;
    end
    assign _4537 = _218[1:1];
    assign _4538 = ~ _4537;
    assign _4533 = _1331[4:0];
    assign _4535 = _4533 == _1780;
    assign _4530 = _1331[5:5];
    assign _4532 = _4530 == _2850;
    assign _4536 = _4532 & _4535;
    assign _4539 = _4536 & _4538;
    assign _4540 = _4539 ? _1261 : _4529;
    assign _4541 = _3062 ? _4540 : _4529;
    assign _186 = _4541;
    always @(posedge _277) begin
        if (_275)
            _4529 <= _1283;
        else
            _4529 <= _186;
    end
    assign _4682 = { _4529,
                     _4514,
                     _4499,
                     _4484 };
    assign _4675 = g_crc_0[30:0];
    assign _4677 = { _4675,
                     _1067 };
    assign _4668 = g_crc_0[31:31];
    assign _4669 = _2950 ^ _4668;
    assign _4671 = _4669 ? _4644 : _1250;
    assign _4665 = g_crc_0[30:0];
    assign _4667 = { _4665,
                     _1067 };
    assign _4672 = _4667 ^ _4671;
    assign _4657 = g_cnt_0[5:0];
    assign _4662 = _4657 < _4661;
    assign _4663 = ~ _4662;
    assign _4652 = g_cnt_0[15:6];
    assign _4654 = _4652 == _1079;
    assign _4655 = ~ _4654;
    assign _4651 = ~ _3246;
    assign _4656 = _4651 | _4655;
    assign _4664 = _4656 | _4663;
    assign _4673 = _4664 ? _4672 : _4650;
    assign _4674 = _2640 ? _4673 : _4650;
    assign _4552 = _218[1:1];
    assign _4553 = ~ _4552;
    assign _4548 = _1331[4:0];
    assign _4550 = _4548 == _1726;
    assign _4545 = _1331[5:5];
    assign _4547 = _4545 == _2850;
    assign _4551 = _4547 & _4550;
    assign _4554 = _4551 & _4553;
    assign _4555 = _4554 ? _1261 : _4544;
    assign _4556 = _3062 ? _4555 : _4544;
    assign _187 = _4556;
    always @(posedge _277) begin
        if (_275)
            _4544 <= _1283;
        else
            _4544 <= _187;
    end
    assign _4571 = _4544[5:0];
    assign _4566 = g_left_0 - _3359;
    assign _4567 = _3335 ? _4566 : _4564;
    assign _4568 = _2618 ? _4567 : _4564;
    assign _4569 = _2959 ? _4564 : _4568;
    assign _4560 = g_left_0 - _3359;
    assign _4561 = g_data_left_0 ? g_left_0 : _4560;
    assign _4562 = _2617 ? g_left_0 : _4561;
    assign _4563 = _2680 ? _4562 : g_left_0;
    assign _4564 = _2672 ? _4563 : g_left_0;
    assign _4570 = _2604 ? _4569 : _4564;
    assign _4572 = _4558 ? _4571 : _4570;
    assign _4574 = _2923 ? _1639 : _4572;
    assign _188 = _4574;
    always @(posedge _277) begin
        if (_275)
            g_left_0 <= _1639;
        else
            g_left_0 <= _188;
    end
    assign _2678 = g_left_0 == _1639;
    assign _2679 = ~ _2678;
    assign _3333 = ~ g_data_left_0;
    assign _3332 = _2604 & _2618;
    assign _3334 = _3332 & _3333;
    assign _3335 = _3334 & _2679;
    assign _4678 = _3335 ? _4677 : _4674;
    assign _4679 = _2618 ? _4678 : _4650;
    assign _4680 = _2959 ? _4650 : _4679;
    assign _4585 = _218[1:1];
    assign _4586 = ~ _4585;
    assign _4581 = _1331[4:0];
    assign _4583 = _4581 == _1738;
    assign _4578 = _1331[5:5];
    assign _4580 = _4578 == _2850;
    assign _4584 = _4580 & _4583;
    assign _4587 = _4584 & _4586;
    assign _4588 = _4587 ? _1261 : _4577;
    assign _4589 = _3062 ? _4588 : _4577;
    assign _189 = _4589;
    always @(posedge _277) begin
        if (_275)
            _4577 <= _1283;
        else
            _4577 <= _189;
    end
    assign _4600 = _218[1:1];
    assign _4601 = ~ _4600;
    assign _4596 = _1331[4:0];
    assign _4598 = _4596 == _1744;
    assign _4593 = _1331[5:5];
    assign _4595 = _4593 == _2850;
    assign _4599 = _4595 & _4598;
    assign _4602 = _4599 & _4601;
    assign _4603 = _4602 ? _1261 : _4592;
    assign _4604 = _3062 ? _4603 : _4592;
    assign _190 = _4604;
    always @(posedge _277) begin
        if (_275)
            _4592 <= _1283;
        else
            _4592 <= _190;
    end
    assign _4615 = _218[1:1];
    assign _4616 = ~ _4615;
    assign _4611 = _1331[4:0];
    assign _4613 = _4611 == _1750;
    assign _4608 = _1331[5:5];
    assign _4610 = _4608 == _2850;
    assign _4614 = _4610 & _4613;
    assign _4617 = _4614 & _4616;
    assign _4618 = _4617 ? _1261 : _4607;
    assign _4619 = _3062 ? _4618 : _4607;
    assign _191 = _4619;
    always @(posedge _277) begin
        if (_275)
            _4607 <= _1283;
        else
            _4607 <= _191;
    end
    assign _4630 = _218[1:1];
    assign _4631 = ~ _4630;
    assign _4626 = _1331[4:0];
    assign _4628 = _4626 == _1756;
    assign _4623 = _1331[5:5];
    assign _4625 = _4623 == _2850;
    assign _4629 = _4625 & _4628;
    assign _4632 = _4629 & _4631;
    assign _4633 = _4632 ? _1261 : _4622;
    assign _4634 = _3062 ? _4633 : _4622;
    assign _192 = _4634;
    always @(posedge _277) begin
        if (_275)
            _4622 <= _1283;
        else
            _4622 <= _192;
    end
    assign _4644 = { _4622,
                     _4607,
                     _4592,
                     _4577 };
    assign _4641 = g_crc_0[31:31];
    assign _4642 = _3855 ^ _4641;
    assign _4645 = _4642 ? _4644 : _1250;
    assign _4638 = g_crc_0[30:0];
    assign _4640 = { _4638,
                     _1067 };
    assign _4646 = _4640 ^ _4645;
    assign _4635 = g_crc_0[30:0];
    assign _4637 = { _4635,
                     _1067 };
    assign _4647 = g_data_left_0 ? _4646 : _4637;
    assign _4648 = _2617 ? g_crc_0 : _4647;
    assign _4649 = _2680 ? _4648 : g_crc_0;
    assign _4650 = _2672 ? _4649 : g_crc_0;
    assign _4681 = _2604 ? _4680 : _4650;
    assign _4683 = _2923 ? _4682 : _4681;
    assign _4685 = _2706 ? _1250 : _4683;
    assign _193 = _4685;
    always @(posedge _277) begin
        if (_275)
            g_crc_0 <= _1250;
        else
            g_crc_0 <= _193;
    end
    assign _3339 = g_crc_0[31:31];
    assign _3341 = _3339 ^ _3340;
    assign _4705 = _4704 ? _4702 : g_lim_0;
    assign _4706 = g_len_cap_0 ? _4705 : g_lim_0;
    assign _194 = _4706;
    always @(posedge _277) begin
        if (_275)
            g_lim_0 <= _1283;
        else
            g_lim_0 <= _194;
    end
    assign _2637 = { _1283,
                     g_lim_0 };
    assign _4714 = _218[1:1];
    assign _4715 = ~ _4714;
    assign _4710 = _1331[4:0];
    assign _4712 = _4710 == _1810;
    assign _4707 = _1331[5:5];
    assign _4709 = _4707 == _2850;
    assign _4713 = _4709 & _4712;
    assign _4716 = _4713 & _4715;
    assign _4717 = _4716 ? _1261 : _2631;
    assign _4718 = _3062 ? _4717 : _2631;
    assign _195 = _4718;
    always @(posedge _277) begin
        if (_275)
            _2631 <= _1283;
        else
            _2631 <= _195;
    end
    assign _4726 = _218[1:1];
    assign _4727 = ~ _4726;
    assign _4722 = _1331[4:0];
    assign _4724 = _4722 == _1816;
    assign _4719 = _1331[5:5];
    assign _4721 = _4719 == _2850;
    assign _4725 = _4721 & _4724;
    assign _4728 = _4725 & _4727;
    assign _4729 = _4728 ? _1261 : _2628;
    assign _4730 = _3062 ? _4729 : _2628;
    assign _196 = _4730;
    always @(posedge _277) begin
        if (_275)
            _2628 <= _1283;
        else
            _2628 <= _196;
    end
    assign _2632 = { _2628,
                     _2631 };
    assign _3251 = g_sr_0[14:0];
    assign _3252 = { _3251,
                     _2950 };
    assign _4731 = _2618 ? _3252 : g_sr_0;
    assign _4732 = _2959 ? g_sr_0 : _4731;
    assign _4733 = _2604 ? _4732 : g_sr_0;
    assign _4735 = _2923 ? _1174 : _4733;
    assign _197 = _4735;
    always @(posedge _277) begin
        if (_275)
            g_sr_0 <= _1174;
        else
            g_sr_0 <= _197;
    end
    assign _4697 = g_sr_0[3:0];
    assign _4743 = _218[1:1];
    assign _4744 = ~ _4743;
    assign _4739 = _1331[4:0];
    assign _4741 = _4739 == _1828;
    assign _4736 = _1331[5:5];
    assign _4738 = _4736 == _2850;
    assign _4742 = _4738 & _4741;
    assign _4745 = _4742 & _4744;
    assign _4746 = _4745 ? _1261 : _4695;
    assign _4747 = _3062 ? _4746 : _4695;
    assign _198 = _4747;
    always @(posedge _277) begin
        if (_275)
            _4695 <= _1283;
        else
            _4695 <= _198;
    end
    assign _4696 = _4695[3:0];
    assign _4698 = _4696 < _4697;
    assign _4699 = _4698 ? _4696 : _4697;
    assign _4701 = { _1067,
                     _4699,
                     _1075 };
    assign _2649 = _2648[5:0];
    assign _4691 = { _1395,
                     _2649 };
    assign _4702 = _4691 + _4701;
    assign _4703 = { _1283,
                     _4702 };
    assign _4704 = _4703 < _2632;
    assign _4793 = _4704 ? _2850 : g_len_known_0;
    assign _4755 = _218[1:1];
    assign _4756 = ~ _4755;
    assign _4751 = _1331[4:0];
    assign _4753 = _4751 == _1822;
    assign _4748 = _1331[5:5];
    assign _4750 = _4748 == _2850;
    assign _4754 = _4750 & _4753;
    assign _4757 = _4754 & _4756;
    assign _4758 = _4757 ? _1261 : _4660;
    assign _4759 = _3062 ? _4758 : _4660;
    assign _199 = _4759;
    always @(posedge _277) begin
        if (_275)
            _4660 <= _1283;
        else
            _4660 <= _199;
    end
    assign _4661 = _4660[5:0];
    assign _4779 = g_cnt_0[5:0];
    assign _4780 = _4779 == _4661;
    assign _4775 = g_cnt_0[15:6];
    assign _4777 = _4775 == _1079;
    assign _3246 = _2648[6:6];
    assign _4773 = ~ _3246;
    assign _4767 = _218[1:1];
    assign _4768 = ~ _4767;
    assign _4763 = _1331[4:0];
    assign _4765 = _4763 == _1732;
    assign _4760 = _1331[5:5];
    assign _4762 = _4760 == _2850;
    assign _4766 = _4762 & _4765;
    assign _4769 = _4766 & _4768;
    assign _4770 = _4769 ? _1261 : _2648;
    assign _4771 = _3062 ? _4770 : _2648;
    assign _200 = _4771;
    always @(posedge _277) begin
        if (_275)
            _2648 <= _1283;
        else
            _2648 <= _200;
    end
    assign _4772 = _2648[7:7];
    assign _4774 = _4772 & _4773;
    assign _4778 = _4774 & _4777;
    assign _4781 = _4778 & _4780;
    assign _4783 = _4781 ? _2850 : g_len_cap_0;
    assign _4784 = _2640 ? _4783 : g_len_cap_0;
    assign _4785 = _2618 ? _4784 : g_len_cap_0;
    assign _4786 = _2959 ? g_len_cap_0 : _4785;
    assign _4787 = _2604 ? _4786 : g_len_cap_0;
    assign _4789 = g_len_cap_0 ? _1067 : _4787;
    assign _4791 = _2923 ? _1067 : _4789;
    assign _201 = _4791;
    always @(posedge _277) begin
        if (_275)
            g_len_cap_0 <= _1067;
        else
            g_len_cap_0 <= _201;
    end
    assign _4794 = g_len_cap_0 ? _4793 : g_len_known_0;
    assign _4796 = _2923 ? _1067 : _4794;
    assign _202 = _4796;
    always @(posedge _277) begin
        if (_275)
            g_len_known_0 <= _1067;
        else
            g_len_known_0 <= _202;
    end
    assign _2638 = g_len_known_0 ? _2637 : _2632;
    assign _4816 = g_cnt_0 + _5461;
    assign _2619 = _2604 & _2618;
    assign _2640 = _2619 & g_data_left_0;
    assign _4817 = _2640 ? _4816 : _4814;
    assign _2618 = ~ _2617;
    assign _4818 = _2618 ? _4817 : _4814;
    assign _4799 = _2959 ? _4798 : _2950;
    assign _4797 = _2680 ? _3855 : g_last_0;
    assign _4798 = _2672 ? _4797 : g_last_0;
    assign _4800 = _2604 ? _4799 : _4798;
    assign _4802 = _2923 ? _2850 : _4800;
    assign _203 = _4802;
    always @(posedge _277) begin
        if (_275)
            g_last_0 <= vdd;
        else
            g_last_0 <= _203;
    end
    assign _2955 = ~ g_last_0;
    assign _2952 = _2608 == _1274;
    assign _2956 = _2952 ? _2955 : gnd;
    assign _4804 = _2524 == _1274;
    assign _4805 = _4804 ? _2514 : g_prev_0;
    assign _4806 = _2604 ? _4805 : g_prev_0;
    assign _4808 = _2923 ? _2850 : _4806;
    assign _204 = _4808;
    always @(posedge _277) begin
        if (_275)
            g_prev_0 <= vdd;
        else
            g_prev_0 <= _204;
    end
    assign _2949 = _2514 == g_prev_0;
    assign _2946 = _2524 == _1274;
    assign _2950 = _2946 ? _2949 : _2514;
    assign _2957 = _2950 == _2956;
    assign _2958 = ~ _2957;
    assign _2959 = _2617 & _2958;
    assign _4819 = _2959 ? _4814 : _4818;
    assign _4810 = g_cnt_0 + _5461;
    assign _4811 = g_data_left_0 ? _4810 : g_cnt_0;
    assign _4812 = _2617 ? g_cnt_0 : _4811;
    assign _4813 = _2680 ? _4812 : g_cnt_0;
    assign _4814 = _2672 ? _4813 : g_cnt_0;
    assign _4820 = _2604 ? _4819 : _4814;
    assign _4822 = _2923 ? _1174 : _4820;
    assign _205 = _4822;
    always @(posedge _277) begin
        if (_275)
            g_cnt_0 <= _1174;
        else
            g_cnt_0 <= _205;
    end
    assign g_data_left_0 = g_cnt_0 < _2638;
    assign _3854 = g_data_left_0 ? _3853 : _3341;
    assign _3855 = _2617 ? _2956 : _3854;
    assign _4828 = _3855 == g_last_0;
    assign _4826 = g_run_0 == _1075;
    assign _4827 = ~ _4826;
    assign _4829 = _4827 & _4828;
    assign _4833 = _4829 ? _4832 : _2203;
    assign _4824 = _2608 == _1275;
    assign _4838 = _4824 ? _4837 : _4833;
    assign _4839 = _2680 ? _4838 : g_run_0;
    assign _4840 = _2672 ? _4839 : g_run_0;
    assign _4858 = _2604 ? _4857 : _4840;
    assign _4860 = _2923 ? _1075 : _4858;
    assign _206 = _4860;
    always @(posedge _277) begin
        if (_275)
            g_run_0 <= _1075;
        else
            g_run_0 <= _206;
    end
    assign _2616 = g_run_0 == _2615;
    assign _4868 = _218[1:1];
    assign _4869 = ~ _4868;
    assign _4864 = _1331[4:0];
    assign _4866 = _4864 == _1720;
    assign _4861 = _1331[5:5];
    assign _4863 = _4861 == _2850;
    assign _4867 = _4863 & _4866;
    assign _4870 = _4867 & _4869;
    assign _4871 = _4870 ? _1261 : _2607;
    assign _4872 = _3062 ? _4871 : _2607;
    assign _207 = _4872;
    always @(posedge _277) begin
        if (_275)
            _2607 <= _1283;
        else
            _2607 <= _207;
    end
    assign _2608 = _2607[1:0];
    assign _2610 = _2608 == _1395;
    assign _2611 = ~ _2610;
    assign _2617 = _2611 & _2616;
    assign _2673 = _2617 | g_data_left_0;
    assign _2680 = _2673 | _2679;
    assign _4886 = _2680 ? _4885 : _2850;
    assign _2663 = ~ _2496;
    assign _2664 = _2492 & _2663;
    assign _2672 = _2664 & _2671;
    assign _4887 = _2672 ? _4886 : f_lane1_out;
    assign _2668 = _2575 == _1174;
    assign _2666 = _2533 == _1174;
    assign _2669 = _2568 ? _2668 : _2666;
    assign _2670 = _2529 ? vdd : _2669;
    assign _2671 = _2498 ? _2602 : _2670;
    assign _4879 = ~ _2671;
    assign _4876 = _2524 == _1275;
    assign _4873 = ~ _2496;
    assign _4874 = _2492 & _4873;
    assign _4877 = _4874 & _4876;
    assign _4878 = _4877 & _2603;
    assign _4880 = _4878 & _4879;
    assign _4888 = _4880 ? _3827 : _4887;
    assign _4890 = _2937 ? _2850 : _4888;
    assign _4892 = _2661 ? _2850 : _4890;
    assign _4894 = _2923 ? _2850 : _4892;
    assign _4896 = _2706 ? _2850 : _4894;
    assign _208 = _4896;
    always @(posedge _277) begin
        if (_275)
            f_lane1_out <= vdd;
        else
            f_lane1_out <= _208;
    end
    assign _2935 = _2514 == f_lane1_out;
    assign _2936 = ~ _2935;
    assign _2931 = _2524 == _1275;
    assign _2932 = ~ _2931;
    assign _2928 = ~ _2498;
    assign _2926 = _2495[6:6];
    assign _2924 = ~ _2496;
    assign _2925 = _2492 & _2924;
    assign _2927 = _2925 & _2926;
    assign _2929 = _2927 & _2928;
    assign _2933 = _2929 & _2932;
    assign _2934 = _2933 & _2603;
    assign _2937 = _2934 & _2936;
    assign _5024 = _2937 ? _1395 : _5022;
    assign _2600 = ~ _2594;
    assign _2601 = _2597 & _2600;
    always @(posedge _277) begin
        if (_275)
            _2597 <= _1067;
        else
            _2597 <= _2594;
    end
    assign _2598 = ~ _2597;
    assign _2590 = _304[7:7];
    assign _2589 = _304[6:6];
    assign _2588 = _304[5:5];
    assign _2587 = _304[4:4];
    assign _2586 = _304[3:3];
    assign _2585 = _304[2:2];
    assign _2584 = _304[1:1];
    assign _2583 = _304[0:0];
    assign _2582 = _2501[2:0];
    always @* begin
        case (_2582)
        0:
            _2591 <= _2583;
        1:
            _2591 <= _2584;
        2:
            _2591 <= _2585;
        3:
            _2591 <= _2586;
        4:
            _2591 <= _2587;
        5:
            _2591 <= _2588;
        6:
            _2591 <= _2589;
        default:
            _2591 <= _2590;
        endcase
    end
    always @(posedge _277) begin
        if (_275)
            _2594 <= _1067;
        else
            _2594 <= _2591;
    end
    assign _2599 = _2594 & _2598;
    assign _2581 = _2495[2:2];
    assign _2602 = _2581 ? _2601 : _2599;
    assign _2579 = _2564 == _1174;
    assign _2576 = _2575 == _2564;
    assign _2569 = _2533 == _2564;
    assign _2567 = ~ _2523;
    assign _2558 = _2541[15:2];
    assign _2559 = { _1395,
                     _2558 };
    assign _2555 = _2541[15:1];
    assign _2556 = { _1067,
                     _2555 };
    assign _2560 = _2556 + _2559;
    assign _2552 = _2541[15:1];
    assign _2553 = { _1067,
                     _2552 };
    assign _2550 = _2496 & _2526;
    assign _2561 = _2550 ? _2560 : _2553;
    always @(posedge _277) begin
        if (_275)
            _2564 <= _1174;
        else
            _2564 <= _2561;
    end
    assign _2565 = _2533 < _2564;
    assign _2542 = _2541[15:2];
    assign _2543 = { _1395,
                     _2542 };
    always @(posedge _277) begin
        if (_275)
            _2546 <= _1174;
        else
            _2546 <= _2543;
    end
    assign _4981 = ~ _2523;
    assign _4982 = _2566 & _4981;
    assign _4983 = _4982 ? _2575 : _2533;
    assign _4985 = _2529 ? _1174 : _4983;
    assign _4987 = _4985 + _5461;
    assign _4965 = _4959 == _1134;
    assign _2571 = _2541[15:1];
    assign _2572 = { _1067,
                     _2571 };
    always @(posedge _277) begin
        if (_275)
            _2575 <= _1174;
        else
            _2575 <= _2572;
    end
    assign _4961 = { gnd,
                     _2575 };
    assign _4962 = _4961 == _4959;
    assign _4955 = { gnd,
                     _2541 };
    always @(posedge _277) begin
        if (_275)
            _4958 <= _1134;
        else
            _4958 <= _4955;
    end
    assign _4904 = _218[1:1];
    assign _4905 = ~ _4904;
    assign _4900 = _1331[4:0];
    assign _4902 = _4900 == _1690;
    assign _4897 = _1331[5:5];
    assign _4899 = _4897 == _2850;
    assign _4903 = _4899 & _4902;
    assign _4906 = _4903 & _4905;
    assign _4907 = _4906 ? _1261 : _2540;
    assign _4908 = _3062 ? _4907 : _2540;
    assign _209 = _4908;
    always @(posedge _277) begin
        if (_275)
            _2540 <= _1283;
        else
            _2540 <= _209;
    end
    assign _4916 = _218[1:1];
    assign _4917 = ~ _4916;
    assign _4912 = _1331[4:0];
    assign _4914 = _4912 == _1696;
    assign _4909 = _1331[5:5];
    assign _4911 = _4909 == _2850;
    assign _4915 = _4911 & _4914;
    assign _4918 = _4915 & _4917;
    assign _4919 = _4918 ? _1261 : _2537;
    assign _4920 = _3062 ? _4919 : _2537;
    assign _210 = _4920;
    always @(posedge _277) begin
        if (_275)
            _2537 <= _1283;
        else
            _2537 <= _210;
    end
    assign _2541 = { _2537,
                     _2540 };
    assign _4949 = { gnd,
                     _2541 };
    assign _4951 = _4949 - _4396;
    always @(posedge _277) begin
        if (_275)
            _4954 <= _1134;
        else
            _4954 <= _4951;
    end
    assign _4931 = _218[1:1];
    assign _4932 = ~ _4931;
    assign _4927 = _1331[4:0];
    assign _4929 = _4927 == _1702;
    assign _4924 = _1331[5:5];
    assign _4926 = _4924 == _2850;
    assign _4930 = _4926 & _4929;
    assign _4933 = _4930 & _4932;
    assign _4934 = _4933 ? _1261 : _4923;
    assign _4935 = _3062 ? _4934 : _4923;
    assign _211 = _4935;
    always @(posedge _277) begin
        if (_275)
            _4923 <= _1283;
        else
            _4923 <= _211;
    end
    assign _4969 = { gnd,
                     _4923 };
    assign _4971 = _4970[7:0];
    assign _4972 = _4967 ? _4971 : _4943;
    assign _4973 = _4940 ? _4972 : _4943;
    assign _4975 = _2923 ? _1283 : _4973;
    assign _212 = _4975;
    always @(posedge _277) begin
        if (_275)
            _4943 <= _1283;
        else
            _4943 <= _212;
    end
    assign _4968 = { gnd,
                     _4943 };
    assign _4970 = _4968 + _4969;
    assign _4976 = _4970[8:8];
    assign _4977 = _4967 ? _4976 : _4948;
    assign _4978 = _4940 ? _4977 : _4948;
    assign _4980 = _2923 ? _1067 : _4978;
    assign _213 = _4980;
    always @(posedge _277) begin
        if (_275)
            _4948 <= _1067;
        else
            _4948 <= _213;
    end
    assign _4959 = _4948 ? _4958 : _4954;
    assign _4945 = { gnd,
                     _2533 };
    assign _4960 = _4945 == _4959;
    assign _4963 = _2568 ? _4962 : _4960;
    assign _4966 = _2529 ? _4965 : _4963;
    assign _4944 = ~ _2498;
    assign _4967 = _4944 & _4966;
    assign _4989 = _4967 ? _1174 : _4987;
    assign _4939 = ~ _2498;
    assign _4937 = _2523 & _2521;
    assign _627 = g_mode == _1333;
    assign _4936 = _2492 | _627;
    assign _4938 = _4936 | _4937;
    assign _4940 = _4938 & _4939;
    assign _4990 = _4940 ? _4989 : _2533;
    assign _4992 = _2923 ? _1174 : _4990;
    assign _214 = _4992;
    always @(posedge _277) begin
        if (_275)
            _2533 <= _1174;
        else
            _2533 <= _214;
    end
    assign _2547 = _2533 < _2546;
    assign _2548 = ~ _2547;
    assign _2530 = _2521 & _2526;
    assign _2549 = _2530 & _2548;
    assign _2566 = _2549 & _2565;
    assign _2568 = _2566 & _2567;
    assign _2577 = _2568 ? _2576 : _2569;
    assign _2524 = _2495[4:3];
    assign _2526 = _2524 == _1275;
    assign _2527 = ~ _2526;
    assign _2528 = _2523 | _2527;
    assign _2520 = ~ _2498;
    always @(posedge _277) begin
        if (_275)
            _2517 <= _1067;
        else
            _2517 <= _2514;
    end
    assign _2510 = _304[7:7];
    assign _2509 = _304[6:6];
    assign _2508 = _304[5:5];
    assign _2507 = _304[4:4];
    assign _2506 = _304[3:3];
    assign _2505 = _304[2:2];
    assign _2504 = _304[1:1];
    assign _2503 = _304[0:0];
    assign _5000 = _218[1:1];
    assign _5001 = ~ _5000;
    assign _4996 = _1331[4:0];
    assign _4998 = _4996 == _1714;
    assign _4993 = _1331[5:5];
    assign _4995 = _4993 == _2850;
    assign _4999 = _4995 & _4998;
    assign _5002 = _4999 & _5001;
    assign _5003 = _5002 ? _1261 : _2501;
    assign _5004 = _3062 ? _5003 : _2501;
    assign _215 = _5004;
    always @(posedge _277) begin
        if (_275)
            _2501 <= _1283;
        else
            _2501 <= _215;
    end
    assign _2502 = _2501[5:3];
    always @* begin
        case (_2502)
        0:
            _2511 <= _2503;
        1:
            _2511 <= _2504;
        2:
            _2511 <= _2505;
        3:
            _2511 <= _2506;
        4:
            _2511 <= _2507;
        5:
            _2511 <= _2508;
        6:
            _2511 <= _2509;
        default:
            _2511 <= _2510;
        endcase
    end
    always @(posedge _277) begin
        if (_275)
            _2514 <= _1067;
        else
            _2514 <= _2511;
    end
    assign _2518 = _2514 ^ _2517;
    assign _2519 = _2496 & _2518;
    assign _2521 = _2519 & _2520;
    assign _2529 = _2521 & _2528;
    assign _2580 = _2529 ? _2579 : _2577;
    assign _2498 = _2495[1:1];
    assign _2603 = _2498 ? _2602 : _2580;
    assign _5012 = _218[1:1];
    assign _5013 = ~ _5012;
    assign _5008 = _1331[4:0];
    assign _5010 = _5008 == _1708;
    assign _5005 = _1331[5:5];
    assign _5007 = _5005 == _2850;
    assign _5011 = _5007 & _5010;
    assign _5014 = _5011 & _5013;
    assign _5015 = _5014 ? _1261 : _2495;
    assign _5016 = _3062 ? _5015 : _2495;
    assign _216 = _5016;
    always @(posedge _277) begin
        if (_275)
            _2495 <= _1283;
        else
            _2495 <= _216;
    end
    assign _2496 = _2495[0:0];
    assign _2492 = g_mode == _1275;
    assign _2497 = _2492 & _2496;
    assign _2604 = _2497 & _2603;
    assign _5076 = _2604 ? _5075 : _5024;
    assign _2661 = _220 == _2233;
    assign _5078 = _2661 ? _1395 : _5076;
    assign _4558 = _220 == _2239;
    assign _5085 = _4558 ? _5084 : _5078;
    assign _2923 = _220 == _2227;
    assign _5091 = _2923 ? _5090 : _5085;
    assign _2705 = _220 == _1360;
    assign _2706 = _2705 | _1390;
    assign _5093 = _2706 ? _1395 : _5091;
    assign _217 = _5093;
    always @(posedge _277) begin
        if (_275)
            g_mode <= _1395;
        else
            g_mode <= _217;
    end
    assign _2523 = g_mode == _1274;
    assign _3017 = _2523 | _2492;
    assign _5094 = { _3017,
                     _3014 };
    assign _218 = _5094;
    assign _5102 = _218[0:0];
    assign _5103 = ~ _5102;
    assign _5098 = _1331[4:0];
    assign _5100 = _5098 == _1708;
    assign _5095 = _1331[5:5];
    assign _5097 = _5095 == _1067;
    assign _5101 = _5097 & _5100;
    assign _5104 = _5101 & _5103;
    assign _5105 = _5104 ? _1261 : _2255;
    assign _3061 = _1245 == _2233;
    assign _3062 = _1244 & _3061;
    assign _5106 = _3062 ? _5105 : _2255;
    assign _219 = _5106;
    always @(posedge _277) begin
        if (_275)
            _2255 <= _1283;
        else
            _2255 <= _219;
    end
    assign _2256 = _2255[0:0];
    assign _2879 = ~ _2256;
    assign _2880 = _2252 & _2879;
    assign _2882 = _2880 & _2881;
    assign _2884 = _2882 & _2883;
    assign _2888 = _2884 & _2887;
    assign _2889 = _2888 & _2363;
    assign _2892 = _2889 & _2891;
    assign _5118 = _2892 ? _1395 : _5116;
    assign _5170 = _2364 ? _5169 : _5118;
    assign _2421 = _220 == _2209;
    assign _5172 = _2421 ? _1395 : _5170;
    assign _4143 = _220 == _2215;
    assign _5179 = _4143 ? _5178 : _5172;
    assign _2878 = _220 == _2203;
    assign _5185 = _2878 ? _5184 : _5179;
    assign _1431 = _712[90:88];
    assign _1430 = _706[90:88];
    assign _1429 = _700[90:88];
    assign _1428 = _300[90:88];
    always @* begin
        case (f_winner)
        0:
            _1432 <= _1428;
        1:
            _1432 <= _1429;
        2:
            _1432 <= _1430;
        default:
            _1432 <= _1431;
        endcase
    end
    assign _1424 = _712[87:87];
    assign _1423 = _706[87:87];
    assign _1422 = _700[87:87];
    assign _1421 = _300[87:87];
    always @* begin
        case (f_winner)
        0:
            _1425 <= _1421;
        1:
            _1425 <= _1422;
        2:
            _1425 <= _1423;
        default:
            _1425 <= _1424;
        endcase
    end
    assign _5107 = ~ _1425;
    assign _5108 = _1191 & _5107;
    assign _5110 = _5108 ? _1432 : _1075;
    assign _220 = _5110;
    assign _2462 = _220 == _1360;
    assign _2463 = _2462 | _1390;
    assign _5187 = _2463 ? _1395 : _5185;
    assign _221 = _5187;
    always @(posedge _277) begin
        if (_275)
            g_mode_0 <= _1395;
        else
            g_mode_0 <= _221;
    end
    assign _2252 = g_mode_0 == _1275;
    assign _2257 = _2252 & _2256;
    assign _2364 = _2257 & _2363;
    assign _2379 = _2364 & _2378;
    assign _2400 = _2379 & g_data_left;
    assign _2413 = _2400 & _2412;
    assign _2419 = _2413 & _2418;
    assign _2455 = _2419 | _2454;
    assign _3540 = _2455 | _2699;
    assign _5190 = _1261[5:0];
    assign _5189 = _2790 == _2868;
    assign _5191 = _5189 ? _5190 : _1194;
    assign _5192 = _2788 ? _5191 : _1194;
    assign _222 = _5192;
    always @(posedge _277) begin
        if (_275)
            _1194 <= _1639;
        else
            _1194 <= _222;
    end
    assign _2456 = _1194[3:3];
    assign _3541 = _2456 & _3540;
    assign _223 = _3541;
    assign _3578 = _223 | _3577;
    assign _3580 = _3578 & _3579;
    assign _5193 = _3580 ^ _4454;
    assign _5199 = _5193 ? _5198 : _224;
    always @(posedge _277) begin
        if (_275)
            _5202 <= _1639;
        else
            _5202 <= _5199;
    end
    assign _224 = _5202;
    assign _596 = _224 == _1639;
    assign _5204 = _596 ? _1281 : _3774;
    assign _2821 = _695[28:27];
    assign _2819 = _712[95:94];
    assign _2818 = _706[95:94];
    assign _2817 = _700[95:94];
    assign _2816 = _300[95:94];
    always @* begin
        case (f_winner)
        0:
            _2820 <= _2816;
        1:
            _2820 <= _2817;
        2:
            _2820 <= _2818;
        default:
            _2820 <= _2819;
        endcase
    end
    assign _2822 = _1393 ? _2821 : _2820;
    always @* begin
        case (_2822)
        0:
            _5216 <= _589;
        1:
            _5216 <= _5204;
        2:
            _5216 <= _5213;
        default:
            _5216 <= _5215;
        endcase
    end
    assign _5217 = _1394 ? _5216 : _589;
    assign _225 = _5217;
    always @(posedge _277) begin
        if (_275)
            _589 <= _1283;
        else
            _589 <= _225;
    end
    assign _590 = _589[0:0];
    assign _5228 = 8'b00001000;
    assign _5227 = 8'b00000111;
    assign _5226 = _584 - _2483;
    assign _5223 = _695[30:29];
    assign _712 = _299[511:400];
    assign _5221 = _712[99:98];
    assign _706 = _299[399:288];
    assign _5220 = _706[99:98];
    assign _5219 = _700[99:98];
    assign _5218 = _300[99:98];
    always @* begin
        case (f_winner)
        0:
            _5222 <= _5218;
        1:
            _5222 <= _5219;
        2:
            _5222 <= _5220;
        default:
            _5222 <= _5221;
        endcase
    end
    assign _5224 = _1393 ? _5223 : _5222;
    always @* begin
        case (_5224)
        0:
            _5229 <= _584;
        1:
            _5229 <= _5226;
        2:
            _5229 <= _5227;
        default:
            _5229 <= _5228;
        endcase
    end
    assign _5230 = _1394 ? _5229 : _584;
    assign _226 = _5230;
    always @(posedge _277) begin
        if (_275)
            _584 <= _1283;
        else
            _584 <= _226;
    end
    assign _586 = _584 == _1283;
    assign _817 = _700[61:58];
    always @* begin
        case (_817)
        0:
            _818 <= vdd;
        1:
            _818 <= _586;
        2:
            _818 <= _590;
        3:
            _818 <= _594;
        4:
            _818 <= _596;
        5:
            _818 <= _598;
        6:
            _818 <= _602;
        7:
            _818 <= _608;
        8:
            _818 <= _613;
        9:
            _818 <= _616;
        10:
            _818 <= _619;
        11:
            _818 <= _622;
        12:
            _818 <= _627;
        13:
            _818 <= _630;
        14:
            _818 <= _633;
        default:
            _818 <= _636;
        endcase
    end
    assign _820 = _818 ^ _819;
    assign _812 = _700[57:42];
    assign _814 = _812 == _1064;
    assign _803 = _749[57:42];
    assign _804 = { gnd,
                    _803 };
    assign _805 = _804 + _792;
    always @(posedge _277) begin
        if (_275)
            _808 <= _1134;
        else
            _808 <= _805;
    end
    assign _809 = _808 < _748;
    assign _810 = ~ _809;
    assign _799 = _700[41:26];
    assign _801 = _799 == _1174;
    assign _544 = _540 + _2203;
    assign _5245 = _540 + _2203;
    assign _5241 = _540 == _2239;
    assign _5242 = ~ _5241;
    assign _5239 = _320[0:0];
    assign _5243 = _5239 & _5242;
    assign _5246 = _5243 ? _5245 : _540;
    assign _5236 = _320[0:0];
    assign _5237 = ~ _5236;
    assign _5235 = f_chg_now[0:0];
    assign _5238 = _5235 & _5237;
    assign _5248 = _5238 ? _2203 : _5246;
    assign _5232 = _284 == _1275;
    assign _5234 = _5232 ? _1075 : _540;
    assign _5231 = _284 == _1274;
    assign _5249 = _5231 ? _5248 : _5234;
    assign _227 = _5249;
    always @(posedge _277) begin
        if (_275)
            _540 <= _1075;
        else
            _540 <= _227;
    end
    assign _542 = _540 == _2239;
    assign _545 = _542 ? _540 : _544;
    assign _535 = _320[0:0];
    assign _536 = ~ _535;
    assign _534 = f_chg_now[0:0];
    assign _537 = _534 & _536;
    assign _547 = _537 ? _2203 : _545;
    assign _531 = f_changed_all[0:0];
    assign _532 = f_in_fetch & _531;
    assign _548 = _532 ? _547 : _1075;
    assign _783 = _753[0:0];
    assign _785 = _783 ? _548 : _1075;
    assign _523 = _519 + _2203;
    assign _5264 = _519 + _2203;
    assign _5260 = _519 == _2239;
    assign _5261 = ~ _5260;
    assign _5258 = _320[1:1];
    assign _5262 = _5258 & _5261;
    assign _5265 = _5262 ? _5264 : _519;
    assign _5255 = _320[1:1];
    assign _5256 = ~ _5255;
    assign _5254 = f_chg_now[1:1];
    assign _5257 = _5254 & _5256;
    assign _5267 = _5257 ? _2203 : _5265;
    assign _5251 = _284 == _1275;
    assign _5253 = _5251 ? _1075 : _519;
    assign _5250 = _284 == _1274;
    assign _5268 = _5250 ? _5267 : _5253;
    assign _228 = _5268;
    always @(posedge _277) begin
        if (_275)
            _519 <= _1075;
        else
            _519 <= _228;
    end
    assign _521 = _519 == _2239;
    assign _524 = _521 ? _519 : _523;
    assign _514 = _320[1:1];
    assign _515 = ~ _514;
    assign _513 = f_chg_now[1:1];
    assign _516 = _513 & _515;
    assign _526 = _516 ? _2203 : _524;
    assign _510 = f_changed_all[1:1];
    assign _511 = f_in_fetch & _510;
    assign _527 = _511 ? _526 : _1075;
    assign _780 = _753[1:1];
    assign _782 = _780 ? _527 : _1075;
    assign _786 = _782 < _785;
    assign _787 = _786 ? _785 : _782;
    assign _500 = _496 + _2203;
    assign _5283 = _496 + _2203;
    assign _5279 = _496 == _2239;
    assign _5280 = ~ _5279;
    assign _5277 = _320[2:2];
    assign _5281 = _5277 & _5280;
    assign _5284 = _5281 ? _5283 : _496;
    assign _5274 = _320[2:2];
    assign _5275 = ~ _5274;
    assign _5273 = f_chg_now[2:2];
    assign _5276 = _5273 & _5275;
    assign _5286 = _5276 ? _2203 : _5284;
    assign _5270 = _284 == _1275;
    assign _5272 = _5270 ? _1075 : _496;
    assign _5269 = _284 == _1274;
    assign _5287 = _5269 ? _5286 : _5272;
    assign _229 = _5287;
    always @(posedge _277) begin
        if (_275)
            _496 <= _1075;
        else
            _496 <= _229;
    end
    assign _498 = _496 == _2239;
    assign _501 = _498 ? _496 : _500;
    assign _491 = _320[2:2];
    assign _492 = ~ _491;
    assign _490 = f_chg_now[2:2];
    assign _493 = _490 & _492;
    assign _503 = _493 ? _2203 : _501;
    assign _487 = f_changed_all[2:2];
    assign _488 = f_in_fetch & _487;
    assign _504 = _488 ? _503 : _1075;
    assign _775 = _753[2:2];
    assign _777 = _775 ? _504 : _1075;
    assign _479 = _475 + _2203;
    assign _5302 = _475 + _2203;
    assign _5298 = _475 == _2239;
    assign _5299 = ~ _5298;
    assign _5296 = _320[3:3];
    assign _5300 = _5296 & _5299;
    assign _5303 = _5300 ? _5302 : _475;
    assign _5293 = _320[3:3];
    assign _5294 = ~ _5293;
    assign _5292 = f_chg_now[3:3];
    assign _5295 = _5292 & _5294;
    assign _5305 = _5295 ? _2203 : _5303;
    assign _5289 = _284 == _1275;
    assign _5291 = _5289 ? _1075 : _475;
    assign _5288 = _284 == _1274;
    assign _5306 = _5288 ? _5305 : _5291;
    assign _230 = _5306;
    always @(posedge _277) begin
        if (_275)
            _475 <= _1075;
        else
            _475 <= _230;
    end
    assign _477 = _475 == _2239;
    assign _480 = _477 ? _475 : _479;
    assign _470 = _320[3:3];
    assign _471 = ~ _470;
    assign _469 = f_chg_now[3:3];
    assign _472 = _469 & _471;
    assign _482 = _472 ? _2203 : _480;
    assign _466 = f_changed_all[3:3];
    assign _467 = f_in_fetch & _466;
    assign _483 = _467 ? _482 : _1075;
    assign _772 = _753[3:3];
    assign _774 = _772 ? _483 : _1075;
    assign _778 = _774 < _777;
    assign _779 = _778 ? _777 : _774;
    assign _788 = _779 < _787;
    assign _789 = _788 ? _787 : _779;
    assign _454 = _450 + _2203;
    assign _5321 = _450 + _2203;
    assign _5317 = _450 == _2239;
    assign _5318 = ~ _5317;
    assign _5315 = _320[4:4];
    assign _5319 = _5315 & _5318;
    assign _5322 = _5319 ? _5321 : _450;
    assign _5312 = _320[4:4];
    assign _5313 = ~ _5312;
    assign _5311 = f_chg_now[4:4];
    assign _5314 = _5311 & _5313;
    assign _5324 = _5314 ? _2203 : _5322;
    assign _5308 = _284 == _1275;
    assign _5310 = _5308 ? _1075 : _450;
    assign _5307 = _284 == _1274;
    assign _5325 = _5307 ? _5324 : _5310;
    assign _231 = _5325;
    always @(posedge _277) begin
        if (_275)
            _450 <= _1075;
        else
            _450 <= _231;
    end
    assign _452 = _450 == _2239;
    assign _455 = _452 ? _450 : _454;
    assign _445 = _320[4:4];
    assign _446 = ~ _445;
    assign _444 = f_chg_now[4:4];
    assign _447 = _444 & _446;
    assign _457 = _447 ? _2203 : _455;
    assign _441 = f_changed_all[4:4];
    assign _442 = f_in_fetch & _441;
    assign _458 = _442 ? _457 : _1075;
    assign _765 = _753[4:4];
    assign _767 = _765 ? _458 : _1075;
    assign _433 = _429 + _2203;
    assign _5340 = _429 + _2203;
    assign _5336 = _429 == _2239;
    assign _5337 = ~ _5336;
    assign _5334 = _320[5:5];
    assign _5338 = _5334 & _5337;
    assign _5341 = _5338 ? _5340 : _429;
    assign _5331 = _320[5:5];
    assign _5332 = ~ _5331;
    assign _5330 = f_chg_now[5:5];
    assign _5333 = _5330 & _5332;
    assign _5343 = _5333 ? _2203 : _5341;
    assign _5327 = _284 == _1275;
    assign _5329 = _5327 ? _1075 : _429;
    assign _5326 = _284 == _1274;
    assign _5344 = _5326 ? _5343 : _5329;
    assign _232 = _5344;
    always @(posedge _277) begin
        if (_275)
            _429 <= _1075;
        else
            _429 <= _232;
    end
    assign _431 = _429 == _2239;
    assign _434 = _431 ? _429 : _433;
    assign _424 = _320[5:5];
    assign _425 = ~ _424;
    assign _423 = f_chg_now[5:5];
    assign _426 = _423 & _425;
    assign _436 = _426 ? _2203 : _434;
    assign _420 = f_changed_all[5:5];
    assign _421 = f_in_fetch & _420;
    assign _437 = _421 ? _436 : _1075;
    assign _762 = _753[5:5];
    assign _764 = _762 ? _437 : _1075;
    assign _768 = _764 < _767;
    assign _769 = _768 ? _767 : _764;
    assign _410 = _406 + _2203;
    assign _5359 = _406 + _2203;
    assign _5355 = _406 == _2239;
    assign _5356 = ~ _5355;
    assign _5353 = _320[6:6];
    assign _5357 = _5353 & _5356;
    assign _5360 = _5357 ? _5359 : _406;
    assign _5350 = _320[6:6];
    assign _5351 = ~ _5350;
    assign _5349 = f_chg_now[6:6];
    assign _5352 = _5349 & _5351;
    assign _5362 = _5352 ? _2203 : _5360;
    assign _5346 = _284 == _1275;
    assign _5348 = _5346 ? _1075 : _406;
    assign _5345 = _284 == _1274;
    assign _5363 = _5345 ? _5362 : _5348;
    assign _233 = _5363;
    always @(posedge _277) begin
        if (_275)
            _406 <= _1075;
        else
            _406 <= _233;
    end
    assign _408 = _406 == _2239;
    assign _411 = _408 ? _406 : _410;
    assign _401 = _320[6:6];
    assign _402 = ~ _401;
    assign _400 = f_chg_now[6:6];
    assign _403 = _400 & _402;
    assign _413 = _403 ? _2203 : _411;
    assign _397 = f_changed_all[6:6];
    assign _398 = f_in_fetch & _397;
    assign _414 = _398 ? _413 : _1075;
    assign _757 = _753[6:6];
    assign _759 = _757 ? _414 : _1075;
    assign _389 = _385 + _2203;
    assign _5378 = _385 + _2203;
    assign _5374 = _385 == _2239;
    assign _5375 = ~ _5374;
    assign _5372 = _320[7:7];
    assign _5376 = _5372 & _5375;
    assign _5379 = _5376 ? _5378 : _385;
    assign _5369 = _320[7:7];
    assign _5370 = ~ _5369;
    assign _5368 = f_chg_now[7:7];
    assign _5371 = _5368 & _5370;
    assign _5381 = _5371 ? _2203 : _5379;
    assign _5365 = _284 == _1275;
    assign _5367 = _5365 ? _1075 : _385;
    assign _5364 = _284 == _1274;
    assign _5382 = _5364 ? _5381 : _5367;
    assign _234 = _5382;
    always @(posedge _277) begin
        if (_275)
            _385 <= _1075;
        else
            _385 <= _234;
    end
    assign _387 = _385 == _2239;
    assign _390 = _387 ? _385 : _389;
    assign _380 = _320[7:7];
    assign _381 = ~ _380;
    assign _379 = f_chg_now[7:7];
    assign _382 = _379 & _381;
    assign _392 = _382 ? _2203 : _390;
    assign _376 = f_changed_all[7:7];
    assign _377 = f_in_fetch & _376;
    assign _393 = _377 ? _392 : _1075;
    assign _753 = _749[23:16];
    assign _754 = _753[7:7];
    assign _756 = _754 ? _393 : _1075;
    assign _760 = _756 < _759;
    assign _761 = _760 ? _759 : _756;
    assign _770 = _761 < _769;
    assign _771 = _770 ? _769 : _761;
    assign _790 = _771 < _789;
    assign _791 = _790 ? _789 : _771;
    assign _792 = { _1118,
                    _791 };
    assign _5385 = _351 == _2203;
    assign _5386 = _5385 ? _253 : _298;
    assign _5383 = _284 == _1274;
    assign _5387 = _5383 ? _5386 : _298;
    assign _235 = _5387;
    always @(posedge _277) begin
        if (_275)
            _298 <= _1349;
        else
            _298 <= _235;
    end
    assign _365 = _351 == _2203;
    assign _366 = f_in_fetch & _365;
    assign _367 = _366 ? _253 : _298;
    assign _5390 = _351 == _2209;
    assign _5391 = _5390 ? _253 : _295;
    assign _5388 = _284 == _1274;
    assign _5392 = _5388 ? _5391 : _295;
    assign _236 = _5392;
    always @(posedge _277) begin
        if (_275)
            _295 <= _1349;
        else
            _295 <= _236;
    end
    assign _361 = _351 == _2209;
    assign _362 = f_in_fetch & _361;
    assign _363 = _362 ? _253 : _295;
    assign _5395 = _351 == _2215;
    assign _5396 = _5395 ? _253 : _292;
    assign _5393 = _284 == _1274;
    assign _5397 = _5393 ? _5396 : _292;
    assign _237 = _5397;
    always @(posedge _277) begin
        if (_275)
            _292 <= _1349;
        else
            _292 <= _237;
    end
    assign _357 = _351 == _2215;
    assign _358 = f_in_fetch & _357;
    assign _359 = _358 ? _253 : _292;
    assign _353 = _351 == _1360;
    assign _354 = f_in_fetch & _353;
    assign _355 = _354 ? _253 : _289;
    assign _368 = { _355,
                    _359,
                    _363,
                    _367 };
    assign _749 = _368[287:176];
    assign _750 = _749[41:26];
    assign _751 = { gnd,
                    _750 };
    assign _793 = _751 + _792;
    always @(posedge _277) begin
        if (_275)
            _796 <= _1134;
        else
            _796 <= _793;
    end
    assign gnd = 1'b0;
    assign _748 = { gnd,
                    _745 };
    assign _797 = _748 < _796;
    assign _798 = ~ _797;
    assign _802 = _798 | _801;
    assign _811 = _802 & _810;
    assign _5425 = _341 + _5461;
    assign _5421 = _341 == _1064;
    assign _5422 = ~ _5421;
    assign _5423 = _5419 & _5422;
    assign _5426 = _5423 ? _5425 : _341;
    assign _5405 = _5404[2:2];
    assign _5406 = _1394 & _5405;
    assign _5428 = _5406 ? _1174 : _5426;
    assign _5430 = _1387 ? _1174 : _5428;
    assign _238 = _5430;
    always @(posedge _277) begin
        if (_275)
            _341 <= _1174;
        else
            _341 <= _238;
    end
    assign _5442 = _338 + _5461;
    assign _5438 = _338 == _1064;
    assign _5439 = ~ _5438;
    assign _5417 = 9'b111111111;
    assign _5418 = _5410 == _5417;
    assign _5415 = 6'b111111;
    assign _5414 = _5410[5:0];
    assign _5416 = _5414 == _5415;
    assign _5409 = 9'b000000000;
    assign _5431 = 9'b000000001;
    assign _5432 = _5410 + _5431;
    assign _5434 = _1387 ? _5409 : _5432;
    assign _239 = _5434;
    always @(posedge _277) begin
        if (_275)
            _5410 <= _5409;
        else
            _5410 <= _239;
    end
    assign _5411 = _5410[2:0];
    assign _5413 = _5411 == _2239;
    assign _5407 = _695[63:62];
    always @* begin
        case (_5407)
        0:
            _5419 <= vdd;
        1:
            _5419 <= _5413;
        2:
            _5419 <= _5416;
        default:
            _5419 <= _5418;
        endcase
    end
    assign _5440 = _5419 & _5439;
    assign _5443 = _5440 ? _5442 : _338;
    assign _5435 = _5404[1:1];
    assign _5436 = _1394 & _5435;
    assign _5445 = _5436 ? _1174 : _5443;
    assign _5447 = _1387 ? _1174 : _5445;
    assign _240 = _5447;
    always @(posedge _277) begin
        if (_275)
            _338 <= _1174;
        else
            _338 <= _240;
    end
    assign _744 = _700[25:24];
    always @* begin
        case (_744)
        0:
            _745 <= _335;
        1:
            _745 <= _338;
        2:
            _745 <= _341;
        default:
            _745 <= _341;
        endcase
    end
    assign _747 = _745 == _1064;
    assign _815 = _747 ? _814 : _811;
    always @(posedge _277) begin
        if (_275)
            _323 <= _1283;
        else
            _323 <= _307;
    end
    assign f_chg_now = _307 ^ _323;
    assign _5449 = _284 == _1275;
    assign _5451 = _5449 ? _1283 : _320;
    assign _5448 = _284 == _1274;
    assign _5452 = _5448 ? f_changed_all : _5451;
    assign _5454 = _1387 ? _1283 : _5452;
    assign _241 = _5454;
    always @(posedge _277) begin
        if (_275)
            _320 <= _1283;
        else
            _320 <= _241;
    end
    assign f_changed_all = _320 | f_chg_now;
    assign _738 = f_changed_all & f_chgmask1;
    assign _740 = _738 == _1283;
    assign _741 = ~ _740;
    assign f_chgmask1 = _700[23:16];
    assign _737 = f_chgmask1 == _1283;
    assign _742 = _737 | _741;
    assign _731 = _700[7:0];
    assign _729 = _700[15:8];
    assign _243 = pins_in;
    always @(posedge _277) begin
        if (_275)
            _304 <= _1283;
        else
            _304 <= _243;
    end
    always @(posedge _277) begin
        if (_275)
            _307 <= _1283;
        else
            _307 <= _304;
    end
    assign _730 = _307 ^ _729;
    assign _732 = _730 & _731;
    assign _734 = _732 == _1283;
    assign _700 = _299[287:176];
    assign f_valid1 = _700[111:111];
    assign _735 = f_valid1 & _734;
    assign _743 = _735 & _742;
    assign _816 = _743 & _815;
    assign _821 = _816 & _820;
    assign _860 = _821 & _859;
    assign _861 = f_in_eval & _860;
    assign _865 = _861 & _864;
    assign f_fire1 = _865 & _727;
    assign _1009 = f_fire1 ? _1274 : _1007;
    assign f_winner = f_fire0 ? _1395 : _1009;
    always @* begin
        case (f_winner)
        0:
            _5402 <= _5398;
        1:
            _5402 <= _5399;
        2:
            _5402 <= _5400;
        default:
            _5402 <= _5401;
        endcase
    end
    assign _5404 = _1393 ? _5403 : _5402;
    assign _5455 = _5404[0:0];
    assign _1392 = _351 == _1360;
    assign f_in_fetch = _284 == _1274;
    assign _1393 = f_in_fetch & _1392;
    assign _1394 = _1393 | _1191;
    assign _5456 = _1394 & _5455;
    assign _5465 = _5456 ? _1174 : _5463;
    assign _5467 = _1387 ? _1174 : _5465;
    assign _244 = _5467;
    always @(posedge _277) begin
        if (_275)
            _335 <= _1174;
        else
            _335 <= _244;
    end
    assign _1603 = _695[33:32];
    always @* begin
        case (_1603)
        0:
            _1604 <= _335;
        1:
            _1604 <= _338;
        2:
            _1604 <= _341;
        default:
            _1604 <= _341;
        endcase
    end
    assign _1602 = _695[49:34];
    assign _1605 = _1602 < _1604;
    assign _695 = _299[63:0];
    assign _1600 = _695[31:31];
    assign _1598 = ~ _1191;
    assign _1599 = f_in_eval & _1598;
    assign _1601 = _1599 & _1600;
    assign _1606 = _1601 & _1605;
    assign _1611 = _1606 & _1610;
    assign _1633 = _1611 | f_unexp_now;
    assign f_viol_now = _1633 | f_amb_now;
    assign _5473 = f_viol_now ? _5472 : _351;
    assign _5476 = _1191 ? _5475 : _5473;
    assign _5469 = _284 == _1275;
    assign _5477 = _5469 ? _5476 : _351;
    assign _5468 = _284 == _1274;
    assign _5480 = _5468 ? _5479 : _5477;
    assign _5482 = _1387 ? _1075 : _5480;
    assign _245 = _5482;
    always @(posedge _277) begin
        if (_275)
            _351 <= _1075;
        else
            _351 <= _245;
    end
    assign _5485 = _351 == _1360;
    assign _5486 = _5485 ? _253 : _289;
    assign _5483 = _284 == _1274;
    assign _5487 = _5483 ? _5486 : _289;
    assign _246 = _5487;
    always @(posedge _277) begin
        if (_275)
            _289 <= _1349;
        else
            _289 <= _246;
    end
    assign _299 = { _289,
                    _292,
                    _295,
                    _298 };
    assign _300 = _299[175:64];
    assign f_valid0 = _300[111:111];
    assign _314 = f_valid0 & _313;
    assign _331 = _314 & _330;
    assign _580 = _331 & _579;
    assign _640 = _580 & _639;
    assign _684 = _640 & _683;
    assign f_in_eval = _284 == _1275;
    assign _685 = f_in_eval & _684;
    assign _694 = _685 & _693;
    assign f_fire0 = _694 & _727;
    assign _1095 = f_fire0 | f_fire1;
    assign _1096 = _1095 | f_fire2;
    assign _1191 = _1096 | f_fire3;
    assign _5719 = _1191 ? _5718 : _5716;
    assign _5704 = _284 == _1333;
    assign _5706 = _5704 ? _1395 : _284;
    assign _5702 = _284 == _1275;
    assign _5720 = _5702 ? _5719 : _5706;
    assign _5701 = _284 == _1274;
    assign _5723 = _5701 ? _5722 : _5720;
    assign _5490 = _1261[1:1];
    assign _5489 = _2790 == _2873;
    assign _5491 = _5489 ? _5490 : _1067;
    assign _5492 = _2788 ? _5491 : _1067;
    assign _247 = _5492;
    always @(posedge _277) begin
        if (_275)
            _1390 <= _1067;
        else
            _1390 <= _247;
    end
    assign _5725 = _1390 ? _1395 : _5723;
    assign _5499 = _5498 ? _1261 : _5495;
    assign _5500 = _2861 ? _5499 : _5495;
    assign _248 = _5500;
    always @(posedge _277) begin
        if (_275)
            _5495 <= _1283;
        else
            _5495 <= _248;
    end
    assign _5507 = _5506 ? _1261 : _5503;
    assign _5508 = _2861 ? _5507 : _5503;
    assign _249 = _5508;
    always @(posedge _277) begin
        if (_275)
            _5503 <= _1283;
        else
            _5503 <= _249;
    end
    assign _5515 = _5514 ? _1261 : _5511;
    assign _5516 = _2861 ? _5515 : _5511;
    assign _250 = _5516;
    always @(posedge _277) begin
        if (_275)
            _5511 <= _1283;
        else
            _5511 <= _250;
    end
    assign _5523 = _5522 ? _1261 : _5519;
    assign _5524 = _2861 ? _5523 : _5519;
    assign _251 = _5524;
    always @(posedge _277) begin
        if (_275)
            _5519 <= _1283;
        else
            _5519 <= _251;
    end
    assign _5690 = { _5519,
                     _5511,
                     _5503,
                     _5495 };
    assign _5688 = 32'b11111111111111111111111111111111;
    assign _5639 = 32'b11101101101110001000001100100000;
    assign _5637 = _5631[31:1];
    assign _5638 = { _1067,
                     _5637 };
    assign _5640 = _5638 ^ _5639;
    assign _5634 = _5631[31:1];
    assign _5635 = { _1067,
                     _5634 };
    assign _5627 = _5621[31:1];
    assign _5628 = { _1067,
                     _5627 };
    assign _5630 = _5628 ^ _5639;
    assign _5624 = _5621[31:1];
    assign _5625 = { _1067,
                     _5624 };
    assign _5617 = _5611[31:1];
    assign _5618 = { _1067,
                     _5617 };
    assign _5620 = _5618 ^ _5639;
    assign _5614 = _5611[31:1];
    assign _5615 = { _1067,
                     _5614 };
    assign _5607 = _5601[31:1];
    assign _5608 = { _1067,
                     _5607 };
    assign _5610 = _5608 ^ _5639;
    assign _5604 = _5601[31:1];
    assign _5605 = { _1067,
                     _5604 };
    assign _5597 = _5591[31:1];
    assign _5598 = { _1067,
                     _5597 };
    assign _5600 = _5598 ^ _5639;
    assign _5594 = _5591[31:1];
    assign _5595 = { _1067,
                     _5594 };
    assign _5587 = _5581[31:1];
    assign _5588 = { _1067,
                     _5587 };
    assign _5590 = _5588 ^ _5639;
    assign _5584 = _5581[31:1];
    assign _5585 = { _1067,
                     _5584 };
    assign _5577 = _5571[31:1];
    assign _5578 = { _1067,
                     _5577 };
    assign _5580 = _5578 ^ _5639;
    assign _5574 = _5571[31:1];
    assign _5575 = { _1067,
                     _5574 };
    assign _5567 = _5561[31:1];
    assign _5568 = { _1067,
                     _5567 };
    assign _5570 = _5568 ^ _5639;
    assign _5564 = _5561[31:1];
    assign _5565 = { _1067,
                     _5564 };
    assign _5558 = _253[127:120];
    assign _5557 = _253[119:112];
    assign _5556 = _253[111:104];
    assign _5555 = _253[103:96];
    assign _5554 = _253[95:88];
    assign _5553 = _253[87:80];
    assign _5552 = _253[79:72];
    assign _5551 = _253[71:64];
    assign _5550 = _253[63:56];
    assign _5549 = _253[55:48];
    assign _5548 = _253[47:40];
    assign _5547 = _253[39:32];
    assign _5546 = _253[31:24];
    assign _5545 = _253[23:16];
    assign _5544 = _253[15:8];
    assign _253 = ram_rec_rdata;
    assign _5543 = _253[7:0];
    assign _5540 = 13'b0000000000001;
    assign _5541 = f_sw_cnt - _5540;
    assign _5542 = _5541[3:0];
    always @* begin
        case (_5542)
        0:
            _5559 <= _5543;
        1:
            _5559 <= _5544;
        2:
            _5559 <= _5545;
        3:
            _5559 <= _5546;
        4:
            _5559 <= _5547;
        5:
            _5559 <= _5548;
        6:
            _5559 <= _5549;
        7:
            _5559 <= _5550;
        8:
            _5559 <= _5551;
        9:
            _5559 <= _5552;
        10:
            _5559 <= _5553;
        11:
            _5559 <= _5554;
        12:
            _5559 <= _5555;
        13:
            _5559 <= _5556;
        14:
            _5559 <= _5557;
        default:
            _5559 <= _5558;
        endcase
    end
    assign _5560 = { _2974,
                     _5559 };
    assign _5537 = f_sw_cnt == _1082;
    assign _5538 = ~ _5537;
    assign _5642 = _5538 ? _5641 : _5535;
    assign _5535 = _5530 ? _5688 : _5533;
    assign _5643 = f_sweeping ? _5642 : _5535;
    assign _254 = _5643;
    always @(posedge _277) begin
        if (_275)
            _5533 <= _5688;
        else
            _5533 <= _254;
    end
    assign _5561 = _5533 ^ _5560;
    assign _5562 = _5561[0:0];
    assign _5571 = _5562 ? _5570 : _5565;
    assign _5572 = _5571[0:0];
    assign _5581 = _5572 ? _5580 : _5575;
    assign _5582 = _5581[0:0];
    assign _5591 = _5582 ? _5590 : _5585;
    assign _5592 = _5591[0:0];
    assign _5601 = _5592 ? _5600 : _5595;
    assign _5602 = _5601[0:0];
    assign _5611 = _5602 ? _5610 : _5605;
    assign _5612 = _5611[0:0];
    assign _5621 = _5612 ? _5620 : _5615;
    assign _5622 = _5621[0:0];
    assign _5631 = _5622 ? _5630 : _5625;
    assign _5632 = _5631[0:0];
    assign _5641 = _5632 ? _5640 : _5635;
    assign _5689 = _5641 ^ _5688;
    assign f_sw_match = _5689 == _5690;
    assign _5692 = f_sw_last ? f_sw_match : _5687;
    assign _5694 = _5675 ? _1067 : _5692;
    assign _1358 = ~ f_sweeping;
    assign _1357 = _1356 & _1311;
    assign f_store_we = _1357 & _1358;
    assign _5683 = f_store_we | _5673;
    assign _5685 = _5683 ? _1067 : f_image_valid;
    assign _5687 = _5530 ? _1067 : _5685;
    assign _5676 = 13'b1000000000000;
    assign _5647 = f_sw_cnt + _5540;
    assign _5645 = _5530 ? _1082 : f_sw_cnt;
    assign _5648 = f_sweeping ? _5647 : _5645;
    assign _255 = _5648;
    always @(posedge _277) begin
        if (_275)
            f_sw_cnt <= _1082;
        else
            f_sw_cnt <= _255;
    end
    assign f_sw_last = f_sw_cnt == _5676;
    assign _5679 = f_sw_last ? _1067 : _5669;
    assign _5496 = _1331[3:0];
    assign _5498 = _5496 == _2983;
    assign _5651 = _5498 ? _2850 : _1067;
    assign _5505 = 4'b1001;
    assign _5504 = _1331[3:0];
    assign _5506 = _5504 == _5505;
    assign _5653 = _5506 ? _2850 : _5651;
    assign _5513 = 4'b1010;
    assign _5512 = _1331[3:0];
    assign _5514 = _5512 == _5513;
    assign _5655 = _5514 ? _2850 : _5653;
    assign _5521 = 4'b1011;
    assign _5520 = _1331[3:0];
    assign _5522 = _5520 == _5521;
    assign _5657 = _5522 ? _2850 : _5655;
    assign _2860 = _1331[4:4];
    assign _2857 = _1331[5:5];
    assign _2858 = ~ _2857;
    assign _2855 = _1245 == _1075;
    assign _2856 = _1244 & _2855;
    assign _2859 = _2856 & _2858;
    assign _2861 = _2859 & _2860;
    assign _5658 = _2861 ? _5657 : _1067;
    assign _256 = _5658;
    always @(posedge _277) begin
        if (_275)
            _5673 <= _1067;
        else
            _5673 <= _256;
    end
    assign _1368 = 4'b1111;
    assign _1367 = _1331[3:0];
    assign _1369 = _1367 == _1368;
    assign _5661 = _1369 ? _2850 : _1067;
    assign _1346 = _1245 == _2203;
    assign _1347 = _1244 & _1346;
    assign _5662 = _1347 ? _5661 : _1067;
    assign _257 = _5662;
    always @(posedge _277) begin
        if (_275)
            _1356 <= _1067;
        else
            _1356 <= _257;
    end
    assign _5670 = _1383 | _1356;
    assign _5674 = _5670 | _5673;
    assign _5675 = f_sweeping & _5674;
    assign _5681 = _5675 ? _1067 : _5679;
    assign _5529 = ~ f_sweeping;
    assign _5665 = _1261[4:4];
    assign _5664 = _2790 == _2873;
    assign _5666 = _5664 ? _5665 : _1067;
    assign _5667 = _2788 ? _5666 : _1067;
    assign _258 = _5667;
    always @(posedge _277) begin
        if (_275)
            _5527 <= _1067;
        else
            _5527 <= _258;
    end
    assign _5528 = _5527 & _1311;
    assign _5530 = _5528 & _5529;
    assign _5669 = _5530 ? _2850 : f_sweeping;
    assign _5682 = f_sweeping ? _5681 : _5669;
    assign _259 = _5682;
    always @(posedge _277) begin
        if (_275)
            f_sweeping <= _1067;
        else
            f_sweeping <= _259;
    end
    assign _5695 = f_sweeping ? _5694 : _5687;
    assign _260 = _5695;
    always @(posedge _277) begin
        if (_275)
            f_image_valid <= _1067;
        else
            f_image_valid <= _260;
    end
    assign _5698 = _1261[0:0];
    assign _2790 = _1331[3:0];
    assign _5697 = _2790 == _2873;
    assign _5699 = _5697 ? _5698 : _1067;
    assign _2786 = _1331[4:4];
    assign _2787 = ~ _2786;
    assign _2783 = _1331[5:5];
    assign _2784 = ~ _2783;
    assign _2781 = _1245 == _1075;
    assign _1243 = ~ _1242;
    assign _1238 = _1232 & _1237;
    assign _1244 = _1238 & _1243;
    assign _2782 = _1244 & _2781;
    assign _2785 = _2782 & _2784;
    assign _2788 = _2785 & _2787;
    assign _5700 = _2788 ? _5699 : _1067;
    assign _261 = _5700;
    always @(posedge _277) begin
        if (_275)
            _1383 <= _1067;
        else
            _1383 <= _261;
    end
    assign _1387 = _1383 & f_image_valid;
    assign _5727 = _1387 ? _1274 : _5725;
    assign _262 = _5727;
    always @(posedge _277) begin
        if (_275)
            _284 <= _1395;
        else
            _284 <= _262;
    end
    assign _1311 = _284 == _1395;
    assign _1593 = ~ _1311;
    assign _263 = _1593;
    assign _5791 = { _263,
                     _101,
                     _99,
                     _91,
                     _5789,
                     _5790,
                     _88,
                     _87 };
    assign _5788 = _1331[3:0];
    always @* begin
        case (_5788)
        0:
            _5809 <= _5791;
        1:
            _5809 <= _5793;
        2:
            _5809 <= _5795;
        3:
            _5809 <= _5797;
        4:
            _5809 <= _1461;
        5:
            _5809 <= _606;
        6:
            _5809 <= _5798;
        7:
            _5809 <= _5800;
        8:
            _5809 <= _5801;
        9:
            _5809 <= _5802;
        10:
            _5809 <= _5803;
        11:
            _5809 <= _5804;
        12:
            _5809 <= _5805;
        13:
            _5809 <= _5806;
        14:
            _5809 <= _1283;
        default:
            _5809 <= _1283;
        endcase
    end
    assign _5787 = _1331[4:4];
    assign _5826 = _5787 ? _5825 : _5809;
    assign _5746 = _1331[15:3];
    assign _5748 = { _5746,
                     _1075 };
    assign _5745 = _1331 + _5461;
    assign _5740 = _1331[2:0];
    assign _5742 = _5740 == _2227;
    assign _5739 = _1245 == _2215;
    assign _5743 = _5739 & _5742;
    assign _5749 = _5743 ? _5748 : _5745;
    assign _5735 = _1331[15:8];
    assign _5736 = { _5735,
                     _1261 };
    assign _5732 = _1331[7:0];
    assign _5733 = { _1261,
                     _5732 };
    assign _5731 = _1235 == _1274;
    assign _5734 = _5731 ? _5733 : _1331;
    assign _5729 = _1235 == _1275;
    assign _5737 = _5729 ? _5736 : _5734;
    assign _5750 = _1237 ? _5749 : _5737;
    assign _5751 = _1232 ? _5750 : _1331;
    assign _264 = _5751;
    always @(posedge _277) begin
        if (_275)
            _1331 <= _1174;
        else
            _1331 <= _264;
    end
    assign _5786 = _1331[5:5];
    assign _5835 = _5786 ? _5834 : _5826;
    assign _1245 = _1241[2:0];
    always @* begin
        case (_1245)
        0:
            _5858 <= _5835;
        1:
            _5858 <= _1283;
        2:
            _5858 <= _5842;
        3:
            _5858 <= _5852;
        4:
            _5858 <= _1283;
        5:
            _5858 <= _5855;
        6:
            _5858 <= _1283;
        default:
            _5858 <= _1283;
        endcase
    end
    assign _266 = mosi;
    always @(posedge _277) begin
        if (_275)
            _1257 <= _1067;
        else
            _1257 <= _266;
    end
    always @(posedge _277) begin
        if (_275)
            _1260 <= _1067;
        else
            _1260 <= _1257;
    end
    assign _5752 = _1261[6:0];
    assign _5753 = _1226 ? _5752 : _1254;
    assign _267 = _5753;
    always @(posedge _277) begin
        if (_275)
            _1254 <= _1270;
        else
            _1254 <= _267;
    end
    assign _1261 = { _1254,
                     _1260 };
    assign _5759 = _1235 == _1395;
    assign _5760 = _5759 ? _1261 : _1241;
    assign _5761 = _1232 ? _5760 : _1241;
    assign _5763 = _5757 ? _1283 : _5761;
    assign _268 = _5763;
    always @(posedge _277) begin
        if (_275)
            _1241 <= _1283;
        else
            _1241 <= _268;
    end
    assign _1242 = _1241[7:7];
    assign _5768 = _1235 + _1274;
    assign _5765 = _1235 == _1333;
    assign _5766 = ~ _5765;
    assign _5769 = _5766 ? _5768 : _1235;
    assign _1231 = _1229 == _2239;
    assign _1232 = _1226 & _1231;
    assign _5770 = _1232 ? _5769 : _1235;
    assign _5772 = _5757 ? _1395 : _5770;
    assign _269 = _5772;
    always @(posedge _277) begin
        if (_275)
            _1235 <= _1395;
        else
            _1235 <= _269;
    end
    assign _1237 = _1235 == _1333;
    assign _5784 = _1237 & _1242;
    assign _5859 = _5784 ? _5858 : _1283;
    assign _5781 = _5780[6:0];
    assign _5783 = { _5781,
                     _1067 };
    assign _5774 = _1229 + _2203;
    assign _1225 = ~ _1224;
    assign _1221 = _1214 & _1220;
    assign _1226 = _1221 & _1225;
    assign _5775 = _1226 ? _5774 : _1229;
    assign _5777 = _5757 ? _1075 : _5775;
    assign _270 = _5777;
    always @(posedge _277) begin
        if (_275)
            _1229 <= _1075;
        else
            _1229 <= _270;
    end
    assign _2977 = _1229 == _1075;
    assign _5860 = _2977 ? _5859 : _5783;
    always @(posedge _277) begin
        if (_275)
            _1224 <= _1067;
        else
            _1224 <= _1220;
    end
    assign _272 = sck;
    always @(posedge _277) begin
        if (_275)
            _1217 <= _1067;
        else
            _1217 <= _272;
    end
    always @(posedge _277) begin
        if (_275)
            _1220 <= _1067;
        else
            _1220 <= _1217;
    end
    assign _2970 = ~ _1220;
    assign _2971 = _1214 & _2970;
    assign _2972 = _2971 & _1224;
    assign _5861 = _2972 ? _5860 : _5780;
    assign _5756 = ~ _1213;
    always @(posedge _277) begin
        if (_275)
            _5755 <= vdd;
        else
            _5755 <= _1213;
    end
    assign _5757 = _5755 & _5756;
    assign _5865 = _5757 ? _5864 : _5861;
    assign _273 = _5865;
    always @(posedge _277) begin
        if (_275)
            _5780 <= _1283;
        else
            _5780 <= _273;
    end
    assign _5866 = _5780[7:7];
    assign vdd = 1'b1;
    assign _275 = clear;
    assign _277 = clock;
    assign _279 = cs_n;
    always @(posedge _277) begin
        if (_275)
            _1211 <= vdd;
        else
            _1211 <= _279;
    end
    always @(posedge _277) begin
        if (_275)
            _1213 <= vdd;
        else
            _1213 <= _1211;
    end
    assign _1214 = ~ _1213;
    assign _5867 = _1214 & _5866;
    assign miso = _5867;
    assign irq = _1666;
    assign viol = _1637;
    assign entry = f_in_fetch;
    assign dbg = _1632;
    assign pins_out = _1580;
    assign pins_oe = _1554;
    assign ram_rec_addr = _1380;
    assign ram_rec_re = _1363;
    assign ram_rec_we = f_store_we;
    assign ram_rec_wdata = _1350;
    assign ram_cov_addr = _1344;
    assign ram_cov_re = _1325;
    assign ram_cov_we = _1322;
    assign ram_cov_wdata = _1306;

endmodule
