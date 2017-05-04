function [iterations] = SecantWithEps( f,x1,x2,eps, MaxNumberOfIterations)
    
    if ~exist('MaxNumberOfIterations', 'var')
        MaxNumberOfIterations = 50;
    end
    if ~exist('eps', 'var')
        eps = 0.00001;
    end
    f = inline(f);
    i = 1;
    tic;
    x3 = x2 - (f(x2)*(x1-x2))/(f(x1)-f(x2));
    iterations = [i x1 x2 x3 abs(((x3-x2)/x3))*100 toc];
    while abs(f(x3)) > eps && i <  MaxNumberOfIterations 
        x1 = x2;
        x2 = x3;
        x3 = x2 - (f(x2)*(x1-x2))/(f(x1)-f(x2));
        i = i+1;
        iterations =[iterations;[i x1 x2 x3 abs(((x3-x2)/x3))*100 toc]];
    end
end

