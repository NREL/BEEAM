within HPF.Examples.ModelingValidation;
model Scenario_2_Data_Set_2_3_analysis_2
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-168, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {-58, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin = {-200, 50}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA = {3.7931e-05, -1.3747, 2.3203, 4.4576, 0.33338, 0.061743, 1.8595, 2.0775, 2.596, 0.078826, -0.12461, -0.070035, 0.23351, 0.39809, 0.76912}, vArg_phB = {4.1877, 2.2326, -0.46785, 2.271, -0.085554, 2.3883, -0.27274, 1.8949, -1.5378, 3.7162, 2.658, 1.5528, 3.3069, 3.8177, 3.2929}, vArg_phC = {2.0944, 0.039264, 3.081, -0.070956, 3.2809, 4.2851, 3.8663, -1.1772, 0.51965, 1.8601, 3.3803, 3.4573, 3.6469, 3.2203, 4.652}, vMag_phA = {486.6785, 1.036, 0.35126, 1.5367, 0.3716, 1.144, 0.27467, 0.01309, 0.35543, 0.12006, 0.028935, 0.042556, 0.02346, 0.023496, 0.052121}, vMag_phB = {486.4142, 1.2575, 0.61231, 2.106, 0.32711, 1.0656, 0.29567, 0.03861, 0.35203, 0.12269, 0.015397, 0.016859, 0.014564, 0.010917, 0.036942}, vMag_phC = {486.0805, 0.58812, 0.30739, 1.7486, 0.68217, 0.87821, 0.27744, 0.051501, 0.33709, 0.05818, 0.015414, 0.046161, 0.007833, 0.012964, 0.029759}) annotation (
    Placement(visible = true, transformation(origin = {-168, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_4(P1(start = 80), Q1(start = 10), S1(start = 90),V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {180, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_5(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {74, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 70.376068) annotation (
    Placement(visible = true, transformation(origin = {214, -82}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin = {214, -108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin = {152, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin = {110, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 71.420897) annotation (
    Placement(visible = true, transformation(origin = {110, -164}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin = {48, -176}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(Rc = 8e6, Rp = 0.1, Rs = 0.01, VPrimRated = 480, VSecRated = 208, Xm = 1e4, Xp = 0.4, Xs = 0.2066, fEC = 0.067, fOSL = 0.033, fW = 0.9) annotation (
    Placement(visible = true, transformation(origin = {-64, -6}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load3(pwr = 70.376068) annotation(
    Placement(visible = true, transformation(origin = {200, 28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {200, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 aC2DC_SinglePhase_New_2(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat") annotation(
    Placement(visible = true, transformation(origin = {166, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {122, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation(
    Line(points = {{84, -154}, {110, -154}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation(
    Line(points = {{84, -166}, {100, -166}, {100, -174}, {110, -174}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation(
    Line(points = {{110, -180}, {110, -174}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation(
    Line(points = {{48, -176}, {48, -166}, {64, -166}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation(
    Line(points = {{170, -84}, {169, -84}, {169, -85}, {152, -85}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation(
    Line(points = {{190, -72}, {214, -72}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation(
    Line(points = {{190, -84}, {210, -84}, {210, -88}, {214, -88}, {214, -92}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation(
    Line(points = {{214, -98}, {214, -92}}, color = {0, 0, 255}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-47, -25}, {-58, -25}, {-58, -82}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_B, Laptop_Charger_4.hPin_P) annotation(
    Line(points = {{-47, 0}, {12, 0}, {12, -72}, {170, -72}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation(
    Line(points = {{-155.5, 5.5}, {-140, 5.5}, {-140, 10}, {-80, 10}}, color = {92, 53, 102}));
  connect(deltaWye.pinPrim_B, voltageSource.pinP_phB) annotation(
    Line(points = {{-80, -6}, {-133.75, -6}, {-133.75, -2}, {-155.5, -2}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation(
    Line(points = {{-155.5, -12}, {-141.75, -12}, {-141.75, -22}, {-80, -22}}, color = {92, 53, 102}));
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-168, -15}, {-168, -35}}, color = {117, 80, 123}));
  connect(Laptop_Charger_5.hPin_P, deltaWye.pinSec_C) annotation(
    Line(points = {{64, -154}, {-38, -154}, {-38, -12}, {-48, -12}, {-48, -12}}));
  connect(aC2DC_SinglePhase_New_2.pin_n, dC_Load3.n) annotation(
    Line(points = {{176, 26}, {176, 18}, {200, 18}}, color = {0, 0, 255}));
  connect(aC2DC_SinglePhase_New_2.pin_p, dC_Load3.p) annotation(
    Line(points = {{176, 38}, {200, 38}}, color = {0, 0, 255}));
  connect(aC2DC_SinglePhase_New_2.hPin_N, ground3.pin) annotation(
    Line(points = {{156, 26}, {169, 26}, {169, 3}, {122, 3}}, color = {117, 80, 123}));
  connect(ground1.p, dC_Load3.n) annotation(
    Line(points = {{200, 12}, {200, 18}}, color = {0, 0, 255}));
  connect(deltaWye.pinSec_A, aC2DC_SinglePhase_New_2.hPin_P) annotation(
    Line(points = {{-48, 14}, {96, 14}, {96, 38}, {156, 38}, {156, 38}}, color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-230, -230}, {230, 230}}, initialScale = 0.1)),
    Icon(coordinateSystem(extent = {{-230, -230}, {230, 230}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_2_Data_Set_2_3_analysis_2;