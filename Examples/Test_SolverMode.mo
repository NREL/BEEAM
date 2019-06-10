within HPF.Examples;
model Test_SolverMode
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef annotation (
    Placement(visible = true, transformation(origin = {-121, 55}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
  HPF.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-60, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Components.Impedance z(z = 5 + 2 * j)  annotation (
    Placement(visible = true, transformation(origin = {-18, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Components.VoltageSource voltageSource1(theta(fixed = true), vArg = {0}, vMag = {20})  annotation (
    Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.HarmonicSources.NonlinearHarmonicLoad nonlinearHarmonicLoad1(funcVI = 0.9, iHrmsIm = {-0.1}, iHrmsRe = {0.9}, sFund = 20 + 2 * j)  annotation (
    Placement(visible = true, transformation(origin = {0, 38}, extent = {{-13, -10}, {10, 10}}, rotation = -90)));
equation
  connect(voltageSource1.pin_n, ground1.pin) annotation (
    Line(points = {{-60, 20}, {-60, 20}, {-60, 10}, {-60, 10}}, color = {117, 80, 123}));
  connect(voltageSource1.pin_p, z.pin_p) annotation (
    Line(points = {{-60, 40}, {-60, 40}, {-60, 52}, {-18, 52}, {-18, 52}, {-18, 52}}, color = {117, 80, 123}));
  connect(z.pin_n, nonlinearHarmonicLoad1.pin_p) annotation (
    Line(points = {{2, 52}, {20, 52}, {20, 40}, {20, 40}, {20, 40}}, color = {117, 80, 123}));
  connect(nonlinearHarmonicLoad1.pin_n, ground1.pin) annotation (
    Line(points = {{20, 20}, {20, 20}, {20, 10}, {-60, 10}, {-60, 10}}, color = {117, 80, 123}));

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0}, initialScale = 0.1), graphics = {Text(origin = {-39, 109}, extent = {{-7, 3}, {97, -27}}, textString = "Test setup to check solver mode selection. \nThe system is run for fundamental only.", horizontalAlignment = TextAlignment.Left)}));
end Test_SolverMode;
