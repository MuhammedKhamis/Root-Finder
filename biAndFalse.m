function numberOfIterations = biAndFalse (f,iterations,tolerance,handles)

    left = get(handles.edit4,'String');
    right = get(handles.edit5,'String');
        if(isempty(left) || isempty(right))
              return
        else
              left = str2double(left);
              right = str2double(right);
            if(strcmp(handles.cell , 'All methods'))
             table = BiSectionWithEps(f,left,right,tolerance,iterations);
             table2 = falsePosition(f,left,right,tolerance,iterations);
             numberOfIterations = [table(end,1) table2(end,1)];
            elseif(strcmp(handles.cell , 'Bisection'))
             dataTable = BiSectionWithEps(f,left,right,tolerance,iterations);
             bracktingPlot(f,dataTable,3,left,right)%assume roots in column 3
             set(handles.uitable1,'ColumnName',{'iterations' ,'a' ,'b' ,'mid' ,'error', 'time'});
             set(handles.uitable1,'data',dataTable);
            elseif(strcmp(handles.cell , 'False-position'))
             dataTable = falsePosition(f,left,right,tolerance,iterations);
             bracktingPlot(f,dataTable,4,left,right)%assume roots in column 4
             set(handles.uitable1,'ColumnName',{'iterations', 'xl', 'xu','xr','f(xl)',' f(xu)','f(xr)',' error','time for all iterations from the start'});
             set(handles.uitable1,'data',dataTable);
            end
       end
end