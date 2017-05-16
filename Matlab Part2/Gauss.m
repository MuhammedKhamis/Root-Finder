function [ solutionTable,finalMatrix,solutions,condition] = Gauss(coefficient,results)
[solutionTable,help,condition]= forwardElimination(horzcat(coefficient,results));
finalMatrix=help;
    if (condition==0)
        solutions=backSubistitution(help);
        %disp(solutionTable);
    else
        solutions=0; 
        return;
    end
    
    
    %output in file
    fileID = fopen('outputGaussElimination.txt','wt');
    fprintf(fileID,'%4s\r\n','Original Matrix');
    [r,c] = size(solutionTable);
    original = horzcat(coefficient,results);
    len = length(solutions);
    
    %original matrix
    for i = 1:len
        for j = 1:c
            if(j == c)
                    fprintf(fileID,'%s  ', '|');
            end
            fprintf(fileID,'%08.10f  ',double(original(i,j)));
        end
        fprintf(fileID,'\r\n');   
    end
    
    %steps
    for i = 1:len:r
        fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');
        fprintf(fileID,'%s %d\r\n','Step' , floor(i/len)+1);
        for ii = i:i+len-1
           for j = 1:c
               if(j == c)
                    fprintf(fileID,'%s  ', '|');
               end
               fprintf(fileID,'%08.10f  ',double(solutionTable(ii,j)));
           end
           fprintf(fileID,'\r\n');
       end
    end
    fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');
    
    %solutions
    fprintf(fileID,'%s\r\n','Solutions');
    for i = 1:length(solutions)
        fprintf(fileID,'%08.10f\r\n',double(solutions(i,:)));
    end
    
    fclose(fileID);
end

