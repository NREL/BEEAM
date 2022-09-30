within HPF.Examples.ModelingValidation;

model Scenario_2_Data_Set_2_1
  SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-230, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-224, 108}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation(
    Placement(visible = true, transformation(origin = {-230, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-144, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Transformers.ThreePhase.Symmetric.D1Y deltaWye(Rc = 15117.5, Rp = 8.333, Rs = 1.4404E-01, Xm = 2.3311e+03, Xp = 3.3002, Xs = 0.6197) annotation(
    Placement(transformation(extent = {{-166, 28}, {-146, 48}})));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_2(P1(start = 1e-2), S1(start = 1e-2), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-2of3.mat", nomP = 25.2, nomV = 120, vAngle(displayUnit = "deg") = -2.094395102393195) annotation(
    Placement(visible = true, transformation(origin = {80, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Power_Supply_1(P1(start = 1e-2), S1(start = 1e-2), P_DCmin = 8, P_stby = 23.34, V_Rect = 48, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-RSP-1000-48.mat", nomP = 1000, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {-24, 122}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_3(P1(start = 1e-2), S1(start = 1e-2), P_DCmin = 2, P_stby = 0.44, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-391174-001.mat", nomP = 120, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {-22, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Load_1(pwr = 1e-2) annotation(
    Placement(visible = true, transformation(origin = {10, 118}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {12, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr = 1e-2) annotation(
    Placement(visible = true, transformation(origin = {12, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {110, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground6 annotation(
    Placement(visible = true, transformation(origin = {-48, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_3(P1(start = 1e-2), S1(start = 1e-2), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-3of3.mat", nomP = 25.2, nomV = 120, vAngle = 2.094395102393195) annotation(
    Placement(visible = true, transformation(origin = {-20, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_2(pwr = 1e-2) annotation(
    Placement(visible = true, transformation(origin = {110, 88}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation(
    Placement(visible = true, transformation(origin = {6, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_1(P1(start = 1e-2), S1(start = 1e-2), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-1of3.mat", nomP = 25.2, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {-22, 166}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_3(pwr = 1e-2) annotation(
    Placement(visible = true, transformation(origin = {6, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load LED_1(pwr = 1e-2) annotation(
    Placement(visible = true, transformation(origin = {10, 162}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation(
    Placement(visible = true, transformation(origin = {10, 136}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_4(P1(start = 1e-2), P_DCmin = 2, P_stby = 0.33, S1(start = 1e-2), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1900-15C2.mat", nomP = 90, nomV = 120, vAngle = -2.094395102393195) annotation(
    Placement(visible = true, transformation(origin = {78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_5(P1(start = 1e-2), P_DCmin = 2, P_stby = 0.27, S1(start = 1e-2), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1121-12H.mat", nomP = 120, nomV = 120, vAngle = 2.094395102393195) annotation(
    Placement(visible = true, transformation(origin = {-28, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Power_Supply_2(P1(start = 1e-2), P_DCmin = 10, P_stby = 4.89, S1(start = 1e-2), V_Rect = 48, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Xunbuma-T-1000-48.mat", nomP = 1000, nomV = 120, vAngle = -2.094395102393195) annotation(
    Placement(visible = true, transformation(origin = {80, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Power_Supply_3(P1(start = 1e-2), P_DCmin = 10, P_stby = 17.7, S1(start = 1e-2), V_Rect = 48, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-SE-1000-48.mat", nomP = 1000, nomV = 120, vAngle = 2.094395102393195) annotation(
    Placement(visible = true, transformation(origin = {-24, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Load_2(pwr = 1e-2) annotation(
    Placement(visible = true, transformation(origin = {112, 42}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation(
    Placement(visible = true, transformation(origin = {112, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation(
    Placement(visible = true, transformation(origin = {6, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load dC_Load(pwr = 1e-2) annotation(
    Placement(visible = true, transformation(origin = {6, -38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load dC_Load1(pwr = 1e-2) annotation(
    Placement(visible = true, transformation(origin = {112, -4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation(
    Placement(visible = true, transformation(origin = {112, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground17 annotation(
    Placement(visible = true, transformation(origin = {50, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation(
    Placement(visible = true, transformation(origin = {8, -112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load dC_Load2(pwr = 1e-2) annotation(
    Placement(visible = true, transformation(origin = {8, -86}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Ground ground19 annotation(
    Placement(visible = true, transformation(origin = {-54, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-230, 25.25}, {-230, 13.25}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-146, 26}, {-144, 26}, {-144, 11.25}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation(
    Line(points = {{-217.5, 48}, {-166, 48}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B) annotation(
    Line(points = {{-217.5, 38}, {-166, 38}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation(
    Line(points = {{-217.5, 28}, {-166, 28}}, color = {92, 53, 102}));
  connect(Power_Supply_1.pin_p, Load_1.p) annotation(
    Line(points = {{-14, 128}, {10, 128}}, color = {0, 0, 255}));
  connect(ground1.p, Load_1.n) annotation(
    Line(points = {{10, 100}, {10, 108}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation(
    Line(points = {{-12, 68}, {2, 68}, {2, 60}, {12, 60}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation(
    Line(points = {{12, 54}, {12, 60}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation(
    Line(points = {{-12, 80}, {12, 80}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation(
    Line(points = {{-32, 68}, {-48, 68}, {-48, 67.25}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation(
    Line(points = {{90, 98}, {110, 98}}, color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation(
    Line(points = {{110, 74}, {110, 78}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation(
    Line(points = {{-10, 20}, {6, 20}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation(
    Line(points = {{-10, 8}, {2, 8}, {2, 4}, {6, 4}, {6, 0}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation(
    Line(points = {{6, -6}, {6, 0}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation(
    Line(points = {{-12, 172}, {10, 172}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation(
    Line(points = {{-12, 160}, {1.5, 160}, {1.5, 152}, {10, 152}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation(
    Line(points = {{10, 146}, {10, 152}}, color = {0, 0, 255}));
  connect(Load_2.n, Power_Supply_2.pin_n) annotation(
    Line(points = {{112, 32}, {112, 36}, {104, 36}, {104, 40}, {90, 40}}, color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p, Load_2.p) annotation(
    Line(points = {{90, 52}, {112, 52}}, color = {0, 0, 255}));
  connect(Load_2.n, ground12.p) annotation(
    Line(points = {{112, 32}, {112, 26}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p, dC_Load.p) annotation(
    Line(points = {{-14, -28}, {6, -28}}, color = {0, 0, 255}));
  connect(ground13.p, dC_Load.n) annotation(
    Line(points = {{6, -54}, {6, -48}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation(
    Line(points = {{90, 86}, {108, 86}, {108, 82}, {110, 82}, {110, 78}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation(
    Line(points = {{-18, -76}, {8, -76}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation(
    Line(points = {{-18, -88}, {-2, -88}, {-2, -96}, {8, -96}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation(
    Line(points = {{8, -102}, {8, -96}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation(
    Line(points = {{-54, -86.75}, {-54, -88}, {-38, -88}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation(
    Line(points = {{68, -6}, {67, -6}, {67, -6.75}, {50, -6.75}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation(
    Line(points = {{88, 6}, {112, 6}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation(
    Line(points = {{88, -6}, {108, -6}, {108, -10}, {112, -10}, {112, -14}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation(
    Line(points = {{112, -20}, {112, -14}}, color = {0, 0, 255}));
  connect(Power_Supply_1.pin_n, Load_1.n) annotation(
    Line(points = {{-14, 116}, {6, 116}, {6, 112}, {10, 112}, {10, 108}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n, dC_Load.n) annotation(
    Line(points = {{-14, -40}, {-4, -40}, {-4, -48}, {6, -48}}, color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation(
    Line(points = {{-32, 160}, {-48, 160}, {-48, 67.25}}, color = {117, 80, 123}));
  connect(Power_Supply_1.hPin_N, ground6.pin) annotation(
    Line(points = {{-34, 116}, {-48, 116}, {-48, 67.25}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation(
    Line(points = {{70, 86}, {50, 86}, {50, -6.75}}, color = {117, 80, 123}));
  connect(Power_Supply_2.hPin_N, ground17.pin) annotation(
    Line(points = {{70, 40}, {50, 40}, {50, -6.75}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation(
    Line(points = {{-30, 8}, {-54, 8}, {-54, -86.75}}, color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_N, ground19.pin) annotation(
    Line(points = {{-34, -40}, {-54, -40}, {-54, -86.75}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation(
    Line(points = {{-146, 42}, {-62, 42}, {-62, 38}, {40, 38}, {40, 98}, {70, 98}}, color = {92, 53, 102}));
  connect(Power_Supply_2.hPin_P, LED_Driver_2.hPin_P) annotation(
    Line(points = {{70, 52}, {40, 52}, {40, 98}, {70, 98}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P, LED_Driver_2.hPin_P) annotation(
    Line(points = {{68, 6}, {40, 6}, {40, 98}, {70, 98}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-146, 34}, {-100, 34}, {-100, 20}, {-30, 20}}, color = {92, 53, 102}));
  connect(Power_Supply_3.hPin_P, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-34, -28}, {-100, -28}, {-100, 20}, {-30, 20}}, color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-38, -76}, {-100, -76}, {-100, 20}, {-30, 20}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_A, LED_Driver_1.hPin_P) annotation(
    Line(points = {{-146, 50}, {-78, 50}, {-78, 172}, {-32, 172}}, color = {92, 53, 102}));
  connect(Power_Supply_1.hPin_P, LED_Driver_1.hPin_P) annotation(
    Line(points = {{-34, 128}, {-78, 128}, {-78, 172}, {-32, 172}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_P, LED_Driver_1.hPin_P) annotation(
    Line(points = {{-32, 80}, {-78, 80}, {-78, 172}, {-32, 172}}, color = {92, 53, 102}));
  annotation(
    Diagram(coordinateSystem(extent = {{-300, -220}, {260, 240}}, initialScale = 0.1), graphics = {Text(origin = {-56, -16}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {146, 164}}, textString = "Scenario 2 | Data Set 2.1
No Load", fontSize = 9, horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-300, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_2_Data_Set_2_1;
