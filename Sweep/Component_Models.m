%% Component Models
% Construct component models for the following devices:
%
%   - 3 kVA transformer
%   - Agilent 12V power supply
%   - HP Envy laptop AC/DC converter
%   - HP Elitebook laptop AC/DC converter
%   - HP Pavilion laptop AC/DC converter
%   - AC LED drivers (1, 2, 3)
%   - HP Envy laptop DC/DC converter
%   - HP Elitebook laptop DC/DC converter
%   - HP Pavilion laptop DC/DC converter
%   - DC LED driver (same model for all 3)
%
% For devices with AC harmonic injection spectra, two sets of models are
% generated:
%
%   - Waveform Reference: Uses measured waveform to define empirical
%     harmonic current injection spectrum (magnitude, angle)
%   - Polynomial Model: Uses Avpreet's polynomial model's (fitted
%     elsewhere; provided numerically) to define the harmonic current
%     injection spectrum (magnitude, angle)

%% Setup
% Fundamental frequency
f = 60;         % Hz
omega = 2*pi*f; % rad/sec

% Fundamental period
T = 1 / f;

% Harmonics
h = [1; 3; 5; 7; 9; 11; 13; 15; 17; 19];

% Specfied system bases
bases = struct();
bases.S1p =         1000;   % VA
bases.VLL_High =    480;    % V
bases.VLN_Low =     120;    % V

% Calculated system bases
bases.S3p = 3*bases.S1p;
bases.VLN_High = bases.VLL_High / sqrt(3);
bases.VLL_Low = bases.VLN_Low * sqrt(3);
bases.I_High = bases.S1p / bases.VLN_High;
bases.I_Low = bases.S1p / bases.VLN_Low;
bases.Z_High = bases.VLN_High^2 / bases.S1p;
bases.Z_Low = bases.VLN_Low^2 / bases.S1p;

% DC bases
bases.Vdc = 12;
bases.Pdc = bases.S1p;
bases.Idc = bases.Pdc / bases.Vdc;

% Constant 'a' = 1 /_ 120°
a = exp(1j*deg2rad(120));

% Ref: Glover, Sarma, & Overbye, 4th ed., p. 400

% Transformation matrices:
%   I_abc = A I_seq
%   I_seq = A^-1 I_abc
A = [1 1 1; 1 a^2 a; 1 a a^2];
Ainv = inv(A);

%% Polynomial Harmonic Models
% Load Avpreet's harmonic models -> see email chain from Avpreet
load 'harmonic-spectrum-models/hrmMdl.mat';

% Key:
%   hrmMdlLoad(1) => AC HP Envy Laptop
%   hrmMdlLoad(2) => AC HP Elitebook Laptop
%   hrmMdlLoad(3) => AC HP Pavilion Laptop
%   hrmMdlLoad(4) => AC Led Driver 1
%   hrmMdlLoad(5) => AC Led Driver 2 
%   hrmMdlLoad(6) => AC Led Driver 3
%   hrmMdlLoad(7) => Agilent power supply

%% 3 kVA Transformer
% Note: For all CSV data files, numeric data starts on row 27

% Model
transformer = struct();

% Read open circuit data 1:
%   Column 34 = Avg. Line-to-Line RMS Voltage
%   Column 40 = Avg. Phase RMS Current
%   Column 48 = Phase A Power
%   Column 49 = Phase B Power
%   Column 50 = Phase C Power
fname = 'efficiency-curves/transformer-open-circuit-1.csv';
data = csvread(fname,26,0);

V_NL = data(:,34) ./ bases.VLL_High;
I_NL = data(:,40) ./ bases.I_High;
P_NL = sum(data(:,48:50),2) ./ bases.S3p;

% Read open circuit data 2:
%   Column 124 = Avg. Line-to-Line RMS Voltage
%   Column 130 = Avg. Phase RMS Current
%   Column 138 = Phase A Power
%   Column 139 = Phase B Power
%   Column 140 = Phase C Power
fname = 'efficiency-curves/transformer-open-circuit-2.csv';
data = csvread(fname,26,0);

V_NL = [V_NL; (data(:,124) ./ bases.VLL_High)];
I_NL = [I_NL; (data(:,130) ./ bases.I_High)];
P_NL = [P_NL; (sum(data(:,138:140),2) ./ bases.S3p)];

% Compute relevant quantities
S_NL = V_NL .* I_NL;
Q_NL = sqrt(S_NL.^2 - P_NL.^2);

% Read load test data:
%   Column  94 = Phase a/b/c RMS Voltage
%   Column 110 = Phase a/b/c Real Power
%   Column 114 = Phase a/b/c Reactive Power
%   Column 124 = Avg. Line-to-Line RMS Voltage
%   Column 138 = Phase A Power
%   Column 139 = Phase B Power
%   Column 140 = Phase C Power
subdir = 'efficiency-curves/';
data_a1 = [ ...
   csvread([subdir 'transformer-phase-a-100W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-300W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-500W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-700W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-900W.csv'],26,0)];
