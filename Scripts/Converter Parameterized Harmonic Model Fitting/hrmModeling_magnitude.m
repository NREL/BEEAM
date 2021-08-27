%%
% Script:
% Converter Magnitude modeling
% ------------------------------------------------------------------------------
% Runs particle swarm optimization using measured data
% Inputs: 
%   X : Measured X data (axis) [harmonic number]
%   Y : Measured Y data [Power AC side @ h = 1]
%   Z_mag : Measured Z data [Current magnitude |I|]
%   deviceName : Device name
%
% Workflow:
%   Get the data in the workspace in the format mentioned.
%   Data should be in the meshgrid 2D matrix format.
%
% Avpreet Othee, avpreetsingh@hotmail.com
% ------------------------------------------------------------------------------

addpath('./lib')

% read csv file
% check if GNU octave 
if exist ("OCTAVE_VERSION", "builtin") > 0
  pkg load statistics;
end

%% set PSO parameters
%PSOParameters.initialGuess  = rand(6, 1);
PSOParameters.upperlim      = [  5  5  5  5  5  5];   % upper limits
PSOParameters.lowerlim       = - PSOParameters.upperlim;                 % lower limits
PSOParameters.initialStd    = 0.5;        % std (spread) around initial guess
PSOParameters.maxIter       = 1000;     % max number of search iterations
PSOParameters.inertia       = 0.7;      % inertia term
PSOParameters.velScale      = 1.3;      % velocity scaling term
PSOParameters.cogSelf       = 2.0;      % cognitive weighting term (self)
PSOParameters.cogPeers      = 2.0;      % cognitive weighting term (peers)
PSOParameters.swarmSize     = 1000;       % number of the swarm particles
PSOParameters.initOption    = 1;        % (0 = grid, 1 = Guassian Ball)

harmonicModel_Mag = struct;  % struct to save harmonic model

%% Optimization
figure(1)
figure(1)   % workaround to prevent plotting on 3D figure

% using vectors instead of matrices
% rearranging data using prepareSurfaceData from curve fitting toolbox
xData = reshape(X, [size(X, 1)*size(X, 2), 1]);
yData = reshape(Y, [size(Y, 1)*size(Y, 2), 1]);
zData = reshape(Z_mag, [size(Z_mag, 1)*size(Z_mag, 2), 1]);
% xData = X;
% yData = Y;
% zData = Z_mag;

%PSOParameters.initialGuess  = rand(6, 1);
PSOParameters.initialGuess = [-0.0109   -0.0003  -0  -0.1   -0.0439    0.3262];
% Input data for the objective function
PSOParameters.Xmeas         = xData;        % measurement of power [W]
PSOParameters.Ymeas         = yData;        % measurement of harmonic number
% measured data (Current magnitude)
PSOParameters.Z_mag         = zData;    % impedance magnitude (calculated)
if exist('deviceName', 'var')
    disp('=====================')
    disp(['Running PSO for device = ', deviceName])
end
tStart = tic();
[ bestParticle, bestFitness ] = PSO( @fitnessFunction_magnitude, PSOParameters, 'plotprogress'); 
fval = norm(Z_mag - candidateFunction_magnitude(X, Y, bestParticle));
disp(['fval = ', num2str(fval)]);
disp(['Elapsed time = ', num2str(toc(tStart))]);

harmonicModel_Mag.params = bestParticle;
harmonicModel_Mag.bestFitness = bestFitness;
harmonicModel_Mag.fval = fval;

if exist('deviceName', 'var')
    harmonicModel_Mag.deviceName = deviceName;
end

%% plot results
figure
plot3(X, Y, Z_mag, '.k',  'MarkerSize', 15);
hold on
grid on
surf(X, Y, candidateFunction_magnitude(X, Y, harmonicModel_Mag.params),'FaceAlpha',0.5)
if exist('deviceName', 'var')
    title(harmonicModel_Mag.deviceName, 'Interpreter', 'none')
end

%%
if exist('deviceName', 'var')
    save(['./models/magnitude/', deviceName, '.mat'], 'harmonicModel_Mag')
end




