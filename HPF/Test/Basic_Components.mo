within HPF.Test;
model Basic_Components
  import Modelica.ComplexMath.j;
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor QS_R(R_ref = 10) annotation (
    Placement(visible = true, transformation(origin = {-24, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Capacitor QS_C(C = 22e-6) annotation (
    Placement(visible = true, transformation(origin = {-24, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Inductor QS_L(L = 10e-6) annotation (
    Placement(visible = true, transformation(origin = {-24, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Impedance QS_Z(Z_ref = 10 + 20 * j) annotation (
    Placement(visible = true, transformation(origin = {-24, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource QS_vSrc(V = 100, f = 60, phi = 0) annotation (
    Placement(visible = true, transformation(origin = {-86, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-86, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(QS_R.pin_p, QS_Z.pin_p) annotation (
    Line(points = {{-34, 42}, {-44, 42}, {-44, 20}, {-34, 20}}, color = {85, 170, 255}));
  connect(QS_C.pin_p, QS_Z.pin_p) annotation (
    Line(points = {{-34, -2}, {-44, -2}, {-44, 20}, {-34, 20}}, color = {85, 170, 255}));
  connect(QS_L.pin_p, QS_C.pin_p) annotation (
    Line(points = {{-34, -22}, {-44, -22}, {-44, -2}, {-34, -2}}, color = {85, 170, 255}));
  connect(QS_vSrc.pin_p, QS_Z.pin_p) annotation (
    Line(points = {{-86, 20}, {-34, 20}}, color = {85, 170, 255}));
  connect(ground.pin, QS_vSrc.pin_n) annotation (
    Line(points = {{-86, -8}, {-86, 0}}, color = {85, 170, 255}));
  connect(QS_R.pin_n, QS_Z.pin_n) annotation (
    Line(points = {{-14, 42}, {-2, 42}, {-2, 20}, {-14, 20}}, color = {85, 170, 255}));
  connect(QS_C.pin_n, QS_Z.pin_n) annotation (
    Line(points = {{-14, -2}, {-2, -2}, {-2, 20}, {-14, 20}}, color = {85, 170, 255}));
  connect(QS_L.pin_n, QS_C.pin_n) annotation (
    Line(points = {{-14, -22}, {-2, -22}, {-2, -2}, {-14, -2}}, color = {85, 170, 255}));
  connect(ground.pin, QS_L.pin_n) annotation (
    Line(points = {{-86, -8}, {-58, -8}, {-58, -32}, {-14, -32}, {-14, -22}}, color = {85, 170, 255}));
  annotation (
    Diagram(graphics = {Text(origin = {-84, 77}, extent = {{-14, 5}, {118, -11}}, textString = "Simulation model for testing accuracy in modeling various basic components.
Outputs are compared with MSL quasi stationary library components.", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(initialScale = 0.1)));
end Basic_Components;
