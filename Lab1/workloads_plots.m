%y = [1, 1,  1,  0,  0,  1,  1,  0,  0,  1,  1,  0,  0,  1,  1,  0,  0,  1,  1,  0,  0,  1,   1,   0];
%x = [0, 0, 32, 32, 35, 35, 40, 40, 43, 43, 48, 48, 52, 52, 56, 56, 60, 60, 64, 64, 68, 68, 303, 303];

A = importdata('workloads/workload_1.txt');
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
plot(X, Y)
