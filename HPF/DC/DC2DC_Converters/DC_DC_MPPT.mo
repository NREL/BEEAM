within HPF.DC.DC2DC_Converters;
model DC_DC_MPPT
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  Modelica.Blocks.Interfaces.RealInput P_pv(start=0)   "Input Power" annotation (
    Placement(visible = true, transformation(extent={{-15,-15},{15,15}},     rotation=0,
        origin={-99,73}),                                                                   iconTransformation(origin={-76,-80}, extent = {{-20, -20}, {20, 20}}, rotation=90)));


  parameter Modelica.SIunits.Power P_nom = 1000 "Nominal power" annotation (
    Dialog(group = "Device Ratings"));
  parameter Modelica.SIunits.Voltage VDC_nom = 380 "Nominal DC operating voltage" annotation (
    Dialog(group = "Device Ratings"));
  // Loss model parameters
  parameter Real alpha = 0.0 "Loss model constant term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Real beta =  0.1 "Loss model linear term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Real gamma = 0.0 "Loss model quadratic term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  Real P_DC;

  Modelica.Blocks.Interfaces.RealOutput P_Loss "Converter Loss" annotation (
    Placement(visible = true, transformation(origin={110,-86},  extent = {{-10, -10}, {10, 10}}, rotation=0),   iconTransformation(origin={108,90},   extent = {{-10, -10}, {10, 10}}, rotation=0)));



equation
  i = -P_DC / VDC_nom;
  P_pv = P_DC + P_Loss;
  P_Loss = P_nom * (alpha + beta * (P_DC/P_nom) + gamma * (P_DC/P_nom)^2);






  annotation (Icon(graphics={                              Rectangle(origin={-1,
              24},                                                                     extent={{
              -99,124},{99,-124}}),                                                                                        Line(origin={
              -58.3552,31.1638},                                                                                                                              points = {{-13, 0}, {27, 0}}), Line(origin={
              -58.6,6.4123},                                                                                                                                                                                                  points = {{-13, 0}, {27, 0}}, pattern = LinePattern.Dash), Line(origin={
              5.7791,46.8419},                                                                                                                                                                                                        points = {{-49, -90}, {35, 34}}), Line(origin={
              40.1208,31.1638},                                                                                                                                                                                                        points = {{-13, 0}, {27, 0}}), Line(origin={
              39.876,6.4123},                                                                                                                                                                                                        points = {{-13, 0}, {27, 0}}, pattern = LinePattern.Dash)}));
end DC_DC_MPPT;
