% MATLAB post processing scripts
% using the output mat file to run the post processing analysis.
%
% For now sticking with OpenModelica and Dymola.
%
% Scenario 1-2


%% script initializations
addpath('../../lib')

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

%modelicaWorkingDir = '/home/avpreetsingh/OpenModelica_workspace/';
% using modelic working directory from linux virtual machine
modelicaWorkingDir = '/media/avpreetsingh/Misc/tmp/openmodelica_wrkspc/';
% file path for OpenModelica mat file
matFile_path = ['./HPF.Examples.ModelingValidation.', ...
            modelicaSim, '_res.mat'];

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


% plotting 
figure
subplot(2, 1, 1)
plot(inputVoltageSource.phA.v.wv)
hold on
plot(inputVoltageSource.phB.v.wv)
plot(inputVoltageSource.phC.v.wv)
legend('Ph A', 'Ph B', 'Ph C')
subplot(2, 1, 2)
plot(inputVoltageSource.phA.i.wv)
hold on
plot(inputVoltageSource.phB.i.wv)
plot(inputVoltageSource.phC.i.wv)
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
% System losses
disp(['System Losses:      ', num2str(inputVoltageSource.P - DC_power), ' W']);

%% get measured data
msrData = struct();
fileName = tmp_getDataDir(scenario, dataSet); % get directory for measured data
msrData.prim.phA = getLineData(fileName, 'A', 'primary');
msrData.prim.phB = getLineData(fileName, 'B', 'primary');
msrData.prim.phC = getLineData(fileName, 'C', 'primary');
msrData.sec.phA = getLineData(fileName, 'A', 'secondary');
msrData.sec.phB = getLineData(fileName, 'B', 'secondary');
msrData.sec.phC = getLineData(fileName, 'C', 'secondary');

linePwr = struct();
% primary 
linePwr.sim.prim.total = inputVoltageSource.P;
% secondary
linePwr.msr.sec.phA = sum(real(msrData.sec.phA.v.cmplx .* conj(msrData.sec.phA.i.cmplx)));
linePwr.msr.sec.phB = sum(real(msrData.sec.phB.v.cmplx .* conj(msrData.sec.phB.i.cmplx)));
linePwr.msr.sec.phC = sum(real(msrData.sec.phC.v.cmplx .* conj(msrData.sec.phC.i.cmplx)));
linePwr.sim.sec.phA = LedDriver_1.AC.P + PowerSupply_1.AC.P + LaptopCharger_3.AC.P;
linePwr.sim.sec.phB = LedDriver_2.AC.P + PowerSupply_2.AC.P + LaptopCharger_4.AC.P;
linePwr.sim.sec.phC = LedDriver_3.AC.P + PowerSupply_3.AC.P + LaptopCharger_5.AC.P;
linePwr.msr.sec.total = linePwr.msr.sec.phA + linePwr.msr.sec.phB + linePwr.msr.sec.phC;
linePwr.sim.sec.total = linePwr.sim.sec.phA + linePwr.sim.sec.phB + linePwr.sim.sec.phC;

%% Line powers
disp('------ Line powers (sim) ----------')
fprintf('PhA : %f\n', linePwr.sim.sec.phA )
fprintf('PhB : %f\n', linePwr.sim.sec.phB )
fprintf('PhC : %f\n', linePwr.sim.sec.phC )
fprintf('Total : %f W\n', linePwr.sim.sec.total)

disp('------ Line powers (msr) ----------')
fprintf('PhA : %f\n', sum(real(msrData.sec.phA.v.cmplx .* conj(msrData.sec.phA.i.cmplx))));
fprintf('PhB : %f\n', sum(real(msrData.sec.phB.v.cmplx .* conj(msrData.sec.phB.i.cmplx))));
fprintf('PhC : %f\n', sum(real(msrData.sec.phC.v.cmplx .* conj(msrData.sec.phC.i.cmplx))));
fprintf('Total : %f W\n', linePwr.sim.sec.total)

