clc;
close all;
clear all;

img = imread('assets/lenna.png');
img = rgb2gray(img);
img = imresize(img, [512 512]);

double_img = im2double(img);

[rows, columns] = size(img);

power_img = zeros(rows, columns);
log_img = zeros(rows, columns);
c = 1;

for i = 1 : rows
    for j = 1 : columns
        power_img(i,j) = c*double_img(i,j)^2;
        %log_img(i,j) = c*log(1.0 + double_img(i,j));
        %what is the formula of inverse log
        log_img(i,j) = c*2^(double_img(i,j)); %inverse log
    end
end


subplot(2,2,1);
imshow(power_img);
title('PowerLaw Transformed Image');

subplot(2,2,2);
imhist(power_img);
title('PowerLaw Hist');

subplot(2,2,3);
imshow(log_img);
title('Log Transformed Image');

subplot(2,2,4);
imhist(log_img);
title('Log Transformed Image');
