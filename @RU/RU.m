
function res = RU(N, M, angles)
    % Input:
    %   N      : Width of slice
    %   M      : Number of tomographic displacements
    %   angles : Angle of projections
    % Output:
    %   res : Object of RU class
    % Brief:
    %   Constructor of RU class
    % Variables:
    %   RU.adjoint : 1 if transpose else 0
    %   RU.N       : N
    %   RU.M       : M
    %   RU.angles  : angles
    %   RU.Q       : size(angles, 2)

    res.adjoint = 0;
    res.N = N;
    res.M = M;
    res.angles = angles;
    res.Q = size(angles, 2);

    % Register this variable as a RU class
    res = class(res, 'RU');

end
