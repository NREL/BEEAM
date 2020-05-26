
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

% Traditional definition of power, computing power for same voltage and current
% harmonics
s.S_tmp = sum((s.phA.v.cmplx .* conj(s.phA.i.cmplx)) + (s.phB.v.cmplx .* conj(s.phB.i.cmplx)) + ...
                (s.phC.v.cmplx .* conj(s.phC.i.cmplx))); 
% Real power
s.P = abs(real(s.S_tmp));
% Imaginary power
s.Q = abs(imag(s.S_tmp));
% Distortion power

% Apparent power
