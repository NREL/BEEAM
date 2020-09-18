within HPF.Examples.ModelingValidation;
model Scenario_2_Data_Set_2_2
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-58, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin = {-56, 64}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation (
    Placement(visible = true, transformation(origin = {-58, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {2, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.Symmetric.D1Y deltaWye(Rc = 15117.5, Rp = 8.333, Rs = 1.4404E-01, Xm = 2.3311e+03, Xp = 3.3002, Xs = 0.6197) annotation (
    Placement(visible = true, transformation(extent = {{-20, 0}, {0, 20}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_2(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2_3D.mat", nomP = 28) annotation (
    Placement(visible = true, transformation(origin = {176, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_1(P_DCmin = 8, P_stby = 23.34, V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1_3D.mat", nomP = 600) annotation (
    Placement(visible = true, transformation(origin = {72, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_3(P_DCmin = 2, P_stby = 0.44, V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat", nomP = 72) annotation (
    Placement(visible = true, transformation(origin = {74, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Load_1(pwr = 580.362096) annotation (
    Placement(visible = true, transformation(origin = {106, 66}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {106, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {108, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr = 72.733709) annotation (
    Placement(visible = true, transformation(origin = {108, 18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {206, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin = {48, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_3(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3_3D.mat", nomP = 28) annotation (
    Placement(visible = true, transformation(origin = {78, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_2(pwr = 27.534833) annotation (
    Placement(visible = true, transformation(origin = {206, 36}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin = {102, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_1(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1_3D.mat", nomP = 28) annotation (
    Placement(visible = true, transformation(origin = {74, 114}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_3(pwr = 26.578419) annotation (
    Placement(visible = true, transformation(origin = {102, -42}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load LED_1(pwr = 27.007361) annotation (
    Placement(visible = true, transformation(origin = {106, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin = {106, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_4(P_DCmin = 2, P_stby = 0.33, V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat", nomP = 72) annotation (
    Placement(visible = true, transformation(origin = {174, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_5(P_DCmin = 2, P_stby = 0.27, V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat", nomP = 72) annotation (
    Placement(visible = true, transformation(origin = {68, -134}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_2(P_DCmin = 10, P_stby = 4.89, V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_2_3D.mat", nomP = 1e-2) annotation (
    Placement(visible = true, transformation(origin = {176, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_3(P_DCmin = 10, P_stby = 17.7, V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_3_3D.mat", nomP = 600) annotation (
    Placement(visible = true, transformation(origin = {72, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Load_2(pwr = 1e-6) annotation (
    Placement(visible = true, transformation(origin = {208, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation (
    Placement(visible = true, transformation(origin = {208, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation (
    Placement(visible = true, transformation(origin = {102, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Load_3(pwr = 559.796403) annotation (
    Placement(visible = true, transformation(origin = {102, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load Laptop_4(pwr = 70.534021) annotation (
    Placement(visible = true, transformation(origin = {208, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin = {208, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin = {146, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin = {104, -164}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_5(pwr = 71.327585) annotation (
    Placement(visible = true, transformation(origin = {104, -138}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin = {42, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation (
    Line(points = {{-58, -2.75}, {-58, -12.75}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points = {{0, -2}, {2, -2}, {2, -16.75}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B) annotation (
    Line(points = {{-45.5, 10}, {-20, 10}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation (
    Line(points = {{-45.5, 20}, {-20, 20}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation (
    Line(points = {{-45.5, 0}, {-20, 0}}, color = {92, 53, 102}));
  connect(Power_Supply_1.pin_p, Load_1.p) annotation (
    Line(points = {{82, 76}, {106, 76}}, color = {0, 0, 255}));
  connect(ground1.p, Load_1.n) annotation (
    Line(points = {{106, 48}, {106, 56}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation (
    Line(points = {{84, 16}, {98, 16}, {98, 8}, {108, 8}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation (
    Line(points = {{108, 2}, {108, 8}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation (
    Line(points = {{84, 28}, {108, 28}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation (
    Line(points = {{64, 16}, {48, 16}, {48, 15.25}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation (
    Line(points = {{186, 46}, {206, 46}}, color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation (
    Line(points = {{206, 22}, {206, 26}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation (
    Line(points = {{88, -32}, {102, -32}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation (
    Line(points = {{88, -44}, {98, -44}, {98, -48}, {102, -48}, {102, -52}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation (
    Line(points = {{102, -58}, {102, -52}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation (
    Line(points = {{84, 120}, {106, 120}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation (
    Line(points = {{84, 108}, {97.5, 108}, {97.5, 100}, {106, 100}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation (
    Line(points = {{106, 94}, {106, 100}}, color = {0, 0, 255}));
  connect(Load_2.n, Power_Supply_2.pin_n) annotation (
    Line(points = {{208, -20}, {208, -16}, {200, -16}, {200, -12}, {186, -12}}, color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p, Load_2.p) annotation (
    Line(points = {{186, 0}, {208, 0}}, color = {0, 0, 255}));
  connect(Load_2.n, ground12.p) annotation (
    Line(points = {{208, -20}, {208, -26}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p, Load_3.p) annotation (
    Line(points = {{82, -80}, {102, -80}}, color = {0, 0, 255}));
  connect(ground13.p, Load_3.n) annotation (
    Line(points = {{102, -106}, {102, -100}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation (
    Line(points = {{186, 34}, {204, 34}, {204, 30}, {206, 30}, {206, 26}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, Laptop_5.p) annotation (
    Line(points = {{78, -128}, {104, -128}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, Laptop_5.n) annotation (
    Line(points = {{78, -140}, {94, -140}, {94, -148}, {104, -148}}, color = {0, 0, 255}));
  connect(ground18.p, Laptop_5.n) annotation (
    Line(points = {{104, -154}, {104, -148}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation (
    Line(points = {{42, -138.75}, {42, -140}, {58, -140}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation (
    Line(points = {{164, -58}, {163, -58}, {163, -58.75}, {146, -58.75}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, Laptop_4.p) annotation (
    Line(points = {{184, -46}, {208, -46}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, Laptop_4.n) annotation (
    Line(points = {{184, -58}, {204, -58}, {204, -62}, {208, -62}, {208, -66}}, color = {0, 0, 255}));
  connect(ground16.p, Laptop_4.n) annotation (
    Line(points = {{208, -72}, {208, -66}}, color = {0, 0, 255}));
  connect(Power_Supply_1.pin_n, Load_1.n) annotation (
    Line(points = {{82, 64}, {102, 64}, {102, 60}, {106, 60}, {106, 56}}, color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n, Load_3.n) annotation (
    Line(points = {{82, -92}, {92, -92}, {92, -100}, {102, -100}}, color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation (
    Line(points = {{64, 108}, {48, 108}, {48, 15.25}}, color = {117, 80, 123}));
  connect(Power_Supply_1.hPin_N, ground6.pin) annotation (
    Line(points = {{62, 64}, {48, 64}, {48, 15.25}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation (
    Line(points = {{166, 34}, {146, 34}, {146, -58.75}}, color = {117, 80, 123}));
  connect(Power_Supply_2.hPin_N, ground17.pin) annotation (
    Line(points = {{166, -12}, {146, -12}, {146, -58.75}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation (
    Line(points = {{68, -44}, {42, -44}, {42, -138.75}}, color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_N, ground19.pin) annotation (
    Line(points = {{62, -92}, {42, -92}, {42, -138.75}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, LED_Driver_1.hPin_P) annotation (
    Line(points = {{0, 22}, {32, 22}, {32, 120}, {64, 120}}, color = {92, 53, 102}));
  connect(Power_Supply_1.hPin_P, LED_Driver_1.hPin_P) annotation (
    Line(points = {{62, 76}, {32, 76}, {32, 120}, {64, 120}}, color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_P, LED_Driver_1.hPin_P) annotation (
    Line(points = {{64, 28}, {32, 28}, {32, 120}, {64, 120}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation (
    Line(points = {{0, 14}, {30, 14}, {30, -10}, {130, -10}, {130, 46}, {166, 46}}, color = {92, 53, 102}));
  connect(Power_Supply_2.hPin_P, LED_Driver_2.hPin_P) annotation (
    Line(points = {{166, 0}, {130, 0}, {130, 46}, {166, 46}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P, LED_Driver_2.hPin_P) annotation (
    Line(points = {{164, -46}, {130, -46}, {130, 46}, {166, 46}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation (
    Line(points = {{0, 6}, {20, 6}, {20, -32}, {68, -32}}, color = {92, 53, 102}));
  connect(Power_Supply_3.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points = {{62, -80}, {26, -80}, {26, -32}, {68, -32}}, color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points = {{58, -128}, {26, -128}, {26, -32}, {68, -32}}, color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-260, -220}, {260, 240}}, initialScale = 0.1), graphics = {Text(origin = {-22, 12}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {146, 164}}, textString = "Scenario 2 | Data Set 2.2
Load Phase a-n    Total Load - 700W     Load Bank 1 (78W), LED 1 (22W), Resistor 4 (600W)
Load Phase b-n    Total Load - 100W     Load Bank 2 (78W), LED 2 (22W)
Load Phase c-n    Total Load - 700W     Load Bank 3 (78W), LED 3 (22W), Resistor 4 (600W)", fontSize = 9, horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-260, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_2_Data_Set_2_2;
