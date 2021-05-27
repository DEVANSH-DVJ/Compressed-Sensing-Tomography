
function res = mtimes(A,x)

    if A.adjoint == 0
        % A*x
        x1 = x(1 : A.N2);
        x2 = x(A.N2 + 1 : 2 * A.N2);
        x3 = x(2 * A.N2 + 1 : 3 * A.N2);
        res1 = A.RU1 * x1 + A.RU1 * x2;
        res2 = A.RU2 * x1;
        res3 = A.RU3 * x1 + A.RU3 * x3;
        res = [res1; res2; res3;];
    else
        % At*x
        x1 = x(1 : A.MQ);
        x2 = x(A.MQ + 1 : 2 * A.MQ);
        x3 = x(2 * A.MQ + 1 : 3 * A.MQ);
        res1 = A.RU1t * x1;
        res2 = A.RU2t * x2;
        res3 = A.RU3t * x3;
        res = [res1 + res2 + res3; res1; res3;];
    end

end
