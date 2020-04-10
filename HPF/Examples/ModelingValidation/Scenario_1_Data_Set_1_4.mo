within HPF.Examples.ModelingValidation;
model Scenario_1_Data_Set_1_4
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin={-184, -18},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye( Rc = 8.4e3,Rp = 3.7672, Rs = 0.2576,VPrimRated = 480, VSecRated = 208, Xm = 777.0164, Xp = 1.1006, Xs = 0.5003,fEC = 0.067, fOSL = 0.033, fW = 0.9) annotation (
    Placement(visible = true, transformation(origin={-46, 0},    extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-32, -22},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin={-176, 60},    extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA ={0.52447, 5.1682, 3.4211, -1.0065, 0.96784, 0.41629, 2.8448, 3.4445, 3.1871, 0.90745, -0.24966, 0.31431, 4.8331, 0.71082, 5.0363},vArg_phB ={4.7122, 2.6206, 0.10697, 3.1216, 0.59385, 2.7291, 0.31843, 2.2651, -0.95553, 4.5529, 1.837, 1.575, 2.8743, 2.67, 0.84628},vArg_phC ={2.6184, 0.41931, 2.7136, 0.68112, 3.8937, 4.5726, 4.5535, -0.23802, 1.0386, 2.8111, 3.9909, 4.0865, 0.18498, 5.0872, 2.722},vMag_phA ={281.5265, 0.54185, 0.4782, 0.82046, 0.2161, 1.0047, 0.31242, 0.06249, 0.48262, 0.16437, 0.03238, 0.11375, 0.029965, 0.027409, 0.13441},vMag_phB ={281.5157, 0.67129, 0.61051, 1.2634, 0.29631, 0.88633, 0.34845, 0.055384, 0.44358, 0.15776, 0.034389, 0.11372, 0.068726, 0.03957, 0.10368},vMag_phC ={281.2799, 0.38554, 0.16186, 1.0609, 0.50318, 0.76851, 0.20281, 0.099314, 0.44515, 0.079861, 0.033682, 0.18318, 0.063725, 0.039101, 0.12243}) annotation (
    Placement(visible = true, transformation(origin={-184, 0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_2(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2_3D.mat") annotation (
    Placement(visible = true, transformation(origin={152, 14},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Power_Supply_1(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1_3D.mat") annotation (
    Placement(visible = true, transformation(origin={48, 44},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin={50, -4},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_1(pwr = 400) annotation (
    Placement(visible = true, transformation(origin={94,40},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
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
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_3(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin={52, -64},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_2(pwr = 22) annotation (
    Placement(visible = true, transformation(origin={182, 10},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={78, -94},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_1(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {46, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_3(pwr = 22) annotation (
    Placement(visible = true, transformation(origin={78, -68},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load LED_1(pwr = 22) annotation (
    Placement(visible = true, transformation(origin = {82, 84}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin = {82, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_4(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat") annotation (
    Placement(visible = true, transformation(origin={150, -78},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_5(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat") annotation (
    Placement(visible = true, transformation(origin={44, -160},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Power_Supply_2(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_2_3D.mat") annotation (
    Placement(visible = true, transformation(origin={152, -32},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Power_Supply_3(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin={48, -112},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_2(pwr = 400) annotation (
    Placement(visible = true, transformation(origin={184, -36},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation (
    Placement(visible = true, transformation(origin={184, -62},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation (
    Placement(visible = true, transformation(origin={78, -142},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 400) annotation (
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
  connect(Power_Supply_1.pin_p, Load_1.p) annotation(
    Line(points = {{58, 50}, {94, 50}}, color = {0, 0, 255}));
  connect(ground1.p, Load_1.n) annotation(
    Line(points = {{82, 22}, {82, 26}, {94, 26}, {94, 30}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation (
    Line(points = {{60, -10}, {74, -10}, {74, -18}, {84, -18}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation (
    Line(points = {{84, -24}, {84, -18}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation (
    Line(points = {{60, 2}, {84, 2}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation (
    Line(points = {{40, -10}, {24, -10}, {24, -22}}, color = {117, 80, 123}));
  connect(iMsr_prim_PhA.pin_n, deltaWye.pinPrim_A) annotation (
    Line(points = {{-90, 10}, {-56, 10}}, color = {117, 80, 123}));
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
  connect(LED_Driver_1.pin_p, LED_1.p) annotation(
    Line(points = {{56, 94}, {82, 94}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation(
    Line(points = {{56, 82}, {73.5, 82}, {73.5, 74}, {82, 74}}, color = {0, 0, 255}));
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
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation (
    Line(points = {{160, -72}, {184, -72}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation (
    Line(points = {{160, -84}, {180, -84}, {180, -88}, {184, -88}, {184, -92}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation (
    Line(points = {{184, -98}, {184, -92}}, color = {0, 0, 255}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points = {{-36, -12}, {-32, -12}, {-32, -22}}, color = {117, 80, 123}));
  connect(Power_Supply_1.pin_n, Load_1.n) annotation(
    Line(points = {{58, 38}, {78, 38}, {78, 30}, {94, 30}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n, dC_Load.n) annotation (
    Line(points = {{58, -118}, {68, -118}, {68, -126}, {78, -126}}, color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_P, deltaWye.pinSec_A) annotation(
    Line(points = {{36, 94}, {0, 94}, {0, 12}, {-36, 12}}, color = {92, 53, 102}));
  connect(Power_Supply_1.hPin_P, deltaWye.pinSec_A) annotation (
    Line(points = {{38, 50}, {0, 50}, {0, 12}, {-36, 12}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_P, deltaWye.pinSec_A) annotation (
    Line(points = {{40, 2}, {0, 2}, {0, 12}, {-36, 12}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation (
    Line(points = {{-36, 4}, {-10, 4}, {-10, -46}, {102, -46}, {102, 20}, {142, 20}}, color = {92, 53, 102}));
  connect(iMsr_prim_PhC.pin_n, deltaWye.pinPrim_C) annotation (
    Line(points = {{-84, -10}, {-56, -10}}, color = {117, 80, 123}));
  connect(iMsr_prim_PhB.pin_n, deltaWye.pinPrim_B) annotation (
    Line(points = {{-62, 0}, {-56, 0}}, color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points = {{38, -106}, {-20, -106}, {-20, -58}, {42, -58}}, color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points = {{34, -154}, {-20, -154}, {-20, -58}, {42, -58}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation (
    Line(points = {{-36, -4}, {-20, -4}, {-20, -58}, {42, -58}}, color = {92, 53, 102}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation(
    Line(points = {{36, 82}, {24, 82}, {24, -22}}, color = {117, 80, 123}));
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
  connect(deltaWye.pinSec_B, Power_Supply_2.hPin_P) annotation (
    Line(points = {{-36, 4}, {-10, 4}, {-10, -46}, {102, -46}, {102, -26}, {142, -26}, {142, -26}, {142, -26}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P, deltaWye.pinSec_B) annotation (
    Line(points = {{140, -72}, {102, -72}, {102, -46}, {-10, -46}, {-10, 4}, {-36, 4}, {-36, 4}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation(
    Line(points = {{140, -84}, {122, -84}, {122, -96}, {122, -96}}, color = {117, 80, 123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, initialScale = 0.1), graphics={Text(origin = {-10, -12}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {146, 164}}, textString = "Scenario 1 | Data Set 1.4
Load Phase a-n	Total Load - 500W		Load Bank (78W), LED (22W), Resistor (400W)
Load Phase b-n	Total Load - 500W		Load Bank (78W), LED (22W), Resistor (400W)
Load Phase c-n	Total Load - 500W		Load Bank (78W), LED (22W), Resistor (400W)", fontSize = 9, horizontalAlignment = TextAlignment.Left), Text(origin = {106, -142}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {-132, 176}}, textString = "Rc: 5.0392e+03 -> 5.5e+03
(This prevents solver crashing).", fontSize = 9, horizontalAlignment = TextAlignment.Left), Text(origin = {104, -154}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {-132, 176}}, textString = "Rc: 5.0392e+03 -> 8.4e3", fontSize = 9, horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_1_Data_Set_1_4;