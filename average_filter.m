function [filtered_img] = average_filter(img,mask)

[rows, columns] = size(img);
[mask_dim, c] = size(mask);

loop_n = floor(mask_dim/2);

% padding each dimention by replicating last values
padded_img = padarray(img,[mask_dim mask_dim],'replicate');

% avg filter operation
filtered_img = img;
for i = (mask_dim + 1) : (rows + mask_dim)
    for j = (mask_dim + 1) : (columns + mask_dim)
        sum = 0.0;
        for ii = -loop_n : loop_n
            for jj = -loop_n : loop_n
                sum = sum + padded_img(i+ii, j+jj) .* mask(loop_n+1+ii, loop_n + 1 + jj);
            end
        end
        filtered_img(i-mask_dim, j-mask_dim) = sum;
    end
end

end
