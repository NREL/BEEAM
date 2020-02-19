% MATLAB post processing scripts
% using the output mat file to run the post processing analysis.
%
% For now sticking with OpenModelica and Dymola.
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
% correction ---------------
% There is a bug in the 'modelicaImport.m' function. It fails to populate the varaible
% voltageSource.vSrc_phC.v
% Therefore, manually doing that.. functions with prefix 'tmp_' are all 
% temporary fix.
tmpVar = tmp_getModelicaVar_cmplxVect(matFile_path, 'voltageSource.vSrc_phC.v');
res.voltageSource.vSrc_phC.v = tmpVar;


h = res.systemDef.numHrm;
% getting data from all the devices

% input voltage
inputVoltage = voltageSrc_3ph(h, res.voltageSource);

% converters
LaptopCharger_1 = AC2DC_converter_1ph(h, res.Laptop_charger_3);
LedDriver_1 = AC2DC_converter_1ph(h, res.LED_Driver_2);
PowerSupply_1 = AC2DC_converter_1ph(h, res.Power_Supply_1);

% DC loads

%% system losses -----
% Transformer losses

% converter losses

% input power 

% Output DC power for converters

% System losses

%% do some plotting
% input voltage
figure 
subplot(2,1,1)
hold on
grid on
plot(inputVoltage.phA.wv.v);
plot(inputVoltage.phB.wv.v);
plot(inputVoltage.phC.wv.v);
subplot(2,1,2)
hold on
grid on
plot(inputVoltage.phA.wv.i);
plot(inputVoltage.phB.wv.i);
plot(inputVoltage.phC.wv.i);

% diagnosing
inputVoltage.phA.V.arg(1)
inputVoltage.phB.V.arg(1)
inputVoltage.phC.V.arg(1)

figure
plot(LedDriver_1.AC.wv.v)
grid on
figure
plot(LaptopCharger_1.AC.wv.v)

figure
m = struct();
a = struct();
m.AB = res.vMsr_AB.vMag(:, end);
a.AB = res.vMsr_AB.vArg(:, end);
m.BC = res.vMsr_BC.vMag(:, end);
a.BC = res.vMsr_BC.vArg(:, end);
m.CA = res.vMsr_CA.vMag(:, end);
a.CA = res.vMsr_CA.vArg(:, end);

plot(getTimeWvform(m.AB, m.AB, 1302));
hold on
plot(getTimeWvform(m.BC, m.BC, 1302));
plot(getTimeWvform(m.CA, a.CA, 1302));