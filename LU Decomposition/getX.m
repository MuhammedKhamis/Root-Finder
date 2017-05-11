function [x err steps] = getX(U,y)
% This method is used to get the result of column matrix x using Backward Substitution.
%Input:
%           U     The upper triangle matrix.
%           y     The column matrix that contains the result values of the equations that there coefficient are in the U matrix.
%Output:    
%           x     The final matrix the contains the values of the variables.
%           err   error flag indicates of something wrong happened during the calculations.
%           steps 2D matrix where each column tells the values of the result x after each substitution.
    sizesOfY = size(y);
    sizesOfU = size(U);
    err = 0;
    steps = [];
    if(sizesOfY(2) == 1 && sizesOfY(1)== sizesOfU(1) && sizesOfU(1)== sizesOfU(2))
       x = zeros(size(y));
       for i = sizesOfY(1) : -1 : 1
           tmp = y(i);
           for j = i+1 : sizesOfY(1)
               tmp = tmp - U(i,j)*x(j);
           end
           tmp = tmp/U(i,i);
           if(isnan(tmp) || isinf(tmp))
                err = 1;
                return;
           end
           x(i) = tmp;
           steps = horzcat(steps,x);
       end
    end
end