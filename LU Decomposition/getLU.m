function [L U] = getLU(A)
    sizes = size(A);
    if(sizes(1) == sizes(2))
       L = eye(sizes(1));
       U = A;
       for i = 1 : sizes(1)
           for j = i+1: sizes(1)
               tmp = U(j,i)/U(i,i);
               if(isnan(tmp) || isinf(tmp))
                U = NaN;
                L = NaN;
                return;
               end
               L(j,i)= tmp;
               U(j,:) = U(j,:)-tmp*U(i,:);
           end
       end
    end
end