within HPF.Examples;
model ExampleSystem
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms={i for i in 1:2:25})    annotation (
    Placement(visible = true, transformation(origin={-52.1847, 36.4921},    extent = {{-9.81534, -9.81533}, {9.81534, 7.01095}}, rotation = 0)));
  HPF.Test_components.HarmonicLoad load annotation (
    Placement(visible = true, transformation(origin={10,24},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance Z01(z = 0.8 + 0.008 * j) annotation (
    Placement(visible = true, transformation(origin = {-10, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance Z12(z = 25 + 0.3013 * j) annotation (
    Placement(visible = true, transformation(origin={32,44},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-28, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource V0(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {0 for i in 2:systemDef.numHrm})) annotation (
    Placement(visible = true, transformation(origin = {-28, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(load.pin_n, ground.pin) annotation (
    Line(points = {{10, 14}, {10, 5}, {-28, 5}}, color = {117, 80, 123}));
  connect(V0.pin_n, ground.pin) annotation (
    Line(points = {{-28, 14}, {-28, 5}}, color = {117, 80, 123}));
  connect(Z01.pin_p, V0.pin_p) annotation (
    Line(points = {{-20, 44}, {-28, 44}, {-28, 34}}));
  connect(load.pin_p, Z12.pin_p) annotation (
    Line(points = {{10, 34}, {10, 44}, {22, 44}}));
  connect(Z12.pin_n, ground.pin) annotation (
    Line(points = {{42, 44}, {50, 44}, {50, 5}, {-28, 5}}, color = {117, 80, 123}));
  connect(Z01.pin_n, load.pin_p) annotation (
    Line(points = {{0, 44}, {10, 44}, {10, 34}}, color = {117, 80, 123}));
  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end ExampleSystem;
