within HPF.Examples.ModelingValidation;
model Scenario_5_Data_Set_5_1
  SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-148, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin = {-146, 76}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  Sources.ThreePhase.VotlageSource voltageSource(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation (
    Placement(visible = true, transformation(origin = {-148, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-80,-34},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.Symmetric.D1Y deltaWye(Rc = 15117.5, Rp = 8.333, Rs = 1.4404E-01, Xm = 2.3311e+03, Xp = 3.3002, Xs = 0.6197) annotation (
    Placement(visible = true, transformation(extent={{-104,-6},{-84,14}},      rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_3(P_DCmin = 2, P_stby = 0.44, V_Rect = 25, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_3.mat", nomP = 72) annotation (
    Placement(visible = true, transformation(origin={-2,10},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={88, -20},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 72.741145) annotation (
    Placement(visible = true, transformation(origin={88, 6},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin={-28,-10},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Terminate terminate1
    annotation (Placement(transformation(extent={{-78,2},{-64,16}})));
  SinglePhase.Components.Terminate terminate2
    annotation (Placement(transformation(extent={{-78,-6},{-64,8}})));
  HPF.DC.DC2DC_Converters.StepDown conv1(modelData = modelData)  annotation(
    Placement(visible = true, transformation(origin = {44, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {26, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter HPF.Data.ConverterModels.DC2DC_StepDown.ModelData modelData(V = 18, alpha = 1.484, beta = 0.0252, gamma = 0.005)  annotation(
    Placement(visible = true, transformation(origin = {76, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation (
    Line(points={{-148,-8.75},{-148,-20}},         color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points={{-84,-8},{-80,-8},{-80,-24}},           color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation (
    Line(points={{-135.5,14},{-104,14}},      color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B) annotation (
    Line(points={{-135.5,4},{-104,4}},      color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation (
    Line(points={{-135.5,-6},{-104,-6}},      color = {92, 53, 102}));
  connect(ground3.p, Laptop_3.n) annotation(
    Line(points = {{88, -10}, {88, -4}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation (
    Line(points={{-12,4},{-28,4},{-28,0}},        color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, Laptop_Charger_3.hPin_P)
    annotation (Line(points={{-84,16},{-12,16}}, color={92,53,102}));
  connect(deltaWye.pinSec_B, terminate1.hPin_P)
    annotation (Line(points={{-84,8},{-73,8}}, color={92,53,102}));
  connect(deltaWye.pinSec_C, terminate2.hPin_P)
    annotation (Line(points={{-84,0},{-73,0}}, color={92,53,102}));
  connect(Laptop_Charger_3.pin_p, conv1.p1) annotation(
    Line(points = {{8, 16}, {34, 16}, {34, 16}, {34, 16}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n, conv1.n1) annotation(
    Line(points = {{8, 4}, {18, 4}, {18, -4}, {34, -4}, {34, -4}}, color = {0, 0, 255}));
  connect(conv1.n1, ground1.p) annotation(
    Line(points = {{34, -4}, {26, -4}, {26, -12}, {26, -12}}, color = {0, 0, 255}));
  connect(conv1.p2, Laptop_3.p) annotation(
    Line(points = {{54, 16}, {88, 16}}, color = {0, 0, 255}));
  connect(conv1.n2, Laptop_3.n) annotation(
    Line(points = {{54, -4}, {88, -4}, {88, -4}, {88, -4}}, color = {0, 0, 255}));
  annotation (
    Diagram(coordinateSystem(extent = {{-280, -220}, {260, 240}}, initialScale = 0.1), graphics={Text(lineColor = {28, 108, 200}, extent = {{-256, 64}, {-250, 64}}, textString = "Edit Here"), Text(lineColor = {28, 108, 200}, extent = {{-234, 200}, {150, 150}}, textString = "Data Set 4.4
	Load Phase a-n	Total Load - 700W	Laptop Charger 3 + LED Driver 1	Load Bank 1 (78W), LED 1 (22W), Heater 1 - A (200W), Heater 2 - A (400W)
	Load Phase b-n	Total Load - 500W	Laptop Charger 4 + LED Driver 2	Load Bank 2 (78W), LED 2 (22W), Heater 2 - B (400W)
	Load Phase c-n	Total Load - 100W	Laptop Charger 5 + LED Driver 3	Load Bank 2 (78W), LED 2 (22W)
    ", horizontalAlignment = TextAlignment.Left), Text(origin = {-144, 42}, lineColor = {28, 108, 200}, extent = {{174, -126}, {234, -146}}, textString = "PhD 25V outputs
    ")}),
    Icon(coordinateSystem(extent = {{-280, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_5_Data_Set_5_1;