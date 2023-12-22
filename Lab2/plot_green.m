figure
scatter(Average_distortion_G, Average_average_power_saving_G, 'filled','g');
title("Average power vs Average distortion using green transformation")
ylabel('Average power')
xlabel('Average distortion') 
grid
label = strcat('g = ', num2str(constant));
text(Average_distortion_G, Average_average_power_saving_G + 0.1, label)