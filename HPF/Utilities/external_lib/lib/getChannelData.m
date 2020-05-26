

function s = getChannelData(fileName, channel, maxHrm)

if nargin < 3
    maxHrm = 80 + 1;
else
    maxHrm = maxHrm + 1;
end

% filePath = '/media/avpreetsingh/Documents/Research/DC Design Tool/Google Drive/Notional Setup - Phase 2B/Test Data/Scenario 2/Data Set 2.3/Run 2.3.1/Processed Data';
% fileName = [filePath, '/', 'PA_1_harmonics.csv'];
% 

fileData = readcell(fileName);

% numerating columns
% col = struct();
% col.freq = 1;
% % voltage
% col.V1.mag = 2;
% col.V1.arg = 3; % degrees
% col.V2.mag = 4;
% col.V2.arg = 5;
% col.V3.mag = 6;
% col.V3.arg = 7;
% col.V4.mag = 8;
% col.V4.arg = 9;
% % current
% col.I1.mag = 10;
% col.I1.arg = 11;
% col.I2.mag = 12;
% col.I2.arg = 13;
% col.I3.mag = 14;
% col.I3.arg = 15;
% col.I4.mag = 16;
% col.I4.arg = 17;

% return a struct
% There can be multiple ways of accomplising this.
% One way would be to just return data for the queried column.
% Stating the requirements
% * Get voltage and current data for a given phase.
% * Also, either on transformer primary or sec
% Given the above requirements, one should query the transformer side and
% the phase.
% the function should return a struct with mag, arg and complex data.

% based on the queried channel get data into struct
s = struct();

qCol = struct();    % queried column corresponding to queried channel
% channel 1 | v.mag = 2; v.arg = 3
% channel 1 | i.mag = 2+8 = 10
% therefore, current channels are offset by 8
% voltage channels are offset from channel 1 by 3
qCol.v.mag = 2 * channel;
qCol.v.arg = qCol.v.mag + 1;
qCol.i.mag = qCol.v.mag + 8;
qCol.i.arg = qCol.i.mag + 1;

s.freq = cell2mat(fileData(2:maxHrm, 1));
s.h = int16(s.freq ./ s.freq(1));
s.v.mag = cell2mat(fileData(2:maxHrm, qCol.v.mag));
s.v.arg = deg2rad(cell2mat(fileData(2:maxHrm, qCol.v.arg)));
s.i.mag = cell2mat(fileData(2:maxHrm, qCol.i.mag));
s.i.arg = deg2rad(cell2mat(fileData(2:maxHrm, qCol.i.arg)));
s.v.cmplx = s.v.mag .* (cos(s.v.arg) + 1j.*sin(s.v.arg));
s.i.cmplx = s.i.mag .* (cos(s.i.arg) + 1j.*sin(s.i.arg));

















