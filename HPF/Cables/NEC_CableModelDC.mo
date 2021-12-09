within HPF.Cables;

model NEC_CableModelDC ""
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends HPF.Utilities.WireGaugeValues;
   
  parameter HPF.Types.WireGaugeDC wireGaugeDC = HPF.Types.WireGaugeDC.gauge_1; 
  
  parameter Real length = 1 "Length of wire";
  Modelica.Blocks.Interfaces.RealOutput PLoss annotation(
    Placement(visible = true, transformation(origin = {10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  final parameter Real r = length * gaugeResistanceDC[Integer(wireGaugeDC)] / 1000;
equation
  v = i * r;
  PLoss = i^2 * r;
  
annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}), graphics = {Text(origin = {-36, 3.2}, lineColor = {0, 0, 255}, extent = {{-24, 12.8}, {96, -19.2}}, textString = "NEC"), Ellipse(origin = {60, 0}, extent = {{-4, 20}, {4, -20}}, endAngle = 360), Line(origin = {0.247934, 19.7521}, points = {{-60, 0}, {60, 0}}), Line(origin = {77.2479, -0.247934}, points = {{-13, 0}, {13, 0}}), Ellipse(origin = {-60, 0}, extent = {{-4, 20}, {4, -20}}, endAngle = 360), Line(origin = {0.0826449, -20.3305}, points = {{-60, 0}, {60, 0}}), Line(origin = {-74.7521, -0.247934}, points = {{-15, 0}, {15, 0}}), Text(origin = {-4, -120}, lineColor = {0, 0, 255}, extent = {{-150, 60}, {150, 100}}, textString = "%name"), Line(origin = {0, 26}, points = {{0, 6}, {0, -6}}), Text(origin = {70, 47}, extent = {{-54, 15}, {54, -15}}, textString = "PLoss")}));
end NEC_CableModelDC;