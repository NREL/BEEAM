

%% Converter efficiency modeling
% Efficiency modeling only for laptops and power supplies
% Leds run at constant power. 
for k = 1:length(convData.pwrLevel)
    % Efficiency modeling should be power over all harmonics
    % The harmonic power for the surface plot would be taken care of
    % by the Modelica Model
    Pin(k, 1) = convData.pwrLevel(k).Preal;
    Pout(k, 1) = convData.pwrLevel(k).P_DC;
end

[convData.EffiMdl.alpha, convData.EffiMdl.beta, ...
    convData.EffiMdl.gamma] =  ...
            efficiency_modeling(Pin, Pout, 0);
%% Efficiency curve
figure
plot(Pout, (Pout./Pin)*100);
hold on
grid on
mdl_Pin = Pout + convData.EffiMdl.alpha + ...
    convData.EffiMdl.beta.*Pout + ...
    convData.EffiMdl.gamma.*Pout.^2;
plot(Pout, (Pout./mdl_Pin)*100);
xlabel('Pout (W)');
ylabel('Efficiency');
title(['Efficiency model :', convData.name]);
legend('Measurement', 'Model', 'Location', 'southeast');

%% Pout vs Pin
figure
plot(Pout, Pin);
hold on
grid on
plot(Pout, mdl_Pin);
xlabel('Pout (W)');
ylabel('Pin (W)');
title(['Pout vs Pin :', convData.name]);
legend('Measurement', 'Model', 'Location', 'southeast');

%% Loss curve, Pout vs Loss
figure
plot(Pout, Pin - Pout, 'ob');
hold on
grid on
plot(Pout, mdl_Pin - Pout, 'xr');
xlabel('Pout (W)');
ylabel('Loss (W)');
title(['Pout vs Loss :', convData.name]);
legend('Measurement', 'Model', 'Location', 'southeast');

%% 3D surf plot data
maxHrm = 30;
%% plotting surf
%% create a meshgrid
k1 = 1;
for k = 1:length(convData.pwrLevel)
    % converter power level at h=1. 
    % This will account for change in spectrum resulting from line impedances
   y(k1, 1) = convData.pwrLevel(k1).Preal_h1;
   k1 = k1 + 1;
end
x = 1:2:maxHrm;
[X, Y] = meshgrid(x, y);
% populating z
Z = struct();
Z.mag = zeros(size(X));
Z.arg = zeros(size(X));
for r = 1:size(X, 1)
   for c = 1:size(X, 2)
       Z.mag(r, c) = convData.pwrLevel(r).i.mag(2*c);   % only odd harmonics
       Z.arg(r, c) = convData.pwrLevel(r).i.arg(2*c);
   end
   % unwrapping phase
   Z.arg(r, :) = unwrap(Z.arg(r, :));
end

%%
figure
surf(X, Y, Z.mag, 'FaceAlpha', 0.75)
xlabel('$h$', 'interpreter', 'latex', 'FontSize', 14)
ylabel('$P_{AC}^{(1)}$', 'interpreter', 'latex', 'FontSize', 14)
zlabel('$|I^{(h)}|$', 'interpreter', 'latex', 'FontSize', 14)
title(['Magnitude Mdl: ', convData.name])

figure
surf(X, Y, Z.arg, 'FaceAlpha', 0.75)
xlabel('$h$', 'interpreter', 'latex', 'FontSize', 14)
ylabel('$P_{AC}^{(1)}$', 'interpreter', 'latex', 'FontSize', 14)
zlabel('$\angle I^{(h)}$', 'interpreter', 'latex', 'FontSize', 14)
title(['Phase Mdl: ', convData.name])

%% save to mat file
alpha = convData.EffiMdl.alpha;
beta = convData.EffiMdl.beta;
gamma = convData.EffiMdl.gamma;
Z_mag = Z.mag;
Z_arg = Z.arg; 

%save(['./Model files/', cell2mat(deviceModelFileNames(device_i)), '_3D.mat'], 'X', 'Y', 'Z_mag', 'Z_arg', ...
%                                    'alpha', 'beta', 'gamma');






