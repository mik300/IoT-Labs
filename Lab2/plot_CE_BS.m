figure
hold on
scatter(Average_distortion_modDVS_ori_both, Average_average_power_saving_modDVS_ori_both, 'filled','b');
plot(Average_distortion_modDVS_ori_both, Average_average_power_saving_modDVS_ori_both, 'b');
label = strcat('Vdd = ', num2str(Vdd_param_both));
text(Average_distortion_modDVS_ori_both + 0.05, Average_average_power_saving_modDVS_ori_both + 0.1, label, 'FontSize', 12)


scatter(Average_distortion_DVS_ori_both, Average_average_power_saving_DVS_ori_both, 'filled','r');
plot(Average_distortion_DVS_ori_both, Average_average_power_saving_DVS_ori_both, 'r');
title("Average power vs Average distortion using DVS, brightness scaling and contrast enhancement", 'FontSize', 14)
ylabel('Average power savings', 'FontSize', 16)
xlabel('Average distortion', 'FontSize', 16) 
grid
label = strcat('Vdd = ', num2str(Vdd_param_both));
text(Average_distortion_DVS_ori_both + 0.05, Average_average_power_saving_DVS_ori_both + 0.1, label, 'FontSize', 12)
legend("CE and BS with DVS", "", "DVS only", "FontSize", 14, 'Location', 'northwest', 'FontSize', 14)