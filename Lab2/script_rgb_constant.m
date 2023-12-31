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

filename_R_max_dist = '';
filename_R_min_dist = '';
filename_R_max_saving = '';
filename_R_min_saving = '';
param_R_max_power_savings = 0;
param_R_min_power_savings = 0;
param_R_max_distorsion = 0;
param_R_min_distorsion = 0;
dist_R_max = 0;
dist_R_min = 100;
dist_R_max_savings = 0; %what is the power savings when we get max distortion
dist_R_min_savings = 0;
saving_R_max = 0;
saving_R_min = 100;
saving_R_max_dist = 0; %what is the distortion when we get max power savings
saving_R_min_dist = 0;
results_R = [];

filename_G_max_dist = '';
filename_G_min_dist = '';
filename_G_max_saving = '';
filename_G_min_saving = '';
param_G_max_power_savings = 0;
param_G_min_power_savings= 0;
param_G_max_distorsion = 0;
param_G_min_distorsion = 0;
dist_G_max = 0;
dist_G_min = 100;
dist_G_max_savings = 0; %what is the power savings when we get max distortion
dist_G_min_savings = 0;
saving_G_max = 0;
saving_G_min = 100;
saving_G_max_dist = 0; %what is the distortion when we get max power savings
saving_G_min_dist = 0;
results_G = [];


filename_B_max_dist = '';
filename_B_min_dist = '';
filename_B_max_saving = '';
filename_B_min_saving = '';
param_B_max_power_savings = 0;
param_B_min_power_savings = 0;
param_B_max_distorsion = 0;
param_B_min_distorsion = 0;
dist_B_max = 0;
dist_B_min = 100;
dist_B_max_savings = 0; %what is the power savings when we get max distortion
dist_B_min_savings = 0;
saving_B_max = 0;
saving_B_min = 100;
saving_B_max_dist = 0; %what is the distortion when we get max power savings
saving_B_min_dist = 0;
results_B = [];


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
            %To calculate representative information
            if distortion_percentage_B >= dist_B_max
                dist_B_max = distortion_percentage_B; 
                filename_B_max_dist = filename;
                param_B_max_distorsion = i;
                dist_B_max_savings = average_power_saving_B;
            end
            if distortion_percentage_B <= dist_B_min
                dist_B_min = distortion_percentage_B; 
                filename_B_min_dist = filename;
                param_B_min_distorsion = i;
                dist_B_min_savings = average_power_saving_B;
            end 
            if average_power_saving_B >= saving_B_max
                saving_B_max = average_power_saving_B;
                filename_B_max_saving = filename;
                param_B_max_power_savings = i;
                saving_B_max_dist = distortion_percentage_B;
            end 
            if average_power_saving_B <= saving_B_min
                saving_B_min = average_power_saving_B;
                filename_B_min_saving = filename;
                param_B_min_power_savings = i;
                saving_B_min_dist = distortion_percentage_B;
            end 

            COMP_distortion_B = [COMP_distortion_B distortion_percentage_B];
            COMP_power_saving_B = [COMP_power_saving_B average_power_saving_B];
            
            


            mod_rgb_R = red_transformation(img_rgb,i);
            modified_power_consumption_R = P_image(mod_rgb_R);
            average_power_saving_R = saving_perc(image_power_consumption, modified_power_consumption_R);
            distortion_percentage_R = distortion_perc(img_rgb, mod_rgb_R);
            
            %To calculate representative information
            if distortion_percentage_R >= dist_R_max
                dist_R_max = distortion_percentage_R; 
                filename_R_max_dist = filename;
                param_R_max_distorsion = i;
                dist_R_max_savings = average_power_saving_R;
            end
            if distortion_percentage_R <= dist_R_min
                dist_R_min = distortion_percentage_R; 
                filename_R_min_dist = filename;
                param_R_min_distorsion = i;
                dist_R_min_savings = average_power_saving_R;
            end 
            if average_power_saving_R >= saving_R_max
                saving_R_max = average_power_saving_R;
                filename_R_max_saving = filename;
                param_R_max_power_savings = i;
                saving_R_max_dist = distortion_percentage_R;
            end 
            if average_power_saving_R <= saving_R_min
                saving_R_min = average_power_saving_R;
                filename_R_min_saving = filename;
                param_R_min_power_savings = i;
                saving_R_min_dist = distortion_percentage_R;
            end 

            COMP_distortion_R = [COMP_distortion_R distortion_percentage_R];
            COMP_power_saving_R = [COMP_power_saving_R average_power_saving_R];
            



            mod_rgb_G = green_transformation(img_rgb,i);
            modified_power_consumption_G = P_image(mod_rgb_G);
            average_power_saving_G = saving_perc(image_power_consumption, modified_power_consumption_G);
            distortion_percentage_G = distortion_perc(img_rgb, mod_rgb_G);

            %To calculate representative information
            if distortion_percentage_G >= dist_G_max
                dist_G_max = distortion_percentage_G; 
                filename_G_max_dist = filename;
                param_G_max_distorsion = i;
                dist_G_max_savings = average_power_saving_G;
            end
            if distortion_percentage_G <= dist_G_min
                dist_G_min = distortion_percentage_G; 
                filename_G_min_dist = filename;
                param_G_min_distorsion = i;
                dist_G_min_savings = average_power_saving_G;
            end 
            if average_power_saving_G >= saving_G_max
                saving_G_max = average_power_saving_G;
                filename_G_max_saving = filename;
                param_G_max_power_savings = i;
                saving_G_max_dist = distortion_percentage_G;
            end 
            if average_power_saving_G <= saving_G_min
                saving_G_min = average_power_saving_G;
                filename_G_min_saving = filename;
                param_G_min_power_savings= i;
                saving_G_min_dist = distortion_percentage_G;
            end 

            COMP_distortion_G = [COMP_distortion_G distortion_percentage_G];
            COMP_power_saving_G = [COMP_power_saving_G average_power_saving_G];
            
            if k == 1
                constant = [constant ; i];
            end
        end

        %Set of data for same image, all parameters
        %Each matrix represents: 1 image = 1 row, 1 column = 1 parameter
        General_distortion_B = [ General_distortion_B ; COMP_distortion_B ]; 
        General_average_power_saving_B = [General_average_power_saving_B ; COMP_power_saving_B];
        
        General_distortion_R = [ General_distortion_R ; COMP_distortion_R ];
        General_average_power_saving_R = [General_average_power_saving_R ; COMP_power_saving_R];
        
        General_distortion_G = [ General_distortion_G ; COMP_distortion_G ];
        General_average_power_saving_G = [General_average_power_saving_G ; COMP_power_saving_G];
    end

