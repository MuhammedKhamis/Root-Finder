function [ cell ] = getCell( start, len , solutionTable )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    answer = [];
    row = start;
    count = 1;
    while(count <= len)
        answer = [answer;solutionTable((row+count-1):(row+count-1) , 1 : len+1 )];
        count = count+1;
    end
    cell = num2cell(double(answer));
end

