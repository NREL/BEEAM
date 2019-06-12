within HPF.Examples;
model Test_SinglePhase
  import Modelica.ComplexMath.j;

  HPF.HarmonicSources.NonlinearHarmonicLoad nonlinearHarmonicLoad1(iHrmsIm = {0, 0.1, 0.25}, iHrmsRe = {0.9, 0.5, 0.3}, sFund = 110 + 50 * j)  annotation (
    Placement(visible = true, transformation(origin = {56, -8}, extent = {{-13, -10}, {10, 10}}, rotation = -90)));
  HPF.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-40, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Components.VoltageSource voltageSource1(theta(fixed = true),vArg = {0, 0.5, 0.25}, vMag = {250, 5, 0.5})  annotation (
    Placement(visible = true, transformation(origin = {-40, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5})  annotation (
    Placement(visible = true, transformation(origin = {-42, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Components.Impedance z(z = 1 + 2 * j)  annotation(
    Placement(visible = true, transformation(origin = {-30, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Components.Impedance z1(z = 1 + 3 * j)  annotation(
    Placement(visible = true, transformation(origin = {16,26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Components.Impedance z2(z = 2 + 1 * j)  annotation(
    Placement(visible = true, transformation(origin = {16, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ground1.pin, voltageSource1.pin_n) annotation (
    Line(points={{-40,-37.4},{-40,-37.4},{-40,-20},{-40,-20}},      color = {117, 80, 123}));
  connect(nonlinearHarmonicLoad1.pin_n, ground1.pin) annotation (
    Line(points={{60,-20},{60,-20},{60,-38},{-40,-38},{-40,-37.4}},          color = {117, 80, 123}));
  connect(z1.pin_n, z2.pin_n) annotation(
    Line(points = {{26, 26}, {30, 26}, {30, 2}, {24, 2}, {24, 0}}, color = {117, 80, 123}));
  connect(nonlinearHarmonicLoad1.pin_p, z1.pin_n) annotation(
    Line(points = {{60, 0}, {60, 0}, {60, 26}, {26, 26}, {26, 26}}, color = {117, 80, 123}));
  connect(z.pin_n, z1.pin_p) annotation(
    Line(points = {{-14, 26}, {6, 26}, {6, 26}, {6, 26}}, color = {117, 80, 123}));
  connect(z.pin_p, voltageSource1.pin_p) annotation(
    Line(points = {{-34, 26}, {-40, 26}, {-40, 4}, {-40, 4}}, color = {117, 80, 123}));
  connect(z2.pin_p, z1.pin_p) annotation(
    Line(points = {{4, 0}, {-8, 0}, {-8, 26}, {6, 26}, {6, 26}}, color = {117, 80, 123}));

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}},
    grid = {0, 0}, initialScale = 0.1),
    graphics={Text(origin = {-80, 86}, extent = {{-30, -2}, {60, -12}}, textString = "Description:")}));
end Test_SinglePhase;