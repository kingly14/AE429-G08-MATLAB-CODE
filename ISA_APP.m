%%  ISA TEST

clear
clc

geopotentialAltitude = 701.04; % meters

[temperature, speedOfSound, pressure, density] = atmosisa(geopotentialAltitude);

fprintf('Geoptential Altitude    (m): %f\n', geopotentialAltitude)
fprintf('Temperature             (K): %f\n', temperature)
fprintf('Speed of Sound        (m/s): %f\n', speedOfSound)
fprintf('Pressure               (Pa): %f\n', pressure)
fprintf('Density            (Kg/m^3): %f\n', density)
fprintf('Relative Density   (Kg/m^3): %f\n', density / 1.2250)


%% OTHER EQUATIONS USED FOR VERIFICATION

a = .00356616; % F/ft

% Edit as needed.
T0 = 0;
P0 = 0;
p0 = 0;
h0 = 0;

T = T0 - a * (geopotentialAltitude-h0);
Theta = 1-(6.875E-6)*geopotentialAltitude;
P = P0 * Theta^5.2561;
p = p0 * Theta^4.2561;

