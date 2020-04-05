% MATLAB post processing scripts
% using the output mat file to run the post processing analysis.
%
% For now sticking with OpenModelica and Dymola.
%
% TODO: add harmonic vector for easy harmonics plotting.

close all

%% script initializations
addpath('./lib')

% if scenario variable exists, skip
% this means one is running the external run script.
% one would iterate the variable and run all the scenarios.
if exist('scenario', 'var') ~= 1
    sims ={'Scenario_1_Data_Set_1_1';      % 1
            'Scenario_1_Data_Set_1_2';      % 2
            'Scenario_1_Data_Set_1_3';      % 3
            'Scenario_1_Data_Set_1_4';      % 4
            'Scenario_2_Data_Set_2_1';      % 5 
            'Scenario_2_Data_Set_2_2';      % 6
            'Scenario_2_Data_Set_2_3';      % 7
            'Scenario_2_Data_Set_2_4'};     % 8
    sim_i = 7; % i th simulation
end
        
modelicaWorkingDir = '/home/avpreetsingh/OpenModelica_workspace/';
% file path for OpenModelica mat file
matFile_path = [modelicaWorkingDir, 'HPF.Examples.ModelingValidation.NoTfmr.', ...
            scenarios{sim_i}, '/HPF.Examples.ModelingValidation.NoTfmr.', ...
            scenarios{sim_i}, '_res.mat'];

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

% measurement device
iMsr = struct();
vMsr = struct();

vMsr.trfmrSec.phA = twoPin_device(numHrm, res.vMsr_Sec_phA);
vMsr.trfmrSec.phB = twoPin_device(numHrm, res.vMsr_Sec_phB);
vMsr.trfmrSec.phC = twoPin_device(numHrm, res.vMsr_Sec_phC);

iMsr.trfmrSec.phA = twoPin_device(numHrm, res.iMsr_Sec_phA);
iMsr.trfmrSec.phB = twoPin_device(numHrm, res.iMsr_Sec_phB);
iMsr.trfmrSec.phC = twoPin_device(numHrm, res.iMsr_Sec_phC);

% plotting 
figure
plot(inputVoltageSource.phA.v.wv)
hold on
plot(inputVoltageSource.phB.v.wv)
plot(inputVoltageSource.phC.v.wv)
legend('Ph A', 'Ph B', 'Ph C')
% plotting tfmr sec voltage
figure
plot(vMsr.trfmrSec.phA.v.wv)
hold on
plot(vMsr.trfmrSec.phB.v.wv)
plot(vMsr.trfmrSec.phC.v.wv)
legend('Ph A', 'Ph B', 'Ph C')


figure
plot(PowerSupply_2.AC.i.wv)
legend('Power Supply 2')


%% system losses -----
% Output DC power for converters
DC_power = LaptopCharger_3.DC.P + LaptopCharger_4.DC.P + LaptopCharger_5.DC.P + ...
            LedDriver_1.DC.P + LedDriver_2.DC.P + LedDriver_3.DC.P + ...
            PowerSupply_1.DC.P + PowerSupply_2.DC.P + PowerSupply_3.DC.P;

disp( ' ========================================')        
disp([' Results for:  ', scenarios{sim_i}]) 
disp( ' ========================================')
disp(['Output DC power:    ', num2str(DC_power), ' W']);
% converter losses 
disp('Converter losses ------')
disp(['Laptop_Charger_3:   ', num2str(LaptopCharger_3.Ploss), ' W']);
disp(['Laptop_Charger_4:   ', num2str(LaptopCharger_4.Ploss), ' W']);
disp(['Laptop_Charger_5:   ', num2str(LaptopCharger_5.Ploss), ' W']);
disp(['LED_Driver_1:       ', num2str(LedDriver_1.Ploss), ' W']);
disp(['LED_Driver_2:       ', num2str(LedDriver_2.Ploss), ' W']);
disp(['LED_Driver_3:       ', num2str(LedDriver_3.Ploss), ' W']);
disp(['Power_Supply_1:     ', num2str(PowerSupply_1.Ploss), ' W']);
disp(['Power_Supply_2:     ', num2str(PowerSupply_2.Ploss), ' W']);
disp(['Power_Supply_3:     ', num2str(PowerSupply_3.Ploss), ' W']);
disp('-----------------------')
% input power 
disp(['System losses'])
disp(['Input power:        ', num2str(inputVoltageSource.P), ' W']);
disp(['Output DC power:    ', num2str(DC_power), ' W']);
% System losses
disp(['System Losses:      ', num2str(inputVoltageSource.P - DC_power), ' W']);

