within HPF.Sensors;
model VoltageSensor "Voltage sensor"
  extends HPF.SinglePhase.Interface.TwoPinBase;
  Modelica.Blocks.Interfaces.RealOutput vMag[systemDef.numHrm](each unit = "V") annotation (
    Placement(visible = true, transformation(origin = {12, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput vArg[systemDef.numHrm](each unit = "rad") annotation (
    Placement(visible = true, transformation(origin = {38, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  vMag = Modelica.ComplexMath.'abs'(v);
  vArg = Modelica.ComplexMath.arg(v);
  /*
    A voltmeter is an infinite impedance device connected in parallel.
    Therefore it draws no current. Hence i = 0.
  */

  i[:].re = {0.0 for i in 1:1:systemDef.numHrm};
  i[:].im = {0.0 for i in 1:1:systemDef.numHrm};

  annotation (
    Icon(graphics={  Line(origin = {-78, -4.70267e-07}, points = {{-14, 0}, {10, 0}}), Line(origin = {82, 0}, points = {{8, 0}, {-12, 0}}), Ellipse(origin = {1, -1}, extent = {{-69, 67}, {69, -67}}, endAngle = 360), Text(origin = {12, -42}, lineColor = {92, 53, 102},
            lineThickness =                                                                                                                                                                                                        1, extent = {{-36, 76}, {12, -6}}, textString = "V"), Text(origin = {-6, -86}, extent = {{-316, 24}, {316, -24}}, textString = "%name"), Text(origin = {-4, 2}, extent = {{4, 66}, {114, 38}}, textString = "Angle"), Text(origin = {-12, -2}, extent = {{-94, 70}, {12, 42}}, textString = "Mag")}, coordinateSystem(initialScale = 0.1)));
end VoltageSensor;
