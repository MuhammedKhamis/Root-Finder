function mid = BiSectionWithEps(f,l,u,eps)
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
    while abs(f(mid)) > eps 
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