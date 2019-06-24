within HPF.Test;
model SinglePhase_Load
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1}) annotation (
    Placement(visible = true, transformation(origin = {-60, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(theta(fixed = true), vArg = {0}, vMag = {100}) annotation (
    Placement(visible = true, transformation(origin = {-41, -21}, extent = {{-11, -11}, {11, 11}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Test_components.Test_Load test_Load1(S = (-50) - 20 * j) annotation (
    Placement(visible = true, transformation(origin = {48, -28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z1(z = 8 + 1 * j) annotation (
    Placement(visible = true, transformation(origin = {50,30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z2(z = 0.5 + 1 * j) annotation (
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z3(z = 5 + 1 * j) annotation (
    Placement(visible = true, transformation(origin = {30,10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Impedance z annotation (
    Placement(visible = true, transformation(origin = {0, -14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(ground1.pin, v.pin_n) annotation (
    Line(points = {{-60, -60}, {-60, -40}}));
  connect(test_Load1.pin_n, ground1.pin) annotation (
    Line(points = {{32, -42}, {32, -60}, {-60, -60}}, color = {117, 80, 123}));
  connect(z2.pin_p, z3.pin_n) annotation (
    Line(points = {{40, 0}, {20, 0}, {20, 0}, {20, 0}}));
  connect(v.pin_p, z.pin_p) annotation (
    Line(points = {{-41, -10}, {-41, 30}, {0, 30}, {0, -4}}));
  connect(z1.pin_p, z.pin_p) annotation (
    Line(points = {{40, 30}, {0, 30}, {0, -4}, {0, -4}, {0, -4}, {0, -4}}));
  connect(z3.pin_p, z.pin_p) annotation (
    Line(points = {{20, 10}, {0, 10}, {0, -4}, {0, -4}}));
  connect(z.pin_n, ground1.pin) annotation (
    Line(points = {{0, -24}, {0, -24}, {0, -24}, {0, -24}, {0, -50}, {-40, -50}, {-40, -50}, {-40, -50}, {-40, -50}, {-40, -50}}, color = {117, 80, 123}));
  connect(test_Load1.pin_p, z2.pin_p) annotation (
    Line(points = {{48, -18}, {50, -18}, {50, 10}, {60, 10}, {60, 10}, {60, 10}}));
  connect(z1.pin_n, z2.pin_n) annotation (
    Line(points = {{60, 30}, {86, 30}, {86, 12}, {80, 12}, {80, 10}, {80, 10}}, color = {117, 80, 123}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Text(origin = {-81, 84}, extent = {{-17, 6}, {171, -22}}, textString = "OpenModelica: Simulation fails with default solver settings.
Set the nonlinear solver to 'Newton' and linear
solver to 'totalpivot'", horizontalAlignment = TextAlignment.Left)}));
end SinglePhase_Load;
