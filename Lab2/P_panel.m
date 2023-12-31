function [p_panel] = P_panel(Vdd, img_rgb)
p_panel = 0.0;
for i = 1:size(img_rgb, 1) %loops over all rows
    for j = 1:size(img_rgb, 2) %loops over all columns
        R = img_rgb(i, j, 1);
        G = img_rgb(i, j, 2);
        B = img_rgb(i, j, 3);
        D_RGB = single([R G B]);
        p_panel = p_panel + I_cell(Vdd, D_RGB);
    end
end
p_panel = sum(p_panel, "all");
p_panel = Vdd*p_panel;
end