%% Rescale Empirical Models
% This script rescales empirical model coefficients to new nominal ratings. Most
% useful for correcting earlier empirical model matrices that were fit without
% normalization.

%% Clear workspace
% Close plots
close all

% Clear console
clear
clc

%% Setup <- Set values in this section for your application!
% Model filenames
oldModelFile = 'demoModel.mat';
newModelFile = 'demoModelRescaled.mat';

% Original nominal values (i.e. device bases or rated values)
Pnom_old = 1;                   % W
Vnom_old = 1;                   % V_ac
Inom_old = Pnom_old / Vnom_old; % A_ac

% New (target) nominal values
Pnom_new = 90;                  % W
Vnom_new = 120;                 % V_ac
Inom_new = Pnom_new / Vnom_new; % A_ac

%% Load original model
% Load original model from file
load(oldModelFile);

%% Rescale Model Parameters
% Rescale efficiency model
alpha = alpha * (Pnom_old / Pnom_new);
beta  = beta;
gamma = gamma * (Pnom_new / Pnom_old);

% Rescale harmonics model
Y = Y .* (Pnom_old/Pnom_new);
Z_mag = Z_mag .* (Inom_old/Inom_new);

%% Save new model
% Save new model to file
if exist ("OCTAVE_VERSION", "builtin") > 0
  save('-V6', newModelFile, 'X', 'Y', 'Z_mag', 'Z_arg', 'alpha', 'beta', 'gamma');
else
  % Needs to be tested w/ MATLAB
  save newModelFile 'X' 'Y' 'Z_mag' 'Z_arg' 'alpha' 'beta' 'gamma';
end