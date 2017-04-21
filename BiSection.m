function [numberofIterations , executionTime,iterations, root,persesion] = BiSectionWithEps(f,l,u,eps , MaxNumberOfIterations)
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
     i=0;
     mid1= -1;
     iterations =[a b mid];
     tic;
    while abs(f(mid)) > eps && i < MaxNumberOfIterations 
        fL = f(a);
        fM = f(mid);
        if( fL * fM < 0)
          b = mid;
        else
          a = mid;
        end
        mid1 = mid;
        mid = (a+b)/2;
        iterations = [iterations;[a b mid]];
        i=i+1;
    end
    t = toc;
    numberofIterations = i;
    executionTime = t;
    root = mid;
    persesion = (mid-mid1);
end