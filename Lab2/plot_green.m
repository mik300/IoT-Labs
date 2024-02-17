figure
hold on
scatter(Average_distortion_G, Average_average_power_saving_G, 'filled','g');
plot(Average_distortion_G, Average_average_power_saving_G, 'g');
title("Average power savings vs Average distortion using green transformation", 'FontSize', 14)
ylabel('Average power savings', 'FontSize', 16)
xlabel('Average distortion', 'FontSize', 16) 
grid
label = strcat('g = ', num2str(constant));
text(Average_distortion_G, Average_average_power_saving_G + 0.1, label, 'FontSize', 12)