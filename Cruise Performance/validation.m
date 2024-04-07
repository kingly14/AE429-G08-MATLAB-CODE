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

% Aerodyaanmic Properties
CD0 = 0.01;    % Coeficient Zero Drag XFLR5 Analysis
CL = 0.462;     % Lift Coeficient form XFLR5 Analysis
CD = CD0 + k*(CL^2);

%Powerplant Properties
fj = 2.2e-5 * 8;

% Cruise Properties
V = 290;

%% Calculate Forces
W = mi * g;
L = 1/2 * p * V^2 * S * CL;
D = 1/2 * p * V^2 * S * CD;
T = D;

%% Validation

% Validation Constants 
expectedRange = 14162.23e3; % FROM BOEING

% Range
maxRange = maxRangeJet(fj, p, S, CL, CD, mi, me);
percentError = ((maxRange - expectedRange) / expectedRange) * 100;
fprintf('Range Validation\n')
fprintf('Calculated Range: %f\n', maxRange)
fprintf('Expected Range: %f\n', expectedRange)
fprintf('Percent Error: %f\n', percentError)

% Endurance+++

maxLD = 1/(sqrt(4*CD0*k))
liftToDrag = L/D

endurance = maxEnduranceJet(fj, (L/D), mi, me) / 3600
