within HPF.Test;
model Multiphase_Transformer
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms={1, 3, 5})
                                annotation (
    Placement(visible = true, transformation(origin = {-50, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Machines.Transformers_iPh.Test_DY test_DY1(N = 4)  annotation (
    Placement(visible = true, transformation(origin={ -2, 28},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource PhA(vArg = {0, 0.5, 2.3}, vMag = {392, 10, 3})  annotation (Placement(visible = true, transformation(origin={-60, 26},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource PhB(vArg = {Modelica.SIunits.Conversions.from_deg(-120), 0, 1.2}, vMag = {392, 11, 2.6})  annotation (Placement(visible = true, transformation(origin={-44, 10},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource PhC(vArg = {Modelica.SIunits.Conversions.from_deg(120), 0.6, 2.1}, vMag = {392, 10, 3})  annotation (Placement(visible = true, transformation(origin = {-32, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground
    annotation (Placement(visible = true, transformation(extent = {{-70, -30}, {-50, -10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1
    annotation (Placement(visible = true, transformation(extent = {{72, -26}, {92, -6}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r1(r = 500)  annotation (
    Placement(visible = true, transformation(origin = {62, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r2(r = 500)  annotation (
    Placement(visible = true, transformation(origin = {62, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = Complex(500, 20))  annotation (
    Placement(visible = true, transformation(origin = {62, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(test_DY1.pinPrim_A, PhA.pin_p) annotation (
    Line(points = {{-12, 38}, {-36, 38}, {-36, 36}, {-60, 36}}));
  connect(PhB.pin_p, test_DY1.pinPrim_B) annotation (
    Line(points = {{-44, 20}, {-44, 28}, {-12, 28}}));
  connect(test_DY1.pinPrim_C, PhC.pin_p) annotation (
    Line(points={{-12,18},{-32,18},{-32,0}}));
  connect(PhC.pin_n, ground.pin) annotation (
    Line(points = {{-32, -20}, {-62, -20}, {-62, -20}, {-61, -20}, {-61, -20}, {-60, -20}}, color = {117, 80, 123}));
  connect(PhB.pin_n, ground.pin) annotation (
    Line(points = {{-44, 0}, {-60, 0}, {-60, -20}, {-60, -20}}, color = {117, 80, 123}));
  connect(PhA.pin_n, ground.pin) annotation (
    Line(points = {{-60, 16}, {-60, 16}, {-60, -20}, {-60, -20}}, color = {117, 80, 123}));
  connect(r2.pin_n, ground1.pin) annotation (
    Line(points = {{72, 12}, {82, 12}, {82, -16}}, color = {117, 80, 123}));
  connect(r1.pin_n, ground1.pin) annotation (
    Line(points = {{72, 24}, {82, 24}, {82, -16}}, color = {117, 80, 123}));
  connect(z.pin_n, ground1.pin) annotation (
    Line(points = {{72, 38}, {82, 38}, {82, -16}}, color = {117, 80, 123}));
  connect(test_DY1.hPin_N, ground1.pin) annotation (Line(points={{-2,13},{0,13},
          {0,-16},{82,-16}}, color={117,80,123}));
  connect(test_DY1.pinSec_A, z.pin_p)
    annotation (Line(points={{8,38},{52,38}}, color={0,0,0}));
  connect(test_DY1.pinSec_B, r1.pin_p)
    annotation (Line(points={{8,28},{30,28},{30,24},{52,24}}, color={0,0,0}));
  connect(test_DY1.pinSec_C, r2.pin_p)
    annotation (Line(points={{8,18},{24,18},{24,12},{52,12}}, color={0,0,0}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent={{-120,-100},{120,100}})),
    Diagram(coordinateSystem(extent = {{-120, -100}, {120, 100}}, grid = {0, 0}, initialScale = 0.1)));
end Multiphase_Transformer;