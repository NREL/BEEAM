within HPF.Test.TransformerAnalysis;
model TransformerEfficiency
  HPF.SinglePhase.Components.Resistor a_r2(r = 500) annotation (
    Placement(visible = true, transformation(origin = {92, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(Rc = 1.5117e+04, Rp = 8.3300, Rs = 0.1440, Xm = 2.3311e+03, Xp = 3.3175, Xs = 0.6197, fEC = 0.067, fOSL = 0.033, fW = 0.9) annotation (
    Placement(visible = true, transformation(origin = {-16, 12}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  inner SystemDef systemDef(hrms = {1, 3, 5, 7}) annotation (
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource a_vSrc(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation (
    Placement(visible = true, transformation(origin = {-98, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(extent = {{106, -32}, {126, -12}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor a_r3(r = 500) annotation (
    Placement(visible = true, transformation(origin = {64, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(extent = {{4, -40}, {24, -20}}, rotation = 0)));
  SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(extent = {{-108, -36}, {-88, -16}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor a_r1(r = 500) annotation (
    Placement(visible = true, transformation(origin = {60, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ground.pin, a_vSrc.pinN) annotation (
    Line(points = {{-98, -14.75}, {-98, 1}}, color = {92, 53, 102}));
  connect(a_vSrc.pinP_phC, deltaWye.pinPrim_C) annotation (
    Line(points = {{-85.5, 4}, {-43, 4}, {-43, -4}, {-32, -4}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, a_r3.pin_p) annotation (
    Line(points = {{0, 6}, {26.5, 6}, {26.5, 8}, {54, 8}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, a_r2.pin_p) annotation (
    Line(points = {{0, 18}, {40.5, 18}, {40.5, 20}, {82, 20}}, color = {92, 53, 102}));
  connect(a_vSrc.pinP_phB, deltaWye.pinPrim_B) annotation (
    Line(points = {{-85.5, 14}, {-59.75, 14}, {-59.75, 12}, {-32, 12}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points = {{0, -7}, {14, -7}, {14, -19}}, color = {117, 80, 123}));
  connect(a_vSrc.pinP_phA, deltaWye.pinPrim_A) annotation (
    Line(points = {{-85.5, 24}, {-52, 24}, {-52, 28}, {-32, 28}}, color = {92, 53, 102}));
  connect(a_r2.pin_n, ground1.pin) annotation (
    Line(points = {{102, 20}, {116, 20}, {116, -10}, {116, -10}}, color = {117, 80, 123}));
  connect(a_r3.pin_n, ground1.pin) annotation (
    Line(points = {{74, 8}, {116, 8}, {116, -10}, {116, -10}, {116, -10}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, a_r1.pin_p) annotation (
    Line(points = {{0, 31}, {27, 31}, {27, 32}, {50, 32}}, color = {92, 53, 102}));
  connect(a_r1.pin_n, ground1.pin) annotation (
    Line(points = {{70, 32}, {116, 32}, {116, -11}}, color = {117, 80, 123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
  Documentation(info = "<html><head></head><body>Transformer efficiency curve simulation model.<div><br></div><div>Sweep secondary side loads and generate efficiency curve.</div><div><br></div><div>Parametric run: OpenModelica python interface.</div><div>(generate .mat result files and read in MATLAB)</div><div>Post processing: MATLAB script.</div><div><br></div></body></html>"),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"));
end TransformerEfficiency;
