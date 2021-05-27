
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
    %   CCS3.RU1      : Object of RU class for slice 1
    %   CCS3.RU2      : Object of RU class for slice 2
    %   CCS3.RU3      : Object of RU class for slice 3
    %   CCS3.RU1t     : Object of RU class (RU1')
    %   CCS3.RU2t     : Object of RU class (RU2')
    %   CCS3.RU3t     : Object of RU class (RU3')

    res.adjoint = 0;
    res.N2 = N * N;
    res.MQ = M * size(angles1, 2);
    res.RU1 = RU(N, M, angles1);
    res.RU2 = RU(N, M, angles2);
    res.RU3 = RU(N, M, angles3);
    res.RU1t = res.RU1';
    res.RU2t = res.RU2';
    res.RU3t = res.RU3';

    % Register this variable as a CCS3 class
    res = class(res, 'CCS3');

end
