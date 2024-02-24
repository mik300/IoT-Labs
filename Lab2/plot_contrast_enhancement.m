figure
hold on
scatter(Average_distortion_modDVS_ori_contrast, Average_average_power_saving_modDVS_ori_contrast, 'filled','b');
plot(Average_distortion_modDVS_ori_contrast, Average_average_power_saving_modDVS_ori_contrast, 'b');
label1 = strcat('Vdd = ', num2str(Vdd_param_contrast));
text(Average_distortion_modDVS_ori_contrast + 0.05, Average_average_power_saving_modDVS_ori_contrast + 0.1, label1, 'FontSize', 12)


scatter(Average_distortion_DVS_ori_contrast, Average_average_power_saving_DVS_ori_contrast, 'filled','r');
plot(Average_distortion_DVS_ori_contrast, Average_average_power_saving_DVS_ori_contrast, 'r');
title("Average power vs Average distortion using DVS and contrast enhancement", 'FontSize', 14)
ylabel('Average power savings', 'FontSize', 16)
xlabel('Average distortion', 'FontSize', 16) 
grid
label = strcat('Vdd = ', num2str(Vdd_param_contrast));
text(Average_distortion_DVS_ori_contrast + 0.05, Average_average_power_saving_DVS_ori_contrast + 0.1, label, 'FontSize', 12)
legend("Contrast enhancement with DVS", "","DVS only", "FontSize", 14, 'Location', 'northwest', 'FontSize', 14)