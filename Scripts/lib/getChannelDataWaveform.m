

function s = getChannelDataWaveform(fileName, channel)

fileData = readcell(fileName);

% based on the queried channel get data into struct
s = struct();

qCol = struct();    % queried column corresponding to queried channel
% channel 1 | v = 2
% channel 1 | i = 6 = 2 + 4
% therefore, current channels are offset by 4
qCol.v = channel + 1;
qCol.i = qCol.v + 4;

s.time = cell2mat(fileData(2:end, 1));
s.wv.v = cell2mat(fileData(2:end, qCol.v));
s.wv.i = cell2mat(fileData(2:end, qCol.i));
















