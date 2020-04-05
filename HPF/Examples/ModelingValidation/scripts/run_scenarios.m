
clc
clear
close all


loadOk = 1;
dataEntry(1, :) = {'P_sec [W]',	'P_lossConv [W]'};
%% Scenarios 1-2
indx = 1;
% for scenario = [1:2] % iterate through scenarios
%     for dataSet = [1:4]   % iterate through data sets
%         modelicaSim = ['Scenario_', num2str(scenario), '_Data_Set_', num2str(scenario), ...
%                     '_', num2str(dataSet)];
%         % call script
%         Scenario_1_2_no_tfmr
%         
%         % write data to csv file
%         % P_sec [W]	P_lossConv [W]
%         dataEntry(indx+1, :) = {inputVoltageSource.P, convLosses};
%         indx = indx + 1;
%     end
%     
% end
% write to csv
%writecell

%% Scenarios 3-4
indx = 1
for scenario = [3:4] % iterate through scenarios
    for dataSet = [1:4]   % iterate through data sets
        modelicaSim = ['Scenario_', num2str(scenario), '_Data_Set_', num2str(scenario), ...
                    '_', num2str(dataSet)];
        Scenario_3_4_no_tfmr
        % P_sec [W]	P_lossConv [W]
        dataEntry(indx+1, :) = {inputVoltageSource.P, convLosses};
        indx = indx + 1;
    end
    
end