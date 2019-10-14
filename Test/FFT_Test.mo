within HPF.Test;
model FFT_Test

  //Integer ret = FFT_wrapper({Complex(1, 3), Complex(3, 5)});
  /*
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
                  */
  //Complex y[16];
   
  
  final Integer retVal(each start=0, each fixed=true);

  Real aRe[16] = {1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1};// = a[:].re;
  Real aIm[16] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  
  final output Real yRe1[16](each start=0, each fixed=true);
  final output Real yIm1[16](each start=0, each fixed=true);
  
  Integer k;
algorithm
  /*
    When running the model in the algorithm block without a time
    sampled event, the compiler throws an error.
      The initialization problem is inconsistent due to the following equation: 0 != -7 = $START.yRe1[1] - yRe1[1]
    A workaround is, to put the fft function call in a when block.
    
  */
  when sample(0, 1e-3) then
    k := k + 1;
    if k > 2 then
      (retVal, yRe1, yIm1) := func_FFT_Modelica(aRe, aIm);
    end if;
  end when;
  
  

equation
  //aRe[:] = a[:].re;
end FFT_Test;
