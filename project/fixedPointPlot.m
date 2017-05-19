function fixedPointPlot(f,g,tableData,posOfRoots)     
     roots = tableData(end,posOfRoots);%assume root in column 3.
     s = roots-5;
     e = roots+5;
     interval = s:.001:e;
     y = subs(f,interval);
     plot(interval, y,interval,subs(g,interval));