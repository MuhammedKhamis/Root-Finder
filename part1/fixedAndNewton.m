function numberOfIterations = fixedAndNewton(f,iterations,tolerance,handles)
        x0 =  get(handles.edit6,'String');
           if(isempty(x0))
                return
           else
               x0 = str2double(x0);
               if(strcmp (handles.cell , 'All methods'))
                tem = sym(f);
                dfn = diff(tem);
                dfn = char(dfn);
                [err,table] = Newton(f, dfn,x0,tolerance,iterations);
                if(err == 1)
                     set(handles.text15,'string',strcat(get(handles.text15,'string'),'Newton,'));
                end
                [err2,table2] = Fixed(f,x0,tolerance , iterations);
                if(err2 == 1)
                     set(handles.text15,'string',strcat(get(handles.text15,'string'),'FixedPoint,'));
                end
                numberOfIterations = [table(end,1) table2(end,1)];
               elseif(strcmp (handles.cell , 'Newton-Raphson'))
                tem = sym(f);
                dfn = diff(tem);
                tempdfn = dfn;
                dfn = char(dfn);
                [err,tableData] = Newton(f, dfn,x0,tolerance,iterations);
                 if(err == 0)
                     set(handles.text15,'String',strcat(get(handles.text15,'String'),'Newton,'));
                 else
                    derivatePlot(tempdfn,tableData,3)%assume roots in column 3
                    set(handles.uitable1,'data',tableData);
                    %check names.
                    %disp('  step                    x                       f              df/dx            Sigma        SigmaABS');
                    set(handles.uitable1,'ColumnName',{'step', 'execution time', 'x','f','df/dx', 'Absolute error', 'Sigma', 'Theoritical Error'}); 
                 end
               elseif(strcmp (handles.cell , 'Fixed point'))
                   [err2,tableData] = Fixed(f,x0,tolerance , iterations);
                    if(err2 == 1)
                       set(handles.text15,'String',strcat(get(handles.text15,'String'),'FixedPoint,'));
                    else
                       %don't understand '(x2-x1)/x2'
                       set(handles.uitable1,'ColumnName',{'i', 'x1', 'root', 'absolute error','time'});
                       set(handles.uitable1,'data',tableData); 
                    end
               end
           end
end