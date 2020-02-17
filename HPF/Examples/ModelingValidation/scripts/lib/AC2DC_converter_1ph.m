
%% AC2DC converter


function s = AC2DC_converter_1ph(h, u)

s = struct();
%% AC side -----------
% AC side is a redeclared TwoPinBase class.
s.AC = twoPin_device(h, u.loadBase);

%% DC side -----------
s.DC.v = u.vDC.v(1);
s.DC.i = u.vDC.i(1);

%% Power computations --------
s.Ploss = 0;

% real power 
s.Preal = 0;
% imaginary power
s.Pimag = 0;
% distortion power
s.Pdist = 0;