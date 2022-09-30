within HPF.Examples.Basics;

model AC2DC_Simple_Inverter_Grid_Forming_3P
  extends Modelica.Icons.Example;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-78, 82}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground Ground_DC annotation(
    Placement(visible = true, transformation(origin = {-22, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.ThreePhase.ACDC_3pInverterSimpleGridForming Simple_Inverter_Grid_Forming(P_ACmin = 50,P_nom = 1000, P_stby = 5, VAC_nom = 120, VDC_nom = 48, alpha = 0.03, beta = 0.02, gamma = 0.01, vAngle = 0.5235987755982988, vArg_ref = 0.5235987755982988, vMag_ref = 120)  annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground Ground_AC annotation(
    Placement(visible = true, transformation(origin = {-76, -96}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.PowerConverters.ThreePhase.ACDC_3pBidirectionalSimple Simple_Bidirectional_3phase(P_nom = 1000, VAC_nom = 120, VDC_nom = 48, alpha_ACDC = 0.01, alpha_DCAC = 0.03, beta_ACDC = 0.02, beta_DCAC = 0.02, gamma_ACDC = 0.03, gamma_DCAC = 0.01) annotation(
    Placement(visible = true, transformation(origin = {-42, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0 for i in 1:systemDef.numHrm}, vArg_phB = cat(1, {-2.094}, {0 for i in 2:systemDef.numHrm}), vArg_phC = cat(1, {2.094}, {0 for i in 2:systemDef.numHrm}), vMag_phA = cat(1, {117, 2}, {0 for i in 3:systemDef.numHrm}), vMag_phB = cat(1, {116, 2}, {0 for i in 3:systemDef.numHrm}), vMag_phC = cat(1, {115, 2}, {0 for i in 3:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-77, -7}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  HPF.Loads.SinglePhase.AC_LoadIdeal1P Phase_A_Load(P_nom = 100, Q_nom = 50, V_nom = 120, vAngle_init = 0.5235987755982988) annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Loads.SinglePhase.AC_LoadIdeal1P Phase_B_Load(P_nom = 150, Q_nom = 75, V_nom = 120, vAngle_init = 2.617993877991494) annotation(
    Placement(visible = true, transformation(origin = {40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Loads.SinglePhase.AC_LoadIdeal1P Phase_C_Load(P_nom = 200, Q_nom = 100, V_nom = 120, vAngle_init = 4.71238898038469) annotation(
    Placement(visible = true, transformation(origin = {50, -72}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.ComplexBlocks.Sources.ComplexStep Phase_A_Control(height = Complex(50, 25), offset = Complex(25, 10), startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-2, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.Sources.ComplexStep Phase_B_Control(height = Complex(100, 50), offset = Complex(25, 25), startTime = 2) annotation(
    Placement(visible = true, transformation(origin = {-2, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.Sources.ComplexStep Phase_C_Control(height = Complex(125, 100), offset = Complex(50, 25), startTime = 3) annotation(
    Placement(visible = true, transformation(origin = {-2, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, Ground_AC.pin) annotation(
    Line(points = {{-77, -13}, {-76, -13}, {-76, -88}}, color = {117, 80, 123}));
  connect(Simple_Bidirectional_3phase.hPin_N, Ground_AC.pin) annotation(
    Line(points = {{-52, -18}, {-76, -18}, {-76, -88}}, color = {117, 80, 123}));
  connect(Simple_Bidirectional_3phase.hPin_A, voltageSource.pinP_phA) annotation(
    Line(points = {{-52, -2}, {-71, -2}}, color = {92, 53, 102}));
  connect(Simple_Bidirectional_3phase.hPin_C, voltageSource.pinP_phC) annotation(
    Line(points = {{-52, -12}, {-71, -12}}, color = {92, 53, 102}));
  connect(Simple_Bidirectional_3phase.hPin_B, voltageSource.pinP_phB) annotation(
    Line(points = {{-52, -7}, {-71, -7}}, color = {92, 53, 102}));
  connect(Simple_Bidirectional_3phase.pin_p, Simple_Inverter_Grid_Forming.pin_p) annotation(
    Line(points = {{-32, -2}, {-10, -2}}, color = {0, 0, 255}));
  connect(Simple_Bidirectional_3phase.pin_n, Ground_DC.p) annotation(
    Line(points = {{-32, -18}, {-22, -18}, {-22, -38}}, color = {0, 0, 255}));
  connect(Simple_Inverter_Grid_Forming.pin_n, Ground_DC.p) annotation(
    Line(points = {{-10, -18}, {-22, -18}, {-22, -38}}, color = {0, 0, 255}));
  connect(Simple_Inverter_Grid_Forming.hPin_A, Phase_A_Load.hPin_L) annotation(
    Line(points = {{10, -2}, {30, -2}, {30, -20}}, color = {92, 53, 102}));
  connect(Simple_Inverter_Grid_Forming.hPin_B, Phase_B_Load.hPin_L) annotation(
    Line(points = {{10, -6}, {40, -6}, {40, -40}}, color = {92, 53, 102}));
  connect(Simple_Inverter_Grid_Forming.hPin_C, Phase_C_Load.hPin_L) annotation(
    Line(points = {{10, -12}, {50, -12}, {50, -62}}, color = {92, 53, 102}));
  connect(Simple_Inverter_Grid_Forming.hPin_N, Ground_AC.pin) annotation(
    Line(points = {{10, -18}, {20, -18}, {20, -88}, {-76, -88}}, color = {117, 80, 123}));
  connect(Phase_A_Load.hPin_N, Ground_AC.pin) annotation(
    Line(points = {{30, -40}, {30, -88}, {-76, -88}}, color = {117, 80, 123}));
  connect(Phase_B_Load.hPin_N, Ground_AC.pin) annotation(
    Line(points = {{40, -60}, {40, -88}, {-76, -88}}, color = {117, 80, 123}));
  connect(Phase_C_Load.hPin_N, Ground_AC.pin) annotation(
    Line(points = {{50, -82}, {50, -88}, {-76, -88}}, color = {117, 80, 123}));
  connect(Phase_C_Control.y, Phase_C_Load.S_input) annotation(
    Line(points = {{10, 20}, {80, 20}, {80, -72}, {56, -72}}, color = {85, 170, 255}));
  connect(Phase_B_Control.y, Phase_B_Load.S_input) annotation(
    Line(points = {{10, 50}, {72, 50}, {72, -50}, {46, -50}}, color = {85, 170, 255}));
  connect(Phase_A_Control.y, Phase_A_Load.S_input) annotation(
    Line(points = {{10, 82}, {62, 82}, {62, -30}, {36, -30}}, color = {85, 170, 255}));
protected
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info = "<html><head></head><body><p>This example demonstrates a simple grid-following 3-phase DC to AC inverter (no harmonic distortion, fixed power factor). Power supplied is balanced among the AC phases.</p>
</body></html>"),
    experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-06, Interval = 0.04),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_RES_INIT,LOG_SOTI,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end AC2DC_Simple_Inverter_Grid_Forming_3P;
