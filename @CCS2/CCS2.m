
function res = CCS2(N, M, angles1, angles2)
    % Input:
    %   N       : Width of slice
    %   M       : Number of tomographic displacements
    %   angles1 : Angle of projections for slice 1
    %   angles2 : Angle of projections for slice 2
    % Output:
    %   res : Object of CCS2 class
    % Brief:
    %   Constructor of CCS2 class
    % Variables:
    %   CCS2.adjoint  : 1 if transpose else 0
    %   CCS2.N2       : N * N
    %   CCS2.MQ       : M * size(angles1, 2)
    %   CCS2.R1U      : Object of RU class for slice 1
    %   CCS2.R2U      : Object of RU class for slice 2

    res.adjoint = 0;
    res.N2 = N * N;
    res.MQ = M * size(angles1, 2);
    res.R1U = RU(N, M, angles1);
    res.R2U = RU(N, M, angles2);

    % Register this variable as a CCS2 class
    res = class(res, 'CCS2');

end
