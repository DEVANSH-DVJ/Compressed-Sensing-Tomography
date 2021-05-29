
function res = CCS3(N, M, angles1, angles2, angles3)
    % Input:
    %   N       : Width of slice
    %   M       : Number of tomographic displacements
    %   angles1 : Angle of projections for slice 1
    %   angles2 : Angle of projections for slice 2
    %   angles3 : Angle of projections for slice 3
    % Output:
    %   res : Object of CCS3 class
    % Brief:
    %   Constructor of CCS3 class
    % Variables:
    %   CCS3.adjoint  : 1 if transpose else 0
    %   CCS3.N2       : N * N
    %   CCS3.MQ       : M * size(angles1, 2)
    %   CCS3.R1U      : Object of CS class for slice 1
    %   CCS3.R2U      : Object of CS class for slice 2
    %   CCS3.R3U      : Object of CS class for slice 3

    res.adjoint = 0;
    res.N2 = N * N;
    res.MQ = M * size(angles1, 2);
    res.R1U = CS(N, M, angles1);
    res.R2U = CS(N, M, angles2);
    res.R3U = CS(N, M, angles3);

    % Register this variable as a CCS3 class
    res = class(res, 'CCS3');

end
