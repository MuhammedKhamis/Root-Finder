function [iterations] = FixedWithEps(f,x1,eps , MaxNumberOfIterations)
    
    if ~exist('MaxNumberOfIterations', 'var')
        MaxNumberOfIterations = 50;
    end
    if ~exist('eps', 'var')
        eps = 0.00001;
    end

    syms x;
    f = sym(f);
    f = taylor(f);
    f = f-x;
    f = inline(f);
    i = 1;
    tic;
    x2 = f(x1);
    iterations=[i x1 x2 abs(((x2-x1)/x2))*100 toc];
    while abs(x2) > eps && i < MaxNumberOfIterations
        x1 = x2;
        x2 = f(x1);
        i = i + 1;
        iterations = [iterations; [i x1 x2 abs(((x2-x1)/x2))*100 toc]];
    end
end

