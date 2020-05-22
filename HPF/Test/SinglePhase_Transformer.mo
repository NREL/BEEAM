within HPF.Test;
model SinglePhase_Transformer
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Components.IdealTransformer T_HPF(N = 480 / 208)  annotation (
    Placement(visible = true, transformation(origin={8, 40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {1, 3})  annotation (
    Placement(visible = true, transformation(origin={-30, 70},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={-48, 10},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 10 + 5 * j)  annotation (
    Placement(visible = true, transformation(origin={48, 50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource vSrc_HPF(theta(fixed = true, start = 0),vArg = {0, -0.1}, vMag = {480, 0.5})  annotation (
    Placement(visible = true, transformation(origin={-48, 40},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z1(z = 1 + 0 * j) annotation (
    Placement(visible = true, transformation(origin={-24, 50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={18, 10},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Ideal.IdealTransformer T_Quasi(n = 480 / 208)  annotation (
    Placement(visible = true, transformation(origin = {8, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource vSrc_Quasi(V = 480, f = 60, phi = 0)  annotation (
    Placement(visible = true, transformation(origin = {-46, -26}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-46, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Impedance impedance(Z_ref = 1 + 0 * j)  annotation (
    Placement(visible = true, transformation(origin = {-22, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Impedance impedance1(Z_ref = 10 + 5 * j)  annotation (
    Placement(visible = true, transformation(origin = {50, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground5 annotation (
    Placement(visible = true, transformation(origin = {24, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(vSrc_HPF.pin_n, ground1.pin) annotation(
    Line(points = {{-48, 30}, {-48, 21}}, color = {117, 80, 123}));
  connect(vSrc_HPF.pin_n, T_HPF.pinN_Prim) annotation(
    Line(points = {{-48, 30}, {-26, 30}, {-26, 30.2}, {-12, 30.2}, {-12, 30}, {-2, 30}}, color = {117, 80, 123}));
  connect(z.pin_n, T_HPF.pinN_Sec) annotation(
    Line(points = {{58, 50}, {64, 50}, {64, 30}, {18, 30}}, color = {117, 80, 123}));
  connect(T_HPF.pinP_Sec, z.pin_p) annotation(
    Line(points = {{18, 50}, {38, 50}}));
  connect(z1.pin_n, T_HPF.pinP_Prim) annotation(
    Line(points = {{-14, 50}, {-2, 50}}, color = {117, 80, 123}));
  connect(vSrc_HPF.pin_p, z1.pin_p) annotation(
    Line(points = {{-48, 50}, {-34, 50}}));
  connect(ground2.pin, T_HPF.pinN_Sec) annotation(
    Line(points = {{18, 21}, {18, 30}}));
  connect(vSrc_Quasi.pin_n, ground.pin) annotation(
    Line(points = {{-46, -36}, {-46, -44}}, color = {85, 170, 255}));
  connect(vSrc_Quasi.pin_n, T_Quasi.pin_n1) annotation(
    Line(points = {{-46, -36}, {-2, -36}}, color = {85, 170, 255}));
  connect(vSrc_Quasi.pin_p, impedance.pin_p) annotation(
    Line(points = {{-46, -16}, {-32, -16}}, color = {85, 170, 255}));
  connect(impedance.pin_n, T_Quasi.pin_p1) annotation(
    Line(points = {{-12, -16}, {-2, -16}}, color = {85, 170, 255}));
  connect(impedance1.pin_p, T_Quasi.pin_p2) annotation(
    Line(points = {{40, -16}, {18, -16}}, color = {85, 170, 255}));
  connect(T_Quasi.pin_n2, impedance1.pin_n) annotation(
    Line(points = {{18, -36}, {42, -36}, {42, -33}, {64, -33}, {64, -16}, {60, -16}}, color = {85, 170, 255}));
  connect(T_Quasi.pin_n2, ground5.pin) annotation(
    Line(points = {{18, -36}, {26, -36}, {26, -32}, {27, -32}, {27, -44}, {24, -44}}, color = {85, 170, 255}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, grid = {0, 0})));
end SinglePhase_Transformer;