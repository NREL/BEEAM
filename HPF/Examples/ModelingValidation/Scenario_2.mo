within HPF.Examples.ModelingValidation;
model Scenario_2
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin={-188, -18},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(Rc = 3.5366e+03, Rp = 2.7672, Rs = 0.2576,VPrimRated = 480, VSecRated = 208, Xm = 711.1091, Xp = 1.1006, Xs = 0.5003,fEC = 0.067, fOSL = 0.033, fW = 0.9) annotation (
    Placement(visible = true, transformation(origin={-90, 0},    extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-72, -18},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin={-150, 78},    extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA = {0.52192, 6.1952, 3.641, 8.2279, 4.6037, 6.1521, 9.054, 11.1771, 11.547, 9.5299}, vArg_phB = {4.7065, 3.5627, 4.2216, 5.9383, 4.7501, 8.371, 6.837, 8.9513, 7.4465, 13.0091}, vArg_phC = {2.6138, 1.127, 6.9575, 3.4123, 7.8346, 10.4191, 11.1108, 6.5894, 9.3993, 10.5656}, vMag_phA = {282.8166, 0.45117, 0.39336, 0.76549, 0.19582, 0.74027, 0.44753, 0.031767, 0.56648, 0.11503}, vMag_phB = {282.9682, 0.65765, 0.17303, 1.3199, 0.3038, 0.75239, 0.43691, 0.046575, 0.5116, 0.15362}, vMag_phC = {281.8661, 0.35229, 0.54619, 0.99899, 0.49719, 0.66452, 0.39451, 0.037451, 0.50007, 0.058614}) annotation (
    Placement(visible = true, transformation(origin={-188, 0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_2(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2.mat") annotation (
    Placement(visible = true, transformation(origin={132, 14},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_1(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1.mat") annotation (
    Placement(visible = true, transformation(origin={4, 44},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3.mat") annotation (
    Placement(visible = true, transformation(origin={6, -4},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_1(pwr = 200) annotation (
    Placement(visible = true, transformation(origin={38,40},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={38, 12},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={40, -34},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 78) annotation (
    Placement(visible = true, transformation(origin={40, -8},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={162, -14},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin={-20, -22},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhA annotation (
    Placement(visible = true, transformation(origin={-142, 10},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_3(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3.mat") annotation (
    Placement(visible = true, transformation(origin={8, -64},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_2(pwr = 22) annotation (
    Placement(visible = true, transformation(origin={162, 10},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={34, -94},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_1(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1.mat") annotation (
    Placement(visible = true, transformation(origin = {6, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_3(pwr = 22) annotation (
    Placement(visible = true, transformation(origin={34, -68},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load LED_1(pwr = 22) annotation (
    Placement(visible = true, transformation(origin = {38, 84}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin = {38, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_4(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4.mat") annotation (
    Placement(visible = true, transformation(origin={130, -78},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_5(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5.mat") annotation (
    Placement(visible = true, transformation(origin={0, -160},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_2(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_2.mat") annotation (
    Placement(visible = true, transformation(origin={132, -32},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_3(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_3.mat") annotation (
    Placement(visible = true, transformation(origin={4, -112},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_2(pwr = 400) annotation (
    Placement(visible = true, transformation(origin={164, -36},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation (
    Placement(visible = true, transformation(origin={164, -62},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation (
    Placement(visible = true, transformation(origin={34, -142},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 600) annotation (
    Placement(visible = true, transformation(origin={34, -116},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load dC_Load1(pwr = 78) annotation (
    Placement(visible = true, transformation(origin={164, -82},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={164, -108},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin={102, -96},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={36, -190},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 78) annotation (
    Placement(visible = true, transformation(origin={36, -164},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin={-26, -176},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhB annotation(
    Placement(visible = true, transformation(origin = {-114, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhC annotation(
    Placement(visible = true, transformation(origin = {-136, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsr_AB annotation(
    Placement(visible = true, transformation(origin = {-158, -34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_BC annotation(
    Placement(visible = true, transformation(origin = {-154, -66}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_CA annotation(
    Placement(visible = true, transformation(origin = {-140, -98}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-188, -10}, {-188, -18}}, color = {117, 80, 123}));
  connect(Power_Supply_1.pin_p, Load_1.p) annotation(
    Line(points = {{14, 50}, {38, 50}}, color = {0, 0, 255}));
  connect(ground1.p, Load_1.n) annotation(
    Line(points = {{38, 22}, {38, 30}}, color = {0, 0, 255}));
  connect(Laptop_charger_3.pin_n, Laptop_3.n) annotation(
    Line(points = {{16, -10}, {30, -10}, {30, -18}, {40, -18}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation(
    Line(points = {{40, -24}, {40, -18}}, color = {0, 0, 255}));
  connect(Laptop_charger_3.pin_p, Laptop_3.p) annotation(
    Line(points = {{16, 2}, {40, 2}}, color = {0, 0, 255}));
  connect(Laptop_charger_3.hPin_N, ground6.pin) annotation(
    Line(points = {{-4, -10}, {-20, -10}, {-20, -22}}, color = {117, 80, 123}));
  connect(iMsr_prim_PhA.pin_n, deltaWye.pinPrim_A) annotation(
    Line(points = {{-132, 10}, {-100, 10}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation(
    Line(points = {{142, 20}, {162, 20}}, color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation(
    Line(points = {{162, -4}, {162, 0}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation(
    Line(points = {{18, -58}, {34, -58}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation(
    Line(points = {{18, -70}, {30, -70}, {30, -78}, {34, -78}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation(
    Line(points = {{34, -84}, {34, -78}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation(
    Line(points = {{16, 94}, {38, 94}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation(
    Line(points = {{16, 82}, {29.5, 82}, {29.5, 74}, {38, 74}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation(
    Line(points = {{38, 68}, {38, 74}}, color = {0, 0, 255}));
  connect(Load_2.n, Power_Supply_2.pin_n) annotation(
    Line(points = {{164, -46}, {156, -46}, {156, -38}, {142, -38}}, color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p, Load_2.p) annotation(
    Line(points = {{142, -26}, {164, -26}}, color = {0, 0, 255}));
  connect(Load_2.n, ground12.p) annotation(
    Line(points = {{164, -46}, {164, -52}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p, dC_Load.p) annotation(
    Line(points = {{14, -106}, {34, -106}}, color = {0, 0, 255}));
  connect(ground13.p, dC_Load.n) annotation(
    Line(points = {{34, -132}, {34, -126}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation(
    Line(points = {{142, 8}, {160, 8}, {160, 0}, {162, 0}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation(
    Line(points = {{10, -154}, {36, -154}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation(
    Line(points = {{10, -166}, {26, -166}, {26, -174}, {36, -174}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation(
    Line(points = {{36, -180}, {36, -174}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation(
    Line(points = {{-26, -176}, {-26, -166}, {-10, -166}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation(
    Line(points = {{120, -84}, {119, -84}, {119, -96}, {102, -96}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation(
    Line(points = {{140, -72}, {164, -72}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation(
    Line(points = {{140, -84}, {160, -84}, {160, -92}, {164, -92}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation(
    Line(points = {{164, -98}, {164, -92}}, color = {0, 0, 255}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-80, -12}, {-72, -12}, {-72, -18}}, color = {117, 80, 123}));
  connect(Power_Supply_1.pin_n, Load_1.n) annotation(
    Line(points = {{14, 38}, {34, 38}, {34, 30}, {38, 30}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n, dC_Load.n) annotation(
    Line(points = {{14, -118}, {24, -118}, {24, -126}, {34, -126}}, color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_P, deltaWye.pinSec_A) annotation(
    Line(points = {{-4, 94}, {-44, 94}, {-44, 12}, {-80, 12}}, color = {92, 53, 102}));
  connect(Power_Supply_1.hPin_P, deltaWye.pinSec_A) annotation(
    Line(points = {{-6, 50}, {-44, 50}, {-44, 12}, {-80, 12}}, color = {92, 53, 102}));
  connect(Laptop_charger_3.hPin_P, deltaWye.pinSec_A) annotation(
    Line(points = {{-4, 2}, {-44, 2}, {-44, 12}, {-80, 12}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation(
    Line(points = {{-80, 4}, {-54, 4}, {-54, -46}, {82, -46}, {82, 20}, {122, 20}}, color = {92, 53, 102}));
  connect(Power_Supply_2.hPin_P, LED_Driver_2.hPin_P) annotation(
    Line(points = {{122, -26}, {82, -26}, {82, 20}, {122, 20}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P, LED_Driver_2.hPin_P) annotation(
    Line(points = {{120, -72}, {82, -72}, {82, 20}, {122, 20}}, color = {92, 53, 102}));
  connect(iMsr_prim_PhC.pin_n, deltaWye.pinPrim_C) annotation(
    Line(points = {{-126, -10}, {-100, -10}}, color = {117, 80, 123}));
  connect(iMsr_prim_PhB.pin_n, deltaWye.pinPrim_B) annotation(
    Line(points = {{-104, 0}, {-100, 0}}, color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_P, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-6, -106}, {-64, -106}, {-64, -58}, {-2, -58}}, color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-10, -154}, {-64, -154}, {-64, -58}, {-2, -58}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-80, -4}, {-64, -4}, {-64, -58}, {-2, -58}}, color = {92, 53, 102}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation(
    Line(points = {{-4, 82}, {-20, 82}, {-20, -22}}, color = {117, 80, 123}));
  connect(Power_Supply_1.hPin_N, ground6.pin) annotation(
    Line(points = {{-6, 38}, {-20, 38}, {-20, -22}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation(
    Line(points = {{122, 8}, {102, 8}, {102, -96}}, color = {117, 80, 123}));
  connect(Power_Supply_2.hPin_N, ground17.pin) annotation(
    Line(points = {{122, -38}, {102, -38}, {102, -96}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation(
    Line(points = {{-2, -70}, {-26, -70}, {-26, -176}}, color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_N, ground19.pin) annotation(
    Line(points = {{-6, -118}, {-26, -118}, {-26, -176}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phB, iMsr_prim_PhB.pin_p) annotation(
    Line(points = {{-178, 0}, {-124, 0}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, iMsr_prim_PhA.pin_p) annotation(
    Line(points = {{-178, 6}, {-172, 6}, {-172, 10}, {-152, 10}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, iMsr_prim_PhC.pin_p) annotation(
    Line(points = {{-178, -8}, {-170, -8}, {-170, -10}, {-146, -10}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, vMsr_AB.pin_p) annotation(
    Line(points = {{-178, 6}, {-158, 6}, {-158, -24}, {-158, -24}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, vMsr_AB.pin_n) annotation(
    Line(points = {{-178, 0}, {-172, 0}, {-172, -44}, {-158, -44}, {-158, -44}}, color = {92, 53, 102}));
  connect(vMsr_BC.pin_p, voltageSource.pinP_phB) annotation(
    Line(points = {{-154, -56}, {-154, -56}, {-154, 0}, {-178, 0}, {-178, 0}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, vMsr_BC.pin_n) annotation(
    Line(points = {{-178, -8}, {-174, -8}, {-174, -76}, {-154, -76}, {-154, -76}}, color = {92, 53, 102}));
  connect(vMsr_CA.pin_p, voltageSource.pinP_phC) annotation(
    Line(points = {{-140, -88}, {-140, -88}, {-140, -8}, {-178, -8}, {-178, -8}, {-178, -8}}, color = {92, 53, 102}));
  connect(vMsr_CA.pin_n, voltageSource.pinP_phA) annotation(
    Line(points = {{-140, -108}, {-170, -108}, {-170, 6}, {-178, 6}, {-178, 6}}, color = {117, 80, 123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, initialScale = 0.1), graphics={Text(origin = {-12, 4}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {146, 164}}, textString = "Scenario 2 | Data Set 2.3
Load Phase a-n	Total Load - 300W      Load Bank 1 (78W), LED 1 (22W), Resistor 2 (200W)
Load Phase b-n	Total Load - 500W      Load Bank 2 (78W), LED 2 (22W), Resistor 3 (400W)
Load Phase c-n	Total Load - 700W      Load Bank 3 (78W), LED 3 (22W), Resistor 4 (600W)", fontSize = 9, horizontalAlignment = TextAlignment.Left), Text(origin = {-14, -44}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {146, 164}}, textString = "Encountered error in the modeling.
The power flow solution is giving current values to be higher than
voltage. This means that solver is solving the power relation correctly but inversely.
The problem kind of corrected when the grounds were grouped together on the secondary.
One potential investigation can be to get rid
of the ground all together
like the kind of scheme used in PowerSystems library.", fontSize = 9, horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_2;