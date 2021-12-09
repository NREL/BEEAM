function [ fitness ] = fitnessFunction_magnitude( Theta, PSOParameters )

X       = PSOParameters.Xmeas;           % measurement of harmonic number
Y       = PSOParameters.Ymeas;           % measurement of power [W]
Z_mag   = PSOParameters.Z_mag;           % impedance magnitude (calculated)

% vectorize measurement data
y   = Y(:);
x   = X(:);
z   = Z_mag(:);

for k = 1:length(Theta)

    % extract parameter values for each particle
    theta = Theta(k,1,:);
    
    % compute candidate value
%     g = (theta(1) *y + theta(2) ) ./ ...
%            (((theta(1) *y + theta(2) ) ./ (theta(3) *y + theta(4) ))-... 
%        exp(-(theta(5) *y.^theta(6) ).*x));
    g = candidateFunction_magnitude(x, y, [theta(1), theta(2), theta(3), ...
            theta(4), theta(5), theta(6)]);
    % compute fitness
    %fitness(k) = norm(g-z, 2); 
    
    %% using RSME --------
    N = length(x);  % number of data points
    fitness(k) = sqrt(sum((g - z).^2) ./ N);
end 

fitness = fitness';