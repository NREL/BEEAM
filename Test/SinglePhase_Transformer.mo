within HPF.Test;
model SinglePhase_Transformer
  HPF.SinglePhase.Components.IdealTransformer idealTransformer1 annotation (
    Placement(visible = true, transformation(origin={-38,90},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {1, 3})  annotation (
    Placement(visible = true, transformation(origin = {-104, 132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={-28,58},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z annotation (
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ground1.pin, idealTransformer1.pinN_Sec) annotation (
    Line(points={{-28,58},{-28,80.2}},                          color = {117, 80, 123}));
  connect(z.pin_p, idealTransformer1.pinP_Sec) annotation (
    Line(points={{-10,100},{-28,100}},                             color = {117, 80, 123}));
  connect(z.pin_n, idealTransformer1.pinN_Sec) annotation (
    Line(points={{10,100},{28,100},{28,80},{-28,80},{-28,80.2}},          color = {117, 80, 123}));

  connect(idealTransformer1.pinP_Prim, idealTransformer1.pinP_Sec) annotation (
      Line(points={{-48,100},{-62,100},{-62,110},{-28,110},{-28,100}}, color={
          28,108,200}));
annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end SinglePhase_Transformer;