within HPF.Test;

model TestGroupedConverters2
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1, 3}) annotation(
    Placement(visible = true, transformation(extent = {{-122, 94}, {-94, 118}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v1(vArg = {0, 0}, vMag = {120, 1e-9}) annotation(
    Placement(visible = true, transformation(origin = {-76, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(extent = {{14, 22}, {30, 38}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 0.05 + 1e-7 * j) annotation(
    Placement(visible = true, transformation(extent = {{-50, 78}, {-30, 98}}, rotation = 0)));
  HPF.Sensors.CurrentSensor msrI_converters annotation(
    Placement(visible = true, transformation(extent = {{-8, 78}, {12, 98}}, rotation = 0)));
  HPF.Sensors.CurrentSensor msrI_grouped annotation(
    Placement(visible = true, transformation(extent = {{0, -8}, {20, 12}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource voltageSource(vArg = {0, 0}, vMag = {120, 1e-9}) annotation(
    Placement(visible = true, transformation(origin = {-68, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  HPF.SinglePhase.Components.Ground ground4 annotation(
    Placement(visible = true, transformation(extent = {{14, -44}, {30, -28}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance impedance(z = 0.05 + 1e-7 * j) annotation(
    Placement(visible = true, transformation(extent = {{-38, -8}, {-18, 12}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.GroupedConverters.EmpMdl1 converter_grouped(V_Rect = 24, nomP = 100, numConvs = 2)  annotation(
    Placement(visible = true, transformation(origin = {48, -6}, extent = {{-10, -18}, {13, 18}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 100)  annotation(
    Placement(visible = true, transformation(origin = {84, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {100, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl converter1(V_Rect = 24)  annotation(
    Placement(visible = true, transformation(origin = {46, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {110, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 50) annotation(
    Placement(visible = true, transformation(origin = {80, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {110, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 50) annotation(
    Placement(visible = true, transformation(origin = {80, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl converter2(V_Rect = 24)  annotation(
    Placement(visible = true, transformation(origin = {46, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add Ploss_converters annotation(
    Placement(visible = true, transformation(origin = {128, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(z1.pin_p, v1.pin_p) annotation(
    Line(points = {{-50, 88}, {-76, 88}}, color = {92, 53, 102}));
  connect(v1.pin_n, ground.pin) annotation(
    Line(points = {{-76, 68}, {-76, 38}, {22, 38}}, color = {117, 80, 123}));
  connect(msrI_converters.pin_p, z1.pin_n) annotation(
    Line(points = {{-8, 88}, {-30, 88}}, color = {92, 53, 102}));
  connect(voltageSource.pin_n, ground4.pin) annotation(
    Line(points = {{-68, -18}, {-68, -28}, {22, -28}}, color = {117, 80, 123}));
  connect(msrI_grouped.pin_p, impedance.pin_n) annotation(
    Line(points = {{0, 2}, {-18, 2}}, color = {92, 53, 102}));
  connect(impedance.pin_p, voltageSource.pin_p) annotation(
    Line(points = {{-38, 2}, {-68, 2}}, color = {92, 53, 102}));
  connect(converter_grouped.pin_p, dC_Load.p) annotation(
    Line(points = {{58, 2}, {74, 2}}, color = {0, 0, 255}));
  connect(dC_Load.n, ground1.p) annotation(
    Line(points = {{94, 2}, {104, 2}, {104, -14}, {100, -14}}, color = {0, 0, 255}));
  connect(converter_grouped.pin_n, ground1.p) annotation(
    Line(points = {{58, -14}, {100, -14}}, color = {0, 0, 255}));
  connect(msrI_grouped.pin_n, converter_grouped.hPin_P) annotation(
    Line(points = {{20, 2}, {38, 2}}, color = {117, 80, 123}));
  connect(ground4.pin, converter_grouped.hPin_N) annotation(
    Line(points = {{22, -28}, {34, -28}, {34, -14}, {38, -14}}, color = {92, 53, 102}));
  connect(converter1.pin_p, dC_Load1.p) annotation(
    Line(points = {{56, 88}, {70, 88}}, color = {0, 0, 255}));
  connect(dC_Load1.n, converter1.pin_n) annotation(
    Line(points = {{90, 88}, {100, 88}, {100, 72}, {56, 72}}, color = {0, 0, 255}));
  connect(converter1.pin_n, ground2.p) annotation(
    Line(points = {{56, 72}, {110, 72}}, color = {0, 0, 255}));
  connect(msrI_converters.pin_n, converter1.hPin_P) annotation(
    Line(points = {{12, 88}, {36, 88}}, color = {117, 80, 123}));
  connect(converter1.hPin_N, ground.pin) annotation(
    Line(points = {{36, 72}, {22, 72}, {22, 38}}, color = {117, 80, 123}));
  connect(converter2.hPin_P, converter1.hPin_P) annotation(
    Line(points = {{36, 54}, {28, 54}, {28, 88}, {36, 88}}, color = {92, 53, 102}));
  connect(converter2.hPin_N, ground.pin) annotation(
    Line(points = {{36, 38}, {22, 38}}, color = {117, 80, 123}));
  connect(converter2.pin_p, dC_Load2.p) annotation(
    Line(points = {{56, 54}, {70, 54}}, color = {0, 0, 255}));
  connect(dC_Load2.n, converter2.pin_n) annotation(
    Line(points = {{90, 54}, {100, 54}, {100, 38}, {56, 38}}, color = {0, 0, 255}));
  connect(ground3.p, converter2.pin_n) annotation(
    Line(points = {{110, 38}, {56, 38}}, color = {0, 0, 255}));
  connect(Ploss_converters.u1, converter1.PLoss) annotation(
    Line(points = {{116, 114}, {46, 114}, {46, 92}}, color = {0, 0, 127}));
  connect(Ploss_converters.u2, converter2.PLoss) annotation(
    Line(points = {{116, 102}, {64, 102}, {64, 62}, {46, 62}, {46, 58}}, color = {0, 0, 127}));  protected
  annotation(
    Diagram(coordinateSystem(extent = {{-160, -140}, {160, 140}})),
    Icon(coordinateSystem(extent = {{-160, -140}, {160, 140}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-09, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", s = "dassl"));
end TestGroupedConverters2;