within HPF.Test;
model TestGroupedConverters
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms={1,3})
    annotation (Placement(visible = true, transformation(extent = {{-132, 80}, {-104, 104}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl converter_single1(V_Rect = 24)  annotation(
    Placement(visible = true, transformation(origin = {32, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0, 0}, vMag = {120, 1e-9})  annotation(
    Placement(visible = true, transformation(origin = {-80, 58}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = 0.05 + 1e-7 * j)  annotation(
    Placement(visible = true, transformation(origin = {-52, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor msrI_single annotation(
    Placement(visible = true, transformation(origin = {-8, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-80, 32}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 50)  annotation(
    Placement(visible = true, transformation(origin = {64, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {58, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {60, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 50) annotation(
    Placement(visible = true, transformation(origin = {66, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor msrI_grouped annotation(
    Placement(visible = true, transformation(origin = {-8, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 0.05 + 1e-7 * j) annotation(
    Placement(visible = true, transformation(origin = {-42, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v1(vArg = {0, 0}, vMag = {120, 1e-9}) annotation(
    Placement(visible = true, transformation(origin = {-78, -2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {-78, -28}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.GroupedConverters.EmpMdl empMdl1 annotation(
    Placement(visible = true, transformation(origin = {24, 0}, extent = {{-10, -18}, {13, 18}}, rotation = 0)));
equation
  connect(z.pin_n, msrI_single.pin_p) annotation(
    Line(points = {{-42, 68}, {-18, 68}}, color = {117, 80, 123}));
  connect(z.pin_p, v.pin_p) annotation(
    Line(points = {{-62, 68}, {-80, 68}}, color = {92, 53, 102}));
  connect(ground.pin, v.pin_n) annotation(
    Line(points = {{-80, 40}, {-80, 48}}, color = {92, 53, 102}));
  connect(v.pin_n, converter_single1.hPin_N) annotation(
    Line(points = {{-80, 48}, {14, 48}, {14, 52}, {22, 52}}, color = {117, 80, 123}));
  connect(msrI_single.pin_n, converter_single1.hPin_P) annotation(
    Line(points = {{2, 68}, {22, 68}}, color = {117, 80, 123}));
  connect(converter_single1.pin_p, dC_Load.p) annotation(
    Line(points = {{42, 68}, {54, 68}}, color = {0, 0, 255}));
  connect(dC_Load.n, converter_single1.pin_n) annotation(
    Line(points = {{74, 68}, {84, 68}, {84, 52}, {42, 52}}, color = {0, 0, 255}));
  connect(converter_single1.pin_n, ground1.p) annotation(
    Line(points = {{42, 52}, {58, 52}, {58, 42}}, color = {0, 0, 255}));
  connect(z1.pin_p, v1.pin_p) annotation(
    Line(points = {{-52, 8}, {-78, 8}}, color = {92, 53, 102}));
  connect(v1.pin_n, ground3.pin) annotation(
    Line(points = {{-78, -12}, {-78, -20}}, color = {117, 80, 123}));
  connect(z1.pin_n, msrI_grouped.pin_p) annotation(
    Line(points = {{-32, 8}, {-18, 8}}, color = {117, 80, 123}));
  connect(msrI_grouped.pin_n, empMdl1.hPin_P) annotation(
    Line(points = {{2, 8}, {14, 8}}, color = {117, 80, 123}));
  connect(empMdl1.pin_p, dC_Load1.p) annotation(
    Line(points = {{34, 8}, {56, 8}}, color = {0, 0, 255}));
  connect(dC_Load1.n, ground2.p) annotation(
    Line(points = {{76, 8}, {88, 8}, {88, -18}, {60, -18}}, color = {0, 0, 255}));
  connect(empMdl1.pin_n, ground2.p) annotation(
    Line(points = {{34, -8}, {52, -8}, {52, -18}, {60, -18}}, color = {0, 0, 255}));
  connect(v1.pin_n, empMdl1.hPin_N) annotation(
    Line(points = {{-78, -12}, {-2, -12}, {-2, -8}, {14, -8}}, color = {117, 80, 123}));
protected
  annotation (Diagram(coordinateSystem(extent={{-160,-140},{160,140}})), Icon(
        coordinateSystem(extent={{-160,-140},{160,140}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-15, Interval = 1),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", s = "dassl", ls = "totalpivot"),
  Documentation);
end TestGroupedConverters;