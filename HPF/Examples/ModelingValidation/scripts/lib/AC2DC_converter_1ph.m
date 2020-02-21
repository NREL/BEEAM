
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
tmp = s.AC.v .* conj(s.AC.i);
S_tmp = sum(s.AC.v .* conj(s.AC.i));

s.AC.Ptmp = sum(s.AC.V.mag .* s.AC.I.mag .* cos(s.AC.V.arg - s.AC.I.arg));

% real power 
s.AC.P = real(S_tmp);
% imaginary power
s.AC.Q = imag(S_tmp);
% distortion power
s.AC.Pdist = 0;

% DC power draw
s.DC.P = abs(s.DC.v * s.DC.i);

% losses
s.Ploss = s.AC.P - s.DC.P;