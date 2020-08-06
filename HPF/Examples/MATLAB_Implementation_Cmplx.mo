within HPF.Examples;
model MATLAB_Implementation_Cmplx
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms={i for i in 1:2:25})    annotation (
    Placement(visible = true, transformation(origin={-80.1847, 12.4921},    extent = {{-9.81534, -9.81533}, {9.81534, 7.01095}}, rotation = 0)));
  HPF.Test_components.HarmonicSource_MATLAB_Implementation_Cmplx load annotation (
    Placement(visible = true, transformation(origin={-26,0},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance Z01(z = 0.8 + 0.008 * j) annotation (
    Placement(visible = true, transformation(origin = {-46, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance Z12(z = 25 + 0.3013 * j) annotation (
    Placement(visible = true, transformation(origin={-4,20},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-64, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource V0(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {0 for i in 2:systemDef.numHrm})) annotation (
    Placement(visible = true, transformation(origin = {-64, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(load.pin_n, ground.pin) annotation (
    Line(points={{-26,-10},{-26,-18},{-64,-18}},        color = {117, 80, 123}));
  connect(V0.pin_n, ground.pin) annotation (
    Line(points = {{-64, -10}, {-64, -18}}, color = {117, 80, 123}));
  connect(Z01.pin_p, V0.pin_p) annotation (
    Line(points = {{-56, 20}, {-64, 20}, {-64, 10}}));
  connect(load.pin_p, Z12.pin_p) annotation (
    Line(points={{-26,10},{-26,20},{-14,20}}));
  connect(Z12.pin_n, ground.pin) annotation (
    Line(points={{6,20},{14,20},{14,-18},{-64,-18}},           color = {117, 80, 123}));
  connect(Z01.pin_n, load.pin_p) annotation (
    Line(points={{-36,20},{-26,20},{-26,10}},        color = {117, 80, 123}));
  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end MATLAB_Implementation_Cmplx;
