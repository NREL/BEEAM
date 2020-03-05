%% Waveform Comparisons
% Compares modeled current waveforms for the following devices:
%
%   - Agilent 12V power supply
%   - HP Envy laptop AC/DC converter
%   - HP Elitebook laptop AC/DC converter
%   - HP Pavilion laptop AC/DC converter
%   - AC LED driver 1
%
% For each device, the comparison plot shows:
%   1. Measured waveform snapshot (black)
%   2. Modeled waveform per reference spectrum (blue)
%   3. Modeled waveform per Avpreet's polynomial model (red)
%
% Execute this script after executing Component_Models.m, without clearing
% the workspace in between, so that all appropriate model objects are
% present in the MATLAB workspace.

%% Setup
% Set up for deriving time-domain waveforms
f = 60;             % Hz
T = 1 / f;          % sec
h_spectrum = 0:20;  % For constructing FFT spectrum

% Time vector
dt_model = T / 500; % sec
t_model = 0:dt_model:(T-dt_model);

%% Agilent Power Supply
% Waveform input file
fname = 'waveforms/agilent-acdc-supply-at-100W.csv';

% Configuration:
%   Channel 1 = Transformer High-Side (Voltage: AB, Current: A)
%   Channel 2 = Converter AC Input (Voltage: bc, Current: b)
%   Channel 4 = Converter DC Output (Voltage, Current)

% Sampling interval - must match to data files
dt = 50.0e-6; % 0.05 ms

% Time domain data: t, V1, V2, V4, I1, I2, I4, P1, P2, P4
data = csvread(fname,1,0);

% Extract time-domain waveforms
t   = data(:,1);
v_ac = data(:,3);
i_ac = data(:,6);
p_dc = data(:,10);

% Frequency domain measured voltage
[~, ~, V_ac] = time2freq(v_ac, dt);
V_ac = V_ac(ismember(h_spectrum,h)) / sqrt(2) / bases.VLN_Low;

% Frequency domain measured current
[~, ~, I_ac] = time2freq(i_ac, dt);
I_ac = I_ac(ismember(h_spectrum,h)) / sqrt(2) / bases.I_Low;

% Frequency domain power
P_DC = mean(p_dc) / bases.S1p;

% Reference waveform model
I_ac_wave = zeros(size(h_spectrum));
I_ac_wave(ismember(h_spectrum,h)) = ...
    rectifier1P(agilent_wave, h, V_ac, P_DC);
[i_ac_wave, ~] = freq2time(f, I_ac_wave, dt_model);
i_ac_wave = i_ac_wave .* bases.I_Low .* sqrt(2);

% Polynomial model
I_ac_poly = zeros(size(h_spectrum));
I_ac_poly(ismember(h_spectrum,h)) = ...
    rectifier1P(agilent_poly, h, V_ac, P_DC);
[i_ac_poly, ~] = freq2time(f, I_ac_poly, dt_model);
i_ac_poly = i_ac_poly .* bases.I_Low .* sqrt(2);

% Plots
dev_title = 'Agilent Power Supply';
h_plot = [1,3,5,7,9,11];
figure(7)

subplot(2,2,1)
plot( ...
    t, i_ac, '-k', ...              % Measured
    t_model, i_ac_wave, '--b', ...  % Reference waveform model
    t_model, i_ac_poly, '-.r');     % Polynomial model
title([dev_title ': ' 'Current Waveforms'])
xlabel('Time (s)');
ylabel('Current (A)');
legend('Measured','Reference Waveform Model','Polynomial Model');

subplot(2,2,2)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
polar(angle(Ih_meas), abs(Ih_meas), '-ok'); % Measured
hold on
polar(angle(Ih_wave), abs(Ih_wave), '-sb'); % Reference waveform model
polar(angle(Ih_poly), abs(Ih_poly), '-dr'); % Polynomial model
hold off
title([dev_title ': ' 'Current Phasors'])
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'EastOutside');

