within HPF.Test.ConvergenceAnalysis;

model HarmonicPQLoad_convergence
  import Modelica.ComplexMath.j;
  Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation(
    Placement(visible = true, transformation(origin = {-158, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:5}) annotation(
    Placement(visible = true, transformation(origin = {-156, 68}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-158, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Transformers.ThreePhase.Symmetric.D1Y deltaWye(Rc = 15117.5, Rp = 8.333, Rs = 1.4404E-01, Xm = 2.3311e+03, Xp = 3.3002, Xs = 0.6197) annotation(
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
  HPF.Loads.SinglePhase.HarmonicPQLoad Heater_2B(P = {193.350}, Q = {0.5}, vAngle = -2.0944) annotation(
    Placement(visible = true, transformation(origin = {68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 10 - 0.0 * j)  annotation(
    Placement(visible = true, transformation(origin = {12, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground5 annotation(
    Placement(visible = true, transformation(origin = {40, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Loads.SinglePhase.HarmonicPQLoad harmonicPQLoad(P = {193.350}, Q = {0.5}, vAngle = 0) annotation(
    Placement(visible = true, transformation(origin = {26, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  connect(Heater_2B.hPin_P, deltaWye.pinSec_B) annotation(
    Line(points = {{58, 0}, {-96, 0}}, color = {92, 53, 102}));
  connect(z.pin_p, deltaWye.pinSec_A) annotation(
    Line(points = {{2, 24}, {-28, 24}, {-28, 8}, {-96, 8}}, color = {92, 53, 102}));
  connect(z.pin_n, ground5.pin) annotation(
    Line(points = {{22, 24}, {40, 24}, {40, 16}, {40, 16}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_C, Heater_2C.hPin_P) annotation(
    Line(points = {{-96, -8}, {-18, -8}, {-18, -38}, {-4, -38}, {-4, -38}}, color = {92, 53, 102}));
  connect(harmonicPQLoad.hPin_P, deltaWye.pinSec_A) annotation(
    Line(points = {{16, 40}, {-28, 40}, {-28, 8}, {-96, 8}, {-96, 8}}, color = {92, 53, 102}));
protected
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
end HarmonicPQLoad_convergence;