%% errors 
% err = struct();
% err.phA = linePwr.msr.phA - linePwr.sim.phA;
% err.phB = linePwr.msr.phB - linePwr.sim.phB;
% err.phC = linePwr.msr.phC - linePwr.sim.phC;
% err.total = err.phA + err.phB + err.phC;
% 
% disp('------- Errors ---------')
% fprintf('PhA :   %f %%\n', (err.phA/linePwr.msr.phA)*100)
% fprintf('PhB :   %f %%\n', (err.phB/linePwr.msr.phB)*100)
% fprintf('PhC :   %f %%\n', (err.phC/linePwr.msr.phC)*100)
% fprintf('Total : %f %%\n', ((linePwr.msr.total - linePwr.sim.total)/linePwr.msr.total)*100)
% disp('------- Converter loss Errors ---------')
% fprintf('Msr loss :   %f W\n', linePwr.msr.total - DC_power)
% fprintf('Sim loss :   %f W\n', linePwr.sim.total - DC_power)
% err.convLosses = (linePwr.msr.total - DC_power) - (linePwr.sim.total - DC_power);
% fprintf('Loss Error : %f %%\n', err.convLosses/ (linePwr.msr.total - DC_power)*100)
% err.convLosses_pc = err.convLosses/ (linePwr.msr.total - DC_power)*100;

%% data entry 
convLosses = LaptopCharger_3.Ploss + LaptopCharger_4.Ploss + ...
            LaptopCharger_5.Ploss + LedDriver_1.Ploss + ...
            LedDriver_2.Ploss +  LedDriver_3.Ploss + ...
            PowerSupply_1.Ploss + PowerSupply_2.Ploss + ...
            PowerSupply_3.Ploss;

%% comparing waveforms
% get measured waveform data
msrData.prim.phA.wvData = getLineData(fileName, 'A', 'primary', 'waveform');
msrData.prim.phB.wvData = getLineData(fileName, 'B', 'primary', 'waveform');
msrData.prim.phC.wvData = getLineData(fileName, 'C', 'primary', 'waveform');
msrData.sec.phA.wvData = getLineData(fileName, 'A', 'secondary', 'waveform');
msrData.sec.phB.wvData = getLineData(fileName, 'B', 'secondary', 'waveform');
msrData.sec.phC.wvData = getLineData(fileName, 'C', 'secondary', 'waveform');

%%

% phase shifting
% Waveforms from the measurements were not aligned with the simulation.
% performing necessary phase shits on the simulated data
N = 257;
% struct for phase corrected simulation time domain waveform
simData = struct();
tmpPhAdj_phA = phaseShift(inputVoltageSource.phA.i.arg, h, deg2rad(-120));
simData.prim.phA.i.wv = getTimeWvform(inputVoltageSource.phA.i.mag, tmpPhAdj_phA, N);
tmpPhAdj_phB = phaseShift(inputVoltageSource.phB.i.arg, h, deg2rad(-120));
simData.prim.phB.i.wv = getTimeWvform(inputVoltageSource.phB.i.mag, tmpPhAdj_phB, N);
tmpPhAdj_phC = phaseShift(inputVoltageSource.phC.i.arg, h, deg2rad(-120));
simData.prim.phC.i.wv = getTimeWvform(inputVoltageSource.phC.i.mag, tmpPhAdj_phC, N);
% time data from the measurements is in a weird decreasing order starting 
% at -0.5 seconds. Correcting time data.
wv_time = msrData.prim.phA.wvData.time - msrData.prim.phA.wvData.time(1);

figure
% primary
subplot(3, 2, 1)
plot(wv_time, msrData.prim.phA.wvData.wv.i)
hold on
plot(wv_time, simData.prim.phA.i.wv)
legend('Measured', 'Simulation')
title('Phase A, primary (current)')
ylabel('Current (A)')
grid on