subplot(2,2,3)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
stem(h_plot - 0.1, abs(Ih_meas), '-ok');  % Measured
hold on
stem(h_plot + 0.0, abs(Ih_wave), '-sb');  % Reference waveform model
stem(h_plot + 0.1, abs(Ih_poly), '-dr');  % Polynomial model
hold off
title([dev_title ': ' 'Current Magnitudes'])
xlabel('Harmonic');
ylabel('Magnitude (pu)');
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'NorthEast');

subplot(2,2,4)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
plot( ...
    h_plot, rad2deg(angle(Ih_meas)), '-ok', ...     % Measured
    h_plot, rad2deg(angle(Ih_wave)), '-sb', ...     % Reference waveform model
    h_plot, rad2deg(angle(Ih_poly)), '-dr');        % Polynomial model
title([dev_title ': ' 'Current Phase Angles'])
xlabel('Harmonic');
ylabel('Phase (deg)');
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'SouthEast');

% Save struct of data
agilent_waveform_data = struct( ...
    'h', h_plot, ...
    'Vh_meas', V_ac(ismember(h,h_plot)) .* bases.VLN_Low, ...
    'Ih_meas', Ih_meas .* bases.I_Low, ...
    'Ih_wave', Ih_meas .* bases.I_Low, ...
    'Ih_poly', Ih_meas .* bases.I_Low, ...
    't_meas', t, ...
    'v_meas', v_ac, ...
    'i_meas', i_ac, ...
    't_model', t_model, ...
    'i_wave', i_ac_wave, ...
    'i_poly', i_ac_poly ...
);

%% HP Envy Laptop AC/DC Converter
% Waveform input file
fname = 'waveforms/hp-envy-ac-batt-charged.csv';

% Configuration:
%   Channel 1 = Transformer High-Side (Voltage: AB, Current: A)
%   Channel 2 = Converter DC Output (Voltage, Current)
%   Channel 4 = Converter AC Input (Voltage, Current)

% Sampling interval - must match to data files
dt = 50.0e-6; % 0.05 ms

% Time domain data: t, V1, V2, V4, I1, I2, I4, P1, P2, P4
data = csvread(fname,1,0);

% Extract time-domain waveforms
t = data(:,1);
v_ac = data(:,4);
i_ac = data(:,7);
p_dc = data(:,9);

% Frequency domain measured voltage
[~, ~, V_ac] = time2freq(v_ac, dt);
V_ac = V_ac(ismember(h_spectrum,h)) / sqrt(2) / bases.VLN_Low;

% Frequency domain measured current
[~, ~, I_ac] = time2freq(i_ac, dt);
I_ac = I_ac(ismember(h_spectrum,h)) / sqrt(2) / bases.I_Low;

% Frequency domain power
P_DC = mean(p_dc) / bases.S1p;

% Reference waveform model
I_ac_wave = zeros(size(h_spectrum));
I_ac_wave(ismember(h_spectrum,h)) = ...
    rectifier1P(hpEnvyAC_wave, h, V_ac, P_DC);
[i_ac_wave, ~] = freq2time(f, I_ac_wave, dt_model);
i_ac_wave = i_ac_wave .* bases.I_Low .* sqrt(2);

% Polynomial model
I_ac_poly = zeros(size(h_spectrum));
I_ac_poly(ismember(h_spectrum,h)) = ...
    rectifier1P(hpEnvyAC_poly, h, V_ac, P_DC);
[i_ac_poly, ~] = freq2time(f, I_ac_poly, dt_model);
i_ac_poly = i_ac_poly .* bases.I_Low .* sqrt(2);

% Plots
dev_title = 'HP Envy AC/DC Converter';
h_plot = [1,3,5,7,9,11];
figure(1)

subplot(2,2,1)
plot( ...
    t, i_ac, '-k', ...              % Measured
    t_model, i_ac_wave, '--b', ...  % Reference waveform model
    t_model, i_ac_poly, '-.r');     % Polynomial model
title([dev_title ': ' 'Current Waveforms'])
xlabel('Time (s)');
ylabel('Current (A)');
legend('Measured','Reference Waveform Model','Polynomial Model');

