
clc
clear
close all

devices = { 'AC-DC - HP Laptop Charger - LBNL1 - 19.5V, 90W';  % 1
                }; 

%%            
% give that path of data directory. Adjust according to specific system.
dataDirectory = './Example Data/';
indx = 1;
for device_i = [1:length(devices)]
    % get data 
    % data is in the form of a struct
    % refer function to get struct members
    % to get a converter model, package data as the struct
    % and run the generate model script to get
    % the converter harmonic model
    convData = getConverterData(dataDirectory, devices{device_i});
    
    % run script
    generate_harmonic_load_model
    indx = indx + 1;
end

