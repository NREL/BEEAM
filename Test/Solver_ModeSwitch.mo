within HPF.Test;
model Solver_ModeSwitch
  inner HPF.SystemDef systemDef annotation (
    Placement(visible = true, transformation(origin = {-42, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Test_components.event_check event_check1 annotation (
    Placement(visible = true, transformation(origin = {-16, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0})));
end Solver_ModeSwitch;
