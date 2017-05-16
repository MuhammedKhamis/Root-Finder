function [] = read()
    [FileName,PathName] = uigetfile('*.txt','Select the MATLAB code file');
    fileID = fopen(fullfile(PathName,FileName),'r');
    %fileID = fopen(FileName,'r');
    tline = fgetl(fileID);
    while ischar(tline)
        disp(tline)
        tline = fgetl(fileID);
    end
    fclose(fileID);
end