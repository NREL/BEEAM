
%%
% Script:
% Validation using time domain reconstruction
% 
% ------------------------------------------------------------------------------
% Workflow:
%   - load measurement data 
%   - reconstruct time domain waveforms from the measured data
%     and from model
%
% Avpreet Othee, avpreetsingh@hotmail.com
% --------------------------------------------------------------------------------

addpath('./lib')

h = X(1, :);    % harmonics
f = 60; % fundamental freq
N = 150;
Ts = 1 / (N * f);
dispTime = linspace(0, 1/f, N);
% converter operating power
% Selecting two converter power levels from measurement
% Devices have different operating power levels and it is difficult to select a
% power level in advance. 
% Power levels:
%   1) low power
%   2) Highest power (from measurement data)
pwrLevel_indx = [3, size(Y, 1)];
pwrLevels = Y(pwrLevel_indx);

figure

for k = 1:2
    % time domain waveform, measurement
    % using interpolation
    measMag = interp2(X, Y, Z_mag, h, pwrLevels(k));
    measPhaseAngle = interp2(X, Y, Z_arg, h, pwrLevels(k));
    measWaveform = getTimeWvform(measMag, measPhaseAngle, N);
    % time domain waveform, model
    modeledMag = candidateFunction_magnitude(h, pwrLevels(k), harmonicModel_Mag.params);
    modeledPhaseAngle = candidateFunction_phaseAngle(h, pwrLevels(k), harmonicModel_PhaseAngle.params);
    modeledWaveform = getTimeWvform(modeledMag, modeledPhaseAngle, N); 
    
    subplot(2, 1, k)
    plot(dispTime, measWaveform)
    grid on
    hold on
    plot(dispTime, modeledWaveform)
    ylabel(['Current (A) ', num2str(pwrLevels(k)), ' (W)'])
    legend('Measurement', 'Model')
end
xlabel('Time (seconds)')
subplot(2, 1, 1)
title(['Device: ', harmonicModel_Mag.deviceName], 'interpreter', 'none')








