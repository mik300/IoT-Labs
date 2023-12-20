img_rgb = imread('misc/4.2.07.tiff');
figure(); imshow(img_rgb);
image_power_consumption = P_image(img_rgb);
mod_img = img_rgb;
mod_img(:, :, 3) = img_rgb(:, :, 3) - 20;
figure(); imshow(mod_img);
distortion_percentage = distortion_perc(img_rgb, mod_img)