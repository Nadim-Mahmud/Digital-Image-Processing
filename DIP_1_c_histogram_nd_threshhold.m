clc;
close all;
clear all;

img = imread('dog.jpg');
img = rgb2gray(img);
img = imresize(img, [512 512]);

[rows, columns] = size(img);

% decide the threshold value
imhist(img);


%threshold operation

threshold = 200;

output_img = img;

for i = 1 : rows
    for j = 1 : columns
        if img(i,j) >= threshold
            output_img(i,j) = 255;
        else
            output_img(i,j) = 0;
        end
    end
end

%imhist(output_img)
imshow(output_img);
