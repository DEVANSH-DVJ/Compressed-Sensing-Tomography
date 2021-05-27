
function res = RU(N, M, angles)
    % Input:
    %   N      : Width of slice
    %   M      : Number of tomographic displacements
    %   angles : Angle of projections
    % Output:
    %   res : Object of RU class
    % Brief:
    %   Constructor of RU class

    res.adjoint = 0; % 1 if transpose
    res.N = N; % Width of slice
    res.M = M; % Number of tomographic displacements
    res.angles = angles; % Angle of projections
    res.Q = size(angles, 2); % Number of angle of projections

    % Register this variable as a RU class
    res = class(res, 'RU');

end
