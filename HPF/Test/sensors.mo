within HPF.Test;

model sensors
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:7}) annotation(
    Placement(visible = true, transformation(origin = {-76, 87}, extent = {{-16, -18.6667}, {16, 13.3333}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-128, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {0.1 for i in 2:1:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-126, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = 1.3 + 0.02 * j) annotation(
    Placement(visible = true, transformation(origin = {-58, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase led_driver(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_laptop.mat") annotation(
    Placement(visible = true, transformation(origin = {50, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z2(z = 0.1 + 0.02 * j) annotation(
    Placement(visible = true, transformation(origin = {6, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 100) annotation(
    Placement(visible = true, transformation(origin = {82, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {82, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {22, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 200) annotation(
    Placement(visible = true, transformation(origin = {70, 48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {70, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 0.1 + 0.02 * j) annotation(
    Placement(visible = true, transformation(origin = {2, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase aC2DC_SinglePhase(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_laptop.mat") annotation(
    Placement(visible = true, transformation(origin = {44, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor currentSensor1 annotation(
    Placement(visible = true, transformation(origin = {-26, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.Ammeter_Freq2Time ammeter_Freq2Time annotation(
    Placement(visible = true, transformation(origin = {-94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(v.pin_n, ground.pin) annotation(
    Line(points = {{-126, -20}, {-126, -22}, {-128, -22}, {-128, -24}}, color = {117, 80, 123}));
  connect(led_driver.hPin_N, v.pin_n) annotation(
    Line(points = {{40, -12}, {-47, -12}, {-47, -20}, {-126, -20}}, color = {117, 80, 123}));
  connect(z2.pin_n, led_driver.hPin_P) annotation(
    Line(points = {{16, 0}, {40, 0}}, color = {117, 80, 123}));
  connect(z2.pin_p, z.pin_n) annotation(
    Line(points = {{-4, 0}, {-48, 0}}));
  connect(led_driver.pin_p, dC_Load.p) annotation(
    Line(points = {{60, 0}, {82, 0}}, color = {0, 0, 255}));
  connect(led_driver.pin_n, dC_Load.n) annotation(
    Line(points = {{60, -12}, {68, -12}, {68, -20}, {82, -20}}, color = {0, 0, 255}));
  connect(dC_Load.n, ground1.p) annotation(
    Line(points = {{82, -20}, {82, -26}}, color = {0, 0, 255}));
  connect(dC_Load1.n, ground3.p) annotation(
    Line(points = {{70, 38}, {63, 38}, {63, 34}, {70, 34}}, color = {0, 0, 255}));
  connect(z1.pin_n, aC2DC_SinglePhase.hPin_P) annotation(
    Line(points = {{12, 58}, {34, 58}}, color = {117, 80, 123}));
  connect(ground2.pin, aC2DC_SinglePhase.hPin_N) annotation(
    Line(points = {{22, 38}, {22, 46}, {34, 46}}));
  connect(aC2DC_SinglePhase.pin_n, dC_Load1.n) annotation(
    Line(points = {{54, 46}, {58, 46}, {58, 38}, {70, 38}}, color = {0, 0, 255}));
  connect(aC2DC_SinglePhase.pin_p, dC_Load1.p) annotation(
    Line(points = {{54, 58}, {70, 58}}, color = {0, 0, 255}));
  connect(currentSensor1.pin_n, z1.pin_p) annotation(
    Line(points = {{-16, 58}, {-8, 58}, {-8, 58}, {-8, 58}}, color = {117, 80, 123}));
  connect(currentSensor1.pin_p, z.pin_n) annotation(
    Line(points = {{-36, 58}, {-42, 58}, {-42, 0}, {-48, 0}, {-48, 0}}));
  connect(v.pin_p, ammeter_Freq2Time.pin_p) annotation(
    Line(points = {{-126, 0}, {-104, 0}}));
  connect(ammeter_Freq2Time.pin_n, z.pin_p) annotation(
    Line(points = {{-84, 0}, {-68, 0}, {-68, 0}, {-68, 0}}, color = {117, 80, 123}));
  annotation(
    Diagram(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})));
end sensors;