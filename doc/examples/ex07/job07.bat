REM		GMT EXAMPLE 07
REM
REM		$Id: job07.bat,v 1.1.1.1 2000-12-28 01:23:45 gmt Exp $
REM
REM Purpose:	Make a basemap with earthquakes and isochrons etc
REM GMT progs:	pscoast, pstext, psxy
REM DOS calls:	del, echo, gawk
REM
echo GMT EXAMPLE 07
set master=y
if exist job07.bat set master=n
if %master%==y cd ex07
pscoast -R-50/0/-10/20 -JM9i -K -GP300/26 -Dl -W0.25p -B10 -U"Example 7 in Cookbook" > example_07.ps
psxy -R -JM -O -K -M fz.xy -W0.5pta >> example_07.ps
gawk "{print $1-360.0, $2, $3*0.01}" quakes.xym | psxy -R -JM -O -K -H1 -Sci -G255 -W0.25p >> example_07.ps
psxy -R -JM -O -K -M isochron.xy -W0.75p >> example_07.ps
psxy -R -JM -O -K -M ridge.xy -W1.75p >> example_07.ps
echo -14.5 15.2 > tmp
echo -2 15.2 >> tmp
echo -2 17.8 >> tmp
echo -14.5 17.8 >> tmp
psxy -R -JM -O -K -G255 -W1p -A tmp >> example_07.ps
echo -14.35 15.35 > tmp
echo -2.15 15.35 >> tmp
echo -2.15 17.65 >> tmp
echo -14.35 17.65 >> tmp
psxy -R -JM -O -K -G255 -W0.5p -A tmp >> example_07.ps
echo -13.5 16.5 | psxy -R -JM -O -K -Sc0.08i -G255 -W0.5p >> example_07.ps
echo -12.5 16.5 18 0 6 5 ISC Earthquakes | pstext -R -JM -O -K >> example_07.ps
echo -43 -5 30 0 1 6 SOUTH > tmp
echo -43 -8 30 0 1 6 AMERICA >> tmp
echo -7 11 30 0 1 6 AFRICA >> tmp
pstext -R -JM -O -S0.75p -G255 tmp >> example_07.ps
del .gmt*
del tmp
if %master%==y cd ..
