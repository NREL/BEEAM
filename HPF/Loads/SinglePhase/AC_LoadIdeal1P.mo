within HPF.Loads.SinglePhase;

model AC_LoadIdeal1P
  extends HPF.Loads.SinglePhase.AC_LoadBase1P;
  Modelica.ComplexBlocks.Interfaces.ComplexInput S_input annotation(
    Placement(visible = true, transformation(extent = {{40, -20}, {80, 20}}, rotation = 0), iconTransformation(origin = {2, 50}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
// User-specified power
  S_load.re = S_input.re;
  S_load.im = S_input.im;
// Current injection: fundamental frequency
  phaseLN.i[1] = Modelica.ComplexMath.conj(S_load / phaseLN.v[1]);
// Current injections: harmonics h > 1
  phaseLN.i[2:1:systemDef.numHrm] = {Complex(0, 0) for i in 2:systemDef.numHrm};

annotation(
    Icon(graphics = {Line(origin = {75, 0}, points = {{-15, 0}, {15, 0}}), Rectangle(origin = {7, 10}, extent = {{-67, 20}, {53, -40}}), Line(origin = {-76, 0}, points = {{-16, 0}, {16, 0}}), Text(origin = {4, 82}, lineColor = {92, 53, 102}, extent = {{-184, -120}, {176, -160}}, textString = "%name")}));
end AC_LoadIdeal1P;
