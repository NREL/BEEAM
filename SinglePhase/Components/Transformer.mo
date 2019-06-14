within HPF.SinglePhase.Components;

model Transformer
  extends HPF.SinglePhase.Interface.TwoPortBase;
  
equation
  
annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));

end Transformer;