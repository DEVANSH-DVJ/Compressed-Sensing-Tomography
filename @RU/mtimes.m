
function res = mtimes(A, x)
    % Input:
    %   A : Object of RU class
    %   x : coefficients of slice of size A.N*A.N or
    %        vectorized slice of size A.M*A.Q
    % Output:
    %   res : if not transpose, (R*U) * x
    %         if transpose, (U'*R') * x
    % Brief:
    %   Overloads matrix multiplication operator of RU class

    if A.adjoint == 0
        % A*x
        res = reshape(radon(idct2(reshape(x, [A.N A.N])), A.angles), [A.M*A.Q 1]);
    else
        % At*x
        res = reshape(dct2(iradon(reshape(x, [A.M A.Q]), A.angles, A.N)), [A.N*A.N 1]);
    end

end
