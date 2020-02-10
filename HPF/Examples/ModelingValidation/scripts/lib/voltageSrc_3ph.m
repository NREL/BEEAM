
%% The three phase voltage source consists of three single phase voltage sources
% the voltage source is a modified TwoPinBase partial class.
% one can use the twoPin_device function to compute the necessary values.
%
%% Leveraging the object oriented design of the Modelica language.

function s = voltageSrc_3ph(h, u)

s = struct();
s.phA = twoPin_device(h, u.vSrc_phA);
s.phB = twoPin_device(h, u.vSrc_phB);
s.phC = twoPin_device(h, u.vSrc_phC);

%% computing powers -----------------
% Real power

% Imaginary power

% Apparent power

% Distortion power

