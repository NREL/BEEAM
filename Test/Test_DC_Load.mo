within HPF.Test;

model Test_DC_Load
  HPF.DC.DC_Load dC_Load1(pwr = 1000)  annotation(
    Placement(visible = true, transformation(origin = {46, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V = 10)  annotation(
    Placement(visible = true, transformation(origin = {8, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {8, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(constantVoltage1.p, dC_Load1.p) annotation(
    Line(points = {{8, 30}, {46, 30}}, color = {0, 0, 255}));
  connect(dC_Load1.n, constantVoltage1.n) annotation(
    Line(points = {{46, 10}, {8, 10}}, color = {0, 0, 255}));
  connect(constantVoltage1.n, ground1.p) annotation(
    Line(points = {{8, 10}, {4, 10}, {4, -4}, {8, -4}}, color = {0, 0, 255}));

annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));end Test_DC_Load;