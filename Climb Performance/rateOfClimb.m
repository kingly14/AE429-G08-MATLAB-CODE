mi = 219600; % MAX AIRCRAFT TAKEOFF MASS
me = mi - 141610; % AIRCRAFT EMPTY WEIGHT
g = 9.8;

% Geometric Properties
p = 0.22;       % Density               [kg/m^3]
S = 371.6122;   % Planform Area         [m^2]
b = 56.4;       % Wing Span             [m]
oswald = 0.9;   % Oswald Efficiency
AR = b^2/S;     % Aspect Ratio
pi = 3.14;
k = pi * oswald * AR

% Aerodyaanmic Properties
CD0 = 0.006;    % Coeficient Zero Drag XFLR5 Analysis
CL = 0.462;     % Lift Coeficient form XFLR5 Analysis
CD = CD0 + (k*CL^2);

%Powerplant Properties
fj = 2.2e-5 * 8;

% Cruise Properties
V = 290;

%% Calculate Forces
W = mi * g
L = W;
D = 1/2 * p * V^2 * S * CD;
T = D;
LDmax = 1/sqrt(4*CD0*k);

z = 1+sqrt(1+(3/LDmax^2+(T/W)^2))
rate = sqrt(((W/S)*z)/(3*p*CD0))*((T/W)^(3/2))*(1-(z/6)-(3/2*(T/W)^(2)*(LDmax)^(2)*z))
