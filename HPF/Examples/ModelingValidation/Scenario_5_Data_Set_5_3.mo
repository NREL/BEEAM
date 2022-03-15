within HPF.Examples.ModelingValidation;

model Scenario_5_Data_Set_5_3
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-146, 76}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Terminate terminate1 annotation(
    Placement(visible = true, transformation(extent = {{-78, 2}, {-64, 16}}, rotation = 0)));
  HPF.Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation(
    Placement(visible = true, transformation(origin = {-148, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-80, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-148, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Terminate terminate2 annotation(
    Placement(visible = true, transformation(extent = {{-78, -6}, {-64, 8}}, rotation = 0)));
  HPF.Transformers.ThreePhase.Symmetric.D1Y deltaWye(Rc = 15117.5, Rp = 8.333, Rs = 1.4404E-01, Xm = 2.3311e+03, Xp = 3.3002, Xs = 0.6197) annotation(
    Placement(visible = true, transformation(extent = {{-104, -6}, {-84, 14}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl NextekHub(P1(start = 600), S1(start = 600),  V_Rect = 25, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Nextek-PHD16-ACDC-DIM-P-24-6-120V.mat", nomP = 1600, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {-2, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {96, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_6(pwr = 41.465) annotation(
    Placement(visible = true, transformation(origin = {78, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground6 annotation(
    Placement(visible = true, transformation(origin = {-28, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC2DC_Converters.StepDown LaptopCharger_6(modelData = laptop_18V_90W_LapChrg6) annotation(
    Placement(visible = true, transformation(origin = {44, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {26, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_5(pwr = 40.475) annotation(
    Placement(visible = true, transformation(origin = {74, 52}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC2DC_Converters.StepDown LaptopCharger_5(modelData = laptop_18V_90W_LapChrg5) annotation(
    Placement(visible = true, transformation(origin = {44, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_4(pwr = 41.974) annotation(
    Placement(visible = true, transformation(origin = {74, 98}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC2DC_Converters.StepDown LaptopCharger_4(modelData = laptop_18V_90W_LapChrg4) annotation(
    Placement(visible = true, transformation(origin = {44, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LumpedDCLoads(pwr = 428.253) annotation(
    Placement(visible = true, transformation(origin = {14, -32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter HPF.Data.ConverterModels.DC2DC_StepDown.Laptop_18V_90W_LapChrg4 laptop_18V_90W_LapChrg4 annotation(
    Placement(visible = true, transformation(origin = {174, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter HPF.Data.ConverterModels.DC2DC_StepDown.Laptop_18V_90W_LapChrg5 laptop_18V_90W_LapChrg5 annotation(
    Placement(visible = true, transformation(origin = {178, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter HPF.Data.ConverterModels.DC2DC_StepDown.Laptop_18V_90W_LapChrg6 laptop_18V_90W_LapChrg6 annotation(
    Placement(visible = true, transformation(origin = {176, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B) annotation(
    Line(points = {{-135.5, 4}, {-104, 4}}, color = {92, 53, 102}));
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-148, -8.75}, {-148, -20}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_B, terminate1.hPin_P) annotation(
    Line(points = {{-84, 8}, {-73, 8}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, terminate2.hPin_P) annotation(
    Line(points = {{-84, 0}, {-73, 0}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-84, -8}, {-80, -8}, {-80, -24}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation(
    Line(points = {{-135.5, 14}, {-104, 14}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation(
    Line(points = {{-135.5, -6}, {-104, -6}}, color = {92, 53, 102}));
  connect(ground3.p, Laptop_6.n) annotation(
    Line(points = {{96, -4}, {96, -4.5}, {78, -4.5}, {78, -4}}, color = {0, 0, 255}));
  connect(NextekHub.hPin_N, ground6.pin) annotation(
    Line(points = {{-12, 4}, {-28, 4}, {-28, 0}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, NextekHub.hPin_P) annotation(
    Line(points = {{-84, 16}, {-12, 16}}, color = {92, 53, 102}));
  connect(NextekHub.pin_p, LaptopCharger_6.p1) annotation(
    Line(points = {{8, 16}, {34, 16}, {34, 16}, {34, 16}}, color = {0, 0, 255}));
  connect(NextekHub.pin_n, LaptopCharger_6.n1) annotation(
    Line(points = {{8, 4}, {18, 4}, {18, -4}, {34, -4}, {34, -4}}, color = {0, 0, 255}));
  connect(LaptopCharger_6.n1, ground1.p) annotation(
    Line(points = {{34, -4}, {26, -4}, {26, -54}}, color = {0, 0, 255}));
  connect(LaptopCharger_6.p2, Laptop_6.p) annotation(
    Line(points = {{54, 16}, {78, 16}}, color = {0, 0, 255}));
  connect(LaptopCharger_6.n2, Laptop_6.n) annotation(
    Line(points = {{54, -4}, {78, -4}}, color = {0, 0, 255}));
  connect(LaptopCharger_5.n2, Laptop_5.n) annotation(
    Line(points = {{54, 42}, {74, 42}}, color = {0, 0, 255}));
  connect(LaptopCharger_5.p2, Laptop_5.p) annotation(
    Line(points = {{54, 62}, {74, 62}}, color = {0, 0, 255}));
  connect(LaptopCharger_5.n1, LaptopCharger_6.n1) annotation(
    Line(points = {{34, 42}, {26, 42}, {26, -4}, {34, -4}, {34, -4}}, color = {0, 0, 255}));
  connect(LaptopCharger_4.n1, LaptopCharger_5.n1) annotation(
    Line(points = {{34, 88}, {26, 88}, {26, 42}, {34, 42}}, color = {0, 0, 255}));
  connect(LaptopCharger_4.p1, NextekHub.pin_p) annotation(
    Line(points = {{34, 108}, {18, 108}, {18, 16}, {8, 16}, {8, 16}}, color = {0, 0, 255}));
  connect(LaptopCharger_5.p1, NextekHub.pin_p) annotation(
    Line(points = {{34, 62}, {18, 62}, {18, 16}, {8, 16}, {8, 16}}, color = {0, 0, 255}));
  connect(LaptopCharger_4.p2, Laptop_4.p) annotation(
    Line(points = {{54, 108}, {74, 108}, {74, 108}, {74, 108}}, color = {0, 0, 255}));
  connect(LaptopCharger_4.n2, Laptop_4.n) annotation(
    Line(points = {{54, 88}, {74, 88}, {74, 88}, {74, 88}}, color = {0, 0, 255}));
  connect(Laptop_5.n, ground3.p) annotation(
    Line(points = {{74, 42}, {96, 42}, {96, -4}, {96, -4}}, color = {0, 0, 255}));
  connect(Laptop_4.n, ground3.p) annotation(
    Line(points = {{74, 88}, {96, 88}, {96, -4}, {96, -4}, {96, -4}}, color = {0, 0, 255}));
  connect(LumpedDCLoads.n, ground1.p) annotation(
    Line(points = {{14, -42}, {26, -42}, {26, -54}}, color = {0, 0, 255}));
  connect(LumpedDCLoads.p, NextekHub.pin_p) annotation(
    Line(points = {{14, -22}, {14, 16}, {8, 16}}, color = {0, 0, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-280, -220}, {260, 240}}, initialScale = 0.1), graphics = {Text(lineColor = {28, 108, 200}, extent = {{-256, 64}, {-250, 64}}, textString = "Edit Here"), Text(lineColor = {28, 108, 200}, extent = {{174, -126}, {234, -146}}, textString = "PhD 25V outputs
    "), Text(origin = {-330, 46}, lineColor = {28, 108, 200}, extent = {{174, -126}, {234, -146}}, textString = "PhD 25V outputs
    "), Text(lineColor = {28, 108, 200}, extent = {{88, -28}, {160, -42}}, textString = "Lumping together all DC loads 
(LEDs, resistors ...)", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-280, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_5_Data_Set_5_3;