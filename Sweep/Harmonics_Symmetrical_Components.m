%% Harmonics and Symmetrical Components
% This file verifies the theory of applying symmetrical components to
% harmonic currents. Make sure the working directory points to this
% file's location before running.

% Theory: Shifting the same waveform to phase a, b, or c...
% 
%   v_a(t) = SUM_h V_h * cos(h*omega*t + theta_h)
%   v_b(t) = SUM_h V_h * cos(h*omega*(t-Delta*t) + theta_h)
%   v_c(t) = SUM_h V_h * cos(h*omega*(t+Delta*t) + theta_h)
% 
% where:
% 
%   Delta*t = 1/3 of the fundamental period, or h*delta with delta = 120°
%
% Note that cos() here could be sin(); works the same way
% 
% If you already have a harmonic spectrum referenced to the correct phase,
% You can perform the symmetrical components transformation directly.
% However, if your harmonic spectrum doesn't use the same zero reference,
% you have to shift each phasor by ±h*delta (to get to phase c or b,
% respectively) before applying the transformation.

%% Setup
% Constant 'a' = 1 /_ 120°
a = exp(1j*deg2rad(120));

% Ref: Glover, Sarma, & Overbye, 4th ed., p. 400

% Transformation matrices:
%   I_abc = A I_seq
%   I_seq = A^-1 I_abc
A = [1 1 1; 1 a^2 a; 1 a a^2];
Ainv = inv(A);

% Fundamental frequency
f = 60;         % Hz
omega = 2*pi*f; % rad/sec

% Fundamental period
T = 1 / f;

% Sampling frequency
Fs = 6000; % 6.0 kHz

% Sampling interval
dt = 1/Fs;

% Time vector
t = (0:dt:(T-dt));

% Number of samples
Ns = length(t);

% Harmonics
h = [1; 3; 5; 7; 9; 11];

%% Example 1: Simple FFT
% Simple triangle wave (typical for a single-phase rectifier)
x = [ ...
    zeros(1, Ns/4) ...
    linspace(1,0,floor(Ns/8)) ...
    zeros(1, ceil(Ns/8)) ...
    zeros(1, Ns/4) ...
    linspace(-1,0,floor(Ns/8)) ...
    zeros(1, ceil(Ns/8)) ...  
];

% Harmonic spectrum using specified harmonics
[~, hsp, Isp] = time2freq(x, dt);
Ih = Isp(ismember(hsp,h));

% Convert back to time-domain waveform
Isp2 = zeros(size(Isp));
Isp2(ismember(hsp,h)) = Ih;
[x2, ~] = freq2time(f, Isp2, dt);

% Plot to check
figure(1)
plot(t, x, '-k', t, x2, ':b');
xlabel('Time (s)');
ylabel('Current (A)');
title('Synthesized waveform');

% For future work, transpose Ih
Ih = Ih.';

%% Example 2: Balanced Three-Phase Rectifiers
% Synthesize phase A, B, C current spectra
Ia = Ih;                                % Same as reference
Ib = Ih .* (exp(1j*deg2rad(-120)).^h);  % Rotate by -120° (CW = lag)
Ic = Ih .* (exp(1j*deg2rad(+120)).^h);  % Rotate by +120° (CCW = lead)

% Time-domain waveforms
Ia_sp = zeros(size(Isp));
Ia_sp(ismember(hsp,h)) = Ia;
[ia, ~] = freq2time(f, Ia_sp, dt);

Ib_sp = zeros(size(Isp));
Ib_sp(ismember(hsp,h)) = Ib;
[ib, ~] = freq2time(f, Ib_sp, dt);

Ic_sp = zeros(size(Isp));
Ic_sp(ismember(hsp,h)) = Ic;
[ic, ~] = freq2time(f, Ic_sp, dt);

% Plot waveforms to check: current, voltage
figure(2)
plot( ...
    t, ia, ':k', t, sin(omega*t), '-k', ...                   % Phase A
    t, ib, ':r', t, sin(omega*t - deg2rad(120)), '-r', ...    % Phase B
    t, ic, ':b', t, sin(omega*t + deg2rad(120)), '-b');       % Phase C
xlabel('Time (s)');
ylabel('Current (A)');
title('Phase-Shifted Waveforms');
leg1 = legend('I_A','V_A','I_B','V_B','I_C','V_C');
set(leg1, 'Location', 'Best');

