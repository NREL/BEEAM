within HPF.Examples.ModelingValidation;
model Scenario_1_Data_Set_1_1
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin={-220, 20},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(Rc = 3988.52, Rp = 2.78, Rs = 0.2558,VPrimRated = 480, VSecRated = 208, Xm = 750.4548, Xp = 1.1006, Xs = 0.2066,fEC = 0.067, fOSL = 0.033, fW = 0.9) annotation (
    Placement(visible = true, transformation(origin={-82, 38},    extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-68, -42},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin={-212, 98},    extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA = {0.52192, 6.1952, 3.641, 8.2279, 4.6037, 6.1521, 9.054, 11.1771, 11.547, 9.5299}, vArg_phB = {4.7065, 3.5627, 4.2216, 5.9383, 4.7501, 8.371, 6.837, 8.9513, 7.4465, 13.0091}, vArg_phC = {2.6138, 1.127, 6.9575, 3.4123, 7.8346, 10.4191, 11.1108, 6.5894, 9.3993, 10.5656}, vMag_phA = {282.8166, 0.45117, 0.39336, 0.76549, 0.19582, 0.74027, 0.44753, 0.031767, 0.56648, 0.11503}, vMag_phB = {282.9682, 0.65765, 0.17303, 1.3199, 0.3038, 0.75239, 0.43691, 0.046575, 0.5116, 0.15362}, vMag_phC = {281.8661, 0.35229, 0.54619, 0.99899, 0.49719, 0.66452, 0.39451, 0.037451, 0.50007, 0.058614}) annotation (
    Placement(visible = true, transformation(origin={-220, 38},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_2(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2_3D.mat") annotation (
    Placement(visible = true, transformation(origin={210, 54},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Power_Supply_1(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1_3D.mat") annotation (
    Placement(visible = true, transformation(origin={106, 84},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin={108, 36},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_1(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin={140, 80},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={140, 52},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={142, 6},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin={142, 32},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={240, 26},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin={82, 18},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhA annotation (
    Placement(visible = true, transformation(origin={-136, 48},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_3(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin={110, -24},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_2(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin={240, 50},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={136, -54},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_1(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {108, 128}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_3(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin={136, -28},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load LED_1(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin = {140, 124}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin = {140, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_4(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat") annotation (
    Placement(visible = true, transformation(origin={208, -38},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_5(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat") annotation (
    Placement(visible = true, transformation(origin={102, -120},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Power_Supply_2(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_2_3D.mat") annotation (
    Placement(visible = true, transformation(origin={210, 8},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Power_Supply_3(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin={106, -72},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_2(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin={242, 4},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation (
    Placement(visible = true, transformation(origin={242, -22},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation (
    Placement(visible = true, transformation(origin={136, -102},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin={136, -76},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load dC_Load1(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin={242, -42},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={242, -68},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin={180, -56},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={138, -150},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin={138, -124},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin={76, -136},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhB annotation (
    Placement(visible = true, transformation(origin = {-108, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhC annotation (
    Placement(visible = true, transformation(origin = {-130, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsr_AB annotation (
    Placement(visible = true, transformation(origin = {-184, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_BC annotation (
    Placement(visible = true, transformation(origin = {-166, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_CA annotation (
    Placement(visible = true, transformation(origin = {-150, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phA annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phC annotation(
    Placement(visible = true, transformation(origin = {10, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phB annotation(
    Placement(visible = true, transformation(origin = {-34, -12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phA annotation(
    Placement(visible = true, transformation(origin = {-52, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phC annotation(
    Placement(visible = true, transformation(origin = {-16, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phB annotation(
    Placement(visible = true, transformation(origin = {42, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-220, 28}, {-220, 20}}, color = {117, 80, 123}));
  connect(Power_Supply_1.pin_p, Load_1.p) annotation(
    Line(points = {{116, 90}, {140, 90}}, color = {0, 0, 255}));
  connect(ground1.p, Load_1.n) annotation(
    Line(points = {{140, 62}, {140, 70}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation(
    Line(points = {{118, 30}, {132, 30}, {132, 22}, {142, 22}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation(
    Line(points = {{142, 16}, {142, 22}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation(
    Line(points = {{118, 42}, {142, 42}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation(
    Line(points = {{98, 30}, {82, 30}, {82, 18}}, color = {117, 80, 123}));
  connect(iMsr_prim_PhA.pin_n, deltaWye.pinPrim_A) annotation(
    Line(points = {{-126, 48}, {-92, 48}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation(
    Line(points = {{220, 60}, {240, 60}}, color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation(
    Line(points = {{240, 36}, {240, 40}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation(
    Line(points = {{120, -18}, {136, -18}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation(
    Line(points = {{120, -30}, {132, -30}, {132, -38}, {136, -38}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation(
    Line(points = {{136, -44}, {136, -38}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation(
    Line(points = {{118, 134}, {140, 134}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation(
    Line(points = {{118, 122}, {131.5, 122}, {131.5, 114}, {140, 114}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation(
    Line(points = {{140, 108}, {140, 114}}, color = {0, 0, 255}));
  connect(Load_2.n, Power_Supply_2.pin_n) annotation(
    Line(points = {{242, -6}, {242, 2}, {220, 2}}, color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p, Load_2.p) annotation(
    Line(points = {{220, 14}, {242, 14}}, color = {0, 0, 255}));
  connect(Load_2.n, ground12.p) annotation(
    Line(points = {{242, -6}, {242, -12}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p, dC_Load.p) annotation(
    Line(points = {{116, -66}, {136, -66}}, color = {0, 0, 255}));
  connect(ground13.p, dC_Load.n) annotation(
    Line(points = {{136, -92}, {136, -86}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation(
    Line(points = {{220, 48}, {239, 48}, {239, 40}, {240, 40}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation(
    Line(points = {{112, -114}, {138, -114}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation(
    Line(points = {{112, -126}, {122, -126}, {122, -134}, {138, -134}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation(
    Line(points = {{138, -140}, {138, -134}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation(
    Line(points = {{76, -136}, {76, -126}, {92, -126}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation(
    Line(points = {{198, -44}, {193.5, -44}, {193.5, -56}, {180, -56}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation(
    Line(points = {{218, -32}, {242, -32}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation(
    Line(points = {{218, -44}, {238, -44}, {238, -52}, {242, -52}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation(
    Line(points = {{242, -58}, {242, -52}}, color = {0, 0, 255}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-72, 26}, {-68, 26}, {-68, -42}}, color = {117, 80, 123}));
  connect(Power_Supply_1.pin_n, Load_1.n) annotation(
    Line(points = {{116, 78}, {125, 78}, {125, 70}, {140, 70}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n, dC_Load.n) annotation(
    Line(points = {{116, -78}, {123, -78}, {123, -86}, {136, -86}}, color = {0, 0, 255}));
  connect(iMsr_prim_PhC.pin_n, deltaWye.pinPrim_C) annotation(
    Line(points = {{-120, 28}, {-92, 28}}, color = {117, 80, 123}));
  connect(iMsr_prim_PhB.pin_n, deltaWye.pinPrim_B) annotation(
    Line(points = {{-98, 38}, {-92, 38}}, color = {117, 80, 123}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation(
    Line(points = {{98, 122}, {82, 122}, {82, 18}}, color = {117, 80, 123}));
  connect(Power_Supply_1.hPin_N, ground6.pin) annotation(
    Line(points = {{96, 78}, {82, 78}, {82, 18}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation(
    Line(points = {{200, 48}, {180, 48}, {180, -56}}, color = {117, 80, 123}));
  connect(Power_Supply_2.hPin_N, ground17.pin) annotation(
    Line(points = {{200, 2}, {180, 2}, {180, -56}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation(
    Line(points = {{100, -30}, {76, -30}, {76, -136}}, color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_N, ground19.pin) annotation(
    Line(points = {{96, -78}, {76, -78}, {76, -136}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phB, iMsr_prim_PhB.pin_p) annotation(
    Line(points = {{-210, 38}, {-118, 38}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, iMsr_prim_PhA.pin_p) annotation(
    Line(points = {{-210, 44}, {-186, 44}, {-186, 48}, {-146, 48}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, iMsr_prim_PhC.pin_p) annotation(
    Line(points = {{-210, 30}, {-140, 30}, {-140, 28}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, vMsr_AB.pin_p) annotation(
    Line(points = {{-210, 44}, {-184, 44}, {-184, 20}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, vMsr_AB.pin_n) annotation(
    Line(points = {{-210, 38}, {-198, 38}, {-198, 0}, {-184, 0}}, color = {92, 53, 102}));
  connect(vMsr_BC.pin_p, voltageSource.pinP_phB) annotation(
    Line(points = {{-166, 10}, {-166, 38}, {-210, 38}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, vMsr_BC.pin_n) annotation(
    Line(points = {{-210, 30}, {-202, 30}, {-202, -10}, {-166, -10}}, color = {92, 53, 102}));
  connect(vMsr_CA.pin_p, voltageSource.pinP_phC) annotation(
    Line(points = {{-150, -10}, {-150, 30}, {-210, 30}}, color = {92, 53, 102}));
  connect(vMsr_CA.pin_n, voltageSource.pinP_phA) annotation(
    Line(points = {{-150, -30}, {-206, -30}, {-206, 44}, {-210, 44}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, iMsr_Sec_phA.pin_p) annotation(
    Line(points = {{-72, 50}, {0, 50}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, iMsr_Sec_phB.pin_p) annotation(
    Line(points = {{-72, 42}, {32, 42}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, iMsr_Sec_phC.pin_p) annotation(
    Line(points = {{-72, 34}, {-15, 34}, {-15, 28}, {0, 28}}, color = {92, 53, 102}));
  connect(iMsr_Sec_phA.pin_n, LED_Driver_1.hPin_P) annotation(
    Line(points = {{20, 50}, {74, 50}, {74, 134}, {98, 134}, {98, 134}, {98, 134}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phA.pin_n, Power_Supply_1.hPin_P) annotation(
    Line(points = {{20, 50}, {74, 50}, {74, 90}, {96, 90}, {96, 90}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phA.pin_n, Laptop_Charger_3.hPin_P) annotation(
    Line(points = {{20, 50}, {74, 50}, {74, 42}, {98, 42}, {98, 42}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phB.pin_n, Power_Supply_2.hPin_P) annotation(
    Line(points = {{52, 42}, {62, 42}, {62, -8}, {166, -8}, {166, 14}, {200, 14}, {200, 14}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_P, iMsr_Sec_phB.pin_n) annotation(
    Line(points = {{200, 60}, {166, 60}, {166, -8}, {62, -8}, {62, 42}, {52, 42}, {52, 42}}, color = {92, 53, 102}));
  connect(iMsr_Sec_phB.pin_n, Laptop_Charger_4.hPin_P) annotation(
    Line(points = {{52, 42}, {62, 42}, {62, -8}, {166, -8}, {166, -32}, {198, -32}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phC.pin_n, LED_Driver_3.hPin_P) annotation(
    Line(points = {{20, 28}, {38, 28}, {38, -18}, {100, -18}, {100, -18}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phC.pin_n, Power_Supply_3.hPin_P) annotation(
    Line(points = {{20, 28}, {38, 28}, {38, -66}, {96, -66}, {96, -66}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phC.pin_n, Laptop_Charger_5.hPin_P) annotation(
    Line(points = {{20, 28}, {38, 28}, {38, -114}, {92, -114}, {92, -114}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, vMsr_Sec_phA.pin_p) annotation(
    Line(points = {{-72, 50}, {-52, 50}, {-52, 20}, {-52, 20}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, vMsr_Sec_phB.pin_p) annotation(
    Line(points = {{-72, 42}, {-34, 42}, {-34, -2}, {-34, -2}}, color = {92, 53, 102}));
  connect(vMsr_Sec_phC.pin_p, deltaWye.pinSec_C) annotation(
    Line(points = {{-16, 20}, {-16, 20}, {-16, 34}, {-72, 34}, {-72, 34}}, color = {92, 53, 102}));
  connect(vMsr_Sec_phA.pin_n, ground2.pin) annotation(
    Line(points = {{-52, 0}, {-68, 0}, {-68, -42}, {-68, -42}}, color = {117, 80, 123}));
  connect(vMsr_Sec_phB.pin_n, ground2.pin) annotation(
    Line(points = {{-34, -22}, {-68, -22}, {-68, -42}, {-68, -42}}, color = {117, 80, 123}));
  connect(vMsr_Sec_phC.pin_n, ground2.pin) annotation(
    Line(points = {{-16, 0}, {-16, 0}, {-16, -30}, {-68, -30}, {-68, -42}, {-68, -42}}, color = {117, 80, 123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-250, -250}, {250, 250}}, initialScale = 0.1), graphics={Text(origin = {8, -14}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {146, 164}}, textString = "Scenario 1 | Data Set 1.1
No Load", fontSize = 9, horizontalAlignment = TextAlignment.Left), Text(origin = {54, -114}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {-58, 176}}, textString = "Rc: 5.0392e+03 -> 8.4e3", fontSize = 9, horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-250, -250}, {250, 250}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_1_Data_Set_1_1;