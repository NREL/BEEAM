within HPF.Test;

model tmp_tfmr_scenario_2
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-170, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-44, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:3}) annotation(
    Placement(visible = true, transformation(origin = {-200, 50}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA = {0.52499, -0.88841, 3.4872, -0.94808, 0.85909, 0.52945, 2.6655, 3.5892, 3.2065, 0.94815, -0.35511, 0.37935, 5.1097, 0.40428, -0.95003}, vArg_phB = {4.7124, 2.7285, 0.15651, 3.1172, 0.62717, 2.8404, 0.3399, 2.4464, -0.96217, 4.5697, 1.7365, 1.7654, 3.0041, 2.7107, 0.80607}, vArg_phC = {2.6198, 0.43868, 2.8011, 0.69877, 3.8703, 4.722, 4.5694, -0.318, 1.0873, 2.7087, 3.9677, 4.1386, 0.25782, -1.0032, 2.9098}, vMag_phA = {281.8926, 0.52366, 0.38862, 0.86889, 0.1986, 0.94358, 0.36557, 0.026172, 0.40802, 0.14926, 0.033798, 0.10907, 0.020583, 0.016168, 0.094782}, vMag_phB = {281.5477, 0.6757, 0.51619, 1.3095, 0.26078, 0.86039, 0.39031, 0.051013, 0.3918, 0.15365, 0.039917, 0.09168, 0.053936, 0.028169, 0.072528}, vMag_phC = {281.4037, 0.32832, 0.15324, 1.0483, 0.45472, 0.73298, 0.30034, 0.06761, 0.39297, 0.071917, 0.037663, 0.15445, 0.046989, 0.021181, 0.10834}) annotation(
    Placement(visible = true, transformation(origin = {-168, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation(
    Placement(visible = true, transformation(origin = {60, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground19 annotation(
    Placement(visible = true, transformation(origin = {-4, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(Rc = 1e10, Rp = 1e-6, Rs = 1e-6, VPrimRated = 480, VSecRated = 208, Xm = 1e10, Xp = 1e-6, Xs = 1e-6, fEC = 0, fOSL = 0, fW = 1) annotation(
    Placement(visible = true, transformation(origin = {-64, -6}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {18, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r(r = 50)  annotation(
    Placement(visible = true, transformation(origin = {-10, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R(r = 100)  annotation(
    Placement(visible = true, transformation(origin = {34, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R1(r = 60)  annotation(
    Placement(visible = true, transformation(origin = {-24, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-47, -25}, {-44, -25}, {-44, -59}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation(
    Line(points = {{-155.5, 5.5}, {-140, 5.5}, {-140, 10}, {-80, 10}}, color = {92, 53, 102}));
  connect(deltaWye.pinPrim_B, voltageSource.pinP_phB) annotation(
    Line(points = {{-80, -6}, {-133.75, -6}, {-133.75, -2}, {-155.5, -2}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation(
    Line(points = {{-155.5, -12}, {-141.75, -12}, {-141.75, -22}, {-80, -22}}, color = {92, 53, 102}));
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-168, -15}, {-168, -25}, {-170, -25}, {-170, -31}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, r.pin_p) annotation(
    Line(points = {{-48, 14}, {-20, 14}, {-20, 14}, {-20, 14}, {-20, 14}}, color = {92, 53, 102}));
  connect(r.pin_n, ground3.pin) annotation(
    Line(points = {{0, 14}, {18, 14}, {18, 14}, {18, 14}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_B, R.pin_p) annotation(
    Line(points = {{-48, 0}, {24, 0}, {24, -2}, {24, -2}}, color = {92, 53, 102}));
  connect(ground17.pin, R.pin_n) annotation(
    Line(points = {{60, -3}, {44, -3}, {44, -2}}, color = {92, 53, 102}));
  connect(R1.pin_n, ground19.pin) annotation(
    Line(points = {{-14, -12}, {-4, -12}, {-4, -18}}, color = {117, 80, 123}));
  connect(R1.pin_p, deltaWye.pinSec_C) annotation(
    Line(points = {{-34, -12}, {-48, -12}, {-48, -12}, {-48, -12}}, color = {92, 53, 102}));
  annotation(
    Diagram(coordinateSystem(extent = {{-230, -230}, {230, 230}}, initialScale = 0.1)),
    Icon(coordinateSystem(extent = {{-230, -230}, {230, 230}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_NLS,LOG_RES_INIT,LOG_SOLVER,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ");
end tmp_tfmr_scenario_2;