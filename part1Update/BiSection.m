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
    %----------------------------------------------------------------------
    %setting the maximum number of iterations if it isn't given as input.
    if ~exist('MaxNumberOfIterations', 'var')
        MaxNumberOfIterations = 50;
    end
    %setting the value of eps if it isn't given to the method as input.
    if ~exist('eps', 'var')
        eps = 0.00001;
    end
    % converting the string input function to inline function in order to
    % use it the the values of Ys against Xs.
    f = inline(f);
    % setting the lower bound to a.
    a = l;
    % setting the upper bound to b.
    b = u;
    % calculating the mid as root.
    mid = (a+b)/2;
    % counter for iterations.
    i=1;
    % temperary value inorder to save the last mid calculated before
    % calculating the new one.
    mid1= -1;
    tic;
    %%output data set.
    %[Iteration, firstBound, root , secondBound, RelativeApproximateError, Time]%
    iterations =[i a mid b 100 toc];
    % loop for iterating.
    while abs(f(mid)) >= eps && i < MaxNumberOfIterations 
        % getting the f(l).
        fL = f(a);
        % getting the f(mid).
        fM = f(mid);
        % deteriming the next bounds (a and b).
        if( fL * fM < 0)
          b = mid;
        else
          a = mid;
        end
        %-----------------------------
        % saving the last value of mid.
        mid1 = mid;
        % setting the new value of mid.
        mid = (a+b)/2;
        i=i+1;
        % adding iteration details to the output data set.
        iterations = [iterations;[i a mid b abs(mid-mid1) toc]];
    end
    % calculating the maximum number of iterations needed.
    numberOfIterations = log2(abs(abs(l-u)/eps));
    numberOfIterations = ceil(numberOfIterations);
    fileID = fopen('outputBisection.txt','wt');
         fprintf(fileID,'%10s %15s %12s %12s %14s %12s\r\n','i' ,'a' ,'b' ,'mid' ,'error', 'time');
         for i = 1:size(iterations)
            fprintf(fileID,'%17f %12f %12f %12f %12f %12f\r\n',iterations(i,:));
         end
     fclose(fileID);
end