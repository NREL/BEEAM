within HPF.Examples;

model Demo
  inner HPF.SystemDef systemDef(hrms = {k for k in 1:2:15}) annotation(
    Placement(visible = true, transformation(origin = {-64, 59}, extent = {{-16, -18.6667}, {16, 13.3333}}, rotation = 0)));
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {26, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {1e-3 for i in 2:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-78, 16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = 0.5 + 0.02 * j) annotation(
    Placement(visible = true, transformation(origin = {-50, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_basic led_driver(V_Rect = 24, efficiency = 0.95, mdlMag = {1.0000, 0.8904, 0.7418, 0.5673, 0.3937, 0.2526, 0.1565, 0.1086, 0.1028, 0.1117, 0.1074, 0.0875, 0.0578, 0.0366, 0.0289, 0.0275}, mdlArg = {0.3876, -2.1790, 1.6303, -0.7953, 3.1273, 0.8908, -1.1864, -2.9993, 1.4699, -0.6068, -2.8447, 1.1602, -1.0324, -2.9612, 1.5582, -0.3532}) annotation(
    Placement(visible = true, transformation(origin = {-8, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Load load annotation(
    Placement(visible = true, transformation(origin = {26, 16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(extent = {{42, 52}, {68, 78}}, rotation = 0), iconTransformation(extent = {{42, 52}, {68, 78}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(extent = {{68, 2}, {42, 28}}, rotation = 0), iconTransformation(extent = {{68, 2}, {42, 28}}, rotation = 0)));
equation
  connect(v.pin_p, z.pin_p) annotation(
    Line(points = {{-78, 26}, {-60, 26}}));
  connect(v.pin_n, ground.pin) annotation(
    Line(points = {{-78, 6}, {-78, 0}}, color = {117, 80, 123}));
  connect(z.pin_n, led_driver.hPin_P) annotation(
    Line(points = {{-40, 26}, {-20, 26}, {-20, 26}, {-18, 26}}, color = {117, 80, 123}));
  connect(v.pin_n, led_driver.hPin_N) annotation(
    Line(points = {{-78, 6}, {-40, 6}, {-40, 14}, {-18, 14}, {-18, 14}, {-18, 14}}, color = {117, 80, 123}));
  connect(led_driver.pin_n, ground2.p) annotation(
    Line(points = {{2, 14}, {14, 14}, {14, 0}, {26, 0}}, color = {0, 0, 255}));
  connect(led_driver.pin_p, load.p) annotation(
    Line(points = {{2, 26}, {26, 26}, {26, 26}, {26, 26}}, color = {0, 0, 255}));
  connect(ground2.p, load.n) annotation(
    Line(points = {{26, 0}, {26, 0}, {26, 6}, {26, 6}}, color = {0, 0, 255}));
  connect(led_driver.PLoss, y) annotation(
    Line(points = {{-8, 31}, {-8, 65}, {55, 65}}, color = {0, 0, 127}));
  connect(u, load.u) annotation(
    Line(points = {{55, 15}, {48.5, 15}, {48.5, 16.2}, {33.8, 16.2}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(graphics = {Rectangle(origin = {-6, 26}, pattern = LinePattern.DashDot, extent = {{-20, 16}, {22, -30}}), Text(origin = {-14, 40}, extent = {{-20, 8}, {10, 2}}, textString = "zone 1"), Text(origin = {-12, -6}, lineColor = {28, 108, 200}, extent = {{-68, 90}, {-6, 82}}, textString = "Setup demonstrating HPF library.", fontSize = 11, textStyle = {TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold}, horizontalAlignment = TextAlignment.Left)}, coordinateSystem(extent = {{-150, -150}, {150, 150}}, initialScale = 0.1)),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})));
end Demo;