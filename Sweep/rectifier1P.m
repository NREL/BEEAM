%% Single-Phase Recifier
% Calculate the AC injection current of a single-phase rectifier under the
% following assumptions:
% 
%   1. Fixed (user-specified) DC output power
%   2. AC input power (at fundamental) is quadratic function of DC output
%      power
%   3. AC current spectrum has the following characteristics:
%      - Fixed wave shape
%      - Fixed ratio of harmonic currents to fundamental current
%      - Position of wave is fixed relative to phase voltage
%   4. Reference voltage is a perfect sinusoid at the fundamental frequency
% 
% The following (internally consistent) reference conditions are needed:
% 
%   - AC input voltage (magnitude, angle)
%   - DC output power
%   - Current injection spectrum
%
% In addition, AC input power is modeled as a function of DC output power
% using a quadratic converter loss model using the equation:
%
%   P_in = P_out + (alpha + beta * (P_out) + gamma * (P_out)^2)
%                  \____________________  ____________________/
%                                       \/
%                                     P_loss
%
% INPUTS:
%   model = Model as a struct object with fields...
%             href:  Reference harmonic indices
%             Vref:  Reference fundamental freq. voltage phasor (Scalar)
%             Pref:  Reference DC output power (Scalar)
%             Iref:  Reference injection current spectrum (Vector)
%             alpha: Converter loss model constant term
%             beta:  Converter loss model linear term
%             gamma: Converter loss model quadratic term
%   h =     Set of harmonics at which to calculate the injection currents
%   V =     Actual voltage phasor vector
%   Pdc =   Actual DC output power
%
% OUTPUTS:
%
%   I =     Injection currents at each harmonic h
%
% NOTES:
%
%   1. h must be a subset of 'href' field from model.
%   2. V must be same size and shape as h
%   3. Phasors are assumed to be RMS-corrected, such that P = VI*
%   4. No error checking! This is a proof-of-concept function only.

function I = rectifier1P(model, h, V, Pdc)
    %% Input Power
    % Calculate AC input power per loss model
    Pac = Pdc + model.alpha + model.beta*Pdc + model.gamma*(Pdc^2);
    
    %% Estimate Fundamental Frequency Current
    % Reference current
    I1ref = model.Iref(model.href == 1);
    
    % Reference AC input power 
    Sref = model.Vref * conj(I1ref);
    
    % Initial fundamental frequency current estimate
    %   Power Scaling:          Actual / Reference
    %   Voltage Mag. Scaling:   Reference / Actual
    %   Voltage Angle Rotation: Actual - Reference
    I1 = I1ref * (Pac/real(Sref)) * conj(model.Vref/V(h == 1));
    
    % Note: Conjugation of voltage ratio reverses the angle order, which
    % produces the correction rotation direction.
    
    %% Estimate Current Injections
    % Start with reference spectrum
    I = model.Iref;
    
    % Scale
    I = I .* (abs(I1)/abs(I1ref));
    I = I .* exp(1j .* model.href .* (angle(I1) - angle(I1ref)));
    
    % Sort requested harmonics
    [~, h_index] = sort(h);
    
    % Reorder I in ascending harmonic order
    [href_sorted, href_index] = sort(model.href);
    I = I(href_index);
    
    % Subset
    I = I(ismember(href_sorted,h));
    
    % Reorder
    I = I(h_index);
    
    %% Scaling Correction
    % Compute modeled AC power with initial current injection estimation
    S = sum(V .* conj(I));
    
    % Apply correction factor
    I = I .* (Pac / real(S));
    
    % Recompute power and check for correct value
    S2 = sum(V .* conj(I));
    if (abs(real(S2) - Pac) > sqrt(eps))
        warning([ ...
            'Final injected AC power does not match target: ' ...
            'Target = ' num2str(Pac) ', Final = ' num2str(real(S2))]);
    end
end