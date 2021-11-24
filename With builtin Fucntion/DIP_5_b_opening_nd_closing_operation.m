clc;
close all;
clear all;

img = imread('../assets/fingerprint.png');
img = rgb2gray(img);
img = imresize(img, [512 512]);
img = im2bw(img);

[rows columns] = size(img);

%mask must be odd
mask_dim = 5;
se = strel('rectangle', [mask_dim mask_dim]); % structuring element

erosion_img = imerode(img, se);
opening = imdilate(erosion_img, se);

dilation_img = imdilate(opening, se);
closing = imerode(dilation_img, se);


subplot(2,2,1);
imshow(img);
title('Before Erosion');

subplot(2,2,2);
imshow(opening);
title('After opening');


subplot(2,2,3);
imshow(closing);
title('After closing');


    

