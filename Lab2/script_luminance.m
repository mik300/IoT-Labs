prompt = "What is the initial value to analyze ? ";
luminance_parameterINIT = input(prompt);

if luminance_parameterINIT <= 0 
   error('Input cannot be equal or lower than 0'); 
end

prompt = "What is the final value to analyze ? ";
luminance_parameterOUT = input(prompt);

if luminance_parameterOUT <= luminance_parameterINIT  
   error('Final value cannot be lower or equal to initial value'); 
end

prompt = "What is the step ? ";
luminance_parameterSTEP = input(prompt);

myDir = strcat(pwd,'\misc\') ; %gets directory   
myDir2 = strcat(pwd,'\test\') ; %gets directory 2
myFiles = dir(fullfile(myDir,'*.tiff')); %gets all tiff files in struct
myFiles2 = dir(fullfile(myDir2,'*.jpg')); %gets all tiff files in struct


General_distortion = [];
General_average_power_saving = [];
General_original_power = [];
luminance_param = [];
number_images = 0;

elements_folder1 = 1;
elements_folder2 = 1;

filename_luminance_max_dist = '';
filename_luminance_min_dist = '';
filename_luminance_max_saving = '';
filename_luminance_min_saving = '';
param_luminance_max_power_savings = 0;
param_luminance_min_power_savings = 0;
param_luminance_max_distorsion = 0;
param_luminance_min_distorsion = 0;
dist_luminance_max = 0;
dist_luminance_min = 100;
saving_luminance_max = 0;
saving_luminance_min = 100;
dist_max_savings = 0; %what is the power savings when we get max distortion
dist_min_savings = 0;
saving_max_dist = 0; %what is the distortion when we get max power savings
saving_min_dist = 0;

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
    
        COMP_distortion = [];
        COMP_power_saving = [];
        COMP_original_power = [];
        
        for i = luminance_parameterINIT : luminance_parameterSTEP : luminance_parameterOUT
            %Tranform image into HSV spaces and modify it
            mod_img = luminance_transformation(img_rgb, i);
            modified_power_consumption = P_image(mod_img);
            average_power_saving = saving_perc(image_power_consumption, modified_power_consumption);
            distortion_percentage = distortion_perc(img_rgb, mod_img);

            %To calculate representative information
            if distortion_percentage >= dist_luminance_max
                dist_luminance_max = distortion_percentage; 
                filename_luminance_max_dist = filename;
                param_luminance_max_distorsion = i;
                dist_max_savings = average_power_saving;
            end
            if distortion_percentage <= dist_luminance_min
                dist_luminance_min = distortion_percentage; 
                filename_luminance_min_dist = filename;
                param_luminance_min_distorsion = i;
                dist_min_savings = average_power_saving;
            end 
            if average_power_saving >= saving_luminance_max
                saving_luminance_max = average_power_saving;
                filename_luminance_max_saving = filename;
                param_luminance_max_power_savings = i;
                saving_max_dist = distortion_percentage;
            end 
            if average_power_saving <= saving_luminance_min
                saving_luminance_min = average_power_saving;
                filename_luminance_min_saving = filename;
                param_luminance_min_power_savings = i;
                saving_min_dist = distortion_percentage;
            end 


            COMP_distortion = [COMP_distortion distortion_percentage];
            COMP_power_saving = [COMP_power_saving average_power_saving];
            if k == 1
                luminance_param = [luminance_param ; i];
            end
        end
        General_distortion = [ General_distortion ; COMP_distortion ];
        %General_original_power = [General_original_power ; COMP_original_power];
        General_average_power_saving = [General_average_power_saving ; COMP_power_saving];
    end

end

results_luminance = [" " "Filename" "Parameter" "Power savings" "Distortion";
            "Max distortion" filename_luminance_max_dist param_luminance_max_distorsion dist_max_savings dist_luminance_max;
            "Min distortion" filename_luminance_min_dist param_luminance_min_distorsion dist_min_savings dist_luminance_min;
            "Max power savings" filename_luminance_max_saving param_luminance_max_power_savings saving_luminance_max saving_max_dist;
            "Min power savings" filename_luminance_min_saving param_luminance_min_power_savings saving_luminance_min saving_min_dist;
            ] 

Average_distortion_luminance = sum(General_distortion) ./ number_images;
%Average_original_power = sum(General_original_power) ./ number_images;
Average_average_power_saving_luminance = sum(General_average_power_saving) ./ number_images;









