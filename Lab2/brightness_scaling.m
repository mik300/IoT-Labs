function  mod_img = brightness_scaling(img_rgb, b)
pre_mod_img = rgb2hsv(img_rgb);
add = pre_mod_img(:, :, 3) + b / 10;
one = ones(size(add,1), size(add,2));
pre_mod_img(:, :, 3) = min(one, add);
mod_img = hsv2rgb(pre_mod_img);
mod_img = mod_img * 255;
mod_img = cast(mod_img, "uint8");
end