% Matrix of phase currents (row) vs. harmonic index (col)
Iabc = [Ia.'; Ib.'; Ic.'];

% Apply sequence transformation
Iseq = A \ Iabc; % Equivalent to A^-1 * Iabc

% Apply phase transformation
Iabc2 = A * Iseq;
Ia2 = Iabc2(1,:).';
Ib2 = Iabc2(2,:).';
Ic2 = Iabc2(3,:).';

% Plot spectra to check
figure(3)
subplot(2,1,1);
plot(h, abs(Ia), '-ok', h, abs(Ib), '-or', h, abs(Ic), '-ob', ...
    h, abs(Ia2), '--dk', h, abs(Ib2), '--dr', h, abs(Ic2), '--db');
xlabel('Harmonic index'); ylabel('Magnitude');
subplot(2,1,2);
plot(h, angle(Ia), '-ok', h, angle(Ib), '-or', h, angle(Ic), '-ob', ...
    h, angle(Ia2), '--dk', h, angle(Ib2), '--dr', h, angle(Ic2), '--db');
xlabel('Harmonic index'); ylabel('Angle');

%% Example 3: Unbalanced Three-Phase Rectifiers
% Synthesize phase A, B, C current spectra
Ia = Ih;
Ib = zeros(size(Ih));
Ic = zeros(size(Ih));

% Time-domain waveforms
Ia_sp = zeros(size(Isp));
Ia_sp(ismember(hsp,h)) = Ia;
[ia, ~] = freq2time(f, Ia_sp, dt);

Ib_sp = zeros(size(Isp));
Ib_sp(ismember(hsp,h)) = Ib;
[ib, ~] = freq2time(f, Ib_sp, dt);

Ic_sp = zeros(size(Isp));
Ic_sp(ismember(hsp,h)) = Ic;
[ic, ~] = freq2time(f, Ic_sp, dt);

% Plot waveforms to check: current, voltage
figure(2)
plot( ...
    t, ia, ':k', t, sin(omega*t), '-k', ...                   % Phase A
    t, ib, ':r', t, sin(omega*t - deg2rad(120)), '-r', ...    % Phase B
    t, ic, ':b', t, sin(omega*t + deg2rad(120)), '-b');       % Phase C
xlabel('Time (s)');
ylabel('Current (A)');
title('Phase-Shifted Waveforms');
leg1 = legend('I_A','V_A','I_B','V_B','I_C','V_C');
set(leg1, 'Location', 'Best');

% Matrix of phase currents (row) vs. harmonic index (col)
Iabc = [Ia.'; Ib.'; Ic.'];

% Apply sequence transformation
Iseq = A \ Iabc; % Equivalent to A^-1 * Iabc

% Apply phase transformation
Iabc2 = A * Iseq;
Ia2 = Iabc2(1,:).';
Ib2 = Iabc2(2,:).';
Ic2 = Iabc2(3,:).';

% Plot spectra to check
figure(3)
subplot(2,1,1);
plot(h, abs(Ia), '-ok', h, abs(Ib), '-or', h, abs(Ic), '-ob', ...
    h, abs(Ia2), '--dk', h, abs(Ib2), '--dr', h, abs(Ic2), '--db');
xlabel('Harmonic index'); ylabel('Magnitude');
subplot(2,1,2);
plot(h, angle(Ia), '-ok', h, angle(Ib), '-or', h, angle(Ic), '-ob', ...
    h, angle(Ia2), '--dk', h, angle(Ib2), '--dr', h, angle(Ic2), '--db');
xlabel('Harmonic index'); ylabel('Angle');

% Note: Phase angles may look off due to machine precision

%% Example 4: Unbalanced Three-Phase Rectifier Through D-Y Transformer
% Synthesize phase A, B, C current spectra
Ia = Ih;
Ib = zeros(size(Ih));
Ic = zeros(size(Ih));

% Matrix of phase currents (row) vs. harmonic index (col)
Iabc = [Ia.'; Ib.'; Ic.'];

% Apply sequence transformation
Iseq = A \ Iabc; % Equivalent to A^-1 * Iabc

% Assume: load is on low side of transformer; reflect to high side

% Apply effects of D-Y transformer
%   - Zero sequence:     Blocked
%   - Positive sequence: Delta leads Wye by 30°
%   - Negative sequence: Delta lags Wye by 30°
ISEQ = Iseq;
ISEQ(1,:) = 0;
ISEQ(2,:) = Iseq(2,:) * exp(+1j*deg2rad(30));   % Rotate CCW = lead
ISEQ(3,:) = Iseq(3,:) * exp(-1j*deg2rad(30));   % Rotate CW = lag

% Ref: Glover, Sarma, & Overbye, 4th ed., pp. 101, 424

% Apply phase transformation
Iabc2 = A * ISEQ;
Ia2 = Iabc2(1,:).';
Ib2 = Iabc2(2,:).';
Ic2 = Iabc2(3,:).';

% Time-domain waveforms
Ia_sp = zeros(size(Isp));
Ia_sp(ismember(hsp,h)) = Ia;
[ia, ~] = freq2time(f, Ia_sp, dt);

Ia2_sp = zeros(size(Isp));
Ia2_sp(ismember(hsp,h)) = Ia2;
[ia2, ~] = freq2time(f, Ia2_sp, dt);

Ib2_sp = zeros(size(Isp));
Ib2_sp(ismember(hsp,h)) = Ib2;
[ib2, ~] = freq2time(f, Ib2_sp, dt);

Ic2_sp = zeros(size(Isp));
Ic2_sp(ismember(hsp,h)) = Ic2;
[ic2, ~] = freq2time(f, Ic2_sp, dt);

% Plot waveforms to check: current, voltage
figure(2)
plot( ...
    t, ia, ':k', ...    % Rectifier
    t, ia2, '-k', ...   % Phase A
    t, ib2, '-r', ...   % Phase B
    t, ic2, '-b');      % Phase C
xlabel('Time (s)');
ylabel('Current (A)');
title('Phase-Shifted Waveforms');
leg1 = legend('Rectifier','Phase A','Phase B','Phase C');
set(leg1, 'Location', 'Best');

%% Example 5: Load from CSU AC Test, Configuration 2
% After running this one, you have to re-run the starting section if you
% want to go back to examples 1-4!

% Read measured data
fname = 'waveforms/AC-config-2-batt-charged-waveforms.csv';

% Time domain data: t, V1 ... V4, I1 ... I4, P1 ... P4
data = csvread(fname,1,0);

% Extract time-domain waveforms
t = data(:,1);
vA = data(:,2); vB = data(:,3); vC = data(:,4); va = data(:,5);
iA = data(:,6); iB = data(:,7); iC = data(:,8); ia = data(:,9);

% Time step
dt = t(2) - t(1);

% Plot voltages and currents
figure(4)
subplot(2,1,1)
plot( ...
    t, vA, '-k', ...    % Phase A
    t, vB, '-r', ...	% Phase B
    t, vC, '-b', ...	% Phase C
    t, va, '-g');       % Phase a
xlabel('Time (s)');
ylabel('Voltage (V)');
subplot(2,1,2)
plot( ...
    t, iA, '-k', ...	% Phase A
    t, iB, '-r', ...	% Phase B
    t, iC, '-b', ...	% Phase C
    t, ia, '-g');       % Phase a
xlabel('Time (s)');
ylabel('Current (A)');
title('AC Configuration 2 Waveforms');
legend('A','B','C','a');

% Note: Some of the transformer current may be due to magnetizing current.

% Voltage spectra using specified harmonics
[~, hsp, Vtemp] = time2freq(vA, dt);
VA = Vtemp(ismember(hsp,h));

[~, hsp, Vtemp] = time2freq(vB, dt);
VB = Vtemp(ismember(hsp,h));

[~, hsp, Vtemp] = time2freq(vC, dt);
VC = Vtemp(ismember(hsp,h));

[~, hsp, Vtemp] = time2freq(va, dt);
Va = Vtemp(ismember(hsp,h));

% Current spectra using specified harmonics
[~, hsp, Itemp] = time2freq(iA, dt);
IA = Itemp(ismember(hsp,h));

[~, hsp, Itemp] = time2freq(iB, dt);
IB = Itemp(ismember(hsp,h));

[~, hsp, Itemp] = time2freq(iC, dt);
IC = Itemp(ismember(hsp,h));

[~, hsp, Itemp] = time2freq(ia, dt);
Ia = Itemp(ismember(hsp,h));

Ib = zeros(size(Ia));
Ic = zeros(size(Ia));

% Matrix of phase currents (row) vs. harmonic index (col)
Iabc = [Ia.'; Ib.'; Ic.'];

% Apply sequence transformation
Iseq = A \ Iabc; % Equivalent to A^-1 * Iabc

% Apply effects of D-Y transformer (see previous section)
ISEQ = Iseq;
ISEQ(1,:) = 0;
ISEQ(2,:) = Iseq(2,:) * exp(+1j*deg2rad(30));   % Rotate CCW = lead
ISEQ(3,:) = Iseq(3,:) * exp(-1j*deg2rad(30));   % Rotate CW  = lag

% Turns ratio
ISEQ = ISEQ .* (208/480);

% Apply phase transformation
IABC2 = A * ISEQ;
IA2 = IABC2(1,:).';
IB2 = IABC2(2,:).';
IC2 = IABC2(3,:).';

% Transformer magnetizing current (estimated from open circuit test #1)
Imag = conj((89.13 + 1j*387.2) / 488.0 / sqrt(3));

% Add magnetizing current estimate to high-side current
IA2(1) = IA2(1) + Imag;
IB2(1) = IB2(1) + Imag*exp(-1j*deg2rad(120)); % Rotate CW  = Lag
IC2(1) = IC2(1) + Imag*exp(+1j*deg2rad(120)); % Rotate CCW = Lead

% Compare high-side current spectra
figure(5)
title('Comparison of measured and modeled high-side currents.');
subplot(2,1,1);
plot(h, abs(IA), '-ok', h, abs(IB), '-or', h, abs(IC), '-ob', ...
    h, abs(IA2), '--dk', h, abs(IB2), '--dr', h, abs(IC2), '--db');
xlabel('Harmonic index'); ylabel('Magnitude');
legend('A','B','C','A (model)','B (model)','C (model)');
subplot(2,1,2);
plot(h, angle(IA), '-ok', h, angle(IB), '-or', h, angle(IC), '-ob', ...
    h, angle(IA2), '--dk', h, angle(IB2), '--dr', h, angle(IC2), '--db');
xlabel('Harmonic index'); ylabel('Angle');

% Time-domain waveforms
IA2_sp = zeros(size(Isp));
IA2_sp(ismember(hsp,h)) = IA2;
[iA2, ~] = freq2time(f, IA2_sp, dt);

IB2_sp = zeros(size(Isp));
IB2_sp(ismember(hsp,h)) = IB2;
[iB2, ~] = freq2time(f, IB2_sp, dt);

IC2_sp = zeros(size(Isp));
IC2_sp(ismember(hsp,h)) = IC2;
[iC2, ~] = freq2time(f, IC2_sp, dt);

% Compare waveforms
figure(6)
plot( ...
    t, iA, '-k', t, iA2, '--k', ...	% Phase A
    t, iB, '-r', t, iB2, '--r', ...	% Phase B
    t, iC, '-b', t, iC2, '--b');	% Phase C
xlabel('Time (s)');
ylabel('Current (A)');
title('AC Configuration 2 Waveforms: Measured vs. Modeled');
leg1 = legend( ...
    'A', 'A (model)', ...
    'B', 'B (model)', ...
    'C', 'C (model)');
set(leg1, 'Location', 'NorthWest');

%% Example 6: Modeled Load for CSU AC Test, Configuration 2
% After running this one, you have to re-run the starting section if you
% want to go back to examples 1-4!

% Read measured data
fname = 'waveforms/AC-config-2-batt-charged-waveforms.csv';

% Time domain data: t, V1 ... V4, I1 ... I4, P1 ... P4
data = csvread(fname,1,0);

% Extract time-domain waveforms
t = data(:,1);
vA = data(:,2); vB = data(:,3); vC = data(:,4); va = data(:,5);
iA = data(:,6); iB = data(:,7); iC = data(:,8); ia = data(:,9);

% Load the rectifier models
load('Models.mat');

% Apply measured low-side voltage
[~, hsp, Vtemp] = time2freq(va, dt);
Va = Vtemp(ismember(hsp,h));
Va_pu = Va / sqrt(2) / bases.VLN_Low;

% Calculate injection currents using reference load powers
I_load1 = rectifier1P(hpEnvyAC, h, Va_pu, ...
    hpEnvyAC.Pref) * bases.I_Low;
I_load2 = rectifier1P(hpElitebookAC, h, Va_pu, ...
    hpElitebookAC.Pref) * bases.I_Low;
I_load3 = rectifier1P(hpPavilionAC, h, Va_pu, ...
    hpPavilionAC.Pref) * bases.I_Low;
I_load4 = rectifier1P(ledDriverAC, h, Va_pu, ...
    ledDriverAC.Pref) * bases.I_Low;
I_load5 = I_load4;
I_load6 = I_load4;

% Calculate phase currents
Ia2 = I_load1 + I_load2 + I_load3 + I_load4 + I_load5 + I_load6;
Ib2 = zeros(size(Ia2));
Ic2 = zeros(size(Ia2));

% Matrix of phase currents (row) vs. harmonic index (col)
Iabc = [Ia2.'; Ib2.'; Ic2.'];

% Apply sequence transformation
Iseq = A \ Iabc; % Equivalent to A^-1 * Iabc

% Apply effects of D-Y transformer (see previous section)
ISEQ = Iseq;
ISEQ(1,:) = 0;
ISEQ(2,:) = Iseq(2,:) * exp(+1j*deg2rad(30));   % Rotate CCW = lead
ISEQ(3,:) = Iseq(3,:) * exp(-1j*deg2rad(30));   % Rotate CW  = lag

% Turns ratio
ISEQ = ISEQ .* (208/480);

% Apply phase transformation
IABC2 = A * ISEQ;
IA2 = IABC2(1,:).';
IB2 = IABC2(2,:).';
IC2 = IABC2(3,:).';

% Transformer magnetizing current (estimated from open circuit test #1)
Imag = conj((89.13 + 1j*387.2) / 488.0 / sqrt(3));

% Add magnetizing current estimate to high-side current
IA2(1) = IA2(1) + Imag;
IB2(1) = IB2(1) + Imag*exp(-1j*deg2rad(120)); % Rotate CW  = Lag
IC2(1) = IC2(1) + Imag*exp(+1j*deg2rad(120)); % Rotate CCW = Lead

% Time-domain waveforms
IA2_sp = zeros(size(Isp)); % Isp referenced from Example 5
IA2_sp(ismember(hsp,h)) = IA2;
[iA2, ~] = freq2time(f, IA2_sp, dt);

IB2_sp = zeros(size(Isp));
IB2_sp(ismember(hsp,h)) = IB2;
[iB2, ~] = freq2time(f, IB2_sp, dt);

IC2_sp = zeros(size(Isp));
IC2_sp(ismember(hsp,h)) = IC2;
[iC2, ~] = freq2time(f, IC2_sp, dt);

Ia2_sp = zeros(size(Isp)); % Isp referenced from Example 5
Ia2_sp(ismember(hsp,h)) = Ia2;
[ia2, ~] = freq2time(f, Ia2_sp, dt);

% Scaling
iA2 = iA2 * sqrt(2);
iB2 = iB2 * sqrt(2);
iC2 = iC2 * sqrt(2);
ia2 = ia2 * sqrt(2);

% Plot result
figure(7)

subplot(4,1,1)
plot( ...
    t, ia, '-g', ...	% Measured
    t, ia2, ':g');     % Modeled
title('Phase a Current')
xlabel('Time (s)');
ylabel('Current (A)');
legend('Measured','Modeled');

subplot(4,1,2)
plot( ...
    t, iA, '-k', ...	% Measured
    t, iA2, ':k');     % Modeled
title('Phase A Current')
xlabel('Time (s)');
ylabel('Current (A)');
legend('Measured','Modeled');

subplot(4,1,3)
plot( ...
    t, iB, '-r', ...	% Measured
    t, iB2, ':r');     % Modeled
title('Phase B Current')
xlabel('Time (s)');
ylabel('Current (A)');
legend('Measured','Modeled');

subplot(4,1,4)
plot( ...
    t, iC, '-b', ...	% Measured
    t, iC2, ':b');     % Modeled
title('Phase C Current')
xlabel('Time (s)');
ylabel('Current (A)');
legend('Measured','Modeled');
