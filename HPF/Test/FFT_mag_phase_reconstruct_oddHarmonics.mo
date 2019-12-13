within HPF.Test;
model FFT_mag_phase_reconstruct_oddHarmonics
  parameter Real f = 60;
  parameter Real fs = 1 / 1e-4;
  parameter Real ts = 1e-4;
  parameter Integer N(start = 0) = integer(floor(fs / f));
  // read fft data from file, odd harmonics
  final parameter String resourceRetVal_fft = Modelica.Utilities.Files.loadResource("modelica://" + "HPF.Test/test_fft_mag_arg_oddHrms.mat");
  final parameter Integer matDim_fft[2] = Modelica.Utilities.Streams.readMatrixSize(resourceRetVal_fft, "mag");
  final parameter Real data_mag[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetVal_fft, "mag", matDim_fft[1], 1);
  final parameter Real data_arg[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetVal_fft, "arg", matDim_fft[1], 1);
  Real magOdd[matDim_fft[1]] = data_mag[:, 1];
  Real argOdd[matDim_fft[1]] = data_arg[:, 1];
  Real y[N](each start = 0);
  Real y_wv(start = 0);
  // read fft data from file, odd harmonics (even zero)
  final parameter String resourceRetVal_fft_EZ = Modelica.Utilities.Files.loadResource("modelica://" + "HPF.Test/test_fft_mag_arg_evenZero.mat");
  final parameter Integer matDim_fft_EZ[2] = Modelica.Utilities.Streams.readMatrixSize(resourceRetVal_fft_EZ, "mag");
  final parameter Real data_mag_EZ[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetVal_fft_EZ, "mag", matDim_fft_EZ[1], 1);
  final parameter Real data_arg_EZ[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetVal_fft_EZ, "arg", matDim_fft_EZ[1], 1);
  Real magOdd_EZ[matDim_fft_EZ[1]] = data_mag_EZ[:, 1];
  Real argOdd_EZ[matDim_fft_EZ[1]] = data_arg_EZ[:, 1];
  Real y_EZ[N](each start = 0);
  Real y_wv_EZ(start = 0);
  // read fft data from file, all harmonics
  final parameter String resVal = Modelica.Utilities.Files.loadResource("modelica://" + "HPF.Test/test_fft_mag_arg.mat");
  final parameter Integer matDim[2] = Modelica.Utilities.Streams.readMatrixSize(resVal, "mag");
  final parameter Real data_mag_all[:, :] = Modelica.Utilities.Streams.readRealMatrix(resVal, "mag", matDim[1], 1);
  final parameter Real data_arg_all[:, :] = Modelica.Utilities.Streams.readRealMatrix(resVal, "arg", matDim[1], 1);
  Real mag[matDim_fft_EZ[1]] = data_mag_all[:, 1];
  Real arg[matDim_fft_EZ[1]] = data_arg_all[:, 1];
  Real y_all[N](each start = 0);
  Real y_wv_all(start = 0);

  Integer k1(start = 1);
  Integer k2(start = 1);

  // simulating a scenario in simulation with only odd harmonics

  final parameter Integer M = integer(floor(matDim_fft[1]/2));
  //Real mag[M](each start = 0);
  //Real arg[M](each start = 0);
  //Real y_odd[N](each start = 0);
 // Real y_wv_odd(start = 0);
 // Real magEvenZero[M * 2](each start = 0);
  //Real argEvenZero[M * 2](each start = 0);
initial algorithm

equation
// get fft complex data from file mag and phase data
  //(yRe[1:N], yIm[1:N]) := HPF.Utilities.fft_fromMagPhase(mag1, arg1, N);
// odd harmonics


algorithm
  when sample(2*ts, 3 * ts) and k2 == 0 then
    y_wv := y[k1];
    y_wv_EZ := y_EZ[k1];
    y_wv_all := y_all[k1];
   // y_wv_odd := y_odd[k1];
    k1 := k1 + 1;
  end when;
  when sample(0, ts) and k2 == 1 then
    y := HPF.Utilities.ifft_fromMagPhaseOddHrms(magOdd, argOdd, N);
    y_EZ := HPF.Utilities.ifft_fromMagPhase(magOdd_EZ, argOdd_EZ, N);
    y_all := HPF.Utilities.ifft_fromMagPhase(mag, arg, N);
    k2 := 0;
  end when;
equation

  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end FFT_mag_phase_reconstruct_oddHarmonics;
