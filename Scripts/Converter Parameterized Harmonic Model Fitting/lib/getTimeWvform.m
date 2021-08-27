
%%
% Function:
% Get time domain waveform from odd harmonics data
% ------------------------------------------------------------------------------
% HPF studies only work with odd harmonics.
% Function pads even harmonics with zeros and uses ifft to generate time domain
% waveform
%
% Inputs: 
%   mag : harmonic magnitudes
%   arg : harmonic phase angle data
%   N : Size of the ifft
%   
% Outputs: 
%   y : time domain waveform
%
% Avpreet Othee, avpreetsingh@hotmail.com
% ------------------------------------------------------------------------------

function y = getTimeWvform(mag, arg, N)
    % pad even harmonics with zeros
    magAll = zeros(1, 2*length(mag));
    magAll(2:2:end) = mag; 
    argAll = zeros(1, 2*length(arg));
    argAll(2:2:end) = arg; 
    
    % get ifft coefficients
    coefs = fftCoefReconstruct(magAll, argAll, N);
    y = real(ifft(coefs));
    