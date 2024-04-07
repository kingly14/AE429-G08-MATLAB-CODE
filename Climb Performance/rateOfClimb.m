%PURSPOSE: To determine the climb performance of the NB-52B Balls 8
%AUTHOR: Group 8
%Date Updated: 4/7/2024
clear
clc

%% Define Constants
% Maximum takeoff mass [kg]
mi = 219600;
% Gravity [m/s^2]
g = 9.8;
% Density (ground level) [kg/m^3]
p = 1.22;
% Planform Area [m^2]
S = 371.6122;
% Wing Span [m]
b = 56.4;
% Oswald Efficiency Factor
oswald = 0.9;
% Aspect Ratio
AR = b^2/S;
% Velocity [m/s]
V = 290;

%% Computed Constants
% k from drag
k = 1/(pi * oswald * AR);
% Coeficient Zero Drag XFLR5 Analysis
CD0 = 0.02;
% Lift Coeficient from XFLR5 Analysis
CL = 0.462;
% Drag Coefficient from the drag polar
CD = CD0 + (k*CL^2);

%% Calculate Forces
%Weight [N]
W = mi * g;
%Lift [N]
L = W;
%Drag [N]
D = 1/2 * p * V^2 * S * CD;
%Thrust [N]
T = D;

%% Maximum Rate of Climb 
% Maximum Lift/Drag ratio
LDmax = 1/sqrt(4*CD0*k);
% Z value 
z = 1+sqrt(1+(3/((LDmax^2)+((T/W)^2))));
% Velocity of R/C maximum [m/s]
VRCmax = sqrt((T/W)*(W/S)*z/(3*p*CD0));
% Rate of Climb Max [m/s]
RCmax = sqrt(((W/S)*z)/(3*p*CD0))*((T/W)^(3/2))*(1-(z/6)-(3/(2*((T/W)^2)*(LDmax^2)*z)));
% Angle of Climd
theta = asind(RCmax/VRCmax);

%% Maximum Climb Angle
% Maximum Climb Angle
thetamax = asind((T/W)-(1/LDmax));
% Velocity of Maximum Climb Angle
Vthetamax = sqrt(((2*W*cosd(thetamax))/(p*S))*sqrt(k/CD0));
%RC at maximum Climb Angle
RC = sind(thetamax)*Vthetamax;

%% Unpowered Descent
% Minimum Glide Angle
thetamin = atand(1/LDmax);
% Glide Velocity
Vglide = sqrt((2*W*cosd(thetamax))/(p*S*CL));

