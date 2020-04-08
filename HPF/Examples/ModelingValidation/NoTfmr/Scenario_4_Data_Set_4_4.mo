within HPF.Examples.ModelingValidation.NoTfmr;
model Scenario_4_Data_Set_4_4
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-172, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {-100, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin = {-200, 50}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA ={-0.01011, 1.0671, -0.47654, 2.9561, 0.12703, -1.5052, 1.0994, 4.6019, 2.2112, 2.8259, -0.22663, 3.5852, -0.50407, 3.8368, 4.2472},vArg_phB ={2.0871, 0.89685, 3.6467, -1.2286, -0.1916, 2.1155, 2.8179, 4.1365, -0.4353, -0.36365, -0.17437, 1.5246, 0.95466, 2.9239, 3.1918},vArg_phC ={4.1839, 1.3206, 0.89767, 0.85685, -0.9196, 2.9788, 3.305, 1.8569, -0.030347, 1.081, 1.3006, 1.0499, 1.1448, 0.77103, 0.52801},vMag_phA ={121.2011, 0.72703, 0.79737, 0.85448, 0.79415, 0.47654, 0.47772, 0.13542, 0.22452, 0.032688, 0.13334, 0.090631, 0.074417, 0.063943, 0.013172},vMag_phB ={121.7039, 0.90945, 0.93785, 1.0522, 0.40883, 0.42519, 0.42854, 0.20359, 0.22707, 0.11263, 0.063306, 0.037802, 0.10751, 0.098964, 0.064338},vMag_phC ={123.5774, 0.82835, 0.68225, 0.39708, 0.55074, 0.33224, 0.19162, 0.30688, 0.099982, 0.035465, 0.046819, 0.14288, 0.094434, 0.047726, 0.086059}) annotation (
    Placement(visible = true, transformation(origin = {-172, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_2(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {182, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {80, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {114, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 72.741145) annotation (
    Placement(visible = true, transformation(origin = {114, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {212, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin = {54, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_3(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {84, -112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_2(pwr = 28.071211) annotation (
    Placement(visible = true, transformation(origin = {212, -34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin = {110, -142}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_1(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {82, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_3(pwr = 27.069063) annotation (
    Placement(visible = true, transformation(origin = {110, -116}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load LED_1(pwr = 27.721808) annotation (
    Placement(visible = true, transformation(origin = {114, 48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin = {114, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_4(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {180, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_5(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {74, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 70.519849) annotation (
    Placement(visible = true, transformation(origin = {214, -82}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin = {214, -108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin = {152, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin = {110, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 71.537540) annotation (
    Placement(visible = true, transformation(origin = {110, -164}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin = {48, -176}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phB annotation (
    Placement(visible = true, transformation(origin = {-82, -62}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phA annotation (
    Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phC annotation (
    Placement(visible = true, transformation(origin = {-64, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phA annotation (
    Placement(visible = true, transformation(origin = {-38, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phB annotation (
    Placement(visible = true, transformation(origin = {-6, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phC annotation (
    Placement(visible = true, transformation(origin = {-40, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance Heater_2_A(z = 37.6781 + 5.0876 * j)  annotation(
    Placement(visible = true, transformation(origin = {78, 84}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance Heater_1_A(z = 77.7638 + 8.8876 * j)  annotation(
    Placement(visible = true, transformation(origin = {78, 114}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance Heater_2_B(z = 38.6384 + 5.2241 * j)  annotation(
    Placement(visible = true, transformation(origin = {186, 8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-172, -22.2}, {-172, -28}}, color = {117, 80, 123}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation(
    Line(points = {{90, -10}, {104, -10}, {104, -18}, {114, -18}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation(
    Line(points = {{114, -24}, {114, -18}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation(
    Line(points = {{90, 2}, {114, 2}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation(
    Line(points = {{70, -10}, {54, -10}, {54, -22}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation(
    Line(points = {{192, -24}, {212, -24}}, color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation(
    Line(points = {{212, -48}, {212, -44}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation(
    Line(points = {{94, -106}, {110, -106}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation(
    Line(points = {{94, -118}, {106, -118}, {106, -122}, {108, -122}, {108, -126}, {110, -126}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation(
    Line(points = {{110, -132}, {110, -126}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation(
    Line(points = {{92, 58}, {114, 58}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation(
    Line(points = {{92, 46}, {105.5, 46}, {105.5, 38}, {114, 38}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation(
    Line(points = {{114, 32}, {114, 38}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation(
    Line(points = {{84, -154}, {110, -154}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation(
    Line(points = {{84, -166}, {100, -166}, {100, -174}, {110, -174}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation(
    Line(points = {{110, -180}, {110, -174}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation(
    Line(points = {{48, -176}, {48, -166}, {64, -166}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation(
    Line(points = {{170, -84}, {169, -84}, {169, -96}, {152, -96}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation(
    Line(points = {{190, -72}, {214, -72}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation(
    Line(points = {{190, -84}, {210, -84}, {210, -88}, {214, -88}, {214, -92}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation(
    Line(points = {{214, -98}, {214, -92}}, color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation(
    Line(points = {{72, 46}, {54, 46}, {54, -22}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation(
    Line(points = {{172, -36}, {152, -36}, {152, -96}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation(
    Line(points = {{74, -118}, {48, -118}, {48, -176}}, color = {117, 80, 123}));
  connect(vMsr_Sec_phA.pin_n, ground2.pin) annotation(
    Line(points = {{-100, -50}, {-100, -102}}, color = {117, 80, 123}));
  connect(vMsr_Sec_phB.pin_n, ground2.pin) annotation(
    Line(points = {{-82, -72}, {-100, -72}, {-100, -102}}, color = {117, 80, 123}));
  connect(vMsr_Sec_phC.pin_n, ground2.pin) annotation(
    Line(points = {{-64, -50}, {-64, -78}, {-100, -78}, {-100, -102}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phA.pin_n, LED_Driver_1.hPin_P) annotation(
    Line(points = {{-28, 2}, {42, 2}, {42, 58}, {72, 58}}, color = {117, 80, 123}));
  connect(Laptop_Charger_3.hPin_P, iMsr_Sec_phA.pin_n) annotation(
    Line(points = {{70, 2}, {-28, 2}}, color = {92, 53, 102}));
  connect(iMsr_Sec_phB.pin_n, LED_Driver_2.hPin_P) annotation(
    Line(points = {{4, -12}, {28, -12}, {28, -44}, {140, -44}, {140, -24}, {172, -24}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.hPin_P, iMsr_Sec_phB.pin_n) annotation(
    Line(points = {{170, -72}, {140, -72}, {140, -44}, {28, -44}, {28, -12}, {4, -12}, {4, -12}}, color = {92, 53, 102}));
  connect(iMsr_Sec_phC.pin_n, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-30, -24}, {4, -24}, {4, -106}, {74, -106}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phC.pin_n, Laptop_Charger_5.hPin_P) annotation(
    Line(points = {{-30, -24}, {4, -24}, {4, -154}, {64, -154}, {64, -154}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, iMsr_Sec_phA.pin_p) annotation(
    Line(points = {{-162, -6}, {-106, -6}, {-106, 2}, {-48, 2}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, iMsr_Sec_phB.pin_p) annotation(
    Line(points = {{-162, -12.2}, {-90, -12.2}, {-90, -12}, {-16, -12}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, iMsr_Sec_phC.pin_p) annotation(
    Line(points = {{-162, -20}, {-74, -20}, {-74, -22}, {-50, -22}, {-50, -24}}, color = {92, 53, 102}));
  connect(vMsr_Sec_phA.pin_p, voltageSource.pinP_phA) annotation(
    Line(points = {{-100, -30}, {-100, -6}, {-162, -6}}, color = {92, 53, 102}));
  connect(vMsr_Sec_phB.pin_p, voltageSource.pinP_phB) annotation(
    Line(points = {{-82, -52}, {-82, -12.2}, {-162, -12.2}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, vMsr_Sec_phC.pin_p) annotation(
    Line(points = {{-162, -20}, {-64, -20}, {-64, -30}}, color = {92, 53, 102}));
  connect(Heater_2_A.pin_n, ground6.pin) annotation(
    Line(points = {{78, 74}, {54, 74}, {54, -22}, {54, -22}}, color = {117, 80, 123}));
  connect(Heater_1_A.pin_n, ground6.pin) annotation(
    Line(points = {{78, 104}, {54, 104}, {54, -22}, {54, -22}}, color = {117, 80, 123}));
  connect(Heater_1_A.pin_p, iMsr_Sec_phA.pin_n) annotation(
    Line(points = {{78, 124}, {42, 124}, {42, 2}, {-28, 2}, {-28, 2}}, color = {92, 53, 102}));
  connect(iMsr_Sec_phA.pin_n, Heater_2_A.pin_p) annotation(
    Line(points = {{-28, 2}, {42, 2}, {42, 94}, {78, 94}, {78, 94}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation(
    Line(points = {{192, -36}, {200, -36}, {200, -44}, {212, -44}, {212, -44}}, color = {0, 0, 255}));
  connect(Heater_2_B.pin_n, ground17.pin) annotation(
    Line(points = {{186, -2}, {152, -2}, {152, -96}}, color = {117, 80, 123}));
  connect(Heater_2_B.pin_p, iMsr_Sec_phB.pin_n) annotation(
    Line(points = {{186, 18}, {140, 18}, {140, -44}, {28, -44}, {28, -12}, {4, -12}}, color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-230, -230}, {230, 230}}, initialScale = 0.1), graphics={Text(origin = {-26, -4}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {310, 152}}, textString = "Scenario 4 | Data Set 4.4c (1300W)
Load Bank 1 (78W), LED 1 (22W), Heater 1 - A (200W), Heater 2 - A (400W)
Load Bank 2 (78W), LED 2 (22W), Heater 2 - B (400W)
Load Bank 2 (78W), LED 2 (22W)
    ", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-230, -230}, {230, 230}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_4_Data_Set_4_4;