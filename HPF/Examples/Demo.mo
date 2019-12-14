within HPF.Examples;
model Demo
  inner HPF.SystemDef systemDef(hrms = {k for k in 1:2:15}) annotation (
    Placement(visible = true, transformation(origin={-68,30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhA(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_A.mat") annotation (
    Placement(visible = true, transformation(origin={-80,-16},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhB(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_B.mat") annotation (
    Placement(visible = true, transformation(origin={-62,-36},  extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhC(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_C.mat") annotation (
    Placement(visible = true, transformation(origin={-42,-54},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Machines.Transformers_iPh.Test_DY test_DY(N = 10) annotation (
    Placement(visible = true, transformation(origin={-14,-16},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin={-80,-72},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase laptop2(V_Rect = 19.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_laptop.mat") annotation (
    Placement(visible = true, transformation(origin={60,-44},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase led_driver(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_LedDriver.mat") annotation (
    Placement(visible = true, transformation(origin={60,-12},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={-14,-50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r(r = 1e6) annotation (
    Placement(visible = true, transformation(origin={12,-26},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load led_load(pwr = 50) annotation (
    Placement(visible = true, transformation(origin={98,-8},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={98,-36},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={82,-76},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop_load(pwr = 25) annotation (
    Placement(visible = true, transformation(origin={82,-48},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  ExternalInterface.Zone zone
    annotation (Placement(transformation(extent={{14,72},{34,92}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-16,54},{4,74}})));
equation
  connect(PhA.pin_p, test_DY.pinPrim_A) annotation (
    Line(points={{-80,-6},{-24,-6}}));
  connect(PhB.pin_p, test_DY.pinPrim_B) annotation (
    Line(points={{-62,-26},{-62,-16},{-24,-16}}));
  connect(PhC.pin_p, test_DY.pinPrim_C) annotation (
    Line(points={{-42,-44},{-42,-26},{-24,-26}}));
  connect(PhA.pin_n, ground.pin) annotation (
    Line(points={{-80,-26},{-80,-72}},     color = {117, 80, 123}));
  connect(PhB.pin_n, ground.pin) annotation (
    Line(points={{-62,-46},{-62,-72},{-80,-72}},       color = {117, 80, 123}));
  connect(PhC.pin_n, ground.pin) annotation (
    Line(points={{-42,-64},{-42,-72},{-80,-72}},        color = {117, 80, 123}));
  connect(test_DY.pinSec_A, led_driver.hPin_P) annotation (
    Line(points={{-4,-6},{50,-6}}));
  connect(laptop2.hPin_P, test_DY.pinSec_B) annotation (
    Line(points={{50,-38},{34,-38},{34,-16},{-4,-16}}));
  connect(test_DY.hPin_N, ground1.pin) annotation (
    Line(points={{-14,-31},{-14,-50}},    color = {117, 80, 123}));
  connect(laptop2.hPin_N, ground1.pin) annotation (
    Line(points={{50,-50},{-14,-50}},      color = {117, 80, 123}));
  connect(led_driver.hPin_N, ground1.pin) annotation (
    Line(points={{50,-18},{38,-18},{38,-50},{-14,-50}},        color = {117, 80, 123}));
  connect(r.pin_p, test_DY.pinSec_C) annotation (
    Line(points={{2,-26},{-4,-26}}));
  connect(r.pin_n, ground1.pin) annotation (
    Line(points={{22,-26},{28,-26},{28,-50},{-14,-50}},                                color = {117, 80, 123}));
  connect(led_driver.pin_n, led_load.n) annotation (
    Line(points={{70,-18},{98,-18}},    color = {0, 0, 255}));
  connect(led_load.n, ground2.p) annotation (
    Line(points={{98,-18},{98,-26}},    color = {0, 0, 255}));
  connect(led_driver.pin_p, led_load.p) annotation (
    Line(points={{70,-6},{78,-6},{78,6},{98,6},{98,2}},               color = {0, 0, 255}));
  connect(laptop2.pin_p, laptop_load.p) annotation (
    Line(points={{70,-38},{82,-38}},                    color = {0, 0, 255}));
  connect(laptop2.pin_n, laptop_load.n) annotation (
    Line(points={{70,-50},{76,-50},{76,-58},{82,-58}},                     color = {0, 0, 255}));
  connect(laptop_load.n, ground3.p) annotation (
    Line(points={{82,-58},{82,-66}},                            color = {0, 0, 255}));
  connect(const.y, zone.u)
    annotation (Line(points={{5,64},{24,64},{24,74}}, color={0,0,127}));
  annotation (
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(graphics={  Rectangle(origin={96,-6},    pattern = LinePattern.DashDot, extent = {{-20, 18}, {20, -18}}), Text(origin={92,
              14},                                                                                                                            extent = {{-20, 8}, {14, -2}}, textString = "zone 1"),
        Text(
          extent={{-68,90},{-10,80}},
          lineColor={28,108,200},
          textString="Small setup demonstrating thermal zone block.
One can either use Modelica Std Library heat port
or a real value port.
",
          horizontalAlignment=TextAlignment.Left)},                                                                                                                                                   coordinateSystem(initialScale = 0.1)));
end Demo;
