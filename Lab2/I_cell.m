function i_cell = I_cell(Vdd,D_RGB)
p1 = 4.251*10^(-5);
p2 = -3.029*10^(-4);
p3 = 3.024*10^(-5);
i_cell = (p1*Vdd*D_RGB)/255 + (p2*D_RGB)/255 + p3;
end