function psnrval = psnr(original_img, dist_img);
   
    original_img =  double(original_img);
    dist_img = double(dist_img);
    
    [m n] = size(original_img);
    
    res = (1/(m*n))*sum(sum((original_img-dist_img).^2));
    psnrval = 20*log10((max(original_img( : )))/(res^.5));
    
end