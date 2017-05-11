function [ output_args ] = showView( handles , flag)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    chars = char(flag);
    set(handles.initial_values_label2,'Visible',char(flag(1)));
    set(handles.initial_values_txtArea2,'Visible',char(flag(2)));
    set(handles.tolerance_label2,'Visible',char(flag(3)));
    set(handles.tolerance_txtArea2,'Visible',char(flag(4)));
    set(handles.initial_values_label,'Visible',char(flag(5)));
    set(handles.initial_values_txtArea,'Visible',char(flag(6)));
    set(handles.tolerance_label,'Visible',char(flag(7)));
    set(handles.tolerance_txtArea,'Visible',char(flag(8)));
    set(handles.iterations_label1,'Visible',char(flag(9)));
    set(handles.iterations_txtArea1,'Visible',char(flag(10)));
    set(handles.iterations_label2,'Visible',char(flag(11)));
    set(handles.iterations_txtArea2,'Visible',char(flag(12)));
    
    %buttons
    set(handles.next_button,'Visible',char(flag(13)));

    %tables
    set(handles.table,'Visible',char(flag(14)));
    set(handles.table2,'Visible',char(flag(15)));    

end

