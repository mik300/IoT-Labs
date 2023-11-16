clear
clc
A = importdata('workloads/workload_1.txt');
B = importdata('workloads/workload_2.txt');
ENERGYWL1 = importdata('results/using_TO/workload_1_energy_w_DPM.txt');
ENERGYWL2 = importdata('results/using_TO/workload_2_energy_w_DPM.txt');
TO = importdata('results/using_TO/TO.txt');


figure(1)
tiledlayout(1,2)
nexttile
plot(TO,ENERGYWL1)
title("Energy consumption of workload 1 vs. Timeout (TO)")
xlabel('TO (in ms)') 
ylabel('Energy dissipated')
grid
nexttile
plot(TO,ENERGYWL2)
title("Energy consumption of workload 2 vs. Timeout (TO)")
xlabel('TO (in ms)') 
ylabel('Energy dissipated')
grid



ENERGYWL1_hist = importdata('results/using_history/workload_1_energy_w_DPM.txt');
Threshold2 = importdata('results/using_history/Threshold2.txt');
Threshold1 = importdata('results/using_history/Threshold1.txt');
figure(2)
plot3(Threshold1, Threshold2, ENERGYWL1_hist);
title("Energy consumption of workload 2 vs. Threshold 1 and Threshold 2")
xlabel('Threshold 1')
ylabel('Threshold 2')
zlabel('Energy')
grid

ENERGYWL1_hist_fixed_thresh2 = importdata('results/using_history/workload_1_fixed_Th2_energy_w_DPM.txt');
figure(3)
tiledlayout(1,2)
nexttile
plot(Threshold1, ENERGYWL1_hist_fixed_thresh2);
title("Energy consumption of workload 1 vs. Threshold 1 (Threshold 2 = 70)")
xlabel('Threshold 1')
ylabel('Energy')
grid

ENERGYWL1_hist_fixed_thresh1 = importdata('results/using_history/workload_1_fixed_Th1_energy_w_DPM.txt');
combined = [Threshold2 , ENERGYWL1_hist_fixed_thresh1];
sorted_combined = sortrows(combined, 1);
nexttile
plot(sorted_combined(:, 1), sorted_combined(:, 2));
title("Energy consumption of workload 1 vs. Threshold 2 (Threshold 1 = 0)")
xlabel('Threshold 2')
ylabel('Energy')
grid

%Workload 2 now
ENERGYWL2_hist = importdata('results/using_history/workload_2_energy_w_DPM.txt');
Threshold2 = importdata('results/using_history/Threshold2.txt');
Threshold1 = importdata('results/using_history/Threshold1.txt');
figure(4)
plot3(Threshold1, Threshold2, ENERGYWL2_hist);
title("Energy consumption of workload 2 vs. Threshold 1 and Threshold 2")
xlabel('Threshold 1')
ylabel('Threshold 2')
zlabel('Energy')
grid

ENERGYWL2_hist_fixed_thresh2 = importdata('results/using_history/workload_2_fixed_Th2_energy_w_DPM.txt');
figure(5)
tiledlayout(1,2)
nexttile
plot(Threshold1, ENERGYWL2_hist_fixed_thresh2);
title("Energy consumption of workload 2 vs. Threshold 1 (Threshold 2 = 70)")
xlabel('Threshold 1')
ylabel('Energy')
grid

ENERGYWL2_hist_fixed_thresh1 = importdata('results/using_history/workload_2_fixed_Th1_energy_w_DPM.txt');
combined2 = [Threshold2 , ENERGYWL2_hist_fixed_thresh1];
sorted_combined2 = sortrows(combined2, 1);
nexttile
plot(sorted_combined2(:, 1), sorted_combined2(:, 2));
title("Energy consumption of workload 2 vs. Threshold 2 (Threshold 1 = 0)")
xlabel('Threshold 2')
ylabel('Energy')
grid

X = []; %empty matrix to be filled in the loop, used as x values for plotting
Y = [1]; %used as y values for plotting

for i = 1:size(A,1) %loop over the entire workload.txt file (line by line)
    x = A(i, 1);    %extract first of line i (arrival)
    y = A(i, 2);    %extract second value of line i (duration)
    z = x+y;        %add arrival and duration
    X = [X x x];    %concatenate 2 values of x to the final matrix
    X = [X z z];    %concatenate 2 values of z to the final matrix
    
    
    if y == 0
         a = 0;         
         Y = [Y a, a];   %concatenate 0 0 to Y
    else
         a = 1; 
         Y = [Y a, a];       %concatenate 1 1 to Y
    end 
    
    if i < size(A,1)
        if  z == A(i+1, 1)   %if the current arrival+duration is equal to next arrival, workload doesn't go to 0
            Y = [Y a, a];   %concatenate 1 1 to Y
        else
            a = 0;         
            Y = [Y a, a];   %concatenate 0 0 to Y
        end
    end
end
Y = [Y 0];
figure(6)
plot(X, Y)
title("Workload 1")
xlabel('Time (in ms)') 
ylabel('Active/Inactive')
grid


X1 = []; 
Y1 = [1];
X = [3];
%this for loop is the same as the previous one but using the data of
%workload_2.txt instead of workload_1.txt
for j = 1:size(B,1) 
    x1 = B(j, 1);    
    y1 = B(j, 2);    
    z1 = x1+y1;        
    X1 = [X1 x1 x1];    
    X1 = [X1 z1 z1];    
    
    
    if y1 == 0
         a1 = 0;         
         Y1 = [Y1 a1, a1];   
    else
         a1 = 1; 
         Y1 = [Y1 a1, a1];       
    end 
    
    if j < size(B,1)
        if  z1 == B(j+1, 1)   
            Y1 = [Y1 a1, a1];   
        else
            a1 = 0;         
            Y1 = [Y1 a1, a1];   
        end
    end
end
Y1 = [Y1 0];
figure(7)
plot(X1, Y1)
title("Workload 2")
xlabel('Time (in ms)') 
ylabel('Active/Inactive')
grid
