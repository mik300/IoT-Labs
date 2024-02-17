figure
hold on
orange = "#D95319";
scatter(Average_distortion_lab, Average_average_power_saving_lab, 'Filled', 'MarkerEdgeColor', orange, 'MarkerFaceColor', orange);
plot(Average_distortion_lab, Average_average_power_saving_lab, 'Color', orange);
title("Average power saving vs Average distortion", 'FontSize', 14)
ylabel('Average power saving', 'FontSize', 16)
xlabel('Average distortion', 'FontSize', 16) 
grid
label = strcat('l = ', num2str(lab_param));
text(Average_distortion_lab + 0.1, Average_average_power_saving_lab + 0.1, label, 'FontSize', 14)

