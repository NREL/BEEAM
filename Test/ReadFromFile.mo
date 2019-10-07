within HPF.Test;

model ReadFromFile
  HPF.SinglePhase.Sources.VoltageSrcLoadData v annotation(
    Placement(visible = true, transformation(origin = {-20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z(z = 2 + 3 * j)  annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(v.pin_p, z.pin_p) annotation(
    Line(points = {{-20, 20}, {0, 20}, {0, 20}, {0, 20}}));
  connect(v.pin_n, ground.pin) annotation(
    Line(points = {{-20, 0}, {-20, 0}, {-20, -10}, {-20, -10}}, color = {117, 80, 123}));
  connect(z.pin_n, ground.pin) annotation(
    Line(points = {{20, 20}, {34, 20}, {34, -10}, {-20, -10}, {-20, -10}, {-20, -10}}, color = {117, 80, 123}));
end ReadFromFile;