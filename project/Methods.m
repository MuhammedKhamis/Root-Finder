classdef Methods
    %METHODS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        left
        right
        intialGussOne
        intialGussTwo
        f
    end
    
    methods
        function root = Bisection(obj,iterations,precision,counter)
            if(counter > iterations)
                root = 'undefined';
                return
            end
            valueOfLower = subs(obj.f,obj.left);
            valueOfUpper = subs(obj.f,obj.right);
            if(valueOfLower * valueOfUpper >0)
                root = 'undefined';
                return
            end

            mid = (obj.left + obj.right) / 2;
            valueOfMid = subs(obj.f,mid);

            if(abs(valueOfMid - 0)  <= precision)
                root = mid;
                return
            end
            if(valueOfLower * valueOfMid< 0)
                obj.right = mid;
                counter = counter + 1;
                root = Bisection(obj,iterations,precision,counter);
            elseif(valueOfUpper * valueOfMid < 0)
                obj.left = mid;
                counter = counter + 1;
                root = Bisection(obj,iterations,precision,counter);
            end
            
        end
    end
end

