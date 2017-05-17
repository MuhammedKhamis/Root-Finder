function [ ] = printOutputFile( fileName, table,columnNames)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    fileID = fopen(fileName,'wt');
    [r,c] = size(table);
    colNames = columnNames
    fprintf(fileID,'      %s  ',colNames{1});
    for i= 2 : length(colNames)
        endd = 8;
        if i > double((c-2)/3)+2
            endd = 6;
        end    
        for j=1:endd
            fprintf(fileID,'%s',' ');
        end
        fprintf(fileID,'%s  ',colNames{i});
    end
    
    for i=1:r
        fprintf(fileID,'\n');
        for j=1:c
            fprintf(fileID,'%10f   ',double(table(i,j)));
        end
    end
end
