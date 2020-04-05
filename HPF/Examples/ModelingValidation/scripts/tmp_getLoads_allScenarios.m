

clc
clear
close all


loadOk = 1;
indx = 1;
col = struct();
col.pwr.Laptop_3 = 56;
col.pwr.Laptop_4 = 57;
col.pwr.Laptop_5 = 58;
col.pwr.LED_1 = 59;
col.pwr.LED_2 = 60;
col.pwr.LED_3 = 61;
col.pwr.PS_1 = 62;
col.pwr.PS_2 = 63;
col.pwr.PS_3 = 64;

% only for scenarios 1-2
for scenario = [1:2] % iterate through scenarios
    for dataSet = [1:4]   % iterate through data sets
        dir = tmp_getDataDir(scenario, dataSet);
        fileData = readcell([dir, 'combined_data.csv']);
        disp('----------------------------')
        disp(['Scenario ', num2str(scenario), ' Data Set ', num2str(dataSet)])
        fprintf('Laptop 3: %f\n', cell2mat(fileData(2, col.pwr.Laptop_3)));
        fprintf('Laptop 4: %f\n', cell2mat(fileData(2, col.pwr.Laptop_4)));
        fprintf('Laptop 5: %f\n', cell2mat(fileData(2, col.pwr.Laptop_5)));
        fprintf('LED 1:    %f\n', cell2mat(fileData(2, col.pwr.LED_1)));
        fprintf('LED 2:    %f\n', cell2mat(fileData(2, col.pwr.LED_2)));
        fprintf('LED 3:    %f\n', cell2mat(fileData(2, col.pwr.LED_3)));
        fprintf('PS 1:     %f\n', cell2mat(fileData(2, col.pwr.PS_1)));
        fprintf('PS 2:     %f\n', cell2mat(fileData(2, col.pwr.PS_2)));
        fprintf('PS 3:     %f\n', cell2mat(fileData(2, col.pwr.PS_3)));
    end
    indx = indx + 1;
end