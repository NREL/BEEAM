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
% Description: this code initializes a set of swarm particles 
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
%       PSOParameters.initOption;    % (0 = grid, 1 = Guassian Ball)   
%
% Outputs:
%   - x0: set of initial particle positions
%
% Written by: 
% James Cale, Ph.D.
% Colorado State University
% Contact: jcale@colostate.edu
%
% Revision Date: 15 May 2018
% Revision Notes:
%   - 15 May 2018: initial release
%
%-------------------------------------------------------------------------%
% Note: this code was adapted from code written by Reza Ahmadzadeh 
% (reza.ahmadzadeh@iit.it), based on original code by Wesam Elshamy.
%-------------------------------------------------------------------------%

function [ swarm0 ] = PSO_init( PSOParameters )

% obtain parameters
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
initOption = PSOParameters.initOption;  % (0 = grid, 1 = Guassian Ball) 

numDims = length(x0);   % number of particles
    
if initOption == 1
        
    % set initial position of the particles
    swarm0(1:swarmSize,1,1:numDims) = mvnrnd(x0,initialStd*eye(numDims),swarmSize);
    
elseif initOption == 0
    
    % TODO: generalize to N dimensions using NGRID
    
    
    % set the position of the initial swarm
    a = -4:4;
    [X,Y] = meshgrid(a,a);
    C = cat(2,X',Y');
    D = reshape(C,[],2);
    
    % set the position of the particles
    swarm0(1:swarmSize,1,1:numDims) = D;
    
else
    error('ERROR: PSOParameters.initOption must be 0 or 1!');
end

% clf; plot(swarm0(:, 1, 1), swarm0(:, 1, 2), 'bx');             % drawing swarm movements
% axis([xl(1) xu(1) xl(2) xu(2)]);
% ylabel('$$x_2$$','FontSize',18,'Interpreter','latex')
% xlabel('$$x_1$$','FontSize',18,'Interpreter','latex')
% hold on; grid minor;
% set(gcf,'Color',[1 1 1]);
% box off;
% set(gca,'FontName','Times','FontSize',22,'LineWidth',1.0);
            