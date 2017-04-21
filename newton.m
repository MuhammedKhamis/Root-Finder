function [tableData] = Newton(fn, dfn,intialGuess,tolerance,MaxIteration)
    %intialGuess = input('Enter an intial guess : ');
    %tolerance = input('Enter the tolerance : ');
    iteration = 1;
    x(iteration) = intialGuess;
    f(iteration) = feval(fn, x(iteration));
    er(iteration) = 0;
    dfdx(iteration) = feval(dfn, x(iteration));
    iteration = iteration + 1;
    for i = 2 : MaxIteration 
        tic;
        x(iteration) = x(iteration - 1) - (f(iteration - 1) / dfdx(iteration - 1));
        f(iteration) = feval(fn, x(iteration));
        dfdx(iteration) = feval(dfn, x(iteration));
        er(iteration) = abs(x(iteration) - x(iteration - 1));
        time(iteration) = toc;
        if er(iteration) < tolerance
            n = length(x);
            k = 1:n;
            %number of iterations, execution time, all iterations,approximate root,and precision
            %disp('  step                    x                       f                    df/dx            Approximate Error %');
            tableData = [k;time; x; f; dfdx; er*100];
            disp(tablData);
           return
        end
        iteration = iteration + 1;
    end
    tableData ='can not solve.';
   
    
    
    