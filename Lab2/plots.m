scatter(Average_distortion, Average_average_power_saving);
title("Average power vs Average distortion")
ylabel('Average power')
xlabel('Average distortion') 
grid
label = strcat('b = ', num2str(blue_param));
text(Average_distortion + 0.1, Average_average_power_saving + 0.3, label)