within HPF.Sensors;
model Voltmeter_Freq2Time "Voltage sensor. Converts harmonics (freq domain) to time waveforms"
  extends HPF.SinglePhase.Interface.TwoPinBase;
  Modelica.Blocks.Interfaces.RealOutput y annotation (
    Placement(visible = true, transformation(origin = {12, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation

annotation (
    Icon(graphics = {Ellipse(origin = {1, -1}, extent = {{-69, 67}, {69, -67}}, endAngle = 360), Line(origin = {33.6378, 0.0447845}, rotation = 90, points = {{-20, 25.5333}, {0, -26.4667}, {20, 25.5333}}, thickness = 2), Line(origin = {-28.7402, -39.8426}, rotation = -90, points = {{0, 12}, {0, -12}}), Line(origin = {-29.1339, -35.0395}, rotation = -90, points = {{0, 12}, {0, -4}}), Line(origin = {-29.0551, -30.2364}, rotation = -90, points = {{0, 12}, {0, 2}}), Line(origin = {-27.6387, 5.37874}, rotation = -90, points = {{-13.593, -0.947214}, {-11.593, 3.05279}, {-9.59296, 7.05279}, {-5.59296, 9.05279}, {-1.59296, 5.05279}, {0.407041, -0.947214}, {4.40704, -8.94721}, {10.407, -8.94721}, {14.407, -2.94721}, {14.407, -0.947214}, {14.407, -0.947214}}, smooth = Smooth.Bezier), Line(origin = {-78, -4.70267e-07}, points = {{-14, 0}, {10, 0}}), Line(origin = {82, 0}, points = {{8, 0}, {-12, 0}})}));
end Voltmeter_Freq2Time;
