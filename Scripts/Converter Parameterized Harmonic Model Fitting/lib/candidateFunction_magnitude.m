
%%
% Function:
% Candidate function for magnitude modeling
% ------------------------------------------------------------------------------
% Candidate function for magnitude modeling using a parameterized 3D sigmoid 
% function.
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

function z = candidateFunction(x, y, theta)
    z = (theta(1).*y + theta(2)) ./ ...
        (((theta(1).*y + theta(2)) ./ (theta(3).*y + theta(4))) ...
        - exp(-(theta(5).*y.^(theta(6))).*x));
end