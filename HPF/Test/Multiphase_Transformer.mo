within HPF.Test;
model Multiphase_Transformer
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5, 7}) annotation (
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(extent = {{-96, -32}, {-76, -12}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(extent = {{102, -34}, {122, -14}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r1(r = 500) annotation (
    Placement(visible = true, transformation(origin = {90, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r2(r = 500) annotation (
    Placement(visible = true, transformation(origin = {90, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 500 + 20 * j) annotation (
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource votlageSource(vArg_phA = {0.52192, 6.1952, 3.641, 8.2279}, vArg_phB = {4.7065, 3.5627, 4.2216, 5.9383}, vArg_phC = {2.6138, 1.127, 6.9575, 3.4123}, vMag_phA = {282.8166, 0.45117, 0.39336, 0.76549}, vMag_phB = {282.9682, 0.65765, 0.17303, 1.3199}, vMag_phC = {281.8661, 0.35229, 0.54619, 0.99899}) annotation (
    Placement(visible = true, transformation(origin = {-86, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(extent = {{10, -44}, {30, -24}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(Rc = 1e10, Rp = 1e-5, Rs = 1e-5, VPrimRated = 480, VSecRated = 208, Xm = 1e10, Xp = 1e-5, Xs = 1e-5, fEC = 0.1, fOSL = 0.1, fW = 0.1) annotation (
    Placement(visible = true, transformation(origin = {-18, 16}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
equation
  connect(r2.pin_n, ground1.pin) annotation (
    Line(points = {{100, -2}, {112, -2}, {112, -24}}, color = {117, 80, 123}));
  connect(r1.pin_n, ground1.pin) annotation (
    Line(points = {{100, 14}, {112, 14}, {112, -24}}, color = {117, 80, 123}));
  connect(z.pin_n, ground1.pin) annotation (
    Line(points = {{100, 30}, {112, 30}, {112, -24}}, color = {117, 80, 123}));
  connect(ground.pin, votlageSource.pinN) annotation (
    Line(points = {{-86, -22}, {-86, 8}}, color = {92, 53, 102}));
  connect(z.pin_p, deltaWye.pinSec_A) annotation(
    Line(points = {{80, 30}, {34, 30}, {34, 35}, {-1, 35}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-1, -3}, {20, -3}, {20, -34}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_C, r2.pin_p) annotation(
    Line(points = {{-1, 10}, {20, 10}, {20, -2}, {80, -2}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, r1.pin_p) annotation(
    Line(points = {{-1, 22}, {26, 22}, {26, 14}, {80, 14}}, color = {92, 53, 102}));
  connect(votlageSource.pinP_phC, deltaWye.pinPrim_C) annotation(
    Line(points = {{-76, 10}, {-43, 10}, {-43, 0}, {-34, 0}}, color = {92, 53, 102}));
  connect(votlageSource.pinP_phB, deltaWye.pinPrim_A) annotation(
    Line(points = {{-76, 26}, {-42, 26}, {-42, 32}, {-34, 32}}, color = {92, 53, 102}));
  connect(votlageSource.pinP_phA, deltaWye.pinPrim_B) annotation(
    Line(points = {{-76, 18}, {-54, 18}, {-54, 16}, {-34, 16}}, color = {92, 53, 102}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-120, -100}, {120, 100}})),
    Diagram(coordinateSystem(extent = {{-120, -100}, {120, 100}}, grid = {0, 0}, initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Multiphase_Transformer;