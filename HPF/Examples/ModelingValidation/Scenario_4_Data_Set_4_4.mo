within HPF.Examples.ModelingValidation;

model Scenario_4_Data_Set_4_4
  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_1(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-1of3.mat", nomP = 25.2, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {40, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_1(pwr = 29.326) annotation(
    Placement(visible = true, transformation(origin = {72, 54}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation(
    Placement(visible = true, transformation(origin = {-172, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {72, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_3(pwr = 28.443) annotation(
    Placement(visible = true, transformation(origin = {64, -92}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load Laptop_4(pwr = 70.813) annotation(
    Placement(visible = true, transformation(origin = {172, -64}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Loads.SinglePhase.HarmonicPQLoad Heater_1A(P = {193.108}) annotation(
    Placement(visible = true, transformation(origin = {40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_3(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-3of3.mat", nomP = 25.2, nomV = 120, vAngle = 2.0944) annotation(
    Placement(visible = true, transformation(origin = {40, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_2(pwr = 29.127) annotation(
    Placement(visible = true, transformation(origin = {166, -18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_4(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.33, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1900-15C2.mat", nomP = 90, nomV = 120, vAngle = -2.0944) annotation(
    Placement(visible = true, transformation(origin = {138, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation(
    Placement(visible = true, transformation(origin = {108, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_5(pwr = 65.801) annotation(
    Placement(visible = true, transformation(origin = {68, -138}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation(
    Placement(visible = true, transformation(origin = {68, -164}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr = 70.481) annotation(
    Placement(visible = true, transformation(origin = {72, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_2(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-2of3.mat", nomP = 25.2, nomV = 120, vAngle = -2.0944) annotation(
    Placement(visible = true, transformation(origin = {138, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-106, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_3(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.44, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-391174-001.mat", nomP = 120, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {38, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {166, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_5(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.27, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1121-12H.mat", nomP = 120, nomV = 120, vAngle = 2.0944) annotation(
    Placement(visible = true, transformation(origin = {32, -134}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-170, 76}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-172, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {12, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation(
    Placement(visible = true, transformation(origin = {72, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Transformers.ThreePhase.Symmetric.D1Y deltaWye(Rc = 15117.5, Rp = 8.333, Rs = 1.4404E-01, Xm = 2.3311e+03, Xp = 3.3002, Xs = 0.6197) annotation(
    Placement(visible = true, transformation(extent = {{-130, -6}, {-110, 14}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation(
    Placement(visible = true, transformation(origin = {66, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation(
    Placement(visible = true, transformation(origin = {172, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground19 annotation(
    Placement(visible = true, transformation(origin = {6, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Loads.SinglePhase.HarmonicPQLoad Heater_2A(P = {384.362}) annotation(
    Placement(visible = true, transformation(origin = {40, 104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Loads.SinglePhase.HarmonicPQLoad Heater_2B(P = {383.618}, vAngle = -2.0944) annotation(
    Placement(visible = true, transformation(origin = {134, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation(
    Line(points = {{48, 8}, {62, 8}, {62, 0}, {72, 0}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation(
    Line(points = {{72, 38}, {72, 44}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, Laptop_4.n) annotation(
    Line(points = {{148, -66}, {168, -66}, {168, -70}, {172, -70}, {172, -74}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation(
    Line(points = {{50, 52}, {63.5, 52}, {63.5, 44}, {72, 44}}, color = {0, 0, 255}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation(
    Line(points = {{-159.5, -6}, {-130, -6}}, color = {92, 53, 102}));
  connect(ground18.p, Laptop_5.n) annotation(
    Line(points = {{68, -154}, {68, -148}}, color = {0, 0, 255}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-110, 0}, {-48, 0}, {-48, -80}, {30, -80}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B) annotation(
    Line(points = {{-159.5, 4}, {-130, 4}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_N, ground1.pin) annotation(
    Line(points = {{28, 8}, {12, 8}, {12, -4}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation(
    Line(points = {{128, -20}, {108, -20}, {108, -66}}, color = {117, 80, 123}));
  connect(LED_Driver_1.hPin_N, ground1.pin) annotation(
    Line(points = {{30, 52}, {12, 52}, {12, -4}}, color = {117, 80, 123}));
  connect(Laptop_Charger_5.pin_n, Laptop_5.n) annotation(
    Line(points = {{42, -140}, {58, -140}, {58, -148}, {68, -148}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation(
    Line(points = {{6, -152}, {6, -140}, {22, -140}}, color = {92, 53, 102}));
  connect(ground4.p, LED_2.n) annotation(
    Line(points = {{166, -32}, {166, -28}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation(
    Line(points = {{50, -92}, {62, -92}, {62, -96}, {64, -96}, {64, -102}}, color = {0, 0, 255}));
  connect(ground16.p, Laptop_4.n) annotation(
    Line(points = {{172, -80}, {172, -74}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation(
    Line(points = {{66, -106}, {66, -103}, {64, -103}, {64, -102}}, color = {0, 0, 255}));
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-172, -8.75}, {-172, -20}}, color = {117, 80, 123}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation(
    Line(points = {{22, -128}, {-48, -128}, {-48, -80}, {30, -80}}, color = {92, 53, 102}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation(
    Line(points = {{50, 64}, {72, 64}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation(
    Line(points = {{72, -6}, {72, 0}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_p, Laptop_4.p) annotation(
    Line(points = {{148, -54}, {172, -54}}, color = {0, 0, 255}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation(
    Line(points = {{30, -92}, {6, -92}, {6, -152}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-110, -8}, {-106, -8}, {-106, -24}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation(
    Line(points = {{148, -20}, {152, -20}, {152, -28}, {166, -28}}, color = {0, 0, 255}));
  connect(deltaWye.pinSec_A, LED_Driver_1.hPin_P) annotation(
    Line(points = {{-110, 16}, {-14, 16}, {-14, 64}, {30, 64}}, color = {92, 53, 102}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation(
    Line(points = {{148, -8}, {166, -8}}, color = {0, 0, 255}));
  connect(Heater_1A.hPin_P, deltaWye.pinSec_A) annotation(
    Line(points = {{29, 80}, {-14, 80}, {-14, 16}, {-110, 16}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation(
    Line(points = {{48, 20}, {72, 20}}, color = {0, 0, 255}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation(
    Line(points = {{-159.5, 14}, {-130, 14}}, color = {92, 53, 102}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation(
    Line(points = {{50, -80}, {58, -80}, {58, -82}, {64, -82}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.hPin_P, LED_Driver_2.hPin_P) annotation(
    Line(points = {{128, -54}, {116, -54}, {116, -8}, {128, -8}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation(
    Line(points = {{128, -66}, {108, -66}}, color = {117, 80, 123}));
  connect(Laptop_Charger_3.hPin_P, LED_Driver_1.hPin_P) annotation(
    Line(points = {{28, 20}, {-14, 20}, {-14, 64}, {30, 64}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation(
    Line(points = {{-110, 8}, {-4, 8}, {-4, -28}, {98, -28}, {98, -8}, {128, -8}}, color = {92, 53, 102}));
  connect(Laptop_Charger_5.pin_p, Laptop_5.p) annotation(
    Line(points = {{42, -128}, {68, -128}}, color = {0, 0, 255}));
  connect(Heater_2A.hPin_P, deltaWye.pinSec_A) annotation(
    Line(points = {{30, 104}, {-14, 104}, {-14, 16}, {-110, 16}, {-110, 16}}, color = {92, 53, 102}));
  connect(Heater_2B.hPin_P, deltaWye.pinSec_B) annotation(
    Line(points = {{123, 14}, {98, 14}, {98, -28}, {-4, -28}, {-4, 8}, {-110, 8}}, color = {92, 53, 102}));
  annotation(
    Diagram(coordinateSystem(extent = {{-280, -220}, {260, 240}}, initialScale = 0.1), graphics = {Text(lineColor = {28, 108, 200}, extent = {{-256, 64}, {-250, 64}}, textString = "Edit Here"), Text(lineColor = {28, 108, 200}, extent = {{-234, 200}, {150, 150}}, textString = "Data Set 4.4
	Load Phase a-n	Total Load - 700W	Laptop Charger 3 + LED Driver 1	Load Bank 1 (78W), LED 1 (22W), Heater 1 - A (200W), Heater 2 - A (400W)
	Load Phase b-n	Total Load - 500W	Laptop Charger 4 + LED Driver 2	Load Bank 2 (78W), LED 2 (22W), Heater 2 - B (400W)
	Load Phase c-n	Total Load - 100W	Laptop Charger 5 + LED Driver 3	Load Bank 2 (78W), LED 2 (22W)
    ", horizontalAlignment = TextAlignment.Left), Text(origin = {173, 33}, extent = {{-11, 5}, {11, -5}}, textString = "{383.618}")}),
    Icon(coordinateSystem(extent = {{-280, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_4_Data_Set_4_4;