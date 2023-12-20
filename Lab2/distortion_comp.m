function distortion = distortion_comp(original_img,mod_img)
distortion = 0;
lab_original_img = rgb2lab(original_img);
lab_mod_img = rgb2lab(mod_img);
for i = 1:size(original_img, 1) %loops over all rows
    for j = 1:size(original_img, 2) %loops over all columns
        L_original = lab_original_img(i,j,1);
        a_original = lab_original_img(i,j,2);
        b_original = lab_original_img(i,j,3);
        L_mod = lab_mod_img(i,j,1);
        a_mod = lab_mod_img(i,j,2);
        b_mod = lab_mod_img(i,j,3);
        distortion = distortion + sqrt( (L_original - L_mod)^2 + (a_original - a_mod)^2 + (b_original - b_mod)^2 );
    end
end
end

