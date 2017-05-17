function [iterations] = Secant( f,x1,x2,eps, MaxNumberOfIterations)
    % Finding the root of the given funtion using Secant Iterating method 
    % with 2 initial guesses
    % Input:                
    %           f                        String that contains the function.
    %           x1                       First initial guess.
    %           x2                       Second initial guess.
    %           eps                      Error value.
    %           MaxNumberOfIterations    number of iterations specified.
    %Output:
    %           iterations               2D array its content explained later down.
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
    % counter for iterations.
    i = 1;
    % starting to calculating the time.
    tic;
    % first calculation of the root.
    x3 = x2 - (f(x2)*(x1-x2))/(f(x1)-f(x2));
    %%output data set.
    %[iteration, leastPoint, currentRoot, LastPoint, RelativeApproximateError, Time]
    iterations = [i x1 x2 x3 abs(((x3-x2))) toc];
    % loop for iterating.
    while abs(f(x3)) > eps && i <  MaxNumberOfIterations 
        % setting the second point value to first point. 
        x1 = x2;
        % setting the third point value to second point.
        x2 = x3;
        % calculating the value of the root using secant formula.
        x3 = x2 - (f(x2)*(x1-x2))/(f(x1)-f(x2));
        i = i+1;
        % adding the iteration info the the output set.
        iterations =[iterations;[i x1 x3 x2 abs(x3-x2) toc]];
    end
    fileID = fopen('outputSecant.txt','wt');
         fprintf(fileID,'%6s %12s %14s %14s %30s %12s\r\n','i', 'x1', 'x2','x3', 'error','time');
         for i = 1:size(iterations)
            fprintf(fileID,'%15f %12f  %12f %12f %17f %22f\r\n',iterations(i,:));
         end
     fclose(fileID);
end

