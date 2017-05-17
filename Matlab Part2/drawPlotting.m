function [handles] = drawPlotting( table1,table2,ind,handles )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    set(handles.prev_plot,'Visible','on');
    set(handles.next_plot,'Visible','on');
    disp('plottin');
    ind = ind+1;
    table1(:,ind)
    plot(table1(:,ind),table1(:,1),table2(:,ind),table2(:,1));
end