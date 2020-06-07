

function y = getTimeWvform(mag, arg, N)
    % pad even harmonics with zeros
    magAll = zeros(1, 2*length(mag));
    magAll(2:2:end) = mag; 
    argAll = zeros(1, 2*length(arg));
    argAll(2:2:end) = arg; 
    
    % get ifft coefficients
    coefs = fftCoefReconstruct(magAll, argAll, N);
    y = real(ifft(coefs));
    