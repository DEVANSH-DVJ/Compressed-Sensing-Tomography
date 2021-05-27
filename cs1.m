clc;
clear;
close all;

%% Add L1_LS for solving l1-regularized least squares problem
addpath("l1_ls_matlab");

%% Read the slices
slice = cast(imread("data/slice_50.png"), 'double');

%% Padding
H = size(slice, 1);
W = size(slice, 2);
N = max(W, H);
pad = abs(W - H)/2;

orig = zeros(N, N, 'double');
if W > H
    orig(pad:H+pad-1, :) = slice;
else
    orig(:, pad:W+pad-1) = slice;
end
clear H W pad slice;

%% Angles of Projection
angles = 0:10:170; % Uniformly spaced angles
Q = size(angles, 2);

%% Create Tomographic Projections
tomo = radon(orig, angles);
M = size(tomo, 1);

%% Reconstruction using CS
% Set lambda
lambda = 10;

tic;
% Create object of Forward matrix
A  = RU(N, M, angles);

% Reshape tomographic projections
y = reshape(tomo, [M*Q 1]);

% Perform Sparse Recovery
[x, status] = l1_ls(A, A', M*Q, N*N, y, lambda);

% Reconstructed slice from coeffecients
recon = idct2(reshape(x, [N N]));

%% Recast
orig = cast(orig, 'uint8');
recon = cast(recon, 'uint8');

%% Save the result and Compute RMSE (Relative Mean Squared Error)
% Display and Save the reconstructed slice
figure;
imshow([orig, recon]);
imwrite([orig, recon], sprintf('results/cs1_%i.png', lambda));
% RMSE of the reconstructed slice
fprintf('RMSE : %f\n', ...
    (norm(double(recon) - double(orig), 'fro')^2 / norm(double(orig), 'fro')^2));

% Evaluate the time taken
toc;
