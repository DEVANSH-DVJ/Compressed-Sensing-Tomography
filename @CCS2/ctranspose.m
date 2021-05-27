
function res = ctranspose(A)
    % Input:
    %   A : Object of CCS2 class
    % Output:
    %   res : Flip adjoint value of A
    % Brief:
    %   Overloads transpose operator of CCS2 class

    A.adjoint = xor(A.adjoint, 1);
    res = A;

end
