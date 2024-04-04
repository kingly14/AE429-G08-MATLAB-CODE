% Calculates the maximum endurance of a jet aircraft.
% Author: Ryan King

function endurance = maxEnduranceJet(fj, liftToDrag, mi, me)
    % --------------------------------------------
    % fj: Thrust Specific Fuel Consumption (kg/Ns) 
    % liftToDrag: The lift to drag ratio
    % mi: Initial Mass (kg)
    % me: End Mass (kg)
    % --------------------------------------------

    endurance = (1/fj) * liftToDrag * log(mi/me);

end