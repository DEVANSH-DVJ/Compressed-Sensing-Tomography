
function res = mtimes(A,x)
    % Input:
    %   A : Object of CCS2 class
    %   x : coefficients of slice of size 2*A.N*A.N or
    %        vectorized slice of size 2*A.M*A.Q
   % Output:
    %   res : if not transpose, [R1*U 0; R2*U R2*U;] * x
    %         if transpose, [U'*R1' U'*R2'; 0 U'*R1';] * x
    % Brief:
    %   Overloads matrix multiplication operator of CCS2 class

    if A.adjoint == 0
        % A*x
        x1 = x(1 : A.N2);
        x2 = x(A.N2 + 1 : 2 * A.N2);
        res1 = A.R1U * x1;
        res2 = A.R2U * x1 + A.R2U * x2;
        res = [res1; res2;];
    else
        % At*x
        x1 = x(1 : A.MQ);
        x2 = x(A.MQ + 1 : 2 * A.MQ);
        res1 = A.R1U' * x1;
        res2 = A.R2U' * x2;
        res = [res1 + res2; res2;];
    end

end
