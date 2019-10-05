within HPF.Examples;

model TestSystem
  HPF.SinglePhase.Sources.VoltageSource v annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1 annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.CurrentSource currentSource annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.CurrentSource currentSource1 annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-70, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef annotation(
    Placement(visible = true, transformation(origin = {-68, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(currentSource.pin_p, z.pin_n) annotation(
    Line(points = {{-10, -20}, {-10, -20}, {-10, 2.98024e-07}, {-30, 2.98024e-07}, {-30, -1}, {-30, -1}, {-30, 2.98024e-07}}));
  connect(z.pin_p, v.pin_p) annotation(
    Line(points = {{-50, 0}, {-70, 0}, {-70, -20}}));
  connect(currentSource1.pin_p, z1.pin_n) annotation(
    Line(points = {{70, -20}, {70, -20}, {70, -20}, {70, -20}, {70, 0}, {50, 0}, {50, 0}, {50, 0}, {50, 0}, {50, 0}}));
  connect(z1.pin_p, currentSource.pin_p) annotation(
    Line(points = {{30, 0}, {-10, 0}, {-10, -20}, {-10, -20}, {-10, -20}, {-10, -20}, {-10, -20}}));
  connect(v.pin_n, ground.pin) annotation(
    Line(points = {{-70, -40}, {-69, -40}, {-69, -40}, {-70, -40}, {-70, -56}, {-70, -56}, {-70, -56}, {-70, -56}}, color = {117, 80, 123}));
  connect(ground.pin, currentSource.pin_n) annotation(
    Line(points = {{-70, -56}, {-40, -56}, {-40, -56}, {-10, -56}, {-10, -40}, {-9, -40}, {-9, -40}, {-10, -40}}));
  connect(currentSource1.pin_n, currentSource.pin_n) annotation(
    Line(points = {{70, -40}, {70, -40}, {70, -40}, {70, -40}, {70, -56}, {-10, -56}, {-10, -40}, {-10, -40}, {-10, -40}, {-10, -40}, {-10, -40}}, color = {117, 80, 123}));

annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0})));end TestSystem;