within HPF.Test;
model Test_ExternalDataRead
  Complex A1 = HPF.SinglePhase.NonlinearLoads.DataIO.readNodeVoltage("testLoad");
equation

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Test_ExternalDataRead;
