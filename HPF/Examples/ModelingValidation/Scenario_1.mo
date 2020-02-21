within HPF.Examples.ModelingValidation;
model Scenario_1

  HPF.Sources.ThreePhase.VoltageSrc_ReadFile voltageSrc_ReadFile(fileName = "HPF/InputData/Examples/ModelingValidation/vData_Scenario_1_set_1_1.mat") annotation (
    Placement(visible = true, transformation(origin = {-82, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:5}) annotation (
    Placement(visible = true, transformation(origin = {-96, 86}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-82, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R2 annotation (
    Placement(visible = true, transformation(origin = {64, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R3 annotation (
    Placement(visible = true, transformation(origin = {90, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R1 annotation (
    Placement(visible = true, transformation(origin = {42, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(fEC = 0.1, fOSL = 0.1, fW = 0.1)  annotation (
    Placement(visible = true, transformation(origin = {-6, 36}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {10, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSrc_ReadFile.pinN, ground.pin) annotation (
    Line(points = {{-82, 25.8}, {-82, 14}}, color = {117, 80, 123}));
  connect(R1.pin_n, ground1.pin) annotation (
    Line(points = {{52, 48}, {110, 48}, {110, 10}}, color = {117, 80, 123}));
  connect(R2.pin_n, ground1.pin) annotation (
    Line(points = {{74, 40}, {110, 40}, {110, 10}}, color = {117, 80, 123}));
  connect(R3.pin_n, ground1.pin) annotation (
    Line(points = {{100, 32}, {100, 10}, {110, 10}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, R1.pin_p) annotation (
    Line(points = {{4, 48}, {32, 48}, {32, 48}, {32, 48}, {32, 48}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, R2.pin_p) annotation (
    Line(points = {{4, 40}, {54, 40}, {54, 40}, {54, 40}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, R3.pin_p) annotation (
    Line(points = {{4, 32}, {80, 32}, {80, 32}, {80, 32}, {80, 32}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points = {{4, 24}, {10, 24}, {10, 14}, {10, 14}}, color = {117, 80, 123}));
  connect(voltageSrc_ReadFile.pinP_phB, deltaWye.pinPrim_A) annotation (
    Line(points = {{-72, 44}, {-42, 44}, {-42, 48}, {-16, 48}, {-16, 46}, {-16, 46}, {-16, 46}}, color = {92, 53, 102}));
  connect(voltageSrc_ReadFile.pinP_phA, deltaWye.pinPrim_B) annotation (
    Line(points = {{-72, 36}, {-16, 36}, {-16, 36}, {-16, 36}}, color = {92, 53, 102}));
  connect(voltageSrc_ReadFile.pinP_phC, deltaWye.pinPrim_C) annotation (
    Line(points = {{-72, 28}, {-38, 28}, {-38, 26}, {-16, 26}, {-16, 26}}, color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(ls = "totalpivot", lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"));
end Scenario_1;
