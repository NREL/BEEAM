%%
% Script:
% Converter phase angle modeling
% ------------------------------------------------------------------------------
% Commentary:
% Phase angles are tricky to model
% Phase angle surface plots donot show to follow any specific surface shape at 
% higher harmonics
% the general profile is a planar surface. Therefore, we must ignore higher
% harmonics and also lower power harmonics

addpath('./lib')

harmonicModel_PhaseAngle = struct;  % struct to save harmonic model

if exist('deviceName', 'var')
    disp('=====================')
    disp(['Running fit (fminsearch) for device = ', deviceName])
    harmonicModel.deviceName = deviceName;
end

% load weights script definition
addpath('./weights_phaseAngle_model')
if exist('deviceName', 'var')
    run(['weights_phaseAngle_model/', deviceName, '.m'])
else 
    % set the weight vector equal to X and Y sizes
    w = zeros(size(X));
    % set weights to one for higher powers and lower harmonics
    % Columns ---> x axis (harmonics)
    % rows  |      y axis (power)
    %      \ /
    %       "
    % another modification is, only do this for higher harmonics
    w(2:10, 1) = 1;   % all fundamentals
    w(5:9, 2:3) = 1;   
end

%fitnessFunc = @(params)(norm((candidateFunction_phaseAngle(X, Y, params) - Z_arg).*w, 2));

%%
% % run optimization
% x0 = [1; -2; 0; 0; 0];   % initial value
% options = optimset('Display', 'off', 'PlotFcns', @optimplotfval, 'TolX', 1e-6,...
%                 'TolFun', 1e-6, 'MaxFunEvals', 5e3);
% [params, fval] = fminsearch(fitnessFunc, x0, options) 
% 
% Z_fitted = candidateFunction_phaseAngle(X, Y, params);

%%
% using vectors instead of matrices
% reshaping data into vectors
xData = reshape(X, [size(X, 1)*size(X, 2), 1]);
yData = reshape(Y, [size(Y, 1)*size(Y, 2), 1]);
zData = reshape(Z_arg, [size(Z_arg, 1)*size(Z_arg, 2), 1]);
weights = reshape(w, [size(w, 1)*size(w, 2), 1]);

%fitnessFunc = @(params)(norm((candidateFunction_phaseAngle(xData, yData, params) - zData).*weights, 2));
% using RSME
N = length(xData);  % number of data points
fitnessFunc = @(params)(sqrt(sum(weights .* (candidateFunction_phaseAngle(xData, yData, params) - zData).^2) ./ N));

x0 = [2; -1; 0; 0; 0];   % initial value
options = optimset('Display', 'final', 'TolX', 1e-10,...
                'TolFun', 1e-15, 'MaxFunEvals', 7e3);
[params, fval] = fminsearch(fitnessFunc, x0, options) 

Z_fitted = candidateFunction_phaseAngle(X, Y, params);

%%
harmonicModel_PhaseAngle.params = params;
harmonicModel_PhaseAngle.fval = fval;
if exist('deviceName', 'var')
    harmonicModel_PhaseAngle.deviceName = deviceName;
end

figure
plot3(X, Y, Z_arg, '.k',  'MarkerSize', 15);
hold on
grid on
% mark weights
surf(X, Y, Z_fitted,'FaceAlpha',0.5)
xlabel('h')
ylabel('$P_1$', 'Interpreter', 'Latex')
zlabel('$\angle I_h$', 'Interpreter', 'Latex')

if exist('deviceName', 'var')
    title(harmonicModel_PhaseAngle.deviceName, 'Interpreter', 'none')
end

if exist('deviceName', 'var')
    save(['./models/phaseAngle/', deviceName, '.mat'], 'harmonicModel_PhaseAngle')
end










