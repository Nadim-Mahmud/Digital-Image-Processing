clc;
close all;
clear all;

img = imread('assets/dog.jpg');
img = rgb2gray(img);
%img = rgb2gray(img);
img = imresize(img, [512 512]);

D0 = 30;
butter_img = butterworth_LF(img, D0, 2);
gaussian_img = butterworth_LF(img, D0);

imshow(output_img);




