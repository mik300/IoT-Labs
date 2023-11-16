format long
ENERGYWLsleep = importdata('results/using_TO/workload_2_energy_w_DPMSLEEP.txt');
ENERGYWLidle = importdata('results/using_TO/workload_2_energy_w_DPMIDLE.txt');
TO = importdata('results/using_TO/TO.txt');

tiledlayout(1,2)
figure(1)
nexttile
plot(TO,ENERGYWLsleep)
title("Energy consumption of workload vs. time out(SLEEP)")
xlabel('Time out time (in ms)') 
ylabel('Energy dissipated(J)')
grid
nexttile
plot(TO,ENERGYWLidle)
title("Energy consumption of workload  vs. time out(IDLE)")
ylabel('Energy dissipated(J)')
xlabel('Time out time (in ms)') 
ylabel('Energy dissipated(J)')
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