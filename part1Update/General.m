function [Allroots] = General(func,intervalLen,eps,start ,endInterval,handles)

     %points = linspace(start,endInterval,abs(start - endInterval)/intervalLen);
     points = start:intervalLen:endInterval;
     out = [];
     %temp = func;
     f = subs(func,points);
     [r,c] = size(f);
     for i = 1:c - 1
            if(sign(f(i)) ~= sign(f(i+1)))
                %call bisection that return sigle root
                 %root = BiSection2(temp,points(i),points(i+1),eps ,
                 %maxIteration); 
                 root = Brent(func,points(i),points(i+1));
                %find multiplicity.
                [row,co] = size(out);
                if(row ~= 0)
                    if(root == out(end,3))
                        continue;
                    end
                end
                disp(root);
                 multiplicity = findMultiplicity(f,root,eps);
                %store root according to its multiplicity.
                 
                    out = [out ;points(i) points(i+1) root multiplicity];
                 
            end
     end
    Allroots = out;
end
