within HPF.Examples;
model TestSystem
  HPF.SinglePhase.Components.Impedance z annotation (
    Placement(visible = true, transformation(origin = {-36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1 annotation (
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.CurrentSource currentSource annotation (
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.CurrentSource currentSource1 annotation (
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-70, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef annotation (
    Placement(visible = true, transformation(origin = {-66, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData v annotation (
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(currentSource.pin_p, z.pin_n) annotation (
    Line(points = {{-10, -20}, {-10, 2.98024e-07}, {-26, 2.98024e-07}, {-26, 0}}));
  connect(currentSource1.pin_p, z1.pin_n) annotation (
    Line(points = {{70, -20}, {70, 0}, {30, 0}}));
  connect(z1.pin_p, currentSource.pin_p) annotation (
    Line(points = {{10, 0}, {-10, 0}, {-10, -20}}));
  connect(ground.pin, currentSource.pin_n) annotation (
    Line(points = {{-70, -56}, {-40, -56}, {-40, -56}, {-10, -56}, {-10, -40}, {-9, -40}, {-9, -40}, {-10, -40}}));
  connect(currentSource1.pin_n, currentSource.pin_n) annotation (
    Line(points = {{70, -40}, {70, -40}, {70, -40}, {70, -40}, {70, -56}, {-10, -56}, {-10, -40}, {-10, -40}, {-10, -40}, {-10, -40}, {-10, -40}}, color = {117, 80, 123}));
  connect(v.pin_p, z.pin_p) annotation (
    Line(points = {{-70, -20}, {-70, -20}, {-70, 0}, {-46, 0}, {-46, 0}, {-46, 0}}));
  connect(v.pin_n, ground.pin) annotation (
    Line(points = {{-70, -40}, {-70, -40}, {-70, -56}, {-70, -56}}, color = {117, 80, 123}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Ellipse(origin = {-64, 46}, lineColor = {239, 41, 41}, pattern = LinePattern.Dash, extent = {{-22, 22}, {22, -22}}, endAngle = 360), Line(origin = {-32.8121, 70.4241}, points = {{12.8121, 7.81212}, {-13.1879, -8.18788}, {-9.18788, -4.18788}, {-7.18788, -6.18788}, {-13.1879, -8.18788}}), Line(origin = {-15.568, 13.7312}, points = {{12.8121, 7.81212}, {-13.1879, -8.18788}, {-9.18788, -4.18788}, {-7.18788, -6.18788}, {-13.1879, -8.18788}})}));
end TestSystem;
