clear
clc
prompt = "What is the initial value to analyze ? ";
luminance_parameterINIT = input(prompt);

if luminance_parameterINIT <= 0 
   error('Input cannot be equal or lower than 0'); 
end;

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

Average_distortion = sum(General_distortion) ./ number_images;
%Average_original_power = sum(General_original_power) ./ number_images;
Average_average_power_saving = sum(General_average_power_saving) ./ number_images;









