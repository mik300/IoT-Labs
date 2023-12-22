function  mod_img = luminance_transformation(original_img, parameter)
pre_mod_img = rgb2hsv(original_img);
pre_mod_img(:, :, 3) = pre_mod_img(:, :, 3) / parameter;
mod_img = hsv2rgb(pre_mod_img);
end