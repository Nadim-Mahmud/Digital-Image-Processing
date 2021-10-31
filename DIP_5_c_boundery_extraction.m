clc;
close all;
clear all;

img = imread('assets/boundary.png');
img = rgb2gray(img);
img = imresize(img, [512 512]);


[rows columns] = size(img);

bimg = im2bw(img);

%mask must be odd
mask_dim = 10;
se = ones(mask_dim, mask_dim); % structuring element

erosion_img = erosion(img, se);
boundary_img = bimg - erosion_img;


subplot(2,2,1);
imshow(bimg);
title('Original image');

subplot(2,2,2);
imshow(boundary_img);
title('After Boundary extraction');

    

