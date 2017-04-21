function [table] = Birge_Vieta(func,x0,tolerance,maxIterations)
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
    while (abs(error)>tolerance&&iterations<maxIterations && flag==1)
           counter=2;
           help(1,1)=iterations;
           help(1,6)=previous;
        while(counter<=numOfRows)
           help(counter,1)=iterations;
           help(counter,6)=previous;
           help(counter,4)=help(counter,3)+previous*help(counter-1,4);
           help(counter,5)=help(counter,4)+previous*help(counter-1,5);
           counter=counter+1;
        end
        if (help(fxIndex-1,5)==0)
            table='Error division by 0';
            flag=0;
        else
            help(fxIndex,5) = help(fxIndex-1,5);
            hornerMatrix = [hornerMatrix;help];
            next=previous-(help(fxIndex,4)/help(fxIndex-1,5));
            error=next-previous;
            previous=next;
            iterations=iterations+1; 
        end
       
    end
    if (flag==1)
         table=hornerMatrix;
    end
        
end

end

