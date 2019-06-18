within HPF.Test;
model SinglePhase_HarmonicLoad
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1})  annotation (
    Placement(visible = true, transformation(origin = {-70, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(theta(fixed = true),vArg = {0}, vMag = {100})  annotation (
    Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={-60, -60},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 5 + 2 * j)  annotation (
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z2(z = 2 + 1 * j)  annotation (
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Test_components.Test_Load test_Load1 annotation (
    Placement(visible = true, transformation(origin = {34, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(ground1.pin, v.pin_n) annotation (
    Line(points = {{-60, -60}, {-60, -60}, {-60, -40}, {-60, -40}}));
  connect(z2.pin_p, z.pin_n) annotation (
    Line(points = {{0, -30}, {0, -30}, {0, 0}, {-20, 0}, {-20, 0}}));
  connect(z2.pin_n, ground1.pin) annotation (
    Line(points={{0,-50},{0,-50},{0,-68},{-60,-68},{-60,-60}},            color = {117, 80, 123}));
  connect(v.pin_p, z.pin_p) annotation (
    Line(points={{-60,-20},{-62,-20},{-62,0},{-40,0},{-40,0}}));
  connect(test_Load1.pin_p, z.pin_n) annotation (
    Line(points = {{34, -20}, {34, -20}, {34, 0}, {-20, 0}, {-20, 0}}));
  connect(test_Load1.pin_n, ground1.pin) annotation (
    Line(points = {{34, -40}, {34, -40}, {34, -60}, {-60, -60}, {-60, -60}}, color = {117, 80, 123}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Text(origin = {-81, 104}, extent = {{-17, 6}, {149, -46}}, textString = "OpenModelica: Simulation fails with default solver settings.
Set the nonlinear solver to 'Newton' and linear
solver to 'totalpivot'", horizontalAlignment = TextAlignment.Left)}));
end SinglePhase_HarmonicLoad;