%% plotting harmonics
figure
subplot(2,1,1)
stem(h, LaptopCharger_4.AC.v.mag)
grid on
ylabel('Voltage (volts)')
subplot(2,1,2)
stem(h, LaptopCharger_4.AC.i.mag)
grid on
ylabel('Current (amps)')
xlabel('Harmonics')
%% Analyzing power 
% laptop charger
v = LaptopCharger_4.AC.v.wv;
i = LaptopCharger_4.AC.i.wv;
T = 1/60;
dt = 1 / (1302 * 60);   % dt = 1/fs = 1 / (f * N)
t = 0:dt:T;
t = t(1:end-1);
% plotting waveforms
figure
subplot(2,1,1)
plot(t, v)
grid on
ylabel('Voltage (volts)')
subplot(2,1,2)
plot(t, i)
grid on
ylabel('Current (amps)')
xlabel('Time (seconds)')
%% futher power analysis
Pavg = (1/T)*trapz(t, v.*i);
disp('-----------------------')
disp(['Laptop charger 4 - Power Analysis'])
disp(['Average power (time-domain): ', num2str(Pavg), ' W'])
disp(['Average power (HPF):         ', num2str(LaptopCharger_4.AC.P), ' W'])

%% Data from actual measurements...
msrData_summaryFilePath = '/media/avpreetsingh/Documents/Research/DC Design Tool/Google Drive/Notional Setup - Phase 2B/Test Data/Scenarios Combined/';
summaryFileName = 'Scenario';

%% Generating csv files for data entry
% defining columns for each device, All powers are real
% AC input power | DC output power | Loss

dataRow = [ % Laptop charger 3
            LaptopCharger_3.AC.P;
            LaptopCharger_3.DC.P;
            LaptopCharger_3.AC.P - LaptopCharger_3.DC.P;
            % Laptop charger 4
            LaptopCharger_4.AC.P;
            LaptopCharger_4.DC.P;
            LaptopCharger_4.AC.P - LaptopCharger_4.DC.P;
            % Laptop charger 5
            LaptopCharger_5.AC.P;
            LaptopCharger_5.DC.P;
            LaptopCharger_5.AC.P - LaptopCharger_5.DC.P;
            % LED 1
            LedDriver_1.AC.P;
            LedDriver_1.DC.P;
            LedDriver_1.AC.P - LedDriver_1.DC.P;
            % LED 2
            LedDriver_2.AC.P;
            LedDriver_2.DC.P;
            LedDriver_2.AC.P - LedDriver_2.DC.P;
            % LED 3
            LedDriver_3.AC.P;
            LedDriver_3.DC.P;
            LedDriver_3.AC.P - LedDriver_3.DC.P;
            % Power supply 1
            PowerSupply_1.AC.P;
            PowerSupply_1.DC.P;
            PowerSupply_1.AC.P - PowerSupply_1.DC.P;
            % Power supply 2
            PowerSupply_2.AC.P;
            PowerSupply_2.DC.P;
            PowerSupply_2.AC.P - PowerSupply_2.DC.P;
            % Power supply 3
            PowerSupply_3.AC.P;
            PowerSupply_3.DC.P;
            PowerSupply_3.AC.P - PowerSupply_3.DC.P;
            % Input power
            inputVoltageSource.P
            % output power
            DC_power
            % total loss
            inputVoltageSource.P - DC_power
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






