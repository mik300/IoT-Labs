figure
grid on
scatter(Average_distortion_modDVS_ori_contrast, Average_average_power_saving_modDVS_ori_contrast, 'filled','b');
title("Average power vs Average distortion using DVS and contrast enhancement")
ylabel('Average power savings')
xlabel('Average distortion') 
grid
%label = strcat('Vdd = ', num2str(Vdd_param));
%text(Average_distortion_modDVS_ori + 0.1, Average_average_power_saving_modDVS_ori + 0.1, label)

hold on
scatter(Average_distortion_DVS_ori_contrast, Average_average_power_saving_DVS_ori_contrast, 'filled','r');
title("Average power vs Average distortion using DVS and contrast enhancement")
ylabel('Average power savings')
xlabel('Average distortion') 
grid
label = strcat('Vdd = ', num2str(Vdd_param_contrast));
text(Average_distortion_DVS_ori_contrast + 0.1, Average_average_power_saving_DVS_ori_contrast + 0.1, label)
legend("Contrast enhancement with DVS", "DVS only", "FontSize", 14, 'Location', 'northwest')