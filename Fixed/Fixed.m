function [iterations , err] = Fixed(f,x1,eps , MaxNumberOfIterations)
    % Finding the root of the given funtion using Fixed
    % Point Iterating method with initial guess
    % Input:                
    %           f                        String that contains the function.
    %           x1                       Initial guess.
    %           eps                      Error value.
    %           MaxNumberOfIterations    Number of iterations specified.
    %Output:
    %           iterations               2D array its content explained later down.
    %           err                      boolean indicaites if divergance happened.
    
    if ~exist('MaxNumberOfIterations', 'var')
        MaxNumberOfIterations = 50;
    end
    if ~exist('eps', 'var')
        eps = 0.00001;
    end

    syms x;
    err = 0;
    f = inline(f + x);
    tmp = sym(f);
    tmp = diff(tmp);
    tmp = inline(tmp);
    if(tmp(x1) > 1)
        err = 1;
        return;
    end
    i = 1;
    tic;
    x2 = f(x1);
    %[ iteration, prevRoot, currnetRoot, relativeApproximateError, Time] %
    iterations=[i x1 x2 abs(((x2-x1)/x2))*100 toc];
    while abs(x2) > eps && i < MaxNumberOfIterations
        x1 = x2;
        x2 = f(x1);
        i = i + 1;
        iterations = [iterations; [i x1 x2 abs(((x2-x1)/x2))*100 toc]];
    end
end

