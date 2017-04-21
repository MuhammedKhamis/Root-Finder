function [numberofIterations , executionTime,iterations, root,persesion] = SecantWithEps( f,x1,x2,eps, MaxNumberOfIterations)
    
    if ~exist('MaxNumberOfIterations', 'var')
        MaxNumberOfIterations = 50;
    end
    if ~exist('eps', 'var')
        eps = 0.00001;
    end
    f = inline(f);
    x3 = x2 - (f(x2)*(x1-x2))/(f(x1)-f(x2));
    i = 0;
    iterations = [x1 x2 x3];
    tic;
    while abs(f(x3)) > eps && i <  MaxNumberOfIterations 
        x1 = x2;
        x2 = x3;
        x3 = x2 - (f(x2)*(x1-x2))/(f(x1)-f(x2));
        iterations =[iterations;[x1 x2 x3]];
        i = i+1;
    end
    executionTime = toc;
    root = x3;
    numberofIterations = i;
    persesion = x3-x2;
end

