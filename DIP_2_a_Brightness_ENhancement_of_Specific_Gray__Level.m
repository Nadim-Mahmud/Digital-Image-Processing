clc;
close all;
clear all;

img = imread('assets/lenna.png');
img = rgb2gray(img);
img = imresize(img, [512 512]);

[rows, columns] = size(img);


%imhist(img);


%range to increase brightness
left = 10;
right = 50;
enhancement = 80;

output_img = img;

for i = 1 : rows
    for j = 1 : columns
        if left <= img(i,j) && img(i,j) <= right
            output_img(i,j) = img(i,j)+enhancement;
        end
    end
end

%imhist(output_img)


subplot(2,2,1);
imshow(img);
title('Original Image');

subplot(2,2,2);
imhist(img);
title('Original Image Hist');

subplot(2,2,3);
imshow(output_img);
title('Range intensity enhancement');

subplot(2,2,4);
imhist(output_img);
title('Output Image Hist');
