%% Example: Batch fitting of AC/DC empirical converter models

%% Clear workspace
% Close plots
close all

% Clear console
clear
clc

%% Configuration
% Configuration can be modified to batch run for any CSU-characterized devices,
% but metadata for converter ratings (voltage, power) must be provided.

% CSV containing device metadata and source files
deviceList = fullfile(".", "Example Data", "batch_example.csv");

% Needed later
[deviceParentDir, deviceListFileName, ~] = fileparts(deviceList);

% This CSV has required columns:
% - Device Name
% - Directory
% - Nominal Power
% - Nominal Input Voltage

% Maximum harmonic order to include in interpolation table
hMax = 29;

% Standby power output threshold (fraction of nominal power)
% Set to zero or negative to disable
standbyThreshold = 0.05;

%% Read Device List
% Read CSV data
if exist ("OCTAVE_VERSION", "builtin") > 0
  % GNU Octave
  pkg load io;
  deviceTable = csv2cell(deviceList);
else
  % MATLAB
  deviceTable = readcell(deviceList);
end

% Get column headers
deviceTableHeaders = deviceTable(1, :);

% Structure for column indices
col = struct();

% Device data columns indices (add more if needed)
col       = struct();
col.name  = find(strcmp('Device Name', deviceTableHeaders));
col.dir   = find(strcmp('Directory', deviceTableHeaders));
col.power = find(strcmp('Nominal Power', deviceTableHeaders));
col.volt  = find(strcmp('Nominal Input Voltage', deviceTableHeaders));

% Number of devices
nDevices = size(deviceTable)(1) - 1;

% More device table column indices (needed for output later)
nCols = size(deviceTable)(2);
col.standby      = nCols + 1;
col.standbyPower = nCols + 2;
col.modelfile    = nCols + 3;

%% Iterate Devices
% Add columns to cell array for output purposes
deviceTable{1, col.standby} = 'Standby Threshold';  % W
deviceTable{1, col.standbyPower} = 'Standby Power'; % W
deviceTable{1, col.modelfile} = 'Model File';

% For each device...
for i = (1:nDevices)
  % Gather data
  DevName = deviceTable{i+1, col.name};
  DevDir  = deviceTable{i+1, col.dir};
  Pnom    = deviceTable{i+1, col.power}; 
  Vnom    = deviceTable{i+1, col.volt}; 
  Inom    = Pnom / Vnom;
  
  % Use helper functions to import the data from CSV
  dataDirectory = fullfile(deviceParentDir, DevDir, "Processed Data");
  convData = struct();
  convData.power = import_measured_converter_power_data(dataDirectory);
  convData.harmonics = import_measured_converter_harmonic_data(dataDirectory);
  
  % Get power data and calculate standby power
  if (standbyThreshold <= 0)
    Pin = convData.power.Pin;
    Pout = convData.power.Pout;
    standbyPower = 0;
  else
    Pin = convData.power.Pin(convData.power.Pout >= standbyThreshold*Pnom);
    Pout = convData.power.Pout(convData.power.Pout >= standbyThreshold*Pnom);
    standbyPower = mean(convData.power.Pin(convData.power.Pout < standbyThreshold*Pnom));
  end
  
  % Fit Efficiency Model
  lossCoeff = loss_model(Pin, Pout, Pnom);

  % Split out results into individual alpha, beta, gamma
  alpha = lossCoeff(1);
  beta  = lossCoeff(2);
  gamma = lossCoeff(3);
  
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
  
  % Filename and target directory (same directory as soure data)
  fName = strcat([strrep(DevName, ' ', '-'), '.mat']);
  fPath = fullfile(deviceParentDir, DevDir, fName);

  % Save
  if exist ("OCTAVE_VERSION", "builtin") > 0
    save('-V6', fPath, 'X', 'Y', 'Z_mag', 'Z_arg', 'alpha', 'beta', 'gamma');
  else
    % Needs to be tested w/ MATLAB
    save fPath 'X' 'Y' 'Z_mag' 'Z_arg' 'alpha' 'beta' 'gamma';
  end
  
  % Record fitted model information
  deviceTable{i+1, col.standby} = max(standbyThreshold, 0)*Pnom; % W
  deviceTable{i+1, col.standbyPower} = standbyPower;             % W
  deviceTable{i+1, col.modelfile} = fName;
  
end

% Note: the variable names in the loop above are compatible with the plotting
% functions in "individual_example.m" in case you want to insert breakpoints and
% inspect the fit for specific devices.

%% Export Results
% Save a CSV file documenting the fitted models
if exist ("OCTAVE_VERSION", "builtin") > 0
  % Required functions aren't available in Octave :(
else
  % Needs to be tested w/ MATLAB
  
  % Prep to write the table 
  tableOut = cell2table(deviceTable(2:end,:), 'VariableNames', deviceTable(1,:));
  tableFilename = strcat([deviceListFileName, '_out', '.csv']);
  
  % Write the table to a CSV file
  writetable(tableOut, fullfile(deviceParentDir, tableFilename));
end
