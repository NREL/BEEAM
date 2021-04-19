within HPF.Test;
model IFFT_Test

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


  parameter Real uRe[matDim[1]](each start = 0) = data[:, 1];
  parameter Real uIm[matDim[1]](each start = 0);  // imaginary part is zero for real data
  final output Real y_fftRe[matDim[1]](each start = 0, each fixed = true);
  final output Real y_fftIm[matDim[1]](each start = 0, each fixed = true);

  // reading fft data from file
  final parameter String resourceRetVal_fft = Modelica.Utilities.Files.loadResource("modelica://" + "HPF.Test/test_waveform_fft.mat");
  final parameter Integer matDim_fft[2] = Modelica.Utilities.Streams.readMatrixSize(resourceRetVal_fft, "uRe");
  final parameter Real dataFFT_re[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetVal_fft, "uRe", matDim_fft[1], 1);
  final parameter Real dataFFT_im[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetVal_fft, "uIm", matDim_fft[1], 1);
  final parameter Real u_FFTRe[:] = dataFFT_re[:, 1];
  final parameter Real u_FFTIm[:] = dataFFT_im[:, 1];
  final output Real y_ifftRe[matDim_fft[1]](each start = 0, each fixed = true);
  final output Real y_ifftIm[matDim_fft[1]](each start = 0, each fixed = true);
 // parameter Real uRe[matDim[1]](each start = 0) = data[:, 1];
  //parameter Real uIm[matDim[1]](each start = 0);  // imaginary part is zero for real data
  Real y1(start = 0);

  Real y(start = 0);
  Integer k1(start = 1);
  Integer k2(start = 1);
  Integer k3(start = 1);
  //final Integer retVal(each start = 0, each fixed = true);
algorithm
/*
    When running the model in the algorithm block without a time
    sampled event, the compiler throws an error.
      The initialization problem is inconsistent due to the following equation: 0 != -7 = $START.yRe1[1] - yRe1[1]
    A workaround is, to put the fft function call in a when block.
    
  */
  /*
  when time >= ts then
    k := k + 1;
    (retVal, y_fftRe, y_fftIm) := HPF.Utilities.fft(uRe, uIm);
  end when;
  */
  /*
    data plotting using sample()
  */
  //if k >= 1
  when sample(1e-3, 2*1e-3) and k2 == 0 then
    y := data[k1, 1];
    y1 := y_ifftRe[k1];
    k1 := k1 + 1;
  end when;

  when sample( 1e-3, 2*1e-3) and k2 == 1 then
    k2 := 0;

      // do an fft
      (y_fftRe, y_fftIm) := HPF.Utilities.fft(uRe, uIm);
      // do an ifft
      (y_ifftRe, y_ifftIm) := HPF.Utilities.ifft(u_FFTRe, u_FFTIm);
      k3 := k3 + 1;

  end when;


equation

end IFFT_Test;
