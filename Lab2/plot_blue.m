figure
hold on
scatter(Average_distortion_B, Average_average_power_saving_B, 'filled','b');
plot(Average_distortion_B, Average_average_power_saving_B, 'b');
title("Average power savings vs Average distortion using blue transformation", 'FontSize', 14)
ylabel('Average power savings', 'FontSize', 16)
xlabel('Average distortion', 'FontSize', 16) 
grid
label = strcat('b = ', num2str(constant));
text(Average_distortion_B, Average_average_power_saving_B + 0.1, label,  'FontSize', 12)