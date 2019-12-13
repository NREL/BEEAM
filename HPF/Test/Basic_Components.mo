within HPF.Test;
model Basic_Components
  import Modelica.ComplexMath.j;
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor QS_R(R_ref = 10) annotation (
    Placement(visible = true, transformation(origin = {-10, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Capacitor QS_C(C = 22e-6) annotation (
    Placement(visible = true, transformation(origin = {-10, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Inductor QS_L(L = 10e-6) annotation (
    Placement(visible = true, transformation(origin = {-10, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Impedance QS_Z(Z_ref = 10 + 20 * j) annotation (
    Placement(visible = true, transformation(origin = {-10, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource QS_vSrc(V = 100, f = 60, phi = 0) annotation (
    Placement(visible = true, transformation(origin = {-72, 14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-72, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(QS_R.pin_p, QS_Z.pin_p) annotation (
    Line(points = {{-20, 46}, {-30, 46}, {-30, 24}, {-20, 24}, {-20, 24}}, color = {85, 170, 255}));
  connect(QS_C.pin_p, QS_Z.pin_p) annotation (
    Line(points = {{-20, 2}, {-30, 2}, {-30, 24}, {-20, 24}}, color = {85, 170, 255}));
  connect(QS_L.pin_p, QS_C.pin_p) annotation (
    Line(points = {{-20, -18}, {-30, -18}, {-30, 2}, {-20, 2}}, color = {85, 170, 255}));
  connect(QS_vSrc.pin_p, QS_Z.pin_p) annotation (
    Line(points = {{-72, 24}, {-20, 24}}, color = {85, 170, 255}));
  connect(ground.pin, QS_vSrc.pin_n) annotation (
    Line(points = {{-72, -4}, {-72, -4}, {-72, 4}, {-72, 4}}, color = {85, 170, 255}));
  connect(QS_R.pin_n, QS_Z.pin_n) annotation (
    Line(points = {{0, 46}, {12, 46}, {12, 24}, {0, 24}, {0, 24}}, color = {85, 170, 255}));
  connect(QS_C.pin_n, QS_Z.pin_n) annotation (
    Line(points = {{0, 2}, {12, 2}, {12, 24}, {0, 24}, {0, 24}}, color = {85, 170, 255}));
  connect(QS_L.pin_n, QS_C.pin_n) annotation (
    Line(points = {{0, -18}, {12, -18}, {12, 2}, {0, 2}, {0, 2}}, color = {85, 170, 255}));
  connect(ground.pin, QS_L.pin_n) annotation (
    Line(points = {{-72, -4}, {-44, -4}, {-44, -28}, {0, -28}, {0, -18}, {0, -18}}, color = {85, 170, 255}));
  annotation (
    Diagram(graphics = {Text(origin = {-84, 77}, extent = {{-14, 5}, {118, -11}}, textString = "Simulation model for testing accuracy in modeling various basic components.
Outputs are compared with MSL quasi stationary library components.", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(initialScale = 0.1)));
end Basic_Components;
