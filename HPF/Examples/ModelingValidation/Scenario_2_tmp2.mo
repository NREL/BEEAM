within HPF.Examples.ModelingValidation;
model Scenario_2_tmp2
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-178, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(               Rp = 2.7672,              VPrimRated = 480, VSecRated = 208,                Xp = 1.1006,
    Rc=3.5366e3,
    Xm=711.1091,
    Xs=0.5,
    fW=0.9,
    fEC=0.067,
    fOSL=0.033,
    Rs=0.25)                                                                                                                                                                                              annotation (
    Placement(visible = true, transformation(origin={-66,50},    extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-52,34},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms={i for i in 1:2:3})    annotation (
    Placement(visible = true, transformation(origin = {-148, 126}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(
    vMag_phA={282.8166,0.45117},
    vArg_phA={0.52192,6.1952},
    vMag_phB={282.9682,0.65765},
    vArg_phB={4.7065,3.5627},
    vMag_phC={281.8661,0.35229},
    vArg_phC={2.6138,1.127})                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-178, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhA annotation (
    Placement(visible = true, transformation(origin = {-152, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhB annotation (
    Placement(visible = true, transformation(origin = {-124, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhC annotation (
    Placement(visible = true, transformation(origin = {-146, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground1 annotation (
    Placement(visible = true, transformation(origin={50,26},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Test_components.Test_harmonic_load test_harmonic_load(P=100, argS=-0.3)
    annotation (Placement(transformation(extent={{2,70},{22,90}})));
  Test_components.Test_harmonic_load test_harmonic_load1(P=200, argS=-0.03)
    annotation (Placement(transformation(extent={{2,44},{22,64}})));
  Test_components.Test_harmonic_load test_harmonic_load2(P=150, argS=-0.115)
    annotation (Placement(transformation(extent={{2,16},{22,36}})));
  SinglePhase.Components.Ground     ground3 annotation (
    Placement(visible = true, transformation(origin={50,54},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground4 annotation (
    Placement(visible = true, transformation(origin={50,80},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation (
    Line(points={{-178,37.8},{-178,30}},    color = {117, 80, 123}));
  connect(voltageSource.pinP_phB, iMsr_prim_PhA.pin_p) annotation (
    Line(points = {{-168, 56}, {-162, 56}, {-162, 58}}, color = {92, 53, 102}));
  connect(iMsr_prim_PhA.pin_n, deltaWye.pinPrim_A) annotation (
    Line(points={{-142,58},{-110,58},{-110,60},{-76,60}},
                                           color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points={{-55,38.4},{-52,38.4},{-52,34}},    color = {117, 80, 123}));
  connect(iMsr_prim_PhC.pin_n, deltaWye.pinPrim_C) annotation (
    Line(points={{-136,38},{-108,38},{-108,40},{-76,40}},
                                           color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, iMsr_prim_PhB.pin_p) annotation (
    Line(points={{-167.8,48},{-134,48},{-134,48},{-134,48}},        color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, iMsr_prim_PhC.pin_p) annotation (
    Line(points = {{-168, 40}, {-162, 40}, {-162, 38}, {-156, 38}, {-156, 38}}, color = {92, 53, 102}));
  connect(iMsr_prim_PhB.pin_n, deltaWye.pinPrim_B) annotation (
    Line(points={{-114,48},{-76,48},{-76,50}},                   color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, test_harmonic_load.pin_p) annotation (Line(points=
          {{-56,62},{-28,62},{-28,80},{2,80}}, color={92,53,102}));
  connect(test_harmonic_load2.pin_n, ground1.pin)
    annotation (Line(points={{22,26},{50,26}}, color={117,80,123}));
  connect(deltaWye.pinSec_B, test_harmonic_load1.pin_p)
    annotation (Line(points={{-56,54},{2,54}}, color={92,53,102}));
  connect(test_harmonic_load2.pin_p, deltaWye.pinSec_C) annotation (Line(points=
         {{2,26},{-28,26},{-28,46},{-56,46},{-56,46.2}}, color={92,53,102}));
  connect(test_harmonic_load.pin_n, ground4.pin)
    annotation (Line(points={{22,80},{50,80}}, color={117,80,123}));
  connect(test_harmonic_load1.pin_n, ground3.pin)
    annotation (Line(points={{22,54},{50,54}}, color={117,80,123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, initialScale = 0.1), graphics={  Text(origin = {-12, 4}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {146, 164}}, textString = "Scenario 2 | Data Set 2.3
Load Phase a-n	Total Load - 300W      Load Bank 1 (78W), LED 1 (22W), Resistor 2 (200W)
Load Phase b-n	Total Load - 500W      Load Bank 2 (78W), LED 2 (22W), Resistor 3 (400W)
Load Phase c-n	Total Load - 700W      Load Bank 3 (78W), LED 3 (22W), Resistor 4 (600W)", fontSize = 9,
            horizontalAlignment =                                                                                             TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_2_tmp2;
