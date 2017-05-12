function [pos A b] = pivot(A,pos,scale,start,n,b)
    p = start;
    big = abs(A(pos(start),start)/scale(pos(start)));
    for j = start : n
        tmp = abs(A(pos(j),start)/scale(pos(j)));
        if tmp > big 
            p = j;
            big = tmp;
        end
    end
    tmp = pos(p);
    row = A(pos(p),:);
    tmp2 = b(pos(p));
    
    b(pos(p)) = b(pos(start));
    A(pos(p),:) = A(pos(start),:);
    pos(p) = pos(start);
    
    b(pos(start)) = tmp2;
    A(pos(start),:)= row;
    pos(start)=tmp;
    
end