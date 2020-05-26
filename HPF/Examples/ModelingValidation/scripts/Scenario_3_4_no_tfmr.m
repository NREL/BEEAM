% MATLAB post processing scripts
% using the output mat file to run the post processing analysis.
%
% For now sticking with OpenModelica and Dymola.
%
% TODO: add harmonic vector for easy harmonics plotting.



%% script initializations
addpath('../../../Utilities/external_lib/lib')

% if scenario variable exists, skip
% this means one is running the external run script.
% one would iterate the variable and run all the sims.
if exist('modelicaSim', 'var') ~= 1
    %% defining variables:
    scenario = 3;
    dataSet = 2;

    modelicaSim = ['Scenario_', num2str(scenario), '_Data_Set_', num2str(scenario), ...
                    '_', num2str(dataSet)];
    close all            
end

modelicaWorkingDir = '/home/avpreetsingh/OpenModelica_workspace/';
% file path for OpenModelica mat file
matFile_path = [modelicaWorkingDir, 'HPF.Examples.ModelingValidation.NoTfmr.', ...
            modelicaSim, '/HPF.Examples.ModelingValidation.NoTfmr.', ...
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
% converters. These are common to all scenarios
LaptopCharger_3 = AC2DC_converter_1ph(numHrm, res.Laptop_Charger_3);
LaptopCharger_4 = AC2DC_converter_1ph(numHrm, res.Laptop_Charger_4);
LaptopCharger_5 = AC2DC_converter_1ph(numHrm, res.Laptop_Charger_5);
LedDriver_1 = AC2DC_converter_1ph(numHrm, res.LED_Driver_1);
LedDriver_2 = AC2DC_converter_1ph(numHrm, res.LED_Driver_2);
LedDriver_3 = AC2DC_converter_1ph(numHrm, res.LED_Driver_3);
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

%% system losses -----
% Output DC power for converters
DC_power = LaptopCharger_3.DC.P + LaptopCharger_4.DC.P + LaptopCharger_5.DC.P + ...
            LedDriver_1.DC.P + LedDriver_2.DC.P + LedDriver_3.DC.P;

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



%% Line powers 
% for scenarios 3 and 4, line powers are tricky..
% creating this overly complicated way of finding line powers for each data set
linePwr = struct(); % line powers simulation structure
if dataSet == 1 || (scenario == 3 && dataSet == 2)
    linePwr.sim.phA = LedDriver_1.AC.P + LaptopCharger_3.AC.P;
    linePwr.sim.phB = LedDriver_2.AC.P + LaptopCharger_4.AC.P;
    linePwr.sim.phC = LedDriver_3.AC.P + LaptopCharger_5.AC.P;
    % output DC power + heater output
    outputPower = DC_power;
elseif scenario == 3 
    if dataSet == 3
        Heater_1_A = twoPin_device(numHrm, res.Heater_1_A);
        Heater_1_B = twoPin_device(numHrm, res.Heater_1_B);
        Heater_1_C = twoPin_device(numHrm, res.Heater_1_C);
        linePwr.sim.phA = LedDriver_1.AC.P + LaptopCharger_3.AC.P + ...
                            Heater_1_A.P;
        linePwr.sim.phB = LedDriver_2.AC.P + LaptopCharger_4.AC.P + ...
                            Heater_1_B.P;
        linePwr.sim.phC = LedDriver_3.AC.P + LaptopCharger_5.AC.P + ...
                            Heater_1_C.P;
        outputPower = DC_power + Heater_1_A.P + Heater_1_B.P + Heater_1_C.P;
    elseif dataSet == 4
        Heater_2_A = twoPin_device(numHrm, res.Heater_2_A);
        Heater_2_B = twoPin_device(numHrm, res.Heater_2_B);
        Heater_2_C = twoPin_device(numHrm, res.Heater_2_C);
        linePwr.sim.phA = LedDriver_1.AC.P + LaptopCharger_3.AC.P + ...
                            Heater_2_A.P;
        linePwr.sim.phB = LedDriver_2.AC.P + LaptopCharger_4.AC.P + ...
                            Heater_2_B.P;
        linePwr.sim.phC = LedDriver_3.AC.P + LaptopCharger_5.AC.P + ...
                            Heater_2_C.P;
        outputPower = DC_power + Heater_2_A.P + Heater_2_B.P + Heater_2_C.P;                
    end
elseif scenario == 4
    if dataSet == 2
        Heater_1_A = twoPin_device(numHrm, res.Heater_1_A);
        Heater_2_A = twoPin_device(numHrm, res.Heater_2_A);
        Heater_1_C = twoPin_device(numHrm, res.Heater_1_C);
        Heater_2_C = twoPin_device(numHrm, res.Heater_2_C);
        linePwr.sim.phA = LedDriver_1.AC.P + LaptopCharger_3.AC.P + ...
                            Heater_1_A.P + Heater_2_A.P;
        linePwr.sim.phB = LedDriver_2.AC.P + LaptopCharger_4.AC.P;
        linePwr.sim.phC = LedDriver_3.AC.P + LaptopCharger_5.AC.P + ...
                            Heater_1_C.P + Heater_2_C.P;
        outputPower = DC_power + Heater_1_A.P + Heater_2_A.P + Heater_1_C.P + ...
                    Heater_2_C.P;
    elseif dataSet == 3
        Heater_1_A = twoPin_device(numHrm, res.Heater_1_A);
        Heater_2_B = twoPin_device(numHrm, res.Heater_2_B);
        Heater_1_C = twoPin_device(numHrm, res.Heater_1_C);
        Heater_2_C = twoPin_device(numHrm, res.Heater_2_C);
        linePwr.sim.phA = LedDriver_1.AC.P + LaptopCharger_3.AC.P + ...
                            Heater_1_A.P;
        linePwr.sim.phB = LedDriver_2.AC.P + LaptopCharger_4.AC.P + ...
                            Heater_2_B.P;
        linePwr.sim.phC = LedDriver_3.AC.P + LaptopCharger_5.AC.P + ...
                            Heater_1_C.P + Heater_2_C.P;
        outputPower = DC_power + Heater_1_A.P + Heater_2_B.P + Heater_1_C.P + ...
                    Heater_2_C.P;                
    elseif dataSet == 4
        Heater_1_A = twoPin_device(numHrm, res.Heater_1_A);
        Heater_2_A = twoPin_device(numHrm, res.Heater_2_A);
        Heater_2_B = twoPin_device(numHrm, res.Heater_2_B);
        linePwr.sim.phA = LedDriver_1.AC.P + LaptopCharger_3.AC.P + ...
                            Heater_1_A.P + Heater_2_A.P;
        linePwr.sim.phB = LedDriver_2.AC.P + LaptopCharger_4.AC.P + ...
                            Heater_2_B.P;
        linePwr.sim.phC = LedDriver_3.AC.P + LaptopCharger_5.AC.P;
        outputPower = DC_power + Heater_1_A.P + Heater_2_A.P + Heater_2_B.P;
    end
end

disp('-----------------------')
% input power 
disp(['System losses'])
disp(['Input power:        ', num2str(inputVoltageSource.P), ' W']);
disp(['Output DC power:    ', num2str(DC_power), ' W']);
disp(['Output Power:       ', num2str(outputPower), ' W'])
% System losses
disp(['System Losses:      ', num2str(inputVoltageSource.P - outputPower), ' W']);

disp('------ Line powers (sim) ----------')
fprintf('PhA : %f\n', linePwr.sim.phA)
fprintf('PhB : %f\n', linePwr.sim.phB)
fprintf('PhC : %f\n', linePwr.sim.phC)
fprintf('Total : %f W\n', linePwr.sim.phA + linePwr.sim.phB + linePwr.sim.phC)

%% get measured data
msrData = struct();
fileName = tmp_getDataDir(scenario, dataSet);
msrData.sec.phA = getLineData(fileName, 'A', 'secondary');
msrData.sec.phB = getLineData(fileName, 'B', 'secondary');
msrData.sec.phC = getLineData(fileName, 'C', 'secondary');

disp('------ Line powers (msr) ----------')
fprintf('PhA : %f\n', sum(real(msrData.sec.phA.v.cmplx .* conj(msrData.sec.phA.i.cmplx))));
fprintf('PhB : %f\n', sum(real(msrData.sec.phB.v.cmplx .* conj(msrData.sec.phB.i.cmplx))));
fprintf('PhC : %f\n', sum(real(msrData.sec.phC.v.cmplx .* conj(msrData.sec.phC.i.cmplx))));

%% errors 
linePwr.msr.phA = sum(real(msrData.sec.phA.v.cmplx .* conj(msrData.sec.phA.i.cmplx)));
linePwr.msr.phB = sum(real(msrData.sec.phB.v.cmplx .* conj(msrData.sec.phB.i.cmplx)));
linePwr.msr.phC = sum(real(msrData.sec.phC.v.cmplx .* conj(msrData.sec.phC.i.cmplx)));
linePwr.msr.total = linePwr.msr.phA + linePwr.msr.phB + linePwr.msr.phC;
linePwr.sim.total = linePwr.sim.phA + linePwr.sim.phB + linePwr.sim.phC;

err = struct();
err.phA = linePwr.msr.phA - linePwr.sim.phA;
err.phB = linePwr.msr.phB - linePwr.sim.phB;
err.phC = linePwr.msr.phC - linePwr.sim.phC;
err.total = err.phA + err.phB + err.phC;

fprintf('Total : %f W\n', linePwr.msr.total)

disp('------- Errors ---------')
fprintf('PhA :   %f %%\n', (err.phA/linePwr.msr.phA)*100)
fprintf('PhB :   %f %%\n', (err.phB/linePwr.msr.phB)*100)
fprintf('PhC :   %f %%\n', (err.phC/linePwr.msr.phC)*100)
fprintf('Total : %f %%\n', ((linePwr.msr.total - linePwr.sim.total)/linePwr.msr.total)*100)

convLosses = LaptopCharger_3.Ploss + LaptopCharger_4.Ploss + ...
            LaptopCharger_5.Ploss + LedDriver_1.Ploss + ...
            LedDriver_2.Ploss +  LedDriver_3.Ploss;
disp('------- Converter loss Errors ---------')
fprintf('Msr loss :   %f W\n', linePwr.msr.total - outputPower)
fprintf('Sim loss :   %f W\n', linePwr.sim.total - outputPower)
err.totalLosses = (linePwr.msr.total - outputPower) - (linePwr.sim.total - outputPower);
fprintf('Loss Error : %f %%\n', err.totalLosses/ (linePwr.msr.total - outputPower)*100)
err.totalLosses_pc = err.totalLosses/ (linePwr.msr.total - outputPower)*100;
disp('------- Converter loss Errors (Only DC Power) ---------')
fprintf('Msr loss :   %f W\n', linePwr.msr.total - DC_power)
fprintf('Sim loss :   %f W\n', linePwr.sim.total - DC_power)
err.convLosses = (linePwr.msr.total - DC_power) - (linePwr.sim.total - DC_power);
fprintf('Loss Error : %f %%\n', err.convLosses/ (linePwr.msr.total - DC_power)*100)
err.convLosses_pc = err.convLosses/ (linePwr.msr.total - DC_power)*100;

figure
stem(h, iMsr.trfmrSec.phA.i.mag);
tmp = msrData.sec.phA.i.mag(1:2:h(end));
hold on
grid on
stem(h, tmp)