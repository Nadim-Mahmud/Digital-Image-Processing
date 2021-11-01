clc;
close all;
clear all;

img = imread('assets/lenna.png');
img = rgb2gray(img);
img = imresize(img, [512 512]);

double_img = im2double(img);

[rows, columns] = size(img);

power_img = zeros(rows, columns);
ilog_img = zeros(rows, columns);

L = 8; % intensity level
c = (L - 1)/log(L) ;
factor = 5;

for i = 1 : rows
    for j = 1 : columns
        power_img(i,j) = c*double_img(i,j)^factor;
        %log_img(i,j) = c*log(1.0 + double_img(i,j));
        %what is the formula of inverse log
        ilog_img(i,j) = exp(double_img(i,j)).^(1/c) - 1; %inverse log
    end
end

subplot(3,2,1);
imshow(img);
title('Original Image');

subplot(3,2,2);
imhist(img);
title('Original img Hist');


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
