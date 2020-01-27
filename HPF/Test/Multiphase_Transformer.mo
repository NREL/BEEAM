within HPF.Test;
model Multiphase_Transformer
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms={1, 3, 5})
                                annotation (
    Placement(visible = true, transformation(origin = {-60, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Machines.Transformers_iPh.Test_DY test_DY1(N = 4)  annotation (
    Placement(visible = true, transformation(origin={-8, 18},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource PhA(vArg = {0, 0.5, 2.3}, vMag = {392, 10, 3})  annotation (Placement(visible = true, transformation(origin={-70, 18},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource PhB(vArg = {Modelica.SIunits.Conversions.from_deg(-120), 0, 1.2}, vMag = {392, 11, 2.6})  annotation (Placement(visible = true, transformation(origin={-54, 8},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource PhC(vArg = {Modelica.SIunits.Conversions.from_deg(120), 0.6, 2.1}, vMag = {392, 10, 3})  annotation (Placement(visible = true, transformation(origin = {-42, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground
    annotation (Placement(visible = true, transformation(extent = {{-80, -40}, {-60, -20}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1
    annotation (Placement(visible = true, transformation(extent = {{62, -36}, {82, -16}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r1(r = 500)  annotation (
    Placement(visible = true, transformation(origin = {50, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r2(r = 500)  annotation (
    Placement(visible = true, transformation(origin = {50, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = Complex(500, 20))  annotation (
    Placement(visible = true, transformation(origin = {52, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(test_DY1.pinPrim_A, PhA.pin_p) annotation(
    Line(points = {{-18, 28}, {-70, 28}}));
  connect(PhB.pin_p, test_DY1.pinPrim_B) annotation(
    Line(points = {{-54, 18}, {-18, 18}}));
  connect(test_DY1.pinPrim_C, PhC.pin_p) annotation(
    Line(points = {{-18, 8}, {-42, 8}, {-42, -10}}));
  connect(PhC.pin_n, ground.pin) annotation(
    Line(points = {{-42, -30}, {-70, -30}}, color = {117, 80, 123}));
  connect(PhB.pin_n, ground.pin) annotation(
    Line(points = {{-54, -2}, {-70, -2}, {-70, -30}}, color = {117, 80, 123}));
  connect(PhA.pin_n, ground.pin) annotation(
    Line(points = {{-70, 8}, {-70, -30}}, color = {117, 80, 123}));
  connect(r2.pin_n, ground1.pin) annotation(
    Line(points = {{60, -4}, {72, -4}, {72, -26}}, color = {117, 80, 123}));
  connect(r1.pin_n, ground1.pin) annotation(
    Line(points = {{60, 12}, {72, 12}, {72, -26}}, color = {117, 80, 123}));
  connect(z.pin_n, ground1.pin) annotation(
    Line(points = {{62, 28}, {72, 28}, {72, -26}}, color = {117, 80, 123}));
  connect(test_DY1.hPin_N, ground1.pin) annotation(
    Line(points = {{-8, 3}, {-8, -26}, {72, -26}}, color = {117, 80, 123}));
  connect(test_DY1.pinSec_A, z.pin_p) annotation(
    Line(points = {{2, 28}, {42, 28}}));
  connect(test_DY1.pinSec_B, r1.pin_p) annotation(
    Line(points = {{2, 18}, {13, 18}, {13, 12}, {40, 12}}));
  connect(test_DY1.pinSec_C, r2.pin_p) annotation(
    Line(points = {{2, 8}, {13, 8}, {13, -4}, {40, -4}}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent={{-120,-100},{120,100}})),
    Diagram(coordinateSystem(extent = {{-120, -100}, {120, 100}}, grid = {0, 0}, initialScale = 0.1)));
end Multiphase_Transformer;