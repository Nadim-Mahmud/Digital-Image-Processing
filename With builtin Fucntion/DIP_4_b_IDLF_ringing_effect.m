clc;
close all;
clear all;

img = imread('../assets/dog.jpg');
img = rgb2gray(img);
%img = rgb2gray(img);
img = imresize(img, [512 512]);

img = imnoise(img, 'gaussian');

D0 = 30; % initail D0
n = 4; % number of radious
plot_dim = ceil(sqrt(n));


subplot(plot_dim, plot_dim, 1);
imshow(img);
title('Original Image');    

for i = 1 : n
    
    idlf_img = ideal_LF(img, D0);
    
    subplot(plot_dim, plot_dim, i+1);
    imshow(idlf_img);
    title(strcat('IDLF img when D0 =  ' , int2str(D0)));
    
    D0 = D0 + 5;
end
