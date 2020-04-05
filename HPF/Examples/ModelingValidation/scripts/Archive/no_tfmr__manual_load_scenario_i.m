
%% Modelica post processing
% Running simulations without transformer


% get voltage data on sec for all scenarios

close all

%% script initializations
addpath('./lib')
% load msr data
load('converters_msr_data.mat')
% load voltage data (transformer sec side)
load('vData_sec.mat')

% if scenario variable exists, skip
% this means one is running the external run script.
% one would iterate the variable and run all the scenarios.
if exist('scenario', 'var') ~= 1
    scenarios ={'Scenario_1_Data_Set_1_1';      % 1
            'Scenario_1_Data_Set_1_2';      % 2
            'Scenario_1_Data_Set_1_3';      % 3
            'Scenario_1_Data_Set_1_4';      % 4
            'Scenario_2_Data_Set_2_1';      % 5 
            'Scenario_2_Data_Set_2_2';      % 6
            'Scenario_2_Data_Set_2_3';      % 7
            'Scenario_2_Data_Set_2_4'};     % 8
    scenario = 1;
end

scn = str2num(scenarios{scenario}(strfind(scenarios{scenario}, '_Data')-1));
data_set = str2num(scenarios{scenario}(end));

modelicaWorkingDir = '/home/avpreetsingh/OpenModelica_workspace/';
% file path for OpenModelica mat file
matFile_path = [modelicaWorkingDir, 'HPF.Examples.ModelingValidation.NoTfmr_ManualLoads.', ...
            scenarios{scenario}, '/HPF.Examples.ModelingValidation.NoTfmr_ManualLoads.', ...
            scenarios{scenario}, '_res.mat'];

% speedup execution, prevents reloading matfile everytime.
% to load mat file, clear all the variables using 'clear'
if exist('res', 'var') ~= 1 || exist('loadOk', 'var') == 1
    res = modelicaImport(matFile_path);
end
% correction ---------------
% There is a bug in the 'modelicaImport.m' function. It fails to populate the varaible
% voltageSource.vSrc_phC.v
% Therefore, manually doing that.. functions with prefix 'tmp_' are all 
% temporary fix.
tmpVar = tmp_getModelicaVar_cmplxVect(matFile_path, 'voltageSource.vSrc_phC.v');
res.voltageSource.vSrc_phC.v = tmpVar;


numHrm = res.systemDef.numHrm;   % number of harmonics
h = res.systemDef.hrms; % system harmonics
% getting data from all the devices

%% getting data
% input 
inputVoltageSource = voltageSrc_3ph(numHrm, res.voltageSource);

% converters
LaptopCharger_3 = AC2DC_converter_1ph(numHrm, res.Laptop_Charger_3);
LaptopCharger_4 = AC2DC_converter_1ph(numHrm, res.Laptop_Charger_4);
LaptopCharger_5 = AC2DC_converter_1ph(numHrm, res.Laptop_Charger_5);
LedDriver_1 = AC2DC_converter_1ph(numHrm, res.LED_Driver_1);
LedDriver_2 = AC2DC_converter_1ph(numHrm, res.LED_Driver_2);
LedDriver_3 = AC2DC_converter_1ph(numHrm, res.LED_Driver_3);
PowerSupply_1 = AC2DC_converter_1ph(numHrm, res.Power_Supply_1);
PowerSupply_2 = AC2DC_converter_1ph(numHrm, res.Power_Supply_2);
PowerSupply_3 = AC2DC_converter_1ph(numHrm, res.Power_Supply_3);

%% system losses -----
% Output DC power for converters
DC_power = LaptopCharger_3.DC.P + LaptopCharger_4.DC.P + LaptopCharger_5.DC.P + ...
            LedDriver_1.DC.P + LedDriver_2.DC.P + LedDriver_3.DC.P + ...
            PowerSupply_1.DC.P + PowerSupply_2.DC.P + PowerSupply_3.DC.P;
        
% plotting 
figure
plot(inputVoltageSource.phA.wv.v)
hold on
plot(inputVoltageSource.phB.wv.v)
plot(inputVoltageSource.phC.wv.v)
legend('Ph A', 'Ph B', 'Ph C')       

disp( ' ========================================')        
disp([' Results for:  ', scenarios{scenario}]) 
disp( ' ========================================') 
disp(['System losses (Simulated) --- '])
disp(['Input power:        ', num2str(inputVoltageSource.P), ' W']);
disp(['Output DC power:    ', num2str(DC_power), ' W']);
% System losses
disp(['System Losses:      ', num2str(inputVoltageSource.P - DC_power), ' W']);
disp(['System Effi:        ', num2str((DC_power/inputVoltageSource.P)*100), ' %']);
P_convloss = LedDriver_1.Ploss + LedDriver_2.Ploss + LedDriver_3.Ploss + ...
            LaptopCharger_3.Ploss + LaptopCharger_4.Ploss + LaptopCharger_5.Ploss + ...
            PowerSupply_1.Ploss + PowerSupply_2.Ploss + PowerSupply_3.Ploss;
disp(['Converter losses:   ', num2str(P_convloss), ' W'])


%% Generating csv files for data entry -----------------------------------------
% defining columns for each device, All powers are real
% AC input power | DC output power | Loss

dataRow = [ % P_secondary (input power)
            inputVoltageSource.P;
            % P_convloss (converter losses)
            P_convloss
            ];

dataRow = dataRow';
if exist('indx', 'var') ~= 1
    indx = 1;
end

csvDataMatrix(indx, :) = dataRow;
indx = indx + 1; % indx var for csv row increment
if(indx == 9)
    writematrix(csvDataMatrix,'dataEntry_modifiedT.csv','Delimiter','comma')
end