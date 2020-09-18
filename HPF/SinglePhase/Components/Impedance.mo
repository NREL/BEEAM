within HPF.SinglePhase.Components;
model Impedance
  extends HPF.SinglePhase.Interface.TwoPinBase;
  import Modelica.ComplexMath.j;
  /*
    Assigning property values to componens for easy classification in post processing.
    Properties are saved in a record named Properties.
  */
  HPF.Utilities.ComponentProperties properties(ComponentType = "Impedance");

  parameter Complex z(re(start = 1), im(start = 0)) "Impedance, R + jX";
  /*
    Fundamental harmonic values display
  */
  Real vFundAbs = Modelica.ComplexMath.'abs'(v[1]);
  Real vFundArg = Modelica.ComplexMath.arg(v[1]);
  Real iFundAbs = Modelica.ComplexMath.'abs'(i[1]);
  Real iFundArg = Modelica.ComplexMath.arg(i[1]);

equation
  /*
    hrms is a user defined vector specified in systemDef.
    
    Note: (jModelica specific issue)
    Compiler output: The right and left expression types of equation
    are not compatible, type of left-hand side is Complex[1], and
    type of right-hand side is Complex
    
    Remedy: define real and imaginary parts separately.
  */

  /*
    vRe + j*vIm = (zRe*iRe - zIm*iIm) + j*(zRe*iIm + zIm*iRe);
  */
  v[:].re = (z.re .* i[:].re) - ((z.im .* systemDef.hrms) .* i[:].im);
  v[:].im = (z.re .* i[:].im) + ((z.im .* systemDef.hrms) .* i[:].re);
annotation (
  defaultComponentName = "z",
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={Rectangle(lineColor = {92, 53, 102}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                               FillPattern.Solid, extent = {{-70, 30}, {70, -30}}), Text(origin = {-42, 6}, lineColor = {92, 53, 102}, extent = {{-28, 24}, {112, -36}}, textString = "Z"), Line(origin = {-85.07, -0.21}, points = {{-15, 0}, {15, 0}}, color = {92, 53, 102}), Line(origin = {85.0205, -0.21}, points = {{-15, 0}, {15, 0}}, color = {92, 53, 102}), Text(origin = {-24, -20}, lineColor = {92, 53, 102}, extent = {{-156, 60}, {204, 100}}, textString = "%name"), Text(origin = {-2, -140}, extent = {{-150, 60}, {150, 100}}, textString = "Z = %z")}),
    Diagram(coordinateSystem(grid = {0, 0})),
    __OpenModelica_commandLineOptions = "",
    Documentation(info="<html>
<p>Impedance element... Specify the impedance as a Modelica Complex number <i>Z = R + jX</i></p>
<p><br><i>...</i></p>
<p><br>Modelica internally computes the impedance for all the harmonics in the system.</p>
</html>"));
end Impedance;
