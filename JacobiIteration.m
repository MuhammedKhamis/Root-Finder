function[table] = JacobiIteration(A, b, x0, iterations, error)
time = tic;
x1(1) = (b(1) - A(1,2) * x0(2) - A(1,3) * x0(3))/A(1,1);
x2(1) = (b(2) - A(2,1) * x0(1) - A(2,3) * x0(3))/A(2,2);
x3(1) = (b(3) - A(3,1) * x0(1) - A(3,2) * x0(2))/A(3,3);
er1(1) = 0;
er2(1) = 0;
er3(1) = 0;
table(1, 1) = 1;
table(1, 2) = x0(1);
table(1, 3) = x0(2);
table(1, 4) = x0(3);
table(1, 5) = x1(1);
table(1, 6) = x2(1);
table(1, 7) = x3(1);
table(1, 8) = er1(1);
table(1, 9) = er2(1);
table(1, 10) = er3(1);
table(1, 11) = toc(time);
for i = 2 : iterations
    time = tic;
    x1(i) = (b(1) - A(1,2) * x2(i - 1) - A(1,3) * x3(i - 1))/A(1,1);
    x2(i) = (b(2) - A(2,1) * x1(i - 1) - A(2,3) * x3(i - 1))/A(2,2);
    x3(i) = (b(3) - A(3,1) * x1(i - 1) - A(3,2) * x2(i - 1))/A(3,3);
    er1(i) = abs(x1(i) - x1(i - 1));
    er2(i) = abs(x2(i) - x2(i - 1));
    er3(i) = abs(x3(i) - x3(i - 1));
    table(i, 1) = i;
    table(i, 2) = x1(i - 1);
    table(i, 3) = x2(i - 1);
    table(i, 4) = x3(i - 1);
    table(i, 5) = x1(i);
    table(i, 6) = x2(i);
    table(i, 7) = x3(i);
    table(i, 8) = er1(i);
    table(i, 9) = er2(i);
    table(i, 10) = er3(i);
    table(i, 11) = toc(time);
    if (er1(i) < error) && (er2(i) < error) && (er3(i) < error)
       disp('Finished');
       break;
    end
end
disp(table);