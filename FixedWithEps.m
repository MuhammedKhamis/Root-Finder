function [numberofIterations , executionTime,iterations, root,persesion] = FixedWithEps(f,x1,eps , MaxNumberOfIterations)
    
    if ~exist('MaxNumberOfIterations', 'var')
        MaxNumberOfIterations = 50;
    end
    if ~exist('eps', 'var')
        eps = 0.00001;
    end

    syms x;
    f = inline(f + x);
    x2 = f(x1);
    i = 0;
    iterations=[x1 x2 ((x2-x1)/x2)];
    tic;
    while abs(x2) > eps && i < MaxNumberOfIterations
        x1 = x2;
        x2 = f(x1);
        iterations = [iterations; [x1 x2 ((x2-x1)/x2)]];
        i = i + 1;
    end
    executionTime = toc;
    root = x2;
    numberofIterations = i;
    persesion = x2-x1;
end

