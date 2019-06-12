within HPF.Test;

model SinglePhase_Basic
  inner HPF.SystemDef systemDef(fFund = 60,hrms = {1, 3, 5}, modeSelPrev(fixed = true, start = true))  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Sources.VoltageSource voltageSource1(vArg = {0, 0.5, -0.25}, vMag = {100, 5, 3})  annotation(
    Placement(visible = true, transformation(origin = {-40, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = 5 + 2 * j)  annotation(
    Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 2 + 2 * j)  annotation(
    Placement(visible = true, transformation(origin = {42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z2(z = 3 + 2 * j)  annotation(
    Placement(visible = true, transformation(origin = {48, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-40, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(z1.pin_n, z2.pin_n) annotation(
    Line(points = {{-40, 80}, {-32, 80}, {-32, 60}, {-40, 60}, {-40, 60}}, color = {117, 80, 123}));
  connect(z1.pin_p, z.pin_n) annotation(
    Line(points = {{-60, 80}, {-80, 80}, {-80, 80}, {-80, 80}}, color = {28, 108, 200}));
  connect(z.pin_p, voltageSource1.pin_p) annotation(
    Line(points = {{-100, 80}, {-140, 80}, {-140, 80}, {-140, 80}}, color = {28, 108, 200}));
  connect(voltageSource1.pin_n, ground1.pin) annotation(
    Line(points = {{-140, 60}, {-140, 60}, {-140, 46}, {-140, 46}}, color = {117, 80, 123}));
  connect(ground1.pin, z2.pin_n) annotation(
    Line(points = {{-140, 46}, {-40, 46}, {-40, 60}, {-40, 60}}, color = {28, 108, 200}));
  connect(z2.pin_p, z.pin_n) annotation(
    Line(points = {{-60, 60}, {-80, 60}, {-80, 80}, {-80, 80}}, color = {28, 108, 200}));

annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem( grid = {0, 0}, initialScale = 0.1), graphics = {Text(origin = {-101, 82}, extent = {{3, -10}, {157, -34}}, textString = "Single Phase test:
Tests basic functionality of the system by performing \na simple nodal analysis with fixed voltage source 
and impedances and resistors.", horizontalAlignment = TextAlignment.Left)}));end SinglePhase_Basic;