within HPF.Transformers.SinglePhase;
model Simplified "Simplified transformer harmonic model"
  outer SystemDef systemDef;

  parameter Integer N = 1 "Turns ratio N:1";
  parameter Modelica.SIunits.Resistance Rp = 1 "Primary winding resistance (at fundamental)";
  parameter Modelica.SIunits.Reactance Xp = 1 "Primary winding reactance";
  parameter Modelica.SIunits.Resistance Rs = 1 "Secondary winding resistance";
  parameter Modelica.SIunits.Reactance Xs = 1 "Secondary winding reactance";
  parameter Modelica.SIunits.Resistance Rc = 1 "Core resistance";
  parameter Modelica.SIunits.Reactance Xm = 1 "Magnetizing reactance";
  parameter Real fW = 0 "Resistive losses";
  parameter Real fEC = 0 "Eddy current losses";
  parameter Real fOSL = 0 "Other stray losses";

  HPF.SinglePhase.Interface.HPin_P pinP_prim(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {-102, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinP_sec annotation (
    Placement(visible = true, transformation(origin = {100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.IdealTransformer idealTransformer(N=N)
                                                               annotation (
    Placement(visible = true, transformation(origin={16,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R(r=Rc)
                                        annotation (
    Placement(visible = true, transformation(origin={-30,0},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Interface.HPin_N pinN_prim(h=systemDef.numHrm) annotation (
      Placement(transformation(extent={{-110,-110},{-90,-90}}),
        iconTransformation(extent={{-110,-110},{-90,-90}})));
  HPF.SinglePhase.Interface.HPin_N pinN_sec(h=systemDef.numHrm) annotation (
      Placement(transformation(extent={{90,-110},{110,-90}}),
        iconTransformation(extent={{90,-110},{110,-90}})));
  HPF.SinglePhase.Components.HarmonicImpedance Zp
    annotation (Placement(transformation(extent={{-66,20},{-46,40}})));
  HPF.SinglePhase.Components.HarmonicImpedance Zs
    annotation (Placement(transformation(extent={{48,20},{68,40}})));
  HPF.SinglePhase.Components.Impedance z annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-14,0})));
equation

  connect(idealTransformer.pinN_Prim, pinN_prim) annotation (Line(points={{6,-9.8},
          {6,-100},{-100,-100}}, color={117,80,123}));
  connect(pinN_sec, idealTransformer.pinN_Sec) annotation (Line(points={{100,
          -100},{26,-100},{26,-9.8}},
                                color={117,80,123}));
  connect(Zp.pin_p, pinP_prim)
    annotation (Line(points={{-66,30},{-102,30}}, color={0,0,0}));
  connect(Zp.pin_n, idealTransformer.pinP_Prim)
    annotation (Line(points={{-46,30},{6,30},{6,10}}, color={117,80,123}));
  connect(Zs.pin_n, pinP_sec)
    annotation (Line(points={{68,30},{100,30}}, color={117,80,123}));
  connect(Zs.pin_p, idealTransformer.pinP_Sec)
    annotation (Line(points={{48,30},{26,30},{26,10}}, color={0,0,0}));
  connect(R.pin_p, z.pin_n)
    annotation (Line(points={{-30,10},{-14,10}}, color={0,0,0}));
  connect(z.pin_n, idealTransformer.pinP_Prim) annotation (Line(points={{-14,10},
          {-20,10},{-20,30},{6,30},{6,10}}, color={117,80,123}));
  connect(R.pin_n, z.pin_p)
    annotation (Line(points={{-30,-10},{-14,-10}}, color={117,80,123}));
  connect(R.pin_n, pinN_prim) annotation (Line(points={{-30,-10},{-22,-10},{-22,
          -24},{6,-24},{6,-100},{-100,-100}}, color={117,80,123}));
annotation (
    Icon(graphics={  Line(origin = {24.4062, 41.2923}, rotation = 180, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-24.79, 41.7646}, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-25.0534, -41.9362}, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {70, 83}, points = {{-30, -21}, {-30, 17}, {30, 17}}, color = {92, 53, 102}), Line(origin = {23.5864, -0.787392}, rotation = 180, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-74.1399, -85.1311}, points = {{34.0302, 20.999}, {34.0302, -11.001}, {34.0302, -15.001}, {-15.9698, -15.001}}, color = {92, 53, 102}), Line(origin = {24.3724, -43.0963}, rotation = 180, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-24.9217, -0.0858618}, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Ellipse(origin = {-16, 84}, lineColor = {92, 53, 102}, extent = {{-6, 6}, {6, -6}}, endAngle = 360), Line(origin = {69, -79.8843}, points = {{-29, 16}, {-29, -20}, {29, -20}}, color = {92, 53, 102}), Line(origin = {-55.5385, 85.38}, points = {{-37, 14.5}, {15, 14.5}, {15, -13.5}, {15, -21.5}}, color = {92, 53, 102}), Line(origin = {-5.59015, 3}, points = {{0, 57}, {0, -63}}, color = {92, 53, 102}), Line(origin = {5.7869, 3.01632}, points = {{0, 57}, {0, -63}}, color = {92, 53, 102}), Text(origin = {-8, 152}, lineColor = {92, 53, 102}, extent = {{-316, 28}, {318, -32}}, textString = "%name"), Text(origin={6,
              -148},                                                                                                                                                                                                        extent = {{-316, 28}, {318, -32}}, textString = "Simplified")}, coordinateSystem(initialScale = 0.1)));
end Simplified;