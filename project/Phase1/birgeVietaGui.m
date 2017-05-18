function numberOfIterations = birgeVietaGui (f,iterations,tolerance,handles)
 x0 =  get(handles.edit10,'String');
           if(isempty(x0))
                return
            else
                x0 = str2double(x0);
                [err,tableData] = Birge_Vieta(f,x0,tolerance,iterations);
                if(err == 0)
                    set(handles.text15,'string',strcat(get(handles.text15,'string'),'birgeVieta'));
                    numberOfIterations = [];
                else
                    set(handles.uitable1,'ColumnName',{'iterations', 'power from maximum power to 0', 'a','b','c','x','error','time'});
                    set(handles.uitable1,'data',tableData); 
                    numberOfIterations = tableData;
                    plot(tableData(:,1),tableData(:,6),'k')
                    hold on;
                end
                %nothing to be ploted.
           end
end