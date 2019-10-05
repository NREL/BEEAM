within HPF.Test;
model ReadDataFromFile

  HPF.Utilities.DataIO.loadHarmonicData loadHarmonicData1(argVariableName = "argV", fileName = "HPF/Input/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_A.mat", magVariableName = "magV")  annotation (
    Placement(visible = true, transformation(origin = {-38, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-46, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 5, T(displayUnit = "K"))  annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V = loadHarmonicData1.magDataMat[1, 1])  annotation (
    Placement(visible = true, transformation(origin = {-46, -18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(constantVoltage1.p, resistor1.p) annotation (
    Line(points = {{-46, -8}, {-46, 0}, {-10, 0}}, color = {0, 0, 255}));
  connect(constantVoltage1.n, ground1.p) annotation (
    Line(points = {{-46, -28}, {-46, -28}, {-46, -34}, {-46, -34}}, color = {0, 0, 255}));
  connect(constantVoltage1.n, resistor1.n) annotation (
    Line(points = {{-46, -28}, {10, -28}, {10, 0}}, color = {0, 0, 255}));

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0})));
end ReadDataFromFile;