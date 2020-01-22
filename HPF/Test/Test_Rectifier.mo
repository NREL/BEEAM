within HPF.Test;
model Test_Rectifier
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(fs = 10e3, hrms={i for i in 1:2:30})    annotation (
    Placement(visible = true, transformation(origin = {-109, 37.5}, extent = {{-13, -15.1667}, {13, 10.8333}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {1e-3 for i in 2:systemDef.numHrm})) annotation (
    Placement(visible = true, transformation(origin = {-120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {8, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase laptop_adapter(V_Rect = 24, efficiency = 0.9, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_laptop.mat") annotation (
    Placement(visible = true, transformation(origin = {-8, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop(pwr = 50) annotation (
    Placement(visible = true, transformation(origin = {30, -48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = 0.1 + 0.23 * j) annotation (
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 0.6 + 2 * j) annotation (
    Placement(visible = true, transformation(origin = {46, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.Ammeter_Freq2Time ammeter_Freq2Time annotation(
    Placement(visible = true, transformation(origin = {-38, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(v.pin_n, ground1.pin) annotation (
    Line(points = {{-120, -20}, {-120, -30}}, color = {117, 80, 123}));
  connect(laptop_adapter.pin_n, ground2.p) annotation (
    Line(points = {{2, -50}, {8, -50}, {8, -68}}, color = {0, 0, 255}));
  connect(laptop_adapter.pin_p, laptop.p) annotation (
    Line(points = {{2, -38}, {30, -38}}, color = {0, 0, 255}));
  connect(laptop.n, ground2.p) annotation (
    Line(points = {{30, -58}, {30, -64}, {8, -64}, {8, -68}}, color = {0, 0, 255}));
  connect(laptop_adapter.hPin_N, v.pin_n) annotation (
    Line(points = {{-18, -50}, {-65, -50}, {-65, -20}, {-120, -20}}, color = {117, 80, 123}));
  connect(z1.pin_n, ground1.pin) annotation (
    Line(points = {{56, 0}, {66, 0}, {66, -80}, {-98, -80}, {-98, -30}, {-120, -30}}, color = {117, 80, 123}));
  connect(z.pin_n, z1.pin_p) annotation(
    Line(points = {{-70, 0}, {36, 0}}, color = {117, 80, 123}));
  connect(v.pin_p, z.pin_p) annotation(
    Line(points = {{-120, 0}, {-90, 0}}));
  connect(ammeter_Freq2Time.pin_n, laptop_adapter.hPin_P) annotation(
    Line(points = {{-28, -16}, {-24, -16}, {-24, -38}, {-18, -38}, {-18, -38}}, color = {117, 80, 123}));
  connect(ammeter_Freq2Time.pin_p, z.pin_n) annotation(
    Line(points = {{-48, -16}, {-52, -16}, {-52, 0}, {-70, 0}, {-70, 0}}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-200, -200}, {200, 200}})),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(ls = "totalpivot", lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"));
end Test_Rectifier;