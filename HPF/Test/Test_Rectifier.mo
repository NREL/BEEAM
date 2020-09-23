within HPF.Test;
model Test_Rectifier
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(fs = 10e3, hrms={i for i in 1:2:25})    annotation (
    Placement(visible = true, transformation(origin = {-107, 51.5}, extent = {{-13, -15.1667}, {13, 10.8333}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {0.1 for i in 2:systemDef.numHrm})) annotation (
    Placement(visible = true, transformation(origin = {-120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-120, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {22, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl          laptop_adapter(P_stby = 4.8918,V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_3.mat", nomP = 100) annotation (
    Placement(visible = true, transformation(origin = {10, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop(pwr = 0.1) annotation (
    Placement(visible = true, transformation(origin = {42, -46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-40, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Impedance z1(z = 100 - 3e-4 * j) annotation (
    Placement(visible = true, transformation(origin = {8, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {78, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Resistor r(r = 0.2) annotation (
    Placement(visible = true, transformation(origin = {-78, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(v.pin_n, ground1.pin) annotation (
    Line(points={{-120,-20},{-120,-36.75}},   color = {117, 80, 123}));
  connect(laptop_adapter.pin_n, ground2.p) annotation (
    Line(points = {{20, -48}, {20, -59}, {22, -59}, {22, -68}}, color = {0, 0, 255}));
  connect(laptop_adapter.pin_p, laptop.p) annotation (
    Line(points = {{20, -36}, {42, -36}}, color = {0, 0, 255}));
  connect(laptop.n, ground2.p) annotation (
    Line(points = {{42, -56}, {42, -64}, {22, -64}, {22, -68}}, color = {0, 0, 255}));
  connect(ground.pin, laptop_adapter.hPin_N) annotation (
    Line(points={{-40,-56.75},{-40,-48},{0,-48}},     color = {92, 53, 102}));
  connect(z1.pin_n, ground4.pin) annotation (
    Line(points={{18,8},{78,8},{78,-32.75}},     color = {117, 80, 123}));
  connect(r.pin_n, z1.pin_p) annotation (
    Line(points = {{-68, 8}, {-2, 8}}, color = {117, 80, 123}));
  connect(r.pin_p, v.pin_p) annotation (
    Line(points = {{-88, 8}, {-122, 8}, {-122, 0}, {-120, 0}}, color = {92, 53, 102}));
  connect(laptop_adapter.hPin_P, r.pin_n) annotation (
    Line(points = {{0, -36}, {-44, -36}, {-44, 8}, {-68, 8}, {-68, 8}}, color = {92, 53, 102}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-200, -200}, {200, 200}})),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(ls = "totalpivot", lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end Test_Rectifier;
