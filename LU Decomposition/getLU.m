function [L U err steps] = getLU(A)
% This method is used to get the L and U matrcies of the matrix A
%Input:     
%           A    Input Matrix which will be decomposite to L and U
%Output:
%           L     Lower triangle matrix from decomposition of A
%           U     Upper triangle matrix from decomposition of A
%           err   error flag that indicate any division by 0 in the decomposition
%           steps 2D array that tells the status of L and U matrices after each elemination
    sizes = size(A);
    err = 0;
    steps = [];
    if(sizes(1) == sizes(2))
       L = eye(sizes(1));
       U = A;
       for i = 1 : sizes(1)
           for j = i+1: sizes(1)
               tmp = U(j,i)/U(i,i);
               if(isnan(tmp) || isinf(tmp))
                U = NaN;
                L = NaN;
                err = 1;
                return;
               end
               L(j,i)= tmp;
               U(j,:) = U(j,:)-tmp*U(i,:);
               steps = [steps; [L U]];
           end
       end
    end
end