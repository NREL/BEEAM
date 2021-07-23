
% -------------------------------------------------------------------------
% fft  coef reconstruction
% Avpreet, 2018
% avpreetsingh@hotmail.com
% Colorado State University
% DC Design Tool, Colostate
%
% return reconstructed fft coeffiecients, for ifft
% Inputs:
%   - mag: magnitude, rms (vector)
%   - phase: phase values 
%   - N: size of fft 
% Outputs:
%   - fftCoef: fft coefficients (complex numbers)
%   - fftMag:  magnitude of the reconstructed N length fft
%   - fftPhase: phase of the reconstructed fft
% -------------------------------------------------------------------------
function [fftCoef, fftMag, fftPhase] = fftCoefReconstruct(mag, phase, N)
    if ~iscolumn(mag)
        mag = mag';
    end
    if ~iscolumn(phase)
        phase = phase';
    end
    
    lMag = length(mag);
    lPhase = length(phase);
    
    % take into account even or odd N
    N_d2 = floor(N/2);
    % reconstructing magnitude --------------------------------------------
    fftMag = zeros(N, 1);
    % from observations:
    % fft of data of any length produces fft mag (symmetric) with first
    %      coefficient zero and last coef = 2nd coef
    %-----------------------
    % reconstruct magnitude with proper scaling
    fftMagTmp = zeros(N_d2, 1);
    fftMagTmp(1:1:lMag) = mag .* ((sqrt(2) * N) / 2);
    % populating first half of symmetric coefficients
    fftMag(1:N_d2, 1) =  fftMagTmp;
    % populating second half, reverse order, last element = 2nd element
    % from beginning
    % beginning coef or 2nd half would be: l - (floor(n/2) - 1)
    beginIndx2H =  N - (N_d2 - 1) + 1;
    fftMag(beginIndx2H:1:end) = fftMagTmp(N_d2:-1:2);
    
    % reconstructing phase ------------------------------------------------
    fftPhase = zeros(N, 1);
    fftPhaseTmp = zeros(N_d2, 1);
    fftPhaseTmp(1:1:lPhase) = phase - pi/2;
    % populating first half of symmetric coefficients
    fftPhase(1:N_d2, 1) =  fftPhaseTmp;
    % populating second half, reverse order, last element = 2nd element
    % from beginning
    % beginning coef or 2nd half would be: l - (floor(n/2) - 1)
    fftPhase(beginIndx2H:1:end) = -fftPhaseTmp(N_d2:-1:2);

    % generating fft coeficients |mag|/_angle -> x + iy
    fftCoef = fftMag .* exp(1i .* (fftPhase ));
    
end