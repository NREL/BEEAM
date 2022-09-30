within HPF.Examples.ModelingValidation;

model Scenario_4_Data_Set_4_3
  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_1(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-1of3.mat", nomP = 25.2, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {54, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_1(pwr = 29.288) annotation(
    Placement(visible = true, transformation(origin = {86, 46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation(
    Placement(visible = true, transformation(origin = {-158, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {86, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_3(pwr = 28.440) annotation(
    Placement(visible = true, transformation(origin = {78, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load Laptop_4(pwr = 70.837) annotation(
    Placement(visible = true, transformation(origin = {186, -72}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Loads.SinglePhase.HarmonicPQLoad Heater_1A(P = {193.350}) annotation(
    Placement(visible = true, transformation(origin = {54, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_3(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-3of3.mat", nomP = 25.2, nomV = 120, vAngle = 2.0944) annotation(
    Placement(visible = true, transformation(origin = {54, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_2(pwr = 29.109) annotation(
    Placement(visible = true, transformation(origin = {180, -26}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_4(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.33, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1900-15C2.mat", nomP = 90, nomV = 120, vAngle = -2.0944) annotation(
    Placement(visible = true, transformation(origin = {152, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground17 annotation(
    Placement(visible = true, transformation(origin = {124, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_5(pwr = 65.484) annotation(
    Placement(visible = true, transformation(origin = {82, -146}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation(
    Placement(visible = true, transformation(origin = {82, -172}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr = 70.522) annotation(
    Placement(visible = true, transformation(origin = {86, 2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_2(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-2of3.mat", nomP = 25.2, nomV = 120, vAngle = -2.0944) annotation(
    Placement(visible = true, transformation(origin = {152, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_3(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.44, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-391174-001.mat", nomP = 120, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {52, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {180, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_5(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.27, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1121-12H.mat", nomP = 120, nomV = 120, vAngle = 2.0944) annotation(
    Placement(visible = true, transformation(origin = {46, -142}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-156, 68}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-158, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {26, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation(
    Placement(visible = true, transformation(origin = {86, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Transformers.ThreePhase.Symmetric.D1Y deltaWye(Rc = 15117.5, Rp = 8.333, Rs = 1.4404E-01, Xm = 2.3311e+03, Xp = 3.3002, Xs = 0.6197) annotation(
    Placement(visible = true, transformation(extent = {{-116, -14}, {-96, 6}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation(
    Placement(visible = true, transformation(origin = {80, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Loads.SinglePhase.HarmonicPQLoad Heater_1C(P = {188.951}, vAngle = 2.0944) annotation(
    Placement(visible = true, transformation(origin = {52, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation(
    Placement(visible = true, transformation(origin = {186, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground19 annotation(
    Placement(visible = true, transformation(origin = {20, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Loads.SinglePhase.HarmonicPQLoad Heater_2C(P = {396.256}, vAngle = 2.0944) annotation(
    Placement(visible = true, transformation(origin = {52, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Loads.SinglePhase.HarmonicPQLoad Heater_2B(P = {384.674}, vAngle = -2.0944) annotation(
    Placement(visible = true, transformation(origin = {140, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation(
    Line(points = {{62, 0}, {76, 0}, {76, -8}, {86, -8}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation(
    Line(points = {{86, 30}, {86, 36}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, Laptop_4.n) annotation(
    Line(points = {{162, -74}, {182, -74}, {182, -78}, {186, -78}, {186, -82}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation(
    Line(points = {{64, 44}, {77.5, 44}, {77.5, 36}, {86, 36}}, color = {0, 0, 255}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation(
    Line(points = {{-145.5, -14}, {-116, -14}}, color = {92, 53, 102}));
  connect(ground18.p, Laptop_5.n) annotation(
    Line(points = {{82, -162}, {82, -156}}, color = {0, 0, 255}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-96, -8}, {-34, -8}, {-34, -88}, {44, -88}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B) annotation(
    Line(points = {{-145.5, -4}, {-116, -4}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_N, ground1.pin) annotation(
    Line(points = {{42, 0}, {26, 0}, {26, -18}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation(
    Line(points = {{142, -28}, {124, -28}, {124, -76}}, color = {117, 80, 123}));
  connect(LED_Driver_1.hPin_N, ground1.pin) annotation(
    Line(points = {{44, 44}, {26, 44}, {26, -18}}, color = {117, 80, 123}));
  connect(Laptop_Charger_5.pin_n, Laptop_5.n) annotation(
    Line(points = {{56, -148}, {72, -148}, {72, -156}, {82, -156}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation(
    Line(points = {{20, -160}, {20, -148}, {36, -148}}, color = {92, 53, 102}));
  connect(ground4.p, LED_2.n) annotation(
    Line(points = {{180, -40}, {180, -36}}, color = {0, 0, 255}));
  connect(Heater_1C.hPin_P, deltaWye.pinSec_C) annotation(
    Line(points = {{41, -68}, {-34, -68}, {-34, -8}, {-96, -8}}, color = {92, 53, 102}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation(
    Line(points = {{64, -100}, {76, -100}, {76, -104}, {78, -104}, {78, -110}}, color = {0, 0, 255}));
  connect(ground16.p, Laptop_4.n) annotation(
    Line(points = {{186, -88}, {186, -82}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation(
    Line(points = {{80, -114}, {80, -111}, {78, -111}, {78, -110}}, color = {0, 0, 255}));
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-158, -16.75}, {-158, -28}}, color = {117, 80, 123}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation(
    Line(points = {{36, -136}, {-34, -136}, {-34, -88}, {44, -88}}, color = {92, 53, 102}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation(
    Line(points = {{64, 56}, {86, 56}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation(
    Line(points = {{86, -14}, {86, -8}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_p, Laptop_4.p) annotation(
    Line(points = {{162, -62}, {186, -62}}, color = {0, 0, 255}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation(
    Line(points = {{44, -100}, {20, -100}, {20, -160}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-96, -16}, {-92, -16}, {-92, -32}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation(
    Line(points = {{162, -28}, {166, -28}, {166, -36}, {180, -36}}, color = {0, 0, 255}));
  connect(deltaWye.pinSec_A, LED_Driver_1.hPin_P) annotation(
    Line(points = {{-96, 8}, {0, 8}, {0, 56}, {44, 56}}, color = {92, 53, 102}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation(
    Line(points = {{162, -16}, {180, -16}}, color = {0, 0, 255}));
  connect(Heater_1A.hPin_P, deltaWye.pinSec_A) annotation(
    Line(points = {{43, 72}, {0, 72}, {0, 8}, {-96, 8}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation(
    Line(points = {{62, 12}, {86, 12}}, color = {0, 0, 255}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation(
    Line(points = {{-145.5, 6}, {-116, 6}}, color = {92, 53, 102}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation(
    Line(points = {{64, -88}, {72, -88}, {72, -90}, {78, -90}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.hPin_P, LED_Driver_2.hPin_P) annotation(
    Line(points = {{142, -62}, {130, -62}, {130, -16}, {142, -16}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation(
    Line(points = {{142, -74}, {141, -74}, {141, -76}, {124, -76}}, color = {117, 80, 123}));
  connect(Laptop_Charger_3.hPin_P, LED_Driver_1.hPin_P) annotation(
    Line(points = {{42, 12}, {0, 12}, {0, 56}, {44, 56}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation(
    Line(points = {{-96, 0}, {10, 0}, {10, -36}, {112, -36}, {112, -16}, {142, -16}}, color = {92, 53, 102}));
  connect(Laptop_Charger_5.pin_p, Laptop_5.p) annotation(
    Line(points = {{56, -136}, {82, -136}}, color = {0, 0, 255}));
  connect(Heater_2C.hPin_P, deltaWye.pinSec_C) annotation(
    Line(points = {{42, -48}, {-34, -48}, {-34, -8}, {-96, -8}, {-96, -8}}, color = {92, 53, 102}));
  connect(Heater_2B.hPin_P, LED_Driver_2.hPin_P) annotation(
    Line(points = {{129, 6}, {112, 6}, {112, -16}, {142, -16}}, color = {92, 53, 102}));
  annotation(
    Diagram(coordinateSystem(extent = {{-280, -220}, {260, 240}}, initialScale = 0.1), graphics = {Text( lineColor = {28, 108, 200},extent = {{-258, 182}, {182, 136}}, textString = "Data Set 4.3
	Load Phase a-n	Total Load - 300W	Laptop Charger 3 + LED Driver 1	Load Bank 1 (78W), LED 1 (22W), Heater 1 - A (200W)
	Load Phase b-n	Total Load - 500W	Laptop Charger 4 + LED Driver 2	Load Bank 2 (78W), LED 2 (22W), Heater 2 - B (400W)
	Load Phase c-n	Total Load - 700W	Laptop Charger 5 + LED Driver 3	Load Bank 3 (78W), LED 3 (22W), Heater 1 - C (200W), Heater 2 - C (400W)
    ", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-280, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_INIT,LOG_RES_INIT,LOG_SOTI,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ");
end Scenario_4_Data_Set_4_3;