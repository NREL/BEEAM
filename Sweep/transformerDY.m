%% Three-Phase Delta-Wye Transformer
% Calculate the sequence network impedances for a three-phase delta-wye
% transformer using a T-model under the following assumptions:
% 
%   1. Linearity
%   2. Negligible temperature effect on resistance
%   3. Load losses consist of resistive losses, winding eddy current (EC)
%      loss, and other stray loss (OSL). EC losses scale with the square of
%      the frequency and OSL scales with frequency to the 0.8th power.
% 
% The following (internally consistent) reference model is needed:
% 
%   - Primary and secodandary equivalent series resistance
%   - Primary and secondary equivalent series reactance
%   - Core loss resistance
%   - Magnetizing reactance
%   - Distribution of load losses between winding, eddy current and other
%     stray loss
%
% All of these are specified at the fundamental frequency.
%
% The following are characteristics of a D-Y connection:
% 
%   - High side leads low side by 30 deg (+ sequence), lags low side by
%     30 deg (- sequence)
%   - Zero sequence model at primary is an open circuit
%   - Zero sequence model at secondary is shunt impedance Z + 3*ZNS
%   - Assuming the Y secondary has a neutral, the equivalent zero
%     sequence circuit looks like this:
%
%     O---O  O-----Zp-----Zs---3*Zn---O
%               |      |
%     H         |     Zsh             X
%               |      | 
%     O-------------------------------O
%
% Reference:
% https://www.aeso.ca/assets/linkfiles/4040.002-Rev02-Transformer-Modelling-Guide.pdf
%
% INPUTS:
%   model = Model as a struct object with fields...
%             Rp:    Primary winding equivalent series resistance
%             Rs:    Secondary winding equivalent series resistance
%             Xp:    Primary winding equivalent series resistance
%             Xs:    Secondary winding equivalent series reactance
%             Rc:    Core loss resistance
%             Xm:    Magnetizing reactance
%             fW:    Fraction of load loss which is resistive loss
%             fEC:   Fraction of load loss which is winding eddy current
%                    loss
%             fOSL:  Fraction of load loss which is other stray loss
%           fW, fEC, and fOSL should add to 1.0
%   h =     Set of harmonics at which to calculate the impedances
%
% OUTPUTS:
%
%   Zp =          Primary winding series impedances
%   Zs =          Secondary winding series impedances
%   Zsh =         Shunt impedances
%
% All of these are specified for each harmonic (columns). There is also a
% phase shift, as documented above, that must be taken into account when
% calculating the voltages and currents.
%
% NOTES:
%
%   1. Everything is assumed to be in per-unit
%   2. The Y secondary is assumed to have a neutral (4-wire) with zero
%      neutral impedance
%   3. Shunt admittance assumed connected on the primary size
%   4. No error checking! This is a proof-of-concept function only.

function [Zp, Zs, Zsh] = transformerDY(model, h)
    %% Setup
    % Place harmonics as row vector
    h = reshape(h, 1, []);
    
    % Harmonic scaling for equivalent winding resistances
    winding_scale = ...
        model.fW + ...          % Resistive
        model.fEC .* h.^2 + ...  % Eddy current
        model.fOSL .* h.^0.8;    % Other stray loss
    
    %% Calculate Impedances
    % Primary winding
    Zp = model.Rp .* winding_scale + (1j*model.Xp) .* h;
    
     % Secondary winding
    Zs = model.Rs .* winding_scale + (1j*model.Xs) .* h;
    
    % Core
    Zsh = 1 ./ (1./model.Rc + 1./((1j*model.Xm).*h));
end