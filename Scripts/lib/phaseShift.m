
%
% phase shift
% Usage:
%   y = phaseShift(u, h, ph)
% In an fft, the phase shift is a multiple of the harmonic
%
% Inputs:   u - input vector (rad)
%           h - harmonics vector (same size as u)
%           ph - desired phase shift (rad)
% Output:   y - shifted 
%

function y = phaseShift(u, h, ph)
    % check if inputs are column vectors
    if ~iscolumn(u)
        u = u';
    end
    
    if ~iscolumn(h)
        h = h';
    end
    y = u - ph .* h;
end


