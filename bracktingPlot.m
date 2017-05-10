function bracktingPlot(f,tableData,posOfRoots,x0,x1)
     roots = tableData(end,posOfRoots);%assume root in column 3.
     s = roots-15;
     e = roots+15;
     interval = s:1:e;
     y = subs(f,interval);
     plot(interval, y,[x0 x0],[500 -500],[x1 x1],[500 -500]);