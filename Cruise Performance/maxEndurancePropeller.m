% Calculates the maximum endurance of a propeller driven aircraft.
% Author: Ryan King

function endurance = maxEndurancePropeller(efficiency, fc, rho, S, CL, CD, mi, me)
    % --------------------------------------------
    % efficiency: Propeller Efficiency
    % fc:Fuel Consumption (kg/s) 
    % rho: Density (kg/m^3)
    % S: Planform Surface Area (m^2)
    % CL: Wing Lift Coeficient
    % CD: Wing Drag Coeficient
    % mi: Initial Mass (kg)
    % me: End Mass (kg)
    % --------------------------------------------

    endurance = (efficiency/fc) * sqrt(2*rho*S) * (CL^(3/2)/CD) * ((1/sqrt(mi)) - (1/sqrt(me)));

end