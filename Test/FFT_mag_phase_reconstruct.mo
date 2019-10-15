within HPF.Test;
model FFT_mag_phase_reconstruct

  parameter Real f = 60;
  parameter Real fs = 1 / 1e-4;
  parameter Integer N(start = 0) = integer(floor(fs / f));
  
 
  // read fft data from file.
  final parameter String resourceRetVal_fft = Modelica.Utilities.Files.loadResource("modelica://" + "HPF.Test/test_fft_mag_arg.mat");
  final parameter Integer matDim_fft[2] = Modelica.Utilities.Streams.readMatrixSize(resourceRetVal_fft, "mag");
  final parameter Real data_mag[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetVal_fft, "mag", matDim_fft[1], 1);
  final parameter Real data_arg[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetVal_fft, "arg", matDim_fft[1], 1);

   
  final parameter Real mag1[:] = data_mag[:, 1];
  final parameter Real arg1[:] = data_arg[:, 1];
  // Real tmp
  
  
  Real yRe[N](each start = 0);
  Real yIm[N](each start = 0);
  Real y[N, 2](each start = 0);

algorithm
  (yRe[1:N], yIm[1:N]) := HPF.Utilities.fft_fromMagPhase(mag1, arg1, N);
  y[1:N, 1] := yRe[1:N];
  y[1:N, 2] := yIm[1:N];
  Modelica.Utilities.Streams.writeRealMatrix("fft_Construct.mat", "y", y);
equation


end FFT_mag_phase_reconstruct;
