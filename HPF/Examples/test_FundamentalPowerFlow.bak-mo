within HPF.Examples;
model test_FundamentalPowerFlow
  import Modelica.ComplexMath.j;
  HPF.Components.Impedance z(z = 2 + 3 * j) annotation(Placement(visible = true, transformation(origin = {-34, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {1, 3}) annotation(Placement(visible = true, transformation(origin={-122,86},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Components.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-98, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Components.Impedance z1(z = 1 + 2 * j) annotation(Placement(visible = true, transformation(origin = {0, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Components.Impedance z2(z = 5 + 5 * j) annotation(Placement(visible = true, transformation(origin = {-34, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Components.Impedance z3(z = 5 + 5 * j) annotation(Placement(visible = true, transformation(origin = {-6, 22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.VoltageSource voltageSource(vMag={10,5}, vArg={0,-0.5})
                                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-98,46})));
equation
  connect(z2.pin_p, z.pin_p) annotation (
    Line(points={{-44.2,32},{-60,32},{-60,64},{-44.2,64}},      color = {117, 80, 123}));
  connect(z3.pin_p, z2.pin_n) annotation (
    Line(points={{-6,32.2},{-6,32.2},{-6,40},{-24,40},{-24,32}},        color = {117, 80, 123}));
  connect(ground1.pin, z3.pin_n) annotation (
    Line(points={{-98,-1.4},{-6,-1.4},{-6,12},{-6,12}},     color = {117, 80, 123}));
  connect(z.pin_n, z1.pin_p) annotation (
    Line(points={{-24,64},{-8,64},{-8,64},{-10.2,64},{-10.2,64}},        color = {117, 80, 123}));
  connect(z1.pin_n, z3.pin_p) annotation (
    Line(points={{10,64},{22,64},{22,24},{-6,24},{-6,32.2}},            color = {117, 80, 123}));
  connect(voltageSource.pin_p, z.pin_p) annotation (Line(
      points={{-98,56.2},{-98,64},{-44.2,64}},
      color={117,80,123},
      thickness=2));
  connect(voltageSource.pin_n, ground1.pin)
    annotation (Line(points={{-98,36},{-98,-1.4}}, color={117,80,123}));
  annotation(Icon(coordinateSystem(extent = {{-130, -100}, {100, 100}}, grid = {0, 0})), Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0}, initialScale = 0.1)));
end test_FundamentalPowerFlow;
