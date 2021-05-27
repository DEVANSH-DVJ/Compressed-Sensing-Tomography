
function res = ctranspose(A)
    % Input:
    %   A : Object of RU class
    % Output:
    %   res : Flip adjoint value of A
    % Brief:
    %   Overloads transpose operator of RU class

    A.adjoint = xor(A.adjoint, 1);
    res = A;

end
