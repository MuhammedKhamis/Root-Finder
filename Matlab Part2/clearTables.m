function [ handles ] = clearTables( handles )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    setappdata(handles.figure1,'len',0); 
    setappdata(handles.figure1,'solutionTable',[]);
    setappdata(handles.figure1,'solutions',[]);
    setappdata(handles.figure1,'ySolutions',[]);
    setappdata(handles.figure1,'ind',1);
    set(handles.table,'Data',{});
    set(handles.table2,'Data',{});
    set(handles.table, 'ColumnName', []);
    set(handles.table2, 'ColumnName', []);
    set(handles.comment_textArea,'String','');
end

