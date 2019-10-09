within HPF.SinglePhase.Components;
model Resistor "Resistive element"
  extends HPF.SinglePhase.Interface.TwoPinBase;
  HPF.Utilities.ComponentProperties properties(final ComponentType = "Resistor");
  import Modelica.ComplexMath.j;
  parameter Real r(start = 1) = 1 "Resistance (ohm)";

  /*
    Fundamental harmonic values display, For debugging
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
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Line(origin = {0, -1.03}, points = {{-90, 1.03056}, {-70, 1.03056}, {-50, 21.0306}, {-30, -18.9694}, {-10, 21.0306}, {10, -18.9694}, {30, 21.0306}, {52, -18.9694}, {72, -0.969443}, {74, 1.03056}, {90, 1.03056}}), Text(origin = {-1, 41}, extent = {{-65, 31}, {43, -19}}, textString = "%name"), Text(origin = {1, -43}, extent = {{-43, 19}, {43, -19}}, textString = "R = %r")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Resistor;
