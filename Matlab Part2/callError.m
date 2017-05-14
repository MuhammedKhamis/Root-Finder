function [ ] = callError( obj, messege, handles )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    set(obj,'String',messege); 
    setappdata(handles.figure1,'len',0); 
    setappdata(handles.figure1,'solutionTable',[]);
    setappdata(handles.figure1,'solutions',[]);
    setappdata(handles.figure1,'ind',1);
    setappdata(handles.table,'Data',{});    

end

