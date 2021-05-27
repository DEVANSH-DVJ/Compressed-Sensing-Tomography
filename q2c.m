clc;
clear;
close all;

%% Add L1_LS for solving l1-regularized least squares problem
addpath("l1_ls_matlab");

%% Read the slices
slice1 = cast(imread("data/slice_51.png"), 'double');
slice2 = cast(imread("data/slice_52.png"), 'double');

%% Padding
H = size(slice1, 1);
W = size(slice1, 2);
N = max(W, H);
pad = abs(W - H)/2;

orig1 = zeros(N, N, 'double');
orig2 = zeros(N, N, 'double');
if W > H
    orig1(pad:H+pad-1, :) = slice1;
    orig2(pad:H+pad-1, :) = slice2;
else
    orig1(:, pad:W+pad-1) = slice1;
    orig2(:, pad:W+pad-1) = slice2;
end
clear H W pad slice1 slice2;

%% Angles of Projection
angles1 = 0:10:170; % Uniformly spaced angles
angles2 = 5:10:175; % Uniformly spaced angles
Q = size(angles1, 2);

%% Create Tomographic Projections
tomo1 = radon(orig1, angles1);
tomo2 = radon(orig2, angles2);
M = size(tomo1, 1);

%% Reconstruction using 2 slice Coupled CS
% Set lambda
lambda = 1;

tic;
% Create object of Forward matrix
A  = CCS2(N, M, angles1, angles2);

% Reshape and combine tomographic projections
y = [reshape(tomo1, [M*Q 1]); reshape(tomo2, [M*Q 1]);];

% Perform Sparse Recovery
[x, status] = l1_ls(A, A', 2*M*Q, 2*N*N, y, lambda);

% Reconstructed slice from coeffecients
recon1 = idct2(reshape(x(1 : N*N), [N N]));
recon2 = idct2(reshape(x(1 : N*N) + x(N*N+1 : 2*N*N), [N N]));

%% Recast
orig1 = cast(orig1, 'uint8');
orig2 = cast(orig2, 'uint8');
recon1 = cast(recon1, 'uint8');
recon2 = cast(recon2, 'uint8');

%% Save the result and Compute RMSE (Relative Mean Squared Error)
% Display and Save the reconstructed slices
figure;
imshow([orig1 recon1; orig2 recon2;]);
imwrite([orig1 recon1; orig2 recon2;], sprintf('results/q2c_%i.png', lambda));
% RMSE of the reconstructed slices
fprintf('RMSE of slice 1 : %f\n', ...
    (norm(double(recon1) - double(orig1), 'fro')^2 / norm(double(orig1), 'fro')^2));
fprintf('RMSE of slice 2 : %f\n', ...
    (norm(double(recon2) - double(orig2), 'fro')^2 / norm(double(orig2), 'fro')^2));
fprintf('RMSE : %f\n', ...
    (norm(double([recon1, recon2]) - double([orig1, orig2]), 'fro')^2 / ...
        norm(double([orig1, orig2]), 'fro')^2));

% Evaluate the time taken
toc;
