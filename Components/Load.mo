within HPF.Components;
model Load "Load at fundamental harmonic"
extends HPF.Interfaces.TwoPinBase;

  parameter Modelica.SIunits.ComplexPower p(re(start=1),im(start=0)) "Complex Power";

equation
  p = v[1] * Modelica.ComplexMath.conj(i[1]);
  v[2:3] .* Modelica.ComplexMath.conj(i[2:3]) = {Complex(0.0) for i in 2:3};
  
annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0})),
  Documentation(info = "<html><head></head><body>adadad</body></html>"),
  __OpenModelica_commandLineOptions = "");
  
end Load;
