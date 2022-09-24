within HPF.DC;

model DC_Port
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  Modelica.SIunits.Power pwr "Component power";
equation
  pwr = v*i;
  annotation(
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {7, 10}, extent = {{-67, 20}, {53, -40}}), Line(origin = {-76, 0}, points = {{-16, 0}, {16, 0}}), Line(origin = {75, 0}, points = {{-15, 0}, {15, 0}}),   Text(origin = {-4, -20}, extent = {{-150, 60}, {150, 100}}, textString = "%name")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end DC_Port;
