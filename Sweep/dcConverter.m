%% DC/DC Converter
% Calculate the input current for a DC/DC converter under the following
% assumptions:
% 
%   1. Fixed (user-specified) DC output power
%   2. DC input power (at fundamental) is quadratic function of DC output
%      power
% 
% DC input power is modeled as a function of DC output power
% using a quadratic converter loss model using the equation:
%
%   P_in = P_out + (alpha + beta * (P_out) + beta * (P_out)^2)
%                  \___________________  ____________________/
%                                      \/
%                                    P_loss
%
% INPUTS:
%   model = Model as a struct object with fields...
%             alpha: Converter loss model constant term
%             beta:  Converter loss model linear term
%             gamma: Converter loss model quadratic term
%   Vin =   Actual DC input voltage
%   Pout =  Actual DC output power
%
% OUTPUTS:
%
%   I =     DC input current
%
% NOTES:
%
%   1. h must be a subset of 'href' field from model.
%   2. No error checking! This is a proof-of-concept function only.

function I = dcConverter(model, Vin, Pout)
    %% Input Power
    % Calculate DC input power per loss model
    Pin = Pout + model.alpha + model.beta.*Pout + model.gamma.*(Pout.^2);
    
    %% Input Current
    % P = I*V
    I = Pin ./ Vin;
end