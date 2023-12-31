scatter(Average_distortion_lab, Average_average_power_saving_lab);
title("Average power saving vs Average distortion")
ylabel('Average power saving')
xlabel('Average distortion') 
grid
label = strcat('l = ', num2str(lab_param));
text(Average_distortion_lab + 0.1, Average_average_power_saving_lab + 0.1, label)

