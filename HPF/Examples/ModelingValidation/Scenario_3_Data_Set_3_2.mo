within HPF.Examples.ModelingValidation;
model Scenario_3_Data_Set_3_2
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
    Placement(visible = true, transformation(origin = {164, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_3(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.44, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-391174-001.mat", nomP = 120, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {62, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {96, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr= 72.666)       annotation (
    Placement(visible = true, transformation(origin = {96, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {194, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin = {36, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_3(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-3of3.mat", nomP = 25.2, nomV = 120, vAngle = 2.094395102393195) annotation (
    Placement(visible = true, transformation(origin={66,-60},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_2(pwr= 28.449)     annotation (
    Placement(visible = true, transformation(origin={196,18},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={90,-90},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_1(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-1of3.mat", nomP = 25.2, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {62, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_3(pwr= 27.616)       annotation (
    Placement(visible = true, transformation(origin={90,-64},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load LED_1(pwr= 27.607)      annotation (
    Placement(visible = true, transformation(origin = {94, 52}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin = {94, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_4(P1(start = 72), P_DCmin = 2, P_stby = 0.33, S1(start = 72), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1900-15C2.mat", nomP = 90, nomV = 120, vAngle = -2.094395102393195) annotation (
    Placement(visible = true, transformation(origin = {162, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_5(P1(start = 72), P_DCmin = 2, P_stby = 0.27, S1(start = 72), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1121-12H.mat", nomP = 120, nomV = 120, vAngle = 2.094395102393195) annotation (
    Placement(visible = true, transformation(origin={60,-104},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr= 70.867)      annotation (
    Placement(visible = true, transformation(origin = {196, -28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin = {196, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin = {134, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={96,-134},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr= 70.388)     annotation (
    Placement(visible = true, transformation(origin={96,-108},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin={36,-136},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation (
    Line(points = {{-148, -8.75}, {-148, -18.75}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points = {{-86, -8}, {-82, -8}, {-82, -22.75}}, color = {117, 80, 123}));
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
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation (
    Line(points = {{52, 8}, {36, 8}, {36, 7.25}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation (
    Line(points={{174,28},{196,28}},      color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation (
    Line(points={{194,4},{194,8},{196,8}},
                                        color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation (
    Line(points={{76,-54},{90,-54}},      color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation (
    Line(points={{76,-66},{80,-66},{80,-74},{90,-74}},          color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation (
    Line(points={{90,-80},{90,-74}},      color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation (
    Line(points = {{72, 62}, {94, 62}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation (
    Line(points = {{72, 50}, {85.5, 50}, {85.5, 42}, {94, 42}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation (
    Line(points = {{94, 36}, {94, 42}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation (
    Line(points={{174,16},{192,16},{192,12},{196,12},{196,8}},            color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation (
    Line(points={{70,-98},{96,-98}},      color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation (
    Line(points={{70,-110},{86,-110},{86,-118},{96,-118}},        color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation (
    Line(points={{96,-124},{96,-118}},      color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation (
    Line(points={{36,-124.75},{36,-110},{50,-110}},     color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation (
    Line(points = {{152, -30}, {151, -30}, {151, -30.75}, {134, -30.75}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation (
    Line(points = {{172, -18}, {196, -18}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation (
    Line(points = {{172, -30}, {192, -30}, {192, -34}, {196, -34}, {196, -38}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation (
    Line(points = {{196, -44}, {196, -38}}, color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation (
    Line(points = {{52, 50}, {36, 50}, {36, 7.25}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation (
    Line(points={{154,16},{134,16},{134,-30.75}},     color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation (
    Line(points={{56,-66},{36,-66},{36,-124.75}},    color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, LED_Driver_1.hPin_P) annotation (
    Line(points = {{-86, 16}, {8, 16}, {8, 62}, {52, 62}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_P, LED_Driver_1.hPin_P) annotation (
    Line(points = {{52, 20}, {8, 20}, {8, 62}, {52, 62}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation (
    Line(points = {{-86, 8}, {0, 8}, {0, -18}, {122, -18}, {122, 28}, {154, 28}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P, LED_Driver_2.hPin_P) annotation (
    Line(points = {{152, -18}, {122, -18}, {122, 28}, {154, 28}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation (
    Line(points={{-86,0},{-24,0},{-24,-54},{56,-54}},          color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points={{50,-98},{-24,-98},{-24,-54},{56,-54}},          color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-280, -220}, {260, 240}}, initialScale = 0.1), graphics={Text(origin = {-54, -14},lineColor = {28, 108, 200}, extent = {{-208, 194}, {340, 132}}, textString = "Data Set 3.2        
Load Phase a-n        Total Load - 100W        Laptop Charger 3 + LED Driver 1        Load Bank 1 (78W), LED 1 (22W)
        Load Phase b-n        Total Load - 100W        Laptop Charger 4 + LED Driver 2        Load Bank 2 (78W), LED 2 (22W)
        Load Phase c-n        Total Load - 100W        Laptop Charger 5 + LED Driver 3        Load Bank 3 (78W), LED 3 (22W)
    ", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-280, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_3_Data_Set_3_2;
