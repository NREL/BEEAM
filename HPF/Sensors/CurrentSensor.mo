within HPF.Sensors;

model CurrentSensor "Current sensor"
  extends HPF.SinglePhase.Interface.TwoPinBase;
  Modelica.Blocks.Interfaces.RealOutput iMag[systemDef.numHrm](each unit = "A") annotation(
    Placement(visible = true, transformation(origin = {-40, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {-50, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput iArg[systemDef.numHrm](each unit = "rad") annotation(
    Placement(visible = true, transformation(origin = {40, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {50, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  iMag = Modelica.ComplexMath.abs(i);
  iArg = Modelica.ComplexMath.arg(i);
/*
    An ammeter is a zero impedance device connected in series.
    Therefore voltage drop = 0.
  */
  v[:].re = {0.0 for i in 1:1:systemDef.numHrm};
  v[:].im = {0.0 for i in 1:1:systemDef.numHrm};
  annotation(
    Icon(graphics = {Text(origin = {-46, 58}, extent = {{-94, 70}, {12, 42}}, textString = "Mag"), Text(origin = {46, 62}, extent = {{4, 66}, {114, 38}}, textString = "Angle"), Text(origin = {0, -180}, lineColor = {92, 53, 102}, extent = {{-150, 60}, {150, 100}}, textString = "%name"), Line(origin = {85, 0}, points = {{-15, 0}, {15, 0}}), Ellipse(extent = {{-70, 70}, {70, -70}}, endAngle = 360), Text(origin = {20, -51.22}, lineColor = {92, 53, 102}, lineThickness = 1, extent = {{-60, 111.22}, {20, -8.78}}, textString = "A"), Line(origin = {-85, 0}, points = {{15, 0}, {-15, 0}}), Line(origin = {-42.8037, 79.8037}, points = {{-7.19635, 20.1963}, {-7.19635, 0.196347}, {6.80365, -19.8037}}), Line(origin = {40.7929, 80.7929}, points = {{9.20711, 19.2071}, {9.20711, -0.792893}, {-4.79289, -20.7929}})}, coordinateSystem(initialScale = 0.1)));
end CurrentSensor;