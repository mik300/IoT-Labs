figure
hold on
scatter(Average_distortion_modDVS_ori, Average_average_power_saving_modDVS_ori, 'filled','b');
plot(Average_distortion_modDVS_ori, Average_average_power_saving_modDVS_ori, 'b');
label = strcat('Vdd = ', num2str(Vdd_param));
text(Average_distortion_modDVS_ori + 0.05, Average_average_power_saving_modDVS_ori + 0.1, label, 'FontSize', 12)


scatter(Average_distortion_DVS_ori, Average_average_power_saving_DVS_ori, 'filled','r');
plot(Average_distortion_DVS_ori, Average_average_power_saving_DVS_ori, 'r');
title("Average power vs Average distortion using DVS and brightness scaling", 'FontSize', 14)
ylabel('Average power savings', 'FontSize', 16)
xlabel('Average distortion', 'FontSize', 16)
grid
label = strcat('Vdd = ', num2str(Vdd_param));
text(Average_distortion_DVS_ori + 0.05, Average_average_power_saving_DVS_ori + 0.1, label, 'FontSize', 12)
legend("Brightness scaling with DVS", "", "DVS only", "FontSize", 14, 'Location', 'northwest', 'FontSize', 14)