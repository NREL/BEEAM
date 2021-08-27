
%%
% Script:
% Iterate through converters and generate models
% ------------------------------------------------------------------------------
%
% Workflow:
%   Set the directory containing measured data. 
%   Load the model files.
%   Iterate through the measured data files and generate 
%   models
%
% Avpreet Othee, avpreetsingh@hotmail.com
% ------------------------------------------------------------------------------

% set the directory containing measurement data
dataDir = './meas_data';

% get data file names in the meas data dir
% data is saved in mat files
% Data format: X, Y, Z_mag, Z_arg
tmpdirRet = dir(dataDir);
deviceDataFileNames = cell(length(tmpdirRet)-2, 1);
idx = 1;
for k = 3:length(tmpdirRet)  % first 2 elements are '.' and '..'
    deviceDataFileNames{idx} = tmpdirRet(k).name;
    idx = idx + 1;
end

% iterate through converter measured data and run optimization
for k = 1:length(deviceDataFileNames)
   load([dataDir, '/', deviceDataFileNames{k}])
   
   % saving device name for modeled data file
   tmp = deviceDataFileNames{k};
   deviceName = tmp(1:end-4);
   
   % run optimization routine
   hrmModeling_phaseAngle
end