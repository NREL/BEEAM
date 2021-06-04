within HPF.Sensors;

model MultiSensor "Power sensor (along with voltage and current sense)"
  outer SystemDef systemDef;
  HPF.Sensors.CurrentSensor currentSensor annotation(
    Placement(visible = true, transformation(origin = {-44, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor voltageSensor annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Interface.HPin_N hPin_NV(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput P annotation(
  Placement(visible = true, transformation(origin = {-69, 95}, extent = {{-9, -9}, {9, 9}}, rotation = 0), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput iMag[systemDef.numHrm] "Current magnitude" annotation(
  Placement(visible = true, transformation(origin = {-38, 94}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {128, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput iArg[systemDef.numHrm] "Current phase angle" annotation(
    Placement(visible = true, transformation(origin = {-32, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vMag[systemDef.numHrm] "Voltage magnitude" annotation(
    Placement(visible = true, transformation(origin = {-94, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-150, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealOutput vArg[systemDef.numHrm] "Voltage phase angle" annotation(
    Placement(visible = true, transformation(origin = {-84, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-150, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.SinglePhase.Interface.HPin_P hPin_PC(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N hPin_NC(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  
  P = sum(voltageSensor.v[:].re .* currentSensor.i[:].re + voltageSensor.v[:].im .* currentSensor.i[:].im); // S = P + jQ = V*conj(I) = (Vre*Ire + Vim*Iim) + j(Vim*Ire - Vre*Iim)
  iMag[:] = currentSensor.iMag[:];
  iArg[:] = currentSensor.iArg[:];
  vMag[:] = voltageSensor.vMag[:];
  vArg[:] = voltageSensor.vArg[:];
  connect(voltageSensor.pin_n, hPin_NV) annotation(
    Line(points = {{0, 10}, {0, -100}}, color = {117, 80, 123}));
  connect(hPin_NC, currentSensor.pin_n) annotation(
    Line(points = {{100, 0}, {-34, 0}}));
  connect(currentSensor.pin_p, hPin_PC) annotation(
    Line(points = {{-54, 0}, {-100, 0}}, color = {92, 53, 102}));
  connect(voltageSensor.pin_p, hPin_PC) annotation(
    Line(points = {{0, 30}, {-100, 30}, {-100, 0}}, color = {92, 53, 102}));
  annotation(
    Diagram,
    Icon(graphics = {Ellipse(extent = {{-70, 70}, {70, -70}}, endAngle = 360), Line(origin = {-85, 0}, points = {{15, 0}, {-15, 0}}), Line(origin = {85, 0}, points = {{-15, 0}, {15, 0}}), Line(origin = {0, -85}, points = {{0, 15}, {0, -15}}), Text(origin = {20, -51.22}, lineColor = {92, 53, 102}, lineThickness = 1, extent = {{-60, 111.22}, {20, -8.78}}, textString = "W"), Text(origin = {170, -140}, lineColor = {92, 53, 102}, extent = {{-150, 60}, {150, 100}}, textString = "%name"), Text(origin = {28.7925, 32}, extent = {{-40.7925, 70}, {5.20755, 42}}, textString = "P"), Text(origin = {114.26, 58}, extent = {{-76.2596, 70}, {9.74043, 42}}, textString = "iMag"), Text(origin = {114.26, 19}, extent = {{-76.2596, 65}, {9.74043, 39}}, textString = "iArg"), Text(origin = {-68.646, 61}, extent = {{-83.3535, 65}, {10.6465, 39}}, textString = "vMag"), Text(origin = {-69.967, 16}, extent = {{-78.033, 70}, {9.96696, 42}}, textString = "vArg"), Line(origin = {76.28, 79.92}, points = {{42.1917, 20.1917}, {-15.8083, 20.1917}, {-41.8083, -17.8083}}, pattern = LinePattern.Dash), Line(origin = {84.16, 56.13}, points = {{33.8372, 3.86773}, {-24.1628, 3.86773}, {-36.1628, -6.13227}, {-34.1628, -4.13227}}, pattern = LinePattern.Dash), Line(origin = {-86.81, 80.81}, points = {{-53.195, 19.195}, {26.805, 19.195}, {52.805, -18.805}}, pattern = LinePattern.Dash), Line(origin = {-93.81, 55.81}, points = {{-46.1934, 4.19338}, {33.8066, 4.19338}, {45.8066, -3.80662}}, pattern = LinePattern.Dash), Line(origin = {0, 85}, points = {{0, 15}, {0, -15}}, pattern = LinePattern.Dash)}));
end MultiSensor;