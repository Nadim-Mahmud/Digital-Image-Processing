
clc;
close all;
clear all;

img = imread('../assets/circuit.jpg');
%img = rgb2gray(img);
img = imresize(img, [512 512]);

img = imnoise(img, 'gaussian');

dimg = im2double(img);

[rows, columns] = size(dimg);

%converting image to double 

dim = 10; % mask dimention should be always odd


gmean_img = exp(imfilter(log(dimg), ones(dim,dim))).^(1/(dim*dim));

hmean_img = (dim*dim)./imfilter(1 ./ dimg, ones(dim, dim));


subplot(2, 2, 1)
imshow(img);
title('Original Image');

subplot(2,2,2)
imshow(gmean_img);
title('Geometric Mean Image');

subplot(2,2,3)
imshow(hmean_img);
title('Harmonic Mean image');


