figure
hold on
scatter(Average_distortion_B, Average_average_power_saving_B, 'filled', 'b');
scatter(Average_distortion_R, Average_average_power_saving_R, 'filled', 'r');
scatter(Average_distortion_G, Average_average_power_saving_G, 'filled', 'g');
plot(Average_distortion_B, Average_average_power_saving_B, 'b');
plot(Average_distortion_R, Average_average_power_saving_R, 'r');
plot(Average_distortion_G, Average_average_power_saving_G, 'g');
legend('Blue transformation', 'Red transformation', 'Green transformation','Location', 'northeast', 'FontSize', 14);
title("Average power savings vs Average distortion", 'FontSize', 14)
ylabel('Average power savings', 'FontSize', 16)
xlabel('Average distortion', 'FontSize', 16) 
grid
