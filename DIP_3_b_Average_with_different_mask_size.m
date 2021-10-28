
clc;
close all;
clear all;

img = imread('assets/dog.jpg');
img = rgb2gray(img);
img = imresize(img, [512 512]);

[rows, columns] = size(img);

mask_dim1 = 3; % mask dimention should be always odd
mask1 = ones(mask_dim1, mask_dim1)*(1.0/(mask_dim1*mask_dim1));

mask_dim2 = 5; % mask dimention should be always odd
mask2 = ones(mask_dim2, mask_dim2)*(1.0/(mask_dim2*mask_dim2));

mask_dim3 = 7; % mask dimention should be always odd
mask3 = ones(mask_dim3, mask_dim3)*(1.0/(mask_dim3*mask_dim3));

avg_img1 = average_filter(img, mask1);
avg_img2 = average_filter(img, mask2);
avg_img3 = average_filter(img, mask3);



subplot(2, 2, 1)
imshow(img);
title('Original Image');

subplot(2,2,2)
imshow(uint8(avg_img1));
title('Average Image 3 X 3');


subplot(2,2,3)
imshow(uint8(avg_img2));
title('Average Image 5 X 5');


subplot(2,2,4)
imshow(uint8(avg_img3));
title('Average Image 7 X 7');
