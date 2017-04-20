function [ x1, x2 ] = FixedWithIteration(f,x1,iterations)
    syms x;
    f = inline(f + x);
    x2 = f(x1);
    for i = 2 :iterations
        x1 = x2;
        x2 = f(x1);
    end
end

