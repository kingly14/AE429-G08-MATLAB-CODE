clear
clc

% Mass Properties
mi = 219600; % MAX AIRCRAFT TAKEOFF MASS kg
me = mi - 141610; % AIRCRAFT EMPTY WEIGHT kf
g = 9.81;

% Geometric Properties
p = 0.20;       % Density               [kg/m^3]
S = 371.6122;   % Planform Area         [m^2]

b = 56.4;       % Wing Span             [m]
e = 0.9;   % Oswald Efficiency
AR = b^2/S;   % Aspect Ratio
k = 1 / (pi * e * AR);

% Aerodynamic Properties
% Coeficient from Hand Calculations (alpha = 4deg)
CD0 = 0.024;   
CL = 0.637;
CD = CD0 + k*(CL^2);
Clmax = 1.6;

%Powerplant Properties
fj = 0.0000269;

% Cruise Properties
V = 290;

%% Calculate Forces
W = mi * g; %N
L = 1/2 * p * V^2 * S * CL;
D = 1/2 * p * V^2 * S * CD;
T = D;
k1 = 427029.27506; %N
k2 = 25; %N*s/m
k3 = 1.11E-2; %N*s/m^2
liftToDrag = L/D;
h = 12; %Height of wings above ground [m]
mu = 0.4;
N = 3;
Kuc = 4.5E-5;
hOB = 35;

vStall = sqrt((2/p)*(W/S)*(1/Clmax))
vLO = 1.11*vStall;
v = 0.7*vLO;
Tr = k1 -k2*v+k3*v^2; %Thrust
kT = ((Tr/W)-mu);
deltaCD0 = (W/S)*Kuc*(mi^-0.215);
G = (((16*h)/b^2)/(1+(16*h)/b^2));
kA = ((-p)/2*(W/S))*(CD0+deltaCD0+((k1+(G/(pi*e*AR)))*(CL^2)-mu*CL));
sg = (1/(2*g*kA))*log(1+(kA/kT)*vLO^2)+N*vLO

R = (6.96*vStall^2)/g
theta = acosd(1-(hOB/7510))
sa = R*sind(theta)

s = sa + sg