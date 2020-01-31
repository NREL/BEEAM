within HPF.Examples.ModelingValidation;
model Scenario_1
  HPF.Sources.ThreePhase.VoltageSrc_ReadFile voltageSrc_ReadFile(fileName = "HPF/InputData/Examples/ModelingValidation/vData_Scenario_1_set_1_1.mat") annotation (
    Placement(visible = true, transformation(origin = {-82, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:7}) annotation (
    Placement(visible = true, transformation(origin = {-96, 86}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-82, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R2 annotation (
    Placement(visible = true, transformation(origin = {32, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R3 annotation (
    Placement(visible = true, transformation(origin = {58, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R1 annotation (
    Placement(visible = true, transformation(origin = {10, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {72, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {-10, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye annotation (
    Placement(visible = true, transformation(origin = {-28, 36}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
equation
  connect(voltageSrc_ReadFile.pinN, ground.pin) annotation (
    Line(points={{-82,25.8},{-82,14}},    color = {117, 80, 123}));
  connect(R1.pin_n, ground1.pin) annotation (
    Line(points = {{20, 48}, {72, 48}, {72, 16}, {72, 16}}, color = {117, 80, 123}));
  connect(R2.pin_n, ground1.pin) annotation (
    Line(points = {{42, 40}, {72, 40}, {72, 16}}, color = {117, 80, 123}));
  connect(R3.pin_n, ground1.pin) annotation (
    Line(points = {{68, 32}, {72, 32}, {72, 16}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, R1.pin_p) annotation (
    Line(points = {{-18, 48}, {0, 48}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, R2.pin_p) annotation (
    Line(points = {{-18, 40}, {22, 40}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, R3.pin_p) annotation (
    Line(points={{-18,32.2},{16,32.2},{16,32},{48,32}},
                                         color = {92, 53, 102}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points = {{-18, 24}, {-10, 24}, {-10, 16}}, color = {117, 80, 123}));
  connect(voltageSrc_ReadFile.pinP_phC, deltaWye.pinPrim_C) annotation (
    Line(points = {{-72, 28}, {-52, 28}, {-52, 26}, {-38, 26}}, color = {92, 53, 102}));
  connect(voltageSrc_ReadFile.pinP_phA, deltaWye.pinPrim_B) annotation (
    Line(points={{-71.8,36},{-38,36}},    color = {92, 53, 102}));
  connect(deltaWye.pinPrim_A, voltageSrc_ReadFile.pinP_phB) annotation (
    Line(points = {{-38, 46}, {-55, 46}, {-55, 44}, {-72, 44}}, color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(ls = "totalpivot", lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"));
end Scenario_1;
