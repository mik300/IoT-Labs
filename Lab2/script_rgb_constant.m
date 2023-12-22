clear
clc
prompt = "What is the initial value to analyze ? ";
constant_INIT = input(prompt);

prompt = "What is the final value to analyze ? ";
constant_OUT = input(prompt);

prompt = "What is the step ? ";
constant_STEP = input(prompt);

myDir = strcat(pwd,'\misc\') ; %gets directory   
myDir2 = strcat(pwd,'\test\') ; %gets directory 2
myFiles = dir(fullfile(myDir,'*.tiff')); %gets all tiff files in struct
myFiles2 = dir(fullfile(myDir2,'*.jpg')); %gets all tiff files in struct

General_distortion_B = [];
General_average_power_saving_B = [];

General_distortion_R = [];
General_average_power_saving_R = [];

General_distortion_G = [];
General_average_power_saving_G = [];

constant = [];
number_images = 0;


elements_folder1 = 1;
elements_folder2 = 1;

for k = 1:length(myFiles) + length(myFiles2)

    %Read first folder
    if k <= length(myFiles)
        filename = strcat(myDir, num2str(myFiles(elements_folder1).name));
        elements_folder1 = elements_folder1 + 1;
    %Read second folder
    else
        filename = strcat(myDir2, num2str(myFiles2(elements_folder2).name));
        elements_folder2 = elements_folder2 + 1;

    end 
    img_rgb = imread(filename);

    if length(size(img_rgb)) == 3 %filter out grayscale images
        image_power_consumption = P_image(img_rgb);
        number_images = number_images + 1;
    
        COMP_distortion_B = [];
        COMP_power_saving_B = [];
        
        COMP_distortion_R = [];
        COMP_power_saving_R = [];
        
        COMP_distortion_G = [];
        COMP_power_saving_G = [];
        
        for i = constant_INIT : constant_STEP : constant_OUT
            mod_rgb_B = blue_transformation(img_rgb,i);
            modified_power_consumption_B = P_image(mod_rgb_B);
            average_power_saving_B = saving_perc(image_power_consumption, modified_power_consumption_B);
            distortion_percentage_B = distortion_perc(img_rgb, mod_rgb_B);
            COMP_distortion_B = [COMP_distortion_B distortion_percentage_B];
            COMP_power_saving_B = [COMP_power_saving_B average_power_saving_B];
            
            mod_rgb_R = red_transformation(img_rgb,i);
            modified_power_consumption_R = P_image(mod_rgb_R);
            average_power_saving_R = saving_perc(image_power_consumption, modified_power_consumption_R);
            distortion_percentage_R = distortion_perc(img_rgb, mod_rgb_R);
            COMP_distortion_R = [COMP_distortion_R distortion_percentage_R];
            COMP_power_saving_R = [COMP_power_saving_R average_power_saving_R];
            
            mod_rgb_G = green_transformation(img_rgb,i);
            modified_power_consumption_G = P_image(mod_rgb_G);
            average_power_saving_G = saving_perc(image_power_consumption, modified_power_consumption_G);
            distortion_percentage_G = distortion_perc(img_rgb, mod_rgb_G);
            COMP_distortion_G = [COMP_distortion_G distortion_percentage_G];
            COMP_power_saving_G = [COMP_power_saving_G average_power_saving_G];
            
            if k == 1
                constant = [constant ; i];
            end
        end
        General_distortion_B = [ General_distortion_B ; COMP_distortion_B ];
        General_average_power_saving_B = [General_average_power_saving_B ; COMP_power_saving_B];
        
        General_distortion_R = [ General_distortion_R ; COMP_distortion_R ];
        General_average_power_saving_R = [General_average_power_saving_R ; COMP_power_saving_R];
        
        General_distortion_G = [ General_distortion_G ; COMP_distortion_G ];
        General_average_power_saving_G = [General_average_power_saving_G ; COMP_power_saving_G];
    end

end

Average_distortion_B = sum(General_distortion_B) ./ number_images;
Average_average_power_saving_B = sum(General_average_power_saving_B) ./ number_images;

Average_distortion_R = sum(General_distortion_R) ./ number_images;
Average_average_power_saving_R = sum(General_average_power_saving_R) ./ number_images;

Average_distortion_G = sum(General_distortion_G) ./ number_images;
Average_average_power_saving_G = sum(General_average_power_saving_G) ./ number_images;






