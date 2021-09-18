within HPF.Examples.Basics;

model AC2DC_Converter_3P
  extends Modelica.Icons.Example;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-80.1847, 80.4921}, extent = {{-9.81534, -9.81533}, {9.81534, 7.01095}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-34, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 75) annotation(
    Placement(visible = true, transformation(origin = {62, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {62, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.ThreePhase.ACDC_3pRectifierSimple ACDC_3pRectifierSimple(P_nom = 100, VAC_nom = 120, VDC_nom = 20)  annotation(
    Placement(visible = true, transformation(origin = {24, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA = {0 for i in 1:systemDef.numHrm}, vArg_phB = cat(1, {-2.094}, {0 for i in 2:systemDef.numHrm}), vArg_phC = cat(1, {2.094}, {0 for i in 2:systemDef.numHrm}), vMag_phA = cat(1, {120, 2}, {0 for i in 3:systemDef.numHrm}), vMag_phB = cat(1, {120, 2}, {0 for i in 3:systemDef.numHrm}), vMag_phC = cat(1, {120, 2}, {0 for i in 3:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-56, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(dC_Load.n, ground1.p) annotation(
    Line(points = {{62, 0}, {62, 0}, {62, -6}, {62, -6}}, color = {0, 0, 255}));
  connect(ground.pin, voltageSource.pinN) annotation(
    Line(points = {{-34, -28}, {-34, -15.5}, {-56, -15.5}, {-56, -5}}, color = {92, 53, 102}));
  connect(ACDC_3pRectifierSimple.pin_p, dC_Load.p) annotation(
    Line(points = {{34, 16}, {48, 16}, {48, 20}, {62, 20}}, color = {0, 0, 255}));
  connect(ACDC_3pRectifierSimple.pin_n, dC_Load.n) annotation(
    Line(points = {{34, 0}, {62, 0}}, color = {0, 0, 255}));
  connect(voltageSource.pinP_phB, ACDC_3pRectifierSimple.hPin_B) annotation(
    Line(points = {{-43.5, 8}, {-17.75, 8}, {-17.75, 11}, {14, 11}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, ACDC_3pRectifierSimple.hPin_C) annotation(
    Line(points = {{-43.5, -2}, {-10.75, -2}, {-10.75, 6}, {14, 6}}, color = {92, 53, 102}));
  connect(ACDC_3pRectifierSimple.hPin_N, ground.pin) annotation(
    Line(points = {{14, 0}, {14, -16}, {-34, -16}, {-34, -28}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, ACDC_3pRectifierSimple.hPin_A) annotation(
    Line(points = {{-44, 18}, {14, 18}, {14, 16}}, color = {92, 53, 102}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info = "<html>
<p>This example demonstrates the harmonic power flow technique in a circuit containg an AC to DC converter. </p>
</html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_RES_INIT,LOG_SOTI,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end AC2DC_Converter_3P;
