function [y steps] = getY(L,b)
% This method is used to get the result of column matrix x using Forward Substitution.
%Input:
%           L     The lower triangle matrix.
%           b     The column matrix that contains the result values of the equations that there coefficient are in the L matrix.
%Output:    
%           y     The final matrix the contains the values of the variables.
%           steps 2D matrix where each column tells the values of the result x after each substitution.
    sizesOfB = size(b);
    sizesOfL = size(L);
    steps = [];
    if(sizesOfB(2) == 1 && sizesOfB(1)== sizesOfL(1) && sizesOfB(1)== sizesOfL(2))
       y = zeros(size(b));
       for i = 1 : sizesOfB(1)
           tmp = b(i);
           for j = 1 : i
           tmp = tmp - L(i,j)*y(j);
           end
           y(i) = tmp;
           steps= horzcat(steps,y);
       end
    end
end