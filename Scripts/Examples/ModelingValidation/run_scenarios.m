%% Scenarios 1-2
clc
clear
close all

% additional flag for loading the Modelica results mat file
% Set this to 1 to force loading the resutls file even if res variable
% exists in the workspace
loadOk = 1; 
indx = 1;
%dataEntry(indx, :)  = {'Scenario', 'Msr (W)', 'Sim (W)', 'Error (%)', 'Conv Loss (W)', 'Conv loss err (%)'};
dataEntry(indx, :)  = {'Scenario', 'P_in [W]', 'P_sec [W]', 'P_lossTran [W]', 'P_lossConv [W]', 'P_loss [W]', 'P_out [W]'};

indx = indx + 1;
for scenario = [1:2] % iterate through scenarios
    for dataSet = [1:4]   % iterate through data sets
        modelicaSim = ['Scenario_', num2str(scenario), '_Data_Set_', num2str(scenario), ...
                    '_', num2str(dataSet)];
        % call script
        Scenario_1_2
        
        % write data to csv file
        % P_sec [W]	P_lossConv [W]
        dataEntry(indx, :) = {modelicaSim, linePwr.sim.prim.total, linePwr.sim.sec.total, ...
            linePwr.sim.prim.total - linePwr.sim.sec.total, ...
            convLosses, linePwr.sim.prim.total - DC_power, DC_power};
        indx = indx + 1;
    end
    
end
% write to csv
%writecell

%dataEntry(indx, :)  = {'Scenario', 'Msr (W)', 'Sim (W)', 'Error (%)', 'Total Loss (W)', 'Total loss err (%)'};
%% Scenarios 3-4
%indx = 1;
% if exist('indx', 'var') ~= 1
%     indx = 1;
%     loadOk = 1; 
% end
% for scenario = [3:4] % iterate through scenarios
%     for dataSet = [1:4]   % iterate through data sets
%         modelicaSim = ['Scenario_', num2str(scenario), '_Data_Set_', num2str(scenario), ...
%                     '_', num2str(dataSet)];
%         Scenario_3_4_no_tfmr
%         % P_sec [W]	P_lossConv [W]
%         %dataEntry(indx+1, :) = {inputVoltageSource.P, convLosses};
%         dataEntry(indx, :) = {modelicaSim, linePwr.msr.total, linePwr.sim.total, ...
%             ((linePwr.msr.total - linePwr.sim.total)/linePwr.msr.total)*100, ...
%             total, ...
%             err.convLosses_pc};
%         indx = indx + 1;
%     end
%     
% end
% 
% writecell(dataEntry, 'Error_summary.csv', 'Delimiter', ',')