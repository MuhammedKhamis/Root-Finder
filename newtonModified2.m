function [x, f, er] = newtonModifed2(fn, dfn, ddfn)
    intialGuess = input('Enter an intial guess : ');
    tolerance = input('Enter the tolerance : ');
    iteration = 1;
    x(iteration) = intialGuess;
    f(iteration) = feval(fn, x(iteration));
    er(iteration) = 0;
    dfdx(iteration) = feval(dfn, x(iteration));
    d2fd2x(iteration) = feval(ddfn, x(iteration));
    iteration = iteration + 1;
    for i = 2 : 200
        x(iteration) = x(iteration - 1) - (f(iteration - 1) * dfdx(iteration - 1)) / (dfdx(iteration - 1)^2 - f(iteration - 1) * d2fd2x(iteration - 1));
        f(iteration) = feval(fn, x(iteration));
        dfdx(iteration) = feval(dfn, x(iteration));
        d2fd2x(iteration) = feval(ddfn, x(iteration));
        er(iteration) = abs(x(iteration) - x(iteration - 1));
        if er(iteration) < tolerance
           disp('Finished');
           break;
        end
        iteration = iteration + 1;
    end
    n = length(x);
    k = 1:n;
    disp('  step                    x                       f                    df/dx              d2f/d2x            Approximate Error %');
    out = [k; x; f; dfdx; d2fd2x; er*100];
    fprintf('%5.0f      %20.14f     %21.15f     %21.15f     %21.15f     %20.14f \n',out);
    