within HPF.SinglePhase.NonlinearLoads;

model LoadBase
  extends HPF.SinglePhase.Interface.TwoPinBase;
  
equation

annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));end LoadBase;