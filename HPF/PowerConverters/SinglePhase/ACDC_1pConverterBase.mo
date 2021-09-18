within HPF.PowerConverters.SinglePhase;

partial model ACDC_1pConverterBase
  // Harmonic system definition
  outer SystemDef systemDef;
  
  // Device Ratings
  parameter Modelica.SIunits.Power P_nom = 100 "Nominal power" annotation(
    Dialog(group = "Device Ratings"));
  parameter Modelica.SIunits.Voltage VAC_nom = 120 "Nominal AC operating voltage" annotation(
    Dialog(group = "Device Ratings"));
  parameter Modelica.SIunits.Voltage VDC_nom = 24 "Nominal DC operating voltage" annotation(
    Dialog(group = "Device Ratings"));
  final parameter Modelica.SIunits.Current IAC_nom = P_nom / VAC_nom "Nominal AC current";
  final parameter Modelica.SIunits.Current IDC_nom = P_nom / VDC_nom "Nominal DC current";
  
  // Initialization
  parameter Modelica.SIunits.Angle vAngle = 0 "Nominal voltage angle for solver init" annotation(Dialog(group = "Initialization"));
  
  // AC terminals
  HPF.SinglePhase.Interface.HPin_P hPin_L(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-84, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, 70}, {-90, 90}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N hPin_N(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, -90}, {-90, -70}}, rotation = 0)));
  
  // DC terminals
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
    Placement(visible = true, transformation(origin = {80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{90, 70}, {110, 90}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
    Placement(visible = true, transformation(origin = {80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{90, -90}, {110, -70}}, rotation = 0)));
  HPF.SinglePhase.Interface.LoadBase phaseLN(start_i_im = cat(1, {IAC_nom * sin(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_i_re = cat(1, {IAC_nom * cos(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_im = cat(1, {VAC_nom * sin(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re = cat(1, {VAC_nom * cos(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1})) annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  // Converter Loss
  Modelica.Blocks.Interfaces.RealOutput PLoss "Converter Loss" annotation(
    Placement(visible = true, transformation(origin = {40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));

equation
  connect(phaseLN.pin_n, hPin_N) annotation(
    Line(points = {{-20, -20}, {-20, -60}, {-80, -60}}, color = {117, 80, 123}));
  connect(hPin_L, phaseLN.pin_p) annotation(
    Line(points = {{-84, 42}, {-20, 42}, {-20, 0}}));
  annotation(
    Icon(graphics = {Line(origin = {-47.7858, -4.01698}, points = {{-44.9518, 25.9597}, {-40.9518, 41.9597}, {-34.9518, 57.9597}, {-26.9518, 65.9597}, {-16.9518, 61.9597}, {-10.9518, 45.9597}, {-6.95182, 27.9597}, {-2.95182, 7.9597}, {5.04818, -8.0403}, {15.0482, -14.0403}, {27.0482, -4.0403}, {33.0482, 11.9597}, {37.0482, 25.9596}}, smooth = Smooth.Bezier), Line(origin = {57.1355, -5.36942}, points = {{-25, 0}, {25, 0}}), Line(origin = {1.01175, 2.8636e-05}, points = {{-101, -100}, {99, 100}}), Line(origin = {57.5095, -28.0427}, points = {{-25, 0}, {25, 0}}, pattern = LinePattern.Dash), Rectangle(origin = {-1, 0}, extent = {{-99, 100}, {101, -100}}), Text(origin = {50, 117}, extent = {{-54, 15}, {54, -15}}, textString = "Ploss")}));
end ACDC_1pConverterBase;