subplot(3, 2, 3)
plot(wv_time, msrData.prim.phB.wvData.wv.i)
hold on
plot(wv_time, simData.prim.phB.i.wv)
legend('Measured', 'Simulation')
title('Phase B, primary (current)')
grid on

subplot(3, 2, 5)
plot(wv_time, msrData.prim.phC.wvData.wv.i)
hold on
plot(wv_time, simData.prim.phC.i.wv)
legend('Measured', 'Simulation')
title('Phase C, primary (current)')
xlabel('Time (seconds)')
ylabel('Current (A)')
grid on

% secondary
% reading secondary side current from transformer secondary winding impedance
simData.sec.phA = twoPin_device(numHrm, res.deltaWye.T1.Zs);
simData.sec.phB = twoPin_device(numHrm, res.deltaWye.T2.Zs);
simData.sec.phC = twoPin_device(numHrm, res.deltaWye.T3.Zs);
% phase adjust on simulated data
tmpPhAdj_phA = phaseShift(simData.sec.phA.i.arg, h, deg2rad(0));
simData.sec.phA.i.wv = getTimeWvform(simData.sec.phA.i.mag, tmpPhAdj_phA, N);
tmpPhAdj_phB = phaseShift(simData.sec.phB.i.arg, h, deg2rad(120));
simData.sec.phB.i.wv = getTimeWvform(simData.sec.phB.i.mag, tmpPhAdj_phB, N);
tmpPhAdj_phC = phaseShift(simData.sec.phC.i.arg, h, deg2rad(-120));
simData.sec.phC.i.wv = getTimeWvform(simData.sec.phC.i.mag, tmpPhAdj_phC, N);

subplot(3, 2, 2)
plot(wv_time, msrData.sec.phA.wvData.wv.i)
hold on
plot(wv_time, simData.sec.phA.i.wv)
legend('Measured', 'Simulation')
title('Phase A, secondary (current)')
ylabel('Current (A)')
grid on

subplot(3, 2, 4)
plot(wv_time, msrData.sec.phB.wvData.wv.i)
hold on
plot(wv_time, simData.sec.phB.i.wv)
legend('Measured', 'Simulation')
title('Phase B, secondary (current)')
ylabel('Current (A)')
grid on

subplot(3, 2, 6)
plot(wv_time, msrData.sec.phC.wvData.wv.i)
hold on
plot(wv_time, simData.sec.phC.i.wv)
legend('Measured', 'Simulation')
title('Phase C, secondary (current)')
xlabel('Time (seconds)')
ylabel('Current (A)')
grid on

%% averaging over three phases
% overall harmonic content validation
avgData = struct();
avgData.msr.prim.i.mag = mean([msrData.prim.phA.i.mag(h), msrData.prim.phB.i.mag(h), ...
                            msrData.prim.phC.i.mag(h)], 2);
                        
avgData.sim.prim.i.mag = mean([inputVoltageSource.phA.i.mag', inputVoltageSource.phB.i.mag', ...
                        inputVoltageSource.phC.i.mag'], 2);
% plotting harmonics
figure
stem(h, avgData.msr.prim.i.mag)
hold on
stem(h, avgData.sim.prim.i.mag)
title('Harmoncis - Average over three phases')
xlabel('Harmoncis')
ylabel('Current (A rms)')
legend('Measured', 'Simulation')

% plotting waveform
% using measured harmonic phase angles
avgData.msr.prim.i.wv = getTimeWvform(avgData.msr.prim.i.mag, msrData.prim.phA.i.arg(h), N);
avgData.sim.prim.i.wv = getTimeWvform(avgData.sim.prim.i.mag, msrData.prim.phA.i.arg(h), N);

figure
plot(wv_time, avgData.msr.prim.i.wv)
hold on
plot(wv_time, avgData.sim.prim.i.wv)
grid on
xlabel('Time (seconds)')
ylabel('Current (A)')
title('Time domain waveform - Average')
legend('Measured', 'Simulation')








