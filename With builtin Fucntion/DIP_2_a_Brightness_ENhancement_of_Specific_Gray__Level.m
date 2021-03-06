clc;
close all;
clear all;

img = imread('../assets/lenna.png');
img = rgb2gray(img);
img = imresize(img, [512 512]);

[rows, columns] = size(img);

subplot(2,2,1);
imshow(img);
title('Original Image');

subplot(2,2,2);
imhist(img);
title('Original Image Hist');


%range to increase brightness
left = 40;
right = 70;
enhancement = 100;

img = double(img);
output_img = img;

for i = 1 : rows
    for j = 1 : columns
        if left <= img(i,j) && img(i,j) <= right
            output_img(i,j) = img(i,j)+enhancement;
        end
    end
end

% normalizing the output incase higher than 255 vlue occures
tmp_img = rescale(output_img, 0, 255); %  builin function
output_img = uint8(tmp_img);


subplot(2,2,3);
imshow(output_img);
title('Range intensity enhancement');

subplot(2,2,4);
imhist(output_img);
title('Output Image Hist');