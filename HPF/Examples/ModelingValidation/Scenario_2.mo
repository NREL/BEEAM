within HPF.Examples.ModelingValidation;

model Scenario_2
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-120, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(fEC = 0.1, fOSL = 0.1, fW = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-16, 36}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-6, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-96, 86}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource votlageSource(vArg_phA = {0.52192, 6.1952, 3.641, 8.2279, 4.6037, 6.1521, 9.054, 11.1771, 11.547, 9.5299}, vArg_phB = {4.7065, 3.5627, 4.2216, 5.9383, 4.7501, 8.371, 6.837, 8.9513, 7.4465, 13.0091}, vArg_phC = {2.6138, 1.127, 6.9575, 3.4123, 7.8346, 10.4191, 11.1108, 6.5894, 9.3993, 10.5656}, vMag_phA = {282.8166, 0.45117, 0.39336, 0.76549, 0.19582, 0.74027, 0.44753, 0.031767, 0.56648, 0.11503}, vMag_phB = {282.9682, 0.65765, 0.17303, 1.3199, 0.3038, 0.75239, 0.43691, 0.046575, 0.5116, 0.15362}, vMag_phC = {281.8661, 0.35229, 0.54619, 0.99899, 0.49719, 0.66452, 0.39451, 0.037451, 0.50007, 0.058614}) annotation(
    Placement(visible = true, transformation(origin = {-120, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.Voltmeter_Freq2Time voltmeter_Freq2Time annotation(
    Placement(visible = true, transformation(origin = {-84, 8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.Voltmeter_Freq2Time voltmeter_Freq2Time1 annotation(
    Placement(visible = true, transformation(origin = {-56, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.Voltmeter_Freq2Time voltmeter_Freq2Time2 annotation(
    Placement(visible = true, transformation(origin = {-36, -2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_1(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1.mat") annotation(
    Placement(visible = true, transformation(origin = {82, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_1(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1.mat") annotation(
    Placement(visible = true, transformation(origin = {98, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3.mat") annotation(
    Placement(visible = true, transformation(origin = {102, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_1(pwr = 150) annotation(
    Placement(visible = true, transformation(origin = {128, -18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {128, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {132, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 50) annotation(
    Placement(visible = true, transformation(origin = {132, 36}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {118, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_1(pwr = 100) annotation(
    Placement(visible = true, transformation(origin = {118, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground5 annotation(
    Placement(visible = true, transformation(origin = {60, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground6 annotation(
    Placement(visible = true, transformation(origin = {78, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground7 annotation(
    Placement(visible = true, transformation(origin = {74, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.Ammeter_Freq2Time ammeter_Freq2Time annotation(
    Placement(visible = true, transformation(origin = {66, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.Ammeter_Freq2Time ammeter_Freq2Time1 annotation(
    Placement(visible = true, transformation(origin = {44, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.Ammeter_Freq2Time ammeter_Freq2Time2 annotation(
    Placement(visible = true, transformation(origin = {40, 96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-6, 24}, {-6, 14}}, color = {117, 80, 123}));
  connect(votlageSource.pinN, ground.pin) annotation(
    Line(points = {{-120, 26}, {-120, 14}}, color = {117, 80, 123}));
  connect(votlageSource.pinP_phB, voltmeter_Freq2Time.pin_p) annotation(
    Line(points = {{-110, 44}, {-84, 44}, {-84, 18}}, color = {92, 53, 102}));
  connect(voltmeter_Freq2Time.pin_n, votlageSource.pinP_phA) annotation(
    Line(points = {{-84, -2}, {-102, -2}, {-102, 36}, {-110, 36}}, color = {117, 80, 123}));
  connect(voltmeter_Freq2Time1.pin_p, votlageSource.pinP_phA) annotation(
    Line(points = {{-56, 16}, {-56, 16}, {-56, 36}, {-110, 36}, {-110, 36}}, color = {92, 53, 102}));
  connect(voltmeter_Freq2Time1.pin_n, votlageSource.pinP_phC) annotation(
    Line(points = {{-56, -4}, {-72, -4}, {-72, 28}, {-110, 28}, {-110, 28}}, color = {117, 80, 123}));
  connect(voltmeter_Freq2Time2.pin_p, votlageSource.pinP_phC) annotation(
    Line(points = {{-36, 8}, {-36, 28}, {-110, 28}}, color = {92, 53, 102}));
  connect(voltmeter_Freq2Time2.pin_n, votlageSource.pinP_phB) annotation(
    Line(points = {{-36, -12}, {-46, -12}, {-46, 44}, {-110, 44}, {-110, 44}}, color = {117, 80, 123}));
  connect(votlageSource.pinP_phC, deltaWye.pinPrim_C) annotation(
    Line(points = {{-110, 28}, {-38, 28}, {-38, 26}, {-26, 26}}, color = {92, 53, 102}));
  connect(votlageSource.pinP_phA, deltaWye.pinPrim_B) annotation(
    Line(points = {{-110, 36}, {-26, 36}}, color = {92, 53, 102}));
  connect(votlageSource.pinP_phB, deltaWye.pinPrim_A) annotation(
    Line(points = {{-110, 44}, {-39, 44}, {-39, 46}, {-26, 46}}, color = {92, 53, 102}));
  connect(Power_Supply_1.pin_p, Load_1.p) annotation(
    Line(points = {{108, -8}, {128, -8}}, color = {0, 0, 255}));
  connect(Power_Supply_1.pin_n, Load_1.n) annotation(
    Line(points = {{108, -20}, {122, -20}, {122, -28}, {128, -28}}, color = {0, 0, 255}));
  connect(ground1.p, Load_1.n) annotation(
    Line(points = {{128, -36}, {128, -28}}, color = {0, 0, 255}));
  connect(Laptop_charger_3.pin_n, Laptop_3.n) annotation(
    Line(points = {{112, 34}, {120, 34}, {120, 26}, {132, 26}, {132, 26}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation(
    Line(points = {{132, 18}, {132, 18}, {132, 26}, {132, 26}}, color = {0, 0, 255}));
  connect(Laptop_charger_3.pin_p, Laptop_3.p) annotation(
    Line(points = {{112, 46}, {132, 46}, {132, 46}, {132, 46}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation(
    Line(points = {{92, 84}, {102, 84}, {102, 80}, {118, 80}, {118, 80}}, color = {0, 0, 255}));
  connect(ground4.p, LED_1.n) annotation(
    Line(points = {{118, 72}, {118, 72}, {118, 80}, {118, 80}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation(
    Line(points = {{92, 96}, {110, 96}, {110, 100}, {118, 100}, {118, 100}}, color = {0, 0, 255}));
  connect(ground5.pin, LED_Driver_1.hPin_N) annotation(
    Line(points = {{60, 82}, {72, 82}, {72, 84}, {72, 84}}, color = {92, 53, 102}));
  connect(ground7.pin, Power_Supply_1.hPin_N) annotation(
    Line(points = {{74, -22}, {80, -22}, {80, -20}, {88, -20}}, color = {92, 53, 102}));
  connect(Laptop_charger_3.hPin_N, ground6.pin) annotation(
    Line(points = {{92, 34}, {78, 34}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_B, ammeter_Freq2Time.pin_p) annotation(
    Line(points = {{-6, 40}, {44, 40}, {44, 46}, {56, 46}}, color = {92, 53, 102}));
  connect(ammeter_Freq2Time.pin_n, Laptop_charger_3.hPin_P) annotation(
    Line(points = {{76, 46}, {92, 46}, {92, 46}, {92, 46}, {92, 46}}, color = {117, 80, 123}));
  connect(ammeter_Freq2Time1.pin_p, deltaWye.pinSec_C) annotation(
    Line(points = {{34, 16}, {20, 16}, {20, 32}, {-6, 32}, {-6, 32}}, color = {92, 53, 102}));
  connect(ammeter_Freq2Time1.pin_n, Power_Supply_1.hPin_P) annotation(
    Line(points = {{54, 16}, {64, 16}, {64, -8}, {88, -8}, {88, -8}}, color = {117, 80, 123}));
  connect(ammeter_Freq2Time2.pin_n, LED_Driver_1.hPin_P) annotation(
    Line(points = {{50, 96}, {72, 96}}, color = {117, 80, 123}));
  connect(ammeter_Freq2Time2.pin_p, deltaWye.pinSec_A) annotation(
    Line(points = {{30, 96}, {14, 96}, {14, 48}, {-6, 48}, {-6, 48}}, color = {92, 53, 102}));
  annotation(
    Diagram(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end Scenario_2;