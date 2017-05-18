function bracktingPlot(f,tableData,posOfRoots,x0,x1)
     roots = tableData(end,posOfRoots);%assume root in column 3.
     s = roots-5;
     e = roots+5;
     interval = s:.001:e;
     y = subs(f,interval);
     plot(interval, y,'b',[x0 x0],[100 -100],'r',[x1 x1],[100 -100],'y');