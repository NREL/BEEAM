within HPF.Examples.ModelingValidation;
model Scenario_2
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin={-184, -18},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(Rc = 3.5366e3, Rp = 2.7672, Rs = 0.2576,VPrimRated = 480, VSecRated = 208, Xm = 711.1091, Xp = 1.1006, Xs = 0.5003,fEC = 0.067, fOSL = 0.033, fW = 0.9) annotation (
    Placement(visible = true, transformation(origin={-38, -4},    extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-32, -22},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin={-176, 60},    extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA = {3.7931e-05, -1.3747, 2.3203, 4.4576, 0.33338, 0.061743, 1.8595, 2.0775, 2.596, 0.078826, -0.12461, -0.070035, 0.23351, 0.39809, 0.76912}, vArg_phB = {4.1877, 2.2326, -0.46785, 2.271, -0.085554, 2.3883, -0.27274, 1.8949, -1.5378, 3.7162, 2.658, 1.5528, 3.3069, 3.8177, 3.2929}, vArg_phC = {2.0944, 0.039264, 3.081, -0.070956, 3.2809, 4.2851, 3.8663, -1.1772, 0.51965, 1.8601, 3.3803, 3.4573, 3.6469, 3.2203, 4.652}, vMag_phA = {486.6785, 1.036, 0.35126, 1.5367, 0.3716, 1.144, 0.27467, 0.01309, 0.35543, 0.12006, 0.028935, 0.042556, 0.02346, 0.023496, 0.052121}, vMag_phB = {486.4142, 1.2575, 0.61231, 2.106, 0.32711, 1.0656, 0.29567, 0.03861, 0.35203, 0.12269, 0.015397, 0.016859, 0.014564, 0.010917, 0.036942}, vMag_phC = {486.0805, 0.58812, 0.30739, 1.7486, 0.68217, 0.87821, 0.27744, 0.051501, 0.33709, 0.05818, 0.015414, 0.046161, 0.007833, 0.012964, 0.029759}) annotation (
    Placement(visible = true, transformation(origin={-184, 0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_2(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2.mat") annotation (
    Placement(visible = true, transformation(origin={152, 14},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_1(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1.mat") annotation (
    Placement(visible = true, transformation(origin={48, 44},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3.mat") annotation (
    Placement(visible = true, transformation(origin={50, -4},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_1(pwr = 200) annotation (
    Placement(visible = true, transformation(origin={82,40},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={82, 12},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={84, -34},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 78) annotation (
    Placement(visible = true, transformation(origin={84, -8},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={182, -14},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin={24, -22},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhA annotation (
    Placement(visible = true, transformation(origin={-100, 10},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_3(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3.mat") annotation (
    Placement(visible = true, transformation(origin={52, -64},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_2(pwr = 22) annotation (
    Placement(visible = true, transformation(origin={182, 10},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={78, -94},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_1(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1.mat") annotation (
    Placement(visible = true, transformation(origin = {50, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_3(pwr = 22) annotation (
    Placement(visible = true, transformation(origin={78, -68},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load LED_1(pwr = 22) annotation (
    Placement(visible = true, transformation(origin = {82, 84}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin = {82, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_4(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4.mat") annotation (
    Placement(visible = true, transformation(origin={150, -78},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_5(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5.mat") annotation (
    Placement(visible = true, transformation(origin={44, -160},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_2(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_2.mat") annotation (
    Placement(visible = true, transformation(origin={152, -32},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_3(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_3.mat") annotation (
    Placement(visible = true, transformation(origin={48, -112},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_2(pwr = 400) annotation (
    Placement(visible = true, transformation(origin={184, -36},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation (
    Placement(visible = true, transformation(origin={184, -62},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation (
    Placement(visible = true, transformation(origin={78, -142},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 600) annotation (
    Placement(visible = true, transformation(origin={78, -116},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load dC_Load1(pwr = 78) annotation (
    Placement(visible = true, transformation(origin={184, -82},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={184, -108},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin={122, -96},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={80, -190},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 78) annotation (
    Placement(visible = true, transformation(origin={80, -164},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin={18, -176},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhB annotation (
    Placement(visible = true, transformation(origin = {-72, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhC annotation (
    Placement(visible = true, transformation(origin = {-94, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsr_AB annotation (
    Placement(visible = true, transformation(origin = {-148, -28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_BC annotation (
    Placement(visible = true, transformation(origin = {-130, -38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_CA annotation (
    Placement(visible = true, transformation(origin = {-114, -58}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(voltageSource.pinN, ground.pin) annotation (
    Line(points = {{-184, -10}, {-184, -18}}, color = {117, 80, 123}));
  connect(Power_Supply_1.pin_p, Load_1.p) annotation (
    Line(points = {{58, 50}, {82, 50}}, color = {0, 0, 255}));
  connect(ground1.p, Load_1.n) annotation (
    Line(points = {{82, 22}, {82, 30}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation (
    Line(points = {{60, -10}, {74, -10}, {74, -18}, {84, -18}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation (
    Line(points = {{84, -24}, {84, -18}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation (
    Line(points = {{60, 2}, {84, 2}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation (
    Line(points = {{40, -10}, {24, -10}, {24, -22}}, color = {117, 80, 123}));
  connect(iMsr_prim_PhA.pin_n, deltaWye.pinPrim_A) annotation(
    Line(points = {{-90, 10}, {-73, 10}, {-73, 12}, {-54, 12}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation (
    Line(points = {{162, 20}, {182, 20}}, color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation (
    Line(points = {{182, -4}, {182, 0}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation (
    Line(points = {{62, -58}, {78, -58}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation (
    Line(points = {{62, -70}, {74, -70}, {74, -74}, {78, -74}, {78, -78}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation (
    Line(points = {{78, -84}, {78, -78}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation (
    Line(points = {{60, 94}, {82, 94}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation (
    Line(points = {{60, 82}, {73.5, 82}, {73.5, 74}, {82, 74}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation (
    Line(points = {{82, 68}, {82, 74}}, color = {0, 0, 255}));
  connect(Load_2.n, Power_Supply_2.pin_n) annotation (
    Line(points = {{184, -46}, {184, -42}, {176, -42}, {176, -38}, {162, -38}}, color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p, Load_2.p) annotation (
    Line(points = {{162, -26}, {184, -26}}, color = {0, 0, 255}));
  connect(Load_2.n, ground12.p) annotation (
    Line(points = {{184, -46}, {184, -52}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p, dC_Load.p) annotation (
    Line(points = {{58, -106}, {78, -106}}, color = {0, 0, 255}));
  connect(ground13.p, dC_Load.n) annotation (
    Line(points = {{78, -132}, {78, -126}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation (
    Line(points = {{162, 8}, {180, 8}, {180, 4}, {182, 4}, {182, 0}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation (
    Line(points = {{54, -154}, {80, -154}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation (
    Line(points = {{54, -166}, {70, -166}, {70, -174}, {80, -174}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation (
    Line(points = {{80, -180}, {80, -174}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation (
    Line(points = {{18, -176}, {18, -166}, {34, -166}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation (
    Line(points = {{140, -84}, {139, -84}, {139, -96}, {122, -96}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation (
    Line(points = {{160, -72}, {184, -72}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation (
    Line(points = {{160, -84}, {180, -84}, {180, -88}, {184, -88}, {184, -92}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation (
    Line(points = {{184, -98}, {184, -92}}, color = {0, 0, 255}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-21, -23}, {-32, -23}, {-32, -22}}, color = {117, 80, 123}));
  connect(Power_Supply_1.pin_n, Load_1.n) annotation (
    Line(points = {{58, 38}, {78, 38}, {78, 30}, {82, 30}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n, dC_Load.n) annotation (
    Line(points = {{58, -118}, {68, -118}, {68, -126}, {78, -126}}, color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_P, deltaWye.pinSec_A) annotation(
    Line(points = {{40, 94}, {0, 94}, {0, 15}, {-21, 15}}, color = {92, 53, 102}));
  connect(Power_Supply_1.hPin_P, deltaWye.pinSec_A) annotation(
    Line(points = {{38, 50}, {0, 50}, {0, 15}, {-21, 15}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_P, deltaWye.pinSec_A) annotation(
    Line(points = {{40, 2}, {0, 2}, {0, 15}, {-21, 15}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation(
    Line(points = {{-21, 2}, {-10, 2}, {-10, -46}, {102, -46}, {102, 20}, {142, 20}}, color = {92, 53, 102}));
  connect(iMsr_prim_PhC.pin_n, deltaWye.pinPrim_C) annotation(
    Line(points = {{-84, -10}, {-70, -10}, {-70, -20}, {-54, -20}}, color = {117, 80, 123}));
  connect(iMsr_prim_PhB.pin_n, deltaWye.pinPrim_B) annotation(
    Line(points = {{-62, 0}, {-61, 0}, {-61, -4}, {-54, -4}}, color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points = {{38, -106}, {-20, -106}, {-20, -58}, {42, -58}}, color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points = {{34, -154}, {-20, -154}, {-20, -58}, {42, -58}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-21, -10}, {-20, -10}, {-20, -58}, {42, -58}}, color = {92, 53, 102}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation (
    Line(points = {{40, 82}, {24, 82}, {24, -22}}, color = {117, 80, 123}));
  connect(Power_Supply_1.hPin_N, ground6.pin) annotation (
    Line(points = {{38, 38}, {24, 38}, {24, -22}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation (
    Line(points = {{142, 8}, {122, 8}, {122, -96}}, color = {117, 80, 123}));
  connect(Power_Supply_2.hPin_N, ground17.pin) annotation (
    Line(points = {{142, -38}, {122, -38}, {122, -96}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation (
    Line(points = {{42, -70}, {18, -70}, {18, -176}}, color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_N, ground19.pin) annotation (
    Line(points = {{38, -118}, {18, -118}, {18, -176}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phB, iMsr_prim_PhB.pin_p) annotation (
    Line(points = {{-174, 0}, {-82, 0}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, iMsr_prim_PhA.pin_p) annotation (
    Line(points = {{-174, 6}, {-150, 6}, {-150, 10}, {-110, 10}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, iMsr_prim_PhC.pin_p) annotation (
    Line(points = {{-174, -8}, {-114, -8}, {-114, -10}, {-104, -10}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, vMsr_AB.pin_p) annotation (
    Line(points = {{-174, 6}, {-148, 6}, {-148, -18}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, vMsr_AB.pin_n) annotation (
    Line(points = {{-174, 0}, {-162, 0}, {-162, -38}, {-148, -38}}, color = {92, 53, 102}));
  connect(vMsr_BC.pin_p, voltageSource.pinP_phB) annotation (
    Line(points = {{-130, -28}, {-130, 0}, {-174, 0}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, vMsr_BC.pin_n) annotation (
    Line(points = {{-174, -8}, {-166, -8}, {-166, -48}, {-130, -48}}, color = {92, 53, 102}));
  connect(vMsr_CA.pin_p, voltageSource.pinP_phC) annotation (
    Line(points = {{-114, -48}, {-114, -8}, {-174, -8}}, color = {92, 53, 102}));
  connect(vMsr_CA.pin_n, voltageSource.pinP_phA) annotation (
    Line(points = {{-114, -68}, {-114, -72}, {-170, -72}, {-170, 6}, {-174, 6}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_B, Power_Supply_2.hPin_P) annotation(
    Line(points = {{-21, 2}, {-10, 2}, {-10, -46}, {102, -46}, {102, -26}, {142, -26}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P, deltaWye.pinSec_B) annotation(
    Line(points = {{140, -72}, {102, -72}, {102, -46}, {-10, -46}, {-10, 2}, {-21, 2}}, color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, initialScale = 0.1), graphics={Text(origin = {-10, -52}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {146, 164}}, textString = "Scenario 2 | Data Set 2.3
Load Phase a-n	Total Load - 300W      Load Bank 1 (78W), LED 1 (22W), Resistor 2 (200W)
Load Phase b-n	Total Load - 500W      Load Bank 2 (78W), LED 2 (22W), Resistor 3 (400W)
Load Phase c-n	Total Load - 700W      Load Bank 3 (78W), LED 3 (22W), Resistor 4 (600W)", fontSize = 9, horizontalAlignment = TextAlignment.Left), Text(origin = {102, -136}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {-98, 164}}, textString = "Changed Rs 2.7672 -> 1.1", fontSize = 9, horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_2;