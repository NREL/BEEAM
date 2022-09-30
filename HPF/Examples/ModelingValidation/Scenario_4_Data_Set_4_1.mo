within HPF.Examples.ModelingValidation;

model Scenario_4_Data_Set_4_1
  SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-156, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-154, 76}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation(
    Placement(visible = true, transformation(origin = {-156, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-90, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Transformers.ThreePhase.Symmetric.D1Y deltaWye(Rc = 15117.5, Rp = 8.333, Rs = 1.4404E-01, Xm = 2.3311e+03, Xp = 3.3002, Xs = 0.6197) annotation(
    Placement(visible = true, transformation(extent = {{-114, -6}, {-94, 14}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_2(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-2of3.mat", nomP = 25.2, nomV = 120, vAngle = -2.094395102393195) annotation(
    Placement(visible = true, transformation(origin = {154, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_3(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.44, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-391174-001.mat", nomP = 120, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {54, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {88, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr = 0) annotation(
    Placement(visible = true, transformation(origin = {88, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {182, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground6 annotation(
    Placement(visible = true, transformation(origin = {28, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_3(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-3of3.mat", nomP = 25.2, nomV = 120, vAngle = 2.094395102393195) annotation(
    Placement(visible = true, transformation(origin = {56, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_2(pwr = 0) annotation(
    Placement(visible = true, transformation(origin = {182, -18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation(
    Placement(visible = true, transformation(origin = {82, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_1(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-1of3.mat", nomP = 25.2, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {56, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_3(pwr = 0) annotation(
    Placement(visible = true, transformation(origin = {82, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load LED_1(pwr = 0) annotation(
    Placement(visible = true, transformation(origin = {88, 54}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation(
    Placement(visible = true, transformation(origin = {88, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_4(P1(start = 72), P_DCmin = 2, P_stby = 0.33, S1(start = 72), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1900-15C2.mat", nomP = 90, nomV = 120, vAngle = -2.094395102393195) annotation(
    Placement(visible = true, transformation(origin = {154, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_5(P1(start = 72), P_DCmin = 2, P_stby = 0.27, S1(start = 72), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1121-12H.mat", nomP = 120, nomV = 120, vAngle = 2.094395102393195) annotation(
    Placement(visible = true, transformation(origin = {48, -134}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_4(pwr = 0) annotation(
    Placement(visible = true, transformation(origin = {188, -64}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation(
    Placement(visible = true, transformation(origin = {188, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground17 annotation(
    Placement(visible = true, transformation(origin = {126, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation(
    Placement(visible = true, transformation(origin = {84, -164}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_5(pwr = 0) annotation(
    Placement(visible = true, transformation(origin = {84, -138}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Ground ground19 annotation(
    Placement(visible = true, transformation(origin = {22, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-156, -8.75}, {-156, -20}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-94, -8}, {-90, -8}, {-90, -24}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation(
    Line(points = {{-143.5, 14}, {-114, 14}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B) annotation(
    Line(points = {{-143.5, 4}, {-114, 4}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation(
    Line(points = {{-143.5, -6}, {-114, -6}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation(
    Line(points = {{64, 8}, {78, 8}, {78, 0}, {88, 0}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation(
    Line(points = {{88, -6}, {88, 0}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation(
    Line(points = {{64, 20}, {88, 20}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation(
    Line(points = {{44, 8}, {28, 8}, {28, 6}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation(
    Line(points = {{164, -8}, {182, -8}}, color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation(
    Line(points = {{182, -32}, {182, -28}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation(
    Line(points = {{66, -80}, {82, -80}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation(
    Line(points = {{66, -92}, {78, -92}, {78, -96}, {82, -96}, {82, -100}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation(
    Line(points = {{82, -106}, {82, -100}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation(
    Line(points = {{66, 64}, {88, 64}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation(
    Line(points = {{66, 52}, {79.5, 52}, {79.5, 44}, {88, 44}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation(
    Line(points = {{88, 38}, {88, 44}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation(
    Line(points = {{164, -20}, {168, -20}, {168, -28}, {182, -28}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, Laptop_5.p) annotation(
    Line(points = {{58, -128}, {84, -128}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, Laptop_5.n) annotation(
    Line(points = {{58, -140}, {74, -140}, {74, -148}, {84, -148}}, color = {0, 0, 255}));
  connect(ground18.p, Laptop_5.n) annotation(
    Line(points = {{84, -154}, {84, -148}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation(
    Line(points = {{22, -152}, {22, -140}, {38, -140}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation(
    Line(points = {{144, -66}, {143, -66}, {143, -68}, {126, -68}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, Laptop_4.p) annotation(
    Line(points = {{164, -54}, {188, -54}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, Laptop_4.n) annotation(
    Line(points = {{164, -66}, {184, -66}, {184, -70}, {188, -70}, {188, -74}}, color = {0, 0, 255}));
  connect(ground16.p, Laptop_4.n) annotation(
    Line(points = {{188, -80}, {188, -74}}, color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation(
    Line(points = {{46, 52}, {28, 52}, {28, 6}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation(
    Line(points = {{144, -20}, {126, -20}, {126, -68}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation(
    Line(points = {{46, -92}, {22, -92}, {22, -152}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, LED_Driver_1.hPin_P) annotation(
    Line(points = {{-94, 16}, {2, 16}, {2, 64}, {46, 64}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_P, LED_Driver_1.hPin_P) annotation(
    Line(points = {{44, 20}, {2, 20}, {2, 64}, {46, 64}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation(
    Line(points = {{-94, 8}, {12, 8}, {12, -28}, {114, -28}, {114, -8}, {144, -8}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P, LED_Driver_2.hPin_P) annotation(
    Line(points = {{144, -54}, {132, -54}, {132, -8}, {144, -8}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-94, 0}, {-32, 0}, {-32, -80}, {46, -80}}, color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation(
    Line(points = {{38, -128}, {-32, -128}, {-32, -80}, {46, -80}}, color = {92, 53, 102}));
  annotation(
    Diagram(coordinateSystem(extent = {{-280, -220}, {260, 240}}), graphics = {Text(extent = {{-258, 206}, {114, 162}}, lineColor = {28, 108, 200}, horizontalAlignment = TextAlignment.Left, textString = "Data Set 4.1
	Load Phase a-n	Total Load - 0W	Laptop Charger 3 + LED Driver 1	No Load
	Load Phase b-n	Total Load - 0W	Laptop Charger 4 + LED Driver 2	No Load
	Load Phase c-n	Total Load - 0W	Laptop Charger 5 + LED Driver 3	No Load
    ")}),
    Icon(coordinateSystem(extent = {{-280, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_4_Data_Set_4_1;
