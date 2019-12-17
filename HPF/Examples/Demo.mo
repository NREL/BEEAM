within HPF.Examples;

model Demo
  inner HPF.SystemDef systemDef(hrms = {k for k in 1:2:15}) annotation(
    Placement(visible = true, transformation(origin = {-98, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhA(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_A.mat") annotation(
    Placement(visible = true, transformation(origin = {-108, 14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhB(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_B.mat") annotation(
    Placement(visible = true, transformation(origin = {-90, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhC(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_C.mat") annotation(
    Placement(visible = true, transformation(origin = {-70, -24}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Machines.Transformers_iPh.Test_DY test_DY(N = 10) annotation(
    Placement(visible = true, transformation(origin = {-42, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-108, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase laptop2(V_Rect = 19.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_laptop.mat") annotation(
    Placement(visible = true, transformation(origin = {36, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase led_driver(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_LedDriver.mat") annotation(
    Placement(visible = true, transformation(origin = {32, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-42, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r(r = 1e6) annotation(
    Placement(visible = true, transformation(origin = {-16, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load led_load(pwr = 50) annotation(
    Placement(visible = true, transformation(origin = {70, 22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {70, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {80, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop_load(pwr = 25) annotation(
    Placement(visible = true, transformation(origin = {80, -44}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.ExternalInterface.Zone zone_1 annotation(
    Placement(visible = true, transformation(extent = {{104, 46}, {124, 66}}, rotation = 0)));
  HPF.ExternalInterface.Zone zone_2 annotation(
    Placement(visible = true, transformation(extent = {{110, -18}, {130, 2}}, rotation = 0)));
equation
  connect(PhA.pin_p, test_DY.pinPrim_A) annotation(
    Line(points = {{-108, 24}, {-52, 24}}));
  connect(PhB.pin_p, test_DY.pinPrim_B) annotation(
    Line(points = {{-90, 4}, {-90, 14}, {-52, 14}}));
  connect(PhC.pin_p, test_DY.pinPrim_C) annotation(
    Line(points = {{-70, -14}, {-70, 4}, {-52, 4}}));
  connect(PhA.pin_n, ground.pin) annotation(
    Line(points = {{-108, 4}, {-108, -42}}, color = {117, 80, 123}));
  connect(PhB.pin_n, ground.pin) annotation(
    Line(points = {{-90, -16}, {-90, -42}, {-108, -42}}, color = {117, 80, 123}));
  connect(PhC.pin_n, ground.pin) annotation(
    Line(points = {{-70, -34}, {-70, -42}, {-108, -42}}, color = {117, 80, 123}));
  connect(test_DY.pinSec_A, led_driver.hPin_P) annotation(
    Line(points = {{-32, 24}, {22, 24}}));
  connect(laptop2.hPin_P, test_DY.pinSec_B) annotation(
    Line(points = {{26, -34}, {6, -34}, {6, 14}, {-32, 14}}));
  connect(test_DY.hPin_N, ground1.pin) annotation(
    Line(points = {{-42, -1}, {-42, -20}}, color = {117, 80, 123}));
  connect(laptop2.hPin_N, ground1.pin) annotation(
    Line(points = {{26, -46}, {-10, -46}, {-10, -20}, {-42, -20}}, color = {117, 80, 123}));
  connect(led_driver.hPin_N, ground1.pin) annotation(
    Line(points = {{22, 12}, {10, 12}, {10, -20}, {-42, -20}}, color = {117, 80, 123}));
  connect(r.pin_p, test_DY.pinSec_C) annotation(
    Line(points = {{-26, 4}, {-32, 4}}));
  connect(r.pin_n, ground1.pin) annotation(
    Line(points = {{-6, 4}, {0, 4}, {0, -20}, {-42, -20}}, color = {117, 80, 123}));
  connect(led_driver.pin_n, led_load.n) annotation(
    Line(points = {{42, 12}, {70, 12}}, color = {0, 0, 255}));
  connect(led_load.n, ground2.p) annotation(
    Line(points = {{70, 12}, {70, 4}}, color = {0, 0, 255}));
  connect(led_driver.pin_p, led_load.p) annotation(
    Line(points = {{42, 24}, {50, 24}, {50, 36}, {70, 36}, {70, 32}}, color = {0, 0, 255}));
  connect(laptop2.pin_p, laptop_load.p) annotation(
    Line(points = {{46, -34}, {80, -34}}, color = {0, 0, 255}));
  connect(laptop2.pin_n, laptop_load.n) annotation(
    Line(points = {{46, -46}, {52, -46}, {52, -54}, {80, -54}}, color = {0, 0, 255}));
  connect(laptop_load.n, ground3.p) annotation(
    Line(points = {{80, -54}, {80, -62}}, color = {0, 0, 255}));
  connect(led_driver.PLoss, zone_1.u) annotation(
    Line(points = {{32, 30}, {32, 30}, {32, 40}, {114, 40}, {114, 48}, {114, 48}}, color = {0, 0, 127}));
  connect(laptop2.PLoss, zone_2.u) annotation(
    Line(points = {{36, -28}, {36, -22}, {120, -22}, {120, -16}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(graphics = {Rectangle(origin = {36, 24}, pattern = LinePattern.DashDot, extent = {{-20, 18}, {22, -30}}), Text(origin = {38, 42}, extent = {{-20, 8}, {10, 2}}, textString = "zone 1"), Text(origin = {-62, 18}, lineColor = {28, 108, 200}, extent = {{-68, 90}, {96, 66}}, textString = "Small setup demonstrating thermal zone block.
One can either use Modelica Std Library heat port
or a real value port.", fontSize = 9, horizontalAlignment = TextAlignment.Left), Rectangle(origin = {38, -42}, pattern = LinePattern.DashDot, extent = {{-20, 18}, {22, -30}}), Text(origin = {40, -22}, extent = {{-20, 8}, {10, 2}}, textString = "zone 2")}, coordinateSystem(extent = {{-150, -150}, {150, 150}})),
  Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})));
end Demo;