format long
ENERGYWL1IDLE = importdata('results/using_TO/workload_1_energy_w_DPMIDLE.txt');
ENERGYWL2IDLE = importdata('results/using_TO/workload_2_energy_w_DPMIDLE.txt');
TO = importdata('results/using_TO/TO.txt');

figure(1)
tiledlayout(1,2)
nexttile
plot(TO,ENERGYWL1IDLE)
title("Energy consumption of workload 1 vs. time out")
xlabel('Time out time (in ms)') 
ylabel('Energy dissipated(J)')
grid
nexttile
plot(TO,ENERGYWL2IDLE)
title("Energy consumption of workload 2 vs. time out")
ylabel('Energy consumption of workload 2 vs. time out')
xlabel('Time out time (in ms)') 
ylabel('Energy dissipated(J)')
grid



ENERGYWL1SLEEP = importdata('results/using_TO/workload_1_energy_w_DPMSLEEP.txt');
ENERGYWL2SLEEP = importdata('results/using_TO/workload_2_energy_w_DPMSLEEP.txt');
TO = importdata('results/using_TO/TO.txt');

figure(2)
tiledlayout(1,2)
nexttile
plot(TO,ENERGYWL1SLEEP)
title("Energy consumption of workload 1 vs. time out")
xlabel('Time out time (in ms)') 
ylabel('Energy dissipated(J)')
grid
nexttile
plot(TO,ENERGYWL2SLEEP)
title("Energy consumption of workload 2 vs. time out")
ylabel('Energy consumption of workload 2 vs. time out')
xlabel('Time out time (in ms)') 
ylabel('Energy dissipated(J)')
grid


