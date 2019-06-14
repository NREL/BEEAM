within HPF.Test;
model SinglePhase_Transformer
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Components.IdealTransformer idealTransformer1(N = 10)  annotation (
    Placement(visible = true, transformation(origin={-10, 10},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {1})  annotation (
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={-70, -14},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 10 + 5 * j)  annotation (
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(theta(fixed = true, start = 0),vArg = {0}, vMag = {10})  annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z1(z = 1 + 0 * j) annotation(
    Placement(visible = true, transformation(origin = {-42, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {0, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(v.pin_n, ground1.pin) annotation(
    Line(points = {{-40, -4}, {-40, -4}, {-40, -20}, {-40, -20}}, color = {117, 80, 123}));
  connect(v.pin_n, idealTransformer1.pinN_Prim) annotation(
    Line(points = {{-40, -4}, {-12, -4}, {-12, -4}, {-12, -4}}, color = {117, 80, 123}));
  connect(z.pin_n, idealTransformer1.pinN_Sec) annotation(
    Line(points = {{48, 16}, {46, 16}, {46, -4}, {8, -4}, {8, -4}}, color = {117, 80, 123}));
  connect(idealTransformer1.pinP_Sec, z.pin_p) annotation(
    Line(points = {{8, 16}, {28, 16}, {28, 16}, {28, 16}}));
  connect(z1.pin_n, idealTransformer1.pinP_Prim) annotation(
    Line(points = {{-24, 16}, {-12, 16}, {-12, 16}, {-12, 16}}, color = {117, 80, 123}));
  connect(v.pin_p, z1.pin_p) annotation(
    Line(points = {{-62, 16}, {-44, 16}, {-44, 16}, {-44, 16}}));
  connect(ground2.pin, idealTransformer1.pinN_Sec) annotation(
    Line(points = {{8, -18}, {8, -18}, {8, -4}, {8, -4}}));

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, grid = {0, 0})));
end SinglePhase_Transformer;