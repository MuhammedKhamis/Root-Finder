function fixedPointPlot(f,g,tableData,posOfRoots)     
     roots = tableData(end,posOfRoots);%assume root in column 3.
     s = roots-15;
     e = roots+15;
     interval = s:1:e;
     y = subs(f,interval);
     plot(interval, y,interval,subs(g,interval));