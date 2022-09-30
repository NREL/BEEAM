within HPF.Examples.ModelingValidation;
model Scenario_3_Data_Set_3_3
  SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-148, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin = {-146, 76}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation (
    Placement(visible = true, transformation(origin = {-148, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {-82, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.Symmetric.D1Y deltaWye(Rc = 15117.5, Rp = 8.333, Rs = 1.4404E-01, Xm = 2.3311e+03, Xp = 3.3002, Xs = 0.6197) annotation (
    Placement(visible = true, transformation(extent = {{-106, -6}, {-86, 14}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_2(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-2of3.mat", nomP = 25.2, nomV = 120, vAngle = -2.094395102393195) annotation (
    Placement(visible = true, transformation(origin={162,-14},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_3(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.44, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-391174-001.mat", nomP = 120, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {62, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {96, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr = 70.683) annotation (
    Placement(visible = true, transformation(origin = {96, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={190,-42},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_3(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-3of3.mat", nomP = 25.2, nomV = 120, vAngle = 2.094395102393195) annotation (
    Placement(visible = true, transformation(origin={64,-86},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_2(pwr = 28.920) annotation (
    Placement(visible = true, transformation(origin={190,-18},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={90,-116},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_1(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-1of3.mat", nomP = 25.2, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={64,58},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_3(pwr = 28.088) annotation (
    Placement(visible = true, transformation(origin={88, -92},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load LED_1(pwr = 28.910) annotation (
    Placement(visible = true, transformation(origin={96,54},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin={96,28},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_4(P1(start = 72), P_DCmin = 2, P_stby = 0.33, S1(start = 72), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1900-15C2.mat", nomP = 90, nomV = 120, vAngle = -2.094395102393195) annotation (
    Placement(visible = true, transformation(origin = {162, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_5(P1(start = 72), P_DCmin = 2, P_stby = 0.27, S1(start = 72), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1121-12H.mat", nomP = 120, nomV = 120, vAngle = 2.094395102393195) annotation (
    Placement(visible = true, transformation(origin={56,-134},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_4(pwr = 70.573) annotation (
    Placement(visible = true, transformation(origin = {196, -64}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin = {196, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin = {134, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={92,-164},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_5(pwr= 67.297) annotation (Placement(visible=true,
        transformation(
        origin={92,-138},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin={30,-162},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {36, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Loads.SinglePhase.HarmonicPQLoad Heater_1A(P = {193.105}, Q = {0}) annotation (
    Placement(visible = true, transformation(origin = {64, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Loads.SinglePhase.HarmonicPQLoad Heater_1B(P = {179.958}, vAngle = -2.0944) annotation (
    Placement(visible = true, transformation(origin = {156, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Loads.SinglePhase.HarmonicPQLoad Heater_1C(P = {185.573}, vAngle = 2.0944) annotation (
    Placement(visible = true, transformation(origin = {62, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation (
    Line(points={{-148,-8.75},{-148,-20}},         color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points={{-86,-8},{-82,-8},{-82,-24}},           color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation (
    Line(points = {{-135.5, 14}, {-106, 14}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B) annotation (
    Line(points = {{-135.5, 4}, {-106, 4}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation (
    Line(points = {{-135.5, -6}, {-106, -6}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation (
    Line(points = {{72, 8}, {86, 8}, {86, 0}, {96, 0}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation (
    Line(points = {{96, -6}, {96, 0}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation (
    Line(points = {{72, 20}, {96, 20}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation (
    Line(points = {{172, -8}, {190, -8}}, color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation (
    Line(points = {{190, -32}, {190, -28}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation (
    Line(points = {{74, -80}, {82, -80}, {82, -82}, {88, -82}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation (
    Line(points = {{74, -92}, {86, -92}, {86, -96}, {88, -96}, {88, -102}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation (
    Line(points = {{90, -106}, {90, -103}, {88, -103}, {88, -102}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation (
    Line(points = {{74, 64}, {96, 64}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation (
    Line(points = {{74, 52}, {87.5, 52}, {87.5, 44}, {96, 44}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation (
    Line(points = {{96, 38}, {96, 44}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation (
    Line(points = {{172, -20}, {176, -20}, {176, -28}, {190, -28}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, Laptop_5.p) annotation (
    Line(points = {{66, -128}, {92, -128}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, Laptop_5.n) annotation (
    Line(points = {{66, -140}, {82, -140}, {82, -148}, {92, -148}}, color = {0, 0, 255}));
  connect(ground18.p, Laptop_5.n) annotation (
    Line(points = {{92, -154}, {92, -148}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation (
    Line(points={{30,-152},{30,-140},{46,-140}},           color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation (
    Line(points={{152,-66},{151,-66},{151,-68},{134,-68}},                color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, Laptop_4.p) annotation (
    Line(points = {{172, -54}, {196, -54}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, Laptop_4.n) annotation (
    Line(points = {{172, -66}, {192, -66}, {192, -70}, {196, -70}, {196, -74}}, color = {0, 0, 255}));
  connect(ground16.p, Laptop_4.n) annotation (
    Line(points = {{196, -80}, {196, -74}}, color = {0, 0, 255}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation (
    Line(points={{152,-20},{134,-20},{134,-68}},           color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation (
    Line(points={{54,-92},{30,-92},{30,-152}},           color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, LED_Driver_1.hPin_P) annotation (
    Line(points = {{-86, 16}, {10, 16}, {10, 64}, {54, 64}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_P, LED_Driver_1.hPin_P) annotation (
    Line(points = {{52, 20}, {10, 20}, {10, 64}, {54, 64}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation (
    Line(points = {{-86, 8}, {20, 8}, {20, -28}, {122, -28}, {122, -8}, {152, -8}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P, LED_Driver_2.hPin_P) annotation (
    Line(points = {{152, -54}, {140, -54}, {140, -8}, {152, -8}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation (
    Line(points = {{-86, 0}, {-24, 0}, {-24, -80}, {54, -80}}, color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points = {{46, -128}, {-24, -128}, {-24, -80}, {54, -80}}, color = {92, 53, 102}));
  connect(LED_Driver_1.hPin_N, ground1.pin) annotation (
    Line(points = {{54, 52}, {36, 52}, {36, -10}, {36, -10}}, color = {117, 80, 123}));
  connect(Laptop_Charger_3.hPin_N, ground1.pin) annotation (
    Line(points = {{52, 8}, {36, 8}, {36, -10}, {36, -10}}, color = {117, 80, 123}));
  connect(Heater_1A.hPin_P, deltaWye.pinSec_A) annotation (
    Line(points = {{53, 86}, {10, 86}, {10, 16}, {-86, 16}}, color = {92, 53, 102}));
  connect(Heater_1C.hPin_P, deltaWye.pinSec_C) annotation (
    Line(points={{51,-60},{-24,-60},{-24,-2},{-24,-2},{-24,0},{-86,0},{-86,0}},                color = {92, 53, 102}));
  connect(Heater_1B.hPin_P, deltaWye.pinSec_B) annotation(
    Line(points = {{146, 14}, {122, 14}, {122, -28}, {20, -28}, {20, 8}, {-86, 8}, {-86, 8}}, color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-280, -220}, {260, 240}}, initialScale = 0.1), graphics={Text(lineColor = {28, 108, 200}, extent = {{-256, 182}, {366, 100}}, textString = "Data Set 3.3
Load Phase a-n        Total Load - 300W        Laptop Charger 3 + LED Driver 1        Load Bank (78W), LED (22W), Heater 1 - A (200W)
        Load Phase b-n        Total Load - 300W        Laptop Charger 4 + LED Driver 2        Load Bank (78W), LED (22W), Heater 1 - B (200W)
        Load Phase c-n        Total Load - 300W        Laptop Charger 5 + LED Driver 3        Load Bank (78W), LED (22W), Heater 1 - C (200W)
    ", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-280, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ");
end Scenario_3_Data_Set_3_3;
