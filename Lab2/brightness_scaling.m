function  mod_rgb = brightness_scaling(img_rgb, b)
pre_mod_rgb = rgb2hsv(img_rgb)
pre_mod_rgb(:, :, 1) = pre_mod_rgb(:, :, 1) + b;
pre_mod_rgb(:, :, 2) = pre_mod_rgb(:, :, 2) + b;
pre_mod_rgb(:, :, 3) = pre_mod_rgb(:, :, 3) + b;
mod_img = hsv2rgb(pre_mod_img);
mod_img = mod_img * 255;
mod_img = cast(mod_img, "uint8");
end