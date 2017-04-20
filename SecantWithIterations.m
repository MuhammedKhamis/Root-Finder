function [x1, x2, x3 ] = SecantWithIterations( f,x1,x2,iterations)
    f = inline(f);
    x3 = x2 - (f(x2)*(x1-x2))/(f(x1)-f(x2));
    for i = 2:iterations
        x1 = x2;
        x2 = x3;
        x3 = x2 - (f(x2)*(x1-x2))/(f(x1)-f(x2));
    end
end

