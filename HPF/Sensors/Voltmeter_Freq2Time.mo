within HPF.Sensors;
model Voltmeter_Freq2Time "Voltage sensor. Converts harmonics (freq domain) to time waveforms"
  extends HPF.SinglePhase.Interface.TwoPinBase;
  Modelica.Blocks.Interfaces.RealOutput y annotation (
    Placement(visible = true, transformation(origin = {12, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation

annotation (
    Icon(graphics={  Ellipse(origin = {1, -1}, extent = {{-69, 67}, {69, -67}}, endAngle = 360), Line(origin = {31.19, 19.07}, rotation = 180, points = {{-13.593, -0.947214}, {-11.593, 3.05279}, {-9.59296, 7.05279}, {-5.59296, 9.05279}, {-1.59296, 5.05279}, {0.407041, -0.947214}, {4.40704, -8.94721}, {10.407, -8.94721}, {14.407, -2.94721}, {14.407, -0.947214}, {14.407, -0.947214}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-78, -4.70267e-07}, points = {{-14, 0}, {10, 0}}), Line(origin = {82, 0}, points = {{8, 0}, {-12, 0}}), Line(origin = {-0.18, 22.4}, points = {{-4.85355, -2.20711}, {5.14645, -2.20711}, {1.14645, 1.79289}}, color = {92, 53, 102}), Line(origin = {2.97, 18.19}, points = {{2, 2}, {-2, -2}}, color = {92, 53, 102}), Line(origin = {-28.8602, 25.4946}, points = {{0, 11}, {0, -11}}, color = {92, 53, 102}), Line(origin = {-23.7489, 25.4493}, points = {{0, 5}, {0, -11}}, color = {92, 53, 102}), Line(origin = {-18.7464, 25.5073}, points = {{0, -1}, {0, -11}}, color = {92, 53, 102}), Line(origin = {-14.2268, 25.4062}, points = {{0, -5}, {0, -11}}, color = {92, 53, 102}), Text(origin = {12, -60}, lineColor = {92, 53, 102},
            lineThickness =                                                                                                                                                                                                        1, extent = {{-36, 76}, {12, -6}}, textString = "V")}, coordinateSystem(initialScale = 0.1)));
end Voltmeter_Freq2Time;
