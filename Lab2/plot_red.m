figure
hold on
scatter(Average_distortion_R, Average_average_power_saving_R, 'filled','r');
plot(Average_distortion_R, Average_average_power_saving_R, 'r');
title("Average power savings vs Average distortion using red transformation", 'FontSize', 14)
ylabel('Average power savings', 'FontSize', 16)
xlabel('Average distortion', 'FontSize', 16) 
grid
label = strcat('r = ', num2str(constant));
text(Average_distortion_R, Average_average_power_saving_R + 0.1, label, 'FontSize', 12)