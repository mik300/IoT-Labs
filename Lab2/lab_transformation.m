function  mod_img = lab_transformation(original_img, parameter)
pre_mod_img = rgb2lab(original_img);
pre_mod_img(:, :, 1) = pre_mod_img(:, :, 1) / parameter;
mod_img = lab2rgb(pre_mod_img);
mod_img = mod_img * 255;
mod_img = cast(mod_img, "uint8");
end