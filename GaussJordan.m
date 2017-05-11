function [solutionTable,finalMatrix,solutions,condition] = GaussJordan(coefficient,results)
[solutionTable,finalMatrix,condition]=forwardElimination(horzcat(coefficient,results));
if (condition==0)
    diagonalCounter=2;
    length=size(finalMatrix);
    while(diagonalCounter<=length(1))
        rowCounter=diagonalCounter-1;
        while (rowCounter>0)
            factor=-1*finalMatrix(rowCounter,diagonalCounter)/finalMatrix(diagonalCounter,diagonalCounter);
            columnCounter=diagonalCounter;
            while (columnCounter<=length(2))
                finalMatrix( rowCounter,columnCounter)=factor* finalMatrix(diagonalCounter ,columnCounter)+ finalMatrix( rowCounter,columnCounter);
                 columnCounter=columnCounter+1;
            end
              solutionTable=[solutionTable;finalMatrix];
            rowCounter=rowCounter-1;
        end
        diagonalCounter=diagonalCounter+1;
    end
    count=2;
    variables(1)=0;
    while (count<=length(1))
    variables=[variables;0];
    count=count+1;
    end
    diagonalCounter=1;
    while ( diagonalCounter<=length(1))
        variables(diagonalCounter)=finalMatrix(diagonalCounter,length(2))/finalMatrix(diagonalCounter,diagonalCounter);
       diagonalCounter=diagonalCounter+1; 
    end
    solutions=variables;
    
else
    solutions=0;
end

end

