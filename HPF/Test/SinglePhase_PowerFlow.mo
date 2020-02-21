within HPF.Test;
model SinglePhase_PowerFlow
  inner HPF.SystemDef systemDef annotation (
    Placement(visible = true, transformation(origin = {-82, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource voltageSource1(vArg = {0}, vMag = {100}) annotation (
    Placement(visible = true, transformation(origin = {-60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Resistor r(r = 1.2) annotation (
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-60, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Test_components.Test_Load test_Load(P1 = 200, argS = 0.1) annotation (
    Placement(visible = true, transformation(origin = {12, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource1.pin_p, r.pin_p) annotation (
    Line(points = {{-60, 0}, {-60, 10}, {-40, 10}}));
  connect(voltageSource1.pin_n, ground.pin) annotation (
    Line(points = {{-60, -20}, {-60, -20}, {-60, -28}, {-60, -28}}, color = {117, 80, 123}));
  connect(r.pin_n, test_Load.pin_p) annotation (
    Line(points = {{-20, 10}, {2, 10}}, color = {117, 80, 123}));
  connect(test_Load.pin_n, voltageSource1.pin_n) annotation (
    Line(points = {{22, 10}, {48, 10}, {48, -20}, {-60, -20}}, color = {117, 80, 123}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Text(origin = {-74, 64}, extent = {{-20, 6}, {86, -14}}, textString = "Single Phase test:\nTesting power flow for single phase system", horizontalAlignment = TextAlignment.Left)}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end SinglePhase_PowerFlow;
