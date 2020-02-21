within HPF.Test;
model Test_Rectifier
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(fs = 10e3, hrms={i for i in 1:2:25})    annotation (
    Placement(visible = true, transformation(origin = {-107, 35.5}, extent = {{-13, -15.1667}, {13, 10.8333}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {0 for i in 2:systemDef.numHrm})) annotation (
    Placement(visible = true, transformation(origin = {-120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {22, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase laptop_adapter(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4.mat") annotation (
    Placement(visible = true, transformation(origin = {10, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop(pwr = 10) annotation (
    Placement(visible = true, transformation(origin = {42, -46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = 0.1 + 5 * j) annotation (
    Placement(visible = true, transformation(origin = {-82, -6.66134e-16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-28, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor currentSensor annotation (
    Placement(visible = true, transformation(origin = {-46, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Impedance z1(z = 20 + 60 * j) annotation (
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {78, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(v.pin_n, ground1.pin) annotation (
    Line(points = {{-120, -20}, {-120, -30}}, color = {117, 80, 123}));
  connect(laptop_adapter.pin_n, ground2.p) annotation (
    Line(points = {{20, -48}, {20, -59}, {22, -59}, {22, -68}}, color = {0, 0, 255}));
  connect(laptop_adapter.pin_p, laptop.p) annotation (
    Line(points = {{20, -36}, {42, -36}}, color = {0, 0, 255}));
  connect(laptop.n, ground2.p) annotation (
    Line(points = {{42, -56}, {42, -64}, {22, -64}, {22, -68}}, color = {0, 0, 255}));
  connect(v.pin_p, z.pin_p) annotation (
    Line(points = {{-120, 0}, {-92, 0}}));
  connect(ground.pin, laptop_adapter.hPin_N) annotation (
    Line(points = {{-28, -66}, {-28, -48}, {0, -48}}, color = {92, 53, 102}));
  connect(z.pin_n, currentSensor.pin_p) annotation (
    Line(points = {{-72, 0}, {-46, 0}, {-46, -10}}, color = {117, 80, 123}));
  connect(currentSensor.pin_n, laptop_adapter.hPin_P) annotation (
    Line(points = {{-46, -30}, {-46, -36}, {0, -36}}, color = {117, 80, 123}));
  connect(z.pin_n, z1.pin_p) annotation (
    Line(points = {{-72, 0}, {0, 0}}, color = {117, 80, 123}));
  connect(z1.pin_n, ground4.pin) annotation (
    Line(points = {{20, 0}, {78, 0}, {78, -44}, {78, -44}}, color = {117, 80, 123}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-200, -200}, {200, 200}})),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(ls = "totalpivot", lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"));
end Test_Rectifier;
