function [ solutionTable,finalMatrix,solutions,condition] = Gauss(coefficient,results)
[solutionTable,help,condition]= forwardElimination(horzcat(coefficient,results));
finalMatrix=help;
if (condition==0)
    solutions=backSubistitution(help);
else
   solutions=0; 
end

end

