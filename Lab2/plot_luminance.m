scatter(Average_distortion, Average_average_power_saving);
title("Average power saving vs Average distortion")
ylabel('Average power saving')
xlabel('Average distortion') 
grid
label = strcat('l = ', num2str(luminance_param));
text(Average_distortion + 0.1, Average_average_power_saving + 0.1, label)