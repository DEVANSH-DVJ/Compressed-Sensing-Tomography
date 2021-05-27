clc;
clear;
close all;

%% Read the slices
slice = cast(imread("data/slice_50.png"), 'double');

%% Constants
H = size(slice, 1);
W = size(slice, 2);

%% Padding
orig = zeros(W, W, 'double');
orig(18:17+H, :) = slice;
N = W;
clear H W slice;

%% Angles of Projection
angles = 0:10:170; % Uniformly spaced angles

%% Create Tomographic Projections
tomo = radon(orig, angles);

%% Filtered Back-projection
tic;
recon = iradon(tomo, angles, N); % Ram-Lak filter by default

%% Recast
orig = cast(orig, 'uint8');
recon = cast(recon, 'uint8');

%% Save the result and Compute RMSE (Relative Mean Squared Error)
% Display and Save the reconstructed slice
figure;
imshow(cast([orig, recon], 'uint8'));
imwrite(cast([orig, recon], 'uint8'), 'results/q2a.png');
% RMSE of the reconstructed slice
fprintf('RMSE : %f\n', (norm(double(recon) - double(orig))^2 / norm(double(orig))^2));

% Evaluate the time taken
toc;
