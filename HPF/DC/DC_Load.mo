within HPF.DC;

model DC_Load
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  HPF.Utilities.ComponentProperties properties(ComponentType = "DC_Load");
  parameter Modelica.SIunits.Power pwr(start = 1) = 1 "Power (watts)";
equation
  i = pwr / v;
  annotation(
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Line(origin = {-0.58, -1.98}, points = {{26.5789, -24.0161}, {-11.4211, 1.98388}, {16.5789, 1.98388}, {-21.4211, 23.9839}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 2), Rectangle(origin = {7, 10}, extent = {{-67, 20}, {53, -40}}), Line(origin = {-76, 0}, points = {{-16, 0}, {16, 0}}), Line(origin = {75, 0}, points = {{-15, 0}, {15, 0}}),   Text(origin = {-64, -140}, extent = {{-156, 60}, {284, 100}}, textString = "P = %pwr"), Text(origin = {-4, -20}, extent = {{-150, 60}, {150, 100}}, textString = "%name")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end DC_Load;