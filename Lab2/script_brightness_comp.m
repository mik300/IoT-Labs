clc
prompt = "What is the initial Vdd to analyze ? ";
Vdd_parameterINIT = input(prompt);

if Vdd_parameterINIT <= 0 
   error('Input cannot be equal or lower than 0'); 
end

prompt = "What is the final Vdd to analyze ? ";
Vdd_parameterOUT = input(prompt);

if Vdd_parameterOUT <= Vdd_parameterINIT  
   error('Final value cannot be lower or equal to initial value'); 
end

if Vdd_parameterOUT > 15  
   error('Final value can be equal to 15, but not greater'); 
end

prompt = "What is the step ? ";
Vdd_parameterSTEP = input(prompt);

prompt = "What is the maximum distorsion to consider(in %)? ";
desired_maximum_distorsion = input(prompt);

myDir = strcat(pwd,'\misc\') ; %gets directory   
myDir2 = strcat(pwd,'\test\') ; %gets directory 2
myFiles = dir(fullfile(myDir,'*.tiff')); %gets all tiff files in struct
myFiles2 = dir(fullfile(myDir2,'*.jpg')); %gets all tiff files in struct


General_distortion_DVS_ori = [];
General_average_power_saving_DVS_ori = [];
General_distortion_modDVS_ori = [];
General_average_power_saving_modDVS_ori = [];

Vdd_param = [];
Matrix_compareVDDb = [];
number_images = 0;

elements_folder1 = 1;
elements_folder2 = 1;

filename_Vdd_max_dist_DVS_ori = '';
filename_Vdd_min_dist_DVS_ori = '';
filename_Vdd_max_saving_DVS_ori = '';
filename_Vdd_min_saving_DVS_ori = '';
param_Vdd_max_power_savings_DVS_ori = 0;
param_Vdd_min_power_savings_DVS_ori = 0;
param_Vdd_max_distorsion_DVS_ori = 0;
param_Vdd_min_distorsion_DVS_ori = 0;
dist_Vdd_max_DVS_ori = 0;
dist_Vdd_min_DVS_ori = 100;
saving_Vdd_max_DVS_ori = 0;
saving_Vdd_min_DVS_ori = 100;
dist_max_savings_DVS_ori = 0; %what is the power savings when we get max distortion
dist_min_savings_DVS_ori = 0;
saving_max_dist_DVS_ori = 0; %what is the distortion when we get max power savings
saving_min_dist_DVS_ori = 0;

filename_Vdd_max_dist_modDVS_ori = '';
filename_Vdd_min_dist_modDVS_ori = '';
filename_Vdd_max_saving_modDVS_ori = '';
filename_Vdd_min_saving_modDVS_ori = '';
param_Vdd_max_power_savings_modDVS_ori = 0;
param_Vdd_min_power_savings_modDVS_ori = 0;
param_Vdd_max_distorsion_modDVS_ori = 0;
param_Vdd_min_distorsion_modDVS_ori = 0;
dist_Vdd_max_modDVS_ori = 0;
dist_Vdd_min_modDVS_ori = 100;
saving_Vdd_max_modDVS_ori = 0;
saving_Vdd_min_modDVS_ori = 100;
dist_max_savings_modDVS_ori = 0; %what is the power savings when we get max distortion
dist_min_savings_modDVS_ori = 0;
saving_max_dist_modDVS_ori = 0; %what is the distortion when we get max power savings
saving_min_dist_modDVS_ori = 0;

array_of_Vdd = [];

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
        %Power consumption without applying neither DVS nor transformations
        i_cell_original = I_cell(15, double(img_rgb));
        image_power_consumption = P_panel(15, i_cell_original);


        number_images = number_images + 1;
    
        COMP_distortion_DVS_ori = [];
        COMP_power_saving_DVS_ori = [];

        COMP_distortion_modDVS_ori = [];
        COMP_power_saving_modDVS_ori = [];
        
        for i = Vdd_parameterINIT : Vdd_parameterSTEP : Vdd_parameterOUT

            %Power consumption and distortion when applying DVS without tranformations
            i_cell = I_cell(i, double(img_rgb));
            img_DVS = (displayed_image(i_cell, i, 1)/255);
            image_DVS_power_consumption = P_panel(i, img_DVS);
            average_power_saving_DVS_ori = saving_perc(image_power_consumption, image_DVS_power_consumption);
            distortion_DVS_percentage = distortion_perc(img_rgb, img_DVS);
            
            b = (i - ((15 - i) / 15)) / 15; % b depends on the ratio of Vdd and the original Vdd
            mod_img = brightness_scaling(img_rgb, b);
            i_cell_mod = I_cell(i, double(mod_img));
            mod_img_DVS = (displayed_image(i_cell_mod, i, 1)/255);
            image_modDVS_power_consumption = P_panel(i, mod_img_DVS);
            distortion_modDVS_ori_percentage = distortion_perc(img_rgb, mod_img_DVS);
            average_power_saving_modDVS_ori = saving_perc(image_power_consumption, image_modDVS_power_consumption);

           

            %To calculate representative information
            if distortion_DVS_percentage >= dist_Vdd_max_DVS_ori
                dist_Vdd_max_DVS_ori = distortion_DVS_percentage; 
                filename_Vdd_max_dist_DVS_ori = filename;
                param_Vdd_max_distorsion_DVS_ori = i;
                dist_max_savings_DVS_ori = average_power_saving_DVS_ori;
            end
            if distortion_DVS_percentage <= dist_Vdd_min_DVS_ori
                dist_Vdd_min_DVS_ori = distortion_DVS_percentage; 
                filename_Vdd_min_dist_DVS_ori = filename;
                param_Vdd_min_distorsion_DVS_ori = i;
                dist_min_savings_DVS_ori = average_power_saving_DVS_ori;
            end 
            if average_power_saving_DVS_ori >= saving_Vdd_max_DVS_ori
                saving_Vdd_max_DVS_ori = average_power_saving_DVS_ori;
                filename_Vdd_max_saving_DVS_ori = filename;
                param_Vdd_max_power_savings_DVS_ori = i;
                saving_max_dist_DVS_ori = distortion_DVS_percentage;
            end 
            if average_power_saving_DVS_ori <= saving_Vdd_min_DVS_ori
                saving_Vdd_min_DVS_ori = average_power_saving_DVS_ori;
                filename_Vdd_min_saving_DVS_ori = filename;
                param_Vdd_min_power_savings_DVS_ori = i;
                saving_min_dist_DVS_ori = distortion_DVS_percentage;
            end 


            
            if distortion_modDVS_ori_percentage >= dist_Vdd_max_modDVS_ori
                dist_Vdd_max_modDVS_ori = distortion_modDVS_ori_percentage; 
                filename_Vdd_max_dist_modDVS_ori = filename;
                param_Vdd_max_distorsion_modDVS_ori = i;
                dist_max_savings_modDVS_ori = average_power_saving_modDVS_ori;
            end
            if distortion_modDVS_ori_percentage <= dist_Vdd_min_modDVS_ori
                dist_Vdd_min_modDVS_ori = distortion_modDVS_ori_percentage; 
                filename_Vdd_min_dist_modDVS_ori = filename;
                param_Vdd_min_distorsion_modDVS_ori = i;
                dist_min_savings_modDVS_ori = average_power_saving_modDVS_ori;
            end 
            if average_power_saving_modDVS_ori >= saving_Vdd_max_modDVS_ori
                saving_Vdd_max_modDVS_ori = average_power_saving_modDVS_ori;
                filename_Vdd_max_saving_modDVS_ori = filename;
                param_Vdd_max_power_savings_modDVS_ori = i;
                saving_max_dist_modDVS_ori = distortion_modDVS_ori_percentage;
            end 
            if average_power_saving_modDVS_ori <= saving_Vdd_min_modDVS_ori
                saving_Vdd_min_modDVS_ori = average_power_saving_modDVS_ori;
                filename_Vdd_min_saving_modDVS_ori = filename;
                param_Vdd_min_power_savings_modDVS_ori = i;
                saving_min_dist_modDVS_ori = distortion_modDVS_ori_percentage;
            end 

            if distortion_modDVS_ori_percentage<= desired_maximum_distorsion %If the distorsion is below our desired distorsion
                Matrix_compareVDDb = [Matrix_compareVDDb; b i average_power_saving_modDVS_ori distortion_modDVS_ori_percentage];
            end 
            COMP_distortion_DVS_ori= [COMP_distortion_DVS_ori distortion_DVS_percentage];
            COMP_power_saving_DVS_ori = [COMP_power_saving_DVS_ori average_power_saving_DVS_ori];

            COMP_distortion_modDVS_ori = [COMP_distortion_modDVS_ori distortion_modDVS_ori_percentage];
            COMP_power_saving_modDVS_ori = [COMP_power_saving_modDVS_ori average_power_saving_modDVS_ori];
            if k == 1
                Vdd_param = [Vdd_param ; i];
            end
        end
        General_distortion_DVS_ori = [ General_distortion_DVS_ori ; COMP_distortion_DVS_ori ];
        General_average_power_saving_DVS_ori = [General_average_power_saving_DVS_ori ; COMP_power_saving_DVS_ori];
        General_distortion_modDVS_ori = [ General_distortion_modDVS_ori ; COMP_distortion_modDVS_ori ];
        General_average_power_saving_modDVS_ori = [General_average_power_saving_modDVS_ori ; COMP_power_saving_modDVS_ori];
    end

end

results_DVS_ori = [" " "Filename" "Parameter" "Power savings" "Distortion";
            "Max distortion" filename_Vdd_max_dist_DVS_ori param_Vdd_max_distorsion_DVS_ori dist_max_savings_DVS_ori dist_Vdd_max_DVS_ori;
            "Min distortion" filename_Vdd_min_dist_DVS_ori param_Vdd_min_distorsion_DVS_ori dist_min_savings_DVS_ori dist_Vdd_min_DVS_ori;
            "Max power savings" filename_Vdd_max_saving_DVS_ori param_Vdd_max_power_savings_DVS_ori saving_Vdd_max_DVS_ori saving_max_dist_DVS_ori;
            "Min power savings" filename_Vdd_min_saving_DVS_ori param_Vdd_min_power_savings_DVS_ori saving_Vdd_min_DVS_ori saving_min_dist_DVS_ori;
            ] 

results_modDVS_ori = [" " "Filename" "Parameter" "Power savings" "Distortion";
            "Max distortion" filename_Vdd_max_dist_modDVS_ori param_Vdd_max_distorsion_modDVS_ori dist_max_savings_modDVS_ori dist_Vdd_max_modDVS_ori;
            "Min distortion" filename_Vdd_min_dist_modDVS_ori param_Vdd_min_distorsion_modDVS_ori dist_min_savings_modDVS_ori dist_Vdd_min_modDVS_ori;
            "Max power savings" filename_Vdd_max_saving_modDVS_ori param_Vdd_max_power_savings_modDVS_ori saving_Vdd_max_modDVS_ori saving_max_dist_modDVS_ori;
            "Min power savings" filename_Vdd_min_saving_modDVS_ori param_Vdd_min_power_savings_modDVS_ori saving_Vdd_min_modDVS_ori saving_min_dist_modDVS_ori;
            ] 

Average_distortion_DVS_ori = sum(General_distortion_DVS_ori) ./ number_images;
Average_average_power_saving_DVS_ori = sum(General_average_power_saving_DVS_ori) ./ number_images;

Average_distortion_modDVS_ori = sum(General_distortion_modDVS_ori) ./ number_images;
Average_average_power_saving_modDVS_ori = sum(General_average_power_saving_modDVS_ori) ./ number_images;


clear average_power_saving_DVS_ori
clear average_power_saving_modDVS_ori
clear dist_max_savings_DVS_ori
clear dist_max_savings_modDVS_ori
clear dist_min_savings_DVS_ori
clear dist_min_savings_modDVS_ori
clear dist_Vdd_max_DVS_ori
clear dist_Vdd_max_modDVS_ori
clear dist_Vdd_min_DVS_ori
clear dist_Vdd_min_modDVS_ori
clear distortion_DVS_percentage
clear distortion_modDVS_ori_percentage
clear elements_folder1
clear elements_folder2
clear i_cell
clear i_cell_mod
clear image_DVS_power_consumption
clear image_modDVS_power_consumption
clear img_DVS
clear mod_img_DVS
clear myDir
clear myDir2
clear myFiles
clear myFiles2
clear number_images
clear image_power_consumption
clear prompt
