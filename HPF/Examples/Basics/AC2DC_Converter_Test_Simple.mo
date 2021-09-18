within HPF.Examples.Basics;

model AC2DC_Converter_Test_Simple
  extends Modelica.Icons.Example;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-68.1847, 36.4921}, extent = {{-9.81534, -9.81533}, {9.81534, 7.01095}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-34, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource V0(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {115}, {0 for i in 2:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-34, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load dC_Load(pwr = 75) annotation(
    Placement(visible = true, transformation(origin = {62, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {62, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple ACDC_Simple_Rectifier annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(V0.pin_n, ground.pin) annotation(
    Line(points = {{-34, 14}, {-34, -28}}, color = {117, 80, 123}));
  connect(dC_Load.n, ground1.p) annotation(
    Line(points = {{62, 0}, {62, 0}, {62, -6}, {62, -6}}, color = {0, 0, 255}));
  connect(ACDC_Simple_Rectifier.hPin_N, ground.pin) annotation(
    Line(points = {{20, 2}, {10, 2}, {10, -28}, {-34, -28}}, color = {117, 80, 123}));
  connect(ACDC_Simple_Rectifier.pin_p, dC_Load.p) annotation(
    Line(points = {{40, 18}, {62, 18}, {62, 20}}, color = {0, 0, 255}));
  connect(ACDC_Simple_Rectifier.pin_n, ground1.p) annotation(
    Line(points = {{40, 2}, {62, 2}, {62, -6}}, color = {0, 0, 255}));
  connect(ACDC_Simple_Rectifier.hPin_L, V0.pin_p) annotation(
    Line(points = {{20, 18}, {10, 18}, {10, 46}, {-34, 46}, {-34, 34}}, color = {92, 53, 102}));
protected
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info = "<html>
<p>This example demonstrates the harmonic power flow technique in a circuit containg an AC to DC converter. </p>
</html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_RES_INIT,LOG_SOTI,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end AC2DC_Converter_Test_Simple;
