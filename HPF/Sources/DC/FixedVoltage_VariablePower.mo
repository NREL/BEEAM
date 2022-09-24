within HPF.Sources.DC;

model FixedVoltage_VariablePower "DC Power Source: Fixed Voltage, Fixed Current"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter Modelica.SIunits.Voltage v_out(start = 1) = 1 "DC Output Voltage";
  Modelica.Blocks.Interfaces.RealInput p_out(start = 1) "DC Output Power" annotation(
    Placement(visible = true, transformation(extent = {{-22, 58}, {18, 98}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  v = v_out;
  i = -(p_out / v_out);
  annotation(
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Line(origin = {-76, 0}, points = {{-16, 0}, {16, 0}}), Line(origin = {75, 0}, points = {{-15, 0}, {15, 0}}),   Text(origin = {0, -160}, extent = {{-150, 60}, {150, 100}}, textString = "%name"), Line(points = {{40, 0}, {-40, 0}}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 16), Ellipse(extent = {{-60, 60}, {60, -60}}, endAngle = 360), Line(origin = {-80, 30}, points = {{0, 10}, {0, -10}, {0, -10}}), Line(origin = {79.802, 30}, points = {{-10, 0}, {10, 0}}), Line(origin = {79.802, 30}, points = {{-10, 0}, {10, 0}}), Line(origin = {-80.594, 30}, points = {{-10, 0}, {12, 0}}), Text(origin = {58, 80}, extent = {{-30, 12}, {30, -12}}, textString = "Power")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));

end FixedVoltage_VariablePower;