subplot(2,2,2)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
polar(angle(Ih_meas), abs(Ih_meas), '-ok'); % Measured
hold on
polar(angle(Ih_wave), abs(Ih_wave), '-sb'); % Reference waveform model
polar(angle(Ih_poly), abs(Ih_poly), '-dr'); % Polynomial model
hold off
title([dev_title ': ' 'Current Phasors'])
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'EastOutside');

subplot(2,2,3)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
stem(h_plot - 0.1, abs(Ih_meas), '-ok');  % Measured
hold on
stem(h_plot + 0.0, abs(Ih_wave), '-sb');  % Reference waveform model
stem(h_plot + 0.1, abs(Ih_poly), '-dr');  % Polynomial model
hold off
title([dev_title ': ' 'Current Magnitudes'])
xlabel('Harmonic');
ylabel('Magnitude (pu)');
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'NorthEast');

subplot(2,2,4)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
plot( ...
    h_plot, rad2deg(angle(Ih_meas)), '-ok', ...     % Measured
    h_plot, rad2deg(angle(Ih_wave)), '-sb', ...     % Reference waveform model
    h_plot, rad2deg(angle(Ih_poly)), '-dr');        % Polynomial model
title([dev_title ': ' 'Current Phase Angles'])
xlabel('Harmonic');
ylabel('Phase (deg)');
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'SouthEast');

% Save struct of data
hpEnvy_waveform_data = struct( ...
    'h', h_plot, ...
    'Vh_meas', V_ac(ismember(h,h_plot)) .* bases.VLN_Low, ...
    'Ih_meas', Ih_meas .* bases.I_Low, ...
    'Ih_wave', Ih_meas .* bases.I_Low, ...
    'Ih_poly', Ih_meas .* bases.I_Low, ...
    't_meas', t, ...
    'v_meas', v_ac, ...
    'i_meas', i_ac, ...
    't_model', t_model, ...
    'i_wave', i_ac_wave, ...
    'i_poly', i_ac_poly ...
);

%% HP Elitebook Laptop AC/DC Converter
% Waveform input file
fname = 'waveforms/hp-elitebook-ac-batt-charged.csv';

% Configuration:
%   Channel 1 = Transformer High-Side (Voltage: AB, Current: A)
%   Channel 2 = Converter DC Output (Voltage, Current)
%   Channel 4 = Converter AC Input (Voltage, Current)

% Sampling interval - must match to data files
dt = 50.0e-6; % 0.05 ms

% Time domain data: t, V1, V2, V4, I1, I2, I4, P1, P2, P4
data = csvread(fname,1,0);

% Extract time-domain waveforms
t = data(:,1);
v_ac = data(:,4);
i_ac = data(:,7);
p_dc = data(:,9);

% Frequency domain measured voltage
[~, ~, V_ac] = time2freq(v_ac, dt);
V_ac = V_ac(ismember(h_spectrum,h)) / sqrt(2) / bases.VLN_Low;

% Frequency domain measured current
[~, ~, I_ac] = time2freq(i_ac, dt);
I_ac = I_ac(ismember(h_spectrum,h)) / sqrt(2) / bases.I_Low;

% Frequency domain power
P_DC = mean(p_dc) / bases.S1p;

% Reference waveform model
I_ac_wave = zeros(size(h_spectrum));
I_ac_wave(ismember(h_spectrum,h)) = ...
    rectifier1P(hpElitebookAC_wave, h, V_ac, P_DC);
[i_ac_wave, ~] = freq2time(f, I_ac_wave, dt_model);
i_ac_wave = i_ac_wave .* bases.I_Low .* sqrt(2);

% Polynomial model
I_ac_poly = zeros(size(h_spectrum));
I_ac_poly(ismember(h_spectrum,h)) = ...
    rectifier1P(hpElitebookAC_poly, h, V_ac, P_DC);
[i_ac_poly, ~] = freq2time(f, I_ac_poly, dt_model);
i_ac_poly = i_ac_poly .* bases.I_Low .* sqrt(2);

% Plots
dev_title = 'HP Elitebook AC/DC Converter';
h_plot = [1,3,5,7,9,11];
figure(2)

