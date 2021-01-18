
% Parameters:
%   h = harmonics 
%   u = Modelica structure 
function s = HarmonicPQLoad(h, u)

s = twoPin_device(h, u.loadBase);

s.P = sum(u.P(:));
s.Q = sum(u.Q(:));