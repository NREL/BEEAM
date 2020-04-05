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
matFile_path = '/home/avpreetsingh/OpenModelica_workspace/HPF.Test.SinglePhase_Transformer/HPF.Test.SinglePhase_Transformer_res.mat';
%% file path for Dymola mat file
% matFile_path = ''

res = modelicaImport(matFile_path);

%% comparing results from the HPF transformer and QuasiStationary lib transformer
vSrc_HPF = struct();
vSrc_HPF.v = res.vSrc_HPF.v(1).re(1) + res.vSrc_HPF.v(1).im(1)*1j;
abs(vSrc_HPF.v)

vSrc_Quasi = struct();
vSrc_Quasi.v = res.vSrc_Quasi.v.re(1) + res.vSrc_Quasi.v.im(1)*1j;
abs(vSrc_Quasi.v)



%% running ifft
T_simplified = struct();



%% programmatic variable access
% eval
% structName.(dynamicExpression)

%% some commonly used functions would be:
% given a 2 pin (1 port) device. compute all the necessary power computations
% * Real power
% * Imaginary power
% * Apparent power
% * Distortion power
% * current magnitude and angle
% * voltage magnitude and angle
% * ifft of the same
%

%% Devices:
% * Two pin devices
% * Rectifiers
% * Transformer
% * Voltage source.