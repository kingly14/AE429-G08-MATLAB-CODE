% Calculates the maximum range of a jet aircraft.
% Author: Ryan King
% Filippone 406 Eqn. 13.31 (modified)

function range = maxRangeJet(fj, g, rho, S, CL, CD, mi, me)
    % --------------------------------------------
    % fj: Thrust Specific Fuel Consumption (kg/Ns) 
    % rho: Density (kg/m^3)
    % S: Planform Surface Area (m^2)
    % CL: Wing Lift Coeficient
    % CD: Wing Drag Coeficient
    % mi: Initial Mass (kg)
    % me: End Mass (kg)
    % --------------------------------------------

    range = (2/(fj*g)) * sqrt(2/(rho*S)) * (CL^(1/2)/CD) * (sqrt(mi*g) - sqrt(me*g));

end