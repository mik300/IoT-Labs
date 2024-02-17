figure
hold on

scatter(Average_distortion_luminance, Average_average_power_saving_luminance, 'Filled', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k');
plot(Average_distortion_luminance, Average_average_power_saving_luminance,  'Color', 'k');
title("Average power saving vs Average distortion", 'FontSize', 14)
ylabel('Average power saving', 'FontSize', 16)
xlabel('Average distortion', 'FontSize', 16) 
grid
label = strcat('l = ', num2str(luminance_param));
text(Average_distortion_luminance + 0.1, Average_average_power_saving_luminance + 0.1, label, 'FontSize', 12)