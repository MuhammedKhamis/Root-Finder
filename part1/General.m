function [Allroots] = General(func,intervalLen,eps,start ,endInterval)

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
                multiplicity = findMultiplicity(f,root,eps);
                disp('multiplicity');
                disp(multiplicity);
                disp('root');
                disp(root);
                %store root according to its multiplicity.
                for j = 1:multiplicity
                    out = [out ;root];
                end
            end
     end
    Allroots = out;
    
end
