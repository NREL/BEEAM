within HPF.Test;
model SinglePhase_HarmonicLoad
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1, 3}) annotation (
    Placement(visible = true, transformation(origin = {-82, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(theta(fixed = true), vArg = {0, 0.5}, vMag = {100, 5}) annotation (
    Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-60, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 5 + 2 * j) annotation (
    Placement(visible = true, transformation(origin = {-32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z2(z = 2 + 1 * j) annotation (
    Placement(visible = true, transformation(origin = {0, -26}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.NonlinearLoads.Test_Load test_Load1(
    sReal=-150,
    sImag=20,                                         iImag = {0.25, 0.5}, iReal = {5, 2}, sVectIm = {20, 0},
    sVectRe={-150,0})                                                                                                             annotation (
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ground1.pin, v.pin_n) annotation (
    Line(points = {{-60, -68}, {-60, -40}}));
  connect(v.pin_p, z.pin_p) annotation (
    Line(points = {{-60, -20}, {-60, 0}, {-42, 0}}));
  connect(z.pin_n, test_Load1.pin_p) annotation (
    Line(points = {{-22, 0}, {20, 0}}, color = {117, 80, 123}));
  connect(test_Load1.pin_n, ground1.pin) annotation (
    Line(points = {{40, 0}, {50, 0}, {50, -68}, {-60, -68}}, color = {117, 80, 123}));
  connect(z2.pin_n, ground1.pin) annotation (
    Line(points = {{0, -36}, {0, -68}, {-60, -68}}, color = {117, 80, 123}));
  connect(z2.pin_p, test_Load1.pin_p) annotation (
    Line(points = {{0, -16}, {0, 0}, {20, 0}}, color = {0, 0, 0}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Text(origin = {-81, 74}, extent = {{-17, 6}, {149, -22}}, textString = "OpenModelica: Simulation fails with default solver settings.
Set the nonlinear solver to 'Newton' and linear
solver to 'totalpivot'", horizontalAlignment = TextAlignment.Left)}));
end SinglePhase_HarmonicLoad;