subplot(2,2,1)
plot( ...
    t, i_ac, '-k', ...              % Measured
    t_model, i_ac_wave, '--b', ...  % Reference waveform model
    t_model, i_ac_poly, '-.r');     % Polynomial model
title([dev_title ': ' 'Current Waveforms'])
xlabel('Time (s)');
ylabel('Current (A)');
legend('Measured','Reference Waveform Model','Polynomial Model');

subplot(2,2,2)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
polar(angle(Ih_meas), abs(Ih_meas), '-ok'); % Measured
hold on
polar(angle(Ih_wave), abs(Ih_wave), '-sb'); % Reference waveform model
polar(angle(Ih_poly), abs(Ih_poly), '-dr'); % Polynomial model
hold off
title([dev_title ': ' 'Current Phasors'])
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'EastOutside');

subplot(2,2,3)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
stem(h_plot - 0.1, abs(Ih_meas), '-ok');  % Measured
hold on
stem(h_plot + 0.0, abs(Ih_wave), '-sb');  % Reference waveform model
stem(h_plot + 0.1, abs(Ih_poly), '-dr');  % Polynomial model
hold off
title([dev_title ': ' 'Current Magnitudes'])
xlabel('Harmonic');
ylabel('Magnitude (pu)');
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'NorthEast');

subplot(2,2,4)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
plot( ...
    h_plot, rad2deg(angle(Ih_meas)), '-ok', ...     % Measured
    h_plot, rad2deg(angle(Ih_wave)), '-sb', ...     % Reference waveform model
    h_plot, rad2deg(angle(Ih_poly)), '-dr');        % Polynomial model
title([dev_title ': ' 'Current Phase Angles'])
xlabel('Harmonic');
ylabel('Phase (deg)');
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'SouthEast');

% Save struct of data
hpElitebook_waveform_data = struct( ...
    'h', h_plot, ...
    'Vh_meas', V_ac(ismember(h,h_plot)) .* bases.VLN_Low, ...
    'Ih_meas', Ih_meas .* bases.I_Low, ...
    'Ih_wave', Ih_meas .* bases.I_Low, ...
    'Ih_poly', Ih_meas .* bases.I_Low, ...
    't_meas', t, ...
    'v_meas', v_ac, ...
    'i_meas', i_ac, ...
    't_model', t_model, ...
    'i_wave', i_ac_wave, ...
    'i_poly', i_ac_poly ...
);

%% HP Pavilion Laptop AC/DC Converter
% Waveform input file
fname = 'waveforms/hp-pavilion-ac-batt-charged.csv';

% Configuration:
%   Channel 1 = Transformer High-Side (Voltage: AB, Current: A)
%   Channel 2 = Converter DC Output (Voltage, Current)
%   Channel 4 = Converter AC Input (Voltage, Current)

% Sampling interval - must match to data files
dt = 50.0e-6; % 0.05 ms

% Time domain data: t, V1, V2, V4, I1, I2, I4, P1, P2, P4
data = csvread(fname,1,0);

% Extract time-domain waveforms
t = data(:,1);
v_ac = data(:,4);
i_ac = data(:,7);
p_dc = data(:,9);

% Frequency domain measured voltage
[~, ~, V_ac] = time2freq(v_ac, dt);
V_ac = V_ac(ismember(h_spectrum,h)) / sqrt(2) / bases.VLN_Low;

% Frequency domain measured current
[~, ~, I_ac] = time2freq(i_ac, dt);
I_ac = I_ac(ismember(h_spectrum,h)) / sqrt(2) / bases.I_Low;

% Frequency domain power
P_DC = mean(p_dc) / bases.S1p;

% Reference waveform model
I_ac_wave = zeros(size(h_spectrum));
I_ac_wave(ismember(h_spectrum,h)) = ...
    rectifier1P(hpPavilionAC_wave, h, V_ac, P_DC);
[i_ac_wave, ~] = freq2time(f, I_ac_wave, dt_model);
i_ac_wave = i_ac_wave .* bases.I_Low .* sqrt(2);

