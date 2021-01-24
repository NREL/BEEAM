within HPF.Test;

model Test_timeSeriesInput
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Components.Impedance Z01(z = 0.8 + 0.008 * j) annotation(
    Placement(visible = true, transformation(origin = {-26, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:15}) annotation(
    Placement(visible = true, transformation(origin = {-84.1847, 30.4921}, extent = {{-9.81534, -9.81533}, {9.81534, 7.01095}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance Z12(z = 25 + 0.3013 * j) annotation(
    Placement(visible = true, transformation(origin = {38, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl ACDC_Converter(V_Rect = 24, nomP = 50) annotation(
    Placement(visible = true, transformation(origin = { 14, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-44, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {46, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource V0(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {0 for i in 2:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-44, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.Variable_DC_Load variable_DC_Load annotation(
    Placement(visible = true, transformation(origin = {46, 4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Noise.NormalNoise timeSeriesInput(mu = 50, samplePeriod = 15, sigma = 5, useAutomaticLocalSeed = true, useGlobalSeed = true)  annotation(
    Placement(visible = true, transformation(origin = {74, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Z01.pin_n, Z12.pin_p) annotation(
    Line(points = {{-16, 38}, {28, 38}}, color = {117, 80, 123}));
  connect(ACDC_Converter.hPin_N, ground.pin) annotation(
    Line(points = {{4, 2}, {-4, 2}, {-4, -36}, {-44, -36}}, color = {117, 80, 123}));
  connect(Z01.pin_p, V0.pin_p) annotation(
    Line(points = {{-36, 38}, {-44, 38}, {-44, 20}}));
  connect(V0.pin_n, ground.pin) annotation(
    Line(points = {{-44, 0}, {-44, -36}}, color = {117, 80, 123}));
  connect(Z12.pin_n, ground.pin) annotation(
    Line(points = {{48, 38}, {66, 38}, {66, -36}, {-44, -36}}, color = {117, 80, 123}));
  connect(ACDC_Converter.hPin_P, Z01.pin_n) annotation(
    Line(points = {{4, 14}, {-4, 14}, {-4, 38}, {-16, 38}}, color = {92, 53, 102}));
  connect(ACDC_Converter.pin_p, variable_DC_Load.p) annotation(
    Line(points = {{24, 14}, {46, 14}}, color = {0, 0, 255}));
  connect(ACDC_Converter.pin_n, ground1.p) annotation(
    Line(points = {{24, 2}, {32, 2}, {32, -10}, {45, -10}, {45, -12}, {46, -12}}, color = {0, 0, 255}));
  connect(variable_DC_Load.n, ground1.p) annotation(
    Line(points = {{46, -6}, {46, -12}}, color = {0, 0, 255}));
  connect(timeSeriesInput.y, variable_DC_Load.u) annotation(
    Line(points = {{85, 60}, {98, 60}, {98, 4}, {51, 4}}, color = {0, 0, 127}));

annotation(
    Documentation(info = "<html><head></head><body>Time series input testing using a random number generator.<div><br></div><div>Setup time for the time series is in the random number generator.</div><div><br></div><div><b>Setting time step = 5 sec</b></div><div><b><br></b></div><div><b><br></b></div></body></html>"),
    experiment(StartTime = 0, StopTime = 1800, Tolerance = 1e-6, Interval = 1),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_INIT,LOG_RES_INIT,LOG_SIMULATION,LOG_SOTI", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Test_timeSeriesInput;