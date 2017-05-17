function root = BiSectionForGeneralMethod(f,l,u,eps , MaxNumberOfIterations)
    if ~exist('MaxNumberOfIterations', 'var')
        MaxNumberOfIterations = 50;
    end
    if ~exist('eps', 'var')
        eps = 0.00001;
    end
    f = inline(f);
     a = l;
     b = u;
     tic;
     mid = (a+b)/2;
     i=1;
     mid1= -1;
    while abs(f(mid)) > eps && i < MaxNumberOfIterations 
        fL = f(a);
        fM = f(mid);
        if( fL * fM < 0)
          b = mid;
        else
          a = mid;
        end
        mid1 = mid;
        mid = (a+b)/2;
        i=i+1;
    end
    root = mid;
     %fileID = fopen('outputBisection.txt','wt');
      %   fprintf(fileID,'%10s %15s %12s %12s %14s %12s\r\n','i' ,'a' ,'b' ,'mid' ,'error', 'time');
       %  for i = 1:size(iterations)
        %    fprintf(fileID,'%17f %12f %12f %12f %12f %12f\r\n',iterations(i,:));
         %end
     %fclose(fileID);
end