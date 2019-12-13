within HPF.Test_components;

model Load_Terminal
  outer SystemDef systemDef;
  HPF.SinglePhase.Interface.HPin_P hPin_P(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-38, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real P = 1000;
  parameter Real phi = 0.1;
  
  Real vMag = Modelica.ComplexMath.'abs'(hPin_P.v[1]);
  Real iMag = sqrt(hPin_P.iRe[1]^2 * hPin_P.iIm[1]^2);
equation
  
  P = hPin_P.v[:].re * hPin_P.iRe[:] + hPin_P.v[:].im * hPin_P.iIm[:];
  P * tan(phi) = hPin_P.v[:].im * hPin_P.iRe[:] - hPin_P.v[:].re * hPin_P.iIm[:];

annotation(
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}})}));
end Load_Terminal;