function numberOfIterations = biAndFalse (f,iterations,tolerance,handles,hObject)

    left = get(handles.edit4,'String');
    right = get(handles.edit5,'String');
        if(isempty(left) || isempty(right))
              return
        else
              left = str2double(left);
              right = str2double(right);
            if(strcmp(handles.cell , 'All methods'))
             [table,numberOfIteration] = BiSection(f,left,right,tolerance,iterations);
             [err2,table2] = falsePosition(f,left,right,tolerance,iterations);
              if(err2 == 1)
                set(handles.text15,'String',strcat(get(handles.text15,'String'),'falsePosition,'));
             end
             numberOfIterations = [table(end,1) table2(end,1)];%assume reaching max number of iteration if any method diverge.
            elseif(strcmp(handles.cell , 'Bisection'))  
             [err,dataTable,numberOfIteration] = BiSection(f,left,right,tolerance,iterations);%err = 1 if NAN or INF or -INF
             handles.tableData = dataTable;
             handles.i = 1;
             handles.f = f;
             guidata(hObject,handles);
             if(err == 0)
                 disp(dataTable(1,2));
                 disp(dataTable(1,3));
                bracktingPlot(f,dataTable,3,dataTable(1,2),dataTable(1,3))%assume roots in column 3 done
                set(handles.uitable1,'ColumnName',{'iterations' ,'a' ,'b' ,'mid' ,'error', 'time'});
                set(handles.uitable1,'data',dataTable);
             else
                 set(handles.text15,'String',strcat(get(handles.text15,'String'),'Bisection,'));
             end
            elseif(strcmp(handles.cell , 'False-position'))
             [err2,dataTable] = falsePosition(f,left,right,tolerance,iterations);
             if(err2 == 1)
                 %set(handles.text15,'string',get(handles.text15,'string')+'falsePosition,');
                 bracktingPlot(f,dataTable,4,left,right)%assume roots in column 4
                 set(handles.uitable1,'ColumnName',{'iterations', 'xl', 'xu','xr','f(xl)',' f(xu)','f(xr)',' error','time for all iterations from the start'});
                 set(handles.uitable1,'data',dataTable);
             end
            end
       end
end