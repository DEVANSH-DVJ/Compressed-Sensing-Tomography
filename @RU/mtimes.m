
function res = mtimes(A,x)
    % Input:
    %   A : Object of RU class
    % Output:
    %   res : if not transpose, vectorized (radon transform of DCT*x)
    %         if transpose, vectorized (inverse radon transform of x)*DCT'
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
