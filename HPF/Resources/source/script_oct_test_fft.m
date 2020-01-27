
% This script would call the intermediary functions
% func_fft
% fft_getCmplxMagArg

% oct file compilation 
% mkoctfile oct_test_fft.cpp

clear all
close all

a = [1 2 3 4];
b = [6 7 8 9];

[yRe, yIm] = oct_test_fft(a, b, 1)

u = a + j.*b;
% compute fft using inbuilt function 
y = fft(u)
%yRe' + yIm'.*j

% testing out mag arg to fft coefficient reconstruction ------------------------
load('../../PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4.mat')

stem(mdl.mag)

c = fftCoefReconstruct(mdl.mag, mdl.arg, 1302);
figure
plot(real(ifft(c)))
grid on
hold on

[yRe, yIm] = oct_test_fft(mdl.mag, mdl.arg, 2);
c2 = yRe + yIm.*j;
plot(real(ifft(c2)))
legend('c', 'c2')
norm(c - c2)

% plotting
figure 
subplot(2,1,1)
stem(real(c))
hold on
stem(real(c2))
legend('c', 'c2')

subplot(2,1,2)
stem(imag(c))
hold on
stem(imag(c2))
legend('c', 'c2')


%% testing out mag arg to fft coefficient reconstruction ------------------------
mdl.mag = mdl.mag(2:2:end);
mdl.arg = mdl.arg(2:2:end);
figure
stem(mdl.mag)

[yRe, yIm] = oct_test_fft(mdl.mag, mdl.arg, 3); 
c2_odd = yRe + yIm.*j;

% plotting
figure 
subplot(2,1,1)
stem(real(c))
hold on
stem(real(c2_odd))
legend('c', 'c2')

subplot(2,1,2)
stem(imag(c))
hold on
stem(imag(c2_odd))
legend('c', 'c2')

figure
plot(real(ifft(c2_odd)))