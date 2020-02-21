
% power computations for a two pin device.
% example, all the impedances, inductors, uistors etc.


% a two pin device has the partial class, TwoPinBase defined in the Interface
% package.
% 
% one will pass the structure
% u is the input structure.
% one should make the computations easy. Treating variables as complex numbers
%
% s.v = voltage (type: complex)
% s.i = current
% 
% One can perform all the computations here itself like computing the angle and
% the magintude. It wouldn't be too bad if one can just put this on the user
% to get these computed from the returned structure.
%
% some of the computations:
% * Real power
% * Imaginary power
% * Apparent power
% * Distortion power
% * current magnitude and angle
% * voltage magnitude and angle
% * ifft of the same
function s = twoPin_device(h, u)
s = struct();
% the mat file structure is of the form,
% mdl.i.re
% the i has elements for the vectors coruponding to the harmonics.
% the real or the imaginary part is the actual modelica variable that is time
% indexed. Matlab is throwing an error if we try to access variables in the 
% i for the first re element. 
% Workaround: use a for loop and iterate.

for k = 1:1:h
   s.v(k) = u.v(k).re(end) + u.v(k).im(end)*1j;
   s.i(k) = u.i(k).re(end) + u.i(k).im(end)*1j;
end

% struct for voltage and current in polar form
s.V = struct();
s.V.mag = abs(s.v);
s.V.arg = angle(s.v);
s.I = struct();
s.I.mag = abs(s.i);
s.I.arg = angle(s.i);   

% computing waveforms
N = 1302;
s.wv = struct();
s.wv.v = getTimeWvform(s.V.mag, s.V.arg, N);
s.wv.i = getTimeWvform(s.I.mag, s.I.arg, N);


