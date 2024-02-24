figure
hold on

scatter(Average_distortion_modDVS_ori_both, Average_average_power_saving_modDVS_ori_both, 'filled','b');
plot(Average_distortion_modDVS_ori_both, Average_average_power_saving_modDVS_ori_both, 'b');

scatter(Average_distortion_modDVS_ori_contrast, Average_average_power_saving_modDVS_ori_contrast, 'filled','g');
plot(Average_distortion_modDVS_ori_contrast, Average_average_power_saving_modDVS_ori_contrast, 'g');

scatter(Average_distortion_modDVS_ori, Average_average_power_saving_modDVS_ori, 'filled','m');
plot(Average_distortion_modDVS_ori, Average_average_power_saving_modDVS_ori, 'm');

scatter(Average_distortion_DVS_ori, Average_average_power_saving_DVS_ori, 'filled','r');
plot(Average_distortion_DVS_ori, Average_average_power_saving_DVS_ori, 'r');

title("Average power vs Average distortion", 'FontSize', 14)
ylabel('Average power savings', 'FontSize', 16)
xlabel('Average distortion', 'FontSize', 16)
grid

legend("CE and BS with DVS", "", "DVS only", "FontSize", 14, 'Location', 'northwest', 'FontSize', 14)