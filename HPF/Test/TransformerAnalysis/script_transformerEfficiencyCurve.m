
%%

close all

%% script initializations
addpath('../../Utilities/external_lib/lib')

%% result files location
dataDir = '../../../../tmp/openmodelica_wrkspc/';

pwr = struct();

for k = 1:21
    % read mat file
    resFile = [dataDir, 'resFile_TransformerEfficiency_resVal_', num2str(k)];
    
    res = modelicaImport(resFile);
    numHrm = res.systemDef.numHrm;   % number of harmonics
    h = res.systemDef.hrms; % system harmonics
    
    % get primary power
    tmp = voltageSrc_3ph(numHrm, res.a_vSrc);
    
    pwr(k).prim = tmp.P;
    
    % get secondary power
    r1 = twoPin_device(numHrm, res.a_r1);
    r2 = twoPin_device(numHrm, res.a_r2);
    r3 = twoPin_device(numHrm, res.a_r3);
    
    pwr(k).sec = r1.P + r2.P + r3.P;
    
    
end

%% plot
for k = 1:length(pwr)
    losses(k, 1) = pwr(k).prim - pwr(k).sec;
    tmp_pwrSec(k, 1) = pwr(k).sec;
end

plot(tmp_pwrSec, losses)

                            