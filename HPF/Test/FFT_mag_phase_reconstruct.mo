within HPF.Test;
model FFT_mag_phase_reconstruct
  parameter Real f = 60;
  parameter Real fs = 1 / 1e-4;
  parameter Real ts = 1e-4;
  parameter Integer N(start = 0) = integer(floor(fs / f));
  // read fft data from file.
  final parameter String resourceRetVal_fft = Modelica.Utilities.Files.loadResource("modelica://" + "HPF.Test/test_fft_mag_arg.mat");
  final parameter Integer matDim_fft[2] = Modelica.Utilities.Streams.readMatrixSize(resourceRetVal_fft, "mag");
  final parameter Real data_mag[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetVal_fft, "mag", matDim_fft[1], 1);
  final parameter Real data_arg[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetVal_fft, "arg", matDim_fft[1], 1);
  final parameter Real mag1[:] = data_mag[:, 1];
  final parameter Real arg1[:] = data_arg[:, 1];

  Real y[N](each start = 0);
  Real y_wv(start = 0);
  Integer k1(start = 1);
  Integer k2(start = 1);

initial algorithm

equation

algorithm
  when sample(2*ts, 3 * ts) and k2 == 0 then
    y_wv := y[k1];
    k1 := k1 + 1;
  end when;
  when sample(0, ts) and k2 == 1 then
    y := HPF.Utilities.ifft_fromMagPhase(mag1, arg1, N);
    k2 := 0;
  end when;
  
equation

  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end FFT_mag_phase_reconstruct;
