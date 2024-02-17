figure
grid on
scatter(Average_distortion_modDVS_ori_both, Average_average_power_saving_modDVS_ori_both, 'filled','b');
title("Average power vs Average distortion using DVS, brightness scaling and constrast enhancement")
ylabel('Average power savings')
xlabel('Average distortion') 
grid
%label = strcat('Vdd = ', num2str(Vdd_param_both));
%text(Average_distortion_modDVS_ori + 0.1, Average_average_power_saving_modDVS_ori + 0.1, label)

hold on
scatter(Average_distortion_DVS_ori_both, Average_average_power_saving_DVS_ori_both, 'filled','r');
title("Average power vs Average distortion using DVS, brightness scaling and contrast enhancement")
ylabel('Average power savings')
xlabel('Average distortion') 
grid
label = strcat('Vdd = ', num2str(Vdd_param_both));
text(Average_distortion_DVS_ori_both + 0.1, Average_average_power_saving_DVS_ori_both + 0.1, label)
legend("Contrast enhancement and brightness scaling with DVS", "DVS only", "FontSize", 14, 'Location', 'northwest')