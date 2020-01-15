within HPF.Test;
model SinglePhase_Transformer
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Components.IdealTransformer idealTransformer1(N = 10)  annotation (
    Placement(visible = true, transformation(origin={0, 38},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {1})  annotation (
    Placement(visible = true, transformation(origin = {-56, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={-86, 8},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z_s(z = 0.5 + 0.1 * j)  annotation (
    Placement(visible = true, transformation(origin = {30, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(theta(fixed = true, start = 0),vArg = {0}, vMag = {120})  annotation (
    Placement(visible = true, transformation(origin = {-86, 38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z_p(z = 1 + 0 * j) annotation (
    Placement(visible = true, transformation(origin = {-62, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {10, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Inductor l_c annotation(
    Placement(visible = true, transformation(origin = {-20, 38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Resistor r_c(r = 500)  annotation(
    Placement(visible = true, transformation(origin = {-38, 38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Resistor load(r = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {56, 38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(v.pin_n, ground1.pin) annotation(
    Line(points = {{-86, 28}, {-86, 8}}, color = {117, 80, 123}));
  connect(idealTransformer1.pinP_Sec, z_s.pin_p) annotation(
    Line(points = {{10, 48}, {20, 48}}));
  connect(v.pin_p, z_p.pin_p) annotation(
    Line(points = {{-86, 48}, {-72, 48}}));
  connect(ground2.pin, idealTransformer1.pinN_Sec) annotation(
    Line(points = {{10, 8}, {10, 28}}));
  connect(z_p.pin_n, r_c.pin_p) annotation(
    Line(points = {{-52, 48}, {-38, 48}, {-38, 48}, {-38, 48}}, color = {117, 80, 123}));
  connect(r_c.pin_p, l_c.pin_p) annotation(
    Line(points = {{-38, 48}, {-20, 48}, {-20, 48}, {-20, 48}}));
  connect(idealTransformer1.pinP_Prim, l_c.pin_p) annotation(
    Line(points = {{-10, 48}, {-20, 48}, {-20, 48}, {-20, 48}}));
  connect(idealTransformer1.pinN_Prim, l_c.pin_n) annotation(
    Line(points = {{-10, 28}, {-20, 28}, {-20, 28}, {-20, 28}}, color = {117, 80, 123}));
  connect(l_c.pin_n, r_c.pin_n) annotation(
    Line(points = {{-20, 28}, {-38, 28}, {-38, 28}, {-38, 28}}, color = {117, 80, 123}));
  connect(r_c.pin_n, v.pin_n) annotation(
    Line(points = {{-38, 28}, {-86, 28}, {-86, 28}, {-86, 28}}, color = {117, 80, 123}));
  connect(z_s.pin_n, load.pin_p) annotation(
    Line(points = {{40, 48}, {56, 48}, {56, 48}, {56, 48}}, color = {117, 80, 123}));
  connect(idealTransformer1.pinN_Sec, load.pin_n) annotation(
    Line(points = {{10, 28}, {56, 28}, {56, 28}, {56, 28}}, color = {117, 80, 123}));

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, grid = {0, 0})));
end SinglePhase_Transformer;