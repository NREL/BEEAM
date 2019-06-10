within HPF.Example_HPF_Fuchs;

model Example
  import Modelica.ComplexMath.j;
  inner SystemDef systemDef(hrms = {1, 5})  annotation(
    Placement(visible = true, transformation(origin = {-70, 138}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Impedance z(z = 5 + 2 * j)  annotation(
    Placement(visible = true, transformation(origin = {-14, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));end Example;