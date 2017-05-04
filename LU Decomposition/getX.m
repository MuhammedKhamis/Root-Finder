function [x] = getX(U,y)
    sizesOfY = size(y);
    sizesOfU = size(U);
    if(sizesOfY(2) == 1 && sizesOfY(1)== sizesOfU(1) && sizesOfU(1)== sizesOfU(2))
       x = zeros(size(y));
       for i = sizesOfY(1) : -1 : 1
           tmp = y(i);
           for j = i+1 : sizesOfY(1)
               tmp = tmp - U(i,j)*x(j);
           end
           x(i) = tmp/U(i,i);
       end
    end
end