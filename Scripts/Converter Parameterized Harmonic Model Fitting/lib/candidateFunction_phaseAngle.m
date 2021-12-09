
%%
% Function:
% Candidate function for phase angle modeling
% ------------------------------------------------------------------------------
% Candidate function for phase angle modeling using a 2D polynomial (3D planar surface)
%
% Inputs: 
%   x : x axis input data (harmonic number)
%   y : y axis input data (AC real power @ h=1)
%   theta : parameter vector
%   
% Outputs: 
%   z : modeled output z value
%
%
% Avpreet Othee, avpreetsingh@hotmail.com
% ------------------------------------------------------------------------------

function z = candidateFunction_phaseAngle(X, Y, theta)
	% p00 + p10*x + p01*y + p11*x*y + p02*y^2
    z = theta(1) + theta(2).*X + theta(3).*(Y) + theta(4).*X.*Y + theta(5).*Y.^2;
end