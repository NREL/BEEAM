% MATLAB post processing scripts
% using the output mat file to run the post processing analysis.
%
% For now sticking with OpenModelica and Dymola.
%
% TODO: add harmonic vector for easy harmonics plotting.
% Scenario 1-2
% 

%% script initializations
addpath('./lib')

% if scenario variable exists, skip
% this means one is running the external run script.
% one would iterate the variable and run all the sims.
if exist('modelicaSim', 'var') ~= 1
    %% defining variables:
    scenario = 2;
    dataSet = 3;

    modelicaSim = ['Scenario_', num2str(scenario), '_Data_Set_', num2str(scenario), ...
                    '_', num2str(dataSet)];
    close all            
end

modelicaWorkingDir = '/home/avpreetsingh/OpenModelica_workspace/';
% file path for OpenModelica mat file
matFile_path = [modelicaWorkingDir, 'HPF.Examples.ModelingValidation.', ...
            modelicaSim, '/HPF.Examples.ModelingValidation.', ...
            modelicaSim, '_res.mat'];

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
disp([' Results for:  ', modelicaSim]) 
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
% transformer losses
losses = struct();
tmp = (vMsr.trfmrSec.phA.v.cmplx .* iMsr.trfmrSec.phA.i.cmplx) + ...
        (vMsr.trfmrSec.phB.v.cmplx .* iMsr.trfmrSec.phB.i.cmplx) + ...
        (vMsr.trfmrSec.phC.v.cmplx .* iMsr.trfmrSec.phC.i.cmplx);
losses.tfmr = inputVoltageSource.P - real(sum(tmp));
disp(['System Losses:      ', num2str(losses.tfmr), ' W']);
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


%% get measured data
msrData = struct();
fileName = tmp_getDataDir(scenario, dataSet);
msrData.sec.phA = getLineData(fileName, 'A', 'secondary');
msrData.sec.phB = getLineData(fileName, 'B', 'secondary');
msrData.sec.phC = getLineData(fileName, 'C', 'secondary');

linePwr = struct();
linePwr.msr.phA = sum(real(msrData.sec.phA.v.cmplx .* conj(msrData.sec.phA.i.cmplx)));
linePwr.msr.phB = sum(real(msrData.sec.phB.v.cmplx .* conj(msrData.sec.phB.i.cmplx)));
linePwr.msr.phC = sum(real(msrData.sec.phC.v.cmplx .* conj(msrData.sec.phC.i.cmplx)));
linePwr.sim.phA = LedDriver_1.AC.P + PowerSupply_1.AC.P + LaptopCharger_3.AC.P;
linePwr.sim.phB = LedDriver_2.AC.P + PowerSupply_2.AC.P + LaptopCharger_4.AC.P;
linePwr.sim.phC = LedDriver_3.AC.P + PowerSupply_3.AC.P + LaptopCharger_5.AC.P;
linePwr.msr.total = linePwr.msr.phA + linePwr.msr.phB + linePwr.msr.phC;
linePwr.sim.total = linePwr.sim.phA + linePwr.sim.phB + linePwr.sim.phC;

%% Line powers
disp('------ Line powers (sim) ----------')
fprintf('PhA : %f\n', linePwr.sim.phA )
fprintf('PhB : %f\n', linePwr.sim.phB )
fprintf('PhC : %f\n', linePwr.sim.phC )
fprintf('Total : %f W\n', linePwr.sim.phA + linePwr.sim.phB + linePwr.sim.phC)



disp('------ Line powers (msr) ----------')
fprintf('PhA : %f\n', sum(real(msrData.sec.phA.v.cmplx .* conj(msrData.sec.phA.i.cmplx))));
fprintf('PhB : %f\n', sum(real(msrData.sec.phB.v.cmplx .* conj(msrData.sec.phB.i.cmplx))));
fprintf('PhC : %f\n', sum(real(msrData.sec.phC.v.cmplx .* conj(msrData.sec.phC.i.cmplx))));
fprintf('Total : %f W\n', linePwr.msr.total)

%% errors 


err = struct();
err.phA = linePwr.msr.phA - linePwr.sim.phA;
err.phB = linePwr.msr.phB - linePwr.sim.phB;
err.phC = linePwr.msr.phC - linePwr.sim.phC;
err.total = err.phA + err.phB + err.phC;

disp('------- Errors ---------')
fprintf('PhA :   %f %%\n', (err.phA/linePwr.msr.phA)*100)
fprintf('PhB :   %f %%\n', (err.phB/linePwr.msr.phB)*100)
fprintf('PhC :   %f %%\n', (err.phC/linePwr.msr.phC)*100)
fprintf('Total : %f %%\n', ((linePwr.msr.total - linePwr.sim.total)/linePwr.msr.total)*100)
disp('------- Converter loss Errors ---------')
fprintf('Msr loss :   %f W\n', linePwr.msr.total - DC_power)
fprintf('Sim loss :   %f W\n', linePwr.sim.total - DC_power)
err.convLosses = (linePwr.msr.total - DC_power) - (linePwr.sim.total - DC_power);
fprintf('Loss Error : %f %%\n', err.convLosses/ (linePwr.msr.total - DC_power)*100)
err.convLosses_pc = err.convLosses/ (linePwr.msr.total - DC_power)*100;

%% data entry 
convLosses = LaptopCharger_3.Ploss + LaptopCharger_4.Ploss + ...
            LaptopCharger_5.Ploss + LedDriver_1.Ploss + ...
            LedDriver_2.Ploss +  LedDriver_3.Ploss + ...
            PowerSupply_1.Ploss + PowerSupply_2.Ploss + ...
            PowerSupply_3.Ploss;

figure
stem(h, iMsr.trfmrSec.phA.i.mag);
tmp = msrData.sec.phA.i.mag(1:2:h(end));
hold on
grid on
stem(h, tmp)





