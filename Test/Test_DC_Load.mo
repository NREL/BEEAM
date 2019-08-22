within HPF.Test;
model Test_DC_Load
  HPF.DC.DC_Load dC_Load1(pwr = 1000)  annotation (
    Placement(visible = true, transformation(origin = {14, 14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V = 10)  annotation (
    Placement(visible = true, transformation(origin = {-24, 14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-24, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(constantVoltage1.p, dC_Load1.p) annotation(
    Line(points = {{-24, 24}, {14, 24}}, color = {0, 0, 255}));
  connect(dC_Load1.n, constantVoltage1.n) annotation(
    Line(points = {{14, 4}, {-24, 4}}, color = {0, 0, 255}));
  connect(constantVoltage1.n, ground1.p) annotation(
    Line(points = {{-24, 4}, {-27, 4}, {-27, 4}, {-28, 4}, {-28, -10}, {-27, -10}, {-27, -10}, {-24, -10}}, color = {0, 0, 255}));

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0})));
end Test_DC_Load;