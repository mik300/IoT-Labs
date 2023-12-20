function p_power = P_pixel(R,G,B)
    p_power = 2.13636845*10^(-7)*double(R)^(0.7755) + 1.77746705*10^(-7)*double(G)^(0.7755) + 2.14348309*10^(-7)*double(B)^(0.7755);
end

