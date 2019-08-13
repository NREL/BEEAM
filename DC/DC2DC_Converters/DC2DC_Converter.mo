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
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(origin = {0, -1}, extent = {{-90, 139}, {90, -139}}), Line(origin = {-47, 9.9633}, points = {{-23, 0}, {27, 0}}), Line(origin = {-46.26, -12.08}, points = {{-23, 0}, {27, 0}}, pattern = LinePattern.Dash), Line(origin = {44.4196, -10.1866}, points = {{-23, 0}, {27, 0}}, pattern = LinePattern.Dash), Line(origin = {43.6796, 11.8567}, points = {{-23, 0}, {27, 0}}), Line(origin = {7.77913, 28.8419}, points = {{-27, -68}, {13, 12}}), Text(origin = {3, 167}, extent = {{-65, 15}, {49, -33}}, textString = "%name")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));end DC2DC_Converter;