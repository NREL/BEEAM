within HPF.DC.DC2DC_Converters;

model DC2DC_Converter
  /*
    This model builds upon the Analog sublubrary from the Modelica Std Library.
    A two port (for pins) partial model is extended to model a DC-DC converter.
    
    Input port: v1, i1 
    Output port: v2, i2
  */
  extends Modelica.Electrical.Analog.Interfaces.TwoPort;
  
equation

annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));end DC2DC_Converter;