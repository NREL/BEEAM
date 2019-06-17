within HPF.Test;
model SinglePhase_Basic
  inner HPF.SystemDef systemDef(fFund = 60,hrms = {1, 3, 5})  annotation (
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Sources.VoltageSource voltageSource1(vArg = {0, 0.5, -0.25}, vMag = {100, 5, 3})  annotation (
    Placement(visible = true, transformation(origin = {-50, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = 5 + 2 * j)  annotation (
    Placement(visible = true, transformation(origin={6,22},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 2 + 2 * j)  annotation (
    Placement(visible = true, transformation(origin={54,22},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z2(z = 3 + 2 * j)  annotation (
    Placement(visible = true, transformation(origin = {62, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-50, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource1.pin_n, ground1.pin) annotation (
    Line(points={{-50,-18},{-50,-18},{-50,-18},{-50,-42}},          color = {117, 80, 123}));

  connect(voltageSource1.pin_p, z.pin_p) annotation (Line(points={{-50,2},{-28,
          2},{-28,22},{-4,22}}, color={0,0,0}));
  connect(z1.pin_p, z.pin_n)
    annotation (Line(points={{44,22},{16,22}}, color={0,0,0}));
  connect(z.pin_n, z2.pin_p) annotation (Line(points={{16,22},{34,22},{34,-16},
          {52,-16}}, color={117,80,123}));
  connect(z1.pin_n, z2.pin_n) annotation (Line(points={{64,22},{74,22},{74,-16},
          {72,-16}}, color={117,80,123}));
  connect(ground1.pin, z2.pin_n) annotation (Line(points={{-50,-42},{74,-42},{
          74,-16},{72,-16}}, color={0,0,0}));
annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem( grid = {0, 0}, initialScale = 0.1), graphics={  Text(origin = {-101, 82}, extent = {{3, -10}, {157, -34}}, textString = "Single Phase test:
Tests basic functionality of the system by performing \na simple nodal analysis with fixed voltage source 
and impedances and resistors.", horizontalAlignment = TextAlignment.Left)}));
end SinglePhase_Basic;
