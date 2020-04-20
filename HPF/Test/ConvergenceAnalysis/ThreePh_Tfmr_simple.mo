within HPF.Test.ConvergenceAnalysis;

model ThreePh_Tfmr_simple
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-186, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(Rc = 8.4e3, Rp = 3.7672, Rs = 0.2576, VPrimRated = 480, VSecRated = 208, Xm = 777.0164, Xp = 1.1006, Xs = 0.5003, fEC = 0.067, fOSL = 0.033, fW = 0.9) annotation(
    Placement(visible = true, transformation(origin = {-42, -4}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-26, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:5}) annotation(
    Placement(visible = true, transformation(origin = {-176, 60}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA = {0.52447, 5.1682, 3.4211, -1.0065, 0.96784, 0.41629, 2.8448, 3.4445, 3.1871, 0.90745, -0.24966, 0.31431, 4.8331, 0.71082, 5.0363}, vArg_phB = {4.7122, 2.6206, 0.10697, 3.1216, 0.59385, 2.7291, 0.31843, 2.2651, -0.95553, 4.5529, 1.837, 1.575, 2.8743, 2.67, 0.84628}, vArg_phC = {2.6184, 0.41931, 2.7136, 0.68112, 3.8937, 4.5726, 4.5535, -0.23802, 1.0386, 2.8111, 3.9909, 4.0865, 0.18498, 5.0872, 2.722}, vMag_phA = {281.5265, 0.54185, 0.4782, 0.82046, 0.2161, 1.0047, 0.31242, 0.06249, 0.48262, 0.16437, 0.03238, 0.11375, 0.029965, 0.027409, 0.13441}, vMag_phB = {281.5157, 0.67129, 0.61051, 1.2634, 0.29631, 0.88633, 0.34845, 0.055384, 0.44358, 0.15776, 0.034389, 0.11372, 0.068726, 0.03957, 0.10368}, vMag_phC = {281.2799, 0.38554, 0.16186, 1.0609, 0.50318, 0.76851, 0.20281, 0.099314, 0.44515, 0.079861, 0.033682, 0.18318, 0.063725, 0.039101, 0.12243}) annotation(
    Placement(visible = true, transformation(origin = {-186, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_InitiMdl Laptop_Charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat", nomP = 78) annotation(
    Placement(visible = true, transformation(origin = {42, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {78, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 78) annotation(
    Placement(visible = true, transformation(origin = {78, 48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground6 annotation(
    Placement(visible = true, transformation(origin = {16, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhA annotation(
    Placement(visible = true, transformation(origin = {-100, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_InitiMdl Laptop_Charger_4(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat", nomP = 78) annotation(
    Placement(visible = true, transformation(origin = {124, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_InitiMdl Laptop_Charger_5(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat", nomP = 78) annotation(
    Placement(visible = true, transformation(origin = {22, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 78) annotation(
    Placement(visible = true, transformation(origin = {158, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation(
    Placement(visible = true, transformation(origin = {158, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation(
    Placement(visible = true, transformation(origin = {96, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation(
    Placement(visible = true, transformation(origin = {58, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 78) annotation(
    Placement(visible = true, transformation(origin = {58, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation(
    Placement(visible = true, transformation(origin = {-2, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhB annotation(
    Placement(visible = true, transformation(origin = {-74, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhC annotation(
    Placement(visible = true, transformation(origin = {-96, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsr_AB annotation(
    Placement(visible = true, transformation(origin = {-148, -28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_BC annotation(
    Placement(visible = true, transformation(origin = {-130, -38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_CA annotation(
    Placement(visible = true, transformation(origin = {-114, -58}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-186, -15}, {-186, -23}}, color = {117, 80, 123}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation(
    Line(points = {{52, 46}, {66, 46}, {66, 38}, {78, 38}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation(
    Line(points = {{78, 30}, {78, 38}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation(
    Line(points = {{52, 58}, {78, 58}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation(
    Line(points = {{32, 46}, {16, 46}, {16, 24}}, color = {117, 80, 123}));
  connect(iMsr_prim_PhA.pin_n, deltaWye.pinPrim_A) annotation(
    Line(points = {{-90, 12}, {-58, 12}}, color = {117, 80, 123}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation(
    Line(points = {{32, -10}, {58, -10}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation(
    Line(points = {{32, -22}, {48, -22}, {48, -30}, {58, -30}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation(
    Line(points = {{58, -36}, {58, -30}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation(
    Line(points = {{134, 2}, {158, 2}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation(
    Line(points = {{134, -10}, {154, -10}, {154, -14}, {158, -14}, {158, -18}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation(
    Line(points = {{158, -24}, {158, -18}}, color = {0, 0, 255}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-25, -23}, {-28.5, -23}, {-28.5, -49}, {-26, -49}}, color = {117, 80, 123}));
  connect(Laptop_Charger_3.hPin_P, deltaWye.pinSec_A) annotation(
    Line(points = {{32, 58}, {2, 58}, {2, 15}, {-25, 15}}, color = {92, 53, 102}));
  connect(iMsr_prim_PhC.pin_n, deltaWye.pinPrim_C) annotation(
    Line(points = {{-86, -20}, {-58, -20}}, color = {117, 80, 123}));
  connect(iMsr_prim_PhB.pin_n, deltaWye.pinPrim_B) annotation(
    Line(points = {{-64, -4}, {-58, -4}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phB, iMsr_prim_PhB.pin_p) annotation(
    Line(points = {{-173.5, -2}, {-128, -2}, {-128, -4}, {-84, -4}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, iMsr_prim_PhA.pin_p) annotation(
    Line(points = {{-173.5, 5.5}, {-150, 5.5}, {-150, 12}, {-110, 12}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, iMsr_prim_PhC.pin_p) annotation(
    Line(points = {{-173.5, -12}, {-114, -12}, {-114, -20}, {-106, -20}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, vMsr_AB.pin_p) annotation(
    Line(points = {{-173.5, 5.5}, {-148, 5.5}, {-148, -18}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, vMsr_AB.pin_n) annotation(
    Line(points = {{-173.5, -2}, {-162, -2}, {-162, -38}, {-148, -38}}, color = {92, 53, 102}));
  connect(vMsr_BC.pin_p, voltageSource.pinP_phB) annotation(
    Line(points = {{-130, -28}, {-130, -2}, {-173.5, -2}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, vMsr_BC.pin_n) annotation(
    Line(points = {{-173.5, -12}, {-166, -12}, {-166, -48}, {-130, -48}}, color = {92, 53, 102}));
  connect(vMsr_CA.pin_p, voltageSource.pinP_phC) annotation(
    Line(points = {{-114, -48}, {-114, -12}, {-173.5, -12}}, color = {92, 53, 102}));
  connect(vMsr_CA.pin_n, voltageSource.pinP_phA) annotation(
    Line(points = {{-114, -68}, {-114, -72}, {-170, -72}, {-170, 5.5}, {-173.5, 5.5}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.hPin_P, deltaWye.pinSec_B) annotation(
    Line(points = {{114, 2}, {-25, 2}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation(
    Line(points = {{114, -10}, {96, -10}, {96, -22}, {96, -22}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_C, Laptop_Charger_5.hPin_P) annotation(
    Line(points = {{-26, -10}, {12, -10}}, color = {92, 53, 102}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation(
    Line(points = {{-2, -36.75}, {-2, -36.75}, {-2, -22.75}, {12, -22.75}, {12, -22.75}}, color = {92, 53, 102}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, initialScale = 0.1)),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_NLS,LOG_NLS_V,LOG_NLS_JAC,LOG_NLS_JAC_TEST,LOG_NLS_RES,LOG_STATS", outputFormat = "mat", s = "dassl", nls = "newton"),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ");
end ThreePh_Tfmr_simple;