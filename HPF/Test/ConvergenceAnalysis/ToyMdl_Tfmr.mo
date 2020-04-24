within HPF.Test.ConvergenceAnalysis;

model ToyMdl_Tfmr
  import Modelica.ComplexMath.j;
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {74, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop(pwr = 100) annotation(
    Placement(visible = true, transformation(origin = {74, -14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0, 4.5089, 2.615, 4.5991, 0.35989, 0.01854, 2.2161, 2.8351, 2.5812, 0.53364, 4.2314, -0.43239, 3.7456, 3.6024, 3.8848}, vMag = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}) annotation(
    Placement(visible = true, transformation(origin = {-122, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-122, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-40, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:9}) annotation(
    Placement(visible = true, transformation(origin = {-109, 63.3333}, extent = {{-13, -15.1667}, {13, 10.8333}}, rotation = 0)));
  HPF.Transformers.SinglePhase.Simplified_test simplified(Rc = 1e6, Rp = 1e-5, Rs = 1e-5, Xm = 1e6, Xp = 1e-5, Xs = 1e-5, fEC = 0.1, fOSL = 0.1, fW = 1) annotation(
    Placement(visible = true, transformation(origin = {-74, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_InitiMdl aC2DC_SinglePhase_New(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat", nomP = 120) annotation(
    Placement(visible = true, transformation(origin = {34, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 100 + 60 * j) annotation(
    Placement(visible = true, transformation(origin = {52, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {120, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(laptop.n, ground2.p) annotation(
    Line(points = {{74, -24}, {74, -28}}, color = {0, 0, 255}));
  connect(v.pin_n, ground1.pin) annotation(
    Line(points = {{-122, -4}, {-122, -30.75}}, color = {117, 80, 123}));
  connect(v.pin_p, simplified.pinP_prim) annotation(
    Line(points = {{-122, 16}, {-122, 26}, {-84, 26}}, color = {92, 53, 102}));
  connect(ground1.pin, simplified.pinN_prim) annotation(
    Line(points = {{-122, -30.75}, {-104, -30.75}, {-104, 6}, {-84, 6}}, color = {92, 53, 102}));
  connect(aC2DC_SinglePhase_New.hPin_P, simplified.pinP_sec) annotation(
    Line(points = {{24, -4}, {-16, -4}, {-16, 26}, {-64, 26}}, color = {92, 53, 102}));
  connect(aC2DC_SinglePhase_New.pin_n, laptop.n) annotation(
    Line(points = {{44, -16}, {44, -24}, {74, -24}}, color = {0, 0, 255}));
  connect(aC2DC_SinglePhase_New.pin_p, laptop.p) annotation(
    Line(points = {{44, -4}, {74, -4}}, color = {0, 0, 255}));
  connect(aC2DC_SinglePhase_New.hPin_N, ground.pin) annotation(
    Line(points = {{24, -16}, {-40, -16}, {-40, -25}}, color = {117, 80, 123}));
  connect(z1.pin_p, simplified.pinP_sec) annotation(
    Line(points = {{42, 26}, {-64, 26}}, color = {92, 53, 102}));
  connect(z1.pin_n, ground4.pin) annotation(
    Line(points = {{62, 26}, {120, 26}, {120, 17.25}}, color = {117, 80, 123}));
  connect(simplified.pinN_sec, ground.pin) annotation(
    Line(points = {{-64, 6}, {-40, 6}, {-40, -25}}, color = {117, 80, 123}));
  annotation(
    Diagram(coordinateSystem(extent = {{-150, -150}, {150, 150}}), graphics = {Text(origin = {-8, 103}, extent = {{-124, 21}, {124, -21}}, textString = "Toy model with a single phase transformer.\nThe transformer model has a simplified core reactance branch.", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    Documentation(info = "<html><head></head><body>Test model based on the punch list. Simulating a single phase transformer with a converter.</body></html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_SOLVER,LOG_STATS,LOG_SUCCESS", outputFormat = "mat", s = "dassl", nls = "newton"));
end ToyMdl_Tfmr;