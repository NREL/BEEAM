% Function: Generate normalized converter loss model 
% ------------------------------------------------------------------------------
% Converter losses are modeled using a quadratic polynomial of the form:
%
%   Pin = Pout + alpha[1] + alpha[2] * Pout + alpha[3] * Pout^2
% 
% Coefficients are normalized such that the above equation is valid for Pin and
% Pout relative to nominal power Pnom. A more complete description is:
%
%   Pin = Pout + Pnom * (alpha[1] + alpha[2]*(Pout/Pnom) + alpha[3]*(Pout/Pnom)^2)
%
% Requires regress() function from optim package
%
% Inputs:
%   Pin: Input power vector
%   Pout: Output power vector
%   Pnom: Nominal power scalar
%
% Power units must be consistent
%
% Outputs:
%   alpha = Vector of alpha coefficients
%
% Avpreet Othee, avpreetsingh@hotmail.com
% Modified By: Stephen Frank, Stephen.Frank@nrel.gov
% ------------------------------------------------------------------------------

function alpha = loss_model(Pin, Pout, Pnom)

% Reshape to column vectors
Pin = reshape(Pin, length(Pin), 1);
Pout = reshape(Pout, length(Pout), 1);

% Normalize power (per unit)
Pin_pu = Pin / Pnom;
Pout_pu = Pout / Pnom;

% Assemble OLS matrix
Y = Pin_pu - Pout_pu; % Loss
X = [ones(size(Pout_pu)), Pout_pu, Pout_pu.^2];

% Execute OLS regression
alpha = regress(Y, X);

% More verbose options are available from regress if desired; see docs

endfunction