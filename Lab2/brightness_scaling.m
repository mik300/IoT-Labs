function  mod_rgb = brightness_scaling(img_rgb, b)
mod_rgb = img_rgb;
mod_rgb(:, :, 1) = img_rgb(:, :, 1) + b;
mod_rgb(:, :, 2) = img_rgb(:, :, 2) + b;
mod_rgb(:, :, 3) = img_rgb(:, :, 3) + b;
end