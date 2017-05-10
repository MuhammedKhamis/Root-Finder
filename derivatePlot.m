function derivatePlot(f,tableData,posOfRoots)
     roots = tableData(end,posOfRoots);%assume root in column 3.
     s = roots-100;
     e = roots+100;
     interval = s:.01:e;
     y = subs(f,interval);
     plot(interval, y);