within HPF.Sensors;
model CurrentSensor "Current sensor"
  extends HPF.SinglePhase.Interface.TwoPinBase;
  Modelica.Blocks.Interfaces.RealOutput iMag[systemDef.numHrm](each unit = "A") annotation (
    Placement(visible = true, transformation(origin = {12, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput iArg[systemDef.numHrm](each unit = "rad") annotation (
    Placement(visible = true, transformation(origin = {44, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  iMag = Modelica.ComplexMath.'abs'(i);
  iArg = Modelica.ComplexMath.arg(i);
/*
    An ammeter is a zero impedance device connected in series.
    Therefore voltage drop = 0.
  */
/*
  v[:].re = 1e-10 .* i[:].re - 1e-10 .* i[:].im;
  v[:].im = 1e-10 .* i[:].im + 1e-10 .* i[:].re;
  */
  v[:].re = {0.0 for i in 1:1:systemDef.numHrm};
  v[:].im = {0.0 for i in 1:1:systemDef.numHrm};
  annotation (
    Icon(graphics = {Ellipse(origin = {1, -1}, extent = {{-69, 67}, {69, -67}}, endAngle = 360), Line(origin = {-82, 0}, points = {{-14, 0}, {14, 0}}), Line(origin = {84.0747, -0.214932}, points = {{-14, 0}, {14, 0}}), Text(origin = {12, -38}, lineColor = {92, 53, 102}, lineThickness = 1, extent = {{-36, 76}, {12, -6}}, textString = "A"), Text(origin = {2, -2},extent = {{-94, 70}, {12, 42}}, textString = "|Mag|"), Text(origin = {-16, 2},extent = {{4, 66}, {114, 38}}, textString = "∠Angle"), Text(origin = {-6, -86}, extent = {{-316, 24}, {316, -24}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end CurrentSensor;