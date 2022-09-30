within HPF.Examples.Basics;

model AC2DC_Simple_Inverter_3P
  extends Modelica.Icons.Example;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-78, 82}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground Ground_AC annotation(
    Placement(visible = true, transformation(origin = {-40, -48}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground Ground_DC annotation(
    Placement(visible = true, transformation(origin = {40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sources.DC.FixedVoltage_VariablePower DC_Source(v_out = 50) annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp DC_Power_Schedule(duration = 2, height = 500, offset = 0, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {58, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.ThreePhase.ACDC_3pInverterSimple Simple_Inverter_3phase(PF = -0.9,P_nom = 500, P_stby = 5, VAC_nom = 120, VDC_nom = 48, alpha = 0.01, beta = 0.02, gamma = 0.03)  annotation(
    Placement(visible = true, transformation(origin = {8, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0 for i in 1:systemDef.numHrm}, vArg_phB = cat(1, {-2.094}, {0 for i in 2:systemDef.numHrm}), vArg_phC = cat(1, {2.094}, {0 for i in 2:systemDef.numHrm}), vMag_phA = cat(1, {117, 2}, {0 for i in 3:systemDef.numHrm}), vMag_phB = cat(1, {116, 2}, {0 for i in 3:systemDef.numHrm}), vMag_phC = cat(1, {115, 2}, {0 for i in 3:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-47, 9}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
equation
  connect(DC_Power_Schedule.y, DC_Source.p_out) annotation(
    Line(points = {{70, 60}, {80, 60}, {80, 0}, {68, 0}}, color = {0, 0, 127}));
  connect(DC_Source.n, Ground_DC.p) annotation(
    Line(points = {{60, -10}, {60, -20}, {40, -20}, {40, -40}}, color = {0, 0, 255}));
  connect(voltageSource.pinP_phC, Simple_Inverter_3phase.hPin_C) annotation(
    Line(points = {{-40, 4}, {-2, 4}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, Simple_Inverter_3phase.hPin_B) annotation(
    Line(points = {{-40, 10}, {-2, 10}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, Simple_Inverter_3phase.hPin_A) annotation(
    Line(points = {{-40, 14}, {-2, 14}}, color = {92, 53, 102}));
  connect(voltageSource.pinN, Ground_AC.pin) annotation(
    Line(points = {{-46, 2}, {-48, 2}, {-48, -8}, {-40, -8}, {-40, -40}}, color = {117, 80, 123}));
  connect(Simple_Inverter_3phase.hPin_N, Ground_AC.pin) annotation(
    Line(points = {{-2, -2}, {-20, -2}, {-20, -8}, {-40, -8}, {-40, -40}}, color = {117, 80, 123}));
  connect(Simple_Inverter_3phase.pin_n, Ground_DC.p) annotation(
    Line(points = {{18, -2}, {30, -2}, {30, -20}, {40, -20}, {40, -40}}, color = {0, 0, 255}));
  connect(DC_Source.p, Simple_Inverter_3phase.pin_p) annotation(
    Line(points = {{60, 10}, {60, 28}, {30, 28}, {30, 14}, {18, 14}}, color = {0, 0, 255}));  protected
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info = "<html><head></head><body><p>This example demonstrates a simple grid-following 3-phase DC to AC inverter (no harmonic distortion, fixed power factor). Power supplied is balanced among the AC phases.</p>
</body></html>"),
    experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-06, Interval = 0.04),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_RES_INIT,LOG_SOTI,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end AC2DC_Simple_Inverter_3P;
