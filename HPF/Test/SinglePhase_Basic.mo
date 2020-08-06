within HPF.Test;
model SinglePhase_Basic
  inner HPF.SystemDef systemDef(fFund = 60,hrms = {1, 3, 5})  annotation (
    Placement(visible = true, transformation(origin = {-60, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Sources.VoltageSource voltageSource1(vArg = {0, 0.5, -0.25}, vMag = {100, 5, 3})  annotation (
    Placement(visible = true, transformation(origin = {-44, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z1(z = 2 + 0 * j)  annotation (
    Placement(visible = true, transformation(origin={54,20},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z2(z = 3 + 2 * j)  annotation (
    Placement(visible = true, transformation(origin={54,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-44, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.HarmonicImpedance harmonicImpedance(Rh={0.5 for i in 1:
         1:systemDef.numHrm}, Xh={0 *h for h in systemDef.hrms})
    annotation (Placement(transformation(extent={{-2,10},{18,30}})));
equation
  connect(voltageSource1.pin_n, ground1.pin) annotation (
    Line(points={{-44,-10},{-44,-18},{-44,-18},{-44,-16}},          color = {117, 80, 123}));

  connect(z1.pin_n, z2.pin_n) annotation (Line(points={{64,20},{76,20},{76,0},{
          64,0}},    color={117,80,123}));
  connect(ground1.pin, z2.pin_n) annotation (Line(points={{-44,-16},{76,-16},{
          76,0},{64,0}},     color={0,0,0}));
  connect(harmonicImpedance.pin_n, z1.pin_p)
    annotation (Line(points={{18,20},{44,20}}, color={117,80,123}));
  connect(z2.pin_p, z1.pin_p)
    annotation (Line(points={{44,0},{30,0},{30,20},{44,20}}, color={0,0,0}));
  connect(harmonicImpedance.pin_p, voltageSource1.pin_p)
    annotation (Line(points={{-2,20},{-44,20},{-44,10}}, color={0,0,0}));
annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem( grid = {0, 0}, initialScale = 0.1), graphics={  Text(origin = {-101, 82}, extent = {{3, -10}, {157, -34}}, textString = "Single Phase test:
Tests basic functionality of the system by performing \na simple nodal analysis with fixed voltage source 
and impedances and resistors.", horizontalAlignment = TextAlignment.Left)}));
end SinglePhase_Basic;
