% Histogram Calculation
% Histogram Equalization
clc;
close all;
clear all;

row = 2;
col = 2;
img = imread('coins.jpg');
%img = 255*ones(256,256);

subplot(row,col,1);
imshow(img);
title('Grayscale Image');

img = double(img);    % *** Converting it to double before processing
x1 = 0:255;
y1 = my_hist(img);    % User Defined Function imhist(img)

subplot(row,col,2);
stem(x1,y1,'marker','none');  %bar(x,y);
title('Histogram');

img_equ = my_hist_equ(img);

subplot(row,col,3);
imshow(img_equ);
title('Histogram Equalized Image');

x2 = 0:255;
y2 = my_hist(img_equ);    % User Defined Function imhist(img)

subplot(row,col,4);
stem(x2,y2,'marker','none');
%bar(x,y);
title('Histogram Equalization');



        
