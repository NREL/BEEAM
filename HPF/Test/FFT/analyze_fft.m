

clc
clear
close all

dir = '/home/avpreetsingh/OpenModelica_workspace/HPF.Test.sensors/';

% load mat file from the simulation
res = modelicaImport([dir, 'HPF.Test.sensors_res.mat']);

numHrm = res.systemDef.numHrm;
hrms = res.systemDef.hrms;

figure
subplot(2,1,1)
stem(hrms, res.led_driver.I_mag(1:numHrm))
grid on
subplot(2,1,2)
stem(hrms, unwrap(res.led_driver.I_arg(1:numHrm)))
grid on

I = struct();
I.mag = res.led_driver.I_mag(1:numHrm);
I.arg = res.led_driver.I_arg(1:numHrm);

[fftCoef, fftMag, fftArg] = fftCoefReconstruct(I.mag, I.arg, 1302);

figure
plot(real(ifft(fftCoef)))