function [initial,toler,itera,flag] = getIterativeParameters( handles, option)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    flag = 1;
    
    try
        if option ==1
            itera = get(handles.iterations_txtArea1,'String');
            initial = get(handles.initial_values_txtArea,'String');
            toler = get(handles.tolerance_txtArea,'String');
        else
            itera = get(handles.iterations_txtArea2,'String');
            initial = get(handles.initial_values_txtArea2,'String');
            toler = get(handles.tolerance_txtArea2,'String');
        end
    catch e
        flag = 0;
        return
    end
    
    if(isempty(itera))
        itera = 50;
    else
        itera = str2num(itera);
        flag = logical(flag & (itera == double(itera)));
    end;

    if(isempty(toler))
        toler = .00001;
    else
        toler = str2num(toler);
        flag = logical(flag & (toler == double(toler)));
    end;

    if(isempty(initial))
        initial1 = [0,0,0];
    else
        flag = logical(flag & (initial1 == double(initial1)));
    end;
end