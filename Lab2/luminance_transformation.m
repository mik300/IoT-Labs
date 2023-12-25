function  mod_img = luminance_transformation(original_img, parameter)
pre_mod_img = rgb2hsv(original_img);
pre_mod_img(:, :, 3) = pre_mod_img(:, :, 3) / parameter;
mod_img = hsv2rgb(pre_mod_img);
mod_img = mod_img * 255;
mod_img = cast(mod_img, "uint8");
end