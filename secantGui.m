function numberOfIterations = secantGui(f,iterations,tolerance,handles)
           x1 = get(handles.edit8,'String');
           x2 = get(handles.edit9,'String');
            if(isempty(x1) || isempty(x2))
                return
            else
                x1 = str2double(x1);
                x2 = str2double(x2);
                dataTable = SecantWithEps(f,x1,x2,tolerance, iterations);
                tem = sym(f);
                dfn = diff(tem);
                derivatePlot(dfn,dataTable,3)%assume roots in column 3 
                %don't understand (x3-x2)/x3
                set(handles.uitable1,'ColumnName',{'iterations', 'x1' ,'x2' ,'x3','(x3-x2)/x3)', 'root','persesion'});
                set(handles.uitable1,'data',dataTable);
                numberOfIterations = dataTable(end,1);
           end
end