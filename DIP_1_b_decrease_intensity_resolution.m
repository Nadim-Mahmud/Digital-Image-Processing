clc;
close all;
clear all;

rgb_img = imread('assets/dog.jpg');
img = rgb2gray(rgb_img);
img = imresize(img, [512 512]);

[row, column] = size(img);
%[pixelCount, grayLevels] = imhist(img);
grayLevels = 8;
plot_dim = ceil(sqrt(grayLevels));


subplot(plot_dim, plot_dim, 1);
imshow(im2double(img));
title(strcat('Gray level :',int2str(grayLevels)));

tmp_img = double(zeros([row column]));

for i = 1 : grayLevels-1
    tmp = 0;
    for j = 1 : row
        for k = 1 : column
            tmp = floor(img(j,k)/(2^i));
            %dividing by highest value to keep number less than 1
            tmp_img(j,k) = tmp/(2^grayLevels/2^i);
        end
    end
    subplot(plot_dim, plot_dim, i+1);
    %displaying the double image
    imshow(tmp_img);
    title(strcat('Gray level :',int2str(grayLevels-i)));
end


