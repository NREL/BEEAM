within HPF.Test.Sensors;
model PowerSensor
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:3}) annotation (
    Placement(visible = true, transformation(origin = {-107, 51.5}, extent = {{-13, -15.1667}, {13, 10.8333}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {0.1 for i in 2:systemDef.numHrm})) annotation (
    Placement(visible = true, transformation(origin = {-120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-120, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-10, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(start_v_re = cat(1, {120}, {0.0 for i in 1:systemDef.numHrm - 1}), z = 100 - 3e-4 * j) annotation (
    Placement(visible = true, transformation(origin = {-10, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {22, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r(r = 0.2) annotation (
    Placement(visible = true, transformation(origin = {-78, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.CurrentSource harmonicLoad(iArg = {0.351, -2.0293, 2.4134, 1.5971, -0.068, -0.7582}, iMag = {11.3802, 6.6631, 1.8123, 1.3356, 0.6466, 0.5229}) annotation(
    Placement(visible = true, transformation(origin = {24, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  HPF.Sensors.MultiSensor multiSensor annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(v.pin_n, ground1.pin) annotation(
    Line(points = {{-120, -20}, {-120, -36.75}}, color = {117, 80, 123}));
  connect(z1.pin_n, ground4.pin) annotation(
    Line(points = {{0, 8}, {22, 8}, {22, -4}}, color = {117, 80, 123}));
  connect(r.pin_n, z1.pin_p) annotation(
    Line(points = {{-68, 8}, {-20, 8}}, color = {117, 80, 123}));
  connect(r.pin_p, v.pin_p) annotation(
    Line(points = {{-88, 8}, {-122, 8}, {-122, 0}, {-120, 0}}, color = {92, 53, 102}));
  connect(harmonicLoad.pin_n, ground.pin) annotation(
    Line(points = {{24, -50}, {24, -54}, {-10, -54}}, color = {117, 80, 123}));
  
  connect(multiSensor.hPin_PC, r.pin_n) annotation(
    Line(points = {{-20, -30}, {-46, -30}, {-46, 8}, {-68, 8}}, color = {92, 53, 102}));
  connect(multiSensor.hPin_NV, ground.pin) annotation(
    Line(points = {{-10, -40}, {-10, -54}}, color = {117, 80, 123}));
  connect(multiSensor.hPin_NC, harmonicLoad.pin_p) annotation(
    Line(points = {{0, -30}, {24, -30}}, color = {117, 80, 123}));
protected
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-200, -200}, {200, 200}})),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(ls = "totalpivot", lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"),
  Documentation(info = "<html><head></head><body>Testing sensors on a simple circuit.<div><br></div></body></html>"));
end PowerSensor;