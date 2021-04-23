within HPF.Examples.Basics;
model AC2DC_Converter
  extends Modelica.Icons.Example;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms={i for i in 1:2:20})    annotation (
    Placement(visible = true, transformation(origin = {-68.1847, 36.4921}, extent = {{-9.81534, -9.81533}, {9.81534, 7.01095}}, rotation = 0)));
  SinglePhase.Components.Impedance Z01(z = 0.8 + 0.008 * j) annotation (
    Placement(visible = true, transformation(origin = {-10, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Impedance Z12(z = 25 + 0.3013 * j) annotation (
    Placement(visible = true, transformation(origin = {32, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-34, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource V0(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {0 for i in 2:systemDef.numHrm})) annotation (
    Placement(visible = true, transformation(origin = {-34, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl ACDC_Converter(V_Rect = 24, nomP = 50) annotation (
    Placement(visible = true, transformation(origin = {30, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 100) annotation (
    Placement(visible = true, transformation(origin = {62, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {62, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(V0.pin_n, ground.pin) annotation(
    Line(points = {{-34, 14}, {-34, -28}}, color = {117, 80, 123}));
  connect(Z01.pin_p, V0.pin_p) annotation(
    Line(points = {{-20, 44}, {-34, 44}, {-34, 34}}));
  connect(Z01.pin_n, Z12.pin_p) annotation (
    Line(points = {{0, 44}, {22, 44}}, color = {117, 80, 123}));
  connect(ACDC_Converter.hPin_P, Z01.pin_n) annotation (
    Line(points = {{20, 20}, {12, 20}, {12, 44}, {0, 44}}, color = {92, 53, 102}));
  connect(ACDC_Converter.hPin_N, ground.pin) annotation(
    Line(points = {{20, 4}, {12, 4}, {12, -28}, {-34, -28}}, color = {117, 80, 123}));
  connect(Z12.pin_n, ground.pin) annotation(
    Line(points = {{42, 44}, {82, 44}, {82, -28}, {-34, -28}}, color = {117, 80, 123}));
  connect(ACDC_Converter.pin_p, dC_Load.p) annotation (
    Line(points = {{40, 20}, {62, 20}}, color = {0, 0, 255}));
  connect(ACDC_Converter.pin_n, dC_Load.n) annotation (
    Line(points = {{40, 4}, {52, 4}, {52, 0}, {62, 0}}, color = {0, 0, 255}));
  connect(dC_Load.n, ground1.p) annotation (
    Line(points = {{62, 0}, {62, 0}, {62, -6}, {62, -6}}, color = {0, 0, 255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info = "<html>
<p>This example demonstrates the harmonic power flow technique in a circuit containg an AC to DC converter. </p>
</html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_RES_INIT,LOG_SOTI,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end AC2DC_Converter;