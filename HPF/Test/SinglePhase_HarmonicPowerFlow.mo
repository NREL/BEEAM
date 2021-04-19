within HPF.Test;
model SinglePhase_HarmonicPowerFlow
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0, 1.5}, vMag = {150, 5})  annotation (
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = 1 + 2 * j)  annotation (
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-60, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {1, 3})  annotation (
    Placement(visible = true, transformation(origin = {-62, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Test_components.Test_harmonic_load test_harmonic_load1(iSpect_Arg = {0, 0.1}, iSpect_Mag = {4, 2})  annotation (
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(v.pin_n, ground1.pin) annotation (
    Line(points = {{-60, 0}, {-60, -16}}, color = {117, 80, 123}));
  connect(v.pin_p, z.pin_p) annotation (
    Line(points = {{-60, 20}, {-40, 20}}));
  connect(z.pin_n, test_harmonic_load1.pin_p) annotation (
    Line(points = {{-20, 20}, {0, 20}, {0, 20}, {0, 20}}, color = {117, 80, 123}));
  connect(test_harmonic_load1.pin_n, ground1.pin) annotation (
    Line(points = {{0, 0}, {0, 0}, {0, -16}, {-60, -16}, {-60, -16}}, color = {117, 80, 123}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0}),
    graphics = {Text(origin = {-67, 86}, extent = {{-23, 6}, {159, -8}}, textString = "Test Model: Single phase harmonic power flow.
Refer documentation for details.", horizontalAlignment = TextAlignment.Left)}),
    Documentation(info = "<html><head></head>
<body>
Single phase harmonic power flow test setup. A harmonic source is setup. User specifies the total absorbed power at the input of the system. The converter is associated with a fixed harmonic injection spectrum that can be scaled (requires further digging and research).&nbsp;
<div>
  <br>
</div>
<div>
The system would have the following relation,</div><div><br></div><div>P = sum(I_h * conj(I_h))</div><div><br></div><div>The current would have a scaling factor.</div><div><br></div><div><br></div>

</body></html>"),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=initialization",
  __OpenModelica_simulationFlags(ls = "totalpivot", lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"));
end SinglePhase_HarmonicPowerFlow;
