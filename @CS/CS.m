
function res = CS(N, M, angles)
    % Input:
    %   N      : Width of slice
    %   M      : Number of tomographic displacements
    %   angles : Angle of projections
    % Output:
    %   res : Object of CS class
    % Brief:
    %   Constructor of CS class
    % Variables:
    %   CS.adjoint : 1 if transpose else 0
    %   CS.N       : N
    %   CS.M       : M
    %   CS.angles  : angles
    %   CS.Q       : size(angles, 2)

    res.adjoint = 0;
    res.N = N;
    res.M = M;
    res.angles = angles;
    res.Q = size(angles, 2);

    % Register this variable as a CS class
    res = class(res, 'CS');

end
