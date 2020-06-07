
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

%% redefining struct. 03/18/2020
% moving waveforms, mag and arg together into one struct field
% struct for voltage and current in polar form
s.v = struct();
s.i = struct();

for k = 1:1:h
   s.v.cmplx(k) = u.v(k).re(end) + u.v(k).im(end)*1j;
   s.i.cmplx(k) = u.i(k).re(end) + u.i(k).im(end)*1j;
end

s.v.mag = abs(s.v.cmplx);
s.v.arg = angle(s.v.cmplx);
s.i.mag = abs(s.i.cmplx);
s.i.arg = angle(s.i.cmplx);   
s.S = s.v.cmplx .* conj(s.i.cmplx);
% real power 
s.P = real(sum(s.S));
% imaginary power
s.Q = imag(sum(s.S));
% distortion power
s.D = 0;

% computing waveforms
N = 1302;
s.v.wv = getTimeWvform(s.v.mag, s.v.arg, N);
s.i.wv = getTimeWvform(s.i.mag, s.i.arg, N);


