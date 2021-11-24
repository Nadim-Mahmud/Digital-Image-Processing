clc;
close all;
clear all;

img = imread('../assets/dog.jpg');
img = rgb2gray(img);
img = imresize(img, [512 512]);

[rows, columns] = size(img);


img = imnoise(img, 'gaussian');

mask_dim = 10; % mask dimention should be always odd
% average mask
mask = ones(mask_dim).*(1.0/(mask_dim*mask_dim));


avg_img = imfilter(img, mask);
median_img = medfilt2(img, [mask_dim mask_dim]);


subplot(2, 2, 1)
imshow(img);
title('Original Image');

subplot(2,2,2)
imshow(uint8(avg_img));
title('Average Image');

subplot(2,2,3)
imshow(uint8(median_img));
title('Median Image');
