within HPF.Test.Sensors;
model ThreePh_Tfmr
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-144, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.Symmetric.D1Y     deltaWye(Rc = 8.4e3, Rp = 3.7672, Rs = 0.2576, VPrimRated = 480, VSecRated = 208, Xm = 777.0164, Xp = 1.1006, Xs = 0.5003)                                      annotation (
    Placement(visible = true, transformation(origin = {6, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {86, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:9}) annotation (
    Placement(visible = true, transformation(origin = {-72, 64}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0.52447, 5.1682, 3.4211, -1.0065, 0.96784, 0.41629, 2.8448, 3.4445, 3.1871, 0.90745, -0.24966, 0.31431, 4.8331, 0.71082, 5.0363}, vArg_phB = {4.7122, 2.6206, 0.10697, 3.1216, 0.59385, 2.7291, 0.31843, 2.2651, -0.95553, 4.5529, 1.837, 1.575, 2.8743, 2.67, 0.84628}, vArg_phC = {2.6184, 0.41931, 2.7136, 0.68112, 3.8937, 4.5726, 4.5535, -0.23802, 1.0386, 2.8111, 3.9909, 4.0865, 0.18498, 5.0872, 2.722}, vMag_phA = {281.5265, 0.54185, 0.4782, 0.82046, 0.2161, 1.0047, 0.31242, 0.06249, 0.48262, 0.16437, 0.03238, 0.11375, 0.029965, 0.027409, 0.13441}, vMag_phB = {281.5157, 0.67129, 0.61051, 1.2634, 0.29631, 0.88633, 0.34845, 0.055384, 0.44358, 0.15776, 0.034389, 0.11372, 0.068726, 0.03957, 0.10368}, vMag_phC = {281.2799, 0.38554, 0.16186, 1.0609, 0.50318, 0.76851, 0.20281, 0.099314, 0.44515, 0.079861, 0.033682, 0.18318, 0.063725, 0.039101, 0.12243}) annotation (
    Placement(visible = true, transformation(origin = {-144, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_3(P1(start = 78), S1(start = 78), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-391174-001.mat", nomP = 120, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {132, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {168, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 78) annotation (
    Placement(visible = true, transformation(origin = {168, 56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin = {106, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_4(P1(start = 90), S1(start = 90), Q1(start = 5),V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1900-15C2.mat", nomP = 90, nomV = 120, vAngle = -2.094395102393195) annotation (
    Placement(visible = true, transformation(origin = {140, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_5(P1(start = 78), S1(start = 78), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1121-12H.mat", nomP = 120, nomV = 120, vAngle = 2.094395102393195) annotation (
    Placement(visible = true, transformation(origin = {134, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 78) annotation (
    Placement(visible = true, transformation(origin = {176, -4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin = {176, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin = {170, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 78) annotation (
    Placement(visible = true, transformation(origin = {170, -64}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin = {110, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsr_PhA annotation (
    Placement(visible = true, transformation(origin = {60, -52}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.MultiSensor msrPhA annotation(
    Placement(visible = true, transformation(origin = {-32, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.MultiSensor msrPhB annotation(
    Placement(visible = true, transformation(origin = {-66, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.MultiSensor msrPhC annotation(
    Placement(visible = true, transformation(origin = {-98, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-144, -13}, {-144, -32}}, color = {117, 80, 123}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation(
    Line(points = {{142, 52}, {156, 52}, {156, 44}, {168, 44}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation(
    Line(points = {{168, 38}, {168, 46}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation(
    Line(points = {{142, 68}, {168, 68}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation(
    Line(points = {{122, 52}, {106, 52}, {106, 41.25}}, color = {117, 80, 123}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation(
    Line(points = {{144, -52}, {170, -52}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation(
    Line(points = {{144, -68}, {160, -68}, {160, -76}, {170, -76}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation(
    Line(points = {{170, -80}, {170, -74}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation(
    Line(points = {{150, 6}, {176, 6}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation(
    Line(points = {{150, -10}, {176, -10}, {176, -14}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation(
    Line(points = {{176, -20}, {176, -14}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_P, deltaWye.pinSec_A) annotation(
    Line(points = {{122, 68}, {84, 68}, {84, 19}, {22, 19}}, color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P, deltaWye.pinSec_B) annotation(
    Line(points = {{130, 6}, {22, 6}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, Laptop_Charger_5.hPin_P) annotation(
    Line(points = {{22, -6}, {98, -6}, {98, -52}, {124, -52}}, color = {92, 53, 102}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation(
    Line(points = {{110, -82}, {110, -68}, {124, -68}, {124, -67.25}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_A, vMsr_PhA.pin_p) annotation(
    Line(points = {{22, 19.2}, {60, 19.2}, {60, -42}}, color = {92, 53, 102}));
  connect(vMsr_PhA.pin_n, ground2.pin) annotation(
    Line(points = {{60, -62}, {60, -74}, {86, -74}, {86, -98.75}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{22, -19.2}, {86, -19.2}, {86, -98.75}, {86, -98.75}}, color = {117, 80, 123}));
  connect(msrPhA.hPin_NC, deltaWye.pinPrim_A) annotation(
    Line(points = {{-22, 15.8}, {-10, 15.8}}, color = {117, 80, 123}));
  connect(msrPhA.hPin_PC, voltageSource.pinP_phA) annotation(
    Line(points = {{-42, 16}, {-114, 16}, {-114, 10}, {-131.5, 10}}, color = {92, 53, 102}));
  connect(msrPhA.hPin_NV, ground.pin) annotation(
    Line(points = {{-32, 6}, {-32, -32}, {-144, -32}}, color = {117, 80, 123}));
  connect(msrPhB.hPin_NC, deltaWye.pinPrim_B) annotation(
    Line(points = {{-56, 0}, {-10, 0}}, color = {117, 80, 123}));
  connect(msrPhB.hPin_PC, voltageSource.pinP_phB) annotation(
    Line(points = {{-76, 0}, {-132, 0}}, color = {92, 53, 102}));
  connect(msrPhB.hPin_NV, ground.pin) annotation(
    Line(points = {{-66, -10}, {-66, -32}, {-144, -32}}, color = {117, 80, 123}));
  connect(msrPhC.hPin_NV, ground.pin) annotation(
    Line(points = {{-98, -26}, {-98, -32}, {-144, -32}}, color = {117, 80, 123}));
  connect(msrPhC.hPin_PC, voltageSource.pinP_phC) annotation(
    Line(points = {{-108, -16}, {-120, -16}, {-120, -10}, {-132, -10}}, color = {92, 53, 102}));
  connect(msrPhC.hPin_NC, deltaWye.pinPrim_C) annotation(
    Line(points = {{-88, -16}, {-10, -16}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.hPin_N, ground2.pin) annotation(
    Line(points = {{130, -10}, {114, -10}, {114, -42}, {86, -42}, {86, -100}}, color = {117, 80, 123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, initialScale = 0.1), graphics={  Text(origin = {-16, 135}, extent = {{-178, 23}, {178, -23}}, textString = "Simplified 3phase toy model with modified transformer.
The transformer mdl has a simplified core reactance branch.",
            horizontalAlignment =                                                   TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_INIT,LOG_NLS_RES,LOG_RES_INIT,LOG_SIMULATION,LOG_SOLVER,LOG_SOLVER_V,LOG_SOLVER_CONTEXT,LOG_SOTI,LOG_STATS,LOG_STATS_V,LOG_SUCCESS", outputFormat = "mat", s = "dassl", nls = "newton"),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst");
end ThreePh_Tfmr;