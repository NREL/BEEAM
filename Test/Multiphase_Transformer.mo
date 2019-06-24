within HPF.Test;
model Multiphase_Transformer
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms={1, 3, 5})
                                annotation (
    Placement(visible = true, transformation(origin = {-70, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Machines.Transformers_iPh.Test_DY test_DY1(N = 4)  annotation (
    Placement(visible = true, transformation(origin={ -14, 30},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource PhA(vArg = {0, 0.5, 2.3}, vMag = {392, 10, 3})  annotation (Placement(visible = true, transformation(origin={-76, 26},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource PhB(vArg = {Modelica.SIunits.Conversions.from_deg(-120), 0, 1.2}, vMag = {392, 11, 2.6})  annotation (Placement(visible = true, transformation(origin={-60, 10},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource PhC(vArg = {Modelica.SIunits.Conversions.from_deg(120), 0.6, 2.1}, vMag = {392, 10, 3})  annotation (Placement(visible = true, transformation(origin = {-48, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground
    annotation (Placement(visible = true, transformation(extent = {{-86, -30}, {-66, -10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1
    annotation (Placement(visible = true, transformation(extent = {{74, -26}, {94, -6}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r1(r = 500)  annotation(
    Placement(visible = true, transformation(origin = {64, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r2(r = 500)  annotation(
    Placement(visible = true, transformation(origin = {66, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = Complex(500, 20))  annotation(
    Placement(visible = true, transformation(origin = {68, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(test_DY1.hPin_N, ground1.pin) annotation(
    Line(points = {{4, 26}, {16, 26}, {16, 8}, {78, 8}, {78, -16}}, color = {117, 80, 123}));
  connect(test_DY1.pinPrim_A, PhA.pin_p) annotation(
    Line(points = {{-40, 36}, {-76, 36}, {-76, 36}, {-76, 36}}));
  connect(PhB.pin_p, test_DY1.pinPrim_B) annotation(
    Line(points = {{-60, 20}, {-60, 20}, {-60, 30}, {-40, 30}, {-40, 30}}));
  connect(test_DY1.pinPrim_C, PhC.pin_p) annotation(
    Line(points = {{-40, 24}, {-48, 24}, {-48, 0}, {-48, 0}}));
  connect(PhC.pin_n, ground.pin) annotation(
    Line(points = {{-48, -20}, {-78, -20}, {-78, -20}, {-76, -20}}, color = {117, 80, 123}));
  connect(PhB.pin_n, ground.pin) annotation(
    Line(points = {{-60, 0}, {-76, 0}, {-76, -20}, {-76, -20}}, color = {117, 80, 123}));
  connect(PhA.pin_n, ground.pin) annotation(
    Line(points = {{-76, 16}, {-76, 16}, {-76, -20}, {-76, -20}}, color = {117, 80, 123}));
  connect(r1.pin_p, test_DY1.hPin_P2) annotation(
    Line(points = {{50, 24}, {48, 24}, {48, 34}, {0, 34}, {0, 34}}));
  connect(test_DY1.hPin_P3, r2.pin_p) annotation(
    Line(points = {{0, 30}, {34, 30}, {34, 8}, {50, 8}, {50, 8}}));
  connect(r2.pin_n, ground1.pin) annotation(
    Line(points = {{70, 8}, {80, 8}, {80, -16}, {80, -16}}, color = {117, 80, 123}));
  connect(r1.pin_n, ground1.pin) annotation(
    Line(points = {{70, 24}, {80, 24}, {80, -16}, {80, -16}}, color = {117, 80, 123}));
  connect(test_DY1.hPin_P1, z.pin_p) annotation(
    Line(points = {{-4, 38}, {58, 38}, {58, 38}, {58, 38}}));
  connect(z.pin_n, ground1.pin) annotation(
    Line(points = {{78, 38}, {84, 38}, {84, -16}, {84, -16}, {84, -16}}, color = {117, 80, 123}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent={{-120,-100},{120,100}})),
    Diagram(coordinateSystem(extent = {{-120, -100}, {120, 100}}, grid = {0, 0}, initialScale = 0.1)));
end Multiphase_Transformer;