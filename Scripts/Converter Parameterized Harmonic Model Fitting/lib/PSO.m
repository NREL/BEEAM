% Copyright (c) 2014, Reza Ahmadzadeh
% Copyright (c) 2014, Wesam Elshamy
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
%
%* Redistributions of source code must retain the above copyright notice, this
% list of conditions and the following disclaimer.
%
%* Redistributions in binary form must reproduce the above copyright notice,
% this list of conditions and the following disclaimer in the documentation
% and/or other materials provided with the distribution
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
% DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
% FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
% DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
% SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
% CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
% OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
% OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

%-------------------------------------------------------------------------%
% Description: this code implements a basic particle swarm optimization 
% (PSO) algorithm, with objective function contained in objFunction( ).
%
% Inputs:
%   - structure "PSOParameters" with fields:
%       PSOParameters.initialGuess;  % initial guess 
%       PSOParameters.lowerBound;    % lower grid bound
%       PSOParameters.upperBound;    % upper grid bound
%       PSOParameters.maxIter;       % max number of search iterations
%       PSOParameters.inertia;       % inertia term
%       PSOParameters.velScale;      % velocity scaling term
%       PSOParameters.cogSelf;       % cognitive weighting term (self)
%       PSOParameters.cogPeers;      % cognitive weighting term (peers)
%       PSOParameters.swarmSize;     % number of the swarm particles
%   - plotOption: string with these options
%       'plotSwarm'    : plot swarm particles on scatterplot
%       'plotProgress' : plot best and median fitness vs iteration number
%
% Outputs:
%   - bestParticle: array with best particle values
%   - bestFitness : scalar with best fitness obtained
%
% Written by: 
% James Cale, Ph.D.
% Colorado State University
% Contact: jcale@colostate.edu
%
% Revision Date: 14 Dec 2017
% Revision Notes:
%   - 14 Dec 2017: initial release
%   - 03 Apr 2018: changed initialization to accept any dimension; now
%     computes a spread around the initial position (sampled from normal
%     distribution) rather than evenly spaced grid; updated algo to
%     accept any dimision (not just 2D).
%
%-------------------------------------------------------------------------%
% Note: this code was adapted from code written by Reza Ahmadzadeh 
% (reza.ahmadzadeh@iit.it), based on original code by Wesam Elshamy.
%-------------------------------------------------------------------------%

function [ bestParticle, bestFitness ] = PSO( objFunction, PSOParameters, plotOption )


% extract PSO algorithm parameters
x0       = PSOParameters.initialGuess;  % initial guess
xl       = PSOParameters.lowerlim;      % lower limits
xu       = PSOParameters.upperlim;      % upper limits
initialStd = PSOParameters.initialStd;  % std (spread) around initial guess
maxIter  = PSOParameters.maxIter;       % max number of search iterations
inertia  = PSOParameters.inertia;       % inertia term
velScale = PSOParameters.velScale;      % velocity scaling term
cogSelf  = PSOParameters.cogSelf;       % cognitive weighting term (self)
cogPeers = PSOParameters.cogPeers;      % cognitive weighting term (peers)
swarmSize= PSOParameters.swarmSize;     % number of the swarm particles

numDims = length(x0);   % number of particles


%-------------------------------------------------------------------------%
%                   IMPLEMENT PSO ALGORITHM
%-------------------------------------------------------------------------%
    
% set initial position of the particles
swarm(1:swarmSize,1,1:numDims) = PSO_init( PSOParameters );
       
% initialize particle velocity and best candidate found
swarm(:,2,:) = 0;           % set initial velocity for particles
swarm(:,4,1) = 10^9;        % set the best fitness value so far

% The main loop of PSO
best = zeros(1,maxIter);

meanFitnessOld = 0;

iter = 0;
iterOld = 0;
meanFitnessTemp1 = 0;
fworst = 0;

