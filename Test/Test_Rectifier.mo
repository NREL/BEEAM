within HPF.Test;
model Test_Rectifier
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5})  annotation (
    Placement(visible = true, transformation(origin = {-55, 23}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0, 0, 0}, vMag = {100, 0, 0})  annotation (
    Placement(visible = true, transformation(origin = {-64, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = 10 + 0 * j)  annotation (
    Placement(visible = true, transformation(origin = {-42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-64, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 50)  annotation (
    Placement(visible = true, transformation(origin = {22, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {8, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase AC2DC_SinglePhase(V_Rect = 50, efficiency = 0.9, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_laptop.mat")  annotation(
    Placement(visible = true, transformation(origin = {-16, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(z.pin_p, v.pin_p) annotation(
    Line(points = {{-52, 0}, {-64, 0}}));
  connect(v.pin_n, ground1.pin) annotation(
    Line(points = {{-64, -20}, {-64, -26}}, color = {117, 80, 123}));
  connect(ground2.p, resistor1.n) annotation(
    Line(points = {{8, -28}, {22, -28}, {22, -20}}, color = {0, 0, 255}));
  connect(z.pin_n, AC2DC_SinglePhase.hPin_P) annotation(
    Line(points = {{-32, 0}, {-26, 0}}, color = {117, 80, 123}));
  connect(AC2DC_SinglePhase.hPin_N, v.pin_n) annotation(
    Line(points = {{-26, -12}, {-40, -12}, {-40, -20}, {-64, -20}}, color = {117, 80, 123}));
  connect(AC2DC_SinglePhase.pin_p, resistor1.p) annotation(
    Line(points = {{-6, 0}, {22, 0}}, color = {0, 0, 255}));
  connect(AC2DC_SinglePhase.pin_n, ground2.p) annotation(
    Line(points = {{-6, -12}, {8, -12}, {8, -28}}, color = {0, 0, 255}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0})),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(ls = "totalpivot", lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"));
end Test_Rectifier;