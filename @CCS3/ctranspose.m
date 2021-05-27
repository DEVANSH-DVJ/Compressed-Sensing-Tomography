
function res = ctranspose(A)
    % Input:
    %   A : Object of CCS3 class
    % Output:
    %   res : Flip adjoint value of A
    % Brief:
    %   Overloads transpose operator of CCS3 class

    A.adjoint = xor(A.adjoint, 1);
    res = A;

end
