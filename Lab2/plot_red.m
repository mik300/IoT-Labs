figure
scatter(Average_distortion_R, Average_average_power_saving_R, 'filled','r');
title("Average power vs Average distortion using red transformation")
ylabel('Average power')
xlabel('Average distortion') 
grid
label = strcat('r = ', num2str(constant));
text(Average_distortion_R, Average_average_power_saving_R + 0.1, label)