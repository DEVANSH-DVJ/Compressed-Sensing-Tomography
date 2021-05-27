function  res = CCS2(N, M, angles1, angles2)

res.adjoint = 0;
res.N2 = N * N;
res.MQ = M * size(angles1, 2);
res.RU1 = RU(N, M, angles1);
res.RU2 = RU(N, M, angles2);
res.RU1t = res.RU1';
res.RU2t = res.RU2';

% Register this variable as a CCS2 class
res = class(res, 'CCS2');
