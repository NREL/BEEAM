within HPF.Test;

model ACDC_Converter_ParameterizedMdl
  import Modelica.ComplexMath.j;
  HPF.PowerConverters.SinglePhase.ACDC_ParameterizedMdl converter_single1(V_Rect = 24, alpha = 0.9689, beta = 0.09204, gamma = 0.000376, magModelParams = {-0.16171, -0.00299, 0.00888, -0.00097, -0.19875, 0.12419}, phAngModelParams = {2.09601, -1.56828, -0.01429, 0.00152, 0.00009}) annotation(
    Placement(visible = true, transformation(origin = {32, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-80, -32}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 50) annotation(
    Placement(visible = true, transformation(origin = {64, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0, 0}, vMag = {120, 1e-9}) annotation(
    Placement(visible = true, transformation(origin = {-80, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {58, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {1, 3}) annotation(
    Placement(visible = true, transformation(extent = {{-84, 26}, {-56, 50}}, rotation = 0)));
  HPF.Sensors.CurrentSensor msrI_single annotation(
    Placement(visible = true, transformation(origin = {-8, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 0.05 + 1e-7 * j) annotation(
    Placement(visible = true, transformation(origin = {-52, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(converter_single1.pin_p, dC_Load.p) annotation(
    Line(points = {{42, 4}, {54, 4}}, color = {0, 0, 255}));
  connect(ground.pin, v.pin_n) annotation(
    Line(points = {{-80, -24}, {-80, -16}}, color = {92, 53, 102}));
  connect(converter_single1.pin_n, ground1.p) annotation(
    Line(points = {{42, -12}, {58, -12}, {58, -22}}, color = {0, 0, 255}));
  connect(v.pin_n, converter_single1.hPin_N) annotation(
    Line(points = {{-80, -16}, {14, -16}, {14, -12}, {22, -12}}, color = {117, 80, 123}));
  connect(z.pin_n, msrI_single.pin_p) annotation(
    Line(points = {{-42, 4}, {-18, 4}}, color = {117, 80, 123}));
  connect(msrI_single.pin_n, converter_single1.hPin_P) annotation(
    Line(points = {{2, 4}, {22, 4}}, color = {117, 80, 123}));
  connect(z.pin_p, v.pin_p) annotation(
    Line(points = {{-62, 4}, {-80, 4}}, color = {92, 53, 102}));
  connect(dC_Load.n, converter_single1.pin_n) annotation(
    Line(points = {{74, 4}, {84, 4}, {84, -12}, {42, -12}}, color = {0, 0, 255}));
end ACDC_Converter_ParameterizedMdl;