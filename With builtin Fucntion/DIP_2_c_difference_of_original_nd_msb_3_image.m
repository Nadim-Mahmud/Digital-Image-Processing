clc;
close all;
clear all;

img = imread('../assets/dog.jpg');
img = rgb2gray(img);
img = imresize(img, [512 512]);
[rows, columns] = size(img);

subplot(2,2,1);
imshow(img);
title('Original Image');

mask = (128+64+32); %3bit mask - 224
%256 128 64 32 16 8 4  2 1
%imhist(img);

% anding to all positions
three_msb_img = bitand(img, mask);

%imhist(output_img)

difference_image = imabsdiff(img, three_msb_img);


subplot(2,2,2);
imshow(three_msb_img);
title('Three MSB image');

subplot(2,2,3);
imshow(difference_image);
title('Difference Image');
