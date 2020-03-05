%% 1-Phase Rectifier Model Test
% Test script to excercise the single-phase rectifier model and ensure
% proper operation.

%% Setup
% Fundamental frequency
f = 60;         % Hz
omega = 2*pi*f; % rad/sec

% Fundamental period
T = 1 / f;

% Sampling interval - must match to data file (check!)
dt = 50.0e-6; % 0.05 ms

% Sampling frequency
Fs = 1/dt; % 20.0 kHz

% Harmonics
h = [1; 3; 5; 7; 9; 11; 13; 15; 17; 19];

%% Create Model
% Select a case...
fname = 'waveforms/hp-envy-ac-batt-charged.csv';

% Configuration:
%   Channel 1 = Transformer High-Side (Voltage: AB, Current: A)
%   Channel 2 = Converter DC Output (Voltage, Current)
%   Channel 4 = Converter AC Input (Voltage, Current)

% Time domain data: t, V1, V2, V4, I1, I2, I4, P1, P2, P4
data = csvread(fname,1,0);

% Extract time-domain waveforms
t = data(:,1);
v_ac = data(:,4); v_dc = data(:,3);
i_ac = data(:,7); i_dc = data(:,6);
p_ac = data(:,10); p_dc = data(:,9);

% Create model
model = struct('href',h);

% Calculate reference voltage
[~, h_temp, V_temp] = time2freq(v_ac, dt);
model.Vref = V_temp(ismember(h_temp,1)) / sqrt(2); % Peak -> RMS

% Current spectrum at specified harmonics
[~, h_temp, I_temp] = time2freq(i_ac, dt);
model.Iref = I_temp(ismember(h_temp,h)) / sqrt(2); % Peak -> RMS

% Reference DC power outut and conversion loss model
model.Pref = mean(p_dc);
model.alpha = 0;
model.beta = (mean(p_ac) - model.Pref) / model.Pref;
model.gamma = 0;

% Plot
figure(1);

subplot(2,1,1);
plot(t, v_ac, '-k');
title('HP Envy AC/DC Converter: Measured Voltage');
xlabel('Time (sec)'); ylabel('Voltage (V)');

subplot(2,1,2);
plot(t, i_ac, '-k');
title('HP Envy AC/DC Converter: Measured Current');
xlabel('Time (sec)'); ylabel('Current (A)');

%% Case 1: Replicate Reference Conditions
% AC voltage
V = zeros(size(h));
V(h == 1) = model.Vref;

% DC output power
Pdc = model.Pref;

% Compute injection current
I = rectifier1P(model, h, V, Pdc);

% Compute time-domain voltage waveform
V_temp = zeros(size(V_temp));
V_temp(ismember(h_temp,h)) = V;
[v_ac2, ~] = freq2time(f, V_temp, dt);
v_ac2 = v_ac2 * sqrt(2); % RMS -> Peak

% Compute time-domain current waveform
I_temp = zeros(size(I_temp));
I_temp(ismember(h_temp,h)) = I;
[i_ac2, ~] = freq2time(f, I_temp, dt);
i_ac2 = i_ac2 * sqrt(2); % RMS -> Peak

% Plot
figure(1);

subplot(2,1,1);
plot(t, v_ac, '-k', t, v_ac2, '--b');
title('HP Envy AC/DC Converter: Voltage');
xlabel('Time (sec)'); ylabel('Voltage (V)');

leg1 = legend('Original','Modeled');
set(leg1, 'Location', 'Best');

subplot(2,1,2);
plot(t, i_ac, '-k', t, i_ac2, '--b');
title('HP Envy AC/DC Converter: Current');
xlabel('Time (sec)'); ylabel('Current (A)');

%% Case 2: New Voltage Phasor
% AC voltage
V = zeros(size(h));
V(h == 1) = 120; % RMS

% DC output power
Pdc = model.Pref;

% Compute injection current
I = rectifier1P(model, h, V, Pdc);

% Compute time-domain voltage waveform
V_temp = zeros(size(V_temp));
V_temp(ismember(h_temp,h)) = V;
[v_ac2, ~] = freq2time(f, V_temp, dt);
v_ac2 = v_ac2 * sqrt(2); % RMS -> Peak

% Compute time-domain current waveform
I_temp = zeros(size(I_temp));
I_temp(ismember(h_temp,h)) = I;
[i_ac2, ~] = freq2time(f, I_temp, dt);
i_ac2 = i_ac2 * sqrt(2); % RMS -> Peak

% Plot
figure(1);

subplot(2,1,1);
plot(t, v_ac, '-k', t, v_ac2, '--r');
title('HP Envy AC/DC Converter: Voltage');
xlabel('Time (sec)'); ylabel('Voltage (V)');

leg1 = legend('Original','New');
set(leg1, 'Location', 'Best');

subplot(2,1,2);
plot(t, i_ac, '-k', t, i_ac2, '--r');
title('HP Envy AC/DC Converter: Current');
xlabel('Time (sec)'); ylabel('Current (A)');

%% Case 3: New Power Level
% AC voltage
V = zeros(size(h));
V(h == 1) = 120; % RMS

% DC output power
Pdc = 10;

% Compute injection current
I = rectifier1P(model, h, V, Pdc);

% Compute time-domain voltage waveform
V_temp = zeros(size(V_temp));
V_temp(ismember(h_temp,h)) = V;
[v_ac2, ~] = freq2time(f, V_temp, dt);
v_ac2 = v_ac2 * sqrt(2); % RMS -> Peak

% Compute time-domain current waveform
I_temp = zeros(size(I_temp));
I_temp(ismember(h_temp,h)) = I;
[i_ac2, ~] = freq2time(f, I_temp, dt);
i_ac2 = i_ac2 * sqrt(2); % RMS -> Peak

% Plot
figure(1);

subplot(2,1,1);
plot(t, v_ac, '-k', t, v_ac2, '--r');
title('HP Envy AC/DC Converter: Voltage');
xlabel('Time (sec)'); ylabel('Voltage (V)');

leg1 = legend('Original','New');
set(leg1, 'Location', 'Best');

subplot(2,1,2);
plot(t, i_ac, '-k', t, i_ac2, '--r');
title('HP Envy AC/DC Converter: Current');
xlabel('Time (sec)'); ylabel('Current (A)');

%% Case 4: Voltage Distortion
% AC voltage
V = zeros(size(h));
V(h == 1) = 120; % RMS
V(h == 3) =   5; % RMS

% DC output power
Pdc = model.Pref;

% Compute injection current
I = rectifier1P(model, h, V, Pdc);

% Compute time-domain voltage waveform
V_temp = zeros(size(V_temp));
V_temp(ismember(h_temp,h)) = V;
[v_ac2, ~] = freq2time(f, V_temp, dt);
v_ac2 = v_ac2 * sqrt(2); % RMS -> Peak

% Compute time-domain current waveform
I_temp = zeros(size(I_temp));
I_temp(ismember(h_temp,h)) = I;
[i_ac2, ~] = freq2time(f, I_temp, dt);
i_ac2 = i_ac2 * sqrt(2); % RMS -> Peak

% Plot
figure(1);

subplot(2,1,1);
plot(t, v_ac, '-k', t, v_ac2, '--r');
title('HP Envy AC/DC Converter: Voltage');
xlabel('Time (sec)'); ylabel('Voltage (V)');

leg1 = legend('Original','New');
set(leg1, 'Location', 'Best');

subplot(2,1,2);
plot(t, i_ac, '-k', t, i_ac2, '--r');
title('HP Envy AC/DC Converter: Current');
xlabel('Time (sec)'); ylabel('Current (A)');