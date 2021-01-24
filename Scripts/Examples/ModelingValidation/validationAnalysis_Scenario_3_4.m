
% read from Results file
% file data description
a = readcell('HPF Model Validation Uncertainty Analysis.xlsx', ...
            'Sheet', 'Scenarios 3-4', 'range', 'AX2:BD11');

%% script initializations
addpath('../../lib')

% if scenario variable exists, skip
% this means one is running the external run script.
% one would iterate the variable and run all the sims.
if exist('modelicaSim', 'var') ~= 1
    %% defining variables:
    scenario = 4;
    dataSet = 4;

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
LaptopCharger_3 = AC2DC_converter_1ph(numHrm, res.Laptop_Charger_3);
LaptopCharger_4 = AC2DC_converter_1ph(numHrm, res.Laptop_Charger_4);
LaptopCharger_5 = AC2DC_converter_1ph(numHrm, res.Laptop_Charger_5);
LedDriver_1 = AC2DC_converter_1ph(numHrm, res.LED_Driver_1);
LedDriver_2 = AC2DC_converter_1ph(numHrm, res.LED_Driver_2);
LedDriver_3 = AC2DC_converter_1ph(numHrm, res.LED_Driver_3);

linePwr = struct();
linePwr.sim.sec.total = 0;
% using try catch. In scenarios 3 and 4, not all heaters are connected
% in all simulation runs. Use the try block, if present get the variable,
% otherwise skip
for k = 1:2
    for iterABC = {'A', 'B', 'C'}
        try 
            eval(['Heater_', num2str(k), cell2mat(iterABC),' = HarmonicPQLoad(h, res.Heater_', num2str(k), cell2mat(iterABC), ');'])
            %Heater_1A = HarmonicPQLoad(h, res.Heater_1A);
            %linePwr.sim.sec.total = Heater_1A.P;
            eval(['linePwr.sim.sec.total = linePwr.sim.sec.total + Heater_', ...
                num2str(k), cell2mat(iterABC), '.P;'])
            %disp(['Heater_', num2str(k), cell2mat(iterABC)])
            %eval(['Heater_', num2str(k), cell2mat(iterABC), '.P'])
        catch
        end
    end
end

%% system losses -----
% Output DC power for converters
DC_power = LaptopCharger_3.DC.P + LaptopCharger_4.DC.P + LaptopCharger_5.DC.P + ...
            LedDriver_1.DC.P + LedDriver_2.DC.P + LedDriver_3.DC.P;
        
% primary 
linePwr.sim.prim.total = inputVoltageSource.P;
% % secondary
linePwr.sim.sec.phA = LedDriver_1.AC.P + LaptopCharger_3.AC.P;
linePwr.sim.sec.phB = LedDriver_2.AC.P + LaptopCharger_4.AC.P;
linePwr.sim.sec.phC = LedDriver_3.AC.P + LaptopCharger_5.AC.P;
linePwr.sim.sec.total = linePwr.sim.sec.total + linePwr.sim.sec.phA + linePwr.sim.sec.phB + linePwr.sim.sec.phC;

convLosses = LaptopCharger_3.Ploss + LaptopCharger_4.Ploss + ...
            LaptopCharger_5.Ploss + LedDriver_1.Ploss + ...
            LedDriver_2.Ploss +  LedDriver_3.Ploss;
%%
disp( ' ========================================')        
disp([' Results for:  ', modelicaSim]) 
disp( ' ========================================')
disp(['Input power:      ', num2str(linePwr.sim.prim.total  ), ' W']);
disp(['Secondary power:  ', num2str(linePwr.sim.sec.total), ' W']);
