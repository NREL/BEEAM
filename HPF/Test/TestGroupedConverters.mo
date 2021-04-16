within HPF.Test;
model TestGroupedConverters
  import Modelica.ComplexMath.j;
  HPF.PowerConverters.SinglePhase.GroupedConverters.EmpMdl1 empMdl11(V_Rect = 24, numConvs = 1)  annotation (
    Placement(visible = true, transformation(origin={48,44},     extent = {{-10, -18}, {10, 18}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 100)  annotation (Placement(visible = true, transformation(origin = {86, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  HPF.DC.Ground ground2
    annotation (Placement(visible = true, transformation(extent = {{76, 4}, {96, 24}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground3
    annotation (Placement(visible = true, transformation(extent = {{12, 8}, {28, 24}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vMag={120,1}, vArg={0,0})
                                      annotation (Placement(visible = true, transformation(origin = {-66, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  HPF.SinglePhase.Components.Impedance z(z=0.1 + 1e-7*j)
    annotation (Placement(visible = true, transformation(extent = {{-44, 42}, {-24, 62}}, rotation = 0)));
  inner SystemDef systemDef(hrms={1,3})
    annotation (Placement(transformation(extent={{-120,64},{-92,88}})));
  SinglePhase.Sources.VoltageSource v1(vArg = {0, 0}, vMag = {120, 0}) annotation(
    Placement(visible = true, transformation(origin = {-64, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  DC.DC_Load dC_Load(pwr = 50) annotation(
    Placement(visible = true, transformation(origin = {86, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  PowerConverters.SinglePhase.ACDC_EmpMdl aCDC_EmpMdl(V_Rect = 24) annotation(
    Placement(visible = true, transformation(extent = {{38, -20}, {58, 0}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(extent = {{14, -82}, {30, -66}}, rotation = 0)));
  SinglePhase.Components.Impedance z1(z = 0.1 + 1e-7 * j) annotation(
    Placement(visible = true, transformation(extent = {{-42, -12}, {-22, 8}}, rotation = 0)));
  HPF.Sensors.CurrentSensor msrI_groupedConvs annotation(
    Placement(visible = true, transformation(extent = {{-8, 42}, {12, 62}}, rotation = 0)));
  HPF.Sensors.CurrentSensor msrI_converters annotation(
    Placement(visible = true, transformation(extent = {{-8, -12}, {12, 8}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 50) annotation(
    Placement(visible = true, transformation(origin = {86, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  HPF.DC.Ground ground4 annotation(
    Placement(visible = true, transformation(extent = {{86, -96}, {106, -76}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl aCDC_EmpMdl1(V_Rect = 24) annotation(
    Placement(visible = true, transformation(extent = {{42, -68}, {62, -48}}, rotation = 0)));
  Modelica.Blocks.Math.Add PLoss_converters annotation(
    Placement(visible = true, transformation(origin = {136, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(empMdl11.pin_p, dC_Load2.p) annotation(
    Line(points = {{58, 52}, {86, 52}}, color = {0, 0, 255}));
  connect(empMdl11.pin_n, dC_Load2.n) annotation(
    Line(points = {{58, 36}, {70, 36}, {70, 32}, {86, 32}}, color = {0, 0, 255}));
  connect(dC_Load2.n, ground2.p) annotation(
    Line(points = {{86, 32}, {86, 24}}, color = {0, 0, 255}));
  connect(empMdl11.hPin_N, ground3.pin) annotation(
    Line(points = {{38, 36}, {33, 36}, {33, 24}, {20, 24}}, color = {117, 80, 123}));
  connect(z.pin_p, v.pin_p) annotation(
    Line(points = {{-44, 52}, {-66, 52}}, color = {92, 53, 102}));
  connect(aCDC_EmpMdl.hPin_N, ground.pin) annotation(
    Line(points = {{38, -18}, {22, -18}, {22, -66}}, color = {117, 80, 123}));
  connect(z1.pin_p, v1.pin_p) annotation(
    Line(points = {{-42, -2}, {-64, -2}}, color = {92, 53, 102}));
  connect(aCDC_EmpMdl.pin_n, dC_Load.n) annotation(
    Line(points = {{58, -18}, {76, -18}, {76, -22}, {86, -22}}, color = {0, 0, 255}));
  connect(v1.pin_n, ground.pin) annotation(
    Line(points = {{-64, -22}, {-64, -66}, {22, -66}}, color = {117, 80, 123}));
  connect(dC_Load.p, aCDC_EmpMdl.pin_p) annotation(
    Line(points = {{86, -2}, {58, -2}}, color = {0, 0, 255}));
  connect(z.pin_n, msrI_groupedConvs.pin_p) annotation(
    Line(points = {{-24, 52}, {-8, 52}}, color = {117, 80, 123}));
  connect(msrI_groupedConvs.pin_n, empMdl11.hPin_P) annotation(
    Line(points = {{12, 52}, {38, 52}}, color = {117, 80, 123}));
  connect(v.pin_n, ground3.pin) annotation(
    Line(points = {{-66, 32}, {-66, 24}, {20, 24}}, color = {117, 80, 123}));
  connect(msrI_converters.pin_p, z1.pin_n) annotation(
    Line(points = {{-8, -2}, {-22, -2}}, color = {92, 53, 102}));
  connect(msrI_converters.pin_n, aCDC_EmpMdl.hPin_P) annotation(
    Line(points = {{12, -2}, {38, -2}}, color = {117, 80, 123}));
  connect(aCDC_EmpMdl1.pin_n, dC_Load1.n) annotation(
    Line(points = {{62, -66}, {80, -66}, {80, -68}, {86, -68}}, color = {0, 0, 255}));
  connect(dC_Load1.n, ground4.p) annotation(
    Line(points = {{86, -68}, {86, -75}, {96, -75}, {96, -76}}, color = {0, 0, 255}));
  connect(aCDC_EmpMdl1.pin_p, dC_Load1.p) annotation(
    Line(points = {{62, -50}, {86, -50}, {86, -48}}, color = {0, 0, 255}));
  connect(dC_Load.n, ground4.p) annotation(
    Line(points = {{86, -22}, {96, -22}, {96, -76}}, color = {0, 0, 255}));
  connect(aCDC_EmpMdl1.hPin_N, ground.pin) annotation(
    Line(points = {{42, -66}, {22, -66}}, color = {117, 80, 123}));
  connect(aCDC_EmpMdl1.hPin_P, msrI_converters.pin_n) annotation(
    Line(points = {{42, -50}, {30, -50}, {30, -2}, {12, -2}}, color = {92, 53, 102}));
  connect(PLoss_converters.u2, aCDC_EmpMdl1.PLoss) annotation(
    Line(points = {{124, 0}, {114, 0}, {114, -38}, {52, -38}, {52, -46}}, color = {0, 0, 127}));
  connect(aCDC_EmpMdl.PLoss, PLoss_converters.u1) annotation(
    Line(points = {{48, 2}, {48, 12}, {124, 12}}, color = {0, 0, 127}));
  annotation (Diagram(coordinateSystem(extent={{-160,-140},{160,140}})), Icon(
        coordinateSystem(extent={{-160,-140},{160,140}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-15, Interval = 1),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", s = "dassl", ls = "totalpivot"));
end TestGroupedConverters;