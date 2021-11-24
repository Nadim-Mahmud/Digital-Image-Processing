clc;
close all;
clear all;

img = imread('../assets/boundary.png');
img = rgb2gray(img);
img = imresize(img, [512 512]);


[rows columns] = size(img);

img = im2bw(img);

%mask must be odd
mask_dim = 11;
se = ones(mask_dim, mask_dim); % structuring element

erosion_img = imerode(img, se);
boundary_img = img - erosion_img;


subplot(2,2,1);
imshow(img);
title('Original image');

subplot(2,2,2);
imshow(boundary_img);
title('After Boundary extraction');

    

