within HPF.Test;

function FFT_wrapper "wrapper function for FFT" 
  input Complex u[:];

  output Integer y;
algorithm
  
  y := func_FFT(u[:].re, u[:].im);

end FFT_wrapper;