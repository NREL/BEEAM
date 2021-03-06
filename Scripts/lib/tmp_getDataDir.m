

%% get directory for the processed data
% Notional test setup phase 2B

%% directory structure:
% ├── Scenario 1
% │   ├── Data Set 1.1
% │   │   ├── Run 1.1.1
% │   │   │   ├── Configuration Files
% │   │   │   │   ├── electricalTopology.csv
% │   │   │   │   ├── instrumentLinks.csv
% │   │   │   │   ├── loads.csv
% │   │   │   │   └── measurementTopology.csv
% │   │   │   ├── Processed Data
% │   │   │   │   ├── combined_data.csv
% │   │   │   │   ├── PA_1_harmonics.csv
% │   │   │   │   ├── PA_1_wave_forms_one_cycle.csv
% │   │   │   │   ├── PA_2_harmonics.csv
% │   │   │   │   └── PA_2_wave_forms_one_cycle.csv

% given scenario and run,
% return directory

function dir = tmp_getDataDir(scenario, dataSet, runSet)

if nargin < 3
    runSet = 2; % Runs correspond to data collection with nothing changed
    % randomly setting run to 2
else 
   
end

% 
% scenario = 2;
% dataSet = 3;

% Run dir is of the form, 'Run <scenario>.<data set>.<run>'
% data set dir is of the form, 'Data Set <scenario>.<data set>'
runDir = ['Run ', num2str(scenario), '.', num2str(dataSet), '.', num2str(runSet)];
dataSetDir = ['Data Set ', num2str(scenario), '.', num2str(dataSet)];
scenarioDir = ['Scenario ', num2str(scenario)];

% convention: start with '/' but dont end with the same
parentDir = '/media/avpreetsingh/Documents/Research/DC Design Tool/Google Drive';
notionalTestSetupPh_2B_dir = '/Notional Setup - Phase 2B/Test Data';

dir = [parentDir, notionalTestSetupPh_2B_dir, '/', scenarioDir, '/', ...
            dataSetDir, '/', runDir, '/Processed Data/'];

