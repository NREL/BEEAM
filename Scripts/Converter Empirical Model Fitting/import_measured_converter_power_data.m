% Function: Import CSU-characterized converter power data from CSV file
% ------------------------------------------------------------------------------
% Imports device power data for CSU-characterized AC/DC converters. Expects a 
% directory containing file 'Power_data.csv' and with a standard CSV column
% format (names, units).
%
% Inputs:
%   dataDirectory: Path to data directory containing device data
%
% Outputs:
%   data: struct containing converter characterization data
%
% Stephen Frank, Stephen.Frank@nrel.gov
% 
% Based On: 'getConverterData.m' and 'generate_harmonic_load_model.m' originally
% written by Avpreet Othee, avpreetsingh@hotmail.com
% ------------------------------------------------------------------------------

function data = import_measured_converter_power_data(dataDirectory)
  
%% Dir structure for CSU-characterized devices
% [parent]/
% ├── Processed Data <- Set dataDirectory to here!!
% │   ├── Figures
% │   │   ├── ..
% │   │   ├── ..
% │   ├── Harmonics.csv
% │   └── Power_data.csv <- Required File

% Read CSV data
if exist ("OCTAVE_VERSION", "builtin") > 0
  % GNU Octave
  pkg load io;
  powerTable = csv2cell(fullfile(dataDirectory, 'Power_data.csv'));
else
  % MATLAB
  powerTable = readcell(fullfile(dataDirectory, 'Power_data.csv'));
end

% Get column headers
powerHeaders = powerTable(1, :);

% Structure for column indices
col = struct();

% Power data column indices (add more if needed)
col.Pin  = find(strcmp('Input Active Power (W)', powerHeaders));
col.Pout = find(strcmp('Output Active Power (W)', powerHeaders));

% Data structure
data = struct();
data.path = dataDirectory;

% Power data
data      = struct();
data.Pin  = cell2mat(powerTable(2:end, col.Pin));
data.Pout = cell2mat(powerTable(2:end, col.Pout));

endfunction
