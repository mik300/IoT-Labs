A = importdata('workloads/workload_1.txt');
ENERGYWL1 = importdata('results/workload_1_results.txt');
ENERGYWL2 = importdata('results/workload_2_results.txt');
TO = importdata('results/TO.txt');

tiledlayout(1,2)
figure(1)
nexttile
plot(TO,ENERGYWL1)
title("Energy consumption of workload 1 vs. time out")
xlabel('Time out time (in ms)') 
ylabel('Energy dissipated')
grid
nexttile
plot(TO,ENERGYWL2)
title("Energy consumption of workload 2 vs. time out")
ylabel('Energy consumption of workload 2 vs. time out')
xlabel('Time out time (in ms)') 
ylabel('Energy dissipated')
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
figure(2)
plot(X, Y)
grid
