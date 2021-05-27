clc;
clear;
close all;

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

% Creating Tomographic Projections
tomo = radon(orig, angles);

% Filtered Back-projection
recon = iradon(tomo, angles, N); % Ram-Lak filter by default

% Result
figure; imshow(cast([orig recon], 'uint8'));
imwrite(cast([orig recon], 'uint8'), 'results/q2a.png');
