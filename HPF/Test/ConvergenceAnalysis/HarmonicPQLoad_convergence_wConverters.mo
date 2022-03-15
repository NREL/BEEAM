within HPF.Test.ConvergenceAnalysis;

model HarmonicPQLoad_convergence_wConverters
  import Modelica.ComplexMath.j;
  HPF.Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation(
    Placement(visible = true, transformation(origin = {-158, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:5}) annotation(
    Placement(visible = true, transformation(origin = {-156, 68}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-158, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.Symmetric.D1Y deltaWye(Rc = 15117.5, Rp = 8.333, Rs = 1.4404E-01, Xm = 2.3311e+03, Xp = 3.3002, Xs = 0.6197) annotation(
    Placement(visible = true, transformation(extent = {{-116, -14}, {-96, 6}}, rotation = 0)));
  HPF.Loads.SinglePhase.HarmonicPQLoad Heater_2C(P = {396.256}, vAngle = 2.0944) annotation(
    Placement(visible = true, transformation(origin = {6, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsrSecPhB annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {-52, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsrSecPhA annotation(
    Placement(visible = true, transformation(origin = {-52, 48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {-68, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsrSecPhC annotation(
    Placement(visible = true, transformation(origin = {-68, -38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load Latop_5(pwr = 66.042) annotation(
    Placement(visible = true, transformation(origin = {16, -76}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation(
    Placement(visible = true, transformation(origin = {16, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_5(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.27, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1121-12H.mat", nomP = 120, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {-20, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground19 annotation(
    Placement(visible = true, transformation(origin = {-46, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 66.042) annotation(
    Placement(visible = true, transformation(origin = {138, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground5 annotation(
    Placement(visible = true, transformation(origin = {138, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground6 annotation(
    Placement(visible = true, transformation(origin = {76, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl aCDC_EmpMdl(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.27, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1121-12H.mat", nomP = 120, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {102, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 66.042) annotation(
    Placement(visible = true, transformation(origin = {52, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground7 annotation(
    Placement(visible = true, transformation(origin = {52, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground8 annotation(
    Placement(visible = true, transformation(origin = {-10, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl aCDC_EmpMdl1(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.27, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1121-12H.mat", nomP = 120, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {16, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Loads.SinglePhase.HarmonicPQLoad Heater_1A(P = {193.350}) annotation(
    Placement(visible = true, transformation(origin = {22, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation(
    Line(points = {{-145.5, -14}, {-116, -14}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B) annotation(
    Line(points = {{-145.5, -4}, {-116, -4}}, color = {92, 53, 102}));
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-158, -16.75}, {-158, -28}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation(
    Line(points = {{-96, -16}, {-92, -16}, {-92, -32}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation(
    Line(points = {{-145.5, 6}, {-116, 6}}, color = {92, 53, 102}));
  connect(Heater_2C.hPin_P, deltaWye.pinSec_C) annotation(
    Line(points = {{-5, -38}, {-34, -38}, {-34, -8}, {-96, -8}}, color = {92, 53, 102}));
  connect(vMsrSecPhB.pin_n, ground1.pin) annotation(
    Line(points = {{40, -30}, {40, -40}}, color = {117, 80, 123}));
  connect(vMsrSecPhB.pin_p, deltaWye.pinSec_B) annotation(
    Line(points = {{40, -10}, {40, 0}, {-96, 0}}, color = {92, 53, 102}));
  connect(vMsrSecPhA.pin_n, ground3.pin) annotation(
    Line(points = {{-52, 38}, {-52, 28}}, color = {117, 80, 123}));
  connect(vMsrSecPhA.pin_p, deltaWye.pinSec_A) annotation(
    Line(points = {{-52, 58}, {-52, 58}, {-52, 64}, {-78, 64}, {-78, 8}, {-96, 8}, {-96, 8}}, color = {92, 53, 102}));
  connect(vMsrSecPhC.pin_n, ground4.pin) annotation(
    Line(points = {{-68, -48}, {-68, -58}}, color = {117, 80, 123}));
  connect(vMsrSecPhC.pin_p, deltaWye.pinSec_C) annotation(
    Line(points = {{-68, -28}, {-68, -28}, {-68, -8}, {-96, -8}, {-96, -8}}, color = {92, 53, 102}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation(
    Line(points = {{-46, -90}, {-46, -78}, {-30, -78}}, color = {92, 53, 102}));
  connect(Laptop_Charger_5.pin_n, Latop_5.n) annotation(
    Line(points = {{-10, -78}, {6, -78}, {6, -86}, {16, -86}}, color = {0, 0, 255}));
  connect(ground18.p, Latop_5.n) annotation(
    Line(points = {{16, -92}, {16, -86}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, Latop_5.p) annotation(
    Line(points = {{-10, -66}, {16, -66}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.hPin_P, Heater_2C.hPin_P) annotation(
    Line(points = {{-30, -66}, {-34, -66}, {-34, -38}, {-4, -38}}, color = {92, 53, 102}));
  connect(ground5.p, dC_Load.n) annotation(
    Line(points = {{138, -46}, {138, -40}}, color = {0, 0, 255}));
  connect(aCDC_EmpMdl.pin_p, dC_Load.p) annotation(
    Line(points = {{112, -20}, {138, -20}}, color = {0, 0, 255}));
  connect(aCDC_EmpMdl.pin_n, dC_Load.n) annotation(
    Line(points = {{112, -32}, {128, -32}, {128, -40}, {138, -40}}, color = {0, 0, 255}));
  connect(ground6.pin, aCDC_EmpMdl.hPin_N) annotation(
    Line(points = {{76, -44}, {76, -32}, {92, -32}}, color = {92, 53, 102}));
  connect(ground7.p, dC_Load1.n) annotation(
    Line(points = {{52, 44}, {52, 50}}, color = {0, 0, 255}));
  connect(aCDC_EmpMdl1.pin_p, dC_Load1.p) annotation(
    Line(points = {{26, 70}, {52, 70}}, color = {0, 0, 255}));
  connect(aCDC_EmpMdl1.pin_n, dC_Load1.n) annotation(
    Line(points = {{26, 58}, {42, 58}, {42, 50}, {52, 50}}, color = {0, 0, 255}));
  connect(ground8.pin, aCDC_EmpMdl1.hPin_N) annotation(
    Line(points = {{-10, 46}, {-10, 58}, {6, 58}}, color = {92, 53, 102}));
  connect(aCDC_EmpMdl1.hPin_P, Heater_1A.hPin_P) annotation(
    Line(points = {{6, 70}, {0, 70}, {0, 28}, {11, 28}}, color = {92, 53, 102}));
  connect(Heater_1A.hPin_P, deltaWye.pinSec_A) annotation(
    Line(points = {{11, 28}, {0, 28}, {0, 8}, {-96, 8}}, color = {92, 53, 102}));
  connect(aCDC_EmpMdl.hPin_P, deltaWye.pinSec_B) annotation(
    Line(points = {{92, -20}, {70, -20}, {70, 0}, {-96, 0}, {-96, 0}}, color = {92, 53, 102}));
  annotation(
    Diagram(coordinateSystem(extent = {{-280, -220}, {260, 240}}, initialScale = 0.1), graphics = {Text(lineColor = {28, 108, 200}, extent = {{-258, 182}, {182, 136}}, textString = "Data Set 4.3
	Load Phase a-n	Total Load - 300W	Laptop Charger 3 + LED Driver 1	Load Bank 1 (78W), LED 1 (22W), Heater 1 - A (200W)
	Load Phase b-n	Total Load - 500W	Laptop Charger 4 + LED Driver 2	Load Bank 2 (78W), LED 2 (22W), Heater 2 - B (400W)
	Load Phase c-n	Total Load - 700W	Laptop Charger 5 + LED Driver 3	Load Bank 3 (78W), LED 3 (22W), Heater 1 - C (200W), Heater 2 - C (400W)
    ", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-280, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_INIT,LOG_NLS,LOG_NLS_V,LOG_NLS_RES,LOG_RES_INIT,LOG_SOTI,LOG_STATS", s = "dassl", ls = "totalpivot", nls = "newton", outputFormat = "mat"),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization  -d=aliasConflicts");
end HarmonicPQLoad_convergence_wConverters;