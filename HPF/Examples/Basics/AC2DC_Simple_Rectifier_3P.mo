within HPF.Examples.Basics;

model AC2DC_Simple_Rectifier_3P
  extends Modelica.Icons.Example;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-80.1847, 80.4921}, extent = {{-9.81534, -9.81533}, {9.81534, 7.01095}}, rotation = 0)));
  HPF.PowerConverters.ThreePhase.ACDC_3pRectifierSimple Simple_Rectifier_3phase(P_DCmin = 5,P_nom = 200, P_stby = 1, VAC_nom = 120, VDC_nom = 24, alpha = 0.01, beta = 0.02, gamma = 0.03)  annotation(
    Placement(visible = true, transformation(origin = {12, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0 for i in 1:systemDef.numHrm}, vArg_phB = cat(1, {-2.094}, {0 for i in 2:systemDef.numHrm}), vArg_phC = cat(1, {2.094}, {0 for i in 2:systemDef.numHrm}), vMag_phA = cat(1, {117, 2}, {0 for i in 3:systemDef.numHrm}), vMag_phB = cat(1, {116, 2}, {0 for i in 3:systemDef.numHrm}), vMag_phC = cat(1, {115, 2}, {0 for i in 3:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-47, 9}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp DC_Power_Schedule(duration = 2, height = 200, offset = 0, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {60, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground Ground_DC annotation(
    Placement(visible = true, transformation(origin = {40, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load DC_Load(u(start = 1)) annotation(
    Placement(visible = true, transformation(origin = {60, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground Ground_AC annotation(
    Placement(visible = true, transformation(origin = {-20, -48}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  connect(voltageSource.pinP_phB, Simple_Rectifier_3phase.hPin_B) annotation(
    Line(points = {{-41, 9}, {2, 9}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, Simple_Rectifier_3phase.hPin_C) annotation(
    Line(points = {{-41, 4}, {2, 4}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, Simple_Rectifier_3phase.hPin_A) annotation(
    Line(points = {{-41, 14}, {2, 14}}, color = {92, 53, 102}));
  connect(DC_Load.n, Ground_DC.p) annotation(
    Line(points = {{60, -4}, {60, -14}, {40, -14}, {40, -34}}, color = {0, 0, 255}));
  connect(DC_Power_Schedule.y, DC_Load.u) annotation(
    Line(points = {{71, 66}, {79, 66}, {79, 6}, {65, 6}}, color = {0, 0, 127}));
  connect(Ground_AC.pin, Simple_Rectifier_3phase.hPin_N) annotation(
    Line(points = {{-20, -40}, {-20, -2}, {2, -2}}, color = {92, 53, 102}));
  connect(voltageSource.pinN, Ground_AC.pin) annotation(
    Line(points = {{-46, 2}, {-48, 2}, {-48, -2}, {-20, -2}, {-20, -40}}, color = {117, 80, 123}));
  connect(Simple_Rectifier_3phase.pin_p, DC_Load.p) annotation(
    Line(points = {{22, 14}, {30, 14}, {30, 22}, {60, 22}, {60, 16}}, color = {0, 0, 255}));
  connect(Simple_Rectifier_3phase.pin_n, Ground_DC.p) annotation(
    Line(points = {{22, -2}, {30, -2}, {30, -14}, {40, -14}, {40, -34}}, color = {0, 0, 255}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info = "<html><head></head><body><p>This example demonstrates a simple 3-phase AC to DC rectifier (no harmonic distortion, fixed power factor). Power draw is balanced among the AC phases.</p>
</body></html>"),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_RES_INIT,LOG_SOTI,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end AC2DC_Simple_Rectifier_3P;
