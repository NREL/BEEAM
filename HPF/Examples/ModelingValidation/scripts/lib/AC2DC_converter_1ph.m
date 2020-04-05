
%% AC2DC converter


function s = AC2DC_converter_1ph(h, u)

s = struct();
%% AC side -----------
% AC side is a redeclared TwoPinBase class.
s.AC = twoPin_device(h, u.loadBase);

%% DC side -----------
s.DC.v = u.vDC.v(end);
s.DC.i = u.vDC.i(end);

%% Power computations --------
tmp = s.AC.v.cmplx .* conj(s.AC.i.cmplx);
s.AC.S = s.AC.v.cmplx .* conj(s.AC.i.cmplx);

% real power 
s.AC.P = real(sum(s.AC.S));
% imaginary power
s.AC.Q = imag(sum(s.AC.S));
% distortion power
s.AC.D = 0;

% DC power draw
s.DC.P = abs(s.DC.v * s.DC.i);

% losses
s.Ploss = s.AC.P - s.DC.P;