clc;
close all;
clear all;

img = imread('../assets/dog.jpg');
img = rgb2gray(img);
img = imresize(img, [512 512]);


    
    [rows columns] = size(img);

    img = imnoise(img, 'gaussian');

    dimg = double(img);
    fimg = fftshift(fft2(dimg));

    % creating 2d meshgrid((u,v) co-ordinate locations) middle point is zero
    % [rows columns] should be even

    rows = rows/2;
    columns = columns/2;
    
    [u v] = meshgrid(-rows:rows-1, -columns:columns-1);

    % calculating distence of each locations from co-ordinate zero
    d = sqrt(u.^2 + v.^2);
    d0 = 10;

    % glf = gaussian loadpass filter
    % when distance D lower than D0 then preserving the value
    % when distance greater than D0 value started to become near to zero
    glf = exp(-((d.^2) ./ (2*d0^2)));

    % multiplicate the filter with fft image
    foutput_img = fimg .* glf;
    tmp_img = ifft2(foutput_img);
    gaussian_hf_img = uint8(abs(tmp_img)); 
    

imshow(gaussian_hf_img);

