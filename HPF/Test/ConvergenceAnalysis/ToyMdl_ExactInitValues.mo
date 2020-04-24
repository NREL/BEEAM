within HPF.Test.ConvergenceAnalysis;

model ToyMdl_ExactInitValues
  import Modelica.ComplexMath.j;
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {44, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop(pwr = 200) annotation(
    Placement(visible = true, transformation(origin = {44, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource a_vSrc(vArg = {0, 4.5089, 2.615, 4.5991, 0.35989, 0.01854, 2.2161, 2.8351, 2.5812, 0.53364, 4.2314, -0.43239, 3.7456, 3.6024, 3.8848}, vMag = {487.7627, 0.91617, 0.81491, 1.2815, 0.21775, 1.2772, 0.74078, 0.10099, 0.50588, 0.10175, 0.027276, 0.05042, 0.029467, 0.014962, 0.030422}) annotation(
    Placement(visible = true, transformation(origin = {-122, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-122, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-40, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-109, 51.3333}, extent = {{-13, -15.1667}, {13, 10.8333}}, rotation = 0)));
  HPF.Transformers.SinglePhase.Simplified_test T(Rc = 3.7626e+03, Rp = 2.7672, Rs = 0.2576, Xm = 711.1091, Xp = 1.1006, Xs = 0.5003, fEC = 0.0670, fOSL = 0.0330, fW = 0.9, nomV_prim = 487.1915, nomV_sec = 121.7979) annotation(
    Placement(visible = true, transformation(origin = {-74, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_InitiMdl conv(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/mld_timeDomSim_3D.mat", nomP = 202.2451, nomV = 120.9148) annotation(
    Placement(visible = true, transformation(origin = {4, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance Z(z = 100 + 3.7699e-04 * j) annotation(
    Placement(visible = true, transformation(origin = {22, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {50, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(laptop.n, ground2.p) annotation(
    Line(points = {{44, -18}, {44, -22}}, color = {0, 0, 255}));
  connect(a_vSrc.pin_n, ground1.pin) annotation(
    Line(points = {{-122, -4}, {-122, -30.75}}, color = {117, 80, 123}));
  connect(a_vSrc.pin_p, T.pinP_prim) annotation(
    Line(points = {{-122, 16}, {-122, 26}, {-84, 26}}, color = {92, 53, 102}));
  connect(ground1.pin, T.pinN_prim) annotation(
    Line(points = {{-122, -30.75}, {-104, -30.75}, {-104, 6}, {-84, 6}}, color = {92, 53, 102}));
  connect(conv.hPin_P, T.pinP_sec) annotation(
    Line(points = {{-6, 2}, {-16, 2}, {-16, 26}, {-64, 26}}, color = {92, 53, 102}));
  connect(conv.pin_n, laptop.n) annotation(
    Line(points = {{14, -10}, {14, -18}, {44, -18}}, color = {0, 0, 255}));
  connect(conv.pin_p, laptop.p) annotation(
    Line(points = {{14, 2}, {44, 2}}, color = {0, 0, 255}));
  connect(conv.hPin_N, ground.pin) annotation(
    Line(points = {{-6, -10}, {-40, -10}, {-40, -25}}, color = {117, 80, 123}));
  connect(Z.pin_p, T.pinP_sec) annotation(
    Line(points = {{12, 46}, {-10, 46}, {-10, 26}, {-64, 26}}, color = {92, 53, 102}));
  connect(Z.pin_n, ground4.pin) annotation(
    Line(points = {{32, 46}, {50, 46}, {50, 35}}, color = {117, 80, 123}));
  connect(T.pinN_sec, ground.pin) annotation(
    Line(points = {{-64, 6}, {-40, 6}, {-40, -25}}, color = {117, 80, 123}));
  annotation(
    Diagram(coordinateSystem(extent = {{-150, -150}, {150, 150}}), graphics = {Text(origin = {-27, 130}, extent = {{-101, 10}, {101, -10}}, textString = "Toy model:
Exace initialization values from time domain simulation.", horizontalAlignment = TextAlignment.Left), Text(origin = {-37, 105}, extent = {{-91, 7}, {91, -7}}, textString = "Simulating for first 10 odd harmonics.
Using the measured voltage data as input.", horizontalAlignment = TextAlignment.Left), Text(origin = {-50, -63}, extent = {{-76, 7}, {76, -7}}, textString = "Renaming voltage source
(workaround for bug in modelicaImort function in MATLAB)", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    Documentation(info = "<html><head></head><body>Test model based on the punch list. Simulating a single phase transformer with a converter.</body></html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_SOLVER,LOG_STATS,LOG_SUCCESS", outputFormat = "mat", s = "dassl", nls = "newton"));
end ToyMdl_ExactInitValues;