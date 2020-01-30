within HPF.Examples.ModelingValidation;

model Scenario_1
  HPF.Sources.ThreePhase.VoltageSrc_ReadFile voltageSrc_ReadFile(fileName = "HPF/InputData/Examples/ModelingValidation/vData_Scenario_1_set_1_1.mat") annotation(
    Placement(visible = true, transformation(origin = {-82, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:7}) annotation(
    Placement(visible = true, transformation(origin = {-96, 74}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-82, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r annotation(
    Placement(visible = true, transformation(origin = {-46, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R annotation(
    Placement(visible = true, transformation(origin = {16, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R1 annotation(
    Placement(visible = true, transformation(origin = {-20, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {46, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSrc_ReadFile.pinN, ground.pin) annotation(
    Line(points = {{-82, 28}, {-82, 14}}, color = {117, 80, 123}));
  connect(voltageSrc_ReadFile.pinP_phB, r.pin_p) annotation(
    Line(points = {{-72, 46}, {-56, 46}}));
  connect(voltageSrc_ReadFile.pinP_phA, R1.pin_p) annotation(
    Line(points = {{-72, 38}, {-30, 38}}));
  connect(voltageSrc_ReadFile.pinP_phC, R.pin_p) annotation(
    Line(points = {{-72, 30}, {6, 30}}));
  connect(r.pin_n, ground1.pin) annotation(
    Line(points = {{-36, 46}, {46, 46}, {46, 22}}, color = {117, 80, 123}));
  connect(R1.pin_n, ground1.pin) annotation(
    Line(points = {{-10, 38}, {46, 38}, {46, 22}}, color = {117, 80, 123}));
  connect(R.pin_n, ground1.pin) annotation(
    Line(points = {{26, 30}, {46, 30}, {46, 22}}, color = {117, 80, 123}));
  annotation(
    Diagram(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(ls = "totalpivot", lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"));
end Scenario_1;