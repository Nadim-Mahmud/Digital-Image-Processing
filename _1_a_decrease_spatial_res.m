clc;
close all;
clear all;

img = imread('dog.jpg');

imshow(img)


tmp = imresize(img, [40 40]);
tmp2 = imresize(tmp, [512 512]);


subplot(2,1,1);
imshow(tmp);

subplot(2,1,2);
imshow(tmp2);
