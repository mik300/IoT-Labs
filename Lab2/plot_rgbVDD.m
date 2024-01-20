figure
grid on
scatter(Average_distortion_modDVS_ori, Average_average_power_saving_modDVS_ori, 'filled','b');
title("Average power vs Average distortion using DVS and brightness scaling")
ylabel('Average power savings')
xlabel('Average distortion') 
grid
%label = strcat('Vdd = ', num2str(Vdd_param));
%text(Average_distortion_modDVS_ori + 0.1, Average_average_power_saving_modDVS_ori + 0.1, label)

hold on
scatter(Average_distortion_DVS_ori, Average_average_power_saving_DVS_ori, 'filled','r');
title("Average power vs Average distortion using DVS and brightness scaling")
ylabel('Average power savings')
xlabel('Average distortion') 
grid
label = strcat('Vdd = ', num2str(Vdd_param));
text(Average_distortion_DVS_ori + 0.1, Average_average_power_saving_DVS_ori + 0.1, label)
legend("Brightness scaling with DVS", "DVS only", "FontSize", 14, 'Location', 'northwest')