function numberOfIterations = fixedAndNewton(f,iterations,tolerance,handles)
        x0 =  get(handles.edit6,'String');
           if(isempty(x0))
                return
           else
               if(strcmp (handles.cell , 'All methods'))
                tem = sym(f);
                dfn = diff(tem);
                dfn = char(dfn);
                table = Newton(f, dfn,x0,tolerance,iterations);
                table2 = FixedWithEps(f,x0,tolerance , iterations);
                numberOfIterations = [table(end,1) table2(end,1)];
               elseif(strcmp (handles.cell , 'Newton-Raphson'))
                tem = sym(f);
                dfn = diff(tem);
                tempdfn = dfn;
                dfn = char(dfn);
                tableData = Newton(f, dfn,x0,tolerance,iterations);
                derivatePlot(tempdfn,tableData,3)%assume roots in column 3
                set(handles.uitable1,'data',tableData);
                %check names.
                set(handles.uitable1,'ColumnName',{'step', 'execution time', 'x','f','df/dx', 'Approximate Error'});
               elseif(strcmp (handles.cell , 'Fixed point'))
                   tableData = FixedWithEps(f,x0,tolerance , iterations);
                   %don't understand '(x2-x1)/x2'
                   set(handles.uitable1,'ColumnName',{'i', 'x1', 'x2', 'abs(((x2-x1)/x2))*100','time'});
                   %fixedPointPlot(g,'x',tableData,3) %assume roots in 3 %find g(x)
                   set(handles.uitable1,'data',tableData);
               end
           end
end