function output_img = gaussian_LF(img, D0)
  
    [rows columns] = size(img);

    % 2d fft then shifting vlaues to middle
    fimg = fftshift(fft2(img));

    % creating 2d meshgrid((u,v) co-ordinate locations) middle point is zero
    % [rows columns] should be even

    [u v] = meshgrid(-(rows/2) : ((rows/2)-1), -(columns/2) : ((columns/2)-1));

    % calculating distence of each locations from co-ordinate zero
    D = sqrt(u.^2 + v.^2);

    % glf = gaussian loadpass filter
    % when distance D lower than D0 then preserving the value
    % when distance greater than D0 value started to become near to zero
    glf = exp(-((D.*D)./(2.*D0.^2)));

    % multiplicate the filter with fft image
    foutput_img = fimg .* glf;
    tmp_img = ifft2(foutput_img);
    output_img = mat2gray(abs(tmp_img));   
end