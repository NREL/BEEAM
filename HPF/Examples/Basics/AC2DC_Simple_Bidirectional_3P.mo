within HPF.Examples.Basics;

model AC2DC_Simple_Bidirectional_3P
  extends Modelica.Icons.Example;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-80.1847, 80.4921}, extent = {{-9.81534, -9.81533}, {9.81534, 7.01095}}, rotation = 0)));
  HPF.Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0 for i in 1:systemDef.numHrm}, vArg_phB = cat(1, {-2.094}, {0 for i in 2:systemDef.numHrm}), vArg_phC = cat(1, {2.094}, {0 for i in 2:systemDef.numHrm}), vMag_phA = cat(1, {117, 2}, {0 for i in 3:systemDef.numHrm}), vMag_phB = cat(1, {116, 2}, {0 for i in 3:systemDef.numHrm}), vMag_phC = cat(1, {115, 2}, {0 for i in 3:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-47, 9}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground Ground_DC annotation(
    Placement(visible = true, transformation(origin = {40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground Ground_AC annotation(
    Placement(visible = true, transformation(origin = {-20, -48}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.PowerConverters.ThreePhase.ACDC_3pBidirectionalSimple Simple_Bidirectional_3phase(P_nom = 500, VAC_nom = 120, VDC_nom = 48, alpha_ACDC = 0.01, alpha_DCAC = 0.03, beta_ACDC = 0.02, beta_DCAC = 0.02, gamma_ACDC = 0.03, gamma_DCAC = 0.01)  annotation(
    Placement(visible = true, transformation(origin = {8, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load DC_Load(u(start = -500)) annotation(
    Placement(visible = true, transformation(origin = {60, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp DC_Power_Schedule(duration = 2, height = -1000, offset = 500, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {58, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, Ground_AC.pin) annotation(
    Line(points = {{-46, 2}, {-48, 2}, {-48, -2}, {-20, -2}, {-20, -40}}, color = {117, 80, 123}));
  connect(Simple_Bidirectional_3phase.hPin_B, voltageSource.pinP_phB) annotation(
    Line(points = {{-2, 10}, {-40, 10}}, color = {92, 53, 102}));
  connect(Simple_Bidirectional_3phase.hPin_A, voltageSource.pinP_phA) annotation(
    Line(points = {{-2, 14}, {-40, 14}}, color = {92, 53, 102}));
  connect(Simple_Bidirectional_3phase.hPin_C, voltageSource.pinP_phC) annotation(
    Line(points = {{-2, 4}, {-40, 4}}, color = {92, 53, 102}));
  connect(Simple_Bidirectional_3phase.hPin_N, Ground_AC.pin) annotation(
    Line(points = {{-2, -2}, {-20, -2}, {-20, -40}}, color = {117, 80, 123}));
  connect(Simple_Bidirectional_3phase.pin_n, Ground_DC.p) annotation(
    Line(points = {{18, -2}, {30, -2}, {30, -14}, {40, -14}, {40, -40}}, color = {0, 0, 255}));
  connect(DC_Power_Schedule.y, DC_Load.u) annotation(
    Line(points = {{69, 66}, {79, 66}, {79, 6}, {65, 6}}, color = {0, 0, 127}));
  connect(DC_Load.n, Ground_DC.p) annotation(
    Line(points = {{60, -4}, {60, -14}, {40, -14}, {40, -40}}, color = {0, 0, 255}));
  connect(DC_Load.p, Simple_Bidirectional_3phase.pin_p) annotation(
    Line(points = {{60, 16}, {60, 26}, {30, 26}, {30, 14}, {18, 14}}, color = {0, 0, 255}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info = "<html><head></head><body><p>This example demonstrates a simple 3-phase&nbsp;AC to DC bidirectional converter&nbsp;(no harmonic distortion, fixed power factor). Power draw is balanced among the AC phases. The DC output is voltage-controlled and can either source or sink DC current.</p>
</body></html>"),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_RES_INIT,LOG_SOTI,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end AC2DC_Simple_Bidirectional_3P;
