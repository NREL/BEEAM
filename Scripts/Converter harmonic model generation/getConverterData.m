

% get data from Device Characterization excercise
% read data from CSV file and arrange the data in 
function convData = getConverterData(dataDirectory, device)

%% dir structure
% ../
% ├── Processed Data
% │   ├── Figures
% │   │   ├── ..
% │   │   ├── ..
% │   ├── Harmonics.csv
% │   └── Power_data.csv

%% defining columns
col = struct();
col.harmonics = 4;
col.power = 2;
col.voltage.mag = 5;
col.voltage.arg = 6;
col.current.mag = 8;
col.current.arg = 9;
col.P_DC = 18;

%% using abolute path
path_ProcessedData = '/Processed Data/';    
% file path
file_path = [dataDirectory, ...
            device, path_ProcessedData];

% read csv file
% check if GNU octave 
if exist ("OCTAVE_VERSION", "builtin") > 0
  pkg load io;
  csvData = csv2cell([file_path, 'Harmonics.csv']);
else 
  csvData = readcell([file_path, 'Harmonics.csv']);
end


pwrSteps = [0:10:100];  % modify this 

data = struct();
data.pwr = cell2mat(csvData(2:end, col.power));
data.hrm = cell2mat(csvData(2:end, col.harmonics));
data.v.mag = cell2mat(csvData(2:end, col.voltage.mag));
data.v.arg = cell2mat(csvData(2:end, col.voltage.arg));
data.i.mag = cell2mat(csvData(2:end, col.current.mag));
data.i.arg = cell2mat(csvData(2:end, col.current.arg));
data.P_DC = cell2mat(csvData(2:end, col.P_DC));


convData.name = device;

indx = 1;
for pwrStep = pwrSteps
    pwrIndx_begin = find(data.pwr == pwrStep);
    if pwrStep == 100
        pwrIndx_end = find(data.pwr == pwrStep);
        % overly complicated way of findind last index
        % 100 pwr step ends like, 100 100 0 0
        % getting the index when there is a change
        % we know that that there are 128 harmonics
        pwrIndx_end = pwrIndx_begin + 128;
    else
        pwrIndx_end = find(data.pwr == pwrSteps(indx + 1));
    end
    
    convData.pwrLevel(indx).pwrStep = pwrStep;
    convData.pwrLevel(indx).v.mag = data.v.mag(pwrIndx_begin(1):pwrIndx_end(1)-1, 1);
    convData.pwrLevel(indx).v.arg = deg2rad(data.v.arg(pwrIndx_begin(1):pwrIndx_end(1)-1, 1));
    convData.pwrLevel(indx).i.mag = data.i.mag(pwrIndx_begin(1):pwrIndx_end(1)-1, 1);
    convData.pwrLevel(indx).i.arg = deg2rad(data.i.arg(pwrIndx_begin(1):pwrIndx_end(1)-1, 1));
    % correct phase shifts
    % harmonic phase angles must be referenced wrt /_V(h=1) = 0 rad
    vPhaseAdjust = convData.pwrLevel(indx).v.arg(2);
    maxHarmonics = 128;
    h = [0:1:maxHarmonics-1]';
    convData.pwrLevel(indx).v.arg = phaseShift(convData.pwrLevel(indx).v.arg, ...
                                                h, vPhaseAdjust);
    convData.pwrLevel(indx).i.arg = phaseShift(convData.pwrLevel(indx).i.arg, ...
                                                h, vPhaseAdjust);                                        
    % AC real power
    v = convData.pwrLevel(indx).v.mag .* (cos(convData.pwrLevel(indx).v.arg) + ...
                        1j.*sin(convData.pwrLevel(indx).v.arg));
    i = convData.pwrLevel(indx).i.mag .* (cos(convData.pwrLevel(indx).i.arg) + ...
                        1j.*sin(convData.pwrLevel(indx).i.arg));                
    convData.pwrLevel(indx).S = v .* conj(i);
    convData.pwrLevel(indx).Preal = real(sum(convData.pwrLevel(indx).S));
    convData.pwrLevel(indx).Preal_h1 = real(convData.pwrLevel(indx).S(2));
    % Output DC power
    convData.pwrLevel(indx).P_DC = data.P_DC(pwrIndx_begin(1));
    
    
    
    indx = indx + 1;
end
