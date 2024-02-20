soc = linspace(0, 1, 39);
new_V_red = interp1(redcurve(:,1), redcurve(:,2), soc)
new_V_green = interp1(greencurve(:,1), greencurve(:,2), soc)

figure
hold on
plot(soc, new_V_red, 'r')
plot(soc, new_V_green, 'g')
scatter(soc, new_V_red, 'Filled', 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r')
scatter(soc, new_V_green, 'Filled', 'MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g')
grid