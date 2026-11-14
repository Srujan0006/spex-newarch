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

    wire [11:0] _1300;
    wire _1297;
    wire _1298;
    wire [11:0] _1299;
    wire _1301;
    wire [11:0] _1302;
    wire [11:0] _1303;
    wire [11:0] _1289;
    wire [11:0] _1087;
    wire [11:0] _1084;
    wire [12:0] _1081;
    wire [9:0] _1078;
    wire [12:0] _1079;
    wire [12:0] _1080;
    wire [2:0] _1074;
    reg [2:0] _1054;
    wire [2:0] _1;
    reg [2:0] _1075;
    wire [12:0] _1076;
    wire [12:0] _1061;
    wire [12:0] _1060;
    wire [15:0] _1055;
    wire _1059;
    wire [12:0] _1062;
    wire [12:0] _2;
    reg [12:0] _1071;
    wire _1077;
    wire [12:0] _1082;
    wire [12:0] _1068;
    wire _1083;
    wire [11:0] _1086;
    wire _1066;
    wire [15:0] _1063;
    wire _1064;
    wire _3;
    reg _1067;
    wire [11:0] _1088;
    wire [11:0] _4;
    reg [11:0] _1290;
    wire [11:0] _1091;
    reg [1:0] _1057;
    reg [15:0] _1058;
    wire [15:0] _1089;
    wire _1090;
    wire [11:0] _1093;
    wire [11:0] _5;
    reg [11:0] _1287;
    wire _1291;
    wire _1292;
    wire [11:0] _1293;
    wire [11:0] _1284;
    wire _1294;
    wire [11:0] _1295;
    wire [7:0] _1282;
    wire _1283;
    wire [11:0] _1296;
    wire [7:0] _1280;
    wire [7:0] _1279;
    wire [1:0] _1274;
    wire [1:0] _1273;
    wire _1207;
    wire _1199;
    wire _1208;
    wire _6;
    reg _1272;
    wire [1:0] _1275;
    wire [6:0] _1269;
    wire [8:0] _1276;
    wire [7:0] _1267;
    wire [8:0] _1268;
    wire [8:0] _1277;
    wire _1278;
    wire [7:0] _1281;
    wire [31:0] _1304;
    wire [31:0] _1249;
    wire [23:0] _1261;
    wire [31:0] _1262;
    wire [31:0] _1263;
    wire [31:0] _7;
    reg [31:0] _1250;
    wire [31:0] _1305;
    wire _1321;
    wire _1319;
    wire _1314;
    wire _1312;
    wire _1311;
    wire _1313;
    wire _1315;
    wire f_host_cov_we;
    wire _1323;
    wire _1322;
    wire _1324;
    wire [7:0] _11;
    reg [7:0] _1342;
    wire [7:0] _1334;
    wire [7:0] _1335;
    wire [7:0] _1336;
    wire [7:0] _12;
    reg [7:0] _1327;
    wire [7:0] _1337;
    wire [7:0] _1338;
    wire [7:0] _1339;
    wire [7:0] _1343;
    wire [127:0] _1348;
    wire [119:0] _1350;
    wire [127:0] _1351;
    wire [127:0] _1352;
    wire [127:0] _14;
    reg [127:0] _1349;
    wire _1362;
    wire [1:0] _1377;
    wire [7:0] _1378;
    wire [7:0] _1375;
    wire [7:0] _1369;
    wire [7:0] _1370;
    wire [7:0] _1371;
    wire [7:0] _18;
    reg [7:0] _1365;
    wire [7:0] _1376;
    wire [2:0] _1359;
    wire _1360;
    wire _1361;
    wire [7:0] _1379;
    wire [7:0] _1551;
    wire [7:0] _1552;
    wire [7:0] _1415;
    wire [7:0] _1413;
    wire [7:0] _1412;
    wire [7:0] _1411;
    wire [7:0] _1410;
    reg [7:0] _1414;
    wire [7:0] _1416;
    wire [7:0] _1417;
    wire [7:0] _1408;
    wire [7:0] _1409;
    wire [7:0] _1418;
    wire [7:0] _1452;
    wire [7:0] _1453;
    wire [7:0] _1455;
    wire [7:0] _1457;
    wire [7:0] _20;
    reg [7:0] f_poe;
    wire [7:0] _1553;
    wire [7:0] _1578;
    wire _1548;
    wire _1547;
    wire _1545;
    wire _1546;
    wire _1544;
    wire _1543;
    wire _1542;
    wire [2:0] _1541;
    reg _1549;
    wire _1539;
    wire _1538;
    wire _1536;
    wire _1537;
    wire _1535;
    wire _1534;
    wire _1533;
    wire [2:0] _1532;
    reg _1540;
    wire _1530;
    wire _1529;
    wire _1527;
    wire _1528;
    wire _1526;
    wire _1525;
    wire _1524;
    wire [2:0] _1523;
    reg _1531;
    wire _1521;
    wire _1520;
    wire _1518;
    wire _1519;
    wire _1517;
    wire _1516;
    wire _1515;
    wire [2:0] _1514;
    reg _1522;
    wire _1512;
    wire _1511;
    wire _1509;
    wire _1510;
    wire _1508;
    wire _1507;
    wire _1506;
    wire [2:0] _1505;
    reg _1513;
    wire _1503;
    wire _1502;
    wire _1500;
    wire _1501;
    wire _1499;
    wire _1498;
    wire _1497;
    wire [2:0] _1496;
    reg _1504;
    wire _1494;
    wire _1493;
    wire _1491;
    wire _1492;
    wire _1490;
    wire _1489;
    wire _1488;
    wire [2:0] _1487;
    reg _1495;
    wire _1485;
    wire _1484;
    wire _1480;
    wire _1481;
    wire _1479;
    wire _1478;
    wire [2:0] _1570;
    wire _1567;
    wire [1:0] _1568;
    wire [3:0] _1569;
    wire [6:0] _1571;
    wire [7:0] _1572;
    wire [7:0] _1573;
    wire _1449;
    wire _1448;
    wire _1447;
    wire _1445;
    wire _1446;
    wire _1443;
    wire _1444;
    wire _1440;
    wire _1441;
    wire _1442;
    wire _1437;
    wire _1438;
    wire _1439;
    wire _1434;
    wire _1433;
    wire _1435;
    wire _1432;
    wire _1436;
    wire [7:0] _1450;
    wire _1419;
    wire _1425;
    wire [7:0] _1451;
    wire [7:0] _1565;
    wire [7:0] _1561;
    wire [7:0] _1559;
    wire [7:0] _1558;
    wire [7:0] _1557;
    wire [7:0] _1556;
    reg [7:0] _1560;
    wire [7:0] _1562;
    wire [7:0] _1563;
    wire [7:0] _1406;
    wire [7:0] _1404;
    wire [7:0] _1403;
    wire [7:0] _1402;
    wire [7:0] _1401;
    reg [7:0] _1405;
    wire [7:0] _1407;
    wire [7:0] _1554;
    wire [7:0] _1555;
    wire [7:0] _1564;
    wire [7:0] _1566;
    wire [7:0] _1574;
    wire [1:0] _1394;
    wire _1395;
    wire _1396;
    wire _1397;
    wire [7:0] _1575;
    wire [7:0] _1577;
    wire [7:0] _22;
    reg [7:0] f_pout;
    wire _1475;
    wire [23:0] _1470;
    wire [2:0] _1471;
    reg _1486;
    wire [7:0] _1550;
    wire [7:0] _1579;
    reg [1:0] _1623;
    wire [3:0] _1630;
    reg _1589;
    wire [3:0] _1596;
    reg [1:0] _1585;
    wire [1:0] _1582;
    wire [3:0] _1586;
    wire [3:0] _1581;
    wire [1:0] _1580;
    reg [3:0] _1631;
    reg _1636;
    wire _5561;
    wire _5560;
    wire [7:0] _5562;
    wire [2:0] _1729;
    wire _1730;
    wire _1731;
    reg [7:0] _1732;
    wire [2:0] _1723;
    wire _1724;
    wire _1725;
    reg [7:0] _1726;
    wire [2:0] _1717;
    wire _1718;
    wire _1719;
    reg [7:0] _1720;
    wire _1712;
    wire _1713;
    reg [7:0] _1714;
    wire [2:0] _1705;
    wire _1706;
    wire _1707;
    reg [7:0] _1708;
    wire [2:0] _1699;
    wire _1700;
    wire _1701;
    reg [7:0] _1702;
    wire [2:0] _1693;
    wire _1694;
    wire _1695;
    reg [7:0] _1696;
    wire [2:0] _1670;
    wire [2:0] _1671;
    wire [2:0] _28;
    reg [2:0] _1668;
    wire _1688;
    wire _1689;
    reg [7:0] _1690;
    wire [2:0] _1683;
    wire [2:0] _1684;
    wire [2:0] _29;
    reg [2:0] _1681;
    reg [7:0] _1733;
    wire [7:0] _30;
    wire [7:0] _5553;
    wire [7:0] _5547;
    wire [7:0] _5546;
    wire [7:0] _5545;
    wire [7:0] _5544;
    wire [7:0] _5543;
    wire _2093;
    wire _2094;
    wire [47:0] _2091;
    reg [47:0] _2095;
    wire _2087;
    wire _2088;
    reg [47:0] _2089;
    wire _2081;
    wire _2082;
    reg [47:0] _2083;
    wire _2075;
    wire _2076;
    reg [47:0] _2077;
    wire _2069;
    wire _2070;
    reg [47:0] _2071;
    wire _2063;
    wire _2064;
    reg [47:0] _2065;
    wire _2057;
    wire _2058;
    reg [47:0] _2059;
    wire [2:0] _1742;
    wire [2:0] _1743;
    wire [2:0] _31;
    reg [2:0] _1740;
    wire _2051;
    wire _2052;
    wire [1:0] _1618;
    wire [1:0] _1620;
    wire [2:0] _2034;
    wire [28:0] _1751;
    wire [28:0] _1750;
    wire [28:0] _1753;
    wire [28:0] _1754;
    wire [2:0] _1747;
    wire _1749;
    wire [28:0] _1755;
    wire [28:0] _32;
    reg [28:0] ts_hi_m1;
    wire [28:0] _2032;
    wire [2:0] _1773;
    wire _1769;
    wire _1770;
    wire _1767;
    wire _1771;
    wire [2:0] _1774;
    wire _1764;
    wire _1765;
    wire _1762;
    wire _1761;
    wire _1763;
    wire _1766;
    wire [2:0] _1776;
    wire _1757;
    wire [2:0] _1777;
    wire [2:0] _33;
    reg [2:0] _1760;
    wire _2023;
    wire [2:0] _2025;
    wire [2:0] _1794;
    wire _1790;
    wire _1791;
    wire _1788;
    wire _1792;
    wire [2:0] _1795;
    wire _1785;
    wire _1786;
    wire _1783;
    wire _1782;
    wire _1784;
    wire _1787;
    wire [2:0] _1797;
    wire _1778;
    wire [2:0] _1798;
    wire [2:0] _34;
    reg [2:0] _1781;
    wire _2020;
    wire [2:0] _2022;
    wire [2:0] _2026;
    wire [2:0] _1815;
    wire _1811;
    wire _1812;
    wire _1809;
    wire _1813;
    wire [2:0] _1816;
    wire _1806;
    wire _1807;
    wire _1804;
    wire _1803;
    wire _1805;
    wire _1808;
    wire [2:0] _1818;
    wire _1799;
    wire [2:0] _1819;
    wire [2:0] _35;
    reg [2:0] _1802;
    wire _2016;
    wire [2:0] _2018;
    wire [2:0] _1836;
    wire _1832;
    wire _1833;
    wire _1830;
    wire _1834;
    wire [2:0] _1837;
    wire _1827;
    wire _1828;
    wire _1825;
    wire _1824;
    wire _1826;
    wire _1829;
    wire [2:0] _1839;
    wire _1820;
    wire [2:0] _1840;
    wire [2:0] _36;
    reg [2:0] _1823;
    wire _2013;
    wire [2:0] _2015;
    wire [2:0] _2019;
    wire [2:0] _2027;
    wire [2:0] _1857;
    wire _1853;
    wire _1854;
    wire _1851;
    wire _1855;
    wire [2:0] _1858;
    wire _1848;
    wire _1849;
    wire _1846;
    wire _1845;
    wire _1847;
    wire _1850;
    wire [2:0] _1860;
    wire _1841;
    wire [2:0] _1861;
    wire [2:0] _37;
    reg [2:0] _1844;
    wire _2008;
    wire [2:0] _2010;
    wire [2:0] _1878;
    wire _1874;
    wire _1875;
    wire _1872;
    wire _1876;
    wire [2:0] _1879;
    wire _1869;
    wire _1870;
    wire _1867;
    wire _1866;
    wire _1868;
    wire _1871;
    wire [2:0] _1881;
    wire _1862;
    wire [2:0] _1882;
    wire [2:0] _38;
    reg [2:0] _1865;
    wire _2005;
    wire [2:0] _2007;
    wire [2:0] _2011;
    wire [2:0] _1899;
    wire _1895;
    wire _1896;
    wire _1893;
    wire _1897;
    wire [2:0] _1900;
    wire _1890;
    wire _1891;
    wire _1888;
    wire _1887;
    wire _1889;
    wire _1892;
    wire [2:0] _1902;
    wire _1883;
    wire [2:0] _1903;
    wire [2:0] _39;
    reg [2:0] _1886;
    wire _2001;
    wire [2:0] _2003;
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
    wire [2:0] _40;
    reg [2:0] _1907;
    wire _1998;
    wire [2:0] _2000;
    wire [2:0] _2004;
    wire [2:0] _2012;
    wire [2:0] _2028;
    wire _1993;
    wire _1992;
    wire _1994;
    wire _1990;
    wire _1989;
    wire _1991;
    wire _1995;
    wire _1986;
    wire _1985;
    wire _1987;
    wire _1983;
    wire _1982;
    wire _1984;
    wire _1988;
    wire _1996;
    wire [2:0] _2029;
    wire _1971;
    wire _1970;
    wire _1972;
    wire [2:0] _1974;
    wire _1966;
    wire _1965;
    wire _1967;
    wire [2:0] _1969;
    wire _1975;
    wire [2:0] _1976;
    wire _1959;
    wire _1958;
    wire _1960;
    wire [2:0] _1962;
    wire _1954;
    wire _1953;
    wire _1955;
    wire [2:0] _1957;
    wire _1963;
    wire [2:0] _1964;
    wire _1977;
    wire [2:0] _1978;
    wire _1945;
    wire _1944;
    wire _1946;
    wire [2:0] _1948;
    wire _1940;
    wire _1939;
    wire _1941;
    wire [2:0] _1943;
    wire _1949;
    wire [2:0] _1950;
    wire _1933;
    wire _1932;
    wire _1934;
    wire [2:0] _1936;
    wire _1928;
    wire _1927;
    wire _1929;
    wire [2:0] _1931;
    wire _1937;
    wire [2:0] _1938;
    wire _1951;
    wire [2:0] _1952;
    wire _1979;
    wire [2:0] _1980;
    wire [2:0] _1981;
    wire [2:0] _2030;
    wire [2:0] _1925;
    wire _2031;
    wire [28:0] _2033;
    wire [31:0] _2035;
    wire [47:0] _2036;
    wire [47:0] _41;
    reg [47:0] _2053;
    wire [2:0] _2046;
    wire [2:0] _2047;
    wire [2:0] _42;
    reg [2:0] _2044;
    reg [47:0] _2096;
    wire [47:0] _43;
    wire [7:0] _5542;
    wire [2:0] _5541;
    reg [7:0] _5548;
    wire [7:0] _5550;
    wire [7:0] _5539;
    wire [7:0] _5538;
    wire [7:0] _5537;
    wire [31:0] _45;
    wire _2097;
    wire _2098;
    wire [31:0] _2100;
    wire [31:0] _46;
    wire [7:0] _5536;
    wire [1:0] _5535;
    reg [7:0] _5540;
    wire [7:0] _5530;
    wire [7:0] _5529;
    wire [7:0] _5528;
    wire [7:0] _5527;
    wire [7:0] _2336;
    wire [7:0] _2337;
    wire _2333;
    wire _2334;
    wire _2326;
    wire _2323;
    wire _2324;
    wire _2320;
    wire _2317;
    wire _2318;
    wire _2319;
    wire _2321;
    wire _2325;
    wire _2327;
    wire _2313;
    wire _2328;
    wire _2335;
    wire [7:0] _2338;
    wire [7:0] _2340;
    wire [7:0] _47;
    reg [7:0] _2331;
    wire [7:0] _2580;
    wire _2576;
    wire _2577;
    wire _2569;
    wire _2566;
    wire _2567;
    wire _2563;
    wire _2560;
    wire _2561;
    wire _2562;
    wire _2564;
    wire _2568;
    wire _2570;
    wire _2312;
    wire _2555;
    wire _2556;
    wire _2571;
    wire _2578;
    wire [7:0] _2581;
    wire [7:0] _2583;
    wire [7:0] _48;
    reg [7:0] _2574;
    wire [7:0] _2616;
    wire _2612;
    wire _2613;
    wire _2606;
    wire _2607;
    wire _2614;
    wire [7:0] _2617;
    wire [7:0] _2619;
    wire [7:0] _49;
    reg [7:0] _2610;
    wire [7:0] _2629;
    wire _2625;
    wire _2626;
    wire _2627;
    wire [7:0] _2630;
    wire [7:0] _2632;
    wire [7:0] _50;
    reg [7:0] _2623;
    wire [7:0] _2661;
    wire _2657;
    wire _2658;
    wire _2659;
    wire [7:0] _2662;
    wire _2646;
    wire _2645;
    wire _2647;
    wire _2648;
    wire _51;
    reg _2103;
    wire [7:0] _2664;
    wire [7:0] _52;
    reg [7:0] _2655;
    wire [39:0] _2665;
    wire [39:0] _53;
    wire [7:0] _5526;
    wire [2:0] _5525;
    reg [7:0] _5532;
    wire [2:0] _5521;
    wire [3:0] _5520;
    wire [7:0] _5522;
    wire [7:0] _5519;
    wire [7:0] _5518;
    wire [7:0] _5517;
    wire [4:0] _5514;
    wire _2703;
    wire _2681;
    wire _2699;
    wire _2704;
    wire _2706;
    wire _54;
    reg _2702;
    wire _55;
    wire _56;
    wire _57;
    wire [7:0] _5515;
    wire [3:0] _2716;
    wire [3:0] _2715;
    wire _2717;
    wire [7:0] _2718;
    wire [7:0] _2719;
    wire [7:0] _58;
    reg [7:0] _1463;
    wire [3:0] _2721;
    wire [3:0] _2720;
    wire _2722;
    wire [7:0] _2723;
    wire [7:0] _2724;
    wire [7:0] _59;
    reg [7:0] _1466;
    wire [3:0] _2726;
    wire [3:0] _2725;
    wire _2727;
    wire [7:0] _2728;
    wire [7:0] _2729;
    wire [7:0] _60;
    reg [7:0] _1469;
    wire [3:0] _5513;
    reg [7:0] _5523;
    wire [7:0] _5509;
    wire [2:0] _2769;
    wire [2:0] _2751;
    wire [2:0] _2752;
    wire [2:0] _2770;
    wire [2:0] _2772;
    wire [2:0] _2774;
    wire [2:0] _61;
    reg [2:0] _2748;
    wire [7:0] _2821;
    wire [2:0] _2814;
    wire [2:0] _2796;
    wire [2:0] _2797;
    wire [2:0] _2815;
    wire [2:0] _2817;
    wire [2:0] _2819;
    wire [2:0] _62;
    reg [2:0] _2793;
    wire [7:0] _2820;
    wire [15:0] _2822;
    wire [15:0] _63;
    wire [7:0] _5508;
    wire [7:0] _5507;
    wire [7:0] _5506;
    wire [23:0] _2827;
    wire [23:0] _2839;
    wire [3:0] _2836;
    wire [3:0] _2835;
    wire _2837;
    wire _2833;
    wire _2831;
    wire _2834;
    wire _2838;
    wire [23:0] _2840;
    wire [23:0] _2841;
    wire [23:0] _2842;
    wire [23:0] _64;
    reg [23:0] _2828;
    wire [7:0] _5505;
    wire [31:0] _2843;
    wire [31:0] _2844;
    wire [31:0] _65;
    reg [31:0] ts_reg;
    wire [31:0] _66;
    wire [7:0] _5504;
    wire [5:0] _67;
    wire [7:0] _5503;
    wire [2:0] _2910;
    wire [2:0] _2912;
    wire [2:0] _68;
    reg [2:0] _2909;
    wire [2:0] _69;
    wire _2905;
    wire [2:0] _2895;
    wire [2:0] _2892;
    wire [2:0] _2896;
    wire [2:0] _2889;
    wire [2:0] _2897;
    wire _2883;
    wire _2877;
    wire _2878;
    wire _2879;
    wire _2884;
    wire _2873;
    wire _2874;
    wire _2869;
    wire _2871;
    wire _2920;
    wire _2922;
    wire [1:0] _2924;
    wire _2917;
    wire _2919;
    wire [1:0] _2926;
    wire [1:0] _2927;
    wire [1:0] _70;
    reg [1:0] _2865;
    wire _2866;
    wire _2868;
    wire _2872;
    wire _2875;
    wire _71;
    reg _1266;
    wire _2859;
    wire _2858;
    wire _2860;
    wire _2856;
    wire _2853;
    wire _2848;
    wire _2849;
    wire _2850;
    wire _2851;
    wire _2854;
    wire [1:0] _1332;
    wire [1:0] _1331;
    wire _1333;
    wire _2930;
    wire _1246;
    wire _1247;
    wire _2931;
    wire _72;
    reg _1308;
    wire _2855;
    wire _2857;
    wire _2861;
    wire _2845;
    wire _2846;
    wire _2862;
    wire _2876;
    wire _2885;
    wire [2:0] _2898;
    wire _2900;
    wire _2901;
    wire _2906;
    wire _2938;
    wire _2934;
    wire _2933;
    wire _2935;
    wire _2936;
    wire _73;
    reg _2668;
    wire _2940;
    wire _74;
    reg _2904;
    wire _75;
    wire _76;
    wire [7:0] _77;
    reg [7:0] _1206;
    wire [7:0] _1203;
    wire _2650;
    wire _2651;
    wire _2941;
    wire _2942;
    wire _78;
    reg _1198;
    wire _1194;
    wire _1195;
    wire _2649;
    wire _2652;
    wire _2944;
    wire _2946;
    wire _79;
    reg _1629;
    wire _80;
    wire _2620;
    wire _2951;
    wire _2953;
    wire _81;
    reg _2949;
    wire _82;
    wire _2957;
    wire _2604;
    wire _2597;
    wire _2605;
    wire _2553;
    wire _2549;
    wire _2554;
    wire _2954;
    wire _83;
    wire _2955;
    wire _2956;
    wire _2958;
    wire _2960;
    wire _2962;
    wire _84;
    reg _1626;
    wire _85;
    wire [7:0] _5501;
    wire [3:0] _2963;
    wire _2964;
    wire [7:0] _2965;
    wire [7:0] _2966;
    wire [7:0] _86;
    reg [7:0] _1460;
    wire [7:0] _5500;
    wire [7:0] _5498;
    wire [7:0] _5496;
    wire _87;
    wire _88;
    wire _89;
    wire _5493;
    wire _90;
    wire _5492;
    wire _1590;
    wire _1591;
    wire _91;
    wire _2975;
    wire _2976;
    wire _2978;
    wire _2969;
    wire _2968;
    wire _2970;
    wire _2971;
    wire _92;
    reg _2974;
    wire _2980;
    wire _2982;
    wire _93;
    reg _1662;
    wire [3:0] _2999;
    wire [3:0] _2997;
    wire [3:0] _3000;
    wire _2040;
    wire [2:0] _2988;
    wire _2990;
    wire _2986;
    wire _2987;
    wire _2991;
    wire _2994;
    wire _94;
    reg _2039;
    wire _2041;
    wire _1735;
    wire _1736;
    wire _95;
    wire _1737;
    wire _2995;
    wire [3:0] _3001;
    reg [3:0] _3004;
    wire [3:0] _96;
    wire _1656;
    wire _1657;
    wire [2:0] _1649;
    wire [3:0] _1650;
    wire _1651;
    wire _1652;
    wire _1648;
    wire _1653;
    wire [2:0] _3009;
    wire [3:0] _3008;
    wire [6:0] _3010;
    wire [3:0] _3006;
    wire [3:0] _3005;
    wire _3007;
    wire [6:0] _3011;
    wire [6:0] _3012;
    wire [6:0] _97;
    reg [6:0] _1639;
    wire [2:0] _1640;
    wire _1642;
    wire [2:0] _1644;
    wire [3:0] _1645;
    wire _1646;
    wire _1647;
    wire _1654;
    wire _1658;
    wire _1659;
    wire _1663;
    wire _98;
    wire _3018;
    wire _3020;
    wire _3016;
    wire _3022;
    wire _3023;
    wire _3024;
    wire _3014;
    wire _3025;
    wire _3027;
    wire _99;
    reg _1595;
    wire _100;
    wire [1:0] _5425;
    wire [1:0] _5421;
    wire _5412;
    wire [1:0] _5414;
    wire _5411;
    wire [1:0] _5416;
    wire _5410;
    wire [1:0] _5418;
    wire [1:0] _5419;
    wire [7:0] _1185;
    wire _1187;
    wire _1178;
    wire [15:0] _1173;
    wire _1174;
    wire _1175;
    wire _1172;
    wire _1176;
    wire _1179;
    wire [3:0] _1169;
    wire _1171;
    wire _1180;
    wire _1167;
    wire _1163;
    wire _1164;
    wire _1161;
    wire _1165;
    wire _1168;
    wire _1159;
    reg [2:0] _1053;
    wire [15:0] _1154;
    wire _1155;
    wire _1152;
    wire _1156;
    wire _1150;
    wire _1157;
    wire _1160;
    wire [1:0] _1149;
    reg _1181;
    wire _1148;
    wire _1182;
    wire _1145;
    wire [3:0] _1143;
    reg _1144;
    wire _1146;
    wire [15:0] _1138;
    wire _1140;
    wire [16:0] _1133;
    wire [15:0] _1129;
    wire [16:0] _1130;
    wire [16:0] _1131;
    reg [16:0] _1134;
    wire _1135;
    wire _1136;
    wire [15:0] _1125;
    wire _1127;
    wire _1042;
    wire [2:0] _1044;
    wire _1039;
    wire [2:0] _1041;
    wire _1045;
    wire [2:0] _1046;
    wire _1034;
    wire [2:0] _1036;
    wire _1031;
    wire [2:0] _1033;
    wire _1037;
    wire [2:0] _1038;
    wire _1047;
    wire [2:0] _1048;
    wire _1024;
    wire [2:0] _1026;
    wire _1021;
    wire [2:0] _1023;
    wire _1027;
    wire [2:0] _1028;
    wire _1016;
    wire [2:0] _1018;
    wire [7:0] _1012;
    wire _1013;
    wire [2:0] _1015;
    wire _1019;
    wire [2:0] _1020;
    wire _1029;
    wire [2:0] _1030;
    wire _1049;
    wire [2:0] _1050;
    wire [13:0] _1117;
    wire [16:0] _1118;
    wire [111:0] _1011;
    wire [15:0] _1115;
    wire [16:0] _1116;
    wire [16:0] _1119;
    reg [16:0] _1122;
    wire [16:0] _1114;
    wire _1123;
    wire _1124;
    wire _1128;
    wire _1137;
    wire [1:0] _1056;
    reg [15:0] _1111;
    wire _1113;
    wire _1141;
    wire [7:0] _1105;
    wire _1107;
    wire _1108;
    wire _1104;
    wire _1109;
    wire [7:0] _1098;
    wire [7:0] _1096;
    wire [7:0] _1097;
    wire [7:0] _1099;
    wire _1101;
    wire _1102;
    wire _1110;
    wire _1142;
    wire _1147;
    wire _1183;
    wire _1184;
    wire _1188;
    wire f_fire3;
    wire [7:0] _690;
    wire _692;
    wire _678;
    wire _674;
    wire _675;
    wire _672;
    wire _676;
    wire _679;
    wire [3:0] _669;
    wire _671;
    wire _680;
    wire _667;
    wire _663;
    wire _664;
    wire _661;
    wire _665;
    wire _668;
    wire _659;
    reg [2:0] _653;
    wire [15:0] _654;
    wire _655;
    wire _649;
    wire _656;
    wire _647;
    wire _657;
    wire _660;
    wire [1:0] _646;
    reg _681;
    wire _645;
    wire _682;
    wire _637;
    wire [3:0] _580;
    reg _636;
    wire _638;
    wire [15:0] _575;
    wire _577;
    wire [15:0] _566;
    wire [16:0] _567;
    wire [16:0] _568;
    reg [16:0] _571;
    wire _572;
    wire _573;
    wire [15:0] _562;
    wire _564;
    wire _528;
    wire [2:0] _548;
    wire _507;
    wire [2:0] _527;
    wire _549;
    wire [2:0] _550;
    wire _484;
    wire [2:0] _504;
    wire _463;
    wire [2:0] _483;
    wire _505;
    wire [2:0] _506;
    wire _551;
    wire [2:0] _552;
    wire _438;
    wire [2:0] _458;
    wire _417;
    wire [2:0] _437;
    wire _459;
    wire [2:0] _460;
    wire _394;
    wire [2:0] _414;
    wire [7:0] _372;
    wire _373;
    wire [2:0] _393;
    wire _415;
    wire [2:0] _416;
    wire _461;
    wire [2:0] _462;
    wire _553;
    wire [2:0] _554;
    wire [16:0] _555;
    wire [111:0] _368;
    wire [15:0] _369;
    wire [16:0] _370;
    wire [16:0] _556;
    reg [16:0] _559;
    wire [16:0] _345;
    wire _560;
    wire _561;
    wire _565;
    wire _574;
    wire [1:0] _331;
    reg [15:0] _341;
    wire _343;
    wire _578;
    wire [7:0] _325;
    wire _327;
    wire _328;
    wire _316;
    wire _329;
    wire [7:0] _309;
    wire [7:0] _307;
    wire [7:0] _308;
    wire [7:0] _310;
    wire _312;
    wire [2:0] _5182;
    wire [5:0] _1201;
    wire [5:0] _3033;
    wire _3032;
    wire [5:0] _3034;
    wire [5:0] _3035;
    wire [5:0] _101;
    reg [5:0] _3030;
    wire [5:0] _3060;
    wire [5:0] _3041;
    wire [3:0] _3039;
    wire _3040;
    wire [5:0] _3042;
    wire [5:0] _3043;
    wire [5:0] _102;
    reg [5:0] _3038;
    wire [5:0] _3047;
    wire [5:0] _103;
    reg [5:0] _3046;
    wire _3050;
    wire [5:0] _3051;
    wire [5:0] _3052;
    wire [5:0] _3061;
    wire _3048;
    wire [5:0] _3062;
    wire [5:0] _3063;
    wire [5:0] _104;
    reg [5:0] _1202;
    wire [5:0] _3056;
    wire [5:0] _3055;
    wire [5:0] _3054;
    wire [5:0] _3053;
    reg [5:0] _3057;
    wire _3058;
    wire _3059;
    wire [2:0] _5178;
    wire _5173;
    wire [2:0] _5175;
    wire [7:0] _1613;
    wire _1615;
    wire _1616;
    wire _1611;
    wire _1612;
    wire f_unexp_now;
    wire _3067;
    wire _3068;
    wire _3070;
    wire _3071;
    wire _3066;
    wire _3064;
    wire _3072;
    wire _105;
    reg _1608;
    wire _1609;
    wire [15:0] _5164;
    wire [15:0] _5165;
    wire _5161;
    wire _5162;
    wire _5163;
    wire [15:0] _5166;
    wire [2:0] _5106;
    wire [2:0] _5104;
    wire [2:0] _5103;
    wire [2:0] _5102;
    wire [2:0] _5101;
    wire [7:0] _999;
    wire _1001;
    wire _992;
    wire _988;
    wire _989;
    wire _986;
    wire _990;
    wire _993;
    wire [3:0] _983;
    wire _985;
    wire _994;
    wire _981;
    wire _977;
    wire _978;
    wire _975;
    wire _979;
    wire _982;
    wire _973;
    reg [2:0] _967;
    wire [15:0] _968;
    wire _969;
    wire _963;
    wire _970;
    wire _961;
    wire _971;
    wire _974;
    wire [1:0] _960;
    reg _995;
    wire _959;
    wire _996;
    wire _956;
    wire [3:0] _954;
    reg _955;
    wire _957;
    wire [15:0] _949;
    wire _951;
    wire [15:0] _940;
    wire [16:0] _941;
    wire [16:0] _942;
    reg [16:0] _945;
    wire _946;
    wire _947;
    wire [15:0] _936;
    wire _938;
    wire _920;
    wire [2:0] _922;
    wire _917;
    wire [2:0] _919;
    wire _923;
    wire [2:0] _924;
    wire _912;
    wire [2:0] _914;
    wire _909;
    wire [2:0] _911;
    wire _915;
    wire [2:0] _916;
    wire _925;
    wire [2:0] _926;
    wire _902;
    wire [2:0] _904;
    wire _899;
    wire [2:0] _901;
    wire _905;
    wire [2:0] _906;
    wire _894;
    wire [2:0] _896;
    wire [7:0] _890;
    wire _891;
    wire [2:0] _893;
    wire _897;
    wire [2:0] _898;
    wire _907;
    wire [2:0] _908;
    wire _927;
    wire [2:0] _928;
    wire [16:0] _929;
    wire [111:0] _886;
    wire [15:0] _887;
    wire [16:0] _888;
    wire [16:0] _930;
    reg [16:0] _933;
    wire [16:0] _885;
    wire _934;
    wire _935;
    wire _939;
    wire _948;
    wire [1:0] _881;
    reg [15:0] _882;
    wire _884;
    wire _952;
    wire [7:0] _875;
    wire _877;
    wire _878;
    wire _874;
    wire _879;
    wire [7:0] _868;
    wire [7:0] _866;
    wire [7:0] _867;
    wire [7:0] _869;
    wire _871;
    wire _872;
    wire _880;
    wire _953;
    wire _958;
    wire _997;
    wire _998;
    wire _1002;
    wire f_fire2;
    wire [1:0] _1006;
    wire [1:0] f_policy;
    wire _725;
    wire [7:0] f_chgmask3;
    wire f_valid3;
    wire [7:0] _715;
    wire [7:0] f_chgmask2;
    wire f_valid2;
    wire [7:0] _709;
    wire [7:0] _703;
    wire [7:0] f_chgmask0;
    wire [7:0] _697;
    wire [7:0] f_watch;
    wire [7:0] _698;
    wire [7:0] _704;
    wire [7:0] _710;
    wire [7:0] f_relevant;
    wire [7:0] _717;
    wire _719;
    wire _720;
    wire f_amb_now;
    wire _722;
    wire _726;
    wire [7:0] _688;
    wire [7:0] _3077;
    wire [7:0] _3078;
    wire _3074;
    wire [7:0] _3076;
    wire _3073;
    wire [7:0] _3079;
    wire [7:0] _3081;
    wire [7:0] _106;
    reg [7:0] _687;
    wire [7:0] f_multi_eff;
    wire [7:0] _861;
    wire _863;
    wire _854;
    wire _850;
    wire _851;
    wire _848;
    wire _852;
    wire _855;
    wire [3:0] _845;
    wire _847;
    wire _856;
    wire _843;
    wire _839;
    wire _840;
    wire _837;
    wire _841;
    wire _844;
    wire _835;
    reg [2:0] _829;
    wire [15:0] _830;
    wire _831;
    wire _825;
    wire _832;
    wire _823;
    wire _833;
    wire _836;
    wire [1:0] _822;
    reg _857;
    wire [1:0] _3082;
    wire [1:0] _3083;
    wire [1:0] _107;
    reg [1:0] _642;
    wire _644;
    wire _821;
    wire _858;
    wire _818;
    wire _3087;
    wire _3085;
    wire _3088;
    wire _3090;
    wire _3092;
    wire _108;
    reg _635;
    wire [15:0] _3107;
    wire [15:0] _3115;
    wire _3117;
    wire _3094;
    wire _3118;
    wire _3120;
    wire _3121;
    wire _3122;
    wire _3123;
    wire _3125;
    wire _3127;
    wire _109;
    reg _632;
    wire _3135;
    wire _3136;
    wire [4:0] _3132;
    wire [4:0] _3131;
    wire _3133;
    wire _3128;
    wire _3130;
    wire _3134;
    wire _3137;
    wire [7:0] _3138;
    wire [7:0] _3139;
    wire [7:0] _110;
    reg [7:0] _3113;
    wire _3147;
    wire _3148;
    wire [4:0] _3144;
    wire [4:0] _3143;
    wire _3145;
    wire _3140;
    wire _3142;
    wire _3146;
    wire _3149;
    wire [7:0] _3150;
    wire [7:0] _3151;
    wire [7:0] _111;
    reg [7:0] _3110;
    wire [15:0] _3114;
    wire _3159;
    wire _3160;
    wire [4:0] _3156;
    wire [4:0] _3155;
    wire _3157;
    wire _3152;
    wire _3154;
    wire _3158;
    wire _3161;
    wire [7:0] _3162;
    wire [7:0] _3163;
    wire [7:0] _112;
    reg [7:0] _3105;
    wire _3171;
    wire _3172;
    wire [4:0] _3168;
    wire [4:0] _3167;
    wire _3169;
    wire _3164;
    wire _3166;
    wire _3170;
    wire _3173;
    wire [7:0] _3174;
    wire [7:0] _3175;
    wire [7:0] _113;
    reg [7:0] _3102;
    wire [15:0] _3106;
    wire [15:0] _3214;
    wire [15:0] _3215;
    wire [15:0] _3216;
    wire _3218;
    wire _3189;
    wire _3190;
    wire _3192;
    wire _3193;
    wire _3194;
    wire _3195;
    wire _3197;
    wire _114;
    reg g_crc_bad;
    wire _3191;
    wire _3208;
    wire [5:0] _3206;
    wire _3207;
    wire _3209;
    wire _3210;
    wire _3211;
    wire _3212;
    wire _3213;
    wire _3201;
    wire _3199;
    wire _3198;
    wire _3200;
    wire _3202;
    wire _115;
    reg g_resid_chk;
    wire _3219;
    wire _3221;
    wire _3223;
    wire _116;
    reg _629;
    wire _3227;
    wire _3225;
    wire _3228;
    wire _3230;
    wire _3232;
    wire _117;
    reg _621;
    wire [15:0] _3247;
    wire [15:0] _3255;
    wire _3257;
    wire _3234;
    wire _3258;
    wire _3260;
    wire _3261;
    wire _3262;
    wire _3263;
    wire _3265;
    wire _3267;
    wire _118;
    reg _618;
    wire _3275;
    wire _3276;
    wire [4:0] _3271;
    wire _3273;
    wire _3268;
    wire _3270;
    wire _3274;
    wire _3277;
    wire [7:0] _3278;
    wire [7:0] _3279;
    wire [7:0] _119;
    reg [7:0] _3253;
    wire _3287;
    wire _3288;
    wire [4:0] _3283;
    wire _3285;
    wire _3280;
    wire _3282;
    wire _3286;
    wire _3289;
    wire [7:0] _3290;
    wire [7:0] _3291;
    wire [7:0] _120;
    reg [7:0] _3250;
    wire [15:0] _3254;
    wire _3299;
    wire _3300;
    wire [4:0] _3295;
    wire _3297;
    wire _3292;
    wire _3294;
    wire _3298;
    wire _3301;
    wire [7:0] _3302;
    wire [7:0] _3303;
    wire [7:0] _121;
    reg [7:0] _3245;
    wire _3311;
    wire _3312;
    wire [4:0] _3307;
    wire _3309;
    wire _3304;
    wire _3306;
    wire _3310;
    wire _3313;
    wire [7:0] _3314;
    wire [7:0] _3315;
    wire [7:0] _122;
    reg [7:0] _3242;
    wire [15:0] _3246;
    wire [15:0] _3354;
    wire [15:0] _3355;
    wire [15:0] _3356;
    wire _3358;
    wire _3329;
    wire _3330;
    wire _3332;
    wire _3333;
    wire _3334;
    wire _3335;
    wire _3337;
    wire _123;
    reg g_crc_bad_0;
    wire _3331;
    wire _3348;
    wire _3347;
    wire _3349;
    wire _3350;
    wire _3351;
    wire _3352;
    wire _3353;
    wire _3341;
    wire _3339;
    wire _3338;
    wire _3340;
    wire _3342;
    wire _124;
    reg g_resid_chk_0;
    wire _3359;
    wire _3361;
    wire _3363;
    wire _125;
    reg _615;
    wire [3:0] _3364;
    wire _3365;
    wire [7:0] _3366;
    wire [7:0] _3367;
    wire [7:0] _126;
    reg [7:0] _605;
    wire [6:0] _606;
    wire [6:0] _602;
    wire _607;
    wire [15:0] _599;
    wire _3372;
    wire _3371;
    wire _3373;
    wire _3370;
    wire _3374;
    wire _3369;
    wire _3375;
    wire [14:0] _3368;
    wire [15:0] _3376;
    wire [15:0] _127;
    reg [15:0] _600;
    wire _601;
    wire [3:0] _3395;
    wire [3:0] _3393;
    wire [3:0] _3396;
    wire _1676;
    wire _1677;
    wire _3378;
    wire _2983;
    wire _2984;
    wire _3379;
    wire _3382;
    wire _128;
    reg _1674;
    wire _1678;
    wire _1664;
    wire _3389;
    wire _3385;
    wire _3383;
    wire _3384;
    wire _3386;
    wire _3390;
    wire f_rx_push;
    wire _1665;
    wire _3391;
    wire [3:0] _3397;
    reg [3:0] _3400;
    wire [3:0] _130;
    wire _597;
    wire _593;
    wire [6:0] _4917;
    wire [7:0] _4918;
    wire _4915;
    wire _4914;
    wire _4913;
    wire _4912;
    wire _4911;
    wire _4910;
    wire _4909;
    wire _4908;
    wire [7:0] _4916;
    wire [3:0] _4900;
    wire [3:0] _4898;
    wire [3:0] _4901;
    wire _2311;
    wire _3426;
    wire _3423;
    wire _3406;
    wire _131;
    reg _2882;
    wire _3424;
    wire _2306;
    wire [2:0] _2300;
    wire _2295;
    wire g_tx_bit;
    wire _2296;
    wire _2297;
    wire _2298;
    wire [2:0] _2301;
    wire _2303;
    wire _2304;
    wire _2275;
    wire _2305;
    wire _2307;
    wire _2271;
    wire [5:0] _2258;
    wire _2263;
    wire _2264;
    wire [9:0] _2254;
    wire _2256;
    wire _2257;
    wire _2265;
    wire _4883;
    wire _4884;
    wire [1:0] _4887;
    wire _4876;
    wire _4877;
    wire _4878;
    wire _4879;
    wire [1:0] _4881;
    wire [2:0] _4862;
    wire [2:0] _4859;
    wire _4855;
    wire _4853;
    wire _4854;
    wire _4856;
    wire [2:0] _4860;
    wire _4851;
    wire [2:0] _4863;
    wire _4864;
    wire [2:0] _4845;
    wire _4841;
    wire _4839;
    wire _4840;
    wire _4842;
    wire [2:0] _4846;
    wire _4837;
    wire [2:0] _4848;
    wire _4849;
    wire _4865;
    wire _4866;
    wire _4867;
    wire _4833;
    wire _4831;
    wire _4834;
    wire [15:0] _4826;
    wire _4827;
    wire _4824;
    wire _4828;
    wire _4822;
    wire _4823;
    wire _4829;
    wire _4835;
    wire _4868;
    wire [1:0] _4870;
    wire [1:0] _4872;
    wire [1:0] _4818;
    wire _4814;
    wire [1:0] _4816;
    wire [1:0] _4819;
    wire _3502;
    wire _3503;
    wire _132;
    reg _3409;
    wire _3515;
    wire _3513;
    wire _3514;
    reg _3516;
    wire _3517;
    wire _3518;
    wire _3510;
    wire _3507;
    wire _3504;
    wire _3505;
    wire _3508;
    wire _3509;
    wire _3511;
    wire _3519;
    wire _3521;
    wire _3523;
    wire _3525;
    wire _3527;
    wire _133;
    reg f_lane0_out;
    wire _2743;
    wire _2744;
    wire _2192;
    wire _2189;
    wire _2182;
    wire _2190;
    wire _2193;
    wire _2216;
    wire _2739;
    wire _2740;
    wire _2736;
    wire _2734;
    wire _2867;
    wire _4789;
    wire _4790;
    wire [1:0] _4793;
    wire _4782;
    wire _4783;
    wire _4784;
    wire _4785;
    wire [1:0] _4787;
    wire [2:0] _4768;
    wire [2:0] _4765;
    wire _4761;
    wire _4759;
    wire _4760;
    wire _4762;
    wire [2:0] _4766;
    wire _4757;
    wire [2:0] _4769;
    wire _4770;
    wire [2:0] _4751;
    wire _4747;
    wire _4745;
    wire _4746;
    wire _4748;
    wire [2:0] _4752;
    wire _4743;
    wire [2:0] _4754;
    wire _4755;
    wire _4771;
    wire _4772;
    wire _4773;
    wire _4739;
    wire _4737;
    wire _4740;
    wire [15:0] _4732;
    wire _4733;
    wire _4730;
    wire _4734;
    wire _4728;
    wire _4729;
    wire _4735;
    wire _4741;
    wire _4774;
    wire [1:0] _4776;
    wire [1:0] _4778;
    wire [1:0] _4724;
    wire _4720;
    wire [1:0] _4722;
    wire [1:0] _4725;
    wire _3559;
    wire _3560;
    wire _134;
    reg _3530;
    wire _4587;
    wire _4585;
    wire _4586;
    reg _4588;
    wire [2:0] _2468;
    wire [2:0] _4557;
    wire [2:0] _4558;
    wire [2:0] _4553;
    wire _4549;
    wire _4547;
    wire _4548;
    wire _4550;
    wire [2:0] _4554;
    wire _4545;
    wire [2:0] _4559;
    wire [2:0] _4560;
    wire [2:0] _4539;
    wire [2:0] _4540;
    wire [2:0] _4535;
    wire _3555;
    wire _3554;
    wire _3553;
    wire _3552;
    wire _3551;
    wire _3550;
    wire _3549;
    wire _3545;
    wire _3544;
    wire _3543;
    wire _3542;
    wire _3541;
    wire _3540;
    wire _3539;
    wire _3474;
    wire _3475;
    reg [7:0] _3476;
    wire _3468;
    wire _3469;
    reg [7:0] _3470;
    wire _3462;
    wire _3463;
    reg [7:0] _3464;
    wire _3456;
    wire _3457;
    reg [7:0] _3458;
    wire _3450;
    wire _3451;
    reg [7:0] _3452;
    wire _3444;
    wire _3445;
    reg [7:0] _3446;
    wire _3438;
    wire _3439;
    reg [7:0] _3440;
    wire [2:0] _3562;
    wire [2:0] _3563;
    wire [2:0] _135;
    reg [2:0] _3430;
    wire _3432;
    wire _3433;
    wire [7:0] _3627;
    wire [7:0] _3628;
    wire [7:0] _3578;
    wire [7:0] _3576;
    wire [7:0] _3579;
    wire [7:0] _136;
    reg [7:0] _3568;
    wire [7:0] _3574;
    wire [7:0] _3575;
    wire [7:0] _3620;
    wire [7:0] _3587;
    wire [7:0] _3585;
    wire [7:0] _3588;
    wire [7:0] _137;
    reg [7:0] _3584;
    wire [6:0] _3605;
    wire [7:0] _3606;
    wire [6:0] _3603;
    wire _3601;
    wire _3600;
    wire _3599;
    wire _3598;
    wire _3597;
    wire _3596;
    wire _3595;
    wire _3594;
    wire [2:0] _3592;
    wire [2:0] _3591;
    wire [2:0] _3590;
    wire [2:0] _3589;
    reg [2:0] _3593;
    reg _3602;
    wire [7:0] _3604;
    reg [7:0] _3607;
    wire [7:0] _3608;
    wire [7:0] _138;
    reg [7:0] _592;
    wire _3586;
    wire _3612;
    wire _3580;
    wire _3581;
    wire _3610;
    wire [1:0] _2590;
    wire [1:0] _2589;
    wire [1:0] _2588;
    wire [1:0] _2587;
    reg [1:0] _2591;
    wire [1:0] _2593;
    wire f_eng_push;
    wire _2596;
    wire _2602;
    wire _2599;
    wire _2600;
    wire _2598;
    wire _2601;
    wire _2603;
    wire _3613;
    wire _139;
    reg _2586;
    wire [7:0] _3619;
    wire _3577;
    wire _3617;
    wire _2546;
    wire [2:0] _2540;
    wire _2535;
    wire g_tx_bit_0;
    wire _2536;
    wire _2537;
    wire _2538;
    wire [2:0] _2541;
    wire _2543;
    wire _2544;
    wire _2515;
    wire _2545;
    wire _2547;
    wire _2511;
    wire _2512;
    wire _2548;
    wire _3564;
    wire _3565;
    wire _3615;
    wire _3618;
    wire _140;
    reg _2343;
    wire _2551;
    wire _2550;
    wire _2552;
    wire [7:0] _3621;
    wire [7:0] _3629;
    wire [7:0] _141;
    wire [7:0] _142;
    wire _3402;
    wire _3403;
    wire [7:0] _3630;
    wire [7:0] _143;
    reg [7:0] _3419;
    wire [7:0] _3420;
    reg [7:0] _3434;
    wire [2:0] _4159;
    wire _4156;
    wire _2696;
    wire _2695;
    wire _2697;
    wire _2688;
    wire _2685;
    wire [2:0] _2228;
    wire [2:0] _4027;
    wire [2:0] _4028;
    wire [2:0] _4023;
    wire _4019;
    wire _4017;
    wire _4018;
    wire _4020;
    wire [2:0] _4024;
    wire _4015;
    wire [2:0] _4029;
    wire [2:0] _4030;
    wire [2:0] _4009;
    wire [2:0] _4010;
    wire [2:0] _4005;
    wire _4001;
    wire _3999;
    wire _4000;
    wire _4002;
    wire [2:0] _4006;
    wire _3997;
    wire [2:0] _4011;
    wire [7:0] _3650;
    wire [7:0] _3651;
    wire [7:0] _144;
    reg [7:0] g_lim;
    wire [15:0] _2250;
    wire _3659;
    wire _3660;
    wire [4:0] _3656;
    wire [4:0] _3655;
    wire _3657;
    wire _3652;
    wire _3654;
    wire _3658;
    wire _3661;
    wire [7:0] _3662;
    wire [7:0] _3663;
    wire [7:0] _145;
    reg [7:0] _2244;
    wire _3671;
    wire _3672;
    wire [4:0] _3668;
    wire [4:0] _3667;
    wire _3669;
    wire _3664;
    wire _3666;
    wire _3670;
    wire _3673;
    wire [7:0] _3674;
    wire [7:0] _3675;
    wire [7:0] _146;
    reg [7:0] _2241;
    wire [15:0] _2245;
    wire [14:0] _3238;
    wire [15:0] _3239;
    wire [15:0] _3676;
    wire [15:0] _3677;
    wire [15:0] _3678;
    wire [15:0] _3680;
    wire [15:0] _147;
    reg [15:0] g_sr;
    wire [3:0] _3642;
    wire _3688;
    wire _3689;
    wire [4:0] _3685;
    wire [4:0] _3684;
    wire _3686;
    wire _3681;
    wire _3683;
    wire _3687;
    wire _3690;
    wire [7:0] _3691;
    wire [7:0] _3692;
    wire [7:0] _148;
    reg [7:0] _3640;
    wire [3:0] _3641;
    wire _3643;
    wire [3:0] _3644;
    wire [7:0] _3646;
    wire [5:0] _2262;
    wire [7:0] _3636;
    wire [7:0] _3647;
    wire [15:0] _3648;
    wire _3649;
    wire _3718;
    wire [5:0] _3700;
    wire _3705;
    wire [9:0] _3696;
    wire _3698;
    wire _3694;
    wire _3693;
    wire _3695;
    wire _3699;
    wire _3706;
    wire _3708;
    wire _3709;
    wire _3710;
    wire _3711;
    wire _3712;
    wire _3714;
    wire _3716;
    wire _149;
    reg g_len_cap;
    wire _3719;
    wire _3721;
    wire _150;
    reg g_len_known;
    wire [15:0] _2251;
    wire [15:0] _3989;
    wire [15:0] _3990;
    wire [15:0] _3991;
    wire _3972;
    wire _3498;
    wire _3497;
    wire _3496;
    wire _3495;
    wire _3494;
    wire _3493;
    wire _3492;
    wire _3488;
    wire _3487;
    wire _3486;
    wire _3485;
    wire _3484;
    wire _3483;
    wire _3482;
    wire [7:0] _3479;
    wire [6:0] _3624;
    wire [7:0] _3625;
    wire [6:0] _3622;
    wire [7:0] _3623;
    wire [7:0] _3626;
    wire [7:0] _3726;
    wire [7:0] _3727;
    wire [7:0] _3728;
    wire [7:0] _3729;
    wire [7:0] _3722;
    wire [7:0] _3723;
    wire [7:0] _3724;
    wire [7:0] _3725;
    wire [7:0] _3730;
    wire [7:0] _151;
    reg [7:0] g_byte;
    wire [7:0] _3480;
    wire _3481;
    wire [7:0] _3489;
    wire _3410;
    wire [7:0] _3490;
    wire _3491;
    wire [2:0] _3738;
    wire [2:0] _3739;
    wire [2:0] _3740;
    wire [2:0] _3741;
    wire [2:0] _3742;
    wire [2:0] _3732;
    wire [2:0] _3733;
    wire [2:0] _3734;
    wire [2:0] _3735;
    wire [2:0] _3736;
    wire [2:0] _3743;
    wire [2:0] _3745;
    wire [2:0] _152;
    reg [2:0] g_bitpos;
    reg _3499;
    wire _3327;
    wire _3756;
    wire _3757;
    wire [4:0] _3753;
    wire [4:0] _3752;
    wire _3754;
    wire _3749;
    wire _3751;
    wire _3755;
    wire _3758;
    wire [7:0] _3759;
    wire [7:0] _3760;
    wire [7:0] _153;
    reg [7:0] _3748;
    wire _3771;
    wire _3772;
    wire [4:0] _3768;
    wire [4:0] _3767;
    wire _3769;
    wire _3764;
    wire _3766;
    wire _3770;
    wire _3773;
    wire [7:0] _3774;
    wire [7:0] _3775;
    wire [7:0] _154;
    reg [7:0] _3763;
    wire _3786;
    wire _3787;
    wire [4:0] _3783;
    wire [4:0] _3782;
    wire _3784;
    wire _3779;
    wire _3781;
    wire _3785;
    wire _3788;
    wire [7:0] _3789;
    wire [7:0] _3790;
    wire [7:0] _155;
    reg [7:0] _3778;
    wire _3801;
    wire _3802;
    wire [4:0] _3798;
    wire [4:0] _3797;
    wire _3799;
    wire _3794;
    wire _3796;
    wire _3800;
    wire _3803;
    wire [7:0] _3804;
    wire [7:0] _3805;
    wire [7:0] _156;
    reg [7:0] _3793;
    wire [31:0] _3966;
    wire [30:0] _3959;
    wire [31:0] _3961;
    wire _3952;
    wire _3953;
    wire [31:0] _3955;
    wire [30:0] _3949;
    wire [31:0] _3951;
    wire [31:0] _3956;
    wire _3813;
    wire _3814;
    wire [4:0] _3810;
    wire [4:0] _3809;
    wire _3811;
    wire _3806;
    wire _3808;
    wire _3812;
    wire _3815;
    wire [7:0] _3816;
    wire [7:0] _3817;
    wire [7:0] _157;
    reg [7:0] _3703;
    wire [5:0] _3704;
    wire [5:0] _3945;
    wire _3946;
    wire _3947;
    wire [9:0] _3940;
    wire _3942;
    wire _3943;
    wire _3825;
    wire _3826;
    wire [4:0] _3822;
    wire [4:0] _3821;
    wire _3823;
    wire _3818;
    wire _3820;
    wire _3824;
    wire _3827;
    wire [7:0] _3828;
    wire [7:0] _3829;
    wire [7:0] _158;
    reg [7:0] _2261;
    wire _3233;
    wire _3939;
    wire _3944;
    wire _3948;
    wire [31:0] _3957;
    wire [31:0] _3958;
    wire _3840;
    wire _3841;
    wire [4:0] _3837;
    wire [4:0] _3836;
    wire _3838;
    wire _3833;
    wire _3835;
    wire _3839;
    wire _3842;
    wire [7:0] _3843;
    wire [7:0] _3844;
    wire [7:0] _159;
    reg [7:0] _3832;
    wire [5:0] _3859;
    wire [5:0] _3854;
    wire [5:0] _3855;
    wire [5:0] _3856;
    wire [5:0] _3857;
    wire [5:0] _3848;
    wire [5:0] _3849;
    wire [5:0] _3850;
    wire [5:0] _3851;
    wire [5:0] _3852;
    wire [5:0] _3858;
    wire [5:0] _3860;
    wire [5:0] _3862;
    wire [5:0] _160;
    reg [5:0] g_left;
    wire _2291;
    wire _2292;
    wire _3320;
    wire _3319;
    wire _3321;
    wire _3322;
    wire [31:0] _3962;
    wire _2231;
    wire [31:0] _3963;
    wire [31:0] _3964;
    wire _3873;
    wire _3874;
    wire [4:0] _3870;
    wire [4:0] _3869;
    wire _3871;
    wire _3866;
    wire _3868;
    wire _3872;
    wire _3875;
    wire [7:0] _3876;
    wire [7:0] _3877;
    wire [7:0] _161;
    reg [7:0] _3865;
    wire _3888;
    wire _3889;
    wire [4:0] _3885;
    wire [4:0] _3884;
    wire _3886;
    wire _3881;
    wire _3883;
    wire _3887;
    wire _3890;
    wire [7:0] _3891;
    wire [7:0] _3892;
    wire [7:0] _162;
    reg [7:0] _3880;
    wire _3903;
    wire _3904;
    wire [4:0] _3900;
    wire [4:0] _3899;
    wire _3901;
    wire _3896;
    wire _3898;
    wire _3902;
    wire _3905;
    wire [7:0] _3906;
    wire [7:0] _3907;
    wire [7:0] _163;
    reg [7:0] _3895;
    wire _3918;
    wire _3919;
    wire [4:0] _3915;
    wire [4:0] _3914;
    wire _3916;
    wire _3911;
    wire _3913;
    wire _3917;
    wire _3920;
    wire [7:0] _3921;
    wire [7:0] _3922;
    wire [7:0] _164;
    reg [7:0] _3910;
    wire [31:0] _3932;
    wire _3929;
    wire _3930;
    wire [31:0] _3933;
    wire [30:0] _3926;
    wire [31:0] _3928;
    wire [31:0] _3934;
    wire [30:0] _3923;
    wire [31:0] _3925;
    wire [31:0] _3935;
    wire [31:0] _3936;
    wire [31:0] _3937;
    wire [31:0] _3938;
    wire [31:0] _3965;
    wire [31:0] _3967;
    wire [31:0] _3969;
    wire [31:0] _165;
    reg [31:0] g_crc;
    wire _3326;
    wire _3328;
    wire _3500;
    wire _3501;
    wire _3970;
    wire _3971;
    wire _3973;
    wire _3975;
    wire _166;
    reg g_last;
    wire _2763;
    wire _2760;
    wire _2764;
    wire _3977;
    wire _3978;
    wire _3979;
    wire _3981;
    wire _167;
    reg g_prev;
    wire _2757;
    wire _2754;
    wire _2758;
    wire _2765;
    wire _2766;
    wire _2767;
    wire [15:0] _3992;
    wire [15:0] _3983;
    wire [15:0] _3984;
    wire [15:0] _3985;
    wire [15:0] _3986;
    wire [15:0] _3987;
    wire [15:0] _3993;
    wire [15:0] _3995;
    wire [15:0] _168;
    reg [15:0] g_cnt;
    wire g_data_left;
    wire _2286;
    wire _2293;
    wire [2:0] _4012;
    wire [2:0] _4013;
    wire [2:0] _4031;
    wire [2:0] _4033;
    wire [2:0] _169;
    reg [2:0] g_run;
    wire _2229;
    wire _4041;
    wire _4042;
    wire [4:0] _4038;
    wire [4:0] _4037;
    wire _4039;
    wire _4034;
    wire _4036;
    wire _4040;
    wire _4043;
    wire [7:0] _4044;
    wire [7:0] _4045;
    wire [7:0] _170;
    reg [7:0] _2220;
    wire [1:0] _2221;
    wire _2223;
    wire _2224;
    wire _2230;
    wire _2682;
    wire _2683;
    wire _2686;
    wire _2213;
    wire _2214;
    reg _2210;
    wire _2211;
    wire _2203;
    wire _2202;
    wire _2201;
    wire _2200;
    wire _2199;
    wire _2198;
    wire _2197;
    wire _2196;
    wire [2:0] _2195;
    reg _2204;
    reg _2207;
    wire _2212;
    wire _2194;
    wire _2215;
    wire _2281;
    wire _2279;
    wire _2180;
    wire [13:0] _2171;
    wire [15:0] _2172;
    wire [14:0] _2168;
    wire [15:0] _2169;
    wire [15:0] _2173;
    wire [14:0] _2165;
    wire [15:0] _2166;
    wire _2163;
    wire [15:0] _2174;
    reg [15:0] _2177;
    wire _2178;
    wire [13:0] _2155;
    wire [15:0] _2156;
    reg [15:0] _2159;
    wire _4130;
    wire _4131;
    wire [15:0] _4132;
    wire [15:0] _4134;
    wire [15:0] _4136;
    wire _4114;
    wire [14:0] _2184;
    wire [15:0] _2185;
    reg [15:0] _2188;
    wire [16:0] _4110;
    wire _4111;
    wire [16:0] _4104;
    reg [16:0] _4107;
    wire [16:0] _4099;
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
    wire [7:0] _171;
    reg [7:0] _2153;
    wire _4065;
    wire _4066;
    wire [4:0] _4062;
    wire [4:0] _4061;
    wire _4063;
    wire _4058;
    wire _4060;
    wire _4064;
    wire _4067;
    wire [7:0] _4068;
    wire [7:0] _4069;
    wire [7:0] _172;
    reg [7:0] _2150;
    wire [15:0] _2154;
    wire [16:0] _4098;
    wire [16:0] _4100;
    reg [16:0] _4103;
    wire _4080;
    wire _4081;
    wire [4:0] _4077;
    wire [4:0] _4076;
    wire _4078;
    wire _4073;
    wire _4075;
    wire _4079;
    wire _4082;
    wire [7:0] _4083;
    wire [7:0] _4084;
    wire [7:0] _173;
    reg [7:0] _4072;
    wire [8:0] _4118;
    wire [7:0] _4120;
    wire [7:0] _4121;
    wire [7:0] _4122;
    wire [7:0] _4124;
    wire [7:0] _174;
    reg [7:0] _4092;
    wire [8:0] _4117;
    wire [8:0] _4119;
    wire _4125;
    wire _4126;
    wire _4127;
    wire _4129;
    wire _175;
    reg _4097;
    wire [16:0] _4108;
    wire [16:0] _4094;
    wire _4109;
    wire _4112;
    wire _4115;
    wire _4093;
    wire _4116;
    wire [15:0] _4138;
    wire _4088;
    wire _4086;
    wire _612;
    wire _4085;
    wire _4087;
    wire _4089;
    wire [15:0] _4139;
    wire [15:0] _4141;
    wire [15:0] _176;
    reg [15:0] _2146;
    wire _2160;
    wire _2161;
    wire _2143;
    wire _2162;
    wire _2179;
    wire _2181;
    wire _2282;
    wire [1:0] _2137;
    wire _2139;
    wire _2140;
    wire _2136;
    wire _2141;
    wire _2133;
    reg _2130;
    wire _2123;
    wire _2122;
    wire _2121;
    wire _2120;
    wire _2119;
    wire _2118;
    wire _2117;
    wire _2116;
    wire _4149;
    wire _4150;
    wire [4:0] _4146;
    wire [4:0] _4145;
    wire _4147;
    wire _4142;
    wire _4144;
    wire _4148;
    wire _4151;
    wire [7:0] _4152;
    wire [7:0] _4153;
    wire [7:0] _177;
    reg [7:0] _2114;
    wire [2:0] _2115;
    reg _2124;
    reg _2127;
    wire _2131;
    wire _2132;
    wire _2134;
    wire _2142;
    wire _2283;
    wire _2111;
    wire _2284;
    wire _2276;
    wire _2277;
    wire _2285;
    wire _2687;
    wire _2689;
    wire _2698;
    wire _2679;
    wire _2677;
    wire _2680;
    wire _4154;
    wire _4155;
    wire _178;
    wire _4157;
    wire [2:0] _4160;
    wire [2:0] _179;
    reg [2:0] _3416;
    reg [7:0] _3477;
    wire [7:0] _3536;
    wire [6:0] _3571;
    wire [7:0] _3572;
    wire [6:0] _3569;
    wire [7:0] _3570;
    wire [7:0] _3573;
    wire [7:0] _4165;
    wire [7:0] _4166;
    wire [7:0] _4167;
    wire [7:0] _4168;
    wire [7:0] _4161;
    wire [7:0] _4162;
    wire [7:0] _4163;
    wire [7:0] _4164;
    wire [7:0] _4169;
    wire [7:0] _180;
    reg [7:0] g_byte_0;
    wire _2693;
    wire _2690;
    wire _2691;
    wire _2694;
    wire [7:0] _3537;
    wire _3538;
    wire [7:0] _3546;
    wire _3531;
    wire [7:0] _3547;
    wire _3548;
    wire [2:0] _4177;
    wire [5:0] _2498;
    wire _2503;
    wire _2504;
    wire [9:0] _2494;
    wire _2496;
    wire _2497;
    wire _2505;
    wire _2506;
    wire [2:0] _4178;
    wire [2:0] _4179;
    wire [2:0] _4180;
    wire [2:0] _4181;
    wire [2:0] _4171;
    wire [2:0] _4172;
    wire [2:0] _4173;
    wire [2:0] _4174;
    wire [2:0] _4175;
    wire [2:0] _4182;
    wire [2:0] _4184;
    wire [2:0] _181;
    reg [2:0] g_bitpos_0;
    reg _3556;
    wire _3187;
    wire _4195;
    wire _4196;
    wire [4:0] _4191;
    wire _4193;
    wire _4188;
    wire _4190;
    wire _4194;
    wire _4197;
    wire [7:0] _4198;
    wire [7:0] _4199;
    wire [7:0] _182;
    reg [7:0] _4187;
    wire _4210;
    wire _4211;
    wire [4:0] _4206;
    wire _4208;
    wire _4203;
    wire _4205;
    wire _4209;
    wire _4212;
    wire [7:0] _4213;
    wire [7:0] _4214;
    wire [7:0] _183;
    reg [7:0] _4202;
    wire _4225;
    wire _4226;
    wire [4:0] _4221;
    wire _4223;
    wire _4218;
    wire _4220;
    wire _4224;
    wire _4227;
    wire [7:0] _4228;
    wire [7:0] _4229;
    wire [7:0] _184;
    reg [7:0] _4217;
    wire _4240;
    wire _4241;
    wire [4:0] _4236;
    wire _4238;
    wire _4233;
    wire _4235;
    wire _4239;
    wire _4242;
    wire [7:0] _4243;
    wire [7:0] _4244;
    wire [7:0] _185;
    reg [7:0] _4232;
    wire [31:0] _4385;
    wire [30:0] _4378;
    wire [31:0] _4380;
    wire _4371;
    wire _4372;
    wire [31:0] _4374;
    wire [30:0] _4368;
    wire [31:0] _4370;
    wire [31:0] _4375;
    wire [5:0] _4360;
    wire _4365;
    wire _4366;
    wire [9:0] _4355;
    wire _4357;
    wire _4358;
    wire _4354;
    wire _4359;
    wire _4367;
    wire [31:0] _4376;
    wire [31:0] _4377;
    wire _4255;
    wire _4256;
    wire [4:0] _4251;
    wire _4253;
    wire _4248;
    wire _4250;
    wire _4254;
    wire _4257;
    wire [7:0] _4258;
    wire [7:0] _4259;
    wire [7:0] _186;
    reg [7:0] _4247;
    wire [5:0] _4274;
    wire [5:0] _4269;
    wire [5:0] _4270;
    wire [5:0] _4271;
    wire [5:0] _4272;
    wire [5:0] _4263;
    wire [5:0] _4264;
    wire [5:0] _4265;
    wire [5:0] _4266;
    wire [5:0] _4267;
    wire [5:0] _4273;
    wire [5:0] _4275;
    wire [5:0] _4277;
    wire [5:0] _187;
    reg [5:0] g_left_0;
    wire _2531;
    wire _2532;
    wire _3180;
    wire _3179;
    wire _3181;
    wire _3182;
    wire [31:0] _4381;
    wire [31:0] _4382;
    wire [31:0] _4383;
    wire _4288;
    wire _4289;
    wire [4:0] _4284;
    wire _4286;
    wire _4281;
    wire _4283;
    wire _4287;
    wire _4290;
    wire [7:0] _4291;
    wire [7:0] _4292;
    wire [7:0] _188;
    reg [7:0] _4280;
    wire _4303;
    wire _4304;
    wire [4:0] _4299;
    wire _4301;
    wire _4296;
    wire _4298;
    wire _4302;
    wire _4305;
    wire [7:0] _4306;
    wire [7:0] _4307;
    wire [7:0] _189;
    reg [7:0] _4295;
    wire _4318;
    wire _4319;
    wire [4:0] _4314;
    wire _4316;
    wire _4311;
    wire _4313;
    wire _4317;
    wire _4320;
    wire [7:0] _4321;
    wire [7:0] _4322;
    wire [7:0] _190;
    reg [7:0] _4310;
    wire _4333;
    wire _4334;
    wire [4:0] _4329;
    wire _4331;
    wire _4326;
    wire _4328;
    wire _4332;
    wire _4335;
    wire [7:0] _4336;
    wire [7:0] _4337;
    wire [7:0] _191;
    reg [7:0] _4325;
    wire [31:0] _4347;
    wire _4344;
    wire _4345;
    wire [31:0] _4348;
    wire [30:0] _4341;
    wire [31:0] _4343;
    wire [31:0] _4349;
    wire [30:0] _4338;
    wire [31:0] _4340;
    wire [31:0] _4350;
    wire [31:0] _4351;
    wire [31:0] _4352;
    wire [31:0] _4353;
    wire [31:0] _4384;
    wire [31:0] _4386;
    wire [31:0] _4388;
    wire [31:0] _192;
    reg [31:0] g_crc_0;
    wire _3186;
    wire _3188;
    wire [7:0] _4408;
    wire [7:0] _4409;
    wire [7:0] _193;
    reg [7:0] g_lim_0;
    wire [15:0] _2490;
    wire _4417;
    wire _4418;
    wire [4:0] _4413;
    wire _4415;
    wire _4410;
    wire _4412;
    wire _4416;
    wire _4419;
    wire [7:0] _4420;
    wire [7:0] _4421;
    wire [7:0] _194;
    reg [7:0] _2484;
    wire _4429;
    wire _4430;
    wire [4:0] _4425;
    wire _4427;
    wire _4422;
    wire _4424;
    wire _4428;
    wire _4431;
    wire [7:0] _4432;
    wire [7:0] _4433;
    wire [7:0] _195;
    reg [7:0] _2481;
    wire [15:0] _2485;
    wire [14:0] _3098;
    wire [15:0] _3099;
    wire [15:0] _4434;
    wire [15:0] _4435;
    wire [15:0] _4436;
    wire [15:0] _4438;
    wire [15:0] _196;
    reg [15:0] g_sr_0;
    wire [3:0] _4400;
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
    wire [7:0] _197;
    reg [7:0] _4398;
    wire [3:0] _4399;
    wire _4401;
    wire [3:0] _4402;
    wire [7:0] _4404;
    wire [5:0] _2502;
    wire [7:0] _4394;
    wire [7:0] _4405;
    wire [15:0] _4406;
    wire _4407;
    wire _4496;
    wire _4458;
    wire _4459;
    wire [4:0] _4454;
    wire _4456;
    wire _4451;
    wire _4453;
    wire _4457;
    wire _4460;
    wire [7:0] _4461;
    wire [7:0] _4462;
    wire [7:0] _198;
    reg [7:0] _4363;
    wire [5:0] _4364;
    wire [5:0] _4482;
    wire _4483;
    wire [9:0] _4478;
    wire _4480;
    wire _3093;
    wire _4476;
    wire _4470;
    wire _4471;
    wire [4:0] _4466;
    wire _4468;
    wire _4463;
    wire _4465;
    wire _4469;
    wire _4472;
    wire [7:0] _4473;
    wire [7:0] _4474;
    wire [7:0] _199;
    reg [7:0] _2501;
    wire _4475;
    wire _4477;
    wire _4481;
    wire _4484;
    wire _4486;
    wire _4487;
    wire _4488;
    wire _4489;
    wire _4490;
    wire _4492;
    wire _4494;
    wire _200;
    reg g_len_cap_0;
    wire _4497;
    wire _4499;
    wire _201;
    reg g_len_known_0;
    wire [15:0] _2491;
    wire [15:0] _4519;
    wire _2472;
    wire _2493;
    wire [15:0] _4520;
    wire _2471;
    wire [15:0] _4521;
    wire _4502;
    wire _4500;
    wire _4501;
    wire _4503;
    wire _4505;
    wire _202;
    reg g_last_0;
    wire _2808;
    wire _2805;
    wire _2809;
    wire _4507;
    wire _4508;
    wire _4509;
    wire _4511;
    wire _203;
    reg g_prev_0;
    wire _2802;
    wire _2799;
    wire _2803;
    wire _2810;
    wire _2811;
    wire _2812;
    wire [15:0] _4522;
    wire [15:0] _4513;
    wire [15:0] _4514;
    wire [15:0] _4515;
    wire [15:0] _4516;
    wire [15:0] _4517;
    wire [15:0] _4523;
    wire [15:0] _4525;
    wire [15:0] _204;
    reg [15:0] g_cnt_0;
    wire g_data_left_0;
    wire _3557;
    wire _3558;
    wire _4531;
    wire _4529;
    wire _4530;
    wire _4532;
    wire [2:0] _4536;
    wire _4527;
    wire [2:0] _4541;
    wire [2:0] _4542;
    wire [2:0] _4543;
    wire [2:0] _4561;
    wire [2:0] _4563;
    wire [2:0] _205;
    reg [2:0] g_run_0;
    wire _2469;
    wire _4571;
    wire _4572;
    wire [4:0] _4567;
    wire _4569;
    wire _4564;
    wire _4566;
    wire _4570;
    wire _4573;
    wire [7:0] _4574;
    wire [7:0] _4575;
    wire [7:0] _206;
    reg [7:0] _2460;
    wire [1:0] _2461;
    wire _2463;
    wire _2464;
    wire _2470;
    wire _2526;
    wire _2533;
    wire _4589;
    wire _2516;
    wire _2517;
    wire _2525;
    wire _4590;
    wire _2521;
    wire _2519;
    wire _2522;
    wire _2523;
    wire _2524;
    wire _4582;
    wire _4579;
    wire _4576;
    wire _4577;
    wire _4580;
    wire _4581;
    wire _4583;
    wire _4591;
    wire _4593;
    wire _4595;
    wire _4597;
    wire _4599;
    wire _207;
    reg f_lane1_out;
    wire _2788;
    wire _2789;
    wire _2784;
    wire _2785;
    wire _2781;
    wire _2779;
    wire _2777;
    wire _2778;
    wire _2780;
    wire _2782;
    wire _2786;
    wire _2787;
    wire _2790;
    wire [1:0] _4727;
    wire _2453;
    wire _2454;
    reg _2450;
    wire _2451;
    wire _2443;
    wire _2442;
    wire _2441;
    wire _2440;
    wire _2439;
    wire _2438;
    wire _2437;
    wire _2436;
    wire [2:0] _2435;
    reg _2444;
    reg _2447;
    wire _2452;
    wire _2434;
    wire _2455;
    wire _2432;
    wire _2429;
    wire _2422;
    wire _2420;
    wire [13:0] _2411;
    wire [15:0] _2412;
    wire [14:0] _2408;
    wire [15:0] _2409;
    wire [15:0] _2413;
    wire [14:0] _2405;
    wire [15:0] _2406;
    wire _2403;
    wire [15:0] _2414;
    reg [15:0] _2417;
    wire _2418;
    wire [13:0] _2395;
    wire [15:0] _2396;
    reg [15:0] _2399;
    wire _4684;
    wire _4685;
    wire [15:0] _4686;
    wire [15:0] _4688;
    wire [15:0] _4690;
    wire _4668;
    wire [14:0] _2424;
    wire [15:0] _2425;
    reg [15:0] _2428;
    wire [16:0] _4664;
    wire _4665;
    wire [16:0] _4658;
    reg [16:0] _4661;
    wire _4607;
    wire _4608;
    wire [4:0] _4603;
    wire _4605;
    wire _4600;
    wire _4602;
    wire _4606;
    wire _4609;
    wire [7:0] _4610;
    wire [7:0] _4611;
    wire [7:0] _208;
    reg [7:0] _2393;
    wire _4619;
    wire _4620;
    wire [4:0] _4615;
    wire _4617;
    wire _4612;
    wire _4614;
    wire _4618;
    wire _4621;
    wire [7:0] _4622;
    wire [7:0] _4623;
    wire [7:0] _209;
    reg [7:0] _2390;
    wire [15:0] _2394;
    wire [16:0] _4652;
    wire [16:0] _4654;
    reg [16:0] _4657;
    wire _4634;
    wire _4635;
    wire [4:0] _4630;
    wire _4632;
    wire _4627;
    wire _4629;
    wire _4633;
    wire _4636;
    wire [7:0] _4637;
    wire [7:0] _4638;
    wire [7:0] _210;
    reg [7:0] _4626;
    wire [8:0] _4672;
    wire [7:0] _4674;
    wire [7:0] _4675;
    wire [7:0] _4676;
    wire [7:0] _4678;
    wire [7:0] _211;
    reg [7:0] _4646;
    wire [8:0] _4671;
    wire [8:0] _4673;
    wire _4679;
    wire _4680;
    wire _4681;
    wire _4683;
    wire _212;
    reg _4651;
    wire [16:0] _4662;
    wire [16:0] _4648;
    wire _4663;
    wire _4666;
    wire _4669;
    wire _4647;
    wire _4670;
    wire [15:0] _4692;
    wire _4642;
    wire _4640;
    wire _626;
    wire _4639;
    wire _4641;
    wire _4643;
    wire [15:0] _4693;
    wire [15:0] _4695;
    wire [15:0] _213;
    reg [15:0] _2386;
    wire _2400;
    wire _2401;
    wire _2383;
    wire _2402;
    wire _2419;
    wire _2421;
    wire _2430;
    wire [1:0] _2377;
    wire _2379;
    wire _2380;
    wire _2381;
    wire _2373;
    reg _2370;
    wire _2363;
    wire _2362;
    wire _2361;
    wire _2360;
    wire _2359;
    wire _2358;
    wire _2357;
    wire _2356;
    wire _4703;
    wire _4704;
    wire [4:0] _4699;
    wire _4701;
    wire _4696;
    wire _4698;
    wire _4702;
    wire _4705;
    wire [7:0] _4706;
    wire [7:0] _4707;
    wire [7:0] _214;
    reg [7:0] _2354;
    wire [2:0] _2355;
    reg _2364;
    reg _2367;
    wire _2371;
    wire _2372;
    wire _2374;
    wire _2382;
    wire _2433;
    wire _2351;
    wire _2456;
    wire _4715;
    wire _4716;
    wire [4:0] _4712;
    wire [4:0] _4711;
    wire _4713;
    wire _4708;
    wire _4710;
    wire _4714;
    wire _4717;
    wire [7:0] _4718;
    wire [7:0] _4719;
    wire [7:0] _215;
    reg [7:0] _2348;
    wire _2349;
    wire _2345;
    wire _2350;
    wire _2457;
    wire [1:0] _4779;
    wire _2514;
    wire [1:0] _4781;
    wire _4261;
    wire [1:0] _4788;
    wire _2776;
    wire [1:0] _4794;
    wire _2558;
    wire _2559;
    wire [1:0] _4796;
    wire [1:0] _216;
    reg [1:0] g_mode;
    wire _2376;
    wire _2870;
    wire [1:0] _4797;
    wire [1:0] _217;
    wire _4805;
    wire _4806;
    wire [4:0] _4801;
    wire _4803;
    wire _4798;
    wire _4800;
    wire _4804;
    wire _4807;
    wire [7:0] _4808;
    wire _2914;
    wire _2915;
    wire [7:0] _4809;
    wire [7:0] _218;
    reg [7:0] _2108;
    wire _2109;
    wire _2732;
    wire _2733;
    wire _2735;
    wire _2737;
    wire _2741;
    wire _2742;
    wire _2745;
    wire [1:0] _4821;
    wire [1:0] _4873;
    wire _2274;
    wire [1:0] _4875;
    wire _3846;
    wire [1:0] _4882;
    wire _2731;
    wire [1:0] _4888;
    wire [2:0] _1430;
    wire [2:0] _1429;
    wire [2:0] _1428;
    wire [2:0] _1427;
    reg [2:0] _1431;
    wire _1423;
    wire _1422;
    wire _1421;
    wire _1420;
    reg _1424;
    wire _4810;
    wire _4811;
    wire [2:0] _4813;
    wire [2:0] _219;
    wire _2315;
    wire _2316;
    wire [1:0] _4890;
    wire [1:0] _220;
    reg [1:0] g_mode_0;
    wire _2105;
    wire _2110;
    wire _2217;
    wire _2232;
    wire _2253;
    wire _2266;
    wire _2272;
    wire _2308;
    wire _3387;
    wire [5:0] _4893;
    wire _4892;
    wire [5:0] _4894;
    wire [5:0] _4895;
    wire [5:0] _221;
    reg [5:0] _1193;
    wire _2309;
    wire _3388;
    wire _222;
    wire _3425;
    wire _3427;
    wire _4896;
    wire [3:0] _4902;
    reg [3:0] _4905;
    wire [3:0] _223;
    wire _595;
    wire [7:0] _4907;
    wire [1:0] _2674;
    wire [1:0] _2672;
    wire [1:0] _2671;
    wire [1:0] _2670;
    wire [1:0] _2669;
    reg [1:0] _2673;
    wire [1:0] _2675;
    reg [7:0] _4919;
    wire [7:0] _4920;
    wire [7:0] _224;
    reg [7:0] _588;
    wire _589;
    wire [7:0] _4931;
    wire [7:0] _4930;
    wire [7:0] _4929;
    wire [1:0] _4926;
    wire [111:0] _711;
    wire [1:0] _4924;
    wire [111:0] _705;
    wire [1:0] _4923;
    wire [1:0] _4922;
    wire [1:0] _4921;
    reg [1:0] _4925;
    wire [1:0] _4927;
    reg [7:0] _4932;
    wire [7:0] _4933;
    wire [7:0] _225;
    reg [7:0] _583;
    wire _585;
    wire [3:0] _816;
    reg _817;
    wire _819;
    wire [15:0] _811;
    wire _813;
    wire [15:0] _802;
    wire [16:0] _803;
    wire [16:0] _804;
    reg [16:0] _807;
    wire _808;
    wire _809;
    wire [15:0] _798;
    wire _800;
    wire [2:0] _543;
    wire [2:0] _4948;
    wire _4944;
    wire _4945;
    wire _4942;
    wire _4946;
    wire [2:0] _4949;
    wire _4939;
    wire _4940;
    wire _4938;
    wire _4941;
    wire [2:0] _4951;
    wire _4935;
    wire [2:0] _4937;
    wire _4934;
    wire [2:0] _4952;
    wire [2:0] _226;
    reg [2:0] _539;
    wire _541;
    wire [2:0] _544;
    wire _534;
    wire _535;
    wire _533;
    wire _536;
    wire [2:0] _546;
    wire _530;
    wire _531;
    wire [2:0] _547;
    wire _782;
    wire [2:0] _784;
    wire [2:0] _522;
    wire [2:0] _4967;
    wire _4963;
    wire _4964;
    wire _4961;
    wire _4965;
    wire [2:0] _4968;
    wire _4958;
    wire _4959;
    wire _4957;
    wire _4960;
    wire [2:0] _4970;
    wire _4954;
    wire [2:0] _4956;
    wire _4953;
    wire [2:0] _4971;
    wire [2:0] _227;
    reg [2:0] _518;
    wire _520;
    wire [2:0] _523;
    wire _513;
    wire _514;
    wire _512;
    wire _515;
    wire [2:0] _525;
    wire _509;
    wire _510;
    wire [2:0] _526;
    wire _779;
    wire [2:0] _781;
    wire _785;
    wire [2:0] _786;
    wire [2:0] _499;
    wire [2:0] _4986;
    wire _4982;
    wire _4983;
    wire _4980;
    wire _4984;
    wire [2:0] _4987;
    wire _4977;
    wire _4978;
    wire _4976;
    wire _4979;
    wire [2:0] _4989;
    wire _4973;
    wire [2:0] _4975;
    wire _4972;
    wire [2:0] _4990;
    wire [2:0] _228;
    reg [2:0] _495;
    wire _497;
    wire [2:0] _500;
    wire _490;
    wire _491;
    wire _489;
    wire _492;
    wire [2:0] _502;
    wire _486;
    wire _487;
    wire [2:0] _503;
    wire _774;
    wire [2:0] _776;
    wire [2:0] _478;
    wire [2:0] _5005;
    wire _5001;
    wire _5002;
    wire _4999;
    wire _5003;
    wire [2:0] _5006;
    wire _4996;
    wire _4997;
    wire _4995;
    wire _4998;
    wire [2:0] _5008;
    wire _4992;
    wire [2:0] _4994;
    wire _4991;
    wire [2:0] _5009;
    wire [2:0] _229;
    reg [2:0] _474;
    wire _476;
    wire [2:0] _479;
    wire _469;
    wire _470;
    wire _468;
    wire _471;
    wire [2:0] _481;
    wire _465;
    wire _466;
    wire [2:0] _482;
    wire _771;
    wire [2:0] _773;
    wire _777;
    wire [2:0] _778;
    wire _787;
    wire [2:0] _788;
    wire [2:0] _453;
    wire [2:0] _5024;
    wire _5020;
    wire _5021;
    wire _5018;
    wire _5022;
    wire [2:0] _5025;
    wire _5015;
    wire _5016;
    wire _5014;
    wire _5017;
    wire [2:0] _5027;
    wire _5011;
    wire [2:0] _5013;
    wire _5010;
    wire [2:0] _5028;
    wire [2:0] _230;
    reg [2:0] _449;
    wire _451;
    wire [2:0] _454;
    wire _444;
    wire _445;
    wire _443;
    wire _446;
    wire [2:0] _456;
    wire _440;
    wire _441;
    wire [2:0] _457;
    wire _764;
    wire [2:0] _766;
    wire [2:0] _432;
    wire [2:0] _5043;
    wire _5039;
    wire _5040;
    wire _5037;
    wire _5041;
    wire [2:0] _5044;
    wire _5034;
    wire _5035;
    wire _5033;
    wire _5036;
    wire [2:0] _5046;
    wire _5030;
    wire [2:0] _5032;
    wire _5029;
    wire [2:0] _5047;
    wire [2:0] _231;
    reg [2:0] _428;
    wire _430;
    wire [2:0] _433;
    wire _423;
    wire _424;
    wire _422;
    wire _425;
    wire [2:0] _435;
    wire _419;
    wire _420;
    wire [2:0] _436;
    wire _761;
    wire [2:0] _763;
    wire _767;
    wire [2:0] _768;
    wire [2:0] _409;
    wire [2:0] _5062;
    wire _5058;
    wire _5059;
    wire _5056;
    wire _5060;
    wire [2:0] _5063;
    wire _5053;
    wire _5054;
    wire _5052;
    wire _5055;
    wire [2:0] _5065;
    wire _5049;
    wire [2:0] _5051;
    wire _5048;
    wire [2:0] _5066;
    wire [2:0] _232;
    reg [2:0] _405;
    wire _407;
    wire [2:0] _410;
    wire _400;
    wire _401;
    wire _399;
    wire _402;
    wire [2:0] _412;
    wire _396;
    wire _397;
    wire [2:0] _413;
    wire _756;
    wire [2:0] _758;
    wire [2:0] _388;
    wire [2:0] _5081;
    wire _5077;
    wire _5078;
    wire _5075;
    wire _5079;
    wire [2:0] _5082;
    wire _5072;
    wire _5073;
    wire _5071;
    wire _5074;
    wire [2:0] _5084;
    wire _5068;
    wire [2:0] _5070;
    wire _5067;
    wire [2:0] _5085;
    wire [2:0] _233;
    reg [2:0] _384;
    wire _386;
    wire [2:0] _389;
    wire _379;
    wire _380;
    wire _378;
    wire _381;
    wire [2:0] _391;
    wire _375;
    wire _376;
    wire [2:0] _392;
    wire [7:0] _752;
    wire _753;
    wire [2:0] _755;
    wire _759;
    wire [2:0] _760;
    wire _769;
    wire [2:0] _770;
    wire _789;
    wire [2:0] _790;
    wire [16:0] _791;
    wire _5088;
    wire [127:0] _5089;
    wire _5086;
    wire [127:0] _5090;
    wire [127:0] _234;
    reg [127:0] _297;
    wire _364;
    wire _365;
    wire [127:0] _366;
    wire _5093;
    wire [127:0] _5094;
    wire _5091;
    wire [127:0] _5095;
    wire [127:0] _235;
    reg [127:0] _294;
    wire _360;
    wire _361;
    wire [127:0] _362;
    wire _5098;
    wire [127:0] _5099;
    wire _5096;
    wire [127:0] _5100;
    wire [127:0] _236;
    reg [127:0] _291;
    wire _356;
    wire _357;
    wire [127:0] _358;
    wire _352;
    wire _353;
    wire [127:0] _354;
    wire [511:0] _367;
    wire [111:0] _748;
    wire [15:0] _749;
    wire [16:0] _750;
    wire [16:0] _792;
    reg [16:0] _795;
    wire gnd;
    wire [16:0] _747;
    wire _796;
    wire _797;
    wire _801;
    wire _810;
    wire [15:0] _5128;
    wire _5124;
    wire _5125;
    wire _5126;
    wire [15:0] _5129;
    wire _5108;
    wire _5109;
    wire [15:0] _5131;
    wire [15:0] _5133;
    wire [15:0] _237;
    reg [15:0] _340;
    wire [15:0] _5145;
    wire _5141;
    wire _5142;
    wire [8:0] _5120;
    wire _5121;
    wire [5:0] _5118;
    wire [5:0] _5117;
    wire _5119;
    wire [8:0] _5112;
    wire [8:0] _5134;
    wire [8:0] _5135;
    wire [8:0] _5137;
    wire [8:0] _238;
    reg [8:0] _5113;
    wire [2:0] _5114;
    wire _5116;
    wire [1:0] _5110;
    reg _5122;
    wire _5143;
    wire [15:0] _5146;
    wire _5138;
    wire _5139;
    wire [15:0] _5148;
    wire [15:0] _5150;
    wire [15:0] _239;
    reg [15:0] _337;
    wire [1:0] _743;
    reg [15:0] _744;
    wire _746;
    wire _814;
    reg [7:0] _322;
    wire [7:0] f_chg_now;
    wire _5152;
    wire [7:0] _5154;
    wire _5151;
    wire [7:0] _5155;
    wire [7:0] _5157;
    wire [7:0] _240;
    reg [7:0] _319;
    wire [7:0] f_changed_all;
    wire [7:0] _737;
    wire _739;
    wire _740;
    wire [7:0] f_chgmask1;
    wire _736;
    wire _741;
    wire [7:0] _730;
    wire [7:0] _728;
    wire [7:0] _242;
    reg [7:0] _303;
    reg [7:0] _306;
    wire [7:0] _729;
    wire [7:0] _731;
    wire _733;
    wire [111:0] _699;
    wire f_valid1;
    wire _734;
    wire _742;
    wire _815;
    wire _820;
    wire _859;
    wire _860;
    wire _864;
    wire f_fire1;
    wire [1:0] _1008;
    wire [1:0] f_winner;
    reg [2:0] _5105;
    wire [2:0] _5107;
    wire _5158;
    wire _1391;
    wire f_in_fetch;
    wire _1392;
    wire _1393;
    wire _5159;
    wire [15:0] _5168;
    wire [15:0] _5170;
    wire [15:0] _243;
    reg [15:0] _334;
    wire [1:0] _1602;
    reg [15:0] _1603;
    wire [15:0] _1601;
    wire _1604;
    wire [63:0] _694;
    wire _1599;
    wire _1597;
    wire _1598;
    wire _1600;
    wire _1605;
    wire _1610;
    wire _1632;
    wire f_viol_now;
    wire [2:0] _5176;
    wire [2:0] _5179;
    wire _5172;
    wire [2:0] _5180;
    wire _5171;
    wire [2:0] _5183;
    wire [2:0] _5185;
    wire [2:0] _244;
    reg [2:0] _350;
    wire _5188;
    wire [127:0] _5189;
    wire _5186;
    wire [127:0] _5190;
    wire [127:0] _245;
    reg [127:0] _288;
    wire [511:0] _298;
    wire [111:0] _299;
    wire f_valid0;
    wire _313;
    wire _330;
    wire _579;
    wire _639;
    wire _683;
    wire f_in_eval;
    wire _684;
    wire _693;
    wire f_fire0;
    wire _1094;
    wire _1095;
    wire _1190;
    wire [1:0] _5422;
    wire _5407;
    wire [1:0] _5409;
    wire _5405;
    wire [1:0] _5423;
    wire _5404;
    wire [1:0] _5426;
    wire _5193;
    wire _5192;
    wire _5194;
    wire _5195;
    wire _246;
    reg _1389;
    wire [1:0] _5428;
    wire [7:0] _5202;
    wire [7:0] _5203;
    wire [7:0] _247;
    reg [7:0] _5198;
    wire [7:0] _5210;
    wire [7:0] _5211;
    wire [7:0] _248;
    reg [7:0] _5206;
    wire [7:0] _5218;
    wire [7:0] _5219;
    wire [7:0] _249;
    reg [7:0] _5214;
    wire [7:0] _5226;
    wire [7:0] _5227;
    wire [7:0] _250;
    reg [7:0] _5222;
    wire [31:0] _5393;
    wire [31:0] _5391;
    wire [31:0] _5342;
    wire [30:0] _5340;
    wire [31:0] _5341;
    wire [31:0] _5343;
    wire [30:0] _5337;
    wire [31:0] _5338;
    wire [30:0] _5330;
    wire [31:0] _5331;
    wire [31:0] _5333;
    wire [30:0] _5327;
    wire [31:0] _5328;
    wire [30:0] _5320;
    wire [31:0] _5321;
    wire [31:0] _5323;
    wire [30:0] _5317;
    wire [31:0] _5318;
    wire [30:0] _5310;
    wire [31:0] _5311;
    wire [31:0] _5313;
    wire [30:0] _5307;
    wire [31:0] _5308;
    wire [30:0] _5300;
    wire [31:0] _5301;
    wire [31:0] _5303;
    wire [30:0] _5297;
    wire [31:0] _5298;
    wire [30:0] _5290;
    wire [31:0] _5291;
    wire [31:0] _5293;
    wire [30:0] _5287;
    wire [31:0] _5288;
    wire [30:0] _5280;
    wire [31:0] _5281;
    wire [31:0] _5283;
    wire [30:0] _5277;
    wire [31:0] _5278;
    wire [30:0] _5270;
    wire [31:0] _5271;
    wire [31:0] _5273;
    wire [30:0] _5267;
    wire [31:0] _5268;
    wire [7:0] _5261;
    wire [7:0] _5260;
    wire [7:0] _5259;
    wire [7:0] _5258;
    wire [7:0] _5257;
    wire [7:0] _5256;
    wire [7:0] _5255;
    wire [7:0] _5254;
    wire [7:0] _5253;
    wire [7:0] _5252;
    wire [7:0] _5251;
    wire [7:0] _5250;
    wire [7:0] _5249;
    wire [7:0] _5248;
    wire [7:0] _5247;
    wire [127:0] _252;
    wire [7:0] _5246;
    wire [12:0] _5243;
    wire [12:0] _5244;
    wire [3:0] _5245;
    reg [7:0] _5262;
    wire [31:0] _5263;
    wire _5240;
    wire _5241;
    wire [31:0] _5345;
    wire [31:0] _5238;
    wire [31:0] _5346;
    wire [31:0] _253;
    reg [31:0] _5236;
    wire [31:0] _5264;
    wire _5265;
    wire [31:0] _5274;
    wire _5275;
    wire [31:0] _5284;
    wire _5285;
    wire [31:0] _5294;
    wire _5295;
    wire [31:0] _5304;
    wire _5305;
    wire [31:0] _5314;
    wire _5315;
    wire [31:0] _5324;
    wire _5325;
    wire [31:0] _5334;
    wire _5335;
    wire [31:0] _5344;
    wire [31:0] _5392;
    wire f_sw_match;
    wire _5395;
    wire _5397;
    wire _1357;
    wire _1356;
    wire f_store_we;
    wire _5386;
    wire _5388;
    wire _5390;
    wire [12:0] _5379;
    wire [12:0] _5350;
    wire [12:0] _5348;
    wire [12:0] _5351;
    wire [12:0] _254;
    reg [12:0] f_sw_cnt;
    wire f_sw_last;
    wire _5382;
    wire [3:0] _5199;
    wire _5201;
    wire _5354;
    wire [3:0] _5208;
    wire [3:0] _5207;
    wire _5209;
    wire _5356;
    wire [3:0] _5216;
    wire [3:0] _5215;
    wire _5217;
    wire _5358;
    wire [3:0] _5224;
    wire [3:0] _5223;
    wire _5225;
    wire _5360;
    wire _2713;
    wire _2710;
    wire _2711;
    wire _2708;
    wire _2709;
    wire _2712;
    wire _2714;
    wire _5361;
    wire _255;
    reg _5376;
    wire [3:0] _1367;
    wire [3:0] _1366;
    wire _1368;
    wire _5364;
    wire _1345;
    wire _1346;
    wire _5365;
    wire _256;
    reg _1355;
    wire _5373;
    wire _5377;
    wire _5378;
    wire _5384;
    wire _5232;
    wire _5368;
    wire _5367;
    wire _5369;
    wire _5370;
    wire _257;
    reg _5230;
    wire _5231;
    wire _5233;
    wire _5372;
    wire _5385;
    wire _258;
    reg f_sweeping;
    wire _5398;
    wire _259;
    reg f_image_valid;
    wire _5401;
    wire [3:0] _2643;
    wire _5400;
    wire _5402;
    wire _2639;
    wire _2640;
    wire _2636;
    wire _2637;
    wire _2634;
    wire _1242;
    wire _1237;
    wire _1243;
    wire _2635;
    wire _2638;
    wire _2641;
    wire _5403;
    wire _260;
    reg _1382;
    wire _1386;
    wire [1:0] _5430;
    wire [1:0] _261;
    reg [1:0] _283;
    wire _1310;
    wire _1592;
    wire _262;
    wire [7:0] _5494;
    wire [3:0] _5491;
    reg [7:0] _5512;
    wire _5490;
    wire [7:0] _5524;
    wire [12:0] _5449;
    wire [15:0] _5451;
    wire [15:0] _5448;
    wire [2:0] _5443;
    wire _5445;
    wire _5442;
    wire _5446;
    wire [15:0] _5452;
    wire [7:0] _5438;
    wire [15:0] _5439;
    wire [7:0] _5435;
    wire [15:0] _5436;
    wire _5434;
    wire [15:0] _5437;
    wire _5432;
    wire [15:0] _5440;
    wire [15:0] _5453;
    wire [15:0] _5454;
    wire [15:0] _263;
    reg [15:0] _1330;
    wire _5489;
    wire [7:0] _5533;
    wire [2:0] _1244;
    reg [7:0] _5556;
    wire _265;
    reg _1256;
    reg _1259;
    wire [6:0] _5455;
    wire [6:0] _5456;
    wire [6:0] _266;
    reg [6:0] _1253;
    wire [7:0] _1260;
    wire _5462;
    wire [7:0] _5463;
    wire [7:0] _5464;
    wire [7:0] _5466;
    wire [7:0] _267;
    reg [7:0] _1240;
    wire _1241;
    wire [1:0] _5471;
    wire _5468;
    wire _5469;
    wire [1:0] _5472;
    wire _1230;
    wire _1231;
    wire [1:0] _5473;
    wire [1:0] _5475;
    wire [1:0] _268;
    reg [1:0] _1234;
    wire _1236;
    wire _5487;
    wire [7:0] _5557;
    wire [6:0] _5484;
    wire [7:0] _5486;
    wire [2:0] _5477;
    wire _1224;
    wire _1220;
    wire _1225;
    wire [2:0] _5478;
    wire [2:0] _5480;
    wire [2:0] _269;
    reg [2:0] _1228;
    wire _2830;
    wire [7:0] _5558;
    reg _1223;
    wire _271;
    reg _1216;
    reg _1219;
    wire _2823;
    wire _2824;
    wire _2825;
    wire [7:0] _5559;
    wire _5459;
    reg _5458;
    wire _5460;
    wire [7:0] _5563;
    wire [7:0] _272;
    reg [7:0] _5483;
    wire _5564;
    wire vdd;
    wire _274;
    wire _276;
    wire _278;
    reg _1210;
    reg _1212;
    wire _1213;
    wire _5565;
    assign _1300 = _45[11:0];
    assign _1297 = _1290 < _1287;
    assign _1298 = _1272 & _1297;
    assign _1299 = _1298 ? _1287 : _1290;
    assign _1301 = _1299 < _1300;
    assign _1302 = _1301 ? _1300 : _1299;
    assign _1303 = _1283 ? _1299 : _1302;
    assign _1289 = 12'b000000000000;
    assign _1087 = 12'b111111111111;
    assign _1084 = _1082[11:0];
    assign _1081 = 13'b0000000000000;
    assign _1078 = 10'b0000000000;
    assign _1079 = { _1078,
                     _1075 };
    assign _1080 = _1071 - _1079;
    assign _1074 = 3'b000;
    always @* begin
        case (f_winner)
        0:
            _1054 <= _653;
        1:
            _1054 <= _829;
        2:
            _1054 <= _967;
        default:
            _1054 <= _1053;
        endcase
    end
    assign _1 = _1054;
    always @(posedge _276) begin
        if (_274)
            _1075 <= _1074;
        else
            _1075 <= _1;
    end
    assign _1076 = { _1078,
                     _1075 };
    assign _1061 = 13'b1111111111111;
    assign _1060 = _1058[12:0];
    assign _1055 = 16'b0001111111111111;
    assign _1059 = _1055 < _1058;
    assign _1062 = _1059 ? _1061 : _1060;
    assign _2 = _1062;
    always @(posedge _276) begin
        if (_274)
            _1071 <= _1081;
        else
            _1071 <= _2;
    end
    assign _1077 = _1071 < _1076;
    assign _1082 = _1077 ? _1081 : _1080;
    assign _1068 = 13'b0111111111111;
    assign _1083 = _1068 < _1082;
    assign _1086 = _1083 ? _1087 : _1084;
    assign _1066 = 1'b0;
    assign _1063 = 16'b1111111111111111;
    assign _1064 = _1058 == _1063;
    assign _3 = _1064;
    always @(posedge _276) begin
        if (_274)
            _1067 <= _1066;
        else
            _1067 <= _3;
    end
    assign _1088 = _1067 ? _1087 : _1086;
    assign _4 = _1088;
    always @(posedge _276) begin
        if (_274)
            _1290 <= _1289;
        else
            _1290 <= _4;
    end
    assign _1091 = _1058[11:0];
    always @* begin
        case (f_winner)
        0:
            _1057 <= _331;
        1:
            _1057 <= _743;
        2:
            _1057 <= _881;
        default:
            _1057 <= _1056;
        endcase
    end
    always @* begin
        case (_1057)
        0:
            _1058 <= _334;
        1:
            _1058 <= _337;
        2:
            _1058 <= _340;
        default:
            _1058 <= _340;
        endcase
    end
    assign _1089 = 16'b0000111111111111;
    assign _1090 = _1089 < _1058;
    assign _1093 = _1090 ? _1087 : _1091;
    assign _5 = _1093;
    always @(posedge _276) begin
        if (_274)
            _1287 <= _1289;
        else
            _1287 <= _5;
    end
    assign _1291 = _1287 < _1290;
    assign _1292 = _1272 & _1291;
    assign _1293 = _1292 ? _1287 : _1290;
    assign _1284 = _45[23:12];
    assign _1294 = _1284 < _1293;
    assign _1295 = _1294 ? _1284 : _1293;
    assign _1282 = 8'b00000000;
    assign _1283 = _1267 == _1282;
    assign _1296 = _1283 ? _1293 : _1295;
    assign _1280 = 8'b11111111;
    assign _1279 = _1277[7:0];
    assign _1274 = 2'b10;
    assign _1273 = 2'b01;
    assign _1207 = _1203 == _1206;
    assign _1199 = _1195 & _1198;
    assign _1208 = _1199 & _1207;
    assign _6 = _1208;
    always @(posedge _276) begin
        if (_274)
            _1272 <= _1066;
        else
            _1272 <= _6;
    end
    assign _1275 = _1272 ? _1274 : _1273;
    assign _1269 = 7'b0000000;
    assign _1276 = { _1269,
                     _1275 };
    assign _1267 = _45[31:24];
    assign _1268 = { gnd,
                     _1267 };
    assign _1277 = _1268 + _1276;
    assign _1278 = _1277[8:8];
    assign _1281 = _1278 ? _1280 : _1279;
    assign _1304 = { _1281,
                     _1296,
                     _1303 };
    assign _1249 = 32'b00000000000000000000000000000000;
    assign _1261 = _1250[31:8];
    assign _1262 = { _1260,
                     _1261 };
    assign _1263 = _1247 ? _1262 : _1250;
    assign _7 = _1263;
    always @(posedge _276) begin
        if (_274)
            _1250 <= _1249;
        else
            _1250 <= _7;
    end
    assign _1305 = _1266 ? _1304 : _1250;
    assign _1321 = _1266 | f_host_cov_we;
    assign _1319 = ~ f_sweeping;
    assign _1314 = ~ _1198;
    assign _1312 = ~ _1266;
    assign _1311 = _1308 & _1310;
    assign _1313 = _1311 & _1312;
    assign _1315 = _1313 & _1314;
    assign f_host_cov_we = _1315 & _1319;
    assign _1323 = ~ f_host_cov_we;
    assign _1322 = ~ _1266;
    assign _1324 = _1322 & _1323;
    assign _11 = _1206;
    always @(posedge _276) begin
        if (_274)
            _1342 <= _1282;
        else
            _1342 <= _11;
    end
    assign _1334 = _1330[9:2];
    assign _1335 = _1333 ? _1334 : _1327;
    assign _1336 = _1247 ? _1335 : _1327;
    assign _12 = _1336;
    always @(posedge _276) begin
        if (_274)
            _1327 <= _1282;
        else
            _1327 <= _12;
    end
    assign _1337 = _1330[9:2];
    assign _1338 = _1308 ? _1327 : _1337;
    assign _1339 = _1198 ? _1206 : _1338;
    assign _1343 = _1266 ? _1342 : _1339;
    assign _1348 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign _1350 = _1349[127:8];
    assign _1351 = { _1260,
                     _1350 };
    assign _1352 = _1346 ? _1351 : _1349;
    assign _14 = _1352;
    always @(posedge _276) begin
        if (_274)
            _1349 <= _1348;
        else
            _1349 <= _14;
    end
    assign _1362 = _1361 | f_sweeping;
    assign _1377 = _350[1:0];
    assign _1378 = { _1202,
                     _1377 };
    assign _1375 = f_sw_cnt[11:4];
    assign _1369 = _1330[11:4];
    assign _1370 = _1368 ? _1369 : _1365;
    assign _1371 = _1346 ? _1370 : _1365;
    assign _18 = _1371;
    always @(posedge _276) begin
        if (_274)
            _1365 <= _1282;
        else
            _1365 <= _18;
    end
    assign _1376 = f_sweeping ? _1375 : _1365;
    assign _1359 = 3'b100;
    assign _1360 = _350 < _1359;
    assign _1361 = f_in_fetch & _1360;
    assign _1379 = _1361 ? _1378 : _1376;
    assign _1551 = _1460 & _1550;
    assign _1552 = ~ _1551;
    assign _1415 = _694[23:16];
    assign _1413 = _711[86:79];
    assign _1412 = _705[86:79];
    assign _1411 = _699[86:79];
    assign _1410 = _299[86:79];
    always @* begin
        case (f_winner)
        0:
            _1414 <= _1410;
        1:
            _1414 <= _1411;
        2:
            _1414 <= _1412;
        default:
            _1414 <= _1413;
        endcase
    end
    assign _1416 = _1392 ? _1415 : _1414;
    assign _1417 = _1416 & _1407;
    assign _1408 = ~ _1407;
    assign _1409 = f_poe & _1408;
    assign _1418 = _1409 | _1417;
    assign _1452 = _1418 | _1451;
    assign _1453 = _1397 ? _1452 : f_poe;
    assign _1455 = _1389 ? _1282 : _1453;
    assign _1457 = _1386 ? _1282 : _1455;
    assign _20 = _1457;
    always @(posedge _276) begin
        if (_274)
            f_poe <= _1282;
        else
            f_poe <= _20;
    end
    assign _1553 = f_poe & _1552;
    assign _1578 = ~ _1460;
    assign _1548 = f_lane1_out & _1542;
    assign _1547 = ~ f_lane1_out;
    assign _1545 = ~ f_lane0_out;
    assign _1546 = _1545 & _1542;
    assign _1544 = f_lane0_out & _1542;
    assign _1543 = ~ f_lane0_out;
    assign _1542 = f_pout[0:0];
    assign _1541 = _1470[2:0];
    always @* begin
        case (_1541)
        0:
            _1549 <= _1542;
        1:
            _1549 <= f_lane0_out;
        2:
            _1549 <= _1543;
        3:
            _1549 <= _1544;
        4:
            _1549 <= _1546;
        5:
            _1549 <= f_lane1_out;
        6:
            _1549 <= _1547;
        default:
            _1549 <= _1548;
        endcase
    end
    assign _1539 = f_lane1_out & _1533;
    assign _1538 = ~ f_lane1_out;
    assign _1536 = ~ f_lane0_out;
    assign _1537 = _1536 & _1533;
    assign _1535 = f_lane0_out & _1533;
    assign _1534 = ~ f_lane0_out;
    assign _1533 = f_pout[1:1];
    assign _1532 = _1470[5:3];
    always @* begin
        case (_1532)
        0:
            _1540 <= _1533;
        1:
            _1540 <= f_lane0_out;
        2:
            _1540 <= _1534;
        3:
            _1540 <= _1535;
        4:
            _1540 <= _1537;
        5:
            _1540 <= f_lane1_out;
        6:
            _1540 <= _1538;
        default:
            _1540 <= _1539;
        endcase
    end
    assign _1530 = f_lane1_out & _1524;
    assign _1529 = ~ f_lane1_out;
    assign _1527 = ~ f_lane0_out;
    assign _1528 = _1527 & _1524;
    assign _1526 = f_lane0_out & _1524;
    assign _1525 = ~ f_lane0_out;
    assign _1524 = f_pout[2:2];
    assign _1523 = _1470[8:6];
    always @* begin
        case (_1523)
        0:
            _1531 <= _1524;
        1:
            _1531 <= f_lane0_out;
        2:
            _1531 <= _1525;
        3:
            _1531 <= _1526;
        4:
            _1531 <= _1528;
        5:
            _1531 <= f_lane1_out;
        6:
            _1531 <= _1529;
        default:
            _1531 <= _1530;
        endcase
    end
    assign _1521 = f_lane1_out & _1515;
    assign _1520 = ~ f_lane1_out;
    assign _1518 = ~ f_lane0_out;
    assign _1519 = _1518 & _1515;
    assign _1517 = f_lane0_out & _1515;
    assign _1516 = ~ f_lane0_out;
    assign _1515 = f_pout[3:3];
    assign _1514 = _1470[11:9];
    always @* begin
        case (_1514)
        0:
            _1522 <= _1515;
        1:
            _1522 <= f_lane0_out;
        2:
            _1522 <= _1516;
        3:
            _1522 <= _1517;
        4:
            _1522 <= _1519;
        5:
            _1522 <= f_lane1_out;
        6:
            _1522 <= _1520;
        default:
            _1522 <= _1521;
        endcase
    end
    assign _1512 = f_lane1_out & _1506;
    assign _1511 = ~ f_lane1_out;
    assign _1509 = ~ f_lane0_out;
    assign _1510 = _1509 & _1506;
    assign _1508 = f_lane0_out & _1506;
    assign _1507 = ~ f_lane0_out;
    assign _1506 = f_pout[4:4];
    assign _1505 = _1470[14:12];
    always @* begin
        case (_1505)
        0:
            _1513 <= _1506;
        1:
            _1513 <= f_lane0_out;
        2:
            _1513 <= _1507;
        3:
            _1513 <= _1508;
        4:
            _1513 <= _1510;
        5:
            _1513 <= f_lane1_out;
        6:
            _1513 <= _1511;
        default:
            _1513 <= _1512;
        endcase
    end
    assign _1503 = f_lane1_out & _1497;
    assign _1502 = ~ f_lane1_out;
    assign _1500 = ~ f_lane0_out;
    assign _1501 = _1500 & _1497;
    assign _1499 = f_lane0_out & _1497;
    assign _1498 = ~ f_lane0_out;
    assign _1497 = f_pout[5:5];
    assign _1496 = _1470[17:15];
    always @* begin
        case (_1496)
        0:
            _1504 <= _1497;
        1:
            _1504 <= f_lane0_out;
        2:
            _1504 <= _1498;
        3:
            _1504 <= _1499;
        4:
            _1504 <= _1501;
        5:
            _1504 <= f_lane1_out;
        6:
            _1504 <= _1502;
        default:
            _1504 <= _1503;
        endcase
    end
    assign _1494 = f_lane1_out & _1488;
    assign _1493 = ~ f_lane1_out;
    assign _1491 = ~ f_lane0_out;
    assign _1492 = _1491 & _1488;
    assign _1490 = f_lane0_out & _1488;
    assign _1489 = ~ f_lane0_out;
    assign _1488 = f_pout[6:6];
    assign _1487 = _1470[20:18];
    always @* begin
        case (_1487)
        0:
            _1495 <= _1488;
        1:
            _1495 <= f_lane0_out;
        2:
            _1495 <= _1489;
        3:
            _1495 <= _1490;
        4:
            _1495 <= _1492;
        5:
            _1495 <= f_lane1_out;
        6:
            _1495 <= _1493;
        default:
            _1495 <= _1494;
        endcase
    end
    assign _1485 = f_lane1_out & _1475;
    assign _1484 = ~ f_lane1_out;
    assign _1480 = ~ f_lane0_out;
    assign _1481 = _1480 & _1475;
    assign _1479 = f_lane0_out & _1475;
    assign _1478 = ~ f_lane0_out;
    assign _1570 = { _1568,
                     _1567 };
    assign _1567 = _588[0:0];
    assign _1568 = { _1567,
                     _1567 };
    assign _1569 = { _1568,
                     _1568 };
    assign _1571 = { _1569,
                     _1570 };
    assign _1572 = { _1571,
                     _1567 };
    assign _1573 = _1572 & _1451;
    assign _1449 = _1445 & _1443;
    assign _1448 = _1445 & _1441;
    assign _1447 = _1445 & _1438;
    assign _1445 = ~ _1432;
    assign _1446 = _1445 & _1435;
    assign _1443 = _1440 & _1437;
    assign _1444 = _1432 & _1443;
    assign _1440 = ~ _1433;
    assign _1441 = _1440 & _1434;
    assign _1442 = _1432 & _1441;
    assign _1437 = ~ _1434;
    assign _1438 = _1433 & _1437;
    assign _1439 = _1432 & _1438;
    assign _1434 = _1431[0:0];
    assign _1433 = _1431[1:1];
    assign _1435 = _1433 & _1434;
    assign _1432 = _1431[2:2];
    assign _1436 = _1432 & _1435;
    assign _1450 = { _1436,
                     _1439,
                     _1442,
                     _1444,
                     _1446,
                     _1447,
                     _1448,
                     _1449 };
    assign _1419 = ~ _1392;
    assign _1425 = _1419 & _1424;
    assign _1451 = _1425 ? _1450 : _1282;
    assign _1565 = ~ _1451;
    assign _1561 = _694[15:8];
    assign _1559 = _711[78:71];
    assign _1558 = _705[78:71];
    assign _1557 = _699[78:71];
    assign _1556 = _299[78:71];
    always @* begin
        case (f_winner)
        0:
            _1560 <= _1556;
        1:
            _1560 <= _1557;
        2:
            _1560 <= _1558;
        default:
            _1560 <= _1559;
        endcase
    end
    assign _1562 = _1392 ? _1561 : _1560;
    assign _1563 = _1562 & _1407;
    assign _1406 = _694[7:0];
    assign _1404 = _711[70:63];
    assign _1403 = _705[70:63];
    assign _1402 = _699[70:63];
    assign _1401 = _299[70:63];
    always @* begin
        case (f_winner)
        0:
            _1405 <= _1401;
        1:
            _1405 <= _1402;
        2:
            _1405 <= _1403;
        default:
            _1405 <= _1404;
        endcase
    end
    assign _1407 = _1392 ? _1406 : _1405;
    assign _1554 = ~ _1407;
    assign _1555 = f_pout & _1554;
    assign _1564 = _1555 | _1563;
    assign _1566 = _1564 & _1565;
    assign _1574 = _1566 | _1573;
    assign _1394 = 2'b00;
    assign _1395 = _642 == _1394;
    assign _1396 = _1395 | _644;
    assign _1397 = _1393 & _1396;
    assign _1575 = _1397 ? _1574 : f_pout;
    assign _1577 = _1386 ? _1282 : _1575;
    assign _22 = _1577;
    always @(posedge _276) begin
        if (_274)
            f_pout <= _1282;
        else
            f_pout <= _22;
    end
    assign _1475 = f_pout[7:7];
    assign _1470 = { _1463,
                     _1466,
                     _1469 };
    assign _1471 = _1470[23:21];
    always @* begin
        case (_1471)
        0:
            _1486 <= _1475;
        1:
            _1486 <= f_lane0_out;
        2:
            _1486 <= _1478;
        3:
            _1486 <= _1479;
        4:
            _1486 <= _1481;
        5:
            _1486 <= f_lane1_out;
        6:
            _1486 <= _1484;
        default:
            _1486 <= _1485;
        endcase
    end
    assign _1550 = { _1486,
                     _1495,
                     _1504,
                     _1513,
                     _1522,
                     _1531,
                     _1540,
                     _1549 };
    assign _1579 = _1550 & _1578;
    always @(posedge _276) begin
        if (_274)
            _1623 <= _1394;
        else
            _1623 <= _1620;
    end
    assign _1630 = { _1623,
                     _1626,
                     _1629 };
    always @(posedge _276) begin
        if (_274)
            _1589 <= _1066;
        else
            _1589 <= _1190;
    end
    assign _1596 = { _1589,
                     _1591,
                     _1592,
                     _1595 };
    always @(posedge _276) begin
        if (_274)
            _1585 <= _1394;
        else
            _1585 <= f_winner;
    end
    assign _1582 = _1202[5:4];
    assign _1586 = { _1582,
                     _1585 };
    assign _1581 = _1202[3:0];
    assign _1580 = _1193[5:4];
    always @* begin
        case (_1580)
        0:
            _1631 <= _1581;
        1:
            _1631 <= _1586;
        2:
            _1631 <= _1596;
        default:
            _1631 <= _1630;
        endcase
    end
    always @(posedge _276) begin
        if (_274)
            _1636 <= _1066;
        else
            _1636 <= f_viol_now;
    end
    assign _5561 = ~ _89;
    assign _5560 = ~ _90;
    assign _5562 = { _262,
                     _100,
                     _98,
                     _91,
                     _5560,
                     _5561,
                     _88,
                     _87 };
    assign _1729 = 3'b111;
    assign _1730 = _1668 == _1729;
    assign _1731 = _1665 & _1730;
    always @(posedge _276) begin
        if (_274)
            _1732 <= _1282;
        else
            if (_1731)
                _1732 <= _141;
    end
    assign _1723 = 3'b110;
    assign _1724 = _1668 == _1723;
    assign _1725 = _1665 & _1724;
    always @(posedge _276) begin
        if (_274)
            _1726 <= _1282;
        else
            if (_1725)
                _1726 <= _141;
    end
    assign _1717 = 3'b101;
    assign _1718 = _1668 == _1717;
    assign _1719 = _1665 & _1718;
    always @(posedge _276) begin
        if (_274)
            _1720 <= _1282;
        else
            if (_1719)
                _1720 <= _141;
    end
    assign _1712 = _1668 == _1359;
    assign _1713 = _1665 & _1712;
    always @(posedge _276) begin
        if (_274)
            _1714 <= _1282;
        else
            if (_1713)
                _1714 <= _141;
    end
    assign _1705 = 3'b011;
    assign _1706 = _1668 == _1705;
    assign _1707 = _1665 & _1706;
    always @(posedge _276) begin
        if (_274)
            _1708 <= _1282;
        else
            if (_1707)
                _1708 <= _141;
    end
    assign _1699 = 3'b010;
    assign _1700 = _1668 == _1699;
    assign _1701 = _1665 & _1700;
    always @(posedge _276) begin
        if (_274)
            _1702 <= _1282;
        else
            if (_1701)
                _1702 <= _141;
    end
    assign _1693 = 3'b001;
    assign _1694 = _1668 == _1693;
    assign _1695 = _1665 & _1694;
    always @(posedge _276) begin
        if (_274)
            _1696 <= _1282;
        else
            if (_1695)
                _1696 <= _141;
    end
    assign _1670 = _1668 + _1693;
    assign _1671 = _1665 ? _1670 : _1668;
    assign _28 = _1671;
    always @(posedge _276) begin
        if (_274)
            _1668 <= _1074;
        else
            _1668 <= _28;
    end
    assign _1688 = _1668 == _1074;
    assign _1689 = _1665 & _1688;
    always @(posedge _276) begin
        if (_274)
            _1690 <= _1282;
        else
            if (_1689)
                _1690 <= _141;
    end
    assign _1683 = _1681 + _1693;
    assign _1684 = _1678 ? _1683 : _1681;
    assign _29 = _1684;
    always @(posedge _276) begin
        if (_274)
            _1681 <= _1074;
        else
            _1681 <= _29;
    end
    always @* begin
        case (_1681)
        0:
            _1733 <= _1690;
        1:
            _1733 <= _1696;
        2:
            _1733 <= _1702;
        3:
            _1733 <= _1708;
        4:
            _1733 <= _1714;
        5:
            _1733 <= _1720;
        6:
            _1733 <= _1726;
        default:
            _1733 <= _1732;
        endcase
    end
    assign _30 = _1733;
    assign _5553 = _90 ? _1282 : _30;
    assign _5547 = _43[47:40];
    assign _5546 = _43[39:32];
    assign _5545 = _43[31:24];
    assign _5544 = _43[23:16];
    assign _5543 = _43[15:8];
    assign _2093 = _1740 == _1729;
    assign _2094 = _1737 & _2093;
    assign _2091 = 48'b000000000000000000000000000000000000000000000000;
    always @(posedge _276) begin
        if (_274)
            _2095 <= _2091;
        else
            if (_2094)
                _2095 <= _41;
    end
    assign _2087 = _1740 == _1723;
    assign _2088 = _1737 & _2087;
    always @(posedge _276) begin
        if (_274)
            _2089 <= _2091;
        else
            if (_2088)
                _2089 <= _41;
    end
    assign _2081 = _1740 == _1717;
    assign _2082 = _1737 & _2081;
    always @(posedge _276) begin
        if (_274)
            _2083 <= _2091;
        else
            if (_2082)
                _2083 <= _41;
    end
    assign _2075 = _1740 == _1359;
    assign _2076 = _1737 & _2075;
    always @(posedge _276) begin
        if (_274)
            _2077 <= _2091;
        else
            if (_2076)
                _2077 <= _41;
    end
    assign _2069 = _1740 == _1705;
    assign _2070 = _1737 & _2069;
    always @(posedge _276) begin
        if (_274)
            _2071 <= _2091;
        else
            if (_2070)
                _2071 <= _41;
    end
    assign _2063 = _1740 == _1699;
    assign _2064 = _1737 & _2063;
    always @(posedge _276) begin
        if (_274)
            _2065 <= _2091;
        else
            if (_2064)
                _2065 <= _41;
    end
    assign _2057 = _1740 == _1693;
    assign _2058 = _1737 & _2057;
    always @(posedge _276) begin
        if (_274)
            _2059 <= _2091;
        else
            if (_2058)
                _2059 <= _41;
    end
    assign _1742 = _1740 + _1693;
    assign _1743 = _1737 ? _1742 : _1740;
    assign _31 = _1743;
    always @(posedge _276) begin
        if (_274)
            _1740 <= _1074;
        else
            _1740 <= _31;
    end
    assign _2051 = _1740 == _1074;
    assign _2052 = _1737 & _2051;
    assign _1618 = { _1610,
                     f_unexp_now };
    assign _1620 = f_amb_now ? _1394 : _1618;
    assign _2034 = _1925 - _2030;
    assign _1751 = 29'b11111111111111111111111111111;
    assign _1750 = 29'b00000000000000000000000000000;
    assign _1753 = 29'b00000000000000000000000000001;
    assign _1754 = ts_hi_m1 + _1753;
    assign _1747 = ts_reg[2:0];
    assign _1749 = _1747 == _1729;
    assign _1755 = _1749 ? _1754 : ts_hi_m1;
    assign _32 = _1755;
    always @(posedge _276) begin
        if (_274)
            ts_hi_m1 <= _1751;
        else
            ts_hi_m1 <= _32;
    end
    assign _2032 = ts_reg[31:3];
    assign _1773 = _1760 + _1693;
    assign _1769 = _1760 == _1729;
    assign _1770 = ~ _1769;
    assign _1767 = _687[0:0];
    assign _1771 = _1767 & _1770;
    assign _1774 = _1771 ? _1773 : _1760;
    assign _1764 = _687[0:0];
    assign _1765 = ~ _1764;
    assign _1762 = _319[0:0];
    assign _1761 = f_chg_now[0:0];
    assign _1763 = _1761 & _1762;
    assign _1766 = _1763 & _1765;
    assign _1776 = _1766 ? _1693 : _1774;
    assign _1757 = _283 == _1273;
    assign _1777 = _1757 ? _1776 : _1760;
    assign _33 = _1777;
    always @(posedge _276) begin
        if (_274)
            _1760 <= _1074;
        else
            _1760 <= _33;
    end
    assign _2023 = _687[0:0];
    assign _2025 = _2023 ? _1760 : _1074;
    assign _1794 = _1781 + _1693;
    assign _1790 = _1781 == _1729;
    assign _1791 = ~ _1790;
    assign _1788 = _687[1:1];
    assign _1792 = _1788 & _1791;
    assign _1795 = _1792 ? _1794 : _1781;
    assign _1785 = _687[1:1];
    assign _1786 = ~ _1785;
    assign _1783 = _319[1:1];
    assign _1782 = f_chg_now[1:1];
    assign _1784 = _1782 & _1783;
    assign _1787 = _1784 & _1786;
    assign _1797 = _1787 ? _1693 : _1795;
    assign _1778 = _283 == _1273;
    assign _1798 = _1778 ? _1797 : _1781;
    assign _34 = _1798;
    always @(posedge _276) begin
        if (_274)
            _1781 <= _1074;
        else
            _1781 <= _34;
    end
    assign _2020 = _687[1:1];
    assign _2022 = _2020 ? _1781 : _1074;
    assign _2026 = _1982 ? _2025 : _2022;
    assign _1815 = _1802 + _1693;
    assign _1811 = _1802 == _1729;
    assign _1812 = ~ _1811;
    assign _1809 = _687[2:2];
    assign _1813 = _1809 & _1812;
    assign _1816 = _1813 ? _1815 : _1802;
    assign _1806 = _687[2:2];
    assign _1807 = ~ _1806;
    assign _1804 = _319[2:2];
    assign _1803 = f_chg_now[2:2];
    assign _1805 = _1803 & _1804;
    assign _1808 = _1805 & _1807;
    assign _1818 = _1808 ? _1693 : _1816;
    assign _1799 = _283 == _1273;
    assign _1819 = _1799 ? _1818 : _1802;
    assign _35 = _1819;
    always @(posedge _276) begin
        if (_274)
            _1802 <= _1074;
        else
            _1802 <= _35;
    end
    assign _2016 = _687[2:2];
    assign _2018 = _2016 ? _1802 : _1074;
    assign _1836 = _1823 + _1693;
    assign _1832 = _1823 == _1729;
    assign _1833 = ~ _1832;
    assign _1830 = _687[3:3];
    assign _1834 = _1830 & _1833;
    assign _1837 = _1834 ? _1836 : _1823;
    assign _1827 = _687[3:3];
    assign _1828 = ~ _1827;
    assign _1825 = _319[3:3];
    assign _1824 = f_chg_now[3:3];
    assign _1826 = _1824 & _1825;
    assign _1829 = _1826 & _1828;
    assign _1839 = _1829 ? _1693 : _1837;
    assign _1820 = _283 == _1273;
    assign _1840 = _1820 ? _1839 : _1823;
    assign _36 = _1840;
    always @(posedge _276) begin
        if (_274)
            _1823 <= _1074;
        else
            _1823 <= _36;
    end
    assign _2013 = _687[3:3];
    assign _2015 = _2013 ? _1823 : _1074;
    assign _2019 = _1985 ? _2018 : _2015;
    assign _2027 = _1984 ? _2026 : _2019;
    assign _1857 = _1844 + _1693;
    assign _1853 = _1844 == _1729;
    assign _1854 = ~ _1853;
    assign _1851 = _687[4:4];
    assign _1855 = _1851 & _1854;
    assign _1858 = _1855 ? _1857 : _1844;
    assign _1848 = _687[4:4];
    assign _1849 = ~ _1848;
    assign _1846 = _319[4:4];
    assign _1845 = f_chg_now[4:4];
    assign _1847 = _1845 & _1846;
    assign _1850 = _1847 & _1849;
    assign _1860 = _1850 ? _1693 : _1858;
    assign _1841 = _283 == _1273;
    assign _1861 = _1841 ? _1860 : _1844;
    assign _37 = _1861;
    always @(posedge _276) begin
        if (_274)
            _1844 <= _1074;
        else
            _1844 <= _37;
    end
    assign _2008 = _687[4:4];
    assign _2010 = _2008 ? _1844 : _1074;
    assign _1878 = _1865 + _1693;
    assign _1874 = _1865 == _1729;
    assign _1875 = ~ _1874;
    assign _1872 = _687[5:5];
    assign _1876 = _1872 & _1875;
    assign _1879 = _1876 ? _1878 : _1865;
    assign _1869 = _687[5:5];
    assign _1870 = ~ _1869;
    assign _1867 = _319[5:5];
    assign _1866 = f_chg_now[5:5];
    assign _1868 = _1866 & _1867;
    assign _1871 = _1868 & _1870;
    assign _1881 = _1871 ? _1693 : _1879;
    assign _1862 = _283 == _1273;
    assign _1882 = _1862 ? _1881 : _1865;
    assign _38 = _1882;
    always @(posedge _276) begin
        if (_274)
            _1865 <= _1074;
        else
            _1865 <= _38;
    end
    assign _2005 = _687[5:5];
    assign _2007 = _2005 ? _1865 : _1074;
    assign _2011 = _1989 ? _2010 : _2007;
    assign _1899 = _1886 + _1693;
    assign _1895 = _1886 == _1729;
    assign _1896 = ~ _1895;
    assign _1893 = _687[6:6];
    assign _1897 = _1893 & _1896;
    assign _1900 = _1897 ? _1899 : _1886;
    assign _1890 = _687[6:6];
    assign _1891 = ~ _1890;
    assign _1888 = _319[6:6];
    assign _1887 = f_chg_now[6:6];
    assign _1889 = _1887 & _1888;
    assign _1892 = _1889 & _1891;
    assign _1902 = _1892 ? _1693 : _1900;
    assign _1883 = _283 == _1273;
    assign _1903 = _1883 ? _1902 : _1886;
    assign _39 = _1903;
    always @(posedge _276) begin
        if (_274)
            _1886 <= _1074;
        else
            _1886 <= _39;
    end
    assign _2001 = _687[6:6];
    assign _2003 = _2001 ? _1886 : _1074;
    assign _1920 = _1907 + _1693;
    assign _1916 = _1907 == _1729;
    assign _1917 = ~ _1916;
    assign _1914 = _687[7:7];
    assign _1918 = _1914 & _1917;
    assign _1921 = _1918 ? _1920 : _1907;
    assign _1911 = _687[7:7];
    assign _1912 = ~ _1911;
    assign _1909 = _319[7:7];
    assign _1908 = f_chg_now[7:7];
    assign _1910 = _1908 & _1909;
    assign _1913 = _1910 & _1912;
    assign _1923 = _1913 ? _1693 : _1921;
    assign _1904 = _283 == _1273;
    assign _1924 = _1904 ? _1923 : _1907;
    assign _40 = _1924;
    always @(posedge _276) begin
        if (_274)
            _1907 <= _1074;
        else
            _1907 <= _40;
    end
    assign _1998 = _687[7:7];
    assign _2000 = _1998 ? _1907 : _1074;
    assign _2004 = _1992 ? _2003 : _2000;
    assign _2012 = _1991 ? _2011 : _2004;
    assign _2028 = _1988 ? _2027 : _2012;
    assign _1993 = _717[7:7];
    assign _1992 = _717[6:6];
    assign _1994 = _1992 | _1993;
    assign _1990 = _717[5:5];
    assign _1989 = _717[4:4];
    assign _1991 = _1989 | _1990;
    assign _1995 = _1991 | _1994;
    assign _1986 = _717[3:3];
    assign _1985 = _717[2:2];
    assign _1987 = _1985 | _1986;
    assign _1983 = _717[1:1];
    assign _1982 = _717[0:0];
    assign _1984 = _1982 | _1983;
    assign _1988 = _1984 | _1987;
    assign _1996 = _1988 | _1995;
    assign _2029 = _1996 ? _2028 : _1074;
    assign _1971 = f_watch[0:0];
    assign _1970 = _319[0:0];
    assign _1972 = _1970 & _1971;
    assign _1974 = _1972 ? _539 : _1074;
    assign _1966 = f_watch[1:1];
    assign _1965 = _319[1:1];
    assign _1967 = _1965 & _1966;
    assign _1969 = _1967 ? _518 : _1074;
    assign _1975 = _1969 < _1974;
    assign _1976 = _1975 ? _1974 : _1969;
    assign _1959 = f_watch[2:2];
    assign _1958 = _319[2:2];
    assign _1960 = _1958 & _1959;
    assign _1962 = _1960 ? _495 : _1074;
    assign _1954 = f_watch[3:3];
    assign _1953 = _319[3:3];
    assign _1955 = _1953 & _1954;
    assign _1957 = _1955 ? _474 : _1074;
    assign _1963 = _1957 < _1962;
    assign _1964 = _1963 ? _1962 : _1957;
    assign _1977 = _1964 < _1976;
    assign _1978 = _1977 ? _1976 : _1964;
    assign _1945 = f_watch[4:4];
    assign _1944 = _319[4:4];
    assign _1946 = _1944 & _1945;
    assign _1948 = _1946 ? _449 : _1074;
    assign _1940 = f_watch[5:5];
    assign _1939 = _319[5:5];
    assign _1941 = _1939 & _1940;
    assign _1943 = _1941 ? _428 : _1074;
    assign _1949 = _1943 < _1948;
    assign _1950 = _1949 ? _1948 : _1943;
    assign _1933 = f_watch[6:6];
    assign _1932 = _319[6:6];
    assign _1934 = _1932 & _1933;
    assign _1936 = _1934 ? _405 : _1074;
    assign _1928 = f_watch[7:7];
    assign _1927 = _319[7:7];
    assign _1929 = _1927 & _1928;
    assign _1931 = _1929 ? _384 : _1074;
    assign _1937 = _1931 < _1936;
    assign _1938 = _1937 ? _1936 : _1931;
    assign _1951 = _1938 < _1950;
    assign _1952 = _1951 ? _1950 : _1938;
    assign _1979 = _1952 < _1978;
    assign _1980 = _1979 ? _1978 : _1952;
    assign _1981 = f_unexp_now ? _1980 : _1074;
    assign _2030 = f_amb_now ? _2029 : _1981;
    assign _1925 = ts_reg[2:0];
    assign _2031 = _1925 < _2030;
    assign _2033 = _2031 ? ts_hi_m1 : _2032;
    assign _2035 = { _2033,
                     _2034 };
    assign _2036 = { _2035,
                     _1202,
                     _1620,
                     _306 };
    assign _41 = _2036;
    always @(posedge _276) begin
        if (_274)
            _2053 <= _2091;
        else
            if (_2052)
                _2053 <= _41;
    end
    assign _2046 = _2044 + _1693;
    assign _2047 = _2041 ? _2046 : _2044;
    assign _42 = _2047;
    always @(posedge _276) begin
        if (_274)
            _2044 <= _1074;
        else
            _2044 <= _42;
    end
    always @* begin
        case (_2044)
        0:
            _2096 <= _2053;
        1:
            _2096 <= _2059;
        2:
            _2096 <= _2065;
        3:
            _2096 <= _2071;
        4:
            _2096 <= _2077;
        5:
            _2096 <= _2083;
        6:
            _2096 <= _2089;
        default:
            _2096 <= _2095;
        endcase
    end
    assign _43 = _2096;
    assign _5542 = _43[7:0];
    assign _5541 = _1330[2:0];
    always @* begin
        case (_5541)
        0:
            _5548 <= _5542;
        1:
            _5548 <= _5543;
        2:
            _5548 <= _5544;
        3:
            _5548 <= _5545;
        4:
            _5548 <= _5546;
        default:
            _5548 <= _5547;
        endcase
    end
    assign _5550 = _89 ? _1282 : _5548;
    assign _5539 = _46[31:24];
    assign _5538 = _46[23:16];
    assign _5537 = _46[15:8];
    assign _45 = ram_cov_rdata;
    assign _2097 = ~ f_sweeping;
    assign _2098 = _1310 & _2097;
    assign _2100 = _2098 ? _45 : _1249;
    assign _46 = _2100;
    assign _5536 = _46[7:0];
    assign _5535 = _1330[1:0];
    always @* begin
        case (_5535)
        0:
            _5540 <= _5536;
        1:
            _5540 <= _5537;
        2:
            _5540 <= _5538;
        default:
            _5540 <= _5539;
        endcase
    end
    assign _5530 = _53[39:32];
    assign _5529 = _53[31:24];
    assign _5528 = _53[23:16];
    assign _5527 = _53[15:8];
    assign _2336 = 8'b00000001;
    assign _2337 = _2331 + _2336;
    assign _2333 = _2331 == _1280;
    assign _2334 = ~ _2333;
    assign _2326 = ~ _2272;
    assign _2323 = _2301 == _1074;
    assign _2324 = ~ _2323;
    assign _2320 = _2105 | _612;
    assign _2317 = ~ _2274;
    assign _2318 = _2316 & _2317;
    assign _2319 = _2318 & _2109;
    assign _2321 = _2319 & _2320;
    assign _2325 = _2321 & _2324;
    assign _2327 = _2325 & _2326;
    assign _2313 = _2308 & _2312;
    assign _2328 = _2313 | _2327;
    assign _2335 = _2328 & _2334;
    assign _2338 = _2335 ? _2337 : _2331;
    assign _2340 = _2103 ? _1282 : _2338;
    assign _47 = _2340;
    always @(posedge _276) begin
        if (_274)
            _2331 <= _1282;
        else
            _2331 <= _47;
    end
    assign _2580 = _2574 + _2336;
    assign _2576 = _2574 == _1280;
    assign _2577 = ~ _2576;
    assign _2569 = ~ _2512;
    assign _2566 = _2541 == _1074;
    assign _2567 = ~ _2566;
    assign _2563 = _2345 | _626;
    assign _2560 = ~ _2514;
    assign _2561 = _2559 & _2560;
    assign _2562 = _2561 & _2349;
    assign _2564 = _2562 & _2563;
    assign _2568 = _2564 & _2567;
    assign _2570 = _2568 & _2569;
    assign _2312 = _2309 ? _2311 : _597;
    assign _2555 = _2552 & _2312;
    assign _2556 = _2554 | _2555;
    assign _2571 = _2556 | _2570;
    assign _2578 = _2571 & _2577;
    assign _2581 = _2578 ? _2580 : _2574;
    assign _2583 = _2103 ? _1282 : _2581;
    assign _48 = _2583;
    always @(posedge _276) begin
        if (_274)
            _2574 <= _1282;
        else
            _2574 <= _48;
    end
    assign _2616 = _2610 + _2336;
    assign _2612 = _2610 == _1280;
    assign _2613 = ~ _2612;
    assign _2606 = _2603 & _597;
    assign _2607 = _2605 | _2606;
    assign _2614 = _2607 & _2613;
    assign _2617 = _2614 ? _2616 : _2610;
    assign _2619 = _2103 ? _1282 : _2617;
    assign _49 = _2619;
    always @(posedge _276) begin
        if (_274)
            _2610 <= _1282;
        else
            _2610 <= _49;
    end
    assign _2629 = _2623 + _2336;
    assign _2625 = _2623 == _1280;
    assign _2626 = ~ _2625;
    assign _2627 = _2620 & _2626;
    assign _2630 = _2627 ? _2629 : _2623;
    assign _2632 = _2103 ? _1282 : _2630;
    assign _50 = _2632;
    always @(posedge _276) begin
        if (_274)
            _2623 <= _1282;
        else
            _2623 <= _50;
    end
    assign _2661 = _2655 + _2336;
    assign _2657 = _2655 == _1280;
    assign _2658 = ~ _2657;
    assign _2659 = _2652 & _2658;
    assign _2662 = _2659 ? _2661 : _2655;
    assign _2646 = _1260[5:5];
    assign _2645 = _2643 == _2726;
    assign _2647 = _2645 ? _2646 : _1066;
    assign _2648 = _2641 ? _2647 : _1066;
    assign _51 = _2648;
    always @(posedge _276) begin
        if (_274)
            _2103 <= _1066;
        else
            _2103 <= _51;
    end
    assign _2664 = _2103 ? _1282 : _2662;
    assign _52 = _2664;
    always @(posedge _276) begin
        if (_274)
            _2655 <= _1282;
        else
            _2655 <= _52;
    end
    assign _2665 = { _2655,
                     _2623,
                     _2610,
                     _2574,
                     _2331 };
    assign _53 = _2665;
    assign _5526 = _53[7:0];
    assign _5525 = _1330[2:0];
    always @* begin
        case (_5525)
        0:
            _5532 <= _5526;
        1:
            _5532 <= _5527;
        2:
            _5532 <= _5528;
        3:
            _5532 <= _5529;
        4:
            _5532 <= _5530;
        default:
            _5532 <= _1282;
        endcase
    end
    assign _5521 = _1639[2:0];
    assign _5520 = _1639[6:3];
    assign _5522 = { _5520,
                     gnd,
                     _5521 };
    assign _5519 = 8'b01000000;
    assign _5518 = 8'b00100000;
    assign _5517 = 8'b00100100;
    assign _5514 = 5'b00000;
    assign _2703 = 1'b1;
    assign _2681 = _1393 & _2680;
    assign _2699 = _2681 & _2698;
    assign _2704 = _2699 ? _2703 : _2702;
    assign _2706 = _2668 ? _1066 : _2704;
    assign _54 = _2706;
    always @(posedge _276) begin
        if (_274)
            _2702 <= _1066;
        else
            _2702 <= _54;
    end
    assign _55 = _2702;
    assign _56 = f_sweeping;
    assign _57 = f_image_valid;
    assign _5515 = { _57,
                     _56,
                     _55,
                     _5514 };
    assign _2716 = 4'b0010;
    assign _2715 = _1330[3:0];
    assign _2717 = _2715 == _2716;
    assign _2718 = _2717 ? _1260 : _1463;
    assign _2719 = _2714 ? _2718 : _1463;
    assign _58 = _2719;
    always @(posedge _276) begin
        if (_274)
            _1463 <= _1282;
        else
            _1463 <= _58;
    end
    assign _2721 = 4'b0001;
    assign _2720 = _1330[3:0];
    assign _2722 = _2720 == _2721;
    assign _2723 = _2722 ? _1260 : _1466;
    assign _2724 = _2714 ? _2723 : _1466;
    assign _59 = _2724;
    always @(posedge _276) begin
        if (_274)
            _1466 <= _1282;
        else
            _1466 <= _59;
    end
    assign _2726 = 4'b0000;
    assign _2725 = _1330[3:0];
    assign _2727 = _2725 == _2726;
    assign _2728 = _2727 ? _1260 : _1469;
    assign _2729 = _2714 ? _2728 : _1469;
    assign _60 = _2729;
    always @(posedge _276) begin
        if (_274)
            _1469 <= _1282;
        else
            _1469 <= _60;
    end
    assign _5513 = _1330[3:0];
    always @* begin
        case (_5513)
        0:
            _5523 <= _1469;
        1:
            _5523 <= _1466;
        2:
            _5523 <= _1463;
        3:
            _5523 <= _5515;
        4:
            _5523 <= _2336;
        5:
            _5523 <= _5517;
        6:
            _5523 <= _5518;
        7:
            _5523 <= _5519;
        8:
            _5523 <= _5198;
        9:
            _5523 <= _5206;
        10:
            _5523 <= _5214;
        11:
            _5523 <= _5222;
        default:
            _5523 <= _5522;
        endcase
    end
    assign _5509 = _63[15:8];
    assign _2769 = _2767 ? _1693 : _2752;
    assign _2751 = f_lane0_out ? _1359 : _1699;
    assign _2752 = _2745 ? _2751 : _2748;
    assign _2770 = _2217 ? _2769 : _2752;
    assign _2772 = _2731 ? _1074 : _2770;
    assign _2774 = _2316 ? _1074 : _2772;
    assign _61 = _2774;
    always @(posedge _276) begin
        if (_274)
            _2748 <= _1074;
        else
            _2748 <= _61;
    end
    assign _2821 = { _612,
                     _615,
                     _618,
                     _621,
                     gnd,
                     _2748 };
    assign _2814 = _2812 ? _1693 : _2797;
    assign _2796 = f_lane1_out ? _1359 : _1699;
    assign _2797 = _2790 ? _2796 : _2793;
    assign _2815 = _2457 ? _2814 : _2797;
    assign _2817 = _2776 ? _1074 : _2815;
    assign _2819 = _2559 ? _1074 : _2817;
    assign _62 = _2819;
    always @(posedge _276) begin
        if (_274)
            _2793 <= _1074;
        else
            _2793 <= _62;
    end
    assign _2820 = { _626,
                     _629,
                     _632,
                     _635,
                     gnd,
                     _2793 };
    assign _2822 = { _2820,
                     _2821 };
    assign _63 = _2822;
    assign _5508 = _63[7:0];
    assign _5507 = _2828[23:16];
    assign _5506 = _2828[15:8];
    assign _2827 = 24'b000000000000000000000000;
    assign _2839 = _66[31:8];
    assign _2836 = 4'b1000;
    assign _2835 = _1330[3:0];
    assign _2837 = _2835 == _2836;
    assign _2833 = _1244 == _1074;
    assign _2831 = _1236 & _1241;
    assign _2834 = _2831 & _2833;
    assign _2838 = _2834 & _2837;
    assign _2840 = _2838 ? _2839 : _2828;
    assign _2841 = _2830 ? _2840 : _2828;
    assign _2842 = _2825 ? _2841 : _2828;
    assign _64 = _2842;
    always @(posedge _276) begin
        if (_274)
            _2828 <= _2827;
        else
            _2828 <= _64;
    end
    assign _5505 = _2828[7:0];
    assign _2843 = 32'b00000000000000000000000000000001;
    assign _2844 = ts_reg + _2843;
    assign _65 = _2844;
    always @(posedge _276) begin
        if (_274)
            ts_reg <= _1249;
        else
            ts_reg <= _65;
    end
    assign _66 = ts_reg;
    assign _5504 = _66[7:0];
    assign _67 = _1202;
    assign _5503 = { _1394,
                     _67 };
    assign _2910 = _2906 ? _2898 : _2909;
    assign _2912 = _2668 ? _1074 : _2910;
    assign _68 = _2912;
    always @(posedge _276) begin
        if (_274)
            _2909 <= _1074;
        else
            _2909 <= _68;
    end
    assign _69 = _2909;
    assign _2905 = ~ _2904;
    assign _2895 = _2846 ? _1693 : _1699;
    assign _2892 = _2872 ? _1705 : _1359;
    assign _2896 = _2862 ? _2895 : _2892;
    assign _2889 = _2879 ? _1717 : _1723;
    assign _2897 = _2876 ? _2896 : _2889;
    assign _2883 = _2882 & _2309;
    assign _2877 = _1355 | _1308;
    assign _2878 = _2877 | _2854;
    assign _2879 = f_sweeping & _2878;
    assign _2884 = _2879 | _2883;
    assign _2873 = ~ f_image_valid;
    assign _2874 = _1382 & _2873;
    assign _2869 = _2865[1:1];
    assign _2871 = _2869 & _2870;
    assign _2920 = _1330[5:5];
    assign _2922 = _2920 == _1066;
    assign _2924 = _2922 ? _1273 : _1394;
    assign _2917 = _1330[5:5];
    assign _2919 = _2917 == _2703;
    assign _2926 = _2919 ? _1274 : _2924;
    assign _2927 = _2915 ? _2926 : _1394;
    assign _70 = _2927;
    always @(posedge _276) begin
        if (_274)
            _2865 <= _1394;
        else
            _2865 <= _70;
    end
    assign _2866 = _2865[0:0];
    assign _2868 = _2866 & _2867;
    assign _2872 = _2868 | _2871;
    assign _2875 = _2872 | _2874;
    assign _71 = _1198;
    always @(posedge _276) begin
        if (_274)
            _1266 <= _1066;
        else
            _1266 <= _71;
    end
    assign _2859 = _1198 | _1266;
    assign _2858 = _1308 & _1310;
    assign _2860 = _2858 & _2859;
    assign _2856 = ~ _1310;
    assign _2853 = _1244 == _1699;
    assign _2848 = _1228 == _1074;
    assign _2849 = _2825 & _2848;
    assign _2850 = _2849 & _1236;
    assign _2851 = _2850 & _1241;
    assign _2854 = _2851 & _2853;
    assign _1332 = 2'b11;
    assign _1331 = _1330[1:0];
    assign _1333 = _1331 == _1332;
    assign _2930 = _1333 ? _2703 : _1066;
    assign _1246 = _1244 == _1699;
    assign _1247 = _1243 & _1246;
    assign _2931 = _1247 ? _2930 : _1066;
    assign _72 = _2931;
    always @(posedge _276) begin
        if (_274)
            _1308 <= _1066;
        else
            _1308 <= _72;
    end
    assign _2855 = _1308 | _2854;
    assign _2857 = _2855 & _2856;
    assign _2861 = _2857 | _2860;
    assign _2845 = ~ _1310;
    assign _2846 = _1355 & _2845;
    assign _2862 = _2846 | _2861;
    assign _2876 = _2862 | _2875;
    assign _2885 = _2876 | _2884;
    assign _2898 = _2885 ? _2897 : _1074;
    assign _2900 = _2898 == _1074;
    assign _2901 = ~ _2900;
    assign _2906 = _2901 & _2905;
    assign _2938 = _2906 ? _2703 : _2904;
    assign _2934 = _1260[3:3];
    assign _2933 = _2643 == _2726;
    assign _2935 = _2933 ? _2934 : _1066;
    assign _2936 = _2641 ? _2935 : _1066;
    assign _73 = _2936;
    always @(posedge _276) begin
        if (_274)
            _2668 <= _1066;
        else
            _2668 <= _73;
    end
    assign _2940 = _2668 ? _1066 : _2938;
    assign _74 = _2940;
    always @(posedge _276) begin
        if (_274)
            _2904 <= _1066;
        else
            _2904 <= _74;
    end
    assign _75 = _2904;
    assign _76 = _595;
    assign _77 = _1203;
    always @(posedge _276) begin
        if (_274)
            _1206 <= _1282;
        else
            _1206 <= _77;
    end
    assign _1203 = { _1202,
                     f_winner };
    assign _2650 = _1203 == _1206;
    assign _2651 = ~ _2650;
    assign _2941 = ~ _1198;
    assign _2942 = _1195 & _2941;
    assign _78 = _2942;
    always @(posedge _276) begin
        if (_274)
            _1198 <= _1066;
        else
            _1198 <= _78;
    end
    assign _1194 = _1193[2:2];
    assign _1195 = _1190 & _1194;
    assign _2649 = _1195 & _1198;
    assign _2652 = _2649 & _2651;
    assign _2944 = _2652 ? _2703 : _1629;
    assign _2946 = _1386 ? _1066 : _2944;
    assign _79 = _2946;
    always @(posedge _276) begin
        if (_274)
            _1629 <= _1066;
        else
            _1629 <= _79;
    end
    assign _80 = _1629;
    assign _2620 = _95 & _1735;
    assign _2951 = _2620 ? _2703 : _2949;
    assign _2953 = _1386 ? _1066 : _2951;
    assign _81 = _2953;
    always @(posedge _276) begin
        if (_274)
            _2949 <= _1066;
        else
            _2949 <= _81;
    end
    assign _82 = _2949;
    assign _2957 = _222 & _2311;
    assign _2604 = ~ _2603;
    assign _2597 = _2586 & _2596;
    assign _2605 = _2597 & _2604;
    assign _2553 = ~ _2552;
    assign _2549 = _2343 & _2548;
    assign _2554 = _2549 & _2553;
    assign _2954 = _2554 | _2605;
    assign _83 = _2954;
    assign _2955 = f_rx_push & _597;
    assign _2956 = _2955 | _83;
    assign _2958 = _2956 | _2957;
    assign _2960 = _2958 ? _2703 : _1626;
    assign _2962 = _1386 ? _1066 : _2960;
    assign _84 = _2962;
    always @(posedge _276) begin
        if (_274)
            _1626 <= _1066;
        else
            _1626 <= _84;
    end
    assign _85 = _1626;
    assign _5501 = { _85,
                     _82,
                     _80,
                     _76,
                     _75,
                     _69 };
    assign _2963 = 4'b0100;
    assign _2964 = _2643 == _2963;
    assign _2965 = _2964 ? _1260 : _1460;
    assign _2966 = _2641 ? _2965 : _1460;
    assign _86 = _2966;
    always @(posedge _276) begin
        if (_274)
            _1460 <= _1282;
        else
            _1460 <= _86;
    end
    assign _5500 = { _1394,
                     _3038 };
    assign _5498 = { _1394,
                     _3030 };
    assign _5496 = { _1394,
                     _1193 };
    assign _87 = f_in_fetch;
    assign _88 = _2311;
    assign _89 = _1656;
    assign _5493 = ~ _89;
    assign _90 = _1676;
    assign _5492 = ~ _90;
    assign _1590 = _694[60:60];
    assign _1591 = f_in_eval & _1590;
    assign _91 = _1591;
    assign _2975 = _694[61:61];
    assign _2976 = _1392 & _2975;
    assign _2978 = _2976 ? _2703 : _1662;
    assign _2969 = _1260[2:2];
    assign _2968 = _2643 == _2726;
    assign _2970 = _2968 ? _2969 : _1066;
    assign _2971 = _2641 ? _2970 : _1066;
    assign _92 = _2971;
    always @(posedge _276) begin
        if (_274)
            _2974 <= _1066;
        else
            _2974 <= _92;
    end
    assign _2980 = _2974 ? _1066 : _2978;
    assign _2982 = _1386 ? _1066 : _2980;
    assign _93 = _2982;
    always @(posedge _276) begin
        if (_274)
            _1662 <= _1066;
        else
            _1662 <= _93;
    end
    assign _2999 = _96 + _2721;
    assign _2997 = _96 - _2721;
    assign _3000 = _1737 ? _2999 : _2997;
    assign _2040 = ~ _1656;
    assign _2988 = _1330[2:0];
    assign _2990 = _2988 == _1717;
    assign _2986 = _1244 == _1705;
    assign _2987 = _2984 & _2986;
    assign _2991 = _2987 & _2990;
    assign _2994 = _2991 ? _2703 : _1066;
    assign _94 = _2994;
    always @(posedge _276) begin
        if (_274)
            _2039 <= _1066;
        else
            _2039 <= _94;
    end
    assign _2041 = _2039 & _2040;
    assign _1735 = _96 == _2836;
    assign _1736 = ~ _1735;
    assign _95 = f_viol_now;
    assign _1737 = _95 & _1736;
    assign _2995 = _1737 ^ _2041;
    assign _3001 = _2995 ? _3000 : _96;
    always @(posedge _276) begin
        if (_274)
            _3004 <= _2726;
        else
            _3004 <= _3001;
    end
    assign _96 = _3004;
    assign _1656 = _96 == _2726;
    assign _1657 = ~ _1656;
    assign _1649 = _1639[5:3];
    assign _1650 = { gnd,
                     _1649 };
    assign _1651 = _1650 < _223;
    assign _1652 = ~ _1651;
    assign _1648 = _1639[6:6];
    assign _1653 = _1648 & _1652;
    assign _3009 = _1260[2:0];
    assign _3008 = _1260[7:4];
    assign _3010 = { _3008,
                     _3009 };
    assign _3006 = 4'b1100;
    assign _3005 = _1330[3:0];
    assign _3007 = _3005 == _3006;
    assign _3011 = _3007 ? _3010 : _1639;
    assign _3012 = _2714 ? _3011 : _1639;
    assign _97 = _3012;
    always @(posedge _276) begin
        if (_274)
            _1639 <= _1269;
        else
            _1639 <= _97;
    end
    assign _1640 = _1639[2:0];
    assign _1642 = _1640 == _1074;
    assign _1644 = _1642 ? _1693 : _1640;
    assign _1645 = { gnd,
                     _1644 };
    assign _1646 = _130 < _1645;
    assign _1647 = ~ _1646;
    assign _1654 = _1647 | _1653;
    assign _1658 = _1654 | _1657;
    assign _1659 = _1658 | _1595;
    assign _1663 = _1659 | _1662;
    assign _98 = _1663;
    assign _3018 = f_policy == _1332;
    assign _3020 = _3018 ? _2703 : _1595;
    assign _3016 = f_policy == _1394;
    assign _3022 = _3016 ? _2703 : _3020;
    assign _3023 = f_viol_now ? _3022 : _1595;
    assign _3024 = _1190 ? _1595 : _3023;
    assign _3014 = _283 == _1274;
    assign _3025 = _3014 ? _3024 : _1595;
    assign _3027 = _1386 ? _1066 : _3025;
    assign _99 = _3027;
    always @(posedge _276) begin
        if (_274)
            _1595 <= _1066;
        else
            _1595 <= _99;
    end
    assign _100 = _1595;
    assign _5425 = _1392 ? _1274 : _283;
    assign _5421 = _3059 ? _1273 : _283;
    assign _5412 = f_policy == _1332;
    assign _5414 = _5412 ? _1394 : _283;
    assign _5411 = f_policy == _1274;
    assign _5416 = _5411 ? _1273 : _5414;
    assign _5410 = f_policy == _1394;
    assign _5418 = _5410 ? _1394 : _5416;
    assign _5419 = f_viol_now ? _5418 : _283;
    assign _1185 = f_chgmask3 & f_multi_eff;
    assign _1187 = _1185 == _1282;
    assign _1178 = _1138 == _1063;
    assign _1173 = 16'b0000000000000000;
    assign _1174 = _1138 == _1173;
    assign _1175 = _1174 & _1155;
    assign _1172 = _1114 == _1134;
    assign _1176 = _1172 | _1175;
    assign _1179 = _1113 ? _1178 : _1176;
    assign _1169 = _600[3:0];
    assign _1171 = _1169 == _2726;
    assign _1180 = _1171 | _1179;
    assign _1167 = _1138 == _1063;
    assign _1163 = _1138 == _1173;
    assign _1164 = _1163 & _1155;
    assign _1161 = _1114 == _1134;
    assign _1165 = _1161 | _1164;
    assign _1168 = _1113 ? _1167 : _1165;
    assign _1159 = _1125 == _1063;
    always @(posedge _276) begin
        if (_274)
            _1053 <= _1074;
        else
            _1053 <= _1050;
    end
    assign _1154 = { _1081,
                     _1053 };
    assign _1155 = _1111 < _1154;
    assign _1152 = _1125 == _1173;
    assign _1156 = _1152 & _1155;
    assign _1150 = _1114 == _1122;
    assign _1157 = _1150 | _1156;
    assign _1160 = _1113 ? _1159 : _1157;
    assign _1149 = _711[104:103];
    always @* begin
        case (_1149)
        0:
            _1181 <= vdd;
        1:
            _1181 <= _1160;
        2:
            _1181 <= _1168;
        default:
            _1181 <= _1180;
        endcase
    end
    assign _1148 = ~ _644;
    assign _1182 = _1148 | _1181;
    assign _1145 = _711[62:62];
    assign _1143 = _711[61:58];
    always @* begin
        case (_1143)
        0:
            _1144 <= vdd;
        1:
            _1144 <= _585;
        2:
            _1144 <= _589;
        3:
            _1144 <= _593;
        4:
            _1144 <= _595;
        5:
            _1144 <= _597;
        6:
            _1144 <= _601;
        7:
            _1144 <= _607;
        8:
            _1144 <= _612;
        9:
            _1144 <= _615;
        10:
            _1144 <= _618;
        11:
            _1144 <= _621;
        12:
            _1144 <= _626;
        13:
            _1144 <= _629;
        14:
            _1144 <= _632;
        default:
            _1144 <= _635;
        endcase
    end
    assign _1146 = _1144 ^ _1145;
    assign _1138 = _711[57:42];
    assign _1140 = _1138 == _1063;
    assign _1133 = 17'b00000000000000000;
    assign _1129 = _1011[57:42];
    assign _1130 = { gnd,
                     _1129 };
    assign _1131 = _1130 + _1118;
    always @(posedge _276) begin
        if (_274)
            _1134 <= _1133;
        else
            _1134 <= _1131;
    end
    assign _1135 = _1134 < _1114;
    assign _1136 = ~ _1135;
    assign _1125 = _711[41:26];
    assign _1127 = _1125 == _1173;
    assign _1042 = _1012[0:0];
    assign _1044 = _1042 ? _547 : _1074;
    assign _1039 = _1012[1:1];
    assign _1041 = _1039 ? _526 : _1074;
    assign _1045 = _1041 < _1044;
    assign _1046 = _1045 ? _1044 : _1041;
    assign _1034 = _1012[2:2];
    assign _1036 = _1034 ? _503 : _1074;
    assign _1031 = _1012[3:3];
    assign _1033 = _1031 ? _482 : _1074;
    assign _1037 = _1033 < _1036;
    assign _1038 = _1037 ? _1036 : _1033;
    assign _1047 = _1038 < _1046;
    assign _1048 = _1047 ? _1046 : _1038;
    assign _1024 = _1012[4:4];
    assign _1026 = _1024 ? _457 : _1074;
    assign _1021 = _1012[5:5];
    assign _1023 = _1021 ? _436 : _1074;
    assign _1027 = _1023 < _1026;
    assign _1028 = _1027 ? _1026 : _1023;
    assign _1016 = _1012[6:6];
    assign _1018 = _1016 ? _413 : _1074;
    assign _1012 = _1011[23:16];
    assign _1013 = _1012[7:7];
    assign _1015 = _1013 ? _392 : _1074;
    assign _1019 = _1015 < _1018;
    assign _1020 = _1019 ? _1018 : _1015;
    assign _1029 = _1020 < _1028;
    assign _1030 = _1029 ? _1028 : _1020;
    assign _1049 = _1030 < _1048;
    assign _1050 = _1049 ? _1048 : _1030;
    assign _1117 = 14'b00000000000000;
    assign _1118 = { _1117,
                     _1050 };
    assign _1011 = _367[511:400];
    assign _1115 = _1011[41:26];
    assign _1116 = { gnd,
                     _1115 };
    assign _1119 = _1116 + _1118;
    always @(posedge _276) begin
        if (_274)
            _1122 <= _1133;
        else
            _1122 <= _1119;
    end
    assign _1114 = { gnd,
                     _1111 };
    assign _1123 = _1114 < _1122;
    assign _1124 = ~ _1123;
    assign _1128 = _1124 | _1127;
    assign _1137 = _1128 & _1136;
    assign _1056 = _711[25:24];
    always @* begin
        case (_1056)
        0:
            _1111 <= _334;
        1:
            _1111 <= _337;
        2:
            _1111 <= _340;
        default:
            _1111 <= _340;
        endcase
    end
    assign _1113 = _1111 == _1063;
    assign _1141 = _1113 ? _1140 : _1137;
    assign _1105 = f_changed_all & f_chgmask3;
    assign _1107 = _1105 == _1282;
    assign _1108 = ~ _1107;
    assign _1104 = f_chgmask3 == _1282;
    assign _1109 = _1104 | _1108;
    assign _1098 = _711[7:0];
    assign _1096 = _711[15:8];
    assign _1097 = _306 ^ _1096;
    assign _1099 = _1097 & _1098;
    assign _1101 = _1099 == _1282;
    assign _1102 = f_valid3 & _1101;
    assign _1110 = _1102 & _1109;
    assign _1142 = _1110 & _1141;
    assign _1147 = _1142 & _1146;
    assign _1183 = _1147 & _1182;
    assign _1184 = f_in_eval & _1183;
    assign _1188 = _1184 & _1187;
    assign f_fire3 = _1188 & _726;
    assign _690 = f_chgmask0 & f_multi_eff;
    assign _692 = _690 == _1282;
    assign _678 = _575 == _1063;
    assign _674 = _575 == _1173;
    assign _675 = _674 & _655;
    assign _672 = _345 == _571;
    assign _676 = _672 | _675;
    assign _679 = _343 ? _678 : _676;
    assign _669 = _600[3:0];
    assign _671 = _669 == _2726;
    assign _680 = _671 | _679;
    assign _667 = _575 == _1063;
    assign _663 = _575 == _1173;
    assign _664 = _663 & _655;
    assign _661 = _345 == _571;
    assign _665 = _661 | _664;
    assign _668 = _343 ? _667 : _665;
    assign _659 = _562 == _1063;
    always @(posedge _276) begin
        if (_274)
            _653 <= _1074;
        else
            _653 <= _554;
    end
    assign _654 = { _1081,
                    _653 };
    assign _655 = _341 < _654;
    assign _649 = _562 == _1173;
    assign _656 = _649 & _655;
    assign _647 = _345 == _559;
    assign _657 = _647 | _656;
    assign _660 = _343 ? _659 : _657;
    assign _646 = _299[104:103];
    always @* begin
        case (_646)
        0:
            _681 <= vdd;
        1:
            _681 <= _660;
        2:
            _681 <= _668;
        default:
            _681 <= _680;
        endcase
    end
    assign _645 = ~ _644;
    assign _682 = _645 | _681;
    assign _637 = _299[62:62];
    assign _580 = _299[61:58];
    always @* begin
        case (_580)
        0:
            _636 <= vdd;
        1:
            _636 <= _585;
        2:
            _636 <= _589;
        3:
            _636 <= _593;
        4:
            _636 <= _595;
        5:
            _636 <= _597;
        6:
            _636 <= _601;
        7:
            _636 <= _607;
        8:
            _636 <= _612;
        9:
            _636 <= _615;
        10:
            _636 <= _618;
        11:
            _636 <= _621;
        12:
            _636 <= _626;
        13:
            _636 <= _629;
        14:
            _636 <= _632;
        default:
            _636 <= _635;
        endcase
    end
    assign _638 = _636 ^ _637;
    assign _575 = _299[57:42];
    assign _577 = _575 == _1063;
    assign _566 = _368[57:42];
    assign _567 = { gnd,
                    _566 };
    assign _568 = _567 + _555;
    always @(posedge _276) begin
        if (_274)
            _571 <= _1133;
        else
            _571 <= _568;
    end
    assign _572 = _571 < _345;
    assign _573 = ~ _572;
    assign _562 = _299[41:26];
    assign _564 = _562 == _1173;
    assign _528 = _372[0:0];
    assign _548 = _528 ? _547 : _1074;
    assign _507 = _372[1:1];
    assign _527 = _507 ? _526 : _1074;
    assign _549 = _527 < _548;
    assign _550 = _549 ? _548 : _527;
    assign _484 = _372[2:2];
    assign _504 = _484 ? _503 : _1074;
    assign _463 = _372[3:3];
    assign _483 = _463 ? _482 : _1074;
    assign _505 = _483 < _504;
    assign _506 = _505 ? _504 : _483;
    assign _551 = _506 < _550;
    assign _552 = _551 ? _550 : _506;
    assign _438 = _372[4:4];
    assign _458 = _438 ? _457 : _1074;
    assign _417 = _372[5:5];
    assign _437 = _417 ? _436 : _1074;
    assign _459 = _437 < _458;
    assign _460 = _459 ? _458 : _437;
    assign _394 = _372[6:6];
    assign _414 = _394 ? _413 : _1074;
    assign _372 = _368[23:16];
    assign _373 = _372[7:7];
    assign _393 = _373 ? _392 : _1074;
    assign _415 = _393 < _414;
    assign _416 = _415 ? _414 : _393;
    assign _461 = _416 < _460;
    assign _462 = _461 ? _460 : _416;
    assign _553 = _462 < _552;
    assign _554 = _553 ? _552 : _462;
    assign _555 = { _1117,
                    _554 };
    assign _368 = _367[175:64];
    assign _369 = _368[41:26];
    assign _370 = { gnd,
                    _369 };
    assign _556 = _370 + _555;
    always @(posedge _276) begin
        if (_274)
            _559 <= _1133;
        else
            _559 <= _556;
    end
    assign _345 = { gnd,
                    _341 };
    assign _560 = _345 < _559;
    assign _561 = ~ _560;
    assign _565 = _561 | _564;
    assign _574 = _565 & _573;
    assign _331 = _299[25:24];
    always @* begin
        case (_331)
        0:
            _341 <= _334;
        1:
            _341 <= _337;
        2:
            _341 <= _340;
        default:
            _341 <= _340;
        endcase
    end
    assign _343 = _341 == _1063;
    assign _578 = _343 ? _577 : _574;
    assign _325 = f_changed_all & f_chgmask0;
    assign _327 = _325 == _1282;
    assign _328 = ~ _327;
    assign _316 = f_chgmask0 == _1282;
    assign _329 = _316 | _328;
    assign _309 = _299[7:0];
    assign _307 = _299[15:8];
    assign _308 = _306 ^ _307;
    assign _310 = _308 & _309;
    assign _312 = _310 == _1282;
    assign _5182 = _350 + _1693;
    assign _1201 = 6'b000000;
    assign _3033 = _1260[5:0];
    assign _3032 = _2643 == _2716;
    assign _3034 = _3032 ? _3033 : _3030;
    assign _3035 = _2641 ? _3034 : _3030;
    assign _101 = _3035;
    always @(posedge _276) begin
        if (_274)
            _3030 <= _1201;
        else
            _3030 <= _101;
    end
    assign _3060 = _3059 ? _3057 : _1202;
    assign _3041 = _1260[5:0];
    assign _3039 = 4'b0011;
    assign _3040 = _2643 == _3039;
    assign _3042 = _3040 ? _3041 : _3038;
    assign _3043 = _2641 ? _3042 : _3038;
    assign _102 = _3043;
    always @(posedge _276) begin
        if (_274)
            _3038 <= _1201;
        else
            _3038 <= _102;
    end
    assign _3047 = _1386 ? _3038 : _3046;
    assign _103 = _3047;
    always @(posedge _276) begin
        if (_274)
            _3046 <= _1201;
        else
            _3046 <= _103;
    end
    assign _3050 = f_policy == _1274;
    assign _3051 = _3050 ? _3046 : _1202;
    assign _3052 = f_viol_now ? _3051 : _1202;
    assign _3061 = _1190 ? _3060 : _3052;
    assign _3048 = _283 == _1274;
    assign _3062 = _3048 ? _3061 : _1202;
    assign _3063 = _1386 ? _3030 : _3062;
    assign _104 = _3063;
    always @(posedge _276) begin
        if (_274)
            _1202 <= _1201;
        else
            _1202 <= _104;
    end
    assign _3056 = _711[110:105];
    assign _3055 = _705[110:105];
    assign _3054 = _699[110:105];
    assign _3053 = _299[110:105];
    always @* begin
        case (f_winner)
        0:
            _3057 <= _3053;
        1:
            _3057 <= _3054;
        2:
            _3057 <= _3055;
        default:
            _3057 <= _3056;
        endcase
    end
    assign _3058 = _3057 == _1202;
    assign _3059 = ~ _3058;
    assign _5178 = _3059 ? _1074 : _350;
    assign _5173 = f_policy == _1274;
    assign _5175 = _5173 ? _1074 : _350;
    assign _1613 = f_changed_all & f_watch;
    assign _1615 = _1613 == _1282;
    assign _1616 = ~ _1615;
    assign _1611 = ~ _1190;
    assign _1612 = f_in_eval & _1611;
    assign f_unexp_now = _1612 & _1616;
    assign _3067 = ~ f_amb_now;
    assign _3068 = _1610 & _3067;
    assign _3070 = _3068 ? _2703 : _3066;
    assign _3071 = _1190 ? _3066 : _3070;
    assign _3066 = _1393 ? _1066 : _1608;
    assign _3064 = _283 == _1274;
    assign _3072 = _3064 ? _3071 : _3066;
    assign _105 = _3072;
    always @(posedge _276) begin
        if (_274)
            _1608 <= _1066;
        else
            _1608 <= _105;
    end
    assign _1609 = ~ _1608;
    assign _5164 = 16'b0000000000000001;
    assign _5165 = _334 + _5164;
    assign _5161 = _334 == _1063;
    assign _5162 = ~ _5161;
    assign _5163 = _5122 & _5162;
    assign _5166 = _5163 ? _5165 : _334;
    assign _5106 = _694[26:24];
    assign _5104 = _711[93:91];
    assign _5103 = _705[93:91];
    assign _5102 = _699[93:91];
    assign _5101 = _299[93:91];
    assign _999 = f_chgmask2 & f_multi_eff;
    assign _1001 = _999 == _1282;
    assign _992 = _949 == _1063;
    assign _988 = _949 == _1173;
    assign _989 = _988 & _969;
    assign _986 = _885 == _945;
    assign _990 = _986 | _989;
    assign _993 = _884 ? _992 : _990;
    assign _983 = _600[3:0];
    assign _985 = _983 == _2726;
    assign _994 = _985 | _993;
    assign _981 = _949 == _1063;
    assign _977 = _949 == _1173;
    assign _978 = _977 & _969;
    assign _975 = _885 == _945;
    assign _979 = _975 | _978;
    assign _982 = _884 ? _981 : _979;
    assign _973 = _936 == _1063;
    always @(posedge _276) begin
        if (_274)
            _967 <= _1074;
        else
            _967 <= _928;
    end
    assign _968 = { _1081,
                    _967 };
    assign _969 = _882 < _968;
    assign _963 = _936 == _1173;
    assign _970 = _963 & _969;
    assign _961 = _885 == _933;
    assign _971 = _961 | _970;
    assign _974 = _884 ? _973 : _971;
    assign _960 = _705[104:103];
    always @* begin
        case (_960)
        0:
            _995 <= vdd;
        1:
            _995 <= _974;
        2:
            _995 <= _982;
        default:
            _995 <= _994;
        endcase
    end
    assign _959 = ~ _644;
    assign _996 = _959 | _995;
    assign _956 = _705[62:62];
    assign _954 = _705[61:58];
    always @* begin
        case (_954)
        0:
            _955 <= vdd;
        1:
            _955 <= _585;
        2:
            _955 <= _589;
        3:
            _955 <= _593;
        4:
            _955 <= _595;
        5:
            _955 <= _597;
        6:
            _955 <= _601;
        7:
            _955 <= _607;
        8:
            _955 <= _612;
        9:
            _955 <= _615;
        10:
            _955 <= _618;
        11:
            _955 <= _621;
        12:
            _955 <= _626;
        13:
            _955 <= _629;
        14:
            _955 <= _632;
        default:
            _955 <= _635;
        endcase
    end
    assign _957 = _955 ^ _956;
    assign _949 = _705[57:42];
    assign _951 = _949 == _1063;
    assign _940 = _886[57:42];
    assign _941 = { gnd,
                    _940 };
    assign _942 = _941 + _929;
    always @(posedge _276) begin
        if (_274)
            _945 <= _1133;
        else
            _945 <= _942;
    end
    assign _946 = _945 < _885;
    assign _947 = ~ _946;
    assign _936 = _705[41:26];
    assign _938 = _936 == _1173;
    assign _920 = _890[0:0];
    assign _922 = _920 ? _547 : _1074;
    assign _917 = _890[1:1];
    assign _919 = _917 ? _526 : _1074;
    assign _923 = _919 < _922;
    assign _924 = _923 ? _922 : _919;
    assign _912 = _890[2:2];
    assign _914 = _912 ? _503 : _1074;
    assign _909 = _890[3:3];
    assign _911 = _909 ? _482 : _1074;
    assign _915 = _911 < _914;
    assign _916 = _915 ? _914 : _911;
    assign _925 = _916 < _924;
    assign _926 = _925 ? _924 : _916;
    assign _902 = _890[4:4];
    assign _904 = _902 ? _457 : _1074;
    assign _899 = _890[5:5];
    assign _901 = _899 ? _436 : _1074;
    assign _905 = _901 < _904;
    assign _906 = _905 ? _904 : _901;
    assign _894 = _890[6:6];
    assign _896 = _894 ? _413 : _1074;
    assign _890 = _886[23:16];
    assign _891 = _890[7:7];
    assign _893 = _891 ? _392 : _1074;
    assign _897 = _893 < _896;
    assign _898 = _897 ? _896 : _893;
    assign _907 = _898 < _906;
    assign _908 = _907 ? _906 : _898;
    assign _927 = _908 < _926;
    assign _928 = _927 ? _926 : _908;
    assign _929 = { _1117,
                    _928 };
    assign _886 = _367[399:288];
    assign _887 = _886[41:26];
    assign _888 = { gnd,
                    _887 };
    assign _930 = _888 + _929;
    always @(posedge _276) begin
        if (_274)
            _933 <= _1133;
        else
            _933 <= _930;
    end
    assign _885 = { gnd,
                    _882 };
    assign _934 = _885 < _933;
    assign _935 = ~ _934;
    assign _939 = _935 | _938;
    assign _948 = _939 & _947;
    assign _881 = _705[25:24];
    always @* begin
        case (_881)
        0:
            _882 <= _334;
        1:
            _882 <= _337;
        2:
            _882 <= _340;
        default:
            _882 <= _340;
        endcase
    end
    assign _884 = _882 == _1063;
    assign _952 = _884 ? _951 : _948;
    assign _875 = f_changed_all & f_chgmask2;
    assign _877 = _875 == _1282;
    assign _878 = ~ _877;
    assign _874 = f_chgmask2 == _1282;
    assign _879 = _874 | _878;
    assign _868 = _705[7:0];
    assign _866 = _705[15:8];
    assign _867 = _306 ^ _866;
    assign _869 = _867 & _868;
    assign _871 = _869 == _1282;
    assign _872 = f_valid2 & _871;
    assign _880 = _872 & _879;
    assign _953 = _880 & _952;
    assign _958 = _953 & _957;
    assign _997 = _958 & _996;
    assign _998 = f_in_eval & _997;
    assign _1002 = _998 & _1001;
    assign f_fire2 = _1002 & _726;
    assign _1006 = f_fire2 ? _1274 : _1332;
    assign f_policy = _694[59:58];
    assign _725 = f_policy == _1273;
    assign f_chgmask3 = _711[23:16];
    assign f_valid3 = _711[111:111];
    assign _715 = f_valid3 ? f_chgmask3 : _1282;
    assign f_chgmask2 = _705[23:16];
    assign f_valid2 = _705[111:111];
    assign _709 = f_valid2 ? f_chgmask2 : _1282;
    assign _703 = f_valid1 ? f_chgmask1 : _1282;
    assign f_chgmask0 = _299[23:16];
    assign _697 = f_valid0 ? f_chgmask0 : _1282;
    assign f_watch = _694[57:50];
    assign _698 = f_watch | _697;
    assign _704 = _698 | _703;
    assign _710 = _704 | _709;
    assign f_relevant = _710 | _715;
    assign _717 = f_multi_eff & f_relevant;
    assign _719 = _717 == _1282;
    assign _720 = ~ _719;
    assign f_amb_now = f_in_eval & _720;
    assign _722 = ~ f_amb_now;
    assign _726 = _722 | _725;
    assign _688 = _319 & f_chg_now;
    assign _3077 = _319 & f_chg_now;
    assign _3078 = _687 | _3077;
    assign _3074 = _283 == _1274;
    assign _3076 = _3074 ? _1282 : _687;
    assign _3073 = _283 == _1273;
    assign _3079 = _3073 ? _3078 : _3076;
    assign _3081 = _1386 ? _1282 : _3079;
    assign _106 = _3081;
    always @(posedge _276) begin
        if (_274)
            _687 <= _1282;
        else
            _687 <= _106;
    end
    assign f_multi_eff = _687 | _688;
    assign _861 = f_chgmask1 & f_multi_eff;
    assign _863 = _861 == _1282;
    assign _854 = _811 == _1063;
    assign _850 = _811 == _1173;
    assign _851 = _850 & _831;
    assign _848 = _747 == _807;
    assign _852 = _848 | _851;
    assign _855 = _746 ? _854 : _852;
    assign _845 = _600[3:0];
    assign _847 = _845 == _2726;
    assign _856 = _847 | _855;
    assign _843 = _811 == _1063;
    assign _839 = _811 == _1173;
    assign _840 = _839 & _831;
    assign _837 = _747 == _807;
    assign _841 = _837 | _840;
    assign _844 = _746 ? _843 : _841;
    assign _835 = _798 == _1063;
    always @(posedge _276) begin
        if (_274)
            _829 <= _1074;
        else
            _829 <= _790;
    end
    assign _830 = { _1081,
                    _829 };
    assign _831 = _744 < _830;
    assign _825 = _798 == _1173;
    assign _832 = _825 & _831;
    assign _823 = _747 == _795;
    assign _833 = _823 | _832;
    assign _836 = _746 ? _835 : _833;
    assign _822 = _699[104:103];
    always @* begin
        case (_822)
        0:
            _857 <= vdd;
        1:
            _857 <= _836;
        2:
            _857 <= _844;
        default:
            _857 <= _856;
        endcase
    end
    assign _3082 = _1193[1:0];
    assign _3083 = _1386 ? _3082 : _642;
    assign _107 = _3083;
    always @(posedge _276) begin
        if (_274)
            _642 <= _1394;
        else
            _642 <= _107;
    end
    assign _644 = _642 == _1274;
    assign _821 = ~ _644;
    assign _858 = _821 | _857;
    assign _818 = _699[62:62];
    assign _3087 = _2812 ? _2703 : _3085;
    assign _3085 = _2790 ? _2703 : _635;
    assign _3088 = _2457 ? _3087 : _3085;
    assign _3090 = _2776 ? _1066 : _3088;
    assign _3092 = _2559 ? _1066 : _3090;
    assign _108 = _3092;
    always @(posedge _276) begin
        if (_274)
            _635 <= _1066;
        else
            _635 <= _108;
    end
    assign _3107 = _3099 ^ _3106;
    assign _3115 = _3107 & _3114;
    assign _3117 = _3115 == _1173;
    assign _3094 = ~ _3093;
    assign _3118 = _3094 & _3117;
    assign _3120 = _3118 ? _2703 : _632;
    assign _3121 = _2471 ? _3120 : _632;
    assign _3122 = _2812 ? _632 : _3121;
    assign _3123 = _2457 ? _3122 : _632;
    assign _3125 = _2776 ? _1066 : _3123;
    assign _3127 = _2559 ? _1066 : _3125;
    assign _109 = _3127;
    always @(posedge _276) begin
        if (_274)
            _632 <= _1066;
        else
            _632 <= _109;
    end
    assign _3135 = _217[1:1];
    assign _3136 = ~ _3135;
    assign _3132 = 5'b10010;
    assign _3131 = _1330[4:0];
    assign _3133 = _3131 == _3132;
    assign _3128 = _1330[5:5];
    assign _3130 = _3128 == _2703;
    assign _3134 = _3130 & _3133;
    assign _3137 = _3134 & _3136;
    assign _3138 = _3137 ? _1260 : _3113;
    assign _3139 = _2915 ? _3138 : _3113;
    assign _110 = _3139;
    always @(posedge _276) begin
        if (_274)
            _3113 <= _1282;
        else
            _3113 <= _110;
    end
    assign _3147 = _217[1:1];
    assign _3148 = ~ _3147;
    assign _3144 = 5'b10011;
    assign _3143 = _1330[4:0];
    assign _3145 = _3143 == _3144;
    assign _3140 = _1330[5:5];
    assign _3142 = _3140 == _2703;
    assign _3146 = _3142 & _3145;
    assign _3149 = _3146 & _3148;
    assign _3150 = _3149 ? _1260 : _3110;
    assign _3151 = _2915 ? _3150 : _3110;
    assign _111 = _3151;
    always @(posedge _276) begin
        if (_274)
            _3110 <= _1282;
        else
            _3110 <= _111;
    end
    assign _3114 = { _3110,
                     _3113 };
    assign _3159 = _217[1:1];
    assign _3160 = ~ _3159;
    assign _3156 = 5'b10000;
    assign _3155 = _1330[4:0];
    assign _3157 = _3155 == _3156;
    assign _3152 = _1330[5:5];
    assign _3154 = _3152 == _2703;
    assign _3158 = _3154 & _3157;
    assign _3161 = _3158 & _3160;
    assign _3162 = _3161 ? _1260 : _3105;
    assign _3163 = _2915 ? _3162 : _3105;
    assign _112 = _3163;
    always @(posedge _276) begin
        if (_274)
            _3105 <= _1282;
        else
            _3105 <= _112;
    end
    assign _3171 = _217[1:1];
    assign _3172 = ~ _3171;
    assign _3168 = 5'b10001;
    assign _3167 = _1330[4:0];
    assign _3169 = _3167 == _3168;
    assign _3164 = _1330[5:5];
    assign _3166 = _3164 == _2703;
    assign _3170 = _3166 & _3169;
    assign _3173 = _3170 & _3172;
    assign _3174 = _3173 ? _1260 : _3102;
    assign _3175 = _2915 ? _3174 : _3102;
    assign _113 = _3175;
    always @(posedge _276) begin
        if (_274)
            _3102 <= _1282;
        else
            _3102 <= _113;
    end
    assign _3106 = { _3102,
                     _3105 };
    assign _3214 = g_crc_0[31:16];
    assign _3215 = _3214 ^ _3106;
    assign _3216 = _3215 & _3114;
    assign _3218 = _3216 == _1173;
    assign _3189 = _2803 == _3188;
    assign _3190 = ~ _3189;
    assign _3192 = _3182 ? _3191 : g_crc_bad;
    assign _3193 = _2471 ? _3192 : g_crc_bad;
    assign _3194 = _2812 ? g_crc_bad : _3193;
    assign _3195 = _2457 ? _3194 : g_crc_bad;
    assign _3197 = _2776 ? _1066 : _3195;
    assign _114 = _3197;
    always @(posedge _276) begin
        if (_274)
            g_crc_bad <= _1066;
        else
            g_crc_bad <= _114;
    end
    assign _3191 = g_crc_bad | _3190;
    assign _3208 = ~ _3191;
    assign _3206 = 6'b000001;
    assign _3207 = g_left_0 == _3206;
    assign _3209 = _3207 ? _3208 : _629;
    assign _3210 = _3182 ? _3209 : _629;
    assign _3211 = _2471 ? _3210 : _629;
    assign _3212 = _2812 ? _629 : _3211;
    assign _3213 = _2457 ? _3212 : _629;
    assign _3201 = ~ _2559;
    assign _3199 = ~ _2776;
    assign _3198 = _2512 & _3093;
    assign _3200 = _3198 & _3199;
    assign _3202 = _3200 & _3201;
    assign _115 = _3202;
    always @(posedge _276) begin
        if (_274)
            g_resid_chk <= _1066;
        else
            g_resid_chk <= _115;
    end
    assign _3219 = g_resid_chk ? _3218 : _3213;
    assign _3221 = _2776 ? _1066 : _3219;
    assign _3223 = _2559 ? _1066 : _3221;
    assign _116 = _3223;
    always @(posedge _276) begin
        if (_274)
            _629 <= _1066;
        else
            _629 <= _116;
    end
    assign _3227 = _2767 ? _2703 : _3225;
    assign _3225 = _2745 ? _2703 : _621;
    assign _3228 = _2217 ? _3227 : _3225;
    assign _3230 = _2731 ? _1066 : _3228;
    assign _3232 = _2316 ? _1066 : _3230;
    assign _117 = _3232;
    always @(posedge _276) begin
        if (_274)
            _621 <= _1066;
        else
            _621 <= _117;
    end
    assign _3247 = _3239 ^ _3246;
    assign _3255 = _3247 & _3254;
    assign _3257 = _3255 == _1173;
    assign _3234 = ~ _3233;
    assign _3258 = _3234 & _3257;
    assign _3260 = _3258 ? _2703 : _618;
    assign _3261 = _2231 ? _3260 : _618;
    assign _3262 = _2767 ? _618 : _3261;
    assign _3263 = _2217 ? _3262 : _618;
    assign _3265 = _2731 ? _1066 : _3263;
    assign _3267 = _2316 ? _1066 : _3265;
    assign _118 = _3267;
    always @(posedge _276) begin
        if (_274)
            _618 <= _1066;
        else
            _618 <= _118;
    end
    assign _3275 = _217[0:0];
    assign _3276 = ~ _3275;
    assign _3271 = _1330[4:0];
    assign _3273 = _3271 == _3132;
    assign _3268 = _1330[5:5];
    assign _3270 = _3268 == _1066;
    assign _3274 = _3270 & _3273;
    assign _3277 = _3274 & _3276;
    assign _3278 = _3277 ? _1260 : _3253;
    assign _3279 = _2915 ? _3278 : _3253;
    assign _119 = _3279;
    always @(posedge _276) begin
        if (_274)
            _3253 <= _1282;
        else
            _3253 <= _119;
    end
    assign _3287 = _217[0:0];
    assign _3288 = ~ _3287;
    assign _3283 = _1330[4:0];
    assign _3285 = _3283 == _3144;
    assign _3280 = _1330[5:5];
    assign _3282 = _3280 == _1066;
    assign _3286 = _3282 & _3285;
    assign _3289 = _3286 & _3288;
    assign _3290 = _3289 ? _1260 : _3250;
    assign _3291 = _2915 ? _3290 : _3250;
    assign _120 = _3291;
    always @(posedge _276) begin
        if (_274)
            _3250 <= _1282;
        else
            _3250 <= _120;
    end
    assign _3254 = { _3250,
                     _3253 };
    assign _3299 = _217[0:0];
    assign _3300 = ~ _3299;
    assign _3295 = _1330[4:0];
    assign _3297 = _3295 == _3156;
    assign _3292 = _1330[5:5];
    assign _3294 = _3292 == _1066;
    assign _3298 = _3294 & _3297;
    assign _3301 = _3298 & _3300;
    assign _3302 = _3301 ? _1260 : _3245;
    assign _3303 = _2915 ? _3302 : _3245;
    assign _121 = _3303;
    always @(posedge _276) begin
        if (_274)
            _3245 <= _1282;
        else
            _3245 <= _121;
    end
    assign _3311 = _217[0:0];
    assign _3312 = ~ _3311;
    assign _3307 = _1330[4:0];
    assign _3309 = _3307 == _3168;
    assign _3304 = _1330[5:5];
    assign _3306 = _3304 == _1066;
    assign _3310 = _3306 & _3309;
    assign _3313 = _3310 & _3312;
    assign _3314 = _3313 ? _1260 : _3242;
    assign _3315 = _2915 ? _3314 : _3242;
    assign _122 = _3315;
    always @(posedge _276) begin
        if (_274)
            _3242 <= _1282;
        else
            _3242 <= _122;
    end
    assign _3246 = { _3242,
                     _3245 };
    assign _3354 = g_crc[31:16];
    assign _3355 = _3354 ^ _3246;
    assign _3356 = _3355 & _3254;
    assign _3358 = _3356 == _1173;
    assign _3329 = _2758 == _3328;
    assign _3330 = ~ _3329;
    assign _3332 = _3322 ? _3331 : g_crc_bad_0;
    assign _3333 = _2231 ? _3332 : g_crc_bad_0;
    assign _3334 = _2767 ? g_crc_bad_0 : _3333;
    assign _3335 = _2217 ? _3334 : g_crc_bad_0;
    assign _3337 = _2731 ? _1066 : _3335;
    assign _123 = _3337;
    always @(posedge _276) begin
        if (_274)
            g_crc_bad_0 <= _1066;
        else
            g_crc_bad_0 <= _123;
    end
    assign _3331 = g_crc_bad_0 | _3330;
    assign _3348 = ~ _3331;
    assign _3347 = g_left == _3206;
    assign _3349 = _3347 ? _3348 : _615;
    assign _3350 = _3322 ? _3349 : _615;
    assign _3351 = _2231 ? _3350 : _615;
    assign _3352 = _2767 ? _615 : _3351;
    assign _3353 = _2217 ? _3352 : _615;
    assign _3341 = ~ _2316;
    assign _3339 = ~ _2731;
    assign _3338 = _2272 & _3233;
    assign _3340 = _3338 & _3339;
    assign _3342 = _3340 & _3341;
    assign _124 = _3342;
    always @(posedge _276) begin
        if (_274)
            g_resid_chk_0 <= _1066;
        else
            g_resid_chk_0 <= _124;
    end
    assign _3359 = g_resid_chk_0 ? _3358 : _3353;
    assign _3361 = _2731 ? _1066 : _3359;
    assign _3363 = _2316 ? _1066 : _3361;
    assign _125 = _3363;
    always @(posedge _276) begin
        if (_274)
            _615 <= _1066;
        else
            _615 <= _125;
    end
    assign _3364 = 4'b0101;
    assign _3365 = _2643 == _3364;
    assign _3366 = _3365 ? _1260 : _605;
    assign _3367 = _2641 ? _3366 : _605;
    assign _126 = _3367;
    always @(posedge _276) begin
        if (_274)
            _605 <= _1282;
        else
            _605 <= _126;
    end
    assign _606 = _605[6:0];
    assign _602 = _592[7:1];
    assign _607 = _602 == _606;
    assign _599 = 16'b1010110011100001;
    assign _3372 = _600[10:10];
    assign _3371 = _600[12:12];
    assign _3373 = _3371 ^ _3372;
    assign _3370 = _600[13:13];
    assign _3374 = _3370 ^ _3373;
    assign _3369 = _600[15:15];
    assign _3375 = _3369 ^ _3374;
    assign _3368 = _600[14:0];
    assign _3376 = { _3368,
                     _3375 };
    assign _127 = _3376;
    always @(posedge _276) begin
        if (_274)
            _600 <= _599;
        else
            _600 <= _127;
    end
    assign _601 = _600[0:0];
    assign _3395 = _130 + _2721;
    assign _3393 = _130 - _2721;
    assign _3396 = _1665 ? _3395 : _3393;
    assign _1676 = _130 == _2726;
    assign _1677 = ~ _1676;
    assign _3378 = _1244 == _1717;
    assign _2983 = _1231 & _1236;
    assign _2984 = _2983 & _1241;
    assign _3379 = _2984 & _3378;
    assign _3382 = _3379 ? _2703 : _1066;
    assign _128 = _3382;
    always @(posedge _276) begin
        if (_274)
            _1674 <= _1066;
        else
            _1674 <= _128;
    end
    assign _1678 = _1674 & _1677;
    assign _1664 = ~ _597;
    assign _3389 = ~ _3388;
    assign _3385 = _2586 | _2596;
    assign _3383 = _2343 | _2548;
    assign _3384 = _2308 | _3383;
    assign _3386 = _3384 | _3385;
    assign _3390 = _3386 & _3389;
    assign f_rx_push = _3390;
    assign _1665 = f_rx_push & _1664;
    assign _3391 = _1665 ^ _1678;
    assign _3397 = _3391 ? _3396 : _130;
    always @(posedge _276) begin
        if (_274)
            _3400 <= _2726;
        else
            _3400 <= _3397;
    end
    assign _130 = _3400;
    assign _597 = _130 == _2836;
    assign _593 = _592[0:0];
    assign _4917 = _588[7:1];
    assign _4918 = { vdd,
                     _4917 };
    assign _4915 = _4907[7:7];
    assign _4914 = _4907[6:6];
    assign _4913 = _4907[5:5];
    assign _4912 = _4907[4:4];
    assign _4911 = _4907[3:3];
    assign _4910 = _4907[2:2];
    assign _4909 = _4907[1:1];
    assign _4908 = _4907[0:0];
    assign _4916 = { _4908,
                     _4909,
                     _4910,
                     _4911,
                     _4912,
                     _4913,
                     _4914,
                     _4915 };
    assign _4900 = _223 + _2721;
    assign _4898 = _223 - _2721;
    assign _4901 = _3427 ? _4900 : _4898;
    assign _2311 = _223 == _2836;
    assign _3426 = ~ _2311;
    assign _3423 = ~ _2309;
    assign _3406 = _3403 ? _2703 : _1066;
    assign _131 = _3406;
    always @(posedge _276) begin
        if (_274)
            _2882 <= _1066;
        else
            _2882 <= _131;
    end
    assign _3424 = _2882 & _3423;
    assign _2306 = ~ _2272;
    assign _2300 = g_bitpos + _1693;
    assign _2295 = ~ _2230;
    assign g_tx_bit = _2285 & _2293;
    assign _2296 = g_tx_bit & _2295;
    assign _2297 = _2296 & g_data_left;
    assign _2298 = _2266 | _2297;
    assign _2301 = _2298 ? _2300 : g_bitpos;
    assign _2303 = _2301 == _1074;
    assign _2304 = ~ _2303;
    assign _2275 = _2274 & _2109;
    assign _2305 = _2275 & _2304;
    assign _2307 = _2305 & _2306;
    assign _2271 = g_bitpos == _1729;
    assign _2258 = g_cnt[5:0];
    assign _2263 = _2258 < _2262;
    assign _2264 = ~ _2263;
    assign _2254 = g_cnt[15:6];
    assign _2256 = _2254 == _1078;
    assign _2257 = ~ _2256;
    assign _2265 = _2257 | _2264;
    assign _4883 = ~ _2111;
    assign _4884 = _2109 & _4883;
    assign _4887 = _4884 ? _1273 : _1274;
    assign _4876 = ~ _2293;
    assign _4877 = _2285 & _4876;
    assign _4878 = _612 | _4877;
    assign _4879 = _4878 | _4868;
    assign _4881 = _4879 ? _1274 : _4875;
    assign _4862 = g_run + _1693;
    assign _4859 = g_run + _1693;
    assign _4855 = vdd == g_last;
    assign _4853 = g_run == _1074;
    assign _4854 = ~ _4853;
    assign _4856 = _4854 & _4855;
    assign _4860 = _4856 ? _4859 : _1693;
    assign _4851 = _2221 == _1274;
    assign _4863 = _4851 ? _4862 : _4860;
    assign _4864 = _4863 == _2228;
    assign _4845 = g_run + _1693;
    assign _4841 = gnd == g_last;
    assign _4839 = g_run == _1074;
    assign _4840 = ~ _4839;
    assign _4842 = _4840 & _4841;
    assign _4846 = _4842 ? _4845 : _1693;
    assign _4837 = _2221 == _1274;
    assign _4848 = _4837 ? _1074 : _4846;
    assign _4849 = _4848 == _2228;
    assign _4865 = _2758 ? _4864 : _4849;
    assign _4866 = _2224 & _4865;
    assign _4867 = ~ _4866;
    assign _4833 = g_left == _3206;
    assign _4831 = g_left == _1201;
    assign _4834 = _3322 ? _4833 : _4831;
    assign _4826 = g_cnt + _5164;
    assign _4827 = _4826 == _2251;
    assign _4824 = g_cnt == _2251;
    assign _4828 = _2253 ? _4827 : _4824;
    assign _4822 = ~ _2767;
    assign _4823 = _2217 & _4822;
    assign _4829 = _4823 & _4828;
    assign _4835 = _4829 & _4834;
    assign _4868 = _4835 & _4867;
    assign _4870 = _4868 ? _1332 : _4821;
    assign _4872 = _2767 ? _1394 : _4870;
    assign _4818 = _2293 ? _4816 : _1332;
    assign _4814 = _2136 & _2134;
    assign _4816 = _4814 ? _1274 : g_mode_0;
    assign _4819 = _2285 ? _4818 : _4816;
    assign _3502 = _2293 ? _3501 : _3409;
    assign _3503 = _2285 ? _3502 : _3409;
    assign _132 = _3503;
    always @(posedge _276) begin
        if (_274)
            _3409 <= _1066;
        else
            _3409 <= _132;
    end
    assign _3515 = ~ _3501;
    assign _3513 = ~ f_lane0_out;
    assign _3514 = _3501 ? f_lane0_out : _3513;
    always @* begin
        case (_2137)
        0:
            _3516 <= _3501;
        1:
            _3516 <= _3514;
        2:
            _3516 <= _3515;
        default:
            _3516 <= _3501;
        endcase
    end
    assign _3517 = _2293 ? _3516 : _2703;
    assign _3518 = _2285 ? _3517 : f_lane0_out;
    assign _3510 = ~ _2284;
    assign _3507 = _2137 == _1274;
    assign _3504 = ~ _2109;
    assign _3505 = _2105 & _3504;
    assign _3508 = _3505 & _3507;
    assign _3509 = _3508 & _2216;
    assign _3511 = _3509 & _3510;
    assign _3519 = _3511 ? _3409 : _3518;
    assign _3521 = _2745 ? _2703 : _3519;
    assign _3523 = _2274 ? _2703 : _3521;
    assign _3525 = _2731 ? _2703 : _3523;
    assign _3527 = _2316 ? _2703 : _3525;
    assign _133 = _3527;
    always @(posedge _276) begin
        if (_274)
            f_lane0_out <= vdd;
        else
            f_lane0_out <= _133;
    end
    assign _2743 = _2127 == f_lane0_out;
    assign _2744 = ~ _2743;
    assign _2192 = _2177 == _1173;
    assign _2189 = _2188 == _2177;
    assign _2182 = _2146 == _2177;
    assign _2190 = _2181 ? _2189 : _2182;
    assign _2193 = _2142 ? _2192 : _2190;
    assign _2216 = _2111 ? _2215 : _2193;
    assign _2739 = _2137 == _1274;
    assign _2740 = ~ _2739;
    assign _2736 = ~ _2111;
    assign _2734 = _2108[6:6];
    assign _2867 = _2136 | _2105;
    assign _4789 = ~ _2351;
    assign _4790 = _2349 & _4789;
    assign _4793 = _4790 ? _1273 : _1274;
    assign _4782 = ~ _2533;
    assign _4783 = _2525 & _4782;
    assign _4784 = _626 | _4783;
    assign _4785 = _4784 | _4774;
    assign _4787 = _4785 ? _1274 : _4781;
    assign _4768 = g_run_0 + _1693;
    assign _4765 = g_run_0 + _1693;
    assign _4761 = vdd == g_last_0;
    assign _4759 = g_run_0 == _1074;
    assign _4760 = ~ _4759;
    assign _4762 = _4760 & _4761;
    assign _4766 = _4762 ? _4765 : _1693;
    assign _4757 = _2461 == _1274;
    assign _4769 = _4757 ? _4768 : _4766;
    assign _4770 = _4769 == _2468;
    assign _4751 = g_run_0 + _1693;
    assign _4747 = gnd == g_last_0;
    assign _4745 = g_run_0 == _1074;
    assign _4746 = ~ _4745;
    assign _4748 = _4746 & _4747;
    assign _4752 = _4748 ? _4751 : _1693;
    assign _4743 = _2461 == _1274;
    assign _4754 = _4743 ? _1074 : _4752;
    assign _4755 = _4754 == _2468;
    assign _4771 = _2803 ? _4770 : _4755;
    assign _4772 = _2464 & _4771;
    assign _4773 = ~ _4772;
    assign _4739 = g_left_0 == _3206;
    assign _4737 = g_left_0 == _1201;
    assign _4740 = _3182 ? _4739 : _4737;
    assign _4732 = g_cnt_0 + _5164;
    assign _4733 = _4732 == _2491;
    assign _4730 = g_cnt_0 == _2491;
    assign _4734 = _2493 ? _4733 : _4730;
    assign _4728 = ~ _2812;
    assign _4729 = _2457 & _4728;
    assign _4735 = _4729 & _4734;
    assign _4741 = _4735 & _4740;
    assign _4774 = _4741 & _4773;
    assign _4776 = _4774 ? _1332 : _4727;
    assign _4778 = _2812 ? _1394 : _4776;
    assign _4724 = _2533 ? _4722 : _1332;
    assign _4720 = _2376 & _2374;
    assign _4722 = _4720 ? _1274 : g_mode;
    assign _4725 = _2525 ? _4724 : _4722;
    assign _3559 = _2533 ? _3558 : _3530;
    assign _3560 = _2525 ? _3559 : _3530;
    assign _134 = _3560;
    always @(posedge _276) begin
        if (_274)
            _3530 <= _1066;
        else
            _3530 <= _134;
    end
    assign _4587 = ~ _3558;
    assign _4585 = ~ f_lane1_out;
    assign _4586 = _3558 ? f_lane1_out : _4585;
    always @* begin
        case (_2377)
        0:
            _4588 <= _3558;
        1:
            _4588 <= _4586;
        2:
            _4588 <= _4587;
        default:
            _4588 <= _3558;
        endcase
    end
    assign _2468 = _2460[4:2];
    assign _4557 = g_run_0 + _1693;
    assign _4558 = _2803 ? _4557 : _1074;
    assign _4553 = g_run_0 + _1693;
    assign _4549 = _2803 == g_last_0;
    assign _4547 = g_run_0 == _1074;
    assign _4548 = ~ _4547;
    assign _4550 = _4548 & _4549;
    assign _4554 = _4550 ? _4553 : _1693;
    assign _4545 = _2461 == _1274;
    assign _4559 = _4545 ? _4558 : _4554;
    assign _4560 = _2812 ? _4543 : _4559;
    assign _4539 = g_run_0 + _1693;
    assign _4540 = _3558 ? _4539 : _1074;
    assign _4535 = g_run_0 + _1693;
    assign _3555 = _3547[7:7];
    assign _3554 = _3547[6:6];
    assign _3553 = _3547[5:5];
    assign _3552 = _3547[4:4];
    assign _3551 = _3547[3:3];
    assign _3550 = _3547[2:2];
    assign _3549 = _3547[1:1];
    assign _3545 = _3537[7:7];
    assign _3544 = _3537[6:6];
    assign _3543 = _3537[5:5];
    assign _3542 = _3537[4:4];
    assign _3541 = _3537[3:3];
    assign _3540 = _3537[2:2];
    assign _3539 = _3537[1:1];
    assign _3474 = _3430 == _1729;
    assign _3475 = _3427 & _3474;
    always @(posedge _276) begin
        if (_274)
            _3476 <= _1282;
        else
            if (_3475)
                _3476 <= _3420;
    end
    assign _3468 = _3430 == _1723;
    assign _3469 = _3427 & _3468;
    always @(posedge _276) begin
        if (_274)
            _3470 <= _1282;
        else
            if (_3469)
                _3470 <= _3420;
    end
    assign _3462 = _3430 == _1717;
    assign _3463 = _3427 & _3462;
    always @(posedge _276) begin
        if (_274)
            _3464 <= _1282;
        else
            if (_3463)
                _3464 <= _3420;
    end
    assign _3456 = _3430 == _1359;
    assign _3457 = _3427 & _3456;
    always @(posedge _276) begin
        if (_274)
            _3458 <= _1282;
        else
            if (_3457)
                _3458 <= _3420;
    end
    assign _3450 = _3430 == _1705;
    assign _3451 = _3427 & _3450;
    always @(posedge _276) begin
        if (_274)
            _3452 <= _1282;
        else
            if (_3451)
                _3452 <= _3420;
    end
    assign _3444 = _3430 == _1699;
    assign _3445 = _3427 & _3444;
    always @(posedge _276) begin
        if (_274)
            _3446 <= _1282;
        else
            if (_3445)
                _3446 <= _3420;
    end
    assign _3438 = _3430 == _1693;
    assign _3439 = _3427 & _3438;
    always @(posedge _276) begin
        if (_274)
            _3440 <= _1282;
        else
            if (_3439)
                _3440 <= _3420;
    end
    assign _3562 = _3430 + _1693;
    assign _3563 = _3427 ? _3562 : _3430;
    assign _135 = _3563;
    always @(posedge _276) begin
        if (_274)
            _3430 <= _1074;
        else
            _3430 <= _135;
    end
    assign _3432 = _3430 == _1074;
    assign _3433 = _3427 & _3432;
    assign _3627 = _2266 ? _3626 : g_byte;
    assign _3628 = _2272 ? _3626 : _3627;
    assign _3578 = _3577 ? _3575 : _3568;
    assign _3576 = _3565 ? _3575 : _3568;
    assign _3579 = _2552 ? _3578 : _3576;
    assign _136 = _3579;
    always @(posedge _276) begin
        if (_274)
            _3568 <= _1282;
        else
            _3568 <= _136;
    end
    assign _3574 = _2506 ? _3573 : g_byte_0;
    assign _3575 = _2512 ? _3573 : _3574;
    assign _3620 = _2343 ? _3568 : _3575;
    assign _3587 = _3586 ? _592 : _3584;
    assign _3585 = _3581 ? _592 : _3584;
    assign _3588 = _2603 ? _3587 : _3585;
    assign _137 = _3588;
    always @(posedge _276) begin
        if (_274)
            _3584 <= _1282;
        else
            _3584 <= _137;
    end
    assign _3605 = _592[6:0];
    assign _3606 = { _3605,
                     _3602 };
    assign _3603 = _592[7:1];
    assign _3601 = _306[7:7];
    assign _3600 = _306[6:6];
    assign _3599 = _306[5:5];
    assign _3598 = _306[4:4];
    assign _3597 = _306[3:3];
    assign _3596 = _306[2:2];
    assign _3595 = _306[1:1];
    assign _3594 = _306[0:0];
    assign _3592 = _711[102:100];
    assign _3591 = _705[102:100];
    assign _3590 = _699[102:100];
    assign _3589 = _299[102:100];
    always @* begin
        case (f_winner)
        0:
            _3593 <= _3589;
        1:
            _3593 <= _3590;
        2:
            _3593 <= _3591;
        default:
            _3593 <= _3592;
        endcase
    end
    always @* begin
        case (_3593)
        0:
            _3602 <= _3594;
        1:
            _3602 <= _3595;
        2:
            _3602 <= _3596;
        3:
            _3602 <= _3597;
        4:
            _3602 <= _3598;
        5:
            _3602 <= _3599;
        6:
            _3602 <= _3600;
        default:
            _3602 <= _3601;
        endcase
    end
    assign _3604 = { _3602,
                     _3603 };
    always @* begin
        case (_2593)
        0:
            _3607 <= _592;
        1:
            _3607 <= _3604;
        2:
            _3607 <= _3606;
        default:
            _3607 <= _592;
        endcase
    end
    assign _3608 = _1393 ? _3607 : _592;
    assign _138 = _3608;
    always @(posedge _276) begin
        if (_274)
            _592 <= _1282;
        else
            _592 <= _138;
    end
    assign _3586 = _2586 & _2596;
    assign _3612 = _3586 ? _2586 : _1066;
    assign _3580 = ~ _2586;
    assign _3581 = _3580 & _2596;
    assign _3610 = _3581 ? _2703 : _2586;
    assign _2590 = _711[97:96];
    assign _2589 = _705[97:96];
    assign _2588 = _699[97:96];
    assign _2587 = _299[97:96];
    always @* begin
        case (f_winner)
        0:
            _2591 <= _2587;
        1:
            _2591 <= _2588;
        2:
            _2591 <= _2589;
        default:
            _2591 <= _2590;
        endcase
    end
    assign _2593 = _1392 ? _1394 : _2591;
    assign f_eng_push = _2593 == _1332;
    assign _2596 = _1393 & f_eng_push;
    assign _2602 = _2586 | _2596;
    assign _2599 = _2343 | _2548;
    assign _2600 = ~ _2599;
    assign _2598 = ~ _2308;
    assign _2601 = _2598 & _2600;
    assign _2603 = _2601 & _2602;
    assign _3613 = _2603 ? _3612 : _3610;
    assign _139 = _3613;
    always @(posedge _276) begin
        if (_274)
            _2586 <= _1066;
        else
            _2586 <= _139;
    end
    assign _3619 = _2586 ? _3584 : _592;
    assign _3577 = _2343 & _2548;
    assign _3617 = _3577 ? _2343 : _1066;
    assign _2546 = ~ _2512;
    assign _2540 = g_bitpos_0 + _1693;
    assign _2535 = ~ _2470;
    assign g_tx_bit_0 = _2525 & _2533;
    assign _2536 = g_tx_bit_0 & _2535;
    assign _2537 = _2536 & g_data_left_0;
    assign _2538 = _2506 | _2537;
    assign _2541 = _2538 ? _2540 : g_bitpos_0;
    assign _2543 = _2541 == _1074;
    assign _2544 = ~ _2543;
    assign _2515 = _2514 & _2349;
    assign _2545 = _2515 & _2544;
    assign _2547 = _2545 & _2546;
    assign _2511 = g_bitpos_0 == _1729;
    assign _2512 = _2506 & _2511;
    assign _2548 = _2512 | _2547;
    assign _3564 = ~ _2343;
    assign _3565 = _3564 & _2548;
    assign _3615 = _3565 ? _2703 : _2343;
    assign _3618 = _2552 ? _3617 : _3615;
    assign _140 = _3618;
    always @(posedge _276) begin
        if (_274)
            _2343 <= _1066;
        else
            _2343 <= _140;
    end
    assign _2551 = _2343 | _2548;
    assign _2550 = ~ _2308;
    assign _2552 = _2550 & _2551;
    assign _3621 = _2552 ? _3620 : _3619;
    assign _3629 = _2308 ? _3628 : _3621;
    assign _141 = _3629;
    assign _142 = _141;
    assign _3402 = _1244 == _1359;
    assign _3403 = _1243 & _3402;
    assign _3630 = _3403 ? _1260 : _3419;
    assign _143 = _3630;
    always @(posedge _276) begin
        if (_274)
            _3419 <= _1282;
        else
            _3419 <= _143;
    end
    assign _3420 = _222 ? _142 : _3419;
    always @(posedge _276) begin
        if (_274)
            _3434 <= _1282;
        else
            if (_3433)
                _3434 <= _3420;
    end
    assign _4159 = _3416 + _1693;
    assign _4156 = ~ _595;
    assign _2696 = ~ _595;
    assign _2695 = _2525 & _2694;
    assign _2697 = _2695 & _2696;
    assign _2688 = ~ _595;
    assign _2685 = g_bitpos == _1074;
    assign _2228 = _2220[4:2];
    assign _4027 = g_run + _1693;
    assign _4028 = _2758 ? _4027 : _1074;
    assign _4023 = g_run + _1693;
    assign _4019 = _2758 == g_last;
    assign _4017 = g_run == _1074;
    assign _4018 = ~ _4017;
    assign _4020 = _4018 & _4019;
    assign _4024 = _4020 ? _4023 : _1693;
    assign _4015 = _2221 == _1274;
    assign _4029 = _4015 ? _4028 : _4024;
    assign _4030 = _2767 ? _4013 : _4029;
    assign _4009 = g_run + _1693;
    assign _4010 = _3501 ? _4009 : _1074;
    assign _4005 = g_run + _1693;
    assign _4001 = _3501 == g_last;
    assign _3999 = g_run == _1074;
    assign _4000 = ~ _3999;
    assign _4002 = _4000 & _4001;
    assign _4006 = _4002 ? _4005 : _1693;
    assign _3997 = _2221 == _1274;
    assign _4011 = _3997 ? _4010 : _4006;
    assign _3650 = _3649 ? _3647 : g_lim;
    assign _3651 = g_len_cap ? _3650 : g_lim;
    assign _144 = _3651;
    always @(posedge _276) begin
        if (_274)
            g_lim <= _1282;
        else
            g_lim <= _144;
    end
    assign _2250 = { _1282,
                     g_lim };
    assign _3659 = _217[0:0];
    assign _3660 = ~ _3659;
    assign _3656 = 5'b10100;
    assign _3655 = _1330[4:0];
    assign _3657 = _3655 == _3656;
    assign _3652 = _1330[5:5];
    assign _3654 = _3652 == _1066;
    assign _3658 = _3654 & _3657;
    assign _3661 = _3658 & _3660;
    assign _3662 = _3661 ? _1260 : _2244;
    assign _3663 = _2915 ? _3662 : _2244;
    assign _145 = _3663;
    always @(posedge _276) begin
        if (_274)
            _2244 <= _1282;
        else
            _2244 <= _145;
    end
    assign _3671 = _217[0:0];
    assign _3672 = ~ _3671;
    assign _3668 = 5'b10101;
    assign _3667 = _1330[4:0];
    assign _3669 = _3667 == _3668;
    assign _3664 = _1330[5:5];
    assign _3666 = _3664 == _1066;
    assign _3670 = _3666 & _3669;
    assign _3673 = _3670 & _3672;
    assign _3674 = _3673 ? _1260 : _2241;
    assign _3675 = _2915 ? _3674 : _2241;
    assign _146 = _3675;
    always @(posedge _276) begin
        if (_274)
            _2241 <= _1282;
        else
            _2241 <= _146;
    end
    assign _2245 = { _2241,
                     _2244 };
    assign _3238 = g_sr[14:0];
    assign _3239 = { _3238,
                     _2758 };
    assign _3676 = _2231 ? _3239 : g_sr;
    assign _3677 = _2767 ? g_sr : _3676;
    assign _3678 = _2217 ? _3677 : g_sr;
    assign _3680 = _2731 ? _1173 : _3678;
    assign _147 = _3680;
    always @(posedge _276) begin
        if (_274)
            g_sr <= _1173;
        else
            g_sr <= _147;
    end
    assign _3642 = g_sr[3:0];
    assign _3688 = _217[0:0];
    assign _3689 = ~ _3688;
    assign _3685 = 5'b10111;
    assign _3684 = _1330[4:0];
    assign _3686 = _3684 == _3685;
    assign _3681 = _1330[5:5];
    assign _3683 = _3681 == _1066;
    assign _3687 = _3683 & _3686;
    assign _3690 = _3687 & _3689;
    assign _3691 = _3690 ? _1260 : _3640;
    assign _3692 = _2915 ? _3691 : _3640;
    assign _148 = _3692;
    always @(posedge _276) begin
        if (_274)
            _3640 <= _1282;
        else
            _3640 <= _148;
    end
    assign _3641 = _3640[3:0];
    assign _3643 = _3641 < _3642;
    assign _3644 = _3643 ? _3641 : _3642;
    assign _3646 = { _1066,
                     _3644,
                     _1074 };
    assign _2262 = _2261[5:0];
    assign _3636 = { _1394,
                     _2262 };
    assign _3647 = _3636 + _3646;
    assign _3648 = { _1282,
                     _3647 };
    assign _3649 = _3648 < _2245;
    assign _3718 = _3649 ? _2703 : g_len_known;
    assign _3700 = g_cnt[5:0];
    assign _3705 = _3700 == _3704;
    assign _3696 = g_cnt[15:6];
    assign _3698 = _3696 == _1078;
    assign _3694 = ~ _3233;
    assign _3693 = _2261[7:7];
    assign _3695 = _3693 & _3694;
    assign _3699 = _3695 & _3698;
    assign _3706 = _3699 & _3705;
    assign _3708 = _3706 ? _2703 : g_len_cap;
    assign _3709 = _2253 ? _3708 : g_len_cap;
    assign _3710 = _2231 ? _3709 : g_len_cap;
    assign _3711 = _2767 ? g_len_cap : _3710;
    assign _3712 = _2217 ? _3711 : g_len_cap;
    assign _3714 = g_len_cap ? _1066 : _3712;
    assign _3716 = _2731 ? _1066 : _3714;
    assign _149 = _3716;
    always @(posedge _276) begin
        if (_274)
            g_len_cap <= _1066;
        else
            g_len_cap <= _149;
    end
    assign _3719 = g_len_cap ? _3718 : g_len_known;
    assign _3721 = _2731 ? _1066 : _3719;
    assign _150 = _3721;
    always @(posedge _276) begin
        if (_274)
            g_len_known <= _1066;
        else
            g_len_known <= _150;
    end
    assign _2251 = g_len_known ? _2250 : _2245;
    assign _3989 = g_cnt + _5164;
    assign _3990 = _2253 ? _3989 : _3987;
    assign _3991 = _2231 ? _3990 : _3987;
    assign _3972 = _2767 ? _3971 : _2758;
    assign _3498 = _3490[7:7];
    assign _3497 = _3490[6:6];
    assign _3496 = _3490[5:5];
    assign _3495 = _3490[4:4];
    assign _3494 = _3490[3:3];
    assign _3493 = _3490[2:2];
    assign _3492 = _3490[1:1];
    assign _3488 = _3480[7:7];
    assign _3487 = _3480[6:6];
    assign _3486 = _3480[5:5];
    assign _3485 = _3480[4:4];
    assign _3484 = _3480[3:3];
    assign _3483 = _3480[2:2];
    assign _3482 = _3480[1:1];
    assign _3479 = _595 ? _1280 : _3477;
    assign _3624 = g_byte[7:1];
    assign _3625 = { _2758,
                     _3624 };
    assign _3622 = g_byte[6:0];
    assign _3623 = { _3622,
                     _2758 };
    assign _3626 = _3410 ? _3625 : _3623;
    assign _3726 = _2266 ? _3626 : _3725;
    assign _3727 = _2253 ? _3726 : _3725;
    assign _3728 = _2231 ? _3727 : _3725;
    assign _3729 = _2767 ? _3725 : _3728;
    assign _3722 = g_data_left ? _3480 : g_byte;
    assign _3723 = _2230 ? g_byte : _3722;
    assign _3724 = _2293 ? _3723 : g_byte;
    assign _3725 = _2285 ? _3724 : g_byte;
    assign _3730 = _2217 ? _3729 : _3725;
    assign _151 = _3730;
    always @(posedge _276) begin
        if (_274)
            g_byte <= _1282;
        else
            g_byte <= _151;
    end
    assign _3480 = _2686 ? _3479 : g_byte;
    assign _3481 = _3480[0:0];
    assign _3489 = { _3481,
                     _3482,
                     _3483,
                     _3484,
                     _3485,
                     _3486,
                     _3487,
                     _3488 };
    assign _3410 = _2108[5:5];
    assign _3490 = _3410 ? _3480 : _3489;
    assign _3491 = _3490[0:0];
    assign _3738 = g_bitpos + _1693;
    assign _3739 = _2266 ? _3738 : _3736;
    assign _3740 = _2253 ? _3739 : _3736;
    assign _3741 = _2231 ? _3740 : _3736;
    assign _3742 = _2767 ? _3736 : _3741;
    assign _3732 = g_bitpos + _1693;
    assign _3733 = g_data_left ? _3732 : g_bitpos;
    assign _3734 = _2230 ? g_bitpos : _3733;
    assign _3735 = _2293 ? _3734 : g_bitpos;
    assign _3736 = _2285 ? _3735 : g_bitpos;
    assign _3743 = _2217 ? _3742 : _3736;
    assign _3745 = _2731 ? _1074 : _3743;
    assign _152 = _3745;
    always @(posedge _276) begin
        if (_274)
            g_bitpos <= _1074;
        else
            g_bitpos <= _152;
    end
    always @* begin
        case (g_bitpos)
        0:
            _3499 <= _3491;
        1:
            _3499 <= _3492;
        2:
            _3499 <= _3493;
        3:
            _3499 <= _3494;
        4:
            _3499 <= _3495;
        5:
            _3499 <= _3496;
        6:
            _3499 <= _3497;
        default:
            _3499 <= _3498;
        endcase
    end
    assign _3327 = _2108[7:7];
    assign _3756 = _217[0:0];
    assign _3757 = ~ _3756;
    assign _3753 = 5'b01100;
    assign _3752 = _1330[4:0];
    assign _3754 = _3752 == _3753;
    assign _3749 = _1330[5:5];
    assign _3751 = _3749 == _1066;
    assign _3755 = _3751 & _3754;
    assign _3758 = _3755 & _3757;
    assign _3759 = _3758 ? _1260 : _3748;
    assign _3760 = _2915 ? _3759 : _3748;
    assign _153 = _3760;
    always @(posedge _276) begin
        if (_274)
            _3748 <= _1282;
        else
            _3748 <= _153;
    end
    assign _3771 = _217[0:0];
    assign _3772 = ~ _3771;
    assign _3768 = 5'b01101;
    assign _3767 = _1330[4:0];
    assign _3769 = _3767 == _3768;
    assign _3764 = _1330[5:5];
    assign _3766 = _3764 == _1066;
    assign _3770 = _3766 & _3769;
    assign _3773 = _3770 & _3772;
    assign _3774 = _3773 ? _1260 : _3763;
    assign _3775 = _2915 ? _3774 : _3763;
    assign _154 = _3775;
    always @(posedge _276) begin
        if (_274)
            _3763 <= _1282;
        else
            _3763 <= _154;
    end
    assign _3786 = _217[0:0];
    assign _3787 = ~ _3786;
    assign _3783 = 5'b01110;
    assign _3782 = _1330[4:0];
    assign _3784 = _3782 == _3783;
    assign _3779 = _1330[5:5];
    assign _3781 = _3779 == _1066;
    assign _3785 = _3781 & _3784;
    assign _3788 = _3785 & _3787;
    assign _3789 = _3788 ? _1260 : _3778;
    assign _3790 = _2915 ? _3789 : _3778;
    assign _155 = _3790;
    always @(posedge _276) begin
        if (_274)
            _3778 <= _1282;
        else
            _3778 <= _155;
    end
    assign _3801 = _217[0:0];
    assign _3802 = ~ _3801;
    assign _3798 = 5'b01111;
    assign _3797 = _1330[4:0];
    assign _3799 = _3797 == _3798;
    assign _3794 = _1330[5:5];
    assign _3796 = _3794 == _1066;
    assign _3800 = _3796 & _3799;
    assign _3803 = _3800 & _3802;
    assign _3804 = _3803 ? _1260 : _3793;
    assign _3805 = _2915 ? _3804 : _3793;
    assign _156 = _3805;
    always @(posedge _276) begin
        if (_274)
            _3793 <= _1282;
        else
            _3793 <= _156;
    end
    assign _3966 = { _3793,
                     _3778,
                     _3763,
                     _3748 };
    assign _3959 = g_crc[30:0];
    assign _3961 = { _3959,
                     _1066 };
    assign _3952 = g_crc[31:31];
    assign _3953 = _2758 ^ _3952;
    assign _3955 = _3953 ? _3932 : _1249;
    assign _3949 = g_crc[30:0];
    assign _3951 = { _3949,
                     _1066 };
    assign _3956 = _3951 ^ _3955;
    assign _3813 = _217[0:0];
    assign _3814 = ~ _3813;
    assign _3810 = 5'b10110;
    assign _3809 = _1330[4:0];
    assign _3811 = _3809 == _3810;
    assign _3806 = _1330[5:5];
    assign _3808 = _3806 == _1066;
    assign _3812 = _3808 & _3811;
    assign _3815 = _3812 & _3814;
    assign _3816 = _3815 ? _1260 : _3703;
    assign _3817 = _2915 ? _3816 : _3703;
    assign _157 = _3817;
    always @(posedge _276) begin
        if (_274)
            _3703 <= _1282;
        else
            _3703 <= _157;
    end
    assign _3704 = _3703[5:0];
    assign _3945 = g_cnt[5:0];
    assign _3946 = _3945 < _3704;
    assign _3947 = ~ _3946;
    assign _3940 = g_cnt[15:6];
    assign _3942 = _3940 == _1078;
    assign _3943 = ~ _3942;
    assign _3825 = _217[0:0];
    assign _3826 = ~ _3825;
    assign _3822 = 5'b00111;
    assign _3821 = _1330[4:0];
    assign _3823 = _3821 == _3822;
    assign _3818 = _1330[5:5];
    assign _3820 = _3818 == _1066;
    assign _3824 = _3820 & _3823;
    assign _3827 = _3824 & _3826;
    assign _3828 = _3827 ? _1260 : _2261;
    assign _3829 = _2915 ? _3828 : _2261;
    assign _158 = _3829;
    always @(posedge _276) begin
        if (_274)
            _2261 <= _1282;
        else
            _2261 <= _158;
    end
    assign _3233 = _2261[6:6];
    assign _3939 = ~ _3233;
    assign _3944 = _3939 | _3943;
    assign _3948 = _3944 | _3947;
    assign _3957 = _3948 ? _3956 : _3938;
    assign _3958 = _2253 ? _3957 : _3938;
    assign _3840 = _217[0:0];
    assign _3841 = ~ _3840;
    assign _3837 = 5'b00110;
    assign _3836 = _1330[4:0];
    assign _3838 = _3836 == _3837;
    assign _3833 = _1330[5:5];
    assign _3835 = _3833 == _1066;
    assign _3839 = _3835 & _3838;
    assign _3842 = _3839 & _3841;
    assign _3843 = _3842 ? _1260 : _3832;
    assign _3844 = _2915 ? _3843 : _3832;
    assign _159 = _3844;
    always @(posedge _276) begin
        if (_274)
            _3832 <= _1282;
        else
            _3832 <= _159;
    end
    assign _3859 = _3832[5:0];
    assign _3854 = g_left - _3206;
    assign _3855 = _3322 ? _3854 : _3852;
    assign _3856 = _2231 ? _3855 : _3852;
    assign _3857 = _2767 ? _3852 : _3856;
    assign _3848 = g_left - _3206;
    assign _3849 = g_data_left ? g_left : _3848;
    assign _3850 = _2230 ? g_left : _3849;
    assign _3851 = _2293 ? _3850 : g_left;
    assign _3852 = _2285 ? _3851 : g_left;
    assign _3858 = _2217 ? _3857 : _3852;
    assign _3860 = _3846 ? _3859 : _3858;
    assign _3862 = _2731 ? _1201 : _3860;
    assign _160 = _3862;
    always @(posedge _276) begin
        if (_274)
            g_left <= _1201;
        else
            g_left <= _160;
    end
    assign _2291 = g_left == _1201;
    assign _2292 = ~ _2291;
    assign _3320 = ~ g_data_left;
    assign _3319 = _2217 & _2231;
    assign _3321 = _3319 & _3320;
    assign _3322 = _3321 & _2292;
    assign _3962 = _3322 ? _3961 : _3958;
    assign _2231 = ~ _2230;
    assign _3963 = _2231 ? _3962 : _3938;
    assign _3964 = _2767 ? _3938 : _3963;
    assign _3873 = _217[0:0];
    assign _3874 = ~ _3873;
    assign _3870 = 5'b01000;
    assign _3869 = _1330[4:0];
    assign _3871 = _3869 == _3870;
    assign _3866 = _1330[5:5];
    assign _3868 = _3866 == _1066;
    assign _3872 = _3868 & _3871;
    assign _3875 = _3872 & _3874;
    assign _3876 = _3875 ? _1260 : _3865;
    assign _3877 = _2915 ? _3876 : _3865;
    assign _161 = _3877;
    always @(posedge _276) begin
        if (_274)
            _3865 <= _1282;
        else
            _3865 <= _161;
    end
    assign _3888 = _217[0:0];
    assign _3889 = ~ _3888;
    assign _3885 = 5'b01001;
    assign _3884 = _1330[4:0];
    assign _3886 = _3884 == _3885;
    assign _3881 = _1330[5:5];
    assign _3883 = _3881 == _1066;
    assign _3887 = _3883 & _3886;
    assign _3890 = _3887 & _3889;
    assign _3891 = _3890 ? _1260 : _3880;
    assign _3892 = _2915 ? _3891 : _3880;
    assign _162 = _3892;
    always @(posedge _276) begin
        if (_274)
            _3880 <= _1282;
        else
            _3880 <= _162;
    end
    assign _3903 = _217[0:0];
    assign _3904 = ~ _3903;
    assign _3900 = 5'b01010;
    assign _3899 = _1330[4:0];
    assign _3901 = _3899 == _3900;
    assign _3896 = _1330[5:5];
    assign _3898 = _3896 == _1066;
    assign _3902 = _3898 & _3901;
    assign _3905 = _3902 & _3904;
    assign _3906 = _3905 ? _1260 : _3895;
    assign _3907 = _2915 ? _3906 : _3895;
    assign _163 = _3907;
    always @(posedge _276) begin
        if (_274)
            _3895 <= _1282;
        else
            _3895 <= _163;
    end
    assign _3918 = _217[0:0];
    assign _3919 = ~ _3918;
    assign _3915 = 5'b01011;
    assign _3914 = _1330[4:0];
    assign _3916 = _3914 == _3915;
    assign _3911 = _1330[5:5];
    assign _3913 = _3911 == _1066;
    assign _3917 = _3913 & _3916;
    assign _3920 = _3917 & _3919;
    assign _3921 = _3920 ? _1260 : _3910;
    assign _3922 = _2915 ? _3921 : _3910;
    assign _164 = _3922;
    always @(posedge _276) begin
        if (_274)
            _3910 <= _1282;
        else
            _3910 <= _164;
    end
    assign _3932 = { _3910,
                     _3895,
                     _3880,
                     _3865 };
    assign _3929 = g_crc[31:31];
    assign _3930 = _3501 ^ _3929;
    assign _3933 = _3930 ? _3932 : _1249;
    assign _3926 = g_crc[30:0];
    assign _3928 = { _3926,
                     _1066 };
    assign _3934 = _3928 ^ _3933;
    assign _3923 = g_crc[30:0];
    assign _3925 = { _3923,
                     _1066 };
    assign _3935 = g_data_left ? _3934 : _3925;
    assign _3936 = _2230 ? g_crc : _3935;
    assign _3937 = _2293 ? _3936 : g_crc;
    assign _3938 = _2285 ? _3937 : g_crc;
    assign _3965 = _2217 ? _3964 : _3938;
    assign _3967 = _2731 ? _3966 : _3965;
    assign _3969 = _2316 ? _1249 : _3967;
    assign _165 = _3969;
    always @(posedge _276) begin
        if (_274)
            g_crc <= _1249;
        else
            g_crc <= _165;
    end
    assign _3326 = g_crc[31:31];
    assign _3328 = _3326 ^ _3327;
    assign _3500 = g_data_left ? _3499 : _3328;
    assign _3501 = _2230 ? _2764 : _3500;
    assign _3970 = _2293 ? _3501 : g_last;
    assign _3971 = _2285 ? _3970 : g_last;
    assign _3973 = _2217 ? _3972 : _3971;
    assign _3975 = _2731 ? _2703 : _3973;
    assign _166 = _3975;
    always @(posedge _276) begin
        if (_274)
            g_last <= vdd;
        else
            g_last <= _166;
    end
    assign _2763 = ~ g_last;
    assign _2760 = _2221 == _1273;
    assign _2764 = _2760 ? _2763 : gnd;
    assign _3977 = _2137 == _1273;
    assign _3978 = _3977 ? _2127 : g_prev;
    assign _3979 = _2217 ? _3978 : g_prev;
    assign _3981 = _2731 ? _2703 : _3979;
    assign _167 = _3981;
    always @(posedge _276) begin
        if (_274)
            g_prev <= vdd;
        else
            g_prev <= _167;
    end
    assign _2757 = _2127 == g_prev;
    assign _2754 = _2137 == _1273;
    assign _2758 = _2754 ? _2757 : _2127;
    assign _2765 = _2758 == _2764;
    assign _2766 = ~ _2765;
    assign _2767 = _2230 & _2766;
    assign _3992 = _2767 ? _3987 : _3991;
    assign _3983 = g_cnt + _5164;
    assign _3984 = g_data_left ? _3983 : g_cnt;
    assign _3985 = _2230 ? g_cnt : _3984;
    assign _3986 = _2293 ? _3985 : g_cnt;
    assign _3987 = _2285 ? _3986 : g_cnt;
    assign _3993 = _2217 ? _3992 : _3987;
    assign _3995 = _2731 ? _1173 : _3993;
    assign _168 = _3995;
    always @(posedge _276) begin
        if (_274)
            g_cnt <= _1173;
        else
            g_cnt <= _168;
    end
    assign g_data_left = g_cnt < _2251;
    assign _2286 = _2230 | g_data_left;
    assign _2293 = _2286 | _2292;
    assign _4012 = _2293 ? _4011 : g_run;
    assign _4013 = _2285 ? _4012 : g_run;
    assign _4031 = _2217 ? _4030 : _4013;
    assign _4033 = _2731 ? _1074 : _4031;
    assign _169 = _4033;
    always @(posedge _276) begin
        if (_274)
            g_run <= _1074;
        else
            g_run <= _169;
    end
    assign _2229 = g_run == _2228;
    assign _4041 = _217[0:0];
    assign _4042 = ~ _4041;
    assign _4038 = 5'b00101;
    assign _4037 = _1330[4:0];
    assign _4039 = _4037 == _4038;
    assign _4034 = _1330[5:5];
    assign _4036 = _4034 == _1066;
    assign _4040 = _4036 & _4039;
    assign _4043 = _4040 & _4042;
    assign _4044 = _4043 ? _1260 : _2220;
    assign _4045 = _2915 ? _4044 : _2220;
    assign _170 = _4045;
    always @(posedge _276) begin
        if (_274)
            _2220 <= _1282;
        else
            _2220 <= _170;
    end
    assign _2221 = _2220[1:0];
    assign _2223 = _2221 == _1394;
    assign _2224 = ~ _2223;
    assign _2230 = _2224 & _2229;
    assign _2682 = ~ _2230;
    assign _2683 = _2682 & g_data_left;
    assign _2686 = _2683 & _2685;
    assign _2213 = ~ _2207;
    assign _2214 = _2210 & _2213;
    always @(posedge _276) begin
        if (_274)
            _2210 <= _1066;
        else
            _2210 <= _2207;
    end
    assign _2211 = ~ _2210;
    assign _2203 = _303[7:7];
    assign _2202 = _303[6:6];
    assign _2201 = _303[5:5];
    assign _2200 = _303[4:4];
    assign _2199 = _303[3:3];
    assign _2198 = _303[2:2];
    assign _2197 = _303[1:1];
    assign _2196 = _303[0:0];
    assign _2195 = _2114[2:0];
    always @* begin
        case (_2195)
        0:
            _2204 <= _2196;
        1:
            _2204 <= _2197;
        2:
            _2204 <= _2198;
        3:
            _2204 <= _2199;
        4:
            _2204 <= _2200;
        5:
            _2204 <= _2201;
        6:
            _2204 <= _2202;
        default:
            _2204 <= _2203;
        endcase
    end
    always @(posedge _276) begin
        if (_274)
            _2207 <= _1066;
        else
            _2207 <= _2204;
    end
    assign _2212 = _2207 & _2211;
    assign _2194 = _2108[2:2];
    assign _2215 = _2194 ? _2214 : _2212;
    assign _2281 = _2188 == _1173;
    assign _2279 = _2146 == _1173;
    assign _2180 = ~ _2136;
    assign _2171 = _2154[15:2];
    assign _2172 = { _1394,
                     _2171 };
    assign _2168 = _2154[15:1];
    assign _2169 = { _1066,
                     _2168 };
    assign _2173 = _2169 + _2172;
    assign _2165 = _2154[15:1];
    assign _2166 = { _1066,
                     _2165 };
    assign _2163 = _2109 & _2139;
    assign _2174 = _2163 ? _2173 : _2166;
    always @(posedge _276) begin
        if (_274)
            _2177 <= _1173;
        else
            _2177 <= _2174;
    end
    assign _2178 = _2146 < _2177;
    assign _2155 = _2154[15:2];
    assign _2156 = { _1394,
                     _2155 };
    always @(posedge _276) begin
        if (_274)
            _2159 <= _1173;
        else
            _2159 <= _2156;
    end
    assign _4130 = ~ _2136;
    assign _4131 = _2179 & _4130;
    assign _4132 = _4131 ? _2188 : _2146;
    assign _4134 = _2142 ? _1173 : _4132;
    assign _4136 = _4134 + _5164;
    assign _4114 = _4108 == _1133;
    assign _2184 = _2154[15:1];
    assign _2185 = { _1066,
                     _2184 };
    always @(posedge _276) begin
        if (_274)
            _2188 <= _1173;
        else
            _2188 <= _2185;
    end
    assign _4110 = { gnd,
                     _2188 };
    assign _4111 = _4110 == _4108;
    assign _4104 = { gnd,
                     _2154 };
    always @(posedge _276) begin
        if (_274)
            _4107 <= _1133;
        else
            _4107 <= _4104;
    end
    assign _4099 = 17'b00000000000000001;
    assign _4053 = _217[0:0];
    assign _4054 = ~ _4053;
    assign _4049 = _1330[4:0];
    assign _4051 = _4049 == _5514;
    assign _4046 = _1330[5:5];
    assign _4048 = _4046 == _1066;
    assign _4052 = _4048 & _4051;
    assign _4055 = _4052 & _4054;
    assign _4056 = _4055 ? _1260 : _2153;
    assign _4057 = _2915 ? _4056 : _2153;
    assign _171 = _4057;
    always @(posedge _276) begin
        if (_274)
            _2153 <= _1282;
        else
            _2153 <= _171;
    end
    assign _4065 = _217[0:0];
    assign _4066 = ~ _4065;
    assign _4062 = 5'b00001;
    assign _4061 = _1330[4:0];
    assign _4063 = _4061 == _4062;
    assign _4058 = _1330[5:5];
    assign _4060 = _4058 == _1066;
    assign _4064 = _4060 & _4063;
    assign _4067 = _4064 & _4066;
    assign _4068 = _4067 ? _1260 : _2150;
    assign _4069 = _2915 ? _4068 : _2150;
    assign _172 = _4069;
    always @(posedge _276) begin
        if (_274)
            _2150 <= _1282;
        else
            _2150 <= _172;
    end
    assign _2154 = { _2150,
                     _2153 };
    assign _4098 = { gnd,
                     _2154 };
    assign _4100 = _4098 - _4099;
    always @(posedge _276) begin
        if (_274)
            _4103 <= _1133;
        else
            _4103 <= _4100;
    end
    assign _4080 = _217[0:0];
    assign _4081 = ~ _4080;
    assign _4077 = 5'b00010;
    assign _4076 = _1330[4:0];
    assign _4078 = _4076 == _4077;
    assign _4073 = _1330[5:5];
    assign _4075 = _4073 == _1066;
    assign _4079 = _4075 & _4078;
    assign _4082 = _4079 & _4081;
    assign _4083 = _4082 ? _1260 : _4072;
    assign _4084 = _2915 ? _4083 : _4072;
    assign _173 = _4084;
    always @(posedge _276) begin
        if (_274)
            _4072 <= _1282;
        else
            _4072 <= _173;
    end
    assign _4118 = { gnd,
                     _4072 };
    assign _4120 = _4119[7:0];
    assign _4121 = _4116 ? _4120 : _4092;
    assign _4122 = _4089 ? _4121 : _4092;
    assign _4124 = _2731 ? _1282 : _4122;
    assign _174 = _4124;
    always @(posedge _276) begin
        if (_274)
            _4092 <= _1282;
        else
            _4092 <= _174;
    end
    assign _4117 = { gnd,
                     _4092 };
    assign _4119 = _4117 + _4118;
    assign _4125 = _4119[8:8];
    assign _4126 = _4116 ? _4125 : _4097;
    assign _4127 = _4089 ? _4126 : _4097;
    assign _4129 = _2731 ? _1066 : _4127;
    assign _175 = _4129;
    always @(posedge _276) begin
        if (_274)
            _4097 <= _1066;
        else
            _4097 <= _175;
    end
    assign _4108 = _4097 ? _4107 : _4103;
    assign _4094 = { gnd,
                     _2146 };
    assign _4109 = _4094 == _4108;
    assign _4112 = _2181 ? _4111 : _4109;
    assign _4115 = _2142 ? _4114 : _4112;
    assign _4093 = ~ _2111;
    assign _4116 = _4093 & _4115;
    assign _4138 = _4116 ? _1173 : _4136;
    assign _4088 = ~ _2111;
    assign _4086 = _2136 & _2134;
    assign _612 = g_mode_0 == _1332;
    assign _4085 = _2105 | _612;
    assign _4087 = _4085 | _4086;
    assign _4089 = _4087 & _4088;
    assign _4139 = _4089 ? _4138 : _2146;
    assign _4141 = _2731 ? _1173 : _4139;
    assign _176 = _4141;
    always @(posedge _276) begin
        if (_274)
            _2146 <= _1173;
        else
            _2146 <= _176;
    end
    assign _2160 = _2146 < _2159;
    assign _2161 = ~ _2160;
    assign _2143 = _2134 & _2139;
    assign _2162 = _2143 & _2161;
    assign _2179 = _2162 & _2178;
    assign _2181 = _2179 & _2180;
    assign _2282 = _2181 ? _2281 : _2279;
    assign _2137 = _2108[4:3];
    assign _2139 = _2137 == _1274;
    assign _2140 = ~ _2139;
    assign _2136 = g_mode_0 == _1273;
    assign _2141 = _2136 | _2140;
    assign _2133 = ~ _2111;
    always @(posedge _276) begin
        if (_274)
            _2130 <= _1066;
        else
            _2130 <= _2127;
    end
    assign _2123 = _303[7:7];
    assign _2122 = _303[6:6];
    assign _2121 = _303[5:5];
    assign _2120 = _303[4:4];
    assign _2119 = _303[3:3];
    assign _2118 = _303[2:2];
    assign _2117 = _303[1:1];
    assign _2116 = _303[0:0];
    assign _4149 = _217[0:0];
    assign _4150 = ~ _4149;
    assign _4146 = 5'b00100;
    assign _4145 = _1330[4:0];
    assign _4147 = _4145 == _4146;
    assign _4142 = _1330[5:5];
    assign _4144 = _4142 == _1066;
    assign _4148 = _4144 & _4147;
    assign _4151 = _4148 & _4150;
    assign _4152 = _4151 ? _1260 : _2114;
    assign _4153 = _2915 ? _4152 : _2114;
    assign _177 = _4153;
    always @(posedge _276) begin
        if (_274)
            _2114 <= _1282;
        else
            _2114 <= _177;
    end
    assign _2115 = _2114[5:3];
    always @* begin
        case (_2115)
        0:
            _2124 <= _2116;
        1:
            _2124 <= _2117;
        2:
            _2124 <= _2118;
        3:
            _2124 <= _2119;
        4:
            _2124 <= _2120;
        5:
            _2124 <= _2121;
        6:
            _2124 <= _2122;
        default:
            _2124 <= _2123;
        endcase
    end
    always @(posedge _276) begin
        if (_274)
            _2127 <= _1066;
        else
            _2127 <= _2124;
    end
    assign _2131 = _2127 ^ _2130;
    assign _2132 = _2109 & _2131;
    assign _2134 = _2132 & _2133;
    assign _2142 = _2134 & _2141;
    assign _2283 = _2142 ? vdd : _2282;
    assign _2111 = _2108[1:1];
    assign _2284 = _2111 ? _2215 : _2283;
    assign _2276 = ~ _2109;
    assign _2277 = _2105 & _2276;
    assign _2285 = _2277 & _2284;
    assign _2687 = _2285 & _2686;
    assign _2689 = _2687 & _2688;
    assign _2698 = _2689 | _2697;
    assign _2679 = _2675 == _1274;
    assign _2677 = _2675 == _1273;
    assign _2680 = _2677 | _2679;
    assign _4154 = _1393 & _2680;
    assign _4155 = _4154 | _2698;
    assign _178 = _4155;
    assign _4157 = _178 & _4156;
    assign _4160 = _4157 ? _4159 : _3416;
    assign _179 = _4160;
    always @(posedge _276) begin
        if (_274)
            _3416 <= _1074;
        else
            _3416 <= _179;
    end
    always @* begin
        case (_3416)
        0:
            _3477 <= _3434;
        1:
            _3477 <= _3440;
        2:
            _3477 <= _3446;
        3:
            _3477 <= _3452;
        4:
            _3477 <= _3458;
        5:
            _3477 <= _3464;
        6:
            _3477 <= _3470;
        default:
            _3477 <= _3476;
        endcase
    end
    assign _3536 = _595 ? _1280 : _3477;
    assign _3571 = g_byte_0[7:1];
    assign _3572 = { _2803,
                     _3571 };
    assign _3569 = g_byte_0[6:0];
    assign _3570 = { _3569,
                     _2803 };
    assign _3573 = _3531 ? _3572 : _3570;
    assign _4165 = _2506 ? _3573 : _4164;
    assign _4166 = _2493 ? _4165 : _4164;
    assign _4167 = _2471 ? _4166 : _4164;
    assign _4168 = _2812 ? _4164 : _4167;
    assign _4161 = g_data_left_0 ? _3537 : g_byte_0;
    assign _4162 = _2470 ? g_byte_0 : _4161;
    assign _4163 = _2533 ? _4162 : g_byte_0;
    assign _4164 = _2525 ? _4163 : g_byte_0;
    assign _4169 = _2457 ? _4168 : _4164;
    assign _180 = _4169;
    always @(posedge _276) begin
        if (_274)
            g_byte_0 <= _1282;
        else
            g_byte_0 <= _180;
    end
    assign _2693 = g_bitpos_0 == _1074;
    assign _2690 = ~ _2470;
    assign _2691 = _2690 & g_data_left_0;
    assign _2694 = _2691 & _2693;
    assign _3537 = _2694 ? _3536 : g_byte_0;
    assign _3538 = _3537[0:0];
    assign _3546 = { _3538,
                     _3539,
                     _3540,
                     _3541,
                     _3542,
                     _3543,
                     _3544,
                     _3545 };
    assign _3531 = _2348[5:5];
    assign _3547 = _3531 ? _3537 : _3546;
    assign _3548 = _3547[0:0];
    assign _4177 = g_bitpos_0 + _1693;
    assign _2498 = g_cnt_0[5:0];
    assign _2503 = _2498 < _2502;
    assign _2504 = ~ _2503;
    assign _2494 = g_cnt_0[15:6];
    assign _2496 = _2494 == _1078;
    assign _2497 = ~ _2496;
    assign _2505 = _2497 | _2504;
    assign _2506 = _2493 & _2505;
    assign _4178 = _2506 ? _4177 : _4175;
    assign _4179 = _2493 ? _4178 : _4175;
    assign _4180 = _2471 ? _4179 : _4175;
    assign _4181 = _2812 ? _4175 : _4180;
    assign _4171 = g_bitpos_0 + _1693;
    assign _4172 = g_data_left_0 ? _4171 : g_bitpos_0;
    assign _4173 = _2470 ? g_bitpos_0 : _4172;
    assign _4174 = _2533 ? _4173 : g_bitpos_0;
    assign _4175 = _2525 ? _4174 : g_bitpos_0;
    assign _4182 = _2457 ? _4181 : _4175;
    assign _4184 = _2776 ? _1074 : _4182;
    assign _181 = _4184;
    always @(posedge _276) begin
        if (_274)
            g_bitpos_0 <= _1074;
        else
            g_bitpos_0 <= _181;
    end
    always @* begin
        case (g_bitpos_0)
        0:
            _3556 <= _3548;
        1:
            _3556 <= _3549;
        2:
            _3556 <= _3550;
        3:
            _3556 <= _3551;
        4:
            _3556 <= _3552;
        5:
            _3556 <= _3553;
        6:
            _3556 <= _3554;
        default:
            _3556 <= _3555;
        endcase
    end
    assign _3187 = _2348[7:7];
    assign _4195 = _217[1:1];
    assign _4196 = ~ _4195;
    assign _4191 = _1330[4:0];
    assign _4193 = _4191 == _3753;
    assign _4188 = _1330[5:5];
    assign _4190 = _4188 == _2703;
    assign _4194 = _4190 & _4193;
    assign _4197 = _4194 & _4196;
    assign _4198 = _4197 ? _1260 : _4187;
    assign _4199 = _2915 ? _4198 : _4187;
    assign _182 = _4199;
    always @(posedge _276) begin
        if (_274)
            _4187 <= _1282;
        else
            _4187 <= _182;
    end
    assign _4210 = _217[1:1];
    assign _4211 = ~ _4210;
    assign _4206 = _1330[4:0];
    assign _4208 = _4206 == _3768;
    assign _4203 = _1330[5:5];
    assign _4205 = _4203 == _2703;
    assign _4209 = _4205 & _4208;
    assign _4212 = _4209 & _4211;
    assign _4213 = _4212 ? _1260 : _4202;
    assign _4214 = _2915 ? _4213 : _4202;
    assign _183 = _4214;
    always @(posedge _276) begin
        if (_274)
            _4202 <= _1282;
        else
            _4202 <= _183;
    end
    assign _4225 = _217[1:1];
    assign _4226 = ~ _4225;
    assign _4221 = _1330[4:0];
    assign _4223 = _4221 == _3783;
    assign _4218 = _1330[5:5];
    assign _4220 = _4218 == _2703;
    assign _4224 = _4220 & _4223;
    assign _4227 = _4224 & _4226;
    assign _4228 = _4227 ? _1260 : _4217;
    assign _4229 = _2915 ? _4228 : _4217;
    assign _184 = _4229;
    always @(posedge _276) begin
        if (_274)
            _4217 <= _1282;
        else
            _4217 <= _184;
    end
    assign _4240 = _217[1:1];
    assign _4241 = ~ _4240;
    assign _4236 = _1330[4:0];
    assign _4238 = _4236 == _3798;
    assign _4233 = _1330[5:5];
    assign _4235 = _4233 == _2703;
    assign _4239 = _4235 & _4238;
    assign _4242 = _4239 & _4241;
    assign _4243 = _4242 ? _1260 : _4232;
    assign _4244 = _2915 ? _4243 : _4232;
    assign _185 = _4244;
    always @(posedge _276) begin
        if (_274)
            _4232 <= _1282;
        else
            _4232 <= _185;
    end
    assign _4385 = { _4232,
                     _4217,
                     _4202,
                     _4187 };
    assign _4378 = g_crc_0[30:0];
    assign _4380 = { _4378,
                     _1066 };
    assign _4371 = g_crc_0[31:31];
    assign _4372 = _2803 ^ _4371;
    assign _4374 = _4372 ? _4347 : _1249;
    assign _4368 = g_crc_0[30:0];
    assign _4370 = { _4368,
                     _1066 };
    assign _4375 = _4370 ^ _4374;
    assign _4360 = g_cnt_0[5:0];
    assign _4365 = _4360 < _4364;
    assign _4366 = ~ _4365;
    assign _4355 = g_cnt_0[15:6];
    assign _4357 = _4355 == _1078;
    assign _4358 = ~ _4357;
    assign _4354 = ~ _3093;
    assign _4359 = _4354 | _4358;
    assign _4367 = _4359 | _4366;
    assign _4376 = _4367 ? _4375 : _4353;
    assign _4377 = _2493 ? _4376 : _4353;
    assign _4255 = _217[1:1];
    assign _4256 = ~ _4255;
    assign _4251 = _1330[4:0];
    assign _4253 = _4251 == _3837;
    assign _4248 = _1330[5:5];
    assign _4250 = _4248 == _2703;
    assign _4254 = _4250 & _4253;
    assign _4257 = _4254 & _4256;
    assign _4258 = _4257 ? _1260 : _4247;
    assign _4259 = _2915 ? _4258 : _4247;
    assign _186 = _4259;
    always @(posedge _276) begin
        if (_274)
            _4247 <= _1282;
        else
            _4247 <= _186;
    end
    assign _4274 = _4247[5:0];
    assign _4269 = g_left_0 - _3206;
    assign _4270 = _3182 ? _4269 : _4267;
    assign _4271 = _2471 ? _4270 : _4267;
    assign _4272 = _2812 ? _4267 : _4271;
    assign _4263 = g_left_0 - _3206;
    assign _4264 = g_data_left_0 ? g_left_0 : _4263;
    assign _4265 = _2470 ? g_left_0 : _4264;
    assign _4266 = _2533 ? _4265 : g_left_0;
    assign _4267 = _2525 ? _4266 : g_left_0;
    assign _4273 = _2457 ? _4272 : _4267;
    assign _4275 = _4261 ? _4274 : _4273;
    assign _4277 = _2776 ? _1201 : _4275;
    assign _187 = _4277;
    always @(posedge _276) begin
        if (_274)
            g_left_0 <= _1201;
        else
            g_left_0 <= _187;
    end
    assign _2531 = g_left_0 == _1201;
    assign _2532 = ~ _2531;
    assign _3180 = ~ g_data_left_0;
    assign _3179 = _2457 & _2471;
    assign _3181 = _3179 & _3180;
    assign _3182 = _3181 & _2532;
    assign _4381 = _3182 ? _4380 : _4377;
    assign _4382 = _2471 ? _4381 : _4353;
    assign _4383 = _2812 ? _4353 : _4382;
    assign _4288 = _217[1:1];
    assign _4289 = ~ _4288;
    assign _4284 = _1330[4:0];
    assign _4286 = _4284 == _3870;
    assign _4281 = _1330[5:5];
    assign _4283 = _4281 == _2703;
    assign _4287 = _4283 & _4286;
    assign _4290 = _4287 & _4289;
    assign _4291 = _4290 ? _1260 : _4280;
    assign _4292 = _2915 ? _4291 : _4280;
    assign _188 = _4292;
    always @(posedge _276) begin
        if (_274)
            _4280 <= _1282;
        else
            _4280 <= _188;
    end
    assign _4303 = _217[1:1];
    assign _4304 = ~ _4303;
    assign _4299 = _1330[4:0];
    assign _4301 = _4299 == _3885;
    assign _4296 = _1330[5:5];
    assign _4298 = _4296 == _2703;
    assign _4302 = _4298 & _4301;
    assign _4305 = _4302 & _4304;
    assign _4306 = _4305 ? _1260 : _4295;
    assign _4307 = _2915 ? _4306 : _4295;
    assign _189 = _4307;
    always @(posedge _276) begin
        if (_274)
            _4295 <= _1282;
        else
            _4295 <= _189;
    end
    assign _4318 = _217[1:1];
    assign _4319 = ~ _4318;
    assign _4314 = _1330[4:0];
    assign _4316 = _4314 == _3900;
    assign _4311 = _1330[5:5];
    assign _4313 = _4311 == _2703;
    assign _4317 = _4313 & _4316;
    assign _4320 = _4317 & _4319;
    assign _4321 = _4320 ? _1260 : _4310;
    assign _4322 = _2915 ? _4321 : _4310;
    assign _190 = _4322;
    always @(posedge _276) begin
        if (_274)
            _4310 <= _1282;
        else
            _4310 <= _190;
    end
    assign _4333 = _217[1:1];
    assign _4334 = ~ _4333;
    assign _4329 = _1330[4:0];
    assign _4331 = _4329 == _3915;
    assign _4326 = _1330[5:5];
    assign _4328 = _4326 == _2703;
    assign _4332 = _4328 & _4331;
    assign _4335 = _4332 & _4334;
    assign _4336 = _4335 ? _1260 : _4325;
    assign _4337 = _2915 ? _4336 : _4325;
    assign _191 = _4337;
    always @(posedge _276) begin
        if (_274)
            _4325 <= _1282;
        else
            _4325 <= _191;
    end
    assign _4347 = { _4325,
                     _4310,
                     _4295,
                     _4280 };
    assign _4344 = g_crc_0[31:31];
    assign _4345 = _3558 ^ _4344;
    assign _4348 = _4345 ? _4347 : _1249;
    assign _4341 = g_crc_0[30:0];
    assign _4343 = { _4341,
                     _1066 };
    assign _4349 = _4343 ^ _4348;
    assign _4338 = g_crc_0[30:0];
    assign _4340 = { _4338,
                     _1066 };
    assign _4350 = g_data_left_0 ? _4349 : _4340;
    assign _4351 = _2470 ? g_crc_0 : _4350;
    assign _4352 = _2533 ? _4351 : g_crc_0;
    assign _4353 = _2525 ? _4352 : g_crc_0;
    assign _4384 = _2457 ? _4383 : _4353;
    assign _4386 = _2776 ? _4385 : _4384;
    assign _4388 = _2559 ? _1249 : _4386;
    assign _192 = _4388;
    always @(posedge _276) begin
        if (_274)
            g_crc_0 <= _1249;
        else
            g_crc_0 <= _192;
    end
    assign _3186 = g_crc_0[31:31];
    assign _3188 = _3186 ^ _3187;
    assign _4408 = _4407 ? _4405 : g_lim_0;
    assign _4409 = g_len_cap_0 ? _4408 : g_lim_0;
    assign _193 = _4409;
    always @(posedge _276) begin
        if (_274)
            g_lim_0 <= _1282;
        else
            g_lim_0 <= _193;
    end
    assign _2490 = { _1282,
                     g_lim_0 };
    assign _4417 = _217[1:1];
    assign _4418 = ~ _4417;
    assign _4413 = _1330[4:0];
    assign _4415 = _4413 == _3656;
    assign _4410 = _1330[5:5];
    assign _4412 = _4410 == _2703;
    assign _4416 = _4412 & _4415;
    assign _4419 = _4416 & _4418;
    assign _4420 = _4419 ? _1260 : _2484;
    assign _4421 = _2915 ? _4420 : _2484;
    assign _194 = _4421;
    always @(posedge _276) begin
        if (_274)
            _2484 <= _1282;
        else
            _2484 <= _194;
    end
    assign _4429 = _217[1:1];
    assign _4430 = ~ _4429;
    assign _4425 = _1330[4:0];
    assign _4427 = _4425 == _3668;
    assign _4422 = _1330[5:5];
    assign _4424 = _4422 == _2703;
    assign _4428 = _4424 & _4427;
    assign _4431 = _4428 & _4430;
    assign _4432 = _4431 ? _1260 : _2481;
    assign _4433 = _2915 ? _4432 : _2481;
    assign _195 = _4433;
    always @(posedge _276) begin
        if (_274)
            _2481 <= _1282;
        else
            _2481 <= _195;
    end
    assign _2485 = { _2481,
                     _2484 };
    assign _3098 = g_sr_0[14:0];
    assign _3099 = { _3098,
                     _2803 };
    assign _4434 = _2471 ? _3099 : g_sr_0;
    assign _4435 = _2812 ? g_sr_0 : _4434;
    assign _4436 = _2457 ? _4435 : g_sr_0;
    assign _4438 = _2776 ? _1173 : _4436;
    assign _196 = _4438;
    always @(posedge _276) begin
        if (_274)
            g_sr_0 <= _1173;
        else
            g_sr_0 <= _196;
    end
    assign _4400 = g_sr_0[3:0];
    assign _4446 = _217[1:1];
    assign _4447 = ~ _4446;
    assign _4442 = _1330[4:0];
    assign _4444 = _4442 == _3685;
    assign _4439 = _1330[5:5];
    assign _4441 = _4439 == _2703;
    assign _4445 = _4441 & _4444;
    assign _4448 = _4445 & _4447;
    assign _4449 = _4448 ? _1260 : _4398;
    assign _4450 = _2915 ? _4449 : _4398;
    assign _197 = _4450;
    always @(posedge _276) begin
        if (_274)
            _4398 <= _1282;
        else
            _4398 <= _197;
    end
    assign _4399 = _4398[3:0];
    assign _4401 = _4399 < _4400;
    assign _4402 = _4401 ? _4399 : _4400;
    assign _4404 = { _1066,
                     _4402,
                     _1074 };
    assign _2502 = _2501[5:0];
    assign _4394 = { _1394,
                     _2502 };
    assign _4405 = _4394 + _4404;
    assign _4406 = { _1282,
                     _4405 };
    assign _4407 = _4406 < _2485;
    assign _4496 = _4407 ? _2703 : g_len_known_0;
    assign _4458 = _217[1:1];
    assign _4459 = ~ _4458;
    assign _4454 = _1330[4:0];
    assign _4456 = _4454 == _3810;
    assign _4451 = _1330[5:5];
    assign _4453 = _4451 == _2703;
    assign _4457 = _4453 & _4456;
    assign _4460 = _4457 & _4459;
    assign _4461 = _4460 ? _1260 : _4363;
    assign _4462 = _2915 ? _4461 : _4363;
    assign _198 = _4462;
    always @(posedge _276) begin
        if (_274)
            _4363 <= _1282;
        else
            _4363 <= _198;
    end
    assign _4364 = _4363[5:0];
    assign _4482 = g_cnt_0[5:0];
    assign _4483 = _4482 == _4364;
    assign _4478 = g_cnt_0[15:6];
    assign _4480 = _4478 == _1078;
    assign _3093 = _2501[6:6];
    assign _4476 = ~ _3093;
    assign _4470 = _217[1:1];
    assign _4471 = ~ _4470;
    assign _4466 = _1330[4:0];
    assign _4468 = _4466 == _3822;
    assign _4463 = _1330[5:5];
    assign _4465 = _4463 == _2703;
    assign _4469 = _4465 & _4468;
    assign _4472 = _4469 & _4471;
    assign _4473 = _4472 ? _1260 : _2501;
    assign _4474 = _2915 ? _4473 : _2501;
    assign _199 = _4474;
    always @(posedge _276) begin
        if (_274)
            _2501 <= _1282;
        else
            _2501 <= _199;
    end
    assign _4475 = _2501[7:7];
    assign _4477 = _4475 & _4476;
    assign _4481 = _4477 & _4480;
    assign _4484 = _4481 & _4483;
    assign _4486 = _4484 ? _2703 : g_len_cap_0;
    assign _4487 = _2493 ? _4486 : g_len_cap_0;
    assign _4488 = _2471 ? _4487 : g_len_cap_0;
    assign _4489 = _2812 ? g_len_cap_0 : _4488;
    assign _4490 = _2457 ? _4489 : g_len_cap_0;
    assign _4492 = g_len_cap_0 ? _1066 : _4490;
    assign _4494 = _2776 ? _1066 : _4492;
    assign _200 = _4494;
    always @(posedge _276) begin
        if (_274)
            g_len_cap_0 <= _1066;
        else
            g_len_cap_0 <= _200;
    end
    assign _4497 = g_len_cap_0 ? _4496 : g_len_known_0;
    assign _4499 = _2776 ? _1066 : _4497;
    assign _201 = _4499;
    always @(posedge _276) begin
        if (_274)
            g_len_known_0 <= _1066;
        else
            g_len_known_0 <= _201;
    end
    assign _2491 = g_len_known_0 ? _2490 : _2485;
    assign _4519 = g_cnt_0 + _5164;
    assign _2472 = _2457 & _2471;
    assign _2493 = _2472 & g_data_left_0;
    assign _4520 = _2493 ? _4519 : _4517;
    assign _2471 = ~ _2470;
    assign _4521 = _2471 ? _4520 : _4517;
    assign _4502 = _2812 ? _4501 : _2803;
    assign _4500 = _2533 ? _3558 : g_last_0;
    assign _4501 = _2525 ? _4500 : g_last_0;
    assign _4503 = _2457 ? _4502 : _4501;
    assign _4505 = _2776 ? _2703 : _4503;
    assign _202 = _4505;
    always @(posedge _276) begin
        if (_274)
            g_last_0 <= vdd;
        else
            g_last_0 <= _202;
    end
    assign _2808 = ~ g_last_0;
    assign _2805 = _2461 == _1273;
    assign _2809 = _2805 ? _2808 : gnd;
    assign _4507 = _2377 == _1273;
    assign _4508 = _4507 ? _2367 : g_prev_0;
    assign _4509 = _2457 ? _4508 : g_prev_0;
    assign _4511 = _2776 ? _2703 : _4509;
    assign _203 = _4511;
    always @(posedge _276) begin
        if (_274)
            g_prev_0 <= vdd;
        else
            g_prev_0 <= _203;
    end
    assign _2802 = _2367 == g_prev_0;
    assign _2799 = _2377 == _1273;
    assign _2803 = _2799 ? _2802 : _2367;
    assign _2810 = _2803 == _2809;
    assign _2811 = ~ _2810;
    assign _2812 = _2470 & _2811;
    assign _4522 = _2812 ? _4517 : _4521;
    assign _4513 = g_cnt_0 + _5164;
    assign _4514 = g_data_left_0 ? _4513 : g_cnt_0;
    assign _4515 = _2470 ? g_cnt_0 : _4514;
    assign _4516 = _2533 ? _4515 : g_cnt_0;
    assign _4517 = _2525 ? _4516 : g_cnt_0;
    assign _4523 = _2457 ? _4522 : _4517;
    assign _4525 = _2776 ? _1173 : _4523;
    assign _204 = _4525;
    always @(posedge _276) begin
        if (_274)
            g_cnt_0 <= _1173;
        else
            g_cnt_0 <= _204;
    end
    assign g_data_left_0 = g_cnt_0 < _2491;
    assign _3557 = g_data_left_0 ? _3556 : _3188;
    assign _3558 = _2470 ? _2809 : _3557;
    assign _4531 = _3558 == g_last_0;
    assign _4529 = g_run_0 == _1074;
    assign _4530 = ~ _4529;
    assign _4532 = _4530 & _4531;
    assign _4536 = _4532 ? _4535 : _1693;
    assign _4527 = _2461 == _1274;
    assign _4541 = _4527 ? _4540 : _4536;
    assign _4542 = _2533 ? _4541 : g_run_0;
    assign _4543 = _2525 ? _4542 : g_run_0;
    assign _4561 = _2457 ? _4560 : _4543;
    assign _4563 = _2776 ? _1074 : _4561;
    assign _205 = _4563;
    always @(posedge _276) begin
        if (_274)
            g_run_0 <= _1074;
        else
            g_run_0 <= _205;
    end
    assign _2469 = g_run_0 == _2468;
    assign _4571 = _217[1:1];
    assign _4572 = ~ _4571;
    assign _4567 = _1330[4:0];
    assign _4569 = _4567 == _4038;
    assign _4564 = _1330[5:5];
    assign _4566 = _4564 == _2703;
    assign _4570 = _4566 & _4569;
    assign _4573 = _4570 & _4572;
    assign _4574 = _4573 ? _1260 : _2460;
    assign _4575 = _2915 ? _4574 : _2460;
    assign _206 = _4575;
    always @(posedge _276) begin
        if (_274)
            _2460 <= _1282;
        else
            _2460 <= _206;
    end
    assign _2461 = _2460[1:0];
    assign _2463 = _2461 == _1394;
    assign _2464 = ~ _2463;
    assign _2470 = _2464 & _2469;
    assign _2526 = _2470 | g_data_left_0;
    assign _2533 = _2526 | _2532;
    assign _4589 = _2533 ? _4588 : _2703;
    assign _2516 = ~ _2349;
    assign _2517 = _2345 & _2516;
    assign _2525 = _2517 & _2524;
    assign _4590 = _2525 ? _4589 : f_lane1_out;
    assign _2521 = _2428 == _1173;
    assign _2519 = _2386 == _1173;
    assign _2522 = _2421 ? _2521 : _2519;
    assign _2523 = _2382 ? vdd : _2522;
    assign _2524 = _2351 ? _2455 : _2523;
    assign _4582 = ~ _2524;
    assign _4579 = _2377 == _1274;
    assign _4576 = ~ _2349;
    assign _4577 = _2345 & _4576;
    assign _4580 = _4577 & _4579;
    assign _4581 = _4580 & _2456;
    assign _4583 = _4581 & _4582;
    assign _4591 = _4583 ? _3530 : _4590;
    assign _4593 = _2790 ? _2703 : _4591;
    assign _4595 = _2514 ? _2703 : _4593;
    assign _4597 = _2776 ? _2703 : _4595;
    assign _4599 = _2559 ? _2703 : _4597;
    assign _207 = _4599;
    always @(posedge _276) begin
        if (_274)
            f_lane1_out <= vdd;
        else
            f_lane1_out <= _207;
    end
    assign _2788 = _2367 == f_lane1_out;
    assign _2789 = ~ _2788;
    assign _2784 = _2377 == _1274;
    assign _2785 = ~ _2784;
    assign _2781 = ~ _2351;
    assign _2779 = _2348[6:6];
    assign _2777 = ~ _2349;
    assign _2778 = _2345 & _2777;
    assign _2780 = _2778 & _2779;
    assign _2782 = _2780 & _2781;
    assign _2786 = _2782 & _2785;
    assign _2787 = _2786 & _2456;
    assign _2790 = _2787 & _2789;
    assign _4727 = _2790 ? _1394 : _4725;
    assign _2453 = ~ _2447;
    assign _2454 = _2450 & _2453;
    always @(posedge _276) begin
        if (_274)
            _2450 <= _1066;
        else
            _2450 <= _2447;
    end
    assign _2451 = ~ _2450;
    assign _2443 = _303[7:7];
    assign _2442 = _303[6:6];
    assign _2441 = _303[5:5];
    assign _2440 = _303[4:4];
    assign _2439 = _303[3:3];
    assign _2438 = _303[2:2];
    assign _2437 = _303[1:1];
    assign _2436 = _303[0:0];
    assign _2435 = _2354[2:0];
    always @* begin
        case (_2435)
        0:
            _2444 <= _2436;
        1:
            _2444 <= _2437;
        2:
            _2444 <= _2438;
        3:
            _2444 <= _2439;
        4:
            _2444 <= _2440;
        5:
            _2444 <= _2441;
        6:
            _2444 <= _2442;
        default:
            _2444 <= _2443;
        endcase
    end
    always @(posedge _276) begin
        if (_274)
            _2447 <= _1066;
        else
            _2447 <= _2444;
    end
    assign _2452 = _2447 & _2451;
    assign _2434 = _2348[2:2];
    assign _2455 = _2434 ? _2454 : _2452;
    assign _2432 = _2417 == _1173;
    assign _2429 = _2428 == _2417;
    assign _2422 = _2386 == _2417;
    assign _2420 = ~ _2376;
    assign _2411 = _2394[15:2];
    assign _2412 = { _1394,
                     _2411 };
    assign _2408 = _2394[15:1];
    assign _2409 = { _1066,
                     _2408 };
    assign _2413 = _2409 + _2412;
    assign _2405 = _2394[15:1];
    assign _2406 = { _1066,
                     _2405 };
    assign _2403 = _2349 & _2379;
    assign _2414 = _2403 ? _2413 : _2406;
    always @(posedge _276) begin
        if (_274)
            _2417 <= _1173;
        else
            _2417 <= _2414;
    end
    assign _2418 = _2386 < _2417;
    assign _2395 = _2394[15:2];
    assign _2396 = { _1394,
                     _2395 };
    always @(posedge _276) begin
        if (_274)
            _2399 <= _1173;
        else
            _2399 <= _2396;
    end
    assign _4684 = ~ _2376;
    assign _4685 = _2419 & _4684;
    assign _4686 = _4685 ? _2428 : _2386;
    assign _4688 = _2382 ? _1173 : _4686;
    assign _4690 = _4688 + _5164;
    assign _4668 = _4662 == _1133;
    assign _2424 = _2394[15:1];
    assign _2425 = { _1066,
                     _2424 };
    always @(posedge _276) begin
        if (_274)
            _2428 <= _1173;
        else
            _2428 <= _2425;
    end
    assign _4664 = { gnd,
                     _2428 };
    assign _4665 = _4664 == _4662;
    assign _4658 = { gnd,
                     _2394 };
    always @(posedge _276) begin
        if (_274)
            _4661 <= _1133;
        else
            _4661 <= _4658;
    end
    assign _4607 = _217[1:1];
    assign _4608 = ~ _4607;
    assign _4603 = _1330[4:0];
    assign _4605 = _4603 == _5514;
    assign _4600 = _1330[5:5];
    assign _4602 = _4600 == _2703;
    assign _4606 = _4602 & _4605;
    assign _4609 = _4606 & _4608;
    assign _4610 = _4609 ? _1260 : _2393;
    assign _4611 = _2915 ? _4610 : _2393;
    assign _208 = _4611;
    always @(posedge _276) begin
        if (_274)
            _2393 <= _1282;
        else
            _2393 <= _208;
    end
    assign _4619 = _217[1:1];
    assign _4620 = ~ _4619;
    assign _4615 = _1330[4:0];
    assign _4617 = _4615 == _4062;
    assign _4612 = _1330[5:5];
    assign _4614 = _4612 == _2703;
    assign _4618 = _4614 & _4617;
    assign _4621 = _4618 & _4620;
    assign _4622 = _4621 ? _1260 : _2390;
    assign _4623 = _2915 ? _4622 : _2390;
    assign _209 = _4623;
    always @(posedge _276) begin
        if (_274)
            _2390 <= _1282;
        else
            _2390 <= _209;
    end
    assign _2394 = { _2390,
                     _2393 };
    assign _4652 = { gnd,
                     _2394 };
    assign _4654 = _4652 - _4099;
    always @(posedge _276) begin
        if (_274)
            _4657 <= _1133;
        else
            _4657 <= _4654;
    end
    assign _4634 = _217[1:1];
    assign _4635 = ~ _4634;
    assign _4630 = _1330[4:0];
    assign _4632 = _4630 == _4077;
    assign _4627 = _1330[5:5];
    assign _4629 = _4627 == _2703;
    assign _4633 = _4629 & _4632;
    assign _4636 = _4633 & _4635;
    assign _4637 = _4636 ? _1260 : _4626;
    assign _4638 = _2915 ? _4637 : _4626;
    assign _210 = _4638;
    always @(posedge _276) begin
        if (_274)
            _4626 <= _1282;
        else
            _4626 <= _210;
    end
    assign _4672 = { gnd,
                     _4626 };
    assign _4674 = _4673[7:0];
    assign _4675 = _4670 ? _4674 : _4646;
    assign _4676 = _4643 ? _4675 : _4646;
    assign _4678 = _2776 ? _1282 : _4676;
    assign _211 = _4678;
    always @(posedge _276) begin
        if (_274)
            _4646 <= _1282;
        else
            _4646 <= _211;
    end
    assign _4671 = { gnd,
                     _4646 };
    assign _4673 = _4671 + _4672;
    assign _4679 = _4673[8:8];
    assign _4680 = _4670 ? _4679 : _4651;
    assign _4681 = _4643 ? _4680 : _4651;
    assign _4683 = _2776 ? _1066 : _4681;
    assign _212 = _4683;
    always @(posedge _276) begin
        if (_274)
            _4651 <= _1066;
        else
            _4651 <= _212;
    end
    assign _4662 = _4651 ? _4661 : _4657;
    assign _4648 = { gnd,
                     _2386 };
    assign _4663 = _4648 == _4662;
    assign _4666 = _2421 ? _4665 : _4663;
    assign _4669 = _2382 ? _4668 : _4666;
    assign _4647 = ~ _2351;
    assign _4670 = _4647 & _4669;
    assign _4692 = _4670 ? _1173 : _4690;
    assign _4642 = ~ _2351;
    assign _4640 = _2376 & _2374;
    assign _626 = g_mode == _1332;
    assign _4639 = _2345 | _626;
    assign _4641 = _4639 | _4640;
    assign _4643 = _4641 & _4642;
    assign _4693 = _4643 ? _4692 : _2386;
    assign _4695 = _2776 ? _1173 : _4693;
    assign _213 = _4695;
    always @(posedge _276) begin
        if (_274)
            _2386 <= _1173;
        else
            _2386 <= _213;
    end
    assign _2400 = _2386 < _2399;
    assign _2401 = ~ _2400;
    assign _2383 = _2374 & _2379;
    assign _2402 = _2383 & _2401;
    assign _2419 = _2402 & _2418;
    assign _2421 = _2419 & _2420;
    assign _2430 = _2421 ? _2429 : _2422;
    assign _2377 = _2348[4:3];
    assign _2379 = _2377 == _1274;
    assign _2380 = ~ _2379;
    assign _2381 = _2376 | _2380;
    assign _2373 = ~ _2351;
    always @(posedge _276) begin
        if (_274)
            _2370 <= _1066;
        else
            _2370 <= _2367;
    end
    assign _2363 = _303[7:7];
    assign _2362 = _303[6:6];
    assign _2361 = _303[5:5];
    assign _2360 = _303[4:4];
    assign _2359 = _303[3:3];
    assign _2358 = _303[2:2];
    assign _2357 = _303[1:1];
    assign _2356 = _303[0:0];
    assign _4703 = _217[1:1];
    assign _4704 = ~ _4703;
    assign _4699 = _1330[4:0];
    assign _4701 = _4699 == _4146;
    assign _4696 = _1330[5:5];
    assign _4698 = _4696 == _2703;
    assign _4702 = _4698 & _4701;
    assign _4705 = _4702 & _4704;
    assign _4706 = _4705 ? _1260 : _2354;
    assign _4707 = _2915 ? _4706 : _2354;
    assign _214 = _4707;
    always @(posedge _276) begin
        if (_274)
            _2354 <= _1282;
        else
            _2354 <= _214;
    end
    assign _2355 = _2354[5:3];
    always @* begin
        case (_2355)
        0:
            _2364 <= _2356;
        1:
            _2364 <= _2357;
        2:
            _2364 <= _2358;
        3:
            _2364 <= _2359;
        4:
            _2364 <= _2360;
        5:
            _2364 <= _2361;
        6:
            _2364 <= _2362;
        default:
            _2364 <= _2363;
        endcase
    end
    always @(posedge _276) begin
        if (_274)
            _2367 <= _1066;
        else
            _2367 <= _2364;
    end
    assign _2371 = _2367 ^ _2370;
    assign _2372 = _2349 & _2371;
    assign _2374 = _2372 & _2373;
    assign _2382 = _2374 & _2381;
    assign _2433 = _2382 ? _2432 : _2430;
    assign _2351 = _2348[1:1];
    assign _2456 = _2351 ? _2455 : _2433;
    assign _4715 = _217[1:1];
    assign _4716 = ~ _4715;
    assign _4712 = 5'b00011;
    assign _4711 = _1330[4:0];
    assign _4713 = _4711 == _4712;
    assign _4708 = _1330[5:5];
    assign _4710 = _4708 == _2703;
    assign _4714 = _4710 & _4713;
    assign _4717 = _4714 & _4716;
    assign _4718 = _4717 ? _1260 : _2348;
    assign _4719 = _2915 ? _4718 : _2348;
    assign _215 = _4719;
    always @(posedge _276) begin
        if (_274)
            _2348 <= _1282;
        else
            _2348 <= _215;
    end
    assign _2349 = _2348[0:0];
    assign _2345 = g_mode == _1274;
    assign _2350 = _2345 & _2349;
    assign _2457 = _2350 & _2456;
    assign _4779 = _2457 ? _4778 : _4727;
    assign _2514 = _219 == _1723;
    assign _4781 = _2514 ? _1394 : _4779;
    assign _4261 = _219 == _1729;
    assign _4788 = _4261 ? _4787 : _4781;
    assign _2776 = _219 == _1717;
    assign _4794 = _2776 ? _4793 : _4788;
    assign _2558 = _219 == _1359;
    assign _2559 = _2558 | _1389;
    assign _4796 = _2559 ? _1394 : _4794;
    assign _216 = _4796;
    always @(posedge _276) begin
        if (_274)
            g_mode <= _1394;
        else
            g_mode <= _216;
    end
    assign _2376 = g_mode == _1273;
    assign _2870 = _2376 | _2345;
    assign _4797 = { _2870,
                     _2867 };
    assign _217 = _4797;
    assign _4805 = _217[0:0];
    assign _4806 = ~ _4805;
    assign _4801 = _1330[4:0];
    assign _4803 = _4801 == _4712;
    assign _4798 = _1330[5:5];
    assign _4800 = _4798 == _1066;
    assign _4804 = _4800 & _4803;
    assign _4807 = _4804 & _4806;
    assign _4808 = _4807 ? _1260 : _2108;
    assign _2914 = _1244 == _1723;
    assign _2915 = _1243 & _2914;
    assign _4809 = _2915 ? _4808 : _2108;
    assign _218 = _4809;
    always @(posedge _276) begin
        if (_274)
            _2108 <= _1282;
        else
            _2108 <= _218;
    end
    assign _2109 = _2108[0:0];
    assign _2732 = ~ _2109;
    assign _2733 = _2105 & _2732;
    assign _2735 = _2733 & _2734;
    assign _2737 = _2735 & _2736;
    assign _2741 = _2737 & _2740;
    assign _2742 = _2741 & _2216;
    assign _2745 = _2742 & _2744;
    assign _4821 = _2745 ? _1394 : _4819;
    assign _4873 = _2217 ? _4872 : _4821;
    assign _2274 = _219 == _1699;
    assign _4875 = _2274 ? _1394 : _4873;
    assign _3846 = _219 == _1705;
    assign _4882 = _3846 ? _4881 : _4875;
    assign _2731 = _219 == _1693;
    assign _4888 = _2731 ? _4887 : _4882;
    assign _1430 = _711[90:88];
    assign _1429 = _705[90:88];
    assign _1428 = _699[90:88];
    assign _1427 = _299[90:88];
    always @* begin
        case (f_winner)
        0:
            _1431 <= _1427;
        1:
            _1431 <= _1428;
        2:
            _1431 <= _1429;
        default:
            _1431 <= _1430;
        endcase
    end
    assign _1423 = _711[87:87];
    assign _1422 = _705[87:87];
    assign _1421 = _699[87:87];
    assign _1420 = _299[87:87];
    always @* begin
        case (f_winner)
        0:
            _1424 <= _1420;
        1:
            _1424 <= _1421;
        2:
            _1424 <= _1422;
        default:
            _1424 <= _1423;
        endcase
    end
    assign _4810 = ~ _1424;
    assign _4811 = _1190 & _4810;
    assign _4813 = _4811 ? _1431 : _1074;
    assign _219 = _4813;
    assign _2315 = _219 == _1359;
    assign _2316 = _2315 | _1389;
    assign _4890 = _2316 ? _1394 : _4888;
    assign _220 = _4890;
    always @(posedge _276) begin
        if (_274)
            g_mode_0 <= _1394;
        else
            g_mode_0 <= _220;
    end
    assign _2105 = g_mode_0 == _1274;
    assign _2110 = _2105 & _2109;
    assign _2217 = _2110 & _2216;
    assign _2232 = _2217 & _2231;
    assign _2253 = _2232 & g_data_left;
    assign _2266 = _2253 & _2265;
    assign _2272 = _2266 & _2271;
    assign _2308 = _2272 | _2307;
    assign _3387 = _2308 | _2552;
    assign _4893 = _1260[5:0];
    assign _4892 = _2643 == _2721;
    assign _4894 = _4892 ? _4893 : _1193;
    assign _4895 = _2641 ? _4894 : _1193;
    assign _221 = _4895;
    always @(posedge _276) begin
        if (_274)
            _1193 <= _1201;
        else
            _1193 <= _221;
    end
    assign _2309 = _1193[3:3];
    assign _3388 = _2309 & _3387;
    assign _222 = _3388;
    assign _3425 = _222 | _3424;
    assign _3427 = _3425 & _3426;
    assign _4896 = _3427 ^ _4157;
    assign _4902 = _4896 ? _4901 : _223;
    always @(posedge _276) begin
        if (_274)
            _4905 <= _2726;
        else
            _4905 <= _4902;
    end
    assign _223 = _4905;
    assign _595 = _223 == _2726;
    assign _4907 = _595 ? _1280 : _3477;
    assign _2674 = _694[28:27];
    assign _2672 = _711[95:94];
    assign _2671 = _705[95:94];
    assign _2670 = _699[95:94];
    assign _2669 = _299[95:94];
    always @* begin
        case (f_winner)
        0:
            _2673 <= _2669;
        1:
            _2673 <= _2670;
        2:
            _2673 <= _2671;
        default:
            _2673 <= _2672;
        endcase
    end
    assign _2675 = _1392 ? _2674 : _2673;
    always @* begin
        case (_2675)
        0:
            _4919 <= _588;
        1:
            _4919 <= _4907;
        2:
            _4919 <= _4916;
        default:
            _4919 <= _4918;
        endcase
    end
    assign _4920 = _1393 ? _4919 : _588;
    assign _224 = _4920;
    always @(posedge _276) begin
        if (_274)
            _588 <= _1282;
        else
            _588 <= _224;
    end
    assign _589 = _588[0:0];
    assign _4931 = 8'b00001000;
    assign _4930 = 8'b00000111;
    assign _4929 = _583 - _2336;
    assign _4926 = _694[30:29];
    assign _711 = _298[511:400];
    assign _4924 = _711[99:98];
    assign _705 = _298[399:288];
    assign _4923 = _705[99:98];
    assign _4922 = _699[99:98];
    assign _4921 = _299[99:98];
    always @* begin
        case (f_winner)
        0:
            _4925 <= _4921;
        1:
            _4925 <= _4922;
        2:
            _4925 <= _4923;
        default:
            _4925 <= _4924;
        endcase
    end
    assign _4927 = _1392 ? _4926 : _4925;
    always @* begin
        case (_4927)
        0:
            _4932 <= _583;
        1:
            _4932 <= _4929;
        2:
            _4932 <= _4930;
        default:
            _4932 <= _4931;
        endcase
    end
    assign _4933 = _1393 ? _4932 : _583;
    assign _225 = _4933;
    always @(posedge _276) begin
        if (_274)
            _583 <= _1282;
        else
            _583 <= _225;
    end
    assign _585 = _583 == _1282;
    assign _816 = _699[61:58];
    always @* begin
        case (_816)
        0:
            _817 <= vdd;
        1:
            _817 <= _585;
        2:
            _817 <= _589;
        3:
            _817 <= _593;
        4:
            _817 <= _595;
        5:
            _817 <= _597;
        6:
            _817 <= _601;
        7:
            _817 <= _607;
        8:
            _817 <= _612;
        9:
            _817 <= _615;
        10:
            _817 <= _618;
        11:
            _817 <= _621;
        12:
            _817 <= _626;
        13:
            _817 <= _629;
        14:
            _817 <= _632;
        default:
            _817 <= _635;
        endcase
    end
    assign _819 = _817 ^ _818;
    assign _811 = _699[57:42];
    assign _813 = _811 == _1063;
    assign _802 = _748[57:42];
    assign _803 = { gnd,
                    _802 };
    assign _804 = _803 + _791;
    always @(posedge _276) begin
        if (_274)
            _807 <= _1133;
        else
            _807 <= _804;
    end
    assign _808 = _807 < _747;
    assign _809 = ~ _808;
    assign _798 = _699[41:26];
    assign _800 = _798 == _1173;
    assign _543 = _539 + _1693;
    assign _4948 = _539 + _1693;
    assign _4944 = _539 == _1729;
    assign _4945 = ~ _4944;
    assign _4942 = _319[0:0];
    assign _4946 = _4942 & _4945;
    assign _4949 = _4946 ? _4948 : _539;
    assign _4939 = _319[0:0];
    assign _4940 = ~ _4939;
    assign _4938 = f_chg_now[0:0];
    assign _4941 = _4938 & _4940;
    assign _4951 = _4941 ? _1693 : _4949;
    assign _4935 = _283 == _1274;
    assign _4937 = _4935 ? _1074 : _539;
    assign _4934 = _283 == _1273;
    assign _4952 = _4934 ? _4951 : _4937;
    assign _226 = _4952;
    always @(posedge _276) begin
        if (_274)
            _539 <= _1074;
        else
            _539 <= _226;
    end
    assign _541 = _539 == _1729;
    assign _544 = _541 ? _539 : _543;
    assign _534 = _319[0:0];
    assign _535 = ~ _534;
    assign _533 = f_chg_now[0:0];
    assign _536 = _533 & _535;
    assign _546 = _536 ? _1693 : _544;
    assign _530 = f_changed_all[0:0];
    assign _531 = f_in_fetch & _530;
    assign _547 = _531 ? _546 : _1074;
    assign _782 = _752[0:0];
    assign _784 = _782 ? _547 : _1074;
    assign _522 = _518 + _1693;
    assign _4967 = _518 + _1693;
    assign _4963 = _518 == _1729;
    assign _4964 = ~ _4963;
    assign _4961 = _319[1:1];
    assign _4965 = _4961 & _4964;
    assign _4968 = _4965 ? _4967 : _518;
    assign _4958 = _319[1:1];
    assign _4959 = ~ _4958;
    assign _4957 = f_chg_now[1:1];
    assign _4960 = _4957 & _4959;
    assign _4970 = _4960 ? _1693 : _4968;
    assign _4954 = _283 == _1274;
    assign _4956 = _4954 ? _1074 : _518;
    assign _4953 = _283 == _1273;
    assign _4971 = _4953 ? _4970 : _4956;
    assign _227 = _4971;
    always @(posedge _276) begin
        if (_274)
            _518 <= _1074;
        else
            _518 <= _227;
    end
    assign _520 = _518 == _1729;
    assign _523 = _520 ? _518 : _522;
    assign _513 = _319[1:1];
    assign _514 = ~ _513;
    assign _512 = f_chg_now[1:1];
    assign _515 = _512 & _514;
    assign _525 = _515 ? _1693 : _523;
    assign _509 = f_changed_all[1:1];
    assign _510 = f_in_fetch & _509;
    assign _526 = _510 ? _525 : _1074;
    assign _779 = _752[1:1];
    assign _781 = _779 ? _526 : _1074;
    assign _785 = _781 < _784;
    assign _786 = _785 ? _784 : _781;
    assign _499 = _495 + _1693;
    assign _4986 = _495 + _1693;
    assign _4982 = _495 == _1729;
    assign _4983 = ~ _4982;
    assign _4980 = _319[2:2];
    assign _4984 = _4980 & _4983;
    assign _4987 = _4984 ? _4986 : _495;
    assign _4977 = _319[2:2];
    assign _4978 = ~ _4977;
    assign _4976 = f_chg_now[2:2];
    assign _4979 = _4976 & _4978;
    assign _4989 = _4979 ? _1693 : _4987;
    assign _4973 = _283 == _1274;
    assign _4975 = _4973 ? _1074 : _495;
    assign _4972 = _283 == _1273;
    assign _4990 = _4972 ? _4989 : _4975;
    assign _228 = _4990;
    always @(posedge _276) begin
        if (_274)
            _495 <= _1074;
        else
            _495 <= _228;
    end
    assign _497 = _495 == _1729;
    assign _500 = _497 ? _495 : _499;
    assign _490 = _319[2:2];
    assign _491 = ~ _490;
    assign _489 = f_chg_now[2:2];
    assign _492 = _489 & _491;
    assign _502 = _492 ? _1693 : _500;
    assign _486 = f_changed_all[2:2];
    assign _487 = f_in_fetch & _486;
    assign _503 = _487 ? _502 : _1074;
    assign _774 = _752[2:2];
    assign _776 = _774 ? _503 : _1074;
    assign _478 = _474 + _1693;
    assign _5005 = _474 + _1693;
    assign _5001 = _474 == _1729;
    assign _5002 = ~ _5001;
    assign _4999 = _319[3:3];
    assign _5003 = _4999 & _5002;
    assign _5006 = _5003 ? _5005 : _474;
    assign _4996 = _319[3:3];
    assign _4997 = ~ _4996;
    assign _4995 = f_chg_now[3:3];
    assign _4998 = _4995 & _4997;
    assign _5008 = _4998 ? _1693 : _5006;
    assign _4992 = _283 == _1274;
    assign _4994 = _4992 ? _1074 : _474;
    assign _4991 = _283 == _1273;
    assign _5009 = _4991 ? _5008 : _4994;
    assign _229 = _5009;
    always @(posedge _276) begin
        if (_274)
            _474 <= _1074;
        else
            _474 <= _229;
    end
    assign _476 = _474 == _1729;
    assign _479 = _476 ? _474 : _478;
    assign _469 = _319[3:3];
    assign _470 = ~ _469;
    assign _468 = f_chg_now[3:3];
    assign _471 = _468 & _470;
    assign _481 = _471 ? _1693 : _479;
    assign _465 = f_changed_all[3:3];
    assign _466 = f_in_fetch & _465;
    assign _482 = _466 ? _481 : _1074;
    assign _771 = _752[3:3];
    assign _773 = _771 ? _482 : _1074;
    assign _777 = _773 < _776;
    assign _778 = _777 ? _776 : _773;
    assign _787 = _778 < _786;
    assign _788 = _787 ? _786 : _778;
    assign _453 = _449 + _1693;
    assign _5024 = _449 + _1693;
    assign _5020 = _449 == _1729;
    assign _5021 = ~ _5020;
    assign _5018 = _319[4:4];
    assign _5022 = _5018 & _5021;
    assign _5025 = _5022 ? _5024 : _449;
    assign _5015 = _319[4:4];
    assign _5016 = ~ _5015;
    assign _5014 = f_chg_now[4:4];
    assign _5017 = _5014 & _5016;
    assign _5027 = _5017 ? _1693 : _5025;
    assign _5011 = _283 == _1274;
    assign _5013 = _5011 ? _1074 : _449;
    assign _5010 = _283 == _1273;
    assign _5028 = _5010 ? _5027 : _5013;
    assign _230 = _5028;
    always @(posedge _276) begin
        if (_274)
            _449 <= _1074;
        else
            _449 <= _230;
    end
    assign _451 = _449 == _1729;
    assign _454 = _451 ? _449 : _453;
    assign _444 = _319[4:4];
    assign _445 = ~ _444;
    assign _443 = f_chg_now[4:4];
    assign _446 = _443 & _445;
    assign _456 = _446 ? _1693 : _454;
    assign _440 = f_changed_all[4:4];
    assign _441 = f_in_fetch & _440;
    assign _457 = _441 ? _456 : _1074;
    assign _764 = _752[4:4];
    assign _766 = _764 ? _457 : _1074;
    assign _432 = _428 + _1693;
    assign _5043 = _428 + _1693;
    assign _5039 = _428 == _1729;
    assign _5040 = ~ _5039;
    assign _5037 = _319[5:5];
    assign _5041 = _5037 & _5040;
    assign _5044 = _5041 ? _5043 : _428;
    assign _5034 = _319[5:5];
    assign _5035 = ~ _5034;
    assign _5033 = f_chg_now[5:5];
    assign _5036 = _5033 & _5035;
    assign _5046 = _5036 ? _1693 : _5044;
    assign _5030 = _283 == _1274;
    assign _5032 = _5030 ? _1074 : _428;
    assign _5029 = _283 == _1273;
    assign _5047 = _5029 ? _5046 : _5032;
    assign _231 = _5047;
    always @(posedge _276) begin
        if (_274)
            _428 <= _1074;
        else
            _428 <= _231;
    end
    assign _430 = _428 == _1729;
    assign _433 = _430 ? _428 : _432;
    assign _423 = _319[5:5];
    assign _424 = ~ _423;
    assign _422 = f_chg_now[5:5];
    assign _425 = _422 & _424;
    assign _435 = _425 ? _1693 : _433;
    assign _419 = f_changed_all[5:5];
    assign _420 = f_in_fetch & _419;
    assign _436 = _420 ? _435 : _1074;
    assign _761 = _752[5:5];
    assign _763 = _761 ? _436 : _1074;
    assign _767 = _763 < _766;
    assign _768 = _767 ? _766 : _763;
    assign _409 = _405 + _1693;
    assign _5062 = _405 + _1693;
    assign _5058 = _405 == _1729;
    assign _5059 = ~ _5058;
    assign _5056 = _319[6:6];
    assign _5060 = _5056 & _5059;
    assign _5063 = _5060 ? _5062 : _405;
    assign _5053 = _319[6:6];
    assign _5054 = ~ _5053;
    assign _5052 = f_chg_now[6:6];
    assign _5055 = _5052 & _5054;
    assign _5065 = _5055 ? _1693 : _5063;
    assign _5049 = _283 == _1274;
    assign _5051 = _5049 ? _1074 : _405;
    assign _5048 = _283 == _1273;
    assign _5066 = _5048 ? _5065 : _5051;
    assign _232 = _5066;
    always @(posedge _276) begin
        if (_274)
            _405 <= _1074;
        else
            _405 <= _232;
    end
    assign _407 = _405 == _1729;
    assign _410 = _407 ? _405 : _409;
    assign _400 = _319[6:6];
    assign _401 = ~ _400;
    assign _399 = f_chg_now[6:6];
    assign _402 = _399 & _401;
    assign _412 = _402 ? _1693 : _410;
    assign _396 = f_changed_all[6:6];
    assign _397 = f_in_fetch & _396;
    assign _413 = _397 ? _412 : _1074;
    assign _756 = _752[6:6];
    assign _758 = _756 ? _413 : _1074;
    assign _388 = _384 + _1693;
    assign _5081 = _384 + _1693;
    assign _5077 = _384 == _1729;
    assign _5078 = ~ _5077;
    assign _5075 = _319[7:7];
    assign _5079 = _5075 & _5078;
    assign _5082 = _5079 ? _5081 : _384;
    assign _5072 = _319[7:7];
    assign _5073 = ~ _5072;
    assign _5071 = f_chg_now[7:7];
    assign _5074 = _5071 & _5073;
    assign _5084 = _5074 ? _1693 : _5082;
    assign _5068 = _283 == _1274;
    assign _5070 = _5068 ? _1074 : _384;
    assign _5067 = _283 == _1273;
    assign _5085 = _5067 ? _5084 : _5070;
    assign _233 = _5085;
    always @(posedge _276) begin
        if (_274)
            _384 <= _1074;
        else
            _384 <= _233;
    end
    assign _386 = _384 == _1729;
    assign _389 = _386 ? _384 : _388;
    assign _379 = _319[7:7];
    assign _380 = ~ _379;
    assign _378 = f_chg_now[7:7];
    assign _381 = _378 & _380;
    assign _391 = _381 ? _1693 : _389;
    assign _375 = f_changed_all[7:7];
    assign _376 = f_in_fetch & _375;
    assign _392 = _376 ? _391 : _1074;
    assign _752 = _748[23:16];
    assign _753 = _752[7:7];
    assign _755 = _753 ? _392 : _1074;
    assign _759 = _755 < _758;
    assign _760 = _759 ? _758 : _755;
    assign _769 = _760 < _768;
    assign _770 = _769 ? _768 : _760;
    assign _789 = _770 < _788;
    assign _790 = _789 ? _788 : _770;
    assign _791 = { _1117,
                    _790 };
    assign _5088 = _350 == _1693;
    assign _5089 = _5088 ? _252 : _297;
    assign _5086 = _283 == _1273;
    assign _5090 = _5086 ? _5089 : _297;
    assign _234 = _5090;
    always @(posedge _276) begin
        if (_274)
            _297 <= _1348;
        else
            _297 <= _234;
    end
    assign _364 = _350 == _1693;
    assign _365 = f_in_fetch & _364;
    assign _366 = _365 ? _252 : _297;
    assign _5093 = _350 == _1699;
    assign _5094 = _5093 ? _252 : _294;
    assign _5091 = _283 == _1273;
    assign _5095 = _5091 ? _5094 : _294;
    assign _235 = _5095;
    always @(posedge _276) begin
        if (_274)
            _294 <= _1348;
        else
            _294 <= _235;
    end
    assign _360 = _350 == _1699;
    assign _361 = f_in_fetch & _360;
    assign _362 = _361 ? _252 : _294;
    assign _5098 = _350 == _1705;
    assign _5099 = _5098 ? _252 : _291;
    assign _5096 = _283 == _1273;
    assign _5100 = _5096 ? _5099 : _291;
    assign _236 = _5100;
    always @(posedge _276) begin
        if (_274)
            _291 <= _1348;
        else
            _291 <= _236;
    end
    assign _356 = _350 == _1705;
    assign _357 = f_in_fetch & _356;
    assign _358 = _357 ? _252 : _291;
    assign _352 = _350 == _1359;
    assign _353 = f_in_fetch & _352;
    assign _354 = _353 ? _252 : _288;
    assign _367 = { _354,
                    _358,
                    _362,
                    _366 };
    assign _748 = _367[287:176];
    assign _749 = _748[41:26];
    assign _750 = { gnd,
                    _749 };
    assign _792 = _750 + _791;
    always @(posedge _276) begin
        if (_274)
            _795 <= _1133;
        else
            _795 <= _792;
    end
    assign gnd = 1'b0;
    assign _747 = { gnd,
                    _744 };
    assign _796 = _747 < _795;
    assign _797 = ~ _796;
    assign _801 = _797 | _800;
    assign _810 = _801 & _809;
    assign _5128 = _340 + _5164;
    assign _5124 = _340 == _1063;
    assign _5125 = ~ _5124;
    assign _5126 = _5122 & _5125;
    assign _5129 = _5126 ? _5128 : _340;
    assign _5108 = _5107[2:2];
    assign _5109 = _1393 & _5108;
    assign _5131 = _5109 ? _1173 : _5129;
    assign _5133 = _1386 ? _1173 : _5131;
    assign _237 = _5133;
    always @(posedge _276) begin
        if (_274)
            _340 <= _1173;
        else
            _340 <= _237;
    end
    assign _5145 = _337 + _5164;
    assign _5141 = _337 == _1063;
    assign _5142 = ~ _5141;
    assign _5120 = 9'b111111111;
    assign _5121 = _5113 == _5120;
    assign _5118 = 6'b111111;
    assign _5117 = _5113[5:0];
    assign _5119 = _5117 == _5118;
    assign _5112 = 9'b000000000;
    assign _5134 = 9'b000000001;
    assign _5135 = _5113 + _5134;
    assign _5137 = _1386 ? _5112 : _5135;
    assign _238 = _5137;
    always @(posedge _276) begin
        if (_274)
            _5113 <= _5112;
        else
            _5113 <= _238;
    end
    assign _5114 = _5113[2:0];
    assign _5116 = _5114 == _1729;
    assign _5110 = _694[63:62];
    always @* begin
        case (_5110)
        0:
            _5122 <= vdd;
        1:
            _5122 <= _5116;
        2:
            _5122 <= _5119;
        default:
            _5122 <= _5121;
        endcase
    end
    assign _5143 = _5122 & _5142;
    assign _5146 = _5143 ? _5145 : _337;
    assign _5138 = _5107[1:1];
    assign _5139 = _1393 & _5138;
    assign _5148 = _5139 ? _1173 : _5146;
    assign _5150 = _1386 ? _1173 : _5148;
    assign _239 = _5150;
    always @(posedge _276) begin
        if (_274)
            _337 <= _1173;
        else
            _337 <= _239;
    end
    assign _743 = _699[25:24];
    always @* begin
        case (_743)
        0:
            _744 <= _334;
        1:
            _744 <= _337;
        2:
            _744 <= _340;
        default:
            _744 <= _340;
        endcase
    end
    assign _746 = _744 == _1063;
    assign _814 = _746 ? _813 : _810;
    always @(posedge _276) begin
        if (_274)
            _322 <= _1282;
        else
            _322 <= _306;
    end
    assign f_chg_now = _306 ^ _322;
    assign _5152 = _283 == _1274;
    assign _5154 = _5152 ? _1282 : _319;
    assign _5151 = _283 == _1273;
    assign _5155 = _5151 ? f_changed_all : _5154;
    assign _5157 = _1386 ? _1282 : _5155;
    assign _240 = _5157;
    always @(posedge _276) begin
        if (_274)
            _319 <= _1282;
        else
            _319 <= _240;
    end
    assign f_changed_all = _319 | f_chg_now;
    assign _737 = f_changed_all & f_chgmask1;
    assign _739 = _737 == _1282;
    assign _740 = ~ _739;
    assign f_chgmask1 = _699[23:16];
    assign _736 = f_chgmask1 == _1282;
    assign _741 = _736 | _740;
    assign _730 = _699[7:0];
    assign _728 = _699[15:8];
    assign _242 = pins_in;
    always @(posedge _276) begin
        if (_274)
            _303 <= _1282;
        else
            _303 <= _242;
    end
    always @(posedge _276) begin
        if (_274)
            _306 <= _1282;
        else
            _306 <= _303;
    end
    assign _729 = _306 ^ _728;
    assign _731 = _729 & _730;
    assign _733 = _731 == _1282;
    assign _699 = _298[287:176];
    assign f_valid1 = _699[111:111];
    assign _734 = f_valid1 & _733;
    assign _742 = _734 & _741;
    assign _815 = _742 & _814;
    assign _820 = _815 & _819;
    assign _859 = _820 & _858;
    assign _860 = f_in_eval & _859;
    assign _864 = _860 & _863;
    assign f_fire1 = _864 & _726;
    assign _1008 = f_fire1 ? _1273 : _1006;
    assign f_winner = f_fire0 ? _1394 : _1008;
    always @* begin
        case (f_winner)
        0:
            _5105 <= _5101;
        1:
            _5105 <= _5102;
        2:
            _5105 <= _5103;
        default:
            _5105 <= _5104;
        endcase
    end
    assign _5107 = _1392 ? _5106 : _5105;
    assign _5158 = _5107[0:0];
    assign _1391 = _350 == _1359;
    assign f_in_fetch = _283 == _1273;
    assign _1392 = f_in_fetch & _1391;
    assign _1393 = _1392 | _1190;
    assign _5159 = _1393 & _5158;
    assign _5168 = _5159 ? _1173 : _5166;
    assign _5170 = _1386 ? _1173 : _5168;
    assign _243 = _5170;
    always @(posedge _276) begin
        if (_274)
            _334 <= _1173;
        else
            _334 <= _243;
    end
    assign _1602 = _694[33:32];
    always @* begin
        case (_1602)
        0:
            _1603 <= _334;
        1:
            _1603 <= _337;
        2:
            _1603 <= _340;
        default:
            _1603 <= _340;
        endcase
    end
    assign _1601 = _694[49:34];
    assign _1604 = _1601 < _1603;
    assign _694 = _298[63:0];
    assign _1599 = _694[31:31];
    assign _1597 = ~ _1190;
    assign _1598 = f_in_eval & _1597;
    assign _1600 = _1598 & _1599;
    assign _1605 = _1600 & _1604;
    assign _1610 = _1605 & _1609;
    assign _1632 = _1610 | f_unexp_now;
    assign f_viol_now = _1632 | f_amb_now;
    assign _5176 = f_viol_now ? _5175 : _350;
    assign _5179 = _1190 ? _5178 : _5176;
    assign _5172 = _283 == _1274;
    assign _5180 = _5172 ? _5179 : _350;
    assign _5171 = _283 == _1273;
    assign _5183 = _5171 ? _5182 : _5180;
    assign _5185 = _1386 ? _1074 : _5183;
    assign _244 = _5185;
    always @(posedge _276) begin
        if (_274)
            _350 <= _1074;
        else
            _350 <= _244;
    end
    assign _5188 = _350 == _1359;
    assign _5189 = _5188 ? _252 : _288;
    assign _5186 = _283 == _1273;
    assign _5190 = _5186 ? _5189 : _288;
    assign _245 = _5190;
    always @(posedge _276) begin
        if (_274)
            _288 <= _1348;
        else
            _288 <= _245;
    end
    assign _298 = { _288,
                    _291,
                    _294,
                    _297 };
    assign _299 = _298[175:64];
    assign f_valid0 = _299[111:111];
    assign _313 = f_valid0 & _312;
    assign _330 = _313 & _329;
    assign _579 = _330 & _578;
    assign _639 = _579 & _638;
    assign _683 = _639 & _682;
    assign f_in_eval = _283 == _1274;
    assign _684 = f_in_eval & _683;
    assign _693 = _684 & _692;
    assign f_fire0 = _693 & _726;
    assign _1094 = f_fire0 | f_fire1;
    assign _1095 = _1094 | f_fire2;
    assign _1190 = _1095 | f_fire3;
    assign _5422 = _1190 ? _5421 : _5419;
    assign _5407 = _283 == _1332;
    assign _5409 = _5407 ? _1394 : _283;
    assign _5405 = _283 == _1274;
    assign _5423 = _5405 ? _5422 : _5409;
    assign _5404 = _283 == _1273;
    assign _5426 = _5404 ? _5425 : _5423;
    assign _5193 = _1260[1:1];
    assign _5192 = _2643 == _2726;
    assign _5194 = _5192 ? _5193 : _1066;
    assign _5195 = _2641 ? _5194 : _1066;
    assign _246 = _5195;
    always @(posedge _276) begin
        if (_274)
            _1389 <= _1066;
        else
            _1389 <= _246;
    end
    assign _5428 = _1389 ? _1394 : _5426;
    assign _5202 = _5201 ? _1260 : _5198;
    assign _5203 = _2714 ? _5202 : _5198;
    assign _247 = _5203;
    always @(posedge _276) begin
        if (_274)
            _5198 <= _1282;
        else
            _5198 <= _247;
    end
    assign _5210 = _5209 ? _1260 : _5206;
    assign _5211 = _2714 ? _5210 : _5206;
    assign _248 = _5211;
    always @(posedge _276) begin
        if (_274)
            _5206 <= _1282;
        else
            _5206 <= _248;
    end
    assign _5218 = _5217 ? _1260 : _5214;
    assign _5219 = _2714 ? _5218 : _5214;
    assign _249 = _5219;
    always @(posedge _276) begin
        if (_274)
            _5214 <= _1282;
        else
            _5214 <= _249;
    end
    assign _5226 = _5225 ? _1260 : _5222;
    assign _5227 = _2714 ? _5226 : _5222;
    assign _250 = _5227;
    always @(posedge _276) begin
        if (_274)
            _5222 <= _1282;
        else
            _5222 <= _250;
    end
    assign _5393 = { _5222,
                     _5214,
                     _5206,
                     _5198 };
    assign _5391 = 32'b11111111111111111111111111111111;
    assign _5342 = 32'b11101101101110001000001100100000;
    assign _5340 = _5334[31:1];
    assign _5341 = { _1066,
                     _5340 };
    assign _5343 = _5341 ^ _5342;
    assign _5337 = _5334[31:1];
    assign _5338 = { _1066,
                     _5337 };
    assign _5330 = _5324[31:1];
    assign _5331 = { _1066,
                     _5330 };
    assign _5333 = _5331 ^ _5342;
    assign _5327 = _5324[31:1];
    assign _5328 = { _1066,
                     _5327 };
    assign _5320 = _5314[31:1];
    assign _5321 = { _1066,
                     _5320 };
    assign _5323 = _5321 ^ _5342;
    assign _5317 = _5314[31:1];
    assign _5318 = { _1066,
                     _5317 };
    assign _5310 = _5304[31:1];
    assign _5311 = { _1066,
                     _5310 };
    assign _5313 = _5311 ^ _5342;
    assign _5307 = _5304[31:1];
    assign _5308 = { _1066,
                     _5307 };
    assign _5300 = _5294[31:1];
    assign _5301 = { _1066,
                     _5300 };
    assign _5303 = _5301 ^ _5342;
    assign _5297 = _5294[31:1];
    assign _5298 = { _1066,
                     _5297 };
    assign _5290 = _5284[31:1];
    assign _5291 = { _1066,
                     _5290 };
    assign _5293 = _5291 ^ _5342;
    assign _5287 = _5284[31:1];
    assign _5288 = { _1066,
                     _5287 };
    assign _5280 = _5274[31:1];
    assign _5281 = { _1066,
                     _5280 };
    assign _5283 = _5281 ^ _5342;
    assign _5277 = _5274[31:1];
    assign _5278 = { _1066,
                     _5277 };
    assign _5270 = _5264[31:1];
    assign _5271 = { _1066,
                     _5270 };
    assign _5273 = _5271 ^ _5342;
    assign _5267 = _5264[31:1];
    assign _5268 = { _1066,
                     _5267 };
    assign _5261 = _252[127:120];
    assign _5260 = _252[119:112];
    assign _5259 = _252[111:104];
    assign _5258 = _252[103:96];
    assign _5257 = _252[95:88];
    assign _5256 = _252[87:80];
    assign _5255 = _252[79:72];
    assign _5254 = _252[71:64];
    assign _5253 = _252[63:56];
    assign _5252 = _252[55:48];
    assign _5251 = _252[47:40];
    assign _5250 = _252[39:32];
    assign _5249 = _252[31:24];
    assign _5248 = _252[23:16];
    assign _5247 = _252[15:8];
    assign _252 = ram_rec_rdata;
    assign _5246 = _252[7:0];
    assign _5243 = 13'b0000000000001;
    assign _5244 = f_sw_cnt - _5243;
    assign _5245 = _5244[3:0];
    always @* begin
        case (_5245)
        0:
            _5262 <= _5246;
        1:
            _5262 <= _5247;
        2:
            _5262 <= _5248;
        3:
            _5262 <= _5249;
        4:
            _5262 <= _5250;
        5:
            _5262 <= _5251;
        6:
            _5262 <= _5252;
        7:
            _5262 <= _5253;
        8:
            _5262 <= _5254;
        9:
            _5262 <= _5255;
        10:
            _5262 <= _5256;
        11:
            _5262 <= _5257;
        12:
            _5262 <= _5258;
        13:
            _5262 <= _5259;
        14:
            _5262 <= _5260;
        default:
            _5262 <= _5261;
        endcase
    end
    assign _5263 = { _2827,
                     _5262 };
    assign _5240 = f_sw_cnt == _1081;
    assign _5241 = ~ _5240;
    assign _5345 = _5241 ? _5344 : _5238;
    assign _5238 = _5233 ? _5391 : _5236;
    assign _5346 = f_sweeping ? _5345 : _5238;
    assign _253 = _5346;
    always @(posedge _276) begin
        if (_274)
            _5236 <= _5391;
        else
            _5236 <= _253;
    end
    assign _5264 = _5236 ^ _5263;
    assign _5265 = _5264[0:0];
    assign _5274 = _5265 ? _5273 : _5268;
    assign _5275 = _5274[0:0];
    assign _5284 = _5275 ? _5283 : _5278;
    assign _5285 = _5284[0:0];
    assign _5294 = _5285 ? _5293 : _5288;
    assign _5295 = _5294[0:0];
    assign _5304 = _5295 ? _5303 : _5298;
    assign _5305 = _5304[0:0];
    assign _5314 = _5305 ? _5313 : _5308;
    assign _5315 = _5314[0:0];
    assign _5324 = _5315 ? _5323 : _5318;
    assign _5325 = _5324[0:0];
    assign _5334 = _5325 ? _5333 : _5328;
    assign _5335 = _5334[0:0];
    assign _5344 = _5335 ? _5343 : _5338;
    assign _5392 = _5344 ^ _5391;
    assign f_sw_match = _5392 == _5393;
    assign _5395 = f_sw_last ? f_sw_match : _5390;
    assign _5397 = _5378 ? _1066 : _5395;
    assign _1357 = ~ f_sweeping;
    assign _1356 = _1355 & _1310;
    assign f_store_we = _1356 & _1357;
    assign _5386 = f_store_we | _5376;
    assign _5388 = _5386 ? _1066 : f_image_valid;
    assign _5390 = _5233 ? _1066 : _5388;
    assign _5379 = 13'b1000000000000;
    assign _5350 = f_sw_cnt + _5243;
    assign _5348 = _5233 ? _1081 : f_sw_cnt;
    assign _5351 = f_sweeping ? _5350 : _5348;
    assign _254 = _5351;
    always @(posedge _276) begin
        if (_274)
            f_sw_cnt <= _1081;
        else
            f_sw_cnt <= _254;
    end
    assign f_sw_last = f_sw_cnt == _5379;
    assign _5382 = f_sw_last ? _1066 : _5372;
    assign _5199 = _1330[3:0];
    assign _5201 = _5199 == _2836;
    assign _5354 = _5201 ? _2703 : _1066;
    assign _5208 = 4'b1001;
    assign _5207 = _1330[3:0];
    assign _5209 = _5207 == _5208;
    assign _5356 = _5209 ? _2703 : _5354;
    assign _5216 = 4'b1010;
    assign _5215 = _1330[3:0];
    assign _5217 = _5215 == _5216;
    assign _5358 = _5217 ? _2703 : _5356;
    assign _5224 = 4'b1011;
    assign _5223 = _1330[3:0];
    assign _5225 = _5223 == _5224;
    assign _5360 = _5225 ? _2703 : _5358;
    assign _2713 = _1330[4:4];
    assign _2710 = _1330[5:5];
    assign _2711 = ~ _2710;
    assign _2708 = _1244 == _1074;
    assign _2709 = _1243 & _2708;
    assign _2712 = _2709 & _2711;
    assign _2714 = _2712 & _2713;
    assign _5361 = _2714 ? _5360 : _1066;
    assign _255 = _5361;
    always @(posedge _276) begin
        if (_274)
            _5376 <= _1066;
        else
            _5376 <= _255;
    end
    assign _1367 = 4'b1111;
    assign _1366 = _1330[3:0];
    assign _1368 = _1366 == _1367;
    assign _5364 = _1368 ? _2703 : _1066;
    assign _1345 = _1244 == _1693;
    assign _1346 = _1243 & _1345;
    assign _5365 = _1346 ? _5364 : _1066;
    assign _256 = _5365;
    always @(posedge _276) begin
        if (_274)
            _1355 <= _1066;
        else
            _1355 <= _256;
    end
    assign _5373 = _1382 | _1355;
    assign _5377 = _5373 | _5376;
    assign _5378 = f_sweeping & _5377;
    assign _5384 = _5378 ? _1066 : _5382;
    assign _5232 = ~ f_sweeping;
    assign _5368 = _1260[4:4];
    assign _5367 = _2643 == _2726;
    assign _5369 = _5367 ? _5368 : _1066;
    assign _5370 = _2641 ? _5369 : _1066;
    assign _257 = _5370;
    always @(posedge _276) begin
        if (_274)
            _5230 <= _1066;
        else
            _5230 <= _257;
    end
    assign _5231 = _5230 & _1310;
    assign _5233 = _5231 & _5232;
    assign _5372 = _5233 ? _2703 : f_sweeping;
    assign _5385 = f_sweeping ? _5384 : _5372;
    assign _258 = _5385;
    always @(posedge _276) begin
        if (_274)
            f_sweeping <= _1066;
        else
            f_sweeping <= _258;
    end
    assign _5398 = f_sweeping ? _5397 : _5390;
    assign _259 = _5398;
    always @(posedge _276) begin
        if (_274)
            f_image_valid <= _1066;
        else
            f_image_valid <= _259;
    end
    assign _5401 = _1260[0:0];
    assign _2643 = _1330[3:0];
    assign _5400 = _2643 == _2726;
    assign _5402 = _5400 ? _5401 : _1066;
    assign _2639 = _1330[4:4];
    assign _2640 = ~ _2639;
    assign _2636 = _1330[5:5];
    assign _2637 = ~ _2636;
    assign _2634 = _1244 == _1074;
    assign _1242 = ~ _1241;
    assign _1237 = _1231 & _1236;
    assign _1243 = _1237 & _1242;
    assign _2635 = _1243 & _2634;
    assign _2638 = _2635 & _2637;
    assign _2641 = _2638 & _2640;
    assign _5403 = _2641 ? _5402 : _1066;
    assign _260 = _5403;
    always @(posedge _276) begin
        if (_274)
            _1382 <= _1066;
        else
            _1382 <= _260;
    end
    assign _1386 = _1382 & f_image_valid;
    assign _5430 = _1386 ? _1273 : _5428;
    assign _261 = _5430;
    always @(posedge _276) begin
        if (_274)
            _283 <= _1394;
        else
            _283 <= _261;
    end
    assign _1310 = _283 == _1394;
    assign _1592 = ~ _1310;
    assign _262 = _1592;
    assign _5494 = { _262,
                     _100,
                     _98,
                     _91,
                     _5492,
                     _5493,
                     _88,
                     _87 };
    assign _5491 = _1330[3:0];
    always @* begin
        case (_5491)
        0:
            _5512 <= _5494;
        1:
            _5512 <= _5496;
        2:
            _5512 <= _5498;
        3:
            _5512 <= _5500;
        4:
            _5512 <= _1460;
        5:
            _5512 <= _605;
        6:
            _5512 <= _5501;
        7:
            _5512 <= _5503;
        8:
            _5512 <= _5504;
        9:
            _5512 <= _5505;
        10:
            _5512 <= _5506;
        11:
            _5512 <= _5507;
        12:
            _5512 <= _5508;
        13:
            _5512 <= _5509;
        14:
            _5512 <= _1282;
        default:
            _5512 <= _1282;
        endcase
    end
    assign _5490 = _1330[4:4];
    assign _5524 = _5490 ? _5523 : _5512;
    assign _5449 = _1330[15:3];
    assign _5451 = { _5449,
                     _1074 };
    assign _5448 = _1330 + _5164;
    assign _5443 = _1330[2:0];
    assign _5445 = _5443 == _1717;
    assign _5442 = _1244 == _1705;
    assign _5446 = _5442 & _5445;
    assign _5452 = _5446 ? _5451 : _5448;
    assign _5438 = _1330[15:8];
    assign _5439 = { _5438,
                     _1260 };
    assign _5435 = _1330[7:0];
    assign _5436 = { _1260,
                     _5435 };
    assign _5434 = _1234 == _1273;
    assign _5437 = _5434 ? _5436 : _1330;
    assign _5432 = _1234 == _1274;
    assign _5440 = _5432 ? _5439 : _5437;
    assign _5453 = _1236 ? _5452 : _5440;
    assign _5454 = _1231 ? _5453 : _1330;
    assign _263 = _5454;
    always @(posedge _276) begin
        if (_274)
            _1330 <= _1173;
        else
            _1330 <= _263;
    end
    assign _5489 = _1330[5:5];
    assign _5533 = _5489 ? _5532 : _5524;
    assign _1244 = _1240[2:0];
    always @* begin
        case (_1244)
        0:
            _5556 <= _5533;
        1:
            _5556 <= _1282;
        2:
            _5556 <= _5540;
        3:
            _5556 <= _5550;
        4:
            _5556 <= _1282;
        5:
            _5556 <= _5553;
        6:
            _5556 <= _1282;
        default:
            _5556 <= _1282;
        endcase
    end
    assign _265 = mosi;
    always @(posedge _276) begin
        if (_274)
            _1256 <= _1066;
        else
            _1256 <= _265;
    end
    always @(posedge _276) begin
        if (_274)
            _1259 <= _1066;
        else
            _1259 <= _1256;
    end
    assign _5455 = _1260[6:0];
    assign _5456 = _1225 ? _5455 : _1253;
    assign _266 = _5456;
    always @(posedge _276) begin
        if (_274)
            _1253 <= _1269;
        else
            _1253 <= _266;
    end
    assign _1260 = { _1253,
                     _1259 };
    assign _5462 = _1234 == _1394;
    assign _5463 = _5462 ? _1260 : _1240;
    assign _5464 = _1231 ? _5463 : _1240;
    assign _5466 = _5460 ? _1282 : _5464;
    assign _267 = _5466;
    always @(posedge _276) begin
        if (_274)
            _1240 <= _1282;
        else
            _1240 <= _267;
    end
    assign _1241 = _1240[7:7];
    assign _5471 = _1234 + _1273;
    assign _5468 = _1234 == _1332;
    assign _5469 = ~ _5468;
    assign _5472 = _5469 ? _5471 : _1234;
    assign _1230 = _1228 == _1729;
    assign _1231 = _1225 & _1230;
    assign _5473 = _1231 ? _5472 : _1234;
    assign _5475 = _5460 ? _1394 : _5473;
    assign _268 = _5475;
    always @(posedge _276) begin
        if (_274)
            _1234 <= _1394;
        else
            _1234 <= _268;
    end
    assign _1236 = _1234 == _1332;
    assign _5487 = _1236 & _1241;
    assign _5557 = _5487 ? _5556 : _1282;
    assign _5484 = _5483[6:0];
    assign _5486 = { _5484,
                     _1066 };
    assign _5477 = _1228 + _1693;
    assign _1224 = ~ _1223;
    assign _1220 = _1213 & _1219;
    assign _1225 = _1220 & _1224;
    assign _5478 = _1225 ? _5477 : _1228;
    assign _5480 = _5460 ? _1074 : _5478;
    assign _269 = _5480;
    always @(posedge _276) begin
        if (_274)
            _1228 <= _1074;
        else
            _1228 <= _269;
    end
    assign _2830 = _1228 == _1074;
    assign _5558 = _2830 ? _5557 : _5486;
    always @(posedge _276) begin
        if (_274)
            _1223 <= _1066;
        else
            _1223 <= _1219;
    end
    assign _271 = sck;
    always @(posedge _276) begin
        if (_274)
            _1216 <= _1066;
        else
            _1216 <= _271;
    end
    always @(posedge _276) begin
        if (_274)
            _1219 <= _1066;
        else
            _1219 <= _1216;
    end
    assign _2823 = ~ _1219;
    assign _2824 = _1213 & _2823;
    assign _2825 = _2824 & _1223;
    assign _5559 = _2825 ? _5558 : _5483;
    assign _5459 = ~ _1212;
    always @(posedge _276) begin
        if (_274)
            _5458 <= vdd;
        else
            _5458 <= _1212;
    end
    assign _5460 = _5458 & _5459;
    assign _5563 = _5460 ? _5562 : _5559;
    assign _272 = _5563;
    always @(posedge _276) begin
        if (_274)
            _5483 <= _1282;
        else
            _5483 <= _272;
    end
    assign _5564 = _5483[7:7];
    assign vdd = 1'b1;
    assign _274 = clear;
    assign _276 = clock;
    assign _278 = cs_n;
    always @(posedge _276) begin
        if (_274)
            _1210 <= vdd;
        else
            _1210 <= _278;
    end
    always @(posedge _276) begin
        if (_274)
            _1212 <= vdd;
        else
            _1212 <= _1210;
    end
    assign _1213 = ~ _1212;
    assign _5565 = _1213 & _5564;
    assign miso = _5565;
    assign irq = _1663;
    assign viol = _1636;
    assign entry = f_in_fetch;
    assign dbg = _1631;
    assign pins_out = _1579;
    assign pins_oe = _1553;
    assign ram_rec_addr = _1379;
    assign ram_rec_re = _1362;
    assign ram_rec_we = f_store_we;
    assign ram_rec_wdata = _1349;
    assign ram_cov_addr = _1343;
    assign ram_cov_re = _1324;
    assign ram_cov_we = _1321;
    assign ram_cov_wdata = _1305;

endmodule
