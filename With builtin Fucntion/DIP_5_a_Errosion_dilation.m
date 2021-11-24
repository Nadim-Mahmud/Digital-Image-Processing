clc;
close all;
clear all;

img = imread('../assets/coins.jpg');
%img = rgb2gray(img);
img = imresize(img, [512 512]);
img = im2bw(img);

[rows columns] = size(img);

%mask must be odd
mask_dim = 11;

se = strel('rectangle', [mask_dim mask_dim]) % structuring element

eroted_img = imerode(img, se);
dilated_img = imdilate(img, se);



subplot(2,2,1);
imshow(img);
title('Original Image');

subplot(2,2,2);
imshow(eroted_img);
title('After Erosion');


subplot(2,2,3);
imshow(dilated_img);
title('After Dilation');


    

