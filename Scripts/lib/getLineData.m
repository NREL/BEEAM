%
% scnDataDirPath: path to the scenario data dir containing the processed harmonics
% qPh: query phase; options, 'A', 'B', 'C'
% qSide: query side; options, 'primary', 'secondary'
% dataSel: select type of data to be read. Options: 'harmonics', 'waveform'
% 06/19/2020: adding support to get waveform data.
%             Maintaining legacy usage
function s = getLineData(scnDataDirPath, qPh, qSide, dataSel)

if nargin < 4
    dataSel = 'harmonics'; % maintains legacy usage of the function
end

% Two power analyzers are connected as follows:
% Power Analyzer 1:
% - Ch 1 : Ph A-B prim (ph-ph)
% - Ch 2 : Ph B-C prim (ph-ph)
% - Ch 3 : Ph C-A prim (ph-ph)
% - Ch 4 : --
% Power Analyzer 2:
% - Ch 1 : Ph A Prim
% - Ch 2 : Ph A sec (ph-N)
% - Ch 3 : Ph B sec (ph-N)
% - Ch 4 : Pb C sec (ph-N)

% user will query phase and transformer side
% example, Phase A, primary

% testing
% qPh = 'A';  % query phase
% qSide = 'secondary'; % query transformer side

% based on the query, get the actual columns
% Data for each power analyzer is saved in separate files named:
% Primary : PA_1_harmonics.csv
% Secondary : PA_2_harmonics.csv
% query side
if strcmp(qSide, 'primary') == 1
    % read processed harmonics or waveforms data
    if strcmp(dataSel, 'harmonics') == 1
        dataFileName = 'PA_1_harmonics.csv';
    elseif strcmp(dataSel, 'waveform') == 1
        dataFileName = 'PA_1_wave_forms_one_cycle.csv';
    end
    % query channel
    if strcmp(qPh, 'A') == 1
        channel = 1;
    elseif strcmp(qPh, 'B') == 1
        channel = 2;
    elseif strcmp(qPh, 'C') == 1
        channel = 3;
    else 

    end
elseif strcmp(qSide, 'secondary') == 1
    if strcmp(dataSel, 'harmonics') == 1
        dataFileName = 'PA_2_harmonics.csv';
    elseif strcmp(dataSel, 'waveform') == 1
        dataFileName = 'PA_2_wave_forms_one_cycle.csv';
    end
    % query channel
    if strcmp(qPh, 'A') == 1
        channel = 2;
    elseif strcmp(qPh, 'B') == 1
        channel = 3;
    elseif strcmp(qPh, 'C') == 1
        channel = 4;
    else 

    end
else
   % error 
end

% filePath = '/media/avpreetsingh/Documents/Research/DC Design Tool/Google Drive/Notional Setup - Phase 2B/Test Data/Scenario 2/Data Set 2.3/Run 2.3.1/Processed Data';
fileName = [scnDataDirPath, dataFileName];
% 
% fileData = readcell(fileName);

if strcmp(dataSel, 'harmonics') == 1
    s = getChannelData(fileName, channel, 40);
elseif strcmp(dataSel, 'waveform') == 1
    s = getChannelDataWaveform(fileName, channel);
end

