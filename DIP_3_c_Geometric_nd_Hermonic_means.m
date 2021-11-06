%% Not Finished Yet


clc;
close all;
clear all;

img = imread('assets/circuit.jpg');
%img = rgb2gray(img);
img = imresize(img, [512 512]);

dimg = im2double(img);

[rows, columns] = size(dimg);

%converting image to double 

mask_dim = 7; % mask dimention should be always odd
loop_n = floor(mask_dim/2);

% average mask
mask = ones(mask_dim, mask_dim)*(1.0/(mask_dim*mask_dim));

% padding each dimention by replicating last values
padded_img = padarray( dimg,[mask_dim mask_dim],'replicate');

% Geometric mean filter operation
gmean_img = zeros(rows, columns);
for i = (mask_dim + 1) : (rows + mask_dim)
    for j = (mask_dim + 1) : (columns + mask_dim)
        sum = 0.0;
        for ii = -loop_n : loop_n
            for jj = -loop_n : loop_n
                sum = sum + log(padded_img(i+ii, j+jj));
            end
        end
        %disp(sum)
        gmean_img(i-mask_dim, j-mask_dim) = sum;
    end
end

gmean_img = exp(gmean_img).^(1.0/(mask_dim*mask_dim));

imshow(uint8(normalize_image(gmean_img, 0, 255)));


%Harmonic mean filter

hmean_img = zeros(rows, columns);
for i = (mask_dim + 1) : (rows + mask_dim)
    for j = (mask_dim + 1) : (columns + mask_dim)
        sum = 0.0;
        for ii = -loop_n : loop_n
            for jj = -loop_n : loop_n
                sum = sum + 1.0/padded_img(i+ii, j+jj);
            end
        end
        %disp(sum)
        hmean_img(i-mask_dim, j-mask_dim) = sum;
    end
end

hmean_img = (mask_dim*mask_dim) ./ hmean_img;



subplot(2, 2, 1)
imshow(img);
title('Original Image');

subplot(2,2,2)
imshow(gmean_img);
title('Average Image');

subplot(2,2,3)
imshow(hmean_img);
title('Median Image');
