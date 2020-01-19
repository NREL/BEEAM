within HPF.Test;
model SinglePhase_Transformer
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Components.IdealTransformer idealTransformer1(N = 10)  annotation (
    Placement(visible = true, transformation(origin={-10,48},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {1})  annotation (
    Placement(visible = true, transformation(origin={-50,90},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={-66,18},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 10 + 5 * j)  annotation (
    Placement(visible = true, transformation(origin={30,58},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(theta(fixed = true, start = 0),vArg = {0}, vMag = {10})  annotation (
    Placement(visible = true, transformation(origin={-66,48},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z1(z = 1 + 0 * j) annotation (
    Placement(visible = true, transformation(origin={-42,58},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={0,18},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Transformers.SinglePhase.Simplified simplified
    annotation (Placement(transformation(extent={{-22,-38},{-2,-18}})));
  SinglePhase.Components.Impedance     z2(z=1 + 0*j)     annotation (
    Placement(visible = true, transformation(origin={-50,-20},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground3 annotation (
    Placement(visible = true, transformation(origin={-72,-50},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Sources.VoltageSource     v1(
    theta(fixed=true, start=0),
    vArg={0},
    vMag={10})                                                                                     annotation (
    Placement(visible = true, transformation(origin={-72,-30},  extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Ground     ground4 annotation (
    Placement(visible = true, transformation(origin={4,-50},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Impedance     z3(z=10 + 5*j)     annotation (
    Placement(visible = true, transformation(origin={32,-20},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(v.pin_n, ground1.pin) annotation (
    Line(points={{-66,38},{-66,18}},       color = {117, 80, 123}));
  connect(v.pin_n, idealTransformer1.pinN_Prim) annotation (
    Line(points={{-66,38},{-44,38},{-44,38.2},{-20,38.2}},
                                          color = {117, 80, 123}));
  connect(z.pin_n, idealTransformer1.pinN_Sec) annotation (
    Line(points={{40,58},{46,58},{46,38.2},{0,38.2}},      color = {117, 80, 123}));
  connect(idealTransformer1.pinP_Sec, z.pin_p) annotation (
    Line(points={{0,58},{20,58}}));
  connect(z1.pin_n, idealTransformer1.pinP_Prim) annotation (
    Line(points={{-32,58},{-20,58}},      color = {117, 80, 123}));
  connect(v.pin_p, z1.pin_p) annotation (
    Line(points={{-66,58},{-52,58}}));
  connect(ground2.pin, idealTransformer1.pinN_Sec) annotation (
    Line(points={{0,18},{0,38.2}}));

  connect(z2.pin_n, simplified.pinP_prim) annotation (Line(points={{-40,-20},{
          -32,-20},{-32,-18},{-22,-18}}, color={117,80,123}));
  connect(v1.pin_p, z2.pin_p)
    annotation (Line(points={{-72,-20},{-60,-20}}, color={0,0,0}));
  connect(v1.pin_n, ground3.pin)
    annotation (Line(points={{-72,-40},{-72,-50}}, color={117,80,123}));
  connect(v1.pin_n, simplified.pinN_prim) annotation (Line(points={{-72,-40},{
          -48,-40},{-48,-38},{-22,-38}}, color={117,80,123}));
  connect(simplified.pinN_sec, ground4.pin)
    annotation (Line(points={{-2,-38},{4,-38},{4,-50}}, color={117,80,123}));
  connect(simplified.pinP_sec, z3.pin_p) annotation (Line(points={{-2,-18},{10,
          -18},{10,-20},{22,-20}}, color={0,0,0}));
  connect(z3.pin_n, simplified.pinN_sec) annotation (Line(points={{42,-20},{46,
          -20},{46,-24},{54,-24},{54,-38},{-2,-38}}, color={117,80,123}));
annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, grid = {0, 0})));
end SinglePhase_Transformer;
