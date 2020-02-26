

close all
clc

load('voltage_data.mat')

% plot waveform
plot(t, vDist.waveform)
hold on
grid on
plot(t, vNoDist.waveform)
xlabel('Time (seconds)')
ylabel('Voltage (volts)')
legend('Simulation', 'Measurement')


% plot harmonics mag
figure
stem(h, vDist.mag)
hold on
grid on
stem(h, vNoDist.mag)
xlabel('Harmonics')
ylabel('$|V^{(h)}|$', 'interpreter', 'latex')
legend('Simulation', 'Measurement')