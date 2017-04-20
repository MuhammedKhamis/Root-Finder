function [a, mid , b ] = BiSectionWithIterations(f,l,u,iterations) 
    f = inline(f);
     if(f(l) > 0 && f(u) > 0)
        % Throw Execption
     end
     if(f(l) < 0 && f(u) < 0)
        % Throw Execption
     end 
     a = l;
     b = u;
     mid = (a+b)/2;
    for i = 2:iterations
        fL = f(a);
        fM = f(mid);
        if( fL * fM < 0)
          b = mid;
        else
          a = mid;
        end
        mid = (a+b)/2;
    end

end