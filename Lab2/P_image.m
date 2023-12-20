function image_power = P_image(img_rgb)
image_power = 0;
for i = 1:size(img_rgb, 1) %loops over all rows
    for j = 1:size(img_rgb, 2) %loops over all columns
        R = img_rgb(i, j, 1);
        G = img_rgb(i, j, 2);
        B = img_rgb(i, j, 3);
        image_power = image_power + P_pixel(R, G, B);
    end
end
end
