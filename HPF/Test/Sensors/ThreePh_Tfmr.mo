within HPF.Test.Sensors;
model ThreePh_Tfmr
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-160, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye_test deltaWye(Rc = 8.4e3, Rp = 3.7672, Rs = 0.2576, VPrimRated = 480, VSecRated = 208, Xm = 777.0164, Xp = 1.1006, Xs = 0.5003, fEC = 0.067, fOSL = 0.033, fW = 0.9) annotation (
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:9}) annotation (
    Placement(visible = true, transformation(origin = {-158, 64}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA = {0.52447, 5.1682, 3.4211, -1.0065, 0.96784, 0.41629, 2.8448, 3.4445, 3.1871, 0.90745, -0.24966, 0.31431, 4.8331, 0.71082, 5.0363}, vArg_phB = {4.7122, 2.6206, 0.10697, 3.1216, 0.59385, 2.7291, 0.31843, 2.2651, -0.95553, 4.5529, 1.837, 1.575, 2.8743, 2.67, 0.84628}, vArg_phC = {2.6184, 0.41931, 2.7136, 0.68112, 3.8937, 4.5726, 4.5535, -0.23802, 1.0386, 2.8111, 3.9909, 4.0865, 0.18498, 5.0872, 2.722}, vMag_phA = {281.5265, 0.54185, 0.4782, 0.82046, 0.2161, 1.0047, 0.31242, 0.06249, 0.48262, 0.16437, 0.03238, 0.11375, 0.029965, 0.027409, 0.13441}, vMag_phB = {281.5157, 0.67129, 0.61051, 1.2634, 0.29631, 0.88633, 0.34845, 0.055384, 0.44358, 0.15776, 0.034389, 0.11372, 0.068726, 0.03957, 0.10368}, vMag_phC = {281.2799, 0.38554, 0.16186, 1.0609, 0.50318, 0.76851, 0.20281, 0.099314, 0.44515, 0.079861, 0.033682, 0.18318, 0.063725, 0.039101, 0.12243}) annotation (
    Placement(visible = true, transformation(origin = {-160, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat", nomP = 78) annotation (
    Placement(visible = true, transformation(origin = {60, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {96, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 78) annotation (
    Placement(visible = true, transformation(origin = {96, 52}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin = {34, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_4(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat", nomP = 78) annotation (
    Placement(visible = true, transformation(origin = {142, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_5(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat", nomP = 78) annotation (
    Placement(visible = true, transformation(origin = {64, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 78) annotation (
    Placement(visible = true, transformation(origin = {176, -4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin = {176, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin = {122, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin = {100, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 78) annotation (
    Placement(visible = true, transformation(origin = {100, -16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin = {40, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsr_PhA annotation (
    Placement(visible = true, transformation(origin = {-26, -52}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor voltageSensor annotation (
    Placement(visible = true, transformation(origin = {-54, -58}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-56, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation (
    Line(points = {{-160, -13}, {-160, -29}}, color = {117, 80, 123}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation (
    Line(points = {{70, 50}, {84, 50}, {84, 42}, {96, 42}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation (
    Line(points = {{96, 34}, {96, 42}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation (
    Line(points = {{70, 62}, {96, 62}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation (
    Line(points = {{50, 50}, {34, 50}, {34, 28}}, color = {117, 80, 123}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation (
    Line(points = {{74, -6}, {100, -6}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation (
    Line(points = {{74, -18}, {90, -18}, {90, -26}, {100, -26}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation (
    Line(points = {{100, -32}, {100, -26}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation (
    Line(points = {{152, 6}, {176, 6}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation (
    Line(points = {{152, -6}, {172, -6}, {172, -10}, {176, -10}, {176, -14}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation (
    Line(points = {{176, -20}, {176, -14}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_P, deltaWye.pinSec_A) annotation (
    Line(points = {{50, 62}, {20, 62}, {20, 19}, {-63, 19}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P, deltaWye.pinSec_B) annotation (
    Line(points = {{132, 6}, {-63, 6}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation (
    Line(points = {{132, -6}, {132, -6.5}, {122, -6.5}, {122, -23}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_C, Laptop_Charger_5.hPin_P) annotation (
    Line(points = {{-63, -6}, {54, -6}}, color = {92, 53, 102}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation (
    Line(points = {{40, -33}, {40, -18.75}, {54, -18.75}, {54, -18}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation (
    Line(points = {{-147.5, 7.5}, {-98, 7.5}, {-98, 16}, {-96, 16}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B) annotation (
    Line(points = {{-147.5, 0}, {-96, 0}}, color = {92, 53, 102}));
  connect(deltaWye.pinPrim_C, voltageSource.pinP_phC) annotation (
    Line(points = {{-96, -16}, {-121.75, -16}, {-121.75, -10}, {-147.5, -10}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_A, vMsr_PhA.pin_p) annotation (
    Line(points = {{-64, 20}, {-26, 20}, {-26, -42}}, color = {92, 53, 102}));
  connect(vMsr_PhA.pin_n, ground2.pin) annotation (
    Line(points = {{-26, -62}, {-26, -74}, {0, -74}, {0, -99}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points = {{-64, -20}, {0, -20}, {0, -98}, {0, -98}}, color = {117, 80, 123}));
  connect(voltageSensor.pin_p, deltaWye.pinSec_B) annotation (
    Line(points = {{-54, -48}, {-52, -48}, {-52, 6}, {-64, 6}, {-64, 6}}, color = {92, 53, 102}));
  connect(voltageSensor.pin_n, ground1.pin) annotation (
    Line(points = {{-54, -68}, {-56, -68}, {-56, -86}, {-56, -86}, {-56, -86}}, color = {117, 80, 123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, initialScale = 0.1), graphics = {Text(origin = {-16, 135}, extent = {{-178, 23}, {178, -23}}, textString = "Simplified 3phase toy model with modified transformer.
The transformer mdl has a simplified core reactance branch.", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_INIT,LOG_NLS_RES,LOG_RES_INIT,LOG_SIMULATION,LOG_SOLVER,LOG_SOLVER_V,LOG_SOLVER_CONTEXT,LOG_SOTI,LOG_STATS,LOG_STATS_V,LOG_SUCCESS", outputFormat = "mat", s = "dassl", nls = "newton"),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst");
end ThreePh_Tfmr;
