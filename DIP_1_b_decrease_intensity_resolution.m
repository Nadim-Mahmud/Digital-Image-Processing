clc;
close all;
clear all;

rgb_img = imread('dog.jpg');
img = rgb2gray(rgb_img);
img = imresize(img, [512 512]);

[row, column] = size(img);
%[pixelCount, grayLevels] = imhist(img);
grayLevels = 8;
plot_dim = ceil(sqrt(grayLevels));

tmp_img = img;

for i = 1 : grayLevels
    
    subplot(plot_dim, plot_dim, i);
    imshow(tmp_img);
    title(strcat(int2str(grayLevels-i+1)));
    tmp = 0;
    for j = 1 : row
        for k = 1 : column
            tmp_img(j,k) = floor(img(j,k)/(2^i));
        end
    end
end


