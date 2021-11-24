clc;
close all;
clear all;

img = imread('../assets/dog.jpg');
img = rgb2gray(img);
%img = rgb2gray(img);
img = imresize(img, [512 512]);

img = imnoise(img, 'gaussian');

D0 = 20;
butter_img = butterworth_LF(img, D0, 4);
gaussian_img = gaussian_LF(img, D0);

disp(strcat('PSNR of butterworth : ', int2str(psnr(img, uint8(butter_img)))));
disp(strcat('PSNR of gaussian : ', int2str(psnr(img, uint8(gaussian_img)))));
disp(psnr(img, uint8(gaussian_img)));

subplot(2, 2, 1);
imshow(img);
title('Original Image');

subplot(2, 2, 2);
imshow(butter_img);
title('Butterworth filtered image');

subplot(2, 2, 3)
imshow(gaussian_img);
title('Gaussian filtered image');

