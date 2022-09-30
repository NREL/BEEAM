within HPF.Examples.ModelingValidation;
model Scenario_2_Data_Set_2_3
  SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-86, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin = {-86, 60}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation (
    Placement(visible = true, transformation(origin = {-86, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {-30, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Transformers.ThreePhase.Symmetric.D1Y deltaWye(Rc = 15117.5, Rp = 8.333, Rs = 1.4404E-01, Xm = 2.3311e+03, Xp = 3.3002, Xs = 0.6197) annotation (
    Placement(transformation(extent = {{-56, 4}, {-36, 24}})));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_2(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-2of3.mat", nomP = 25.2, nomV = 120, vAngle = -2.094395102393195) annotation (
    Placement(visible = true, transformation(origin = {144, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Power_Supply_1(P1(start = 200), S1(start = 200), P_DCmin = 8, P_stby = 23.34, V_Rect = 48, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-RSP-1000-48.mat", nomP = 1000, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {42, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_3(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.44, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-391174-001.mat", nomP = 120, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {42, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Load_1(pwr = 231.3) annotation (
    Placement(visible = true, transformation(origin = {74, 48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {90, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {88, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr = 72.66) annotation (
    Placement(visible = true, transformation(origin = {74, 16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {174, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin = {18, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_3(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-3of3.mat", nomP = 25.2, nomV = 120, vAngle = 2.094395102393195) annotation (
    Placement(visible = true, transformation(origin = {40, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_2(pwr = 28.3) annotation (
    Placement(visible = true, transformation(origin = {174, 32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin = {86, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_1(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-1of3.mat", nomP = 25.2, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {42, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_3(pwr = 26.981409) annotation (
    Placement(visible = true, transformation(origin = {74, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load LED_1(pwr = 27.74) annotation (
    Placement(visible = true, transformation(origin = {76, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin = {88, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_4(P1(start = 72), P_DCmin = 2, P_stby = 0.33, S1(start = 72), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1900-15C2.mat", nomP = 90, nomV = 120, vAngle = -2.094395102393195) annotation (
    Placement(visible = true, transformation(origin = {142, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_5(P1(start = 72), P_DCmin = 2, P_stby = 0.27, S1(start = 72), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1121-12H.mat", nomP = 120, nomV = 120, vAngle = 2.094395102393195) annotation (
    Placement(visible = true, transformation(origin = {40, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Power_Supply_2(P1(start = 400), P_DCmin = 10, P_stby = 4.89, S1(start = 400), V_Rect = 48, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Xunbuma-T-1000-48.mat", nomP = 1000, nomV = 120, vAngle = -2.094395102393195) annotation (
    Placement(visible = true, transformation(origin = {144, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Power_Supply_3(P1(start = 600), P_DCmin = 10, P_stby = 17.7, S1(start = 600), V_Rect = 48, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-SE-1000-48.mat", nomP = 1000, nomV = 120, vAngle = 2.094395102393195) annotation (
    Placement(visible = true, transformation(origin = {40, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Load_2(pwr = 404.62) annotation (
    Placement(visible = true, transformation(origin = {176, -14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation (
    Placement(visible = true, transformation(origin = {176, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation (
    Placement(visible = true, transformation(origin = {84, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load dC_Load(pwr = 559.89) annotation (
    Placement(visible = true, transformation(origin = {70, -64}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load dC_Load1(pwr = 70.49) annotation (
    Placement(visible = true, transformation(origin = {176, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin = {176, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin = {116, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin = {86, -118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load dC_Load2(pwr = 71.32) annotation (
    Placement(visible = true, transformation(origin = {70, -98}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin = {12, -118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation (
    Line(points = {{-86, 1.25}, {-86, -10.75}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points = {{-36, 2}, {-30, 2}, {-30, -12.75}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation (
    Line(points = {{-73.5, 24}, {-56, 24}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B) annotation (
    Line(points = {{-73.5, 14}, {-56, 14}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation (
    Line(points = {{-73.5, 4}, {-56, 4}}, color = {92, 53, 102}));
  connect(Power_Supply_1.pin_p, Load_1.p) annotation (
    Line(points = {{52, 58}, {74, 58}}, color = {0, 0, 255}));
  connect(ground1.p, Load_1.n) annotation (
    Line(points = {{90, 38}, {74, 38}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation (
    Line(points = {{52, 14}, {62, 14}, {62, 6}, {74, 6}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation (
    Line(points = {{88, 6}, {74, 6}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation (
    Line(points = {{52, 26}, {74, 26}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation (
    Line(points = {{32, 14}, {18, 14}, {18, 9.25}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation (
    Line(points = {{154, 42}, {174, 42}}, color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation (
    Line(points = {{174, 18}, {174, 22}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation (
    Line(points = {{50, -20}, {74, -20}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation (
    Line(points = {{50, -32}, {58, -32}, {58, -40}, {74, -40}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation (
    Line(points = {{86, -40}, {74, -40}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation (
    Line(points = {{52, 90}, {76, 90}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation (
    Line(points = {{52, 78}, {63.5, 78}, {63.5, 70}, {76, 70}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation (
    Line(points = {{88, 70}, {76, 70}}, color = {0, 0, 255}));
  connect(Load_2.n, Power_Supply_2.pin_n) annotation (
    Line(points = {{176, -24}, {162, -24}, {162, -16}, {154, -16}}, color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p, Load_2.p) annotation (
    Line(points = {{154, -4}, {176, -4}}, color = {0, 0, 255}));
  connect(Load_2.n, ground12.p) annotation (
    Line(points = {{176, -24}, {176, -30}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p, dC_Load.p) annotation (
    Line(points = {{50, -54}, {70, -54}}, color = {0, 0, 255}));
  connect(ground13.p, dC_Load.n) annotation (
    Line(points = {{84, -74}, {70, -74}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation (
    Line(points = {{154, 30}, {162, 30}, {162, 22}, {174, 22}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation (
    Line(points = {{50, -88}, {70, -88}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation (
    Line(points = {{50, -100}, {58, -100}, {58, -108}, {70, -108}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation (
    Line(points = {{86, -108}, {70, -108}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation (
    Line(points = {{12, -106.75}, {12, -100}, {30, -100}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation (
    Line(points = {{132, -62}, {116, -62}, {116, -66.75}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation (
    Line(points = {{152, -50}, {176, -50}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation (
    Line(points = {{152, -62}, {164, -62}, {164, -70}, {176, -70}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation (
    Line(points = {{176, -76}, {176, -70}}, color = {0, 0, 255}));
  connect(Power_Supply_1.pin_n, Load_1.n) annotation (
    Line(points = {{52, 46}, {62, 46}, {62, 38}, {74, 38}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n, dC_Load.n) annotation (
    Line(points = {{50, -66}, {60, -66}, {60, -74}, {70, -74}}, color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation (
    Line(points = {{32, 78}, {18, 78}, {18, 9.25}}, color = {117, 80, 123}));
  connect(Power_Supply_1.hPin_N, ground6.pin) annotation (
    Line(points = {{32, 46}, {18, 46}, {18, 9.25}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation (
    Line(points = {{134, 30}, {116, 30}, {116, -66.75}}, color = {117, 80, 123}));
  connect(Power_Supply_2.hPin_N, ground17.pin) annotation (
    Line(points = {{134, -16}, {116, -16}, {116, -66.75}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation (
    Line(points = {{30, -32}, {12, -32}, {12, -106.75}}, color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_N, ground19.pin) annotation (
    Line(points = {{30, -66}, {12, -66}, {12, -106.75}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, LED_Driver_1.hPin_P) annotation (
    Line(points = {{-36, 26}, {-2, 26}, {-2, 90}, {32, 90}}, color = {92, 53, 102}));
  connect(Power_Supply_1.hPin_P, LED_Driver_1.hPin_P) annotation (
    Line(points = {{32, 58}, {-2, 58}, {-2, 90}, {32, 90}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_P, LED_Driver_1.hPin_P) annotation (
    Line(points = {{32, 26}, {-2, 26}, {-2, 90}, {32, 90}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation (
    Line(points = {{-36, 18}, {-4, 18}, {-4, -10}, {100, -10}, {100, 42}, {134, 42}}, color = {92, 53, 102}));
  connect(Power_Supply_2.hPin_P, LED_Driver_2.hPin_P) annotation (
    Line(points = {{134, -4}, {100, -4}, {100, 42}, {134, 42}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P, LED_Driver_2.hPin_P) annotation (
    Line(points = {{132, -50}, {100, -50}, {100, 42}, {134, 42}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation (
    Line(points = {{-36, 10}, {-18, 10}, {-18, -20}, {30, -20}}, color = {92, 53, 102}));
  connect(Power_Supply_3.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points = {{30, -54}, {-4, -54}, {-4, -20}, {30, -20}}, color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points = {{30, -88}, {-4, -88}, {-4, -20}, {30, -20}}, color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-280, -220}, {260, 240}}, initialScale = 0.1), graphics = {Text(origin = {-28, 0}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {208, 154}}, textString = "Scenario 2 | Data Set 2.3
LLoad Phase a-n        Total Load - 300W                Load Bank 1 (78W), LED 1 (22W), Resistor 2 (200W)
Load Phase b-n        Total Load - 500W                Load Bank 2 (78W), LED 2 (22W), Resistor 3 (400W)
Load Phase c-n        Total Load - 700W                Load Bank 3 (78W), LED 3 (22W), Resistor 4 (600W)", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-280, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_INIT,LOG_RES_INIT,LOG_SIMULATION,LOG_SOTI,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton", iim = "none"),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ");
end Scenario_2_Data_Set_2_3;
