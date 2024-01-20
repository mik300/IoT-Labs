figure
scatter(Average_distortion_modDVS_ori, Average_average_power_saving_modDVS_ori, 'filled','b');
title("Average power vs Average distortion using DVS and brightness scaling")
ylabel('Average power')
xlabel('Average distortion') 
grid
label = strcat('Vdd = ', num2str(Vdd_param));
text(Average_distortion_modDVS_ori, Average_average_power_saving_modDVS_ori + 0.1, label)