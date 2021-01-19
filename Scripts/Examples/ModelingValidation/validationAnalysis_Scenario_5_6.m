
% analysis for validation scenarios 5 and 6

% Author: Avpreet Othee (avpreetsingh@hotmail.com)
% 

%% script initializations
addpath('../../lib')

% if scenario variable exists, skip
% this means one is running the external run script.
% one would iterate the variable and run all the sims.
if exist('modelicaSim', 'var') ~= 1
    %% defining variables:
    scenario = 5;
    dataSet = 3;

    modelicaSim = ['Scenario_', num2str(scenario), '_Data_Set_', num2str(scenario), ...
                    '_', num2str(dataSet)];
    close all            
end

% file path for Modelica mat file
matFile_path = ['./HPF.Examples.ModelingValidation.', ...
            modelicaSim, '_res.mat'];
        
%% load Modelica results file
% speedup execution, prevents reloading matfile everytime.
% to load mat file, clear all the variables using 'clear'
if exist('res', 'var') ~= 1 || exist('loadOk', 'var') == 1
    res = modelicaImport(matFile_path);
end

% correction ---------------
% There is a bug in the 'modelicaImport.m' function. It fails to populate the varaible
% voltageSource.vSrc_phC.v
tmpVar = tmp_getModelicaVar_cmplxVect(matFile_path, 'voltageSource.vSrc_phC.v');
res.voltageSource.vSrc_phC.v = tmpVar;

numHrm = res.systemDef.numHrm;      % number of harmonics
h = res.systemDef.hrms;             % system harmonics

%% 
% input 
inputVoltageSource = voltageSrc_3ph(numHrm, res.voltageSource);
% converters
NextekHub = AC2DC_converter_1ph(numHrm, res.NextekHub);

linePwr = struct();
linePwr.sim.sec.total = 0;


%% system losses -----
% Output DC power 
DC_power = res.Laptop_4.pwr + res.Laptop_5.pwr + res.Laptop_6.pwr;

try
    DC_power = DC_power + res.LumpedDCLoads.pwr;
catch 
    
end
% primary 
linePwr.sim.prim.total = inputVoltageSource.P;
% % secondary
linePwr.sim.sec.total = NextekHub.AC.P;

convLosses = NextekHub.Ploss;
%%
disp( ' ========================================')        
disp([' Results for:  ', modelicaSim]) 
disp( ' ========================================')
disp(['Input power:      ', num2str(linePwr.sim.prim.total  ), ' W']);
disp(['Secondary power:  ', num2str(linePwr.sim.sec.total), ' W']);
disp(['DC Power (Pout):  ', num2str(DC_power), ' W']);


