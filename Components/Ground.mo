within HPF.Components;
model Ground
/*
  Ground
  
  All the terminals connected to ground are at zero voltage potential.
*/

  outer SystemDef systemDef;
equation
  /*
    From POOMS-Fritzson, "In a virtual connection subgraph without a Connctions.root definition, 
    one of the potential roots with the lowest priority number is selected as root".
    Make a potential root and then check if the given ground is
    the root.
    
    potentialRoot arguments: (referenceType, priority)
  */
  Connections.potentialRoot(pin.reference, 256);
  if Connections.isRoot(pin.reference) then
    pin.reference.theta = 0;
  end if;

  // setting voltage potential to zero (using predefined zeros vector from Solver.SystemDef)
  pin.v = {Complex(0.0) for i in 1:integer(systemDef.numHrm)};

annotation (
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={Line(origin = {-0.391061, -19.2737}, points = {{0, 10}, {0, -10}}, color = {117, 80, 123}, thickness = 0.5), Line(origin = {-25.8815, -29.3904}, rotation = -90, points = {{0, 60}, {0, -10}}, color = {117, 80, 123}, thickness = 0.5), Line(origin = {-11.3305, -39.4285}, rotation = -90, points = {{0, 32}, {0, -10}}, color = {117, 80, 123}, thickness = 0.5), Line(origin = {2.8012, -49.3007}, rotation = -90, points = {{0, 4}, {0, -10}}, color = {117, 80, 123}, thickness = 0.5), Text(origin = {71, -25}, extent = {{-41, -13}, {41, 13}}, textString = "%name"), Rectangle(origin = {0,2},fillColor = {117, 80, 123},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-10, 10}, {10, -10}})}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Ground;
