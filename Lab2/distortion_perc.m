function dist_perc = distortion_perc(original_img,mod_img)
dist = distortion_comp(original_img, mod_img);
dist_perc = dist/( size(original_img,1)*size(original_img,2)*sqrt(140050) )*100;
end

