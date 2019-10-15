within HPF.Test;
model FFT_Test

  //Integer ret = FFT_wrapper({Complex(1, 3), Complex(3, 5)});
  
  Complex a[16] = {Complex(1, 0.0),
                  Complex(1, 0),
                  Complex(1, 0),
                  Complex(1, 0),
                  Complex(1, 0),
                  Complex(0, 0),
                  Complex(0, 0),
                  Complex(0, 0),
                  Complex(0, 0),
                  Complex(0, 0),
                  Complex(0, 0),
                  Complex(0, 0),
                  Complex(0, 0),
                  Complex(0, 0),
                  Complex(1, 0),
                  Complex(1, 0)};
   
  final Integer retVal(each start=0, each fixed=true);
  final output Real yRe1[16](each start=0, each fixed=true);
  final output Real yIm1[16](each start=0, each fixed=true);
  
  Integer k(start = 0); // keeps track of number of events 
algorithm
  /*
    When running the model in the algorithm block without a time
    sampled event, the compiler throws an error.
      The initialization problem is inconsistent due to the following equation: 0 != -7 = $START.yRe1[1] - yRe1[1]
    A workaround is, to put the fft function call in a when block.
    
  */
  
  when time >  1e-3 then
    k := k + 1;
      (retVal, yRe1, yIm1) := HPF.Utilities.fft(a.re, a.im);
  end when;
  
  

equation
  //aRe[:] = a[:].re;
end FFT_Test;
