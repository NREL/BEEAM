function [ fitness ] = fitnessFunction( Theta, PSOParameters )

X       = PSOParameters.Xmeas;           % measurement of power [W]
Y       = PSOParameters.Ymeas;           % measurement of harmonic number
Z_arg   = PSOParameters.Z_arg;           % impedance magnitude (calculated)

% vectorize measurement data
y   = Y(:);
x   = X(:);
z   = Z_arg(:);

for k = 1:length(Theta)

    % extract parameter values for each particle
    theta = Theta(k,1,:);
    
    % compute candidate value
    g = (theta(1) *y + theta(2) ) ./ ...
           (((theta(1) *y + theta(2) ) ./ (theta(3) *y + theta(4) ))-... 
       exp(-(theta(5) *y.^theta(6) ).*x));

    % compute fitness
    fitness(k) = norm(g-z,2); 
end 

fitness = fitness';