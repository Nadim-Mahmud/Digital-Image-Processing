clc;
close all;
clear all;

img = imread('../assets/coins.jpg');
%img = rgb2gray(img);
img = imresize(img, [512 512]);

img = imnoise(img, 'gaussian');

gaussian_hf_img = gaussian_HPF(img, 10);
ideal_hf_img = ideal_HPF(img, 10);


subplot(2,1,1);
imshow(gaussian_hf_img);
title('Gaussian High Pass Image');

subplot(2,1,2);
imshow(ideal_hf_img);
title('Ideal High Pass Image');