within HPF.Test.ConvergenceAnalysis;
model ToyMdl_ExactInitValues
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Sources.VoltageSource a_vSrc(vArg = {0, 4.5089, 2.615, 4.5991, 0.35989, 0.01854, 2.2161, 2.8351, 2.5812, 0.53364, 4.2314, -0.43239, 3.7456, 3.6024, 3.8848}, vMag = {487.7627, 0.91617, 0.81491, 1.2815, 0.21775, 1.2772, 0.74078, 0.10099, 0.50588, 0.10175, 0.027276, 0.05042, 0.029467, 0.014962, 0.030422}) annotation (
    Placement(visible = true, transformation(origin = {-122, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-122, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-40, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin = {-109, 51.3333}, extent = {{-13, -15.1667}, {13, 10.8333}}, rotation = 0)));
  HPF.Test.ConvergenceAnalysis.Simplified_init T(Rc = 3.7626e+03, Rp = 2.7672, Rs = 0.2576, Xm = 711.1091, Xp = 1.1006, Xs = 0.5003, fEC = 0.0670, fOSL = 0.0330, fW = 0.9, nomV_prim = 480) annotation (
    Placement(visible = true, transformation(origin = {-76, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance Z(z = 100 + 3.7699e-04 * j) annotation (
    Placement(visible = true, transformation(origin = {64, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {92, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop(pwr = 200) annotation (
    Placement(visible = true, transformation(origin = {86, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {86, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_InitiMdl conv(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/mld_timeDomSim_3D.mat", nomP = 200, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {46, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(a_vSrc.pin_n, ground1.pin) annotation (
    Line(points = {{-122, -4}, {-122, -30.75}}, color = {117, 80, 123}));
  connect(a_vSrc.pin_p, T.pinP_prim) annotation (
    Line(points = {{-122, 16}, {-122, 24}, {-86, 24}}, color = {92, 53, 102}));
  connect(ground1.pin, T.pinN_prim) annotation (
    Line(points = {{-122, -30.75}, {-104, -30.75}, {-104, 4}, {-86, 4}}, color = {92, 53, 102}));
  connect(Z.pin_n, ground4.pin) annotation (
    Line(points = {{74, 46}, {92, 46}, {92, 35}}, color = {117, 80, 123}));
  connect(T.pinN_sec, ground.pin) annotation (
    Line(points = {{-66, 4}, {-40, 4}, {-40, -25}}, color = {117, 80, 123}));
  connect(laptop.n, ground2.p) annotation (
    Line(points = {{86, -18}, {86, -22}}, color = {0, 0, 255}));
  connect(conv.hPin_N, ground.pin) annotation (
    Line(points = {{36, -10}, {-40, -10}, {-40, -25}}, color = {117, 80, 123}));
  connect(conv.pin_p, laptop.p) annotation (
    Line(points = {{56, 2}, {86, 2}}, color = {0, 0, 255}));
  connect(conv.pin_n, laptop.n) annotation (
    Line(points = {{56, -10}, {56, -18}, {86, -18}}, color = {0, 0, 255}));
  connect(T.pinP_sec, Z.pin_p) annotation (
    Line(points = {{-66, 24}, {18, 24}, {18, 46}, {54, 46}, {54, 46}}, color = {92, 53, 102}));
  connect(conv.hPin_P, T.pinP_sec) annotation (
    Line(points = {{36, 2}, {18, 2}, {18, 24}, {-66, 24}, {-66, 24}}, color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-150, -150}, {150, 150}}), graphics = {Text(origin = {-27, 130}, extent = {{-101, 10}, {101, -10}}, textString = "Toy model:
Exace initialization values from time domain simulation.", horizontalAlignment = TextAlignment.Left), Text(origin = {-37, 105}, extent = {{-91, 7}, {91, -7}}, textString = "Simulating for first 10 odd harmonics.
Using the measured voltage data as input.", horizontalAlignment = TextAlignment.Left), Text(origin = {-50, -63}, extent = {{-76, 7}, {76, -7}}, textString = "Renaming voltage source
(workaround for bug in modelicaImort function in MATLAB)", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    Documentation(info = "<html><head></head><body>Test model based on the punch list. Simulating a single phase transformer with a converter.</body></html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_INIT,LOG_INIT_HOMOTOPY,LOG_INIT_V,LOG_RES_INIT,LOG_SIMULATION,LOG_SOLVER,LOG_SOLVER_CONTEXT,LOG_SOTI,LOG_STATS,LOG_STATS_V,LOG_SUCCESS", outputFormat = "mat", s = "dassl", nls = "newton", iim = "none"));
end ToyMdl_ExactInitValues;
