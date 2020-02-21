within HPF.Test;
model sensors
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:15}) annotation (
    Placement(visible = true, transformation(origin = {-52, 89}, extent = {{-16, -18.6667}, {16, 13.3333}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-104, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {0.1 for i in 2:1:systemDef.numHrm})) annotation (
    Placement(visible = true, transformation(origin = {-104, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = 1.1 + 0.03 * j) annotation (
    Placement(visible = true, transformation(origin = {-34, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor currentSensor1 annotation (
    Placement(visible = true, transformation(origin = {-2, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 0.01 + 0.03 * j) annotation (
    Placement(visible = true, transformation(origin = {26, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase aC2DC_SinglePhase(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_laptop.mat") annotation (
    Placement(visible = true, transformation(origin = {92, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 200) annotation (
    Placement(visible = true, transformation(origin = {118, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {118, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance impedance(z = 0.03 + 0.03 * j) annotation (
    Placement(visible = true, transformation(origin = {14, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase aC2DC_SinglePhase1(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_LedDriver.mat") annotation (
    Placement(visible = true, transformation(origin = {56, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 150) annotation (
    Placement(visible = true, transformation(origin = {90, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {90, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {34, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.Ammeter_Freq2Time ammeter_Freq2Time annotation (
    Placement(visible = true, transformation(origin = {-72, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.Voltmeter_Freq2Time voltmeter_Freq2Time annotation (
    Placement(visible = true, transformation(origin = {50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(v.pin_n, ground.pin) annotation (
    Line(points = {{-104, -18}, {-105, -18}, {-105, -30}, {-104, -30}}, color = {117, 80, 123}));
  connect(currentSensor1.pin_p, z.pin_n) annotation (
    Line(points = {{-12, 60}, {-18, 60}, {-18, 2}, {-24, 2}}));
  connect(currentSensor1.pin_n, z1.pin_p) annotation (
    Line(points = {{8, 60}, {16, 60}}, color = {117, 80, 123}));
  connect(ground2.pin, aC2DC_SinglePhase.hPin_N) annotation (
    Line(points = {{70, 30}, {70, 48}, {82, 48}}));
  connect(z1.pin_n, aC2DC_SinglePhase.hPin_P) annotation (
    Line(points = {{36, 60}, {82, 60}}, color = {117, 80, 123}));
  connect(aC2DC_SinglePhase.pin_p, dC_Load1.p) annotation (
    Line(points = {{102, 60}, {118, 60}}, color = {0, 0, 255}));
  connect(aC2DC_SinglePhase.pin_n, dC_Load1.n) annotation (
    Line(points = {{102, 48}, {106, 48}, {106, 40}, {118, 40}}, color = {0, 0, 255}));
  connect(dC_Load1.n, ground3.p) annotation (
    Line(points = {{118, 40}, {111, 40}, {111, 36}, {118, 36}}, color = {0, 0, 255}));
  connect(aC2DC_SinglePhase1.pin_p, dC_Load.p) annotation (
    Line(points = {{66, 2}, {90, 2}}, color = {0, 0, 255}));
  connect(aC2DC_SinglePhase1.pin_n, dC_Load.n) annotation (
    Line(points = {{66, -10}, {78, -10}, {78, -18}, {90, -18}}, color = {0, 0, 255}));
  connect(dC_Load.n, ground1.p) annotation (
    Line(points = {{90, -18}, {90, -24}}, color = {0, 0, 255}));
  connect(impedance.pin_n, aC2DC_SinglePhase1.hPin_P) annotation (
    Line(points = {{24, 2}, {46, 2}}, color = {117, 80, 123}));
  connect(z.pin_n, impedance.pin_p) annotation (
    Line(points = {{-24, 2}, {4, 2}}, color = {117, 80, 123}));
  connect(aC2DC_SinglePhase1.hPin_N, ground4.pin) annotation (
    Line(points = {{46, -10}, {34, -10}, {34, -22}}, color = {117, 80, 123}));
  connect(ammeter_Freq2Time.pin_n, z.pin_p) annotation (
    Line(points = {{-62, 2}, {-44, 2}}, color = {117, 80, 123}));
  connect(v.pin_p, ammeter_Freq2Time.pin_p) annotation (
    Line(points = {{-104, 2}, {-82, 2}}));
  connect(voltmeter_Freq2Time.pin_p, z1.pin_n) annotation (
    Line(points = {{50, 50}, {50, 50}, {50, 60}, {36, 60}, {36, 60}}));
  connect(voltmeter_Freq2Time.pin_n, ground2.pin) annotation (
    Line(points = {{50, 30}, {70, 30}}, color = {117, 80, 123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})));
end sensors;
