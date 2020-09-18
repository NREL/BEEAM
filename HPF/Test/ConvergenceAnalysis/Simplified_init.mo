within HPF.Test.ConvergenceAnalysis;
model Simplified_init "Simplified transformer harmonic model"
  outer SystemDef systemDef;
  import Modelica.ComplexMath.j;

  parameter Modelica.SIunits.Voltage nomV_prim = 280 "Primary nominal voltage magnitude (at fundamental)";
  parameter Modelica.SIunits.Voltage nomV_sec = 120 "Secondary nominal voltage magnitude (at fundamental)";
  parameter Modelica.SIunits.Angle phi_prim = 0 "Primary nominal phase";
  parameter Modelica.SIunits.Angle phi_sec = 0 "Secondary nominal phase";

  //final parameter Real N = nomV_prim / nomV_sec "Turns ratio N:1";
  parameter Modelica.SIunits.Resistance Rp = 1 "Primary winding resistance (at fundamental)";
  parameter Modelica.SIunits.Reactance Xp = 1 "Primary winding reactance";
  parameter Modelica.SIunits.Resistance Rs = 1 "Secondary winding resistance";
  parameter Modelica.SIunits.Reactance Xs = 1 "Secondary winding reactance";
  parameter Modelica.SIunits.Resistance Rc = 1 "Core resistance";
  parameter Modelica.SIunits.Reactance Xm = 1 "Magnetizing reactance";
  parameter Real fW = 0 "Resistive losses";
  parameter Real fEC = 0 "Eddy current losses";
  parameter Real fOSL = 0 "Other stray losses";

  /*
    Polar to rectangular conversion for start conditions.
  */
  /*
  Complex nomV_primCmplx = nomV_sec * (cos(phi_prim) * sin(phi_prim)*j);
  Complex nomV_secCmplx = nomV_prim * (cos(phi_sec) * sin(phi_sec)*j);
  */
  //final Real nomV_primCmplx_re = nomV_sec * cos(phi_prim);

  HPF.SinglePhase.Interface.HPin_P pinP_prim(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-102, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinP_sec(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.IdealTransformer idealTransformer( N = nomV_prim / nomV_sec, start_v_im_prim = {286.3814, 0.015803, 0.075166, -0.71381, -0.17532, 0.043611, -0.067128, 0.17974, 0.53228, -0.10329}, start_v_im_sec = {71.5953, 0.0039506, 0.018791, -0.17845, -0.043829, 0.010903, -0.016782, 0.044935, 0.13307, -0.025822}, start_v_re_prim = {-394.1336, 0.51375, -1.2531, -1.044, 0.13336, 0.13321, -0.58708, -0.17828, 0.026204, -0.15337}, start_v_re_sec = {-98.5334, 0.12844, -0.31328, -0.261, 0.033339, 0.033302, -0.14677, -0.044569, 0.006551, -0.038343}) annotation (
    Placement(visible = true, transformation(origin = {26, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R(r = Rc, start_v_im = {286.3814, 0.015803, 0.075166, -0.71381, -0.17532, 0.043611, -0.067128, 0.17974, 0.53228, -0.10329}, start_v_re = {-394.1336, 0.51375, -1.2531, -1.044, 0.13336, 0.13321, -0.58708, -0.17828, 0.026204, -0.15337}) annotation (
    Placement(visible = true, transformation(origin = {-32, -2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Interface.HPin_N pinN_prim(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(extent = {{-110, -50}, {-90, -30}}, rotation = 0), iconTransformation(extent = {{-110, -110}, {-90, -90}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N pinN_sec(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(extent = {{90, -50}, {110, -30}}, rotation = 0), iconTransformation(extent = {{90, -108}, {110, -88}}, rotation = 0)));
  HPF.SinglePhase.Components.HarmonicImpedance Zp(Rh = Rp .+ Rp .* fEC .* systemDef.hrms .^ 2 + Rp .* fOSL .* systemDef.hrms .^ 0.8, Xh = systemDef.hrms .* Xp)  annotation (
    Placement(transformation(extent = {{-66, 20}, {-46, 40}})));
  HPF.SinglePhase.Components.HarmonicImpedance Zs(Rh = Rs .+ Rs .* fEC .* systemDef.hrms .^ 2 + Rs .* fOSL .* systemDef.hrms .^ 0.8, Xh = systemDef.hrms .* Xs)  annotation (
    Placement(visible = true, transformation(extent = {{46, 20}, {66, 40}}, rotation = 0)));
  HPF.SinglePhase.Components.HarmonicImpedance harmonicImpedance(Rh = {0.0 for i in 1:systemDef.numHrm}, Xh = systemDef.hrms .* Xm, start_v_im = {286.3814, 0.015803, 0.075166, -0.71381, -0.17532, 0.043611, -0.067128, 0.17974, 0.53228, -0.10329}, start_v_re = {-394.1336, 0.51375, -1.2531, -1.044, 0.13336, 0.13321, -0.58708, -0.17828, 0.026204, -0.15337})  annotation (
    Placement(visible = true, transformation(origin = {-6, -2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(idealTransformer.pinN_Prim, pinN_prim) annotation (
    Line(points = {{16, -12}, {16, -40}, {-100, -40}}, color = {117, 80, 123}));
  connect(pinN_sec, idealTransformer.pinN_Sec) annotation (
    Line(points = {{100, -40}, {36, -40}, {36, -12}}, color = {117, 80, 123}));
  connect(Zp.pin_p, pinP_prim) annotation (
    Line(points = {{-66, 30}, {-102, 30}}));
  connect(Zp.pin_n, idealTransformer.pinP_Prim) annotation (
    Line(points = {{-46, 30}, {16, 30}, {16, 8}}, color = {117, 80, 123}));
  connect(Zs.pin_n, pinP_sec) annotation (
    Line(points = {{66, 30}, {100, 30}}, color = {117, 80, 123}));
  connect(Zs.pin_p, idealTransformer.pinP_Sec) annotation (
    Line(points = {{46, 30}, {36, 30}, {36, 8}}));
  connect(pinN_prim, R.pin_n) annotation (
    Line(points = {{-100, -40}, {-22, -40}, {-22, -12}, {-32, -12}}));
  connect(R.pin_p, idealTransformer.pinP_Prim) annotation (
    Line(points = {{-32, 8}, {-32, 16}, {-14, 16}, {-14, 30}, {16, 30}, {16, 8}}, color = {92, 53, 102}));
  connect(harmonicImpedance.pin_p, idealTransformer.pinP_Prim) annotation (
    Line(points = {{-6, 8}, {-6, 8}, {-6, 16}, {-14, 16}, {-14, 30}, {16, 30}, {16, 8}, {16, 8}}, color = {92, 53, 102}));
  connect(harmonicImpedance.pin_n, idealTransformer.pinN_Prim) annotation (
    Line(points = {{-6, -12}, {-22, -12}, {-22, -40}, {16, -40}, {16, -12}, {16, -12}, {16, -12}}, color = {117, 80, 123}));
  annotation (defaultComponentName = "T",
    Icon(graphics={  Line(origin = {24.4062, 41.2923}, rotation = 180, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-24.79, 41.7646}, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-25.0534, -41.9362}, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {70, 83}, points = {{-30, -21}, {-30, 17}, {30, 17}}, color = {92, 53, 102}), Line(origin = {23.5864, -0.787392}, rotation = 180, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-74.1399, -85.1311}, points = {{34.0302, 20.999}, {34.0302, -11.001}, {34.0302, -15.001}, {-15.9698, -15.001}}, color = {92, 53, 102}), Line(origin = {24.3724, -43.0963}, rotation = 180, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-24.9217, -0.0858618}, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Ellipse(origin = {-16, 84}, lineColor = {92, 53, 102}, extent = {{-6, 6}, {6, -6}}, endAngle = 360), Line(origin = {69, -79.8843}, points = {{-29, 16}, {-29, -20}, {29, -20}}, color = {92, 53, 102}), Line(origin = {-55.5385, 85.38}, points = {{-37, 14.5}, {15, 14.5}, {15, -13.5}, {15, -21.5}}, color = {92, 53, 102}), Line(origin = {-5.59015, 3}, points = {{0, 57}, {0, -63}}, color = {92, 53, 102}), Line(origin = {5.7869, 3.01632}, points = {{0, 57}, {0, -63}}, color = {92, 53, 102}), Text(origin = {-8, 152}, lineColor = {92, 53, 102}, extent = {{-316, 28}, {318, -32}}, textString = "%name"), Text(origin = {6, -148}, extent = {{-316, 28}, {318, -32}}, textString = "Simplified")}, coordinateSystem(initialScale = 0.1)),
  Documentation(info = "<html><head></head><body>Transformer model with exact initialization values.<div><br></div><div>Specifically for use with toy model.</div></body></html>"));
end Simplified_init;
