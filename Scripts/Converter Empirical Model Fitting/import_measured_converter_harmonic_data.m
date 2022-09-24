% Function: Import CSU-characterized converter data from CSV file
% ------------------------------------------------------------------------------
% Imports device harmonics data for CSU-characterized AC/DC converters. Expects 
% a directory containing file 'Harmonics.csv' and with a standard CSV column
% format (names, units).
%
% Harmonics are processed in groups representing a single experimental setup
% (e.g. a particular power level). It is important that the voltage and load
% conditions are consistent for all samples within each group!
%
% Inputs:
%   dataDirectory: Path to data directory containing device data
%   groupColumn: Grouping column for processing harmonic data
%
% Default value for groupColumn is "Power Step"
%
% Outputs:
%   data: struct containing converter characterization data
%
% Stephen Frank, Stephen.Frank@nrel.gov
% 
% Based On: 'getConverterData.m' and 'generate_harmonic_load_model.m' originally
% written by Avpreet Othee, avpreetsingh@hotmail.com
% ------------------------------------------------------------------------------

function data = import_measured_converter_harmonic_data(dataDirectory, groupColumn)
  
% Default arguments
if (nargin < 2)
  groupColumn = 'Power Step'; % Assumed grouping column if not specified
endif

%% Dir structure for CSU-characterized devices
% [parent]/
% ├── Processed Data <- Set dataDirectory to here!!
% │   ├── Figures
% │   │   ├── ..
% │   │   ├── ..
% │   ├── Harmonics.csv <- Required file
% │   └── Power_data.csv

% Read CSV data
if exist ("OCTAVE_VERSION", "builtin") > 0
  % GNU Octave
  pkg load io;
  harmonicsTable = csv2cell(fullfile(dataDirectory, 'Harmonics.csv'));
else
  % MATLAB
  harmonicsTable = readcell(fullfile(dataDirectory, 'Harmonics.csv'));
end

% Get column headers
harmonicsHeaders = harmonicsTable(1, :);

% Structure for column indices
col = struct();

% Harmonics data columns indices (add more if needed)
col.grp  = find(strcmp(groupColumn, harmonicsHeaders));
col.h    = find(strcmp('Harmonic', harmonicsHeaders));
col.Vmag = find(strcmp('Input Voltage Mag (Vrms)', harmonicsHeaders));
col.Varg = find(strcmp('Input Voltage Angle (deg)', harmonicsHeaders));
col.Imag = find(strcmp('Input Current Mag (Arms)', harmonicsHeaders));
col.Iarg = find(strcmp('Input Current Angle (deg)', harmonicsHeaders));

% Data structure
data = struct();
data.path = dataDirectory;

% Disaggregated harmonics data
h    = cell2mat(harmonicsTable(2:end, col.h));
Vmag = cell2mat(harmonicsTable(2:end, col.Vmag));
Varg = deg2rad(cell2mat(harmonicsTable(2:end, col.Varg)));
Imag = cell2mat(harmonicsTable(2:end, col.Imag));
Iarg = deg2rad(cell2mat(harmonicsTable(2:end, col.Iarg)));

% Compute complex voltage, complex current, input power
Vin = Vmag .* exp(1j .* Varg);
Iin = Imag .* exp(1j .* Iarg);
Sin = Vin .* conj(Iin);
Pin = real(Sin);

% Groups for averaging harmonics data
if (iscellstr(harmonicsTable(2:end, col.grp)))
  % Strings
  rowGroupRaw = harmonicsTable(2:end, col.grp);
else
  % Numbers
  rowGroupRaw = cell2mat(harmonicsTable(2:end, col.grp));
end

% Note: Mixed strings and numbers won't work at this time.

% Converts groups to integer indices 1, 2, ...
[~, ~, rowGroup] = unique(rowGroupRaw);

% Unique values
groups = sort(unique(rowGroup));
harms = sort(unique(h));

% Enforce row vectors on grouping sets
groups = reshape(groups, 1, []);
harms = reshape(harms, 1, []);

% Fundamental voltage and power reference values by group
% (This should probably be vectorized for efficiency... someday)
V1_ref = zeros(size(h));
P1_ref = zeros(size(h));
for g = groups
  % Compute mask
  mask = (rowGroup == g) & (h == 1); % Fundamental
  
  % Fundamental voltage reference for group
  V1_ref(rowGroup == g) = mean(Vin(mask));
  
  % Fundamental power reference for group
  P1_ref(rowGroup == g) = mean(Pin(mask));
end

% Correct phase angles
% Harmonic phase angles must be referenced wrt /_V(h=1) = 0 rad
Vin = Vin .* exp(-1j .* arg(V1_ref) .* h); % Rotate voltages
Iin = Iin .* exp(-1j .* arg(V1_ref) .* h); % Rotate currents

% Dimensions of aggregated harmonics data
numRows = length(groups) * length(harms);

% Column vectors to receive aggregated harmonics data
data     = struct();
data.grp = zeros(numRows, 1);
data.h   = zeros(numRows, 1);
data.V   = zeros(numRows, 1);
data.I   = zeros(numRows, 1);
data.P1  = zeros(numRows, 1);

% Populate aggregated harmonics data
% (This should probably be vectorized for efficiency... someday)
r = 0; % Starting row index
for gg = groups
  for hh = harms
    % Advance row index
    r = r + 1;
    
    % Record group, harmonic
    data.grp(r) = gg;
    data.h(r)   = hh;
    
    % Grouping mask
    mask = (rowGroup == gg) & (h == hh);
    
    % Averages
    data.V(r)  = mean(Vin(mask));
    data.I(r)  = mean(Iin(mask));
    
    % Reference fundamental power
    data.P1(r) = mean(P1_ref(mask)); % Should all be same value
  endfor
endfor

% Final magnitude and phase angle
data.Vmag = abs(data.V);
data.Varg = arg(data.V);
data.Imag = abs(data.I);
data.Iarg = arg(data.I);

% Reorder harmonics fields prior to returning
data = orderfields(data, ...
  {'grp', 'h', 'V', 'Vmag', 'Varg', 'I', 'Imag', 'Iarg', 'P1'});

endfunction
