within HPF.Examples.Basics;

model AC2DC_Simple_Bidirectional_1P
  extends Modelica.Icons.Example;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-78, 82}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource V_Grid(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {115}, {0 for i in 2:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground Ground_AC annotation(
    Placement(visible = true, transformation(origin = {-40, -48}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground Ground_DC annotation(
    Placement(visible = true, transformation(origin = {40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp DC_Power_Schedule(duration = 2, height = -1000, offset = 500, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {58, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_1pBidirectionalSimple Simple_Bidirectional(P_nom = 500, VAC_nom = 120, VDC_nom = 48, alpha_ACDC = 0.01, alpha_DCAC = 0.03, beta_ACDC = 0.02, beta_DCAC = 0.02, gamma_ACDC = 0.03, gamma_DCAC = 0.01) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load DC_Load(u(start = -500)) annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(V_Grid.pin_n, Ground_AC.pin) annotation(
    Line(points = {{-60, -10}, {-60, -20}, {-40, -20}, {-40, -40}}, color = {117, 80, 123}));
  connect(Simple_Bidirectional.pin_n, Ground_DC.p) annotation(
    Line(points = {{10, -8}, {20, -8}, {20, -20}, {40, -20}, {40, -40}}, color = {0, 0, 255}));
  connect(Simple_Bidirectional.hPin_N, Ground_AC.pin) annotation(
    Line(points = {{-10, -8}, {-20, -8}, {-20, -20}, {-40, -20}, {-40, -40}}, color = {117, 80, 123}));
  connect(Simple_Bidirectional.hPin_L, V_Grid.pin_p) annotation(
    Line(points = {{-10, 8}, {-20, 8}, {-20, 20}, {-60, 20}, {-60, 10}}, color = {92, 53, 102}));
  connect(DC_Load.n, Ground_DC.p) annotation(
    Line(points = {{60, -10}, {60, -20}, {40, -20}, {40, -40}}, color = {0, 0, 255}));
  connect(DC_Load.p, Simple_Bidirectional.pin_p) annotation(
    Line(points = {{60, 10}, {60, 20}, {20, 20}, {20, 8}, {10, 8}}, color = {0, 0, 255}));
  connect(DC_Power_Schedule.y, DC_Load.u) annotation(
    Line(points = {{70, 60}, {80, 60}, {80, 0}, {66, 0}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info = "<html><head></head><body><p>This example demonstrates a simple AC to DC bidirectional converter (no harmonic distortion, fixed power factor). The DC output is voltage-controlled and can either source or sink DC current.</p>
</body></html>"),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_RES_INIT,LOG_SOTI,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end AC2DC_Simple_Bidirectional_1P;
