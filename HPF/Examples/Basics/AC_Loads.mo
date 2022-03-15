within HPF.Examples.Basics;

model AC_Loads
  extends Modelica.Icons.Example;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:11}) annotation(
    Placement(visible = true, transformation(origin = {-80.1847, 80.4921}, extent = {{-9.81534, -9.81533}, {9.81534, 7.01095}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground Ground_AC annotation(
    Placement(visible = true, transformation(origin = {-60, -88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.Sources.ThreePhase.VoltageSource V_Source(vArg_phA = {0 for i in 1:systemDef.numHrm}, vArg_phB = cat(1, {-2.094}, {0 for i in 2:systemDef.numHrm}), vArg_phC = cat(1, {2.094}, {0 for i in 2:systemDef.numHrm}), vMag_phA = cat(1, {117, 2}, {0 for i in 3:systemDef.numHrm}), vMag_phB = cat(1, {116, 2}, {0 for i in 3:systemDef.numHrm}), vMag_phC = cat(1, {115, 2}, {0 for i in 3:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-60, 2}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.Loads.SinglePhase.AC_LoadIdeal1P Single_Phase_Load(P_nom = 75, Q_nom = 50, V_nom = 120)  annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.ComplexBlocks.Sources.ComplexStep Power_Step(height = Complex(100, 50), startTime = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {48, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Loads.ThreePhase.AC_LoadIdealWye Three_Phase_Load(P_nom = 100, Q_nom = 50, V_nom = 120)  annotation(
    Placement(visible = true, transformation(origin = {-10, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.Sources.ComplexConstant Power_Fixed(k = Complex(60, 30))  annotation(
    Placement(visible = true, transformation(origin = {28, -28}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(V_Source.pinN, Ground_AC.pin) annotation(
    Line(points = {{-60, -8}, {-60, -80}}, color = {117, 80, 123}));
  connect(Single_Phase_Load.hPin_N, Ground_AC.pin) annotation(
    Line(points = {{60, -10}, {60, -60}, {-60, -60}, {-60, -80}}, color = {117, 80, 123}));
  connect(Single_Phase_Load.hPin_L, V_Source.pinP_phA) annotation(
    Line(points = {{60, 10}, {60, 20}, {-30, 20}, {-30, 10}, {-50, 10}}, color = {92, 53, 102}));
  connect(Power_Step.y, Single_Phase_Load.S_input) annotation(
    Line(points = {{60, 42}, {80, 42}, {80, 0}, {66, 0}}, color = {85, 170, 255}));
  connect(V_Source.pinP_phC, Three_Phase_Load.hPin_C) annotation(
    Line(points = {{-50, -6}, {-40, -6}, {-40, -30}, {-20, -30}}, color = {92, 53, 102}));
  connect(Three_Phase_Load.hPin_B, V_Source.pinP_phB) annotation(
    Line(points = {{-20, -24}, {-34, -24}, {-34, 2}, {-50, 2}}, color = {92, 53, 102}));
  connect(Three_Phase_Load.hPin_A, V_Source.pinP_phA) annotation(
    Line(points = {{-20, -20}, {-30, -20}, {-30, 10}, {-50, 10}}, color = {92, 53, 102}));
  connect(Power_Fixed.y, Three_Phase_Load.S_input) annotation(
    Line(points = {{18, -28}, {0, -28}}, color = {85, 170, 255}));
  connect(Three_Phase_Load.hPin_N, Ground_AC.pin) annotation(
    Line(points = {{-20, -36}, {-60, -36}, {-60, -80}}, color = {117, 80, 123}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false), graphics = {Text(origin = {-8, 89}, extent = {{-14, 9}, {98, -11}}, textString = "Required: This block sets the system parameters.
(Not including this would throw an error.)", horizontalAlignment = TextAlignment.Left), Ellipse(origin = {-81, 81}, lineColor = {239, 41, 41}, pattern = LinePattern.Dash, extent = {{-15, 15}, {15, -15}}, endAngle = 360), Line(origin = {-24.36, 34.16}, points = {{-2, 54}, {-42, 52}}, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier)}),
    Documentation(info = "<html>
<p>Example demonstrating a simple harmonic load. The harmonic load is modeled as a harmonics injecting current source. The harmonic injection spectra is derived from a typical AC to DC converter. The load acts as a current sink at the fundamental harmonic and as a current source at higher harmonics.</p>
<p>Harmonic injection spectra for the harmonic load is shown in Figure 1.</p>
<p><img src=\"modelica://HPF/Resources/images/Examples/Basics/SimpleHarmonicLoad/fig_injectionSpectra.png\"/></p>
<p>Figure 1. Harmonic producing load injection spectra.</p>
</html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 1),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end AC_Loads;
