function [data1,data2] = biAndFalse (f,iterations,tolerance,handles,hObject)

    left = get(handles.edit4,'String');
    right = get(handles.edit5,'String');
        if(isempty(left) || isempty(right))
              return
        else
              left = str2double(left);
              right = str2double(right);
            if(strcmp(handles.cell , 'All methods'))
                     [table,numberOfIteration] = BiSection(f,left,right,tolerance,iterations);
                     err = 0;
                     if(err == 0)
                             data1 = table;
                             plot(table(:,1),table(:,3),'r')
                             hold on;
                     else
                         set(handles.text15,'String',strcat(get(handles.text15,'String'),'Bisection,'));
                          data1 = [];
                     end
                     [err2,table2] = falsePosition(f,left,right,tolerance,iterations);
                      if(err2 == 0)
                            set(handles.text15,'String',strcat(get(handles.text15,'String'),'falsePosition,'));
                            data2 = [];
                      else
                            data2 = table2;
                             plot(table2(:,1),table2(:,3),'b')
                             hold on;
                      end
            elseif(strcmp(handles.cell , 'Bisection'))  
                     [dataTable,numberOfIteration] = BiSection(f,left,right,tolerance,iterations);%err = 1 if NAN or INF or -INF
                     handles.tableData = dataTable;
                     handles.i = 1;
                     handles.f = f;
                     set(handles.text6,'String','numberOfIteration');
                     set(handles.text5,'String',numberOfIteration + 1);
                     guidata(hObject,handles);
                     bracktingPlot(f,dataTable,3,dataTable(1,2),dataTable(1,3))%assume roots in column 3 done
                     set(handles.uitable1,'ColumnName',{'iterations' ,'a' ,'mid' ,'b' ,'error', 'time'});
                     set(handles.uitable1,'data',dataTable);
                     set(handles.pushbutton4,'visible','on');
                     set(handles.pushbutton5,'visible','on');
            elseif(strcmp(handles.cell , 'False-position'))
                     [err2,dataTable] = falsePosition(f,left,right,tolerance,iterations);
                     if(err2 == 1)
                         bracktingPlot(f,dataTable,4,left,right)%assume roots in column 4
                         set(handles.uitable1,'ColumnName',{'iterations', 'xl', 'xu','xr','f(xl)',' f(xu)','f(xr)',' error','time for all iterations from the start'});
                         set(handles.uitable1,'data',dataTable);
                     else
                         set(handles.text15,'string',strcat(get(handles.text15,'string'),'falsePosition,'));
                     end
            end
       end
end