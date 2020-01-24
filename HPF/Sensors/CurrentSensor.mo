within HPF.Sensors;
model CurrentSensor "Current sensor"
  extends HPF.SinglePhase.Interface.TwoPinBase;

  Modelica.Blocks.Interfaces.RealOutput iMag[systemDef.numHrm](each unit="A") annotation (
    Placement(visible = true, transformation(origin = {12, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-26, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));

  Modelica.Blocks.Interfaces.RealOutput iArg[systemDef.numHrm](each unit="rad") annotation (
    Placement(visible = true, transformation(origin={44,60},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={30,76},     extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  iMag = Modelica.ComplexMath.'abs'(i);
  iArg = Modelica.ComplexMath.arg(i);
  /*
    An ammeter is a zero impedance device connected in series.
    Therefore voltage drop = 0.
  */
  v[:].re = {0.0 for i in 1:1:systemDef.numHrm};
  v[:].im = {0.0 for i in 1:1:systemDef.numHrm};
  
annotation (
    Icon(graphics={  Ellipse(origin = {1, -1}, extent = {{-69, 67}, {69, -67}}, endAngle = 360), Line(origin = {-82, 0}, points = {{-14, 0}, {14, 0}}), Line(origin = {84.0747, -0.214932}, points = {{-14, 0}, {14, 0}}), Text(origin = {12, -38}, lineColor = {92, 53, 102},
            lineThickness =                                                                                                                                                                                                        1, extent = {{-36, 76}, {12, -6}}, textString = "A"),
        Text(
          extent={{-46,68},{-4,40}},
          lineColor={28,108,200},
          textString="Mag"),
        Text(
          extent={{4,66},{80,40}},
          lineColor={28,108,200},
          textString="Angle")},                                                                                                                                                                                                        coordinateSystem(initialScale = 0.1)));
end CurrentSensor;
