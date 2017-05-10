function [iterations , numberOfIterations] = BiSection(f,l,u,eps , MaxNumberOfIterations)
    % Finding the root of the given funtion that lays between the bounds
    % given using BiSection Brackting method.
    % Input:                
    %           f                        String that contains the function.
    %           l                        Lower bound.
    %           u                        Upper bound.
    %           eps                      Error value.
    %           MaxNumberOfIterations    Number of iterations specified.
    %Output:    
    %           iterations               2D array its content explained later down.
    %           numberOfIterations       total number of iterations calculated from the rule.
    if ~exist('MaxNumberOfIterations', 'var')
        MaxNumberOfIterations = 50;
    end
    if ~exist('eps', 'var')
        eps = 0.00001;
    end
    f = inline(f);
    a = l;
    b = u;
    mid = (a+b)/2;
    i=1;
    mid1= -1;
    tic;
    %[Iteration, firstBound, root , secondBound, RelativeApproximateError, Time]%
    iterations =[i a mid b 100 toc];
    while abs(f(mid)) >= eps && i < MaxNumberOfIterations 
        fL = f(a);
        fM = f(mid);
        if( fL * fM < 0)
          b = mid;
        else
          a = mid;
        end
        mid1 = mid;
        mid = (a+b)/2;
        i=i+1;
        iterations = [iterations;[i a mid b abs(((mid-mid1)/mid))*100 toc]];
    end
    numberOfIterations = ceil(log2(abs(abs(l-u)/eps)));
end