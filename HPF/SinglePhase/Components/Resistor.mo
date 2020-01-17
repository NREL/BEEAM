within HPF.SinglePhase.Components;
model Resistor "Resistive element"
  extends HPF.SinglePhase.Interface.TwoPinBase;
  HPF.Utilities.ComponentProperties properties(final ComponentType = "Resistor");
  import Modelica.ComplexMath.j;
  parameter Modelica.SIunits.Resistance r(start = 1) = 1 "Resistance (ohm)";

  /*
    Fundamental harmonic values display, For debugging
  */
  Modelica.SIunits.Voltage vFundAbs = Modelica.ComplexMath.'abs'(v[1]);
  Modelica.SIunits.Angle vFundArg = Modelica.ComplexMath.arg(v[1]);
  Modelica.SIunits.Voltage iFundAbs = Modelica.ComplexMath.'abs'(i[1]);
  Modelica.SIunits.Angle iFundArg = Modelica.ComplexMath.arg(i[1]);

equation
  /*
    vRe + j*vIm = (zRe*iRe - zIm*iIm) + j*(zRe*iIm + zIm*iRe);
    For a resistor, zIm = 0.
    vRe + j*vIm = (zRe*iRe) + j*(zRe*iIm);
  */
  v[:].re = r .* i[:].re - 0 .* i[:].im;
  v[:].im = r .* i[:].im + 0 .* i[:].re;

annotation (
  defaultComponentName = "R",
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={Rectangle(lineColor = {92, 53, 102}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                               FillPattern.Solid, extent = {{-70, 30}, {70, -30}}), Line(origin = {85, 0}, points = {{-15, 0}, {15, 0}}, color = {92, 53, 102}), Line(origin = {-85.07, -0.21}, points = {{-15, 0}, {15, 0}}, color = {92, 53, 102}), Text(origin = {-4, -20}, lineColor = {92, 53, 102}, extent = {{-150, 60}, {150, 100}}, textString = "%name"), Text(origin = {-4, -140}, extent = {{-150, 60}, {150, 100}}, textString = "R = %r")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Resistor;
