clc;
clear;
close all;

addpath("l1_ls_matlab");

% Reading
slice1 = cast(imread("data/slice_53.png"),'double');
slice2 = cast(imread("data/slice_54.png"),'double');
slice3 = cast(imread("data/slice_55.png"),'double');
H = size(slice1, 1);
W = size(slice1, 2);
% figure; imshow(cast(slice1, 'uint8'));
% figure; imshow(cast(slice2, 'uint8'));
% figure; imshow(cast(slice3, 'uint8'));

% Padding
orig1 = zeros(W,W,'double');
orig2 = zeros(W,W,'double');
orig3 = zeros(W,W,'double');
orig1(18:17+H, :) = slice1;
orig2(18:17+H, :) = slice2;
orig3(18:17+H, :) = slice3;
N = W;
% figure; imshow(cast(orig1, 'uint8'));
% figure; imshow(cast(orig2, 'uint8'));
% figure; imshow(cast(orig3, 'uint8'));
clear H W slice1 slice2 slice3;

% Angles of Projection
angles1 = 0:10:170; % Uniformly spaced angles
angles2 = 3:10:173; % Uniformly spaced angles
angles3 = 6:10:176; % Uniformly spaced angles
Q = size(angles1, 2);

% Creating Tomographic Projections
tomo1 = radon(orig1, angles1);
tomo2 = radon(orig2, angles2);
tomo3 = radon(orig3, angles3);
M = size(tomo1, 1);

% Creating objects of Forward matrix
A  = CCS3(N, M, angles1, angles2, angles3);
At = A';
y = [reshape(tomo1, [M*Q 1]); reshape(tomo2, [M*Q 1]);  reshape(tomo3, [M*Q 1]);];

% Reconstruction using 3 slice Coupled CS
% lambda_max = find_lambdamax_l1_ls(At,y);
lambda = 1;
[x, status] = l1_ls(A, At, 3*M*Q, 3*N*N, y, lambda);
recon1 = idct2(reshape(x(1 : N*N), [N N]));
recon2 = idct2(reshape(x(1 : N*N) + x(N*N+1 : 2*N*N), [N N]));
recon3 = idct2(reshape(x(1 : N*N) + x(2*N*N+1 : 3*N*N), [N N]));

% Result
figure; imshow(cast([orig1 recon1; orig2 recon2; orig3 recon3;], 'uint8'));
imwrite(cast([orig1 recon1; orig2 recon2; orig3 recon3;], 'uint8'), 'results/q2d_1.png');
