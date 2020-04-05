
close all


N = 1302;
plot(LaptopCharger_4.AC.wv.v)

figure 
grid on
hold on
figure 
grid on
hold on

v2 = zeros(N, 1);
% get the number of harmonics
sz = numHrm * 2;
for k = 1:numHrm
    
    % put the odd harmonic and padd the rest with zeros
    mag = zeros(numHrm*2, 1);
    mag(2*k, 1) = LaptopCharger_4.AC.V.mag(k);
    arg = zeros(numHrm*2, 1);
    arg(2*k, 1) = LaptopCharger_4.AC.V.arg(k);
    
    v1(:, k) = real(ifft(fftCoefReconstruct(mag, ...
                        arg, N)));
    
    figure(2)
    plot(v1(:, k))
    figure(3)
    v2 = v2 + v1(:, k);
    plot(v2)
end