data_a2 = [ ...
   csvread([subdir 'transformer-phase-a-v2-25W.csv'],26,0); ...
    csvread([subdir 'transformer-phase-a-v2-50W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-75W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-100W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-125W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-150W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-175W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-200W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-225W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-250W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-275W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-300W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-325W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-350W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-375W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-400W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-425W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-450W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-475W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-500W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-525W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-550W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-575W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-600W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-625W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-650W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-675W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-700W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-725W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-750W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-775W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-800W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-825W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-850W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-875W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-a-v2-900W.csv'],26,0)];
data_b = [ ...
   csvread([subdir 'transformer-phase-b-100W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-b-300W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-b-500W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-b-700W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-b-900W.csv'],26,0)];
data_c = [ ...
   csvread([subdir 'transformer-phase-c-100W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-c-300W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-c-500W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-c-700W.csv'],26,0); ...
   csvread([subdir 'transformer-phase-c-900W.csv'],26,0)];

% For this model fit...
%   - Neglect magnetizing current's contribution to primary winding loss
%   - Assume zero current on unloaded phases
%   - Neglect phase angle impact
%   - Neglect temperature impact
%
% Thus, converting to sequence components yields 1/3 * I_phase on each of
% the sequences: +, -, 0. The load losses look like this:
%
%   P_LL = (I+)^2*R_Se + (I-)^2*R_Se + (I0)^2*R_Se
%
% Since |I+| = |I-| = |I0|, this means...
%
%   P_LL = ((1/3)*|I_phase|)^2*(3R_Se)
%
% Meanwhile,
%
%   P_NL = V^2 / R_c
%
% And
%
%   P_Loss = P_LL + P_NL = V^2 / R_c + ((1/3)*|I_phase|)^2*(3R_Se)

% Extract load data
V_LL = [ ...
%     data_a1(:,124); ...
    data_a2(:,124) ...
%     data_b(:, 124); ...
%     data_c(:, 124) ...
    ] ./ bases.VLL_High;
V_ph = [ ...
%     data_a1(:, 94); ...
    data_a2(:, 94) ...
%     data_b(:,  94); ...
%     data_c(:,  94)...
    ] ./ bases.VLN_Low;
P_ld = [...
%     data_a1(:,110); ...
    data_a2(:,110) ...
%     data_b(:, 110); ...
%     data_c(:, 110) ...
    ] ./ bases.S1p;
Q_ld = [ ...
%     data_a1(:,114); ...
    data_a2(:,114) ...
%     data_b(:, 114); ...
%     data_c(:, 114) ...
    ] ./ bases.S1p;
P_in = [ ...
%     sum(data_a1(:,138:140),2); ...
    sum(data_a2(:,138:140),2) ...
%     sum(data_b(:, 138:140),2); ...
%     sum(data_c(:, 138:140),2) ...
    ] ./ bases.S3p;

% Calculate phase current
I_ph = conj((P_ld + 1j.*Q_ld)./V_ph);

% Combine with no-load data
V_in   = [V_NL; V_LL];
I_ph   = [zeros(size(V_NL)); I_ph]; % Estimated phase current
P_in   = [P_NL; P_in];
P_out  = [zeros(size(P_NL)); (P_ld ./ 3)]; % 1-phase base to 3-phase base
P_loss = P_in - P_out;

% Free up memory
clear data data_a data_b data_c

% Least squares fit: Series and shunt resistance
lm = lscov([V_in.^2, (abs(I_ph)./3).^2], P_loss);
transformer.Rc = 1 / lm(1);
R_series       = lm(2) / 3;

% Arbitrarily assign 1/2 to each winding
transformer.Rp = R_series / 2;
transformer.Rs = R_series / 2;

% Least squares fit: Magnetizing reactance
transformer.Xm = 1 / lscov(V_NL.^2,Q_NL);

% Calculate series reactance from nameplate series impedance of 2.72%
X_series = sqrt(0.0272^2 - R_series^2);

% Arbitrarily assign 1/2 to each winding
transformer.Xp = X_series / 2;
transformer.Xs = X_series / 2;

% Check results: Actual vs. Predicted
plot( P_in - P_out, ...                                          
    V_in.^2 ./ transformer.Rc + (abs(I_ph)./3).^2 .* 3*R_series, ...
    '.k', ...
    [0.02,0.04], [0.02,0.04], '-r'); % Parity line
title('Transformer (Fitted Model Loss Parity Plot')
xlabel('Measured Loss (pu)');
ylabel('Modeled Loss (pu)');

