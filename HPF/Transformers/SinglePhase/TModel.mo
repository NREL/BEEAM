within HPF.Transformers.SinglePhase;
model TModel "Transformer harmonic T-model"
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

  HPF.SinglePhase.Interface.HPin_P pinP_prim(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-102, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinP_sec(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.IdealTransformer idealTransformer( N = nomV_prim / nomV_sec, start_v_im_prim = cat(1, {nomV_prim * sin(phi_prim)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_im_sec = cat(1, {nomV_sec * sin(phi_sec)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re_prim = cat(1, {nomV_prim * cos(phi_prim)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re_sec = cat(1, {nomV_sec * cos(phi_sec)}, {0.0 for i in 1:systemDef.numHrm - 1})) annotation (
    Placement(visible = true, transformation(origin = {26, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R(r = Rc, start_v_im = cat(1, {nomV_prim * sin(phi_prim)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re = cat(1, {nomV_prim * cos(phi_prim)}, {0.0 for i in 1:systemDef.numHrm - 1})) annotation (
    Placement(visible = true, transformation(origin = {-32, -2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Interface.HPin_N pinN_prim(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(extent = {{-110, -50}, {-90, -30}}, rotation = 0), iconTransformation(extent = {{-110, -110}, {-90, -90}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N pinN_sec(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(extent = {{90, -50}, {110, -30}}, rotation = 0), iconTransformation(extent = {{90, -108}, {110, -88}}, rotation = 0)));
  HPF.SinglePhase.Components.HarmonicImpedance Zp(Rh=Rp .* ones(systemDef.numHrm),                                                   Xh = systemDef.hrms .* Xp)  annotation (
    Placement(transformation(extent = {{-66, 20}, {-46, 40}})));
  HPF.SinglePhase.Components.HarmonicImpedance Zs(Rh=Rs .* ones(systemDef.numHrm),                                                   Xh = systemDef.hrms .* Xs)  annotation (
    Placement(visible = true, transformation(extent = {{46, 20}, {66, 40}}, rotation = 0)));
  HPF.SinglePhase.Components.HarmonicImpedance harmonicImpedance(Rh = {0.0 for i in 1:systemDef.numHrm}, Xh = systemDef.hrms .* Xm, start_v_im = cat(1, {nomV_prim * sin(phi_prim)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re = cat(1, {nomV_prim * cos(phi_prim)}, {0.0 for i in 1:systemDef.numHrm - 1}))  annotation (
    Placement(visible = true, transformation(origin = {-6, -2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(idealTransformer.pinN_Prim, pinN_prim) annotation (
    Line(points={{16,-11.8},{16,-40},{-100,-40}},      color = {117, 80, 123}));
  connect(pinN_sec, idealTransformer.pinN_Sec) annotation (
    Line(points={{100,-40},{36,-40},{36,-11.8}},      color = {117, 80, 123}));
  connect(Zp.pin_p, pinP_prim) annotation (
    Line(points = {{-66, 30}, {-102, 30}}, color = {0, 0, 0}));
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
    Line(points={{-6,-12},{-22,-12},{-22,-40},{16,-40},{16,-12},{16,-11.8},{16,-11.8}},            color = {117, 80, 123}));
  annotation (defaultComponentName = "T",
    Icon(graphics={  Line(origin = {24.4062, 41.2923}, rotation = 180, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-24.79, 41.7646}, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-25.0534, -41.9362}, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {70, 83}, points = {{-30, -21}, {-30, 17}, {30, 17}}, color = {92, 53, 102}), Line(origin = {23.5864, -0.787392}, rotation = 180, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-74.1399, -85.1311}, points = {{34.0302, 20.999}, {34.0302, -11.001}, {34.0302, -15.001}, {-15.9698, -15.001}}, color = {92, 53, 102}), Line(origin = {24.3724, -43.0963}, rotation = 180, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-24.9217, -0.0858618}, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Ellipse(origin = {-16, 84}, lineColor = {92, 53, 102}, extent = {{-6, 6}, {6, -6}}, endAngle = 360), Line(origin = {69, -79.8843}, points = {{-29, 16}, {-29, -20}, {29, -20}}, color = {92, 53, 102}), Line(origin = {-55.5385, 85.38}, points = {{-37, 14.5}, {15, 14.5}, {15, -13.5}, {15, -21.5}}, color = {92, 53, 102}), Line(origin = {-5.59015, 3}, points = {{0, 57}, {0, -63}}, color = {92, 53, 102}), Line(origin = {5.7869, 3.01632}, points = {{0, 57}, {0, -63}}, color = {92, 53, 102}), Text(origin = {-8, 152}, lineColor = {92, 53, 102}, extent = {{-316, 28}, {318, -32}}, textString = "%name"), Text(origin = {6, -148}, extent = {{-316, 28}, {318, -32}}, textString = "Simplified")}, coordinateSystem(initialScale = 0.1)),
    Documentation(info="<html>
<p><br>Transfomer is modeled using the equivalent T model, shown in Figure 1. Winding resistances are modeled using the resistances <i>R<sub>P</i></sub> and <i>R<sub>s</i></sub>. Winding inductances are modeled using harmonic inductive elements <i>X<sub>P<sup>(h)</i></sup> and <i>X<sub>S<sup>(h)</i></sup>. Core resitance is modeled using resistor <i>R<sub>C</i></sub>. Core magnetizing reistance is modeled using harmonic inductive element <i>X<sub>m<sup>(h)</i></sup>. </p>
<p><br><img src=\"modelica://HPF/Resources/images/Transformers/SinglePhase/fig_tModelHrm.png\"/></p>
<p>Figure 1. Harmonic T-Model of single phase transformer</p>
</html>"));
end TModel;
