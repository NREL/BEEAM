within HPF.DC;

model DC_Load
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  HPF.Utilities.ComponentProperties properties(ComponentType = "DC_Load");
  
  parameter Real pwr(start = 1) = 1 "Power (watts)";

  model DC_DC_Converter
  equation

    annotation(
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end DC_DC_Converter;
equation
  pwr = v * i;
  
annotation(
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Line(origin = {-0.58, -1.98}, points = {{26.5789, -24.0161}, {-11.4211, 1.98388}, {16.5789, 1.98388}, {-21.4211, 23.9839}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Rectangle(origin = {7, 10}, extent = {{-67, 20}, {53, -40}}), Line(origin = {-76, 0}, points = {{-16, 0}, {16, 0}}), Line(origin = {75, 0}, points = {{-15, 0}, {15, 0}}), Text(origin = {-82, 55}, extent = {{-22, 11}, {188, -29}}, textString = "%name"), Text(origin = {-74, -41}, extent = {{-22, 11}, {172, -23}}, textString = "P = %pwr")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
    
end DC_Load;