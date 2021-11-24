clc;
close all;
clear all;

img = imread('assets/fingerprint.png');
img = rgb2gray(img);
img = imresize(img, [512 512]);


[rows columns] = size(img);

%mask must be odd
mask_dim = 5;
se = ones(mask_dim, mask_dim); % structuring element

erosion_img = erosion(img, se);
opening = dilation(erosion_img, se);

dilation_img = dilation(opening, se);
closing = erosion(dilation_img, se);


subplot(2,2,1);
imshow(im2bw(img));
title('Before Erosion');

subplot(2,2,2);
imshow(opening);
title('After opening');


subplot(2,2,3);
imshow(closing);
title('After closing');


    

