within HPF.SinglePhase.Components;
model Impedance
/*
  Impedance is defined at the fundamental.
  At hth harmonic, the impedance is z_h = h*z
*/

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
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Line(origin = {21.1, 10}, points = {{-10, -10}, {-10, -6}, {-8, 2}, {-6, 6}, {-4, 8}, {-2, 10}, {2, 10}, {6, 6}, {8, 2}, {10, -4}, {10, -10}, {10, -10}}, smooth = Smooth.Bezier), Line(origin = {41.07, 10.4}, points = {{-10, -10}, {-10, -6}, {-8, 2}, {-6, 6}, {-4, 8}, {-2, 10}, {2, 10}, {6, 6}, {8, 2}, {10, -4}, {10, -10}, {10, -10}}, smooth = Smooth.Bezier), Line(origin = {61.17, 10.43}, points = {{-10, -10}, {-10, -6}, {-8, 2}, {-6, 6}, {-4, 8}, {-2, 10}, {2, 10}, {6, 6}, {8, 2}, {10, -4}, {10, -10}, {10, -10}}, smooth = Smooth.Bezier), Line(origin = {-5.15, -0.09}, points = {{-5, 0}, {17, 0}}), Line(origin = {85.93, 0.04}, points = {{-15, 0}, {5, 0}}), Line(origin = {-50.83, 0}, points = {{-41.1708, 0}, {-29.1708, 0}, {-19.1708, 20}, {-9.17082, -20}, {0.82918, 20}, {10.8292, -20}, {20.8292, 20}, {30.8292, -20}, {40.8292, 0}}), Text(origin = {33, 45}, extent = {{-111, 37}, {47, -15}}, textString = "%name"), Text(origin = {15, -55}, lineColor = {117, 80, 123}, extent = {{-79, 29}, {47, -15}}, textString = "z=%z")}),
    Diagram(coordinateSystem(grid = {0, 0})),
    __OpenModelica_commandLineOptions = "");
end Impedance;
