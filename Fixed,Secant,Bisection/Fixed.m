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
    %----------------------------------------------------------------------
    %setting the maximum number of iterations if it isn't given as input.
    if ~exist('MaxNumberOfIterations', 'var')
        MaxNumberOfIterations = 50;
    end
    %setting the value of eps if it isn't given to the method as input.
    if ~exist('eps', 'var')
        eps = 0.00001;
    end
    
    syms x;
    err = 0;
    % converting the string input function to inline function in order to
    % use it the the values of Ys against Xs.
    f = inline(f+x);
%     tmp = sym(f);
%     tmp = diff(tmp);
%     tmp = inline(tmp);
    i = 1;
    tic;
    % calculating the first root.
    x2 = f(x1);
    % output data set.
    %[ iteration, prevRoot, currnetRoot, relativeApproximateError, Time] %
    iterations=[i x1 x2 abs(((x2-x1))) toc];
    % iteration loop.
    while abs(x2-x1) > eps && i < MaxNumberOfIterations
        % assigning the value of the current point to the last point.
        x1 = x2;
        % calculating the value of the current point.
        x2 = f(x1);
        i = i + 1;
        % appending Iteration detail to the output data set.
        iterations = [iterations; [i x1 x2 abs(x2-x1) toc]];
    end
    % Testing the last value and compare it with the g(x), if the difference
    % between them is less than eps then this answer is acceptable.
    test = f(x2)-x2;
    if ( abs(test) > eps)
        err = 1;
        iterations =[];
    end
end

