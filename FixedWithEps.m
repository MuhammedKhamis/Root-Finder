function [ x2 ] = FixedWithEps( f,x1,eps )
    syms x;
    f = inline(f + x);
    x2 = f(x1);
    while abs(x2) > eps
        x1 = x2;
        x2 = f(x1);
    end
end

