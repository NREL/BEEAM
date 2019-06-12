within HPF.Test;

model SinglePhase_PowerFlow
  inner HPF.SystemDef systemDef annotation(
    Placement(visible = true, transformation(origin = {-82, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource voltageSource1 annotation(
    Placement(visible = true, transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation

annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Text(origin = {-74, 64}, extent = {{-20, 6}, {86, -14}}, textString = "Single Phase test:\nTesting power flow for single phase system", horizontalAlignment = TextAlignment.Left)}));
    
end SinglePhase_PowerFlow;