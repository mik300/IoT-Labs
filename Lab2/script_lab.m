prompt = "What is the initial value to analyze ? ";
lab_parameterINIT = input(prompt);

if lab_parameterINIT <= 0 
   error('Input cannot be equal or lower than 0'); 
end

prompt = "What is the final value to analyze ? ";
lab_parameterOUT = input(prompt);

if lab_parameterOUT <= lab_parameterINIT  
   error('Final value cannot be lower or equal to initial value'); 
end

prompt = "What is the step ? ";
lab_parameterSTEP = input(prompt);

myDir = strcat(pwd,'\misc\') ; %gets directory   
myDir2 = strcat(pwd,'\test\') ; %gets directory 2
myFiles = dir(fullfile(myDir,'*.tiff')); %gets all tiff files in struct
myFiles2 = dir(fullfile(myDir2,'*.jpg')); %gets all tiff files in struct


General_distortion = [];
General_average_power_saving = [];
General_original_power = [];
lab_param = [];
number_images = 0;

elements_folder1 = 1;
elements_folder2 = 1;

filename_lab_max_dist = '';
filename_lab_min_dist = '';
filename_lab_max_saving = '';
filename_lab_min_saving = '';
param_lab_max_power_savings = 0;
param_lab_min_power_savings = 0;
param_lab_max_distorsion = 0;
param_lab_min_distorsion = 0;
dist_lab_max = 0;
dist_lab_min = 100;
saving_lab_max = 0;
saving_lab_min = 100;
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
        
        for i = lab_parameterINIT : lab_parameterSTEP : lab_parameterOUT
            %Tranform image into HSV spaces and modify it
            mod_img = lab_transformation(img_rgb, i);
            modified_power_consumption = P_image(mod_img);
            average_power_saving = saving_perc(image_power_consumption, modified_power_consumption);
            distortion_percentage = distortion_perc(img_rgb, mod_img);

            %To calculate representative information
            if distortion_percentage >= dist_lab_max
                dist_lab_max = distortion_percentage; 
                filename_lab_max_dist = filename;
                param_lab_max_distorsion = i;
                dist_max_savings = average_power_saving;
            end
            if distortion_percentage <= dist_lab_min
                dist_lab_min = distortion_percentage; 
                filename_lab_min_dist = filename;
                param_lab_min_distorsion = i;
                dist_min_savings = average_power_saving;
            end 
            if average_power_saving >= saving_lab_max
                saving_lab_max = average_power_saving;
                filename_lab_max_saving = filename;
                param_lab_max_power_savings = i;
                saving_max_dist = distortion_percentage;
            end 
            if average_power_saving <= saving_lab_min
                saving_lab_min = average_power_saving;
                filename_lab_min_saving = filename;
                param_lab_min_power_savings = i;
                saving_min_dist = distortion_percentage;
            end 


            COMP_distortion = [COMP_distortion distortion_percentage];
            COMP_power_saving = [COMP_power_saving average_power_saving];
            if k == 1
                lab_param = [lab_param ; i];
            end
        end
        General_distortion = [ General_distortion ; COMP_distortion ];
        %General_original_power = [General_original_power ; COMP_original_power];
        General_average_power_saving = [General_average_power_saving ; COMP_power_saving];
    end

end

results_lab = [" " "Filename" "Parameter" "Power savings" "Distortion";
            "Max distortion" filename_lab_max_dist param_lab_max_distorsion dist_max_savings dist_lab_max;
            "Min distortion" filename_lab_min_dist param_lab_min_distorsion dist_min_savings dist_lab_min;
            "Max power savings" filename_lab_max_saving param_lab_max_power_savings saving_lab_max saving_max_dist;
            "Min power savings" filename_lab_min_saving param_lab_min_power_savings saving_lab_min saving_min_dist;
            ] 

Average_distortion_lab = sum(General_distortion) ./ number_images;
%Average_original_power = sum(General_original_power) ./ number_images;
Average_average_power_saving_lab = sum(General_average_power_saving) ./ number_images;









