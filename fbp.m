clc;
clear;
close all;

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
imshow([orig, recon]);
imwrite([orig, recon], 'results/fbp.png');
% RMSE of the reconstructed slice
fprintf('RMSE : %f\n', (norm(double(recon) - double(orig), 'fro')^2 / norm(double(orig), 'fro')^2));

% Evaluate the time taken
toc;
