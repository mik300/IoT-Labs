close all
filename = "C:\Users\Equipo\Desktop\ComputerEngineering\Third semester\Energy management for IoT\Labs\IoT-Labs\Lab2\misc\4.1.07.tiff"
img_rgb = imread(filename);

Power = [];
Power_perc = [];
Distortion = [];

%Power consumption without applying neither DVS nor transformations
i_cell_original = I_cell(15, double(img_rgb));
image_power_consumption = P_panel(15, i_cell_original);

%Power consumption and distortion when applying DVS without tranformations
i = 13 %%Scaled voltage(V)
i_cell = I_cell(i, double(img_rgb));
img_DVS = (displayed_image(i_cell, i, 1)/255);
image_DVS_power_consumption = P_panel(i, img_DVS);
average_power_saving_DVS_ori = saving_perc(image_power_consumption, image_DVS_power_consumption);
distortion_DVS_percentage = distortion_perc(img_rgb, img_DVS);

%With transformation
b = (i - ((15 - i) / 15)) / 15; % b depends on the ratio of Vdd and the original Vdd
%%mod_img = brightness_scaling(img_rgb, b);
%%mod_img = contrast_enhancement(img_rgb, b);
mod_img = brightness_scaling(img_rgb, b);
mod_img = contrast_enhancement(mod_img,b);
i_cell_mod = I_cell(i, double(mod_img));
mod_img_DVS = (displayed_image(i_cell_mod, i, 1)/255);
image_modDVS_power_consumption = P_panel(i, mod_img_DVS);
distortion_modDVS_ori_percentage = distortion_perc(img_rgb, mod_img_DVS);
average_power_saving_modDVS_ori = saving_perc(image_power_consumption, image_modDVS_power_consumption);


Power = [Power image_power_consumption, image_DVS_power_consumption, image_modDVS_power_consumption ]
Power_perc = [Power_perc average_power_saving_DVS_ori average_power_saving_modDVS_ori ]
Distortion = [Distortion distortion_DVS_percentage distortion_modDVS_ori_percentage  ]


imshow(img_rgb)
figure
imshow(img_DVS)
figure
imshow(mod_img_DVS)