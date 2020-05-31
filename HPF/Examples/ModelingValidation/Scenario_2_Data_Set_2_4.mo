within HPF.Examples.ModelingValidation;

model Scenario_2_Data_Set_2_4
  SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-148, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-230, 78}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  Sources.ThreePhase.VotlageSource voltageSource(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation(
    Placement(visible = true, transformation(origin = {-148, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-82, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(Rc = 1.5117e+04, Rp = 8.3300, Rs = 0.1440, Xm = 2.3311e+03, Xp = 3.3175, Xs = 0.6197, fEC = 0.067, fOSL = 0.033, fW = 0.9) annotation(
    Placement(visible = true, transformation(extent = {{-106, -6}, {-86, 14}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_2(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2_3D.mat", nomP = 28) annotation(
    Placement(visible = true, transformation(origin = {164, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_1(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1_3D.mat", nomP = 600) annotation(
    Placement(visible = true, transformation(origin = {60, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat", nomP = 72) annotation(
    Placement(visible = true, transformation(origin = {62, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Load_1(pwr = 580.431282) annotation(
    Placement(visible = true, transformation(origin = {94, 58}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {94, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {96, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr = 72.741145) annotation(
    Placement(visible = true, transformation(origin = {96, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {194, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground6 annotation(
    Placement(visible = true, transformation(origin = {36, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_3(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3_3D.mat", nomP = 28) annotation(
    Placement(visible = true, transformation(origin = {64, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_2(pwr = 28.071211) annotation(
    Placement(visible = true, transformation(origin = {194, 28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation(
    Placement(visible = true, transformation(origin = {90, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_1(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1_3D.mat", nomP = 28) annotation(
    Placement(visible = true, transformation(origin = {62, 106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_3(pwr = 27.069063) annotation(
    Placement(visible = true, transformation(origin = {90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load LED_1(pwr = 27.721808) annotation(
    Placement(visible = true, transformation(origin = {94, 102}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation(
    Placement(visible = true, transformation(origin = {94, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_4(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat", nomP = 72) annotation(
    Placement(visible = true, transformation(origin = {162, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_5(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat", nomP = 72) annotation(
    Placement(visible = true, transformation(origin = {56, -142}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_2(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_2_3D.mat", nomP = 400) annotation(
    Placement(visible = true, transformation(origin = {164, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_3(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_3_3D.mat", nomP = 1e-2) annotation(
    Placement(visible = true, transformation(origin = {60, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Load_2(pwr = 404.776810) annotation(
    Placement(visible = true, transformation(origin = {196, -18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation(
    Placement(visible = true, transformation(origin = {196, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation(
    Placement(visible = true, transformation(origin = {90, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load dC_Load(pwr = 1e-2) annotation(
    Placement(visible = true, transformation(origin = {90, -98}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load dC_Load1(pwr = 70.519849) annotation(
    Placement(visible = true, transformation(origin = {196, -64}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation(
    Placement(visible = true, transformation(origin = {196, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground17 annotation(
    Placement(visible = true, transformation(origin = {134, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation(
    Placement(visible = true, transformation(origin = {92, -172}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load dC_Load2(pwr = 71.537540) annotation(
    Placement(visible = true, transformation(origin = {92, -146}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Ground ground19 annotation(
    Placement(visible = true, transformation(origin = {30, -158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-148, -8.75}, {-148, -18.75}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-86, -8}, {-82, -8}, {-82, -22.75}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation(
    Line(points = {{-135.5, 14}, {-106, 14}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B) annotation(
    Line(points = {{-135.5, 4}, {-106, 4}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation(
    Line(points = {{-135.5, -6}, {-106, -6}}, color = {92, 53, 102}));
  connect(Power_Supply_1.pin_p, Load_1.p) annotation(
    Line(points = {{70, 68}, {94, 68}}, color = {0, 0, 255}));
  connect(ground1.p, Load_1.n) annotation(
    Line(points = {{94, 40}, {94, 48}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation(
    Line(points = {{72, 8}, {86, 8}, {86, 0}, {96, 0}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation(
    Line(points = {{96, -6}, {96, 0}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation(
    Line(points = {{72, 20}, {96, 20}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation(
    Line(points = {{52, 8}, {36, 8}, {36, 7.25}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation(
    Line(points = {{174, 38}, {194, 38}}, color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation(
    Line(points = {{194, 14}, {194, 18}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation(
    Line(points = {{74, -40}, {90, -40}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation(
    Line(points = {{74, -52}, {86, -52}, {86, -56}, {90, -56}, {90, -60}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation(
    Line(points = {{90, -66}, {90, -60}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation(
    Line(points = {{72, 112}, {94, 112}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation(
    Line(points = {{72, 100}, {85.5, 100}, {85.5, 92}, {94, 92}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation(
    Line(points = {{94, 86}, {94, 92}}, color = {0, 0, 255}));
  connect(Load_2.n, Power_Supply_2.pin_n) annotation(
    Line(points = {{196, -28}, {196, -24}, {188, -24}, {188, -20}, {174, -20}}, color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p, Load_2.p) annotation(
    Line(points = {{174, -8}, {196, -8}}, color = {0, 0, 255}));
  connect(Load_2.n, ground12.p) annotation(
    Line(points = {{196, -28}, {196, -34}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p, dC_Load.p) annotation(
    Line(points = {{70, -86}, {80, -86}, {80, -88}, {90, -88}}, color = {0, 0, 255}));
  connect(ground13.p, dC_Load.n) annotation(
    Line(points = {{90, -114}, {90, -108}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation(
    Line(points = {{174, 26}, {192, 26}, {192, 22}, {194, 22}, {194, 18}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation(
    Line(points = {{66, -136}, {92, -136}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation(
    Line(points = {{66, -148}, {82, -148}, {82, -156}, {92, -156}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation(
    Line(points = {{92, -162}, {92, -156}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation(
    Line(points = {{30, -146.75}, {30, -148}, {46, -148}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation(
    Line(points = {{152, -66}, {151, -66}, {151, -66.75}, {134, -66.75}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation(
    Line(points = {{172, -54}, {196, -54}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation(
    Line(points = {{172, -66}, {192, -66}, {192, -70}, {196, -70}, {196, -74}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation(
    Line(points = {{196, -80}, {196, -74}}, color = {0, 0, 255}));
  connect(Power_Supply_1.pin_n, Load_1.n) annotation(
    Line(points = {{70, 56}, {90, 56}, {90, 52}, {94, 52}, {94, 48}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n, dC_Load.n) annotation(
    Line(points = {{70, -98}, {80, -98}, {80, -108}, {90, -108}}, color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation(
    Line(points = {{52, 100}, {36, 100}, {36, 7.25}}, color = {117, 80, 123}));
  connect(Power_Supply_1.hPin_N, ground6.pin) annotation(
    Line(points = {{50, 56}, {36, 56}, {36, 7.25}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation(
    Line(points = {{154, 26}, {134, 26}, {134, -66.75}}, color = {117, 80, 123}));
  connect(Power_Supply_2.hPin_N, ground17.pin) annotation(
    Line(points = {{154, -20}, {134, -20}, {134, -66.75}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation(
    Line(points = {{54, -52}, {30, -52}, {30, -146.75}}, color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_N, ground19.pin) annotation(
    Line(points = {{50, -98}, {30, -98}, {30, -146.75}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, LED_Driver_1.hPin_P) annotation(
    Line(points = {{-86, 16}, {8, 16}, {8, 112}, {52, 112}}, color = {92, 53, 102}));
  connect(Power_Supply_1.hPin_P, LED_Driver_1.hPin_P) annotation(
    Line(points = {{50, 68}, {8, 68}, {8, 112}, {52, 112}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_P, LED_Driver_1.hPin_P) annotation(
    Line(points = {{52, 20}, {8, 20}, {8, 112}, {52, 112}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation(
    Line(points = {{-86, 8}, {0, 8}, {0, -18}, {122, -18}, {122, 38}, {154, 38}}, color = {92, 53, 102}));
  connect(Power_Supply_2.hPin_P, LED_Driver_2.hPin_P) annotation(
    Line(points = {{154, -8}, {122, -8}, {122, 38}, {154, 38}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P, LED_Driver_2.hPin_P) annotation(
    Line(points = {{152, -54}, {122, -54}, {122, 38}, {154, 38}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-86, 0}, {-24, 0}, {-24, -40}, {54, -40}}, color = {92, 53, 102}));
  connect(Power_Supply_3.hPin_P, LED_Driver_3.hPin_P) annotation(
    Line(points = {{50, -86}, {-24, -86}, {-24, -40}, {54, -40}}, color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation(
    Line(points = {{46, -136}, {-24, -136}, {-24, -40}, {54, -40}}, color = {92, 53, 102}));
  annotation(
    Diagram(coordinateSystem(extent = {{-280, -220}, {260, 240}}), graphics = {Text(origin = {-62, -28}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {310, 152}}, textString = "Scenario 2 | Data Set 2.4 (1300W)
Load Bank 1 (78W), LED 1 (22W), Resistor 4 (600W)
Load Bank 2 (78W), LED 2 (22W), Resistor 3 (400W)
Load Bank 2 (78W), LED 2 (22W)
    ", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-280, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_2_Data_Set_2_4;