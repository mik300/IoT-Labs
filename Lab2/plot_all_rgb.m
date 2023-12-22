figure
hold on
scatter(Average_distortion_B, Average_average_power_saving_B, 'filled', 'b');
scatter(Average_distortion_R, Average_average_power_saving_R, 'filled', 'r');
scatter(Average_distortion_G, Average_average_power_saving_G, 'filled', 'g');
title("Average power vs Average distortion")
ylabel('Average power')
xlabel('Average distortion') 
grid
