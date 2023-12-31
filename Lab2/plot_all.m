scatter(Average_distortion_lab, Average_average_power_saving_lab, 'filled', 'm');
title("Average power saving vs Average distortion")
ylabel('Average power saving')
xlabel('Average distortion') 
grid
hold on
scatter(Average_distortion_B, Average_average_power_saving_B, 'filled', 'b');
scatter(Average_distortion_R, Average_average_power_saving_R, 'filled', 'r');
scatter(Average_distortion_G, Average_average_power_saving_G, 'filled', 'g');
scatter(Average_distortion_luminance, Average_average_power_saving_luminance, 'filled', 'k');
legend('Luminance transformation','Blue transformation', "Red transformation", "Green transformation", "Value transformation")
