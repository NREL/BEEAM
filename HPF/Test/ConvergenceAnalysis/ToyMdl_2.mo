within HPF.Test.ConvergenceAnalysis;
model ToyMdl_2
  import Modelica.ComplexMath.j;
  final parameter Real nomV_prim = 480;
  final parameter Real nomV_sec = 120;
  final parameter Real phi_prim = 480;
  final parameter Real phi_sec = 480;

  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {146, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop(pwr = 200) annotation (
    Placement(visible = true, transformation(origin = {146, -14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource a_vSrc(vArg = {0, 4.5089, 2.615, 4.5991, 0.35989, 0.01854, 2.2161, 2.8351, 2.5812, 0.53364, 4.2314, -0.43239, 3.7456, 3.6024, 3.8848}, vMag = {487.7627, 0.91617, 0.81491, 1.2815, 0.21775, 1.2772, 0.74078, 0.10099, 0.50588, 0.10175, 0.027276, 0.05042, 0.029467, 0.014962, 0.030422}) annotation (
    Placement(visible = true, transformation(origin = {-122, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-122, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-22, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin = {-109, 63.3333}, extent = {{-13, -15.1667}, {13, 10.8333}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_InitiMdl conv(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1_3D.mat", nomP = 200) annotation (
    Placement(visible = true, transformation(origin = {92, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance Z(z = 100 + 3.7699e-04 * j) annotation (
    Placement(visible = true, transformation(origin = {104, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.IdealTransformer idealTransformer(N = 480 / 120, start_v_im_prim = cat(1, {nomV_prim * sin(phi_prim)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_im_sec = cat(1, {nomV_sec * sin(phi_sec)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re_prim = cat(1, {nomV_prim * cos(phi_prim)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re_sec = cat(1, {nomV_sec * cos(phi_sec)}, {0.0 for i in 1:systemDef.numHrm - 1}))  annotation (
    Placement(visible = true, transformation(origin = {-44, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(laptop.n, ground2.p) annotation (
    Line(points = {{146, -24}, {146, -28}}, color = {0, 0, 255}));
  connect(a_vSrc.pin_n, ground1.pin) annotation (
    Line(points = {{-122, -4}, {-122, -28.75}}, color = {117, 80, 123}));
  connect(conv.pin_n, laptop.n) annotation (
    Line(points = {{102, -22}, {124, -22}, {124, -24}, {146, -24}}, color = {0, 0, 255}));
  connect(conv.pin_p, laptop.p) annotation (
    Line(points = {{102, -10}, {128, -10}, {128, -4}, {146, -4}}, color = {0, 0, 255}));
  connect(conv.hPin_N, ground.pin) annotation (
    Line(points = {{82, -22}, {82, -20.75}, {68, -20.75}, {68, -15.5}, {-22, -15.5}, {-22, -27}}, color = {117, 80, 123}));
  connect(Z.pin_n, ground4.pin) annotation (
    Line(points = {{114, 28}, {130, 28}, {130, 21}}, color = {117, 80, 123}));
  connect(idealTransformer.pinP_Sec, Z.pin_p) annotation (
    Line(points = {{-34, 28}, {94, 28}}, color = {92, 53, 102}));
  connect(idealTransformer.pinP_Sec, conv.hPin_P) annotation (
    Line(points = {{-34, 28}, {48, 28}, {48, -10}, {82, -10}}, color = {92, 53, 102}));
  connect(idealTransformer.pinP_Prim, a_vSrc.pin_p) annotation (
    Line(points = {{-54, 28}, {-122, 28}, {-122, 16}, {-122, 16}}, color = {92, 53, 102}));
  connect(idealTransformer.pinN_Prim, ground1.pin) annotation (
    Line(points = {{-54, 8}, {-86, 8}, {-86, -30}, {-122, -30}, {-122, -28}}, color = {117, 80, 123}));
  connect(idealTransformer.pinN_Sec, ground.pin) annotation (
    Line(points = {{-34, 8}, {-22, 8}, {-22, -27}}, color = {117, 80, 123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-150, -150}, {150, 150}}, initialScale = 0.1), graphics = {Text(origin = {-27, 116}, extent = {{-101, 10}, {101, -10}}, textString = "Toy model:
Nominal initialization values.", horizontalAlignment = TextAlignment.Left), Text(origin = {-68, -99}, extent = {{-76, 7}, {76, -7}}, textString = "Renaming voltage source
(workaround for bug in modelicaImort function in MATLAB)", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    Documentation(info = "<html><head></head><body>Test model based on the punch list. Simulating a single phase transformer with a converter.</body></html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-09, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_INIT,LOG_INIT_V,LOG_RES_INIT,LOG_SIMULATION,LOG_SOLVER,LOG_SOLVER_V,LOG_SOLVER_CONTEXT,LOG_STATS,LOG_STATS_V,LOG_SUCCESS", outputFormat = "mat", s = "dassl", nls = "newton", iim = "none"));
end ToyMdl_2;
