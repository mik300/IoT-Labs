format long
ENERGYWLsleep1 = importdata('results/using_TO/workload_1_energy_w_DPMSLEEP.txt');
ENERGYWLidle1 = importdata('results/using_TO/workload_1_energy_w_DPMIDLE.txt');
TO = importdata('results/using_TO/TO.txt');

figure(1)
tiledlayout(1,2)
nexttile
plot(TO,ENERGYWLsleep1)
title("Energy consumption of workload 1 vs. time out(SLEEP)")
xlabel('Time out time (in ms)') 
ylabel('Energy dissipated(J)')
grid
nexttile
plot(TO,ENERGYWLidle1)
title("Energy consumption of workload 1 vs. time out(IDLE)")
ylabel('Energy dissipated(J)')
xlabel('Time out time (in ms)') 
ylabel('Energy dissipated(J)')
grid




ENERGYWLsleep2 = importdata('results/using_TO/workload_2_energy_w_DPMSLEEP.txt');
ENERGYWLidle2 = importdata('results/using_TO/workload_2_energy_w_DPMIDLE.txt');
TO = importdata('results/using_TO/TO.txt');

figure(2)
tiledlayout(1,2)
nexttile
plot(TO,ENERGYWLsleep2)
title("Energy consumption of workload 2 vs. time out(SLEEP)")
xlabel('Time out time (in ms)') 
ylabel('Energy dissipated(J)')
grid
nexttile
plot(TO,ENERGYWLidle2)
title("Energy consumption of workload 2  vs. time out(IDLE)")
ylabel('Energy dissipated(J)')
xlabel('Time out time (in ms)') 
ylabel('Energy dissipated(J)')
grid


