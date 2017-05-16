function numberOfIterations = birgeVietaGui (f,iterations,tolerance,handles)
 x0 =  get(handles.edit10,'String');
           if(isempty(x0))
                return
            else
                x0 = str2double(x0);
                [err,tableData] = Birge_Vieta(f,x0,tolerance,iterations);
                if(err == 1)
                    set(handles.text15,'string',get(handles.text15,'string')+'birgeVieta');
                else
                    set(handles.uitable1,'ColumnName',{'iterations', 'power from maximum power to 0', 'a','b','c','x','error','time'});
                    set(handles.uitable1,'data',tableData); 
                end
                %nothing to be ploted.
                numberOfIterations = tableData(end,1);
           end
end