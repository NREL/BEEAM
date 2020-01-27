

clc
clear
close all

dir = '/home/avpreetsingh/OpenModelica_workspace/HPF.Test.Test_Rectifier/';

% load mat file from the simulation
res = modelicaImport([dir, 'HPF.Test.Test_Rectifier_res.mat']);

numHrm = res.systemDef.numHrm;
hrms = res.systemDef.hrms;

figure
subplot(2,1,1)
stem(hrms, res.laptop_adapter.I_mag(1:numHrm))
grid on
subplot(2,1,2)
stem(hrms, unwrap(res.laptop_adapter.I_arg(1:numHrm)))
grid on

I = struct();
mag = res.laptop_adapter.I_mag(1:numHrm);
arg = res.laptop_adapter.I_arg(1:numHrm);

I.mag = zeros(2*length(mag), 1);
I.arg = zeros(2*length(arg), 1);
I.mag(2:2:end) = mag;
I.arg(2:2:end) = arg;

[fftCoef, fftMag, fftArg] = fftCoefReconstruct(I.mag, I.arg, 1302);

figure
plot(real(ifft(fftCoef)))

V = struct();
mag = res.laptop_adapter.V_mag(1:numHrm);
arg = res.laptop_adapter.V_arg(1:numHrm);

V.mag = zeros(2*length(mag), 1);
V.arg = zeros(2*length(arg), 1);
V.mag(2:2:end) = mag;
V.arg(2:2:end) = arg;

[fftCoef, fftMag, fftArg] = fftCoefReconstruct(V.mag, V.arg, 1302);

figure
plot(real(ifft(fftCoef)))