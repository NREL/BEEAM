within HPF.Examples;
model MATLAB_Implementation
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms={i for i in 1:2:25})    annotation (
    Placement(visible = true, transformation(origin = {-70.4898, 46.3499}, extent = {{-13.5102, -13.5102}, {13.5102, 9.65013}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-36, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource V_0h(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {1e-3 for i in 2:systemDef.numHrm}))  annotation (
    Placement(visible = true, transformation(origin = {-36, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Test_components.HarmonicSource_MATLAB_Implementation load(P = 1000, start_v_re = cat(1, {120}, {0.0 for i in 1:systemDef.numHrm - 1}))  annotation (
    Placement(visible = true, transformation(origin = {12, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Resistor r1(r = 0.8) annotation (
    Placement(visible = true, transformation(origin = {-8, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Resistor r2(r = 25) annotation (
    Placement(visible = true, transformation(origin = {32, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(V_0h.pin_n, ground.pin) annotation (
    Line(points = {{-36, -4}, {-36, -21}}, color = {117, 80, 123}));
  connect(r1.pin_p, V_0h.pin_p) annotation (
    Line(points = {{-18, 38}, {-36, 38}, {-36, 16}}));
  connect(r2.pin_p, r1.pin_n) annotation (
    Line(points = {{22, 38}, {2, 38}}));
  connect(r2.pin_n, ground.pin) annotation (
    Line(points = {{42, 38}, {50, 38}, {50, -21}, {-36, -21}}, color = {117, 80, 123}));
  connect(r1.pin_n, load.pin_p) annotation (
    Line(points = {{2, 38}, {12, 38}, {12, 20}}, color = {117, 80, 123}));
  connect(load.pin_n, ground.pin) annotation (
    Line(points = {{12, 0}, {12, -22}, {-36, -22}, {-36, -20}}, color = {117, 80, 123}));
  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-08, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"),
  Diagram(graphics = {Text(origin = {-10, 78}, extent = {{-70, 10}, {70, -10}}, textString = "HPF test - MATLAB equivalent implementation, only resistive elements")}));
end MATLAB_Implementation;
