

%% get voltage for scenarios at the primary
% the modelica input should be of the form,
% vArg_phA = {6.2746, 0.98224, 5.9594, 2.9177, 0.34672, 4.9702, 1.3017,
% 4.9878, 2.2162, 2.0372}, vArg_phB = {2.0856, 0.72153, 2.1146, 3.4627, 
% 4.052, 3.5454, 3.5171, 3.9976, 4.761, 4.455}, vArg_phC = {4.1804, 1.1667,
% 0.27168, 0.86058, 5.1906, 2.7508, 3.5819, 1.8474, 4.0803, 2.5459}, 
% vMag_phA = {119.5941, 0.61079, 0.71444, 0.66802, 0.65663, 0.34336, 0.29531,
% 0.05003, 0.070744, 0.01079}, vMag_phB = {119.9794, 2.8089, 2.2149, 1.1386, 
% 0.59509, 0.33249, 0.29805, 0.17755, 0.074639, 0.064706}, 
% vMag_phC = {122.717, 0.88698, 0.67201, 0.41019, 0.36005, 0.27539, 0.041419,
% 0.058456, 0.054383, 0.041341}
clc
clear
close all
addpath('./lib')
transformerSide = 'primary'; % options: 'primary' or 'secondary'
indx = 1;
maxHrm = 30;
s = struct();
% only for scenarios 3-4
for scenario = [1:2] % iterate through scenarios
    for dataSet = [1:4]   % iterate through data sets
        dir = tmp_getDataDir(scenario, dataSet);
        s.phA = getLineData(dir, 'A', transformerSide);
        s.phB = getLineData(dir, 'B', transformerSide);
        s.phC = getLineData(dir, 'C', transformerSide);
        % ph-ph -> ph-N
        s.phA.v.mag = s.phA.v.mag / sqrt(3);
        s.phB.v.mag = s.phB.v.mag / sqrt(3);
        s.phC.v.mag = s.phC.v.mag / sqrt(3);
        s.phA.v.arg = s.phA.v.arg + deg2rad(30);
        s.phB.v.arg = s.phB.v.arg + deg2rad(30);
        s.phC.v.arg = s.phC.v.arg + deg2rad(30);
        
        disp('----------------------------')
        disp(['Scenario ', num2str(scenario), ' Data Set ', num2str(dataSet)])
        str = strcat('vArg_phA = ', print_modelica_vector(s.phA.v.arg(1:2:maxHrm)), ',' ,...
            'vArg_phB = ', print_modelica_vector(s.phB.v.arg(1:2:maxHrm)), ',' ,...
            'vArg_phC = ', print_modelica_vector(s.phC.v.arg(1:2:maxHrm)), ',' ,...
            'vMag_phA = ', print_modelica_vector(s.phA.v.mag(1:2:maxHrm)), ',' ,...
            'vMag_phB = ', print_modelica_vector(s.phB.v.mag(1:2:maxHrm)), ',' ,...
            'vMag_phC = ', print_modelica_vector(s.phC.v.mag(1:2:maxHrm)))
        
    end
    indx = indx + 1;
end