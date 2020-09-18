within HPF.SinglePhase.Components;
model Inductor
  extends HPF.SinglePhase.Interface.TwoPinBase;
  import Modelica.ComplexMath.j;

  parameter Modelica.SIunits.Inductance L(start = 1) = 1e-6;

equation
  /*
    vRe + j*vIm = (zRe*iRe - zIm*iIm) + j*(zRe*iIm + zIm*iRe);
    For an inductor, zRe = 0
  */
  v[:].re = - (2*Modelica.Constants.pi*systemDef.fFund*L).*systemDef.hrms .* i[:].im;

  v[:].im = (2*Modelica.Constants.pi*systemDef.fFund*L).*systemDef.hrms .* i[:].re;

annotation (
  defaultComponentName = "L",
    Icon(graphics={  Line(origin = {-42.9878, 10.2999}, points = {{-13.2883, -10}, {-13.2883, -8}, {-13.2883, -4}, {-11.2883, 4}, {-7.28834, 8}, {-3.28834, 10}, {4.71166, 10}, {8.71166, 8}, {12.7117, 4}, {14.7117, -4}, {14.7117, -10}, {14.7117, -10}}, smooth = Smooth.Bezier), Line(origin = {-14.8405, 10.1588}, points = {{-13.2883, -10}, {-13.2883, -8}, {-13.2883, -4}, {-11.2883, 4}, {-7.28834, 8}, {-3.28834, 10}, {4.71166, 10}, {8.71166, 8}, {12.7117, 4}, {14.7117, -4}, {14.7117, -10}, {14.7117, -10}}, smooth = Smooth.Bezier), Line(origin = {13.5273, 10.3522}, points = {{-13.2883, -10}, {-13.2883, -8}, {-13.2883, -4}, {-11.2883, 4}, {-7.28834, 8}, {-3.28834, 10}, {4.71166, 10}, {8.71166, 8}, {12.7117, 4}, {14.7117, -4}, {14.7117, -10}, {14.7117, -10}}, smooth = Smooth.Bezier), Line(origin = {41.276, 9.99051}, points = {{-13.2883, -10}, {-13.2883, -8}, {-13.2883, -4}, {-11.2883, 4}, {-7.28834, 8}, {-3.28834, 10}, {4.71166, 10}, {8.71166, 8}, {12.7117, 4}, {14.7117, -4}, {14.7117, -10}, {14.7117, -10}}, smooth = Smooth.Bezier), Line(origin = {-83, -2}, points = {{-7, 2}, {27, 2}}), Line(origin = {62.4993, -2.16244}, points = {{-7, 2}, {27, 2}}), Text(origin = {-24, -20}, lineColor = {92, 53, 102}, extent = {{-156, 60}, {204, 100}}, textString = "%name"), Text(origin = {-2, -120}, extent = {{-150, 60}, {150, 100}}, textString = "L = %L")}, coordinateSystem(initialScale = 0.1)),
    Documentation(info="<html>
<p>Inductor is a linear circuit element with voltage and current relation at harmonic <i>h</i> given by <img src=\"modelica://HPF/Resources/Images/equations/math_img.png\" alt=\"V^((h))=h*(2*pi*f*L)*I^((h))\"/>. Where <i>L</i> is the inductance. </p>
</html>"));
end Inductor;
