within HPF.Examples.Basics;

model AC2DC_Simple_Inverter_1P
  extends Modelica.Icons.Example;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:20})  annotation(
    Placement(visible = true, transformation(origin = {-78, 82}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource V_Grid(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {115}, {0 for i in 2:systemDef.numHrm}))  annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground Ground_AC annotation(
    Placement(visible = true, transformation(origin = {-40, -48}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground Ground_DC annotation(
    Placement(visible = true, transformation(origin = {40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_1pInverterSimple Simple_Inverter(PF = 0.9,P_nom = 500, P_stby = 5, VAC_nom = 120, VDC_nom = 48, alpha = 0.01, beta = 0.02, gamma = 0.03)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sources.DC.FixedVoltage_VariablePower DC_Source(v_out = 50)  annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp DC_Power_Schedule(duration = 2, height = 500, offset = 0, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {58, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Simple_Inverter.hPin_N, Ground_AC.pin) annotation(
    Line(points = {{-10, -8}, {-19, -8}, {-19, -20}, {-40, -20}, {-40, -40}}, color = {117, 80, 123}));
  connect(V_Grid.pin_n, Ground_AC.pin) annotation(
    Line(points = {{-60, -10}, {-60, -20}, {-40, -20}, {-40, -40}}, color = {117, 80, 123}));
  connect(Simple_Inverter.pin_n, Ground_DC.p) annotation(
    Line(points = {{10, -8}, {20, -8}, {20, -20}, {40, -20}, {40, -40}}, color = {0, 0, 255}));
  connect(DC_Power_Schedule.y, DC_Source.p_out) annotation(
    Line(points = {{70, 60}, {80, 60}, {80, 0}, {68, 0}}, color = {0, 0, 127}));
  connect(DC_Source.p, Simple_Inverter.pin_p) annotation(
    Line(points = {{60, 10}, {60, 20}, {20, 20}, {20, 8}, {10, 8}}, color = {0, 0, 255}));
  connect(DC_Source.n, Ground_DC.p) annotation(
    Line(points = {{60, -10}, {60, -20}, {40, -20}, {40, -40}}, color = {0, 0, 255}));
  connect(Simple_Inverter.hPin_L, V_Grid.pin_p) annotation(
    Line(points = {{-10, 8}, {-20, 8}, {-20, 20}, {-60, 20}, {-60, 10}}, color = {92, 53, 102}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info = "<html><head></head><body><p>This example demonstrates a simple grid-following DC to AC inverter (no harmonic distortion, fixed power factor).</p>
</body></html>"),
    experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-06, Interval = 0.04),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_RES_INIT,LOG_SOTI,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end AC2DC_Simple_Inverter_1P;