end

results_B = [" " "Filename" "Parameter" "Power savings" "Distortion";
            "Max distortion" filename_B_max_dist param_B_max_distorsion dist_B_max_savings dist_B_max;
            "Min distortion" filename_B_min_dist param_B_min_distorsion dist_B_min_savings dist_B_min;
            "Max power savings" filename_B_max_saving param_B_max_power_savings saving_B_max saving_B_max_dist;
            "Min power savings" filename_B_min_saving param_B_min_power_savings saving_B_min saving_B_min_dist;
            ] 

results_R = [" " "Filename" "Parameter" "Power savings" "Distortion";
            "Max distortion" filename_R_max_dist param_R_max_distorsion dist_R_max_savings dist_R_max;
            "Min distortion" filename_R_min_dist param_R_min_distorsion dist_R_min_savings dist_R_min;
            "Max power savings" filename_R_max_saving param_R_max_power_savings saving_R_max saving_R_max_dist;
            "Min power savings" filename_R_min_saving param_R_min_power_savings saving_R_min saving_R_min_dist;
            ] 

results_G = [" " "Filename" "Parameter" "Power savings" "Distortion";
            "Max distortion" filename_G_max_dist param_G_max_distorsion dist_G_max_savings dist_G_max;
            "Min distortion" filename_G_min_dist param_G_min_distorsion dist_G_min_savings dist_G_min;
            "Max power savings" filename_G_max_saving param_G_max_power_savings saving_G_max saving_G_max_dist;
            "Min power savings" filename_G_min_saving param_G_min_power_savings saving_G_min saving_G_min_dist;
            ] 

%Set of data for all images, all parameters
Average_distortion_B = sum(General_distortion_B) ./ number_images;
Average_average_power_saving_B = sum(General_average_power_saving_B) ./ number_images;

Average_distortion_R = sum(General_distortion_R) ./ number_images;
Average_average_power_saving_R = sum(General_average_power_saving_R) ./ number_images;

Average_distortion_G = sum(General_distortion_G) ./ number_images;
Average_average_power_saving_G = sum(General_average_power_saving_G) ./ number_images;






