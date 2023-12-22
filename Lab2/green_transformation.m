function  mod_rgb = blue_transformation(img_rgb, parameter)
mod_rgb = img_rgb;
mod_rgb(:, :, 2) = img_rgb(:, :, 2) - parameter;
end