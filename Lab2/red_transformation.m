function  mod_rgb = blue_transformation(img_rgb, parameter)
mod_rgb = img_rgb;
mod_rgb(:, :, 1) = img_rgb(:, :, 1) - parameter;
end