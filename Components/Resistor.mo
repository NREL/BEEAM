within HPF.Components;

model Resistor
  extends HPF.Interfaces.TwoPinBase;
  parameter Modelica.SIunits.Resistance R(start = 1)
   "Resistance (ohm)";
equation

  v = R * i; 
  
annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0})),
    __OpenModelica_commandLineOptions = "");end Resistor;