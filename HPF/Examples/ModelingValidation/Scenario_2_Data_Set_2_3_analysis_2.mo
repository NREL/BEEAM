within HPF.Examples.ModelingValidation;
model Scenario_2_Data_Set_2_3_analysis_2
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-170, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {-44, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:3}) annotation (
    Placement(visible = true, transformation(origin = {-200, 50}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA ={0.52499, -0.88841, 3.4872, -0.94808, 0.85909, 0.52945, 2.6655, 3.5892, 3.2065, 0.94815, -0.35511, 0.37935, 5.1097, 0.40428, -0.95003},vArg_phB ={4.7124, 2.7285, 0.15651, 3.1172, 0.62717, 2.8404, 0.3399, 2.4464, -0.96217, 4.5697, 1.7365, 1.7654, 3.0041, 2.7107, 0.80607},vArg_phC ={2.6198, 0.43868, 2.8011, 0.69877, 3.8703, 4.722, 4.5694, -0.318, 1.0873, 2.7087, 3.9677, 4.1386, 0.25782, -1.0032, 2.9098},vMag_phA ={281.8926, 0.52366, 0.38862, 0.86889, 0.1986, 0.94358, 0.36557, 0.026172, 0.40802, 0.14926, 0.033798, 0.10907, 0.020583, 0.016168, 0.094782},vMag_phB ={281.5477, 0.6757, 0.51619, 1.3095, 0.26078, 0.86039, 0.39031, 0.051013, 0.3918, 0.15365, 0.039917, 0.09168, 0.053936, 0.028169, 0.072528},vMag_phC ={281.4037, 0.32832, 0.15324, 1.0483, 0.45472, 0.73298, 0.30034, 0.06761, 0.39297, 0.071917, 0.037663, 0.15445, 0.046989, 0.021181, 0.10834}) annotation (
    Placement(visible = true, transformation(origin = {-168, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_4(P1(start = 80), Q1(start = -10), S1(start = 90),V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {106, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 Laptop_Charger_5(P1(start = 100),Q1(start = -10), S1(start = 140),V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {12, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 70.376068) annotation (
    Placement(visible = true, transformation(origin = {140, -16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin = {140, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin = {78, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin = {48, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 71.420897) annotation (
    Placement(visible = true, transformation(origin = {48, -32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin = {-14, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(Rc = 1e10, Rp = 1e-6, Rs = 1e-6, VPrimRated = 480, VSecRated = 208, Xm = 1e10, Xp = 1e-6, Xs = 1e-6, fEC = 0, fOSL = 0, fW = 1) annotation (
    Placement(visible = true, transformation(origin = {-64, -6}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load3(pwr = 70.376068) annotation(
    Placement(visible = true, transformation(origin = {108, 42}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {108, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 aC2DC_SinglePhase_New_2(P1(start = 100), Q1(start = -40), S1(start = 120),V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat") annotation(
    Placement(visible = true, transformation(origin = {72, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {48, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation(
    Line(points = {{22, -22}, {48, -22}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation(
    Line(points = {{22, -34}, {48, -34}, {48, -42}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation(
    Line(points = {{48, -48}, {48, -42}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation(
    Line(points = {{-14, -33}, {-14, -34}, {2, -34}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation(
    Line(points = {{116, -6}, {140, -6}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation(
    Line(points = {{116, -18}, {140, -18}, {140, -26}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation(
    Line(points = {{140, -32}, {140, -26}}, color = {0, 0, 255}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-47, -25}, {-44, -25}, {-44, -59}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_B, Laptop_Charger_4.hPin_P) annotation(
    Line(points = {{-47, 0}, {12, 0}, {12, -6}, {96, -6}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation(
    Line(points = {{-155.5, 5.5}, {-140, 5.5}, {-140, 10}, {-80, 10}}, color = {92, 53, 102}));
  connect(deltaWye.pinPrim_B, voltageSource.pinP_phB) annotation(
    Line(points = {{-80, -6}, {-133.75, -6}, {-133.75, -2}, {-155.5, -2}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation(
    Line(points = {{-155.5, -12}, {-141.75, -12}, {-141.75, -22}, {-80, -22}}, color = {92, 53, 102}));
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-168, -15}, {-168, -25}, {-170, -25}, {-170, -31}}, color = {117, 80, 123}));
  connect(Laptop_Charger_5.hPin_P, deltaWye.pinSec_C) annotation(
    Line(points = {{2, -22}, {2, -12}, {-48, -12}}));
  connect(aC2DC_SinglePhase_New_2.pin_n, dC_Load3.n) annotation(
    Line(points = {{82, 40}, {82, 32}, {108, 32}}, color = {0, 0, 255}));
  connect(aC2DC_SinglePhase_New_2.pin_p, dC_Load3.p) annotation(
    Line(points = {{82, 52}, {108, 52}}, color = {0, 0, 255}));
  connect(ground1.p, dC_Load3.n) annotation(
    Line(points = {{108, 24}, {108, 32}}, color = {0, 0, 255}));
  connect(aC2DC_SinglePhase_New_2.hPin_N, ground3.pin) annotation(
    Line(points = {{62, 40}, {48, 40}, {48, 25}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, aC2DC_SinglePhase_New_2.hPin_P) annotation(
    Line(points = {{-48, 14}, {8, 14}, {8, 52}, {62, 52}}, color = {92, 53, 102}));
  connect(ground17.pin, Laptop_Charger_4.hPin_N) annotation(
    Line(points = {{78, -18}, {96, -18}, {96, -18}, {96, -18}, {96, -18}}, color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-230, -230}, {230, 230}}, initialScale = 0.1)),
    Icon(coordinateSystem(extent = {{-230, -230}, {230, 230}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_NLS,LOG_RES_INIT,LOG_SOLVER,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ");
end Scenario_2_Data_Set_2_3_analysis_2;