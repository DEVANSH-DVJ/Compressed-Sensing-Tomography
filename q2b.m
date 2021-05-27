clc;
clear;
close all;

addpath("l1_ls_matlab");

% Reading
slice = cast(imread("data/slice_50.png"),'double');
H = size(slice, 1);
W = size(slice, 2);
% figure; imshow(cast(slice, 'uint8'));

% Padding
orig = zeros(W,W,'double');
orig(18:17+H, :) = slice;
N = W;
% figure; imshow(cast(orig, 'uint8'));
clear H W slice;

% Angles of Projection
angles = 0:10:170; % Uniformly spaced angles
Q = size(angles, 2);

% Creating Tomographic Projections
tomo = radon(orig, angles);
M = size(tomo, 1);

% Creating objects of Forward matrix
A  = RU(N, M, angles);
At = A';
y = reshape(tomo, [M*Q 1]);

% Reconstruction using CS
% lambda_max = find_lambdamax_l1_ls(At,y);
lambda = 1;
[x, status] = l1_ls(A, At, M*Q, N*N, y, lambda);
recon = idct2(reshape(x, [N N]));

% Result
figure; imshow(cast([orig recon], 'uint8'));
imwrite(cast([orig recon], 'uint8'), 'results/q2b_1.png');
