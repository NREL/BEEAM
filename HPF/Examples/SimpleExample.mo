within HPF.Examples;
model SimpleExample
  extends Modelica.Icons.Example;
  HPF.SinglePhase.Components.Impedance Z12(z = 25 + 0.3013 * j) annotation (
    Placement(visible = true, transformation(origin = {18, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Test_components.HarmonicSource_MATLAB_Implementation_Coupled load(start_v_re = cat(1, {120}, {0.0 for i in 1:systemDef.numHrm - 1})) annotation (
    Placement(visible = true, transformation(origin = {-4, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:25}) annotation (
    Placement(visible = true, transformation(origin = {-76.1847, 6.4921}, extent = {{-9.81534, -9.81533}, {9.81534, 7.01095}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource V0(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {1e-3 for i in 2:systemDef.numHrm})) annotation (
    Placement(visible = true, transformation(origin = {-42, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-42, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance Z01(z = 0.8 + 0.008 * j) annotation (
    Placement(visible = true, transformation(origin = {-24, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Z12.pin_n, ground.pin) annotation (
    Line(points = {{28, 10}, {36, 10}, {36, -26.75}, {-42, -26.75}}, color = {117, 80, 123}));
  connect(Z01.pin_n, load.pin_p) annotation (
    Line(points = {{-14, 10}, {-4, 10}, {-4, 0}}, color = {117, 80, 123}));
  connect(load.pin_n, ground.pin) annotation (
    Line(points = {{-4, -20}, {-4, -26.75}, {-42, -26.75}}, color = {117, 80, 123}));
  connect(V0.pin_n, ground.pin) annotation (
    Line(points = {{-42, -20}, {-42, -26.75}}, color = {117, 80, 123}));
  connect(Z01.pin_p, V0.pin_p) annotation (
    Line(points = {{-34, 10}, {-42, 10}, {-42, 0}}));
  connect(load.pin_p, Z12.pin_p) annotation (
    Line(points = {{-4, 0}, {-4, 10}, {8, 10}}));
end SimpleExample;
