function [y] = getY(L,b)
    sizesOfB = size(b);
    sizesOfL = size(L);
    if(sizesOfB(2) == 1 && sizesOfB(1)== sizesOfL(1) && sizesOfB(1)== sizesOfL(2))
       y = zeros(size(b));
       for i = 1 : sizesOfB(1)
           tmp = b(i);
           for j = 1 : i
           tmp = tmp - L(i,j)*y(j);
           end
           y(i) = tmp;
       end
    end
end