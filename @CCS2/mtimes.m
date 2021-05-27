function res = mtimes(A,x)

if A.adjoint == 0 % A*x
    x1 = x(1 : A.N2);
    x2 = x(A.N2 + 1 : 2 * A.N2);
    x = A.RU1 * x1;
    y = A.RU2 * x1 + A.RU2 * x2;
    res = [x; y;];
else % At*x
    x1 = x(1 : A.MQ);
    x2 = x(A.MQ + 1 : 2 * A.MQ);
    x = A.RU1t * x1;
    y = A.RU2t * x2;
    res = [x+y; y;];
end
