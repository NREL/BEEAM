within HPF.Test;
model Test_Rectifier
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5})  annotation (
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0, 0.25, -0.5}, vMag = {100, 0.5, 0.225})  annotation (
    Placement(visible = true, transformation(origin = {-60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = 10 + 2 * j)  annotation (
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-60, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 10)  annotation (
    Placement(visible = true, transformation(origin = {46, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {14, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase aC2DC_SinglePhase(V_Rect = 50, efficiency = 0.9, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_laptop.mat")  annotation(
    Placement(visible = true, transformation(origin = {-10, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(z.pin_p, v.pin_p) annotation(
    Line(points = {{-50, 0}, {-60, 0}}));
  connect(v.pin_n, ground1.pin) annotation(
    Line(points = {{-60, -20}, {-60, -20}, {-60, -28}, {-60, -28}}, color = {117, 80, 123}));
  connect(ground2.p, resistor1.n) annotation(
    Line(points = {{14, -30}, {30, -30}, {30, -20}, {46, -20}}, color = {0, 0, 255}));
  connect(z.pin_n, aC2DC_SinglePhase.hPin_P) annotation(
    Line(points = {{-30, 0}, {-20, 0}}, color = {117, 80, 123}));
  connect(aC2DC_SinglePhase.hPin_N, v.pin_n) annotation(
    Line(points = {{-20, -12}, {-40, -12}, {-40, -20}, {-60, -20}}, color = {117, 80, 123}));
  connect(aC2DC_SinglePhase.pin_p, resistor1.p) annotation(
    Line(points = {{0, 0}, {46, 0}}, color = {0, 0, 255}));
  connect(aC2DC_SinglePhase.pin_n, ground2.p) annotation(
    Line(points = {{0, -12}, {8, -12}, {8, -30}, {14, -30}}, color = {0, 0, 255}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0})));
end Test_Rectifier;