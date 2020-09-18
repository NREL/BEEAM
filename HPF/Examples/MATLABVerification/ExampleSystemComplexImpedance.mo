within HPF.Examples.MATLABVerification;
model ExampleSystemComplexImpedance
  extends Modelica.Icons.Example;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms={i for i in 1:2:5})    annotation (
    Placement(visible = true, transformation(origin={-36.1847,50.4921},    extent = {{-9.81534, -9.81533}, {9.81534, 7.01095}}, rotation = 0)));
  HPF.Examples.MATLABVerification.HarmonicLoad load(start_v_re = cat(1, {120}, {0.0 for i in 1:systemDef.numHrm - 1})) annotation (
    Placement(visible = true, transformation(origin={14,-8},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance Z01(z = 0.8 + 0.008 * j) annotation (
    Placement(visible = true, transformation(origin={-4,12},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance Z12(z = 25 + 0.3013 * j) annotation (
    Placement(visible = true, transformation(origin={38,12},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin={-22,-36},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource V0(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {1e-3 for i in 2:systemDef.numHrm})) annotation (
    Placement(visible = true, transformation(origin={-22,-8},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(load.pin_n, ground.pin) annotation (
    Line(points={{14,-18},{14,-24.75},{-22,-24.75}},    color = {117, 80, 123}));
  connect(V0.pin_n, ground.pin) annotation (
    Line(points={{-22,-18},{-22,-24.75}},   color = {117, 80, 123}));
  connect(Z01.pin_p, V0.pin_p) annotation (
    Line(points={{-14,12},{-22,12},{-22,2}}));
  connect(load.pin_p, Z12.pin_p) annotation (
    Line(points={{14,2},{14,12},{28,12}}));
  connect(Z12.pin_n, ground.pin) annotation (
    Line(points={{48,12},{56,12},{56,-24.75},{-22,-24.75}},   color = {117, 80, 123}));
  connect(Z01.pin_n, load.pin_p) annotation (
    Line(points={{6,12},{14,12},{14,2}},             color = {117, 80, 123}));
  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end ExampleSystemComplexImpedance;
