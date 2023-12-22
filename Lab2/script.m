clear
clc
prompt = "What is the initial value to analyze ? ";
blue_parameterINIT = input(prompt);

prompt = "What is the final value to analyze ? ";
blue_parameterOUT = input(prompt);

prompt = "What is the step ? ";
blue_parameterSTEP = input(prompt);

myDir = strcat(pwd,'\misc\') ; %gets directory   
myFiles = dir(fullfile(myDir,'*.tiff')); %gets all tiff files in struct

General_distortion = [];
General_average_power_saving = [];
General_original_power = [];
blue_param = [];
number_images = 0;

for k = 1:length(myFiles)

    filename = strcat(myDir, num2str(myFiles(k).name));
    img_rgb = imread(filename);

    if length(size(img_rgb)) == 3 %filter out grayscale images
        image_power_consumption = P_image(img_rgb);
        number_images = number_images + 1;
    
        COMP_distortion = [];
        COMP_power_saving = [];
        COMP_original_power = [];
        
        for i = blue_parameterINIT : blue_parameterSTEP : blue_parameterOUT
            mod_rgb = blue_transformation(img_rgb,i);
            modified_power_consumption = P_image(mod_rgb);
            average_power_saving = saving_perc(image_power_consumption, modified_power_consumption);
            distortion_percentage = distortion_perc(img_rgb, mod_rgb);
            COMP_distortion = [COMP_distortion distortion_percentage];
            COMP_power_saving = [COMP_power_saving average_power_saving];
            if k == 1
                blue_param = [blue_param ; i];
            end
        end
        General_distortion = [ General_distortion ; COMP_distortion ];
        %General_original_power = [General_original_power ; COMP_original_power];
        General_average_power_saving = [General_average_power_saving ; COMP_power_saving];
    end

end

Average_distortion = sum(General_distortion) ./ number_images;
%Average_original_power = sum(General_original_power) ./ number_images;
Average_average_power_saving = sum(General_average_power_saving) ./ number_images;






