% MATLAB post processing scripts
% using the output mat file to run the post processing analysis.
%
% For now sticking with OpenModelica and Dymola.
%
% TODO: add harmonic vector for easy harmonics plotting.

close all

%% script initializations
addpath('./lib')

scenarios = {'Scenario_2_Data_Set_2_3_analysis'};
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
% phA_vMag = print_modelica_vector(msrHrmData.run_1(1:2:2*numHrm, 8))
% phA_vArg = print_modelica_vector(wrapTo2Pi(deg2rad(msrHrmData.run_1(1:2:2*numHrm, 8))))
% phB_vMag = print_modelica_vector(msrHrmData.run_2(1:2:2*numHrm, 8))
% phB_vArg = print_modelica_vector(wrapTo2Pi(deg2rad(msrHrmData.run_2(1:2:2*numHrm, 8))))
% phC_vMag = print_modelica_vector(msrHrmData.run_3(1:2:2*numHrm, 8))
% phC_vArg = print_modelica_vector(wrapTo2Pi(deg2rad(msrHrmData.run_3(1:2:2*numHrm, 8))))



%% device efficiency table...
msr = struct();
% Laptops and LEDs always operate at a fixed power level.
msr.LED_1.Pin = 32.726;
msr.LED_1.Pout = 29.004;
msr.LED_2.Pin = 32.471;
msr.LED_2.Pout = 27.675;
msr.LED_3.Pin = 34.1234;
msr.LED_3.Pout = 27.821;
msr.Laptop_3.Pin = 90.170;
msr.Laptop_3.Pout = 76.581;
msr.Laptop_4.Pin = 86.084;
msr.Laptop_4.Pout = 75.869;
msr.Laptop_5.Pin = 88.3426;
msr.Laptop_5.Pout = 77.4410;
%% power levels for the power supplies are: 400, 600, 100, 200
% PS-1
% 145.447512032809	99.3878331416641
% 251.474931938968	200.197285882576
% 471.37040432214	402.910205257423
% 700.313013157343	607.42601397996
msr.PS1.Pin = 251.4749;
msr.PS1.Pout = 200;
% PS-2 
% 157.959429391827	139.97956122154
% 234.478925090557	210.475485640488
% 468.767570735015	423.648043533652
% 711.921550109908	638.569491151125
msr.PS2.Pin = 468.7675;
msr.PS2.Pout = 423.6480;
% PS-3
% 173.665227996054	140.055344463622
% 249.748511364011	210.57017580181
% 482.308253129589	423.645413524877
% 723.086143814932	638.880780735236
msr.PS3.Pin = 641.7261;
msr.PS3.Pout = 566.8563;

