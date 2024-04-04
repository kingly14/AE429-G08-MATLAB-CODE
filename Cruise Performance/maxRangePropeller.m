% Calculates the maximum range of a propeller driven aircraft.
% Author: Ryan King

function range = maxRangePropeller(efficiency, fc, liftToDrag, mi, me)
    % --------------------------------------------
    % efficiency: Propeller Efficiency
    % fc:Fuel Consumption (kg/s) 
    % liftToDrag: The lift to drag ratio
    % mi: Initial Mass (kg)
    % me: End Mass (kg)
    % --------------------------------------------

    range = (efficiency/fc) * liftToDrag * log(mi/me);

end