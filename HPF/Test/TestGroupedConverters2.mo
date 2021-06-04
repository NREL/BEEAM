within HPF.Test;

model TestGroupedConverters2
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1, 3}) annotation(
    Placement(visible = true, transformation(extent = {{-122, 94}, {-94, 118}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v1(vArg = {0, 0}, vMag = {120, 1e-9}) annotation(
    Placement(visible = true, transformation(origin = {-108, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(extent = {{-18, -18}, {-2, -2}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 0.05 + 1e-7 * j) annotation(
    Placement(visible = true, transformation(extent = {{-82, 38}, {-62, 58}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource voltageSource(vArg = {0, 0}, vMag = {120, 1e-9}) annotation(
    Placement(visible = true, transformation(origin = {-108, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  HPF.SinglePhase.Components.Ground ground4 annotation(
    Placement(visible = true, transformation(extent = {{-52, -90}, {-36, -74}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance impedance(z = 0.05 + 1e-7 * j) annotation(
    Placement(visible = true, transformation(extent = {{-86, -54}, {-66, -34}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.GroupedConverters.EmpMdl converter_grouped(V_Rect = 24, nomP = 100, numConvs = 2)  annotation(
    Placement(visible = true, transformation(origin = {14, -52}, extent = {{-10, -18}, {13, 18}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 100)  annotation(
    Placement(visible = true, transformation(origin = {52, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {78, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl converter1(V_Rect = 24)  annotation(
    Placement(visible = true, transformation(origin = {14, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 50) annotation(
    Placement(visible = true, transformation(origin = {48, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {78, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 50) annotation(
    Placement(visible = true, transformation(origin = {50, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl converter2(V_Rect = 24)  annotation(
    Placement(visible = true, transformation(origin = {16, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add Ploss_converters annotation(
    Placement(visible = true, transformation(origin = {96, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.MultiSensor msr_grouped annotation(
    Placement(visible = true, transformation(origin = {-44, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.MultiSensor msr_converters annotation(
    Placement(visible = true, transformation(origin = {-42, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(z1.pin_p, v1.pin_p) annotation(
    Line(points = {{-82, 48}, {-108, 48}}, color = {92, 53, 102}));
  connect(v1.pin_n, ground.pin) annotation(
    Line(points = {{-108, 28}, {-108, -2}, {-10, -2}}, color = {117, 80, 123}));
  connect(voltageSource.pin_n, ground4.pin) annotation(
    Line(points = {{-108, -64}, {-108, -74}, {-44, -74}}, color = {117, 80, 123}));
  connect(impedance.pin_p, voltageSource.pin_p) annotation(
    Line(points = {{-86, -44}, {-108, -44}}, color = {92, 53, 102}));
  connect(converter_grouped.pin_p, dC_Load.p) annotation(
    Line(points = {{24, -44}, {42, -44}}, color = {0, 0, 255}));
  connect(dC_Load.n, ground1.p) annotation(
    Line(points = {{62, -44}, {68, -44}, {68, -60}, {78, -60}}, color = {0, 0, 255}));
  connect(converter_grouped.pin_n, ground1.p) annotation(
    Line(points = {{24, -60}, {78, -60}}, color = {0, 0, 255}));
  connect(ground4.pin, converter_grouped.hPin_N) annotation(
    Line(points = {{-44, -74}, {-6, -74}, {-6, -60}, {4, -60}}, color = {92, 53, 102}));
  connect(converter1.pin_p, dC_Load1.p) annotation(
    Line(points = {{24, 48}, {38, 48}}, color = {0, 0, 255}));
  connect(dC_Load1.n, converter1.pin_n) annotation(
    Line(points = {{58, 48}, {68, 48}, {68, 32}, {24, 32}}, color = {0, 0, 255}));
  connect(converter1.hPin_N, ground.pin) annotation(
    Line(points = {{4, 32}, {-10, 32}, {-10, -2}}, color = {117, 80, 123}));
  connect(converter2.hPin_P, converter1.hPin_P) annotation(
    Line(points = {{6, 14}, {-4, 14}, {-4, 48}, {4, 48}}, color = {92, 53, 102}));
  connect(converter2.hPin_N, ground.pin) annotation(
    Line(points = {{6, -2}, {-10, -2}}, color = {117, 80, 123}));
  connect(converter2.pin_p, dC_Load2.p) annotation(
    Line(points = {{26, 14}, {40, 14}}, color = {0, 0, 255}));
  connect(dC_Load2.n, converter2.pin_n) annotation(
    Line(points = {{60, 14}, {68, 14}, {68, -2}, {26, -2}}, color = {0, 0, 255}));
  connect(ground3.p, converter2.pin_n) annotation(
    Line(points = {{78, -2}, {26, -2}}, color = {0, 0, 255}));
  connect(Ploss_converters.u1, converter1.PLoss) annotation(
    Line(points = {{84, 74}, {14, 74}, {14, 52}}, color = {0, 0, 127}));
  connect(Ploss_converters.u2, converter2.PLoss) annotation(
    Line(points = {{84, 62}, {32, 62}, {32, 22}, {16, 22}, {16, 17}}, color = {0, 0, 127}));
  connect(impedance.pin_n, msr_grouped.hPin_PC) annotation(
    Line(points = {{-66, -44}, {-54, -44}}, color = {117, 80, 123}));
  connect(msr_grouped.hPin_NV, ground4.pin) annotation(
    Line(points = {{-44, -54}, {-44, -74}}, color = {117, 80, 123}));
  connect(msr_grouped.hPin_NC, converter_grouped.hPin_P) annotation(
    Line(points = {{-34, -44.2}, {4, -44.2}}, color = {117, 80, 123}));
  connect(msr_converters.hPin_NC, converter1.hPin_P) annotation(
    Line(points = {{-32, 48}, {4, 48}}, color = {117, 80, 123}));
  connect(msr_converters.hPin_PC, z1.pin_n) annotation(
    Line(points = {{-52, 48}, {-62, 48}}, color = {92, 53, 102}));
  connect(msr_converters.hPin_NV, ground.pin) annotation(
    Line(points = {{-42, 38}, {-42, -2}, {-10, -2}}, color = {117, 80, 123}));
  connect(converter1.pin_n, ground3.p) annotation(
    Line(points = {{24, 32}, {78, 32}, {78, -2}}, color = {0, 0, 255}));
protected
  annotation(
    Diagram(coordinateSystem(extent = {{-160, -140}, {160, 140}})),
    Icon(coordinateSystem(extent = {{-160, -140}, {160, 140}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-09, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", s = "dassl"));
end TestGroupedConverters2;