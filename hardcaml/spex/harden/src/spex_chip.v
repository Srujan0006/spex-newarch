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

    wire [11:0] _1298;
    wire _1295;
    wire _1296;
    wire [11:0] _1297;
    wire _1299;
    wire [11:0] _1300;
    wire [11:0] _1301;
    wire [11:0] _1287;
    wire [11:0] _1085;
    wire [11:0] _1082;
    wire [12:0] _1079;
    wire [9:0] _1076;
    wire [12:0] _1077;
    wire [12:0] _1078;
    wire [2:0] _1072;
    reg [2:0] _1052;
    wire [2:0] _1;
    reg [2:0] _1073;
    wire [12:0] _1074;
    wire [12:0] _1059;
    wire [12:0] _1058;
    wire [15:0] _1053;
    wire _1057;
    wire [12:0] _1060;
    wire [12:0] _2;
    reg [12:0] _1069;
    wire _1075;
    wire [12:0] _1080;
    wire [12:0] _1066;
    wire _1081;
    wire [11:0] _1084;
    wire _1064;
    wire [15:0] _1061;
    wire _1062;
    wire _3;
    reg _1065;
    wire [11:0] _1086;
    wire [11:0] _4;
    reg [11:0] _1288;
    wire [11:0] _1089;
    reg [1:0] _1055;
    reg [15:0] _1056;
    wire [15:0] _1087;
    wire _1088;
    wire [11:0] _1091;
    wire [11:0] _5;
    reg [11:0] _1285;
    wire _1289;
    wire _1290;
    wire [11:0] _1291;
    wire [11:0] _1282;
    wire _1292;
    wire [11:0] _1293;
    wire [7:0] _1280;
    wire _1281;
    wire [11:0] _1294;
    wire [7:0] _1278;
    wire [7:0] _1277;
    wire [1:0] _1272;
    wire [1:0] _1271;
    wire _1205;
    wire _1197;
    wire _1206;
    wire _6;
    reg _1270;
    wire [1:0] _1273;
    wire [6:0] _1267;
    wire [8:0] _1274;
    wire [7:0] _1265;
    wire [8:0] _1266;
    wire [8:0] _1275;
    wire _1276;
    wire [7:0] _1279;
    wire [31:0] _1302;
    wire [31:0] _1247;
    wire [23:0] _1259;
    wire [31:0] _1260;
    wire [31:0] _1261;
    wire [31:0] _7;
    reg [31:0] _1248;
    wire [31:0] _1303;
    wire _1319;
    wire _1317;
    wire _1312;
    wire _1310;
    wire _1309;
    wire _1311;
    wire _1313;
    wire f_host_cov_we;
    wire _1321;
    wire _1320;
    wire _1322;
    wire [7:0] _11;
    reg [7:0] _1340;
    wire [7:0] _1332;
    wire [7:0] _1333;
    wire [7:0] _1334;
    wire [7:0] _12;
    reg [7:0] _1325;
    wire [7:0] _1335;
    wire [7:0] _1336;
    wire [7:0] _1337;
    wire [7:0] _1341;
    wire [127:0] _1346;
    wire [119:0] _1348;
    wire [127:0] _1349;
    wire [127:0] _1350;
    wire [127:0] _14;
    reg [127:0] _1347;
    wire _1360;
    wire [1:0] _1375;
    wire [7:0] _1376;
    wire [7:0] _1373;
    wire [7:0] _1367;
    wire [7:0] _1368;
    wire [7:0] _1369;
    wire [7:0] _18;
    reg [7:0] _1363;
    wire [7:0] _1374;
    wire [2:0] _1357;
    wire _1358;
    wire _1359;
    wire [7:0] _1377;
    wire [7:0] _1549;
    wire [7:0] _1550;
    wire [7:0] _1413;
    wire [7:0] _1411;
    wire [7:0] _1410;
    wire [7:0] _1409;
    wire [7:0] _1408;
    reg [7:0] _1412;
    wire [7:0] _1414;
    wire [7:0] _1415;
    wire [7:0] _1406;
    wire [7:0] _1407;
    wire [7:0] _1416;
    wire [7:0] _1450;
    wire [7:0] _1451;
    wire [7:0] _1453;
    wire [7:0] _1455;
    wire [7:0] _20;
    reg [7:0] f_poe;
    wire [7:0] _1551;
    wire [7:0] _1576;
    wire _1546;
    wire _1545;
    wire _1543;
    wire _1544;
    wire _1542;
    wire _1541;
    wire _1540;
    wire [2:0] _1539;
    reg _1547;
    wire _1537;
    wire _1536;
    wire _1534;
    wire _1535;
    wire _1533;
    wire _1532;
    wire _1531;
    wire [2:0] _1530;
    reg _1538;
    wire _1528;
    wire _1527;
    wire _1525;
    wire _1526;
    wire _1524;
    wire _1523;
    wire _1522;
    wire [2:0] _1521;
    reg _1529;
    wire _1519;
    wire _1518;
    wire _1516;
    wire _1517;
    wire _1515;
    wire _1514;
    wire _1513;
    wire [2:0] _1512;
    reg _1520;
    wire _1510;
    wire _1509;
    wire _1507;
    wire _1508;
    wire _1506;
    wire _1505;
    wire _1504;
    wire [2:0] _1503;
    reg _1511;
    wire _1501;
    wire _1500;
    wire _1498;
    wire _1499;
    wire _1497;
    wire _1496;
    wire _1495;
    wire [2:0] _1494;
    reg _1502;
    wire _1492;
    wire _1491;
    wire _1489;
    wire _1490;
    wire _1488;
    wire _1487;
    wire _1486;
    wire [2:0] _1485;
    reg _1493;
    wire _1483;
    wire _1482;
    wire _1478;
    wire _1479;
    wire _1477;
    wire _1476;
    wire [2:0] _1568;
    wire _1565;
    wire [1:0] _1566;
    wire [3:0] _1567;
    wire [6:0] _1569;
    wire [7:0] _1570;
    wire [7:0] _1571;
    wire _1447;
    wire _1446;
    wire _1445;
    wire _1443;
    wire _1444;
    wire _1441;
    wire _1442;
    wire _1438;
    wire _1439;
    wire _1440;
    wire _1435;
    wire _1436;
    wire _1437;
    wire _1432;
    wire _1431;
    wire _1433;
    wire _1430;
    wire _1434;
    wire [7:0] _1448;
    wire _1417;
    wire _1423;
    wire [7:0] _1449;
    wire [7:0] _1563;
    wire [7:0] _1559;
    wire [7:0] _1557;
    wire [7:0] _1556;
    wire [7:0] _1555;
    wire [7:0] _1554;
    reg [7:0] _1558;
    wire [7:0] _1560;
    wire [7:0] _1561;
    wire [7:0] _1404;
    wire [7:0] _1402;
    wire [7:0] _1401;
    wire [7:0] _1400;
    wire [7:0] _1399;
    reg [7:0] _1403;
    wire [7:0] _1405;
    wire [7:0] _1552;
    wire [7:0] _1553;
    wire [7:0] _1562;
    wire [7:0] _1564;
    wire [7:0] _1572;
    wire [1:0] _1392;
    wire _1393;
    wire _1394;
    wire _1395;
    wire [7:0] _1573;
    wire [7:0] _1575;
    wire [7:0] _22;
    reg [7:0] f_pout;
    wire _1473;
    wire [23:0] _1468;
    wire [2:0] _1469;
    reg _1484;
    wire [7:0] _1548;
    wire [7:0] _1577;
    reg [1:0] _1621;
    wire [3:0] _1628;
    reg _1587;
    wire [3:0] _1594;
    reg [1:0] _1583;
    wire [1:0] _1580;
    wire [3:0] _1584;
    wire [3:0] _1579;
    wire [1:0] _1578;
    reg [3:0] _1629;
    reg _1634;
    wire _5499;
    wire _5498;
    wire [7:0] _5500;
    wire [2:0] _1727;
    wire _1728;
    wire _1729;
    reg [7:0] _1730;
    wire [2:0] _1721;
    wire _1722;
    wire _1723;
    reg [7:0] _1724;
    wire [2:0] _1715;
    wire _1716;
    wire _1717;
    reg [7:0] _1718;
    wire _1710;
    wire _1711;
    reg [7:0] _1712;
    wire [2:0] _1703;
    wire _1704;
    wire _1705;
    reg [7:0] _1706;
    wire [2:0] _1697;
    wire _1698;
    wire _1699;
    reg [7:0] _1700;
    wire [2:0] _1691;
    wire _1692;
    wire _1693;
    reg [7:0] _1694;
    wire [2:0] _1668;
    wire [2:0] _1669;
    wire [2:0] _28;
    reg [2:0] _1666;
    wire _1686;
    wire _1687;
    reg [7:0] _1688;
    wire [2:0] _1681;
    wire [2:0] _1682;
    wire [2:0] _29;
    reg [2:0] _1679;
    reg [7:0] _1731;
    wire [7:0] _30;
    wire [7:0] _5491;
    wire [7:0] _5485;
    wire [7:0] _5484;
    wire [7:0] _5483;
    wire [7:0] _5482;
    wire [7:0] _5481;
    wire _2091;
    wire _2092;
    wire [47:0] _2089;
    reg [47:0] _2093;
    wire _2085;
    wire _2086;
    reg [47:0] _2087;
    wire _2079;
    wire _2080;
    reg [47:0] _2081;
    wire _2073;
    wire _2074;
    reg [47:0] _2075;
    wire _2067;
    wire _2068;
    reg [47:0] _2069;
    wire _2061;
    wire _2062;
    reg [47:0] _2063;
    wire _2055;
    wire _2056;
    reg [47:0] _2057;
    wire [2:0] _1740;
    wire [2:0] _1741;
    wire [2:0] _31;
    reg [2:0] _1738;
    wire _2049;
    wire _2050;
    wire [1:0] _1616;
    wire [1:0] _1618;
    wire [2:0] _2032;
    wire [28:0] _1749;
    wire [28:0] _1748;
    wire [28:0] _1751;
    wire [28:0] _1752;
    wire [2:0] _1745;
    wire _1747;
    wire [28:0] _1753;
    wire [28:0] _32;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2030;
    wire [2:0] _1771;
    wire _1767;
    wire _1768;
    wire _1765;
    wire _1769;
    wire [2:0] _1772;
    wire _1762;
    wire _1763;
    wire _1760;
    wire _1759;
    wire _1761;
    wire _1764;
    wire [2:0] _1774;
    wire _1755;
    wire [2:0] _1775;
    wire [2:0] _33;
    reg [2:0] _1758;
    wire _2021;
    wire [2:0] _2023;
    wire [2:0] _1792;
    wire _1788;
    wire _1789;
    wire _1786;
    wire _1790;
    wire [2:0] _1793;
    wire _1783;
    wire _1784;
    wire _1781;
    wire _1780;
    wire _1782;
    wire _1785;
    wire [2:0] _1795;
    wire _1776;
    wire [2:0] _1796;
    wire [2:0] _34;
    reg [2:0] _1779;
    wire _2018;
    wire [2:0] _2020;
    wire [2:0] _2024;
    wire [2:0] _1813;
    wire _1809;
    wire _1810;
    wire _1807;
    wire _1811;
    wire [2:0] _1814;
    wire _1804;
    wire _1805;
    wire _1802;
    wire _1801;
    wire _1803;
    wire _1806;
    wire [2:0] _1816;
    wire _1797;
    wire [2:0] _1817;
    wire [2:0] _35;
    reg [2:0] _1800;
    wire _2014;
    wire [2:0] _2016;
    wire [2:0] _1834;
    wire _1830;
    wire _1831;
    wire _1828;
    wire _1832;
    wire [2:0] _1835;
    wire _1825;
    wire _1826;
    wire _1823;
    wire _1822;
    wire _1824;
    wire _1827;
    wire [2:0] _1837;
    wire _1818;
    wire [2:0] _1838;
    wire [2:0] _36;
    reg [2:0] _1821;
    wire _2011;
    wire [2:0] _2013;
    wire [2:0] _2017;
    wire [2:0] _2025;
    wire [2:0] _1855;
    wire _1851;
    wire _1852;
    wire _1849;
    wire _1853;
    wire [2:0] _1856;
    wire _1846;
    wire _1847;
    wire _1844;
    wire _1843;
    wire _1845;
    wire _1848;
    wire [2:0] _1858;
    wire _1839;
    wire [2:0] _1859;
    wire [2:0] _37;
    reg [2:0] _1842;
    wire _2006;
    wire [2:0] _2008;
    wire [2:0] _1876;
    wire _1872;
    wire _1873;
    wire _1870;
    wire _1874;
    wire [2:0] _1877;
    wire _1867;
    wire _1868;
    wire _1865;
    wire _1864;
    wire _1866;
    wire _1869;
    wire [2:0] _1879;
    wire _1860;
    wire [2:0] _1880;
    wire [2:0] _38;
    reg [2:0] _1863;
    wire _2003;
    wire [2:0] _2005;
    wire [2:0] _2009;
    wire [2:0] _1897;
    wire _1893;
    wire _1894;
    wire _1891;
    wire _1895;
    wire [2:0] _1898;
    wire _1888;
    wire _1889;
    wire _1886;
    wire _1885;
    wire _1887;
    wire _1890;
    wire [2:0] _1900;
    wire _1881;
    wire [2:0] _1901;
    wire [2:0] _39;
    reg [2:0] _1884;
    wire _1999;
    wire [2:0] _2001;
    wire [2:0] _1918;
    wire _1914;
    wire _1915;
    wire _1912;
    wire _1916;
    wire [2:0] _1919;
    wire _1909;
    wire _1910;
    wire _1907;
    wire _1906;
    wire _1908;
    wire _1911;
    wire [2:0] _1921;
    wire _1902;
    wire [2:0] _1922;
    wire [2:0] _40;
    reg [2:0] _1905;
    wire _1996;
    wire [2:0] _1998;
    wire [2:0] _2002;
    wire [2:0] _2010;
    wire [2:0] _2026;
    wire _1991;
    wire _1990;
    wire _1992;
    wire _1988;
    wire _1987;
    wire _1989;
    wire _1993;
    wire _1984;
    wire _1983;
    wire _1985;
    wire _1981;
    wire _1980;
    wire _1982;
    wire _1986;
    wire _1994;
    wire [2:0] _2027;
    wire _1969;
    wire _1968;
    wire _1970;
    wire [2:0] _1972;
    wire _1964;
    wire _1963;
    wire _1965;
    wire [2:0] _1967;
    wire _1973;
    wire [2:0] _1974;
    wire _1957;
    wire _1956;
    wire _1958;
    wire [2:0] _1960;
    wire _1952;
    wire _1951;
    wire _1953;
    wire [2:0] _1955;
    wire _1961;
    wire [2:0] _1962;
    wire _1975;
    wire [2:0] _1976;
    wire _1943;
    wire _1942;
    wire _1944;
    wire [2:0] _1946;
    wire _1938;
    wire _1937;
    wire _1939;
    wire [2:0] _1941;
    wire _1947;
    wire [2:0] _1948;
    wire _1931;
    wire _1930;
    wire _1932;
    wire [2:0] _1934;
    wire _1926;
    wire _1925;
    wire _1927;
    wire [2:0] _1929;
    wire _1935;
    wire [2:0] _1936;
    wire _1949;
    wire [2:0] _1950;
    wire _1977;
    wire [2:0] _1978;
    wire [2:0] _1979;
    wire [2:0] _2028;
    wire [2:0] _1923;
    wire _2029;
    wire [28:0] _2031;
    wire [31:0] _2033;
    wire [47:0] _2034;
    wire [47:0] _41;
    reg [47:0] _2051;
    wire [2:0] _2044;
    wire [2:0] _2045;
    wire [2:0] _42;
    reg [2:0] _2042;
    reg [47:0] _2094;
    wire [47:0] _43;
    wire [7:0] _5480;
    wire [2:0] _5479;
    reg [7:0] _5486;
    wire [7:0] _5488;
    wire [7:0] _5477;
    wire [7:0] _5476;
    wire [7:0] _5475;
    wire [31:0] _45;
    wire _2095;
    wire _2096;
    wire [31:0] _2098;
    wire [31:0] _46;
    wire [7:0] _5474;
    wire [1:0] _5473;
    reg [7:0] _5478;
    wire [7:0] _5468;
    wire [7:0] _5467;
    wire [7:0] _5466;
    wire [7:0] _5465;
    wire [7:0] _2334;
    wire [7:0] _2335;
    wire _2331;
    wire _2332;
    wire _2324;
    wire _2321;
    wire _2322;
    wire _2318;
    wire _2315;
    wire _2316;
    wire _2317;
    wire _2319;
    wire _2323;
    wire _2325;
    wire _2311;
    wire _2326;
    wire _2333;
    wire [7:0] _2336;
    wire [7:0] _2338;
    wire [7:0] _47;
    reg [7:0] _2329;
    wire [7:0] _2578;
    wire _2574;
    wire _2575;
    wire _2567;
    wire _2564;
    wire _2565;
    wire _2561;
    wire _2558;
    wire _2559;
    wire _2560;
    wire _2562;
    wire _2566;
    wire _2568;
    wire _2310;
    wire _2553;
    wire _2554;
    wire _2569;
    wire _2576;
    wire [7:0] _2579;
    wire [7:0] _2581;
    wire [7:0] _48;
    reg [7:0] _2572;
    wire [7:0] _2614;
    wire _2610;
    wire _2611;
    wire _2604;
    wire _2605;
    wire _2612;
    wire [7:0] _2615;
    wire [7:0] _2617;
    wire [7:0] _49;
    reg [7:0] _2608;
    wire [7:0] _2627;
    wire _2623;
    wire _2624;
    wire _2625;
    wire [7:0] _2628;
    wire [7:0] _2630;
    wire [7:0] _50;
    reg [7:0] _2621;
    wire [7:0] _2659;
    wire _2655;
    wire _2656;
    wire _2657;
    wire [7:0] _2660;
    wire _2644;
    wire _2643;
    wire _2645;
    wire _2646;
    wire _51;
    reg _2101;
    wire [7:0] _2662;
    wire [7:0] _52;
    reg [7:0] _2653;
    wire [39:0] _2663;
    wire [39:0] _53;
    wire [7:0] _5464;
    wire [2:0] _5463;
    reg [7:0] _5470;
    wire [2:0] _5459;
    wire [3:0] _5458;
    wire [7:0] _5460;
    wire [7:0] _5457;
    wire [7:0] _5456;
    wire [7:0] _5455;
    wire [4:0] _5452;
    wire _2701;
    wire _2679;
    wire _2697;
    wire _2702;
    wire _2704;
    wire _54;
    reg _2700;
    wire _55;
    wire _56;
    wire _57;
    wire [7:0] _5453;
    wire [3:0] _2714;
    wire [3:0] _2713;
    wire _2715;
    wire [7:0] _2716;
    wire [7:0] _2717;
    wire [7:0] _58;
    reg [7:0] _1461;
    wire [3:0] _2719;
    wire [3:0] _2718;
    wire _2720;
    wire [7:0] _2721;
    wire [7:0] _2722;
    wire [7:0] _59;
    reg [7:0] _1464;
    wire [3:0] _2724;
    wire [3:0] _2723;
    wire _2725;
    wire [7:0] _2726;
    wire [7:0] _2727;
    wire [7:0] _60;
    reg [7:0] _1467;
    wire [3:0] _5451;
    reg [7:0] _5461;
    wire [7:0] _5447;
    wire [2:0] _2767;
    wire [2:0] _2749;
    wire [2:0] _2750;
    wire [2:0] _2768;
    wire [2:0] _2770;
    wire [2:0] _2772;
    wire [2:0] _61;
    reg [2:0] _2746;
    wire [7:0] _2819;
    wire [2:0] _2812;
    wire [2:0] _2794;
    wire [2:0] _2795;
    wire [2:0] _2813;
    wire [2:0] _2815;
    wire [2:0] _2817;
    wire [2:0] _62;
    reg [2:0] _2791;
    wire [7:0] _2818;
    wire [15:0] _2820;
    wire [15:0] _63;
    wire [7:0] _5446;
    wire [7:0] _5445;
    wire [7:0] _5444;
    wire [23:0] _2825;
    wire [23:0] _2837;
    wire [3:0] _2834;
    wire [3:0] _2833;
    wire _2835;
    wire _2831;
    wire _2829;
    wire _2832;
    wire _2836;
    wire [23:0] _2838;
    wire [23:0] _2839;
    wire [23:0] _2840;
    wire [23:0] _64;
    reg [23:0] _2826;
    wire [7:0] _5443;
    wire [31:0] _2841;
    wire [31:0] _2842;
    wire [31:0] _65;
    reg [31:0] ts_reg;
    wire [31:0] _66;
    wire [7:0] _5442;
    wire [5:0] _67;
    wire [7:0] _5441;
    wire [2:0] _2908;
    wire [2:0] _2910;
    wire [2:0] _68;
    reg [2:0] _2907;
    wire [2:0] _69;
    wire _2903;
    wire [2:0] _2893;
    wire [2:0] _2890;
    wire [2:0] _2894;
    wire [2:0] _2887;
    wire [2:0] _2895;
    wire _2881;
    wire _2875;
    wire _2876;
    wire _2877;
    wire _2882;
    wire _2871;
    wire _2872;
    wire _2867;
    wire _2869;
    wire _2918;
    wire _2920;
    wire [1:0] _2922;
    wire _2915;
    wire _2917;
    wire [1:0] _2924;
    wire [1:0] _2925;
    wire [1:0] _70;
    reg [1:0] _2863;
    wire _2864;
    wire _2866;
    wire _2870;
    wire _2873;
    wire _71;
    reg _1264;
    wire _2857;
    wire _2856;
    wire _2858;
    wire _2854;
    wire _2851;
    wire _2846;
    wire _2847;
    wire _2848;
    wire _2849;
    wire _2852;
    wire [1:0] _1330;
    wire [1:0] _1329;
    wire _1331;
    wire _2928;
    wire _1244;
    wire _1245;
    wire _2929;
    wire _72;
    reg _1306;
    wire _2853;
    wire _2855;
    wire _2859;
    wire _2843;
    wire _2844;
    wire _2860;
    wire _2874;
    wire _2883;
    wire [2:0] _2896;
    wire _2898;
    wire _2899;
    wire _2904;
    wire _2936;
    wire _2932;
    wire _2931;
    wire _2933;
    wire _2934;
    wire _73;
    reg _2666;
    wire _2938;
    wire _74;
    reg _2902;
    wire _75;
    wire _76;
    wire [7:0] _77;
    reg [7:0] _1204;
    wire [7:0] _1201;
    wire _2648;
    wire _2649;
    wire _2939;
    wire _2940;
    wire _78;
    reg _1196;
    wire _1192;
    wire _1193;
    wire _2647;
    wire _2650;
    wire _2942;
    wire _2944;
    wire _79;
    reg _1627;
    wire _80;
    wire _2618;
    wire _2949;
    wire _2951;
    wire _81;
    reg _2947;
    wire _82;
    wire _2955;
    wire _2602;
    wire _2595;
    wire _2603;
    wire _2551;
    wire _2547;
    wire _2552;
    wire _2952;
    wire _83;
    wire _2953;
    wire _2954;
    wire _2956;
    wire _2958;
    wire _2960;
    wire _84;
    reg _1624;
    wire _85;
    wire [7:0] _5439;
    wire [3:0] _2961;
    wire _2962;
    wire [7:0] _2963;
    wire [7:0] _2964;
    wire [7:0] _86;
    reg [7:0] _1458;
    wire [7:0] _5438;
    wire [7:0] _5436;
    wire [7:0] _5434;
    wire _87;
    wire _88;
    wire _89;
    wire _5431;
    wire _90;
    wire _5430;
    wire _1588;
    wire _1589;
    wire _91;
    wire _2973;
    wire _2974;
    wire _2976;
    wire _2967;
    wire _2966;
    wire _2968;
    wire _2969;
    wire _92;
    reg _2972;
    wire _2978;
    wire _2980;
    wire _93;
    reg _1660;
    wire [3:0] _2997;
    wire [3:0] _2995;
    wire [3:0] _2998;
    wire _2038;
    wire [2:0] _2986;
    wire _2988;
    wire _2984;
    wire _2985;
    wire _2989;
    wire _2992;
    wire _94;
    reg _2037;
    wire _2039;
    wire _1733;
    wire _1734;
    wire _95;
    wire _1735;
    wire _2993;
    wire [3:0] _2999;
    reg [3:0] _3002;
    wire [3:0] _96;
    wire _1654;
    wire _1655;
    wire [2:0] _1647;
    wire [3:0] _1648;
    wire _1649;
    wire _1650;
    wire _1646;
    wire _1651;
    wire [2:0] _3007;
    wire [3:0] _3006;
    wire [6:0] _3008;
    wire [3:0] _3004;
    wire [3:0] _3003;
    wire _3005;
    wire [6:0] _3009;
    wire [6:0] _3010;
    wire [6:0] _97;
    reg [6:0] _1637;
    wire [2:0] _1638;
    wire _1640;
    wire [2:0] _1642;
    wire [3:0] _1643;
    wire _1644;
    wire _1645;
    wire _1652;
    wire _1656;
    wire _1657;
    wire _1661;
    wire _98;
    wire _3016;
    wire _3018;
    wire _3014;
    wire _3020;
    wire _3021;
    wire _3022;
    wire _3012;
    wire _3023;
    wire _3025;
    wire _99;
    reg _1593;
    wire _100;
    wire [1:0] _5363;
    wire [1:0] _5359;
    wire _5350;
    wire [1:0] _5352;
    wire _5349;
    wire [1:0] _5354;
    wire _5348;
    wire [1:0] _5356;
    wire [1:0] _5357;
    wire [7:0] _1183;
    wire _1185;
    wire _1176;
    wire [15:0] _1171;
    wire _1172;
    wire _1173;
    wire _1170;
    wire _1174;
    wire _1177;
    wire [3:0] _1167;
    wire _1169;
    wire _1178;
    wire _1165;
    wire _1161;
    wire _1162;
    wire _1159;
    wire _1163;
    wire _1166;
    wire _1157;
    reg [2:0] _1051;
    wire [15:0] _1152;
    wire _1153;
    wire _1150;
    wire _1154;
    wire _1148;
    wire _1155;
    wire _1158;
    wire [1:0] _1147;
    reg _1179;
    wire _1146;
    wire _1180;
    wire _1143;
    wire [3:0] _1141;
    reg _1142;
    wire _1144;
    wire [15:0] _1136;
    wire _1138;
    wire [16:0] _1131;
    wire [15:0] _1127;
    wire [16:0] _1128;
    wire [16:0] _1129;
    reg [16:0] _1132;
    wire _1133;
    wire _1134;
    wire [15:0] _1123;
    wire _1125;
    wire _1040;
    wire [2:0] _1042;
    wire _1037;
    wire [2:0] _1039;
    wire _1043;
    wire [2:0] _1044;
    wire _1032;
    wire [2:0] _1034;
    wire _1029;
    wire [2:0] _1031;
    wire _1035;
    wire [2:0] _1036;
    wire _1045;
    wire [2:0] _1046;
    wire _1022;
    wire [2:0] _1024;
    wire _1019;
    wire [2:0] _1021;
    wire _1025;
    wire [2:0] _1026;
    wire _1014;
    wire [2:0] _1016;
    wire [7:0] _1010;
    wire _1011;
    wire [2:0] _1013;
    wire _1017;
    wire [2:0] _1018;
    wire _1027;
    wire [2:0] _1028;
    wire _1047;
    wire [2:0] _1048;
    wire [13:0] _1115;
    wire [16:0] _1116;
    wire [111:0] _1009;
    wire [15:0] _1113;
    wire [16:0] _1114;
    wire [16:0] _1117;
    reg [16:0] _1120;
    wire [16:0] _1112;
    wire _1121;
    wire _1122;
    wire _1126;
    wire _1135;
    wire [1:0] _1054;
    reg [15:0] _1109;
    wire _1111;
    wire _1139;
    wire [7:0] _1103;
    wire _1105;
    wire _1106;
    wire _1102;
    wire _1107;
    wire [7:0] _1096;
    wire [7:0] _1094;
    wire [7:0] _1095;
    wire [7:0] _1097;
    wire _1099;
    wire _1100;
    wire _1108;
    wire _1140;
    wire _1145;
    wire _1181;
    wire _1182;
    wire _1186;
    wire f_fire3;
    wire [7:0] _688;
    wire _690;
    wire _676;
    wire _672;
    wire _673;
    wire _670;
    wire _674;
    wire _677;
    wire [3:0] _667;
    wire _669;
    wire _678;
    wire _665;
    wire _661;
    wire _662;
    wire _659;
    wire _663;
    wire _666;
    wire _657;
    reg [2:0] _651;
    wire [15:0] _652;
    wire _653;
    wire _647;
    wire _654;
    wire _645;
    wire _655;
    wire _658;
    wire [1:0] _644;
    reg _679;
    wire _643;
    wire _680;
    wire _635;
    wire [3:0] _578;
    reg _634;
    wire _636;
    wire [15:0] _573;
    wire _575;
    wire [15:0] _564;
    wire [16:0] _565;
    wire [16:0] _566;
    reg [16:0] _569;
    wire _570;
    wire _571;
    wire [15:0] _560;
    wire _562;
    wire _526;
    wire [2:0] _546;
    wire _505;
    wire [2:0] _525;
    wire _547;
    wire [2:0] _548;
    wire _482;
    wire [2:0] _502;
    wire _461;
    wire [2:0] _481;
    wire _503;
    wire [2:0] _504;
    wire _549;
    wire [2:0] _550;
    wire _436;
    wire [2:0] _456;
    wire _415;
    wire [2:0] _435;
    wire _457;
    wire [2:0] _458;
    wire _392;
    wire [2:0] _412;
    wire [7:0] _370;
    wire _371;
    wire [2:0] _391;
    wire _413;
    wire [2:0] _414;
    wire _459;
    wire [2:0] _460;
    wire _551;
    wire [2:0] _552;
    wire [16:0] _553;
    wire [111:0] _366;
    wire [15:0] _367;
    wire [16:0] _368;
    wire [16:0] _554;
    reg [16:0] _557;
    wire [16:0] _343;
    wire _558;
    wire _559;
    wire _563;
    wire _572;
    wire [1:0] _329;
    reg [15:0] _339;
    wire _341;
    wire _576;
    wire [7:0] _323;
    wire _325;
    wire _326;
    wire _314;
    wire _327;
    wire [7:0] _307;
    wire [7:0] _305;
    wire [7:0] _306;
    wire [7:0] _308;
    wire _310;
    wire [2:0] _5120;
    wire [5:0] _1199;
    wire [5:0] _3031;
    wire _3030;
    wire [5:0] _3032;
    wire [5:0] _3033;
    wire [5:0] _101;
    reg [5:0] _3028;
    wire [5:0] _3058;
    wire [5:0] _3039;
    wire [3:0] _3037;
    wire _3038;
    wire [5:0] _3040;
    wire [5:0] _3041;
    wire [5:0] _102;
    reg [5:0] _3036;
    wire [5:0] _3045;
    wire [5:0] _103;
    reg [5:0] _3044;
    wire _3048;
    wire [5:0] _3049;
    wire [5:0] _3050;
    wire [5:0] _3059;
    wire _3046;
    wire [5:0] _3060;
    wire [5:0] _3061;
    wire [5:0] _104;
    reg [5:0] _1200;
    wire [5:0] _3054;
    wire [5:0] _3053;
    wire [5:0] _3052;
    wire [5:0] _3051;
    reg [5:0] _3055;
    wire _3056;
    wire _3057;
    wire [2:0] _5116;
    wire _5111;
    wire [2:0] _5113;
    wire [7:0] _1611;
    wire _1613;
    wire _1614;
    wire _1609;
    wire _1610;
    wire f_unexp_now;
    wire _3065;
    wire _3066;
    wire _3068;
    wire _3069;
    wire _3064;
    wire _3062;
    wire _3070;
    wire _105;
    reg _1606;
    wire _1607;
    wire [15:0] _5102;
    wire [15:0] _5103;
    wire _5099;
    wire _5100;
    wire _5101;
    wire [15:0] _5104;
    wire [2:0] _5044;
    wire [2:0] _5042;
    wire [2:0] _5041;
    wire [2:0] _5040;
    wire [2:0] _5039;
    wire [7:0] _997;
    wire _999;
    wire _990;
    wire _986;
    wire _987;
    wire _984;
    wire _988;
    wire _991;
    wire [3:0] _981;
    wire _983;
    wire _992;
    wire _979;
    wire _975;
    wire _976;
    wire _973;
    wire _977;
    wire _980;
    wire _971;
    reg [2:0] _965;
    wire [15:0] _966;
    wire _967;
    wire _961;
    wire _968;
    wire _959;
    wire _969;
    wire _972;
    wire [1:0] _958;
    reg _993;
    wire _957;
    wire _994;
    wire _954;
    wire [3:0] _952;
    reg _953;
    wire _955;
    wire [15:0] _947;
    wire _949;
    wire [15:0] _938;
    wire [16:0] _939;
    wire [16:0] _940;
    reg [16:0] _943;
    wire _944;
    wire _945;
    wire [15:0] _934;
    wire _936;
    wire _918;
    wire [2:0] _920;
    wire _915;
    wire [2:0] _917;
    wire _921;
    wire [2:0] _922;
    wire _910;
    wire [2:0] _912;
    wire _907;
    wire [2:0] _909;
    wire _913;
    wire [2:0] _914;
    wire _923;
    wire [2:0] _924;
    wire _900;
    wire [2:0] _902;
    wire _897;
    wire [2:0] _899;
    wire _903;
    wire [2:0] _904;
    wire _892;
    wire [2:0] _894;
    wire [7:0] _888;
    wire _889;
    wire [2:0] _891;
    wire _895;
    wire [2:0] _896;
    wire _905;
    wire [2:0] _906;
    wire _925;
    wire [2:0] _926;
    wire [16:0] _927;
    wire [111:0] _884;
    wire [15:0] _885;
    wire [16:0] _886;
    wire [16:0] _928;
    reg [16:0] _931;
    wire [16:0] _883;
    wire _932;
    wire _933;
    wire _937;
    wire _946;
    wire [1:0] _879;
    reg [15:0] _880;
    wire _882;
    wire _950;
    wire [7:0] _873;
    wire _875;
    wire _876;
    wire _872;
    wire _877;
    wire [7:0] _866;
    wire [7:0] _864;
    wire [7:0] _865;
    wire [7:0] _867;
    wire _869;
    wire _870;
    wire _878;
    wire _951;
    wire _956;
    wire _995;
    wire _996;
    wire _1000;
    wire f_fire2;
    wire [1:0] _1004;
    wire [1:0] f_policy;
    wire _723;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _713;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _707;
    wire [7:0] _701;
    wire [7:0] f_chgmask0;
    wire [7:0] _695;
    wire [7:0] f_watch;
    wire [7:0] _696;
    wire [7:0] _702;
    wire [7:0] _708;
    wire [7:0] f_relevant;
    wire [7:0] _715;
    wire _717;
    wire _718;
    wire f_amb_now;
    wire _720;
    wire _724;
    wire [7:0] _686;
    wire [7:0] _3075;
    wire [7:0] _3076;
    wire _3072;
    wire [7:0] _3074;
    wire _3071;
    wire [7:0] _3077;
    wire [7:0] _3079;
    wire [7:0] _106;
    reg [7:0] _685;
    wire [7:0] f_multi_eff;
    wire [7:0] _859;
    wire _861;
    wire _852;
    wire _848;
    wire _849;
    wire _846;
    wire _850;
    wire _853;
    wire [3:0] _843;
    wire _845;
    wire _854;
    wire _841;
    wire _837;
    wire _838;
    wire _835;
    wire _839;
    wire _842;
    wire _833;
    reg [2:0] _827;
    wire [15:0] _828;
    wire _829;
    wire _823;
    wire _830;
    wire _821;
    wire _831;
    wire _834;
    wire [1:0] _820;
    reg _855;
    wire [1:0] _3080;
    wire [1:0] _3081;
    wire [1:0] _107;
    reg [1:0] _640;
    wire _642;
    wire _819;
    wire _856;
    wire _816;
    wire _3085;
    wire _3083;
    wire _3086;
    wire _3088;
    wire _3090;
    wire _108;
    reg _633;
    wire _3101;
    wire _3102;
    wire [4:0] _3098;
    wire [4:0] _3097;
    wire _3099;
    wire _3094;
    wire _3096;
    wire _3100;
    wire _3103;
    wire [7:0] _3104;
    wire [7:0] _3105;
    wire [7:0] _109;
    reg [7:0] _3093;
    wire _3116;
    wire _3117;
    wire [4:0] _3113;
    wire [4:0] _3112;
    wire _3114;
    wire _3109;
    wire _3111;
    wire _3115;
    wire _3118;
    wire [7:0] _3119;
    wire [7:0] _3120;
    wire [7:0] _110;
    reg [7:0] _3108;
    wire [15:0] _3158;
    wire _3131;
    wire _3132;
    wire [4:0] _3128;
    wire [4:0] _3127;
    wire _3129;
    wire _3124;
    wire _3126;
    wire _3130;
    wire _3133;
    wire [7:0] _3134;
    wire [7:0] _3135;
    wire [7:0] _111;
    reg [7:0] _3123;
    wire _3146;
    wire _3147;
    wire [4:0] _3143;
    wire [4:0] _3142;
    wire _3144;
    wire _3139;
    wire _3141;
    wire _3145;
    wire _3148;
    wire [7:0] _3149;
    wire [7:0] _3150;
    wire [7:0] _112;
    reg [7:0] _3138;
    wire [15:0] _3156;
    wire [15:0] _3157;
    wire [15:0] _3159;
    wire _3161;
    wire _3163;
    wire _3164;
    wire _3165;
    wire _3166;
    wire _3168;
    wire _3170;
    wire _113;
    reg _630;
    wire _3184;
    wire _3185;
    wire _3187;
    wire _3188;
    wire _3189;
    wire _3190;
    wire _3192;
    wire _114;
    reg g_crc_bad;
    wire _3186;
    wire _3195;
    wire [5:0] _3193;
    wire _3194;
    wire _3196;
    wire _3197;
    wire _3198;
    wire _3199;
    wire _3200;
    wire _3202;
    wire _3204;
    wire _115;
    reg _627;
    wire _3208;
    wire _3206;
    wire _3209;
    wire _3211;
    wire _3213;
    wire _116;
    reg _619;
    wire _3224;
    wire _3225;
    wire [4:0] _3220;
    wire _3222;
    wire _3217;
    wire _3219;
    wire _3223;
    wire _3226;
    wire [7:0] _3227;
    wire [7:0] _3228;
    wire [7:0] _117;
    reg [7:0] _3216;
    wire _3239;
    wire _3240;
    wire [4:0] _3235;
    wire _3237;
    wire _3232;
    wire _3234;
    wire _3238;
    wire _3241;
    wire [7:0] _3242;
    wire [7:0] _3243;
    wire [7:0] _118;
    reg [7:0] _3231;
    wire [15:0] _3281;
    wire _3254;
    wire _3255;
    wire [4:0] _3250;
    wire _3252;
    wire _3247;
    wire _3249;
    wire _3253;
    wire _3256;
    wire [7:0] _3257;
    wire [7:0] _3258;
    wire [7:0] _119;
    reg [7:0] _3246;
    wire _3269;
    wire _3270;
    wire [4:0] _3265;
    wire _3267;
    wire _3262;
    wire _3264;
    wire _3268;
    wire _3271;
    wire [7:0] _3272;
    wire [7:0] _3273;
    wire [7:0] _120;
    reg [7:0] _3261;
    wire [15:0] _3279;
    wire [15:0] _3280;
    wire [15:0] _3282;
    wire _3284;
    wire _3286;
    wire _3287;
    wire _3288;
    wire _3289;
    wire _3291;
    wire _3293;
    wire _121;
    reg _616;
    wire _3307;
    wire _3308;
    wire _3310;
    wire _3311;
    wire _3312;
    wire _3313;
    wire _3315;
    wire _122;
    reg g_crc_bad_0;
    wire _3309;
    wire _3318;
    wire _3317;
    wire _3319;
    wire _3320;
    wire _3321;
    wire _3322;
    wire _3323;
    wire _3325;
    wire _3327;
    wire _123;
    reg _613;
    wire [3:0] _3328;
    wire _3329;
    wire [7:0] _3330;
    wire [7:0] _3331;
    wire [7:0] _124;
    reg [7:0] _603;
    wire [6:0] _604;
    wire [6:0] _600;
    wire _605;
    wire [15:0] _597;
    wire _3336;
    wire _3335;
    wire _3337;
    wire _3334;
    wire _3338;
    wire _3333;
    wire _3339;
    wire [14:0] _3332;
    wire [15:0] _3340;
    wire [15:0] _125;
    reg [15:0] _598;
    wire _599;
    wire [3:0] _3359;
    wire [3:0] _3357;
    wire [3:0] _3360;
    wire _1674;
    wire _1675;
    wire _3342;
    wire _2981;
    wire _2982;
    wire _3343;
    wire _3346;
    wire _126;
    reg _1672;
    wire _1676;
    wire _1662;
    wire _3353;
    wire _3349;
    wire _3347;
    wire _3348;
    wire _3350;
    wire _3354;
    wire f_rx_push;
    wire _1663;
    wire _3355;
    wire [3:0] _3361;
    reg [3:0] _3364;
    wire [3:0] _128;
    wire _595;
    wire _591;
    wire [6:0] _4855;
    wire [7:0] _4856;
    wire _4853;
    wire _4852;
    wire _4851;
    wire _4850;
    wire _4849;
    wire _4848;
    wire _4847;
    wire _4846;
    wire [7:0] _4854;
    wire [3:0] _4838;
    wire [3:0] _4836;
    wire [3:0] _4839;
    wire _2309;
    wire _3390;
    wire _3387;
    wire _3370;
    wire _129;
    reg _2880;
    wire _3388;
    wire _2304;
    wire [2:0] _2298;
    wire _2293;
    wire g_tx_bit;
    wire _2294;
    wire _2295;
    wire _2296;
    wire [2:0] _2299;
    wire _2301;
    wire _2302;
    wire _2273;
    wire _2303;
    wire _2305;
    wire _2269;
    wire [5:0] _2256;
    wire _2261;
    wire _2262;
    wire [9:0] _2252;
    wire _2254;
    wire _2255;
    wire _2263;
    wire _4821;
    wire _4822;
    wire [1:0] _4825;
    wire _4814;
    wire _4815;
    wire _4816;
    wire _4817;
    wire [1:0] _4819;
    wire [2:0] _4800;
    wire [2:0] _4797;
    wire _4793;
    wire _4791;
    wire _4792;
    wire _4794;
    wire [2:0] _4798;
    wire _4789;
    wire [2:0] _4801;
    wire _4802;
    wire [2:0] _4783;
    wire _4779;
    wire _4777;
    wire _4778;
    wire _4780;
    wire [2:0] _4784;
    wire _4775;
    wire [2:0] _4786;
    wire _4787;
    wire _4803;
    wire _4804;
    wire _4805;
    wire _4771;
    wire _4769;
    wire _4772;
    wire [15:0] _4764;
    wire _4765;
    wire _4762;
    wire _4766;
    wire _4760;
    wire _4761;
    wire _4767;
    wire _4773;
    wire _4806;
    wire [1:0] _4808;
    wire [1:0] _4810;
    wire [1:0] _4756;
    wire _4752;
    wire [1:0] _4754;
    wire [1:0] _4757;
    wire _3466;
    wire _3467;
    wire _130;
    reg _3373;
    wire _3479;
    wire _3477;
    wire _3478;
    reg _3480;
    wire _3481;
    wire _3482;
    wire _3474;
    wire _3471;
    wire _3468;
    wire _3469;
    wire _3472;
    wire _3473;
    wire _3475;
    wire _3483;
    wire _3485;
    wire _3487;
    wire _3489;
    wire _3491;
    wire _131;
    reg f_lane0_out;
    wire _2741;
    wire _2742;
    wire _2190;
    wire _2187;
    wire _2180;
    wire _2188;
    wire _2191;
    wire _2214;
    wire _2737;
    wire _2738;
    wire _2734;
    wire _2732;
    wire _2865;
    wire _4727;
    wire _4728;
    wire [1:0] _4731;
    wire _4720;
    wire _4721;
    wire _4722;
    wire _4723;
    wire [1:0] _4725;
    wire [2:0] _4706;
    wire [2:0] _4703;
    wire _4699;
    wire _4697;
    wire _4698;
    wire _4700;
    wire [2:0] _4704;
    wire _4695;
    wire [2:0] _4707;
    wire _4708;
    wire [2:0] _4689;
    wire _4685;
    wire _4683;
    wire _4684;
    wire _4686;
    wire [2:0] _4690;
    wire _4681;
    wire [2:0] _4692;
    wire _4693;
    wire _4709;
    wire _4710;
    wire _4711;
    wire _4677;
    wire _4675;
    wire _4678;
    wire [15:0] _4670;
    wire _4671;
    wire _4668;
    wire _4672;
    wire _4666;
    wire _4667;
    wire _4673;
    wire _4679;
    wire _4712;
    wire [1:0] _4714;
    wire [1:0] _4716;
    wire [1:0] _4662;
    wire _4658;
    wire [1:0] _4660;
    wire [1:0] _4663;
    wire _3523;
    wire _3524;
    wire _132;
    reg _3494;
    wire _4525;
    wire _4523;
    wire _4524;
    reg _4526;
    wire [2:0] _2466;
    wire [2:0] _4495;
    wire [2:0] _4496;
    wire [2:0] _4491;
    wire _4487;
    wire _4485;
    wire _4486;
    wire _4488;
    wire [2:0] _4492;
    wire _4483;
    wire [2:0] _4497;
    wire [2:0] _4498;
    wire [2:0] _4477;
    wire [2:0] _4478;
    wire [2:0] _4473;
    wire _3519;
    wire _3518;
    wire _3517;
    wire _3516;
    wire _3515;
    wire _3514;
    wire _3513;
    wire _3509;
    wire _3508;
    wire _3507;
    wire _3506;
    wire _3505;
    wire _3504;
    wire _3503;
    wire _3438;
    wire _3439;
    reg [7:0] _3440;
    wire _3432;
    wire _3433;
    reg [7:0] _3434;
    wire _3426;
    wire _3427;
    reg [7:0] _3428;
    wire _3420;
    wire _3421;
    reg [7:0] _3422;
    wire _3414;
    wire _3415;
    reg [7:0] _3416;
    wire _3408;
    wire _3409;
    reg [7:0] _3410;
    wire _3402;
    wire _3403;
    reg [7:0] _3404;
    wire [2:0] _3526;
    wire [2:0] _3527;
    wire [2:0] _133;
    reg [2:0] _3394;
    wire _3396;
    wire _3397;
    wire [7:0] _3591;
    wire [7:0] _3592;
    wire [7:0] _3542;
    wire [7:0] _3540;
    wire [7:0] _3543;
    wire [7:0] _134;
    reg [7:0] _3532;
    wire [7:0] _3538;
    wire [7:0] _3539;
    wire [7:0] _3584;
    wire [7:0] _3551;
    wire [7:0] _3549;
    wire [7:0] _3552;
    wire [7:0] _135;
    reg [7:0] _3548;
    wire [6:0] _3569;
    wire [7:0] _3570;
    wire [6:0] _3567;
    wire _3565;
    wire _3564;
    wire _3563;
    wire _3562;
    wire _3561;
    wire _3560;
    wire _3559;
    wire _3558;
    wire [2:0] _3556;
    wire [2:0] _3555;
    wire [2:0] _3554;
    wire [2:0] _3553;
    reg [2:0] _3557;
    reg _3566;
    wire [7:0] _3568;
    reg [7:0] _3571;
    wire [7:0] _3572;
    wire [7:0] _136;
    reg [7:0] _590;
    wire _3550;
    wire _3576;
    wire _3544;
    wire _3545;
    wire _3574;
    wire [1:0] _2588;
    wire [1:0] _2587;
    wire [1:0] _2586;
    wire [1:0] _2585;
    reg [1:0] _2589;
    wire [1:0] _2591;
    wire f_eng_push;
    wire _2594;
    wire _2600;
    wire _2597;
    wire _2598;
    wire _2596;
    wire _2599;
    wire _2601;
    wire _3577;
    wire _137;
    reg _2584;
    wire [7:0] _3583;
    wire _3541;
    wire _3581;
    wire _2544;
    wire [2:0] _2538;
    wire _2533;
    wire g_tx_bit_0;
    wire _2534;
    wire _2535;
    wire _2536;
    wire [2:0] _2539;
    wire _2541;
    wire _2542;
    wire _2513;
    wire _2543;
    wire _2545;
    wire _2509;
    wire _2510;
    wire _2546;
    wire _3528;
    wire _3529;
    wire _3579;
    wire _3582;
    wire _138;
    reg _2341;
    wire _2549;
    wire _2548;
    wire _2550;
    wire [7:0] _3585;
    wire [7:0] _3593;
    wire [7:0] _139;
    wire [7:0] _140;
    wire _3366;
    wire _3367;
    wire [7:0] _3594;
    wire [7:0] _141;
    reg [7:0] _3383;
    wire [7:0] _3384;
    reg [7:0] _3398;
    wire [2:0] _4110;
    wire _4107;
    wire _2694;
    wire _2693;
    wire _2695;
    wire _2686;
    wire _2683;
    wire [2:0] _2226;
    wire [2:0] _3978;
    wire [2:0] _3979;
    wire [2:0] _3974;
    wire _3970;
    wire _3968;
    wire _3969;
    wire _3971;
    wire [2:0] _3975;
    wire _3966;
    wire [2:0] _3980;
    wire [2:0] _3981;
    wire [2:0] _3960;
    wire [2:0] _3961;
    wire [2:0] _3956;
    wire _3952;
    wire _3950;
    wire _3951;
    wire _3953;
    wire [2:0] _3957;
    wire _3948;
    wire [2:0] _3962;
    wire [7:0] _3614;
    wire [7:0] _3615;
    wire [7:0] _142;
    reg [7:0] g_lim;
    wire [15:0] _2248;
    wire _3623;
    wire _3624;
    wire [4:0] _3620;
    wire [4:0] _3619;
    wire _3621;
    wire _3616;
    wire _3618;
    wire _3622;
    wire _3625;
    wire [7:0] _3626;
    wire [7:0] _3627;
    wire [7:0] _143;
    reg [7:0] _2242;
    wire _3635;
    wire _3636;
    wire [4:0] _3632;
    wire [4:0] _3631;
    wire _3633;
    wire _3628;
    wire _3630;
    wire _3634;
    wire _3637;
    wire [7:0] _3638;
    wire [7:0] _3639;
    wire [7:0] _144;
    reg [7:0] _2239;
    wire [15:0] _2243;
    wire [14:0] _3277;
    wire [15:0] _3278;
    wire [15:0] _3640;
    wire [15:0] _3641;
    wire [15:0] _3642;
    wire [15:0] _3644;
    wire [15:0] _145;
    reg [15:0] g_sr;
    wire [3:0] _3606;
    wire _3652;
    wire _3653;
    wire [4:0] _3649;
    wire [4:0] _3648;
    wire _3650;
    wire _3645;
    wire _3647;
    wire _3651;
    wire _3654;
    wire [7:0] _3655;
    wire [7:0] _3656;
    wire [7:0] _146;
    reg [7:0] _3604;
    wire [3:0] _3605;
    wire _3607;
    wire [3:0] _3608;
    wire [7:0] _3610;
    wire [5:0] _2260;
    wire [7:0] _3600;
    wire [7:0] _3611;
    wire [15:0] _3612;
    wire _3613;
    wire _3704;
    wire _3667;
    wire _3668;
    wire [4:0] _3664;
    wire [4:0] _3663;
    wire _3665;
    wire _3660;
    wire _3662;
    wire _3666;
    wire _3669;
    wire [7:0] _3670;
    wire [7:0] _3671;
    wire [7:0] _147;
    reg [7:0] _3659;
    wire [5:0] _3690;
    wire [5:0] _3689;
    wire _3691;
    wire [9:0] _3685;
    wire _3687;
    wire _3679;
    wire _3680;
    wire [4:0] _3676;
    wire [4:0] _3675;
    wire _3677;
    wire _3672;
    wire _3674;
    wire _3678;
    wire _3681;
    wire [7:0] _3682;
    wire [7:0] _3683;
    wire [7:0] _148;
    reg [7:0] _2259;
    wire _3684;
    wire _3688;
    wire _3692;
    wire _3694;
    wire _3695;
    wire _3696;
    wire _3697;
    wire _3698;
    wire _3700;
    wire _3702;
    wire _149;
    reg g_len_cap;
    wire _3705;
    wire _3707;
    wire _150;
    reg g_len_known;
    wire [15:0] _2249;
    wire [15:0] _3940;
    wire [15:0] _3941;
    wire [15:0] _3942;
    wire _3923;
    wire _3462;
    wire _3461;
    wire _3460;
    wire _3459;
    wire _3458;
    wire _3457;
    wire _3456;
    wire _3452;
    wire _3451;
    wire _3450;
    wire _3449;
    wire _3448;
    wire _3447;
    wire _3446;
    wire [7:0] _3443;
    wire [6:0] _3588;
    wire [7:0] _3589;
    wire [6:0] _3586;
    wire [7:0] _3587;
    wire [7:0] _3590;
    wire [7:0] _3712;
    wire [7:0] _3713;
    wire [7:0] _3714;
    wire [7:0] _3715;
    wire [7:0] _3708;
    wire [7:0] _3709;
    wire [7:0] _3710;
    wire [7:0] _3711;
    wire [7:0] _3716;
    wire [7:0] _151;
    reg [7:0] g_byte;
    wire [7:0] _3444;
    wire _3445;
    wire [7:0] _3453;
    wire _3374;
    wire [7:0] _3454;
    wire _3455;
    wire [2:0] _3724;
    wire [2:0] _3725;
    wire [2:0] _3726;
    wire [2:0] _3727;
    wire [2:0] _3728;
    wire [2:0] _3718;
    wire [2:0] _3719;
    wire [2:0] _3720;
    wire [2:0] _3721;
    wire [2:0] _3722;
    wire [2:0] _3729;
    wire [2:0] _3731;
    wire [2:0] _152;
    reg [2:0] g_bitpos;
    reg _3463;
    wire _3305;
    wire _3742;
    wire _3743;
    wire [4:0] _3739;
    wire [4:0] _3738;
    wire _3740;
    wire _3735;
    wire _3737;
    wire _3741;
    wire _3744;
    wire [7:0] _3745;
    wire [7:0] _3746;
    wire [7:0] _153;
    reg [7:0] _3734;
    wire _3757;
    wire _3758;
    wire [4:0] _3754;
    wire [4:0] _3753;
    wire _3755;
    wire _3750;
    wire _3752;
    wire _3756;
    wire _3759;
    wire [7:0] _3760;
    wire [7:0] _3761;
    wire [7:0] _154;
    reg [7:0] _3749;
    wire _3772;
    wire _3773;
    wire [4:0] _3769;
    wire [4:0] _3768;
    wire _3770;
    wire _3765;
    wire _3767;
    wire _3771;
    wire _3774;
    wire [7:0] _3775;
    wire [7:0] _3776;
    wire [7:0] _155;
    reg [7:0] _3764;
    wire _3787;
    wire _3788;
    wire [4:0] _3784;
    wire [4:0] _3783;
    wire _3785;
    wire _3780;
    wire _3782;
    wire _3786;
    wire _3789;
    wire [7:0] _3790;
    wire [7:0] _3791;
    wire [7:0] _156;
    reg [7:0] _3779;
    wire [31:0] _3917;
    wire [30:0] _3910;
    wire [31:0] _3912;
    wire _3904;
    wire _3905;
    wire [31:0] _3907;
    wire [30:0] _3901;
    wire [31:0] _3903;
    wire [31:0] _3908;
    wire [31:0] _3909;
    wire _3802;
    wire _3803;
    wire [4:0] _3799;
    wire [4:0] _3798;
    wire _3800;
    wire _3795;
    wire _3797;
    wire _3801;
    wire _3804;
    wire [7:0] _3805;
    wire [7:0] _3806;
    wire [7:0] _157;
    reg [7:0] _3794;
    wire [5:0] _3821;
    wire [5:0] _3816;
    wire [5:0] _3817;
    wire [5:0] _3818;
    wire [5:0] _3819;
    wire [5:0] _3810;
    wire [5:0] _3811;
    wire [5:0] _3812;
    wire [5:0] _3813;
    wire [5:0] _3814;
    wire [5:0] _3820;
    wire [5:0] _3822;
    wire [5:0] _3824;
    wire [5:0] _158;
    reg [5:0] g_left;
    wire _2289;
    wire _2290;
    wire _3298;
    wire _3297;
    wire _3299;
    wire _3300;
    wire [31:0] _3913;
    wire _2229;
    wire [31:0] _3914;
    wire [31:0] _3915;
    wire _3835;
    wire _3836;
    wire [4:0] _3832;
    wire [4:0] _3831;
    wire _3833;
    wire _3828;
    wire _3830;
    wire _3834;
    wire _3837;
    wire [7:0] _3838;
    wire [7:0] _3839;
    wire [7:0] _159;
    reg [7:0] _3827;
    wire _3850;
    wire _3851;
    wire [4:0] _3847;
    wire [4:0] _3846;
    wire _3848;
    wire _3843;
    wire _3845;
    wire _3849;
    wire _3852;
    wire [7:0] _3853;
    wire [7:0] _3854;
    wire [7:0] _160;
    reg [7:0] _3842;
    wire _3865;
    wire _3866;
    wire [4:0] _3862;
    wire [4:0] _3861;
    wire _3863;
    wire _3858;
    wire _3860;
    wire _3864;
    wire _3867;
    wire [7:0] _3868;
    wire [7:0] _3869;
    wire [7:0] _161;
    reg [7:0] _3857;
    wire _3880;
    wire _3881;
    wire [4:0] _3877;
    wire [4:0] _3876;
    wire _3878;
    wire _3873;
    wire _3875;
    wire _3879;
    wire _3882;
    wire [7:0] _3883;
    wire [7:0] _3884;
    wire [7:0] _162;
    reg [7:0] _3872;
    wire [31:0] _3894;
    wire _3891;
    wire _3892;
    wire [31:0] _3895;
    wire [30:0] _3888;
    wire [31:0] _3890;
    wire [31:0] _3896;
    wire [30:0] _3885;
    wire [31:0] _3887;
    wire [31:0] _3897;
    wire [31:0] _3898;
    wire [31:0] _3899;
    wire [31:0] _3900;
    wire [31:0] _3916;
    wire [31:0] _3918;
    wire [31:0] _3920;
    wire [31:0] _163;
    reg [31:0] g_crc;
    wire _3304;
    wire _3306;
    wire _3464;
    wire _3465;
    wire _3921;
    wire _3922;
    wire _3924;
    wire _3926;
    wire _164;
    reg g_last;
    wire _2761;
    wire _2758;
    wire _2762;
    wire _3928;
    wire _3929;
    wire _3930;
    wire _3932;
    wire _165;
    reg g_prev;
    wire _2755;
    wire _2752;
    wire _2756;
    wire _2763;
    wire _2764;
    wire _2765;
    wire [15:0] _3943;
    wire [15:0] _3934;
    wire [15:0] _3935;
    wire [15:0] _3936;
    wire [15:0] _3937;
    wire [15:0] _3938;
    wire [15:0] _3944;
    wire [15:0] _3946;
    wire [15:0] _166;
    reg [15:0] g_cnt;
    wire g_data_left;
    wire _2284;
    wire _2291;
    wire [2:0] _3963;
    wire [2:0] _3964;
    wire [2:0] _3982;
    wire [2:0] _3984;
    wire [2:0] _167;
    reg [2:0] g_run;
    wire _2227;
    wire _3992;
    wire _3993;
    wire [4:0] _3989;
    wire [4:0] _3988;
    wire _3990;
    wire _3985;
    wire _3987;
    wire _3991;
    wire _3994;
    wire [7:0] _3995;
    wire [7:0] _3996;
    wire [7:0] _168;
    reg [7:0] _2218;
    wire [1:0] _2219;
    wire _2221;
    wire _2222;
    wire _2228;
    wire _2680;
    wire _2681;
    wire _2684;
    wire _2211;
    wire _2212;
    reg _2208;
    wire _2209;
    wire _2201;
    wire _2200;
    wire _2199;
    wire _2198;
    wire _2197;
    wire _2196;
    wire _2195;
    wire _2194;
    wire [2:0] _2193;
    reg _2202;
    reg _2205;
    wire _2210;
    wire _2192;
    wire _2213;
    wire _2279;
    wire _2277;
    wire _2178;
    wire [13:0] _2169;
    wire [15:0] _2170;
    wire [14:0] _2166;
    wire [15:0] _2167;
    wire [15:0] _2171;
    wire [14:0] _2163;
    wire [15:0] _2164;
    wire _2161;
    wire [15:0] _2172;
    reg [15:0] _2175;
    wire _2176;
    wire [13:0] _2153;
    wire [15:0] _2154;
    reg [15:0] _2157;
    wire _4081;
    wire _4082;
    wire [15:0] _4083;
    wire [15:0] _4085;
    wire [15:0] _4087;
    wire _4065;
    wire [14:0] _2182;
    wire [15:0] _2183;
    reg [15:0] _2186;
    wire [16:0] _4061;
    wire _4062;
    wire [16:0] _4055;
    reg [16:0] _4058;
    wire [16:0] _4050;
    wire _4004;
    wire _4005;
    wire [4:0] _4000;
    wire _4002;
    wire _3997;
    wire _3999;
    wire _4003;
    wire _4006;
    wire [7:0] _4007;
    wire [7:0] _4008;
    wire [7:0] _169;
    reg [7:0] _2151;
    wire _4016;
    wire _4017;
    wire [4:0] _4013;
    wire [4:0] _4012;
    wire _4014;
    wire _4009;
    wire _4011;
    wire _4015;
    wire _4018;
    wire [7:0] _4019;
    wire [7:0] _4020;
    wire [7:0] _170;
    reg [7:0] _2148;
    wire [15:0] _2152;
    wire [16:0] _4049;
    wire [16:0] _4051;
    reg [16:0] _4054;
    wire _4031;
    wire _4032;
    wire [4:0] _4028;
    wire [4:0] _4027;
    wire _4029;
    wire _4024;
    wire _4026;
    wire _4030;
    wire _4033;
    wire [7:0] _4034;
    wire [7:0] _4035;
    wire [7:0] _171;
    reg [7:0] _4023;
    wire [8:0] _4069;
    wire [7:0] _4071;
    wire [7:0] _4072;
    wire [7:0] _4073;
    wire [7:0] _4075;
    wire [7:0] _172;
    reg [7:0] _4043;
    wire [8:0] _4068;
    wire [8:0] _4070;
    wire _4076;
    wire _4077;
    wire _4078;
    wire _4080;
    wire _173;
    reg _4048;
    wire [16:0] _4059;
    wire [16:0] _4045;
    wire _4060;
    wire _4063;
    wire _4066;
    wire _4044;
    wire _4067;
    wire [15:0] _4089;
    wire _4039;
    wire _4037;
    wire _610;
    wire _4036;
    wire _4038;
    wire _4040;
    wire [15:0] _4090;
    wire [15:0] _4092;
    wire [15:0] _174;
    reg [15:0] _2144;
    wire _2158;
    wire _2159;
    wire _2141;
    wire _2160;
    wire _2177;
    wire _2179;
    wire _2280;
    wire [1:0] _2135;
    wire _2137;
    wire _2138;
    wire _2134;
    wire _2139;
    wire _2131;
    reg _2128;
    wire _2121;
    wire _2120;
    wire _2119;
    wire _2118;
    wire _2117;
    wire _2116;
    wire _2115;
    wire _2114;
    wire _4100;
    wire _4101;
    wire [4:0] _4097;
    wire [4:0] _4096;
    wire _4098;
    wire _4093;
    wire _4095;
    wire _4099;
    wire _4102;
    wire [7:0] _4103;
    wire [7:0] _4104;
    wire [7:0] _175;
    reg [7:0] _2112;
    wire [2:0] _2113;
    reg _2122;
    reg _2125;
    wire _2129;
    wire _2130;
    wire _2132;
    wire _2140;
    wire _2281;
    wire _2109;
    wire _2282;
    wire _2274;
    wire _2275;
    wire _2283;
    wire _2685;
    wire _2687;
    wire _2696;
    wire _2677;
    wire _2675;
    wire _2678;
    wire _4105;
    wire _4106;
    wire _176;
    wire _4108;
    wire [2:0] _4111;
    wire [2:0] _177;
    reg [2:0] _3380;
    reg [7:0] _3441;
    wire [7:0] _3500;
    wire [6:0] _3535;
    wire [7:0] _3536;
    wire [6:0] _3533;
    wire [7:0] _3534;
    wire [7:0] _3537;
    wire [7:0] _4116;
    wire [7:0] _4117;
    wire [7:0] _4118;
    wire [7:0] _4119;
    wire [7:0] _4112;
    wire [7:0] _4113;
    wire [7:0] _4114;
    wire [7:0] _4115;
    wire [7:0] _4120;
    wire [7:0] _178;
    reg [7:0] g_byte_0;
    wire _2691;
    wire _2688;
    wire _2689;
    wire _2692;
    wire [7:0] _3501;
    wire _3502;
    wire [7:0] _3510;
    wire _3495;
    wire [7:0] _3511;
    wire _3512;
    wire [2:0] _4128;
    wire [5:0] _2496;
    wire _2501;
    wire _2502;
    wire [9:0] _2492;
    wire _2494;
    wire _2495;
    wire _2503;
    wire _2504;
    wire [2:0] _4129;
    wire [2:0] _4130;
    wire [2:0] _4131;
    wire [2:0] _4132;
    wire [2:0] _4122;
    wire [2:0] _4123;
    wire [2:0] _4124;
    wire [2:0] _4125;
    wire [2:0] _4126;
    wire [2:0] _4133;
    wire [2:0] _4135;
    wire [2:0] _179;
    reg [2:0] g_bitpos_0;
    reg _3520;
    wire _3182;
    wire _4146;
    wire _4147;
    wire [4:0] _4142;
    wire _4144;
    wire _4139;
    wire _4141;
    wire _4145;
    wire _4148;
    wire [7:0] _4149;
    wire [7:0] _4150;
    wire [7:0] _180;
    reg [7:0] _4138;
    wire _4161;
    wire _4162;
    wire [4:0] _4157;
    wire _4159;
    wire _4154;
    wire _4156;
    wire _4160;
    wire _4163;
    wire [7:0] _4164;
    wire [7:0] _4165;
    wire [7:0] _181;
    reg [7:0] _4153;
    wire _4176;
    wire _4177;
    wire [4:0] _4172;
    wire _4174;
    wire _4169;
    wire _4171;
    wire _4175;
    wire _4178;
    wire [7:0] _4179;
    wire [7:0] _4180;
    wire [7:0] _182;
    reg [7:0] _4168;
    wire _4191;
    wire _4192;
    wire [4:0] _4187;
    wire _4189;
    wire _4184;
    wire _4186;
    wire _4190;
    wire _4193;
    wire [7:0] _4194;
    wire [7:0] _4195;
    wire [7:0] _183;
    reg [7:0] _4183;
    wire [31:0] _4321;
    wire [30:0] _4314;
    wire [31:0] _4316;
    wire _4308;
    wire _4309;
    wire [31:0] _4311;
    wire [30:0] _4305;
    wire [31:0] _4307;
    wire [31:0] _4312;
    wire [31:0] _4313;
    wire _4206;
    wire _4207;
    wire [4:0] _4202;
    wire _4204;
    wire _4199;
    wire _4201;
    wire _4205;
    wire _4208;
    wire [7:0] _4209;
    wire [7:0] _4210;
    wire [7:0] _184;
    reg [7:0] _4198;
    wire [5:0] _4225;
    wire [5:0] _4220;
    wire [5:0] _4221;
    wire [5:0] _4222;
    wire [5:0] _4223;
    wire [5:0] _4214;
    wire [5:0] _4215;
    wire [5:0] _4216;
    wire [5:0] _4217;
    wire [5:0] _4218;
    wire [5:0] _4224;
    wire [5:0] _4226;
    wire [5:0] _4228;
    wire [5:0] _185;
    reg [5:0] g_left_0;
    wire _2529;
    wire _2530;
    wire _3175;
    wire _3174;
    wire _3176;
    wire _3177;
    wire [31:0] _4317;
    wire [31:0] _4318;
    wire [31:0] _4319;
    wire _4239;
    wire _4240;
    wire [4:0] _4235;
    wire _4237;
    wire _4232;
    wire _4234;
    wire _4238;
    wire _4241;
    wire [7:0] _4242;
    wire [7:0] _4243;
    wire [7:0] _186;
    reg [7:0] _4231;
    wire _4254;
    wire _4255;
    wire [4:0] _4250;
    wire _4252;
    wire _4247;
    wire _4249;
    wire _4253;
    wire _4256;
    wire [7:0] _4257;
    wire [7:0] _4258;
    wire [7:0] _187;
    reg [7:0] _4246;
    wire _4269;
    wire _4270;
    wire [4:0] _4265;
    wire _4267;
    wire _4262;
    wire _4264;
    wire _4268;
    wire _4271;
    wire [7:0] _4272;
    wire [7:0] _4273;
    wire [7:0] _188;
    reg [7:0] _4261;
    wire _4284;
    wire _4285;
    wire [4:0] _4280;
    wire _4282;
    wire _4277;
    wire _4279;
    wire _4283;
    wire _4286;
    wire [7:0] _4287;
    wire [7:0] _4288;
    wire [7:0] _189;
    reg [7:0] _4276;
    wire [31:0] _4298;
    wire _4295;
    wire _4296;
    wire [31:0] _4299;
    wire [30:0] _4292;
    wire [31:0] _4294;
    wire [31:0] _4300;
    wire [30:0] _4289;
    wire [31:0] _4291;
    wire [31:0] _4301;
    wire [31:0] _4302;
    wire [31:0] _4303;
    wire [31:0] _4304;
    wire [31:0] _4320;
    wire [31:0] _4322;
    wire [31:0] _4324;
    wire [31:0] _190;
    reg [31:0] g_crc_0;
    wire _3181;
    wire _3183;
    wire [7:0] _4344;
    wire [7:0] _4345;
    wire [7:0] _191;
    reg [7:0] g_lim_0;
    wire [15:0] _2488;
    wire _4353;
    wire _4354;
    wire [4:0] _4349;
    wire _4351;
    wire _4346;
    wire _4348;
    wire _4352;
    wire _4355;
    wire [7:0] _4356;
    wire [7:0] _4357;
    wire [7:0] _192;
    reg [7:0] _2482;
    wire _4365;
    wire _4366;
    wire [4:0] _4361;
    wire _4363;
    wire _4358;
    wire _4360;
    wire _4364;
    wire _4367;
    wire [7:0] _4368;
    wire [7:0] _4369;
    wire [7:0] _193;
    reg [7:0] _2479;
    wire [15:0] _2483;
    wire [14:0] _3154;
    wire [15:0] _3155;
    wire [15:0] _4370;
    wire [15:0] _4371;
    wire [15:0] _4372;
    wire [15:0] _4374;
    wire [15:0] _194;
    reg [15:0] g_sr_0;
    wire [3:0] _4336;
    wire _4382;
    wire _4383;
    wire [4:0] _4378;
    wire _4380;
    wire _4375;
    wire _4377;
    wire _4381;
    wire _4384;
    wire [7:0] _4385;
    wire [7:0] _4386;
    wire [7:0] _195;
    reg [7:0] _4334;
    wire [3:0] _4335;
    wire _4337;
    wire [3:0] _4338;
    wire [7:0] _4340;
    wire [5:0] _2500;
    wire [7:0] _4330;
    wire [7:0] _4341;
    wire [15:0] _4342;
    wire _4343;
    wire _4434;
    wire _4397;
    wire _4398;
    wire [4:0] _4393;
    wire _4395;
    wire _4390;
    wire _4392;
    wire _4396;
    wire _4399;
    wire [7:0] _4400;
    wire [7:0] _4401;
    wire [7:0] _196;
    reg [7:0] _4389;
    wire [5:0] _4420;
    wire [5:0] _4419;
    wire _4421;
    wire [9:0] _4415;
    wire _4417;
    wire _4409;
    wire _4410;
    wire [4:0] _4405;
    wire _4407;
    wire _4402;
    wire _4404;
    wire _4408;
    wire _4411;
    wire [7:0] _4412;
    wire [7:0] _4413;
    wire [7:0] _197;
    reg [7:0] _2499;
    wire _4414;
    wire _4418;
    wire _4422;
    wire _4424;
    wire _4425;
    wire _4426;
    wire _4427;
    wire _4428;
    wire _4430;
    wire _4432;
    wire _198;
    reg g_len_cap_0;
    wire _4435;
    wire _4437;
    wire _199;
    reg g_len_known_0;
    wire [15:0] _2489;
    wire [15:0] _4457;
    wire _2470;
    wire _2491;
    wire [15:0] _4458;
    wire _2469;
    wire [15:0] _4459;
    wire _4440;
    wire _4438;
    wire _4439;
    wire _4441;
    wire _4443;
    wire _200;
    reg g_last_0;
    wire _2806;
    wire _2803;
    wire _2807;
    wire _4445;
    wire _4446;
    wire _4447;
    wire _4449;
    wire _201;
    reg g_prev_0;
    wire _2800;
    wire _2797;
    wire _2801;
    wire _2808;
    wire _2809;
    wire _2810;
    wire [15:0] _4460;
    wire [15:0] _4451;
    wire [15:0] _4452;
    wire [15:0] _4453;
    wire [15:0] _4454;
    wire [15:0] _4455;
    wire [15:0] _4461;
    wire [15:0] _4463;
    wire [15:0] _202;
    reg [15:0] g_cnt_0;
    wire g_data_left_0;
    wire _3521;
    wire _3522;
    wire _4469;
    wire _4467;
    wire _4468;
    wire _4470;
    wire [2:0] _4474;
    wire _4465;
    wire [2:0] _4479;
    wire [2:0] _4480;
    wire [2:0] _4481;
    wire [2:0] _4499;
    wire [2:0] _4501;
    wire [2:0] _203;
    reg [2:0] g_run_0;
    wire _2467;
    wire _4509;
    wire _4510;
    wire [4:0] _4505;
    wire _4507;
    wire _4502;
    wire _4504;
    wire _4508;
    wire _4511;
    wire [7:0] _4512;
    wire [7:0] _4513;
    wire [7:0] _204;
    reg [7:0] _2458;
    wire [1:0] _2459;
    wire _2461;
    wire _2462;
    wire _2468;
    wire _2524;
    wire _2531;
    wire _4527;
    wire _2514;
    wire _2515;
    wire _2523;
    wire _4528;
    wire _2519;
    wire _2517;
    wire _2520;
    wire _2521;
    wire _2522;
    wire _4520;
    wire _4517;
    wire _4514;
    wire _4515;
    wire _4518;
    wire _4519;
    wire _4521;
    wire _4529;
    wire _4531;
    wire _4533;
    wire _4535;
    wire _4537;
    wire _205;
    reg f_lane1_out;
    wire _2786;
    wire _2787;
    wire _2782;
    wire _2783;
    wire _2779;
    wire _2777;
    wire _2775;
    wire _2776;
    wire _2778;
    wire _2780;
    wire _2784;
    wire _2785;
    wire _2788;
    wire [1:0] _4665;
    wire _2451;
    wire _2452;
    reg _2448;
    wire _2449;
    wire _2441;
    wire _2440;
    wire _2439;
    wire _2438;
    wire _2437;
    wire _2436;
    wire _2435;
    wire _2434;
    wire [2:0] _2433;
    reg _2442;
    reg _2445;
    wire _2450;
    wire _2432;
    wire _2453;
    wire _2430;
    wire _2427;
    wire _2420;
    wire _2418;
    wire [13:0] _2409;
    wire [15:0] _2410;
    wire [14:0] _2406;
    wire [15:0] _2407;
    wire [15:0] _2411;
    wire [14:0] _2403;
    wire [15:0] _2404;
    wire _2401;
    wire [15:0] _2412;
    reg [15:0] _2415;
    wire _2416;
    wire [13:0] _2393;
    wire [15:0] _2394;
    reg [15:0] _2397;
    wire _4622;
    wire _4623;
    wire [15:0] _4624;
    wire [15:0] _4626;
    wire [15:0] _4628;
    wire _4606;
    wire [14:0] _2422;
    wire [15:0] _2423;
    reg [15:0] _2426;
    wire [16:0] _4602;
    wire _4603;
    wire [16:0] _4596;
    reg [16:0] _4599;
    wire _4545;
    wire _4546;
    wire [4:0] _4541;
    wire _4543;
    wire _4538;
    wire _4540;
    wire _4544;
    wire _4547;
    wire [7:0] _4548;
    wire [7:0] _4549;
    wire [7:0] _206;
    reg [7:0] _2391;
    wire _4557;
    wire _4558;
    wire [4:0] _4553;
    wire _4555;
    wire _4550;
    wire _4552;
    wire _4556;
    wire _4559;
    wire [7:0] _4560;
    wire [7:0] _4561;
    wire [7:0] _207;
    reg [7:0] _2388;
    wire [15:0] _2392;
    wire [16:0] _4590;
    wire [16:0] _4592;
    reg [16:0] _4595;
    wire _4572;
    wire _4573;
    wire [4:0] _4568;
    wire _4570;
    wire _4565;
    wire _4567;
    wire _4571;
    wire _4574;
    wire [7:0] _4575;
    wire [7:0] _4576;
    wire [7:0] _208;
    reg [7:0] _4564;
    wire [8:0] _4610;
    wire [7:0] _4612;
    wire [7:0] _4613;
    wire [7:0] _4614;
    wire [7:0] _4616;
    wire [7:0] _209;
    reg [7:0] _4584;
    wire [8:0] _4609;
    wire [8:0] _4611;
    wire _4617;
    wire _4618;
    wire _4619;
    wire _4621;
    wire _210;
    reg _4589;
    wire [16:0] _4600;
    wire [16:0] _4586;
    wire _4601;
    wire _4604;
    wire _4607;
    wire _4585;
    wire _4608;
    wire [15:0] _4630;
    wire _4580;
    wire _4578;
    wire _624;
    wire _4577;
    wire _4579;
    wire _4581;
    wire [15:0] _4631;
    wire [15:0] _4633;
    wire [15:0] _211;
    reg [15:0] _2384;
    wire _2398;
    wire _2399;
    wire _2381;
    wire _2400;
    wire _2417;
    wire _2419;
    wire _2428;
    wire [1:0] _2375;
    wire _2377;
    wire _2378;
    wire _2379;
    wire _2371;
    reg _2368;
    wire _2361;
    wire _2360;
    wire _2359;
    wire _2358;
    wire _2357;
    wire _2356;
    wire _2355;
    wire _2354;
    wire _4641;
    wire _4642;
    wire [4:0] _4637;
    wire _4639;
    wire _4634;
    wire _4636;
    wire _4640;
    wire _4643;
    wire [7:0] _4644;
    wire [7:0] _4645;
    wire [7:0] _212;
    reg [7:0] _2352;
    wire [2:0] _2353;
    reg _2362;
    reg _2365;
    wire _2369;
    wire _2370;
    wire _2372;
    wire _2380;
    wire _2431;
    wire _2349;
    wire _2454;
    wire _4653;
    wire _4654;
    wire [4:0] _4650;
    wire [4:0] _4649;
    wire _4651;
    wire _4646;
    wire _4648;
    wire _4652;
    wire _4655;
    wire [7:0] _4656;
    wire [7:0] _4657;
    wire [7:0] _213;
    reg [7:0] _2346;
    wire _2347;
    wire _2343;
    wire _2348;
    wire _2455;
    wire [1:0] _4717;
    wire _2512;
    wire [1:0] _4719;
    wire _4212;
    wire [1:0] _4726;
    wire _2774;
    wire [1:0] _4732;
    wire _2556;
    wire _2557;
    wire [1:0] _4734;
    wire [1:0] _214;
    reg [1:0] g_mode;
    wire _2374;
    wire _2868;
    wire [1:0] _4735;
    wire [1:0] _215;
    wire _4743;
    wire _4744;
    wire [4:0] _4739;
    wire _4741;
    wire _4736;
    wire _4738;
    wire _4742;
    wire _4745;
    wire [7:0] _4746;
    wire _2912;
    wire _2913;
    wire [7:0] _4747;
    wire [7:0] _216;
    reg [7:0] _2106;
    wire _2107;
    wire _2730;
    wire _2731;
    wire _2733;
    wire _2735;
    wire _2739;
    wire _2740;
    wire _2743;
    wire [1:0] _4759;
    wire [1:0] _4811;
    wire _2272;
    wire [1:0] _4813;
    wire _3808;
    wire [1:0] _4820;
    wire _2729;
    wire [1:0] _4826;
    wire [2:0] _1428;
    wire [2:0] _1427;
    wire [2:0] _1426;
    wire [2:0] _1425;
    reg [2:0] _1429;
    wire _1421;
    wire _1420;
    wire _1419;
    wire _1418;
    reg _1422;
    wire _4748;
    wire _4749;
    wire [2:0] _4751;
    wire [2:0] _217;
    wire _2313;
    wire _2314;
    wire [1:0] _4828;
    wire [1:0] _218;
    reg [1:0] g_mode_0;
    wire _2103;
    wire _2108;
    wire _2215;
    wire _2230;
    wire _2251;
    wire _2264;
    wire _2270;
    wire _2306;
    wire _3351;
    wire [5:0] _4831;
    wire _4830;
    wire [5:0] _4832;
    wire [5:0] _4833;
    wire [5:0] _219;
    reg [5:0] _1191;
    wire _2307;
    wire _3352;
    wire _220;
    wire _3389;
    wire _3391;
    wire _4834;
    wire [3:0] _4840;
    reg [3:0] _4843;
    wire [3:0] _221;
    wire _593;
    wire [7:0] _4845;
    wire [1:0] _2672;
    wire [1:0] _2670;
    wire [1:0] _2669;
    wire [1:0] _2668;
    wire [1:0] _2667;
    reg [1:0] _2671;
    wire [1:0] _2673;
    reg [7:0] _4857;
    wire [7:0] _4858;
    wire [7:0] _222;
    reg [7:0] _586;
    wire _587;
    wire [7:0] _4869;
    wire [7:0] _4868;
    wire [7:0] _4867;
    wire [1:0] _4864;
    wire [111:0] _709;
    wire [1:0] _4862;
    wire [111:0] _703;
    wire [1:0] _4861;
    wire [1:0] _4860;
    wire [1:0] _4859;
    reg [1:0] _4863;
    wire [1:0] _4865;
    reg [7:0] _4870;
    wire [7:0] _4871;
    wire [7:0] _223;
    reg [7:0] _581;
    wire _583;
    wire [3:0] _814;
    reg _815;
    wire _817;
    wire [15:0] _809;
    wire _811;
    wire [15:0] _800;
    wire [16:0] _801;
    wire [16:0] _802;
    reg [16:0] _805;
    wire _806;
    wire _807;
    wire [15:0] _796;
    wire _798;
    wire [2:0] _541;
    wire [2:0] _4886;
    wire _4882;
    wire _4883;
    wire _4880;
    wire _4884;
    wire [2:0] _4887;
    wire _4877;
    wire _4878;
    wire _4876;
    wire _4879;
    wire [2:0] _4889;
    wire _4873;
    wire [2:0] _4875;
    wire _4872;
    wire [2:0] _4890;
    wire [2:0] _224;
    reg [2:0] _537;
    wire _539;
    wire [2:0] _542;
    wire _532;
    wire _533;
    wire _531;
    wire _534;
    wire [2:0] _544;
    wire _528;
    wire _529;
    wire [2:0] _545;
    wire _780;
    wire [2:0] _782;
    wire [2:0] _520;
    wire [2:0] _4905;
    wire _4901;
    wire _4902;
    wire _4899;
    wire _4903;
    wire [2:0] _4906;
    wire _4896;
    wire _4897;
    wire _4895;
    wire _4898;
    wire [2:0] _4908;
    wire _4892;
    wire [2:0] _4894;
    wire _4891;
    wire [2:0] _4909;
    wire [2:0] _225;
    reg [2:0] _516;
    wire _518;
    wire [2:0] _521;
    wire _511;
    wire _512;
    wire _510;
    wire _513;
    wire [2:0] _523;
    wire _507;
    wire _508;
    wire [2:0] _524;
    wire _777;
    wire [2:0] _779;
    wire _783;
    wire [2:0] _784;
    wire [2:0] _497;
    wire [2:0] _4924;
    wire _4920;
    wire _4921;
    wire _4918;
    wire _4922;
    wire [2:0] _4925;
    wire _4915;
    wire _4916;
    wire _4914;
    wire _4917;
    wire [2:0] _4927;
    wire _4911;
    wire [2:0] _4913;
    wire _4910;
    wire [2:0] _4928;
    wire [2:0] _226;
    reg [2:0] _493;
    wire _495;
    wire [2:0] _498;
    wire _488;
    wire _489;
    wire _487;
    wire _490;
    wire [2:0] _500;
    wire _484;
    wire _485;
    wire [2:0] _501;
    wire _772;
    wire [2:0] _774;
    wire [2:0] _476;
    wire [2:0] _4943;
    wire _4939;
    wire _4940;
    wire _4937;
    wire _4941;
    wire [2:0] _4944;
    wire _4934;
    wire _4935;
    wire _4933;
    wire _4936;
    wire [2:0] _4946;
    wire _4930;
    wire [2:0] _4932;
    wire _4929;
    wire [2:0] _4947;
    wire [2:0] _227;
    reg [2:0] _472;
    wire _474;
    wire [2:0] _477;
    wire _467;
    wire _468;
    wire _466;
    wire _469;
    wire [2:0] _479;
    wire _463;
    wire _464;
    wire [2:0] _480;
    wire _769;
    wire [2:0] _771;
    wire _775;
    wire [2:0] _776;
    wire _785;
    wire [2:0] _786;
    wire [2:0] _451;
    wire [2:0] _4962;
    wire _4958;
    wire _4959;
    wire _4956;
    wire _4960;
    wire [2:0] _4963;
    wire _4953;
    wire _4954;
    wire _4952;
    wire _4955;
    wire [2:0] _4965;
    wire _4949;
    wire [2:0] _4951;
    wire _4948;
    wire [2:0] _4966;
    wire [2:0] _228;
    reg [2:0] _447;
    wire _449;
    wire [2:0] _452;
    wire _442;
    wire _443;
    wire _441;
    wire _444;
    wire [2:0] _454;
    wire _438;
    wire _439;
    wire [2:0] _455;
    wire _762;
    wire [2:0] _764;
    wire [2:0] _430;
    wire [2:0] _4981;
    wire _4977;
    wire _4978;
    wire _4975;
    wire _4979;
    wire [2:0] _4982;
    wire _4972;
    wire _4973;
    wire _4971;
    wire _4974;
    wire [2:0] _4984;
    wire _4968;
    wire [2:0] _4970;
    wire _4967;
    wire [2:0] _4985;
    wire [2:0] _229;
    reg [2:0] _426;
    wire _428;
    wire [2:0] _431;
    wire _421;
    wire _422;
    wire _420;
    wire _423;
    wire [2:0] _433;
    wire _417;
    wire _418;
    wire [2:0] _434;
    wire _759;
    wire [2:0] _761;
    wire _765;
    wire [2:0] _766;
    wire [2:0] _407;
    wire [2:0] _5000;
    wire _4996;
    wire _4997;
    wire _4994;
    wire _4998;
    wire [2:0] _5001;
    wire _4991;
    wire _4992;
    wire _4990;
    wire _4993;
    wire [2:0] _5003;
    wire _4987;
    wire [2:0] _4989;
    wire _4986;
    wire [2:0] _5004;
    wire [2:0] _230;
    reg [2:0] _403;
    wire _405;
    wire [2:0] _408;
    wire _398;
    wire _399;
    wire _397;
    wire _400;
    wire [2:0] _410;
    wire _394;
    wire _395;
    wire [2:0] _411;
    wire _754;
    wire [2:0] _756;
    wire [2:0] _386;
    wire [2:0] _5019;
    wire _5015;
    wire _5016;
    wire _5013;
    wire _5017;
    wire [2:0] _5020;
    wire _5010;
    wire _5011;
    wire _5009;
    wire _5012;
    wire [2:0] _5022;
    wire _5006;
    wire [2:0] _5008;
    wire _5005;
    wire [2:0] _5023;
    wire [2:0] _231;
    reg [2:0] _382;
    wire _384;
    wire [2:0] _387;
    wire _377;
    wire _378;
    wire _376;
    wire _379;
    wire [2:0] _389;
    wire _373;
    wire _374;
    wire [2:0] _390;
    wire [7:0] _750;
    wire _751;
    wire [2:0] _753;
    wire _757;
    wire [2:0] _758;
    wire _767;
    wire [2:0] _768;
    wire _787;
    wire [2:0] _788;
    wire [16:0] _789;
    wire _5026;
    wire [127:0] _5027;
    wire _5024;
    wire [127:0] _5028;
    wire [127:0] _232;
    reg [127:0] _295;
    wire _362;
    wire _363;
    wire [127:0] _364;
    wire _5031;
    wire [127:0] _5032;
    wire _5029;
    wire [127:0] _5033;
    wire [127:0] _233;
    reg [127:0] _292;
    wire _358;
    wire _359;
    wire [127:0] _360;
    wire _5036;
    wire [127:0] _5037;
    wire _5034;
    wire [127:0] _5038;
    wire [127:0] _234;
    reg [127:0] _289;
    wire _354;
    wire _355;
    wire [127:0] _356;
    wire _350;
    wire _351;
    wire [127:0] _352;
    wire [511:0] _365;
    wire [111:0] _746;
    wire [15:0] _747;
    wire [16:0] _748;
    wire [16:0] _790;
    reg [16:0] _793;
    wire gnd;
    wire [16:0] _745;
    wire _794;
    wire _795;
    wire _799;
    wire _808;
    wire [15:0] _5066;
    wire _5062;
    wire _5063;
    wire _5064;
    wire [15:0] _5067;
    wire _5046;
    wire _5047;
    wire [15:0] _5069;
    wire [15:0] _5071;
    wire [15:0] _235;
    reg [15:0] _338;
    wire [15:0] _5083;
    wire _5079;
    wire _5080;
    wire [8:0] _5058;
    wire _5059;
    wire [5:0] _5056;
    wire [5:0] _5055;
    wire _5057;
    wire [8:0] _5050;
    wire [8:0] _5072;
    wire [8:0] _5073;
    wire [8:0] _5075;
    wire [8:0] _236;
    reg [8:0] _5051;
    wire [2:0] _5052;
    wire _5054;
    wire [1:0] _5048;
    reg _5060;
    wire _5081;
    wire [15:0] _5084;
    wire _5076;
    wire _5077;
    wire [15:0] _5086;
    wire [15:0] _5088;
    wire [15:0] _237;
    reg [15:0] _335;
    wire [1:0] _741;
    reg [15:0] _742;
    wire _744;
    wire _812;
    reg [7:0] _320;
    wire [7:0] f_chg_now;
    wire _5090;
    wire [7:0] _5092;
    wire _5089;
    wire [7:0] _5093;
    wire [7:0] _5095;
    wire [7:0] _238;
    reg [7:0] _317;
    wire [7:0] f_changed_all;
    wire [7:0] _735;
    wire _737;
    wire _738;
    wire [7:0] f_chgmask1;
    wire _734;
    wire _739;
    wire [7:0] _728;
    wire [7:0] _726;
    wire [7:0] _240;
    reg [7:0] _301;
    reg [7:0] _304;
    wire [7:0] _727;
    wire [7:0] _729;
    wire _731;
    wire [111:0] _697;
    wire f_valid1;
    wire _732;
    wire _740;
    wire _813;
    wire _818;
    wire _857;
    wire _858;
    wire _862;
    wire f_fire1;
    wire [1:0] _1006;
    wire [1:0] f_winner;
    reg [2:0] _5043;
    wire [2:0] _5045;
    wire _5096;
    wire _1389;
    wire f_in_fetch;
    wire _1390;
    wire _1391;
    wire _5097;
    wire [15:0] _5106;
    wire [15:0] _5108;
    wire [15:0] _241;
    reg [15:0] _332;
    wire [1:0] _1600;
    reg [15:0] _1601;
    wire [15:0] _1599;
    wire _1602;
    wire [63:0] _692;
    wire _1597;
    wire _1595;
    wire _1596;
    wire _1598;
    wire _1603;
    wire _1608;
    wire _1630;
    wire f_viol_now;
    wire [2:0] _5114;
    wire [2:0] _5117;
    wire _5110;
    wire [2:0] _5118;
    wire _5109;
    wire [2:0] _5121;
    wire [2:0] _5123;
    wire [2:0] _242;
    reg [2:0] _348;
    wire _5126;
    wire [127:0] _5127;
    wire _5124;
    wire [127:0] _5128;
    wire [127:0] _243;
    reg [127:0] _286;
    wire [511:0] _296;
    wire [111:0] _297;
    wire f_valid0;
    wire _311;
    wire _328;
    wire _577;
    wire _637;
    wire _681;
    wire f_in_eval;
    wire _682;
    wire _691;
    wire f_fire0;
    wire _1092;
    wire _1093;
    wire _1188;
    wire [1:0] _5360;
    wire _5345;
    wire [1:0] _5347;
    wire _5343;
    wire [1:0] _5361;
    wire _5342;
    wire [1:0] _5364;
    wire _5131;
    wire _5130;
    wire _5132;
    wire _5133;
    wire _244;
    reg _1387;
    wire [1:0] _5366;
    wire [7:0] _5140;
    wire [7:0] _5141;
    wire [7:0] _245;
    reg [7:0] _5136;
    wire [7:0] _5148;
    wire [7:0] _5149;
    wire [7:0] _246;
    reg [7:0] _5144;
    wire [7:0] _5156;
    wire [7:0] _5157;
    wire [7:0] _247;
    reg [7:0] _5152;
    wire [7:0] _5164;
    wire [7:0] _5165;
    wire [7:0] _248;
    reg [7:0] _5160;
    wire [31:0] _5331;
    wire [31:0] _5329;
    wire [31:0] _5280;
    wire [30:0] _5278;
    wire [31:0] _5279;
    wire [31:0] _5281;
    wire [30:0] _5275;
    wire [31:0] _5276;
    wire [30:0] _5268;
    wire [31:0] _5269;
    wire [31:0] _5271;
    wire [30:0] _5265;
    wire [31:0] _5266;
    wire [30:0] _5258;
    wire [31:0] _5259;
    wire [31:0] _5261;
    wire [30:0] _5255;
    wire [31:0] _5256;
    wire [30:0] _5248;
    wire [31:0] _5249;
    wire [31:0] _5251;
    wire [30:0] _5245;
    wire [31:0] _5246;
    wire [30:0] _5238;
    wire [31:0] _5239;
    wire [31:0] _5241;
    wire [30:0] _5235;
    wire [31:0] _5236;
    wire [30:0] _5228;
    wire [31:0] _5229;
    wire [31:0] _5231;
    wire [30:0] _5225;
    wire [31:0] _5226;
    wire [30:0] _5218;
    wire [31:0] _5219;
    wire [31:0] _5221;
    wire [30:0] _5215;
    wire [31:0] _5216;
    wire [30:0] _5208;
    wire [31:0] _5209;
    wire [31:0] _5211;
    wire [30:0] _5205;
    wire [31:0] _5206;
    wire [7:0] _5199;
    wire [7:0] _5198;
    wire [7:0] _5197;
    wire [7:0] _5196;
    wire [7:0] _5195;
    wire [7:0] _5194;
    wire [7:0] _5193;
    wire [7:0] _5192;
    wire [7:0] _5191;
    wire [7:0] _5190;
    wire [7:0] _5189;
    wire [7:0] _5188;
    wire [7:0] _5187;
    wire [7:0] _5186;
    wire [7:0] _5185;
    wire [127:0] _250;
    wire [7:0] _5184;
    wire [12:0] _5181;
    wire [12:0] _5182;
    wire [3:0] _5183;
    reg [7:0] _5200;
    wire [31:0] _5201;
    wire _5178;
    wire _5179;
    wire [31:0] _5283;
    wire [31:0] _5176;
    wire [31:0] _5284;
    wire [31:0] _251;
    reg [31:0] _5174;
    wire [31:0] _5202;
    wire _5203;
    wire [31:0] _5212;
    wire _5213;
    wire [31:0] _5222;
    wire _5223;
    wire [31:0] _5232;
    wire _5233;
    wire [31:0] _5242;
    wire _5243;
    wire [31:0] _5252;
    wire _5253;
    wire [31:0] _5262;
    wire _5263;
    wire [31:0] _5272;
    wire _5273;
    wire [31:0] _5282;
    wire [31:0] _5330;
    wire f_sw_match;
    wire _5333;
    wire _5335;
    wire _1355;
    wire _1354;
    wire f_store_we;
    wire _5324;
    wire _5326;
    wire _5328;
    wire [12:0] _5317;
    wire [12:0] _5288;
    wire [12:0] _5286;
    wire [12:0] _5289;
    wire [12:0] _252;
    reg [12:0] f_sw_cnt;
    wire f_sw_last;
    wire _5320;
    wire [3:0] _5137;
    wire _5139;
    wire _5292;
    wire [3:0] _5146;
    wire [3:0] _5145;
    wire _5147;
    wire _5294;
    wire [3:0] _5154;
    wire [3:0] _5153;
    wire _5155;
    wire _5296;
    wire [3:0] _5162;
    wire [3:0] _5161;
    wire _5163;
    wire _5298;
    wire _2711;
    wire _2708;
    wire _2709;
    wire _2706;
    wire _2707;
    wire _2710;
    wire _2712;
    wire _5299;
    wire _253;
    reg _5314;
    wire [3:0] _1365;
    wire [3:0] _1364;
    wire _1366;
    wire _5302;
    wire _1343;
    wire _1344;
    wire _5303;
    wire _254;
    reg _1353;
    wire _5311;
    wire _5315;
    wire _5316;
    wire _5322;
    wire _5170;
    wire _5306;
    wire _5305;
    wire _5307;
    wire _5308;
    wire _255;
    reg _5168;
    wire _5169;
    wire _5171;
    wire _5310;
    wire _5323;
    wire _256;
    reg f_sweeping;
    wire _5336;
    wire _257;
    reg f_image_valid;
    wire _5339;
    wire [3:0] _2641;
    wire _5338;
    wire _5340;
    wire _2637;
    wire _2638;
    wire _2634;
    wire _2635;
    wire _2632;
    wire _1240;
    wire _1235;
    wire _1241;
    wire _2633;
    wire _2636;
    wire _2639;
    wire _5341;
    wire _258;
    reg _1380;
    wire _1384;
    wire [1:0] _5368;
    wire [1:0] _259;
    reg [1:0] _281;
    wire _1308;
    wire _1590;
    wire _260;
    wire [7:0] _5432;
    wire [3:0] _5429;
    reg [7:0] _5450;
    wire _5428;
    wire [7:0] _5462;
    wire [12:0] _5387;
    wire [15:0] _5389;
    wire [15:0] _5386;
    wire [2:0] _5381;
    wire _5383;
    wire _5380;
    wire _5384;
    wire [15:0] _5390;
    wire [7:0] _5376;
    wire [15:0] _5377;
    wire [7:0] _5373;
    wire [15:0] _5374;
    wire _5372;
    wire [15:0] _5375;
    wire _5370;
    wire [15:0] _5378;
    wire [15:0] _5391;
    wire [15:0] _5392;
    wire [15:0] _261;
    reg [15:0] _1328;
    wire _5427;
    wire [7:0] _5471;
    wire [2:0] _1242;
    reg [7:0] _5494;
    wire _263;
    reg _1254;
    reg _1257;
    wire [6:0] _5393;
    wire [6:0] _5394;
    wire [6:0] _264;
    reg [6:0] _1251;
    wire [7:0] _1258;
    wire _5400;
    wire [7:0] _5401;
    wire [7:0] _5402;
    wire [7:0] _5404;
    wire [7:0] _265;
    reg [7:0] _1238;
    wire _1239;
    wire [1:0] _5409;
    wire _5406;
    wire _5407;
    wire [1:0] _5410;
    wire _1228;
    wire _1229;
    wire [1:0] _5411;
    wire [1:0] _5413;
    wire [1:0] _266;
    reg [1:0] _1232;
    wire _1234;
    wire _5425;
    wire [7:0] _5495;
    wire [6:0] _5422;
    wire [7:0] _5424;
    wire [2:0] _5415;
    wire _1222;
    wire _1218;
    wire _1223;
    wire [2:0] _5416;
    wire [2:0] _5418;
    wire [2:0] _267;
    reg [2:0] _1226;
    wire _2828;
    wire [7:0] _5496;
    reg _1221;
    wire _269;
    reg _1214;
    reg _1217;
    wire _2821;
    wire _2822;
    wire _2823;
    wire [7:0] _5497;
    wire _5397;
    reg _5396;
    wire _5398;
    wire [7:0] _5501;
    wire [7:0] _270;
    reg [7:0] _5421;
    wire _5502;
    wire vdd;
    wire _272;
    wire _274;
    wire _276;
    reg _1208;
    reg _1210;
    wire _1211;
    wire _5503;
    assign _1298 = _45[11:0];
    assign _1295 = _1288 < _1285;
    assign _1296 = _1270 & _1295;
    assign _1297 = _1296 ? _1285 : _1288;
    assign _1299 = _1297 < _1298;
    assign _1300 = _1299 ? _1298 : _1297;
    assign _1301 = _1281 ? _1297 : _1300;
    assign _1287 = 12'b000000000000;
    assign _1085 = 12'b111111111111;
    assign _1082 = _1080[11:0];
    assign _1079 = 13'b0000000000000;
    assign _1076 = 10'b0000000000;
    assign _1077 = { _1076,
                     _1073 };
    assign _1078 = _1069 - _1077;
    assign _1072 = 3'b000;
    always @* begin
        case (f_winner)
        0:
            _1052 <= _651;
        1:
            _1052 <= _827;
        2:
            _1052 <= _965;
        default:
            _1052 <= _1051;
        endcase
    end
    assign _1 = _1052;
    always @(posedge _274) begin
        if (_272)
            _1073 <= _1072;
        else
            _1073 <= _1;
    end
    assign _1074 = { _1076,
                     _1073 };
    assign _1059 = 13'b1111111111111;
    assign _1058 = _1056[12:0];
    assign _1053 = 16'b0001111111111111;
    assign _1057 = _1053 < _1056;
    assign _1060 = _1057 ? _1059 : _1058;
    assign _2 = _1060;
    always @(posedge _274) begin
        if (_272)
            _1069 <= _1079;
        else
            _1069 <= _2;
    end
    assign _1075 = _1069 < _1074;
    assign _1080 = _1075 ? _1079 : _1078;
    assign _1066 = 13'b0111111111111;
    assign _1081 = _1066 < _1080;
    assign _1084 = _1081 ? _1085 : _1082;
    assign _1064 = 1'b0;
    assign _1061 = 16'b1111111111111111;
    assign _1062 = _1056 == _1061;
    assign _3 = _1062;
    always @(posedge _274) begin
        if (_272)
            _1065 <= _1064;
        else
            _1065 <= _3;
    end
    assign _1086 = _1065 ? _1085 : _1084;
    assign _4 = _1086;
    always @(posedge _274) begin
        if (_272)
            _1288 <= _1287;
        else
            _1288 <= _4;
    end
    assign _1089 = _1056[11:0];
    always @* begin
        case (f_winner)
        0:
            _1055 <= _329;
        1:
            _1055 <= _741;
        2:
            _1055 <= _879;
        default:
            _1055 <= _1054;
        endcase
    end
    always @* begin
        case (_1055)
        0:
            _1056 <= _332;
        1:
            _1056 <= _335;
        2:
            _1056 <= _338;
        default:
            _1056 <= _338;
        endcase
    end
    assign _1087 = 16'b0000111111111111;
    assign _1088 = _1087 < _1056;
    assign _1091 = _1088 ? _1085 : _1089;
    assign _5 = _1091;
    always @(posedge _274) begin
        if (_272)
            _1285 <= _1287;
        else
            _1285 <= _5;
    end
    assign _1289 = _1285 < _1288;
    assign _1290 = _1270 & _1289;
    assign _1291 = _1290 ? _1285 : _1288;
    assign _1282 = _45[23:12];
    assign _1292 = _1282 < _1291;
    assign _1293 = _1292 ? _1282 : _1291;
    assign _1280 = 8'b00000000;
    assign _1281 = _1265 == _1280;
    assign _1294 = _1281 ? _1291 : _1293;
    assign _1278 = 8'b11111111;
    assign _1277 = _1275[7:0];
    assign _1272 = 2'b10;
    assign _1271 = 2'b01;
    assign _1205 = _1201 == _1204;
    assign _1197 = _1193 & _1196;
    assign _1206 = _1197 & _1205;
    assign _6 = _1206;
    always @(posedge _274) begin
        if (_272)
            _1270 <= _1064;
        else
            _1270 <= _6;
    end
    assign _1273 = _1270 ? _1272 : _1271;
    assign _1267 = 7'b0000000;
    assign _1274 = { _1267,
                     _1273 };
    assign _1265 = _45[31:24];
    assign _1266 = { gnd,
                     _1265 };
    assign _1275 = _1266 + _1274;
    assign _1276 = _1275[8:8];
    assign _1279 = _1276 ? _1278 : _1277;
    assign _1302 = { _1279,
                     _1294,
                     _1301 };
    assign _1247 = 32'b00000000000000000000000000000000;
    assign _1259 = _1248[31:8];
    assign _1260 = { _1258,
                     _1259 };
    assign _1261 = _1245 ? _1260 : _1248;
    assign _7 = _1261;
    always @(posedge _274) begin
        if (_272)
            _1248 <= _1247;
        else
            _1248 <= _7;
    end
    assign _1303 = _1264 ? _1302 : _1248;
    assign _1319 = _1264 | f_host_cov_we;
    assign _1317 = ~ f_sweeping;
    assign _1312 = ~ _1196;
    assign _1310 = ~ _1264;
    assign _1309 = _1306 & _1308;
    assign _1311 = _1309 & _1310;
    assign _1313 = _1311 & _1312;
    assign f_host_cov_we = _1313 & _1317;
    assign _1321 = ~ f_host_cov_we;
    assign _1320 = ~ _1264;
    assign _1322 = _1320 & _1321;
    assign _11 = _1204;
    always @(posedge _274) begin
        if (_272)
            _1340 <= _1280;
        else
            _1340 <= _11;
    end
    assign _1332 = _1328[9:2];
    assign _1333 = _1331 ? _1332 : _1325;
    assign _1334 = _1245 ? _1333 : _1325;
    assign _12 = _1334;
    always @(posedge _274) begin
        if (_272)
            _1325 <= _1280;
        else
            _1325 <= _12;
    end
    assign _1335 = _1328[9:2];
    assign _1336 = _1306 ? _1325 : _1335;
    assign _1337 = _1196 ? _1204 : _1336;
    assign _1341 = _1264 ? _1340 : _1337;
    assign _1346 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _1348 = _1347[127:8];
    assign _1349 = { _1258,
                     _1348 };
    assign _1350 = _1344 ? _1349 : _1347;
    assign _14 = _1350;
    always @(posedge _274) begin
        if (_272)
            _1347 <= _1346;
        else
            _1347 <= _14;
    end
    assign _1360 = _1359 | f_sweeping;
    assign _1375 = _348[1:0];
    assign _1376 = { _1200,
                     _1375 };
    assign _1373 = f_sw_cnt[11:4];
    assign _1367 = _1328[11:4];
    assign _1368 = _1366 ? _1367 : _1363;
    assign _1369 = _1344 ? _1368 : _1363;
    assign _18 = _1369;
    always @(posedge _274) begin
        if (_272)
            _1363 <= _1280;
        else
            _1363 <= _18;
    end
    assign _1374 = f_sweeping ? _1373 : _1363;
    assign _1357 = 3'b100;
    assign _1358 = _348 < _1357;
    assign _1359 = f_in_fetch & _1358;
    assign _1377 = _1359 ? _1376 : _1374;
    assign _1549 = _1458 & _1548;
    assign _1550 = ~ _1549;
    assign _1413 = _692[23:16];
    assign _1411 = _709[86:79];
    assign _1410 = _703[86:79];
    assign _1409 = _697[86:79];
    assign _1408 = _297[86:79];
    always @* begin
        case (f_winner)
        0:
            _1412 <= _1408;
        1:
            _1412 <= _1409;
        2:
            _1412 <= _1410;
        default:
            _1412 <= _1411;
        endcase
    end
    assign _1414 = _1390 ? _1413 : _1412;
    assign _1415 = _1414 & _1405;
    assign _1406 = ~ _1405;
    assign _1407 = f_poe & _1406;
    assign _1416 = _1407 | _1415;
    assign _1450 = _1416 | _1449;
    assign _1451 = _1395 ? _1450 : f_poe;
    assign _1453 = _1387 ? _1280 : _1451;
    assign _1455 = _1384 ? _1280 : _1453;
    assign _20 = _1455;
    always @(posedge _274) begin
        if (_272)
            f_poe <= _1280;
        else
            f_poe <= _20;
    end
    assign _1551 = f_poe & _1550;
    assign _1576 = ~ _1458;
    assign _1546 = f_lane1_out & _1540;
    assign _1545 = ~ f_lane1_out;
    assign _1543 = ~ f_lane0_out;
    assign _1544 = _1543 & _1540;
    assign _1542 = f_lane0_out & _1540;
    assign _1541 = ~ f_lane0_out;
    assign _1540 = f_pout[0:0];
    assign _1539 = _1468[2:0];
    always @* begin
        case (_1539)
        0:
            _1547 <= _1540;
        1:
            _1547 <= f_lane0_out;
        2:
            _1547 <= _1541;
        3:
            _1547 <= _1542;
        4:
            _1547 <= _1544;
        5:
            _1547 <= f_lane1_out;
        6:
            _1547 <= _1545;
        default:
            _1547 <= _1546;
        endcase
    end
    assign _1537 = f_lane1_out & _1531;
    assign _1536 = ~ f_lane1_out;
    assign _1534 = ~ f_lane0_out;
    assign _1535 = _1534 & _1531;
    assign _1533 = f_lane0_out & _1531;
    assign _1532 = ~ f_lane0_out;
    assign _1531 = f_pout[1:1];
    assign _1530 = _1468[5:3];
    always @* begin
        case (_1530)
        0:
            _1538 <= _1531;
        1:
            _1538 <= f_lane0_out;
        2:
            _1538 <= _1532;
        3:
            _1538 <= _1533;
        4:
            _1538 <= _1535;
        5:
            _1538 <= f_lane1_out;
        6:
            _1538 <= _1536;
        default:
            _1538 <= _1537;
        endcase
    end
    assign _1528 = f_lane1_out & _1522;
    assign _1527 = ~ f_lane1_out;
    assign _1525 = ~ f_lane0_out;
    assign _1526 = _1525 & _1522;
    assign _1524 = f_lane0_out & _1522;
    assign _1523 = ~ f_lane0_out;
    assign _1522 = f_pout[2:2];
    assign _1521 = _1468[8:6];
    always @* begin
        case (_1521)
        0:
            _1529 <= _1522;
        1:
            _1529 <= f_lane0_out;
        2:
            _1529 <= _1523;
        3:
            _1529 <= _1524;
        4:
            _1529 <= _1526;
        5:
            _1529 <= f_lane1_out;
        6:
            _1529 <= _1527;
        default:
            _1529 <= _1528;
        endcase
    end
    assign _1519 = f_lane1_out & _1513;
    assign _1518 = ~ f_lane1_out;
    assign _1516 = ~ f_lane0_out;
    assign _1517 = _1516 & _1513;
    assign _1515 = f_lane0_out & _1513;
    assign _1514 = ~ f_lane0_out;
    assign _1513 = f_pout[3:3];
    assign _1512 = _1468[11:9];
    always @* begin
        case (_1512)
        0:
            _1520 <= _1513;
        1:
            _1520 <= f_lane0_out;
        2:
            _1520 <= _1514;
        3:
            _1520 <= _1515;
        4:
            _1520 <= _1517;
        5:
            _1520 <= f_lane1_out;
        6:
            _1520 <= _1518;
        default:
            _1520 <= _1519;
        endcase
    end
    assign _1510 = f_lane1_out & _1504;
    assign _1509 = ~ f_lane1_out;
    assign _1507 = ~ f_lane0_out;
    assign _1508 = _1507 & _1504;
    assign _1506 = f_lane0_out & _1504;
    assign _1505 = ~ f_lane0_out;
    assign _1504 = f_pout[4:4];
    assign _1503 = _1468[14:12];
    always @* begin
        case (_1503)
        0:
            _1511 <= _1504;
        1:
            _1511 <= f_lane0_out;
        2:
            _1511 <= _1505;
        3:
            _1511 <= _1506;
        4:
            _1511 <= _1508;
        5:
            _1511 <= f_lane1_out;
        6:
            _1511 <= _1509;
        default:
            _1511 <= _1510;
        endcase
    end
    assign _1501 = f_lane1_out & _1495;
    assign _1500 = ~ f_lane1_out;
    assign _1498 = ~ f_lane0_out;
    assign _1499 = _1498 & _1495;
    assign _1497 = f_lane0_out & _1495;
    assign _1496 = ~ f_lane0_out;
    assign _1495 = f_pout[5:5];
    assign _1494 = _1468[17:15];
    always @* begin
        case (_1494)
        0:
            _1502 <= _1495;
        1:
            _1502 <= f_lane0_out;
        2:
            _1502 <= _1496;
        3:
            _1502 <= _1497;
        4:
            _1502 <= _1499;
        5:
            _1502 <= f_lane1_out;
        6:
            _1502 <= _1500;
        default:
            _1502 <= _1501;
        endcase
    end
    assign _1492 = f_lane1_out & _1486;
    assign _1491 = ~ f_lane1_out;
    assign _1489 = ~ f_lane0_out;
    assign _1490 = _1489 & _1486;
    assign _1488 = f_lane0_out & _1486;
    assign _1487 = ~ f_lane0_out;
    assign _1486 = f_pout[6:6];
    assign _1485 = _1468[20:18];
    always @* begin
        case (_1485)
        0:
            _1493 <= _1486;
        1:
            _1493 <= f_lane0_out;
        2:
            _1493 <= _1487;
        3:
            _1493 <= _1488;
        4:
            _1493 <= _1490;
        5:
            _1493 <= f_lane1_out;
        6:
            _1493 <= _1491;
        default:
            _1493 <= _1492;
        endcase
    end
    assign _1483 = f_lane1_out & _1473;
    assign _1482 = ~ f_lane1_out;
    assign _1478 = ~ f_lane0_out;
    assign _1479 = _1478 & _1473;
    assign _1477 = f_lane0_out & _1473;
    assign _1476 = ~ f_lane0_out;
    assign _1568 = { _1566,
                     _1565 };
    assign _1565 = _586[0:0];
    assign _1566 = { _1565,
                     _1565 };
    assign _1567 = { _1566,
                     _1566 };
    assign _1569 = { _1567,
                     _1568 };
    assign _1570 = { _1569,
                     _1565 };
    assign _1571 = _1570 & _1449;
    assign _1447 = _1443 & _1441;
    assign _1446 = _1443 & _1439;
    assign _1445 = _1443 & _1436;
    assign _1443 = ~ _1430;
    assign _1444 = _1443 & _1433;
    assign _1441 = _1438 & _1435;
    assign _1442 = _1430 & _1441;
    assign _1438 = ~ _1431;
    assign _1439 = _1438 & _1432;
    assign _1440 = _1430 & _1439;
    assign _1435 = ~ _1432;
    assign _1436 = _1431 & _1435;
    assign _1437 = _1430 & _1436;
    assign _1432 = _1429[0:0];
    assign _1431 = _1429[1:1];
    assign _1433 = _1431 & _1432;
    assign _1430 = _1429[2:2];
    assign _1434 = _1430 & _1433;
    assign _1448 = { _1434,
                     _1437,
                     _1440,
                     _1442,
                     _1444,
                     _1445,
                     _1446,
                     _1447 };
    assign _1417 = ~ _1390;
    assign _1423 = _1417 & _1422;
    assign _1449 = _1423 ? _1448 : _1280;
    assign _1563 = ~ _1449;
    assign _1559 = _692[15:8];
    assign _1557 = _709[78:71];
    assign _1556 = _703[78:71];
    assign _1555 = _697[78:71];
    assign _1554 = _297[78:71];
    always @* begin
        case (f_winner)
        0:
            _1558 <= _1554;
        1:
            _1558 <= _1555;
        2:
            _1558 <= _1556;
        default:
            _1558 <= _1557;
        endcase
    end
    assign _1560 = _1390 ? _1559 : _1558;
    assign _1561 = _1560 & _1405;
    assign _1404 = _692[7:0];
    assign _1402 = _709[70:63];
    assign _1401 = _703[70:63];
    assign _1400 = _697[70:63];
    assign _1399 = _297[70:63];
    always @* begin
        case (f_winner)
        0:
            _1403 <= _1399;
        1:
            _1403 <= _1400;
        2:
            _1403 <= _1401;
        default:
            _1403 <= _1402;
        endcase
    end
    assign _1405 = _1390 ? _1404 : _1403;
    assign _1552 = ~ _1405;
    assign _1553 = f_pout & _1552;
    assign _1562 = _1553 | _1561;
    assign _1564 = _1562 & _1563;
    assign _1572 = _1564 | _1571;
    assign _1392 = 2'b00;
    assign _1393 = _640 == _1392;
    assign _1394 = _1393 | _642;
    assign _1395 = _1391 & _1394;
    assign _1573 = _1395 ? _1572 : f_pout;
    assign _1575 = _1384 ? _1280 : _1573;
    assign _22 = _1575;
    always @(posedge _274) begin
        if (_272)
            f_pout <= _1280;
        else
            f_pout <= _22;
    end
    assign _1473 = f_pout[7:7];
    assign _1468 = { _1461,
                     _1464,
                     _1467 };
    assign _1469 = _1468[23:21];
    always @* begin
        case (_1469)
        0:
            _1484 <= _1473;
        1:
            _1484 <= f_lane0_out;
        2:
            _1484 <= _1476;
        3:
            _1484 <= _1477;
        4:
            _1484 <= _1479;
        5:
            _1484 <= f_lane1_out;
        6:
            _1484 <= _1482;
        default:
            _1484 <= _1483;
        endcase
    end
    assign _1548 = { _1484,
                     _1493,
                     _1502,
                     _1511,
                     _1520,
                     _1529,
                     _1538,
                     _1547 };
    assign _1577 = _1548 & _1576;
    always @(posedge _274) begin
        if (_272)
            _1621 <= _1392;
        else
            _1621 <= _1618;
    end
    assign _1628 = { _1621,
                     _1624,
                     _1627 };
    always @(posedge _274) begin
        if (_272)
            _1587 <= _1064;
        else
            _1587 <= _1188;
    end
    assign _1594 = { _1587,
                     _1589,
                     _1590,
                     _1593 };
    always @(posedge _274) begin
        if (_272)
            _1583 <= _1392;
        else
            _1583 <= f_winner;
    end
    assign _1580 = _1200[5:4];
    assign _1584 = { _1580,
                     _1583 };
    assign _1579 = _1200[3:0];
    assign _1578 = _1191[5:4];
    always @* begin
        case (_1578)
        0:
            _1629 <= _1579;
        1:
            _1629 <= _1584;
        2:
            _1629 <= _1594;
        default:
            _1629 <= _1628;
        endcase
    end
    always @(posedge _274) begin
        if (_272)
            _1634 <= _1064;
        else
            _1634 <= f_viol_now;
    end
    assign _5499 = ~ _89;
    assign _5498 = ~ _90;
    assign _5500 = { _260,
                     _100,
                     _98,
                     _91,
                     _5498,
                     _5499,
                     _88,
                     _87 };
    assign _1727 = 3'b111;
    assign _1728 = _1666 == _1727;
    assign _1729 = _1663 & _1728;
    always @(posedge _274) begin
        if (_272)
            _1730 <= _1280;
        else
            if (_1729)
                _1730 <= _139;
    end
    assign _1721 = 3'b110;
    assign _1722 = _1666 == _1721;
    assign _1723 = _1663 & _1722;
    always @(posedge _274) begin
        if (_272)
            _1724 <= _1280;
        else
            if (_1723)
                _1724 <= _139;
    end
    assign _1715 = 3'b101;
    assign _1716 = _1666 == _1715;
    assign _1717 = _1663 & _1716;
    always @(posedge _274) begin
        if (_272)
            _1718 <= _1280;
        else
            if (_1717)
                _1718 <= _139;
    end
    assign _1710 = _1666 == _1357;
    assign _1711 = _1663 & _1710;
    always @(posedge _274) begin
        if (_272)
            _1712 <= _1280;
        else
            if (_1711)
                _1712 <= _139;
    end
    assign _1703 = 3'b011;
    assign _1704 = _1666 == _1703;
    assign _1705 = _1663 & _1704;
    always @(posedge _274) begin
        if (_272)
            _1706 <= _1280;
        else
            if (_1705)
                _1706 <= _139;
    end
    assign _1697 = 3'b010;
    assign _1698 = _1666 == _1697;
    assign _1699 = _1663 & _1698;
    always @(posedge _274) begin
        if (_272)
            _1700 <= _1280;
        else
            if (_1699)
                _1700 <= _139;
    end
    assign _1691 = 3'b001;
    assign _1692 = _1666 == _1691;
    assign _1693 = _1663 & _1692;
    always @(posedge _274) begin
        if (_272)
            _1694 <= _1280;
        else
            if (_1693)
                _1694 <= _139;
    end
    assign _1668 = _1666 + _1691;
    assign _1669 = _1663 ? _1668 : _1666;
    assign _28 = _1669;
    always @(posedge _274) begin
        if (_272)
            _1666 <= _1072;
        else
            _1666 <= _28;
    end
    assign _1686 = _1666 == _1072;
    assign _1687 = _1663 & _1686;
    always @(posedge _274) begin
        if (_272)
            _1688 <= _1280;
        else
            if (_1687)
                _1688 <= _139;
    end
    assign _1681 = _1679 + _1691;
    assign _1682 = _1676 ? _1681 : _1679;
    assign _29 = _1682;
    always @(posedge _274) begin
        if (_272)
            _1679 <= _1072;
        else
            _1679 <= _29;
    end
    always @* begin
        case (_1679)
        0:
            _1731 <= _1688;
        1:
            _1731 <= _1694;
        2:
            _1731 <= _1700;
        3:
            _1731 <= _1706;
        4:
            _1731 <= _1712;
        5:
            _1731 <= _1718;
        6:
            _1731 <= _1724;
        default:
            _1731 <= _1730;
        endcase
    end
    assign _30 = _1731;
    assign _5491 = _90 ? _1280 : _30;
    assign _5485 = _43[47:40];
    assign _5484 = _43[39:32];
    assign _5483 = _43[31:24];
    assign _5482 = _43[23:16];
    assign _5481 = _43[15:8];
    assign _2091 = _1738 == _1727;
    assign _2092 = _1735 & _2091;
    assign _2089 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _274) begin
        if (_272)
            _2093 <= _2089;
        else
            if (_2092)
                _2093 <= _41;
    end
    assign _2085 = _1738 == _1721;
    assign _2086 = _1735 & _2085;
    always @(posedge _274) begin
        if (_272)
            _2087 <= _2089;
        else
            if (_2086)
                _2087 <= _41;
    end
    assign _2079 = _1738 == _1715;
    assign _2080 = _1735 & _2079;
    always @(posedge _274) begin
        if (_272)
            _2081 <= _2089;
        else
            if (_2080)
                _2081 <= _41;
    end
    assign _2073 = _1738 == _1357;
    assign _2074 = _1735 & _2073;
    always @(posedge _274) begin
        if (_272)
            _2075 <= _2089;
        else
            if (_2074)
                _2075 <= _41;
    end
    assign _2067 = _1738 == _1703;
    assign _2068 = _1735 & _2067;
    always @(posedge _274) begin
        if (_272)
            _2069 <= _2089;
        else
            if (_2068)
                _2069 <= _41;
    end
    assign _2061 = _1738 == _1697;
    assign _2062 = _1735 & _2061;
    always @(posedge _274) begin
        if (_272)
            _2063 <= _2089;
        else
            if (_2062)
                _2063 <= _41;
    end
    assign _2055 = _1738 == _1691;
    assign _2056 = _1735 & _2055;
    always @(posedge _274) begin
        if (_272)
            _2057 <= _2089;
        else
            if (_2056)
                _2057 <= _41;
    end
    assign _1740 = _1738 + _1691;
    assign _1741 = _1735 ? _1740 : _1738;
    assign _31 = _1741;
    always @(posedge _274) begin
        if (_272)
            _1738 <= _1072;
        else
            _1738 <= _31;
    end
    assign _2049 = _1738 == _1072;
    assign _2050 = _1735 & _2049;
    assign _1616 = { _1608,
                     f_unexp_now };
    assign _1618 = f_amb_now ? _1392 : _1616;
    assign _2032 = _1923 - _2028;
    assign _1749 = 29'b11111111111111111111111111111;
    assign _1748 = 29'b00000000000000000000000000000;
    assign _1751 = 29'b00000000000000000000000000001;
    assign _1752 = ts_hi_m1 + _1751;
    assign _1745 = ts_reg[2:0];
    assign _1747 = _1745 == _1727;
    assign _1753 = _1747 ? _1752 : ts_hi_m1;
    assign _32 = _1753;
    always @(posedge _274) begin
        if (_272)
            ts_hi_m1 <= _1749;
        else
            ts_hi_m1 <= _32;
    end
    assign _2030 = ts_reg[31:3];
    assign _1771 = _1758 + _1691;
    assign _1767 = _1758 == _1727;
    assign _1768 = ~ _1767;
    assign _1765 = _685[0:0];
    assign _1769 = _1765 & _1768;
    assign _1772 = _1769 ? _1771 : _1758;
    assign _1762 = _685[0:0];
    assign _1763 = ~ _1762;
    assign _1760 = _317[0:0];
    assign _1759 = f_chg_now[0:0];
    assign _1761 = _1759 & _1760;
    assign _1764 = _1761 & _1763;
    assign _1774 = _1764 ? _1691 : _1772;
    assign _1755 = _281 == _1271;
    assign _1775 = _1755 ? _1774 : _1758;
    assign _33 = _1775;
    always @(posedge _274) begin
        if (_272)
            _1758 <= _1072;
        else
            _1758 <= _33;
    end
    assign _2021 = _685[0:0];
    assign _2023 = _2021 ? _1758 : _1072;
    assign _1792 = _1779 + _1691;
    assign _1788 = _1779 == _1727;
    assign _1789 = ~ _1788;
    assign _1786 = _685[1:1];
    assign _1790 = _1786 & _1789;
    assign _1793 = _1790 ? _1792 : _1779;
    assign _1783 = _685[1:1];
    assign _1784 = ~ _1783;
    assign _1781 = _317[1:1];
    assign _1780 = f_chg_now[1:1];
    assign _1782 = _1780 & _1781;
    assign _1785 = _1782 & _1784;
    assign _1795 = _1785 ? _1691 : _1793;
    assign _1776 = _281 == _1271;
    assign _1796 = _1776 ? _1795 : _1779;
    assign _34 = _1796;
    always @(posedge _274) begin
        if (_272)
            _1779 <= _1072;
        else
            _1779 <= _34;
    end
    assign _2018 = _685[1:1];
    assign _2020 = _2018 ? _1779 : _1072;
    assign _2024 = _1980 ? _2023 : _2020;
    assign _1813 = _1800 + _1691;
    assign _1809 = _1800 == _1727;
    assign _1810 = ~ _1809;
    assign _1807 = _685[2:2];
    assign _1811 = _1807 & _1810;
    assign _1814 = _1811 ? _1813 : _1800;
    assign _1804 = _685[2:2];
    assign _1805 = ~ _1804;
    assign _1802 = _317[2:2];
    assign _1801 = f_chg_now[2:2];
    assign _1803 = _1801 & _1802;
    assign _1806 = _1803 & _1805;
    assign _1816 = _1806 ? _1691 : _1814;
    assign _1797 = _281 == _1271;
    assign _1817 = _1797 ? _1816 : _1800;
    assign _35 = _1817;
    always @(posedge _274) begin
        if (_272)
            _1800 <= _1072;
        else
            _1800 <= _35;
    end
    assign _2014 = _685[2:2];
    assign _2016 = _2014 ? _1800 : _1072;
    assign _1834 = _1821 + _1691;
    assign _1830 = _1821 == _1727;
    assign _1831 = ~ _1830;
    assign _1828 = _685[3:3];
    assign _1832 = _1828 & _1831;
    assign _1835 = _1832 ? _1834 : _1821;
    assign _1825 = _685[3:3];
    assign _1826 = ~ _1825;
    assign _1823 = _317[3:3];
    assign _1822 = f_chg_now[3:3];
    assign _1824 = _1822 & _1823;
    assign _1827 = _1824 & _1826;
    assign _1837 = _1827 ? _1691 : _1835;
    assign _1818 = _281 == _1271;
    assign _1838 = _1818 ? _1837 : _1821;
    assign _36 = _1838;
    always @(posedge _274) begin
        if (_272)
            _1821 <= _1072;
        else
            _1821 <= _36;
    end
    assign _2011 = _685[3:3];
    assign _2013 = _2011 ? _1821 : _1072;
    assign _2017 = _1983 ? _2016 : _2013;
    assign _2025 = _1982 ? _2024 : _2017;
    assign _1855 = _1842 + _1691;
    assign _1851 = _1842 == _1727;
    assign _1852 = ~ _1851;
    assign _1849 = _685[4:4];
    assign _1853 = _1849 & _1852;
    assign _1856 = _1853 ? _1855 : _1842;
    assign _1846 = _685[4:4];
    assign _1847 = ~ _1846;
    assign _1844 = _317[4:4];
    assign _1843 = f_chg_now[4:4];
    assign _1845 = _1843 & _1844;
    assign _1848 = _1845 & _1847;
    assign _1858 = _1848 ? _1691 : _1856;
    assign _1839 = _281 == _1271;
    assign _1859 = _1839 ? _1858 : _1842;
    assign _37 = _1859;
    always @(posedge _274) begin
        if (_272)
            _1842 <= _1072;
        else
            _1842 <= _37;
    end
    assign _2006 = _685[4:4];
    assign _2008 = _2006 ? _1842 : _1072;
    assign _1876 = _1863 + _1691;
    assign _1872 = _1863 == _1727;
    assign _1873 = ~ _1872;
    assign _1870 = _685[5:5];
    assign _1874 = _1870 & _1873;
    assign _1877 = _1874 ? _1876 : _1863;
    assign _1867 = _685[5:5];
    assign _1868 = ~ _1867;
    assign _1865 = _317[5:5];
    assign _1864 = f_chg_now[5:5];
    assign _1866 = _1864 & _1865;
    assign _1869 = _1866 & _1868;
    assign _1879 = _1869 ? _1691 : _1877;
    assign _1860 = _281 == _1271;
    assign _1880 = _1860 ? _1879 : _1863;
    assign _38 = _1880;
    always @(posedge _274) begin
        if (_272)
            _1863 <= _1072;
        else
            _1863 <= _38;
    end
    assign _2003 = _685[5:5];
    assign _2005 = _2003 ? _1863 : _1072;
    assign _2009 = _1987 ? _2008 : _2005;
    assign _1897 = _1884 + _1691;
    assign _1893 = _1884 == _1727;
    assign _1894 = ~ _1893;
    assign _1891 = _685[6:6];
    assign _1895 = _1891 & _1894;
    assign _1898 = _1895 ? _1897 : _1884;
    assign _1888 = _685[6:6];
    assign _1889 = ~ _1888;
    assign _1886 = _317[6:6];
    assign _1885 = f_chg_now[6:6];
    assign _1887 = _1885 & _1886;
    assign _1890 = _1887 & _1889;
    assign _1900 = _1890 ? _1691 : _1898;
    assign _1881 = _281 == _1271;
    assign _1901 = _1881 ? _1900 : _1884;
    assign _39 = _1901;
    always @(posedge _274) begin
        if (_272)
            _1884 <= _1072;
        else
            _1884 <= _39;
    end
    assign _1999 = _685[6:6];
    assign _2001 = _1999 ? _1884 : _1072;
    assign _1918 = _1905 + _1691;
    assign _1914 = _1905 == _1727;
    assign _1915 = ~ _1914;
    assign _1912 = _685[7:7];
    assign _1916 = _1912 & _1915;
    assign _1919 = _1916 ? _1918 : _1905;
    assign _1909 = _685[7:7];
    assign _1910 = ~ _1909;
    assign _1907 = _317[7:7];
    assign _1906 = f_chg_now[7:7];
    assign _1908 = _1906 & _1907;
    assign _1911 = _1908 & _1910;
    assign _1921 = _1911 ? _1691 : _1919;
    assign _1902 = _281 == _1271;
    assign _1922 = _1902 ? _1921 : _1905;
    assign _40 = _1922;
    always @(posedge _274) begin
        if (_272)
            _1905 <= _1072;
        else
            _1905 <= _40;
    end
    assign _1996 = _685[7:7];
    assign _1998 = _1996 ? _1905 : _1072;
    assign _2002 = _1990 ? _2001 : _1998;
    assign _2010 = _1989 ? _2009 : _2002;
    assign _2026 = _1986 ? _2025 : _2010;
    assign _1991 = _715[7:7];
    assign _1990 = _715[6:6];
    assign _1992 = _1990 | _1991;
    assign _1988 = _715[5:5];
    assign _1987 = _715[4:4];
    assign _1989 = _1987 | _1988;
    assign _1993 = _1989 | _1992;
    assign _1984 = _715[3:3];
    assign _1983 = _715[2:2];
    assign _1985 = _1983 | _1984;
    assign _1981 = _715[1:1];
    assign _1980 = _715[0:0];
    assign _1982 = _1980 | _1981;
    assign _1986 = _1982 | _1985;
    assign _1994 = _1986 | _1993;
    assign _2027 = _1994 ? _2026 : _1072;
    assign _1969 = f_watch[0:0];
    assign _1968 = _317[0:0];
    assign _1970 = _1968 & _1969;
    assign _1972 = _1970 ? _537 : _1072;
    assign _1964 = f_watch[1:1];
    assign _1963 = _317[1:1];
    assign _1965 = _1963 & _1964;
    assign _1967 = _1965 ? _516 : _1072;
    assign _1973 = _1967 < _1972;
    assign _1974 = _1973 ? _1972 : _1967;
    assign _1957 = f_watch[2:2];
    assign _1956 = _317[2:2];
    assign _1958 = _1956 & _1957;
    assign _1960 = _1958 ? _493 : _1072;
    assign _1952 = f_watch[3:3];
    assign _1951 = _317[3:3];
    assign _1953 = _1951 & _1952;
    assign _1955 = _1953 ? _472 : _1072;
    assign _1961 = _1955 < _1960;
    assign _1962 = _1961 ? _1960 : _1955;
    assign _1975 = _1962 < _1974;
    assign _1976 = _1975 ? _1974 : _1962;
    assign _1943 = f_watch[4:4];
    assign _1942 = _317[4:4];
    assign _1944 = _1942 & _1943;
    assign _1946 = _1944 ? _447 : _1072;
    assign _1938 = f_watch[5:5];
    assign _1937 = _317[5:5];
    assign _1939 = _1937 & _1938;
    assign _1941 = _1939 ? _426 : _1072;
    assign _1947 = _1941 < _1946;
    assign _1948 = _1947 ? _1946 : _1941;
    assign _1931 = f_watch[6:6];
    assign _1930 = _317[6:6];
    assign _1932 = _1930 & _1931;
    assign _1934 = _1932 ? _403 : _1072;
    assign _1926 = f_watch[7:7];
    assign _1925 = _317[7:7];
    assign _1927 = _1925 & _1926;
    assign _1929 = _1927 ? _382 : _1072;
    assign _1935 = _1929 < _1934;
    assign _1936 = _1935 ? _1934 : _1929;
    assign _1949 = _1936 < _1948;
    assign _1950 = _1949 ? _1948 : _1936;
    assign _1977 = _1950 < _1976;
    assign _1978 = _1977 ? _1976 : _1950;
    assign _1979 = f_unexp_now ? _1978 : _1072;
    assign _2028 = f_amb_now ? _2027 : _1979;
    assign _1923 = ts_reg[2:0];
    assign _2029 = _1923 < _2028;
    assign _2031 = _2029 ? ts_hi_m1 : _2030;
    assign _2033 = { _2031,
                     _2032 };
    assign _2034 = { _2033,
                     _1200,
                     _1618,
                     _304 };
    assign _41 = _2034;
    always @(posedge _274) begin
        if (_272)
            _2051 <= _2089;
        else
            if (_2050)
                _2051 <= _41;
    end
    assign _2044 = _2042 + _1691;
    assign _2045 = _2039 ? _2044 : _2042;
    assign _42 = _2045;
    always @(posedge _274) begin
        if (_272)
            _2042 <= _1072;
        else
            _2042 <= _42;
    end
    always @* begin
        case (_2042)
        0:
            _2094 <= _2051;
        1:
            _2094 <= _2057;
        2:
            _2094 <= _2063;
        3:
            _2094 <= _2069;
        4:
            _2094 <= _2075;
        5:
            _2094 <= _2081;
        6:
            _2094 <= _2087;
        default:
            _2094 <= _2093;
        endcase
    end
    assign _43 = _2094;
    assign _5480 = _43[7:0];
    assign _5479 = _1328[2:0];
    always @* begin
        case (_5479)
        0:
            _5486 <= _5480;
        1:
            _5486 <= _5481;
        2:
            _5486 <= _5482;
        3:
            _5486 <= _5483;
        4:
            _5486 <= _5484;
        default:
            _5486 <= _5485;
        endcase
    end
    assign _5488 = _89 ? _1280 : _5486;
    assign _5477 = _46[31:24];
    assign _5476 = _46[23:16];
    assign _5475 = _46[15:8];
    assign _45 = ram_cov_rdata;
    assign _2095 = ~ f_sweeping;
    assign _2096 = _1308 & _2095;
    assign _2098 = _2096 ? _45 : _1247;
    assign _46 = _2098;
    assign _5474 = _46[7:0];
    assign _5473 = _1328[1:0];
    always @* begin
        case (_5473)
        0:
            _5478 <= _5474;
        1:
            _5478 <= _5475;
        2:
            _5478 <= _5476;
        default:
            _5478 <= _5477;
        endcase
    end
    assign _5468 = _53[39:32];
    assign _5467 = _53[31:24];
    assign _5466 = _53[23:16];
    assign _5465 = _53[15:8];
    assign _2334 = 8'b00000001;
    assign _2335 = _2329 + _2334;
    assign _2331 = _2329 == _1278;
    assign _2332 = ~ _2331;
    assign _2324 = ~ _2270;
    assign _2321 = _2299 == _1072;
    assign _2322 = ~ _2321;
    assign _2318 = _2103 | _610;
    assign _2315 = ~ _2272;
    assign _2316 = _2314 & _2315;
    assign _2317 = _2316 & _2107;
    assign _2319 = _2317 & _2318;
    assign _2323 = _2319 & _2322;
    assign _2325 = _2323 & _2324;
    assign _2311 = _2306 & _2310;
    assign _2326 = _2311 | _2325;
    assign _2333 = _2326 & _2332;
    assign _2336 = _2333 ? _2335 : _2329;
    assign _2338 = _2101 ? _1280 : _2336;
    assign _47 = _2338;
    always @(posedge _274) begin
        if (_272)
            _2329 <= _1280;
        else
            _2329 <= _47;
    end
    assign _2578 = _2572 + _2334;
    assign _2574 = _2572 == _1278;
    assign _2575 = ~ _2574;
    assign _2567 = ~ _2510;
    assign _2564 = _2539 == _1072;
    assign _2565 = ~ _2564;
    assign _2561 = _2343 | _624;
    assign _2558 = ~ _2512;
    assign _2559 = _2557 & _2558;
    assign _2560 = _2559 & _2347;
    assign _2562 = _2560 & _2561;
    assign _2566 = _2562 & _2565;
    assign _2568 = _2566 & _2567;
    assign _2310 = _2307 ? _2309 : _595;
    assign _2553 = _2550 & _2310;
    assign _2554 = _2552 | _2553;
    assign _2569 = _2554 | _2568;
    assign _2576 = _2569 & _2575;
    assign _2579 = _2576 ? _2578 : _2572;
    assign _2581 = _2101 ? _1280 : _2579;
    assign _48 = _2581;
    always @(posedge _274) begin
        if (_272)
            _2572 <= _1280;
        else
            _2572 <= _48;
    end
    assign _2614 = _2608 + _2334;
    assign _2610 = _2608 == _1278;
    assign _2611 = ~ _2610;
    assign _2604 = _2601 & _595;
    assign _2605 = _2603 | _2604;
    assign _2612 = _2605 & _2611;
    assign _2615 = _2612 ? _2614 : _2608;
    assign _2617 = _2101 ? _1280 : _2615;
    assign _49 = _2617;
    always @(posedge _274) begin
        if (_272)
            _2608 <= _1280;
        else
            _2608 <= _49;
    end
    assign _2627 = _2621 + _2334;
    assign _2623 = _2621 == _1278;
    assign _2624 = ~ _2623;
    assign _2625 = _2618 & _2624;
    assign _2628 = _2625 ? _2627 : _2621;
    assign _2630 = _2101 ? _1280 : _2628;
    assign _50 = _2630;
    always @(posedge _274) begin
        if (_272)
            _2621 <= _1280;
        else
            _2621 <= _50;
    end
    assign _2659 = _2653 + _2334;
    assign _2655 = _2653 == _1278;
    assign _2656 = ~ _2655;
    assign _2657 = _2650 & _2656;
    assign _2660 = _2657 ? _2659 : _2653;
    assign _2644 = _1258[5:5];
    assign _2643 = _2641 == _2724;
    assign _2645 = _2643 ? _2644 : _1064;
    assign _2646 = _2639 ? _2645 : _1064;
    assign _51 = _2646;
    always @(posedge _274) begin
        if (_272)
            _2101 <= _1064;
        else
            _2101 <= _51;
    end
    assign _2662 = _2101 ? _1280 : _2660;
    assign _52 = _2662;
    always @(posedge _274) begin
        if (_272)
            _2653 <= _1280;
        else
            _2653 <= _52;
    end
    assign _2663 = { _2653,
                     _2621,
                     _2608,
                     _2572,
                     _2329 };
    assign _53 = _2663;
    assign _5464 = _53[7:0];
    assign _5463 = _1328[2:0];
    always @* begin
        case (_5463)
        0:
            _5470 <= _5464;
        1:
            _5470 <= _5465;
        2:
            _5470 <= _5466;
        3:
            _5470 <= _5467;
        4:
            _5470 <= _5468;
        default:
            _5470 <= _1280;
        endcase
    end
    assign _5459 = _1637[2:0];
    assign _5458 = _1637[6:3];
    assign _5460 = { _5458,
                     gnd,
                     _5459 };
    assign _5457 = 8'b01000000;
    assign _5456 = 8'b00100000;
    assign _5455 = 8'b00100100;
    assign _5452 = 5'b00000;
    assign _2701 = 1'b1;
    assign _2679 = _1391 & _2678;
    assign _2697 = _2679 & _2696;
    assign _2702 = _2697 ? _2701 : _2700;
    assign _2704 = _2666 ? _1064 : _2702;
    assign _54 = _2704;
    always @(posedge _274) begin
        if (_272)
            _2700 <= _1064;
        else
            _2700 <= _54;
    end
    assign _55 = _2700;
    assign _56 = f_sweeping;
    assign _57 = f_image_valid;
    assign _5453 = { _57,
                     _56,
                     _55,
                     _5452 };
    assign _2714 = 4'b0010;
    assign _2713 = _1328[3:0];
    assign _2715 = _2713 == _2714;
    assign _2716 = _2715 ? _1258 : _1461;
    assign _2717 = _2712 ? _2716 : _1461;
    assign _58 = _2717;
    always @(posedge _274) begin
        if (_272)
            _1461 <= _1280;
        else
            _1461 <= _58;
    end
    assign _2719 = 4'b0001;
    assign _2718 = _1328[3:0];
    assign _2720 = _2718 == _2719;
    assign _2721 = _2720 ? _1258 : _1464;
    assign _2722 = _2712 ? _2721 : _1464;
    assign _59 = _2722;
    always @(posedge _274) begin
        if (_272)
            _1464 <= _1280;
        else
            _1464 <= _59;
    end
    assign _2724 = 4'b0000;
    assign _2723 = _1328[3:0];
    assign _2725 = _2723 == _2724;
    assign _2726 = _2725 ? _1258 : _1467;
    assign _2727 = _2712 ? _2726 : _1467;
    assign _60 = _2727;
    always @(posedge _274) begin
        if (_272)
            _1467 <= _1280;
        else
            _1467 <= _60;
    end
    assign _5451 = _1328[3:0];
    always @* begin
        case (_5451)
        0:
            _5461 <= _1467;
        1:
            _5461 <= _1464;
        2:
            _5461 <= _1461;
        3:
            _5461 <= _5453;
        4:
            _5461 <= _2334;
        5:
            _5461 <= _5455;
        6:
            _5461 <= _5456;
        7:
            _5461 <= _5457;
        8:
            _5461 <= _5136;
        9:
            _5461 <= _5144;
        10:
            _5461 <= _5152;
        11:
            _5461 <= _5160;
        default:
            _5461 <= _5460;
        endcase
    end
    assign _5447 = _63[15:8];
    assign _2767 = _2765 ? _1691 : _2750;
    assign _2749 = f_lane0_out ? _1357 : _1697;
    assign _2750 = _2743 ? _2749 : _2746;
    assign _2768 = _2215 ? _2767 : _2750;
    assign _2770 = _2729 ? _1072 : _2768;
    assign _2772 = _2314 ? _1072 : _2770;
    assign _61 = _2772;
    always @(posedge _274) begin
        if (_272)
            _2746 <= _1072;
        else
            _2746 <= _61;
    end
    assign _2819 = { _610,
                     _613,
                     _616,
                     _619,
                     gnd,
                     _2746 };
    assign _2812 = _2810 ? _1691 : _2795;
    assign _2794 = f_lane1_out ? _1357 : _1697;
    assign _2795 = _2788 ? _2794 : _2791;
    assign _2813 = _2455 ? _2812 : _2795;
    assign _2815 = _2774 ? _1072 : _2813;
    assign _2817 = _2557 ? _1072 : _2815;
    assign _62 = _2817;
    always @(posedge _274) begin
        if (_272)
            _2791 <= _1072;
        else
            _2791 <= _62;
    end
    assign _2818 = { _624,
                     _627,
                     _630,
                     _633,
                     gnd,
                     _2791 };
    assign _2820 = { _2818,
                     _2819 };
    assign _63 = _2820;
    assign _5446 = _63[7:0];
    assign _5445 = _2826[23:16];
    assign _5444 = _2826[15:8];
    assign _2825 = 24'b000000000000000000000000;
    assign _2837 = _66[31:8];
    assign _2834 = 4'b1000;
    assign _2833 = _1328[3:0];
    assign _2835 = _2833 == _2834;
    assign _2831 = _1242 == _1072;
    assign _2829 = _1234 & _1239;
    assign _2832 = _2829 & _2831;
    assign _2836 = _2832 & _2835;
    assign _2838 = _2836 ? _2837 : _2826;
    assign _2839 = _2828 ? _2838 : _2826;
    assign _2840 = _2823 ? _2839 : _2826;
    assign _64 = _2840;
    always @(posedge _274) begin
        if (_272)
            _2826 <= _2825;
        else
            _2826 <= _64;
    end
    assign _5443 = _2826[7:0];
    assign _2841 = 32'b00000000000000000000000000000001;
    assign _2842 = ts_reg + _2841;
    assign _65 = _2842;
    always @(posedge _274) begin
        if (_272)
            ts_reg <= _1247;
        else
            ts_reg <= _65;
    end
    assign _66 = ts_reg;
    assign _5442 = _66[7:0];
    assign _67 = _1200;
    assign _5441 = { _1392,
                     _67 };
    assign _2908 = _2904 ? _2896 : _2907;
    assign _2910 = _2666 ? _1072 : _2908;
    assign _68 = _2910;
    always @(posedge _274) begin
        if (_272)
            _2907 <= _1072;
        else
            _2907 <= _68;
    end
    assign _69 = _2907;
    assign _2903 = ~ _2902;
    assign _2893 = _2844 ? _1691 : _1697;
    assign _2890 = _2870 ? _1703 : _1357;
    assign _2894 = _2860 ? _2893 : _2890;
    assign _2887 = _2877 ? _1715 : _1721;
    assign _2895 = _2874 ? _2894 : _2887;
    assign _2881 = _2880 & _2307;
    assign _2875 = _1353 | _1306;
    assign _2876 = _2875 | _2852;
    assign _2877 = f_sweeping & _2876;
    assign _2882 = _2877 | _2881;
    assign _2871 = ~ f_image_valid;
    assign _2872 = _1380 & _2871;
    assign _2867 = _2863[1:1];
    assign _2869 = _2867 & _2868;
    assign _2918 = _1328[5:5];
    assign _2920 = _2918 == _1064;
    assign _2922 = _2920 ? _1271 : _1392;
    assign _2915 = _1328[5:5];
    assign _2917 = _2915 == _2701;
    assign _2924 = _2917 ? _1272 : _2922;
    assign _2925 = _2913 ? _2924 : _1392;
    assign _70 = _2925;
    always @(posedge _274) begin
        if (_272)
            _2863 <= _1392;
        else
            _2863 <= _70;
    end
    assign _2864 = _2863[0:0];
    assign _2866 = _2864 & _2865;
    assign _2870 = _2866 | _2869;
    assign _2873 = _2870 | _2872;
    assign _71 = _1196;
    always @(posedge _274) begin
        if (_272)
            _1264 <= _1064;
        else
            _1264 <= _71;
    end
    assign _2857 = _1196 | _1264;
    assign _2856 = _1306 & _1308;
    assign _2858 = _2856 & _2857;
    assign _2854 = ~ _1308;
    assign _2851 = _1242 == _1697;
    assign _2846 = _1226 == _1072;
    assign _2847 = _2823 & _2846;
    assign _2848 = _2847 & _1234;
    assign _2849 = _2848 & _1239;
    assign _2852 = _2849 & _2851;
    assign _1330 = 2'b11;
    assign _1329 = _1328[1:0];
    assign _1331 = _1329 == _1330;
    assign _2928 = _1331 ? _2701 : _1064;
    assign _1244 = _1242 == _1697;
    assign _1245 = _1241 & _1244;
    assign _2929 = _1245 ? _2928 : _1064;
    assign _72 = _2929;
    always @(posedge _274) begin
        if (_272)
            _1306 <= _1064;
        else
            _1306 <= _72;
    end
    assign _2853 = _1306 | _2852;
    assign _2855 = _2853 & _2854;
    assign _2859 = _2855 | _2858;
    assign _2843 = ~ _1308;
    assign _2844 = _1353 & _2843;
    assign _2860 = _2844 | _2859;
    assign _2874 = _2860 | _2873;
    assign _2883 = _2874 | _2882;
    assign _2896 = _2883 ? _2895 : _1072;
    assign _2898 = _2896 == _1072;
    assign _2899 = ~ _2898;
    assign _2904 = _2899 & _2903;
    assign _2936 = _2904 ? _2701 : _2902;
    assign _2932 = _1258[3:3];
    assign _2931 = _2641 == _2724;
    assign _2933 = _2931 ? _2932 : _1064;
    assign _2934 = _2639 ? _2933 : _1064;
    assign _73 = _2934;
    always @(posedge _274) begin
        if (_272)
            _2666 <= _1064;
        else
            _2666 <= _73;
    end
    assign _2938 = _2666 ? _1064 : _2936;
    assign _74 = _2938;
    always @(posedge _274) begin
        if (_272)
            _2902 <= _1064;
        else
            _2902 <= _74;
    end
    assign _75 = _2902;
    assign _76 = _593;
    assign _77 = _1201;
    always @(posedge _274) begin
        if (_272)
            _1204 <= _1280;
        else
            _1204 <= _77;
    end
    assign _1201 = { _1200,
                     f_winner };
    assign _2648 = _1201 == _1204;
    assign _2649 = ~ _2648;
    assign _2939 = ~ _1196;
    assign _2940 = _1193 & _2939;
    assign _78 = _2940;
    always @(posedge _274) begin
        if (_272)
            _1196 <= _1064;
        else
            _1196 <= _78;
    end
    assign _1192 = _1191[2:2];
    assign _1193 = _1188 & _1192;
    assign _2647 = _1193 & _1196;
    assign _2650 = _2647 & _2649;
    assign _2942 = _2650 ? _2701 : _1627;
    assign _2944 = _1384 ? _1064 : _2942;
    assign _79 = _2944;
    always @(posedge _274) begin
        if (_272)
            _1627 <= _1064;
        else
            _1627 <= _79;
    end
    assign _80 = _1627;
    assign _2618 = _95 & _1733;
    assign _2949 = _2618 ? _2701 : _2947;
    assign _2951 = _1384 ? _1064 : _2949;
    assign _81 = _2951;
    always @(posedge _274) begin
        if (_272)
            _2947 <= _1064;
        else
            _2947 <= _81;
    end
    assign _82 = _2947;
    assign _2955 = _220 & _2309;
    assign _2602 = ~ _2601;
    assign _2595 = _2584 & _2594;
    assign _2603 = _2595 & _2602;
    assign _2551 = ~ _2550;
    assign _2547 = _2341 & _2546;
    assign _2552 = _2547 & _2551;
    assign _2952 = _2552 | _2603;
    assign _83 = _2952;
    assign _2953 = f_rx_push & _595;
    assign _2954 = _2953 | _83;
    assign _2956 = _2954 | _2955;
    assign _2958 = _2956 ? _2701 : _1624;
    assign _2960 = _1384 ? _1064 : _2958;
    assign _84 = _2960;
    always @(posedge _274) begin
        if (_272)
            _1624 <= _1064;
        else
            _1624 <= _84;
    end
    assign _85 = _1624;
    assign _5439 = { _85,
                     _82,
                     _80,
                     _76,
                     _75,
                     _69 };
    assign _2961 = 4'b0100;
    assign _2962 = _2641 == _2961;
    assign _2963 = _2962 ? _1258 : _1458;
    assign _2964 = _2639 ? _2963 : _1458;
    assign _86 = _2964;
    always @(posedge _274) begin
        if (_272)
            _1458 <= _1280;
        else
            _1458 <= _86;
    end
    assign _5438 = { _1392,
                     _3036 };
    assign _5436 = { _1392,
                     _3028 };
    assign _5434 = { _1392,
                     _1191 };
    assign _87 = f_in_fetch;
    assign _88 = _2309;
    assign _89 = _1654;
    assign _5431 = ~ _89;
    assign _90 = _1674;
    assign _5430 = ~ _90;
    assign _1588 = _692[60:60];
    assign _1589 = f_in_eval & _1588;
    assign _91 = _1589;
    assign _2973 = _692[61:61];
    assign _2974 = _1390 & _2973;
    assign _2976 = _2974 ? _2701 : _1660;
    assign _2967 = _1258[2:2];
    assign _2966 = _2641 == _2724;
    assign _2968 = _2966 ? _2967 : _1064;
    assign _2969 = _2639 ? _2968 : _1064;
    assign _92 = _2969;
    always @(posedge _274) begin
        if (_272)
            _2972 <= _1064;
        else
            _2972 <= _92;
    end
    assign _2978 = _2972 ? _1064 : _2976;
    assign _2980 = _1384 ? _1064 : _2978;
    assign _93 = _2980;
    always @(posedge _274) begin
        if (_272)
            _1660 <= _1064;
        else
            _1660 <= _93;
    end
    assign _2997 = _96 + _2719;
    assign _2995 = _96 - _2719;
    assign _2998 = _1735 ? _2997 : _2995;
    assign _2038 = ~ _1654;
    assign _2986 = _1328[2:0];
    assign _2988 = _2986 == _1715;
    assign _2984 = _1242 == _1703;
    assign _2985 = _2982 & _2984;
    assign _2989 = _2985 & _2988;
    assign _2992 = _2989 ? _2701 : _1064;
    assign _94 = _2992;
    always @(posedge _274) begin
        if (_272)
            _2037 <= _1064;
        else
            _2037 <= _94;
    end
    assign _2039 = _2037 & _2038;
    assign _1733 = _96 == _2834;
    assign _1734 = ~ _1733;
    assign _95 = f_viol_now;
    assign _1735 = _95 & _1734;
    assign _2993 = _1735 ^ _2039;
    assign _2999 = _2993 ? _2998 : _96;
    always @(posedge _274) begin
        if (_272)
            _3002 <= _2724;
        else
            _3002 <= _2999;
    end
    assign _96 = _3002;
    assign _1654 = _96 == _2724;
    assign _1655 = ~ _1654;
    assign _1647 = _1637[5:3];
    assign _1648 = { gnd,
                     _1647 };
    assign _1649 = _1648 < _221;
    assign _1650 = ~ _1649;
    assign _1646 = _1637[6:6];
    assign _1651 = _1646 & _1650;
    assign _3007 = _1258[2:0];
    assign _3006 = _1258[7:4];
    assign _3008 = { _3006,
                     _3007 };
    assign _3004 = 4'b1100;
    assign _3003 = _1328[3:0];
    assign _3005 = _3003 == _3004;
    assign _3009 = _3005 ? _3008 : _1637;
    assign _3010 = _2712 ? _3009 : _1637;
    assign _97 = _3010;
    always @(posedge _274) begin
        if (_272)
            _1637 <= _1267;
        else
            _1637 <= _97;
    end
    assign _1638 = _1637[2:0];
    assign _1640 = _1638 == _1072;
    assign _1642 = _1640 ? _1691 : _1638;
    assign _1643 = { gnd,
                     _1642 };
    assign _1644 = _128 < _1643;
    assign _1645 = ~ _1644;
    assign _1652 = _1645 | _1651;
    assign _1656 = _1652 | _1655;
    assign _1657 = _1656 | _1593;
    assign _1661 = _1657 | _1660;
    assign _98 = _1661;
    assign _3016 = f_policy == _1330;
    assign _3018 = _3016 ? _2701 : _1593;
    assign _3014 = f_policy == _1392;
    assign _3020 = _3014 ? _2701 : _3018;
    assign _3021 = f_viol_now ? _3020 : _1593;
    assign _3022 = _1188 ? _1593 : _3021;
    assign _3012 = _281 == _1272;
    assign _3023 = _3012 ? _3022 : _1593;
    assign _3025 = _1384 ? _1064 : _3023;
    assign _99 = _3025;
    always @(posedge _274) begin
        if (_272)
            _1593 <= _1064;
        else
            _1593 <= _99;
    end
    assign _100 = _1593;
    assign _5363 = _1390 ? _1272 : _281;
    assign _5359 = _3057 ? _1271 : _281;
    assign _5350 = f_policy == _1330;
    assign _5352 = _5350 ? _1392 : _281;
    assign _5349 = f_policy == _1272;
    assign _5354 = _5349 ? _1271 : _5352;
    assign _5348 = f_policy == _1392;
    assign _5356 = _5348 ? _1392 : _5354;
    assign _5357 = f_viol_now ? _5356 : _281;
    assign _1183 = f_chgmask3 & f_multi_eff;
    assign _1185 = _1183 == _1280;
    assign _1176 = _1136 == _1061;
    assign _1171 = 16'b0000000000000000;
    assign _1172 = _1136 == _1171;
    assign _1173 = _1172 & _1153;
    assign _1170 = _1112 == _1132;
    assign _1174 = _1170 | _1173;
    assign _1177 = _1111 ? _1176 : _1174;
    assign _1167 = _598[3:0];
    assign _1169 = _1167 == _2724;
    assign _1178 = _1169 | _1177;
    assign _1165 = _1136 == _1061;
    assign _1161 = _1136 == _1171;
    assign _1162 = _1161 & _1153;
    assign _1159 = _1112 == _1132;
    assign _1163 = _1159 | _1162;
    assign _1166 = _1111 ? _1165 : _1163;
    assign _1157 = _1123 == _1061;
    always @(posedge _274) begin
        if (_272)
            _1051 <= _1072;
        else
            _1051 <= _1048;
    end
    assign _1152 = { _1079,
                     _1051 };
    assign _1153 = _1109 < _1152;
    assign _1150 = _1123 == _1171;
    assign _1154 = _1150 & _1153;
    assign _1148 = _1112 == _1120;
    assign _1155 = _1148 | _1154;
    assign _1158 = _1111 ? _1157 : _1155;
    assign _1147 = _709[104:103];
    always @* begin
        case (_1147)
        0:
            _1179 <= vdd;
        1:
            _1179 <= _1158;
        2:
            _1179 <= _1166;
        default:
            _1179 <= _1178;
        endcase
    end
    assign _1146 = ~ _642;
    assign _1180 = _1146 | _1179;
    assign _1143 = _709[62:62];
    assign _1141 = _709[61:58];
    always @* begin
        case (_1141)
        0:
            _1142 <= vdd;
        1:
            _1142 <= _583;
        2:
            _1142 <= _587;
        3:
            _1142 <= _591;
        4:
            _1142 <= _593;
        5:
            _1142 <= _595;
        6:
            _1142 <= _599;
        7:
            _1142 <= _605;
        8:
            _1142 <= _610;
        9:
            _1142 <= _613;
        10:
            _1142 <= _616;
        11:
            _1142 <= _619;
        12:
            _1142 <= _624;
        13:
            _1142 <= _627;
        14:
            _1142 <= _630;
        default:
            _1142 <= _633;
        endcase
    end
    assign _1144 = _1142 ^ _1143;
    assign _1136 = _709[57:42];
    assign _1138 = _1136 == _1061;
    assign _1131 = 17'b00000000000000000;
    assign _1127 = _1009[57:42];
    assign _1128 = { gnd,
                     _1127 };
    assign _1129 = _1128 + _1116;
    always @(posedge _274) begin
        if (_272)
            _1132 <= _1131;
        else
            _1132 <= _1129;
    end
    assign _1133 = _1132 < _1112;
    assign _1134 = ~ _1133;
    assign _1123 = _709[41:26];
    assign _1125 = _1123 == _1171;
    assign _1040 = _1010[0:0];
    assign _1042 = _1040 ? _545 : _1072;
    assign _1037 = _1010[1:1];
    assign _1039 = _1037 ? _524 : _1072;
    assign _1043 = _1039 < _1042;
    assign _1044 = _1043 ? _1042 : _1039;
    assign _1032 = _1010[2:2];
    assign _1034 = _1032 ? _501 : _1072;
    assign _1029 = _1010[3:3];
    assign _1031 = _1029 ? _480 : _1072;
    assign _1035 = _1031 < _1034;
    assign _1036 = _1035 ? _1034 : _1031;
    assign _1045 = _1036 < _1044;
    assign _1046 = _1045 ? _1044 : _1036;
    assign _1022 = _1010[4:4];
    assign _1024 = _1022 ? _455 : _1072;
    assign _1019 = _1010[5:5];
    assign _1021 = _1019 ? _434 : _1072;
    assign _1025 = _1021 < _1024;
    assign _1026 = _1025 ? _1024 : _1021;
    assign _1014 = _1010[6:6];
    assign _1016 = _1014 ? _411 : _1072;
    assign _1010 = _1009[23:16];
    assign _1011 = _1010[7:7];
    assign _1013 = _1011 ? _390 : _1072;
    assign _1017 = _1013 < _1016;
    assign _1018 = _1017 ? _1016 : _1013;
    assign _1027 = _1018 < _1026;
    assign _1028 = _1027 ? _1026 : _1018;
    assign _1047 = _1028 < _1046;
    assign _1048 = _1047 ? _1046 : _1028;
    assign _1115 = 14'b00000000000000;
    assign _1116 = { _1115,
                     _1048 };
    assign _1009 = _365[511:400];
    assign _1113 = _1009[41:26];
    assign _1114 = { gnd,
                     _1113 };
    assign _1117 = _1114 + _1116;
    always @(posedge _274) begin
        if (_272)
            _1120 <= _1131;
        else
            _1120 <= _1117;
    end
    assign _1112 = { gnd,
                     _1109 };
    assign _1121 = _1112 < _1120;
    assign _1122 = ~ _1121;
    assign _1126 = _1122 | _1125;
    assign _1135 = _1126 & _1134;
    assign _1054 = _709[25:24];
    always @* begin
        case (_1054)
        0:
            _1109 <= _332;
        1:
            _1109 <= _335;
        2:
            _1109 <= _338;
        default:
            _1109 <= _338;
        endcase
    end
    assign _1111 = _1109 == _1061;
    assign _1139 = _1111 ? _1138 : _1135;
    assign _1103 = f_changed_all & f_chgmask3;
    assign _1105 = _1103 == _1280;
    assign _1106 = ~ _1105;
    assign _1102 = f_chgmask3 == _1280;
    assign _1107 = _1102 | _1106;
    assign _1096 = _709[7:0];
    assign _1094 = _709[15:8];
    assign _1095 = _304 ^ _1094;
    assign _1097 = _1095 & _1096;
    assign _1099 = _1097 == _1280;
    assign _1100 = f_valid3 & _1099;
    assign _1108 = _1100 & _1107;
    assign _1140 = _1108 & _1139;
    assign _1145 = _1140 & _1144;
    assign _1181 = _1145 & _1180;
    assign _1182 = f_in_eval & _1181;
    assign _1186 = _1182 & _1185;
    assign f_fire3 = _1186 & _724;
    assign _688 = f_chgmask0 & f_multi_eff;
    assign _690 = _688 == _1280;
    assign _676 = _573 == _1061;
    assign _672 = _573 == _1171;
    assign _673 = _672 & _653;
    assign _670 = _343 == _569;
    assign _674 = _670 | _673;
    assign _677 = _341 ? _676 : _674;
    assign _667 = _598[3:0];
    assign _669 = _667 == _2724;
    assign _678 = _669 | _677;
    assign _665 = _573 == _1061;
    assign _661 = _573 == _1171;
    assign _662 = _661 & _653;
    assign _659 = _343 == _569;
    assign _663 = _659 | _662;
    assign _666 = _341 ? _665 : _663;
    assign _657 = _560 == _1061;
    always @(posedge _274) begin
        if (_272)
            _651 <= _1072;
        else
            _651 <= _552;
    end
    assign _652 = { _1079,
                    _651 };
    assign _653 = _339 < _652;
    assign _647 = _560 == _1171;
    assign _654 = _647 & _653;
    assign _645 = _343 == _557;
    assign _655 = _645 | _654;
    assign _658 = _341 ? _657 : _655;
    assign _644 = _297[104:103];
    always @* begin
        case (_644)
        0:
            _679 <= vdd;
        1:
            _679 <= _658;
        2:
            _679 <= _666;
        default:
            _679 <= _678;
        endcase
    end
    assign _643 = ~ _642;
    assign _680 = _643 | _679;
    assign _635 = _297[62:62];
    assign _578 = _297[61:58];
    always @* begin
        case (_578)
        0:
            _634 <= vdd;
        1:
            _634 <= _583;
        2:
            _634 <= _587;
        3:
            _634 <= _591;
        4:
            _634 <= _593;
        5:
            _634 <= _595;
        6:
            _634 <= _599;
        7:
            _634 <= _605;
        8:
            _634 <= _610;
        9:
            _634 <= _613;
        10:
            _634 <= _616;
        11:
            _634 <= _619;
        12:
            _634 <= _624;
        13:
            _634 <= _627;
        14:
            _634 <= _630;
        default:
            _634 <= _633;
        endcase
    end
    assign _636 = _634 ^ _635;
    assign _573 = _297[57:42];
    assign _575 = _573 == _1061;
    assign _564 = _366[57:42];
    assign _565 = { gnd,
                    _564 };
    assign _566 = _565 + _553;
    always @(posedge _274) begin
        if (_272)
            _569 <= _1131;
        else
            _569 <= _566;
    end
    assign _570 = _569 < _343;
    assign _571 = ~ _570;
    assign _560 = _297[41:26];
    assign _562 = _560 == _1171;
    assign _526 = _370[0:0];
    assign _546 = _526 ? _545 : _1072;
    assign _505 = _370[1:1];
    assign _525 = _505 ? _524 : _1072;
    assign _547 = _525 < _546;
    assign _548 = _547 ? _546 : _525;
    assign _482 = _370[2:2];
    assign _502 = _482 ? _501 : _1072;
    assign _461 = _370[3:3];
    assign _481 = _461 ? _480 : _1072;
    assign _503 = _481 < _502;
    assign _504 = _503 ? _502 : _481;
    assign _549 = _504 < _548;
    assign _550 = _549 ? _548 : _504;
    assign _436 = _370[4:4];
    assign _456 = _436 ? _455 : _1072;
    assign _415 = _370[5:5];
    assign _435 = _415 ? _434 : _1072;
    assign _457 = _435 < _456;
    assign _458 = _457 ? _456 : _435;
    assign _392 = _370[6:6];
    assign _412 = _392 ? _411 : _1072;
    assign _370 = _366[23:16];
    assign _371 = _370[7:7];
    assign _391 = _371 ? _390 : _1072;
    assign _413 = _391 < _412;
    assign _414 = _413 ? _412 : _391;
    assign _459 = _414 < _458;
    assign _460 = _459 ? _458 : _414;
    assign _551 = _460 < _550;
    assign _552 = _551 ? _550 : _460;
    assign _553 = { _1115,
                    _552 };
    assign _366 = _365[175:64];
    assign _367 = _366[41:26];
    assign _368 = { gnd,
                    _367 };
    assign _554 = _368 + _553;
    always @(posedge _274) begin
        if (_272)
            _557 <= _1131;
        else
            _557 <= _554;
    end
    assign _343 = { gnd,
                    _339 };
    assign _558 = _343 < _557;
    assign _559 = ~ _558;
    assign _563 = _559 | _562;
    assign _572 = _563 & _571;
    assign _329 = _297[25:24];
    always @* begin
        case (_329)
        0:
            _339 <= _332;
        1:
            _339 <= _335;
        2:
            _339 <= _338;
        default:
            _339 <= _338;
        endcase
    end
    assign _341 = _339 == _1061;
    assign _576 = _341 ? _575 : _572;
    assign _323 = f_changed_all & f_chgmask0;
    assign _325 = _323 == _1280;
    assign _326 = ~ _325;
    assign _314 = f_chgmask0 == _1280;
    assign _327 = _314 | _326;
    assign _307 = _297[7:0];
    assign _305 = _297[15:8];
    assign _306 = _304 ^ _305;
    assign _308 = _306 & _307;
    assign _310 = _308 == _1280;
    assign _5120 = _348 + _1691;
    assign _1199 = 6'b000000;
    assign _3031 = _1258[5:0];
    assign _3030 = _2641 == _2714;
    assign _3032 = _3030 ? _3031 : _3028;
    assign _3033 = _2639 ? _3032 : _3028;
    assign _101 = _3033;
    always @(posedge _274) begin
        if (_272)
            _3028 <= _1199;
        else
            _3028 <= _101;
    end
    assign _3058 = _3057 ? _3055 : _1200;
    assign _3039 = _1258[5:0];
    assign _3037 = 4'b0011;
    assign _3038 = _2641 == _3037;
    assign _3040 = _3038 ? _3039 : _3036;
    assign _3041 = _2639 ? _3040 : _3036;
    assign _102 = _3041;
    always @(posedge _274) begin
        if (_272)
            _3036 <= _1199;
        else
            _3036 <= _102;
    end
    assign _3045 = _1384 ? _3036 : _3044;
    assign _103 = _3045;
    always @(posedge _274) begin
        if (_272)
            _3044 <= _1199;
        else
            _3044 <= _103;
    end
    assign _3048 = f_policy == _1272;
    assign _3049 = _3048 ? _3044 : _1200;
    assign _3050 = f_viol_now ? _3049 : _1200;
    assign _3059 = _1188 ? _3058 : _3050;
    assign _3046 = _281 == _1272;
    assign _3060 = _3046 ? _3059 : _1200;
    assign _3061 = _1384 ? _3028 : _3060;
    assign _104 = _3061;
    always @(posedge _274) begin
        if (_272)
            _1200 <= _1199;
        else
            _1200 <= _104;
    end
    assign _3054 = _709[110:105];
    assign _3053 = _703[110:105];
    assign _3052 = _697[110:105];
    assign _3051 = _297[110:105];
    always @* begin
        case (f_winner)
        0:
            _3055 <= _3051;
        1:
            _3055 <= _3052;
        2:
            _3055 <= _3053;
        default:
            _3055 <= _3054;
        endcase
    end
    assign _3056 = _3055 == _1200;
    assign _3057 = ~ _3056;
    assign _5116 = _3057 ? _1072 : _348;
    assign _5111 = f_policy == _1272;
    assign _5113 = _5111 ? _1072 : _348;
    assign _1611 = f_changed_all & f_watch;
    assign _1613 = _1611 == _1280;
    assign _1614 = ~ _1613;
    assign _1609 = ~ _1188;
    assign _1610 = f_in_eval & _1609;
    assign f_unexp_now = _1610 & _1614;
    assign _3065 = ~ f_amb_now;
    assign _3066 = _1608 & _3065;
    assign _3068 = _3066 ? _2701 : _3064;
    assign _3069 = _1188 ? _3064 : _3068;
    assign _3064 = _1391 ? _1064 : _1606;
    assign _3062 = _281 == _1272;
    assign _3070 = _3062 ? _3069 : _3064;
    assign _105 = _3070;
    always @(posedge _274) begin
        if (_272)
            _1606 <= _1064;
        else
            _1606 <= _105;
    end
    assign _1607 = ~ _1606;
    assign _5102 = 16'b0000000000000001;
    assign _5103 = _332 + _5102;
    assign _5099 = _332 == _1061;
    assign _5100 = ~ _5099;
    assign _5101 = _5060 & _5100;
    assign _5104 = _5101 ? _5103 : _332;
    assign _5044 = _692[26:24];
    assign _5042 = _709[93:91];
    assign _5041 = _703[93:91];
    assign _5040 = _697[93:91];
    assign _5039 = _297[93:91];
    assign _997 = f_chgmask2 & f_multi_eff;
    assign _999 = _997 == _1280;
    assign _990 = _947 == _1061;
    assign _986 = _947 == _1171;
    assign _987 = _986 & _967;
    assign _984 = _883 == _943;
    assign _988 = _984 | _987;
    assign _991 = _882 ? _990 : _988;
    assign _981 = _598[3:0];
    assign _983 = _981 == _2724;
    assign _992 = _983 | _991;
    assign _979 = _947 == _1061;
    assign _975 = _947 == _1171;
    assign _976 = _975 & _967;
    assign _973 = _883 == _943;
    assign _977 = _973 | _976;
    assign _980 = _882 ? _979 : _977;
    assign _971 = _934 == _1061;
    always @(posedge _274) begin
        if (_272)
            _965 <= _1072;
        else
            _965 <= _926;
    end
    assign _966 = { _1079,
                    _965 };
    assign _967 = _880 < _966;
    assign _961 = _934 == _1171;
    assign _968 = _961 & _967;
    assign _959 = _883 == _931;
    assign _969 = _959 | _968;
    assign _972 = _882 ? _971 : _969;
    assign _958 = _703[104:103];
    always @* begin
        case (_958)
        0:
            _993 <= vdd;
        1:
            _993 <= _972;
        2:
            _993 <= _980;
        default:
            _993 <= _992;
        endcase
    end
    assign _957 = ~ _642;
    assign _994 = _957 | _993;
    assign _954 = _703[62:62];
    assign _952 = _703[61:58];
    always @* begin
        case (_952)
        0:
            _953 <= vdd;
        1:
            _953 <= _583;
        2:
            _953 <= _587;
        3:
            _953 <= _591;
        4:
            _953 <= _593;
        5:
            _953 <= _595;
        6:
            _953 <= _599;
        7:
            _953 <= _605;
        8:
            _953 <= _610;
        9:
            _953 <= _613;
        10:
            _953 <= _616;
        11:
            _953 <= _619;
        12:
            _953 <= _624;
        13:
            _953 <= _627;
        14:
            _953 <= _630;
        default:
            _953 <= _633;
        endcase
    end
    assign _955 = _953 ^ _954;
    assign _947 = _703[57:42];
    assign _949 = _947 == _1061;
    assign _938 = _884[57:42];
    assign _939 = { gnd,
                    _938 };
    assign _940 = _939 + _927;
    always @(posedge _274) begin
        if (_272)
            _943 <= _1131;
        else
            _943 <= _940;
    end
    assign _944 = _943 < _883;
    assign _945 = ~ _944;
    assign _934 = _703[41:26];
    assign _936 = _934 == _1171;
    assign _918 = _888[0:0];
    assign _920 = _918 ? _545 : _1072;
    assign _915 = _888[1:1];
    assign _917 = _915 ? _524 : _1072;
    assign _921 = _917 < _920;
    assign _922 = _921 ? _920 : _917;
    assign _910 = _888[2:2];
    assign _912 = _910 ? _501 : _1072;
    assign _907 = _888[3:3];
    assign _909 = _907 ? _480 : _1072;
    assign _913 = _909 < _912;
    assign _914 = _913 ? _912 : _909;
    assign _923 = _914 < _922;
    assign _924 = _923 ? _922 : _914;
    assign _900 = _888[4:4];
    assign _902 = _900 ? _455 : _1072;
    assign _897 = _888[5:5];
    assign _899 = _897 ? _434 : _1072;
    assign _903 = _899 < _902;
    assign _904 = _903 ? _902 : _899;
    assign _892 = _888[6:6];
    assign _894 = _892 ? _411 : _1072;
    assign _888 = _884[23:16];
    assign _889 = _888[7:7];
    assign _891 = _889 ? _390 : _1072;
    assign _895 = _891 < _894;
    assign _896 = _895 ? _894 : _891;
    assign _905 = _896 < _904;
    assign _906 = _905 ? _904 : _896;
    assign _925 = _906 < _924;
    assign _926 = _925 ? _924 : _906;
    assign _927 = { _1115,
                    _926 };
    assign _884 = _365[399:288];
    assign _885 = _884[41:26];
    assign _886 = { gnd,
                    _885 };
    assign _928 = _886 + _927;
    always @(posedge _274) begin
        if (_272)
            _931 <= _1131;
        else
            _931 <= _928;
    end
    assign _883 = { gnd,
                    _880 };
    assign _932 = _883 < _931;
    assign _933 = ~ _932;
    assign _937 = _933 | _936;
    assign _946 = _937 & _945;
    assign _879 = _703[25:24];
    always @* begin
        case (_879)
        0:
            _880 <= _332;
        1:
            _880 <= _335;
        2:
            _880 <= _338;
        default:
            _880 <= _338;
        endcase
    end
    assign _882 = _880 == _1061;
    assign _950 = _882 ? _949 : _946;
    assign _873 = f_changed_all & f_chgmask2;
    assign _875 = _873 == _1280;
    assign _876 = ~ _875;
    assign _872 = f_chgmask2 == _1280;
    assign _877 = _872 | _876;
    assign _866 = _703[7:0];
    assign _864 = _703[15:8];
    assign _865 = _304 ^ _864;
    assign _867 = _865 & _866;
    assign _869 = _867 == _1280;
    assign _870 = f_valid2 & _869;
    assign _878 = _870 & _877;
    assign _951 = _878 & _950;
    assign _956 = _951 & _955;
    assign _995 = _956 & _994;
    assign _996 = f_in_eval & _995;
    assign _1000 = _996 & _999;
    assign f_fire2 = _1000 & _724;
    assign _1004 = f_fire2 ? _1272 : _1330;
    assign f_policy = _692[59:58];
    assign _723 = f_policy == _1271;
    assign f_chgmask3 = _709[23:16];
    assign f_valid3 = _709[111:111];
    assign _713 = f_valid3 ? f_chgmask3 : _1280;
    assign f_chgmask2 = _703[23:16];
    assign f_valid2 = _703[111:111];
    assign _707 = f_valid2 ? f_chgmask2 : _1280;
    assign _701 = f_valid1 ? f_chgmask1 : _1280;
    assign f_chgmask0 = _297[23:16];
    assign _695 = f_valid0 ? f_chgmask0 : _1280;
    assign f_watch = _692[57:50];
    assign _696 = f_watch | _695;
    assign _702 = _696 | _701;
    assign _708 = _702 | _707;
    assign f_relevant = _708 | _713;
    assign _715 = f_multi_eff & f_relevant;
    assign _717 = _715 == _1280;
    assign _718 = ~ _717;
    assign f_amb_now = f_in_eval & _718;
    assign _720 = ~ f_amb_now;
    assign _724 = _720 | _723;
    assign _686 = _317 & f_chg_now;
    assign _3075 = _317 & f_chg_now;
    assign _3076 = _685 | _3075;
    assign _3072 = _281 == _1272;
    assign _3074 = _3072 ? _1280 : _685;
    assign _3071 = _281 == _1271;
    assign _3077 = _3071 ? _3076 : _3074;
    assign _3079 = _1384 ? _1280 : _3077;
    assign _106 = _3079;
    always @(posedge _274) begin
        if (_272)
            _685 <= _1280;
        else
            _685 <= _106;
    end
    assign f_multi_eff = _685 | _686;
    assign _859 = f_chgmask1 & f_multi_eff;
    assign _861 = _859 == _1280;
    assign _852 = _809 == _1061;
    assign _848 = _809 == _1171;
    assign _849 = _848 & _829;
    assign _846 = _745 == _805;
    assign _850 = _846 | _849;
    assign _853 = _744 ? _852 : _850;
    assign _843 = _598[3:0];
    assign _845 = _843 == _2724;
    assign _854 = _845 | _853;
    assign _841 = _809 == _1061;
    assign _837 = _809 == _1171;
    assign _838 = _837 & _829;
    assign _835 = _745 == _805;
    assign _839 = _835 | _838;
    assign _842 = _744 ? _841 : _839;
    assign _833 = _796 == _1061;
    always @(posedge _274) begin
        if (_272)
            _827 <= _1072;
        else
            _827 <= _788;
    end
    assign _828 = { _1079,
                    _827 };
    assign _829 = _742 < _828;
    assign _823 = _796 == _1171;
    assign _830 = _823 & _829;
    assign _821 = _745 == _793;
    assign _831 = _821 | _830;
    assign _834 = _744 ? _833 : _831;
    assign _820 = _697[104:103];
    always @* begin
        case (_820)
        0:
            _855 <= vdd;
        1:
            _855 <= _834;
        2:
            _855 <= _842;
        default:
            _855 <= _854;
        endcase
    end
    assign _3080 = _1191[1:0];
    assign _3081 = _1384 ? _3080 : _640;
    assign _107 = _3081;
    always @(posedge _274) begin
        if (_272)
            _640 <= _1392;
        else
            _640 <= _107;
    end
    assign _642 = _640 == _1272;
    assign _819 = ~ _642;
    assign _856 = _819 | _855;
    assign _816 = _697[62:62];
    assign _3085 = _2810 ? _2701 : _3083;
    assign _3083 = _2788 ? _2701 : _633;
    assign _3086 = _2455 ? _3085 : _3083;
    assign _3088 = _2774 ? _1064 : _3086;
    assign _3090 = _2557 ? _1064 : _3088;
    assign _108 = _3090;
    always @(posedge _274) begin
        if (_272)
            _633 <= _1064;
        else
            _633 <= _108;
    end
    assign _3101 = _215[1:1];
    assign _3102 = ~ _3101;
    assign _3098 = 5'b10010;
    assign _3097 = _1328[4:0];
    assign _3099 = _3097 == _3098;
    assign _3094 = _1328[5:5];
    assign _3096 = _3094 == _2701;
    assign _3100 = _3096 & _3099;
    assign _3103 = _3100 & _3102;
    assign _3104 = _3103 ? _1258 : _3093;
    assign _3105 = _2913 ? _3104 : _3093;
    assign _109 = _3105;
    always @(posedge _274) begin
        if (_272)
            _3093 <= _1280;
        else
            _3093 <= _109;
    end
    assign _3116 = _215[1:1];
    assign _3117 = ~ _3116;
    assign _3113 = 5'b10011;
    assign _3112 = _1328[4:0];
    assign _3114 = _3112 == _3113;
    assign _3109 = _1328[5:5];
    assign _3111 = _3109 == _2701;
    assign _3115 = _3111 & _3114;
    assign _3118 = _3115 & _3117;
    assign _3119 = _3118 ? _1258 : _3108;
    assign _3120 = _2913 ? _3119 : _3108;
    assign _110 = _3120;
    always @(posedge _274) begin
        if (_272)
            _3108 <= _1280;
        else
            _3108 <= _110;
    end
    assign _3158 = { _3108,
                     _3093 };
    assign _3131 = _215[1:1];
    assign _3132 = ~ _3131;
    assign _3128 = 5'b10000;
    assign _3127 = _1328[4:0];
    assign _3129 = _3127 == _3128;
    assign _3124 = _1328[5:5];
    assign _3126 = _3124 == _2701;
    assign _3130 = _3126 & _3129;
    assign _3133 = _3130 & _3132;
    assign _3134 = _3133 ? _1258 : _3123;
    assign _3135 = _2913 ? _3134 : _3123;
    assign _111 = _3135;
    always @(posedge _274) begin
        if (_272)
            _3123 <= _1280;
        else
            _3123 <= _111;
    end
    assign _3146 = _215[1:1];
    assign _3147 = ~ _3146;
    assign _3143 = 5'b10001;
    assign _3142 = _1328[4:0];
    assign _3144 = _3142 == _3143;
    assign _3139 = _1328[5:5];
    assign _3141 = _3139 == _2701;
    assign _3145 = _3141 & _3144;
    assign _3148 = _3145 & _3147;
    assign _3149 = _3148 ? _1258 : _3138;
    assign _3150 = _2913 ? _3149 : _3138;
    assign _112 = _3150;
    always @(posedge _274) begin
        if (_272)
            _3138 <= _1280;
        else
            _3138 <= _112;
    end
    assign _3156 = { _3138,
                     _3123 };
    assign _3157 = _3155 ^ _3156;
    assign _3159 = _3157 & _3158;
    assign _3161 = _3159 == _1171;
    assign _3163 = _3161 ? _2701 : _630;
    assign _3164 = _2469 ? _3163 : _630;
    assign _3165 = _2810 ? _630 : _3164;
    assign _3166 = _2455 ? _3165 : _630;
    assign _3168 = _2774 ? _1064 : _3166;
    assign _3170 = _2557 ? _1064 : _3168;
    assign _113 = _3170;
    always @(posedge _274) begin
        if (_272)
            _630 <= _1064;
        else
            _630 <= _113;
    end
    assign _3184 = _2801 == _3183;
    assign _3185 = ~ _3184;
    assign _3187 = _3177 ? _3186 : g_crc_bad;
    assign _3188 = _2469 ? _3187 : g_crc_bad;
    assign _3189 = _2810 ? g_crc_bad : _3188;
    assign _3190 = _2455 ? _3189 : g_crc_bad;
    assign _3192 = _2774 ? _1064 : _3190;
    assign _114 = _3192;
    always @(posedge _274) begin
        if (_272)
            g_crc_bad <= _1064;
        else
            g_crc_bad <= _114;
    end
    assign _3186 = g_crc_bad | _3185;
    assign _3195 = ~ _3186;
    assign _3193 = 6'b000001;
    assign _3194 = g_left_0 == _3193;
    assign _3196 = _3194 ? _3195 : _627;
    assign _3197 = _3177 ? _3196 : _627;
    assign _3198 = _2469 ? _3197 : _627;
    assign _3199 = _2810 ? _627 : _3198;
    assign _3200 = _2455 ? _3199 : _627;
    assign _3202 = _2774 ? _1064 : _3200;
    assign _3204 = _2557 ? _1064 : _3202;
    assign _115 = _3204;
    always @(posedge _274) begin
        if (_272)
            _627 <= _1064;
        else
            _627 <= _115;
    end
    assign _3208 = _2765 ? _2701 : _3206;
    assign _3206 = _2743 ? _2701 : _619;
    assign _3209 = _2215 ? _3208 : _3206;
    assign _3211 = _2729 ? _1064 : _3209;
    assign _3213 = _2314 ? _1064 : _3211;
    assign _116 = _3213;
    always @(posedge _274) begin
        if (_272)
            _619 <= _1064;
        else
            _619 <= _116;
    end
    assign _3224 = _215[0:0];
    assign _3225 = ~ _3224;
    assign _3220 = _1328[4:0];
    assign _3222 = _3220 == _3098;
    assign _3217 = _1328[5:5];
    assign _3219 = _3217 == _1064;
    assign _3223 = _3219 & _3222;
    assign _3226 = _3223 & _3225;
    assign _3227 = _3226 ? _1258 : _3216;
    assign _3228 = _2913 ? _3227 : _3216;
    assign _117 = _3228;
    always @(posedge _274) begin
        if (_272)
            _3216 <= _1280;
        else
            _3216 <= _117;
    end
    assign _3239 = _215[0:0];
    assign _3240 = ~ _3239;
    assign _3235 = _1328[4:0];
    assign _3237 = _3235 == _3113;
    assign _3232 = _1328[5:5];
    assign _3234 = _3232 == _1064;
    assign _3238 = _3234 & _3237;
    assign _3241 = _3238 & _3240;
    assign _3242 = _3241 ? _1258 : _3231;
    assign _3243 = _2913 ? _3242 : _3231;
    assign _118 = _3243;
    always @(posedge _274) begin
        if (_272)
            _3231 <= _1280;
        else
            _3231 <= _118;
    end
    assign _3281 = { _3231,
                     _3216 };
    assign _3254 = _215[0:0];
    assign _3255 = ~ _3254;
    assign _3250 = _1328[4:0];
    assign _3252 = _3250 == _3128;
    assign _3247 = _1328[5:5];
    assign _3249 = _3247 == _1064;
    assign _3253 = _3249 & _3252;
    assign _3256 = _3253 & _3255;
    assign _3257 = _3256 ? _1258 : _3246;
    assign _3258 = _2913 ? _3257 : _3246;
    assign _119 = _3258;
    always @(posedge _274) begin
        if (_272)
            _3246 <= _1280;
        else
            _3246 <= _119;
    end
    assign _3269 = _215[0:0];
    assign _3270 = ~ _3269;
    assign _3265 = _1328[4:0];
    assign _3267 = _3265 == _3143;
    assign _3262 = _1328[5:5];
    assign _3264 = _3262 == _1064;
    assign _3268 = _3264 & _3267;
    assign _3271 = _3268 & _3270;
    assign _3272 = _3271 ? _1258 : _3261;
    assign _3273 = _2913 ? _3272 : _3261;
    assign _120 = _3273;
    always @(posedge _274) begin
        if (_272)
            _3261 <= _1280;
        else
            _3261 <= _120;
    end
    assign _3279 = { _3261,
                     _3246 };
    assign _3280 = _3278 ^ _3279;
    assign _3282 = _3280 & _3281;
    assign _3284 = _3282 == _1171;
    assign _3286 = _3284 ? _2701 : _616;
    assign _3287 = _2229 ? _3286 : _616;
    assign _3288 = _2765 ? _616 : _3287;
    assign _3289 = _2215 ? _3288 : _616;
    assign _3291 = _2729 ? _1064 : _3289;
    assign _3293 = _2314 ? _1064 : _3291;
    assign _121 = _3293;
    always @(posedge _274) begin
        if (_272)
            _616 <= _1064;
        else
            _616 <= _121;
    end
    assign _3307 = _2756 == _3306;
    assign _3308 = ~ _3307;
    assign _3310 = _3300 ? _3309 : g_crc_bad_0;
    assign _3311 = _2229 ? _3310 : g_crc_bad_0;
    assign _3312 = _2765 ? g_crc_bad_0 : _3311;
    assign _3313 = _2215 ? _3312 : g_crc_bad_0;
    assign _3315 = _2729 ? _1064 : _3313;
    assign _122 = _3315;
    always @(posedge _274) begin
        if (_272)
            g_crc_bad_0 <= _1064;
        else
            g_crc_bad_0 <= _122;
    end
    assign _3309 = g_crc_bad_0 | _3308;
    assign _3318 = ~ _3309;
    assign _3317 = g_left == _3193;
    assign _3319 = _3317 ? _3318 : _613;
    assign _3320 = _3300 ? _3319 : _613;
    assign _3321 = _2229 ? _3320 : _613;
    assign _3322 = _2765 ? _613 : _3321;
    assign _3323 = _2215 ? _3322 : _613;
    assign _3325 = _2729 ? _1064 : _3323;
    assign _3327 = _2314 ? _1064 : _3325;
    assign _123 = _3327;
    always @(posedge _274) begin
        if (_272)
            _613 <= _1064;
        else
            _613 <= _123;
    end
    assign _3328 = 4'b0101;
    assign _3329 = _2641 == _3328;
    assign _3330 = _3329 ? _1258 : _603;
    assign _3331 = _2639 ? _3330 : _603;
    assign _124 = _3331;
    always @(posedge _274) begin
        if (_272)
            _603 <= _1280;
        else
            _603 <= _124;
    end
    assign _604 = _603[6:0];
    assign _600 = _590[7:1];
    assign _605 = _600 == _604;
    assign _597 = 16'b1010110011100001;
    assign _3336 = _598[10:10];
    assign _3335 = _598[12:12];
    assign _3337 = _3335 ^ _3336;
    assign _3334 = _598[13:13];
    assign _3338 = _3334 ^ _3337;
    assign _3333 = _598[15:15];
    assign _3339 = _3333 ^ _3338;
    assign _3332 = _598[14:0];
    assign _3340 = { _3332,
                     _3339 };
    assign _125 = _3340;
    always @(posedge _274) begin
        if (_272)
            _598 <= _597;
        else
            _598 <= _125;
    end
    assign _599 = _598[0:0];
    assign _3359 = _128 + _2719;
    assign _3357 = _128 - _2719;
    assign _3360 = _1663 ? _3359 : _3357;
    assign _1674 = _128 == _2724;
    assign _1675 = ~ _1674;
    assign _3342 = _1242 == _1715;
    assign _2981 = _1229 & _1234;
    assign _2982 = _2981 & _1239;
    assign _3343 = _2982 & _3342;
    assign _3346 = _3343 ? _2701 : _1064;
    assign _126 = _3346;
    always @(posedge _274) begin
        if (_272)
            _1672 <= _1064;
        else
            _1672 <= _126;
    end
    assign _1676 = _1672 & _1675;
    assign _1662 = ~ _595;
    assign _3353 = ~ _3352;
    assign _3349 = _2584 | _2594;
    assign _3347 = _2341 | _2546;
    assign _3348 = _2306 | _3347;
    assign _3350 = _3348 | _3349;
    assign _3354 = _3350 & _3353;
    assign f_rx_push = _3354;
    assign _1663 = f_rx_push & _1662;
    assign _3355 = _1663 ^ _1676;
    assign _3361 = _3355 ? _3360 : _128;
    always @(posedge _274) begin
        if (_272)
            _3364 <= _2724;
        else
            _3364 <= _3361;
    end
    assign _128 = _3364;
    assign _595 = _128 == _2834;
    assign _591 = _590[0:0];
    assign _4855 = _586[7:1];
    assign _4856 = { vdd,
                     _4855 };
    assign _4853 = _4845[7:7];
    assign _4852 = _4845[6:6];
    assign _4851 = _4845[5:5];
    assign _4850 = _4845[4:4];
    assign _4849 = _4845[3:3];
    assign _4848 = _4845[2:2];
    assign _4847 = _4845[1:1];
    assign _4846 = _4845[0:0];
    assign _4854 = { _4846,
                     _4847,
                     _4848,
                     _4849,
                     _4850,
                     _4851,
                     _4852,
                     _4853 };
    assign _4838 = _221 + _2719;
    assign _4836 = _221 - _2719;
    assign _4839 = _3391 ? _4838 : _4836;
    assign _2309 = _221 == _2834;
    assign _3390 = ~ _2309;
    assign _3387 = ~ _2307;
    assign _3370 = _3367 ? _2701 : _1064;
    assign _129 = _3370;
    always @(posedge _274) begin
        if (_272)
            _2880 <= _1064;
        else
            _2880 <= _129;
    end
    assign _3388 = _2880 & _3387;
    assign _2304 = ~ _2270;
    assign _2298 = g_bitpos + _1691;
    assign _2293 = ~ _2228;
    assign g_tx_bit = _2283 & _2291;
    assign _2294 = g_tx_bit & _2293;
    assign _2295 = _2294 & g_data_left;
    assign _2296 = _2264 | _2295;
    assign _2299 = _2296 ? _2298 : g_bitpos;
    assign _2301 = _2299 == _1072;
    assign _2302 = ~ _2301;
    assign _2273 = _2272 & _2107;
    assign _2303 = _2273 & _2302;
    assign _2305 = _2303 & _2304;
    assign _2269 = g_bitpos == _1727;
    assign _2256 = g_cnt[5:0];
    assign _2261 = _2256 < _2260;
    assign _2262 = ~ _2261;
    assign _2252 = g_cnt[15:6];
    assign _2254 = _2252 == _1076;
    assign _2255 = ~ _2254;
    assign _2263 = _2255 | _2262;
    assign _4821 = ~ _2109;
    assign _4822 = _2107 & _4821;
    assign _4825 = _4822 ? _1271 : _1272;
    assign _4814 = ~ _2291;
    assign _4815 = _2283 & _4814;
    assign _4816 = _610 | _4815;
    assign _4817 = _4816 | _4806;
    assign _4819 = _4817 ? _1272 : _4813;
    assign _4800 = g_run + _1691;
    assign _4797 = g_run + _1691;
    assign _4793 = vdd == g_last;
    assign _4791 = g_run == _1072;
    assign _4792 = ~ _4791;
    assign _4794 = _4792 & _4793;
    assign _4798 = _4794 ? _4797 : _1691;
    assign _4789 = _2219 == _1272;
    assign _4801 = _4789 ? _4800 : _4798;
    assign _4802 = _4801 == _2226;
    assign _4783 = g_run + _1691;
    assign _4779 = gnd == g_last;
    assign _4777 = g_run == _1072;
    assign _4778 = ~ _4777;
    assign _4780 = _4778 & _4779;
    assign _4784 = _4780 ? _4783 : _1691;
    assign _4775 = _2219 == _1272;
    assign _4786 = _4775 ? _1072 : _4784;
    assign _4787 = _4786 == _2226;
    assign _4803 = _2756 ? _4802 : _4787;
    assign _4804 = _2222 & _4803;
    assign _4805 = ~ _4804;
    assign _4771 = g_left == _3193;
    assign _4769 = g_left == _1199;
    assign _4772 = _3300 ? _4771 : _4769;
    assign _4764 = g_cnt + _5102;
    assign _4765 = _4764 == _2249;
    assign _4762 = g_cnt == _2249;
    assign _4766 = _2251 ? _4765 : _4762;
    assign _4760 = ~ _2765;
    assign _4761 = _2215 & _4760;
    assign _4767 = _4761 & _4766;
    assign _4773 = _4767 & _4772;
    assign _4806 = _4773 & _4805;
    assign _4808 = _4806 ? _1330 : _4759;
    assign _4810 = _2765 ? _1392 : _4808;
    assign _4756 = _2291 ? _4754 : _1330;
    assign _4752 = _2134 & _2132;
    assign _4754 = _4752 ? _1272 : g_mode_0;
    assign _4757 = _2283 ? _4756 : _4754;
    assign _3466 = _2291 ? _3465 : _3373;
    assign _3467 = _2283 ? _3466 : _3373;
    assign _130 = _3467;
    always @(posedge _274) begin
        if (_272)
            _3373 <= _1064;
        else
            _3373 <= _130;
    end
    assign _3479 = ~ _3465;
    assign _3477 = ~ f_lane0_out;
    assign _3478 = _3465 ? f_lane0_out : _3477;
    always @* begin
        case (_2135)
        0:
            _3480 <= _3465;
        1:
            _3480 <= _3478;
        2:
            _3480 <= _3479;
        default:
            _3480 <= _3465;
        endcase
    end
    assign _3481 = _2291 ? _3480 : _2701;
    assign _3482 = _2283 ? _3481 : f_lane0_out;
    assign _3474 = ~ _2282;
    assign _3471 = _2135 == _1272;
    assign _3468 = ~ _2107;
    assign _3469 = _2103 & _3468;
    assign _3472 = _3469 & _3471;
    assign _3473 = _3472 & _2214;
    assign _3475 = _3473 & _3474;
    assign _3483 = _3475 ? _3373 : _3482;
    assign _3485 = _2743 ? _2701 : _3483;
    assign _3487 = _2272 ? _2701 : _3485;
    assign _3489 = _2729 ? _2701 : _3487;
    assign _3491 = _2314 ? _2701 : _3489;
    assign _131 = _3491;
    always @(posedge _274) begin
        if (_272)
            f_lane0_out <= vdd;
        else
            f_lane0_out <= _131;
    end
    assign _2741 = _2125 == f_lane0_out;
    assign _2742 = ~ _2741;
    assign _2190 = _2175 == _1171;
    assign _2187 = _2186 == _2175;
    assign _2180 = _2144 == _2175;
    assign _2188 = _2179 ? _2187 : _2180;
    assign _2191 = _2140 ? _2190 : _2188;
    assign _2214 = _2109 ? _2213 : _2191;
    assign _2737 = _2135 == _1272;
    assign _2738 = ~ _2737;
    assign _2734 = ~ _2109;
    assign _2732 = _2106[6:6];
    assign _2865 = _2134 | _2103;
    assign _4727 = ~ _2349;
    assign _4728 = _2347 & _4727;
    assign _4731 = _4728 ? _1271 : _1272;
    assign _4720 = ~ _2531;
    assign _4721 = _2523 & _4720;
    assign _4722 = _624 | _4721;
    assign _4723 = _4722 | _4712;
    assign _4725 = _4723 ? _1272 : _4719;
    assign _4706 = g_run_0 + _1691;
    assign _4703 = g_run_0 + _1691;
    assign _4699 = vdd == g_last_0;
    assign _4697 = g_run_0 == _1072;
    assign _4698 = ~ _4697;
    assign _4700 = _4698 & _4699;
    assign _4704 = _4700 ? _4703 : _1691;
    assign _4695 = _2459 == _1272;
    assign _4707 = _4695 ? _4706 : _4704;
    assign _4708 = _4707 == _2466;
    assign _4689 = g_run_0 + _1691;
    assign _4685 = gnd == g_last_0;
    assign _4683 = g_run_0 == _1072;
    assign _4684 = ~ _4683;
    assign _4686 = _4684 & _4685;
    assign _4690 = _4686 ? _4689 : _1691;
    assign _4681 = _2459 == _1272;
    assign _4692 = _4681 ? _1072 : _4690;
    assign _4693 = _4692 == _2466;
    assign _4709 = _2801 ? _4708 : _4693;
    assign _4710 = _2462 & _4709;
    assign _4711 = ~ _4710;
    assign _4677 = g_left_0 == _3193;
    assign _4675 = g_left_0 == _1199;
    assign _4678 = _3177 ? _4677 : _4675;
    assign _4670 = g_cnt_0 + _5102;
    assign _4671 = _4670 == _2489;
    assign _4668 = g_cnt_0 == _2489;
    assign _4672 = _2491 ? _4671 : _4668;
    assign _4666 = ~ _2810;
    assign _4667 = _2455 & _4666;
    assign _4673 = _4667 & _4672;
    assign _4679 = _4673 & _4678;
    assign _4712 = _4679 & _4711;
    assign _4714 = _4712 ? _1330 : _4665;
    assign _4716 = _2810 ? _1392 : _4714;
    assign _4662 = _2531 ? _4660 : _1330;
    assign _4658 = _2374 & _2372;
    assign _4660 = _4658 ? _1272 : g_mode;
    assign _4663 = _2523 ? _4662 : _4660;
    assign _3523 = _2531 ? _3522 : _3494;
    assign _3524 = _2523 ? _3523 : _3494;
    assign _132 = _3524;
    always @(posedge _274) begin
        if (_272)
            _3494 <= _1064;
        else
            _3494 <= _132;
    end
    assign _4525 = ~ _3522;
    assign _4523 = ~ f_lane1_out;
    assign _4524 = _3522 ? f_lane1_out : _4523;
    always @* begin
        case (_2375)
        0:
            _4526 <= _3522;
        1:
            _4526 <= _4524;
        2:
            _4526 <= _4525;
        default:
            _4526 <= _3522;
        endcase
    end
    assign _2466 = _2458[4:2];
    assign _4495 = g_run_0 + _1691;
    assign _4496 = _2801 ? _4495 : _1072;
    assign _4491 = g_run_0 + _1691;
    assign _4487 = _2801 == g_last_0;
    assign _4485 = g_run_0 == _1072;
    assign _4486 = ~ _4485;
    assign _4488 = _4486 & _4487;
    assign _4492 = _4488 ? _4491 : _1691;
    assign _4483 = _2459 == _1272;
    assign _4497 = _4483 ? _4496 : _4492;
    assign _4498 = _2810 ? _4481 : _4497;
    assign _4477 = g_run_0 + _1691;
    assign _4478 = _3522 ? _4477 : _1072;
    assign _4473 = g_run_0 + _1691;
    assign _3519 = _3511[7:7];
    assign _3518 = _3511[6:6];
    assign _3517 = _3511[5:5];
    assign _3516 = _3511[4:4];
    assign _3515 = _3511[3:3];
    assign _3514 = _3511[2:2];
    assign _3513 = _3511[1:1];
    assign _3509 = _3501[7:7];
    assign _3508 = _3501[6:6];
    assign _3507 = _3501[5:5];
    assign _3506 = _3501[4:4];
    assign _3505 = _3501[3:3];
    assign _3504 = _3501[2:2];
    assign _3503 = _3501[1:1];
    assign _3438 = _3394 == _1727;
    assign _3439 = _3391 & _3438;
    always @(posedge _274) begin
        if (_272)
            _3440 <= _1280;
        else
            if (_3439)
                _3440 <= _3384;
    end
    assign _3432 = _3394 == _1721;
    assign _3433 = _3391 & _3432;
    always @(posedge _274) begin
        if (_272)
            _3434 <= _1280;
        else
            if (_3433)
                _3434 <= _3384;
    end
    assign _3426 = _3394 == _1715;
    assign _3427 = _3391 & _3426;
    always @(posedge _274) begin
        if (_272)
            _3428 <= _1280;
        else
            if (_3427)
                _3428 <= _3384;
    end
    assign _3420 = _3394 == _1357;
    assign _3421 = _3391 & _3420;
    always @(posedge _274) begin
        if (_272)
            _3422 <= _1280;
        else
            if (_3421)
                _3422 <= _3384;
    end
    assign _3414 = _3394 == _1703;
    assign _3415 = _3391 & _3414;
    always @(posedge _274) begin
        if (_272)
            _3416 <= _1280;
        else
            if (_3415)
                _3416 <= _3384;
    end
    assign _3408 = _3394 == _1697;
    assign _3409 = _3391 & _3408;
    always @(posedge _274) begin
        if (_272)
            _3410 <= _1280;
        else
            if (_3409)
                _3410 <= _3384;
    end
    assign _3402 = _3394 == _1691;
    assign _3403 = _3391 & _3402;
    always @(posedge _274) begin
        if (_272)
            _3404 <= _1280;
        else
            if (_3403)
                _3404 <= _3384;
    end
    assign _3526 = _3394 + _1691;
    assign _3527 = _3391 ? _3526 : _3394;
    assign _133 = _3527;
    always @(posedge _274) begin
        if (_272)
            _3394 <= _1072;
        else
            _3394 <= _133;
    end
    assign _3396 = _3394 == _1072;
    assign _3397 = _3391 & _3396;
    assign _3591 = _2264 ? _3590 : g_byte;
    assign _3592 = _2270 ? _3590 : _3591;
    assign _3542 = _3541 ? _3539 : _3532;
    assign _3540 = _3529 ? _3539 : _3532;
    assign _3543 = _2550 ? _3542 : _3540;
    assign _134 = _3543;
    always @(posedge _274) begin
        if (_272)
            _3532 <= _1280;
        else
            _3532 <= _134;
    end
    assign _3538 = _2504 ? _3537 : g_byte_0;
    assign _3539 = _2510 ? _3537 : _3538;
    assign _3584 = _2341 ? _3532 : _3539;
    assign _3551 = _3550 ? _590 : _3548;
    assign _3549 = _3545 ? _590 : _3548;
    assign _3552 = _2601 ? _3551 : _3549;
    assign _135 = _3552;
    always @(posedge _274) begin
        if (_272)
            _3548 <= _1280;
        else
            _3548 <= _135;
    end
    assign _3569 = _590[6:0];
    assign _3570 = { _3569,
                     _3566 };
    assign _3567 = _590[7:1];
    assign _3565 = _304[7:7];
    assign _3564 = _304[6:6];
    assign _3563 = _304[5:5];
    assign _3562 = _304[4:4];
    assign _3561 = _304[3:3];
    assign _3560 = _304[2:2];
    assign _3559 = _304[1:1];
    assign _3558 = _304[0:0];
    assign _3556 = _709[102:100];
    assign _3555 = _703[102:100];
    assign _3554 = _697[102:100];
    assign _3553 = _297[102:100];
    always @* begin
        case (f_winner)
        0:
            _3557 <= _3553;
        1:
            _3557 <= _3554;
        2:
            _3557 <= _3555;
        default:
            _3557 <= _3556;
        endcase
    end
    always @* begin
        case (_3557)
        0:
            _3566 <= _3558;
        1:
            _3566 <= _3559;
        2:
            _3566 <= _3560;
        3:
            _3566 <= _3561;
        4:
            _3566 <= _3562;
        5:
            _3566 <= _3563;
        6:
            _3566 <= _3564;
        default:
            _3566 <= _3565;
        endcase
    end
    assign _3568 = { _3566,
                     _3567 };
    always @* begin
        case (_2591)
        0:
            _3571 <= _590;
        1:
            _3571 <= _3568;
        2:
            _3571 <= _3570;
        default:
            _3571 <= _590;
        endcase
    end
    assign _3572 = _1391 ? _3571 : _590;
    assign _136 = _3572;
    always @(posedge _274) begin
        if (_272)
            _590 <= _1280;
        else
            _590 <= _136;
    end
    assign _3550 = _2584 & _2594;
    assign _3576 = _3550 ? _2584 : _1064;
    assign _3544 = ~ _2584;
    assign _3545 = _3544 & _2594;
    assign _3574 = _3545 ? _2701 : _2584;
    assign _2588 = _709[97:96];
    assign _2587 = _703[97:96];
    assign _2586 = _697[97:96];
    assign _2585 = _297[97:96];
    always @* begin
        case (f_winner)
        0:
            _2589 <= _2585;
        1:
            _2589 <= _2586;
        2:
            _2589 <= _2587;
        default:
            _2589 <= _2588;
        endcase
    end
    assign _2591 = _1390 ? _1392 : _2589;
    assign f_eng_push = _2591 == _1330;
    assign _2594 = _1391 & f_eng_push;
    assign _2600 = _2584 | _2594;
    assign _2597 = _2341 | _2546;
    assign _2598 = ~ _2597;
    assign _2596 = ~ _2306;
    assign _2599 = _2596 & _2598;
    assign _2601 = _2599 & _2600;
    assign _3577 = _2601 ? _3576 : _3574;
    assign _137 = _3577;
    always @(posedge _274) begin
        if (_272)
            _2584 <= _1064;
        else
            _2584 <= _137;
    end
    assign _3583 = _2584 ? _3548 : _590;
    assign _3541 = _2341 & _2546;
    assign _3581 = _3541 ? _2341 : _1064;
    assign _2544 = ~ _2510;
    assign _2538 = g_bitpos_0 + _1691;
    assign _2533 = ~ _2468;
    assign g_tx_bit_0 = _2523 & _2531;
    assign _2534 = g_tx_bit_0 & _2533;
    assign _2535 = _2534 & g_data_left_0;
    assign _2536 = _2504 | _2535;
    assign _2539 = _2536 ? _2538 : g_bitpos_0;
    assign _2541 = _2539 == _1072;
    assign _2542 = ~ _2541;
    assign _2513 = _2512 & _2347;
    assign _2543 = _2513 & _2542;
    assign _2545 = _2543 & _2544;
    assign _2509 = g_bitpos_0 == _1727;
    assign _2510 = _2504 & _2509;
    assign _2546 = _2510 | _2545;
    assign _3528 = ~ _2341;
    assign _3529 = _3528 & _2546;
    assign _3579 = _3529 ? _2701 : _2341;
    assign _3582 = _2550 ? _3581 : _3579;
    assign _138 = _3582;
    always @(posedge _274) begin
        if (_272)
            _2341 <= _1064;
        else
            _2341 <= _138;
    end
    assign _2549 = _2341 | _2546;
    assign _2548 = ~ _2306;
    assign _2550 = _2548 & _2549;
    assign _3585 = _2550 ? _3584 : _3583;
    assign _3593 = _2306 ? _3592 : _3585;
    assign _139 = _3593;
    assign _140 = _139;
    assign _3366 = _1242 == _1357;
    assign _3367 = _1241 & _3366;
    assign _3594 = _3367 ? _1258 : _3383;
    assign _141 = _3594;
    always @(posedge _274) begin
        if (_272)
            _3383 <= _1280;
        else
            _3383 <= _141;
    end
    assign _3384 = _220 ? _140 : _3383;
    always @(posedge _274) begin
        if (_272)
            _3398 <= _1280;
        else
            if (_3397)
                _3398 <= _3384;
    end
    assign _4110 = _3380 + _1691;
    assign _4107 = ~ _593;
    assign _2694 = ~ _593;
    assign _2693 = _2523 & _2692;
    assign _2695 = _2693 & _2694;
    assign _2686 = ~ _593;
    assign _2683 = g_bitpos == _1072;
    assign _2226 = _2218[4:2];
    assign _3978 = g_run + _1691;
    assign _3979 = _2756 ? _3978 : _1072;
    assign _3974 = g_run + _1691;
    assign _3970 = _2756 == g_last;
    assign _3968 = g_run == _1072;
    assign _3969 = ~ _3968;
    assign _3971 = _3969 & _3970;
    assign _3975 = _3971 ? _3974 : _1691;
    assign _3966 = _2219 == _1272;
    assign _3980 = _3966 ? _3979 : _3975;
    assign _3981 = _2765 ? _3964 : _3980;
    assign _3960 = g_run + _1691;
    assign _3961 = _3465 ? _3960 : _1072;
    assign _3956 = g_run + _1691;
    assign _3952 = _3465 == g_last;
    assign _3950 = g_run == _1072;
    assign _3951 = ~ _3950;
    assign _3953 = _3951 & _3952;
    assign _3957 = _3953 ? _3956 : _1691;
    assign _3948 = _2219 == _1272;
    assign _3962 = _3948 ? _3961 : _3957;
    assign _3614 = _3613 ? _3611 : g_lim;
    assign _3615 = g_len_cap ? _3614 : g_lim;
    assign _142 = _3615;
    always @(posedge _274) begin
        if (_272)
            g_lim <= _1280;
        else
            g_lim <= _142;
    end
    assign _2248 = { _1280,
                     g_lim };
    assign _3623 = _215[0:0];
    assign _3624 = ~ _3623;
    assign _3620 = 5'b10100;
    assign _3619 = _1328[4:0];
    assign _3621 = _3619 == _3620;
    assign _3616 = _1328[5:5];
    assign _3618 = _3616 == _1064;
    assign _3622 = _3618 & _3621;
    assign _3625 = _3622 & _3624;
    assign _3626 = _3625 ? _1258 : _2242;
    assign _3627 = _2913 ? _3626 : _2242;
    assign _143 = _3627;
    always @(posedge _274) begin
        if (_272)
            _2242 <= _1280;
        else
            _2242 <= _143;
    end
    assign _3635 = _215[0:0];
    assign _3636 = ~ _3635;
    assign _3632 = 5'b10101;
    assign _3631 = _1328[4:0];
    assign _3633 = _3631 == _3632;
    assign _3628 = _1328[5:5];
    assign _3630 = _3628 == _1064;
    assign _3634 = _3630 & _3633;
    assign _3637 = _3634 & _3636;
    assign _3638 = _3637 ? _1258 : _2239;
    assign _3639 = _2913 ? _3638 : _2239;
    assign _144 = _3639;
    always @(posedge _274) begin
        if (_272)
            _2239 <= _1280;
        else
            _2239 <= _144;
    end
    assign _2243 = { _2239,
                     _2242 };
    assign _3277 = g_sr[14:0];
    assign _3278 = { _3277,
                     _2756 };
    assign _3640 = _2229 ? _3278 : g_sr;
    assign _3641 = _2765 ? g_sr : _3640;
    assign _3642 = _2215 ? _3641 : g_sr;
    assign _3644 = _2729 ? _1171 : _3642;
    assign _145 = _3644;
    always @(posedge _274) begin
        if (_272)
            g_sr <= _1171;
        else
            g_sr <= _145;
    end
    assign _3606 = g_sr[3:0];
    assign _3652 = _215[0:0];
    assign _3653 = ~ _3652;
    assign _3649 = 5'b10111;
    assign _3648 = _1328[4:0];
    assign _3650 = _3648 == _3649;
    assign _3645 = _1328[5:5];
    assign _3647 = _3645 == _1064;
    assign _3651 = _3647 & _3650;
    assign _3654 = _3651 & _3653;
    assign _3655 = _3654 ? _1258 : _3604;
    assign _3656 = _2913 ? _3655 : _3604;
    assign _146 = _3656;
    always @(posedge _274) begin
        if (_272)
            _3604 <= _1280;
        else
            _3604 <= _146;
    end
    assign _3605 = _3604[3:0];
    assign _3607 = _3605 < _3606;
    assign _3608 = _3607 ? _3605 : _3606;
    assign _3610 = { _1064,
                     _3608,
                     _1072 };
    assign _2260 = _2259[5:0];
    assign _3600 = { _1392,
                     _2260 };
    assign _3611 = _3600 + _3610;
    assign _3612 = { _1280,
                     _3611 };
    assign _3613 = _3612 < _2243;
    assign _3704 = _3613 ? _2701 : g_len_known;
    assign _3667 = _215[0:0];
    assign _3668 = ~ _3667;
    assign _3664 = 5'b10110;
    assign _3663 = _1328[4:0];
    assign _3665 = _3663 == _3664;
    assign _3660 = _1328[5:5];
    assign _3662 = _3660 == _1064;
    assign _3666 = _3662 & _3665;
    assign _3669 = _3666 & _3668;
    assign _3670 = _3669 ? _1258 : _3659;
    assign _3671 = _2913 ? _3670 : _3659;
    assign _147 = _3671;
    always @(posedge _274) begin
        if (_272)
            _3659 <= _1280;
        else
            _3659 <= _147;
    end
    assign _3690 = _3659[5:0];
    assign _3689 = g_cnt[5:0];
    assign _3691 = _3689 == _3690;
    assign _3685 = g_cnt[15:6];
    assign _3687 = _3685 == _1076;
    assign _3679 = _215[0:0];
    assign _3680 = ~ _3679;
    assign _3676 = 5'b00111;
    assign _3675 = _1328[4:0];
    assign _3677 = _3675 == _3676;
    assign _3672 = _1328[5:5];
    assign _3674 = _3672 == _1064;
    assign _3678 = _3674 & _3677;
    assign _3681 = _3678 & _3680;
    assign _3682 = _3681 ? _1258 : _2259;
    assign _3683 = _2913 ? _3682 : _2259;
    assign _148 = _3683;
    always @(posedge _274) begin
        if (_272)
            _2259 <= _1280;
        else
            _2259 <= _148;
    end
    assign _3684 = _2259[7:7];
    assign _3688 = _3684 & _3687;
    assign _3692 = _3688 & _3691;
    assign _3694 = _3692 ? _2701 : g_len_cap;
    assign _3695 = _2251 ? _3694 : g_len_cap;
    assign _3696 = _2229 ? _3695 : g_len_cap;
    assign _3697 = _2765 ? g_len_cap : _3696;
    assign _3698 = _2215 ? _3697 : g_len_cap;
    assign _3700 = g_len_cap ? _1064 : _3698;
    assign _3702 = _2729 ? _1064 : _3700;
    assign _149 = _3702;
    always @(posedge _274) begin
        if (_272)
            g_len_cap <= _1064;
        else
            g_len_cap <= _149;
    end
    assign _3705 = g_len_cap ? _3704 : g_len_known;
    assign _3707 = _2729 ? _1064 : _3705;
    assign _150 = _3707;
    always @(posedge _274) begin
        if (_272)
            g_len_known <= _1064;
        else
            g_len_known <= _150;
    end
    assign _2249 = g_len_known ? _2248 : _2243;
    assign _3940 = g_cnt + _5102;
    assign _3941 = _2251 ? _3940 : _3938;
    assign _3942 = _2229 ? _3941 : _3938;
    assign _3923 = _2765 ? _3922 : _2756;
    assign _3462 = _3454[7:7];
    assign _3461 = _3454[6:6];
    assign _3460 = _3454[5:5];
    assign _3459 = _3454[4:4];
    assign _3458 = _3454[3:3];
    assign _3457 = _3454[2:2];
    assign _3456 = _3454[1:1];
    assign _3452 = _3444[7:7];
    assign _3451 = _3444[6:6];
    assign _3450 = _3444[5:5];
    assign _3449 = _3444[4:4];
    assign _3448 = _3444[3:3];
    assign _3447 = _3444[2:2];
    assign _3446 = _3444[1:1];
    assign _3443 = _593 ? _1278 : _3441;
    assign _3588 = g_byte[7:1];
    assign _3589 = { _2756,
                     _3588 };
    assign _3586 = g_byte[6:0];
    assign _3587 = { _3586,
                     _2756 };
    assign _3590 = _3374 ? _3589 : _3587;
    assign _3712 = _2264 ? _3590 : _3711;
    assign _3713 = _2251 ? _3712 : _3711;
    assign _3714 = _2229 ? _3713 : _3711;
    assign _3715 = _2765 ? _3711 : _3714;
    assign _3708 = g_data_left ? _3444 : g_byte;
    assign _3709 = _2228 ? g_byte : _3708;
    assign _3710 = _2291 ? _3709 : g_byte;
    assign _3711 = _2283 ? _3710 : g_byte;
    assign _3716 = _2215 ? _3715 : _3711;
    assign _151 = _3716;
    always @(posedge _274) begin
        if (_272)
            g_byte <= _1280;
        else
            g_byte <= _151;
    end
    assign _3444 = _2684 ? _3443 : g_byte;
    assign _3445 = _3444[0:0];
    assign _3453 = { _3445,
                     _3446,
                     _3447,
                     _3448,
                     _3449,
                     _3450,
                     _3451,
                     _3452 };
    assign _3374 = _2106[5:5];
    assign _3454 = _3374 ? _3444 : _3453;
    assign _3455 = _3454[0:0];
    assign _3724 = g_bitpos + _1691;
    assign _3725 = _2264 ? _3724 : _3722;
    assign _3726 = _2251 ? _3725 : _3722;
    assign _3727 = _2229 ? _3726 : _3722;
    assign _3728 = _2765 ? _3722 : _3727;
    assign _3718 = g_bitpos + _1691;
    assign _3719 = g_data_left ? _3718 : g_bitpos;
    assign _3720 = _2228 ? g_bitpos : _3719;
    assign _3721 = _2291 ? _3720 : g_bitpos;
    assign _3722 = _2283 ? _3721 : g_bitpos;
    assign _3729 = _2215 ? _3728 : _3722;
    assign _3731 = _2729 ? _1072 : _3729;
    assign _152 = _3731;
    always @(posedge _274) begin
        if (_272)
            g_bitpos <= _1072;
        else
            g_bitpos <= _152;
    end
    always @* begin
        case (g_bitpos)
        0:
            _3463 <= _3455;
        1:
            _3463 <= _3456;
        2:
            _3463 <= _3457;
        3:
            _3463 <= _3458;
        4:
            _3463 <= _3459;
        5:
            _3463 <= _3460;
        6:
            _3463 <= _3461;
        default:
            _3463 <= _3462;
        endcase
    end
    assign _3305 = _2106[7:7];
    assign _3742 = _215[0:0];
    assign _3743 = ~ _3742;
    assign _3739 = 5'b01100;
    assign _3738 = _1328[4:0];
    assign _3740 = _3738 == _3739;
    assign _3735 = _1328[5:5];
    assign _3737 = _3735 == _1064;
    assign _3741 = _3737 & _3740;
    assign _3744 = _3741 & _3743;
    assign _3745 = _3744 ? _1258 : _3734;
    assign _3746 = _2913 ? _3745 : _3734;
    assign _153 = _3746;
    always @(posedge _274) begin
        if (_272)
            _3734 <= _1280;
        else
            _3734 <= _153;
    end
    assign _3757 = _215[0:0];
    assign _3758 = ~ _3757;
    assign _3754 = 5'b01101;
    assign _3753 = _1328[4:0];
    assign _3755 = _3753 == _3754;
    assign _3750 = _1328[5:5];
    assign _3752 = _3750 == _1064;
    assign _3756 = _3752 & _3755;
    assign _3759 = _3756 & _3758;
    assign _3760 = _3759 ? _1258 : _3749;
    assign _3761 = _2913 ? _3760 : _3749;
    assign _154 = _3761;
    always @(posedge _274) begin
        if (_272)
            _3749 <= _1280;
        else
            _3749 <= _154;
    end
    assign _3772 = _215[0:0];
    assign _3773 = ~ _3772;
    assign _3769 = 5'b01110;
    assign _3768 = _1328[4:0];
    assign _3770 = _3768 == _3769;
    assign _3765 = _1328[5:5];
    assign _3767 = _3765 == _1064;
    assign _3771 = _3767 & _3770;
    assign _3774 = _3771 & _3773;
    assign _3775 = _3774 ? _1258 : _3764;
    assign _3776 = _2913 ? _3775 : _3764;
    assign _155 = _3776;
    always @(posedge _274) begin
        if (_272)
            _3764 <= _1280;
        else
            _3764 <= _155;
    end
    assign _3787 = _215[0:0];
    assign _3788 = ~ _3787;
    assign _3784 = 5'b01111;
    assign _3783 = _1328[4:0];
    assign _3785 = _3783 == _3784;
    assign _3780 = _1328[5:5];
    assign _3782 = _3780 == _1064;
    assign _3786 = _3782 & _3785;
    assign _3789 = _3786 & _3788;
    assign _3790 = _3789 ? _1258 : _3779;
    assign _3791 = _2913 ? _3790 : _3779;
    assign _156 = _3791;
    always @(posedge _274) begin
        if (_272)
            _3779 <= _1280;
        else
            _3779 <= _156;
    end
    assign _3917 = { _3779,
                     _3764,
                     _3749,
                     _3734 };
    assign _3910 = g_crc[30:0];
    assign _3912 = { _3910,
                     _1064 };
    assign _3904 = g_crc[31:31];
    assign _3905 = _2756 ^ _3904;
    assign _3907 = _3905 ? _3894 : _1247;
    assign _3901 = g_crc[30:0];
    assign _3903 = { _3901,
                     _1064 };
    assign _3908 = _3903 ^ _3907;
    assign _3909 = _2251 ? _3908 : _3900;
    assign _3802 = _215[0:0];
    assign _3803 = ~ _3802;
    assign _3799 = 5'b00110;
    assign _3798 = _1328[4:0];
    assign _3800 = _3798 == _3799;
    assign _3795 = _1328[5:5];
    assign _3797 = _3795 == _1064;
    assign _3801 = _3797 & _3800;
    assign _3804 = _3801 & _3803;
    assign _3805 = _3804 ? _1258 : _3794;
    assign _3806 = _2913 ? _3805 : _3794;
    assign _157 = _3806;
    always @(posedge _274) begin
        if (_272)
            _3794 <= _1280;
        else
            _3794 <= _157;
    end
    assign _3821 = _3794[5:0];
    assign _3816 = g_left - _3193;
    assign _3817 = _3300 ? _3816 : _3814;
    assign _3818 = _2229 ? _3817 : _3814;
    assign _3819 = _2765 ? _3814 : _3818;
    assign _3810 = g_left - _3193;
    assign _3811 = g_data_left ? g_left : _3810;
    assign _3812 = _2228 ? g_left : _3811;
    assign _3813 = _2291 ? _3812 : g_left;
    assign _3814 = _2283 ? _3813 : g_left;
    assign _3820 = _2215 ? _3819 : _3814;
    assign _3822 = _3808 ? _3821 : _3820;
    assign _3824 = _2729 ? _1199 : _3822;
    assign _158 = _3824;
    always @(posedge _274) begin
        if (_272)
            g_left <= _1199;
        else
            g_left <= _158;
    end
    assign _2289 = g_left == _1199;
    assign _2290 = ~ _2289;
    assign _3298 = ~ g_data_left;
    assign _3297 = _2215 & _2229;
    assign _3299 = _3297 & _3298;
    assign _3300 = _3299 & _2290;
    assign _3913 = _3300 ? _3912 : _3909;
    assign _2229 = ~ _2228;
    assign _3914 = _2229 ? _3913 : _3900;
    assign _3915 = _2765 ? _3900 : _3914;
    assign _3835 = _215[0:0];
    assign _3836 = ~ _3835;
    assign _3832 = 5'b01000;
    assign _3831 = _1328[4:0];
    assign _3833 = _3831 == _3832;
    assign _3828 = _1328[5:5];
    assign _3830 = _3828 == _1064;
    assign _3834 = _3830 & _3833;
    assign _3837 = _3834 & _3836;
    assign _3838 = _3837 ? _1258 : _3827;
    assign _3839 = _2913 ? _3838 : _3827;
    assign _159 = _3839;
    always @(posedge _274) begin
        if (_272)
            _3827 <= _1280;
        else
            _3827 <= _159;
    end
    assign _3850 = _215[0:0];
    assign _3851 = ~ _3850;
    assign _3847 = 5'b01001;
    assign _3846 = _1328[4:0];
    assign _3848 = _3846 == _3847;
    assign _3843 = _1328[5:5];
    assign _3845 = _3843 == _1064;
    assign _3849 = _3845 & _3848;
    assign _3852 = _3849 & _3851;
    assign _3853 = _3852 ? _1258 : _3842;
    assign _3854 = _2913 ? _3853 : _3842;
    assign _160 = _3854;
    always @(posedge _274) begin
        if (_272)
            _3842 <= _1280;
        else
            _3842 <= _160;
    end
    assign _3865 = _215[0:0];
    assign _3866 = ~ _3865;
    assign _3862 = 5'b01010;
    assign _3861 = _1328[4:0];
    assign _3863 = _3861 == _3862;
    assign _3858 = _1328[5:5];
    assign _3860 = _3858 == _1064;
    assign _3864 = _3860 & _3863;
    assign _3867 = _3864 & _3866;
    assign _3868 = _3867 ? _1258 : _3857;
    assign _3869 = _2913 ? _3868 : _3857;
    assign _161 = _3869;
    always @(posedge _274) begin
        if (_272)
            _3857 <= _1280;
        else
            _3857 <= _161;
    end
    assign _3880 = _215[0:0];
    assign _3881 = ~ _3880;
    assign _3877 = 5'b01011;
    assign _3876 = _1328[4:0];
    assign _3878 = _3876 == _3877;
    assign _3873 = _1328[5:5];
    assign _3875 = _3873 == _1064;
    assign _3879 = _3875 & _3878;
    assign _3882 = _3879 & _3881;
    assign _3883 = _3882 ? _1258 : _3872;
    assign _3884 = _2913 ? _3883 : _3872;
    assign _162 = _3884;
    always @(posedge _274) begin
        if (_272)
            _3872 <= _1280;
        else
            _3872 <= _162;
    end
    assign _3894 = { _3872,
                     _3857,
                     _3842,
                     _3827 };
    assign _3891 = g_crc[31:31];
    assign _3892 = _3465 ^ _3891;
    assign _3895 = _3892 ? _3894 : _1247;
    assign _3888 = g_crc[30:0];
    assign _3890 = { _3888,
                     _1064 };
    assign _3896 = _3890 ^ _3895;
    assign _3885 = g_crc[30:0];
    assign _3887 = { _3885,
                     _1064 };
    assign _3897 = g_data_left ? _3896 : _3887;
    assign _3898 = _2228 ? g_crc : _3897;
    assign _3899 = _2291 ? _3898 : g_crc;
    assign _3900 = _2283 ? _3899 : g_crc;
    assign _3916 = _2215 ? _3915 : _3900;
    assign _3918 = _2729 ? _3917 : _3916;
    assign _3920 = _2314 ? _1247 : _3918;
    assign _163 = _3920;
    always @(posedge _274) begin
        if (_272)
            g_crc <= _1247;
        else
            g_crc <= _163;
    end
    assign _3304 = g_crc[31:31];
    assign _3306 = _3304 ^ _3305;
    assign _3464 = g_data_left ? _3463 : _3306;
    assign _3465 = _2228 ? _2762 : _3464;
    assign _3921 = _2291 ? _3465 : g_last;
    assign _3922 = _2283 ? _3921 : g_last;
    assign _3924 = _2215 ? _3923 : _3922;
    assign _3926 = _2729 ? _2701 : _3924;
    assign _164 = _3926;
    always @(posedge _274) begin
        if (_272)
            g_last <= vdd;
        else
            g_last <= _164;
    end
    assign _2761 = ~ g_last;
    assign _2758 = _2219 == _1271;
    assign _2762 = _2758 ? _2761 : gnd;
    assign _3928 = _2135 == _1271;
    assign _3929 = _3928 ? _2125 : g_prev;
    assign _3930 = _2215 ? _3929 : g_prev;
    assign _3932 = _2729 ? _2701 : _3930;
    assign _165 = _3932;
    always @(posedge _274) begin
        if (_272)
            g_prev <= vdd;
        else
            g_prev <= _165;
    end
    assign _2755 = _2125 == g_prev;
    assign _2752 = _2135 == _1271;
    assign _2756 = _2752 ? _2755 : _2125;
    assign _2763 = _2756 == _2762;
    assign _2764 = ~ _2763;
    assign _2765 = _2228 & _2764;
    assign _3943 = _2765 ? _3938 : _3942;
    assign _3934 = g_cnt + _5102;
    assign _3935 = g_data_left ? _3934 : g_cnt;
    assign _3936 = _2228 ? g_cnt : _3935;
    assign _3937 = _2291 ? _3936 : g_cnt;
    assign _3938 = _2283 ? _3937 : g_cnt;
    assign _3944 = _2215 ? _3943 : _3938;
    assign _3946 = _2729 ? _1171 : _3944;
    assign _166 = _3946;
    always @(posedge _274) begin
        if (_272)
            g_cnt <= _1171;
        else
            g_cnt <= _166;
    end
    assign g_data_left = g_cnt < _2249;
    assign _2284 = _2228 | g_data_left;
    assign _2291 = _2284 | _2290;
    assign _3963 = _2291 ? _3962 : g_run;
    assign _3964 = _2283 ? _3963 : g_run;
    assign _3982 = _2215 ? _3981 : _3964;
    assign _3984 = _2729 ? _1072 : _3982;
    assign _167 = _3984;
    always @(posedge _274) begin
        if (_272)
            g_run <= _1072;
        else
            g_run <= _167;
    end
    assign _2227 = g_run == _2226;
    assign _3992 = _215[0:0];
    assign _3993 = ~ _3992;
    assign _3989 = 5'b00101;
    assign _3988 = _1328[4:0];
    assign _3990 = _3988 == _3989;
    assign _3985 = _1328[5:5];
    assign _3987 = _3985 == _1064;
    assign _3991 = _3987 & _3990;
    assign _3994 = _3991 & _3993;
    assign _3995 = _3994 ? _1258 : _2218;
    assign _3996 = _2913 ? _3995 : _2218;
    assign _168 = _3996;
    always @(posedge _274) begin
        if (_272)
            _2218 <= _1280;
        else
            _2218 <= _168;
    end
    assign _2219 = _2218[1:0];
    assign _2221 = _2219 == _1392;
    assign _2222 = ~ _2221;
    assign _2228 = _2222 & _2227;
    assign _2680 = ~ _2228;
    assign _2681 = _2680 & g_data_left;
    assign _2684 = _2681 & _2683;
    assign _2211 = ~ _2205;
    assign _2212 = _2208 & _2211;
    always @(posedge _274) begin
        if (_272)
            _2208 <= _1064;
        else
            _2208 <= _2205;
    end
    assign _2209 = ~ _2208;
    assign _2201 = _301[7:7];
    assign _2200 = _301[6:6];
    assign _2199 = _301[5:5];
    assign _2198 = _301[4:4];
    assign _2197 = _301[3:3];
    assign _2196 = _301[2:2];
    assign _2195 = _301[1:1];
    assign _2194 = _301[0:0];
    assign _2193 = _2112[2:0];
    always @* begin
        case (_2193)
        0:
            _2202 <= _2194;
        1:
            _2202 <= _2195;
        2:
            _2202 <= _2196;
        3:
            _2202 <= _2197;
        4:
            _2202 <= _2198;
        5:
            _2202 <= _2199;
        6:
            _2202 <= _2200;
        default:
            _2202 <= _2201;
        endcase
    end
    always @(posedge _274) begin
        if (_272)
            _2205 <= _1064;
        else
            _2205 <= _2202;
    end
    assign _2210 = _2205 & _2209;
    assign _2192 = _2106[2:2];
    assign _2213 = _2192 ? _2212 : _2210;
    assign _2279 = _2186 == _1171;
    assign _2277 = _2144 == _1171;
    assign _2178 = ~ _2134;
    assign _2169 = _2152[15:2];
    assign _2170 = { _1392,
                     _2169 };
    assign _2166 = _2152[15:1];
    assign _2167 = { _1064,
                     _2166 };
    assign _2171 = _2167 + _2170;
    assign _2163 = _2152[15:1];
    assign _2164 = { _1064,
                     _2163 };
    assign _2161 = _2107 & _2137;
    assign _2172 = _2161 ? _2171 : _2164;
    always @(posedge _274) begin
        if (_272)
            _2175 <= _1171;
        else
            _2175 <= _2172;
    end
    assign _2176 = _2144 < _2175;
    assign _2153 = _2152[15:2];
    assign _2154 = { _1392,
                     _2153 };
    always @(posedge _274) begin
        if (_272)
            _2157 <= _1171;
        else
            _2157 <= _2154;
    end
    assign _4081 = ~ _2134;
    assign _4082 = _2177 & _4081;
    assign _4083 = _4082 ? _2186 : _2144;
    assign _4085 = _2140 ? _1171 : _4083;
    assign _4087 = _4085 + _5102;
    assign _4065 = _4059 == _1131;
    assign _2182 = _2152[15:1];
    assign _2183 = { _1064,
                     _2182 };
    always @(posedge _274) begin
        if (_272)
            _2186 <= _1171;
        else
            _2186 <= _2183;
    end
    assign _4061 = { gnd,
                     _2186 };
    assign _4062 = _4061 == _4059;
    assign _4055 = { gnd,
                     _2152 };
    always @(posedge _274) begin
        if (_272)
            _4058 <= _1131;
        else
            _4058 <= _4055;
    end
    assign _4050 = 17'b00000000000000001;
    assign _4004 = _215[0:0];
    assign _4005 = ~ _4004;
    assign _4000 = _1328[4:0];
    assign _4002 = _4000 == _5452;
    assign _3997 = _1328[5:5];
    assign _3999 = _3997 == _1064;
    assign _4003 = _3999 & _4002;
    assign _4006 = _4003 & _4005;
    assign _4007 = _4006 ? _1258 : _2151;
    assign _4008 = _2913 ? _4007 : _2151;
    assign _169 = _4008;
    always @(posedge _274) begin
        if (_272)
            _2151 <= _1280;
        else
            _2151 <= _169;
    end
    assign _4016 = _215[0:0];
    assign _4017 = ~ _4016;
    assign _4013 = 5'b00001;
    assign _4012 = _1328[4:0];
    assign _4014 = _4012 == _4013;
    assign _4009 = _1328[5:5];
    assign _4011 = _4009 == _1064;
    assign _4015 = _4011 & _4014;
    assign _4018 = _4015 & _4017;
    assign _4019 = _4018 ? _1258 : _2148;
    assign _4020 = _2913 ? _4019 : _2148;
    assign _170 = _4020;
    always @(posedge _274) begin
        if (_272)
            _2148 <= _1280;
        else
            _2148 <= _170;
    end
    assign _2152 = { _2148,
                     _2151 };
    assign _4049 = { gnd,
                     _2152 };
    assign _4051 = _4049 - _4050;
    always @(posedge _274) begin
        if (_272)
            _4054 <= _1131;
        else
            _4054 <= _4051;
    end
    assign _4031 = _215[0:0];
    assign _4032 = ~ _4031;
    assign _4028 = 5'b00010;
    assign _4027 = _1328[4:0];
    assign _4029 = _4027 == _4028;
    assign _4024 = _1328[5:5];
    assign _4026 = _4024 == _1064;
    assign _4030 = _4026 & _4029;
    assign _4033 = _4030 & _4032;
    assign _4034 = _4033 ? _1258 : _4023;
    assign _4035 = _2913 ? _4034 : _4023;
    assign _171 = _4035;
    always @(posedge _274) begin
        if (_272)
            _4023 <= _1280;
        else
            _4023 <= _171;
    end
    assign _4069 = { gnd,
                     _4023 };
    assign _4071 = _4070[7:0];
    assign _4072 = _4067 ? _4071 : _4043;
    assign _4073 = _4040 ? _4072 : _4043;
    assign _4075 = _2729 ? _1280 : _4073;
    assign _172 = _4075;
    always @(posedge _274) begin
        if (_272)
            _4043 <= _1280;
        else
            _4043 <= _172;
    end
    assign _4068 = { gnd,
                     _4043 };
    assign _4070 = _4068 + _4069;
    assign _4076 = _4070[8:8];
    assign _4077 = _4067 ? _4076 : _4048;
    assign _4078 = _4040 ? _4077 : _4048;
    assign _4080 = _2729 ? _1064 : _4078;
    assign _173 = _4080;
    always @(posedge _274) begin
        if (_272)
            _4048 <= _1064;
        else
            _4048 <= _173;
    end
    assign _4059 = _4048 ? _4058 : _4054;
    assign _4045 = { gnd,
                     _2144 };
    assign _4060 = _4045 == _4059;
    assign _4063 = _2179 ? _4062 : _4060;
    assign _4066 = _2140 ? _4065 : _4063;
    assign _4044 = ~ _2109;
    assign _4067 = _4044 & _4066;
    assign _4089 = _4067 ? _1171 : _4087;
    assign _4039 = ~ _2109;
    assign _4037 = _2134 & _2132;
    assign _610 = g_mode_0 == _1330;
    assign _4036 = _2103 | _610;
    assign _4038 = _4036 | _4037;
    assign _4040 = _4038 & _4039;
    assign _4090 = _4040 ? _4089 : _2144;
    assign _4092 = _2729 ? _1171 : _4090;
    assign _174 = _4092;
    always @(posedge _274) begin
        if (_272)
            _2144 <= _1171;
        else
            _2144 <= _174;
    end
    assign _2158 = _2144 < _2157;
    assign _2159 = ~ _2158;
    assign _2141 = _2132 & _2137;
    assign _2160 = _2141 & _2159;
    assign _2177 = _2160 & _2176;
    assign _2179 = _2177 & _2178;
    assign _2280 = _2179 ? _2279 : _2277;
    assign _2135 = _2106[4:3];
    assign _2137 = _2135 == _1272;
    assign _2138 = ~ _2137;
    assign _2134 = g_mode_0 == _1271;
    assign _2139 = _2134 | _2138;
    assign _2131 = ~ _2109;
    always @(posedge _274) begin
        if (_272)
            _2128 <= _1064;
        else
            _2128 <= _2125;
    end
    assign _2121 = _301[7:7];
    assign _2120 = _301[6:6];
    assign _2119 = _301[5:5];
    assign _2118 = _301[4:4];
    assign _2117 = _301[3:3];
    assign _2116 = _301[2:2];
    assign _2115 = _301[1:1];
    assign _2114 = _301[0:0];
    assign _4100 = _215[0:0];
    assign _4101 = ~ _4100;
    assign _4097 = 5'b00100;
    assign _4096 = _1328[4:0];
    assign _4098 = _4096 == _4097;
    assign _4093 = _1328[5:5];
    assign _4095 = _4093 == _1064;
    assign _4099 = _4095 & _4098;
    assign _4102 = _4099 & _4101;
    assign _4103 = _4102 ? _1258 : _2112;
    assign _4104 = _2913 ? _4103 : _2112;
    assign _175 = _4104;
    always @(posedge _274) begin
        if (_272)
            _2112 <= _1280;
        else
            _2112 <= _175;
    end
    assign _2113 = _2112[5:3];
    always @* begin
        case (_2113)
        0:
            _2122 <= _2114;
        1:
            _2122 <= _2115;
        2:
            _2122 <= _2116;
        3:
            _2122 <= _2117;
        4:
            _2122 <= _2118;
        5:
            _2122 <= _2119;
        6:
            _2122 <= _2120;
        default:
            _2122 <= _2121;
        endcase
    end
    always @(posedge _274) begin
        if (_272)
            _2125 <= _1064;
        else
            _2125 <= _2122;
    end
    assign _2129 = _2125 ^ _2128;
    assign _2130 = _2107 & _2129;
    assign _2132 = _2130 & _2131;
    assign _2140 = _2132 & _2139;
    assign _2281 = _2140 ? vdd : _2280;
    assign _2109 = _2106[1:1];
    assign _2282 = _2109 ? _2213 : _2281;
    assign _2274 = ~ _2107;
    assign _2275 = _2103 & _2274;
    assign _2283 = _2275 & _2282;
    assign _2685 = _2283 & _2684;
    assign _2687 = _2685 & _2686;
    assign _2696 = _2687 | _2695;
    assign _2677 = _2673 == _1272;
    assign _2675 = _2673 == _1271;
    assign _2678 = _2675 | _2677;
    assign _4105 = _1391 & _2678;
    assign _4106 = _4105 | _2696;
    assign _176 = _4106;
    assign _4108 = _176 & _4107;
    assign _4111 = _4108 ? _4110 : _3380;
    assign _177 = _4111;
    always @(posedge _274) begin
        if (_272)
            _3380 <= _1072;
        else
            _3380 <= _177;
    end
    always @* begin
        case (_3380)
        0:
            _3441 <= _3398;
        1:
            _3441 <= _3404;
        2:
            _3441 <= _3410;
        3:
            _3441 <= _3416;
        4:
            _3441 <= _3422;
        5:
            _3441 <= _3428;
        6:
            _3441 <= _3434;
        default:
            _3441 <= _3440;
        endcase
    end
    assign _3500 = _593 ? _1278 : _3441;
    assign _3535 = g_byte_0[7:1];
    assign _3536 = { _2801,
                     _3535 };
    assign _3533 = g_byte_0[6:0];
    assign _3534 = { _3533,
                     _2801 };
    assign _3537 = _3495 ? _3536 : _3534;
    assign _4116 = _2504 ? _3537 : _4115;
    assign _4117 = _2491 ? _4116 : _4115;
    assign _4118 = _2469 ? _4117 : _4115;
    assign _4119 = _2810 ? _4115 : _4118;
    assign _4112 = g_data_left_0 ? _3501 : g_byte_0;
    assign _4113 = _2468 ? g_byte_0 : _4112;
    assign _4114 = _2531 ? _4113 : g_byte_0;
    assign _4115 = _2523 ? _4114 : g_byte_0;
    assign _4120 = _2455 ? _4119 : _4115;
    assign _178 = _4120;
    always @(posedge _274) begin
        if (_272)
            g_byte_0 <= _1280;
        else
            g_byte_0 <= _178;
    end
    assign _2691 = g_bitpos_0 == _1072;
    assign _2688 = ~ _2468;
    assign _2689 = _2688 & g_data_left_0;
    assign _2692 = _2689 & _2691;
    assign _3501 = _2692 ? _3500 : g_byte_0;
    assign _3502 = _3501[0:0];
    assign _3510 = { _3502,
                     _3503,
                     _3504,
                     _3505,
                     _3506,
                     _3507,
                     _3508,
                     _3509 };
    assign _3495 = _2346[5:5];
    assign _3511 = _3495 ? _3501 : _3510;
    assign _3512 = _3511[0:0];
    assign _4128 = g_bitpos_0 + _1691;
    assign _2496 = g_cnt_0[5:0];
    assign _2501 = _2496 < _2500;
    assign _2502 = ~ _2501;
    assign _2492 = g_cnt_0[15:6];
    assign _2494 = _2492 == _1076;
    assign _2495 = ~ _2494;
    assign _2503 = _2495 | _2502;
    assign _2504 = _2491 & _2503;
    assign _4129 = _2504 ? _4128 : _4126;
    assign _4130 = _2491 ? _4129 : _4126;
    assign _4131 = _2469 ? _4130 : _4126;
    assign _4132 = _2810 ? _4126 : _4131;
    assign _4122 = g_bitpos_0 + _1691;
    assign _4123 = g_data_left_0 ? _4122 : g_bitpos_0;
    assign _4124 = _2468 ? g_bitpos_0 : _4123;
    assign _4125 = _2531 ? _4124 : g_bitpos_0;
    assign _4126 = _2523 ? _4125 : g_bitpos_0;
    assign _4133 = _2455 ? _4132 : _4126;
    assign _4135 = _2774 ? _1072 : _4133;
    assign _179 = _4135;
    always @(posedge _274) begin
        if (_272)
            g_bitpos_0 <= _1072;
        else
            g_bitpos_0 <= _179;
    end
    always @* begin
        case (g_bitpos_0)
        0:
            _3520 <= _3512;
        1:
            _3520 <= _3513;
        2:
            _3520 <= _3514;
        3:
            _3520 <= _3515;
        4:
            _3520 <= _3516;
        5:
            _3520 <= _3517;
        6:
            _3520 <= _3518;
        default:
            _3520 <= _3519;
        endcase
    end
    assign _3182 = _2346[7:7];
    assign _4146 = _215[1:1];
    assign _4147 = ~ _4146;
    assign _4142 = _1328[4:0];
    assign _4144 = _4142 == _3739;
    assign _4139 = _1328[5:5];
    assign _4141 = _4139 == _2701;
    assign _4145 = _4141 & _4144;
    assign _4148 = _4145 & _4147;
    assign _4149 = _4148 ? _1258 : _4138;
    assign _4150 = _2913 ? _4149 : _4138;
    assign _180 = _4150;
    always @(posedge _274) begin
        if (_272)
            _4138 <= _1280;
        else
            _4138 <= _180;
    end
    assign _4161 = _215[1:1];
    assign _4162 = ~ _4161;
    assign _4157 = _1328[4:0];
    assign _4159 = _4157 == _3754;
    assign _4154 = _1328[5:5];
    assign _4156 = _4154 == _2701;
    assign _4160 = _4156 & _4159;
    assign _4163 = _4160 & _4162;
    assign _4164 = _4163 ? _1258 : _4153;
    assign _4165 = _2913 ? _4164 : _4153;
    assign _181 = _4165;
    always @(posedge _274) begin
        if (_272)
            _4153 <= _1280;
        else
            _4153 <= _181;
    end
    assign _4176 = _215[1:1];
    assign _4177 = ~ _4176;
    assign _4172 = _1328[4:0];
    assign _4174 = _4172 == _3769;
    assign _4169 = _1328[5:5];
    assign _4171 = _4169 == _2701;
    assign _4175 = _4171 & _4174;
    assign _4178 = _4175 & _4177;
    assign _4179 = _4178 ? _1258 : _4168;
    assign _4180 = _2913 ? _4179 : _4168;
    assign _182 = _4180;
    always @(posedge _274) begin
        if (_272)
            _4168 <= _1280;
        else
            _4168 <= _182;
    end
    assign _4191 = _215[1:1];
    assign _4192 = ~ _4191;
    assign _4187 = _1328[4:0];
    assign _4189 = _4187 == _3784;
    assign _4184 = _1328[5:5];
    assign _4186 = _4184 == _2701;
    assign _4190 = _4186 & _4189;
    assign _4193 = _4190 & _4192;
    assign _4194 = _4193 ? _1258 : _4183;
    assign _4195 = _2913 ? _4194 : _4183;
    assign _183 = _4195;
    always @(posedge _274) begin
        if (_272)
            _4183 <= _1280;
        else
            _4183 <= _183;
    end
    assign _4321 = { _4183,
                     _4168,
                     _4153,
                     _4138 };
    assign _4314 = g_crc_0[30:0];
    assign _4316 = { _4314,
                     _1064 };
    assign _4308 = g_crc_0[31:31];
    assign _4309 = _2801 ^ _4308;
    assign _4311 = _4309 ? _4298 : _1247;
    assign _4305 = g_crc_0[30:0];
    assign _4307 = { _4305,
                     _1064 };
    assign _4312 = _4307 ^ _4311;
    assign _4313 = _2491 ? _4312 : _4304;
    assign _4206 = _215[1:1];
    assign _4207 = ~ _4206;
    assign _4202 = _1328[4:0];
    assign _4204 = _4202 == _3799;
    assign _4199 = _1328[5:5];
    assign _4201 = _4199 == _2701;
    assign _4205 = _4201 & _4204;
    assign _4208 = _4205 & _4207;
    assign _4209 = _4208 ? _1258 : _4198;
    assign _4210 = _2913 ? _4209 : _4198;
    assign _184 = _4210;
    always @(posedge _274) begin
        if (_272)
            _4198 <= _1280;
        else
            _4198 <= _184;
    end
    assign _4225 = _4198[5:0];
    assign _4220 = g_left_0 - _3193;
    assign _4221 = _3177 ? _4220 : _4218;
    assign _4222 = _2469 ? _4221 : _4218;
    assign _4223 = _2810 ? _4218 : _4222;
    assign _4214 = g_left_0 - _3193;
    assign _4215 = g_data_left_0 ? g_left_0 : _4214;
    assign _4216 = _2468 ? g_left_0 : _4215;
    assign _4217 = _2531 ? _4216 : g_left_0;
    assign _4218 = _2523 ? _4217 : g_left_0;
    assign _4224 = _2455 ? _4223 : _4218;
    assign _4226 = _4212 ? _4225 : _4224;
    assign _4228 = _2774 ? _1199 : _4226;
    assign _185 = _4228;
    always @(posedge _274) begin
        if (_272)
            g_left_0 <= _1199;
        else
            g_left_0 <= _185;
    end
    assign _2529 = g_left_0 == _1199;
    assign _2530 = ~ _2529;
    assign _3175 = ~ g_data_left_0;
    assign _3174 = _2455 & _2469;
    assign _3176 = _3174 & _3175;
    assign _3177 = _3176 & _2530;
    assign _4317 = _3177 ? _4316 : _4313;
    assign _4318 = _2469 ? _4317 : _4304;
    assign _4319 = _2810 ? _4304 : _4318;
    assign _4239 = _215[1:1];
    assign _4240 = ~ _4239;
    assign _4235 = _1328[4:0];
    assign _4237 = _4235 == _3832;
    assign _4232 = _1328[5:5];
    assign _4234 = _4232 == _2701;
    assign _4238 = _4234 & _4237;
    assign _4241 = _4238 & _4240;
    assign _4242 = _4241 ? _1258 : _4231;
    assign _4243 = _2913 ? _4242 : _4231;
    assign _186 = _4243;
    always @(posedge _274) begin
        if (_272)
            _4231 <= _1280;
        else
            _4231 <= _186;
    end
    assign _4254 = _215[1:1];
    assign _4255 = ~ _4254;
    assign _4250 = _1328[4:0];
    assign _4252 = _4250 == _3847;
    assign _4247 = _1328[5:5];
    assign _4249 = _4247 == _2701;
    assign _4253 = _4249 & _4252;
    assign _4256 = _4253 & _4255;
    assign _4257 = _4256 ? _1258 : _4246;
    assign _4258 = _2913 ? _4257 : _4246;
    assign _187 = _4258;
    always @(posedge _274) begin
        if (_272)
            _4246 <= _1280;
        else
            _4246 <= _187;
    end
    assign _4269 = _215[1:1];
    assign _4270 = ~ _4269;
    assign _4265 = _1328[4:0];
    assign _4267 = _4265 == _3862;
    assign _4262 = _1328[5:5];
    assign _4264 = _4262 == _2701;
    assign _4268 = _4264 & _4267;
    assign _4271 = _4268 & _4270;
    assign _4272 = _4271 ? _1258 : _4261;
    assign _4273 = _2913 ? _4272 : _4261;
    assign _188 = _4273;
    always @(posedge _274) begin
        if (_272)
            _4261 <= _1280;
        else
            _4261 <= _188;
    end
    assign _4284 = _215[1:1];
    assign _4285 = ~ _4284;
    assign _4280 = _1328[4:0];
    assign _4282 = _4280 == _3877;
    assign _4277 = _1328[5:5];
    assign _4279 = _4277 == _2701;
    assign _4283 = _4279 & _4282;
    assign _4286 = _4283 & _4285;
    assign _4287 = _4286 ? _1258 : _4276;
    assign _4288 = _2913 ? _4287 : _4276;
    assign _189 = _4288;
    always @(posedge _274) begin
        if (_272)
            _4276 <= _1280;
        else
            _4276 <= _189;
    end
    assign _4298 = { _4276,
                     _4261,
                     _4246,
                     _4231 };
    assign _4295 = g_crc_0[31:31];
    assign _4296 = _3522 ^ _4295;
    assign _4299 = _4296 ? _4298 : _1247;
    assign _4292 = g_crc_0[30:0];
    assign _4294 = { _4292,
                     _1064 };
    assign _4300 = _4294 ^ _4299;
    assign _4289 = g_crc_0[30:0];
    assign _4291 = { _4289,
                     _1064 };
    assign _4301 = g_data_left_0 ? _4300 : _4291;
    assign _4302 = _2468 ? g_crc_0 : _4301;
    assign _4303 = _2531 ? _4302 : g_crc_0;
    assign _4304 = _2523 ? _4303 : g_crc_0;
    assign _4320 = _2455 ? _4319 : _4304;
    assign _4322 = _2774 ? _4321 : _4320;
    assign _4324 = _2557 ? _1247 : _4322;
    assign _190 = _4324;
    always @(posedge _274) begin
        if (_272)
            g_crc_0 <= _1247;
        else
            g_crc_0 <= _190;
    end
    assign _3181 = g_crc_0[31:31];
    assign _3183 = _3181 ^ _3182;
    assign _4344 = _4343 ? _4341 : g_lim_0;
    assign _4345 = g_len_cap_0 ? _4344 : g_lim_0;
    assign _191 = _4345;
    always @(posedge _274) begin
        if (_272)
            g_lim_0 <= _1280;
        else
            g_lim_0 <= _191;
    end
    assign _2488 = { _1280,
                     g_lim_0 };
    assign _4353 = _215[1:1];
    assign _4354 = ~ _4353;
    assign _4349 = _1328[4:0];
    assign _4351 = _4349 == _3620;
    assign _4346 = _1328[5:5];
    assign _4348 = _4346 == _2701;
    assign _4352 = _4348 & _4351;
    assign _4355 = _4352 & _4354;
    assign _4356 = _4355 ? _1258 : _2482;
    assign _4357 = _2913 ? _4356 : _2482;
    assign _192 = _4357;
    always @(posedge _274) begin
        if (_272)
            _2482 <= _1280;
        else
            _2482 <= _192;
    end
    assign _4365 = _215[1:1];
    assign _4366 = ~ _4365;
    assign _4361 = _1328[4:0];
    assign _4363 = _4361 == _3632;
    assign _4358 = _1328[5:5];
    assign _4360 = _4358 == _2701;
    assign _4364 = _4360 & _4363;
    assign _4367 = _4364 & _4366;
    assign _4368 = _4367 ? _1258 : _2479;
    assign _4369 = _2913 ? _4368 : _2479;
    assign _193 = _4369;
    always @(posedge _274) begin
        if (_272)
            _2479 <= _1280;
        else
            _2479 <= _193;
    end
    assign _2483 = { _2479,
                     _2482 };
    assign _3154 = g_sr_0[14:0];
    assign _3155 = { _3154,
                     _2801 };
    assign _4370 = _2469 ? _3155 : g_sr_0;
    assign _4371 = _2810 ? g_sr_0 : _4370;
    assign _4372 = _2455 ? _4371 : g_sr_0;
    assign _4374 = _2774 ? _1171 : _4372;
    assign _194 = _4374;
    always @(posedge _274) begin
        if (_272)
            g_sr_0 <= _1171;
        else
            g_sr_0 <= _194;
    end
    assign _4336 = g_sr_0[3:0];
    assign _4382 = _215[1:1];
    assign _4383 = ~ _4382;
    assign _4378 = _1328[4:0];
    assign _4380 = _4378 == _3649;
    assign _4375 = _1328[5:5];
    assign _4377 = _4375 == _2701;
    assign _4381 = _4377 & _4380;
    assign _4384 = _4381 & _4383;
    assign _4385 = _4384 ? _1258 : _4334;
    assign _4386 = _2913 ? _4385 : _4334;
    assign _195 = _4386;
    always @(posedge _274) begin
        if (_272)
            _4334 <= _1280;
        else
            _4334 <= _195;
    end
    assign _4335 = _4334[3:0];
    assign _4337 = _4335 < _4336;
    assign _4338 = _4337 ? _4335 : _4336;
    assign _4340 = { _1064,
                     _4338,
                     _1072 };
    assign _2500 = _2499[5:0];
    assign _4330 = { _1392,
                     _2500 };
    assign _4341 = _4330 + _4340;
    assign _4342 = { _1280,
                     _4341 };
    assign _4343 = _4342 < _2483;
    assign _4434 = _4343 ? _2701 : g_len_known_0;
    assign _4397 = _215[1:1];
    assign _4398 = ~ _4397;
    assign _4393 = _1328[4:0];
    assign _4395 = _4393 == _3664;
    assign _4390 = _1328[5:5];
    assign _4392 = _4390 == _2701;
    assign _4396 = _4392 & _4395;
    assign _4399 = _4396 & _4398;
    assign _4400 = _4399 ? _1258 : _4389;
    assign _4401 = _2913 ? _4400 : _4389;
    assign _196 = _4401;
    always @(posedge _274) begin
        if (_272)
            _4389 <= _1280;
        else
            _4389 <= _196;
    end
    assign _4420 = _4389[5:0];
    assign _4419 = g_cnt_0[5:0];
    assign _4421 = _4419 == _4420;
    assign _4415 = g_cnt_0[15:6];
    assign _4417 = _4415 == _1076;
    assign _4409 = _215[1:1];
    assign _4410 = ~ _4409;
    assign _4405 = _1328[4:0];
    assign _4407 = _4405 == _3676;
    assign _4402 = _1328[5:5];
    assign _4404 = _4402 == _2701;
    assign _4408 = _4404 & _4407;
    assign _4411 = _4408 & _4410;
    assign _4412 = _4411 ? _1258 : _2499;
    assign _4413 = _2913 ? _4412 : _2499;
    assign _197 = _4413;
    always @(posedge _274) begin
        if (_272)
            _2499 <= _1280;
        else
            _2499 <= _197;
    end
    assign _4414 = _2499[7:7];
    assign _4418 = _4414 & _4417;
    assign _4422 = _4418 & _4421;
    assign _4424 = _4422 ? _2701 : g_len_cap_0;
    assign _4425 = _2491 ? _4424 : g_len_cap_0;
    assign _4426 = _2469 ? _4425 : g_len_cap_0;
    assign _4427 = _2810 ? g_len_cap_0 : _4426;
    assign _4428 = _2455 ? _4427 : g_len_cap_0;
    assign _4430 = g_len_cap_0 ? _1064 : _4428;
    assign _4432 = _2774 ? _1064 : _4430;
    assign _198 = _4432;
    always @(posedge _274) begin
        if (_272)
            g_len_cap_0 <= _1064;
        else
            g_len_cap_0 <= _198;
    end
    assign _4435 = g_len_cap_0 ? _4434 : g_len_known_0;
    assign _4437 = _2774 ? _1064 : _4435;
    assign _199 = _4437;
    always @(posedge _274) begin
        if (_272)
            g_len_known_0 <= _1064;
        else
            g_len_known_0 <= _199;
    end
    assign _2489 = g_len_known_0 ? _2488 : _2483;
    assign _4457 = g_cnt_0 + _5102;
    assign _2470 = _2455 & _2469;
    assign _2491 = _2470 & g_data_left_0;
    assign _4458 = _2491 ? _4457 : _4455;
    assign _2469 = ~ _2468;
    assign _4459 = _2469 ? _4458 : _4455;
    assign _4440 = _2810 ? _4439 : _2801;
    assign _4438 = _2531 ? _3522 : g_last_0;
    assign _4439 = _2523 ? _4438 : g_last_0;
    assign _4441 = _2455 ? _4440 : _4439;
    assign _4443 = _2774 ? _2701 : _4441;
    assign _200 = _4443;
    always @(posedge _274) begin
        if (_272)
            g_last_0 <= vdd;
        else
            g_last_0 <= _200;
    end
    assign _2806 = ~ g_last_0;
    assign _2803 = _2459 == _1271;
    assign _2807 = _2803 ? _2806 : gnd;
    assign _4445 = _2375 == _1271;
    assign _4446 = _4445 ? _2365 : g_prev_0;
    assign _4447 = _2455 ? _4446 : g_prev_0;
    assign _4449 = _2774 ? _2701 : _4447;
    assign _201 = _4449;
    always @(posedge _274) begin
        if (_272)
            g_prev_0 <= vdd;
        else
            g_prev_0 <= _201;
    end
    assign _2800 = _2365 == g_prev_0;
    assign _2797 = _2375 == _1271;
    assign _2801 = _2797 ? _2800 : _2365;
    assign _2808 = _2801 == _2807;
    assign _2809 = ~ _2808;
    assign _2810 = _2468 & _2809;
    assign _4460 = _2810 ? _4455 : _4459;
    assign _4451 = g_cnt_0 + _5102;
    assign _4452 = g_data_left_0 ? _4451 : g_cnt_0;
    assign _4453 = _2468 ? g_cnt_0 : _4452;
    assign _4454 = _2531 ? _4453 : g_cnt_0;
    assign _4455 = _2523 ? _4454 : g_cnt_0;
    assign _4461 = _2455 ? _4460 : _4455;
    assign _4463 = _2774 ? _1171 : _4461;
    assign _202 = _4463;
    always @(posedge _274) begin
        if (_272)
            g_cnt_0 <= _1171;
        else
            g_cnt_0 <= _202;
    end
    assign g_data_left_0 = g_cnt_0 < _2489;
    assign _3521 = g_data_left_0 ? _3520 : _3183;
    assign _3522 = _2468 ? _2807 : _3521;
    assign _4469 = _3522 == g_last_0;
    assign _4467 = g_run_0 == _1072;
    assign _4468 = ~ _4467;
    assign _4470 = _4468 & _4469;
    assign _4474 = _4470 ? _4473 : _1691;
    assign _4465 = _2459 == _1272;
    assign _4479 = _4465 ? _4478 : _4474;
    assign _4480 = _2531 ? _4479 : g_run_0;
    assign _4481 = _2523 ? _4480 : g_run_0;
    assign _4499 = _2455 ? _4498 : _4481;
    assign _4501 = _2774 ? _1072 : _4499;
    assign _203 = _4501;
    always @(posedge _274) begin
        if (_272)
            g_run_0 <= _1072;
        else
            g_run_0 <= _203;
    end
    assign _2467 = g_run_0 == _2466;
    assign _4509 = _215[1:1];
    assign _4510 = ~ _4509;
    assign _4505 = _1328[4:0];
    assign _4507 = _4505 == _3989;
    assign _4502 = _1328[5:5];
    assign _4504 = _4502 == _2701;
    assign _4508 = _4504 & _4507;
    assign _4511 = _4508 & _4510;
    assign _4512 = _4511 ? _1258 : _2458;
    assign _4513 = _2913 ? _4512 : _2458;
    assign _204 = _4513;
    always @(posedge _274) begin
        if (_272)
            _2458 <= _1280;
        else
            _2458 <= _204;
    end
    assign _2459 = _2458[1:0];
    assign _2461 = _2459 == _1392;
    assign _2462 = ~ _2461;
    assign _2468 = _2462 & _2467;
    assign _2524 = _2468 | g_data_left_0;
    assign _2531 = _2524 | _2530;
    assign _4527 = _2531 ? _4526 : _2701;
    assign _2514 = ~ _2347;
    assign _2515 = _2343 & _2514;
    assign _2523 = _2515 & _2522;
    assign _4528 = _2523 ? _4527 : f_lane1_out;
    assign _2519 = _2426 == _1171;
    assign _2517 = _2384 == _1171;
    assign _2520 = _2419 ? _2519 : _2517;
    assign _2521 = _2380 ? vdd : _2520;
    assign _2522 = _2349 ? _2453 : _2521;
    assign _4520 = ~ _2522;
    assign _4517 = _2375 == _1272;
    assign _4514 = ~ _2347;
    assign _4515 = _2343 & _4514;
    assign _4518 = _4515 & _4517;
    assign _4519 = _4518 & _2454;
    assign _4521 = _4519 & _4520;
    assign _4529 = _4521 ? _3494 : _4528;
    assign _4531 = _2788 ? _2701 : _4529;
    assign _4533 = _2512 ? _2701 : _4531;
    assign _4535 = _2774 ? _2701 : _4533;
    assign _4537 = _2557 ? _2701 : _4535;
    assign _205 = _4537;
    always @(posedge _274) begin
        if (_272)
            f_lane1_out <= vdd;
        else
            f_lane1_out <= _205;
    end
    assign _2786 = _2365 == f_lane1_out;
    assign _2787 = ~ _2786;
    assign _2782 = _2375 == _1272;
    assign _2783 = ~ _2782;
    assign _2779 = ~ _2349;
    assign _2777 = _2346[6:6];
    assign _2775 = ~ _2347;
    assign _2776 = _2343 & _2775;
    assign _2778 = _2776 & _2777;
    assign _2780 = _2778 & _2779;
    assign _2784 = _2780 & _2783;
    assign _2785 = _2784 & _2454;
    assign _2788 = _2785 & _2787;
    assign _4665 = _2788 ? _1392 : _4663;
    assign _2451 = ~ _2445;
    assign _2452 = _2448 & _2451;
    always @(posedge _274) begin
        if (_272)
            _2448 <= _1064;
        else
            _2448 <= _2445;
    end
    assign _2449 = ~ _2448;
    assign _2441 = _301[7:7];
    assign _2440 = _301[6:6];
    assign _2439 = _301[5:5];
    assign _2438 = _301[4:4];
    assign _2437 = _301[3:3];
    assign _2436 = _301[2:2];
    assign _2435 = _301[1:1];
    assign _2434 = _301[0:0];
    assign _2433 = _2352[2:0];
    always @* begin
        case (_2433)
        0:
            _2442 <= _2434;
        1:
            _2442 <= _2435;
        2:
            _2442 <= _2436;
        3:
            _2442 <= _2437;
        4:
            _2442 <= _2438;
        5:
            _2442 <= _2439;
        6:
            _2442 <= _2440;
        default:
            _2442 <= _2441;
        endcase
    end
    always @(posedge _274) begin
        if (_272)
            _2445 <= _1064;
        else
            _2445 <= _2442;
    end
    assign _2450 = _2445 & _2449;
    assign _2432 = _2346[2:2];
    assign _2453 = _2432 ? _2452 : _2450;
    assign _2430 = _2415 == _1171;
    assign _2427 = _2426 == _2415;
    assign _2420 = _2384 == _2415;
    assign _2418 = ~ _2374;
    assign _2409 = _2392[15:2];
    assign _2410 = { _1392,
                     _2409 };
    assign _2406 = _2392[15:1];
    assign _2407 = { _1064,
                     _2406 };
    assign _2411 = _2407 + _2410;
    assign _2403 = _2392[15:1];
    assign _2404 = { _1064,
                     _2403 };
    assign _2401 = _2347 & _2377;
    assign _2412 = _2401 ? _2411 : _2404;
    always @(posedge _274) begin
        if (_272)
            _2415 <= _1171;
        else
            _2415 <= _2412;
    end
    assign _2416 = _2384 < _2415;
    assign _2393 = _2392[15:2];
    assign _2394 = { _1392,
                     _2393 };
    always @(posedge _274) begin
        if (_272)
            _2397 <= _1171;
        else
            _2397 <= _2394;
    end
    assign _4622 = ~ _2374;
    assign _4623 = _2417 & _4622;
    assign _4624 = _4623 ? _2426 : _2384;
    assign _4626 = _2380 ? _1171 : _4624;
    assign _4628 = _4626 + _5102;
    assign _4606 = _4600 == _1131;
    assign _2422 = _2392[15:1];
    assign _2423 = { _1064,
                     _2422 };
    always @(posedge _274) begin
        if (_272)
            _2426 <= _1171;
        else
            _2426 <= _2423;
    end
    assign _4602 = { gnd,
                     _2426 };
    assign _4603 = _4602 == _4600;
    assign _4596 = { gnd,
                     _2392 };
    always @(posedge _274) begin
        if (_272)
            _4599 <= _1131;
        else
            _4599 <= _4596;
    end
    assign _4545 = _215[1:1];
    assign _4546 = ~ _4545;
    assign _4541 = _1328[4:0];
    assign _4543 = _4541 == _5452;
    assign _4538 = _1328[5:5];
    assign _4540 = _4538 == _2701;
    assign _4544 = _4540 & _4543;
    assign _4547 = _4544 & _4546;
    assign _4548 = _4547 ? _1258 : _2391;
    assign _4549 = _2913 ? _4548 : _2391;
    assign _206 = _4549;
    always @(posedge _274) begin
        if (_272)
            _2391 <= _1280;
        else
            _2391 <= _206;
    end
    assign _4557 = _215[1:1];
    assign _4558 = ~ _4557;
    assign _4553 = _1328[4:0];
    assign _4555 = _4553 == _4013;
    assign _4550 = _1328[5:5];
    assign _4552 = _4550 == _2701;
    assign _4556 = _4552 & _4555;
    assign _4559 = _4556 & _4558;
    assign _4560 = _4559 ? _1258 : _2388;
    assign _4561 = _2913 ? _4560 : _2388;
    assign _207 = _4561;
    always @(posedge _274) begin
        if (_272)
            _2388 <= _1280;
        else
            _2388 <= _207;
    end
    assign _2392 = { _2388,
                     _2391 };
    assign _4590 = { gnd,
                     _2392 };
    assign _4592 = _4590 - _4050;
    always @(posedge _274) begin
        if (_272)
            _4595 <= _1131;
        else
            _4595 <= _4592;
    end
    assign _4572 = _215[1:1];
    assign _4573 = ~ _4572;
    assign _4568 = _1328[4:0];
    assign _4570 = _4568 == _4028;
    assign _4565 = _1328[5:5];
    assign _4567 = _4565 == _2701;
    assign _4571 = _4567 & _4570;
    assign _4574 = _4571 & _4573;
    assign _4575 = _4574 ? _1258 : _4564;
    assign _4576 = _2913 ? _4575 : _4564;
    assign _208 = _4576;
    always @(posedge _274) begin
        if (_272)
            _4564 <= _1280;
        else
            _4564 <= _208;
    end
    assign _4610 = { gnd,
                     _4564 };
    assign _4612 = _4611[7:0];
    assign _4613 = _4608 ? _4612 : _4584;
    assign _4614 = _4581 ? _4613 : _4584;
    assign _4616 = _2774 ? _1280 : _4614;
    assign _209 = _4616;
    always @(posedge _274) begin
        if (_272)
            _4584 <= _1280;
        else
            _4584 <= _209;
    end
    assign _4609 = { gnd,
                     _4584 };
    assign _4611 = _4609 + _4610;
    assign _4617 = _4611[8:8];
    assign _4618 = _4608 ? _4617 : _4589;
    assign _4619 = _4581 ? _4618 : _4589;
    assign _4621 = _2774 ? _1064 : _4619;
    assign _210 = _4621;
    always @(posedge _274) begin
        if (_272)
            _4589 <= _1064;
        else
            _4589 <= _210;
    end
    assign _4600 = _4589 ? _4599 : _4595;
    assign _4586 = { gnd,
                     _2384 };
    assign _4601 = _4586 == _4600;
    assign _4604 = _2419 ? _4603 : _4601;
    assign _4607 = _2380 ? _4606 : _4604;
    assign _4585 = ~ _2349;
    assign _4608 = _4585 & _4607;
    assign _4630 = _4608 ? _1171 : _4628;
    assign _4580 = ~ _2349;
    assign _4578 = _2374 & _2372;
    assign _624 = g_mode == _1330;
    assign _4577 = _2343 | _624;
    assign _4579 = _4577 | _4578;
    assign _4581 = _4579 & _4580;
    assign _4631 = _4581 ? _4630 : _2384;
    assign _4633 = _2774 ? _1171 : _4631;
    assign _211 = _4633;
    always @(posedge _274) begin
        if (_272)
            _2384 <= _1171;
        else
            _2384 <= _211;
    end
    assign _2398 = _2384 < _2397;
    assign _2399 = ~ _2398;
    assign _2381 = _2372 & _2377;
    assign _2400 = _2381 & _2399;
    assign _2417 = _2400 & _2416;
    assign _2419 = _2417 & _2418;
    assign _2428 = _2419 ? _2427 : _2420;
    assign _2375 = _2346[4:3];
    assign _2377 = _2375 == _1272;
    assign _2378 = ~ _2377;
    assign _2379 = _2374 | _2378;
    assign _2371 = ~ _2349;
    always @(posedge _274) begin
        if (_272)
            _2368 <= _1064;
        else
            _2368 <= _2365;
    end
    assign _2361 = _301[7:7];
    assign _2360 = _301[6:6];
    assign _2359 = _301[5:5];
    assign _2358 = _301[4:4];
    assign _2357 = _301[3:3];
    assign _2356 = _301[2:2];
    assign _2355 = _301[1:1];
    assign _2354 = _301[0:0];
    assign _4641 = _215[1:1];
    assign _4642 = ~ _4641;
    assign _4637 = _1328[4:0];
    assign _4639 = _4637 == _4097;
    assign _4634 = _1328[5:5];
    assign _4636 = _4634 == _2701;
    assign _4640 = _4636 & _4639;
    assign _4643 = _4640 & _4642;
    assign _4644 = _4643 ? _1258 : _2352;
    assign _4645 = _2913 ? _4644 : _2352;
    assign _212 = _4645;
    always @(posedge _274) begin
        if (_272)
            _2352 <= _1280;
        else
            _2352 <= _212;
    end
    assign _2353 = _2352[5:3];
    always @* begin
        case (_2353)
        0:
            _2362 <= _2354;
        1:
            _2362 <= _2355;
        2:
            _2362 <= _2356;
        3:
            _2362 <= _2357;
        4:
            _2362 <= _2358;
        5:
            _2362 <= _2359;
        6:
            _2362 <= _2360;
        default:
            _2362 <= _2361;
        endcase
    end
    always @(posedge _274) begin
        if (_272)
            _2365 <= _1064;
        else
            _2365 <= _2362;
    end
    assign _2369 = _2365 ^ _2368;
    assign _2370 = _2347 & _2369;
    assign _2372 = _2370 & _2371;
    assign _2380 = _2372 & _2379;
    assign _2431 = _2380 ? _2430 : _2428;
    assign _2349 = _2346[1:1];
    assign _2454 = _2349 ? _2453 : _2431;
    assign _4653 = _215[1:1];
    assign _4654 = ~ _4653;
    assign _4650 = 5'b00011;
    assign _4649 = _1328[4:0];
    assign _4651 = _4649 == _4650;
    assign _4646 = _1328[5:5];
    assign _4648 = _4646 == _2701;
    assign _4652 = _4648 & _4651;
    assign _4655 = _4652 & _4654;
    assign _4656 = _4655 ? _1258 : _2346;
    assign _4657 = _2913 ? _4656 : _2346;
    assign _213 = _4657;
    always @(posedge _274) begin
        if (_272)
            _2346 <= _1280;
        else
            _2346 <= _213;
    end
    assign _2347 = _2346[0:0];
    assign _2343 = g_mode == _1272;
    assign _2348 = _2343 & _2347;
    assign _2455 = _2348 & _2454;
    assign _4717 = _2455 ? _4716 : _4665;
    assign _2512 = _217 == _1721;
    assign _4719 = _2512 ? _1392 : _4717;
    assign _4212 = _217 == _1727;
    assign _4726 = _4212 ? _4725 : _4719;
    assign _2774 = _217 == _1715;
    assign _4732 = _2774 ? _4731 : _4726;
    assign _2556 = _217 == _1357;
    assign _2557 = _2556 | _1387;
    assign _4734 = _2557 ? _1392 : _4732;
    assign _214 = _4734;
    always @(posedge _274) begin
        if (_272)
            g_mode <= _1392;
        else
            g_mode <= _214;
    end
    assign _2374 = g_mode == _1271;
    assign _2868 = _2374 | _2343;
    assign _4735 = { _2868,
                     _2865 };
    assign _215 = _4735;
    assign _4743 = _215[0:0];
    assign _4744 = ~ _4743;
    assign _4739 = _1328[4:0];
    assign _4741 = _4739 == _4650;
    assign _4736 = _1328[5:5];
    assign _4738 = _4736 == _1064;
    assign _4742 = _4738 & _4741;
    assign _4745 = _4742 & _4744;
    assign _4746 = _4745 ? _1258 : _2106;
    assign _2912 = _1242 == _1721;
    assign _2913 = _1241 & _2912;
    assign _4747 = _2913 ? _4746 : _2106;
    assign _216 = _4747;
    always @(posedge _274) begin
        if (_272)
            _2106 <= _1280;
        else
            _2106 <= _216;
    end
    assign _2107 = _2106[0:0];
    assign _2730 = ~ _2107;
    assign _2731 = _2103 & _2730;
    assign _2733 = _2731 & _2732;
    assign _2735 = _2733 & _2734;
    assign _2739 = _2735 & _2738;
    assign _2740 = _2739 & _2214;
    assign _2743 = _2740 & _2742;
    assign _4759 = _2743 ? _1392 : _4757;
    assign _4811 = _2215 ? _4810 : _4759;
    assign _2272 = _217 == _1697;
    assign _4813 = _2272 ? _1392 : _4811;
    assign _3808 = _217 == _1703;
    assign _4820 = _3808 ? _4819 : _4813;
    assign _2729 = _217 == _1691;
    assign _4826 = _2729 ? _4825 : _4820;
    assign _1428 = _709[90:88];
    assign _1427 = _703[90:88];
    assign _1426 = _697[90:88];
    assign _1425 = _297[90:88];
    always @* begin
        case (f_winner)
        0:
            _1429 <= _1425;
        1:
            _1429 <= _1426;
        2:
            _1429 <= _1427;
        default:
            _1429 <= _1428;
        endcase
    end
    assign _1421 = _709[87:87];
    assign _1420 = _703[87:87];
    assign _1419 = _697[87:87];
    assign _1418 = _297[87:87];
    always @* begin
        case (f_winner)
        0:
            _1422 <= _1418;
        1:
            _1422 <= _1419;
        2:
            _1422 <= _1420;
        default:
            _1422 <= _1421;
        endcase
    end
    assign _4748 = ~ _1422;
    assign _4749 = _1188 & _4748;
    assign _4751 = _4749 ? _1429 : _1072;
    assign _217 = _4751;
    assign _2313 = _217 == _1357;
    assign _2314 = _2313 | _1387;
    assign _4828 = _2314 ? _1392 : _4826;
    assign _218 = _4828;
    always @(posedge _274) begin
        if (_272)
            g_mode_0 <= _1392;
        else
            g_mode_0 <= _218;
    end
    assign _2103 = g_mode_0 == _1272;
    assign _2108 = _2103 & _2107;
    assign _2215 = _2108 & _2214;
    assign _2230 = _2215 & _2229;
    assign _2251 = _2230 & g_data_left;
    assign _2264 = _2251 & _2263;
    assign _2270 = _2264 & _2269;
    assign _2306 = _2270 | _2305;
    assign _3351 = _2306 | _2550;
    assign _4831 = _1258[5:0];
    assign _4830 = _2641 == _2719;
    assign _4832 = _4830 ? _4831 : _1191;
    assign _4833 = _2639 ? _4832 : _1191;
    assign _219 = _4833;
    always @(posedge _274) begin
        if (_272)
            _1191 <= _1199;
        else
            _1191 <= _219;
    end
    assign _2307 = _1191[3:3];
    assign _3352 = _2307 & _3351;
    assign _220 = _3352;
    assign _3389 = _220 | _3388;
    assign _3391 = _3389 & _3390;
    assign _4834 = _3391 ^ _4108;
    assign _4840 = _4834 ? _4839 : _221;
    always @(posedge _274) begin
        if (_272)
            _4843 <= _2724;
        else
            _4843 <= _4840;
    end
    assign _221 = _4843;
    assign _593 = _221 == _2724;
    assign _4845 = _593 ? _1278 : _3441;
    assign _2672 = _692[28:27];
    assign _2670 = _709[95:94];
    assign _2669 = _703[95:94];
    assign _2668 = _697[95:94];
    assign _2667 = _297[95:94];
    always @* begin
        case (f_winner)
        0:
            _2671 <= _2667;
        1:
            _2671 <= _2668;
        2:
            _2671 <= _2669;
        default:
            _2671 <= _2670;
        endcase
    end
    assign _2673 = _1390 ? _2672 : _2671;
    always @* begin
        case (_2673)
        0:
            _4857 <= _586;
        1:
            _4857 <= _4845;
        2:
            _4857 <= _4854;
        default:
            _4857 <= _4856;
        endcase
    end
    assign _4858 = _1391 ? _4857 : _586;
    assign _222 = _4858;
    always @(posedge _274) begin
        if (_272)
            _586 <= _1280;
        else
            _586 <= _222;
    end
    assign _587 = _586[0:0];
    assign _4869 = 8'b00001000;
    assign _4868 = 8'b00000111;
    assign _4867 = _581 - _2334;
    assign _4864 = _692[30:29];
    assign _709 = _296[511:400];
    assign _4862 = _709[99:98];
    assign _703 = _296[399:288];
    assign _4861 = _703[99:98];
    assign _4860 = _697[99:98];
    assign _4859 = _297[99:98];
    always @* begin
        case (f_winner)
        0:
            _4863 <= _4859;
        1:
            _4863 <= _4860;
        2:
            _4863 <= _4861;
        default:
            _4863 <= _4862;
        endcase
    end
    assign _4865 = _1390 ? _4864 : _4863;
    always @* begin
        case (_4865)
        0:
            _4870 <= _581;
        1:
            _4870 <= _4867;
        2:
            _4870 <= _4868;
        default:
            _4870 <= _4869;
        endcase
    end
    assign _4871 = _1391 ? _4870 : _581;
    assign _223 = _4871;
    always @(posedge _274) begin
        if (_272)
            _581 <= _1280;
        else
            _581 <= _223;
    end
    assign _583 = _581 == _1280;
    assign _814 = _697[61:58];
    always @* begin
        case (_814)
        0:
            _815 <= vdd;
        1:
            _815 <= _583;
        2:
            _815 <= _587;
        3:
            _815 <= _591;
        4:
            _815 <= _593;
        5:
            _815 <= _595;
        6:
            _815 <= _599;
        7:
            _815 <= _605;
        8:
            _815 <= _610;
        9:
            _815 <= _613;
        10:
            _815 <= _616;
        11:
            _815 <= _619;
        12:
            _815 <= _624;
        13:
            _815 <= _627;
        14:
            _815 <= _630;
        default:
            _815 <= _633;
        endcase
    end
    assign _817 = _815 ^ _816;
    assign _809 = _697[57:42];
    assign _811 = _809 == _1061;
    assign _800 = _746[57:42];
    assign _801 = { gnd,
                    _800 };
    assign _802 = _801 + _789;
    always @(posedge _274) begin
        if (_272)
            _805 <= _1131;
        else
            _805 <= _802;
    end
    assign _806 = _805 < _745;
    assign _807 = ~ _806;
    assign _796 = _697[41:26];
    assign _798 = _796 == _1171;
    assign _541 = _537 + _1691;
    assign _4886 = _537 + _1691;
    assign _4882 = _537 == _1727;
    assign _4883 = ~ _4882;
    assign _4880 = _317[0:0];
    assign _4884 = _4880 & _4883;
    assign _4887 = _4884 ? _4886 : _537;
    assign _4877 = _317[0:0];
    assign _4878 = ~ _4877;
    assign _4876 = f_chg_now[0:0];
    assign _4879 = _4876 & _4878;
    assign _4889 = _4879 ? _1691 : _4887;
    assign _4873 = _281 == _1272;
    assign _4875 = _4873 ? _1072 : _537;
    assign _4872 = _281 == _1271;
    assign _4890 = _4872 ? _4889 : _4875;
    assign _224 = _4890;
    always @(posedge _274) begin
        if (_272)
            _537 <= _1072;
        else
            _537 <= _224;
    end
    assign _539 = _537 == _1727;
    assign _542 = _539 ? _537 : _541;
    assign _532 = _317[0:0];
    assign _533 = ~ _532;
    assign _531 = f_chg_now[0:0];
    assign _534 = _531 & _533;
    assign _544 = _534 ? _1691 : _542;
    assign _528 = f_changed_all[0:0];
    assign _529 = f_in_fetch & _528;
    assign _545 = _529 ? _544 : _1072;
    assign _780 = _750[0:0];
    assign _782 = _780 ? _545 : _1072;
    assign _520 = _516 + _1691;
    assign _4905 = _516 + _1691;
    assign _4901 = _516 == _1727;
    assign _4902 = ~ _4901;
    assign _4899 = _317[1:1];
    assign _4903 = _4899 & _4902;
    assign _4906 = _4903 ? _4905 : _516;
    assign _4896 = _317[1:1];
    assign _4897 = ~ _4896;
    assign _4895 = f_chg_now[1:1];
    assign _4898 = _4895 & _4897;
    assign _4908 = _4898 ? _1691 : _4906;
    assign _4892 = _281 == _1272;
    assign _4894 = _4892 ? _1072 : _516;
    assign _4891 = _281 == _1271;
    assign _4909 = _4891 ? _4908 : _4894;
    assign _225 = _4909;
    always @(posedge _274) begin
        if (_272)
            _516 <= _1072;
        else
            _516 <= _225;
    end
    assign _518 = _516 == _1727;
    assign _521 = _518 ? _516 : _520;
    assign _511 = _317[1:1];
    assign _512 = ~ _511;
    assign _510 = f_chg_now[1:1];
    assign _513 = _510 & _512;
    assign _523 = _513 ? _1691 : _521;
    assign _507 = f_changed_all[1:1];
    assign _508 = f_in_fetch & _507;
    assign _524 = _508 ? _523 : _1072;
    assign _777 = _750[1:1];
    assign _779 = _777 ? _524 : _1072;
    assign _783 = _779 < _782;
    assign _784 = _783 ? _782 : _779;
    assign _497 = _493 + _1691;
    assign _4924 = _493 + _1691;
    assign _4920 = _493 == _1727;
    assign _4921 = ~ _4920;
    assign _4918 = _317[2:2];
    assign _4922 = _4918 & _4921;
    assign _4925 = _4922 ? _4924 : _493;
    assign _4915 = _317[2:2];
    assign _4916 = ~ _4915;
    assign _4914 = f_chg_now[2:2];
    assign _4917 = _4914 & _4916;
    assign _4927 = _4917 ? _1691 : _4925;
    assign _4911 = _281 == _1272;
    assign _4913 = _4911 ? _1072 : _493;
    assign _4910 = _281 == _1271;
    assign _4928 = _4910 ? _4927 : _4913;
    assign _226 = _4928;
    always @(posedge _274) begin
        if (_272)
            _493 <= _1072;
        else
            _493 <= _226;
    end
    assign _495 = _493 == _1727;
    assign _498 = _495 ? _493 : _497;
    assign _488 = _317[2:2];
    assign _489 = ~ _488;
    assign _487 = f_chg_now[2:2];
    assign _490 = _487 & _489;
    assign _500 = _490 ? _1691 : _498;
    assign _484 = f_changed_all[2:2];
    assign _485 = f_in_fetch & _484;
    assign _501 = _485 ? _500 : _1072;
    assign _772 = _750[2:2];
    assign _774 = _772 ? _501 : _1072;
    assign _476 = _472 + _1691;
    assign _4943 = _472 + _1691;
    assign _4939 = _472 == _1727;
    assign _4940 = ~ _4939;
    assign _4937 = _317[3:3];
    assign _4941 = _4937 & _4940;
    assign _4944 = _4941 ? _4943 : _472;
    assign _4934 = _317[3:3];
    assign _4935 = ~ _4934;
    assign _4933 = f_chg_now[3:3];
    assign _4936 = _4933 & _4935;
    assign _4946 = _4936 ? _1691 : _4944;
    assign _4930 = _281 == _1272;
    assign _4932 = _4930 ? _1072 : _472;
    assign _4929 = _281 == _1271;
    assign _4947 = _4929 ? _4946 : _4932;
    assign _227 = _4947;
    always @(posedge _274) begin
        if (_272)
            _472 <= _1072;
        else
            _472 <= _227;
    end
    assign _474 = _472 == _1727;
    assign _477 = _474 ? _472 : _476;
    assign _467 = _317[3:3];
    assign _468 = ~ _467;
    assign _466 = f_chg_now[3:3];
    assign _469 = _466 & _468;
    assign _479 = _469 ? _1691 : _477;
    assign _463 = f_changed_all[3:3];
    assign _464 = f_in_fetch & _463;
    assign _480 = _464 ? _479 : _1072;
    assign _769 = _750[3:3];
    assign _771 = _769 ? _480 : _1072;
    assign _775 = _771 < _774;
    assign _776 = _775 ? _774 : _771;
    assign _785 = _776 < _784;
    assign _786 = _785 ? _784 : _776;
    assign _451 = _447 + _1691;
    assign _4962 = _447 + _1691;
    assign _4958 = _447 == _1727;
    assign _4959 = ~ _4958;
    assign _4956 = _317[4:4];
    assign _4960 = _4956 & _4959;
    assign _4963 = _4960 ? _4962 : _447;
    assign _4953 = _317[4:4];
    assign _4954 = ~ _4953;
    assign _4952 = f_chg_now[4:4];
    assign _4955 = _4952 & _4954;
    assign _4965 = _4955 ? _1691 : _4963;
    assign _4949 = _281 == _1272;
    assign _4951 = _4949 ? _1072 : _447;
    assign _4948 = _281 == _1271;
    assign _4966 = _4948 ? _4965 : _4951;
    assign _228 = _4966;
    always @(posedge _274) begin
        if (_272)
            _447 <= _1072;
        else
            _447 <= _228;
    end
    assign _449 = _447 == _1727;
    assign _452 = _449 ? _447 : _451;
    assign _442 = _317[4:4];
    assign _443 = ~ _442;
    assign _441 = f_chg_now[4:4];
    assign _444 = _441 & _443;
    assign _454 = _444 ? _1691 : _452;
    assign _438 = f_changed_all[4:4];
    assign _439 = f_in_fetch & _438;
    assign _455 = _439 ? _454 : _1072;
    assign _762 = _750[4:4];
    assign _764 = _762 ? _455 : _1072;
    assign _430 = _426 + _1691;
    assign _4981 = _426 + _1691;
    assign _4977 = _426 == _1727;
    assign _4978 = ~ _4977;
    assign _4975 = _317[5:5];
    assign _4979 = _4975 & _4978;
    assign _4982 = _4979 ? _4981 : _426;
    assign _4972 = _317[5:5];
    assign _4973 = ~ _4972;
    assign _4971 = f_chg_now[5:5];
    assign _4974 = _4971 & _4973;
    assign _4984 = _4974 ? _1691 : _4982;
    assign _4968 = _281 == _1272;
    assign _4970 = _4968 ? _1072 : _426;
    assign _4967 = _281 == _1271;
    assign _4985 = _4967 ? _4984 : _4970;
    assign _229 = _4985;
    always @(posedge _274) begin
        if (_272)
            _426 <= _1072;
        else
            _426 <= _229;
    end
    assign _428 = _426 == _1727;
    assign _431 = _428 ? _426 : _430;
    assign _421 = _317[5:5];
    assign _422 = ~ _421;
    assign _420 = f_chg_now[5:5];
    assign _423 = _420 & _422;
    assign _433 = _423 ? _1691 : _431;
    assign _417 = f_changed_all[5:5];
    assign _418 = f_in_fetch & _417;
    assign _434 = _418 ? _433 : _1072;
    assign _759 = _750[5:5];
    assign _761 = _759 ? _434 : _1072;
    assign _765 = _761 < _764;
    assign _766 = _765 ? _764 : _761;
    assign _407 = _403 + _1691;
    assign _5000 = _403 + _1691;
    assign _4996 = _403 == _1727;
    assign _4997 = ~ _4996;
    assign _4994 = _317[6:6];
    assign _4998 = _4994 & _4997;
    assign _5001 = _4998 ? _5000 : _403;
    assign _4991 = _317[6:6];
    assign _4992 = ~ _4991;
    assign _4990 = f_chg_now[6:6];
    assign _4993 = _4990 & _4992;
    assign _5003 = _4993 ? _1691 : _5001;
    assign _4987 = _281 == _1272;
    assign _4989 = _4987 ? _1072 : _403;
    assign _4986 = _281 == _1271;
    assign _5004 = _4986 ? _5003 : _4989;
    assign _230 = _5004;
    always @(posedge _274) begin
        if (_272)
            _403 <= _1072;
        else
            _403 <= _230;
    end
    assign _405 = _403 == _1727;
    assign _408 = _405 ? _403 : _407;
    assign _398 = _317[6:6];
    assign _399 = ~ _398;
    assign _397 = f_chg_now[6:6];
    assign _400 = _397 & _399;
    assign _410 = _400 ? _1691 : _408;
    assign _394 = f_changed_all[6:6];
    assign _395 = f_in_fetch & _394;
    assign _411 = _395 ? _410 : _1072;
    assign _754 = _750[6:6];
    assign _756 = _754 ? _411 : _1072;
    assign _386 = _382 + _1691;
    assign _5019 = _382 + _1691;
    assign _5015 = _382 == _1727;
    assign _5016 = ~ _5015;
    assign _5013 = _317[7:7];
    assign _5017 = _5013 & _5016;
    assign _5020 = _5017 ? _5019 : _382;
    assign _5010 = _317[7:7];
    assign _5011 = ~ _5010;
    assign _5009 = f_chg_now[7:7];
    assign _5012 = _5009 & _5011;
    assign _5022 = _5012 ? _1691 : _5020;
    assign _5006 = _281 == _1272;
    assign _5008 = _5006 ? _1072 : _382;
    assign _5005 = _281 == _1271;
    assign _5023 = _5005 ? _5022 : _5008;
    assign _231 = _5023;
    always @(posedge _274) begin
        if (_272)
            _382 <= _1072;
        else
            _382 <= _231;
    end
    assign _384 = _382 == _1727;
    assign _387 = _384 ? _382 : _386;
    assign _377 = _317[7:7];
    assign _378 = ~ _377;
    assign _376 = f_chg_now[7:7];
    assign _379 = _376 & _378;
    assign _389 = _379 ? _1691 : _387;
    assign _373 = f_changed_all[7:7];
    assign _374 = f_in_fetch & _373;
    assign _390 = _374 ? _389 : _1072;
    assign _750 = _746[23:16];
    assign _751 = _750[7:7];
    assign _753 = _751 ? _390 : _1072;
    assign _757 = _753 < _756;
    assign _758 = _757 ? _756 : _753;
    assign _767 = _758 < _766;
    assign _768 = _767 ? _766 : _758;
    assign _787 = _768 < _786;
    assign _788 = _787 ? _786 : _768;
    assign _789 = { _1115,
                    _788 };
    assign _5026 = _348 == _1691;
    assign _5027 = _5026 ? _250 : _295;
    assign _5024 = _281 == _1271;
    assign _5028 = _5024 ? _5027 : _295;
    assign _232 = _5028;
    always @(posedge _274) begin
        if (_272)
            _295 <= _1346;
        else
            _295 <= _232;
    end
    assign _362 = _348 == _1691;
    assign _363 = f_in_fetch & _362;
    assign _364 = _363 ? _250 : _295;
    assign _5031 = _348 == _1697;
    assign _5032 = _5031 ? _250 : _292;
    assign _5029 = _281 == _1271;
    assign _5033 = _5029 ? _5032 : _292;
    assign _233 = _5033;
    always @(posedge _274) begin
        if (_272)
            _292 <= _1346;
        else
            _292 <= _233;
    end
    assign _358 = _348 == _1697;
    assign _359 = f_in_fetch & _358;
    assign _360 = _359 ? _250 : _292;
    assign _5036 = _348 == _1703;
    assign _5037 = _5036 ? _250 : _289;
    assign _5034 = _281 == _1271;
    assign _5038 = _5034 ? _5037 : _289;
    assign _234 = _5038;
    always @(posedge _274) begin
        if (_272)
            _289 <= _1346;
        else
            _289 <= _234;
    end
    assign _354 = _348 == _1703;
    assign _355 = f_in_fetch & _354;
    assign _356 = _355 ? _250 : _289;
    assign _350 = _348 == _1357;
    assign _351 = f_in_fetch & _350;
    assign _352 = _351 ? _250 : _286;
    assign _365 = { _352,
                    _356,
                    _360,
                    _364 };
    assign _746 = _365[287:176];
    assign _747 = _746[41:26];
    assign _748 = { gnd,
                    _747 };
    assign _790 = _748 + _789;
    always @(posedge _274) begin
        if (_272)
            _793 <= _1131;
        else
            _793 <= _790;
    end
    assign gnd = 1'b0;
    assign _745 = { gnd,
                    _742 };
    assign _794 = _745 < _793;
    assign _795 = ~ _794;
    assign _799 = _795 | _798;
    assign _808 = _799 & _807;
    assign _5066 = _338 + _5102;
    assign _5062 = _338 == _1061;
    assign _5063 = ~ _5062;
    assign _5064 = _5060 & _5063;
    assign _5067 = _5064 ? _5066 : _338;
    assign _5046 = _5045[2:2];
    assign _5047 = _1391 & _5046;
    assign _5069 = _5047 ? _1171 : _5067;
    assign _5071 = _1384 ? _1171 : _5069;
    assign _235 = _5071;
    always @(posedge _274) begin
        if (_272)
            _338 <= _1171;
        else
            _338 <= _235;
    end
    assign _5083 = _335 + _5102;
    assign _5079 = _335 == _1061;
    assign _5080 = ~ _5079;
    assign _5058 = 9'b111111111;
    assign _5059 = _5051 == _5058;
    assign _5056 = 6'b111111;
    assign _5055 = _5051[5:0];
    assign _5057 = _5055 == _5056;
    assign _5050 = 9'b000000000;
    assign _5072 = 9'b000000001;
    assign _5073 = _5051 + _5072;
    assign _5075 = _1384 ? _5050 : _5073;
    assign _236 = _5075;
    always @(posedge _274) begin
        if (_272)
            _5051 <= _5050;
        else
            _5051 <= _236;
    end
    assign _5052 = _5051[2:0];
    assign _5054 = _5052 == _1727;
    assign _5048 = _692[63:62];
    always @* begin
        case (_5048)
        0:
            _5060 <= vdd;
        1:
            _5060 <= _5054;
        2:
            _5060 <= _5057;
        default:
            _5060 <= _5059;
        endcase
    end
    assign _5081 = _5060 & _5080;
    assign _5084 = _5081 ? _5083 : _335;
    assign _5076 = _5045[1:1];
    assign _5077 = _1391 & _5076;
    assign _5086 = _5077 ? _1171 : _5084;
    assign _5088 = _1384 ? _1171 : _5086;
    assign _237 = _5088;
    always @(posedge _274) begin
        if (_272)
            _335 <= _1171;
        else
            _335 <= _237;
    end
    assign _741 = _697[25:24];
    always @* begin
        case (_741)
        0:
            _742 <= _332;
        1:
            _742 <= _335;
        2:
            _742 <= _338;
        default:
            _742 <= _338;
        endcase
    end
    assign _744 = _742 == _1061;
    assign _812 = _744 ? _811 : _808;
    always @(posedge _274) begin
        if (_272)
            _320 <= _1280;
        else
            _320 <= _304;
    end
    assign f_chg_now = _304 ^ _320;
    assign _5090 = _281 == _1272;
    assign _5092 = _5090 ? _1280 : _317;
    assign _5089 = _281 == _1271;
    assign _5093 = _5089 ? f_changed_all : _5092;
    assign _5095 = _1384 ? _1280 : _5093;
    assign _238 = _5095;
    always @(posedge _274) begin
        if (_272)
            _317 <= _1280;
        else
            _317 <= _238;
    end
    assign f_changed_all = _317 | f_chg_now;
    assign _735 = f_changed_all & f_chgmask1;
    assign _737 = _735 == _1280;
    assign _738 = ~ _737;
    assign f_chgmask1 = _697[23:16];
    assign _734 = f_chgmask1 == _1280;
    assign _739 = _734 | _738;
    assign _728 = _697[7:0];
    assign _726 = _697[15:8];
    assign _240 = pins_in;
    always @(posedge _274) begin
        if (_272)
            _301 <= _1280;
        else
            _301 <= _240;
    end
    always @(posedge _274) begin
        if (_272)
            _304 <= _1280;
        else
            _304 <= _301;
    end
    assign _727 = _304 ^ _726;
    assign _729 = _727 & _728;
    assign _731 = _729 == _1280;
    assign _697 = _296[287:176];
    assign f_valid1 = _697[111:111];
    assign _732 = f_valid1 & _731;
    assign _740 = _732 & _739;
    assign _813 = _740 & _812;
    assign _818 = _813 & _817;
    assign _857 = _818 & _856;
    assign _858 = f_in_eval & _857;
    assign _862 = _858 & _861;
    assign f_fire1 = _862 & _724;
    assign _1006 = f_fire1 ? _1271 : _1004;
    assign f_winner = f_fire0 ? _1392 : _1006;
    always @* begin
        case (f_winner)
        0:
            _5043 <= _5039;
        1:
            _5043 <= _5040;
        2:
            _5043 <= _5041;
        default:
            _5043 <= _5042;
        endcase
    end
    assign _5045 = _1390 ? _5044 : _5043;
    assign _5096 = _5045[0:0];
    assign _1389 = _348 == _1357;
    assign f_in_fetch = _281 == _1271;
    assign _1390 = f_in_fetch & _1389;
    assign _1391 = _1390 | _1188;
    assign _5097 = _1391 & _5096;
    assign _5106 = _5097 ? _1171 : _5104;
    assign _5108 = _1384 ? _1171 : _5106;
    assign _241 = _5108;
    always @(posedge _274) begin
        if (_272)
            _332 <= _1171;
        else
            _332 <= _241;
    end
    assign _1600 = _692[33:32];
    always @* begin
        case (_1600)
        0:
            _1601 <= _332;
        1:
            _1601 <= _335;
        2:
            _1601 <= _338;
        default:
            _1601 <= _338;
        endcase
    end
    assign _1599 = _692[49:34];
    assign _1602 = _1599 < _1601;
    assign _692 = _296[63:0];
    assign _1597 = _692[31:31];
    assign _1595 = ~ _1188;
    assign _1596 = f_in_eval & _1595;
    assign _1598 = _1596 & _1597;
    assign _1603 = _1598 & _1602;
    assign _1608 = _1603 & _1607;
    assign _1630 = _1608 | f_unexp_now;
    assign f_viol_now = _1630 | f_amb_now;
    assign _5114 = f_viol_now ? _5113 : _348;
    assign _5117 = _1188 ? _5116 : _5114;
    assign _5110 = _281 == _1272;
    assign _5118 = _5110 ? _5117 : _348;
    assign _5109 = _281 == _1271;
    assign _5121 = _5109 ? _5120 : _5118;
    assign _5123 = _1384 ? _1072 : _5121;
    assign _242 = _5123;
    always @(posedge _274) begin
        if (_272)
            _348 <= _1072;
        else
            _348 <= _242;
    end
    assign _5126 = _348 == _1357;
    assign _5127 = _5126 ? _250 : _286;
    assign _5124 = _281 == _1271;
    assign _5128 = _5124 ? _5127 : _286;
    assign _243 = _5128;
    always @(posedge _274) begin
        if (_272)
            _286 <= _1346;
        else
            _286 <= _243;
    end
    assign _296 = { _286,
                    _289,
                    _292,
                    _295 };
    assign _297 = _296[175:64];
    assign f_valid0 = _297[111:111];
    assign _311 = f_valid0 & _310;
    assign _328 = _311 & _327;
    assign _577 = _328 & _576;
    assign _637 = _577 & _636;
    assign _681 = _637 & _680;
    assign f_in_eval = _281 == _1272;
    assign _682 = f_in_eval & _681;
    assign _691 = _682 & _690;
    assign f_fire0 = _691 & _724;
    assign _1092 = f_fire0 | f_fire1;
    assign _1093 = _1092 | f_fire2;
    assign _1188 = _1093 | f_fire3;
    assign _5360 = _1188 ? _5359 : _5357;
    assign _5345 = _281 == _1330;
    assign _5347 = _5345 ? _1392 : _281;
    assign _5343 = _281 == _1272;
    assign _5361 = _5343 ? _5360 : _5347;
    assign _5342 = _281 == _1271;
    assign _5364 = _5342 ? _5363 : _5361;
    assign _5131 = _1258[1:1];
    assign _5130 = _2641 == _2724;
    assign _5132 = _5130 ? _5131 : _1064;
    assign _5133 = _2639 ? _5132 : _1064;
    assign _244 = _5133;
    always @(posedge _274) begin
        if (_272)
            _1387 <= _1064;
        else
            _1387 <= _244;
    end
    assign _5366 = _1387 ? _1392 : _5364;
    assign _5140 = _5139 ? _1258 : _5136;
    assign _5141 = _2712 ? _5140 : _5136;
    assign _245 = _5141;
    always @(posedge _274) begin
        if (_272)
            _5136 <= _1280;
        else
            _5136 <= _245;
    end
    assign _5148 = _5147 ? _1258 : _5144;
    assign _5149 = _2712 ? _5148 : _5144;
    assign _246 = _5149;
    always @(posedge _274) begin
        if (_272)
            _5144 <= _1280;
        else
            _5144 <= _246;
    end
    assign _5156 = _5155 ? _1258 : _5152;
    assign _5157 = _2712 ? _5156 : _5152;
    assign _247 = _5157;
    always @(posedge _274) begin
        if (_272)
            _5152 <= _1280;
        else
            _5152 <= _247;
    end
    assign _5164 = _5163 ? _1258 : _5160;
    assign _5165 = _2712 ? _5164 : _5160;
    assign _248 = _5165;
    always @(posedge _274) begin
        if (_272)
            _5160 <= _1280;
        else
            _5160 <= _248;
    end
    assign _5331 = { _5160,
                     _5152,
                     _5144,
                     _5136 };
    assign _5329 = 32'b11111111111111111111111111111111;
    assign _5280 = 32'b11101101101110001000001100100000;
    assign _5278 = _5272[31:1];
    assign _5279 = { _1064,
                     _5278 };
    assign _5281 = _5279 ^ _5280;
    assign _5275 = _5272[31:1];
    assign _5276 = { _1064,
                     _5275 };
    assign _5268 = _5262[31:1];
    assign _5269 = { _1064,
                     _5268 };
    assign _5271 = _5269 ^ _5280;
    assign _5265 = _5262[31:1];
    assign _5266 = { _1064,
                     _5265 };
    assign _5258 = _5252[31:1];
    assign _5259 = { _1064,
                     _5258 };
    assign _5261 = _5259 ^ _5280;
    assign _5255 = _5252[31:1];
    assign _5256 = { _1064,
                     _5255 };
    assign _5248 = _5242[31:1];
    assign _5249 = { _1064,
                     _5248 };
    assign _5251 = _5249 ^ _5280;
    assign _5245 = _5242[31:1];
    assign _5246 = { _1064,
                     _5245 };
    assign _5238 = _5232[31:1];
    assign _5239 = { _1064,
                     _5238 };
    assign _5241 = _5239 ^ _5280;
    assign _5235 = _5232[31:1];
    assign _5236 = { _1064,
                     _5235 };
    assign _5228 = _5222[31:1];
    assign _5229 = { _1064,
                     _5228 };
    assign _5231 = _5229 ^ _5280;
    assign _5225 = _5222[31:1];
    assign _5226 = { _1064,
                     _5225 };
    assign _5218 = _5212[31:1];
    assign _5219 = { _1064,
                     _5218 };
    assign _5221 = _5219 ^ _5280;
    assign _5215 = _5212[31:1];
    assign _5216 = { _1064,
                     _5215 };
    assign _5208 = _5202[31:1];
    assign _5209 = { _1064,
                     _5208 };
    assign _5211 = _5209 ^ _5280;
    assign _5205 = _5202[31:1];
    assign _5206 = { _1064,
                     _5205 };
    assign _5199 = _250[127:120];
    assign _5198 = _250[119:112];
    assign _5197 = _250[111:104];
    assign _5196 = _250[103:96];
    assign _5195 = _250[95:88];
    assign _5194 = _250[87:80];
    assign _5193 = _250[79:72];
    assign _5192 = _250[71:64];
    assign _5191 = _250[63:56];
    assign _5190 = _250[55:48];
    assign _5189 = _250[47:40];
    assign _5188 = _250[39:32];
    assign _5187 = _250[31:24];
    assign _5186 = _250[23:16];
    assign _5185 = _250[15:8];
    assign _250 = ram_rec_rdata;
    assign _5184 = _250[7:0];
    assign _5181 = 13'b0000000000001;
    assign _5182 = f_sw_cnt - _5181;
    assign _5183 = _5182[3:0];
    always @* begin
        case (_5183)
        0:
            _5200 <= _5184;
        1:
            _5200 <= _5185;
        2:
            _5200 <= _5186;
        3:
            _5200 <= _5187;
        4:
            _5200 <= _5188;
        5:
            _5200 <= _5189;
        6:
            _5200 <= _5190;
        7:
            _5200 <= _5191;
        8:
            _5200 <= _5192;
        9:
            _5200 <= _5193;
        10:
            _5200 <= _5194;
        11:
            _5200 <= _5195;
        12:
            _5200 <= _5196;
        13:
            _5200 <= _5197;
        14:
            _5200 <= _5198;
        default:
            _5200 <= _5199;
        endcase
    end
    assign _5201 = { _2825,
                     _5200 };
    assign _5178 = f_sw_cnt == _1079;
    assign _5179 = ~ _5178;
    assign _5283 = _5179 ? _5282 : _5176;
    assign _5176 = _5171 ? _5329 : _5174;
    assign _5284 = f_sweeping ? _5283 : _5176;
    assign _251 = _5284;
    always @(posedge _274) begin
        if (_272)
            _5174 <= _5329;
        else
            _5174 <= _251;
    end
    assign _5202 = _5174 ^ _5201;
    assign _5203 = _5202[0:0];
    assign _5212 = _5203 ? _5211 : _5206;
    assign _5213 = _5212[0:0];
    assign _5222 = _5213 ? _5221 : _5216;
    assign _5223 = _5222[0:0];
    assign _5232 = _5223 ? _5231 : _5226;
    assign _5233 = _5232[0:0];
    assign _5242 = _5233 ? _5241 : _5236;
    assign _5243 = _5242[0:0];
    assign _5252 = _5243 ? _5251 : _5246;
    assign _5253 = _5252[0:0];
    assign _5262 = _5253 ? _5261 : _5256;
    assign _5263 = _5262[0:0];
    assign _5272 = _5263 ? _5271 : _5266;
    assign _5273 = _5272[0:0];
    assign _5282 = _5273 ? _5281 : _5276;
    assign _5330 = _5282 ^ _5329;
    assign f_sw_match = _5330 == _5331;
    assign _5333 = f_sw_last ? f_sw_match : _5328;
    assign _5335 = _5316 ? _1064 : _5333;
    assign _1355 = ~ f_sweeping;
    assign _1354 = _1353 & _1308;
    assign f_store_we = _1354 & _1355;
    assign _5324 = f_store_we | _5314;
    assign _5326 = _5324 ? _1064 : f_image_valid;
    assign _5328 = _5171 ? _1064 : _5326;
    assign _5317 = 13'b1000000000000;
    assign _5288 = f_sw_cnt + _5181;
    assign _5286 = _5171 ? _1079 : f_sw_cnt;
    assign _5289 = f_sweeping ? _5288 : _5286;
    assign _252 = _5289;
    always @(posedge _274) begin
        if (_272)
            f_sw_cnt <= _1079;
        else
            f_sw_cnt <= _252;
    end
    assign f_sw_last = f_sw_cnt == _5317;
    assign _5320 = f_sw_last ? _1064 : _5310;
    assign _5137 = _1328[3:0];
    assign _5139 = _5137 == _2834;
    assign _5292 = _5139 ? _2701 : _1064;
    assign _5146 = 4'b1001;
    assign _5145 = _1328[3:0];
    assign _5147 = _5145 == _5146;
    assign _5294 = _5147 ? _2701 : _5292;
    assign _5154 = 4'b1010;
    assign _5153 = _1328[3:0];
    assign _5155 = _5153 == _5154;
    assign _5296 = _5155 ? _2701 : _5294;
    assign _5162 = 4'b1011;
    assign _5161 = _1328[3:0];
    assign _5163 = _5161 == _5162;
    assign _5298 = _5163 ? _2701 : _5296;
    assign _2711 = _1328[4:4];
    assign _2708 = _1328[5:5];
    assign _2709 = ~ _2708;
    assign _2706 = _1242 == _1072;
    assign _2707 = _1241 & _2706;
    assign _2710 = _2707 & _2709;
    assign _2712 = _2710 & _2711;
    assign _5299 = _2712 ? _5298 : _1064;
    assign _253 = _5299;
    always @(posedge _274) begin
        if (_272)
            _5314 <= _1064;
        else
            _5314 <= _253;
    end
    assign _1365 = 4'b1111;
    assign _1364 = _1328[3:0];
    assign _1366 = _1364 == _1365;
    assign _5302 = _1366 ? _2701 : _1064;
    assign _1343 = _1242 == _1691;
    assign _1344 = _1241 & _1343;
    assign _5303 = _1344 ? _5302 : _1064;
    assign _254 = _5303;
    always @(posedge _274) begin
        if (_272)
            _1353 <= _1064;
        else
            _1353 <= _254;
    end
    assign _5311 = _1380 | _1353;
    assign _5315 = _5311 | _5314;
    assign _5316 = f_sweeping & _5315;
    assign _5322 = _5316 ? _1064 : _5320;
    assign _5170 = ~ f_sweeping;
    assign _5306 = _1258[4:4];
    assign _5305 = _2641 == _2724;
    assign _5307 = _5305 ? _5306 : _1064;
    assign _5308 = _2639 ? _5307 : _1064;
    assign _255 = _5308;
    always @(posedge _274) begin
        if (_272)
            _5168 <= _1064;
        else
            _5168 <= _255;
    end
    assign _5169 = _5168 & _1308;
    assign _5171 = _5169 & _5170;
    assign _5310 = _5171 ? _2701 : f_sweeping;
    assign _5323 = f_sweeping ? _5322 : _5310;
    assign _256 = _5323;
    always @(posedge _274) begin
        if (_272)
            f_sweeping <= _1064;
        else
            f_sweeping <= _256;
    end
    assign _5336 = f_sweeping ? _5335 : _5328;
    assign _257 = _5336;
    always @(posedge _274) begin
        if (_272)
            f_image_valid <= _1064;
        else
            f_image_valid <= _257;
    end
    assign _5339 = _1258[0:0];
    assign _2641 = _1328[3:0];
    assign _5338 = _2641 == _2724;
    assign _5340 = _5338 ? _5339 : _1064;
    assign _2637 = _1328[4:4];
    assign _2638 = ~ _2637;
    assign _2634 = _1328[5:5];
    assign _2635 = ~ _2634;
    assign _2632 = _1242 == _1072;
    assign _1240 = ~ _1239;
    assign _1235 = _1229 & _1234;
    assign _1241 = _1235 & _1240;
    assign _2633 = _1241 & _2632;
    assign _2636 = _2633 & _2635;
    assign _2639 = _2636 & _2638;
    assign _5341 = _2639 ? _5340 : _1064;
    assign _258 = _5341;
    always @(posedge _274) begin
        if (_272)
            _1380 <= _1064;
        else
            _1380 <= _258;
    end
    assign _1384 = _1380 & f_image_valid;
    assign _5368 = _1384 ? _1271 : _5366;
    assign _259 = _5368;
    always @(posedge _274) begin
        if (_272)
            _281 <= _1392;
        else
            _281 <= _259;
    end
    assign _1308 = _281 == _1392;
    assign _1590 = ~ _1308;
    assign _260 = _1590;
    assign _5432 = { _260,
                     _100,
                     _98,
                     _91,
                     _5430,
                     _5431,
                     _88,
                     _87 };
    assign _5429 = _1328[3:0];
    always @* begin
        case (_5429)
        0:
            _5450 <= _5432;
        1:
            _5450 <= _5434;
        2:
            _5450 <= _5436;
        3:
            _5450 <= _5438;
        4:
            _5450 <= _1458;
        5:
            _5450 <= _603;
        6:
            _5450 <= _5439;
        7:
            _5450 <= _5441;
        8:
            _5450 <= _5442;
        9:
            _5450 <= _5443;
        10:
            _5450 <= _5444;
        11:
            _5450 <= _5445;
        12:
            _5450 <= _5446;
        13:
            _5450 <= _5447;
        14:
            _5450 <= _1280;
        default:
            _5450 <= _1280;
        endcase
    end
    assign _5428 = _1328[4:4];
    assign _5462 = _5428 ? _5461 : _5450;
    assign _5387 = _1328[15:3];
    assign _5389 = { _5387,
                     _1072 };
    assign _5386 = _1328 + _5102;
    assign _5381 = _1328[2:0];
    assign _5383 = _5381 == _1715;
    assign _5380 = _1242 == _1703;
    assign _5384 = _5380 & _5383;
    assign _5390 = _5384 ? _5389 : _5386;
    assign _5376 = _1328[15:8];
    assign _5377 = { _5376,
                     _1258 };
    assign _5373 = _1328[7:0];
    assign _5374 = { _1258,
                     _5373 };
    assign _5372 = _1232 == _1271;
    assign _5375 = _5372 ? _5374 : _1328;
    assign _5370 = _1232 == _1272;
    assign _5378 = _5370 ? _5377 : _5375;
    assign _5391 = _1234 ? _5390 : _5378;
    assign _5392 = _1229 ? _5391 : _1328;
    assign _261 = _5392;
    always @(posedge _274) begin
        if (_272)
            _1328 <= _1171;
        else
            _1328 <= _261;
    end
    assign _5427 = _1328[5:5];
    assign _5471 = _5427 ? _5470 : _5462;
    assign _1242 = _1238[2:0];
    always @* begin
        case (_1242)
        0:
            _5494 <= _5471;
        1:
            _5494 <= _1280;
        2:
            _5494 <= _5478;
        3:
            _5494 <= _5488;
        4:
            _5494 <= _1280;
        5:
            _5494 <= _5491;
        6:
            _5494 <= _1280;
        default:
            _5494 <= _1280;
        endcase
    end
    assign _263 = mosi;
    always @(posedge _274) begin
        if (_272)
            _1254 <= _1064;
        else
            _1254 <= _263;
    end
    always @(posedge _274) begin
        if (_272)
            _1257 <= _1064;
        else
            _1257 <= _1254;
    end
    assign _5393 = _1258[6:0];
    assign _5394 = _1223 ? _5393 : _1251;
    assign _264 = _5394;
    always @(posedge _274) begin
        if (_272)
            _1251 <= _1267;
        else
            _1251 <= _264;
    end
    assign _1258 = { _1251,
                     _1257 };
    assign _5400 = _1232 == _1392;
    assign _5401 = _5400 ? _1258 : _1238;
    assign _5402 = _1229 ? _5401 : _1238;
    assign _5404 = _5398 ? _1280 : _5402;
    assign _265 = _5404;
    always @(posedge _274) begin
        if (_272)
            _1238 <= _1280;
        else
            _1238 <= _265;
    end
    assign _1239 = _1238[7:7];
    assign _5409 = _1232 + _1271;
    assign _5406 = _1232 == _1330;
    assign _5407 = ~ _5406;
    assign _5410 = _5407 ? _5409 : _1232;
    assign _1228 = _1226 == _1727;
    assign _1229 = _1223 & _1228;
    assign _5411 = _1229 ? _5410 : _1232;
    assign _5413 = _5398 ? _1392 : _5411;
    assign _266 = _5413;
    always @(posedge _274) begin
        if (_272)
            _1232 <= _1392;
        else
            _1232 <= _266;
    end
    assign _1234 = _1232 == _1330;
    assign _5425 = _1234 & _1239;
    assign _5495 = _5425 ? _5494 : _1280;
    assign _5422 = _5421[6:0];
    assign _5424 = { _5422,
                     _1064 };
    assign _5415 = _1226 + _1691;
    assign _1222 = ~ _1221;
    assign _1218 = _1211 & _1217;
    assign _1223 = _1218 & _1222;
    assign _5416 = _1223 ? _5415 : _1226;
    assign _5418 = _5398 ? _1072 : _5416;
    assign _267 = _5418;
    always @(posedge _274) begin
        if (_272)
            _1226 <= _1072;
        else
            _1226 <= _267;
    end
    assign _2828 = _1226 == _1072;
    assign _5496 = _2828 ? _5495 : _5424;
    always @(posedge _274) begin
        if (_272)
            _1221 <= _1064;
        else
            _1221 <= _1217;
    end
    assign _269 = sck;
    always @(posedge _274) begin
        if (_272)
            _1214 <= _1064;
        else
            _1214 <= _269;
    end
    always @(posedge _274) begin
        if (_272)
            _1217 <= _1064;
        else
            _1217 <= _1214;
    end
    assign _2821 = ~ _1217;
    assign _2822 = _1211 & _2821;
    assign _2823 = _2822 & _1221;
    assign _5497 = _2823 ? _5496 : _5421;
    assign _5397 = ~ _1210;
    always @(posedge _274) begin
        if (_272)
            _5396 <= vdd;
        else
            _5396 <= _1210;
    end
    assign _5398 = _5396 & _5397;
    assign _5501 = _5398 ? _5500 : _5497;
    assign _270 = _5501;
    always @(posedge _274) begin
        if (_272)
            _5421 <= _1280;
        else
            _5421 <= _270;
    end
    assign _5502 = _5421[7:7];
    assign vdd = 1'b1;
    assign _272 = clear;
    assign _274 = clock;
    assign _276 = cs_n;
    always @(posedge _274) begin
        if (_272)
            _1208 <= vdd;
        else
            _1208 <= _276;
    end
    always @(posedge _274) begin
        if (_272)
            _1210 <= vdd;
        else
            _1210 <= _1208;
    end
    assign _1211 = ~ _1210;
    assign _5503 = _1211 & _5502;
    assign miso = _5503;
    assign irq = _1661;
    assign viol = _1634;
    assign entry = f_in_fetch;
    assign dbg = _1629;
    assign pins_out = _1577;
    assign pins_oe = _1551;
    assign ram_rec_addr = _1377;
    assign ram_rec_re = _1360;
    assign ram_rec_we = f_store_we;
    assign ram_rec_wdata = _1347;
    assign ram_cov_addr = _1341;
    assign ram_cov_re = _1322;
    assign ram_cov_we = _1319;
    assign ram_cov_wdata = _1303;

endmodule
