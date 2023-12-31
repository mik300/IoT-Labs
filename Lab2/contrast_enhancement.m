function  mod_img = luminance_transformation(original_img, b)
pre_mod_img = rgb2hsv(original_img);
pre_mod_img(:, :, 3) = pre_mod_img(:, :, 3) * b;
mod_img = hsv2rgb(pre_mod_img);
mod_img = mod_img * 255;
mod_img = cast(mod_img, "uint8");
end