clear
clc

% Mass Properties
mi = 219600/0.4536; % MAX AIRCRAFT TAKEOFF MASS lb
mis = 219600; % kg
me = (mi/.4536) - (141610/.4536); % AIRCRAFT EMPTY WEIGHT kf
g = 32.2;

% Geometric Properties
p = 0.002377;       % Density               [slugs/ft^3]
S = 4000;   % Planform Area         [ft^2]
Ss = 3702; %[m^2]

b = 185;       % Wing Span             [ft]
e = 0.9;   % Oswald Efficiency
AR = b^2/S;   % Aspect Ratio
k = 1 / (pi * e * AR);

% Aerodynamic Properties
% Coeficient from Hand Calculations (alpha = 4deg)
CD0 = 0.024;   
CL = 0.637;
CD = CD0 + k*(CL^2);
Clmax = 0.9;

%Powerplant Properties
fj = 0.0000269;

% Cruise Properties
V = 951.444;

%% Calculate Forces
W = 488000; %lb
Ws = mis*9.81; %N
L = 1/2 * p * V^2 * S * CL;
D = 1/2 * p * V^2 * S * CD;
T = 96000;
k1 = 96000; %lb
k2 = 30.28; %lb*ft/m
k3 = 1.317E-2; %lb*s/ft^2
liftToDrag = L/D;
h = 37.3701; % Height of wings above ground [ft]
mu = 0.04;
N = 3;
Kuc = 4.5E-5;
hOB = 35;

vStall = sqrt((2/p)*(W/S)*(1/Clmax))
% vLO = 1.11*vStall;
% v = 0.7*vLO;
% Tr = k1 -(k2*v)+(k3*v^2); %Thrust
% kT = ((Tr/W)-mu);
% deltaCD0 = (Ws/Ss)*Kuc*(mis^-0.215);
% G = ((16*h)/b)^2/(1+(16*h)/b)^2;
% kA = -(p/(2*(W/S)))*(CD0+deltaCD0+((k+(G/(pi*e*AR)))*CL^2)-mu*CL);
% sg = (1/(2*g*kA))*log(1+((kA/kT)*vLO^2))+(N*vLO)
 
sg = (1.21*(W/S))/(g*p*Clmax*(T/W));
R = (6.96*vStall^2)/g;
theta = acosd(1-(hOB/7510));
sa = R*sind(theta);

s = sa + sg
