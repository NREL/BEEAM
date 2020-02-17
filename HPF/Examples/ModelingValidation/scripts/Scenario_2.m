% MATLAB test scripts
% Using MATLAB with Modelica environments is difficult as there are numerous 
% tools. An easier and more efficient way is to simulate Modelica model and
% use the output mat file to run the post processing analysis.
%
% For now sticking with OpenModelica and Dymola.
%
% Testing sensors and rectifier
%

%% script initializations
addpath('./lib')

% model name
modelName = 'Scenario_1';
%% file path for OpenModelica mat file
matFile_path = '/home/avpreetsingh/OpenModelica_workspace/HPF.Examples.ModelingValidation.Scenario_2/HPF.Examples.ModelingValidation.Scenario_2_res.mat';
%% file path for Dymola mat file
% matFile_path = ''

res = modelicaImport(matFile_path);

% getting data from all the devices
h = res.systemDef.numHrm;

% input voltage
inputVoltage = voltageSrc_3ph(h, res.voltageSource);

% converters
LaptopCharger_1 = AC2DC_converter_1ph(h, res.Laptop_charger_3);
LedDriver_1 = AC2DC_converter_1ph(h, res.LED_Driver_2);
PowerSupply_1 = AC2DC_converter_1ph(h, res.Power_Supply_1);


