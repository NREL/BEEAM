
function [alpha, beta, gamma] = efficiency_modeling(Pin, Pout, debugInfo)

if debugInfo == 1
   dispOpt =  'iter-detailed';
else
    dispOpt =  'final';
end

%% P_in = P_out + (alpha + beta * (P_out) + gamma * (P_out)^2)
func = @(x)(Pout + x(1) + x(2)*Pout + x(3)*Pout.^2);

objFunc = @(x)(sum((func(x) - Pin).^2));

options = optimset('Display', dispOpt, 'TolX', 1e-10, 'MaxIter', 1e3);

x0 = [0; 0.1; 0.1];
[sol, fval] = fminsearch(objFunc, x0, options);

% return model coefficients
alpha = sol(1);
beta = sol(2);
gamma = sol(3);
