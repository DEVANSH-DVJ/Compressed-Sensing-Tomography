function res = mtimes(A,x)

if A.adjoint == 0 % A*x
    res = reshape(radon(idct2(reshape(x, [A.N A.N])), A.angles), [A.M*A.Q 1]);
else % At*x
    res = reshape(dct2(iradon(reshape(x, [A.M A.Q]), A.angles, A.N)), [A.N*A.N 1]);
end
