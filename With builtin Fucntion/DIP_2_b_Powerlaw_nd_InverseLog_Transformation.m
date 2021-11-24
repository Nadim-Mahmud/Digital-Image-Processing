clc;
close all;
clear all;

img = imread('../assets/lenna.png');
img = rgb2gray(img);
img = imresize(img, [512 512]);


subplot(3,2,1);
imshow(img);
title('Original Image');

subplot(3,2,2);
imhist(img);
title('Original img Hist');


double_img = im2double(img);

[rows, columns] = size(img);

factor = 3;
L = 8;
c = (L-1)/log(L);

power_img = double_img.^factor;
ilog_img = exp(double_img).^(1/c) - 1;

subplot(3,2,3);
imshow(power_img);
title('PowerLaw Transformed Image');

subplot(3,2,4);
imhist(power_img);
title('PowerLaw Hist');

subplot(3,2,5);
imshow(ilog_img);
title('Inverse Log Transformed Image');

subplot(3,2,6);
imhist(ilog_img);
title('Inverse Log Transformed Image');