function  mod_img = contrast_enhancement(original_img, b)
pre_mod_img = rgb2hsv(original_img);
mult = pre_mod_img(:, :, 3) / b;
one = ones(size(mult,1), size(mult,2));
pre_mod_img(:, :, 3) = min(one, mult);
mod_img = hsv2rgb(pre_mod_img);
mod_img = mod_img * 255;
mod_img = cast(mod_img, "uint8");
end