% Polynomial model
I_ac_poly = zeros(size(h_spectrum));
I_ac_poly(ismember(h_spectrum,h)) = ...
    rectifier1P(hpPavilionAC_poly, h, V_ac, P_DC);
[i_ac_poly, ~] = freq2time(f, I_ac_poly, dt_model);
i_ac_poly = i_ac_poly .* bases.I_Low .* sqrt(2);

% Plots
dev_title = 'HP Pavilion AC/DC Converter';
h_plot = [1,3,5,7,9,11];
figure(3)

subplot(2,2,1)
plot( ...
    t, i_ac, '-k', ...              % Measured
    t_model, i_ac_wave, '--b', ...  % Reference waveform model
    t_model, i_ac_poly, '-.r');     % Polynomial model
title([dev_title ': ' 'Current Waveforms'])
xlabel('Time (s)');
ylabel('Current (A)');
legend('Measured','Reference Waveform Model','Polynomial Model');

subplot(2,2,2)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
polar(angle(Ih_meas), abs(Ih_meas), '-ok'); % Measured
hold on
polar(angle(Ih_wave), abs(Ih_wave), '-sb'); % Reference waveform model
polar(angle(Ih_poly), abs(Ih_poly), '-dr'); % Polynomial model
hold off
title([dev_title ': ' 'Current Phasors'])
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'EastOutside');

subplot(2,2,3)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
stem(h_plot - 0.1, abs(Ih_meas), '-ok');  % Measured
hold on
stem(h_plot + 0.0, abs(Ih_wave), '-sb');  % Reference waveform model
stem(h_plot + 0.1, abs(Ih_poly), '-dr');  % Polynomial model
hold off
title([dev_title ': ' 'Current Magnitudes'])
xlabel('Harmonic');
ylabel('Magnitude (pu)');
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'NorthEast');

subplot(2,2,4)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
plot( ...
    h_plot, rad2deg(angle(Ih_meas)), '-ok', ...     % Measured
    h_plot, rad2deg(angle(Ih_wave)), '-sb', ...     % Reference waveform model
    h_plot, rad2deg(angle(Ih_poly)), '-dr');        % Polynomial model
title([dev_title ': ' 'Current Phase Angles'])
xlabel('Harmonic');
ylabel('Phase (deg)');
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'SouthEast');

% Save struct of data
hpPavilion_waveform_data = struct( ...
    'h', h_plot, ...
    'Vh_meas', V_ac(ismember(h,h_plot)) .* bases.VLN_Low, ...
    'Ih_meas', Ih_meas .* bases.I_Low, ...
    'Ih_wave', Ih_meas .* bases.I_Low, ...
    'Ih_poly', Ih_meas .* bases.I_Low, ...
    't_meas', t, ...
    'v_meas', v_ac, ...
    'i_meas', i_ac, ...
    't_model', t_model, ...
    'i_wave', i_ac_wave, ...
    'i_poly', i_ac_poly ...
);

%% AC LED Driver 1
% Waveform input file
fname = 'waveforms/led-driver-1-ac.csv';

% Configuration:
%   Channel 1 = Transformer High-Side (Voltage: AB, Current: A)
%   Channel 2 = Converter DC Output (Voltage, Current)
%   Channel 4 = Converter AC Input (Voltage, Current)

% Sampling interval - must match to data files
dt = 50.0e-6; % 0.05 ms

% Time domain data: t, V1, V2, V4, I1, I2, I4, P1, P2, P4
data = csvread(fname,1,0);

% Extract time-domain waveforms
t = data(:,1);
v_ac = data(:,2);
i_ac = data(:,4);
p_dc = data(:,6);

% Frequency domain measured voltage
[~, ~, V_ac] = time2freq(v_ac, dt);
V_ac = V_ac(ismember(h_spectrum,h)) / sqrt(2) / bases.VLN_Low;

% Frequency domain measured current
[~, ~, I_ac] = time2freq(i_ac, dt);
I_ac = I_ac(ismember(h_spectrum,h)) / sqrt(2) / bases.I_Low;

