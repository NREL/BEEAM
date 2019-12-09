within HPF.Examples;
model MATLAB_Implementation
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms={i for i in 1:2:15})    annotation (
    Placement(visible = true, transformation(origin = {-62.4898, 52.3499}, extent = {{-13.5102, -13.5102}, {13.5102, 9.65013}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-36, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource V_0h(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {1e-3 for i in 2:systemDef.numHrm}))  annotation (
    Placement(visible = true, transformation(origin = {-36, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Test_components.HarmonicSource_MATLAB_Implementation g_h(P = 1000)  annotation (
    Placement(visible = true, transformation(origin = {12, -4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Resistor r1(r = 0.5) annotation (
    Placement(visible = true, transformation(origin = {-8, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Resistor r2(r = 28.8) annotation (
    Placement(visible = true, transformation(origin = {32, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r(r = 0) annotation (
    Placement(visible = true, transformation(origin = {12, 22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Resistor     r3(r= 0)  annotation (
    Placement(visible = true, transformation(origin={12,-32},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(V_0h.pin_n, ground.pin) annotation(
    Line(points = {{-36, -4}, {-36, -48}}, color = {117, 80, 123}));
  connect(r1.pin_p, V_0h.pin_p) annotation(
    Line(points = {{-18, 38}, {-36, 38}, {-36, 16}}));
  connect(r2.pin_p, r1.pin_n) annotation (
    Line(points = {{22, 38}, {2, 38}}));
  connect(r2.pin_n, ground.pin) annotation (
    Line(points = {{42, 38}, {50, 38}, {50, -48}, {-36, -48}}, color = {117, 80, 123}));
  connect(r.pin_p, r1.pin_n) annotation (
    Line(points = {{12, 32}, {12, 32}, {12, 38}, {2, 38}, {2, 38}}));
  connect(r.pin_n, g_h.pin_p) annotation (
    Line(points = {{12, 12}, {12, 12}, {12, 6}, {12, 6}}, color = {117, 80, 123}));
  connect(g_h.pin_n, r3.pin_p)
    annotation (Line(points={{12,-14},{12,-22},{12,-22}}, color={117,80,123}));
  connect(r3.pin_n, ground.pin) annotation (Line(points={{12,-42},{12,-48},{-36,
          -48}}, color={117,80,123}));
  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-08, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end MATLAB_Implementation;