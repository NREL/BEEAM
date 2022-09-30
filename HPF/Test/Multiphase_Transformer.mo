within HPF.Test;
model Multiphase_Transformer
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5, 7}) annotation (
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(extent = {{-108, -36}, {-88, -16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(extent = {{108, -34}, {128, -14}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r1(r = 500) annotation (
    Placement(visible = true, transformation(origin = {94, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r2(r = 500) annotation (
    Placement(visible = true, transformation(origin = {94, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 500 + 0 * j) annotation (
    Placement(visible = true, transformation(origin = {94, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0.52192, 6.1952, 3.641, 8.2279}, vArg_phB = {4.7065, 3.5627, 4.2216, 5.9383}, vArg_phC = {2.6138, 1.127, 6.9575, 3.4123}, vMag_phA = {282.8166, 0.45117, 0.39336, 0.76549}, vMag_phB = {282.9682, 0.65765, 0.17303, 1.3199}, vMag_phC = {281.8661, 0.35229, 0.54619, 0.99899}) annotation (
    Placement(visible = true, transformation(origin = {-98, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(extent = {{-4, -78}, {16, -58}}, rotation = 0)));
  Transformers.ThreePhase.Symmetric.D1Y d1Y(    Rc = 1e10, Rp = 1e-5, Rs = 1e-5, VPrimRated = 480, VSecRated = 208, Xm = 1e10, Xp = 1e-5, Xs = 1e-5)                                  annotation (
    Placement(visible = true, transformation(origin = {-18, 14}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsrSec_phA annotation (
    Placement(visible = true, transformation(origin = {22, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsrSec_phB annotation (
    Placement(visible = true, transformation(origin = {44, -32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsrSec_pbC annotation (
    Placement(visible = true, transformation(origin = {62, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(r2.pin_n, ground1.pin) annotation (
    Line(points={{104,2},{104,13.5},{118,13.5},{118,-12.75}},       color = {117, 80, 123}));
  connect(r1.pin_n, ground1.pin) annotation (
    Line(points={{104,18},{104,21.5},{118,21.5},{118,-12.75}},       color = {117, 80, 123}));
  connect(z.pin_n, ground1.pin) annotation (
    Line(points={{104,34},{104,29.5},{118,29.5},{118,-12.75}},       color = {117, 80, 123}));
  connect(ground.pin, voltageSource.pinN) annotation (
    Line(points={{-98,-14.75},{-98,5.25}},      color = {92, 53, 102}));
  connect(z.pin_p, d1Y.pinSec_A) annotation (Line(points={{84,34},{72,34},{72,
          33.2},{-2,33.2}}, color={92,53,102}));
  connect(d1Y.pinSec_N, ground2.pin) annotation (Line(points={{-2,-5.2},{6,-5.2},
          {6,-56.75}}, color={117,80,123}));
  connect(d1Y.pinSec_C, r2.pin_p) annotation (Line(points={{-2,7.6},{72,7.6},{
          72,2},{84,2}}, color={92,53,102}));
  connect(d1Y.pinSec_B, r1.pin_p) annotation (Line(points={{-2,20.4},{71.5,20.4},
          {71.5,18},{84,18}}, color={92,53,102}));
  connect(voltageSource.pinP_phC, d1Y.pinPrim_C) annotation (Line(points={{
          -85.5,8},{-43,8},{-43,-2},{-34,-2}}, color={92,53,102}));
  connect(voltageSource.pinP_phA, d1Y.pinPrim_A) annotation (Line(points={{
          -85.5,28},{-52,28},{-52,30},{-34,30}}, color={92,53,102}));
  connect(voltageSource.pinP_phB, d1Y.pinPrim_B) annotation (Line(points={{
          -85.5,18},{-53,18},{-53,14},{-34,14}}, color={92,53,102}));
  connect(vMsrSec_phA.pin_n, ground2.pin) annotation (
    Line(points={{22,-18},{22,-45},{6,-45},{6,-56.75}},       color = {117, 80, 123}));
  connect(vMsrSec_phA.pin_p, d1Y.pinSec_A)
    annotation (Line(points={{22,2},{22,33.2},{-2,33.2}}, color={92,53,102}));
  connect(vMsrSec_phB.pin_n, ground2.pin) annotation (
    Line(points={{44,-42},{44,-46},{6,-46},{6,-56.75}},       color = {117, 80, 123}));
  connect(vMsrSec_pbC.pin_n, ground2.pin) annotation (
    Line(points={{62,-18},{62,-18},{62,-46},{6,-46},{6,-56.75},{6,-56.75}},        color = {117, 80, 123}));
  connect(vMsrSec_phB.pin_p, d1Y.pinSec_B) annotation (Line(points={{44,-22},{
          44,-22},{44,20},{-2,20},{-2,20.4}}, color={92,53,102}));
  connect(vMsrSec_pbC.pin_p, d1Y.pinSec_C) annotation (Line(points={{62,2},{62,
          2},{62,8},{-2,8},{-2,7.6}}, color={92,53,102}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-120, -100}, {120, 100}})),
    Diagram(coordinateSystem(extent = {{-120, -100}, {120, 100}}, grid = {0, 0}, initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Multiphase_Transformer;
