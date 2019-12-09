%% FFT from psuedocode
% An array of complex values which has a size of 2^m
%
% we will worry about how to compute the fft for size not equal to 2^m later.
% 
function y = _fft(u)
  N = length(u);
  if N == 1 
    %return (u);
  else 
  y = zeros(u, 1);
  WN = @(N)(exp((2*pi*1j)/N));
  W = 1;
  A_even = u(2:2:end);
  A_odd = u(1:2:end);
  y_even = _fft(A_even);
  y_odd = _fft(A_odd);
  for k = 0:1:N/2 - 1
    y(k) = y_even(k) + W * y_odd(k);
    y(k + N/2) = y_even(k) - W * y_odd(k);
    W = W * WN
  end
end
