figure
scatter(Average_distortion_B, Average_average_power_saving_B, 'filled','b');
title("Average power vs Average distortion using blue transformation")
ylabel('Average power')
xlabel('Average distortion') 
grid
label = strcat('b = ', num2str(constant));
text(Average_distortion_B, Average_average_power_saving_B + 0.05, label)