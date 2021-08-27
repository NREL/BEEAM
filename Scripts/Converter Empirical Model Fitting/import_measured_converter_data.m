% Function: Import CSU-characterized converter data from CSV file
% ------------------------------------------------------------------------------
% Imports device data for CSU-characterized AC/DC converters. Expects a 
% directory containing files 'Harmonics.csv' and 'Power_data.csv' and standard
% CSV column format (names, units) for both files.
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
% Avpreet Othee, avpreetsingh@hotmail.com
% Modified By: Stephen Frank, Stephen.Frank@nrel.gov
% ------------------------------------------------------------------------------

function data = import_measured_converter_data(dataDirectory, groupColumn)
  
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
% │   └── Power_data.csv <- Required File

% Read CSV data
if exist ("OCTAVE_VERSION", "builtin") > 0
  % GNU Octave
  pkg load io;
  harmonicsTable = csv2cell(fullfile(dataDirectory, 'Harmonics.csv'));
  powerTable = csv2cell(fullfile(dataDirectory, 'Power_data.csv'));
else
  % MATLAB
  harmonicsTable = readcell(fullfile(dataDirectory, 'Harmonics.csv'));
  powerTable = readcell(fullfile(dataDirectory, 'Power_data.csv'));
end

% Get column headers
harmonicsHeaders = harmonicsTable(1, :);
powerHeaders = powerTable(1, :);

% Structure for column indices
col = struct();

% Harmonics data columns indices (add more if needed)
col.harmonics      = struct();
col.harmonics.grp  = find(strcmp(groupColumn, harmonicsHeaders));
col.harmonics.h    = find(strcmp('Harmonic', harmonicsHeaders));
col.harmonics.Vmag = find(strcmp('Input Voltage Mag (Vrms)', harmonicsHeaders));
col.harmonics.Varg = find(strcmp('Input Voltage Angle (deg)', harmonicsHeaders));
col.harmonics.Imag = find(strcmp('Input Current Mag (Arms)', harmonicsHeaders));
col.harmonics.Iarg = find(strcmp('Input Current Angle (deg)', harmonicsHeaders));

% Power data column indices (add more if needed)
col.power      = struct();
col.power.Pin  = find(strcmp('Input Active Power (W)', powerHeaders));
col.power.Pout = find(strcmp('Output Active Power (W)', powerHeaders));

% Data structure
data = struct();
data.path = dataDirectory;

% Power data
data.power      = struct();
data.power.Pin  = cell2mat(powerTable(2:end, col.power.Pin));
data.power.Pout = cell2mat(powerTable(2:end, col.power.Pout));

% Disaggregated harmonics data
h    = cell2mat(harmonicsTable(2:end, col.harmonics.h));
Vmag = cell2mat(harmonicsTable(2:end, col.harmonics.Vmag));
Varg = deg2rad(cell2mat(harmonicsTable(2:end, col.harmonics.Varg)));
Imag = cell2mat(harmonicsTable(2:end, col.harmonics.Imag));
Iarg = deg2rad(cell2mat(harmonicsTable(2:end, col.harmonics.Iarg)));

% Compute complex voltage, complex current, input power
Vin = Vmag .* exp(1j .* Varg);
Iin = Imag .* exp(1j .* Iarg);
Sin = Vin .* conj(Iin);
Pin = real(Sin);

% Groups for averaging harmonics data
rowGroup = cell2mat(harmonicsTable(2:end, col.harmonics.grp));
groups = unique(rowGroup);
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
data.harmonics     = struct();
data.harmonics.grp = zeros(numRows, 1);
data.harmonics.h   = zeros(numRows, 1);
data.harmonics.V   = zeros(numRows, 1);
data.harmonics.I   = zeros(numRows, 1);
data.harmonics.P1  = zeros(numRows, 1);

% Populate aggregated harmonics data
% (This should probably be vectorized for efficiency... someday)
r = 0; % Starting row index
for gg = groups
  for hh = harms
    % Advance row index
    r = r + 1;
    
    % Record group, harmonic
    data.harmonics.grp(r) = gg;
    data.harmonics.h(r)   = hh;
    
    % Grouping mask
    mask = (rowGroup == gg) & (h == hh);
    
    % Averages
    data.harmonics.V(r)  = mean(Vin(mask));
    data.harmonics.I(r)  = mean(Iin(mask));
    
    % Reference fundamental power
    data.harmonics.P1(r) = mean(P1_ref(mask)); % Should all be same value
  endfor
endfor

% Final magnitude and phase angle
data.harmonics.Vmag = abs(data.harmonics.V);
data.harmonics.Varg = arg(data.harmonics.V);
data.harmonics.Imag = abs(data.harmonics.I);
data.harmonics.Iarg = arg(data.harmonics.I);

% Reorder harmonics fields prior to returning
data.harmonics = orderfields(data.harmonics, ...
  {'grp', 'h', 'V', 'Vmag', 'Varg', 'I', 'Imag', 'Iarg', 'P1'});

endfunction
