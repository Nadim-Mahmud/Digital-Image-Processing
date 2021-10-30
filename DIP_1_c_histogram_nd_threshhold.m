clc;
close all;
clear all;

img = imread('assets/dog.jpg');
img = rgb2gray(img);
img = imresize(img, [512 512]);

subplot(3,1,1);
imshow(img);
title('Original image');

% decide the threshold value from the histogram
subplot(3,1,2);
imhist(img);
title('Origian image''s Histogram');

%threshold input
threshold = input('Enter the threshold value =  ') %200;

output_img = img>threshold;


subplot(3,1,3);
imshow(output_img);
title('Threshold');