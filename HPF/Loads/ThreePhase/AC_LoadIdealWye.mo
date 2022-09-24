within HPF.Loads.ThreePhase;

model AC_LoadIdealWye
  extends HPF.Loads.ThreePhase.AC_LoadBaseWye;
  Modelica.ComplexBlocks.Interfaces.ComplexInput S_input annotation(
    Placement(visible = true, transformation(extent = {{40, -20}, {80, 20}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180)));
equation
  // User-specified power
  S_load.re = S_input.re;
  S_load.im = S_input.im;
  
  // Current injections: fundamental (negative sign to reverse power flow direction)
  phaseA.i[1] = Modelica.ComplexMath.conj((S_load / 3) / phaseA.v[1]);
  phaseB.i[1] = Modelica.ComplexMath.conj((S_load / 3) / phaseB.v[1]);
  phaseC.i[1] = Modelica.ComplexMath.conj((S_load / 3) / phaseC.v[1]);
  
  // Note: Power (not current) is assumed balanced across phases; this might not be accurate?
  
  // Current injections: harmonics h > 1
  phaseA.i[2:1:systemDef.numHrm] = {Complex(0,0) for i in 1:(systemDef.numHrm - 1)};
  phaseB.i[2:1:systemDef.numHrm] = {Complex(0,0) for i in 1:(systemDef.numHrm - 1)};
  phaseC.i[2:1:systemDef.numHrm] = {Complex(0,0) for i in 1:(systemDef.numHrm - 1)};
  annotation(
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-74, -79}, extent = {{8, 17}, {-8, -17}}, textString = "N"), Text(origin = {-74, 81}, extent = {{8, 17}, {-8, -17}}, textString = "A"), Text(origin = {-74, 31}, extent = {{8, 17}, {-8, -17}}, textString = "B"), Text(origin = {-76, -19}, extent = {{8, 17}, {-8, -17}}, textString = "C"), Text(origin = {4, 0}, lineColor = {92, 53, 102}, extent = {{-184, -120}, {176, -160}}, textString = "%name"), Line(points = {{0, 60}, {0, -60}}), Line(origin = {-10, -40}, points = {{-10, 20}, {10, -20}}), Line(origin = {-10, -40}, points = {{30, 20}, {10, -20}})}));
end AC_LoadIdealWye;
