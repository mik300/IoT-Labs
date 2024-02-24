figure
hold on
orange = "#D95319";
scatter(Average_distortion_B, Average_average_power_saving_B, 'filled', 'b');
plot(Average_distortion_B, Average_average_power_saving_B, 'Color', 'b');

scatter(Average_distortion_R, Average_average_power_saving_R, 'filled', 'r');
plot(Average_distortion_R, Average_average_power_saving_R, 'Color', 'r');

scatter(Average_distortion_G, Average_average_power_saving_G, 'filled', 'g');
plot(Average_distortion_G, Average_average_power_saving_G, 'Color', 'g');

scatter(Average_distortion_luminance, Average_average_power_saving_luminance, 'Filled', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k');
plot(Average_distortion_luminance, Average_average_power_saving_luminance, 'Color', 'k');

scatter(Average_distortion_lab, Average_average_power_saving_lab, 'Filled', 'MarkerEdgeColor', orange, 'MarkerFaceColor', orange);
plot(Average_distortion_lab, Average_average_power_saving_lab, 'Color', orange);

title("Average power saving vs Average distortion", 'FontSize', 14)
ylabel('Average power saving', 'FontSize', 16)
xlabel('Average distortion', 'FontSize', 16) 
grid
legend('Blue transformation', '', 'Red transformation', '', "Green transformation", '', "hsv transformation", '', "lab transformation", '',  'FontSize', 14)
