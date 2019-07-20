within HPF.SinglePhase.Components;
model Resistor
  extends HPF.SinglePhase.Interface.TwoPinBase;
  HPF.Utilities.ComponentProperties properties(ComponentType = "Resistor");
  import Modelica.ComplexMath.j;
  parameter Real r(start = 1) = 1 "Resistance (ohm)";

  /*
    Fundamental harmonic values display
  */
  Real vFundAbs = Modelica.ComplexMath.'abs'(v[1]);
  Real vFundArg = Modelica.ComplexMath.arg(v[1]);
  Real iFundAbs = Modelica.ComplexMath.'abs'(i[1]);
  Real iFundArg = Modelica.ComplexMath.arg(i[1]);

equation
  /*
    vRe + j*vIm = (zRe*iRe - zIm*iIm) + j*(zRe*iIm + zIm*iRe);
    For a resistor, zIm = 0.
    vRe + j*vIm = (zRe*iRe) + j*(zRe*iIm);
  */
  v[:].re = r .* i[:].re;
  v[:].im = r .* i[:].im;

annotation (
  defaultComponentName = "r",
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Line(origin = {0, -1.03056}, points = {{-90, 1.03056}, {-70, 1.03056}, {-50, 21.0306}, {-34, -18.9694}, {-8, 19.0306}, {8, -20.9694}, {36, 19.0306}, {48, -20.9694}, {72, -0.969443}, {74, 1.03056}, {90, 1.03056}}), Text(origin = {5, 45}, extent = {{-43, 19}, {43, -19}}, textString = "%name"), Text(origin = {3, -39}, extent = {{-43, 19}, {43, -19}}, textString = "R = %r")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Resistor;
