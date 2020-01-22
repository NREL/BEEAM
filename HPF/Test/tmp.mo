within HPF.Test;
model tmp
  parameter Real f = 60;
  parameter Real fs = 1 / 1e-4;
  parameter Real ts = 1e-4;
  parameter Integer N(start = 0) = integer(floor(fs / f));
  // read fft data from file, all harmonics
  final parameter String resVal = Modelica.Utilities.Files.loadResource("modelica://" + "HPF.Test/test_fft_mag_arg.mat");
  final parameter Integer matDim[2] = Modelica.Utilities.Streams.readMatrixSize(resVal, "mag");
  final parameter Real data_mag_all[:, :] = Modelica.Utilities.Streams.readRealMatrix(resVal, "mag", matDim[1], 1);
  final parameter Real data_arg_all[:, :] = Modelica.Utilities.Streams.readRealMatrix(resVal, "arg", matDim[1], 1);
  final parameter Real mag[:] = data_mag_all[:, 1];
  final parameter Real arg[:] = data_arg_all[:, 1];
  Real y_all[N](each start = 0);
  Real y_wv_all(start = 0);

  Integer k1(start = 1);
  Integer k2(start = 1);
 
initial algorithm

equation

algorithm
  when sample(2*ts, 3 * ts) and k2 == 0 then
    y_wv_all := y_all[k1];
    k1 := k1 + 1;
  end when;
  when sample(0, ts) and k2 == 1 then
    y_all := HPF.Utilities.ifft_fromMagPhase(mag, arg, N);
    k2 := 0;
  end when;
  
equation

  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end tmp;