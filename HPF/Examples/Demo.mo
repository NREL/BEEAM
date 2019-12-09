within HPF.Examples;
model Demo
  inner HPF.SystemDef systemDef(hrms = {k for k in 1:2:15}) annotation (
    Placement(visible = true, transformation(origin={-70,70},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhA(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_A.mat") annotation (
    Placement(visible = true, transformation(origin = {-82, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhB(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_B.mat") annotation (
    Placement(visible = true, transformation(origin = {-68, 4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhC(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_C.mat") annotation (
    Placement(visible = true, transformation(origin = {-54, -14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Machines.Transformers_iPh.Test_DY test_DY(N = 10) annotation (
    Placement(visible = true, transformation(origin = {-16, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-82, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase laptop2(V_Rect = 19.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_laptop.mat") annotation (
    Placement(visible = true, transformation(origin = {58, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase led_driver(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_LedDriver.mat") annotation (
    Placement(visible = true, transformation(origin = {58, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-16, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r(r = 1e6) annotation (
    Placement(visible = true, transformation(origin = {10, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load led_load(pwr = 50) annotation (
    Placement(visible = true, transformation(origin = {96, 32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {96, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {80, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop_load(pwr = 25) annotation (
    Placement(visible = true, transformation(origin = {80, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(PhA.pin_p, test_DY.pinPrim_A) annotation (
    Line(points = {{-82, 34}, {-26, 34}}));
  connect(PhB.pin_p, test_DY.pinPrim_B) annotation (
    Line(points = {{-68, 14}, {-68, 24}, {-26, 24}}));
  connect(PhC.pin_p, test_DY.pinPrim_C) annotation (
    Line(points = {{-54, -4}, {-54, 14}, {-26, 14}}));
  connect(PhA.pin_n, ground.pin) annotation (
    Line(points = {{-82, 14}, {-82, -32}}, color = {117, 80, 123}));
  connect(PhB.pin_n, ground.pin) annotation (
    Line(points = {{-68, -6}, {-70, -6}, {-70, -32}, {-82, -32}}, color = {117, 80, 123}));
  connect(PhC.pin_n, ground.pin) annotation (
    Line(points = {{-54, -24}, {-54, -32}, {-82, -32}}, color = {117, 80, 123}));
  connect(test_DY.pinSec_A, led_driver.hPin_P) annotation (
    Line(points = {{-6, 34}, {48, 34}}));
  connect(laptop2.hPin_P, test_DY.pinSec_B) annotation (
    Line(points = {{48, 2}, {32, 2}, {32, 24}, {-6, 24}}));
  connect(test_DY.hPin_N, ground1.pin) annotation (
    Line(points={{-16,9},{-16,-10}},      color = {117, 80, 123}));
  connect(laptop2.hPin_N, ground1.pin) annotation (
    Line(points = {{48, -10}, {-16, -10}}, color = {117, 80, 123}));
  connect(led_driver.hPin_N, ground1.pin) annotation (
    Line(points = {{48, 22}, {36, 22}, {36, -10}, {-16, -10}}, color = {117, 80, 123}));
  connect(r.pin_p, test_DY.pinSec_C) annotation (
    Line(points = {{0, 14}, {-6, 14}}));
  connect(r.pin_n, ground1.pin) annotation (
    Line(points = {{20, 14}, {26, 14}, {26, -10}, {-16, -10}, {-16, -10}, {-16, -10}}, color = {117, 80, 123}));
  connect(led_driver.pin_n, led_load.n) annotation (
    Line(points = {{68, 22}, {96, 22}}, color = {0, 0, 255}));
  connect(led_load.n, ground2.p) annotation (
    Line(points = {{96, 22}, {96, 14}}, color = {0, 0, 255}));
  connect(led_driver.pin_p, led_load.p) annotation (
    Line(points = {{68, 34}, {76, 34}, {76, 46}, {96, 46}, {96, 42}}, color = {0, 0, 255}));
  connect(laptop2.pin_p, laptop_load.p) annotation (
    Line(points = {{68, 2}, {80, 2}, {80, 2}, {80, 2}}, color = {0, 0, 255}));
  connect(laptop2.pin_n, laptop_load.n) annotation (
    Line(points = {{68, -10}, {74, -10}, {74, -18}, {80, -18}, {80, -18}}, color = {0, 0, 255}));
  connect(laptop_load.n, ground3.p) annotation (
    Line(points = {{80, -18}, {80, -18}, {80, -26}, {80, -26}}, color = {0, 0, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(graphics = {Rectangle(origin = {94, 34}, pattern = LinePattern.DashDot, extent = {{-20, 18}, {20, -18}}), Text(origin = {90, 54}, extent = {{-20, 8}, {14, -2}}, textString = "zone 1")}, coordinateSystem(initialScale = 0.1)));
end Demo;