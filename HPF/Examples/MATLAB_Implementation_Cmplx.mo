within HPF.Examples;
model MATLAB_Implementation_Cmplx
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms={i for i in 1:2:20})   annotation (
    Placement(visible = true, transformation(origin = {-63.125, 50.1459}, extent = {{-12.875, -12.875}, {12.875, 9.19641}}, rotation = 0)));
  HPF.Test_components.HarmonicSource_MATLAB_Implementation_Cmplx load annotation (
    Placement(visible = true, transformation(origin = {8, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance Z01(z = 0.8 + 0.008 * j) annotation (
    Placement(visible = true, transformation(origin = {-46, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance Z1g(z = 25 + 0.3013 * j) annotation (
    Placement(visible = true, transformation(origin = {38, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-64, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource V0(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {1e-3 for i in 2:systemDef.numHrm})) annotation (
    Placement(visible = true, transformation(origin = {-64, -4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = Complex(0, 0)) annotation (
    Placement(visible = true, transformation(origin = {-8, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(load.pin_n, ground.pin) annotation (
    Line(points = {{8, -16}, {8, -30}, {-64, -30}}, color = {117, 80, 123}));
  connect(V0.pin_n, ground.pin) annotation (
    Line(points = {{-64, -14}, {-64, -30}}, color = {117, 80, 123}));
  connect(Z01.pin_p, V0.pin_p) annotation (
    Line(points = {{-56, 20}, {-64, 20}, {-64, 6}}));
  connect(load.pin_p, Z1g.pin_p) annotation (
    Line(points = {{8, 4}, {8, 20}, {28, 20}}));
  connect(Z1g.pin_n, ground.pin) annotation (
    Line(points = {{48, 20}, {58, 20}, {58, -30}, {-64, -30}}, color = {117, 80, 123}));
  connect(Z01.pin_n, z.pin_p) annotation (
    Line(points = {{-36, 20}, {-18, 20}}, color = {117, 80, 123}));
  connect(z.pin_n, load.pin_p) annotation (
    Line(points = {{2, 20}, {8, 20}, {8, 4}}, color = {117, 80, 123}));
  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end MATLAB_Implementation_Cmplx;
