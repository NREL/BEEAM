within HPF.Examples.ModelingValidation;

model Scenario_2_tmp
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-178, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(Rc = 3.5366e3, Rp = 2.7672, Rs = 0.2576, VPrimRated = 480, VSecRated = 208, Xm = 711.1091, Xp = 1.1006, Xs = 0.5003, fEC = 0.067, fOSL = 0.033, fW = 0.9) annotation(
    Placement(visible = true, transformation(origin = {-68, 48}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-148, 126}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA = {0.52192, 6.1952, 3.641, 8.2279, 4.6037, 6.1521, 9.054, 11.1771, 11.547, 9.5299}, vArg_phB = {4.7065, 3.5627, 4.2216, 5.9383, 4.7501, 8.371, 6.837, 8.9513, 7.4465, 13.0091}, vArg_phC = {2.6138, 1.127, 6.9575, 3.4123, 7.8346, 10.4191, 11.1108, 6.5894, 9.3993, 10.5656}, vMag_phA = {282.8166, 0.45117, 0.39336, 0.76549, 0.19582, 0.74027, 0.44753, 0.031767, 0.56648, 0.11503}, vMag_phB = {282.9682, 0.65765, 0.17303, 1.3199, 0.3038, 0.75239, 0.43691, 0.046575, 0.5116, 0.15362}, vMag_phC = {281.8661, 0.35229, 0.54619, 0.99899, 0.49719, 0.66452, 0.39451, 0.037451, 0.50007, 0.058614}) annotation(
    Placement(visible = true, transformation(origin = {-178, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_1(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1.mat") annotation(
    Placement(visible = true, transformation(origin = {34, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3.mat") annotation(
    Placement(visible = true, transformation(origin = {36, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_1(pwr = 200) annotation(
    Placement(visible = true, transformation(origin = {68, 88}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {68, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {70, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 78) annotation(
    Placement(visible = true, transformation(origin = {70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground6 annotation(
    Placement(visible = true, transformation(origin = {6, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground7 annotation(
    Placement(visible = true, transformation(origin = {10, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhA annotation(
    Placement(visible = true, transformation(origin = {-152, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_3(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3.mat") annotation(
    Placement(visible = true, transformation(origin = {38, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation(
    Placement(visible = true, transformation(origin = {64, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground9 annotation(
    Placement(visible = true, transformation(origin = {18, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_3(pwr = 22) annotation(
    Placement(visible = true, transformation(origin = {64, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhB annotation(
    Placement(visible = true, transformation(origin = {-124, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhC annotation(
    Placement(visible = true, transformation(origin = {-146, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_4(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4.mat") annotation(
    Placement(visible = true, transformation(origin = {132, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation(
    Placement(visible = true, transformation(origin = {166, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground14 annotation(
    Placement(visible = true, transformation(origin = {110, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Load_2(pwr = 400) annotation(
    Placement(visible = true, transformation(origin = {166, 12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Ground ground17 annotation(
    Placement(visible = true, transformation(origin = {104, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_2(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_2.mat") annotation(
    Placement(visible = true, transformation(origin = {134, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load dC_Load1(pwr = 78) annotation(
    Placement(visible = true, transformation(origin = {166, -34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation(
    Placement(visible = true, transformation(origin = {166, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 1e-5 + 1e-5 * j) annotation(
    Placement(visible = true, transformation(origin = {106, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.SinglePhase.Components.Impedance z2(z = 1e-5 + 1e-5 * j) annotation(
    Placement(visible = true, transformation(origin = {104, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.SinglePhase.Components.Impedance z3(z = 1e-5 + 1e-5 * j) annotation(
    Placement(visible = true, transformation(origin = {8, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.SinglePhase.Components.Impedance z4(z = 1e-5 + 1e-5 * j) annotation(
    Placement(visible = true, transformation(origin = {12, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-178, 38}, {-178, 30}}, color = {117, 80, 123}));
  connect(Power_Supply_1.pin_p, Load_1.p) annotation(
    Line(points = {{44, 98}, {68, 98}}, color = {0, 0, 255}));
  connect(ground1.p, Load_1.n) annotation(
    Line(points = {{68, 70}, {68, 78}}, color = {0, 0, 255}));
  connect(Laptop_charger_3.pin_n, Laptop_3.n) annotation(
    Line(points = {{46, 38}, {60, 38}, {60, 30}, {70, 30}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation(
    Line(points = {{70, 24}, {70, 30}}, color = {0, 0, 255}));
  connect(Laptop_charger_3.pin_p, Laptop_3.p) annotation(
    Line(points = {{46, 50}, {70, 50}}, color = {0, 0, 255}));
  connect(ground7.pin, Power_Supply_1.hPin_N) annotation(
    Line(points = {{10, 78}, {10, 86}, {24, 86}}, color = {92, 53, 102}));
  connect(Laptop_charger_3.hPin_N, ground6.pin) annotation(
    Line(points = {{26, 38}, {6, 38}, {6, 26}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phB, iMsr_prim_PhA.pin_p) annotation(
    Line(points = {{-168, 56}, {-162, 56}, {-162, 58}}, color = {92, 53, 102}));
  connect(iMsr_prim_PhA.pin_n, deltaWye.pinPrim_A) annotation(
    Line(points = {{-142, 58}, {-78, 58}}, color = {117, 80, 123}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation(
    Line(points = {{48, -10}, {64, -10}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation(
    Line(points = {{48, -22}, {56, -22}, {56, -30}, {64, -30}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation(
    Line(points = {{64, -36}, {64, -30}}, color = {0, 0, 255}));
  connect(LED_Driver_3.hPin_N, ground9.pin) annotation(
    Line(points = {{28, -22}, {18, -22}, {18, -30}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-58, 36}, {-50, 36}, {-50, 30}}, color = {117, 80, 123}));
  connect(Power_Supply_1.pin_n, Load_1.n) annotation(
    Line(points = {{44, 86}, {56, 86}, {56, 78}, {68, 78}}, color = {0, 0, 255}));
  connect(iMsr_prim_PhC.pin_n, deltaWye.pinPrim_C) annotation(
    Line(points = {{-136, 38}, {-78, 38}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, iMsr_prim_PhB.pin_p) annotation(
    Line(points = {{-168, 48}, {-134, 48}, {-134, 48}, {-134, 48}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, iMsr_prim_PhC.pin_p) annotation(
    Line(points = {{-168, 40}, {-162, 40}, {-162, 38}, {-156, 38}, {-156, 38}}, color = {92, 53, 102}));
  connect(ground16.p, dC_Load1.n) annotation(
    Line(points = {{166, -50}, {166, -44}}, color = {0, 0, 255}));
  connect(Load_2.n, ground12.p) annotation(
    Line(points = {{166, 2}, {166, -4}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation(
    Line(points = {{142, -24}, {166, -24}}, color = {0, 0, 255}));
  connect(ground14.pin, Power_Supply_2.hPin_N) annotation(
    Line(points = {{110, -2}, {110, 10}, {124, 10}}, color = {92, 53, 102}));
  connect(Load_2.n, Power_Supply_2.pin_n) annotation(
    Line(points = {{166, 2}, {158, 2}, {158, 10}, {144, 10}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation(
    Line(points = {{122, -36}, {104, -36}, {104, -48}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation(
    Line(points = {{142, -36}, {158, -36}, {158, -44}, {166, -44}}, color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p, Load_2.p) annotation(
    Line(points = {{144, 22}, {168, 22}, {168, 22}, {166, 22}, {166, 22}}, color = {0, 0, 255}));
  connect(z.pin_p, Power_Supply_2.hPin_P) annotation(
    Line(points = {{116, 22}, {124, 22}, {124, 22}, {124, 22}}, color = {92, 53, 102}));
  connect(z2.pin_p, Laptop_Charger_4.hPin_P) annotation(
    Line(points = {{114, -24}, {122, -24}, {122, -24}, {122, -24}}, color = {92, 53, 102}));
  connect(z2.pin_n, deltaWye.pinSec_B) annotation(
    Line(points = {{94, -24}, {82, -24}, {82, 4}, {-26, 4}, {-26, 52}, {-58, 52}, {-58, 52}}, color = {117, 80, 123}));
  connect(z.pin_n, deltaWye.pinSec_B) annotation(
    Line(points = {{96, 22}, {88, 22}, {88, 4}, {-26, 4}, {-26, 52}, {-58, 52}, {-58, 52}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, z4.pin_n) annotation(
    Line(points = {{-58, 60}, {-6, 60}, {-6, 50}, {2, 50}, {2, 50}}, color = {92, 53, 102}));
  connect(z3.pin_n, deltaWye.pinSec_A) annotation(
    Line(points = {{-2, 98}, {-6, 98}, {-6, 60}, {-58, 60}, {-58, 60}}, color = {117, 80, 123}));
  connect(z3.pin_p, Power_Supply_1.hPin_P) annotation(
    Line(points = {{18, 98}, {24, 98}, {24, 98}, {24, 98}}, color = {92, 53, 102}));
  connect(z4.pin_p, Laptop_charger_3.hPin_P) annotation(
    Line(points = {{22, 50}, {26, 50}, {26, 50}, {26, 50}}, color = {92, 53, 102}));
  connect(iMsr_prim_PhB.pin_n, deltaWye.pinPrim_B) annotation(
    Line(points = {{-114, 48}, {-78, 48}, {-78, 48}, {-78, 48}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_P, deltaWye.pinSec_C) annotation(
    Line(points = {{28, -10}, {-38, -10}, {-38, 44}, {-58, 44}, {-58, 44}, {-58, 44}}, color = {92, 53, 102}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, initialScale = 0.1), graphics = {Text(origin = {-12, 4}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {146, 164}}, textString = "Scenario 2 | Data Set 2.3
Load Phase a-n	Total Load - 300W      Load Bank 1 (78W), LED 1 (22W), Resistor 2 (200W)
Load Phase b-n	Total Load - 500W      Load Bank 2 (78W), LED 2 (22W), Resistor 3 (400W)
Load Phase c-n	Total Load - 700W      Load Bank 3 (78W), LED 3 (22W), Resistor 4 (600W)", fontSize = 9, horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_2_tmp;