% Frequency domain power
P_DC = mean(p_dc) / bases.S1p;

% Reference waveform model
I_ac_wave = zeros(size(h_spectrum));
I_ac_wave(ismember(h_spectrum,h)) = ...
    rectifier1P(ledDriver1AC_wave, h, V_ac, P_DC);
[i_ac_wave, ~] = freq2time(f, I_ac_wave, dt_model);
i_ac_wave = i_ac_wave .* bases.I_Low .* sqrt(2);

% Polynomial model
I_ac_poly = zeros(size(h_spectrum));
I_ac_poly(ismember(h_spectrum,h)) = ...
    rectifier1P(ledDriver1AC_poly, h, V_ac, P_DC);
[i_ac_poly, ~] = freq2time(f, I_ac_poly, dt_model);
i_ac_poly = i_ac_poly .* bases.I_Low .* sqrt(2);

% Plots
dev_title = 'AC LED Driver 1';
h_plot = [1,3,5,7,9,11];
figure(4)

subplot(2,2,1)
plot( ...
    t, i_ac, '-k', ...              % Measured
    t_model, i_ac_wave, '--b', ...  % Reference waveform model
    t_model, i_ac_poly, '-.r');     % Polynomial model
title([dev_title ': ' 'Current Waveforms'])
xlabel('Time (s)');
ylabel('Current (A)');
legend('Measured','Reference Waveform Model','Polynomial Model');

subplot(2,2,2)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
polar(angle(Ih_meas), abs(Ih_meas), '-ok'); % Measured
hold on
polar(angle(Ih_wave), abs(Ih_wave), '-sb'); % Reference waveform model
polar(angle(Ih_poly), abs(Ih_poly), '-dr'); % Polynomial model
hold off
title([dev_title ': ' 'Current Phasors'])
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'EastOutside');

subplot(2,2,3)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
stem(h_plot - 0.1, abs(Ih_meas), '-ok');  % Measured
hold on
stem(h_plot + 0.0, abs(Ih_wave), '-sb');  % Reference waveform model
stem(h_plot + 0.1, abs(Ih_poly), '-dr');  % Polynomial model
hold off
title([dev_title ': ' 'Current Magnitudes'])
xlabel('Harmonic');
ylabel('Magnitude (pu)');
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'NorthEast');

subplot(2,2,4)
Ih_meas = I_ac(ismember(h,h_plot));
Ih_wave = I_ac_wave(ismember(h_spectrum,h_plot));
Ih_poly = I_ac_poly(ismember(h_spectrum,h_plot));
plot( ...
    h_plot, rad2deg(angle(Ih_meas)), '-ok', ...     % Measured
    h_plot, rad2deg(angle(Ih_wave)), '-sb', ...     % Reference waveform model
    h_plot, rad2deg(angle(Ih_poly)), '-dr');        % Polynomial model
title([dev_title ': ' 'Current Phase Angles'])
xlabel('Harmonic');
ylabel('Phase (deg)');
legend({'Measured','Reference Waveform Model','Polynomial Model'}, ...
    'Location', 'SouthEast');

% Save struct of data
ledDriver1_waveform_data = struct( ...
    'h', h_plot, ...
    'Vh_meas', V_ac(ismember(h,h_plot)) .* bases.VLN_Low, ...
    'Ih_meas', Ih_meas .* bases.I_Low, ...
    'Ih_wave', Ih_meas .* bases.I_Low, ...
    'Ih_poly', Ih_meas .* bases.I_Low, ...
    't_meas', t, ...
    'v_meas', v_ac, ...
    'i_meas', i_ac, ...
    't_model', t_model, ...
    'i_wave', i_ac_wave, ...
    'i_poly', i_ac_poly ...
);

%% Save Waveform Data
% Save MAT file of waveform data
save('Waveform_Comparison_Data.mat', ...
    ... %'agilent_waveform_data', ...
    'hpEnvy_waveform_data', ...
    'hpElitebook_waveform_data', ...
    'hpPavilion_waveform_data', ...
    'ledDriver1_waveform_data' ...
);
        

