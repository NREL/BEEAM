within HPF.Examples.ModelingValidation.NoTfmr;
model Scenario_4_Data_Set_4_3
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-172, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {-100, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin = {-200, 50}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA ={-0.0022039, 1.1795, -0.52157, 2.9645, 0.12912, 4.6822, 1.0772, 4.4999, 2.1157, 2.9598, -0.039891, 3.8997, -0.14788, 3.6462, -0.53562},vArg_phB ={2.0875, 0.87066, 3.6342, -1.2435, -0.2653, 1.969, 2.7626, 3.9939, -0.60876, -0.44731, -0.26604, 1.4531, 0.90489, 2.745, 3.1276},vArg_phC ={4.1783, 1.0866, 0.83354, 0.72725, -0.95149, 2.9631, 3.4117, 1.6913, -0.34399, 1.9627, 1.1119, 1.1094, 1.2124, 2.0283, 0.80363},vMag_phA ={123.0373, 0.52935, 0.77166, 0.9387, 0.77006, 0.49611, 0.56835, 0.16411, 0.20788, 0.017063, 0.11916, 0.10403, 0.097813, 0.083621, 0.028404},vMag_phB ={121.818, 0.91148, 0.9109, 1.1223, 0.37716, 0.42538, 0.46434, 0.20073, 0.20805, 0.11243, 0.076418, 0.029158, 0.12679, 0.10146, 0.076632},vMag_phC ={120.8195, 1.143, 0.61801, 0.42566, 0.53861, 0.36199, 0.20033, 0.30997, 0.035276, 0.058237, 0.051254, 0.15537, 0.089305, 0.0069946, 0.079971}) annotation (
    Placement(visible = true, transformation(origin = {-172, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_2(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {182, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {80, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {114, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 72.741145) annotation (
    Placement(visible = true, transformation(origin = {114, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {212, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin = {54, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_3(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {82, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_2(pwr = 28.071211) annotation (
    Placement(visible = true, transformation(origin = {212, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin = {108, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_1(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_3(pwr = 27.069063) annotation (
    Placement(visible = true, transformation(origin = {108, -68}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load LED_1(pwr = 27.721808) annotation (
    Placement(visible = true, transformation(origin = {110, 46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_4(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {180, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_5(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {70, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 70.519849) annotation (
    Placement(visible = true, transformation(origin = {214, -82}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin = {214, -108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin = {152, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin = {106, -146}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 71.537540) annotation (
    Placement(visible = true, transformation(origin = {106, -120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin = {44, -214}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  HPF.SinglePhase.Components.Impedance Heater_1_A(z = 77.7638 + 8.8876 * j) annotation(
    Placement(visible = true, transformation(origin = {82, 94}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Impedance Heater_2_B(z = 38.6384 + 5.2241 * j) annotation(
    Placement(visible = true, transformation(origin = {186, 8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance Heater_2_C(z = 36.9287 + 5.0323 * j) annotation(
    Placement(visible = true, transformation(origin = {76, -192}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance Heater_1_C(z = 80.2710 + 9.2309 * j) annotation(
    Placement(visible = true, transformation(origin = {76, -164}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
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
    Line(points = {{192, -20}, {212, -20}}, color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation(
    Line(points = {{212, -44}, {212, -40}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation(
    Line(points = {{92, -58}, {108, -58}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation(
    Line(points = {{92, -70}, {104, -70}, {104, -74}, {108, -74}, {108, -78}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation(
    Line(points = {{108, -84}, {108, -78}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation(
    Line(points = {{90, 56}, {110, 56}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation(
    Line(points = {{90, 44}, {101.5, 44}, {101.5, 36}, {110, 36}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation(
    Line(points = {{110, 30}, {110, 36}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation(
    Line(points = {{192, -32}, {212, -32}, {212, -40}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation(
    Line(points = {{80, -110}, {106, -110}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation(
    Line(points = {{80, -122}, {96, -122}, {96, -130}, {106, -130}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation(
    Line(points = {{106, -136}, {106, -130}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation(
    Line(points = {{44, -214}, {44, -122}, {60, -122}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation(
    Line(points = {{170, -84}, {169, -84}, {169, -96}, {152, -96}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation(
    Line(points = {{190, -72}, {214, -72}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation(
    Line(points = {{190, -84}, {210, -84}, {210, -88}, {214, -88}, {214, -92}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation(
    Line(points = {{214, -98}, {214, -92}}, color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation(
    Line(points = {{70, 44}, {54, 44}, {54, -22}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation(
    Line(points = {{172, -32}, {152, -32}, {152, -96}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation(
    Line(points = {{72, -70}, {44, -70}, {44, -214}}, color = {117, 80, 123}));
  connect(vMsr_Sec_phA.pin_n, ground2.pin) annotation(
    Line(points = {{-100, -50}, {-100, -102}}, color = {117, 80, 123}));
  connect(vMsr_Sec_phB.pin_n, ground2.pin) annotation(
    Line(points = {{-82, -72}, {-100, -72}, {-100, -102}}, color = {117, 80, 123}));
  connect(vMsr_Sec_phC.pin_n, ground2.pin) annotation(
    Line(points = {{-64, -50}, {-64, -78}, {-100, -78}, {-100, -102}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phA.pin_n, LED_Driver_1.hPin_P) annotation(
    Line(points = {{-28, 2}, {40, 2}, {40, 56}, {70, 56}}, color = {117, 80, 123}));
  connect(Laptop_Charger_3.hPin_P, iMsr_Sec_phA.pin_n) annotation(
    Line(points = {{70, 2}, {-28, 2}}, color = {92, 53, 102}));
  connect(iMsr_Sec_phB.pin_n, LED_Driver_2.hPin_P) annotation(
    Line(points = {{4, -12}, {28, -12}, {28, -44}, {140, -44}, {140, -20}, {172, -20}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.hPin_P, iMsr_Sec_phB.pin_n) annotation(
    Line(points = {{170, -72}, {140, -72}, {140, -44}, {28, -44}, {28, -12}, {4, -12}, {4, -12}}, color = {92, 53, 102}));
  connect(iMsr_Sec_phC.pin_n, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-30, -24}, {4, -24}, {4, -58}, {72, -58}, {72, -58}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phC.pin_n, Laptop_Charger_5.hPin_P) annotation(
    Line(points = {{-30, -24}, {4, -24}, {4, -110}, {60, -110}}, color = {117, 80, 123}));
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
  connect(Heater_1_A.pin_n, ground6.pin) annotation(
    Line(points = {{82, 84}, {54, 84}, {54, -22}, {54, -22}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phA.pin_n, Heater_1_A.pin_p) annotation(
    Line(points = {{-28, 2}, {40, 2}, {40, 104}, {82, 104}, {82, 104}}, color = {117, 80, 123}));
  connect(Heater_2_B.pin_p, iMsr_Sec_phB.pin_n) annotation(
    Line(points = {{186, 18}, {140, 18}, {140, -44}, {28, -44}, {28, -12}, {4, -12}}, color = {92, 53, 102}));
  connect(Heater_2_B.pin_n, ground17.pin) annotation(
    Line(points = {{186, -2}, {152, -2}, {152, -96}, {152, -96}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phC.pin_n, Heater_1_C.pin_p) annotation(
    Line(points = {{-30, -24}, {4, -24}, {4, -154}, {76, -154}, {76, -154}}, color = {117, 80, 123}));
  connect(Heater_2_C.pin_n, ground19.pin) annotation(
    Line(points = {{76, -202}, {44, -202}, {44, -214}, {44, -214}}, color = {117, 80, 123}));
  connect(Heater_1_C.pin_n, ground19.pin) annotation(
    Line(points = {{76, -174}, {44, -174}, {44, -214}, {44, -214}}, color = {117, 80, 123}));
  connect(Heater_2_C.pin_p, iMsr_Sec_phC.pin_n) annotation(
    Line(points = {{76, -182}, {4, -182}, {4, -24}, {-30, -24}, {-30, -24}}, color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-230, -230}, {230, 230}}, initialScale = 0.1), graphics={Text(origin = {-26, -4}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {310, 152}}, textString = "Scenario 4 | Data Set 4.3 (1500Wc)
Load Bank 1 (78W), LED 1 (22W), Heater 1 - A (200W)
Load Bank 2 (78W), LED 2 (22W), Heater 2 - B (400W)
Load Bank 3 (78W), LED 3 (22W), Heater 1 - C (200W), Heater 2 - C (400W)
    ", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-230, -230}, {230, 230}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_4_Data_Set_4_3;