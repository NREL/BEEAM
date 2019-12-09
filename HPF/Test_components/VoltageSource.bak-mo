within HPF.Test_components;
model VoltageSource
extends Interfaces.Source;
  parameter Real vMag[:] = {1} "Voltage source magnitude (Vrms)";
  parameter Real vArg[:] = {0} "Voltage angle (rad)";


equation
  omega = 2 * Modelica.Constants.pi * systemDef.fFund;

  //vMag[1] = Modelica.ComplexMath.'abs'(v[1]);
  v = Complex(vMag.*cos(vArg), vMag.*sin(vArg));
annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end VoltageSource;
