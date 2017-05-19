function [ coefficients ] = parsing(str,x0)
if (str(1)~='-'&&str(1)~='+')
    func=strcat('+',str);
else
    func=str;
end
counter=1;
firstHelp=[0 0 0 0 0 x0 x0 0];
help=firstHelp;
flag=1;
while(counter<=length(func))
    if (func(counter)=='+'||func(counter)=='-')
        counter=counter+1;
        if (func(counter)=='x')
            value=1;
             if (func(counter-1)=='-')
                  value=value*-1;
             end
        else 
            temp=func(counter);
            i=counter;
             counter=counter+1;
            while(counter<=length(func)&&func(counter)~='x')
                temp=strcat(temp,func(counter));
                counter=counter+1;
            end
            value=str2double(temp);
            if (func(i-1)=='-')
                 value=value*-1;
            end   
        end
        if (counter<=length(func)&&func(counter)=='x')
            counter=counter+1;
            if(counter<=length(func)&&func(counter)=='^')
                counter=counter+1;
                power=str2double(func(counter));
            else
                power=1;
                counter=counter-1;
            end
        else
            power=0;
        end
        if (flag==1)
            maxPower=power;
            help(2)=power;
            help(3)=value;
            help(4)=value;
            help(5)=value;
            flag=0;
            counter2=2;
            while (counter2<=maxPower+1)
                help=[help;firstHelp];
                help(counter2,2)=maxPower-counter2+1;
                counter2=counter2+1;
            end
        end
        index=maxPower+1-power;
        help(index,3)=value;
    end
    counter=counter+1;
end
counter=2;
while(counter<=maxPower+1)
    help(counter,4)=help(counter,3)+(x0*help(counter-1,4));
    help(counter,5)=help(counter,4)+(x0*help(counter-1,5));
    counter=counter+1;
end
    help(maxPower+1,5)=help(maxPower,5);
    coefficients =help;
end

