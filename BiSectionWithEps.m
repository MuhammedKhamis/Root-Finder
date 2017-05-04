function [iterations] = BiSectionWithEps(f,l,u,eps , MaxNumberOfIterations)
    if ~exist('MaxNumberOfIterations', 'var')
        MaxNumberOfIterations = 50;
    end
    if ~exist('eps', 'var')
        eps = 0.00001;
    end
    f = inline(f);
     a = l;
     b = u;
     tic;
     mid = (a+b)/2;
     i=1;
     mid1= -1;
     iterations =[i a b mid 100 toc];
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
        i=i+1;
        iterations = [iterations;[i a b mid abs(((mid-mid1)/mid))*100 toc]];
    end
end