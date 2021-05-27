
function res = mtimes(A,x)
    % Input:
    %   A : Object of CCS3 class
    %   x : coefficients of slice of size 3*A.N*A.N or
    %        vectorized slice of size 3*A.M*A.Q
   % Output:
    %   res : if not transpose, [R1*U R1*U 0; R2*U 0 0; R3*U 0 R3*U] * x
    %         if transpose, [U'*R1' U'*R2' U'*R3'; U'*R1' 0 0; 0 0 U'*R3'] * x
    % Brief:
    %   Overloads matrix multiplication operator of CCS3 class

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