msr.Led(1).Pout = [29.004];
msr.Led(1).Pin = 32.726;
msr.Led(2).Pout = 27.675;
msr.Led(2).Pin = 32.471;
msr.Led(3).Pout = 27.821;
msr.Led(3).Pin = 34.1234;
msr.Laptop(1).Pout = 76.581; % laptop charger 3
msr.Laptop(1).Pin = 90.170;
msr.Laptop(2).Pout =  75.869;  % laptop charger 4
msr.Laptop(2).Pin = 86.084;
msr.Laptop(3).Pout =  77.4410;  % laptop charger 5
msr.Laptop(3).Pin = 88.3426;
msr.PS(1).Pout = [0.03, 99.3878331416641, 200.197285882576, 402.910205257423, 607.42601397996];
msr.PS(2).Pout = [0.09, 139.9796  210.4755  423.6480  638.5695];
msr.PS(3).Pout = [0.08, 140.0553  210.5702  423.6454  638.8808];
msr.PS(1).Pin = [23.3457059472221, 145.447512032809, 251.474931938968, 471.37040432214, 700.313013157343];
msr.PS(2).Pin = [4.89182080294469, 157.9594  234.4789  468.7676  711.9216];
msr.PS(3).Pin = [17.7096024653933, 173.6652  249.7485  482.3083  723.0861];
format short
%% power efficiency table
disp('=================================')
disp('Efficiency table')
disp('=================================')
%    disp('      Pin_msr      Pin_sim     Pout_msr    Pout_sim  Effi_msr  Effi_sim')
% fprintf('LED_1    %f      %f      %f      %f      %f      %f /n', msr.LED_1.Pin, LedDriver_1.AC.P, msr.LED_1.Pout, msr.LED_1.Pout/msr.LED_1.Pin, LedDriver_1.DC.P/LedDriver_1.AC.P)
% fprintf('LED_2    %f      %f      %f      %f      %f      %f \n', msr.LED_2.Pin, LedDriver_2.AC.P, msr.LED_2.Pout, msr.LED_2.Pout/msr.LED_2.Pin, LedDriver_2.DC.P/LedDriver_2.AC.P)
% fprintf('LED_3    %f      %f      %f      %f      %f      %f \n', msr.LED_3.Pin, LedDriver_3.AC.P, msr.LED_3.Pout, msr.LED_3.Pout/msr.LED_3.Pin, LedDriver_3.DC.P/LedDriver_3.AC.P)
% fprintf('Lap_3    %f      %f      %f      %f      %f      %f \n', msr.Laptop_3.Pin, LaptopCharger_3.AC.P, msr.Laptop_3.Pout, msr.Laptop_3.Pout/msr.Laptop_3.Pin, LaptopCharger_3.DC.P/LaptopCharger_3.AC.P)
% fprintf('Lap_4    %f      %f      %f      %f      %f      %f \n', msr.Laptop_4.Pin, LaptopCharger_4.AC.P, msr.Laptop_4.Pout, msr.Laptop_4.Pout/msr.Laptop_4.Pin, LaptopCharger_4.DC.P/LaptopCharger_4.AC.P)
% fprintf('Lap_5    %f      %f      %f      %f      %f      %f \n', msr.Laptop_5.Pin, LaptopCharger_5.AC.P, msr.Laptop_5.Pout, msr.Laptop_5.Pout/msr.Laptop_5.Pin, LaptopCharger_5.DC.P/LaptopCharger_5.AC.P)
% fprintf('PS1      %f      %f      %f      %f      %f      %f \n', msr.PS1.Pin, PowerSupply_1.AC.P, msr.PS1.Pout, msr.PS1.Pout/msr.PS1.Pin, PowerSupply_1.DC.P/PowerSupply_1.AC.P)
% fprintf('PS2      %f      %f      %f      %f      %f      %f \n', msr.PS2.Pin, PowerSupply_2.AC.P, msr.PS2.Pout, msr.PS2.Pout/msr.PS2.Pin, PowerSupply_2.DC.P/PowerSupply_2.AC.P)
% fprintf('PS3      %f      %f      %f      %f      %f      %f \n', msr.PS3.Pin, PowerSupply_3.AC.P, msr.PS3.Pout, msr.PS3.Pout/msr.PS3.Pin, PowerSupply_3.DC.P/PowerSupply_3.AC.P)

 disp('      Pin_msr      Pin_sim     Pout_msr    Pout_sim  Effi_msr  Effi_sim')
[msr.LED_1.Pin, LedDriver_1.AC.P, msr.LED_1.Pout, msr.LED_1.Pout/msr.LED_1.Pin, LedDriver_1.DC.P/LedDriver_1.AC.P; 
msr.LED_2.Pin, LedDriver_2.AC.P, msr.LED_2.Pout, msr.LED_2.Pout/msr.LED_2.Pin, LedDriver_2.DC.P/LedDriver_2.AC.P;
msr.LED_3.Pin, LedDriver_3.AC.P, msr.LED_3.Pout, msr.LED_3.Pout/msr.LED_3.Pin, LedDriver_3.DC.P/LedDriver_3.AC.P;
msr.Laptop_3.Pin, LaptopCharger_3.AC.P, msr.Laptop_3.Pout, msr.Laptop_3.Pout/msr.Laptop_3.Pin, LaptopCharger_3.DC.P/LaptopCharger_3.AC.P;
msr.Laptop_4.Pin, LaptopCharger_4.AC.P, msr.Laptop_4.Pout, msr.Laptop_4.Pout/msr.Laptop_4.Pin, LaptopCharger_4.DC.P/LaptopCharger_4.AC.P;
msr.Laptop_5.Pin, LaptopCharger_5.AC.P, msr.Laptop_5.Pout, msr.Laptop_5.Pout/msr.Laptop_5.Pin, LaptopCharger_5.DC.P/LaptopCharger_5.AC.P;
msr.PS1.Pin, PowerSupply_1.AC.P, msr.PS1.Pout, msr.PS1.Pout/msr.PS1.Pin, PowerSupply_1.DC.P/PowerSupply_1.AC.P;
msr.PS2.Pin, PowerSupply_2.AC.P, msr.PS2.Pout, msr.PS2.Pout/msr.PS2.Pin, PowerSupply_2.DC.P/PowerSupply_2.AC.P;
msr.PS3.Pin, PowerSupply_3.AC.P, msr.PS3.Pout, msr.PS3.Pout/msr.PS3.Pin, PowerSupply_3.DC.P/PowerSupply_3.AC.P;
]