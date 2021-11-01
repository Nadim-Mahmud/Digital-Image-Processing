clc;
close all;
clear all;

img = imread('assets/dog.jpg');
img = rgb2gray(img);
%img = rgb2gray(img);
img = imresize(img, [512 512]);

D0 = 10;
butter_img = butterworth_LF(img, D0, 4);
gaussian_img = gaussian_LF(img, D0);

disp(strcat('PSNR of butterworth : ', int2str(psnr(img, butter_img))));
disp(strcat('PSNR of gaussian : ', int2str(psnr(img, gaussian_img))));

subplot(2, 2, 1);
imshow(img);
title('Original Image');

subplot(2, 2, 2);
imshow(butter_img);
title('Butterworth filtered image');

subplot(2, 2, 3)
imshow(gaussian_img);
title('Gaussian filtered image');

subplot(2, 2, 4)
imshow(imabsdiff(gaussian_img, butter_img).*200);
title('Difference image');



