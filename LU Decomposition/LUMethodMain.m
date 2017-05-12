function [solutionTable,finalMatrix,solutions,condition] = LUMethodMain(coefficient,results)
% This method used to solve system of linear equations simultaneously using LU Decomposition method.
%Input:
%            coefficient     This is a 2D matrix that contains the coefficients of the system that we want to solve.
%            results         A column matrix that contains the results of those equations of the system.        
%Output:
%            solutionTable   This contains the steps of decompsition of coefficient matrix to L and U matrcies.
%            finalMatrix     Contains the final values of the L and U.
%            solutions       A column matrix that contains the result values of the system.
%           condition        error flag indicates of anything went wrong during executing the method.
    tol = 1e-6;
    [decomp condition solutionTable pos results] = getLU(coefficient,tol,results);
    if(condition == 1)
        return;
    end
    n = size(coefficient);
    x = substitude(decomp,pos,n(1),results);
    if(condition == 1)
        return;
    end
    finalMatrix = [];
    solutions = x;
end