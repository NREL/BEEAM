within HPF.PowerConverters.ThreePhase;

partial model ACDC_3pConverterBase
  // TO DO: Organize this class elsewhere in the library?
  // Harmonic system definition
  outer SystemDef systemDef;
  // Device Ratings
  parameter Modelica.SIunits.Power P_nom = 100 "Nominal power" annotation(
    Dialog(group = "Device Ratings"));
  parameter Modelica.SIunits.Voltage VAC_nom = 277 "Nominal AC operating voltage (line-neutral)" annotation(
    Dialog(group = "Device Ratings"));
  parameter Modelica.SIunits.Voltage VDC_nom = 24 "Nominal DC operating voltage" annotation(
    Dialog(group = "Device Ratings"));
  final parameter Modelica.SIunits.Current IAC_nom = P_nom / 3 / VAC_nom "Nominal AC line current";
  final parameter Modelica.SIunits.Current IDC_nom = P_nom / VDC_nom "Nominal DC current";
  // Initialization
  parameter Modelica.SIunits.Angle vAngle = 0 "Nominal phase A voltage angle for solver init" annotation(
    Dialog(group = "Initialization"));
  final parameter Modelica.SIunits.Angle vAngle_B = vAngle - Modelica.SIunits.Conversions.from_deg(120);
  final parameter Modelica.SIunits.Angle vAngle_C = vAngle + Modelica.SIunits.Conversions.from_deg(120);
  // AC terminals
  HPF.SinglePhase.Interface.HPin_P hPin_A(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, 70}, {-90, 90}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_B(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, 20}, {-90, 40}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_C(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, -30}, {-90, -10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N hPin_N(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, -90}, {-90, -70}}, rotation = 0)));
  // AC load blocks
  HPF.SinglePhase.Interface.LoadBase phaseA(start_i_im = cat(1, {IAC_nom * sin(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_i_re = cat(1, {IAC_nom * cos(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_im = cat(1, {VAC_nom * sin(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re = cat(1, {VAC_nom * cos(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1})) annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Interface.LoadBase phaseB(start_i_im = cat(1, {IAC_nom * sin(vAngle_B)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_i_re = cat(1, {IAC_nom * cos(vAngle_B)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_im = cat(1, {VAC_nom * sin(vAngle_B)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re = cat(1, {VAC_nom * cos(vAngle_B)}, {0.0 for i in 1:systemDef.numHrm - 1})) annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Interface.LoadBase phaseC(start_i_im = cat(1, {IAC_nom * sin(vAngle_C)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_i_re = cat(1, {IAC_nom * cos(vAngle_C)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_im = cat(1, {VAC_nom * sin(vAngle_C)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re = cat(1, {VAC_nom * cos(vAngle_C)}, {0.0 for i in 1:systemDef.numHrm - 1})) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  // DC terminals
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
    Placement(visible = true, transformation(origin = {80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{90, 70}, {110, 90}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
    Placement(visible = true, transformation(origin = {80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{90, -90}, {110, -70}}, rotation = 0)));
  // Converter Loss
  Modelica.Blocks.Interfaces.RealOutput P_Loss "Converter Loss" annotation(
    Placement(visible = true, transformation(origin = {30, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  HPF.DC.DC_Port DC_Port annotation(
    Placement(visible = true, transformation(origin = {40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(phaseA.pin_p, hPin_A) annotation(
    Line(points = {{10, -20}, {10, 80}, {-80, 80}}, color = {92, 53, 102}));
  connect(phaseA.pin_n, hPin_N) annotation(
    Line(points = {{10, -40}, {10, -80}, {-80, -80}}, color = {117, 80, 123}));
  connect(phaseB.pin_p, hPin_B) annotation(
    Line(points = {{-20, -20}, {-20, 40}, {-80, 40}}, color = {92, 53, 102}));
  connect(phaseB.pin_n, hPin_N) annotation(
    Line(points = {{-20, -40}, {-20, -80}, {-80, -80}}, color = {117, 80, 123}));
  connect(phaseC.pin_p, hPin_C) annotation(
    Line(points = {{-50, -20}, {-50, 0}, {-80, 0}}, color = {92, 53, 102}));
  connect(phaseC.pin_n, hPin_N) annotation(
    Line(points = {{-50, -40}, {-50, -80}, {-80, -80}}, color = {117, 80, 123}));
  connect(DC_Port.p, pin_p) annotation(
    Line(points = {{40, -20}, {40, 80}, {80, 80}}, color = {0, 0, 255}));
  connect(DC_Port.n, pin_n) annotation(
    Line(points = {{40, -40}, {40, -80}, {80, -80}}, color = {0, 0, 255}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Text(origin = {4, 0}, lineColor = {92, 53, 102}, extent = {{-184, -120}, {176, -160}}, textString = "%name"), Text(origin = {44, 119}, extent = {{-54, 15}, {54, -15}}, textString = "Ploss"), Line(origin = {1.01175, 2.8636e-05}, points = {{-101, -100}, {99, 100}}), Line(origin = {-16.3007, 24.2009}, points = {{-44.9518, 25.9597}, {-40.9518, 41.9597}, {-34.9518, 57.9597}, {-26.9518, 65.9597}, {-16.9518, 61.9597}, {-10.9518, 45.9597}, {-6.95182, 27.9597}, {-2.95182, 7.9597}, {5.04818, -8.0403}, {15.0482, -14.0403}, {27.0482, -4.0403}, {33.0482, 11.9597}, {37.0482, 25.9596}}, smooth = Smooth.Bezier), Line(origin = {44.6603, -26.7556}, points = {{-25, 0}, {25, 0}}), Line(origin = {45.0343, -49.4288}, points = {{-25, 0}, {25, 0}}, pattern = LinePattern.Dash), Text(origin = {76, 81}, extent = {{8, 17}, {-8, -17}}, textString = "+"), Text(origin = {76, -79}, extent = {{8, 17}, {-8, -17}}, textString = "–"), Text(origin = {-74, 31}, extent = {{8, 17}, {-8, -17}}, textString = "B"), Text(origin = {-76, -19}, extent = {{8, 17}, {-8, -17}}, textString = "C"), Text(origin = {-74, 81}, extent = {{8, 17}, {-8, -17}}, textString = "A"), Text(origin = {-74, -79}, extent = {{8, 17}, {-8, -17}}, textString = "N"), Rectangle(origin = {-1, 0}, extent = {{-99, 100}, {101, -100}})}));
end ACDC_3pConverterBase;
