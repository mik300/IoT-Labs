figure
hold on
V250 = trace250(:,1);
I250 = trace250(:,2);
power250 = V250 .* I250; 
plot(V250, power250)
max_power250 = max(power250);
MPP_index = find(power250 == max_power250);
max_V250 = V250(MPP_index)
max_I250 = I250(MPP_index)

V500 = trace500(:,1);
I500 = trace500(:,2);
power500 = V500 .* I500; 
plot(V500, power500)
max_power500 = max(power500);
MPP_index = find(power500 == max_power500);
max_V500 = V500(MPP_index)
max_I500 = I500(MPP_index)

V750 = trace750(:,1);
I750 = trace750(:,2);
power750 = V750 .* I750; 
plot(V750, power750)
max_power750 = max(power750);
MPP_index = find(power750 == max_power750);
max_V750 = V750(MPP_index)
max_I750 = I750(MPP_index)

V1000 = trace1000(:,1);
I1000 = trace1000(:,2);
power1000 = V1000 .* I1000; 
plot(V1000, power1000)
max_power1000 = max(power1000);
MPP_index = find(power1000 == max_power1000);
max_V1000 = V1000(MPP_index)
max_I1000 = I1000(MPP_index)


G = [250, 500, 750, 1000]
I_MPP = [max_I250, max_I500, max_I750, max_I1000]
V_MPP = [max_V250, max_V500, max_V750, max_V1000]