
function res = ctranspose(A)
    % Input:
    %   A : Object of CS class
    % Output:
    %   res : Flip adjoint value of A
    % Brief:
    %   Overloads transpose operator of CS class

    A.adjoint = xor(A.adjoint, 1);
    res = A;

end