while ( iter <= maxIter)
%for iter=1:250

    iter = iter + 1;
    
    % update swarm values
    swarm(:, 1, 1:numDims) = swarm(:, 1, 1:numDims) + swarm(:, 2, 1:numDims)/velScale;  % update y position with the velocity
    
    % enforce boundary limits
    for j = 1:numDims
       indices = find(swarm(:,1,j) > xu(j));
       swarm(indices,1,j) = xu(j);
       indices = find(swarm(:,1,j) < xl(j));
       swarm(indices,1,j) = xl(j);
    end
    
    % evaluate particle fitnesses
    fval = objFunction( swarm(:,1,1:numDims), PSOParameters );              
    
    % compare the function values to find the best ones
    for ii = 1:swarmSize
        if fval(ii,1) < swarm(ii,4,1)
            swarm(ii, 3, 1:numDims) = swarm(ii,1,1:numDims);
            swarm(ii, 4, 1) = fval(ii,1);                       % update the best value so far
        end
    end
    
    [~, gbest ] = min(swarm(:, 4, 1));        % find particle with best fitness
    
    % compute worst fitness
    [fworst_temp, index] = max( objFunction( swarm(:,1,1:numDims), PSOParameters ));
    if fworst_temp > fworst 
        fworst =fworst_temp;
        pworst = swarm(index,1,1:numDims);
    end
           
    % update the velocity of the particles
    for k = 1:numDims
        swarm(:, 2, k) = inertia*(rand(swarmSize,1).*swarm(:, 2, k)) + cogSelf*(rand(swarmSize,1).*(swarm(:, 3, k) ...
            - swarm(:, 1, k))) + cogPeers*(rand(swarmSize,1).*(swarm(gbest, 3, k) - swarm(:, 1, k)));   %velocity component
    end
    
    % compute best and mean fitnesses
    bestFitness = 1/( min(swarm(:, 4, 1)+eps));
    meanFitness = 1/(mean(swarm(:, 4, 1)+eps));
    
    % check for repeat solutions
    if abs((meanFitness - meanFitnessOld)/meanFitnessOld)<0.01
        repeatCount = repeatCount + 1;
               
    else
        repeatCount = 0;
    end
    
    swarmOld = swarm(:, 1, 1:numDims);
    meanFitnessOld = meanFitness;
    
    
    %-------------------------------------------------------------------------%
    %                     RUN-TIME PLOTTING
    %-------------------------------------------------------------------------%
    % plot the particles
    switch plotOption
        case 'plotswarm'
            
            % Note: this is for visualization of only two parameters
            pause(.05); 
            clf; plot(swarm(:, 1, 1), swarm(:, 1, 2), 'bx');             % drawing swarm movements
            axis([xl(1) xu(1) xl(2) xu(2)]);
            ylabel('$$x_2$$','FontSize',18,'Interpreter','latex')
            xlabel('$$x_1$$','FontSize',18,'Interpreter','latex')
            hold on; grid minor;
            set(gcf,'Color',[1 1 1]);
            box off;
            set(gca,'FontName','Times','FontSize',22,'LineWidth',1.0);
            
        case 'plotprogress'
            
            hold on
            pause(.0001); 
            if iter==1
                set(gcf,'Color',[1 1 1]);
                box off;
                set(gca,'FontName','Times','FontSize',22,'LineWidth',1.0);
                ylabel('Fitness','FontSize',18,'Interpreter','latex')
                xlabel('Study Number','FontSize',18,'Interpreter','latex')
                %legend('Best Fitness','Mean Fitness')
            else
                %line( [iter-1,iter], [bestFitnessOld,bestFitness],'color','blue','LineWidth',1);
                % Edited: Avpreet Othee <avpreetsingh@hotmail.com>
                % Adding intervals in fitness plotting
                % The old version adds too many points resulting in slower
                % algorithm update
                if iter - iterOld > 50
                    line( [iterOld,iter], [meanFitnessTemp1, meanFitness],'color','green');
                    xlim([0 maxIter]);
                    iterOld = iter;
                    meanFitnessTemp1 = meanFitness;
                end
                %ylim([-.95 bestFitness*1.05]);
            end
            
            bestFitnessOld = bestFitness;
            meanFitnessTemp = meanFitness;
            
        otherwise
    end
    
end

bestParticle  = [ swarm(gbest,1,1) swarm(gbest,1,2) swarm(gbest,1,3) swarm(gbest,1,4) swarm(gbest,1,5) swarm(gbest,1,6) ]
%worstParticle = [ pworst(:,:,1) pworst(:,:,2) ];

