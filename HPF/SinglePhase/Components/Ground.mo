within HPF.SinglePhase.Components;
model Ground
  /*
    Ground
    
    All the terminals connected to ground are at zero voltage potential.
  */
  outer SystemDef systemDef;
  // component properties
  HPF.Utilities.ComponentProperties properties(ComponentType = "Ground");
  HPF.SinglePhase.Interface.HPin_P pin(h = systemDef.numHrm) "Pin" annotation (
    Placement(visible = true, transformation(extent = {{90, -10}, {110, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  pin.v = {Complex(0.0) for i in 1:systemDef.numHrm};
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Line(origin = {0.0618545, -19.7266}, points = {{0, 10}, {0, -20}}, color = {117, 80, 123}, thickness = 0.5), Line(origin = {-21.5033, -39.9584}, rotation = -90, points = {{0, 50}, {0, -10}}, color = {117, 80, 123}, thickness = 0.5), Line(origin = {-10.0868, -50.0399}, rotation = -90, points = {{0, 30}, {0, -10}}, color = {117, 80, 123}, thickness = 0.5), Line(origin = {3.10315, -60.0197}, rotation = -90, points = {{0, 4}, {0, -10}}, color = {117, 80, 123}, thickness = 0.5),   Text(origin = {176, -100}, lineColor = {92, 53, 102}, extent = {{-150, 60}, {150, 100}}, textString = "%name",
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Left)}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Ground;
