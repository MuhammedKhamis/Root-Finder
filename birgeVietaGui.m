function numberOfIterations = birgeVietaGui (f,iterations,tolerance,handles)
 x0 =  get(handles.edit10,'String');
           if(isempty(x0))
                return
            else
                x0 = str2double(x0);
                tableData = Birge_Vieta(f,x0,tolerance,iterations);
                set(handles.uitable1,'ColumnName',{'iterations', 'power from maximum power to 0', 'a','b','c','x','error','time'});
                set(handles.uitable1,'data',tableData);
                disp(tableData);
                %don't know what we should plot
                numberOfIterations = tableData(end,1);
           end
end