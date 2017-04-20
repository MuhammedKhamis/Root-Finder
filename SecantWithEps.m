function x3 = SecantWithEps( f,x1,x2,eps )
    f = inline(f);
    x3 = x2 - (f(x2)*(x1-x2))/(f(x1)-f(x2));
    while abs(f(x3)) > eps 
        x1 = x2;
        x2 = x3;
        x3 = x2 - (f(x2)*(x1-x2))/(f(x1)-f(x2));
    end
end

