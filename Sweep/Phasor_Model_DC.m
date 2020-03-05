%% Phasor Model - DC Configuration
% Phasor-based model of CSU validation test DC Configuration, solved
% using forward-backward sweep algorithm (see Steve's scanned notes).
%
% Leverages the following per-unit sequence network models:
%
% Pos. Sequence
% -------------
%
%  (1)              (2)   (3)            (4)
%   /------------Zp-----Zs---(e^j+30:1)---\
%   |                |                    |
%   V+              Zsh                  Iinj
%   |                |                    |
%   \-------------------------------------/
% 
% Neg. Sequence
% -------------
% 
%  (1)              (2)   (3)            (4)
%   /------------Zp-----Zs---(e^j-30:1)---\
%   |                |                    |
%   V-              Zsh                  Iinj
%   |                |                    |
%   \-------------------------------------/
% 
% Zero Sequence
% -------------
%
%  (1)              (2)    (3)         (4)
%   /---O  O-----Zp-----Zs-----3*Zn-----\
%   |         |      |                  |
%   V0        |     Zsh                Iinj
%   |         |      |                  |
%   \-----------------------------------/
%
% NOTE: Zn = 0 for this model.

%% Setup
% Harmonics
h = [1; 3; 5; 7; 9; 11; 13; 15; 17; 19];

% Constant 'a' = 1 /_ 120°
a = exp(1j*deg2rad(120));

% Ref: Glover, Sarma, & Overbye, 4th ed., p. 400

% Transformation matrices:
%   I_abc = A I_seq
%   I_seq = A^-1 I_abc
A = [1 1 1; 1 a^2 a; 1 a a^2];
Ainv = inv(A);

% Load models
load Models_WaveRef.mat;    % Reference waveform harmonic current models
%load Models_Poly.mat;       % Avpreet's harmonic current models

% Data directory (remember training slash!)
data_dir = 'scenario-data/DC_v3/';

% Skip final reporting? (Useful for timing algorithm.)
skip_reports = true;

%% Initialization
% Read test data:
data = importdata([data_dir 'combined-data-dc.csv']);

% High-side phase voltage magnitudes (V)
VA = data.data(:,strcmp('V_A', data.colheaders));
VB = data.data(:,strcmp('V_B', data.colheaders));
VC = data.data(:,strcmp('V_C', data.colheaders));

% Convert to per-unit phasors (at appropriate angles)
VA = (VA ./ bases.VLN_High) .* exp(1j*deg2rad(0));
VB = (VB ./ bases.VLN_High) .* exp(1j*deg2rad(-120));
VC = (VC ./ bases.VLN_High) .* exp(1j*deg2rad(+120));

% Apply additional 30 deg correction to account to match power quality
% analyzer trigger (which is on V_LL)
VA = VA .* exp(1j*deg2rad(-30));
VB = VB .* exp(1j*deg2rad(-30));
VC = VC .* exp(1j*deg2rad(-30));

% DC bus voltage: near constant, so assume constant (to fill gaps)
Vdc = data.data(:,strcmp('V_dc', data.colheaders));
Vdc = ones(size(VA)) .* mean(Vdc(~isnan(Vdc))) ./ bases.Vdc;

% Total input power (W)
PA = data.data(:,strcmp('P_A', data.colheaders));
PB = data.data(:,strcmp('P_B', data.colheaders));
PC = data.data(:,strcmp('P_C', data.colheaders));
Pmeas_in = data.data(:,strcmp('P_in', data.colheaders));

% Phase a power at transformer low side
Pa = data.data(:,strcmp('P_a', data.colheaders));

% DC bus power
Pmeas_dc = data.data(:,strcmp('P_dc', data.colheaders));

% Individual load DC output power (W)
P_hpEnvy      = data.data(:,strcmp('P_Envy',      data.colheaders));
P_hpElitebook = data.data(:,strcmp('P_Elitebook', data.colheaders));
P_hpPavilion  = data.data(:,strcmp('P_Pavilion',  data.colheaders));
P_led1        = data.data(:,strcmp('P_LED1',      data.colheaders));
P_led2        = data.data(:,strcmp('P_LED2',      data.colheaders));
P_led3        = data.data(:,strcmp('P_LED3',      data.colheaders));

% Convert to per-unit
P_hpEnvy      = P_hpEnvy      / bases.S1p;
P_hpElitebook = P_hpElitebook / bases.S1p;
P_hpPavilion  = P_hpPavilion  / bases.S1p;
P_led1        = P_led1        / bases.S1p;
P_led2        = P_led2        / bases.S1p;
P_led3        = P_led3        / bases.S1p;

% Total output power (W)
Pmeas_out = data.data(:,strcmp('P_out', data.colheaders));

% Total output power (W)
Pmeas_loss = data.data(:,strcmp('P_loss', data.colheaders));

% Free up memory
clear data

%% Step 1: Initialize Model
% Sample (time) index vector
idx = 1:length(VA);

% Allocate phase and sequence voltage arrays:
% node, phase/sequence, harmonic index, sample
Vabc = zeros(4, 3, length(h), length(idx));
Vseq = zeros(size(Vabc));

% Allocate phase and sequence current arrays:
% sample, branch, phase/sequence, harmonic
Iabc = zeros(3, 3, length(h), length(idx));
Iseq = zeros(size(Iabc));

% Branches... (1,2), (2,3), (3,4)

% Initialize voltage arrays
% (There may be a better way to do this with vectors, but the loop works.)
for i = idx
    % Phase
    Vabc_i = [VA(i), VB(i), VC(i)];
    Vabc(1, :, h==1, i) = Vabc_i;
    
    % Sequence
    Vseq_i = A \ transpose(Vabc_i);
    Vseq(1, :, h==1, i) = Vseq_i;
end

% Convenience vector for specifying/filtering phase and sequence
phase = ['a'; 'b'; 'c'];
seq = ['0'; '+'; '-'];

% Transformer model
[Zp, Zs, Zsh] = transformerDY(transformer, h);

% Zero sequence equivalent impedance seen from node 3
Z0eq = Zs + 1 ./ (1./Zp + 1./Zsh);

% Precompute Agilent DC output power
Idc = ...
    dcConverter(hpEnvyDC, Vdc, P_hpEnvy) + ...
    dcConverter(hpElitebookDC, Vdc, P_hpElitebook) + ...
    dcConverter(hpPavilionDC, Vdc, P_hpPavilion) + ...
    dcConverter(ledDriverDC, Vdc, P_led1) + ...
    dcConverter(ledDriverDC, Vdc, P_led2) + ...
    dcConverter(ledDriverDC, Vdc, P_led3);
Pdc = Vdc .* Idc;

% Model output
Pmodel_in   = reshape(zeros(size(idx)), [], 1);
Pmodel_out  = zeros(size(Pmodel_in));
Pmodel_loss = zeros(size(Pmodel_in));

%% Solve Model
% Convergence settings
tol = 0.01; % VA

% Convergence tracking
iterations = zeros(size(idx));
converged  = zeros(size(idx));

% Execute for each sample
for i = idx
    
    % Local convergence tracking
	lastS = 0; % VA

    % Execute solution steps
    for k = 1:10
        %% Setup: Sample Working Matrices
        % Voltage
        Vabc_i = squeeze(Vabc(:, :, :, i));
        Vseq_i = squeeze(Vseq(:, :, :, i));
        
        % Current
        Iabc_i = squeeze(Iabc(:, :, :, i));
        Iseq_i = squeeze(Iseq(:, :, :, i));
        
        %% Step 2: Compute Node Voltages
        % Node 1 = Fixed to grid voltage
        
        % Node 2 (Note: Zero seq. node 2 voltage calculated from Node 3)
        Vseq_i(2, seq=='+', :) = Vseq_i(1, seq=='+', :) ...
            - Iseq_i(1, seq=='+', :) .* reshape(Zp, 1, 1, []);
        Vseq_i(2, seq=='-', :) = Vseq_i(1, seq=='-', :) ...
            - Iseq_i(1, seq=='-', :) .* reshape(Zp, 1, 1, []);
        Vseq_i(2, seq=='0', :) = Vseq_i(3, seq=='0', :) ...
            + Iseq_i(2, seq=='0', :) .* reshape(Zs, 1, 1, []);
        
        % Node 3
        Vseq_i(3, seq=='+', :) = Vseq_i(2, seq=='+', :) ...
            - Iseq_i(2, seq=='+', :) .* reshape(Zp, 1, 1, []);
        Vseq_i(3, seq=='-', :) = Vseq_i(2, seq=='-', :) ...
            - Iseq_i(2, seq=='-', :) .* reshape(Zp, 1, 1, []);
        Vseq_i(3, seq=='0', :) = 0 ...
            - Iseq_i(2, seq=='0', :) .* reshape(Z0eq, 1, 1, []);
        
        % Node 4
        Vseq_i(4, seq=='+', :) = Vseq_i(3, seq=='+', :) ./ exp(1j*deg2rad(+30)); 
        Vseq_i(4, seq=='-', :) = Vseq_i(3, seq=='-', :) ./ exp(1j*deg2rad(-30)); 
        Vseq_i(4, seq=='0', :) = Vseq_i(3, seq=='0', :); 
        
        %% Step 3: Compute Phase Voltages
        % Compute phase voltages throughout network
        
        % Nodes 2-4
        for n = 2:4
            Vabc_i(n,:,:) = A * reshape(Vseq_i(n,:,:), 3, []);
        end
        
        %% Step 4: Compute Injection Currents
        % Compute phase injection currents at node 4 using phase voltages
        
        % Phase voltages
        Va = reshape(Vabc_i(4,phase=='a',:), size(h));
        Vb = reshape(Vabc_i(4,phase=='b',:), size(h));
        Vc = reshape(Vabc_i(4,phase=='c',:), size(h));
        
        % Phase a: Agilent power supply (connected phase-to-neutral)
        Ia = rectifier1P(agilent, h, Va, Pdc(i));
        
        % Phase b: Nothing
        Ib = zeros(size(Ia));
        
        % Phase c: Nothing
        Ic = zeros(size(Ia));  
        
        % Store phase currents for branch (3,4)
        Iabc_i(3,:,:) = reshape(transpose([Ia, Ib, Ic]), 1, 3, []);
        
        %% Step 5: Compute Sequence Currents
        % Compute sequence currents throughout network
        
        % Branch (3,4) [at node 4]
        Iseq_i(3,:,:) = A \ reshape(Iabc_i(3,:,:), 3, []);
        
        % Branch (2,3)
        Iseq_i(2, seq=='+', :) = Iseq_i(3, seq=='+', :) ./ conj(exp(1j*deg2rad(+30))); 
        Iseq_i(2, seq=='-', :) = Iseq_i(3, seq=='-', :) ./ conj(exp(1j*deg2rad(-30))); 
        Iseq_i(2, seq=='0', :) = Iseq_i(3, seq=='0', :);
        
        % Branch (1,2)
        Iseq_i(1, seq=='+', :) = Iseq_i(2, seq=='+', :) + ...
            Vseq_i(2, seq=='+', :) ./ reshape(Zsh, 1, 1, []);
        Iseq_i(1, seq=='-', :) = Iseq_i(2, seq=='-', :) + ...
            Vseq_i(2, seq=='-', :) ./ reshape(Zsh, 1, 1, []);
        Iseq_i(1, seq=='0', :) = 0;
        
        %% Step 6: Compute Phase Currents
        % Compute phase currents throughout network
        
        % Nodes 1-3
        for n = 1:3
            Iabc_i(n,:,:) = A * reshape(Iseq_i(n,:,:), 3, []);
        end
        
        %% Step 7: Compute Input Power
        % Complex power from phase network
        Sabc_in = reshape(Vabc_i(1,:,:) .* conj(Iabc_i(1,:,:)), 3, []);
        
        % Convert to W
        Sabc_in = Sabc_in .* bases.S1p;
        
        % Sum across phases and harmonics
        S_in = sum(sum(Sabc_in, 1), 2);
        
        %% Step 8: Check Convergence
        % Record voltages and currents
        Vabc(:, :, :, i) = Vabc_i;
        Vseq(:, :, :, i) = Vseq_i;
        Iabc(:, :, :, i) = Iabc_i;
        Iseq(:, :, :, i) = Iseq_i;
        
        % Convergence required on both P and Q
        if (real(S_in - lastS) <= tol) && (imag(S_in - lastS) <= tol)
            % Converged; break loop
            break
        else
            % Update last S value
            lastS = S_in;
        end
    end
            
    % Record iterations and convergence
    converged(i) = ...
        (real(S_in - lastS) <= tol) && (imag(S_in - lastS) <= tol);
    iterations(i) = k;
    
    % Record results
    Pmodel_in(i)   = real(S_in);
    Pmodel_out(i)  = bases.S1p * ( ...
        P_hpEnvy(i) + P_hpElitebook(i) + P_hpPavilion(i) + ...
        P_led1(i) + P_led2(i) + P_led3(i) );
end

% Convergence check
if all(converged)
    all_converged = 'yes';
else
    all_converged = 'no';
end

%% Compare Results
% Skip reporting?
if (skip_reports), return; end

% Calculate results: overall
abs_err   = Pmodel_in - Pmeas_in;
rel_err   = abs_err ./ Pmeas_in;

% Calculate results: phase a
idx_a = ~isnan(Pa);
Pmeas_a = Pa(idx_a);
Pmodel_a = (Pdc(idx_a) ...
    + agilent.alpha ...
    + agilent.beta .* Pdc(idx_a) ...
    + agilent.gamma .* Pdc(idx_a).^2) .* bases.S1p;
abs_err_a = Pmodel_a - Pmeas_a;
rel_err_a = abs_err_a ./ Pmeas_a;

% Calculate results: DC bus
idx_dc = ~isnan(Pmeas_dc);
Pmeas_dc2 = Pmeas_dc(idx_dc);
Pmodel_dc  = Pdc(idx_dc) .* bases.Pdc;
abs_err_dc = Pmodel_dc - Pmeas_dc2;
rel_err_dc = abs_err_dc ./ Pmeas_dc2;

% Report results
disp(['All Converged:         ', all_converged]);

disp(' ');
disp('Average...');
disp(['Iterations:             ', num2str(mean(iterations))]);
disp(['Measured Input Power:   ', num2str(mean(Pmeas_in)),    ' W']);
disp(['Modeled Input Power:    ', num2str(mean(Pmodel_in)),   ' W']);
disp(['Absolute Error:         ', num2str(mean(abs_err)),     ' W']);
disp(['Relative Error:         ', num2str(100*mean(rel_err)), '%']);

% Line break
disp(' ');

% Report results
disp(['Measured Phase a Power: ', num2str(mean(Pmeas_a)),       ' W']);
disp(['Modeled Phase a Power:  ', num2str(mean(Pmodel_a)),      ' W']);
disp(['Absolute Error:         ', num2str(mean(abs_err_a)),     ' W']);
disp(['Relative Error:         ', num2str(100*mean(rel_err_a)), '%']);

% Line break
disp(' ');

% Report results
disp(['Measured DC Bus Power:  ', num2str(mean(Pmeas_dc2)),      ' W']);
disp(['Modeled DC Bus Power:   ', num2str(mean(Pmodel_dc)),      ' W']);
disp(['Absolute Error:         ', num2str(mean(abs_err_dc)),     ' W']);
disp(['Relative Error:         ', num2str(100*mean(rel_err_dc)), '%']);

% Line break
disp(' ');

% Output
disp('Average...');
disp(['Measured Output Power: ', num2str(mean(Pmeas_out)),   ' W']);
disp(['Modeled Output Power:  ', num2str(mean(Pmodel_out)),  ' W']);

% Line break
disp(' ');

%% Loss Calculations
% NEED TO FIX LOSS MISMATCH

% Structure for losses
losses = struct();
losses.transformer   = zeros(size(Pmodel_in));
losses.agilent       = zeros(size(Pmodel_in));
losses.hpEnvyDC      = zeros(size(Pmodel_in));
losses.hpElitebookDC = zeros(size(Pmodel_in));
losses.hpPavilionDC  = zeros(size(Pmodel_in));
losses.ledDriver1DC  = zeros(size(Pmodel_in));
losses.ledDriver2DC  = zeros(size(Pmodel_in));
losses.ledDriver3DC  = zeros(size(Pmodel_in));

% Execute for each sample
for i = idx
    % Transformer
    lossPrimary = sum( ...
        abs(reshape(Iseq(1,seq=='+',:,i),1,[])).^2 .* real(Zp) + ...
        abs(reshape(Iseq(1,seq=='-',:,i),1,[])).^2 .* real(Zp) ...
        ) .* bases.S3p;
    lossSecondary = sum( ...
        abs(reshape(Iseq(3,seq=='+',:,i),1,[])).^2 .* real(Zs) + ...
        abs(reshape(Iseq(3,seq=='-',:,i),1,[])).^2 .* real(Zs) + ...
        abs(reshape(Iseq(3,seq=='0',:,i),1,[])).^2 .* real(Z0eq) ...
        ) .* bases.S3p;
    lossCore = sum( ...
        abs(reshape(Vseq(2,seq=='+',:,i),1,[])).^2 .* real(1./Zsh) + ...
        abs(reshape(Vseq(2,seq=='-',:,i),1,[])).^2 .* real(1./Zsh) ...
        ) .* bases.S3p;
    losses.transformer(i) = lossPrimary + lossSecondary + lossCore;

    % Central Converter: Not applicable
    losses.agilent(i) = (agilent.alpha ...
        + agilent.beta * Pdc(i) ...
        + agilent.gamma * Pdc(i)^2) .* bases.S1p;

    % Load-packaged converters
    losses.hpEnvyDC(i) = (hpEnvyDC.alpha ...
        + hpEnvyDC.beta * P_hpEnvy(i) ...
        + hpEnvyDC.gamma * P_hpEnvy(i)^2) .* bases.S1p;
    losses.hpElitebookDC(i) = (hpElitebookDC.alpha ...
        + hpElitebookDC.beta * P_hpElitebook(i) ...
        + hpElitebookDC.gamma * P_hpElitebook(i)^2) .* bases.S1p;
    losses.hpPavilionDC(i) = (hpPavilionDC.alpha ...
        + hpPavilionDC.beta * P_hpPavilion(i) ...
        + hpPavilionDC.gamma * P_hpPavilion(i)^2) .* bases.S1p;
    losses.ledDriver1DC(i) = (ledDriverDC.alpha ...
        + ledDriverDC.beta * P_led1(i) ...
        + ledDriverDC.gamma * P_led1(i)^2) .* bases.S1p;
    losses.ledDriver2DC(i) = (ledDriverDC.alpha ...
        + ledDriverDC.beta * P_led2(i) ...
        + ledDriverDC.gamma * P_led2(i)^2) .* bases.S1p;
    losses.ledDriver3DC(i) = (ledDriverDC.alpha ...
        + ledDriverDC.beta * P_led3(i) ...
        + ledDriverDC.gamma * P_led3(i)^2) .* bases.S1p;

    % Total modeled loss
    Pmodel_loss(i) = losses.transformer(i) ...
        + losses.agilent(i) ...
        + losses.hpEnvyDC(i) ...
        + losses.hpElitebookDC(i) ...
        + losses.hpPavilionDC(i) ...
        + losses.ledDriver1DC(i) ...
        + losses.ledDriver2DC(i) ...
        + losses.ledDriver3DC(i);
end

% Calculate loss metrics
loss_mismatch = (Pmodel_in - Pmodel_out) - Pmodel_loss;
loss_abs_err = Pmodel_loss - Pmeas_loss;
loss_rel_err = loss_abs_err ./ Pmeas_loss;

% Report results
disp(' ');
disp('Average...');
disp(['Modeled Input Power:   ', num2str(mean(Pmodel_in)),            ' W']);
disp(['Modeled Output Power:  ', num2str(mean(Pmodel_out)),           ' W']);
disp(['Input - Output:        ', num2str(mean(Pmodel_in-Pmodel_out)), ' W']);
disp(['Modeled Loss:          ', num2str(mean(Pmodel_loss)),          ' W']);
disp(['Modeled Loss Mismatch: ', num2str(mean(loss_mismatch)),        ' W']);

disp(' ');
disp('Average...');
disp(['Measured Loss:         ', num2str(mean(Pmeas_loss)),           ' W']);
disp(['Modeled Loss:          ', num2str(mean(Pmodel_loss)),          ' W']);
disp(['Loss Absolute Error:   ', num2str(mean(loss_abs_err)),         ' W']);
disp(['Loss Relative Error:   ', num2str(100*mean(loss_rel_err)),     '%']);

disp(' ');
disp('Loss Breakout...');
disp(['Transformer:         ', num2str(mean(losses.transformer)),   ' W']);
disp(['Agilent:             ', num2str(mean(losses.agilent)),       ' W']);
disp(['HP Envy Laptop:      ', num2str(mean(losses.hpEnvyDC)),      ' W']);
disp(['HP Elitebook Laptop: ', num2str(mean(losses.hpElitebookDC)), ' W']);
disp(['HP Pavilion Laptop:  ', num2str(mean(losses.hpPavilionDC)),  ' W']);
disp(['LED Driver 1:        ', num2str(mean(losses.ledDriver1DC)),  ' W']);
disp(['LED Driver 2:        ', num2str(mean(losses.ledDriver2DC)),  ' W']);
disp(['LED Driver 3:        ', num2str(mean(losses.ledDriver3DC)),  ' W']);

disp(' ');
disp('Loss Percentages...');
disp(['Transformer:         ', num2str(100*mean(losses.transformer)/mean(Pmodel_loss)),   '%']);
disp(['Agilent:             ', num2str(100*mean(losses.agilent)/mean(Pmodel_loss)),       '%']);
disp(['HP Envy Laptop:      ', num2str(100*mean(losses.hpEnvyDC)/mean(Pmodel_loss)),      '%']);
disp(['HP Elitebook Laptop: ', num2str(100*mean(losses.hpElitebookDC)/mean(Pmodel_loss)), '%']);
disp(['HP Pavilion Laptop:  ', num2str(100*mean(losses.hpPavilionDC)/mean(Pmodel_loss)),  '%']);
disp(['LED Driver 1:        ', num2str(100*mean(losses.ledDriver1DC)/mean(Pmodel_loss)),  '%']);
disp(['LED Driver 2:        ', num2str(100*mean(losses.ledDriver2DC)/mean(Pmodel_loss)),  '%']);
disp(['LED Driver 3:        ', num2str(100*mean(losses.ledDriver3DC)/mean(Pmodel_loss)),  '%']);

% Line break
disp(' ');

%% Time Series Comparison Plots
% Plot input power, output power, and loss
figure(1)

subplot(3,1,1)
plot( ...
    idx, Pmeas_in, '-k', ...    % Measured
    idx, Pmodel_in, ':k');      % Modeled
title('Input Power')
xlabel('Sample Index');
ylabel('Power (W)');
legend('Measured','Modeled');

subplot(3,1,2)
plot( ...
    idx, Pmeas_out, '-b', ...   % Measured
    idx, Pmodel_out, ':b');     % Modeled
title('Output Power')
xlabel('Sample Index');
ylabel('Power (W)');
legend('Measured','Modeled');

subplot(3,1,3)
plot( ...
    idx, Pmeas_loss, '-r', ...  % Measured
    idx, Pmodel_loss, ':r');    % Modeled
title('System Loss')
xlabel('Sample Index');
ylabel('Power (W)');
legend('Measured','Modeled');

% Calculate modeled phase power at transformer low side
Sa = sum(squeeze(Vabc(4,phase=='a',:,:) .* conj(Iabc(3,phase=='a',:,:))), 1);
Sb = sum(squeeze(Vabc(4,phase=='b',:,:) .* conj(Iabc(3,phase=='b',:,:))), 1);
Sc = sum(squeeze(Vabc(4,phase=='c',:,:) .* conj(Iabc(3,phase=='c',:,:))), 1);

% Plot phase power at transformer low side
figure(2)

subplot(2,1,1)
plot( ...
    idx, Pa, '-k', ...                  % Measured
    idx, real(Sa) .* bases.S1p, ':k');  % Modeled
title('Phase a')
xlabel('Sample Index');
ylabel('Power (W)');
legend('Measured','Modeled');

subplot(2,1,2)
plot( ...
    idx, Pmeas_dc, '-k', ...            % Measured
    idx, Pdc .* bases.S1p, ':k');       % Modeled
title('DC Bus')
xlabel('Sample Index');
ylabel('Power (W)');
legend('Measured','Modeled');

%% Waveform Comparison Plots
% These are a snapshot using the cycle at time t=0 in the waveform plots
% and the final sample from the phasor data

% Set up for deriving time-domain waveforms
f = 60;             % Hz
T = 1 / f;          % sec
dt = T / 500;       % sec
h_spectrum = 0:20;  % For constructing FFT spectrum

% Time vector
t_model = 0:dt:(T-dt);

% Index to use for waveforms
i = max(idx);

% Compute modeled time-domain current waveforms
IA_model = zeros(size(h_spectrum));
IA_model(ismember(h_spectrum,h)) = Iabc(1,phase=='a',:,i);
[iA_model, ~] = freq2time(f, IA_model, dt);
iA_model = iA_model .* bases.I_High .* sqrt(2);

IB_model = zeros(size(h_spectrum));
IB_model(ismember(h_spectrum,h)) = Iabc(1,phase=='b',:,i);
[iB_model, ~] = freq2time(f, IB_model, dt);
iB_model = iB_model .* bases.I_High .* sqrt(2);

IC_model = zeros(size(h_spectrum));
IC_model(ismember(h_spectrum,h)) = Iabc(1,phase=='c',:,i);
[iC_model, ~] = freq2time(f, IC_model, dt);
iC_model = iC_model .* bases.I_High .* sqrt(2);

Ia_model = zeros(size(h_spectrum));
Ia_model(ismember(h_spectrum,h)) = Iabc(3,phase=='a',:,i);
[ia_model, ~] = freq2time(f, Ia_model, dt);
ia_model = ia_model .* bases.I_Low .* sqrt(2);

Ib_model = zeros(size(h_spectrum));
Ib_model(ismember(h_spectrum,h)) = Iabc(3,phase=='b',:,i);
[ib_model, ~] = freq2time(f, Ib_model, dt);
ib_model = ib_model .* bases.I_Low .* sqrt(2);

Ic_model = zeros(size(h_spectrum));
Ic_model(ismember(h_spectrum,h)) = Iabc(3,phase=='c',:,i);
[ic_model, ~] = freq2time(f, Ic_model, dt);
ic_model = ic_model .* bases.I_Low .* sqrt(2);

% Compute modeled time-domain voltage waveforms
VAB_model = zeros(size(h_spectrum));
VAB_model(ismember(h_spectrum,h)) = ...
    Vabc(1,phase=='a',:,i) - Vabc(1,phase=='b',:,i);
[vAB_model, ~] = freq2time(f, VAB_model, dt);
vAB_model = vAB_model .* bases.VLN_High .* sqrt(2);

VBC_model = zeros(size(h_spectrum));
VBC_model(ismember(h_spectrum,h)) = ...
    Vabc(1,phase=='b',:,i) - Vabc(1,phase=='c',:,i);
[vBC_model, ~] = freq2time(f, VBC_model, dt);
vBC_model = vBC_model .* bases.VLN_High .* sqrt(2);

VCA_model = zeros(size(h_spectrum));
VCA_model(ismember(h_spectrum,h)) = ...
    Vabc(1,phase=='c',:,i) - Vabc(1,phase=='a',:,i);
[vCA_model, ~] = freq2time(f, VCA_model, dt);
vCA_model = vCA_model .* bases.VLN_High .* sqrt(2);

Va_model = zeros(size(h_spectrum));
Va_model(ismember(h_spectrum,h)) = Vabc(4,phase=='a',:,i);
[va_model, ~] = freq2time(f, Va_model, dt);
va_model = va_model .* bases.VLN_Low .* sqrt(2);

Vb_model = zeros(size(h_spectrum));
Vb_model(ismember(h_spectrum,h)) = Vabc(4,phase=='b',:,i);
[vb_model, ~] = freq2time(f, Vb_model, dt);
vb_model = vb_model .* bases.VLN_Low .* sqrt(2);

Vc_model = zeros(size(h_spectrum));
Vc_model(ismember(h_spectrum,h)) = Vabc(4,phase=='c',:,i);
[vc_model, ~] = freq2time(f, Vc_model, dt);
vc_model = vc_model .* bases.VLN_Low .* sqrt(2);

% Read measured high-side currents (snapshot)
fname = [data_dir 'waveform-set-3.csv'];

% Time domain data: t, V1 ... V4, I1 ... I4, P1 ... P4
data = csvread(fname,1,0);

% Extract time-domain waveforms
t = data(:,1);
vAB = data(:,2); vBC = data(:,3); vCA = data(:,4);
iA  = data(:,6);  iB = data(:,7);  iC = data(:,8);

% Plot high-side voltages
figure(3)

subplot(3,1,1)
plot( ...
    t, vAB, '-k', ...           % Measured
    t_model, vAB_model, ':k');  % Modeled
title('Line AB Voltage')
xlabel('Time (s)');
ylabel('Voltage (V)');
legend('Measured','Modeled');

subplot(3,1,2)
plot( ...
    t, vBC, '-r', ...           % Measured
    t_model, vBC_model, ':r');  % Modeled
title('Line BC Voltage')
xlabel('Time (s)');
ylabel('Voltage (V)');
legend('Measured','Modeled');

subplot(3,1,3)
plot( ...
    t, vCA, '-b', ...           % Measured
    t_model, vCA_model, ':b');  % Modeled
title('Line CA Voltage')
xlabel('Time (s)');
ylabel('Voltage (V)');
legend('Measured','Modeled');

% Plot high-side currents
figure(4)

subplot(3,1,1)
plot( ...
    t, iA, '-k', ...            % Measured
    t_model, iA_model, ':k');   % Modeled
title('Phase A Current')
xlabel('Time (s)');
ylabel('Current (A)');
legend('Measured','Modeled');

subplot(3,1,2)
plot( ...
    t, iB, '-r', ...            % Measured
    t_model, iB_model, ':r');   % Modeled
title('Phase B Current')
xlabel('Time (s)');
ylabel('Current (A)');
legend('Measured','Modeled');

subplot(3,1,3)
plot( ...
    t, iC, '-b', ...            % Measured
    t_model, iC_model, ':b');   % Modeled
title('Phase C Current')
xlabel('Time (s)');
ylabel('Current (A)');
legend('Measured','Modeled');

% Read measured low-side current/voltage (snapshot)
% Time domain data: t, V1 ... V4, I1 ... I4, P1 ... P4

% Phase A
data = csvread([data_dir 'waveform-set-3.csv'],1,0);
va = data(:,5); ia = data(:,9);

% Plot low-side voltages
figure(5)

plot( ...
    t, va, '-k', ...            % Measured
    t_model, va_model, ':k');   % Modeled
title('Phase a Voltage')
xlabel('Time (s)');
ylabel('Voltage (V)');
legend('Measured','Modeled');

% Plot low-side currents
figure(6)

plot( ...
    t, ia, '-k', ...            % Measured
    t_model, ia_model, ':k');   % Modeled
title('Phase a Current')
xlabel('Time (s)');
ylabel('Current (A)');
legend('Measured','Modeled');