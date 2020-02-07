within HPF.Examples.ModelingValidation;

model Scenario_2
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-110, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(Rc = 1e5, Rp = 0.1, Rs = 0.1,VPrimRated = 480, VSecRated = 208, Xm = 1e5, Xp = 0.1, Xs = 0.1,fEC = 0.1, fOSL = 0.1, fW = 0.1) annotation(
    Placement(visible = true, transformation(origin = {0, 34}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = { 10, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-106, 90}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource votlageSource(vArg_phA = {0.52192, 6.1952, 3.641, 8.2279, 4.6037, 6.1521, 9.054, 11.1771, 11.547, 9.5299}, vArg_phB = {4.7065, 3.5627, 4.2216, 5.9383, 4.7501, 8.371, 6.837, 8.9513, 7.4465, 13.0091}, vArg_phC = {2.6138, 1.127, 6.9575, 3.4123, 7.8346, 10.4191, 11.1108, 6.5894, 9.3993, 10.5656}, vMag_phA = {282.8166, 0.45117, 0.39336, 0.76549, 0.19582, 0.74027, 0.44753, 0.031767, 0.56648, 0.11503}, vMag_phB = {282.9682, 0.65765, 0.17303, 1.3199, 0.3038, 0.75239, 0.43691, 0.046575, 0.5116, 0.15362}, vMag_phC = {281.8661, 0.35229, 0.54619, 0.99899, 0.49719, 0.66452, 0.39451, 0.037451, 0.50007, 0.058614}) annotation(
    Placement(visible = true, transformation(origin = {-110, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_2(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2.mat") annotation(
    Placement(visible = true, transformation(origin = {76, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_1(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1.mat") annotation(
    Placement(visible = true, transformation(origin = {92, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3.mat") annotation(
    Placement(visible = true, transformation(origin = {96, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_1(pwr = 300) annotation(
    Placement(visible = true, transformation(origin = {122, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {122, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {126, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 250) annotation(
    Placement(visible = true, transformation(origin = {126, 34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {112, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_1(pwr = 120) annotation(
    Placement(visible = true, transformation(origin = {112, 88}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground5 annotation(
    Placement(visible = true, transformation(origin = {54, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground6 annotation(
    Placement(visible = true, transformation(origin = {72,32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground7 annotation(
    Placement(visible = true, transformation(origin = {68, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor currentSensor annotation(
    Placement(visible = true, transformation(origin = {-76, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor currentSensor1 annotation(
    Placement(visible = true, transformation(origin = {-50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor currentSensor2 annotation(
    Placement(visible = true, transformation(origin = {-32, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{10, 22}, {10, 8}}, color = {117, 80, 123}));
  connect(votlageSource.pinN, ground.pin) annotation(
    Line(points = {{-110, 26}, {-110, 14}}, color = {117, 80, 123}));
  connect(Power_Supply_1.pin_p, Load_1.p) annotation(
    Line(points = {{102, -10}, {122, -10}}, color = {0, 0, 255}));
  connect(Power_Supply_1.pin_n, Load_1.n) annotation(
    Line(points = {{102, -22}, {116, -22}, {116, -30}, {122, -30}}, color = {0, 0, 255}));
  connect(ground1.p, Load_1.n) annotation(
    Line(points = {{122, -38}, {122, -30}}, color = {0, 0, 255}));
  connect(Laptop_charger_3.pin_n, Laptop_3.n) annotation(
    Line(points = {{106, 32}, {106, 28}, {114, 28}, {114, 24}, {126, 24}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation(
    Line(points = {{126, 16}, {126, 24}}, color = {0, 0, 255}));
  connect(Laptop_charger_3.pin_p, Laptop_3.p) annotation(
    Line(points = {{106, 44}, {126, 44}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_1.n) annotation(
    Line(points = {{86, 82}, {96, 82}, {96, 78}, {112, 78}}, color = {0, 0, 255}));
  connect(ground4.p, LED_1.n) annotation(
    Line(points = {{112, 70}, {112, 78}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_p, LED_1.p) annotation(
    Line(points = {{86, 94}, {98, 94}, {98, 98}, {112, 98}}, color = {0, 0, 255}));
  connect(ground5.pin, LED_Driver_2.hPin_N) annotation(
    Line(points = {{54, 80}, {60, 80}, {60, 82}, {66, 82}}, color = {92, 53, 102}));
  connect(ground7.pin, Power_Supply_1.hPin_N) annotation(
    Line(points = {{68, -24}, {75, -24}, {75, -22}, {82, -22}}, color = {92, 53, 102}));
  connect(Laptop_charger_3.hPin_N, ground6.pin) annotation(
    Line(points = {{86, 32}, {72, 32}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, LED_Driver_2.hPin_P) annotation(
    Line(points = {{10, 46}, {32, 46}, {32, 94}, {66, 94}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, Power_Supply_1.hPin_P) annotation(
    Line(points = {{10, 30}, {42, 30}, {42, -10}, {82, -10}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, Laptop_charger_3.hPin_P) annotation(
    Line(points = {{10, 38}, {64, 38}, {64, 44}, {86, 44}}, color = {92, 53, 102}));
  connect(votlageSource.pinP_phB, currentSensor.pin_p) annotation(
    Line(points = {{-100, 44}, {-86, 44}}, color = {92, 53, 102}));
  connect(currentSensor.pin_n, deltaWye.pinPrim_A) annotation(
    Line(points = {{-66, 44}, {-10, 44}}, color = {117, 80, 123}));
  connect(currentSensor2.pin_n, deltaWye.pinPrim_C) annotation(
    Line(points = {{-22, 24}, {-10, 24}, {-10, 24}, {-10, 24}}, color = {117, 80, 123}));
  connect(currentSensor1.pin_n, deltaWye.pinPrim_B) annotation(
    Line(points = {{-40, 36}, {-20, 36}, {-20, 34}, {-10, 34}, {-10, 34}}, color = {117, 80, 123}));
  connect(currentSensor1.pin_p, votlageSource.pinP_phA) annotation(
    Line(points = {{-60, 36}, {-100, 36}, {-100, 36}, {-100, 36}}, color = {92, 53, 102}));
  connect(votlageSource.pinP_phC, currentSensor2.pin_p) annotation(
    Line(points = {{-100, 28}, {-74, 28}, {-74, 24}, {-42, 24}, {-42, 24}, {-42, 24}}, color = {92, 53, 102}));
  annotation(
    Diagram(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_2;