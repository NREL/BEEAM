within HPF.Test_components;
model Test_Load
extends HPF.SinglePhase.Interface.TwoPinBase;
import Modelica.ComplexMath.j;

  parameter Real P1 = 1 "Real Power";
  parameter Real argS = 1 "angle";

  Real magV = Modelica.ComplexMath.'abs'(v[1]);

equation

  P1 = v[:].re*i[:].re + v[:].im*i[:].im;
  P1*tan(argS) = v[:].im*i[:].re - v[:].re*i[:].im;

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Test_Load;
