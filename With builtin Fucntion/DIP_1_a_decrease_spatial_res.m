clc;
close all;
clear all;


number_of_image = 8;

rgb_img = imread('../assets/dog.jpg');
img = rgb2gray(rgb_img);
img = imresize(img, [512 512]);

[row, column] = size(img);

number_of_image = number_of_image;
plot_dim = ceil(sqrt(number_of_image));

for i = 1 : number_of_image
    
    tmp = imresize(img, [row column]);
    
    subplot(plot_dim, plot_dim, i);
    imshow(tmp);
    title(strcat(int2str(row), 'X', int2str(column)));
    
    row = row/2;
    column = column/2;
end
