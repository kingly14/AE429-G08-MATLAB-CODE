% AE429 Assignment 2
% Ryan King
% April 12th, 2024

clear
clc

%% DECLARE CONSTANTS

% Mass Properties
mi = 219600; % MAX AIRCRAFT TAKEOFF MASS
me = mi - 141610; % AIRCRAFT EMPTY WEIGHT
g = 9.8;

% Geometric Properties
p = 0.20;       % Density               [kg/m^3]
S = 371.6122;   % Planform Area         [m^2]
b = 56.4;       % Wing Span             [m]
oswald = 0.9;   % Oswald Efficiency
AR = b^2/S;     % Aspect Ratio
k = 1 / (pi * oswald * AR);

% Aerodynamic Properties
% Coeficient from Hand Calculations (alpha = 4deg)
CD0 = 0.024;   
CL = 0.637;
CD = CD0 + k*(CL^2);

%Powerplant Properties
fj = 0.0000269;

% Cruise Properties
V = 290;

%% Calculate Forces
W = mi * g;
L = 1/2 * p * V^2 * S * CL;
D = 1/2 * p * V^2 * S * CD;
T = D;

liftToDrag = L/D;

%% Validation

% Validation Constants 
expectedRange = 14162.23e3; % FROM BOEING
expectedEndurance = 17.3; % FROM BOEING

% Range
maxRange = maxRangeJet(fj, g, p, S, CL, CD, mi, me);
percentError = ((maxRange - expectedRange) / expectedRange) * 100;
fprintf('Range Validation\n')
fprintf('Calculated Range: %f\n', maxRange)
fprintf('Expected Range: %f\n', expectedRange)
fprintf('Percent Error: %f\n\n', percentError)

%otherRange = (1/(fj*g))*(((2*W)/(p*S))^0.5)*((CL^0.5)/CD)*log(mi/me)

% Endurance
maxEndurance = maxEnduranceJet(fj, g, (L/D), mi, me) / 3600;
percentError = ((maxEndurance - expectedEndurance) / expectedEndurance) * 100;
fprintf('Endurance Validation\n')
fprintf('Calculated Endurance: %f\n', maxEndurance)
fprintf('Expected Endurance: %f\n', expectedEndurance)
fprintf('Percent Error: %f\n', percentError)
