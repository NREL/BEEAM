within HPF.Examples.ModelingValidation;
model Scenario_2_Data_Set_2_3
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin={-208, -28},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-58, -82},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin={-200, 50},    extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA= {3.7931e-05, -1.3747, 2.3203, 4.4576, 0.33338, 0.061743, 1.8595, 2.0775, 2.596, 0.078826, -0.12461, -0.070035, 0.23351, 0.39809, 0.76912},vArg_phB= {4.1877, 2.2326, -0.46785, 2.271, -0.085554, 2.3883, -0.27274, 1.8949, -1.5378, 3.7162, 2.658, 1.5528, 3.3069, 3.8177, 3.2929},vArg_phC= {2.0944, 0.039264, 3.081, -0.070956, 3.2809, 4.2851, 3.8663, -1.1772, 0.51965, 1.8601, 3.3803, 3.4573, 3.6469, 3.2203, 4.652},vMag_phA= {486.6785, 1.036, 0.35126, 1.5367, 0.3716, 1.144, 0.27467, 0.01309, 0.35543, 0.12006, 0.028935, 0.042556, 0.02346, 0.023496, 0.052121},vMag_phB= {486.4142, 1.2575, 0.61231, 2.106, 0.32711, 1.0656, 0.29567, 0.03861, 0.35203, 0.12269, 0.015397, 0.016859, 0.014564, 0.010917, 0.036942},vMag_phC= {486.0805, 0.58812, 0.30739, 1.7486, 0.68217, 0.87821, 0.27744, 0.051501, 0.33709, 0.05818, 0.015414, 0.046161, 0.007833, 0.012964, 0.029759}) annotation (
    Placement(visible = true, transformation(origin={-208, -10},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_2(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2_3D.mat") annotation (
    Placement(visible = true, transformation(origin={182, 14},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Power_Supply_1(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1_3D.mat") annotation (
    Placement(visible = true, transformation(origin={78, 44},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin={80, -4},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_1(pwr = 231.306288) annotation (
    Placement(visible = true, transformation(origin={112,40},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={112, 12},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={114, -34},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 72.695296) annotation (
    Placement(visible = true, transformation(origin={114, -8},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={212, -14},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin={54, -22},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_3(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin={82, -64},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_2(pwr = 28.160153) annotation (
    Placement(visible = true, transformation(origin={212, 10},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={108, -94},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 LED_Driver_1(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {80, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_3(pwr = 26.981409) annotation (
    Placement(visible = true, transformation(origin={108, -68},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load LED_1(pwr = 27.601220) annotation (
    Placement(visible = true, transformation(origin = {112, 84}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin = {112, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_4(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat") annotation (
    Placement(visible = true, transformation(origin={180, -78},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_5(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat") annotation (
    Placement(visible = true, transformation(origin={74, -160},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Power_Supply_2(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_2_3D.mat") annotation (
    Placement(visible = true, transformation(origin={182, -32},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Power_Supply_3(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin={78, -112},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_2(pwr = 404.639983) annotation (
    Placement(visible = true, transformation(origin={214, -36},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation (
    Placement(visible = true, transformation(origin={214, -62},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation (
    Placement(visible = true, transformation(origin={108, -142},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 559.880252) annotation (
    Placement(visible = true, transformation(origin={108, -116},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load dC_Load1(pwr = 70.376068) annotation (
    Placement(visible = true, transformation(origin={214, -82},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={214, -108},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin={152, -96},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={110, -190},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 71.420897) annotation (
    Placement(visible = true, transformation(origin={110, -164},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin={48, -176},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phB annotation (
    Placement(visible = true, transformation(origin = {-28, -58}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phA annotation (
    Placement(visible = true, transformation(origin = {-38, -34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phC annotation (
    Placement(visible = true, transformation(origin = {-6, -34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phA annotation (
    Placement(visible = true, transformation(origin = {-12, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhA annotation (
    Placement(visible = true, transformation(origin = {-128, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhC annotation (
    Placement(visible = true, transformation(origin = {-124, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhB annotation (
    Placement(visible = true, transformation(origin = {-98, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(Rc = 3988.52, Rp = 2.78, Rs = 0.2558,VPrimRated = 480, VSecRated = 208, Xm = 750.4548, Xp = 1.1006, Xs = 0.2066,fEC = 0.067, fOSL = 0.033, fW = 0.9) annotation (
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phB annotation (
    Placement(visible = true, transformation(origin = {26, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phC annotation (
    Placement(visible = true, transformation(origin = {20, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation (
    Line(points={{-208,-20.2},{-208,-28}},    color = {117, 80, 123}));
  connect(Power_Supply_1.pin_p, Load_1.p) annotation (
    Line(points = {{88, 50}, {112, 50}}, color = {0, 0, 255}));
  connect(ground1.p, Load_1.n) annotation (
    Line(points = {{112, 22}, {112, 30}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation (
    Line(points = {{90, -10}, {104, -10}, {104, -18}, {114, -18}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation (
    Line(points = {{114, -24}, {114, -18}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation (
    Line(points = {{90, 2}, {114, 2}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation (
    Line(points = {{70, -10}, {54, -10}, {54, -22}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation (
    Line(points = {{192, 20}, {212, 20}}, color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation (
    Line(points = {{212, -4}, {212, 0}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation (
    Line(points = {{92, -58}, {108, -58}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation (
    Line(points = {{92, -70}, {104, -70}, {104, -74}, {108, -74}, {108, -78}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation (
    Line(points = {{108, -84}, {108, -78}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation (
    Line(points = {{90, 94}, {112, 94}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation (
    Line(points = {{90, 82}, {103.5, 82}, {103.5, 74}, {112, 74}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation (
    Line(points = {{112, 68}, {112, 74}}, color = {0, 0, 255}));
  connect(Load_2.n, Power_Supply_2.pin_n) annotation (
    Line(points = {{214, -46}, {214, -42}, {206, -42}, {206, -38}, {192, -38}}, color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p, Load_2.p) annotation (
    Line(points = {{192, -26}, {214, -26}}, color = {0, 0, 255}));
  connect(Load_2.n, ground12.p) annotation (
    Line(points = {{214, -46}, {214, -52}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p, dC_Load.p) annotation (
    Line(points = {{88, -106}, {108, -106}}, color = {0, 0, 255}));
  connect(ground13.p, dC_Load.n) annotation (
    Line(points = {{108, -132}, {108, -126}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation (
    Line(points = {{192, 8}, {210, 8}, {210, 4}, {212, 4}, {212, 0}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation (
    Line(points = {{84, -154}, {110, -154}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation (
    Line(points = {{84, -166}, {100, -166}, {100, -174}, {110, -174}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation (
    Line(points = {{110, -180}, {110, -174}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation (
    Line(points = {{48, -176}, {48, -166}, {64, -166}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation (
    Line(points = {{170, -84}, {169, -84}, {169, -96}, {152, -96}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation (
    Line(points = {{190, -72}, {214, -72}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation (
    Line(points = {{190, -84}, {210, -84}, {210, -88}, {214, -88}, {214, -92}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation (
    Line(points = {{214, -98}, {214, -92}}, color = {0, 0, 255}));
  connect(Power_Supply_1.pin_n, Load_1.n) annotation (
    Line(points = {{88, 38}, {108, 38}, {108, 34}, {112, 34}, {112, 30}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n, dC_Load.n) annotation (
    Line(points = {{88, -118}, {98, -118}, {98, -126}, {108, -126}}, color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation (
    Line(points = {{70, 82}, {54, 82}, {54, -22}}, color = {117, 80, 123}));
  connect(Power_Supply_1.hPin_N, ground6.pin) annotation (
    Line(points = {{68, 38}, {54, 38}, {54, -22}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation (
    Line(points = {{172, 8}, {152, 8}, {152, -96}}, color = {117, 80, 123}));
  connect(Power_Supply_2.hPin_N, ground17.pin) annotation (
    Line(points = {{172, -38}, {152, -38}, {152, -96}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation (
    Line(points = {{72, -70}, {48, -70}, {48, -176}}, color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_N, ground19.pin) annotation (
    Line(points = {{68, -118}, {48, -118}, {48, -176}}, color = {117, 80, 123}));
  connect(vMsr_Sec_phA.pin_n, ground2.pin) annotation (
    Line(points = {{-38, -44}, {-58, -44}, {-58, -82}}, color = {117, 80, 123}));
  connect(vMsr_Sec_phB.pin_n, ground2.pin) annotation (
    Line(points = {{-28, -68}, {-58, -68}, {-58, -82}}, color = {117, 80, 123}));
  connect(vMsr_Sec_phC.pin_n, ground2.pin) annotation (
    Line(points = {{-6, -44}, {-6, -72}, {-58, -72}, {-58, -82}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phA.pin_n, LED_Driver_1.hPin_P) annotation (
    Line(points = {{-2, 2}, {42, 2}, {42, 94}, {70, 94}, {70, 94}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phA.pin_n, Power_Supply_1.hPin_P) annotation (
    Line(points = {{-2, 2}, {42, 2}, {42, 50}, {68, 50}, {68, 50}}, color = {117, 80, 123}));
  connect(Laptop_Charger_3.hPin_P, iMsr_Sec_phA.pin_n) annotation (
    Line(points = {{70, 2}, {-2, 2}, {-2, 2}, {-2, 2}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, iMsr_prim_PhA.pin_p) annotation (
    Line(points = {{-198, -4}, {-172, -4}, {-172, 0}, {-138, 0}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, iMsr_prim_PhC.pin_p) annotation (
    Line(points = {{-198, -18}, {-166, -18}, {-166, -20}, {-134, -20}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, iMsr_prim_PhB.pin_p) annotation (
    Line(points={{-198,-10.2},{-154,-10.2},{-154,-10},{-108,-10}},
                                              color = {92, 53, 102}));
  connect(deltaWye.pinSec_A, iMsr_Sec_phA.pin_p) annotation (
    Line(points = {{-60, 2}, {-22, 2}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, vMsr_Sec_phC.pin_p) annotation (
    Line(points={{-60,-13.8},{-6,-13.8},{-6,-24}},    color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, vMsr_Sec_phB.pin_p) annotation (
    Line(points = {{-60, -6}, {-28, -6}, {-28, -48}}, color = {92, 53, 102}));
  connect(vMsr_Sec_phA.pin_p, deltaWye.pinSec_A) annotation (
    Line(points = {{-38, -24}, {-38, 2}, {-60, 2}}, color = {92, 53, 102}));
  connect(iMsr_prim_PhB.pin_n, deltaWye.pinPrim_B) annotation (
    Line(points = {{-88, -10}, {-80, -10}}, color = {117, 80, 123}));
  connect(iMsr_prim_PhC.pin_n, deltaWye.pinPrim_C) annotation (
    Line(points = {{-114, -20}, {-80, -20}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points = {{-60, -22}, {-60, -52}, {-58, -52}, {-58, -82}}, color = {117, 80, 123}));
  connect(iMsr_prim_PhA.pin_n, deltaWye.pinPrim_A) annotation (
    Line(points = {{-118, 0}, {-80, 0}}, color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points = {{68, -106}, {10, -106}, {10, -58}, {72, -58}}, color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points = {{64, -154}, {10, -154}, {10, -58}, {72, -58}}, color = {92, 53, 102}));
  connect(iMsr_Sec_phB.pin_p, deltaWye.pinSec_B) annotation (
    Line(points = {{16, -6}, {-60, -6}}, color = {92, 53, 102}));
  connect(iMsr_Sec_phB.pin_n, Power_Supply_2.hPin_P) annotation (
    Line(points = {{36, -6}, {40, -6}, {40, -46}, {142, -46}, {142, -26}, {172, -26}, {172, -26}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_P, iMsr_Sec_phB.pin_n) annotation (
    Line(points = {{172, 20}, {140, 20}, {140, -46}, {40, -46}, {40, -6}, {36, -6}, {36, -6}}, color = {92, 53, 102}));
  connect(iMsr_Sec_phB.pin_n, Laptop_Charger_4.hPin_P) annotation (
    Line(points = {{36, -6}, {40, -6}, {40, -46}, {136, -46}, {136, -72}, {170, -72}, {170, -72}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phC.pin_n, LED_Driver_3.hPin_P) annotation (
    Line(points = {{30, -32}, {34, -32}, {34, -58}, {72, -58}, {72, -58}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phC.pin_p, vMsr_Sec_phC.pin_p) annotation (Line(points={{10,
          -32},{8,-32},{8,-28},{6,-28},{6,-14},{-6,-14},{-6,-24}}, color={92,53,
          102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-230, -230}, {230, 230}}, initialScale = 0.1), graphics={Text(origin = {-28, 0}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {208, 154}}, textString = "Scenario 2 | Data Set 2.3
LLoad Phase a-n	Total Load - 300W		Load Bank 1 (78W), LED 1 (22W), Resistor 2 (200W)
Load Phase b-n	Total Load - 500W		Load Bank 2 (78W), LED 2 (22W), Resistor 3 (400W)
Load Phase c-n	Total Load - 700W		Load Bank 3 (78W), LED 3 (22W), Resistor 4 (600W)",
            horizontalAlignment =                                                                           TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-230, -230}, {230, 230}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_2_Data_Set_2_3;
