within HPF.Test;

model HarmonicPQLoad
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0, 0, 0}, vMag = {120, 0.01, 0.01}) annotation(
    Placement(visible = true, transformation(origin = {-52, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-52, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 10 + 0.1 * j) annotation(
    Placement(visible = true, transformation(origin = {-2, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {16, 12}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5}) annotation(
    Placement(visible = true, transformation(origin = {-82, 80}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  SinglePhase.Components.Resistor r(r = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-2, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Loads.UserDefined.HarmonicPQLoad harmonicPQLoad(P = {10}, Q = {0.1}) annotation(
    Placement(visible = true, transformation(origin = {40, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(v.pin_n, ground.pin) annotation(
    Line(points = {{-52, 20}, {-52, 20}, {-52, 4}, {-52, 4}}, color = {117, 80, 123}));
  connect(z.pin_p, v.pin_p) annotation(
    Line(points = {{-12, 26}, {-30, 26}, {-30, 40}, {-52, 40}, {-52, 40}}, color = {92, 53, 102}));
  connect(z.pin_n, ground1.pin) annotation(
    Line(points = {{8, 26}, {16, 26}, {16, 20}, {16, 20}}, color = {117, 80, 123}));
  connect(v.pin_p, r.pin_p) annotation(
    Line(points = {{-52, 40}, {-52, 52}, {-12, 52}}, color = {92, 53, 102}));
  connect(harmonicPQLoad.hPin_P, r.pin_n) annotation(
    Line(points = {{30, 52}, {8, 52}, {8, 52}, {8, 52}}, color = {92, 53, 102}));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_INIT,LOG_NLS,LOG_NLS_V,LOG_NLS_RES,LOG_SIMULATION,LOG_SOLVER,LOG_STATS", outputFormat = "mat", s = "dassl"));
end HarmonicPQLoad;