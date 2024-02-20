Vcurve_red = redcurve(:, 2);
Vcurve_green = greencurve(:, 2);
Icurve_red = redcurve(:, 1);
Icurve_green = greencurve(:, 1);
R = (Vcurve_red - Vcurve_green)./(0.5*3200)

V_oc = Vcurve_green + R .* Icurve_green;