within HPF.Test.Sensors;
model Test_1
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:25}) annotation (
    Placement(visible = true, transformation(origin = {-107, 51.5}, extent = {{-13, -15.1667}, {13, 10.8333}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {0.1 for i in 2:systemDef.numHrm})) annotation (
    Placement(visible = true, transformation(origin = {-120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-120, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {78, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl          laptop_adapter(V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_3.mat", nomP = 100) annotation (
    Placement(visible = true, transformation(origin = {68, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop(pwr = 100) annotation (
    Placement(visible = true, transformation(origin = {100, -58}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {8, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(start_v_re = cat(1, {120}, {0.0 for i in 1:systemDef.numHrm - 1}), z = 100 - 3e-4 * j) annotation (
    Placement(visible = true, transformation(origin = {92, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {134, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Resistor r(r = 0.2) annotation (
    Placement(visible = true, transformation(origin = {-78, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor voltageSensor annotation (
    Placement(visible = true, transformation(origin = {40, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {40, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor currentSensor annotation (
    Placement(visible = true, transformation(origin = {-32, -18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.PowerMultiSensor powerMultiSensor annotation(
    Placement(visible = true, transformation(origin = {8, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(v.pin_n, ground1.pin) annotation (
    Line(points={{-120,-20},{-120,-36.75}},   color = {117, 80, 123}));
  connect(laptop_adapter.pin_n, ground2.p) annotation(
    Line(points = {{78, -64}, {78, -90}}, color = {0, 0, 255}));
  connect(laptop_adapter.pin_p, laptop.p) annotation(
    Line(points = {{78, -48}, {100, -48}}, color = {0, 0, 255}));
  connect(laptop.n, ground2.p) annotation(
    Line(points = {{100, -68}, {100, -84}, {78, -84}, {78, -88}}, color = {0, 0, 255}));
  connect(z1.pin_n, ground4.pin) annotation(
    Line(points = {{102, 8}, {134, 8}, {134, -32.75}}, color = {117, 80, 123}));
  connect(r.pin_n, z1.pin_p) annotation(
    Line(points = {{-68, 8}, {82, 8}}, color = {117, 80, 123}));
  connect(r.pin_p, v.pin_p) annotation (
    Line(points = {{-88, 8}, {-122, 8}, {-122, 0}, {-120, 0}}, color = {92, 53, 102}));
  connect(voltageSensor.pin_p, z1.pin_p) annotation(
    Line(points = {{40, 2}, {40, 8}, {82, 8}}, color = {92, 53, 102}));
  connect(voltageSensor.pin_n, ground3.pin) annotation(
    Line(points = {{40, -18}, {40, -26}}, color = {117, 80, 123}));
  connect(currentSensor.pin_p, r.pin_n) annotation(
    Line(points = {{-32, -8}, {-32, 8}, {-68, 8}}, color = {92, 53, 102}));
  connect(powerMultiSensor.pin_n, laptop_adapter.hPin_P) annotation(
    Line(points = {{18, -48}, {58, -48}}, color = {117, 80, 123}));
  connect(currentSensor.pin_n, powerMultiSensor.pin_p) annotation(
    Line(points = {{-32, -28}, {-32, -48}, {-2, -48}}, color = {117, 80, 123}));
  connect(powerMultiSensor.hPin_N, ground.pin) annotation(
    Line(points = {{8, -58}, {8, -80}}, color = {117, 80, 123}));
  connect(laptop_adapter.hPin_N, ground.pin) annotation(
    Line(points = {{58, -64}, {8, -64}, {8, -80}}, color = {117, 80, 123}));
  connect(powerMultiSensor.hPin_P, powerMultiSensor.pin_p) annotation(
    Line(points = {{8, -38}, {-2, -38}, {-2, -48}}, color = {92, 53, 102}));  protected
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-200, -200}, {200, 200}})),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(ls = "totalpivot", lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"),
  Documentation(info = "<html><head></head><body>Testing sensors on a simple circuit.<div><br></div></body></html>"));
end Test_1;