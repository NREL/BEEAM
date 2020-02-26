
clc
clear
close all


scenarios ={%'Scenario_1_Data_Set_1_1';      % 1
            'Scenario_1_Data_Set_1_2';      % 2
            'Scenario_1_Data_Set_1_3';      % 3
            'Scenario_1_Data_Set_1_4';      % 4
            %'Scenario_2_Data_Set_2_1';      % 5 
            'Scenario_2_Data_Set_2_2';      % 6
            'Scenario_2_Data_Set_2_3';      % 7
            %'Scenario_2_Data_Set_2_4'      % 8
            };     
loadOk = 1;
indx = 1;
for scenario = [1:length(scenarios)]
    % run script
    %Scenario_i
    no_tfmr_scenario_i
    %no_tfmr__manual_load_scenario_i
end

