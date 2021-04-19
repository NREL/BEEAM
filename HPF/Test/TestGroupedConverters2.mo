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
  HPF.Sensors.CurrentSensor msrI_converters annotation(
    Placement(visible = true, transformation(extent = {{-40, 38}, {-20, 58}}, rotation = 0)));
  HPF.Sensors.CurrentSensor msrI_grouped annotation(
    Placement(visible = true, transformation(extent = {{-32, -48}, {-12, -28}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource voltageSource(vArg = {0, 0}, vMag = {120, 1e-9}) annotation(
    Placement(visible = true, transformation(origin = {-100, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  HPF.SinglePhase.Components.Ground ground4 annotation(
    Placement(visible = true, transformation(extent = {{-18, -84}, {-2, -68}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance impedance(z = 0.05 + 1e-7 * j) annotation(
    Placement(visible = true, transformation(extent = {{-70, -48}, {-50, -28}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.GroupedConverters.EmpMdl converter_grouped(V_Rect = 24, nomP = 100, numConvs = 2)  annotation(
    Placement(visible = true, transformation(origin = {16, -46}, extent = {{-10, -18}, {13, 18}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 100)  annotation(
    Placement(visible = true, transformation(origin = {52, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {68, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl converter1(V_Rect = 24)  annotation(
    Placement(visible = true, transformation(origin = {14, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {78, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 50) annotation(
    Placement(visible = true, transformation(origin = {48, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {78, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 50) annotation(
    Placement(visible = true, transformation(origin = {48, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl converter2(V_Rect = 24)  annotation(
    Placement(visible = true, transformation(origin = {14, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add Ploss_converters annotation(
    Placement(visible = true, transformation(origin = {96, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(z1.pin_p, v1.pin_p) annotation(
    Line(points = {{-82, 48}, {-108, 48}}, color = {92, 53, 102}));
  connect(v1.pin_n, ground.pin) annotation(
    Line(points = {{-108, 28}, {-108, -2}, {-10, -2}}, color = {117, 80, 123}));
  connect(msrI_converters.pin_p, z1.pin_n) annotation(
    Line(points = {{-40, 48}, {-62, 48}}, color = {92, 53, 102}));
  connect(voltageSource.pin_n, ground4.pin) annotation(
    Line(points = {{-100, -58}, {-100, -68}, {-10, -68}}, color = {117, 80, 123}));
  connect(msrI_grouped.pin_p, impedance.pin_n) annotation(
    Line(points = {{-32, -38}, {-50, -38}}, color = {92, 53, 102}));
  connect(impedance.pin_p, voltageSource.pin_p) annotation(
    Line(points = {{-70, -38}, {-100, -38}}, color = {92, 53, 102}));
  connect(converter_grouped.pin_p, dC_Load.p) annotation(
    Line(points = {{26, -38}, {42, -38}}, color = {0, 0, 255}));
  connect(dC_Load.n, ground1.p) annotation(
    Line(points = {{62, -38}, {72, -38}, {72, -54}, {68, -54}}, color = {0, 0, 255}));
  connect(converter_grouped.pin_n, ground1.p) annotation(
    Line(points = {{26, -54}, {68, -54}}, color = {0, 0, 255}));
  connect(msrI_grouped.pin_n, converter_grouped.hPin_P) annotation(
    Line(points = {{-12, -38}, {6, -38}}, color = {117, 80, 123}));
  connect(ground4.pin, converter_grouped.hPin_N) annotation(
    Line(points = {{-10, -68}, {2, -68}, {2, -54}, {6, -54}}, color = {92, 53, 102}));
  connect(converter1.pin_p, dC_Load1.p) annotation(
    Line(points = {{24, 48}, {38, 48}}, color = {0, 0, 255}));
  connect(dC_Load1.n, converter1.pin_n) annotation(
    Line(points = {{58, 48}, {68, 48}, {68, 32}, {24, 32}}, color = {0, 0, 255}));
  connect(converter1.pin_n, ground2.p) annotation(
    Line(points = {{24, 32}, {78, 32}}, color = {0, 0, 255}));
  connect(msrI_converters.pin_n, converter1.hPin_P) annotation(
    Line(points = {{-20, 48}, {4, 48}}, color = {117, 80, 123}));
  connect(converter1.hPin_N, ground.pin) annotation(
    Line(points = {{4, 32}, {-10, 32}, {-10, -2}}, color = {117, 80, 123}));
  connect(converter2.hPin_P, converter1.hPin_P) annotation(
    Line(points = {{4, 14}, {-4, 14}, {-4, 48}, {4, 48}}, color = {92, 53, 102}));
  connect(converter2.hPin_N, ground.pin) annotation(
    Line(points = {{4, -2}, {-10, -2}}, color = {117, 80, 123}));
  connect(converter2.pin_p, dC_Load2.p) annotation(
    Line(points = {{24, 14}, {38, 14}}, color = {0, 0, 255}));
  connect(dC_Load2.n, converter2.pin_n) annotation(
    Line(points = {{58, 14}, {68, 14}, {68, -2}, {24, -2}}, color = {0, 0, 255}));
  connect(ground3.p, converter2.pin_n) annotation(
    Line(points = {{78, -2}, {24, -2}}, color = {0, 0, 255}));
  connect(Ploss_converters.u1, converter1.PLoss) annotation(
    Line(points = {{84, 74}, {14, 74}, {14, 52}}, color = {0, 0, 127}));
  connect(Ploss_converters.u2, converter2.PLoss) annotation(
    Line(points = {{84, 62}, {32, 62}, {32, 22}, {14, 22}, {14, 18}}, color = {0, 0, 127}));  protected
  annotation(
    Diagram(coordinateSystem(extent = {{-160, -140}, {160, 140}})),
    Icon(coordinateSystem(extent = {{-160, -140}, {160, 140}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-09, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", s = "dassl"));
end TestGroupedConverters2;