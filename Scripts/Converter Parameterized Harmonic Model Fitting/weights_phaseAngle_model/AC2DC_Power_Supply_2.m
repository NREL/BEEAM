
%
% Phase angle modeling weights.
% Using script to load variable in the workspace
%
% AC2DC_Laptop_Charger_3.mat
% AC2DC_Laptop_Charger_4.mat  
% AC2DC_Laptop_Charger_5.mat  
% AC2DC_LED_Driver_1.mat      
% AC2DC_LED_Driver_2.mat      
% AC2DC_LED_Driver_3.mat      
% AC2DC_Power_Supply_1.mat    
% AC2DC_Power_Supply_2.mat    
% AC2DC_Power_Supply_3.mat    

% set the weight vector equal to X and Y sizes
w = zeros(11, 15);
% set weights to one for higher powers and lower harmonics
% Columns ---> x axis (harmonics)
% rows  |      y axis (power)
%      \ /
%       "
% another modification is, only do this for higher harmonics
w(2:10, 1) = 1;   % all fundamentals
w(5:9, 2:3) = 1;  

