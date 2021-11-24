clc;
clear all;
close all;

img = imread('../assets/dog.jpg');
img = rgb2gray(img);
img = imresize(img, [512 512]);

[rows, columns] = size(img);
level = 8;
plotdim = ceil(sqrt(level));

subplot(plotdim, plotdim,1);
imshow(img);
title('Original Image');

out_img = img;

for i = 1 : level
    
    out_img = img ./ (2^i);
    out_img = uint8(rescale(out_img, 0, 255));
    
    subplot(plotdim, plotdim,i+1);
    imshow(out_img);
    title(strcat('Intensity Level : ', int2str(level-i+1)));
end