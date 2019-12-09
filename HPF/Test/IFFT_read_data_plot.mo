within HPF.Test;
model IFFT_read_data_plot
  //Integer ret = FFT_wrapper({Complex(1, 3), Complex(3, 5)});
  Complex a[16] = {Complex(1, 0.0), Complex(1, 0), Complex(1, 0), Complex(1, 0), Complex(1, 0), Complex(0, 0), Complex(0, 0), Complex(0, 0), Complex(0, 0), Complex(0, 0), Complex(0, 0), Complex(0, 0), Complex(0, 0), Complex(0, 0), Complex(1, 0), Complex(1, 0)};
  
  final output Real yRe1[16](each start = 0, each fixed = true);
  final output Real yIm1[16](each start = 0, each fixed = true);
  Integer k(start = 0); // keeps track of number of events

  /*
    IFFT section. 
    Read the mat file containing data. 
    File name = 'test_waveform.mat'
    Sampling time = 1e-6
  */
  Real ts = 1e-6;
  final parameter String resourceRetVal = Modelica.Utilities.Files.loadResource("modelica://" + "HPF.Test/test_waveform.mat");
  final parameter Integer matDim[2] = Modelica.Utilities.Streams.readMatrixSize(resourceRetVal, "data");
  final parameter Real data[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetVal, "data", matDim[1], 1);

  Real y(start = 0);
  Integer k1(start = 1);
algorithm
/*
    When running the model in the algorithm block without a time
    sampled event, the compiler throws an error.
      The initialization problem is inconsistent due to the following equation: 0 != -7 = $START.yRe1[1] - yRe1[1]
    A workaround is, to put the fft function call in a when block.
    
  */
  when time >= ts then
    k := k + 1;
    (yRe1, yIm1) := HPF.Utilities.fft(a.re, a.im);
  end when;

  /*
    data plotting using sample
  */
  //if k >= 1
  when sample( 0, 1e-3) then
    y := data[k1, 1];
    k1 := k1 + 1;
  end when;

equation
//aRe[:] = a[:].re;
end IFFT_read_data_plot;