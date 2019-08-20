within HPF.Test;
model Test_Rectifier
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5})  annotation (
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0, 0.25, -0.5}, vMag = {100, 0.5, 0.225})  annotation (
    Placement(visible = true, transformation(origin = {-60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = 10 + 2 * j)  annotation (
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-60, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 10)  annotation (
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier rectifier1(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768})  annotation (
    Placement(visible = true, transformation(origin = {-6, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(resistor1.p, rectifier1.pin_p) annotation (
    Line(points = {{4, 0}, {50, 0}}, color = {0, 0, 255}));
  connect(rectifier1.pin_n, ground2.p) annotation (
    Line(points = {{4, -20}, {30, -20}}, color = {0, 0, 255}));
  connect(resistor1.n, rectifier1.pin_n) annotation (
    Line(points = {{50, -20}, {4, -20}}, color = {0, 0, 255}));
  connect(z.pin_n, rectifier1.hPin_P) annotation (
    Line(points = {{-20, 0}, {-16, 0}}, color = {117, 80, 123}));
  connect(z.pin_p, v.pin_p) annotation (
    Line(points = {{-40, 0}, {-60, 0}}));
  connect(v.pin_n, ground1.pin) annotation (
    Line(points = {{-60, -20}, {-60, -20}, {-60, -28}, {-60, -28}}, color = {117, 80, 123}));
  connect(v.pin_n, rectifier1.hPin_N) annotation (
    Line(points = {{-16, -20}, {-60, -20}}, color = {117, 80, 123}));
  connect(z.pin_n, rectifier1.hPin_P) annotation (
    Line(points = {{-20, 0}, {-16, 0}}, color = {117, 80, 123}));
  connect(rectifier1.hPin_N, v.pin_n) annotation (
    Line(points = {{-16, -20}, {-60, -20}}, color = {117, 80, 123}));
  connect(rectifier1.pin_n, ground2.p) annotation (
    Line(points = {{4, -20}, {30, -20}}, color = {0, 0, 255}));
  connect(ground2.p, resistor1.n) annotation (
    Line(points = {{30, -20}, {50, -20}}, color = {0, 0, 255}));
  connect(rectifier1.pin_p, resistor1.p) annotation (
    Line(points = {{4, 0}, {50, 0}}, color = {0, 0, 255}));

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0})));
end Test_Rectifier;
