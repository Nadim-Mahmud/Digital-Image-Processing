function output_img = erosion(img, se)
    
    
    
    bimg = im2bw(img); % converting to binary image

    [mask_dim, dummy] = size(se);
    hf_dim = floor(mask_dim/2);
    
    %padding image
    padded_img = padarray(bimg,[mask_dim mask_dim],'replicate');
    
    [rows columns] = size(img);
    output_img = zeros(rows, columns);

    
    for i = (mask_dim+1) : (rows+mask_dim)
        for j = (mask_dim+1) : (columns+mask_dim)
            % cutting image matched with structuring element
            cut_img = padded_img((i-hf_dim):(i+hf_dim), (j-hf_dim):(j+hf_dim));
            % stores one if equal
            nh_img = (cut_img == se);
            % fit operation (stores zero if any of them are not matched)
            output_img(i,j) = min(nh_img(:));
        end
    end
    
end