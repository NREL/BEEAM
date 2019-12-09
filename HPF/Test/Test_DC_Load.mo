within HPF.Test;

model Test_DC_Load
  HPF.DC.DC_Load dC_Load1(pwr = 50) annotation(
    Placement(visible = true, transformation(origin = {46, 16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V = 10) annotation(
    Placement(visible = true, transformation(origin = {-28, 16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-28, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 2) annotation(
    Placement(visible = true, transformation(origin = {12, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(dC_Load1.n, constantVoltage1.n) annotation(
    Line(points = {{46, 6}, {-28, 6}}, color = {0, 0, 255}));
  connect(constantVoltage1.n, ground1.p) annotation(
    Line(points = {{-28, 6}, {-28, -10}}, color = {0, 0, 255}));
  connect(constantVoltage1.p, resistor.p) annotation(
    Line(points = {{-28, 26}, {2, 26}}, color = {0, 0, 255}));
  connect(resistor.n, dC_Load1.p) annotation(
    Line(points = {{22, 26}, {46, 26}, {46, 26}, {46, 26}}, color = {0, 0, 255}));
  annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_JAC,LOG_NLS_JAC,LOG_STATS", outputFormat = "mat", s = "dassl"));
end Test_DC_Load;