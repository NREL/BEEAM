within HPF.Test;

model Test_Rectifier
  inner HPF.SystemDef systemDef annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier rectifier1 annotation(
    Placement(visible = true, transformation(origin = {30,10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0})));end Test_Rectifier;