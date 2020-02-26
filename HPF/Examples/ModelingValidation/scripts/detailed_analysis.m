% MATLAB post processing scripts
% using the output mat file to run the post processing analysis.
%
% For now sticking with OpenModelica and Dymola.
%
% TODO: add harmonic vector for easy harmonics plotting.

close all

%% script initializations
addpath('./lib')

scenarios = {'Scenario_2_Data_Set_2_3'};
scenario = 1;
        
modelicaWorkingDir = '/home/avpreetsingh/OpenModelica_workspace/';
% file path for OpenModelica mat file
matFile_path = [modelicaWorkingDir, 'HPF.Examples.ModelingValidation.', ...
            scenarios{scenario}, '/HPF.Examples.ModelingValidation.', ...
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

% measurement device
iMsr = struct();
vMsr = struct();
vMsr.trfmrSec.phA = twoPin_device(numHrm, res.vMsr_Sec_phA);
iMsr.trfmrSec.phA = twoPin_device(numHrm, res.iMsr_Sec_phA);
vMsr.trfmrSec.phB = twoPin_device(numHrm, res.vMsr_Sec_phB);

% plotting 
figure
plot(inputVoltageSource.phA.wv.v)
hold on
plot(inputVoltageSource.phB.wv.v)
plot(inputVoltageSource.phC.wv.v)
legend('Ph A', 'Ph B', 'Ph C')

figure
plot(PowerSupply_2.AC.wv.i)
legend('Power Supply 2')


%% system losses -----
% Output DC power for converters
DC_power = LaptopCharger_3.DC.P + LaptopCharger_4.DC.P + LaptopCharger_5.DC.P + ...
            LedDriver_1.DC.P + LedDriver_2.DC.P + LedDriver_3.DC.P + ...
            PowerSupply_1.DC.P + PowerSupply_2.DC.P + PowerSupply_3.DC.P;

disp( ' ========================================')        
disp([' Results for:  ', scenarios{scenario}]) 
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
stem(h, LaptopCharger_4.AC.V.mag)
grid on
ylabel('Voltage (volts)')
subplot(2,1,2)
stem(h, LaptopCharger_4.AC.I.mag)
grid on
ylabel('Current (amps)')
xlabel('Harmonics')
%% Analyzing power 
% laptop charger
v = LaptopCharger_4.AC.wv.v;
i = LaptopCharger_4.AC.wv.i;
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


%% measurements ================================================================

%% Measured  harmonics (transformer primary)
parentDir = '/media/avpreetsingh/Documents/Research/DC Design Tool/Google Drive/';
dataDir = 'Notional Setup - Phase 2/Test Data/Scenario 2/Data Set 2.3/Processed Data/';
msrHrmData = struct();
msrHrmData.run_1 = readmatrix([parentDir, dataDir, 'harmonics_run_1.csv']);
msrHrmData.run_2 = readmatrix([parentDir, dataDir, 'harmonics_run_2.csv']);
msrHrmData.run_3 = readmatrix([parentDir, dataDir, 'harmonics_run_3.csv']);
% voltage
msrHrmData.phA_prim.V.mag = msrHrmData.run_1(:, 2) ./ sqrt(3); % correct mag ph-ph -> ph-N 
msrHrmData.phA_prim.V.mag = msrHrmData.phA_prim.V.mag(1:2:2*numHrm);
msrHrmData.phA_prim.V.arg = wrapTo2Pi(deg2rad(msrHrmData.run_1(:, 3)));
msrHrmData.phA_prim.V.arg = phaseShift(msrHrmData.phA_prim.V.arg(1:2:2*numHrm), ...      % select only odd harmonics
                        h, msrHrmData.phA_prim.V.arg(1) - inputVoltageSource.phA.V.arg(1));   % phase shift to zero
% current
msrHrmData.phA_prim.I.mag = msrHrmData.run_1(:, 10); % correct mag ph-ph -> ph-N 
msrHrmData.phA_prim.I.mag = msrHrmData.phA_prim.I.mag(1:2:2*numHrm);
msrHrmData.phA_prim.I.arg = wrapTo2Pi(deg2rad(msrHrmData.run_1(:, 11)));
msrHrmData.phA_prim.I.arg = phaseShift(msrHrmData.phA_prim.I.arg(1:2:2*numHrm), ...      % select only odd harmonics
                        h, msrHrmData.phA_prim.I.arg(1) - inputVoltageSource.phA.I.arg(1));   % phase shift to zero
%% measured harmonics (secondary)
% voltage
msrHrmData.phA_sec.V.mag = msrHrmData.run_1(:, 8); 
msrHrmData.phA_sec.V.mag = msrHrmData.phA_sec.V.mag(1:2:2*numHrm);
msrHrmData.phA_sec.V.arg = wrapTo2Pi(deg2rad(msrHrmData.run_1(:, 9)));
msrHrmData.phA_sec.V.arg = phaseShift(msrHrmData.phA_sec.V.arg(1:2:2*numHrm), ...      % select only odd harmonics
                        h, msrHrmData.phA_sec.V.arg(1) - vMsr.trfmrSec.phA.V.arg(1));   % phase shift to zero
% current
msrHrmData.phA_sec.I.mag = msrHrmData.run_1(:, 16); % correct mag ph-ph -> ph-N 
msrHrmData.phA_sec.I.mag = msrHrmData.phA_sec.I.mag(1:2:2*numHrm);
msrHrmData.phA_sec.I.arg = wrapTo2Pi(deg2rad(msrHrmData.run_1(:, 17)));
msrHrmData.phA_sec.I.arg = phaseShift(msrHrmData.phA_sec.I.arg(1:2:2*numHrm), ...      % select only odd harmonics
                        h, msrHrmData.phA_sec.I.arg(1) - iMsr.trfmrSec.phA.I.arg(1));   % phase shift to zero

                    
N = 1302;
%% Plotting Measured  harmonics (transformer primary)
% voltage
figure
tmpMsr = struct();
tmpMsr.V.mag = zeros(numHrm*2, 1);
tmpMsr.V.mag(2:2:end) = msrHrmData.phA_prim.V.mag;
tmpMsr.V.arg = zeros(numHrm*2, 1);
tmpMsr.V.arg(2:2:end) = msrHrmData.phA_prim.V.arg;
plot(real(ifft(fftCoefReconstruct(tmpMsr.V.mag, tmpMsr.V.arg, N))))
hold on
plot(inputVoltageSource.phA.wv.v)
legend('Measurement', 'Simulation')
grid on
% current
figure
tmpMsr.I.mag = zeros(numHrm*2, 1);
tmpMsr.I.mag(2:2:end) = msrHrmData.phA_prim.I.mag;
tmpMsr.I.arg = zeros(numHrm*2, 1);
tmpMsr.I.arg(2:2:end) = msrHrmData.phA_prim.I.arg;
plot(real(ifft(fftCoefReconstruct(tmpMsr.I.mag, tmpMsr.I.arg, N))))
hold on
plot(inputVoltageSource.phA.wv.i)
legend('Measurement', 'Simulation')
grid on

%% plotting harmonics
% phase A primary
figure
stem(msrHrmData.phA_prim.I.mag)
hold on
stem(inputVoltageSource.phA.I.mag)
legend('Measurement', 'Simulation')
grid on
title('Phase A primary (current)')

figure
stem(msrHrmData.phA_sec.I.mag)
hold on
stem(iMsr.trfmrSec.phA.I.mag)
legend('Measurement', 'Simulation')
grid on
title('Phase A sec (current)')

figure
stem(msrHrmData.phA_sec.V.mag)
hold on
stem(vMsr.trfmrSec.phA.V.mag)
legend('Measurement', 'Simulation')
grid on
title('Phase A sec (voltage)')

%%
msrHrmData.phB_sec.V.mag = msrHrmData.run_2(:, 8); 
msrHrmData.phB_sec.V.mag = msrHrmData.phB_sec.V.mag(1:2:2*numHrm);

figure
stem(msrHrmData.phB_sec.V.mag)
hold on
stem(vMsr.trfmrSec.phB.V.mag)
legend('Measurement', 'Simulation')
grid on
title('Phase B sec (voltage)')


%% printing modelica vector 
phA_vMag = print_modelica_vector(msrHrmData.run_1(1:2:2*numHrm, 8));
phA_vArg = print_modelica_vector(wrapTo2Pi(deg2rad(msrHrmData.run_1(1:2:2*numHrm, 8))));
phB_vMag = print_modelica_vector(msrHrmData.run_2(1:2:2*numHrm, 8));
phB_vArg = print_modelica_vector(wrapTo2Pi(deg2rad(msrHrmData.run_2(1:2:2*numHrm, 8))));
phC_vMag = print_modelica_vector(msrHrmData.run_3(1:2:2*numHrm, 8));
phC_vArg = print_modelica_vector(wrapTo2Pi(deg2rad(msrHrmData.run_3(1:2:2*numHrm, 8))));

%% save waveform 
vDist = struct();
vDist.mag = zeros(2*numHrm, 1);
vDist.arg = vDist.mag;
vDist.mag(2:2:end) = vMsr.trfmrSec.phB.V.mag;
vDist.arg(2:2:end) = phaseShift(vMsr.trfmrSec.phB.V.arg', h, vMsr.trfmrSec.phB.V.arg(1));
vDist.waveform = real(ifft(fftCoefReconstruct(vDist.mag, vDist.arg, 1302)));