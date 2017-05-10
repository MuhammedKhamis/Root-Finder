function [table] = Birge_Vieta(func,x0,tolerance,maxIterations)
%{
matrix
(1)iterations
(2) power from maximum power to 0
(3) a
(4) b
(5) c
(6) x
(7) error
(8) time
%}
tic;
help=parsing(func,x0);
hornerMatrix=help;
flag=1;
fxIndex=help(1,2)+1;
if (help(fxIndex-1,5)==0)
    table='Error division by 0';
else
    numOfRows=fxIndex;
    previous=x0;
    next=previous-(help(fxIndex,4)/help(fxIndex-1,5));
    error=next-previous;
    previous=next;
    iterations=1;
    flag2=0;
    while (flag2==0&&iterations<maxIterations&&flag==1)
        if (abs(error)<=tolerance)
            flag2=1;
        end
           counter=2;
           help(1,1)=iterations;
           help(1,6)=previous;
           help(1,7)=error;
           time=toc;
           help(1,8)=time;
        while(counter<=numOfRows)
           help(counter,1)=iterations;
           help(counter,6)=previous;
           help(counter,4)=help(counter,3)+previous*help(counter-1,4);
           help(counter,5)=help(counter,4)+previous*help(counter-1,5);
           help(counter,7)=error;
           time=toc;
           help(counter,8)=time;
           counter=counter+1;
        end
        if (help(fxIndex-1,5)==0)
            table='Error division by 0';
            flag=0;
        else
            help(fxIndex,5)=help(fxIndex-1,5);
            hornerMatrix=[hornerMatrix;help];
            next=previous-(help(fxIndex,4)/help(fxIndex-1,5));
            error=next-previous;
            previous=next;
            iterations=iterations+1; 
        end
       
    end
    if (flag==1)
         table=hornerMatrix;
         fileID = fopen('outputBirgeVieta.txt','wt');
         fprintf(fileID,'%6s %35s %12s %12s %12s %12s %12s %12s\r\n','iterations', 'power from maximum power to 0', 'a','b','c','x','error','time');
         for i = 1:size(table)
            fprintf(fileID,'%6f %16f %38f %12f %12f %12f %12f %12f\r\n',table(i,:));
         end
         fclose(fileID);
    end
        
end

end