% Series loss breakout (ref. Steve's dissertation or NEMA TP-1)
transformer.fW   = 0.9;
transformer.fEC  = 0.067;
transformer.fOSL = 0.033;

% Series loss breakout (resistive only!)
% transformer.fW   = 1.0;
% transformer.fEC  = 0.0;
% transformer.fOSL = 0.0;

% Possible refinements:
%   - Include temperature effects
%   - Include I_NL in calculation using phasor math
%   - Proper sequence current calculations?

% Fitted Models Over Time
% -----------------------
%
% Versions:
%
%   1. Core (no-load) and winding (load) losses fitted separately; 25W
%      increment load data excluded
%   2. Core (no-load) and winding (load) losses fitted jointly; 25W
%      increment load data excluded
%   3. Core (no-load) and winding (load) losses fitted jointly; 25W
%      increment load data included
%   4. Core (no-load) and winding (load) losses fitted jointly; 25W
%      increment load data only
%
% Version |      Rc |     Rp |     Rs |     Xm |     Xp |     Xs
%    1    | 34.6934 | 0.0107 | 0.0107 | 7.9047 | 0.0084 | 0.0084
%    2    | 34.7043 | 0.0110 | 0.0110 | 7.9047 | 0.0080 | 0.0080
%    3    | 34.7024 | 0.0110 | 0.0110 | 7.9047 | 0.0080 | 0.0080
%    4    | 34.6884 | 0.0107 | 0.0107 | 7.9047 | 0.0084 | 0.0084

%% Agilent 12V Power Supply (Waveform Reference)
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
v_ac = data(:,3);
i_ac = data(:,6);
p_dc = data(:,10);

% Create model
agilent_wave = struct('href',h);

% Calculate reference voltage
[~, h_temp, V_temp] = time2freq(v_ac, dt);
agilent_wave.Vref = V_temp(ismember(h_temp,1)) / sqrt(2) / bases.VLN_Low;

% Note: we're using line-to-neutral voltage base b/c in the actual
% experiment the Agilent power supply was connected line-to-neutral

% Current spectrum at specified harmonics
[~, h_temp, I_temp] = time2freq(i_ac, dt);
agilent_wave.Iref = I_temp(ismember(h_temp,h)) / sqrt(2) / bases.I_Low;

% Reference DC power output
agilent_wave.Pref = mean(p_dc) / bases.S1p;

% Efficiency model input data:
% Configuration:
%   Column  34 = AC input voltage
%   Column  42 = AC input current
%   Column  50 = AC input power
%   Column  93 = DC output voltage
%   Column 101 = DC output current
%   Column 109 = DC output power
subdir = 'efficiency-curves/';
data = [ ...
%     csvread([subdir 'agilent-0W.csv'],26,0); ... % Unit in standby
%     csvread([subdir 'agilent-100W.csv'],26,0); ...
%     csvread([subdir 'agilent-200W.csv'],26,0); ...
%     csvread([subdir 'agilent-300W.csv'],26,0); ...
%     csvread([subdir 'agilent-400W.csv'],26,0); ...
%     csvread([subdir 'agilent-500W.csv'],26,0); ...
%     csvread([subdir 'agilent-600W.csv'],26,0); ...
%     csvread([subdir 'agilent-700W.csv'],26,0); ...
%     csvread([subdir 'agilent-800W.csv'],26,0); ...
%     csvread([subdir 'agilent-900W.csv'],26,0); ...   
    csvread([subdir 'agilent-v2-25W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-50W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-75W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-100W.csv'],26,0); ...    
    csvread([subdir 'agilent-v2-125W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-150W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-175W.csv'],26,0); ... 
    csvread([subdir 'agilent-v2-200W.csv'],26,0); ...    
    csvread([subdir 'agilent-v2-225W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-250W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-275W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-300W.csv'],26,0); ...    
    csvread([subdir 'agilent-v2-325W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-350W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-375W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-400W.csv'],26,0); ...    
    csvread([subdir 'agilent-v2-425W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-450W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-475W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-500W.csv'],26,0); ...    
    csvread([subdir 'agilent-v2-525W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-550W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-575W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-600W.csv'],26,0); ...    
    csvread([subdir 'agilent-v2-625W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-650W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-675W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-700W.csv'],26,0); ...    
    csvread([subdir 'agilent-v2-725W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-750W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-775W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-800W.csv'],26,0); ...    
    csvread([subdir 'agilent-v2-825W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-850W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-875W.csv'],26,0); ...
    csvread([subdir 'agilent-v2-900W.csv'],26,0)];

% Extract power data and convert to per-unit (on DC base)
Pin  = data(:,50)  ./ bases.Pdc;
Pout = data(:,109) ./ bases.Pdc;

% Free up memory
clear data

% Compute loss
Ploss = Pin - Pout;

% Fit quadratic loss model
lm = lscov([ones(size(Pout)), Pout, Pout.^2],Ploss);
agilent_wave.alpha = lm(1);
agilent_wave.beta  = lm(2);
agilent_wave.gamma = lm(3);

% % Optional plot: Loss. vs output power
% Pout_plot = (0:0.05:1.20);
% Ploss_plot = agilent.alpha ...
%     + agilent.beta .* Pout_plot ...
%     + agilent.gamma .* Pout_plot.^2;
% plot(Pout, Ploss, '.k', Pout_plot, Ploss_plot, '--b');
% 
% % Optional plot: Loss parity plot
% Ploss_model = agilent.alpha ...
%     + agilent.beta .* Pout ...
%     + agilent.gamma .* Pout.^2;
% plot(Ploss, Ploss_model, '.', [0.15,0.35], [0.15,0.35], '-r');

% Fitted Models Over Time
% -----------------------
%
% Versions:
%
%   1. Spreadsheet version, based on 100W load increment data only
%   2. MATLAB version, based on combined 100W and 25W load increment data,
%      except 0W (standby) condition
%   3. MATLAB version, based on 25W load increment data only
%
% Version |  alpha |    beta |  gamma
%    1    | 0.1390 |  0.1397 |  -0.01
%    2    | 0.1824 | -0.0145 | 0.1269
%    3    | 0.1815 | -0.0158 | 0.1288

%% Agilent 12V Power Supply (Polynomial Model)
% Base model: same as waveform reference
agilent_poly = agilent_wave;

% % Temporary: Reference voltage phase shift = -15 deg
% %   - By inspection of waveform plots: Trigger (0 deg) was on V_AB,
% %     transformer high side. Power supply was connected to V_bc, on
% %     transformer low side. From observed phasor diagrams, V_bc leads V_AB
% %     by 60 deg. When tested, this doesn't seem to work right.
% %   - By trial and error: -15 deg as the phase reference appears to work
% %     best, although this value makes no sense.
% agilent_poly.Vref = abs(agilent_poly.Vref) * exp(1j*deg2rad(-15));
% 
% % Compute injection spectrum from polynomial model (see key above)
% I_mag = abs(polyval(hrmMdlLoad(7).coefMag, agilent_poly.href));
% I_ang = polyval(hrmMdlLoad(7).coefPhase, agilent_poly.href); 
% I_ref = I_mag .* exp(1j.*I_ang);
% 
% % Apply scaling factor
% scale = agilent_poly.Pref / ...
%     abs(agilent_poly.Vref * conj(I_ref(agilent_poly.href == 1)));
% I_ref = I_ref .* scale;
% 
% % Override harmonic injection spectrum
% agilent_poly.Iref = I_ref;

%% HP Envy Laptop AC/DC Converter (Waveform Reference)
% Power data input file
fname = 'efficiency-curves/hp-envy-ac.csv';

% Configuration:
%   Column  33 = DC output voltage
%   Column  41 = DC output current
%   Column  49 = DC output power
%   Column  94 = AC input voltage
%   Column 102 = AC input current
%   Column 110 = AC input power
data = csvread(fname,26,0);

% Extract power data and convert to per-unit
Pin  = data(:,110) ./ bases.Pdc;
Pout = data(:,49)  ./ bases.Pdc;

% Compute loss
Ploss = Pin - Pout;

% Fit loss model (linear; no quadratic term)
lm = lscov([ones(size(Pout)), Pout], Ploss);

% Create model
hpEnvyAC_wave = struct('alpha', lm(1), 'beta', lm(2), 'gamma', 0);

% % Optional plot: Loss. vs output power
% Pout_plot = (0:0.001:0.040);
% Ploss_plot = hpEnvyAC.alpha ...
%     + hpEnvyAC.beta .* Pout_plot ...
%     + hpEnvyAC.gamma .* Pout_plot.^2;
% plot(Pout, Ploss, '.k', Pout_plot, Ploss_plot, '--b');
% 
% % Optional plot: Loss parity plot
% Ploss_model = hpEnvyAC.alpha ...
%     + hpEnvyAC.beta .* Pout ...
%     + hpEnvyAC.gamma .* Pout.^2;
% plot(Ploss, Ploss_model, '.', [0.001,0.006], [0.001,0.006], '-r');

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

% Create model
hpEnvyAC_wave.href = h;

% Calculate reference voltage
[~, h_temp, V_temp] = time2freq(v_ac, dt);
hpEnvyAC_wave.Vref = V_temp(ismember(h_temp,1)) / sqrt(2) / bases.VLN_Low;

% Current spectrum at specified harmonics
[~, h_temp, I_temp] = time2freq(i_ac, dt);
hpEnvyAC_wave.Iref = I_temp(ismember(h_temp,h)) / sqrt(2) / bases.I_Low;

% Reference DC power output
hpEnvyAC_wave.Pref = mean(p_dc) / bases.S1p;

%% HP Envy Laptop AC/DC Converter (Polynomial Model)
% Base model: same as waveform reference
hpEnvyAC_poly = hpEnvyAC_wave;

% Reference voltage angle = 0 deg
hpEnvyAC_poly.Vref = abs(hpEnvyAC_poly.Vref) * exp(1j*deg2rad(0));

% Compute injection spectrum from polynomial model (see key above)
I_mag = abs(polyval(hrmMdlLoad(1).coefMag, hpEnvyAC_poly.href));
I_ang = polyval(hrmMdlLoad(1).coefPhase, hpEnvyAC_poly.href); 
I_ref = I_mag .* exp(1j.*I_ang);

% Apply scaling factor
scale = hpEnvyAC_poly.Pref / ...
    abs(hpEnvyAC_poly.Vref * conj(I_ref(hpEnvyAC_poly.href == 1)));
I_ref = I_ref .* scale;

% Override harmonic injection spectrum
hpEnvyAC_poly.Iref = I_ref;

%% HP Elitebook Laptop AC/DC Converter (Waveform Reference)
% Power data input file
fname = 'efficiency-curves/hp-elitebook-ac.csv';

% Configuration:
%   Column  33 = DC output voltage
%   Column  41 = DC output current
%   Column  49 = DC output power
%   Column  94 = AC input voltage
%   Column 102 = AC input current
%   Column 110 = AC input power
data = csvread(fname,26,0);

% Extract power data and convert to per-unit
Pin  = data(:,110) ./ bases.Pdc;
Pout = data(:,49)  ./ bases.Pdc;

% Compute loss
Ploss = Pin - Pout;

% Fit loss model (linear; no quadratic term)
lm = lscov([ones(size(Pout)), Pout], Ploss);

% Create model
hpElitebookAC_wave = struct('alpha', lm(1), 'beta', lm(2), 'gamma', 0);

% % Optional plot: Loss. vs output power
% Pout_plot = (0:0.001:0.030);
% Ploss_plot = hpElitebookAC.alpha ...
%     + hpElitebookAC.beta .* Pout_plot ...
%     + hpElitebookAC.gamma .* Pout_plot.^2;
% plot(Pout, Ploss, '.k', Pout_plot, Ploss_plot, '--b');
% 
% % Optional plot: Loss parity plot
% Ploss_model = hpElitebookAC.alpha ...
%     + hpElitebookAC.beta .* Pout ...
%     + hpElitebookAC.gamma .* Pout.^2;
% plot(Ploss, Ploss_model, '.', [0.000,0.004], [0.000,0.004], '-r');

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
v_ac = data(:,4);
i_ac = data(:,7);
p_dc = data(:,9);

% Create model
hpElitebookAC_wave.href = h;

% Calculate reference voltage
[~, h_temp, V_temp] = time2freq(v_ac, dt);
hpElitebookAC_wave.Vref = V_temp(ismember(h_temp,1)) / sqrt(2) / bases.VLN_Low;

% Current spectrum at specified harmonics
[~, h_temp, I_temp] = time2freq(i_ac, dt);
hpElitebookAC_wave.Iref = I_temp(ismember(h_temp,h)) / sqrt(2) / bases.I_Low;

% Reference DC power output
hpElitebookAC_wave.Pref = mean(p_dc) / bases.S1p;

%% HP Elitebook Laptop AC/DC Converter (Polynomial Model)
% Base model: same as waveform reference
hpElitebookAC_poly = hpElitebookAC_wave;

% Reference voltage angle = 0 deg
hpElitebookAC_poly.Vref = abs(hpElitebookAC_poly.Vref) * exp(1j*deg2rad(0));

% Compute injection spectrum from polynomial model (see key above)
I_mag = abs(polyval(hrmMdlLoad(2).coefMag, hpElitebookAC_poly.href));
I_ang = polyval(hrmMdlLoad(2).coefPhase, hpElitebookAC_poly.href); 
I_ref = I_mag .* exp(1j.*I_ang);

% Apply scaling factor
scale = hpElitebookAC_poly.Pref / ...
    abs(hpElitebookAC_poly.Vref * conj(I_ref(hpElitebookAC_poly.href == 1)));
I_ref = I_ref .* scale;

% Override harmonic injection spectrum
hpElitebookAC_poly.Iref = I_ref;

%% HP Pavilion Laptop AC/DC Converter (Waveform Reference)
% Power data input file
fname = 'efficiency-curves/hp-pavilion-ac.csv';

% Configuration:
%   Column  33 = DC output voltage
%   Column  41 = DC output current
%   Column  49 = DC output power
%   Column  94 = AC input voltage
%   Column 102 = AC input current
%   Column 110 = AC input power
data = csvread(fname,26,0);

% Extract power data and convert to per-unit
Pin  = data(:,110) ./ bases.Pdc;
Pout = data(:,49)  ./ bases.Pdc;

% Compute loss
Ploss = Pin - Pout;

% Fit loss model (linear; no quadratic term)
lm = lscov([ones(size(Pout)), Pout], Ploss);

% Create model
hpPavilionAC_wave = struct('alpha', lm(1), 'beta', lm(2), 'gamma', 0);

% % Optional plot: Loss. vs output power
% Pout_plot = (0:0.001:0.040);
% Ploss_plot = hpPavilionAC.alpha ...
%     + hpPavilionAC.beta .* Pout_plot ...
%     + hpPavilionAC.gamma .* Pout_plot.^2;
% plot(Pout, Ploss, '.k', Pout_plot, Ploss_plot, '--b');
% 
% % Optional plot: Loss parity plot
% Ploss_model = hpPavilionAC.alpha ...
%     + hpPavilionAC.beta .* Pout ...
%     + hpPavilionAC.gamma .* Pout.^2;
% plot(Ploss, Ploss_model, '.', [0.003,0.008], [0.003,0.008], '-r');

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
v_ac = data(:,4);
i_ac = data(:,7);
p_dc = data(:,9);

% Create model
hpPavilionAC_wave.href = h;

% Calculate reference voltage
[~, h_temp, V_temp] = time2freq(v_ac, dt);
hpPavilionAC_wave.Vref = V_temp(ismember(h_temp,1)) / sqrt(2) / bases.VLN_Low;

% Current spectrum at specified harmonics
[~, h_temp, I_temp] = time2freq(i_ac, dt);
hpPavilionAC_wave.Iref = I_temp(ismember(h_temp,h)) / sqrt(2) / bases.I_Low;

% Reference DC power output
hpPavilionAC_wave.Pref = mean(p_dc) / bases.S1p;

%% HP Pavilion Laptop AC/DC Converter (Polynomial Model)
% Base model: same as waveform reference
hpPavilionAC_poly = hpPavilionAC_wave;

% Reference voltage angle = 0 deg
hpPavilionAC_poly.Vref = abs(hpPavilionAC_poly.Vref) * exp(1j*deg2rad(0));

% Compute injection spectrum from polynomial model (see key above)
I_mag = abs(polyval(hrmMdlLoad(3).coefMag, hpPavilionAC_poly.href));
I_ang = polyval(hrmMdlLoad(3).coefPhase, hpPavilionAC_poly.href); 
I_ref = I_mag .* exp(1j.*I_ang);

% Apply scaling factor
scale = hpPavilionAC_poly.Pref / ...
    abs(hpPavilionAC_poly.Vref * conj(I_ref(hpPavilionAC_poly.href == 1)));
I_ref = I_ref .* scale;

% Override harmonic injection spectrum
hpPavilionAC_poly.Iref = I_ref;

%% AC LED Driver #1 (Waveform Reference)
% Power data input file
fname = 'efficiency-curves/led-driver-1-ac.csv';

% Configuration:
%   Column   4 = AC input voltage
%   Column  12 = AC input current
%   Column  20 = AC input power
%   Column  33 = DC output voltage
%   Column  41 = DC output current
%   Column  49 = DC output power
data = csvread(fname,26,0);

% Extract power data and convert to per-unit
Pin  = data(:,20) ./ bases.Pdc;
Pout = data(:,49) ./ bases.Pdc;

% Compute loss
Ploss = Pin - Pout;

% Fit loss model (constant efficiency)
lm = lscov(Pout, Ploss);

% Create model
ledDriver1AC_wave = struct('alpha', 0, 'beta', lm(1), 'gamma', 0);

% % Optional plot: Loss. vs output power
% Pout_plot = (0:0.001:0.040);
% Ploss_plot = ledDriverAC.alpha ...
%     + ledDriverAC.beta .* Pout_plot ...
%     + ledDriverAC.gamma .* Pout_plot.^2;
% plot(Pout, Ploss, '.k', Pout_plot, Ploss_plot, '--b');
% 
% % Optional plot: Loss parity plot
% Ploss_model = ledDriverAC.alpha ...
%     + ledDriverAC.beta .* Pout ...
%     + ledDriverAC.gamma .* Pout.^2;
% plot(Ploss, Ploss_model, '.', [0.003,0.008], [0.003,0.008], '-r');

% Waveform input file
fname = 'waveforms/led-driver-1-ac.csv';

% Configuration:
%   Channel 1 = Converter AC Input (Voltage, Current)
%   Channel 4 = Converter DC Output (Voltage, Current)

% Sampling interval - must match to data files
dt = 12.8e-6; % 0.0128 ms

% Time domain data: t, V1, V4, I1, I4, P1, P4
data = csvread(fname,1,0);

% Extract time-domain waveforms
v_ac = data(:,2);
i_ac = data(:,4);
p_dc = data(:,7);

% Create model
ledDriver1AC_wave.href = h;

% Calculate reference voltage
[~, h_temp, V_temp] = time2freq(v_ac, dt);
ledDriver1AC_wave.Vref = V_temp(ismember(h_temp,1)) / sqrt(2) / bases.VLN_Low;

% Current spectrum at specified harmonics
[~, h_temp, I_temp] = time2freq(i_ac, dt);
ledDriver1AC_wave.Iref = I_temp(ismember(h_temp,h)) / sqrt(2) / bases.I_Low;

% Reference DC power output
ledDriver1AC_wave.Pref = mean(p_dc) / bases.S1p;

%% AC LED Driver #1 (Polynomial Model)
% Base model: same as waveform reference
ledDriver1AC_poly = ledDriver1AC_wave;

% Reference voltage angle = 0 deg
ledDriver1AC_poly.Vref = abs(ledDriver1AC_poly.Vref) * exp(1j*deg2rad(0));

% Compute injection spectrum from polynomial model (see key above)
I_mag = abs(polyval(hrmMdlLoad(4).coefMag, ledDriver1AC_poly.href));
I_ang = polyval(hrmMdlLoad(4).coefPhase, ledDriver1AC_poly.href); 
I_ref = I_mag .* exp(1j.*I_ang);

% Apply scaling factor
scale = ledDriver1AC_poly.Pref / ...
    abs(ledDriver1AC_poly.Vref * conj(I_ref(ledDriver1AC_poly.href == 1)));
I_ref = I_ref .* scale;

% Override harmonic injection spectrum
ledDriver1AC_poly.Iref = I_ref;

%% AC LED Driver #2 (Waveform Reference)
% Same as LED Driver 1
ledDriver2AC_wave = ledDriver1AC_wave;

%% AC LED Driver #2 (Polynomial Model)
% Base model: same as waveform reference
ledDriver2AC_poly = ledDriver2AC_wave;

% Reference voltage angle = 0 deg
ledDriver2AC_poly.Vref = abs(ledDriver2AC_poly.Vref) * exp(1j*deg2rad(0));

% Compute injection spectrum from polynomial model (see key above)
I_mag = abs(polyval(hrmMdlLoad(5).coefMag, ledDriver2AC_poly.href));
I_ang = polyval(hrmMdlLoad(5).coefPhase, ledDriver2AC_poly.href); 
I_ref = I_mag .* exp(1j.*I_ang);

% Apply scaling factor
scale = ledDriver2AC_poly.Pref / ...
    abs(ledDriver2AC_poly.Vref * conj(I_ref(ledDriver2AC_poly.href == 1)));
I_ref = I_ref .* scale;

% Override harmonic injection spectrum
ledDriver2AC_poly.Iref = I_ref;

%% AC LED Driver #3 (Waveform Reference)
% Same as LED Driver 1
ledDriver3AC_wave = ledDriver1AC_wave;

%% AC LED Driver #3 (Polynomial Model)
% Base model: same as waveform reference
ledDriver3AC_poly = ledDriver3AC_wave;

% Reference voltage angle = 0 deg
ledDriver3AC_poly.Vref = abs(ledDriver3AC_poly.Vref) * exp(1j*deg2rad(0));

% Compute injection spectrum from polynomial model (see key above)
I_mag = abs(polyval(hrmMdlLoad(6).coefMag, ledDriver3AC_poly.href));
I_ang = polyval(hrmMdlLoad(6).coefPhase, ledDriver3AC_poly.href); 
I_ref = I_mag .* exp(1j.*I_ang);

% Apply scaling factor
scale = ledDriver3AC_poly.Pref / ...
    abs(ledDriver3AC_poly.Vref * conj(I_ref(ledDriver3AC_poly.href == 1)));
I_ref = I_ref .* scale;

% Override harmonic injection spectrum
ledDriver3AC_poly.Iref = I_ref;

%% HP Envy Laptop DC/DC Converter
% Input file
fname = 'efficiency-curves/hp-envy-dc.csv';

% Configuration:
%   Column  3 = DC input voltage
%   Column 11 = DC input current
%   Column 19 = DC input power
%   Column 33 = DC output voltage
%   Column 41 = DC output current
%   Column 49 = DC output power
data = csvread(fname,26,0);

% Extract power data and convert to per-unit
Pin = data(:,19) ./ bases.Pdc; Pout = data(:,49) ./ bases.Pdc;

% Compute loss
Ploss = Pin - Pout;

% Fit loss model (linear; no quadratic term)
lm = lscov([ones(size(Pout)), Pout],Ploss);

% Create model
hpEnvyDC = struct('alpha', lm(1), 'beta', lm(2), 'gamma', 0);

% Reference power
hpEnvyDC.Pref = mean(Pout);

% Optional plots
% plot(Pout, Ploss, '.k');
% Ploss_model = lm(1) + lm(2).*Pout;
% plot(Ploss, Ploss_model, '.', [0.001,0.002], [0.001,0.002], '-r');

%% HP Elitebook Laptop DC/DC Converter
% Input file
fname = 'efficiency-curves/hp-elitebook-dc.csv';

% Configuration:
%   Column  3 = DC input voltage
%   Column 11 = DC input current
%   Column 19 = DC input power
%   Column 33 = DC output voltage
%   Column 41 = DC output current
%   Column 49 = DC output power
data = csvread(fname,26,0);

% Extract power data and convert to per-unit
Pin = data(:,19) ./ bases.Pdc; Pout = data(:,49) ./ bases.Pdc;

% Compute loss
Ploss = Pin - Pout;

% Fit loss model (linear; no quadratic term)
lm = lscov([ones(size(Pout)), Pout],Ploss);

% Create model
hpElitebookDC = struct('alpha', lm(1), 'beta', lm(2), 'gamma', 0);

% Reference power
hpElitebookDC.Pref = mean(Pout);

% Optional plots
% plot(Pout, Ploss, '.k');
% Ploss_model = lm(1) + lm(2).*Pout;
% plot(Ploss, Ploss_model, '.', [0.8,1.1].*1e-3, [0.8,1.1].*1e-3, '-r');

%% HP Pavilion Laptop DC/DC Converter
% Input file
fname = 'efficiency-curves/hp-pavilion-dc.csv';

% Configuration:
%   Column  3 = DC input voltage
%   Column 11 = DC input current
%   Column 19 = DC input power
%   Column 33 = DC output voltage
%   Column 41 = DC output current
%   Column 49 = DC output power
data = csvread(fname,26,0);

% Extract power data and convert to per-unit
Pin = data(:,19) ./ bases.Pdc; Pout = data(:,49) ./ bases.Pdc;

% Compute loss
Ploss = Pin - Pout;

% Fit loss model (quadratic)
lm = lscov([ones(size(Pout)), Pout, Pout.^2],Ploss);

% Create model
hpPavilionDC = struct('alpha', lm(1), 'beta', lm(2), 'gamma', lm(3));

% Reference power
hpPavilionDC.Pref = mean(Pout);

% Optional plots
% plot(Pout, Ploss, '.k');
% Ploss_model = lm(1) + lm(2).*Pout + lm(3).*(Pout.^2);
% plot(Ploss, Ploss_model, '.', [1,5].*1e-3, [1,5].*1e-3, '-r');

%% DC LED Driver #1
% Input file
fname = 'efficiency-curves/led-driver-1-dc.csv';

% Configuration:
%   Column  3 = DC input voltage
%   Column 11 = DC input current
%   Column 19 = DC input power
%   Column 33 = DC output voltage
%   Column 41 = DC output current
%   Column 49 = DC output power
data = csvread(fname,26,0);

% Extract power data and convert to per-unit
Pin = data(:,19) ./ bases.Pdc;
Pout = data(:,49) ./ bases.Pdc;

% Compute loss
Ploss = Pin - Pout;

% Fit loss model (constant efficiency)
lm = lscov(Pout, Ploss);

% Create model
ledDriverDC = struct('alpha', 0, 'beta', lm(1), 'gamma', 0);

% Reference power
ledDriverDC.Pref = mean(Pout);

% Optional plots
% plot(Pout, Ploss, '.k');
% Ploss_model = lm(1).*Pout;
% plot(Ploss, Ploss_model, '.', [1.9,2.1].*1e-3, [1.9,2.1].*1e-3, '-r');

%% Save Models
% Save to MAT files for later retrieval

% Waveform reference
agilent         = agilent_wave;         %#ok<NASGU> <-- Saved just below
hpEnvyAC        = hpEnvyAC_wave;        %#ok<NASGU>
hpElitebookAC   = hpElitebookAC_wave;   %#ok<NASGU>
hpPavilionAC    = hpPavilionAC_wave;    %#ok<NASGU>
ledDriver1AC    = ledDriver1AC_wave;    %#ok<NASGU>
ledDriver2AC    = ledDriver2AC_wave;    %#ok<NASGU>
ledDriver3AC    = ledDriver3AC_wave;    %#ok<NASGU>

save('Models_WaveRef.mat', ...
    'bases', ...
    'transformer', ...
    'agilent', ...
    'hpEnvyAC', 'hpElitebookAC', 'hpPavilionAC', ...
    'ledDriver1AC', 'ledDriver2AC', 'ledDriver3AC', ...
    'hpEnvyDC', 'hpElitebookDC', 'hpPavilionDC', ...
    'ledDriverDC' ...
    );

% Polynomial model
agilent         = agilent_poly;
hpEnvyAC        = hpEnvyAC_poly;
hpElitebookAC   = hpElitebookAC_poly;
hpPavilionAC    = hpPavilionAC_poly;
ledDriver1AC    = ledDriver1AC_poly;
ledDriver2AC    = ledDriver2AC_poly;
ledDriver3AC    = ledDriver3AC_poly;

save('Models_Poly.mat', ...
    'bases', ...
    'transformer', ...
    'agilent', ...
    'hpEnvyAC', 'hpElitebookAC', 'hpPavilionAC', ...
    'ledDriver1AC', 'ledDriver2AC', 'ledDriver3AC', ...
    'hpEnvyDC', 'hpElitebookDC', 'hpPavilionDC', ...
    'ledDriverDC' ...
    );
