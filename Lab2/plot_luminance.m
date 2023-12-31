scatter(Average_distortion_luminance, Average_average_power_saving_luminance);
title("Average power saving vs Average distortion")
ylabel('Average power saving')
xlabel('Average distortion') 
grid
label = strcat('l = ', num2str(luminance_param));
text(Average_distortion_luminance + 0.1, Average_average_power_saving_luminance + 0.1, label)