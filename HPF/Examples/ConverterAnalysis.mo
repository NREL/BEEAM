within HPF.Examples;

model ConverterAnalysis
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Sources.VoltageSource vSrc(vArg = {0.0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {0 for i in 2:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-116, 48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-116, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance Z01(z = 2 + 3.7699e-07 * j) annotation(
    Placement(visible = true, transformation(origin = {-74, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 rect1(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/mld_timeDomSim_3D.mat") annotation(
    Placement(visible = true, transformation(origin = {-12, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 150) annotation(
    Placement(visible = true, transformation(origin = {16, 34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {16, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance Z12(z = 100 + 3.7699e-04 * j) annotation(
    Placement(visible = true, transformation(origin = {0, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {26, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {-34, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-102, 128}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
equation
  connect(vSrc.pin_p, Z01.pin_p) annotation(
    Line(points = {{-116, 58}, {-116, 58}, {-116, 72}, {-84, 72}, {-84, 72}}, color = {92, 53, 102}));
  connect(vSrc.pin_n, ground.pin) annotation(
    Line(points = {{-116, 38}, {-116, 38}, {-116, 26}, {-116, 26}}, color = {117, 80, 123}));
  connect(rect1.pin_p, dC_Load.p) annotation(
    Line(points = {{-2, 44}, {16, 44}}, color = {0, 0, 255}));
  connect(dC_Load.n, ground1.p) annotation(
    Line(points = {{16, 24}, {16, 18}}, color = {0, 0, 255}));
  connect(rect1.pin_n, dC_Load.n) annotation(
    Line(points = {{-2, 32}, {4, 32}, {4, 24}, {16, 24}}, color = {0, 0, 255}));
  connect(Z12.pin_p, Z01.pin_n) annotation(
    Line(points = {{-10, 72}, {-64, 72}, {-64, 72}, {-64, 72}}, color = {92, 53, 102}));
  connect(Z12.pin_n, ground2.pin) annotation(
    Line(points = {{10, 72}, {26, 72}, {26, 68}, {26, 68}}, color = {117, 80, 123}));
  connect(rect1.hPin_N, ground3.pin) annotation(
    Line(points = {{-22, 32}, {-34, 32}, {-34, 26}}, color = {117, 80, 123}));
  connect(rect1.hPin_P, Z01.pin_n) annotation(
    Line(points = {{-22, 44}, {-44, 44}, {-44, 72}, {-64, 72}}, color = {92, 53, 102}));
  annotation(
    Diagram(graphics = {Text(origin = {-103, 101}, extent = {{-35, 11}, {289, -9}}, textString = "Converter model analysis
Simulation model is an exact implementation of a time domain simulation
implemented in Simulink.", fontSize = 8, horizontalAlignment = TextAlignment.Left)}, coordinateSystem(extent = {{-150, -150}, {150, 150}}, initialScale = 0.1)),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags( lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end ConverterAnalysis;