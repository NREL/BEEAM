within HPF.Example_HPF_Fuchs;

model Comp_Load
extends Interfaces.TwoPinBase;

  parameter Complex p(re(start=1), im(start=0));
  
equation
  /*
     load is only defined at the fundamental
  
  */
  p = v[1] * Modelica.ComplexMath.conj(i[1]);
  Complex(0.0) = v[2] * Modelica.ComplexMath.conj(i[1]);

annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));end Comp_Load;