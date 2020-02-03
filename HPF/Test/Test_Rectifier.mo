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
  HPF.DC.DC_Load laptop(pwr = 500) annotation (
    Placement(visible = true, transformation(origin = {42, -48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = 0.1 + 0.23 * j) annotation (
    Placement(visible = true, transformation(origin = {-82, -6.66134e-16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 20 + 2 * j) annotation (
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-28, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.Voltmeter_Freq2Time voltmeter_Freq2Time annotation(
    Placement(visible = true, transformation(origin = {-142, -14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.Voltmeter_Freq2Time voltmeter_Freq2Time1 annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {-70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {78, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.Ammeter_Freq2Time ammeter_Freq2Time annotation(
    Placement(visible = true, transformation(origin = {-36, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(v.pin_n, ground1.pin) annotation(
    Line(points = {{-120, -20}, {-120, -30}}, color = {117, 80, 123}));
  connect(laptop_adapter.pin_n, ground2.p) annotation(
    Line(points = {{20, -48}, {20, -59}, {22, -59}, {22, -68}}, color = {0, 0, 255}));
  connect(laptop_adapter.pin_p, laptop.p) annotation(
    Line(points = {{20, -36}, {31, -36}, {31, -38}, {42, -38}}, color = {0, 0, 255}));
  connect(laptop.n, ground2.p) annotation(
    Line(points = {{42, -58}, {42, -64}, {22, -64}, {22, -68}}, color = {0, 0, 255}));
  connect(z.pin_n, z1.pin_p) annotation(
    Line(points = {{-72, 0}, {0, 0}}, color = {117, 80, 123}));
  connect(v.pin_p, z.pin_p) annotation(
    Line(points = {{-120, 0}, {-92, 0}}));
  connect(ground.pin, laptop_adapter.hPin_N) annotation(
    Line(points = {{-28, -66}, {-28, -48}, {0, -48}}, color = {92, 53, 102}));
  connect(voltmeter_Freq2Time.pin_p, v.pin_p) annotation(
    Line(points = {{-142, -4}, {-142, -4}, {-142, 0}, {-120, 0}, {-120, 0}}, color = {92, 53, 102}));
  connect(voltmeter_Freq2Time.pin_n, ground1.pin) annotation(
    Line(points = {{-142, -24}, {-142, -24}, {-142, -30}, {-120, -30}, {-120, -30}}, color = {117, 80, 123}));
  connect(voltmeter_Freq2Time1.pin_p, z.pin_n) annotation(
    Line(points = {{-70, -30}, {-70, -30}, {-70, 0}, {-72, 0}, {-72, 0}}, color = {92, 53, 102}));
  connect(voltmeter_Freq2Time1.pin_n, ground3.pin) annotation(
    Line(points = {{-70, -50}, {-70, -50}, {-70, -60}, {-70, -60}}, color = {117, 80, 123}));
  connect(z1.pin_n, ground4.pin) annotation(
    Line(points = {{20, 0}, {78, 0}, {78, -44}, {78, -44}}, color = {117, 80, 123}));
  connect(ammeter_Freq2Time.pin_n, laptop_adapter.hPin_P) annotation(
    Line(points = {{-24, -36}, {0, -36}}, color = {117, 80, 123}));
  connect(ammeter_Freq2Time.pin_p, z.pin_n) annotation(
    Line(points = {{-44, -36}, {-52, -36}, {-52, 0}, {-72, 0}, {-72, 0}}, color = {92, 53, 102}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-200, -200}, {200, 200}})),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(ls = "totalpivot", lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"));
end Test_Rectifier;