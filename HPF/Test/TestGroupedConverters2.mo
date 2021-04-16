within HPF.Test;

model TestGroupedConverters2
  import Modelica.ComplexMath.j;
  inner SystemDef systemDef(hrms = {1, 2}) annotation(
    Placement(transformation(extent = {{-120, 64}, {-92, 88}})));
  HPF.SinglePhase.Sources.VoltageSource v1(vArg = {0, 0}, vMag = {120, 0}) annotation(
    Placement(visible = true, transformation(origin = {-62, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  DC.DC_Load dC_Load(pwr = 50) annotation(
    Placement(visible = true, transformation(origin = {86, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(extent = {{16, -68}, {32, -52}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 0.1 + 1e-7 * j) annotation(
    Placement(visible = true, transformation(extent = {{-42, -12}, {-22, 8}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl aCDC_EmpMdl(V_Rect = 24) annotation(
    Placement(visible = true, transformation(extent = {{36, -20}, {56, 0}}, rotation = 0)));
  DC.Ground ground1 annotation(
    Placement(visible = true, transformation(extent = {{82, -48}, {102, -28}}, rotation = 0)));
  HPF.Sensors.CurrentSensor msrI_converters annotation(
    Placement(visible = true, transformation(extent = {{-6, -12}, {14, 8}}, rotation = 0)));
equation
  connect(dC_Load.p, aCDC_EmpMdl.pin_p) annotation(
    Line(points = {{86, -2}, {56, -2}}, color = {0, 0, 255}));
  connect(z1.pin_p, v1.pin_p) annotation(
    Line(points = {{-42, -2}, {-62, -2}}, color = {92, 53, 102}));
  connect(aCDC_EmpMdl.pin_n, dC_Load.n) annotation(
    Line(points = {{56, -18}, {76, -18}, {76, -22}, {86, -22}}, color = {0, 0, 255}));
  connect(aCDC_EmpMdl.hPin_N, ground.pin) annotation(
    Line(points = {{36, -18}, {24, -18}, {24, -52}}, color = {117, 80, 123}));
  connect(v1.pin_n, ground.pin) annotation(
    Line(points = {{-62, -22}, {-62, -52}, {24, -52}}, color = {117, 80, 123}));
  connect(dC_Load.n, ground1.p) annotation(
    Line(points = {{86, -22}, {86, -27}, {92, -27}, {92, -28}}, color = {0, 0, 255}));
  connect(msrI_converters.pin_n, aCDC_EmpMdl.hPin_P) annotation(
    Line(points = {{14, -2}, {36, -2}}, color = {117, 80, 123}));
  connect(msrI_converters.pin_p, z1.pin_n) annotation(
    Line(points = {{-6, -2}, {-22, -2}}, color = {92, 53, 102}));
  annotation(
    Diagram(coordinateSystem(extent = {{-160, -140}, {160, 140}})),
    Icon(coordinateSystem(extent = {{-160, -140}, {160, 140}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-09, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", s = "dassl"));
end TestGroupedConverters2;