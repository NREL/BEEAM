%% Example: Fit an individual AC/DC empirical converter model

%% Clear workspace
% Clear console
clear
clc

%% Configuration
% Device name (note: used in path below)
deviceName = 'HP 677777-002 Laptop Charger';

% Device data source directory
dataDirectory = fullfile('.', 'Example Data', deviceName, 'Processed Data');

% Device ratings
Pnom = 90;          % W
Vnom = 120;         % V_ac
Inom = Pnom / Vnom; % A_ac

% Maximum harmonic order to include in interpolation table
hMax = 19;

%% Import Data
% Use helper function to import the data from CSV
convData = import_measured_converter_data(dataDirectory);

% Note: By default, harmonic samples are grouped and averaged by th
% "Power Step" column in the CSV file. You can also specify the name of the
% grouping column specifically:
%convData = import_measured_converter_data(dataDirectory, "Power Step");

%% Fit Efficiency Model
% Call efficiency model fitting function
Pin = convData.power.Pin;
Pout = convData.power.Pout;
lossCoeff = loss_model(Pin, Pout, Pnom);

% Split out results into individual alpha, beta, gamma
alpha = lossCoeff(1);
beta  = lossCoeff(2);
gamma = lossCoeff(3);

% Modeled curves: Pout, Pin, Ploss, efficiency
% See loss_model() documentation for how to apply alpha, beta, gamma
mdl_Pout  = Pnom .* (0:0.02:1);
mdl_Pin   = mdl_Pout + Pnom .* ...
  (alpha + beta .* (mdl_Pout./Pnom) + gamma .* (mdl_Pout./Pnom).^2);
mdl_Ploss = mdl_Pin - mdl_Pout;
mdl_Eff   = mdl_Pout ./ mdl_Pin;

% Plot: Loss curve
figure
plot(Pout, Pin - Pout, 'ob');
hold on
grid on
plot(mdl_Pout, mdl_Ploss, '--r');
xlabel('Pout (W)');
ylabel('Loss (W)');
title('Pout vs Loss');
legend('Measurement', 'Model', 'Location', 'southeast');

% Plot: Efficiency curve
figure
plot(Pout, (Pout./Pin)*100, 'ob');
hold on
grid on
plot(mdl_Pout, mdl_Eff*100, '--r');
xlabel('Pout (W)');
ylabel('Efficiency');
title('Efficiency');
legend('Measurement', 'Model', 'Location', 'southeast');

%% Fit Harmonic Model
% Important! Data comes in with even and odd harmonics, but we typically want
% only odd harmonics for surface fitting. We also may want to limit the maximum
% harmonic present in the model, as shown here.

% Get harmonic vector
h = convData.harmonics.h;

% Filter to odd harmonics only, less than or equal to maximum
hMask = (mod(h, 2) > 0) & (h <= hMax);

% Get data (filtered by values of h we want!)
h     = convData.harmonics.h(hMask);
Imeas = convData.harmonics.I(hMask);
Imag  = convData.harmonics.Imag(hMask);
Iarg  = convData.harmonics.Iarg(hMask);
P1    = convData.harmonics.P1(hMask);

% Generate interpolation table: X = harmonic, Y = fundamental power, Z = current
[X, Y, Z_mag, Z_arg] = empirical_harmonic_model(Imeas, h, P1, Inom, Pnom);

% Note: Variable names here are matched to what BEEAM expects

% Plot: Magnitude
figure
surf(X, Y, Z_mag, 'FaceAlpha', 0.75)
xlabel('$h$', 'interpreter', 'latex', 'FontSize', 14)
ylabel('$\frac{P_{AC}^{(1)}}{P_{nom}}$', 'interpreter', 'latex', 'FontSize', 14)
zlabel('$|I^{(h)}|$', 'interpreter', 'latex', 'FontSize', 14)
title('Magnitude Model')

% Plot: Phase
figure
surf(X, Y, Z_arg, 'FaceAlpha', 0.75)
xlabel('$h$', 'interpreter', 'latex', 'FontSize', 14)
ylabel('$\frac{P_{AC}^{(1)}}{P_{nom}}$', 'interpreter', 'latex', 'FontSize', 14)
zlabel('$\angle I^{(h)}$', 'interpreter', 'latex', 'FontSize', 14)
title('Phase Model')

%% Save Output
% Demonstrates how to save a .mat file compatible with BEEAM's empirical AC/DC
% converter model. Uncomment to run.

% Filename
fname = strcat([strrep(deviceName, ' ', '-'), '.mat']);

% Execute save
if exist ("OCTAVE_VERSION", "builtin") > 0
  save('-V6', fname, 'X', 'Y', 'Z_mag', 'Z_arg', 'alpha', 'beta', 'gamma');
else
  save fname 'X' 'Y' 'Z_mag' 'Z_arg' 'alpha' 'beta' 'gamma';
end

