clc;
close all;
clear all;

img = imread('../assets/dog.jpg');
img = rgb2gray(img);
img = imresize(img, [512 512]);

    img = imnoise(img, 'gaussian');

    dimg = double(img);
    fimg = fftshift(fft2(dimg));
    
    %imshow(fimg);
    
    [rows columns] = size(img);
    rows = rows/2;
    columns = columns/2;
    
    [u v] = meshgrid(-rows:rows-1, -columns:columns-1);
    
    d = sqrt(u.^2 + v.^2);
    d0 = 10;
    
    glf =1 - exp(-((d.^2) ./ (2*d0^2)));
    
    foutput_img = fimg .* glf;
    tmp_img = ifft2(foutput_img);
    gaussian_hf_img = mat2gray(abs(tmp_img));
   
  imshow(gaussian_hf_img); 
    
    
    ideal_hf_img = gaussian_HPF(img, 10);


subplot(2,1,1);
imshow(gaussian_hf_img);
title('Gaussian High Pass Image');

subplot(2,1,2);
imshow(ideal_hf_img);
title('Ideal High Pass Image');